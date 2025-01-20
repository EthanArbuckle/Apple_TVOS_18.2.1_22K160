uint64_t sub_7D1A4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t (*v10)(unint64_t);
  v2 = v0[7];
  v1 = v0[8];
  v4 = v0[5];
  v3 = v0[6];
  v6 = v0[3];
  v5 = v0[4];
  sub_1BCD8();
  sub_49158(v1);
  sub_49158(v1 + *(int *)(v2 + 20));
  sub_6C7E4(v1, v6, v5, v4, v3);
  sub_7C5D8();
  v0[9] = v7;
  v8 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[10] = v8;
  sub_380D4(v8, (uint64_t)sub_7D25C);
  sub_3814C();
  v9 = sub_3813C(21LL);
  return v10(v9);
}

uint64_t sub_7D25C()
{
  *(void *)(v2 + 88) = v1;
  swift_task_dealloc();
  sub_1BC04();
  if (!v1) {
    *(void *)(v2 + 96) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_7D2B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 48);
  sub_38060(a1, type metadata accessor for ResumeTimerPromptAllParameters);
  sub_1BC04();
  swift_bridgeObjectRelease(v2);
  sub_1BABC();
  return sub_2FB20(*(void *)(v1 + 96), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_7D308(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 48);
  sub_38060(a1, type metadata accessor for ResumeTimerPromptAllParameters);
  sub_1BC04();
  swift_bridgeObjectRelease(v2);
  sub_1BABC();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_7D364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = sub_67C4(&qword_FBD98);
  v6[8] = sub_37EE0(v7);
  uint64_t v8 = type metadata accessor for ResumeTimerPromptExistingTimerParameters(0LL);
  v6[9] = v8;
  v6[10] = sub_37EE0(v8);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_7D3C0()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v16 = v0[6];
  uint64_t v5 = v0[4];
  sub_1BCD8();
  sub_49158(v1);
  uint64_t v6 = v1 + *(int *)(v2 + 20);
  sub_49158(v6);
  uint64_t v7 = *(int *)(v2 + 24);
  *(void *)(v1 + v7) = 0LL;
  sub_7DF00();
  *(void *)(v1 + v7) = v8;
  swift_bridgeObjectRetain(v4);
  SpeakableString.init(serializedValue:)(v5, v4);
  uint64_t v9 = sub_5BDAC();
  sub_1B4F4(v9, v6);
  sub_2BC5C();
  SpeakableString.init(serializedValue:)(v16, v3);
  uint64_t v10 = sub_5BDAC();
  sub_1B4F4(v10, v1);
  sub_7C718();
  v0[11] = v11;
  v12 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[12] = v12;
  sub_380D4(v12, (uint64_t)sub_7D4CC);
  sub_3814C();
  unint64_t v13 = sub_3813C(31LL);
  return v14(v13);
}

uint64_t sub_7D4CC()
{
  *(void *)(v2 + 104) = v1;
  swift_task_dealloc();
  sub_1BC04();
  if (!v1) {
    *(void *)(v2 + 112) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_7D524()
{
  swift_bridgeObjectRelease(v1);
  sub_1BC04();
  sub_1BABC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 112));
}

uint64_t sub_7D590()
{
  swift_bridgeObjectRelease(v1);
  sub_1BC04();
  sub_1BABC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_7D5F8()
{
  return type metadata accessor for ResumeTimerCATPatternsExecutor(0LL);
}

uint64_t sub_7D600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7D60C);
}

void sub_7D60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_17B78();
  }

  else
  {
    uint64_t v6 = sub_67C4(&qword_FBD98);
    sub_17EA4(a1 + *(int *)(a3 + 24), a2, v6);
  }

uint64_t sub_7D674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7D680);
}

void sub_7D680()
{
  if (v3 == 0x7FFFFFFF)
  {
    *(void *)(v1 + 8) = (v0 - 1);
    sub_17B78();
  }

  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_67C4(&qword_FBD98);
    sub_17EB0(v1 + *(int *)(v4 + 24), v0, v0, v5);
  }

uint64_t type metadata accessor for ResumeTimerHandledOnWatchParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_FF1F0, (uint64_t)&nominal type descriptor for ResumeTimerHandledOnWatchParameters);
}

void sub_7D6F0(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_367C0(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

uint64_t type metadata accessor for ResumeTimerPromptAllParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_FF3D8, (uint64_t)&nominal type descriptor for ResumeTimerPromptAllParameters);
}

uint64_t type metadata accessor for ResumeTimerPromptExistingTimerParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_FF340, (uint64_t)&nominal type descriptor for ResumeTimerPromptExistingTimerParameters);
}

uint64_t type metadata accessor for ResumeTimerAlreadyRunningAllParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_FF2B0, (uint64_t)&nominal type descriptor for ResumeTimerAlreadyRunningAllParameters);
}

uint64_t *sub_7D7AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(sub_67C4(&qword_FBD98) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v6 = type metadata accessor for SpeakableString(0LL);
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6))
    {
      memcpy(a1, a2, *(void *)(v4 + 64));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
    }
  }

  return a1;
}

uint64_t sub_7D870(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpeakableString(0LL);
  uint64_t result = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1, 1LL, v2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  }
  return result;
}

void *sub_7D8C8(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v4))
  {
    uint64_t v5 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v4);
  }

  return a1;
}

void *sub_7D964(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  int v5 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a1, 1LL, v4);
  int v6 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v4);
  if (!v5)
  {
    uint64_t v7 = *(void *)(v4 - 8);
    if (!v6)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 24))(a1, a2, v4);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v4);
    goto LABEL_6;
  }

  if (v6)
  {
LABEL_6:
    uint64_t v8 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v4);
  return a1;
}

void *sub_7DA48(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v4))
  {
    uint64_t v5 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v4);
  }

  return a1;
}

void *sub_7DAE4(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  int v5 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a1, 1LL, v4);
  int v6 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v4);
  if (!v5)
  {
    uint64_t v7 = *(void *)(v4 - 8);
    if (!v6)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 40))(a1, a2, v4);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v4);
    goto LABEL_6;
  }

  if (v6)
  {
LABEL_6:
    uint64_t v8 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v4);
  return a1;
}

uint64_t sub_7DBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7DBD4);
}

uint64_t sub_7DBD4()
{
  uint64_t v2 = sub_67C4(&qword_FBD98);
  return sub_7DEC0(v1, v0, v2);
}

uint64_t sub_7DC04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7DC10);
}

uint64_t sub_7DC10()
{
  uint64_t v0 = sub_491B8();
  return sub_17D28(v0, v1, v2, v3);
}

void sub_7DC38(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
  }

uint64_t sub_7DCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7DCAC);
}

void sub_7DCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FBD98);
  if (*(_DWORD *)(*(void *)(v4 - 8) + 84LL) == (_DWORD)a2) {
    sub_17EA4(a1, a2, v4);
  }
  else {
    sub_17B78();
  }
}

uint64_t sub_7DD24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7DD30);
}

void sub_7DD30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(_DWORD *)(*(void *)(sub_67C4(&qword_FBD98) - 8) + 84LL) == a3)
  {
    uint64_t v8 = sub_491B8();
    sub_17EB0(v8, v9, v10, v11);
  }

  else
  {
    *(void *)(v5 + *(int *)(a4 + 24)) = v4;
    sub_17B78();
  }

void sub_7DD88(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = v4[0];
    v4[2] = "\b";
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

uint64_t sub_7DDFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7DE08);
}

uint64_t sub_7DE08()
{
  uint64_t v2 = sub_67C4(&qword_FBD98);
  return sub_7DEC0(v1, v0, v2);
}

uint64_t sub_7DE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7DE44);
}

uint64_t sub_7DE44()
{
  uint64_t v0 = sub_491B8();
  return sub_17D28(v0, v1, v2, v3);
}

uint64_t sub_7DE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_7DE78(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = 0x72656D6974LL;
  a1[2].n128_u64[1] = 0xE500000000000000LL;
  return 0LL;
}

uint64_t sub_7DE98()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1, 1LL, 1LL, v0);
}

uint64_t sub_7DEAC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 32LL))(a1, v1, v2);
}

uint64_t sub_7DEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1, a2, a3);
}

uint64_t sub_7DEC8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *v3;
  *(void *)(v4 + 56) = v2;
  return swift_task_dealloc(a1);
}

  ;
}

  ;
}

void sub_7DF00()
{
}

ValueMetadata *type metadata accessor for TimerNLv4Constants()
{
  return &type metadata for TimerNLv4Constants;
}

uint64_t getEnumTagSinglePayload for TimerNLv4Constants.TimerVerb(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xEE)
  {
    if (a2 + 18 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 18) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 19;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for TimerNLv4Constants.TimerVerb( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xED) {
    return ((uint64_t (*)(void))((char *)&loc_7DFF0 + 4 * byte_C4805[v4]))();
  }
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_7E024 + 4 * asc_C4800[v4]))();
}

uint64_t sub_7E024(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_7E02C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x7E034LL);
  }
  return result;
}

uint64_t sub_7E040(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x7E048LL);
  }
  *(_BYTE *)uint64_t result = a2 + 18;
  return result;
}

uint64_t sub_7E04C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_7E054(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TimerNLv4Constants.TimerVerb()
{
  return &type metadata for TimerNLv4Constants.TimerVerb;
}

unint64_t sub_7E074()
{
  unint64_t result = qword_FF410;
  if (!qword_FF410)
  {
    uint64_t v1 = sub_15D30(&qword_FF418);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_FF410);
  }

  return result;
}

void sub_7E0B8(uint64_t a1)
{
}

void sub_7E0C4(uint64_t a1)
{
}

void sub_7E0D0(uint64_t a1)
{
  uint64_t v1 = sub_18290(a1);
  sub_7E3AC((uint64_t)v1);
  sub_18104();
  sub_17E1C();
}

void sub_7E0F4(uint64_t a1)
{
}

void sub_7E100(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = a2(a1);
  sub_7E394(v4, v5, v6);
  sub_2B7C4();
  sub_18104();
  sub_17E1C();
}

uint64_t sub_7E138(uint64_t a1, uint64_t a2)
{
  return sub_7E15C(a1, a2, (uint64_t (*)(uint64_t))sub_64F1C);
}

uint64_t sub_7E144(uint64_t a1, uint64_t a2)
{
  return sub_7E15C(a1, a2, (uint64_t (*)(uint64_t))sub_69738);
}

uint64_t sub_7E150(uint64_t a1, uint64_t a2)
{
  return sub_7E15C(a1, a2, (uint64_t (*)(uint64_t))sub_9772C);
}

uint64_t sub_7E15C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = a3(a2);
  uint64_t v6 = v5;
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_7E19C(uint64_t a1)
{
  return String.hash(into:)(a1, 0x7065656C73LL, 0xE500000000000000LL);
}

void sub_7E1B0(uint64_t a1)
{
  uint64_t v1 = Hasher.init(_seed:)(v2, a1);
  sub_7E3AC((uint64_t)v1);
  sub_18104();
  sub_17E1C();
}

void sub_7E1D8(uint64_t a1, uint64_t a2)
{
}

void sub_7E1E4(uint64_t a1, uint64_t a2)
{
}

void sub_7E1F0(uint64_t a1, uint64_t a2)
{
}

void sub_7E1FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = a3(a2);
  sub_7E394(v5, v6, v7);
  sub_2B7C4();
  sub_18104();
  sub_17E1C();
}

uint64_t sub_7E238(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_F2D20, a1, a2, &unk_FB420);
  sub_2B7C4();
  if (v2 >= 0x13) {
    return 19LL;
  }
  else {
    return v2;
  }
}

void sub_7E284(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_7E290()
{
}

uint64_t sub_7E2B0(uint64_t a1)
{
  return sub_7E15C(a1, *v1, (uint64_t (*)(uint64_t))sub_7010);
}

void sub_7E2D0(uint64_t a1)
{
}

uint64_t sub_7E2F0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_7E238(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_7E31C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_7010(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_7E344(void *a1@<X8>)
{
  *a1 = &off_F3280;
}

unint64_t sub_7E358()
{
  unint64_t result = qword_FF420;
  if (!qword_FF420)
  {
    unint64_t result = swift_getWitnessTable(&unk_C48E0, &type metadata for TimerNLv4Constants.TimerVerb);
    atomic_store(result, (unint64_t *)&qword_FF420);
  }

  return result;
}

uint64_t sub_7E394(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  return String.hash(into:)(va, a1, a2);
}

uint64_t sub_7E3AC(uint64_t a1, ...)
{
  return String.hash(into:)(va, 0x7065656C73LL, 0xE500000000000000LL);
}

uint64_t sub_7E3C4(uint64_t a1)
{
  return sub_7E3EC(a1, (void (*)(void))type metadata accessor for DismissTimerCATs_Async, &qword_1010F0);
}

uint64_t sub_7E3D8(uint64_t a1)
{
  return sub_7E3EC( a1,  (void (*)(void))type metadata accessor for DismissTimerCATPatternsExecutor,  &qword_1010F8);
}

uint64_t sub_7E3EC(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2(0LL);
  static CATOption.defaultMode.getter();
  uint64_t result = CATWrapper.__allocating_init(options:globals:)(v6, 0LL);
  *a3 = result;
  return result;
}

uint64_t sub_7E470()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF428);
  sub_5474(v0, (uint64_t)qword_FF428);
  return static SiriTimeLog.timerFlow.getter();
}

void sub_7E4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TemplatingText(0LL);
  uint64_t v46 = *(void *)(v6 - 8);
  uint64_t v47 = v6;
  __chkstk_darwin(v6);
  sub_17D14();
  uint64_t v45 = v7;
  uint64_t v8 = sub_67C4(&qword_FDDF8);
  __chkstk_darwin(v8);
  sub_17D14();
  uint64_t v48 = v9;
  uint64_t v10 = type metadata accessor for TemplatingResult(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_FB280 != -1) {
    swift_once(&qword_FB280, sub_7E470);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  sub_5474(v14, (uint64_t)qword_FF428);
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = sub_1BA1C(12LL);
    uint64_t v43 = a1;
    v19 = (uint8_t *)v18;
    uint64_t v20 = sub_1BA1C(32LL);
    uint64_t v44 = a3;
    uint64_t v21 = v20;
    v50[0] = v20;
    v42[1] = a2;
    *(_DWORD *)v19 = 136315138;
    uint64_t v22 = TemplatingResult.templateIdentifier.getter();
    uint64_t v49 = sub_683C(v22, v23, v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v19 + 4, v19 + 12);
    sub_18034();
    sub_7F4F8();
    _os_log_impl(&dword_0, v16, v17, "logTimerSnippetAndDialog called for intent: %s", v19, 0xCu);
    swift_arrayDestroy(v21, 1LL);
    sub_1B904(v21);
    uint64_t v24 = (uint64_t)v19;
    a1 = v43;
    sub_1B904(v24);
  }

  else
  {
    sub_7F4F8();
  }

  uint64_t v25 = TemplatingResult.sections.getter();
  uint64_t v26 = v48;
  sub_8EF80(v25, v48);
  swift_bridgeObjectRelease(v25);
  uint64_t v27 = type metadata accessor for TemplatingSection(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v26, 1LL, v27) == 1)
  {
    sub_5EDE4(v26);
    uint64_t v28 = 0x80000000000C91D0LL;
    uint64_t v29 = 0xD000000000000013LL;
  }

  else
  {
    uint64_t v30 = v45;
    TemplatingSection.content.getter();
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8LL))(v26, v27);
    uint64_t v29 = TemplatingText.text.getter(v31);
    uint64_t v28 = v32;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v30, v47);
  }

  v33 = (void *)sub_7ECB4(a1, v29, v28);
  sub_18034();
  uint64_t v34 = sub_67C4(&qword_FBF70);
  uint64_t inited = swift_initStackObject(v34, v52);
  *(_OWORD *)(inited + 16) = xmmword_C2640;
  strcpy((char *)(inited + 32), "ClientFlowView");
  *(_BYTE *)(inited + 47) = -18;
  id v36 = [v33 dictionary];
  if (v36)
  {
    uint64_t v37 = (uint64_t)v36;
    uint64_t v51 = sub_33CEC(0LL, &qword_FF4F0, &OBJC_CLASS___NSMutableDictionary_ptr);
    v50[0] = v37;
    sub_D368(v50, (_OWORD *)(inited + 48));
  }

  else
  {
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 7104878LL;
    *(void *)(inited + 56) = 0xE300000000000000LL;
  }

  uint64_t v38 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String);
  id v39 = [(id)objc_opt_self(AFAnalytics) sharedAnalytics];
  if (v39)
  {
    v40 = v39;
    uint64_t v41 = sub_7E8F4(v38);
    sub_18034();
    sub_7F470(3700LL, v41, v40);
  }

  else
  {

    sub_18034();
  }

uint64_t sub_7E8F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_67C4(&qword_FF4F8);
    int v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    int v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain();
  int64_t v9 = 0LL;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v11 = v10 | (v9 << 6);
  while (1)
  {
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_6A5C(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v41);
    *(void *)&__int128 v40 = v18;
    *((void *)&v40 + 1) = v17;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v18;
    *((void *)&v38[0] + 1) = v17;
    swift_bridgeObjectRetain(v17);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_D368(v39, v33);
    __int128 v34 = v30;
    __int128 v35 = v31;
    uint64_t v36 = v32;
    sub_D368(v33, v37);
    __int128 v30 = v34;
    __int128 v31 = v35;
    uint64_t v32 = v36;
    sub_D368(v37, v38);
    sub_D368(v38, &v34);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v19 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)&v7[8 * (v20 >> 6)]) == 0)
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0LL;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v7[8 * v21];
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_34;
        }
      }

      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    unint64_t v22 = __clz(__rbit64((-1LL << v20) & ~*(void *)&v7[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_34:
    *(void *)&v7[(v22 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v22;
    uint64_t v27 = v3[6] + 40 * v22;
    *(_OWORD *)uint64_t v27 = v30;
    *(_OWORD *)(v27 + 16) = v31;
    *(void *)(v27 + 32) = v32;
    uint64_t result = (uint64_t)sub_D368(&v34, (_OWORD *)(v3[7] + 32 * v22));
    ++v3[2];
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      goto LABEL_38;
    }
    if (v12 >= v28) {
      goto LABEL_36;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v12);
    int64_t v14 = v9 + 1;
    if (!v13)
    {
      int64_t v14 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_36;
      }
      unint64_t v13 = *(void *)(v29 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_36;
        }
        unint64_t v13 = *(void *)(v29 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_36;
          }
          unint64_t v13 = *(void *)(v29 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }

LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_7ECB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sub_7F508(objc_allocWithZone(&OBJC_CLASS___SAUIAddViews));
  id v7 = sub_7F508(objc_allocWithZone(&OBJC_CLASS___SADialog));
  id v8 = sub_7F508(objc_allocWithZone(&OBJC_CLASS___SADialogText));
  sub_7F280(a2, a3, v8);
  [v7 setContent:v8];
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v64 = a1;
    }
    else {
      uint64_t v64 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_17C9C();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v64);
  }

  else
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    sub_17C9C();
  }

  if (!v9)
  {
    sub_18034();
    goto LABEL_10;
  }

  unint64_t v10 = a1 & 0xC000000000000001LL;
  sub_8EEB4(0LL, (a1 & 0xC000000000000001LL) == 0, a1);
  if ((a1 & 0xC000000000000001LL) != 0) {
    id v11 = (id)sub_7F510();
  }
  else {
    id v11 = *(id *)(a1 + 32);
  }
  int64_t v12 = v11;
  sub_18034();
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___SATimerSnippet);
  uint64_t v14 = swift_dynamicCastObjCClass(v12, v13);
  if (!v14)
  {

    sub_8EEB4(0LL, v10 == 0, a1);
    if (v10)
    {
      sub_17C9C();
      id v28 = (id)sub_7F510();
      sub_18034();
    }

    else
    {
      id v28 = *(id *)(a1 + 32);
    }

    uint64_t v53 = objc_opt_self(&OBJC_CLASS___SATimerShowTimerAndPerformAction);
    id v27 = (id)swift_dynamicCastObjCClass(v28, v53);
    if (v27)
    {
LABEL_35:
      id v54 = v27;
      [v27 setDialog:v7];
      uint64_t v55 = sub_67C4(&qword_FBE58);
      uint64_t v56 = sub_1E854(v55);
      *(_OWORD *)(v56 + 16) = xmmword_C2690;
      *(void *)(v56 + 32) = v54;
      uint64_t v80 = v56;
      sub_7F51C(v56, v57, v58, v59, v60, v61, v62, v63);
      sub_7F400(v80, v6, &qword_FC6A8, &OBJC_CLASS___SAAceView_ptr, (SEL *)&selRef_setViews_);
LABEL_49:
      uint64_t v75 = DialogPhase.aceValue.getter();
      sub_7F2E0(v75, v76, v6);

      return (uint64_t)v6;
    }

LABEL_10:
    if (qword_FB280 != -1) {
      swift_once(&qword_FB280, sub_7E470);
    }
    uint64_t v22 = type metadata accessor for Logger(0LL);
    uint64_t v23 = sub_5474(v22, (uint64_t)qword_FF428);
    unint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)sub_1BA1C(2LL);
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, v24, v25, "Snippet did not contain a timer snippet. Only logging dialog.", v26, 2u);
      sub_1B904((uint64_t)v26);
    }

    id v27 = [objc_allocWithZone(SATimerSnippet) init];
    goto LABEL_35;
  }

  int64_t v15 = (void *)v14;
  id v16 = [objc_allocWithZone(SATimerSnippet) init];
  [v16 setDialog:v7];
  id v17 = v16;
  id v18 = v12;
  sub_7F32C(v15, (SEL *)&selRef_title);
  if (v19)
  {
    uint64_t v20 = v19;
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
  }

  else
  {
    NSString v21 = 0LL;
  }

  [v17 setTitle:v21];

  id v29 = v17;
  id v30 = v18;
  sub_7F32C(v15, (SEL *)&selRef_speakableText);
  if (v31)
  {
    uint64_t v32 = v31;
    NSString v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v32);
  }

  else
  {
    NSString v33 = 0LL;
  }

  [v29 setSpeakableText:v33];

  uint64_t v34 = sub_7F394(v15);
  if (!v34) {
    goto LABEL_48;
  }
  uint64_t v35 = v34;
  id v79 = v8;
  if (!((unint64_t)v34 >> 62))
  {
    uint64_t v36 = *(void *)((char *)&dword_10 + (v34 & 0xFFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain(v34);
    if (v36) {
      goto LABEL_24;
    }
LABEL_46:
    sub_2BE5C();
LABEL_47:
    sub_2BE5C();
    sub_7F400( (uint64_t)_swiftEmptyArrayStorage,  v29,  &qword_FF4E8,  &OBJC_CLASS___SATimerObject_ptr,  (SEL *)&selRef_setTimers_);
    id v8 = v79;
LABEL_48:
    uint64_t v66 = sub_67C4(&qword_FBE58);
    uint64_t v67 = sub_1E854(v66);
    *(_OWORD *)(v67 + 16) = xmmword_C2690;
    *(void *)(v67 + 32) = v29;
    uint64_t v81 = v67;
    sub_7F51C(v67, v68, v69, v70, v71, v72, v73, v74);
    sub_7F400(v81, v6, &qword_FC6A8, &OBJC_CLASS___SAAceView_ptr, (SEL *)&selRef_setViews_);

    goto LABEL_49;
  }

  if (v34 >= 0) {
    uint64_t v65 = v34 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v65 = v34;
  }
  swift_bridgeObjectRetain(v34);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v65);
  uint64_t v36 = result;
  if (!result) {
    goto LABEL_46;
  }
LABEL_24:
  id v77 = v29;
  id v78 = v7;
  if (v36 >= 1)
  {
    for (uint64_t i = 0LL; i != v36; ++i)
    {
      if ((v35 & 0xC000000000000001LL) != 0) {
        id v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v35);
      }
      else {
        id v39 = *(id *)(v35 + 8 * i + 32);
      }
      __int128 v40 = v39;
      id v41 = [objc_allocWithZone(SATimerObject) init];
      id v42 = [v40 timerValue];
      [v41 setTimerValue:v42];

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v44 = *(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v43 = *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      if (v44 >= v43 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v43 > 1, v44 + 1, 1LL);
      }
      uint64_t v45 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v44, v41);
      sub_7F51C(v45, v46, v47, v48, v49, v50, v51, v52);
    }

    sub_2BE5C();
    id v7 = v78;
    id v29 = v77;
    goto LABEL_47;
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for TimerAnalyticsServiceImpl()
{
  return objc_opt_self(&OBJC_CLASS____TtC23TimerFlowDelegatePlugin25TimerAnalyticsServiceImpl);
}

void sub_7F280(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = String._bridgeToObjectiveC()();
  [a3 setText:v4];
}

void sub_7F2C4(uint64_t a1, void *a2)
{
}

void sub_7F2E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = String._bridgeToObjectiveC()();
  sub_18034();
  [a3 setDialogPhase:v4];
}

uint64_t sub_7F32C(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);

  return v4;
}

uint64_t sub_7F394(void *a1)
{
  id v1 = [a1 timers];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_33CEC(0LL, &qword_FF4E8, &OBJC_CLASS___SATimerObject_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

void sub_7F400(uint64_t a1, void *a2, unint64_t *a3, void *a4, SEL *a5)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  objc_msgSend(a2, *a5, isa);
}

void sub_7F470(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a2);
  [a3 logEventWithType:a1 context:isa];
}

uint64_t sub_7F4F0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_7F4F8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

id sub_7F508(void *a1)
{
  return [a1 *(SEL *)(v1 + 1064)];
}

uint64_t sub_7F510()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v0);
}

uint64_t sub_7F51C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return specialized Array._endMutation()(a1, a2, a3, a4, a5, a6, a7, a8);
}

ValueMetadata *_s24UnsupportedValueStrategyVMa()
{
  return &_s24UnsupportedValueStrategyVN;
}

uint64_t sub_7F534()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF500);
  sub_5474(v0, (uint64_t)qword_FF500);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_7F57C(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  uint64_t v4 = type metadata accessor for CATOption(0LL);
  v3[9] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v3[10] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[11] = v6;
  v3[12] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[13] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[14] = v8;
  v3[15] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[16] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[17] = v10;
  v3[18] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_67C4(&qword_FF538);
  v3[19] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[20] = v12;
  unint64_t v13 = (*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[21] = swift_task_alloc(v13);
  v3[22] = swift_task_alloc(v13);
  uint64_t v14 = type metadata accessor for NLContextUpdate(0LL);
  v3[23] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[24] = v15;
  v3[25] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DialogPhase(0LL);
  v3[26] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v3[27] = v17;
  unint64_t v18 = (*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[28] = swift_task_alloc(v18);
  v3[29] = swift_task_alloc(v18);
  v3[30] = swift_task_alloc(v18);
  return swift_task_switch(sub_7F6F8, 0LL, 0LL);
}

uint64_t sub_7F6F8()
{
  uint64_t v1 = (void *)ParameterResolutionRecord.result.getter(v0[19]);
  uint64_t v2 = (SEL *)&unk_FA000;
  [v1 unsupportedReason];

  uint64_t v4 = static DialogPhase.completion.getter(v3);
  NLContextUpdate.init()(v4);
  if (qword_FB288 != -1) {
    swift_once(&qword_FB288, sub_7F534);
  }
  uint64_t v5 = v0[22];
  uint64_t v7 = v0[19];
  uint64_t v6 = v0[20];
  uint64_t v8 = v0[7];
  uint64_t v9 = sub_5474(v0[10], (uint64_t)qword_FF500);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  uint64_t v11 = v10(v5, v8, v7);
  uint64_t v50 = v9;
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = v0[22];
  if (v14)
  {
    uint64_t v16 = v0[21];
    uint64_t v49 = v0[20];
    uint64_t v17 = v0[19];
    unint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    uint64_t v51 = v19;
    *(_DWORD *)unint64_t v18 = 136315138;
    v10(v16, v15, v17);
    uint64_t v20 = String.init<A>(describing:)();
    unint64_t v22 = v21;
    v0[5] = sub_683C(v20, v21, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 5, v0 + 6, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease(v22);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v15, v17);
    _os_log_impl( &dword_0,  v12,  v13,  "[SetTimerAttribute.UnsupportedValueStrategy.makeUnsupportedValueOutput] Called with resolveRecord: %s",  v18,  0xCu);
    swift_arrayDestroy(v19, 1LL);
    sub_1B904(v19);
    uint64_t v23 = (uint64_t)v18;
    uint64_t v2 = (SEL *)&unk_FA000;
    sub_1B904(v23);
  }

  else
  {
    (*(void (**)(void, void))(v0[20] + 8LL))(v0[22], v0[19]);
  }

  uint64_t v24 = v0[19];
  uint64_t v25 = v0[15];
  uint64_t v26 = v0[12];
  uint64_t v27 = v0[10];
  uint64_t v28 = v0[11];
  (*(void (**)(uint64_t, void, void))(v0[14] + 104LL))( v25,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[13]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v50, v27);
  uint64_t v29 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v25, v26, v29);
  id v30 = (void *)ParameterResolutionRecord.result.getter(v24);
  uint64_t v31 = (char *)[v30 v2[180]];

  if (v31 == (_BYTE *)&dword_4 + 3)
  {
    uint64_t v33 = v0[30];
    uint64_t v34 = v0[26];
    uint64_t v35 = v0[27];
    uint64_t v36 = v0[9];
    uint64_t v37 = v0[7];
    static DialogPhase.error.getter(v32);
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v0[31] = v38;
    v38(v33, v34);
    sub_807F4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 32));
    type metadata accessor for TimerBaseCATPatternsExecutor(0LL);
    static CATOption.defaultMode.getter();
    v0[32] = CATWrapper.__allocating_init(options:globals:)(v36, 0LL);
    uint64_t v39 = swift_task_alloc(32LL);
    v0[33] = v39;
    *(void *)(v39 + 16) = v37;
    __int128 v40 = (void *)swift_task_alloc(dword_10056C);
    v0[34] = v40;
    void *v40 = v0;
    v40[1] = sub_7FA70;
    sub_2B904();
    return sub_ACBBC(v41, v42);
  }

  else
  {
    unint64_t v44 = (void *)swift_task_alloc(dword_FF554);
    v0[36] = v44;
    *unint64_t v44 = v0;
    v44[1] = sub_7FB38;
    sub_2B904();
    return sub_7FEC4(v45, v46, v47, v48);
  }

uint64_t sub_7FA70(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[35] = v1;
  swift_task_dealloc();
  swift_release();
  sub_1BA24();
  if (v1)
  {
    sub_1B9B8();
    return swift_task_switch(v5, v6, v7);
  }

  else
  {
    v4[38] = v4[31];
    v4[39] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v4[40] = v9;
    *uint64_t v9 = v4;
    v9[1] = sub_7FC10;
    return sub_1BB20();
  }

uint64_t sub_7FB38(uint64_t a1)
{
  *(void *)(v2 + 296) = v1;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_7FB84()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = *(void (**)(void, void))(v1 + 8);
  v2(v0[30], v0[26]);
  sub_807F4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32));
  uint64_t v3 = v0[3];
  v0[38] = v2;
  v0[39] = v3;
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  v0[40] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_7FC10;
  return sub_1BB20();
}

uint64_t sub_7FC10()
{
  *(void *)(v1 + 328) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

void sub_7FC5C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v19 = *(void *)(v0 + 232);
  uint64_t v20 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v9 = *(void *)(v0 + 128);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  sub_1B86C();
  uint64_t v10 = swift_task_dealloc();
  sub_1B910(v10, v11, v12, v13, v14, v15, v16, v17, v19, v20);
  sub_1B838();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1BABC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_2B904();
  __asm { BR              X0 }

#error "7FDA4: call analysis failed (funcsize=28)"
#error "7FE1C: call analysis failed (funcsize=30)"
#error "7FEB0: call analysis failed (funcsize=37)"
uint64_t sub_7FEC4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  *(void *)(v4 + 120) = a2;
  *(void *)(v4 + 128) = a4;
  *(_BYTE *)(v4 + 248) = a3;
  *(void *)(v4 + 112) = a1;
  uint64_t v5 = type metadata accessor for DialogPhase(0LL);
  *(void *)(v4 + 136) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v4 + 144) = v6;
  *(void *)(v4 + 152) = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CATOption(0LL);
  *(void *)(v4 + 160) = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_7FF4C, 0LL, 0LL);
}

uint64_t sub_7FF4C()
{
  uint64_t v1 = *(void *)(v0 + 160);
  char v2 = *(_BYTE *)(v0 + 248);
  type metadata accessor for TimerBaseCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  uint64_t v3 = CATWrapper.__allocating_init(options:globals:)(v1, 0LL);
  *(void *)(v0 + 168) = v3;
  static DialogPhase.completion.getter(v3);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(v0 + 120);
    if (v4 == 2)
    {
      uint64_t v12 = *(void *)(v0 + 128);
      sub_80804();
      sub_807E4();
      sub_807A4();
      uint64_t v13 = swift_task_alloc(32LL);
      *(void *)(v0 + 192) = v13;
      *(void *)(v13 + 16) = v12;
      uint64_t v14 = (void *)swift_task_alloc(dword_10056C);
      *(void *)(v0 + 200) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_801E4;
      return sub_ACBBC((uint64_t)sub_8074C, v13);
    }

    if (v4 == 1)
    {
      uint64_t v5 = (void *)swift_task_alloc(dword_100574);
      *(void *)(v0 + 176) = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_80164;
      return sub_ACD60();
    }
  }

  uint64_t v7 = sub_67C4(&qword_FF538);
  uint64_t v8 = (void *)ParameterResolutionRecord.intent.getter(v7);
  id v9 = [v8 toLabel];

  if (v9)
  {
    if (qword_FB250 != -1) {
      swift_once(&qword_FB250, sub_6CDA8);
    }
    uint64_t v10 = (void *)swift_task_alloc(dword_FDAEC);
    *(void *)(v0 + 216) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_80278;
    return sub_5ACDC();
  }

  else
  {
    sub_80804();
    sub_807E4();
    sub_807A4();
    uint64_t v11 = (void *)swift_task_alloc(dword_100564);
    *(void *)(v0 + 232) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_80300;
    return sub_AC948();
  }

uint64_t sub_80164(uint64_t a1)
{
  *(void *)(v2 + 184) = v1;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_801B0()
{
  uint64_t v0 = sub_2BB58();
  return sub_2FB20(v0, v1);
}

uint64_t sub_801E4()
{
  v3[5] = v1;
  v3[6] = v2;
  v3[7] = v0;
  sub_1BD64();
  *(void *)(v4 + 208) = v0;
  swift_task_dealloc();
  sub_1B86C();
  sub_1B9B8();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_80244()
{
  uint64_t v0 = sub_2BB58();
  return sub_2FB20(v0, v1);
}

uint64_t sub_80278()
{
  v3[8] = v1;
  v3[9] = v2;
  v3[10] = v0;
  sub_1BD64();
  *(void *)(v4 + 224) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_802CC()
{
  uint64_t v0 = sub_2BB58();
  return sub_2FB20(v0, v1);
}

uint64_t sub_80300()
{
  v3[11] = v1;
  v3[12] = v2;
  v3[13] = v0;
  sub_1BD64();
  *(void *)(v4 + 240) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_80354()
{
  uint64_t v0 = sub_2BB58();
  return sub_2FB20(v0, v1);
}

uint64_t sub_80388()
{
  return sub_20748(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_803C4()
{
  return sub_20748(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_80400()
{
  return sub_20748(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8043C()
{
  return sub_20748(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_80478(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_FF54C);
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_804D8;
  return sub_7F57C(a1, a2);
}

uint64_t sub_804D8()
{
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_80524()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = sub_67C4(&qword_FBF48);
  uint64_t v3 = static BarbaraWalters.logAndReturnError<A>(context:_:)( 0xD000000000000074LL,  0x80000000000C91F0LL,  v0 + 24,  v2,  &protocol self-conformance witness table for Error);
  swift_willThrow(v3, v4, v5, v6, v7, v8, v9, v10);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_805B4(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_FF538);
  uint64_t v5 = (void *)ParameterResolutionRecord.intent.getter(v2);
  uint64_t v3 = type metadata accessor for SetTimerAttributeIntent(0LL);
  double v4 = IntentTargetable.knownHomePodCount.getter(v3, &protocol witness table for SetTimerAttributeIntent);

  *(double *)a1 = v4;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_8062C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1B9B8();
  return swift_task_switch(v2, v3, v4);
}

uint64_t sub_80648()
{
  uint64_t v1 = sub_67C4(&qword_FF538);
  uint64_t v2 = ParameterResolutionRecord.intent.getter(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_80688(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_FF544);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_20504;
  return sub_80478(a1, a2);
}

uint64_t sub_806E8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_FF534);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_C55C;
  return sub_8062C(a1);
}

void sub_80734(uint64_t a1)
{
}

uint64_t sub_80750@<X0>(uint64_t (*a1)(uint64_t, void)@<X8>)
{
  return a1(v1, *(void *)(v2 + 208));
}

uint64_t sub_80774()
{
  return swift_release(*(void *)(v0 + 168));
}

uint64_t sub_80788()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_80798()
{
  return swift_release(*(void *)(v0 + 168));
}

uint64_t sub_807A4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v0, v1);
}

uint64_t sub_807B8()
{
  return (*(uint64_t (**)(void, void))(v0[17] + 8LL))(v0[18], v0[16]);
}

uint64_t sub_807CC(uint64_t result)
{
  uint64_t v4 = (void *)*v2;
  *(void *)(v3 - 8) = *v2;
  v4[2] = v2;
  void v4[3] = result;
  v4[4] = v1;
  return result;
}

uint64_t sub_807E4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_807F4@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1, v3);
}

uint64_t sub_80804()
{
  return static DialogPhase.error.getter();
}

uint64_t sub_80810()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF558);
  sub_5474(v0, (uint64_t)qword_FF558);
  return static SiriTimeLog.timerPlugin.getter();
}

uint64_t sub_80858@<X0>(uint64_t a1@<X8>)
{
  if (v3)
  {
    uint64_t v4 = v3;
    if (qword_FB388 != -1) {
      swift_once(&qword_FB388, sub_AABA8);
    }
    uint64_t v5 = qword_1011E8;
    uint64_t v6 = unk_1011F0;
    swift_bridgeObjectRetain(unk_1011F0);
    uint64_t v7 = sub_80D78();
    SemanticValue.init(string:label:nodeClass:)(v7, v4, v5, v6, 0xD000000000000019LL);
    uint64_t v8 = sub_80D5C();
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 0LL, 1LL, v8);
  }

  else
  {
    if (qword_FB290 != -1) {
      swift_once(&qword_FB290, sub_80810);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    sub_5474(v10, (uint64_t)qword_FF558);
    id v11 = v1;
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      uint64_t v23 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      id v16 = v11;
      id v17 = [v16 description];
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      unint64_t v20 = v19;

      uint64_t v22 = sub_683C(v18, v20, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v14 + 4, v14 + 12);

      swift_bridgeObjectRelease(v20);
      _os_log_impl(&dword_0, v12, v13, "Error making descriptive hint for timer. Missing identifier: %s", v14, 0xCu);
      swift_arrayDestroy(v15, 1LL);
      sub_1B904(v15);
      sub_1B904((uint64_t)v14);
    }

    else
    {
    }

    uint64_t v21 = sub_80D5C();
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 1LL, 1LL, v21);
  }

uint64_t sub_80ADC()
{
  uint64_t v1 = sub_B8158(v0);
  if (v2)
  {
    unint64_t v3 = v2;
    uint64_t v4 = HIBYTE(v2) & 0xF;
    if ((v2 & 0x2000000000000000LL) == 0) {
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFLL;
    }
    if (v4)
    {
      if (qword_FB390 != -1) {
        swift_once(&qword_FB390, sub_AABCC);
      }
      uint64_t v5 = qword_1011F8;
      uint64_t v6 = unk_101200;
      swift_bridgeObjectRetain(unk_101200);
      uint64_t v7 = sub_80D78();
      SemanticValue.init(string:label:nodeClass:)(v7, v3, v5, v6, 0xD00000000000001CLL);
    }

    else
    {
      swift_bridgeObjectRelease(v2);
    }
  }

  sub_80D5C();
  uint64_t v8 = sub_80D64();
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v8, v9, v10, v11);
}

uint64_t sub_80BAC()
{
  uint64_t v0 = sub_67C4(&qword_FF570);
  uint64_t v1 = __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v18 - v4;
  uint64_t v6 = sub_80D5C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v18 - v11;
  sub_80ADC();
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v5, 1LL, v6) == 1)
  {
    sub_80D1C((uint64_t)v5);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    sub_80858((uint64_t)v3);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    DisplayHint.init(idValue:displayValue:)(v3, v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }

  type metadata accessor for DisplayHint(0LL);
  uint64_t v13 = sub_80D64();
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v13, v14, v15, v16);
}

uint64_t sub_80D1C(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_FF570);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_80D5C()
{
  return type metadata accessor for SemanticValue(0LL);
}

uint64_t sub_80D64()
{
  return v0;
}

uint64_t sub_80D78()
{
  return v0;
}

ValueMetadata *_s20HandleIntentStrategyVMa_4()
{
  return &_s20HandleIntentStrategyVN_4;
}

uint64_t sub_80D9C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF578);
  sub_5474(v0, (uint64_t)qword_FF578);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_80DE4(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_67C4(&qword_FBDB8);
  v2[4] = sub_1B6C8(*(void *)(v3 - 8));
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_80E28()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for HALTimerDeviceContext(0LL);
  sub_1BCA0(v1, 1LL, v3, v2);
  sub_6EB5C();
  uint64_t v5 = v4;
  sub_7C258(v4, &qword_FBDB8);
  sub_1BABC();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

uint64_t sub_80EA0(uint64_t a1, uint64_t a2)
{
  v2[49] = a1;
  v2[50] = a2;
  uint64_t v3 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[51] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[52] = v4;
  v2[53] = sub_1B6C8(v4);
  uint64_t v5 = type metadata accessor for SiriTimePluginModel(0LL);
  v2[54] = v5;
  v2[55] = sub_1B6C8(*(void *)(v5 - 8));
  uint64_t v6 = sub_67C4(&qword_FBD98);
  v2[56] = sub_1B6C8(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[57] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[58] = v8;
  v2[59] = sub_1B6C8(v8);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v2[60] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[61] = v10;
  v2[62] = sub_1B6C8(v10);
  uint64_t v11 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[63] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[64] = v12;
  v2[65] = sub_1B6C8(v12);
  uint64_t v13 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[66] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[67] = v14;
  v2[68] = sub_1B6C8(v14);
  uint64_t v15 = type metadata accessor for TipKitSiriTimeContext(0LL);
  v2[69] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[70] = v16;
  v2[71] = sub_1B6C8(v16);
  uint64_t v17 = type metadata accessor for TipKitSiriTimeSource(0LL);
  v2[72] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v2[73] = v18;
  v2[74] = sub_1B6C8(v18);
  uint64_t v19 = type metadata accessor for Parse.DirectInvocation(0LL);
  v2[75] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v2[76] = v20;
  v2[77] = sub_1B6C8(v20);
  uint64_t v21 = type metadata accessor for NLContextUpdate(0LL);
  v2[78] = v21;
  v2[79] = *(void *)(v21 - 8);
  v2[80] = sub_1B970();
  v2[81] = sub_1B970();
  uint64_t v22 = type metadata accessor for DialogPhase(0LL);
  v2[82] = v22;
  v2[83] = *(void *)(v22 - 8);
  v2[84] = sub_1B970();
  v2[85] = sub_1B970();
  v2[86] = sub_1B970();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_81070()
{
  if (qword_FB298 != -1) {
    swift_once(&qword_FB298, sub_80D9C);
  }
  uint64_t v2 = (os_log_s *)sub_5474(*(void *)(v0 + 480), (uint64_t)qword_FF578);
  *(void *)(v0 + 696) = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_2B938(v5);
    sub_45030(&dword_0, v3, v6, "CreateTimer.HandleIntentStrategy.makeIntentHandledResponse() called.");
    sub_1B904(v1);
  }

  uint64_t v7 = sub_67C4(&qword_FF5E8);
  uint64_t v8 = (void *)IntentResolutionRecord.intentResponse.getter(v7);
  id v9 = [v8 createdTimer];
  *(void *)(v0 + 704) = v9;

  if (v9)
  {
    static DialogPhase.completion.getter();
    uint64_t v11 = sub_67C4(&qword_FBE58);
    *(void *)(v0 + 712) = v11;
    uint64_t inited = swift_initStackObject(v11, v0 + 16);
    *(_OWORD *)(inited + 16) = xmmword_C2690;
    *(void *)(inited + 32) = v9;
    uint64_t v123 = inited;
    specialized Array._endMutation()(inited, v13, v14, v15, v16, v17, v18, v19);
    id v20 = v9;
    sub_C7A0();
    sub_18034();
    id v21 = v20;
    sub_58E1C(v21);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)(v0 + 616);
      uint64_t v25 = *(void *)(v0 + 608);
      sub_20F54();
      swift_bridgeObjectRelease(v23);
      NLContextUpdate.set(undoDirectInvocation:)(v24);
      sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    }

    uint64_t v26 = *(void *)(v0 + 592);
    uint64_t v27 = *(void *)(v0 + 584);
    uint64_t v28 = *(void *)(v0 + 576);
    uint64_t v29 = *(void *)(v0 + 568);
    uint64_t v30 = *(void *)(v0 + 560);
    uint64_t v31 = *(void *)(v0 + 552);
    (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))( v26,  enum case for TipKitSiriTimeSource.timerPlugin(_:),  v28);
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))( v29,  enum case for TipKitSiriTimeContext.timerCreatedWithSiri(_:),  v31);
    static TipKitDonationService.signalEventToTipKit(from:withContext:)(v26, v29);
    sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    id v32 = v21;
    uint64_t v33 = v2;
    Logger.logObject.getter(v32);
    os_log_type_t v34 = sub_1BCD0();
    if (sub_2BDE0(v34))
    {
      uint64_t v35 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v36 = sub_1BA1C(32LL);
      uint64_t v123 = v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      *(void *)(v0 + 352) = sub_B7FF0(v32);
      *(void *)(v0 + 360) = v37;
      sub_67C4(&qword_FB580);
      uint64_t v38 = String.init<A>(describing:)();
      unint64_t v40 = v39;
      *(void *)(v0 + 384) = sub_683C(v38, v39, &v123);
      sub_4C6E8(v0 + 384, v0 + 392);
      swift_bridgeObjectRelease(v40);

      _os_log_impl( &dword_0,  v33,  (os_log_type_t)v28,  "[CreateTimer.HandleIntentStrategy.makeIntentHandledResponse] Created timer has ID %s",  v35,  0xCu);
      swift_arrayDestroy(v36, 1LL);
      sub_1B904(v36);
      sub_1B904((uint64_t)v35);
    }

    else
    {
    }

    uint64_t v97 = sub_58E1C(v32);
    uint64_t v99 = v98;
    *(void *)(v0 + 720) = v98;
    type metadata accessor for TimerSessionManager(0LL);
    static TimerSessionManager.shared.getter((void *)(v0 + 56));
    uint64_t v100 = *(void *)(v0 + 80);
    uint64_t v101 = *(void *)(v0 + 88);
    sub_8CFC((void *)(v0 + 56), v100);
    v102 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SessionManaging.sessionIDString(for:)[1]);
    *(void *)(v0 + 728) = v102;
    void *v102 = v0;
    v102[1] = sub_81550;
    return dispatch thunk of SessionManaging.sessionIDString(for:)(v97, v99, v100, v101);
  }

  else
  {
    Logger.logObject.getter(v10);
    os_log_type_t v41 = sub_32A5C();
    if (os_log_type_enabled(v2, v41))
    {
      uint64_t v42 = (_WORD *)sub_1B9DC();
      *uint64_t v42 = 0;
      sub_835AC(&dword_0, v2, v43, "Can NOT retrieve intentResponse.createdTimer.");
      sub_1B904((uint64_t)v42);
    }

    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v44 = sub_5A12C();
    uint64_t v45 = sub_2F6A0(v44);
    *uint64_t v46 = 1;
    uint64_t v103 = v45;
    swift_willThrow(v45, v46, v47, v48, v49, v50, v51, v52);
    uint64_t v53 = sub_834DC();
    uint64_t v108 = v55;
    uint64_t v113 = v54;
    uint64_t v117 = *(void *)(v0 + 448);
    uint64_t v120 = *(void *)(v0 + 440);
    uint64_t v122 = *(void *)(v0 + 424);
    swift_task_dealloc(v53);
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    uint64_t v56 = sub_1BABC();
    uint64_t v64 = sub_1B910(v56, v57, v58, v59, v60, v61, v62, v63, v103, v108);
    uint64_t v72 = sub_1B8C4(v64, v65, v66, v67, v68, v69, v70, v71, v104, v109, v113);
    uint64_t v80 = sub_1B8BC(v72, v73, v74, v75, v76, v77, v78, v79, v105, v110, v114, v117);
    uint64_t v88 = sub_1B8B4(v80, v81, v82, v83, v84, v85, v86, v87, v106, v111, v115, v118, v120);
    sub_1B864(v88, v89, v90, v91, v92, v93, v94, v95, v107, v112, v116, v119, v121, v122);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_81550(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 728);
  *(void *)(v3 + 736) = a1;
  *(void *)(v3 + 744) = a2;
  swift_task_dealloc(v4);
  sub_18034();
  sub_1B9B8();
  return sub_1B758();
}

#error "81D20: call analysis failed (funcsize=513)"
uint64_t sub_81E4C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sub_83608();
  uint64_t v2 = v1[95];
  v1[96] = v3;
  v1[97] = v0;
  swift_task_dealloc(v2);
  sub_DABC(v1[56], &qword_FBD98);
  swift_release();
  if (v0) {
    sub_18034();
  }
  sub_1B9B8();
  return sub_2F414(v4, v5, v6);
}

uint64_t sub_81F2C(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 744);
  if (v3)
  {
    uint64_t v4 = *(os_log_s **)(v1 + 696);
    uint64_t v5 = swift_bridgeObjectRetain_n(*(void *)(v1 + 744), 2LL);
    Logger.logObject.getter(v5);
    os_log_type_t v6 = sub_1BCD0();
    if (sub_2BDE0(v6))
    {
      uint64_t v7 = *(void *)(v1 + 736);
      uint64_t v8 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v9 = sub_1BA1C(32LL);
      uint64_t v32 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain(v3);
      *(void *)(v1 + 368) = sub_683C(v7, v3, &v32);
      sub_4C6E8(v1 + 368, v1 + 376);
      swift_bridgeObjectRelease_n(v3, 3LL);
      _os_log_impl( &dword_0,  v4,  v2,  "[CreateTimer.HandleIntentStrategy.makeIntentHandledResponse] We have a live activity: %s",  v8,  0xCu);
      swift_arrayDestroy(v9, 1LL);
      sub_1B904(v9);
      sub_1B904((uint64_t)v8);
    }

    else
    {
      swift_bridgeObjectRelease_n(v3, 2LL);
    }

    int v19 = *(unsigned __int8 *)(v1 + 920);
    uint64_t v20 = *(void *)(v1 + 744);
    uint64_t v21 = *(void *)(v1 + 648);
    uint64_t v22 = *(void *)(v1 + 640);
    uint64_t v23 = *(void *)(v1 + 632);
    uint64_t v24 = *(void *)(v1 + 624);
    static DialogPhase.completion.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
    if (v19 == 1 && v20)
    {
      *(void *)(v1 + 248) = 0LL;
      *(_OWORD *)(v1 + 216) = 0u;
      *(_OWORD *)(v1 + 232) = 0u;
    }

    else
    {
      uint64_t v26 = *(void *)(v1 + 432);
      uint64_t v25 = *(__n128 ***)(v1 + 440);
      sub_67C4(&qword_FC2C0);
      uint64_t v27 = sub_5A4B8();
      uint64_t v28 = (__n128 *)sub_59E50(v27);
      sub_5A5A8(v28, (__n128)xmmword_C2640);
      *uint64_t v25 = v28;
      swift_storeEnumTagMultiPayload(v25, v26, 0LL);
      *(void *)(v1 + 240) = v26;
      *(void *)(v1 + 248) = sub_F0D4();
      uint64_t v29 = sub_DB90((void *)(v1 + 216));
      sub_2F2C4((uint64_t)v25, (uint64_t)v29);
    }

    uint64_t v30 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
    *(void *)(v1 + 784) = v30;
    *uint64_t v30 = v1;
    v30[1] = sub_822C0;
    sub_5A288();
  }

  else
  {
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(a1);
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (_WORD *)sub_1B9DC();
      _WORD *v12 = 0;
      sub_835AC( &dword_0,  v10,  v13,  "[CreateTimer.HandleIntentStrategy.makeIntentHandledResponse] No live activity - use snippet model.");
      sub_1B904((uint64_t)v12);
    }

    uint64_t v14 = *(void *)(v1 + 432);

    static DialogPhase.completion.getter();
    *(void *)(v1 + 200) = v14;
    *(void *)(v1 + 208) = sub_F0D4();
    uint64_t v15 = sub_DB90((void *)(v1 + 176));
    sub_67C4(&qword_FC2C0);
    uint64_t v16 = sub_5A4B8();
    uint64_t v17 = (__n128 *)sub_59E50(v16);
    sub_5A5A8(v17, (__n128)xmmword_C2640);
    *uint64_t v15 = v17;
    swift_storeEnumTagMultiPayload(v15, v14, 0LL);
    uint64_t v18 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
    *(void *)(v1 + 792) = v18;
    *uint64_t v18 = v1;
    v18[1] = sub_82454;
    sub_5A288();
  }

  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)();
}

uint64_t sub_822C0()
{
  uint64_t v1 = v0[85];
  uint64_t v2 = v0[83];
  uint64_t v3 = v0[82];
  uint64_t v4 = v0[79];
  sub_2B4F0(v0[98]);
  sub_2B7C4();
  sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_7C258(v5, &qword_FC2B8);
  sub_1B9B8();
  return swift_task_switch(v6, v7, v8);
}

#error "823F8: call analysis failed (funcsize=50)"
uint64_t sub_82454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  sub_835D4();
  sub_2B4F0(*(void *)(v0 + 792));
  uint64_t v1 = sub_83584();
  sub_7C258(v1, &qword_FC2B8);
  sub_1B9B8();
  return swift_task_switch(v2, v3, v4);
}

uint64_t sub_824E8()
{
  v0[32] = v2;
  v0[33] = v3;
  v0[34] = v1;
  sub_1BC0C(v4);
  v0[101] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    sub_835E8();
  }
  sub_1B9B8();
  return sub_2F414(v6, v7, v8);
}

uint64_t sub_82588()
{
  uint64_t v0 = (void *)sub_5A248();
  uint64_t v1 = sub_8353C(v0);
  sub_64434((uint64_t)v1, (uint64_t)sub_83334);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v3 = (void *)sub_835FC(v2);
  sub_834C4(v3);
  return sub_64234();
}

uint64_t sub_82618()
{
  v0[35] = v2;
  v0[36] = v3;
  v0[37] = v1;
  sub_1BC0C(v4);
  v0[103] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    sub_835E8();
  }
  sub_1B9B8();
  return sub_2F414(v6, v7, v8);
}

uint64_t sub_826B8()
{
  uint64_t v0 = (void *)sub_5A248();
  uint64_t v1 = sub_8353C(v0);
  sub_64434((uint64_t)v1, (uint64_t)sub_83334);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v2 = swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  uint64_t v3 = (void *)sub_835FC(v2);
  sub_834C4(v3);
  return sub_64234();
}

uint64_t sub_82748()
{
  v0[38] = v2;
  v0[39] = v3;
  v0[40] = v1;
  sub_1BC0C(v4);
  v0[105] = v1;
  swift_task_dealloc(v5);
  if (v1) {
    sub_835E8();
  }
  sub_1B9B8();
  return sub_2F414(v6, v7, v8);
}

uint64_t sub_827E8()
{
  uint64_t v0 = (void *)sub_5A248();
  uint64_t v1 = sub_8353C(v0);
  sub_64434((uint64_t)v1, (uint64_t)sub_83334);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v2 = swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  uint64_t v3 = (void *)sub_835FC(v2);
  sub_834C4(v3);
  return sub_64234();
}

uint64_t sub_82878()
{
  v1[41] = v2;
  v1[42] = v3;
  v1[43] = v0;
  sub_1BC0C(v4);
  v1[111] = v0;
  swift_task_dealloc(v5);
  if (v0) {
    swift_bridgeObjectRelease(v1[93]);
  }
  sub_1B86C();
  sub_1B9B8();
  return sub_2F414(v6, v7, v8);
}

uint64_t sub_82928()
{
  unint64_t v1 = *(void *)(v0 + 864);
  uint64_t v2 = *(void *)(v0 + 856);

  sub_21470(v2, v1);
  sub_83420();
  uint64_t v3 = (void *)sub_5A248();
  uint64_t v4 = sub_8353C(v3);
  sub_64434((uint64_t)v4, (uint64_t)sub_83334);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v5 = swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  uint64_t v6 = (void *)sub_835FC(v5);
  sub_834C4(v6);
  return sub_64234();
}

uint64_t sub_829D4()
{
  v0[114] = v1;
  swift_task_dealloc(v3);
  (*(void (**)(void, void))(v0[52] + 8LL))(v0[53], v0[51]);
  sub_1B9B8();
  return sub_2F414(v4, v5, v6);
}

#error "82AE4: call analysis failed (funcsize=50)"
#error "82B78: call analysis failed (funcsize=41)"
#error "82C1C: call analysis failed (funcsize=41)"
#error "82CC0: call analysis failed (funcsize=41)"
#error "82D64: call analysis failed (funcsize=41)"
#error "82E98: call analysis failed (funcsize=65)"
#error "82F88: call analysis failed (funcsize=60)"
uint64_t sub_82FC4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t TimerHandledOnWatchParameters;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v6 = sub_67C4(&qword_FBD98);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)&v20 - v10;
  uint64_t v12 = Data.base64EncodedString(options:)(0LL);
  SpeakableString.init(serializedValue:)(v12._countAndFlagsBits, v12._object);
  uint64_t v13 = type metadata accessor for SpeakableString(0LL);
  uint64_t v14 = 1LL;
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v11, 0LL, 1LL, v13);
  TimerHandledOnWatchParameters = type metadata accessor for CreateTimerHandledOnWatchParameters(0LL);
  sub_1B4F4((uint64_t)v11, (uint64_t)a1 + *(int *)(TimerHandledOnWatchParameters + 28));
  swift_retain();
  swift_release();
  a1[1] = a4;
  if (*(void *)(a4 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin10TimerTimer_duration))
  {
    sub_76078();
    uint64_t v14 = 0LL;
  }

  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, v14, 1LL, v13);
  sub_1B4F4((uint64_t)v9, (uint64_t)a1 + *(int *)(TimerHandledOnWatchParameters + 24));
  type metadata accessor for SirikitApp(0LL);
  uint64_t v16 = sub_67C4(&qword_FF5E8);
  uint64_t v17 = IntentResolutionRecord.app.getter(v16);
  uint64_t v18 = SirikitApp.init(app:)(v17);
  uint64_t result = swift_release();
  *a1 = v18;
  return result;
}

uint64_t sub_8314C()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_83188()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(101LL, 0x80000000000C9300LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_831F0()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_FF5E4);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_4C6A8(v1);
  return sub_83530(v2, v3);
}

uint64_t sub_83234()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_83270()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(109LL, 0x80000000000C9290LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_832D8()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_FF5DC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2A040;
  return sub_831F0();
}

uint64_t sub_83334(uint64_t a1)
{
  return sub_7AE14(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_83340(uint64_t *a1)
{
  return sub_82FC4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_8334C()
{
  return sub_8238C();
}

uint64_t sub_8339C()
{
  return swift_task_dealloc(*(void *)(v0 + 688));
}

uint64_t sub_833E8()
{
  return swift_release(*(void *)(v0 + 752));
}

uint64_t sub_83420()
{
  uint64_t v2 = v1[86];
  uint64_t v3 = v1[84];
  uint64_t v4 = v1[83];
  uint64_t v5 = v1[82];
  v1[112] = v0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
}

uint64_t sub_83450()
{
  return (*(uint64_t (**)(void, void))(v0[67] + 8LL))(v0[68], v0[66]);
}

uint64_t sub_834C4(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 392);
}

uint64_t sub_834DC()
{
  return *(void *)(v0 + 688);
}

uint64_t sub_83510()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_83520( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(a14, v14);
}

uint64_t sub_83530(uint64_t a1, uint64_t a2)
{
  return sub_80EA0(a1, a2);
}

void *sub_8353C(void *result)
{
  result[2] = v2;
  result[3] = v1;
  result[4] = v3;
  return result;
}

  ;
}

uint64_t sub_83568()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_83574()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_83584()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_83594()
{
  return swift_retain(v0);
}

uint64_t sub_8359C()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 744));
}

void sub_835AC(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

  ;
}

void sub_835D4()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_835E8()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 744));
}

uint64_t sub_835F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_835FC(uint64_t result)
{
  *(void *)(v1 + 904) = result;
  return result;
}

void sub_83608()
{
  *(void *)(v1 - 8) = *v0;
}

void sub_8361C()
{
  uint64_t v0 = (char *)sub_83654 + 4 * word_C4BD8[sub_6AB8()];
  __asm { BR              X10 }

#error "83674: call analysis failed (funcsize=48)"
void *sub_83D74(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v15))
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
    os_log_type_t v4 = 4LL;
    uint64_t v17 = v2;
    while (1)
    {
      if ((a1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1);
      }

      else
      {
        uint64_t v5 = *(void *)(a1 + 8 * v4);
        swift_retain(v5);
      }

      uint64_t v6 = v4 - 3;
      if (__OFADD__(v4 - 4, 1LL)) {
        break;
      }
      KeyPath = swift_getKeyPath(&unk_C4C50);
      uint64_t v20 = v5;
      swift_retain(v5);
      swift_getAtKeyPath(&v18, &v20, KeyPath);
      swift_release();
      swift_release_n(v5, 2LL);
      uint64_t v8 = v19;
      if (v19)
      {
        uint64_t v9 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_877FC( 0,  v3[2] + 1LL,  1,  (uint64_t)v3,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
          uint64_t v3 = v13;
        }

        os_log_type_t v11 = v3[2];
        uint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_877FC( v10 > 1,  v11 + 1,  1,  (uint64_t)v3,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
          uint64_t v3 = v14;
        }

        v3[2] = v11 + 1;
        uint64_t v12 = &v3[2 * v11];
        v12[4] = v9;
        v12[5] = v8;
        uint64_t v2 = v17;
      }

      ++v4;
      if (v6 == v2)
      {
        swift_bridgeObjectRelease(a1);
        return v3;
      }
    }

    __break(1u);
LABEL_17:
    if (a1 < 0) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

uint64_t sub_83F68()
{
  uint64_t v2 = (uint8_t *)type metadata accessor for UsoEntity_common_Quantifier.DefinedValues(0LL);
  uint64_t v3 = *((void *)v2 - 1);
  __chkstk_darwin(v2);
  sub_17DAC();
  uint64_t v118 = sub_67C4(&qword_FDD78);
  sub_17B6C();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_67C4(&qword_FDD80);
  sub_17B6C();
  __chkstk_darwin(v7);
  sub_21608();
  uint64_t v10 = v8 - v9;
  __chkstk_darwin(v11);
  sub_43404();
  uint64_t v119 = v12;
  sub_433B0();
  __chkstk_darwin(v13);
  uint64_t v120 = (uint64_t)&v110 - v14;
  uint64_t v15 = type metadata accessor for UsoEntity_common_UserEntity.DefinedValues(0LL);
  uint64_t v128 = *(void *)(v15 - 8);
  sub_17B6C();
  __chkstk_darwin(v16);
  sub_17D14();
  uint64_t v123 = v17;
  uint64_t v18 = sub_67C4(&qword_FF630);
  sub_17B6C();
  __chkstk_darwin(v19);
  sub_433C4();
  uint64_t v121 = v20;
  sub_433B0();
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v110 - v22;
  sub_67C4(&qword_FF638);
  sub_17B6C();
  __chkstk_darwin(v24);
  sub_433C4();
  uint64_t v122 = v25;
  sub_433B0();
  __chkstk_darwin(v26);
  sub_43404();
  uint64_t v129 = v27;
  sub_433B0();
  __chkstk_darwin(v28);
  sub_43404();
  v126 = (uint64_t *)v29;
  sub_433B0();
  __chkstk_darwin(v30);
  sub_43404();
  uint64_t v124 = v31;
  sub_433B0();
  __chkstk_darwin(v32);
  sub_43404();
  uint64_t v135 = v33;
  sub_433B0();
  __chkstk_darwin(v34);
  uint64_t v125 = (uint64_t)&v110 - v35;
  sub_87FF4();
  if (!v137[3])
  {
    sub_8CC4((uint64_t)v137, &qword_FCD20);
    goto LABEL_56;
  }

  uint64_t v36 = type metadata accessor for UsoTask_noVerb_common_Setting(0LL);
  if ((sub_17C30((uint64_t)&v136, (uint64_t)v137, (uint64_t)&type metadata for Any + 8, v36) & 1) == 0)
  {
LABEL_56:
    if (qword_FB2A0 != -1) {
LABEL_87:
    }
      swift_once(&qword_FB2A0, sub_84AA0);
    uint64_t v82 = sub_1BD34();
    sub_39658(v82, (uint64_t)qword_FF600);
    os_log_type_t v83 = sub_2BFB4();
    if (sub_329F4(v83))
    {
      uint64_t v84 = (_WORD *)sub_1B9DC();
      sub_2BA04(v84);
      sub_39644(&dword_0, v85, v86, "No UsoTask_noVerb_common_Setting found when searching for room confirmation");
      sub_1B904((uint64_t)v2);
    }

    return 3LL;
  }

  uint64_t v111 = v1;
  uint64_t v37 = v136;
  if (qword_FB2A0 != -1) {
    swift_once(&qword_FB2A0, sub_84AA0);
  }
  uint64_t v113 = v3;
  uint64_t v114 = v6;
  uint64_t v115 = v2;
  uint64_t v38 = sub_1BD34();
  uint64_t v116 = sub_5474(v38, (uint64_t)qword_FF600);
  unint64_t v39 = (os_log_s *)v116;
  Logger.logObject.getter(v116);
  os_log_type_t v40 = sub_1BCD0();
  BOOL v41 = sub_2B854(v40);
  uint64_t v117 = v37;
  if (v41)
  {
    uint64_t v42 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v42 = 0;
    sub_1BBEC(&dword_0, v39, (os_log_type_t)v2, "Searching for room confirmation in UsoTask_noVerb_common_Setting", v42);
    uint64_t v37 = v117;
    sub_1B904((uint64_t)v42);
  }

  uint64_t v43 = swift_retain(v37);
  uint64_t v44 = dispatch thunk of Uso_VerbTemplate_NoVerb.userEntities.getter(v43);
  sub_2BB30();
  if (v44) {
    uint64_t v45 = v44;
  }
  else {
    uint64_t v45 = (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v134 = v18;
  uint64_t v112 = v10;
  if ((unint64_t)v45 >> 62)
  {
    if (v45 < 0) {
      uint64_t v109 = v45;
    }
    else {
      uint64_t v109 = v45 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_2C044();
    uint64_t v46 = _CocoaArrayWrapper.endIndex.getter(v109);
  }

  else
  {
    uint64_t v46 = *(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFF8LL));
    sub_2C044();
  }

  uint64_t v47 = v128;
  uint64_t v48 = v125;
  if (!v46)
  {
LABEL_52:
    sub_2B644(v45);
    swift_retain(v117);
    dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter(v137);
    uint64_t v77 = sub_2BB30();
    if (v137[0] && (uint64_t v78 = dispatch thunk of CodeGenGlobalArgs.usoQuantifier.getter(v77), v79 = sub_2B750(), v78))
    {
      uint64_t v80 = v120;
      dispatch thunk of UsoEntity_common_Quantifier.definedValue.getter(v79);
      sub_1BC50();
      uint64_t v81 = v115;
    }

    else
    {
      uint64_t v80 = v120;
      uint64_t v81 = v115;
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v120, 1LL, 1LL, (uint64_t)v115);
    }

    uint64_t v89 = (uint64_t)v114;
    uint64_t v90 = v113;
    uint64_t v91 = v112;
    uint64_t v92 = v119;
    uint64_t v93 = v118;
    sub_75590( v119,  enum case for UsoEntity_common_Quantifier.DefinedValues.common_Quantifier_All(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v113 + 104));
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v92, 0LL, 1LL, (uint64_t)v81);
    uint64_t v94 = v89 + *(int *)(v93 + 48);
    sub_59624(v80, v89, &qword_FDD80);
    sub_59624(v92, v94, &qword_FDD80);
    sub_490E4(v89);
    if (v57)
    {
      sub_433BC(v92);
      sub_433BC(v80);
      sub_490E4(v94);
      if (v57)
      {
        sub_8CC4(v89, &qword_FDD80);
LABEL_75:
        sub_881AC();
        os_log_type_t v103 = sub_1BCD0();
        if (sub_2B854(v103))
        {
          uint64_t v87 = 2LL;
          uint64_t v104 = (_WORD *)sub_1B9DC();
          sub_4C4EC(v104);
          sub_1BBEC(&dword_0, (os_log_s *)&qword_FDD80, (os_log_type_t)v90, "Found .all", v81);
          sub_1B904((uint64_t)v81);
          sub_2BB30();
        }

        else
        {

          sub_2BB30();
          return 2LL;
        }

        return v87;
      }
    }

    else
    {
      sub_59624(v89, v91, &qword_FDD80);
      sub_490E4(v94);
      if (!v95)
      {
        uint64_t v100 = v111;
        (*(void (**)(uint64_t, uint64_t, uint8_t *))(v90 + 32))(v111, v94, v81);
        sub_11718( &qword_FDD88,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity_common_Quantifier.DefinedValues,  (uint64_t)&protocol conformance descriptor for UsoEntity_common_Quantifier.DefinedValues);
        char v102 = dispatch thunk of static Equatable.== infix(_:_:)(v91, v100, v81, v101);
        uint64_t v90 = *(void *)(v90 + 8);
        ((void (*)(uint64_t, uint8_t *))v90)(v100, v81);
        sub_433BC(v92);
        sub_433BC(v80);
        ((void (*)(uint64_t, uint8_t *))v90)(v91, v81);
        sub_433BC(v89);
        if ((v102 & 1) != 0) {
          goto LABEL_75;
        }
        goto LABEL_77;
      }

      sub_4357C(v92);
      sub_4357C(v80);
      (*(void (**)(uint64_t, uint8_t *))(v90 + 8))(v91, v81);
    }

    sub_8CC4(v89, &qword_FDD78);
LABEL_77:
    sub_2BB30();
    return 3LL;
  }

  unint64_t v133 = v45 & 0xC000000000000001LL;
  unsigned int v127 = enum case for UsoEntity_common_UserEntity.DefinedValues.common_UserEntity_Everywhere(_:);
  uint64_t v2 = (uint8_t *)&dword_4;
  uint64_t v131 = v46;
  uint64_t v132 = v45;
  while (1)
  {
    if (v133) {
      sub_8846C();
    }
    else {
      sub_88164();
    }
    uint64_t v49 = v2 - 3;
    if (__OFADD__(v2 - 4, 1LL))
    {
      __break(1u);
LABEL_86:
      __break(1u);
      goto LABEL_87;
    }

    uint64_t v50 = sub_883B4();
    if (v137[0])
    {
      dispatch thunk of UsoEntity_common_UserEntity.definedValue.getter(v50);
      sub_1BC50();
    }

    else
    {
      sub_88254(v48);
    }

    uint64_t v51 = v47;
    uint64_t v52 = *(void (**)(uint64_t, void, uint64_t))(v47 + 104);
    uint64_t v53 = v135;
    v130 = v52;
    v52(v135, v127, v15);
    sub_88340(v53);
    uint64_t v55 = (uint64_t)&v23[v54];
    uint64_t v0 = &qword_FF638;
    sub_88388(v48, (uint64_t)v23);
    sub_88388(v53, v55);
    sub_4364C((uint64_t)v23);
    if (v57) {
      break;
    }
    uint64_t v56 = v124;
    sub_88388((uint64_t)v23, v124);
    sub_4364C(v55);
    if (!v57)
    {
      uint64_t v58 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 32);
      uint64_t v59 = v123;
      sub_8837C(v123, v58);
      sub_11718( &qword_FF640,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity_common_UserEntity.DefinedValues,  (uint64_t)&protocol conformance descriptor for UsoEntity_common_UserEntity.DefinedValues);
      char v62 = sub_883C8(v56, v59, v61, v60);
      sub_882D4(v56);
      sub_882D4(v59);
      uint64_t v47 = v128;
      sub_4357C((uint64_t)v23);
      sub_4357C(v135);
      uint64_t v48 = v125;
      sub_4357C(v125);
      sub_88014();
      if ((v62 & 1) != 0) {
        goto LABEL_72;
      }
      goto LABEL_31;
    }

    uint64_t v47 = v51;
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v56, v15);
    uint64_t v48 = v125;
LABEL_29:
    sub_8CC4((uint64_t)v23, &qword_FF630);
    sub_4357C(v135);
    sub_4357C(v48);
    sub_88014();
LABEL_31:
    ++v2;
    if (v49 == (uint8_t *)v131)
    {
      swift_bridgeObjectRelease(v132);
      sub_2C044();
      LODWORD(v135) = enum case for UsoEntity_common_UserEntity.DefinedValues.common_UserEntity_Here(_:);
      uint64_t v63 = 4LL;
      uint64_t v2 = (uint8_t *)&qword_FF638;
      uint64_t v64 = v121;
      uint64_t v0 = v126;
      while (1)
      {
        if (v133) {
          sub_8846C();
        }
        else {
          sub_88164();
        }
        uint64_t v65 = v63 - 3;
        if (__OFADD__(v63 - 4, 1LL)) {
          goto LABEL_86;
        }
        uint64_t v66 = sub_883B4();
        if (v137[0])
        {
          dispatch thunk of UsoEntity_common_UserEntity.definedValue.getter(v66);
          sub_1BC50();
        }

        else
        {
          sub_88254((uint64_t)v0);
        }

        uint64_t v67 = v129;
        v130(v129, v135, v15);
        sub_88340(v67);
        uint64_t v69 = v64 + v68;
        sub_88404((uint64_t)v0, v64);
        sub_88404(v67, v69);
        sub_4364C(v64);
        if (v57) {
          break;
        }
        uint64_t v70 = v122;
        sub_88404(v64, v122);
        sub_4364C(v69);
        if (v71)
        {
          (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v70, v15);
LABEL_48:
          sub_8CC4(v64, &qword_FF630);
          sub_881C4(v129);
          uint64_t v0 = v126;
          sub_881C4((uint64_t)v126);
          sub_88014();
          goto LABEL_50;
        }

        uint64_t v72 = v123;
        sub_8837C(v123, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 32));
        sub_11718( &qword_FF640,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity_common_UserEntity.DefinedValues,  (uint64_t)&protocol conformance descriptor for UsoEntity_common_UserEntity.DefinedValues);
        char v75 = sub_883C8(v70, v72, v74, v73);
        sub_882D4(v70);
        uint64_t v76 = v72;
        uint64_t v64 = v121;
        sub_882D4(v76);
        uint64_t v47 = v128;
        sub_881C4(v64);
        sub_881C4(v129);
        uint64_t v0 = v126;
        sub_881C4((uint64_t)v126);
        sub_88014();
        if ((v75 & 1) != 0) {
          goto LABEL_81;
        }
LABEL_50:
        ++v63;
        BOOL v57 = v65 == v131;
        uint64_t v45 = v132;
        if (v57) {
          goto LABEL_52;
        }
      }

      sub_4364C(v69);
      if (v57)
      {
        uint64_t v0 = &qword_FF638;
        sub_4357C(v64);
        sub_4357C(v129);
        sub_4357C((uint64_t)v126);
        sub_88014();
LABEL_81:
        sub_2B644(v132);
        sub_881AC();
        os_log_type_t v105 = sub_2BFB4();
        if (sub_329F4(v105))
        {
          uint64_t v106 = (_WORD *)sub_1B9DC();
          sub_2BA04(v106);
          sub_39644(&dword_0, v107, v108, "Found .here");
          sub_1B904((uint64_t)&qword_FF638);
          sub_880B0();
        }

        else
        {

          sub_880B0();
        }

        return 1LL;
      }

      goto LABEL_48;
    }
  }

  sub_4364C(v55);
  uint64_t v47 = v51;
  if (!v57) {
    goto LABEL_29;
  }
  sub_433BC((uint64_t)v23);
  sub_433BC(v135);
  sub_433BC(v48);
  sub_88014();
LABEL_72:
  sub_2B644(v132);
  sub_881AC();
  os_log_type_t v96 = sub_2BFB4();
  if (sub_329F4(v96))
  {
    uint64_t v97 = (_WORD *)sub_1B9DC();
    sub_2BA04(v97);
    sub_39644(&dword_0, v98, v99, "Found .everywhere");
    sub_1B904((uint64_t)v2);
    sub_880B0();
  }

  else
  {

    sub_880B0();
  }

  return 0LL;
}

uint64_t sub_84AA0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF600);
  sub_5474(v0, (uint64_t)qword_FF600);
  return static SiriTimeLog.timerFlow.getter();
}

void sub_84AE8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v57 = a2;
  sub_67C4(&qword_FF620);
  sub_17B6C();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v51 = *(void *)(v8 - 8);
  sub_17B6C();
  __chkstk_darwin(v9);
  uint64_t v52 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  uint64_t v53 = *(void *)(v11 - 8);
  sub_17B6C();
  __chkstk_darwin(v12);
  sub_21608();
  uint64_t v15 = v13 - v14;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v50 - v17;
  sub_67C4(&qword_FF628);
  sub_17B6C();
  __chkstk_darwin(v19);
  sub_21608();
  uint64_t v22 = v20 - v21;
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v50 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v50 - v27;
  sub_5E330((uint64_t)&v50 - v27, 1LL);
  uint64_t v55 = v11;
  uint64_t v56 = a3;
  uint64_t v54 = v15;
  if (a1)
  {
    uint64_t v29 = sub_67C4(&qword_FBE58);
    uint64_t v30 = swift_allocObject(v29, 40LL, 7LL);
    *(_OWORD *)(v30 + 16) = xmmword_C2690;
    *(void *)(v30 + 32) = a1;
    uint64_t v58 = (void *)v30;
    specialized Array._endMutation()(v30, v31, v32, v33, v34, v35, v36, v37);
    uint64_t v38 = v58;
  }

  else
  {
    uint64_t v38 = _swiftEmptyArrayStorage;
  }

  sub_5BDA4();
  uint64_t v39 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v38, v57);
  uint64_t v40 = static UsoGraphUnitIndex.NAMES.getter();
  uint64_t v41 = type metadata accessor for UsoGraphVocabManager(0LL);
  sub_2B838(v41);
  uint64_t v42 = UsoGraphVocabManager.init(withListOfNames:)(v40);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v39, v42);
  sub_8CC4((uint64_t)v28, &qword_FF628);
  sub_1BC50();
  sub_5E330((uint64_t)v26, 0LL);
  sub_59110((uint64_t)v26, (uint64_t)v28, &qword_FF628);
  uint64_t v43 = v52;
  uint64_t v44 = v53;
  Siri_Nlu_External_UserStatedTask.init()(v45);
  sub_59624((uint64_t)v28, v22, &qword_FF628);
  sub_59624(v57, (uint64_t)v7, &qword_FF620);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v22, 1LL, v8) == 1)
  {
    uint64_t v46 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v38, v7);
    swift_bridgeObjectRelease(v38);
    static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v46, 0LL);
    sub_8CC4((uint64_t)v7, &qword_FF620);
    sub_2B750();
    sub_8CC4(v22, &qword_FF628);
  }

  else
  {
    sub_8CC4((uint64_t)v7, &qword_FF620);
    swift_bridgeObjectRelease(v38);
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v43, v22, v8);
  }

  uint64_t v47 = v54;
  uint64_t v48 = Siri_Nlu_External_UserStatedTask.task.setter(v43);
  Siri_Nlu_External_UserDialogAct.init()(v48);
  uint64_t v49 = v55;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v47, v18, v55);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v47);
  sub_4C454();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v18, v49);
  sub_8CC4((uint64_t)v28, &qword_FF628);
}

void sub_84EA4()
{
  uint64_t v5 = type metadata accessor for UsoEntity_common_TimeUnit.DefinedValues(0LL);
  __chkstk_darwin(v5);
  uint64_t v6 = sub_88094();
  __chkstk_darwin(v6);
  uint64_t v7 = (char *)&loc_84F90 + dword_8595C[sub_8812C()];
  __asm { BR              X10 }

void sub_84FA0()
{
  uint64_t v3 = sub_87FF4();
  if (*(void *)(v2 - 104))
  {
    uint64_t v4 = sub_880F8();
    if ((sub_87FBC(v4, (uint64_t)&type metadata for Any) & 1) != 0)
    {
      sub_87FFC();
      sub_88124();
      sub_78938();
      goto LABEL_10;
    }
  }

  else
  {
    sub_88004(v3, &qword_FCD20);
  }

  if (qword_FB2A0 != -1) {
    swift_once(&qword_FB2A0, sub_84AA0);
  }
  uint64_t v5 = sub_1BD34();
  sub_39658(v5, (uint64_t)qword_FF600);
  os_log_type_t v6 = sub_2BFB4();
  if (sub_329F4(v6))
  {
    uint64_t v7 = (_WORD *)sub_1B9DC();
    sub_2BA04(v7);
    sub_39644(&dword_0, v8, v9, "Parse entity: timer entity not found on createTimerTask.");
    sub_1B904(v1);
  }

LABEL_10:
  sub_88108();
}

void sub_859A8()
{
  uint64_t v0 = (char *)sub_859E4 + 4 * word_C4BFE[sub_6AB8()];
  __asm { BR              X10 }

#error "85A08: call analysis failed (funcsize=48)"
void sub_86054()
{
  char *v0;
  uint64_t v0 = (char *)sub_860BC + 4 * word_C4C24[sub_6AB8()];
  __asm { BR              X10 }

uint64_t sub_860BC()
{
  uint64_t v3 = sub_87FF4();
  if (!v24[3])
  {
    sub_88058(v3, &qword_FCD20, v4, v5, v6, v7, v8, v9, v19, v20, v21);
    goto LABEL_7;
  }

  uint64_t v10 = sub_88444();
  if ((sub_17C30((uint64_t)&v23, (uint64_t)v24, (uint64_t)&type metadata for Any + 8, v10) & 1) == 0)
  {
LABEL_7:
    if (qword_FB2A0 != -1) {
      swift_once(&qword_FB2A0, sub_84AA0);
    }
    uint64_t v14 = sub_1BD34();
    uint64_t v15 = (os_log_s *)sub_39658(v14, (uint64_t)qword_FF600);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (sub_2B854(v16))
    {
      uint64_t v17 = (_WORD *)sub_1B9DC();
      sub_4C4EC(v17);
      sub_1BBEC(&dword_0, v15, v1, v0, v2);
      sub_1B904((uint64_t)v2);
    }

    return 0LL;
  }

  uint64_t v11 = sub_87FFC();
  uint64_t v12 = ((uint64_t (*)(uint64_t))dispatch thunk of Uso_VerbTemplate_Reference.userEntities.getter)(v11);
  sub_1BC50();
  if (!v12)
  {
    sub_1BC50();
    return 0LL;
  }

  uint64_t v13 = v22(v12);
  swift_bridgeObjectRelease(v12);
  sub_1BC50();
  return v13;
}

uint64_t sub_86AEC(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v19))
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
    uint64_t v4 = 4LL;
    while (1)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1);
      }
      else {
        swift_retain(*(void *)(a1 + 8 * v4));
      }
      uint64_t v5 = v4 - 3;
      if (__OFADD__(v4 - 4, 1LL)) {
        break;
      }
      uint64_t v6 = sub_87088();
      swift_release();
      uint64_t v7 = v6[2];
      uint64_t v8 = v3[2];
      uint64_t v9 = v8 + v7;
      if (__OFADD__(v8, v7)) {
        goto LABEL_29;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
      if (!isUniquelyReferenced_nonNull_native || v9 > v3[3] >> 1)
      {
        if (v8 <= v9) {
          uint64_t v11 = v8 + v7;
        }
        else {
          uint64_t v11 = v8;
        }
        sub_877FC( isUniquelyReferenced_nonNull_native,  v11,  1,  (uint64_t)v3,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
        uint64_t v3 = v12;
      }

      if (v6[2])
      {
        uint64_t v13 = v3[2];
        if ((v3[3] >> 1) - v13 < v7) {
          goto LABEL_31;
        }
        unint64_t v14 = (unint64_t)&v3[2 * v13 + 4];
        if ((unint64_t)(v6 + 4) < v14 + 16 * v7 && v14 < (unint64_t)&v6[2 * v7 + 4])
        {
          char v21 = 2;
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v21,  1092LL,  0);
          __break(1u);
          return result;
        }

        swift_arrayInitWithCopy(v14);
        if (v7)
        {
          uint64_t v16 = v3[2];
          BOOL v17 = __OFADD__(v16, v7);
          uint64_t v18 = v16 + v7;
          if (v17) {
            goto LABEL_32;
          }
          v3[2] = v18;
        }
      }

      else if (v7)
      {
        goto LABEL_30;
      }

      swift_bridgeObjectRelease(v6);
      ++v4;
      if (v5 == v2) {
        goto LABEL_38;
      }
    }

    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    if (a1 < 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

  uint64_t v3 = _swiftEmptyArrayStorage;
LABEL_38:
  swift_bridgeObjectRelease(a1);
  if (!v3[2])
  {
    swift_bridgeObjectRelease(v3);
    return 0LL;
  }

  return (uint64_t)v3;
}

uint64_t sub_86D30(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  if (v2)
  {
    while (v2 >= 1)
    {
      uint64_t v3 = 0LL;
      uint64_t v4 = _swiftEmptyArrayStorage;
      while (1)
      {
        if ((a1 & 0xC000000000000001LL) != 0) {
          specialized _ArrayBuffer._getElementSlowPath(_:)(v3, a1);
        }
        else {
          swift_retain(*(void *)(a1 + 8 * v3 + 32));
        }
        uint64_t v5 = dispatch thunk of CodeGenListEntry.entry.getter(&v32);
        if (v32 && (uint64_t v6 = dispatch thunk of UsoEntity_common_UserEntity.names.getter(v5), swift_release(), v6))
        {
          uint64_t v7 = sub_83D74(v6);
          swift_release();
          swift_bridgeObjectRelease(v6);
        }

        else
        {
          swift_release();
          uint64_t v7 = _swiftEmptyArrayStorage;
        }

        uint64_t v8 = v7[2];
        uint64_t v9 = v4[2];
        uint64_t v10 = v9 + v8;
        if (__OFADD__(v9, v8)) {
          break;
        }
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
        if (!isUniquelyReferenced_nonNull_native || v10 > v4[3] >> 1)
        {
          if (v9 <= v10) {
            uint64_t v12 = v9 + v8;
          }
          else {
            uint64_t v12 = v9;
          }
          sub_877FC( isUniquelyReferenced_nonNull_native,  v12,  1,  (uint64_t)v4,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
          uint64_t v4 = v13;
        }

        if (v7[2])
        {
          uint64_t v14 = v4[2];
          if ((v4[3] >> 1) - v14 < v8) {
            goto LABEL_34;
          }
          unint64_t v15 = (unint64_t)&v4[2 * v14 + 4];
          swift_arrayInitWithCopy(v15);
          if (v8)
          {
            uint64_t v17 = v4[2];
            BOOL v18 = __OFADD__(v17, v8);
            uint64_t v19 = v17 + v8;
            if (v18) {
              goto LABEL_35;
            }
            v4[2] = v19;
          }
        }

        else if (v8)
        {
          goto LABEL_33;
        }

        swift_bridgeObjectRelease(v7);
        if (v2 == ++v3)
        {
          swift_bridgeObjectRelease(a1);
          goto LABEL_41;
        }
      }

      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      if (a1 < 0) {
        uint64_t v20 = a1;
      }
      else {
        uint64_t v20 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v20);
      if (!v2) {
        goto LABEL_40;
      }
    }

    __break(1u);
LABEL_52:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
    __break(1u);
  }

  else
  {
LABEL_40:
    swift_bridgeObjectRelease(a1);
    uint64_t v4 = _swiftEmptyArrayStorage;
LABEL_41:
    uint64_t v21 = v4[2];
    if (v21)
    {
      swift_bridgeObjectRetain(v4);
      sub_877FC( 0,  1LL,  1,  (uint64_t)_swiftEmptyArrayStorage,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
      uint64_t v23 = v22;
      uint64_t v24 = v4 + 5;
      do
      {
        uint64_t v26 = *(v24 - 1);
        uint64_t v25 = *v24;
        unint64_t v27 = v23[2];
        unint64_t v28 = v23[3];
        swift_bridgeObjectRetain(*v24);
        if (v27 >= v28 >> 1)
        {
          sub_877FC( v28 > 1,  v27 + 1,  1,  (uint64_t)v23,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
          uint64_t v23 = v30;
        }

        v24 += 2;
        v23[2] = v27 + 1;
        uint64_t v29 = &v23[2 * v27];
        v29[4] = v26;
        v29[5] = v25;
        --v21;
      }

      while (v21);
      swift_bridgeObjectRelease(v4);
    }

    else
    {
      uint64_t v23 = _swiftEmptyArrayStorage;
    }

    swift_bridgeObjectRelease(v4);
    if (!v23[2])
    {
      swift_bridgeObjectRelease(v23);
      return 0LL;
    }

    return (uint64_t)v23;
  }

  return result;
}

void *sub_87088()
{
  uint64_t v0 = dispatch thunk of CodeGenListEntry.entry.getter(&v42);
  if (!v42) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v1 = dispatch thunk of UsoEntity_common_UserEntity.associatedUserEntities.getter(v0);
  swift_release();
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = v1 & 0xFFFFFFFFFFFFFF8LL;
  uint64_t v3 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(v1);
  while (v3)
  {
    uint64_t v4 = 0LL;
    unint64_t v35 = v1 & 0xC000000000000001LL;
    uint64_t v5 = _swiftEmptyArrayStorage;
    uint64_t v33 = v1;
    uint64_t v34 = v1 + 32;
    uint64_t v32 = v3;
    while (1)
    {
      if (v35) {
        specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }
      else {
        swift_retain(*(void *)(v34 + 8 * v4));
      }
      BOOL v6 = __OFADD__(v4++, 1LL);
      if (v6) {
        break;
      }
      uint64_t v7 = dispatch thunk of CodeGenListEntry.entry.getter(&v41);
      if (!v41)
      {
        swift_release();
        uint64_t v11 = _swiftEmptyArrayStorage;
        goto LABEL_36;
      }

      uint64_t v36 = v5;
      uint64_t v8 = dispatch thunk of UsoEntity_common_UserEntity.names.getter(v7);
      swift_release();
      if (v8)
      {
        uint64_t KeyPath = swift_getKeyPath(&unk_C4C50);
        if ((unint64_t)v8 >> 62)
        {
          if (v8 >= 0) {
            uint64_t v20 = v8 & 0xFFFFFFFFFFFFFF8LL;
          }
          else {
            uint64_t v20 = v8;
          }
          swift_bridgeObjectRetain(v8);
          uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v20);
          if (v9)
          {
LABEL_14:
            if (v9 < 1) {
              goto LABEL_62;
            }
            uint64_t v10 = 0LL;
            uint64_t v11 = _swiftEmptyArrayStorage;
            do
            {
              if ((v8 & 0xC000000000000001LL) != 0)
              {
                uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v8);
              }

              else
              {
                uint64_t v12 = *(void *)(v8 + 8 * v10 + 32);
                swift_retain(v12);
              }

              uint64_t v38 = v12;
              swift_getAtKeyPath(&v39, &v38, KeyPath);
              swift_release();
              uint64_t v13 = v40;
              if (v40)
              {
                uint64_t v14 = v39;
                if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
                {
                  sub_877FC( 0,  v11[2] + 1LL,  1,  (uint64_t)v11,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
                  uint64_t v11 = v18;
                }

                unint64_t v16 = v11[2];
                unint64_t v15 = v11[3];
                if (v16 >= v15 >> 1)
                {
                  sub_877FC( v15 > 1,  v16 + 1,  1,  (uint64_t)v11,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
                  uint64_t v11 = v19;
                }

                v11[2] = v16 + 1;
                uint64_t v17 = &v11[2 * v16];
                v17[4] = v14;
                v17[5] = v13;
              }

              ++v10;
            }

            while (v9 != v10);
            swift_release();
            swift_release();
            swift_bridgeObjectRelease_n(v8, 2LL);
            uint64_t v3 = v32;
            uint64_t v1 = v33;
            goto LABEL_35;
          }
        }

        else
        {
          uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8LL));
          swift_bridgeObjectRetain(v8);
          if (v9) {
            goto LABEL_14;
          }
        }

        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n(v8, 2LL);
      }

      else
      {
        swift_release();
      }

      uint64_t v11 = _swiftEmptyArrayStorage;
LABEL_35:
      uint64_t v5 = v36;
LABEL_36:
      uint64_t v21 = v11[2];
      uint64_t v22 = v5[2];
      uint64_t v23 = v22 + v21;
      if (__OFADD__(v22, v21)) {
        goto LABEL_58;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
      if (!isUniquelyReferenced_nonNull_native || v23 > v5[3] >> 1)
      {
        if (v22 <= v23) {
          uint64_t v25 = v22 + v21;
        }
        else {
          uint64_t v25 = v22;
        }
        sub_877FC( isUniquelyReferenced_nonNull_native,  v25,  1,  (uint64_t)v5,  &qword_FF618,  (void (*)(void, uint64_t, void *, uint64_t))sub_879E0,  (void (*)(uint64_t, uint64_t, void *))sub_87D68);
        uint64_t v5 = v26;
      }

      uint64_t v2 = v11[2];
      if (v2)
      {
        uint64_t v2 = v5[2];
        if ((v5[3] >> 1) - v2 < v21) {
          goto LABEL_60;
        }
        unint64_t v27 = (unint64_t)&v5[2 * v2 + 4];
        if ((unint64_t)(v11 + 4) < v27 + 16 * v21 && v27 < (unint64_t)&v11[2 * v21 + 4])
        {
          uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
          __break(1u);
          return result;
        }

        swift_arrayInitWithCopy(v27);
        if (v21)
        {
          uint64_t v29 = v5[2];
          BOOL v6 = __OFADD__(v29, v21);
          uint64_t v2 = v29 + v21;
          if (v6) {
            goto LABEL_61;
          }
          v5[2] = v2;
        }
      }

      else if (v21)
      {
        goto LABEL_59;
      }

      swift_bridgeObjectRelease(v11);
      if (v4 == v3) {
        goto LABEL_68;
      }
    }

    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    if (v1 >= 0) {
      uint64_t v30 = v2;
    }
    else {
      uint64_t v30 = v1;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v30);
  }

  uint64_t v5 = _swiftEmptyArrayStorage;
LABEL_68:
  swift_bridgeObjectRelease_n(v1, 2LL);
  return v5;
}

double sub_874DC@<D0>(_OWORD *a1@<X8>)
{
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_87514(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    sub_88244();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_88234();
    }
  }

  else
  {
    uint64_t v6 = a2;
  }

  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    uint64_t v11 = sub_67C4(&qword_FF670);
    uint64_t v12 = (char *)sub_88334(v11, 32 * v10);
    size_t v13 = j__malloc_size(v12);
    *((void *)v12 + 2) = v9;
    *((void *)v12 + 3) = 2 * ((uint64_t)(v13 - 32) / 32);
  }

  else
  {
    uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v12 + 32;
  if ((a1 & 1) != 0)
  {
    sub_87CE4((char *)(a4 + 32), v9, v14);
    sub_8816C();
  }

  else
  {
    sub_878E8(0LL, v9, (unint64_t)v14, a4);
  }

void sub_875E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

uint64_t sub_875FC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_87624(a1, a2, a3, a4, &qword_FF650, (void (*)(void))&type metadata accessor for DisplayHint);
}

uint64_t sub_87610(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_87624(a1, a2, a3, a4, &qword_FF658, (void (*)(void))&type metadata accessor for SemanticValue);
}

uint64_t sub_87624(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    sub_88244();
    if (v10 != v11)
    {
      if (v9 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_23:
        sub_88044();
        uint64_t v26 = "Division by zero";
        uint64_t v27 = 16LL;
LABEL_25:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v26,  v27,  2LL,  "Swift/IntegerTypes.swift",  24LL);
        __break(1u);
        return result;
      }

      sub_88234();
    }
  }

  else
  {
    uint64_t v9 = a2;
  }

  uint64_t v12 = *(void *)(a4 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (!v13)
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
    goto LABEL_18;
  }

  uint64_t v14 = sub_67C4(a5);
  uint64_t v15 = *(void *)(((uint64_t (*)(void))a6)(0LL) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = (void *)swift_allocObject(v14, v18 + v16 * v13, v17 | 7);
  size_t v20 = j__malloc_size(v19);
  if (!v16) {
    goto LABEL_23;
  }
  if (v20 - v18 == 0x8000000000000000LL && v16 == -1)
  {
    sub_88044();
    uint64_t v26 = "Division results in an overflow";
    uint64_t v27 = 31LL;
    goto LABEL_25;
  }

  v19[2] = v12;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v16);
LABEL_18:
  uint64_t v22 = *(unsigned __int8 *)(*(void *)(((uint64_t (*)(void))a6)(0LL) - 8) + 80LL);
  uint64_t v23 = (v22 + 32) & ~v22;
  unint64_t v24 = (unint64_t)v19 + v23;
  if ((a1 & 1) != 0)
  {
    sub_87DFC(a4 + v23, v12, v24, a6);
    sub_8816C();
  }

  else
  {
    sub_87BE8(0LL, v12, v24, a4, (uint64_t (*)(void))a6);
  }

  return (uint64_t)v19;
}

uint64_t sub_877CC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_87624(a1, a2, a3, a4, &qword_FF648, (void (*)(void))&type metadata accessor for RREntity);
}

void sub_877E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_877FC( char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  if ((a3 & 1) != 0)
  {
    sub_88244();
    if (v12 != v13)
    {
      if (v11 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_88234();
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    uint64_t v16 = sub_67C4(a5);
    uint64_t v17 = (void *)sub_88334(v16, 16 * v15);
    size_t v18 = j__malloc_size(v17);
    v17[2] = v14;
    v17[3] = 2 * ((uint64_t)(v18 - 32) / 16);
  }

  else
  {
    uint64_t v17 = _swiftEmptyArrayStorage;
  }

  uint64_t v19 = v17 + 4;
  if ((a1 & 1) != 0)
  {
    a7(a4 + 32, v14, v19);
    sub_8816C();
  }

  else
  {
    a6(0LL, v14, v19, a4);
  }

uint64_t sub_878D4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_87624( a1,  a2,  a3,  a4,  &qword_FF678,  (void (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
}

uint64_t sub_878E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 32 * a1 + 32;
  unint64_t v7 = a3 + 32 * v4;
  if (v6 >= v7 || v6 + 32 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_879E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 16 * a1 + 32;
  unint64_t v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_87AD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v7 = a4 + 16 * a1 + 32;
  unint64_t v8 = a3 + 16 * v4;
  if (v7 >= v8 || v7 + 16 * v4 <= a3)
  {
    sub_67C4(&qword_FF668);
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v8;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_87BE8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    sub_88044();
    uint64_t v19 = "UnsafeMutablePointer.initialize with negative count";
    uint64_t v20 = 51LL;
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(a5(0LL) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  uint64_t v13 = v11 * v5;
  unint64_t v14 = a3 + v13;
  unint64_t v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    sub_883C0();
    return;
  }

  sub_88044();
  uint64_t v19 = "UnsafeMutablePointer.initialize overlapping range";
  uint64_t v20 = 49LL;
LABEL_11:
  sub_881A0( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)v19,  v20,  v17,  (uint64_t)"Swift/UnsafePointer.swift",  v18,  v21,  v22,  v23);
  __break(1u);
}

char *sub_87CE4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }

  return __src;
}

char *sub_87D68(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }

  return __src;
}

uint64_t sub_87DF0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_87DFC(a1, a2, a3, (void (*)(void))type metadata accessor for SiriTimerSnippetModel);
}

uint64_t sub_87DFC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_88044();
    uint64_t result = sub_881A0( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v11,  (uint64_t)"Swift/UnsafePointer.swift",  v12,  v13,  v14,  v15);
    __break(1u);
  }

  else if (a3 < a1 {
         || (uint64_t result = ((uint64_t (*)(void))a4)(0LL),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72LL) * a2 <= a3))
  {
    a4(0LL);
    uint64_t v10 = sub_883E8();
    return swift_arrayInitWithTakeFrontToBack(v10);
  }

  else if (a3 != a1)
  {
    uint64_t v9 = sub_883E8();
    return swift_arrayInitWithTakeBackToFront(v9);
  }

  return result;
}

uint64_t sub_87ED0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_87EE8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for DisplayHint);
}

uint64_t sub_87EDC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_87EE8(a1, a2, a3, type metadata accessor for SiriTimerSnippetModel);
}

uint64_t sub_87EE8(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0)
  {
    sub_88044();
    int v13 = "UnsafeMutablePointer.initialize with negative count";
    uint64_t v14 = 51LL;
  }

  else
  {
    uint64_t v6 = *(void *)(*(void *)(a4(0LL) - 8) + 72LL) * a2;
    unint64_t v7 = a3 + v6;
    unint64_t v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    sub_88044();
    int v13 = "UnsafeMutablePointer.initialize overlapping range";
    uint64_t v14 = 49LL;
  }

  uint64_t result = sub_881A0( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)v13,  v14,  v11,  (uint64_t)"Swift/UnsafePointer.swift",  v12,  v15,  v16,  v17);
  __break(1u);
  return result;
}

uint64_t sub_87FBC@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return swift_dynamicCast(v2 - 136, v2 - 128, a2 + 8, a1, 6LL);
}

uint64_t sub_87FD0@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>, uint64_t a3, ...)
{
  uint64_t v4 = va_arg(va1, void);
  return swift_dynamicCast((uint64_t *)va, va1, a2 + 8, a1, 6LL);
}

uint64_t sub_87FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6 = va_arg(va1, void);
  return swift_dynamicCast((uint64_t *)va, va1, a3, a4, 6LL);
}

uint64_t sub_87FF4()
{
  return static UsoTask_CodegenConverter.convert(task:)(v0);
}

uint64_t sub_87FFC()
{
  return swift_retain(v0);
}

void sub_88004(uint64_t a1, uint64_t *a2)
{
}

void sub_8800C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_88014()
{
  return swift_release(v0);
}

uint64_t sub_8801C(uint64_t a1)
{
  return swift_retain(v1);
}

  ;
}

void sub_88058( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

  ;
}

uint64_t sub_8806C()
{
  return swift_release(v0);
}

uint64_t sub_88074@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
}

uint64_t sub_88094()
{
  return type metadata accessor for UsoEntity_appleTimer_TimerAttribute.DefinedValues(0LL);
}

uint64_t sub_880B0()
{
  return swift_release(*(void *)(v0 - 280));
}

uint64_t sub_880BC@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v2, a1, v3);
}

uint64_t sub_880C8(uint64_t a1)
{
  return static UsoTask_CodegenConverter.convert(task:)(a1);
}

uint64_t sub_880D4@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v3, a1, v2);
}

uint64_t sub_880E0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_880EC()
{
  return type metadata accessor for UsoEntityBuilder_common_TimeUnit(0LL);
}

uint64_t sub_880F8()
{
  return type metadata accessor for UsoTask_create_common_Timer(0LL);
}

uint64_t sub_88100()
{
  return swift_release(*(void *)(v0 - 208));
}

  ;
}

uint64_t sub_88124()
{
  return dispatch thunk of Uso_VerbTemplate_Target.target.getter();
}

uint64_t sub_8812C()
{
  return sub_6AB8();
}

double sub_88144()
{
  return 9.22337204e18;
}

  ;
}

uint64_t sub_88164()
{
  return swift_retain(v0);
}

uint64_t sub_8816C()
{
  *(void *)(v0 + 16) = 0LL;
  return swift_bridgeObjectRelease(v0);
}

void sub_88178(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  sub_59624((uint64_t)va1, (uint64_t)va, a3);
}

  ;
}

uint64_t sub_881A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 25LL, a9, a10, a11);
}

uint64_t sub_881AC()
{
  return Logger.logObject.getter();
}

uint64_t sub_881B8()
{
  return dispatch thunk of UsoEntityBuilder_common_Integer.setIntegerValue(value:)((uint64_t)v0);
}

void sub_881C4(uint64_t a1)
{
}

uint64_t sub_881CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v7 = va_arg(va1, void);
  return swift_dynamicCast((uint64_t *)va, va1, v5, a4, 0LL);
}

uint64_t sub_881E0()
{
  return type metadata accessor for UsoEntity_common_Duration.DefinedValues(0LL);
}

uint64_t sub_881F4()
{
  return swift_release(*(void *)(v0 - 192));
}

uint64_t sub_881FC()
{
  return swift_release(*(void *)(v0 - 216));
}

uint64_t sub_88204()
{
  return dispatch thunk of UsoEntity_common_DateTime.offsetValue.getter();
}

uint64_t sub_8820C()
{
  return dispatch thunk of UsoEntityBuilder_common_DurationComponent.setUnit(value:)();
}

uint64_t sub_88214()
{
  *(void *)(v0 - 192) = *(void *)(v0 - 136);
  return type metadata accessor for UsoTaskBuilder_create_common_Timer(0LL);
}

uint64_t sub_88224()
{
  return swift_retain(v0);
}

void sub_8822C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

  ;
}

  ;
}

uint64_t sub_88254(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 1LL, 1LL, v1);
}

  ;
}

uint64_t sub_88274()
{
  return dispatch thunk of UsoEntityBuilder_common_Duration.setDefinedValue(value:)();
}

uint64_t sub_8827C()
{
  return UsoEntityBuilder_common_DurationComponent.init()();
}

uint64_t sub_88284()
{
  return UsoEntityBuilder_common_Timer.init()();
}

uint64_t sub_8828C()
{
  return UsoEntityBuilder_common_TimeUnit.init()();
}

uint64_t sub_88294()
{
  return UsoEntityBuilder_common_Integer.init()();
}

uint64_t sub_8829C()
{
  return UsoEntityBuilder_common_Duration.init()();
}

uint64_t sub_882A4()
{
  return UsoTaskBuilder_create_common_Timer.init()();
}

uint64_t sub_882AC()
{
  return UsoEntityBuilder_appleTimer_TimerAttribute.init()();
}

uint64_t sub_882B4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_882C4()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_Target.setTarget(value:)();
}

uint64_t sub_882CC()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceTrigger.trigger.getter();
}

uint64_t sub_882D4(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_882DC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_882EC()
{
  return swift_release(*(void *)(v0 - 184));
}

uint64_t sub_882F4()
{
  return type metadata accessor for UsoEntityBuilder_common_Integer(0LL);
}

uint64_t sub_882FC()
{
  return type metadata accessor for UsoTask(0LL);
}

uint64_t sub_88304()
{
  return type metadata accessor for UsoEntityBuilder_common_DurationComponent(0LL);
}

uint64_t sub_8830C()
{
  return type metadata accessor for UsoEntityBuilder_common_Timer(0LL);
}

uint64_t sub_88314()
{
  return type metadata accessor for UsoEntityBuilder_common_Duration(0LL);
}

uint64_t sub_8831C()
{
  return type metadata accessor for UsoEntityBuilder_appleTimer_TimerAttribute(0LL);
}

uint64_t sub_88324()
{
  return type metadata accessor for UsoTask_reset_common_Timer(0LL);
}

uint64_t sub_8832C()
{
  return type metadata accessor for UsoBuilderOptions(0LL);
}

uint64_t sub_88334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_allocObject(a1, a2 + 32, 7LL);
}

uint64_t sub_88340(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 0LL, 1LL, v1);
}

uint64_t sub_88364()
{
  return v0;
}

uint64_t sub_88370()
{
  return v0;
}

uint64_t sub_8837C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2, v3);
}

void sub_88388(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_88390()
{
  return dispatch thunk of UsoEntityBuilder_appleTimer_TimerAttribute.setDefinedValue(value:)(v0);
}

uint64_t sub_8839C()
{
  return v0;
}

uint64_t sub_883A8()
{
  return dispatch thunk of UsoEntity_common_EventTrigger.dateTimeRangeTrigger.getter();
}

void *sub_883B4()
{
  return dispatch thunk of CodeGenListEntry.entry.getter((void *)(v0 - 120));
}

  ;
}

uint64_t sub_883C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(a1, a2, v4, a4);
}

uint64_t sub_883D4()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceTrigger.trigger.getter();
}

uint64_t sub_883DC()
{
  return dispatch thunk of UsoEntityBuilder_common_TimeUnit.setDefinedValue(value:)(v0);
}

uint64_t sub_883E8()
{
  return v0;
}

uint64_t sub_883FC()
{
  return swift_release(*(void *)(v0 - 200));
}

void sub_88404(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_8840C()
{
  return type metadata accessor for UsoTask_summarise_common_Timer(0LL);
}

uint64_t sub_88414()
{
  return type metadata accessor for UsoTask_enable_common_Setting(0LL);
}

uint64_t sub_8841C()
{
  return type metadata accessor for UsoTask_pause_common_Timer(0LL);
}

uint64_t sub_88424()
{
  return type metadata accessor for UsoTask_noVerb_common_Timer(0LL);
}

uint64_t sub_8842C()
{
  return type metadata accessor for UsoTask_stop_common_Timer(0LL);
}

uint64_t sub_88434()
{
  return type metadata accessor for UsoTask_update_common_Timer(0LL);
}

uint64_t sub_8843C()
{
  return type metadata accessor for UsoTask_delete_common_Timer(0LL);
}

uint64_t sub_88444()
{
  return type metadata accessor for UsoTask_checkExistence_common_Timer(0LL);
}

uint64_t sub_8844C()
{
  return type metadata accessor for UsoTask_resume_common_Timer(0LL);
}

uint64_t sub_88454()
{
  return type metadata accessor for UsoTask_disable_common_Setting(0LL);
}

uint64_t sub_8845C()
{
  return type metadata accessor for UsoTask_start_common_Timer(0LL);
}

uint64_t sub_88464()
{
  return type metadata accessor for UsoTask_request_common_Timer(0LL);
}

uint64_t sub_8846C()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v0, v1);
}

uint64_t sub_88478()
{
  *(void *)(v1 + 24) = v0;
  return swift_task_switch(sub_88490, 0LL, 0LL);
}

uint64_t sub_88490()
{
  id v1 = [*(id *)(v0 + 24) timers];
  *(void *)(v0 + 32) = v1;
  if (!v1) {
    return (*(uint64_t (**)(void *))(v0 + 8))(_swiftEmptyArrayStorage);
  }
  id v2 = v1;
  uint64_t v3 = swift_task_alloc(32LL);
  *(void *)(v0 + 40) = v3;
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 48) = v4;
  uint64_t v5 = sub_67C4(&qword_FF688);
  *uint64_t v4 = v0;
  v4[1] = sub_88580;
  return withCheckedContinuation<A>(isolation:function:_:)( v0 + 16,  0LL,  0LL,  0xD000000000000010LL,  0x80000000000C93D0LL,  sub_88810,  v3,  v5);
}

uint64_t sub_88580()
{
  return swift_task_switch(sub_885DC, 0LL, 0LL);
}

uint64_t sub_885DC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

void sub_8860C(uint64_t a1, void *a2)
{
  id v21 = a2;
  uint64_t v4 = sub_67C4(&qword_FF690);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, a1, v4);
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = (v9 + 16) & ~v9;
  uint64_t v11 = v10 + v6;
  uint64_t v12 = v9 | 7;
  uint64_t v13 = swift_allocObject(&unk_F5B38, v11, v9 | 7);
  uint64_t v14 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v14(v13 + v10, v7, v4);
  uint64_t v26 = sub_8888C;
  uint64_t v27 = v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v23 = 1107296256LL;
  unint64_t v24 = sub_88898;
  uint64_t v25 = &unk_F5B50;
  int v15 = _Block_copy(&aBlock);
  swift_release();
  id v16 = [a2 addSuccessBlock:v15];
  _Block_release(v15);

  v8(v7, a1, v4);
  uint64_t v17 = swift_allocObject(&unk_F5B88, v11, v12);
  v14(v17 + v10, v7, v4);
  uint64_t v26 = sub_889B0;
  uint64_t v27 = v17;
  aBlock = _NSConcreteStackBlock;
  uint64_t v23 = 1107296256LL;
  unint64_t v24 = (void (*)(uint64_t, void *))sub_ADF24;
  uint64_t v25 = &unk_F5BA0;
  uint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  id v19 = [v21 addFailureBlock:v18];
  _Block_release(v18);
}

void sub_88810(uint64_t a1)
{
}

uint64_t sub_88818(uint64_t a1)
{
  uint64_t v6 = 0LL;
  unint64_t v2 = sub_88A0C();
  static Array._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v6, v2);
  uint64_t v3 = v6;
  if (!v6) {
    uint64_t v3 = _swiftEmptyArrayStorage;
  }
  uint64_t v6 = v3;
  uint64_t v4 = sub_67C4(&qword_FF690);
  return CheckedContinuation.resume(returning:)(&v6, v4);
}

uint64_t sub_8888C(uint64_t a1)
{
  return sub_889BC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_88818);
}

void sub_88898(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_888E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_888F8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_88900()
{
  uint64_t v2 = _swiftEmptyArrayStorage;
  uint64_t v0 = sub_67C4(&qword_FF690);
  return CheckedContinuation.resume(returning:)(&v2, v0);
}

uint64_t sub_8894C()
{
  uint64_t v1 = sub_67C4(&qword_FF690);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_889B0(uint64_t a1)
{
  return sub_889BC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_88900);
}

uint64_t sub_889BC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(sub_67C4(&qword_FF690) - 8) + 80LL);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_88A0C()
{
  unint64_t result = qword_FF698;
  if (!qword_FF698)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___MTTimer);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_FF698);
  }

  return result;
}

ValueMetadata *_s25NeedsConfirmationStrategyVMa_1()
{
  return &_s25NeedsConfirmationStrategyVN_1;
}

uint64_t sub_88A60()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF6A0);
  sub_5474(v0, (uint64_t)qword_FF6A0);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_88AA8()
{
  uint64_t v0 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static SiriTimeFeatureFlagsImpl.instance.getter(v2);
  Swift::Bool v5 = SiriTimeFeatureFlagsImpl.isCrossDeviceEnabled()();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if (v5)
  {
    uint64_t v6 = sub_67C4(&qword_FF720);
    uint64_t v7 = (void *)ParameterResolutionRecord.intent.getter(v6);
    id v8 = [v7 targetTimer];

    id v9 = [v8 shouldMatchAny];
    sub_1E6A8();
    v10.super.super.Class isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
    Class isa = v10.super.super.isa;
    if (v9)
    {
      id v12 = v9;
      char v13 = static NSObject.== infix(_:_:)(v12, isa);

      if ((v13 & 1) != 0)
      {
        uint64_t v14 = (void *)ParameterResolutionRecord.intent.getter(v6);
        id v15 = [v14 targetingInfo];

        if (!v15)
        {
          if (qword_FB2A8 != -1) {
            swift_once(&qword_FB2A8, sub_88A60);
          }
          uint64_t v16 = type metadata accessor for Logger(0LL);
          uint64_t v17 = sub_5474(v16, (uint64_t)qword_FF6A0);
          uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
          os_log_type_t v19 = static os_log_type_t.default.getter();
          if (!os_log_type_enabled(v18, v19))
          {
            uint64_t v21 = 1LL;
            goto LABEL_16;
          }

          uint64_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl(&dword_0, v18, v19, "ResolveRecord indicates we are searching for a room confirmation", v20, 2u);
          uint64_t v21 = 1LL;
          goto LABEL_14;
        }
      }
    }

    else
    {
    }
  }

  if (qword_FB2A8 != -1) {
    swift_once(&qword_FB2A8, sub_88A60);
  }
  uint64_t v22 = type metadata accessor for Logger(0LL);
  uint64_t v23 = sub_5474(v22, (uint64_t)qword_FF6A0);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v18, v24))
  {
    uint64_t v21 = 0LL;
    goto LABEL_16;
  }

  uint64_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
  *(_WORD *)uint64_t v20 = 0;
  _os_log_impl(&dword_0, v18, v24, "ResolveRecord not searching for room confirmation", v20, 2u);
  uint64_t v21 = 0LL;
LABEL_14:
  swift_slowDealloc(v20, -1LL, -1LL);
LABEL_16:

  return v21;
}

uint64_t sub_88D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = v7 - v6;
  sub_67C4(&qword_FBDB8);
  sub_1BCE0();
  __chkstk_darwin(v9);
  sub_1C308();
  uint64_t v12 = v11 - v10;
  if (qword_FB2A8 != -1) {
    swift_once(&qword_FB2A8, sub_88A60);
  }
  uint64_t v13 = sub_1BD34();
  sub_5474(v13, (uint64_t)qword_FF6A0);
  sub_1BD20();
  os_log_type_t v14 = sub_1BCD0();
  if (os_log_type_enabled(v2, v14))
  {
    id v15 = (uint8_t *)sub_1B9DC();
    *(_WORD *)id v15 = 0;
    sub_1BBEC(&dword_0, v2, v14, "ResetTimer.NeedsConfirmationStrategy.actionForInput() called)", v15);
    sub_1B904((uint64_t)v15);
  }

  uint64_t v16 = type metadata accessor for HALTimerDeviceContext(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v12, 1LL, 1LL, v16);
  char v17 = sub_88AA8();
  uint64_t v18 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  os_log_type_t v19 = (unsigned int *)&enum case for DecideAction.PromptExpectation.roomConfirmation(_:);
  if ((v17 & 1) == 0) {
    os_log_type_t v19 = (unsigned int *)&enum case for DecideAction.PromptExpectation.confirmation(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 104LL))(v8, *v19, v18);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v8, 0LL, 1LL, v18);
  sub_3B648(a1, v12, 0, v8, a2);
  sub_DABC(v8, (uint64_t *)&unk_FCC70);
  return sub_DABC(v12, &qword_FBDB8);
}

uint64_t sub_88F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  uint64_t v5 = sub_67C4(&qword_FBDB0);
  v4[11] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ActionForInput(0LL);
  v4[12] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[13] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[14] = swift_task_alloc(v8);
  v4[15] = swift_task_alloc(v8);
  return swift_task_switch(sub_88FDC, 0LL, 0LL);
}

uint64_t sub_88FDC()
{
  if (qword_FB2A8 != -1) {
    swift_once(&qword_FB2A8, sub_88A60);
  }
  uint64_t v1 = sub_1BD34();
  sub_5474(v1, (uint64_t)qword_FF6A0);
  uint64_t v2 = (os_log_s *)sub_1BD20();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v4 = 0;
    sub_1BBEC(&dword_0, v2, v3, "ResetTimer.NeedsConfirmationStrategy.parseConfirmationResponse() called", v4);
    sub_1B904((uint64_t)v4);
  }

  uint64_t v5 = sub_67C4(&qword_FF720);
  uint64_t v6 = (void *)ParameterResolutionRecord.result.getter(v5);
  id v7 = [v6 itemToConfirm];

  sub_8AF90();
  swift_unknownObjectRelease(v7);
  uint64_t v8 = type metadata accessor for SiriTimer(0LL);
  if (sub_691C8((uint64_t)(v0 + 6), v9, (uint64_t)&type metadata for Any + 8, v8))
  {
    uint64_t v10 = (void *)v0[6];
    uint64_t v11 = (void *)ParameterResolutionRecord.intent.getter(v5);
    [v11 setTargetTimer:v10];
    if ((sub_88AA8() & 1) != 0)
    {
      uint64_t v12 = v0[8];
      sub_70A20();
      sub_71C70(v12, v13, v14, v15, v16, v17, v18, v19, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50);
      __asm { BR              X10 }
    }

    uint64_t v32 = v0[11];
    uint64_t v33 = enum case for ConfirmationResponse.confirmed(_:);
    uint64_t v34 = type metadata accessor for ConfirmationResponse(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104LL))(v32, v33, v34);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v32, 0LL, 1LL, v34);
    id v35 = v11;
    uint64_t v36 = INIntent.withEndpointId.getter();

    uint64_t v37 = type metadata accessor for ResetTimerIntent(0LL);
    NeedsConfirmationAnswer.init(answeredValue:updatedIntent:)(v32, v36, v37);

    swift_task_dealloc();
    sub_1BABC();
    sub_1B86C();
    uint64_t v31 = (uint64_t (*)(void))sub_1BB00();
  }

  else
  {
    uint64_t v21 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v22 = sub_1E324();
    uint64_t v23 = sub_1B74C(v21, v22);
    *os_log_type_t v24 = 3;
    sub_64328(v23, (uint64_t)v24, v25, v26, v27, v28, v29, v30);
    sub_1BABC();
    sub_1B86C();
    sub_1BA14();
    uint64_t v31 = (uint64_t (*)(void))v0[1];
  }

  return v31();
}

uint64_t sub_89514()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_FF734);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_6CCEC(v1);
  return sub_88F44(v2, v3, v4);
}

uint64_t sub_8956C()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_895A8()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(115LL, 0x80000000000C9490LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_89610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a1;
  v3[8] = a3;
  uint64_t v4 = type metadata accessor for TemplatingResult(0LL);
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = sub_1B970();
  v3[12] = sub_1B970();
  v3[13] = sub_1B970();
  uint64_t v5 = type metadata accessor for CATOption(0LL);
  v3[14] = sub_1B6C8(*(void *)(v5 - 8));
  uint64_t v6 = sub_1BD34();
  v3[15] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[16] = v7;
  v3[17] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[18] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[19] = v9;
  v3[20] = sub_1B6C8(v9);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[21] = v10;
  v3[22] = *(void *)(v10 - 8);
  v3[23] = sub_1B970();
  v3[24] = sub_1B970();
  v3[25] = sub_1B970();
  uint64_t v11 = type metadata accessor for NLContextUpdate(0LL);
  v3[26] = v11;
  v3[27] = *(void *)(v11 - 8);
  v3[28] = sub_1B970();
  v3[29] = sub_1B970();
  v3[30] = sub_1B970();
  uint64_t v12 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v3[31] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[32] = v13;
  v3[33] = sub_1B6C8(v13);
  uint64_t v14 = type metadata accessor for DialogPhase(0LL);
  v3[34] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[35] = v15;
  v3[36] = sub_1B6C8(v15);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_89764()
{
  if (qword_FB2A8 != -1) {
    swift_once(&qword_FB2A8, sub_88A60);
  }
  uint64_t v1 = sub_5474(v0[15], (uint64_t)qword_FF6A0);
  uint64_t v2 = (os_log_s *)sub_1BD20();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v4 = 0;
    sub_1BBEC(&dword_0, v2, v3, "ResetTimer.NeedsConfirmationStrategy.makePromptForConfirmation() called", v4);
    sub_1B904((uint64_t)v4);
  }

  uint64_t v5 = sub_67C4(&qword_FF720);
  uint64_t v6 = (void *)ParameterResolutionRecord.result.getter(v5);
  id v7 = [v6 itemToConfirm];

  sub_8AF90();
  swift_unknownObjectRelease(v7);
  uint64_t v8 = type metadata accessor for SiriTimer(0LL);
  uint64_t v10 = sub_691C8((uint64_t)(v0 + 6), v9, (uint64_t)&type metadata for Any + 8, v8);
  if (!(_DWORD)v10)
  {
    uint64_t v30 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v31 = sub_1E324();
    uint64_t v32 = sub_1B74C(v30, v31);
    _BYTE *v33 = 3;
    uint64_t v149 = v32;
    sub_64328(v32, (uint64_t)v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_12;
  }

  uint64_t v11 = (void *)v0[6];
  v0[37] = v11;
  uint64_t v12 = static DialogPhase.confirmation.getter(v10);
  static SiriTimeFeatureFlagsImpl.instance.getter(v12);
  Swift::Bool v13 = SiriTimeFeatureFlagsImpl.isCrossDeviceEnabled()();
  sub_8AF58();
  if (v13)
  {
    id v14 = [v11 shouldMatchAny];
    sub_32A64();
    v15.super.super.Class isa = sub_690FC().super.super.isa;
    Class isa = v15.super.super.isa;
    if (v14)
    {
      id v17 = v14;
      char v18 = static NSObject.== infix(_:_:)(v17, isa);

      if ((v18 & 1) != 0)
      {
        uint64_t v19 = (void *)sub_8AF64();
        id v20 = [v19 targetingInfo];

        if (!v20)
        {
          uint64_t v22 = v0[19];
          uint64_t v21 = v0[20];
          uint64_t v24 = v0[17];
          uint64_t v23 = v0[18];
          uint64_t v25 = v0[16];
          uint64_t v26 = v0[14];
          sub_A9614();
          (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))( v21,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v23);
          sub_8AF70(v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16));
          uint64_t v27 = mach_absolute_time();
          SiriTimeMeasurement.init(_:log:startTime:)(v21, v24, v27);
          type metadata accessor for ResetTimerCATsSimple(0LL);
          static CATOption.defaultMode.getter();
          v0[38] = CATWrapperSimple.__allocating_init(options:globals:)(v26, 0LL);
          uint64_t v28 = (void *)swift_task_alloc(dword_FBDDC);
          v0[39] = v28;
          *uint64_t v28 = v0;
          v28[1] = sub_8A058;
          sub_2B904();
          return sub_1BFA8();
        }
      }
    }

    else
    {
    }

    id v73 = [v11 device];

    if (v73)
    {
      uint64_t v75 = v0[19];
      uint64_t v74 = v0[20];
      uint64_t v77 = v0[17];
      uint64_t v76 = v0[18];
      uint64_t v79 = v0[15];
      uint64_t v78 = v0[16];
      uint64_t v80 = v0[14];
      sub_A9100();
      (*(void (**)(uint64_t, void, uint64_t))(v75 + 104))( v74,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v76);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16))(v77, v1, v79);
      uint64_t v81 = mach_absolute_time();
      SiriTimeMeasurement.init(_:log:startTime:)(v74, v77, v81);
      type metadata accessor for TimerBaseCATsSimple(0LL);
      static CATOption.defaultMode.getter();
      v0[43] = CATWrapperSimple.__allocating_init(options:globals:)(v80, 0LL);
      sub_D378();
      v0[44] = v82;
      os_log_type_t v83 = (void *)swift_task_alloc(dword_FDA94);
      v0[45] = v83;
      *os_log_type_t v83 = v0;
      v83[1] = sub_8A1F8;
      sub_2B904();
      return sub_5A800(v84);
    }
  }

  sub_A9100();
  static SiriTimeFeatureFlagsImpl.instance.getter(v85);
  Swift::Bool v86 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  uint64_t v87 = sub_8AF58();
  if (v86)
  {
    uint64_t v88 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v87);

    object = AceObject.serializeToBase64()().value._object;
    v0[49] = object;
    if (object)
    {
      uint64_t v92 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v91);
      uint64_t v94 = v93;

      char v95 = AceObject.serializeToBase64()().value._object;
      v0[50] = v95;
      if (v95)
      {
        v163 = v11;
        uint64_t v96 = v0[20];
        uint64_t v97 = v0[17];
        uint64_t v98 = v0[16];
        (*(void (**)(uint64_t, void, void))(v0[19] + 104LL))( v96,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[18]);
        sub_8AF70(v97, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v98 + 16));
        uint64_t v99 = mach_absolute_time();
        SiriTimeMeasurement.init(_:log:startTime:)(v96, v97, v99);
        uint64_t v100 = (void *)ParameterResolutionRecord.intent.getter(v5);
        id v101 = [v100 targetTimer];

        id v102 = [v101 shouldMatchAny];
        sub_32A64();
        v103.super.super.Class isa = sub_690FC().super.super.isa;
        Class v104 = v103.super.super.isa;
        if (v102)
        {
          char v105 = sub_8AF7C((uint64_t)v102);

          uint64_t v106 = v163;
          if ((v105 & 1) != 0)
          {
            if (qword_FB1A0 != -1) {
              swift_once(&qword_FB1A0, sub_437B0);
            }
            uint64_t v107 = unk_FD0DC;
            sub_8AF2C();
            swift_bridgeObjectRetain(v95);
            uint64_t v108 = (void *)swift_task_alloc(v107);
            v0[51] = v108;
            sub_8AF40(v108, (uint64_t)sub_8A390);
            sub_2B904();
            __asm { BR              X5 }
          }
        }

        else
        {

          uint64_t v106 = v163;
        }

        if (qword_FB1A0 != -1) {
          swift_once(&qword_FB1A0, sub_437B0);
        }
        uint64_t v141 = unk_FD0E4;
        sub_8AF2C();
        swift_bridgeObjectRetain(v95);
        id v142 = v106;
        v143 = (void *)swift_task_alloc(v141);
        v0[53] = v143;
        sub_8AF40(v143, (uint64_t)sub_8A41C);
        sub_2B904();
        __asm { BR              X6 }
      }

      uint64_t v91 = swift_bridgeObjectRelease(object);
    }

    uint64_t v122 = (os_log_s *)Logger.logObject.getter(v91);
    os_log_type_t v123 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v122, v123))
    {
      uint64_t v124 = (uint8_t *)sub_1B9DC();
      *(_WORD *)uint64_t v124 = 0;
      sub_1BBEC(&dword_0, v122, v123, "Could not create direct invocation for confirm or reject actions.", v124);
      sub_1B904((uint64_t)v124);
    }

    uint64_t v125 = v0[35];
    uint64_t v126 = v0[36];
    uint64_t v127 = v0[34];
    uint64_t v129 = v0[27];
    uint64_t v128 = v0[28];
    uint64_t v130 = v0[26];

    uint64_t v131 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v132 = sub_1E324();
    uint64_t v133 = sub_1B74C(v131, v132);
    *uint64_t v134 = 0;
    uint64_t v149 = v133;
    sub_64328(v133, (uint64_t)v134, v135, v136, v137, v138, v139, v140);

    (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v128, v130);
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v126, v127);
LABEL_12:
    uint64_t v153 = v0[14];
    uint64_t v157 = v0[13];
    uint64_t v160 = v0[12];
    uint64_t v162 = v0[11];
    swift_task_dealloc();
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    uint64_t v40 = sub_1BABC();
    uint64_t v48 = sub_1B8C4(v40, v41, v42, v43, v44, v45, v46, v47, v145, v149, v153);
    uint64_t v56 = sub_1B8BC(v48, v49, v50, v51, v52, v53, v54, v55, v146, v150, v154, v157);
    uint64_t v64 = sub_1B8B4(v56, v57, v58, v59, v60, v61, v62, v63, v147, v151, v155, v158, v160);
    sub_1B864(v64, v65, v66, v67, v68, v69, v70, v71, v148, v152, v156, v159, v161, v162);
    sub_2B904();
    __asm { BR              X0 }
  }

  uint64_t v110 = (void *)sub_8AF64();
  id v111 = [v110 targetTimer];

  id v112 = [v111 shouldMatchAny];
  sub_32A64();
  v113.super.super.Class isa = sub_690FC().super.super.isa;
  Class v114 = v113.super.super.isa;
  if (v112)
  {
    char v115 = sub_8AF7C((uint64_t)v112);

    if ((v115 & 1) != 0)
    {
      if (qword_FB198 != -1) {
        swift_once(&qword_FB198, sub_43794);
      }
      uint64_t v116 = (void *)swift_task_alloc(dword_FBE8C);
      v0[58] = v116;
      *uint64_t v116 = v0;
      v116[1] = sub_8A5AC;
      sub_2B904();
      return sub_1E8D4(v117);
    }
  }

  else
  {
  }

  if (qword_FB198 != -1) {
    swift_once(&qword_FB198, sub_43794);
  }
  sub_D378();
  v0[60] = v118;
  uint64_t v119 = (void *)swift_task_alloc(dword_FBE94);
  v0[61] = v119;
  *uint64_t v119 = v0;
  v119[1] = sub_8A690;
  sub_2B904();
  return sub_1E99C(v120, v121);
}

uint64_t sub_8A058(uint64_t a1)
{
  char v18 = (void *)*v2;
  uint64_t v4 = v18;
  sub_1BC0C(&v18);
  v4[40] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    sub_1B9B8();
    return swift_task_switch(v5, v6, v7);
  }

  else
  {
    v4[41] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)[1]);
    v4[42] = v9;
    *uint64_t v9 = v2;
    v9[1] = sub_8A10C;
    sub_69130();
    return DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17);
  }

uint64_t sub_8A10C()
{
  uint64_t v1 = *(void **)(v0 + 328);
  sub_2B4F0(*(void *)(v0 + 336));

  sub_1B9B8();
  return sub_1B758();
}

#error "8A1B8: call analysis failed (funcsize=45)"
uint64_t sub_8A1F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  sub_2F748();
  sub_1BC0C(v4);
  v3[46] = v1;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v1)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    v3[47] = v0;
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)[1]);
    v3[48] = v6;
    *uint64_t v6 = v2;
    v6[1] = sub_8A2A4;
    sub_69130();
    return DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  }

uint64_t sub_8A2A4()
{
  uint64_t v1 = *(void **)(v0 + 376);
  sub_2B4F0(*(void *)(v0 + 384));

  sub_1B9B8();
  return sub_1B758();
}

#error "8A350: call analysis failed (funcsize=45)"
uint64_t sub_8A390()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  sub_2F748();
  sub_1BC0C(v3);
  v2[52] = v1;
  swift_task_dealloc();
  uint64_t v4 = v2[49];
  swift_bridgeObjectRelease(v2[50]);
  swift_bridgeObjectRelease(v4);
  if (v1)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    v2[55] = v0;
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[56] = v6;
    sub_8AED8(v6);
    return sub_2F668();
  }

uint64_t sub_8A41C()
{
  v2[54] = v1;
  swift_task_dealloc();
  uint64_t v4 = v2[49];
  swift_bridgeObjectRelease(v2[50]);
  swift_bridgeObjectRelease(v4);
  if (v1)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    v2[55] = v0;
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[56] = v6;
    sub_8AED8(v6);
    return sub_2F668();
  }

uint64_t sub_8A4A8()
{
  *uint64_t v2 = *v1;
  *(void *)(v3 + 456) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "8A56C: call analysis failed (funcsize=45)"
uint64_t sub_8A5AC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  sub_1BBF4();
  *uint64_t v2 = *v1;
  *(void *)(v3 + 472) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "8A650: call analysis failed (funcsize=37)"
uint64_t sub_8A690()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v4 = *v1;
  uint64_t v2 = v4;
  sub_1BC0C(&v4);
  *(void *)(v2 + 496) = v0;
  swift_task_dealloc();
  swift_release();
  sub_1B9B8();
  return sub_2B44C();
}

#error "8A748: call analysis failed (funcsize=38)"
#error "8A800: call analysis failed (funcsize=37)"
#error "8A894: call analysis failed (funcsize=37)"
#error "8A910: call analysis failed (funcsize=31)"
#error "8A98C: call analysis failed (funcsize=31)"
#error "8AA34: call analysis failed (funcsize=42)"
#error "8AAA8: call analysis failed (funcsize=29)"
#error "8AB1C: call analysis failed (funcsize=29)"
uint64_t sub_8AB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  sub_67C4(&qword_FBD98);
  sub_1BCE0();
  __chkstk_darwin(v10);
  sub_1C308();
  uint64_t v13 = v12 - v11;
  swift_bridgeObjectRetain(a3);
  SpeakableString.init(serializedValue:)(a2, a3);
  type metadata accessor for SpeakableString(0LL);
  sub_69174();
  uint64_t v14 = type metadata accessor for ResetTimerPromptResetAllParameters(0LL);
  sub_1B4F4(v13, a1 + *(int *)(v14 + 20));
  swift_bridgeObjectRetain(a5);
  SpeakableString.init(serializedValue:)(a4, a5);
  sub_69174();
  return sub_1B4F4(v13, a1);
}

uint64_t sub_8AC08()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_FF71C);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_6CCEC(v1);
  return sub_89610(v2, v3, v4);
}

uint64_t sub_8AC60()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_8AC9C()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(123LL, 0x80000000000C9410LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_8AD08()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_FF72C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_C630;
  return sub_89514();
}

uint64_t sub_8AD70()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_FF714);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2A040;
  return sub_8AC08();
}

unint64_t sub_8ADDC()
{
  unint64_t result = qword_FF6C8[0];
  if (!qword_FF6C8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_C4CAC, &_s25NeedsConfirmationStrategyVN_1);
    atomic_store(result, qword_FF6C8);
  }

  return result;
}

uint64_t sub_8AE18()
{
  return swift_task_dealloc(*(void *)(v0 + 288));
}

void sub_8AE58()
{
}

void sub_8AEB0(void *a1@<X8>)
{
}

uint64_t sub_8AED8(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v3 + 56);
}

void sub_8AEFC()
{
}

void sub_8AF18()
{
}

uint64_t sub_8AF2C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_8AF40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_8AF58()
{
  return v2(v0, v1);
}

uint64_t sub_8AF64()
{
  return ParameterResolutionRecord.intent.getter(v0);
}

uint64_t sub_8AF70@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2, v3);
}

uint64_t sub_8AF7C(uint64_t a1)
{
  return static NSObject.== infix(_:_:)(a1, v1);
}

id sub_8AF88(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_8AF90()
{
  return _bridgeAnyObjectToAny(_:)(v0);
}

void *sub_8AF9C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v12);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for HALTimerDeviceContext(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return v4;
}

uint64_t sub_8B044(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for HALTimerDeviceContext(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_8B088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for HALTimerDeviceContext(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

void *sub_8B0FC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for HALTimerDeviceContext(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24LL))(v7, v8, v9);
  return a1;
}

uint64_t sub_8B15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for HALTimerDeviceContext(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
  return a1;
}

uint64_t sub_8B1C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for HALTimerDeviceContext(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_8B230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8B23C);
}

uint64_t sub_8B23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_46210();
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1 + *(int *)(a3 + 20), a2, v8);
  }

uint64_t sub_8B2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8B2B8);
}

uint64_t sub_8B2B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_46210();
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

uint64_t _s21ConfirmIntentStrategyVMa(uint64_t a1)
{
  uint64_t result = qword_FF7B0;
  if (!qword_FF7B0) {
    return swift_getSingletonMetadata(a1, &_s21ConfirmIntentStrategyVMn);
  }
  return result;
}

uint64_t sub_8B358(uint64_t a1)
{
  v4[0] = "(";
  uint64_t result = type metadata accessor for HALTimerDeviceContext(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_8B3CC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF740);
  sub_5474(v0, (uint64_t)qword_FF740);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_8B414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_67C4((uint64_t *)&unk_FCC70);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_67C4(&qword_FBDB8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_FB2B0 != -1) {
    swift_once(&qword_FB2B0, sub_8B3CC);
  }
  uint64_t v11 = sub_1BD34();
  sub_39658(v11, (uint64_t)qword_FF740);
  os_log_type_t v12 = sub_1BCD0();
  if (os_log_type_enabled(v2, v12))
  {
    uint64_t v13 = (uint8_t *)sub_1BA1C(2LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v2, v12, "DismissTimer.ConfirmIntentStrategy.actionForInput() called.", v13, 2u);
    sub_1B904((uint64_t)v13);
  }

  uint64_t v14 = sub_46210();
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v10, 1LL, 1LL, v14);
  uint64_t v15 = enum case for DecideAction.PromptExpectation.confirmation(_:);
  uint64_t v16 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104LL))(v7, v15, v16);
  sub_8E3CC((uint64_t)v7, 0LL);
  sub_3B670(a1, (uint64_t)v10, 0, (uint64_t)v7, a2);
  sub_DABC((uint64_t)v7, (uint64_t *)&unk_FCC70);
  return sub_DABC((uint64_t)v10, &qword_FBDB8);
}

uint64_t sub_8B5DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[25] = a2;
  v3[26] = a3;
  v3[24] = a1;
  uint64_t v4 = type metadata accessor for Input(0LL);
  v3[27] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[28] = v5;
  v3[29] = sub_1B6C8(v5);
  uint64_t v6 = sub_1BD34();
  v3[30] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[31] = v7;
  v3[32] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for DirectInvocationUtils.Timer.UserInfoKey(0LL);
  v3[33] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[34] = v9;
  v3[35] = sub_2B4DC(v9);
  v3[36] = sub_1B970();
  uint64_t v10 = type metadata accessor for Parse.DirectInvocation(0LL);
  v3[37] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[38] = v11;
  v3[39] = sub_2B4DC(v11);
  v3[40] = sub_1B970();
  v3[41] = sub_1B970();
  v3[42] = sub_1B970();
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  v3[43] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[44] = v13;
  v3[45] = sub_2B4DC(v13);
  v3[46] = sub_1B970();
  v3[47] = sub_1B970();
  v3[48] = sub_1B970();
  uint64_t v14 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  v3[49] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[50] = v15;
  v3[51] = sub_1B6C8(v15);
  uint64_t v16 = type metadata accessor for USOParse(0LL);
  v3[52] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v3[53] = v17;
  v3[54] = sub_1B6C8(v17);
  uint64_t v18 = type metadata accessor for ConfirmationResponse(0LL);
  v3[55] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v3[56] = v19;
  v3[57] = sub_2B4DC(v19);
  v3[58] = sub_1B970();
  v3[59] = sub_1B970();
  v3[60] = sub_1B970();
  uint64_t v20 = sub_67C4(&qword_FBDB0);
  v3[61] = sub_2B4DC(*(void *)(v20 - 8));
  v3[62] = sub_1B970();
  v3[63] = sub_1B970();
  v3[64] = sub_1B970();
  v3[65] = sub_1B970();
  v3[66] = sub_1B970();
  uint64_t v21 = type metadata accessor for TimerNLv3Intent(0LL);
  v3[67] = v21;
  v3[68] = sub_2B4DC(*(void *)(v21 - 8));
  v3[69] = sub_1B970();
  v3[70] = sub_1B970();
  uint64_t v22 = type metadata accessor for Parse(0LL);
  v3[71] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v3[72] = v23;
  v3[73] = sub_2B4DC(v23);
  v3[74] = sub_1B970();
  uint64_t v24 = type metadata accessor for NLIntent(0LL);
  v3[75] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  v3[76] = v25;
  v3[77] = sub_1B6C8(v25);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_8B7E0()
{
  unint64_t v1 = v0;
  unint64_t v2 = v0 + 136;
  unint64_t v3 = (uint64_t *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 592);
  uint64_t v5 = *(void *)(v0 + 576);
  uint64_t v6 = *(void *)(v1 + 568);
  uint64_t v7 = *(uint64_t **)(v1 + 200);
  uint64_t v8 = sub_67C4(&qword_FF850);
  uint64_t v9 = IntentResolutionRecord.intent.getter(v8);
  Input.parse.getter(v9);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6);
  uint64_t v450 = v1;
  if (v10 == enum case for Parse.NLv3IntentOnly(_:))
  {
    (*(void (**)(void, void))(*(void *)(v1 + 576) + 96LL))( *(void *)(v1 + 592),  *(void *)(v1 + 568));
    goto LABEL_5;
  }

  if (v10 != enum case for Parse.NLv3IntentPlusServerConversion(_:))
  {
    if (v10 != enum case for Parse.directInvocation(_:))
    {
      uint64_t v93 = (uint8_t *)(v1 + 128);
      if (v10 == enum case for Parse.NLv4IntentOnly(_:))
      {
        v444 = (uint64_t *)(v1 + 176);
        sub_8E41C();
        uint64_t v94 = *(void *)(v1 + 520);
        uint64_t v95 = *(void *)(v1 + 440);
        sub_1E7C4(v96);
        uint64_t v97 = *v7;
        sub_5E3D0(v94, 1LL);
        uint64_t v98 = objc_opt_self(&OBJC_CLASS___SIRINLUUserAccepted);
        if (sub_8E410(v98) || (uint64_t v99 = objc_opt_self(&OBJC_CLASS___SIRINLUUserWantedToProceed), sub_8E410(v99)))
        {
          uint64_t v438 = v9;
          sub_8E44C();
          if (!v357) {
            swift_once(&qword_FB2B0, sub_8B3CC);
          }
          sub_5474(*(void *)(v1 + 240), (uint64_t)qword_FF740);
          uint64_t v100 = sub_8E4C0();
          id v101 = (os_log_s *)Logger.logObject.getter(v100);
          os_log_type_t v102 = static os_log_type_t.default.getter();
          uint64_t v95 = v102;
          if (os_log_type_enabled(v101, v102))
          {
            NSNumber v103 = (uint8_t *)sub_1BA1C(12LL);
            uint64_t v104 = sub_1BA1C(32LL);
            v451[0] = v104;
            *(_DWORD *)NSNumber v103 = 136315138;
            sub_8E4D0();
            sub_67C4(&qword_FCD00);
            uint64_t v105 = sub_8E550();
            unint64_t v107 = v106;
            *(void *)(v1 + 120) = sub_4351C(v105, v106);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 120, v1 + 128, v103 + 4, v103 + 12);
            swift_bridgeObjectRelease(v107);
            sub_8E3D8();
            sub_1E7D8(&dword_0, v101, (os_log_type_t)v95, "Received UserDialogAct - %s", v103);
            sub_1E7D0(v104);
            sub_1B904(v104);
            sub_1B904((uint64_t)v103);
          }

          else
          {

            uint64_t v108 = sub_8E3D8();
          }

          sub_7C258(v108, &qword_FBDB0);
          uint64_t v151 = *(void *)(v1 + 520);
          uint64_t v152 = *(void *)(v1 + 440);
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v1 + 448) + 104LL))( v151,  enum case for ConfirmationResponse.confirmed(_:),  v152);
          _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v151, 0LL, 1LL, v152);
          uint64_t v9 = v438;
        }

        uint64_t v153 = objc_opt_self(&OBJC_CLASS___SIRINLUUserRejected);
        if (sub_8E410(v153))
        {
          sub_8E44C();
          if (!v357) {
            swift_once(&qword_FB2B0, sub_8B3CC);
          }
          sub_39658(*(void *)(v1 + 240), (uint64_t)qword_FF740);
          os_log_type_t v154 = sub_1BCD0();
          if (sub_1BB80(v154))
          {
            uint64_t v155 = (_WORD *)sub_1BA1C(2LL);
            sub_2BA04(v155);
            sub_1BAA8(&dword_0, v156, v157, "Received UserDialogAct - UserRejected");
            sub_1B904(v95);
          }

          sub_8E4DC();
          uint64_t v159 = sub_8E32C(v158, &qword_FBDB0);
          sub_8E2F4(v159, enum case for ConfirmationResponse.rejected(_:));
          sub_8E2E0();
        }

        uint64_t v160 = objc_opt_self(&OBJC_CLASS___SIRINLUUserCancelled);
        if (sub_8E410(v160))
        {
          sub_8E44C();
          if (!v357) {
            swift_once(&qword_FB2B0, sub_8B3CC);
          }
          sub_39658(*(void *)(v1 + 240), (uint64_t)qword_FF740);
          os_log_type_t v161 = sub_1BCD0();
          if (sub_1BB80(v161))
          {
            uint64_t v162 = (_WORD *)sub_1BA1C(2LL);
            sub_2BA04(v162);
            sub_1BAA8(&dword_0, v163, v164, "Received UserDialogAct - UserCancelled");
            sub_1B904(v95);
          }

          sub_8E4DC();
          uint64_t v166 = sub_8E32C(v165, &qword_FBDB0);
          sub_8E2F4(v166, enum case for ConfirmationResponse.rejected(_:));
          sub_8E2E0();
        }

        v167 = *(void **)(v1 + 512);
        sub_8E584(*(void *)(v1 + 520));
        sub_8E42C();
        if (!v357)
        {
          uint64_t v179 = *(void *)(v1 + 528);
          uint64_t v180 = *(void *)(v1 + 480);
          uint64_t v181 = *(void *)(v1 + 440);
          uint64_t v22 = *(void *)(v1 + 448);
          sub_59EF4(v180, *(void *)(v1 + 512), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 32));
          sub_59EF4(v179, v180, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16));
          sub_8E3CC(v179, 0LL);
          uint64_t v182 = sub_8E48C();
          sub_8E478(v182);
          swift_unknownObjectRelease(v97);
          uint64_t v183 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v180, v181);
          sub_8E32C(v183, &qword_FBDB0);
          goto LABEL_20;
        }

        unint64_t v168 = v1 + 624;
        sub_DABC(*(void *)(v1 + 512), &qword_FBDB0);
        sub_8E44C();
        if (!v357) {
          swift_once(&qword_FB2B0, sub_8B3CC);
        }
        sub_5474(*(void *)(v1 + 240), (uint64_t)qword_FF740);
        uint64_t v169 = sub_8E4C0();
        Logger.logObject.getter(v169);
        os_log_type_t v170 = sub_32A5C();
        if (sub_1BB80(v170))
        {
          v171 = (_DWORD *)sub_1BA1C(12LL);
          uint64_t v172 = sub_1BA1C(32LL);
          v451[0] = v172;
          _DWORD *v171 = 136315138;
          uint64_t v9 = (uint64_t)(v171 + 3);
          sub_8E4D0();
          sub_67C4(&qword_FCD00);
          uint64_t v173 = sub_8E550();
          unint64_t v175 = v174;
          uint64_t *v444 = sub_4351C(v173, v174);
          sub_8E544((uint64_t)v444, v1 + 184, (uint64_t)(v171 + 1));
          unint64_t v176 = v175;
          unint64_t v168 = v1 + 624;
          swift_bridgeObjectRelease(v176);
          sub_8E3D8();
          sub_8E354(&dword_0, v177, v178, "Received unsupported userDialogAct for confirmation: %s");
          sub_1E7D0(v172);
          sub_1B904(v172);
          sub_1B904((uint64_t)v171);
        }

        else
        {
          sub_8E3D8();
        }

        *(_BYTE *)(v1 + 624) = 0;
        uint64_t v199 = sub_67C4((uint64_t *)&unk_FF830);
        unint64_t v200 = sub_1E324();
        uint64_t v184 = sub_1B74C(v199, v200);
        unint64_t v201 = sub_8E310();
        uint64_t v203 = static BarbaraWalters.logAndReturnError<A>(context:_:)(v201, v202, v168, v199, v200);
        uint64_t v381 = v184;
        swift_willThrow(v203, v204, v205, v206, v207, v208, v209, v210);

        uint64_t v211 = swift_unknownObjectRelease(v97);
        sub_7C258(v211, &qword_FBDB0);
      }

      else
      {
        if (v10 == enum case for Parse.uso(_:))
        {
          v440 = (void *)v9;
          uint64_t v443 = v1 + 176;
          sub_8E41C();
          uint64_t v115 = *(void *)(v1 + 504);
          uint64_t v117 = *(void *)(v1 + 432);
          uint64_t v116 = *(void *)(v1 + 440);
          uint64_t v118 = *(void *)(v1 + 424);
          uint64_t v119 = *(void *)(v1 + 400);
          sub_1E7C4(v120);
          uint64_t v121 = sub_59EF4(v117, (uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v118 + 32));
          uint64_t v122 = USOParse.userParse.getter(v121);
          uint64_t v123 = Siri_Nlu_External_UserParse.userDialogActs.getter(v122);
          sub_2080C(*(uint64_t (**)(uint64_t, uint64_t))(v119 + 8));
          sub_5E3D0(v115, 1LL);
          uint64_t v124 = *(void *)(v123 + 16);
          if (v124)
          {
            uint64_t v125 = *(void *)(v1 + 352);
            unint64_t v126 = v123
                 + ((*(unsigned __int8 *)(v125 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80));
            uint64_t v9 = *(void *)(v125 + 72);
            unint64_t v1 = *(void *)(v125 + 16);
            uint64_t v433 = v123;
            sub_2BC5C();
            unint64_t v127 = v126;
            uint64_t v447 = v124;
            while (1)
            {
              uint64_t v128 = sub_8E368(v450);
              uint64_t v129 = Siri_Nlu_External_UserDialogAct.hasAccepted.getter(v128);
              unint64_t v3 = *(uint64_t **)(v125 + 8);
              uint64_t v130 = sub_8E46C();
              if ((v129 & 1) != 0) {
                break;
              }
              v127 += v9;
              if (!--v124)
              {
                sub_8E3F4( v130,  v131,  v132,  v133,  v134,  v135,  v136,  v137,  v375,  v381,  v387,  v393,  v397,  v399,  v401,  v403,  v405,  v407,  v409,  v411,  v413,  v415,  v418,  v421,  v425,  v433);
                goto LABEL_87;
              }
            }

            sub_8E3F4( v130,  v131,  v132,  v133,  v134,  v135,  v136,  v137,  v375,  v381,  v387,  v393,  v397,  v399,  v401,  v403,  v405,  v407,  v409,  v411,  v413,  v415,  v418,  v421,  v425,  v433);
            if (qword_FB2B0 != -1) {
              swift_once(&qword_FB2B0, sub_8B3CC);
            }
            sub_39658(*(void *)(v450 + 240), (uint64_t)qword_FF740);
            os_log_type_t v236 = sub_1BCD0();
            if (sub_1BB80(v236))
            {
              v237 = (_WORD *)sub_1BA1C(2LL);
              sub_2BA04(v237);
              sub_1BAA8(&dword_0, v238, v239, "USO parse userDialogActs contains hasAccepted; response is .confirmed.)");
              sub_1B904(v116);
            }

            sub_8E3E4();
            uint64_t v241 = sub_8E32C(v240, &qword_FBDB0);
            sub_8E2F4(v241, enum case for ConfirmationResponse.confirmed(_:));
            sub_8E2E0();
LABEL_87:
            swift_bridgeObjectRetain(v129);
            while (1)
            {
              uint64_t v242 = sub_8E368(v450);
              uint64_t v243 = Siri_Nlu_External_UserDialogAct.hasWantedToProceed.getter(v242);
              uint64_t v244 = sub_8E46C();
              if ((v243 & 1) != 0) {
                break;
              }
              sub_8E524();
              if (v357)
              {
                sub_8E3F4( v252,  v253,  v254,  v255,  v256,  v257,  v258,  v259,  v378,  v384,  v390,  v395,  v398,  v400,  v402,  v404,  v406,  v408,  v410,  v412,  v414,  v416,  v420,  v423,  v428,  v434);
                goto LABEL_97;
              }
            }

            sub_8E3F4( v244,  v245,  v246,  v247,  v248,  v249,  v250,  v251,  v378,  v384,  v390,  v395,  v398,  v400,  v402,  v404,  v406,  v408,  v410,  v412,  v414,  v416,  v420,  v423,  v428,  v434);
            if (qword_FB2B0 != -1) {
              swift_once(&qword_FB2B0, sub_8B3CC);
            }
            sub_39658(*(void *)(v450 + 240), (uint64_t)qword_FF740);
            os_log_type_t v260 = sub_1BCD0();
            if (sub_1BB80(v260))
            {
              v261 = (_WORD *)sub_1BA1C(2LL);
              sub_2BA04(v261);
              sub_1BAA8( &dword_0,  v262,  v263,  "USO parse userDialogActs contains hasWantedToProceed; response is .confirmed (unexpected!)");
              sub_1B904(v116);
            }

            sub_8E3E4();
            uint64_t v265 = sub_8E32C(v264, &qword_FBDB0);
            sub_8E2F4(v265, enum case for ConfirmationResponse.confirmed(_:));
            sub_8E2E0();
LABEL_97:
            swift_bridgeObjectRetain(v243);
            while (1)
            {
              uint64_t v266 = sub_8E368(v450);
              char v267 = Siri_Nlu_External_UserDialogAct.hasRejected.getter(v266);
              sub_8E46C();
              if ((v267 & 1) != 0) {
                break;
              }
              sub_8E524();
              if (v357)
              {
                uint64_t v268 = v436;
                sub_18034();
                v269 = (void *)&unk_FB000;
                goto LABEL_107;
              }
            }

            swift_bridgeObjectRelease(v436);
            v269 = &unk_FB000;
            if (qword_FB2B0 != -1) {
              swift_once(&qword_FB2B0, sub_8B3CC);
            }
            sub_39658(*(void *)(v450 + 240), (uint64_t)qword_FF740);
            os_log_type_t v270 = sub_1BCD0();
            if (sub_1BB80(v270))
            {
              v271 = (_WORD *)sub_1BA1C(2LL);
              sub_2BA04(v271);
              sub_1BAA8(&dword_0, v272, v273, "USO parse userDialogActs contains hasRejected; response is .rejected.");
              sub_1B904(v116);
            }

            sub_8E3E4();
            uint64_t v275 = sub_8E32C(v274, &qword_FBDB0);
            sub_8E2F4(v275, enum case for ConfirmationResponse.rejected(_:));
            sub_8E2E0();
            uint64_t v268 = v436;
LABEL_107:
            swift_bridgeObjectRetain(v268);
            uint64_t v276 = 0LL;
            while (1)
            {
              uint64_t v277 = v276 + 1;
              if (__OFADD__(v276, 1LL))
              {
                __break(1u);
                goto LABEL_150;
              }

              v278 = *(void **)(v450 + 360);
              uint64_t v279 = ((uint64_t (*)(void *, unint64_t, void))v1)(v278, v126, *(void *)(v450 + 344));
              uint64_t v116 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter(v279);
              uint64_t v280 = sub_8E50C();
              ((void (*)(uint64_t))v3)(v280);
              if ((v116 & 1) != 0) {
                break;
              }
              v126 += v9;
              ++v276;
              if (v277 == v447)
              {
                uint64_t v123 = v436;
                sub_2B758();
                unint64_t v1 = v450;
                goto LABEL_117;
              }
            }

            swift_bridgeObjectRelease(v436);
            if (v269[86] != -1LL) {
              swift_once(&qword_FB2B0, sub_8B3CC);
            }
            unint64_t v1 = v450;
            sub_39658(*(void *)(v450 + 240), (uint64_t)qword_FF740);
            os_log_type_t v281 = sub_1BCD0();
            if (sub_1BB80(v281))
            {
              v282 = (_WORD *)sub_1BA1C(2LL);
              sub_2BA04(v282);
              sub_1BAA8(&dword_0, v283, v284, "USO parse userDialogActs contains hasCancelled; response is .rejected.");
              sub_1B904(v116);
            }

            uint64_t v116 = *(void *)(v450 + 440);

            uint64_t v286 = sub_8E32C(v285, &qword_FBDB0);
            sub_8E2F4(v286, enum case for ConfirmationResponse.rejected(_:));
            sub_8E2E0();
            uint64_t v123 = v436;
          }

LABEL_117:
          sub_8E584(*(void *)(v1 + 504));
          sub_8E42C();
          if (!v357)
          {
            uint64_t v300 = *(void *)(v1 + 528);
            uint64_t v301 = *(void *)(v1 + 496);
            uint64_t v302 = *(void *)(v1 + 472);
            uint64_t v303 = *(void *)(v1 + 440);
            uint64_t v22 = *(void *)(v1 + 448);
            uint64_t v304 = v123;
            uint64_t v305 = *(void *)(v1 + 424);
            uint64_t v306 = *(void *)(v1 + 432);
            uint64_t v307 = *(void *)(v1 + 416);
            swift_bridgeObjectRelease(v304);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v302, v301, v303);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v300, v302, v303);
            _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v300, 0LL, 1LL, v303);
            uint64_t v308 = sub_8E48C();
            ConfirmIntentAnswer.init(confirmationResponse:intent:)(v300, v440, v308);
            uint64_t v309 = sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
            sub_8E32C(v309, &qword_FBDB0);
            (*(void (**)(uint64_t, uint64_t))(v305 + 8))(v306, v307);
            goto LABEL_20;
          }

          unint64_t v287 = v1 + 629;
          sub_DABC(*(void *)(v1 + 496), &qword_FBDB0);
          if (qword_FB2B0 != -1) {
            swift_once(&qword_FB2B0, sub_8B3CC);
          }
          v288 = (void *)sub_5474(*(void *)(v1 + 240), (uint64_t)qword_FF740);
          uint64_t v289 = sub_2BC5C();
          Logger.logObject.getter(v289);
          os_log_type_t v290 = sub_32A5C();
          if (sub_1BB80(v290))
          {
            unint64_t v449 = v1 + 168;
            uint64_t v291 = *(void *)(v1 + 344);
            v292 = (_DWORD *)sub_1BA1C(12LL);
            uint64_t v116 = sub_1BA1C(32LL);
            v451[0] = v116;
            _DWORD *v292 = 136315138;
            uint64_t v293 = sub_2BC5C();
            uint64_t v294 = Array.description.getter(v293, v291);
            unint64_t v296 = v295;
            sub_2B758();
            uint64_t v297 = v294;
            unint64_t v287 = v1 + 629;
            *(void *)(v450 + 168) = sub_683C(v297, v296, v451);
            unint64_t v1 = v450;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v449, v443, v292 + 1, v292 + 3);
            swift_bridgeObjectRelease(v296);
            sub_4C4A8();
            sub_8E354(&dword_0, v298, v299, "Received unsupported userDialogActs for confirmation: %s");
            sub_1E7D0(v116);
            sub_1B904(v116);
            sub_1B904((uint64_t)v292);
          }

          else
          {
            sub_4C4A8();
          }

          uint64_t v184 = *(void *)(v1 + 424);
          uint64_t v310 = *(void *)(v1 + 432);
          uint64_t v311 = *(void *)(v1 + 416);
          *(_BYTE *)(v1 + 629) = 0;
          sub_67C4((uint64_t *)&unk_FF830);
          unint64_t v312 = sub_8E568();
          uint64_t v313 = sub_1B74C(v116, v312);
          unint64_t v314 = sub_8E310();
          uint64_t v316 = static BarbaraWalters.logAndReturnError<A>(context:_:)(v314, v315, v287, v116, v312);
          uint64_t v381 = v313;
          swift_willThrow(v316, v317, v318, v319, v320, v321, v322, v323);

          sub_7C258(v324, &qword_FBDB0);
          v198 = *(void (**)(uint64_t, uint64_t))(v184 + 8);
          uint64_t v196 = v310;
          uint64_t v197 = v311;
        }

        else
        {
          unint64_t v446 = v2;
          sub_8E44C();
          if (!v357) {
            swift_once(&qword_FB2B0, sub_8B3CC);
          }
          uint64_t v141 = *(void *)(v1 + 232);
          uint64_t v142 = *(void *)(v1 + 224);
          uint64_t v143 = *(void *)(v1 + 200);
          sub_5474(*(void *)(v1 + 240), (uint64_t)qword_FF740);
          uint64_t v144 = sub_2C108(v141, v143, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v142 + 16));
          uint64_t v145 = (os_log_s *)Logger.logObject.getter(v144);
          os_log_type_t v146 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v145, v146))
          {
            uint64_t v429 = *(void *)(v1 + 224);
            uint64_t v93 = (uint8_t *)sub_1BA1C(12LL);
            uint64_t v441 = v9;
            uint64_t v147 = sub_1BA1C(32LL);
            v451[0] = v147;
            *(_DWORD *)uint64_t v93 = 136315138;
            Input.parse.getter(v147);
            uint64_t v148 = String.init<A>(describing:)();
            *(void *)(v1 + 128) = sub_4351C(v148, v149);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 128, v446, v93 + 4, v93 + 12);
            sub_2B758();
            sub_43564(*(uint64_t (**)(uint64_t))(v429 + 8));
            sub_1E7D8(&dword_0, v145, v146, "Received not an supported input: %s", v93);
            sub_1E7D0(v147);
            uint64_t v150 = v147;
            uint64_t v9 = v441;
            sub_1B904(v150);
            sub_1B904((uint64_t)v93);
          }

          else
          {
            sub_1BB90(*(void *)(v1 + 224));
          }

          uint64_t v184 = *(void *)(v1 + 576);
          *(_BYTE *)(v1 + 625) = 0;
          sub_67C4((uint64_t *)&unk_FF830);
          unint64_t v185 = sub_8E568();
          sub_1B74C((uint64_t)v93, v185);
          unint64_t v186 = sub_8E310();
          uint64_t v188 = sub_8E4F4(v186, v187, v1 + 625);
          sub_8E55C(v188, v189, v190, v191, v192, v193, v194, v195);

          uint64_t v196 = sub_8E50C();
        }

        v198(v196, v197);
      }

LABEL_126:
      uint64_t v325 = sub_8E37C();
      sub_8E264(v325);
      sub_1BA24();
      sub_1BA14();
      sub_1BA38();
      sub_1B838();
      sub_1BA8C();
      sub_1BA60();
      sub_1BAD0();
      sub_1B86C();
      uint64_t v326 = sub_1BABC();
      uint64_t v334 = sub_1B8C4(v326, v327, v328, v329, v330, v331, v332, v333, v375, v381, v387);
      uint64_t v342 = sub_1B8BC(v334, v335, v336, v337, v338, v339, v340, v341, v379, v385, v391, v393);
      sub_1B8B4(v342, v343, v344, v345, v346, v347, v348, v349, v380, v386, v392, v396, v397);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v66 = *(uint64_t (**)(void))(v184 + 8);
      return v66();
    }

    uint64_t v443 = v1 + 160;
    unint64_t v419 = v1 + 120;
    uint64_t v447 = v1 + 152;
    sub_8E41C();
    uint64_t v68 = *(void *)(v1 + 336);
    uint64_t v69 = *(void *)(v1 + 296);
    uint64_t v70 = *(void *)(v1 + 304);
    sub_1E7C4(v71);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v70 + 32))(v68, v7, v69);
    sub_8E44C();
    if (!v357) {
LABEL_150:
    }
      swift_once(&qword_FB2B0, sub_8B3CC);
    uint64_t v72 = *(void *)(v1 + 328);
    uint64_t v73 = *(void *)(v1 + 336);
    uint64_t v74 = *(void *)(v1 + 296);
    uint64_t v75 = *(void *)(v1 + 304);
    uint64_t v76 = sub_5474(*(void *)(v1 + 240), (uint64_t)qword_FF740);
    uint64_t v77 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v75 + 16);
    uint64_t v78 = v77(v72, v73, v74);
    v427 = (os_log_s *)v76;
    uint64_t v79 = (void *)v76;
    Logger.logObject.getter(v78);
    os_log_type_t v80 = sub_1BCD0();
    BOOL v81 = sub_1BB80(v80);
    uint64_t v82 = *(uint8_t **)(v1 + 328);
    v432 = v3;
    if (v81)
    {
      uint64_t v83 = *(void *)(v1 + 320);
      uint64_t v84 = *(void *)(v1 + 296);
      uint64_t v437 = *(void *)(v1 + 304);
      uint64_t v85 = (_DWORD *)sub_1BA1C(12LL);
      uint64_t v86 = sub_1BA1C(32LL);
      v451[0] = v86;
      *uint64_t v85 = 136315138;
      uint64_t v9 = (uint64_t)(v85 + 3);
      v77(v83, (uint64_t)v82, v84);
      uint64_t v87 = String.init<A>(describing:)();
      *(void *)(v450 + 152) = sub_4351C(v87, v88);
      sub_8E544(v447, v443, (uint64_t)(v85 + 1));
      sub_17E70();
      id v89 = *(void (**)(uint8_t *, uint64_t))(v437 + 8);
      v89(v82, v84);
      sub_8E354(&dword_0, v90, v91, "Handling direct invocation: %s");
      sub_1E7D0(v86);
      uint64_t v92 = v86;
      unint64_t v1 = v450;
      sub_1B904(v92);
      sub_1B904((uint64_t)v85);
    }

    else
    {
      id v89 = *(void (**)(uint8_t *, uint64_t))(*(void *)(v1 + 304) + 8LL);
      v89(v82, *(void *)(v1 + 296));
    }

    static DirectInvocationUtils.siriKitConfirmationResponse(_:)(*(void *)(v1 + 336));
    sub_8E42C();
    if (!v357)
    {
      uint64_t v138 = *(void *)(v1 + 528);
      uint64_t v22 = *(void *)(v1 + 448);
      (*(void (**)(void, void, void))(v22 + 32))( *(void *)(v1 + 464),  *(void *)(v1 + 488),  *(void *)(v1 + 440));
      sub_8E494();
      uint64_t v139 = sub_8E334(v138);
      sub_8E478(v139);
      sub_8E400();
      uint64_t v140 = sub_8E4E8();
      ((void (*)(uint64_t))v89)(v140);
      goto LABEL_20;
    }

    v439 = (void *)v9;
    uint64_t v109 = sub_DABC(*(void *)(v1 + 488), &qword_FBDB0);
    uint64_t v110 = Parse.DirectInvocation.userData.getter(v109);
    v445 = (void (*)(uint64_t, uint64_t))v89;
    if (!v110) {
      goto LABEL_78;
    }
    uint64_t v82 = *(uint8_t **)(v1 + 264);
    uint64_t v111 = sub_8E518(v110, enum case for DirectInvocationUtils.Timer.UserInfoKey.buttonPressed(_:));
    DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v111);
    sub_8E500();
    sub_8E458();
    sub_17E70();
    if (*(void *)(v1 + 72))
    {
      if ((sub_8E4B0(v1 + 96, v112, v113, (uint64_t)&type metadata for String) & 1) == 0
        || (uint64_t v114 = sub_2130C(*(Swift::String *)(v1 + 96)), v114 == 2))
      {
        sub_756F8();
        goto LABEL_78;
      }

      char v417 = v114;
      uint64_t v82 = *(uint8_t **)(v1 + 264);
      uint64_t v350 = sub_8E518(v114, enum case for DirectInvocationUtils.Timer.UserInfoKey.verb(_:));
      DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v350);
      sub_8E500();
      sub_8E458();
      sub_756F8();
      uint64_t v212 = sub_17E70();
      if (*(void *)(v1 + 40))
      {
        if ((sub_8E4B0(v1 + 80, v351, v352, (uint64_t)&type metadata for String) & 1) != 0)
        {
          char v353 = sub_7E238(*(void *)(v1 + 80), *(void *)(v1 + 88));
          if (v353 != 19)
          {
            os_log_type_t v354 = OS_LOG_TYPE_FAULT|OS_LOG_TYPE_DEBUG|0x60;
            uint64_t v355 = sub_7010(v353);
            BOOL v357 = v355 == 1886352499 && v356 == 0xE400000000000000LL;
            if (v357)
            {
              swift_bridgeObjectRelease(0xE400000000000000LL);
            }

            else
            {
              os_log_type_t v354 = _stringCompareWithSmolCheck(_:_:expecting:)( v355,  v356,  1886352499LL,  0xE400000000000000LL,  0LL);
              sub_18034();
              if ((v354 & 1) == 0) {
                goto LABEL_78;
              }
            }

            v358 = *(os_log_s **)(v1 + 256);
            uint64_t v359 = (*(uint64_t (**)(os_log_s *, os_log_s *, void))(*(void *)(v1 + 248) + 16LL))( v358,  v427,  *(void *)(v1 + 240));
            Logger.logObject.getter(v359);
            os_log_type_t v360 = sub_1BCD0();
            BOOL v361 = sub_1BB80(v360);
            uint64_t v363 = *(void *)(v1 + 248);
            uint64_t v362 = *(void *)(v1 + 256);
            uint64_t v364 = *(void *)(v1 + 240);
            if (v361)
            {
              uint64_t v430 = *(void *)(v1 + 240);
              v365 = (uint8_t *)sub_1BA1C(12LL);
              uint64_t v424 = v362;
              uint64_t v366 = sub_1BA1C(32LL);
              *(_DWORD *)v365 = 136315138;
              v451[0] = v366;
              if ((v417 & 1) != 0) {
                uint64_t v367 = 0x6C65636E6163LL;
              }
              else {
                uint64_t v367 = 7562617LL;
              }
              if ((v417 & 1) != 0) {
                unint64_t v1 = 0xE600000000000000LL;
              }
              else {
                unint64_t v1 = 0xE300000000000000LL;
              }
              uint64_t *v432 = sub_683C(v367, v1, v451);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(v432, v447, v365 + 4, v365 + 12);
              sub_8E538();
              sub_1E7D8(&dword_0, v358, v354, "Received confirmation directionInvocation, buttonPressed: %s", v365);
              sub_1E7D0(v366);
              sub_1B904(v366);
              sub_1B904((uint64_t)v365);

              (*(void (**)(uint64_t, uint64_t))(v363 + 8))(v424, v430);
              char v368 = v417;
              uint64_t v369 = v9;
            }

            else
            {

              (*(void (**)(uint64_t, uint64_t))(v363 + 8))(v362, v364);
              uint64_t v369 = v9;
              char v368 = v417;
            }

            uint64_t v370 = *(void *)(v1 + 528);
            uint64_t v22 = *(void *)(v1 + 448);
            v371 = (unsigned int *)&enum case for ConfirmationResponse.rejected(_:);
            if ((v368 & 1) == 0) {
              v371 = (unsigned int *)&enum case for ConfirmationResponse.confirmed(_:);
            }
            sub_8E304(*v371, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 104));
            sub_8E494();
            uint64_t v372 = sub_8E334(v370);
            ConfirmIntentAnswer.init(confirmationResponse:intent:)(v370, v369, v372);
            sub_8E400();
            uint64_t v373 = sub_8E4E8();
            v445(v373, v374);
            goto LABEL_20;
          }
        }

LABEL_78:
        uint64_t v213 = v1 + 626;
        uint64_t v214 = v77(*(void *)(v1 + 312), *(void *)(v1 + 336), *(void *)(v1 + 296));
        Logger.logObject.getter(v214);
        os_log_type_t v215 = sub_32A5C();
        if (os_log_type_enabled(v427, v215))
        {
          unint64_t v435 = v1 + 112;
          uint64_t v216 = *(void *)(v450 + 320);
          uint64_t v217 = *(void *)(v450 + 312);
          uint64_t v218 = *(void *)(v450 + 296);
          uint64_t v82 = (uint8_t *)sub_1BA1C(12LL);
          uint64_t v448 = v213;
          uint64_t v219 = sub_1BA1C(32LL);
          v451[0] = v219;
          *(_DWORD *)uint64_t v82 = 136315138;
          v77(v216, v217, v218);
          uint64_t v220 = String.init<A>(describing:)();
          unint64_t v1 = v221;
          *(void *)(v450 + 112) = sub_4351C(v220, v221);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v435, v419, v82 + 4, v82 + 12);
          sub_8E538();
          uint64_t v222 = v217;
          id v89 = (void (*)(uint8_t *, uint64_t))v445;
          v445(v222, v218);
          sub_1E7D8(&dword_0, v427, v215, "Received unsupported directInvocation for timer confirmation: %s", v82);
          sub_1E7D0(v219);
          uint64_t v223 = v219;
          uint64_t v213 = v448;
          sub_1B904(v223);
          sub_1B904((uint64_t)v82);
        }

        else
        {
          v89(*(uint8_t **)(v1 + 312), *(void *)(v1 + 296));
        }

        uint64_t v184 = (uint64_t)v439;
        *(_BYTE *)(v1 + 626) = 0;
        sub_67C4((uint64_t *)&unk_FF830);
        unint64_t v224 = sub_8E568();
        sub_1B74C((uint64_t)v82, v224);
        unint64_t v225 = sub_8E310();
        uint64_t v227 = sub_8E4F4(v225, v226, v213);
        sub_8E55C(v227, v228, v229, v230, v231, v232, v233, v234);

        uint64_t v235 = sub_8E50C();
        ((void (*)(uint64_t))v89)(v235);
        goto LABEL_126;
      }
    }

    else
    {
      uint64_t v212 = sub_756F8();
    }

    sub_8E32C(v212, &qword_FCD20);
    goto LABEL_78;
  }

  sub_8E41C();
  sub_1E7C4(v11);
  sub_67C4((uint64_t *)&unk_FCC60);
  swift_release();
LABEL_5:
  unint64_t v442 = v2;
  uint64_t v12 = *(void *)(v1 + 616);
  uint64_t v13 = *(void *)(v1 + 608);
  uint64_t v14 = *(void *)(v1 + 560);
  sub_2C108(v12, *(void *)(v1 + 592), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
  sub_2C108(v14, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
  sub_8E44C();
  if (!v357) {
    swift_once(&qword_FB2B0, sub_8B3CC);
  }
  sub_5474(*(void *)(v1 + 240), (uint64_t)qword_FF740);
  uint64_t v15 = sub_8E50C();
  uint64_t v17 = sub_1E720(v15, v16);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = *(void *)(v1 + 616);
  uint64_t v22 = *(void *)(v1 + 608);
  uint64_t v23 = *(void *)(v1 + 600);
  if (v20)
  {
    uint64_t v422 = *(void *)(v1 + 536);
    v431 = v3;
    uint64_t v24 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v426 = v23;
    uint64_t v25 = sub_1BA1C(32LL);
    v451[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v26 = sub_1E764(&qword_FBE60, (uint64_t)&unk_C5488);
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter(v422, v26);
    uint64_t v28 = v21;
    unint64_t v29 = v1;
    unint64_t v31 = v30;
    *(void *)(v29 + 136) = sub_4351C(v27, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v442, v431, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v31);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v28, v426);
    sub_8E4A8();
    sub_1E7D8(&dword_0, v18, v19, "TimerNLIntent: %s", v24);
    sub_1E7D0(v25);
    sub_1B904(v25);
    sub_1B904((uint64_t)v24);
  }

  else
  {

    sub_8E4A8();
    sub_8E400();
  }

  if (qword_FB318 != -1) {
    swift_once(&qword_FB318, sub_9707C);
  }
  uint64_t v32 = *(void *)(v450 + 536);
  uint64_t v33 = qword_101168;
  uint64_t v34 = sub_1E764((unint64_t *)&qword_FD600, (uint64_t)&unk_C54B0);
  IntentNodeTraversable.value<A>(forNode:)(v33, v32, v34);
  int v35 = *(unsigned __int8 *)(v450 + 627);
  uint64_t v36 = *(void *)(v450 + 560);
  uint64_t v37 = *(void *)(v450 + 544);
  if (v35 == 3)
  {
    sub_1E720(v36, v37);
  }

  else
  {
    sub_1E720(v36, v37);
    if (v35 == 2)
    {
      sub_1E6E4(*(void *)(v450 + 544));
      goto LABEL_17;
    }
  }

  IntentNodeTraversable.value<A>(forNode:)(v33, *(void *)(v450 + 536), v34);
  uint64_t v22 = *(unsigned __int8 *)(v450 + 628);
  sub_8E4A8();
  if ((_DWORD)v22 != 1)
  {
    sub_8E570();
    uint64_t v39 = enum case for ConfirmationResponse.confirmed(_:);
    goto LABEL_19;
  }

uint64_t sub_8D1D8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for TemplatingResult(0LL);
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[5] = v4;
  v2[6] = sub_1B6C8(v4);
  uint64_t v5 = sub_1BD34();
  v2[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[8] = v6;
  void v2[9] = sub_1B6C8(v6);
  uint64_t v7 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[11] = v8;
  v2[12] = sub_1B6C8(v8);
  uint64_t v9 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[13] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[14] = v10;
  v2[15] = sub_1B6C8(v10);
  uint64_t v11 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[16] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[17] = v12;
  v2[18] = sub_1B6C8(v12);
  uint64_t v13 = sub_67C4(&qword_FBD98);
  v2[19] = sub_2B4DC(*(void *)(v13 - 8));
  v2[20] = sub_1B970();
  uint64_t v14 = type metadata accessor for DialogPhase(0LL);
  v2[21] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[22] = v15;
  v2[23] = sub_1B6C8(v15);
  uint64_t v16 = type metadata accessor for NLContextUpdate(0LL);
  v2[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[25] = v17;
  v2[26] = sub_1B6C8(v17);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_8D2E4()
{
  uint64_t v2 = sub_46210();
  char v3 = ((uint64_t (*)(uint64_t, void *))HALDeviceContext.isCommunal.getter)( v2,  &protocol witness table for HALTimerDeviceContext);
  uint64_t v4 = sub_8E4E8();
  uint64_t v6 = HALDeviceContext.remoteDevice.getter(v4, v5);
  if (v6 && (uint64_t v7 = (void *)v6, v8 = ((uint64_t (*)(void))DeviceUnit.name.getter)(), v10 = v9, v7, v10))
  {
    String.toSpeakableString.getter(v8, v10);
    sub_18034();
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  uint64_t v12 = *(void *)(v0 + 160);
  type metadata accessor for SpeakableString(0LL);
  uint64_t v13 = 1LL;
  sub_8E3CC(v12, v11);
  uint64_t v14 = HALDeviceContext.remoteDevice.getter(v2, &protocol witness table for HALTimerDeviceContext);
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = ((uint64_t (*)(void))DeviceUnit.roomName.getter)();
    uint64_t v18 = v17;

    if (v18)
    {
      String.toSpeakableString.getter(v16, v18);
      sub_18034();
      uint64_t v13 = 0LL;
    }
  }

  uint64_t v19 = *(void *)(v0 + 144);
  uint64_t v20 = *(void *)(v0 + 128);
  uint64_t v21 = *(void *)(v0 + 136);
  uint64_t v22 = sub_8E3CC(*(void *)(v0 + 152), v13);
  static SiriTimeFeatureFlagsImpl.instance.getter(v22);
  Swift::Bool v23 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
  if (v23)
  {
    countAndFlagsBits = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v24);

    Swift::String_optional v27 = AceObject.serializeToBase64()();
    *(void *)(v0 + 216) = v27.value._object;
    if (v27.value._object)
    {
      unint64_t v29 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v28);
      unint64_t v31 = v30;

      Swift::String_optional v32 = AceObject.serializeToBase64()();
      countAndFlagsBits = (void *)v32.value._countAndFlagsBits;

      *(void *)(v0 + 224) = v32.value._object;
      if (v32.value._object)
      {
        (*(void (**)(void, void, void))(*(void *)(v0 + 88) + 104LL))( *(void *)(v0 + 96),  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  *(void *)(v0 + 80));
        if (qword_FB2B0 != -1) {
          swift_once(&qword_FB2B0, sub_8B3CC);
        }
        uint64_t v33 = *(void *)(v0 + 96);
        uint64_t v34 = *(void *)(v0 + 64);
        uint64_t v35 = *(void *)(v0 + 72);
        uint64_t v36 = *(void *)(v0 + 56);
        uint64_t v37 = sub_5474(v36, (uint64_t)qword_FF740);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v35, v37, v36);
        uint64_t v38 = mach_absolute_time();
        SiriTimeMeasurement.init(_:log:startTime:)(v33, v35, v38);
        if (qword_FB278 != -1) {
          swift_once(&qword_FB278, sub_7E3D8);
        }
        uint64_t v39 = swift_task_alloc(64LL);
        *(void *)(v0 + 232) = v39;
        *(int8x16_t *)(v39 + 16) = vextq_s8(*(int8x16_t *)(v0 + 152), *(int8x16_t *)(v0 + 152), 8uLL);
        *(Swift::String_optional *)(v39 + 32) = v27;
        *(Swift::String_optional *)(v39 + 48) = v32;
        uint64_t v40 = (void *)swift_task_alloc(dword_FFC6C);
        *(void *)(v0 + 240) = v40;
        void *v40 = v0;
        v40[1] = sub_8D7B4;
        return sub_94368(v3 & 1, (v3 ^ 1) & 1, (uint64_t)sub_8E1E8, v39);
      }

      swift_bridgeObjectRelease(v27.value._object);
    }

    if (qword_FB2B0 != -1) {
      swift_once(&qword_FB2B0, sub_8B3CC);
    }
    sub_39658(*(void *)(v0 + 56), (uint64_t)qword_FF740);
    os_log_type_t v43 = sub_32A5C();
    if (sub_1BB80(v43))
    {
      uint64_t v44 = (_WORD *)sub_1BA1C(2LL);
      sub_2BA04(v44);
      sub_1BAA8(&dword_0, v45, v46, "Could not create direct invocation for confirm or reject actions.");
      sub_1B904((uint64_t)v27.value._object);
    }

    uint64_t v47 = *(void *)(v0 + 200);
    uint64_t v48 = *(void *)(v0 + 184);
    uint64_t v62 = *(void *)(v0 + 192);
    uint64_t v63 = *(void *)(v0 + 208);
    uint64_t v50 = *(void *)(v0 + 168);
    uint64_t v49 = *(void *)(v0 + 176);
    uint64_t v51 = *(void *)(v0 + 152);
    uint64_t v64 = *(void *)(v0 + 160);

    *(_BYTE *)(v0 + 320) = 0;
    uint64_t v52 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v53 = sub_1E324();
    sub_1B74C(v52, v53);
    uint64_t v54 = static BarbaraWalters.logAndReturnError<A>(context:_:)( 0xD00000000000006FLL,  0x80000000000C9510LL,  v0 + 320,  v52,  v53);
    swift_willThrow(v54, v55, v56, v57, v58, v59, v60, v61);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v63, v62);
    sub_DABC(v51, &qword_FBD98);
    sub_DABC(v64, &qword_FBD98);
    sub_8E240();
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    return sub_20614(*(uint64_t (**)(void))(v0 + 8));
  }

  else
  {
    if (qword_FB270 != -1) {
      swift_once(&qword_FB270, sub_7E3C4);
    }
    uint64_t v42 = (void *)swift_task_alloc(dword_FC634);
    *(void *)(v0 + 280) = v42;
    *uint64_t v42 = v0;
    v42[1] = sub_8D9A8;
    return sub_32AF4(*(void *)(v0 + 48), (v3 ^ 1) & 1, v3 & 1, *(void *)(v0 + 160), *(void *)(v0 + 152));
  }

uint64_t sub_8D7B4(uint64_t a1)
{
  uint64_t v9 = (void *)*v2;
  uint64_t v4 = v9;
  sub_1BC0C(&v9);
  v4[31] = a1;
  v4[32] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[27];
    swift_bridgeObjectRelease(v4[28]);
    swift_bridgeObjectRelease(v5);
    sub_1BABC();
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    uint64_t v7 = v4[27];
    swift_bridgeObjectRelease(v4[28]);
    swift_bridgeObjectRelease(v7);
    sub_1BABC();
    uint64_t v8 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v4[33] = v8;
    *uint64_t v8 = v2;
    v8[1] = sub_8D890;
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v4[2],  v4[23],  v4[26],  v4[15],  0LL);
  }

uint64_t sub_8D890()
{
  uint64_t v4 = *v1;
  uint64_t v2 = v4;
  sub_1BC0C(&v4);
  *(void *)(v2 + 272) = v0;
  swift_task_dealloc();

  sub_1B9B8();
  return sub_2B44C();
}

#error "8D98C: call analysis failed (funcsize=45)"
uint64_t sub_8D9A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t **v4;
  uint64_t v5;
  uint64_t v5 = *v1;
  uint64_t v2 = v5;
  sub_1BC0C(&v5);
  *(void *)(v2 + 288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    uint64_t v4 = (uint64_t **)swift_task_alloc(dword_FDE9C);
    *(void *)(v2 + 296) = v4;
    *uint64_t v4 = v1;
    v4[1] = (uint64_t *)sub_8DA28;
    return sub_5E844(10);
  }

uint64_t sub_8DA28(uint64_t a1)
{
  uint64_t v9 = *v2;
  uint64_t v4 = v9;
  sub_1BC0C(&v9);
  v4[38] = v1;
  swift_task_dealloc();
  if (v1) {
    sub_1BB90(v4[5]);
  }
  else {
    v4[39] = a1;
  }
  sub_1B9B8();
  return swift_task_switch(v5, v6, v7);
}

#error "8DB5C: call analysis failed (funcsize=54)"
uint64_t sub_8DB7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  sub_2B500();
  sub_8E3AC();
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_8E3A4(v2);
  sub_8E3A4(v1);
  sub_8E240();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8DBF4()
{
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8DC6C()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  sub_1BB90(*(void *)(v0 + 176));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_8E3A4(v3);
  sub_8E3A4(v2);
  sub_8E240();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8DCEC()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  sub_1BB90(*(void *)(v0 + 176));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_8E3A4(v3);
  sub_8E3A4(v2);
  sub_8E240();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8DD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_67C4(&qword_FBD98);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = (int *)type metadata accessor for DismissTimerPromptConfirmDismissParameters(0LL);
  sub_DA74(a2, a1 + v17[6]);
  sub_DA74(a3, a1 + v17[9]);
  swift_bridgeObjectRetain(a5);
  SpeakableString.init(serializedValue:)(a4, a5);
  uint64_t v18 = type metadata accessor for SpeakableString(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v16, 0LL, 1LL, v18);
  sub_1B4F4((uint64_t)v16, a1 + v17[5]);
  swift_bridgeObjectRetain(a7);
  SpeakableString.init(serializedValue:)(a6, a7);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v16, 0LL, 1LL, v18);
  return sub_1B4F4((uint64_t)v16, a1);
}

uint64_t sub_8DEA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_8B414(a1, a2);
}

uint64_t sub_8DEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_FF844);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_107E8;
  return sub_8B5DC(a1, a2, a3);
}

uint64_t sub_8DF24(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_FF824);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_107E8;
  return sub_8D1D8(a1);
}

uint64_t sub_8DF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeRepromptOnEmptyParse(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_107E8;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnEmptyParse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_8DFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeRepromptOnLowConfidence(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_107E8;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnLowConfidence(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_8E06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeConfirmationRejectedResponse(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_107E8;
  return ConfirmIntentFlowStrategyAsync.makeConfirmationRejectedResponse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_8E0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeFlowCancelledResponse(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2FD40;
  return ConfirmIntentFlowStrategyAsync.makeFlowCancelledResponse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_8E164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeErrorResponse(error:confirmParameters:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_107E8;
  return ConfirmIntentFlowStrategyAsync.makeErrorResponse(error:confirmParameters:)(a1, a2, a3, a4, a5);
}

uint64_t sub_8E1E8(uint64_t a1)
{
  return sub_8DD6C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_8E1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FBDB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_8E240()
{
  return swift_task_dealloc(*(void *)(v0 + 208));
}

uint64_t sub_8E264(uint64_t a1)
{
  uint64_t v3 = v1[35];
  *(void *)(v2 - 128) = v1[36];
  *(void *)(v2 - 120) = v3;
  uint64_t v4 = v1[29];
  *(void *)(v2 - 112) = v1[32];
  *(void *)(v2 - 104) = v4;
  return swift_task_dealloc(a1);
}

uint64_t sub_8E2E0()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v0, 0LL, 1LL, v1);
}

uint64_t sub_8E2F4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v2, a2, v3);
}

uint64_t sub_8E304@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v2, a1, v3);
}

unint64_t sub_8E310()
{
  return 0xD000000000000075LL;
}

uint64_t sub_8E32C(uint64_t a1, uint64_t *a2)
{
  return sub_DABC(v2, a2);
}

uint64_t sub_8E334(uint64_t a1)
{
  return type metadata accessor for DismissTimerIntent(0LL);
}

void sub_8E354(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_8E368@<X0>(uint64_t a1@<X8>)
{
  return v3(v2, v1, *(void *)(a1 + 344));
}

uint64_t sub_8E37C()
{
  return *(void *)(v0 + 616);
}

uint64_t sub_8E3A4(uint64_t a1)
{
  return sub_DABC(a1, v1);
}

uint64_t sub_8E3AC()
{
  return (*(uint64_t (**)(void, void))(v0[14] + 8LL))(v0[15], v0[13]);
}

uint64_t sub_8E3CC(uint64_t a1, uint64_t a2)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, a2, 1LL, v2);
}

uint64_t sub_8E3D8()
{
  return swift_unknownObjectRelease_n(v0, 2LL);
}

void sub_8E3E4()
{
}

uint64_t sub_8E3F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  return swift_bridgeObjectRelease(a26);
}

uint64_t sub_8E400()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_8E410(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

  ;
}

uint64_t sub_8E42C()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v1, 1LL, v0);
}

  ;
}

double sub_8E458()
{
  return sub_1C318(v1, v2, v3, v0);
}

uint64_t sub_8E46C()
{
  return v2(v0, v1);
}

uint64_t sub_8E478(uint64_t a1)
{
  return ConfirmIntentAnswer.init(confirmationResponse:intent:)(v1, v2, a1);
}

uint64_t sub_8E48C()
{
  return type metadata accessor for DismissTimerIntent(0LL);
}

uint64_t sub_8E494()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v0, v2);
}

uint64_t sub_8E4A8()
{
  return sub_1E6E4(v0);
}

uint64_t sub_8E4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, v4, v5 + 8, a4, 6LL);
}

uint64_t sub_8E4C0()
{
  return swift_unknownObjectRetain_n(v0, 2LL);
}

uint64_t sub_8E4D0()
{
  *uint64_t v1 = v0;
  return swift_unknownObjectRetain(v0);
}

void sub_8E4DC()
{
}

uint64_t sub_8E4E8()
{
  return v0;
}

uint64_t sub_8E4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static BarbaraWalters.logAndReturnError<A>(context:_:)(a1, a2, a3, v3, v4);
}

uint64_t sub_8E500()
{
  return v2(v0, v1);
}

uint64_t sub_8E50C()
{
  return v0;
}

uint64_t sub_8E518(uint64_t a1, uint64_t a2)
{
  return v4(v2, a2, v3);
}

  ;
}

uint64_t sub_8E538()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_8E544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, a3, v3);
}

uint64_t sub_8E550()
{
  return String.init<A>(describing:)(v0);
}

uint64_t sub_8E55C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

unint64_t sub_8E568()
{
  return sub_1E324();
}

  ;
}

uint64_t sub_8E584(uint64_t a1)
{
  return sub_8E1F8(a1, v1);
}

uint64_t type metadata accessor for SetTimerAttributeCATs_Async(uint64_t a1)
{
  uint64_t result = qword_FF858;
  if (!qword_FF858) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SetTimerAttributeCATs_Async);
  }
  return result;
}

uint64_t sub_8E5C8(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_101100);
}

uint64_t sub_8E604(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch(sub_8E620, 0LL, 0LL);
}

uint64_t sub_8E620()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_67C4(&qword_FBE20);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_C2640;
  strcpy((char *)(v3 + 32), "speakableTimer");
  *(_BYTE *)(v3 + 47) = -18;
  uint64_t v4 = 0LL;
  if (v1)
  {
    uint64_t v4 = type metadata accessor for TimerTimer(0LL);
  }

  else
  {
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
  }

  *(void *)(v3 + 48) = v1;
  *(void *)(v3 + 72) = v4;
  uint64_t v5 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:) + 1);
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc(v5);
  v0[6] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1EAC0;
  return ((uint64_t (*)(void, unint64_t, unint64_t, uint64_t))v8)( v0[2],  0xD000000000000024LL,  0x80000000000C96A0LL,  v3);
}

uint64_t sub_8E728(uint64_t a1)
{
  uint64_t v3 = (void *)sub_2FE64((uint64_t)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1E95C;
  return sub_2FE58(a1, 0xD000000000000026LL, 0x80000000000C9670LL, (uint64_t)_swiftEmptyArrayStorage, v5);
}

uint64_t sub_8E798(uint64_t a1)
{
  uint64_t v3 = (void *)sub_2FE64((uint64_t)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_466D0;
  return sub_2FE58(a1, 0xD000000000000025LL, 0x80000000000C9640LL, (uint64_t)_swiftEmptyArrayStorage, v5);
}

uint64_t sub_8E808()
{
  return type metadata accessor for SetTimerAttributeCATs_Async(0LL);
}

void *sub_8E810(uint64_t a1)
{
  return sub_9308C(a1);
}

uint64_t sub_8E824(void *a1, uint64_t a2)
{
  *a1 = sub_8E810(a2);
  return sub_46908(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_8E884()
{
  unint64_t result = qword_FF8D8;
  if (!qword_FF8D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C4174, &_s25NeedsConfirmationStrategyVN_0);
    atomic_store(result, (unint64_t *)&qword_FF8D8);
  }

  return result;
}

unint64_t sub_8E8C0()
{
  unint64_t result = qword_FF8E0;
  if (!qword_FF8E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_C37E8, &_s20HandleIntentStrategyVN_2);
    atomic_store(result, (unint64_t *)&qword_FF8E0);
  }

  return result;
}

uint64_t sub_8E8FC(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_FF8E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_8E93C(void *a1)
{
  return a1;
}

void *sub_8E970(void *a1)
{
  return a1;
}

uint64_t SIRINLUUserDialogAct.firstUsoTask.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = static UsoConversionUtils.convertUserDialogActToTasks(userDialogAct:)(v0);
  uint64_t v3 = v2;
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v26 = v2;
    }
    else {
      uint64_t v26 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v26);
    sub_18034();
    if (v27)
    {
LABEL_3:
      if ((v3 & 0xC000000000000001LL) != 0)
      {
        uint64_t v1 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v3);
      }

      else
      {
        if (!*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL)))
        {
          __break(1u);
LABEL_23:
          swift_once(&qword_FB2B8, sub_8EE6C);
LABEL_7:
          uint64_t v4 = sub_1BD34();
          sub_5474(v4, (uint64_t)qword_FF8F8);
          uint64_t v5 = swift_retain_n(v1, 4LL);
          uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
          os_log_type_t v7 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v6, v7))
          {
            uint64_t v8 = sub_1BA1C(22LL);
            uint64_t v9 = sub_1BA1C(64LL);
            uint64_t v40 = v9;
            *(_DWORD *)uint64_t v8 = 136315394;
            uint64_t v10 = UsoTask.baseEntityAsString.getter();
            uint64_t v39 = sub_8EEDC(v10, v11, v12, v13);
            sub_8EEE4(v39, v14, v15, v8 + 12, v16);
            sub_8EEF4();
            uint64_t v17 = sub_18034();
            *(_WORD *)(v8 + 12) = 2080;
            uint64_t v18 = UsoTask.verbString.getter(v17);
            uint64_t v39 = sub_8EEDC(v18, v19, v20, v21);
            sub_8EEE4(v39, v22, v23, v8 + 22, v24);
            sub_8EEF4();
            sub_18034();
            _os_log_impl(&dword_0, v6, v7, "NLv4TranslationParse: Input is entity=%s verb=%s", (uint8_t *)v8, 0x16u);
            swift_arrayDestroy(v9, 2LL);
            sub_1B904(v9);
            sub_1B904(v8);
          }

          else
          {

            swift_release_n(v1, 4LL);
          }

          return v1;
        }

        uint64_t v1 = *(void *)(v3 + 32);
        swift_retain(v1);
      }

      sub_18034();
      if (qword_FB2B8 == -1) {
        goto LABEL_7;
      }
      goto LABEL_23;
    }
  }

  else if (*(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL)))
  {
    goto LABEL_3;
  }

  sub_18034();
  if (qword_FB2B8 != -1) {
    swift_once(&qword_FB2B8, sub_8EE6C);
  }
  uint64_t v28 = sub_1BD34();
  sub_5474(v28, (uint64_t)qword_FF8F8);
  uint64_t v29 = swift_unknownObjectRetain_n(v1, 2LL);
  unint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    Swift::String_optional v32 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v33 = sub_1BA1C(32LL);
    uint64_t v39 = v1;
    uint64_t v40 = v33;
    *(_DWORD *)Swift::String_optional v32 = 136315138;
    swift_unknownObjectRetain(v1);
    uint64_t v34 = String.init<A>(describing:)(&v39);
    unint64_t v36 = v35;
    uint64_t v39 = sub_8EEDC(v34, v35, v37, v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v32 + 4, v32 + 12);
    sub_436D0();
    swift_bridgeObjectRelease(v36);
    _os_log_impl(&dword_0, v30, v31, "NLv4TranslationParse: usoTasks are empty in UserDialogAct %s ", v32, 0xCu);
    swift_arrayDestroy(v33, 1LL);
    sub_1B904(v33);
    sub_1B904((uint64_t)v32);
  }

  else
  {

    sub_436D0();
  }

  return 0LL;
}

uint64_t sub_8EE6C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FF8F8);
  sub_5474(v0, (uint64_t)qword_FF8F8);
  return static SiriTimeLog.timerFlow.getter();
}

unint64_t sub_8EEB8(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_8EEDC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  return sub_683C(a1, a2, (uint64_t *)va);
}

uint64_t sub_8EEE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v6, v5, a4);
}

uint64_t sub_8EEF4()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_8EF00()
{
  return swift_errorRetain(v0);
}

uint64_t sub_8EF0C(uint64_t a1)
{
  v2[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[3] = "(";
  v2[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[5] = &unk_C4EF0;
  v2[6] = &unk_C4F08;
  return swift_initClassMetadata2(a1, 0LL, 7LL, v2, a1 + 96);
}

uint64_t sub_8EF80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_8EF98(a1, (uint64_t (*)(void))&type metadata accessor for TemplatingSection, a2);
}

uint64_t sub_8EF8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_8EF98(a1, (uint64_t (*)(void))&type metadata accessor for HALTimerDeviceContext, a2);
}

uint64_t sub_8EF98@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0LL);
  uint64_t v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))( a3,  a1 + ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL)),  v6);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a3, v8, 1LL, v7);
}

uint64_t sub_8F010()
{
  uint64_t v0 = sub_1BD34();
  sub_1B53C(v0, qword_FF910);
  uint64_t v1 = sub_17D30();
  sub_5474(v1, v2);
  return static SiriTimeLog.timerPlugin.getter();
}

uint64_t sub_8F050(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = *v2;
  sub_1B9B8();
  return swift_task_switch(v4, v5, v6);
}

uint64_t sub_8F078()
{
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v2 = sub_1BD34();
  sub_39658(v2, (uint64_t)qword_FF910);
  os_log_type_t v3 = sub_1BCD0();
  if (sub_1BB80(v3))
  {
    uint64_t v4 = (_WORD *)sub_1BA1C(2LL);
    *uint64_t v4 = 0;
    sub_1BAA8(&dword_0, v5, v6, "ResponseTimerDisambiguationFlowProvider.makeIntentPromptAnswer(choice:)");
    sub_1B904((uint64_t)v4);
  }

  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[5];

  v18[3] = sub_67C4(&qword_FC260);
  v18[0] = v9;
  uint64_t v10 = *(void **)(v7 + 104);
  v1[3] = v10;
  uint64_t v13 = v8 + 80;
  uint64_t v12 = *(void *)(v8 + 80);
  uint64_t v11 = *(void *)(v13 + 8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 8);
  sub_1BD3C();
  id v15 = v10;
  v14(v9, v12, v11);

  IntentPromptAnswer.init(answeredValue:updatedIntent:)(v18, v1[2], v12);
  uint64_t v16 = (uint64_t (*)(void))sub_1BB00();
  return v16();
}

uint64_t sub_8F1A0()
{
  return v0;
}

uint64_t sub_8F1EC()
{
  return swift_deallocClassInstance(v0, 112LL, 7LL);
}

uint64_t type metadata accessor for ResponseTimerDisambiguationFlowProvider( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_44F6C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ResponseTimerDisambiguationFlowProvider);
}

void sub_8F218(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[2] = &unk_C4F90;
  sub_920F8(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(v2 - 8) + 64LL;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initClassMetadata2(a1, 0LL, 6LL, v4, a1 + 88);
  }

uint64_t sub_8F2BC()
{
  return swift_retain(*(void *)(*(void *)v0 + 24LL));
}

uint64_t sub_8F2C8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *a1 = v2;
  return swift_retain(v2);
}

uint64_t sub_8F2D8@<X0>(uint64_t a1@<X8>)
{
  return sub_54CC(*v1 + 40LL, a1);
}

uint64_t sub_8F2E8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_C5218, a1);
  return NeedsDisambiguationDetailedFlowProvider.authenticationRequirements.getter(a1, WitnessTable);
}

uint64_t sub_8F32C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc(dword_FF9AC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10E90;
  return sub_8F050(a1, v4);
}

uint64_t sub_8F390()
{
  return swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 16LL));
}

uint64_t sub_8F39C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 96LL));
  return v1;
}

uint64_t sub_8F3CC(uint64_t a1)
{
  unint64_t v3 = (void *)swift_task_alloc(async function pointer to NeedsDisambiguationDetailedSelectionFlowProvider.makeAllItemsFlow()[1]);
  *(void *)(v1 + 16) = v3;
  uint64_t v5 = type metadata accessor for ResponseTimerDisambiguationFlowProvider( 0LL,  *(void *)(a1 + 80),  *(void *)(a1 + 88),  v4);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_C5288, v5);
  void *v3 = v1;
  v3[1] = sub_92E74;
  return NeedsDisambiguationDetailedSelectionFlowProvider.makeAllItemsFlow()(v5, WitnessTable);
}

uint64_t sub_8F44C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to NeedsDisambiguationDetailedSelectionFlowProvider.makeWindowingConfiguration()[1]);
  *(void *)(v2 + 16) = v5;
  uint64_t v7 = type metadata accessor for ResponseTimerDisambiguationFlowProvider( 0LL,  *(void *)(a2 + 80),  *(void *)(a2 + 88),  v6);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_C5288, v7);
  *uint64_t v5 = v2;
  v5[1] = sub_10E90;
  return NeedsDisambiguationDetailedSelectionFlowProvider.makeWindowingConfiguration()(a1, v7, WitnessTable);
}

uint64_t sub_8F4D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to NeedsDisambiguationDetailedSelectionFlowProvider.makeFinalWindowFlow(paginationParameters:windowContent:)[1]);
  *(void *)(v3 + 16) = v7;
  uint64_t v9 = type metadata accessor for ResponseTimerDisambiguationFlowProvider( 0LL,  *(void *)(a3 + 80),  *(void *)(a3 + 88),  v8);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_C5288, v9);
  *uint64_t v7 = v3;
  v7[1] = sub_92E74;
  return NeedsDisambiguationDetailedSelectionFlowProvider.makeFinalWindowFlow(paginationParameters:windowContent:)( a1,  v6,  v9,  WitnessTable);
}

uint64_t sub_8F56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to MultipleChoicePromptWindowingFlowProvider.makeConclusionFlow(paginationParameters:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_92E74;
  return MultipleChoicePromptWindowingFlowProvider.makeConclusionFlow(paginationParameters:)(a1, a2, a3);
}

uint64_t sub_8F5D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to NeedsDisambiguationDetailedSelectionFlowProvider.makeWindowFlow(paginationParameters:windowContent:)[1]);
  *(void *)(v3 + 16) = v7;
  uint64_t v9 = type metadata accessor for ResponseTimerDisambiguationFlowProvider( 0LL,  *(void *)(a3 + 80),  *(void *)(a3 + 88),  v8);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_C5288, v9);
  *uint64_t v7 = v3;
  v7[1] = sub_92E74;
  return NeedsDisambiguationDetailedSelectionFlowProvider.makeWindowFlow(paginationParameters:windowContent:)( a1,  v6,  v9,  WitnessTable);
}

void sub_8F66C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v33 = a1;
  uint64_t v31 = *(void *)v2;
  uint64_t v3 = sub_67C4(&qword_FFBA0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_2BF2C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v31 - v12;
  __chkstk_darwin(v11);
  id v15 = (char *)&v31 - v14;
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v16 = sub_1BD34();
  sub_39658(v16, (uint64_t)qword_FF910);
  os_log_type_t v17 = sub_1BCD0();
  if (os_log_type_enabled(v2, v17))
  {
    uint64_t v18 = (uint8_t *)sub_1BA1C(2LL);
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_0, v2, v17, "ResponseTimerSimpleDisambiguationStrategy.actionForInput(input:) called.", v18, 2u);
    sub_1B904((uint64_t)v18);
  }

  uint64_t v19 = (uint64_t)v2 + qword_FF9B0;
  swift_beginAccess((char *)v2 + qword_FF9B0, v34, 0LL, 0LL);
  sub_92DDC(v19, (uint64_t)v5);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v5, 1LL, v6) == 1)
  {
    sub_DABC((uint64_t)v5, &qword_FFBA0);
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v15, v5, v6);
    uint64_t v26 = WindowedPaginationParameters.isFirstWindow.getter(v25);
    char v27 = v26 ^ WindowedPaginationParameters.isLastWindow.getter(v26);
    uint64_t v28 = sub_93024((uint64_t)v13);
    if ((v27 & 1) != 0) {
      char v29 = 0;
    }
    else {
      char v29 = WindowedPaginationParameters.isFirstWindow.getter(v28);
    }
    sub_9301C((uint64_t)v13);
    uint64_t v30 = sub_93024((uint64_t)v10);
    uint64_t v24 = (v29 & 1) == 0 || WindowedPaginationParameters.windowSize.getter(v30) != 0;
    sub_9301C((uint64_t)v10);
    sub_9301C((uint64_t)v15);
  }

  sub_7295C( v33,  *(void *)(v31 + 80),  v24,  *(void *)(v31 + 80),  v20,  v21,  v22,  v23,  v31,  v32,  v33,  v34[0],  v34[1],  v34[2],  v34[3],  v34[4],  v34[5],  v34[6],  v34[7],  v34[8]);
}

uint64_t sub_8F8F0(uint64_t a1, uint64_t a2)
{
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = *v2;
  uint64_t v4 = type metadata accessor for Input(0LL);
  v3[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[7] = v5;
  v3[8] = sub_1B6C8(v5);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_8F940()
{
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v1 = (os_log_s *)v0[8];
  uint64_t v2 = sub_1BD34();
  sub_5474(v2, (uint64_t)qword_FF910);
  uint64_t v3 = sub_17D30();
  uint64_t v5 = v4(v3);
  Logger.logObject.getter(v5);
  os_log_type_t v6 = sub_2BFB4();
  BOOL v7 = os_log_type_enabled(v1, v6);
  uint64_t v8 = v0[6];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v16 = sub_1BA1C(32LL);
    uint64_t v17 = v16;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v10 = sub_E538( (unint64_t *)&unk_FEC58,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    uint64_t v11 = dispatch thunk of CustomStringConvertible.description.getter(v8, v10);
    unint64_t v13 = v12;
    v0[2] = sub_683C(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v13);
    sub_92FF4();
    sub_1E7D8( &dword_0,  v1,  v6,  "ResponseTimerSimpleDisambiguationStrategy.parseDisambiguationResult(input:items:) parsing input: %s",  v9);
    sub_1E7D0(v16);
    sub_1B904(v16);
    sub_1B904((uint64_t)v9);
  }

  else
  {
    sub_92FF4();
  }

  uint64_t v14 = (void *)swift_task_alloc(dword_FBE4C);
  v0[9] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_8FB2C;
  return static TimerResponseDisambiguationUtils.parsePromptResult<A>(input:items:intentType:)(v0[3], v0[4]);
}

uint64_t sub_8FB2C()
{
  uint64_t v5 = swift_task_dealloc();
  if (!v1) {
    uint64_t v5 = v0;
  }
  return (*(uint64_t (**)(uint64_t))(v3 + 8))(v5);
}

uint64_t sub_8FB78(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_2BF2C();
  v3[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[6] = v5;
  v3[7] = sub_1B6C8(v5);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_8FBC0(uint64_t a1)
{
  uint64_t v2 = (uint64_t **)swift_task_alloc(dword_FFA5C);
  v1[8] = (uint64_t)v2;
  *uint64_t v2 = v1;
  v2[1] = (uint64_t *)sub_8FC1C;
  return sub_8FCB4(v1[2], v1[3], v1[7]);
}

uint64_t sub_8FC1C()
{
  uint64_t v3 = *(void *)(v2 + 48);
  sub_1BC0C(v4);
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  sub_2B73C(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (v0)
  {
    sub_1B9B8();
    return sub_92EDC(v5, v6, v7);
  }

  else
  {
    swift_task_dealloc();
    return sub_33DC4(*(uint64_t (**)(void))(v1 + 8));
  }

uint64_t sub_8FC88()
{
  return sub_1ECD4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8FCB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[34] = a3;
  v4[35] = v3;
  v4[32] = a1;
  v4[33] = a2;
  uint64_t v5 = sub_2BB74();
  v4[36] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[37] = v6;
  v4[38] = sub_2B4DC(v6);
  v4[39] = sub_1B970();
  uint64_t v7 = type metadata accessor for TemplatingText(0LL);
  v4[40] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[41] = v8;
  v4[42] = sub_1B6C8(v8);
  uint64_t v9 = type metadata accessor for CATOption(0LL);
  v4[43] = sub_1B6C8(*(void *)(v9 - 8));
  uint64_t v10 = type metadata accessor for TemplatingResult(0LL);
  v4[44] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[45] = v11;
  v4[46] = sub_1B6C8(v11);
  uint64_t v12 = sub_67C4(&qword_FDDF8);
  v4[47] = sub_1B6C8(*(void *)(v12 - 8));
  uint64_t v13 = sub_1BD34();
  v4[48] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v4[49] = v14;
  v4[50] = sub_1B6C8(v14);
  uint64_t v15 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v4[51] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v4[52] = v16;
  v4[53] = sub_1B6C8(v16);
  uint64_t v17 = type metadata accessor for SiriTimeMeasurement(0LL);
  v4[54] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v4[55] = v18;
  v4[56] = sub_2B4DC(v18);
  v4[57] = sub_1B970();
  uint64_t v19 = type metadata accessor for ResponseMode(0LL);
  v4[58] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v4[59] = v20;
  v4[60] = sub_2B4DC(v20);
  v4[61] = sub_1B970();
  uint64_t v21 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v4[62] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v4[63] = v22;
  v4[64] = sub_1B6C8(v22);
  uint64_t v23 = sub_2BF2C();
  v4[65] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v4[66] = v24;
  v4[67] = sub_1B6C8(v24);
  uint64_t v25 = sub_2BB7C();
  v4[68] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v4[69] = v26;
  v4[70] = sub_1B6C8(v26);
  uint64_t v27 = sub_67C4(&qword_FFBA0);
  v4[71] = sub_2B4DC(*(void *)(v27 - 8));
  v4[72] = sub_1B970();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_8FE7C()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[33];
  uint64_t v3 = type metadata accessor for SiriTimer(0LL);
  uint64_t v271 = sub_B5EC4(v2, v3);
  v0[73] = v271;
  uint64_t v4 = *(void *)(v1 + 16);
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0) {
      uint64_t v205 = *(void *)(v1 + 16);
    }
    else {
      uint64_t v205 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_1BD3C();
    uint64_t v217 = _CocoaArrayWrapper.endIndex.getter(v205);
    sub_1BC04();
  }

  else
  {
    uint64_t v217 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v5 = v0[72];
  uint64_t v6 = v0[71];
  uint64_t v7 = v0[65];
  uint64_t v8 = v0[35];
  uint64_t v234 = v0 + 30;
  uint64_t v243 = *(uint64_t (**)(void))(v0[66] + 16LL);
  ((void (*)(uint64_t, void, uint64_t))v243)(v5, v0[34], v7);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v5, 0LL, 1LL, v7);
  sub_92D30(v5, v6);
  uint64_t v9 = v8 + qword_FF9B0;
  swift_beginAccess(v8 + qword_FF9B0, v0 + 17, 33LL, 0LL);
  sub_92D78(v6, v9);
  swift_endAccess(v0 + 17);
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v10 = (void *)sub_5474(v0[48], (uint64_t)qword_FF910);
  uint64_t v11 = v271;
  uint64_t v12 = swift_bridgeObjectRetain_n(v271, 4LL);
  uint64_t v268 = v10;
  Logger.logObject.getter(v12);
  os_log_type_t v13 = sub_1BCD0();
  if (!sub_2BA2C(v13))
  {
    swift_bridgeObjectRelease_n(v271, 4LL);

    goto LABEL_10;
  }

  uint64_t v263 = v1;
  uint64_t v14 = (uint64_t)(v0 + 31);
  uint64_t v15 = sub_1BA1C(22LL);
  uint64_t v16 = sub_1BA1C(32LL);
  v273[0] = v16;
  *(_DWORD *)uint64_t v15 = 134218242;
  uint64_t v17 = *(void *)((char *)&dword_10 + (v271 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    sub_2B7C4();
    v0[30] = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v234, v14, v15 + 4, v15 + 12);
    sub_2B7C4();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v18 = type metadata accessor for TimerTimer(0LL);
    swift_bridgeObjectRetain(v271);
    uint64_t v19 = Array.description.getter(v271, v18);
    unint64_t v21 = v20;
    swift_bridgeObjectRelease(v271);
    v0[31] = sub_683C(v19, v21, v273);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v14, v0 + 32, v15 + 14, v15 + 22);
    sub_2B7C4();
    sub_2B644(v271);
    _os_log_impl( &dword_0,  (os_log_t)v10,  v13,  "ResponseTimerDisambiguationStrategy.makePromptForItems(items:paginationParameters:) Converted %ld timers to send to dialog: %s",  (uint8_t *)v15,  0x16u);
    sub_1E7D0(v16);
    sub_1B904(v16);
    sub_1B904(v15);

    uint64_t v1 = v263;
LABEL_10:
    uint64_t v22 = v0[35];
    uint64_t v23 = v0[33];
    uint64_t v24 = *(void *)(v1 + 16);
    uint64_t v25 = sub_1BD3C();
    uint64_t v26 = WindowedPaginationParameters.windowSize.getter(v25);
    uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v3);
    uint64_t v28 = static ResponseDisambigUtils.calculateWindow<A>(windowItems:allItems:windowSize:)( v23,  v24,  v26,  v3,  WitnessTable);
    sub_1BC04();
    uint64_t v258 = v28;
    uint64_t v263 = v22;
    uint64_t v250 = qword_FF9B8;
    char v29 = &off_FF000;
    if (v28 != *(void *)(v22 + qword_FF9B8)) {
      *(void *)(v0[35] + qword_FF9C0) = 0LL;
    }
    uint64_t v16 = (uint64_t)(v0 + 26);
    swift_retain();
    uint64_t v30 = (os_log_s *)sub_93014();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = v0[35];
    if (v32)
    {
      os_log_type_t v13 = (_BYTE)v0 - 48;
      uint64_t v34 = sub_1BA1C(32LL);
      uint64_t v35 = sub_1BA1C(32LL);
      v273[0] = v35;
      *(_DWORD *)uint64_t v34 = 134218498;
      v0[26] = *(void *)(v263 + v250);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 26, v0 + 27, v34 + 4, v34 + 12);
      *(_WORD *)(v34 + 12) = 2048;
      v0[27] = *(void *)(v33 + qword_FF9C0);
      uint64_t v36 = sub_17D30();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v36, v37, v38, v39);
      sub_2BB30();
      *(_WORD *)(v34 + 22) = 2080;
      v0[28] = v28;
      uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
      v0[29] = sub_683C(v40, v41, v273);
      char v29 = &off_FF000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 29, v234, v34 + 24, v34 + 32);
      sub_18034();
      _os_log_impl( &dword_0,  v30,  v31,  "[makePromptForItems] window=%ld, promptCount=%ld, thisWindow=%s",  (uint8_t *)v34,  0x20u);
      sub_1E7D0(v35);
      sub_1B904(v35);
      uint64_t v42 = v34;
      uint64_t v16 = (uint64_t)(v0 + 26);
      sub_1B904(v42);
    }

    else
    {
      sub_2BB30();
    }

    uint64_t v43 = v0[35];
    uint64_t v3 = (uint64_t)v29[312];
    if ((*(_BYTE *)(v43 + v3) & 1) != 0)
    {
      uint64_t v44 = *(void *)(v263 + v250);
      BOOL v45 = v44 != 0x8000000000000000LL && v28 == v44;
      BOOL v46 = v45;
      LODWORD(v234) = v46;
    }

    else
    {
      LODWORD(v234) = 0;
    }

    uint64_t v15 = *(unsigned __int8 *)(v43 + 32);
    char v47 = WindowedPaginationParameters.isFirstWindow.getter();
    uint64_t v48 = sub_17D30();
    uint64_t v49 = v243(v48);
    uint64_t v14 = (v47 & 1) != 0 ? WindowedPaginationParameters.isLastWindow.getter(v49) ^ 1 : 1LL;
    uint64_t v10 = (void *)v0[70];
    uint64_t v11 = v0[33];
    (*(void (**)(void, void))(v0[66] + 8LL))(v0[67], v0[65]);
    sub_AA26C();
    *(void *)(v263 + v250) = v258;
    uint64_t v50 = *(void *)(v43 + v3);
    BOOL v51 = __OFADD__(v50, 1LL);
    uint64_t v52 = v50 + 1;
    if (!v51) {
      break;
    }
    __break(1u);
LABEL_57:
    if (v11 < 0) {
      uint64_t v206 = v11;
    }
    else {
      uint64_t v206 = v11 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v11);
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v206);
    sub_2B7C4();
  }

  *(void *)(v43 + v3) = v52;
  uint64_t v53 = type metadata accessor for ApplicationContext(0LL);
  static ApplicationContext.shared.getter(v53);
  ApplicationContext.deviceState.getter(v0 + 2);
  swift_release();
  uint64_t v54 = v0[5];
  uint64_t v55 = v0[6];
  sub_8CFC(v0 + 2, v54);
  uint64_t v56 = dispatch thunk of DeviceState.isWatch.getter(v54, v55);
  uint64_t v57 = _s20HandleIntentStrategyVwxx_0(v0 + 2);
  if ((v56 & 1) != 0) {
    goto LABEL_31;
  }
  uint64_t v58 = v0[63];
  uint64_t v56 = v0[64];
  uint64_t v59 = v0[62];
  static SiriTimeFeatureFlagsImpl.instance.getter(v57);
  Swift::Bool v60 = SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()();
  uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
  v61(v56, v59);
  if (!v60) {
    goto LABEL_31;
  }
  uint64_t v62 = v0[60];
  uint64_t v63 = v0[61];
  uint64_t v65 = v0[58];
  uint64_t v64 = v0[59];
  uint64_t v66 = type metadata accessor for SiriEnvironment(0LL);
  static SiriEnvironment.default.getter(v66);
  SiriEnvironment.currentRequest.getter();
  uint64_t v67 = swift_release();
  CurrentRequest.responseMode.getter(v67);
  uint64_t v68 = sub_2BB30();
  static ResponseMode.voiceOnly.getter(v68);
  uint64_t v69 = sub_E538( &qword_FFBA8,  (uint64_t (*)(uint64_t))&type metadata accessor for ResponseMode,  (uint64_t)&protocol conformance descriptor for ResponseMode);
  uint64_t v56 = dispatch thunk of static Equatable.== infix(_:_:)(v63, v62, v65, v69);
  uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
  v70(v62, v65);
  v70(v63, v65);
  if ((v56 & 1) != 0)
  {
LABEL_31:
    uint64_t v71 = (id *)(v0 + 23);
    swift_bridgeObjectRetain_n(v271, 2LL);
    sub_93014();
    os_log_type_t v72 = sub_1BCD0();
    if (sub_2BA2C(v72))
    {
      uint64_t v73 = (uint8_t *)sub_1BA1C(12LL);
      *(_DWORD *)uint64_t v73 = 134217984;
      if ((unint64_t)v271 >> 62)
      {
        if (v271 < 0) {
          uint64_t v207 = v271;
        }
        else {
          uint64_t v207 = v271 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v271);
        uint64_t v74 = _CocoaArrayWrapper.endIndex.getter(v207);
        sub_17E70();
      }

      else
      {
        uint64_t v74 = *(void *)((char *)&dword_10 + (v271 & 0xFFFFFFFFFFFFF8LL));
      }

      sub_17E70();
      v0[22] = v74;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 22, v0 + 23, v73 + 4, v73 + 12);
      sub_17E70();
      sub_1E7D8(&dword_0, (os_log_s *)v56, v72, "[makePromptForItems] Using disambiguation pattern with %ld items", v73);
      sub_1B904((uint64_t)v73);
    }

    else
    {
      sub_2B644(v271);
    }

    id v75 = sub_4C75C(v0[33], v15);
    v0[90] = v75;
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = (void *)objc_opt_self(&OBJC_CLASS___NSKeyedArchiver);
      *uint64_t v71 = 0LL;
      id v78 = [v77 archivedDataWithRootObject:v76 requiringSecureCoding:1 error:v0 + 23];
      id v79 = *v71;
      if (v78)
      {
        uint64_t v80 = v0[52];
        uint64_t v81 = v0[53];
        uint64_t v83 = v0[50];
        uint64_t v82 = v0[51];
        uint64_t v84 = v0[49];
        uint64_t v251 = v0[48];
        uint64_t v85 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v78);
        unint64_t v87 = v86;

        v0[91] = v85;
        v0[92] = v87;
        (*(void (**)(uint64_t, void, uint64_t))(v80 + 104))( v81,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v82);
        (*(void (**)(uint64_t, void *, uint64_t))(v84 + 16))(v83, v268, v251);
        uint64_t v88 = mach_absolute_time();
        uint64_t v89 = SiriTimeMeasurement.init(_:log:startTime:)(v81, v83, v88);
        WindowedPaginationParameters.isConclusion.getter(v89);
        uint64_t v90 = WindowedPaginationParameters.isFirstWindow.getter();
        WindowedPaginationParameters.isLastWindow.getter(v90);
        WindowedPaginationParameters.isNextWindowLastWindow.getter();
        sub_21418(v85, v87);
        uint64_t v91 = dword_1005C0;
        uint64_t v92 = (void *)swift_task_alloc(unk_1005C4);
        v0[93] = v92;
        *uint64_t v92 = v0;
        v92[1] = sub_91388;
        v273[13] = v87;
        v273[14] = v217;
        __asm { BR              X9; sub_AC49C }
      }

      unint64_t v107 = v79;
      sub_17E70();
      uint64_t v108 = _convertNSErrorToError(_:)(v107);

      uint64_t v218 = v108;
      swift_willThrow(v109, v110, v111, v112, v113, v114, v115, v116);
    }

    else
    {
      sub_17E70();
      sub_93014();
      os_log_type_t v93 = sub_1BCD0();
      if (sub_1BB80(v93))
      {
        uint64_t v94 = (_WORD *)sub_1BA1C(2LL);
        *uint64_t v94 = 0;
        sub_1BAA8(&dword_0, v95, v96, "Could not get timer action from timer.");
        sub_1B904((uint64_t)v94);
      }

      uint64_t v97 = sub_67C4((uint64_t *)&unk_FF830);
      unint64_t v98 = sub_1E324();
      uint64_t v99 = swift_allocError(v97, v98, 0LL, 0LL);
      *uint64_t v100 = 1;
      uint64_t v218 = v99;
      swift_willThrow(v99, v100, v101, v102, v103, v104, v105, v106);
    }

    uint64_t v226 = v0[53];
    uint64_t v235 = v0[50];
    uint64_t v244 = v0[47];
    uint64_t v252 = v0[46];
    uint64_t v259 = v0[43];
    uint64_t v264 = v0[42];
    uint64_t v269 = v0[39];
    uint64_t v272 = v0[38];
    (*(void (**)(void, void))(v0[69] + 8LL))(v0[70], v0[68]);
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    sub_1BABC();
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    uint64_t v117 = sub_1B838();
    uint64_t v125 = sub_1B8C4(v117, v118, v119, v120, v121, v122, v123, v124, v209, v218, v226);
    uint64_t v133 = sub_1B8BC(v125, v126, v127, v128, v129, v130, v131, v132, v210, v219, v227, v235);
    uint64_t v141 = sub_1B8B4(v133, v134, v135, v136, v137, v138, v139, v140, v211, v220, v228, v236, v244);
    uint64_t v149 = sub_1B864(v141, v142, v143, v144, v145, v146, v147, v148, v212, v221, v229, v237, v245, v252);
    uint64_t v157 = sub_1B874(v149, v150, v151, v152, v153, v154, v155, v156, v213, v222, v230, v238, v246, v253, v259);
    uint64_t v165 = sub_1B8AC(v157, v158, v159, v160, v161, v162, v163, v164, v214, v223, v231, v239, v247, v254, v260, v264);
    uint64_t v173 = sub_1B8A4( v165,  v166,  v167,  v168,  v169,  v170,  v171,  v172,  v215,  v224,  v232,  v240,  v248,  v255,  v261,  v265,  v269);
    sub_1B958( v173,  v174,  v175,  v176,  v177,  v178,  v179,  v180,  v216,  v225,  v233,  v241,  v249,  v256,  v262,  v266,  v270,  v272);
    sub_92FD8();
    __asm { BR              X0 }
  }

  swift_bridgeObjectRetain_n(v0[33], 2LL);
  sub_93014();
  os_log_type_t v182 = sub_1BCD0();
  BOOL v183 = sub_2BA2C(v182);
  unint64_t v184 = v0[33];
  char v267 = v61;
  if (v183)
  {
    unint64_t v185 = (uint8_t *)sub_1BA1C(12LL);
    *(_DWORD *)unint64_t v185 = 134217984;
    if (v184 >> 62)
    {
      else {
        uint64_t v208 = v184 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v0[33]);
      uint64_t v186 = _CocoaArrayWrapper.endIndex.getter(v208);
      sub_2B7C4();
    }

    else
    {
      uint64_t v186 = *(void *)((char *)&dword_10 + (v184 & 0xFFFFFFFFFFFFF8LL));
    }

    sub_2B7C4();
    v0[25] = v186;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 25, v16, v185 + 4, v185 + 12);
    sub_2B7C4();
    sub_1E7D8( &dword_0,  (os_log_s *)v56,  v182,  "[makePromptForItems] Using multi-timer snippet model for %ld timers.",  v185);
    sub_1B904((uint64_t)v185);
  }

  else
  {
    sub_2B644(v184);
  }

  uint64_t v187 = v0[64];
  uint64_t v257 = v0[62];
  uint64_t v188 = v0[52];
  uint64_t v189 = v0[53];
  uint64_t v191 = v0[50];
  uint64_t v190 = v0[51];
  uint64_t v192 = v0[49];
  uint64_t v242 = v0[48];
  uint64_t v193 = v0[35];
  v0[24] = v0[33];
  uint64_t v194 = sub_67C4(&qword_FC260);
  uint64_t v195 = type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v196 = swift_getWitnessTable(&protocol conformance descriptor for [A], v194);
  v0[74] = sub_B5F50( (void (*)(char *, uint64_t))sub_92DC0,  v193,  v194,  v195,  (uint64_t)&type metadata for Never,  v196,  (uint64_t)&protocol witness table for Never,  v197);
  (*(void (**)(uint64_t, void, uint64_t))(v188 + 104))( v189,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v190);
  (*(void (**)(uint64_t, void *, uint64_t))(v192 + 16))(v191, v268, v242);
  uint64_t v198 = mach_absolute_time();
  uint64_t v199 = SiriTimeMeasurement.init(_:log:startTime:)(v189, v191, v198);
  static SiriTimeFeatureFlagsImpl.instance.getter(v199);
  LOBYTE(v190) = SiriTimeFeatureFlagsImpl.isTimerSmartEnabled()();
  v267(v187, v257);
  uint64_t v200 = v0[43];
  if ((v190 & 1) != 0)
  {
    type metadata accessor for TimerBaseCATs_Async(0LL);
    sub_92FBC();
    v0[75] = CATWrapper.__allocating_init(options:globals:)(v200, 0LL);
    unint64_t v201 = (void *)swift_task_alloc(dword_FC4AC);
    v0[76] = v201;
    *unint64_t v201 = v0;
    v201[1] = sub_90BDC;
    sub_92FD8();
    return sub_2FBC0();
  }

  else
  {
    type metadata accessor for TimerBaseCATsSimple(0LL);
    sub_92FBC();
    v0[85] = sub_2BEEC();
    uint64_t v203 = (void *)swift_task_alloc(dword_FDA84);
    v0[86] = v203;
    *uint64_t v203 = v0;
    v203[1] = sub_9107C;
    sub_92FD8();
    return sub_5A69C(v204);
  }

uint64_t sub_90BDC()
{
  *(void *)(v0 + 616) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    sub_18034();
    sub_2B7C4();
  }

  sub_1B9B8();
  return sub_2F414(v3, v4, v5);
}

uint64_t sub_90C90()
{
  uint64_t v1 = v0[47];
  uint64_t v2 = v0[45];
  uint64_t v3 = TemplatingResult.sections.getter();
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_8EF98(v3, (uint64_t (*)(void))&type metadata accessor for TemplatingSection, v1);
  swift_bridgeObjectRelease(v3);
  uint64_t v4 = type metadata accessor for TemplatingSection(0LL);
  uint64_t v5 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v1, 1LL, v4);
  if ((_DWORD)v5 == 1)
  {
    sub_7C258(v5, &qword_FDDF8);
    uint64_t v6 = 0LL;
    unint64_t v7 = 0xE000000000000000LL;
  }

  else
  {
    uint64_t v9 = v0[41];
    uint64_t v8 = v0[42];
    uint64_t v10 = v0[40];
    TemplatingSection.content.getter();
    uint64_t v11 = sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL));
    uint64_t v6 = TemplatingText.text.getter(v11);
    unint64_t v7 = v12;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }

  v0[79] = v7;
  v0[78] = v6;
  type metadata accessor for TimerBaseCATsSimple(0LL);
  sub_92FBC();
  v0[80] = sub_2BEEC();
  os_log_type_t v13 = (void *)swift_task_alloc(dword_FDA84);
  v0[81] = v13;
  *os_log_type_t v13 = v0;
  v13[1] = sub_90DE8;
  return sub_5A69C(v0[73]);
}

uint64_t sub_90DE8(uint64_t a1)
{
  v2[82] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v2[73];
    sub_2B750();
    sub_1BC04();
    sub_18034();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    swift_bridgeObjectRelease(v2[73]);
    sub_2B750();
    v2[83] = a1;
  }

  sub_1B9B8();
  return sub_92EDC(v6, v7, v8);
}

uint64_t sub_90EC0(uint64_t a1)
{
  uint64_t v2 = v1[79];
  uint64_t v3 = v1[78];
  uint64_t v4 = v1[74];
  static DialogPhase.clarification.getter(a1);
  uint64_t v5 = type metadata accessor for SiriTimePluginModel(0LL);
  v1[10] = v5;
  v1[11] = sub_E538( (unint64_t *)&qword_FC2B0,  type metadata accessor for SiriTimePluginModel,  (uint64_t)&protocol conformance descriptor for SiriTimePluginModel);
  uint64_t v6 = sub_DB90(v1 + 7);
  *uint64_t v6 = v4;
  type metadata accessor for TimerSelectorModel(0LL);
  v1[20] = v3;
  v1[21] = v2;
  Loggable.init(wrappedValue:)(v1 + 20, &type metadata for String);
  swift_storeEnumTagMultiPayload(v6, v5, 1LL);
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
  v1[84] = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_90FE8;
  sub_93044();
  sub_92FA0();
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
}

uint64_t sub_90FE8()
{
  uint64_t v1 = (void *)v0[83];
  uint64_t v2 = v0[37];
  sub_2B4F0(v0[84]);

  uint64_t v3 = sub_2B73C(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_7C258(v3, &qword_FC2B8);
  sub_1B9B8();
  return sub_92EDC(v4, v5, v6);
}

uint64_t sub_9107C(uint64_t a1)
{
  v2[87] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_2B750();
    sub_18034();
    sub_1BC04();
  }

  else
  {
    swift_bridgeObjectRelease(v2[73]);
    sub_2B750();
    v2[88] = a1;
  }

  sub_1B9B8();
  return sub_92EDC(v5, v6, v7);
}

uint64_t sub_91148(uint64_t a1)
{
  uint64_t v2 = v1[74];
  static DialogPhase.clarification.getter(a1);
  uint64_t v3 = type metadata accessor for SiriTimePluginModel(0LL);
  v1[15] = v3;
  v1[16] = sub_E538( (unint64_t *)&qword_FC2B0,  type metadata accessor for SiriTimePluginModel,  (uint64_t)&protocol conformance descriptor for SiriTimePluginModel);
  uint64_t v4 = sub_DB90(v1 + 12);
  *uint64_t v4 = v2;
  swift_storeEnumTagMultiPayload(v4, v3, 0LL);
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
  v1[89] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_91228;
  sub_93044();
  sub_92FA0();
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
}

uint64_t sub_91228()
{
  uint64_t v1 = (void *)v0[88];
  uint64_t v2 = v0[37];
  sub_2B4F0(v0[89]);

  uint64_t v3 = sub_2B73C(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_7C258(v3, &qword_FC2B8);
  sub_1B9B8();
  return sub_92EDC(v4, v5, v6);
}

#error "91340: call analysis failed (funcsize=51)"
uint64_t sub_91388()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  sub_1BBCC();
  v0[94] = v2;
  v0[95] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease(v0[73]);
  sub_1B9B8();
  return sub_2F414(v3, v4, v5);
}

uint64_t sub_91438(uint64_t a1)
{
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v1 + 768) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_914C8;
  return sub_92F94();
}

uint64_t sub_914C8()
{
  v0[97] = v1;
  swift_task_dealloc();
  uint64_t v3 = (void *)v0[94];
  (*(void (**)(void, void))(v0[37] + 8LL))(v0[38], v0[36]);

  sub_1B9B8();
  return sub_2F414(v4, v5, v6);
}

#error "91610: call analysis failed (funcsize=56)"
#error "916AC: call analysis failed (funcsize=39)"
#error "91748: call analysis failed (funcsize=39)"
#error "917E4: call analysis failed (funcsize=39)"
#error "9188C: call analysis failed (funcsize=42)"
#error "91934: call analysis failed (funcsize=42)"
uint64_t sub_9197C(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v2 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = [*a1 identifier];
  if (v6)
  {
    uint64_t v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = 0xE000000000000000LL;
  }

  sub_20B44();
  swift_bridgeObjectRelease(v9);
  sub_B63C0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_91A84(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_2BB7C();
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[5] = v4;
  v2[6] = sub_1B6C8(v4);
  uint64_t v5 = sub_2BB74();
  void v2[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  _BYTE v2[8] = v6;
  void v2[9] = sub_1B6C8(v6);
  uint64_t v7 = sub_1BD34();
  v2[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[11] = v8;
  v2[12] = sub_1B6C8(v8);
  uint64_t v9 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[13] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[14] = v10;
  v2[15] = sub_1B6C8(v10);
  uint64_t v11 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[16] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[17] = v12;
  v2[18] = sub_1B6C8(v12);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_91B30()
{
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v14 = sub_5474(v2[10], (uint64_t)qword_FF910);
  Logger.logObject.getter(v14);
  os_log_type_t v3 = sub_2BFB4();
  if (sub_2B864(v3))
  {
    uint64_t v4 = (uint8_t *)sub_1BA1C(2LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v0, v1, "ResponseTimerDisambiguationStrategy.makeErrorResponse(error:)", v4, 2u);
    sub_1B904((uint64_t)v4);
  }

  uint64_t v6 = v2[14];
  uint64_t v5 = v2[15];
  uint64_t v8 = v2[12];
  uint64_t v7 = v2[13];
  uint64_t v9 = v2[10];
  uint64_t v10 = v2[11];

  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))( v5,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v14, v9);
  uint64_t v11 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v5, v8, v11);
  uint64_t v12 = (uint64_t **)swift_task_alloc(dword_100564);
  v2[19] = (uint64_t)v12;
  char *v12 = v2;
  v12[1] = (uint64_t *)sub_91C84;
  return sub_AC948();
}

uint64_t sub_91C84()
{
  *(void *)(v2 + 160) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 168) = v0;
  }
  sub_1B9B8();
  return sub_2F414(v4, v5, v6);
}

uint64_t sub_91CDC(uint64_t a1)
{
  uint64_t v2 = static DialogPhase.error.getter(a1);
  NLContextUpdate.init()(v2);
  os_log_type_t v3 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v1 + 176) = v3;
  void *v3 = v1;
  v3[1] = sub_91D4C;
  return sub_92F94();
}

uint64_t sub_91D4C()
{
  os_log_type_t v3 = (void *)v2[21];
  uint64_t v4 = v2[8];
  *uint64_t v5 = *v1;
  v2[23] = v0;
  swift_task_dealloc();

  sub_92FC8();
  sub_2B73C(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_1B9B8();
  return sub_92F40(v6, v7, v8);
}

uint64_t sub_91DC4()
{
  uint64_t v1 = (uint64_t (*)(void))sub_1BB00();
  return sub_33DC4(v1);
}

uint64_t sub_91E1C()
{
  return sub_2B64C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_91E6C()
{
  return sub_2B64C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_91EBC(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_2BB7C();
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = sub_1B6C8(v3);
  uint64_t v4 = sub_2BB74();
  v1[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[7] = v5;
  v1[8] = sub_1B6C8(v5);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_91F18()
{
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v2 = sub_1BD34();
  sub_39658(v2, (uint64_t)qword_FF910);
  os_log_type_t v3 = sub_1BCD0();
  if (sub_1BB80(v3))
  {
    uint64_t v4 = (_WORD *)sub_1BA1C(2LL);
    *uint64_t v4 = 0;
    sub_1BAA8(&dword_0, v5, v6, "ResponseTimerDisambiguationStrategy.makeFlowCancelledResponse()");
    sub_1B904((uint64_t)v4);
  }

  uint64_t v8 = static DialogPhase.canceled.getter(v7);
  NLContextUpdate.init()(v8);
  uint64_t v9 = (uint64_t **)swift_task_alloc(dword_FC694);
  v1[9] = (uint64_t)v9;
  *uint64_t v9 = v1;
  v9[1] = (uint64_t *)sub_92000;
  return sub_33530(v1[2], v1[8], v1[5]);
}

uint64_t sub_92000()
{
  uint64_t v2 = *v1;
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(v2 + 56);
  sub_1BC0C(&v9);
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  sub_92FC8();
  sub_2B73C(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (v0)
  {
    sub_1B9B8();
    return sub_92F40(v4, v5, v6);
  }

  else
  {
    swift_task_dealloc();
    sub_1BABC();
    uint64_t v8 = (uint64_t (*)(void))sub_1BB00();
    return sub_2B64C(v8);
  }

uint64_t sub_92098()
{
  return v0;
}

uint64_t sub_920D4()
{
  uint64_t v0 = sub_93030();
  return swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for ResponseTimerSimpleDisambiguationStrategy( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_44F6C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ResponseTimerSimpleDisambiguationStrategy);
}

void sub_920F8(uint64_t a1)
{
  if (!qword_FFA70[0])
  {
    uint64_t v2 = type metadata accessor for WindowedPaginationParameters(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, qword_FFA70);
    }
  }

uint64_t sub_9214C(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + 296);
}

uint64_t sub_92184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc(dword_FFA4C);
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_921E4;
  return sub_8F8F0(a2, a3);
}

uint64_t sub_921E4()
{
  if (!v1) {
    **(void **)(v2 + 16) = v0;
  }
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_9222C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_FFA54);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10E90;
  return sub_8FB78(a1, a2);
}

uint64_t sub_9228C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to SimpleDisambiguationPromptStrategy.makeRepromptOnEmptyParse(items:)[1]);
  *(void *)(v4 + 16) = v9;
  uint64_t v12 = type metadata accessor for ResponseTimerSimpleDisambiguationStrategy(0LL, *(void *)(a3 + 80), v10, v11);
  *uint64_t v9 = v4;
  v9[1] = sub_10E90;
  return SimpleDisambiguationPromptStrategy.makeRepromptOnEmptyParse(items:)(a1, a2, v12, a4);
}

uint64_t sub_92314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to SimpleDisambiguationPromptStrategy.makeRepromptOnLowConfidence(items:)[1]);
  *(void *)(v4 + 16) = v9;
  uint64_t v12 = type metadata accessor for ResponseTimerSimpleDisambiguationStrategy(0LL, *(void *)(a3 + 80), v10, v11);
  *uint64_t v9 = v4;
  v9[1] = sub_10E90;
  return SimpleDisambiguationPromptStrategy.makeRepromptOnLowConfidence(items:)(a1, a2, v12, a4);
}

uint64_t sub_9239C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_FFA6C);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10E90;
  return sub_91EBC(a1);
}

uint64_t sub_923EC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_FFA64);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10E90;
  return sub_91A84(a1);
}

uint64_t sub_9243C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  void v4[6] = v3;
  void v4[3] = a1;
  v4[4] = a2;
  uint64_t v5 = type metadata accessor for WindowingDisambiguationInputType(0LL);
  v4[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[8] = v6;
  v4[9] = sub_1B6C8(v6);
  uint64_t v7 = type metadata accessor for Input(0LL);
  v4[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[11] = v8;
  v4[12] = sub_1B6C8(v8);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_924A4()
{
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(os_log_s **)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = sub_1BD34();
  sub_5474(v5, (uint64_t)qword_FF910);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, os_log_s *))(v2 + 16))(v1, v4, v3);
  Logger.logObject.getter(v6);
  os_log_type_t v7 = sub_2BFB4();
  BOOL v8 = sub_2B864(v7);
  uint64_t v9 = *(void *)(v0 + 80);
  if (v8)
  {
    uint64_t v10 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v11 = sub_1BA1C(32LL);
    uint64_t v23 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = sub_E538( (unint64_t *)&unk_FEC58,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter(v9, v12);
    unint64_t v15 = v14;
    *(void *)(v0 + 16) = sub_683C(v13, v14, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v15);
    sub_93004();
    sub_1E7D8(&dword_0, v3, (os_log_type_t)v4, "TimerDisambiguation.parseWindowActionFromInput(input:items:): %s", v10);
    sub_1E7D0(v11);
    sub_1B904(v11);
    sub_1B904((uint64_t)v10);
  }

  else
  {
    sub_93004();
  }

  uint64_t v16 = *(void *)(v0 + 48);
  sub_92828(*(os_log_s **)(v0 + 32), *(void *)(v0 + 72));
  uint64_t v17 = sub_92768(v16);
  uint64_t v19 = v18;
  *(void *)(v0 + 104) = v18;
  unint64_t v20 = (void *)swift_task_alloc(async function pointer to static ResponseDisambigUtils.parseWindowActionFromInput<A>(input:windowInputType:items:choiceSelector:)[1]);
  *(void *)(v0 + 112) = v20;
  uint64_t v21 = type metadata accessor for SiriTimer(0LL);
  *unint64_t v20 = v0;
  v20[1] = sub_926B0;
  return static ResponseDisambigUtils.parseWindowActionFromInput<A>(input:windowInputType:items:choiceSelector:)( *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 72),  *(void *)(v0 + 40),  v17,  v19,  v21);
}

uint64_t sub_926B0()
{
  uint64_t v2 = *(void *)(v1 + 64);
  sub_1BC0C(v3);
  *(void *)(v1 + 120) = v0;
  swift_task_dealloc();
  sub_2B73C(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  if (v0)
  {
    sub_1B9B8();
    return sub_92EDC(v4, v5, v6);
  }

  else
  {
    swift_release();
    sub_1BABC();
    sub_1B86C();
    BOOL v8 = (uint64_t (*)(void))sub_1BB00();
    return sub_33DC4(v8);
  }

uint64_t sub_9272C()
{
  return sub_2B64C(*(uint64_t (**)(void))(v0 + 8));
}

void *sub_92768(uint64_t a1)
{
  return &unk_FFB98;
}

uint64_t sub_92798(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_FFA4C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_927F8;
  return sub_8F8F0(a1, a2);
}

uint64_t sub_927F8(uint64_t a1)
{
  uint64_t v4 = sub_1BAE0();
  if (!v1) {
    uint64_t v4 = a1;
  }
  return sub_78878(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_92828@<X0>(os_log_s *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v6 = sub_1BD34();
  os_log_type_t v7 = (os_log_s *)sub_39658(v6, (uint64_t)qword_FF910);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v10 = sub_1BA1C(32LL);
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getMetatypeMetadata(*(void *)(v5 + 288));
    uint64_t v11 = String.init<A>(describing:)();
    unint64_t v13 = v12;
    uint64_t v15 = sub_683C(v11, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v13);
    sub_1E7D8(&dword_0, v7, v8, "TimerDisambiguation.determineInputType(input:) with intent type: %s", v9);
    sub_1E7D0(v10);
    sub_1B904(v10);
    sub_1B904((uint64_t)v9);
  }

  return static TimerResponseDisambiguationUtils.determineWindowInputType(input:)(a1, a2);
}

uint64_t type metadata accessor for ResponseTimerDisambiguationStrategy( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_44F6C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ResponseTimerDisambiguationStrategy);
}

void sub_929A8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_929C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v7 = (void *)swift_task_alloc(dword_FFAFC);
  *(void *)(v3 + 16) = v7;
  *os_log_type_t v7 = v3;
  v7[1] = sub_10E90;
  return sub_9243C(a1, a2, a3);
}

uint64_t sub_92A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v7 = (void *)swift_task_alloc(dword_FFA5C);
  *(void *)(v3 + 16) = v7;
  *os_log_type_t v7 = v3;
  v7[1] = sub_20504;
  return sub_8FCB4(a1, a2, a3);
}

uint64_t sub_92AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ListPromptFlowStrategy.makeRepromptOnEmptyParse(items:paginationParameters:)[1]);
  *(void *)(v5 + 16) = v11;
  uint64_t v14 = type metadata accessor for ResponseTimerDisambiguationStrategy(0LL, *(void *)(a4 + 288), v12, v13);
  *uint64_t v11 = v5;
  v11[1] = sub_10E90;
  return ListPromptFlowStrategy.makeRepromptOnEmptyParse(items:paginationParameters:)(a1, a2, a3, v14, a5);
}

uint64_t sub_92B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ListPromptFlowStrategy.makeRepromptOnLowConfidence(items:paginationParameters:)[1]);
  *(void *)(v5 + 16) = v11;
  uint64_t v14 = type metadata accessor for ResponseTimerDisambiguationStrategy(0LL, *(void *)(a4 + 288), v12, v13);
  *uint64_t v11 = v5;
  v11[1] = sub_10E90;
  return ListPromptFlowStrategy.makeRepromptOnLowConfidence(items:paginationParameters:)(a1, a2, a3, v14, a5);
}

uint64_t sub_92BD0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_FFA64);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10E90;
  return sub_91A84(a1);
}

uint64_t sub_92C24(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C5020, a1);
}

uint64_t sub_92C34(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C50C0, a1);
}

uint64_t sub_92C44(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C5128, a1);
}

uint64_t sub_92C54(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C5160, a1);
}

uint64_t sub_92C64(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C5198, a1);
}

uint64_t sub_92C74(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C5248, a1);
}

uint64_t sub_92C84(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C5218, a1);
}

uint64_t sub_92C94(uint64_t a1)
{
  return swift_getWitnessTable(&unk_C51F0, a1);
}

uint64_t sub_92CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_FFB94);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_92D04;
  return sub_92798(a1, a2);
}

uint64_t sub_92D04(uint64_t a1)
{
  return sub_78878(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_92D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FFBA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_92D78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FFBA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_92DC0(id *a1)
{
  return sub_9197C(a1);
}

uint64_t sub_92DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FFBA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_92E24()
{
  return sub_912BC();
}

uint64_t sub_92E78()
{
  return (*(uint64_t (**)(void, void))(v0[69] + 8LL))(v0[70], v0[68]);
}

uint64_t sub_92EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_92EE8()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v0 + 440) + 8LL))(v1, *(void *)(v0 + 432));
}

uint64_t sub_92F2C()
{
  return (*(uint64_t (**)(void, void))(v0[55] + 8LL))(v0[57], v0[54]);
}

uint64_t sub_92F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_92F58()
{
  return (*(uint64_t (**)(void, void))(v0[17] + 8LL))(v0[18], v0[16]);
}

uint64_t sub_92F78()
{
  return sub_21470(*(void *)(v0 + 728), *(void *)(v0 + 736));
}

uint64_t sub_92F94()
{
  return ((uint64_t (*)(void))PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:))();
}

void sub_92FA0()
{
  *(void *)(v0 + 16) = 0LL;
}

uint64_t sub_92FBC()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_92FC8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

  ;
}

uint64_t sub_92FF4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_93004()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_93014()
{
  return Logger.logObject.getter();
}

uint64_t sub_9301C(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_93024(uint64_t a1)
{
  return v3(a1, v2, v1);
}

uint64_t sub_93030()
{
  return v0;
}

uint64_t sub_93044()
{
  return *(void *)(v0 + 256);
}

void *sub_93058(uint64_t a1)
{
  return sub_93128(a1, &qword_FFC38, &qword_FCF98, &qword_FFC40, &qword_FFC48);
}

void *sub_9308C(uint64_t a1)
{
  return sub_93128(a1, &qword_FEC08, &qword_FF8C8, &qword_FFC28, &qword_FFC30);
}

void *sub_930C0(uint64_t a1)
{
  return sub_93128(a1, &qword_FF538, &qword_FFBF8, &qword_FFC00, &qword_FFC08);
}

void *sub_930F4(uint64_t a1)
{
  return sub_93128(a1, &qword_FF720, &qword_FFC10, &qword_FFC18, &qword_FFC20);
}

void *sub_93128(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v8 = sub_67C4(a2);
  uint64_t v9 = (void *)ParameterResolutionRecord.result.getter();
  id v10 = [v9 disambiguationItems];

  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, (char *)&type metadata for Any + 8);
  uint64_t v12 = sub_935F0(v11);
  swift_bridgeObjectRelease(v11);
  if (v12)
  {
    uint64_t v13 = (void *)ParameterResolutionRecord.intent.getter(v8);
    if (qword_FB210 != -1) {
      swift_once(&qword_FB210, sub_64B40);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    sub_5474(v14, (uint64_t)qword_FE038);
    id v15 = v13;
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      Swift::Bool v60 = a5;
      uint64_t v18 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v55 = sub_1BA1C(32LL);
      uint64_t v64 = v55;
      uint64_t v58 = a3;
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = v18 + 12;
      uint64_t v53 = v18 + 4;
      buf = v18;
      uint64_t v57 = v12;
      id v20 = v15;
      id v21 = v15;
      uint64_t v22 = a4;
      id v23 = [v20 description];
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      unint64_t v26 = v25;

      a4 = v22;
      id v15 = v21;
      uint64_t v62 = sub_683C(v24, v26, &v64);
      uint64_t v27 = v19;
      a3 = v58;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v53, v27);

      uint64_t v12 = v57;
      swift_bridgeObjectRelease(v26);
      _os_log_impl(&dword_0, v16, v17, "Creating ResponseTimerDisambiguationFlowProvider with intent: %s", buf, 0xCu);
      swift_arrayDestroy(v55, 1LL);
      sub_1B904(v55);
      a5 = v60;
      sub_1B904((uint64_t)buf);
    }

    else
    {
    }

    uint64_t TimerIntent = type metadata accessor for CreateTimerIntent(0LL);
    if (sub_93BF0(TimerIntent))
    {
      int v40 = 1;
    }

    else
    {
      uint64_t v41 = type metadata accessor for DeleteTimerIntent(0LL);
      if (sub_93BF0(v41))
      {
        int v40 = 2;
      }

      else
      {
        uint64_t v42 = type metadata accessor for SearchTimerIntent(0LL);
        if (sub_93BF0(v42))
        {
          int v40 = 11;
        }

        else
        {
          uint64_t v43 = type metadata accessor for SetTimerAttributeIntent(0LL);
          if (sub_93BF0(v43))
          {
            int v40 = 12;
          }

          else
          {
            uint64_t v44 = type metadata accessor for PauseTimerIntent(0LL);
            if (sub_93BF0(v44))
            {
              int v40 = 5;
            }

            else
            {
              uint64_t v45 = type metadata accessor for ResetTimerIntent(0LL);
              if (sub_93BF0(v45))
              {
                int v40 = 7;
              }

              else
              {
                uint64_t v46 = type metadata accessor for ResumeTimerIntent(0LL);
                if (sub_93BF0(v46))
                {
                  int v40 = 8;
                }

                else
                {
                  id v56 = v15;
                  id v47 = v15;
                  uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
                  os_log_type_t v49 = static os_log_type_t.error.getter();
                  if (os_log_type_enabled(v48, v49))
                  {
                    uint64_t v50 = (uint8_t *)sub_1BA1C(12LL);
                    uint64_t v61 = (void *)sub_1BA1C(8LL);
                    *(_DWORD *)uint64_t v50 = 138412290;
                    uint64_t v64 = (uint64_t)v47;
                    uint64_t v59 = a3;
                    id v51 = v47;
                    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v50 + 4, v50 + 12);
                    *uint64_t v61 = v47;

                    a3 = v59;
                    _os_log_impl( &dword_0,  v48,  v49,  "Unable to recognize the alarm intent %@. Returning default verb of .unknown",  v50,  0xCu);
                    sub_67C4((uint64_t *)&unk_FD5F0);
                    swift_arrayDestroy(v61, 1LL);
                    sub_1B904((uint64_t)v61);
                    sub_1B904((uint64_t)v50);
                  }

                  else
                  {

                    uint64_t v48 = (os_log_s *)v47;
                  }

                  int v40 = 13;
                  id v15 = v56;
                }
              }
            }
          }
        }
      }
    }

    uint64_t v52 = sub_67C4(a3);
    swift_allocObject(v52, 112LL, 7LL);
    return sub_936E8((uint64_t)v12, v15, v40, a4, a5);
  }

  else
  {
    uint64_t v28 = sub_67C4((uint64_t *)&unk_FF830);
    uint64_t v29 = sub_10D58((unint64_t *)&qword_FCC50, (uint64_t *)&unk_FF830, (uint64_t)&unk_C4340);
    uint64_t v30 = swift_allocError(v28, v29, 0LL, 0LL);
    *os_log_type_t v31 = 1;
    return (void *)swift_willThrow(v30, v31, v32, v33, v34, v35, v36, v37);
  }

void *sub_935F0(uint64_t a1)
{
  uint64_t v12 = _swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (!v2) {
    return v12;
  }
  for (uint64_t i = a1 + 32; ; i += 32LL)
  {
    sub_6A5C(i, (uint64_t)v11);
    uint64_t v4 = type metadata accessor for SiriTimer(0LL);
    uint64_t v5 = swift_dynamicCast(&v10, v11, (char *)&type metadata for Any + 8, v4, 6LL);
    if (!(_DWORD)v5) {
      break;
    }
    id v6 = v10;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v5);
    uint64_t v7 = v12[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v7);
    uint64_t v8 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v6);
    specialized ContiguousArray._endMutation()(v8);
    if (!--v2) {
      return v12;
    }
  }

  id v10 = 0LL;
  swift_release();

  return 0LL;
}

void *sub_936E8(uint64_t a1, void *a2, int a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v41 = a4;
  uint64_t v7 = v5;
  uint64_t v11 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v44);
  uint64_t v14 = type metadata accessor for ResponseFactory(0LL);
  sub_2B838(v14);
  uint64_t v15 = ResponseFactory.init()();
  v43[2] = v14;
  v43[3] = &protocol witness table for ResponseFactory;
  uint64_t v42 = v15;
  uint64_t v16 = type metadata accessor for PatternFlowProvider(0LL);
  sub_2B838(v16);
  uint64_t v17 = PatternFlowProvider.init(outputPublisher:responseGenerator:)(v44, &v42);
  v5[8] = v16;
  v5[9] = &protocol witness table for PatternFlowProvider;
  v5[5] = v17;
  type metadata accessor for TimerBaseCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  v5[10] = CATWrapper.__allocating_init(options:globals:)(v13, 0LL);
  v5[11] = 0xD000000000000018LL;
  v5[12] = 0x80000000000C9790LL;
  if (qword_FB2C0 != -1) {
    swift_once(&qword_FB2C0, sub_8F010);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  sub_5474(v18, (uint64_t)qword_FF910);
  sub_93C10();
  id v19 = a2;
  id v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc(22LL, -1LL);
    uint64_t v37 = swift_slowAlloc(32LL, -1LL);
    v44[0] = v37;
    *(_DWORD *)uint64_t v22 = 134218242;
    int v40 = a3;
    uint64_t v39 = a5;
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0) {
        uint64_t v35 = a1;
      }
      else {
        uint64_t v35 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      uint64_t v23 = _CocoaArrayWrapper.endIndex.getter(v35);
      sub_1BC04();
    }

    else
    {
      uint64_t v23 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    }

    sub_1BC04();
    uint64_t v42 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v22 + 4, v22 + 12);
    sub_1BC04();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v36 = v22 + 14;
    id v24 = v19;
    id v38 = v19;
    id v25 = v24;
    id v26 = [v24 description];
    uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    unint64_t v29 = v28;

    uint64_t v42 = sub_683C(v27, v29, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v36, v22 + 22);

    id v19 = v38;
    swift_bridgeObjectRelease(v29);
    _os_log_impl( &dword_0,  v20,  v21,  "ResponseTimerDisambiguationFlowProvider.init with %ld items and intent: %s",  (uint8_t *)v22,  0x16u);
    uint64_t v30 = v37;
    swift_arrayDestroy(v37, 1LL);
    sub_1B904(v30);
    sub_1B904(v22);

    a5 = v39;
  }

  else
  {

    swift_bridgeObjectRelease_n(a1, 2LL);
  }

  v7[2] = a1;
  v7[13] = v19;
  uint64_t v31 = v7[10];
  uint64_t v32 = sub_67C4(v41);
  sub_2B838(v32);
  v7[3] = sub_93BFC();
  uint64_t v33 = sub_67C4(a5);
  sub_2B838(v33);
  v7[4] = sub_93BFC();
  sub_93C10();
  swift_retain_n(v31, 2LL);
  return v7;
}

uint64_t sub_93A60(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = v3 + qword_FF9B0;
  uint64_t v8 = type metadata accessor for WindowedPaginationParameters(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v7, 1LL, 1LL, v8);
  *(void *)(v3 + qword_FF9B8) = 0x8000000000000000LL;
  *(void *)(v3 + qword_FF9C0) = 0LL;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(_BYTE *)(v3 + 32) = a3;
  return v3;
}

void *sub_93AE4(uint64_t a1)
{
  return sub_93128(a1, &qword_FE630, &qword_FFBB8, &qword_FFBE8, &qword_FFBF0);
}

uint64_t sub_93B18(void *a1, uint64_t a2)
{
  *a1 = sub_93AE4(a2);
  return sub_46908(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_93B78()
{
  unint64_t result = qword_FFBC8;
  if (!qword_FFBC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C3DC4, &_s25NeedsConfirmationStrategyVN);
    atomic_store(result, (unint64_t *)&qword_FFBC8);
  }

  return result;
}

unint64_t sub_93BB4()
{
  unint64_t result = qword_FFBD0;
  if (!qword_FFBD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_C2758, &_s20HandleIntentStrategyVN);
    atomic_store(result, (unint64_t *)&qword_FFBD0);
  }

  return result;
}

uint64_t sub_93BF0(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}

uint64_t sub_93BFC()
{
  return sub_93A60(v0, v1, v2);
}

uint64_t sub_93C10()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t type metadata accessor for DismissTimerCATPatternsExecutor(uint64_t a1)
{
  return sub_DAF8(a1, (uint64_t *)&unk_FFC50, (uint64_t)&nominal type descriptor for DismissTimerCATPatternsExecutor);
}

uint64_t sub_93C30(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_101110);
}

void sub_93C6C()
{
  uint64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = sub_67C4(&qword_FBE20);
  uint64_t v9 = swift_allocObject(v8, 224LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_C2D10;
  id v10 = (void *)(v9 + 48);
  sub_960EC();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = 0xEA0000000000656DLL;
  sub_8C84(v1, (uint64_t)v7, &qword_FBD98);
  uint64_t v13 = sub_1BCD8();
  sub_490E4((uint64_t)v7);
  if (v14)
  {
    sub_17A70((uint64_t)v7, &qword_FBD98);
    *(_OWORD *)id v10 = 0u;
    *(_OWORD *)(v9 + 64) = 0u;
  }

  else
  {
    *(void *)(v9 + 72) = v13;
    uint64_t v15 = sub_DB90(v10);
    sub_75590( (uint64_t)v15,  (uint64_t)v7,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32LL));
  }

  *(void *)(v9 + 80) = 0x7954676F6C616964LL;
  *(void *)(v9 + 88) = 0xEA00000000006570LL;
  uint64_t v16 = (int *)type metadata accessor for DismissTimerHandledRemoteParameters(0LL);
  sub_8C84(v1 + v16[5], v2, &qword_FBD98);
  sub_490E4(v2);
  if (v14)
  {
    sub_17A70(v2, &qword_FBD98);
    *(_OWORD *)(v9 + 96) = 0u;
    *(_OWORD *)(v9 + 112) = 0u;
  }

  else
  {
    *(void *)(v9 + 120) = v13;
    uint64_t v17 = sub_DB90((void *)(v9 + 96));
    sub_75590((uint64_t)v17, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32LL));
  }

  *(void *)(v9 + 128) = 0x537373696D736964LL;
  *(void *)(v9 + 136) = 0xEF796C746E656C69LL;
  *(_BYTE *)(v9 + 144) = *(_BYTE *)(v1 + v16[6]);
  sub_96100();
  *(void *)(v9 + 168) = v19;
  *(void *)(v9 + 176) = v18;
  *(void *)(v9 + 184) = 0xE800000000000000LL;
  sub_8C84(v1 + v16[7], v0, &qword_FBD98);
  sub_490E4(v0);
  if (v14)
  {
    sub_17A70(v0, &qword_FBD98);
    *(_OWORD *)(v9 + 192) = 0u;
    *(_OWORD *)(v9 + 208) = 0u;
  }

  else
  {
    *(void *)(v9 + 216) = v13;
    id v20 = sub_DB90((void *)(v9 + 192));
    sub_75590((uint64_t)v20, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32LL));
  }

  sub_1BC3C();
}

void sub_93EA4()
{
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - v7;
  __chkstk_darwin(v6);
  id v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_67C4(&qword_FBE20);
  uint64_t v12 = swift_allocObject(v11, 320LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_C52F0;
  uint64_t v13 = (void *)(v12 + 48);
  strcpy((char *)(v12 + 32), "cancelAction");
  *(_BYTE *)(v12 + 45) = 0;
  *(_WORD *)(v12 + 46) = -5120;
  sub_8C84(v1, (uint64_t)v10, &qword_FBD98);
  uint64_t v14 = sub_1BCD8();
  sub_490E4((uint64_t)v10);
  if (v15)
  {
    sub_17A70((uint64_t)v10, &qword_FBD98);
    *(_OWORD *)uint64_t v13 = 0u;
    *(_OWORD *)(v12 + 64) = 0u;
  }

  else
  {
    *(void *)(v12 + 72) = v14;
    uint64_t v16 = sub_DB90(v13);
    sub_75590( (uint64_t)v16,  (uint64_t)v10,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL));
  }

  strcpy((char *)(v12 + 80), "confirmAction");
  *(_WORD *)(v12 + 94) = -4864;
  uint64_t v17 = (int *)type metadata accessor for DismissTimerPromptConfirmDismissParameters(0LL);
  sub_8C84(v1 + v17[5], (uint64_t)v8, &qword_FBD98);
  sub_490E4((uint64_t)v8);
  if (v15)
  {
    sub_17A70((uint64_t)v8, &qword_FBD98);
    *(_OWORD *)(v12 + 96) = 0u;
    *(_OWORD *)(v12 + 112) = 0u;
  }

  else
  {
    *(void *)(v12 + 120) = v14;
    uint64_t v18 = sub_DB90((void *)(v12 + 96));
    sub_75590( (uint64_t)v18,  (uint64_t)v8,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL));
  }

  sub_960EC();
  *(void *)(v12 + 128) = v19;
  *(void *)(v12 + 136) = 0xEA0000000000656DLL;
  sub_8C84(v1 + v17[6], v2, &qword_FBD98);
  sub_490E4(v2);
  if (v15)
  {
    sub_17A70(v2, &qword_FBD98);
    *(_OWORD *)(v12 + 144) = 0u;
    *(_OWORD *)(v12 + 160) = 0u;
  }

  else
  {
    *(void *)(v12 + 168) = v14;
    id v20 = sub_DB90((void *)(v12 + 144));
    sub_75590((uint64_t)v20, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL));
  }

  *(void *)(v12 + 176) = 0x6E756D6D6F437369LL;
  *(void *)(v12 + 184) = 0xEA00000000006C61LL;
  *(_BYTE *)(v12 + 192) = *(_BYTE *)(v1 + v17[7]);
  *(void *)(v12 + 216) = &type metadata for Bool;
  *(void *)(v12 + 224) = 0x6E6F737265507369LL;
  *(void *)(v12 + 232) = 0xEA00000000006C61LL;
  *(_BYTE *)(v12 + 240) = *(_BYTE *)(v1 + v17[8]);
  sub_96100();
  *(void *)(v12 + 264) = v22;
  *(void *)(v12 + 272) = v21;
  *(void *)(v12 + 280) = 0xE800000000000000LL;
  sub_8C84(v1 + v17[9], v0, &qword_FBD98);
  sub_490E4(v0);
  if (v15)
  {
    sub_17A70(v0, &qword_FBD98);
    *(_OWORD *)(v12 + 288) = 0u;
    *(_OWORD *)(v12 + 304) = 0u;
  }

  else
  {
    *(void *)(v12 + 312) = v14;
    uint64_t v23 = sub_DB90((void *)(v12 + 288));
    sub_75590((uint64_t)v23, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL));
  }

  sub_1BC3C();
}

uint64_t sub_9419C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(_BYTE *)(v4 + 88) = a1;
  uint64_t v5 = type metadata accessor for DismissTimerHandledRemoteParameters(0LL);
  *(void *)(v4 + 48) = sub_960AC(v5);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_941E0()
{
  uint64_t v3 = v1[5];
  uint64_t v2 = v1[6];
  uint64_t v4 = sub_1BCD8();
  sub_96068(v4);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v2 + *(int *)(v3 + 28), 1LL, 1LL, v0);
  sub_96128(*(int *)(v3 + 24));
  sub_93C6C();
  uint64_t v6 = v5;
  v1[7] = v5;
  v1[8] = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_942A8;
  return sub_960A0(0xD00000000000001ALL, 0x80000000000C9820LL, v6, v9);
}

uint64_t sub_942A8()
{
  if (!v1) {
    *(void *)(v3 + 80) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_942F4(uint64_t a1)
{
  return sub_2BB68(*(void *)(v1 + 80), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_94330(uint64_t a1)
{
  return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_94368(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 16) = a3;
  *(_BYTE *)(v5 + 89) = a2;
  *(_BYTE *)(v5 + 88) = a1;
  uint64_t v6 = type metadata accessor for DismissTimerPromptConfirmDismissParameters(0LL);
  *(void *)(v5 + 48) = sub_960AC(v6);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_943B0()
{
  uint64_t v3 = *(int **)(v1 + 40);
  uint64_t v2 = *(void *)(v1 + 48);
  char v4 = *(_BYTE *)(v1 + 88);
  uint64_t v5 = sub_1BCD8();
  sub_96068(v5);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v2 + v3[6], 1LL, 1LL, v0);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v2 + v3[9], 1LL, 1LL, v0);
  *(_BYTE *)(v2 + v3[7]) = v4;
  sub_96128(v3[8]);
  sub_93EA4();
  uint64_t v7 = v6;
  *(void *)(v1 + 56) = v6;
  *(void *)(v1 + 64) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_944A0;
  return sub_960A0(0xD000000000000021LL, 0x80000000000C97F0LL, v7, v10);
}

uint64_t sub_944A0()
{
  if (!v1) {
    *(void *)(v3 + 80) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_944EC(uint64_t a1)
{
  return sub_2BB68(*(void *)(v1 + 80), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_94528(uint64_t a1)
{
  return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_94560()
{
  return type metadata accessor for DismissTimerCATPatternsExecutor(0LL);
}

uint64_t type metadata accessor for DismissTimerPromptConfirmDismissParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_FFDA0, (uint64_t)&nominal type descriptor for DismissTimerPromptConfirmDismissParameters);
}

uint64_t type metadata accessor for DismissTimerHandledRemoteParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_FFD08, (uint64_t)&nominal type descriptor for DismissTimerHandledRemoteParameters);
}

uint64_t *sub_94590(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SpeakableString(0LL);
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_67C4(&qword_FBD98);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v10 = a3[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2 + v10, 1LL, v7))
    {
      uint64_t v13 = sub_67C4(&qword_FBD98);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v11, v12, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v11, 0LL, 1LL, v7);
    }

    uint64_t v14 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    char v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v16, 1LL, v7))
    {
      uint64_t v17 = sub_67C4(&qword_FBD98);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v15, v16, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v15, 0LL, 1LL, v7);
    }
  }

  return a1;
}

uint64_t sub_9474C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t result = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v6, 1LL, v4);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(v6, v4);
  }
  return result;
}

char *sub_94814(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a2[v8], 1LL, v6))
  {
    uint64_t v11 = sub_67C4(&qword_FBD98);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v9, v10, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 0LL, 1LL, v6);
  }

  uint64_t v12 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v14, 1LL, v6))
  {
    uint64_t v15 = sub_67C4(&qword_FBD98);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v13, v14, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v6);
  }

  return a1;
}

char *sub_949A4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  int v7 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v11], 1LL, v6);
  int v15 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v12, v13, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 0LL, 1LL, v6);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = sub_67C4(&qword_FBD98);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
LABEL_13:
  a1[a3[6]] = a2[a3[6]];
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  id v20 = &a2[v18];
  int v21 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v18], 1LL, v6);
  int v22 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v20, 1LL, v6);
  if (!v21)
  {
    uint64_t v23 = *(void *)(v6 - 8);
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v19, v20, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v6);
    goto LABEL_18;
  }

  if (v22)
  {
LABEL_18:
    uint64_t v24 = sub_67C4(&qword_FBD98);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v19, v20, v6);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v19, 0LL, 1LL, v6);
  return a1;
}

char *sub_94C18(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a2[v8], 1LL, v6))
  {
    uint64_t v11 = sub_67C4(&qword_FBD98);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v9, v10, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 0LL, 1LL, v6);
  }

  uint64_t v12 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v13 = &a1[v12];
  int v14 = &a2[v12];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v14, 1LL, v6))
  {
    uint64_t v15 = sub_67C4(&qword_FBD98);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v13, v14, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v6);
  }

  return a1;
}

char *sub_94DA8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  int v7 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v11], 1LL, v6);
  int v15 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v12, v13, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 0LL, 1LL, v6);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = sub_67C4(&qword_FBD98);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
LABEL_13:
  uint64_t v18 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v19 = &a1[v18];
  id v20 = &a2[v18];
  int v21 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v18], 1LL, v6);
  int v22 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v20, 1LL, v6);
  if (!v21)
  {
    uint64_t v23 = *(void *)(v6 - 8);
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v19, v20, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v6);
    goto LABEL_18;
  }

  if (v22)
  {
LABEL_18:
    uint64_t v24 = sub_67C4(&qword_FBD98);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v19, v20, v6);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v19, 0LL, 1LL, v6);
  return a1;
}

uint64_t sub_95018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_95024);
}

void sub_95024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_67C4(&qword_FBD98);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    sub_17EA4(a1, a2, v6);
  }

  else
  {
    unsigned int v7 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v7 >= 2) {
      sub_960D8(v7);
    }
    sub_17B78();
  }

uint64_t sub_95094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_950A0);
}

void sub_950A0()
{
  if (*(_DWORD *)(*(void *)(sub_67C4(&qword_FBD98) - 8) + 84LL) == v3)
  {
    uint64_t v4 = sub_491B8();
    sub_17EB0(v4, v5, v6, v7);
  }

  else
  {
    *(_BYTE *)(v1 + *(int *)(v2 + 24)) = v0 + 1;
    sub_17B78();
  }

void sub_950F0(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = v4[0];
    void v4[2] = &unk_C53A8;
    void v4[3] = v4[0];
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
  }

uint64_t *sub_95164(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SpeakableString(0LL);
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_67C4(&qword_FBD98);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v10 = a3[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2 + v10, 1LL, v7))
    {
      uint64_t v13 = sub_67C4(&qword_FBD98);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v11, v12, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v11, 0LL, 1LL, v7);
    }

    uint64_t v14 = a3[6];
    int v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2 + v14, 1LL, v7))
    {
      uint64_t v17 = sub_67C4(&qword_FBD98);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v15, v16, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v15, 0LL, 1LL, v7);
    }

    uint64_t v18 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v18) = *((_BYTE *)a2 + v18);
    uint64_t v19 = a3[9];
    id v20 = (char *)a1 + v19;
    int v21 = (char *)a2 + v19;
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v21, 1LL, v7))
    {
      uint64_t v22 = sub_67C4(&qword_FBD98);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v20, v21, v7);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v20, 0LL, 1LL, v7);
    }
  }

  return a1;
}

uint64_t sub_9539C(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = a1 + a2[9];
  uint64_t result = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v7, 1LL, v4);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(v7, v4);
  }
  return result;
}

char *sub_95494(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a2[v8], 1LL, v6))
  {
    uint64_t v11 = sub_67C4(&qword_FBD98);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v9, v10, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 0LL, 1LL, v6);
  }

  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a2[v12], 1LL, v6))
  {
    uint64_t v15 = sub_67C4(&qword_FBD98);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v13, v14, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v6);
  }

  uint64_t v16 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v16] = a2[v16];
  uint64_t v17 = a3[9];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v19, 1LL, v6))
  {
    uint64_t v20 = sub_67C4(&qword_FBD98);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v18, v19, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v18, 0LL, 1LL, v6);
  }

  return a1;
}

char *sub_956A0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  int v7 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v11], 1LL, v6);
  int v15 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v12, v13, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 0LL, 1LL, v6);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = sub_67C4(&qword_FBD98);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v18], 1LL, v6);
  int v22 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v20, 1LL, v6);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v19, v20, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v19, 0LL, 1LL, v6);
      goto LABEL_19;
    }

    goto LABEL_18;
  }

  uint64_t v23 = *(void *)(v6 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v6);
LABEL_18:
    uint64_t v24 = sub_67C4(&qword_FBD98);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64LL));
    goto LABEL_19;
  }

  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v19, v20, v6);
LABEL_19:
  a1[a3[7]] = a2[a3[7]];
  a1[a3[8]] = a2[a3[8]];
  uint64_t v25 = a3[9];
  id v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  int v28 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v25], 1LL, v6);
  int v29 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v27, 1LL, v6);
  if (!v28)
  {
    uint64_t v30 = *(void *)(v6 - 8);
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v26, v27, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v26, v6);
    goto LABEL_24;
  }

  if (v29)
  {
LABEL_24:
    uint64_t v31 = sub_67C4(&qword_FBD98);
    memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v26, v27, v6);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v26, 0LL, 1LL, v6);
  return a1;
}

char *sub_959D8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a2[v8], 1LL, v6))
  {
    uint64_t v11 = sub_67C4(&qword_FBD98);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v9, v10, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 0LL, 1LL, v6);
  }

  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  int v14 = &a2[v12];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a2[v12], 1LL, v6))
  {
    uint64_t v15 = sub_67C4(&qword_FBD98);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v13, v14, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v6);
  }

  uint64_t v16 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v16] = a2[v16];
  uint64_t v17 = a3[9];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v19, 1LL, v6))
  {
    uint64_t v20 = sub_67C4(&qword_FBD98);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v18, v19, v6);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v18, 0LL, 1LL, v6);
  }

  return a1;
}

char *sub_95BE4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  int v7 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_67C4(&qword_FBD98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v11], 1LL, v6);
  int v15 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v6);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v12, v13, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 0LL, 1LL, v6);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v16 = *(void *)(v6 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
LABEL_12:
    uint64_t v17 = sub_67C4(&qword_FBD98);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v18], 1LL, v6);
  int v22 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v20, 1LL, v6);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v19, v20, v6);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v19, 0LL, 1LL, v6);
      goto LABEL_19;
    }

    goto LABEL_18;
  }

  uint64_t v23 = *(void *)(v6 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v6);
LABEL_18:
    uint64_t v24 = sub_67C4(&qword_FBD98);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64LL));
    goto LABEL_19;
  }

  (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v19, v20, v6);
LABEL_19:
  uint64_t v25 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v25] = a2[v25];
  uint64_t v26 = a3[9];
  uint64_t v27 = &a1[v26];
  int v28 = &a2[v26];
  int v29 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)&a1[v26], 1LL, v6);
  int v30 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v28, 1LL, v6);
  if (!v29)
  {
    uint64_t v31 = *(void *)(v6 - 8);
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 40))(v27, v28, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v6);
    goto LABEL_24;
  }

  if (v30)
  {
LABEL_24:
    uint64_t v32 = sub_67C4(&qword_FBD98);
    memcpy(v27, v28, *(void *)(*(void *)(v32 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v27, v28, v6);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v27, 0LL, 1LL, v6);
  return a1;
}

uint64_t sub_95F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_95F24);
}

void sub_95F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_67C4(&qword_FBD98);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    sub_17EA4(a1, a2, v6);
  }

  else
  {
    unsigned int v7 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
    if (v7 >= 2) {
      sub_960D8(v7);
    }
    sub_17B78();
  }

uint64_t sub_95F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_95FA0);
}

void sub_95FA0()
{
  if (*(_DWORD *)(*(void *)(sub_67C4(&qword_FBD98) - 8) + 84LL) == v3)
  {
    uint64_t v4 = sub_491B8();
    sub_17EB0(v4, v5, v6, v7);
  }

  else
  {
    *(_BYTE *)(v1 + *(int *)(v2 + 2sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8)) = v0 + 1;
    sub_17B78();
  }

void sub_95FF0(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = v4[0];
    void v4[2] = v4[0];
    void v4[3] = &unk_C53A8;
    void v4[4] = &unk_C53A8;
    v4[5] = v4[0];
    swift_initStructMetadata(a1, 256LL, 6LL, v4, a1 + 16);
  }

uint64_t sub_96068(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1 + *(int *)(v2 + 20), 1LL, 1LL, a1);
}

uint64_t sub_960A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_960AC(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return swift_task_alloc((*(void *)(*(void *)(a1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

  ;
}

uint64_t sub_960D8@<X0>(int a1@<W8>)
{
  return ((a1 + 2147483646) & 0x7FFFFFFFu) + 1;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_96128@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(v1 + a1) = v3;
  return v2(v1);
}

uint64_t sub_96134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NLIntent(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_96170(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NLIntent(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_961A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NLIntent(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_961E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NLIntent(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_9622C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NLIntent(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_96270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NLIntent(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_962B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_962C0);
}

uint64_t sub_962C0()
{
  uint64_t v2 = sub_997E0();
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v1, v0, v2);
}

uint64_t sub_962E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_962F4);
}

uint64_t sub_962F4()
{
  uint64_t v2 = sub_997E0();
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1, v0, v0, v2);
}

uint64_t sub_96320(uint64_t a1)
{
  uint64_t result = type metadata accessor for NLIntent(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void sub_96388()
{
}

void sub_963B4()
{
}

id sub_963E0()
{
  uint64_t v2 = type metadata accessor for SiriReferenceResolutionResolver(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_4C3FC();
  sub_67C4(&qword_FBE68);
  sub_1BCE0();
  __chkstk_darwin(v4);
  sub_18154();
  if (qword_FB310 != -1) {
    swift_once(&qword_FB310, sub_97048);
  }
  uint64_t v5 = qword_101160;
  sub_99798();
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  sub_99800(v5);
  if (LOBYTE(v41[0]) == 36) {
    goto LABEL_15;
  }
  uint64_t v6 = 6647407LL;
  uint64_t v7 = sub_9772C(v41[0]);
  BOOL v9 = v7 == 6647407 && v8 == 0xE300000000000000LL;
  if (v9)
  {
    sub_18034();
  }

  else
  {
    uint64_t v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, 6647407LL, 0xE300000000000000LL, 0LL);
    sub_18034();
    if ((v6 & 1) == 0) {
      goto LABEL_15;
    }
  }

  uint64_t v10 = type metadata accessor for UsoEntityBuilder_common_Timer(0LL);
  sub_2B838(v10);
  UsoEntityBuilder_common_Timer.init()();
  static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  uint64_t v11 = sub_99838();
  if (!v6)
  {
LABEL_15:
    uint64_t v15 = type metadata accessor for SiriTimer(0LL);
    if (qword_FB2D8 != -1) {
      swift_once(&qword_FB2D8, sub_96F0C);
    }
    sub_99800(qword_101128);
    id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v15));
    id v17 = sub_A87A0(v41[0], v41[1]);
    sub_979C8(&qword_FB2E0, (uint64_t)&qword_101130, (uint64_t)sub_96F34);
    NSString v19 = v18;
    if (v18)
    {
      id v20 = [v18 spokenPhrase];

      static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      uint64_t v22 = v21;

      NSString v19 = String._bridgeToObjectiveC()();
      uint64_t v18 = (void *)swift_bridgeObjectRelease(v22);
    }

    sub_997B4((uint64_t)v18, "setLabel:");

    sub_97A78();
    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    sub_997B4((uint64_t)isa, "setDuration:");

    [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
    Class v24 = Double._bridgeToObjectiveC()().super.super.isa;
    sub_997B4((uint64_t)v24, "setRemainingTime:");

    [v17 setState:0];
    sub_988CC();
    [v17 setType:v25];
    sub_968F4();
    Class v26 = Bool._bridgeToObjectiveC()().super.super.isa;
    [v17 setShouldMatchAny:v26];

    return v17;
  }

  static SiriReferenceResolutionResolver.shared.getter(v11);
  SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)(v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v12 = type metadata accessor for RREntity(0LL);
  sub_4C720(v0, 1LL, v12);
  if (v9)
  {
    uint64_t v13 = sub_4C454();
    sub_99824(v13, &qword_FBE68);
    goto LABEL_15;
  }

  uint64_t v14 = type metadata accessor for SiriTimer(0LL);
  int v28 = (void *)RREntity.convertData<A>(to:)(v14, v14);
  sub_997A0();
  if (!v28)
  {
    sub_4C454();
    goto LABEL_15;
  }

  if (qword_FB2C8 != -1) {
    swift_once(&qword_FB2C8, sub_96E9C);
  }
  uint64_t v29 = sub_1BD34();
  sub_5474(v29, (uint64_t)qword_FFDE8);
  id v17 = v28;
  int v30 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v33 = sub_1BA1C(32LL);
    v41[0] = v33;
    *(_DWORD *)uint64_t v32 = 136315138;
    id v17 = v17;
    id v34 = [v17 description];
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
    unint64_t v37 = v36;

    uint64_t v38 = sub_683C(v35, v37, v41);
    uint64_t v39 = sub_4C494(v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v39, v40, v32 + 4, v32 + 12);

    swift_bridgeObjectRelease(v37);
    sub_1E7D8(&dword_0, v30, v31, "getSiriTimer: Resolved timer %s from SRR. Using it to search timer.", v32);
    sub_1E7D0(v33);
    sub_1B904(v33);
    sub_1B904((uint64_t)v32);
  }

  else
  {
  }

  sub_4C454();
  return v17;
}

uint64_t sub_968F4()
{
  uint64_t v2 = sub_99798();
  sub_1BCE0();
  __chkstk_darwin(v3);
  sub_5E350();
  if (qword_FB308 != -1) {
    swift_once(&qword_FB308, sub_97014);
  }
  uint64_t v4 = qword_101158;
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  uint64_t v6 = v5;
  IntentNodeTraversable.value<A>(forNode:)(v4, v2, v5);
  if (v13 == 6)
  {
    sub_1E720(v1, v0);
  }

  else
  {
    sub_1E720(v1, v0);
    if (v13 == 3) {
      goto LABEL_16;
    }
  }

  if (qword_FB310 != -1) {
    swift_once(&qword_FB310, sub_97048);
  }
  IntentNodeTraversable.value<A>(forNode:)(qword_101160, v2, v6);
  if (v12 != 36)
  {
    uint64_t v8 = sub_9772C(v12);
    if (v8 != 2037277037 || v9 != 0xE400000000000000LL)
    {
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v9, 2037277037LL, 0xE400000000000000LL, 0LL);
      sub_18034();
      goto LABEL_17;
    }

    sub_18034();
LABEL_16:
    char v7 = 1;
    goto LABEL_17;
  }

  char v7 = 0;
LABEL_17:
  sub_1E6E4(v0);
  return v7 & 1;
}

uint64_t sub_96A7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = v4 - v3;
  if (qword_FB320 != -1) {
    swift_once(&qword_FB320, sub_970A8);
  }
  sub_99798();
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  sub_9982C(v6, v7, v6);
  uint64_t v8 = sub_997C8();
  uint64_t v9 = sub_490E4(v5);
  if (v10)
  {
    sub_99810(v9, &qword_FCC18);
    uint64_t v11 = type metadata accessor for TerminalElement.Date(0LL);
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 1LL, 1LL, v11);
  }

  else
  {
    TerminalElement.DateTimeValue.startDate.getter(v9);
    return sub_17D0C(v5, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL));
  }

uint64_t sub_96B90(char a1)
{
  return byte_C5A6A[a1];
}

void sub_96BA4()
{
  if (qword_FB2D0 != -1) {
    swift_once(&qword_FB2D0, sub_96EE4);
  }
  uint64_t v2 = qword_101120;
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  sub_997F0(v2);
  __asm { BR              X10 }

uint64_t sub_96E9C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_FFDE8);
  sub_5474(v0, (uint64_t)qword_FFDE8);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_96EE4(uint64_t a1)
{
  return sub_99790(a1, &qword_FFEB8, 0x72655672656D6974LL, 98LL, &qword_101120);
}

uint64_t sub_96F0C(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFE98, 0x644972656D6974LL, 0xE700000000000000LL, &qword_101128);
}

uint64_t sub_96F34(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFE98, 0x62614C72656D6974LL, 0xEA00000000006C65LL, &qword_101130);
}

uint64_t sub_96F60(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFE98, 0x77654E72656D6974LL, 0xED00006C6562614CLL, &qword_101138);
}

uint64_t sub_96F94(uint64_t a1)
{
  return sub_99790(a1, &qword_FFEB0, 0x70795472656D6974LL, 101LL, &qword_101140);
}

uint64_t sub_96FBC(uint64_t a1)
{
  return sub_99790(a1, &qword_FFEA8, 0x6D695472656D6974LL, 101LL, &qword_101148);
}

uint64_t sub_96FE4(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFEA8, 0x77654E72656D6974LL, 0xEC000000656D6954LL, &qword_101150);
}

uint64_t sub_97014(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFEE8, 0x74744172656D6974LL, 0xEF73657475626972LL, &qword_101158);
}

uint64_t sub_97048(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFEF8, 0x66655272656D6974LL, 0xEE0065636E657265LL, &qword_101160);
}

uint64_t sub_9707C(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFF08, 0xD000000000000011LL, 0x80000000000C8980LL, &qword_101168);
}

uint64_t sub_970A8(uint64_t a1)
{
  return sub_970D4(a1, &qword_FFEA8, 0x6D695472656D6974LL, 0xE900000000000065LL, &qword_101170);
}

uint64_t sub_970D4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = sub_67C4(a2);
  sub_2B838(v8);
  uint64_t result = TerminalOntologyNode.init(name:multicardinal:)(a3, a4, 0LL);
  *a5 = result;
  return result;
}

uint64_t sub_97128()
{
  uint64_t v0 = sub_67C4(&qword_FFEC0);
  uint64_t v1 = swift_allocObject(v0, 432LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_C5CC0;
  if (qword_FB2D0 != -1) {
    swift_once(&qword_FB2D0, sub_96EE4);
  }
  uint64_t v2 = qword_101120;
  *(void *)(v1 + 56) = sub_67C4(&qword_FFEB8);
  sub_AC3C(&qword_FFEC8, &qword_FFEB8);
  *(void *)(v1 + 64) = v3;
  *(void *)(v1 + 32) = v2;
  uint64_t v4 = qword_FB2D8;
  swift_retain();
  if (v4 != -1) {
    swift_once(&qword_FB2D8, sub_96F0C);
  }
  uint64_t v5 = qword_101128;
  uint64_t v6 = sub_67C4(&qword_FFE98);
  *(void *)(v1 + 96) = v6;
  sub_AC3C(&qword_FFED0, &qword_FFE98);
  uint64_t v8 = v7;
  *(void *)(v1 + 104) = v7;
  *(void *)(v1 + 72) = v5;
  uint64_t v9 = qword_FB2E0;
  swift_retain();
  if (v9 != -1) {
    swift_once(&qword_FB2E0, sub_96F34);
  }
  uint64_t v10 = qword_101130;
  *(void *)(v1 + 136) = v6;
  *(void *)(v1 + 144) = v8;
  *(void *)(v1 + 112) = v10;
  uint64_t v11 = qword_FB2F0;
  swift_retain();
  if (v11 != -1) {
    swift_once(&qword_FB2F0, sub_96F94);
  }
  uint64_t v12 = qword_101140;
  *(void *)(v1 + 176) = sub_67C4(&qword_FFEB0);
  sub_AC3C(&qword_FFED8, &qword_FFEB0);
  *(void *)(v1 + 184) = v13;
  *(void *)(v1 + 152) = v12;
  uint64_t v14 = qword_FB2F8;
  swift_retain();
  if (v14 != -1) {
    swift_once(&qword_FB2F8, sub_96FBC);
  }
  uint64_t v15 = qword_101148;
  uint64_t v16 = sub_67C4(&qword_FFEA8);
  *(void *)(v1 + 216) = v16;
  sub_AC3C(&qword_FFEE0, &qword_FFEA8);
  uint64_t v18 = v17;
  *(void *)(v1 + 224) = v17;
  *(void *)(v1 + 192) = v15;
  uint64_t v19 = qword_FB300;
  swift_retain();
  if (v19 != -1) {
    swift_once(&qword_FB300, sub_96FE4);
  }
  uint64_t v20 = qword_101150;
  *(void *)(v1 + 256) = v16;
  *(void *)(v1 + 264) = v18;
  *(void *)(v1 + 232) = v20;
  uint64_t v21 = qword_FB2E8;
  swift_retain();
  if (v21 != -1) {
    swift_once(&qword_FB2E8, sub_96F60);
  }
  uint64_t v22 = qword_101138;
  *(void *)(v1 + 296) = v6;
  *(void *)(v1 + 304) = v8;
  *(void *)(v1 + 272) = v22;
  uint64_t v23 = qword_FB308;
  swift_retain();
  if (v23 != -1) {
    swift_once(&qword_FB308, sub_97014);
  }
  uint64_t v24 = qword_101158;
  *(void *)(v1 + 336) = sub_67C4(&qword_FFEE8);
  sub_AC3C(&qword_FFEF0, &qword_FFEE8);
  *(void *)(v1 + 344) = v25;
  *(void *)(v1 + 312) = v24;
  uint64_t v26 = qword_FB310;
  swift_retain();
  if (v26 != -1) {
    swift_once(&qword_FB310, sub_97048);
  }
  uint64_t v27 = qword_101160;
  *(void *)(v1 + 376) = sub_67C4(&qword_FFEF8);
  sub_AC3C(&qword_FFF00, &qword_FFEF8);
  *(void *)(v1 + 384) = v28;
  *(void *)(v1 + 352) = v27;
  uint64_t v29 = qword_FB318;
  swift_retain();
  if (v29 != -1) {
    swift_once(&qword_FB318, sub_9707C);
  }
  uint64_t v30 = qword_101168;
  *(void *)(v1 + 416) = sub_67C4(&qword_FFF08);
  sub_AC3C(&qword_FFF10, &qword_FFF08);
  *(void *)(v1 + 424) = v31;
  *(void *)(v1 + 392) = v30;
  uint64_t v32 = type metadata accessor for DomainOntologyNode(0LL);
  swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
  swift_retain();
  uint64_t result = DomainOntologyNode.init(name:childNodes:isInEventTree:)(0x72656D6974LL, 0xE500000000000000LL, v1, 0LL);
  qword_101178 = result;
  return result;
}

uint64_t sub_97578()
{
  if (qword_FB328 != -1) {
    swift_once(&qword_FB328, sub_97128);
  }
  return swift_retain();
}

void sub_975BC(void *a1@<X8>)
{
  *a1 = &off_F3358;
}

uint64_t sub_975CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_97938(a1, a2, a3, (uint64_t (*)(void))sub_9964C, (uint64_t (*)(void))sub_99688);
}

BOOL sub_975E0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_F3388, v2);
  sub_2B7C4();
  return v3 != 0;
}

uint64_t sub_97620()
{
  return 0x7065656C73LL;
}

BOOL sub_97640@<W0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  BOOL result = sub_975E0(*a1);
  *a2 = result;
  return result;
}

void sub_97674(uint64_t *a1@<X8>)
{
  *a1 = sub_97620();
  a1[1] = v2;
  sub_17DD4();
}

void sub_97694(void *a1@<X8>)
{
  *a1 = &off_F33C0;
}

uint64_t sub_976A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9786C(a1, a2, a3, (uint64_t (*)(void))sub_996C4, (uint64_t (*)(void))sub_99700, (uint64_t (*)(void))sub_9973C);
}

void sub_976C0(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_976E0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_F3410, a1, a2, &unk_FB448);
  sub_2B7C4();
  if (v2 >= 0x24) {
    return 36LL;
  }
  else {
    return v2;
  }
}

uint64_t sub_9772C(char a1)
{
  return *(void *)&aFirst_1[8 * a1];
}

void sub_9774C(unsigned __int8 a1)
{
}

void sub_97788()
{
}

void sub_977A0(uint64_t a1)
{
}

void sub_977A8(void *a1@<X8>)
{
  *a1 = &off_F33E8;
}

uint64_t sub_977B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_97938(a1, a2, a3, (uint64_t (*)(void))sub_995D4, (uint64_t (*)(void))sub_99610);
}

void sub_977CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_977D8()
{
}

uint64_t sub_977E0(uint64_t a1)
{
  return sub_7E150(a1, *v1);
}

void sub_977E8(uint64_t a1)
{
}

uint64_t sub_977F0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_976E0(*a1, a1[1]);
  *a2 = result;
  return result;
}

void sub_9781C(uint64_t *a1@<X8>)
{
  *a1 = sub_9772C(*v1);
  a1[1] = v3;
  sub_17DD4();
}

void sub_97840(void *a1@<X8>)
{
  *a1 = &off_F3790;
}

uint64_t sub_97850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9786C(a1, a2, a3, (uint64_t (*)(void))sub_99520, (uint64_t (*)(void))sub_9955C, (uint64_t (*)(void))sub_99598);
}

uint64_t sub_9786C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v10 = a4();
  uint64_t v11 = a5();
  uint64_t v12 = a6();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v10, v11, v12);
}

void sub_978DC(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  Hasher._combine(_:)(v2);
  Hasher._finalize()();
  sub_17E1C();
}

void sub_97914(void *a1@<X8>)
{
  *a1 = &off_F37D8;
}

uint64_t sub_97924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_97938(a1, a2, a3, (uint64_t (*)(void))sub_994A8, (uint64_t (*)(void))sub_994E4);
}

uint64_t sub_97938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v8 = a4();
  uint64_t v9 = a5();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v8, v9);
}

void sub_97990()
{
}

void sub_979AC()
{
}

void sub_979C8(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  sub_99798();
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  sub_99818(v3, v4, v3);
  if (v6)
  {
    Swift::String v5 = String.labelCapitalization()();
    sub_2B7C4();
    sub_432E8();
    sub_5D868(v5._countAndFlagsBits, (uint64_t)v5._object);
  }

  sub_997D0();
}

void sub_97A78()
{
  uint64_t v92 = v3;
  sub_67C4(&qword_FFEA0);
  sub_1BCE0();
  __chkstk_darwin(v4);
  sub_18154();
  sub_67C4(&qword_FD638);
  sub_1BCE0();
  __chkstk_darwin(v5);
  sub_433C4();
  uint64_t v90 = v6;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v85 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v85 - v12;
  __chkstk_darwin(v11);
  uint64_t v91 = (uint64_t)&v85 - v14;
  sub_67C4(&qword_FD628);
  sub_1BCE0();
  __chkstk_darwin(v15);
  sub_17C38();
  sub_67C4(&qword_FCC18);
  sub_1BCE0();
  __chkstk_darwin(v16);
  sub_1C308();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_997C8();
  uint64_t v94 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  sub_433C4();
  os_log_type_t v93 = (uint8_t *)v21;
  __chkstk_darwin(v22);
  uint64_t v95 = (uint64_t)&v85 - v23;
  if (qword_FB2F8 != -1) {
    swift_once(&qword_FB2F8, sub_96FBC);
  }
  uint64_t v24 = qword_101148;
  uint64_t v25 = sub_99798();
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  IntentNodeTraversable.value<A>(forNode:)(v24, v25, v26);
  sub_4C720(v19, 1LL, v20);
  if (v30)
  {
    sub_8CC4(v19, &qword_FCC18);
    [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
    goto LABEL_38;
  }

  uint64_t v27 = v94;
  uint64_t v28 = sub_2C108(v95, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v94 + 32));
  TerminalElement.DateTimeValue.startTime.getter(v28);
  uint64_t v29 = type metadata accessor for TerminalElement.Time(0LL);
  uint64_t v31 = sub_4C720(v0, 1LL, v29);
  if (v30)
  {
    sub_4C6D4(v31, &qword_FD628);
    goto LABEL_28;
  }

  uint64_t v32 = TerminalElement.Time.toDateTimeWithMeridiemSetByUser()(v31);
  uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8LL))(v0, v29);
  if (!v32) {
    goto LABEL_28;
  }
  uint64_t v34 = swift_retain();
  static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)(v34, 0LL);
  uint64_t v35 = sub_99838();
  if (!v0)
  {
LABEL_27:
    uint64_t v33 = swift_release();
LABEL_28:
    uint64_t v71 = v95;
    TerminalElement.DateTimeValue.interval.getter(v33);
    uint64_t v72 = type metadata accessor for TerminalElement.Interval(0LL);
    uint64_t v73 = sub_490E4(v1);
    if (v30)
    {
      sub_99824(v73, &qword_FFEA0);
      int v75 = 1;
    }

    else
    {
      TerminalElement.Interval.quantity.getter(v73);
      int v75 = v74 & 1;
      sub_17D0C(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 8LL));
    }

    uint64_t v76 = (uint64_t)v93;
    uint64_t v77 = sub_2C108((uint64_t)v93, v71, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 16));
    if (!v75) {
      goto LABEL_37;
    }
    uint64_t v78 = v92;
    TerminalElement.DateTimeValue.duration.getter(v77);
    uint64_t v79 = type metadata accessor for TerminalElement.Duration(0LL);
    uint64_t v80 = sub_490E4(v78);
    if (v30)
    {
      sub_99810(v80, (uint64_t *)&unk_FCC20);
    }

    else
    {
      TerminalElement.Duration.duration.getter(v80);
      uint64_t v81 = v78;
      char v83 = v82;
      sub_17D0C(v81, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v79 - 8) + 8LL));
      if ((v83 & 1) == 0) {
        goto LABEL_37;
      }
    }

    [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
LABEL_37:
    sub_997C0(v76);
    sub_997C0(v71);
    goto LABEL_38;
  }

  uint64_t v88 = v32;
  uint64_t v36 = v91;
  DateTime.asDate()(v35);
  if (qword_FB2C8 != -1) {
    swift_once(&qword_FB2C8, sub_96E9C);
  }
  uint64_t v37 = sub_1BD34();
  uint64_t v38 = sub_5474(v37, (uint64_t)qword_FFDE8);
  uint64_t v39 = sub_98A74(v36, (uint64_t)v13);
  uint64_t v89 = v38;
  uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.default.getter();
  BOOL v42 = sub_2BAD0(v41);
  uint64_t v87 = v0;
  if (v42)
  {
    uint64_t v43 = (uint8_t *)sub_1BA1C(12LL);
    double v86 = COERCE_DOUBLE(sub_1BA1C(32LL));
    double v96 = v86;
    *(_DWORD *)uint64_t v43 = 136315138;
    uint64_t v36 = (uint64_t)(v43 + 12);
    sub_98A74((uint64_t)v13, (uint64_t)v10);
    uint64_t v44 = String.init<A>(describing:)();
    unint64_t v46 = v45;
    uint64_t v98 = sub_683C(v44, v45, (uint64_t *)&v96);
    sub_99844((uint64_t)&v98, (uint64_t)&v99, (uint64_t)(v43 + 4));
    swift_bridgeObjectRelease(v46);
    sub_8CC4((uint64_t)v13, &qword_FD638);
    sub_1E7D8(&dword_0, v40, (os_log_type_t)v29, "convertedDate: %s", v43);
    uint64_t v47 = *(void *)&v86;
    sub_1E7D0(*(uint64_t *)&v86);
    sub_1B904(v47);
    sub_1B904((uint64_t)v43);
  }

  else
  {
    sub_8CC4((uint64_t)v13, &qword_FD638);
  }

  uint64_t v48 = v90;
  sub_98A74(v36, v90);
  uint64_t v49 = type metadata accessor for Date(0LL);
  int v50 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v48, 1LL, v49);
  if (v50 == 1)
  {
    sub_8CC4(v48, &qword_FD638);
    double v52 = 0.0;
  }

  else
  {
    double v52 = Date.timeIntervalSinceNow.getter();
    uint64_t v51 = sub_17D0C(v48, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v49 - 8) + 8LL));
  }

  uint64_t v53 = (os_log_s *)Logger.logObject.getter(v51);
  os_log_type_t v54 = static os_log_type_t.default.getter();
  if (sub_2BAD0(v54))
  {
    uint64_t v55 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v56 = sub_1BA1C(32LL);
    uint64_t v98 = v56;
    *(_DWORD *)uint64_t v55 = 136315138;
    double v96 = v52;
    v97[0] = v50 == 1;
    sub_67C4(&qword_FB590);
    uint64_t v57 = String.init<A>(describing:)();
    unint64_t v59 = v58;
    double v96 = COERCE_DOUBLE(sub_683C(v57, v58, &v98));
    sub_99844((uint64_t)&v96, (uint64_t)v97, (uint64_t)(v55 + 4));
    swift_bridgeObjectRelease(v59);
    sub_1E7D8(&dword_0, v53, (os_log_type_t)v29, "timeIntervalSinceNow: %s", v55);
    sub_1E7D0(v56);
    sub_1B904(v56);
    sub_1B904((uint64_t)v55);
  }

  uint64_t v27 = v94;
  uint64_t v61 = v87;
  if (v50 == 1 || v52 <= 0.0)
  {
    sub_99810(v60, &qword_FD638);
    swift_release();
    goto LABEL_27;
  }

  uint64_t v62 = swift_retain_n(v87, 2LL);
  uint64_t v63 = (os_log_s *)Logger.logObject.getter(v62);
  os_log_type_t v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = (uint8_t *)sub_1BA1C(12LL);
    *(double *)&uint64_t v66 = COERCE_DOUBLE(sub_1BA1C(32LL));
    double v96 = *(double *)&v66;
    *(_DWORD *)uint64_t v65 = 136315138;
    os_log_type_t v93 = v65 + 4;
    uint64_t v98 = v61;
    uint64_t v67 = type metadata accessor for DateTime(0LL);
    sub_4C2F8(&qword_FD650, (uint64_t (*)(uint64_t))&type metadata accessor for DateTime);
    uint64_t v69 = dispatch thunk of CustomStringConvertible.description.getter(v67, v68);
    uint64_t v98 = sub_683C(v69, v70, (uint64_t *)&v96);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v93, v65 + 12);
    swift_release_n(v61, 2LL);
    sub_18034();
    sub_1E7D8(&dword_0, v63, v64, "Resolved duration using absolute date %s", v65);
    sub_1E7D0(v66);
    sub_1B904(v66);
    sub_1B904((uint64_t)v65);
    swift_release();
    swift_release();

    sub_8CC4(v91, &qword_FD638);
    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v95, v20);
  }

  else
  {
    swift_release();
    swift_release_n(v61, 3LL);

    sub_99810(v84, &qword_FD638);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v95, v20);
  }

LABEL_38:
  sub_88108();
}

void sub_982CC()
{
  uint64_t v66 = v3;
  sub_67C4(&qword_FFEA0);
  sub_1BCE0();
  __chkstk_darwin(v4);
  sub_18154();
  sub_67C4(&qword_FD638);
  sub_1BCE0();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v65 = (char *)&v64 - v9;
  sub_67C4(&qword_FD628);
  sub_1BCE0();
  __chkstk_darwin(v10);
  sub_1C308();
  uint64_t v13 = v12 - v11;
  sub_67C4(&qword_FCC18);
  sub_1BCE0();
  __chkstk_darwin(v14);
  sub_4C3FC();
  uint64_t v15 = sub_997C8();
  uint64_t v67 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v64 - v19;
  if (qword_FB300 != -1) {
    swift_once(&qword_FB300, sub_96FE4);
  }
  sub_99798();
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  sub_9982C(v21, v22, v21);
  sub_4C720(v1, 1LL, v15);
  if (v25)
  {
    sub_8CC4(v1, &qword_FCC18);
    [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
    goto LABEL_32;
  }

  uint64_t v23 = sub_2C108((uint64_t)v20, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 32));
  TerminalElement.DateTimeValue.startTime.getter(v23);
  uint64_t v24 = type metadata accessor for TerminalElement.Time(0LL);
  uint64_t v26 = sub_4C720(v13, 1LL, v24);
  if (v25)
  {
    uint64_t v27 = &qword_FD628;
    uint64_t v28 = v13;
LABEL_9:
    sub_8CC4(v28, v27);
    goto LABEL_22;
  }

  uint64_t v29 = TerminalElement.Time.toDateTimeWithMeridiemSetByUser()(v26);
  uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8LL))(v13, v24);
  if (!v29) {
    goto LABEL_22;
  }
  uint64_t v31 = swift_retain();
  uint64_t v32 = static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)(v31, 0LL);
  uint64_t v33 = sub_2BB30();
  if (!v32) {
    goto LABEL_21;
  }
  uint64_t v34 = (uint64_t)v65;
  DateTime.asDate()(v33);
  sub_98A74(v34, (uint64_t)v8);
  uint64_t v35 = type metadata accessor for Date(0LL);
  uint64_t v36 = sub_4C720((uint64_t)v8, 1LL, v35);
  if (v25)
  {
    sub_2BB30();
    sub_88014();
    sub_8CC4((uint64_t)v8, &qword_FD638);
    uint64_t v28 = v34;
    uint64_t v27 = &qword_FD638;
    goto LABEL_9;
  }

  double v37 = Date.timeIntervalSinceNow.getter(v36);
  uint64_t v38 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v35 - 8) + 8LL))(v8, v35);
  if (v37 <= 0.0)
  {
    sub_4C6D4(v38, &qword_FD638);
    sub_88014();
LABEL_21:
    uint64_t v30 = sub_2BB30();
LABEL_22:
    TerminalElement.DateTimeValue.interval.getter(v30);
    uint64_t v53 = type metadata accessor for TerminalElement.Interval(0LL);
    uint64_t v54 = sub_490E4(v0);
    if (v25)
    {
      sub_99824(v54, &qword_FFEA0);
      int v56 = 1;
    }

    else
    {
      TerminalElement.Interval.quantity.getter(v54);
      int v56 = v55 & 1;
      sub_17D0C(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v53 - 8) + 8LL));
    }

    uint64_t v57 = sub_2C108((uint64_t)v18, (uint64_t)v20, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 16));
    if (!v56) {
      goto LABEL_31;
    }
    uint64_t v58 = v66;
    TerminalElement.DateTimeValue.duration.getter(v57);
    uint64_t v59 = type metadata accessor for TerminalElement.Duration(0LL);
    uint64_t v60 = sub_490E4(v58);
    if (v25)
    {
      sub_8CC4(v58, (uint64_t *)&unk_FCC20);
    }

    else
    {
      TerminalElement.Duration.duration.getter(v60);
      uint64_t v61 = v58;
      char v63 = v62;
      sub_17D0C(v61, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v59 - 8) + 8LL));
      if ((v63 & 1) == 0) {
        goto LABEL_31;
      }
    }

    [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
LABEL_31:
    sub_997C0((uint64_t)v18);
    sub_997C0((uint64_t)v20);
    goto LABEL_32;
  }

  uint64_t v66 = v29;
  if (qword_FB2C8 != -1) {
    swift_once(&qword_FB2C8, sub_96E9C);
  }
  uint64_t v39 = sub_1BD34();
  sub_5474(v39, (uint64_t)qword_FFDE8);
  uint64_t v40 = swift_retain_n(v32, 2LL);
  os_log_type_t v41 = (os_log_s *)Logger.logObject.getter(v40);
  os_log_type_t v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v44 = sub_1BA1C(32LL);
    uint64_t v68 = v32;
    uint64_t v69 = v44;
    *(_DWORD *)uint64_t v43 = 136315138;
    os_log_type_t v64 = v43 + 4;
    uint64_t v45 = type metadata accessor for DateTime(0LL);
    sub_4C2F8(&qword_FD650, (uint64_t (*)(uint64_t))&type metadata accessor for DateTime);
    uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter(v45, v46);
    uint64_t v49 = sub_683C(v47, v48, &v69);
    uint64_t v50 = sub_4C494(v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v50, v51, v64, v43 + 12);
    swift_release_n(v32, 2LL);
    sub_18034();
    sub_1E7D8(&dword_0, v41, v42, "Resolved toDuration using absolute date %s", v43);
    sub_1E7D0(v44);
    sub_1B904(v44);
    sub_1B904((uint64_t)v43);
    swift_release();
    sub_88014();

    uint64_t v52 = (uint64_t)v65;
  }

  else
  {
    swift_release();
    swift_release_n(v32, 3LL);

    uint64_t v52 = v34;
  }

  sub_8CC4(v52, &qword_FD638);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v20, v15);
LABEL_32:
  sub_88108();
}

void sub_988CC()
{
  if (qword_FB2F0 != -1) {
    swift_once(&qword_FB2F0, sub_96F94);
  }
  sub_99798();
  sub_4C2F8((unint64_t *)&qword_FD600, type metadata accessor for TimerNLv3Intent);
  sub_99818(v0, v1, v0);
  sub_997D0();
}

uint64_t sub_98958@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NLIntent(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t sub_98990()
{
  return sub_97578();
}

uint64_t sub_989A4(uint64_t a1)
{
  return NLIntentWrapper.traversableIntentNode.getter(a1, v2);
}

uint64_t sub_989F4(uint64_t a1)
{
  return NLIntentWrapper.traversableOntologyNode.getter(a1, v2);
}

uint64_t sub_98A34(uint64_t a1)
{
  return NLIntentWrapper.description.getter(a1, v2);
}

uint64_t sub_98A74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FD638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_98ABC(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = 1;
  }
  else {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_98B08 + 4 * byte_C53FF[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_98B3C + 4 * byte_C53FA[v4]))();
}

uint64_t sub_98B3C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_98B44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x98B4CLL);
  }
  return result;
}

uint64_t sub_98B58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x98B60LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_98B64(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_98B6C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TimerNLv3Intent.TimerConfirmation()
{
}

uint64_t sub_98B84(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xDD)
  {
    if (a2 + 35 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 35) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 36;
    return (v5 + 1);
  }

uint64_t sub_98C0C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 35 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 35) >> 8 < 0xFF) {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = 1;
  }
  else {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = v3;
  }
  if (a3 >= 0xDD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDC) {
    return ((uint64_t (*)(void))((char *)&loc_98C58 + 4 * byte_C5409[v4]))();
  }
  *a1 = a2 + 35;
  return ((uint64_t (*)(void))((char *)sub_98C8C + 4 * byte_C5404[v4]))();
}

uint64_t sub_98C8C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_98C94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x98C9CLL);
  }
  return result;
}

uint64_t sub_98CA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x98CB0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 35;
  return result;
}

uint64_t sub_98CB4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_98CBC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TimerNLv3Intent.TimerReference()
{
}

uint64_t sub_98CD4(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFB)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }

uint64_t sub_98D5C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = 1;
  }
  else {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_98DA8 + 4 * byte_C5413[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_98DDC + 4 * byte_C540E[v4]))();
}

uint64_t sub_98DDC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_98DE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x98DECLL);
  }
  return result;
}

uint64_t sub_98DF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x98E00LL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_98E04(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_98E0C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TimerNLv3Intent.TimerAttributes()
{
}

uint64_t sub_98E24(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }

uint64_t sub_98EAC(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = 1;
  }
  else {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_98EF8 + 4 * byte_C541D[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_98F2C + 4 * byte_C5418[v4]))();
}

uint64_t sub_98F2C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_98F34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x98F3CLL);
  }
  return result;
}

uint64_t sub_98F48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x98F50LL);
  }
  *(_BYTE *)uint64_t result = a2 + 8;
  return result;
}

uint64_t sub_98F54(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_98F5C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TimerNLv3Intent.Verb()
{
}

uint64_t sub_98F74(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_98FB4 + 4 * byte_C5422[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_98FD4 + 4 * byte_C5427[v4]))();
  }
}

_BYTE *sub_98FB4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_98FD4(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_98FDC(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_98FE4(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_98FEC(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_98FF4(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void type metadata accessor for TimerNLv3Intent.TimerType()
{
}

unint64_t sub_99010()
{
  unint64_t result = qword_FFF18;
  if (!qword_FFF18)
  {
    unint64_t result = swift_getWitnessTable(&unk_C55E8, &unk_F6448);
    atomic_store(result, (unint64_t *)&qword_FFF18);
  }

  return result;
}

void sub_9904C()
{
}

unint64_t sub_9907C()
{
  unint64_t result = qword_FFF30;
  if (!qword_FFF30)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5520, &unk_F6448);
    atomic_store(result, (unint64_t *)&qword_FFF30);
  }

  return result;
}

unint64_t sub_990BC()
{
  unint64_t result = qword_FFF38;
  if (!qword_FFF38)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5628, &unk_F6448);
    atomic_store(result, (unint64_t *)&qword_FFF38);
  }

  return result;
}

unint64_t sub_990FC()
{
  unint64_t result = qword_FFF40;
  if (!qword_FFF40)
  {
    unint64_t result = swift_getWitnessTable(&unk_C56E0, &unk_F63B8);
    atomic_store(result, (unint64_t *)&qword_FFF40);
  }

  return result;
}

void sub_99138()
{
}

unint64_t sub_99168()
{
  unint64_t result = qword_FFF58;
  if (!qword_FFF58)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5650, &unk_F63B8);
    atomic_store(result, (unint64_t *)&qword_FFF58);
  }

  return result;
}

unint64_t sub_991A8()
{
  unint64_t result = qword_FFF60;
  if (!qword_FFF60)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5720, &unk_F63B8);
    atomic_store(result, (unint64_t *)&qword_FFF60);
  }

  return result;
}

unint64_t sub_991E8()
{
  unint64_t result = qword_FFF68;
  if (!qword_FFF68)
  {
    unint64_t result = swift_getWitnessTable(&unk_C57D8, &unk_F6328);
    atomic_store(result, (unint64_t *)&qword_FFF68);
  }

  return result;
}

void sub_99224()
{
}

unint64_t sub_99254()
{
  unint64_t result = qword_FFF80;
  if (!qword_FFF80)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5748, &unk_F6328);
    atomic_store(result, (unint64_t *)&qword_FFF80);
  }

  return result;
}

unint64_t sub_99294()
{
  unint64_t result = qword_FFF88;
  if (!qword_FFF88)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5818, &unk_F6328);
    atomic_store(result, (unint64_t *)&qword_FFF88);
  }

  return result;
}

unint64_t sub_992D4()
{
  unint64_t result = qword_FFF90;
  if (!qword_FFF90)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5908, &unk_F6298);
    atomic_store(result, (unint64_t *)&qword_FFF90);
  }

  return result;
}

void sub_99310()
{
}

unint64_t sub_99340()
{
  unint64_t result = qword_FFFA8;
  if (!qword_FFFA8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5840, &unk_F6298);
    atomic_store(result, (unint64_t *)&qword_FFFA8);
  }

  return result;
}

unint64_t sub_99380()
{
  unint64_t result = qword_FFFB0;
  if (!qword_FFFB0)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5948, &unk_F6298);
    atomic_store(result, (unint64_t *)&qword_FFFB0);
  }

  return result;
}

unint64_t sub_993C0()
{
  unint64_t result = qword_FFFB8;
  if (!qword_FFFB8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5A00, &unk_F6208);
    atomic_store(result, (unint64_t *)&qword_FFFB8);
  }

  return result;
}

void sub_993FC()
{
}

unint64_t sub_9942C()
{
  unint64_t result = qword_FFFD0;
  if (!qword_FFFD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5970, &unk_F6208);
    atomic_store(result, (unint64_t *)&qword_FFFD0);
  }

  return result;
}

unint64_t sub_9946C()
{
  unint64_t result = qword_FFFD8;
  if (!qword_FFFD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5A40, &unk_F6208);
    atomic_store(result, (unint64_t *)&qword_FFFD8);
  }

  return result;
}

unint64_t sub_994A8()
{
  unint64_t result = qword_FFFE0;
  if (!qword_FFFE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_C59D8, &unk_F6208);
    atomic_store(result, (unint64_t *)&qword_FFFE0);
  }

  return result;
}

unint64_t sub_994E4()
{
  unint64_t result = qword_FFFE8;
  if (!qword_FFFE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C59A0, &unk_F6208);
    atomic_store(result, (unint64_t *)&qword_FFFE8);
  }

  return result;
}

unint64_t sub_99520()
{
  unint64_t result = qword_FFFF0;
  if (!qword_FFFF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_C58A8, &unk_F6298);
    atomic_store(result, (unint64_t *)&qword_FFFF0);
  }

  return result;
}

unint64_t sub_9955C()
{
  unint64_t result = qword_FFFF8;
  if (!qword_FFFF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5870, &unk_F6298);
    atomic_store(result, (unint64_t *)&qword_FFFF8);
  }

  return result;
}

unint64_t sub_99598()
{
  unint64_t result = qword_100000;
  if (!qword_100000)
  {
    unint64_t result = swift_getWitnessTable(&unk_C58D0, &unk_F6298);
    atomic_store(result, (unint64_t *)&qword_100000);
  }

  return result;
}

unint64_t sub_995D4()
{
  unint64_t result = qword_100008;
  if (!qword_100008)
  {
    unint64_t result = swift_getWitnessTable(&unk_C57B0, &unk_F6328);
    atomic_store(result, (unint64_t *)&qword_100008);
  }

  return result;
}

unint64_t sub_99610()
{
  unint64_t result = qword_100010;
  if (!qword_100010)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5778, &unk_F6328);
    atomic_store(result, (unint64_t *)&qword_100010);
  }

  return result;
}

unint64_t sub_9964C()
{
  unint64_t result = qword_100018;
  if (!qword_100018)
  {
    unint64_t result = swift_getWitnessTable(&unk_C56B8, &unk_F63B8);
    atomic_store(result, (unint64_t *)&qword_100018);
  }

  return result;
}

unint64_t sub_99688()
{
  unint64_t result = qword_100020;
  if (!qword_100020)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5680, &unk_F63B8);
    atomic_store(result, (unint64_t *)&qword_100020);
  }

  return result;
}

unint64_t sub_996C4()
{
  unint64_t result = qword_100028;
  if (!qword_100028)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5588, &unk_F6448);
    atomic_store(result, (unint64_t *)&qword_100028);
  }

  return result;
}

unint64_t sub_99700()
{
  unint64_t result = qword_100030;
  if (!qword_100030)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5550, &unk_F6448);
    atomic_store(result, (unint64_t *)&qword_100030);
  }

  return result;
}

unint64_t sub_9973C()
{
  unint64_t result = qword_100038;
  if (!qword_100038)
  {
    unint64_t result = swift_getWitnessTable(&unk_C55B0, &unk_F6448);
    atomic_store(result, (unint64_t *)&qword_100038);
  }

  return result;
}

uint64_t sub_99780()
{
  return sub_1E720(v1, v0);
}

uint64_t sub_99790(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_970D4(a1, a2, a3, a4 & 0xFFFFFFFFFFFFLL | 0xE900000000000000LL, a5);
}

uint64_t sub_99798()
{
  return type metadata accessor for TimerNLv3Intent(0LL);
}

uint64_t sub_997A0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
}

id sub_997B4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_997C0(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_997C8()
{
  return type metadata accessor for TerminalElement.DateTimeValue(0LL);
}

  ;
}

uint64_t sub_997E0()
{
  return type metadata accessor for NLIntent(0LL);
}

uint64_t sub_997F0(uint64_t a1)
{
  return IntentNodeTraversable.value<A>(forNode:)(a1, v1, v2);
}

uint64_t sub_99800(uint64_t a1)
{
  return IntentNodeTraversable.value<A>(forNode:)(a1, v1, v2);
}

void sub_99810(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_99818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return IntentNodeTraversable.value<A>(forNode:)(v3, v4, a3);
}

void sub_99824(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_9982C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return IntentNodeTraversable.value<A>(forNode:)(v3, v4, a3);
}

uint64_t sub_99838()
{
  return swift_release(v0);
}

uint64_t sub_99844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, a3, v3);
}

ValueMetadata *_s18NeedsValueStrategyVMa()
{
  return &_s18NeedsValueStrategyVN;
}

uint64_t sub_99860()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100040);
  sub_5474(v0, (uint64_t)qword_100040);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_998A8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_F3800, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_998F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_67C4((uint64_t *)&unk_FCC70);
  __chkstk_darwin(v5);
  BOOL v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_67C4(&qword_FBDB8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_FB330 != -1) {
    swift_once(&qword_FB330, sub_99860);
  }
  uint64_t v11 = sub_1BD34();
  uint64_t v12 = (os_log_s *)sub_5474(v11, (uint64_t)qword_100040);
  Logger.logObject.getter(v12);
  os_log_type_t v13 = sub_1BCD0();
  if (sub_2BAD0(v13))
  {
    uint64_t v14 = (uint8_t *)sub_1BA1C(2LL);
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, v2, "SetTimerAttribute.NeedsValueStrategy.actionForInput() called)", v14, 2u);
    sub_1B904((uint64_t)v14);
  }

  uint64_t v15 = type metadata accessor for HALTimerDeviceContext(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v10, 1LL, 1LL, v15);
  uint64_t v16 = enum case for DecideAction.PromptExpectation.slot(_:);
  uint64_t v17 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104LL))(v7, v16, v17);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v7, 0LL, 1LL, v17);
  sub_3B698(a1, (uint64_t)v10, 0, (uint64_t)v7, a2);
  sub_DABC((uint64_t)v7, (uint64_t *)&unk_FCC70);
  return sub_DABC((uint64_t)v10, &qword_FBDB8);
}

uint64_t sub_99AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  v4[16] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[17] = v6;
  v4[18] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  v4[19] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[20] = v8;
  v4[21] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  v4[22] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[23] = v10;
  v4[24] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_67C4(&qword_FD5E0);
  v4[25] = swift_task_alloc((*(void *)(*(void *)(v11 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  v4[26] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v4[27] = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[28] = swift_task_alloc(v14);
  v4[29] = swift_task_alloc(v14);
  uint64_t v15 = type metadata accessor for USOParse(0LL);
  v4[30] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v4[31] = v16;
  v4[32] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for Input(0LL);
  v4[33] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v4[34] = v18;
  unint64_t v19 = (*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[35] = swift_task_alloc(v19);
  v4[36] = swift_task_alloc(v19);
  v4[37] = swift_task_alloc(v19);
  uint64_t v20 = type metadata accessor for TimerNLv3Intent(0LL);
  v4[38] = v20;
  unint64_t v21 = (*(void *)(*(void *)(v20 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[39] = swift_task_alloc(v21);
  v4[40] = swift_task_alloc(v21);
  v4[41] = swift_task_alloc(v21);
  v4[42] = swift_task_alloc(v21);
  uint64_t v22 = type metadata accessor for NLIntent(0LL);
  v4[43] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v4[44] = v23;
  unint64_t v24 = (*(void *)(v23 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[45] = swift_task_alloc(v24);
  v4[46] = swift_task_alloc(v24);
  uint64_t v25 = type metadata accessor for Parse(0LL);
  v4[47] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v4[48] = v26;
  unint64_t v27 = (*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[49] = swift_task_alloc(v27);
  v4[50] = swift_task_alloc(v27);
  return swift_task_switch(sub_99D2C, 0LL, 0LL);
}

uint64_t sub_99D2C()
{
  uint64_t v1 = v0;
  uint64_t v447 = v0 + 10;
  uint64_t v2 = v0[50];
  uint64_t v3 = v0[48];
  uint64_t v4 = v1[47];
  uint64_t v5 = sub_67C4(&qword_FF538);
  uint64_t v6 = (void *)ParameterResolutionRecord.intent.getter(v5);
  Input.parse.getter(v6);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  v455 = v1;
  if (v7 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v443 = (uint64_t)(v1 + 11);
    uint64_t v8 = v1[50];
    uint64_t v9 = v1[46];
    uint64_t v11 = v1[43];
    uint64_t v10 = v1[44];
    uint64_t v12 = v1[42];
    (*(void (**)(uint64_t, void))(v1[48] + 96LL))(v8, v1[47]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v9, v8, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v9, v11);
    uint64_t v451 = (uint64_t)v6;
    sub_9B218(v12, v6);
    unint64_t v14 = v13;
    sub_9CBEC();
    if (!v15) {
      swift_once(&qword_FB330, sub_99860);
    }
    uint64_t v16 = v1[41];
    uint64_t v17 = sub_1BD34();
    uint64_t v18 = (os_log_s *)sub_5474(v17, (uint64_t)qword_100040);
    uint64_t v19 = sub_9CC00();
    uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = v1[38];
      uint64_t v434 = (uint64_t)v14;
      uint64_t v23 = (uint8_t *)sub_1BA1C(12LL);
      sub_1BA1C(32LL);
      sub_9CC24();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v24 = sub_1E764(&qword_FBE60, (uint64_t)&unk_C5488);
      uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter(v22, v24);
      unint64_t v27 = v26;
      v1[11] = sub_9CB90(v25, v26, v28, v29, v30, v31, v32, v33, v394, v403, v412, v421);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v443, v1 + 12, v23 + 4, v23 + 12);
      swift_bridgeObjectRelease(v27);
      sub_8E4A8();
      sub_1E7D8(&dword_0, v20, v21, "NLIntent:%s", v23);
      sub_1E7D0(v16);
      sub_1B904(v16);
      uint64_t v34 = (uint64_t)v23;
      unint64_t v14 = (void *)v434;
      sub_1B904(v34);
    }

    else
    {
      sub_8E4A8();
    }

    id v60 = v14;
    uint64_t v61 = v18;
    Logger.logObject.getter(v60);
    os_log_type_t v62 = sub_1BCD0();
    if (sub_4C6CC(v18))
    {
      char v63 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v64 = sub_1BA1C(32LL);
      v458[0] = v64;
      *(_DWORD *)char v63 = 136315138;
      uint64_t v434 = (uint64_t)(v63 + 4);
      id v65 = v60;
      id v66 = [v65 description];
      uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
      unint64_t v69 = v68;

      *uint64_t v447 = sub_683C(v67, v69, v458);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v447, v443, v63 + 4, v63 + 12);
      swift_bridgeObjectRelease(v69);

      sub_1E7D8(&dword_0, v61, v62, "UpdatedSKIntent:%s", v63);
      sub_1E7D0(v64);
      sub_1B904(v64);
      sub_1B904((uint64_t)v63);
    }

    else
    {
    }

    uint64_t v95 = (void *)v451;
    uint64_t v96 = v455[46];
    uint64_t v78 = (void *)v455[44];
    uint64_t v97 = v455[42];
    uint64_t v79 = v455[12];
    sub_9CC18();
    id v98 = v60;
    uint64_t v100 = INIntent.withEndpointId.getter(v99);

    uint64_t v101 = sub_9CBE4();
    uint64_t v108 = sub_9CC0C( v101,  v102,  v101,  v103,  v104,  v105,  v106,  v107,  v394,  v403,  v412,  v421,  v434,  v443,  (uint64_t)v447,  v451,  (uint64_t)v455,  v457,  v458[0]);
    IntentPromptAnswer.init(answeredValue:updatedIntent:)(v108, v100, v109);

    uint64_t v110 = v97;
LABEL_36:
    sub_1E6E4(v110);
    uint64_t v155 = (uint64_t (*)(uint64_t, uint64_t))v78[1];
    uint64_t v156 = v96;
LABEL_37:
    sub_1BBE4(v156, v155);
    goto LABEL_38;
  }

  if (v7 == enum case for Parse.NLv3IntentPlusServerConversion(_:))
  {
    unint64_t v435 = v1 + 8;
    uint64_t v444 = (uint64_t)(v1 + 9);
    uint64_t v35 = v1[50];
    uint64_t v37 = v1[44];
    uint64_t v36 = v1[45];
    uint64_t v38 = v1[40];
    (*(void (**)(uint64_t, void))(v1[48] + 96LL))(v35, v1[47]);
    sub_67C4((uint64_t *)&unk_FCC60);
    swift_release();
    sub_9CBF8(v36, v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 32));
    sub_9CBF8(v38, v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16));
    sub_9B218(v38, v6);
    uint64_t v40 = v39;
    sub_9CBEC();
    if (!v15) {
      swift_once(&qword_FB330, sub_99860);
    }
    uint64_t v41 = sub_1BD34();
    uint64_t v42 = sub_5474(v41, (uint64_t)qword_100040);
    uint64_t v43 = sub_9CC00();
    uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
    os_log_type_t v45 = static os_log_type_t.default.getter();
    uint64_t v452 = (uint64_t)v6;
    if (sub_9CBDC(v44))
    {
      uint64_t v422 = (uint64_t)v40;
      uint64_t v46 = v1[38];
      uint64_t v47 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v48 = sub_1BA1C(32LL);
      v458[0] = v48;
      *(_DWORD *)uint64_t v47 = 136315138;
      uint64_t v49 = sub_1E764(&qword_FBE60, (uint64_t)&unk_C5488);
      uint64_t v50 = dispatch thunk of CustomStringConvertible.description.getter(v46, v49);
      unint64_t v52 = v51;
      v1[9] = sub_9CB90(v50, v51, v53, v54, v55, v56, v57, v58, v394, v403, v412, v422);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v444, v447, v47 + 4, v47 + 12);
      unint64_t v59 = v52;
      uint64_t v40 = (void *)v421;
      swift_bridgeObjectRelease(v59);
      sub_8E4A8();
      sub_1E7D8(&dword_0, v44, v45, "NLIntent:%s", v47);
      sub_1E7D0(v48);
      sub_1B904(v48);
      sub_1B904((uint64_t)v47);
    }

    else
    {
      sub_8E4A8();
    }

    id v111 = v40;
    uint64_t v112 = (os_log_s *)v42;
    Logger.logObject.getter(v111);
    os_log_type_t v113 = sub_1BCD0();
    if (sub_4C6CC(v112))
    {
      uint64_t v114 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v115 = sub_1BA1C(32LL);
      v458[0] = v115;
      *(_DWORD *)uint64_t v114 = 136315138;
      uint64_t v447 = (uint64_t *)(v114 + 4);
      id v116 = v111;
      id v117 = [v116 description];
      uint64_t v118 = static String._unconditionallyBridgeFromObjectiveC(_:)(v117);
      unint64_t v120 = v119;

      *unint64_t v435 = sub_683C(v118, v120, v458);
      sub_758C0((uint64_t)v435, v444, (uint64_t)(v114 + 4));
      swift_bridgeObjectRelease(v120);

      sub_1E7D8(&dword_0, v112, v113, "UpdatedSKIntent:%s", v114);
      sub_1E7D0(v115);
      sub_1B904(v115);
      sub_1B904((uint64_t)v114);
    }

    else
    {
    }

    uint64_t v141 = (void *)v452;
    uint64_t v78 = (void *)v455[44];
    uint64_t v96 = v455[45];
    uint64_t v142 = v455[40];
    uint64_t v79 = v455[12];
    sub_9CC18();
    id v143 = v111;
    uint64_t v145 = INIntent.withEndpointId.getter(v144);

    uint64_t v146 = sub_9CBE4();
    uint64_t v153 = sub_9CC0C( v146,  v147,  v146,  v148,  v149,  v150,  v151,  v152,  v394,  v403,  v412,  v421,  (uint64_t)v435,  v444,  (uint64_t)v447,  v452,  (uint64_t)v455,  v457,  v458[0]);
    IntentPromptAnswer.init(answeredValue:updatedIntent:)(v153, v145, v154);

    uint64_t v110 = v142;
    goto LABEL_36;
  }

  if (v7 != enum case for Parse.NLv4IntentOnly(_:))
  {
    uint64_t v121 = (uint64_t)(v1 + 3);
    if (v7 == enum case for Parse.uso(_:))
    {
      uint64_t v122 = v1[50];
      uint64_t v124 = v1[31];
      uint64_t v123 = v1[32];
      sub_1E7C4(v1[48]);
      sub_9CBF8(v123, v122, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v124 + 32));
      sub_9CBEC();
      if (!v15) {
        swift_once(&qword_FB330, sub_99860);
      }
      uint64_t v448 = (uint64_t)(v1 + 7);
      uint64_t v125 = sub_1BD34();
      uint64_t v445 = sub_5474(v125, (uint64_t)qword_100040);
      uint64_t v126 = (os_log_s *)Logger.logObject.getter(v445);
      static os_log_type_t.default.getter();
      if (sub_9CBDC(v126))
      {
        uint64_t v127 = (_WORD *)sub_1BA1C(2LL);
        *uint64_t v127 = 0;
        sub_835AC(&dword_0, v126, v128, "Received an USO parse in CreateTimer.parseResponseValue().");
        sub_1B904((uint64_t)v127);
      }

      uint64_t v130 = v1[23];
      uint64_t v129 = v1[24];

      uint64_t v132 = USOParse.userParse.getter(v131);
      uint64_t v133 = (os_log_s *)Siri_Nlu_External_UserParse.userDialogActs.getter(v132);
      sub_433D8(v129, *(uint64_t (**)(uint64_t, uint64_t))(v130 + 8));
      uint64_t v134 = *((void *)v133 + 2);
      if (v134)
      {
        uint64_t v135 = v1[20];
        uint64_t v136 = (char *)v133
             + ((*(unsigned __int8 *)(v135 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80));
        uint64_t v137 = *(void *)(v135 + 72);
        uint64_t v138 = *(uint64_t (**)(void, char *, void))(v135 + 16);
        swift_bridgeObjectRetain(v133);
        while (1)
        {
          uint64_t v139 = v138(v1[21], v136, v1[19]);
          if ((Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter(v139) & 1) != 0) {
            break;
          }
          (*(void (**)(void, void))(v135 + 8))(v1[21], v1[19]);
          v136 += v137;
          if (!--v134)
          {
            sub_1BC04();
            goto LABEL_33;
          }
        }

        uint64_t v253 = v1[25];
        uint64_t v255 = v1[20];
        uint64_t v254 = v1[21];
        uint64_t v256 = v1[19];
        sub_1BC04();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v255 + 32))(v253, v254, v256);
        uint64_t v140 = 0LL;
      }

      else
      {
LABEL_33:
        uint64_t v140 = 1LL;
      }

      v453 = v6;
      uint64_t v429 = v1 + 4;
      uint64_t v257 = v1[25];
      uint64_t v258 = v1[19];
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v257, v140, 1LL, v258);
      sub_1BC04();
      uint64_t v259 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v257, 1LL, v258);
      if ((_DWORD)v259 == 1)
      {
        sub_DABC(v1[25], &qword_FD5E0);
        uint64_t v270 = (*(uint64_t (**)(void, void, void))(v1[34] + 16LL))(v1[36], v1[13], v1[33]);
        Logger.logObject.getter(v270);
        os_log_type_t v271 = sub_75CB8();
        if (os_log_type_enabled(v133, v271))
        {
          sub_9CBC4();
          uint64_t v273 = (uint8_t *)sub_1BA1C(12LL);
          sub_1BA1C(32LL);
          sub_9CC24();
          *(_DWORD *)uint64_t v273 = 136315138;
          Input.parse.getter(v274);
          uint64_t v275 = String.init<A>(describing:)();
          uint64_t v1 = (void *)v276;
          v455[3] = sub_9CB90(v275, v276, v277, v278, v279, v280, v281, v282, v394, v403, v412, (uint64_t)v429);
          sub_758C0(v121, v430, (uint64_t)(v273 + 4));
          sub_9CC44();
          sub_9CB6C(v445);
          sub_1E7D8(&dword_0, v133, v271, "Failed to parse userParse from parse: %s.", v273);
          sub_1E7D0(v258);
          sub_1B904(v258);
          sub_1B904((uint64_t)v273);
        }

        else
        {
          sub_1BB90(v1[34]);
        }

        uint64_t v216 = v1[31];
        uint64_t v215 = v1[32];
        sub_67C4((uint64_t *)&unk_FF830);
        unint64_t v283 = sub_5A12C();
        uint64_t v284 = sub_2F6A0(v283);
        sub_9CB5C(v284, v285, v286, v287, v288, v289, v290, v291);
      }

      else
      {
        uint64_t v261 = v1[28];
        uint64_t v260 = v1[29];
        uint64_t v262 = v1[27];
        char v417 = (void *)v1[26];
        uint64_t v263 = v1[25];
        uint64_t v264 = v1[20];
        uint64_t v265 = v1;
        uint64_t v266 = v1[18];
        uint64_t v268 = v265[16];
        uint64_t v267 = v265[17];
        Siri_Nlu_External_UserDialogAct.userStatedTask.getter(v259);
        uint64_t v269 = sub_433D8(v263, *(uint64_t (**)(uint64_t, uint64_t))(v264 + 8));
        Siri_Nlu_External_UserStatedTask.task.getter(v269);
        (*(void (**)(uint64_t, uint64_t))(v267 + 8))(v266, v268);
        (*(void (**)(uint64_t, uint64_t, void *))(v262 + 32))(v260, v261, v417);
        static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)(v260, 0LL);
        uint64_t v325 = static UsoConversionUtils.convertGraphToTasks(graph:)();
        uint64_t v326 = v325;
        if ((unint64_t)v325 >> 62)
        {
          if (v325 >= 0) {
            v325 &= 0xFFFFFFFFFFFFFF8uLL;
          }
          uint64_t v327 = _CocoaArrayWrapper.endIndex.getter(v325);
        }

        else
        {
          uint64_t v327 = *(void *)((char *)&dword_10 + (v325 & 0xFFFFFFFFFFFFF8LL));
        }

        if (v327)
        {
          sub_8EEB4(0LL, (v326 & 0xC000000000000001LL) == 0, v326);
          if ((v326 & 0xC000000000000001LL) != 0)
          {
            uint64_t v328 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v326);
          }

          else
          {
            uint64_t v328 = *(void *)(v326 + 32);
            swift_retain();
          }

          sub_18034();
          uint64_t v329 = (os_log_s *)sub_9CBE4();
          id v330 = v453;
          uint64_t v331 = swift_retain();
          uint64_t v332 = sub_A1BC0(v331, v453);
          v440 = v330;
          if (v332)
          {
            uint64_t v454 = (uint64_t)v329;
            id v333 = v332;
            sub_9CC50();
            os_log_type_t v334 = sub_1BCD0();
            if (os_log_type_enabled(v329, v334))
            {
              char v417 = v455 + 6;
              uint64_t v335 = (uint8_t *)sub_1BA1C(12LL);
              uint64_t v429 = (void *)sub_1BA1C(8LL);
              *(_DWORD *)uint64_t v335 = 138412290;
              uint64_t v445 = (uint64_t)v333;
              id v336 = sub_9CC3C((uint64_t)v429, "targetTimer");
              if (v336)
              {
                uint64_t v337 = v455 + 6;
                *char v417 = v336;
                uint64_t v338 = (void *)v448;
              }

              else
              {
                v455[5] = 0LL;
                uint64_t v337 = v455 + 5;
                uint64_t v338 = v455 + 6;
              }

              UnsafeMutableRawBufferPointer.copyMemory(from:)(v337, v338, v335 + 4, v335 + 12);
              *uint64_t v429 = v336;

              sub_1E7D8( &dword_0,  v329,  v334,  "[SetTimerAttribute.NeedsValueStrategy.parseValueResponse] Using target timer: %@",  v335);
              sub_67C4((uint64_t *)&unk_FD5F0);
              sub_1E7D0((uint64_t)v429);
              sub_1B904((uint64_t)v429);
              sub_1B904((uint64_t)v335);
            }

            else
            {
            }

            uint64_t v78 = (void *)v455[31];
            uint64_t v380 = v455[32];
            uint64_t v381 = v455[29];
            uint64_t v383 = v455[26];
            uint64_t v382 = v455[27];
            uint64_t v79 = v455[12];
            sub_9CC18();
            uint64_t v392 = sub_9CC0C( v384,  v385,  v386,  v387,  v388,  v389,  v390,  v391,  v394,  v403,  (uint64_t)v417,  (uint64_t)v429,  (uint64_t)v440,  v445,  v448,  v454,  (uint64_t)v455,  v457,  v458[0]);
            IntentPromptAnswer.init(answeredValue:updatedIntent:)(v392, v333, v393);
            sub_1E84C();

            swift_release();
            (*(void (**)(uint64_t, uint64_t))(v382 + 8))(v381, v383);
            uint64_t v155 = (uint64_t (*)(uint64_t, uint64_t))v78[1];
            uint64_t v156 = v380;
            goto LABEL_37;
          }

          swift_retain_n(v328, 2LL);
          os_log_type_t v354 = (os_log_s *)sub_9CC50();
          os_log_type_t v355 = static os_log_type_t.error.getter();
          if (sub_4C6CC(v354))
          {
            uint64_t v356 = (uint8_t *)sub_1BA1C(12LL);
            uint64_t v357 = sub_1BA1C(32LL);
            v458[0] = v357;
            *(_DWORD *)uint64_t v356 = 136315138;
            uint64_t v358 = UsoTask.verbString.getter(v357);
            uint64_t v366 = sub_9CB90(v358, v359, v360, v361, v362, v363, v364, v365, v394, v403, (uint64_t)v417, (uint64_t)v429);
            *uint64_t v433 = v366;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v433, v455 + 5, v356 + 4, v356 + 12);
            sub_18034();
            sub_32A0C();
            sub_1E7D8(&dword_0, v354, v355, "Could not create SetTimerAttributeIntent from given task: %s", v356);
            sub_1E7D0(v357);
            sub_1B904(v357);
            sub_1B904((uint64_t)v356);
          }

          else
          {
            sub_32A0C();
          }

          uint64_t v216 = v455[31];
          uint64_t v215 = v455[32];
          uint64_t v367 = v455[29];
          uint64_t v368 = v455[27];
          uint64_t v369 = v455[26];
          sub_67C4((uint64_t *)&unk_FF830);
          unint64_t v370 = sub_5A12C();
          uint64_t v371 = sub_2F6A0(v370);
          sub_9CB5C(v371, v372, v373, v374, v375, v376, v377, v378);
          sub_1E84C();

          swift_release();
          uint64_t v379 = v369;
          uint64_t v1 = v455;
          (*(void (**)(uint64_t, uint64_t))(v368 + 8))(v367, v379);
        }

        else
        {
          sub_18034();
          sub_9CC50();
          sub_32A5C();
          if (sub_9CBDC((os_log_s *)v326))
          {
            uint64_t v339 = (_WORD *)sub_1BA1C(2LL);
            *uint64_t v339 = 0;
            sub_835AC(&dword_0, (os_log_s *)v326, v340, "USO graph has no tasks.");
            sub_1B904((uint64_t)v339);
          }

          uint64_t v216 = v455[31];
          uint64_t v215 = v455[32];
          uint64_t v341 = v455[29];
          uint64_t v342 = v455[27];
          uint64_t v343 = v455[26];

          sub_67C4((uint64_t *)&unk_FF830);
          unint64_t v344 = sub_5A12C();
          uint64_t v345 = sub_2F6A0(v344);
          sub_9CB5C(v345, v346, v347, v348, v349, v350, v351, v352);
          sub_1E84C();

          char v353 = *(void (**)(uint64_t, uint64_t))(v342 + 8);
          uint64_t v1 = v455;
          v353(v341, v343);
        }
      }
    }

    else
    {
      sub_9CBEC();
      if (!v15) {
        swift_once(&qword_FB330, sub_99860);
      }
      uint64_t v200 = v1[33];
      unint64_t v201 = (os_log_s *)v1[13];
      uint64_t v202 = sub_1BD34();
      sub_5474(v202, (uint64_t)qword_100040);
      uint64_t v203 = sub_9CB78();
      Logger.logObject.getter(v203);
      os_log_type_t v204 = sub_75CB8();
      if (os_log_type_enabled(v201, v204))
      {
        uint64_t v425 = (uint64_t)(v1 + 2);
        sub_9CBC4();
        uint64_t v437 = v1 + 3;
        uint64_t v205 = (uint8_t *)sub_1BA1C(12LL);
        sub_1BA1C(32LL);
        sub_9CC24();
        *(_DWORD *)uint64_t v205 = 136315138;
        Input.parse.getter(v206);
        uint64_t v207 = String.init<A>(describing:)();
        uint64_t v1 = (void *)v208;
        v455[2] = sub_9CB90(v207, v208, v209, v210, v211, v212, v213, v214, v394, v403, v412, v425);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v426, v437, v205 + 4, v205 + 12);
        sub_9CC44();
        sub_9CB6C(v442);
        sub_1E7D8(&dword_0, v201, v204, "Received an unsupported input: %s", v205);
        sub_1E7D0(v200);
        sub_1B904(v200);
        sub_1B904((uint64_t)v205);
      }

      else
      {
        sub_1BB90(v1[34]);
      }

      uint64_t v215 = v1[50];
      uint64_t v216 = v1[48];
      sub_67C4((uint64_t *)&unk_FF830);
      unint64_t v217 = sub_5A12C();
      uint64_t v218 = sub_2F6A0(v217);
      sub_9CB5C(v218, v219, v220, v221, v222, v223, v224, v225);
    }

    sub_1BBE4(v215, *(uint64_t (**)(uint64_t, uint64_t))(v216 + 8));
LABEL_62:
    uint64_t v292 = v1[49];
    sub_9CB98();
    uint64_t v408 = v455[32];
    uint64_t v418 = v455[29];
    uint64_t v431 = v455[28];
    uint64_t v439 = v455[25];
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1B838();
    sub_1BA8C();
    sub_9CC30();
    sub_1BAD0();
    sub_1B86C();
    sub_1BABC();
    sub_1BA24();
    sub_1BA14();
    uint64_t v293 = sub_1BA38();
    uint64_t v301 = sub_1B910(v293, v294, v295, v296, v297, v298, v299, v300, v394, v408);
    uint64_t v309 = sub_1B8C4(v301, v302, v303, v304, v305, v306, v307, v308, v400, v409, v418);
    uint64_t v317 = sub_1B8BC(v309, v310, v311, v312, v313, v314, v315, v316, v401, v410, v419, v431);
    sub_1B8B4(v317, v318, v319, v320, v321, v322, v323, v324, v402, v411, v420, v432, v439);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v198 = *(uint64_t (**)(void))(v292 + 8);
    return v198();
  }

  unint64_t v70 = (void *)v1[50];
  sub_1E7C4(v1[48]);
  uint64_t v71 = *v70;
  swift_getObjectType(*v70);
  if (!SIRINLUUserDialogAct.firstUsoTask.getter())
  {
LABEL_47:
    uint64_t v438 = (uint64_t)(v1 + 8);
    sub_9CBEC();
    if (!v15) {
      swift_once(&qword_FB330, sub_99860);
    }
    uint64_t v226 = v1[33];
    uint64_t v227 = (os_log_s *)v1[13];
    uint64_t v228 = sub_1BD34();
    sub_5474(v228, (uint64_t)qword_100040);
    uint64_t v229 = sub_9CB78();
    Logger.logObject.getter(v229);
    os_log_type_t v230 = sub_75CB8();
    if (sub_4C6CC(v227))
    {
      uint64_t v449 = (uint64_t)(v1 + 7);
      uint64_t v231 = v1[37];
      uint64_t v416 = v1[47];
      uint64_t v427 = v1[34];
      uint64_t v446 = v1[33];
      uint64_t v232 = (uint8_t *)sub_1BA1C(12LL);
      sub_1BA1C(32LL);
      sub_9CC24();
      *(_DWORD *)uint64_t v232 = 136315138;
      Input.parse.getter(v233);
      uint64_t v234 = String.init<A>(describing:)();
      unint64_t v236 = v235;
      v455[7] = sub_9CB90(v234, v235, v237, v238, v239, v240, v241, v242, v394, v403, v416, v427);
      sub_758C0(v449, v438, (uint64_t)(v232 + 4));
      swift_bridgeObjectRelease(v236);
      (*(void (**)(uint64_t, uint64_t))(v428 + 8))(v231, v446);
      sub_1E7D8(&dword_0, v227, v230, "Failed to parse userDialogAct into SetTimerAttributeIntent: %s", v232);
      sub_1E7D0(v226);
      sub_1B904(v226);
      uint64_t v243 = (uint64_t)v232;
      uint64_t v1 = v455;
      sub_1B904(v243);
    }

    else
    {
      sub_1BB90(v1[34]);
    }

    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v244 = sub_5A12C();
    uint64_t v245 = sub_2F6A0(v244);
    sub_9CB5C(v245, v246, v247, v248, v249, v250, v251, v252);

    swift_unknownObjectRelease(v71);
    goto LABEL_62;
  }

  uint64_t v72 = v6;
  uint64_t v73 = sub_9CBE4();
  id v74 = v72;
  uint64_t v75 = swift_retain();
  uint64_t v76 = sub_A1BC0(v75, v72);
  if (!v76)
  {
    swift_release();
    uint64_t v6 = v72;
    goto LABEL_47;
  }

  uint64_t v77 = v76;
  uint64_t v78 = v455;
  uint64_t v79 = v455[12];
  id v80 = [v74 targetTimer];
  id v81 = sub_9CC3C((uint64_t)v80, "toDuration");
  id v82 = sub_9CC3C((uint64_t)v81, "toLabel");
  sub_A1FC4(v80, v81, v82);
  uint64_t v84 = v83;
  double v85 = sub_9CC18();
  uint64_t v86 = INIntent.withEndpointId.getter(v85);
  os_log_type_t v93 = sub_9CC0C( v86,  v86,  v87,  v88,  v89,  v90,  v91,  v92,  v394,  v403,  v412,  v421,  v434,  v442,  (uint64_t)v447,  v450,  (uint64_t)v455,  v457,  v458[0]);
  IntentPromptAnswer.init(answeredValue:updatedIntent:)(v93, v94, v73);

  swift_release();
  swift_unknownObjectRelease(v71);
LABEL_38:
  uint64_t v157 = sub_67C4(&qword_1000B0);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v79, 0LL, 1LL, v157);
  sub_9CB98();
  uint64_t v395 = v456[35];
  uint64_t v404 = v456[32];
  uint64_t v413 = v456[29];
  uint64_t v423 = v456[28];
  uint64_t v436 = v456[25];
  swift_task_dealloc();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_9CC30();
  sub_1BAD0();
  sub_1BABC();
  sub_1BA14();
  sub_1B86C();
  uint64_t v158 = sub_1BA24();
  uint64_t v166 = sub_1BBDC(v158, v159, v160, v161, v162, v163, v164, v165, v395);
  uint64_t v174 = sub_1B910(v166, v167, v168, v169, v170, v171, v172, v173, v396, v404);
  uint64_t v182 = sub_1B8C4(v174, v175, v176, v177, v178, v179, v180, v181, v397, v405, v413);
  uint64_t v190 = sub_1B8BC(v182, v183, v184, v185, v186, v187, v188, v189, v398, v406, v414, v423);
  sub_1B8B4(v190, v191, v192, v193, v194, v195, v196, v197, v399, v407, v415, v424, v436);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v198 = (uint64_t (*)(void))v78[1];
  return v198();
}

void sub_9B218(uint64_t a1, void *a2)
{
  if (qword_FB330 != -1) {
    swift_once(&qword_FB330, sub_99860);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = sub_5474(v3, (uint64_t)qword_100040);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "correct setTimerAttributeIntent from nlIntent by supplementing timerId", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  id v8 = [a2 targetTimer];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = type metadata accessor for SiriTimer(0LL);
    if (qword_FB2D8 != -1) {
      swift_once(&qword_FB2D8, sub_96F0C);
    }
    uint64_t v11 = qword_101128;
    uint64_t v12 = type metadata accessor for TimerNLv3Intent(0LL);
    uint64_t v13 = sub_1E764((unint64_t *)&qword_FD600, (uint64_t)&unk_C54B0);
    IntentNodeTraversable.value<A>(forNode:)(v11, v12, v13);
    id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v10));
    id v15 = sub_A87A0(v29, v30);
    sub_B8158(v9);
    if (v16)
    {
      uint64_t v17 = v16;
      NSString v18 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v17);
    }

    else
    {
      NSString v18 = 0LL;
    }

    [v15 setLabel:v18];

    id v24 = [v9 duration];
    [v15 setDuration:v24];

    id v25 = [v9 remainingTime];
    [v15 setRemainingTime:v25];

    objc_msgSend(v15, "setState:", objc_msgSend(v9, "state"));
    objc_msgSend(v15, "setType:", objc_msgSend(v9, "type"));
    type metadata accessor for SetTimerAttributeIntent(0LL);
    id v26 = v15;
    sub_982CC();
    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    sub_979AC();
    sub_A1FC4(v15, isa, v28);
  }

  else
  {
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(0LL);
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_log_type_t v21 = 0;
      _os_log_impl( &dword_0,  v19,  v20,  "SetTimerAttribute+NeedsValueStrategy.correctedIntentFrom(): Could not get targetTimer from intent; returning Set"
        "TimerAttributeIntent without targetTimer.",
        v21,
        2u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    type metadata accessor for SetTimerAttributeIntent(0LL);
    sub_982CC();
    Class v22 = Double._bridgeToObjectiveC()().super.super.isa;
    sub_979AC();
    sub_A1FC4(0LL, v22, v23);
  }

uint64_t sub_9B5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc(dword_1000AC);
  *(void *)(v3 + 32) = v7;
  *int v7 = v3;
  v7[1] = sub_9B610;
  return sub_99AC8(a1, a2, a3);
}

uint64_t sub_9B610()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_9B64C()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(108LL, 0x80000000000C98B0LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_9B6B4(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = type metadata accessor for TemplatingResult(0LL);
  v2[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[6] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  void v2[7] = swift_task_alloc(v5);
  _BYTE v2[8] = swift_task_alloc(v5);
  void v2[9] = swift_task_alloc(v5);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  v2[10] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[11] = v7;
  v2[12] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[14] = v9;
  v2[15] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[16] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[17] = v11;
  v2[18] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[19] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[20] = v13;
  v2[21] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for NLContextUpdate(0LL);
  v2[22] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[23] = v15;
  v2[24] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DialogPhase(0LL);
  v2[25] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[26] = v17;
  v2[27] = swift_task_alloc((*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for ParameterIdentifier(0LL);
  v2[28] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[29] = v19;
  v2[30] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_9B848, 0LL, 0LL);
}

uint64_t sub_9B848()
{
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v4 = sub_67C4(&qword_FF538);
  uint64_t v5 = ParameterResolutionRecord.parameter.getter(v4);
  uint64_t v6 = ParameterIdentifier.name.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = sub_433D8(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  static DialogPhase.clarification.getter(v9);
  sub_33E50();
  v74._countAndFlagsBits = v6;
  v74._object = v8;
  char v10 = sub_998A8(v74);
  if (v10 == 2)
  {
    if (qword_FB330 != -1) {
      swift_once(&qword_FB330, sub_99860);
    }
    uint64_t v11 = (os_log_s *)sub_5474(v0[10], (uint64_t)qword_100040);
    uint64_t v12 = sub_33E50();
    Logger.logObject.getter(v12);
    os_log_type_t v13 = sub_32A5C();
    if (sub_2BAD0(v13))
    {
      uint64_t v14 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v15 = sub_1BA1C(32LL);
      uint64_t v73 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      sub_33E50();
      v0[2] = sub_683C(v6, (unint64_t)v8, &v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(v8, 3LL);
      sub_1E7D8(&dword_0, v11, (os_log_type_t)v3, "NeedsValueStrategy error: Unexpected parameter name: %s", v14);
      sub_1E7D0(v15);
      sub_1B904(v15);
      sub_1B904((uint64_t)v14);
    }

    else
    {
      swift_bridgeObjectRelease_n(v8, 2LL);
    }

    uint64_t v20 = v0[26];
    uint64_t v19 = v0[27];
    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v21 = sub_5A12C();
    uint64_t v22 = sub_2F6A0(v21);
    *uint64_t v23 = 4;
    swift_willThrow(v22, v23, v24, v25, v26, v27, v28, v29);
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
    goto LABEL_11;
  }

  char v16 = v10;
  swift_bridgeObjectRelease(v8);
  if ((v16 & 1) != 0)
  {
    uint64_t v18 = swift_bridgeObjectRelease(0xEB0000000072656DLL);
  }

  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)( 0x6974617275446F74LL,  0xEA00000000006E6FLL,  0x6954746567726174LL,  0xEB0000000072656DLL,  0LL);
    uint64_t v18 = swift_bridgeObjectRelease(0xEA00000000006E6FLL);
    if ((v17 & 1) == 0)
    {
LABEL_14:
      (*(void (**)(void, void, void))(v0[14] + 104LL))( v0[15],  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[13]);
      if (qword_FB330 != -1) {
        swift_once(&qword_FB330, sub_99860);
      }
      uint64_t v34 = v0[15];
      uint64_t v36 = v0[11];
      uint64_t v35 = v0[12];
      uint64_t v37 = v0[10];
      uint64_t v38 = (os_log_s *)sub_5474(v37, (uint64_t)qword_100040);
      (*(void (**)(uint64_t, os_log_s *, uint64_t))(v36 + 16))(v35, v38, v37);
      uint64_t v39 = mach_absolute_time();
      uint64_t v40 = SiriTimeMeasurement.init(_:log:startTime:)(v34, v35, v39);
      if ((v16 & 1) == 0)
      {
        sub_AA774();
        if (qword_FB250 != -1) {
          swift_once(&qword_FB250, sub_6CDA8);
        }
        uint64_t v41 = (void *)swift_task_alloc(dword_FDAF4);
        v0[31] = v41;
        *uint64_t v41 = v0;
        v41[1] = sub_9BE54;
        sub_45014();
        return sub_5AF18();
      }

      os_log_type_t v45 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v40);

      Swift::String_optional v47 = AceObject.serializeToBase64()();
      v0[33] = v47.value._object;
      if (v47.value._object)
      {
        uint64_t v49 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v48);
        unint64_t v51 = v50;

        Swift::String_optional v52 = AceObject.serializeToBase64()();
        v0[34] = v52.value._object;
        if (v52.value._object)
        {
          sub_AA984();
          if (qword_FB250 != -1) {
            swift_once(&qword_FB250, sub_6CDA8);
          }
          uint64_t v53 = v0[4];
          uint64_t v54 = swift_task_alloc(64LL);
          v0[35] = v54;
          *(void *)(v54 + 16) = v53;
          *(Swift::String_optional *)(v54 + 24) = v52;
          *(Swift::String_optional *)(v54 + 40) = v47;
          uint64_t v55 = (void *)swift_task_alloc(dword_FDAFC);
          v0[36] = v55;
          *uint64_t v55 = v0;
          v55[1] = sub_9BF0C;
          sub_45014();
          return sub_5B1FC(v56, v57);
        }

        uint64_t v48 = sub_1BC04();
      }

      id v60 = v38;
      Logger.logObject.getter(v48);
      sub_32A5C();
      if (sub_9CBDC(v38))
      {
        uint64_t v61 = (_WORD *)sub_1BA1C(2LL);
        *uint64_t v61 = 0;
        sub_835AC(&dword_0, v38, v62, "Could not create direct invocation for confirm or reject actions.");
        sub_1B904((uint64_t)v61);
      }

      uint64_t v63 = v0[26];
      uint64_t v19 = v0[27];

      sub_67C4((uint64_t *)&unk_FF830);
      unint64_t v64 = sub_5A12C();
      uint64_t v65 = sub_2F6A0(v64);
      sub_9CB5C(v65, v66, v67, v68, v69, v70, v71, v72);
      sub_2F638();
      uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v63 + 8);
LABEL_11:
      sub_1BBE4(v19, v30);
      sub_9CAF0();
      sub_1B86C();
      sub_1BA24();
      sub_1BA14();
      sub_1BA38();
      sub_1B838();
      sub_1BA8C();
      sub_1BA60();
      sub_1BAD0();
      sub_1BABC();
      sub_2BE7C();
      sub_45014();
      __asm { BR              X0 }
    }
  }

  uint64_t v32 = v0[20];
  static SiriTimeFeatureFlagsImpl.instance.getter(v18);
  Swift::Bool v33 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
  if (v33) {
    goto LABEL_14;
  }
  if ((v16 & 1) != 0)
  {
    sub_AA984();
    if (qword_FB240 != -1) {
      swift_once(&qword_FB240, sub_6CD70);
    }
    uint64_t v58 = (void *)swift_task_alloc(dword_FF874);
    v0[43] = v58;
    *uint64_t v58 = v0;
    v58[1] = sub_9C1A8;
    sub_45014();
    return sub_8E728(v59);
  }

  else
  {
    sub_AA774();
    if (qword_FB240 != -1) {
      swift_once(&qword_FB240, sub_6CD70);
    }
    uint64_t v43 = (void *)swift_task_alloc(dword_FF87C);
    v0[41] = v43;
    *uint64_t v43 = v0;
    v43[1] = sub_9C0D8;
    sub_45014();
    return sub_8E798(v44);
  }

uint64_t sub_9BE54(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[32] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_1B9B8();
    return swift_task_switch(v5, v6, v7);
  }

  else
  {
    v4[38] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v4[39] = v9;
    *uint64_t v9 = v4;
    v9[1] = sub_9BFE8;
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v4[3],  v4[27],  v4[24],  v4[18],  0LL);
  }

uint64_t sub_9BF0C(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[37] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[33];
  swift_bridgeObjectRelease(v4[34]);
  swift_bridgeObjectRelease(v5);
  sub_1BA24();
  if (v1)
  {
    sub_1B9B8();
    return swift_task_switch(v6, v7, v8);
  }

  else
  {
    v4[38] = a1;
    char v10 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v4[39] = v10;
    *char v10 = v4;
    v10[1] = sub_9BFE8;
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v4[3],  v4[27],  v4[24],  v4[18],  0LL);
  }

uint64_t sub_9BFE8()
{
  *uint64_t v2 = *v1;
  *(void *)(v3 + 320) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "9C0B4: call analysis failed (funcsize=40)"
uint64_t sub_9C0D8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  sub_1BBF4();
  *uint64_t v2 = *v1;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "9C180: call analysis failed (funcsize=32)"
uint64_t sub_9C1A8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  sub_1BBF4();
  *uint64_t v2 = *v1;
  *(void *)(v3 + 352) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "9C254: call analysis failed (funcsize=33)"
uint64_t sub_9C27C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  sub_2B500();
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[23];
  sub_1BB90(v0[17]);
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_9CAF0();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1BABC();
  uint64_t v3 = (uint64_t (*)(void))sub_2BE7C();
  return sub_206D8(v3);
}

uint64_t sub_9C2F8()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[23];
  sub_1BB90(v0[17]);
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_9CAF0();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1BABC();
  uint64_t v3 = (uint64_t (*)(void))sub_2BE7C();
  return sub_206D8(v3);
}

uint64_t sub_9C374()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 128);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_9CAF0();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1BABC();
  uint64_t v6 = (uint64_t (*)(void))sub_2BE7C();
  return sub_206D8(v6);
}

uint64_t sub_9C404()
{
  uint64_t v1 = *(void *)(v0 + 208);
  sub_1BB90(*(void *)(v0 + 184));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_9CAF0();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1BABC();
  uint64_t v2 = (uint64_t (*)(void))sub_2BE7C();
  return sub_206D8(v2);
}

uint64_t sub_9C470()
{
  uint64_t v1 = *(void *)(v0 + 208);
  sub_1BB90(*(void *)(v0 + 184));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_9CAF0();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1BABC();
  uint64_t v2 = (uint64_t (*)(void))sub_2BE7C();
  return sub_206D8(v2);
}

uint64_t sub_9C4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_67C4(&qword_FBD98);
  __chkstk_darwin(v11);
  os_log_type_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_67C4(&qword_FF538);
  uint64_t v15 = (void *)ParameterResolutionRecord.intent.getter(v14);
  id v16 = [v15 targetTimer];

  if (v16)
  {
    sub_D378();
    uint64_t v18 = v17;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  uint64_t v19 = type metadata accessor for SetTimerAttributePromptExistingParameters(0LL);
  uint64_t v20 = *(int *)(v19 + 24);
  swift_release();
  *(void *)(a1 + v20) = v18;
  swift_bridgeObjectRetain(a4);
  SpeakableString.init(serializedValue:)(a3, a4);
  uint64_t v21 = type metadata accessor for SpeakableString(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v21);
  sub_1B4F4((uint64_t)v13, a1);
  swift_bridgeObjectRetain(a6);
  SpeakableString.init(serializedValue:)(a5, a6);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v21);
  return sub_1B4F4((uint64_t)v13, a1 + *(int *)(v19 + 20));
}

uint64_t sub_9C65C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_10009C);
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_9C6BC;
  return sub_9B6B4(a1, a2);
}

uint64_t sub_9C6BC()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_9C6F8()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(102LL, 0x80000000000C9840LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_9C760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_998F8(a1, a2);
}

uint64_t sub_9C774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_1000A4);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_9CAEC;
  return sub_9B5A8(a1, a2, a3);
}

uint64_t sub_9C7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_100094);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_9C83C;
  return sub_9C65C(a1, a2);
}

uint64_t sub_9C83C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc();
  return sub_1ECD4(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_9C874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to NeedsValueFlowStrategyAsync.makeRepromptOnEmptyParse(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_9CAEC;
  return NeedsValueFlowStrategyAsync.makeRepromptOnEmptyParse(resolveRecord:)(a1, a2, a3, a4);
}

uint64_t sub_9C8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to NeedsValueFlowStrategyAsync.makeRepromptOnLowConfidence(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_9CAEC;
  return NeedsValueFlowStrategyAsync.makeRepromptOnLowConfidence(resolveRecord:)(a1, a2, a3, a4);
}

uint64_t sub_9C96C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v13 = (void *)swift_task_alloc(async function pointer to ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)[1]);
  *(void *)(v6 + 16) = v13;
  *os_log_type_t v13 = v6;
  v13[1] = sub_9CAEC;
  return ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_9CA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)[1]);
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_9CAEC;
  return ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)(a1, a2, a3, a4, a5, a6, a7);
}

unint64_t sub_9CAA0()
{
  unint64_t result = qword_100068[0];
  if (!qword_100068[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_C5CE4, &_s18NeedsValueStrategyVN);
    atomic_store(result, qword_100068);
  }

  return result;
}

uint64_t sub_9CADC(uint64_t a1)
{
  return sub_9C4DC(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_9CAF0()
{
  return swift_task_dealloc(*(void *)(v0 + 240));
}

uint64_t sub_9CB18()
{
  return (*(uint64_t (**)(void, void))(v0[6] + 8LL))(v0[9], v0[5]);
}

uint64_t sub_9CB5C( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 0;
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_9CB6C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_9CB78()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t sub_9CB90( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  return sub_683C(a1, a2, (uint64_t *)va);
}

  ;
}

uint64_t sub_9CBB4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(v1);
}

  ;
}

BOOL sub_9CBDC(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_9CBE4()
{
  return type metadata accessor for SetTimerAttributeIntent(0LL);
}

  ;
}

uint64_t sub_9CBF8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_9CC00()
{
  return sub_1E720(v1, v0);
}

char *sub_9CC0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  return &a19;
}

double sub_9CC18()
{
  return 0.0;
}

  ;
}

uint64_t sub_9CC30()
{
  return swift_task_dealloc(v0);
}

id sub_9CC3C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_9CC44()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_9CC50()
{
  return Logger.logObject.getter();
}

ValueMetadata *_s20HandleIntentStrategyVMa_5()
{
  return &_s20HandleIntentStrategyVN_5;
}

uint64_t sub_9CC68()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_1000B8);
  sub_5474(v0, (uint64_t)qword_1000B8);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_9CCB0(uint64_t a1, uint64_t a2)
{
  v2[45] = a1;
  v2[46] = a2;
  uint64_t v3 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[47] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[48] = v4;
  v2[49] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = *(void *)(type metadata accessor for SiriTimerSnippetModel(0LL) - 8);
  v2[50] = v5;
  v2[51] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = (*(void *)(*(void *)(sub_67C4(&qword_FC418) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[52] = swift_task_alloc(v6);
  v2[53] = swift_task_alloc(v6);
  v2[54] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[55] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[56] = v8;
  v2[57] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v2[58] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[59] = v10;
  v2[60] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[61] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[62] = v12;
  v2[63] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[64] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[65] = v14;
  v2[66] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DialogPhase(0LL);
  v2[67] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[68] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[69] = swift_task_alloc(v17);
  v2[70] = swift_task_alloc(v17);
  v2[71] = swift_task_alloc(v17);
  v2[72] = swift_task_alloc(v17);
  uint64_t v18 = type metadata accessor for NLContextUpdate(0LL);
  v2[73] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[74] = v19;
  v2[75] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_9CEB8, 0LL, 0LL);
}

uint64_t sub_9CEB8()
{
  if (qword_FB338 != -1) {
    swift_once(&qword_FB338, sub_9CC68);
  }
  uint64_t v2 = sub_5474(*(void *)(v1 + 464), (uint64_t)qword_1000B8);
  *(void *)(v1 + 608) = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_2BA04(v5);
    _os_log_impl(&dword_0, v3, v4, "ResetTimer.HandleIntentStrategy.makeIntentHandledResponse() called", v0, 2u);
    sub_1B904((uint64_t)v0);
  }

  uint64_t v6 = sub_67C4(&qword_100128);
  uint64_t v7 = (void *)IntentResolutionRecord.intentResponse.getter(v6);
  unint64_t v8 = sub_9FEE0(v7);
  *(void *)(v1 + 616) = v8;
  if (!v8) {
    goto LABEL_52;
  }
  uint64_t v9 = v8;
  unint64_t v10 = v8 >> 62;
  if (!(v8 >> 62))
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFF8LL));
    sub_33E50();
    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }

  sub_33E50();
  if (!sub_2B930())
  {
LABEL_51:
    sub_4C700();
LABEL_52:
    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v121 = sub_5A12C();
    uint64_t v122 = sub_2F6A0(v121);
    sub_7C168(v122, v123, v124, v125, v126, v127, v128, v129, 5);
    goto LABEL_53;
  }

LABEL_57:
    swift_once(&qword_FB1A0, sub_437B0);
    goto LABEL_38;
  }

  if (qword_FB1A0 != -1) {
    swift_once(&qword_FB1A0, sub_437B0);
  }
  uint64_t v102 = (void *)swift_task_alloc(dword_FCFFC);
  *(void *)(v1 + 768) = v102;
  sub_A01A4(v102, (uint64_t)sub_9E8D4);
  sub_2B9E8(v103);
  sub_A0050();
  return sub_47178(v104);
}

uint64_t sub_9D81C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 664) = a1;
  *(void *)(v3 + 672) = a2;
  swift_task_dealloc();
  sub_18034();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_9D8A4()
{
  uint64_t v1 = *(void *)(v0 + 672);
  uint64_t v2 = *(void *)(v0 + 664);
  *(void *)(v0 + 688) = v1;
  *(void *)(v0 + 680) = v2;
  uint64_t v123 = *(void *)(v0 + 608);
  uint64_t v3 = *(void *)(v0 + 504);
  uint64_t v4 = *(void *)(v0 + 480);
  uint64_t v111 = *(void *)(v0 + 496);
  uint64_t v113 = *(void *)(v0 + 488);
  uint64_t v116 = *(void *)(v0 + 472);
  uint64_t v120 = *(void *)(v0 + 464);
  uint64_t v5 = type metadata accessor for ApplicationContext(0LL);
  static ApplicationContext.shared.getter(v5);
  ApplicationContext.deviceState.getter((void *)(v0 + 96));
  sub_1BC50();
  uint64_t v6 = *(void *)(v0 + 120);
  sub_8CFC((void *)(v0 + 96), v6);
  uint64_t v109 = v1;
  int v7 = sub_64594(v6) & (v1 != 0);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 96));
  (*(void (**)(uint64_t, void, uint64_t))(v111 + 104))( v3,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v113);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v116 + 16))(v4, v123, v120);
  uint64_t v8 = mach_absolute_time();
  uint64_t v9 = SiriTimeMeasurement.init(_:log:startTime:)(v3, v4, v8);
  static ApplicationContext.shared.getter(v9);
  ApplicationContext.deviceState.getter((void *)(v0 + 136));
  sub_1BC50();
  uint64_t v10 = *(void *)(v0 + 160);
  uint64_t v11 = *(void *)(v0 + 168);
  sub_8CFC((void *)(v0 + 136), v10);
  uint64_t v12 = sub_64594(v10);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 136));
  if ((v12 & 1) != 0 && !v7)
  {
    id v13 = sub_A01BC();
    *(void *)(v0 + 784) = v13;
    sub_18034();
    if (v13)
    {
      uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___NSKeyedArchiver);
      *(void *)(v0 + 344) = 0LL;
      id v15 = sub_64668(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", (uint64_t)v13);
      uint64_t v16 = *(void **)(v0 + 344);
      if (v15)
      {
        uint64_t v17 = v15;
        id v18 = v16;
        uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v17);
        uint64_t v21 = v20;

        *(void *)(v0 + 792) = v19;
        *(void *)(v0 + 800) = v21;
        if (qword_FB1A0 != -1) {
          swift_once(&qword_FB1A0, sub_437B0);
        }
        uint64_t v22 = (void *)sub_5A248();
        sub_A01F0(v22);
        id v23 = (void *)swift_task_alloc(dword_FCFF4);
        *(void *)(v0 + 816) = v23;
        sub_A0194(v23, (uint64_t)sub_9EA1C);
        sub_2F678();
        return sub_46F9C(v24, v25, v26);
      }

      unint64_t v73 = *(void **)(v0 + 624);
      uint64_t v124 = *(void *)(v0 + 584);
      uint64_t v125 = *(void *)(v0 + 600);
      uint64_t v117 = *(void *)(v0 + 576);
      uint64_t v121 = *(void *)(v0 + 592);
      uint64_t v74 = *(void *)(v0 + 544);
      uint64_t v111 = *(void *)(v0 + 536);
      uint64_t v75 = *(void *)(v0 + 528);
      uint64_t v76 = *(void *)(v0 + 520);
      uint64_t v77 = *(void *)(v0 + 512);
      id v78 = v16;
      swift_bridgeObjectRelease(v109);
      sub_2B7C4();
      uint64_t v79 = _convertNSErrorToError(_:)(v16);

      uint64_t v114 = v79;
      sub_7C2CC(v80, v81, v82, v83, v84, v85, v86, v87);

      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v117, v111);
    }

    else
    {
      swift_bridgeObjectRelease(*(void *)(v0 + 632));
      uint64_t v45 = swift_bridgeObjectRelease(v109);
      Logger.logObject.getter(v45);
      os_log_type_t v46 = sub_1BCD0();
      if (sub_1BB80(v46))
      {
        id v47 = (_WORD *)sub_1B9DC();
        sub_2BA04(v47);
        sub_1BAA8(&dword_0, v48, v49, "Could not get timer action from timer.");
        sub_1B904(v0 + 136);
      }

      id v50 = *(void **)(v0 + 624);
      uint64_t v121 = *(void *)(v0 + 592);
      uint64_t v124 = *(void *)(v0 + 584);
      uint64_t v125 = *(void *)(v0 + 600);
      sub_A0178();
      sub_67C4((uint64_t *)&unk_FF830);
      unint64_t v51 = sub_5A12C();
      uint64_t v52 = sub_2F6A0(v51);
      *uint64_t v53 = 1;
      uint64_t v114 = v52;
      swift_willThrow(v52, v53, v54, v55, v56, v57, v58, v59);

      sub_2B950(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      MEMORY[0x800000000](v3, v4);
    }

    (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v125, v124);
    sub_A0130();
    uint64_t v118 = v89;
    uint64_t v122 = v88;
    swift_task_dealloc();
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    uint64_t v90 = sub_1BABC();
    uint64_t v98 = sub_1B8B4(v90, v91, v92, v93, v94, v95, v96, v97, v107, v109, v111, v114, v118);
    sub_1B864(v98, v99, v100, v101, v102, v103, v104, v105, v108, v110, v112, v115, v119, v122);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_2F678();
    __asm { BR              X0 }
  }

  sub_64524();
  BOOL v28 = SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()();
  uint64_t v29 = sub_64444(v12, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  if (v28)
  {
    uint64_t v30 = *(void **)(v0 + 608);
    Logger.logObject.getter(v29);
    os_log_type_t v31 = sub_1BCD0();
    if (sub_1BB80(v31))
    {
      uint64_t v32 = (_WORD *)sub_1B9DC();
      sub_2BA04(v32);
      sub_1BAA8( &dword_0,  v33,  v34,  "[ResetTimer.HandleIntentStrategy.makeIntentHandledResponse] Using multi-timer RF 2.0 path");
      sub_1B904(v28);
    }

    if (v7)
    {
      sub_2F784();
      uint64_t v36 = sub_6462C();
    }

    else
    {
      uint64_t v60 = *(void *)(v0 + 640);
      uint64_t v61 = _swiftEmptyArrayStorage;
      if (v60)
      {
        v126[0] = _swiftEmptyArrayStorage;
        sub_645F4(v35, v60 & ~(v60 >> 63));
        if (v60 < 0) {
          __break(1u);
        }
        uint64_t v61 = (void *)v126[0];
        os_log_type_t v62 = (id *)(*(void *)(v0 + 616) + 32LL);
        do
        {
          uint64_t v63 = *(void *)(v0 + 616);
          if ((v63 & 0xC000000000000001LL) != 0) {
            specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v63);
          }
          else {
            id v64 = *v62;
          }
          sub_645BC();

          v126[0] = v61;
          unint64_t v65 = v61[3];
          if (v61[2] >= v65 >> 1)
          {
            sub_64588(v65 > 1);
            uint64_t v61 = (void *)v126[0];
          }

          sub_A00A0();
        }

        while (v126);
      }

      **(void **)(v0 + 432) = v61;
      uint64_t v69 = sub_2F784();
      sub_644D0(v69);
      uint64_t v36 = sub_6460C();
    }

    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v36, v37, v38, v39);
    if (qword_FB190 != -1) {
      swift_once(&qword_FB190, sub_43778);
    }
    uint64_t v70 = (void *)swift_task_alloc(dword_FBDD4);
    *(void *)(v0 + 696) = v70;
    sub_A0194(v70, (uint64_t)sub_9DFA4);
    sub_2B9E8(v71);
    sub_2F678();
    return sub_1BDE4(v72);
  }

  else
  {
    unint64_t v40 = *(void *)(v0 + 632);
    sub_A020C();
    if (v40 >> 62)
    {
      sub_33E50();
      uint64_t v41 = sub_2B930();
      sub_2B7C4();
    }

    else
    {
      uint64_t v41 = *(void *)((char *)&dword_10 + (v40 & 0xFFFFFFFFFFFFF8LL));
    }

    if (v41 < 2)
    {
      if (qword_FB1A0 != -1) {
        swift_once(&qword_FB1A0, sub_437B0);
      }
      uint64_t v66 = (void *)swift_task_alloc(dword_FCFFC);
      *(void *)(v0 + 768) = v66;
      sub_A0194(v66, (uint64_t)sub_9E8D4);
      sub_2B9E8(v67);
      sub_2F678();
      return sub_47178(v68);
    }

    else
    {
      if (qword_FB1A0 != -1) {
        swift_once(&qword_FB1A0, sub_437B0);
      }
      uint64_t v42 = (void *)swift_task_alloc(dword_FCFEC);
      *(void *)(v0 + 752) = v42;
      sub_A0194(v42, (uint64_t)sub_9E78C);
      sub_2B9E8(v43);
      sub_2F678();
      return sub_46EA4(v44);
    }
  }

uint64_t sub_9DFA4()
{
  v0[88] = v2;
  v0[89] = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease(v0[79]);
    sub_2B7C4();
    sub_18034();
  }

  else
  {
    sub_A01B4();
  }

  sub_1B9B8();
  return sub_2F414(v3, v4, v5);
}

uint64_t sub_9E064()
{
  unint64_t v1 = *(void *)(v0 + 688);
  if (v1)
  {
    uint64_t v2 = *(os_log_s **)(v0 + 608);
    swift_bridgeObjectRelease(*(void *)(v0 + 616));
    uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
    Logger.logObject.getter(v3);
    os_log_type_t v4 = sub_1BCD0();
    if (os_log_type_enabled(v2, v4))
    {
      uint64_t v5 = *(void *)(v0 + 680);
      uint64_t v6 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v7 = sub_1BA1C(32LL);
      uint64_t v46 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_33E50();
      *(void *)(v0 + 336) = sub_683C(v5, v1, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 336, v0 + 344, v6 + 4, v6 + 12);
      swift_bridgeObjectRelease_n(v1, 3LL);
      _os_log_impl( &dword_0,  v2,  v4,  "[ResetTimer.HandleIntentStrategy.makeIntentHandledResponse] We have a live activity: %s",  v6,  0xCu);
      swift_arrayDestroy(v7, 1LL);
      sub_1B904(v7);
      sub_1B904((uint64_t)v6);
    }

    else
    {
      sub_4C700();
    }

    id v15 = (_OWORD *)(v0 + 56);
    uint64_t v17 = *(void *)(v0 + 424);
    uint64_t v16 = *(void *)(v0 + 432);
    static DialogPhase.completion.getter(v18);
    sub_2F27C(v16, v17);
    uint64_t v19 = sub_2F784();
    uint64_t v20 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v17, 1LL, v19);
    uint64_t v21 = *(void *)(v0 + 424);
    if ((_DWORD)v20 == 1)
    {
      sub_7C258(v20, &qword_FC418);
      *id v15 = 0u;
      *(_OWORD *)(v0 + 72) = 0u;
      *(void *)(v0 + 88) = 0LL;
    }

    else
    {
      *(void *)(v0 + 80) = v19;
      *(void *)(v0 + 88) = sub_F0D4();
      uint64_t v22 = sub_DB90((void *)(v0 + 56));
      sub_7BE58(v21, (uint64_t)v22, type metadata accessor for SiriTimePluginModel);
    }

    id v23 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
    *(void *)(v0 + 720) = v23;
    *id v23 = v0;
    v23[1] = sub_9E4A0;
    uint64_t v24 = *(void *)(v0 + 688);
    uint64_t v25 = *(void *)(v0 + 680);
    uint64_t v26 = *(void *)(v0 + 600);
    uint64_t v27 = *(void *)(v0 + 568);
    uint64_t v28 = *(void *)(v0 + 528);
    uint64_t v29 = *(void *)(v0 + 360);
    unint64_t v47 = 0x80000000000C7F60LL;
    return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( v29,  v27,  v26,  v15,  v28,  v25,  v24,  0xD000000000000018LL);
  }

  else
  {
    uint64_t v8 = *(os_log_s **)(v0 + 608);
    uint64_t v9 = swift_bridgeObjectRetain(*(void *)(v0 + 616));
    Logger.logObject.getter(v9);
    os_log_type_t v10 = sub_1BCD0();
    if (sub_1BB80(v10))
    {
      uint64_t v11 = *(void *)(v0 + 640);
      uint64_t v12 = *(void *)(v0 + 616);
      id v13 = (uint8_t *)sub_1BA1C(12LL);
      *(_DWORD *)id v13 = 134217984;
      *(void *)(v0 + 352) = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 352, v0 + 360, v13 + 4, v13 + 12);
      swift_bridgeObjectRelease(v12);
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "[ResetTimer.HandleIntentStrategy.makeIntentHandledResponse] Using multi-timer snippet model for %ld timers.",  v13,  0xCu);
      sub_1B904((uint64_t)v13);
    }

    else
    {

      uint64_t v14 = sub_2B7C4();
    }

    os_log_type_t v31 = (_OWORD *)(v0 + 176);
    uint64_t v32 = *(void *)(v0 + 432);
    uint64_t v33 = *(void *)(v0 + 416);
    static DialogPhase.completion.getter(v14);
    sub_2F27C(v32, v33);
    uint64_t v34 = sub_2F784();
    int v35 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v33, 1LL, v34);
    uint64_t v36 = *(void *)(v0 + 416);
    if (v35 == 1)
    {
      sub_DABC(*(void *)(v0 + 416), &qword_FC418);
      *os_log_type_t v31 = 0u;
      *(_OWORD *)(v0 + 192) = 0u;
      *(void *)(v0 + 208) = 0LL;
    }

    else
    {
      *(void *)(v0 + 200) = v34;
      *(void *)(v0 + 208) = sub_F0D4();
      uint64_t v37 = sub_DB90((void *)(v0 + 176));
      sub_7BE58(v36, (uint64_t)v37, type metadata accessor for SiriTimePluginModel);
    }

    uint64_t v38 = *(void *)(v0 + 640);
    sub_A020C();
    if (v38 <= 1) {
      unint64_t v39 = 0xD000000000000018LL;
    }
    else {
      unint64_t v39 = 0xD000000000000017LL;
    }
    if (v38 <= 1) {
      unint64_t v40 = 0x80000000000C7F60LL;
    }
    else {
      unint64_t v40 = 0x80000000000C7FA0LL;
    }
    uint64_t v41 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
    *(void *)(v0 + 736) = v41;
    *uint64_t v41 = v0;
    v41[1] = sub_9E5F8;
    uint64_t v42 = *(void *)(v0 + 600);
    uint64_t v43 = *(void *)(v0 + 560);
    uint64_t v44 = *(void *)(v0 + 528);
    uint64_t v45 = *(void *)(v0 + 360);
    unint64_t v47 = v40;
    return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( v45,  v43,  v42,  v31,  v44,  0LL,  0LL,  v39);
  }

uint64_t sub_9E4A0()
{
  uint64_t v1 = *(void *)(v0 + 544);
  sub_1BC0C(v2);
  swift_task_dealloc();
  sub_2B7C4();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  *(void *)(v0 + 728) = v3;
  uint64_t v4 = sub_2B5AC(v3);
  sub_7C258(v4, &qword_FC2B8);
  sub_1B9B8();
  return sub_A0160(v5, v6, v7);
}

#error "9E584: call analysis failed (funcsize=46)"
uint64_t sub_9E5F8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  sub_A01DC();
  uint64_t v1 = v0[70];
  uint64_t v2 = v0[68];
  uint64_t v3 = v0[67];
  else {
    uint64_t v4 = 0x80000000000C7FA0LL;
  }
  swift_task_dealloc();
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  v0[93] = v5;
  uint64_t v6 = v5(v1, v3);
  sub_7C258(v6, &qword_FC2B8);
  sub_1B9B8();
  return sub_A0160(v7, v8, v9);
}

#error "9E718: call analysis failed (funcsize=46)"
uint64_t sub_9E78C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  sub_59BD0();
  v0[32] = v2;
  v0[33] = v3;
  v0[34] = v1;
  sub_1BC0C(v4);
  v0[95] = v1;
  swift_task_dealloc();
  sub_A01B4();
  if (v1) {
    sub_18034();
  }
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_9E838()
{
  uint64_t v1 = (void *)sub_5A248();
  uint64_t v2 = sub_64544(v1);
  sub_64434((uint64_t)v2, (uint64_t)sub_2B2DC);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  *(void *)(v0 + 840) = v3;
  sub_643E0(v3);
  return sub_64234();
}

uint64_t sub_9E8D4()
{
  v0[35] = v2;
  v0[36] = v3;
  v0[37] = v1;
  sub_1BC0C(v4);
  v0[97] = v1;
  swift_task_dealloc();
  sub_A01B4();
  if (v1) {
    sub_18034();
  }
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_9E980()
{
  uint64_t v1 = (void *)sub_5A248();
  uint64_t v2 = sub_64544(v1);
  sub_64434((uint64_t)v2, (uint64_t)sub_2B2DC);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  *(void *)(v0 + 840) = v3;
  sub_643E0(v3);
  return sub_64234();
}

uint64_t sub_9EA1C()
{
  v1[38] = v2;
  v1[39] = v3;
  v1[40] = v0;
  sub_1BC0C(v4);
  v1[103] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease(v1[79]);
  if (v0) {
    sub_18034();
  }
  sub_1B86C();
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_9EAE0()
{
  unint64_t v1 = *(void *)(v0 + 800);
  uint64_t v2 = *(void *)(v0 + 792);

  sub_21470(v2, v1);
  sub_9FFFC();
  uint64_t v3 = (void *)sub_5A248();
  uint64_t v4 = sub_64544(v3);
  sub_64434((uint64_t)v4, (uint64_t)sub_2B2DC);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  *(void *)(v0 + 840) = v5;
  sub_643E0(v5);
  return sub_64234();
}

uint64_t sub_9EB98()
{
  v0[106] = v1;
  swift_task_dealloc();
  (*(void (**)(void, void))(v0[48] + 8LL))(v0[49], v0[47]);
  sub_1B9B8();
  return sub_2F414(v3, v4, v5);
}

#error "9ECE0: call analysis failed (funcsize=56)"
#error "9EDA4: call analysis failed (funcsize=47)"
#error "9EE4C: call analysis failed (funcsize=42)"
#error "9EEF4: call analysis failed (funcsize=42)"
#error "9EFE0: call analysis failed (funcsize=59)"
#error "9F098: call analysis failed (funcsize=46)"
uint64_t sub_9F0D0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v2 = sub_67C4(&qword_FBD98);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = Data.base64EncodedString(options:)(0LL);
  SpeakableString.init(serializedValue:)(v5._countAndFlagsBits, v5._object);
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v4, 0LL, 1LL, v6);
  uint64_t v7 = type metadata accessor for ResetTimerHandledOnWatchParameters(0LL);
  sub_1B4F4((uint64_t)v4, (uint64_t)a1 + *(int *)(v7 + 24));
  type metadata accessor for SirikitApp(0LL);
  uint64_t v8 = sub_67C4(&qword_100128);
  uint64_t v9 = IntentResolutionRecord.app.getter(v8);
  os_log_type_t v10 = SirikitApp.init(app:)(v9);
  unint64_t result = swift_release();
  *a1 = v10;
  return result;
}

uint64_t sub_9F1C4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10013C);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_207EC(v1);
  return sub_9CCB0(v2, v3);
}

uint64_t sub_9F218()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_9F254()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  uint64_t v4 = sub_207C0(100LL, 0x80000000000C9990LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_7C2CC(v4, v5, v6, v7, v8, v9, v10, v11);
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_9F2C0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[5] = v4;
  v2[6] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  void v2[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  _BYTE v2[8] = v6;
  void v2[9] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[11] = v8;
  v2[12] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for CATOption(0LL);
  v2[13] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DialogPhase(0LL);
  v2[14] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[15] = v11;
  v2[16] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for NLContextUpdate(0LL);
  v2[17] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[18] = v13;
  v2[19] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_9F3E0, 0LL, 0LL);
}

uint64_t sub_9F3E0()
{
  if (qword_FB338 != -1) {
    swift_once(&qword_FB338, sub_9CC68);
  }
  uint64_t v32 = (os_log_s *)sub_5474(v0[4], (uint64_t)qword_1000B8);
  Logger.logObject.getter(v32);
  os_log_type_t v1 = sub_1BCD0();
  if (os_log_type_enabled(v32, v1))
  {
    uint64_t v2 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl( &dword_0,  v32,  v1,  "ResetTimer.HandleIntentStrategy.makeFailureHandlingIntentResponse() called",  v2,  2u);
    sub_1B904((uint64_t)v2);
  }

  uint64_t v3 = v0[13];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[5];
  uint64_t v31 = v0[4];

  uint64_t v10 = NLContextUpdate.init()(v9);
  static DialogPhase.completion.getter(v10);
  type metadata accessor for TimerBaseCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  v0[20] = CATWrapper.__allocating_init(options:globals:)(v3, 0LL);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))( v5,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v7);
  (*(void (**)(uint64_t, os_log_s *, uint64_t))(v8 + 16))(v6, v32, v31);
  uint64_t v11 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v5, v6, v11);
  uint64_t v12 = sub_67C4(&qword_100128);
  uint64_t v13 = (void *)IntentResolutionRecord.intentResponse.getter(v12);
  uint64_t v14 = dispatch thunk of ResetTimerIntentResponse.code.getter();

  if (v14 == 100)
  {
    uint64_t v21 = (void *)swift_task_alloc(dword_100574);
    v0[24] = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_9F814;
    sub_20788();
    return sub_ACD60();
  }

  if (v14 == 101)
  {
    uint64_t v15 = v0[3];
    uint64_t v16 = swift_task_alloc(32LL);
    v0[21] = v16;
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = (void *)swift_task_alloc(dword_10056C);
    v0[22] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_9F75C;
    sub_2B9E8((uint64_t)sub_9FED8);
    sub_20788();
    return sub_ACBBC(v18, v19);
  }

  uint64_t v22 = (void *)IntentResolutionRecord.intent.getter(v12);
  id v23 = [v22 targetTimer];

  id v24 = [v23 shouldMatchAny];
  sub_1E6A8();
  v25.super.super.Class isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
  Class isa = v25.super.super.isa;
  if (v24)
  {
    id v27 = v24;
    char v28 = static NSObject.== infix(_:_:)(v27, isa);

    if ((v28 & 1) != 0)
    {
      if (qword_FB1A0 != -1) {
        swift_once(&qword_FB1A0, sub_437B0);
      }
      uint64_t v29 = (void *)swift_task_alloc(dword_FCFDC);
      v0[26] = v29;
      *uint64_t v29 = v0;
      v29[1] = sub_9F890;
      sub_20788();
      return sub_46DE4();
    }
  }

  else
  {
  }

  if (qword_FB1A0 != -1) {
    swift_once(&qword_FB1A0, sub_437B0);
  }
  uint64_t v30 = (void *)swift_task_alloc(dword_FCFE4);
  v0[28] = v30;
  *uint64_t v30 = v0;
  v30[1] = sub_9F90C;
  sub_20788();
  return sub_46E44();
}

uint64_t sub_9F75C(uint64_t a1)
{
  uint64_t v10 = (void *)*v2;
  uint64_t v4 = v10;
  sub_1BC0C(&v10);
  v4[23] = v1;
  swift_task_dealloc();
  sub_1BA24();
  if (v1)
  {
    sub_1B9B8();
    return swift_task_switch(v5, v6, v7);
  }

  else
  {
    v4[30] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v4[31] = v9;
    *uint64_t v9 = v2;
    v9[1] = sub_9F988;
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v4[2],  v4[16],  v4[19],  v4[12],  0LL);
  }

uint64_t sub_9F814(uint64_t a1)
{
  v2[25] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F414(v5, v6, v7);
  }

  else
  {
    v2[30] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[31] = v9;
    sub_A002C(v9);
    return sub_20660();
  }

uint64_t sub_9F890(uint64_t a1)
{
  v2[27] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F414(v5, v6, v7);
  }

  else
  {
    v2[30] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[31] = v9;
    sub_A002C(v9);
    return sub_20660();
  }

uint64_t sub_9F90C(uint64_t a1)
{
  v2[29] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F414(v5, v6, v7);
  }

  else
  {
    v2[30] = a1;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[31] = v9;
    sub_A002C(v9);
    return sub_20660();
  }

uint64_t sub_9F988()
{
  *(void *)(*(void *)v1 + 256LL) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "9FA58: call analysis failed (funcsize=38)"
#error "9FAAC: call analysis failed (funcsize=20)"
#error "9FAFC: call analysis failed (funcsize=20)"
#error "9FB4C: call analysis failed (funcsize=20)"
#error "9FB9C: call analysis failed (funcsize=20)"
#error "9FBF4: call analysis failed (funcsize=22)"
void sub_9FC10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  void *v5;
  uint64_t v2 = sub_67C4(&qword_100128);
  uint64_t v5 = (void *)IntentResolutionRecord.intent.getter(v2);
  uint64_t v3 = type metadata accessor for ResetTimerIntent(0LL);
  uint64_t v4 = IntentTargetable.knownHomePodCount.getter(v3, &protocol witness table for ResetTimerIntent);

  *(double *)a1 = v4;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_9FC88()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100124);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_207EC(v1);
  return sub_9F2C0(v2, v3);
}

uint64_t sub_9FCDC()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_9FD18()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  uint64_t v4 = sub_207C0(108LL, 0x80000000000C9920LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_7C2CC(v4, v5, v6, v7, v8, v9, v10, v11);
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_9FD84()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100134);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10E90;
  return sub_9F1C4();
}

uint64_t sub_9FDE4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10011C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20504;
  return sub_9FC88();
}

uint64_t sub_9FE44(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_100144);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_C5FC;
  return sub_789A4(a1, a2);
}

unint64_t sub_9FE9C()
{
  unint64_t result = qword_1000D8[0];
  if (!qword_1000D8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_C5D98, &_s20HandleIntentStrategyVN_5);
    atomic_store(result, qword_1000D8);
  }

  return result;
}

void sub_9FED8(uint64_t a1)
{
}

uint64_t sub_9FEE0(void *a1)
{
  id v2 = [a1 resetTimers];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = type metadata accessor for SiriTimer(0LL);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_9FF44(uint64_t *a1)
{
  return sub_9F0D0(a1);
}

uint64_t sub_9FF50()
{
  return swift_task_dealloc(*(void *)(v0 + 600));
}

uint64_t sub_9FF94()
{
  return swift_release(*(void *)(v0 + 160));
}

uint64_t sub_9FFBC()
{
  return swift_task_dealloc(*(void *)(v0 + 600));
}

uint64_t sub_9FFFC()
{
  uint64_t v2 = v1[72];
  uint64_t v3 = v1[69];
  uint64_t v4 = v1[68];
  uint64_t v5 = v1[67];
  v1[104] = v0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
}

uint64_t sub_A002C(void *a1)
{
  *a1 = v3;
  a1[1] = v1;
  return *(void *)(v2 + 16);
}

  ;
}

void sub_A006C()
{
}

uint64_t sub_A00A0()
{
  uint64_t v6 = *(void *)(v1 + 408);
  *(void *)(v3 + 16) = v2;
  return sub_7BE58( v6,  v3 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
         + *(void *)(v4 + 72) * v5,
           v0);
}

void sub_A00D0()
{
}

  ;
}

uint64_t sub_A0130()
{
  return *(void *)(v0 + 600);
}

uint64_t sub_A0160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

void sub_A0178()
{
}

void *sub_A0194@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *unint64_t result = v2;
  result[1] = a2;
  return result;
}

void *sub_A01A4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *unint64_t result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_A01B4()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 632));
}

id sub_A01BC()
{
  return sub_4C75C(*(void *)(v0 + 616), 0xDu);
}

uint64_t sub_A01CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t))
{
  return a11(v11, v12);
}

void sub_A01DC()
{
  *(void *)(v1 - 8) = *v0;
}

void *sub_A01F0(void *result)
{
  *(void *)(v3 + 808) = result;
  result[2] = v1;
  result[3] = v2;
  result[4] = v4;
  return result;
}

uint64_t sub_A0204(uint64_t a1, uint64_t *a2)
{
  return sub_DABC(v2, a2);
}

uint64_t sub_A020C()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 616));
}

ValueMetadata *_s25NeedsConfirmationStrategyVMa_2()
{
  return &_s25NeedsConfirmationStrategyVN_2;
}

uint64_t sub_A0224()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100148);
  sub_5474(v0, (uint64_t)qword_100148);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_A026C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_67C4((uint64_t *)&unk_FCC70);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_67C4(&qword_FBDB8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_FB340 != -1) {
    swift_once(&qword_FB340, sub_A0224);
  }
  uint64_t v10 = sub_1BD34();
  sub_5474(v10, (uint64_t)qword_100148);
  uint64_t v11 = (os_log_s *)sub_1BD20();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v13 = 0;
    sub_1BBEC(&dword_0, v11, v12, "PauseTimer.NeedsConfirmationStrategy.actionForInput() called)", v13);
    sub_1B904((uint64_t)v13);
  }

  uint64_t v14 = type metadata accessor for HALTimerDeviceContext(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 1LL, 1LL, v14);
  uint64_t v15 = enum case for DecideAction.PromptExpectation.confirmation(_:);
  uint64_t v16 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104LL))(v6, v15, v16);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v6, 0LL, 1LL, v16);
  sub_3B698(a1, (uint64_t)v9, 0, (uint64_t)v6, a2);
  sub_DABC((uint64_t)v6, (uint64_t *)&unk_FCC70);
  return sub_DABC((uint64_t)v9, &qword_FBDB8);
}

uint64_t sub_A0440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a1;
  v3[8] = a3;
  uint64_t v4 = sub_67C4(&qword_FBDB0);
  void v3[9] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_A049C, 0LL, 0LL);
}

uint64_t sub_A049C()
{
  if (qword_FB340 != -1) {
    swift_once(&qword_FB340, sub_A0224);
  }
  uint64_t v1 = sub_1BD34();
  sub_5474(v1, (uint64_t)qword_100148);
  uint64_t v2 = (os_log_s *)sub_1BD20();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v4 = 0;
    sub_1BBEC(&dword_0, v2, v3, "PauseTimer.NeedsConfirmationStrategy.parseConfirmationResponse() called", v4);
    sub_1B904((uint64_t)v4);
  }

  uint64_t v5 = sub_67C4(&qword_FF538);
  uint64_t v6 = (void *)ParameterResolutionRecord.result.getter(v5);
  id v7 = [v6 itemToConfirm];

  _bridgeAnyObjectToAny(_:)(v7);
  swift_unknownObjectRelease(v7);
  uint64_t v8 = type metadata accessor for SiriTimer(0LL);
  int v10 = sub_691C8(v0 + 48, v9, (uint64_t)&type metadata for Any + 8, v8);
  uint64_t v11 = *(void *)(v0 + 72);
  if (v10)
  {
    os_log_type_t v12 = *(void **)(v0 + 48);
    uint64_t v13 = (void *)ParameterResolutionRecord.intent.getter(v5);
    uint64_t v14 = (objc_class *)type metadata accessor for SetTimerAttributeIntent(0LL);
    id v15 = [objc_allocWithZone(v14) init];
    [v15 setTargetTimer:v12];
    id v16 = [v13 toDuration];
    sub_A187C((uint64_t)v16, "setToDuration:");

    id v17 = [v13 toLabel];
    sub_A187C((uint64_t)v17, "setToLabel:");

    uint64_t v18 = enum case for ConfirmationResponse.confirmed(_:);
    uint64_t v19 = type metadata accessor for ConfirmationResponse(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104LL))(v11, v18, v19);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v11, 0LL, 1LL, v19);
    id v20 = v15;
    uint64_t v22 = INIntent.withEndpointId.getter(v21);

    NeedsConfirmationAnswer.init(answeredValue:updatedIntent:)(v11, v22, v14);
  }

  else
  {
    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v23 = sub_5A12C();
    uint64_t v24 = sub_2F6A0(v23);
    sub_A1868(v24, v25, v26, v27, v28, v29, v30, v31);
  }

  sub_1B86C();
  return sub_A1840(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A0728()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1001D4);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_6CCEC(v1);
  return sub_A0440(v2, v3, v4);
}

uint64_t sub_A0780()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A07BC()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(122LL, 0x80000000000C9A90LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_A0824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a1;
  v3[8] = a3;
  uint64_t v4 = type metadata accessor for TemplatingResult(0LL);
  void v3[9] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[10] = v5;
  v3[11] = sub_1B6C8(v5);
  uint64_t v6 = sub_1BD34();
  v3[12] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[13] = v7;
  v3[14] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[15] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[16] = v9;
  v3[17] = sub_1B6C8(v9);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[19] = v11;
  v3[20] = sub_1B6C8(v11);
  uint64_t v12 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v3[21] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[22] = v13;
  v3[23] = sub_1B6C8(v13);
  uint64_t v14 = type metadata accessor for NLContextUpdate(0LL);
  v3[24] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[25] = v15;
  v3[26] = sub_1B6C8(v15);
  uint64_t v16 = type metadata accessor for DialogPhase(0LL);
  v3[27] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v3[28] = v17;
  v3[29] = sub_1B6C8(v17);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A0910()
{
  if (qword_FB340 != -1) {
    swift_once(&qword_FB340, sub_A0224);
  }
  uint64_t v1 = sub_5474(*(void *)(v0 + 96), (uint64_t)qword_100148);
  uint64_t v2 = (os_log_s *)sub_1BD20();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v4 = 0;
    sub_1BBEC(&dword_0, v2, v3, "PauseTimer.NeedsConfirmationStrategy.makePromptForConfirmation() called", v4);
    sub_1B904((uint64_t)v4);
  }

  uint64_t v5 = sub_67C4(&qword_FF538);
  uint64_t v6 = (void *)ParameterResolutionRecord.result.getter(v5);
  id v7 = [v6 itemToConfirm];

  _bridgeAnyObjectToAny(_:)(v7);
  swift_unknownObjectRelease(v7);
  uint64_t v8 = type metadata accessor for SiriTimer(0LL);
  uint64_t v10 = sub_691C8(v0 + 48, v9, (uint64_t)&type metadata for Any + 8, v8);
  if (!(_DWORD)v10)
  {
    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v34 = sub_5A12C();
    uint64_t v35 = sub_2F6A0(v34);
    sub_A1868(v35, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_20;
  }

  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v12 = *(void **)(v0 + 48);
  *(void *)(v0 + 240) = v12;
  static DialogPhase.confirmation.getter(v10);
  sub_A9100();
  static SiriTimeFeatureFlagsImpl.instance.getter(v13);
  Swift::Bool v14 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  uint64_t v15 = sub_2B944(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  if (v14)
  {
    uint64_t v16 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v15);

    Swift::String_optional v18 = AceObject.serializeToBase64()();
    *(void *)(v0 + 248) = v18.value._object;
    if (v18.value._object)
    {
      id v20 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v19);
      uint64_t v22 = v21;

      Swift::String_optional v23 = AceObject.serializeToBase64()();
      *(void *)(v0 + 256) = v23.value._object;
      if (v23.value._object)
      {
        uint64_t v24 = *(void *)(v0 + 136);
        uint64_t v25 = *(void *)(v0 + 112);
        uint64_t v26 = *(void *)(v0 + 96);
        uint64_t v27 = *(void *)(v0 + 104);
        (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 128) + 104LL))( v24,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  *(void *)(v0 + 120));
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v1, v26);
        uint64_t v28 = mach_absolute_time();
        SiriTimeMeasurement.init(_:log:startTime:)(v24, v25, v28);
        if (qword_FB250 != -1) {
          swift_once(&qword_FB250, sub_6CDA8);
        }
        uint64_t v29 = qword_1010B8;
        uint64_t v30 = unk_FDBDC;
        os_log_type_t v62 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_FDBD8
                                                                                           + dword_FDBD8);
        id v31 = v12;
        swift_bridgeObjectRetain(v23.value._object);
        swift_bridgeObjectRetain(v18.value._object);
        uint64_t v32 = (void *)swift_task_alloc(v30);
        *(void *)(v0 + 264) = v32;
        *uint64_t v32 = v0;
        v32[1] = sub_A0D5C;
        return v62( v29,  (uint64_t)v31,  v23.value._countAndFlagsBits,  (uint64_t)v23.value._object,  v18.value._countAndFlagsBits,  (uint64_t)v18.value._object);
      }

      uint64_t v19 = swift_bridgeObjectRelease(v18.value._object);
    }

    uint64_t v46 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)sub_1B9DC();
      *(_WORD *)uint64_t v48 = 0;
      sub_1BBEC(&dword_0, v46, v47, "Could not create direct invocation for confirm or reject actions.", v48);
      sub_1B904((uint64_t)v48);
    }

    uint64_t v49 = *(void *)(v0 + 224);
    uint64_t v50 = *(void *)(v0 + 208);
    uint64_t v51 = *(void *)(v0 + 192);
    uint64_t v52 = *(void *)(v0 + 200);

    sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v53 = sub_5A12C();
    uint64_t v54 = sub_2F6A0(v53);
    *uint64_t v55 = 0;
    swift_willThrow(v54, v55, v56, v57, v58, v59, v60, v61);

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v51);
    sub_2B944(*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
LABEL_20:
    sub_A1820();
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    return sub_20614(*(uint64_t (**)(void))(v0 + 8));
  }

  if (qword_FB240 != -1) {
    swift_once(&qword_FB240, sub_6CD70);
  }
  sub_D378();
  uint64_t v44 = v43;
  *(void *)(v0 + 304) = v43;
  uint64_t v45 = (void *)swift_task_alloc(dword_FF86C);
  *(void *)(v0 + 312) = v45;
  *uint64_t v45 = v0;
  v45[1] = sub_A0F2C;
  return sub_8E604(*(void *)(v0 + 88), v44);
}

uint64_t sub_A0D5C(uint64_t a1)
{
  os_log_type_t v3 = (void *)*v2;
  v3[34] = a1;
  v3[35] = v1;
  swift_task_dealloc();
  uint64_t v4 = v3[31];
  swift_bridgeObjectRelease(v3[32]);
  swift_bridgeObjectRelease(v4);
  if (v1)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[36] = v6;
    *uint64_t v6 = v3;
    v6[1] = sub_A0E1C;
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v3[7],  v3[29],  v3[26],  v3[20],  0LL);
  }

uint64_t sub_A0E1C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 296) = v0;
  swift_task_dealloc();

  sub_1B9B8();
  return sub_2B44C();
}

uint64_t sub_A0E80()
{
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 144);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v7);
  sub_2B944(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_1B86C();
  sub_1BA14();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_20614(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A0F2C()
{
  *(void *)(*(void *)v1 + 32Hasher.init(_seed:)(v2, 0LL) = v0;
  swift_task_dealloc();
  swift_release();
  sub_1B9B8();
  return sub_2B44C();
}

uint64_t sub_A0F90()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 200);

  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_2F5B0();
  sub_1BA24();
  sub_1BA38();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_20614(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A1048()
{
  return sub_A1840(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A10C0()
{
  return sub_A1840(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A1138()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_A1820();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_A11C4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1001C4);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_6CCEC(v1);
  return sub_A0824(v2, v3, v4);
}

uint64_t sub_A121C()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A1258()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(130LL, 0x80000000000C9A00LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_A12C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_A026C(a1, a2);
}

uint64_t sub_A12D4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1001CC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10E90;
  return sub_A0728();
}

uint64_t sub_A133C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to NeedsConfirmationFlowStrategyAsync.shouldRequestUnlockForConfirmation(itemToConfirm:resolveRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_C5FC;
  return NeedsConfirmationFlowStrategyAsync.shouldRequestUnlockForConfirmation(itemToConfirm:resolveRecord:)( a1,  a2,  a3,  a4);
}

uint64_t sub_A13B4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1001BC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20504;
  return sub_A11C4();
}

uint64_t sub_A141C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to NeedsConfirmationFlowStrategyAsync.makeRepromptOnEmptyParse(itemToConfirm:resolveRecord:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_10E90;
  return NeedsConfirmationFlowStrategyAsync.makeRepromptOnEmptyParse(itemToConfirm:resolveRecord:)(a1, a2, a3, a4, a5);
}

uint64_t sub_A14A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to NeedsConfirmationFlowStrategyAsync.makeRepromptOnLowConfidence(itemToConfirm:resolveRecord:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_10E90;
  return NeedsConfirmationFlowStrategyAsync.makeRepromptOnLowConfidence(itemToConfirm:resolveRecord:)( a1,  a2,  a3,  a4,  a5);
}

uint64_t sub_A1524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to NeedsConfirmationFlowStrategyAsync.makePromptForDeviceUnlock(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_10E90;
  return NeedsConfirmationFlowStrategyAsync.makePromptForDeviceUnlock(resolveRecord:)(a1, a2, a3, a4);
}

uint64_t sub_A15A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to NeedsConfirmationFlowStrategyAsync.makeHandoffForAuthenticationResponse(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_10E90;
  return NeedsConfirmationFlowStrategyAsync.makeHandoffForAuthenticationResponse(resolveRecord:)(a1, a2, a3, a4);
}

uint64_t sub_A161C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to NeedsConfirmationFlowStrategyAsync.makeConfirmationRejectedResponse(app:intent:parameter:)[1]);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_10E90;
  return NeedsConfirmationFlowStrategyAsync.makeConfirmationRejectedResponse(app:intent:parameter:)( a1,  a2,  a3,  a4,  a5,  a6);
}

uint64_t sub_A16B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)[1]);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_10E90;
  return ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_A1744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)[1]);
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_10E90;
  return ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)(a1, a2, a3, a4, a5, a6, a7);
}

unint64_t sub_A17E4()
{
  unint64_t result = qword_100170[0];
  if (!qword_100170[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_C5E5C, &_s25NeedsConfirmationStrategyVN_2);
    atomic_store(result, qword_100170);
  }

  return result;
}

uint64_t sub_A1820()
{
  return swift_task_dealloc(*(void *)(v0 + 232));
}

uint64_t sub_A1840(uint64_t (*a1)(void))
{
  return a1();
}

void sub_A184C()
{
}

uint64_t sub_A1868( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 3;
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

id sub_A187C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id sub_A1888()
{
  if (v0)
  {
    id v1 = [sub_A29B0() init];
    UsoEntity_common_Timer.duration.getter();
    id v2 = sub_A2A1C(objc_allocWithZone(&OBJC_CLASS___NSNumber), "initWithDouble:");
    sub_21648((uint64_t)v2, "setDuration:");

    UsoEntity_common_Timer.label.getter();
    NSString v4 = v3;
    if (v3)
    {
      id v5 = [v3 spokenPhrase];

      static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      uint64_t v7 = v6;

      NSString v4 = String._bridgeToObjectiveC()();
      uint64_t v3 = (void *)swift_bridgeObjectRelease(v7);
    }

    sub_21648((uint64_t)v3, "setLabel:");

    UsoEntity_common_Timer.timerState.getter();
    sub_8AF88(v8, "setState:");
    UsoEntity_common_Timer.timerType.getter();
    sub_8AF88(v9, "setType:");
    sub_1BC50();
  }

  else
  {
    id v10 = [sub_A29B0() init];
    uint64_t v11 = (void *)objc_opt_self(&OBJC_CLASS___SiriTimeTimerConstants);
    id v1 = v10;
    [v11 defaultDuration];
    id v12 = sub_A2A1C(objc_allocWithZone(&OBJC_CLASS___NSNumber), "initWithDouble:");
    sub_5F80C(v1, "setDuration:");

    id v14 = sub_A28D8(v13, "setLabel:");
    id v15 = sub_A28D8((uint64_t)v14, "setState:");
    sub_A2968((uint64_t)v15, "setType:");
  }

  sub_A291C();
  sub_A29E0();
  sub_C458();
  id v17 = (void *)sub_A29B8(v16);
  sub_5F80C(v1, "setTargetingInfo:");

  sub_2B750();
  return v1;
}

void sub_A1A78()
{
  id v1 = sub_A29F8();
  id v2 = [objc_allocWithZone(v0) init];
  sub_A2904(v2, "setTargetTimer:");
  sub_A291C();
  sub_A293C();
  sub_A29A8();
  NSString v4 = (void *)sub_A290C(v3);
  sub_5F80C(v2, "setTargetingInfo:");

  sub_2B750();
  sub_37FA0();
}

void sub_A1B0C()
{
  id v2 = sub_A29F8();
  sub_8361C();
  if (v3)
  {
    sub_A29C8();
    id v5 = v4;
    sub_2BB30();
  }

  else
  {
    id v5 = 0LL;
  }

  id v6 = v2;
  sub_A204C(v6, v5);
  uint64_t v8 = v7;
  sub_A291C();
  id v9 = v8;
  sub_A293C();
  sub_A29A8();
  uint64_t v11 = (void *)SiriRemoteTimerTarget.__allocating_init(deviceNames:deviceReferenceNames:)(v1, v10);
  sub_5F80C(v0, "setTargetingInfo:");

  sub_2B750();
  sub_37FA0();
}

void *sub_A1BC0(uint64_t a1, void *a2)
{
  uint64_t v3 = static UsoTask_CodegenConverter.convert(task:)(a1);
  sub_A29D4(v3, v4);
  if (v36)
  {
    uint64_t updated = type metadata accessor for UsoTask_update_common_Timer(0LL);
    uint64_t v7 = sub_A2924(updated, v6);
    if ((v7 & 1) != 0)
    {
      uint64_t v9 = swift_retain();
      sub_A2A10(v9, v10);
      sub_2BB30();
      if (v35[0])
      {
        UsoEntity_common_Timer.label.getter();
        id v12 = v11;
        sub_1BC50();
      }

      else
      {
        id v12 = 0LL;
      }

      uint64_t v25 = swift_retain();
      sub_A2A10(v25, v26);
      sub_2BB30();
      if (v35[0])
      {
        UsoEntity_common_Timer.duration.getter();
        sub_1BC50();
      }

      else
      {
        [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
      }

      sub_2BF0C();
      id v27 = sub_A2A04();
      if (a2 && (id v28 = [a2 targetTimer]) != 0)
      {
        id v29 = v28;
        SiriTimer.merge(with:)(v27);
      }

      else
      {
        id v29 = v27;
      }

      id v15 = v29;
      v30.super.super.Class isa = Double._bridgeToObjectiveC()().super.super.isa;
      sub_A1FC4(v29, v30.super.super.isa, v12);
      uint64_t v19 = v31;

      sub_2BB30();
LABEL_27:

      sub_A291C();
      sub_C3B0();
      sub_A29A8();
      uint64_t v33 = (void *)sub_A290C(v32);
      sub_5F80C(v19, "setTargetingInfo:");
      swift_release();

      goto LABEL_28;
    }
  }

  else
  {
    uint64_t v7 = sub_A2898((uint64_t)v35);
  }

  sub_A29D4(v7, v8);
  if (v36)
  {
    uint64_t v13 = type metadata accessor for UsoTask_update_uso_NoEntity(0LL);
    if ((sub_A2924(v13, v14) & 1) != 0)
    {
      swift_release();
      sub_2BF0C();
      id v15 = sub_A2A04();
      if (!SiriTimer.isDefault()()
        || (id v16 = [a2 targetTimer]) == 0)
      {
        id v16 = v15;
      }

      [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
      v17.super.super.Class isa = Double._bridgeToObjectiveC()().super.super.isa;
      sub_A1FC4(v16, v17.super.super.isa, 0LL);
      uint64_t v19 = v18;
      goto LABEL_27;
    }
  }

  else
  {
    sub_A2898((uint64_t)v35);
  }

  if (qword_FB348 != -1) {
    swift_once(&qword_FB348, sub_A261C);
  }
  uint64_t v20 = type metadata accessor for Logger(0LL);
  uint64_t v21 = sub_5474(v20, (uint64_t)qword_1001D8);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl( &dword_0,  v22,  v23,  "NLv4TranslationParse: Dialog act is not a resolvable INSetTimerAttributeIntent parse, cannot support input",  v24,  2u);
    sub_1B904((uint64_t)v24);
  }

  swift_release();

  uint64_t v19 = 0LL;
LABEL_28:
  sub_A2898((uint64_t)v37);
  return v19;
}

void *sub_A1EC8(void *a1)
{
  if (v3)
  {
    uint64_t v4 = v3;
    swift_retain();
    id v5 = v1;
    id v6 = sub_B5CB8(v4);
    sub_A27FC(v5, v6);
    uint64_t v8 = v7;
    sub_2BB30();
  }

  else
  {
    sub_8361C();
    if (v9)
    {
      sub_A29C8();
      uint64_t v11 = v10;
      sub_2BB30();
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    sub_A20B8(v1, v11);
    uint64_t v8 = v12;
  }

  sub_A291C();
  sub_A293C();
  sub_A29A8();
  uint64_t v14 = (void *)sub_A290C(v13);
  sub_5F80C(v8, "setTargetingInfo:");

  sub_2B750();
  return v8;
}

void sub_A1FC4(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  id v8 = [objc_allocWithZone(v4) init];
  sub_A2904(v8, "setTargetTimer:");
  id v9 = sub_5F80C(v8, "setToDuration:");
  sub_A2A24((uint64_t)v9, "setToLabel:");

  sub_37FA0();
}

void sub_A204C(void *a1, void *a2)
{
  id v5 = [sub_A28EC() init];
  sub_A2948();
  id v6 = a1;
  sub_5F80C(v2, "setTargetTimer:");

  sub_17B78();
}

void sub_A20B8(void *a1, void *a2)
{
  id v5 = [sub_A28EC() init];
  sub_A2948();
  sub_A2904(v2, "setTargetTimer:");
  sub_A28E4(v2, "setToTimer:");

  sub_17B78();
}

void sub_A2128(uint64_t a1, char a2)
{
  id v4 = [sub_A28EC() init];
  sub_A2974();
  UsoEntity_common_Timer.label.getter();
  id v6 = v5;
  sub_5F80C(v2, "setLabel:");

  if ((a2 & 1) != 0) {
    UsoEntity_common_Timer.remainingTime.getter();
  }
  else {
    UsoEntity_common_Timer.duration.getter();
  }
  sub_A2980();
  UsoEntity_common_Timer.timerType.getter();
  id v8 = sub_8AF88(v7, "setType:");
  sub_A28D8((uint64_t)v8, "setTargetingInfo:");

  sub_2B750();
  sub_17B78();
}

void sub_A21C4(uint64_t a1, uint64_t a2, double a3)
{
  id v6 = [sub_A28EC() init];
  id v7 = v6;
  if (a2)
  {
    id v8 = (void *)String.toINSpeakableString.getter(a1);
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    id v8 = 0LL;
  }

  sub_A2904(v6, "setLabel:");

  CreateTimerIntent.duration.setter(v9, a3);
  [v6 setType:1];
  sub_A28E4(v6, "setTargetingInfo:");

  sub_A2998();
}

void sub_A2274(uint64_t a1)
{
  id v3 = [sub_A28EC() init];
  sub_A2974();
  sub_97990();
  id v5 = v4;
  sub_5F80C(v1, "setLabel:");

  sub_97A78();
  sub_A2980();
  sub_988CC();
  id v7 = sub_8AF88(v6, "setType:");
  sub_A28D8((uint64_t)v7, "setTargetingInfo:");

  sub_1E6E4(a1);
  sub_17B78();
}

void sub_A2304(uint64_t a1)
{
  id v3 = [sub_A28EC() init];
  sub_A2974();
  id v4 = sub_963E0();
  sub_5F80C(v1, "setTargetTimer:");

  sub_A28D8(v5, "setTargetingInfo:");
  sub_1E6E4(a1);
  sub_17B78();
}

void sub_A2370()
{
  char v1 = sub_A29EC();
  id v2 = (void *)Bool.number.getter(v1 & 1);
  sub_A20B8(v0, v2);
  sub_A295C();
  sub_17B78();
}

void sub_A23B4()
{
  char v1 = sub_A29EC();
  id v2 = (void *)Bool.number.getter(v1 & 1);
  sub_A204C(v0, v2);
  sub_A295C();
  sub_17B78();
}

void sub_A23F4()
{
  id v0 = sub_A28F4();
  sub_982CC();
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_979AC();
  sub_A1FC4(v0, isa, v2);
  sub_A295C();
  sub_37FA0();
}

id sub_A2448(uint64_t a1)
{
  id v2 = v1;
  id v4 = [objc_allocWithZone(v2) init];
  sub_97990();
  NSString v6 = v5;
  if (v5)
  {
    id v7 = [v5 spokenPhrase];

    static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    uint64_t v9 = v8;

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  sub_A2904(v4, "setLabel:");

  sub_97A78();
  id v10 = sub_A2A1C(objc_allocWithZone(&OBJC_CLASS___NSNumber), "initWithDouble:");
  sub_A2904(v4, "setDuration:");

  sub_A28E4(v4, "setState:");
  if (qword_FB2F0 != -1) {
    swift_once(&qword_FB2F0, sub_96F94);
  }
  uint64_t v11 = qword_101140;
  uint64_t v12 = type metadata accessor for TimerNLv3Intent(0LL);
  unint64_t v13 = sub_A25DC();
  IntentNodeTraversable.value<A>(forNode:)(v11, v12, v13);
  if (v16) {
    uint64_t v14 = 1LL;
  }
  else {
    uint64_t v14 = 2LL;
  }
  [v4 setType:v14];

  sub_1E6E4(a1);
  return v4;
}

unint64_t sub_A25DC()
{
  unint64_t result = qword_FD600;
  if (!qword_FD600)
  {
    uint64_t v1 = type metadata accessor for TimerNLv3Intent(255LL);
    unint64_t result = swift_getWitnessTable(&unk_C54B0, v1);
    atomic_store(result, (unint64_t *)&qword_FD600);
  }

  return result;
}

uint64_t sub_A261C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_1001D8);
  sub_5474(v0, (uint64_t)qword_1001D8);
  return static SiriTimeLog.timerFlow.getter();
}

void sub_A2664()
{
  if ((UsoEntity_common_Alarm.eligibleForTimerReformation.getter() & 1) != 0
    && (uint64_t v1 = (void *)UsoEntity_common_Alarm.relativeOffsetInMinutes.getter()) != 0LL
    && (id v2 = v1,
        [v1 doubleValue],
        double v4 = v3,
        v2,
        [(id)objc_opt_self(SiriTimeTimerConstants) minimumDuration],
        v5 < v4))
  {
    id v6 = [sub_A29B0() init];
    sub_A2974();
    uint64_t v7 = dispatch thunk of UsoEntity_common_Alarm.name.getter();
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = (void *)String.toINSpeakableString.getter(v7);
      swift_bridgeObjectRelease(v9);
    }

    else
    {
      id v10 = 0LL;
    }

    sub_5F80C(v0, "setLabel:");

    uint64_t v16 = sub_A2980();
    id v17 = sub_A2968(v16, "setType:");
    sub_A28D8((uint64_t)v17, "setTargetingInfo:");

    sub_2B750();
  }

  else
  {
    if (qword_FB348 != -1) {
      swift_once(&qword_FB348, sub_A261C);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_5474(v11, (uint64_t)qword_1001D8);
    unint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)sub_1B9DC();
      *(_WORD *)id v15 = 0;
      _os_log_impl( &dword_0,  v13,  v14,  "Timer domain received an alarm entity that it cannot handle. Rejecting parse.",  v15,  2u);
      sub_1B904((uint64_t)v15);
    }

    sub_2B750();
  }

  sub_A2998();
}

void sub_A27FC(void *a1, void *a2)
{
  id v4 = [sub_A28EC() init];
  sub_1E6A8();
  id v5 = v4;
  Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
  sub_5F80C(a1, "setShouldMatchAny:");

  sub_A2A24(v7, "setTargetTimer:");
  sub_A2904(v5, "setToTimer:");

  sub_37FA0();
}

uint64_t sub_A2898(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_FCD20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

id sub_A28D8(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, 0);
}

id sub_A28E4(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

id sub_A28EC()
{
  return objc_allocWithZone(v0);
}

id sub_A28F4()
{
  return sub_963E0();
}

id sub_A2904(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_A290C(uint64_t a1)
{
  return SiriRemoteTimerTarget.__allocating_init(deviceNames:deviceReferenceNames:)(v1, a1);
}

uint64_t sub_A291C()
{
  return type metadata accessor for SiriRemoteTimerTarget(0LL);
}

uint64_t sub_A2924(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v4 = va_arg(va1, void);
  return swift_dynamicCast((uint64_t *)va, va1, v2 + 8, a1, 6LL);
}

void sub_A293C()
{
}

id sub_A2948()
{
  return objc_msgSend(v2, v1, v0);
}

uint64_t sub_A295C()
{
  return sub_1E6E4(v0);
}

id sub_A2968(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, 1);
}

  ;
}

uint64_t sub_A2980()
{
  return CreateTimerIntent.duration.setter();
}

  ;
}

  ;
}

void sub_A29A8()
{
}

id sub_A29B0()
{
  return objc_allocWithZone(v0);
}

uint64_t sub_A29B8(uint64_t a1)
{
  return SiriRemoteTimerTarget.__allocating_init(deviceNames:deviceReferenceNames:)(v1, a1);
}

void sub_A29C8()
{
}

uint64_t sub_A29D4(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  return sub_F078((uint64_t)va1, (uint64_t)va);
}

void sub_A29E0()
{
}

uint64_t sub_A29EC()
{
  return sub_968F4();
}

id sub_A29F8()
{
  return sub_B65BC(v0);
}

id sub_A2A04()
{
  return sub_B65BC(v0);
}

void *sub_A2A10(uint64_t a1, uint64_t a2, ...)
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceTarget.target.getter((uint64_t *)va);
}

id sub_A2A1C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

id sub_A2A24(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t type metadata accessor for PauseTimerCATsSimple(uint64_t a1)
{
  uint64_t result = qword_1001F0;
  if (!qword_1001F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PauseTimerCATsSimple);
  }
  return result;
}

uint64_t sub_A2A68(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_101180);
}

uint64_t sub_A2AA4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return swift_task_switch(sub_A2ABC, 0LL, 0LL);
}

uint64_t sub_A2ABC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_67C4(&qword_FBE20);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  v0[4] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_C2640;
  strcpy((char *)(v3 + 32), "pausedTimers");
  *(_BYTE *)(v3 + 45) = 0;
  *(_WORD *)(v3 + 46) = -5120;
  *(void *)(v3 + 72) = sub_67C4(&qword_FBE28);
  *(void *)(v3 + 48) = v1;
  uint64_t v4 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  swift_bridgeObjectRetain(v1);
  uint64_t v5 = (void *)swift_task_alloc(v4);
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1BEEC;
  return v7(0xD000000000000020LL, 0x80000000000C9B80LL, v3);
}

uint64_t sub_A2BAC()
{
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C020;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v3)( 0xD000000000000020LL,  0x80000000000C9B50LL,  _swiftEmptyArrayStorage);
}

uint64_t sub_A2C24()
{
  return type metadata accessor for PauseTimerCATsSimple(0LL);
}

ValueMetadata *type metadata accessor for UnsupportedCreateSleepTimerFlow()
{
  return &type metadata for UnsupportedCreateSleepTimerFlow;
}

uint64_t sub_A2C3C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100250);
  sub_5474(v0, (uint64_t)qword_100250);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_A2C84()
{
  uint64_t v0 = type metadata accessor for SiriTimeEventSender.TaskType(0LL);
  sub_1B53C(v0, qword_101190);
  uint64_t v1 = sub_5474(v0, (uint64_t)qword_101190);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  enum case for SiriTimeEventSender.TaskType.createTimerIntent(_:),  v0);
}

uint64_t sub_A2CDC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_46148();
  return Flow.deferToExecuteAsync(_:)(a1, a2, &type metadata for UnsupportedCreateSleepTimerFlow, v4);
}

uint64_t sub_A2D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  uint64_t v4 = type metadata accessor for TemplatingResult(0LL);
  v3[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[8] = v5;
  void v3[9] = sub_1B6C8(v5);
  uint64_t v6 = type metadata accessor for NLContextUpdate(0LL);
  v3[10] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[11] = v7;
  v3[12] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for Logger(0LL);
  v3[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[14] = v9;
  v3[15] = sub_1B6C8(v9);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[16] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[17] = v11;
  v3[18] = sub_1B6C8(v11);
  uint64_t v12 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[19] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[20] = v13;
  v3[21] = sub_1B6C8(v13);
  uint64_t v14 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v3[22] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[23] = v15;
  v3[24] = sub_1B6C8(v15);
  uint64_t v16 = type metadata accessor for DialogPhase(0LL);
  v3[25] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v3[26] = v17;
  v3[27] = sub_1B6C8(v17);
  uint64_t v18 = sub_67C4(&qword_FBFC8);
  v3[28] = sub_1B6C8(*(void *)(v18 - 8));
  uint64_t v19 = sub_67C4(&qword_FBFD0);
  v3[29] = sub_1B6C8(*(void *)(v19 - 8));
  uint64_t v20 = sub_67C4(&qword_FBFD8);
  v3[30] = sub_1B6C8(*(void *)(v20 - 8));
  uint64_t v21 = type metadata accessor for ActivityType(0LL);
  v3[31] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v3[32] = v22;
  v3[33] = sub_1B6C8(v22);
  sub_1B9B8();
  return swift_task_switch(v23, v24, v25);
}

uint64_t sub_A2E90()
{
  if (qword_FB350 != -1) {
    swift_once(&qword_FB350, sub_A2C3C);
  }
  uint64_t v1 = sub_5474(v0[13], (uint64_t)qword_100250);
  v0[34] = v1;
  uint64_t v29 = v1;
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_1BA1C(2LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "In UnsupportedCreateSleepTimerFlow execute()", v4, 2u);
    sub_1B904((uint64_t)v4);
  }

  uint64_t v6 = v0[32];
  uint64_t v5 = v0[33];
  uint64_t v7 = v0[31];

  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, enum case for ActivityType.failed(_:), v7);
  if (qword_FB358 != -1) {
    swift_once(&qword_FB358, sub_A2C84);
  }
  uint64_t v9 = v0[32];
  uint64_t v8 = v0[33];
  uint64_t v10 = v0[30];
  uint64_t v12 = v0[28];
  uint64_t v11 = v0[29];
  uint64_t v30 = v0[31];
  uint64_t v13 = v0[24];
  uint64_t v31 = v0[23];
  uint64_t v32 = v0[22];
  uint64_t v14 = type metadata accessor for SiriTimeEventSender.TaskType(0LL);
  uint64_t v15 = sub_5474(v14, (uint64_t)qword_101190);
  uint64_t v16 = type metadata accessor for SiriKitReliabilityCodes(0LL);
  sub_A3960(v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104LL));
  sub_1BC80(v10);
  uint64_t v17 = type metadata accessor for SiriTimeEventSender.Attribute(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v11, 1LL, 1LL, v17);
  uint64_t v18 = type metadata accessor for SiriTimeEventSender.ReasonDescription(0LL);
  sub_A3960(v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104LL));
  sub_1BC80(v12);
  static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v8, v15, v10, v11, v12);
  sub_DABC(v12, &qword_FBFC8);
  sub_DABC(v11, &qword_FBFD0);
  sub_DABC(v10, &qword_FBFD8);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v30);
  uint64_t v20 = static DialogPhase.completion.getter(v19);
  static SiriTimeFeatureFlagsImpl.instance.getter(v20);
  LOBYTE(v15) = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v13, v32);
  if ((v15 & 1) != 0)
  {
    uint64_t v21 = v0[18];
    uint64_t v22 = v0[15];
    uint64_t v23 = v0[13];
    uint64_t v24 = v0[14];
    (*(void (**)(uint64_t, void, uint64_t))(v0[17] + 104))( v21,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[16]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v29, v23);
    uint64_t v25 = mach_absolute_time();
    SiriTimeMeasurement.init(_:log:startTime:)(v21, v22, v25);
    uint64_t v26 = (uint64_t **)swift_task_alloc(dword_FC764);
    v0[35] = (uint64_t)v26;
    *uint64_t v26 = v0;
    v26[1] = (uint64_t *)sub_A31C0;
    return sub_36528();
  }

  else
  {
    id v28 = (uint64_t **)swift_task_alloc(dword_FCF44);
    v0[39] = (uint64_t)v28;
    *id v28 = v0;
    v28[1] = (uint64_t *)sub_A3374;
    return sub_46658(v0[9]);
  }

uint64_t sub_A31C0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 288) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v4 + 296) = a1;
  }
  sub_1B9B8();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_A3230(uint64_t a1)
{
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)[1]);
  v1[38] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_A3298;
  return PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)(v1[4], v1[27], v1[12], v1[21]);
}

uint64_t sub_A3298()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 296LL);
  uint64_t v2 = *(void *)(*(void *)v0 + 88LL);
  swift_task_dealloc();

  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_1B9B8();
  return sub_2B44C();
}

uint64_t sub_A3300()
{
  uint64_t v1 = *(void *)(v0 + 208);
  sub_A3950();
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_A38CC();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  swift_task_dealloc();
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A3374()
{
  uint64_t v2 = *v1;
  v2[40] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    uint64_t v4 = (uint64_t **)swift_task_alloc(dword_FC6A4);
    v2[41] = (uint64_t)v4;
    *uint64_t v4 = v2;
    v4[1] = (uint64_t *)sub_A3408;
    return sub_33930(v2[4], 0, v2[27]);
  }

uint64_t sub_A3408()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 64LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 72LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 56LL);
  *(void *)(*(void *)v1 + 336LL) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_1B9B8();
  return sub_2B44C();
}

uint64_t sub_A3484()
{
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

#error "A35E8: call analysis failed (funcsize=62)"
#error "A36E8: call analysis failed (funcsize=61)"
#error "A37E8: call analysis failed (funcsize=61)"
uint64_t sub_A37F8(uint64_t a1, uint64_t a2)
{
  return sub_A2CDC(a1, a2);
}

uint64_t sub_A3800(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc(dword_10027C);
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1B0B4;
  return sub_A2D30(a1, v5, v4);
}

uint64_t sub_A3864()
{
  return swift_task_dealloc(*(void *)(v0 + 264));
}

uint64_t sub_A3890(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 + 16) = v1;
  return swift_errorRetain(v1);
}

uint64_t sub_A38B0(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v3, v2);
}

uint64_t sub_A38CC()
{
  return swift_task_dealloc(*(void *)(v0 + 264));
}

uint64_t sub_A38F8()
{
  return swift_slowAlloc(32LL, -1LL);
}

uint64_t sub_A3908()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_A3918()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_A3928()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_A3938(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  return sub_683C(a1, a2, (uint64_t *)va);
}

uint64_t sub_A3944()
{
  return String.init<A>(describing:)(v0);
}

uint64_t sub_A3950()
{
  return (*(uint64_t (**)(void, void))(v0[20] + 8LL))(v0[21], v0[19]);
}

uint64_t sub_A3960@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2, v3);
}

uint64_t type metadata accessor for PauseTimerCATs_Async(uint64_t a1)
{
  uint64_t result = qword_100280;
  if (!qword_100280) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PauseTimerCATs_Async);
  }
  return result;
}

uint64_t sub_A39A4(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_1011A8);
}

uint64_t sub_A39E0(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch(sub_A39FC, 0LL, 0LL);
}

uint64_t sub_A39FC()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_67C4(&qword_FBE20);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_C2640;
  strcpy((char *)(v3 + 32), "speakableTimer");
  *(_BYTE *)(v3 + 47) = -18;
  uint64_t v4 = 0LL;
  if (v1)
  {
    uint64_t v4 = type metadata accessor for TimerTimer(0LL);
  }

  else
  {
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
  }

  *(void *)(v3 + 48) = v1;
  *(void *)(v3 + 72) = v4;
  uint64_t v5 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:) + 1);
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc(v5);
  v0[6] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1EAC0;
  return ((uint64_t (*)(void, unint64_t, unint64_t, uint64_t))v8)( v0[2],  0xD00000000000001DLL,  0x80000000000C9C20LL,  v3);
}

uint64_t sub_A3B04(uint64_t a1)
{
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1E95C;
  return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))v5)( a1,  0xD000000000000023LL,  0x80000000000C9BF0LL,  _swiftEmptyArrayStorage);
}

uint64_t sub_A3B8C()
{
  return type metadata accessor for PauseTimerCATs_Async(0LL);
}

uint64_t sub_A3B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PluginAction(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (*(void *)(a1 + 16)
    && (unint64_t v8 = sub_D224(0xD00000000000001CLL, 0x80000000000C9C40LL), (v9 & 1) != 0)
    && (sub_6A5C(*(void *)(a1 + 56) + 32 * v8, (uint64_t)v21),
        (swift_dynamicCast(&v19, v21, (char *)&type metadata for Any + 8, &type metadata for Data, 6LL) & 1) != 0))
  {
    uint64_t v11 = v19;
    unint64_t v10 = v20;
    sub_21418(v19, v20);
    PluginAction.init(data:)(v11, v10);
    if (qword_FB360 != -1) {
      swift_once(&qword_FB360, sub_A3E18);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    uint64_t v13 = sub_5474(v12, (uint64_t)qword_1002E0);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)sub_1B9DC() = 0;
      sub_A3E7C(&dword_0, v14, v15, "Followup PluginAction available.");
      sub_A3E6C();

      sub_A3E60();
    }

    else
    {
      sub_A3E60();
    }

    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    uint64_t v16 = 0LL;
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a2, v16, 1LL, v4);
}

uint64_t sub_A3E18()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_1002E0);
  sub_5474(v0, (uint64_t)qword_1002E0);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_A3E60()
{
  return sub_21470(v1, v0);
}

uint64_t sub_A3E6C()
{
  return swift_slowDealloc(v0, -1LL, -1LL);
}

void sub_A3E7C(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

void *sub_A3E88(uint64_t a1)
{
  return sub_930C0(a1);
}

uint64_t sub_A3E9C(void *a1, uint64_t a2)
{
  *a1 = sub_A3E88(a2);
  return sub_46908(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_A3EFC()
{
  unint64_t result = qword_100300;
  if (!qword_100300)
  {
    uint64_t v1 = sub_15D30(&qword_FFBF8);
    unint64_t result = swift_getWitnessTable(&unk_C5218, v1);
    atomic_store(result, (unint64_t *)&qword_100300);
  }

  return result;
}

unint64_t sub_A3F40()
{
  unint64_t result = qword_100308;
  if (!qword_100308)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5D1C, &_s18NeedsValueStrategyVN);
    atomic_store(result, (unint64_t *)&qword_100308);
  }

  return result;
}

unint64_t sub_A3F7C()
{
  unint64_t result = qword_100310;
  if (!qword_100310)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5E94, &_s25NeedsConfirmationStrategyVN_2);
    atomic_store(result, (unint64_t *)&qword_100310);
  }

  return result;
}

unint64_t sub_A3FB8()
{
  unint64_t result = qword_100318;
  if (!qword_100318)
  {
    unint64_t result = swift_getWitnessTable(&unk_C4ACC, &_s24UnsupportedValueStrategyVN);
    atomic_store(result, (unint64_t *)&qword_100318);
  }

  return result;
}

unint64_t sub_A3FF4()
{
  unint64_t result = qword_100320;
  if (!qword_100320)
  {
    unint64_t result = swift_getWitnessTable(&unk_C2B08, &_s20HandleIntentStrategyVN_1);
    atomic_store(result, (unint64_t *)&qword_100320);
  }

  return result;
}

void *sub_A4030(void *a1)
{
  return a1;
}

void *sub_A4064(void *a1)
{
  return a1;
}

void *sub_A4098(void *a1)
{
  return a1;
}

void *sub_A40CC(void *a1)
{
  return a1;
}

uint64_t sub_A4100(void *a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v3 = _s20HandleIntentStrategyVMa_6(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = _s21ConfirmIntentStrategyVMa(0LL);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DismissTimerIntent(0LL);
  uint64_t v10 = type metadata accessor for DismissTimerIntentResponse(0LL);
  RCHChildFlowProducersAsync.init()(v9, v10);
  if (qword_FB228 != -1) {
    swift_once(&qword_FB228, sub_66804);
  }
  uint64_t v11 = static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)(qword_100FB0, v9, v10);
  uint64_t v13 = v12;
  uint64_t v14 = sub_67C4(&qword_FCEA0);
  RCHChildFlowProducersAsync.appResolutionFlowProducer.setter(v11, v13, v14);
  sub_54CC((uint64_t)a1, (uint64_t)v8);
  os_log_type_t v15 = &v8[*(int *)(v6 + 20)];
  uint64_t v16 = type metadata accessor for HALTimerDeviceContext(0LL);
  uint64_t v28 = *(void *)(v16 - 8);
  uint64_t v17 = (uint64_t)v15;
  uint64_t v18 = v29;
  sub_A44A0(v17);
  uint64_t v19 = sub_E538(&qword_100328, _s21ConfirmIntentStrategyVMa, (uint64_t)&unk_C4DA0);
  uint64_t v20 = static RCHChildFlowFactoryHelper.makeConditionalConfirmIntentFlowProducer<A>(strategy:_:)( v8,  sub_A4388,  0LL,  v6,  v19);
  RCHChildFlowProducersAsync.confirmIntentFlowProducer.setter(v20);
  sub_54CC((uint64_t)a1, (uint64_t)v5);
  sub_A44A0((uint64_t)&v5[*(int *)(v3 + 20)]);
  uint64_t v21 = sub_E538(&qword_100330, _s20HandleIntentStrategyVMa_6, (uint64_t)&unk_C6400);
  uint64_t v22 = static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)(v5, v3, v21);
  RCHChildFlowProducersAsync.handleIntentFlowProducer.setter(v22);
  sub_54CC((uint64_t)a1, (uint64_t)v30);
  uint64_t v23 = sub_67C4(&qword_100338);
  unint64_t v24 = sub_A43E0();
  uint64_t v25 = static RCHChildFlowFactoryHelper.makeUnsupportedValueAndCancelFlowProducer<A>(strategy:)(v30, v23, v24);
  RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter(v25);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v18, v16);
  _s20HandleIntentStrategyVwxx_0(a1);
  sub_A4424((uint64_t)v30);
  sub_A4464((uint64_t)v5, _s20HandleIntentStrategyVMa_6);
  return sub_A4464((uint64_t)v8, _s21ConfirmIntentStrategyVMa);
}

BOOL sub_A4388()
{
  uint64_t v0 = sub_67C4(&qword_FF850);
  uint64_t v1 = (void *)IntentResolutionRecord.intentResponse.getter(v0);
  uint64_t v2 = dispatch thunk of DismissTimerIntentResponse.code.getter();

  uint64_t v3 = DismissTimerIntentResponseCode.rawValue.getter(v2);
  return v3 == DismissTimerIntentResponseCode.rawValue.getter(3LL);
}

unint64_t sub_A43E0()
{
  unint64_t result = qword_100340;
  if (!qword_100340)
  {
    uint64_t v1 = sub_15D30(&qword_100338);
    unint64_t result = swift_getWitnessTable(&unk_C3728, v1);
    atomic_store(result, (unint64_t *)&qword_100340);
  }

  return result;
}

uint64_t sub_A4424(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_100338);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_A4464(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_A44A0(uint64_t a1)
{
  return v1(a1, v2, v3);
}

void *sub_A44AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  __chkstk_darwin();
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = type metadata accessor for UUID(0LL);
  uint64_t v39 = *(void *)(v40 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v11; uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v32))
  {
    uint64_t v34 = v3;
    uint64_t v35 = a1;
    unint64_t v36 = a1 & 0xC000000000000001LL;
    uint64_t v12 = 4LL;
    while (1)
    {
      uint64_t v3 = v12 - 4;
      id v13 = v36 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12 - 4, a1) : *(id *)(a1 + 8 * v12);
      uint64_t v14 = v13;
      uint64_t v15 = v12 - 3;
      if (__OFADD__(v3, 1LL)) {
        break;
      }
      uint64_t v16 = v11;
      id v17 = [v13 timerID];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v18 = UUID.uuidString.getter();
      uint64_t v20 = v19;
      (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v40);
      uint64_t v21 = *(void *)(a2 + 88);
      if (v21)
      {
        uint64_t v22 = *(void *)(a2 + 80);
        BOOL v23 = v18 == v22 && v21 == v20;
        if (v23)
        {
LABEL_27:
          swift_release(a2);
          swift_bridgeObjectRelease(v35);
LABEL_29:
          swift_bridgeObjectRelease(v20);
          return v14;
        }

        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v22, v21, 0LL);
        swift_bridgeObjectRelease(v20);
        if ((v24 & 1) != 0) {
          goto LABEL_28;
        }
      }

      else
      {
        swift_bridgeObjectRelease(v20);
      }

      id v25 = objc_msgSend(v14, "timerURL", v34);
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v26 = URL.absoluteString.getter();
      uint64_t v20 = v27;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v38);
      uint64_t v28 = *(void *)(a2 + 88);
      if (v28)
      {
        uint64_t v29 = *(void *)(a2 + 80);
        if (v26 == v29 && v28 == v20) {
          goto LABEL_27;
        }
        char v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v20, v29, v28, 0LL);
        swift_bridgeObjectRelease(v20);
        if ((v31 & 1) != 0)
        {
LABEL_28:
          swift_release(a2);
          uint64_t v20 = v35;
          goto LABEL_29;
        }
      }

      else
      {

        swift_bridgeObjectRelease(v20);
      }

      ++v12;
      uint64_t v11 = v16;
      BOOL v23 = v15 == v16;
      a1 = v35;
      if (v23) {
        goto LABEL_35;
      }
    }

    __break(1u);
LABEL_31:
    if (a1 < 0) {
      uint64_t v32 = a1;
    }
    else {
      uint64_t v32 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

LABEL_35:
  swift_release(a2);
  swift_bridgeObjectRelease(a1);
  return 0LL;
}

void *UndoCreateTimerFlow.__allocating_init()()
{
  uint64_t v0 = type metadata accessor for SiriTimerManagerImpl(0LL);
  sub_2B838(v0);
  SiriTimerManagerImpl.init()();
  [objc_allocWithZone(MTTimerManager) init];
  uint64_t TimerFlow = type metadata accessor for UndoCreateTimerFlow(0LL);
  sub_2B838(TimerFlow);
  uint64_t v2 = sub_17D30();
  return sub_A882C(v2, v3, v4);
}

uint64_t type metadata accessor for UndoCreateTimerFlow(uint64_t a1)
{
  uint64_t result = qword_1003C0;
  if (!qword_1003C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UndoCreateTimerFlow);
  }
  return result;
}

id sub_A4828()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SiriTimer(0LL);
  id v7 = [v1 timerID];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v9 = UUID.uuidString.getter(v8);
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  id v13 = sub_A87A0(v9, v11);
  objc_msgSend(v13, "setType:", INTimerType.toTimerType()(objc_msgSend(v1, "type")));
  unint64_t v14 = (unint64_t)[v1 state];
  uint64_t v15 = 0LL;
  if (v14 <= 4) {
    uint64_t v15 = qword_C60D0[v14];
  }
  [v13 setState:v15];
  [v1 duration];
  id v17 = [objc_allocWithZone(NSNumber) initWithDouble:v16];
  [v13 setDuration:v17];

  [v1 remainingTime];
  id v19 = [objc_allocWithZone(NSNumber) initWithDouble:v18];
  [v13 setRemainingTime:v19];

  id v20 = [v1 title];
  [v13 setLabel:v20];

  return v13;
}

id sub_A4A40()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v2);
  sub_1C308();
  uint64_t v3 = type metadata accessor for SiriTimer(0LL);
  id v4 = sub_5A468(v3, "timerID");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v6 = UUID.uuidString.getter(v5);
  uint64_t v8 = v7;
  uint64_t v9 = sub_5A434();
  v10(v9);
  id v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  id v12 = sub_A87A0(v6, v8);
  id v13 = sub_5A468((uint64_t)v12, "type");
  id v14 = [v12 setType:INTimerType.toTimerType()(v13)];
  unint64_t v15 = (unint64_t)sub_5A468((uint64_t)v14, "state");
  uint64_t v16 = 0LL;
  if (v15 <= 4) {
    uint64_t v16 = qword_C60D0[v15];
  }
  [v12 setState:v16];
  [v1 duration];
  id v17 = sub_A90A8(objc_allocWithZone(&OBJC_CLASS___NSNumber));
  sub_5A600((uint64_t)v17, "setDuration:");

  [v1 remainingTime];
  id v18 = sub_A90A8(objc_allocWithZone(&OBJC_CLASS___NSNumber));
  sub_5A600((uint64_t)v18, "setRemainingTime:");

  id v20 = sub_5A468(v19, "title");
  [v12 setLabel:v20];

  return v12;
}

uint64_t sub_A4C1C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100348);
  sub_5474(v0, (uint64_t)qword_100348);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_A4C64(uint64_t a1)
{
  return sub_4DED8( a1,  (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.TaskType,  qword_1011B8,  &enum case for SiriTimeEventSender.TaskType.undoCreateTimer(_:));
}

uint64_t sub_A4C80(uint64_t a1)
{
  return sub_4DED8( a1,  (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.Attribute,  qword_1011D0,  &enum case for SiriTimeEventSender.Attribute.corrections(_:));
}

uint64_t UndoCreateTimerFlow.on(input:)()
{
  uint64_t v0 = sub_67C4(&qword_FD740);
  __chkstk_darwin(v0);
  sub_17D14();
  uint64_t v80 = v1;
  uint64_t v2 = type metadata accessor for DirectInvocationUtils.Timer.URI(0LL);
  uint64_t v83 = *(void *)(v2 - 8);
  uint64_t v84 = v2;
  __chkstk_darwin(v2);
  sub_17D14();
  uint64_t v82 = v3;
  uint64_t v4 = type metadata accessor for DirectInvocationUtils.Timer.UserInfoKey(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v85 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v76 - v8;
  uint64_t v10 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_1C308();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for Parse(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  sub_1C308();
  uint64_t v19 = v18 - v17;
  Input.parse.getter(v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v19, v15) != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v15);
    return 0LL;
  }

  (*(void (**)(uint64_t, uint64_t))(v16 + 96))(v19, v15);
  uint64_t v21 = sub_A90D4(v14, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  uint64_t v22 = Parse.DirectInvocation.userData.getter(v21);
  uint64_t v23 = v10;
  uint64_t v24 = v14;
  if (!v22)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
    return 0LL;
  }

  uint64_t v25 = v22;
  uint64_t v79 = v24;
  uint64_t v26 = v11;
  uint64_t v27 = *(uint64_t (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v28 = v27(v9, enum case for DirectInvocationUtils.Timer.UserInfoKey.verb(_:), v4);
  DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v28);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
  v29(v9, v4);
  uint64_t v30 = sub_5A434();
  sub_1C318(v30, v31, v25, v32);
  uint64_t v33 = sub_1BC04();
  if (!v89)
  {
    sub_17CD0();
    sub_8CC4((uint64_t)v88, &qword_FCD20);
LABEL_12:
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v79, v23);
    return 0LL;
  }

  if ((sub_A901C(v33, v34, v35, (uint64_t)&type metadata for String) & 1) == 0)
  {
    sub_17CD0();
    goto LABEL_12;
  }

  int v36 = sub_7E238(v86, (uint64_t)v87);
  if (v36 == 19)
  {
    sub_A9010(*(uint64_t (**)(void, uint64_t))(v11 + 8));
    uint64_t v37 = v25;
LABEL_7:
    swift_bridgeObjectRelease(v37);
    return 0LL;
  }

  int v78 = v36;
  uint64_t v39 = v85;
  uint64_t v40 = v27(v85, enum case for DirectInvocationUtils.Timer.UserInfoKey.timerId(_:), v4);
  DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v40);
  uint64_t v42 = v41;
  v29(v39, v4);
  uint64_t v43 = sub_17D30();
  sub_1C318(v43, v44, v25, v45);
  uint64_t v46 = swift_bridgeObjectRelease(v42);
  if (!v89)
  {
    sub_17CD0();
    sub_8CC4((uint64_t)v88, &qword_FCD20);
    uint64_t v50 = v26;
LABEL_24:
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v79, v23);
    return 0LL;
  }

  uint64_t v49 = sub_A901C(v46, v47, v48, (uint64_t)&type metadata for String);
  uint64_t v50 = v26;
  if ((v49 & 1) == 0)
  {
    sub_17CD0();
    goto LABEL_24;
  }

  uint64_t v51 = v25;
  uint64_t v77 = v86;
  uint64_t v85 = v87;
  uint64_t v52 = Parse.DirectInvocation.identifier.getter(v49);
  uint64_t v54 = v53;
  uint64_t v55 = v82;
  uint64_t v56 = v83;
  uint64_t v57 = v84;
  uint64_t v58 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v83 + 104))( v82,  enum case for DirectInvocationUtils.Timer.URI.undo(_:),  v84);
  uint64_t v59 = DirectInvocationUtils.Timer.URI.rawValue.getter(v58);
  uint64_t v61 = v60;
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  if (v52 == v59 && v54 == v61)
  {
    swift_bridgeObjectRelease_n(v54, 2LL);
  }

  else
  {
    uint64_t v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v52, v54, v59, v61, 0LL);
    swift_bridgeObjectRelease(v61);
    sub_2B7C4();
    if ((v52 & 1) == 0) {
      goto LABEL_31;
    }
  }

  uint64_t v63 = sub_7010(v78);
  if (v63 == 0x6574656C6564LL && v64 == 0xE600000000000000LL)
  {
    sub_2B7C4();
  }

  else
  {
    char v66 = _stringCompareWithSmolCheck(_:_:expecting:)(v63, v64, 0x6574656C6564LL, 0xE600000000000000LL, 0LL);
    sub_2B7C4();
    if ((v66 & 1) == 0)
    {
LABEL_31:
      sub_A9010(*(uint64_t (**)(void, uint64_t))(v50 + 8));
      swift_bridgeObjectRelease(v85);
      uint64_t v37 = v51;
      goto LABEL_7;
    }
  }

  if (qword_FB368 != -1) {
    swift_once(&qword_FB368, sub_A4C1C);
  }
  uint64_t v67 = sub_1BD34();
  sub_5474(v67, (uint64_t)qword_100348);
  uint64_t v68 = (os_log_s *)sub_1BD20();
  os_log_type_t v69 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (_WORD *)sub_1B9DC();
    sub_2BA04(v70);
    sub_1BBEC(&dword_0, v68, v69, "UndoCreateTimerFlow: accepting input.", (uint8_t *)v52);
    sub_1B904(v52);
  }

  uint64_t v71 = v81;
  uint64_t v72 = *(void *)(v81 + 88);
  unint64_t v73 = v85;
  *(void *)(v81 + 80) = v77;
  *(void *)(v71 + 88) = v73;
  swift_bridgeObjectRelease(v72);
  uint64_t v74 = v80;
  sub_A3B94(v51, v80);
  swift_bridgeObjectRelease(v51);
  sub_A9010(*(uint64_t (**)(void, uint64_t))(v50 + 8));
  uint64_t v75 = v71 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin19UndoCreateTimerFlow_followupPluginAction;
  swift_beginAccess(v75, v88, 33LL, 0LL);
  sub_A8934(v74, v75);
  swift_endAccess(v88);
  return 1LL;
}

uint64_t UndoCreateTimerFlow.execute(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t TimerFlow = type metadata accessor for UndoCreateTimerFlow(0LL);
  sub_11718( &qword_FD428,  type metadata accessor for UndoCreateTimerFlow,  (uint64_t)&protocol conformance descriptor for UndoCreateTimerFlow);
  return Flow.deferToExecuteAsync(_:)(a1, a2, TimerFlow, v5);
}

uint64_t UndoCreateTimerFlow.execute()(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_67C4(&qword_FD740);
  v2[16] = sub_1B6C8(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for PluginAction(0LL);
  v2[17] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[18] = v5;
  v2[19] = sub_1B6C8(v5);
  uint64_t v6 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[21] = v7;
  v2[22] = sub_1B6C8(v7);
  uint64_t v8 = sub_5A13C();
  v2[23] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[24] = v9;
  v2[25] = sub_1B6C8(v9);
  uint64_t v10 = sub_67C4(&qword_FBFC8);
  v2[26] = sub_1B6C8(*(void *)(v10 - 8));
  uint64_t v11 = sub_67C4(&qword_FBFD0);
  v2[27] = sub_1B6C8(*(void *)(v11 - 8));
  uint64_t v12 = sub_67C4(&qword_FBFD8);
  v2[28] = sub_1B6C8(*(void *)(v12 - 8));
  uint64_t v13 = sub_A9080();
  v2[29] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[30] = v14;
  v2[31] = sub_1B6C8(v14);
  uint64_t v15 = sub_A9078();
  v2[32] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[33] = v16;
  v2[34] = sub_1B6C8(v16);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A537C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  uint64_t v95 = v36;
  uint64_t v37 = sub_A9000(*(void *)(v34 + 264));
  if (qword_FB370 != -1) {
    uint64_t v37 = swift_once(&qword_FB370, sub_A4C64);
  }
  uint64_t v38 = *(void *)(v34 + 224);
  sub_A8D3C(v37, (uint64_t)qword_1011B8);
  uint64_t v39 = sub_A8F44();
  sub_44FF8(v38, v40, v41, v39);
  if (qword_FB378 != -1) {
    swift_once(&qword_FB378, sub_A4C80);
  }
  uint64_t v42 = *(void **)(v34 + 272);
  uint64_t v43 = *(void *)(v34 + 248);
  uint64_t v93 = *(void *)(v34 + 264);
  uint64_t v94 = *(void *)(v34 + 256);
  uint64_t v44 = *(void *)(v34 + 240);
  uint64_t v46 = *(void *)(v34 + 216);
  uint64_t v45 = *(void *)(v34 + 224);
  uint64_t v47 = *(void *)(v34 + 208);
  uint64_t v48 = *(void *)(v34 + 184);
  uint64_t v92 = *(void *)(v34 + 120);
  uint64_t v49 = sub_A8F4C();
  uint64_t v50 = sub_5474(v49, (uint64_t)qword_1011D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16LL))(v46, v50, v49);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v46, 0LL, 1LL, v49);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v47, 1LL, 1LL, v48);
  uint64_t v51 = sub_5A434();
  uint64_t v53 = static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)( v51,  v52,  v45,  v46,  v47);
  sub_436E4(v53, &qword_FBFC8);
  sub_99824(v54, &qword_FBFD0);
  sub_8CC4(v45, &qword_FBFD8);
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
  uint64_t v55 = (*(uint64_t (**)(void *, uint64_t))(v93 + 8))(v42, v94);
  if (*(void *)(v92 + 88))
  {
    uint64_t v57 = *(void *)(v34 + 168);
    uint64_t v56 = *(void **)(v34 + 176);
    static SiriTimeFeatureFlagsImpl.instance.getter(v55);
    BOOL v58 = SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()();
    *(_BYTE *)(v34 + 416) = v58;
    sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8));
    *(void *)(v34 + 104) = 0LL;
    if (v58)
    {
      if (qword_FB368 != -1) {
        swift_once(&qword_FB368, sub_A4C1C);
      }
      uint64_t v59 = sub_1BD34();
      *(void *)(v34 + 320) = sub_5474(v59, (uint64_t)qword_100348);
      sub_1BD20();
      os_log_type_t v60 = sub_1BCD0();
      if (sub_1BB80(v60))
      {
        uint64_t v61 = (_WORD *)sub_1B9DC();
        sub_2BA04(v61);
        sub_1BAA8(&dword_0, v62, v63, "UndoCreateTimerFlow: Multi-timer handling");
        sub_1B904(v58);
      }

      uint64_t v64 = *(void *)(v34 + 120);

      unint64_t v65 = *(void **)(v64 + 72);
      *(void *)(v34 + 328) = v65;
      uint64_t v66 = dword_FF684;
      v65;
      uint64_t v67 = (void *)swift_task_alloc(v66);
      *(void *)(v34 + 336) = v67;
      sub_2BE20(v67, (uint64_t)sub_A5A30);
      sub_45014();
      return sub_88478();
    }

    else
    {
      if (qword_FB368 != -1) {
        swift_once(&qword_FB368, sub_A4C1C);
      }
      uint64_t v77 = sub_1BD34();
      *(void *)(v34 + 288) = sub_5474(v77, (uint64_t)qword_100348);
      sub_1BD20();
      os_log_type_t v78 = sub_1BCD0();
      if (sub_1BB80(v78))
      {
        uint64_t v79 = (_WORD *)sub_1B9DC();
        sub_2BA04(v79);
        sub_1BAA8(&dword_0, v80, v81, "UndoCreateTimerFlow: Single-timer handling");
        sub_1B904(v58);
      }

      uint64_t v82 = *(void *)(v34 + 120);

      sub_54CC(v82 + 32, v34 + 16);
      sub_8CFC((void *)(v34 + 16), *(void *)(v34 + 40));
      uint64_t v83 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SiriTimerManagerIOS.currentTimer()[1]);
      *(void *)(v34 + 296) = v83;
      sub_2BE20(v83, (uint64_t)sub_A5800);
      sub_45014();
      return dispatch thunk of SiriTimerManagerIOS.currentTimer()( v84,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v94,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  v34,  v35,  v95,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34);
    }
  }

  else
  {
    if (qword_FB368 != -1) {
      swift_once(&qword_FB368, sub_A4C1C);
    }
    uint64_t v69 = sub_1BD34();
    sub_5474(v69, (uint64_t)qword_100348);
    sub_1BD20();
    os_log_type_t v70 = sub_32A5C();
    if (sub_1BB80(v70))
    {
      uint64_t v71 = (_WORD *)sub_1B9DC();
      sub_2BA04(v71);
      sub_1BAA8(&dword_0, v72, v73, "UndoCreateTimerFlow: No timer id to delete! This should never happen.");
      sub_1B904(v43);
    }

    sub_59C1C(v74, enum case for SiriTimeEventSender.ReasonDescription.noTimerToDelete(_:));
    uint64_t v75 = (void *)swift_task_alloc(dword_10037C);
    *(void *)(v34 + 280) = v75;
    sub_A90C0(v75, (uint64_t)sub_A576C);
    sub_45014();
    return sub_A71C0(v76);
  }

uint64_t sub_A576C()
{
  uint64_t v1 = *(void *)(v0 + 192);
  sub_2B4F0(*(void *)(v0 + 280));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_1B9B8();
  return sub_20670();
}

uint64_t sub_A57B4()
{
  return sub_A8C30(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A5800(uint64_t a1)
{
  *(void *)(*(void *)v1 + 304LL) = a1;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A5850()
{
  uint64_t v3 = v2[38];
  uint64_t v4 = _s20HandleIntentStrategyVwxx_0(v2 + 2);
  if (!v3)
  {
    uint64_t v14 = (void *)v2[36];
    Logger.logObject.getter(v4);
    os_log_type_t v15 = sub_32A5C();
    if (sub_1BB80(v15))
    {
      uint64_t v16 = (_WORD *)sub_1B9DC();
      sub_2BA04(v16);
      sub_1BAA8( &dword_0,  v17,  v18,  "UndoCreateTimerFlow: siriTimerManager.currentTimer get nil result: no timers to delete.");
      sub_1B904(v1);
    }

    uint64_t v12 = (void *)swift_task_alloc(dword_100374);
    v2[39] = v12;
    uint64_t v13 = sub_A59FC;
    goto LABEL_11;
  }

  uint64_t v5 = (void *)v2[38];
  v2[45] = v5;
  id v6 = v5;
  SiriTimerState.rawValue.getter([v6 state]);
  if (v0 == sub_A90DC())
  {

    if (qword_FB368 != -1) {
      swift_once(&qword_FB368, sub_A4C1C);
    }
    uint64_t v7 = sub_1BD34();
    sub_5474(v7, (uint64_t)qword_100348);
    sub_1BD20();
    os_log_type_t v8 = sub_1BCD0();
    if (sub_1BB80(v8))
    {
      uint64_t v9 = (_WORD *)sub_1B9DC();
      sub_2BA04(v9);
      sub_1BAA8( &dword_0,  v10,  v11,  "UndoCreateTimerFlow: Timer has an unknown state (meaning there's no timer set on phone): No timers to delete.");
      sub_1B904(v1);
    }

    uint64_t v12 = (void *)swift_task_alloc(dword_100374);
    v2[51] = v12;
    uint64_t v13 = sub_A5F70;
LABEL_11:
    sub_2BE20(v12, (uint64_t)v13);
    return sub_A8EDC();
  }

  uint64_t v20 = sub_34D60((uint64_t)&unk_F6930, 17LL);
  uint64_t v21 = sub_A8FC8(v20);
  sub_A9060(v21);
  uint64_t v22 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v2[48] = v22;
  *uint64_t v22 = v2;
  v22[1] = sub_A5CA0;
  sub_A8E7C();
  return sub_A8EC8();
}

uint64_t sub_A59FC()
{
  return sub_1B758();
}

uint64_t sub_A5A30(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 328LL);
  *(void *)(*(void *)v1 + 344LL) = a1;
  swift_task_dealloc();

  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A5A84()
{
  uint64_t v1 = sub_17D30();
  uint64_t v3 = sub_A44AC(v1, v2);
  sub_2B7C4();

  *(void *)(v0 + 104) = v3;
  if (!v3)
  {
    os_log_type_t v15 = *(void **)(v0 + 320);
    Logger.logObject.getter(v4);
    os_log_type_t v16 = sub_32A5C();
    if (sub_1BB80(v16))
    {
      uint64_t v17 = (_WORD *)sub_1B9DC();
      sub_2BA04(v17);
      sub_1BAA8( &dword_0,  v18,  v19,  "UndoCreateTimerFlow: mtTimerManager.timersSync returned no timer with matching timerID: no timers to delete.");
      sub_1B904(v0 + 104);
    }

    uint64_t v13 = (void *)swift_task_alloc(dword_100374);
    *(void *)(v0 + 352) = v13;
    uint64_t v14 = sub_A5C64;
    goto LABEL_11;
  }

  id v5 = v3;
  id v6 = sub_A4828();

  *(void *)(v0 + 360) = v6;
  id v7 = v6;
  SiriTimerState.rawValue.getter([v7 state]);
  if (v6 == (id)sub_A90DC())
  {

    if (qword_FB368 != -1) {
      swift_once(&qword_FB368, sub_A4C1C);
    }
    uint64_t v8 = sub_1BD34();
    sub_5474(v8, (uint64_t)qword_100348);
    sub_1BD20();
    os_log_type_t v9 = sub_1BCD0();
    if (sub_1BB80(v9))
    {
      uint64_t v10 = (_WORD *)sub_1B9DC();
      sub_2BA04(v10);
      sub_1BAA8( &dword_0,  v11,  v12,  "UndoCreateTimerFlow: Timer has an unknown state (meaning there's no timer set on phone): No timers to delete.");
      sub_1B904(v0 + 104);
    }

    uint64_t v13 = (void *)swift_task_alloc(dword_100374);
    *(void *)(v0 + 408) = v13;
    uint64_t v14 = sub_A5F70;
LABEL_11:
    sub_2BE20(v13, (uint64_t)v14);
    return sub_A8EDC();
  }

  uint64_t v21 = sub_34D60((uint64_t)&unk_F6930, 17LL);
  uint64_t v22 = sub_A8FC8(v21);
  sub_A9060(v22);
  uint64_t v23 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 384) = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_A5CA0;
  sub_A8E7C();
  return sub_A8EC8();
}

uint64_t sub_A5C64()
{
  return sub_1B758();
}

uint64_t sub_A5CA0()
{
  return sub_1B758();
}

uint64_t sub_A5CD8()
{
  uint64_t v1 = v0[46];
  sub_6A2D0(v1 + 16, (uint64_t)(v0 + 7));
  if (*(_BYTE *)(v1 + 16) == 1)
  {
    uint64_t v2 = (uint64_t **)swift_task_alloc(dword_100384);
    v0[49] = (uint64_t)v2;
    *uint64_t v2 = v0;
    v2[1] = (uint64_t *)sub_A5D88;
    return sub_A7A6C(v0[45]);
  }

  else
  {
    sub_A9000(v0[24]);
    uint64_t v4 = (void *)swift_task_alloc(dword_10037C);
    v0[50] = (uint64_t)v4;
    uint64_t v5 = sub_A90C0(v4, (uint64_t)sub_A5EC4);
    return sub_A71C0(v5);
  }

uint64_t sub_A5D88()
{
  return sub_1B758();
}

uint64_t sub_A5DBC()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 120) + OBJC_IVAR____TtC23TimerFlowDelegatePlugin19UndoCreateTimerFlow_followupPluginAction;
  sub_6A2D0(v3, v0 + 80);
  sub_754CC(v3, v1, &qword_FD740);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v1, 1LL, v2) == 1)
  {
    sub_8CC4(*(void *)(v0 + 128), &qword_FD740);
    uint64_t v4 = *(void **)(v0 + 360);
    sub_A9008();
  }

  else
  {
    uint64_t v5 = *(void **)(v0 + 360);
    uint64_t v7 = *(void *)(v0 + 144);
    uint64_t v6 = *(void *)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 136);
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v6, *(void *)(v0 + 128), v8);
    static ExecuteResponse.redirect(nextPluginAction:)(v6);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }

  swift_release();
  sub_A90A0();
  sub_A8C48();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  return sub_A8C30(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A5EC4()
{
  uint64_t v1 = *(void *)(v0 + 192);
  sub_2B4F0(*(void *)(v0 + 400));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_1B9B8();
  return sub_20670();
}

uint64_t sub_A5F0C()
{
  uint64_t v1 = *(void **)(v0 + 360);
  sub_A9008();

  swift_release();
  sub_A90A0();
  sub_A8C48();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  return sub_A8C30(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A5F70()
{
  return sub_1B758();
}

uint64_t sub_A5FA4()
{
  uint64_t v1 = *(void **)(v0 + 360);
  sub_A9008();

  sub_A90A0();
  sub_A8C48();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  return sub_A8C30(*(uint64_t (**)(void))(v0 + 8));
}

void sub_A5FFC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = sub_67C4(&qword_100500);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a2 & 1) != 0)
  {
    id v14 = [*(id *)(a3 + 72) removeTimer:*a5];
    if (v14)
    {
      os_log_type_t v15 = v14;
      uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v35((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1, v10);
      uint64_t v16 = *(unsigned __int8 *)(v11 + 80);
      uint64_t v17 = (v16 + 16) & ~v16;
      uint64_t v34 = v16 | 7;
      uint64_t v18 = swift_allocObject(&unk_F6980, v17 + v12, v16 | 7);
      uint64_t v19 = v18 + v17;
      uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
      v20(v19, (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), v10);
      uint64_t v40 = sub_A8B28;
      uint64_t v41 = v18;
      aBlock = _NSConcreteStackBlock;
      uint64_t v37 = 1107296256LL;
      uint64_t v38 = sub_ADF24;
      uint64_t v39 = &unk_F6998;
      uint64_t v21 = _Block_copy(&aBlock);
      id v22 = v15;
      swift_release();
      id v23 = [v22 addSuccessBlock:v21];
      _Block_release(v21);

      v35((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1, v10);
      uint64_t v24 = (v16 + 24) & ~v16;
      uint64_t v25 = swift_allocObject(&unk_F69D0, v24 + v12, v34);
      *(void *)(v25 + 16) = a4;
      v20(v25 + v24, v13, v10);
      uint64_t v40 = sub_A8BF8;
      uint64_t v41 = v25;
      aBlock = _NSConcreteStackBlock;
      uint64_t v37 = 1107296256LL;
      uint64_t v38 = sub_ADF24;
      uint64_t v39 = &unk_F69E8;
      uint64_t v26 = _Block_copy(&aBlock);
      swift_retain();
      id v27 = v22;
      swift_release();
      id v28 = [v27 addFailureBlock:v26];

      _Block_release(v26);
    }
  }

  else
  {
    sub_54CC(a3 + 32, (uint64_t)&aBlock);
    uint64_t v29 = v39;
    uint64_t v30 = v40;
    sub_8CFC(&aBlock, (uint64_t)v39);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))( (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v10);
    uint64_t v31 = *(unsigned __int8 *)(v11 + 80);
    uint64_t v32 = (v31 + 24) & ~v31;
    uint64_t v33 = swift_allocObject(&unk_F6958, v32 + v12, v31 | 7);
    *(void *)(v33 + 16) = a4;
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v33 + v32, v13, v10);
    swift_retain();
    dispatch thunk of SiriTimerManagerIOS.stopCurrentTimer(completion:)(sub_A8A9C, v33, v29, v30);
    swift_release();
    _s20HandleIntentStrategyVwxx_0(&aBlock);
  }

uint64_t sub_A6314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimerOperationError(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v34 - v9;
  uint64_t v11 = sub_67C4(&qword_FDA50);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_754CC(a1, (uint64_t)v13, &qword_FDA50);
  if (swift_getEnumCaseMultiPayload(v13, v11) == 1)
  {
    id v14 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v14(v10, v13, v4);
    swift_beginAccess(a2 + 16, v35, 1LL, 0LL);
    *(_BYTE *)(a2 + 16) = 0;
    if (qword_FB368 != -1) {
      swift_once(&qword_FB368, sub_A4C1C);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_5474(v15, (uint64_t)qword_100348);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "UndoCreateTimerFlow: delete failed", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    uint64_t v20 = type metadata accessor for ABCReport(0LL);
    v34[3] = v20;
    v34[4] = &protocol witness table for ABCReport;
    uint64_t v21 = sub_DB90(v34);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    sub_11718( &qword_FDA58,  (uint64_t (*)(uint64_t))&type metadata accessor for TimerOperationError,  (uint64_t)&protocol conformance descriptor for TimerOperationError);
    uint64_t v23 = swift_allocError(v4, v22, 0LL, 0LL);
    v14(v24, v8, v4);
    *uint64_t v21 = _convertErrorToNSError(_:)(v23);
    uint64_t v25 = enum case for ErrorSubType.managerReturnedError(_:);
    uint64_t v26 = type metadata accessor for ErrorSubType(0LL);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104LL))(v21, v25, v26);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104LL))( v21,  enum case for ABCReport.timerUndoHandle(_:),  v20);
    static BarbaraWalters.stopThePresses(for:)(v34);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _s20HandleIntentStrategyVwxx_0(v34);
    swift_errorRelease(v23);
  }

  else
  {
    if (qword_FB368 != -1) {
      swift_once(&qword_FB368, sub_A4C1C);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    uint64_t v28 = sub_5474(v27, (uint64_t)qword_100348);
    uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_0, v29, v30, "UndoCreateTimerFlow: timer stopped completion", v31, 2u);
      swift_slowDealloc(v31, -1LL, -1LL);
    }
  }

  uint64_t v32 = sub_67C4(&qword_100500);
  return CheckedContinuation.resume(returning:)(v32, v32);
}

uint64_t sub_A66B8()
{
  if (qword_FB368 != -1) {
    swift_once(&qword_FB368, sub_A4C1C);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_5474(v0, (uint64_t)qword_100348);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "UndoCreateTimerFlow: removed mtTimer successfully", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v5 = sub_67C4(&qword_100500);
  return CheckedContinuation.resume(returning:)(v5, v5);
}

uint64_t sub_A67A0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 16) = 0;
  if (qword_FB368 != -1) {
    swift_once(&qword_FB368, sub_A4C1C);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_5474(v4, (uint64_t)qword_100348);
  swift_errorRetain(a1);
  uint64_t v5 = swift_errorRetain(a1);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v8 = 138412290;
    swift_errorRetain(a1);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError(a1);
    uint64_t v13 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, v14, v8 + 4, v8 + 12);
    *uint64_t v9 = v10;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl(&dword_0, v6, v7, "UndoCreateTimerFlow: remove mtTimer failed with error %@", v8, 0xCu);
    sub_67C4((uint64_t *)&unk_FD5F0);
    swift_arrayDestroy(v9, 1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  uint64_t v11 = sub_67C4(&qword_100500);
  return CheckedContinuation.resume(returning:)(v11, v11);
}

uint64_t sub_A6980()
{
  uint64_t v1 = type metadata accessor for CATOption(0LL);
  v0[12] = sub_1B6C8(*(void *)(v1 - 8));
  uint64_t v2 = sub_1BD34();
  v0[13] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v0[14] = v3;
  v0[15] = sub_1B6C8(v3);
  uint64_t v4 = sub_2BD40();
  v0[16] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v0[17] = v5;
  v0[18] = sub_1B6C8(v5);
  uint64_t v6 = sub_2BD38();
  v0[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v0[20] = v7;
  v0[21] = sub_1B6C8(v7);
  uint64_t v8 = sub_2BB7C();
  v0[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v0[23] = v9;
  v0[24] = sub_1B6C8(v9);
  uint64_t v10 = sub_2BB74();
  v0[25] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v0[26] = v11;
  v0[27] = sub_1B6C8(v11);
  uint64_t v12 = sub_67C4(&qword_FBFC8);
  v0[28] = sub_1B6C8(*(void *)(v12 - 8));
  uint64_t v13 = sub_67C4(&qword_FBFD0);
  v0[29] = sub_1B6C8(*(void *)(v13 - 8));
  uint64_t v14 = sub_67C4(&qword_FBFD8);
  v0[30] = sub_1B6C8(*(void *)(v14 - 8));
  uint64_t v15 = sub_A9080();
  v0[31] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v0[32] = v16;
  v0[33] = sub_1B6C8(v16);
  uint64_t v17 = sub_A9078();
  v0[34] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v0[35] = v18;
  v0[36] = sub_1B6C8(v18);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A6AAC()
{
  if (qword_FB368 != -1) {
    swift_once(&qword_FB368, sub_A4C1C);
  }
  uint64_t v3 = sub_5474(v2[13], (uint64_t)qword_100348);
  v2[37] = v3;
  uint64_t v40 = v3;
  sub_1BD20();
  os_log_type_t v4 = sub_1BCD0();
  if (sub_1BB80(v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_2BA04(v5);
    sub_1BAA8(&dword_0, v6, v7, "UndoCreateTimerFlow.makeAndPublishFailureResponseTimerNotFound() called");
    sub_1B904(v1);
  }

  uint64_t v9 = sub_59C1C(v8, enum case for ActivityType.failed(_:));
  if (qword_FB370 != -1) {
    uint64_t v9 = swift_once(&qword_FB370, sub_A4C64);
  }
  uint64_t v10 = v2[30];
  sub_A8D3C(v9, (uint64_t)qword_1011B8);
  uint64_t v11 = sub_A8F44();
  sub_44FF8(v10, v12, v13, v11);
  if (qword_FB378 != -1) {
    swift_once(&qword_FB378, sub_A4C80);
  }
  uint64_t v14 = v2[36];
  uint64_t v15 = v2[33];
  uint64_t v16 = v2[30];
  uint64_t v32 = v2[32];
  uint64_t v33 = v2[31];
  uint64_t v17 = v2[28];
  uint64_t v18 = v2[29];
  uint64_t v34 = v2[35];
  uint64_t v35 = v2[34];
  uint64_t v19 = v2[18];
  uint64_t v20 = v2[15];
  uint64_t v36 = v2[17];
  uint64_t v37 = v2[16];
  uint64_t v38 = v2[14];
  uint64_t v39 = v2[13];
  uint64_t v21 = sub_A8F4C();
  uint64_t v22 = sub_5474(v21, (uint64_t)qword_1011D0);
  sub_A90D4(v18, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16LL));
  sub_A9050(v18);
  uint64_t v23 = enum case for SiriTimeEventSender.ReasonDescription.timerNotFound(_:);
  uint64_t v24 = sub_5A13C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104LL))(v17, v23, v24);
  sub_A8D60(v17);
  static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v14, v15, v16, v18, v17);
  sub_8CC4(v17, &qword_FBFC8);
  sub_5E3A0(v25, &qword_FBFD0);
  sub_8CC4(v16, &qword_FBFD8);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v15, v33);
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v14, v35);
  uint64_t v27 = static DialogPhase.error.getter(v26);
  NLContextUpdate.init()(v27);
  (*(void (**)(uint64_t, void, uint64_t))(v36 + 104))( v19,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v37);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v20, v40, v39);
  uint64_t v28 = mach_absolute_time();
  sub_A90B4(v28, v29, v28);
  type metadata accessor for TimerBaseCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  v2[38] = sub_222D0();
  os_log_type_t v30 = (void *)swift_task_alloc(dword_100574);
  v2[39] = (uint64_t)v30;
  sub_2BE20(v30, (uint64_t)sub_A6DA0);
  return sub_ACD60();
}

uint64_t sub_A6DA0()
{
  uint64_t v4 = *v2;
  *uint64_t v5 = v4;
  v3[40] = v0;
  v3[41] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F658(v6, v7, v8);
  }

  else
  {
    uint64_t v10 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[42] = v10;
    *uint64_t v10 = v4;
    v10[1] = sub_A6E30;
    sub_A8F9C();
    return sub_2F668();
  }

uint64_t sub_A6E30()
{
  *(void *)(v1 + 344) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A6E7C()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  *(void *)(v0 + 352) = v1;
  sub_A8E40(v1, (uint64_t)sub_A6EC4);
  return sub_A8D70();
}

uint64_t sub_A6EC4()
{
  return sub_1B758();
}

#error "A6F34: call analysis failed (funcsize=28)"
#error "A7024: call analysis failed (funcsize=47)"
#error "A70F4: call analysis failed (funcsize=50)"
#error "A7138: call analysis failed (funcsize=45)"
uint64_t sub_A71C0(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v1[12] = a1;
  uint64_t v2 = type metadata accessor for CATOption(0LL);
  v1[13] = sub_1B6C8(*(void *)(v2 - 8));
  uint64_t v3 = sub_1BD34();
  v1[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[15] = v4;
  v1[16] = sub_1B6C8(v4);
  uint64_t v5 = sub_2BD40();
  v1[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[18] = v6;
  v1[19] = sub_1B6C8(v6);
  uint64_t v7 = sub_2BD38();
  v1[20] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v1[21] = v8;
  v1[22] = sub_1B6C8(v8);
  uint64_t v9 = sub_67C4(&qword_FBFC8);
  v1[23] = sub_1B6C8(*(void *)(v9 - 8));
  uint64_t v10 = sub_67C4(&qword_FBFD0);
  v1[24] = sub_1B6C8(*(void *)(v10 - 8));
  uint64_t v11 = sub_67C4(&qword_FBFD8);
  v1[25] = sub_1B6C8(*(void *)(v11 - 8));
  uint64_t v12 = sub_A9080();
  v1[26] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v1[27] = v13;
  v1[28] = sub_1B6C8(v13);
  uint64_t v14 = sub_A9078();
  v1[29] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v1[30] = v15;
  v1[31] = sub_1B6C8(v15);
  uint64_t v16 = sub_2BB7C();
  v1[32] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[33] = v17;
  v1[34] = sub_1B6C8(v17);
  uint64_t v18 = sub_2BB74();
  v1[35] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v1[36] = v19;
  v1[37] = sub_1B6C8(v19);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A72F0()
{
  if (qword_FB368 != -1) {
    swift_once(&qword_FB368, sub_A4C1C);
  }
  uint64_t v3 = sub_5474(v2[14], (uint64_t)qword_100348);
  v2[38] = v3;
  uint64_t v42 = v3;
  sub_1BD20();
  os_log_type_t v4 = sub_1BCD0();
  if (sub_1BB80(v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_2BA04(v5);
    sub_1BAA8(&dword_0, v6, v7, "UndoCreateTimerFlow.makeAndPublishGenericFailure() called");
    sub_1B904(v1);
  }

  uint64_t v9 = v2[30];
  uint64_t v8 = v2[31];
  uint64_t v10 = v2[29];

  uint64_t v12 = static DialogPhase.error.getter(v11);
  NLContextUpdate.init()(v12);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))(v8, enum case for ActivityType.failed(_:), v10);
  if (qword_FB370 != -1) {
    uint64_t v13 = swift_once(&qword_FB370, sub_A4C64);
  }
  uint64_t v14 = v2[25];
  sub_A8D3C(v13, (uint64_t)qword_1011B8);
  uint64_t v15 = sub_A8F44();
  sub_44FF8(v14, v16, v17, v15);
  if (qword_FB378 != -1) {
    swift_once(&qword_FB378, sub_A4C80);
  }
  uint64_t v18 = v2[31];
  uint64_t v19 = v2[28];
  uint64_t v20 = v2[25];
  uint64_t v35 = v2[27];
  uint64_t v22 = v2[23];
  uint64_t v21 = v2[24];
  uint64_t v23 = v2[19];
  uint64_t v36 = v2[18];
  uint64_t v37 = v2[30];
  uint64_t v24 = v2[16];
  uint64_t v38 = v2[17];
  uint64_t v39 = v2[15];
  uint64_t v40 = v2[29];
  uint64_t v41 = v2[14];
  uint64_t v25 = v2[12];
  uint64_t v26 = sub_A8F4C();
  sub_A8D18(v26, (uint64_t)qword_1011D0);
  sub_A8D60(v21);
  uint64_t v27 = sub_5A13C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16LL))(v22, v25, v27);
  sub_A8D60(v22);
  uint64_t v28 = static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)( v18,  v19,  v20,  v21,  v22);
  sub_5E3A0(v28, &qword_FBFC8);
  sub_A9088(v29, &qword_FBFD0);
  sub_99824(v30, &qword_FBFD8);
  sub_A8F38(v35);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v18, v40);
  (*(void (**)(uint64_t, void, uint64_t))(v36 + 104))( v23,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v24, v42, v41);
  uint64_t v31 = mach_absolute_time();
  sub_A90B4(v31, v32, v31);
  type metadata accessor for TimerBaseCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  v2[39] = sub_222D0();
  uint64_t v33 = (void *)swift_task_alloc(dword_100564);
  v2[40] = v33;
  sub_2BE20(v33, (uint64_t)sub_A75C4);
  return sub_AC948();
}

uint64_t sub_A75C4()
{
  uint64_t v4 = *v2;
  *uint64_t v5 = v4;
  v3[41] = v0;
  v3[42] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F658(v6, v7, v8);
  }

  else
  {
    uint64_t v10 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[43] = v10;
    *uint64_t v10 = v4;
    v10[1] = sub_A7654;
    sub_A8F9C();
    return sub_2F668();
  }

uint64_t sub_A7654()
{
  *(void *)(v1 + 352) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A76A0()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  *(void *)(v0 + 360) = v1;
  sub_A8E40(v1, (uint64_t)sub_A76E8);
  return sub_A8D70();
}

uint64_t sub_A76E8()
{
  *(void *)(v1 + 368) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

#error "A778C: call analysis failed (funcsize=47)"
#error "A78A4: call analysis failed (funcsize=47)"
#error "A7974: call analysis failed (funcsize=50)"
#error "A7A5C: call analysis failed (funcsize=56)"
uint64_t sub_A7A6C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = sub_67C4(&qword_FBFC8);
  v2[14] = sub_1B6C8(*(void *)(v3 - 8));
  uint64_t v4 = sub_67C4(&qword_FBFD0);
  v2[15] = sub_1B6C8(*(void *)(v4 - 8));
  uint64_t v5 = sub_67C4(&qword_FBFD8);
  v2[16] = sub_1B6C8(*(void *)(v5 - 8));
  uint64_t v6 = sub_A9080();
  v2[17] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[18] = v7;
  v2[19] = sub_1B6C8(v7);
  uint64_t v8 = sub_A9078();
  v2[20] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[21] = v9;
  v2[22] = sub_1B6C8(v9);
  uint64_t v10 = sub_1BD34();
  v2[23] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[24] = v11;
  v2[25] = sub_1B6C8(v11);
  uint64_t v12 = sub_2BD40();
  v2[26] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[27] = v13;
  v2[28] = sub_1B6C8(v13);
  uint64_t v14 = sub_2BD38();
  v2[29] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[30] = v15;
  v2[31] = sub_1B6C8(v15);
  uint64_t v16 = sub_2BB74();
  v2[32] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[33] = v17;
  v2[34] = sub_1B6C8(v17);
  uint64_t v18 = sub_2BB7C();
  v2[35] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[36] = v19;
  v2[37] = sub_1B6C8(v19);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A7B88()
{
  if (qword_FB368 != -1) {
    swift_once(&qword_FB368, sub_A4C1C);
  }
  uint64_t v2 = sub_5474(v0[23], (uint64_t)qword_100348);
  v0[38] = v2;
  uint64_t v29 = v2;
  uint64_t v3 = (os_log_s *)sub_1BD20();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_2B938(v5);
    sub_1BBEC(&dword_0, v3, v4, "UndoCreateTimerFlow.makeAndPublishSuccess() called", v1);
    sub_1B904((uint64_t)v1);
  }

  uint64_t v7 = v0[27];
  uint64_t v6 = v0[28];
  uint64_t v9 = v0[25];
  uint64_t v8 = v0[26];
  uint64_t v10 = v0[24];
  uint64_t v28 = v0[23];

  uint64_t v12 = NLContextUpdate.init()(v11);
  static DialogPhase.completion.getter(v12);
  sub_D378();
  uint64_t v14 = v13;
  v0[39] = v13;
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))( v6,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v29, v28);
  uint64_t v15 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v6, v9, v15);
  uint64_t v16 = sub_67C4(&qword_FBE58);
  uint64_t v17 = sub_34D60(v16, 40LL);
  *(_OWORD *)(v17 + 16) = xmmword_C2690;
  *(void *)(v17 + 32) = v14;
  uint64_t v30 = v17;
  specialized Array._endMutation()(v17, v18, v19, v20, v21, v22, v23, v24);
  v0[40] = v30;
  uint64_t v25 = dword_FE3E4;
  swift_retain();
  uint64_t v26 = (uint64_t **)swift_task_alloc(v25);
  v0[41] = (uint64_t)v26;
  *uint64_t v26 = v0;
  v26[1] = (uint64_t *)sub_A7D58;
  return sub_66190(v30);
}

uint64_t sub_A7D58()
{
  uint64_t v4 = *v2;
  *uint64_t v5 = v4;
  v3[42] = v0;
  v3[43] = v1;
  swift_task_dealloc();
  sub_1BC04();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F658(v6, v7, v8);
  }

  else
  {
    uint64_t v10 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[44] = v10;
    *uint64_t v10 = v4;
    v10[1] = sub_A7DE4;
    sub_A8F9C();
    return sub_2F668();
  }

uint64_t sub_A7DE4()
{
  return sub_1B758();
}

uint64_t sub_A7E20()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  *(void *)(v0 + 368) = v1;
  sub_A8E40(v1, (uint64_t)sub_A7E68);
  return sub_A8D70();
}

uint64_t sub_A7E68()
{
  *(void *)(v1 + 376) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_A7EB4()
{
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 160);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 56));
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 104))( v1,  enum case for ActivityType.completed(_:),  v3);
  if (qword_FB370 != -1) {
    uint64_t v4 = swift_once(&qword_FB370, sub_A4C64);
  }
  uint64_t v5 = *(void *)(v0 + 128);
  sub_A8D3C(v4, (uint64_t)qword_1011B8);
  uint64_t v6 = sub_A8F44();
  sub_44FF8(v5, v7, v8, v6);
  if (qword_FB378 != -1) {
    swift_once(&qword_FB378, sub_A4C80);
  }
  uint64_t v9 = *(void **)(v0 + 336);
  uint64_t v34 = *(void *)(v0 + 296);
  uint64_t v32 = *(void *)(v0 + 288);
  uint64_t v33 = *(void *)(v0 + 280);
  uint64_t v29 = *(void *)(v0 + 264);
  uint64_t v30 = *(void *)(v0 + 256);
  uint64_t v31 = *(void *)(v0 + 272);
  uint64_t v27 = *(void *)(v0 + 232);
  uint64_t v28 = *(void *)(v0 + 248);
  uint64_t v10 = *(void *)(v0 + 176);
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v25 = *(void *)(v0 + 160);
  uint64_t v26 = *(void *)(v0 + 240);
  uint64_t v12 = *(void *)(v0 + 144);
  uint64_t v23 = *(void *)(v0 + 136);
  uint64_t v24 = *(void *)(v0 + 168);
  uint64_t v14 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 128);
  uint64_t v15 = *(void *)(v0 + 112);
  uint64_t v16 = sub_A8F4C();
  uint64_t v17 = sub_5474(v16, (uint64_t)qword_1011D0);
  sub_A90D4(v14, v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL));
  sub_A9050(v14);
  uint64_t v18 = sub_5A13C();
  sub_44FF8(v15, v19, v20, v18);
  static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v10, v11, v13, v14, v15);

  uint64_t v21 = swift_release();
  sub_99824(v21, &qword_FBFC8);
  sub_8CC4(v14, &qword_FBFD0);
  sub_8CC4(v13, &qword_FBFD8);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v23);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v10, v25);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v30);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  sub_A8C68();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

#error "A8248: call analysis failed (funcsize=99)"
#error "A840C: call analysis failed (funcsize=102)"
#error "A85E8: call analysis failed (funcsize=108)"
uint64_t UndoCreateTimerFlow.deinit()
{
  uint64_t v0;
  swift_release();
  swift_release();
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 32));

  swift_bridgeObjectRelease(*(void *)(v0 + 88));
  sub_8CC4(v0 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin19UndoCreateTimerFlow_followupPluginAction, &qword_FD740);
  return v0;
}

uint64_t UndoCreateTimerFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_A86E0()
{
  return UndoCreateTimerFlow.on(input:)() & 1;
}

uint64_t sub_A8704(uint64_t a1, uint64_t a2)
{
  return UndoCreateTimerFlow.execute(completion:)(a1, a2);
}

uint64_t sub_A8724(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10036C);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_58DB8;
  return UndoCreateTimerFlow.execute()(a1);
}

uint64_t sub_A8778(uint64_t a1, uint64_t a2)
{
  uint64_t TimerFlow = type metadata accessor for UndoCreateTimerFlow(0LL);
  return Flow<>.exitValue.getter(TimerFlow, a2);
}

id sub_A87A0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  NSString v5 = String._bridgeToObjectiveC()();
  sub_1BC04();
  id v6 = [v2 initWithIdentifier:v4 displayString:v5];

  return v6;
}

void *sub_A882C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for SiriTimerManagerImpl(0LL);
  uint64_t v15 = &protocol witness table for SiriTimerManagerImpl;
  *(void *)&__int128 v13 = a1;
  type metadata accessor for DeleteTimerCATs_Async(0LL);
  static CATOption.defaultMode.getter();
  a3[2] = CATWrapper.__allocating_init(options:globals:)(v8, 0LL);
  type metadata accessor for DeleteTimerCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  a3[3] = CATWrapper.__allocating_init(options:globals:)(v8, 0LL);
  a3[10] = 0LL;
  a3[11] = 0LL;
  uint64_t v9 = (uint64_t)a3 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin19UndoCreateTimerFlow_followupPluginAction;
  uint64_t v10 = type metadata accessor for PluginAction(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v9, 1LL, 1LL, v10);
  sub_5530(&v13, (uint64_t)(a3 + 4));
  a3[9] = a2;
  return a3;
}

uint64_t sub_A8934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FD740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A897C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

void sub_A898C(uint64_t a1)
{
}

uint64_t sub_A899C()
{
  return type metadata accessor for UndoCreateTimerFlow(0LL);
}

void sub_A89A4(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[2] = "(";
  void v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  void v4[4] = &unk_C60B0;
  sub_A8A44(319LL);
  if (v3 <= 0x3F)
  {
    v4[5] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
  }

void sub_A8A44(uint64_t a1)
{
  if (!qword_FD828)
  {
    uint64_t v2 = type metadata accessor for PluginAction(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_FD828);
    }
  }

uint64_t sub_A8A9C()
{
  uint64_t v0 = sub_A8FE0();
  return sub_A6314(v0, v1);
}

uint64_t sub_A8AC8()
{
  uint64_t v1 = *(void *)(sub_67C4(&qword_100500) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_1BB90(v1);
  return swift_deallocObject(v0, v3, v4);
}

uint64_t sub_A8B28()
{
  return sub_A66B8();
}

uint64_t sub_A8B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_A8B78(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_A8B84()
{
  uint64_t v1 = sub_67C4(&qword_100500);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v6 = sub_5A434();
  return swift_deallocObject(v6, v7, v5);
}

uint64_t sub_A8BF8()
{
  uint64_t v0 = sub_A8FE0();
  return sub_A67A0(v0, v1);
}

uint64_t sub_A8C30(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_A8C48()
{
  return swift_task_dealloc(*(void *)(v0 + 272));
}

uint64_t sub_A8C68()
{
  return swift_task_dealloc(*(void *)(v0 + 296));
}

uint64_t sub_A8C90()
{
  return swift_task_dealloc(*(void *)(v0 + 296));
}

uint64_t sub_A8CBC()
{
  return type metadata accessor for SiriTimeEventSender.Attribute(0LL);
}

uint64_t sub_A8CE4()
{
  return static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v0, v2, v3, v4, v5);
}

uint64_t sub_A8D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5474(a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(v3, v4, v2);
}

uint64_t sub_A8D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_5474(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t sub_A8D60(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 0LL, 1LL, v1);
}

uint64_t sub_A8D70()
{
  return ((uint64_t (*)(void))dispatch thunk of OutputPublisherAsync.publish(output:))();
}

uint64_t sub_A8D80(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v2, v1, a1);
}

uint64_t sub_A8D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_5474(v4, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v5, v4);
}

uint64_t sub_A8DC0()
{
  return swift_task_dealloc(*(void *)(v0 + 288));
}

uint64_t sub_A8DEC()
{
  return swift_task_dealloc(*(void *)(v0 + 288));
}

void sub_A8E18()
{
}

uint64_t sub_A8E40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_A8E5C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
}

  ;
}

uint64_t sub_A8EA8()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 352);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 360) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_A8EC8()
{
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_A8EDC()
{
  return sub_A6980();
}

_WORD *sub_A8EF0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

BOOL sub_A8F08(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_A8F18()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_A8F28()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_A8F38@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_A8F44()
{
  return type metadata accessor for SiriKitReliabilityCodes(0LL);
}

uint64_t sub_A8F4C()
{
  return type metadata accessor for SiriTimeEventSender.Attribute(0LL);
}

  ;
}

_WORD *sub_A8F68(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *sub_A8F7C()
{
  return sub_8CFC(v0, *(void *)(v1 + 80));
}

uint64_t sub_A8F9C()
{
  return v0;
}

  ;
}

uint64_t sub_A8FC8(uint64_t a1)
{
  *(void *)(v1 + 368) = a1;
  *(_BYTE *)(a1 + 16) = 1;
  return swift_task_alloc(48LL);
}

uint64_t sub_A8FE0()
{
  return v0;
}

uint64_t sub_A9000@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 104))();
}

uint64_t sub_A9008()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_A9010@<X0>(uint64_t (*a1)(void, uint64_t)@<X8>)
{
  return a1(*(void *)(v2 - 184), v1);
}

uint64_t sub_A901C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(v5 - 128, v5 - 112, v4 + 8, a4, 6LL);
}

  ;
}

uint64_t sub_A9040()
{
  return *(void *)(v0 + 176);
}

uint64_t sub_A9050(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 0LL, 1LL, v1);
}

uint64_t sub_A9060(uint64_t result)
{
  *(void *)(v3 + 376) = result;
  *(_BYTE *)(result + 16) = v4;
  *(void *)(result + 24) = v5;
  *(void *)(result + 32) = v1;
  *(void *)(result + 40) = v2;
  return result;
}

uint64_t sub_A9078()
{
  return type metadata accessor for ActivityType(0LL);
}

uint64_t sub_A9080()
{
  return type metadata accessor for SiriTimeEventSender.TaskType(0LL);
}

void sub_A9088(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_A9090()
{
  return Logger.logObject.getter();
}

uint64_t sub_A9098( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  return _s20HandleIntentStrategyVwxx_0(a11);
}

void sub_A90A0()
{
}

id sub_A90A8(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v1 + 1792), v2);
}

uint64_t sub_A90B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SiriTimeMeasurement.init(_:log:startTime:)(v3, v4, a3);
}

uint64_t sub_A90C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v2;
  a1[1] = a2;
  return *(void *)(v2 + 200);
}

uint64_t sub_A90D4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_A90DC()
{
  return SiriTimerState.rawValue.getter(0LL);
}

uint64_t sub_A90E8()
{
  return Logger.logObject.getter();
}

uint64_t sub_A90F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return swift_errorRelease(a13);
}

uint64_t sub_A90F8()
{
  return Logger.logObject.getter();
}

void sub_A9100()
{
  uint64_t v5 = v4;
  sub_67C4(&qword_100520);
  sub_17B6C();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_ABD10();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_88184();
  __chkstk_darwin(v9);
  sub_960C4();
  __chkstk_darwin(v10);
  sub_ABDA8();
  NLContextUpdate.init()();
  sub_AAC24(v5, v11, v12, v13, v14, v15, v16, v17, v34, v35, v36, v37, v38, v39);
  uint64_t v18 = sub_ABD88();
  if (v19)
  {
    sub_7C258(v18, &qword_100520);
  }

  else
  {
    sub_ABD58(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
    if (qword_FB380 != -1) {
      swift_once(&qword_FB380, sub_AAB60);
    }
    uint64_t v20 = sub_1BD34();
    uint64_t v21 = (os_log_s *)sub_5474(v20, (uint64_t)qword_100508);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    uint64_t v23 = v22(v1, v0, v7);
    Logger.logObject.getter(v23);
    os_log_type_t v24 = sub_1BCD0();
    if (sub_434D0(v24))
    {
      uint64_t v25 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v40 = sub_1BA1C(32LL);
      *(_DWORD *)uint64_t v25 = 136315138;
      v22((uint64_t)v2, v1, v7);
      uint64_t v26 = sub_ABE00();
      uint64_t v28 = sub_ABDF4(v26, v27);
      uint64_t v29 = sub_ABDD8(v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v29, v30, v31, v32);
      sub_17E70();
      sub_ABE54();
      sub_1E7D8(&dword_0, v21, v3, "Submitting NLv4 dialog act: %s", v25);
      sub_1E7D0(v40);
      sub_1B904(v40);
      sub_1B904((uint64_t)v25);
    }

    else
    {
      sub_ABE54();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v0);
    v2(v0, v7);
  }

  unint64_t v33 = sub_ABF6C();
  NLContextUpdate.weightedPromptTargetDomain.setter(v33);
  sub_ABF5C();
  NLContextUpdate.weightedPromptAbortValues.setter(&off_F2F08);
  NLContextUpdate.weightedPromptResponseTargets.setter(&off_F2F38);
  NLContextUpdate.weightedPromptResponseOptions.setter(&off_F2F68);
  sub_17E58();
}

void sub_A9334()
{
}

void *sub_A9358(uint64_t a1, void (*a2)(uint64_t, id))
{
  uint64_t v3 = v2;
  uint64_t v31 = a2;
  uint64_t v5 = sub_67C4(&qword_FBE68);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for RREntity(0LL);
  uint64_t v30 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v29 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v25 = (char *)v24 - v11;
  uint64_t v26 = a1;
  uint64_t v12 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v12; uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v22))
  {
    v24[1] = v3;
    uint64_t v3 = v26;
    unint64_t v28 = v26 & 0xC000000000000001LL;
    a1 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v13 = 4LL;
    uint64_t v27 = v12;
    while (1)
    {
      uint64_t v14 = v8;
      uint64_t v8 = v13 - 4;
      id v15 = v28 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13 - 4, v3) : *(id *)(v3 + 8 * v13);
      uint64_t v16 = v15;
      uint64_t v17 = v13 - 3;
      if (__OFADD__(v8, 1LL)) {
        break;
      }
      v31(v13 - 4, v15);

      uint64_t v8 = v14;
      if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v7, 1LL, v14) == 1)
      {
        sub_DABC((uint64_t)v7, &qword_FBE68);
      }

      else
      {
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
        char v19 = v25;
        v18(v25, v7, v14);
        v18(v29, v19, v14);
        if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0) {
          a1 = sub_877CC(0, *(void *)(a1 + 16) + 1LL, 1, a1);
        }
        unint64_t v21 = *(void *)(a1 + 16);
        unint64_t v20 = *(void *)(a1 + 24);
        if (v21 >= v20 >> 1) {
          a1 = sub_877CC(v20 > 1, v21 + 1, 1, a1);
        }
        *(void *)(a1 + 16) = v21 + 1;
        uint64_t v8 = v14;
        v18( (char *)(a1 + ((*(unsigned __int8 *)(v30 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))
                 + *(void *)(v30 + 72) * v21),
          v29,
          v14);
        uint64_t v3 = v26;
      }

      ++v13;
      if (v17 == v27)
      {
        swift_bridgeObjectRelease(v3);
        return (void *)a1;
      }
    }

    __break(1u);
LABEL_18:
    if (a1 < 0) {
      uint64_t v22 = a1;
    }
    else {
      uint64_t v22 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

  swift_bridgeObjectRelease(v26);
  return _swiftEmptyArrayStorage;
}

void sub_A9614()
{
  uint64_t v2 = v1;
  uint64_t v186 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v185 = *(void *)(v186 - 8);
  sub_17B6C();
  __chkstk_darwin(v3);
  sub_17D14();
  uint64_t v184 = v4;
  uint64_t v5 = sub_1E818();
  uint64_t v189 = type metadata accessor for Siri_Nlu_External_SystemGaveOptions(v5);
  uint64_t v188 = *(void *)(v189 - 8);
  sub_17B6C();
  __chkstk_darwin(v6);
  sub_433C4();
  uint64_t v181 = v7;
  sub_433B0();
  __chkstk_darwin(v8);
  sub_436A0();
  uint64_t v183 = v9;
  uint64_t v10 = sub_1E818();
  uint64_t v193 = type metadata accessor for UsoEntity_common_Quantifier.DefinedValues(v10);
  uint64_t v192 = *(void *)(v193 - 8);
  sub_17B6C();
  __chkstk_darwin(v11);
  sub_17D14();
  uint64_t v191 = v12;
  uint64_t v13 = sub_1E818();
  type metadata accessor for Siri_Nlu_External_UsoGraph(v13);
  sub_17B6C();
  __chkstk_darwin(v14);
  sub_433C4();
  uint64_t v194 = v15;
  sub_433B0();
  __chkstk_darwin(v16);
  sub_43404();
  uint64_t v197 = v17;
  sub_433B0();
  __chkstk_darwin(v18);
  sub_436A0();
  uint64_t v203 = v19;
  uint64_t v20 = sub_1E818();
  uint64_t v21 = type metadata accessor for Siri_Nlu_External_UserStatedTask(v20);
  uint64_t v206 = *(void *)(v21 - 8);
  uint64_t v207 = v21;
  sub_17B6C();
  __chkstk_darwin(v22);
  sub_433C4();
  uint64_t v196 = v23;
  sub_433B0();
  __chkstk_darwin(v24);
  sub_43404();
  uint64_t v198 = v25;
  sub_433B0();
  __chkstk_darwin(v26);
  sub_43404();
  uint64_t v200 = v27;
  sub_433B0();
  __chkstk_darwin(v28);
  sub_436A0();
  uint64_t v208 = v29;
  uint64_t v30 = sub_1E818();
  uint64_t v210 = type metadata accessor for Siri_Nlu_External_UserDialogAct(v30);
  uint64_t v204 = *(void *)(v210 - 8);
  sub_17B6C();
  __chkstk_darwin(v31);
  sub_433C4();
  uint64_t v187 = v32;
  sub_433B0();
  __chkstk_darwin(v33);
  sub_43404();
  uint64_t v195 = v34;
  sub_433B0();
  __chkstk_darwin(v35);
  sub_43404();
  uint64_t v190 = v36;
  sub_433B0();
  __chkstk_darwin(v37);
  sub_43404();
  uint64_t v201 = v38;
  sub_433B0();
  __chkstk_darwin(v39);
  sub_436A0();
  uint64_t v209 = v40;
  uint64_t v41 = sub_1E818();
  uint64_t v205 = type metadata accessor for Siri_Nl_Core_Protocol_UsoGraph(v41);
  uint64_t v202 = *(void (**)(uint64_t, uint64_t))(v205 - 8);
  sub_17B6C();
  __chkstk_darwin(v42);
  uint64_t v199 = (char *)&v167 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_433B0();
  __chkstk_darwin(v44);
  sub_ABDA8();
  sub_67C4(&qword_FF620);
  sub_17B6C();
  __chkstk_darwin(v45);
  sub_1C308();
  uint64_t v48 = v47 - v46;
  uint64_t v182 = v2;
  sub_A9100();
  uint64_t v49 = sub_ABAA8((unsigned int *)&enum case for UsoEntity_common_UserEntity.DefinedValues.common_UserEntity_Everywhere(_:));
  uint64_t v50 = sub_ABAA8((unsigned int *)&enum case for UsoEntity_common_UserEntity.DefinedValues.common_UserEntity_Here(_:));
  uint64_t v213 = _swiftEmptyArrayStorage;
  uint64_t v51 = sub_67C4(&qword_FBE58);
  uint64_t v52 = sub_1E854(v51);
  __int128 v211 = xmmword_C2690;
  *(_OWORD *)(v52 + 16) = xmmword_C2690;
  *(void *)(v52 + 32) = v49;
  sub_59DDC(v52, v53, v54, v55, v56, v57, v58, v59);
  uint64_t v60 = type metadata accessor for UsoBuilderOptions(0LL);
  sub_ABE0C();
  swift_retain();
  uint64_t v61 = sub_ABF10();
  sub_18034();
  sub_ABEE4();
  uint64_t v62 = sub_1E854(v51);
  *(_OWORD *)(v62 + 16) = v211;
  *(void *)(v62 + 32) = v50;
  sub_59DDC(v62, v63, v64, v65, v66, v67, v68, v69);
  sub_ABE0C();
  swift_retain();
  uint64_t v70 = sub_ABF10();
  sub_18034();
  sub_ABEE4();
  Graph.protobufGraphSiriNl(vocabManager:)(0LL);
  uint64_t v174 = v60;
  uint64_t v175 = v51;
  uint64_t v179 = v49;
  uint64_t v177 = v50;
  uint64_t v178 = v70;
  uint64_t v180 = v61;
  uint64_t v71 = v207;
  unint64_t v176 = sub_ABCCC();
  uint64_t v72 = static USOSerializedGraph.fromProto(protoGraph:)(v0);
  uint64_t v202 = (void (*)(uint64_t, uint64_t))*((void *)v202 + 1);
  v202(v0, v205);
  id v73 = [objc_allocWithZone(SIRINLUUserStatedTask) initWithTask:v72];
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  sub_ABEFC();
  if (v75) {
    sub_ABDC4(v74);
  }
  uint64_t v76 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v0, v73);
  uint64_t v84 = specialized Array._endMutation()(v76, v77, v78, v79, v80, v81, v82, v83);
  uint64_t v85 = v209;
  uint64_t v86 = Siri_Nlu_External_UserDialogAct.init()(v84);
  uint64_t v87 = v208;
  Siri_Nlu_External_UserStatedTask.init()(v86);
  uint64_t v88 = v203;
  sub_ABE74();
  id v89 = v73;
  uint64_t v90 = v204;
  id v172 = v89;
  Siri_Nlu_External_UserStatedTask.task.setter(v88);
  uint64_t v91 = v200;
  uint64_t v203 = *(void (**)(void, void, void))(v206 + 16);
  v203(v200, v87, v71);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v91);
  uint64_t v171 = *(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16);
  v171(v201, v85, v210);
  uint64_t v92 = sub_878D4(0, 1LL, 1, (uint64_t)_swiftEmptyArrayStorage);
  unint64_t v94 = *(void *)(v92 + 16);
  unint64_t v93 = *(void *)(v92 + 24);
  uint64_t v173 = v72;
  uint64_t v170 = v48;
  if (v94 >= v93 >> 1) {
    uint64_t v92 = sub_ABE40(v92, v93);
  }
  *(void *)(v92 + 16) = v94 + 1;
  unint64_t v95 = (*(unsigned __int8 *)(v90 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80);
  uint64_t v96 = *(void *)(v90 + 72);
  uint64_t v97 = *(void (**)(unint64_t, uint64_t, uint64_t))(v90 + 32);
  uint64_t v98 = v92;
  v97(v92 + v95 + v96 * v94, v201, v210);
  uint64_t v99 = v199;
  Graph.protobufGraphSiriNl(vocabManager:)(0LL);
  uint64_t v167 = v96;
  unint64_t v168 = v95;
  uint64_t v169 = v97;
  uint64_t v201 = v98;
  uint64_t v100 = static USOSerializedGraph.fromProto(protoGraph:)(v99);
  v202((uint64_t)v99, v205);
  id v101 = objc_allocWithZone(&OBJC_CLASS___SIRINLUUserStatedTask);
  uint64_t v205 = v100;
  uint64_t v102 = (void (*)(uint64_t, uint64_t))[v101 initWithTask:v100];
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  sub_ABEFC();
  if (v75) {
    sub_ABDC4(v103);
  }
  uint64_t v104 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v99, v102);
  specialized Array._endMutation()(v104, v105, v106, v107, v108, v109, v110, v111);
  uint64_t v112 = swift_bridgeObjectRelease(v213);
  uint64_t v113 = v198;
  Siri_Nlu_External_UserStatedTask.init()(v112);
  uint64_t v114 = v197;
  sub_ABE74();
  uint64_t v202 = v102;
  Siri_Nlu_External_UserStatedTask.task.setter(v114);
  uint64_t v115 = v200;
  sub_ABF50(v200, v113);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v115);
  sub_ABEC8((uint64_t)&v203);
  uint64_t v116 = v201;
  unint64_t v118 = *(void *)(v201 + 16);
  unint64_t v117 = *(void *)(v201 + 24);
  if (v118 >= v117 >> 1) {
    uint64_t v116 = sub_ABE40(v201, v117);
  }
  uint64_t v201 = v116;
  *(void *)(v116 + 16) = v118 + 1;
  sub_ABEC8((uint64_t)&v201);
  uint64_t v119 = type metadata accessor for UsoTaskBuilder_noVerb_common_Setting(0LL);
  sub_2B838(v119);
  uint64_t v120 = UsoTaskBuilder_noVerb_common_Setting.init()();
  uint64_t v121 = type metadata accessor for UsoEntityBuilder_common_Setting(0LL);
  sub_2B838(v121);
  uint64_t v122 = UsoEntityBuilder_common_Setting.init()();
  uint64_t v123 = type metadata accessor for UsoEntityBuilder_common_Quantifier(0LL);
  sub_2B838(v123);
  UsoEntityBuilder_common_Quantifier.init()();
  uint64_t v124 = v192;
  uint64_t v125 = v191;
  uint64_t v126 = v193;
  (*(void (**)(uint64_t, void, uint64_t))(v192 + 104))( v191,  enum case for UsoEntity_common_Quantifier.DefinedValues.common_Quantifier_All(_:),  v193);
  dispatch thunk of UsoEntityBuilder_common_Quantifier.setDefinedValue(value:)(v125);
  (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v125, v126);
  uint64_t v127 = swift_retain();
  dispatch thunk of UsoEntityBuilderGlobalArgs.setUsoQuantifier(value:)( v127,  &protocol witness table for UsoEntityBuilder_common_Quantifier);
  sub_2BE54();
  dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)(v122);
  uint64_t v128 = sub_1E854(v175);
  *(_OWORD *)(v128 + 16) = v211;
  *(void *)(v128 + 32) = v120;
  sub_59DDC(v128, v129, v130, v131, v132, v133, v134, v135);
  uint64_t v136 = v212;
  uint64_t v137 = v170;
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v170, 1LL, 1LL, v174);
  swift_retain();
  uint64_t v138 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v136, v137);
  sub_18034();
  uint64_t v139 = sub_DABC(v137, &qword_FF620);
  uint64_t v140 = Siri_Nlu_External_UserDialogAct.init()(v139);
  uint64_t v141 = v196;
  Siri_Nlu_External_UserStatedTask.init()(v140);
  uint64_t v142 = v194;
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v138, 0LL);
  *(void *)&__int128 v211 = v138;
  Siri_Nlu_External_UserStatedTask.task.setter(v142);
  uint64_t v143 = v200;
  sub_ABF50(v200, v141);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v143);
  sub_ABEC8((uint64_t)&v203);
  uint64_t v144 = v201;
  unint64_t v146 = *(void *)(v201 + 16);
  unint64_t v145 = *(void *)(v201 + 24);
  if (v146 >= v145 >> 1)
  {
    char v163 = sub_ABF1C(v145);
    uint64_t v144 = sub_878D4(v163, v164, v165, v166);
  }

  uint64_t v147 = v184;
  uint64_t v148 = v189;
  uint64_t v149 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))v169;
  *(void *)(v144 + 16) = v146 + 1;
  uint64_t v150 = v144;
  uint64_t v151 = v149(v144 + v168 + v146 * v167, v187, v210);
  uint64_t v152 = v183;
  Siri_Nlu_External_SystemGaveOptions.init()(v151);
  uint64_t v153 = Siri_Nlu_External_SystemGaveOptions.choices.setter(v150);
  Siri_Nlu_External_SystemDialogAct.init()(v153);
  uint64_t v154 = v181;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v188 + 16))(v181, v152, v148);
  Siri_Nlu_External_SystemDialogAct.gaveOptions.setter(v154);
  uint64_t v155 = sub_67C4(&qword_100540);
  uint64_t v156 = v185;
  uint64_t v157 = *(unsigned __int8 *)(v185 + 80);
  uint64_t v158 = (v157 + 32) & ~v157;
  uint64_t v159 = swift_allocObject(v155, v158 + *(void *)(v185 + 72), v157 | 7);
  *(_OWORD *)(v159 + 16) = xmmword_C2640;
  uint64_t v160 = v186;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 16))(v159 + v158, v147, v186);
  NLContextUpdate.nluSystemDialogActs.setter(v159);
  sub_ABD08((uint64_t)&v211);
  sub_ABD08((uint64_t)&v209);
  sub_ABD50((uint64_t)&v205);
  sub_ABD50((uint64_t)&v204);
  sub_ABF64();

  sub_2BE54();
  sub_1E84C();
  sub_88014();
  sub_ABD08((uint64_t)&v211 + 8);
  sub_ABD08((uint64_t)&v210);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v147, v160);
  (*(void (**)(uint64_t, uint64_t))(v188 + 8))(v152, v189);
  sub_ABD80(v196);
  uint64_t v161 = *(void (**)(uint64_t, uint64_t))(v204 + 8);
  uint64_t v162 = v210;
  v161(v195, v210);
  sub_ABD80(v198);
  sub_ABD80(v208);
  v161(v209, v162);
  sub_17E58();
}

void sub_AA26C()
{
  char v1 = v0;
  LODWORD(v59) = v2;
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_17D14();
  uint64_t v62 = v7;
  sub_67C4(&qword_100520);
  sub_17B6C();
  __chkstk_darwin(v8);
  sub_1C308();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v60 = *(void *)(v12 - 8);
  sub_17B6C();
  __chkstk_darwin(v13);
  sub_433C4();
  uint64_t v55 = v14;
  sub_433B0();
  __chkstk_darwin(v15);
  sub_43404();
  uint64_t v56 = v16;
  sub_433B0();
  __chkstk_darwin(v17);
  sub_436A0();
  uint64_t v61 = v18;
  NLContextUpdate.init()(v19);
  NLContextUpdate.weightedPromptTargetDomain.setter(0xD000000000000017LL);
  sub_ABF5C();
  NLContextUpdate.weightedPromptAbortValues.setter(&off_F32B8);
  uint64_t v20 = sub_67C4(&qword_FF618);
  uint64_t v21 = swift_allocObject(v20, 96LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_C2D10;
  *(void *)(v21 + 32) = 0xD00000000000001CLL;
  *(void *)(v21 + 40) = 0x80000000000C6B10LL;
  *(void *)(v21 + 48) = 0xD00000000000001BLL;
  *(void *)(v21 + 56) = 0x80000000000C6870LL;
  *(void *)(v21 + 64) = 0xD000000000000020LL;
  *(void *)(v21 + 72) = 0x80000000000C9CE0LL;
  *(void *)(v21 + 80) = 0xD00000000000001BLL;
  *(void *)(v21 + 88) = 0x80000000000C6B30LL;
  if ((v1 & 1) != 0)
  {
    uint64_t v57 = v6;
    uint64_t v58 = v5;
    _StringGuts.grow(_:)(20LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v63[0] = 0xD000000000000012LL;
    v63[1] = 0x80000000000C9D10LL;
    Swift::String v22 = String.labelCapitalization()();
    String.append(_:)(v22);
    sub_756F8();
    unint64_t v24 = *(void *)(v21 + 16);
    unint64_t v23 = *(void *)(v21 + 24);
    if (v24 >= v23 >> 1)
    {
      sub_875E0(v23 > 1, v24 + 1, 1, v21);
      uint64_t v21 = v51;
    }

    *(void *)(v21 + 16) = v24 + 1;
    uint64_t v25 = v21 + 16 * v24;
    *(void *)(v25 + 32) = 0xD000000000000012LL;
    *(void *)(v25 + 40) = 0x80000000000C9D10LL;
    NLContextUpdate.weightedPromptResponseOptions.setter(&off_F32E8);
    uint64_t v6 = v57;
    uint64_t v5 = v58;
  }

  uint64_t v26 = swift_bridgeObjectRetain(v21);
  NLContextUpdate.weightedPromptResponseTargets.setter(v26);
  uint64_t v27 = sub_AAE78(v4);
  NLContextUpdate.displayHints.setter(v27);
  NLContextUpdate.disambiguationPromptAbortValues.setter(&off_F3328);
  uint64_t v59 = v4;
  sub_AB4AC();
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v11, 1LL, v12) == 1)
  {
    uint64_t v28 = sub_DABC(v11, &qword_100520);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v61, v11, v12);
    if (qword_FB380 != -1) {
      swift_once(&qword_FB380, sub_AAB60);
    }
    uint64_t v29 = sub_1BD34();
    sub_5474(v29, (uint64_t)qword_100508);
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
    uint64_t v31 = v56;
    uint64_t v32 = v30(v56, v61, v12);
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.default.getter();
    uint64_t v54 = v33;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v58 = v5;
      uint64_t v35 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v57 = v6;
      uint64_t v53 = sub_1BA1C(32LL);
      v63[0] = v53;
      *(_DWORD *)uint64_t v35 = 136315138;
      uint64_t v33 = (os_log_s *)(v35 + 12);
      v52[1] = v35 + 4;
      v30(v55, v31, v12);
      uint64_t v36 = String.init<A>(describing:)();
      unint64_t v38 = v37;
      uint64_t v39 = sub_683C(v36, v37, v63);
      uint64_t v40 = sub_ABED0(v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v40, v41, v35 + 4, v35 + 12);
      swift_bridgeObjectRelease(v38);
      sub_ABE84();
      sub_1E7D8(&dword_0, v54, v34, "Submitting Timer Disambiguation NLv4 dialog act: %s", v35);
      sub_1E7D0(v53);
      uint64_t v6 = v57;
      sub_1B904(v53);
      uint64_t v42 = (uint64_t)v35;
      uint64_t v5 = v58;
      sub_1B904(v42);
    }

    else
    {
      sub_ABE84();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v61);
    uint64_t v28 = ((uint64_t (*)(uint64_t, uint64_t))v33)(v61, v12);
  }

  uint64_t v43 = v59;
  uint64_t v44 = UUID.init()(v28);
  uint64_t v45 = UUID.uuidString.getter(v44);
  uint64_t v47 = v46;
  uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v62, v5);
  __chkstk_darwin(v48);
  v52[-2] = v45;
  v52[-1] = v47;
  uint64_t v49 = swift_bridgeObjectRetain(v43);
  uint64_t v50 = sub_A9358(v49, (void (*)(uint64_t, id))sub_ABBD0);
  swift_bridgeObjectRelease(v47);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v43);
  NLContextUpdate.rrEntities.setter(v50);
  sub_17E58();
}

void sub_AA774()
{
}

void sub_AA798()
{
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  sub_67C4(&qword_100520);
  sub_17B6C();
  __chkstk_darwin(v11);
  sub_ABD10();
  sub_ABF3C();
  __chkstk_darwin(v12);
  sub_433C4();
  sub_433B0();
  __chkstk_darwin(v13);
  sub_960C4();
  __chkstk_darwin(v14);
  sub_ABDA8();
  sub_AB8C8(v10);
  sub_AB978(v8, v6, v4);
  uint64_t v15 = sub_ABD88();
  if (v16)
  {
    sub_7C258(v15, &qword_100520);
  }

  else
  {
    sub_ABD58(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
    if (qword_FB380 != -1) {
      swift_once(&qword_FB380, sub_AAB60);
    }
    uint64_t v17 = sub_1BD34();
    sub_5474(v17, (uint64_t)qword_100508);
    uint64_t v18 = sub_ABD68();
    Logger.logObject.getter(v18);
    os_log_type_t v19 = sub_1BCD0();
    if (sub_434D0(v19))
    {
      uint64_t v20 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v26 = sub_1BA1C(32LL);
      *(_DWORD *)uint64_t v20 = 136315138;
      sub_ABE64();
      uint64_t v21 = sub_ABE00();
      uint64_t v23 = sub_ABDF4(v21, v22);
      uint64_t v24 = sub_ABED0(v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v24, v25, v20 + 4, v20 + 12);
      sub_17E70();
      sub_ABD2C();
      sub_1E7D8(&dword_0, v1, (os_log_type_t)v6, "Submitting NLv4 dialog act: %s", v20);
      sub_1E7D0(v26);
      sub_1B904(v26);
      sub_1B904((uint64_t)v20);
    }

    else
    {
      sub_ABD2C();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v2);
    sub_ABEF0();
  }

  sub_17E58();
}

void sub_AA984()
{
}

void sub_AA998()
{
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_67C4(&qword_100520);
  sub_17B6C();
  __chkstk_darwin(v7);
  sub_ABD10();
  sub_ABF3C();
  __chkstk_darwin(v8);
  sub_88184();
  __chkstk_darwin(v9);
  sub_960C4();
  __chkstk_darwin(v10);
  sub_ABDA8();
  uint64_t v11 = sub_AB8C8(v6);
  v4(v11);
  uint64_t v12 = sub_ABD88();
  if (v13)
  {
    sub_7C258(v12, &qword_100520);
  }

  else
  {
    sub_ABD58(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
    if (qword_FB380 != -1) {
      swift_once(&qword_FB380, sub_AAB60);
    }
    uint64_t v14 = sub_1BD34();
    sub_5474(v14, (uint64_t)qword_100508);
    uint64_t v15 = sub_ABD68();
    Logger.logObject.getter(v15);
    os_log_type_t v16 = sub_1BCD0();
    if (sub_434D0(v16))
    {
      uint64_t v17 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v25 = sub_1BA1C(32LL);
      *(_DWORD *)uint64_t v17 = 136315138;
      sub_ABE64();
      uint64_t v18 = sub_ABE00();
      uint64_t v20 = sub_ABDF4(v18, v19);
      uint64_t v21 = sub_ABDD8(v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v21, v22, v23, v24);
      sub_17E70();
      sub_ABD2C();
      sub_1E7D8(&dword_0, v1, (os_log_type_t)v6, "Submitting NLv4 dialog act: %s", v17);
      sub_1E7D0(v25);
      sub_1B904(v25);
      sub_1B904((uint64_t)v17);
    }

    else
    {
      sub_ABD2C();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v2);
    sub_ABEF0();
  }

  sub_17E58();
}

uint64_t sub_AAB60()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100508);
  sub_5474(v0, (uint64_t)qword_100508);
  return static SiriTimeLog.timerFlow.getter();
}

void sub_AABA8()
{
  qword_1011E8 = 0x644972656D6974LL;
  unk_1011F0 = 0xE700000000000000LL;
}

void sub_AABCC()
{
  qword_1011F8 = 0x62614C72656D6974LL;
  unk_101200 = 0xEA00000000006C65LL;
}

void sub_AABF4()
{
  unk_101217 = -18;
}

uint64_t sub_AAC24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_AAC5C + 4 * byte_C60F8[v14]))( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  a9,  a10,  a11,  a12,  a13,  a14);
}

void sub_AAC5C()
{
  uint64_t v0 = type metadata accessor for UsoTaskBuilder_summarise_common_Timer(0LL);
  sub_2B838(v0);
  uint64_t v1 = UsoTaskBuilder_summarise_common_Timer.init()();
  static DialogActBuilder.buildPromptConfirmationDialogActFrom(_:forDomain:)(v1, 0x72656D6954LL, 0xE500000000000000LL);
  sub_1BC50();
  sub_4C5D4();
}

char *sub_AAE78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OrdinalDisplayHintsBuilder(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v56 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_67C4(&qword_FF570);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for SemanticValue(0LL);
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v62 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v59 = (char *)&v52 - v11;
  uint64_t v12 = sub_67C4(&qword_100528);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DisplayHint(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v61 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  uint64_t v58 = (char *)&v52 - v19;
  unint64_t v55 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v37 = a1;
    }
    else {
      uint64_t v37 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v37);
    if (v20) {
      goto LABEL_3;
    }
LABEL_33:
    swift_bridgeObjectRelease(a1);
    uint64_t v14 = (char *)_swiftEmptyArrayStorage;
    uint64_t v64 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_34;
  }

  uint64_t v20 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  if (!v20) {
    goto LABEL_33;
  }
LABEL_3:
  if (v20 < 1)
  {
    __break(1u);
LABEL_49:
    swift_once(&qword_FB380, sub_AAB60);
    goto LABEL_42;
  }

  uint64_t v53 = v3;
  uint64_t v54 = v2;
  uint64_t v21 = 0LL;
  unint64_t v22 = a1 & 0xC000000000000001LL;
  uint64_t v64 = (char *)_swiftEmptyArrayStorage;
  uint64_t v57 = a1;
  uint64_t v60 = v20;
  do
  {
    if (v22) {
      id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v21, a1);
    }
    else {
      id v23 = *(id *)(a1 + 8 * v21 + 32);
    }
    uint64_t v24 = v23;
    sub_80BAC();

    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v14, 1LL, v15) == 1)
    {
      sub_DABC((uint64_t)v14, &qword_100528);
    }

    else
    {
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
      uint64_t v26 = v58;
      v25(v58, v14, v15);
      v25(v61, v26, v15);
      if ((swift_isUniquelyReferenced_nonNull_native(v64) & 1) == 0) {
        uint64_t v64 = (char *)sub_875FC(0, *((void *)v64 + 2) + 1LL, 1, (uint64_t)v64);
      }
      unint64_t v28 = *((void *)v64 + 2);
      unint64_t v27 = *((void *)v64 + 3);
      if (v28 >= v27 >> 1) {
        uint64_t v64 = (char *)sub_875FC(v27 > 1, v28 + 1, 1, (uint64_t)v64);
      }
      uint64_t v29 = v64;
      *((void *)v64 + 2) = v28 + 1;
      v25( &v29[((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))
           + *(void *)(v16 + 72) * v28],
        v61,
        v15);
      a1 = v57;
      uint64_t v20 = v60;
    }

    ++v21;
  }

  while (v20 != v21);
  swift_bridgeObjectRelease(a1);
  swift_bridgeObjectRetain(a1);
  uint64_t v30 = 0LL;
  uint64_t v14 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if (v22) {
      id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v30, a1);
    }
    else {
      id v31 = *(id *)(a1 + 8 * v30 + 32);
    }
    uint64_t v32 = v31;
    sub_80858((uint64_t)v7);

    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v7, 1LL, v8) == 1)
    {
      sub_DABC((uint64_t)v7, &qword_FF570);
    }

    else
    {
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v63 + 32);
      os_log_type_t v34 = v59;
      v33(v59, v7, v8);
      v33(v62, v34, v8);
      if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0) {
        uint64_t v14 = (char *)sub_87610(0, *((void *)v14 + 2) + 1LL, 1, (uint64_t)v14);
      }
      unint64_t v36 = *((void *)v14 + 2);
      unint64_t v35 = *((void *)v14 + 3);
      if (v36 >= v35 >> 1) {
        uint64_t v14 = (char *)sub_87610(v35 > 1, v36 + 1, 1, (uint64_t)v14);
      }
      *((void *)v14 + 2) = v36 + 1;
      v33( &v14[((*(unsigned __int8 *)(v63 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))
           + *(void *)(v63 + 72) * v36],
        v62,
        v8);
      uint64_t v20 = v60;
    }

    ++v30;
  }

  while (v20 != v30);
  swift_bridgeObjectRelease(a1);
  uint64_t v3 = v53;
  uint64_t v2 = v54;
LABEL_34:
  if (v55)
  {
    if (a1 < 0) {
      uint64_t v39 = a1;
    }
    else {
      uint64_t v39 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter(v39);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v38 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v38 == *((void *)v14 + 2)) {
    goto LABEL_45;
  }
  if (qword_FB380 != -1) {
    goto LABEL_49;
  }
LABEL_42:
  uint64_t v40 = type metadata accessor for Logger(0LL);
  uint64_t v41 = sub_5474(v40, (uint64_t)qword_100508);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
  os_log_type_t v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = v3;
    uint64_t v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v45 = 0;
    _os_log_impl( &dword_0,  v42,  v43,  "makeTimerDisplayHints: Incorrect label value count during conversion of timer hints",  v45,  2u);
    uint64_t v46 = v45;
    uint64_t v3 = v44;
    swift_slowDealloc(v46, -1LL, -1LL);
  }

LABEL_45:
  if (qword_FB398 != -1) {
    swift_once(&qword_FB398, sub_AABF4);
  }
  uint64_t v47 = qword_101208;
  uint64_t v48 = unk_101210;
  swift_bridgeObjectRetain(unk_101210);
  uint64_t v49 = v56;
  OrdinalDisplayHintsBuilder.init(referenceNode:)(v47, v48);
  uint64_t v50 = OrdinalDisplayHintsBuilder.build(for:)(v14);
  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v49, v2);
  uint64_t v65 = v64;
  sub_ABBD8(v50);
  return v65;
}

uint64_t sub_AB4AC()
{
  char v2 = v1;
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  if ((unint64_t)v0 >> 62)
  {
    if (v0 < 0) {
      uint64_t v17 = v0;
    }
    else {
      uint64_t v17 = v0 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v0);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
  }

  if (!v6) {
    goto LABEL_10;
  }
  uint64_t result = specialized ContiguousArray.reserveCapacity(_:)(v6);
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    uint64_t v8 = 0LL;
    do
    {
      if ((v3 & 0xC000000000000001LL) != 0) {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v3);
      }
      else {
        id v9 = sub_2BB50(v3 + 8 * v8);
      }
      uint64_t v10 = v9;
      ++v8;
      sub_CCB4();
      uint64_t v12 = sub_AB618(v5, v11);

      uint64_t v13 = sub_2BE54();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v13);
      uint64_t v14 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      uint64_t v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
      specialized ContiguousArray._endMutation()(v15);
    }

    while (v6 != v8);
LABEL_10:
    static Siri_Nlu_External_SystemDialogAct.buildDisambiguationDialogActFrom(_:includeBinaryPrompt:)( _swiftEmptyArrayStorage,  v2 & 1);
    sub_4C5D4();
    return swift_bridgeObjectRelease(v16);
  }

  __break(1u);
  return result;
}

uint64_t sub_AB5E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return sub_B69E0(a2, a3, a1, 0, a4);
}

#error "AB6BC: call analysis failed (funcsize=68)"
uint64_t sub_AB8C8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  NLContextUpdate.init()(a1);
  char v2 = sub_ABF6C();
  NLContextUpdate.weightedPromptTargetDomain.setter(v2);
  sub_ABF5C();
  NLContextUpdate.weightedPromptAbortValues.setter(&off_F2FB8);
  uint64_t v3 = swift_bridgeObjectRetain(a1);
  NLContextUpdate.weightedPromptResponseTargets.setter(v3);
  return NLContextUpdate.weightedPromptResponseOptions.setter(&off_F2FE8);
}

uint64_t sub_AB924()
{
  uint64_t v1 = sub_ABEA4();
  sub_2B838(v1);
  sub_882A4();
  uint64_t v2 = sub_ABF30();
  sub_2B838(v2);
  uint64_t v3 = sub_88284();
  dispatch thunk of Uso_VerbTemplateBuilder_Target.setTarget(value:)();
  sub_ABD3C(v0);
  sub_1E83C();
  return sub_ABDB8(v3);
}

uint64_t sub_AB978(uint64_t (*a1)(void), uint64_t (*a2)(void), void (*a3)(uint64_t))
{
  uint64_t v5 = a1(0LL);
  sub_2B838(v5);
  uint64_t v6 = a2();
  uint64_t v7 = type metadata accessor for UsoEntityBuilder_common_Timer(0LL);
  sub_2B838(v7);
  uint64_t v8 = sub_88284();
  uint64_t v9 = type metadata accessor for UsoEntityBuilder_common_Duration(0LL);
  sub_2B838(v9);
  uint64_t v10 = UsoEntityBuilder_common_Duration.init()();
  dispatch thunk of UsoEntityBuilder_common_Timer.setTotalDuration(value:)( v10,  &protocol witness table for UsoEntityBuilder_common_Duration);
  sub_1E84C();
  a3(v8);
  sub_ABD3C(v6);
  swift_release();
  return swift_release();
}

void sub_ABA2C()
{
}

uint64_t sub_ABA40()
{
  uint64_t v1 = sub_ABEA4();
  sub_2B838(v1);
  sub_882A4();
  uint64_t v2 = sub_ABF30();
  sub_2B838(v2);
  uint64_t v3 = sub_88284();
  dispatch thunk of UsoEntityBuilder_common_Timer.setName(value:)(0LL, 0xE000000000000000LL);
  dispatch thunk of Uso_VerbTemplateBuilder_Target.setTarget(value:)(v3);
  sub_ABD3C(v0);
  sub_1E83C();
  return sub_ABDB8(v3);
}

uint64_t sub_ABAA8(unsigned int *a1)
{
  uint64_t v2 = type metadata accessor for UsoEntity_common_UserEntity.DefinedValues(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_1C308();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for UsoEntityBuilder_common_UserEntity(0LL);
  sub_2B838(v7);
  uint64_t v8 = UsoEntityBuilder_common_UserEntity.init()();
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  UsoEntityBuilder_common_UserEntity.init()();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v6, *a1, v2);
  dispatch thunk of UsoEntityBuilder_common_UserEntity.setDefinedValue(value:)(v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v9 = swift_retain();
  dispatch thunk of UsoEntityBuilder_common_UserEntity.addAssociatedUserEntities(value:)( v9,  &protocol witness table for UsoEntityBuilder_common_UserEntity);
  sub_1E83C();
  uint64_t v10 = type metadata accessor for UsoTaskBuilder_noVerb_common_Setting(0LL);
  uint64_t v11 = sub_2B838(v10);
  UsoTaskBuilder_noVerb_common_Setting.init()();
  sub_ABE20();
  uint64_t v12 = swift_retain();
  dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.addUserEntities(value:)( v12,  &protocol witness table for UsoEntityBuilder_common_UserEntity);
  swift_release_n(v8, 2LL);
  sub_1E83C();
  return v11;
}

uint64_t sub_ABBD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_AB5E4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_ABBD8(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (!(_DWORD)result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v7 = v4 + v2;
    }
    else {
      uint64_t v7 = v4;
    }
    uint64_t result = sub_875FC(result, v7, 1, v3);
    uint64_t v3 = result;
  }

  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t result = type metadata accessor for DisplayHint(0LL);
  if (v9 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v10 = *(void *)(result - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t result = sub_87ED0(v6 + v11, v2, v3 + v11 + *(void *)(v10 + 72) * v8);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease(v6);
    *uint64_t v1 = v3;
    return result;
  }

  uint64_t v12 = *(void *)(v3 + 16);
  BOOL v13 = __OFADD__(v12, v2);
  uint64_t v14 = v12 + v2;
  if (!v13)
  {
    *(void *)(v3 + 16) = v14;
    goto LABEL_14;
  }

unint64_t sub_ABCCC()
{
  unint64_t result = qword_100538;
  if (!qword_100538)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___USOSerializedGraph);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100538);
  }

  return result;
}

uint64_t sub_ABD08@<X0>(uint64_t a1@<X8>)
{
  return swift_release(*(void *)(a1 - 256));
}

uint64_t sub_ABD10()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
}

uint64_t sub_ABD2C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_ABD3C(uint64_t a1)
{
  return static DialogActBuilder.buildPromptValueDialogActFrom(_:forDomain:)(a1, 0x72656D6954LL, 0xE500000000000000LL);
}

void sub_ABD50(uint64_t a1@<X8>)
{
}

uint64_t sub_ABD58@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a1(v3, v1, v2);
}

uint64_t sub_ABD68()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v3, v2, v1);
}

uint64_t sub_ABD80(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_ABD88()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v0, 1LL, v1);
}

  ;
}

uint64_t sub_ABDB8(uint64_t a1)
{
  return swift_release(a1);
}

uint64_t sub_ABDC4@<X0>(unint64_t a1@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1 > 1, v1 + 1, 1LL);
}

uint64_t sub_ABDD8(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_ABDF4(uint64_t a1, unint64_t a2)
{
  return sub_683C(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_ABE00()
{
  return String.init<A>(describing:)(v0);
}

uint64_t sub_ABE0C()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v0, 1LL, 1LL, v1);
}

uint64_t sub_ABE20()
{
  return v0;
}

uint64_t sub_ABE2C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_ABE40@<X0>(uint64_t a1@<X3>, unint64_t a2@<X8>)
{
  return sub_878D4(a2 > 1, v2, 1, a1);
}

uint64_t sub_ABE54()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_ABE64()
{
  return v3(v2, v1, v0);
}

uint64_t sub_ABE74()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(*(void *)(v0 - 256), 0LL);
}

uint64_t sub_ABE84()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_ABE94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a9, a2, v10, v9);
}

uint64_t sub_ABEA4()
{
  return type metadata accessor for UsoTaskBuilder_create_common_Timer(0LL);
}

  ;
}

uint64_t sub_ABEC8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

uint64_t sub_ABED0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_ABEE4()
{
  return sub_DABC(v1, v0);
}

uint64_t sub_ABEF0()
{
  return v0(v2, v1);
}

  ;
}

uint64_t sub_ABF10()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v0, v1);
}

BOOL sub_ABF1C@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_ABF30()
{
  return type metadata accessor for UsoEntityBuilder_common_Timer(0LL);
}

  ;
}

uint64_t sub_ABF50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 192))(a1, a2, v2);
}

uint64_t sub_ABF5C()
{
  return NLContextUpdate.weightedPromptStrict.setter(1LL);
}

void sub_ABF64()
{
}

unint64_t sub_ABF6C()
{
  return 0xD000000000000017LL;
}

uint64_t type metadata accessor for TimerBaseCATPatternsExecutor(uint64_t a1)
{
  return sub_DAF8(a1, (uint64_t *)&unk_100548, (uint64_t)&nominal type descriptor for TimerBaseCATPatternsExecutor);
}

uint64_t sub_ABF94(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_101218);
}

void sub_ABFD0()
{
  uint64_t v1 = sub_67C4(&qword_FBD98);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - v5;
  uint64_t v7 = sub_67C4(&qword_FBE20);
  uint64_t v8 = swift_allocObject(v7, 656LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_C45E0;
  *(void *)(v8 + 32) = 7368801LL;
  *(void *)(v8 + 40) = 0xE300000000000000LL;
  uint64_t v9 = *v0;
  if (*v0)
  {
    uint64_t v10 = type metadata accessor for SirikitApp(0LL);
    uint64_t v11 = v9;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
    *(void *)(v8 + 56) = 0LL;
    *(void *)(v8 + 64) = 0LL;
  }

  *(void *)(v8 + 48) = v11;
  *(void *)(v8 + 72) = v10;
  *(void *)(v8 + 80) = 0x6E69577473726966LL;
  *(void *)(v8 + 88) = 0xEF657A6953776F64LL;
  if ((v0[2] & 1) != 0)
  {
    uint64_t v12 = 0LL;
    *(void *)(v8 + 104) = 0LL;
    *(void *)(v8 + 112) = 0LL;
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v13 = v0[1];
    uint64_t v12 = &type metadata for Double;
  }

  *(void *)(v8 + 96) = v13;
  *(void *)(v8 + 120) = v12;
  strcpy((char *)(v8 + 128), "isConclusion");
  *(_BYTE *)(v8 + 141) = 0;
  *(_WORD *)(v8 + 142) = -5120;
  *(_BYTE *)(v8 + 144) = *((_BYTE *)v0 + 17);
  *(void *)(v8 + 168) = &type metadata for Bool;
  strcpy((char *)(v8 + 176), "isFirstWindow");
  *(_WORD *)(v8 + 190) = -4864;
  *(_BYTE *)(v8 + 192) = *((_BYTE *)v0 + 18);
  *(void *)(v8 + 216) = &type metadata for Bool;
  strcpy((char *)(v8 + 224), "isLastWindow");
  *(_BYTE *)(v8 + 237) = 0;
  *(_WORD *)(v8 + 238) = -5120;
  *(_BYTE *)(v8 + 240) = *((_BYTE *)v0 + 19);
  *(void *)(v8 + 264) = &type metadata for Bool;
  *(void *)(v8 + 272) = 0xD000000000000016LL;
  sub_7882C();
  *(void *)(v8 + 280) = v14;
  *(_BYTE *)(v8 + 288) = *((_BYTE *)v0 + 20);
  *(void *)(v8 + 312) = v15;
  *(void *)(v8 + 320) = 0x6D6F727065527369LL;
  *(void *)(v8 + 328) = 0xEA00000000007470LL;
  *(_BYTE *)(v8 + 336) = *((_BYTE *)v0 + 21);
  *(void *)(v8 + 360) = v15;
  *(void *)(v8 + 368) = 0x736D657469LL;
  *(void *)(v8 + 376) = 0xE500000000000000LL;
  uint64_t v16 = v0[3];
  uint64_t v17 = sub_67C4(&qword_FBE28);
  *(void *)(v8 + 384) = v16;
  *(void *)(v8 + 408) = v17;
  *(void *)(v8 + 416) = 0xD000000000000013LL;
  sub_7882C();
  *(void *)(v8 + 424) = v18;
  if ((v0[5] & 1) != 0)
  {
    uint64_t v19 = 0LL;
    *(void *)(v8 + 440) = 0LL;
    *(void *)(v8 + 448) = 0LL;
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = v0[4];
    uint64_t v19 = &type metadata for Double;
  }

  *(void *)(v8 + 432) = v20;
  *(void *)(v8 + 456) = v19;
  *(void *)(v8 + 464) = 0x6574496C61746F74LL;
  *(void *)(v8 + 472) = 0xEA0000000000736DLL;
  if ((v0[7] & 1) != 0)
  {
    uint64_t v21 = 0LL;
    *(void *)(v8 + 488) = 0LL;
    *(void *)(v8 + 496) = 0LL;
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v22 = v0[6];
    uint64_t v21 = &type metadata for Double;
  }

  *(void *)(v8 + 480) = v22;
  *(void *)(v8 + 504) = v21;
  *(void *)(v8 + 512) = 0x6174614477656976LL;
  *(void *)(v8 + 520) = 0xE800000000000000LL;
  id v23 = (int *)type metadata accessor for TimerBaseDisambiguationParameters(0LL);
  sub_32FC0((uint64_t)v0 + v23[14], (uint64_t)v6, &qword_FBD98);
  uint64_t v24 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v6, 1LL, v24) == 1)
  {
    swift_retain();
    swift_bridgeObjectRetain(v16);
    sub_DABC((uint64_t)v6, &qword_FBD98);
    *(_OWORD *)(v8 + 528) = 0u;
    *(_OWORD *)(v8 + 544) = 0u;
  }

  else
  {
    *(void *)(v8 + 552) = v24;
    uint64_t v25 = sub_DB90((void *)(v8 + 528));
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v24 - 8) + 32LL))(v25, v6, v24);
    swift_retain();
    swift_bridgeObjectRetain(v16);
  }

  *(void *)(v8 + 560) = 0xD000000000000018LL;
  *(void *)(v8 + 568) = 0x80000000000C9E20LL;
  sub_32FC0((uint64_t)v0 + v23[15], (uint64_t)v4, &qword_FBD98);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v4, 1LL, v24) == 1)
  {
    sub_DABC((uint64_t)v4, &qword_FBD98);
    *(_OWORD *)(v8 + 576) = 0u;
    *(_OWORD *)(v8 + 592) = 0u;
  }

  else
  {
    *(void *)(v8 + 600) = v24;
    uint64_t v26 = sub_DB90((void *)(v8 + 576));
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v24 - 8) + 32LL))(v26, v4, v24);
  }

  *(void *)(v8 + 608) = 0x6953776F646E6977LL;
  *(void *)(v8 + 616) = 0xEA0000000000657ALL;
  unint64_t v27 = (uint64_t *)((char *)v0 + v23[16]);
  if ((v27[1] & 1) != 0)
  {
    unint64_t v28 = 0LL;
    *(_OWORD *)(v8 + 632) = 0u;
    uint64_t v29 = 0LL;
  }

  else
  {
    uint64_t v29 = *v27;
    unint64_t v28 = &type metadata for Double;
  }

  *(void *)(v8 + 624) = v29;
  *(void *)(v8 + 648) = v28;
  sub_17E58();
}

uint64_t sub_AC43C()
{
  uint64_t v1 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_ADBDC;
  return sub_38068(0xD000000000000013LL, 0x80000000000C9E00LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_AC49C(char a1, char a2, char a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 40) = v15;
  *(void *)(v8 + 48) = v16;
  *(void *)(v8 + 24) = a7;
  *(void *)(v8 + 32) = a8;
  *(void *)(v8 + 16) = a6;
  *(_BYTE *)(v8 + 116) = a5;
  *(_BYTE *)(v8 + 115) = a4;
  *(_BYTE *)(v8 + 114) = a3;
  *(_BYTE *)(v8 + 113) = a2;
  *(_BYTE *)(v8 + 112) = a1;
  uint64_t v9 = sub_67C4(&qword_FBD98);
  *(void *)(v8 + 56) = sub_37EE0(v9);
  uint64_t v10 = type metadata accessor for TimerBaseDisambiguationParameters(0LL);
  *(void *)(v8 + 64) = v10;
  *(void *)(v8 + 72) = sub_37EE0(v10);
  sub_1B9B8();
  return swift_task_switch(v11, v12, v13);
}

uint64_t sub_AC518()
{
  uint64_t v1 = *(int **)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 16);
  char v31 = *(_BYTE *)(v0 + 115);
  char v32 = *(_BYTE *)(v0 + 116);
  char v4 = *(_BYTE *)(v0 + 114);
  char v5 = *(_BYTE *)(v0 + 113);
  char v6 = *(_BYTE *)(v0 + 112);
  uint64_t v7 = v2 + v1[14];
  uint64_t v8 = type metadata accessor for SpeakableString(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v7, 1LL, 1LL, v8);
  uint64_t v30 = v2 + v1[15];
  uint64_t v33 = v8;
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v30, 1LL, 1LL, v8);
  *(void *)uint64_t v2 = 0LL;
  *(void *)(v2 + 8) = 0LL;
  *(_BYTE *)(v2 + 16) = 1;
  *(_BYTE *)(v2 + 17) = v6;
  *(_BYTE *)(v2 + 18) = v5;
  *(_BYTE *)(v2 + 19) = v4;
  *(_BYTE *)(v2 + 20) = v31;
  *(_BYTE *)(v2 + 21) = v32;
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = 0LL;
  *(_BYTE *)(v2 + 40) = 1;
  *(void *)(v2 + 48) = 0LL;
  *(_BYTE *)(v2 + 56) = 1;
  uint64_t v9 = v2 + v1[16];
  *(void *)uint64_t v9 = 0LL;
  *(_BYTE *)(v9 + 8) = 1;
  type metadata accessor for SirikitApp(0LL);
  uint64_t v10 = qword_FB228;
  swift_bridgeObjectRetain(v3);
  if (v10 != -1) {
    swift_once(&qword_FB228, sub_66804);
  }
  uint64_t v11 = *(void **)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 56);
  uint64_t v13 = *(void *)(v0 + 48);
  uint64_t v14 = swift_retain();
  *uint64_t v11 = SirikitApp.init(app:)(v14);
  Swift::String v15 = Data.base64EncodedString(options:)(0LL);
  SpeakableString.init(serializedValue:)(v15._countAndFlagsBits, v15._object);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v12, 0LL, 1LL, v33);
  uint64_t v16 = sub_1B4F4(v12, v7);
  *(double *)(v2 + 48) = (double)v13;
  *(_BYTE *)(v2 + 56) = 0;
  uint64_t v17 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v16);

  Swift::String_optional v19 = AceObject.serializeToBase64()();
  if (v19.value._object)
  {
    uint64_t v20 = *(void *)(v0 + 56);
    SpeakableString.init(print:speak:)(v19.value._countAndFlagsBits, v19.value._object, 0LL, 0LL);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v20, 0LL, 1LL, v33);
    sub_1B4F4(v20, v30);
  }

  else
  {
    if (qword_FB2C0 != -1) {
      swift_once(&qword_FB2C0, sub_8F010);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    uint64_t v22 = sub_5474(v21, (uint64_t)qword_FF910);
    id v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "Error generating base64 action for 'windowPromptButtonAction'", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }
  }

  sub_ABFD0();
  uint64_t v27 = v26;
  *(void *)(v0 + 80) = v26;
  *(void *)(v0 + 88) = v28;
  *unint64_t v28 = v0;
  v28[1] = sub_AC838;
  return v34(0xD000000000000018LL, 0x80000000000C9790LL, v27);
}

uint64_t sub_AC838(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 80);
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease(v5);
  if (!v1) {
    *(void *)(v4 + 104) = a1;
  }
  sub_1B9B8();
  return swift_task_switch(v6, v7, v8);
}

uint64_t sub_AC8B0()
{
  return sub_2B748(*(void *)(v0 + 104), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_AC8FC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_AC948()
{
  *(void *)(v1 + 16) = v0;
  return sub_2B82C((uint64_t)sub_AC958);
}

uint64_t sub_AC958()
{
  uint64_t v1 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_AC9C4;
  return sub_38068(0x73614272656D6974LL, 0xEF726F7272652365LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_AC9C4()
{
  uint64_t v4 = sub_2B4F0(*(void *)(v3 + 24));
  if (!v1) {
    uint64_t v4 = v0;
  }
  return sub_2B748(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_AC9FC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return sub_2B82C((uint64_t)sub_ACA0C);
}

uint64_t sub_ACA0C()
{
  v0[2] = *(void *)(v0[4] + 64LL);
  uint64_t v1 = type metadata accessor for SearchTimerIntent(0LL);
  double v2 = IntentTargetable.knownHomePodCount.getter(v1, &protocol witness table for SearchTimerIntent);
  uint64_t v3 = sub_67C4(&qword_FBE20);
  uint64_t v4 = sub_2FB40(v3);
  sub_7882C();
  v5[4] = 0xD000000000000011LL;
  v5[5] = v6;
  v5[9] = &type metadata for Double;
  uint64_t v7 = sub_ADC08((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[5] = v4;
  *(_OWORD *)(v4 + 16) = v8;
  *(double *)(v4 + 48) = v2;
  uint64_t v9 = (void *)swift_task_alloc(v7);
  v0[6] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_ACAF0;
  uint64_t v10 = sub_ADBF4(0xD000000000000012LL);
  return v12(v10);
}

uint64_t sub_ACAF0()
{
  *uint64_t v4 = *v3;
  void v2[7] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease(v2[5]);
    _BYTE v2[8] = v0;
  }

  sub_1B9B8();
  return sub_20670();
}

uint64_t sub_ACB50()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 64));
}

uint64_t sub_ACB88()
{
  return sub_1ECD4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_ACBBC(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return sub_2B82C((uint64_t)sub_ACBD0);
}

uint64_t sub_ACBD0()
{
  *(void *)(v0 + 16) = 0LL;
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 32);
  *(_BYTE *)(v0 + 24) = 1;
  v1(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 16);
  int v3 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v4 = sub_67C4(&qword_FBE20);
  uint64_t v5 = sub_2FB40(v4);
  *(void *)(v0 + 56) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_C2640;
  sub_7882C();
  *(void *)(v6 + 32) = 0xD000000000000011LL;
  *(void *)(v6 + 40) = v7;
  if (v3 == 1)
  {
    __int128 v8 = 0LL;
    *(void *)(v5 + 56) = 0LL;
    *(void *)(v5 + 64) = 0LL;
    uint64_t v2 = 0LL;
  }

  else
  {
    __int128 v8 = &type metadata for Double;
  }

  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 72) = v8;
  uint64_t v9 = sub_ADC08((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v10 = (void *)swift_task_alloc(v9);
  *(void *)(v0 + 64) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_ACCC4;
  uint64_t v11 = sub_ADBF4(0xD000000000000012LL);
  return v13(v11);
}

uint64_t sub_ACCC4()
{
  uint64_t v4 = v2[8];
  *uint64_t v5 = *v3;
  void v2[9] = v1;
  swift_task_dealloc(v4);
  if (!v1)
  {
    swift_bridgeObjectRelease(v2[7]);
    v2[10] = v0;
  }

  sub_1B9B8();
  return sub_20670();
}

uint64_t sub_ACD24()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 80));
}

uint64_t sub_ACD34()
{
  return sub_1ECD4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_ACD60()
{
  uint64_t v1 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_ADBDC;
  return sub_38068(0xD000000000000012LL, 0x80000000000C9DA0LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_ACDC0()
{
  uint64_t v1 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_ACE20;
  return sub_38068(0xD000000000000025LL, 0x80000000000C9D70LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_ACE20()
{
  uint64_t v4 = sub_2B4F0(*(void *)(v3 + 16));
  if (!v1) {
    uint64_t v4 = v0;
  }
  return sub_2B748(v4, *(uint64_t (**)(void))(v2 + 8));
}

void sub_ACE58(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_ACEA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_67C4(&qword_FB530);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_32FC0(a1, (uint64_t)v12, &qword_FB530);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  CATWrapper.init(templateDir:options:globals:)(v12, v9, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_DABC(a1, &qword_FB530);
  sub_17E58();
}

uint64_t type metadata accessor for TimerBaseDisambiguationParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_100628, (uint64_t)&nominal type descriptor for TimerBaseDisambiguationParameters);
}

uint64_t sub_ACFBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimerBaseDisambiguationParameters(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_ACFF8(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16LL) & ~(unint64_t)v3);
    swift_retain();
  }

  else
  {
    uint64_t v7 = a1;
    *(void *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_DWORD *)(a1 + 17) = *(_DWORD *)((char *)a2 + 17);
    *(_BYTE *)(a1 + 21) = *((_BYTE *)a2 + 21);
    uint64_t v9 = a2[3];
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v8;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
    *(void *)(a1 + 48) = a2[6];
    uint64_t v10 = a3[14];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for SpeakableString(0LL);
    swift_retain();
    swift_bridgeObjectRetain(v9);
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v12, 1LL, v13))
    {
      uint64_t v14 = sub_67C4(&qword_FBD98);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v11, 0LL, 1LL, v13);
    }

    uint64_t v15 = a3[15];
    uint64_t v16 = (void *)(v7 + v15);
    uint64_t v17 = (char *)a2 + v15;
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)a2 + v15, 1LL, v13))
    {
      uint64_t v18 = sub_67C4(&qword_FBD98);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v16, v17, v13);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v16, 0LL, 1LL, v13);
    }

    uint64_t v19 = a3[16];
    uint64_t v20 = v7 + v19;
    uint64_t v21 = (uint64_t)a2 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  }

  return v7;
}

uint64_t sub_AD1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = type metadata accessor for SpeakableString(0LL);
  uint64_t v6 = a1 + *(int *)(a2 + 60);
  uint64_t result = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v6, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v6, v5);
  }
  return result;
}

uint64_t sub_AD270(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 17) = *(_DWORD *)(a2 + 17);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 48) = v9;
  uint64_t v10 = a3[14];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for SpeakableString(0LL);
  swift_retain();
  swift_bridgeObjectRetain(v8);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v12, 1LL, v13))
  {
    uint64_t v14 = sub_67C4(&qword_FBD98);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v11, 0LL, 1LL, v13);
  }

  uint64_t v15 = a3[15];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a2 + v15, 1LL, v13))
  {
    uint64_t v18 = sub_67C4(&qword_FBD98);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v16, v17, v13);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v16, 0LL, 1LL, v13);
  }

  uint64_t v19 = a3[16];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(void *)uint64_t v20 = *(void *)v21;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  return a1;
}

uint64_t sub_AD408(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 48) = v10;
  uint64_t v11 = a3[14];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = type metadata accessor for SpeakableString(0LL);
  int v15 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v12, 1LL, v14);
  int v16 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v14);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 0LL, 1LL, v14);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v17 = *(void *)(v14 - 8);
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v12, v14);
LABEL_6:
    uint64_t v18 = sub_67C4(&qword_FBD98);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, const void *, uint64_t))(v17 + 24))(v12, v13, v14);
LABEL_7:
  uint64_t v19 = a3[15];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  int v22 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1 + v19, 1LL, v14);
  int v23 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v21, 1LL, v14);
  if (!v22)
  {
    uint64_t v24 = *(void *)(v14 - 8);
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(v24 + 24))(v20, v21, v14);
      goto LABEL_13;
    }

    (*(void (**)(void *, uint64_t))(v24 + 8))(v20, v14);
    goto LABEL_12;
  }

  if (v23)
  {
LABEL_12:
    uint64_t v25 = sub_67C4(&qword_FBD98);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v20, v21, v14);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v20, 0LL, 1LL, v14);
LABEL_13:
  uint64_t v26 = a3[16];
  uint64_t v27 = a1 + v26;
  unint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v29 = *v28;
  *(_BYTE *)(v27 + 8) = *((_BYTE *)v28 + 8);
  *(void *)uint64_t v27 = v29;
  return a1;
}

uint64_t sub_AD668(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(a1 + 17) = *(_DWORD *)(a2 + 17);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = a3[14];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for SpeakableString(0LL);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v11, 1LL, v12))
  {
    uint64_t v13 = sub_67C4(&qword_FBD98);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v10, 0LL, 1LL, v12);
  }

  uint64_t v14 = a3[15];
  int v15 = (void *)(a1 + v14);
  int v16 = (const void *)(a2 + v14);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a2 + v14, 1LL, v12))
  {
    uint64_t v17 = sub_67C4(&qword_FBD98);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v15, v16, v12);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v15, 0LL, 1LL, v12);
  }

  uint64_t v18 = a3[16];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(void *)uint64_t v19 = *(void *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  return a1;
}

uint64_t sub_AD7E8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  uint64_t v7 = a3[14];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for SpeakableString(0LL);
  int v11 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v8, 1LL, v10);
  int v12 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v9, 1LL, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v8, 0LL, 1LL, v10);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_67C4(&qword_FBD98);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[15];
  int v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  int v18 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1 + v15, 1LL, v10);
  int v19 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0((uint64_t)v17, 1LL, v10);
  if (!v18)
  {
    uint64_t v20 = *(void *)(v10 - 8);
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(v20 + 40))(v16, v17, v10);
      goto LABEL_13;
    }

    (*(void (**)(void *, uint64_t))(v20 + 8))(v16, v10);
    goto LABEL_12;
  }

  if (v19)
  {
LABEL_12:
    uint64_t v21 = sub_67C4(&qword_FBD98);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v16, v17, v10);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v16, 0LL, 1LL, v10);
LABEL_13:
  uint64_t v22 = a3[16];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  return a1;
}

uint64_t sub_ADA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_ADA44);
}

uint64_t sub_ADA44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_67C4(&qword_FBD98);
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1 + *(int *)(a3 + 56), a2, v8);
  }

uint64_t sub_ADABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_ADAC8);
}

uint64_t sub_ADAC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_67C4(&qword_FBD98);
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v5 + *(int *)(a4 + 56), a2, a2, v7);
  }

  return result;
}

void sub_ADB38(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = &unk_C61D0;
  void v4[2] = &unk_C61E8;
  void v4[3] = &unk_C61E8;
  void v4[4] = &unk_C61E8;
  v4[5] = &unk_C61E8;
  void v4[6] = &unk_C61E8;
  v4[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[8] = &unk_C61D0;
  v4[9] = &unk_C61D0;
  sub_367C0(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v5 = *(void *)(v2 - 8) + 64LL;
    uint64_t v6 = v5;
    uint64_t v7 = &unk_C61D0;
    swift_initStructMetadata(a1, 256LL, 13LL, v4, a1 + 16);
  }

uint64_t sub_ADBE0()
{
  return sub_ACFBC(*(void *)(v0 + 72));
}

uint64_t sub_ADBF4@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_ADC08@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned int *)(a1 + 4);
}

void sub_ADC1C()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_ADC30()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100690);
  sub_5474(v0, (uint64_t)qword_100690);
  return static SiriTimeLog.timerPlugin.getter();
}

id sub_ADC78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  id result = sub_ADCA0(a1);
  *a2 = v4;
  return result;
}

id sub_ADCA0(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v11 = a1;
    }
    else {
      uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_33E50();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v11);
    sub_2B7C4();
    if (v12 >= 2)
    {
LABEL_3:
      if (qword_FB3A0 != -1) {
        swift_once(&qword_FB3A0, sub_ADC30);
      }
      uint64_t v3 = type metadata accessor for Logger(0LL);
      uint64_t v4 = sub_5474(v3, (uint64_t)qword_100690);
      uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
      os_log_type_t v6 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl( &dword_0,  v5,  v6,  "Disambiguation selection returned multiple choices. Using original targetTimer with shouldMatchAny = true",  v7,  2u);
        swift_slowDealloc(v7, -1LL, -1LL);
      }

      id v8 = [v14 targetTimer];
      if (v8)
      {
        uint64_t v9 = v8;
        sub_1E6A8();
        v10.super.super.Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
        [v9 setShouldMatchAny:v10.super.super.isa];

LABEL_18:
        return v14;
      }

      return v14;
    }

    sub_33E50();
    unint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v11);
    sub_2B7C4();
  }

  else
  {
    unint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    if (v2 > 1) {
      goto LABEL_3;
    }
  }

  if (v2)
  {
    sub_8EEB4(0LL, (a1 & 0xC000000000000001LL) == 0, a1);
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      sub_33E50();
      v10.super.super.Class isa = (Class)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a1);
      sub_2B7C4();
    }

    else
    {
      v10.super.super.Class isa = (Class)*(id *)(a1 + 32);
    }

    [v14 setTargetTimer:v10.super.super.isa];
    goto LABEL_18;
  }

  return v14;
}

uint64_t RecreateDeletedTimerFlow.__allocating_init()()
{
  uint64_t v0 = type metadata accessor for SiriTimerManagerImpl(0LL);
  sub_2B838(v0);
  uint64_t v1 = SiriTimerManagerImpl.init()();
  id v2 = [objc_allocWithZone(MTTimerManager) init];
  uint64_t v3 = type metadata accessor for RecreateDeletedTimerFlow(0LL);
  uint64_t v4 = sub_2B838(v3);
  return sub_B30E8(v1, (uint64_t)v2, v4);
}

uint64_t type metadata accessor for RecreateDeletedTimerFlow(uint64_t a1)
{
  uint64_t result = qword_100718;
  if (!qword_100718) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RecreateDeletedTimerFlow);
  }
  return result;
}

void sub_ADF28(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  sub_87FFC();
  id v4 = a2;
  v3();
  sub_1BC50();
}

uint64_t sub_ADF70()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_1006A8);
  sub_5474(v0, (uint64_t)qword_1006A8);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_ADFB8(uint64_t a1)
{
  return sub_4DED8( a1,  (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.TaskType,  qword_101228,  &enum case for SiriTimeEventSender.TaskType.undoDeleteTimer(_:));
}

uint64_t sub_ADFD4(uint64_t a1)
{
  return sub_4DED8( a1,  (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.Attribute,  qword_101240,  &enum case for SiriTimeEventSender.Attribute.corrections(_:));
}

uint64_t RecreateDeletedTimerFlow.on(input:)()
{
  uint64_t v95 = v2;
  uint64_t v3 = type metadata accessor for DirectInvocationUtils.Timer.URI(0LL);
  uint64_t v98 = *(void *)(v3 - 8);
  uint64_t v99 = v3;
  __chkstk_darwin(v3);
  sub_17D14();
  uint64_t v97 = v4;
  uint64_t v101 = type metadata accessor for DirectInvocationUtils.Timer.UserInfoKey(0LL);
  uint64_t v5 = *(void *)(v101 - 8);
  uint64_t v6 = __chkstk_darwin(v101);
  uint64_t v100 = (char *)v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  NSNumber v10 = (char *)v89 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v89 - v11;
  uint64_t v13 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = sub_B38B4();
  uint64_t v16 = type metadata accessor for Parse(v15);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Input.parse.getter(v18);
  if ((*(unsigned int (**)(char *, uint64_t))(v17 + 88))(v20, v16) != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    return 0LL;
  }

  sub_433D8((uint64_t)v20, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 96));
  uint64_t v21 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v0, v20, v13);
  uint64_t v22 = Parse.DirectInvocation.userData.getter(v21);
  uint64_t v23 = v13;
  if (!v22)
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v13);
    return 0LL;
  }

  uint64_t v24 = v22;
  uint64_t v93 = v14;
  uint64_t v94 = v0;
  uint64_t v25 = *(uint64_t (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v26 = v25(v12, enum case for DirectInvocationUtils.Timer.UserInfoKey.verb(_:), v101);
  DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v26);
  uint64_t v27 = v24;
  sub_21638((uint64_t)v12);
  sub_B3888();
  uint64_t v28 = sub_18034();
  if (!v105) {
    goto LABEL_12;
  }
  if ((sub_B3798(v28, v29, v30, (uint64_t)&type metadata for String) & 1) == 0)
  {
LABEL_13:
    sub_2B7C4();
    goto LABEL_14;
  }

  int v31 = sub_7E238(v102, v103);
  if (v31 == 19)
  {
    sub_17D54(v94, *(uint64_t (**)(uint64_t, uint64_t))(v93 + 8));
    sub_2B7C4();
    return 0LL;
  }

  int v32 = v31;
  uint64_t v33 = v25(v10, enum case for DirectInvocationUtils.Timer.UserInfoKey.usoEntity(_:), v101);
  DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v33);
  sub_21638((uint64_t)v10);
  sub_B3888();
  uint64_t v34 = sub_18034();
  if (!v105)
  {
LABEL_12:
    sub_2B7C4();
    sub_8CC4((uint64_t)v104, &qword_FCD20);
LABEL_14:
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v94, v23);
    return 0LL;
  }

  int v92 = v32;
  uint64_t v38 = v102;
  unint64_t v37 = v103;
  uint64_t v39 = type metadata accessor for JSONDecoder(0LL);
  sub_2B838(v39);
  JSONDecoder.init()();
  uint64_t v40 = type metadata accessor for UsoEntity(0LL);
  sub_11718( (unint64_t *)&unk_FEC40,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity,  (uint64_t)&protocol conformance descriptor for UsoEntity);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v104, v40, v38, v37, v40, v41);
  uint64_t v91 = v38;
  sub_1BC50();
  uint64_t v43 = v104[0];
  uint64_t v44 = type metadata accessor for UsoEntity_common_Timer(0LL);
  uint64_t v45 = sub_87FFC();
  static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)(v104, v45, v44, v44);
  sub_1BC50();
  uint64_t v46 = v104[0];
  if (!v104[0])
  {
    sub_17CD0();
    sub_21470(v91, v37);
    sub_1BC50();
    goto LABEL_14;
  }

  v89[1] = v43;
  unint64_t v90 = v37;
  uint64_t v47 = (uint64_t)v100;
  uint64_t v48 = v25(v100, enum case for DirectInvocationUtils.Timer.UserInfoKey.paused(_:), v101);
  DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(v48);
  uint64_t v50 = v49;
  sub_21638(v47);
  uint64_t v51 = sub_2BFC4();
  sub_1C318(v51, v52, v27, v53);
  uint64_t v54 = swift_bridgeObjectRelease(v50);
  if (!v105)
  {
    sub_2B7C4();
    sub_21470(v91, v90);
    sub_B3900();
    swift_release();
    sub_8CC4((uint64_t)v104, &qword_FCD20);
    uint64_t v58 = v94;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v58, v23);
    return 0LL;
  }

  uint64_t v57 = sub_B3798(v54, v55, v56, (uint64_t)&type metadata for Bool);
  uint64_t v58 = v94;
  unint64_t v59 = v90;
  if ((v57 & 1) == 0)
  {
    sub_2B7C4();
    sub_21470(v91, v59);
    sub_B3900();
    swift_release();
    goto LABEL_28;
  }

  uint64_t v101 = v46;
  char v60 = v102;
  uint64_t v61 = Parse.DirectInvocation.identifier.getter(v57);
  uint64_t v63 = v62;
  uint64_t v65 = v97;
  uint64_t v64 = v98;
  uint64_t v66 = v99;
  uint64_t v67 = sub_3822C( v97,  enum case for DirectInvocationUtils.Timer.URI.undo(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v98 + 104));
  uint64_t v68 = DirectInvocationUtils.Timer.URI.rawValue.getter(v67);
  uint64_t v70 = v69;
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v65, v66);
  if (v61 == v68 && v63 == v70)
  {
    swift_bridgeObjectRelease_n(v63, 2LL);
    uint64_t v73 = v91;
  }

  else
  {
    char v72 = _stringCompareWithSmolCheck(_:_:expecting:)(v61, v63, v68, v70, 0LL);
    swift_bridgeObjectRelease(v70);
    swift_bridgeObjectRelease(v63);
    uint64_t v73 = v91;
    if ((v72 & 1) == 0)
    {
      sub_17D54(v94, *(uint64_t (**)(uint64_t, uint64_t))(v93 + 8));
      uint64_t v74 = v73;
      unint64_t v75 = v90;
LABEL_36:
      sub_21470(v74, v75);
      sub_17CD0();
      swift_release();
      sub_B3900();
      return 0LL;
    }
  }

  uint64_t v76 = sub_7010(v92);
  BOOL v78 = v76 == 0x657461657263LL && v77 == 0xE600000000000000LL;
  uint64_t v80 = v93;
  uint64_t v79 = v94;
  unint64_t v81 = v90;
  if (v78)
  {
    sub_2B7C4();
  }

  else
  {
    char v82 = _stringCompareWithSmolCheck(_:_:expecting:)(v76, v77, 0x657461657263LL, 0xE600000000000000LL, 0LL);
    sub_2B7C4();
    if ((v82 & 1) == 0)
    {
      sub_17D54(v79, *(uint64_t (**)(uint64_t, uint64_t))(v80 + 8));
      uint64_t v74 = v73;
      unint64_t v75 = v81;
      goto LABEL_36;
    }
  }

  uint64_t v83 = v96;
  *((void *)v96 + 11) = v101;
  swift_retain();
  sub_2B750();
  *((_BYTE *)v83 + 96) = v60;
  uint64_t v84 = v95;
  sub_A3B94(v27, v95);
  sub_17CD0();
  uint64_t v85 = (uint64_t)v83 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin24RecreateDeletedTimerFlow_followupPluginAction;
  sub_B3820( (uint64_t)v83 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin24RecreateDeletedTimerFlow_followupPluginAction,  (uint64_t)v104,  33LL);
  sub_5913C(v84, v85, &qword_FD740);
  swift_endAccess(v104);
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v86 = sub_1BD34();
  sub_39658(v86, (uint64_t)qword_1006A8);
  os_log_type_t v87 = sub_1BCD0();
  if (sub_1BB80(v87))
  {
    uint64_t v88 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v88 = 0;
    sub_1BBEC(&dword_0, v83, (os_log_type_t)v85, "RecreateDeletedTimerFlow accepting input.", v88);
    sub_1B904((uint64_t)v88);
  }

  sub_21470(v73, v81);

  sub_B3900();
  swift_release();
  sub_17D54(v79, *(uint64_t (**)(uint64_t, uint64_t))(v80 + 8));
  return 1LL;
}

uint64_t RecreateDeletedTimerFlow.execute()(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  uint64_t v3 = sub_67C4(&qword_FD740);
  v2[23] = sub_1B6C8(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for PluginAction(0LL);
  v2[24] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[25] = v5;
  v2[26] = sub_1B6C8(v5);
  uint64_t v6 = sub_5A13C();
  v2[27] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[28] = v7;
  v2[29] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[30] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[31] = v9;
  v2[32] = sub_1B6C8(v9);
  uint64_t v10 = sub_67C4(&qword_FBFC8);
  v2[33] = sub_1B6C8(*(void *)(v10 - 8));
  uint64_t v11 = sub_67C4(&qword_FBFD0);
  v2[34] = sub_1B6C8(*(void *)(v11 - 8));
  uint64_t v12 = sub_67C4(&qword_FBFD8);
  v2[35] = sub_1B6C8(*(void *)(v12 - 8));
  uint64_t v13 = sub_A9080();
  v2[36] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[37] = v14;
  v2[38] = sub_1B6C8(v14);
  uint64_t v15 = sub_A9078();
  v2[39] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[40] = v16;
  v2[41] = sub_1B6C8(v16);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_AE7FC()
{
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v2 = sub_1BD34();
  uint64_t v3 = (os_log_s *)sub_5474(v2, (uint64_t)qword_1006A8);
  Logger.logObject.getter(v3);
  os_log_type_t v4 = sub_1BCD0();
  if (sub_2B854(v4))
  {
    uint64_t v5 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v5 = 0;
    sub_1BBEC(&dword_0, v3, v0, "In RecreateDeletedTimerFlow async execute()", v5);
    sub_1B904((uint64_t)v5);
  }

  uint64_t v6 = v1[40];

  uint64_t v7 = sub_B3948( enum case for ActivityType.correction(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104));
  if (qword_FB3B0 != -1) {
    uint64_t v7 = swift_once(&qword_FB3B0, sub_ADFB8);
  }
  uint64_t v8 = v1[35];
  sub_A8D9C(v7, (uint64_t)qword_101228);
  uint64_t v9 = sub_A8F44();
  sub_44FF8(v8, v10, v11, v9);
  if (qword_FB3B8 != -1) {
    swift_once(&qword_FB3B8, sub_ADFD4);
  }
  uint64_t v12 = v1[41];
  uint64_t v65 = v1[40];
  uint64_t v13 = v1[34];
  uint64_t v14 = v1[33];
  uint64_t v15 = v1[27];
  uint64_t v64 = v1[22];
  uint64_t v16 = type metadata accessor for SiriTimeEventSender.Attribute(0LL);
  uint64_t v17 = sub_5474(v16, (uint64_t)qword_101240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL))(v13, v17, v16);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v13, 0LL, 1LL, v16);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v14, 1LL, 1LL, v15);
  uint64_t v18 = sub_B3714(v12);
  sub_A9088(v18, &qword_FBFC8);
  sub_436E4(v19, &qword_FBFD0);
  sub_99824(v20, &qword_FBFD8);
  sub_B3740();
  sub_9CB6C(v65);
  uint64_t v21 = *(void *)(v64 + 88);
  v1[42] = v21;
  if (v21)
  {
    uint64_t v22 = v1[31];
    uint64_t v23 = sub_34D60((uint64_t)&unk_F6B08, 17LL);
    v1[43] = v23;
    *(_BYTE *)(v23 + 16) = 0;
    uint64_t v24 = sub_34D60((uint64_t)&unk_F6B30, 24LL);
    v1[44] = v24;
    *(void *)(v24 + 16) = 0LL;
    uint64_t v25 = sub_5BDA4();
    static SiriTimeFeatureFlagsImpl.instance.getter(v25);
    Swift::Bool v26 = SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()();
    sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
    uint64_t v27 = v1[22];
    if (v26)
    {
      uint64_t v28 = (void *)sub_5A248();
      v1[45] = v28;
      v28[2] = v27;
      v28[3] = v21;
      v28[4] = v23;
      v28[5] = v24;
      uint64_t v29 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
      v1[46] = v29;
      *uint64_t v29 = v1;
      v29[1] = sub_AECF0;
LABEL_20:
      sub_1B9B8();
      sub_20788();
      return withCheckedContinuation<A>(isolation:function:_:)(v48, v49, v50, v51, v52, v53, v54, v55);
    }

    uint64_t v36 = v27 + 40;
    sub_54CC(v27 + 40, (uint64_t)(v1 + 2));
    uint64_t v37 = v1[5];
    uint64_t v38 = v1[6];
    sub_8CFC(v1 + 2, v37);
    valid = (void *)dispatch thunk of SiriTimerManagerIOS.getCurrentValidTimer()(v37, v38);

    _s20HandleIntentStrategyVwxx_0(v1 + 2);
    if (!valid) {
      goto LABEL_19;
    }
    sub_B3960();
    os_log_type_t v40 = sub_1BCD0();
    if (os_log_type_enabled((os_log_t)valid, v40))
    {
      uint64_t v41 = (uint8_t *)sub_1B9DC();
      *(_WORD *)uint64_t v41 = 0;
      sub_1BBEC( &dword_0,  (os_log_s *)valid,  v40,  "We have an existing valid timer. This is unexpected. Attempting to stop current timer.",  v41);
      sub_1B904((uint64_t)v41);
    }

    sub_54CC(v36, (uint64_t)(v1 + 7));
    uint64_t v42 = v1[10];
    uint64_t v43 = v1[11];
    sub_8CFC(v1 + 7, v42);
    char v44 = dispatch thunk of SiriTimerManagerIOS.stopCurrentTimerSync()(v42, v43);
    _s20HandleIntentStrategyVwxx_0(v1 + 7);
    if ((v44 & 1) != 0)
    {
LABEL_19:
      uint64_t v45 = v1[22];
      uint64_t v46 = (void *)sub_5A248();
      v1[48] = v46;
      v46[2] = v45;
      v46[3] = v21;
      v46[4] = v24;
      v46[5] = v23;
      uint64_t v47 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
      v1[49] = v47;
      *uint64_t v47 = v1;
      v47[1] = sub_AEE5C;
      goto LABEL_20;
    }

    sub_B3960();
    os_log_type_t v57 = sub_32A5C();
    if (sub_1BB80(v57))
    {
      uint64_t v58 = (_WORD *)sub_1B9DC();
      sub_2BA04(v58);
      sub_1BAA8(&dword_0, v59, v60, "Failed to stop current timer using siriTimerManager.stopCurrentTimerSync");
      sub_1B904(v21);
    }

    sub_B3954();
    sub_59C1C(v61, enum case for SiriTimeEventSender.ReasonDescription.failedToStopCurrentTimer(_:));
    uint64_t v35 = (void *)swift_task_alloc(dword_1006D4);
    v1[47] = v35;
  }

  else
  {
    sub_B3960();
    os_log_type_t v30 = sub_32A5C();
    if (sub_1BB80(v30))
    {
      int v31 = (_WORD *)sub_1B9DC();
      sub_2BA04(v31);
      sub_1BAA8( &dword_0,  v32,  v33,  "timerUsoEntity is nil! RecreateDeletedTimerFlow execute() has no timer to recreate.");
      sub_1B904(0LL);
    }

    sub_B3954();
    sub_59C1C(v34, enum case for SiriTimeEventSender.ReasonDescription.noTimerToCreate(_:));
    uint64_t v35 = (void *)swift_task_alloc(dword_1006D4);
    v1[53] = v35;
  }

  sub_B3914(v35);
  sub_20788();
  return sub_B0378(v62, v63);
}

uint64_t sub_AECF0()
{
  return sub_1B758();
}

uint64_t sub_AED28()
{
  uint64_t v1 = v0[44];
  sub_B3820(v1 + 16, (uint64_t)(v0 + 12), 0LL);
  uint64_t v2 = *(void **)(v1 + 16);
  v0[50] = (uint64_t)v2;
  if (v2)
  {
    uint64_t v3 = v0[43];
    sub_B3820(v3 + 16, (uint64_t)(v0 + 15), 0LL);
    char v4 = *(_BYTE *)(v3 + 16);
    uint64_t v5 = dword_1006DC;
    id v6 = v2;
    uint64_t v7 = (uint64_t **)swift_task_alloc(v5);
    v0[51] = (uint64_t)v7;
    *uint64_t v7 = v0;
    v7[1] = (uint64_t *)sub_AEE94;
    return sub_B0984((uint64_t)v6, v4);
  }

  else
  {
    sub_A9000(v0[28]);
    uint64_t v9 = (void *)swift_task_alloc(dword_1006D4);
    v0[52] = (uint64_t)v9;
    uint64_t v10 = sub_B3914(v9);
    return sub_B0378(v10, v11);
  }

uint64_t sub_AEE10()
{
  uint64_t v1 = *(void *)(v0 + 224);
  sub_2B4F0(*(void *)(v0 + 376));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_1B9B8();
  return sub_2F414(v2, v3, v4);
}

uint64_t sub_AEE5C()
{
  return sub_1B758();
}

uint64_t sub_AEE94()
{
  return sub_1B758();
}

uint64_t sub_AEEC8()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  sub_B3820( *(void *)(v0 + 176) + OBJC_IVAR____TtC23TimerFlowDelegatePlugin24RecreateDeletedTimerFlow_followupPluginAction,  v0 + 144,  0LL);
  uint64_t v3 = sub_5A3C8();
  sub_59624(v3, v4, v5);
  int v6 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v1, 1LL, v2);
  uint64_t v7 = *(void **)(v0 + 400);
  if (v6 == 1)
  {
    uint64_t v8 = *(void *)(v0 + 184);

    sub_8CC4(v8, &qword_FD740);
    static ExecuteResponse.complete()(v9);
    sub_2B750();
  }

  else
  {
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 208);
    (*(void (**)(uint64_t, void, void))(v11 + 32))(v10, *(void *)(v0 + 184), *(void *)(v0 + 192));
    static ExecuteResponse.redirect(nextPluginAction:)(v10);
    swift_release();

    sub_433D8(v10, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  }

  sub_2B750();
  sub_1BC50();
  sub_B3800();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  return sub_A8C30(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_AEFEC()
{
  uint64_t v1 = *(void *)(v0 + 224);
  sub_2B4F0(*(void *)(v0 + 416));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_1B9B8();
  return sub_2F414(v2, v3, v4);
}

uint64_t sub_AF038()
{
  return sub_A8C30(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_AF09C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(v3 + 224);
  sub_1BC0C(&v3);
  swift_task_dealloc();
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  return sub_A8C30((uint64_t (*)(void))v0[1]);
}

void sub_AF130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v42 = a4;
  uint64_t v8 = sub_67C4(&qword_100500);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (*(_BYTE *)(a2 + 96)) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = 3LL;
  }
  UsoEntity_common_Timer.remainingTime.getter();
  id v43 = [objc_allocWithZone(MTMutableTimer) initWithState:v12 duration:v13];
  UsoEntity_common_Timer.label.getter();
  NSString v15 = v14;
  if (v14)
  {
    id v16 = [v14 spokenPhrase];

    static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v18 = v17;

    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
  }

  [v43 setTitle:v15];

  id v19 = [*(id *)(a2 + 80) addTimer:v43];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v41((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1, v8);
    uint64_t v21 = a5;
    uint64_t v22 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v39 = a1;
    uint64_t v23 = (v22 + 48) & ~v22;
    uint64_t v40 = v22 | 7;
    uint64_t v24 = (char *)swift_allocObject(&unk_F6B58, v23 + v10, v22 | 7);
    uint64_t v37 = v10;
    uint64_t v25 = v8;
    uint64_t v26 = v42;
    *((void *)v24 + 2) = v43;
    *((void *)v24 + 3) = v26;
    *((void *)v24 + 4) = a2;
    *((void *)v24 + 5) = v21;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v38(&v24[v23], v11, v25);
    uint64_t v48 = sub_B33D8;
    uint64_t v49 = v24;
    aBlock = _NSConcreteStackBlock;
    uint64_t v45 = 1107296256LL;
    uint64_t v46 = sub_ADF24;
    uint64_t v47 = &unk_F6B70;
    uint64_t v27 = _Block_copy(&aBlock);
    id v28 = v20;
    id v29 = v43;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    id v30 = [v28 addSuccessBlock:v27];
    _Block_release(v27);

    v41(v11, v39, v25);
    uint64_t v31 = (v22 + 16) & ~v22;
    uint64_t v32 = swift_allocObject(&unk_F6BA8, v31 + v37, v40);
    v38((char *)(v32 + v31), v11, v25);
    uint64_t v48 = sub_B3494;
    uint64_t v49 = (void *)v32;
    aBlock = _NSConcreteStackBlock;
    uint64_t v45 = 1107296256LL;
    uint64_t v46 = sub_ADF24;
    uint64_t v47 = &unk_F6BC0;
    uint64_t v33 = _Block_copy(&aBlock);
    id v34 = v28;
    swift_release();
    id v35 = [v34 addFailureBlock:v33];

    _Block_release(v33);
  }

  else
  {
  }

uint64_t sub_AF4B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  sub_5474(v9, (uint64_t)qword_1006A8);
  id v10 = a2;
  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t type = v12;
    double v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v27 = swift_slowAlloc(32LL, -1LL);
    v31[0] = v27;
    *(_DWORD *)double v13 = 136315138;
    uint64_t v14 = v13 + 12;
    uint64_t v25 = v13 + 4;
    buf = v13;
    uint64_t v15 = a3;
    id v16 = [v10 timerIDString];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    unint64_t v19 = v18;

    a3 = v15;
    uint64_t v29 = sub_683C(v17, v19, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v25, v14);

    swift_bridgeObjectRelease(v19);
    _os_log_impl(&dword_0, v11, type, "RecreateDeletedTimerFlow: Added mtTimer successfully with ID %s", buf, 0xCu);
    swift_arrayDestroy(v27, 1LL);
    swift_slowDealloc(v27, -1LL, -1LL);
    swift_slowDealloc(buf, -1LL, -1LL);
  }

  else
  {
  }

  char v20 = *(_BYTE *)(a4 + 96);
  swift_beginAccess(a3 + 16, v31, 1LL, 0LL);
  *(_BYTE *)(a3 + 16) = v20;
  id v21 = sub_A4A40();
  swift_beginAccess(a5 + 16, &v29, 1LL, 0LL);
  uint64_t v22 = *(void **)(a5 + 16);
  *(void *)(a5 + 16) = v21;

  uint64_t v23 = sub_67C4(&qword_100500);
  return CheckedContinuation.resume(returning:)(v23, v23);
}

uint64_t sub_AF71C(uint64_t a1)
{
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_5474(v2, (uint64_t)qword_1006A8);
  swift_errorRetain(a1);
  uint64_t v3 = swift_errorRetain(a1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)int v6 = 138412290;
    swift_errorRetain(a1);
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError(a1);
    uint64_t v11 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    *uint64_t v7 = v8;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl(&dword_0, v4, v5, "RecreateDeletedTimerFlow: Added mtTimer failed with error %@", v6, 0xCu);
    sub_67C4((uint64_t *)&unk_FD5F0);
    swift_arrayDestroy(v7, 1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  uint64_t v9 = sub_67C4(&qword_100500);
  return CheckedContinuation.resume(returning:)(v9, v9);
}

uint64_t sub_AF8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a5;
  uint64_t v8 = sub_67C4(&qword_100500);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  sub_54CC(a2 + 40, (uint64_t)v22);
  uint64_t v11 = v23;
  uint64_t v20 = v24;
  unint64_t v19 = sub_8CFC(v22, v23);
  type metadata accessor for CreateTimerIntent(0LL);
  uint64_t v12 = swift_retain();
  sub_A2128(v12, 1);
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))( (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v8);
  uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (v15 + 40) & ~v15;
  uint64_t v17 = (char *)swift_allocObject(&unk_F6BF8, v16 + v10, v15 | 7);
  *((void *)v17 + 2) = a4;
  *((void *)v17 + 3) = a2;
  *((void *)v17 + 4) = v21;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))( &v17[v16],  (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v8);
  swift_retain();
  swift_retain();
  swift_retain();
  dispatch thunk of SiriTimerManagerIOS.startCurrentTimer(intent:completion:)(v14, sub_B351C, v17, v11, v20);

  swift_release();
  return _s20HandleIntentStrategyVwxx_0(v22);
}

void sub_AFA58(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v58 = a5;
  uint64_t v55 = a4;
  uint64_t v56 = a3;
  uint64_t v7 = type metadata accessor for TimerOperationError(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  double v13 = (char *)v52 - v12;
  uint64_t v57 = sub_67C4(&qword_100500);
  uint64_t v54 = *(void *)(v57 - 8);
  uint64_t v14 = *(void *)(v54 + 64);
  __chkstk_darwin(v57);
  uint64_t v53 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_67C4(&qword_FDA60);
  __chkstk_darwin(v15);
  uint64_t v17 = (void **)((char *)v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_59624(a1, (uint64_t)v17, &qword_FDA60);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    unint64_t v18 = *(void (**)(char *, void **, uint64_t))(v8 + 32);
    v18(v13, v17, v7);
    if (qword_FB3A8 != -1) {
      swift_once(&qword_FB3A8, sub_ADF70);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_5474(v19, (uint64_t)qword_1006A8);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "Failed to create timer", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    CheckedContinuation.resume(returning:)(v24, v57);
    uint64_t v25 = type metadata accessor for ABCReport(0LL);
    uint64_t v61 = v25;
    uint64_t v62 = &protocol witness table for ABCReport;
    uint64_t v26 = sub_DB90(v60);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_11718( &qword_FDA58,  (uint64_t (*)(uint64_t))&type metadata accessor for TimerOperationError,  (uint64_t)&protocol conformance descriptor for TimerOperationError);
    uint64_t v28 = swift_allocError(v7, v27, 0LL, 0LL);
    v18(v29, (void **)v11, v7);
    *uint64_t v26 = _convertErrorToNSError(_:)(v28);
    uint64_t v30 = enum case for ErrorSubType.managerReturnedError(_:);
    uint64_t v31 = type metadata accessor for ErrorSubType(0LL);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104LL))(v26, v30, v31);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104LL))( v26,  enum case for ABCReport.timerUndoHandle(_:),  v25);
    static BarbaraWalters.stopThePresses(for:)(v60);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    _s20HandleIntentStrategyVwxx_0(v60);
    swift_errorRelease(v28);
  }

  else
  {
    uint64_t v32 = *v17;
    if (qword_FB3A8 != -1) {
      swift_once(&qword_FB3A8, sub_ADF70);
    }
    uint64_t v33 = (void **)(a2 + 16);
    uint64_t v34 = type metadata accessor for Logger(0LL);
    uint64_t v35 = sub_5474(v34, (uint64_t)qword_1006A8);
    uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
    os_log_type_t v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_0, v36, v37, "Successfully created", v38, 2u);
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    swift_beginAccess(v33, v59, 1LL, 0LL);
    uint64_t v39 = *v33;
    void *v33 = v32;
    id v40 = v32;

    if (v56[96] == 1)
    {
      sub_54CC((uint64_t)(v56 + 40), (uint64_t)v60);
      uint64_t v42 = v61;
      uint64_t v56 = v62;
      v52[1] = sub_8CFC(v60, v61);
      type metadata accessor for PauseTimerIntent(0LL);
      sub_1E6A8();
      id v43 = v40;
      v44.super.super.Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
      uint64_t v45 = (void *)sub_A1FC0(v43, v44.super.super.isa);
      uint64_t v47 = v53;
      uint64_t v46 = v54;
      uint64_t v48 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v58, v57);
      uint64_t v49 = *(unsigned __int8 *)(v46 + 80);
      uint64_t v50 = (v49 + 24) & ~v49;
      uint64_t v51 = swift_allocObject(&unk_F6C20, v50 + v14, v49 | 7);
      *(void *)(v51 + 16) = v55;
      (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v51 + v50, v47, v48);
      swift_retain();
      dispatch thunk of SiriTimerManagerIOS.pauseCurrentTimer(intent:completion:)(v45, sub_B35A4, v51, v42, v56);
      swift_release();

      _s20HandleIntentStrategyVwxx_0(v60);
    }

    else
    {
      CheckedContinuation.resume(returning:)(v41, v57);
    }
  }

uint64_t sub_AFF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimerOperationError(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v36[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v36[-1] - v9;
  uint64_t v11 = sub_67C4(&qword_FDA50);
  __chkstk_darwin(v11);
  double v13 = (char *)&v36[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_59624(a1, (uint64_t)v13, &qword_FDA50);
  if (swift_getEnumCaseMultiPayload(v13, v11) == 1)
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v14(v10, v13, v4);
    if (qword_FB3A8 != -1) {
      swift_once(&qword_FB3A8, sub_ADF70);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_5474(v15, (uint64_t)qword_1006A8);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "failed to pause the created timer", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    uint64_t v20 = type metadata accessor for ABCReport(0LL);
    v36[3] = v20;
    v36[4] = &protocol witness table for ABCReport;
    uint64_t v21 = sub_DB90(v36);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    sub_11718( &qword_FDA58,  (uint64_t (*)(uint64_t))&type metadata accessor for TimerOperationError,  (uint64_t)&protocol conformance descriptor for TimerOperationError);
    uint64_t v23 = swift_allocError(v4, v22, 0LL, 0LL);
    v14(v24, v8, v4);
    *uint64_t v21 = _convertErrorToNSError(_:)(v23);
    uint64_t v25 = enum case for ErrorSubType.managerReturnedError(_:);
    uint64_t v26 = type metadata accessor for ErrorSubType(0LL);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104LL))(v21, v25, v26);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104LL))( v21,  enum case for ABCReport.timerUndoHandle(_:),  v20);
    static BarbaraWalters.stopThePresses(for:)(v36);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _s20HandleIntentStrategyVwxx_0(v36);
    swift_errorRelease(v23);
  }

  else
  {
    if (qword_FB3A8 != -1) {
      swift_once(&qword_FB3A8, sub_ADF70);
    }
    uint64_t v27 = (_BYTE *)(a2 + 16);
    uint64_t v28 = type metadata accessor for Logger(0LL);
    uint64_t v29 = sub_5474(v28, (uint64_t)qword_1006A8);
    uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_0, v30, v31, "Successfully paused", v32, 2u);
      swift_slowDealloc(v32, -1LL, -1LL);
    }

    swift_beginAccess(v27, v36, 1LL, 0LL);
    *uint64_t v27 = 1;
  }

  uint64_t v33 = sub_67C4(&qword_100500);
  return CheckedContinuation.resume(returning:)(v33, v33);
}

uint64_t RecreateDeletedTimerFlow.execute(completion:)()
{
  uint64_t v0 = type metadata accessor for RecreateDeletedTimerFlow(0LL);
  sub_11718( &qword_FD430,  type metadata accessor for RecreateDeletedTimerFlow,  (uint64_t)&protocol conformance descriptor for RecreateDeletedTimerFlow);
  uint64_t v1 = sub_5A3C8();
  return Flow.deferToExecuteAsync(_:)(v1, v2, v0, v3);
}

uint64_t sub_B0378(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = type metadata accessor for NLContextUpdate(0LL);
  v3[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[6] = v5;
  v3[7] = sub_1B6C8(v5);
  uint64_t v6 = type metadata accessor for DialogPhase(0LL);
  v3[8] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  void v3[9] = v7;
  v3[10] = sub_1B6C8(v7);
  uint64_t v8 = sub_1BD34();
  v3[11] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[12] = v9;
  v3[13] = sub_1B6C8(v9);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[14] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[15] = v11;
  v3[16] = sub_1B6C8(v11);
  uint64_t v12 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[17] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[18] = v13;
  v3[19] = sub_1B6C8(v13);
  uint64_t v14 = sub_67C4(&qword_FBFC8);
  v3[20] = sub_1B6C8(*(void *)(v14 - 8));
  uint64_t v15 = sub_67C4(&qword_FBFD0);
  v3[21] = sub_1B6C8(*(void *)(v15 - 8));
  uint64_t v16 = sub_67C4(&qword_FBFD8);
  v3[22] = sub_1B6C8(*(void *)(v16 - 8));
  uint64_t v17 = sub_A9080();
  v3[23] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v3[24] = v18;
  v3[25] = sub_1B6C8(v18);
  uint64_t v19 = sub_A9078();
  v3[26] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v3[27] = v20;
  v3[28] = sub_1B6C8(v20);
  sub_1B9B8();
  return sub_1B758();
}

void sub_B04A8()
{
  if (qword_FB3B0 != -1) {
    swift_once(&qword_FB3B0, sub_ADFB8);
  }
  uint64_t v1 = v0[22];
  uint64_t v2 = sub_5474(v0[23], (uint64_t)qword_101228);
  sub_B38A0(v2);
  uint64_t v3 = sub_A8F44();
  sub_44FF8(v1, v4, v5, v3);
  if (qword_FB3B8 != -1) {
    swift_once(&qword_FB3B8, sub_ADFD4);
  }
  uint64_t v6 = v0[28];
  uint64_t v7 = v0[25];
  uint64_t v8 = v0[24];
  uint64_t v10 = v0[21];
  uint64_t v9 = v0[22];
  uint64_t v11 = v0[20];
  uint64_t v30 = v0[16];
  uint64_t v31 = v0[26];
  uint64_t v27 = v0[15];
  uint64_t v28 = v0[27];
  uint64_t v29 = v0[14];
  uint64_t v12 = v0[3];
  uint64_t v13 = type metadata accessor for SiriTimeEventSender.Attribute(0LL);
  uint64_t v14 = sub_5474(v13, (uint64_t)qword_101240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(v10, v14, v13);
  sub_B38E0(v10);
  uint64_t v15 = sub_5A13C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL))(v11, v12, v15);
  sub_B38E0(v11);
  static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v6, v7, v9, v10, v11);
  sub_8CC4(v11, &qword_FBFC8);
  sub_A9088(v16, &qword_FBFD0);
  sub_436E4(v17, &qword_FBFD8);
  sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v6, v31);
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))( v30,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v29);
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v19 = v0[12];
  uint64_t v18 = v0[13];
  uint64_t v20 = v0[11];
  uint64_t v21 = sub_5474(v20, (uint64_t)qword_1006A8);
  v0[29] = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
  mach_absolute_time();
  uint64_t v22 = sub_2BFC4();
  SiriTimeMeasurement.init(_:log:startTime:)(v22, v23, v24);
  uint64_t v25 = (void *)swift_task_alloc(unk_FC7D4);
  v0[30] = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_B072C;
  sub_B3908();
  sub_20788();
  __asm { BR              X1 }

uint64_t sub_B072C(uint64_t a1)
{
  uint64_t v9 = *v2;
  uint64_t v4 = v9;
  sub_1BC0C(&v9);
  *(void *)(v4 + 248) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v4 + 256) = a1;
  }
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_B0790(uint64_t a1)
{
  uint64_t v2 = static DialogPhase.error.getter(a1);
  NLContextUpdate.init()(v2);
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)[1]);
  v1[33] = v3;
  void *v3 = v1;
  v3[1] = sub_B0804;
  return PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)(v1[2], v1[10], v1[7], v1[19]);
}

uint64_t sub_B0804()
{
  uint64_t v1 = (void *)v0[32];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[6];
  sub_2B4F0(v0[33]);

  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_1BD14(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_1B9B8();
  return sub_B3844(v4, v5, v6);
}

uint64_t sub_B0868()
{
  return sub_206D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_B08CC()
{
  uint64_t v2 = *(void **)(v1 + 232);
  uint64_t v3 = sub_1BB90(*(void *)(v1 + 144));
  Logger.logObject.getter(v3);
  os_log_type_t v4 = sub_32A5C();
  if (sub_1BB80(v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_2BA04(v5);
    sub_1BAA8(&dword_0, v6, v7, "Failed to produce Incomplete response.");
    sub_1B904(v0);
  }

  uint64_t v8 = *(void *)(v1 + 248);

  static ExecuteResponse.complete()(v9);
  swift_errorRelease(v8);
  sub_B3774();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  sub_1B838();
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  return sub_206D8(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_B0984(uint64_t a1, char a2)
{
  uint64_t v5 = sub_67C4(&qword_FBFC8);
  v2[12] = sub_1B6C8(*(void *)(v5 - 8));
  uint64_t v6 = sub_67C4(&qword_FBFD0);
  v2[13] = sub_1B6C8(*(void *)(v6 - 8));
  uint64_t v7 = sub_67C4(&qword_FBFD8);
  v2[14] = sub_1B6C8(*(void *)(v7 - 8));
  uint64_t v8 = sub_A9080();
  v2[15] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[16] = v9;
  v2[17] = sub_1B6C8(v9);
  uint64_t v10 = sub_A9078();
  v2[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[19] = v11;
  v2[20] = sub_1B6C8(v11);
  uint64_t v12 = (void *)swift_task_alloc(dword_10072C);
  v2[21] = v12;
  void *v12 = v2;
  v12[1] = sub_B0A64;
  return sub_B1330((uint64_t)(v2 + 2), a1, a2);
}

uint64_t sub_B0A64()
{
  *uint64_t v2 = *v1;
  *(void *)(v3 + 176) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B0AB4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = (void *)sub_2BFC4();
  sub_8CFC(v3, v4);
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  v0[23] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_B0B30;
  uint64_t v6 = sub_B3908();
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v6, v1, v2);
}

uint64_t sub_B0B30()
{
  *uint64_t v2 = *v1;
  *(void *)(v3 + 192) = v0;
  swift_task_dealloc();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B0B80()
{
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 144);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 56));
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for ActivityType.completed(_:), v4);
  if (qword_FB3B0 != -1) {
    swift_once(&qword_FB3B0, sub_ADFB8);
  }
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = sub_5474(*(void *)(v0 + 120), (uint64_t)qword_101228);
  sub_B38A0(v6);
  uint64_t v7 = sub_A8F44();
  sub_44FF8(v5, v8, v9, v7);
  if (qword_FB3B8 != -1) {
    swift_once(&qword_FB3B8, sub_ADFD4);
  }
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v10 = *(void *)(v0 + 160);
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v12 = sub_B37D4();
  uint64_t v13 = sub_5474(v12, (uint64_t)qword_101240);
  sub_B3728(v13);
  sub_B37C0();
  uint64_t v14 = sub_5A13C();
  sub_44FF8(v1, v15, v16, v14);
  uint64_t v17 = sub_B3714(v10);
  sub_A9088(v17, &qword_FBFC8);
  sub_436E4(v18, &qword_FBFD0);
  sub_99824(v19, &qword_FBFD8);
  sub_B3740();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v21);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 16));
  sub_B37AC();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  return sub_44FC0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_B0CE4()
{
  uint64_t v21 = *(void *)(v0 + 176);
  uint64_t v2 = sub_A9000(*(void *)(v0 + 152));
  if (qword_FB3B0 != -1) {
    uint64_t v2 = swift_once(&qword_FB3B0, sub_ADFB8);
  }
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  sub_A8D9C(v2, (uint64_t)qword_101228);
  uint64_t v6 = sub_A8F44();
  sub_44FF8(v5, v7, v8, v6);
  if (qword_FB3B8 != -1) {
    swift_once(&qword_FB3B8, sub_ADFD4);
  }
  uint64_t v9 = *(os_log_s **)(v0 + 160);
  uint64_t v20 = *(void *)(v0 + 152);
  uint64_t v10 = sub_B37D4();
  uint64_t v11 = sub_5474(v10, (uint64_t)qword_101240);
  sub_B3728(v11);
  sub_B37C0();
  uint64_t v12 = sub_5A13C();
  sub_B3828(v12);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1, 0LL, 1LL, v3);
  uint64_t v13 = sub_B3714((uint64_t)v9);
  sub_A9088(v13, &qword_FBFC8);
  sub_436E4(v14, &qword_FBFD0);
  sub_99824(v15, &qword_FBFD8);
  sub_B3740();
  sub_9CB6C(v20);
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v16 = sub_1BD34();
  sub_39658(v16, (uint64_t)qword_1006A8);
  os_log_type_t v17 = sub_32A5C();
  if (sub_2B854(v17))
  {
    uint64_t v18 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v18 = 0;
    sub_1BBEC(&dword_0, v9, (os_log_type_t)v4, "Error producing and submitting output", v18);
    sub_1B904((uint64_t)v18);
  }

  swift_errorRelease(v21);

  sub_B37AC();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  return sub_44FC0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_B0EBC()
{
  uint64_t v21 = *(void *)(v0 + 192);
  uint64_t v2 = sub_A9000(*(void *)(v0 + 152));
  if (qword_FB3B0 != -1) {
    uint64_t v2 = swift_once(&qword_FB3B0, sub_ADFB8);
  }
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  sub_A8D9C(v2, (uint64_t)qword_101228);
  uint64_t v6 = sub_A8F44();
  sub_44FF8(v5, v7, v8, v6);
  if (qword_FB3B8 != -1) {
    swift_once(&qword_FB3B8, sub_ADFD4);
  }
  uint64_t v9 = *(os_log_s **)(v0 + 160);
  uint64_t v20 = *(void *)(v0 + 152);
  uint64_t v10 = sub_B37D4();
  uint64_t v11 = sub_5474(v10, (uint64_t)qword_101240);
  sub_B3728(v11);
  sub_B37C0();
  uint64_t v12 = sub_5A13C();
  sub_B3828(v12);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1, 0LL, 1LL, v3);
  uint64_t v13 = sub_B3714((uint64_t)v9);
  sub_A9088(v13, &qword_FBFC8);
  sub_436E4(v14, &qword_FBFD0);
  sub_99824(v15, &qword_FBFD8);
  sub_B3740();
  sub_9CB6C(v20);
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v16 = sub_1BD34();
  sub_39658(v16, (uint64_t)qword_1006A8);
  os_log_type_t v17 = sub_32A5C();
  if (sub_2B854(v17))
  {
    uint64_t v18 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v18 = 0;
    sub_1BBEC(&dword_0, v9, (os_log_type_t)v4, "Error producing and submitting output", v18);
    sub_1B904((uint64_t)v18);
  }

  swift_errorRelease(v21);

  sub_B37AC();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  return sub_44FC0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_B10A8()
{
  uint64_t v2 = __chkstk_darwin(v1);
  __chkstk_darwin(v2);
  uint64_t v4 = &v25[-v3 - 8];
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v5 = sub_1BD34();
  sub_39658(v5, (uint64_t)qword_1006A8);
  os_log_type_t v6 = sub_1BCD0();
  if (os_log_type_enabled(v0, v6))
  {
    uint64_t v7 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v7 = 0;
    sub_1BBEC(&dword_0, v0, v6, "Producing dialog to indicate we created a paused timer.", v7);
    sub_1B904((uint64_t)v7);
  }

  type metadata accessor for CATGlobals(0LL);
  uint64_t v8 = (void *)CATGlobals.__allocating_init()();
  sub_D378();
  uint64_t v10 = v9;

  uint64_t v11 = type metadata accessor for TimerTimer.Builder(0LL);
  sub_2B838(v11);
  uint64_t v12 = sub_D98C();
  sub_B3820(v12 + OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_label, (uint64_t)v25, 33LL);
  sub_B398C();
  sub_B3940();
  sub_B3820(v12 + OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_type, (uint64_t)v25, 33LL);
  sub_B398C();
  sub_B3940();
  SiriTimerState.toSpeakableString()(2LL);
  uint64_t v13 = sub_1BCD8();
  sub_B3980((uint64_t)v4, v14, v15, v13);
  uint64_t v16 = sub_5A3C8();
  sub_DB3C(v16, v17);
  sub_B3820(v12 + OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_state, (uint64_t)v25, 33LL);
  uint64_t v18 = sub_2BFC4();
  sub_5913C(v18, v19, v20);
  sub_B3940();
  sub_B3934( *(void *)(v10 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin10TimerTimer_remainingTime),  OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_remainingTime);
  sub_2B750();
  sub_B3934( *(void *)(v10 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin10TimerTimer_duration),  OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_duration);
  sub_2B750();
  uint64_t v21 = type metadata accessor for TimerTimer(0LL);
  sub_2B838(v21);
  uint64_t v22 = sub_69480(v12);
  swift_release();
  return v22;
}

uint64_t sub_B1330(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 312) = a2;
  *(void *)(v4 + 320) = v3;
  *(_BYTE *)(v4 + 840) = a3;
  *(void *)(v4 + 304) = a1;
  uint64_t TimerHandledOnWatchParameters = type metadata accessor for CreateTimerHandledOnWatchParameters(0LL);
  *(void *)(v4 + 328) = TimerHandledOnWatchParameters;
  *(void *)(v4 + 336) = sub_1B6C8(*(void *)(TimerHandledOnWatchParameters - 8));
  uint64_t v6 = type metadata accessor for OutputGenerationManifest(0LL);
  *(void *)(v4 + 344) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v4 + 352) = v7;
  *(void *)(v4 + 360) = sub_2B4DC(v7);
  *(void *)(v4 + 368) = sub_1B970();
  uint64_t v8 = type metadata accessor for SiriTimePluginModel(0LL);
  *(void *)(v4 + 376) = v8;
  *(void *)(v4 + 384) = sub_1B6C8(*(void *)(v8 - 8));
  uint64_t v9 = type metadata accessor for DialogPhase(0LL);
  *(void *)(v4 + 392) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v4 + 400) = v10;
  *(void *)(v4 + 408) = sub_2B4DC(v10);
  *(void *)(v4 + 416) = sub_1B970();
  *(void *)(v4 + 424) = sub_1B970();
  uint64_t v11 = sub_67C4(&qword_FBD98);
  *(void *)(v4 + 432) = sub_2B4DC(*(void *)(v11 - 8));
  *(void *)(v4 + 440) = sub_1B970();
  uint64_t v12 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  *(void *)(v4 + 448) = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)(v4 + 456) = v13;
  *(void *)(v4 + 464) = sub_1B6C8(v13);
  uint64_t v14 = sub_1BD34();
  *(void *)(v4 + 472) = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  *(void *)(v4 + 480) = v15;
  *(void *)(v4 + 488) = sub_1B6C8(v15);
  uint64_t v16 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  *(void *)(v4 + 496) = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  *(void *)(v4 + 504) = v17;
  *(void *)(v4 + 512) = sub_1B6C8(v17);
  uint64_t v18 = type metadata accessor for SiriTimeMeasurement(0LL);
  *(void *)(v4 + 520) = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  *(void *)(v4 + 528) = v19;
  *(void *)(v4 + 536) = sub_1B6C8(v19);
  uint64_t v20 = type metadata accessor for NLContextUpdate(0LL);
  *(void *)(v4 + 544) = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  *(void *)(v4 + 552) = v21;
  *(void *)(v4 + 560) = sub_1B6C8(v21);
  uint64_t v22 = type metadata accessor for TipKitSiriTimeContext(0LL);
  *(void *)(v4 + 568) = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  *(void *)(v4 + 576) = v23;
  *(void *)(v4 + 584) = sub_1B6C8(v23);
  uint64_t v24 = type metadata accessor for TipKitSiriTimeSource(0LL);
  *(void *)(v4 + 592) = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  *(void *)(v4 + 600) = v25;
  *(void *)(v4 + 608) = sub_1B6C8(v25);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B14F0()
{
  uint64_t v1 = *(void *)(v0 + 608);
  uint64_t v2 = *(void *)(v0 + 600);
  uint64_t v3 = *(void *)(v0 + 584);
  uint64_t v4 = *(void *)(v0 + 576);
  int v31 = *(unsigned __int8 *)(v0 + 840);
  uint64_t v5 = *(void **)(v0 + 312);
  sub_B3948( enum case for TipKitSiriTimeSource.timerPlugin(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104));
  sub_3822C( v3,  enum case for TipKitSiriTimeContext.timerCreatedWithSiri(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104));
  static TipKitDonationService.signalEventToTipKit(from:withContext:)(v1, v3);
  sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  uint64_t v6 = sub_67C4(&qword_FBE58);
  *(void *)(v0 + 616) = v6;
  uint64_t inited = swift_initStackObject(v6, v0 + 16);
  *(_OWORD *)(inited + 16) = xmmword_C2690;
  *(void *)(inited + 32) = v5;
  specialized Array._endMutation()(inited, v8, v9, v10, v11, v12, v13, v14);
  id v15 = v5;
  sub_C7A0();
  sub_18034();
  type metadata accessor for CATGlobals(0LL);
  uint64_t v16 = (void *)CATGlobals.__allocating_init()();
  sub_D378();
  uint64_t v18 = v17;

  *(void *)(v0 + 288) = v18;
  if (v31 == 1)
  {
    uint64_t v19 = sub_B10A8();
    sub_1BC50();
    *(void *)(v0 + 288) = v19;
  }

  else if (*(_BYTE *)(*(void *)(v0 + 320) + 96LL) == 1)
  {
    if (qword_FB3A8 != -1) {
      swift_once(&qword_FB3A8, sub_ADF70);
    }
    sub_39658(*(void *)(v0 + 472), (uint64_t)qword_1006A8);
    os_log_type_t v20 = sub_1BCD0();
    if (sub_1BB80(v20))
    {
      uint64_t v21 = (_WORD *)sub_1B9DC();
      sub_2BA04(v21);
      sub_1BAA8(&dword_0, v22, v23, "Created the timer but its running even though it should have been paused.");
      sub_1B904((uint64_t)v15);
    }
  }

  sub_B7FF0(*(void **)(v0 + 312));
  *(void *)(v0 + 624) = v24;
  type metadata accessor for TimerSessionManager(0LL);
  static TimerSessionManager.shared.getter((void *)(v0 + 96));
  uint64_t v25 = *(void *)(v0 + 120);
  uint64_t v26 = *(void *)(v0 + 128);
  sub_8CFC((void *)(v0 + 96), v25);
  uint64_t v27 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SessionManaging.sessionIDString(for:)[1]);
  *(void *)(v0 + 632) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_B1758;
  uint64_t v28 = sub_2BFC4();
  return dispatch thunk of SessionManaging.sessionIDString(for:)(v28, v29, v25, v26);
}

uint64_t sub_B1758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 632);
  *(void *)(v3 + 640) = a1;
  *(void *)(v3 + 648) = a2;
  sub_2B988(v4);
  sub_18034();
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B17DC()
{
  uint64_t v193 = (void *)(v0 + 176);
  uint64_t v1 = *(void *)(v0 + 648);
  uint64_t v2 = *(void *)(v0 + 504);
  uint64_t v3 = *(void *)(v0 + 512);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 96));
  uint64_t v4 = type metadata accessor for ApplicationContext(0LL);
  static ApplicationContext.shared.getter(v4);
  ApplicationContext.deviceState.getter((void *)(v0 + 136));
  sub_1BC50();
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v6 = *(void *)(v0 + 168);
  sub_8CFC((void *)(v0 + 136), v5);
  char v7 = dispatch thunk of DeviceState.isWatch.getter(v5, v6);
  *(_BYTE *)(v0 + 841) = v7 & 1;
  char v8 = v7 & (v1 != 0);
  _s20HandleIntentStrategyVwxx_0((void *)(v0 + 136));
  sub_3822C( v3,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104));
  if (qword_FB3A8 != -1) {
    swift_once(&qword_FB3A8, sub_ADF70);
  }
  uint64_t v9 = *(void *)(v0 + 512);
  uint64_t v10 = *(void *)(v0 + 480);
  uint64_t v11 = *(void *)(v0 + 488);
  uint64_t v12 = *(void *)(v0 + 472);
  uint64_t v13 = (void *)sub_5474(v12, (uint64_t)qword_1006A8);
  (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v11, v13, v12);
  uint64_t v14 = mach_absolute_time();
  uint64_t v15 = SiriTimeMeasurement.init(_:log:startTime:)(v9, v11, v14);
  static ApplicationContext.shared.getter(v15);
  ApplicationContext.deviceState.getter(v193);
  sub_1BC50();
  uint64_t v16 = *(void *)(v0 + 200);
  uint64_t v17 = *(void *)(v0 + 208);
  sub_8CFC(v193, v16);
  char v18 = dispatch thunk of DeviceState.isWatch.getter(v16, v17);
  _s20HandleIntentStrategyVwxx_0(v193);
  if (!(v8 & 1 | ((v18 & 1) == 0)))
  {
    uint64_t v29 = *(void **)(v0 + 312);
    uint64_t v30 = sub_34D60(*(void *)(v0 + 616), 40LL);
    *(_OWORD *)(v30 + 16) = xmmword_C2690;
    *(void *)(v30 + 32) = v29;
    uint64_t v194 = v30;
    specialized Array._endMutation()(v30, v31, v32, v33, v34, v35, v36, v37);
    id v38 = v29;
    id v39 = sub_4C75C(v194, 0xDu);
    *(void *)(v0 + 768) = v39;
    sub_18034();
    if (v39)
    {
      id v40 = (void *)objc_opt_self(&OBJC_CLASS___NSKeyedArchiver);
      *(void *)(v0 + 296) = 0LL;
      id v41 = [v40 archivedDataWithRootObject:v39 requiringSecureCoding:1 error:v0 + 296];
      uint64_t v42 = *(void **)(v0 + 296);
      if (v41)
      {
        id v43 = v41;
        uint64_t v44 = *(void *)(v0 + 432);
        uint64_t v46 = *(void *)(v0 + 328);
        uint64_t v45 = *(void **)(v0 + 336);
        id v47 = v42;
        uint64_t v48 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v43);
        unint64_t v50 = v49;

        *(void *)(v0 + 776) = v48;
        *(void *)(v0 + 784) = v50;
        sub_21418(v48, v50);
        *uint64_t v45 = 0LL;
        v45[1] = 0LL;
        uint64_t v51 = sub_1BCD8();
        sub_ABE0C();
        uint64_t v52 = (uint64_t)v45 + *(int *)(v46 + 28);
        sub_ABE0C();
        Swift::String v53 = Data.base64EncodedString(options:)(0LL);
        SpeakableString.init(serializedValue:)(v53._countAndFlagsBits, v53._object);
        _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v44, 0LL, 1LL, v51);
        sub_5913C(v44, v52, &qword_FBD98);
        uint64_t v54 = *(void *)(v0 + 288);
        sub_87FFC();
        swift_release();
        v45[1] = v54;
        type metadata accessor for SirikitApp(0LL);
        if (qword_FB228 != -1) {
          swift_once(&qword_FB228, sub_66804);
        }
        uint64_t v55 = *(uint64_t **)(v0 + 336);
        uint64_t v56 = swift_retain();
        uint64_t v57 = SirikitApp.init(app:)(v56);
        swift_release();
        *uint64_t v55 = v57;
        sub_34E74();
        *(void *)(v0 + 792) = v58;
        uint64_t v59 = (void *)sub_5A5DC();
        *(void *)(v0 + 800) = v59;
        *uint64_t v59 = v0;
        v59[1] = sub_B27A4;
        sub_2F678();
        __asm { BR              X3 }
      }

      sub_B3868();
      id v85 = v42;
      sub_18034();
      uint64_t v86 = _convertNSErrorToError(_:)(v42);

      uint64_t v159 = v86;
      swift_willThrow(v87, v88, v89, v90, v91, v92, v93, v94);

      sub_17D54(v11, *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
      (*(void (**)(void *, uint64_t))(v1 + 8))(v193, v17);
    }

    else
    {
      uint64_t v63 = swift_bridgeObjectRelease(*(void *)(v0 + 648));
      Logger.logObject.getter(v63);
      os_log_type_t v64 = sub_1BCD0();
      if (sub_1BB80(v64))
      {
        uint64_t v65 = (_WORD *)sub_1B9DC();
        sub_2BA04(v65);
        sub_1BAA8(&dword_0, v66, v67, "Could not get timer action from timer.");
        sub_1B904((uint64_t)v13);
      }

      uint64_t v68 = *(void *)(v0 + 560);
      uint64_t v69 = *(void *)(v0 + 552);
      uint64_t v70 = *(void *)(v0 + 544);
      uint64_t v71 = *(void *)(v0 + 528);

      uint64_t v72 = sub_67C4((uint64_t *)&unk_FF830);
      unint64_t v73 = sub_1E324();
      uint64_t v74 = swift_allocError(v72, v73, 0LL, 0LL);
      *unint64_t v75 = 1;
      uint64_t v159 = v74;
      swift_willThrow(v74, v75, v76, v77, v78, v79, v80, v81);
      sub_2B5A0(*(uint64_t (**)(uint64_t, uint64_t))(v71 + 8));
      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
    }

    sub_B36C0();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    sub_1BABC();
    sub_1B86C();
    sub_1BA24();
    uint64_t v95 = sub_1BA14();
    uint64_t v103 = sub_1B910(v95, v96, v97, v98, v99, v100, v101, v102, v159, v166);
    uint64_t v111 = sub_1B8C4(v103, v104, v105, v106, v107, v108, v109, v110, v160, v167, v173);
    uint64_t v119 = sub_1B8BC(v111, v112, v113, v114, v115, v116, v117, v118, v161, v168, v174, v179);
    uint64_t v127 = sub_1B8B4(v119, v120, v121, v122, v123, v124, v125, v126, v162, v169, v175, v180, v184);
    uint64_t v135 = sub_1B864(v127, v128, v129, v130, v131, v132, v133, v134, v163, v170, v176, v181, v185, v188);
    uint64_t v143 = sub_1B874(v135, v136, v137, v138, v139, v140, v141, v142, v164, v171, v177, v182, v186, v189, v191);
    sub_1B8AC(v143, v144, v145, v146, v147, v148, v149, v150, v165, v172, v178, v183, v187, v190, v192, (uint64_t)v193);
    sub_2F678();
    __asm { BR              X0 }
  }

  uint64_t v19 = (char *)[*(id *)(v0 + 312) type];
  if ((unint64_t)v19 >= 2)
  {
    if (v19 != (_BYTE *)&dword_0 + 2)
    {
      uint64_t v83 = (void *)swift_task_alloc(unk_FC7BC);
      *(void *)(v0 + 752) = v83;
      *uint64_t v83 = v0;
      v83[1] = sub_B2670;
      sub_B3908();
      sub_2F678();
      __asm { BR              X1 }
    }

    uint64_t v61 = (void *)sub_5A5DC();
    uint64_t v62 = sub_B253C;
    *(void *)(v0 + 736) = v61;
LABEL_20:
    *uint64_t v61 = v0;
    v61[1] = v62;
    sub_B3908();
    sub_2F678();
    __asm { BR              X2 }
  }

  uint64_t v21 = *(void *)(v0 + 456);
  uint64_t v20 = *(void *)(v0 + 464);
  uint64_t v22 = *(void *)(v0 + 448);
  static SiriTimeFeatureFlagsImpl.instance.getter(v19);
  Swift::Bool v23 = SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  if (!v23)
  {
    uint64_t v61 = (void *)sub_5A5DC();
    uint64_t v62 = sub_B223C;
    *(void *)(v0 + 696) = v61;
    goto LABEL_20;
  }

  uint64_t v24 = *(void *)(v0 + 288);
  *(void *)(v0 + 656) = v24;
  uint64_t v25 = *(void *)(v0 + 440);
  if (*(void *)(v24 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin10TimerTimer_duration))
  {
    sub_5BDA4();
    sub_87FFC();
    sub_76078();
    sub_1BC50();
    uint64_t v26 = sub_1BCD8();
    sub_B3980(v25, v27, v28, v26);
  }

  else
  {
    uint64_t v152 = sub_1BCD8();
    sub_44FF8(v25, v153, v154, v152);
    sub_5BDA4();
  }

  uint64_t v155 = (void *)swift_task_alloc(dword_FE064);
  *(void *)(v0 + 664) = v155;
  *uint64_t v155 = v0;
  v155[1] = sub_B1F0C;
  sub_2F678();
  return sub_DEE0(v156, v157);
}

uint64_t sub_B1F0C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = (*v2)[83];
  v3[84] = a1;
  v3[85] = v1;
  sub_2B988(v4);
  sub_8CC4(v3[55], &qword_FBD98);
  sub_2B750();
  if (v1) {
    sub_18034();
  }
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_B1FEC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(v1 + 841);
  uint64_t v3 = *(void *)(v1 + 648);
  static DialogPhase.completion.getter(a1);
  if (v2 != 1 || v3 == 0)
  {
    uint64_t v6 = *(void *)(v1 + 376);
    uint64_t v5 = *(uint64_t **)(v1 + 384);
    uint64_t v7 = sub_67C4(&qword_FC2C0);
    uint64_t v8 = type metadata accessor for SiriTimerSnippetModel(0LL);
    uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
         + *(void *)(*(void *)(v8 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v9 + 16) = xmmword_C2640;
    sub_EE84();
    *uint64_t v5 = v9;
    swift_storeEnumTagMultiPayload(v5, v6, 0LL);
    *(void *)(v1 + 80) = v6;
    sub_11718( (unint64_t *)&qword_FC2B0,  type metadata accessor for SiriTimePluginModel,  (uint64_t)&protocol conformance descriptor for SiriTimePluginModel);
    *(void *)(v1 + 88) = v10;
    uint64_t v11 = sub_DB90((void *)(v1 + 56));
    sub_2F2C4((uint64_t)v5, (uint64_t)v11);
  }

  else
  {
    *(void *)(v1 + 88) = 0LL;
    *(_OWORD *)(v1 + 56) = 0u;
    *(_OWORD *)(v1 + 72) = 0u;
  }

  uint64_t v12 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
  *(void *)(v1 + 688) = v12;
  void *v12 = v1;
  v12[1] = sub_B2190;
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( *(void *)(v1 + 304),  *(void *)(v1 + 424),  *(void *)(v1 + 560),  v1 + 56,  *(void *)(v1 + 536),  *(void *)(v1 + 640),  *(void *)(v1 + 648),  0xD000000000000013LL);
}

uint64_t sub_B2190()
{
  uint64_t v1 = (uint64_t)(v0 + 7);
  int v2 = (void *)v0[84];
  uint64_t v3 = v0[50];
  sub_2B4F0(v0[86]);

  sub_2B7C4();
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_8CC4(v1, &qword_FC2B8);
  sub_1B9B8();
  return sub_B3844(v4, v5, v6);
}

uint64_t sub_B223C()
{
  uint64_t v2 = v0[87];
  v0[88] = v3;
  v0[89] = v1;
  sub_2B988(v2);
  if (v1) {
    sub_B3968();
  }
  sub_1B9B8();
  return sub_2F414(v4, v5, v6);
}

uint64_t sub_B22E0(uint64_t a1)
{
  uint64_t v2 = v1[81];
  uint64_t v3 = v1[80];
  uint64_t v4 = v1[70];
  uint64_t v5 = v1[52];
  static DialogPhase.completion.getter(a1);
  uint64_t v6 = (void *)sub_5A248();
  v6[2] = v4;
  v6[3] = v3;
  v6[4] = v2;
  OutputGenerationManifest.init(dialogPhase:_:)(v5, sub_B3318, v6);
  sub_18034();
  sub_1BA14();
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  v1[90] = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_B23CC;
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v1[38], v1[46], v1[67]);
}

uint64_t sub_B23CC()
{
  uint64_t v8 = *v1;
  uint64_t v2 = v8;
  sub_1BC0C(&v8);
  v2[91] = v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)v2[88];
  sub_1BB90(v2[44]);

  sub_1B9B8();
  return sub_2F414(v4, v5, v6);
}

#error "B24F8: call analysis failed (funcsize=47)"
uint64_t sub_B253C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  sub_59BD0();
  v0[27] = v2;
  v0[28] = v3;
  v0[29] = v1;
  sub_1BC0C(v4);
  v0[93] = v1;
  swift_task_dealloc();
  if (v1) {
    sub_B3968();
  }
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_B25DC()
{
  uint64_t v1 = (void *)sub_5A248();
  uint64_t v2 = sub_64544(v1);
  sub_64434((uint64_t)v2, (uint64_t)sub_B35E8);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  *(void *)(v0 + 824) = v3;
  sub_B37E8(v3);
  return sub_64234();
}

uint64_t sub_B2670()
{
  v0[30] = v2;
  v0[31] = v3;
  v0[32] = v1;
  sub_1BC0C(v4);
  v0[95] = v1;
  swift_task_dealloc();
  if (v1) {
    sub_B3968();
  }
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_B2710()
{
  uint64_t v1 = (void *)sub_5A248();
  uint64_t v2 = sub_64544(v1);
  sub_64434((uint64_t)v2, (uint64_t)sub_B35E8);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  *(void *)(v0 + 824) = v3;
  sub_B37E8(v3);
  return sub_64234();
}

uint64_t sub_B27A4()
{
  v0[33] = v2;
  v0[34] = v3;
  v0[35] = v1;
  sub_1BC0C(v4);
  v0[101] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease(v0[99]);
  sub_1B9B8();
  return sub_2F414(v5, v6, v7);
}

uint64_t sub_B2848()
{
  uint64_t v1 = (void *)v0[96];
  sub_B3334(v0[42]);
  sub_2F5E0();

  sub_2F5E0();
  sub_B36F4();
  uint64_t v2 = (void *)sub_5A248();
  uint64_t v3 = sub_64544(v2);
  sub_64434((uint64_t)v3, (uint64_t)sub_B35E8);
  sub_2B7C4();
  sub_1BA38();
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  v0[103] = (uint64_t)v4;
  sub_B37E8(v4);
  return sub_64234();
}

#error "B2998: call analysis failed (funcsize=56)"
uint64_t sub_B29DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  sub_59BD0();
  sub_1BC0C(v2);
  *(void *)(v0 + 832) = v1;
  swift_task_dealloc();
  sub_1BB90(*(void *)(v0 + 352));
  sub_1B9B8();
  return sub_2F414(v3, v4, v5);
}

#error "B2AFC: call analysis failed (funcsize=49)"
#error "B2B9C: call analysis failed (funcsize=40)"
#error "B2C3C: call analysis failed (funcsize=40)"
#error "B2CDC: call analysis failed (funcsize=40)"
#error "B2D7C: call analysis failed (funcsize=40)"
#error "B2E1C: call analysis failed (funcsize=40)"
#error "B2EC4: call analysis failed (funcsize=42)"
uint64_t sub_B2F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  sub_67C4(&qword_FBD90);
  sub_1BCE0();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_B38B4();
  uint64_t v9 = type metadata accessor for NLContextUpdate(v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16LL))(v4, a2, v9);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v4, 0LL, 1LL, v9);
  OutputGenerationManifest.nlContextUpdate.setter(v4);
  swift_bridgeObjectRetain(a4);
  uint64_t v10 = sub_5A3C8();
  return OutputGenerationManifest.applicationSessionID.setter(v10, v11);
}

uint64_t RecreateDeletedTimerFlow.deinit()
{
  swift_release();
  sub_8CC4(v0 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin24RecreateDeletedTimerFlow_followupPluginAction, &qword_FD740);
  return v0;
}

uint64_t RecreateDeletedTimerFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_B3028()
{
  return RecreateDeletedTimerFlow.on(input:)() & 1;
}

uint64_t sub_B304C()
{
  return RecreateDeletedTimerFlow.execute(completion:)();
}

uint64_t sub_B306C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_1006CC);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_58DB8;
  return RecreateDeletedTimerFlow.execute()(a1);
}

uint64_t sub_B30C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for RecreateDeletedTimerFlow(0LL);
  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_B30E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for SiriTimerManagerImpl(0LL);
  uint64_t v15 = &protocol witness table for SiriTimerManagerImpl;
  *(void *)&__int128 v13 = a1;
  type metadata accessor for CreateTimerCATsSimple(0LL);
  static CATOption.defaultMode.getter();
  *(void *)(a3 + 16) = CATWrapperSimple.__allocating_init(options:globals:)(v8, 0LL);
  type metadata accessor for CreateTimerCATs_Async(0LL);
  static CATOption.defaultMode.getter();
  *(void *)(a3 + 24) = CATWrapper.__allocating_init(options:globals:)(v8, 0LL);
  type metadata accessor for CreateTimerCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  *(void *)(a3 + 32) = CATWrapper.__allocating_init(options:globals:)(v8, 0LL);
  *(void *)(a3 + 88) = 0LL;
  *(_BYTE *)(a3 + 96) = 0;
  uint64_t v9 = a3 + OBJC_IVAR____TtC23TimerFlowDelegatePlugin24RecreateDeletedTimerFlow_followupPluginAction;
  uint64_t v10 = type metadata accessor for PluginAction(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v9, 1LL, 1LL, v10);
  sub_5530(&v13, a3 + 40);
  *(void *)(a3 + 80) = a2;
  return a3;
}

uint64_t sub_B3218()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_B3228()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_B324C(uint64_t a1)
{
  return sub_AF8E0(a1, v1[2], v1[3], v1[4], v1[5]);
}

void sub_B3258(uint64_t a1)
{
}

uint64_t sub_B3264()
{
  return type metadata accessor for RecreateDeletedTimerFlow(0LL);
}

void sub_B326C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[3] = "(";
  void v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = &unk_C6348;
  void v4[6] = &unk_C6360;
  sub_A8A44(319LL);
  if (v3 <= 0x3F)
  {
    v4[7] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
  }

uint64_t sub_B3318(uint64_t a1)
{
  return sub_B2F08(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_B3334(uint64_t a1)
{
  uint64_t TimerHandledOnWatchParameters = type metadata accessor for CreateTimerHandledOnWatchParameters(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(TimerHandledOnWatchParameters - 8) + 8LL))( a1,  TimerHandledOnWatchParameters);
  return a1;
}

uint64_t sub_B3370()
{
  uint64_t v3 = (v2 + 48) & ~v2;

  sub_B3978();
  sub_B3970();
  swift_release();
  sub_64444(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  uint64_t v4 = sub_B38D0();
  return sub_59F74(v4, v5, v6);
}

uint64_t sub_B33D8(uint64_t a1)
{
  return sub_AF4B8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_B341C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_B342C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_B3434()
{
  uint64_t v1 = *(void *)(sub_67C4(&qword_100500) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_1BB90(v1);
  return swift_deallocObject(v0, v3, v4);
}

uint64_t sub_B3494(uint64_t a1)
{
  return sub_AF71C(a1);
}

uint64_t sub_B34D0()
{
  uint64_t v3 = sub_B38D0();
  return sub_59F74(v3, v4, v5);
}

void sub_B351C(uint64_t a1)
{
}

uint64_t sub_B3560()
{
  uint64_t v3 = sub_B38D0();
  return sub_59F74(v3, v4, v5);
}

uint64_t sub_B35A4(uint64_t a1)
{
  return sub_AFF60(a1, *(void *)(v1 + 16));
}

uint64_t sub_B35F0()
{
  return sub_B2480();
}

uint64_t sub_B3648()
{
  return swift_release(*(void *)(v0 + 288));
}

uint64_t sub_B369C()
{
  return (*(uint64_t (**)(void, void))(v0[66] + 8LL))(v0[67], v0[65]);
}

uint64_t sub_B36C0()
{
  return swift_release(*(void *)(v0 + 288));
}

uint64_t sub_B36F4()
{
  *(void *)(v1 + 816) = v0;
  return static DialogPhase.completion.getter();
}

uint64_t sub_B3714(uint64_t a1)
{
  return static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(a1, v1, v2, v3, v4);
}

uint64_t sub_B3728(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(v1, a1, v2);
}

uint64_t sub_B3740()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

void sub_B3750()
{
}

uint64_t sub_B3774()
{
  return swift_task_dealloc(*(void *)(v0 + 224));
}

uint64_t sub_B3798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(v5 - 136, v5 - 120, v4 + 8, a4, 6LL);
}

uint64_t sub_B37AC()
{
  return swift_task_dealloc(*(void *)(v0 + 160));
}

uint64_t sub_B37C0()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v0, 0LL, 1LL, v1);
}

uint64_t sub_B37D4()
{
  return type metadata accessor for SiriTimeEventSender.Attribute(0LL);
}

uint64_t sub_B37E8(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 304);
}

uint64_t sub_B3800()
{
  return swift_task_dealloc(*(void *)(v0 + 328));
}

uint64_t sub_B3820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t sub_B3828(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v1, v2, a1);
}

uint64_t sub_B3844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_B3850()
{
  return swift_release(*(void *)(v0 + 16));
}

  ;
}

double sub_B3888()
{
  return sub_1C318(v0, v1, v2, (_OWORD *)(v3 - 120));
}

uint64_t sub_B38A0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, a1, v1);
}

uint64_t sub_B38B4()
{
  return 0LL;
}

uint64_t sub_B38D0()
{
  return v0;
}

uint64_t sub_B38E0(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 0LL, 1LL, v1);
}

  ;
}

uint64_t sub_B3900()
{
  return swift_release(*(void *)(v0 - 248));
}

uint64_t sub_B3908()
{
  return v0;
}

uint64_t sub_B3914(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 168);
}

  ;
}

uint64_t sub_B3934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return swift_retain(a1);
}

uint64_t sub_B3940()
{
  return swift_endAccess(v0 - 72);
}

uint64_t sub_B3948@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v2, a1, v3);
}

void sub_B3954()
{
}

uint64_t sub_B3960()
{
  return Logger.logObject.getter();
}

uint64_t sub_B3968()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 648));
}

uint64_t sub_B3970()
{
  return swift_release(*(void *)(v0 + 32));
}

uint64_t sub_B3978()
{
  return swift_release(*(void *)(v0 + 24));
}

uint64_t sub_B3980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, 0LL, 1LL, a4);
}

uint64_t sub_B398C()
{
  return sub_DA74(v0, v1);
}

uint64_t sub_B3998(uint64_t a1)
{
  return sub_7E3EC(a1, (void (*)(void))type metadata accessor for DeleteTimerCATs_Async, &qword_101258);
}

uint64_t sub_B39AC(uint64_t a1)
{
  return sub_7E3EC( a1,  (void (*)(void))type metadata accessor for DeleteTimerCATPatternsExecutor,  &qword_101260);
}

uint64_t static Transformer<>.timerToAlarmParseTransformer.getter()
{
  uint64_t v0 = type metadata accessor for Parse(0LL);
  return Transformer.init(transform:)(sub_4C04C, 0LL, v0, v0);
}

uint64_t sub_B3A00()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100898);
  sub_5474(v0, (uint64_t)qword_100898);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_B3A48@<X0>(void (*a1)(void, void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  sub_43628(v6, (uint64_t)&v339);
  uint64_t v306 = v7;
  sub_17B6C();
  __chkstk_darwin(v8);
  sub_17D14();
  uint64_t v305 = v9;
  uint64_t v10 = sub_1E818();
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct(v10);
  sub_43628(v11, (uint64_t)&v350);
  unint64_t v344 = v12;
  sub_17B6C();
  __chkstk_darwin(v13);
  sub_17D14();
  uint64_t v309 = v14;
  uint64_t v15 = sub_1E818();
  uint64_t v16 = type metadata accessor for Siri_Nlu_External_UserParse(v15);
  sub_43628(v16, (uint64_t)&v349);
  uint64_t v318 = v17;
  sub_17B6C();
  __chkstk_darwin(v18);
  sub_17D14();
  sub_B5BF8(v19);
  sub_67C4(&qword_FD5E0);
  sub_17B6C();
  __chkstk_darwin(v20);
  sub_17D14();
  uint64_t v315 = v21;
  uint64_t v22 = sub_1E818();
  uint64_t v23 = type metadata accessor for Siri_Nlu_External_UsoGraph(v22);
  sub_43628(v23, (uint64_t)&v344);
  uint64_t v310 = v24;
  sub_17B6C();
  __chkstk_darwin(v25);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v26);
  sub_436A0();
  uint64_t v314 = v27;
  uint64_t v28 = sub_1E818();
  uint64_t v29 = type metadata accessor for USOParse(v28);
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v31);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v32);
  sub_436A0();
  uint64_t v326 = v33;
  uint64_t v34 = sub_1E818();
  uint64_t v324 = type metadata accessor for DateComponents(v34);
  uint64_t v322 = *(void *)(v324 - 8);
  sub_17B6C();
  __chkstk_darwin(v35);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v36);
  sub_436A0();
  uint64_t v312 = v37;
  uint64_t v38 = sub_1E818();
  uint64_t v39 = type metadata accessor for Parse.DirectInvocation(v38);
  sub_43628(v39, (uint64_t)&v341);
  uint64_t v311 = v40;
  sub_17B6C();
  __chkstk_darwin(v41);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v42);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v43);
  sub_436A0();
  sub_B5BF8(v44);
  sub_67C4(&qword_1008B0);
  sub_17B6C();
  __chkstk_darwin(v45);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v46);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v47);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v48);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v49);
  sub_436A0();
  sub_B5BF8(v50);
  sub_67C4(&qword_FD628);
  sub_17B6C();
  __chkstk_darwin(v51);
  sub_17D14();
  uint64_t v323 = v52;
  uint64_t v53 = sub_1E818();
  uint64_t v325 = type metadata accessor for TerminalElement.Time(v53);
  uint64_t v316 = *(void *)(v325 - 8);
  sub_17B6C();
  __chkstk_darwin(v54);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v55);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v56);
  sub_436A0();
  sub_B5BF8(v57);
  sub_67C4(&qword_FCC18);
  sub_17B6C();
  __chkstk_darwin(v58);
  sub_17D14();
  uint64_t v331 = v59;
  uint64_t v60 = sub_1E818();
  uint64_t v335 = type metadata accessor for TerminalElement.DateTimeValue(v60);
  uint64_t v330 = *(void *)(v335 - 8);
  sub_17B6C();
  __chkstk_darwin(v61);
  sub_17D14();
  uint64_t v329 = v62;
  uint64_t v63 = sub_1E818();
  uint64_t v334 = type metadata accessor for TimerNLv3Intent(v63);
  sub_17B6C();
  __chkstk_darwin(v64);
  sub_17D14();
  uint64_t v341 = (uint8_t *)v65;
  uint64_t v66 = sub_1E818();
  uint64_t v67 = type metadata accessor for NLIntent(v66);
  uint64_t v338 = *(void *)(v67 - 8);
  uint64_t v339 = v67;
  sub_17B6C();
  __chkstk_darwin(v68);
  sub_17D14();
  uint64_t v337 = v69;
  uint64_t v70 = sub_1E818();
  uint64_t v71 = type metadata accessor for Parse(v70);
  uint64_t v72 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  sub_433C4();
  sub_433A0();
  __chkstk_darwin(v73);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v74);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v75);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v76);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v77);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v78);
  sub_43404();
  sub_433A0();
  __chkstk_darwin(v79);
  sub_436A0();
  uint64_t v342 = v80;
  if (qword_FB3D0 != -1) {
    swift_once(&qword_FB3D0, sub_B3A00);
  }
  uint64_t v81 = type metadata accessor for Logger(0LL);
  uint64_t v340 = sub_5474(v81, (uint64_t)qword_100898);
  char v82 = (os_log_s *)v340;
  Logger.logObject.getter(v340);
  os_log_type_t v83 = sub_1BCD0();
  if (sub_2BAD0(v83))
  {
    uint64_t v84 = (_WORD *)sub_1BA1C(2LL);
    sub_2B938(v84);
    _os_log_impl(&dword_0, v82, v3, "Transforming timer parse to alarm parse", v2, 2u);
    sub_1B904((uint64_t)v2);
  }

  id v85 = *(uint64_t (**)(void))(v72 + 16);
  uint64_t v86 = v342;
  ((void (*)(os_log_s *, void (*)(void, void), uint64_t))v85)(v342, a1, v71);
  int v87 = (*(uint64_t (**)(os_log_s *, uint64_t))(v72 + 88))(v86, v71);
  if (v87 != enum case for Parse.NLv3IntentOnly(_:))
  {
    if (v87 == enum case for Parse.NLv4IntentOnly(_:))
    {
      sub_B5B10();
      uint64_t v93 = *(void **)v86;
      swift_getObjectType(*(void *)v86);
      uint64_t v94 = v93;
      uint64_t v95 = SIRINLUUserDialogAct.firstUsoTask.getter();
      if (!v95)
      {
        sub_B5A64();
        os_log_type_t v127 = sub_32A5C();
        if (sub_434EC(v127))
        {
          uint64_t v128 = (_WORD *)sub_1BA1C(2LL);
          sub_2B938(v128);
          sub_5E33C(&dword_0, v129, v130, "Timer to alarm transformer: NLv4Intent has no task in userDialogAct.");
          sub_1B904((uint64_t)v2);
          sub_B5C18();
        }

        else
        {

          sub_B5C18();
        }

LABEL_58:
        uint64_t v172 = sub_B5BC4();
        return v85(v172);
      }

      uint64_t v332 = (void (*)(uint64_t, void *, uint64_t))v85;
      sub_B5454(v95, v321);
      uint64_t v96 = v324;
      sub_B5B20(v321, 1LL);
      unint64_t v344 = (uint8_t *)v93;
      if (v91)
      {
        sub_DABC(v321, &qword_1008B0);
      }

      else
      {
        uint64_t v94 = (void *)v312;
        uint64_t v131 = sub_2C108(v312, v321, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v322 + 32));
        uint64_t v132 = DateComponents.hour.getter(v131);
        if ((v133 & 1) != 0)
        {
          uint64_t v168 = *(uint64_t (**)(uint64_t, uint64_t))(v322 + 8);
        }

        else
        {
          uint64_t v134 = v132;
          uint64_t v135 = DateComponents.minute.getter(v132);
          if ((v136 & 1) == 0)
          {
            uint64_t v137 = v135;
            uint64_t v285 = a2;
            sub_7944();
            uint64_t v139 = v138;
            if (v138)
            {
              UsoEntity_common_Timer.label.getter();
              uint64_t v141 = v140;
              swift_release();
              if (v141)
              {
                uint64_t v142 = v137;
                id v143 = [v141 spokenPhrase];

                uint64_t v139 = static String._unconditionallyBridgeFromObjectiveC(_:)(v143);
                uint64_t v141 = v144;

                uint64_t v137 = v142;
                uint64_t v96 = v324;
              }

              else
              {
                uint64_t v139 = 0LL;
              }
            }

            else
            {
              uint64_t v141 = 0LL;
            }

            static DirectInvocationUtils.Timer.makeReformedAlarmInvocation(hour:minute:label:)(v134, v137, v139, v141);
            sub_18034();
            uint64_t v237 = sub_B5BE4();
            uint64_t v239 = *(void *)(v238 - 256);
            v240(v237);
            (*(void (**)(void *, void, uint64_t))(v72 + 104))( v141,  enum case for Parse.directInvocation(_:),  v71);
            v332(v294, v141, v71);
            sub_B5A64();
            os_log_type_t v241 = sub_1BCD0();
            uint64_t v342 = (os_log_s *)v141;
            if (os_log_type_enabled((os_log_t)v141, v241))
            {
              uint64_t v242 = (uint8_t *)sub_1BA1C(12LL);
              uint64_t v243 = sub_1BA1C(32LL);
              uint64_t v345 = (os_log_s *)v243;
              *(_DWORD *)uint64_t v242 = 136315138;
              uint64_t v341 = v242 + 4;
              v332(v295, (void *)v294, v71);
              uint64_t v244 = String.init<A>(describing:)();
              uint64_t v246 = sub_B5AC4(v244, v245);
              uint64_t v247 = sub_B5B94(v246);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(v247, v248, v249, v242 + 12);
              swift_bridgeObjectRelease(v332);
              sub_64444(v294, *(uint64_t (**)(uint64_t, uint64_t))(v72 + 8));
              uint64_t v250 = v342;
              sub_1E7D8(&dword_0, v342, v241, "Reformed alarm parse: %s", v242);
              sub_1E7D0(v243);
              sub_1B904(v243);
              sub_1B904((uint64_t)v242);
              sub_4C454();
              sub_B5C04();

              uint64_t v251 = sub_B5BAC();
              sub_75634(v251, v252);
              uint64_t v253 = sub_B5B7C();
              uint64_t v255 = v324;
            }

            else
            {
              sub_B5C04();

              sub_75D10(v294, *(uint64_t (**)(uint64_t, uint64_t))(v72 + 8));
              sub_4C454();
              uint64_t v256 = sub_B5BAC();
              v257(v256, v239);
              uint64_t v253 = sub_B5B7C();
              uint64_t v255 = v96;
            }

            v254(v253, v255);
            uint64_t v165 = v285;
            uint64_t v164 = *(void (**)(uint64_t, void *, uint64_t))(v72 + 32);
            uint64_t v166 = v300;
LABEL_52:
            uint64_t v167 = v71;
            return ((uint64_t (*)(uint64_t, void (*)(void, void), uint64_t))v164)( v165,  v166,  v167);
          }

          sub_75878();
        }

        sub_64444(v312, v168);
      }

      sub_B5C58();
      sub_B5A64();
      os_log_type_t v180 = sub_32A5C();
      if (sub_2BAD0(v180))
      {
        uint64_t v181 = sub_1BA1C(12LL);
        uint64_t v182 = sub_1BA1C(32LL);
        uint64_t v345 = (os_log_s *)v182;
        sub_B5AD0(4.8149e-34);
        sub_B5C0C();
        uint64_t v183 = sub_B5C20();
        uint64_t v185 = sub_B5AC4(v183, v184);
        sub_B5A6C(v185);
        sub_43700();
        sub_17CD0();
        sub_B5A94(&dword_0, v186, v187, "Could not get valid dateComponents from task: %s");
        sub_1E7D0(v182);
        sub_1B904(v182);
        sub_1B904(v181);
        sub_4C454();
        sub_B5C04();
      }

      else
      {

        sub_B5C18();
        sub_B5C4C();
      }

LABEL_72:
      uint64_t v165 = sub_B5BC4();
      uint64_t v164 = v332;
      return ((uint64_t (*)(uint64_t, void (*)(void, void), uint64_t))v164)(v165, v166, v167);
    }

    if (v87 != enum case for Parse.uso(_:))
    {
      sub_B5A64();
      os_log_type_t v121 = sub_32A5C();
      if (sub_434EC(v121))
      {
        uint64_t v122 = (_WORD *)sub_1BA1C(2LL);
        sub_2B938(v122);
        sub_5E33C( &dword_0,  v123,  v124,  "Transformer should only be called for NLv4 parse. Check the caller to make sure it's not mis-used.");
        sub_1B904((uint64_t)v2);
      }

      ((void (*)(uint64_t, void (*)(void, void), uint64_t))v85)(a2, a1, v71);
      sub_75878();
      return sub_75D10((uint64_t)v342, v125);
    }

    uint64_t v332 = (void (*)(uint64_t, void *, uint64_t))v85;
    sub_B5B10();
    uint64_t v328 = v30;
    uint64_t v99 = (*(uint64_t (**)(uint64_t, os_log_s *, uint64_t))(v30 + 32))(v326, v86, v29);
    uint64_t v100 = USOParse.userParse.getter(v99);
    uint64_t v101 = (os_log_s *)Siri_Nlu_External_UserParse.userDialogActs.getter(v100);
    sub_75634(v317, *(uint64_t (**)(uint64_t, void))(v318 + 8));
    uint64_t v102 = *((void *)v101 + 2);
    uint64_t v283 = a2;
    uint64_t v286 = v71;
    if (v102)
    {
      uint64_t v103 = (char *)v101 + ((v344[80] + 32LL) & ~(unint64_t)v344[80]);
      uint64_t v29 = *((void *)v344 + 9);
      uint64_t v104 = (uint64_t (*)(uint64_t, char *))*((void *)v344 + 2);
      uint64_t v342 = v101;
      swift_bridgeObjectRetain(v101);
      uint64_t v105 = v319;
      uint64_t v71 = v309;
      while (1)
      {
        uint64_t v106 = v104(v309, v103);
        if ((Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter(v106) & 1) != 0) {
          break;
        }
        sub_64444(v309, *((uint64_t (**)(uint64_t, uint64_t))v344 + 1));
        v103 += v29;
        if (!--v102)
        {
          sub_2B7C4();
          sub_B5C2C();
          goto LABEL_41;
        }
      }

      swift_bridgeObjectRelease(v342);
      uint64_t v145 = v315;
      sub_2C108(v315, v309, *((uint64_t (**)(uint64_t, uint64_t, uint64_t))v344 + 4));
      sub_B5C2C();
    }

    else
    {
      uint64_t v107 = 1LL;
      uint64_t v105 = v319;
LABEL_41:
      uint64_t v145 = v315;
    }

    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v145, v107, 1LL, v105);
    sub_2B7C4();
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v145, 1LL, v105) == 1)
    {
      sub_DABC(v145, &qword_FD5E0);
      uint64_t v146 = v328;
    }

    else
    {
      Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
      uint64_t v147 = (*((uint64_t (**)(uint64_t, uint64_t))v344 + 1))(v145, v105);
      Siri_Nlu_External_UserStatedTask.task.getter(v147);
      sub_75634(v305, *(uint64_t (**)(uint64_t, void))(v306 + 8));
      uint64_t v148 = sub_B5C40();
      v149(v148);
      uint64_t v150 = v343;
      uint64_t v151 = static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)(v314, 0LL);
      uint64_t v146 = v328;
      uint64_t v343 = v150;
      if (!v150)
      {
        unint64_t v344 = (uint8_t *)v151;
        uint64_t v173 = static UsoConversionUtils.convertGraphToTasks(graph:)();
        uint64_t v174 = v173;
        if ((unint64_t)v173 >> 62)
        {
          if (v173 >= 0) {
            v173 &= 0xFFFFFFFFFFFFFF8uLL;
          }
          uint64_t v175 = _CocoaArrayWrapper.endIndex.getter(v173);
        }

        else
        {
          uint64_t v175 = *(void *)((char *)&dword_10 + (v173 & 0xFFFFFFFFFFFFF8LL));
        }

        uint64_t v176 = v314;
        uint64_t v177 = v283;
        if (!v175)
        {
          sub_18034();
          sub_B5A64();
          os_log_type_t v217 = sub_32A5C();
          uint64_t v218 = (uint64_t (*)(uint64_t))v332;
          if (sub_434EC(v217))
          {
            uint64_t v219 = (_WORD *)sub_1BA1C(2LL);
            sub_2B938(v219);
            sub_5E33C(&dword_0, v220, v221, "Timer to alarm transformer: USO graph has no tasks.");
            uint64_t v176 = v314;
            uint64_t v218 = (uint64_t (*)(uint64_t))v332;
            sub_1B904(v304);
          }

          sub_B5B64();
          sub_75878();
          sub_75634(v176, v222);
          (*(void (**)(uint64_t, uint64_t))(v328 + 8))(v326, v29);
          uint64_t v223 = sub_B5BC4();
          return v218(v223);
        }

        sub_8EEB4(0LL, (v174 & 0xC000000000000001LL) == 0, v174);
        if ((v174 & 0xC000000000000001LL) != 0)
        {
          uint64_t v178 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v174);
        }

        else
        {
          uint64_t v178 = *(void *)(v174 + 32);
          swift_retain(v178);
        }

        sub_18034();
        uint64_t v179 = (void *)v292;
        sub_B5454(v178, v292);
        sub_B5B20(v292, 1LL);
        uint64_t v282 = v29;
        if (v91)
        {
          sub_DABC(v292, &qword_1008B0);
        }

        else
        {
          uint64_t v179 = v291;
          uint64_t v224 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v322 + 32))(v291, v292, v324);
          uint64_t v225 = DateComponents.hour.getter(v224);
          if ((v226 & 1) != 0)
          {
            (*(void (**)(void *, uint64_t))(v322 + 8))(v291, v324);
          }

          else
          {
            uint64_t v227 = v225;
            uint64_t v228 = DateComponents.minute.getter(v225);
            if ((v229 & 1) == 0)
            {
              uint64_t v230 = v228;
              sub_7944();
              uint64_t v232 = v231;
              if (v231)
              {
                UsoEntity_common_Timer.label.getter();
                uint64_t v234 = v233;
                swift_release();
                if (v234)
                {
                  id v235 = [v234 spokenPhrase];

                  uint64_t v232 = static String._unconditionallyBridgeFromObjectiveC(_:)(v235);
                  uint64_t v234 = v236;

                  uint64_t v177 = v283;
                }

                else
                {
                  uint64_t v232 = 0LL;
                }
              }

              else
              {
                uint64_t v234 = 0LL;
              }

              static DirectInvocationUtils.Timer.makeReformedAlarmInvocation(hour:minute:label:)(v227, v230, v232, v234);
              sub_18034();
              uint64_t v268 = sub_B5BE4();
              v269(v268);
              (*(void (**)(void *, void, uint64_t))(v72 + 104))( v234,  enum case for Parse.directInvocation(_:),  v71);
              v332(v288, v234, v71);
              sub_B5A64();
              os_log_type_t v270 = sub_1BCD0();
              if (sub_2BAD0(v270))
              {
                os_log_type_t v271 = (_DWORD *)sub_1BA1C(12LL);
                uint64_t v342 = (os_log_s *)sub_1BA1C(32LL);
                uint64_t v345 = v342;
                _DWORD *v271 = 136315138;
                uint64_t v341 = (uint8_t *)(v271 + 1);
                v332(v295, (void *)v288, v71);
                uint64_t v272 = String.init<A>(describing:)();
                uint64_t v274 = sub_B5AC4(v272, v273);
                uint64_t v275 = sub_B5B94(v274);
                uint64_t v177 = v283;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(v275, v276, v277, v271 + 3);
                sub_17CD0();
                sub_64444(v288, *(uint64_t (**)(uint64_t, uint64_t))(v72 + 8));
                sub_B5A94(&dword_0, v278, v279, "Reformed alarm parse: %s");
                uint64_t v280 = v342;
                sub_1E7D0((uint64_t)v342);
                sub_1B904((uint64_t)v280);
                sub_1B904((uint64_t)v271);
                sub_4C454();

                sub_B5B64();
                sub_75878();
                sub_75634(v289, v281);
              }

              else
              {

                sub_B5B64();
                sub_64444(v288, *(uint64_t (**)(uint64_t, uint64_t))(v72 + 8));
                sub_4C454();
                sub_75634(v289, *(uint64_t (**)(uint64_t, void))(v311 + 8));
              }

              sub_B5AA8();
              sub_B5A44();
              sub_75634(v326, *(uint64_t (**)(uint64_t, void))(v328 + 8));
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 32))(v177, v290, v71);
            }

            sub_75878();
            v259(v258, v324);
          }
        }

        sub_B5C58();
        sub_B5A64();
        os_log_type_t v260 = sub_32A5C();
        if (sub_2BAD0(v260))
        {
          uint64_t v261 = sub_1BA1C(12LL);
          uint64_t v262 = sub_1BA1C(32LL);
          uint64_t v345 = (os_log_s *)v262;
          sub_B5AD0(4.8149e-34);
          sub_B5C0C();
          uint64_t v263 = sub_B5C20();
          uint64_t v265 = sub_B5AC4(v263, v264);
          sub_B5A6C(v265);
          sub_43700();
          sub_17CD0();
          sub_B5A94(&dword_0, v266, v267, "Could not get valid dateComponents from task: %s");
          sub_1E7D0(v262);
          sub_1B904(v262);
          sub_1B904(v261);
          sub_4C454();

          sub_B5B64();
          sub_B5A44();
          (*(void (**)(uint64_t, uint64_t))(v328 + 8))(v326, v282);
        }

        else
        {
          sub_B5C4C();

          sub_B5B64();
          sub_B5A44();
          (*(void (**)(uint64_t, uint64_t))(v328 + 8))(v326, v29);
        }

        goto LABEL_72;
      }

      swift_errorRelease(v343);
      (*(void (**)(uint64_t))(v310 + 8))(v314);
      uint64_t v343 = 0LL;
    }

    uint64_t v152 = *(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 16);
    v152(v313, v326, v29);
    uint64_t v153 = v146;
    uint64_t v154 = (os_log_s *)sub_B5A64();
    os_log_type_t v155 = static os_log_type_t.error.getter();
    if (sub_43670(v155))
    {
      uint64_t v156 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v157 = sub_1BA1C(32LL);
      *(_DWORD *)uint64_t v156 = 136315138;
      unint64_t v344 = v156 + 4;
      uint64_t v345 = (os_log_s *)v157;
      v152(v302, v313, v29);
      uint64_t v158 = String.init<A>(describing:)();
      unint64_t v160 = v159;
      uint64_t v161 = sub_B5B08(v158, v159);
      sub_B5AEC(v161);
      swift_bridgeObjectRelease(v160);
      uint64_t v162 = *(void (**)(uint64_t, uint64_t))(v328 + 8);
      v162(v313, v29);
      sub_1E7D8(&dword_0, v154, (os_log_type_t)a1, "Timer to alarm transformer: Failed to parse usoParse: %s", v156);
      sub_1E7D0(v157);
      uint64_t v71 = v286;
      sub_1B904(v157);
      sub_1B904((uint64_t)v156);

      v162(v326, v29);
    }

    else
    {

      uint64_t v163 = *(void (**)(uint64_t, uint64_t))(v153 + 8);
      v163(v313, v29);
      v163(v326, v29);
    }

    uint64_t v164 = v332;
    uint64_t v165 = v283;
    uint64_t v166 = a1;
    goto LABEL_52;
  }

  id v336 = a1;
  uint64_t v287 = v72;
  sub_B5B10();
  sub_2C108(v337, (uint64_t)v86, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v338 + 32));
  sub_2C108((uint64_t)v341, v337, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v338 + 16));
  if (qword_FB2F8 != -1) {
    swift_once(&qword_FB2F8, sub_96FBC);
  }
  uint64_t v88 = qword_101148;
  unint64_t v89 = sub_A25DC();
  uint64_t v90 = v331;
  IntentNodeTraversable.value<A>(forNode:)(v88, v334, v89);
  sub_B5B20(v331, 1LL);
  if (v91)
  {
    uint64_t v92 = &qword_FCC18;
LABEL_18:
    sub_DABC(v90, v92);
LABEL_55:
    uint64_t v169 = (os_log_s *)sub_B5A64();
    os_log_type_t v170 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v169, v170))
    {
      uint64_t v171 = (uint8_t *)sub_1BA1C(2LL);
      *(_WORD *)uint64_t v171 = 0;
      _os_log_impl(&dword_0, v169, v170, "Not able to parse alarm time from timer NLv3 intent", v171, 2u);
      sub_1B904((uint64_t)v171);
    }

    sub_1E6E4((uint64_t)v341);
    sub_B5BD4();
    goto LABEL_58;
  }

  unint64_t v344 = (uint8_t *)v89;
  uint64_t v97 = sub_2C108(v329, v331, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v330 + 32));
  uint64_t v90 = v323;
  TerminalElement.DateTimeValue.startTime.getter(v97);
  int v98 = _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v323, 1LL, v325);
  if (v98 == 1)
  {
    sub_64444(v329, *(uint64_t (**)(uint64_t, uint64_t))(v330 + 8));
    uint64_t v92 = &qword_FD628;
    goto LABEL_18;
  }

  uint64_t v108 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v316 + 32))(v320, v323, v325);
  uint64_t v109 = TerminalElement.Time.hourOfDay.getter(v108);
  if ((v110 & 1) != 0 || (uint64_t v111 = v109, v112 = (os_log_s *)TerminalElement.Time.minute.getter(), (v113 & 1) != 0))
  {
    sub_B5B6C();
    (*(void (**)(uint64_t, uint64_t))(v330 + 8))(v329, v335);
    goto LABEL_55;
  }

  uint64_t v342 = v112;
  id v333 = (uint64_t (**)(void, void, uint64_t))v85;
  uint64_t v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v316 + 16);
  v114(v297, v320, v325);
  uint64_t v115 = (os_log_s *)sub_B5A64();
  os_log_type_t v116 = static os_log_type_t.default.getter();
  uint64_t v284 = a2;
  if (os_log_type_enabled(v115, v116))
  {
    uint64_t v117 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v327 = sub_1BA1C(32LL);
    uint64_t v345 = (os_log_s *)v327;
    *(_DWORD *)uint64_t v117 = 136315138;
    id v336 = (void (*)(uint64_t, uint64_t))(v117 + 4);
    v114(v293, v297, v325);
    sub_B5C40();
    uint64_t v118 = String.init<A>(describing:)();
    unint64_t v120 = v119;
    uint64_t v347 = sub_B5B08(v118, v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v347, &v348, v117 + 4, v117 + 12);
    swift_bridgeObjectRelease(v120);
    sub_B5B50();
    sub_1E7D8(&dword_0, v115, v116, "Converting to alarmTime from timerTime %s", v117);
    sub_1E7D0(v327);
    sub_1B904(v327);
    sub_1B904((uint64_t)v117);
  }

  else
  {
    sub_B5B50();
  }

  uint64_t v188 = TerminalElement.DateTimeValue.toDateTimeWithMeridiemSetByUser()();
  uint64_t v189 = static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)(v188, 0LL);
  swift_release();
  uint64_t v190 = v111;
  if (v189)
  {
    DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)(1LL);
    swift_release();
    uint64_t v191 = v324;
  }

  else
  {
    uint64_t v191 = v324;
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v303, 1LL, 1LL, v324);
  }

  uint64_t v192 = sub_B5C40();
  sub_B59B4(v192, v193);
  uint64_t v194 = sub_B5B20(v298, 1LL);
  if (v91)
  {
    sub_DABC(v298, &qword_1008B0);
  }

  else
  {
    uint64_t v195 = DateComponents.hour.getter(v194);
    char v197 = v196;
    (*(void (**)(uint64_t, uint64_t))(v322 + 8))(v298, v324);
    if ((v197 & 1) == 0) {
      uint64_t v190 = v195;
    }
    uint64_t v191 = v324;
  }

  sub_B59B4(v303, v296);
  uint64_t v198 = sub_B5B20(v296, 1LL);
  if (v91)
  {
    sub_DABC(v296, &qword_1008B0);
  }

  else
  {
    uint64_t v199 = DateComponents.minute.getter(v198);
    uint64_t v200 = v191;
    uint64_t v201 = (os_log_s *)v199;
    char v203 = v202;
    (*(void (**)(uint64_t, uint64_t))(v322 + 8))(v296, v200);
    uint64_t v204 = v342;
    if ((v203 & 1) == 0) {
      uint64_t v204 = v201;
    }
    uint64_t v342 = v204;
  }

  uint64_t v205 = v344;
  if (qword_FB2E0 != -1) {
    swift_once(&qword_FB2E0, sub_96F34);
  }
  IntentNodeTraversable.value<A>(forNode:)(qword_101130, v334, v205);
  static DirectInvocationUtils.Timer.makeReformedAlarmInvocation(hour:minute:label:)(v190, v342, v345, v346);
  sub_2B7C4();
  (*(void (**)())(v311 + 16))();
  (*(void (**)(uint64_t, void, uint64_t))(v287 + 104))(v307, enum case for Parse.directInvocation(_:), v71);
  uint64_t v206 = v333;
  ((void (*)(uint64_t, uint64_t, uint64_t))v333)(v299, v307, v71);
  uint64_t v207 = (os_log_s *)sub_B5A64();
  os_log_type_t v208 = static os_log_type_t.default.getter();
  if (sub_43670(v208))
  {
    uint64_t v209 = (uint8_t *)sub_1BA1C(12LL);
    uint64_t v210 = sub_1BA1C(32LL);
    *(_DWORD *)uint64_t v209 = 136315138;
    unint64_t v344 = v209 + 4;
    uint64_t v345 = (os_log_s *)v210;
    uint64_t v211 = sub_B5C40();
    v212(v211);
    uint64_t v213 = String.init<A>(describing:)();
    uint64_t v206 = (uint64_t (**)(void, void, uint64_t))v214;
    uint64_t v215 = sub_B5B08(v213, v214);
    sub_B5AEC(v215);
    swift_bridgeObjectRelease(v206);
    sub_B5B38();
    sub_1E7D8(&dword_0, v207, v308, "Inference reformed alarm parse: %s", v209);
    sub_1E7D0(v210);
    sub_1B904(v210);
    sub_1B904((uint64_t)v209);

    sub_75878();
  }

  else
  {

    sub_B5B38();
    uint64_t v216 = *(uint64_t (**)(uint64_t, uint64_t))(v311 + 8);
  }

  sub_75D10(v301, v216);
  sub_DABC(v303, &qword_1008B0);
  v336(v320, v325);
  (*(void (**)(uint64_t, uint64_t))(v330 + 8))(v329, v335);
  sub_1E6E4((uint64_t)v341);
  sub_B5BD4();
  return v206[4](v284, v307, v71);
}

uint64_t sub_B5454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_67C4(&qword_1008B0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v51 - v8;
  uint64_t v10 = type metadata accessor for DateComponents(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_7944();
  if (v14)
  {
    uint64_t v15 = dispatch thunk of UsoEntity_common_Timer.endTime.getter(v14);
    uint64_t v16 = swift_release();
    if (v15)
    {
      uint64_t v17 = UsoEntity_common_DateTime.toDateTimeWithMeridiemSetByUser()(v16);
      uint64_t v18 = static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)(v17, 0LL);
      swift_release();
      if (!v18)
      {
LABEL_21:
        if (qword_FB3D0 != -1) {
          swift_once(&qword_FB3D0, sub_B3A00);
        }
        uint64_t v41 = type metadata accessor for Logger(0LL);
        sub_5474(v41, (uint64_t)qword_100898);
        uint64_t v42 = swift_retain_n(v15, 2LL);
        uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
        os_log_type_t v44 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v46 = swift_slowAlloc(32LL, -1LL);
          uint64_t v51 = v15;
          uint64_t v52 = v46;
          *(_DWORD *)uint64_t v45 = 136315138;
          type metadata accessor for UsoEntity_common_DateTime(0LL);
          swift_retain(v15);
          uint64_t v47 = String.init<A>(describing:)(&v51);
          unint64_t v49 = v48;
          uint64_t v51 = sub_683C(v47, v48, &v52);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v45 + 4, v45 + 12);
          swift_release_n(v15, 2LL);
          swift_bridgeObjectRelease(v49);
          _os_log_impl(&dword_0, v43, v44, "Transformer is invalid: failed to resolve alarm time from %s.", v45, 0xCu);
          uint64_t v32 = 1LL;
          swift_arrayDestroy(v46, 1LL);
          swift_slowDealloc(v46, -1LL, -1LL);
          swift_slowDealloc(v45, -1LL, -1LL);
          swift_release();

          return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a2, v32, 1LL, v10);
        }

        uint64_t v33 = v15;
        uint64_t v34 = 3LL;
LABEL_26:
        swift_release_n(v33, v34);
        uint64_t v32 = 1LL;
        return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a2, v32, 1LL, v10);
      }

      uint64_t v19 = (void *)DateTime.asTimePoint(shouldUseInferredMeridiem:insertToEndTime:)(1, 0);
      if (!v19)
      {
        _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 1LL, 1LL, v10);
LABEL_15:
        swift_release();
        sub_DABC((uint64_t)v9, &qword_1008B0);
        goto LABEL_21;
      }

      uint64_t v20 = v19;
      id v21 = [v19 startDateComponents];

      if (v21)
      {
        static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v21);

        uint64_t v22 = 0LL;
      }

      else
      {
        uint64_t v22 = 1LL;
      }

      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v7, v22, 1LL, v10);
      sub_B59FC((uint64_t)v7, (uint64_t)v9);
      uint64_t v35 = *(uint64_t (**)(char *, char *, uint64_t))(v11 + 32);
      uint64_t v36 = v35(v13, v9, v10);
      uint64_t v37 = DateComponents.hour.getter(v36);
      if ((v38 & 1) != 0)
      {
        swift_release();
      }

      else
      {
        DateComponents.minute.getter(v37);
        char v40 = v39;
        swift_release();
        if ((v40 & 1) == 0)
        {
          swift_release();
          v35((char *)a2, v13, v10);
          uint64_t v32 = 0LL;
          return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a2, v32, 1LL, v10);
        }
      }

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      goto LABEL_21;
    }
  }

  if (qword_FB3D0 != -1) {
    swift_once(&qword_FB3D0, sub_B3A00);
  }
  uint64_t v23 = type metadata accessor for Logger(0LL);
  sub_5474(v23, (uint64_t)qword_100898);
  uint64_t v24 = swift_retain_n(a1, 2LL);
  uint64_t v25 = (void *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled((os_log_t)v25, v26))
  {

    uint64_t v33 = a1;
    uint64_t v34 = 2LL;
    goto LABEL_26;
  }

  uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v28 = swift_slowAlloc(32LL, -1LL);
  uint64_t v51 = a1;
  uint64_t v52 = v28;
  *(_DWORD *)uint64_t v27 = 136315138;
  type metadata accessor for UsoTask(0LL);
  swift_retain(a1);
  uint64_t v29 = String.init<A>(describing:)(&v51);
  unint64_t v31 = v30;
  uint64_t v51 = sub_683C(v29, v30, &v52);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v27 + 4, v27 + 12);
  swift_release_n(a1, 2LL);
  swift_bridgeObjectRelease(v31);
  _os_log_impl( &dword_0,  (os_log_t)v25,  v26,  "Transformer is invalid: uso graph don't have valid endTime %s.",  v27,  0xCu);
  uint64_t v32 = 1LL;
  swift_arrayDestroy(v28, 1LL);
  swift_slowDealloc(v28, -1LL, -1LL);
  swift_slowDealloc(v27, -1LL, -1LL);

  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a2, v32, 1LL, v10);
}

uint64_t sub_B59B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_1008B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_B59FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_1008B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_B5A44()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 376) + 8LL))( *(void *)(v0 - 336),  *(void *)(v0 - 368));
}

uint64_t sub_B5A64()
{
  return Logger.logObject.getter();
}

uint64_t sub_B5A6C(uint64_t a1)
{
  *(void *)(v3 - 72) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 72, v3 - 64, v2, v1);
}

void sub_B5A94(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_B5AA8()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 264) + 8LL))( *(void *)(v0 - 544),  *(void *)(v0 - 248));
}

uint64_t sub_B5AC4(uint64_t a1, unint64_t a2)
{
  return sub_683C(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_B5AD0(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 - 72) = v1;
  return type metadata accessor for UsoTask(0LL);
}

uint64_t sub_B5AEC(uint64_t a1)
{
  *(void *)(v2 - 72) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 72, v2 - 64, *(void *)(v2 - 112), v1);
}

uint64_t sub_B5B08(uint64_t a1, unint64_t a2)
{
  return sub_683C(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_B5B10()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v0, v1);
}

uint64_t sub_B5B20(uint64_t a1, uint64_t a2)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1, a2, v2);
}

uint64_t sub_B5B38()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 576) + 8LL))(v0, v1);
}

uint64_t sub_B5B50()
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  *(void *)(v3 - 176) = v4;
  return v4(v2, v1);
}

uint64_t sub_B5B64()
{
  return swift_release(*(void *)(v0 - 112));
}

uint64_t sub_B5B6C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_B5B7C()
{
  return *(void *)(v0 - 352);
}

uint64_t sub_B5B94(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_B5BAC()
{
  return *(void *)(v0 - 464);
}

uint64_t sub_B5BC4()
{
  return v0;
}

uint64_t sub_B5BD4()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 160) + 8LL))( *(void *)(v0 - 168),  *(void *)(v0 - 152));
}

uint64_t sub_B5BE4()
{
  return *(void *)(v0 - 256);
}

void sub_B5BF8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_B5C04()
{
  return swift_unknownObjectRelease(*(void *)(v0 - 112));
}

uint64_t sub_B5C0C()
{
  return swift_retain(v0);
}

uint64_t sub_B5C18()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_B5C20()
{
  return String.init<A>(describing:)(v0 - 72);
}

  ;
}

uint64_t sub_B5C40()
{
  return v0;
}

uint64_t sub_B5C4C()
{
  return swift_release_n(v0, 3LL);
}

uint64_t sub_B5C58()
{
  return swift_retain_n(v0, 2LL);
}

uint64_t sub_B5C64(uint64_t a1)
{
  return sub_2C164( a1,  (void (*)(void))type metadata accessor for ResumeTimerCATsSimple,  (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:),  &qword_101268);
}

uint64_t sub_B5C80(uint64_t a1)
{
  return sub_2C164( a1,  (void (*)(void))type metadata accessor for ResumeTimerCATs_Async,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_101270);
}

uint64_t sub_B5C9C(uint64_t a1)
{
  return sub_2C164( a1,  (void (*)(void))type metadata accessor for ResumeTimerCATPatternsExecutor,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_101278);
}

id sub_B5CB8(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v2);
  NSString v5 = sub_B83FC();
  id v6 = [v4 initWithIdentifier:0 displayString:v5];

  if (a1)
  {
    id v7 = v6;
    sub_87FFC();
    UsoEntity_common_Timer.label.getter();
    NSString v9 = v8;
    id v10 = (id)sub_1BC50();
    if (v9)
    {
      id v11 = [v9 spokenPhrase];

      static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v13 = v12;

      NSString v9 = String._bridgeToObjectiveC()();
      id v10 = (id)swift_bridgeObjectRelease(v13);
    }
  }

  else
  {
    id v10 = v6;
    NSString v9 = 0LL;
  }

  sub_B81D4((uint64_t)v10, "setLabel:");

  if (a1)
  {
    sub_87FFC();
    UsoEntity_common_Timer.duration.getter();
    sub_1BC50();
  }

  else
  {
    uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___SiriTimeTimerConstants);
    sub_B839C(v14);
  }

  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_B81D4((uint64_t)isa, "setDuration:");

  if (a1)
  {
    sub_87FFC();
    UsoEntity_common_Timer.remainingTime.getter();
    sub_1BC50();
  }

  else
  {
    uint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___SiriTimeTimerConstants);
    sub_B839C(v16);
  }

  Class v17 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_B81D4((uint64_t)v17, "setRemainingTime:");

  if (a1)
  {
    sub_87FFC();
    UsoEntity_common_Timer.timerState.getter();
    uint64_t v18 = sub_1BC50();
    sub_B81D4(v18, "setState:");
    sub_87FFC();
    UsoEntity_common_Timer.timerType.getter();
    uint64_t v19 = sub_1BC50();
  }

  else
  {
    uint64_t v19 = (uint64_t)sub_A28E4(v6, "setState:");
  }

  uint64_t v20 = (uint64_t)sub_B81D4(v19, "setType:");
  if (a1)
  {
    sub_87FFC();
    UsoEntity_common_Timer.isMultiple.getter();
    uint64_t v22 = v21;
    uint64_t v20 = sub_1BC50();
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  sub_B81D4(v20, "setShouldMatchAny:");

  sub_1BC50();
  return v6;
}

uint64_t sub_B5EC4(uint64_t a1, uint64_t a2)
{
  v7[5] = a1;
  v7[2] = a2;
  v7[3] = a1;
  uint64_t v2 = type metadata accessor for Array(0LL, a2);
  uint64_t v3 = type metadata accessor for TimerTimer(0LL);
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v2);
  return sub_B5F50( (void (*)(char *, uint64_t))sub_B7FFC,  (uint64_t)v7,  v2,  v3,  (uint64_t)&type metadata for Never,  WitnessTable,  (uint64_t)&protocol witness table for Never,  v5);
}

uint64_t sub_B5F50( void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v47 = a5;
  uint64_t v48 = a8;
  uint64_t v10 = v8;
  uint64_t v55 = a1;
  uint64_t v56 = a2;
  uint64_t v46 = *(void *)(a5 - 8);
  sub_17B6C();
  __chkstk_darwin(v14);
  sub_B8278(v15, v44);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, *(void *)(v16 + 8));
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v19 = (char *)&v44 - v18;
  sub_17B6C();
  __chkstk_darwin(v20);
  sub_18124();
  uint64_t v21 = swift_getAssociatedTypeWitness(0LL, a6);
  uint64_t v49 = *(void *)(v21 - 8);
  uint64_t v50 = v21;
  sub_17B6C();
  __chkstk_darwin(v22);
  sub_433C4();
  uint64_t v45 = v23;
  __chkstk_darwin(v24);
  os_log_type_t v26 = (char *)&v44 - v25;
  uint64_t v27 = dispatch thunk of Collection.count.getter(a3, a6);
  if (!v27) {
    return static Array._allocateUninitialized(_:)(0LL, a4);
  }
  uint64_t v28 = a4;
  Swift::Int v29 = v27;
  uint64_t v61 = ContiguousArray.init()(v28);
  uint64_t v51 = type metadata accessor for ContiguousArray(0LL, v28);
  ContiguousArray.reserveCapacity(_:)(v29);
  uint64_t v53 = a6;
  uint64_t result = dispatch thunk of Collection.startIndex.getter(a3, a6);
  if ((v29 & 0x8000000000000000LL) == 0)
  {
    Swift::Int v31 = v29;
    uint64_t v52 = v9;
    while (v31)
    {
      Swift::Int v58 = v31;
      uint64_t v32 = a3;
      uint64_t v33 = a3;
      uint64_t v34 = v10;
      uint64_t v35 = v53;
      uint64_t v36 = (void (*)(_BYTE *, void))dispatch thunk of Collection.subscript.read(v60, v26, v32, v53);
      (*(void (**)(char *))(v17 + 16))(v19);
      v36(v60, 0LL);
      uint64_t v37 = v26;
      char v38 = v19;
      uint64_t v39 = v52;
      uint64_t v40 = v59;
      v55(v38, v57);
      if (v40)
      {
        sub_B82E4();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v37, v50);
        swift_release();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v48, v57, v47);
      }

      uint64_t v59 = 0LL;
      sub_B82E4();
      ContiguousArray.append(_:)(v39, v51);
      uint64_t result = dispatch thunk of Collection.formIndex(after:)(v37, v33, v35);
      Swift::Int v31 = v58 - 1;
      uint64_t v10 = v34;
      a3 = v33;
      uint64_t v19 = v38;
      os_log_type_t v26 = v37;
      if (v58 == 1)
      {
        uint64_t v42 = v49;
        uint64_t v41 = v50;
        uint64_t v43 = v45;
        (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v45, v37, v50);
        _expectEnd<A>(of:is:)(v10, v43, v33, v53);
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v43, v41);
        return v61;
      }
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_B624C()
{
  uint64_t v0 = type metadata accessor for DialogDuration.Builder(0LL);
  sub_2B838(v0);
  uint64_t v1 = DialogDuration.Builder.init()();
  id v2 = sub_5A468(v1, "remainingTime");
  uint64_t v3 = v2;
  if (v2)
  {
    sub_5A468((uint64_t)v2, "doubleValue");
    uint64_t v5 = v4;

    id v2 = v5;
  }

  dispatch thunk of DialogDuration.Builder.withSecs(_:)(v2, v3 == 0LL);
  uint64_t v6 = sub_1BC50();
  uint64_t v7 = dispatch thunk of DialogDuration.Builder.build()(v6);
  sub_2B750();
  return v7;
}

id sub_B62E4(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  NSString v6 = sub_B83FC();
  id v7 = sub_B80F8(a1, a2, (uint64_t)v6, v5);

  id v8 = v7;
  sub_A28E4(v8, "setLabel:");
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___SiriTimeTimerConstants);
  sub_B839C(v9);
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_B81D4((uint64_t)isa, "setDuration:");

  [v9 defaultDuration];
  Class v11 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_5F80C(v8, "setRemainingTime:");

  sub_A28E4(v8, "setState:");
  return v8;
}

void sub_B63C0()
{
  uint64_t v1 = v0;
  sub_67C4(&qword_FB530);
  sub_1BCE0();
  __chkstk_darwin(v2);
  uint64_t v4 = *(void *)(sub_B822C(v3, v30) - 8);
  sub_17B6C();
  __chkstk_darwin(v5);
  sub_17D14();
  uint64_t v7 = v6;
  sub_67C4(&qword_FB538);
  sub_1BCE0();
  __chkstk_darwin(v8);
  sub_1C308();
  uint64_t v11 = v10 - v9;
  sub_B8254(v12, (SEL *)&selRef_identifier);
  uint64_t v13 = sub_B8304();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v1, v13);
  uint64_t v14 = sub_B8204();
  uint64_t v31 = sub_B8254(v14, (SEL *)&selRef_label);
  id v15 = sub_2BD30(v31, "duration");
  uint64_t v16 = v15;
  if (v15)
  {
    sub_B8360();
  }

  id v17 = sub_2BD30((uint64_t)v15, "remainingTime");
  uint64_t v18 = v17;
  if (v17)
  {
    sub_B836C();
  }

  id v19 = sub_2BD30((uint64_t)v17, "state");
  uint64_t v20 = SiriTimerState.rawValue.getter(v19);
  uint64_t v21 = sub_B83C8( v7,  enum case for PunchOutApp.timer(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104));
  PunchOutApp.url.getter(v21);
  uint64_t v22 = sub_1BBE4(v7, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_B81E0(v22, v23, v24, v25, v26, v27, v28, v29, v18 == 0LL, v20, 0, v32);
  sub_88108();
}

id sub_B65BC(id a1)
{
  if (v2)
  {
    sub_B6E2C(v2);
    uint64_t v4 = v3;
    sub_2B750();
    return (id)v4;
  }

  sub_859A8();
  if (!v6) {
    goto LABEL_10;
  }
  sub_B70B0(v6);
  if (!v7)
  {
    sub_2B750();
LABEL_10:
    if (qword_FB3F0 != -1) {
      swift_once(&qword_FB3F0, sub_B6DE4);
    }
    uint64_t v19 = sub_1BD34();
    sub_5474(v19, (uint64_t)qword_1008B8);
    uint64_t v20 = sub_B8324();
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v24 = sub_1BA1C(32LL);
      uint64_t v28 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      type metadata accessor for UsoTask(0LL);
      sub_5BDA4();
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v27 = sub_683C(v25, v26, &v28);
      sub_B833C((uint64_t)&v27, (uint64_t)&v28);
      sub_4C44C((uint64_t)a1);
      sub_2BE5C();
      sub_1E7D8(&dword_0, v21, v22, "Failed to find timer reference from task: %s", v23);
      sub_1E7D0(v24);
      sub_1B904(v24);
      sub_1B904((uint64_t)v23);
    }

    else
    {

      sub_4C44C((uint64_t)a1);
    }

    sub_2BF0C();
    return sub_B5CB8(0LL);
  }

  uint64_t v8 = v7;
  if (qword_FB3F0 != -1) {
    swift_once(&qword_FB3F0, sub_B6DE4);
  }
  uint64_t v9 = sub_1BD34();
  sub_5474(v9, (uint64_t)qword_1008B8);
  id v10 = v8;
  sub_B83E4();
  os_log_type_t v11 = sub_1BCD0();
  if (sub_2BDE0(v11))
  {
    uint64_t v12 = (_DWORD *)sub_1BA1C(12LL);
    uint64_t v13 = sub_1BA1C(32LL);
    uint64_t v28 = v13;
    _DWORD *v12 = 136315138;
    a1 = a1;
    id v14 = [a1 description];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    sub_B8354();

    uint64_t v27 = sub_B8348(v15, v16, &v28);
    sub_B8408((uint64_t)&v27, (uint64_t)&v28, (uint64_t)(v12 + 1));

    sub_2BE5C();
    sub_B8218(&dword_0, v17, v18, "Found NoEntity reference: %s");
    sub_1E7D0(v13);
    sub_1B904(v13);
    sub_1B904((uint64_t)v12);
  }

  else
  {
  }

  sub_2B750();
  return a1;
}

Swift::Bool __swiftcall SiriTimer.isDefault()()
{
  id v1 = sub_2BD30(v0, "duration");
  if (v1)
  {
    sub_B8390();
    double v3 = v2;
  }

  else
  {
    double v3 = 0.0;
  }

  id v4 = [(id)objc_opt_self(SiriTimeTimerConstants) defaultDuration];
  if (v1) {
    BOOL v6 = v3 == v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    return 0;
  }
  id v7 = sub_2BD30((uint64_t)v4, "remainingTime");
  uint64_t v8 = v7;
  if (v7)
  {
    sub_B8390();
    double v10 = v9;
  }

  else
  {
    double v10 = 0.0;
  }

  sub_5A468((uint64_t)v7, "defaultDuration");
  Swift::Bool result = 0;
  if (v8 && v10 == v11)
  {
    sub_B8254(0LL, (SEL *)&selRef_identifier);
    uint64_t v14 = v13;
    uint64_t v15 = swift_bridgeObjectRelease(v13);
    if (!v14)
    {
      id v16 = sub_2BD30(v15, "state");
      uint64_t v17 = SiriTimerState.rawValue.getter(v16);
      return v17 == SiriTimerState.rawValue.getter(0LL);
    }

    return 0;
  }

  return result;
}

uint64_t sub_B69E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v55 = a4;
  uint64_t v57 = a5;
  sub_67C4(&qword_100530);
  sub_1BCE0();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v49 - v14;
  sub_67C4(&qword_FBE68);
  sub_1BCE0();
  __chkstk_darwin(v16);
  uint64_t v17 = sub_B38B4();
  uint64_t v18 = type metadata accessor for RREntity(v17);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  sub_B8278(v20, v49);
  uint64_t v21 = sub_11274();
  uint64_t v58 = v18;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v53 = v19;
    uint64_t v54 = a2;
    uint64_t v50 = v13;
    uint64_t v51 = a1;
    uint64_t v52 = a3;
    v59[0] = sub_B8254(v21, (SEL *)&selRef_identifier);
    v59[1] = v23;
    sub_67C4(&qword_FB580);
    uint64_t v24 = String.init<A>(describing:)();
    uint64_t v26 = v25;
    if (qword_FB218 != -1) {
      swift_once(&qword_FB218, sub_66720);
    }
    uint64_t v18 = qword_100F90;
    uint64_t v27 = *(void *)algn_100F98;
    uint64_t v28 = type metadata accessor for GroupIdentifier(0LL);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v15, 1LL, 1LL, v28);
    uint64_t v29 = sub_2BF0C();
    swift_bridgeObjectRetain(v27);
    swift_retain();
    RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:)(v24, v26, v18, v27, v22, v5, v15, v29);
    sub_B82F4(v6, 0LL);
    uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32);
    uint64_t v45 = v56;
    v44(v56, v6, v18);
    uint64_t v46 = v54;
    if (v54 && (v55 & 1) == 0)
    {
      swift_bridgeObjectRetain(v54);
      uint64_t v47 = v50;
      GroupIdentifier.init(id:seq:)(v51, v46, v52);
      sub_B8204();
      RREntity.group.setter(v47);
    }

    swift_release();
    uint64_t v43 = v57;
    v44(v57, v45, v18);
    uint64_t v42 = 0LL;
  }

  else
  {
    if (qword_FB3F0 != -1) {
      swift_once(&qword_FB3F0, sub_B6DE4);
    }
    uint64_t v30 = sub_1BD34();
    sub_5474(v30, (uint64_t)qword_1008B8);
    id v31 = v5;
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)sub_1BA1C(12LL);
      uint64_t v35 = sub_1BA1C(32LL);
      v59[0] = v35;
      *(_DWORD *)uint64_t v34 = 136315138;
      id v36 = v31;
      id v37 = [v36 description];
      static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      uint64_t v39 = v38;

      uint64_t v60 = sub_B83F0(v40, v41, v59);
      uint64_t v18 = v58;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v34 + 4, v34 + 12);

      swift_bridgeObjectRelease(v39);
      sub_1E7D8(&dword_0, v32, v33, "Fail to build rr entity from timer %s", v34);
      uint64_t v42 = 1LL;
      sub_1E7D0(v35);
      sub_1B904(v35);
      sub_1B904((uint64_t)v34);
    }

    else
    {

      uint64_t v42 = 1LL;
    }

    uint64_t v43 = v57;
  }

  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v43, v42, 1LL, v18);
}

uint64_t sub_B6DE4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_1008B8);
  sub_5474(v0, (uint64_t)qword_1008B8);
  return static SiriTimeLog.timerPlugin.getter();
}

void sub_B6E2C(uint64_t a1)
{
  uint64_t v4 = sub_B38B4();
  uint64_t v5 = type metadata accessor for SiriReferenceResolutionResolver(v4);
  __chkstk_darwin(v5);
  sub_1813C();
  if (!a1) {
    goto LABEL_11;
  }
  uint64_t v7 = CodeGenBase.entity.getter(v6);
  ((void (*)(void))static SiriReferenceResolutionResolver.shared.getter)();
  uint64_t v8 = sub_2F740();
  char v9 = SiriReferenceResolutionResolver.hasReference(usoEntity:)(v8);
  sub_2B750();
  uint64_t v10 = sub_B83D8();
  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
  static SiriReferenceResolutionResolver.shared.getter(v10);
  SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)(v7);
  sub_B83D8();
  type metadata accessor for RREntity(0LL);
  if (sub_B8384(v1) == 1)
  {
    uint64_t v11 = sub_2B750();
    sub_34CBC(v11, &qword_FBE68);
LABEL_11:
    sub_2BF0C();
    uint64_t v25 = sub_4C4E4();
    sub_B5CB8(v25);
    goto LABEL_12;
  }

  uint64_t v12 = sub_2BF0C();
  uint64_t v13 = (void *)RREntity.convertData<A>(to:)(v12, v12);
  sub_B82B4();
  if (!v13)
  {
LABEL_10:
    sub_2B750();
    goto LABEL_11;
  }

  if (qword_FB3F0 != -1) {
    swift_once(&qword_FB3F0, sub_B6DE4);
  }
  uint64_t v14 = sub_1BD34();
  sub_5474(v14, (uint64_t)qword_1008B8);
  id v15 = v13;
  sub_B83E4();
  os_log_type_t v16 = sub_1BCD0();
  if (sub_2BDE0(v16))
  {
    uint64_t v17 = (_DWORD *)sub_1BA1C(12LL);
    uint64_t v18 = sub_1BA1C(32LL);
    v27[0] = v18;
    *uint64_t v17 = 136315138;
    id v19 = 0LL;
    id v20 = [v19 description];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    sub_B8354();

    uint64_t v26 = sub_B8348(v21, v22, v27);
    sub_B8408((uint64_t)&v26, (uint64_t)v27, (uint64_t)(v17 + 1));

    sub_2BE5C();
    sub_B8218(&dword_0, v23, v24, "toSiriTimer: Resolved timer %s from SRR. Using it to search timer.");
    sub_1E7D0(v18);
    sub_1B904(v18);
    sub_1B904((uint64_t)v17);
    sub_2B750();
  }

  else
  {

    sub_2B750();
  }

LABEL_12:
  sub_17E58();
}

void sub_B70B0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SiriReferenceResolutionResolver(0LL);
  uint64_t v78 = *(void *)(v3 - 8);
  uint64_t v79 = (_DWORD *)v3;
  sub_17B6C();
  __chkstk_darwin(v4);
  sub_17D14();
  uint64_t v77 = v5;
  sub_67C4(&qword_FBE68);
  sub_1BCE0();
  __chkstk_darwin(v6);
  sub_17D14();
  uint64_t v80 = v7;
  uint64_t v8 = type metadata accessor for UsoEntity_common_ReferenceType.DefinedValues(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_18124();
  uint64_t v10 = sub_67C4(&qword_1008D0);
  sub_1BCE0();
  __chkstk_darwin(v11);
  sub_1C308();
  uint64_t v14 = v13 - v12;
  sub_67C4(&qword_1008D8);
  sub_1BCE0();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v76 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v76 - v22;
  if (!a1)
  {
    if (qword_FB3F0 != -1) {
      swift_once(&qword_FB3F0, sub_B6DE4);
    }
    uint64_t v28 = sub_1BD34();
    uint64_t v29 = sub_5474(v28, (uint64_t)qword_1008B8);
    uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)sub_1BA1C(2LL);
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_0, v30, v31, "Failed parsing NoEntity reference: nil", v32, 2u);
      sub_1B904((uint64_t)v32);
    }

    goto LABEL_29;
  }

  uint64_t v24 = sub_87FFC();
  uint64_t v82 = CodeGenBase.entity.getter(v24);
  uint64_t v25 = sub_87FFC();
  uint64_t v26 = dispatch thunk of CodeGenGlobalArgs.usoReferenceType.getter(v25);
  uint64_t v81 = a1;
  uint64_t v27 = sub_1BC50();
  if (v26)
  {
    dispatch thunk of UsoEntity_common_ReferenceType.definedValue.getter(v27);
    sub_1E84C();
  }

  else
  {
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v23, 1LL, 1LL, v8);
  }

  (*(void (**)(char *, void, uint64_t))(v9 + 104))( v21,  enum case for UsoEntity_common_ReferenceType.DefinedValues.common_ReferenceType_DefiniteReference(_:),  v8);
  sub_B8204();
  uint64_t v33 = v14 + *(int *)(v10 + 48);
  sub_B8070((uint64_t)v23, v14);
  sub_B8070((uint64_t)v21, v33);
  sub_381CC(v14);
  if (v35)
  {
    sub_B8294((uint64_t)v21);
    sub_B8294((uint64_t)v23);
    sub_381CC(v33);
    if (v35)
    {
      sub_DABC(v14, &qword_1008D8);
      uint64_t v34 = v82;
      goto LABEL_20;
    }

uint64_t sub_B77C4(uint64_t a1)
{
  switch(a1)
  {
    case 2LL:
      return String.toSpeakableString.getter(0x656369766564LL, 0xE600000000000000LL);
    case 1LL:
      return String.toSpeakableString.getter(1836019570LL, 0xE400000000000000LL);
    case 0LL:
      return String.toSpeakableString.getter(0x6E776F6E6B6E75LL, 0xE700000000000000LL);
  }

  v4[1] = v1;
  void v4[2] = v2;
  v4[0] = a1;
  uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)( &type metadata for SiriTargetMatchType,  v4,  &type metadata for SiriTargetMatchType,  &type metadata for Int);
  __break(1u);
  return result;
}

uint64_t sub_B7844@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v6 = *a1;
  uint64_t v7 = type metadata accessor for TimerTimer.Builder(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = sub_D98C();
  uint64_t v9 = static Array._allocateUninitialized(_:)(0LL, a3);
  id v10 = [v6 device];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [v10 roomID];

    if (v12)
    {
      swift_bridgeObjectRelease(v9);
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      uint64_t v15 = v14;

      uint64_t v39 = &v38;
      uint64_t v40 = a4;
      uint64_t v16 = v41;
      uint64_t v42 = v41;
      __chkstk_darwin(v17);
      _OWORD v37[2] = a3;
      v37[3] = v13;
      v37[4] = v15;
      v37[5] = v6;
      uint64_t v18 = type metadata accessor for Array(0LL, a3);
      swift_bridgeObjectRetain(v16);
      uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v18);
      uint64_t v9 = _ArrayProtocol.filter(_:)(sub_B8050, v37, v18, WitnessTable);
      swift_bridgeObjectRelease(v15);
      a4 = v40;
    }
  }

  id v20 = [v6 label];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    unint64_t v24 = v23;

    uint64_t v25 = swift_bridgeObjectRelease(v24);
    uint64_t v26 = HIBYTE(v24) & 0xF;
    if ((v24 & 0x2000000000000000LL) == 0) {
      uint64_t v26 = v22 & 0xFFFFFFFFFFFFLL;
    }
    if (v26)
    {
      uint64_t v42 = v9;
      __chkstk_darwin(v25);
      uint64_t v40 = a4;
      v37[-2] = a3;
      v37[-1] = v6;
      uint64_t v27 = type metadata accessor for Array(0LL, a3);
      swift_bridgeObjectRetain(v9);
      uint64_t v39 = (uint64_t *)swift_getWitnessTable(&protocol conformance descriptor for [A], v27);
      char v28 = Sequence.contains(where:)(sub_B8018, &v37[-4], v27, v39);
      swift_bridgeObjectRelease(v42);
      *(_BYTE *)(v8 + OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_isLabelUniqueInRoom) = (v28 & 1) == 0;
      uint64_t v42 = v41;
      uint64_t v29 = __chkstk_darwin(v41);
      v37[-2] = a3;
      v37[-1] = v6;
      swift_bridgeObjectRetain(v29);
      uint64_t v30 = swift_getWitnessTable(&protocol conformance descriptor for [A], v27);
      uint64_t v42 = _ArrayProtocol.filter(_:)(sub_B8034, &v37[-4], v27, v30);
      __chkstk_darwin(v42);
      v37[-2] = a3;
      v37[-1] = v6;
      char v31 = Sequence.contains(where:)(sub_B81BC, &v37[-4], v27, v39);
      a4 = v40;
      swift_bridgeObjectRelease(v42);
      *(_BYTE *)(v8 + OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_isLabelUniqueAcrossGroup) = (v31 & 1) == 0;
    }
  }

  uint64_t v42 = v9;
  uint64_t v32 = type metadata accessor for Array(0LL, a3);
  uint64_t v33 = swift_getWitnessTable(&protocol conformance descriptor for [A], v32);
  LOBYTE(v32) = Collection.isEmpty.getter(v32, v33);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(v8 + OBJC_IVAR____TtCC23TimerFlowDelegatePlugin10TimerTimer7Builder_isOnlyMatchingTimerInRoom) = v32 & 1;
  swift_retain();
  sub_D378();
  uint64_t v35 = v34;
  uint64_t result = swift_release_n(v8, 2LL);
  *a4 = v35;
  return result;
}

uint64_t sub_B7BF8(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = *a1;
  id v8 = [*a1 device];
  if (!v8) {
    goto LABEL_27;
  }
  uint64_t v9 = v8;
  id v10 = [v8 roomID];

  if (!v10) {
    goto LABEL_27;
  }
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v13 = v12;

  if (v11 == a2 && v13 == a3)
  {
    swift_bridgeObjectRelease(a3);
  }

  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, v11, v13, 0LL);
    swift_bridgeObjectRelease(v13);
    char v16 = 0;
    if ((v15 & 1) == 0) {
      return v16 & 1;
    }
  }

  id v17 = [v7 identifier];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v21 = v20;
  }

  else
  {
    uint64_t v19 = 0LL;
    uint64_t v21 = 0LL;
  }

  id v22 = [a4 identifier];
  if (!v22)
  {
    if (v21) {
      goto LABEL_22;
    }
LABEL_27:
    char v16 = 0;
    return v16 & 1;
  }

  unint64_t v23 = v22;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v26 = v25;

  if (!v21)
  {
    if (v26)
    {
      uint64_t v29 = v26;
      goto LABEL_25;
    }

    goto LABEL_27;
  }

  if (!v26)
  {
LABEL_22:
    uint64_t v29 = v21;
LABEL_25:
    swift_bridgeObjectRelease(v29);
    char v16 = 1;
    return v16 & 1;
  }

  if (v19 == v24 && v21 == v26)
  {
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v26);
    goto LABEL_27;
  }

  char v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v24, v26, 0LL);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v26);
  char v16 = v28 ^ 1;
  return v16 & 1;
}

uint64_t sub_B7DC0(id *a1, void *a2)
{
  id v3 = [*a1 identifier];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = [a2 identifier];
  if (!v8)
  {
    if (v7) {
      goto LABEL_13;
    }
LABEL_18:
    char v15 = 0;
    return v15 & 1;
  }

  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v12 = v11;

  if (!v7)
  {
    if (v12)
    {
      uint64_t v16 = v12;
      goto LABEL_16;
    }

    goto LABEL_18;
  }

  if (!v12)
  {
LABEL_13:
    uint64_t v16 = v7;
LABEL_16:
    swift_bridgeObjectRelease(v16);
    char v15 = 1;
    return v15 & 1;
  }

  if (v5 == v10 && v7 == v12)
  {
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v12);
    goto LABEL_18;
  }

  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v10, v12, 0LL);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v12);
  char v15 = v14 ^ 1;
  return v15 & 1;
}

uint64_t sub_B7EDC(id *a1, void *a2)
{
  id v3 = [*a1 label];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = [a2 label];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    uint64_t v12 = v11;

    if (v7)
    {
      if (v12)
      {
        if (v5 == v10 && v7 == v12)
        {
          swift_bridgeObjectRelease(v7);
          char v14 = 1;
        }

        else
        {
          char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v10, v12, 0LL);
          swift_bridgeObjectRelease(v7);
        }

        goto LABEL_18;
      }

      goto LABEL_13;
    }

    if (v12)
    {
      char v14 = 0;
      goto LABEL_18;
    }
  }

  else if (v7)
  {
LABEL_13:
    char v14 = 0;
    uint64_t v12 = v7;
LABEL_18:
    swift_bridgeObjectRelease(v12);
    return v14 & 1;
  }

  char v14 = 1;
  return v14 & 1;
}

uint64_t sub_B7FF0(void *a1)
{
  return sub_5F3DC(a1, (SEL *)&selRef_identifier);
}

uint64_t sub_B7FFC@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_B7844(a1, *(void *)(v2 + 24), *(void *)(v2 + 16), a2);
}

uint64_t sub_B8018(id *a1)
{
  return sub_B7EDC(a1, *(void **)(v1 + 24)) & 1;
}

uint64_t sub_B8034(id *a1)
{
  return sub_B7DC0(a1, *(void **)(v1 + 24)) & 1;
}

uint64_t sub_B8050(id *a1)
{
  return sub_B7BF8(a1, *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40)) & 1;
}

uint64_t sub_B8070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_1008D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_B80B8()
{
  unint64_t result = qword_1008E0;
  if (!qword_1008E0)
  {
    uint64_t v1 = type metadata accessor for UsoEntity_common_ReferenceType.DefinedValues(255LL);
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for UsoEntity_common_ReferenceType.DefinedValues,  v1);
    atomic_store(result, (unint64_t *)&qword_1008E0);
  }

  return result;
}

id sub_B80F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v8 = [a4 initWithIdentifier:v7 displayString:a3];

  return v8;
}

uint64_t sub_B8158(void *a1)
{
  return sub_5F3DC(a1, (SEL *)&selRef_label);
}

void sub_B8164(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, *a4, v7);
}

uint64_t sub_B81BC(id *a1)
{
  return sub_B8018(a1) & 1;
}

id sub_B81D4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_B81E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, unsigned __int8 a11, uint64_t a12)
{
  return SiriTimerSnippetModel.init(timerIdentifier:directInvocation:label:duration:remainingTime:state:punchoutURL:)( v13,  v14,  *(void *)(v16 - 128),  v15,  v12,  *(void *)(v16 - 136),  *(_DWORD *)(v16 - 156),  *(void *)(v16 - 152),  *(void **)(v16 - 104),  a9,  a10,  a11,  a12);
}

uint64_t sub_B8204()
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v0, 0LL, 1LL, v1);
}

void sub_B8218(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_B822C@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return type metadata accessor for PunchOutApp(0LL);
}

uint64_t sub_B824C()
{
  return swift_endAccess(v0 - 120);
}

uint64_t sub_B8254(uint64_t a1, SEL *a2)
{
  return sub_5F3DC(v2, a2);
}

  ;
}

void sub_B8278(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_B8294(uint64_t a1)
{
  return sub_DABC(a1, v1);
}

uint64_t sub_B829C()
{
  return sub_DABC(v1, v0);
}

uint64_t sub_B82A8()
{
  return sub_DA74(v1, v0);
}

uint64_t sub_B82B4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
}

uint64_t sub_B82C8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
}

id sub_B82DC(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_B82E4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_B82F4(uint64_t a1, uint64_t a2)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(a1, a2, 1LL, *(void *)(v2 - 120));
}

uint64_t sub_B8304()
{
  return type metadata accessor for Parse.DirectInvocation(0LL);
}

uint64_t sub_B8314()
{
  return dispatch thunk of UsoEntityBuilder_common_Integer.setIntegerValue(value:)((uint64_t)v0);
}

uint64_t sub_B8324()
{
  return swift_retain_n(v0, 2LL);
}

uint64_t sub_B8334(uint64_t a1)
{
  return sub_DABC(a1, v1);
}

uint64_t sub_B833C(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v3, v2);
}

uint64_t sub_B8348(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_683C(v4, v3, a3);
}

void sub_B8354()
{
}

id sub_B8360()
{
  return [v1 *(SEL *)(v0 + 1088)];
}

id sub_B836C()
{
  return [v1 *(SEL *)(v0 + 1088)];
}

uint64_t sub_B8378()
{
  return swift_retain(v0);
}

uint64_t sub_B8384(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1, 1LL, v1);
}

id sub_B8390()
{
  return [v0 *(SEL *)(v1 + 1088)];
}

id sub_B839C(void *a1)
{
  return [a1 *(SEL *)(v1 + 1096)];
}

double sub_B83A4()
{
  return result;
}

  ;
}

void sub_B83C0(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
}

uint64_t sub_B83C8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_B83D0()
{
  return swift_release(*(void *)(v0 - 120));
}

uint64_t sub_B83D8()
{
  return v2(v1, v0);
}

uint64_t sub_B83E4()
{
  return Logger.logObject.getter();
}

uint64_t sub_B83F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_683C(v3, v4, a3);
}

NSString sub_B83FC()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_B8408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, a3, v3);
}

id sub_B8410(void *a1)
{
  return [a1 *(SEL *)(v1 + 1088)];
}

void *sub_B841C(uint64_t a1)
{
  return sub_930F4(a1);
}

uint64_t sub_B8430(void *a1, uint64_t a2)
{
  *a1 = sub_B841C(a2);
  return sub_46908(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_B8490()
{
  unint64_t result = qword_1008F8;
  if (!qword_1008F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_C4CE4, &_s25NeedsConfirmationStrategyVN_1);
    atomic_store(result, (unint64_t *)&qword_1008F8);
  }

  return result;
}

unint64_t sub_B84CC()
{
  unint64_t result = qword_100900;
  if (!qword_100900)
  {
    unint64_t result = swift_getWitnessTable(&unk_C5DC8, &_s20HandleIntentStrategyVN_5);
    atomic_store(result, (unint64_t *)&qword_100900);
  }

  return result;
}

uint64_t sub_B8508(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_100908);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_B8548(void *a1)
{
  return a1;
}

void *sub_B857C(void *a1)
{
  return a1;
}

uint64_t sub_B85B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_B85BC);
}

uint64_t sub_B85BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_7C30C(*(void *)(v2 + 24), v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_46210();
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(a1 + *(int *)(a3 + 20), a2, v8);
  }

uint64_t sub_B862C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_B8638);
}

uint64_t sub_B8638(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_46210();
    return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

uint64_t _s20HandleIntentStrategyVMa_6(uint64_t a1)
{
  uint64_t result = qword_100988;
  if (!qword_100988) {
    return swift_getSingletonMetadata(a1, &_s20HandleIntentStrategyVMn_6);
  }
  return result;
}

uint64_t sub_B86D8(uint64_t a1)
{
  v4[0] = "(";
  uint64_t result = type metadata accessor for HALTimerDeviceContext(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_B874C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100918);
  sub_5474(v0, (uint64_t)qword_100918);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_B8794(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_67C4(&qword_FBDB8);
  v3[5] = sub_1B6C8(*(void *)(v4 - 8));
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B87DC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = v2 + *(int *)(sub_BA478() + 20);
  uint64_t v4 = sub_46210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(v1, v3, v4);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1, 0LL, 1LL, v4);
  sub_6EB5C();
  uint64_t v6 = v5;
  sub_2F344(v1, &qword_FBDB8);
  sub_1BABC();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_B8888(uint64_t a1)
{
  void v2[7] = a1;
  _BYTE v2[8] = v1;
  uint64_t v3 = sub_67C4(&qword_100A18);
  void v2[9] = sub_1B6C8(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for ExecutionInfo.Action(0LL);
  v2[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[11] = v5;
  v2[12] = sub_1B6C8(v5);
  uint64_t v6 = type metadata accessor for CrossDeviceCommandExecution(0LL);
  v2[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[14] = v7;
  v2[15] = sub_1B6C8(v7);
  uint64_t v8 = sub_67C4(&qword_100A20);
  v2[16] = sub_1B6C8(*(void *)(v8 - 8));
  uint64_t v9 = type metadata accessor for UUID(0LL);
  v2[17] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[18] = v10;
  unint64_t v11 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[19] = swift_task_alloc(v11);
  v2[20] = swift_task_alloc(v11);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B8954()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = (os_log_s *)sub_8CFC((void *)(v0 + 16), v1);
  uint64_t started = dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()(v1, v2);
  if (v5)
  {
    uint64_t v6 = started;
    uint64_t v3 = v5;
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 136);
    _s20HandleIntentStrategyVwxx_0((void *)(v0 + 16));
    UUID.init(uuidString:)(v6, v3);
    sub_18034();
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v8, 1LL, v7) != 1)
    {
      uint64_t v12 = *(void *)(v0 + 160);
      uint64_t v13 = *(void *)(v0 + 144);
      uint64_t v29 = *(void *)(v0 + 136);
      uint64_t v14 = *(uint64_t **)(v0 + 120);
      uint64_t v15 = *(void *)(v0 + 96);
      uint64_t v33 = *(void *)(v0 + 112);
      uint64_t v34 = *(void *)(v0 + 104);
      uint64_t v30 = *(void *)(v0 + 88);
      uint64_t v31 = *(void *)(v0 + 152);
      uint64_t v32 = *(void *)(v0 + 80);
      (*(void (**)(uint64_t, void))(v13 + 32))(v12, *(void *)(v0 + 128));
      sub_BA478();
      uint64_t v16 = (void *)HALTimerDeviceContext.device.getter();
      sub_BA494();
      sub_BA49C();
      sub_67C4(&qword_100A50);
      uint64_t v17 = sub_67C4(&qword_FBE58);
      uint64_t v18 = swift_allocObject(v17, 40LL, 7LL);
      *(_OWORD *)(v18 + 16) = xmmword_C2690;
      *(void *)(v18 + 32) = v16;
      uint64_t v35 = v18;
      specialized Array._endMutation()(v18, v19, v20, v21, v22, v23, v24, v25);
      *uint64_t v14 = v35;
      v14[1] = 0LL;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v31, v12, v29);
      (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))( v15,  enum case for ExecutionInfo.Action.timerDismiss(_:),  v32);
      uint64_t v26 = sub_BA48C();
      sub_BA424(v26);
      id v27 = v16;
      sub_BA480(v31);
      (*(void (**)(uint64_t *, void, uint64_t))(v33 + 104))( v14,  enum case for CrossDeviceCommandExecution.started(_:),  v34);
      dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)(v14);
      swift_release();
      (*(void (**)(uint64_t *, uint64_t))(v33 + 8))(v14, v34);
      type metadata accessor for EmptyOutput(0LL);
      static EmptyOutput.instance.getter();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v29);
      goto LABEL_11;
    }

    sub_2F344(*(void *)(v0 + 128), &qword_100A20);
  }

  else
  {
    _s20HandleIntentStrategyVwxx_0((void *)(v0 + 16));
  }

  if (qword_FB3F8 != -1) {
    swift_once(&qword_FB3F8, sub_B874C);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  sub_5474(v9, (uint64_t)qword_100918);
  sub_1BD20();
  os_log_type_t v10 = sub_1BCD0();
  if (os_log_type_enabled(v3, v10))
  {
    unint64_t v11 = (uint8_t *)sub_1B9DC();
    *(_WORD *)unint64_t v11 = 0;
    sub_1BBEC( &dword_0,  v3,  v10,  "DismissTimer.HandleIntentStrategy.makePreHandleIntentOutput() returning - selectedDevice not found in halInfo",  v11);
    sub_1B904((uint64_t)v11);
  }

  type metadata accessor for EmptyOutput(0LL);
  static EmptyOutput.instance.getter();
LABEL_11:
  swift_task_dealloc();
  sub_1BABC();
  sub_1B86C();
  sub_1BA24();
  sub_1BA14();
  sub_1BA38();
  return sub_1B6AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_B8C50(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  void v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for NLContextUpdate(0LL);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  v3[12] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DialogPhase(0LL);
  v3[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[14] = v7;
  v3[15] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Logger(0LL);
  v3[16] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[17] = v9;
  v3[18] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[19] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[20] = v11;
  v3[21] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[22] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[23] = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[24] = swift_task_alloc(v14);
  v3[25] = swift_task_alloc(v14);
  uint64_t v15 = sub_67C4(&qword_100A18);
  v3[26] = swift_task_alloc((*(void *)(*(void *)(v15 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for ExecutionInfo.Action(0LL);
  v3[27] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v3[28] = v17;
  v3[29] = swift_task_alloc((*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for CrossDeviceCommandExecution(0LL);
  v3[30] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v3[31] = v19;
  v3[32] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for CrossDeviceCommandExecution.Result(0LL);
  v3[33] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v3[34] = v21;
  v3[35] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = sub_67C4(&qword_100A20);
  v3[36] = swift_task_alloc((*(void *)(*(void *)(v22 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for UUID(0LL);
  v3[37] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v3[38] = v24;
  unint64_t v25 = (*(void *)(v24 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[39] = swift_task_alloc(v25);
  v3[40] = swift_task_alloc(v25);
  return swift_task_switch(sub_B8E5C, 0LL, 0LL);
}

uint64_t sub_B8E5C()
{
  if (qword_FB3F8 != -1) {
    swift_once(&qword_FB3F8, sub_B874C);
  }
  uint64_t v3 = sub_5474(*(void *)(v2 + 128), (uint64_t)qword_100918);
  sub_1BD20();
  os_log_type_t v4 = sub_1BCD0();
  if (sub_2B854(v4))
  {
    uint64_t v5 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v5 = 0;
    sub_1BBEC(&dword_0, v0, v1, "DismissTimer.HandleIntentStrategy.makeIntentHandledResponse() called", v5);
    sub_1B904((uint64_t)v5);
  }

  static AceService.currentAsync.getter();
  uint64_t v6 = *(void *)(v2 + 40);
  uint64_t v7 = *(void *)(v2 + 48);
  sub_8CFC((void *)(v2 + 16), v6);
  uint64_t started = dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()(v6, v7);
  uint64_t v61 = v3;
  if (v9)
  {
    uint64_t v10 = started;
    uint64_t v11 = v9;
    uint64_t v13 = *(void *)(v2 + 288);
    uint64_t v12 = *(void *)(v2 + 296);
    _s20HandleIntentStrategyVwxx_0((void *)(v2 + 16));
    UUID.init(uuidString:)(v10, v11);
    if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v13, 1LL, v12) == 1)
    {
      uint64_t v14 = *(void *)(v2 + 288);
      swift_bridgeObjectRelease(v11);
      uint64_t v15 = sub_2F344(v14, &qword_100A20);
    }

    else
    {
      uint64_t v59 = *(void *)(v2 + 320);
      uint64_t v49 = *(void *)(v2 + 312);
      uint64_t v16 = *(void *)(v2 + 304);
      uint64_t v60 = *(void *)(v2 + 296);
      uint64_t v17 = *(void *)(v2 + 280);
      uint64_t v19 = *(void *)(v2 + 264);
      uint64_t v18 = *(void *)(v2 + 272);
      uint64_t v20 = *(void *)(v2 + 256);
      uint64_t v46 = *(void *)(v2 + 224);
      uint64_t v47 = *(void *)(v2 + 232);
      uint64_t v48 = *(void *)(v2 + 216);
      uint64_t v50 = *(void *)(v2 + 208);
      uint64_t v58 = *(void *)(v2 + 184);
      uint64_t v52 = *(void *)(v2 + 160);
      uint64_t v53 = *(void *)(v2 + 168);
      uint64_t v54 = *(void *)(v2 + 152);
      uint64_t v55 = *(void *)(v2 + 136);
      uint64_t v56 = *(void *)(v2 + 144);
      uint64_t v57 = *(void *)(v2 + 128);
      (*(void (**)(void))(v16 + 32))();
      uint64_t v21 = sub_67C4(&qword_FF850);
      uint64_t v22 = (void *)IntentResolutionRecord.intentResponse.getter(v21);
      uint64_t v23 = dispatch thunk of DismissTimerIntentResponse.code.getter();

      uint64_t v24 = DismissTimerIntentResponseCode.rawValue.getter(v23);
      uint64_t v25 = DismissTimerIntentResponseCode.rawValue.getter(4LL);
      uint64_t v26 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.success(_:);
      uint64_t v51 = v18;
      if (v24 != v25) {
        uint64_t v26 = (unsigned int *)&enum case for CrossDeviceCommandExecution.Result.error(_:);
      }
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v17, *v26, v19);
      sub_BA494();
      sub_BA49C();
      uint64_t v45 = v20 + *(int *)(sub_67C4(&qword_100A40) + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v49, v59, v60);
      (*(void (**)(uint64_t, void, uint64_t))(v46 + 104))( v47,  enum case for ExecutionInfo.Action.timerDismiss(_:),  v48);
      uint64_t v27 = sub_BA48C();
      _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v50, 1LL, 1LL, v27);
      ExecutionInfo.init(executionId:action:quickStopActionResult:)(v49, v47, v50);
      uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v45, v17, v19);
      sub_BA468(v28, enum case for CrossDeviceCommandExecution.ended(_:));
      dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)(v20);
      swift_release();
      sub_80788();
      (*(void (**)(uint64_t, void, uint64_t))(v52 + 104))( v53,  enum case for SiriTimeMeasurement.LogDescription.siriSuggestionsDonation(_:),  v54);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v56, v3, v57);
      uint64_t v29 = mach_absolute_time();
      SiriTimeMeasurement.init(_:log:startTime:)(v53, v56, v29);
      sub_67C4(&qword_FC420);
      uint64_t v30 = sub_BA410();
      sub_BA410();
      swift_bridgeObjectRelease(v11);
      sub_18034();
      swift_bridgeObjectRelease(v30);
      SiriTimeMeasurement.logDelta()();
      sub_2BBC0(v58);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v17, v19);
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v59, v60);
    }
  }

  else
  {
    uint64_t v15 = _s20HandleIntentStrategyVwxx_0((void *)(v2 + 16));
  }

  uint64_t v32 = *(void *)(v2 + 160);
  uint64_t v31 = *(void *)(v2 + 168);
  uint64_t v33 = *(void *)(v2 + 144);
  uint64_t v34 = *(void *)(v2 + 152);
  uint64_t v36 = *(void *)(v2 + 128);
  uint64_t v35 = *(void *)(v2 + 136);
  uint64_t v37 = static DialogPhase.completion.getter(v15);
  NLContextUpdate.init()(v37);
  sub_BA478();
  uint64_t v38 = sub_46210();
  char v39 = HALDeviceContext.shouldDismissSilently.getter(v38, &protocol witness table for HALTimerDeviceContext) & 1;
  *(_BYTE *)(v2 + 376) = v39;
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))( v31,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v34);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v33, v61, v36);
  uint64_t v40 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v31, v33, v40);
  if (qword_FB278 != -1) {
    swift_once(&qword_FB278, sub_7E3D8);
  }
  uint64_t v41 = *(void *)(v2 + 72);
  uint64_t v42 = swift_task_alloc(32LL);
  *(void *)(v2 + 328) = v42;
  *(void *)(v42 + 16) = v41;
  uint64_t v43 = (void *)swift_task_alloc(dword_FFC64);
  *(void *)(v2 + 336) = v43;
  *uint64_t v43 = v2;
  v43[1] = sub_B9354;
  return sub_9419C(v39, (uint64_t)sub_BA364, v42);
}

uint64_t sub_B9354()
{
  uint64_t v4 = *v2;
  *uint64_t v5 = v4;
  v3[43] = v1;
  swift_task_dealloc();
  sub_1BA24();
  if (v1)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    v3[44] = v0;
    uint64_t v7 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[45] = v7;
    *uint64_t v7 = v4;
    v7[1] = sub_B93F4;
    return sub_2F668();
  }

uint64_t sub_B93F4()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 352LL);
  *(void *)(*(void *)v1 + 368LL) = v0;
  swift_task_dealloc();

  sub_1B9B8();
  return sub_2B44C();
}

#error "B94E8: call analysis failed (funcsize=53)"
#error "B9558: call analysis failed (funcsize=27)"
#error "B95C4: call analysis failed (funcsize=27)"
uint64_t sub_B9600(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v2 = sub_67C4(&qword_FBD98);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v24 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - v9;
  _s20HandleIntentStrategyVMa_6(0LL);
  uint64_t v11 = type metadata accessor for HALTimerDeviceContext(0LL);
  uint64_t v12 = HALDeviceContext.remoteDevice.getter(v11, &protocol witness table for HALTimerDeviceContext);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    DeviceUnit.dialogType.getter();

    uint64_t v14 = type metadata accessor for SpeakableString(0LL);
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v14 = type metadata accessor for SpeakableString(0LL);
    uint64_t v15 = 1LL;
  }

  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v10, v15, 1LL, v14);
  uint64_t v16 = type metadata accessor for DismissTimerHandledRemoteParameters(0LL);
  sub_1B4F4((uint64_t)v10, a1 + *(int *)(v16 + 20));
  uint64_t v17 = HALDeviceContext.remoteDevice.getter(v11, &protocol witness table for HALTimerDeviceContext);
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    DeviceUnit.room.getter();
  }

  else
  {
    uint64_t v19 = type metadata accessor for SpeakableString(0LL);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v8, 1LL, 1LL, v19);
  }

  sub_1B4F4((uint64_t)v8, a1 + *(int *)(v16 + 28));
  uint64_t v20 = HALDeviceContext.remoteDevice.getter(v11, &protocol witness table for HALTimerDeviceContext);
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    DeviceUnit.deviceName.getter();
  }

  else
  {
    uint64_t v22 = type metadata accessor for SpeakableString(0LL);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v5, 1LL, 1LL, v22);
  }

  return sub_1B4F4((uint64_t)v5, a1);
}

uint64_t sub_B97D8()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100A3C);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_207EC(v1);
  return sub_B8C50(v2, v3);
}

uint64_t sub_B982C()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_B9868()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(102LL, 0x80000000000C9F40LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_B98D0(uint64_t a1)
{
  void v2[7] = a1;
  _BYTE v2[8] = v1;
  uint64_t v3 = type metadata accessor for CATOption(0LL);
  void v2[9] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[11] = v5;
  v2[12] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[14] = v7;
  v2[15] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[16] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[17] = v9;
  v2[18] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for NLContextUpdate(0LL);
  v2[19] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[20] = v11;
  v2[21] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DialogPhase(0LL);
  v2[22] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[23] = v13;
  v2[24] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_67C4(&qword_100A18);
  v2[25] = swift_task_alloc((*(void *)(*(void *)(v14 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for ExecutionInfo.Action(0LL);
  v2[26] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[27] = v16;
  v2[28] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for CrossDeviceCommandExecution(0LL);
  v2[29] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v2[30] = v18;
  v2[31] = swift_task_alloc((*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_67C4(&qword_100A20);
  v2[32] = swift_task_alloc((*(void *)(*(void *)(v19 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for UUID(0LL);
  v2[33] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v2[34] = v21;
  unint64_t v22 = (*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[35] = swift_task_alloc(v22);
  v2[36] = swift_task_alloc(v22);
  return swift_task_switch(sub_B9AC0, 0LL, 0LL);
}

uint64_t sub_B9AC0()
{
  if (qword_FB3F8 != -1) {
    swift_once(&qword_FB3F8, sub_B874C);
  }
  uint64_t v41 = sub_5474(v2[10], (uint64_t)qword_100918);
  sub_1BD20();
  os_log_type_t v3 = sub_1BCD0();
  if (sub_2B854(v3))
  {
    uint64_t v4 = (uint8_t *)sub_1B9DC();
    *(_WORD *)uint64_t v4 = 0;
    sub_1BBEC(&dword_0, v0, v1, "DismissTimer.HandleIntentStrategy.makeFailureHandlingIntentResponse() called", v4);
    sub_1B904((uint64_t)v4);
  }

  sub_BA478();
  uint64_t v5 = sub_46210();
  uint64_t v6 = (void *)HALDeviceContext.remoteDevice.getter(v5, &protocol witness table for HALTimerDeviceContext);

  if (v6)
  {
    static AceService.currentAsync.getter();
    uint64_t v8 = v2[5];
    uint64_t v9 = v2[6];
    sub_8CFC(v2 + 2, v8);
    uint64_t started = dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()(v8, v9);
    if (v11)
    {
      uint64_t v12 = started;
      uint64_t v13 = v11;
      uint64_t v15 = v2[32];
      uint64_t v14 = v2[33];
      _s20HandleIntentStrategyVwxx_0(v2 + 2);
      UUID.init(uuidString:)(v12, v13);
      sub_18034();
      if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v15, 1LL, v14) == 1)
      {
        uint64_t v7 = sub_2F344(v2[32], &qword_100A20);
      }

      else
      {
        uint64_t v17 = v2[35];
        uint64_t v16 = v2[36];
        uint64_t v18 = v2[33];
        uint64_t v19 = v2[34];
        uint64_t v20 = v2[31];
        uint64_t v21 = v2[28];
        uint64_t v22 = v2[27];
        uint64_t v38 = v2[26];
        uint64_t v40 = v19;
        (*(void (**)(uint64_t, void, uint64_t))(v19 + 32))(v16, v2[32], v18);
        sub_BA494();
        sub_BA49C();
        uint64_t v39 = v20 + *(int *)(sub_67C4(&qword_100A28) + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
        (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))( v21,  enum case for ExecutionInfo.Action.timerDismiss(_:),  v38);
        uint64_t v23 = sub_BA48C();
        sub_BA424(v23);
        sub_BA480(v17);
        uint64_t v24 = enum case for CrossDeviceCommandExecution.FailureReason.unknown(_:);
        uint64_t v25 = type metadata accessor for CrossDeviceCommandExecution.FailureReason(0LL);
        uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104LL))(v39, v24, v25);
        sub_BA468(v26, enum case for CrossDeviceCommandExecution.failed(_:));
        dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)(v20);
        swift_release();
        sub_80788();
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v16, v18);
      }
    }

    else
    {
      uint64_t v7 = _s20HandleIntentStrategyVwxx_0(v2 + 2);
    }
  }

  uint64_t v28 = v2[14];
  uint64_t v27 = v2[15];
  uint64_t v30 = v2[12];
  uint64_t v29 = v2[13];
  uint64_t v32 = v2[10];
  uint64_t v31 = v2[11];
  uint64_t v33 = v2[9];
  uint64_t v34 = static DialogPhase.error.getter(v7);
  NLContextUpdate.init()(v34);
  (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))( v27,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v41, v32);
  uint64_t v35 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v27, v30, v35);
  type metadata accessor for DeleteTimerCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  v2[37] = CATWrapper.__allocating_init(options:globals:)(v33, 0LL);
  uint64_t v36 = (void *)swift_task_alloc(dword_FE3D4);
  v2[38] = v36;
  *uint64_t v36 = v2;
  v36[1] = sub_B9E04;
  return sub_660D0();
}

uint64_t sub_B9E04()
{
  uint64_t v4 = *v2;
  *uint64_t v5 = v4;
  v3[39] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    sub_1B9B8();
    return sub_2B44C();
  }

  else
  {
    v3[40] = v0;
    uint64_t v7 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[41] = v7;
    *uint64_t v7 = v4;
    v7[1] = sub_B9EA8;
    return sub_2F668();
  }

uint64_t sub_B9EA8()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 320LL);
  *(void *)(*(void *)v1 + 336LL) = v0;
  swift_task_dealloc();

  sub_1B9B8();
  return sub_2B44C();
}

uint64_t sub_B9F08()
{
  uint64_t v64 = *(void *)(v0 + 256);
  uint64_t v71 = *(void *)(v0 + 248);
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v77 = *(void *)(v0 + 224);
  uint64_t v82 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v6 = *(void *)(v0 + 152);
  uint64_t v86 = *(void *)(v0 + 120);
  uint64_t v89 = *(void *)(v0 + 96);
  uint64_t v91 = *(void *)(v0 + 72);
  (*(void (**)(void, void))(*(void *)(v0 + 136) + 8LL))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_1BA24();
  uint64_t v7 = sub_1BA14();
  uint64_t v15 = sub_1BBDC(v7, v8, v9, v10, v11, v12, v13, v14, v64);
  uint64_t v23 = sub_1B910(v15, v16, v17, v18, v19, v20, v21, v22, v65, v71);
  uint64_t v31 = sub_1B8C4(v23, v24, v25, v26, v27, v28, v29, v30, v66, v72, v77);
  sub_1B8BC(v31, v32, v33, v34, v35, v36, v37, v38, v67, v73, v78, v82);
  sub_1BAD0();
  sub_1B86C();
  uint64_t v39 = swift_task_dealloc();
  uint64_t v47 = sub_1B8B4(v39, v40, v41, v42, v43, v44, v45, v46, v68, v74, v79, v83, v86);
  uint64_t v55 = sub_1B864(v47, v48, v49, v50, v51, v52, v53, v54, v69, v75, v80, v84, v87, v89);
  sub_1B874(v55, v56, v57, v58, v59, v60, v61, v62, v70, v76, v81, v85, v88, v90, v91);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

#error "BA024: call analysis failed (funcsize=25)"
#error "BA088: call analysis failed (funcsize=25)"
uint64_t sub_BA0BC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v1 = (void *)swift_task_alloc(dword_100A14);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_207EC(v1);
  return sub_B98D0(v2);
}

uint64_t sub_BA110()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BA14C()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(110LL, 0x80000000000C9ED0LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_BA1B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_100A4C);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10E90;
  return sub_B8888(a1);
}

uint64_t sub_BA204()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100A34);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10E90;
  return sub_B97D8();
}

uint64_t sub_BA264()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100A0C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20504;
  return sub_BA0BC();
}

uint64_t sub_BA2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_100A5C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_C5FC;
  return sub_B8794(a1, a2);
}

unint64_t sub_BA324()
{
  unint64_t result = qword_1009C8[0];
  if (!qword_1009C8[0])
  {
    uint64_t v1 = _s20HandleIntentStrategyVMa_6(255LL);
    unint64_t result = swift_getWitnessTable(&unk_C63D0, v1);
    atomic_store(result, qword_1009C8);
  }

  return result;
}

uint64_t sub_BA364(uint64_t a1)
{
  return sub_B9600(a1);
}

uint64_t sub_BA36C()
{
  return (*(uint64_t (**)(void, void))(v0[23] + 8LL))(v0[24], v0[22]);
}

uint64_t sub_BA3C0()
{
  return (*(uint64_t (**)(void, void))(v0[17] + 8LL))(v0[18], v0[16]);
}

uint64_t sub_BA410()
{
  return Dictionary.init(dictionaryLiteral:)(v0, v1);
}

uint64_t sub_BA424(uint64_t a1)
{
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v1, 1LL, 1LL, a1);
}

uint64_t sub_BA438()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_BA448()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_BA458()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_BA468(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t sub_BA478()
{
  return _s20HandleIntentStrategyVMa_6(0LL);
}

uint64_t sub_BA480(uint64_t a1)
{
  return ExecutionInfo.init(executionId:action:quickStopActionResult:)(a1, v1, v2);
}

uint64_t sub_BA48C()
{
  return type metadata accessor for ExecutionInfo.QuickStopActionResult(0LL);
}

uint64_t sub_BA494()
{
  return type metadata accessor for DeviceResolutionService(0LL);
}

uint64_t sub_BA49C()
{
  return static DeviceResolutionService.sharedAnalytics.getter();
}

uint64_t sub_BA4A4()
{
  return *(void *)(v0 + 8);
}

uint64_t type metadata accessor for PauseTimerCATPatternsExecutor(uint64_t a1)
{
  return sub_DAF8(a1, (uint64_t *)&unk_100A60, (uint64_t)&nominal type descriptor for PauseTimerCATPatternsExecutor);
}

uint64_t sub_BA4C4(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_101280);
}

void sub_BA500()
{
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_67C4(&qword_FBE20);
  uint64_t v6 = sub_34D60(v5, 176LL);
  *(_OWORD *)(v6 + 16) = xmmword_C27D0;
  *(void *)(v6 + 32) = 7368801LL;
  *(void *)(v6 + 40) = 0xE300000000000000LL;
  uint64_t v7 = *v0;
  if (*v0)
  {
    type metadata accessor for SirikitApp(0LL);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v8 = 0LL;
    *(void *)(v6 + 56) = 0LL;
    *(void *)(v6 + 64) = 0LL;
  }

  *(void *)(v6 + 48) = v8;
  sub_BB800();
  *(void *)(v6 + 72) = v9;
  *(void *)(v6 + 80) = v10;
  *(void *)(v6 + 88) = 0xEC0000007372656DLL;
  uint64_t v11 = v0[1];
  uint64_t v12 = sub_67C4(&qword_FBE28);
  *(void *)(v6 + 96) = v11;
  *(void *)(v6 + 120) = v12;
  *(void *)(v6 + 128) = 0x6174614477656976LL;
  *(void *)(v6 + 136) = 0xE800000000000000LL;
  uint64_t v13 = type metadata accessor for PauseTimerHandledOnWatchParameters(0LL);
  sub_8C84((uint64_t)v0 + *(int *)(v13 + 24), v4, &qword_FBD98);
  uint64_t v14 = sub_1BCD8();
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v4, 1LL, v14) == 1)
  {
    swift_retain();
    sub_2BC5C();
    sub_17A70(v4, &qword_FBD98);
    sub_4917C();
  }

  else
  {
    *(void *)(v6 + 168) = v14;
    uint64_t v15 = sub_49150();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL))(v15, v4, v14);
    swift_retain();
    sub_2BC5C();
  }

  sub_37FA0();
}

void sub_BA680()
{
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v18 - v5;
  uint64_t v7 = sub_67C4(&qword_FBE20);
  uint64_t v8 = (__n128 *)sub_34D60(v7, 176LL);
  sub_49090(v8, (__n128)xmmword_C27D0);
  sub_491CC(v0);
  uint64_t v9 = sub_1BCD8();
  sub_490E4((uint64_t)v6);
  if (v10)
  {
    sub_17A70((uint64_t)v6, &qword_FBD98);
    sub_4917C();
  }

  else
  {
    v8[4].n128_u64[1] = v9;
    uint64_t v11 = sub_49150();
    sub_4913C((uint64_t)v11);
  }

  sub_49100();
  v8[5].n128_u64[0] = v12;
  v8[5].n128_u64[1] = v13;
  uint64_t v14 = type metadata accessor for PauseTimerPromptConfirmParameters(0LL);
  sub_8C84(v0 + *(int *)(v14 + 20), (uint64_t)v4, &qword_FBD98);
  sub_490E4((uint64_t)v4);
  if (v10)
  {
    sub_17A70((uint64_t)v4, &qword_FBD98);
    sub_4917C();
  }

  else
  {
    v8[7].n128_u64[1] = v9;
    uint64_t v15 = sub_49150();
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v15, v4, v9);
  }

  strcpy((char *)&v8[8], "speakableTimer");
  v8[8].n128_u8[15] = -18;
  unint64_t v16 = *(void *)(v0 + *(int *)(v14 + 24));
  if (v16)
  {
    uint64_t v17 = type metadata accessor for TimerTimer(0LL);
  }

  else
  {
    uint64_t v17 = 0LL;
    v8[9].n128_u64[1] = 0LL;
    v8[10].n128_u64[0] = 0LL;
  }

  v8[9].n128_u64[0] = v16;
  v8[10].n128_u64[1] = v17;
  swift_retain();
  sub_37FA0();
}

void sub_BA81C()
{
  uint64_t v1 = v0;
  sub_67C4(&qword_FBD98);
  sub_1BCE0();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = sub_67C4(&qword_FBE20);
  uint64_t v9 = sub_34D60(v8, 128LL);
  sub_49090((__n128 *)v9, (__n128)xmmword_C27E0);
  sub_491CC(v1);
  uint64_t v10 = sub_1BCD8();
  sub_490E4((uint64_t)v7);
  if (v11)
  {
    sub_17A70((uint64_t)v7, &qword_FBD98);
    sub_4917C();
  }

  else
  {
    *(void *)(v9 + 72) = v10;
    unint64_t v12 = sub_49150();
    sub_4913C((uint64_t)v12);
  }

  sub_49100();
  *(void *)(v9 + 80) = v13;
  *(void *)(v9 + 88) = v14;
  uint64_t v15 = type metadata accessor for PauseTimerPromptConfirmAllParameters(0LL);
  sub_8C84(v1 + *(int *)(v15 + 20), (uint64_t)v5, &qword_FBD98);
  sub_490E4((uint64_t)v5);
  if (v11)
  {
    sub_17A70((uint64_t)v5, &qword_FBD98);
    *(_OWORD *)(v9 + 96) = 0u;
    *(_OWORD *)(v9 + 112) = 0u;
  }

  else
  {
    *(void *)(v9 + 120) = v10;
    unint64_t v16 = sub_DB90((void *)(v9 + 96));
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v16, v5, v10);
  }

  sub_37FA0();
}

uint64_t sub_BA96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v4[4] = a3;
  v4[5] = v3;
  void v4[2] = a1;
  void v4[3] = a2;
  uint64_t v5 = type metadata accessor for PauseTimerHandledOnWatchParameters(0LL);
  void v4[6] = v5;
  v4[7] = sub_37EE0(v5);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BA9B0()
{
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = (void (*)(void *))v0[3];
  uint64_t v3 = v0[2];
  uint64_t v4 = (uint64_t)v1 + *(int *)(v0[6] + 24LL);
  uint64_t v5 = sub_1BCD8();
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v4, 1LL, 1LL, v5);
  *uint64_t v1 = 0LL;
  v1[1] = v3;
  swift_bridgeObjectRetain(v3);
  v2(v1);
  sub_BA500();
  v0[8] = v6;
  uint64_t v7 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[9] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_BAA68;
  unint64_t v8 = sub_3813C(25LL);
  return sub_7886C(v8, v9, v10, v11);
}

uint64_t sub_BAA68()
{
  if (!v1) {
    *(void *)(v2 + 88) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BAAB8(uint64_t a1)
{
  return sub_2BB68(*(void *)(v1 + 88), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_BAAF4(uint64_t a1)
{
  return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_BAB2C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_2B82C((uint64_t)sub_BAB3C);
}

uint64_t sub_BAB3C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_67C4(&qword_FBE20);
  uint64_t v3 = sub_34D60(v2, 80LL);
  v0[4] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_C2640;
  sub_BB800();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = 0xEC0000007372656DLL;
  *(void *)(v3 + 72) = sub_67C4(&qword_FBE28);
  *(void *)(v3 + 48) = v1;
  sub_34DEC((int *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_bridgeObjectRetain(v1);
  uint64_t v6 = (void *)sub_2C084();
  v0[5] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_7D0E8;
  unint64_t v7 = sub_3813C(24LL);
  return v8(v7);
}

uint64_t sub_BAC04()
{
  uint64_t v1 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C020;
  return v3(0xD000000000000020LL, 0x80000000000CA040LL, _swiftEmptyArrayStorage);
}

uint64_t sub_BAC6C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 72) = a1;
  return sub_2B82C((uint64_t)sub_BAC80);
}

uint64_t sub_BAC80()
{
  char v1 = *(_BYTE *)(v0 + 72);
  uint64_t v2 = sub_B624C();
  *(void *)(v0 + 32) = v2;
  uint64_t v3 = sub_67C4(&qword_FBE20);
  uint64_t v4 = sub_34D60(v3, 128LL);
  *(void *)(v0 + 40) = v4;
  *(_OWORD *)(v4 + 16) = xmmword_C27E0;
  *(void *)(v4 + 32) = 0xD000000000000011LL;
  *(void *)(v4 + 40) = 0x80000000000C9FF0LL;
  *(_BYTE *)(v4 + 48) = v1;
  uint64_t v5 = sub_BB7C0(v4, (uint64_t)&type metadata for Bool);
  *(void *)(v4 + 120) = type metadata accessor for DialogDuration(v5);
  *(void *)(v4 + 96) = v2;
  swift_retain();
  uint64_t v6 = (void *)sub_2C084();
  *(void *)(v0 + 48) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_BAD6C;
  uint64_t v7 = sub_ADBF4(0xD000000000000021LL);
  return sub_7886C(v7, v8, v4, v10);
}

uint64_t sub_BAD6C()
{
  *(void *)(v2 + 56) = v1;
  swift_task_dealloc();
  sub_1BC04();
  if (!v1) {
    *(void *)(v2 + 64) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BADC4(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 40) = a3;
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 32) = a2;
  *(_BYTE *)(v4 + 96) = a1;
  return sub_2B82C((uint64_t)sub_BADDC);
}

uint64_t sub_BADDC()
{
  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v0 + 96);
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 32);
  *(void *)(v0 + 24) = 0LL;
  v1(v0 + 16);
  char v2 = *(_BYTE *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_67C4(&qword_FBE20);
  uint64_t v5 = sub_34D60(v4, 128LL);
  *(void *)(v0 + 56) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_C27E0;
  *(void *)(v5 + 32) = 0xD000000000000011LL;
  *(void *)(v5 + 40) = 0x80000000000C9FF0LL;
  *(_BYTE *)(v5 + 48) = v2;
  uint64_t v6 = sub_BB7C0(v5, (uint64_t)&type metadata for Bool);
  if (v3)
  {
    uint64_t v6 = type metadata accessor for DialogDuration(v6);
  }

  else
  {
    *(void *)(v5 + 104) = 0LL;
    *(void *)(v5 + 112) = 0LL;
  }

  *(void *)(v0 + 64) = v3;
  *(void *)(v5 + 96) = v3;
  *(void *)(v5 + 120) = v6;
  sub_34DEC((int *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  uint64_t v7 = (void *)sub_2C084();
  *(void *)(v0 + 72) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_BAEE0;
  uint64_t v8 = sub_ADBF4(0xD000000000000021LL);
  return sub_7886C(v8, v9, v5, v11);
}

uint64_t sub_BAEE0()
{
  if (!v1) {
    *(void *)(v2 + 88) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BAF34()
{
  return sub_2BB68(*(void *)(v0 + 88), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_BAF64()
{
  return sub_1ECD4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_BAF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = sub_67C4(&qword_FBD98);
  v6[8] = sub_37EE0(v7);
  uint64_t v8 = type metadata accessor for PauseTimerPromptConfirmParameters(0LL);
  v6[9] = v8;
  v6[10] = sub_37EE0(v8);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BAFEC()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v16 = v0[6];
  uint64_t v5 = v0[4];
  sub_1BCD8();
  sub_49158(v1);
  uint64_t v6 = v1 + *(int *)(v2 + 20);
  sub_49158(v6);
  uint64_t v7 = *(int *)(v2 + 24);
  *(void *)(v1 + vstatic OutputPublisherFactory.makeOutputPublisherAsync()(v0 + 7) = 0LL;
  sub_D378();
  *(void *)(v1 + vstatic OutputPublisherFactory.makeOutputPublisherAsync()(v0 + 7) = v8;
  swift_bridgeObjectRetain(v4);
  SpeakableString.init(serializedValue:)(v5, v4);
  uint64_t v9 = sub_5BDAC();
  sub_1B4F4(v9, v6);
  sub_2BC5C();
  SpeakableString.init(serializedValue:)(v16, v3);
  uint64_t v10 = sub_5BDAC();
  sub_1B4F4(v10, v1);
  sub_BA680();
  v0[11] = v11;
  unint64_t v12 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[12] = v12;
  void *v12 = v0;
  v12[1] = sub_BB10C;
  unint64_t v13 = sub_3813C(24LL);
  return v14(v13);
}

uint64_t sub_BB10C()
{
  *(void *)(v2 + 104) = v1;
  swift_task_dealloc();
  sub_1BC04();
  if (!v1) {
    *(void *)(v2 + 112) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BB164()
{
  swift_bridgeObjectRelease(v1);
  sub_1BC04();
  sub_1BABC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 112));
}

uint64_t sub_BB1D0()
{
  swift_bridgeObjectRelease(v1);
  sub_1BC04();
  sub_1BABC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_BB238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = type metadata accessor for PauseTimerPromptConfirmAllParameters(0LL);
  v5[7] = v6;
  v5[8] = sub_37EE0(v6);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BB280()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  sub_1BCD8();
  sub_49158(v1);
  sub_49158(v1 + *(int *)(v2 + 20));
  sub_BCF24(v1, v6, v5, v4, v3);
  sub_BA81C();
  v0[9] = v7;
  uint64_t v8 = (void *)sub_37EF4((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  v0[10] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_BB344;
  unint64_t v9 = sub_3813C(27LL);
  return v10(v9);
}

uint64_t sub_BB344()
{
  *(void *)(v2 + 88) = v1;
  swift_task_dealloc();
  sub_1BC04();
  if (!v1) {
    *(void *)(v2 + 96) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BB39C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 48);
  sub_38060(a1, type metadata accessor for PauseTimerPromptConfirmAllParameters);
  sub_1BC04();
  swift_bridgeObjectRelease(v2);
  sub_1BABC();
  return sub_2FB20(*(void *)(v1 + 96), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_BB3F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 48);
  sub_38060(a1, type metadata accessor for PauseTimerPromptConfirmAllParameters);
  sub_1BC04();
  swift_bridgeObjectRelease(v2);
  sub_1BABC();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_BB44C()
{
  return type metadata accessor for PauseTimerCATPatternsExecutor(0LL);
}

uint64_t sub_BB454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_BB460);
}

void sub_BB460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_17B78();
  }

  else
  {
    uint64_t v6 = sub_67C4(&qword_FBD98);
    sub_17EA4(a1 + *(int *)(a3 + 24), a2, v6);
  }

uint64_t sub_BB4C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_BB4D4);
}

void sub_BB4D4()
{
  if (v3 == 0x7FFFFFFF)
  {
    *(void *)(v1 + 8) = (v0 - 1);
    sub_17B78();
  }

  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_67C4(&qword_FBD98);
    sub_17EB0(v1 + *(int *)(v4 + 24), v0, v0, v5);
  }

uint64_t type metadata accessor for PauseTimerHandledOnWatchParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_100B28, (uint64_t)&nominal type descriptor for PauseTimerHandledOnWatchParameters);
}

void sub_BB544(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_367C0(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

uint64_t type metadata accessor for PauseTimerPromptConfirmAllParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_100C70, (uint64_t)&nominal type descriptor for PauseTimerPromptConfirmAllParameters);
}

uint64_t type metadata accessor for PauseTimerPromptConfirmParameters(uint64_t a1)
{
  return sub_DAF8(a1, qword_100BD8, (uint64_t)&nominal type descriptor for PauseTimerPromptConfirmParameters);
}

uint64_t sub_BB5EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_BB5F8);
}

void sub_BB5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67C4(&qword_FBD98);
  if (*(_DWORD *)(*(void *)(v4 - 8) + 84LL) == (_DWORD)a2) {
    sub_17EA4(a1, a2, v4);
  }
  else {
    sub_17B78();
  }
}

uint64_t sub_BB670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_BB67C);
}

void sub_BB67C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(_DWORD *)(*(void *)(sub_67C4(&qword_FBD98) - 8) + 84LL) == a3)
  {
    uint64_t v8 = sub_491B8();
    sub_17EB0(v8, v9, v10, v11);
  }

  else
  {
    *(void *)(v5 + *(int *)(a4 + 24)) = v4;
    sub_17B78();
  }

void sub_BB6D4(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = v4[0];
    void v4[2] = "\b";
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

uint64_t sub_BB748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_BB754);
}

uint64_t sub_BB754()
{
  uint64_t v2 = sub_67C4(&qword_FBD98);
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v1, v0, v2);
}

uint64_t sub_BB788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_BB794);
}

uint64_t sub_BB794()
{
  uint64_t v0 = sub_491B8();
  return _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v0, v1, v2, v3);
}

uint64_t sub_BB7C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 72) = a2;
  strcpy((char *)(a1 + 80), "remainingTime");
  *(_WORD *)(a1 + 94) = -4864;
  return 0LL;
}

uint64_t sub_BB7F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *v3;
  *(void *)(v4 + 80) = v2;
  return swift_task_dealloc(a1);
}

  ;
}

uint64_t sub_BB814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v16 - v9;
  char v11 = dispatch thunk of DeviceState.isPhone.getter(v8);
  sub_BB918((uint64_t)v10);
  if ((v11 & 1) != 0) {
    char v12 = 1;
  }
  else {
    char v12 = dispatch thunk of DeviceState.isPad.getter(a1, a2);
  }
  unint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v10, a1);
  sub_BB918((uint64_t)v7);
  if ((v12 & 1) != 0) {
    char v14 = 1;
  }
  else {
    char v14 = dispatch thunk of DeviceState.isPod.getter(a1, a2);
  }
  v13(v7, a1);
  return v14 & 1;
}

uint64_t sub_BB918(uint64_t a1)
{
  return v3(a1, v2, v1);
}

uint64_t sub_BB924(uint64_t a1)
{
  return sub_2C164( a1,  (void (*)(void))type metadata accessor for SearchForTimersCATsSimple,  (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:),  &qword_101290);
}

uint64_t sub_BB940(uint64_t a1)
{
  return sub_2C164( a1,  (void (*)(void))type metadata accessor for SearchForTimersCATPatternsExecutor,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_101298);
}

ValueMetadata *_s25NeedsConfirmationStrategyVMa_3()
{
  return &_s25NeedsConfirmationStrategyVN_3;
}

uint64_t sub_BB96C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100CA8);
  sub_5474(v0, (uint64_t)qword_100CA8);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_BB9B4()
{
  uint64_t v0 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static SiriTimeFeatureFlagsImpl.instance.getter(v2);
  Swift::Bool v5 = SiriTimeFeatureFlagsImpl.isCrossDeviceEnabled()();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if (v5)
  {
    uint64_t v6 = sub_67C4(&qword_FFC38);
    uint64_t v7 = (void *)ParameterResolutionRecord.intent.getter(v6);
    id v8 = [v7 targetTimer];

    id v9 = [v8 shouldMatchAny];
    sub_1E6A8();
    v10.super.super.Class isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
    Class isa = v10.super.super.isa;
    if (v9)
    {
      id v12 = v9;
      char v13 = static NSObject.== infix(_:_:)(v12, isa);

      if ((v13 & 1) != 0)
      {
        char v14 = (void *)ParameterResolutionRecord.intent.getter(v6);
        id v15 = [v14 targetingInfo];

        if (!v15)
        {
          if (qword_FB410 != -1) {
            swift_once(&qword_FB410, sub_BB96C);
          }
          uint64_t v16 = type metadata accessor for Logger(0LL);
          uint64_t v17 = sub_5474(v16, (uint64_t)qword_100CA8);
          uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
          os_log_type_t v19 = static os_log_type_t.default.getter();
          if (!os_log_type_enabled(v18, v19))
          {
            uint64_t v21 = 1LL;
            goto LABEL_16;
          }

          uint64_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl(&dword_0, v18, v19, "ResolveRecord indicates we are searching for a room confirmation", v20, 2u);
          uint64_t v21 = 1LL;
          goto LABEL_14;
        }
      }
    }

    else
    {
    }
  }

  if (qword_FB410 != -1) {
    swift_once(&qword_FB410, sub_BB96C);
  }
  uint64_t v22 = type metadata accessor for Logger(0LL);
  uint64_t v23 = sub_5474(v22, (uint64_t)qword_100CA8);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v18, v24))
  {
    uint64_t v21 = 0LL;
    goto LABEL_16;
  }

  uint64_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
  *(_WORD *)uint64_t v20 = 0;
  _os_log_impl(&dword_0, v18, v24, "ResolveRecord not searching for room confirmation", v20, 2u);
  uint64_t v21 = 0LL;
LABEL_14:
  swift_slowDealloc(v20, -1LL, -1LL);
LABEL_16:

  return v21;
}

uint64_t sub_BBC74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = v7 - v6;
  sub_67C4(&qword_FBDB8);
  sub_1BCE0();
  __chkstk_darwin(v9);
  sub_1C308();
  uint64_t v12 = v11 - v10;
  if (qword_FB410 != -1) {
    swift_once(&qword_FB410, sub_BB96C);
  }
  uint64_t v13 = sub_1BD34();
  sub_5474(v13, (uint64_t)qword_100CA8);
  sub_1BD20();
  os_log_type_t v14 = sub_1BCD0();
  if (os_log_type_enabled(v2, v14))
  {
    id v15 = (uint8_t *)sub_1B9DC();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_0, v2, v14, "PauseTimer.NeedsConfirmationStrategy.actionForInput() called)", v15, 2u);
    sub_1B904((uint64_t)v15);
  }

  uint64_t v16 = type metadata accessor for HALTimerDeviceContext(0LL);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v12, 1LL, 1LL, v16);
  char v17 = sub_BB9B4();
  uint64_t v18 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  os_log_type_t v19 = (unsigned int *)&enum case for DecideAction.PromptExpectation.roomConfirmation(_:);
  if ((v17 & 1) == 0) {
    os_log_type_t v19 = (unsigned int *)&enum case for DecideAction.PromptExpectation.confirmation(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 104LL))(v8, *v19, v18);
  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v8, 0LL, 1LL, v18);
  sub_3B6C0(a1, v12, 0, v8, a2);
  sub_DABC(v8, (uint64_t *)&unk_FCC70);
  return sub_DABC(v12, &qword_FBDB8);
}

uint64_t sub_BBE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  void v4[10] = v3;
  v4[7] = a1;
  void v4[8] = a2;
  uint64_t v5 = sub_67C4(&qword_FBDB0);
  v4[11] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ActionForInput(0LL);
  v4[12] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[13] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[14] = swift_task_alloc(v8);
  v4[15] = swift_task_alloc(v8);
  return swift_task_switch(sub_BBEEC, 0LL, 0LL);
}

uint64_t sub_BBEEC()
{
  if (qword_FB410 != -1) {
    swift_once(&qword_FB410, sub_BB96C);
  }
  uint64_t v2 = sub_1BD34();
  sub_5474(v2, (uint64_t)qword_100CA8);
  uint64_t v3 = (os_log_s *)sub_1BD20();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (sub_BD204(v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_691E0(v5);
    sub_69084(&dword_0, v3, v1, "PauseTimer.NeedsConfirmationStrategy.parseConfirmationResponse() called");
    sub_69074();
  }

  uint64_t v6 = sub_67C4(&qword_FFC38);
  uint64_t v7 = (void *)ParameterResolutionRecord.result.getter(v6);
  id v8 = [v7 itemToConfirm];

  sub_8AF90();
  swift_unknownObjectRelease(v8);
  uint64_t v9 = type metadata accessor for SiriTimer(0LL);
  if (sub_691C8((uint64_t)(v0 + 6), v10, (uint64_t)&type metadata for Any + 8, v9))
  {
    uint64_t v11 = (void *)v0[6];
    type metadata accessor for PauseTimerIntent(0LL);
    uint64_t v12 = (void *)ParameterResolutionRecord.intent.getter(v6);
    id v13 = [v12 targetTimer];

    id v14 = [v13 shouldMatchAny];
    id v15 = v11;
    uint64_t v16 = (void *)sub_A1FC0(v15, v14);
    if ((sub_BB9B4() & 1) != 0)
    {
      uint64_t v17 = v0[8];
      sub_70A20();
      sub_71C70(v17, v18, v19, v20, v21, v22, v23, v24, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54);
      __asm { BR              X10 }
    }

    uint64_t v37 = v0[11];
    uint64_t v38 = enum case for ConfirmationResponse.confirmed(_:);
    uint64_t v39 = type metadata accessor for ConfirmationResponse(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104LL))(v37, v38, v39);
    _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0(v37, 0LL, 1LL, v39);
    id v40 = v16;
    INIntent.withEndpointId.getter(v41);
    sub_69128();
    sub_BD214(v37);

    swift_task_dealloc();
    sub_1BABC();
    sub_1B86C();
    uint64_t v36 = (uint64_t (*)(void))sub_1BB00();
  }

  else
  {
    uint64_t v26 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v27 = sub_1E324();
    uint64_t v28 = sub_1B74C(v26, v27);
    *uint64_t v29 = 2;
    sub_64328(v28, (uint64_t)v29, v30, v31, v32, v33, v34, v35);
    sub_1BABC();
    sub_1B86C();
    sub_1BA14();
    uint64_t v36 = (uint64_t (*)(void))v0[1];
  }

  return v36();
}

uint64_t sub_BC40C()
{
  os_log_type_t v1 = (void *)swift_task_alloc(dword_100D34);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_6CCEC(v1);
  return sub_BBE54(v2, v3, v4);
}

uint64_t sub_BC464()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BC4A0()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(115LL, 0x80000000000CA130LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_BC508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a1;
  v3[8] = a3;
  uint64_t v4 = type metadata accessor for TemplatingResult(0LL);
  void v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = sub_1B970();
  v3[12] = sub_1B970();
  v3[13] = sub_1B970();
  uint64_t v5 = type metadata accessor for CATOption(0LL);
  v3[14] = sub_1B6C8(*(void *)(v5 - 8));
  uint64_t v6 = sub_1BD34();
  v3[15] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[16] = v7;
  v3[17] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[18] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[19] = v9;
  v3[20] = sub_1B6C8(v9);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[21] = v10;
  v3[22] = *(void *)(v10 - 8);
  v3[23] = sub_1B970();
  v3[24] = sub_1B970();
  v3[25] = sub_1B970();
  uint64_t v11 = type metadata accessor for NLContextUpdate(0LL);
  v3[26] = v11;
  v3[27] = *(void *)(v11 - 8);
  v3[28] = sub_1B970();
  v3[29] = sub_1B970();
  v3[30] = sub_1B970();
  uint64_t v12 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v3[31] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[32] = v13;
  v3[33] = sub_1B6C8(v13);
  uint64_t v14 = type metadata accessor for DialogPhase(0LL);
  v3[34] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[35] = v15;
  v3[36] = sub_1B6C8(v15);
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BC65C()
{
  if (qword_FB410 != -1) {
    swift_once(&qword_FB410, sub_BB96C);
  }
  uint64_t v2 = sub_5474(v0[15], (uint64_t)qword_100CA8);
  uint64_t v3 = (os_log_s *)sub_1BD20();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (sub_BD204(v4))
  {
    uint64_t v5 = (_WORD *)sub_1B9DC();
    sub_691E0(v5);
    sub_69084(&dword_0, v3, v1, "PauseTimer.NeedsConfirmationStrategy.makePromptForConfirmation() called");
    sub_69074();
  }

  uint64_t v6 = (void *)sub_67C4(&qword_FFC38);
  uint64_t v7 = (void *)ParameterResolutionRecord.result.getter(v6);
  id v8 = [v7 itemToConfirm];

  sub_8AF90();
  swift_unknownObjectRelease(v8);
  uint64_t v9 = type metadata accessor for SiriTimer(0LL);
  uint64_t v11 = sub_691C8((uint64_t)(v0 + 6), v10, (uint64_t)&type metadata for Any + 8, v9);
  if (!(_DWORD)v11)
  {
    uint64_t v37 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v38 = sub_1E324();
    uint64_t v39 = sub_1B74C(v37, v38);
    _BYTE *v40 = 2;
    uint64_t v155 = v39;
    sub_64328(v39, (uint64_t)v40, v41, v42, v43, v44, v45, v46);
    goto LABEL_12;
  }

  uint64_t v13 = v0[32];
  uint64_t v12 = v0[33];
  uint64_t v14 = v0[31];
  uint64_t v15 = (void *)v0[6];
  v0[37] = v15;
  uint64_t v16 = static DialogPhase.confirmation.getter(v11);
  static SiriTimeFeatureFlagsImpl.instance.getter(v16);
  Swift::Bool v17 = SiriTimeFeatureFlagsImpl.isCrossDeviceEnabled()();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
  uint64_t v19 = v18(v12, v14);
  if (v17)
  {
    id v20 = sub_B82DC(v19, "shouldMatchAny");
    sub_32A64();
    v21.super.super.Class isa = sub_690FC().super.super.isa;
    Class isa = v21.super.super.isa;
    if (v20)
    {
      id v23 = v20;
      char v24 = static NSObject.== infix(_:_:)(v23, isa);

      if ((v24 & 1) != 0)
      {
        id v26 = [(id)ParameterResolutionRecord.intent.getter(v6) targetingInfo];
        sub_69128();

        if (!v6)
        {
          uint64_t v28 = v0[19];
          uint64_t v27 = v0[20];
          uint64_t v30 = v0[17];
          uint64_t v29 = v0[18];
          uint64_t v31 = v0[15];
          uint64_t v32 = v0[16];
          uint64_t v33 = v0[14];
          sub_A9614();
          (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))( v27,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v29);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v30, v2, v31);
          uint64_t v34 = mach_absolute_time();
          SiriTimeMeasurement.init(_:log:startTime:)(v27, v30, v34);
          type metadata accessor for PauseTimerCATsSimple(0LL);
          static CATOption.defaultMode.getter();
          v0[38] = CATWrapperSimple.__allocating_init(options:globals:)(v33, 0LL);
          uint64_t v35 = (void *)swift_task_alloc(dword_10020C);
          v0[39] = v35;
          *uint64_t v35 = v0;
          v35[1] = sub_8A058;
          sub_2B904();
          return sub_A2BAC();
        }
      }
    }

    else
    {
    }

    id v80 = sub_B82DC(v25, "device");

    if (v80)
    {
      uint64_t v82 = v0[19];
      uint64_t v81 = v0[20];
      uint64_t v84 = v0[17];
      uint64_t v83 = v0[18];
      uint64_t v85 = v0[16];
      uint64_t v86 = v0[14];
      sub_A9100();
      (*(void (**)(uint64_t, void, uint64_t))(v82 + 104))( v81,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v83);
      sub_691BC(v84, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v85 + 16));
      uint64_t v87 = mach_absolute_time();
      SiriTimeMeasurement.init(_:log:startTime:)(v81, v84, v87);
      type metadata accessor for TimerBaseCATsSimple(0LL);
      static CATOption.defaultMode.getter();
      v0[43] = CATWrapperSimple.__allocating_init(options:globals:)(v86, 0LL);
      sub_D378();
      v0[44] = v88;
      uint64_t v89 = (void *)swift_task_alloc(dword_FDA94);
      v0[45] = v89;
      sub_69188(v89, (uint64_t)sub_8A1F8);
      sub_2B904();
      return sub_5A800(v90);
    }
  }

  uint64_t v91 = v0[33];
  uint64_t v92 = v0[31];
  sub_A9100();
  static SiriTimeFeatureFlagsImpl.instance.getter(v93);
  Swift::Bool v94 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  uint64_t v95 = v18(v91, v92);
  if (v94)
  {
    uint64_t v96 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v95);

    object = AceObject.serializeToBase64()().value._object;
    v0[49] = object;
    if (object)
    {
      uint64_t v100 = (void *)static InvocationFactory.makeConfirmAndRejectActions()(v99);
      uint64_t v102 = v101;

      uint64_t v103 = AceObject.serializeToBase64()().value._object;
      v0[50] = v103;
      if (v103)
      {
        uint64_t v104 = v0[20];
        uint64_t v105 = v15;
        uint64_t v106 = v0[17];
        uint64_t v107 = v0[16];
        (*(void (**)(uint64_t, void, void))(v0[19] + 104LL))( v104,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[18]);
        sub_691BC(v106, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v107 + 16));
        uint64_t v108 = mach_absolute_time();
        SiriTimeMeasurement.init(_:log:startTime:)(v104, v106, v108);
        id v109 = [v105 shouldMatchAny];
        sub_32A64();
        v110.super.super.Class isa = sub_690FC().super.super.isa;
        Class v111 = v110.super.super.isa;
        if (v109)
        {
          id v112 = v109;
          char v113 = static NSObject.== infix(_:_:)(v112, v111);

          if ((v113 & 1) != 0)
          {
            if (qword_FB148 != -1) {
              swift_once(&qword_FB148, sub_2C148);
            }
            uint64_t v114 = unk_100B74;
            swift_bridgeObjectRetain(object);
            swift_bridgeObjectRetain(v103);
            uint64_t v115 = (void *)swift_task_alloc(v114);
            v0[51] = v115;
            sub_69188(v115, (uint64_t)sub_8A390);
            sub_2B904();
            __asm { BR              X5 }
          }
        }

        else
        {
        }

        if (qword_FB148 != -1) {
          swift_once(&qword_FB148, sub_2C148);
        }
        uint64_t v147 = unk_100B7C;
        swift_bridgeObjectRetain(object);
        swift_bridgeObjectRetain(v103);
        id v148 = v105;
        uint64_t v149 = (void *)swift_task_alloc(v147);
        v0[53] = v149;
        sub_69188(v149, (uint64_t)sub_8A41C);
        sub_2B904();
        __asm { BR              X6 }
      }

      uint64_t v99 = swift_bridgeObjectRelease(object);
    }

    uint64_t v128 = (os_log_s *)Logger.logObject.getter(v99);
    os_log_type_t v129 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v128, v129))
    {
      uint64_t v130 = (uint8_t *)sub_1B9DC();
      *(_WORD *)uint64_t v130 = 0;
      _os_log_impl(&dword_0, v128, v129, "Could not create direct invocation for confirm or reject actions.", v130, 2u);
      sub_1B904((uint64_t)v130);
    }

    uint64_t v131 = v0[35];
    uint64_t v132 = v0[36];
    uint64_t v133 = v0[34];
    uint64_t v135 = v0[27];
    uint64_t v134 = v0[28];
    uint64_t v136 = v0[26];

    uint64_t v137 = sub_67C4((uint64_t *)&unk_FF830);
    unint64_t v138 = sub_1E324();
    uint64_t v139 = sub_1B74C(v137, v138);
    *uint64_t v140 = 0;
    uint64_t v155 = v139;
    sub_64328(v139, (uint64_t)v140, v141, v142, v143, v144, v145, v146);

    (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v134, v136);
    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v132, v133);
LABEL_12:
    uint64_t v159 = v0[14];
    uint64_t v163 = v0[13];
    uint64_t v166 = v0[12];
    uint64_t v168 = v0[11];
    swift_task_dealloc();
    sub_1B86C();
    sub_1BA24();
    sub_1BA14();
    sub_1BA38();
    sub_1B838();
    sub_1BA8C();
    sub_1BA60();
    sub_1BAD0();
    uint64_t v47 = sub_1BABC();
    uint64_t v55 = sub_1B8C4(v47, v48, v49, v50, v51, v52, v53, v54, v151, v155, v159);
    uint64_t v63 = sub_1B8BC(v55, v56, v57, v58, v59, v60, v61, v62, v152, v156, v160, v163);
    uint64_t v71 = sub_1B8B4(v63, v64, v65, v66, v67, v68, v69, v70, v153, v157, v161, v164, v166);
    sub_1B864(v71, v72, v73, v74, v75, v76, v77, v78, v154, v158, v162, v165, v167, v168);
    sub_2B904();
    __asm { BR              X0 }
  }

  id v117 = sub_B82DC(v95, "shouldMatchAny");
  sub_32A64();
  v118.super.super.Class isa = sub_690FC().super.super.isa;
  Class v119 = v118.super.super.isa;
  if (v117)
  {
    id v120 = v117;
    char v121 = static NSObject.== infix(_:_:)(v120, v119);

    if ((v121 & 1) != 0)
    {
      if (qword_FB140 != -1) {
        swift_once(&qword_FB140, sub_2C12C);
      }
      uint64_t v122 = (void *)swift_task_alloc(dword_10029C);
      v0[58] = v122;
      *uint64_t v122 = v0;
      v122[1] = sub_8A5AC;
      sub_2B904();
      return sub_A3B04(v123);
    }
  }

  else
  {
  }

  if (qword_FB140 != -1) {
    swift_once(&qword_FB140, sub_2C12C);
  }
  sub_D378();
  v0[60] = v124;
  uint64_t v125 = (void *)swift_task_alloc(dword_100294);
  v0[61] = v125;
  *uint64_t v125 = v0;
  v125[1] = sub_8A690;
  sub_2B904();
  return sub_A39E0(v126, v127);
}

uint64_t sub_BCF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = v12 - v11;
  swift_bridgeObjectRetain(a3);
  SpeakableString.init(serializedValue:)(a2, a3);
  type metadata accessor for SpeakableString(0LL);
  sub_69174();
  uint64_t v14 = type metadata accessor for PauseTimerPromptConfirmAllParameters(0LL);
  sub_1B4F4(v13, a1 + *(int *)(v14 + 20));
  swift_bridgeObjectRetain(a5);
  SpeakableString.init(serializedValue:)(a4, a5);
  sub_69174();
  return sub_1B4F4(v13, a1);
}

uint64_t sub_BCFF4()
{
  os_log_type_t v1 = (void *)swift_task_alloc(dword_100D24);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_6CCEC(v1);
  return sub_BC508(v2, v3, v4);
}

uint64_t sub_BD04C()
{
  if (!v0) {
    return sub_1ECD4(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_1B9B8();
  return sub_1B758();
}

uint64_t sub_BD088()
{
  uint64_t v2 = sub_67C4(&qword_FBF48);
  sub_207C0(123LL, 0x80000000000CA0B0LL, v3, v2, (uint64_t)&protocol self-conformance witness table for Error);
  sub_207B4();
  swift_errorRelease(v0);
  return sub_2075C(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_BD0F4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100D2C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_C630;
  return sub_BC40C();
}

uint64_t sub_BD15C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100D1C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2A040;
  return sub_BCFF4();
}

unint64_t sub_BD1C8()
{
  unint64_t result = qword_100CD0[0];
  if (!qword_100CD0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_C65AC, &_s25NeedsConfirmationStrategyVN_3);
    atomic_store(result, qword_100CD0);
  }

  return result;
}

BOOL sub_BD204(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_BD214(uint64_t a1)
{
  return NeedsConfirmationAnswer.init(answeredValue:updatedIntent:)(a1, v2, v1);
}

id sub_BD220()
{
  return [v0 *(SEL *)(v1 + 1136)];
}

ValueMetadata *_s24UnsupportedValueStrategyVMa_0()
{
  return &_s24UnsupportedValueStrategyVN_0;
}

uint64_t sub_BD23C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1B53C(v0, qword_100D38);
  sub_5474(v0, (uint64_t)qword_100D38);
  return static SiriTimeLog.timerFlow.getter();
}

uint64_t sub_BD284(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = type metadata accessor for CATOption(0LL);
  v2[5] = sub_1B6C8(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  void v2[7] = v5;
  _BYTE v2[8] = sub_1B6C8(v5);
  uint64_t v6 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  void v2[9] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[10] = v7;
  v2[11] = sub_1B6C8(v7);
  uint64_t v8 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[12] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[13] = v9;
  v2[14] = sub_2B4DC(v9);
  v2[15] = sub_1B970();
  uint64_t v10 = sub_67C4(&qword_FDD48);
  v2[16] = sub_1B6C8(*(void *)(v10 - 8));
  uint64_t v11 = type metadata accessor for TimerHandlerError(0LL);
  v2[17] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[18] = v12;
  v2[19] = sub_2B4DC(v12);
  v2[20] = sub_1B970();
  uint64_t v13 = type metadata accessor for NLContextUpdate(0LL);
  v2[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[22] = v14;
  v2[23] = sub_2B4DC(v14);
  v2[24] = sub_1B970();
  v2[25] = sub_1B970();
  v2[26] = sub_1B970();
  uint64_t v15 = type metadata accessor for DialogPhase(0LL);
  v2[27] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[28] = v16;
  v2[29] = sub_2B4DC(v16);
  v2[30] = sub_1B970();
  v2[31] = sub_1B970();
  v2[32] = sub_1B970();
  uint64_t v17 = sub_67C4((uint64_t *)&unk_FCC40);
  v2[33] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v2[34] = v18;
  v2[35] = sub_1B6C8(v18);
  sub_1B9B8();
  return swift_task_switch(v19, v20, v21);
}

uint64_t sub_BD3EC()
{
  if (qword_FB418 != -1) {
    swift_once(&qword_FB418, sub_BD23C);
  }
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[35];
  uint64_t v3 = v0[4];
  uint64_t v4 = sub_5474(v0[6], (uint64_t)qword_100D38);
  uint64_t v5 = sub_9CBF8(v2, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  uint64_t v61 = v4;
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[34];
  uint64_t v9 = v0[35];
  uint64_t v11 = v0[33];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v12 = 134217984;
    uint64_t v13 = (void *)ParameterResolutionRecord.result.getter(v11);
    id v14 = [v13 unsupportedReason];

    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    uint64_t v16 = (SEL *)&unk_FA000;
    sub_433D8(v9, v15);
    v0[2] = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v12 + 4, v12 + 12);
    _os_log_impl( &dword_0,  v6,  v7,  "CreateTimer.UnsupportedValueStrategy.makeUnsupportedValueOutput() called with unsupportedReason: %ld",  v12,  0xCu);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
    sub_433D8(v0[35], *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    uint64_t v16 = (SEL *)&unk_FA000;
  }

  uint64_t v17 = v0[33];
  uint64_t v19 = v0[16];
  uint64_t v18 = v0[17];
  static DialogPhase.clarification.getter(v20);
  uint64_t v21 = type metadata accessor for DialogDuration.Builder(0LL);
  uint64_t v22 = swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  DialogDuration.Builder.init()(v22);
  id v23 = (void *)ParameterResolutionRecord.intent.getter(v17);
  double Timer = CreateTimerIntent.duration.getter();

  dispatch thunk of DialogDuration.Builder.withSecs(_:)(*(void *)&Timer, 0LL);
  uint64_t v25 = swift_release();
  uint64_t v26 = dispatch thunk of DialogDuration.Builder.build()(v25);
  v0[36] = v26;
  swift_release();
  sub_ABA2C();
  uint64_t v27 = (void *)ParameterResolutionRecord.result.getter(v17);
  id v28 = [v27 v16[180]];

  static TimerHandlerError.from(unsupportedReason:)(v28);
  if (_s23TimerFlowDelegatePlugin19SiriTimePluginModelOwet_0(v19, 1LL, v18) == 1)
  {
    uint64_t v30 = v0[10];
    uint64_t v29 = v0[11];
    uint64_t v32 = v0[8];
    uint64_t v31 = v0[9];
    uint64_t v33 = v0[6];
    uint64_t v34 = v0[7];
    sub_BE7DC(v0[16]);
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))( v29,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v31);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v61, v33);
    uint64_t v35 = mach_absolute_time();
    SiriTimeMeasurement.init(_:log:startTime:)(v29, v32, v35);
    if (qword_FB188 != -1) {
      swift_once(&qword_FB188, sub_4375C);
    }
    uint64_t v36 = v0[4];
    uint64_t v37 = swift_task_alloc(32LL);
    v0[60] = v37;
    *(void *)(v37 + 16) = v36;
    *(void *)(v37 + 24) = v26;
    unint64_t v38 = (void *)swift_task_alloc(dword_FC75C);
    v0[61] = v38;
    *unint64_t v38 = v0;
    v38[1] = sub_BDEA4;
    sub_BE944();
    return sub_36290(v39, v40);
  }

  else
  {
    uint64_t v42 = v0[20];
    uint64_t v43 = v0[17];
    uint64_t v44 = v0[18];
    uint64_t v60 = v0[19];
    uint64_t v45 = v0[10];
    uint64_t v46 = v0[11];
    uint64_t v48 = v0[8];
    uint64_t v47 = v0[9];
    uint64_t v50 = v0[6];
    uint64_t v49 = v0[7];
    sub_9CBF8(v42, v0[16], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 32));
    (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))( v46,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v47);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v48, v61, v50);
    uint64_t v51 = mach_absolute_time();
    SiriTimeMeasurement.init(_:log:startTime:)(v46, v48, v51);
    sub_9CBF8(v60, v42, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 16));
    int v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 88))(v60, v43);
    uint64_t v53 = v0[5];
    if (v52 == enum case for TimerHandlerError.durationTooLong(_:))
    {
      type metadata accessor for CreateTimerCATPatternsExecutor(0LL);
      static CATOption.defaultMode.getter();
      v0[38] = CATWrapper.__allocating_init(options:globals:)(v53, 0LL);
      uint64_t v54 = (void *)swift_task_alloc(dword_FC73C);
      v0[39] = v54;
      *uint64_t v54 = v0;
      v54[1] = sub_BD8E8;
      sub_BE944();
      return sub_353D0();
    }

    else
    {
      int v55 = v52;
      int v56 = enum case for TimerHandlerError.createSleepTimerNothingPlaying(_:);
      type metadata accessor for CreateTimerCATPatternsExecutor(0LL);
      static CATOption.defaultMode.getter();
      v0[37] = CATWrapper.__allocating_init(options:globals:)(v53, 0LL);
      if (v55 != v56)
      {
        uint64_t v58 = (void *)swift_task_alloc(unk_FCACC);
        v0[53] = v58;
        *uint64_t v58 = v0;
        v58[1] = sub_BDC74;
        sub_BE944();
        __asm { BR              X1 }
      }

      uint64_t v57 = (void *)swift_task_alloc(dword_FC764);
      v0[46] = v57;
      *uint64_t v57 = v0;
      v57[1] = sub_BDAAC;
      sub_BE944();
      return sub_36528();
    }
  }

uint64_t sub_BD8E8()
{
  *(void *)(v2 + 320) = v1;
  swift_task_dealloc();
  sub_1E83C();
  if (!v1) {
    *(void *)(v2 + 328) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BD940(uint64_t a1)
{
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v1 + 336) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_BD9A0;
  sub_BE998();
  return sub_92F94();
}

uint64_t sub_BD9A0()
{
  uint64_t v2 = (void *)v1[41];
  uint64_t v3 = v1[28];
  uint64_t v4 = v1[25];
  uint64_t v5 = v1[22];
  sub_1BC0C(v6);
  v1[43] = v0;
  swift_task_dealloc();

  os_log_type_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v1[44] = v7;
  sub_433D8(v4, v7);
  BOOL v8 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  v1[45] = v8;
  sub_2B73C(v8);
  sub_1B9B8();
  return sub_2B8E8(v9, v10, v11);
}

#error "BDA80: call analysis failed (funcsize=35)"
uint64_t sub_BDAAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sub_2F748();
  sub_1BC0C(v3);
  *(void *)(v2 + 376) = v1;
  swift_task_dealloc();
  sub_1E83C();
  if (!v1) {
    *(void *)(v2 + 384) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BDB08(uint64_t a1)
{
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v1 + 392) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_BDB68;
  sub_BE998();
  return sub_92F94();
}

uint64_t sub_BDB68()
{
  uint64_t v2 = (void *)v1[48];
  uint64_t v3 = v1[28];
  uint64_t v4 = v1[24];
  uint64_t v5 = v1[22];
  sub_1BC0C(v6);
  v1[50] = v0;
  swift_task_dealloc();

  os_log_type_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v1[51] = v7;
  sub_433D8(v4, v7);
  BOOL v8 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  v1[52] = v8;
  sub_2B73C(v8);
  sub_1B9B8();
  return sub_2B8E8(v9, v10, v11);
}

#error "BDC48: call analysis failed (funcsize=35)"
uint64_t sub_BDC74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sub_2F748();
  sub_1BC0C(v3);
  *(void *)(v2 + 432) = v1;
  swift_task_dealloc();
  sub_1E83C();
  if (!v1) {
    *(void *)(v2 + 440) = v0;
  }
  sub_1B9B8();
  return sub_2F658(v4, v5, v6);
}

uint64_t sub_BDCD0(uint64_t a1)
{
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v1 + 448) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_BDD30;
  sub_BE998();
  return sub_92F94();
}

uint64_t sub_BDD30()
{
  uint64_t v2 = (void *)v1[55];
  uint64_t v3 = v1[28];
  uint64_t v5 = v1[22];
  uint64_t v4 = v1[23];
  sub_1BC0C(v6);
  v1[57] = v0;
  swift_task_dealloc();

  os_log_type_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v1[58] = v7;
  sub_433D8(v4, v7);
  BOOL v8 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  v1[59] = v8;
  sub_2B73C(v8);
  sub_1B9B8();
  return sub_2B8E8(v9, v10, v11);
}

#error "BDE70: call analysis failed (funcsize=61)"
uint64_t sub_BDEA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  sub_2F748();
  sub_1BC0C(v4);
  v3[62] = v1;
  swift_task_dealloc();
  sub_1BA24();
  if (v1)
  {
    sub_1B9B8();
    return sub_2F658(v5, v6, v7);
  }

  else
  {
    v3[63] = v0;
    uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v3[64] = v9;
    *uint64_t v9 = v2;
    v9[1] = sub_BDF44;
    return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v3[3],  v3[32],  v3[26],  v3[14],  0LL);
  }

uint64_t sub_BDF44()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 504LL);
  *(void *)(*(void *)v1 + 52Hasher.init(_seed:)(v2, 0LL) = v0;
  swift_task_dealloc();

  sub_1B9B8();
  return swift_task_switch(v3, v4, v5);
}

#error "BE000: call analysis failed (funcsize=33)"
#error "BE094: call analysis failed (funcsize=37)"
#error "BE124: call analysis failed (funcsize=36)"
#error "BE1B8: call analysis failed (funcsize=37)"
#error "BE248: call analysis failed (funcsize=36)"
uint64_t sub_BE274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v41;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v114 = *(void *)(v0 + 224);
  uint64_t v115 = *(void *)(v0 + 216);
  os_log_type_t v116 = *(void *)(v0 + 256);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 104);
  swift_release();
  sub_2B950(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  uint64_t v4 = *(void (**)(uint64_t))(v2 + 8);
  sub_BE9D4();
  sub_2B5AC(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v116, v115);
  uint64_t v5 = sub_BE8E4();
  v4(v5);
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1BA38();
  sub_1BABC();
  sub_1BA24();
  uint64_t v6 = sub_1BA14();
  id v14 = sub_1B910(v6, v7, v8, v9, v10, v11, v12, v13, v71, v79);
  uint64_t v22 = sub_1B8C4(v14, v15, v16, v17, v18, v19, v20, v21, v72, v80, v87);
  sub_1B8BC(v22, v23, v24, v25, v26, v27, v28, v29, v73, v81, v88, v94);
  uint64_t v30 = sub_1B838();
  unint64_t v38 = sub_1B8B4(v30, v31, v32, v33, v34, v35, v36, v37, v74, v82, v89, v95, v100);
  uint64_t v46 = sub_1B864(v38, v39, v40, v41, v42, v43, v44, v45, v75, v83, v90, v96, v101, v105);
  uint64_t v54 = sub_1B874(v46, v47, v48, v49, v50, v51, v52, v53, v76, v84, v91, v97, v102, v106, v109);
  uint64_t v62 = sub_1B8AC(v54, v55, v56, v57, v58, v59, v60, v61, v77, v85, v92, v98, v103, v107, v110, v112);
  sub_1B8A4(v62, v63, v64, v65, v66, v67, v68, v69, v78, v86, v93, v99, v104, v108, v111, v113, v114);
  swift_task_dealloc();
  return sub_1B9F8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_BE364()
{
  uint64_t v116 = *(void *)(v2 + 256);
  id v117 = *(void (**)(uint64_t, uint64_t))(v2 + 472);
  uint64_t v115 = *(void *)(v2 + 216);
  sub_BE9AC(*(void *)(v2 + 288));
  sub_2B950(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v5(v3, v4);
  sub_BE9C0();
  v117(v116, v115);
  uint64_t v6 = sub_BE8E4();
  ((void (*)(uint64_t))v5)(v6);
  sub_1BA8C();
  sub_1BA60();
  sub_1BAD0();
  sub_1B86C();
  sub_1BA38();
  sub_1BA24();
  uint64_t v7 = sub_1BA14();
  uint64_t v15 = sub_1B910(v7, v8, v9, v10, v11, v12, v13, v14, v72, v80);
  uint64_t v23 = sub_1B8C4(v15, v16, v17, v18, v19, v20, v21, v22, v73, v81, v88);
  sub_1B8BC(v23, v24, v25, v26, v27, v28, v29, v30, v74, v82, v89, v95);
  uint64_t v31 = sub_1B838();
  uint64_t v39 = sub_1B8B4(v31, v32, v33, v34, v35, v36, v37, v38, v75, v83, v90, v96, v101);
  uint64_t v47 = sub_1B864(v39, v40, v41, v42, v43, v44, v45, v46, v76, v84, v91, v97, v102, v106);
  uint64_t v55 = sub_1B874(v47, v48, v49, v50, v51, v52, v53, v54, v77, v85, v92, v98, v103, v107, v110);
  uint64_t v63 = sub_1B8AC(v55, v56, v57, v58, v59, v60, v61, v62, v78, v86, v93, v99, v104, v108, v111, v113);
  sub_1B8A4(v63, v64, v65, v66, v67, v68, v69, v70, v79, v87, v94, v100, v105, v109, v112, v114, v115);
  swift_task_dealloc();
  return sub_1B9F8(*(uint64_t (**)(void))(v2 + 8));
}

#error "BE49C: call analysis failed (funcsize=34)"
#error "BE524: call analysis failed (funcsize=34)"
uint64_t sub_BE550(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t TimerPromptLabelDuplicateParameters;
  uint64_t result;
  uint64_t v15;
  uint64_t v5 = sub_67C4(&qword_FBD98);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_67C4((uint64_t *)&unk_FCC40);
  uint64_t v9 = (void *)ParameterResolutionRecord.intent.getter(v8);
  uint64_t v10 = [v9 label];

  if (v10)
  {
    INSpeakableString.toSpeakableString.getter();

    uint64_t v11 = type metadata accessor for SpeakableString(0LL);
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v11 = type metadata accessor for SpeakableString(0LL);
    uint64_t v12 = 1LL;
  }

  _s23TimerFlowDelegatePlugin19SiriTimePluginModelOwst_0((uint64_t)v7, v12, 1LL, v11);
  TimerPromptLabelDuplicateParameters = type metadata accessor for CreateTimerPromptLabelDuplicateParameters(0LL);
  sub_1B4F4((uint64_t)v7, (uint64_t)a1 + *(int *)(TimerPromptLabelDuplicateParameters + 20));
  swift_retain();
  unint64_t result = swift_release();
  *a1 = a3;
  return result;
}

uint64_t sub_BE660(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_1B9B8();
  return swift_task_switch(v2, v3, v4);
}

uint64_t sub_BE67C()
{
  uint64_t v1 = sub_67C4((uint64_t *)&unk_FCC40);
  uint64_t v2 = ParameterResolutionRecord.intent.getter(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_BE6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_100D74);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B0B4;
  return sub_BD284(a1, a2);
}

uint64_t sub_BE714(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_100D6C);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_C55C;
  return sub_BE660(a1);
}

uint64_t sub_BE760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to UnsupportedValueFlowStrategyAsync.makeLaunchAppWithIntentOutput(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1B57C;
  return UnsupportedValueFlowStrategyAsync.makeLaunchAppWithIntentOutput(resolveRecord:)(a1, a2, a3, a4);
}

uint64_t sub_BE7DC(uint64_t a1)
{
  uint64_t v2 = sub_67C4(&qword_FDD48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_BE81C(void *a1)
{
  return sub_BE550(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_BE824@<X0>(uint64_t (*a1)(void, void)@<X8>)
{
  return a1(*(void *)(v1 + 256), *(void *)(v1 + 216));
}

uint64_t sub_BE878@<X0>(uint64_t (*a1)(void, void)@<X8>)
{
  return a1(*(void *)(v1 + 256), *(void *)(v1 + 216));
}

uint64_t sub_BE8C8()
{
  return swift_release(*(void *)(v0 + 288));
}

uint64_t sub_BE8E4()
{
  return *(void *)(v0 + 152);
}

uint64_t sub_BE928()
{
  return swift_release(*(void *)(v0 + 288));
}

  ;
}

uint64_t sub_BE964()
{
  return swift_release(*(void *)(v0 + 288));
}

uint64_t sub_BE98C()
{
  return v2(v1, v0);
}

uint64_t sub_BE998()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_BE9AC(uint64_t a1)
{
  return swift_release(a1);
}

uint64_t sub_BE9C0()
{
  return v2(v0, v1);
}

uint64_t sub_BE9CC()
{
  return NLContextUpdate.init()();
}

uint64_t sub_BE9D4()
{
  return v0(v1, v2);
}

uint64_t type metadata accessor for DeleteTimerCATsSimple(uint64_t a1)
{
  uint64_t result = qword_100D78;
  if (!qword_100D78) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DeleteTimerCATsSimple);
  }
  return result;
}

uint64_t sub_BEA18(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_1012A0);
}

uint64_t sub_BEA54()
{
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1C020;
  return ((uint64_t (*)(unint64_t, unint64_t, void *))v3)( 0xD000000000000021LL,  0x80000000000CA1F0LL,  _swiftEmptyArrayStorage);
}

uint64_t sub_BEACC()
{
  return type metadata accessor for DeleteTimerCATsSimple(0LL);
}
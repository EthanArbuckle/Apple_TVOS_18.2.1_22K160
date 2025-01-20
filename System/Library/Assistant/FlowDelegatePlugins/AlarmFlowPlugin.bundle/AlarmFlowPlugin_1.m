uint64_t sub_75A58(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  sub_75EAC(a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = sub_26B0(&qword_D3A08);
  *(void *)(v8 + 40) = sub_1EA3C(v9);
  sub_19840();
  return sub_21530();
}

uint64_t sub_75A98()
{
  uint64_t v4 = sub_26B0(&qword_D3BD0);
  uint64_t v5 = sub_760E0(v4);
  v1[6] = v5;
  *(_OWORD *)(v5 + 16) = xmmword_A4B30;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = 0x80000000000A8150LL;
  uint64_t v6 = sub_760CC(v5);
  uint64_t v7 = sub_76028(v6, (uint64_t)"isUserSpecifiedTomorrow");
  uint64_t v9 = sub_75F6C(v7, v8);
  uint64_t v11 = sub_76010(v9, v10);
  uint64_t v12 = sub_75FF4(v11, (uint64_t)"isUserSpecifiedEvening");
  *(void *)(v12 + 280) = 0x80000000000A81D0LL;
  sub_760EC(v12, v13, &qword_D3A08, v14, v15, v16, v17, v18, v31);
  uint64_t v19 = type metadata accessor for SpeakableString(0LL);
  sub_76048(v19);
  if (v20)
  {
    sub_19594(v0, &qword_D3A08);
    _OWORD *v2 = 0u;
    v2[1] = 0u;
  }

  else
  {
    v21 = sub_760B4();
    sub_75FC4((uint64_t)v21);
  }

  uint64_t v22 = v1[3];
  uint64_t v23 = sub_76094(v3 - 1);
  if (v22)
  {
    uint64_t v23 = type metadata accessor for DialogCalendar(v23);
  }

  else
  {
    *(void *)(v5 + 344) = 0LL;
    *(void *)(v5 + 352) = 0LL;
  }

  sub_76070(v23);
  sub_75E4C(v24);
  sub_75F8C();
  v25 = (void *)sub_58B94();
  v1[7] = v25;
  void *v25 = v1;
  v25[1] = sub_75BF8;
  uint64_t v26 = sub_75FD8(v3 + 36);
  return sub_75E90(v26, v27, v28, v29);
}

uint64_t sub_75BF8()
{
  if (v1)
  {
    sub_19840();
    return sub_19744();
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 48));
    sub_19808();
    return sub_4F354(v0, *(uint64_t (**)(void))(v3 + 8));
  }

uint64_t sub_75C4C()
{
  return sub_1B5EC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_75C7C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_2D94C((uint64_t)sub_75C8C);
}

uint64_t sub_75C8C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = sub_26B0(&qword_D3BD0);
  uint64_t v4 = sub_75F50(v3);
  uint64_t v5 = (__n128 *)sub_76088(v4);
  uint64_t v6 = sub_75F28(v5, (__n128)xmmword_A4880);
  if (v2)
  {
    uint64_t v6 = type metadata accessor for AlarmAlarm(v6);
  }

  else
  {
    *(void *)(v1 + 56) = 0LL;
    *(void *)(v1 + 64) = 0LL;
  }

  sub_760F8(v6);
  sub_75E34();
  uint64_t v7 = (void *)sub_58B94();
  *(void *)(v0 + 40) = v7;
  sub_760C0(v7, (uint64_t)sub_75780);
  sub_47D5C();
  unint64_t v8 = sub_75F5C(45LL);
  return sub_1EBFC(v8, v9, v10, v11);
}

uint64_t sub_75D1C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_2D94C((uint64_t)sub_75D2C);
}

uint64_t sub_75D2C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = sub_26B0(&qword_D3BD0);
  uint64_t v4 = sub_75F50(v3);
  uint64_t v5 = (__n128 *)sub_76088(v4);
  uint64_t v6 = sub_75F28(v5, (__n128)xmmword_A4880);
  if (v2)
  {
    uint64_t v6 = type metadata accessor for AlarmAlarm(v6);
  }

  else
  {
    *(void *)(v1 + 56) = 0LL;
    *(void *)(v1 + 64) = 0LL;
  }

  sub_760F8(v6);
  sub_75E34();
  uint64_t v7 = (void *)sub_58B94();
  *(void *)(v0 + 40) = v7;
  sub_760C0(v7, (uint64_t)sub_75DBC);
  sub_47D5C();
  unint64_t v8 = sub_75F5C(44LL);
  return sub_1EBFC(v8, v9, v10, v11);
}

uint64_t sub_75DBC()
{
  if (v0)
  {
    sub_19840();
    return sub_19744();
  }

  else
  {
    sub_76040();
    uint64_t v2 = sub_760A8();
    return sub_4F354(v2, v3);
  }

uint64_t sub_75E00()
{
  return type metadata accessor for ChangeAlarmStatusCATsSimple(0LL);
}

uint64_t sub_75E10()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 40);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 48) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_75E34()
{
  return swift_retain(v0);
}

void sub_75E4C(char a1@<W8>)
{
  *(void *)(v4 + 376) = (v2 - 32) | 0x8000000000000000LL;
  *(_BYTE *)(v4 + 384) = v1;
  *(void *)(v4 + 408) = v3;
  strcpy((char *)(v4 + 416), "isMixedAlarms");
  *(_WORD *)(v4 + 430) = -4864;
  *(void *)(v4 + 456) = v3;
  *(_BYTE *)(v4 + 432) = a1;
}

uint64_t sub_75E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_75EAC(uint64_t result, char a2, char a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  char v11 = *(_BYTE *)(v10 + 16);
  *(void *)(v9 + 24) = a7;
  *(void *)(v9 + 32) = v8;
  *(_BYTE *)(v9 + 78) = v11;
  *(_BYTE *)(v9 + 77) = a8;
  *(void *)(v9 + 16) = a6;
  *(_BYTE *)(v9 + 76) = a5;
  *(_BYTE *)(v9 + 75) = a4;
  *(_BYTE *)(v9 + 74) = a3;
  *(_BYTE *)(v9 + 73) = a2;
  *(_BYTE *)(v9 + 72) = result;
  return result;
}

  ;
}

uint64_t sub_75F04()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 56);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 64) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_75F28(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = 0x616C417065656C73LL;
  a1[2].n128_u64[1] = 0xEA00000000006D72LL;
  return 0LL;
}

uint64_t sub_75F50(uint64_t a1)
{
  return swift_allocObject(a1, 80LL, 7LL);
}

unint64_t sub_75F5C(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL;
}

uint64_t sub_75F6C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 120) = v3;
  *(void *)(result + 128) = a2;
  *(void *)(result + 136) = (v2 - 32) | 0x8000000000000000LL;
  *(_BYTE *)(result + 144) = v5;
  *(void *)(result + 168) = v3;
  *(void *)(result + 176) = v4 + 6;
  return result;
}

uint64_t sub_75F8C()
{
  return swift_retain(v0);
}

uint64_t sub_75FA4(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = 0x6D72616C61LL;
  a1[2].n128_u64[1] = 0xE500000000000000LL;
  return 0LL;
}

uint64_t sub_75FC4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 32LL))(a1, v1, v2);
}

uint64_t sub_75FD8@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_75FF4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 232) = (a2 - 32) | 0x8000000000000000LL;
  *(_BYTE *)(result + 240) = v3;
  *(void *)(result + 264) = v2;
  *(void *)(result + 272) = v4;
  return result;
}

uint64_t sub_76010@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 184) = (v2 - 32) | 0x8000000000000000LL;
  *(_BYTE *)(result + 192) = v4;
  *(void *)(result + 216) = v3;
  *(void *)(result + 224) = a2;
  return result;
}

uint64_t sub_76028@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 88) = (a2 - 32) | 0x8000000000000000LL;
  *(_BYTE *)(result + 96) = v2;
  return result;
}

uint64_t sub_76040()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 32));
}

uint64_t sub_76048(uint64_t a1)
{
  return sub_16880(v1, 1LL, a1);
}

uint64_t sub_76070(uint64_t result)
{
  v2[42] = v1;
  v2[45] = result;
  v2[46] = v3 - 2;
  return result;
}

uint64_t sub_76088(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t sub_76094@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 320) = a1;
  *(void *)(v2 + 328) = (v1 - 32) | 0x8000000000000000LL;
  return 0LL;
}

uint64_t sub_760A8()
{
  return v0;
}

void *sub_760B4()
{
  *(void *)(v2 + 312) = v0;
  return sub_19558(v1);
}

void *sub_760C0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_760CC(uint64_t result)
{
  *(_BYTE *)(result + 48) = v2;
  *(void *)(result + 72) = v1;
  *(void *)(result + 80) = v3 | 5;
  return result;
}

uint64_t sub_760E0(uint64_t a1)
{
  return swift_allocObject(a1, 464LL, 7LL);
}

uint64_t sub_760EC( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_4D80(a9, v9, a3);
}

uint64_t sub_760F8(uint64_t result)
{
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 72) = result;
  return result;
}

void *sub_76104(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *char v4 = *a2;
    char v4 = (void *)(v13 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v13);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for HALAlarmDeviceContext(0LL);
    if (sub_16880((uint64_t)v10, 1LL, v11))
    {
      uint64_t v12 = sub_26B0(&qword_D37D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_A40C((uint64_t)v9, 0LL, 1LL, v11);
    }
  }

  return v4;
}

uint64_t sub_761FC(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for HALAlarmDeviceContext(0LL);
  uint64_t result = sub_16880(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }
  return result;
}

uint64_t sub_76264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for HALAlarmDeviceContext(0LL);
  if (sub_16880((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_26B0(&qword_D37D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
    sub_A40C((uint64_t)v8, 0LL, 1LL, v10);
  }

  return a1;
}

void *sub_76328(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for HALAlarmDeviceContext(0LL);
  int v10 = sub_16880((uint64_t)v7, 1LL, v9);
  int v11 = sub_16880((uint64_t)v8, 1LL, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }

  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_26B0(&qword_D37D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
  sub_A40C((uint64_t)v7, 0LL, 1LL, v9);
  return a1;
}

uint64_t sub_76428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for HALAlarmDeviceContext(0LL);
  if (sub_16880((uint64_t)v7, 1LL, v8))
  {
    uint64_t v9 = sub_26B0(&qword_D37D0);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
    sub_A40C((uint64_t)v6, 0LL, 1LL, v8);
  }

  return a1;
}

uint64_t sub_764DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for HALAlarmDeviceContext(0LL);
  int v11 = sub_16880((uint64_t)v8, 1LL, v10);
  int v12 = sub_16880((uint64_t)v9, 1LL, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }

  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_26B0(&qword_D37D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  sub_A40C((uint64_t)v8, 0LL, 1LL, v10);
  return a1;
}

uint64_t sub_765EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_765F8);
}

uint64_t sub_765F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_26B0(&qword_D37D0);
    return sub_16880(a1 + *(int *)(a3 + 20), a2, v8);
  }

uint64_t sub_76670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7667C);
}

uint64_t sub_7667C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_26B0(&qword_D37D0);
    return sub_A40C(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

uint64_t _s21ConfirmIntentStrategyVMa(uint64_t a1)
{
  uint64_t result = qword_D69E0;
  if (!qword_D69E0) {
    return swift_getSingletonMetadata(a1, &_s21ConfirmIntentStrategyVMn);
  }
  return result;
}

void sub_76724(uint64_t a1)
{
  v4[0] = "(";
  sub_76798(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
  }

void sub_76798(uint64_t a1)
{
  if (!qword_D69F0)
  {
    uint64_t v2 = type metadata accessor for HALAlarmDeviceContext(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_D69F0);
    }
  }

uint64_t sub_767EC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D6970);
  sub_26F0(v0, (uint64_t)qword_D6970);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_76834@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_26B0(&qword_D37A8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_D3148 != -1) {
    swift_once(&qword_D3148, sub_767EC);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = (os_log_s *)sub_16CD0(v9, (uint64_t)qword_D6970);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    int v12 = (uint8_t *)sub_1EFA4();
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "SnoozeAlarm.ConfirmIntentStrategy.actionForInput() called.", v12, 2u);
    sub_16AA8((uint64_t)v12);
  }

  uint64_t v13 = v3 + *(int *)(_s21ConfirmIntentStrategyVMa(0LL) + 20);
  uint64_t v14 = enum case for DecideAction.PromptExpectation.confirmation(_:);
  uint64_t v15 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104LL))(v8, v14, v15);
  sub_17AF4((uint64_t)v8, 0LL);
  sub_30804(a1, v13, 0, (uint64_t)v8, a2);
  return sub_19594((uint64_t)v8, &qword_D37A8);
}

uint64_t sub_769B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_26B0((uint64_t *)&unk_D36F0);
  v3[5] = sub_19754(*(void *)(v4 - 8));
  uint64_t v5 = type metadata accessor for ConfirmationResponse(0LL);
  v3[6] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[7] = v6;
  v3[8] = sub_19754(v6);
  sub_19840();
  return sub_1988C();
}

#error "76AC0: call analysis failed (funcsize=77)"
uint64_t sub_76B64(uint64_t a1)
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_26B0(&qword_D3890);
  v2[9] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for TemplatingResult(0LL);
  v2[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[11] = v5;
  v2[12] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DialogPhase(0LL);
  v2[13] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[14] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[15] = v8;
  v2[16] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v2[17] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[18] = v10;
  v2[19] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  os_log_type_t v11 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[20] = v11;
  int v12 = *(void *)(v11 - 8);
  v2[21] = v12;
  v2[22] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[23] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[24] = v14;
  v2[25] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[26] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[27] = v16;
  v2[28] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = (*(void *)(*(void *)(sub_26B0(&qword_D3A08) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[29] = swift_task_alloc(v17);
  v2[30] = swift_task_alloc(v17);
  uint64_t v18 = type metadata accessor for NLContextUpdate(0LL);
  v2[31] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[32] = v19;
  v2[33] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  char v20 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  v2[34] = v20;
  v21 = *(void *)(v20 - 8);
  v2[35] = v21;
  v2[36] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = (*(void *)(*(void *)(sub_26B0(&qword_D37D0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[37] = swift_task_alloc(v22);
  v2[38] = swift_task_alloc(v22);
  v2[39] = swift_task_alloc(v22);
  return swift_task_switch(sub_76D94, 0LL, 0LL);
}

uint64_t sub_76D94()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = v2 + *(int *)(_s21ConfirmIntentStrategyVMa(0LL) + 20);
  sub_78270();
  type metadata accessor for HALAlarmDeviceContext(0LL);
  uint64_t v4 = sub_21618(v1);
  if ((_DWORD)v4 == 1)
  {
    sub_25254(v4, &qword_D37D0);
  }

  else
  {
    uint64_t v5 = (void *)sub_78268();
    uint64_t v6 = sub_781F8();
    if (v5)
    {
      char v7 = ((uint64_t (*)(uint64_t))DeviceUnit.isCommunalDevice.getter)(v6);

      goto LABEL_6;
    }
  }

  char v7 = 0;
LABEL_6:
  uint64_t v8 = *(void *)(v0 + 304);
  (*(void (**)(void, void, void))(*(void *)(v0 + 280) + 104LL))( *(void *)(v0 + 288),  enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:),  *(void *)(v0 + 272));
  sub_79B0C();
  sub_78270();
  uint64_t v9 = sub_21618(v8);
  if ((_DWORD)v9 == 1)
  {
    sub_25254(v9, &qword_D37D0);
  }

  else
  {
    uint64_t v10 = (void *)sub_78268();
    uint64_t v11 = sub_781F8();
    if (v10)
    {
      uint64_t v12 = ((uint64_t (*)(uint64_t))DeviceUnit.name.getter)(v11);
      uint64_t v14 = v13;

      if (v14)
      {
        String.toSpeakableString.getter(v12);
        swift_bridgeObjectRelease(v14);
        uint64_t v15 = 0LL;
        goto LABEL_12;
      }
    }
  }

  uint64_t v15 = 1LL;
LABEL_12:
  uint64_t v16 = *(void *)(v0 + 296);
  uint64_t v17 = *(void *)(v0 + 240);
  type metadata accessor for SpeakableString(0LL);
  sub_17AF4(v17, v15);
  sub_34BBC(v3, v16);
  uint64_t v18 = sub_21618(v16);
  if ((_DWORD)v18 == 1)
  {
    sub_25254(v18, &qword_D37D0);
  }

  else
  {
    uint64_t v19 = (void *)sub_78268();
    uint64_t v20 = sub_781F8();
    if (v19)
    {
      uint64_t v21 = ((uint64_t (*)(uint64_t))DeviceUnit.roomName.getter)(v20);
      uint64_t v23 = v22;

      if (v23)
      {
        String.toSpeakableString.getter(v21);
        swift_bridgeObjectRelease(v23);
        uint64_t v24 = 0LL;
        goto LABEL_18;
      }
    }
  }

  uint64_t v24 = 1LL;
LABEL_18:
  uint64_t v25 = *(void *)(v0 + 224);
  uint64_t v26 = *(void *)(v0 + 216);
  uint64_t v27 = sub_17AF4(*(void *)(v0 + 232), v24);
  static SiriTimeFeatureFlagsImpl.instance.getter(v27);
  Swift::Bool v28 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  uint64_t v29 = sub_175C0(v25, *(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  if (v28)
  {
    v30 = (void *)((uint64_t (*)(uint64_t))static InvocationFactory.makeConfirmAndRejectActions())(v29);

    Swift::String_optional v32 = AceObject.serializeToBase64()();
    *(void *)(v0 + 320) = v32.value._object;
    if (v32.value._object)
    {
      v33 = (void *)((uint64_t (*)(void))static InvocationFactory.makeConfirmAndRejectActions())();
      v35 = v34;

      Swift::String_optional v36 = AceObject.serializeToBase64()();
      *(void *)(v0 + 328) = v36.value._object;
      if (v36.value._object)
      {
        (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 104LL))( *(void *)(v0 + 176),  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  *(void *)(v0 + 160));
        if (qword_D3148 != -1) {
          swift_once(&qword_D3148, sub_767EC);
        }
        uint64_t v37 = *(void *)(v0 + 176);
        uint64_t v38 = *(void *)(v0 + 144);
        uint64_t v39 = *(void *)(v0 + 152);
        uint64_t v40 = *(void *)(v0 + 136);
        uint64_t v41 = sub_26F0(v40, (uint64_t)qword_D6970);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v41, v40);
        uint64_t v42 = mach_absolute_time();
        SiriTimeMeasurement.init(_:log:startTime:)(v37, v39, v42);
        if (qword_D3050 != -1) {
          swift_once(&qword_D3050, sub_45D64);
        }
        uint64_t v43 = swift_task_alloc(64LL);
        *(void *)(v0 + 336) = v43;
        *(int8x16_t *)(v43 + 16) = vextq_s8(*(int8x16_t *)(v0 + 232), *(int8x16_t *)(v0 + 232), 8uLL);
        *(Swift::String_optional *)(v43 + 32) = v36;
        *(Swift::String_optional *)(v43 + 48) = v32;
        v44 = (void *)swift_task_alloc(dword_D53D4);
        *(void *)(v0 + 344) = v44;
        void *v44 = v0;
        v44[1] = sub_7734C;
        return sub_4B668(v7 & 1, (v7 & 1) == 0, (uint64_t)sub_78148, v43);
      }

      sub_16F40();
    }

    if (qword_D3148 != -1) {
      swift_once(&qword_D3148, sub_767EC);
    }
    v47 = (os_log_s *)sub_16CD0(*(void *)(v0 + 136), (uint64_t)qword_D6970);
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (_WORD *)sub_1EFA4();
      _WORD *v49 = 0;
      sub_78244(&dword_0, v47, v50, "Could not create direct invocation for confirm or reject actions.");
      sub_16AA8((uint64_t)v49);
    }

    uint64_t v51 = sub_26B0(&qword_D4190);
    unint64_t v52 = sub_24EA4();
    uint64_t v173 = swift_allocError(v51, v52, 0LL, 0LL);
    _BYTE *v53 = 0;
    swift_willThrow(v173, v53, v54, v55, v56, v57, v58, v59);
    uint64_t v60 = *(void *)(v0 + 256);
    uint64_t v61 = *(void *)(v0 + 264);
    uint64_t v63 = *(void *)(v0 + 240);
    uint64_t v62 = *(void *)(v0 + 248);
    uint64_t v64 = *(void *)(v0 + 232);
    uint64_t v129 = *(void *)(v0 + 296);
    uint64_t v137 = *(void *)(v0 + 224);
    uint64_t v145 = *(void *)(v0 + 200);
    uint64_t v152 = *(void *)(v0 + 176);
    uint64_t v158 = *(void *)(v0 + 152);
    uint64_t v163 = *(void *)(v0 + 128);
    uint64_t v167 = *(void *)(v0 + 104);
    uint64_t v170 = *(void *)(v0 + 96);
    uint64_t v172 = *(void *)(v0 + 72);
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8LL))(*(void *)(v0 + 288), *(void *)(v0 + 272));
    sub_781F0(v64);
    sub_781F0(v63);
    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v61, v62);
    sub_19800();
    sub_1978C();
    swift_task_dealloc();
    sub_197C0();
    sub_19830();
    sub_19828();
    uint64_t v65 = sub_19820();
    uint64_t v73 = sub_19978(v65, v66, v67, v68, v69, v70, v71, v72, v129, v137);
    uint64_t v81 = sub_19964(v73, v74, v75, v76, v77, v78, v79, v80, v130, v138, v145);
    uint64_t v89 = sub_1B64C(v81, v82, v83, v84, v85, v86, v87, v88, v131, v139, v146, v152);
    uint64_t v97 = sub_25044(v89, v90, v91, v92, v93, v94, v95, v96, v132, v140, v147, v153, v158);
    uint64_t v105 = sub_2503C(v97, v98, v99, v100, v101, v102, v103, v104, v133, v141, v148, v154, v159, v163);
    uint64_t v113 = sub_25218(v105, v106, v107, v108, v109, v110, v111, v112, v134, v142, v149, v155, v160, v164, v167);
    uint64_t v121 = sub_45358(v113, v114, v115, v116, v117, v118, v119, v120, v135, v143, v150, v156, v161, v165, v168, v170);
    sub_45350(v121, v122, v123, v124, v125, v126, v127, v128, v136, v144, v151, v157, v162, v166, v169, v171, v172);
    return sub_781B8(*(uint64_t (**)(void))(v0 + 8));
  }

  else
  {
    if (qword_D3048 != -1) {
      swift_once(&qword_D3048, sub_45D50);
    }
    v46 = (void *)swift_task_alloc(dword_D7984);
    *(void *)(v0 + 384) = v46;
    void *v46 = v0;
    v46[1] = sub_775D4;
    return sub_95E98(*(void *)(v0 + 96), (v7 & 1) == 0, v7 & 1, *(void *)(v0 + 240), *(void *)(v0 + 232));
  }

uint64_t sub_7734C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 352) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v4 + 328);
  if (!v1) {
    *(void *)(v4 + 360) = a1;
  }
  swift_bridgeObjectRelease(v5);
  sub_16F40();
  sub_19794();
  sub_19840();
  return sub_3848C(v6, v7, v8);
}

uint64_t sub_773D4(uint64_t a1)
{
  uint64_t v2 = v1[33];
  uint64_t v3 = v1[13];
  static DialogPhase.confirmation.getter(a1);
  uint64_t v4 = swift_task_alloc(32LL);
  *(void *)(v4 + 16) = v2;
  OutputGenerationManifest.init(dialogPhase:_:)(v3, sub_78158, v4);
  sub_1978C();
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  v1[46] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_77478;
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v1[7], v1[16], v1[25]);
}

uint64_t sub_77478()
{
  uint64_t v3 = (void *)v2[45];
  uint64_t v5 = v2[15];
  uint64_t v4 = v2[16];
  *uint64_t v6 = *v1;
  v2[47] = v0;
  swift_task_dealloc();
  sub_175C0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));

  sub_19840();
  return sub_3848C(v7, v8, v9);
}

uint64_t sub_774E8()
{
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  sub_78234();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_78254(v5);
  sub_78254(v4);
  sub_2527C();
  sub_7820C();
  uint64_t v41 = v7;
  uint64_t v45 = v6;
  uint64_t v49 = *(void *)(v0 + 104);
  uint64_t v52 = *(void *)(v0 + 96);
  uint64_t v54 = *(void *)(v0 + 72);
  swift_task_dealloc();
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  swift_task_dealloc();
  uint64_t v8 = swift_task_dealloc();
  uint64_t v16 = sub_19978(v8, v9, v10, v11, v12, v13, v14, v15, v41, v45);
  uint64_t v24 = sub_19964(v16, v17, v18, v19, v20, v21, v22, v23, v42, v46, v49);
  uint64_t v32 = sub_1B64C(v24, v25, v26, v27, v28, v29, v30, v31, v43, v47, v50, v52);
  sub_25044(v32, v33, v34, v35, v36, v37, v38, v39, v44, v48, v51, v53, v54);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_775D4()
{
  uint64_t v2 = *v1;
  v2[49] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_19840();
    return swift_task_switch(v3, v4, v5);
  }

  else
  {
    uint64_t v7 = (uint64_t **)swift_task_alloc(dword_D5D84);
    v2[50] = (uint64_t)v7;
    *uint64_t v7 = v2;
    v7[1] = (uint64_t *)sub_77660;
    return sub_52CD0(v2[36]);
  }

uint64_t sub_77660(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 408) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v4 + 416) = a1;
  }
  sub_19840();
  return swift_task_switch(v5, v6, v7);
}

#error "777D8: call analysis failed (funcsize=119)"
#error "77900: call analysis failed (funcsize=33)"
#error "77988: call analysis failed (funcsize=33)"
#error "77A0C: call analysis failed (funcsize=32)"
#error "77AA0: call analysis failed (funcsize=36)"
uint64_t sub_77AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v14 = sub_26B0(&qword_D3A08);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = (int *)type metadata accessor for SnoozeConfirmOtherRoomParameters(0LL);
  sub_806C(a2, a1 + v17[5]);
  sub_806C(a3, a1 + v17[8]);
  swift_bridgeObjectRetain(a5);
  SpeakableString.init(serializedValue:)(a4, a5);
  uint64_t v18 = type metadata accessor for SpeakableString(0LL);
  sub_A40C((uint64_t)v16, 0LL, 1LL, v18);
  sub_1B4F0((uint64_t)v16, a1);
  swift_bridgeObjectRetain(a7);
  SpeakableString.init(serializedValue:)(a6, a7);
  sub_A40C((uint64_t)v16, 0LL, 1LL, v18);
  return sub_1B4F0((uint64_t)v16, a1 + v17[9]);
}

uint64_t sub_77C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_26B0(&qword_D3890);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  OutputGenerationManifest.listenAfterSpeaking.setter(1LL);
  uint64_t v6 = type metadata accessor for NLContextUpdate(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v5, a2, v6);
  sub_A40C((uint64_t)v5, 0LL, 1LL, v6);
  return OutputGenerationManifest.nlContextUpdate.setter(v5);
}

uint64_t sub_77CC8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D6A64);
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_77D28;
  return sub_76B64(a1);
}

uint64_t sub_77D28()
{
  uint64_t v2 = *v1;
  *uint64_t v3 = v2;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    return sub_1B5EC(*(uint64_t (**)(void))(v2 + 8));
  }
  sub_19840();
  return sub_1988C();
}

uint64_t sub_77D78()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v1;
  sub_26B0(&qword_D4890);
  uint64_t v2 = static BarbaraWalters.logAndReturnError<A>(context:_:)(0xD000000000000066LL, 0x80000000000A9D90LL, v0 + 24);
  swift_willThrow(v2, v3, v4, v5, v6, v7, v8, v9);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_77E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_D6A6C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_34358;
  return sub_769B4(a1, a2, a3);
}

uint64_t sub_77E74(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D6A5C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_34358;
  return sub_77CC8(a1);
}

uint64_t sub_77ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeRepromptOnEmptyParse(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_34358;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnEmptyParse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_77F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeRepromptOnLowConfidence(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_34358;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnLowConfidence(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_77FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeConfirmationRejectedResponse(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_34358;
  return ConfirmIntentFlowStrategyAsync.makeConfirmationRejectedResponse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_78048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeFlowCancelledResponse(confirmParameters:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_3429C;
  return ConfirmIntentFlowStrategyAsync.makeFlowCancelledResponse(confirmParameters:)(a1, a2, a3, a4);
}

uint64_t sub_780C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ConfirmIntentFlowStrategyAsync.makeErrorResponse(error:confirmParameters:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_34358;
  return ConfirmIntentFlowStrategyAsync.makeErrorResponse(error:confirmParameters:)(a1, a2, a3, a4, a5);
}

uint64_t sub_78148(uint64_t a1)
{
  return sub_77AE0(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_78158(uint64_t a1)
{
  return sub_77C1C(a1, *(void *)(v1 + 16));
}

uint64_t sub_78160()
{
  return (*(uint64_t (**)(void, void))(v0[35] + 8LL))(v0[36], v0[34]);
}

uint64_t sub_781B8(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_781F0(uint64_t a1)
{
  return sub_19594(a1, v1);
}

uint64_t sub_781F8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
}

uint64_t sub_7820C()
{
  return *(void *)(v0 + 312);
}

uint64_t sub_78234()
{
  return (*(uint64_t (**)(void, void))(v0[24] + 8LL))(v0[25], v0[23]);
}

void sub_78244(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_78254(uint64_t a1)
{
  return sub_19594(a1, v1);
}

uint64_t sub_7825C()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_78268()
{
  return HALDeviceContext.remoteDevice.getter(v0);
}

uint64_t sub_78270()
{
  return sub_34BBC(v1, v0);
}

uint64_t type metadata accessor for DeleteAlarmCATPatternsExecutor(uint64_t a1)
{
  return sub_8A38(a1, (uint64_t *)&unk_D6A70, (uint64_t)&nominal type descriptor for DeleteAlarmCATPatternsExecutor);
}

uint64_t sub_78290(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D8478);
}

uint64_t sub_782CC()
{
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = sub_38F80(v5, 512LL);
  *(_OWORD *)(v6 + 16) = xmmword_A5A60;
  strcpy((char *)(v6 + 32), "isMixedAlarms");
  *(_WORD *)(v6 + 46) = -4864;
  *(_BYTE *)(v6 + 48) = *v0;
  *(void *)(v6 + 72) = &type metadata for Bool;
  *(void *)(v6 + 80) = 0xD000000000000010LL;
  sub_214E0();
  *(void *)(v7 + 88) = v8;
  *(_BYTE *)(v7 + 96) = v0[1];
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = 0xD000000000000018LL;
  *(void *)(v7 + 136) = 0x80000000000A8130LL;
  *(_BYTE *)(v7 + 144) = v0[2];
  *(void *)(v7 + 168) = v9;
  *(void *)(v7 + 176) = 0xD000000000000012LL;
  sub_214E0();
  *(void *)(v10 + 184) = v11;
  *(_BYTE *)(v10 + 192) = v0[3];
  *(void *)(v10 + 216) = v12;
  *(void *)(v10 + 224) = 0xD000000000000016LL;
  *(void *)(v10 + 232) = 0x80000000000A8170LL;
  *(_BYTE *)(v10 + 240) = v0[4];
  *(void *)(v10 + 264) = v12;
  *(void *)(v10 + 272) = 0xD000000000000016LL;
  sub_214E0();
  *(void *)(v13 + 280) = v14;
  *(_BYTE *)(v13 + 288) = v0[5];
  *(void *)(v13 + 312) = v15;
  *(void *)(v13 + 320) = 0xD000000000000017LL;
  sub_214E0();
  *(void *)(v16 + 328) = v17;
  *(_BYTE *)(v16 + 336) = v0[6];
  *(void *)(v16 + 360) = v18;
  *(void *)(v16 + 368) = 0x68637461577369LL;
  *(void *)(v16 + 376) = 0xE700000000000000LL;
  *(_BYTE *)(v16 + 384) = v0[7];
  uint64_t v19 = v16 + 432;
  *(void *)(v16 + 408) = v18;
  *(void *)(v16 + 416) = 0xD000000000000012LL;
  *(void *)(v16 + 424) = 0x80000000000A81D0LL;
  uint64_t v20 = type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(0LL);
  sub_3F88((uint64_t)&v0[*(int *)(v20 + 48)], v4, &qword_D3A08);
  uint64_t v21 = sub_1EC14();
  if (sub_16880(v4, 1LL, v21) == 1)
  {
    sub_202D8(v4, &qword_D3A08);
    *(_OWORD *)uint64_t v19 = 0u;
    *(_OWORD *)(v19 + 16) = 0u;
  }

  else
  {
    *(void *)(v6 + 456) = v21;
    uint64_t v22 = sub_19558((void *)v19);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32LL))(v22, v4, v21);
  }

  sub_214E0();
  *(void *)(v6 + 464) = v23;
  *(void *)(v6 + 472) = v24;
  uint64_t v25 = *(void *)&v0[*(int *)(v20 + 52)];
  if (v25)
  {
    uint64_t v26 = type metadata accessor for DialogCalendar(0LL);
  }

  else
  {
    uint64_t v26 = 0LL;
    *(void *)(v6 + 488) = 0LL;
    *(void *)(v6 + 496) = 0LL;
  }

  *(void *)(v6 + 480) = v25;
  *(void *)(v6 + 504) = v26;
  swift_retain(v25);
  return v6;
}

uint64_t sub_78554()
{
  uint64_t v1 = v0;
  sub_26B0(&qword_D3A08);
  sub_215E4();
  __chkstk_darwin(v2);
  sub_17390();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_26B0(&qword_D3BD0);
  uint64_t v7 = sub_38F80(v6, 80LL);
  *(_OWORD *)(v7 + 16) = xmmword_A4880;
  uint64_t v8 = (void *)(v7 + 48);
  sub_214E0();
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v11;
  sub_3F88(v1, v5, &qword_D3A08);
  uint64_t v12 = sub_1EC14();
  if (sub_16880(v5, 1LL, v12) == 1)
  {
    sub_202D8(v5, &qword_D3A08);
    *(_OWORD *)uint64_t v8 = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
  }

  else
  {
    *(void *)(v7 + 72) = v12;
    uint64_t v13 = sub_19558(v8);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(v13, v5, v12);
  }

  return v7;
}

uint64_t sub_78660(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 64) = a1;
  return sub_2D94C((uint64_t)sub_78674);
}

uint64_t sub_78674()
{
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 64);
  uint64_t v4 = sub_26B0(&qword_D3BD0);
  uint64_t v5 = (__n128 *)sub_38F80(v4, 128LL);
  *(void *)(v0 + 32) = v5;
  uint64_t v6 = sub_47D18(v5, (__n128)xmmword_A5960);
  v5[3].n128_u64[0] = v2;
  v5[5].n128_u64[1] = 0x80000000000A85F0LL;
  v5[7].n128_u64[1] = (unint64_t)&type metadata for Bool;
  v5[6].n128_u8[0] = v3;
  sub_79648(v6);
  uint64_t v7 = (void *)swift_task_alloc(v3);
  *(void *)(v0 + 40) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_7872C;
  uint64_t v8 = sub_79690(v1 + 5);
  return sub_47CDC(v8, v9, v10, v11);
}

uint64_t sub_7872C()
{
  if (!v1) {
    *(void *)(v2 + 56) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_78774(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 64) = a1;
  return sub_2D94C((uint64_t)sub_78788);
}

uint64_t sub_78788()
{
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 64);
  uint64_t v4 = sub_26B0(&qword_D3BD0);
  uint64_t v5 = (__n128 *)sub_38F80(v4, 128LL);
  *(void *)(v0 + 32) = v5;
  uint64_t v6 = sub_47D18(v5, (__n128)xmmword_A5960);
  v5[3].n128_u64[0] = v2;
  v5[5].n128_u64[1] = 0x80000000000A85F0LL;
  v5[7].n128_u64[1] = (unint64_t)&type metadata for Bool;
  v5[6].n128_u8[0] = v3;
  sub_79648(v6);
  uint64_t v7 = (void *)swift_task_alloc(v3);
  *(void *)(v0 + 40) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_78840;
  uint64_t v8 = sub_79690(v1 + 5);
  return sub_47CDC(v8, v9, v10, v11);
}

uint64_t sub_78840()
{
  if (!v1) {
    *(void *)(v2 + 56) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_78888()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 56));
}

uint64_t sub_788C0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_788F4(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  *(void *)(v8 + 16) = v15;
  *(void *)(v8 + 24) = v16;
  *(_BYTE *)(v8 + 95) = a8;
  *(_BYTE *)(v8 + 94) = a7;
  *(_BYTE *)(v8 + 93) = a6;
  *(_BYTE *)(v8 + 92) = a5;
  *(_BYTE *)(v8 + 91) = a4;
  *(_BYTE *)(v8 + 90) = a3;
  *(_BYTE *)(v8 + 89) = a2;
  *(_BYTE *)(v8 + 88) = a1;
  uint64_t v9 = sub_26B0(&qword_D3A08);
  *(void *)(v8 + 32) = sub_19754(*(void *)(v9 - 8));
  uint64_t v10 = type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(0LL);
  *(void *)(v8 + 40) = v10;
  *(void *)(v8 + 48) = sub_19754(*(void *)(v10 - 8));
  sub_19840();
  return swift_task_switch(v11, v12, v13);
}

uint64_t sub_7897C()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(_BYTE **)(v0 + 48);
  id v23 = *(id *)(v0 + 24);
  char v21 = *(_BYTE *)(v0 + 94);
  char v22 = *(_BYTE *)(v0 + 95);
  char v3 = *(_BYTE *)(v0 + 93);
  char v4 = *(_BYTE *)(v0 + 92);
  char v5 = *(_BYTE *)(v0 + 91);
  char v6 = *(_BYTE *)(v0 + 90);
  char v7 = *(_BYTE *)(v0 + 89);
  char v8 = *(_BYTE *)(v0 + 88);
  uint64_t v9 = (uint64_t)&v1[*(int *)(v2 + 48)];
  sub_1EC14();
  sub_796AC(v9);
  _BYTE *v1 = v8;
  v1[1] = v7;
  v1[2] = v6;
  v1[3] = v5;
  v1[4] = v4;
  v1[5] = v3;
  v1[6] = v21;
  v1[7] = v22;
  uint64_t v10 = *(int *)(v2 + 52);
  *(void *)&v1[v10] = 0LL;
  id v11 = [v23 alarmSearch];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1D4B0(*(void *)(v0 + 32));
  }

  else
  {
    sub_796AC(*(void *)(v0 + 32));
  }

  uint64_t v13 = *(void **)(v0 + 24);
  sub_1B4F0(*(void *)(v0 + 32), v9);
  id v14 = [v13 alarmSearch];
  if (v14)
  {
    uint64_t v15 = v14;
    sub_1B6E0();
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  swift_release(*(void *)&v1[v10]);
  *(void *)&v1[v10] = v17;
  uint64_t v18 = sub_782CC();
  *(void *)(v0 + 56) = v18;
  *(void *)(v0 + 64) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_78B2C;
  return v24(0xD000000000000021LL, 0x80000000000A9E60LL, v18);
}

uint64_t sub_78B2C()
{
  *char v4 = *v2;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  sub_16F40();
  if (!v1) {
    *(void *)(v3 + 80) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_78B88(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 24);
  sub_2142C(a1, type metadata accessor for DeleteAlarmIntentHandledMultipleParameters);

  sub_19808();
  sub_19800();
  return sub_4F354(*(void *)(v1 + 80), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_78BD4(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 24);
  sub_2142C(a1, type metadata accessor for DeleteAlarmIntentHandledMultipleParameters);

  sub_19808();
  sub_19800();
  return sub_69C20(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_78C1C(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for PunchOutApp(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = sub_19754(v3);
  uint64_t v4 = sub_26B0(&qword_D3A08);
  v1[6] = sub_19754(*(void *)(v4 - 8));
  uint64_t v5 = type metadata accessor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters(0LL);
  v1[7] = sub_19754(*(void *)(v5 - 8));
  sub_19840();
  return swift_task_switch(v6, v7, v8);
}

uint64_t sub_78C98()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[3];
  uint64_t v6 = sub_1EC14();
  sub_A40C(v1, 1LL, 1LL, v6);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for PunchOutApp.sleep(_:), v5);
  PunchOutApp.toResponseFrameworkCommandAction()(v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_1B4F0(v2, v1);
  uint64_t v8 = sub_78554();
  v0[8] = v8;
  v0[9] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_78D8C;
  return sub_47CDC(0xD000000000000037LL, 0x80000000000A9E90LL, v8, v11);
}

uint64_t sub_78D8C()
{
  *uint64_t v4 = *v2;
  *(void *)(v3 + 80) = v1;
  swift_task_dealloc();
  sub_16F40();
  if (!v1) {
    *(void *)(v3 + 88) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_78DE8(uint64_t a1)
{
  return sub_4F354(*(void *)(v1 + 88), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_78E38(uint64_t a1)
{
  return sub_69C20(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_78E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_78ED4(a1, a2, a3);
}

uint64_t sub_78ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_17390();
  uint64_t v10 = v9 - v8;
  sub_26B0((uint64_t *)&unk_D36C0);
  sub_215E4();
  __chkstk_darwin(v11);
  sub_17390();
  uint64_t v14 = v13 - v12;
  sub_3F88(a1, v13 - v12, (uint64_t *)&unk_D36C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  uint64_t v15 = CATWrapper.init(templateDir:options:globals:)(v14, v10, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_202D8(a1, (uint64_t *)&unk_D36C0);
  return v15;
}

uint64_t sub_78FD0()
{
  return type metadata accessor for DeleteAlarmCATPatternsExecutor(0LL);
}

uint64_t type metadata accessor for DeleteAlarmIntentHandledMultipleParameters(uint64_t a1)
{
  return sub_8A38(a1, qword_D6BC8, (uint64_t)&nominal type descriptor for DeleteAlarmIntentHandledMultipleParameters);
}

uint64_t type metadata accessor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters( uint64_t a1)
{
  return sub_8A38( a1,  qword_D6B38,  (uint64_t)&nominal type descriptor for DeleteAlarmUnsupportedWithReasonSleepAlarmNotSupportedParameters);
}

uint64_t *sub_79000(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(sub_26B0(&qword_D3A08) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v7);
  }

  else
  {
    uint64_t v6 = type metadata accessor for SpeakableString(0LL);
    if (sub_16880((uint64_t)a2, 1LL, v6))
    {
      memcpy(a1, a2, *(void *)(v4 + 64));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      sub_A40C((uint64_t)a1, 0LL, 1LL, v6);
    }
  }

  return a1;
}

uint64_t sub_790C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpeakableString(0LL);
  uint64_t result = sub_16880(a1, 1LL, v2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  }
  return result;
}

void *sub_7911C(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880((uint64_t)a2, 1LL, v4))
  {
    uint64_t v5 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
    sub_A40C((uint64_t)a1, 0LL, 1LL, v4);
  }

  return a1;
}

void *sub_791B8(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  int v5 = sub_16880((uint64_t)a1, 1LL, v4);
  int v6 = sub_16880((uint64_t)a2, 1LL, v4);
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
    uint64_t v8 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  sub_A40C((uint64_t)a1, 0LL, 1LL, v4);
  return a1;
}

void *sub_7929C(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880((uint64_t)a2, 1LL, v4))
  {
    uint64_t v5 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
    sub_A40C((uint64_t)a1, 0LL, 1LL, v4);
  }

  return a1;
}

void *sub_79338(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  int v5 = sub_16880((uint64_t)a1, 1LL, v4);
  int v6 = sub_16880((uint64_t)a2, 1LL, v4);
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
    uint64_t v8 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  sub_A40C((uint64_t)a1, 0LL, 1LL, v4);
  return a1;
}

uint64_t sub_7941C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_79428);
}

uint64_t sub_79428()
{
  uint64_t v2 = sub_26B0(&qword_D3A08);
  return sub_16880(v1, v0, v2);
}

uint64_t sub_7945C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_79468);
}

uint64_t sub_79468()
{
  uint64_t v2 = sub_26B0(&qword_D3A08);
  return sub_A40C(v1, v0, v0, v2);
}

uint64_t sub_794A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_794AC);
}

uint64_t sub_794AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26B0(&qword_D3A08);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3) {
    return sub_16880(v4 + *(int *)(a3 + 48), v3, v6);
  }
  unint64_t v8 = *(void *)(v4 + *(int *)(a3 + 52));
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  int v9 = v8 - 1;
  if (v9 < 0) {
    int v9 = -1;
  }
  return (v9 + 1);
}

uint64_t sub_79534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_79540);
}

uint64_t sub_79540(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_26B0(&qword_D3A08);
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return sub_A40C(v5 + *(int *)(a4 + 48), v4, v4, result);
  }
  *(void *)(v5 + *(int *)(a4 + swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52)) = v4;
  return result;
}

void sub_795B8(uint64_t a1)
{
  v4[0] = &unk_A6F40;
  v4[1] = &unk_A6F40;
  void v4[2] = &unk_A6F40;
  v4[3] = &unk_A6F40;
  v4[4] = &unk_A6F40;
  v4[5] = &unk_A6F40;
  v4[6] = &unk_A6F40;
  v4[7] = &unk_A6F40;
  sub_1E9D8(319LL);
  if (v3 <= 0x3F)
  {
    v4[8] = *(void *)(v2 - 8) + 64LL;
    v4[9] = &unk_A6F58;
    swift_initStructMetadata(a1, 256LL, 10LL, v4, a1 + 16);
  }

uint64_t sub_79648(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  *(void *)(v1 + 80) = 0xD000000000000014LL;
  return swift_retain(v2);
}

uint64_t sub_7966C()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 40);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 48) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_79690@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_796AC(uint64_t a1)
{
  return sub_A40C(a1, 1LL, 1LL, v1);
}

  ;
}

uint64_t sub_796C8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D6C20);
  sub_26F0(v0, (uint64_t)qword_D6C20);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_79710(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v3 = type metadata accessor for SiriAlarm(0LL);
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
    swift_bridgeObjectRetain(a1);
    uint64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      id v8 = objc_allocWithZone(ObjCClassFromMetadata);
      swift_bridgeObjectRetain(v7);
      id v9 = sub_1D5F8(v6, v7, 0LL, 0xE000000000000000LL);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v9);
      unint64_t v11 = *(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v10 = *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      if (v11 >= v10 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1LL);
      }
      v5 += 2;
      uint64_t v12 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
      specialized Array._endMutation()(v12, v13, v14, v15);
      --v1;
    }

    while (v1);
    swift_bridgeObjectRelease(a1);
  }

  sub_6044();
  return swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
}

void *sub_79830(uint64_t a1, void (*a2)(uint64_t, id))
{
  uint64_t v3 = v2;
  uint64_t v31 = a2;
  uint64_t v5 = sub_26B0(&qword_D3A38);
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
    a1 = (uint64_t)&_swiftEmptyArrayStorage;
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
      if (sub_16880((uint64_t)v7, 1LL, v14) == 1)
      {
        sub_19594((uint64_t)v7, &qword_D3A38);
      }

      else
      {
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
        uint64_t v19 = v25;
        v18(v25, v7, v14);
        v18(v29, v19, v14);
        if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0) {
          a1 = sub_6C73C(0, *(void *)(a1 + 16) + 1LL, 1, a1);
        }
        unint64_t v21 = *(void *)(a1 + 16);
        unint64_t v20 = *(void *)(a1 + 24);
        if (v21 >= v20 >> 1) {
          a1 = sub_6C73C(v20 > 1, v21 + 1, 1, a1);
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
  return &_swiftEmptyArrayStorage;
}

void sub_79AEC()
{
}

void sub_79B0C()
{
  uint64_t v5 = v4;
  sub_26B0(&qword_D6C50);
  sub_215E4();
  __chkstk_darwin(v6);
  sub_17390();
  uint64_t v9 = v8 - v7;
  type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  sub_7BEAC();
  __chkstk_darwin(v10);
  sub_4AED0();
  __chkstk_darwin(v11);
  sub_7BEC0();
  __chkstk_darwin(v12);
  sub_7BF74();
  sub_7A56C();
  uint64_t v13 = type metadata accessor for UsoEntityBuilder_common_Alarm(0LL);
  sub_16D14(v13);
  uint64_t v14 = (void *)UsoEntityBuilder_common_Alarm.init()();
  uint64_t v15 = sub_7B0CC(v5, (uint64_t)v14);
  swift_release(v14);
  sub_7BFC4();
  static DialogActBuilder.buildPromptConfirmationDialogActFrom(_:forDomain:)();
  swift_release(v15);
  sub_7BF84(v9);
  if (v16)
  {
    sub_19594(v9, &qword_D6C50);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v9, v1);
    if (qword_D3158 != -1) {
      swift_once(&qword_D3158, sub_7A4F0);
    }
    uint64_t v17 = sub_16C80();
    sub_26F0(v17, (uint64_t)qword_D6C38);
    uint64_t v18 = sub_7BDFC();
    Logger.logObject.getter(v18, v19, v20, v21, v22, v23, v24, v25);
    os_log_type_t v26 = sub_16C50();
    if (sub_56280(v26))
    {
      uint64_t v27 = sub_16AC4(12LL);
      sub_16AC4(32LL);
      sub_7BE28(4.8149e-34);
      uint64_t v28 = sub_7BF1C();
      uint64_t v30 = sub_7BF58(v28, v29);
      uint64_t v31 = sub_7BF28(v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, v32, v33, v34);
      sub_16FF4();
      sub_7BDEC();
      sub_7BE14(&dword_0, v35, v36, "Submitting NLv4 dialog act: %s");
      sub_7BEF4();
      sub_16AA8(v3);
      sub_16AA8(v27);
    }

    else
    {
      sub_7BDEC();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v2);
    sub_7BE4C(v2);
  }

  sub_16CB0();
}

void sub_79D04()
{
  char v1 = v0;
  uint64_t v98 = 0LL;
  uint64_t v99 = v2;
  uint64_t v106 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_17390();
  uint64_t v103 = v9 - v8;
  sub_26B0(&qword_D6C50);
  sub_215E4();
  __chkstk_darwin(v10);
  sub_17390();
  uint64_t v13 = v12 - v11;
  uint64_t v108 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v97 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  sub_16B08();
  uint64_t v95 = v14;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v96 = (char *)&v94 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v102 = (char *)&v94 - v19;
  NLContextUpdate.init()(v18);
  sub_A8D8(0);
  NLContextUpdate.weightedPromptTargetDomain.setter();
  NLContextUpdate.weightedPromptStrict.setter(1LL);
  uint64_t v20 = sub_26B0((uint64_t *)&off_D3A00);
  uint64_t v21 = sub_38F80(v20, 48LL);
  __int128 v100 = xmmword_A4880;
  *(_OWORD *)(v21 + 16) = xmmword_A4880;
  sub_7BFB4();
  sub_7BE54(v22, v23);
  v24._countAndFlagsBits = sub_7BF08();
  object = v24._object;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(object);
  uint64_t v26 = v112;
  *(void *)(v21 + 32) = v111;
  *(void *)(v21 + 40) = v26;
  uint64_t v107 = v5;
  NLContextUpdate.weightedPromptAbortValues.setter(v21);
  uint64_t v101 = v20;
  uint64_t v27 = sub_38F80(v20, 96LL);
  *(_OWORD *)(v27 + 16) = xmmword_A4A50;
  sub_A8D8(3u);
  *(void *)(v27 + 32) = v28;
  *(void *)(v27 + 40) = v29;
  sub_A8D8(1u);
  *(void *)(v27 + 48) = v30;
  *(void *)(v27 + 56) = v31;
  sub_A8D8(4u);
  *(void *)(v27 + 64) = v32;
  *(void *)(v27 + 72) = v33;
  sub_A8D8(5u);
  *(void *)(v27 + 80) = v34;
  *(void *)(v27 + 88) = v35;
  char v36 = v1;
  uint64_t v104 = v7;
  uint64_t v105 = v6;
  if ((v1 & 1) != 0)
  {
    uint64_t v37 = v106;
    sub_7BFB4();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    unint64_t v43 = *(void *)(v27 + 16);
    unint64_t v42 = *(void *)(v27 + 24);
    if (v43 >= v42 >> 1)
    {
      sub_6C684(v42 > 1, v43 + 1, 1, v27);
      uint64_t v27 = v93;
    }

    uint64_t v44 = v98;
    *(void *)(v27 + 16) = v43 + 1;
    uint64_t v45 = v27 + 16 * v43;
    *(void *)(v45 + 32) = v39;
    *(void *)(v45 + 40) = v41;
    uint64_t v46 = sub_7A2B4((uint64_t)&off_CA9E0);
    NLContextUpdate.weightedPromptResponseOptions.setter(v46);
    uint64_t v47 = v37;
    uint64_t v49 = v104;
    uint64_t v48 = v105;
  }

  else
  {
    uint64_t v49 = v7;
    uint64_t v48 = v6;
    uint64_t v47 = v106;
    uint64_t v44 = v98;
  }

  uint64_t v50 = swift_bridgeObjectRetain(v27);
  uint64_t v51 = NLContextUpdate.weightedPromptResponseTargets.setter(v50);
  __chkstk_darwin(v51);
  *(&v94 - 2) = v99;
  uint64_t v52 = sub_7A388((void (*)(uint64_t *__return_ptr, id *))sub_7BC9C, (uint64_t)(&v94 - 4), v47);
  uint64_t v99 = v44;
  static Siri_Nlu_External_SystemDialogAct.buildDisambiguationDialogActFrom(_:includeBinaryPrompt:)(v52, v36 & 1);
  swift_bridgeObjectRelease(v52);
  uint64_t v53 = v108;
  if (sub_16880(v13, 1LL, v108) == 1)
  {
    sub_19594(v13, &qword_D6C50);
  }

  else
  {
    uint64_t v54 = v97;
    uint64_t v55 = v102;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 32))(v102, v13, v53);
    if (qword_D3158 != -1) {
      swift_once(&qword_D3158, sub_7A4F0);
    }
    uint64_t v56 = sub_16C80();
    uint64_t v57 = (os_log_s *)sub_26F0(v56, (uint64_t)qword_D6C38);
    uint64_t v58 = *(uint64_t (**)(char *, char *, uint64_t))(v54 + 16);
    uint64_t v59 = v96;
    uint64_t v60 = v58(v96, v55, v53);
    Logger.logObject.getter(v60, v61, v62, v63, v64, v65, v66, v67);
    os_log_type_t v68 = sub_16C50();
    if (os_log_type_enabled(v57, v68))
    {
      uint64_t v69 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v70 = sub_16AC4(32LL);
      uint64_t v111 = v70;
      uint64_t v98 = v69;
      *(_DWORD *)uint64_t v69 = 136315138;
      uint64_t v71 = v69 + 12;
      uint64_t v94 = v69 + 4;
      uint64_t v72 = v95;
      v58(v95, v59, v108);
      uint64_t v73 = String.init<A>(describing:)(v72, v108);
      uint64_t v109 = sub_3D10(v73, v74, &v111);
      uint64_t v75 = v71;
      uint64_t v47 = v106;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, &v110, v94, v75);
      sub_45BCC();
      uint64_t v76 = *(void (**)(char *, uint64_t))(v54 + 8);
      v76(v59, v108);
      uint64_t v77 = v98;
      _os_log_impl(&dword_0, v57, v68, "Submitting Alarm Disambiguation NLv4 dialog act: %s", v98, 0xCu);
      swift_arrayDestroy(v70, 1LL);
      uint64_t v78 = v70;
      uint64_t v53 = v108;
      sub_16AA8(v78);
      uint64_t v48 = v105;
      sub_16AA8((uint64_t)v77);
    }

    else
    {
      uint64_t v76 = *(void (**)(char *, uint64_t))(v54 + 8);
      v76(v59, v53);

      uint64_t v48 = v105;
    }

    uint64_t v79 = v102;
    NLContextUpdate.add(nluSystemDialogAct:)(v102);
    v76(v79, v53);
    uint64_t v49 = v104;
  }

  sub_6ED68(v47);
  NLContextUpdate.displayHints.setter();
  uint64_t v80 = sub_38F80(v101, 48LL);
  *(_OWORD *)(v80 + 16) = v100;
  sub_7BFB4();
  sub_7BE54(v81, v82);
  v83._countAndFlagsBits = sub_7BF08();
  String.append(_:)(v83);
  sub_45BCC();
  uint64_t v84 = v112;
  *(void *)(v80 + 32) = v111;
  *(void *)(v80 + 40) = v84;
  uint64_t v85 = NLContextUpdate.disambiguationPromptAbortValues.setter(v80);
  uint64_t v86 = v103;
  uint64_t v87 = UUID.init()(v85);
  uint64_t v88 = UUID.uuidString.getter(v87);
  uint64_t v90 = v89;
  uint64_t v91 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8))(v86, v48);
  __chkstk_darwin(v91);
  *(&v94 - 2) = (uint8_t *)v88;
  *(&v94 - 1) = v90;
  uint64_t v92 = swift_bridgeObjectRetain(v47);
  sub_79830(v92, (void (*)(uint64_t, id))sub_7BDE4);
  sub_45BCC();
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v47);
  sub_7BF64();
  sub_16CB0();
}

void *sub_7A2B4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_7BA20(0LL, v1, 0);
    uint64_t v3 = a1 + 32;
    do
    {
      ++v3;
      sub_AA6C();
      uint64_t v5 = v4;
      uint64_t v7 = v6;
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        sub_7BA20((char *)(v8 > 1), v9 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v9 + 1;
      uint64_t v10 = &_swiftEmptyArrayStorage[2 * v9];
      v10[4] = v5;
      v10[5] = v7;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

void *sub_7A388(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    uint64_t result = &_swiftEmptyArrayStorage;
    if (!v7) {
      break;
    }
    uint64_t v18 = &_swiftEmptyArrayStorage;
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v7);
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }

    uint64_t v9 = 0LL;
    while (v7 != v9)
    {
      if ((a3 & 0xC000000000000001LL) != 0) {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, a3);
      }
      else {
        id v10 = *(id *)(a3 + 8 * v9 + 32);
      }
      uint64_t v11 = v10;
      id v16 = v10;
      a1(&v17, &v16);

      if (v4) {
        return (void *)swift_release(v18);
      }
      ++v9;
      uint64_t v12 = v17;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v13 = v18[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
      uint64_t v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v12);
      specialized ContiguousArray._endMutation()(v14);
      if (v7 == v9) {
        return v18;
      }
    }

    __break(1u);
LABEL_16:
    if (a3 < 0) {
      uint64_t v15 = a3;
    }
    else {
      uint64_t v15 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(a3);
  }

  return result;
}

uint64_t sub_7A4F0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D6C38);
  sub_26F0(v0, (uint64_t)qword_D6C38);
  return static SiriTimeLog.alarmFlow.getter();
}

void sub_7A538()
{
}

uint64_t sub_7A56C()
{
  uint64_t v0 = type metadata accessor for Siri_Nlu_External_UserAccepted(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v51 = *(void *)(v53 - 8);
  uint64_t v3 = __chkstk_darwin(v53);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v46 - v6;
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_SystemOffered(0LL);
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v50 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v46 - v12;
  uint64_t v52 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v48 = *(void *)(v52 - 8);
  uint64_t v13 = __chkstk_darwin(v52);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NLContextUpdate.init()(v13);
  sub_A8D8(0);
  NLContextUpdate.weightedPromptTargetDomain.setter();
  NLContextUpdate.weightedPromptStrict.setter(1LL);
  id v16 = sub_7A2B4((uint64_t)&off_CA9B8);
  NLContextUpdate.weightedPromptResponseOptions.setter(v16);
  uint64_t v17 = sub_26B0((uint64_t *)&off_D3A00);
  uint64_t v18 = swift_allocObject(v17, 48LL, 7LL);
  __int128 v54 = xmmword_A4880;
  *(_OWORD *)(v18 + 16) = xmmword_A4880;
  sub_A8D8(7u);
  uint64_t v55 = v19;
  uint64_t v56 = v20;
  v21._countAndFlagsBits = 0x2E65756C61562ELL;
  v21._object = (void *)0xE700000000000000LL;
  String.append(_:)(v21);
  Swift::String v22 = String.uppercased()();
  object = v22._object;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(object);
  uint64_t v24 = v56;
  *(void *)(v18 + 32) = v55;
  *(void *)(v18 + 40) = v24;
  NLContextUpdate.weightedPromptAbortValues.setter(v18);
  uint64_t v25 = swift_allocObject(v17, 48LL, 7LL);
  *(_OWORD *)(v25 + 16) = v54;
  sub_A8D8(7u);
  *(void *)(v25 + 32) = v26;
  *(void *)(v25 + 40) = v27;
  uint64_t v28 = NLContextUpdate.weightedPromptResponseTargets.setter(v25);
  uint64_t v29 = Siri_Nlu_External_SystemDialogAct.init()(v28);
  uint64_t v30 = v47;
  uint64_t v31 = Siri_Nlu_External_SystemOffered.init()(v29);
  uint64_t v46 = v7;
  uint64_t v32 = Siri_Nlu_External_UserDialogAct.init()(v31);
  Siri_Nlu_External_UserAccepted.init()(v32);
  Siri_Nlu_External_UserDialogAct.accepted.setter(v2);
  uint64_t v33 = v51;
  uint64_t v34 = v53;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v5, v7, v53);
  Siri_Nlu_External_SystemOffered.offeredAct.setter(v5);
  uint64_t v35 = v49;
  uint64_t v36 = v50;
  uint64_t v37 = v30;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v11, v30, v50);
  Siri_Nlu_External_SystemDialogAct.offered.setter(v11);
  uint64_t v38 = sub_26B0(&qword_D6C58);
  uint64_t v39 = v48;
  uint64_t v40 = *(unsigned __int8 *)(v48 + 80);
  uint64_t v41 = (v40 + 32) & ~v40;
  uint64_t v42 = swift_allocObject(v38, v41 + *(void *)(v48 + 72), v40 | 7);
  *(_OWORD *)(v42 + 16) = v54;
  uint64_t v43 = v42 + v41;
  uint64_t v44 = v52;
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 16))(v43, v15, v52);
  NLContextUpdate.nluSystemDialogActs.setter(v42);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v46, v34);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v15, v44);
}

uint64_t sub_7A8DC(unsigned __int8 a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_SystemOffered(0LL);
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v43 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v46 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v7 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserAccepted(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v42 = *(void *)(v13 - 8);
  uint64_t v40 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  id v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v39 - v18;
  NLContextUpdate.init()(v17);
  sub_A8D8(0);
  NLContextUpdate.weightedPromptTargetDomain.setter();
  uint64_t v20 = sub_26B0((uint64_t *)&off_D3A00);
  uint64_t v21 = swift_allocObject(v20, 48LL, 7LL);
  __int128 v41 = xmmword_A4880;
  *(_OWORD *)(v21 + 16) = xmmword_A4880;
  sub_A8D8(a1);
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v23;
  NLContextUpdate.weightedPromptResponseTargets.setter(v21);
  uint64_t v24 = NLContextUpdate.weightedPromptStrict.setter(1LL);
  uint64_t v25 = Siri_Nlu_External_UserDialogAct.init()(v24);
  Siri_Nlu_External_UserAccepted.init()(v25);
  uint64_t v26 = Siri_Nlu_External_UserDialogAct.accepted.setter(v12);
  uint64_t v27 = Siri_Nlu_External_SystemDialogAct.init()(v26);
  Siri_Nlu_External_SystemOffered.init()(v27);
  uint64_t v28 = v42;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v16, v19, v13);
  Siri_Nlu_External_SystemOffered.offeredAct.setter(v16);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v43, v6, v45);
  Siri_Nlu_External_SystemDialogAct.offered.setter(v29);
  uint64_t v32 = sub_26B0(&qword_D6C58);
  uint64_t v33 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v34 = (v33 + 32) & ~v33;
  uint64_t v35 = swift_allocObject(v32, v34 + *(void *)(v7 + 72), v33 | 7);
  *(_OWORD *)(v35 + 16) = v41;
  uint64_t v36 = v35 + v34;
  uint64_t v37 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v36, v9, v46);
  NLContextUpdate.nluSystemDialogActs.setter(v35);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v19, v40);
}

void sub_7ABA8()
{
}

void sub_7ABC8()
{
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unsigned __int8 v11 = v10;
  sub_26B0(&qword_D6C50);
  sub_215E4();
  __chkstk_darwin(v12);
  sub_7BE90();
  sub_7BEAC();
  __chkstk_darwin(v13);
  sub_16B08();
  uint64_t v34 = v14;
  __chkstk_darwin(v15);
  sub_7BEC0();
  __chkstk_darwin(v16);
  sub_7BF74();
  sub_7A8DC(v11);
  sub_7ADCC((uint64_t (*)(void))v9, v7, v5);
  sub_7BF84((uint64_t)v0);
  if (v17)
  {
    sub_19594((uint64_t)v0, &qword_D6C50);
  }

  else
  {
    sub_7BF44();
    if (qword_D3158 != -1) {
      swift_once(&qword_D3158, sub_7A4F0);
    }
    uint64_t v18 = sub_16C80();
    sub_26F0(v18, (uint64_t)qword_D6C38);
    uint64_t v19 = sub_7BDFC();
    Logger.logObject.getter(v19, v20, v21, v22, v23, v24, v25, v26);
    os_log_type_t v27 = sub_16C50();
    if (sub_56280(v27))
    {
      uint64_t v28 = (_DWORD *)sub_16AC4(12LL);
      uint64_t v33 = sub_16AC4(32LL);
      uint64_t v36 = v33;
      *uint64_t v28 = 136315138;
      v9(v34, v3, v1);
      uint64_t v29 = sub_7BF1C();
      uint64_t v35 = sub_7BF58(v29, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v28 + 1, v28 + 3);
      sub_16FF4();
      sub_7BDEC();
      sub_7BE14(&dword_0, v31, v32, "Submitting NLv4 dialog act: %s");
      swift_arrayDestroy(v33, 1LL);
      sub_16AA8(v33);
      sub_16AA8((uint64_t)v28);
    }

    else
    {
      sub_7BDEC();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v2);
    sub_7BE4C(v2);
  }

  sub_16CB0();
}

uint64_t sub_7ADCC(uint64_t (*a1)(void), uint64_t (*a2)(void), void (*a3)(uint64_t))
{
  uint64_t v5 = a1(0LL);
  sub_16D14(v5);
  uint64_t v6 = a2();
  uint64_t v7 = type metadata accessor for UsoEntityBuilder_common_Alarm(0LL);
  sub_16D14(v7);
  uint64_t v8 = UsoEntityBuilder_common_Alarm.init()();
  uint64_t v9 = type metadata accessor for UsoEntityBuilder_common_DateTime(0LL);
  sub_16D14(v9);
  uint64_t v10 = UsoEntityBuilder_common_DateTime.init()();
  dispatch thunk of UsoEntityBuilder_common_Alarm.setEndDateTime(value:)( v10,  &protocol witness table for UsoEntityBuilder_common_DateTime);
  swift_release(v10);
  a3(v8);
  sub_7BFC4();
  static DialogActBuilder.buildPromptValueDialogActFrom(_:forDomain:)(v11, v12, v13);
  swift_release(v6);
  return swift_release(v8);
}

void sub_7AE8C()
{
  if (v7)
  {
    sub_19594((uint64_t)v0, &qword_D6C50);
  }

  else
  {
    sub_7BF44();
    if (qword_D3158 != -1) {
      swift_once(&qword_D3158, sub_7A4F0);
    }
    uint64_t v8 = sub_16C80();
    sub_26F0(v8, (uint64_t)qword_D6C38);
    uint64_t v9 = sub_7BDFC();
    Logger.logObject.getter(v9, v10, v11, v12, v13, v14, v15, v16);
    os_log_type_t v17 = sub_16C50();
    if (sub_56280(v17))
    {
      uint64_t v18 = sub_16AC4(12LL);
      sub_16AC4(32LL);
      sub_7BE28(4.8149e-34);
      uint64_t v19 = sub_7BF1C();
      uint64_t v21 = sub_7BF58(v19, v20);
      uint64_t v22 = sub_7BF28(v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v22, v23, v24, v25);
      sub_16FF4();
      sub_7BDEC();
      sub_7BE14(&dword_0, v26, v27, "Submitting NLv4 dialog act: %s");
      sub_7BEF4();
      sub_16AA8(v2);
      sub_16AA8(v18);
    }

    else
    {
      sub_7BDEC();
    }

    NLContextUpdate.add(nluSystemDialogAct:)(v1);
    sub_7BE4C(v1);
  }

  sub_16CB0();
}

uint64_t sub_7B024()
{
  uint64_t updated = type metadata accessor for UsoTaskBuilder_update_common_Alarm(0LL);
  swift_allocObject(updated, *(unsigned int *)(updated + 48), *(unsigned __int16 *)(updated + 52));
  uint64_t v1 = UsoTaskBuilder_update_common_Alarm.init()();
  uint64_t v2 = type metadata accessor for UsoEntityBuilder_common_Alarm(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = UsoEntityBuilder_common_Alarm.init()();
  dispatch thunk of UsoEntityBuilder_common_Alarm.setName(value:)(0LL, 0xE000000000000000LL);
  dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTarget.setTarget(value:)(v3);
  static DialogActBuilder.buildPromptValueDialogActFrom(_:forDomain:)(v1, 0x6D72616C41LL, 0xE500000000000000LL);
  swift_release(v1);
  return swift_release(v3);
}

uint64_t sub_7B0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v46 - v9;
  if (qword_D3158 != -1) {
    swift_once(&qword_D3158, sub_7A4F0);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  sub_26F0(v11, (uint64_t)qword_D6C38);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v13 = v12(v10, a1, v4);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v13, v14, v15, v16, v17, v18, v19, v20);
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc(12LL, -1LL);
    uint64_t v49 = a2;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    uint64_t v46 = v12;
    uint64_t v26 = v25;
    uint64_t v51 = v25;
    uint64_t v47 = v8;
    uint64_t v48 = a1;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v27 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v25);
    unint64_t v29 = v28;
    uint64_t v50 = sub_3D10(v27, v28, &v51);
    uint64_t v8 = v47;
    a1 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v29);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _os_log_impl(&dword_0, v21, v22, "In alarmNLBuilderForVerb, verb = %s", v24, 0xCu);
    swift_arrayDestroy(v26, 1LL);
    uint64_t v30 = v26;
    uint64_t v12 = v46;
    swift_slowDealloc(v30, -1LL, -1LL);
    uint64_t v31 = v24;
    a2 = v49;
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  v12(v8, a1, v4);
  int v32 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:)) {
    goto LABEL_7;
  }
  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.checkExistence(_:))
  {
    uint64_t v35 = type metadata accessor for UsoTaskBuilder_checkExistence_common_Alarm(0LL);
    swift_allocObject(v35, *(unsigned int *)(v35 + 48), *(unsigned __int16 *)(v35 + 52));
    uint64_t common = UsoTaskBuilder_checkExistence_common_Alarm.init()();
LABEL_10:
    uint64_t v34 = common;
    dispatch thunk of Uso_VerbTemplateBuilder_Reference.setReference(value:)(a2);
    return v34;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.create(_:))
  {
    uint64_t common_Alarm = type metadata accessor for UsoTaskBuilder_create_common_Alarm(0LL);
    swift_allocObject(common_Alarm, *(unsigned int *)(common_Alarm + 48), *(unsigned __int16 *)(common_Alarm + 52));
    return UsoTaskBuilder_create_common_Alarm.init()();
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.delete(_:))
  {
    uint64_t v39 = type metadata accessor for UsoTaskBuilder_delete_common_Alarm(0LL);
    swift_allocObject(v39, *(unsigned int *)(v39 + 48), *(unsigned __int16 *)(v39 + 52));
    uint64_t common = UsoTaskBuilder_delete_common_Alarm.init()();
    goto LABEL_10;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.disable(_:)) {
    goto LABEL_17;
  }
  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.enable(_:)) {
    goto LABEL_19;
  }
  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.read(_:))
  {
    uint64_t v42 = type metadata accessor for UsoTaskBuilder_read_common_Alarm(0LL);
    swift_allocObject(v42, *(unsigned int *)(v42 + 48), *(unsigned __int16 *)(v42 + 52));
    uint64_t common = UsoTaskBuilder_read_common_Alarm.init()();
    goto LABEL_10;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.request(_:))
  {
LABEL_7:
    uint64_t v33 = type metadata accessor for UsoTaskBuilder_request_common_Alarm(0LL);
    swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
    uint64_t v34 = UsoTaskBuilder_request_common_Alarm.init()();
    dispatch thunk of Uso_VerbTemplateBuilder_ReferenceSelect.setReference(value:)(a2);
    return v34;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:))
  {
    uint64_t v43 = type metadata accessor for UsoTaskBuilder_snooze_common_Alarm(0LL);
    swift_allocObject(v43, *(unsigned int *)(v43 + 48), *(unsigned __int16 *)(v43 + 52));
    uint64_t common = UsoTaskBuilder_snooze_common_Alarm.init()();
    goto LABEL_10;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.summarise(_:))
  {
    uint64_t v44 = type metadata accessor for UsoTaskBuilder_summarise_common_Alarm(0LL);
    swift_allocObject(v44, *(unsigned int *)(v44 + 48), *(unsigned __int16 *)(v44 + 52));
    uint64_t common = UsoTaskBuilder_summarise_common_Alarm.init()();
    goto LABEL_10;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.update(_:))
  {
    uint64_t updated = type metadata accessor for UsoTaskBuilder_update_common_Alarm(0LL);
    swift_allocObject(updated, *(unsigned int *)(updated + 48), *(unsigned __int16 *)(updated + 52));
    uint64_t v34 = UsoTaskBuilder_update_common_Alarm.init()();
    dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTarget.setReference(value:)(a2);
    return v34;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.noVerb(_:)) {
    goto LABEL_7;
  }
  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.close(_:)) {
    goto LABEL_17;
  }
  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.resume(_:))
  {
LABEL_19:
    uint64_t v41 = type metadata accessor for UsoTaskBuilder_enable_common_Alarm(0LL);
    swift_allocObject(v41, *(unsigned int *)(v41 + 48), *(unsigned __int16 *)(v41 + 52));
    uint64_t common = UsoTaskBuilder_enable_common_Alarm.init()();
    goto LABEL_10;
  }

  if (v32 == enum case for AlarmNLv4Constants.AlarmVerb.stop(_:))
  {
LABEL_17:
    uint64_t v40 = type metadata accessor for UsoTaskBuilder_disable_common_Alarm(0LL);
    swift_allocObject(v40, *(unsigned int *)(v40 + 48), *(unsigned __int16 *)(v40 + 52));
    uint64_t common = UsoTaskBuilder_disable_common_Alarm.init()();
    goto LABEL_10;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v4, v4);
  __break(1u);
  return result;
}

uint64_t sub_7B5B8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v6 = sub_7B0CC(a1, v4);
  uint64_t result = swift_release(v5);
  *a2 = v6;
  return result;
}

uint64_t sub_7B610(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_6D09C();
    sub_7BEE4();
  }

  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    sub_6D09C();
    sub_7BED4();
  }

  uint64_t result = sub_7BE84(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

uint64_t sub_7B6AC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_7B8DC(a1, a2, a3, (void (*)(void))sub_7BDA8);
}

void *sub_7B6B8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_6D09C();
    sub_7BEE4();
  }

  else
  {
    if (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst) {
      return memcpy(__dst, __src, 8 * a2);
    }
    sub_6D09C();
    sub_7BED4();
  }

  uint64_t result = (void *)sub_7BE84(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

void *sub_7B750(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst) {
      return memcpy(__dst, __src, 8 * a2);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

uint64_t sub_7B818(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_7B824(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for DisplayHint);
}

uint64_t sub_7B824(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0)
  {
    sub_6D09C();
    sub_7BEE4();
  }

  else
  {
    uint64_t v6 = *(void *)(*(void *)(a4(0LL) - 8) + 72LL) * a2;
    unint64_t v7 = a3 + v6;
    unint64_t v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
    {
      uint64_t v10 = sub_7BFA0();
      return sub_7BE74(v10);
    }

    sub_6D09C();
    sub_7BED4();
  }

  uint64_t result = sub_7BE84(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  __break(1u);
  return result;
}

uint64_t sub_7B8D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_7B8DC(a1, a2, a3, (void (*)(void))&type metadata accessor for SiriAlarm);
}

uint64_t sub_7B8DC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_6D09C();
    sub_7BEE4();
  }

  else
  {
    if (a3 + 8 * a2 <= a1 || a1 + 8 * a2 <= a3)
    {
      a4(0LL);
      uint64_t v5 = sub_7BFA0();
      return sub_7BE74(v5);
    }

    sub_6D09C();
    sub_7BED4();
  }

  uint64_t result = sub_7BE84(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  __break(1u);
  return result;
}

uint64_t sub_7B97C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_7B98C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 2 * a2;
  type metadata accessor for SiriAlarmSnippetModel(0LL);
  return a1;
}

size_t sub_7B9D0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_7BA70(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_7B9EC(void *a1, int64_t a2, char a3)
{
  size_t result = sub_7BCB8( a1,  a2,  a3,  *v3,  &qword_D6C60,  (void (*)(uint64_t, uint64_t, void *))sub_6CEF4,  (void (*)(uint64_t, uint64_t, void *))sub_7B750);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_7BA20(char *a1, int64_t a2, char a3)
{
  size_t result = sub_7BBBC(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void *sub_7BA3C(void *a1, int64_t a2, char a3)
{
  size_t result = sub_7BCB8( a1,  a2,  a3,  *v3,  &qword_D6370,  (void (*)(uint64_t, uint64_t, void *))sub_6CEF4,  (void (*)(uint64_t, uint64_t, void *))sub_7B6B8);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

size_t sub_7BA70(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_26B0(&qword_D5360);
  uint64_t v11 = *(void *)(type metadata accessor for SpeakableString(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  int v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if (result - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_24;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  uint64_t v17 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SpeakableString(0LL) - 8) + 80LL);
  uint64_t v18 = (v17 + 32) & ~v17;
  unint64_t v19 = (unint64_t)v15 + v18;
  unint64_t v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_6CE90(v20, v8, v19);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_7B824(v20, v8, v19, (uint64_t (*)(void))&type metadata accessor for SpeakableString);
  }

  swift_release(a4);
  return (size_t)v15;
}

char *sub_7BBBC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_26B0((uint64_t *)&off_D3A00);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_6CE9C(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_7B610((unint64_t)v14, v8, (unint64_t)v13);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_7BC9C@<X0>(uint64_t *a1@<X8>)
{
  return sub_7B5B8(*(void *)(v1 + 16), a1);
}

void *sub_7BCB8( void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, void *), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v12 = a2;
  }

  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    uint64_t v15 = sub_26B0(a5);
    uint64_t v16 = (void *)sub_38F80(v15, 8 * v14 + 32);
    size_t v17 = j__malloc_size(v16);
    v16[2] = v13;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 8);
  }

  else
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
  }

  uint64_t v18 = v16 + 4;
  uint64_t v19 = a4 + 32;
  if ((v10 & 1) != 0)
  {
    a6(v19, v13, v18);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    a7(v19, v13, v18);
  }

  swift_release(a4);
  return v16;
}

void sub_7BDA0()
{
}

unint64_t sub_7BDA8()
{
  unint64_t result = qword_D38A8;
  if (!qword_D38A8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SAAceView);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_D38A8);
  }

  return result;
}

uint64_t sub_7BDEC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_7BDFC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v3, v2, v1);
}

void sub_7BE14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_7BE28(float a1)
{
  *uint64_t v4 = a1;
  *(void *)(v6 - 120) = v4 + 1;
  return v5(v3, v2, v1);
}

uint64_t sub_7BE4C(uint64_t a1)
{
  return v1(a1, v2);
}

void sub_7BE54(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 96) = a2;
  v3._countAndFlagsBits = 0x2E65756C61562ELL;
  v3._object = (void *)0xE700000000000000LL;
  String.append(_:)(v3);
}

uint64_t sub_7BE74(uint64_t a1)
{
  return swift_arrayInitWithCopy(a1);
}

uint64_t sub_7BE84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 25LL, a9, a10, a11);
}

uint64_t sub_7BE90()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_7BEF4()
{
  return swift_arrayDestroy(*(void *)(v0 - 112), 1LL);
}

uint64_t sub_7BF08()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_7BF1C()
{
  return String.init<A>(describing:)(v1, v0);
}

uint64_t sub_7BF28(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_7BF44()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v3, v1, v2);
}

uint64_t sub_7BF58(uint64_t a1, unint64_t a2)
{
  return sub_3D10(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_7BF64()
{
  return NLContextUpdate.rrEntities.setter(v0);
}

  ;
}

uint64_t sub_7BF84(uint64_t a1)
{
  return sub_16880(a1, 1LL, v1);
}

uint64_t sub_7BFA0()
{
  return v0;
}

void sub_7BFB4()
{
}

uint64_t sub_7BFBC()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

void sub_7BFD8(uint64_t a1)
{
}

void sub_7C00C()
{
  uint64_t v1 = sub_7D3EC();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_22FFC();
  uint64_t v3 = sub_26B0(&qword_D4AC0);
  uint64_t v4 = (void *)ParameterResolutionRecord.result.getter(v3);
  id v5 = [v4 disambiguationItems];

  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, (char *)&type metadata for Any + 8);
  uint64_t v7 = sub_7D268(v6);
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    uint64_t v71 = v2;
    uint64_t v8 = (void *)ParameterResolutionRecord.intent.getter(v3);
    if (qword_D3180 != -1) {
      swift_once(&qword_D3180, sub_82EAC);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_26F0(v9, (uint64_t)qword_D7050);
    id v10 = v8;
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v10, v11, v12, v13, v14, v15, v16, v17);
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v70 = v7;
      unint64_t v20 = (_DWORD *)sub_16AC4(12LL);
      uint64_t v68 = sub_16AC4(32LL);
      uint64_t v72 = v68;
      *unint64_t v20 = 136315138;
      uint64_t v21 = v20 + 3;
      uint64_t v66 = v20 + 1;
      uint64_t v67 = (uint64_t)v20;
      id v22 = v10;
      id v23 = v10;
      id v24 = [v22 description];
      uint64_t v25 = v0;
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
      unint64_t v28 = v27;

      id v10 = v23;
      uint64_t v29 = v26;
      uint64_t v0 = v25;
      uint64_t v30 = sub_3D10(v29, v28, &v72);
      uint64_t v31 = sub_7D404(v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, v32, v66, v21);

      swift_bridgeObjectRelease(v28);
      sub_666C8(&dword_0, v18, v19, "Creating ResponseAlarmDisambiguationFlowProvider with intent: %s");
      sub_16BB4(v68);
      sub_16AA8(v68);
      uint64_t v7 = v70;
      sub_16AA8(v67);
    }

    else
    {
    }

    uint64_t v42 = v71;
    uint64_t AlarmIntent = type metadata accessor for CreateAlarmIntent(0LL);
    if (sub_7D3A0(AlarmIntent))
    {
      uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.create(_:);
    }

    else
    {
      uint64_t v45 = type metadata accessor for DeleteAlarmIntent(0LL);
      if (sub_7D3A0(v45))
      {
        uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.delete(_:);
      }

      else
      {
        uint64_t v46 = type metadata accessor for SearchAlarmIntent(0LL);
        if (sub_7D3A0(v46))
        {
          uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.read(_:);
        }

        else
        {
          uint64_t v48 = type metadata accessor for ChangeAlarmStatusIntent(0LL);
          if (sub_7D3A0(v48))
          {
            id v49 = v10;
            else {
              uint64_t v50 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.enable(_:);
            }
            sub_7D424(*v50, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 104));

            goto LABEL_15;
          }

          uint64_t updated = type metadata accessor for UpdateAlarmIntent(0LL);
          if (sub_7D3A0(updated))
          {
            uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.update(_:);
          }

          else
          {
            uint64_t v52 = type metadata accessor for SnoozeAlarmHalIntent(0LL);
            if (sub_7D3A0(v52))
            {
              uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:);
            }

            else
            {
              uint64_t v53 = type metadata accessor for DismissAlarmHalIntent(0LL);
              if (!sub_7D3A0(v53))
              {
                id v54 = v10;
                uint64_t v62 = (os_log_s *)Logger.logObject.getter(v54, v55, v56, v57, v58, v59, v60, v61);
                os_log_type_t v63 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v62, v63))
                {
                  uint64_t v64 = (_DWORD *)sub_16AC4(12LL);
                  uint64_t v69 = (void *)sub_16AC4(8LL);
                  *uint64_t v64 = 138412290;
                  uint64_t v72 = (uint64_t)v54;
                  id v65 = v54;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v64 + 1, v64 + 3);
                  *uint64_t v69 = v54;

                  uint64_t v42 = v71;
                  sub_666C8( &dword_0,  v62,  v63,  "Unable to recognize the alarm intent %@. Returning default verb of .unknown");
                  sub_26B0(&qword_D3858);
                  sub_16BB4((uint64_t)v69);
                  sub_16AA8((uint64_t)v69);
                  sub_16AA8((uint64_t)v64);
                }

                else
                {

                  uint64_t v62 = (os_log_s *)v54;
                }

                sub_7D418( enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:),  *(uint64_t (**)(uint64_t, uint64_t, void))(v42 + 104));
                goto LABEL_15;
              }

              uint64_t v44 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:);
            }
          }
        }
      }
    }

    sub_7D424(*v44, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 104));
LABEL_15:
    uint64_t v47 = sub_26B0(&qword_D5E58);
    sub_7D3E0(v47);
    sub_7CA54((uint64_t)v7, v10, v0, &qword_D6CA8, &qword_D6CB0);
    goto LABEL_16;
  }

  sub_7D3D8();
  uint64_t v33 = sub_7D360((unint64_t *)&qword_D4198, &qword_D4190, (uint64_t)&unk_A4A10);
  uint64_t v34 = sub_25234(v33);
  sub_7D3C8(v34, v35, v36, v37, v38, v39, v40, v41);
LABEL_16:
  sub_670C0();
}

void sub_7C500(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v93 = sub_7D3EC();
  uint64_t v94 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  sub_22FFC();
  uint64_t v9 = sub_7D3D8();
  id v10 = (void *)ParameterResolutionRecord.result.getter();
  id v11 = [v10 disambiguationItems];

  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, (char *)&type metadata for Any + 8);
  uint64_t v13 = sub_7D268(v12);
  swift_bridgeObjectRelease(v12);
  if (v13)
  {
    uint64_t v92 = v5;
    uint64_t v14 = (void *)ParameterResolutionRecord.intent.getter(v9);
    if (qword_D3180 != -1) {
      swift_once(&qword_D3180, sub_82EAC);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    sub_26F0(v15, (uint64_t)qword_D7050);
    id v16 = v14;
    id v24 = (os_log_s *)Logger.logObject.getter(v16, v17, v18, v19, v20, v21, v22, v23);
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v86 = v25;
      uint64_t v88 = a5;
      uint64_t v26 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v84 = sub_16AC4(32LL);
      uint64_t v95 = v84;
      uint64_t v90 = v13;
      *(_DWORD *)uint64_t v26 = 136315138;
      unint64_t v27 = v26 + 12;
      uint64_t v81 = v26 + 4;
      uint64_t v82 = v26;
      id v28 = v16;
      uint64_t v29 = a3;
      id v30 = [v28 description];
      id v31 = v16;
      uint64_t v32 = a4;
      uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      unint64_t v35 = v34;

      a3 = v29;
      uint64_t v36 = v33;
      a4 = v32;
      id v16 = v31;
      uint64_t v37 = sub_3D10(v36, v35, &v95);
      uint64_t v38 = sub_7D404(v37);
      uint64_t v39 = v27;
      uint64_t v13 = v90;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v38, v40, v81, v39);

      swift_bridgeObjectRelease(v35);
      _os_log_impl(&dword_0, v24, v86, "Creating ResponseAlarmDisambiguationFlowProvider with intent: %s", v82, 0xCu);
      sub_16BB4(v84);
      sub_16AA8(v84);
      a5 = v88;
      sub_16AA8((uint64_t)v82);
    }

    else
    {
    }

    uint64_t v50 = v92;
    uint64_t AlarmIntent = type metadata accessor for CreateAlarmIntent(0LL);
    uint64_t v52 = sub_7D3AC(AlarmIntent);
    if (v52)
    {
      uint64_t v53 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.create(_:);
    }

    else
    {
      uint64_t v54 = type metadata accessor for DeleteAlarmIntent(0LL);
      uint64_t v52 = sub_7D3AC(v54);
      if (v52)
      {
        uint64_t v53 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.delete(_:);
      }

      else
      {
        uint64_t v55 = type metadata accessor for SearchAlarmIntent(0LL);
        uint64_t v52 = sub_7D3AC(v55);
        if (v52)
        {
          uint64_t v53 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.read(_:);
        }

        else
        {
          uint64_t v57 = v16;
          uint64_t v58 = type metadata accessor for ChangeAlarmStatusIntent(0LL);
          if (swift_dynamicCastClass(v57, v58))
          {
            uint64_t v59 = (void *)swift_dynamicCastClassUnconditional(v57, v58, 0LL, 0LL, 0LL);
            id v60 = v57;
            else {
              uint64_t v61 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.enable(_:);
            }
            sub_7D418(*v61, *(uint64_t (**)(uint64_t, uint64_t, void))(v94 + 104));

            id v16 = v57;
            goto LABEL_15;
          }

          uint64_t updated = type metadata accessor for UpdateAlarmIntent(0LL);
          uint64_t v52 = swift_dynamicCastClass(v57, updated);
          id v16 = v57;
          if (v52)
          {
            uint64_t v53 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.update(_:);
          }

          else
          {
            uint64_t v63 = type metadata accessor for SnoozeAlarmHalIntent(0LL);
            uint64_t v52 = sub_7D3AC(v63);
            if (v52)
            {
              uint64_t v53 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:);
            }

            else
            {
              uint64_t v64 = type metadata accessor for DismissAlarmHalIntent(0LL);
              uint64_t v52 = sub_7D3AC(v64);
              if (!v52)
              {
                uint64_t v91 = v13;
                id v65 = v57;
                uint64_t v73 = (os_log_s *)Logger.logObject.getter(v65, v66, v67, v68, v69, v70, v71, v72);
                os_log_type_t v74 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v73, v74))
                {
                  uint64_t v89 = a5;
                  uint64_t v75 = (_DWORD *)sub_16AC4(12LL);
                  Swift::String v83 = (void *)sub_16AC4(8LL);
                  uint64_t v85 = (uint64_t)v75;
                  *uint64_t v75 = 138412290;
                  uint64_t v76 = v75 + 3;
                  uint64_t v77 = v75 + 1;
                  uint64_t v95 = (uint64_t)v65;
                  uint64_t v87 = a3;
                  id v78 = v65;
                  uint64_t v50 = v92;
                  uint64_t v79 = v77;
                  a5 = v89;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v79, v76);
                  *Swift::String v83 = v65;

                  a3 = v87;
                  sub_666C8( &dword_0,  v73,  v74,  "Unable to recognize the alarm intent %@. Returning default verb of .unknown");
                  sub_26B0(&qword_D3858);
                  sub_16BB4((uint64_t)v83);
                  sub_16AA8((uint64_t)v83);
                  sub_16AA8(v85);
                }

                else
                {

                  uint64_t v73 = (os_log_s *)v65;
                }

                uint64_t v13 = v91;

                sub_7D3B8(v80, enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:));
                goto LABEL_15;
              }

              uint64_t v53 = (unsigned int *)&enum case for AlarmNLv4Constants.AlarmVerb.disable(_:);
            }
          }
        }
      }
    }

    sub_7D3B8(v52, *v53);
LABEL_15:
    uint64_t v56 = sub_26B0(a3);
    sub_7D3E0(v56);
    sub_7CA54((uint64_t)v13, v16, v50, a4, a5);
    goto LABEL_16;
  }

  sub_7D3D8();
  uint64_t v41 = sub_7D360((unint64_t *)&qword_D4198, &qword_D4190, (uint64_t)&unk_A4A10);
  uint64_t v42 = sub_25234(v41);
  sub_7D3C8(v42, v43, v44, v45, v46, v47, v48, v49);
LABEL_16:
  sub_670C0();
}

void *sub_7CA54(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v8 = v5;
  uint64_t v12 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  uint64_t v52 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v55);
  uint64_t v15 = type metadata accessor for ResponseFactory(0LL);
  sub_16D14(v15);
  uint64_t v16 = ResponseFactory.init()();
  v54[2] = v15;
  v54[3] = &protocol witness table for ResponseFactory;
  uint64_t v53 = v16;
  uint64_t v17 = type metadata accessor for PatternFlowProvider(0LL);
  sub_16D14(v17);
  uint64_t v18 = PatternFlowProvider.init(outputPublisher:responseGenerator:)(v55, &v53);
  v5[8] = v17;
  v5[9] = &protocol witness table for PatternFlowProvider;
  v5[5] = v18;
  v5[10] = 0xD000000000000018LL;
  v5[11] = 0x80000000000A9ED0LL;
  if (qword_D3028 != -1) {
    swift_once(&qword_D3028, sub_34C9C);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  sub_26F0(v19, (uint64_t)qword_D4AE8);
  sub_7D3F8();
  id v20 = a2;
  id v28 = (os_log_s *)Logger.logObject.getter(v20, v21, v22, v23, v24, v25, v26, v27);
  int v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, (os_log_type_t)v29))
  {
    id v46 = v20;
    uint64_t v47 = v12;
    uint64_t v30 = swift_slowAlloc(22LL, -1LL);
    uint64_t v44 = swift_slowAlloc(32LL, -1LL);
    v55[0] = v44;
    *(_DWORD *)uint64_t v30 = 134218242;
    uint64_t v50 = a5;
    uint64_t v51 = a3;
    uint64_t v48 = v14;
    uint64_t v49 = a4;
    int v45 = v29;
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0) {
        uint64_t v41 = a1;
      }
      else {
        uint64_t v41 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      uint64_t v31 = _CocoaArrayWrapper.endIndex.getter(v41);
      sub_16F40();
    }

    else
    {
      uint64_t v31 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    }

    sub_16F40();
    uint64_t v53 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v30 + 4, v30 + 12);
    sub_16F40();
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v43 = v30 + 14;
    id v20 = v46;
    id v32 = v46;
    id v33 = [v32 description];
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
    unint64_t v36 = v35;

    uint64_t v53 = sub_3D10(v34, v36, v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v43, v30 + 22);

    swift_bridgeObjectRelease(v36);
    _os_log_impl( &dword_0,  v28,  (os_log_type_t)v45,  "ResponseAlarmDisambiguationFlowProvider.init with %ld items and intent: %s",  (uint8_t *)v30,  0x16u);
    uint64_t v37 = v44;
    swift_arrayDestroy(v44, 1LL);
    sub_16AA8(v37);
    sub_16AA8(v30);

    a5 = v50;
    a3 = v51;
    uint64_t v14 = v48;
    a4 = v49;
    uint64_t v12 = v47;
  }

  else
  {

    swift_bridgeObjectRelease_n(a1, 2LL);
  }

  v8[2] = a1;
  v8[12] = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v14, a3, v12);
  uint64_t v38 = sub_26B0(a4);
  sub_16D14(v38);
  v8[3] = sub_7CDDC(a1, (uint64_t)v14);
  uint64_t v39 = sub_26B0(a5);
  sub_16D14(v39);
  v8[4] = sub_7CDDC(a1, a3);
  sub_7D3F8();
  return v8;
}

uint64_t sub_7CDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + qword_D4B90;
  uint64_t v6 = type metadata accessor for WindowedPaginationParameters(0LL);
  sub_A40C(v5, 1LL, 1LL, v6);
  *(void *)(v2 + qword_D4B98) = 0x8000000000000000LL;
  *(void *)(v2 + qword_D4BA0) = 0LL;
  *(void *)(v2 + 16) = a1;
  uint64_t v7 = v2 + qword_D4B88;
  uint64_t v8 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v7, a2, v8);
  return v2;
}

void *sub_7CE7C(void *a1)
{
  uint64_t v2 = type metadata accessor for DeleteAlarmIntent(0LL);
  uint64_t v3 = type metadata accessor for DeleteAlarmIntentResponse(0LL);
  RCHChildFlowProducersAsync.init()(v2, v3);
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  uint64_t v4 = static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)(qword_D84A8, v2, v3);
  uint64_t v6 = v5;
  uint64_t v7 = sub_26B0(&qword_D7AC0);
  RCHChildFlowProducersAsync.appResolutionFlowProducer.setter(v4, v6, v7);
  uint64_t v8 = sub_26B0(&qword_D6C70);
  uint64_t v9 = sub_7D360(&qword_D6C78, &qword_D6C70, (uint64_t)&unk_A5878);
  uint64_t v10 = static RCHChildFlowFactoryHelper.makeNeedsDisambiguationFlowProducer<A, B>(_:)(&unk_D6C68, 0LL, v8, v3, v9);
  uint64_t v11 = RCHChildFlowProducersAsync.needsDisambiguationFlowProducer.setter(v10);
  sub_19D68(v11, (uint64_t)v24);
  unint64_t v12 = sub_7D148();
  uint64_t v13 = static RCHChildFlowFactoryHelper.makeUnsupportedValueAndCancelFlowProducer<A>(strategy:)( v24,  &_s24UnsupportedValueStrategyVN,  v12);
  uint64_t v14 = RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter(v13);
  sub_19D68(v14, (uint64_t)v23);
  uint64_t v15 = _s21ConfirmIntentStrategyCMa();
  uint64_t v16 = swift_allocObject(v15, 56LL, 7LL);
  sub_46FC(v23, v16 + 16);
  *(void *)&v23[0] = v16;
  unint64_t v17 = sub_7D184();
  uint64_t v18 = static RCHChildFlowFactoryHelper.makeConditionalConfirmIntentFlowProducer<A>(strategy:_:)( v23,  sub_7D0F0,  0LL,  v15,  v17);
  uint64_t v19 = RCHChildFlowProducersAsync.confirmIntentFlowProducer.setter(v18);
  sub_19D68(v19, (uint64_t)v23);
  unint64_t v20 = sub_7D1C4();
  uint64_t v21 = static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)( v23,  &_s20HandleIntentStrategyVN_3,  v20);
  RCHChildFlowProducersAsync.handleIntentFlowProducer.setter(v21);
  swift_release(v16);
  _s20HandleIntentStrategyVwxx_1(a1);
  sub_7D200(v23);
  return sub_7D234(v24);
}

void sub_7D05C(uint64_t a1)
{
}

uint64_t sub_7D090(void *a1, uint64_t a2)
{
  *a1 = v4;
  return sub_19D5C(*(uint64_t (**)(void))(v2 + 8));
}

BOOL sub_7D0F0()
{
  uint64_t v0 = sub_26B0(&qword_D4A80);
  uint64_t v1 = (void *)IntentResolutionRecord.intentResponse.getter(v0);
  uint64_t v2 = dispatch thunk of DeleteAlarmIntentResponse.code.getter();

  uint64_t v3 = DeleteAlarmIntentResponseCode.rawValue.getter(v2);
  return v3 == DeleteAlarmIntentResponseCode.rawValue.getter(3LL);
}

unint64_t sub_7D148()
{
  unint64_t result = qword_D6C80;
  if (!qword_D6C80)
  {
    unint64_t result = swift_getWitnessTable(&unk_A50EC, &_s24UnsupportedValueStrategyVN);
    atomic_store(result, (unint64_t *)&qword_D6C80);
  }

  return result;
}

unint64_t sub_7D184()
{
  unint64_t result = qword_D6C88;
  if (!qword_D6C88)
  {
    uint64_t v1 = _s21ConfirmIntentStrategyCMa();
    unint64_t result = swift_getWitnessTable(&unk_A5408, v1);
    atomic_store(result, (unint64_t *)&qword_D6C88);
  }

  return result;
}

unint64_t sub_7D1C4()
{
  unint64_t result = qword_D6C90;
  if (!qword_D6C90)
  {
    unint64_t result = swift_getWitnessTable(&unk_A7408, &_s20HandleIntentStrategyVN_3);
    atomic_store(result, (unint64_t *)&qword_D6C90);
  }

  return result;
}

void *sub_7D200(void *a1)
{
  return a1;
}

void *sub_7D234(void *a1)
{
  return a1;
}

void *sub_7D268(uint64_t a1)
{
  uint64_t v11 = _swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (!v2) {
    return v11;
  }
  for (uint64_t i = a1 + 32; ; i += 32LL)
  {
    sub_3F2C(i, (uint64_t)v10);
    uint64_t v4 = type metadata accessor for SiriAlarm(0LL);
    id v5 = v9;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v6 = v11[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
    uint64_t v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v5);
    specialized ContiguousArray._endMutation()(v7);
    if (!--v2) {
      return v11;
    }
  }

  id v9 = 0LL;
  swift_release(v11);

  return 0LL;
}

uint64_t sub_7D360(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_16974(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_7D3A0(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}

uint64_t sub_7D3AC(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}

uint64_t sub_7D3B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v3 - 96) + 104LL))( v2,  a2,  *(void *)(v3 - 104));
}

uint64_t sub_7D3C8( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 1;
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_7D3D8()
{
  return sub_26B0(v0);
}

uint64_t sub_7D3E0(uint64_t a1)
{
  return swift_allocObject(a1, 104LL, 7LL);
}

uint64_t sub_7D3EC()
{
  return type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
}

uint64_t sub_7D3F8()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t sub_7D404(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_7D418@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, void)@<X8>)
{
  return a2(v2, a1, *(void *)(v3 - 104));
}

uint64_t sub_7D424@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v2, a1, v3);
}

char *sub_7D430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v36 = a2;
  uint64_t v37 = a4;
  uint64_t v38 = a3;
  uint64_t v9 = sub_26B0(&qword_D4178);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for SiriAlarmSnippetModel(0LL);
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v34 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v31 = (char *)v29 - v15;
  uint64_t v16 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  while (1)
  {
    uint64_t v32 = v16;
    if (!v16) {
      break;
    }
    v29[1] = v6;
    unint64_t v33 = a1 & 0xC000000000000001LL;
    unint64_t v17 = (char *)_swiftEmptyArrayStorage;
    uint64_t v18 = 4LL;
    uint64_t v6 = v32;
    uint64_t v30 = a1;
    while (1)
    {
      id v19 = v33 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, a1) : *(id *)(a1 + 8 * v18);
      unint64_t v20 = v19;
      uint64_t v21 = v18 - 3;
      if (__OFADD__(v18 - 4, 1LL)) {
        break;
      }
      sub_489F8();

      if (sub_16880((uint64_t)v11, 1LL, v12) == 1)
      {
        sub_7EC4((uint64_t)v11, &qword_D4178);
      }

      else
      {
        uint64_t v22 = a5;
        uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
        uint64_t v24 = v31;
        v23(v31, v11, v12);
        v23(v34, v24, v12);
        if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0) {
          unint64_t v17 = (char *)sub_6C9E4(0, *((void *)v17 + 2) + 1LL, 1, (uint64_t)v17);
        }
        unint64_t v26 = *((void *)v17 + 2);
        unint64_t v25 = *((void *)v17 + 3);
        if (v26 >= v25 >> 1) {
          unint64_t v17 = (char *)sub_6C9E4(v25 > 1, v26 + 1, 1, (uint64_t)v17);
        }
        *((void *)v17 + 2) = v26 + 1;
        v23( &v17[((*(unsigned __int8 *)(v35 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))
             + *(void *)(v35 + 72) * v26],
          v34,
          v12);
        a5 = v22;
        a1 = v30;
        uint64_t v6 = v32;
      }

      ++v18;
      if (v21 == v6)
      {
        swift_bridgeObjectRelease(v38);
        swift_bridgeObjectRelease(a1);
        goto LABEL_19;
      }
    }

    __break(1u);
LABEL_21:
    if (a1 < 0) {
      uint64_t v28 = a1;
    }
    else {
      uint64_t v28 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v28);
  }

  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRelease(a1);
  unint64_t v17 = (char *)_swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease(a5);
  return v17;
}

uint64_t sub_7D708()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D6CD0);
  sub_26F0(v0, (uint64_t)qword_D6CD0);
  return static SiriTimeLog.alarmFlow.getter();
}

void sub_7D750()
{
  if (*(void *)(v0 + 64)) {
    sub_1D584();
  }
  sub_17B50();
}

uint64_t sub_7D77C()
{
  id v1 = [*(id *)(v0 + 64) isMeridianInferred];
  sub_82860();
  v2.super.super.isa = sub_1D75C().super.super.isa;
  if (v1)
  {
    id v3 = v1;
    char v4 = static NSObject.== infix(_:_:)(v3, v2.super.super.isa);
  }

  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

void sub_7D7F4()
{
  if (*(void *)(v0 + 64)) {
    sub_1D510();
  }
  sub_17B50();
}

void sub_7D820()
{
  uint64_t v1 = *(void *)(v0 + 56);
  unint64_t v13 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0) {
      uint64_t v0 = v1;
    }
    else {
      uint64_t v0 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_16FD0();
    uint64_t v2 = sub_45644();
    if (v2) {
      goto LABEL_3;
    }
LABEL_21:
    sub_16D58();
    unint64_t v11 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_22;
  }

  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
  sub_16FD0();
  if (!v2) {
    goto LABEL_21;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return;
  }

  for (uint64_t i = 0LL; i != v2; ++i)
  {
    if ((v1 & 0xC000000000000001LL) != 0) {
      char v4 = (void *)sub_82764(i);
    }
    else {
      char v4 = sub_455EC(v1 + 8 * i);
    }
    uint64_t v5 = v4;
    sub_456A0([v4 sleepAlarmAttribute]);
    if (!v0)
    {
LABEL_11:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v6);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(*(void *)(v13 + 16));
      uint64_t v10 = sub_827D4();
      uint64_t v0 = (uint64_t)&v13;
      specialized ContiguousArray._endMutation()(v10);
      continue;
    }

    id v7 = [v5 enabled];
    sub_82860();
    v8.super.super.isa = sub_1D75C().super.super.isa;
    if (v7)
    {
      id v9 = v7;
      uint64_t v0 = static NSObject.== infix(_:_:)(v9, v8.super.super.isa);

      if ((v0 & 1) != 0) {
        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  sub_16D58();
  unint64_t v11 = v13;
  if ((v13 & 0x8000000000000000LL) != 0)
  {
LABEL_24:
    uint64_t v12 = sub_16FD0();
    _CocoaArrayWrapper.endIndex.getter(v12);
    sub_16FD8();
    goto LABEL_23;
  }

void sub_7D9B8()
{
  unint64_t v1 = *(void *)(v0 + 56);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    sub_16FD0();
    if (v2) {
      goto LABEL_3;
    }
LABEL_17:
    sub_16D58();
    goto LABEL_18;
  }

  sub_16FD0();
  uint64_t v2 = sub_45644();
  if (!v2) {
    goto LABEL_17;
  }
LABEL_3:
  sub_82860();
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001LL) != 0) {
        char v4 = (void *)sub_82764(i);
      }
      else {
        char v4 = sub_455EC(v1 + 8 * i);
      }
      uint64_t v5 = v4;
      id v6 = [v4 enabled];
      v7.super.super.isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
      if (v6)
      {
        id v8 = v6;
        char v9 = static NSObject.== infix(_:_:)(v8, v7.super.super.isa);

        if ((v9 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
          uint64_t v11 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v11);
          uint64_t v12 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v5);
          specialized ContiguousArray._endMutation()(v12);
        }

        else
        {
        }
      }

      else
      {
      }
    }

    sub_16D58();
LABEL_18:
    if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000LL) == 0)
    {
LABEL_19:
      sub_16FD8();
      sub_6D0F4();
      return;
    }

uint64_t sub_7DB48@<X0>(uint64_t a1@<X8>)
{
  if (*(void *)(v1 + 64)) {
    return sub_1D4B0(a1);
  }
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  return sub_A40C(a1, 1LL, 1LL, v4);
}

void sub_7DB98()
{
  if (*(void *)(v0 + 64)) {
    sub_1B6E0();
  }
  sub_17B50();
}

uint64_t sub_7DBC0()
{
  unint64_t v1 = *(void *)(v0 + 56);
  if (v1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
  sub_827EC();
  for (; v2; uint64_t v2 = sub_45644())
  {
    uint64_t v3 = 4LL;
    while (1)
    {
      id v4 = (v1 & 0xC000000000000001LL) != 0 ? (id)sub_82764(v3 - 4) : *(id *)(v1 + 8 * v3);
      uint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1LL)) {
        break;
      }
      id v7 = [v4 sleepAlarmAttribute];

      if (v7)
      {
        sub_827F8();
        sub_4828C();
        uint64_t v10 = v9;

        return v10;
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_10;
      }
    }

    __break(1u);
LABEL_13:
    sub_827EC();
  }

void *sub_7DCC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v2 + 2;
  uint64_t v7 = type metadata accessor for ApplicationContext(0LL);
  id v8 = (os_log_s *)static ApplicationContext.shared.getter(v7);
  ApplicationContext.deviceState.getter(v6);
  sub_17324();
  v3[9] = 0xD000000000000018LL;
  v3[10] = 0x80000000000A9810LL;
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v9 = sub_16C80();
  sub_16CD0(v9, (uint64_t)qword_D6CD0);
  os_log_type_t v10 = sub_16C50();
  if (sub_16D30(v10))
  {
    uint64_t v11 = (uint8_t *)sub_1EFA4();
    *(_WORD *)uint64_t v11 = 0;
    sub_16B44(&dword_0, v8, (os_log_type_t)v6, "SearchAlarm.ResultSetProvider init", v11);
    sub_16AA8((uint64_t)v11);
  }

  v3[7] = a2;
  v3[8] = a1;
  return v3;
}

uint64_t sub_7DDB8()
{
  *(void *)(v1 + 32) = v0;
  return sub_2D94C((uint64_t)sub_7DDC8);
}

uint64_t sub_7DDC8()
{
  uint64_t v1 = v0[4];
  static OutputPublisherFactory.makeOutputPublisherAsync()(v11);
  uint64_t v2 = type metadata accessor for ResponseFactory(0LL);
  sub_16D14(v2);
  uint64_t v3 = sub_82844();
  v12[3] = v2;
  v12[4] = &protocol witness table for ResponseFactory;
  v12[0] = v3;
  uint64_t v4 = type metadata accessor for PatternFlowProvider(0LL);
  sub_16D14(v4);
  uint64_t v5 = PatternFlowProvider.init(outputPublisher:responseGenerator:)(v11, v12);
  v0[5] = v5;
  v0[2] = v5;
  v0[3] = v1;
  uint64_t v6 = (void *)swift_task_alloc(async function pointer to PatternFlowProviding.makeResultSetFlow<A>(provider:)[1]);
  v0[6] = v6;
  uint64_t v7 = _s17ResultSetProviderCMa();
  sub_822D4((unint64_t *)&unk_D6F38, v8, (uint64_t (*)(uint64_t))_s17ResultSetProviderCMa);
  *uint64_t v6 = v0;
  v6[1] = sub_7DEC4;
  return PatternFlowProviding.makeResultSetFlow<A>(provider:)( v0 + 3,  v4,  v7,  &protocol witness table for PatternFlowProvider,  v9);
}

uint64_t sub_7DEC4(uint64_t a1)
{
  uint64_t v5 = *(void *)(v4 + 48);
  uint64_t v6 = *v2;
  *uint64_t v7 = v6;
  *(void *)(v4 + 56) = v1;
  swift_task_dealloc(v5);
  sub_16FFC();
  if (!v1) {
    return (*(uint64_t (**)(uint64_t))(v6 + 8))(a1);
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_7DF30()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_7DF3C()
{
  v1[2] = v0;
  uint64_t v2 = sub_826F0();
  v1[3] = sub_19754(*(void *)(v2 - 8));
  uint64_t v3 = sub_826E8();
  v1[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[5] = v4;
  v1[6] = sub_19754(v4);
  uint64_t v5 = sub_16C80();
  v1[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[8] = v6;
  v1[9] = sub_19754(v6);
  uint64_t v7 = sub_82774();
  v1[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v1[11] = v8;
  v1[12] = sub_19754(v8);
  uint64_t v9 = sub_8276C();
  v1[13] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v1[14] = v10;
  v1[15] = sub_19754(v10);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_7DFD8()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v20 = sub_26F0(v2[7], (uint64_t)qword_D6CD0);
  sub_16D50();
  os_log_type_t v4 = sub_16B4C();
  if (sub_16C38(v4))
  {
    uint64_t v5 = (_WORD *)sub_1EFA4();
    sub_45454(v5);
    sub_16B44(&dword_0, v0, v1, "SearchAlarm.ResultSetProvider makeEmptyResultsFlow()", v3);
    sub_16AA8((uint64_t)v3);
  }

  uint64_t v7 = v2[11];
  uint64_t v6 = v2[12];
  uint64_t v9 = v2[9];
  uint64_t v8 = v2[10];
  uint64_t v10 = v2[7];
  uint64_t v11 = v2[8];
  uint64_t v12 = v2[2];

  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))( v6,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v20, v10);
  uint64_t v13 = mach_absolute_time();
  uint64_t v14 = SiriTimeMeasurement.init(_:log:startTime:)(v6, v9, v13);
  if (*(void *)(v12 + 64)) {
    uint64_t v15 = (void *)sub_8487C(v14);
  }
  else {
    uint64_t v15 = _swiftEmptyArrayStorage;
  }
  v2[16] = v15;
  if (qword_D30B8 != -1) {
    swift_once(&qword_D30B8, sub_53C74);
  }
  uint64_t v16 = qword_D83E0;
  uint64_t v17 = unk_D5FE4;
  uint64_t v21 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t))((char *)&dword_D5FE0 + dword_D5FE0);
  swift_retain(v2[2]);
  uint64_t v18 = (void *)swift_task_alloc(v17);
  v2[17] = v18;
  *uint64_t v18 = v2;
  v18[1] = sub_7E18C;
  return v21(1, (uint64_t)v15, v16, v2[2]);
}

uint64_t sub_7E18C(uint64_t a1)
{
  *(void *)(v2 + 144) = v1;
  swift_task_dealloc();
  sub_16F40();
  if (!v1) {
    *(void *)(v2 + 152) = a1;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_7E1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7[3];
  static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7);
  OutputGenerationManifest.init(dialogPhase:_:)(v8, nullsub_1, 0LL);
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlow(manifest:measure:)[1]);
  v7[20] = v9;
  *uint64_t v9 = v7;
  v9[1] = sub_7E260;
  sub_8271C(v7[6]);
  return sub_82558();
}

uint64_t sub_7E260()
{
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 40);
  sub_455CC();
  *(void *)(v4 + 168) = v3;
  sub_199C0(v5);

  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_7E2B4()
{
  return sub_8258C(*(void *)(v0 + 168), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_7E2FC()
{
  return sub_1984C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_7E340()
{
  v1[17] = v0;
  uint64_t v2 = sub_826E8();
  v1[18] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[19] = v3;
  v1[20] = sub_19754(v3);
  uint64_t v4 = sub_16C80();
  v1[21] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[22] = v5;
  v1[23] = sub_19754(v5);
  uint64_t v6 = sub_82774();
  v1[24] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v1[25] = v7;
  v1[26] = sub_19754(v7);
  uint64_t v8 = sub_8276C();
  v1[27] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v1[28] = v9;
  v1[29] = sub_250D0(v9);
  v1[30] = sub_19884();
  uint64_t v10 = sub_82858();
  v1[31] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[32] = v11;
  v1[33] = sub_19754(v11);
  uint64_t v12 = sub_826F0();
  v1[34] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v1[35] = v13;
  v1[36] = sub_19754(v13);
  uint64_t v14 = sub_26B0(&qword_D4178);
  v1[37] = sub_19754(*(void *)(v14 - 8));
  uint64_t v15 = type metadata accessor for SiriAlarmSnippetModel(0LL);
  v1[38] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v1[39] = v16;
  v1[40] = sub_19754(v16);
  uint64_t v17 = sub_26B0(&qword_D3A08);
  v1[41] = sub_19754(*(void *)(v17 - 8));
  uint64_t v18 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v1[42] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v1[43] = v19;
  v1[44] = sub_19754(v19);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_7E46C()
{
  uint64_t v2 = *(void *)(*(void *)(v0 + 136) + 56LL);
  if (!((unint64_t)v2 >> 62))
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
    sub_176C8();
    if (v3) {
      goto LABEL_3;
    }
LABEL_24:
    sub_16C48();
    *(_BYTE *)(v0 + 528) = 3;
    uint64_t v61 = sub_82728();
    sub_8274C((unint64_t *)&qword_D4198);
    swift_allocError(v61, v62, 0LL, 0LL);
    uint64_t v63 = static BarbaraWalters.logAndReturnError<A>(context:_:)(0xD00000000000004DLL, 0x80000000000A9F40LL, v0 + 528);
    swift_willThrow(v63, v64, v65, v66, v67, v68, v69, v70);
    goto LABEL_25;
  }

  if (v2 < 0) {
    uint64_t v60 = *(void *)(*(void *)(v0 + 136) + 56LL);
  }
  else {
    uint64_t v60 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_176C8();
  if (!_CocoaArrayWrapper.endIndex.getter(v60)) {
    goto LABEL_24;
  }
LABEL_3:
  sub_44080(0LL, (v2 & 0xC000000000000001LL) == 0, v2);
  if ((v2 & 0xC000000000000001LL) != 0) {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v2);
  }
  else {
    id v4 = *(id *)(v2 + 32);
  }
  uint64_t v5 = v4;
  *(void *)(v0 + 360) = v4;
  sub_16C48();
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v6 = (os_log_s *)sub_26F0(*(void *)(v0 + 168), (uint64_t)qword_D6CD0);
  *(void *)(v0 + 368) = v6;
  sub_16D50();
  os_log_type_t v7 = sub_16C50();
  if (sub_16D30(v7))
  {
    uint64_t v8 = (uint8_t *)sub_1EFA4();
    *(_WORD *)uint64_t v8 = 0;
    sub_16B44(&dword_0, (os_log_s *)v2, v1, "SearchAlarm.ResultSetProvider makeSingleItemFlow()", v8);
    sub_16AA8((uint64_t)v8);
  }

  uint64_t v10 = *(void *)(v0 + 344);
  uint64_t v9 = *(uint8_t **)(v0 + 352);

  static SiriTimeFeatureFlagsImpl.instance.getter(v11);
  Swift::Bool v12 = SiriTimeFeatureFlagsImpl.isAlarmSmartEnabled()();
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  if (v12)
  {
    sub_4828C();
    *(void *)(v0 + 376) = v13;
    if (v13)
    {
      uint64_t v21 = v13;
      if (qword_D30B0 != -1) {
        swift_once(&qword_D30B0, sub_53C58);
      }
      uint64_t v22 = *(void *)(v0 + 328);
      swift_retain(v21);
      sub_7D820();
      sub_7D9B8();
      sub_7DB48(v22);
      sub_7DB98();
      *(void *)(v0 + 384) = v23;
      sub_7D7F4();
      sub_7D750();
      sub_7D77C();
      uint64_t v24 = (void *)swift_task_alloc(dword_D80AC);
      *(void *)(v0 + 392) = v24;
      *uint64_t v24 = v0;
      v24[1] = sub_7E944;
      sub_8277C();
      return sub_A12C4(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    Logger.logObject.getter(0LL, v14, v15, v16, v17, v18, v19, v20);
    os_log_type_t v49 = sub_17714();
    if (sub_16BA4(v49))
    {
      uint64_t v50 = (_WORD *)sub_1EFA4();
      sub_45454(v50);
      sub_16B44(&dword_0, v6, (os_log_type_t)v6, "Can NOT retrieve alarm data.", v9);
      sub_16AA8((uint64_t)v9);
    }

    sub_82728();
    sub_8274C((unint64_t *)&qword_D4198);
    uint64_t v52 = sub_82520(v51);
    _BYTE *v53 = 3;
    swift_willThrow(v52, v53, v54, v55, v56, v57, v58, v59);

LABEL_25:
    sub_825C0();
    swift_task_dealloc();
    sub_19800();
    sub_1978C();
    sub_19794();
    sub_197C0();
    sub_19830();
    sub_19828();
    sub_19820();
    sub_1987C();
    sub_19808();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v34 = *(void *)(v0 + 184);
  uint64_t v35 = *(void *)(v0 + 168);
  uint64_t v36 = *(void *)(v0 + 176);
  (*(void (**)(void, void, void))(*(void *)(v0 + 200) + 104LL))( *(void *)(v0 + 208),  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  *(void *)(v0 + 192));
  (*(void (**)(uint64_t, os_log_s *, uint64_t))(v36 + 16))(v34, v6, v35);
  uint64_t v37 = mach_absolute_time();
  sub_827E0(v37, v38, v37);
  if (qword_D30B8 != -1) {
    swift_once(&qword_D30B8, sub_53C74);
  }
  uint64_t v39 = *(void *)(v0 + 136);
  uint64_t v40 = qword_D83E0;
  char v41 = sub_7D77C();
  sub_7D7F4();
  char v43 = v42;
  sub_7D750();
  char v45 = v44;
  uint64_t v46 = unk_D5FDC;
  uint64_t v71 = (uint64_t (*)(char, char, char, uint64_t, uint64_t, uint64_t))((char *)&dword_D5FD8 + dword_D5FD8);
  id v47 = v5;
  swift_retain(v39);
  uint64_t v48 = (void *)swift_task_alloc(v46);
  *(void *)(v0 + 488) = v48;
  *uint64_t v48 = v0;
  v48[1] = sub_7F03C;
  return v71(v41 & 1, v43 & 1, v45 & 1, v40, (uint64_t)v47, *(void *)(v0 + 136));
}

uint64_t sub_7E944()
{
  v1[50] = v2;
  v1[51] = v0;
  sub_199C0(v3);
  sub_7EC4(v1[41], &qword_D3A08);
  sub_16FFC();
  sub_16FD8();
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_7E9B0()
{
  if (v0)
  {
    id v4 = (void *)swift_task_alloc(dword_D7A0C);
    *(void *)(v1 + 416) = v4;
    sub_82650(v4, (uint64_t)sub_7EC20);
    return sub_97748();
  }

  else
  {
    uint64_t v6 = *(void *)(v1 + 360);
    uint64_t v8 = *(void *)(v1 + 296);
    os_log_type_t v7 = *(void **)(v1 + 304);
    sub_489F8();
    swift_bridgeObjectRelease_n(0xE000000000000000LL, 2LL);
    if (sub_16880(v8, 1LL, (uint64_t)v7) == 1)
    {
      sub_7EC4(*(void *)(v1 + 296), &qword_D4178);
      Logger.logObject.getter(v9, v10, v11, v12, v13, v14, v15, v16);
      os_log_type_t v17 = sub_17714();
      if (sub_1990C(v17))
      {
        uint64_t v18 = (_WORD *)sub_1EFA4();
        sub_16BEC(v18);
        sub_198C0(&dword_0, v19, v20, "Can NOT retrieve alarm snippet model.");
        sub_16AA8(v8);
      }

      sub_827A8();
      sub_82728();
      sub_8274C((unint64_t *)&qword_D4198);
      uint64_t v22 = sub_82520(v21);
      sub_82708(v22, v23, v24, v25, v26, v27, v28, v29);
      sub_16FD8();

      sub_824D4();
      sub_19800();
      sub_1978C();
      sub_19794();
      sub_197C0();
      sub_19830();
      sub_19828();
      sub_19820();
      sub_1987C();
      sub_19808();
      swift_task_dealloc();
      return sub_8249C(*(uint64_t (**)(void))(v1 + 8));
    }

    else
    {
      uint64_t v30 = sub_823C8();
      static DialogPhase.completion.getter(v30, v31, v32, v33, v34, v35, v36);
      uint64_t v37 = sub_26B0(&qword_D4188);
      inited = (__n128 *)swift_initStackObject(v37, v6);
      sub_826D4(inited, v39, v40, v41, (__n128)xmmword_A4CD0);
      id v42 = v7;
      sub_82818();
      sub_16C48();
      *(void *)(v1 + 120) = sub_58C00();
      sub_82810( (unint64_t *)&qword_D41A0,  v43,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
      sub_82804(v44);
      uint64_t v45 = sub_26B0(&qword_D41A8);
      uint64_t v46 = (__n128 *)sub_825E4(v45);
      sub_82628(v46, (__n128)xmmword_A4880);
      uint64_t v47 = sub_82838();
      uint64_t v48 = sub_82698(v47, enum case for SiriAlarmSnippetModels.alarmMulti(_:));
      uint64_t v55 = sub_82684( v48,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v49,  v50,  v51,  v52,  v53,  v54,  v72,  v75,  v78);
      sub_82670(v55, v56, v57, v58, v59, v60, v61, v62, v73, v76, v79, v81, v83, v85);
      uint64_t v63 = mach_absolute_time();
      sub_8265C(v63);
      uint64_t v64 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
      *(void *)(v1 + 480) = v64;
      sub_82468(v64, v65, v66, v67, v68, v69, v70, v71, v74, v77, v80, v82, v84, v86, v87, v88);
      return sub_824B8();
    }
  }

uint64_t sub_7EC20()
{
  v0[53] = v2;
  v0[54] = v3;
  v0[55] = v1;
  sub_199C0(v4);
  if (v1)
  {
    sub_19840();
    return sub_197B8();
  }

  else
  {
    uint64_t v6 = (void *)swift_task_alloc(dword_D7A04);
    v0[56] = v6;
    sub_82650(v6, (uint64_t)sub_7EC94);
    return sub_97864();
  }

uint64_t sub_7EC94(uint64_t a1, uint64_t a2)
{
  v3[57] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease(v3[54]);
  }

  else
  {
    v3[58] = a2;
    v3[59] = a1;
  }

  sub_19840();
  return sub_1EA50();
}

uint64_t sub_7ECF8()
{
  uint64_t v1 = *(void **)(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v5 = *(void **)(v0 + 296);
  uint64_t v4 = *(void **)(v0 + 304);
  sub_489F8();
  sub_16D58();
  sub_16F40();
  if (sub_16880((uint64_t)v5, 1LL, (uint64_t)v4) == 1)
  {
    sub_7EC4(*(void *)(v0 + 296), &qword_D4178);
    Logger.logObject.getter(v6, v7, v8, v9, v10, v11, v12, v13);
    os_log_type_t v14 = sub_17714();
    if (sub_1990C(v14))
    {
      uint64_t v15 = (_WORD *)sub_1EFA4();
      sub_16BEC(v15);
      sub_198C0(&dword_0, v16, v17, "Can NOT retrieve alarm snippet model.");
      sub_16AA8(v2);
    }

    sub_827A8();
    sub_82728();
    sub_8274C((unint64_t *)&qword_D4198);
    uint64_t v19 = sub_82520(v18);
    sub_82708(v19, v20, v21, v22, v23, v24, v25, v26);
    sub_16FD8();

    sub_824D4();
    sub_19800();
    sub_1978C();
    sub_19794();
    sub_197C0();
    sub_19830();
    sub_19828();
    sub_19820();
    sub_1987C();
    sub_19808();
    swift_task_dealloc();
    return sub_8249C(*(uint64_t (**)(void))(v0 + 8));
  }

  else
  {
    uint64_t v28 = sub_823C8();
    static DialogPhase.completion.getter(v28, v29, v30, v31, v32, v33, v34);
    uint64_t v35 = sub_26B0(&qword_D4188);
    inited = (__n128 *)swift_initStackObject(v35, v3);
    sub_826D4(inited, v37, v38, v39, (__n128)xmmword_A4CD0);
    id v40 = v1;
    sub_82818();
    sub_16C48();
    *(void *)(v0 + 120) = sub_58C00();
    sub_82810( (unint64_t *)&qword_D41A0,  v41,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
    sub_82804(v42);
    uint64_t v43 = sub_26B0(&qword_D41A8);
    uint64_t v44 = (__n128 *)sub_825E4(v43);
    sub_82628(v44, (__n128)xmmword_A4880);
    uint64_t v45 = sub_82838();
    uint64_t v46 = sub_82698(v45, enum case for SiriAlarmSnippetModels.alarmMulti(_:));
    uint64_t v53 = sub_82684( v46,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v47,  v48,  v49,  v50,  v51,  v52,  v70,  v73,  v76);
    sub_82670(v53, v54, v55, v56, v57, v58, v59, v60, v71, v74, v77, v79, v81, v83);
    uint64_t v61 = mach_absolute_time();
    sub_8265C(v61);
    uint64_t v62 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
    *(void *)(v0 + 480) = v62;
    sub_82468(v62, v63, v64, v65, v66, v67, v68, v69, v72, v75, v78, v80, v82, v84, v85, v86);
    return sub_824B8();
  }

uint64_t sub_7EF08()
{
  uint64_t v7 = (uint64_t)(v0 + 12);
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[32];
  sub_25068(v0[60]);
  sub_827B8();
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_7EC4(v7, &qword_D41B0);
  sub_19840();
  return sub_82420(v3, v4, v5);
}

#error "7F024: call analysis failed (funcsize=47)"
uint64_t sub_7F03C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  sub_25078();
  sub_1996C(v3);
  *(void *)(v2 + 496) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 504) = v0;
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_7F090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7[45];
  static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7);
  uint64_t v9 = swift_task_alloc(32LL);
  *(void *)(v9 + 16) = v8;
  sub_82798(v9, (uint64_t)sub_822CC);
  sub_1978C();
  uint64_t v10 = (uint64_t **)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlow(manifest:measure:)[1]);
  v7[64] = (uint64_t)v10;
  *uint64_t v10 = v7;
  v10[1] = (uint64_t *)sub_7F11C;
  sub_8271C(v7[20]);
  return sub_82558();
}

uint64_t sub_7F11C()
{
  uint64_t v1 = *(void **)(v0 + 504);
  uint64_t v2 = *(void *)(v0 + 152);
  sub_455CC();
  *(void *)(v4 + 520) = v3;
  sub_199C0(v5);

  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_19840();
  return sub_1EA50();
}

#error "7F1C0: call analysis failed (funcsize=26)"
#error "7F224: call analysis failed (funcsize=23)"
#error "7F288: call analysis failed (funcsize=25)"
#error "7F2EC: call analysis failed (funcsize=25)"
#error "7F34C: call analysis failed (funcsize=24)"
uint64_t sub_7F35C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t SuccessSingleParameters;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v2 = sub_26B0(&qword_D3A08);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_8284C();
  uint64_t v6 = v5;
  swift_release(*(void *)a1);
  *(void *)a1 = v6;
  sub_7D820();
  *(void *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = 0;
  sub_7D9B8();
  *(void *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = 0;
  uint64_t v9 = sub_7DBC0();
  swift_release(*(void *)(a1 + 32));
  *(void *)(a1 + 32) = v9;
  sub_7DB48((uint64_t)v4);
  SuccessSingleParameters = type metadata accessor for SearchQuerySuccessSingleParameters(0LL);
  sub_1B4F0((uint64_t)v4, a1 + *(int *)(SuccessSingleParameters + 44));
  sub_7DB98();
  uint64_t v12 = v11;
  uint64_t v13 = *(int *)(SuccessSingleParameters + 52);
  swift_release(*(void *)(a1 + v13));
  *(void *)(a1 + v13) = v12;
  type metadata accessor for SirikitApp(0LL);
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  os_log_type_t v14 = swift_retain(qword_D84A8);
  uint64_t v15 = SirikitApp.init(app:)(v14);
  uint64_t result = swift_release(*(void *)(a1 + 8));
  *(void *)(a1 + 8) = v15;
  return result;
}

uint64_t sub_7F4A4(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_26B0(&qword_D3890);
  __chkstk_darwin(v3);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v6 = sub_26B0(&qword_D4188);
  uint64_t inited = swift_initStackObject(v6, v16);
  *(_OWORD *)(inited + 16) = xmmword_A4CD0;
  *(void *)(inited + 32) = a2;
  uint64_t v15 = inited;
  specialized Array._endMutation()(inited, v8, v9, v10);
  uint64_t v11 = v15;
  id v12 = a2;
  sub_6044();
  swift_bridgeObjectRelease(v11);
  uint64_t v13 = type metadata accessor for NLContextUpdate(0LL);
  sub_A40C((uint64_t)v5, 0LL, 1LL, v13);
  return OutputGenerationManifest.nlContextUpdate.setter(v5);
}

uint64_t sub_7F580()
{
  v1[12] = v0;
  uint64_t v2 = sub_826E8();
  v1[13] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[14] = v3;
  v1[15] = sub_19754(v3);
  uint64_t v4 = sub_3855C();
  v1[16] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[17] = v5;
  v1[18] = sub_19754(v5);
  uint64_t v6 = sub_16C80();
  v1[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v1[20] = v7;
  v1[21] = sub_19754(v7);
  uint64_t v8 = sub_82774();
  v1[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v1[23] = v9;
  v1[24] = sub_19754(v9);
  uint64_t v10 = sub_8276C();
  v1[25] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[26] = v11;
  v1[27] = sub_250D0(v11);
  v1[28] = sub_19884();
  uint64_t v12 = sub_82858();
  v1[29] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v1[30] = v13;
  v1[31] = sub_19754(v13);
  uint64_t v14 = sub_826F0();
  v1[32] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v1[33] = v15;
  v1[34] = sub_19754(v15);
  uint64_t v16 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v1[35] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[36] = v17;
  v1[37] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_7F678()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v4 = sub_26F0(v2[19], (uint64_t)qword_D6CD0);
  v2[38] = v4;
  sub_16D50();
  os_log_type_t v5 = sub_16C50();
  if (sub_16BA4(v5))
  {
    uint64_t v6 = (_WORD *)sub_1EFA4();
    sub_45454(v6);
    sub_16B44(&dword_0, v0, v1, "SearchAlarm.ResultSetProvider makeAllResultsFlow()", v3);
    sub_16AA8((uint64_t)v3);
  }

  uint64_t v7 = v2[12];

  unint64_t v9 = *(void *)(v7 + 56);
  if (v9 >> 62)
  {
    sub_176C8();
    uint64_t v29 = sub_82824();
    uint64_t v8 = sub_16C48();
    if (v29) {
      goto LABEL_7;
    }
LABEL_15:
    uint64_t v30 = (void *)swift_task_alloc(dword_D6D1C);
    v2[39] = v30;
    void *v30 = v2;
    v30[1] = sub_7F918;
    return sub_7DF3C();
  }

LABEL_7:
  unint64_t v10 = *(void *)(v7 + 56);
  if (v10 >> 62)
  {
    sub_176C8();
    uint64_t v11 = sub_82824();
    uint64_t v8 = sub_16C48();
  }

  else
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v11 == 1)
  {
    uint64_t v12 = (void *)swift_task_alloc(dword_D6D24);
    v2[40] = v12;
    *uint64_t v12 = v2;
    v12[1] = sub_7F97C;
    return sub_82700();
  }

  else
  {
    uint64_t v15 = v2[36];
    uint64_t v14 = v2[37];
    uint64_t v16 = v2[35];
    static SiriTimeFeatureFlagsImpl.instance.getter(v8);
    Swift::Bool v17 = SiriTimeFeatureFlagsImpl.isAlarmSmartEnabled()();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    if (v17)
    {
      uint64_t v18 = (void *)swift_task_alloc(dword_D7A0C);
      v2[41] = v18;
      sub_82650(v18, (uint64_t)sub_7F9E0);
      return sub_97748();
    }

    else
    {
      uint64_t v19 = v2[21];
      uint64_t v20 = v2[19];
      uint64_t v21 = v2[20];
      sub_58AA8(v2[23]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v4, v20);
      uint64_t v22 = mach_absolute_time();
      uint64_t v24 = sub_58A9C(v22, v23, v22);
      static WindowedPaginationParameters.makeNoPagination()(v24);
      uint64_t v25 = *(void *)(v7 + 56);
      v2[52] = v25;
      uint64_t v26 = dword_D6D4C;
      sub_45B94();
      uint64_t v27 = (void *)swift_task_alloc(v26);
      v2[53] = v27;
      *uint64_t v27 = v2;
      v27[1] = sub_7FEC0;
      uint64_t v28 = sub_8271C(v2[18]);
      return sub_826F8(v28, v25);
    }
  }

uint64_t sub_7F918()
{
  uint64_t v8 = v3;
  sub_19810();
  uint64_t v4 = *v2;
  sub_82518(*(void *)(v0 + 312), v5);
  sub_82568();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  sub_1987C();
  uint64_t v6 = sub_19800();
  if (!v1) {
    uint64_t v6 = v8;
  }
  return sub_82388(v6, *(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_7F97C()
{
  uint64_t v8 = v3;
  sub_19810();
  uint64_t v4 = *v2;
  sub_82518(*(void *)(v0 + 320), v5);
  sub_82568();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  sub_1987C();
  uint64_t v6 = sub_19800();
  if (!v1) {
    uint64_t v6 = v8;
  }
  return sub_82388(v6, *(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_7F9E0()
{
  uint64_t v2 = *(void **)v1;
  sub_1992C();
  v2[42] = v3;
  v2[43] = v4;
  sub_199C0(v5);
  if (v0)
  {
    sub_82534();
    sub_19800();
    sub_1978C();
    sub_19794();
    sub_197C0();
    sub_19830();
    sub_19828();
    sub_19820();
    sub_1987C();
    return sub_19704(*(uint64_t (**)(void))(v1 + 8));
  }

  else
  {
    uint64_t v7 = (void *)swift_task_alloc(dword_D7A04);
    v2[44] = v7;
    sub_82650(v7, (uint64_t)sub_7FA84);
    return sub_97864();
  }

uint64_t sub_7FA84(uint64_t a1, uint64_t a2)
{
  v3[45] = v2;
  swift_task_dealloc();
  if (!v2)
  {
    v3[46] = a2;
    v3[47] = a1;
  }

  sub_19840();
  return sub_1EA50();
}

uint64_t sub_7FAE0()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v4 = v0[42];
  uint64_t v3 = v0[43];
  uint64_t v5 = *(void *)(v0[12] + 56LL);
  swift_bridgeObjectRetain(v3);
  sub_16FD0();
  uint64_t v6 = swift_bridgeObjectRetain(v5);
  v0[48] = sub_7D430(v6, v4, v3, v2, v1);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  sub_16D58();
  if (qword_D30B0 != -1) {
    swift_once(&qword_D30B0, sub_53C58);
  }
  sub_7D820();
  uint64_t v8 = v7;
  unint64_t v9 = (void *)swift_task_alloc(dword_D80B4);
  v0[49] = v9;
  sub_82650(v9, (uint64_t)sub_7FBD4);
  return sub_A16B0(v8, 0);
}

uint64_t sub_7FBD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20)
{
  a19 = v22;
  a20 = v23;
  a18 = v21;
  uint64_t v25 = v24;
  uint64_t v26 = (void *)*v21;
  a18 = v26;
  uint64_t v27 = (void *)*v21;
  sub_82518(v26[49], &a18);
  if (v20)
  {
    swift_bridgeObjectRelease(v26[48]);
    sub_82534();
    sub_19800();
    sub_1978C();
    sub_19794();
    sub_197C0();
    sub_19830();
    sub_19828();
    sub_19820();
    sub_1987C();
    return sub_19704((uint64_t (*)(void))v27[1]);
  }

  else
  {
    v26[50] = v25;
    sub_19840();
    return sub_82420(v29, v30, v31);
  }

uint64_t sub_7FC5C()
{
  uint64_t v1 = v0[48];
  uint64_t v31 = v0[38];
  uint64_t v3 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[20];
  uint64_t v30 = v0[19];
  static DialogPhase.completion.getter(v7, v8, v9, v10, v11, v12, v13);
  sub_45B94();
  sub_6044();
  sub_16F40();
  uint64_t v14 = sub_58C00();
  v0[10] = v14;
  sub_82810( (unint64_t *)&qword_D41A0,  v15,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
  v0[11] = v16;
  Swift::Bool v17 = sub_19558(v0 + 7);
  AlarmSnippetModel.init(alarms:)(v1);
  sub_17A5C( (uint64_t)v17,  enum case for SiriAlarmSnippetModels.alarmMulti(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104LL));
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))( v2,  enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:),  v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v31, v30);
  uint64_t v18 = mach_absolute_time();
  sub_827E0(v18, v19, v18);
  uint64_t v20 = (void *)swift_task_alloc(async function pointer to DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)[1]);
  v0[51] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_7FDC4;
  sub_8277C();
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)( v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28);
}

uint64_t sub_7FDC4()
{
  uint64_t v7 = (uint64_t)(v0 + 7);
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[30];
  sub_25068(v0[51]);
  sub_827B8();
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_7EC4(v7, &qword_D41B0);
  sub_19840();
  return sub_82420(v3, v4, v5);
}

uint64_t sub_7FE3C()
{
  uint64_t v1 = (void *)v0[50];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  sub_80B4(v0 + 2, v2);
  Output.generateFlow()(v2, v3);

  _s20HandleIntentStrategyVwxx_1(v0 + 2);
  sub_823A4();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  sub_1987C();
  uint64_t v4 = sub_82640();
  return sub_82388(v4, v5);
}

uint64_t sub_7FEC0(uint64_t a1)
{
  v2[54] = v1;
  swift_task_dealloc();
  uint64_t v5 = v2[17];
  if (!v1) {
    v2[55] = a1;
  }
  sub_19838(v5);
  sub_16F40();
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_7FF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7);
  sub_82798(v8, (uint64_t)sub_822C4);
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlow(manifest:measure:)[1]);
  *(void *)(v7 + 448) = v9;
  *uint64_t v9 = v7;
  v9[1] = sub_7FFB0;
  uint64_t v10 = sub_8271C(*(void *)(v7 + 120));
  return PatternExecutionResult.generateFlow(manifest:measure:)(v10);
}

uint64_t sub_7FFB0()
{
  uint64_t v1 = *(void **)(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 112);
  sub_455CC();
  *(void *)(v4 + 456) = v3;
  sub_199C0(v5);

  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_80004()
{
  uint64_t v1 = sub_82640();
  return sub_82388(v1, v2);
}

uint64_t sub_8005C()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_800B0()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_80108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_26B0(&qword_D3890);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain(v6);
  sub_6044();
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = type metadata accessor for NLContextUpdate(0LL);
  sub_A40C((uint64_t)v5, 0LL, 1LL, v7);
  return OutputGenerationManifest.nlContextUpdate.setter(v5);
}

uint64_t sub_801AC(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = sub_3855C();
  v3[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[8] = v5;
  uint64_t v6 = *(void *)(v5 + 64);
  v3[9] = v6;
  v3[10] = swift_task_alloc((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_826F0();
  v3[11] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[12] = v8;
  v3[13] = sub_19754(v8);
  uint64_t v9 = sub_826E8();
  v3[14] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[15] = v10;
  v3[16] = sub_250D0(v10);
  v3[17] = sub_19884();
  uint64_t v11 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  v3[18] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[19] = v12;
  v3[20] = sub_19754(v12);
  uint64_t v13 = sub_82858();
  v3[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v3[22] = v14;
  v3[23] = sub_19754(v14);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_80270()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v2 = sub_16C80();
  uint64_t v3 = (os_log_s *)sub_16CD0(v2, (uint64_t)qword_D6CD0);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)sub_1EFA4();
    sub_16BEC(v5);
    sub_16B44(&dword_0, v3, v4, "SearchAlarm.ResultSetProvider makeWindowFlow", v0);
    sub_16AA8((uint64_t)v0);
  }

  uint64_t v6 = v1[23];
  uint64_t v7 = v1[20];
  uint64_t v41 = v1[22];
  uint64_t v42 = v1[21];
  uint64_t v8 = v1[19];
  uint64_t v43 = v1[17];
  uint64_t v9 = v1[15];
  uint64_t v11 = v1[13];
  uint64_t v10 = v1[14];
  uint64_t v39 = v10;
  uint64_t v40 = v9;
  uint64_t v30 = v1[12];
  uint64_t v31 = v1[11];
  uint64_t v32 = v1[16];
  uint64_t v12 = v1[8];
  uint64_t v35 = v1[10];
  uint64_t v36 = v1[9];
  uint64_t v37 = v1[6];
  uint64_t v38 = v1[5];
  uint64_t v33 = v1[4];
  uint64_t v34 = v1[7];

  sub_17A5C( v7,  enum case for AlarmNLv4Constants.AlarmVerb.summarise(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 104));
  sub_79B0C();
  uint64_t v13 = sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  static DialogPhase.clarification.getter(v13);
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)( v11,  v6,  0LL,  0LL,  0LL,  0LL,  0LL);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v11, v31);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v32, v43, v10);
  uint64_t v14 = type metadata accessor for ResponseFactory(0LL);
  sub_16D14(v14);
  uint64_t v46 = v14;
  uint64_t v47 = &protocol witness table for ResponseFactory;
  v45[0] = sub_82844();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v35, v33, v34);
  uint64_t v15 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = (v15 + 24) & ~v15;
  unint64_t v17 = (v36 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v18 = swift_allocObject(&unk_CD028, v17 + 8, v15 | 7);
  *(void *)(v18 + 16) = v37;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v18 + v16, v35, v34);
  *(void *)(v18 + v17) = v38;
  uint64_t v19 = type metadata accessor for YesNoSearchWindowStrategy(0LL);
  sub_16D14(v19);
  swift_retain(v37);
  swift_bridgeObjectRetain(v38);
  uint64_t v20 = YesNoSearchWindowStrategy.init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)( v32,  v45,  &unk_D6EF8,  0LL,  &unk_D6F00,  0LL,  sub_809E4,  0LL,  &unk_D6F08,  0LL,  &unk_D6F18,  v18);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v44);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  uint64_t v21 = sub_82844();
  uint64_t v46 = v14;
  uint64_t v47 = &protocol witness table for ResponseFactory;
  v45[0] = v21;
  uint64_t v22 = type metadata accessor for PatternFlowProvider(0LL);
  sub_16D14(v22);
  v1[2] = PatternFlowProvider.init(outputPublisher:responseGenerator:)(v44, v45);
  sub_822D4(&qword_D6F20, 255LL, (uint64_t (*)(uint64_t))&type metadata accessor for YesNoSearchWindowStrategy);
  uint64_t v24 = PatternFlowProviding.makeResponseFlowWithContinuationPrompt<A>(strategy:)( v20,  v22,  v19,  &protocol witness table for PatternFlowProvider,  v23);
  sub_16FFC();
  v1[3] = v24;
  uint64_t v25 = sub_26B0(&qword_D6F28);
  sub_4930(&qword_D6F30, &qword_D6F28);
  Flow.eraseToAnyValueFlow()(v25, v26);
  sub_16FD8();
  swift_release(v20);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v43, v39);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v6, v42);
  sub_19800();
  swift_task_dealloc();
  sub_1978C();
  sub_1987C();
  swift_task_dealloc();
  sub_19830();
  uint64_t v27 = sub_82640();
  return v28(v27);
}

uint64_t sub_80664(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for NLContextUpdate(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DialogPhase(0LL);
  v1[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[7] = v5;
  v1[8] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_806EC, 0LL, 0LL);
}

uint64_t sub_806EC()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v1 = sub_16C80();
  sub_16CD0(v1, (uint64_t)qword_D6CD0);
  os_log_type_t v2 = sub_16C50();
  if (sub_1990C(v2))
  {
    uint64_t v3 = (_WORD *)sub_1EFA4();
    sub_16BEC(v3);
    sub_198C0(&dword_0, v4, v5, "SearchAlarm.ResultSetProvider window prompt producing rejection output");
    sub_16AA8(v0);
  }

  sub_827C8();
  uint64_t v6 = static DialogPhase.canceled.getter();
  NLContextUpdate.init()(v6);
  uint64_t v7 = (void *)swift_task_alloc(dword_D387C);
  uint64_t v8 = sub_826AC(v7);
  return sub_82600(v8, v9, v10);
}

uint64_t sub_807A4()
{
  if (v0)
  {
    sub_19840();
    return sub_197B8();
  }

  else
  {
    sub_82868();
    sub_19808();
    uint64_t v4 = (uint64_t (*)(void))sub_19958();
    return sub_198F4(v4);
  }

uint64_t sub_80824(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for NLContextUpdate(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DialogPhase(0LL);
  v1[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[7] = v5;
  v1[8] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_808AC, 0LL, 0LL);
}

uint64_t sub_808AC()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v1 = sub_16C80();
  sub_16CD0(v1, (uint64_t)qword_D6CD0);
  os_log_type_t v2 = sub_16C50();
  if (sub_1990C(v2))
  {
    uint64_t v3 = (_WORD *)sub_1EFA4();
    sub_16BEC(v3);
    sub_198C0(&dword_0, v4, v5, "SearchAlarm.ResultSetProvider window prompt producing cancel output");
    sub_16AA8(v0);
  }

  sub_827C8();
  uint64_t v6 = static DialogPhase.canceled.getter();
  NLContextUpdate.init()(v6);
  uint64_t v7 = (void *)swift_task_alloc(dword_D387C);
  uint64_t v8 = sub_826AC(v7);
  return sub_82600(v8, v9, v10);
}

uint64_t sub_80964()
{
  if (v0)
  {
    sub_19840();
    return sub_197B8();
  }

  else
  {
    sub_82868();
    sub_19808();
    uint64_t v4 = (uint64_t (*)(void))sub_19958();
    return sub_198F4(v4);
  }

uint64_t sub_809E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NLIntent(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_26F0(v6, (uint64_t)qword_D6CD0);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v7, v8, v9, v10, v11, v12, v13, v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v17 = 0;
    _os_log_impl(&dword_0, v15, v16, "SearchAlarm.ResultSetProvider Window prompt parsing nlv3 ActionForInput", v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v18 = type metadata accessor for AlarmNLIntent(0LL);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  uint64_t v19 = sub_716E4((uint64_t)v5);
  sub_715D0();
  else {
    static ActionForInput.handle()(v20);
  }
  return swift_release(v19);
}

uint64_t sub_80B68(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_26B0((uint64_t *)&unk_D36F0);
  v2[4] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for NLIntent(0LL);
  v2[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[6] = v5;
  v2[7] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_80BEC, 0LL, 0LL);
}

uint64_t sub_80BEC()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v3 = sub_16C80();
  sub_16CD0(v3, (uint64_t)qword_D6CD0);
  os_log_type_t v4 = sub_16C50();
  if (sub_1990C(v4))
  {
    uint64_t v5 = (_WORD *)sub_1EFA4();
    sub_16BEC(v5);
    sub_198C0(&dword_0, v6, v7, "SearchAlarm.ResultSetProvider Window prompt parsing nlv3 window action");
    sub_16AA8(v1);
  }

  uint64_t v9 = v2[6];
  uint64_t v8 = v2[7];
  uint64_t v10 = v2[5];
  uint64_t v11 = v2[3];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
  uint64_t v12 = type metadata accessor for AlarmNLIntent(0LL);
  sub_16D14(v12);
  sub_716E4(v8);
  sub_715D0();
  if (v13 - 1 >= 2)
  {
    if (v13)
    {
      uint64_t v17 = type metadata accessor for ConfirmationResponse(0LL);
      uint64_t v18 = 1LL;
      goto LABEL_11;
    }

    uint64_t v14 = v2[4];
    uint64_t v15 = (unsigned int *)&enum case for ConfirmationResponse.confirmed(_:);
  }

  else
  {
    uint64_t v14 = v2[4];
    uint64_t v15 = (unsigned int *)&enum case for ConfirmationResponse.rejected(_:);
  }

  uint64_t v16 = *v15;
  uint64_t v17 = type metadata accessor for ConfirmationResponse(0LL);
  sub_17A5C(v14, v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104LL));
  uint64_t v18 = 0LL;
LABEL_11:
  uint64_t v19 = v2[4];
  sub_A40C(v19, v18, 1LL, v17);
  SimpleConfirmationResponseProvider.init(_:)(v19);
  sub_17324();
  sub_1978C();
  sub_19794();
  uint64_t v20 = (uint64_t (*)(void))sub_19958();
  return v20();
}

uint64_t sub_80D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc(dword_D6D4C);
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_80DD4;
  return sub_815E0(a2, a3);
}

uint64_t sub_80DD4(uint64_t a1)
{
  uint64_t v4 = sub_1B5CC();
  if (!v1) {
    uint64_t v4 = a1;
  }
  return sub_82560(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_80E08(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_826F0();
  v3[5] = sub_19754(*(void *)(v4 - 8));
  uint64_t v5 = sub_826E8();
  v3[6] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[7] = v6;
  v3[8] = sub_19754(v6);
  uint64_t v7 = sub_16C80();
  v3[9] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[10] = v8;
  v3[11] = sub_19754(v8);
  uint64_t v9 = sub_82774();
  v3[12] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[13] = v10;
  v3[14] = sub_19754(v10);
  uint64_t v11 = sub_8276C();
  v3[15] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[16] = v12;
  v3[17] = sub_19754(v12);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_80EA8()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  sub_16CD0(v3[9], (uint64_t)qword_D6CD0);
  os_log_type_t v5 = sub_16B4C();
  if (sub_16C38(v5))
  {
    uint64_t v6 = (_WORD *)sub_1EFA4();
    sub_45454(v6);
    sub_16B44(&dword_0, v0, v2, "SearchAlarm.ResultSetProvider makeFinalWindowFlow", v4);
    sub_16AA8((uint64_t)v4);
  }

  uint64_t v7 = v3[4];

  unint64_t v16 = *(void *)(v7 + 56);
  if (v16 >> 62)
  {
    sub_16FD0();
    uint64_t v17 = sub_82824();
    uint64_t v8 = sub_16D58();
  }

  else
  {
    uint64_t v17 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v17 == 1)
  {
    Logger.logObject.getter(v8, v9, v10, v11, v12, v13, v14, v15);
    os_log_type_t v18 = sub_16C50();
    if (sub_1990C(v18))
    {
      uint64_t v19 = (_WORD *)sub_1EFA4();
      sub_16BEC(v19);
      sub_198C0( &dword_0,  v20,  v21,  "SearchAlarm.ResultSetProvider Bypassing windowing flow for single item presentation");
      sub_16AA8(1LL);
    }

    uint64_t v22 = (uint64_t **)swift_task_alloc(dword_D6D24);
    v3[18] = (uint64_t)v22;
    *uint64_t v22 = v3;
    v22[1] = (uint64_t *)sub_8106C;
    return sub_82700();
  }

  else
  {
    uint64_t v24 = v3[11];
    uint64_t v25 = v3[9];
    uint64_t v26 = v3[10];
    sub_58AA8(v3[13]);
    (*(void (**)(uint64_t, void *, uint64_t))(v26 + 16))(v24, v1, v25);
    uint64_t v27 = mach_absolute_time();
    sub_58A9C(v27, v28, v27);
    uint64_t v29 = (uint64_t **)swift_task_alloc(dword_D6D4C);
    v3[19] = (uint64_t)v29;
    *uint64_t v29 = v3;
    v29[1] = (uint64_t *)sub_810EC;
    uint64_t v30 = sub_8271C(v3[2]);
    return sub_826F8(v30, v31);
  }

uint64_t sub_8106C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = *v2;
  sub_82518(*(void *)(v7 + 144), &v7);
  swift_task_dealloc();
  sub_1978C();
  sub_19794();
  sub_197C0();
  uint64_t v5 = sub_19830();
  if (!v1) {
    uint64_t v5 = a1;
  }
  return sub_82560(v5, *(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_810EC()
{
  *(void *)(v2 + 160) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 168) = v0;
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_81140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7[5];
  uint64_t v9 = v7[3];
  static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7);
  uint64_t v10 = swift_task_alloc(32LL);
  *(void *)(v10 + 16) = v9;
  OutputGenerationManifest.init(dialogPhase:_:)(v8, sub_8217C, v10);
  sub_1978C();
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlow(manifest:measure:)[1]);
  v7[22] = v11;
  *uint64_t v11 = v7;
  v11[1] = sub_811D8;
  sub_8271C(v7[8]);
  return sub_82558();
}

uint64_t sub_811D8()
{
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 56);
  sub_455CC();
  *(void *)(v4 + 184) = v3;
  sub_199C0(v5);

  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_8122C()
{
  uint64_t v1 = sub_82640();
  return sub_8258C(v1, v2);
}

uint64_t sub_81278()
{
  return sub_1984C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_812C4()
{
  uint64_t v0 = sub_26B0(&qword_D3890);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_6044();
  uint64_t v3 = type metadata accessor for NLContextUpdate(0LL);
  sub_A40C((uint64_t)v2, 0LL, 1LL, v3);
  return OutputGenerationManifest.nlContextUpdate.setter(v2);
}

uint64_t sub_81358(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_26B0(&qword_D6EE0);
  v2[5] = sub_19754(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for ResponseMode(0LL);
  v2[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[7] = v5;
  _BYTE v2[8] = sub_250D0(v5);
  v2[9] = sub_19884();
  sub_19840();
  return sub_1988C();
}

uint64_t sub_813C0()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  type metadata accessor for SiriEnvironment(0LL);
  static SiriEnvironment.default.getter();
  SiriEnvironment.currentRequest.getter();
  uint64_t v5 = sub_17324();
  CurrentRequest.responseMode.getter(v5);
  uint64_t v6 = sub_16FD8();
  static ResponseMode.voiceOnly.getter(v6);
  char v7 = static ResponseMode.== infix(_:_:)(v1, v2);
  uint64_t v8 = *(os_log_s **)(v4 + 8);
  ((void (*)(uint64_t, uint64_t))v8)(v2, v3);
  ((void (*)(uint64_t, uint64_t))v8)(v1, v3);
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v9 = sub_16C80();
  sub_16CD0(v9, (uint64_t)qword_D6CD0);
  os_log_type_t v10 = sub_16C50();
  if (sub_16BA4(v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v11 = 67109120;
    *(_DWORD *)(v0 + 80) = v7 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 84, v11 + 4, v11 + 8);
    _os_log_impl( &dword_0,  v8,  (os_log_type_t)v1,  "[ResultSetProvider.makeWindowingConfiguration] Using windowing configuration = %{BOOL}d",  v11,  8u);
    sub_16AA8((uint64_t)v11);
  }

  if ((v7 & 1) != 0)
  {
    uint64_t v12 = *(void *)(v0 + 40);
    *(void *)(v0 + 16) = *(void *)(v0 + 32);
    uint64_t v13 = sub_26B0(&qword_D4D88);
    uint64_t v14 = _s17ResultSetProviderCMa();
    sub_822D4(&qword_D6EF0, v15, (uint64_t (*)(uint64_t))_s17ResultSetProviderCMa);
    static PromptFlowProviderType.continuation<A>(_:)(v0 + 16, v13, v14, v16);
    WindowingConfiguration.init(promptFlowProviderType:padding:windowSizeOverride:)( v12,  1LL,  0LL,  1LL,  (char *)&type metadata for () + 8,  v13);
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v17 = 1LL;
  }

  uint64_t v18 = *(void *)(v0 + 24);
  uint64_t v19 = sub_26B0(&qword_D6EE8);
  sub_A40C(v18, v17, 1LL, v19);
  sub_19800();
  sub_1978C();
  sub_19794();
  uint64_t v20 = (uint64_t (*)(void))sub_19958();
  return sub_198F4(v20);
}

uint64_t sub_815E0(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_2D94C((uint64_t)sub_815F4);
}

uint64_t sub_815F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, unint64_t a24)
{
  uint64_t v25 = v24[3];
  a24 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v25 >> 62)
  {
    if (v25 < 0) {
      uint64_t v36 = v25;
    }
    else {
      uint64_t v36 = v25 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_176C8();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(v36);
    uint64_t v26 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease(v24[3]);
    unint64_t v35 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_18;
  }

  uint64_t v26 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFF8LL));
  uint64_t result = sub_176C8();
  if (!v26) {
    goto LABEL_17;
  }
LABEL_3:
  if (v26 < 1)
  {
    __break(1u);
    goto LABEL_40;
  }

  uint64_t v28 = 0LL;
  unint64_t v29 = v25 & 0xC000000000000001LL;
  uint64_t v30 = v24[3] + 32LL;
  do
  {
    if (v29) {
      id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v24[3]);
    }
    else {
      id v31 = *(id *)(v30 + 8 * v28);
    }
    uint64_t v32 = v31;
    sub_456A0([v31 sleepAlarmAttribute]);
    if (v25)
    {
    }

    else
    {
      uint64_t v25 = (uint64_t)&a24;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v33);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(*(void *)(a24 + 16));
      uint64_t v34 = sub_827D4();
      specialized ContiguousArray._endMutation()(v34);
    }

    ++v28;
  }

  while (v26 != v28);
  swift_bridgeObjectRelease(v24[3]);
  unint64_t v35 = a24;
LABEL_18:
  a24 = (unint64_t)_swiftEmptyArrayStorage;
  if ((v35 & 0x8000000000000000LL) != 0 || (v35 & 0x4000000000000000LL) != 0)
  {
    uint64_t v51 = swift_retain(v35);
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(v51);
    uint64_t v37 = result;
    if (result)
    {
LABEL_21:
      if (v37 >= 1)
      {
        for (uint64_t i = 0LL; i != v37; ++i)
        {
          if ((v35 & 0xC000000000000001LL) != 0) {
            uint64_t v39 = sub_82764(i);
          }
          else {
            uint64_t v39 = (uint64_t)sub_455EC(v35 + 8 * i);
          }
          uint64_t v40 = (void *)v39;
          sub_8284C();
          uint64_t v42 = v41;

          if (v42)
          {
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v43);
            unint64_t v45 = *(void *)((char *)&dword_10 + (a24 & 0xFFFFFFFFFFFFFF8LL));
            unint64_t v44 = *(void *)((char *)&dword_18 + (a24 & 0xFFFFFFFFFFFFFF8LL));
            if (v45 >= v44 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v44 > 1, v45 + 1, 1LL);
            }
            uint64_t v46 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v45, v42);
            specialized Array._endMutation()(v46, v47, v48, v49);
          }
        }

        sub_16FD8();
        unint64_t v50 = a24;
        goto LABEL_34;
      }

uint64_t sub_818F8(uint64_t a1)
{
  *(void *)(v2 + 72) = v1;
  swift_task_dealloc();
  sub_16F40();
  if (!v1) {
    *(void *)(v2 + 80) = a1;
  }
  swift_task_dealloc();
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_81964()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 80));
}

uint64_t sub_8199C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

double sub_819D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = qword_D3178;
  swift_retain(a3);
  if (v7 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  uint64_t v8 = swift_retain(qword_D84A8);
  uint64_t v9 = SirikitApp.init(app:)(v8);
  SuccessMultiParameters = (int *)type metadata accessor for SearchQuerySuccessMultiParameters(0LL);
  uint64_t v11 = SuccessMultiParameters[5];
  uint64_t v12 = swift_release(*(void *)(a1 + v11));
  *(void *)(a1 + v11) = v9;
  uint64_t v13 = WindowedPaginationParameters.windowSize.getter(v12);
  uint64_t v14 = a1 + SuccessMultiParameters[17];
  *(double *)uint64_t v14 = (double)v13;
  *(_BYTE *)(v14 + 8) = 0;
  uint64_t v15 = SuccessMultiParameters[15];
  swift_release(*(void *)(a1 + v15));
  *(void *)(a1 + v15) = a3;
  uint64_t v16 = *(void *)(a4 + 56);
  if ((unint64_t)v16 >> 62)
  {
    if (v16 < 0) {
      uint64_t v20 = *(void *)(a4 + 56);
    }
    else {
      uint64_t v20 = v16 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v16);
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v16);
  }

  else
  {
    uint64_t v17 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL));
  }

  double result = (double)v17;
  uint64_t v19 = a1 + SuccessMultiParameters[16];
  *(double *)uint64_t v19 = (double)v17;
  *(_BYTE *)(v19 + 8) = 0;
  return result;
}

uint64_t sub_81AFC()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 80));
  return v0;
}

uint64_t sub_81B30()
{
  return swift_deallocClassInstance(v0, 88LL, 7LL);
}

uint64_t _s17ResultSetProviderCMa()
{
  return objc_opt_self(&OBJC_CLASS____TtCO15AlarmFlowPlugin11SearchAlarm17ResultSetProvider);
}

uint64_t sub_81B70()
{
  return swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 56LL));
}

uint64_t sub_81B7C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 80LL));
  return v1;
}

uint64_t sub_81BAC()
{
  uint64_t v1 = ResultSetFlowProvider.makeNarrowingPromptFlowIfNeeded()();
  return sub_81DFC(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

uint64_t sub_81BE4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_D6D1C);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_82358;
  return sub_7DF3C();
}

uint64_t sub_81C2C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_D6D24);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_82358;
  return sub_7E340();
}

uint64_t sub_81C74()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_D6D2C);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_82358;
  return sub_7F580();
}

uint64_t sub_81CBC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D6D44);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B3B8;
  return sub_81358(a1);
}

uint64_t sub_81D10(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc(dword_D6D3C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_82358;
  return sub_80E08(a1, v4);
}

uint64_t sub_81D70(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc(dword_D6D34);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_82358;
  return sub_801AC(a1, v4);
}

void sub_81DD0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_81DFC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_81E10(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_26B0(&qword_D37D0);
  v2[4] = sub_19754(*(void *)(v3 - 8));
  sub_19840();
  return sub_1988C();
}

uint64_t sub_81E54()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for HALAlarmDeviceContext(0LL);
  sub_A40C(v1, 1LL, 1LL, v2);
  sub_1511C();
  uint64_t v4 = v3;
  sub_7EC4(v1, &qword_D37D0);
  sub_19808();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_81ED4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_2D94C((uint64_t)sub_81EE4);
}

uint64_t sub_81EE4()
{
  if (qword_D3160 != -1) {
    swift_once(&qword_D3160, sub_7D708);
  }
  uint64_t v3 = sub_16C80();
  sub_16CD0(v3, (uint64_t)qword_D6CD0);
  os_log_type_t v4 = sub_16B4C();
  if (sub_16C38(v4))
  {
    uint64_t v5 = (_WORD *)sub_1EFA4();
    sub_45454(v5);
    sub_16B44( &dword_0,  v0,  (os_log_type_t)v1,  "SearchAlarm.HandleIntentStrategy.makeIntentHandledResponse() called.",  v2);
    sub_16AA8((uint64_t)v2);
  }

  uint64_t v14 = (void *)Logger.logObject.getter(v6, v7, v8, v9, v10, v11, v12, v13);
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (sub_1990C(v15))
  {
    uint64_t v16 = (_WORD *)sub_1EFA4();
    sub_16BEC(v16);
    sub_198C0(&dword_0, v17, v18, "Alarms #response enabled – allowing ResultSet output to handle rendering");
    sub_16AA8(v1);
  }

  type metadata accessor for EmptyOutput(0LL);
  static EmptyOutput.instance.getter();
  uint64_t v19 = (uint64_t (*)(void))sub_19958();
  return sub_198F4(v19);
}

uint64_t sub_81FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to HandleIntentFlowStrategyAsync.makePreHandleIntentOutput(rchRecord:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1B578;
  return HandleIntentFlowStrategyAsync.makePreHandleIntentOutput(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_82058(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D6F8C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B578;
  return sub_81ED4(a1);
}

uint64_t sub_820A8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_D7478 + dword_D7478);
  uint64_t v3 = (void *)swift_task_alloc(unk_D747C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B578;
  return v5(a1);
}

uint64_t sub_8211C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D6F94);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_5DA4;
  return sub_81E10(a1, a2);
}

double sub_82170(uint64_t a1)
{
  return sub_819D0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_8217C()
{
  return sub_812C4();
}

uint64_t sub_82184()
{
  uint64_t v1 = sub_3855C();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_82210()
{
  uint64_t v2 = *(void *)(sub_3855C() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v7 = (void *)swift_task_alloc(dword_D6F14);
  *(void *)(v1 + 16) = v7;
  sub_82650(v7, (uint64_t)sub_82294);
  return sub_80D70(v4, v5, v6);
}

uint64_t sub_82294(uint64_t a1)
{
  return sub_82560(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_822C4(uint64_t a1)
{
  return sub_80108(a1, v1);
}

uint64_t sub_822CC(uint64_t a1)
{
  return sub_7F4A4(a1, *(void **)(v1 + 16));
}

void sub_822D4(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v4 = a3(a2);
    atomic_store(sub_755D8(v4), a1);
  }

  sub_17B50();
}

ValueMetadata *_s20HandleIntentStrategyVMa_2()
{
  return &_s20HandleIntentStrategyVN_2;
}

unint64_t sub_8231C()
{
  unint64_t result = qword_D6F48[0];
  if (!qword_D6F48[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_A7098, &_s20HandleIntentStrategyVN_2);
    atomic_store(result, qword_D6F48);
  }

  return result;
}

uint64_t sub_82360()
{
  return swift_task_dealloc(*(void *)(v0 + 352));
}

uint64_t sub_82388(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_823A4()
{
  return swift_task_dealloc(*(void *)(v0 + 296));
}

uint64_t sub_823C8()
{
  return (*(uint64_t (**)(void, void, void))(v0[39] + 32LL))(v0[40], v0[37], v0[38]);
}

uint64_t sub_82420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_8243C()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 72);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 80) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_82468( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *a1 = v17;
  a1[1] = v16;
  *(void *)(v18 + 16) = 0LL;
  return a16;
}

uint64_t sub_8249C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_824B8()
{
  return ((uint64_t (*)(void))DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:))();
}

uint64_t sub_824D4()
{
  return swift_task_dealloc(*(void *)(v0 + 352));
}

uint64_t sub_824FC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_82518@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v2;
  return swift_task_dealloc(a1);
}

uint64_t sub_82520(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

uint64_t sub_82534()
{
  return swift_task_dealloc(*(void *)(v0 + 296));
}

uint64_t sub_82558()
{
  return PatternExecutionResult.generateFlow(manifest:measure:)();
}

uint64_t sub_82560(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_82568()
{
  return swift_task_dealloc(*(void *)(v0 + 296));
}

uint64_t sub_8258C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_825A0()
{
  return (*(uint64_t (**)(void, void))(v0[14] + 8LL))(v0[15], v0[13]);
}

uint64_t sub_825C0()
{
  return *(void *)(v0 + 352);
}

uint64_t sub_825E4(uint64_t a1)
{
  return swift_allocObject( a1,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
         + *(void *)(v1 + 72),
           *(unsigned __int8 *)(v1 + 80) | 7LL);
}

uint64_t sub_82600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18B98(a1, a2, a3);
}

uint64_t sub_82610()
{
  return swift_task_dealloc(*(void *)(v0 + 136));
}

uint64_t sub_82628(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)a1 + v2, v3, v4);
}

uint64_t sub_82640()
{
  return v0;
}

void *sub_82650@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *unint64_t result = v2;
  result[1] = a2;
  return result;
}

uint64_t sub_8265C(uint64_t a1)
{
  return SiriTimeMeasurement.init(_:log:startTime:)(v1, v2, a1);
}

uint64_t sub_82670( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a12 + 16))(v14, a14, a13);
}

uint64_t sub_82684( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a9 + 104))(a10, a2, a11);
}

uint64_t sub_82698(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 104LL))(v3, a2, v2);
}

uint64_t sub_826AC(void *a1)
{
  *(void *)(v2 + 72) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 16);
}

void sub_826C8()
{
}

uint64_t sub_826D4(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, __n128 a5)
{
  a1[1] = a5;
  a1[2].n128_u64[0] = v5;
  return specialized Array._endMutation()(a1, a2, a3, a4);
}

uint64_t sub_826E8()
{
  return type metadata accessor for OutputGenerationManifest(0LL);
}

uint64_t sub_826F0()
{
  return type metadata accessor for DialogPhase(0LL);
}

uint64_t sub_826F8(uint64_t a1, uint64_t a2)
{
  return sub_815E0(a1, a2);
}

uint64_t sub_82700()
{
  return sub_7E340();
}

uint64_t sub_82708( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 3;
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_8271C@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_82728()
{
  return sub_26B0(v0);
}

  ;
}

void sub_8274C(unint64_t *a1)
{
}

void sub_82754()
{
}

uint64_t sub_82764(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

uint64_t sub_8276C()
{
  return type metadata accessor for SiriTimeMeasurement(0LL);
}

uint64_t sub_82774()
{
  return type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
}

  ;
}

uint64_t sub_82798(uint64_t a1, uint64_t a2)
{
  return OutputGenerationManifest.init(dialogPhase:_:)(v2, a2, v3);
}

void sub_827A8()
{
}

uint64_t sub_827B8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

void sub_827C8()
{
}

uint64_t sub_827D4()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v1, v0);
}

uint64_t sub_827E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SiriTimeMeasurement.init(_:log:startTime:)(v3, v4, a3);
}

uint64_t sub_827EC()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t sub_827F8()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

void *sub_82804(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return sub_19558(v2);
}

void sub_82810(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
}

void sub_82818()
{
}

uint64_t sub_82824()
{
  return _CocoaArrayWrapper.endIndex.getter(v0);
}

uint64_t sub_8282C()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_82838()
{
  return AlarmSnippetModel.init(alarms:)(v0);
}

uint64_t sub_82844()
{
  return ResponseFactory.init()();
}

void sub_8284C()
{
}

uint64_t sub_82858()
{
  return type metadata accessor for NLContextUpdate(0LL);
}

unint64_t sub_82860()
{
  return sub_5E3C();
}

uint64_t sub_82868()
{
  return swift_task_dealloc(*(void *)(v0 + 64));
}

uint64_t sub_82874(uint64_t a1)
{
  return sub_828A4(a1, &enum case for SiriTimeAppBundleId.clockApp(_:), &qword_D8488, &qword_D8490);
}

uint64_t sub_8288C(uint64_t a1)
{
  return sub_828A4( a1,  (unsigned int *)&enum case for SiriTimeAppBundleId.alarmExtension(_:),  &qword_D8498,  &qword_D84A0);
}

uint64_t sub_828A4(uint64_t a1, unsigned int *a2, uint64_t *a3, void *a4)
{
  uint64_t v7 = type metadata accessor for SiriTimeAppBundleId(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (*(uint64_t (**)(char *, void, uint64_t))(v8 + 104))(v10, *a2, v7);
  uint64_t v12 = SiriTimeAppBundleId.rawValue.getter(v11);
  uint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *a3 = v12;
  *a4 = v14;
  return result;
}

uint64_t sub_82958()
{
  if (qword_D3168 != -1) {
    swift_once(&qword_D3168, sub_82874);
  }
  uint64_t v0 = qword_D8488;
  uint64_t v1 = qword_D8490;
  uint64_t v2 = qword_D3170;
  swift_bridgeObjectRetain(qword_D8490);
  if (v2 != -1) {
    swift_once(&qword_D3170, sub_8288C);
  }
  uint64_t v3 = qword_D8498;
  uint64_t v4 = qword_D84A0;
  uint64_t v5 = type metadata accessor for App(0LL);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  swift_bridgeObjectRetain(v4);
  uint64_t result = App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)( v0,  v1,  v3,  v4,  0LL,  0LL,  0LL,  0LL);
  qword_D84A8 = result;
  return result;
}

uint64_t type metadata accessor for DeleteAlarmCATs_Async(uint64_t a1)
{
  uint64_t result = qword_D6F98;
  if (!qword_D6F98) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DeleteAlarmCATs_Async);
  }
  return result;
}

uint64_t sub_82A78(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D84B0);
}

uint64_t sub_82AB4(uint64_t a1, char a2)
{
  *(_BYTE *)(v3 + 56) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return sub_2D94C((uint64_t)sub_82AC8);
}

uint64_t sub_82AC8()
{
  char v1 = *(_BYTE *)(v0 + 56);
  uint64_t v2 = sub_26B0(&qword_D3BD0);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  *(void *)(v3 + 32) = 0xD000000000000012LL;
  *(void *)(v3 + 40) = 0x80000000000A8150LL;
  *(void *)(v3 + 72) = &type metadata for Bool;
  *(_BYTE *)(v3 + 48) = v1;
  uint64_t v4 = sub_82D4C((uint64_t)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  *(void *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc(v4);
  *(void *)(v0 + 40) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_82B88;
  sub_82D34();
  return v7();
}

uint64_t sub_82B88()
{
  if (v1) {
    return sub_251A8();
  }
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return sub_47D48(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_82BD0(uint64_t a1, char a2, char a3, char a4)
{
  *(_BYTE *)(v5 + 58) = a4;
  *(_BYTE *)(v5 + 57) = a3;
  *(_BYTE *)(v5 + 56) = a2;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v4;
  return sub_2D94C((uint64_t)sub_82BEC);
}

uint64_t sub_82BEC()
{
  char v1 = *(_BYTE *)(v0 + 58);
  char v2 = *(_BYTE *)(v0 + 57);
  char v3 = *(_BYTE *)(v0 + 56);
  uint64_t v4 = sub_26B0(&qword_D3BD0);
  uint64_t v5 = swift_allocObject(v4, 176LL, 7LL);
  *(void *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_A5A80;
  *(void *)(v5 + 32) = 0xD000000000000010LL;
  *(void *)(v5 + 40) = 0x80000000000A8110LL;
  *(_BYTE *)(v5 + 48) = v3;
  *(void *)(v5 + 72) = &type metadata for Bool;
  strcpy((char *)(v5 + 80), "hasSleepAlarm");
  *(_WORD *)(v5 + 94) = -4864;
  *(_BYTE *)(v5 + 96) = v2;
  *(void *)(v5 + 120) = &type metadata for Bool;
  *(void *)(v5 + 128) = 0x68637461577369LL;
  *(void *)(v5 + 136) = 0xE700000000000000LL;
  *(void *)(v5 + 168) = &type metadata for Bool;
  *(_BYTE *)(v5 + 144) = v1;
  uint64_t v6 = sub_82D4C((uint64_t)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  uint64_t v7 = (void *)swift_task_alloc(v6);
  *(void *)(v0 + 40) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_82B88;
  sub_82D34();
  return v8();
}

uint64_t sub_82D0C()
{
  return type metadata accessor for DeleteAlarmCATs_Async(0LL);
}

uint64_t sub_82D14()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 40);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 48) = v0;
  return swift_task_dealloc(v5);
}

  ;
}

uint64_t sub_82D4C@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t type metadata accessor for CreateAlarmCATs_Async(uint64_t a1)
{
  uint64_t result = qword_D6FF8;
  if (!qword_D6FF8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CreateAlarmCATs_Async);
  }
  return result;
}

uint64_t sub_82D98(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D84C0);
}

uint64_t sub_82DD4(uint64_t a1)
{
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_82E5C;
  return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))v5)( a1,  0xD000000000000029LL,  0x80000000000AA020LL,  _swiftEmptyArrayStorage);
}

uint64_t sub_82E5C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_82EA4()
{
  return type metadata accessor for CreateAlarmCATs_Async(0LL);
}

uint64_t sub_82EAC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7050);
  sub_26F0(v0, (uint64_t)qword_D7050);
  return static SiriTimeLog.alarmFlow.getter();
}

void *sub_82EF4(uint64_t a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v11 = type metadata accessor for HALAlarmDeviceContext(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return v4;
}

uint64_t sub_82F9C(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for HALAlarmDeviceContext(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_82FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for HALAlarmDeviceContext(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

void *sub_83054(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for HALAlarmDeviceContext(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24LL))(v7, v8, v9);
  return a1;
}

uint64_t sub_830B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for HALAlarmDeviceContext(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
  return a1;
}

uint64_t sub_83118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for HALAlarmDeviceContext(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_83188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_83194);
}

uint64_t sub_83194(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_175B8();
    return sub_16880(a1 + *(int *)(a3 + 20), a2, v8);
  }

uint64_t sub_83204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_83210);
}

uint64_t sub_83210(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_175B8();
    return sub_A40C(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

uint64_t _s10descrCD1E9O21ConfirmIntentStrategyVMa(uint64_t a1)
{
  uint64_t result = qword_D70D8;
  if (!qword_D70D8) {
    return swift_getSingletonMetadata(a1, &_s10descrCD1E9O21ConfirmIntentStrategyVMn);
  }
  return result;
}

uint64_t sub_832B0(uint64_t a1)
{
  v4[0] = "(";
  uint64_t result = type metadata accessor for HALAlarmDeviceContext(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_83324()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7068);
  sub_26F0(v0, (uint64_t)qword_D7068);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_8336C@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_26B0(&qword_D37A8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_26B0(&qword_D37D0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_D3188 != -1) {
    swift_once(&qword_D3188, sub_83324);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_26F0(v12, (uint64_t)qword_D7068);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v13, v14, v15, v16, v17, v18, v19, v20);
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)sub_1EFA4();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_0, v21, v22, "DismissAlarm.ConfirmIntentStrategy.actionForInput() called.", v23, 2u);
    sub_16AA8((uint64_t)v23);
  }

  uint64_t v24 = v3 + *(int *)(sub_84874() + 20);
  uint64_t v25 = sub_175B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16LL))(v11, v24, v25);
  sub_84834((uint64_t)v11);
  uint64_t v26 = enum case for DecideAction.PromptExpectation.confirmation(_:);
  uint64_t v27 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104LL))(v8, v26, v27);
  sub_84834((uint64_t)v8);
  sub_3082C(a1, (uint64_t)v11, 0, (uint64_t)v8, a2);
  sub_19594((uint64_t)v8, &qword_D37A8);
  return sub_19594((uint64_t)v11, &qword_D37D0);
}

uint64_t sub_8355C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_26B0((uint64_t *)&unk_D36F0);
  v3[5] = sub_19754(*(void *)(v4 - 8));
  uint64_t v5 = type metadata accessor for ConfirmationResponse(0LL);
  v3[6] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[7] = v6;
  v3[8] = sub_19754(v6);
  sub_19840();
  return sub_1988C();
}

#error "8367C: call analysis failed (funcsize=83)"
uint64_t sub_83724(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
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
  v2[7] = a1;
  _BYTE v2[8] = v1;
  uint64_t v3 = sub_26B0(&qword_D3890);
  v2[9] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = (*(void *)(*(void *)(sub_26B0(&qword_D3A08) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[10] = swift_task_alloc(v4);
  v2[11] = swift_task_alloc(v4);
  uint64_t v5 = type metadata accessor for TemplatingResult(0LL);
  v2[12] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[13] = v6;
  v2[14] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DialogPhase(0LL);
  v2[15] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[16] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[17] = v9;
  v2[18] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  v2[19] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[20] = v11;
  v2[21] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[22] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[23] = v13;
  v2[24] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[25] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[26] = v15;
  v2[27] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v2[28] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[29] = v17;
  v2[30] = swift_task_alloc((*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for NLContextUpdate(0LL);
  v2[31] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[32] = v19;
  v2[33] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  v2[34] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v2[35] = v21;
  v2[36] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_83914, 0LL, 0LL);
}

uint64_t sub_83914()
{
  uint64_t v1 = v0[29];
  (*(void (**)(void, void, void))(v0[35] + 104LL))( v0[36],  enum case for AlarmNLv4Constants.AlarmVerb.disable(_:),  v0[34]);
  sub_79B0C();
  static SiriTimeFeatureFlagsImpl.instance.getter(v2);
  Swift::Bool v3 = SiriTimeFeatureFlagsImpl.isConfirmationsResponseFrameworkEnabled()();
  sub_33420(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v3)
  {
    (*(void (**)(void, void, void))(v0[23] + 104LL))( v0[24],  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[22]);
    if (qword_D3188 != -1) {
      swift_once(&qword_D3188, sub_83324);
    }
    uint64_t v4 = v0[24];
    uint64_t v6 = v0[20];
    uint64_t v5 = v0[21];
    uint64_t v7 = v0[19];
    uint64_t v8 = sub_26F0(v7, (uint64_t)qword_D7068);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    uint64_t v9 = mach_absolute_time();
    SiriTimeMeasurement.init(_:log:startTime:)(v4, v5, v9);
    if (qword_D2FC0 != -1) {
      swift_once(&qword_D2FC0, sub_252DC);
    }
    uint64_t v10 = v0[8];
    sub_84874();
    uint64_t v11 = sub_175B8();
    char v12 = HALDeviceContext.isCommunal.getter(v11, &protocol witness table for HALAlarmDeviceContext);
    char v13 = HALDeviceContext.isCommunal.getter(v11, &protocol witness table for HALAlarmDeviceContext);
    uint64_t v14 = swift_task_alloc(32LL);
    v0[37] = v14;
    *(void *)(v14 + 16) = v10;
    uint64_t v15 = (void *)swift_task_alloc(dword_D71A4);
    v0[38] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_83C94;
    return sub_86504(v12 & 1, (v13 & 1) == 0, (uint64_t)sub_847AC, v14);
  }

  else
  {
    if (qword_D2FB8 != -1) {
      swift_once(&qword_D2FB8, sub_252C8);
    }
    sub_84874();
    uint64_t v17 = sub_175B8();
    char v18 = HALDeviceContext.isCommunal.getter(v17, &protocol witness table for HALAlarmDeviceContext);
    char v19 = HALDeviceContext.isCommunal.getter(v17, &protocol witness table for HALAlarmDeviceContext);
    uint64_t v20 = HALDeviceContext.remoteDevice.getter(v17);
    if (v20 && (v21 = (void *)v20, uint64_t v22 = DeviceUnit.name.getter(), v24 = v23, v21, v24))
    {
      String.toSpeakableString.getter(v22);
      swift_bridgeObjectRelease(v24);
      uint64_t v25 = 0LL;
    }

    else
    {
      uint64_t v25 = 1LL;
    }

    uint64_t v26 = v0[11];
    type metadata accessor for SpeakableString(0LL);
    sub_84868(v26, v25);
    uint64_t v27 = HALDeviceContext.remoteDevice.getter(v17);
    if (v27 && (uint64_t v28 = (void *)v27, v29 = DeviceUnit.roomName.getter(), v31 = v30, v28, v31))
    {
      String.toSpeakableString.getter(v29);
      swift_bridgeObjectRelease(v31);
      uint64_t v32 = 0LL;
    }

    else
    {
      uint64_t v32 = 1LL;
    }

    sub_84868(v0[10], v32);
    uint64_t v33 = (void *)swift_task_alloc(dword_D74B4);
    v0[43] = v33;
    void *v33 = v0;
    v33[1] = sub_83ECC;
    return sub_8CD38(v0[14], (v18 & 1) == 0, v19 & 1, v0[11], v0[10]);
  }

uint64_t sub_83C94(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 312) = v1;
  swift_task_dealloc();
  sub_1978C();
  if (!v1) {
    *(void *)(v4 + 320) = a1;
  }
  sub_19840();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_83D08(uint64_t a1)
{
  uint64_t v2 = v1[33];
  uint64_t v3 = v1[15];
  static DialogPhase.confirmation.getter(a1);
  uint64_t v4 = swift_task_alloc(32LL);
  *(void *)(v4 + 16) = v2;
  OutputGenerationManifest.init(dialogPhase:_:)(v3, sub_78158, v4);
  sub_1978C();
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generatePatternOutput(manifest:measure:)[1]);
  v1[41] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_83DAC;
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v1[7], v1[18], v1[27]);
}

uint64_t sub_83DAC()
{
  uint64_t v3 = (void *)v2[40];
  uint64_t v5 = v2[17];
  uint64_t v4 = v2[18];
  uint64_t v6 = v2[16];
  *uint64_t v7 = *v1;
  v2[42] = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);

  sub_19840();
  return sub_3848C(v8, v9, v10);
}

uint64_t sub_83E20()
{
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 256);
  sub_84824();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_33420(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_847F8();
  uint64_t v26 = v6;
  uint64_t v28 = v5;
  swift_task_dealloc();
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  uint64_t v7 = sub_1987C();
  uint64_t v15 = sub_19978(v7, v8, v9, v10, v11, v12, v13, v14, v24, v26);
  sub_19964(v15, v16, v17, v18, v19, v20, v21, v22, v25, v27, v28);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_83ECC()
{
  uint64_t v3 = (*v1)[10];
  uint64_t v2 = (*v1)[11];
  uint64_t v4 = *v1;
  v4[44] = v0;
  swift_task_dealloc();
  sub_19594(v3, &qword_D3A08);
  sub_19594(v2, &qword_D3A08);
  if (v0)
  {
    sub_19840();
    return sub_3848C(v5, v6, v7);
  }

  else
  {
    uint64_t v9 = (uint64_t **)swift_task_alloc(dword_D5D84);
    v4[45] = (uint64_t)v9;
    *uint64_t v9 = v4;
    v9[1] = (uint64_t *)sub_83F84;
    return sub_52CD0(v4[36]);
  }

uint64_t sub_83F84(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 368) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v4 + 376) = a1;
  }
  sub_19840();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_83FF4()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v17 = *(void *)(v0 + 272);
  uint64_t v18 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v12 = *(void *)(v0 + 112);
  uint64_t v13 = *(void *)(v0 + 376);
  uint64_t v14 = *(void *)(v0 + 104);
  uint64_t v15 = *(void *)(v0 + 96);
  uint64_t v16 = *(void *)(v0 + 280);
  uint64_t v4 = *(void **)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void **)(v0 + 56);
  uint64_t v8 = v4[3];
  uint64_t v7 = v4[4];
  sub_80B4(v4, v8);
  char v9 = dispatch thunk of DeviceState.isTextToSpeechEnabled.getter(v8, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  sub_A40C(v5, 0LL, 1LL, v2);
  uint64_t v10 = type metadata accessor for AceOutput(0LL);
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0LL;
  *(_OWORD *)(v0 + 16) = 0u;
  v6[3] = v10;
  v6[4] = &protocol witness table for AceOutput;
  sub_19558(v6);
  static AceOutputHelper.makeConfirmationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)( v12,  v4,  v9 & 1,  v13,  1LL,  1LL,  v5,  _swiftEmptyArrayStorage,  v0 + 16);
  swift_bridgeObjectRelease(v13);
  sub_19594(v0 + 16, &qword_D3898);
  sub_19594(v5, &qword_D3890);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v15);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_847F8();
  swift_task_dealloc();
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  sub_1987C();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

#error "84218: call analysis failed (funcsize=28)"
#error "842B4: call analysis failed (funcsize=38)"
#error "84350: call analysis failed (funcsize=40)"
#error "843CC: call analysis failed (funcsize=31)"
uint64_t sub_843E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v2 = sub_26B0(&qword_D3A08);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - v6;
  _s10descrCD1E9O21ConfirmIntentStrategyVMa(0LL);
  uint64_t v8 = type metadata accessor for HALAlarmDeviceContext(0LL);
  char v9 = HALDeviceContext.remoteDevice.getter(v8);
  if (v9 && (uint64_t v10 = (void *)v9, v11 = DeviceUnit.name.getter(), v13 = v12, v10, v13))
  {
    String.toSpeakableString.getter(v11);
    swift_bridgeObjectRelease(v13);
    uint64_t v14 = type metadata accessor for SpeakableString(0LL);
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v14 = type metadata accessor for SpeakableString(0LL);
    uint64_t v15 = 1LL;
  }

  uint64_t v16 = 1LL;
  sub_A40C((uint64_t)v7, v15, 1LL, v14);
  sub_1B4F0((uint64_t)v7, a1);
  uint64_t v17 = HALDeviceContext.remoteDevice.getter(v8);
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = DeviceUnit.roomName.getter();
    uint64_t v21 = v20;

    if (v21)
    {
      String.toSpeakableString.getter(v19);
      swift_bridgeObjectRelease(v21);
      uint64_t v16 = 0LL;
    }
  }

  uint64_t v22 = type metadata accessor for SpeakableString(0LL);
  sub_A40C((uint64_t)v5, v16, 1LL, v22);
  uint64_t v23 = type metadata accessor for StopConfirmationParameters(0LL);
  return sub_1B4F0((uint64_t)v5, a1 + *(int *)(v23 + 28));
}

uint64_t sub_845A0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D7154);
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_84600;
  return sub_83724(a1);
}

uint64_t sub_84600()
{
  uint64_t v2 = *v1;
  *uint64_t v3 = v2;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    return sub_1B5EC(*(uint64_t (**)(void))(v2 + 8));
  }
  sub_19840();
  return sub_1988C();
}

uint64_t sub_84650()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v1;
  sub_26B0(&qword_D4890);
  uint64_t v2 = static BarbaraWalters.logAndReturnError<A>(context:_:)(0xD000000000000067LL, 0x80000000000AA050LL, v0 + 24);
  swift_willThrow(v2, v3, v4, v5, v6, v7, v8, v9);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_846E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_D715C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_34358;
  return sub_8355C(a1, a2, a3);
}

uint64_t sub_8474C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D714C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_34358;
  return sub_845A0(a1);
}

uint64_t sub_847AC(uint64_t a1)
{
  return sub_843E8(a1);
}

uint64_t sub_847B4()
{
  return (*(uint64_t (**)(void, void))(v1 + 8))(*(void *)(v0 + 264), *(void *)(v0 + 248));
}

uint64_t sub_847F8()
{
  return *(void *)(v0 + 288);
}

uint64_t sub_84824()
{
  return (*(uint64_t (**)(void, void))(v0[26] + 8LL))(v0[27], v0[25]);
}

uint64_t sub_84834(uint64_t a1)
{
  return sub_A40C(a1, 0LL, 1LL, v1);
}

  ;
}

uint64_t sub_8485C()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_84868(uint64_t a1, uint64_t a2)
{
  return sub_A40C(a1, a2, 1LL, v2);
}

uint64_t sub_84874()
{
  return _s10descrCD1E9O21ConfirmIntentStrategyVMa(0LL);
}

uint64_t sub_8487C(uint64_t a1)
{
  id v2 = sub_66DE4(a1, "period");
  uint64_t v5 = _swiftEmptyArrayStorage;
  switch((unint64_t)v2)
  {
    case 1uLL:
      sub_84ED8((uint64_t)v2, v3, v4, (uint64_t)_swiftEmptyArrayStorage);
      sub_84EE8();
      if (v7)
      {
        sub_84EB4(v6);
        uint64_t v5 = v62;
      }

      sub_84F04();
      unsigned int v9 = 1852993389;
      goto LABEL_8;
    case 2uLL:
      sub_84ED8((uint64_t)v2, v3, v4, (uint64_t)_swiftEmptyArrayStorage);
      sub_84EE8();
      if (v7)
      {
        sub_84EB4(v13);
        uint64_t v5 = v64;
      }

      sub_84F04();
      *(void *)(v14 + 32) = 0x6F6F6E7265746661LL;
      uint64_t v11 = v14 + 32;
      unint64_t v12 = 0xE90000000000006ELL;
      goto LABEL_15;
    case 3uLL:
      sub_84ED8((uint64_t)v2, v3, v4, (uint64_t)_swiftEmptyArrayStorage);
      sub_84EE8();
      if (v7)
      {
        sub_84EB4(v10);
        uint64_t v5 = v63;
      }

      sub_84F04();
      unsigned int v9 = 1852143205;
LABEL_8:
      *(void *)(v8 + 32) = v9 | 0x676E6900000000LL;
      uint64_t v11 = v8 + 32;
      unint64_t v12 = 0xE700000000000000LL;
      goto LABEL_15;
    case 8uLL:
      sub_84ED8((uint64_t)v2, v3, v4, (uint64_t)_swiftEmptyArrayStorage);
      sub_84EE8();
      if (v7)
      {
        sub_84EB4(v15);
        uint64_t v5 = v65;
      }

      sub_84F04();
      *(void *)(v16 + 32) = 0x776F72726F6D6F74LL;
      uint64_t v11 = v16 + 32;
      unint64_t v12 = 0xE800000000000000LL;
LABEL_15:
      *(void *)(v11 + 8) = v12;
      break;
    default:
      break;
  }

  sub_1B6E0();
  uint64_t v18 = v17;
  swift_release(v17);
  if (v18)
  {
    if ((sub_84EFC() & 1) == 0)
    {
      sub_84ECC(0, v5[2] + 1LL);
      uint64_t v5 = v50;
    }

    unint64_t v20 = v5[2];
    unint64_t v19 = v5[3];
    if (v20 >= v19 >> 1)
    {
      sub_84EB4(v19);
      uint64_t v5 = v51;
    }

    v5[2] = v20 + 1;
    uint64_t v21 = &v5[2 * v20];
    v21[4] = 0xD000000000000011LL;
    v21[5] = 0x80000000000A81F0LL;
  }

  sub_84E54(v1);
  uint64_t v23 = v22;
  uint64_t v24 = swift_bridgeObjectRelease(v22);
  if (v23)
  {
    uint64_t v24 = sub_84EFC();
    if ((v24 & 1) == 0)
    {
      sub_84ECC(0, v5[2] + 1LL);
      uint64_t v5 = (void *)v24;
    }

    unint64_t v26 = v5[2];
    unint64_t v25 = v5[3];
    if (v26 >= v25 >> 1)
    {
      sub_84EB4(v25);
      uint64_t v5 = (void *)v24;
    }

    v5[2] = v26 + 1;
    uint64_t v27 = &v5[2 * v26];
    v27[4] = 0xD000000000000012LL;
    v27[5] = 0x80000000000A81D0LL;
  }

  uint64_t v28 = (char *)sub_66DE4(v24, "alarmReferenceType");
  if ((unint64_t)v28 < 2)
  {
LABEL_42:
    sub_1D584();
    if ((v35 & 1) != 0)
    {
      if ((sub_84EFC() & 1) == 0)
      {
        sub_84ECC(0, v5[2] + 1LL);
        uint64_t v5 = v52;
      }

      sub_84F10();
      if (v7)
      {
        sub_84EB4(v36);
        uint64_t v5 = v53;
      }

      sub_84F04();
      *(void *)(v37 + 32) = 0x7065656C73LL;
      *(void *)(v37 + 40) = 0xE500000000000000LL;
    }

    uint64_t v38 = (char *)sub_66DE4(v35, "alarmSearchStatus");
    if (v38 == (_BYTE *)&dword_0 + 2)
    {
      if ((sub_84EFC() & 1) == 0)
      {
        sub_84ECC(0, v5[2] + 1LL);
        uint64_t v5 = v56;
      }

      unint64_t v45 = v5[2];
      unint64_t v44 = v5[3];
      if (v45 >= v44 >> 1)
      {
        sub_84ECC(v44 > 1, v45 + 1);
        uint64_t v5 = v57;
      }

      v5[2] = v45 + 1;
      uint64_t v46 = &v5[2 * v45];
      v46[4] = 0x64656C6261736964LL;
      uint64_t v42 = v46 + 4;
      unint64_t v43 = 0xE800000000000000LL;
    }

    else
    {
      if (v38 != (_BYTE *)&dword_0 + 1)
      {
LABEL_61:
        uint64_t v47 = swift_bridgeObjectRetain(v5);
        uint64_t v48 = sub_84D0C(v47);
        swift_bridgeObjectRelease_n(v5, 2LL);
        return (uint64_t)v48;
      }

      if ((sub_84EFC() & 1) == 0)
      {
        sub_84ECC(0, v5[2] + 1LL);
        uint64_t v5 = v54;
      }

      unint64_t v40 = v5[2];
      unint64_t v39 = v5[3];
      if (v40 >= v39 >> 1)
      {
        sub_84ECC(v39 > 1, v40 + 1);
        uint64_t v5 = v55;
      }

      v5[2] = v40 + 1;
      uint64_t v41 = &v5[2 * v40];
      v41[4] = 0x64656C62616E65LL;
      uint64_t v42 = v41 + 4;
      unint64_t v43 = 0xE700000000000000LL;
    }

    v42[1] = v43;
    goto LABEL_61;
  }

  if (v28 == (_BYTE *)&dword_0 + 3)
  {
    if ((sub_84EFC() & 1) == 0)
    {
      sub_84ECC(0, v5[2] + 1LL);
      uint64_t v5 = v58;
    }

    sub_84F10();
    if (v7)
    {
      sub_84EB4(v29);
      uint64_t v5 = v59;
    }

    sub_84F04();
    *(void *)(v30 + 32) = 7105633LL;
    uint64_t v31 = v30 + 32;
    unint64_t v32 = 0xE300000000000000LL;
LABEL_41:
    *(void *)(v31 + 8) = v32;
    goto LABEL_42;
  }

  if (v28 == (_BYTE *)&dword_0 + 2)
  {
    if ((sub_84EFC() & 1) == 0)
    {
      sub_84ECC(0, v5[2] + 1LL);
      uint64_t v5 = v60;
    }

    sub_84F10();
    if (v7)
    {
      sub_84EB4(v33);
      uint64_t v5 = v61;
    }

    sub_84F04();
    *(void *)(v34 + 32) = 1954047342LL;
    uint64_t v31 = v34 + 32;
    unint64_t v32 = 0xE400000000000000LL;
    goto LABEL_41;
  }

  uint64_t v66 = v28;
  uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)( &type metadata for AlarmReferenceType,  &v66,  &type metadata for AlarmReferenceType,  &type metadata for Int);
  __break(1u);
  return result;
}

void *sub_84D0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpeakableString(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v6 = *(void *)(a1 + 16);
  char v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    unint64_t v15 = _swiftEmptyArrayStorage;
    sub_7B9D0(0LL, v6, 0);
    char v7 = v15;
    uint64_t v8 = (void *)(a1 + 40);
    do
    {
      uint64_t v9 = *(v8 - 1);
      uint64_t v10 = *v8;
      swift_bridgeObjectRetain(*v8);
      String.toSpeakableString.getter(v9);
      swift_bridgeObjectRelease(v10);
      unint64_t v15 = v7;
      unint64_t v12 = v7[2];
      unint64_t v11 = v7[3];
      if (v12 >= v11 >> 1)
      {
        sub_7B9D0(v11 > 1, v12 + 1, 1);
        char v7 = v15;
      }

      v8 += 2;
      v7[2] = v12 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))( (unint64_t)v7 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
      + *(void *)(v3 + 72) * v12,
        v5,
        v2);
      --v6;
    }

    while (v6);
  }

  return v7;
}

uint64_t sub_84E54(void *a1)
{
  id v1 = [a1 label];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

void sub_84EB4(unint64_t a1@<X8>)
{
}

void sub_84ECC(char a1, uint64_t a2)
{
}

void sub_84ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

  ;
}

uint64_t sub_84EFC()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

void sub_84F04()
{
  *(void *)(v0 + 16) = v1;
}

  ;
}

uint64_t sub_84F20(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0LL;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1LL;
  }
  if (v2 == 1) {
    return 0LL;
  }
  for (uint64_t i = 5LL; ; ++i)
  {
    uint64_t v5 = i - 3;
    if (__OFADD__(i - 4, 1LL)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v3 = v6;
    BOOL v6 = v6 || v5 == v2;
    if (v6) {
      return v3;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_84F80(uint64_t a1)
{
  uint64_t v57 = a1;
  sub_26B0(&qword_D7178);
  sub_16AFC();
  __chkstk_darwin(v2);
  sub_16B30();
  uint64_t v58 = v3;
  uint64_t v4 = sub_1D768();
  uint64_t v5 = type metadata accessor for Locale(v4);
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  sub_16AFC();
  __chkstk_darwin(v6);
  sub_16B30();
  uint64_t v54 = v7;
  uint64_t v8 = sub_1D768();
  uint64_t v9 = type metadata accessor for Calendar(v8);
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  sub_16AFC();
  __chkstk_darwin(v10);
  uint64_t v12 = sub_85FBC(v11, v47);
  uint64_t v13 = type metadata accessor for DateTime.DateTimeRange.DefinedDateTimeRange(v12);
  uint64_t v59 = *(void *)(v13 - 8);
  sub_16AFC();
  __chkstk_darwin(v14);
  sub_16B30();
  uint64_t v16 = v15;
  uint64_t v17 = sub_1D768();
  uint64_t v18 = type metadata accessor for DefinedDateTimeRangeStore(v17);
  uint64_t v49 = *(void *)(v18 - 8);
  uint64_t v50 = v18;
  sub_16AFC();
  __chkstk_darwin(v19);
  sub_7556C();
  uint64_t v20 = sub_16C80();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v22 = sub_85FDC();
  uint64_t v23 = type metadata accessor for SiriTimeMeasurement.LogDescription(v22);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  unint64_t v26 = (char *)&v47 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for SiriTimeMeasurement(0LL);
  uint64_t v47 = *(void *)(v27 - 8);
  uint64_t v48 = v27;
  sub_16AFC();
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)&v47 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))( v26,  enum case for SiriTimeMeasurement.LogDescription.siriInferenceWitchingHour(_:),  v23);
  if (qword_D3190 != -1) {
    swift_once(&qword_D3190, sub_85310);
  }
  uint64_t v31 = sub_26F0(v20, (uint64_t)qword_D7160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v1, v31, v20);
  uint64_t v32 = mach_absolute_time();
  uint64_t v33 = SiriTimeMeasurement.init(_:log:startTime:)(v26, v1, v32);
  DefinedDateTimeRangeStore.init()(v33);
  uint64_t v34 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v59 + 104))( v16,  enum case for DateTime.DateTimeRange.DefinedDateTimeRange.witchingHours(_:),  v13);
  uint64_t v35 = v51;
  static Calendar.current.getter(v34);
  uint64_t v36 = type metadata accessor for ApplicationContext(0LL);
  uint64_t v37 = static ApplicationContext.shared.getter(v36);
  ApplicationContext.deviceState.getter(v60);
  swift_release(v37);
  uint64_t v38 = v61;
  uint64_t v39 = v62;
  sub_80B4(v60, v61);
  uint64_t v40 = v54;
  dispatch thunk of DeviceState.siriLocale.getter(v38, v39);
  uint64_t v41 = type metadata accessor for DateTimeResolutionContext.Hemisphere(0LL);
  uint64_t v42 = v58;
  sub_A40C(v58, 1LL, 1LL, v41);
  uint64_t v43 = type metadata accessor for DateTime(0LL);
  sub_16A6C( &qword_D7180,  (uint64_t (*)(uint64_t))&type metadata accessor for DateTime.DateTimeRange.DefinedDateTimeRange,  (uint64_t)&protocol conformance descriptor for DateTime.DateTimeRange.DefinedDateTimeRange);
  uint64_t v45 = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, v13, v43, v44);
  LOBYTE(v39) = DefinedDateTimeRangeStore.isDateInDefinedDateTimeRange(_:dateTimeRange:calendar:locale:hemisphere:overrides:)( v57,  v16,  v35,  v40,  v42,  v45);
  swift_bridgeObjectRelease(v45);
  sub_7EC4(v42, &qword_D7178);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v40, v56);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v35, v53);
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v16, v13);
  _s20HandleIntentStrategyVwxx_1(v60);
  SiriTimeMeasurement.logDelta()();
  sub_86014(v49);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v48);
  return v39 & 1;
}

uint64_t sub_85310()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7160);
  sub_26F0(v0, (uint64_t)qword_D7160);
  return static SiriTimeLog.alarmFlow.getter();
}

unint64_t sub_85358(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v102 = a5;
  uint64_t v111 = a4;
  uint64_t v112 = a2;
  uint64_t v110 = a1;
  uint64_t v6 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v99 = *(void *)(v6 - 8);
  uint64_t v100 = v6;
  __chkstk_darwin(v6);
  uint64_t v98 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Calendar.SearchDirection(0LL);
  uint64_t v108 = *(void *)(v8 - 8);
  uint64_t v109 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Calendar.RepeatedTimePolicy(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for Calendar.MatchingPolicy(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v106 = v15;
  uint64_t v107 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_26B0(&qword_D3820);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for Date(0LL);
  uint64_t v105 = *(void *)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v103 = (char *)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  uint64_t v104 = (char *)&v97 - v25;
  (*(void (**)(char *, void, uint64_t))(v16 + 104))( v18,  enum case for Calendar.MatchingPolicy.nextTime(_:),  v15);
  unint64_t v26 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  uint64_t v27 = v12;
  uint64_t v28 = v11;
  v26(v14, enum case for Calendar.RepeatedTimePolicy.first(_:), v11);
  uint64_t v29 = v108;
  uint64_t v30 = v109;
  (*(void (**)(char *, void, uint64_t))(v108 + 104))( v10,  enum case for Calendar.SearchDirection.forward(_:),  v109);
  uint64_t v101 = a3;
  Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)( a3,  v111,  0LL,  v112,  v18,  v14,  v10);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v28);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v18, v106);
  if (sub_16880((uint64_t)v21, 1LL, v22) == 1)
  {
    uint64_t v31 = v105;
    sub_7EC4((uint64_t)v21, &qword_D3820);
    if (qword_D3190 != -1) {
      swift_once(&qword_D3190, sub_85310);
    }
    uint64_t v32 = type metadata accessor for Logger(0LL);
    sub_26F0(v32, (uint64_t)qword_D7160);
    uint64_t v33 = v31;
    uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 16);
    uint64_t v35 = v103;
    uint64_t v36 = v34(v103, v112, v22);
    uint64_t v44 = (os_log_s *)Logger.logObject.getter(v36, v37, v38, v39, v40, v41, v42, v43);
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc(32LL, -1LL);
      uint64_t v47 = swift_slowAlloc(32LL, -1LL);
      uint64_t v114 = v47;
      *(_DWORD *)uint64_t v46 = 134218498;
      uint64_t v117 = v101;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118, v46 + 4, v46 + 12);
      *(_WORD *)(v46 + 12) = 2048;
      uint64_t v117 = v111;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118, v46 + 14, v46 + 22);
      *(_WORD *)(v46 + 22) = 2080;
      sub_16A6C( &qword_D3830,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
      uint64_t v49 = dispatch thunk of CustomStringConvertible.description.getter(v22, v48);
      unint64_t v51 = v50;
      uint64_t v117 = (void *)sub_3D10(v49, v50, &v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118, v46 + 24, v46 + 32);
      swift_bridgeObjectRelease(v51);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v22);
      _os_log_impl( &dword_0,  v44,  v45,  "Unable to get date using hour=%ld, minute=%ld from now of %s",  (uint8_t *)v46,  0x20u);
      swift_arrayDestroy(v47, 1LL);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v46, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v22);
    }

    return 0LL;
  }

  uint64_t v52 = v104;
  uint64_t v53 = v105;
  (*(void (**)(char *, char *, uint64_t))(v105 + 32))(v104, v21, v22);
  uint64_t v54 = v112;
  uint64_t v55 = v102;
  if (!v102) {
    goto LABEL_41;
  }
  if (!((unint64_t)v102 >> 62))
  {
LABEL_41:
    sub_16A6C( &qword_D7188,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    int v96 = dispatch thunk of static Comparable.< infix(_:_:)(v54, v52, v22, v95);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v22);
    return ~v96 & 1LL;
  }

  if (v102 >= 0) {
    uint64_t v93 = v102 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v93 = v102;
  }
  swift_bridgeObjectRetain(v102);
  uint64_t v94 = _CocoaArrayWrapper.endIndex.getter(v93);
  swift_bridgeObjectRelease(v55);
  if (!v94) {
    goto LABEL_41;
  }
LABEL_9:
  uint64_t v57 = v99;
  uint64_t v56 = v100;
  uint64_t v58 = v98;
  (*(void (**)(char *, void, uint64_t))(v99 + 104))(v98, enum case for Calendar.Component.weekday(_:), v100);
  uint64_t v59 = Calendar.component(_:from:)(v58, v54);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v56);
  uint64_t v60 = v59 - 1;
  if (v59 == 1)
  {
    uint64_t v60 = 7LL;
  }

  else if (__OFSUB__(v59, 1LL))
  {
    __break(1u);
    goto LABEL_43;
  }

  uint64_t v117 = &_swiftEmptyArrayStorage;
  sub_85CD4(v55, (uint64_t *)&v117);
  uint64_t v62 = (uint64_t)v117;
  sub_16A6C( &qword_D7188,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v64 = v63;
  swift_bridgeObjectRetain(v62);
  if ((dispatch thunk of static Comparable.< infix(_:_:)(v54, v52, v22, v64) & 1) != 0)
  {
    char v65 = sub_84F20(v60, v62);
    swift_bridgeObjectRelease(v62);
    char v66 = v65 ^ 1;
  }

  else
  {
    swift_bridgeObjectRelease(v62);
    char v66 = 1;
  }

  unint64_t result = sub_85DDC(v60, (uint64_t *)&v117);
  if (result == -1LL)
  {
LABEL_27:
    if (qword_D3190 == -1)
    {
LABEL_28:
      uint64_t v73 = type metadata accessor for Logger(0LL);
      uint64_t v74 = sub_26F0(v73, (uint64_t)qword_D7160);
      uint64_t v82 = (os_log_s *)Logger.logObject.getter(v74, v75, v76, v77, v78, v79, v80, v81);
      os_log_type_t v83 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v82, v83))
      {
        uint64_t v84 = swift_slowAlloc(22LL, -1LL);
        uint64_t v85 = swift_slowAlloc(32LL, -1LL);
        uint64_t v116 = v85;
        *(_DWORD *)uint64_t v84 = 134218242;
        uint64_t v114 = v60;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v114, &v115, v84 + 4, v84 + 12);
        *(_WORD *)(v84 + 12) = 2080;
        swift_beginAccess(&v117, &v114, 0LL, 0LL);
        uint64_t v86 = v117;
        uint64_t v87 = swift_bridgeObjectRetain(v117);
        uint64_t v88 = Array.description.getter(v87, &type metadata for Int);
        unint64_t v90 = v89;
        swift_bridgeObjectRelease(v86);
        uint64_t v113 = sub_3D10(v88, v90, &v116);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v113, &v114, v84 + 14, v84 + 22);
        swift_bridgeObjectRelease(v90);
        _os_log_impl( &dword_0,  v82,  v83,  "insert postion should NOT be -1, nowWeekday:%ld, optionsInInt:%s",  (uint8_t *)v84,  0x16u);
        swift_arrayDestroy(v85, 1LL);
        swift_slowDealloc(v85, -1LL, -1LL);
        swift_slowDealloc(v84, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v53 + 8))(v104, v22);
      }

      else
      {

        (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v22);
      }

      swift_bridgeObjectRelease(v117);
      return 0LL;
    }

LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
    }

    __break(1u);
    goto LABEL_46;
  }

  if ((result & 0x8000000000000000LL) != 0)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }

  if (result >= *((void *)v117 + 2))
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }

  uint64_t v91 = *((void *)v117 + result + 4);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v22);
  unint64_t result = swift_bridgeObjectRelease(v117);
  uint64_t v92 = v91 - v60;
  if (!__OFSUB__(v91, v60))
  {
    BOOL v71 = __OFADD__(v92, 7LL);
    uint64_t v72 = v92 + 7;
    if (!v71) {
      return v72 % 7;
    }
    goto LABEL_51;
  }

void sub_85C34(id *a1, uint64_t *a2)
{
  uint64_t v3 = (char *)[*a1 repeatSchedule];
  if ((unint64_t)v3 >= 7)
  {
    uint64_t v7 = v3;
    _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)( &type metadata for RepeatSchedule,  &v7,  &type metadata for RepeatSchedule,  &type metadata for Int);
    __break(1u);
  }

  else
  {
    uint64_t v4 = v3 + 1;
    sub_85E80();
    uint64_t v5 = *(void *)(*a2 + 16);
    sub_43C74(v5);
    uint64_t v6 = *a2;
    *(void *)(v6 + 16) = v5 + 1;
    *(void *)(v6 + 8 * v5 + 32) = v4;
    *a2 = v6;
  }

void sub_85CD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v11))
  {
    uint64_t v7 = 4LL;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1LL)) {
        break;
      }
      id v12 = v8;
      sub_85C34(&v12, a2);
      if (v3)
      {
        swift_bridgeObjectRelease(a1);

        return;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_10;
      }
    }

    __break(1u);
LABEL_13:
    if (a1 < 0) {
      uint64_t v11 = a1;
    }
    else {
      uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

uint64_t sub_85DDC(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 + 16);
  if (!v3)
  {
LABEL_7:
    sub_85EC8(*(void *)(*a2 + 16), *(void *)(*a2 + 16), result);
    return v3;
  }

  uint64_t v4 = *(void *)(v2 + 32);
  if (v4 < result)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = v2 + 40;
    while (v3 - 1 != v5)
    {
      uint64_t v4 = *(void *)(v6 + 8 * v5++);
      if (v4 >= result) {
        goto LABEL_9;
      }
    }

    goto LABEL_7;
  }

  uint64_t v5 = 0LL;
LABEL_9:
  if (v5 < v3)
  {
    if (v4 != result) {
      sub_85EC8(v5, v5, result);
    }
    return v5;
  }

  __break(1u);
  return result;
}

void sub_85E80()
{
  uint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v0);
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_6C8F0(0, *(void *)(v1 + 16) + 1LL, 1, v1);
    *uint64_t v0 = v3;
  }

void sub_85EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1LL, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  if (!isUniquelyReferenced_nonNull_native || v10 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v10) {
      uint64_t v13 = v6 + v9;
    }
    else {
      uint64_t v13 = v6;
    }
    sub_6C8F0(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    uint64_t v5 = v14;
  }

  uint64_t v15 = v5 + 32 + 8 * a1;
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v16 = *(void *)(v5 + 16);
  if (__OFSUB__(v16, a2)) {
    goto LABEL_22;
  }
  sub_6CEF4((char *)(v5 + 32 + 8 * a2), v16 - a2, (char *)(v15 + 8));
  uint64_t v17 = *(void *)(v5 + 16);
  BOOL v18 = __OFADD__(v17, v9);
  uint64_t v19 = v17 + v9;
  if (!v18)
  {
    *(void *)(v5 + 16) = v19;
LABEL_16:
    *(void *)uint64_t v15 = a3;
    *uint64_t v3 = v5;
    return;
  }

uint64_t sub_85FBC@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return 0LL;
}

uint64_t sub_85FDC()
{
  return 0LL;
}

uint64_t sub_85FF8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_86008(uint64_t a1)
{
  return sub_16880(a1, 1LL, v1);
}

uint64_t sub_86014@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t type metadata accessor for StopCATPatternsExecutor(uint64_t a1)
{
  return sub_8A38(a1, (uint64_t *)&unk_D7190, (uint64_t)&nominal type descriptor for StopCATPatternsExecutor);
}

uint64_t sub_86034(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D84D0);
}

uint64_t sub_86070()
{
  uint64_t v2 = v1;
  sub_26B0(&qword_D3A08);
  sub_215E4();
  __chkstk_darwin(v3);
  sub_4DA84();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v20 - v5;
  uint64_t v7 = sub_26B0(&qword_D3BD0);
  uint64_t v8 = swift_allocObject(v7, 224LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_A4A50;
  uint64_t v9 = (void *)(v8 + 48);
  sub_87EAC();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = 0xEA0000000000656DLL;
  sub_3F88(v2, (uint64_t)v6, &qword_D3A08);
  uint64_t v12 = sub_1EC14();
  if (sub_16880((uint64_t)v6, 1LL, v12) == 1)
  {
    sub_202D8((uint64_t)v6, &qword_D3A08);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }

  else
  {
    *(void *)(v8 + 72) = v12;
    uint64_t v13 = sub_19558(v9);
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v13, v6, v12);
  }

  *(void *)(v8 + 80) = 0x6E756D6D6F437369LL;
  *(void *)(v8 + 88) = 0xEA00000000006C61LL;
  uint64_t v14 = type metadata accessor for StopConfirmationParameters(0LL);
  *(_BYTE *)(v8 + 96) = *(_BYTE *)(v2 + *(int *)(v14 + 20));
  *(void *)(v8 + 120) = &type metadata for Bool;
  *(void *)(v8 + 128) = 0x6E6F737265507369LL;
  *(void *)(v8 + 136) = 0xEA00000000006C61LL;
  *(_BYTE *)(v8 + 144) = *(_BYTE *)(v2 + *(int *)(v14 + 24));
  sub_4DB10();
  *(void *)(v8 + 168) = v16;
  *(void *)(v8 + 176) = v15;
  *(void *)(v8 + 184) = 0xE800000000000000LL;
  sub_3F88(v2 + *(int *)(v17 + 28), v0, &qword_D3A08);
  if (sub_16880(v0, 1LL, v12) == 1)
  {
    sub_202D8(v0, &qword_D3A08);
    *(_OWORD *)(v8 + 192) = 0u;
    *(_OWORD *)(v8 + 208) = 0u;
  }

  else
  {
    *(void *)(v8 + 216) = v12;
    BOOL v18 = sub_19558((void *)(v8 + 192));
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(v18, v0, v12);
  }

  return v8;
}

void sub_86268()
{
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v23 - v5;
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - v7;
  uint64_t v9 = sub_26B0(&qword_D3BD0);
  uint64_t v10 = swift_allocObject(v9, 272LL, 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_A4730;
  *(void *)(v10 + 32) = 0x6D72616C61LL;
  *(void *)(v10 + 40) = 0xE500000000000000LL;
  uint64_t v11 = *v1;
  if (*v1)
  {
    type metadata accessor for AlarmAlarm(0LL);
    uint64_t v12 = v11;
  }

  else
  {
    uint64_t v12 = 0LL;
    *(void *)(v10 + 56) = 0LL;
    *(void *)(v10 + 64) = 0LL;
  }

  *(void *)(v10 + 48) = v12;
  sub_87EAC();
  *(void *)(v10 + 72) = v13;
  *(void *)(v10 + 80) = v14;
  *(void *)(v10 + 88) = 0xEA0000000000656DLL;
  uint64_t v15 = (int *)type metadata accessor for StopIntentHandledElsewhereParameters(0LL);
  sub_3F88((uint64_t)v1 + v15[5], (uint64_t)v8, &qword_D3A08);
  uint64_t v16 = sub_1EC14();
  sub_4DA3C((uint64_t)v8);
  if (v17)
  {
    swift_retain(v11);
    sub_202D8((uint64_t)v8, &qword_D3A08);
    *(_OWORD *)(v10 + 96) = 0u;
    *(_OWORD *)(v10 + 112) = 0u;
  }

  else
  {
    *(void *)(v10 + 120) = v16;
    BOOL v18 = sub_19558((void *)(v10 + 96));
    sub_17620( (uint64_t)v18,  (uint64_t)v8,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL));
    swift_retain(v11);
  }

  *(void *)(v10 + 128) = 0x7954676F6C616964LL;
  *(void *)(v10 + 136) = 0xEA00000000006570LL;
  sub_3F88((uint64_t)v1 + v15[6], (uint64_t)v6, &qword_D3A08);
  sub_4DA3C((uint64_t)v6);
  if (v17)
  {
    sub_202D8((uint64_t)v6, &qword_D3A08);
    *(_OWORD *)(v10 + 144) = 0u;
    *(_OWORD *)(v10 + 160) = 0u;
  }

  else
  {
    *(void *)(v10 + 168) = v16;
    uint64_t v19 = sub_19558((void *)(v10 + 144));
    sub_17620( (uint64_t)v19,  (uint64_t)v6,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL));
  }

  *(void *)(v10 + 176) = 0x537373696D736964LL;
  *(void *)(v10 + 184) = 0xEF796C746E656C69LL;
  *(_BYTE *)(v10 + 192) = *((_BYTE *)v1 + v15[7]);
  sub_4DB10();
  *(void *)(v10 + 216) = v21;
  *(void *)(v10 + 224) = v20;
  *(void *)(v10 + 232) = 0xE800000000000000LL;
  sub_3F88((uint64_t)v1 + v15[8], v0, &qword_D3A08);
  sub_4DA3C(v0);
  if (v17)
  {
    sub_202D8(v0, &qword_D3A08);
    *(_OWORD *)(v10 + 240) = 0u;
    *(_OWORD *)(v10 + 256) = 0u;
  }

  else
  {
    *(void *)(v10 + 264) = v16;
    uint64_t v22 = sub_19558((void *)(v10 + 240));
    sub_17620((uint64_t)v22, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL));
  }

  sub_16CB0();
}

uint64_t sub_86504(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 16) = a3;
  *(_BYTE *)(v5 + 89) = a2;
  *(_BYTE *)(v5 + 88) = a1;
  uint64_t v6 = type metadata accessor for StopConfirmationParameters(0LL);
  *(void *)(v5 + 48) = sub_4DA6C(v6);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8654C()
{
  uint64_t v2 = *(int **)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void (**)(uint64_t))(v0 + 16);
  char v4 = *(_BYTE *)(v0 + 89);
  char v5 = *(_BYTE *)(v0 + 88);
  sub_1EC14();
  sub_87E9C(v1);
  sub_87E9C(v1 + v2[7]);
  *(_BYTE *)(v1 + v2[5]) = v5;
  *(_BYTE *)(v1 + v2[6]) = v4;
  v3(v1);
  uint64_t v6 = sub_86070();
  *(void *)(v0 + 56) = v6;
  uint64_t v7 = (void *)sub_47CC8((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 64) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_8660C;
  return sub_87E84(0xD000000000000011LL, 0x80000000000AA110LL, v6, v9);
}

uint64_t sub_8660C()
{
  if (!v1) {
    *(void *)(v3 + 80) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_86658(uint64_t a1)
{
  return sub_21260(*(void *)(v1 + 80), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_86694(uint64_t a1)
{
  return sub_1B5EC(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_866CC(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(_BYTE *)(v4 + 88) = a1;
  uint64_t v5 = type metadata accessor for StopIntentHandledElsewhereParameters(0LL);
  *(void *)(v4 + 48) = sub_4DA6C(v5);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_86710()
{
  uint64_t v2 = *(int **)(v0 + 40);
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v3 = *(void (**)(void *))(v0 + 16);
  char v4 = *(_BYTE *)(v0 + 88);
  uint64_t v5 = (uint64_t)v1 + v2[5];
  sub_1EC14();
  sub_7554C(v5);
  sub_7554C((uint64_t)v1 + v2[6]);
  sub_7554C((uint64_t)v1 + v2[8]);
  void *v1 = 0LL;
  *((_BYTE *)v1 + v2[7]) = v4;
  v3(v1);
  sub_86268();
  uint64_t v7 = v6;
  *(void *)(v0 + 56) = v6;
  uint64_t v8 = (void *)sub_47CC8((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 64) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_867DC;
  return sub_87E84(0xD00000000000001BLL, 0x80000000000AA0F0LL, v7, v10);
}

uint64_t sub_867DC()
{
  if (!v1) {
    *(void *)(v3 + 80) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_86828(uint64_t a1)
{
  return sub_21260(*(void *)(v1 + 80), *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_86864(uint64_t a1)
{
  return sub_1B5EC(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_8689C()
{
  return type metadata accessor for StopCATPatternsExecutor(0LL);
}

uint64_t type metadata accessor for StopIntentHandledElsewhereParameters(uint64_t a1)
{
  return sub_8A38(a1, qword_D72E0, (uint64_t)&nominal type descriptor for StopIntentHandledElsewhereParameters);
}

uint64_t type metadata accessor for StopConfirmationParameters(uint64_t a1)
{
  return sub_8A38(a1, qword_D7248, (uint64_t)&nominal type descriptor for StopConfirmationParameters);
}

uint64_t *sub_868CC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v9);
  }

  else
  {
    uint64_t v7 = type metadata accessor for SpeakableString(0LL);
    if (sub_16880((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_26B0(&qword_D3A08);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      sub_A40C((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v10 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
    uint64_t v11 = a3[7];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    if (sub_16880((uint64_t)v13, 1LL, v7))
    {
      uint64_t v14 = sub_26B0(&qword_D3A08);
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v12, v13, v7);
      sub_A40C((uint64_t)v12, 0LL, 1LL, v7);
    }
  }

  return a1;
}

uint64_t sub_86A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t result = sub_16880(v5, 1LL, v4);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(v5, v4);
  }
  return result;
}

char *sub_86AB4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    sub_A40C((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if (sub_16880((uint64_t)v11, 1LL, v6))
  {
    uint64_t v12 = sub_26B0(&qword_D3A08);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v10, v11, v6);
    sub_A40C((uint64_t)v10, 0LL, 1LL, v6);
  }

  return a1;
}

char *sub_86BD8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  int v7 = sub_16880((uint64_t)a1, 1LL, v6);
  int v8 = sub_16880((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      sub_A40C((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  a1[a3[5]] = a2[a3[5]];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = sub_16880((uint64_t)&a1[v11], 1LL, v6);
  int v15 = sub_16880((uint64_t)v13, 1LL, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }

  if (v15)
  {
LABEL_12:
    uint64_t v17 = sub_26B0(&qword_D3A08);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v12, v13, v6);
  sub_A40C((uint64_t)v12, 0LL, 1LL, v6);
  return a1;
}

char *sub_86D98(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    sub_A40C((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if (sub_16880((uint64_t)v11, 1LL, v6))
  {
    uint64_t v12 = sub_26B0(&qword_D3A08);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v10, v11, v6);
    sub_A40C((uint64_t)v10, 0LL, 1LL, v6);
  }

  return a1;
}

char *sub_86EBC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  int v7 = sub_16880((uint64_t)a1, 1LL, v6);
  int v8 = sub_16880((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      sub_A40C((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_26B0(&qword_D3A08);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v11] = a2[v11];
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  int v14 = &a2[v12];
  int v15 = sub_16880((uint64_t)&a1[v12], 1LL, v6);
  int v16 = sub_16880((uint64_t)v14, 1LL, v6);
  if (!v15)
  {
    uint64_t v17 = *(void *)(v6 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v13, v14, v6);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v6);
    goto LABEL_12;
  }

  if (v16)
  {
LABEL_12:
    uint64_t v18 = sub_26B0(&qword_D3A08);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(v13, v14, v6);
  sub_A40C((uint64_t)v13, 0LL, 1LL, v6);
  return a1;
}

uint64_t sub_87078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_87084);
}

void sub_87084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26B0(&qword_D3A08);
  if (*(_DWORD *)(*(void *)(v4 - 8) + 84LL) == (_DWORD)a2) {
    sub_214FC(a1, a2, v4);
  }
  else {
    sub_1D738();
  }
}

uint64_t sub_87100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8710C);
}

void sub_8710C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_26B0(&qword_D3A08);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    sub_21514(a1, a2, a2, v8);
  }

  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
    sub_1D738();
  }

void sub_87174(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = &unk_A72D0;
    void v4[2] = &unk_A72D0;
    v4[3] = v4[0];
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
  }

void *sub_871E8(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    int v7 = (void *)(v4 + ((v3 + 16LL) & ~(unint64_t)v3));
    swift_retain(v4);
  }

  else
  {
    int v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for SpeakableString(0LL);
    swift_retain(v4);
    if (sub_16880((uint64_t)v10, 1LL, v11))
    {
      uint64_t v12 = sub_26B0(&qword_D3A08);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_A40C((uint64_t)v9, 0LL, 1LL, v11);
    }

    uint64_t v13 = a3[6];
    int v14 = (char *)v7 + v13;
    int v15 = (char *)a2 + v13;
    if (sub_16880((uint64_t)a2 + v13, 1LL, v11))
    {
      uint64_t v16 = sub_26B0(&qword_D3A08);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v14, v15, v11);
      sub_A40C((uint64_t)v14, 0LL, 1LL, v11);
    }

    uint64_t v17 = a3[8];
    *((_BYTE *)v7 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    uint64_t v18 = (char *)v7 + v17;
    uint64_t v19 = (char *)a2 + v17;
    if (sub_16880((uint64_t)v19, 1LL, v11))
    {
      uint64_t v20 = sub_26B0(&qword_D3A08);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v18, v19, v11);
      sub_A40C((uint64_t)v18, 0LL, 1LL, v11);
    }
  }

  return v7;
}

uint64_t sub_873C4(void *a1, int *a2)
{
  uint64_t v4 = (uint64_t)a1 + a2[5];
  uint64_t v5 = type metadata accessor for SpeakableString(0LL);
  uint64_t v6 = (uint64_t)a1 + a2[6];
  uint64_t v7 = (uint64_t)a1 + a2[8];
  uint64_t result = sub_16880(v7, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v7, v5);
  }
  return result;
}

void *sub_8749C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for SpeakableString(0LL);
  swift_retain(v6);
  if (sub_16880((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_26B0(&qword_D3A08);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
    sub_A40C((uint64_t)v8, 0LL, 1LL, v10);
  }

  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  int v14 = (char *)a2 + v12;
  if (sub_16880((uint64_t)a2 + v12, 1LL, v10))
  {
    uint64_t v15 = sub_26B0(&qword_D3A08);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v13, v14, v10);
    sub_A40C((uint64_t)v13, 0LL, 1LL, v10);
  }

  uint64_t v16 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  if (sub_16880((uint64_t)v18, 1LL, v10))
  {
    uint64_t v19 = sub_26B0(&qword_D3A08);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v17, v18, v10);
    sub_A40C((uint64_t)v17, 0LL, 1LL, v10);
  }

  return a1;
}

void *sub_87650(void *a1, void *a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for SpeakableString(0LL);
  int v12 = sub_16880((uint64_t)v9, 1LL, v11);
  int v13 = sub_16880((uint64_t)v10, 1LL, v11);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_A40C((uint64_t)v9, 0LL, 1LL, v11);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    uint64_t v15 = sub_26B0(&qword_D3A08);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  int v19 = sub_16880((uint64_t)a1 + v16, 1LL, v11);
  int v20 = sub_16880((uint64_t)v18, 1LL, v11);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v17, v18, v11);
      sub_A40C((uint64_t)v17, 0LL, 1LL, v11);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v21 = *(void *)(v11 - 8);
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v11);
LABEL_12:
    uint64_t v22 = sub_26B0(&qword_D3A08);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v17, v18, v11);
LABEL_13:
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  uint64_t v23 = a3[8];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  int v26 = sub_16880((uint64_t)a1 + v23, 1LL, v11);
  int v27 = sub_16880((uint64_t)v25, 1LL, v11);
  if (!v26)
  {
    uint64_t v28 = *(void *)(v11 - 8);
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v24, v25, v11);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v24, v11);
    goto LABEL_18;
  }

  if (v27)
  {
LABEL_18:
    uint64_t v29 = sub_26B0(&qword_D3A08);
    memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v24, v25, v11);
  sub_A40C((uint64_t)v24, 0LL, 1LL, v11);
  return a1;
}

void *sub_878E8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_26B0(&qword_D3A08);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    sub_A40C((uint64_t)v7, 0LL, 1LL, v9);
  }

  uint64_t v11 = a3[6];
  int v12 = (char *)a1 + v11;
  int v13 = (char *)a2 + v11;
  if (sub_16880((uint64_t)a2 + v11, 1LL, v9))
  {
    uint64_t v14 = sub_26B0(&qword_D3A08);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v12, v13, v9);
    sub_A40C((uint64_t)v12, 0LL, 1LL, v9);
  }

  uint64_t v15 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  if (sub_16880((uint64_t)v17, 1LL, v9))
  {
    uint64_t v18 = sub_26B0(&qword_D3A08);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v16, v17, v9);
    sub_A40C((uint64_t)v16, 0LL, 1LL, v9);
  }

  return a1;
}

void *sub_87A8C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for SpeakableString(0LL);
  int v11 = sub_16880((uint64_t)v8, 1LL, v10);
  int v12 = sub_16880((uint64_t)v9, 1LL, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
      sub_A40C((uint64_t)v8, 0LL, 1LL, v10);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_26B0(&qword_D3A08);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  int v18 = sub_16880((uint64_t)a1 + v15, 1LL, v10);
  int v19 = sub_16880((uint64_t)v17, 1LL, v10);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v16, v17, v10);
      sub_A40C((uint64_t)v16, 0LL, 1LL, v10);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v20 = *(void *)(v10 - 8);
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v10);
LABEL_12:
    uint64_t v21 = sub_26B0(&qword_D3A08);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v16, v17, v10);
LABEL_13:
  uint64_t v22 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  int v25 = sub_16880((uint64_t)a1 + v22, 1LL, v10);
  int v26 = sub_16880((uint64_t)v24, 1LL, v10);
  if (!v25)
  {
    uint64_t v27 = *(void *)(v10 - 8);
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v23, v24, v10);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v23, v10);
    goto LABEL_18;
  }

  if (v26)
  {
LABEL_18:
    uint64_t v28 = sub_26B0(&qword_D3A08);
    memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v23, v24, v10);
  sub_A40C((uint64_t)v23, 0LL, 1LL, v10);
  return a1;
}

uint64_t sub_87D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_87D24);
}

void sub_87D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    sub_1D738();
  }

  else
  {
    uint64_t v6 = sub_26B0(&qword_D3A08);
    sub_214FC(a1 + *(int *)(a3 + 20), a2, v6);
  }

uint64_t sub_87D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_87DA4);
}

void sub_87DA4(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 2147483646)
  {
    *a1 = a2;
    sub_1D738();
  }

  else
  {
    uint64_t v7 = sub_26B0(&qword_D3A08);
    sub_21514((uint64_t)a1 + *(int *)(a4 + 20), a2, a2, v7);
  }

void sub_87E04(uint64_t a1)
{
  uint64_t v4 = "\b";
  sub_1E9D8(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v5 = *(void *)(v2 - 8) + 64LL;
    uint64_t v6 = v5;
    uint64_t v7 = &unk_A72D0;
    uint64_t v8 = v5;
    swift_initStructMetadata(a1, 256LL, 5LL, &v4, a1 + 16);
  }

uint64_t sub_87E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_87E9C(uint64_t a1)
{
  return sub_A40C(a1, 1LL, 1LL, v1);
}

  ;
}

uint64_t type metadata accessor for ChangeAlarmStatusCATPatternsExecutor(uint64_t a1)
{
  uint64_t result = qword_D7328;
  if (!qword_D7328) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ChangeAlarmStatusCATPatternsExecutor);
  }
  return result;
}

uint64_t sub_87EF8(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D84E0);
}

uint64_t sub_87F34(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_2D94C((uint64_t)sub_87F44);
}

uint64_t sub_87F44()
{
  uint64_t v2 = v1;
  v0[4] = v1;
  uint64_t v3 = sub_21638();
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  uint64_t v4 = swift_retain(qword_D84A8);
  uint64_t v5 = SirikitApp.init(app:)(v4);
  v0[5] = v5;
  uint64_t v6 = sub_26B0(&qword_D3BD0);
  uint64_t v7 = (__n128 *)sub_88F50(v6);
  v0[6] = v7;
  sub_6B02C(v7, (__n128)xmmword_A5A80);
  if (v2)
  {
    uint64_t v8 = sub_47D54();
    uint64_t v9 = v2;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    v7[3].n128_u64[1] = 0LL;
    v7[4].n128_u64[0] = 0LL;
  }

  sub_89094(v8, v9);
  if (!v5)
  {
    uint64_t v3 = 0LL;
    v7[6].n128_u64[1] = 0LL;
    v7[7].n128_u64[0] = 0LL;
  }

  sub_88F5C();
  sub_89060();
  sub_47DE4();
  uint64_t v10 = (void *)swift_task_alloc(v3);
  v0[7] = v10;
  sub_47E58(v10, (uint64_t)sub_88064);
  return sub_47CDC(0xD000000000000021LL, 0x80000000000AA280LL, (uint64_t)v7, v12);
}

uint64_t sub_88064(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v6 = v4;
  sub_88F28(*(void *)(v4 + 56), &v6);
  sub_16F40();
  if (!v1) {
    *(void *)(v4 + 72) = a1;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_880C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return sub_2D94C((uint64_t)sub_880D4);
}

uint64_t sub_880D4()
{
  uint64_t v2 = v1;
  v0[5] = v1;
  uint64_t v3 = sub_26B0(&qword_D3BD0);
  uint64_t v4 = sub_88F50(v3);
  v0[6] = v4;
  sub_6B02C((__n128 *)v4, (__n128)xmmword_A5A80);
  if (v2)
  {
    uint64_t v5 = sub_47D54();
    uint64_t v6 = v2;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v5 = 0LL;
    *(void *)(v4 + 56) = 0LL;
    *(void *)(v4 + 64) = 0LL;
  }

  uint64_t v7 = v0[4];
  *(void *)(v4 + 48) = v6;
  *(void *)(v4 + 72) = v5;
  *(void *)(v4 + 80) = 7368801LL;
  *(void *)(v4 + 88) = 0xE300000000000000LL;
  uint64_t v8 = 0LL;
  if (v7)
  {
    uint64_t v8 = type metadata accessor for SirikitApp(0LL);
  }

  else
  {
    *(void *)(v4 + 104) = 0LL;
    *(void *)(v4 + 112) = 0LL;
  }

  *(void *)(v4 + 96) = v7;
  *(void *)(v4 + 120) = v8;
  *(void *)(v4 + 128) = 0x616C417065656C73LL;
  *(void *)(v4 + 136) = 0xEA00000000006D72LL;
  *(_OWORD *)(v4 + 144) = 0u;
  *(_OWORD *)(v4 + 160) = 0u;
  sub_670D8();
  sub_47DE4();
  uint64_t v9 = (void *)sub_47E3C();
  v0[7] = v9;
  sub_47E58(v9, (uint64_t)sub_881F8);
  unint64_t v10 = sub_89008(33LL);
  return sub_47CDC(v10, v11, v12, v13);
}

uint64_t sub_881F8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v6 = v4;
  sub_88F28(*(void *)(v4 + 56), &v6);
  sub_16F40();
  if (!v1) {
    *(void *)(v4 + 72) = a1;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_88254()
{
  uint64_t v0 = sub_47DD4();
  return sub_384A0(v0, v1);
}

uint64_t sub_88280()
{
  uint64_t v0 = (uint64_t (*)(void))sub_8910C();
  return sub_47D48(v0);
}

uint64_t sub_882AC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_2D94C((uint64_t)sub_882BC);
}

uint64_t sub_882BC()
{
  uint64_t v2 = v1;
  v0[4] = v1;
  uint64_t v3 = sub_21638();
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  uint64_t v4 = swift_retain(qword_D84A8);
  uint64_t v5 = SirikitApp.init(app:)(v4);
  v0[5] = v5;
  uint64_t v6 = sub_26B0(&qword_D3BD0);
  uint64_t v7 = (__n128 *)sub_88F50(v6);
  v0[6] = v7;
  sub_6B02C(v7, (__n128)xmmword_A5A80);
  if (v2)
  {
    uint64_t v8 = sub_47D54();
    uint64_t v9 = v2;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    v7[3].n128_u64[1] = 0LL;
    v7[4].n128_u64[0] = 0LL;
  }

  sub_89094(v8, v9);
  if (!v5)
  {
    uint64_t v3 = 0LL;
    v7[6].n128_u64[1] = 0LL;
    v7[7].n128_u64[0] = 0LL;
  }

  sub_88F5C();
  sub_89060();
  sub_47DE4();
  unint64_t v10 = (void *)swift_task_alloc(v3);
  v0[7] = v10;
  sub_47E58(v10, (uint64_t)sub_883CC);
  unint64_t v11 = sub_890B0();
  return sub_47CDC(v11, v12, (uint64_t)v7, v14);
}

uint64_t sub_883CC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v6 = v4;
  sub_88F28(*(void *)(v4 + 56), &v6);
  sub_16F40();
  if (!v1) {
    *(void *)(v4 + 72) = a1;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_88428()
{
  uint64_t v0 = sub_47DD4();
  return sub_384A0(v0, v1);
}

uint64_t sub_88454()
{
  uint64_t v0 = (uint64_t (*)(void))sub_8910C();
  return sub_47D48(v0);
}

uint64_t sub_88480(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  return sub_2D94C((uint64_t)sub_88494);
}

uint64_t sub_88494()
{
  v0[2] = 0LL;
  uint64_t v1 = (void (*)(void *))v0[5];
  v0[3] = 0LL;
  v0[4] = 0LL;
  v1(v0 + 2);
  unint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  v0[8] = v2;
  v0[9] = v3;
  unint64_t v4 = v0[4];
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = (__n128 *)sub_88F50(v5);
  v0[10] = v6;
  sub_6B02C(v6, (__n128)xmmword_A5A80);
  if (v2)
  {
    uint64_t v7 = sub_47D54();
    unint64_t v8 = v2;
  }

  else
  {
    unint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
    v6[3].n128_u64[1] = 0LL;
    v6[4].n128_u64[0] = 0LL;
  }

  v6[3].n128_u64[0] = v8;
  v6[4].n128_u64[1] = v7;
  v6[5].n128_u64[0] = 7368801LL;
  v6[5].n128_u64[1] = 0xE300000000000000LL;
  if (v3)
  {
    uint64_t v9 = sub_21638();
    unint64_t v10 = v3;
  }

  else
  {
    unint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    v6[6].n128_u64[1] = 0LL;
    v6[7].n128_u64[0] = 0LL;
  }

  v6[6].n128_u64[0] = v10;
  v6[7].n128_u64[1] = v9;
  v6[8].n128_u64[0] = 0x616C417065656C73LL;
  v6[8].n128_u64[1] = 0xEA00000000006D72LL;
  uint64_t v11 = 0LL;
  if (v4)
  {
    uint64_t v11 = type metadata accessor for AlarmAlarm(0LL);
  }

  else
  {
    v6[9].n128_u64[1] = 0LL;
    v6[10].n128_u64[0] = 0LL;
  }

  v0[11] = v4;
  v6[9].n128_u64[0] = v4;
  v6[10].n128_u64[1] = v11;
  swift_retain(v3);
  sub_670D8();
  swift_retain(v2);
  uint64_t v13 = (void *)swift_task_alloc(v12);
  v0[12] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_885F4;
  unint64_t v14 = sub_890B0();
  return sub_47CDC(v14, v15, (uint64_t)v6, v17);
}

uint64_t sub_885F4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = v1;
  swift_task_dealloc();
  sub_16F40();
  if (!v1) {
    *(void *)(v4 + 112) = a1;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_88660()
{
  return sub_384A0(*(void *)(v0 + 112), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_88694()
{
  return sub_47D48(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_886C4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_2D94C((uint64_t)sub_886D4);
}

uint64_t sub_886D4()
{
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  uint64_t v3 = swift_retain(qword_D84A8);
  uint64_t v4 = SirikitApp.init(app:)(v3);
  sub_89038(v4);
  uint64_t v6 = v5;
  uint64_t v7 = sub_26B0(&qword_D3BD0);
  uint64_t v8 = sub_88F50(v7);
  uint64_t v9 = sub_89100(v8);
  sub_88ECC(v9, (__n128)xmmword_A5A80);
  if (v0)
  {
    uint64_t v10 = v0;
  }

  else
  {
    uint64_t v10 = 0LL;
    v2[13] = 0LL;
    v2[14] = 0LL;
  }

  uint64_t v11 = sub_88FB0(v10);
  if (v6)
  {
    uint64_t v11 = type metadata accessor for AlarmAlarm(v11);
  }

  else
  {
    v2[19] = 0LL;
    v2[20] = 0LL;
  }

  sub_89050(v11);
  sub_88F38();
  sub_670D8();
  uint64_t v12 = (void *)sub_47E3C();
  *(void *)(v1 + 56) = v12;
  sub_47E58(v12, (uint64_t)sub_887DC);
  unint64_t v13 = sub_89008(38LL);
  return sub_47CDC(v13, v14, v15, v16);
}

uint64_t sub_887DC()
{
  if (!v1) {
    *(void *)(v2 + 72) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_88824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return sub_2D94C((uint64_t)sub_88838);
}

uint64_t sub_88838()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_47DE4();
  sub_8284C();
  uint64_t v4 = v3;
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = sub_88F50(v5);
  uint64_t v7 = sub_89100(v6);
  sub_88ECC(v7, (__n128)xmmword_A5A80);
  if (v2)
  {
    uint64_t v8 = sub_21638();
    uint64_t v9 = v2;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    v1[13] = 0LL;
    v1[14] = 0LL;
  }

  uint64_t v10 = sub_88FDC(v8, v9);
  if (v4)
  {
    uint64_t v10 = type metadata accessor for AlarmAlarm(v10);
  }

  else
  {
    v1[19] = 0LL;
    v1[20] = 0LL;
  }

  sub_89050(v10);
  sub_88F38();
  sub_670D8();
  uint64_t v11 = (void *)sub_47E3C();
  *(void *)(v0 + 56) = v11;
  sub_47E58(v11, (uint64_t)sub_88904);
  unint64_t v12 = sub_89008(38LL);
  return sub_47CDC(v12, v13, v14, v15);
}

uint64_t sub_88904()
{
  if (!v1) {
    *(void *)(v2 + 72) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_8894C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_2D94C((uint64_t)sub_8895C);
}

uint64_t sub_8895C()
{
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  uint64_t v3 = swift_retain(qword_D84A8);
  uint64_t v4 = SirikitApp.init(app:)(v3);
  sub_89038(v4);
  uint64_t v6 = v5;
  uint64_t v7 = sub_26B0(&qword_D3BD0);
  uint64_t v8 = sub_88F50(v7);
  uint64_t v9 = sub_89100(v8);
  sub_88ECC(v9, (__n128)xmmword_A5A80);
  if (v0)
  {
    uint64_t v10 = v0;
  }

  else
  {
    uint64_t v10 = 0LL;
    v2[13] = 0LL;
    v2[14] = 0LL;
  }

  uint64_t v11 = sub_88FB0(v10);
  if (v6)
  {
    uint64_t v11 = type metadata accessor for AlarmAlarm(v11);
  }

  else
  {
    v2[19] = 0LL;
    v2[20] = 0LL;
  }

  sub_89050(v11);
  sub_88F38();
  sub_670D8();
  unint64_t v12 = (void *)sub_47E3C();
  *(void *)(v1 + 56) = v12;
  sub_47E58(v12, (uint64_t)sub_88A64);
  unint64_t v13 = sub_89008(37LL);
  return sub_47CDC(v13, v14, v15, v16);
}

uint64_t sub_88A64()
{
  if (!v1) {
    *(void *)(v2 + 72) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_88AAC()
{
  sub_17324();
  uint64_t v1 = sub_47DD4();
  return sub_384A0(v1, v2);
}

uint64_t sub_88AD8()
{
  sub_17324();
  uint64_t v1 = (uint64_t (*)(void))sub_8910C();
  return sub_47D48(v1);
}

uint64_t sub_88B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return sub_2D94C((uint64_t)sub_88B18);
}

uint64_t sub_88B18()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_47DE4();
  sub_8284C();
  uint64_t v4 = v3;
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = sub_88F50(v5);
  uint64_t v7 = sub_89100(v6);
  sub_88ECC(v7, (__n128)xmmword_A5A80);
  if (v2)
  {
    uint64_t v8 = sub_21638();
    uint64_t v9 = v2;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    v1[13] = 0LL;
    v1[14] = 0LL;
  }

  uint64_t v10 = sub_88FDC(v8, v9);
  if (v4)
  {
    uint64_t v10 = type metadata accessor for AlarmAlarm(v10);
  }

  else
  {
    v1[19] = 0LL;
    v1[20] = 0LL;
  }

  sub_89050(v10);
  sub_88F38();
  sub_670D8();
  uint64_t v11 = (void *)sub_47E3C();
  *(void *)(v0 + 56) = v11;
  sub_47E58(v11, (uint64_t)sub_88BE4);
  unint64_t v12 = sub_89008(37LL);
  return sub_47CDC(v12, v13, v14, v15);
}

uint64_t sub_88BE4()
{
  if (!v1) {
    *(void *)(v2 + 72) = v0;
  }
  sub_19840();
  return sub_1EA50();
}

uint64_t sub_88C2C()
{
  sub_890C8();
  uint64_t v1 = sub_47DD4();
  return sub_384A0(v1, v2);
}

uint64_t sub_88C58()
{
  sub_890C8();
  uint64_t v1 = (uint64_t (*)(void))sub_8910C();
  return sub_47D48(v1);
}

uint64_t sub_88C84(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return sub_2D94C((uint64_t)sub_88C98);
}

uint64_t sub_88C98()
{
  uint64_t v1 = sub_26B0(&qword_D3BD0);
  uint64_t v2 = (void *)sub_75F50(v1);
  v2[4] = 0xD000000000000010LL;
  v2[5] = 0x80000000000A8110LL;
  v2[9] = &type metadata for Bool;
  uint64_t v3 = (void *)sub_89018( (uint64_t)v2,  (uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:),  (__n128)xmmword_A4880);
  *(void *)(v0 + 32) = v3;
  sub_47E58(v3, (uint64_t)sub_88D30);
  uint64_t v4 = sub_89078(0xD00000000000003BLL);
  return sub_47D38(v4, v5, v6, v7);
}

uint64_t sub_88D30()
{
  if (v1)
  {
    sub_19840();
    return sub_19744();
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 24));
    return sub_4F354(v0, *(uint64_t (**)(void))(v3 + 8));
  }

uint64_t sub_88D7C(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return sub_2D94C((uint64_t)sub_88D90);
}

uint64_t sub_88D90()
{
  uint64_t v1 = sub_26B0(&qword_D3BD0);
  uint64_t v2 = (void *)sub_75F50(v1);
  v2[4] = 0xD000000000000010LL;
  v2[5] = 0x80000000000A8110LL;
  v2[9] = &type metadata for Bool;
  uint64_t v3 = (void *)sub_89018( (uint64_t)v2,  (uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:),  (__n128)xmmword_A4880);
  *(void *)(v0 + 32) = v3;
  sub_47E58(v3, (uint64_t)sub_88E28);
  uint64_t v4 = sub_89078(0xD00000000000003ALL);
  return sub_47D38(v4, v5, v6, v7);
}

uint64_t sub_88E28()
{
  if (v1)
  {
    sub_19840();
    return sub_19744();
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 24));
    return sub_4F354(v0, *(uint64_t (**)(void))(v3 + 8));
  }

uint64_t sub_88E74()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_88EA8()
{
  return type metadata accessor for ChangeAlarmStatusCATPatternsExecutor(0LL);
}

double sub_88ECC(uint64_t a1, __n128 a2)
{
  *(__n128 *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0x6D72616C61LL;
  *(void *)(a1 + 40) = 0xE500000000000000LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = 7368801LL;
  *(void *)(a1 + 88) = 0xE300000000000000LL;
  return result;
}

uint64_t sub_88F00()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 56);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 64) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_88F28@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *v3;
  *(void *)(v4 + 64) = v2;
  return swift_task_dealloc(a1);
}

uint64_t sub_88F38()
{
  return swift_retain(v0);
}

uint64_t sub_88F50(uint64_t a1)
{
  return swift_allocObject(a1, 176LL, 7LL);
}

double sub_88F5C()
{
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 120) = v0;
  *(void *)(v1 + 128) = 0x616C417065656C73LL;
  *(void *)(v1 + 136) = 0xEA00000000006D72LL;
  double result = 0.0;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  return result;
}

uint64_t sub_88F8C()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 32);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 40) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_88FB0@<X0>(uint64_t a1@<X8>)
{
  v2[12] = a1;
  v2[15] = v1;
  v2[16] = 0x616C417065656C73LL;
  v2[17] = 0xEA00000000006D72LL;
  return 0LL;
}

uint64_t sub_88FDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v2[12] = a2;
  v2[15] = a1;
  v2[16] = 0x616C417065656C73LL;
  v2[17] = 0xEA00000000006D72LL;
  return 0LL;
}

unint64_t sub_89008(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL;
}

uint64_t sub_89018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  *(_BYTE *)(a1 + 48) = v4;
  uint64_t v6 = *(unsigned int *)(a2 + 4);
  *(void *)(v5 + 24) = v3;
  v3[1] = a3;
  return swift_task_alloc(v6);
}

void sub_89038(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  sub_4828C();
}

uint64_t sub_89050(uint64_t result)
{
  *(void *)(v2 + 48) = v1;
  *(void *)(v3 + 144) = v1;
  *(void *)(v3 + 168) = result;
  return result;
}

uint64_t sub_89060()
{
  return swift_retain(v0);
}

uint64_t sub_89078@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_89094@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  v2[6] = a2;
  v2[9] = result;
  v2[10] = 7368801LL;
  v2[11] = 0xE300000000000000LL;
  return result;
}

unint64_t sub_890B0()
{
  return 0xD000000000000020LL;
}

uint64_t sub_890C8()
{
  return swift_release_n(v0, 2LL);
}

  ;
}

uint64_t sub_890E8()
{
  return swift_release(*(void *)(v0 + 48));
}

uint64_t sub_890F4()
{
  return swift_release(*(void *)(v0 + 48));
}

uint64_t sub_89100(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t sub_8910C()
{
  return *(void *)(v0 + 8);
}

uint64_t SIRINLUUserDialogAct.alarmSearch.getter(uint64_t a1)
{
  uint64_t v1 = SIRINLUUserDialogAct.firstUsoTask.getter(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    type metadata accessor for AlarmSearch(0LL);
    sub_1C31C(v2);
    uint64_t v4 = v3;
    swift_release(v2);
    return v4;
  }

  else
  {
    if (qword_D3198 != -1) {
      swift_once(&qword_D3198, sub_8921C);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_26F0(v6, (uint64_t)qword_D73C8);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v7, v8, v9, v10, v11, v12, v13, v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "No task found in userDialogAct.", v17, 2u);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    return 0LL;
  }

uint64_t sub_8921C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D73C8);
  sub_26F0(v0, (uint64_t)qword_D73C8);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_89264(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for CreateAlarmCATsSimple,  (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:),  &qword_D84F0);
}

uint64_t sub_89280(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for CreateAlarmCATPatternsExecutor,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_D84F8);
}

ValueMetadata *_s20HandleIntentStrategyVMa_3()
{
  return &_s20HandleIntentStrategyVN_3;
}

uint64_t sub_892AC(uint64_t a1)
{
  uint64_t v2 = sub_8CA74(a1);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  uint64_t v4 = sub_19754(v3);
  uint64_t v5 = sub_8CA68(v4);
  v1[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[15] = v6;
  uint64_t v7 = sub_19754(v6);
  uint64_t v8 = sub_8CA5C(v7);
  uint64_t v9 = sub_19754(*(void *)(v8 - 8));
  uint64_t v10 = sub_8CA50(v9);
  v1[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[19] = v11;
  uint64_t v12 = sub_19754(v11);
  uint64_t v13 = sub_8CA44(v12);
  v1[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[22] = v14;
  uint64_t v15 = sub_19754(v14);
  uint64_t v16 = sub_8CA38(v15);
  v1[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[25] = v17;
  v1[26] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_89348()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_893E8);
  return sub_8C8E0();
}

uint64_t sub_893E8()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_8942C()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_89470()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

#error "89550: call analysis failed (funcsize=40)"
uint64_t sub_89568(uint64_t a1)
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
  uint64_t v2 = sub_8CA74(a1);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  uint64_t v4 = sub_19754(v3);
  uint64_t v5 = sub_8CA68(v4);
  v1[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[15] = v6;
  uint64_t v7 = sub_19754(v6);
  uint64_t v8 = sub_8CA5C(v7);
  uint64_t v9 = sub_19754(*(void *)(v8 - 8));
  uint64_t v10 = sub_8CA50(v9);
  v1[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[19] = v11;
  uint64_t v12 = sub_19754(v11);
  uint64_t v13 = sub_8CA44(v12);
  v1[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[22] = v14;
  uint64_t v15 = sub_19754(v14);
  uint64_t v16 = sub_8CA38(v15);
  v1[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[25] = v17;
  v1[26] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_89604()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_896A4);
  return sub_8C8E0();
}

uint64_t sub_896A4()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_896E8()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_8972C()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

#error "8980C: call analysis failed (funcsize=40)"
uint64_t sub_89824(uint64_t a1)
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
  uint64_t v2 = sub_8CA74(a1);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  uint64_t v4 = sub_19754(v3);
  uint64_t v5 = sub_8CA68(v4);
  v1[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[15] = v6;
  uint64_t v7 = sub_19754(v6);
  uint64_t v8 = sub_8CA5C(v7);
  uint64_t v9 = sub_19754(*(void *)(v8 - 8));
  uint64_t v10 = sub_8CA50(v9);
  v1[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[19] = v11;
  uint64_t v12 = sub_19754(v11);
  uint64_t v13 = sub_8CA44(v12);
  v1[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[22] = v14;
  uint64_t v15 = sub_19754(v14);
  uint64_t v16 = sub_8CA38(v15);
  v1[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[25] = v17;
  v1[26] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_898C0()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_89960);
  return sub_8C8E0();
}

uint64_t sub_89960()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_899A4()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_899E8()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

#error "89AC8: call analysis failed (funcsize=40)"
uint64_t sub_89AE0(uint64_t a1)
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
  uint64_t v2 = sub_8CA74(a1);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  uint64_t v4 = sub_19754(v3);
  uint64_t v5 = sub_8CA68(v4);
  v1[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[15] = v6;
  uint64_t v7 = sub_19754(v6);
  uint64_t v8 = sub_8CA5C(v7);
  uint64_t v9 = sub_19754(*(void *)(v8 - 8));
  uint64_t v10 = sub_8CA50(v9);
  v1[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[19] = v11;
  uint64_t v12 = sub_19754(v11);
  uint64_t v13 = sub_8CA44(v12);
  v1[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[22] = v14;
  uint64_t v15 = sub_19754(v14);
  uint64_t v16 = sub_8CA38(v15);
  v1[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[25] = v17;
  v1[26] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_89B7C()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_89C1C);
  return sub_8C8E0();
}

uint64_t sub_89C1C()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_89C60()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_89CA4()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

uint64_t sub_89CF8()
{
  uint64_t v1 = *(void *)(v0 + 232);
  sub_8CAA4();
  uint64_t v2 = sub_26B0(&qword_D4890);
  uint64_t v3 = sub_8CB74(v2, 0x80000000000AA2B0LL);
  sub_8CC84(v3, v4, v5, v6, v7, v8, v9, v10);
  swift_errorRelease(v1);
  sub_8CC24();
  sub_197C0();
  sub_19828();
  uint64_t v11 = sub_19820();
  uint64_t v19 = sub_19978(v11, v12, v13, v14, v15, v16, v17, v18, v36, v39);
  uint64_t v27 = sub_19964(v19, v20, v21, v22, v23, v24, v25, v26, v37, v40, v42);
  sub_1B64C(v27, v28, v29, v30, v31, v32, v33, v34, v38, v41, v43, v44);
  return sub_1B57C(*(uint64_t (**)(void))(v0 + 8));
}

#error "89E20: call analysis failed (funcsize=40)"
uint64_t sub_89E38()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v1 = *(void *)(v0 + 256);
  sub_8CAA4();
  uint64_t v2 = sub_26B0(&qword_D4890);
  uint64_t v3 = sub_8CB74(v2, 0x80000000000AA2B0LL);
  sub_8CC84(v3, v4, v5, v6, v7, v8, v9, v10);
  swift_errorRelease(v1);
  sub_8CC24();
  sub_197C0();
  sub_19828();
  uint64_t v11 = sub_19820();
  uint64_t v19 = sub_19978(v11, v12, v13, v14, v15, v16, v17, v18, v36, v39);
  uint64_t v27 = sub_19964(v19, v20, v21, v22, v23, v24, v25, v26, v37, v40, v42);
  sub_1B64C(v27, v28, v29, v30, v31, v32, v33, v34, v38, v41, v43, v44);
  return sub_1B57C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_89ECC(uint64_t a1)
{
  uint64_t v2 = sub_8CA74(a1);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  uint64_t v4 = sub_19754(v3);
  uint64_t v5 = sub_8CA68(v4);
  v1[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[15] = v6;
  uint64_t v7 = sub_19754(v6);
  uint64_t v8 = sub_8CA5C(v7);
  uint64_t v9 = sub_19754(*(void *)(v8 - 8));
  uint64_t v10 = sub_8CA50(v9);
  v1[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[19] = v11;
  uint64_t v12 = sub_19754(v11);
  uint64_t v13 = sub_8CA44(v12);
  v1[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[22] = v14;
  uint64_t v15 = sub_19754(v14);
  uint64_t v16 = sub_8CA38(v15);
  v1[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[25] = v17;
  v1[26] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_89F68()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_8A008);
  return sub_8C8E0();
}

uint64_t sub_8A008()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_8A04C()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_8A090()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

#error "8A170: call analysis failed (funcsize=40)"
uint64_t sub_8A188(uint64_t a1)
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
  v1[10] = a1;
  uint64_t v2 = type metadata accessor for NLContextUpdate(0LL);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  v1[13] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DialogPhase(0LL);
  v1[14] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[15] = v5;
  v1[16] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  v1[17] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v1[18] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v1[19] = v8;
  v1[20] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v1[21] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v1[22] = v10;
  v1[23] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for SiriTimeMeasurement(0LL);
  v1[24] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v1[25] = v12;
  v1[26] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_8A2A8, 0LL, 0LL);
}

uint64_t sub_8A2A8()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_8A348);
  return sub_8C8E0();
}

uint64_t sub_8A348()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_8A38C()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_8A3D0()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

#error "8A4B0: call analysis failed (funcsize=40)"
uint64_t sub_8A4C8(uint64_t a1)
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
  uint64_t v2 = sub_8CA74(a1);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  uint64_t v4 = sub_19754(v3);
  uint64_t v5 = sub_8CA68(v4);
  v1[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[15] = v6;
  uint64_t v7 = sub_19754(v6);
  uint64_t v8 = sub_8CA5C(v7);
  uint64_t v9 = sub_19754(*(void *)(v8 - 8));
  uint64_t v10 = sub_8CA50(v9);
  v1[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[19] = v11;
  uint64_t v12 = sub_19754(v11);
  uint64_t v13 = sub_8CA44(v12);
  v1[21] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[22] = v14;
  uint64_t v15 = sub_19754(v14);
  uint64_t v16 = sub_8CA38(v15);
  v1[24] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[25] = v17;
  v1[26] = sub_19754(v17);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8A564()
{
  if (qword_D3150 != -1) {
    swift_once(&qword_D3150, sub_796C8);
  }
  sub_8C98C();
  sub_8C918(v2, (uint64_t)qword_D6C20);
  uint64_t v3 = mach_absolute_time();
  sub_8C954(v3);
  sub_8CB24();
  sub_8C9AC();
  uint64_t v4 = sub_8C9A0();
  sub_8CB38(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_D769C);
  *(void *)(v0 + 224) = v5;
  sub_82650(v5, (uint64_t)sub_8A604);
  return sub_8C8E0();
}

uint64_t sub_8A604()
{
  if (!v0) {
    sub_8C9E0();
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_8A648()
{
  uint64_t v0 = swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  uint64_t v1 = (void *)sub_8CB68(v0);
  sub_8C8F4(v1);
  return sub_197F4();
}

uint64_t sub_8A68C()
{
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_8C8C8(v3, v4, v5);
}

#error "8A76C: call analysis failed (funcsize=40)"
uint64_t sub_8A784()
{
  uint64_t v0;
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D73E0);
  sub_26F0(v0, (uint64_t)qword_D73E0);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_8A7CC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_26B0(&qword_D37D0);
  v2[4] = sub_19754(*(void *)(v3 - 8));
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8A810()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for HALAlarmDeviceContext(0LL);
  sub_A40C(v1, 1LL, 1LL, v2);
  sub_1511C();
  uint64_t v4 = v3;
  sub_1B538(v1);
  sub_19808();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_8A888(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  uint64_t v4 = type metadata accessor for TemplatingResult(0LL);
  v3[16] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[17] = v5;
  v3[18] = sub_19754(v5);
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  v3[19] = sub_19754(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for AppInstallDialogOutputUtil(0LL);
  v3[20] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[21] = v8;
  v3[22] = sub_19754(v8);
  uint64_t v9 = type metadata accessor for SiriTimeFeatureFlagsImpl(0LL);
  v3[23] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[24] = v10;
  v3[25] = sub_19754(v10);
  uint64_t v11 = type metadata accessor for DialogPhase(0LL);
  v3[26] = v11;
  v3[27] = *(void *)(v11 - 8);
  v3[28] = sub_19884();
  v3[29] = sub_19884();
  v3[30] = sub_19884();
  uint64_t v12 = type metadata accessor for Logger(0LL);
  v3[31] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[32] = v13;
  v3[33] = sub_19754(v13);
  uint64_t v14 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[34] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[35] = v15;
  v3[36] = sub_19754(v15);
  uint64_t v16 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[37] = v16;
  v3[38] = *(void *)(v16 - 8);
  v3[39] = sub_19884();
  v3[40] = sub_19884();
  v3[41] = sub_19884();
  uint64_t v17 = type metadata accessor for Parse.DirectInvocation(0LL);
  v3[42] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v3[43] = v18;
  v3[44] = sub_19754(v18);
  uint64_t v19 = type metadata accessor for NLContextUpdate(0LL);
  v3[45] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v3[46] = v20;
  v3[47] = sub_19754(v20);
  uint64_t v21 = type metadata accessor for AppInstallUtil.Domain(0LL);
  v3[48] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v3[49] = v22;
  v3[50] = sub_19754(v22);
  uint64_t v23 = type metadata accessor for AppInstallUtil(0LL);
  v3[51] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v3[52] = v24;
  v3[53] = sub_19754(v24);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8AA38()
{
  if (qword_D31B0 != -1) {
    swift_once(&qword_D31B0, sub_8A784);
  }
  uint64_t v2 = (__objc2_ivar *)sub_26F0(v0[31], (uint64_t)qword_D73E0);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v2, v3, v4, v5, v6, v7, v8, v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (_WORD *)sub_1EFA4();
    sub_45454(v12);
    sub_16B44(&dword_0, v10, v11, "DeleteAlarm.HandleIntentStrategy.makeIntentHandledResponse() called.", v1);
    sub_16AA8((uint64_t)v1);
  }

  uint64_t v13 = v0[14];

  uint64_t v14 = sub_26B0(&qword_D4A80);
  uint64_t v15 = (__objc2_ivar *)IntentResolutionRecord.intent.getter(v14);
  v0[54] = v15;
  unint64_t v16 = sub_A658(v15);
  if (!v16) {
    goto LABEL_94;
  }
  unint64_t v17 = v16;
  unint64_t v18 = v16 >> 62;
  if (!(v16 >> 62))
  {
    uint64_t v19 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL));
    if (v19) {
      goto LABEL_8;
    }
    goto LABEL_93;
  }

  sub_8CBA4();
  uint64_t v19 = _CocoaArrayWrapper.endIndex.getter(v13);
  sub_16F40();
  if (!v19)
  {
LABEL_93:
    sub_16F40();
LABEL_94:
    sub_26B0(&qword_D4190);
    unint64_t v161 = sub_24EA4();
    uint64_t v162 = sub_25234(v161);
    sub_8CBF8(v162, v163, v164, v165, v166, v167, v168, v169);

    goto LABEL_95;
  }

uint64_t sub_8B764()
{
  v3[7] = v1;
  v3[8] = v2;
  v3[9] = v0;
  *uint64_t v4 = *v1;
  v3[56] = v0;
  swift_task_dealloc();
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8B7BC()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v0 + 480) = v1;
  void *v1 = v0;
  v1[1] = sub_8B8CC;
  sub_8CA80();
  return sub_197F4();
}

uint64_t sub_8B818()
{
  v3[10] = v1;
  v3[11] = v2;
  v3[12] = v0;
  *uint64_t v4 = *v1;
  v3[58] = v0;
  swift_task_dealloc();
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8B870()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v0 + 480) = v1;
  void *v1 = v0;
  v1[1] = sub_8B8CC;
  sub_8CA80();
  return sub_197F4();
}

uint64_t sub_8B8CC()
{
  *(void *)(v0 + 488) = v1;
  swift_task_dealloc();
  sub_19838(*(void *)(v0 + 216));
  sub_19840();
  return sub_197B8();
}

#error "8B980: call analysis failed (funcsize=31)"
uint64_t sub_8B9A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 504);
  *(void *)(v3 + 512) = a1;
  *(void *)(v3 + 520) = v1;
  sub_199C0(v4);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8BA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v7 + 528) = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_8BA64;
  sub_8CA80();
  return sub_197F4();
}

uint64_t sub_8BA64()
{
  v0[67] = v1;
  swift_task_dealloc();
  uint64_t v3 = (void *)v0[64];
  sub_19838(v0[27]);

  sub_19840();
  return sub_19744();
}

#error "8BB20: call analysis failed (funcsize=31)"
uint64_t sub_8BB44(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 544);
  *(void *)(v3 + 552) = a1;
  *(void *)(v3 + 560) = v1;
  sub_199C0(v4);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8BBA4()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v0 + 568) = v1;
  void *v1 = v0;
  v1[1] = sub_8BC04;
  sub_8CA80();
  return sub_197F4();
}

uint64_t sub_8BC04()
{
  v0[72] = v1;
  swift_task_dealloc();
  uint64_t v3 = (void *)v0[69];
  sub_19838(v0[27]);

  sub_19840();
  return sub_19744();
}

#error "8BCBC: call analysis failed (funcsize=30)"
uint64_t sub_8BCE0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  sub_19810();
  uint64_t v2 = v0[73];
  v0[74] = v3;
  v0[75] = v1;
  sub_199C0(v2);
  sub_19838(v0[21]);
  sub_19840();
  return sub_197B8();
}

uint64_t sub_8BD48()
{
  if (qword_D3068 != -1) {
    swift_once(&qword_D3068, sub_50694);
  }
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_80B4(v1, v2);
  char v4 = dispatch thunk of DeviceState.isWatch.getter(v2, v3);
  uint64_t v5 = (void *)swift_task_alloc(dword_D6FB4);
  v0[76] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_8BE00;
  return sub_82BD0(v0[18], 0, 1, v4 & 1);
}

uint64_t sub_8BE00()
{
  *(void *)(v0 + 616) = v1;
  swift_task_dealloc();
  if (v1) {
    swift_bridgeObjectRelease(*(void *)(v0 + 592));
  }
  sub_19840();
  return sub_197B8();
}

#error "8BEE4: call analysis failed (funcsize=44)"
#error "8BF60: call analysis failed (funcsize=31)"
#error "8BFDC: call analysis failed (funcsize=31)"
#error "8C05C: call analysis failed (funcsize=32)"
#error "8C0D8: call analysis failed (funcsize=31)"
#error "8C154: call analysis failed (funcsize=31)"
#error "8C1C8: call analysis failed (funcsize=29)"
#error "8C23C: call analysis failed (funcsize=29)"
#error "8C2BC: call analysis failed (funcsize=32)"
#error "8C33C: call analysis failed (funcsize=32)"
void *sub_8C360(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *result;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void v22[5];
  char v23;
  char v24[24];
  uint64_t v25;
  uint64_t v1 = a1;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    double result = (void *)swift_bridgeObjectRetain(a1);
    if (v2) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease(v1);
    return _swiftEmptyArrayStorage;
  }

  if (a1 < 0) {
    unint64_t v18 = a1;
  }
  else {
    unint64_t v18 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  double result = (void *)_CocoaArrayWrapper.endIndex.getter(v18);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_20;
  }
LABEL_3:
  if (v2 >= 1)
  {
    char v4 = 0LL;
    id v21 = v1 & 0xC000000000000001LL;
    uint64_t v5 = _swiftEmptyArrayStorage;
    uint64_t v19 = v2;
    uint64_t v20 = v1;
    do
    {
      if (v21) {
        uint64_t v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }
      else {
        uint64_t v6 = *(id *)(v1 + 8 * v4 + 32);
      }
      sub_69CC0(v6, (uint64_t)v22);
      uint64_t v7 = v22[0];
      uint64_t v8 = v22[1];
      uint64_t v10 = v22[2];
      uint64_t v9 = v22[3];
      os_log_type_t v11 = v22[4];
      uint64_t v12 = v23;
      sub_169F4((uint64_t)v22, (uint64_t)v24);
      if (v25)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0)
        {
          sub_6C9F8(0, v5[2] + 1LL, 1, (uint64_t)v5);
          uint64_t v5 = v16;
        }

        uint64_t v14 = v5[2];
        uint64_t v13 = v5[3];
        if (v14 >= v13 >> 1)
        {
          sub_6C9F8(v13 > 1, v14 + 1, 1, (uint64_t)v5);
          uint64_t v5 = v17;
        }

        v5[2] = v14 + 1;
        uint64_t v15 = &v5[6 * v14];
        v15[4] = v7;
        v15[5] = v8;
        v15[6] = v10;
        v15[7] = v9;
        v15[8] = v11;
        *((_BYTE *)v15 + 72) = v12 & 1;
        uint64_t v2 = v19;
        uint64_t v1 = v20;
      }

      ++v4;
    }

    while (v2 != v4);
    swift_bridgeObjectRelease(v1);
    return v5;
  }

  __break(1u);
  return result;
}

uint64_t sub_8C508(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D7454);
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8C568;
  return sub_8A888(a1, a2);
}

uint64_t sub_8C568()
{
  uint64_t v2 = *v1;
  *uint64_t v3 = v2;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    return sub_1B5EC(*(uint64_t (**)(void))(v2 + 8));
  }
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8C5B8()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v1;
  sub_26B0(&qword_D4890);
  uint64_t v2 = static BarbaraWalters.logAndReturnError<A>(context:_:)(0xD00000000000005DLL, 0x80000000000AA320LL, v0 + 24);
  sub_8CC84(v2, v3, v4, v5, v6, v7, v8, v9);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_8C644(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D744C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B578;
  return sub_8C508(a1, a2);
}

uint64_t sub_8C6A4(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_D7440 + dword_D7440);
  uint64_t v3 = (void *)swift_task_alloc(unk_D7444);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B3B8;
  return v5(a1);
}

uint64_t sub_8C718(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D749C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_5DA4;
  return sub_8A7CC(a1, a2);
}

unint64_t sub_8C770()
{
  unint64_t result = qword_D7400[0];
  if (!qword_D7400[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_A73D8, &_s20HandleIntentStrategyVN_3);
    atomic_store(result, qword_D7400);
  }

  return result;
}

uint64_t sub_8C7B4()
{
  return swift_task_dealloc(*(void *)(v0 + 424));
}

uint64_t sub_8C800()
{
  return type metadata accessor for ABCReport(0LL);
}

uint64_t sub_8C830()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 248);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 256) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_8C85C()
{
  return swift_task_dealloc(*(void *)(v0 + 424));
}

uint64_t sub_8C8A4()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 224);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 232) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_8C8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_8C8E0()
{
  return sub_90D54();
}

uint64_t sub_8C8F4(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 80);
}

uint64_t sub_8C918(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_26F0(v3, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
}

uint64_t sub_8C93C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v1, v2, a1);
}

uint64_t sub_8C954(uint64_t a1)
{
  return SiriTimeMeasurement.init(_:log:startTime:)(v1, v2, a1);
}

uint64_t sub_8C968(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104LL))(v2, a2, v3);
}

uint64_t sub_8C97C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

  ;
}

uint64_t sub_8C9A0()
{
  return CATWrapper.__allocating_init(options:globals:)(v0, 0LL);
}

uint64_t sub_8C9AC()
{
  return static CATOption.defaultMode.getter();
}

void sub_8C9B8()
{
}

uint64_t sub_8C9D4()
{
  return static DialogPhase.error.getter();
}

uint64_t sub_8C9E0()
{
  uint64_t v2 = *(void *)(v1 + 216);
  *(void *)(v1 + 240) = v0;
  return swift_release(v2);
}

uint64_t sub_8C9EC(uint64_t a1)
{
  return String.init<A>(describing:)(v1, a1);
}

void *sub_8C9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return sub_19558(v3);
}

uint64_t sub_8CA04()
{
  return *(void *)(v0 + 8);
}

void sub_8CA14()
{
}

id sub_8CA2C()
{
  return [v0 *(SEL *)(v1 + 456)];
}

uint64_t sub_8CA38(uint64_t a1)
{
  *(void *)(v1 + 184) = a1;
  return type metadata accessor for SiriTimeMeasurement(0LL);
}

uint64_t sub_8CA44(uint64_t a1)
{
  *(void *)(v1 + 160) = a1;
  return type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
}

uint64_t sub_8CA50(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_8CA5C(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return type metadata accessor for CATOption(0LL);
}

uint64_t sub_8CA68(uint64_t a1)
{
  *(void *)(v1 + 104) = a1;
  return type metadata accessor for DialogPhase(0LL);
}

uint64_t sub_8CA74(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return type metadata accessor for NLContextUpdate(0LL);
}

  ;
}

  ;
}

void sub_8CAA4()
{
  *(void *)(v0 + 64) = v1;
}

  ;
}

id sub_8CAEC(void *a1)
{
  return [a1 *(SEL *)(v1 + 576)];
}

void sub_8CAF8()
{
}

uint64_t sub_8CB14()
{
  return NLContextUpdate.init()();
}

uint64_t sub_8CB1C()
{
  return static BarbaraWalters.stopThePresses(for:)(v0);
}

uint64_t sub_8CB24()
{
  return type metadata accessor for AlarmBaseCATPatternsExecutor(0LL);
}

uint64_t sub_8CB2C()
{
  return 0LL;
}

uint64_t sub_8CB38(uint64_t result)
{
  *(void *)(v1 + 216) = result;
  return result;
}

void sub_8CB44()
{
}

uint64_t sub_8CB5C()
{
  return *(void *)(v0 + 184);
}

uint64_t sub_8CB68(uint64_t result)
{
  *(void *)(v1 + 248) = result;
  return result;
}

uint64_t sub_8CB74(uint64_t a1, uint64_t a2)
{
  return static BarbaraWalters.logAndReturnError<A>(context:_:)(0xD00000000000006CLL, a2, v2);
}

uint64_t sub_8CB88@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc(*(unsigned int *)(a1 + 4));
}

void sub_8CB9C()
{
}

uint64_t sub_8CBA4()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_8CBB8()
{
  return v0 & 1;
}

uint64_t sub_8CBD4(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  sub_80B4(a1, v1);
  return dispatch thunk of DeviceState.isWatch.getter(v1, v2);
}

uint64_t sub_8CBF8( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 3;
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_8CC0C()
{
}

uint64_t sub_8CC1C()
{
  return AlarmPeriod.rawValue.getter(v0);
}

uint64_t sub_8CC24()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

  ;
}

uint64_t sub_8CC48(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

uint64_t sub_8CC50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return Logger.logObject.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

  ;
}

char *sub_8CC64@<X0>(int *a1@<X8>)
{
  return (char *)a1 + *a1;
}

uint64_t sub_8CC78()
{
  *(void *)(v1 + 472) = v0;
  return static DialogPhase.confirmed.getter();
}

uint64_t sub_8CC84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_8CC8C(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for UpdateAlarmCATsSimple,  (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:),  &qword_D8500);
}

uint64_t sub_8CCA8(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for ModifyAlarmCATPatternsExecutor,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_D8508);
}

uint64_t type metadata accessor for DismissAlarmCATs_Async(uint64_t a1)
{
  uint64_t result = qword_D74A0;
  if (!qword_D74A0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DismissAlarmCATs_Async);
  }
  return result;
}

uint64_t sub_8CCFC(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D8510);
}

uint64_t sub_8CD38(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = v5;
  *(_BYTE *)(v6 + 89) = a3;
  *(_BYTE *)(v6 + 88) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a4;
  unint64_t v7 = (*(void *)(*(void *)(sub_26B0(&qword_D3A08) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 48) = swift_task_alloc(v7);
  *(void *)(v6 + 56) = swift_task_alloc(v7);
  return swift_task_switch(sub_8CDB0, 0LL, 0LL);
}

uint64_t sub_8CDB0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(_BYTE *)(v0 + 89);
  char v4 = *(_BYTE *)(v0 + 88);
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = swift_allocObject(v5, 224LL, 7LL);
  *(void *)(v0 + 64) = v6;
  *(_OWORD *)(v6 + 16) = xmmword_A4A50;
  *(void *)(v6 + 32) = 0x6E6F737265507369LL;
  *(void *)(v6 + 40) = 0xEA00000000006C61LL;
  *(_BYTE *)(v6 + 48) = v4;
  *(void *)(v6 + 72) = &type metadata for Bool;
  *(void *)(v6 + 80) = 0x6E756D6D6F437369LL;
  *(void *)(v6 + 88) = 0xEA00000000006C61LL;
  *(_BYTE *)(v6 + 96) = v3;
  unint64_t v7 = (void *)(v6 + 144);
  *(void *)(v6 + 120) = &type metadata for Bool;
  *(void *)(v6 + 128) = 0x614E656369766564LL;
  *(void *)(v6 + 136) = 0xEA0000000000656DLL;
  sub_4D80(v2, v1, &qword_D3A08);
  uint64_t v8 = type metadata accessor for SpeakableString(0LL);
  int v9 = sub_8D204(v1);
  uint64_t v10 = *(void *)(v0 + 56);
  if (v9 == 1)
  {
    sub_19594(*(void *)(v0 + 56), &qword_D3A08);
    *(_OWORD *)unint64_t v7 = 0u;
    *(_OWORD *)(v6 + 160) = 0u;
  }

  else
  {
    *(void *)(v6 + 168) = v8;
    os_log_type_t v11 = sub_19558(v7);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v11, v10, v8);
  }

  uint64_t v12 = *(void *)(v0 + 48);
  uint64_t v13 = *(void *)(v0 + 32);
  *(void *)(v6 + 176) = 0x656D614E6D6F6F72LL;
  *(void *)(v6 + 184) = 0xE800000000000000LL;
  sub_4D80(v13, v12, &qword_D3A08);
  int v14 = sub_8D204(v12);
  uint64_t v15 = *(void *)(v0 + 48);
  if (v14 == 1)
  {
    sub_19594(*(void *)(v0 + 48), &qword_D3A08);
    *(_OWORD *)(v6 + 192) = 0u;
    *(_OWORD *)(v6 + 208) = 0u;
  }

  else
  {
    *(void *)(v6 + 216) = v8;
    unint64_t v16 = sub_19558((void *)(v6 + 192));
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v16, v15, v8);
  }

  *(void *)(v0 + 72) = v17;
  *unint64_t v17 = v0;
  v17[1] = sub_8CFD4;
  return ((uint64_t (*)(void, unint64_t, unint64_t, uint64_t))v19)( *(void *)(v0 + 16),  0xD000000000000025LL,  0x80000000000AA3B0LL,  v6);
}

uint64_t sub_8CFD4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    return swift_task_switch(sub_8D058, 0LL, 0LL);
  }
  swift_bridgeObjectRelease(*(void *)(v2 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_47D48(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_8D058()
{
  return sub_47D48(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8D098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_8D0E8(a1, a2, a3);
}

uint64_t sub_8D0E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_26B0((uint64_t *)&unk_D36C0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_4D80(a1, (uint64_t)v12, (uint64_t *)&unk_D36C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v13 = CATWrapper.init(templateDir:options:globals:)(v12, v9, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_19594(a1, (uint64_t *)&unk_D36C0);
  return v13;
}

uint64_t sub_8D1FC()
{
  return type metadata accessor for DismissAlarmCATs_Async(0LL);
}

uint64_t sub_8D204(uint64_t a1)
{
  return sub_16880(a1, 1LL, v1);
}

uint64_t type metadata accessor for CreateAlarmCATsSimple(uint64_t a1)
{
  uint64_t result = qword_D74F8;
  if (!qword_D74F8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CreateAlarmCATsSimple);
  }
  return result;
}

uint64_t sub_8D248(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D8520);
}

uint64_t sub_8D284(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_2D94C((uint64_t)sub_8D294);
}

uint64_t sub_8D294()
{
  unint64_t v1 = v0[2];
  uint64_t v2 = sub_26B0(&qword_D3BD0);
  uint64_t v3 = (__n128 *)sub_38F80(v2, 80LL);
  v0[4] = v3;
  uint64_t v4 = sub_75FA4(v3, (__n128)xmmword_A4880);
  if (v1)
  {
    uint64_t v4 = type metadata accessor for AlarmAlarm(v4);
  }

  else
  {
    v3[3].n128_u64[1] = 0LL;
    v3[4].n128_u64[0] = 0LL;
  }

  v3[3].n128_u64[0] = v1;
  v3[4].n128_u64[1] = v4;
  uint64_t v5 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  sub_47DE4();
  uint64_t v6 = (void *)swift_task_alloc(v5);
  v0[5] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_8D35C;
  return sub_47CDC(0xD000000000000027LL, 0x80000000000AA410LL, (uint64_t)v3, v8);
}

uint64_t sub_8D35C()
{
  if (v1) {
    return sub_19744();
  }
  swift_bridgeObjectRelease(*(void *)(v2 + 32));
  return sub_4F354(v0, *(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_8D3AC(uint64_t a1, char a2, char a3, char a4, char a5)
{
  *(_BYTE *)(v6 + 59) = a5;
  *(_BYTE *)(v6 + 58) = a4;
  *(_BYTE *)(v6 + 57) = a3;
  *(_BYTE *)(v6 + 56) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v5;
  return sub_2D94C((uint64_t)sub_8D3CC);
}

uint64_t sub_8D3CC()
{
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_26B0(&qword_D3BD0);
  uint64_t v3 = (__n128 *)sub_38F80(v2, 272LL);
  *(void *)(v0 + 32) = v3;
  uint64_t v4 = sub_75FA4(v3, (__n128)xmmword_A4730);
  if (v1)
  {
    uint64_t v4 = type metadata accessor for AlarmAlarm(v4);
  }

  else
  {
    v3[3].n128_u64[1] = 0LL;
    v3[4].n128_u64[0] = 0LL;
  }

  unsigned __int8 v5 = *(_BYTE *)(v0 + 59);
  unsigned __int8 v6 = *(_BYTE *)(v0 + 58);
  unsigned __int8 v7 = *(_BYTE *)(v0 + 57);
  unsigned __int8 v8 = *(_BYTE *)(v0 + 56);
  v3[3].n128_u64[0] = v1;
  v3[4].n128_u64[1] = v4;
  v3[5].n128_u64[0] = 0xD000000000000014LL;
  v3[5].n128_u64[1] = 0x80000000000A9180LL;
  v3[6].n128_u8[0] = v8;
  v3[7].n128_u64[1] = (unint64_t)&type metadata for Bool;
  v3[8].n128_u64[0] = 0xD000000000000015LL;
  v3[8].n128_u64[1] = 0x80000000000A9160LL;
  v3[9].n128_u8[0] = v7;
  v3[10].n128_u64[1] = (unint64_t)&type metadata for Bool;
  v3[11].n128_u64[0] = 0xD000000000000014LL;
  v3[11].n128_u64[1] = 0x80000000000A85F0LL;
  v3[12].n128_u8[0] = v6;
  v3[13].n128_u64[1] = (unint64_t)&type metadata for Bool;
  v3[14].n128_u64[0] = 0xD000000000000017LL;
  v3[14].n128_u64[1] = 0x80000000000A91A0LL;
  v3[16].n128_u64[1] = (unint64_t)&type metadata for Bool;
  uint64_t v9 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  v3[15].n128_u8[0] = v5;
  sub_47DE4();
  uint64_t v10 = (void *)swift_task_alloc(v9);
  *(void *)(v0 + 40) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_8D35C;
  return sub_47CDC(0xD000000000000021LL, 0x80000000000A91C0LL, (uint64_t)v3, v12);
}

uint64_t sub_8D530(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_2D94C((uint64_t)sub_8D544);
}

uint64_t sub_8D544()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_26B0(&qword_D3BD0);
  uint64_t v3 = sub_38F80(v2, 128LL);
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_A5960;
  *(void *)(v3 + 32) = 0x6D72616C61LL;
  *(void *)(v3 + 40) = 0xE500000000000000LL;
  if (v1)
  {
    uint64_t v4 = type metadata accessor for AlarmAlarm(0LL);
    uint64_t v5 = v1;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
  }

  uint64_t v6 = v0[3];
  *(void *)(v3 + 48) = v5;
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 7368801LL;
  *(void *)(v3 + 88) = 0xE300000000000000LL;
  uint64_t v7 = 0LL;
  if (v6)
  {
    uint64_t v7 = type metadata accessor for SirikitApp(0LL);
  }

  else
  {
    *(void *)(v3 + 104) = 0LL;
    *(void *)(v3 + 112) = 0LL;
  }

  *(void *)(v3 + 96) = v6;
  *(void *)(v3 + 120) = v7;
  uint64_t v8 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  sub_47DE4();
  swift_retain(v6);
  uint64_t v9 = (void *)swift_task_alloc(v8);
  v0[6] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_8D66C;
  return sub_47CDC(0xD000000000000032LL, 0x80000000000A9220LL, v3, v11);
}

uint64_t sub_8D66C(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 48);
  uint64_t v5 = *v2;
  *(void *)(v5 + 56) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    return sub_19744();
  }
  swift_bridgeObjectRelease(*(void *)(v5 + 40));
  return sub_4F354(a1, *(uint64_t (**)(void))(v5 + 8));
}

uint64_t sub_8D6DC()
{
  return sub_1B5EC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8D708()
{
  return type metadata accessor for CreateAlarmCATsSimple(0LL);
}

uint64_t sub_8D710()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7560);
  sub_26F0(v0, (uint64_t)qword_D7560);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_8D758@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_26B0(&qword_D37A8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_26B0(&qword_D37D0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_D31C8 != -1) {
    swift_once(&qword_D31C8, sub_8D710);
  }
  uint64_t v10 = sub_16C80();
  uint64_t v11 = (os_log_s *)sub_26F0(v10, (uint64_t)qword_D7560);
  Logger.logObject.getter(v11, v12, v13, v14, v15, v16, v17, v18);
  os_log_type_t v19 = sub_16C50();
  if (sub_286C4(v19))
  {
    uint64_t v20 = (_WORD *)sub_16AC4(2LL);
    *uint64_t v20 = 0;
    sub_9054C(&dword_0, v11, v21, "UpdateAlarm.NeedsValueStrategy.actionForInput() called)");
    sub_16AA8((uint64_t)v20);
  }

  uint64_t v22 = type metadata accessor for HALAlarmDeviceContext(0LL);
  sub_23050((uint64_t)v9, v23, v24, v22);
  uint64_t v25 = enum case for DecideAction.PromptExpectation.slot(_:);
  uint64_t v26 = type metadata accessor for DecideAction.PromptExpectation(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104LL))(v6, v25, v26);
  sub_84834((uint64_t)v6);
  sub_30854(a1, (uint64_t)v9, 0, (uint64_t)v6, a2);
  sub_19594((uint64_t)v6, &qword_D37A8);
  return sub_19594((uint64_t)v9, &qword_D37D0);
}

uint64_t sub_8D908(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = sub_16C80();
  v2[5] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[6] = v4;
  v2[7] = sub_19754(v4);
  uint64_t v5 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  _BYTE v2[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[9] = v6;
  v2[10] = sub_19754(v6);
  uint64_t v7 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[11] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[12] = v8;
  v2[13] = sub_250D0(v8);
  v2[14] = sub_19884();
  uint64_t v9 = type metadata accessor for NLContextUpdate(0LL);
  v2[15] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[16] = v10;
  v2[17] = sub_250D0(v10);
  v2[18] = sub_19884();
  uint64_t v11 = type metadata accessor for DialogPhase(0LL);
  v2[19] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[20] = v12;
  v2[21] = sub_19754(v12);
  uint64_t v13 = type metadata accessor for ParameterIdentifier(0LL);
  v2[22] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[23] = v14;
  v2[24] = sub_19754(v14);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8D9E8()
{
  uint64_t v86 = v1;
  uint64_t v87 = v2;
  uint64_t v85 = v0;
  uint64_t v3 = v0[23];
  uint64_t v4 = sub_26B0(&qword_D6CB8);
  uint64_t v5 = ((uint64_t (*)(uint64_t))ParameterResolutionRecord.parameter.getter)(v4);
  uint64_t v6 = ((uint64_t (*)(uint64_t))ParameterIdentifier.name.getter)(v5);
  unint64_t v8 = v7;
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (qword_D31C8 != -1) {
    swift_once(&qword_D31C8, sub_8D710);
  }
  uint64_t v9 = sub_26F0(v0[5], (uint64_t)qword_D7560);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v9, v10, v11, v12, v13, v14, v15, v16);
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    os_log_type_t v19 = (_WORD *)sub_16AC4(2LL);
    *os_log_type_t v19 = 0;
    sub_9054C(&dword_0, v17, v20, "UpdateAlarm.NeedsValueStrategy.makePromptForValue() called)");
    sub_16AA8((uint64_t)v19);
  }

  uint64_t v21 = swift_bridgeObjectRetain_n(v8, 2LL);
  uint64_t v29 = (os_log_s *)Logger.logObject.getter(v21, v22, v23, v24, v25, v26, v27, v28);
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v83 = (uint64_t)(v0 + 2);
    uint64_t v31 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v32 = sub_16AC4(32LL);
    uint64_t v84 = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    swift_bridgeObjectRetain(v8);
    v0[2] = sub_3D10(v6, v8, &v84);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease_n(v8, 3LL);
    sub_16BD0(&dword_0, v29, v30, "makeParameterPromptDialog for parameterName=%s", v31);
    sub_16BB4(v32);
    sub_16AA8(v32);
    sub_16AA8((uint64_t)v31);
  }

  else
  {
    swift_bridgeObjectRelease_n(v8, 2LL);
  }

  static DialogPhase.clarification.getter(v33);
  if (v6 == 0x6465736F706F7270LL && v8 == 0xED00006C6562614CLL)
  {
    swift_bridgeObjectRelease(0xED00006C6562614CLL);
  }

  else
  {
    char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6465736F706F7270LL, 0xED00006C6562614CLL, v6, v8, 0LL);
    sub_16D58();
    if ((v35 & 1) == 0)
    {
      sub_7ABA8();
      Logger.logObject.getter(v36, v37, v38, v39, v40, v41, v42, v43);
      os_log_type_t v44 = static os_log_type_t.default.getter();
      if (sub_16C38(v44))
      {
        os_log_type_t v45 = (_WORD *)sub_16AC4(2LL);
        *os_log_type_t v45 = 0;
        sub_286B0(&dword_0, v46, v47, "UpdateAlarm.NeedsValueStrategy.makePromptForValue() #Response time prompt");
        sub_16AA8((uint64_t)v45);
      }

      sub_90524();
      uint64_t v49 = sub_4574C(v48, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:));
      sub_904C8(v49, v50, v51, v52, v53, v54, v55, v56, v83, v9);
      uint64_t v57 = mach_absolute_time();
      sub_904B4(v57);
      if (qword_D31C0 != -1) {
        swift_once(&qword_D31C0, sub_8CCA8);
      }
      uint64_t v58 = (void *)swift_task_alloc(dword_D621C);
      v0[30] = v58;
      *uint64_t v58 = v0;
      v58[1] = sub_8DF74;
      return sub_6A804();
    }
  }

  sub_7AE8C();
  Logger.logObject.getter(v60, v61, v62, v63, v64, v65, v66, v67);
  os_log_type_t v68 = static os_log_type_t.default.getter();
  if (sub_16C38(v68))
  {
    uint64_t v69 = (_WORD *)sub_16AC4(2LL);
    *uint64_t v69 = 0;
    sub_286B0(&dword_0, v70, v71, "UpdateAlarm.NeedsValueStrategy.makePromptForValue() #Response label prompt");
    sub_16AA8((uint64_t)v69);
  }

  sub_90524();
  uint64_t v73 = sub_4574C(v72, enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:));
  sub_904C8(v73, v74, v75, v76, v77, v78, v79, v80, v83, v9);
  uint64_t v81 = mach_absolute_time();
  sub_904B4(v81);
  if (qword_D31C0 != -1) {
    swift_once(&qword_D31C0, sub_8CCA8);
  }
  uint64_t v82 = (void *)swift_task_alloc(dword_D6214);
  v0[25] = v82;
  *uint64_t v82 = v0;
  v82[1] = sub_8DE04;
  return sub_6A7A4();
}

uint64_t sub_8DE04()
{
  uint64_t v4 = *v3;
  *uint64_t v5 = v4;
  v2[26] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_19840();
    return sub_19744();
  }

  else
  {
    v2[27] = v0;
    unint64_t v7 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[28] = v7;
    *unint64_t v7 = v4;
    v7[1] = sub_8DE8C;
    sub_90604();
    return sub_25154();
  }

uint64_t sub_8DE8C()
{
  uint64_t v3 = *(void **)(v2 + 216);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc();

  sub_19840();
  return sub_251A8();
}

uint64_t sub_8DEE0()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  sub_90534();
  v7(v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v6);
  sub_1704C(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_197C0();
  sub_19830();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_19764(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8DF74()
{
  uint64_t v4 = *v3;
  *uint64_t v5 = v4;
  v2[31] = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_19840();
    return sub_19744();
  }

  else
  {
    v2[32] = v0;
    unint64_t v7 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
    v2[33] = v7;
    *unint64_t v7 = v4;
    v7[1] = sub_8DFFC;
    sub_90604();
    return sub_25154();
  }

uint64_t sub_8DFFC()
{
  uint64_t v3 = *(void **)(v2 + 256);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 272) = v0;
  swift_task_dealloc();

  sub_19840();
  return sub_251A8();
}

uint64_t sub_8E050()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 120);
  sub_90534();
  v6(v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v5);
  sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_1978C();
  sub_19794();
  sub_19830();
  sub_19808();
  swift_task_dealloc();
  sub_19800();
  swift_task_dealloc();
  swift_task_dealloc();
  return sub_19764(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8E0E0()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8E14C()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8E1B0()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8E21C()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8E280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  v3[18] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[19] = v5;
  v3[20] = sub_19754(v5);
  uint64_t v6 = type metadata accessor for USOParse(0LL);
  v3[21] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[22] = v7;
  v3[23] = sub_19754(v7);
  uint64_t v8 = type metadata accessor for Input(0LL);
  v3[24] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[25] = v9;
  v3[26] = sub_250D0(v9);
  v3[27] = sub_19884();
  v3[28] = sub_19884();
  uint64_t v10 = type metadata accessor for DateComponents(0LL);
  v3[29] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[30] = v11;
  v3[31] = sub_19754(v11);
  uint64_t v12 = sub_26B0(&qword_D37D8);
  v3[32] = v12;
  v3[33] = sub_250D0(*(void *)(v12 - 8));
  v3[34] = sub_19884();
  v3[35] = sub_19884();
  v3[36] = sub_19884();
  v3[37] = sub_19884();
  v3[38] = sub_19884();
  v3[39] = sub_19884();
  v3[40] = sub_19884();
  v3[41] = sub_19884();
  uint64_t v13 = type metadata accessor for NLIntent(0LL);
  v3[42] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v3[43] = v14;
  v3[44] = sub_250D0(v14);
  v3[45] = sub_19884();
  uint64_t v15 = type metadata accessor for Parse(0LL);
  v3[46] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v3[47] = v16;
  v3[48] = sub_250D0(v16);
  v3[49] = sub_19884();
  sub_19840();
  return sub_1988C();
}

uint64_t sub_8E3D4()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = v0 + 4;
  uint64_t v3 = v0 + 5;
  v455 = v0 + 10;
  uint64_t v4 = v0 + 11;
  uint64_t v5 = v0[49];
  uint64_t v6 = v0[47];
  uint64_t v7 = *(void *)(v1 + 368);
  uint64_t v8 = sub_26B0(&qword_D6CB8);
  id v9 = (id)ParameterResolutionRecord.intent.getter(v8);
  Input.parse.getter(v9);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v5, v7);
  if (v10 == enum case for Parse.NLv3IntentOnly(_:))
  {
    v442 = v2;
    uint64_t v11 = *(os_log_s **)(v1 + 392);
    uint64_t v12 = *(void *)(v1 + 360);
    uint64_t v14 = *(void *)(v1 + 336);
    uint64_t v13 = *(void *)(v1 + 344);
    sub_286A4(*(void *)(v1 + 376));
    (*(void (**)(uint64_t, os_log_s *, uint64_t))(v13 + 32))(v12, v11, v14);
    if (qword_D31C8 != -1) {
      swift_once(&qword_D31C8, sub_8D710);
    }
    uint64_t v15 = sub_16C80();
    sub_26F0(v15, (uint64_t)qword_D7560);
    id v16 = v9;
    sub_90630((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23, v400, v403, v406, v410, v416);
    os_log_type_t v24 = sub_16C50();
    if (sub_90478(v24))
    {
      v435 = v4;
      uint64_t v25 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v429 = sub_16AC4(32LL);
      *(void *)&__int128 v461 = v429;
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v26 = v2;
      id v27 = [v26 description];
      static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      sub_90590();
      unint64_t v29 = v28;

      uint64_t v30 = sub_90514();
      uint64_t v32 = sub_3D10(v30, v29, v31);
      uint64_t v33 = sub_286DC(v32, v455);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v33, v435, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease(v29);

      sub_16BD0(&dword_0, v11, (os_log_type_t)v9, "Current SK intent: %s", v25);
      sub_16BB4(v429);
      sub_16AA8(v429);
      sub_16AA8((uint64_t)v25);
    }

    else
    {
    }

    uint64_t v50 = *(void *)(v1 + 352);
    uint64_t v51 = *(void *)(v1 + 328);
    (*(void (**)(uint64_t, void, void))(*(void *)(v1 + 344) + 16LL))( v50,  *(void *)(v1 + 360),  *(void *)(v1 + 336));
    uint64_t v52 = type metadata accessor for AlarmNLIntent(0LL);
    swift_allocObject(v52, *(unsigned int *)(v52 + 48), *(unsigned __int16 *)(v52 + 52));
    uint64_t v53 = sub_716E4(v50);
    Class isa = (Class)v53;
    sub_73098(v51);
    sub_905CC();
    if (!v55)
    {
      uint64_t v56 = *(void *)(v1 + 240);
      Class isa = DateComponents._bridgeToObjectiveC()().super.isa;
      sub_250E4(*(uint64_t (**)(uint64_t, uint64_t))(v56 + 8));
    }

    sub_2865C(v2, "setProposedTime:");

    uint64_t v57 = (void *)sub_735C4();
    sub_2865C(v2, "setProposedMeridiemSetByUser:");

    sub_70490();
    if (v58)
    {
      uint64_t v59 = v58;
      NSString v60 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v59);
    }

    else
    {
      NSString v60 = 0LL;
    }

    sub_2865C(v2, "setProposedLabel:");

    uint64_t v81 = v2;
    sub_90630((uint64_t)v81, v82, v83, v84, v85, v86, v87, v88, v401, v404, v407, v411, v417);
    os_log_type_t v89 = sub_16C50();
    if (sub_905BC((os_log_s *)v60))
    {
      uint64_t v90 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v437 = sub_16AC4(32LL);
      *(void *)&__int128 v461 = v437;
      *(_DWORD *)uint64_t v90 = 136315138;
      uint64_t v91 = v2;
      uint64_t v92 = sub_904DC((uint64_t)[v91 description]);
      uint64_t v93 = v53;
      uint64_t v95 = v94;

      uint64_t v1 = 12LL;
      uint64_t v97 = sub_9059C(v92, v96, (uint64_t *)&v461);
      uint64_t v98 = sub_286DC(v97, v442);
      sub_16F1C((uint64_t)v98, v99, (uint64_t)(v90 + 4));
      uint64_t v100 = v95;
      uint64_t v53 = v93;
      swift_bridgeObjectRelease(v100);

      sub_16BD0(&dword_0, (os_log_s *)v60, v89, "Updated SK intent: %s", v90);
      sub_16BB4(v437);
      sub_16AA8(v437);
      sub_16AA8((uint64_t)v90);
    }

    else
    {
    }

    uint64_t v101 = *(void *)(v1 + 120);
    sub_9056C();
    double v102 = sub_90574();
    IntentPromptAnswer.init(answeredValue:updatedIntent:)(v102);
    swift_release(v53);
    uint64_t v103 = sub_90618();
    v104(v103);
    goto LABEL_27;
  }

  BOOL v34 = v2;
  if (v10 == enum case for Parse.NLv3IntentPlusServerConversion(_:))
  {
    uint64_t v35 = *(void *)(v1 + 392);
    sub_286A4(*(void *)(v1 + 376));
    uint64_t v36 = sub_26B0(&qword_D3768);
    uint64_t v37 = *(void *)(v35 + *(int *)(v36 + 48));
    v432 = (void *)Parse.ServerConversion.siriKitIntent.getter(v36);
    uint64_t v448 = sub_9056C();
    uint64_t v38 = (void *)swift_dynamicCastClassUnconditional(v432, v448, 0LL, 0LL, 0LL);
    id v39 = [v38 proposedTime];
    uint64_t v42 = *(void *)(v1 + 312);
    if (v39)
    {
      uint64_t v43 = v39;
      uint64_t v44 = *(void *)(v1 + 240);
      uint64_t v4 = *(void **)(v1 + 248);
      uint64_t v45 = *(void *)(v1 + 232);
      static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v39);

      uint64_t v46 = *(void (**)(uint64_t, void *, uint64_t))(v44 + 32);
      v46(v42, v4, v45);
      sub_84834(v42);
      uint64_t v47 = sub_16880(v42, 1LL, v45);
      if ((_DWORD)v47 != 1)
      {
        uint64_t v48 = *(void *)(v1 + 320);
        uint64_t v49 = *(void *)(v1 + 232);
        v46(v48, *(void **)(v1 + 312), v49);
        sub_A40C(v48, 0LL, 1LL, v49);
LABEL_48:
        v446 = v38;
        if (qword_D31C8 != -1) {
          swift_once(&qword_D31C8, sub_8D710);
        }
        uint64_t v175 = sub_16C80();
        uint64_t v176 = (uint64_t (**)(uint64_t, uint64_t))sub_26F0(v175, (uint64_t)qword_D7560);
        uint64_t v177 = sub_90618();
        uint64_t v179 = sub_9039C(v177, v178);
        uint64_t v180 = (os_log_s *)v176;
        Logger.logObject.getter(v179, v181, v182, v183, v184, v185, v186, v187);
        os_log_type_t v188 = sub_16C50();
        BOOL v189 = sub_16D30(v188);
        uint64_t v190 = *(void *)(v1 + 296);
        uint64_t v440 = v37;
        if (v189)
        {
          uint64_t v191 = v176;
          uint64_t v192 = *(void *)(v1 + 288);
          uint64_t v414 = *(void *)(v1 + 256);
          uint64_t v193 = (uint8_t *)sub_16AC4(12LL);
          uint64_t v194 = sub_16AC4(32LL);
          *(void *)&__int128 v461 = v194;
          *(_DWORD *)uint64_t v193 = 136315138;
          sub_9039C(v190, v192);
          uint64_t v195 = v192;
          uint64_t v176 = v191;
          uint64_t v196 = String.init<A>(describing:)(v195, v414);
          unint64_t v198 = v197;
          *(void *)(v1 + 72) = sub_3D10(v196, v197, (uint64_t *)&v461);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v455, v193 + 4, v193 + 12);
          swift_bridgeObjectRelease(v198);
          sub_19594(v190, &qword_D37D8);
          sub_16BD0(&dword_0, v180, (os_log_type_t)v4, "Proposed Time: %s", v193);
          sub_16BB4(v194);
          sub_16AA8(v194);
          sub_16AA8((uint64_t)v193);
        }

        else
        {
          sub_19594(v190, &qword_D37D8);
        }

        id v200 = sub_905C4(v199, "alarm");
        if (!v200 || (sub_902E4(v200), !v201)) {
          swift_bridgeObjectRelease(0LL);
        }
        uint64_t v202 = *(void *)(v1 + 320);
        uint64_t v203 = *(void *)(v1 + 280);
        type metadata accessor for AlarmSearch(0LL);
        uint64_t v204 = sub_90618();
        Class v206 = v205;
        sub_1B654(v204, v207);
        sub_90490();
        sub_2865C(v9, "setAlarmSearch:");

        objc_msgSend(v9, "setOperation:", sub_905F0(v208, "operation"));
        sub_9039C(v202, v203);
        sub_905CC();
        if (!v55)
        {
          LOBYTE(v203) = (_BYTE)v176;
          Class v206 = sub_905B0().super.isa;
          sub_24FE0(v176[1]);
        }

        sub_2865C(v9, "setProposedTime:");

        id v210 = sub_905F0(v209, "proposedMeridiemSetByUser");
        sub_2865C(v9, "setProposedMeridiemSetByUser:");

        sub_90344(v446);
        if (v211)
        {
          sub_90588();
          sub_90490();
        }

        else
        {
          id v210 = 0LL;
        }

        sub_2865C(v9, "setProposedLabel:");

        id v212 = v9;
        uint64_t v213 = v176;
        Logger.logObject.getter(v212, v214, v215, v216, v217, v218, v219, v220);
        os_log_type_t v221 = sub_16C50();
        if (sub_16D30(v221))
        {
          uint64_t v222 = (uint8_t *)sub_16AC4(12LL);
          uint64_t v223 = (void *)sub_16AC4(8LL);
          *(_DWORD *)uint64_t v222 = 138412290;
          *(void *)(v1 + 112) = v212;
          id v224 = v212;
          sub_90590();
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 112, v1 + 120, v222 + 4, v222 + 12);
          *uint64_t v223 = v212;

          uint64_t v1 = 12LL;
          sub_16BD0(&dword_0, (os_log_s *)v176, (os_log_type_t)v203, "Updated intent: %@", v222);
          sub_26B0(&qword_D3858);
          sub_16BB4((uint64_t)v223);
          sub_16AA8((uint64_t)v223);
          sub_16AA8((uint64_t)v222);
        }

        else
        {

          uint64_t v213 = (uint64_t (**)(uint64_t, uint64_t))v212;
        }

        uint64_t v225 = *(void *)(v1 + 392);
        uint64_t v226 = *(void *)(v1 + 344);
        uint64_t v227 = *(void *)(v1 + 320);
        uint64_t v228 = *(void *)(v1 + 120);

        __int128 v461 = 0u;
        __int128 v462 = 0u;
        IntentPromptAnswer.init(answeredValue:updatedIntent:)(0.0);

        swift_release(v440);
        sub_19594(v227, &qword_D37D8);
        uint64_t v229 = sub_26B0(&qword_D7678);
        sub_17508(v228, 0LL, v230, v229);
        sub_1704C(v225, *(uint64_t (**)(uint64_t, uint64_t))(v226 + 8));
        goto LABEL_65;
      }
    }

    else
    {
      uint64_t v47 = sub_23050(*(void *)(v1 + 312), v40, v41, *(void *)(v1 + 232));
    }

    id v140 = sub_905F0(v47, "alarmSearch");
    if (v140)
    {
      uint64_t v143 = v140;
      id v144 = [v140 time];

      if (v144)
      {
        static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v144);

        uint64_t v146 = 0LL;
      }

      else
      {
        uint64_t v146 = 1LL;
      }

      uint64_t v173 = *(void *)(v1 + 320);
      uint64_t v174 = *(void *)(v1 + 304);
      sub_17508(v174, v146, v145, *(void *)(v1 + 232));
      sub_5AA0(v174, v173);
    }

    else
    {
      sub_23050(*(void *)(v1 + 320), v141, v142, *(void *)(v1 + 232));
    }

    sub_19594(*(void *)(v1 + 312), &qword_D37D8);
    goto LABEL_48;
  }

  uint64_t v61 = v1 + 24;
  if (v10 == enum case for Parse.NLv4IntentOnly(_:))
  {
    uint64_t v443 = v1 + 24;
    uint64_t v62 = *(void **)(v1 + 392);
    sub_286A4(*(void *)(v1 + 376));
    uint64_t v63 = *v62;
    uint64_t ObjectType = swift_getObjectType(*v62);
    uint64_t v65 = SIRINLUUserDialogAct.firstUsoTask.getter(ObjectType);
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = sub_9056C();
      uint64_t v68 = swift_retain(v66);
      uint64_t v69 = (os_log_s *)v67;
      sub_54B88(v68);
      if (v70)
      {
        v456 = v70;
        if (qword_D31C8 != -1) {
          swift_once(&qword_D31C8, sub_8D710);
        }
        v418 = (uint64_t *)(v1 + 104);
        uint64_t v71 = sub_16C80();
        sub_26F0(v71, (uint64_t)qword_D7560);
        id v72 = v9;
        sub_1716C();
        os_log_type_t v73 = sub_16C50();
        v444 = v72;
        uint64_t v449 = v63;
        v436 = v4;
        if (sub_90478(v73))
        {
          uint64_t v74 = (uint8_t *)sub_16AC4(12LL);
          uint64_t v412 = sub_16AC4(32LL);
          *(void *)&__int128 v461 = v412;
          *(_DWORD *)uint64_t v74 = 136315138;
          id v75 = v72;
          id v76 = [v75 description];
          static String._unconditionallyBridgeFromObjectiveC(_:)(v76);
          sub_90590();
          unint64_t v78 = v77;

          uint64_t v79 = sub_90514();
          uint64_t *v418 = sub_3D10(v79, v78, v80);
          sub_16F1C((uint64_t)v418, v1 + 112, (uint64_t)(v74 + 4));
          swift_bridgeObjectRelease(v78);

          sub_16BD0(&dword_0, v69, (os_log_type_t)v9, "Current SK intent: %s", v74);
          sub_16BB4(v412);
          sub_16AA8(v412);
          sub_16AA8((uint64_t)v74);
        }

        else
        {
        }

        id v280 = v456;
        sub_1716C();
        os_log_type_t v281 = sub_16C50();
        v459 = v280;
        uint64_t v428 = v1 + 96;
        if (sub_90478(v281))
        {
          v282 = (uint8_t *)sub_16AC4(12LL);
          uint64_t v409 = sub_16AC4(32LL);
          *(void *)&__int128 v461 = v409;
          *(_DWORD *)v282 = 136315138;
          id v283 = v280;
          v284 = (uint64_t *)(v1 + 96);
          id v285 = v283;
          uint64_t v286 = sub_904DC((uint64_t)[v283 description]);
          unint64_t v288 = v287;

          uint64_t v1 = 12LL;
          uint64_t *v284 = sub_3D10(v286, v288, (uint64_t *)&v461);
          sub_16F1C((uint64_t)v284, (uint64_t)v418, (uint64_t)(v282 + 4));
          id v280 = v459;
          swift_bridgeObjectRelease(v288);

          sub_16BD0(&dword_0, v69, (os_log_type_t)v9, "This turn of updateAlarmIntent: %s", v282);
          sub_16BB4(v409);
          sub_16AA8(v409);
          sub_16AA8((uint64_t)v282);
        }

        else
        {
        }

        id v289 = [v280 proposedTime];
        if (v289)
        {
          v292 = v289;
          uint64_t v293 = *(void *)(v1 + 240);
          sub_905A4();

          sub_9055C(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v293 + 32));
          sub_28628();
          if (!v55)
          {
            v294.super.Class isa = sub_905B0().super.isa;
            sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v293 + 8));
LABEL_85:
            sub_2865C(v444, "setProposedTime:");

            id v295 = [v280 proposedMeridiemSetByUser];
            sub_2865C(v444, "setProposedMeridiemSetByUser:");

            sub_90344(v280);
            if (v296)
            {
              sub_90588();
              sub_90490();
            }

            else
            {
              id v295 = 0LL;
            }

            sub_2865C(v444, "setProposedLabel:");

            id v297 = v444;
            sub_1716C();
            os_log_type_t v298 = sub_16C50();
            if (sub_90478(v298))
            {
              v299 = (uint8_t *)sub_16AC4(12LL);
              uint64_t v447 = sub_16AC4(32LL);
              *(void *)&__int128 v461 = v447;
              *(_DWORD *)v299 = 136315138;
              id v300 = v297;
              id v301 = [v300 description];
              uint64_t v302 = static String._unconditionallyBridgeFromObjectiveC(_:)(v301);
              uint64_t v303 = v1;
              unint64_t v305 = v304;

              uint64_t v306 = sub_3D10(v302, v305, (uint64_t *)&v461);
              v307 = sub_286DC(v306, v436);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(v307, v428, v299 + 4, v299 + 12);
              unint64_t v308 = v305;
              uint64_t v1 = v303;
              swift_bridgeObjectRelease(v308);

              sub_16BD0(&dword_0, (os_log_s *)v295, (os_log_type_t)v9, "Updated SK intent: %s", v299);
              sub_16BB4(v447);
              sub_16AA8(v447);
              sub_16AA8((uint64_t)v299);
            }

            else
            {
            }

            uint64_t v309 = *(void *)(v1 + 120);
            __int128 v461 = 0u;
            __int128 v462 = 0u;
            IntentPromptAnswer.init(answeredValue:updatedIntent:)(0.0);
            sub_4AF88();

            swift_unknownObjectRelease(v449);
            uint64_t v106 = sub_26B0(&qword_D7678);
            uint64_t v107 = v309;
            goto LABEL_28;
          }
        }

        else
        {
          sub_23050(*(void *)(v1 + 272), v290, v291, *(void *)(v1 + 232));
        }

        v294.super.Class isa = 0LL;
        goto LABEL_85;
      }

      sub_4AF88();
    }

    if (qword_D31C8 != -1) {
      swift_once(&qword_D31C8, sub_8D710);
    }
    v441 = (_BYTE *)(v1 + 400);
    uint64_t v246 = *(void *)(v1 + 224);
    uint64_t v247 = *(void *)(v1 + 192);
    uint64_t v248 = *(void *)(v1 + 200);
    uint64_t v249 = *(void *)(v1 + 128);
    uint64_t v250 = sub_16C80();
    sub_26F0(v250, (uint64_t)qword_D7560);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v248 + 16))(v246, v249, v247);
    v251 = (os_log_s *)sub_1716C();
    os_log_type_t v252 = static os_log_type_t.error.getter();
    if (sub_905BC(v251))
    {
      uint64_t v253 = *(void *)(v1 + 384);
      uint64_t v254 = *(void *)(v1 + 368);
      uint64_t v426 = v1 + 16;
      uint64_t v430 = *(void *)(v1 + 200);
      uint64_t v452 = v63;
      v255 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v256 = sub_16AC4(32LL);
      uint64_t v458 = v1;
      *(void *)&__int128 v461 = v256;
      uint64_t v257 = v256;
      *(_DWORD *)v255 = 136315138;
      Input.parse.getter(v256);
      uint64_t v258 = String.init<A>(describing:)(v253, v254);
      *(void *)(v458 + 16) = sub_90508( v258,  v259,  v260,  v261,  v262,  v263,  v264,  v265,  v400,  v403,  v406,  v410,  v416,  v426);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v427, v443, v255 + 4, v255 + 12);
      sub_16D58();
      sub_90488(*(uint64_t (**)(uint64_t))(v430 + 8));
      sub_16BD0(&dword_0, v251, v252, "Failed to parse userDialogAct to UpdateAlarmIntent: %s", v255);
      sub_16BB4(v257);
      uint64_t v266 = v257;
      uint64_t v1 = v458;
      sub_16AA8(v266);
      uint64_t v267 = (uint64_t)v255;
      uint64_t v63 = v452;
      sub_16AA8(v267);
    }

    else
    {
      sub_19838(*(void *)(v1 + 200));
    }

    _BYTE *v441 = 0;
    uint64_t v268 = sub_26B0(&qword_D4190);
    unint64_t v269 = sub_24EA4();
    swift_allocError(v268, v269, 0LL, 0LL);
    unint64_t v270 = sub_28664();
    uint64_t v272 = static BarbaraWalters.logAndReturnError<A>(context:_:)(v270, v271, v441);
    sub_904E8(v272, v273, v274, v275, v276, v277, v278, v279);

    swift_unknownObjectRelease(v63);
LABEL_100:
    sub_903E8(*(void *)(v1 + 392));
    sub_19828();
    sub_19820();
    sub_1987C();
    sub_19800();
    sub_19808();
    sub_1978C();
    sub_19794();
    sub_197C0();
    sub_19830();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v231 = *(uint64_t (**)(void))(v1 + 8);
    return v231();
  }

  if (v10 != enum case for Parse.uso(_:))
  {
    v420 = v9;
    uint64_t v147 = v1 + 402;
    if (qword_D31C8 != -1) {
      swift_once(&qword_D31C8, sub_8D710);
    }
    uint64_t v148 = sub_16C80();
    sub_26F0(v148, (uint64_t)qword_D7560);
    uint64_t v149 = sub_904F4();
    uint64_t v157 = (os_log_s *)Logger.logObject.getter(v149, v150, v151, v152, v153, v154, v155, v156);
    os_log_type_t v158 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v157, v158))
    {
      uint64_t v159 = *(void *)(v1 + 384);
      uint64_t v433 = *(void *)(v1 + 368);
      uint64_t v439 = *(void *)(v1 + 200);
      uint64_t v451 = v1 + 402;
      uint64_t v160 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v161 = sub_16AC4(32LL);
      uint64_t v457 = v1;
      *(void *)&__int128 v461 = v161;
      uint64_t v162 = v161;
      *(_DWORD *)uint64_t v160 = 136315138;
      Input.parse.getter(v161);
      uint64_t v163 = String.init<A>(describing:)(v159, v433);
      *(void *)(v457 + 24) = sub_90508( v163,  v164,  v165,  v166,  v167,  v168,  v169,  v170,  v400,  v403,  v406,  v410,  (uint64_t)v420,  v424);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v61, v34, v160 + 4, v160 + 12);
      sub_16D58();
      sub_90488(*(uint64_t (**)(uint64_t))(v439 + 8));
      sub_16BD0(&dword_0, v157, v158, "Received an unsupported input: %s", v160);
      sub_16BB4(v162);
      uint64_t v171 = v162;
      uint64_t v1 = v457;
      sub_16AA8(v171);
      uint64_t v172 = (uint64_t)v160;
      uint64_t v147 = v451;
      sub_16AA8(v172);
    }

    else
    {
      sub_19838(*(void *)(v1 + 200));
    }

    uint64_t v233 = *(void *)(v1 + 392);
    uint64_t v234 = *(void *)(v1 + 376);
    *(_BYTE *)(v1 + 402) = 0;
    sub_26B0(&qword_D4190);
    unint64_t v235 = sub_24EA4();
    sub_9049C(v235);
    unint64_t v236 = sub_28664();
    uint64_t v238 = sub_90624(v236, v237, v147);
    sub_904E8(v238, v239, v240, v241, v242, v243, v244, v245);

    goto LABEL_99;
  }

  v445 = (void *)(v1 + 48);
  uint64_t v108 = *(void *)(v1 + 392);
  uint64_t v110 = *(void *)(v1 + 176);
  uint64_t v109 = *(void *)(v1 + 184);
  uint64_t v112 = *(void *)(v1 + 160);
  uint64_t v111 = *(void *)(v1 + 168);
  uint64_t v114 = *(void *)(v1 + 144);
  uint64_t v113 = *(void *)(v1 + 152);
  sub_286A4(*(void *)(v1 + 376));
  uint64_t v115 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v110 + 32))(v109, v108, v111);
  uint64_t v116 = USOParse.userParse.getter(v115);
  uint64_t v117 = Siri_Nlu_External_UserParse.firstUsoTask.getter(v116);
  (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v112, v114);
  if (!v117)
  {
LABEL_93:
    v453 = v3;
    uint64_t v310 = v1 + 401;
    if (qword_D31C8 != -1) {
      swift_once(&qword_D31C8, sub_8D710);
    }
    uint64_t v311 = sub_16C80();
    sub_26F0(v311, (uint64_t)qword_D7560);
    uint64_t v312 = sub_904F4();
    v320 = (os_log_s *)Logger.logObject.getter(v312, v313, v314, v315, v316, v317, v318, v319);
    os_log_type_t v321 = static os_log_type_t.error.getter();
    if (sub_905BC(v320))
    {
      uint64_t v322 = *(void *)(v1 + 384);
      uint64_t v323 = *(void *)(v1 + 368);
      uint64_t v434 = *(void *)(v1 + 200);
      v324 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v421 = (uint64_t)v9;
      uint64_t v325 = sub_16AC4(32LL);
      *(void *)&__int128 v461 = v325;
      *(_DWORD *)v324 = 136315138;
      Input.parse.getter(v325);
      uint64_t v326 = v323;
      uint64_t v310 = v1 + 401;
      uint64_t v327 = String.init<A>(describing:)(v322, v326);
      *(void *)(v1 + 40) = sub_90508( v327,  v328,  v329,  v330,  v331,  v332,  v333,  v334,  v400,  v403,  v406,  v410,  v421,  v424);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v453, v445, v324 + 4, v324 + 12);
      sub_16D58();
      sub_90488(*(uint64_t (**)(uint64_t))(v434 + 8));
      sub_16BD0(&dword_0, v320, v321, "Failed to parse userDialogAct to UpdateAlarmIntent: %s", v324);
      sub_16BB4(v325);
      uint64_t v335 = v325;
      id v9 = v422;
      sub_16AA8(v335);
      sub_16AA8((uint64_t)v324);
    }

    else
    {
      sub_19838(*(void *)(v1 + 200));
    }

    uint64_t v234 = *(void *)(v1 + 176);
    uint64_t v233 = *(void *)(v1 + 184);
    *(_BYTE *)(v1 + 401) = 0;
    sub_26B0(&qword_D4190);
    unint64_t v336 = sub_24EA4();
    sub_9049C(v336);
    unint64_t v337 = sub_28664();
    uint64_t v339 = sub_90624(v337, v338, v310);
    sub_904E8(v339, v340, v341, v342, v343, v344, v345, v346);

LABEL_99:
    sub_1704C(v233, *(uint64_t (**)(uint64_t, uint64_t))(v234 + 8));
    goto LABEL_100;
  }

  uint64_t v118 = sub_9056C();
  uint64_t v119 = swift_retain(v117);
  uint64_t v120 = (os_log_s *)v118;
  sub_54B88(v119);
  if (!v121)
  {
    sub_4AF88();
    goto LABEL_93;
  }

  uint64_t v122 = v121;
  if (qword_D31C8 != -1) {
    swift_once(&qword_D31C8, sub_8D710);
  }
  uint64_t v123 = sub_16C80();
  uint64_t v124 = sub_26F0(v123, (uint64_t)qword_D7560);
  id v125 = v9;
  sub_905F8((uint64_t)v125, v126, v127, v128, v129, v130, v131, v132, v400, v403, v406, v410, v416);
  os_log_type_t v133 = sub_16C50();
  uint64_t v438 = v117;
  v450 = v9;
  v425 = (uint64_t *)(v1 + 64);
  if (sub_286C4(v133))
  {
    uint64_t v134 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v419 = sub_16AC4(32LL);
    *(void *)&__int128 v461 = v419;
    *(_DWORD *)uint64_t v134 = 136315138;
    uint64_t v413 = (uint64_t)(v134 + 4);
    id v9 = v9;
    id v135 = [v9 description];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v135);
    sub_90590();
    unint64_t v137 = v136;

    uint64_t v138 = sub_90514();
    uint64_t *v425 = sub_3D10(v138, v137, v139);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v425, v1 + 72, v134 + 4, v134 + 12);
    swift_bridgeObjectRelease(v137);

    sub_16BD0(&dword_0, v120, (os_log_type_t)v112, "Current SK intent: %s", v134);
    sub_16BB4(v419);
    sub_16AA8(v419);
    sub_16AA8((uint64_t)v134);
  }

  else
  {
  }

  v347 = (uint64_t *)(v1 + 56);
  id v348 = v122;
  sub_905F8((uint64_t)v348, v349, v350, v351, v352, v353, v354, v355, v402, v405, v408, v413, v419);
  os_log_type_t v356 = sub_16C50();
  uint64_t v431 = v1 + 56;
  if (sub_286C4(v356))
  {
    v357 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v415 = sub_16AC4(32LL);
    *(void *)&__int128 v461 = v415;
    *(_DWORD *)v357 = 136315138;
    uint64_t v460 = v1;
    id v358 = v9;
    uint64_t v359 = v124;
    id v360 = [v358 description];
    uint64_t v361 = static String._unconditionallyBridgeFromObjectiveC(_:)(v360);
    id v423 = v9;
    uint64_t v363 = v362;

    uint64_t v124 = v359;
    uint64_t *v347 = sub_9059C(v361, v364, (uint64_t *)&v461);
    sub_16F1C((uint64_t)v347, (uint64_t)v425, (uint64_t)(v357 + 4));
    uint64_t v365 = v363;
    id v9 = v423;
    swift_bridgeObjectRelease(v365);

    uint64_t v1 = v460;
    sub_16BD0(&dword_0, v120, (os_log_type_t)v112, "This turn of updateAlarmIntent: %s", v357);
    sub_16BB4(v415);
    sub_16AA8(v415);
    sub_16AA8((uint64_t)v357);
  }

  else
  {
  }

  uint64_t v366 = (uint64_t)v450;
  id v368 = sub_905C4(v367, "proposedTime");
  if (!v368)
  {
    sub_23050(*(void *)(v1 + 264), v369, v370, *(void *)(v1 + 232));
    goto LABEL_109;
  }

  v371 = v368;
  uint64_t v112 = *(void *)(v1 + 240);
  sub_905A4();

  sub_9055C(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v112 + 32));
  sub_28628();
  if (v55)
  {
LABEL_109:
    v373.super.Class isa = 0LL;
    goto LABEL_110;
  }

  uint64_t v372 = *(void *)(v1 + 240);
  v373.super.Class isa = DateComponents._bridgeToObjectiveC()().super.isa;
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v372 + 8));
LABEL_110:
  sub_2865C(v450, "setProposedTime:");

  id v375 = sub_905C4(v374, "proposedMeridiemSetByUser");
  sub_2865C(v450, "setProposedMeridiemSetByUser:");

  sub_90344(v9);
  if (v376)
  {
    sub_90588();
    sub_90490();
  }

  else
  {
    id v375 = 0LL;
  }

  sub_2865C(v450, "setProposedLabel:");

  id v377 = v450;
  v378 = (os_log_s *)v124;
  Logger.logObject.getter(v377, v379, v380, v381, v382, v383, v384, v385);
  os_log_type_t v386 = sub_16C50();
  if (sub_286C4(v386))
  {
    v387 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v454 = sub_16AC4(32LL);
    *(void *)&__int128 v461 = v454;
    *(_DWORD *)v387 = 136315138;
    id v388 = v377;
    uint64_t v389 = sub_904DC((uint64_t)[v388 description]);
    id v390 = v9;
    uint64_t v392 = v391;

    uint64_t v1 = v366;
    uint64_t v394 = sub_9059C(v389, v393, (uint64_t *)&v461);
    v395 = sub_286DC(v394, v445);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v395, v431, v387 + 4, v387 + 12);
    uint64_t v396 = v392;
    id v9 = v390;
    swift_bridgeObjectRelease(v396);

    sub_16BD0(&dword_0, v378, (os_log_type_t)v112, "Updated SK intent: %s", v387);
    sub_16BB4(v454);
    sub_16AA8(v454);
    sub_16AA8((uint64_t)v387);
  }

  else
  {
  }

  uint64_t v398 = *(void *)(v1 + 176);
  uint64_t v397 = *(void *)(v1 + 184);
  uint64_t v101 = *(void *)(v1 + 120);
  double v399 = sub_90574();
  IntentPromptAnswer.init(answeredValue:updatedIntent:)(v399);

  swift_release(v438);
  (*(void (**)(uint64_t))(v398 + 8))(v397);
LABEL_27:
  uint64_t v106 = sub_26B0(&qword_D7678);
  uint64_t v107 = v101;
LABEL_28:
  sub_17508(v107, 0LL, v105, v106);
LABEL_65:
  sub_903E8(*(void *)(v1 + 392));
  sub_19828();
  sub_19820();
  sub_1987C();
  sub_19808();
  sub_19830();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v231 = *(uint64_t (**)(void))(v1 + 8);
  return v231();
}

uint64_t _s18NeedsValueStrategyCMa_0()
{
  return objc_opt_self(&OBJC_CLASS____TtCO15AlarmFlowPlugin11UpdateAlarm18NeedsValueStrategy);
}

uint64_t sub_8FF68@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_8D758(a1, a2);
}

uint64_t sub_8FF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_D75AC);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_903E4;
  return sub_8E280(a1, a2, a3);
}

uint64_t sub_8FFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D75A4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_9003C;
  return sub_8D908(a1, a2);
}

uint64_t sub_9003C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_9007C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to NeedsValueFlowStrategyAsync.makeRepromptOnEmptyParse(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = _s18NeedsValueStrategyCMa_0();
  *uint64_t v8 = v4;
  v8[1] = sub_903E4;
  return NeedsValueFlowStrategyAsync.makeRepromptOnEmptyParse(resolveRecord:)(a1, a2, v9, a4);
}

uint64_t sub_900F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to NeedsValueFlowStrategyAsync.makeRepromptOnLowConfidence(resolveRecord:)[1]);
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = _s18NeedsValueStrategyCMa_0();
  *uint64_t v8 = v4;
  v8[1] = sub_903E4;
  return NeedsValueFlowStrategyAsync.makeRepromptOnLowConfidence(resolveRecord:)(a1, a2, v9, a4);
}

uint64_t sub_90174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc(async function pointer to ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)[1]);
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = _s18NeedsValueStrategyCMa_0();
  *uint64_t v12 = v6;
  v12[1] = sub_903E4;
  return ParameterResolutionHandlingAsync.makeFlowCancelledResponse(app:intent:parameter:)(a1, a2, a3, a4, v13, a6);
}

uint64_t sub_90208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = (void *)swift_task_alloc(async function pointer to ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)[1]);
  *(void *)(v7 + 16) = v14;
  uint64_t v15 = _s18NeedsValueStrategyCMa_0();
  *uint64_t v14 = v7;
  v14[1] = sub_903E4;
  return ParameterResolutionHandlingAsync.makeErrorResponse(error:app:intent:parameter:)(a1, a2, a3, a4, a5, v15, a7);
}

unint64_t sub_902A8()
{
  unint64_t result = qword_D7650[0];
  if (!qword_D7650[0])
  {
    uint64_t v1 = _s18NeedsValueStrategyCMa_0();
    unint64_t result = swift_getWitnessTable(&unk_A7514, v1);
    atomic_store(result, qword_D7650);
  }

  return result;
}

void sub_902E4(void *a1)
{
  id v2 = [a1 identifier];

  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  sub_90618();
  sub_1D738();
}

void sub_90344(void *a1)
{
  id v1 = [a1 proposedLabel];
  if (v1)
  {
    id v2 = v1;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  }

  sub_1D738();
}

uint64_t sub_9039C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26B0(&qword_D37D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_903E8(uint64_t a1)
{
  return swift_task_dealloc(a1);
}

uint64_t sub_90424()
{
  return (*(uint64_t (**)(void, void))(v1 + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
}

uint64_t sub_90450()
{
  return (*(uint64_t (**)(void, void))(v0[20] + 8LL))(v0[21], v0[19]);
}

BOOL sub_90478(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_90488@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  return a1(v1);
}

uint64_t sub_90490()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_9049C(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

uint64_t sub_904B4(uint64_t a1)
{
  return SiriTimeMeasurement.init(_:log:startTime:)(v1, v2, a1);
}

uint64_t sub_904C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a10, v11);
}

uint64_t sub_904DC(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_904E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_904F4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t sub_90508( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  return sub_3D10(a1, a2, (uint64_t *)va);
}

uint64_t sub_90514()
{
  return v0;
}

void sub_90524()
{
}

  ;
}

void sub_9054C(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_9055C@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1, v3);
}

uint64_t sub_9056C()
{
  return type metadata accessor for UpdateAlarmIntent(0LL);
}

double sub_90574()
{
  return 0.0;
}

NSString sub_90588()
{
  return String._bridgeToObjectiveC()();
}

  ;
}

uint64_t sub_9059C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_3D10(a1, v3, a3);
}

uint64_t sub_905A4()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDateComponents sub_905B0()
{
  return DateComponents._bridgeToObjectiveC()();
}

BOOL sub_905BC(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

id sub_905C4(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_905CC()
{
  return sub_16880(v0, 1LL, v1);
}

id sub_905F0(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_905F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return Logger.logObject.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_90604()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_90618()
{
  return v0;
}

uint64_t sub_90624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static BarbaraWalters.logAndReturnError<A>(context:_:)(a1, a2, a3);
}

uint64_t sub_90630( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return Logger.logObject.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t type metadata accessor for AlarmBaseCATPatternsExecutor(uint64_t a1)
{
  return sub_8A38(a1, (uint64_t *)&unk_D7680, (uint64_t)&nominal type descriptor for AlarmBaseCATPatternsExecutor);
}

uint64_t sub_90650(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D8530);
}

void sub_9068C()
{
  uint64_t v1 = sub_26B0(&qword_D3A08);
  __chkstk_darwin(v1);
  sub_17390();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = swift_allocObject(v5, 608LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_A7690;
  *(void *)(v6 + 32) = 7368801LL;
  *(void *)(v6 + 40) = 0xE300000000000000LL;
  uint64_t v7 = *v0;
  if (*v0)
  {
    uint64_t v8 = type metadata accessor for SirikitApp(0LL);
    uint64_t v9 = v7;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    *(void *)(v6 + 56) = 0LL;
    *(void *)(v6 + 64) = 0LL;
  }

  *(void *)(v6 + 48) = v9;
  *(void *)(v6 + 72) = v8;
  *(void *)(v6 + 80) = 0x6E69577473726966LL;
  *(void *)(v6 + 88) = 0xEF657A6953776F64LL;
  if ((v0[2] & 1) != 0)
  {
    uint64_t v10 = 0LL;
    *(void *)(v6 + 104) = 0LL;
    *(void *)(v6 + 112) = 0LL;
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = v0[1];
    uint64_t v10 = &type metadata for Double;
  }

  *(void *)(v6 + 96) = v11;
  *(void *)(v6 + 120) = v10;
  strcpy((char *)(v6 + 128), "isConclusion");
  *(_BYTE *)(v6 + 141) = 0;
  *(_WORD *)(v6 + 142) = -5120;
  *(_BYTE *)(v6 + 144) = *((_BYTE *)v0 + 17);
  *(void *)(v6 + 168) = &type metadata for Bool;
  strcpy((char *)(v6 + 176), "isFirstWindow");
  *(_WORD *)(v6 + 190) = -4864;
  *(_BYTE *)(v6 + 192) = *((_BYTE *)v0 + 18);
  *(void *)(v6 + 216) = &type metadata for Bool;
  strcpy((char *)(v6 + 224), "isLastWindow");
  *(_BYTE *)(v6 + 237) = 0;
  *(_WORD *)(v6 + 238) = -5120;
  *(_BYTE *)(v6 + 240) = *((_BYTE *)v0 + 19);
  *(void *)(v6 + 264) = &type metadata for Bool;
  *(void *)(v6 + 272) = 0xD000000000000016LL;
  *(void *)(v6 + 280) = 0x80000000000A9860LL;
  *(_BYTE *)(v6 + 288) = *((_BYTE *)v0 + 20);
  *(void *)(v6 + 312) = &type metadata for Bool;
  *(void *)(v6 + 320) = 0x6D6F727065527369LL;
  *(void *)(v6 + 328) = 0xEA00000000007470LL;
  *(_BYTE *)(v6 + 336) = *((_BYTE *)v0 + 21);
  *(void *)(v6 + 360) = &type metadata for Bool;
  *(void *)(v6 + 368) = 0x736D657469LL;
  *(void *)(v6 + 376) = 0xE500000000000000LL;
  uint64_t v12 = v0[3];
  uint64_t v13 = sub_26B0(&qword_D3D28);
  *(void *)(v6 + 384) = v12;
  *(void *)(v6 + 408) = v13;
  *(void *)(v6 + 416) = 0xD000000000000013LL;
  *(void *)(v6 + 424) = 0x80000000000A9880LL;
  if ((v0[5] & 1) != 0)
  {
    uint64_t v14 = 0LL;
    *(void *)(v6 + 440) = 0LL;
    *(void *)(v6 + 448) = 0LL;
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = v0[4];
    uint64_t v14 = &type metadata for Double;
  }

  *(void *)(v6 + 432) = v15;
  *(void *)(v6 + 456) = v14;
  *(void *)(v6 + 464) = 0x6574496C61746F74LL;
  *(void *)(v6 + 472) = 0xEA0000000000736DLL;
  if ((v0[7] & 1) != 0)
  {
    id v16 = 0LL;
    *(void *)(v6 + 488) = 0LL;
    *(void *)(v6 + 496) = 0LL;
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v17 = v0[6];
    id v16 = &type metadata for Double;
  }

  *(void *)(v6 + 480) = v17;
  *(void *)(v6 + 504) = v16;
  *(void *)(v6 + 512) = 0xD000000000000018LL;
  *(void *)(v6 + 520) = 0x80000000000AA560LL;
  uint64_t v18 = type metadata accessor for AlarmBaseDisambiguationParameters(0LL);
  sub_4D80((uint64_t)v0 + *(int *)(v18 + 56), v4, &qword_D3A08);
  uint64_t v19 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880(v4, 1LL, v19) == 1)
  {
    swift_retain(v7);
    swift_bridgeObjectRetain(v12);
    sub_19594(v4, &qword_D3A08);
    *(_OWORD *)(v6 + 528) = 0u;
    *(_OWORD *)(v6 + 544) = 0u;
  }

  else
  {
    *(void *)(v6 + 552) = v19;
    uint64_t v20 = sub_19558((void *)(v6 + 528));
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32LL))(v20, v4, v19);
    swift_retain(v7);
    swift_bridgeObjectRetain(v12);
  }

  *(void *)(v6 + 560) = 0x6953776F646E6977LL;
  *(void *)(v6 + 568) = 0xEA0000000000657ALL;
  uint64_t v21 = (uint64_t *)((char *)v0 + *(int *)(v18 + 60));
  if ((v21[1] & 1) != 0)
  {
    uint64_t v22 = 0LL;
    *(_OWORD *)(v6 + 584) = 0u;
    uint64_t v23 = 0LL;
  }

  else
  {
    uint64_t v23 = *v21;
    uint64_t v22 = &type metadata for Double;
  }

  *(void *)(v6 + 576) = v23;
  *(void *)(v6 + 600) = v22;
  sub_16CB0();
}

uint64_t sub_90A48()
{
  uint64_t v1 = (void *)sub_47CC8((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_9187C;
  return sub_47D84(0xD000000000000013LL, 0x80000000000AA540LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_90AA8(char a1, char a2, char a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 24) = a7;
  *(void *)(v8 + 32) = a8;
  *(void *)(v8 + 16) = a6;
  *(_BYTE *)(v8 + 92) = a5;
  *(_BYTE *)(v8 + 91) = a4;
  *(_BYTE *)(v8 + 90) = a3;
  *(_BYTE *)(v8 + 89) = a2;
  *(_BYTE *)(v8 + 88) = a1;
  uint64_t v9 = type metadata accessor for AlarmBaseDisambiguationParameters(0LL);
  *(void *)(v8 + 40) = v9;
  *(void *)(v8 + 48) = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_90B1C, 0LL, 0LL);
}

uint64_t sub_90B1C()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v16 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 16);
  char v15 = *(_BYTE *)(v0 + 92);
  char v4 = *(_BYTE *)(v0 + 91);
  char v5 = *(_BYTE *)(v0 + 90);
  char v6 = *(_BYTE *)(v0 + 89);
  char v7 = *(_BYTE *)(v0 + 88);
  uint64_t v8 = v1 + *(int *)(v2 + 56);
  uint64_t v9 = type metadata accessor for SpeakableString(0LL);
  sub_A40C(v8, 1LL, 1LL, v9);
  *(void *)uint64_t v1 = 0LL;
  *(void *)(v1 + 8) = 0LL;
  *(_BYTE *)(v1 + 16) = 1;
  *(_BYTE *)(v1 + 17) = v7;
  *(_BYTE *)(v1 + 18) = v6;
  *(_BYTE *)(v1 + 19) = v5;
  *(_BYTE *)(v1 + 20) = v4;
  *(_BYTE *)(v1 + 21) = v15;
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = 0LL;
  *(_BYTE *)(v1 + 40) = 1;
  *(void *)(v1 + 48) = 0LL;
  *(_BYTE *)(v1 + 56) = 1;
  uint64_t v10 = v1 + *(int *)(v2 + 60);
  *(void *)uint64_t v10 = 0LL;
  *(_BYTE *)(v10 + 8) = 1;
  swift_bridgeObjectRetain(v3);
  sub_36DEC(v1, v16);
  sub_9068C();
  uint64_t v12 = v11;
  *(void *)(v0 + 56) = v11;
  *(void *)(v0 + 64) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_90C64;
  return v17(0xD000000000000018LL, 0x80000000000A9ED0LL, v12);
}

uint64_t sub_90C64(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 56);
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease(v5);
  if (v1)
  {
    char v6 = sub_90D1C;
  }

  else
  {
    *(void *)(v4 + 80) = a1;
    char v6 = sub_90CE0;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_90CE0()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 80));
}

uint64_t sub_90D1C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_90D54()
{
  uint64_t v1 = (void *)sub_47CC8((uint64_t)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_90DB4;
  return sub_47D84(0xD000000000000016LL, 0x80000000000AA520LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_90DB4(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

void sub_90E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_90E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CATOption(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_17390();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_26B0((uint64_t *)&unk_D36C0);
  __chkstk_darwin(v11);
  sub_17390();
  uint64_t v14 = v13 - v12;
  sub_4D80(a1, v13 - v12, (uint64_t *)&unk_D36C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  CATWrapper.init(templateDir:options:globals:)(v14, v10, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  sub_19594(a1, (uint64_t *)&unk_D36C0);
  sub_16CB0();
}

uint64_t type metadata accessor for AlarmBaseDisambiguationParameters(uint64_t a1)
{
  return sub_8A38(a1, qword_D7740, (uint64_t)&nominal type descriptor for AlarmBaseDisambiguationParameters);
}

uint64_t sub_90F5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlarmBaseDisambiguationParameters(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_90F98(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16LL) & ~(unint64_t)v3);
    swift_retain(v4);
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
    uint64_t v10 = *(int *)(a3 + 56);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for SpeakableString(0LL);
    swift_retain(v4);
    swift_bridgeObjectRetain(v9);
    if (sub_16880((uint64_t)v12, 1LL, v13))
    {
      uint64_t v14 = sub_26B0(&qword_D3A08);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
      sub_A40C((uint64_t)v11, 0LL, 1LL, v13);
    }

    uint64_t v15 = *(int *)(a3 + 60);
    uint64_t v16 = v7 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    *(void *)uint64_t v16 = *(void *)v17;
    *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  }

  return v7;
}

uint64_t sub_910F0(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 56);
  uint64_t v5 = type metadata accessor for SpeakableString(0LL);
  uint64_t result = sub_16880(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }
  return result;
}

uint64_t sub_91164(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_DWORD *)(a1 + 17) = *(_DWORD *)((char *)a2 + 17);
  *(_BYTE *)(a1 + 21) = *((_BYTE *)a2 + 21);
  uint64_t v9 = a2[3];
  uint64_t v8 = a2[4];
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  uint64_t v10 = a2[6];
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  *(void *)(a1 + 48) = v10;
  uint64_t v11 = *(int *)(a3 + 56);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for SpeakableString(0LL);
  swift_retain(v7);
  swift_bridgeObjectRetain(v9);
  if (sub_16880((uint64_t)v13, 1LL, v14))
  {
    uint64_t v15 = sub_26B0(&qword_D3A08);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
    sub_A40C((uint64_t)v12, 0LL, 1LL, v14);
  }

  uint64_t v16 = *(int *)(a3 + 60);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  return a1;
}

uint64_t *sub_9128C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  swift_retain(v7);
  swift_release(v6);
  uint64_t v8 = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  a1[1] = v8;
  *((_BYTE *)a1 + 17) = *((_BYTE *)a2 + 17);
  *((_BYTE *)a1 + 18) = *((_BYTE *)a2 + 18);
  *((_BYTE *)a1 + 19) = *((_BYTE *)a2 + 19);
  *((_BYTE *)a1 + 20) = *((_BYTE *)a2 + 20);
  *((_BYTE *)a1 + 21) = *((_BYTE *)a2 + 21);
  uint64_t v9 = a2[3];
  uint64_t v10 = a1[3];
  a1[3] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = a2[4];
  *((_BYTE *)a1 + 40) = *((_BYTE *)a2 + 40);
  a1[4] = v11;
  uint64_t v12 = a2[6];
  *((_BYTE *)a1 + 56) = *((_BYTE *)a2 + 56);
  a1[6] = v12;
  uint64_t v13 = *(int *)(a3 + 56);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for SpeakableString(0LL);
  int v17 = sub_16880((uint64_t)v14, 1LL, v16);
  int v18 = sub_16880((uint64_t)v15, 1LL, v16);
  if (!v17)
  {
    uint64_t v19 = *(void *)(v16 - 8);
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v14, v15, v16);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v16);
    goto LABEL_6;
  }

  if (v18)
  {
LABEL_6:
    uint64_t v20 = sub_26B0(&qword_D3A08);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
  sub_A40C((uint64_t)v14, 0LL, 1LL, v16);
LABEL_7:
  uint64_t v21 = *(int *)(a3 + 60);
  uint64_t v22 = (uint64_t)a1 + v21;
  uint64_t v23 = (uint64_t *)((char *)a2 + v21);
  uint64_t v24 = *v23;
  *(_BYTE *)(v22 + 8) = *((_BYTE *)v23 + 8);
  *(void *)uint64_t v22 = v24;
  return a1;
}

uint64_t sub_91434(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v9 = *(int *)(a3 + 56);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for SpeakableString(0LL);
  if (sub_16880((uint64_t)v11, 1LL, v12))
  {
    uint64_t v13 = sub_26B0(&qword_D3A08);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
    sub_A40C((uint64_t)v10, 0LL, 1LL, v12);
  }

  uint64_t v14 = *(int *)(a3 + 60);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)uint64_t v15 = *(void *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  return a1;
}

uint64_t *sub_91544(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a1 + 17) = *((_BYTE *)a2 + 17);
  *((_BYTE *)a1 + 18) = *((_BYTE *)a2 + 18);
  *((_BYTE *)a1 + 19) = *((_BYTE *)a2 + 19);
  *((_BYTE *)a1 + 20) = *((_BYTE *)a2 + 20);
  *((_BYTE *)a1 + 21) = *((_BYTE *)a2 + 21);
  uint64_t v7 = a1[3];
  a1[3] = a2[3];
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  *((_BYTE *)a1 + 40) = *((_BYTE *)a2 + 40);
  a1[6] = a2[6];
  *((_BYTE *)a1 + 56) = *((_BYTE *)a2 + 56);
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for SpeakableString(0LL);
  int v12 = sub_16880((uint64_t)v9, 1LL, v11);
  int v13 = sub_16880((uint64_t)v10, 1LL, v11);
  if (!v12)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }

  if (v13)
  {
LABEL_6:
    uint64_t v15 = sub_26B0(&qword_D3A08);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  sub_A40C((uint64_t)v9, 0LL, 1LL, v11);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 60);
  uint64_t v17 = (uint64_t)a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  return a1;
}

uint64_t sub_916DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_916E8);
}

uint64_t sub_916E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_26B0(&qword_D3A08);
    return sub_16880(a1 + *(int *)(a3 + 56), a2, v8);
  }

uint64_t sub_91760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9176C);
}

uint64_t sub_9176C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_26B0(&qword_D3A08);
    return sub_A40C(v5 + *(int *)(a4 + 56), a2, a2, v7);
  }

  return result;
}

void sub_917DC(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = &unk_A7660;
  void v4[2] = &unk_A7678;
  v4[3] = &unk_A7678;
  void v4[4] = &unk_A7678;
  v4[5] = &unk_A7678;
  v4[6] = &unk_A7678;
  v4[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[8] = &unk_A7660;
  v4[9] = &unk_A7660;
  sub_1E9D8(319LL);
  if (v3 <= 0x3F)
  {
    void v4[10] = *(void *)(v2 - 8) + 64LL;
    v4[11] = &unk_A7660;
    swift_initStructMetadata(a1, 256LL, 12LL, v4, a1 + 16);
  }

uint64_t sub_91880()
{
  return sub_90F5C(*(void *)(v0 + 48));
}

uint64_t sub_9188C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_91898);
}

uint64_t sub_91898(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_26B0(&qword_D37D0);
    return sub_16880(a1 + *(int *)(a3 + 20), a2, v8);
  }

uint64_t sub_91910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9191C);
}

uint64_t sub_9191C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_26B0(&qword_D37D0);
    return sub_A40C(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

uint64_t _s20HandleIntentStrategyVMa_4(uint64_t a1)
{
  uint64_t result = qword_D7810;
  if (!qword_D7810) {
    return swift_getSingletonMetadata(a1, &_s20HandleIntentStrategyVMn_4);
  }
  return result;
}

void sub_919C4(uint64_t a1)
{
  v4[0] = "(";
  sub_76798(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
  }

uint64_t sub_91A38()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D77A0);
  sub_26F0(v0, (uint64_t)qword_D77A0);
  return static SiriTimeLog.alarmFlow.getter();
}

void sub_91A80()
{
  if (qword_D31D0 != -1) {
    swift_once(&qword_D31D0, sub_91A38);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_26F0(v0, (uint64_t)qword_D77A0);
  uint64_t v1 = (os_log_s *)sub_16D50();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)sub_1EFA4();
    *(_WORD *)unint64_t v3 = 0;
    sub_16B44(&dword_0, v1, v2, "SnoozeAlarm.HandleIntentStrategy.makeIntentExecutionBehavior is called.", v3);
    sub_16AA8((uint64_t)v3);
  }

  sub_93A90();
  sub_1511C();
}

uint64_t sub_91B5C(uint64_t a1)
{
  v2[7] = a1;
  _BYTE v2[8] = v1;
  uint64_t v3 = sub_26B0(&qword_D78A0);
  v2[9] = sub_19754(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for ExecutionInfo.Action(0LL);
  v2[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[11] = v5;
  v2[12] = sub_19754(v5);
  uint64_t v6 = type metadata accessor for CrossDeviceCommandExecution(0LL);
  v2[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[14] = v7;
  v2[15] = sub_19754(v7);
  uint64_t v8 = sub_26B0(&qword_D37D0);
  v2[16] = sub_19754(*(void *)(v8 - 8));
  uint64_t v9 = sub_26B0(&qword_D78A8);
  v2[17] = sub_19754(*(void *)(v9 - 8));
  uint64_t v10 = type metadata accessor for UUID(0LL);
  v2[18] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[19] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[20] = swift_task_alloc(v12);
  v2[21] = swift_task_alloc(v12);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_91C40()
{
  uint64_t v1 = sub_93958();
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    _s20HandleIntentStrategyVwxx_1(v0 + 2);
    UUID.init(uuidString:)(v3, v4);
    sub_16C48();
    sub_93A1C();
    if (v5)
    {
      sub_93788(v0[17], &qword_D78A8);
    }

    else
    {
      uint64_t v6 = v0[16];
      (*(void (**)(void, void, void))(v0[19] + 32LL))(v0[21], v0[17], v0[18]);
      uint64_t v7 = sub_93A90();
      sub_93A0C(v7);
      uint64_t v8 = sub_175B8();
      int v9 = sub_16880(v6, 1LL, v8);
      uint64_t v10 = v0[21];
      if (v9 != 1)
      {
        uint64_t v28 = v0[19];
        uint64_t v29 = v0[18];
        uint64_t v31 = (uint64_t *)v0[15];
        uint64_t v30 = v0[16];
        uint64_t v58 = v0[14];
        uint64_t v59 = v0[13];
        uint64_t v55 = v0[20];
        uint64_t v56 = v0[12];
        uint64_t v54 = v0[11];
        uint64_t v32 = v0[9];
        uint64_t v57 = v0[10];
        uint64_t v33 = (void *)v0[7];
        BOOL v34 = (void *)HALAlarmDeviceContext.device.getter();
        sub_175C0(v30, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL));
        sub_93AE4();
        uint64_t v35 = sub_93B20();
        uint64_t v53 = (uint64_t)v31 + *(int *)(sub_26B0(&qword_D78C0) + 64);
        uint64_t v36 = sub_26B0(&qword_D4188);
        uint64_t v37 = swift_allocObject(v36, 40LL, 7LL);
        *(_OWORD *)(v37 + 16) = xmmword_A4CD0;
        *(void *)(v37 + 32) = v34;
        uint64_t v60 = v37;
        specialized Array._endMutation()(v37, v38, v39, v40);
        *uint64_t v31 = v60;
        v31[1] = 0LL;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v55, v10, v29);
        (*(void (**)(uint64_t, void, uint64_t))(v54 + 104))( v56,  enum case for ExecutionInfo.Action.alarmSnooze(_:),  v57);
        uint64_t v41 = sub_93ADC();
        sub_A40C(v32, 1LL, 1LL, v41);
        id v42 = v34;
        ExecutionInfo.init(executionId:action:quickStopActionResult:)(v55, v56, v32);
        (*(void (**)(uint64_t *, void, uint64_t))(v58 + 104))( v31,  enum case for CrossDeviceCommandExecution.started(_:),  v59);
        dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)(v31);
        swift_release(v35);
        (*(void (**)(uint64_t *, uint64_t))(v58 + 8))(v31, v59);
        v33[3] = type metadata accessor for AceOutput(0LL);
        v33[4] = &protocol witness table for AceOutput;
        uint64_t v43 = sub_19558(v33);
        sub_93B30((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50, v51, v53);

        sub_17AD0(v28);
        goto LABEL_13;
      }

      uint64_t v11 = v0[18];
      uint64_t v12 = v0[19];
      sub_93788(v0[16], &qword_D37D0);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
  }

  else
  {
    sub_93B18();
  }

  if (qword_D31D0 != -1) {
    swift_once(&qword_D31D0, sub_91A38);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  sub_26F0(v13, (uint64_t)qword_D77A0);
  uint64_t v14 = (os_log_s *)sub_16D50();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)sub_1EFA4();
    *(_WORD *)uint64_t v16 = 0;
    sub_16B44( &dword_0,  v14,  v15,  "SnoozeAlarm.HandleIntentStrategy.makePreHandleIntentOutput() returning - selectedDevice not found in halInfo",  v16);
    sub_16AA8((uint64_t)v16);
  }

  uint64_t v17 = (void *)v0[7];

  v17[3] = type metadata accessor for AceOutput(0LL);
  v17[4] = &protocol witness table for AceOutput;
  uint64_t v18 = sub_19558(v17);
  sub_93B30((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25, v51, v52);
LABEL_13:
  swift_task_dealloc();
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  uint64_t v26 = (uint64_t (*)(void))sub_19958();
  return v26();
}

uint64_t sub_91FF4(uint64_t a1, uint64_t a2)
{
  v3[29] = a2;
  v3[30] = v2;
  v3[28] = a1;
  uint64_t v4 = sub_26B0(&qword_D78A0);
  v3[31] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ExecutionInfo.Action(0LL);
  v3[32] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[33] = v6;
  v3[34] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CrossDeviceCommandExecution(0LL);
  v3[35] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[36] = v8;
  v3[37] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for CrossDeviceCommandExecution.Result(0LL);
  v3[38] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[39] = v10;
  v3[40] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_26B0(&qword_D78A8);
  v3[41] = swift_task_alloc((*(void *)(*(void *)(v11 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for UUID(0LL);
  v3[42] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[43] = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[44] = swift_task_alloc(v14);
  v3[45] = swift_task_alloc(v14);
  uint64_t v15 = type metadata accessor for DialogPhase(0LL);
  v3[46] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v3[47] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[48] = swift_task_alloc(v17);
  v3[49] = swift_task_alloc(v17);
  v3[50] = swift_task_alloc(v17);
  uint64_t v18 = type metadata accessor for Logger(0LL);
  v3[51] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v3[52] = v19;
  v3[53] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[54] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v3[55] = v21;
  v3[56] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[57] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v3[58] = v23;
  v3[59] = swift_task_alloc((*(void *)(v23 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v24 = (*(void *)(*(void *)(sub_26B0(&qword_D37D0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[60] = swift_task_alloc(v24);
  v3[61] = swift_task_alloc(v24);
  uint64_t v25 = type metadata accessor for NLContextUpdate(0LL);
  v3[62] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v3[63] = v26;
  v3[64] = swift_task_alloc((*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_92240, 0LL, 0LL);
}

uint64_t sub_92240()
{
  if (qword_D31D0 != -1) {
    swift_once(&qword_D31D0, sub_91A38);
  }
  uint64_t v1 = sub_26F0(v0[51], (uint64_t)qword_D77A0);
  uint64_t v2 = (os_log_s *)sub_16D50();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_1EFA4();
    *(_WORD *)uint64_t v4 = 0;
    sub_16B44(&dword_0, v2, v3, "SnoozeAlarm.HandleIntentStrategy.makeIntentHandledResponse() called.", v4);
    sub_16AA8((uint64_t)v4);
  }

  uint64_t v5 = sub_26B0(&qword_D5D10);
  v0[65] = v5;
  uint64_t v6 = (void *)IntentResolutionRecord.intent.getter(v5);
  uint64_t v7 = sub_1B47C(v6);
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  uint64_t v11 = v0[61];
  uint64_t v12 = v0[30];
  uint64_t v13 = sub_93A90();
  sub_34BBC(v12 + *(int *)(v13 + 20), v11);
  uint64_t v14 = sub_175B8();
  uint64_t v15 = sub_16880(v11, 1LL, v14);
  uint64_t v16 = v0[61];
  if ((_DWORD)v15 != 1)
  {
    unint64_t v17 = (void *)HALDeviceContext.remoteDevice.getter(v14);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(v16, v14);
    if (!v17) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease(v10);

LABEL_10:
    NLContextUpdate.init()(v7);
    goto LABEL_12;
  }

  sub_93B40(v15, &qword_D37D0);
LABEL_11:
  uint64_t v18 = sub_26B0((uint64_t *)&off_D3A00);
  uint64_t inited = swift_initStackObject(v18, v0 + 2);
  *(_OWORD *)(inited + 16) = xmmword_A4880;
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v10;
  sub_79710(inited);
  swift_setDeallocating(inited);
  sub_65AA0();
LABEL_12:
  uint64_t v20 = v0[56];
  uint64_t v21 = v0[53];
  uint64_t v22 = v0[51];
  uint64_t v23 = v0[52];
  (*(void (**)(uint64_t, void, void))(v0[55] + 104LL))( v20,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v0[54]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v1, v22);
  uint64_t v24 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v20, v21, v24);
  uint64_t v25 = (void *)IntentResolutionRecord.intentResponse.getter(v5);
  uint64_t v26 = sub_93B28();

  if (v26 == 100)
  {
    if (qword_D3050 != -1) {
      swift_once(&qword_D3050, sub_45D64);
    }
    uint64_t v31 = (void *)swift_task_alloc(dword_D53EC);
    v0[72] = v31;
    *uint64_t v31 = v0;
    v31[1] = sub_928E4;
    return sub_4BAE0();
  }

  else if (v26 == 4)
  {
    if (qword_D3050 != -1) {
      swift_once(&qword_D3050, sub_45D64);
    }
    uint64_t v27 = v0[30];
    uint64_t v28 = swift_task_alloc(32LL);
    v0[66] = v28;
    *(void *)(v28 + 16) = v27;
    uint64_t v29 = (void *)swift_task_alloc(dword_D53E4);
    v0[67] = v29;
    *uint64_t v29 = v0;
    v29[1] = sub_925DC;
    return sub_4B918((uint64_t)sub_937BC, v28);
  }

  else
  {
    if (qword_D3050 != -1) {
      swift_once(&qword_D3050, sub_45D64);
    }
    uint64_t v32 = (void *)swift_task_alloc(dword_D53DC);
    v0[77] = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_92BCC;
    return sub_4B858();
  }

uint64_t sub_925DC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 544) = v1;
  swift_task_dealloc();
  sub_1978C();
  if (!v1) {
    *(void *)(v4 + 552) = a1;
  }
  sub_19840();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_92654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v7 + 560) = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_926B4;
  sub_45818();
  return sub_45460();
}

uint64_t sub_926B4()
{
  uint64_t v2 = *(void **)(v1 + 552);
  uint64_t v3 = *(void *)(v1 + 376);
  sub_459FC();
  *(void *)(v4 + 568) = v0;
  swift_task_dealloc();
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));

  sub_19840();
  return sub_3848C(v5, v6, v7);
}

#error "92844: call analysis failed (funcsize=110)"
uint64_t sub_928E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  sub_25078();
  *uint64_t v4 = *v3;
  *(void *)(v2 + 584) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 592) = v0;
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_9293C()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v0 + 600) = v1;
  void *v1 = v0;
  v1[1] = sub_9299C;
  sub_45818();
  return sub_45460();
}

uint64_t sub_9299C()
{
  uint64_t v2 = *(void **)(v1 + 592);
  uint64_t v3 = *(void *)(v1 + 376);
  sub_459FC();
  *(void *)(v4 + 608) = v0;
  swift_task_dealloc();
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));

  sub_19840();
  return sub_3848C(v5, v6, v7);
}

#error "92B2C: call analysis failed (funcsize=110)"
uint64_t sub_92BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  sub_25078();
  *uint64_t v4 = *v3;
  *(void *)(v2 + 624) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 632) = v0;
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_92C24()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  *(void *)(v0 + 640) = v1;
  void *v1 = v0;
  v1[1] = sub_92C84;
  sub_45818();
  return sub_45460();
}

uint64_t sub_92C84()
{
  uint64_t v2 = *(void **)(v1 + 632);
  uint64_t v3 = *(void *)(v1 + 376);
  sub_459FC();
  *(void *)(v4 + 648) = v0;
  swift_task_dealloc();
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));

  sub_19840();
  return sub_3848C(v5, v6, v7);
}

#error "92E14: call analysis failed (funcsize=110)"
#error "92F04: call analysis failed (funcsize=29)"
#error "92F78: call analysis failed (funcsize=29)"
#error "92FEC: call analysis failed (funcsize=29)"
#error "93060: call analysis failed (funcsize=29)"
#error "930D4: call analysis failed (funcsize=29)"
#error "93148: call analysis failed (funcsize=29)"
uint64_t sub_9316C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  BOOL v34 = a1;
  uint64_t v3 = sub_26B0(&qword_D37D0);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v33 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v33 - v10;
  uint64_t v12 = sub_26B0(&qword_D3A08);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v33 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v33 - v19;
  uint64_t v21 = a2 + *(int *)(_s20HandleIntentStrategyVMa_4(0LL) + 20);
  sub_34BBC(v21, (uint64_t)v11);
  uint64_t v22 = type metadata accessor for HALAlarmDeviceContext(0LL);
  if (sub_16880((uint64_t)v11, 1LL, v22) == 1)
  {
    sub_93788((uint64_t)v11, &qword_D37D0);
  }

  else
  {
    uint64_t v23 = (void *)HALDeviceContext.remoteDevice.getter(v22);
    uint64_t v24 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8LL))(v11, v22);
    if (v23)
    {
      DeviceUnit.dialogType.getter(v24);

      uint64_t v25 = 0LL;
      goto LABEL_6;
    }
  }

  uint64_t v25 = 1LL;
LABEL_6:
  uint64_t v26 = type metadata accessor for SpeakableString(0LL);
  sub_A40C((uint64_t)v20, v25, 1LL, v26);
  uint64_t v27 = (int *)type metadata accessor for SnoozeIntentHandledParameters(0LL);
  sub_1B4F0((uint64_t)v20, v34 + v27[6]);
  sub_34BBC(v21, (uint64_t)v9);
  if (sub_16880((uint64_t)v9, 1LL, v22) == 1)
  {
    sub_93788((uint64_t)v9, &qword_D37D0);
  }

  else
  {
    uint64_t v28 = (void *)HALDeviceContext.remoteDevice.getter(v22);
    uint64_t v29 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8LL))(v9, v22);
    if (v28)
    {
      DeviceUnit.room.getter(v29);

      goto LABEL_11;
    }
  }

  sub_A40C((uint64_t)v18, 1LL, 1LL, v26);
LABEL_11:
  sub_1B4F0((uint64_t)v18, v34 + v27[7]);
  sub_34BBC(v21, (uint64_t)v6);
  if (sub_16880((uint64_t)v6, 1LL, v22) == 1)
  {
    sub_93788((uint64_t)v6, &qword_D37D0);
LABEL_15:
    sub_A40C((uint64_t)v15, 1LL, 1LL, v26);
    return sub_1B4F0((uint64_t)v15, v34 + v27[5]);
  }

  uint64_t v30 = (void *)HALDeviceContext.remoteDevice.getter(v22);
  uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8LL))(v6, v22);
  if (!v30) {
    goto LABEL_15;
  }
  DeviceUnit.deviceName.getter(v31);

  return sub_1B4F0((uint64_t)v15, v34 + v27[5]);
}

uint64_t sub_934B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D789C);
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_93510;
  return sub_91FF4(a1, a2);
}

uint64_t sub_93510()
{
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    return sub_1B5EC(*(uint64_t (**)(void))(v1 + 8));
  }
  sub_19840();
  return sub_1988C();
}

uint64_t sub_9355C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v1;
  sub_26B0(&qword_D4890);
  uint64_t v2 = static BarbaraWalters.logAndReturnError<A>(context:_:)(0xD00000000000005DLL, 0x80000000000AA580LL, v0 + 24);
  swift_willThrow(v2, v3, v4, v5, v6, v7, v8, v9);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_935EC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D78BC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_34358;
  return sub_91B5C(a1);
}

uint64_t sub_9363C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D7894);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_34358;
  return sub_934B0(a1, a2);
}

uint64_t sub_9369C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_D7470 + dword_D7470);
  uint64_t v3 = (void *)swift_task_alloc(unk_D7474);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_3429C;
  return v5(a1);
}

uint64_t sub_93710()
{
  return sub_65E74(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

unint64_t sub_93748()
{
  unint64_t result = qword_D7850[0];
  if (!qword_D7850[0])
  {
    uint64_t v1 = _s20HandleIntentStrategyVMa_4(255LL);
    unint64_t result = swift_getWitnessTable(&unk_A76D0, v1);
    atomic_store(result, qword_D7850);
  }

  return result;
}

uint64_t sub_93788(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_26B0(a2);
  sub_17AD0(*(void *)(v3 - 8));
  return a1;
}

uint64_t sub_937BC(uint64_t a1)
{
  return sub_9316C(a1, *(void *)(v1 + 16));
}

uint64_t sub_937C4()
{
  return swift_task_dealloc(*(void *)(v0 + 512));
}

uint64_t sub_9380C()
{
  uint64_t v2 = v0[65];
  uint64_t v3 = v0[64];
  *(void *)(v1 - 96) = v0[63];
  *(void *)(v1 - 88) = v0[62];
  *(void *)(v1 - 80) = v3;
  return IntentResolutionRecord.intentResponse.getter(v2);
}

uint64_t sub_93878()
{
  uint64_t v2 = v0[64];
  uint64_t v3 = v0[34];
  *(void *)(v1 - 96) = v0[37];
  *(void *)(v1 - 88) = v3;
  *(void *)(v1 - 80) = v0[31];
  return swift_task_dealloc(v2);
}

uint64_t sub_938C0()
{
  return (*(uint64_t (**)(void, void))(v0[58] + 8LL))(v0[59], v0[57]);
}

uint64_t sub_938D8()
{
  return (*(uint64_t (**)(void, void))(v0[58] + 8LL))(v0[59], v0[57]);
}

uint64_t sub_938E8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_93904( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a15, v16, a16);
}

uint64_t sub_93928(uint64_t a1)
{
  return ExecutionInfo.init(executionId:action:quickStopActionResult:)(v1, v3, v2);
}

uint64_t sub_93958()
{
  return dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()(v1, v2);
}

uint64_t sub_9397C(uint64_t a1, uint64_t a2)
{
  return UUID.init(uuidString:)(a1, a2);
}

uint64_t sub_939A8()
{
  return (*(uint64_t (**)(void, void, void))(v0[43] + 32LL))(v0[45], v0[41], v0[42]);
}

uint64_t sub_939C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a10 + 16))(v10, v12, v11);
}

uint64_t sub_939DC@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X8>)
{
  if (v4 != a1) {
    a2 = v3;
  }
  return v2(v6, *a2, v5);
}

uint64_t sub_939F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a11 + 104))(a14, a2, a17);
}

uint64_t sub_93A0C(uint64_t a1)
{
  return sub_34BBC(v1 + *(int *)(a1 + 20), v2);
}

uint64_t sub_93A1C()
{
  return sub_16880(v1, 1LL, v0);
}

uint64_t sub_93A3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a18 + 104))(v19, a2, a19);
}

uint64_t sub_93A50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a20 + 8))(a22, a21);
}

uint64_t sub_93A60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a13 + 8))(a12, v13);
}

uint64_t sub_93A70()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_93A80()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_93A90()
{
  return _s20HandleIntentStrategyVMa_4(0LL);
}

uint64_t sub_93A98(uint64_t a1)
{
  return sub_16880(v1, 1LL, a1);
}

uint64_t sub_93AB8(__int128 *a1)
{
  uint64_t v2 = sub_46FC(a1, *(void *)(v1 + 224));
  return static AceService.currentAsync.getter(v2);
}

uint64_t sub_93AD0()
{
  return SnoozeAlarmHalIntentResponseCode.rawValue.getter(4LL);
}

uint64_t sub_93ADC()
{
  return type metadata accessor for ExecutionInfo.QuickStopActionResult(0LL);
}

uint64_t sub_93AE4()
{
  return type metadata accessor for DeviceResolutionService(0LL);
}

  ;
}

uint64_t sub_93B08()
{
  return v0;
}

uint64_t sub_93B18()
{
  return _s20HandleIntentStrategyVwxx_1(v0);
}

uint64_t sub_93B20()
{
  return static DeviceResolutionService.sharedAnalytics.getter();
}

uint64_t sub_93B28()
{
  return dispatch thunk of SnoozeAlarmHalIntentResponse.code.getter();
}

uint64_t sub_93B30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return AceOutput.init(commands:flowActivity:)(v10, va);
}

uint64_t sub_93B40(uint64_t a1, uint64_t *a2)
{
  return sub_93788(v2, a2);
}

uint64_t sub_93B48()
{
  return *(void *)(v0 - 80);
}

void sub_93B58()
{
}

uint64_t sub_93B60()
{
  return SnoozeAlarmHalIntentResponseCode.rawValue.getter(v0);
}

uint64_t sub_93B68(uint64_t a1, uint64_t *a2)
{
  return sub_93788(v2, a2);
}

uint64_t sub_93B70()
{
  return dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)(v0);
}

void *INDateComponentsRange.alarmRepeatSchedule.getter()
{
  id v1 = [v0 recurrenceRule];
  if (v1)
  {
    uint64_t v2 = v1;
    if ([v1 frequency] == (char *)&dword_0 + 3)
    {
      if (qword_D31D8 != -1) {
        swift_once(&qword_D31D8, sub_93D34);
      }
      uint64_t v3 = type metadata accessor for Logger(0LL);
      uint64_t v4 = sub_26F0(v3, (uint64_t)qword_D78C8);
      uint64_t v12 = (os_log_s *)Logger.logObject.getter(v4, v5, v6, v7, v8, v9, v10, v11);
      os_log_type_t v13 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)sub_1EFA4();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_0, v12, v13, "User requested to set alarm for every day.", v14, 2u);
        sub_16AA8((uint64_t)v14);
      }

      char v15 = 127;
    }

    else
    {
      char v15 = [v2 weeklyRecurrenceDays];
    }

    sub_506D0(v15);
    uint64_t v27 = v28;
  }

  else
  {
    if (qword_D31D8 != -1) {
      swift_once(&qword_D31D8, sub_93D34);
    }
    uint64_t v16 = type metadata accessor for Logger(0LL);
    uint64_t v17 = sub_26F0(v16, (uint64_t)qword_D78C8);
    uint64_t v2 = (void *)Logger.logObject.getter(v17, v18, v19, v20, v21, v22, v23, v24);
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled((os_log_t)v2, v25))
    {
      uint64_t v26 = (uint8_t *)sub_1EFA4();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, (os_log_t)v2, v25, "No weeklyRecurrenceDays found.", v26, 2u);
      sub_16AA8((uint64_t)v26);
    }

    uint64_t v27 = &_swiftEmptyArrayStorage;
  }

  return v27;
}

uint64_t sub_93D34()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D78C8);
  sub_26F0(v0, (uint64_t)qword_D78C8);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t destroy for AlarmSnapshot(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 32));
}

uint64_t initializeWithCopy for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t assignWithCopy for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AlarmSnapshot(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(*(void *)(a1 + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v4);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for AlarmSnapshot(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 41))
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

uint64_t storeEnumTagSinglePayload for AlarmSnapshot(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 41) = 1;
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

    *(_BYTE *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AlarmSnapshot()
{
  return &type metadata for AlarmSnapshot;
}

uint64_t sub_93F70()
{
  id v1 = v0;
  id v2 = [objc_allocWithZone(SKIDirectInvocationContext) init];
  [v2 setInputOrigin:SAInputOriginDialogButtonTapValue];
  [v2 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
  sub_94C30();
  uint64_t v4 = v3;

  return v4;
}

void sub_93FFC()
{
  v34[2] = v1;
  v34[1] = v2;
  uint64_t v3 = sub_95BA0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_177D8();
  uint64_t v7 = (char *)(v5 - v6);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v34 - v9;
  uint64_t v11 = sub_95B98();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_95B50();
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v12 + 104))( v0,  enum case for DirectInvocationUtils.Alarm.URI.buttonPress(_:),  v11);
  uint64_t v14 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v13);
  uint64_t v16 = v15;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v11);
  v34[0] = sub_948EC(v14, v16);
  uint64_t v17 = sub_26B0(&qword_D7918);
  uint64_t inited = swift_initStackObject(v17, &v36);
  *(_OWORD *)(inited + 16) = xmmword_A5960;
  uint64_t v19 = *(uint64_t (**)(char *, void, uint64_t))(v4 + 104);
  uint64_t v20 = v19(v10, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v3);
  DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v20);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  v21(v10, v3);
  sub_95C90();
  uint64_t v22 = sub_95C84((uint64_t)v35);
  uint64_t v23 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v22);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v23;
  *(void *)(inited + 80) = v24;
  uint64_t v25 = v19(v7, enum case for DirectInvocationUtils.Alarm.UserInfoKey.buttonPressed(_:), v3);
  uint64_t v26 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v25);
  uint64_t v28 = v27;
  v21(v7, v3);
  v35[0] = v26;
  v35[1] = v28;
  uint64_t v29 = sub_95C84((uint64_t)v35);
  uint64_t v30 = ButtonOption.rawValue.getter(v29);
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v30;
  *(void *)(inited + 152) = v31;
  uint64_t v32 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v33 = v34[0];
  sub_95808(v32, v34[0]);
  sub_9495C();

  sub_16CB0();
}

void sub_94238()
{
}

void sub_94244()
{
  uint64_t v40 = v3;
  uint64_t v41 = v4;
  uint64_t v42 = v5;
  uint64_t v39 = sub_45B54();
  sub_95C44();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_95B7C();
  sub_95C2C();
  __chkstk_darwin(v8);
  sub_177D8();
  uint64_t v11 = (char *)(v9 - v10);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v36 - v13;
  sub_95B98();
  sub_95BA8();
  __chkstk_darwin(v15);
  sub_95BF4();
  uint64_t v17 = sub_95C1C(v16, enum case for DirectInvocationUtils.Alarm.URI.undo(_:));
  uint64_t v38 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v17);
  uint64_t v37 = v18;
  sub_44FE0();
  uint64_t v19 = sub_26B0(&qword_D40F0);
  uint64_t inited = swift_initStackObject(v19, &v43);
  *(_OWORD *)(inited + 16) = xmmword_A5960;
  uint64_t v21 = *(uint64_t (**)(char *, void, uint64_t))(v0 + 104);
  uint64_t v22 = v21(v14, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v7);
  uint64_t v23 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v22);
  uint64_t v25 = v24;
  uint64_t v26 = *(void (**)(char *, uint64_t))(v0 + 8);
  v26(v14, v7);
  *(void *)(inited + 32) = v23;
  *(void *)(inited + 40) = v25;
  uint64_t v27 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 104))( v2,  enum case for AlarmNLv4Constants.AlarmVerb.delete(_:),  v39);
  uint64_t v28 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v27);
  uint64_t v30 = v29;
  sub_58A74(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v28;
  *(void *)(inited + 56) = v30;
  v21(v11, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v7);
  uint64_t v31 = sub_95CC0();
  uint64_t v33 = v32;
  v26(v11, v7);
  *(void *)(inited + 80) = v31;
  *(void *)(inited + 88) = v33;
  *(void *)(inited + 120) = &type metadata for String;
  uint64_t v34 = v41;
  *(void *)(inited + 96) = v40;
  *(void *)(inited + 104) = v34;
  swift_bridgeObjectRetain(v34);
  uint64_t v35 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  Parse.DirectInvocation.init(identifier:userData:)(v38, v37, v35);
  sub_16CB0();
}

void sub_9442C()
{
}

void sub_94438()
{
  uint64_t v40 = v4;
  uint64_t v41 = v3;
  uint64_t v42 = v5;
  uint64_t v37 = sub_45B54();
  sub_95C64();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_95B7C();
  sub_95C2C();
  __chkstk_darwin(v8);
  sub_177D8();
  uint64_t v11 = v9 - v10;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v36 - v13;
  sub_95B98();
  sub_95BA8();
  __chkstk_darwin(v15);
  sub_95BF4();
  uint64_t v17 = sub_95C1C(v16, enum case for DirectInvocationUtils.Alarm.URI.undo(_:));
  uint64_t v18 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v17);
  uint64_t v38 = v19;
  uint64_t v39 = v18;
  sub_44FE0();
  uint64_t v20 = sub_26B0(&qword_D40F0);
  uint64_t inited = swift_initStackObject(v20, &v43);
  *(_OWORD *)(inited + 16) = xmmword_A5960;
  uint64_t v22 = *(void (**)(char *, void, uint64_t))(v0 + 104);
  v22(v14, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v7);
  uint64_t v23 = sub_95CC0();
  uint64_t v25 = v24;
  sub_95C3C((uint64_t)v14);
  *(void *)(inited + 32) = v23;
  *(void *)(inited + 40) = v25;
  uint64_t v26 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *v40, v37);
  uint64_t v27 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v26);
  uint64_t v29 = v28;
  sub_58A74(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v27;
  *(void *)(inited + 56) = v29;
  uint64_t v30 = ((uint64_t (*)(uint64_t, void, uint64_t))v22)( v11,  enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:),  v7);
  uint64_t v31 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v30);
  uint64_t v33 = v32;
  sub_95C3C(v11);
  *(void *)(inited + 80) = v31;
  *(void *)(inited + 88) = v33;
  *(void *)(inited + 120) = sub_26B0(&qword_D3838);
  uint64_t v34 = v41;
  *(void *)(inited + 96) = v41;
  swift_bridgeObjectRetain(v34);
  uint64_t v35 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  Parse.DirectInvocation.init(identifier:userData:)(v39, v38, v35);
  sub_16CB0();
}

void sub_94618()
{
  uint64_t v2 = v1;
  uint64_t v52 = v3;
  uint64_t v4 = sub_45B54();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  __chkstk_darwin(v4);
  sub_16B30();
  uint64_t v6 = v5;
  uint64_t v7 = sub_95BA0();
  __chkstk_darwin(v7);
  sub_16B08();
  uint64_t v49 = v8;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v46 - v10;
  uint64_t v12 = sub_95B98();
  sub_95C44();
  __chkstk_darwin(v13);
  sub_17390();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  JSONEncoder.init()();
  uint64_t v54 = v2;
  uint64_t v18 = sub_26B0(&qword_D3800);
  unint64_t v19 = sub_95A88();
  uint64_t v20 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v54, v18, v19);
  unint64_t v22 = v21;
  uint64_t v48 = v20;
  sub_17324();
  uint64_t v23 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v0 + 104))( v16,  enum case for DirectInvocationUtils.Alarm.URI.undo(_:),  v12);
  uint64_t v47 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v23);
  uint64_t v46 = v24;
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v16, v12);
  uint64_t v25 = sub_26B0(&qword_D40F0);
  uint64_t inited = swift_initStackObject(v25, &v53);
  *(_OWORD *)(inited + 16) = xmmword_A5960;
  uint64_t v27 = sub_95CB4(inited, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:));
  uint64_t v28 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v27);
  uint64_t v30 = v29;
  sub_95C3C((uint64_t)v11);
  *(void *)(inited + 32) = v28;
  *(void *)(inited + 40) = v30;
  uint64_t v31 = v50;
  uint64_t v32 = v51;
  uint64_t v33 = v6;
  uint64_t v34 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v50 + 104))( v6,  enum case for AlarmNLv4Constants.AlarmVerb.create(_:),  v51);
  uint64_t v35 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v34);
  uint64_t v37 = v36;
  uint64_t v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v35;
  *(void *)(inited + 56) = v37;
  uint64_t v39 = v49;
  uint64_t v40 = sub_95CB4(v38, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmSnapshotsJson(_:));
  uint64_t v41 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v40);
  uint64_t v43 = v42;
  sub_95C3C(v39);
  *(void *)(inited + 80) = v41;
  *(void *)(inited + 88) = v43;
  *(void *)(inited + 120) = sub_26B0(&qword_D7948);
  uint64_t v44 = v48;
  *(void *)(inited + 96) = v48;
  *(void *)(inited + 104) = v22;
  sub_95B28(v44, v22);
  uint64_t v45 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  Parse.DirectInvocation.init(identifier:userData:)(v47, v46, v45);
  sub_95B3C(v44, v22);
  sub_16CB0();
}

id sub_948EC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithIdentifier:v5];

  return v6;
}

void sub_9495C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___SKIDirectInvocation);
  uint64_t v3 = type metadata accessor for ApplicationContext(0LL);
  uint64_t v4 = static ApplicationContext.shared.getter(v3);
  sub_95CC8(v4);
  sub_17324();
  NSString v5 = (void *)sub_95BD0(v8);
  id v6 = [v2 runSiriKitExecutorCommandWithContext:v5 payload:v1];

  _s20HandleIntentStrategyVwxx_1(v8);
  id v7 = [v2 wrapCommandInStartLocalRequest:v6];

  sub_95C74();
}

void sub_94A0C()
{
  uint64_t v37 = v2;
  uint64_t v36 = v3;
  uint64_t v35 = v4;
  uint64_t v5 = sub_95BA0();
  sub_95C44();
  __chkstk_darwin(v6);
  sub_177D8();
  uint64_t v9 = (char *)(v7 - v8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = sub_95B98();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_95B50();
  uint64_t v15 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v14 + 104))( v0,  enum case for DirectInvocationUtils.Alarm.URI.disambiguation(_:),  v13);
  uint64_t v16 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v15);
  uint64_t v18 = v17;
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v13);
  id v34 = sub_948EC(v16, v18);
  uint64_t v19 = sub_26B0(&qword_D7918);
  uint64_t inited = swift_initStackObject(v19, &v40);
  *(_OWORD *)(inited + 16) = xmmword_A5960;
  unint64_t v21 = *(uint64_t (**)(char *, void, uint64_t))(v1 + 104);
  uint64_t v22 = v21(v12, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v5);
  DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v22);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v1 + 8);
  v23(v12, v5);
  sub_95C90();
  uint64_t v24 = sub_95BBC();
  uint64_t v25 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v24);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v25;
  *(void *)(inited + 80) = v26;
  uint64_t v27 = v21(v9, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v5);
  uint64_t v28 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v27);
  uint64_t v30 = v29;
  v23(v9, v5);
  uint64_t v38 = v28;
  uint64_t v39 = v30;
  sub_95BBC();
  *(void *)(inited + 168) = &type metadata for String;
  uint64_t v31 = v37;
  *(void *)(inited + 144) = v36;
  *(void *)(inited + 152) = v31;
  swift_bridgeObjectRetain(v31);
  uint64_t v32 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  sub_95808(v32, v34);
  sub_16CB0();
}

void sub_94C30()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___SKIDirectInvocation);
  uint64_t v3 = type metadata accessor for ApplicationContext(0LL);
  uint64_t v4 = static ApplicationContext.shared.getter(v3);
  sub_95CC8(v4);
  sub_17324();
  uint64_t v5 = (void *)sub_95BD0(v7);
  id v6 = [v2 runSiriKitExecutorCommandWithContext:v5 payload:v1];

  _s20HandleIntentStrategyVwxx_1(v7);
  sub_95C74();
}

void sub_94CBC()
{
}

void sub_94CC8()
{
}

void sub_94CD4()
{
  uint64_t v51 = v2;
  int v55 = v3;
  uint64_t v54 = v4;
  uint64_t v5 = sub_45B54();
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  __chkstk_darwin(v5);
  sub_16B30();
  uint64_t v47 = v6;
  sub_95BA0();
  sub_95C2C();
  __chkstk_darwin(v7);
  sub_16B08();
  uint64_t v53 = v8;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v48 = (uint64_t)&v46 - v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v46 - v12;
  uint64_t v14 = sub_95B98();
  sub_95C64();
  __chkstk_darwin(v15);
  sub_95B50();
  uint64_t v16 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 104))( v0,  enum case for DirectInvocationUtils.Alarm.URI.handleVerbAction(_:),  v14);
  uint64_t v17 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v16);
  uint64_t v19 = v18;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v14);
  id v52 = sub_948EC(v17, v19);
  uint64_t v20 = sub_26B0(&qword_D7918);
  uint64_t inited = swift_initStackObject(v20, &v58);
  *(_OWORD *)(inited + 16) = xmmword_A5A80;
  sub_95CAC((uint64_t)v13, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:));
  uint64_t v22 = sub_95CC0();
  uint64_t v24 = v23;
  sub_95CA4((uint64_t)v13);
  uint64_t v56 = v22;
  uint64_t v57 = v24;
  AnyHashable.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  uint64_t v25 = v50;
  uint64_t v26 = v49;
  uint64_t v27 = v47;
  uint64_t v28 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v49 + 104))(v47, *v51, v50);
  uint64_t v29 = AlarmNLv4Constants.AlarmVerb.rawValue.getter(v28);
  uint64_t v31 = v30;
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v25);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v29;
  *(void *)(inited + 80) = v31;
  uint64_t v32 = v48;
  uint64_t v33 = sub_95CAC(v48, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:));
  uint64_t v34 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v33);
  uint64_t v36 = v35;
  sub_95CA4(v32);
  uint64_t v56 = v34;
  uint64_t v57 = v36;
  AnyHashable.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  uint64_t v37 = sub_4AD44(v54);
  uint64_t v39 = v38;
  *(void *)(inited + 168) = sub_26B0(&qword_D5328);
  *(void *)(inited + 144) = v37;
  *(void *)(inited + 152) = v39;
  uint64_t v40 = v53;
  uint64_t v41 = sub_95CAC(v53, enum case for DirectInvocationUtils.Alarm.UserInfoKey.handleSilently(_:));
  uint64_t v42 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v41);
  uint64_t v44 = v43;
  sub_95CA4(v40);
  uint64_t v56 = v42;
  uint64_t v57 = v44;
  AnyHashable.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  *(void *)(inited + 240) = &type metadata for Bool;
  *(_BYTE *)(inited + 216) = v55;
  uint64_t v45 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  sub_95808(v45, v52);
  sub_16CB0();
}

uint64_t sub_94FD8(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 1920298856 && a2 == 0xE400000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(1920298856LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  BOOL v6 = a1 == 0x6574756E696DLL && a2 == 0xE600000000000000LL;
  if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574756E696DLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  BOOL v7 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000LL;
  if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6562616CLL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v8 = 0x80000000000AA5E0LL;
    if (a2 == 0x80000000000AA5E0LL) {
      goto LABEL_23;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x80000000000AA5E0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_23:
    swift_bridgeObjectRelease(v8);
    return 3LL;
  }

  if (a1 == 0x64656C62616E65LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    return 4LL;
  }

  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64656C62616E65LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0) {
      return 4LL;
    }
    else {
      return 5LL;
    }
  }

uint64_t sub_951A8()
{
  return 5LL;
}

uint64_t sub_951B0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_951E8 + 4 * byte_A7774[a1]))( 0xD000000000000014LL,  0x80000000000AA5E0LL);
}

uint64_t sub_951E8()
{
  return 1920298856LL;
}

uint64_t sub_951F8()
{
  return 0x6574756E696DLL;
}

uint64_t sub_9520C()
{
  return 0x6C6562616CLL;
}

uint64_t sub_95220()
{
  return 0x64656C62616E65LL;
}

uint64_t sub_95238(void *a1)
{
  uint64_t v5 = v2;
  sub_26B0(&qword_D7900);
  sub_95BA8();
  __chkstk_darwin(v7);
  sub_17390();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_80B4(a1, v11);
  unint64_t v13 = sub_95730();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for AlarmSnapshot.CodingKeys,  &type metadata for AlarmSnapshot.CodingKeys,  v13,  v11,  v12);
  uint64_t v14 = *(void *)v5;
  char v27 = 0;
  sub_95C0C(v14, (uint64_t)&v27);
  if (!v3)
  {
    uint64_t v15 = *(void *)(v5 + 8);
    char v26 = 1;
    sub_95C0C(v15, (uint64_t)&v26);
    uint64_t v16 = *(void *)(v5 + 16);
    uint64_t v17 = *(void *)(v5 + 24);
    char v25 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v25, v1);
    uint64_t v24 = *(void *)(v5 + 32);
    char v23 = 3;
    uint64_t v18 = sub_26B0(&qword_D78F0);
    uint64_t v19 = sub_9576C( &qword_D7908,  (uint64_t)&protocol witness table for Int,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v1, v18, v19);
    uint64_t v20 = *(unsigned __int8 *)(v5 + 40);
    char v22 = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v20, &v22, v1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v10, v1);
}

uint64_t sub_953D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_26B0(&qword_D78E0);
  sub_95C64();
  __chkstk_darwin(v6);
  sub_17390();
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_80B4(a1, v7);
  unint64_t v9 = sub_95730();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for AlarmSnapshot.CodingKeys,  &type metadata for AlarmSnapshot.CodingKeys,  v9,  v7,  v8);
  if (v2) {
    return _s20HandleIntentStrategyVwxx_1(a1);
  }
  char v22 = 0;
  uint64_t v10 = sub_95C54((uint64_t)&v22);
  char v21 = 1;
  uint64_t v17 = sub_95C54((uint64_t)&v21);
  char v20 = 2;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
  uint64_t v13 = v12;
  uint64_t v16 = v11;
  uint64_t v14 = sub_26B0(&qword_D78F0);
  v19[1] = 3;
  sub_9576C( &qword_D78F8,  (uint64_t)&protocol witness table for Int,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v14);
  v19[0] = 4;
  swift_bridgeObjectRetain();
  LOBYTE(v14) = KeyedDecodingContainer.decode(_:forKey:)(v19, v5);
  sub_95B6C();
  _s20HandleIntentStrategyVwxx_1(a1);
  sub_17900();
  uint64_t result = sub_16D68();
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v17;
  *(void *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v18;
  *(_BYTE *)(a2 + 40) = v14 & 1;
  return result;
}

uint64_t sub_95620()
{
  return sub_951B0(*v0);
}

uint64_t sub_95628@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_94FD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_9564C()
{
  return sub_4F860();
}

uint64_t sub_95668@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_951A8();
  *a1 = result;
  return result;
}

uint64_t sub_9568C(uint64_t a1)
{
  unint64_t v2 = sub_95730();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_956B4(uint64_t a1)
{
  unint64_t v2 = sub_95730();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_956DC@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }

  return result;
}

uint64_t sub_9571C(void *a1)
{
  return sub_95238(a1);
}

unint64_t sub_95730()
{
  unint64_t result = qword_D78E8;
  if (!qword_D78E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_A78A8, &type metadata for AlarmSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_D78E8);
  }

  return result;
}

uint64_t sub_9576C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_16974(&qword_D78F0);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_957CC()
{
  unint64_t result = qword_D7910;
  if (!qword_D7910)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SKIDirectInvocationPayload);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_D7910);
  }

  return result;
}

void sub_95808(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  [a2 setUserData:isa];
}

uint64_t getEnumTagSinglePayload for AlarmSnapshot.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFC)
  {
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

    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for AlarmSnapshot.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_95948 + 4 * byte_A777E[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_9597C + 4 * byte_A7779[v4]))();
}

uint64_t sub_9597C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_95984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9598CLL);
  }
  return result;
}

uint64_t sub_95998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x959A0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_959A4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_959AC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AlarmSnapshot.CodingKeys()
{
  return &type metadata for AlarmSnapshot.CodingKeys;
}

unint64_t sub_959CC()
{
  unint64_t result = qword_D7920;
  if (!qword_D7920)
  {
    unint64_t result = swift_getWitnessTable(&unk_A7880, &type metadata for AlarmSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_D7920);
  }

  return result;
}

unint64_t sub_95A0C()
{
  unint64_t result = qword_D7928;
  if (!qword_D7928)
  {
    unint64_t result = swift_getWitnessTable(&unk_A77F0, &type metadata for AlarmSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_D7928);
  }

  return result;
}

unint64_t sub_95A4C()
{
  unint64_t result = qword_D7930;
  if (!qword_D7930)
  {
    unint64_t result = swift_getWitnessTable(&unk_A7818, &type metadata for AlarmSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_D7930);
  }

  return result;
}

unint64_t sub_95A88()
{
  unint64_t result = qword_D7938;
  if (!qword_D7938)
  {
    uint64_t v1 = sub_16974(&qword_D3800);
    sub_95AEC();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_D7938);
  }

  return result;
}

unint64_t sub_95AEC()
{
  unint64_t result = qword_D7940;
  if (!qword_D7940)
  {
    unint64_t result = swift_getWitnessTable(&unk_A7794, &type metadata for AlarmSnapshot);
    atomic_store(result, (unint64_t *)&qword_D7940);
  }

  return result;
}

uint64_t sub_95B28(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1EF38(result, a2);
  }
  return result;
}

uint64_t sub_95B3C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_168CC(result, a2);
  }
  return result;
}

unint64_t sub_95B50()
{
  return sub_957CC();
}

uint64_t sub_95B6C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_95B7C()
{
  return type metadata accessor for DirectInvocationUtils.Alarm.UserInfoKey(0LL);
}

uint64_t sub_95B98()
{
  return type metadata accessor for DirectInvocationUtils.Alarm.URI(0LL);
}

uint64_t sub_95BA0()
{
  return type metadata accessor for DirectInvocationUtils.Alarm.UserInfoKey(0LL);
}

  ;
}

uint64_t sub_95BBC()
{
  return AnyHashable.init<A>(_:)(v2 - 280, v0, v1);
}

uint64_t sub_95BD0(void *a1)
{
  return DeviceState.asInvocationContext.getter(v1, v2);
}

  ;
}

uint64_t sub_95C0C(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v2);
}

uint64_t sub_95C1C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

  ;
}

uint64_t sub_95C3C(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

uint64_t sub_95C54(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

  ;
}

  ;
}

uint64_t sub_95C84(uint64_t a1)
{
  return AnyHashable.init<A>(_:)(a1, v1, v2);
}

void sub_95C90()
{
  *(void *)(v2 - 280) = v0;
  *(void *)(v2 - 272) = v1;
}

uint64_t sub_95CA4(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_95CAC(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_95CB4(uint64_t a1, uint64_t a2)
{
  return v3(v4, a2, v2);
}

uint64_t sub_95CC0()
{
  return DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter();
}

void *sub_95CC8(uint64_t a1, ...)
{
  return ApplicationContext.deviceState.getter((uint64_t *)va);
}

unint64_t sub_95CD4()
{
  unint64_t result = qword_D7958;
  if (!qword_D7958)
  {
    uint64_t v1 = _s18NeedsValueStrategyCMa();
    unint64_t result = swift_getWitnessTable(&unk_A4EBC, v1);
    atomic_store(result, (unint64_t *)&qword_D7958);
  }

  return result;
}

unint64_t sub_95D14()
{
  unint64_t result = qword_D7968;
  if (!qword_D7968)
  {
    unint64_t result = swift_getWitnessTable(&unk_A6228, &_s20HandleIntentStrategyVN_0);
    atomic_store(result, (unint64_t *)&qword_D7968);
  }

  return result;
}

uint64_t *sub_95D50()
{
  if (qword_D31E0 != -1) {
    swift_once(&qword_D31E0, sub_95DD0);
  }
  return &qword_D8540;
}

uint64_t *sub_95D90()
{
  if (qword_D31F0 != -1) {
    swift_once(&qword_D31F0, sub_95E08);
  }
  return &qword_D8550;
}

uint64_t sub_95DD0(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for ChangeAlarmStatusCATsSimple,  (uint64_t (*)(char *, void))&CATWrapperSimple.__allocating_init(options:globals:),  &qword_D8540);
}

uint64_t sub_95DEC(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for ChangeAlarmStatusCATPatternsExecutor,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_D8548);
}

uint64_t sub_95E08(uint64_t a1)
{
  return sub_53C90( a1,  (void (*)(void))type metadata accessor for ModifyAllCATPatternsExecutor,  (uint64_t (*)(char *, void))&CATWrapper.__allocating_init(options:globals:),  &qword_D8550);
}

uint64_t type metadata accessor for SnoozeAlarmCATs_Async(uint64_t a1)
{
  uint64_t result = qword_D7970;
  if (!qword_D7970) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SnoozeAlarmCATs_Async);
  }
  return result;
}

uint64_t sub_95E5C(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D8558);
}

uint64_t sub_95E98(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = v5;
  *(_BYTE *)(v6 + 89) = a3;
  *(_BYTE *)(v6 + 88) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a4;
  unint64_t v7 = (*(void *)(*(void *)(sub_26B0(&qword_D3A08) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 48) = swift_task_alloc(v7);
  *(void *)(v6 + 56) = swift_task_alloc(v7);
  return swift_task_switch(sub_95F10, 0LL, 0LL);
}

uint64_t sub_95F10()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(_BYTE *)(v0 + 89);
  char v4 = *(_BYTE *)(v0 + 88);
  uint64_t v5 = sub_26B0(&qword_D3BD0);
  uint64_t v6 = swift_allocObject(v5, 224LL, 7LL);
  *(void *)(v0 + 64) = v6;
  *(_OWORD *)(v6 + 16) = xmmword_A4A50;
  *(void *)(v6 + 32) = 0x6E6F737265507369LL;
  *(void *)(v6 + 40) = 0xEA00000000006C61LL;
  *(_BYTE *)(v6 + 48) = v4;
  *(void *)(v6 + 72) = &type metadata for Bool;
  *(void *)(v6 + 80) = 0x6E756D6D6F437369LL;
  *(void *)(v6 + 88) = 0xEA00000000006C61LL;
  *(_BYTE *)(v6 + 96) = v3;
  unint64_t v7 = (void *)(v6 + 144);
  *(void *)(v6 + 120) = &type metadata for Bool;
  *(void *)(v6 + 128) = 0x614E656369766564LL;
  *(void *)(v6 + 136) = 0xEA0000000000656DLL;
  sub_4D80(v2, v1, &qword_D3A08);
  uint64_t v8 = type metadata accessor for SpeakableString(0LL);
  int v9 = sub_8D204(v1);
  uint64_t v10 = *(void *)(v0 + 56);
  if (v9 == 1)
  {
    sub_19594(*(void *)(v0 + 56), &qword_D3A08);
    *(_OWORD *)unint64_t v7 = 0u;
    *(_OWORD *)(v6 + 160) = 0u;
  }

  else
  {
    *(void *)(v6 + 168) = v8;
    uint64_t v11 = sub_19558(v7);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v11, v10, v8);
  }

  uint64_t v12 = *(void *)(v0 + 48);
  uint64_t v13 = *(void *)(v0 + 32);
  *(void *)(v6 + 176) = 0x656D614E6D6F6F72LL;
  *(void *)(v6 + 184) = 0xE800000000000000LL;
  sub_4D80(v13, v12, &qword_D3A08);
  int v14 = sub_8D204(v12);
  uint64_t v15 = *(void *)(v0 + 48);
  if (v14 == 1)
  {
    sub_19594(*(void *)(v0 + 48), &qword_D3A08);
    *(_OWORD *)(v6 + 192) = 0u;
    *(_OWORD *)(v6 + 208) = 0u;
  }

  else
  {
    *(void *)(v6 + 216) = v8;
    uint64_t v16 = sub_19558((void *)(v6 + 192));
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v16, v15, v8);
  }

  *(void *)(v0 + 72) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_8CFD4;
  return ((uint64_t (*)(void, unint64_t, unint64_t, uint64_t))v19)( *(void *)(v0 + 16),  0xD000000000000024LL,  0x80000000000AA630LL,  v6);
}

uint64_t sub_96134()
{
  return type metadata accessor for SnoozeAlarmCATs_Async(0LL);
}

uint64_t sub_9613C()
{
  uint64_t v1 = sub_9821C();
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  uint64_t v3 = sub_19754(v2);
  uint64_t v4 = sub_981B8(v3);
  v0[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v0[6] = v5;
  v0[7] = sub_19754(v5);
  uint64_t v6 = sub_26B0(&qword_D40E8);
  v0[8] = sub_19754(*(void *)(v6 - 8));
  sub_19840();
  return sub_1988C();
}

uint64_t sub_961A8()
{
  if (qword_D3208 != -1) {
    swift_once(&qword_D3208, sub_979CC);
  }
  uint64_t v1 = (void *)swift_task_alloc(dword_D4DB4);
  *(void *)(v0 + 72) = v1;
  sub_981E4(v1);
  return sub_385E4();
}

uint64_t sub_9621C()
{
  return sub_1988C();
}

uint64_t sub_96258()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = TemplatingResult.sections.getter();
  sub_172C8(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_38F88(v4, v2);
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = type metadata accessor for TemplatingSection(0LL);
  uint64_t v6 = sub_16BBC(v2, 1LL, v5);
  if (v7)
  {
    sub_19594(*(void *)(v0 + 64), &qword_D40E8);
    uint64_t v13 = 0LL;
    unint64_t v15 = 0xE000000000000000LL;
  }

  else
  {
    uint64_t v8 = *(void *)(v0 + 64);
    uint64_t v10 = *(void *)(v0 + 24);
    uint64_t v9 = *(void *)(v0 + 32);
    uint64_t v11 = *(void *)(v0 + 16);
    TemplatingSection.content.getter(v6);
    uint64_t v12 = sub_172C8(v8, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL));
    uint64_t v13 = TemplatingText.text.getter(v12);
    unint64_t v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }

  uint64_t v16 = *(void *)(v0 + 56);
  uint64_t v17 = *(void *)(v0 + 32);
  swift_task_dealloc(*(void *)(v0 + 64));
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v13, v15);
}

uint64_t sub_96368()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_task_dealloc(*(void *)(v0 + 64));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_963B0(void *a1)
{
  uint64_t v151 = type metadata accessor for CharacterSet(0LL);
  uint64_t v149 = *(void *)(v151 - 8);
  sub_16AFC();
  __chkstk_darwin(v4);
  sub_16B08();
  uint64_t v148 = v5;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v147 = (char *)&v142 - v8;
  __chkstk_darwin(v7);
  uint64_t v150 = (char *)&v142 - v9;
  uint64_t v145 = sub_26B0(&qword_D7A18);
  sub_215E4();
  __chkstk_darwin(v10);
  sub_16B08();
  uint64_t v153 = v11;
  __chkstk_darwin(v12);
  unint64_t v14 = (char *)&v142 - v13;
  uint64_t v152 = type metadata accessor for Locale(0LL);
  uint64_t v155 = *(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v152 - 8);
  sub_16AFC();
  __chkstk_darwin(v15);
  sub_16B30();
  uint64_t v154 = (os_log_s *)v16;
  uint64_t v17 = sub_98224();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_95BF4();
  sub_26B0(&qword_D3820);
  sub_215E4();
  __chkstk_darwin(v19);
  sub_17390();
  uint64_t v22 = v21 - v20;
  os_log_type_t v158 = (void *)sub_4AFA8();
  uint64_t v156 = *(v158 - 1);
  sub_16AFC();
  __chkstk_darwin(v23);
  sub_16B30();
  uint64_t v157 = v24;
  sub_26B0(&qword_D37D8);
  sub_215E4();
  __chkstk_darwin(v25);
  uint64_t v26 = sub_9819C();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  sub_177D8();
  uint64_t v30 = (void *)(v28 - v29);
  __chkstk_darwin(v31);
  uint64_t v159 = (char *)&v142 - v32;
  uint64_t v146 = a1;
  id v33 = [a1 dateTime];
  if (!v33)
  {
    sub_981F4();
    sub_A40C(v47, v48, v49, v26);
    goto LABEL_11;
  }

  uint64_t v34 = v33;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v33);

  uint64_t v144 = v27;
  uint64_t v35 = *(void (**)(uint64_t, void *, uint64_t))(v27 + 32);
  v35(v2, v30, v26);
  sub_A40C(v2, 0LL, 1LL, v26);
  sub_16BBC(v2, 1LL, v26);
  if (v36)
  {
LABEL_11:
    sub_19594(v2, &qword_D37D8);
    if (qword_D31F8 != -1) {
      swift_once(&qword_D31F8, sub_97944);
    }
    uint64_t v50 = sub_16C80();
    sub_16CD0(v50, (uint64_t)qword_D79C8);
    os_log_type_t v51 = sub_16D40();
    if (sub_16ACC(v51))
    {
      id v52 = (_WORD *)sub_16AC4(2LL);
      *id v52 = 0;
      sub_16ADC( &dword_0,  v53,  v54,  "getFormattedTimeComponentsForSnippet: DateComponents not available from alarm in intent response.");
      sub_16AA8((uint64_t)v52);
    }

    return 0LL;
  }

  uint64_t v37 = v159;
  v35((uint64_t)v159, (void *)v2, v26);
  sub_98214();
  Calendar.date(from:)(v37);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v17);
  uint64_t v38 = v158;
  sub_16BBC(v22, 1LL, (uint64_t)v158);
  if (!v36)
  {
    uint64_t v143 = v26;
    (*(void (**)(uint64_t, uint64_t, void *))(v156 + 32))(v157, v22, v38);
    id v57 = [objc_allocWithZone(NSDateFormatter) init];
    if (qword_D3200 != -1) {
      swift_once(&qword_D3200, sub_97960);
    }
    uint64_t v58 = v152;
    uint64_t v59 = sub_26F0(v152, (uint64_t)qword_D79E0);
    uint64_t v60 = v154;
    sub_16E84((uint64_t)v154, v59, v155[2]);
    Class isa = Locale._bridgeToObjectiveC()().super.isa;
    sub_17124((uint64_t)v60);
    [v57 setLocale:isa];

    if (qword_D31F8 != -1) {
      swift_once(&qword_D31F8, sub_97944);
    }
    uint64_t v62 = sub_16C80();
    uint64_t v63 = sub_26F0(v62, (uint64_t)qword_D79C8);
    uint64_t v64 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v57;
    sub_9820C((uint64_t)v64, v65, v66, v67, v68, v69, v70, v71, v142, v143, v144, v145, (uint64_t)v146);
    os_log_type_t v72 = sub_16C50();
    if (os_log_type_enabled(v60, v72))
    {
      uint64_t v142 = v63;
      os_log_type_t v73 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v74 = sub_16AC4(32LL);
      uint64_t v160 = v74;
      *(_DWORD *)os_log_type_t v73 = 136315138;
      id v75 = sub_98200();
      if (v75)
      {
        id v76 = v75;
        static Locale._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v77 = 0LL;
      }

      else
      {
        uint64_t v77 = 1LL;
      }

      sub_17AF4((uint64_t)v14, v77);
      uint64_t v78 = String.init<A>(describing:)(v14, v145);
      unint64_t v80 = v79;
      uint64_t v81 = sub_3D10(v78, v79, &v160);
      uint64_t v82 = sub_4B078(v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v82, v83, v73 + 4, v84);

      swift_bridgeObjectRelease(v80);
      _os_log_impl(&dword_0, v60, v72, "getFormattedTimeComponentsForSnippet: Using locale for snippet: %s", v73, 0xCu);
      sub_981C4();
      sub_16AA8(v74);
      sub_16AA8((uint64_t)v73);
    }

    else
    {
    }

    char v85 = sub_97A44();
    NSString v86 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(0xE400000000000000LL);
    id v87 = sub_98200();
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = (uint64_t)v154;
      static Locale._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v90 = v153;
      sub_16E84(v153, v89, v155[4]);
      sub_17AF4(v90, 0LL);
      sub_16BBC(v90, 1LL, v58);
      if (!v36)
      {
        v91.super.Class isa = Locale._bridgeToObjectiveC()().super.isa;
        sub_17124(v90);
        goto LABEL_33;
      }
    }

    else
    {
      sub_17AF4(v153, 1LL);
    }

    v91.super.Class isa = 0LL;
LABEL_33:
    id v92 =  [(id)objc_opt_self(NSDateFormatter) dateFormatFromTemplate:v86 options:0 locale:v91.super.isa];

    if (v92)
    {
      uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(v92);
      uint64_t v95 = v94;

      uint64_t v160 = v93;
      id v161 = v95;
      uint64_t v96 = (uint64_t)v147;
      static CharacterSet.whitespaces.getter();
      uint64_t v97 = v148;
      CharacterSet.init(charactersIn:)(97LL, 0xE100000000000000LL);
      uint64_t v98 = (uint64_t)v150;
      CharacterSet.union(_:)(v97);
      sub_17124(v97);
      sub_17124(v96);
      unint64_t v99 = sub_6898();
      v91.super.Class isa = (Class)&v160;
      uint64_t v100 = StringProtocol.trimmingCharacters(in:)(v98, &type metadata for String, v99);
      id v92 = v101;
      sub_17124(v98);
      swift_bridgeObjectRelease(v161);
    }

    else
    {
      uint64_t v100 = 0LL;
    }

    uint64_t v102 = sub_2D0CC((uint64_t)v92);
    sub_9820C(v102, v103, v104, v105, v106, v107, v108, v109, v142, v143, v144, v145, (uint64_t)v146);
    os_log_type_t v110 = sub_16C50();
    BOOL v111 = sub_286C4(v110);
    uint64_t v154 = (os_log_s *)v100;
    uint64_t v155 = v64;
    if (v111)
    {
      uint64_t v112 = (_DWORD *)sub_16AC4(12LL);
      uint64_t v113 = sub_16AC4(32LL);
      id v161 = v92;
      uint64_t v162 = v113;
      *uint64_t v112 = 136315138;
      uint64_t v160 = v100;
      swift_bridgeObjectRetain(v92);
      uint64_t v114 = sub_26B0(&qword_D5328);
      uint64_t v115 = String.init<A>(describing:)(&v160, v114);
      unint64_t v117 = v116;
      uint64_t v160 = sub_3D10(v115, v116, &v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v160, &v161, v112 + 1, v112 + 3);
      sub_16C88((uint64_t)v92);
      swift_bridgeObjectRelease(v117);
      sub_4517C(&dword_0, v118, v119, "getFormattedTimeComponentsForSnippet: Alarm time format: %s");
      swift_arrayDestroy(v113, 1LL);
      sub_16AA8(v113);
      uint64_t v120 = (uint64_t)v112;
      uint64_t v64 = v155;
      sub_16AA8(v120);

      if (v92)
      {
LABEL_38:
        NSString v121 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v92);
        goto LABEL_41;
      }
    }

    else
    {

      sub_16C88((uint64_t)v92);
      if (v92) {
        goto LABEL_38;
      }
    }

    NSString v121 = 0LL;
LABEL_41:
    [v64 setDateFormat:v121];

    Class v122 = Date._bridgeToObjectiveC()().super.isa;
    id v123 = [v64 stringFromDate:v122];

    uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v123);
    unint64_t v125 = v124;

    uint64_t v126 = sub_2D0CC(v125);
    sub_9820C(v126, v127, v128, v129, v130, v131, v132, v133, v142, v143, v144, v145, (uint64_t)v146);
    os_log_type_t v134 = sub_16C50();
    if (sub_286C4(v134))
    {
      id v135 = (_DWORD *)sub_16AC4(12LL);
      uint64_t v136 = sub_16AC4(32LL);
      uint64_t v160 = v136;
      *id v135 = 136315138;
      swift_bridgeObjectRetain(v125);
      uint64_t v137 = sub_3D10(v55, v125, &v160);
      uint64_t v138 = sub_4B078(v137);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v138, v139, v135 + 1, v135 + 3);
      swift_bridgeObjectRelease_n(v125, 3LL);
      sub_4517C(&dword_0, v140, v141, "getFormattedTimeComponentsForSnippet: Alarm time to print: %s");
      swift_arrayDestroy(v136, 1LL);
      sub_16AA8(v136);
      sub_16AA8((uint64_t)v135);

      if ((v85 & 1) == 0)
      {
LABEL_43:
        sub_97DB8(v146);

LABEL_46:
        (*(void (**)(uint64_t, void *))(v156 + 8))(v157, v158);
        (*(void (**)(char *, uint64_t))(v144 + 8))(v159, v143);
        return v55;
      }
    }

    else
    {

      sub_16C88(v125);
      if ((v85 & 1) == 0) {
        goto LABEL_43;
      }
    }

    goto LABEL_46;
  }

  uint64_t v39 = v26;
  sub_19594(v22, &qword_D3820);
  if (qword_D31F8 != -1) {
    swift_once(&qword_D31F8, sub_97944);
  }
  uint64_t v40 = sub_16C80();
  sub_16CD0(v40, (uint64_t)qword_D79C8);
  os_log_type_t v41 = sub_16D40();
  BOOL v42 = sub_16ACC(v41);
  uint64_t v43 = v144;
  if (v42)
  {
    uint64_t v44 = (_WORD *)sub_16AC4(2LL);
    _WORD *v44 = 0;
    sub_16ADC(&dword_0, v45, v46, "getFormattedTimeComponentsForSnippet: Could not get date from alarmDateComponents.");
    sub_16AA8((uint64_t)v44);
  }

  (*(void (**)(char *, uint64_t))(v43 + 8))(v159, v39);
  return 0LL;
}

uint64_t sub_96E24(void *a1)
{
  uint64_t v4 = type metadata accessor for Locale(0LL);
  uint64_t v74 = *(void *)(v4 - 8);
  uint64_t v75 = v4;
  sub_16AFC();
  __chkstk_darwin(v5);
  sub_17390();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_98224();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_95BF4();
  sub_26B0(&qword_D3820);
  sub_215E4();
  __chkstk_darwin(v11);
  sub_17390();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_4AFA8();
  uint64_t v77 = *(void *)(v15 - 8);
  uint64_t v78 = v15;
  sub_16AFC();
  __chkstk_darwin(v16);
  sub_16B30();
  uint64_t v76 = v17;
  sub_26B0(&qword_D37D8);
  sub_215E4();
  __chkstk_darwin(v18);
  sub_177C0();
  uint64_t v19 = (void *)type metadata accessor for DateComponents(0LL);
  uint64_t v20 = *(v19 - 1);
  __chkstk_darwin(v19);
  sub_177D8();
  uint64_t v23 = v21 - v22;
  __chkstk_darwin(v24);
  uint64_t v79 = (uint64_t)&v72 - v25;
  id v26 = [a1 dateTime];
  if (!v26)
  {
    sub_981F4();
    sub_A40C(v36, v37, v38, (uint64_t)v19);
    goto LABEL_11;
  }

  uint64_t v27 = v26;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v26);

  uint64_t v73 = v20;
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, void *))(v20 + 32);
  v28(v2, v23, v19);
  sub_A40C(v2, 0LL, 1LL, (uint64_t)v19);
  sub_16BBC(v2, 1LL, (uint64_t)v19);
  if (v29)
  {
LABEL_11:
    sub_19594(v2, &qword_D37D8);
    if (qword_D31F8 != -1) {
      swift_once(&qword_D31F8, sub_97944);
    }
    uint64_t v39 = sub_16C80();
    sub_16CD0(v39, (uint64_t)qword_D79C8);
    os_log_type_t v40 = sub_16D40();
    if (sub_16ACC(v40))
    {
      os_log_type_t v41 = (_WORD *)sub_16AC4(2LL);
      *os_log_type_t v41 = 0;
      sub_16ADC(&dword_0, v42, v43, "DateComponents not available from alarm in intent response.");
      sub_16AA8((uint64_t)v41);
    }

    return 0LL;
  }

  uint64_t v30 = v79;
  v28(v79, v2, v19);
  sub_98214();
  Calendar.date(from:)(v30);
  (*(void (**)(os_log_s *, uint64_t))(v10 + 8))(v1, v9);
  uint64_t v31 = v78;
  sub_16BBC(v14, 1LL, v78);
  if (v29)
  {
    sub_19594(v14, &qword_D3820);
    uint64_t v32 = v73;
    if (qword_D31F8 != -1) {
      swift_once(&qword_D31F8, sub_97944);
    }
    uint64_t v33 = sub_16C80();
    sub_16CD0(v33, (uint64_t)qword_D79C8);
    os_log_type_t v34 = sub_17714();
    if (os_log_type_enabled(v1, v34))
    {
      uint64_t v35 = (uint8_t *)sub_16AC4(2LL);
      *(_WORD *)uint64_t v35 = 0;
      sub_16B44(&dword_0, v1, v34, "Could not get date from alarmDateComponents.", v35);
      sub_16AA8((uint64_t)v35);
    }

    sub_172C8(v79, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    return 0LL;
  }

  uint64_t v46 = v76;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v76, v14, v31);
  id v47 = [objc_allocWithZone(NSDateFormatter) init];
  if (qword_D3200 != -1) {
    swift_once(&qword_D3200, sub_97960);
  }
  uint64_t v48 = v75;
  uint64_t v49 = sub_26F0(v75, (uint64_t)qword_D79E0);
  uint64_t v50 = v74;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v8, v49, v48);
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v8, v48);
  [v47 setLocale:isa];

  [v47 setDateFormat:0];
  [v47 setTimeStyle:1];
  Class v52 = Date._bridgeToObjectiveC()().super.isa;
  id v53 = [v47 stringFromDate:v52];

  uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
  unint64_t v55 = v54;

  if (qword_D31F8 != -1) {
    swift_once(&qword_D31F8, sub_97944);
  }
  uint64_t v56 = sub_16C80();
  id v57 = (os_log_s *)sub_26F0(v56, (uint64_t)qword_D79C8);
  uint64_t v58 = sub_2D0CC(v55);
  Logger.logObject.getter(v58, v59, v60, v61, v62, v63, v64, v65);
  os_log_type_t v66 = sub_16C50();
  if (os_log_type_enabled(v57, v66))
  {
    uint64_t v67 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v68 = sub_16AC4(32LL);
    uint64_t v80 = v68;
    *(_DWORD *)uint64_t v67 = 136315138;
    swift_bridgeObjectRetain(v55);
    uint64_t v69 = sub_3D10(v44, v55, &v80);
    uint64_t v70 = sub_4B078(v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v70, v71, v67 + 4, v67 + 12);
    swift_bridgeObjectRelease_n(v55, 3LL);
    _os_log_impl(&dword_0, v57, v66, "getFullFormattedTimeForSnippet: Full alarm time to print: %s", v67, 0xCu);
    sub_981C4();
    sub_16AA8(v68);
    sub_16AA8((uint64_t)v67);

    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
  }

  else
  {
    sub_16C88(v55);

    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v46, v31);
  }

  sub_172C8(v79, *(uint64_t (**)(uint64_t, uint64_t))(v73 + 8));
  return v44;
}

uint64_t sub_97408@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v6 = sub_98224();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_95BF4();
  sub_26B0(&qword_D3820);
  sub_215E4();
  __chkstk_darwin(v8);
  sub_177C0();
  sub_26B0(&qword_D37D8);
  sub_215E4();
  __chkstk_darwin(v9);
  uint64_t v10 = sub_9819C();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_177D8();
  uint64_t v14 = v12 - v13;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v38 - v16;
  id v18 = [a1 dateTime];
  if (v18)
  {
    uint64_t v19 = v18;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v18);

    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
    v20(v4, v14, v10);
    sub_A40C(v4, 0LL, 1LL, v10);
    sub_16BBC(v4, 1LL, v10);
    if (!v21)
    {
      v20((uint64_t)v17, v4, v10);
      sub_98214();
      Calendar.date(from:)(v17);
      (*(void (**)(os_log_s *, uint64_t))(v7 + 8))(v2, v6);
      uint64_t v22 = sub_4AFA8();
      sub_16BBC(v3, 1LL, v22);
      if (v21)
      {
        sub_19594(v3, &qword_D3820);
        if (qword_D31F8 != -1) {
          swift_once(&qword_D31F8, sub_97944);
        }
        uint64_t v23 = sub_16C80();
        sub_16CD0(v23, (uint64_t)qword_D79C8);
        os_log_type_t v24 = sub_17714();
        if (os_log_type_enabled(v2, v24))
        {
          uint64_t v25 = (uint8_t *)sub_16AC4(2LL);
          *(_WORD *)uint64_t v25 = 0;
          sub_16B44(&dword_0, v2, v24, "getAlarmDate: Could not get date from alarmDateComponents.", v25);
          sub_16AA8((uint64_t)v25);
        }

        sub_981D4();
        uint64_t v35 = v39;
        uint64_t v36 = 1LL;
      }

      else
      {
        sub_981D4();
        uint64_t v34 = v39;
        sub_16E84(v39, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32LL));
        uint64_t v35 = v34;
        uint64_t v36 = 0LL;
      }

      uint64_t v32 = 1LL;
      uint64_t v33 = v22;
      return sub_A40C(v35, v36, v32, v33);
    }
  }

  else
  {
    sub_981F4();
    sub_A40C(v26, v27, v28, v10);
  }

  sub_19594(v4, &qword_D37D8);
  if (qword_D31F8 != -1) {
    swift_once(&qword_D31F8, sub_97944);
  }
  uint64_t v29 = sub_16C80();
  sub_16CD0(v29, (uint64_t)qword_D79C8);
  os_log_type_t v30 = sub_17714();
  if (os_log_type_enabled(v2, v30))
  {
    uint64_t v31 = (uint8_t *)sub_16AC4(2LL);
    *(_WORD *)uint64_t v31 = 0;
    sub_16B44(&dword_0, v2, v30, "getAlarmDate: DateComponents not available from alarm in intent response.", v31);
    sub_16AA8((uint64_t)v31);
  }

  sub_4AFA8();
  sub_981F4();
  return sub_A40C(v35, v36, v32, v33);
}

uint64_t sub_97748()
{
  uint64_t v1 = sub_9821C();
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  uint64_t v3 = sub_19754(v2);
  uint64_t v4 = sub_981B8(v3);
  v0[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v0[6] = v5;
  v0[7] = sub_19754(v5);
  uint64_t v6 = sub_26B0(&qword_D40E8);
  v0[8] = sub_19754(*(void *)(v6 - 8));
  sub_19840();
  return sub_1988C();
}

uint64_t sub_977B4()
{
  if (qword_D3208 != -1) {
    swift_once(&qword_D3208, sub_979CC);
  }
  uint64_t v1 = (void *)swift_task_alloc(dword_D4DD4);
  *(void *)(v0 + 72) = v1;
  sub_981E4(v1);
  return sub_38D30();
}

uint64_t sub_97828()
{
  return sub_1988C();
}

uint64_t sub_97864()
{
  uint64_t v1 = sub_9821C();
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  uint64_t v3 = sub_19754(v2);
  uint64_t v4 = sub_981B8(v3);
  v0[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v0[6] = v5;
  v0[7] = sub_19754(v5);
  uint64_t v6 = sub_26B0(&qword_D40E8);
  v0[8] = sub_19754(*(void *)(v6 - 8));
  sub_19840();
  return sub_1988C();
}

uint64_t sub_978D0()
{
  if (qword_D3208 != -1) {
    swift_once(&qword_D3208, sub_979CC);
  }
  uint64_t v1 = (void *)swift_task_alloc(dword_D4DCC);
  *(void *)(v0 + 72) = v1;
  sub_981E4(v1);
  return sub_38CD0();
}

uint64_t sub_97944(uint64_t a1)
{
  return sub_9797C( a1,  (uint64_t (*)(void))&type metadata accessor for Logger,  qword_D79C8,  (uint64_t (*)(void))&static SiriTimeLog.alarmFlow.getter);
}

uint64_t sub_97960(uint64_t a1)
{
  return sub_9797C( a1,  (uint64_t (*)(void))&type metadata accessor for Locale,  qword_D79E0,  (uint64_t (*)(void))&static Locale.autoupdatingCurrent.getter);
}

uint64_t sub_9797C(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a2(0LL);
  sub_1688C(v6, a3);
  sub_26F0(v6, (uint64_t)a3);
  return a4();
}

uint64_t sub_979CC()
{
  uint64_t v0 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for AlarmBaseCATs_Async(0LL);
  static CATOption.defaultMode.getter();
  uint64_t result = CATWrapper.__allocating_init(options:globals:)(v2, 0LL);
  qword_D79F8 = result;
  return result;
}

uint64_t sub_97A44()
{
  uint64_t v0 = type metadata accessor for Locale.HourCycle(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Locale(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_D3200 != -1) {
    swift_once(&qword_D3200, sub_97960);
  }
  uint64_t v8 = sub_26F0(v4, (uint64_t)qword_D79E0);
  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  Locale.hourCycle.getter(v9);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v10 == enum case for Locale.HourCycle.zeroToEleven(_:) || v10 == enum case for Locale.HourCycle.oneToTwelve(_:))
  {
    if (qword_D31F8 != -1) {
      swift_once(&qword_D31F8, sub_97944);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    uint64_t v13 = sub_26F0(v12, (uint64_t)qword_D79C8);
    char v21 = (os_log_s *)Logger.logObject.getter(v13, v14, v15, v16, v17, v18, v19, v20);
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "uses24HourTime: Using 12h clock for time output", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    return 0LL;
  }

  if (v10 != enum case for Locale.HourCycle.zeroToTwentyThree(_:)
    && v10 != enum case for Locale.HourCycle.oneToTwentyFour(_:))
  {
    if (qword_D31F8 != -1) {
      swift_once(&qword_D31F8, sub_97944);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    uint64_t v39 = sub_26F0(v38, (uint64_t)qword_D79C8);
    id v47 = (os_log_s *)Logger.logObject.getter(v39, v40, v41, v42, v43, v44, v45, v46);
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl( &dword_0,  v47,  v48,  "uses24HourTime: Unknown hourCycle enumeration found. This is a programming error. Defaulting to 12h time.",  v49,  2u);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0LL;
  }

  if (qword_D31F8 != -1) {
    swift_once(&qword_D31F8, sub_97944);
  }
  uint64_t v25 = type metadata accessor for Logger(0LL);
  uint64_t v26 = sub_26F0(v25, (uint64_t)qword_D79C8);
  uint64_t v34 = (os_log_s *)Logger.logObject.getter(v26, v27, v28, v29, v30, v31, v32, v33);
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_0, v34, v35, "uses24HourTime: Using 24h clock for time output", v36, 2u);
    swift_slowDealloc(v36, -1LL, -1LL);
  }

  return 1LL;
}

uint64_t sub_97DB8(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_26B0(&qword_D37D8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DateComponents(0LL);
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - v13;
  uint64_t v15 = 0LL;
  if ((sub_97A44() & 1) != 0) {
    return v15;
  }
  id v16 = [a1 dateTime];
  if (!v16)
  {
    sub_A40C((uint64_t)v8, 1LL, 1LL, v9);
    goto LABEL_10;
  }

  uint64_t v17 = v16;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v16);

  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v43 + 32);
  v18(v8, v12, v9);
  sub_A40C((uint64_t)v8, 0LL, 1LL, v9);
  if (sub_16880((uint64_t)v8, 1LL, v9) == 1)
  {
LABEL_10:
    sub_19594((uint64_t)v8, &qword_D37D8);
    goto LABEL_11;
  }

  uint64_t v19 = ((uint64_t (*)(char *, char *, uint64_t))v18)(v14, v8, v9);
  uint64_t v20 = DateComponents.hour.getter(v19);
  if ((v21 & 1) == 0)
  {
    uint64_t v22 = v20;
    id v23 = [objc_allocWithZone(NSDateFormatter) init];
    if (qword_D3200 != -1) {
      swift_once(&qword_D3200, sub_97960);
    }
    uint64_t v24 = sub_26F0(v2, (uint64_t)qword_D79E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v24, v2);
    Class isa = Locale._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [v23 setLocale:isa];

    if (v22 >= 12) {
      id v26 = [v23 PMSymbol];
    }
    else {
      id v26 = [v23 AMSymbol];
    }
    id v40 = v26;
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
    }

    else
    {

      uint64_t v15 = 0LL;
    }

    (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v9);
    return v15;
  }

  (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v9);
LABEL_11:
  if (qword_D31F8 != -1) {
    swift_once(&qword_D31F8, sub_97944);
  }
  uint64_t v27 = type metadata accessor for Logger(0LL);
  uint64_t v28 = sub_26F0(v27, (uint64_t)qword_D79C8);
  uint64_t v36 = (os_log_s *)Logger.logObject.getter(v28, v29, v30, v31, v32, v33, v34, v35);
  os_log_type_t v37 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl(&dword_0, v36, v37, "getMeridiemForSnippet: Could not get hour from alarmDateComponents.", v38, 2u);
    swift_slowDealloc(v38, -1LL, -1LL);
  }

  return 0LL;
}

uint64_t sub_9817C()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 72);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 80) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_9819C()
{
  return type metadata accessor for DateComponents(0LL);
}

uint64_t sub_981B8(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return type metadata accessor for TemplatingResult(0LL);
}

uint64_t sub_981C4()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_981D4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_981E4(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 56);
}

  ;
}

id sub_98200()
{
  return [v0 *(SEL *)(v1 + 1336)];
}

uint64_t sub_9820C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return Logger.logObject.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_98214()
{
  return static Calendar.current.getter();
}

uint64_t sub_9821C()
{
  return type metadata accessor for TemplatingText(0LL);
}

uint64_t sub_98224()
{
  return type metadata accessor for Calendar(0LL);
}

void sub_9822C()
{
  uint64_t v27 = v6;
  uint64_t v7 = sub_26B0((uint64_t *)&unk_D7C20);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v29 = v7;
  sub_16AFC();
  __chkstk_darwin(v8);
  sub_9BD98(v9, v25);
  uint64_t v26 = *(void *)(sub_26B0(&qword_D7950) - 8);
  sub_16AFC();
  __chkstk_darwin(v10);
  sub_9BC4C();
  __chkstk_darwin(v11);
  sub_9BBCC();
  uint64_t v12 = sub_26B0((uint64_t *)&unk_D7C30);
  sub_16AFC();
  __chkstk_darwin(v13);
  sub_9BB40();
  __chkstk_darwin(v14);
  id v16 = (char *)&v25 - v15;
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v17 = sub_16C80();
  sub_16CD0(v17, (uint64_t)qword_D7A20);
  os_log_type_t v18 = sub_16C50();
  if (sub_16BA4(v18))
  {
    uint64_t v19 = (_WORD *)sub_1EFA4();
    sub_6709C(v19);
    sub_16B44(&dword_0, v1, v2, "AlarmFlowFactory: making createAlarmFlow.", v0);
    sub_16AA8((uint64_t)v0);
  }

  sub_9BC88();
  sub_9BBE4();
  sub_9BF20();
  sub_17324();
  uint64_t v20 = type metadata accessor for HALAlarmDeviceContext(0LL);
  sub_9BB0C(v20);
  sub_9BB78();
  sub_17324();
  sub_44FC(&v30, 0);
  uint64_t v21 = v26;
  sub_17620(v5, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16));
  uint64_t v22 = sub_26B0(&qword_D7C40);
  sub_16D14(v22);
  uint64_t v23 = sub_9BF14();
  sub_9BCEC((uint64_t)v16, v4);
  sub_9BDD0(&qword_D7C48);
  sub_9BBF0();
  uint64_t v24 = v25;
  RCHFlowFactory.init(strategy:childFlowFactory:)(v4, v23, v12, &unk_D7C30);
  if (qword_D3178 != -1) {
    swift_once(&qword_D3178, sub_82958);
  }
  RCHFlowFactory.makeRCHFlowWithResolvedApp(_:intent:)(qword_D84A8, v27, v29);
  sub_17B94();
  sub_175C0(v24, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
  sub_1704C(v3, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  sub_7EC4((uint64_t)v16, (uint64_t *)&unk_D7C30);
  sub_16CB0();
}

uint64_t sub_98498()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7A20);
  sub_26F0(v0, (uint64_t)qword_D7A20);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t static Transformer<>.alarmToTimerParseTransformer.getter()
{
  uint64_t v0 = type metadata accessor for Parse(0LL);
  return Transformer.init(transform:)(sub_9AEB0, 0LL, v0, v0);
}

void sub_98520()
{
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for DateComponents(0LL);
  sub_95C44();
  __chkstk_darwin(v6);
  sub_6D268();
  sub_26B0(&qword_D37D8);
  sub_16AFC();
  __chkstk_darwin(v7);
  sub_4AF90();
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v8 = sub_16C80();
  uint64_t v9 = sub_26F0(v8, (uint64_t)qword_D7A20);
  id v10 = v4;
  uint64_t v11 = (os_log_s *)v9;
  Logger.logObject.getter(v10, v12, v13, v14, v15, v16, v17, v18);
  os_log_type_t v19 = sub_16C50();
  if (os_log_type_enabled(v11, v19))
  {
    uint64_t v58 = v5;
    os_log_type_t v55 = v19;
    uint64_t v20 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v56 = sub_16AC4(32LL);
    v60[0] = v56;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v57 = v1;
    id v21 = v10;
    uint64_t v22 = v2;
    uint64_t v23 = v0;
    id v24 = [v21 description];
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    unint64_t v27 = v26;

    uint64_t v0 = v23;
    uint64_t v2 = v22;
    uint64_t v59 = sub_3D10(v25, v27, v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, v60, v20 + 4, v20 + 12);

    unint64_t v28 = v27;
    uint64_t v1 = v57;
    uint64_t v5 = v58;
    swift_bridgeObjectRelease(v28);
    sub_16BD0(&dword_0, v11, v55, "AlarmFlowFactory: routing flow with SK intent: %s", v20);
    sub_16BB4(v56);
    sub_16AA8(v56);
    sub_16AA8((uint64_t)v20);
  }

  else
  {
  }

  uint64_t AlarmIntent = type metadata accessor for CreateAlarmIntent(0LL);
  uint64_t v30 = sub_9BC20(AlarmIntent);
  if (v30)
  {
    uint64_t v31 = (void *)v30;
    id v32 = v10;
    id v33 = [v31 time];
    if (v33)
    {
      uint64_t v34 = v33;
      static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v0, v2, v5);
      sub_2D240(v0, 0LL);
      uint64_t v35 = sub_9BF60();
      sub_16BBC(v35, v36, v5);
    }

    else
    {
      uint64_t v39 = sub_9BF60();
      sub_2D240(v39, v40);
    }

    sub_7EC4(v0, &qword_D37D8);
    sub_99794();
    goto LABEL_13;
  }

  uint64_t v37 = type metadata accessor for DeleteAlarmIntent(0LL);
  if (sub_9BC20(v37))
  {
    sub_99A00();
LABEL_16:
    static FlowSearchResult.flow(_:)(v38);
    goto LABEL_17;
  }

  uint64_t v42 = type metadata accessor for SearchAlarmIntent(0LL);
  if (sub_9BC20(v42))
  {
    sub_98C74();
    goto LABEL_16;
  }

  uint64_t v43 = type metadata accessor for ChangeAlarmStatusIntent(0LL);
  uint64_t v44 = sub_9BC20(v43);
  if (!v44)
  {
    uint64_t updated = type metadata accessor for UpdateAlarmIntent(0LL);
    if (sub_9BC20(updated))
    {
      sub_99DE0();
    }

    else
    {
      uint64_t v47 = type metadata accessor for SnoozeAlarmHalIntent();
      if (!sub_9BC20(v47))
      {
        uint64_t v50 = type metadata accessor for ABCReport(0LL);
        void v60[3] = v50;
        v60[4] = (uint64_t)&protocol witness table for ABCReport;
        os_log_type_t v51 = sub_19558(v60);
        *os_log_type_t v51 = swift_getObjectType(v10);
        uint64_t v52 = enum case for UnhandledAbortSubtype.unknownIntent(_:);
        uint64_t v53 = type metadata accessor for UnhandledAbortSubtype(0LL);
        (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 104LL))(v51, v52, v53);
        (*(void (**)(void *, void, uint64_t))(*(void *)(v50 - 8) + 104LL))( v51,  enum case for ABCReport.unhandledAbort(_:),  v50);
        static BarbaraWalters.stopThePresses(for:)(v60);
        uint64_t v54 = _s20HandleIntentStrategyVwxx_1(v60);
        static FlowSearchResult.noFlow.getter(v54);
        goto LABEL_18;
      }

      uint64_t v48 = sub_9BF38();
      sub_16D14(v48);
      v60[0] = sub_9BF6C((uint64_t)&unk_D7AB0);
      uint64_t v49 = sub_9BDE8(v60[0], (uint64_t)&protocol witness table for AsyncConstructingFlow);
      sub_16FFC();
      uint64_t v38 = v49;
    }

    goto LABEL_16;
  }

  uint64_t v45 = (void *)v44;
  id v32 = v10;
  else {
    sub_99BF0();
  }
LABEL_13:
  sub_9BED4(v41);

LABEL_17:
  sub_16FD8();
LABEL_18:
  sub_16CB0();
}

void sub_98954()
{
  uint64_t v5 = v4;
  os_log_type_t v6 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  sub_95C44();
  __chkstk_darwin(v7);
  sub_6D268();
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v8 = sub_16C80();
  uint64_t v9 = sub_26F0(v8, (uint64_t)qword_D7A20);
  uint64_t v10 = swift_unknownObjectRetain_n(v5, 2LL);
  sub_9BF88(v10, v11, v12, v13, v14, v15, v16, v17, v62, v64, v66, v68, v70[0]);
  os_log_type_t v18 = sub_16C50();
  if (os_log_type_enabled(v1, v18))
  {
    os_log_type_t v19 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v69 = v3;
    v70[0] = v5;
    uint64_t v20 = sub_16AC4(32LL);
    v70[1] = v20;
    uint64_t v67 = v9;
    *(_DWORD *)os_log_type_t v19 = 136315138;
    uint64_t v65 = (uint64_t)(v19 + 4);
    swift_unknownObjectRetain(v5);
    uint64_t v21 = sub_26B0(&qword_D3760);
    uint64_t v22 = String.init<A>(describing:)(v70, v21);
    uint64_t v0 = v2;
    os_log_type_t v23 = v6;
    unint64_t v25 = v24;
    uint64_t v26 = sub_9BF74(v22, v24);
    uint64_t v27 = sub_4B078(v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v27, v28, v19 + 4, v19 + 12);
    sub_9BF54();
    unint64_t v29 = v25;
    os_log_type_t v6 = v23;
    uint64_t v2 = v0;
    swift_bridgeObjectRelease(v29);
    sub_16BD0(&dword_0, v1, v18, "AlarmFlowFactory: routing flow with nlv4 intent: %s", v19);
    sub_16BB4(v20);
    uint64_t v30 = v20;
    uint64_t v3 = v69;
    sub_16AA8(v30);
    sub_16AA8((uint64_t)v19);
  }

  else
  {

    sub_9BF54();
  }

  uint64_t ObjectType = swift_getObjectType(v5);
  uint64_t v32 = ((uint64_t (*)(void))SIRINLUUserDialogAct.firstUsoTask.getter)();
  if (v32)
  {
    id v33 = (char *)v32;
    type metadata accessor for SiriEnvironment(0LL);
    static SiriEnvironment.default.getter();
    uint64_t v0 = (uint8_t *)SiriEnvironment.currentDevice.getter();
    sub_17324();
    char v34 = sub_98EF0(v33);
    uint64_t v35 = sub_16FD8();
    if ((v34 & 1) != 0)
    {
      static FlowSearchResult.noFlow.getter(v35);
      uint64_t v36 = (uint64_t)v33;
      goto LABEL_18;
    }

    swift_release(v33);
  }

  uint64_t v37 = (os_log_s *)v5;
  uint64_t v38 = SIRINLUUserDialogAct.firstUsoTask.getter(ObjectType);
  if (v38)
  {
    uint64_t v46 = v38;
    uint64_t v47 = sub_99114(v38);
    if (!v47)
    {
      sub_256B8(v3);
      swift_retain(v46);
      sub_991B4();
      sub_16EBC(v46);
      sub_175C0(v3, *((uint64_t (**)(uint64_t, uint64_t))v2 + 1));
      goto LABEL_19;
    }

    uint64_t v55 = v47;
    sub_9BF88(v47, v48, v49, v50, v51, v52, v53, v54, v63, v65, v67, v69, v70[0]);
    os_log_type_t v56 = sub_16C50();
    if (sub_16BA4(v56))
    {
      uint64_t v57 = (_WORD *)sub_1EFA4();
      sub_6709C(v57);
      sub_16B44(&dword_0, v37, v6, "This is not supported nvl4 intent, use unsupportedFlow.", v0);
      sub_16AA8((uint64_t)v0);
    }

    static FlowSearchResult.flow(_:)(v55);
    swift_release(v46);
    uint64_t v36 = v55;
  }

  else
  {
    uint64_t v58 = (os_log_s *)sub_9BF88(0LL, v39, v40, v41, v42, v43, v44, v45, v63, v65, v67, v69, v70[0]);
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (sub_16BA4(v59))
    {
      uint64_t v60 = (_WORD *)sub_1EFA4();
      sub_6709C(v60);
      sub_16B44(&dword_0, v58, v6, "UsoTask is empty! Calling searchAlarmFlow anyways", v0);
      sub_16AA8((uint64_t)v0);
    }

    sub_98C74();
    sub_9BED4(v61);
    uint64_t v36 = (uint64_t)v0;
  }

void sub_98C74()
{
  uint64_t v5 = sub_26B0(&qword_D7BA8);
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  sub_16AFC();
  __chkstk_darwin(v6);
  sub_9BB5C(v7, v30[0]);
  uint64_t v31 = sub_26B0(&qword_D7BB0);
  uint64_t v8 = *(void *)(v31 - 8);
  sub_16AFC();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v30 - v13;
  sub_26B0(&qword_D7BB8);
  sub_16AFC();
  __chkstk_darwin(v15);
  sub_4AEB4();
  __chkstk_darwin(v16);
  sub_9BBCC();
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v17 = sub_16C80();
  sub_16CD0(v17, (uint64_t)qword_D7A20);
  os_log_type_t v18 = sub_16C50();
  if (sub_9BC2C(v18))
  {
    os_log_type_t v19 = (_WORD *)sub_1EFA4();
    sub_6709C(v19);
    sub_16B44(&dword_0, v1, v4, "AlarmFlowFactory: making Search Alarm Flow.", v0);
    sub_16AA8((uint64_t)v0);
  }

  sub_9BC88();
  sub_9BBE4();
  sub_9BC14();
  sub_17324();
  uint64_t v20 = sub_9BC7C();
  sub_9BB0C(v20);
  sub_9BB78();
  sub_17324();
  sub_A11C(&v34);
  uint64_t v21 = v8;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v23 = v31;
  v22(v12, v14, v31);
  uint64_t v24 = sub_26B0(&qword_D7BC0);
  sub_16D14(v24);
  RCHChildFlowFactory.init(producers:)(v12);
  sub_9BCEC(v2, v3);
  sub_9BDD0(&qword_D7BC8);
  sub_9BBF0();
  uint64_t v25 = v30[1];
  sub_9BD24();
  uint64_t v26 = v33;
  uint64_t v27 = RCHFlowFactory.makeAppResolvingRCHFlow()(v33);
  sub_9BEE0(v27);
  uint64_t v28 = sub_82728();
  sub_8274C(&qword_D7BD8);
  Flow.eraseToAnyFlow()(v28, v29);
  sub_16FD8();
  sub_17B94();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v23);
  sub_7EC4(v2, &qword_D7BB8);
  sub_9BD74();
  sub_16CB0();
}

uint64_t sub_98EF0(char *a1)
{
  if ((dispatch thunk of CurrentDevice.isAppleTV.getter() & 1) == 0)
  {
    if (qword_D3210 != -1) {
      swift_once(&qword_D3210, sub_98498);
    }
    uint64_t v13 = sub_16C80();
    sub_16CD0(v13, (uint64_t)qword_D7A20);
    os_log_type_t v14 = sub_9BEEC();
    if (sub_16ACC(v14))
    {
      uint64_t v15 = (_WORD *)sub_1EFA4();
      sub_16BEC(v15);
      sub_16ADC(&dword_0, v16, v17, "shouldRejectTaskForATV returns false because isAppleTV");
      sub_16AA8(v1);
    }

    return 0LL;
  }

  static UsoTask_CodegenConverter.convert(task:)(v33, a1);
  sub_3F88((uint64_t)v33, (uint64_t)v31, (uint64_t *)&unk_D4860);
  if (v32)
  {
    sub_3F88((uint64_t)v31, (uint64_t)v30, (uint64_t *)&unk_D4860);
    uint64_t v3 = type metadata accessor for UsoTask_stop_uso_NoEntity(0LL);
    a1 = (char *)&type metadata for Any + 8;
    if (sub_16B1C(v3, v4, v5, v3, v6)
      || (uint64_t v7 = type metadata accessor for UsoTask_disable_common_Alarm(0LL), sub_16B1C( v7,  v8,  v9,  v7,  v10)))
    {
      sub_7EC4((uint64_t)v33, (uint64_t *)&unk_D4860);
      uint64_t v11 = swift_release(v29);
      sub_9BEF4(v11, v12);
LABEL_6:
      sub_7EC4((uint64_t)v31, (uint64_t *)&unk_D4860);
      return 0LL;
    }

    uint64_t v19 = type metadata accessor for UsoTask_snooze_common_Alarm(0LL);
    uint64_t v20 = swift_dynamicCast(&v29, v30, (char *)&type metadata for Any + 8, v19, 0LL);
    if ((_DWORD)v20)
    {
      sub_31D98((uint64_t)v33);
      uint64_t v22 = swift_release(v29);
      sub_9BEF4(v22, v23);
      goto LABEL_6;
    }

    sub_9BEF4(v20, v21);
  }

  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v24 = sub_16C80();
  sub_16CD0(v24, (uint64_t)qword_D7A20);
  os_log_type_t v25 = sub_9BEEC();
  if (sub_16ACC(v25))
  {
    uint64_t v26 = (_WORD *)sub_1EFA4();
    sub_16BEC(v26);
    sub_16ADC(&dword_0, v27, v28, "shouldRejectTaskForATV returns true for tvOS");
    sub_16AA8(v1);
  }

  sub_31D98((uint64_t)v33);
  sub_31D98((uint64_t)v31);
  return 1LL;
}

uint64_t sub_99114(uint64_t a1)
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v5 = sub_16C80();
  sub_16CD0(v5, (uint64_t)qword_D7A20);
  os_log_type_t v6 = sub_16C50();
  if (sub_16BA4(v6))
  {
    uint64_t v7 = (_WORD *)sub_1EFA4();
    sub_16CE4(v7);
    sub_16B44(&dword_0, v1, v2, "AlarmFlowFactory: Testing for qualified AlarmFlowFactory.getUnsupportedFlow()", v3);
    sub_16AA8((uint64_t)v3);
  }

  return sub_99FD0(a1);
}

void sub_991B4()
{
  uint64_t v2 = v1;
  int v4 = v3;
  os_log_type_t v6 = v5;
  uint64_t v80 = v7;
  uint64_t v8 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_9BC4C();
  __chkstk_darwin(v10);
  sub_16BD8();
  uint64_t v76 = v11;
  sub_16AF0();
  __chkstk_darwin(v12);
  sub_16BD8();
  uint64_t v77 = v13;
  sub_16AF0();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v71 - v15;
  if (qword_D3210 != -1) {
    goto LABEL_41;
  }
  while (1)
  {
    uint64_t v17 = sub_16C80();
    uint64_t v18 = sub_26F0(v17, (uint64_t)qword_D7A20);
    uint64_t v78 = *(uint64_t (**)(char *, os_log_s *, uint64_t))(v9 + 16);
    uint64_t v79 = v6;
    uint64_t v19 = v78(v16, v6, v8);
    uint64_t v75 = v18;
    Logger.logObject.getter(v19, v20, v21, v22, v23, v24, v25, v26);
    os_log_type_t v27 = sub_16B4C();
    uint64_t v28 = (void (*)(uint64_t, uint64_t))&loc_A4000;
    if (os_log_type_enabled(v6, v27))
    {
      uint64_t v29 = sub_16AC4(12LL);
      uint64_t v72 = v0;
      uint64_t v30 = (uint8_t *)v29;
      uint64_t v31 = sub_16AC4(32LL);
      int v74 = v4;
      uint64_t v32 = v31;
      uint64_t v81 = v31;
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v28 = (void (*)(uint64_t, uint64_t))(v30 + 12);
      uint64_t v73 = v2;
      uint64_t v33 = AlarmNLv4Constants.AlarmVerb.rawValue.getter();
      unint64_t v35 = v34;
      uint64_t v36 = sub_9BF74(v33, v34);
      uint64_t v37 = sub_4B078(v36);
      uint64_t v2 = v73;
      sub_16F1C(v37, v38, (uint64_t)(v30 + 4));
      swift_bridgeObjectRelease(v35);
      sub_9BDD8();
      sub_16BD0(&dword_0, v6, v27, "AlarmFlowFactory: routing flow with verb: %s", v30);
      sub_16BB4(v32);
      uint64_t v39 = v32;
      int v4 = v74;
      sub_16AA8(v39);
      uint64_t v40 = (uint64_t)v30;
      uint64_t v0 = v72;
      sub_16AA8(v40);
    }

    else
    {
      sub_9BDD8();
    }

    uint64_t v41 = v77;
    os_log_type_t v6 = v79;
    sub_1705C(v77, (uint64_t)v79);
    int v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v41, v8);
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.unknown(_:))
    {
      uint64_t v43 = v76;
      uint64_t v44 = sub_1705C(v76, (uint64_t)v6);
      uint64_t v52 = (os_log_s *)Logger.logObject.getter(v44, v45, v46, v47, v48, v49, v50, v51);
      os_log_type_t v53 = static os_log_type_t.error.getter();
      if (sub_16C28(v53))
      {
        uint64_t v54 = (uint8_t *)sub_16AC4(12LL);
        uint64_t v55 = sub_16AC4(32LL);
        uint64_t v81 = v55;
        *(_DWORD *)uint64_t v54 = 136315138;
        uint64_t v79 = (os_log_s *)(v54 + 4);
        sub_1705C(v0, v43);
        uint64_t v56 = String.init<A>(describing:)(v0, v8);
        uint64_t v57 = v8;
        unint64_t v59 = v58;
        uint64_t v60 = sub_9BF74(v56, v58);
        uint64_t v61 = sub_4B078(v60);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v61, v62, v79, v54 + 12);
        swift_bridgeObjectRelease(v59);
        v28(v43, v57);
        sub_16BD0(&dword_0, v52, (os_log_type_t)v16, "Unexpected alarmVerb: %s", v54);
        sub_16BB4(v55);
        sub_16AA8(v55);
        sub_16AA8((uint64_t)v54);
      }

      else
      {
        v28(v43, v8);
      }

LABEL_17:
      sub_98C74();
LABEL_18:
      uint64_t v68 = v67;
      goto LABEL_19;
    }

    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.checkExistence(_:)) {
      goto LABEL_17;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.create(_:))
    {
LABEL_10:
      if (v2)
      {
        uint64_t v63 = UsoTask.alarmEntity.getter();
        if (v63)
        {
          uint64_t v64 = dispatch thunk of UsoEntity_common_Alarm.endDateTime.getter(v63);
          uint64_t v65 = sub_16FD8();
          if (v64)
          {
            uint64_t v66 = dispatch thunk of UsoEntity_common_DateTime.time.getter(v65);
            sub_17324();
            if (v66) {
              sub_16FD8();
            }
          }
        }
      }

      sub_99794();
      goto LABEL_18;
    }

    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.delete(_:))
    {
      sub_99A00();
      goto LABEL_18;
    }

    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.disable(_:)) {
      goto LABEL_24;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.enable(_:))
    {
LABEL_26:
      sub_99BF0();
      goto LABEL_18;
    }

    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.read(_:)
      || v42 == enum case for AlarmNLv4Constants.AlarmVerb.request(_:))
    {
      goto LABEL_17;
    }

    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.snooze(_:)) {
      break;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.summarise(_:)) {
      goto LABEL_17;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.update(_:))
    {
      sub_99DE0();
      goto LABEL_18;
    }

    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.noVerb(_:)) {
      goto LABEL_10;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.close(_:)) {
      goto LABEL_24;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.resume(_:)) {
      goto LABEL_26;
    }
    if (v42 == enum case for AlarmNLv4Constants.AlarmVerb.stop(_:))
    {
LABEL_24:
      uint64_t v67 = sub_996C0();
      goto LABEL_18;
    }

    _diagnoseUnexpectedEnumCase<A>(type:)(v8, v8);
    __break(1u);
LABEL_41:
    swift_once(&qword_D3210, sub_98498);
  }

  uint64_t v70 = sub_9BF38();
  sub_16D14(v70);
  uint64_t v81 = sub_9BF6C((uint64_t)&unk_D7AB0);
  uint64_t v68 = sub_9BDE8(v81, (uint64_t)&protocol witness table for AsyncConstructingFlow);
  sub_16FFC();
LABEL_19:
  static FlowSearchResult.flow(_:)(v68);
  sub_16FD8();
  sub_16CB0();
}

uint64_t sub_996C0()
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v2 = sub_16C80();
  sub_16CD0(v2, (uint64_t)qword_D7A20);
  os_log_type_t v3 = sub_16B4C();
  if (sub_16ACC(v3))
  {
    int v4 = (_WORD *)sub_1EFA4();
    sub_16BEC(v4);
    sub_16ADC(&dword_0, v5, v6, "AlarmFlowFactory: making DecideDismissOrChangeStateFlow.");
    sub_16AA8(v1);
  }

  uint64_t v7 = sub_9BF38();
  sub_16D14(v7);
  uint64_t v10 = sub_9BF6C((uint64_t)&unk_D7BE0);
  uint64_t v8 = sub_9BDE8(v10, (uint64_t)&protocol witness table for AsyncConstructingFlow);
  sub_16FFC();
  return v8;
}

void sub_99794()
{
  char v4 = v3;
  char v6 = v5;
  uint64_t v7 = sub_26B0((uint64_t *)&unk_D7C20);
  uint64_t v30 = *(void *)(v7 - 8);
  sub_16AFC();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_26B0(&qword_D7950);
  uint64_t v31 = *(void *)(v11 - 8);
  sub_16AFC();
  __chkstk_darwin(v12);
  sub_9BC4C();
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - v14;
  sub_26B0((uint64_t *)&unk_D7C30);
  sub_16AFC();
  __chkstk_darwin(v16);
  sub_4AEB4();
  __chkstk_darwin(v17);
  sub_9BBCC();
  if ((v4 & 1) != 0 || (v6 & 1) != 0)
  {
    sub_9BC88();
    uint64_t v28 = v11;
    uint64_t v29 = v7;
    sub_9BBE4();
    sub_9BC14();
    sub_17324();
    uint64_t v21 = sub_9BC7C();
    sub_9BB0C(v21);
    sub_9BB78();
    sub_17324();
    sub_44FC(&v32, v4 & 1);
    uint64_t v22 = v31;
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v2, v15, v11);
    uint64_t v23 = sub_26B0(&qword_D7C40);
    sub_16D14(v23);
    sub_9BF14();
    sub_9BCEC(v0, v1);
    sub_9BDD0(&qword_D7C48);
    sub_9BBF0();
    sub_9BD24();
    uint64_t v24 = v29;
    uint64_t v25 = RCHFlowFactory.makeAppResolvingRCHFlow()(v29);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v24);
    uint64_t v32 = v25;
    sub_82728();
    sub_8274C(&qword_D7C58);
    sub_9BBBC(v26);
    sub_16FD8();
    sub_17B94();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v28);
    sub_7EC4(v0, (uint64_t *)&unk_D7C30);
  }

  else
  {
    uint64_t AlarmReformableFlow = type metadata accessor for CreateAlarmReformableFlow();
    swift_allocObject(AlarmReformableFlow, 32LL, 7LL);
    uint64_t v19 = sub_31894();
    uint64_t v32 = v19;
    sub_9BAD8(qword_D4738, (uint64_t (*)(uint64_t))type metadata accessor for CreateAlarmReformableFlow);
    sub_9BDE8(v20, v20);
    swift_release(v19);
  }

  sub_9BD74();
  sub_16CB0();
}

void sub_99A00()
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v9 = sub_16C80();
  sub_16CD0(v9, (uint64_t)qword_D7A20);
  os_log_type_t v10 = sub_16C50();
  if (sub_9BC2C(v10))
  {
    uint64_t v11 = (_WORD *)sub_1EFA4();
    sub_6709C(v11);
    sub_16B44(&dword_0, v1, v2, "AlarmFlowFactory: making deleteAlarmFlow.", v0);
    sub_16AA8((uint64_t)v0);
  }

  sub_9BC88();
  sub_9BBE4();
  sub_9BC14();
  sub_17324();
  uint64_t v12 = sub_9BC7C();
  sub_9BB0C(v12);
  sub_9BB78();
  sub_17324();
  uint64_t v13 = (void *)sub_9BE88();
  sub_7CE7C(v13);
  sub_9BBA0();
  uint64_t v14 = sub_26B0(&qword_D7AD0);
  sub_16D14(v14);
  sub_9BD80();
  sub_9BCDC();
  sub_9BE34(&qword_D7AD8);
  sub_9BBF0();
  sub_9BB84();
  sub_9BD8C();
  sub_9BBFC();
  sub_82728();
  sub_8274C(&qword_D7AE8);
  sub_9BBBC(v15);
  sub_16FD8();
  sub_17B94();
  sub_9BCB0();
  sub_9BDB4();
  sub_9BD74();
  sub_16CB0();
}

void sub_99BF0()
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v9 = sub_16C80();
  sub_16CD0(v9, (uint64_t)qword_D7A20);
  os_log_type_t v10 = sub_16C50();
  if (sub_9BC2C(v10))
  {
    uint64_t v11 = (_WORD *)sub_1EFA4();
    sub_6709C(v11);
    sub_16B44(&dword_0, v1, v2, "AlarmFlowFactory: making changeAlarmStatusFlow.", v0);
    sub_16AA8((uint64_t)v0);
  }

  sub_9BC88();
  sub_9BBE4();
  sub_9BC14();
  sub_17324();
  uint64_t v12 = sub_9BC7C();
  sub_9BB0C(v12);
  sub_9BB78();
  sub_17324();
  uint64_t v13 = (void *)sub_9BE88();
  sub_562F4(v13);
  sub_9BBA0();
  uint64_t v14 = sub_26B0(&qword_D7B08);
  sub_16D14(v14);
  sub_9BD80();
  sub_9BCDC();
  sub_9BE34(&qword_D7B10);
  sub_9BBF0();
  sub_9BB84();
  sub_9BD8C();
  sub_9BBFC();
  sub_82728();
  sub_8274C(&qword_D7B20);
  sub_9BBBC(v15);
  sub_16FD8();
  sub_17B94();
  sub_9BCB0();
  sub_9BDB4();
  sub_9BD74();
  sub_16CB0();
}

void sub_99DE0()
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v9 = sub_16C80();
  sub_16CD0(v9, (uint64_t)qword_D7A20);
  os_log_type_t v10 = sub_16C50();
  if (sub_9BC2C(v10))
  {
    uint64_t v11 = (_WORD *)sub_1EFA4();
    sub_6709C(v11);
    sub_16B44(&dword_0, v1, v2, "AlarmFlowFactory: making updateAlarmFlow.", v0);
    sub_16AA8((uint64_t)v0);
  }

  sub_9BC88();
  sub_9BBE4();
  sub_9BC14();
  sub_17324();
  uint64_t v12 = sub_9BC7C();
  sub_9BB0C(v12);
  sub_9BB78();
  sub_17324();
  uint64_t v13 = (void *)sub_9BE88();
  sub_199C8(v13);
  sub_9BBA0();
  uint64_t v14 = sub_26B0(&qword_D7B40);
  sub_16D14(v14);
  sub_9BD80();
  sub_9BCDC();
  sub_9BE34(&qword_D7B48);
  sub_9BBF0();
  sub_9BB84();
  sub_9BD8C();
  sub_9BBFC();
  sub_82728();
  sub_8274C(&qword_D7B58);
  sub_9BBBC(v15);
  sub_16FD8();
  sub_17B94();
  sub_9BCB0();
  sub_9BDB4();
  sub_9BD74();
  sub_16CB0();
}

uint64_t sub_99FD0(uint64_t a1)
{
  if (!v31[3])
  {
    sub_7EC4((uint64_t)v31, (uint64_t *)&unk_D4860);
    goto LABEL_10;
  }

  uint64_t common_Alarm = type metadata accessor for UsoTask_create_common_Alarm(0LL);
  if ((swift_dynamicCast(&v30, v31, (char *)&type metadata for Any + 8, common_Alarm, 6LL) & 1) == 0)
  {
LABEL_10:
    sub_7EC4((uint64_t)v32, (uint64_t *)&unk_D4860);
    return 0LL;
  }

  uint64_t v3 = v30;
  uint64_t v4 = swift_retain(v30);
  dispatch thunk of Uso_VerbTemplate_Target.target.getter(v31, v4);
  swift_release(v3);
  uint64_t v5 = v31[0];
  if (!v31[0])
  {
    sub_7EC4((uint64_t)v32, (uint64_t *)&unk_D4860);
    uint64_t v23 = v3;
LABEL_13:
    swift_release(v23);
    return 0LL;
  }

  if ((sub_6B8EC() & 1) == 0)
  {
    sub_7EC4((uint64_t)v32, (uint64_t *)&unk_D4860);
    swift_release(v3);
    uint64_t v23 = v5;
    goto LABEL_13;
  }

  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_26F0(v6, (uint64_t)qword_D7A20);
  uint64_t v7 = swift_retain_n(a1, 2LL);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v7, v8, v9, v10, v11, v12, v13, v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = swift_slowAlloc(32LL, -1LL);
    uint64_t v30 = a1;
    v31[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_retain(a1);
    uint64_t v19 = sub_26B0(&qword_D7BA0);
    uint64_t v20 = String.init<A>(describing:)(&v30, v19);
    unint64_t v22 = v21;
    uint64_t v30 = sub_3D10(v20, v21, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, v31, v17 + 4, v17 + 12);
    swift_release_n(a1, 2LL);
    swift_bridgeObjectRelease(v22);
    _os_log_impl(&dword_0, v15, v16, "Detected sleep attribute in create: %s", v17, 0xCu);
    swift_arrayDestroy(v18, 1LL);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  else
  {

    swift_release_n(a1, 2LL);
  }

  uint64_t v26 = sub_32FE0();
  uint64_t v28 = v27;
  v31[0] = v26;
  v31[1] = v27;
  unint64_t v29 = sub_332AC();
  uint64_t v24 = Flow.eraseToAnyFlow()(&type metadata for CreateSleepAlarmUnsupportedFlow, v29);
  swift_release(v28);
  swift_release(v26);
  swift_release(v3);
  swift_release(v5);
  sub_7EC4((uint64_t)v32, (uint64_t *)&unk_D4860);
  return v24;
}

uint64_t sub_9A2D0(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_26B0((uint64_t *)&unk_D7B60);
  v1[4] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[5] = v3;
  v1[6] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_26B0(&qword_D5CF8);
  v1[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[8] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[9] = swift_task_alloc(v6);
  v1[10] = swift_task_alloc(v6);
  uint64_t v7 = sub_26B0((uint64_t *)&unk_D7B70);
  v1[11] = v7;
  unint64_t v8 = (*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[12] = swift_task_alloc(v8);
  v1[13] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for SiriTimeDeviceContextProvider(0LL);
  v1[14] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v1[15] = v10;
  v1[16] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v11 = (*(void *)(*(void *)(sub_26B0(&qword_D37D0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[17] = swift_task_alloc(v11);
  v1[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_9A404, 0LL, 0LL);
}

uint64_t sub_9A404()
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v4 = sub_16C80();
  sub_16CD0(v4, (uint64_t)qword_D7A20);
  os_log_type_t v5 = sub_16C50();
  if (sub_1990C(v5))
  {
    unint64_t v6 = (_WORD *)sub_1EFA4();
    sub_16BEC(v6);
    sub_16B44(&dword_0, v1, v0, "AlarmFlowFactory: making snoozeAlarmFlow.", v2);
    sub_16AA8((uint64_t)v2);
  }

  uint64_t v7 = static SharedContext.current.getter(v17);
  sub_9BF08((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14, v17[0]);
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to SiriTimeDeviceContextProvider.fetchAlarmContexts()[1]);
  *(void *)(v3 + 152) = v15;
  *uint64_t v15 = v3;
  v15[1] = sub_9A4D4;
  return sub_9BC90();
}

uint64_t sub_9A4D4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 160LL) = a1;
  swift_task_dealloc();
  sub_6734C();
  return sub_19744();
}

uint64_t sub_9A538()
{
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v26 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v27 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v20 = v8;
  uint64_t v21 = v7;
  uint64_t v22 = *(void *)(v0 + 48);
  uint64_t v23 = *(void *)(v0 + 32);
  uint64_t v24 = *(void *)(v0 + 40);
  uint64_t v25 = *(uint64_t **)(v0 + 24);
  Array<A>.firingDevices()(*(void *)(v0 + 160));
  sub_9BE7C();
  sub_39090(v1, v3);
  swift_bridgeObjectRelease(v1);
  uint64_t v9 = sub_9BC88();
  static ApplicationContext.shared.getter(v9);
  sub_9BF20();
  sub_17324();
  sub_9BCEC(v3, v4 + *(int *)(v5 + 36));
  static ApplicationContext.shared.getter(v10);
  ApplicationContext.deviceState.getter(v28);
  sub_17324();
  sub_9BCEC(v3, v2);
  sub_51F4C(v28, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v27, v6, v8);
  uint64_t v11 = sub_26B0(&qword_D7B80);
  sub_16D14(v11);
  uint64_t v12 = RCHChildFlowFactory.init(producers:)(v27);
  sub_3F88(v4, v26, (uint64_t *)&unk_D7B70);
  sub_8274C(&qword_D7B88);
  uint64_t v14 = v13;
  swift_retain(v12);
  RCHFlowFactory.init(strategy:childFlowFactory:)(v26, v12, v5, v14);
  uint64_t v15 = RCHFlowFactory.makeAppResolvingRCHFlow()(v23);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  *(void *)(v0 + 16) = v15;
  uint64_t v16 = sub_26B0(&qword_D7B90);
  sub_4930(&qword_D7B98, &qword_D7B90);
  uint64_t v18 = Flow.eraseToAnyFlow()(v16, v17);
  sub_16FFC();
  v25[3] = type metadata accessor for AnyFlow(0LL);
  v25[4] = (uint64_t)&protocol witness table for AnyFlow;
  swift_release(v12);
  uint64_t *v25 = v18;
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v6, v20);
  sub_7EC4(v4, (uint64_t *)&unk_D7B70);
  sub_7EC4(v3, &qword_D37D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_9A7E0()
{
  uint64_t v42 = sub_26B0(&qword_D7BE8);
  uint64_t v40 = *(void *)(v42 - 8);
  sub_16AFC();
  __chkstk_darwin(v5);
  sub_9BD98(v6, v37);
  uint64_t v7 = type metadata accessor for HALAlarmDeviceContext(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = sub_26B0(&qword_D7BF0);
  uint64_t v41 = *(void *)(v43 - 8);
  sub_16AFC();
  __chkstk_darwin(v10);
  sub_6D1C8();
  __chkstk_darwin(v11);
  sub_9BD14();
  uint64_t v37 = sub_26B0(&qword_D7BF8);
  sub_16AFC();
  __chkstk_darwin(v12);
  sub_16B08();
  uint64_t v38 = v13;
  sub_16AF0();
  __chkstk_darwin(v14);
  sub_9BBCC();
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v15 = sub_16C80();
  sub_16CD0(v15, (uint64_t)qword_D7A20);
  os_log_type_t v16 = sub_16C50();
  if (sub_16BA4(v16))
  {
    uint64_t v17 = (uint8_t *)sub_1EFA4();
    *(_WORD *)uint64_t v17 = 0;
    sub_16B44(&dword_0, v0, v1, "AlarmFlowFactory: making dismissAlarmFlow.", v17);
    sub_16AA8((uint64_t)v17);
  }

  uint64_t v18 = sub_9BC88();
  static ApplicationContext.shared.getter(v18);
  sub_9BC14();
  sub_17324();
  uint64_t v19 = v37;
  uint64_t v20 = v4 + *(int *)(v37 + 36);
  sub_9BE28(v20);
  uint64_t v21 = sub_A40C(v20, 0LL, 1LL, v7);
  static ApplicationContext.shared.getter(v21);
  sub_9BB78();
  sub_17324();
  sub_9BE28((uint64_t)v9);
  uint64_t v22 = (void *)sub_9BE88();
  sub_25374(v22, (uint64_t)v9);
  uint64_t v23 = v3;
  uint64_t v24 = v41;
  uint64_t v25 = sub_9BF48();
  uint64_t v26 = v43;
  v27(v25);
  uint64_t v28 = sub_26B0(&qword_D7C00);
  sub_16D14(v28);
  uint64_t v29 = RCHChildFlowFactory.init(producers:)(v2);
  uint64_t v30 = v38;
  sub_9BCEC(v4, v38);
  sub_9BDD0(&qword_D7C08);
  uint64_t v32 = v31;
  swift_retain(v29);
  uint64_t v33 = v39;
  RCHFlowFactory.init(strategy:childFlowFactory:)(v30, v29, v19, v32);
  uint64_t v34 = v42;
  uint64_t v35 = RCHFlowFactory.makeAppResolvingRCHFlow()(v42);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v33, v34);
  uint64_t v44 = v35;
  sub_82728();
  sub_8274C(&qword_D7C18);
  sub_9BBBC(v36);
  sub_16FFC();
  swift_release(v29);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v26);
  sub_31D98(v4);
  sub_9BD74();
  sub_16CB0();
}

uint64_t sub_9AAE8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for HALAlarmDeviceContext(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for SiriTimeDeviceContextProvider(0LL);
  v1[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[7] = v5;
  v1[8] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = (*(void *)(*(void *)(sub_26B0(&qword_D37D0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[9] = swift_task_alloc(v6);
  v1[10] = swift_task_alloc(v6);
  return swift_task_switch(sub_9ABA4, 0LL, 0LL);
}

uint64_t sub_9ABA4()
{
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v3 = sub_16C80();
  uint64_t v4 = sub_26F0(v3, (uint64_t)qword_D7A20);
  *(void *)(v2 + 88) = v4;
  uint64_t v5 = (os_log_s *)v4;
  Logger.logObject.getter(v4, v6, v7, v8, v9, v10, v11, v12);
  os_log_type_t v13 = sub_16C50();
  if (sub_1990C(v13))
  {
    uint64_t v14 = (_WORD *)sub_1EFA4();
    sub_16BEC(v14);
    sub_16B44(&dword_0, v5, v0, "AlarmFlowFactory: making decideDismissOrChangeAlarmStatusFlow.", v1);
    sub_16AA8((uint64_t)v1);
  }

  uint64_t v15 = static SharedContext.current.getter(v25);
  sub_9BF08((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22, v25[0]);
  uint64_t v23 = (void *)swift_task_alloc(async function pointer to SiriTimeDeviceContextProvider.fetchAlarmContexts()[1]);
  *(void *)(v2 + 96) = v23;
  *uint64_t v23 = v2;
  v23[1] = sub_9AC80;
  return sub_9BC90();
}

uint64_t sub_9AC80(uint64_t a1)
{
  *(void *)(*(void *)v1 + 104LL) = a1;
  swift_task_dealloc();
  sub_6734C();
  return sub_19744();
}

uint64_t sub_9ACE4()
{
  uint64_t v3 = *(uint8_t **)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 24);
  Array<A>.firingDevices()(*(void *)(v0 + 104));
  sub_9BE7C();
  sub_39090(v1, v2);
  swift_bridgeObjectRelease(v1);
  sub_3F88(v2, (uint64_t)v3, &qword_D37D0);
  uint64_t v5 = sub_9BF60();
  int v7 = sub_16880(v5, v6, v4);
  uint64_t v8 = *(os_log_s **)(v0 + 88);
  if (v7 == 1)
  {
    sub_7EC4(*(void *)(v0 + 72), &qword_D37D0);
    Logger.logObject.getter(v9, v10, v11, v12, v13, v14, v15, v16);
    os_log_type_t v17 = sub_16C50();
    if (sub_1990C(v17))
    {
      uint64_t v18 = (_WORD *)sub_1EFA4();
      sub_16BEC(v18);
      sub_16B44( &dword_0,  v8,  (os_log_type_t)v2,  "DecideDismissOrChangeStateFlow: Can NOT get valid HAL info, running changeAlarmStatusFlow.",  v3);
      sub_16AA8((uint64_t)v3);
    }

    uint64_t v19 = *(os_log_s ***)(v0 + 16);

    sub_99BF0();
    uint64_t v20 = sub_9BF2C();
    v19[3] = (os_log_s *)v20;
    v19[4] = (os_log_s *)&protocol witness table for AnyFlow;
    *uint64_t v19 = v8;
  }

  else
  {
    uint64_t v21 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 32) + 32LL))( *(void *)(v0 + 40),  *(void *)(v0 + 72),  *(void *)(v0 + 24));
    uint64_t v29 = (os_log_s *)Logger.logObject.getter(v21, v22, v23, v24, v25, v26, v27, v28);
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (sub_1990C(v30))
    {
      uint64_t v31 = (_WORD *)sub_1EFA4();
      sub_16BEC(v31);
      sub_16B44(&dword_0, v29, (os_log_type_t)v2, "DecideDismissOrChangeStateFlow: Running dismissAlarmFlow.", v3);
      sub_16AA8((uint64_t)v3);
    }

    uint64_t v33 = *(void *)(v0 + 32);
    uint64_t v32 = *(void *)(v0 + 40);
    uint64_t v34 = *(os_log_s ***)(v0 + 16);

    sub_9A7E0();
    v34[3] = (os_log_s *)sub_9BF2C();
    v34[4] = (os_log_s *)&protocol witness table for AnyFlow;
    void *v34 = v29;
    uint64_t v20 = sub_175C0(v32, *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
  }

  sub_9BDF0(v20, &qword_D37D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_9AEB0@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v164 = a2;
  uint64_t v169 = a1;
  uint64_t v155 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v158 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  uint64_t v157 = (char *)&v152 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_26B0((uint64_t *)&unk_D7A50);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v152 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_26B0((uint64_t *)&unk_D7A70);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v152 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TerminalElement.DateTimeValue(0LL);
  uint64_t v160 = *(void *)(v9 - 8);
  uint64_t v161 = v9;
  __chkstk_darwin(v9);
  uint64_t v159 = (char *)&v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v165 = type metadata accessor for NLIntent(0LL);
  uint64_t v163 = *(void *)(v165 - 8);
  uint64_t v11 = __chkstk_darwin(v165);
  uint64_t v13 = (char *)&v152 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v152 - v15;
  __chkstk_darwin(v14);
  uint64_t v166 = (char *)&v152 - v17;
  uint64_t v18 = type metadata accessor for Parse(0LL);
  uint64_t v168 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v152 = (char *)&v152 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v154 = (char *)&v152 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v156 = (char *)&v152 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char **)((char *)&v152 - v25);
  if (qword_D3210 != -1) {
    swift_once(&qword_D3210, sub_98498);
  }
  uint64_t v27 = type metadata accessor for Logger(0LL);
  uint64_t v28 = sub_26F0(v27, (uint64_t)qword_D7A20);
  uint64_t v36 = (os_log_s *)Logger.logObject.getter(v28, v29, v30, v31, v32, v33, v34, v35);
  os_log_type_t v37 = static os_log_type_t.default.getter();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v167 = v18;
  if (v38)
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_0, v36, v37, "Transforming timer parse to alarm parse", v39, 2u);
    uint64_t v40 = v39;
    uint64_t v18 = v167;
    swift_slowDealloc(v40, -1LL, -1LL);
  }

  uint64_t v41 = v168;
  uint64_t v162 = *(uint64_t (**)(uint64_t, uint8_t *, uint64_t))(v168 + 16);
  v162((uint64_t)v26, v169, v18);
  uint64_t v42 = (*(uint64_t (**)(void *, uint64_t))(v41 + 88))(v26, v18);
  if ((_DWORD)v42 != enum case for Parse.NLv3IntentOnly(_:))
  {
    int v58 = v42;
    if ((_DWORD)v42 == enum case for Parse.NLv4IntentOnly(_:))
    {
      (*(void (**)(void *, uint64_t))(v41 + 96))(v26, v18);
      uint64_t v59 = swift_unknownObjectRelease(*v26);
      uint64_t v67 = (os_log_s *)Logger.logObject.getter(v59, v60, v61, v62, v63, v64, v65, v66);
      os_log_type_t v68 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v69 = 0;
        _os_log_impl( &dword_0,  v67,  v68,  "Alarm domain was told to reform an NLv4 parse, which is not supported. Qualifying Alarm NLv4 parses should go directly to the Timer domain.",  v69,  2u);
        swift_slowDealloc(v69, -1LL, -1LL);
      }

      return v162(v164, v169, v18);
    }

    int v73 = enum case for Parse.uso(_:);
    int v74 = (os_log_s *)Logger.logObject.getter(v42, v43, v44, v45, v46, v47, v48, v49);
    os_log_type_t v75 = static os_log_type_t.error.getter();
    BOOL v76 = os_log_type_enabled(v74, v75);
    if (v58 == v73)
    {
      uint64_t v77 = (void (*)(uint64_t, uint8_t *, uint64_t))v162;
      if (v76)
      {
        uint64_t v78 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v78 = 0;
        os_log_type_t v79 = v75;
        uint64_t v80 = "Alarm domain was told to reform a USO parse, which is not supported. Qualifying Alarm USO parses should go"
              " directly to the Timer domain.";
LABEL_29:
        _os_log_impl(&dword_0, v74, v79, v80, v78, 2u);
        swift_slowDealloc(v78, -1LL, -1LL);
      }
    }

    else
    {
      uint64_t v77 = (void (*)(uint64_t, uint8_t *, uint64_t))v162;
      if (v76)
      {
        uint64_t v78 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v78 = 0;
        os_log_type_t v79 = v75;
        uint64_t v80 = "Transformer should only be called for nlv3 parse. Check the caller to make sure it's not mis-used.";
        goto LABEL_29;
      }
    }

    uint64_t v150 = v167;
    v77(v164, v169, v167);
    return (*(uint64_t (**)(void *, uint64_t))(v168 + 8))(v26, v150);
  }

  (*(void (**)(void *, uint64_t))(v41 + 96))(v26, v18);
  uint64_t v50 = v163;
  uint64_t v51 = v166;
  uint64_t v52 = v26;
  uint64_t v53 = v165;
  (*(void (**)(char *, void *, uint64_t))(v163 + 32))(v166, v52, v165);
  uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v54(v16, v51, v53);
  uint64_t v55 = type metadata accessor for AlarmNLIntent(0LL);
  swift_allocObject(v55, *(unsigned int *)(v55 + 48), *(unsigned __int16 *)(v55 + 52));
  uint64_t v153 = sub_716E4((uint64_t)v16);
  sub_705F8((uint64_t)v8);
  uint64_t v56 = v161;
  if (sub_16880((uint64_t)v8, 1LL, v161) == 1)
  {
    sub_7EC4((uint64_t)v8, (uint64_t *)&unk_D7A70);
    uint64_t v57 = v165;
LABEL_23:
    uint64_t v131 = v166;
    uint64_t v132 = ((uint64_t (*)(char *, char *, uint64_t))v54)(v13, v166, v57);
    uint64_t v140 = (os_log_s *)Logger.logObject.getter(v132, v133, v134, v135, v136, v137, v138, v139);
    os_log_type_t v141 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v140, v141))
    {
      uint64_t v142 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v143 = swift_slowAlloc(32LL, -1LL);
      v171[0] = v143;
      *(_DWORD *)uint64_t v142 = 136315138;
      sub_9BAD8((unint64_t *)&unk_D7AA0, (uint64_t (*)(uint64_t))&type metadata accessor for NLIntent);
      uint64_t v145 = dispatch thunk of CustomStringConvertible.description.getter(v57, v144);
      unint64_t v147 = v146;
      uint64_t v170 = sub_3D10(v145, v146, v171);
      uint64_t v18 = v167;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, v171, v142 + 4, v142 + 12);
      swift_bridgeObjectRelease(v147);
      uint64_t v148 = *(void (**)(char *, uint64_t))(v163 + 8);
      v148(v13, v57);
      _os_log_impl(&dword_0, v140, v141, "Not able to parse timer duration from alarm NLv3 intent %s", v142, 0xCu);
      swift_arrayDestroy(v143, 1LL);
      swift_slowDealloc(v143, -1LL, -1LL);
      swift_slowDealloc(v142, -1LL, -1LL);

      swift_release(v153);
      v148(v166, v57);
    }

    else
    {

      swift_release(v153);
      uint64_t v149 = *(void (**)(char *, uint64_t))(v163 + 8);
      v149(v13, v57);
      v149(v131, v57);
    }

    return v162(v164, v169, v18);
  }

  uint64_t v71 = (*(uint64_t (**)(char *, char *, uint64_t))(v160 + 32))(v159, v8, v56);
  TerminalElement.DateTimeValue.duration.getter(v71);
  uint64_t v72 = type metadata accessor for TerminalElement.Duration(0LL);
  if (sub_16880((uint64_t)v5, 1LL, v72) == 1)
  {
    sub_7EC4((uint64_t)v5, (uint64_t *)&unk_D7A50);
    uint64_t v57 = v165;
LABEL_22:
    (*(void (**)(char *, uint64_t))(v160 + 8))(v159, v56);
    uint64_t v18 = v167;
    goto LABEL_23;
  }

  uint64_t v81 = TerminalElement.Duration.duration.getter();
  char v83 = v82;
  uint64_t v84 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v72 - 8) + 8LL))(v5, v72);
  uint64_t v57 = v165;
  if ((v83 & 1) != 0) {
    goto LABEL_22;
  }
  double v92 = *(double *)&v81;
  uint64_t v93 = (os_log_s *)Logger.logObject.getter(v84, v85, v86, v87, v88, v89, v90, v91);
  os_log_type_t v94 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v93, v94))
  {
    uint64_t v95 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v96 = swift_slowAlloc(32LL, -1LL);
    v171[0] = v96;
    *(_DWORD *)uint64_t v95 = 136315138;
    uint64_t v97 = Double.description.getter(v92);
    unint64_t v99 = v98;
    uint64_t v170 = sub_3D10(v97, v98, v171);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, v171, v95 + 4, v95 + 12);
    unint64_t v100 = v99;
    uint64_t v57 = v165;
    swift_bridgeObjectRelease(v100);
    _os_log_impl(&dword_0, v93, v94, "Found timer duration from alarmTime %s", v95, 0xCu);
    swift_arrayDestroy(v96, 1LL);
    swift_slowDealloc(v96, -1LL, -1LL);
    swift_slowDealloc(v95, -1LL, -1LL);
  }

  uint64_t v101 = v167;
  uint64_t v102 = (uint64_t (*)(char *, char *, uint64_t))v162;
  uint64_t v103 = v155;
  uint64_t v105 = v157;
  uint64_t v104 = v158;
  uint64_t v106 = sub_703B0();
  uint64_t v108 = v107;
  static DirectInvocationUtils.Alarm.reformToTimer(duration:label:)(v106, v92);
  swift_bridgeObjectRelease(v108);
  uint64_t v109 = v156;
  (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v156, v105, v103);
  (*(void (**)(char *, void, uint64_t))(v168 + 104))(v109, enum case for Parse.directInvocation(_:), v101);
  os_log_type_t v110 = v154;
  uint64_t v111 = v102(v154, v109, v101);
  uint64_t v119 = (os_log_s *)Logger.logObject.getter(v111, v112, v113, v114, v115, v116, v117, v118);
  os_log_type_t v120 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v119, v120))
  {
    NSString v121 = (void (*)(char *, char *, uint64_t))v102;
    Class v122 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v123 = swift_slowAlloc(32LL, -1LL);
    v171[0] = v123;
    *(_DWORD *)Class v122 = 136315138;
    uint64_t v169 = v122 + 4;
    unint64_t v124 = v152;
    v121(v152, v110, v167);
    uint64_t v125 = String.init<A>(describing:)(v124, v167);
    unint64_t v127 = v126;
    uint64_t v170 = sub_3D10(v125, v126, v171);
    uint64_t v101 = v167;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, v171, v169, v122 + 12);
    swift_bridgeObjectRelease(v127);
    uint64_t v128 = v168;
    (*(void (**)(char *, uint64_t))(v168 + 8))(v110, v101);
    _os_log_impl(&dword_0, v119, v120, "Alarm reformed alarm parse to timer: %s", v122, 0xCu);
    swift_arrayDestroy(v123, 1LL);
    swift_slowDealloc(v123, -1LL, -1LL);
    swift_slowDealloc(v122, -1LL, -1LL);

    swift_release(v153);
    (*(void (**)(char *, uint64_t))(v158 + 8))(v157, v155);
    (*(void (**)(char *, uint64_t))(v160 + 8))(v159, v161);
    (*(void (**)(char *, uint64_t))(v163 + 8))(v166, v57);
    uint64_t v129 = v164;
    uint64_t v130 = v128;
  }

  else
  {

    swift_release(v153);
    uint64_t v151 = v168;
    (*(void (**)(char *, uint64_t))(v168 + 8))(v110, v101);
    (*(void (**)(char *, uint64_t))(v158 + 8))(v157, v103);
    (*(void (**)(char *, uint64_t))(v160 + 8))(v159, v161);
    (*(void (**)(char *, uint64_t))(v163 + 8))(v166, v57);
    uint64_t v129 = v164;
    uint64_t v130 = v151;
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v130 + 32))(v129, v156, v101);
}

void *sub_9B9DC(uint64_t a1, void *a2)
{
  uint64_t v11 = sub_9BDF8();
  uint64_t v12 = &protocol witness table for SiriAlarmManagerImpl;
  *(void *)&__int128 v10 = a1;
  type metadata accessor for DeleteAlarmCATs_Async(0LL);
  sub_2D2C4();
  a2[2] = sub_2D278();
  type metadata accessor for DeleteAlarmCATPatternsExecutor(0LL);
  sub_2D2C4();
  a2[3] = sub_2D278();
  static CATOption.defaultMode.getter();
  a2[4] = sub_2D278();
  type metadata accessor for ErrorCATPatternsExecutor(0LL);
  sub_2D2C4();
  a2[5] = sub_2D278();
  a2[6] = _s15AlarmFlowPlugin021RecreateDeletedAlarmsB0C11osLogObject33_DB4DDA2311F8F0836B4CA98F718F999FLLSo03OS_G4_logCvpfi_0();
  a2[12] = 0LL;
  a2[13] = 0LL;
  uint64_t v5 = (uint64_t)a2 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  uint64_t v6 = type metadata accessor for PluginAction(0LL);
  sub_23050(v5, v7, v8, v6);
  sub_46FC(&v10, (uint64_t)(a2 + 7));
  return a2;
}

ValueMetadata *type metadata accessor for AlarmFlowFactory()
{
  return &type metadata for AlarmFlowFactory;
}

void sub_9BAD8(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_755D8(v3), a1);
  }

  sub_17B50();
}

uint64_t sub_9BB0C(uint64_t a1)
{
  uint64_t v2 = sub_A40C(v1, 1LL, 1LL, a1);
  return static ApplicationContext.shared.getter(v2);
}

uint64_t sub_9BB30(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 - 144))(a1, *(void *)(v1 - 296));
}

  ;
}

void sub_9BB5C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void *sub_9BB78()
{
  return ApplicationContext.deviceState.getter((void *)(v0 - 120));
}

uint64_t sub_9BB84()
{
  return RCHFlowFactory.init(strategy:childFlowFactory:)(v1, v3, v2, v0);
}

uint64_t sub_9BBA0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16))(v2, v0, *(void *)(v3 - 128));
}

uint64_t sub_9BBBC(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

  ;
}

uint64_t sub_9BBDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return Logger.logObject.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_9BBE4()
{
  return static ApplicationContext.shared.getter();
}

uint64_t sub_9BBF0()
{
  return swift_retain(v0);
}

uint64_t sub_9BBFC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 144) + 8LL))(v0, v1);
}

void *sub_9BC14()
{
  return ApplicationContext.deviceState.getter(v0);
}

uint64_t sub_9BC20(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}

BOOL sub_9BC2C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_9BC3C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 96))(v2, v0);
}

  ;
}

void sub_9BC68(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_9BC7C()
{
  return type metadata accessor for HALAlarmDeviceContext(0LL);
}

uint64_t sub_9BC88()
{
  return type metadata accessor for ApplicationContext(0LL);
}

uint64_t sub_9BC90()
{
  return ((uint64_t (*)(void))SiriTimeDeviceContextProvider.fetchAlarmContexts())();
}

uint64_t sub_9BCA0()
{
  return SiriAlarmManagerImpl.__allocating_init(endpointUUID:)(0LL, 0LL);
}

uint64_t sub_9BCB0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_9BCC0(uint64_t a1, uint64_t a2)
{
  return v2(*(void *)(v3 - 328), a2, *(void *)(v3 - 296));
}

void sub_9BCDC()
{
}

void sub_9BCEC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_9BCF4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 264) + 8LL))(v0, v1);
}

uint64_t sub_9BD0C()
{
  return type metadata accessor for FlowSearchResult(0LL);
}

  ;
}

uint64_t sub_9BD24()
{
  return RCHFlowFactory.init(strategy:childFlowFactory:)(v2, v3, v1, v0);
}

uint64_t sub_9BD3C()
{
  return v0(v2, v1);
}

uint64_t sub_9BD48(uint64_t a1, unint64_t a2)
{
  return sub_3D10(a1, a2, (uint64_t *)(v2 - 120));
}

uint64_t sub_9BD54(uint64_t a1)
{
  return sub_A40C(v1, 0LL, 1LL, a1);
}

uint64_t sub_9BD68()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_9BD74()
{
  return v0;
}

uint64_t sub_9BD80()
{
  return RCHChildFlowFactory.init(producers:)(v0);
}

uint64_t sub_9BD8C()
{
  return RCHFlowFactory.makeAppResolvingRCHFlow()(*(void *)(v0 - 136));
}

void sub_9BD98(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_9BDB4()
{
}

  ;
}

void sub_9BDD0(unint64_t *a1)
{
}

uint64_t sub_9BDD8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_9BDE8(uint64_t a1, uint64_t a2)
{
  return Flow.eraseToAnyFlow()(v2, a2);
}

void sub_9BDF0(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_9BDF8()
{
  return type metadata accessor for SiriAlarmManagerImpl(0LL);
}

uint64_t sub_9BE00(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

  ;
}

uint64_t sub_9BE20(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_9BE28(uint64_t a1)
{
  return v2(a1, v3, v1);
}

void sub_9BE34(unint64_t *a1)
{
}

uint64_t sub_9BE3C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_9BE48()
{
  return String.init<A>(describing:)(v0, v1);
}

uint64_t sub_9BE54(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_9BE5C()
{
  return v1(v2, v0);
}

uint64_t sub_9BE68()
{
  return *(void *)(v0 - 344);
}

uint64_t sub_9BE7C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_9BE88()
{
  return v0 - 120;
}

void sub_9BE94()
{
}

uint64_t sub_9BEA0()
{
  return static FlowSearchResult.flow(_:)(v0);
}

  ;
}

uint64_t sub_9BEC0()
{
  return v0;
}

uint64_t sub_9BED4(uint64_t a1)
{
  return static FlowSearchResult.flow(_:)(a1);
}

uint64_t sub_9BEE0(uint64_t result)
{
  *(void *)(v1 - 120) = result;
  return result;
}

uint64_t sub_9BEEC()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_9BEF4(uint64_t a1, uint64_t a2, ...)
{
  return _s20HandleIntentStrategyVwxx_1((uint64_t *)va);
}

uint64_t sub_9BEFC()
{
  return v1(v0, v2);
}

uint64_t sub_9BF08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return SiriTimeDeviceContextProvider.init(sharedContext:)(&a9);
}

uint64_t sub_9BF14()
{
  return RCHChildFlowFactory.init(producers:)(v0);
}

void *sub_9BF20()
{
  return ApplicationContext.deviceState.getter(v0);
}

uint64_t sub_9BF2C()
{
  return type metadata accessor for AnyFlow(0LL);
}

uint64_t sub_9BF38()
{
  return type metadata accessor for AsyncConstructingFlow(0LL);
}

uint64_t sub_9BF40(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_9BF48()
{
  return v0;
}

uint64_t sub_9BF54()
{
  return swift_unknownObjectRelease_n(v0, 2LL);
}

uint64_t sub_9BF60()
{
  return v0;
}

uint64_t sub_9BF6C(uint64_t a1)
{
  return AsyncConstructingFlow.init(_:)(a1, 0LL);
}

uint64_t sub_9BF74(uint64_t a1, unint64_t a2)
{
  return sub_3D10(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_9BF7C@<X0>(uint64_t (*a1)(uint64_t, void)@<X8>)
{
  return a1(v1, *(void *)(v2 - 256));
}

uint64_t sub_9BF88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return Logger.logObject.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_9BF90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24LL);
}

void sub_9BF98(uint64_t a1)
{
  v4[0] = "(";
  sub_76798(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 0LL, 2LL, v4, a1 + 32);
  }

void *sub_9C00C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v13);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = (char *)v4 + v8;
    __int128 v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for HALAlarmDeviceContext(0LL);
    if (sub_16880((uint64_t)v10, 1LL, v11))
    {
      uint64_t v12 = sub_26B0(&qword_D37D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_A40C((uint64_t)v9, 0LL, 1LL, v11);
    }
  }

  return v4;
}

void *sub_9C104(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(int *)(a3 + 36);
  __int128 v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for HALAlarmDeviceContext(0LL);
  int v10 = sub_16880((uint64_t)v7, 1LL, v9);
  int v11 = sub_16880((uint64_t)v8, 1LL, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }

  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_26B0(&qword_D37D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
  sub_A40C((uint64_t)v7, 0LL, 1LL, v9);
  return a1;
}

uint64_t sub_9C204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = (void *)(a1 + v5);
  __int128 v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for HALAlarmDeviceContext(0LL);
  if (sub_16880((uint64_t)v7, 1LL, v8))
  {
    uint64_t v9 = sub_26B0(&qword_D37D0);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
    sub_A40C((uint64_t)v6, 0LL, 1LL, v8);
  }

  return a1;
}

uint64_t sub_9C2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for HALAlarmDeviceContext(0LL);
  int v11 = sub_16880((uint64_t)v8, 1LL, v10);
  int v12 = sub_16880((uint64_t)v9, 1LL, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }

  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_26B0(&qword_D37D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  sub_A40C((uint64_t)v8, 0LL, 1LL, v10);
  return a1;
}

uint64_t sub_9C3C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9C3D4);
}

uint64_t sub_9C3D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_26B0(&qword_D37D0);
    return sub_16880(a1 + *(int *)(a3 + 36), a2, v8);
  }

uint64_t sub_9C44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9C458);
}

uint64_t sub_9C458(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_26B0(&qword_D37D0);
    return sub_A40C(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }

  return result;
}

uint64_t _s12FlowStrategyVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D9E0(a1, a2, a3, a4, (uint64_t)&_s12FlowStrategyVMn);
}

uint64_t sub_9C4D4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7C60);
  sub_26F0(v0, (uint64_t)qword_D7C60);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_9C51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v4[4] = a3;
  v4[5] = v3;
  void v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_9C538, 0LL, 0LL);
}

uint64_t sub_9C538()
{
  if (qword_D3218 != -1) {
    swift_once(&qword_D3218, sub_9C4D4);
  }
  uint64_t v2 = sub_16C80();
  sub_26F0(v2, (uint64_t)qword_D7C60);
  uint64_t v3 = (os_log_s *)sub_16D50();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (sub_1990C(v4))
  {
    uint64_t v5 = (uint8_t *)sub_16AC4(2LL);
    *(_WORD *)uint64_t v5 = 0;
    sub_16B44(&dword_0, v3, v0, "AlarmIntents.FlowStrategy.makeIntentExecutionBehavior is called.", v5);
    sub_16AA8((uint64_t)v5);
  }

  sub_1511C();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_9C614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[5] = a1;
  uint64_t v5 = type metadata accessor for Parse(0LL);
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[9] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  void v4[10] = swift_task_alloc(v7);
  v4[11] = swift_task_alloc(v7);
  uint64_t v8 = type metadata accessor for SiriTimeAppBundleId(0LL);
  void v4[12] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[13] = v9;
  v4[14] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_9C6B0, 0LL, 0LL);
}

uint64_t sub_9C6B0()
{
  if (qword_D3218 != -1) {
    swift_once(&qword_D3218, sub_9C4D4);
  }
  uint64_t v1 = sub_16C80();
  sub_26F0(v1, (uint64_t)qword_D7C60);
  uint64_t v2 = (os_log_s *)sub_16D50();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)sub_16AC4(2LL);
    *(_WORD *)os_log_type_t v4 = 0;
    sub_16B44(&dword_0, v2, v3, "Base AlarmIntents.FlowStrategy.makeIntentFromParse() called.", v4);
    sub_16AA8((uint64_t)v4);
  }

  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);

  sub_CF8C( v5,  v6 + *(int *)(v7 + 36),  v8,  v9,  v10,  v11,  v12,  v13,  v113,  v114,  v115,  v116,  v118,  v119,  v122,  v123,  v124,  v125,  v126,  v127);
  if (!v14)
  {
    uint64_t v38 = v0 + 120;
    uint64_t v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 72) + 16LL);
    uint64_t v40 = v39(*(void *)(v0 + 88), *(void *)(v0 + 40), *(void *)(v0 + 64));
    uint64_t v48 = (os_log_s *)Logger.logObject.getter(v40, v41, v42, v43, v44, v45, v46, v47);
    os_log_type_t v49 = static os_log_type_t.error.getter();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v51 = *(void *)(v0 + 88);
    if (v50)
    {
      uint64_t v52 = *(void *)(v0 + 80);
      uint64_t v117 = *(void *)(v0 + 72);
      uint64_t v53 = *(void *)(v0 + 64);
      uint64_t v54 = (uint8_t *)sub_16AC4(12LL);
      uint64_t v120 = sub_16AC4(32LL);
      *(_DWORD *)uint64_t v54 = 136315138;
      v39(v52, v51, v53);
      uint64_t v55 = String.init<A>(describing:)(v52, v53);
      *(void *)(v0 + 16) = sub_9D06C(v55, v56, v57, v58, v59, v60, v61);
      uint64_t v38 = v0 + 120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v54 + 4, v54 + 12);
      sub_16D58();
      (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v51, v53);
      _os_log_impl(&dword_0, v48, v49, "Failed to parse intent from parse in makeIntentFromParse %s", v54, 0xCu);
      sub_16BB4(v120);
      sub_16AA8(v120);
      sub_16AA8((uint64_t)v54);
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 72) + 8LL))(*(void *)(v0 + 88), *(void *)(v0 + 64));
    }

    uint64_t v83 = *(void *)(v0 + 48);
    *(_BYTE *)(v0 + 120) = 0;
    uint64_t v85 = type metadata accessor for AlarmIntents.FlowError(0LL, *(void *)(v83 + 16), *(void *)(v83 + 24), v84);
    uint64_t WitnessTable = swift_getWitnessTable(&unk_A4A10, v85);
    sub_9D02C(WitnessTable);
    unint64_t v87 = sub_9D044();
    uint64_t v89 = sub_9D078(v87, v88, v38);
    swift_willThrow(v89, v90, v91, v92, v93, v94, v95, v96);
    goto LABEL_18;
  }

  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(*(void *)(v0 + 48) + 16LL);
  uint64_t v17 = swift_dynamicCastUnknownClass(v14, v16);
  if (!v17)
  {
    id v62 = v15;
    uint64_t v70 = (os_log_s *)Logger.logObject.getter(v62, v63, v64, v65, v66, v67, v68, v69);
    os_log_type_t v71 = static os_log_type_t.error.getter();
    if (sub_1990C(v71))
    {
      uint64_t v72 = sub_16AC4(22LL);
      int v73 = (void *)sub_16AC4(8LL);
      uint64_t v121 = sub_16AC4(32LL);
      *(_DWORD *)uint64_t v72 = 138412546;
      *(void *)(v0 + 24) = v62;
      id v74 = v62;
      id v75 = v62;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v72 + 4, v72 + 12);
      *int v73 = v15;

      id v62 = v74;
      *(_WORD *)(v72 + 12) = 2080;
      uint64_t v76 = _typeName(_:qualified:)(v16, 0LL);
      *(void *)(v0 + 32) = sub_9D06C(v76, v77, v78, v79, v80, v81, v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v72 + 14, v72 + 22);
      sub_16D58();
      sub_9D084( &dword_0,  v70,  (os_log_type_t)v2,  "Intent: %@ doesn't match intentType (we shouldn't ever get here): %s");
      sub_26B0(&qword_D3858);
      sub_16BB4((uint64_t)v73);
      sub_16AA8((uint64_t)v73);
      sub_16BB4(v121);
      sub_16AA8(v121);
      sub_16AA8(v72);
    }

    else
    {
    }

    uint64_t v97 = *(void *)(v0 + 48);
    *(_BYTE *)(v0 + 121) = 0;
    uint64_t v99 = type metadata accessor for AlarmIntents.FlowError(0LL, v16, *(void *)(v97 + 24), v98);
    uint64_t v100 = swift_getWitnessTable(&unk_A4A10, v99);
    sub_9D02C(v100);
    unint64_t v101 = sub_9D044();
    uint64_t v103 = sub_9D078(v101, v102, v0 + 121);
    swift_willThrow(v103, v104, v105, v106, v107, v108, v109, v110);

LABEL_18:
    uint64_t v112 = *(void *)(v0 + 80);
    uint64_t v111 = *(void *)(v0 + 88);
    swift_task_dealloc(*(void *)(v0 + 112));
    swift_task_dealloc(v111);
    swift_task_dealloc(v112);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v18 = (void *)v17;
  id v19 = objc_allocWithZone(&OBJC_CLASS____INPBIntentMetadata);
  id v20 = v15;
  id v21 = [v19 init];
  [v18 _setMetadata:v21];

  id v22 = [v18 _metadata];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v25 = *(void *)(v0 + 104);
    uint64_t v24 = *(void *)(v0 + 112);
    uint64_t v26 = *(void *)(v0 + 96);
    uint64_t v27 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v25 + 104))( v24,  enum case for SiriTimeAppBundleId.alarmExtension(_:),  v26);
    SiriTimeAppBundleId.rawValue.getter(v27);
    uint64_t v29 = v28;
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    NSString v30 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v29);
    [v23 setSystemExtensionBundleId:v30];
  }

  uint64_t v31 = *(void *)(v0 + 112);
  uint64_t v33 = *(void *)(v0 + 80);
  uint64_t v32 = *(void *)(v0 + 88);
  id v34 = v20;
  uint64_t v35 = (void *)INIntent.withEndpointId.getter();

  uint64_t v36 = INIntent.withIntentId.getter();
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v36);
}

uint64_t sub_9CC8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to RCHFlowStrategyAsync.makeErrorResponse(error:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_52BE0;
  return RCHFlowStrategyAsync.makeErrorResponse(error:)(a1, a2, a3, a4);
}

uint64_t sub_9CD08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_52BE0;
  return ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_9CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_52BE0;
  return ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_9CE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)[1]);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_52BE0;
  return ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_9CE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to ResolveConfirmFlowStrategyAsync.makeErrorResponse(error:app:intent:)[1]);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_319A4;
  return ResolveConfirmFlowStrategyAsync.makeErrorResponse(error:app:intent:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_9CF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to RouteConfirmIntentResponseFlowStrategyAsync.makeFailureConfirmingIntentResponse(app:intent:intentResponse:)[1]);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_52BE0;
  return RouteConfirmIntentResponseFlowStrategyAsync.makeFailureConfirmingIntentResponse(app:intent:intentResponse:)( a1,  a2,  a3,  a4,  a5,  a6);
}

uint64_t sub_9CFBC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_A79A8, a1);
}

uint64_t sub_9CFCC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_A79D8, a1);
}

uint64_t sub_9CFDC(uint64_t a1)
{
  return swift_getWitnessTable(&unk_A7A10, a1);
}

uint64_t sub_9CFEC(uint64_t a1)
{
  uint64_t v2 = sub_26B0(&qword_D37A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_9D02C(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

unint64_t sub_9D044()
{
  return 0xD00000000000005ALL;
}

uint64_t sub_9D060@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_9D06C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  return sub_3D10(a1, a2, (uint64_t *)va);
}

uint64_t sub_9D078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static BarbaraWalters.logAndReturnError<A>(context:_:)(a1, a2, a3);
}

void sub_9D084(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t type metadata accessor for DeleteAlarmCATsSimple(uint64_t a1)
{
  uint64_t result = qword_D7D48;
  if (!qword_D7D48) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DeleteAlarmCATsSimple);
  }
  return result;
}

uint64_t sub_9D0C8(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D8568);
}

uint64_t sub_9D104()
{
  return type metadata accessor for DeleteAlarmCATsSimple(0LL);
}

void *UndoCreateAlarmFlow.__allocating_init()()
{
  uint64_t v0 = SiriAlarmManagerImpl.__allocating_init(endpointUUID:)(0LL, 0LL);
  uint64_t AlarmFlow = type metadata accessor for UndoCreateAlarmFlow(0LL);
  uint64_t v2 = (void *)swift_allocObject(AlarmFlow, *(unsigned int *)(AlarmFlow + 48), *(unsigned __int16 *)(AlarmFlow + 52));
  return sub_9B9DC(v0, v2);
}

uint64_t sub_9D15C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7D98);
  sub_26F0(v0, (uint64_t)qword_D7D98);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_9D1A4(uint64_t a1)
{
  return sub_289C4( a1,  (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.TaskType,  qword_D8578,  &enum case for SiriTimeEventSender.TaskType.undoCreateAlarm(_:));
}

uint64_t sub_9D1C0(uint64_t a1)
{
  return sub_289C4( a1,  (uint64_t (*)(void))&type metadata accessor for SiriTimeEventSender.Attribute,  qword_D8590,  &enum case for SiriTimeEventSender.Attribute.corrections(_:));
}

uint64_t UndoCreateAlarmFlow.__allocating_init(manager:)(void *a1)
{
  return sub_391B0(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_A073C);
}

uint64_t type metadata accessor for UndoCreateAlarmFlow(uint64_t a1)
{
  uint64_t result = qword_D7E10;
  if (!qword_D7E10) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UndoCreateAlarmFlow);
  }
  return result;
}

uint64_t UndoCreateAlarmFlow.init(manager:)(void *a1)
{
  return sub_391B0(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_A07F8);
}

uint64_t UndoCreateAlarmFlow.on(input:)()
{
  uint64_t v87 = v1;
  uint64_t v2 = type metadata accessor for DirectInvocationUtils.Alarm.URI(0LL);
  uint64_t v91 = *(void *)(v2 - 8);
  uint64_t v92 = v2;
  sub_16AFC();
  __chkstk_darwin(v3);
  sub_16B30();
  uint64_t v90 = v4;
  sub_26B0(&qword_D3788);
  sub_16AFC();
  __chkstk_darwin(v5);
  sub_16B30();
  uint64_t v96 = v6;
  uint64_t v97 = type metadata accessor for AlarmNLv4Constants.AlarmVerb(0LL);
  uint64_t v95 = *(void *)(v97 - 8);
  sub_16AFC();
  __chkstk_darwin(v7);
  sub_16B08();
  uint64_t v89 = v8;
  __chkstk_darwin(v9);
  uint64_t v94 = (uint64_t)&v85 - v10;
  uint64_t v11 = type metadata accessor for DirectInvocationUtils.Alarm.UserInfoKey(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_16B08();
  uint64_t v93 = v13;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v85 - v15;
  uint64_t v17 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_17390();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = type metadata accessor for Parse(0LL);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  sub_17390();
  uint64_t v26 = v25 - v24;
  Input.parse.getter(v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v23 + 88))(v26, v22) != enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v26, v22);
    return 0LL;
  }

  (*(void (**)(uint64_t, uint64_t))(v23 + 96))(v26, v22);
  uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v21, v26, v17);
  uint64_t v29 = Parse.DirectInvocation.userData.getter(v28);
  uint64_t v30 = v17;
  uint64_t v31 = v21;
  if (!v29)
  {
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
LABEL_12:
    uint64_t v44 = v31;
    uint64_t v45 = v30;
LABEL_13:
    v43(v44, v45);
    return 0LL;
  }

  uint64_t v32 = v29;
  uint64_t v86 = v18;
  uint64_t v33 = *(uint64_t (**)(char *, void, uint64_t))(v12 + 104);
  uint64_t v34 = v33(v16, enum case for DirectInvocationUtils.Alarm.UserInfoKey.verb(_:), v11);
  uint64_t v35 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v34);
  uint64_t v37 = v36;
  uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
  v38(v16, v11);
  sub_288F4(v35, v37, v32, &v100);
  uint64_t v39 = swift_bridgeObjectRelease(v37);
  if (!v101)
  {
    sub_16F40();
    sub_A0954((uint64_t)&v100, (uint64_t *)&unk_D4860);
LABEL_11:
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
    goto LABEL_12;
  }

  if ((sub_A0BA0(v39, v40, v41, (uint64_t)&type metadata for String) & 1) == 0)
  {
    sub_16F40();
    goto LABEL_11;
  }

  uint64_t v42 = v96;
  AlarmNLv4Constants.AlarmVerb.init(rawValue:)(v98);
  if (sub_16880(v42, 1LL, v97) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v31, v30);
    sub_16F40();
    sub_A0954(v42, &qword_D3788);
    return 0LL;
  }

  uint64_t v47 = v94;
  sub_28710(v94, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v95 + 32));
  uint64_t v48 = v93;
  uint64_t v49 = v33((char *)v93, enum case for DirectInvocationUtils.Alarm.UserInfoKey.alarmId(_:), v11);
  uint64_t v50 = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(v49);
  uint64_t v51 = v32;
  uint64_t v53 = v52;
  v38((char *)v48, v11);
  sub_288F4(v50, v53, v51, &v100);
  uint64_t v54 = sub_16F40();
  if (!v101)
  {
    sub_17900();
    sub_A0954((uint64_t)&v100, (uint64_t *)&unk_D4860);
    uint64_t v70 = v86;
    uint64_t v59 = v97;
LABEL_25:
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v47, v59);
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
    goto LABEL_12;
  }

  uint64_t v57 = v51;
  uint64_t v58 = sub_A0BA0(v54, v55, v56, (uint64_t)&type metadata for String);
  uint64_t v59 = v97;
  if ((v58 & 1) == 0)
  {
    sub_17B9C();
    uint64_t v70 = v86;
    goto LABEL_25;
  }

  uint64_t v93 = v30;
  uint64_t v85 = v98;
  uint64_t v96 = v99;
  uint64_t v60 = Parse.DirectInvocation.identifier.getter(v58);
  uint64_t v62 = v61;
  uint64_t v63 = v91;
  uint64_t v64 = sub_17A5C( v90,  enum case for DirectInvocationUtils.Alarm.URI.undo(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 104));
  uint64_t v65 = DirectInvocationUtils.Alarm.URI.rawValue.getter(v64);
  uint64_t v67 = v66;
  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8));
  if (v60 == v65 && v62 == v67)
  {
    swift_bridgeObjectRelease_n(v62, 2LL);
  }

  else
  {
    char v69 = _stringCompareWithSmolCheck(_:_:expecting:)(v60, v62, v65, v67, 0LL);
    sub_16F40();
    swift_bridgeObjectRelease(v62);
    if ((v69 & 1) == 0) {
      goto LABEL_33;
    }
  }

  uint64_t v71 = v95;
  uint64_t v72 = v89;
  (*(void (**)(uint64_t, void, uint64_t))(v95 + 104))( v89,  enum case for AlarmNLv4Constants.AlarmVerb.delete(_:),  v59);
  char v73 = sub_288BC(v94, v72);
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v59);
  if ((v73 & 1) == 0)
  {
LABEL_33:
    swift_bridgeObjectRelease(v96);
    sub_17B9C();
    sub_A0C40();
    uint64_t v44 = sub_A0BF8();
    goto LABEL_13;
  }

  if (qword_D3220 != -1) {
    swift_once(&qword_D3220, sub_9D15C);
  }
  uint64_t v74 = sub_16C80();
  id v75 = (os_log_s *)sub_16CD0(v74, (uint64_t)qword_D7D98);
  os_log_type_t v76 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v75, v76))
  {
    unint64_t v77 = (uint8_t *)sub_16AC4(2LL);
    *(_WORD *)unint64_t v77 = 0;
    sub_16B44(&dword_0, v75, v76, "UndoCreateAlarmFlow: accepting input.", v77);
    sub_16AA8((uint64_t)v77);
  }

  uint64_t v78 = v88;
  uint64_t v79 = *(void *)(v88 + 104);
  uint64_t v80 = v96;
  *(void *)(v88 + 96) = v85;
  *(void *)(v78 + 104) = v80;
  swift_bridgeObjectRelease(v79);
  uint64_t v81 = v87;
  sub_1ECB4(v57, v87);
  sub_17B9C();
  sub_A0C40();
  uint64_t v82 = sub_A0BF8();
  v83(v82);
  uint64_t v84 = v78 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  swift_beginAccess(v84, &v100, 33LL, 0LL);
  sub_2CAC8(v81, v84);
  swift_endAccess(&v100);
  return 1LL;
}

uint64_t UndoCreateAlarmFlow.execute(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t AlarmFlow = type metadata accessor for UndoCreateAlarmFlow(0LL);
  sub_16A6C( &qword_D7A88,  type metadata accessor for UndoCreateAlarmFlow,  (uint64_t)&protocol conformance descriptor for UndoCreateAlarmFlow);
  return Flow.deferToExecuteAsync(_:)(a1, a2, AlarmFlow, v5);
}

uint64_t UndoCreateAlarmFlow.execute()(uint64_t a1)
{
  v2[30] = a1;
  v2[31] = v1;
  uint64_t v3 = sub_26B0(&qword_D43E0);
  v2[32] = sub_19754(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for PluginAction(0LL);
  v2[33] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[34] = v5;
  v2[35] = sub_19754(v5);
  uint64_t v6 = type metadata accessor for SiriTimeEventSender.ReasonDescription(0LL);
  v2[36] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[37] = v7;
  v2[38] = sub_19754(v7);
  unint64_t v8 = (*(void *)(*(void *)(sub_26B0(&qword_D4170) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[39] = swift_task_alloc(v8);
  v2[40] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for DialogPhase(0LL);
  v2[41] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[42] = v10;
  v2[43] = sub_19754(v10);
  uint64_t v11 = sub_16C80();
  v2[44] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[45] = v12;
  v2[46] = sub_19754(v12);
  uint64_t v13 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v2[47] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[48] = v14;
  v2[49] = sub_19754(v14);
  uint64_t v15 = type metadata accessor for SiriTimeMeasurement(0LL);
  v2[50] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[51] = v16;
  v2[52] = sub_19754(v16);
  uint64_t v17 = type metadata accessor for NLContextUpdate(0LL);
  v2[53] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v2[54] = v18;
  v2[55] = sub_19754(v18);
  uint64_t v19 = sub_26B0(&qword_D43F8);
  v2[56] = sub_19754(*(void *)(v19 - 8));
  uint64_t v20 = sub_26B0(&qword_D4400);
  v2[57] = sub_19754(*(void *)(v20 - 8));
  uint64_t v21 = sub_26B0(&qword_D4408);
  v2[58] = sub_19754(*(void *)(v21 - 8));
  uint64_t v22 = type metadata accessor for SiriTimeEventSender.TaskType(0LL);
  v2[59] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v2[60] = v23;
  v2[61] = sub_19754(v23);
  uint64_t v24 = type metadata accessor for ActivityType(0LL);
  v2[62] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  v2[63] = v25;
  v2[64] = sub_19754(v25);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_9DA88()
{
  uint64_t v1 = v0[64];
  uint64_t v2 = v0[62];
  uint64_t v3 = enum case for ActivityType.correction(_:);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[63] + 104LL);
  v0[65] = v4;
  v4(v1, v3, v2);
  if (qword_D3228 != -1) {
    swift_once(&qword_D3228, sub_9D1A4);
  }
  uint64_t v5 = v0[60];
  uint64_t v6 = sub_26F0(v0[59], (uint64_t)qword_D8578);
  v0[66] = v6;
  sub_A0BB4(v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  uint64_t v7 = type metadata accessor for SiriKitReliabilityCodes(0LL);
  v0[67] = v7;
  sub_A0BDC(v7, v8, v9, v7);
  if (qword_D3230 != -1) {
    swift_once(&qword_D3230, sub_9D1C0);
  }
  uint64_t v10 = v0[64];
  uint64_t v36 = v0[63];
  uint64_t v37 = v0[62];
  uint64_t v11 = v0[60];
  uint64_t v13 = v0[57];
  uint64_t v12 = v0[58];
  uint64_t v14 = v0[56];
  uint64_t v15 = v0[36];
  uint64_t v35 = v0[31];
  uint64_t v16 = type metadata accessor for SiriTimeEventSender.Attribute(0LL);
  v0[68] = v16;
  uint64_t v17 = sub_26F0(v16, (uint64_t)qword_D8590);
  v0[69] = v17;
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL);
  v0[70] = v18;
  sub_4B010(v13, v17, v18);
  sub_2D11C(v13);
  sub_A40C(v14, 1LL, 1LL, v15);
  uint64_t v19 = sub_A0B7C();
  sub_A0C2C(v19, &qword_D43F8);
  sub_A0954(v13, &qword_D4400);
  sub_A0954(v12, &qword_D4408);
  sub_33420(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v0[71] = v20;
  v20(v10, v37);
  uint64_t v21 = *(void *)(v35 + 104);
  v0[72] = v21;
  if (v21)
  {
    uint64_t v22 = dword_D7DCC;
    swift_bridgeObjectRetain();
    uint64_t v23 = (void *)swift_task_alloc(v22);
    v0[73] = v23;
    sub_A0C0C(v23, (uint64_t)sub_9DD2C);
    sub_8277C();
    return sub_9EF44(v24, v25);
  }

  else
  {
    if (qword_D3220 != -1) {
      swift_once(&qword_D3220, sub_9D15C);
    }
    sub_16CD0(v0[44], (uint64_t)qword_D7D98);
    os_log_type_t v27 = sub_17714();
    if (sub_1990C(v27))
    {
      uint64_t v28 = (_WORD *)sub_16AC4(2LL);
      *uint64_t v28 = 0;
      sub_198C0(&dword_0, v29, v30, "UndoCreateAlarmFlow: No alarm id to delete! This should never happen.");
      sub_16AA8((uint64_t)v28);
    }

    sub_A0BEC();
    sub_452DC(v31, enum case for SiriTimeEventSender.ReasonDescription.noAlarmToDelete(_:));
    uint64_t v32 = (void *)swift_task_alloc(dword_D7DC4);
    v0[86] = v32;
    sub_A0B4C(v32);
    sub_8277C();
    return sub_9FF5C(v33, v34);
  }

uint64_t sub_9DD2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 576LL);
  *(void *)(*(void *)v1 + 592LL) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease(v2);
  sub_19840();
  return sub_1988C();
}

uint64_t sub_9DD88()
{
  if (v0[74])
  {
    uint64_t v1 = (void *)swift_task_alloc(dword_D7DD4);
    v0[75] = (uint64_t)v1;
    uint64_t v2 = sub_A0C0C(v1, (uint64_t)sub_9DE90);
    return sub_9F8CC(v2);
  }

  else
  {
    if (qword_D3220 != -1) {
      swift_once(&qword_D3220, sub_9D15C);
    }
    sub_16CD0(v0[44], (uint64_t)qword_D7D98);
    os_log_type_t v4 = sub_17714();
    if (sub_1990C(v4))
    {
      uint64_t v5 = (_WORD *)sub_16AC4(2LL);
      *uint64_t v5 = 0;
      sub_198C0(&dword_0, v6, v7, "UndoCreateAlarmFlow: No alarm id to delete! This should never happen.");
      sub_16AA8((uint64_t)v5);
    }

    sub_A0BEC();
    sub_452DC(v8, enum case for SiriTimeEventSender.ReasonDescription.noAlarmToDelete(_:));
    uint64_t v9 = (void *)swift_task_alloc(dword_D7DC4);
    v0[86] = (uint64_t)v9;
    uint64_t v10 = sub_A0B4C(v9);
    return sub_9FF5C(v10, v11);
  }

uint64_t sub_9DE90(char a1)
{
  *(_BYTE *)(*(void *)v1 + 712LL) = a1;
  swift_task_dealloc();
  sub_19840();
  return sub_1988C();
}

void sub_9DEE0()
{
  if (*(_BYTE *)(v0 + 712) == 1)
  {
    sub_4828C();
    *(void *)(v0 + 608) = v1;
    uint64_t v2 = *(void **)(v0 + 592);
    if (v1)
    {
      uint64_t v66 = v1;
      uint64_t v3 = sub_26B0(&qword_D4188);
      uint64_t inited = swift_initStackObject(v3, v0 + 136);
      *(_OWORD *)(inited + 16) = xmmword_A4CD0;
      *(void *)(inited + 32) = v2;
      v67[0] = inited;
      specialized Array._endMutation()(inited, v5, v6, v7);
      id v8 = v2;
      sub_6044();
      swift_bridgeObjectRelease(v67[0]);
      if (qword_D3220 != -1) {
        swift_once(&qword_D3220, sub_9D15C);
      }
      uint64_t v9 = sub_26F0(*(void *)(v0 + 352), (uint64_t)qword_D7D98);
      *(void *)(v0 + 616) = v9;
      uint64_t v17 = (os_log_s *)Logger.logObject.getter(v9, v10, v11, v12, v13, v14, v15, v16);
      os_log_type_t v18 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)sub_16AC4(2LL);
        *(_WORD *)uint64_t v19 = 0;
        sub_16B44(&dword_0, v17, v18, "UndoCreateAlarmFlow: RF path for undoing a create alarm.", v19);
        sub_16AA8((uint64_t)v19);
      }

      uint64_t v21 = *(void *)(v0 + 384);
      uint64_t v20 = *(void *)(v0 + 392);
      uint64_t v23 = *(void *)(v0 + 368);
      uint64_t v22 = *(void *)(v0 + 376);
      uint64_t v25 = *(void *)(v0 + 352);
      uint64_t v24 = *(void *)(v0 + 360);

      (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))( v20,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v22);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v9, v25);
      uint64_t v26 = mach_absolute_time();
      SiriTimeMeasurement.init(_:log:startTime:)(v20, v23, v26);
      uint64_t v27 = unk_D6AC4;
      swift_retain(v66);
      uint64_t v28 = (void *)swift_task_alloc(v27);
      *(void *)(v0 + 624) = v28;
      *uint64_t v28 = v0;
      v28[1] = sub_9E4B0;
      sub_A0BC0();
      __asm { BR              X3 }
    }

    uint64_t v34 = type metadata accessor for ABCReport(0LL);
    *(void *)(v0 + 40) = v34;
    *(void *)(v0 + 48) = &protocol witness table for ABCReport;
    uint64_t v35 = sub_19558((void *)(v0 + 16));
    void *v35 = 0xD000000000000013LL;
    v35[1] = 0x80000000000AA6F0LL;
    uint64_t v36 = enum case for UnhandledAbortSubtype.expectedObject(_:);
    uint64_t v37 = type metadata accessor for UnhandledAbortSubtype(0LL);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104LL))(v35, v36, v37);
    sub_17A5C( (uint64_t)v35,  enum case for ABCReport.unhandledAbort(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104LL));
    static BarbaraWalters.stopThePresses(for:)(v0 + 16);
    _s20HandleIntentStrategyVwxx_1((void *)(v0 + 16));
    v67[0] = 0LL;
    v67[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(87LL);
    v38._countAndFlagsBits = 0xD000000000000055LL;
    v38._object = (void *)0x80000000000AA710LL;
    String.append(_:)(v38);
    id v39 = [v2 description];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v39);

    v40._countAndFlagsBits = sub_A0C34();
    String.append(_:)(v40);
    sub_16F40();
    if (qword_D3220 != -1) {
      swift_once(&qword_D3220, sub_9D15C);
    }
    uint64_t v41 = *(void *)(v0 + 352);
    uint64_t v42 = *(void *)(v0 + 360);
    uint64_t v44 = *(void *)(v0 + 312);
    uint64_t v43 = *(void *)(v0 + 320);
    uint64_t v45 = sub_26F0(v41, (uint64_t)qword_D7D98);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v43, v45, v41);
    sub_A40C(v43, 0LL, 1LL, v41);
    sub_3F88(v43, v44, &qword_D4170);
    int v46 = sub_16880(v44, 1LL, v41);
    uint64_t v47 = *(os_log_s **)(v0 + 312);
    if (v46 == 1)
    {
      sub_A0954(*(void *)(v0 + 312), &qword_D4170);
    }

    else
    {
      uint64_t v48 = swift_bridgeObjectRetain_n(0xE000000000000000LL, 2LL);
      Logger.logObject.getter(v48, v49, v50, v51, v52, v53, v54, v55);
      os_log_type_t v56 = sub_17714();
      if (sub_16D30(v56))
      {
        uint64_t v57 = sub_16AC4(32LL);
        uint64_t v58 = sub_16AC4(64LL);
        v67[0] = v58;
        *(_DWORD *)uint64_t v57 = 136315650;
        uint64_t v59 = StaticString.description.getter( "/Library/Caches/com.apple.xbs/Sources/SiriTime/AlarmFlowPlugin/Flows/CustomFlows/UndoCreateAlarmFlow.swift",  106LL,  2LL);
        *(void *)(v0 + 232) = sub_3D10(v59, v60, v67);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v57 + 4, v57 + 12);
        sub_17900();
        *(_WORD *)(v57 + 12) = 2048;
        *(void *)(v0 + 208) = 84LL;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v57 + 14, v57 + 22);
        *(_WORD *)(v57 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v61 = sub_A0C34();
        *(void *)(v0 + 200) = sub_3D10(v61, v62, v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v57 + 24, v57 + 32);
        swift_bridgeObjectRelease_n(0xE000000000000000LL, 3LL);
        _os_log_impl(&dword_0, v47, (os_log_type_t)v43, "FatalError at %s:%lu - %s", (uint8_t *)v57, 0x20u);
        swift_arrayDestroy(v58, 2LL);
        sub_16AA8(v58);
        sub_16AA8(v57);
      }

      else
      {

        swift_bridgeObjectRelease_n(0xE000000000000000LL, 2LL);
      }

      sub_19838(*(void *)(v0 + 360));
    }

    uint64_t v64 = sub_A0C34();
    static SiriKitLifecycle._logCrashToEventBus(_:)(v64, v65);
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "/Library/Caches/com.apple.xbs/Sources/SiriTime/AlarmFlowPlugin/Flows/CustomFlows/UndoCreateAlarmFlow.swift",  106LL,  2LL,  84LL,  0);
    sub_A0BC0();
  }

  else
  {
    sub_A0C20();
    sub_2D1B0(v30);
    uint64_t v31 = (void *)swift_task_alloc(dword_D7DC4);
    *(void *)(v0 + 680) = v31;
    sub_A0B4C(v31);
    sub_A0BC0();
    sub_9FF5C(v32, v33);
  }

uint64_t sub_9E4B0()
{
  *os_log_type_t v4 = *v3;
  *(void *)(v2 + 632) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 640) = v0;
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_9E508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)[1]);
  v7[81] = v8;
  *id v8 = v7;
  v8[1] = sub_9E578;
  return PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)( v7 + 12,  v7[43],  v7[55],  v7[52],  0LL);
}

uint64_t sub_9E578()
{
  uint64_t v3 = (void *)v2[80];
  uint64_t v4 = v2[42];
  *uint64_t v5 = *v1;
  v2[82] = v0;
  swift_task_dealloc();
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));

  sub_19840();
  return swift_task_switch(v6, v7, v8);
}

uint64_t sub_9E5F8()
{
  uint64_t v1 = v0[11];
  sub_80B4(v0 + 7, v0[10]);
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to dispatch thunk of OutputPublisherAsync.publish(output:)[1]);
  v0[83] = v2;
  void *v2 = v0;
  v2[1] = sub_9E674;
  uint64_t v3 = sub_A0C34();
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v3, v4, v1);
}

uint64_t sub_9E674()
{
  void *v2 = *v1;
  *(void *)(v3 + 672) = v0;
  swift_task_dealloc();
  sub_19840();
  return sub_1988C();
}

uint64_t sub_9E6C4()
{
  uint64_t v1 = *(void *)(v0 + 296);
  sub_25068(*(void *)(v0 + 680));
  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_19744();
}

#error "9E754: call analysis failed (funcsize=26)"
uint64_t sub_9E774()
{
  uint64_t v0;
  uint64_t v1;
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
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
  uint64_t v24 = *(void *)(v0 + 552);
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 560);
  uint64_t v21 = *(void *)(v0 + 536);
  uint64_t v22 = *(void *)(v0 + 544);
  uint64_t v26 = *(void *)(v0 + 528);
  uint64_t v17 = *(void *)(v0 + 512);
  os_log_type_t v18 = *(void *)(v0 + 496);
  uint64_t v1 = *(void *)(v0 + 456);
  uint64_t v19 = *(uint64_t (**)(uint64_t, void, uint64_t))(v0 + 520);
  uint64_t v20 = *(void *)(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 448);
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 432);
  uint64_t v6 = *(void *)(v0 + 408);
  uint64_t v23 = *(void *)(v0 + 288);
  uint64_t v30 = *(void *)(v0 + 264);
  uint64_t v27 = *(void *)(v0 + 248);
  uint64_t v28 = *(void *)(v0 + 256);
  swift_release(*(void *)(v0 + 608));
  _s20HandleIntentStrategyVwxx_1((void *)(v0 + 96));
  sub_33420(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v5);
  _s20HandleIntentStrategyVwxx_1((void *)(v0 + 56));
  uint64_t v7 = v19(v17, enum case for ActivityType.completed(_:), v18);
  sub_A0BDC(v7, v8, v9, v21);
  v25(v1, v24, v22);
  sub_A40C(v1, 0LL, 1LL, v22);
  sub_A40C(v3, 1LL, 1LL, v23);
  static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v17, v26, v20, v1, v3);
  sub_A0954(v3, &qword_D43F8);
  sub_A0C2C(v10, &qword_D4400);
  sub_A0954(v20, &qword_D4408);
  v29(v17, v18);
  uint64_t v11 = v27 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  swift_beginAccess( v27 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction,  v0 + 176,  0LL,  0LL);
  sub_3F88(v11, v28, &qword_D43E0);
  uint64_t v12 = sub_16880(v28, 1LL, v30);
  uint64_t v13 = *(void **)(v0 + 592);
  if (v12 == 1)
  {
    sub_A0954(*(void *)(v0 + 256), &qword_D43E0);
    static ExecuteResponse.complete()();
  }

  else
  {
    uint64_t v15 = *(void *)(v0 + 272);
    uint64_t v14 = *(void *)(v0 + 280);
    sub_A0BB4(*(void *)(v0 + 256), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
    static ExecuteResponse.redirect(nextPluginAction:)(v14);

    sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
  }

  swift_task_dealloc();
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  sub_1987C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

#error "9EB04: call analysis failed (funcsize=51)"
uint64_t sub_9EB28()
{
  uint64_t v0;
  uint64_t v1;
  sub_2D000();
  uint64_t v1 = *(void *)(v0 + 296);
  sub_25068(*(void *)(v0 + 704));
  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_19840();
  return sub_19744();
}

#error "9EBDC: call analysis failed (funcsize=35)"
uint64_t sub_9EBFC()
{
  uint64_t *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  sub_2D0E8();
  sub_19838(v0[51]);
  v0[87] = v0[79];
  uint64_t v1 = (void *)v0[77];
  sub_2D010();
  uint64_t v2 = sub_2D010();
  Logger.logObject.getter(v2, v3, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = sub_17714();
  if (sub_16D30(v10))
  {
    uint64_t v11 = sub_16AC4(12LL);
    uint64_t v12 = sub_16AC4(32LL);
    sub_A0B2C(4.8149e-34);
    uint64_t v13 = sub_26B0(&qword_D4890);
    uint64_t v14 = sub_2D104(v13);
    uint64_t v17 = sub_A0B94(v14, v15, v16);
    sub_A0B60(v17);
    sub_17900();
    sub_2CF7C();
    sub_2CF7C();
    sub_2CFBC(&dword_0, v18, v19, "UndoCreateAlarmFlow: Error in RF path: %s");
    sub_2D034();
    sub_16AA8(v12);
    sub_16AA8(v11);
  }

  else
  {
    sub_2CF7C();
    sub_2CF7C();
  }

  sub_A0C20();
  sub_2D1B0(v20);
  uint64_t v21 = (void *)swift_task_alloc(dword_D7DC4);
  v0[88] = (uint64_t)v21;
  uint64_t v22 = sub_A0B4C(v21);
  return sub_A0ACC(v22, v23);
}

uint64_t sub_9ED0C()
{
  v0[87] = v0[82];
  uint64_t v1 = (void *)v0[77];
  sub_2D010();
  uint64_t v2 = sub_2D010();
  Logger.logObject.getter(v2, v3, v4, v5, v6, v7, v8, v9);
  os_log_type_t v10 = sub_17714();
  if (sub_16D30(v10))
  {
    uint64_t v11 = sub_16AC4(12LL);
    uint64_t v12 = sub_16AC4(32LL);
    sub_A0B2C(4.8149e-34);
    uint64_t v13 = sub_26B0(&qword_D4890);
    uint64_t v14 = sub_2D104(v13);
    uint64_t v17 = sub_A0B94(v14, v15, v16);
    sub_A0B60(v17);
    sub_17900();
    sub_2CF7C();
    sub_2CF7C();
    sub_2CFBC(&dword_0, v18, v19, "UndoCreateAlarmFlow: Error in RF path: %s");
    sub_2D034();
    sub_16AA8(v12);
    sub_16AA8(v11);
  }

  else
  {
    sub_2CF7C();
    sub_2CF7C();
  }

  sub_A0C20();
  sub_2D1B0(v20);
  uint64_t v21 = (void *)swift_task_alloc(dword_D7DC4);
  v0[88] = (uint64_t)v21;
  uint64_t v22 = sub_A0B4C(v21);
  return sub_A0ACC(v22, v23);
}

uint64_t sub_9EE1C()
{
  uint64_t v1 = v0[51];
  _s20HandleIntentStrategyVwxx_1(v0 + 12);
  sub_24FE0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  _s20HandleIntentStrategyVwxx_1(v0 + 7);
  v0[87] = v0[84];
  uint64_t v2 = (void *)v0[77];
  sub_2D010();
  uint64_t v3 = sub_2D010();
  Logger.logObject.getter(v3, v4, v5, v6, v7, v8, v9, v10);
  os_log_type_t v11 = sub_17714();
  if (sub_16D30(v11))
  {
    uint64_t v12 = sub_16AC4(12LL);
    uint64_t v13 = sub_16AC4(32LL);
    sub_A0B2C(4.8149e-34);
    uint64_t v14 = sub_26B0(&qword_D4890);
    uint64_t v15 = sub_2D104(v14);
    uint64_t v18 = sub_A0B94(v15, v16, v17);
    sub_A0B60(v18);
    sub_17900();
    sub_2CF7C();
    sub_2CF7C();
    sub_2CFBC(&dword_0, v19, v20, "UndoCreateAlarmFlow: Error in RF path: %s");
    sub_2D034();
    sub_16AA8(v13);
    sub_16AA8(v12);
  }

  else
  {
    sub_2CF7C();
    sub_2CF7C();
  }

  sub_A0C20();
  sub_2D1B0(v21);
  uint64_t v22 = (void *)swift_task_alloc(dword_D7DC4);
  v0[88] = v22;
  uint64_t v23 = sub_A0B4C(v22);
  return sub_A0ACC(v23, v24);
}

uint64_t sub_9EF44(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return sub_2D94C((uint64_t)sub_9EF58);
}

uint64_t sub_9EF58()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = swift_task_alloc(48LL);
  *(void *)(v0 + 48) = v2;
  __int128 v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 56) = v4;
  sub_26B0(&qword_D5058);
  *uint64_t v4 = v0;
  v4[1] = sub_9F00C;
  sub_19840();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_9F00C()
{
  return sub_1988C();
}

uint64_t sub_9F044(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v51 = a4;
  uint64_t v50 = sub_26B0(&qword_D5060);
  uint64_t v7 = *(void *)(v50 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v50);
  uint64_t v49 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v48 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_D3220 != -1) {
    swift_once(&qword_D3220, sub_9D15C);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  sub_26F0(v12, (uint64_t)qword_D7D98);
  uint64_t v13 = swift_bridgeObjectRetain_n(a3, 2LL);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v13, v14, v15, v16, v17, v18, v19, v20);
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc(12LL, -1LL);
    uint64_t v47 = a2;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    uint64_t v46 = a1;
    uint64_t v26 = v25;
    v53[0] = v25;
    uint64_t v45 = v7;
    *(_DWORD *)uint64_t v24 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_3D10(v47, a3, v53);
    uint64_t v7 = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease_n(a3, 3LL);
    _os_log_impl(&dword_0, v21, v22, "UndoCreateAlarmFlow.searchAlarm for %s", v24, 0xCu);
    swift_arrayDestroy(v26, 1LL);
    uint64_t v27 = v26;
    a1 = v46;
    swift_slowDealloc(v27, -1LL, -1LL);
    uint64_t v28 = v24;
    a2 = v47;
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(a3, 2LL);
  }

  uint64_t v29 = type metadata accessor for AlarmSearch(0LL);
  id v30 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v29));
  swift_bridgeObjectRetain();
  id v31 = sub_1D5F8(a2, a3, 0LL, 0xE000000000000000LL);
  uint64_t v32 = static os_signpost_type_t.begin.getter(v31);
  uint64_t v33 = v51;
  uint64_t v34 = *(void *)(v51 + 48);
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v32, &dword_0, v34, "UndoCreateAlarmSearchAlarm", 26LL, 2LL, v11);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v9);
  sub_4698(v33 + 56, (uint64_t)v53);
  uint64_t v35 = v54;
  uint64_t v36 = v55;
  sub_80B4(v53, v54);
  Swift::String v38 = v49;
  uint64_t v37 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v49, a1, v50);
  uint64_t v39 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v40 = (v39 + 24) & ~v39;
  uint64_t v41 = swift_allocObject(&unk_CD880, v40 + v8, v39 | 7);
  *(void *)(v41 + 16) = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v41 + v40, v38, v37);
  id v42 = v31;
  swift_retain(v33);
  dispatch thunk of SiriAlarmManager.searchAlarms(alarmSearch:completion:)(v31, sub_A0A70, v41, v35, v36);

  swift_release(v41);
  return _s20HandleIntentStrategyVwxx_1(v53);
}

uint64_t sub_9F3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v65 = a1;
  uint64_t v66 = a3;
  uint64_t v4 = type metadata accessor for AlarmOperationError(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v64 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v64 - v8;
  uint64_t v10 = sub_26B0(&qword_D4608);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = static os_signpost_type_t.end.getter(v15);
  uint64_t v19 = *(void *)(a2 + 48);
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v18, &dword_0, v19, "UndoCreateAlarmSearchAlarm", 26LL, 2LL, v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  sub_3F88(v65, (uint64_t)v12, &qword_D4608);
  if (swift_getEnumCaseMultiPayload(v12, v10) != 1)
  {
    uint64_t v45 = *v12;
    if ((unint64_t)*v12 >> 62)
    {
      if (v45 < 0) {
        uint64_t v48 = *v12;
      }
      else {
        uint64_t v48 = v45 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain();
      uint64_t v49 = _CocoaArrayWrapper.endIndex.getter(v48);
      swift_bridgeObjectRelease(v45);
      if (v49 == 1)
      {
        swift_bridgeObjectRetain();
        uint64_t v50 = _CocoaArrayWrapper.endIndex.getter(v48);
        swift_bridgeObjectRelease(v45);
        if (v50) {
          goto LABEL_9;
        }
      }
    }

    else if (*(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFF8LL)) == 1LL)
    {
LABEL_9:
      sub_44080(0LL, (v45 & 0xC000000000000001LL) == 0, v45);
      if ((v45 & 0xC000000000000001LL) != 0) {
        id v46 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v45);
      }
      else {
        id v46 = *(id *)(v45 + 32);
      }
      id v47 = v46;
      swift_bridgeObjectRelease(v45);
      v67[0] = v47;
LABEL_22:
      uint64_t v63 = sub_26B0(&qword_D5060);
      return CheckedContinuation.resume(returning:)(v67, v63);
    }

    swift_bridgeObjectRelease(v45);
    if (qword_D3220 != -1) {
      swift_once(&qword_D3220, sub_9D15C);
    }
    uint64_t v51 = type metadata accessor for Logger(0LL);
    uint64_t v52 = sub_26F0(v51, (uint64_t)qword_D7D98);
    unint64_t v60 = (os_log_s *)Logger.logObject.getter(v52, v53, v54, v55, v56, v57, v58, v59);
    os_log_type_t v61 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v61))
    {
      unint64_t v62 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v62 = 0;
      _os_log_impl(&dword_0, v60, v61, "UndoCreateAlarmFlow: Alarm not found.", v62, 2u);
      swift_slowDealloc(v62, -1LL, -1LL);
    }

    v67[0] = 0LL;
    goto LABEL_22;
  }

  uint64_t v20 = *(void (**)(char *, uint64_t *, uint64_t))(v5 + 32);
  v20(v9, v12, v4);
  uint64_t v21 = v5;
  uint64_t v22 = v4;
  if (qword_D3220 != -1) {
    swift_once(&qword_D3220, sub_9D15C);
  }
  uint64_t v23 = type metadata accessor for Logger(0LL);
  uint64_t v24 = sub_26F0(v23, (uint64_t)qword_D7D98);
  uint64_t v32 = (os_log_s *)Logger.logObject.getter(v24, v25, v26, v27, v28, v29, v30, v31);
  os_log_type_t v33 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_0, v32, v33, "UndoCreateAlarmFlow: Alarm search failure.", v34, 2u);
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  v67[0] = 0LL;
  uint64_t v35 = sub_26B0(&qword_D5060);
  CheckedContinuation.resume(returning:)(v67, v35);
  uint64_t v36 = type metadata accessor for ABCReport(0LL);
  v67[3] = v36;
  v67[4] = &protocol witness table for ABCReport;
  uint64_t v37 = sub_19558(v67);
  Swift::String v38 = v64;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v64, v9, v22);
  sub_16A6C( &qword_D4600,  (uint64_t (*)(uint64_t))&type metadata accessor for AlarmOperationError,  (uint64_t)&protocol conformance descriptor for AlarmOperationError);
  uint64_t v40 = swift_allocError(v22, v39, 0LL, 0LL);
  v20(v41, (uint64_t *)v38, v22);
  *uint64_t v37 = _convertErrorToNSError(_:)(v40);
  uint64_t v42 = enum case for ErrorSubType.managerReturnedError(_:);
  uint64_t v43 = type metadata accessor for ErrorSubType(0LL);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104LL))(v37, v42, v43);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104LL))( v37,  enum case for ABCReport.alarmUndoHandle(_:),  v36);
  static BarbaraWalters.stopThePresses(for:)(v67);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  _s20HandleIntentStrategyVwxx_1(v67);
  return swift_errorRelease(v40);
}

uint64_t sub_9F8CC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_2D94C((uint64_t)sub_9F8DC);
}

uint64_t sub_9F8DC()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc(32LL);
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  uint64_t v2 = (int8x16_t **)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[2].i64[1] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = (int8x16_t *)sub_9F97C;
  sub_19840();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_9F97C()
{
  return sub_1988C();
}

uint64_t sub_9F9B4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 48));
}

uint64_t sub_9F9C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = a3;
  uint64_t v31 = a1;
  uint64_t v4 = sub_26B0(&qword_D7F48);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = static os_signpost_type_t.begin.getter(v10);
  uint64_t v14 = *(void *)(a2 + 48);
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v13, &dword_0, v14, "UndoCreateAlarmDeleteAlarm", 26LL, 2LL, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  sub_4698(a2 + 56, (uint64_t)v33);
  uint64_t v15 = v34;
  uint64_t v29 = v35;
  sub_80B4(v33, v34);
  uint64_t v16 = sub_26B0(&qword_D4188);
  uint64_t v17 = swift_allocObject(v16, 40LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_A4CD0;
  uint64_t v18 = v30;
  *(void *)(v17 + 32) = v30;
  uint64_t v32 = v17;
  specialized Array._endMutation()(v17, v19, v20, v21);
  uint64_t v22 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v31, v4);
  uint64_t v23 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v24 = (v23 + 24) & ~v23;
  uint64_t v25 = swift_allocObject(&unk_CD858, v24 + v6, v23 | 7);
  *(void *)(v25 + 16) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v25 + v24, v7, v4);
  id v26 = v18;
  swift_retain(a2);
  dispatch thunk of SiriAlarmManager.deleteAlarms(alarms:completion:)(v22, sub_A0A44, v25, v15, v29);
  swift_bridgeObjectRelease(v22);
  swift_release(v25);
  return _s20HandleIntentStrategyVwxx_1(v33);
}

uint64_t sub_9FBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v47 = a1;
  uint64_t v48 = a3;
  uint64_t v4 = type metadata accessor for AlarmOperationError(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v46 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v46 - v8;
  uint64_t v10 = sub_26B0(&qword_D4608);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = static os_signpost_type_t.end.getter(v15);
  uint64_t v19 = *(void *)(a2 + 48);
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v18, &dword_0, v19, "UndoCreateAlarmDeleteAlarm", 26LL, 2LL, v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  sub_3F88(v47, (uint64_t)v12, &qword_D4608);
  if (swift_getEnumCaseMultiPayload(v12, v10) == 1)
  {
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v20(v9, v12, v4);
    uint64_t v21 = v5;
    uint64_t v22 = v4;
    if (qword_D3220 != -1) {
      swift_once(&qword_D3220, sub_9D15C);
    }
    uint64_t v23 = type metadata accessor for Logger(0LL);
    uint64_t v24 = sub_26F0(v23, (uint64_t)qword_D7D98);
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v24, v25, v26, v27, v28, v29, v30, v31);
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_0, v32, v33, "UndoCreateAlarmFlow: Failed to delete alarm.", v34, 2u);
      swift_slowDealloc(v34, -1LL, -1LL);
    }

    LOBYTE(v49[0]) = 0;
    uint64_t v35 = sub_26B0(&qword_D7F48);
    CheckedContinuation.resume(returning:)(v49, v35);
    uint64_t v36 = type metadata accessor for ABCReport(0LL);
    v49[3] = v36;
    v49[4] = &protocol witness table for ABCReport;
    uint64_t v37 = sub_19558(v49);
    Swift::String v38 = v46;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v46, v9, v22);
    sub_16A6C( &qword_D4600,  (uint64_t (*)(uint64_t))&type metadata accessor for AlarmOperationError,  (uint64_t)&protocol conformance descriptor for AlarmOperationError);
    uint64_t v40 = swift_allocError(v22, v39, 0LL, 0LL);
    v20(v41, v38, v22);
    *uint64_t v37 = _convertErrorToNSError(_:)(v40);
    uint64_t v42 = enum case for ErrorSubType.managerReturnedError(_:);
    uint64_t v43 = type metadata accessor for ErrorSubType(0LL);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104LL))(v37, v42, v43);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104LL))( v37,  enum case for ABCReport.alarmUndoHandle(_:),  v36);
    static BarbaraWalters.stopThePresses(for:)(v49);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
    _s20HandleIntentStrategyVwxx_1(v49);
    return swift_errorRelease(v40);
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)v12);
    LOBYTE(v49[0]) = 1;
    uint64_t v45 = sub_26B0(&qword_D7F48);
    return CheckedContinuation.resume(returning:)(v49, v45);
  }

uint64_t sub_9FF5C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = type metadata accessor for NLContextUpdate(0LL);
  v3[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[6] = v5;
  v3[7] = sub_19754(v5);
  uint64_t v6 = type metadata accessor for DialogPhase(0LL);
  v3[8] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[9] = v7;
  v3[10] = sub_19754(v7);
  uint64_t v8 = sub_16C80();
  v3[11] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[12] = v9;
  v3[13] = sub_19754(v9);
  uint64_t v10 = type metadata accessor for SiriTimeMeasurement.LogDescription(0LL);
  v3[14] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[15] = v11;
  v3[16] = sub_19754(v11);
  uint64_t v12 = type metadata accessor for SiriTimeMeasurement(0LL);
  v3[17] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[18] = v13;
  v3[19] = sub_19754(v13);
  uint64_t v14 = sub_26B0(&qword_D43F8);
  v3[20] = sub_19754(*(void *)(v14 - 8));
  uint64_t v15 = sub_26B0(&qword_D4400);
  v3[21] = sub_19754(*(void *)(v15 - 8));
  uint64_t v16 = sub_26B0(&qword_D4408);
  v3[22] = sub_19754(*(void *)(v16 - 8));
  uint64_t v17 = type metadata accessor for SiriTimeEventSender.TaskType(0LL);
  v3[23] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v3[24] = v18;
  v3[25] = sub_19754(v18);
  uint64_t v19 = type metadata accessor for ActivityType(0LL);
  v3[26] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v3[27] = v20;
  v3[28] = sub_19754(v20);
  sub_19840();
  return sub_1988C();
}

void sub_A0094()
{
  if (qword_D3228 != -1) {
    swift_once(&qword_D3228, sub_9D1A4);
  }
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[22];
  uint64_t v3 = sub_26F0(v0[23], (uint64_t)qword_D8578);
  sub_A0BB4(v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  uint64_t v4 = enum case for SiriKitReliabilityCodes.genericError(_:);
  uint64_t v5 = type metadata accessor for SiriKitReliabilityCodes(0LL);
  sub_17A5C(v2, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104LL));
  sub_A40C(v2, 0LL, 1LL, v5);
  if (qword_D3230 != -1) {
    swift_once(&qword_D3230, sub_9D1C0);
  }
  uint64_t v6 = v0[28];
  uint64_t v35 = v0[27];
  uint64_t v36 = v0[26];
  uint64_t v7 = v0[24];
  uint64_t v9 = v0[21];
  uint64_t v8 = v0[22];
  uint64_t v10 = v0[20];
  uint64_t v11 = v0[3];
  uint64_t v12 = type metadata accessor for SiriTimeEventSender.Attribute(0LL);
  uint64_t v13 = sub_26F0(v12, (uint64_t)qword_D8590);
  sub_4B010(v9, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL));
  sub_2D11C(v9);
  uint64_t v14 = type metadata accessor for SiriTimeEventSender.ReasonDescription(0LL);
  sub_4B010(v10, v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL));
  sub_2D11C(v10);
  uint64_t v15 = sub_A0B7C();
  sub_A0C2C(v15, &qword_D43F8);
  sub_A0954(v9, &qword_D4400);
  sub_A0954(v8, &qword_D4408);
  sub_33420(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v6, v36);
  if (qword_D3220 != -1) {
    swift_once(&qword_D3220, sub_9D15C);
  }
  uint64_t v16 = sub_26F0(v0[11], (uint64_t)qword_D7D98);
  v0[29] = v16;
  uint64_t v24 = (os_log_s *)Logger.logObject.getter(v16, v17, v18, v19, v20, v21, v22, v23);
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)sub_16AC4(2LL);
    *(_WORD *)uint64_t v26 = 0;
    sub_16B44( &dword_0,  v24,  v25,  "UndoCreateAlarmFlow: Hitting alarm RF codepath for UndoCreateAlarmFlow error case.",  v26);
    sub_16AA8((uint64_t)v26);
  }

  uint64_t v28 = v0[15];
  uint64_t v27 = v0[16];
  uint64_t v30 = v0[13];
  uint64_t v29 = v0[14];
  uint64_t v31 = v0[12];

  (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))( v27,  enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:),  v29);
  sub_28710(v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16));
  uint64_t v32 = mach_absolute_time();
  SiriTimeMeasurement.init(_:log:startTime:)(v27, v30, v32);
  os_log_type_t v33 = (void *)swift_task_alloc(unk_D3BE4);
  v0[30] = v33;
  void *v33 = v0;
  v33[1] = sub_A0394;
  sub_8277C();
  __asm { BR              X3 }

uint64_t sub_A0394()
{
  *uint64_t v4 = *v3;
  *(void *)(v2 + 248) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v2 + 256) = v0;
  }
  sub_19840();
  return sub_19744();
}

uint64_t sub_A03EC()
{
  uint64_t v1 = static DialogPhase.error.getter();
  NLContextUpdate.init()(v1);
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)[1]);
  v0[33] = v2;
  void *v2 = v0;
  v2[1] = sub_A0460;
  return PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)(v0[2], v0[10], v0[7], v0[19]);
}

uint64_t sub_A0460()
{
  uint64_t v1 = (void *)v0[32];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[6];
  sub_25068(v0[33]);

  sub_33420(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_19780(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_19840();
  return swift_task_switch(v4, v5, v6);
}

uint64_t sub_A04D4()
{
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A0538()
{
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v2 = sub_19838(*(void *)(v0 + 144));
  Logger.logObject.getter(v2, v3, v4, v5, v6, v7, v8, v9);
  os_log_type_t v10 = sub_17714();
  if (sub_1990C(v10))
  {
    uint64_t v11 = (_WORD *)sub_16AC4(2LL);
    *uint64_t v11 = 0;
    sub_198C0(&dword_0, v12, v13, "UndoCreateAlarmFlow: Failed to produce Incomplete response.");
    sub_16AA8((uint64_t)v11);
  }

  static ExecuteResponse.complete()();
  sub_2CF7C();
  sub_2D07C();
  sub_19808();
  sub_19800();
  sub_1978C();
  sub_19794();
  sub_197C0();
  sub_19830();
  sub_19828();
  sub_19820();
  sub_1987C();
  return sub_19704(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t UndoCreateAlarmFlow.deinit()
{
  _s20HandleIntentStrategyVwxx_1((void *)(v0 + 56));
  swift_bridgeObjectRelease(*(void *)(v0 + 104));
  sub_A0954(v0 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction, &qword_D43E0);
  return v0;
}

uint64_t UndoCreateAlarmFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_A067C()
{
  return UndoCreateAlarmFlow.on(input:)() & 1;
}

uint64_t sub_A06A0(uint64_t a1, uint64_t a2)
{
  return UndoCreateAlarmFlow.execute(completion:)(a1, a2);
}

uint64_t sub_A06C0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D7DBC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24D34;
  return UndoCreateAlarmFlow.execute()(a1);
}

uint64_t sub_A0714(uint64_t a1, uint64_t a2)
{
  uint64_t AlarmFlow = type metadata accessor for UndoCreateAlarmFlow(0LL);
  return Flow<>.exitValue.getter(AlarmFlow, a2);
}

void *sub_A073C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AlarmFlow = type metadata accessor for UndoCreateAlarmFlow(0LL);
  uint64_t v11 = (void *)swift_allocObject(AlarmFlow, *(unsigned int *)(AlarmFlow + 48), *(unsigned __int16 *)(AlarmFlow + 52));
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  uint64_t v12 = sub_A07F8((uint64_t)v9, v11, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v12;
}

void *sub_A07F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v8);
  os_log_type_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v11 = sub_19558(&v16);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))(v11, a1, a3);
  type metadata accessor for DeleteAlarmCATs_Async(0LL);
  static CATOption.defaultMode.getter();
  a2[2] = CATWrapper.__allocating_init(options:globals:)(v10, 0LL);
  type metadata accessor for DeleteAlarmCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  a2[3] = CATWrapper.__allocating_init(options:globals:)(v10, 0LL);
  static CATOption.defaultMode.getter();
  a2[4] = CATWrapper.__allocating_init(options:globals:)(v10, 0LL);
  type metadata accessor for ErrorCATPatternsExecutor(0LL);
  static CATOption.defaultMode.getter();
  a2[5] = CATWrapper.__allocating_init(options:globals:)(v10, 0LL);
  a2[6] = _s15AlarmFlowPlugin021RecreateDeletedAlarmsB0C11osLogObject33_DB4DDA2311F8F0836B4CA98F718F999FLLSo03OS_G4_logCvpfi_0();
  a2[12] = 0LL;
  a2[13] = 0LL;
  uint64_t v12 = (uint64_t)a2 + OBJC_IVAR____TtC15AlarmFlowPlugin19UndoCreateAlarmFlow_followupPluginAction;
  uint64_t v13 = type metadata accessor for PluginAction(0LL);
  sub_A40C(v12, 1LL, 1LL, v13);
  sub_46FC(&v16, (uint64_t)(a2 + 7));
  return a2;
}

void sub_A0954(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_45CF8(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
  sub_17B50();
}

uint64_t sub_A0984()
{
  return type metadata accessor for UndoCreateAlarmFlow(0LL);
}

void sub_A098C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = "(";
  v4[6] = &unk_A7BA0;
  sub_2CBE8(319LL);
  if (v3 <= 0x3F)
  {
    v4[7] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
  }

uint64_t sub_A0A30(uint64_t a1)
{
  return sub_9F9C0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_A0A38()
{
  return sub_44D3C(&qword_D7F48);
}

uint64_t sub_A0A44(uint64_t a1)
{
  return sub_A0A84(a1, &qword_D7F48, sub_9FBB8);
}

uint64_t sub_A0A58(uint64_t a1)
{
  return sub_9F044(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_A0A64()
{
  return sub_44D3C(&qword_D5060);
}

uint64_t sub_A0A70(uint64_t a1)
{
  return sub_A0A84(a1, &qword_D5060, sub_9F3D4);
}

uint64_t sub_A0A84(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, void, uint64_t))
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(sub_45CF8(a1, a2) - 8) + 80LL);
  return a3(v3, *(void *)(v4 + 16), v4 + ((v5 + 24) & ~v5));
}

uint64_t sub_A0ACC(uint64_t a1, uint64_t a2)
{
  return sub_9FF5C(a1, a2);
}

uint64_t sub_A0AE8()
{
  return swift_task_dealloc(*(void *)(v0 + 512));
}

uint64_t sub_A0B2C(float a1)
{
  float *v2 = a1;
  *(void *)(v3 + 216) = v1;
  return swift_errorRetain(v1);
}

uint64_t sub_A0B4C(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 240);
}

uint64_t sub_A0B60(uint64_t a1)
{
  *(void *)(v1 + 224) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 224, v1 + 232, v3, v2);
}

uint64_t sub_A0B7C()
{
  return static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(v0, v1, v2, v3, v4);
}

uint64_t sub_A0B94(uint64_t a1, unint64_t a2, uint64_t a3, ...)
{
  return sub_3D10(a1, a2, (uint64_t *)va);
}

uint64_t sub_A0BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(v5 - 136, v5 - 120, v4 + 8, a4, 6LL);
}

uint64_t sub_A0BB4@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v3, a1, v2);
}

  ;
}

uint64_t sub_A0BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_A40C(v4, 1LL, 1LL, a4);
}

void sub_A0BEC()
{
}

uint64_t sub_A0BF8()
{
  return v0;
}

uint64_t sub_A0C0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_A0C20()
{
  return *(void *)(v0 + 304);
}

void sub_A0C2C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_A0C34()
{
  return v0;
}

uint64_t sub_A0C40()
{
  return v0(*(void *)(v2 - 168), v1);
}

uint64_t type metadata accessor for ChangeAlarmStatusCATs_Async(uint64_t a1)
{
  uint64_t result = qword_D7F50;
  if (!qword_D7F50) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ChangeAlarmStatusCATs_Async);
  }
  return result;
}

uint64_t sub_A0C84(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D85A8);
}

uint64_t sub_A0CC0()
{
  return type metadata accessor for ChangeAlarmStatusCATs_Async(0LL);
}

uint64_t Siri_Nlu_External_UserParse.alarmSearch.getter(uint64_t a1)
{
  uint64_t v1 = Siri_Nlu_External_UserParse.firstUsoTask.getter(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    type metadata accessor for AlarmSearch(0LL);
    sub_1C31C(v2);
    uint64_t v4 = v3;
    swift_release(v2);
    return v4;
  }

  else
  {
    if (qword_D3238 != -1) {
      swift_once(&qword_D3238, sub_A0DCC);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_26F0(v6, (uint64_t)qword_D7FA0);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v7, v8, v9, v10, v11, v12, v13, v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "No task found in userDialogAct.", v17, 2u);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    return 0LL;
  }

uint64_t sub_A0DCC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7FA0);
  sub_26F0(v0, (uint64_t)qword_D7FA0);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_A0E14()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D7FB8);
  sub_26F0(v0, (uint64_t)qword_D7FB8);
  return static SiriTimeLog.alarmPlugin.getter();
}

uint64_t sub_A0E5C()
{
  uint64_t v1 = swift_allocObject(v0, 16LL, 7LL);
  sub_A0E90();
  return v1;
}

void sub_A0E90()
{
  uint64_t v0 = type metadata accessor for AlarmFlowPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id v2 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  static CATExecutor.registerBundle(bundle:templateDir:)();

  sub_1D738();
}

void sub_A0F10()
{
  uint64_t v0 = sub_26B0(&qword_D8080);
  __chkstk_darwin(v0);
  id v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static AlarmFlowFactory.makeFlowFrom(parse:)();
  uint64_t v3 = type metadata accessor for FlowSearchResult(0LL);
  if (sub_16880((uint64_t)v2, 1LL, v3) == 1)
  {
    sub_A1164((uint64_t)v2);
  }

  else
  {
    uint64_t v4 = FlowSearchResult.flow.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
    if (v4) {
      goto LABEL_9;
    }
  }

  if (qword_D3240 != -1) {
    swift_once(&qword_D3240, sub_A0E14);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_26F0(v5, (uint64_t)qword_D7FB8);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v6, v7, v8, v9, v10, v11, v12, v13);
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v16 = (uint8_t *)sub_1EFA4();
    *(_WORD *)os_log_type_t v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "Unable to parse valid alarm flow in deprecated makeFlowFor(parse:)", v16, 2u);
    sub_16AA8((uint64_t)v16);
  }

  uint64_t v17 = type metadata accessor for NoOpFlow(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = NoOpFlow.init()();
  v20[1] = v18;
  uint64_t v19 = sub_A11A4( (unint64_t *)&unk_D8088,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for NoOpFlow,  (uint64_t)&protocol conformance descriptor for NoOpFlow);
  Flow.eraseToAnyFlow()(v17, v19);
  swift_release(v18);
LABEL_9:
  sub_1D738();
}

uint64_t type metadata accessor for AlarmFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC15AlarmFlowPlugin15AlarmFlowPlugin);
}

uint64_t sub_A10F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A0E5C();
  *a1 = result;
  return result;
}

void sub_A1120()
{
}

uint64_t sub_A1138(uint64_t a1, uint64_t a2)
{
  return sub_A11A4( &qword_D8078,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for AlarmFlowPlugin,  (uint64_t)&unk_A7C0C);
}

uint64_t sub_A1164(uint64_t a1)
{
  uint64_t v2 = sub_26B0(&qword_D8080);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_A11A4(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_A11E4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_D4DC4);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_82E5C;
  return sub_38A3C(a1, a2, a3);
}

uint64_t type metadata accessor for SearchAlarmCATsSimple(uint64_t a1)
{
  uint64_t result = qword_D8098;
  if (!qword_D8098) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SearchAlarmCATsSimple);
  }
  return result;
}

uint64_t sub_A1288(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_D85B8);
}

uint64_t sub_A12C4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  *(_WORD *)(v9 + 99) = v12;
  *(_BYTE *)(v9 + 98) = a8;
  *(void *)(v9 + 48) = a7;
  *(void *)(v9 + 56) = v8;
  *(_BYTE *)(v9 + 9static OutputPublisherFactory.makeOutputPublisherAsync()(v0 + 7) = a5;
  *(void *)(v9 + 32) = a4;
  *(void *)(v9 + 40) = a6;
  *(_BYTE *)(v9 + 96) = a3;
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  uint64_t v10 = sub_26B0(&qword_D3A08);
  *(void *)(v9 + 64) = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_A1344, 0LL, 0LL);
}

uint64_t sub_A1344()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_26B0(&qword_D3BD0);
  uint64_t v3 = swift_allocObject(v2, 416LL, 7LL);
  *(void *)(v0 + 72) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_A7CC0;
  *(void *)(v3 + 32) = 0x6D72616C61LL;
  *(void *)(v3 + 40) = 0xE500000000000000LL;
  uint64_t v4 = 0LL;
  if (v1)
  {
    uint64_t v4 = type metadata accessor for AlarmAlarm(0LL);
  }

  else
  {
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
  }

  char v5 = *(_BYTE *)(v0 + 96);
  *(void *)(v3 + 48) = v1;
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 0xD000000000000010LL;
  *(void *)(v3 + 88) = 0x80000000000A9790LL;
  if ((v5 & 1) != 0)
  {
    uint64_t v7 = 0LL;
    uint64_t v6 = 0LL;
    *(void *)(v3 + 104) = 0LL;
    *(void *)(v3 + 112) = 0LL;
  }

  else
  {
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = &type metadata for Double;
  }

  char v8 = *(_BYTE *)(v0 + 97);
  *(void *)(v3 + 96) = v6;
  *(void *)(v3 + 120) = v7;
  *(void *)(v3 + 128) = 0xD000000000000012LL;
  *(void *)(v3 + 136) = 0x80000000000A9750LL;
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    *(void *)(v3 + 152) = 0LL;
    *(void *)(v3 + 160) = 0LL;
  }

  else
  {
    uint64_t v9 = *(void *)(v0 + 32);
    uint64_t v10 = &type metadata for Double;
  }

  uint64_t v11 = *(void *)(v0 + 64);
  uint64_t v12 = *(void *)(v0 + 40);
  *(void *)(v3 + 144) = v9;
  *(void *)(v3 + 168) = v10;
  *(void *)(v3 + 176) = 0xD000000000000012LL;
  *(void *)(v3 + 184) = 0x80000000000A81D0LL;
  sub_4D80(v12, v11, &qword_D3A08);
  uint64_t v13 = type metadata accessor for SpeakableString(0LL);
  int v14 = sub_16880(v11, 1LL, v13);
  uint64_t v15 = *(void *)(v0 + 64);
  uint64_t v16 = *(void *)(v0 + 16);
  if (v14 == 1)
  {
    swift_retain(*(void *)(v0 + 16));
    sub_19594(v15, &qword_D3A08);
    *(_OWORD *)(v3 + 192) = 0u;
    *(_OWORD *)(v3 + 208) = 0u;
  }

  else
  {
    *(void *)(v3 + 216) = v13;
    uint64_t v17 = sub_19558((void *)(v3 + 192));
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32LL))(v17, v15, v13);
    swift_retain(v16);
  }

  uint64_t v18 = *(void *)(v0 + 48);
  *(void *)(v3 + 224) = 0xD000000000000011LL;
  *(void *)(v3 + 232) = 0x80000000000A81F0LL;
  uint64_t v19 = 0LL;
  if (v18)
  {
    uint64_t v19 = type metadata accessor for DialogCalendar(0LL);
  }

  else
  {
    *(void *)(v3 + 248) = 0LL;
    *(void *)(v3 + 256) = 0LL;
  }

  char v20 = *(_BYTE *)(v0 + 100);
  char v21 = *(_BYTE *)(v0 + 99);
  *(void *)(v3 + 264) = v19;
  *(void *)(v3 + 272) = 0xD000000000000014LL;
  char v22 = *(_BYTE *)(v0 + 98);
  *(void *)(v3 + 280) = 0x80000000000A97B0LL;
  *(void *)(v3 + 240) = v18;
  *(_BYTE *)(v3 + 288) = v22;
  *(void *)(v3 + 312) = &type metadata for Bool;
  *(void *)(v3 + 320) = 0xD000000000000012LL;
  *(void *)(v3 + 328) = 0x80000000000A97D0LL;
  *(_BYTE *)(v3 + 336) = v21;
  *(void *)(v3 + 360) = &type metadata for Bool;
  *(void *)(v3 + 368) = 0xD000000000000012LL;
  *(void *)(v3 + 376) = 0x80000000000A9770LL;
  *(void *)(v3 + 408) = &type metadata for Bool;
  uint64_t v23 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  *(_BYTE *)(v3 + 384) = v20;
  swift_retain(v18);
  uint64_t v24 = (void *)swift_task_alloc(v23);
  *(void *)(v0 + 80) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_A160C;
  uint64_t v25 = sub_A17BC(0xD00000000000002CLL);
  return v27(v25);
}

uint64_t sub_A160C()
{
  uint64_t v4 = *v3;
  *char v5 = v4;
  *(void *)(v2 + 88) = v1;
  swift_task_dealloc();
  if (v1) {
    return sub_19744();
  }
  swift_bridgeObjectRelease(*(void *)(v2 + 72));
  swift_task_dealloc();
  return sub_4F354(v0, *(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_A167C()
{
  return sub_1B5EC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A16B0(uint64_t a1, char a2)
{
  *(_BYTE *)(v3 + 56) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return swift_task_switch(sub_A16CC, 0LL, 0LL);
}

uint64_t sub_A16CC()
{
  char v1 = *(_BYTE *)(v0 + 56);
  uint64_t v2 = sub_26B0(&qword_D3BD0);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  *(void *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_A4880;
  *(void *)(v3 + 32) = 0xD000000000000010LL;
  *(void *)(v3 + 40) = 0x80000000000A9790LL;
  if ((v1 & 1) != 0)
  {
    char v5 = 0LL;
    uint64_t v4 = 0LL;
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
  }

  else
  {
    uint64_t v4 = *(void *)(v0 + 16);
    char v5 = &type metadata for Double;
  }

  *(void *)(v3 + 72) = v5;
  *(void *)(v3 + 48) = v4;
  *(void *)(v0 + 40) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_4F174;
  uint64_t v7 = sub_A17BC(0xD000000000000025LL);
  return v9(v7);
}

uint64_t sub_A17B4()
{
  return type metadata accessor for SearchAlarmCATsSimple(0LL);
}

uint64_t sub_A17BC@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

ValueMetadata *_s24UnsupportedValueStrategyVMa_3()
{
  return &_s24UnsupportedValueStrategyVN_3;
}

uint64_t sub_A17E0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1688C(v0, qword_D80F8);
  sub_26F0(v0, (uint64_t)qword_D80F8);
  return static SiriTimeLog.alarmFlow.getter();
}

uint64_t sub_A1828(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_task_switch(sub_A1840, 0LL, 0LL);
}

uint64_t sub_A1840()
{
  uint64_t v1 = sub_26B0(&qword_D6CB8);
  uint64_t v2 = (void *)ParameterResolutionRecord.result.getter(v1);
  v0[5] = v2;
  if (qword_D3248 != -1) {
    swift_once(&qword_D3248, sub_A17E0);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  os_log_type_t v4 = sub_26F0(v3, (uint64_t)qword_D80F8);
  id v5 = v2;
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v5, v6, v7, v8, v9, v10, v11, v12);
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (sub_16D30(v14))
  {
    uint64_t v15 = (uint8_t *)sub_16AC4(12LL);
    *(_DWORD *)uint64_t v15 = 134217984;
    v0[2] = [v5 unsupportedReason];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v15 + 4, v15 + 12);

    _os_log_impl( &dword_0,  v13,  v4,  "UpdateAlarm.UnsupportedValueStrategy.makeUnsupportedValueOutput() called with unsupportedReason: %ld",  v15,  0xCu);
    sub_16AA8((uint64_t)v15);
  }

  else
  {
  }

  uint64_t v16 = (void *)ParameterResolutionRecord.intent.getter(v1);
  id v17 = [v16 alarmSearch];
  v0[6] = v17;

  uint64_t v18 = (void *)swift_task_alloc(dword_D3884);
  v0[7] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_A19E8;
  return sub_17E4C(v0[3], (uint64_t)v17, (uint64_t)v5);
}

uint64_t sub_A19E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_A1A80;
  }

  else
  {

    uint64_t v3 = sub_A1A54;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_A1A54()
{
  return sub_1B5EC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A1A80()
{
  uint64_t v1 = *(void **)(v0 + 40);

  return sub_1B5EC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A1AB0(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = type metadata accessor for ParameterIdentifier(0LL);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = sub_19884();
  v1[7] = sub_19884();
  v1[8] = sub_19884();
  return swift_task_switch(sub_A1B20, 0LL, 0LL);
}

uint64_t sub_A1B20()
{
  uint64_t v1 = sub_26B0(&qword_D6CB8);
  ParameterResolutionRecord.parameter.getter();
  if (qword_D3248 != -1) {
    swift_once(&qword_D3248, sub_A17E0);
  }
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_26F0(v6, (uint64_t)qword_D80F8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v8 = v7(v3, v2, v5);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v8, v9, v10, v11, v12, v13, v14, v15);
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = sub_16D30(v17);
  uint64_t v19 = *(void *)(v0 + 56);
  if (v18)
  {
    uint64_t v20 = *(void *)(v0 + 48);
    uint64_t v32 = *(void *)(v0 + 40);
    uint64_t v34 = v1;
    uint64_t v21 = *(void *)(v0 + 32);
    char v22 = (uint8_t *)sub_16AC4(12LL);
    uint64_t v33 = sub_16AC4(32LL);
    uint64_t v35 = v33;
    *(_DWORD *)char v22 = 136315138;
    v7(v20, v19, v21);
    uint64_t v23 = String.init<A>(describing:)(v20, v21);
    unint64_t v25 = v24;
    *(void *)(v0 + 16) = sub_3D10(v23, v24, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    uint64_t v27 = v21;
    uint64_t v1 = v34;
    v26(v19, v27);
    _os_log_impl( &dword_0,  v16,  (os_log_type_t)v3,  "UpdateAlarm.UnsupportedValueStrategy.makeUpdatedIntentForUnsupportedValue() called for parameter: %s",  v22,  0xCu);
    swift_arrayDestroy(v33, 1LL);
    sub_16AA8(v33);
    sub_16AA8((uint64_t)v22);
  }

  else
  {
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 40) + 8LL);
    v26(*(void *)(v0 + 56), *(void *)(v0 + 32));
  }

  uint64_t v28 = *(void *)(v0 + 64);
  uint64_t v29 = *(void *)(v0 + 32);
  uint64_t v30 = ParameterResolutionRecord.intent.getter(v1);
  v26(v28, v29);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v30);
}

uint64_t sub_A1D58(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_D8134);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B3B8;
  return sub_A1828(a1, a2);
}

uint64_t sub_A1DB0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_D812C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_5D0C;
  return sub_A1AB0(a1);
}

uint64_t _s15AlarmFlowPlugin021RecreateDeletedAlarmsB0C11osLogObject33_DB4DDA2311F8F0836B4CA98F718F999FLLSo03OS_G4_logCvpfi_0()
{
  return static SiriTimeLog.alarmExtensionOSLogObject.getter();
}
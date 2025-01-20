uint64_t sub_2AE4()
{
  uint64_t v0;
  uint64_t v2;
  v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2B18()
{
  return 20LL;
}

uint64_t sub_2B34()
{
  return 1LL;
}

BOOL sub_2B50(uint64_t a1)
{
  BOOL v4 = a1 >= sub_2B34();
  swift_retain();
  BOOL v2 = !v4 || a1 >= sub_2B18();
  swift_release();
  return v2;
}

uint64_t sub_2BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = v4;
  v5[2] = v5;
  v5[3] = 0LL;
  v5[4] = 0LL;
  v5[5] = 0LL;
  v5[6] = 0LL;
  v5[7] = 0LL;
  v5[3] = a1;
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = v4;
  return swift_task_switch(sub_2C5C, 0LL);
}

uint64_t sub_2C5C()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_2CB0();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8LL))(v1);
}

uint64_t sub_2CB0()
{
  v15 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v8 = type metadata accessor for Calendar(0LL);
  uint64_t v7 = *(void *)(v8 - 8);
  unint64_t v5 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = __chkstk_darwin(0LL);
  uint64_t v9 = (uint64_t)&v4 - v5;
  uint64_t v12 = type metadata accessor for Date(v1);
  uint64_t v10 = *(void *)(v12 - 8);
  unint64_t v6 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(v12);
  uint64_t v11 = (uint64_t)&v4 - v6;
  v15 = (char *)&v4 - v6;
  uint64_t v14 = v0;
  Date.init()(v2);
  sub_2DC4(v9);
  uint64_t v13 = sub_2E74(v11, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
  return v13;
}

void sub_2DC4(uint64_t a1@<X8>)
{
  uint64_t v3 = a1;
  uint64_t v5 = type metadata accessor for Calendar(0LL);
  uint64_t v2 = *(void *)(v5 - 8);
  unint64_t v1 = (*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v4 = (char *)&v1 - v1;
  id v6 = [(id)objc_opt_self(NSCalendar) currentCalendar];
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v3, v4, v5);
}

uint64_t sub_2E74(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  uint64_t v3 = v2;
  uint64_t v17 = v3;
  uint64_t v27 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v19 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v18 = *(void *)(v19 - 8);
  __chkstk_darwin();
  v20 = (char *)&v12 - v5;
  uint64_t v27 = v16;
  uint64_t v26 = a2;
  uint64_t v25 = v17;
  (*(void (**)(void))(v6 + 104))();
  uint64_t v21 = Calendar.component(_:from:)(v20, v16);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v19);
  uint64_t v24 = v21;
  uint64_t v22 = specialized _allocateUninitializedArray<A>(_:)(1LL);
  v23 = v7;
  if (sub_2B50(v21)) {
    uint64_t v13 = sub_2FE4(0);
  }
  else {
    uint64_t v13 = sub_2FE4(1);
  }
  uint64_t v14 = v8;
  uint64_t result = v22;
  uint64_t v10 = v23;
  uint64_t v11 = v13;
  v23[3] = (uint64_t)&type metadata for String;
  *uint64_t v10 = v11;
  v10[1] = v8;
  sub_306C();
  return result;
}

uint64_t sub_2FE4(char a1)
{
  if ((a1 & 1) != 0) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("other", 5uLL, 1)._countAndFlagsBits;
  }
  else {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bedtime", 7uLL, 1)._countAndFlagsBits;
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_306C()
{
}

uint64_t sub_30AC()
{
  return v2;
}

uint64_t sub_30DC()
{
  uint64_t v0 = sub_30AC();
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

Swift::String *sub_3118()
{
  return sub_3150();
}

Swift::String *sub_3150()
{
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("typeOfTimeOfDay", 0xFuLL, 1);
  uint64_t result = v2;
  v2[1] = v0;
  return result;
}

uint64_t sub_31A0(uint64_t a1, uint64_t a2)
{
  return sub_2E74(a1, a2);
}

uint64_t sub_31C0()
{
  return sub_2AE4();
}

uint64_t sub_31E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + sub_42C8(v0 + 16) = v4;
  uint64_t v5 = (void *)swift_task_alloc(dword_1022C);
  *(void *)(v4 + 24) = v5;
  void *v5 = *(void *)(v4 + 16);
  v5[1] = sub_3270;
  return sub_2BF8(a1, a2, a3, a4);
}

uint64_t sub_3270(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v2 = *(void *)(*v1 + 24);
  *(void *)(v4 + sub_42C8(v0 + 16) = *v1;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8LL))(a1);
}

uint64_t sub_32D8()
{
  return Wrappable.getRoot()();
}

uint64_t sub_32EC(uint64_t a1, void *a2)
{
  string._countAndFlagsBits = a1;
  string._object = a2;
  v2._rawValue = (void *)_allocateUninitializedArray<A>(_:)(2LL);
  *(void *)uint64_t v3 = "bedtime";
  *(void *)(v3 + 8) = 7LL;
  *(_BYTE *)(v3 + sub_42C8(v0 + 16) = 2;
  *(void *)(v3 + 24) = "other";
  *(void *)(v3 + 32) = 5LL;
  *(_BYTE *)(v3 + 40) = 2;
  sub_306C();
  rawValue = v2._rawValue;
  Swift::Int v8 = _findStringSwitchCase(cases:string:)(v2, string);
  swift_bridgeObjectRelease(rawValue);
  if (!v8)
  {
    char v9 = 0;
LABEL_6:
    swift_bridgeObjectRelease(string._object);
    return v9 & 1;
  }

  if (v8 == 1)
  {
    char v9 = 1;
    goto LABEL_6;
  }

  swift_bridgeObjectRelease(string._object);
  return 2;
}

uint64_t sub_3420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_3468();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

unint64_t sub_3468()
{
  uint64_t v2 = qword_10238;
  if (!qword_10238)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)(&unk_B418, &unk_C6C0);
    atomic_store(v0, (unint64_t *)&qword_10238);
    return v0;
  }

  return v2;
}

uint64_t sub_34D4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_3468();
  return RawRepresentable<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_3510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_3468();
  return RawRepresentable<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_3554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_3468();
  return RawRepresentable<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_3598@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_32EC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_35CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2FE4(*v1 & 1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for TimeOfDayResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC39SiriSocialConversationSuggestionsPlugin17TimeOfDayResolver);
}

_BYTE *sub_3624(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_3634(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }

    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }

    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }

  else
  {
    int v5 = -1;
  }

  return (v5 + 1);
}

_BYTE *sub_37E4(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }

    int v7 = v6;
  }

  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }

      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }

  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }

      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }

    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }

  return result;
}

uint64_t sub_3A28(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *sub_3A38(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for TimeOfDay()
{
  return &unk_C6C0;
}

uint64_t type metadata accessor for URLResourceKey(uint64_t a1)
{
  uint64_t v5 = qword_102E0;
  if (!qword_102E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_C6E0);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_102E0);
      return v2;
    }
  }

  return v5;
}

uint64_t sub_3AFC(uint64_t a1)
{
  unint64_t v3 = sub_4180();
  unint64_t v1 = sub_41F0();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_3B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_4180();
  unint64_t v3 = sub_41F0();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_3B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_4180();
  unint64_t v3 = sub_41F0();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_3BC8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_4180();
  unint64_t v2 = sub_41F0();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_3C10(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_4180();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_3C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_4180();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_3C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_4180();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_3CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_3E80();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

NSString sub_3D1C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_3D50(*a1, a1[1]);
  *a2 = result;
  return result;
}

NSString sub_3D50(uint64_t a1, uint64_t a2)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v2 = v5;
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(a2);

  return v5;
}

uint64_t sub_3DA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3DD8(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_3DD8(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

  return v4;
}

uint64_t sub_3E24(uint64_t a1)
{
  unint64_t v3 = sub_4258();
  unint64_t v1 = sub_4180();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for String);
}

unint64_t sub_3E6C()
{
  return sub_3E80();
}

unint64_t sub_3E80()
{
  uint64_t v3 = qword_102E8;
  if (!qword_102E8)
  {
    uint64_t v0 = type metadata accessor for URLResourceKey(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B1EC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_102E8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_3EF0()
{
  return sub_3F04();
}

unint64_t sub_3F04()
{
  uint64_t v3 = qword_102F0;
  if (!qword_102F0)
  {
    uint64_t v0 = type metadata accessor for URLResourceKey(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B1C0, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_102F0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_3F74()
{
  return sub_3F88();
}

unint64_t sub_3F88()
{
  uint64_t v2 = qword_102F8;
  if (!qword_102F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B314, &unk_C6C0);
    atomic_store(WitnessTable, (unint64_t *)&qword_102F8);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_3FF4()
{
  return sub_4008();
}

unint64_t sub_4008()
{
  uint64_t v3 = qword_10300;
  if (!qword_10300)
  {
    uint64_t v0 = type metadata accessor for TimeOfDayResolver();
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B33C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10300);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_4078()
{
  return sub_408C();
}

unint64_t sub_408C()
{
  uint64_t v3 = qword_10308;
  if (!qword_10308)
  {
    uint64_t v0 = type metadata accessor for TimeOfDayResolver();
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B364, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10308);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_40FC()
{
  return sub_4110();
}

unint64_t sub_4110()
{
  uint64_t v3 = qword_10310;
  if (!qword_10310)
  {
    uint64_t v0 = type metadata accessor for URLResourceKey(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B25C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10310);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_4180()
{
  uint64_t v3 = qword_10318;
  if (!qword_10318)
  {
    uint64_t v0 = type metadata accessor for URLResourceKey(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B228, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10318);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_41F0()
{
  uint64_t v2 = qword_10320;
  if (!qword_10320)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(WitnessTable, (unint64_t *)&qword_10320);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_4258()
{
  uint64_t v3 = qword_10328;
  if (!qword_10328)
  {
    uint64_t v0 = type metadata accessor for URLResourceKey(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B3D4, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10328);
    return WitnessTable;
  }

  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_42C8( uint64_t a1)
{
}

void sub_42F0()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_42FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[33] = a3;
  v4[32] = a1;
  v4[27] = v4;
  v4[28] = 0LL;
  v4[29] = 0LL;
  v4[30] = 0LL;
  v4[31] = 0LL;
  v4[17] = 0LL;
  v4[18] = 0LL;
  v4[19] = 0LL;
  v4[20] = 0LL;
  v4[25] = 0LL;
  v4[26] = 0LL;
  uint64_t v5 = type metadata accessor for Objective();
  v4[34] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[35] = v6;
  v4[36] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v4[28] = a1;
  v4[29] = a2;
  v4[30] = a3;
  v4[31] = v3;
  return swift_task_switch(sub_43FC, 0LL);
}

uint64_t sub_43FC()
{
  unint64_t v1 = (void *)v0[32];
  v0[27] = v0;
  uint64_t v26 = v1[3];
  uint64_t v25 = v1[4];
  sub_49CC(v1, v26);
  uint64_t v2 = dispatch thunk of Interaction.executionParameters.getter(v26, v25);
  uint64_t v27 = sub_9B2C(v2);
  uint64_t v28 = v3;
  v0[17] = v27;
  v0[18] = v3;
  swift_bridgeObjectRetain(v3);
  if (v28)
  {
    swift_bridgeObjectRetain(v28);
    swift_bridgeObjectRelease(v28);
    uint64_t v22 = v27;
    uint64_t v23 = v28;
  }

  else
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
  }

  if (v23)
  {
    uint64_t v20 = v22;
    uint64_t v21 = v23;
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
  }

  if (!v21) {
    goto LABEL_16;
  }
  v24[19] = v20;
  v24[20] = v21;
  uint64_t v17 = *sub_4A8C();
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v21);
  v24[23] = v20;
  v24[24] = v21;
  Dictionary.subscript.getter(v24 + 21, v24 + 23, v17, &type metadata for String);
  sub_42C8((uint64_t)(v24 + 23));
  uint64_t v18 = v24[21];
  uint64_t v19 = v24[22];
  if (!v19)
  {
    swift_bridgeObjectRelease(v17);
LABEL_13:
    swift_bridgeObjectRelease(v21);
LABEL_16:
    sub_4A20(&qword_10338);
    uint64_t v7 = _allocateUninitializedArray<A>(_:)(0LL);
    swift_bridgeObjectRelease(v28);
    uint64_t v9 = v7;
    goto LABEL_17;
  }

  uint64_t v14 = v24[36];
  uint64_t v13 = v24[35];
  uint64_t v15 = v24[34];
  uint64_t v10 = (void *)v24[33];
  v24[25] = v18;
  v24[26] = v19;
  swift_bridgeObjectRelease(v17);
  uint64_t v11 = v10[3];
  uint64_t v12 = v10[4];
  sub_49CC(v10, v11);
  sub_4A20((uint64_t *)&unk_10340);
  uint64_t v4 = _allocateUninitializedArray<A>(_:)(0LL);
  uint64_t v16 = Dictionary.init(dictionaryLiteral:)( v4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v14, enum case for Objective.discoverability(_:), v15);
  CandidateSuggestionFactory.create(suggestionId:params:objective:)(v18, v19, v16, v14, v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  swift_bridgeObjectRelease(v16);
  sub_4AE0(v24 + 2, v24 + 12);
  if (!v24[15])
  {
    sub_4B5C(v24 + 12);
    sub_4B5C(v24 + 2);
    swift_bridgeObjectRelease(v19);
    goto LABEL_13;
  }

  sub_4C04(v24 + 12, v24 + 7);
  sub_4A20(&qword_10338);
  uint64_t v8 = _allocateUninitializedArray<A>(_:)(1LL);
  sub_4C3C((uint64_t)(v24 + 7), v5);
  sub_306C();
  sub_4B9C(v24 + 7);
  sub_4B5C(v24 + 2);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v28);
  uint64_t v9 = v8;
LABEL_17:
  swift_task_dealloc(v24[36]);
  return (*(uint64_t (**)(uint64_t))(v24[27] + 8LL))(v9);
}

void *sub_49CC(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80LL);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16LL) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t sub_4A20(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0LL);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }

  return v4;
}

uint64_t *sub_4A8C()
{
  if (qword_101E8 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_101E8, sub_4DA8);
  }
  return &qword_11110;
}

void *sub_4AE0(void *a1, void *a2)
{
  if (a1[3])
  {
    uint64_t v2 = a1[3];
    a2[3] = v2;
    a2[4] = a1[4];
    (**(void (***)(void))(v2 - 8))();
  }

  else
  {
    memcpy(a2, a1, 0x28uLL);
  }

  return a2;
}

void *sub_4B5C(void *a1)
{
  if (a1[3]) {
    sub_4B9C(a1);
  }
  return a1;
}

uint64_t sub_4B9C(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

void *sub_4C04(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t sub_4C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_4C88()
{
  return v0;
}

uint64_t sub_4CAC()
{
  uint64_t v0 = sub_4C88();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_4CE8()
{
  return sub_4C88();
}

uint64_t sub_4D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + sub_42C8(v0 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc(dword_10334);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_3270;
  return sub_42FC(a1, a2, a3);
}

uint64_t sub_4DA8()
{
  uint64_t v3 = _allocateUninitializedArray<A>(_:)(1LL);
  uint64_t v2 = v0;
  *uint64_t v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dalWhoIsSiri", 0xCuLL, 1);
  v2[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suggestHelp", 0xBuLL, 1);
  sub_306C();
  uint64_t result = Dictionary.init(dictionaryLiteral:)( v3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  qword_11110 = result;
  return result;
}

uint64_t type metadata accessor for SocialHintsGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC39SiriSocialConversationSuggestionsPlugin20SocialHintsGenerator);
}

void *type metadata accessor for SocialDialogIdToSuggestionIdMapping()
{
  return &unk_C808;
}

unint64_t sub_4EA8()
{
  return sub_4EBC();
}

unint64_t sub_4EBC()
{
  uint64_t v3 = qword_103F0;
  if (!qword_103F0)
  {
    uint64_t v0 = type metadata accessor for SocialHintsGenerator();
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B4D4, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_103F0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_4F2C()
{
  return sub_4F40();
}

unint64_t sub_4F40()
{
  uint64_t v3 = qword_103F8;
  if (!qword_103F8)
  {
    uint64_t v0 = type metadata accessor for SocialHintsGenerator();
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B4FC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_103F8);
    return WitnessTable;
  }

  return v3;
}

uint64_t *sub_4FB0()
{
  uint64_t v4 = _allocateUninitializedArray<A>(_:)(13LL);
  uint64_t v3 = v0;
  *uint64_t v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("en-US", 5uLL, 1);
  v3[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("en-GB", 5uLL, 1);
  v3[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("en-IN", 5uLL, 1);
  v3[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("en-AU", 5uLL, 1);
  v3[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("en-CA", 5uLL, 1);
  v3[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("es-ES", 5uLL, 1);
  v3[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("es-MX", 5uLL, 1);
  v3[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("es-US", 5uLL, 1);
  v3[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("zh-CN", 5uLL, 1);
  v3[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("zh-HK", 5uLL, 1);
  v3[10] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("de-DE", 5uLL, 1);
  v3[11] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fr-FR", 5uLL, 1);
  v3[12] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ja-JP", 5uLL, 1);
  sub_306C();
  uint64_t v9 = v4;
  uint64_t v5 = sub_4A20(&qword_10420);
  uint64_t v6 = type metadata accessor for Locale(0LL);
  unint64_t v1 = sub_5AF4();
  uint64_t v8 = sub_5308( (void (*)(char *, char *))sub_52B0,  0LL,  v5,  v6,  (uint64_t)&type metadata for Never,  v1,  (uint64_t)&protocol witness table for Never,  v7);
  uint64_t result = &v9;
  sub_5BD8(&v9);
  qword_11118 = v8;
  return result;
}

uint64_t sub_52B0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  swift_bridgeObjectRetain();
  return Locale.init(identifier:)(v2, v3);
}

uint64_t sub_5308( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v33 = a1;
  uint64_t v34 = a2;
  uint64_t v57 = a3;
  uint64_t v48 = a4;
  uint64_t v35 = a5;
  uint64_t v56 = a6;
  uint64_t v38 = a8;
  v39 = "Fatal error";
  v40 = "Index out of bounds";
  v41 = "Swift/Collection.swift";
  v42 = "Range requires lowerBound <= upperBound";
  v43 = "Swift/Range.swift";
  v44 = "Index out of range";
  v68[3] = a3;
  v68[2] = a4;
  v68[1] = a5;
  uint64_t v45 = *(void *)(a5 - 8);
  unint64_t v46 = (*(void *)(v45 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(a1);
  v47 = (char *)v18 - v46;
  uint64_t v49 = 0LL;
  uint64_t v50 = ((uint64_t (*)(void))swift_getAssociatedTypeWitness)();
  uint64_t v51 = *(void *)(v50 - 8);
  unint64_t v52 = (*(void *)(v51 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v49);
  v53 = (char *)v18 - v52;
  unint64_t v54 = (*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v10 = __chkstk_darwin(v8);
  v55 = (char *)v18 - v54;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(v10);
  uint64_t v59 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v60 = (*(void *)(v59 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v11 = __chkstk_darwin(v57);
  v61 = (char *)v18 - v60;
  unint64_t v62 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = __chkstk_darwin(v11);
  v63 = (char *)v18 - v62;
  Swift::Int v64 = dispatch thunk of Collection.count.getter(v13);
  if (v64)
  {
    v68[0] = ContiguousArray.init()(v48);
    uint64_t v32 = type metadata accessor for ContiguousArray(0LL, v48);
    ContiguousArray.reserveCapacity(_:)(v64);
    uint64_t result = dispatch thunk of Collection.startIndex.getter(v57, v56);
    if (v64 >= 0)
    {
      uint64_t v30 = 0LL;
      for (uint64_t i = v37; ; uint64_t i = v21)
      {
        uint64_t v28 = i;
        uint64_t v29 = v30;
        if (v30 == v64) {
          goto LABEL_17;
        }
        if (v29 < 0 || v29 >= v64) {
          goto LABEL_16;
        }
        uint64_t v66 = v29;
        if (v64 < 0) {
          goto LABEL_15;
        }
        if (v29 >= v64) {
          break;
        }
        uint64_t v27 = v29 + 1;
        if (__OFADD__(v29, 1LL))
        {
          __break(1u);
          return result;
        }

        char v67 = 0;
        uint64_t v26 = v27;
LABEL_18:
        uint64_t v25 = v26;
        if ((v67 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v61, v63, AssociatedTypeWitness);
          _expectEnd<A>(of:is:)(v36, v61, v57, v56);
          (*(void (**)(char *, uint64_t))(v59 + 8))(v61, AssociatedTypeWitness);
          uint64_t v22 = v68[0];
          swift_retain();
          swift_release();
          uint64_t v23 = v22;
          uint64_t v24 = v28;
          return v23;
        }

        uint64_t v20 = &v65;
        uint64_t v19 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
        (*(void (**)(char *))(v51 + 16))(v53);
        v19(v20, 0LL);
        uint64_t v16 = v28;
        v33(v53, v47);
        uint64_t v21 = v16;
        if (v16)
        {
          (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
          (*(void (**)(char *, uint64_t))(v59 + 8))(v63, AssociatedTypeWitness);
          sub_9B04(v68);
          (*(void (**)(uint64_t, char *, uint64_t))(v45 + 32))(v38, v47, v35);
          return v18[1];
        }

        (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
        ContiguousArray.append(_:)(v55, v32);
        dispatch thunk of Collection.formIndex(after:)(v63, v57, v56);
        uint64_t result = v21;
        uint64_t v30 = v25;
      }

      LOBYTE(v17) = 2;
      _assertionFailure(_:_:file:line:flags:)(v39, 11LL, 2LL, v40, 19LL, 2LL, v41, 22LL, v17, 714LL, 0);
      __break(1u);
LABEL_15:
      LOBYTE(v17) = 2;
      _assertionFailure(_:_:file:line:flags:)(v39, 11LL, 2LL, v42, 39LL, 2LL, v43, 17LL, v17, 754LL, 0);
      __break(1u);
LABEL_16:
      LOBYTE(v17) = 2;
      _fatalErrorMessage(_:_:file:line:flags:)(v39, 11LL, 2LL, v44, 18LL, 2LL, v43, 17LL, v17, 305LL, 0);
      __break(1u);
LABEL_17:
      uint64_t v66 = 0LL;
      char v67 = 1;
      uint64_t v26 = v29;
      goto LABEL_18;
    }

    _assertionFailure(_:_:file:line:flags:)(v39, 11LL, 2LL, v42, 39LL, 2LL, v43, 17LL, 2, 754LL, 0);
    __break(1u);
  }

  uint64_t v23 = static Array._allocateUninitialized(_:)(0LL, v48);
  uint64_t v24 = v37;
  return v23;
}

unint64_t sub_5AF4()
{
  uint64_t v3 = qword_10428;
  if (!qword_10428)
  {
    uint64_t v0 = sub_5B64(&qword_10420);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10428);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_5B64(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)*a1,  -(*a1 >> 32),  0LL);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }

  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_5BD8( void *a1)
{
}

uint64_t *sub_5C00()
{
  if (qword_101F0 != -1) {
    swift_once(&qword_101F0, sub_4FB0);
  }
  return &qword_11118;
}

uint64_t sub_5C54()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "/System/Library/Assistant/FlowDelegatePlugins/SocialConversationFlowDelegatePlugin.bundle/Templates/",  0x64uLL,  1);
  uint64_t result = v1._countAndFlagsBits;
  xmmword_11120 = (__int128)v1;
  return result;
}

__int128 *sub_5C94()
{
  if (qword_101F8 != -1) {
    swift_once(&qword_101F8, sub_5C54);
  }
  return &xmmword_11120;
}

uint64_t sub_5CE8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  unint64_t v54 = a2;
  uint64_t v55 = a1;
  uint64_t v3 = v2;
  uint64_t v4 = v55;
  uint64_t v56 = v3;
  v91 = 0LL;
  v90 = 0LL;
  v89 = 0LL;
  uint64_t v88 = 0LL;
  uint64_t v87 = 0LL;
  uint64_t v83 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v75 = 0LL;
  uint64_t v76 = 0LL;
  uint64_t v73 = 0LL;
  uint64_t v74 = 0LL;
  uint64_t v57 = type metadata accessor for URL(0LL);
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v66 = *(void *)(v58 + 64);
  unint64_t v59 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v57);
  unint64_t v60 = (char *)&v19 - v59;
  unint64_t v61 = v59;
  uint64_t v5 = __chkstk_darwin((char *)&v19 - v59);
  unint64_t v62 = (char *)&v19 - v61;
  v91 = (char *)&v19 - v61;
  unint64_t v63 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v5);
  Swift::Int v64 = (char *)&v19 - v63;
  v90 = (char *)&v19 - v63;
  unint64_t v65 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v6);
  char v67 = (char *)&v19 - v65;
  unint64_t v68 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin((char *)&v19 - v65);
  v69 = (char *)&v19 - v68;
  v89 = (char *)&v19 - v68;
  uint64_t v88 = v4;
  uint64_t v87 = v7;
  uint64_t v71 = dispatch thunk of CATGlobals.toDictionary.getter();
  Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("locale", 6uLL, 1);
  v70 = &v85;
  Swift::String v85 = v8;
  Dictionary.subscript.getter(v86, &v85, v71, &type metadata for String);
  sub_42C8((uint64_t)v70);
  swift_bridgeObjectRelease(v71);
  if (v86[3])
  {
    if ((swift_dynamicCast(v72, v86, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
    {
      uint64_t v52 = v72[0];
      uint64_t v53 = v72[1];
    }

    else
    {
      uint64_t v52 = 0LL;
      uint64_t v53 = 0LL;
    }

    uint64_t v50 = v52;
    uint64_t v51 = v53;
  }

  else
  {
    uint64_t v20 = 0LL;
    sub_4B5C(v86);
    uint64_t v50 = v20;
    uint64_t v51 = v20;
  }

  uint64_t v48 = v51;
  uint64_t v49 = v50;
  if (!v51) {
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v54, 1LL, 1LL, v57);
  }
  uint64_t v46 = v49;
  uint64_t v47 = v48;
  uint64_t v39 = v48;
  uint64_t v83 = v49;
  uint64_t v84 = v48;
  uint64_t v81 = v49;
  uint64_t v82 = v48;
  Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
  v40 = &v80;
  Swift::String v80 = v9;
  unint64_t v10 = sub_6608();
  uint64_t v41 = StringProtocol.components<A>(separatedBy:)(v40, &type metadata for String, &type metadata for String, v10);
  sub_42C8((uint64_t)v40);
  swift_bridgeObjectRetain(v41);
  v43 = &v77;
  uint64_t v77 = v41;
  uint64_t v42 = sub_4A20(&qword_10420);
  unint64_t v11 = sub_5AF4();
  Collection.first.getter(&v78, v42, v11);
  sub_5BD8(v43);
  uint64_t v44 = v78;
  uint64_t v45 = v79;
  if (!v79)
  {
    swift_bridgeObjectRelease(v41);
    swift_bridgeObjectRelease(v39);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v54, 1LL, 1LL, v57);
  }

  uint64_t v37 = v44;
  uint64_t v38 = v45;
  uint64_t v26 = v45;
  uint64_t v25 = v44;
  uint64_t v75 = v44;
  uint64_t v76 = v45;
  swift_bridgeObjectRelease(v41);
  uint64_t v12 = sub_5C94();
  uint64_t v23 = *(void *)v12;
  uint64_t v24 = *((void *)v12 + 1);
  swift_bridgeObjectRetain(v24);
  URL.init(fileURLWithPath:)(v23, v24);
  swift_bridgeObjectRelease(v24);
  URL.appendingPathComponent(_:)(v25, v26);
  uint64_t v13 = v67;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v58 + 8);
  v29(v67, v57);
  uint64_t v14 = sub_5C94();
  uint64_t v27 = *(void *)v14;
  uint64_t v28 = *((void *)v14 + 1);
  swift_bridgeObjectRetain(v28);
  URL.init(fileURLWithPath:)(v27, v28);
  swift_bridgeObjectRelease(v28);
  id v30 = (id)objc_opt_self(&OBJC_CLASS___CAT);
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v35(v13, v64, v57);
  URL._bridgeToObjectiveC()(v15);
  id v31 = v16;
  v29(v67, v57);
  id v32 = [v30 getDialogAssetsVersion:v31 enableUpdates:1];

  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  uint64_t v34 = v17;
  swift_bridgeObjectRetain(v17);
  uint64_t v73 = v33;
  uint64_t v74 = v34;

  v35(v62, v64, v57);
  int v36 = String.isEmpty.getter(v33, v34);
  swift_bridgeObjectRelease(v34);
  v35(v60, v69, v57);
  if ((v36 & 1) != 0) {
    int v22 = sub_6670((uint64_t)v60);
  }
  else {
    int v22 = 0;
  }
  int v21 = v22;
  v29(v60, v57);
  if ((v21 & 1) != 0)
  {
    v35(v67, v69, v57);
    (*(void (**)(char *, char *, uint64_t))(v58 + 40))(v62, v67, v57);
  }

  v35(v54, v62, v57);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(v54, 0LL, 1LL, v57);
  v29(v62, v57);
  sub_42C8((uint64_t)&v73);
  v29(v64, v57);
  v29(v69, v57);
  swift_bridgeObjectRelease(v26);
  return swift_bridgeObjectRelease(v39);
}

unint64_t sub_6608()
{
  uint64_t v2 = qword_10430;
  if (!qword_10430)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(WitnessTable, (unint64_t *)&qword_10430);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_6670(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v2 = v1;
  uint64_t v3 = v17;
  uint64_t v19 = v2;
  uint64_t v34 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v32 = 0LL;
  char v31 = 0;
  uint64_t v4 = sub_4A20(&qword_10438);
  unint64_t v18 = (*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v4);
  uint64_t v28 = (uint64_t)&v12 - v18;
  uint64_t v20 = 0LL;
  uint64_t v21 = type metadata accessor for URLResourceValues(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v12 - v23;
  uint64_t v34 = (char *)&v12 - v23;
  uint64_t v33 = v3;
  uint64_t v32 = v6;
  uint64_t v26 = type metadata accessor for URLResourceKey(v5);
  uint64_t v25 = _allocateUninitializedArray<A>(_:)(1LL);
  sub_690C((id *)&NSURLIsDirectoryKey, v7);
  uint64_t v8 = v25;
  sub_306C();
  uint64_t v27 = v8;
  unint64_t v9 = sub_4258();
  uint64_t v29 = Set.init(arrayLiteral:)(v27, v26, v9);
  URL.resourceValues(forKeys:)();
  uint64_t v30 = 0LL;
  swift_bridgeObjectRelease(v29);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v28, 0LL, 1LL, v21);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v28, 1LL, v21) == 1)
  {
    sub_6940(v28);
LABEL_6:
    int v14 = 0;
    return v14 & 1;
  }

  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 32))(v24, v28, v21);
  int v16 = URLResourceValues.isDirectory.getter(v10);
  if (v16 == 2)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    goto LABEL_6;
  }

  int v15 = v16;
  int v13 = v16;
  char v31 = v16 & 1;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  int v14 = v13;
  return v14 & 1;
}

void *sub_690C(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_6940(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URLResourceValues(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_69B0(uint64_t a1, uint64_t a2)
{
  v3[25] = v2;
  v3[24] = a2;
  v3[23] = a1;
  v3[19] = v3;
  v3[17] = 0LL;
  v3[18] = 0LL;
  v3[20] = 0LL;
  v3[21] = 0LL;
  v3[17] = a1;
  v3[18] = a2;
  v3[20] = v2;
  return swift_task_switch(sub_6A0C, 0LL);
}

uint64_t sub_6A0C()
{
  uint64_t v4 = (int *)v0[23];
  v0[19] = v0;
  uint64_t v3 = *sub_9D48();
  swift_retain();
  v0[5] = type metadata accessor for DomainOwner(0LL);
  v0[6] = sub_6D60();
  v0[2] = v3;
  uint64_t v6 = (uint64_t (*)(void *))((char *)v4 + *v4);
  uint64_t v1 = (void *)swift_task_alloc(v4[1]);
  *(void *)(v5 + 208) = v1;
  *uint64_t v1 = *(void *)(v5 + 152);
  v1[1] = sub_6AC8;
  return v6(v0 + 2);
}

uint64_t sub_6AC8(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v5 = (void *)(*v1 + 16);
  uint64_t v3 = *(void *)(*v1 + 208);
  *(void *)(v6 + 152) = *v1;
  *(void *)(v6 + 2sub_42C8(v0 + 16) = a1;
  swift_task_dealloc(v3);
  sub_4B9C(v5);
  return swift_task_switch(sub_6B4C, 0LL);
}

uint64_t sub_6B4C()
{
  uint64_t v9 = v0[27];
  uint64_t v10 = v0[25];
  v0[19] = v0;
  v0[21] = v9;
  v0[22] = sub_6DD0();
  swift_retain();
  unint64_t v11 = (void *)swift_task_alloc(48LL);
  v11[2] = v9;
  v11[3] = v10;
  v11[4] = v10;
  uint64_t v12 = sub_4A20(&qword_10450);
  unint64_t v1 = sub_6FD8();
  Sequence.forEach(_:)(sub_6FAC, v11, v12, v1);
  swift_task_dealloc(v11);
  swift_release();
  sub_5BD8(v8 + 22);
  uint64_t v5 = type metadata accessor for SocialHintsGenerator();
  uint64_t v6 = sub_4CE8();
  v8[10] = v5;
  v8[11] = sub_7048();
  v8[7] = v6;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
  sub_4B9C(v8 + 7);
  uint64_t v2 = swift_release();
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()(v2);
  sub_4A20((uint64_t *)&unk_10468);
  uint64_t v7 = _allocateUninitializedArray<A>(_:)(1LL);
  sub_4C3C((uint64_t)(v8 + 12), v3);
  sub_306C();
  sub_4B9C(v8 + 12);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v8[19] + 8LL))(v7);
}

unint64_t sub_6D60()
{
  uint64_t v3 = qword_10448;
  if (!qword_10448)
  {
    uint64_t v0 = type metadata accessor for DomainOwner(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for DomainOwner, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10448);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_6DD0()
{
  uint64_t result = _allocateUninitializedArray<A>(_:)(5LL);
  *unint64_t v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  v1[4] = 4;
  sub_306C();
  return result;
}

uint64_t sub_6E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a1;
  uint64_t v18 = a3;
  uint64_t v16 = a4;
  char v29 = 0;
  uint64_t v28 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v21 = type metadata accessor for DialogDetails(0LL);
  uint64_t v20 = *(void *)(v21 - 8);
  unint64_t v15 = (*(void *)(v20 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v22 = (char *)&v14 - v15;
  int v17 = *(unsigned __int8 *)__chkstk_darwin(v14);
  char v29 = v17;
  uint64_t v28 = a2;
  uint64_t v27 = v5;
  sub_70B8(v17);
  uint64_t v19 = v6;
  uint64_t v23 = v7;
  uint64_t v8 = swift_allocObject(&unk_C9A0, 32LL, 7LL);
  uint64_t v9 = v16;
  uint64_t v10 = v20;
  uint64_t v11 = v8;
  uint64_t v12 = v22;
  *(_BYTE *)(v11 + sub_42C8(v0 + 16) = v17;
  *(void *)(v11 + 24) = v9;
  *(void *)uint64_t v12 = &unk_10558;
  *((void *)v12 + 1) = v11;
  (*(void (**)(void))(v10 + 104))();
  v25[16] = v17;
  uint64_t v26 = v18;
  uint64_t v24 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)( v19,  v23,  v22,  sub_97CC,  v25);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v21);
  swift_bridgeObjectRelease(v23);
  return swift_release();
}

uint64_t sub_6FAC(uint64_t a1)
{
  return sub_6E34(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_6FD8()
{
  uint64_t v3 = qword_10458;
  if (!qword_10458)
  {
    uint64_t v0 = sub_5B64(&qword_10450);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10458);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_7048()
{
  uint64_t v3 = qword_10460;
  if (!qword_10460)
  {
    uint64_t v0 = type metadata accessor for SocialHintsGenerator();
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B52C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10460);
    return WitnessTable;
  }

  return v3;
}

void sub_70B8(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_70F8()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("flipACoin", 9uLL, 1)._countAndFlagsBits;
}

uint64_t sub_71E8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 104) = a4;
  *(_BYTE *)(v4 + 217) = a3;
  *(void *)(v4 + 96) = a2;
  *(void *)(v4 + 88) = a1;
  *(void *)(v4 + 56) = v4;
  *(void *)(v4 + 64) = 0LL;
  *(_BYTE *)(v4 + 2sub_42C8(v0 + 16) = 0;
  *(void *)(v4 + 72) = 0LL;
  *(void *)(v4 + 80) = 0LL;
  uint64_t v5 = type metadata accessor for TemplatingResult(0LL);
  *(void *)(v4 + 112) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v4 + 120) = v6;
  *(void *)(v4 + 128) = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CATOption(0LL);
  *(void *)(v4 + 136) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v4 + 144) = v8;
  *(void *)(v4 + 152) = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_4A20(&qword_10568);
  *(void *)(v4 + 160) = v9;
  uint64_t v14 = *(void *)(*(void *)(v9 - 8) + 64LL);
  *(void *)(v4 + 168) = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 176) = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_4A20(&qword_10570);
  *(void *)(v4 + 184) = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  *(void *)(v4 + 192) = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  *(void *)(v4 + 200) = v12;
  *(void *)(v4 + 208) = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 64) = a2;
  *(_BYTE *)(v4 + 2sub_42C8(v0 + 16) = a3;
  return swift_task_switch(sub_737C, 0LL);
}

uint64_t sub_737C()
{
  unint64_t v1 = *(void **)(v0 + 96);
  *(void *)(v0 + 56) = v0;
  uint64_t v50 = v1[3];
  uint64_t v49 = v1[4];
  sub_49CC(v1, v50);
  uint64_t v51 = (void *)dispatch thunk of DialogProperties.globals.getter(v50, v49);
  if (v51)
  {
    uint64_t v45 = *(void *)(v48 + 200);
    uint64_t v47 = *(void *)(v48 + 192);
    uint64_t v46 = *(char **)(v48 + 184);
    *(void *)(v48 + 72) = v51;
    sub_5CE8((uint64_t)v51, v46);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v46, 1LL, v47) == 1)
    {
      sub_996C(*(void *)(v48 + 184));
      unint64_t v4 = sub_9900();
      swift_allocError(&unk_C980, v4, 0LL, 0LL);
      _BYTE *v5 = 2;
      swift_willThrow();
    }

    else
    {
      uint64_t v36 = *(void *)(v48 + 208);
      v43 = *(uint64_t **)(v48 + 176);
      uint64_t v44 = *(void **)(v48 + 168);
      uint64_t v39 = *(void *)(v48 + 152);
      uint64_t v38 = *(void *)(v48 + 144);
      uint64_t v40 = *(void *)(v48 + 136);
      char v32 = *(_BYTE *)(v48 + 217);
      uint64_t v33 = *(void **)(v48 + 96);
      (*(void (**)(void))(*(void *)(v48 + 200) + 32LL))();
      type metadata accessor for CATExecutor(0LL);
      uint64_t v37 = sub_78F0(v32);
      uint64_t v42 = v6;
      uint64_t v35 = v33[3];
      uint64_t v34 = v33[4];
      sub_49CC(v33, v35);
      uint64_t v41 = dispatch thunk of DialogProperties.getParameters()(v35, v34);
      *(void *)(v48 + sub_42C8(v0 + 16) = 0LL;
      *(void *)(v48 + 24) = 0LL;
      *(void *)(v48 + 32) = 0LL;
      *(void *)(v48 + 40) = 0LL;
      *(void *)(v48 + 48) = 0LL;
      sub_7A0C();
      static CATExecutor.execute(templateDir:catId:parameters:globals:callback:options:)( v36,  v37,  v42,  v41,  v51,  v48 + 16,  v39);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
      sub_4B5C((void *)(v48 + 16));
      swift_bridgeObjectRelease(v41);
      swift_bridgeObjectRelease(v42);
      sub_99DC(v43, v44);
      if (!swift_getEnumCaseMultiPayload(v44))
      {
        uint64_t v26 = *(void *)(v48 + 208);
        uint64_t v24 = *(void *)(v48 + 200);
        uint64_t v25 = *(void *)(v48 + 192);
        uint64_t v27 = *(void *)(v48 + 184);
        uint64_t v28 = *(void **)(v48 + 176);
        uint64_t v29 = *(void *)(v48 + 168);
        uint64_t v30 = *(void *)(v48 + 152);
        uint64_t v31 = *(void *)(v48 + 128);
        uint64_t v22 = *(void *)(v48 + 120);
        uint64_t v23 = *(void *)(v48 + 112);
        uint64_t v21 = *(uint64_t **)(v48 + 88);
        (*(void (**)(void))(v22 + 32))();
        *(void *)(v48 + 80) = v31;
        v21[3] = v23;
        uint64_t v7 = sub_982C(v21);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v22 + 16))(v7, v31, v23);
        (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v31, v23);
        sub_9A8C(v28);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);

        swift_task_dealloc(v26);
        swift_task_dealloc(v27);
        swift_task_dealloc(v28);
        swift_task_dealloc(v29);
        swift_task_dealloc(v30);
        swift_task_dealloc(v31);
        return (*(uint64_t (**)(void))(*(void *)(v48 + 56) + 8LL))();
      }

      uint64_t v20 = *(void *)(v48 + 208);
      uint64_t v18 = *(void *)(v48 + 200);
      uint64_t v19 = *(void *)(v48 + 192);
      int v17 = *(void **)(v48 + 176);
      uint64_t v16 = *(void **)(v48 + 168);
      unint64_t v9 = sub_9900();
      swift_allocError(&unk_C980, v9, 0LL, 0LL);
      *uint64_t v10 = 0;
      swift_willThrow();
      sub_9A8C(v16);
      sub_9A8C(v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
    }
  }

  else
  {
    unint64_t v2 = sub_9900();
    swift_allocError(&unk_C980, v2, 0LL, 0LL);
    *uint64_t v3 = 1;
    swift_willThrow();
  }

  uint64_t v11 = *(void *)(v48 + 184);
  uint64_t v12 = *(void *)(v48 + 176);
  uint64_t v13 = *(void *)(v48 + 168);
  uint64_t v14 = *(void *)(v48 + 152);
  uint64_t v15 = *(void *)(v48 + 128);
  swift_task_dealloc(*(void *)(v48 + 208));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)(void))(*(void *)(v48 + 56) + 8LL))();
}

uint64_t sub_78F0(char a1)
{
  char v15 = a1;
  uint64_t v13 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  uint64_t v14 = v1;
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SocialSuggestions#", 0x12uLL, 1);
  object = v2._object;
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease(object);
  sub_70B8(a1);
  v12[0] = v3;
  v12[1] = v4;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  sub_42C8((uint64_t)v12);
  Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  unint64_t v9 = v5._object;
  DefaultStringInterpolation.appendLiteral(_:)(v5);
  swift_bridgeObjectRelease(v9);
  uint64_t v11 = v13;
  uint64_t v10 = v14;
  swift_bridgeObjectRetain(v14);
  sub_42C8((uint64_t)&v13);
  return String.init(stringInterpolation:)(v11, v10);
}

uint64_t sub_7A0C()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_7A20(void *a1, char a2, uint64_t a3)
{
  uint64_t v78 = a1;
  char v77 = a2;
  uint64_t v76 = a3;
  sub_97D8(a1, v72);
  uint64_t v39 = v73;
  uint64_t v40 = v74;
  uint64_t v41 = v75;
  sub_49CC(v72, v73);
  uint64_t v43 = *sub_7FC8();
  swift_bridgeObjectRetain(v43);
  char v65 = a2;
  sub_4A20(&qword_10490);
  sub_8BB4();
  Dictionary.subscript.getter(&v66, &v65, v43, &unk_C8D0);
  uint64_t v44 = v66;
  swift_bridgeObjectRelease(v43);
  uint64_t v64 = v44;
  if (v44)
  {
    uint64_t v67 = v64;
  }

  else
  {
    type metadata accessor for Signal(0LL);
    uint64_t v67 = _allocateUninitializedArray<A>(_:)(0LL);
    sub_5BD8(&v64);
  }

  uint64_t v16 = v67;
  uint64_t v69 = v39;
  uint64_t v70 = v40;
  uint64_t v71 = v41;
  sub_982C(v68);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)(v16, v39, v40);
  swift_bridgeObjectRelease(v16);
  uint64_t v18 = v69;
  uint64_t v17 = v70;
  uint64_t v19 = v71;
  sub_49CC(v68, v69);
  uint64_t v20 = *sub_5C00();
  swift_bridgeObjectRetain(v20);
  uint64_t v61 = v18;
  uint64_t v62 = v17;
  uint64_t v63 = v19;
  sub_982C(v60);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v20, v18, v19);
  swift_bridgeObjectRelease(v20);
  uint64_t v28 = v61;
  uint64_t v27 = v62;
  uint64_t v29 = v63;
  sub_49CC(v60, v61);
  uint64_t v26 = type metadata accessor for DeviceType(0LL);
  uint64_t v25 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v23 = v3;
  uint64_t v21 = *(void *)(v26 - 8);
  uint64_t v24 = *(void (**)(void))(v21 + 104);
  v24();
  uint64_t v22 = *(void *)(v21 + 72);
  ((void (*)(uint64_t, void, uint64_t))v24)(v23 + v22, enum case for DeviceType.iPad(_:), v26);
  ((void (*)(uint64_t, void, uint64_t))v24)(v23 + 2 * v22, enum case for DeviceType.mac(_:), v26);
  sub_306C();
  uint64_t v57 = v28;
  uint64_t v58 = v27;
  uint64_t v59 = v29;
  sub_982C(v56);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)(v25, v28, v29);
  swift_bridgeObjectRelease(v25);
  uint64_t v31 = v57;
  uint64_t v30 = v58;
  uint64_t v32 = v59;
  sub_49CC(v56, v57);
  sub_70B8(a2);
  uint64_t v33 = v4;
  uint64_t v34 = v5;
  uint64_t v53 = v31;
  uint64_t v54 = v30;
  uint64_t v55 = v32;
  sub_982C(v52);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v33, v34, v31, v32);
  swift_bridgeObjectRelease(v34);
  uint64_t v36 = v53;
  uint64_t v35 = v54;
  uint64_t v37 = v55;
  sub_49CC(v52, v53);
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("exampleUtterance", 0x10uLL, 1);
  v51[3] = v36;
  v51[4] = v35;
  v51[5] = v37;
  sub_982C(v51);
  dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)(v6._countAndFlagsBits, v6._object, v36, v37);
  swift_bridgeObjectRelease(v6._object);
  sub_4B9C(v51);
  sub_4B9C(v52);
  sub_4B9C(v56);
  sub_4B9C(v60);
  sub_4B9C(v68);
  uint64_t result = sub_4B9C(v72);
  if (a2 == 3)
  {
    sub_97D8(a1, v47);
    uint64_t v13 = v48;
    uint64_t v12 = v49;
    uint64_t v14 = v50;
    sub_49CC(v47, v48);
    Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("timeOfDay", 9uLL, 1);
    uint64_t v10 = type metadata accessor for TimeOfDayResolver();
    uint64_t v11 = sub_3118();
    v45[3] = v10;
    v45[4] = sub_9890();
    v45[0] = v11;
    type metadata accessor for ResolvableParameter(0LL);
    Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("typeOfTimeOfDay", 0xFuLL, 1);
    uint64_t v15 = ResolvableParameter.__allocating_init(typeIdentifier:required:)(v9._countAndFlagsBits, v9._object, 1LL);
    v46[3] = v13;
    v46[4] = v12;
    v46[5] = v14;
    sub_982C(v46);
    SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)( v8._countAndFlagsBits,  v8._object,  v45,  v15,  v13,  v14);
    swift_release();
    sub_4B5C(v45);
    swift_bridgeObjectRelease(v8._object);
    sub_4B9C(v46);
    return sub_4B9C(v47);
  }

  return result;
}

uint64_t *sub_7FC8()
{
  if (qword_10218 != -1) {
    swift_once(&qword_10218, sub_8794);
  }
  return &qword_10418;
}

uint64_t sub_801C()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()(v0);
}

uint64_t sub_8034(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + sub_42C8(v0 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc(dword_10444);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_3270;
  return sub_69B0(a1, a2);
}

uint64_t sub_80B0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  v2._rawValue = (void *)_allocateUninitializedArray<A>(_:)(5LL);
  *(void *)uint64_t v3 = "flipACoin";
  *(void *)(v3 + 8) = 9LL;
  *(_BYTE *)(v3 + sub_42C8(v0 + 16) = 2;
  *(void *)(v3 + 24) = "readMeAPoem";
  *(void *)(v3 + 32) = 11LL;
  *(_BYTE *)(v3 + 40) = 2;
  *(void *)(v3 + 48) = "tellMeAJoke";
  *(void *)(v3 + 56) = 11LL;
  *(_BYTE *)(v3 + 64) = 2;
  *(void *)(v3 + 72) = "tellMeAStory";
  *(void *)(v3 + 80) = 12LL;
  *(_BYTE *)(v3 + 88) = 2;
  *(void *)(v3 + 96) = "whatAreYouDoingToday";
  *(void *)(v3 + 104) = 20LL;
  *(_BYTE *)(v3 + 112) = 2;
  sub_306C();
  rawValue = v2._rawValue;
  Swift::Int v8 = _findStringSwitchCase(cases:string:)(v2, v6);
  swift_bridgeObjectRelease(rawValue);
  switch(v8)
  {
    case 0LL:
      unsigned __int8 v9 = 0;
LABEL_12:
      swift_bridgeObjectRelease(v6._object);
      return v9;
    case 1LL:
      unsigned __int8 v9 = 1;
      goto LABEL_12;
    case 2LL:
      unsigned __int8 v9 = 2;
      goto LABEL_12;
    case 3LL:
      unsigned __int8 v9 = 3;
      goto LABEL_12;
    case 4LL:
      unsigned __int8 v9 = 4;
      goto LABEL_12;
  }

  swift_bridgeObjectRelease(v6._object);
  return 5;
}

uint64_t sub_82AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_8ADC();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

uint64_t sub_82F4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_80B0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_8328(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_8358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_6DD0();
  *a1 = result;
  return result;
}

uint64_t sub_8380(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_8ADC();
  return RawRepresentable<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_83BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_8ADC();
  return RawRepresentable<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_8400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_8ADC();
  return RawRepresentable<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_8444()
{
  uint64_t result = static Signal.Fallback.getter();
  qword_10400 = result;
  return result;
}

uint64_t *sub_8474()
{
  if (qword_10200 != -1) {
    swift_once(&qword_10200, sub_8444);
  }
  return &qword_10400;
}

uint64_t sub_84C8()
{
  uint64_t result = static Signal.HomeScreen.getter();
  qword_10408 = result;
  return result;
}

uint64_t *sub_84F8()
{
  if (qword_10208 != -1) {
    swift_once(&qword_10208, sub_84C8);
  }
  return &qword_10408;
}

uint64_t sub_854C()
{
  uint64_t result = static Signal.DeviceLocked.getter();
  qword_10410 = result;
  return result;
}

uint64_t *sub_857C()
{
  if (qword_10210 != -1) {
    swift_once(&qword_10210, sub_854C);
  }
  return &qword_10410;
}

BOOL sub_85D0(char a1, char a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1LL;
    }
    else {
      uint64_t v4 = 2LL;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1LL;
    }
    else {
      uint64_t v3 = 2LL;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v4 == v3;
}

uint64_t sub_86A4(uint64_t a1, char a2)
{
  uint64_t v6 = a1;
  char v5 = a2;
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v4 = 1LL;
    }
    else {
      uint64_t v4 = 2LL;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  uint64_t v3 = v4;
  return Hasher.combine<A>(_:)(&v3, &type metadata for Int, &protocol witness table for Int);
}

uint64_t sub_874C(char a1)
{
  v3[1] = a1;
  v3[0] = a1;
  unint64_t v1 = sub_8B48();
  return _hashValue<A>(for:)(v3, &unk_C980, v1);
}

uint64_t sub_8794()
{
  uint64_t v34 = _allocateUninitializedArray<A>(_:)(5LL);
  uint64_t v33 = v0;
  *uint64_t v0 = 0;
  type metadata accessor for Signal(0LL);
  uint64_t v10 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v11 = v1;
  uint64_t v8 = *sub_8474();
  swift_retain();
  *uint64_t v11 = v8;
  uint64_t v9 = *sub_84F8();
  swift_retain();
  v11[1] = v9;
  uint64_t v12 = *sub_857C();
  swift_retain();
  v11[2] = v12;
  sub_306C();
  *((void *)v33 + 1) = v10;
  v33[16] = 1;
  uint64_t v15 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v16 = v2;
  uint64_t v13 = *sub_8474();
  swift_retain();
  *uint64_t v16 = v13;
  uint64_t v14 = *sub_84F8();
  swift_retain();
  v16[1] = v14;
  uint64_t v17 = *sub_857C();
  swift_retain();
  v16[2] = v17;
  sub_306C();
  *((void *)v33 + 3) = v15;
  v33[32] = 2;
  uint64_t v20 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v21 = v3;
  uint64_t v18 = *sub_8474();
  swift_retain();
  *uint64_t v21 = v18;
  uint64_t v19 = *sub_84F8();
  swift_retain();
  v21[1] = v19;
  uint64_t v22 = *sub_857C();
  swift_retain();
  v21[2] = v22;
  sub_306C();
  *((void *)v33 + 5) = v20;
  v33[48] = 3;
  uint64_t v25 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v26 = v4;
  uint64_t v23 = *sub_8474();
  swift_retain();
  *uint64_t v26 = v23;
  uint64_t v24 = *sub_84F8();
  swift_retain();
  v26[1] = v24;
  uint64_t v27 = *sub_857C();
  swift_retain();
  v26[2] = v27;
  sub_306C();
  *((void *)v33 + 7) = v25;
  v33[64] = 4;
  uint64_t v30 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v31 = v5;
  uint64_t v28 = *sub_8474();
  swift_retain();
  *uint64_t v31 = v28;
  uint64_t v29 = *sub_84F8();
  swift_retain();
  v31[1] = v29;
  uint64_t v32 = *sub_857C();
  swift_retain();
  v31[2] = v32;
  sub_306C();
  *((void *)v33 + 9) = v30;
  sub_306C();
  uint64_t v35 = sub_4A20(&qword_10490);
  unint64_t v6 = sub_8BB4();
  uint64_t result = Dictionary.init(dictionaryLiteral:)(v34, &unk_C8D0, v35, v6);
  qword_10418 = result;
  return result;
}

unint64_t sub_8ADC()
{
  uint64_t v2 = qword_10478;
  if (!qword_10478)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B800, &unk_C8D0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10478);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_8B48()
{
  uint64_t v2 = qword_10480;
  if (!qword_10480)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B7C0, &unk_C980);
    atomic_store(WitnessTable, (unint64_t *)&qword_10480);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_8BB4()
{
  uint64_t v2 = qword_10498;
  if (!qword_10498)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B780, &unk_C8D0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10498);
    return WitnessTable;
  }

  return v2;
}

BOOL sub_8C20(char *a1, char *a2)
{
  return sub_85D0(*a1, *a2);
}

uint64_t sub_8C40()
{
  return sub_874C(*v0);
}

uint64_t sub_8C58(uint64_t a1)
{
  return sub_86A4(a1, *v1);
}

Swift::Int sub_8C70(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t sub_8C84()
{
  return Error._domain.getter();
}

uint64_t sub_8C98()
{
  return Error._code.getter();
}

uint64_t sub_8CAC()
{
  return Error._userInfo.getter();
}

uint64_t sub_8CC0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t type metadata accessor for SocialConversationOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC39SiriSocialConversationSuggestionsPlugin40SocialConversationOwnerDefinitionFactory);
}

uint64_t sub_8CF8(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFB) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 4) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }

    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 251;
    }

    else
    {
LABEL_15:
      int v3 = *a1 - 5;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }

  else
  {
    int v5 = -1;
  }

  return (v5 + 1);
}

_BYTE *sub_8EA8(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFB)
  {
    unsigned int v5 = ((a3 + 4) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }

    int v7 = v6;
  }

  if (a2 > 0xFB)
  {
    unsigned int v4 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }

      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }

  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }

      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }

    if (a2) {
      *uint64_t result = a2 + 4;
    }
  }

  return result;
}

uint64_t sub_90EC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_90F4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for SocialSuggestion()
{
  return &unk_C8D0;
}

void *type metadata accessor for SocialSuggestionSignals()
{
  return &unk_C8F0;
}

uint64_t sub_9124(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }

    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }

    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }

  else
  {
    int v5 = -1;
  }

  return (v5 + 1);
}

_BYTE *sub_92D4(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }

    int v7 = v6;
  }

  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }

      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }

  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }

      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }

      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }

    if (a2) {
      *uint64_t result = a2 + 2;
    }
  }

  return result;
}

void *type metadata accessor for DialogExecutionError()
{
  return &unk_C980;
}

unint64_t sub_952C()
{
  return sub_9540();
}

unint64_t sub_9540()
{
  uint64_t v3 = qword_10538;
  if (!qword_10538)
  {
    uint64_t v0 = sub_5B64(&qword_10450);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10538);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_95B0()
{
  return sub_95C4();
}

unint64_t sub_95C4()
{
  uint64_t v2 = qword_10540;
  if (!qword_10540)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B728, &unk_C8D0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10540);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_9630()
{
  return sub_9644();
}

unint64_t sub_9644()
{
  uint64_t v2 = qword_10548;
  if (!qword_10548)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B6C8, &unk_C980);
    atomic_store(WitnessTable, (unint64_t *)&qword_10548);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_96B0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_96D8(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + sub_42C8(v0 + 16) = v3;
  char v7 = *(_BYTE *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  unsigned int v4 = (void *)swift_task_alloc(dword_10554);
  *(void *)(v3 + 24) = v4;
  *unsigned int v4 = *(void *)(v3 + 16);
  v4[1] = sub_976C;
  return sub_71E8(a1, a2, v7, v8);
}

uint64_t sub_976C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + sub_42C8(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_97CC(void *a1)
{
  return sub_7A20(a1, *(_BYTE *)(v1 + 16), *(void *)(v1 + 24));
}

void *sub_97D8(void *a1, void *a2)
{
  uint64_t v2 = a1[3];
  a2[3] = v2;
  uint64_t v3 = a1[5];
  a2[4] = a1[4];
  a2[5] = v3;
  (**(void (***)(void *))(v2 - 8))(a2);
  return a2;
}

uint64_t *sub_982C(uint64_t *result)
{
  uint64_t v3 = result;
  uint64_t v4 = result[3];
  if ((*(_DWORD *)(*(void *)(v4 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox(v4);
    uint64_t result = v2;
    *uint64_t v3 = v1;
  }

  return result;
}

unint64_t sub_9890()
{
  uint64_t v3 = qword_10560;
  if (!qword_10560)
  {
    uint64_t v0 = type metadata accessor for TimeOfDayResolver();
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B3AC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10560);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_9900()
{
  uint64_t v2 = qword_10578;
  if (!qword_10578)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_B688, &unk_C980);
    atomic_store(WitnessTable, (unint64_t *)&qword_10578);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_996C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

void *sub_99DC(uint64_t *a1, void *a2)
{
  uint64_t v7 = sub_4A20(&qword_10568);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    uint64_t v4 = *a1;
    swift_errorRetain();
    *a2 = v4;
    ((void (*)(void))swift_storeEnumTagMultiPayload)();
  }

  else
  {
    uint64_t v2 = type metadata accessor for TemplatingResult(0LL);
    (*(void (**)(void *, uint64_t *))(*(void *)(v2 - 8) + 16LL))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v7, 0LL);
  }

  return a2;
}

void *sub_9A8C(void *a1)
{
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    swift_errorRelease(*a1);
  }

  else
  {
    uint64_t v1 = type metadata accessor for TemplatingResult(0LL);
    (*(void (**)(void *))(*(void *)(v1 - 8) + 8LL))(a1);
  }

  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_9B04( void *a1)
{
}

uint64_t sub_9B2C(uint64_t a1)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  v16[6] = a1;
  Swift::String v15 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("socialConversationDialogID", 0x1AuLL, 1);
  uint64_t v11 = sub_4A20(&qword_10580);
  Dictionary.subscript.getter(v16, &v15, a1, &type metadata for String);
  sub_42C8((uint64_t)&v15);
  if (v16[3])
  {
    if ((swift_dynamicCast(v12, v16, v11, &type metadata for String, 6LL) & 1) != 0)
    {
      uint64_t v6 = v12[0];
      uint64_t v7 = v12[1];
    }

    else
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
    }

    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }

  else
  {
    sub_4B5C(v16);
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
  }

  if (v9)
  {
    uint64_t v13 = v8;
    uint64_t v14 = v9;
    swift_bridgeObjectRetain(v9);
    uint64_t v4 = sub_9D9C(v8, v9);
    uint64_t v3 = v1;
    swift_bridgeObjectRetain(v1);
    uint64_t v17 = v4;
    uint64_t v18 = v3;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(a1);
    sub_42C8((uint64_t)&v17);
    return v4;
  }

  else
  {
    swift_bridgeObjectRelease(a1);
    return 0LL;
  }

uint64_t *sub_9D48()
{
  if (qword_10220 != -1) {
    swift_once(&qword_10220, sub_9F40);
  }
  return &qword_11130;
}

uint64_t sub_9D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(a2);
  uint64_t v5 = a1;
  uint64_t v6 = a2;
  swift_bridgeObjectRelease(a2);
  sub_42C8((uint64_t)&v5);
  return a1;
}

uint64_t sub_9E1C(uint64_t a1, uint64_t a2)
{
  v10[0] = 0LL;
  v10[1] = a1;
  v10[2] = a2;
  sub_4A20(&qword_10580);
  v10[0] = Dictionary.init()();
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("socialConversationDialogID", 0x1AuLL, 1);
  swift_bridgeObjectRetain(a2);
  v9[3] = &type metadata for String;
  v9[4] = &protocol witness table for String;
  v9[5] = &protocol witness table for String;
  v9[0] = a1;
  v9[1] = a2;
  Swift::String v8 = v2;
  uint64_t v3 = sub_4A20(&qword_10588);
  Dictionary.subscript.setter(v9, &v8, v3);
  uint64_t v7 = v10[0];
  swift_bridgeObjectRetain(v10[0]);
  sub_5BD8(v10);
  return v7;
}

uint64_t sub_9F40()
{
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SocialConversation", 0x12uLL, 1);
  uint64_t result = DomainOwner.__allocating_init(_:)(v0._countAndFlagsBits, v0._object);
  qword_11130 = result;
  return result;
}

void *sub_9F8C(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[1] = v4;
  return result;
}

uint64_t sub_9FC8(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *sub_9FE0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t v2 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRelease(v2);
  return a1;
}

__n128 sub_A028(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *sub_A034(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t sub_A070(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      int v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t sub_A1D0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + sub_42C8(v0 + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + sub_42C8(v0 + 16) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }

  return result;
}

void *type metadata accessor for SocialSuggestionsExecutionParameter()
{
  return &unk_CAD8;
}

void *type metadata accessor for SocialSuggestionsConstants()
{
  return &unk_CB00;
}
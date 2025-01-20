void sub_5104()
{
  uint64_t v0;
  v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  qword_C4A0 = DomainOwner.init(_:)(0xD000000000000014LL, 0x8000000000007B90LL);
  sub_7468();
}

uint64_t sub_5154(uint64_t a1, uint64_t a2)
{
  v3[43] = a2;
  v3[44] = v2;
  v3[42] = a1;
  uint64_t v4 = type metadata accessor for Locale(0LL);
  v3[45] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[46] = v5;
  v3[47] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return sub_7444();
}

uint64_t sub_51B0()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = sub_5BB8(&qword_C138);
  uint64_t inited = swift_initStackObject(v2, v0 + 2);
  *(_OWORD *)(inited + 16) = xmmword_77D0;
  *(void *)(inited + 32) = 0x45442D6564LL;
  *(void *)(inited + 40) = 0xE500000000000000LL;
  *(void *)(inited + 48) = 0x55412D6E65LL;
  *(void *)(inited + 56) = 0xE500000000000000LL;
  *(void *)(inited + 64) = 0x41432D6E65LL;
  *(void *)(inited + 72) = 0xE500000000000000LL;
  *(void *)(inited + 80) = 0x42472D6E65LL;
  *(void *)(inited + 88) = 0xE500000000000000LL;
  *(void *)(inited + 96) = 0x4E492D6E65LL;
  *(void *)(inited + 104) = 0xE500000000000000LL;
  *(void *)(inited + 112) = 0x53552D6E65LL;
  *(void *)(inited + 120) = 0xE500000000000000LL;
  *(void *)(inited + 128) = 0x53452D7365LL;
  *(void *)(inited + 136) = 0xE500000000000000LL;
  *(void *)(inited + 144) = 0x584D2D7365LL;
  *(void *)(inited + 152) = 0xE500000000000000LL;
  *(void *)(inited + 160) = 0x53552D7365LL;
  *(void *)(inited + 168) = 0xE500000000000000LL;
  *(void *)(inited + 176) = 0x52462D7266LL;
  *(void *)(inited + 184) = 0xE500000000000000LL;
  *(void *)(inited + 192) = 0x504A2D616ALL;
  *(void *)(inited + 200) = 0xE500000000000000LL;
  *(void *)(inited + 208) = 0x4E432D687ALL;
  *(void *)(inited + 216) = 0xE500000000000000LL;
  *(void *)(inited + 224) = 0x4B482D687ALL;
  *(void *)(inited + 232) = 0xE500000000000000LL;
  sub_67A0(0LL, 13LL, 0);
  for (uint64_t i = 0LL; i != 208; i += 16LL)
  {
    uint64_t v5 = *(void *)(inited + i + 32);
    uint64_t v6 = *(void *)(inited + i + 40);
    swift_bridgeObjectRetain(v6);
    Locale.init(identifier:)(v5, v6);
    unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v8 >= v7 >> 1) {
      sub_67A0(v7 > 1, v8 + 1, 1);
    }
    v0[48] = &_swiftEmptyArrayStorage;
    uint64_t v9 = v0[47];
    uint64_t v10 = v0[45];
    *((void *)&_swiftEmptyArrayStorage + 2) = v8 + 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))( (char *)&_swiftEmptyArrayStorage + ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
    + *(void *)(v1 + 72) * v8,
      v9,
      v10);
  }

  swift_setDeallocating(inited);
  sub_6770();
  uint64_t v11 = sub_5BB8(&qword_C140);
  uint64_t v12 = *(void *)(type metadata accessor for DeviceType(0LL) - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = swift_allocObject(v11, v15 + 8 * v13, v14 | 7);
  v0[49] = v16;
  *(_OWORD *)(v16 + 16) = xmmword_77E0;
  uint64_t v17 = v16 + v15;
  sub_743C(v16 + v15, enum case for DeviceType.iPhone(_:));
  sub_743C(v17 + v13, enum case for DeviceType.iPad(_:));
  sub_743C(v17 + 2 * v13, enum case for DeviceType.watch(_:));
  sub_743C(v17 + 3 * v13, enum case for DeviceType.pod(_:));
  sub_743C(v17 + 4 * v13, enum case for DeviceType.mac(_:));
  sub_743C(v17 + 5 * v13, enum case for DeviceType.homepod(_:));
  sub_743C(v17 + 6 * v13, enum case for DeviceType.appleTV(_:));
  sub_743C(v17 + 7 * v13, enum case for DeviceType.carPlay(_:));
  if (qword_C1A0 != -1) {
    swift_once(&qword_C1A0, sub_5104);
  }
  v18 = (int *)v0[42];
  uint64_t v19 = qword_C4A0;
  v0[35] = type metadata accessor for DomainOwner(0LL);
  v0[36] = sub_715C( &qword_C148,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
  v0[32] = v19;
  uint64_t v20 = v18[1];
  v23 = (uint64_t (*)(void *))((char *)v18 + *v18);
  swift_retain(v19);
  v21 = (void *)swift_task_alloc(v20);
  v0[50] = v21;
  void *v21 = v0;
  v21[1] = sub_5568;
  return v23(v0 + 32);
}

uint64_t sub_5568(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 256LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 400LL);
  *(void *)(*(void *)v1 + 408LL) = a1;
  swift_task_dealloc(v3);
  sub_6B34(v2);
  return sub_7444();
}

void sub_55C8()
{
  __asm { BR              X8 }
}

_UNKNOWN **sub_5954()
{
  return &off_8380;
}

uint64_t sub_5960(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_599C + 4 * byte_7852[a1]))( 0x77726F4674736146LL,  0xEB00000000647261LL);
}

uint64_t sub_599C()
{
  return 1954047310LL;
}

uint64_t sub_59AC()
{
  return 0x676E6F537478654ELL;
}

uint64_t sub_59C4()
{
  return 0x6573756150LL;
}

uint64_t sub_59D8()
{
  return 0x6968546573756150LL;
}

uint64_t sub_59FC()
{
  return 0x646E69776552LL;
}

uint64_t sub_5A10()
{
  return 1885956947LL;
}

uint64_t sub_5A20()
{
  return 0x7369685470696B53LL;
}

uint64_t sub_5A40()
{
  return 1886352467LL;
}

uint64_t sub_5A50(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (uint64_t v3 = sub_6D44(a1), (v4 & 1) != 0)) {
    return swift_bridgeObjectRetain(*(void *)(*(void *)(a2 + 56) + 8 * v3));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_5A90()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for PlaybackControlsSuggestionsPluginOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC33PlaybackControlsSuggestionsPlugin55PlaybackControlsSuggestionsPluginOwnerDefinitionFactory);
}

uint64_t sub_5AC4(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000012LL;
  }
  else {
    return 0x6C7070612E6D6F63LL;
  }
}

uint64_t sub_5B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_C134);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_5B68;
  return sub_5154(a1, a2);
}

uint64_t sub_5B68(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_5BB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void sub_5BF8(char a1)
{
  __asm { BR              X10 }

uint64_t sub_5C5C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_5D28 + 4 * byte_7864[a2]))(1954047310LL);
}

uint64_t sub_5D28(uint64_t a1)
{
  unint64_t v2 = 0xE400000000000000LL;
  if (a1 == 1954047310 && v1 == 0xE400000000000000LL)
  {
    char v4 = 1;
    unint64_t v2 = v1;
  }

  else
  {
    char v4 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  }

  ((void (*)(unint64_t))swift_bridgeObjectRelease)(v1);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(v2);
  return v4 & 1;
}

Swift::Int sub_5E28(unsigned __int8 a1)
{
  uint64_t v2 = sub_5960(a1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_5E88(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_5ED0(uint64_t a1)
{
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0xE400000000000000LL);
}

Swift::Int sub_5F98(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v3 = sub_5960(a2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_5FF4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_83B0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9) {
    return 9LL;
  }
  else {
    return v3;
  }
}

void sub_603C(char *a1)
{
}

void sub_6048(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = sub_5FF4(*a1);
  sub_7468();
}

void sub_6070(uint64_t *a1@<X8>)
{
  *a1 = sub_5960(*v1);
  a1[1] = v3;
  sub_7468();
}

void sub_6094(void *a1@<X8>)
{
  *a1 = &off_8380;
}

Swift::Int sub_60A4()
{
  return sub_5E28(*v0);
}

void sub_60AC(uint64_t a1)
{
}

Swift::Int sub_60B4(uint64_t a1)
{
  return sub_5F98(a1, *v1);
}

uint64_t sub_60BC(uint64_t a1)
{
  return sub_610C(a1, 0x6C7070612E6D6F63LL, 0xEF636973754D2E65LL, &qword_C438);
}

uint64_t sub_60E8(uint64_t a1)
{
  return sub_610C(a1, 0xD000000000000012LL, 0x8000000000007A20LL, &qword_C448);
}

uint64_t sub_610C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = type metadata accessor for CoreSignalTypes(0LL);
  v10[3] = v7;
  v10[4] = sub_715C( &qword_C178,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  unint64_t v8 = sub_719C(v10);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104LL))( v8,  enum case for CoreSignalTypes.app(_:),  v7);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)(v10, a2, a3, &_swiftEmptyArrayStorage);
  *a4 = result;
  return result;
}

void sub_61C4()
{
  qword_C458 = static Signal.DeviceLocked.getter();
  sub_7468();
}

void sub_61EC()
{
  qword_C468 = static Signal.Fallback.getter();
  sub_7468();
}

void sub_6214()
{
  qword_C478 = static Signal.HomeScreen.getter();
  sub_7468();
}

uint64_t sub_623C()
{
  uint64_t v0 = sub_5BB8(&qword_C160);
  uint64_t v1 = sub_7478(v0, 56LL);
  *(_OWORD *)(v1 + 16) = xmmword_7800;
  if (qword_C450 != -1) {
    swift_once(&qword_C450, sub_61C4);
  }
  uint64_t v2 = qword_C458;
  uint64_t v3 = qword_C460;
  *(void *)(v1 + 32) = qword_C458;
  swift_retain(v2);
  if (v3 != -1) {
    swift_once(&qword_C460, sub_61EC);
  }
  uint64_t v4 = qword_C468;
  uint64_t v5 = qword_C470;
  *(void *)(v1 + 40) = qword_C468;
  swift_retain(v4);
  if (v5 != -1) {
    swift_once(&qword_C470, sub_6214);
  }
  uint64_t v6 = qword_C478;
  *(void *)(v1 + 48) = qword_C478;
  specialized Array._endMutation()();
  qword_C488 = v1;
  return swift_retain(v6);
}

uint64_t sub_6340()
{
  uint64_t v0 = sub_5BB8(&qword_C158);
  uint64_t inited = swift_initStackObject(v0, v31);
  *(_OWORD *)(inited + 16) = xmmword_7810;
  *(_BYTE *)(inited + 32) = 0;
  if (qword_C480 != -1) {
    swift_once(&qword_C480, sub_623C);
  }
  uint64_t v2 = qword_C488;
  if (qword_C430 != -1) {
    swift_once(&qword_C430, sub_60BC);
  }
  uint64_t v3 = qword_C438;
  uint64_t v4 = qword_C440;
  swift_retain(qword_C438);
  if (v4 != -1) {
    swift_once(&qword_C440, sub_60E8);
  }
  uint64_t v5 = qword_C448;
  uint64_t v30 = v2;
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v28 = v2;
    }
    else {
      uint64_t v28 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_74D0();
    sub_7480();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(v2);
    sub_7480();
  }

  if (__OFADD__(v6, 2LL))
  {
    __break(1u);
  }

  else
  {
    sub_74B8(v6 + 2);
    sub_7434();
    swift_retain(v3);
    sub_7470();
    sub_74A4();
    if (!v8) {
      goto LABEL_11;
    }
  }

  sub_7420(v6 + 1, v7);
LABEL_11:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v3);
  sub_7434();
  sub_7480();
  sub_7470();
  sub_74A4();
  if (v8) {
    sub_7420(v6 + 1, v9);
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v5);
  sub_7434();
  sub_74DC();
  swift_release(v5);
  *(void *)(inited + 40) = &v30;
  *(_BYTE *)(inited + 48) = 1;
  uint64_t v10 = sub_5BB8(&qword_C160);
  uint64_t v11 = sub_7478(v10, 40LL);
  *(_OWORD *)(v11 + 16) = xmmword_7820;
  uint64_t v12 = qword_C438;
  *(void *)(v11 + 32) = qword_C438;
  uint64_t v30 = v11;
  sub_7434();
  *(void *)(inited + 56) = v30;
  *(_BYTE *)(inited + 64) = 2;
  uint64_t v13 = qword_C488;
  *(void *)(inited + 72) = qword_C488;
  *(_BYTE *)(inited + 80) = 3;
  uint64_t v14 = sub_7478(v10, 48LL);
  *(_OWORD *)(v14 + 16) = xmmword_7830;
  uint64_t v15 = qword_C448;
  *(void *)(v14 + 32) = v12;
  *(void *)(v14 + 40) = v15;
  uint64_t v30 = v14;
  sub_7434();
  *(void *)(inited + 88) = v30;
  *(_BYTE *)(inited + 96) = 4;
  *(void *)(inited + 104) = v13;
  *(_BYTE *)(inited + 112) = 5;
  uint64_t v30 = v13;
  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0) {
      uint64_t v29 = v13;
    }
    else {
      uint64_t v29 = v13 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v13, 4LL);
    sub_74C4();
    sub_74E8();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v29);
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    uint64_t v16 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFF8LL));
    sub_74C4();
    swift_bridgeObjectRetain_n(v13, 3LL);
    sub_74E8();
  }

  if (__OFADD__(v16, 2LL))
  {
    __break(1u);
  }

  else
  {
    sub_74B8(v16 + 2);
    sub_7434();
    sub_7480();
    sub_7470();
    sub_7490();
    if (!v8) {
      goto LABEL_17;
    }
  }

  sub_7420(v13 + 1, v17);
LABEL_17:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v12);
  sub_7434();
  swift_retain(v15);
  sub_7470();
  sub_7490();
  if (v8) {
    sub_7420(v13 + 1, v18);
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v15);
  sub_7434();
  uint64_t v19 = v30;
  swift_release(v12);
  swift_release(v15);
  *(void *)(inited + 120) = v19;
  *(_BYTE *)(inited + 128) = 6;
  uint64_t v20 = sub_7478(v10, 40LL);
  *(_OWORD *)(v20 + 16) = xmmword_7820;
  uint64_t v21 = qword_C438;
  *(void *)(v20 + 32) = qword_C438;
  uint64_t v30 = v20;
  sub_7434();
  *(void *)(inited + 136) = v30;
  *(_BYTE *)(inited + 144) = 7;
  uint64_t v22 = qword_C488;
  *(void *)(inited + 152) = qword_C488;
  *(_BYTE *)(inited + 160) = 8;
  uint64_t v30 = v22;
  swift_retain_n(v21, 3LL);
  sub_74D0();
  sub_7470();
  unint64_t v24 = *(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v23 = *(void *)((char *)&dword_18 + (v30 & 0xFFFFFFFFFFFFFF8LL));
  if (v24 >= v23 >> 1) {
    sub_7420(v24 + 1, v23);
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v21);
  sub_7434();
  sub_74DC();
  *(void *)(inited + 168) = &v30;
  uint64_t v25 = sub_5BB8(&qword_C168);
  unint64_t v26 = sub_7120();
  uint64_t result = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for PlaybackControlsSuggestion, v25, v26);
  qword_C498 = result;
  return result;
}

uint64_t sub_6770()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

size_t sub_67A0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_6B54(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_67BC(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  sub_6ACC(a1, (uint64_t)v76);
  uint64_t v5 = v77;
  __int128 v54 = v78;
  sub_6B10(v76, v77);
  if (qword_C490 != -1) {
    swift_once(&qword_C490, sub_6340);
  }
  uint64_t v6 = sub_5A50(v2, qword_C498);
  if (v6) {
    unint64_t v7 = (void *)v6;
  }
  else {
    unint64_t v7 = &_swiftEmptyArrayStorage;
  }
  *(void *)v75 = v5;
  *(_OWORD *)&v75[8] = v54;
  sub_719C(v74);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)(v7, v5, v54);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)&v75[16];
  uint64_t v9 = *(void *)v75;
  __n128 v72 = sub_7450(v74, *(uint64_t *)v75, v10, v11, v12, v13, v14, v15, *(__int128 *)v75);
  uint64_t v73 = v8;
  sub_719C(v71);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v4, v9, v8);
  uint64_t v16 = v73;
  unint64_t v17 = v72.n128_u64[0];
  __n128 v69 = sub_7450(v71, v72.n128_i64[0], v18, v19, v20, v21, v22, v23, *(_OWORD *)&v72);
  uint64_t v70 = v16;
  sub_719C(v68);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)(v3, v17, v16);
  uint64_t v24 = v70;
  __int128 v55 = (__int128)v69;
  unint64_t v25 = v69.n128_u64[0];
  sub_6B10(v68, v69.n128_i64[0]);
  uint64_t v26 = sub_5960(v2);
  uint64_t v28 = v27;
  __int128 v66 = v55;
  uint64_t v67 = v24;
  sub_719C(v65);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v26, v28, v25, v24);
  swift_bridgeObjectRelease(v28);
  uint64_t v29 = v67;
  uint64_t v30 = v66;
  __n128 v63 = sub_7450(v65, v66, v31, v32, v33, v34, v35, v36, v66);
  uint64_t v64 = v29;
  sub_719C(v62);
  dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()(v30, v29);
  uint64_t v37 = v64;
  unint64_t v38 = v63.n128_u64[0];
  __n128 v60 = sub_7450(v62, v63.n128_i64[0], v39, v40, v41, v42, v43, v44, *(_OWORD *)&v63);
  uint64_t v61 = v37;
  sub_719C(v59);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)(0xD000000000000051LL, 0x8000000000007B10LL, v38, v37);
  uint64_t v45 = v61;
  unint64_t v46 = v60.n128_u64[0];
  __n128 v57 = sub_7450(v59, v60.n128_i64[0], v47, v48, v49, v50, v51, v52, *(_OWORD *)&v60);
  uint64_t v58 = v45;
  sub_719C(v56);
  dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)( 0xD000000000000010LL,  0x8000000000007B70LL,  v46,  v45);
  sub_6B34(v56);
  sub_6B34(v59);
  sub_6B34(v62);
  sub_6B34(v65);
  sub_6B34(v68);
  sub_6B34(v71);
  sub_6B34(v74);
  return sub_6B34(v76);
}

uint64_t sub_6AB4(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_6ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_6B10(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_6B34(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

size_t sub_6B54(size_t result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_5BB8(&qword_C180);
  uint64_t v11 = *(void *)(type metadata accessor for Locale(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
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
  uint64_t v17 = type metadata accessor for Locale(0LL);
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL);
  uint64_t v19 = (v18 + 32) & ~v18;
  if ((v5 & 1) != 0)
  {
    sub_6CA4(a4 + v19, v8, (unint64_t)v15 + v19);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy((char *)v15 + v19, a4 + v19, v8, v17);
  }

  swift_release(a4);
  return (size_t)v15;
}

uint64_t sub_6CA4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1
    || (uint64_t result = type metadata accessor for Locale(0LL), a1 + *(void *)(*(void *)(result - 8) + 72LL) * a2 <= a3))
  {
    uint64_t v7 = type metadata accessor for Locale(0LL);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }

  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }

  return result;
}

uint64_t sub_6D44(uint64_t a1)
{
  uint64_t v3 = sub_5960(a1);
  uint64_t v5 = v4;
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v5);
  Swift::Int v6 = Hasher._finalize()();
  return sub_6DB8(a1, v6);
}

uint64_t sub_6DB8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 & ~(-1LL << *(_BYTE *)(v2 + 32));
  if (((*(void *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v3) & 1) != 0) {
    __asm { BR              X9 }
  }

  return a2 & ~(-1LL << *(_BYTE *)(v2 + 32));
}

uint64_t sub_7064(uint64_t a1, char a2)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *uint64_t v2 = v5;
  uint64_t v7 = 0LL;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000LL) == 0 && (v5 & 0x4000000000000000LL) == 0)
  {
    uint64_t v7 = 1LL;
  }

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v7,  v9,  a2 & 1,  v5);
  *uint64_t v2 = result;
  return result;
}

unint64_t sub_7120()
{
  unint64_t result = qword_C170;
  if (!qword_C170)
  {
    unint64_t result = swift_getWitnessTable(&unk_79F4, &type metadata for PlaybackControlsSuggestion);
    atomic_store(result, (unint64_t *)&qword_C170);
  }

  return result;
}

uint64_t sub_715C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_719C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

_BYTE *initializeBufferWithCopyOfBuffer for PlaybackControlsSuggestion(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaybackControlsSuggestion(unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PlaybackControlsSuggestion( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_72C0 + 4 * byte_788D[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_72F4 + 4 * byte_7888[v4]))();
}

uint64_t sub_72F4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_72FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x7304LL);
  }
  return result;
}

uint64_t sub_7310(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x7318LL);
  }
  *(_BYTE *)uint64_t result = a2 + 8;
  return result;
}

uint64_t sub_731C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_7324(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_7330(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_733C(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PlaybackControlsSuggestion()
{
  return &type metadata for PlaybackControlsSuggestion;
}

unint64_t sub_7358()
{
  unint64_t result = qword_C188;
  if (!qword_C188)
  {
    uint64_t v1 = sub_739C(&qword_C190);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_C188);
  }

  return result;
}

uint64_t sub_739C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_73E4()
{
  unint64_t result = qword_C198;
  if (!qword_C198)
  {
    unint64_t result = swift_getWitnessTable(&unk_79CC, &type metadata for PlaybackControlsSuggestion);
    atomic_store(result, (unint64_t *)&qword_C198);
  }

  return result;
}

uint64_t sub_7420@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a2 > 1, a1, 1LL);
}

uint64_t sub_7434()
{
  return specialized Array._endMutation()();
}

uint64_t sub_743C(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_7444()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

__n128 sub_7450( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  return (__n128)a9;
}

  ;
}

uint64_t sub_7470()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_7478(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_7480()
{
  return swift_retain(v0);
}

uint64_t sub_7488()
{
  return type metadata accessor for Signal(0LL);
}

  ;
}

  ;
}

uint64_t sub_74B8(uint64_t a1)
{
  return sub_7064(a1, 1);
}

uint64_t sub_74C4()
{
  return swift_retain_n(v0, 3LL);
}

uint64_t sub_74D0()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t sub_74DC()
{
  return swift_release(v0);
}

uint64_t sub_74E8()
{
  return swift_retain_n(v0, 2LL);
}
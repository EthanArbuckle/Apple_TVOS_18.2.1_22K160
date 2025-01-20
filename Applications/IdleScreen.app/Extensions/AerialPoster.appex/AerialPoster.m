id sub_100002754(void *a1)
{
  objc_class *v1;
  id v2;
  v2 = objc_allocWithZone(v1);
  return sub_10000278C(a1);
}

id sub_10000278C(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType(v1);
  v11 = a1;
  id v2 = v1;
  id v12 = v1;
  id v3 = a1;
  *(void *)&v6[OBJC_IVAR____TtC12AerialPoster13PosterUpdater_serviceProxy] = a1;

  v10.receiver = v12;
  v10.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v10, "init");
  id v4 = v9;
  id v12 = v9;

  return v9;
}

uint64_t sub_10000283C()
{
  if (!"AerialPoster.PosterUpdater")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_10000BB04( (uint64_t)"AerialPoster.PosterUpdater",  26LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"AerialPoster/PosterUpdater.swift",  32LL,  2,  v2,  0xBuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_10000296C()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000029E8()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_TITLE", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  xmmword_10001A118 = (__int128)v1;
  return result;
}

__int128 *sub_100002A28()
{
  if (qword_100019AC0 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_100019AC0, sub_1000029E8);
  }
  return &xmmword_10001A118;
}

void sub_100002A7C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("AerialPoster", 0xCuLL, 1);
  v8 = (void *)PRPosterRoleAmbient;
  id v5 = PRPosterRoleAmbient;
  id v15 = sub_100002C60(v4._countAndFlagsBits, (uint64_t)v4._object, v8);
  uint64_t v9 = *((void *)sub_100002A28() + 1);
  swift_bridgeObjectRetain();
  id v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  [v15 setDisplayNameLocalizationKey:v10];

  swift_retain(a4);
  sub_100002CD8();
  uint64_t v12 = _allocateUninitializedArray<A>(_:)(1LL);
  v11 = v6;
  id v7 = v15;
  void *v11 = v15;
  sub_100002D3C();
  a3();
  swift_bridgeObjectRelease(v12);
  swift_release(a4);
}

unint64_t sub_100002BFC()
{
  uint64_t v3 = qword_100019AD8;
  if (!qword_100019AD8)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRMutablePosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019AD8);
    return ObjCClassMetadata;
  }

  return v3;
}

id sub_100002C60(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  id v7 =  [(id)((uint64_t (*)())swift_getObjCClassFromMetadata)() mutableDescriptorWithIdentifier:v5 role:a3];

  swift_bridgeObjectRelease(a2);
  return v7;
}

unint64_t sub_100002CD8()
{
  uint64_t v3 = qword_100019AE0;
  if (!qword_100019AE0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRPosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019AE0);
    return ObjCClassMetadata;
  }

  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100002D3C()
{
}

void sub_100002E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    sub_100002CD8();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    Class v6 = isa;
  }

  else
  {
    Class v6 = 0LL;
  }

  swift_errorRetain(a2);
  if (a2)
  {
    uint64_t v3 = _convertErrorToNSError(_:)(a2);
    swift_errorRelease(a2);
    Swift::String v4 = (void *)v3;
  }

  else
  {
    Swift::String v4 = 0LL;
  }

  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v6);
}

uint64_t sub_100002F80()
{
  return swift_deallocObject(v2, 24LL, 7LL);
}

void sub_100002FBC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100002FC4(void *a1)
{
  id v1 = a1;
  return (*(uint64_t (**)(void *))(v4 + 8))(a1);
}

uint64_t sub_1000030E8(void *a1, void *a2, const void *a3, void *a4)
{
  v4[5] = a4;
  v4[4] = a2;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  uint64_t v9 = (void *)swift_task_alloc(dword_100019AEC);
  *(void *)(v12 + 56) = v9;
  *uint64_t v9 = *(void *)(v12 + 16);
  v9[1] = sub_10000319C;
  return sub_100002FC4(a1);
}

void *sub_10000319C(void *a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 56);
  *(void *)(v3 + 16) = *v2;
  uint64_t v12 = v3 + 16;
  v13 = (void *)(v3 + 16);
  swift_task_dealloc(v4);
  if (v1)
  {
    uint64_t v9 = *(void (***)(void *, void))(v12 + 32);
    id v8 = (id)((uint64_t (*)())_convertErrorToNSError(_:))();
    v9[2](v9, 0LL);

    _Block_release(v9);
    ((void (*)())swift_errorRelease)();
  }

  else
  {
    aBlock = *(void (***)(void))(v12 + 32);
    aBlock[2]();
    _Block_release(aBlock);
  }

  id v6 = *(void **)(v12 + 16);
  id v7 = *(void **)(v12 + 8);

  return (*(void *(**)(void *__return_ptr))(*v13 + 8LL))(v13);
}

uint64_t sub_1000032B8()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000330C()
{
  *(void *)(v1 + 16) = v1;
  id v7 = (void *)v0[2];
  uint64_t v4 = (void *)v0[3];
  id v5 = (const void *)v0[4];
  id v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019AF4);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_1000033C4;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_100019AF0 + dword_100019AF0))( v7,  v4,  v5,  v6);
}

uint64_t sub_1000033C4()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100003424(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  unint64_t v15 = (*(void *)(*(void *)(sub_10000466C(&qword_100019CC8) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  v23 = (char *)&v14 - v15;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56LL))(v23, 1LL);
  uint64_t v18 = 48LL;
  uint64_t v19 = 7LL;
  uint64_t v3 = swift_allocObject(&unk_1000147B0, 48LL, 7LL);
  uint64_t v4 = v16;
  id v5 = (void *)v3;
  uint64_t v6 = v17;
  v22 = v5;
  v5[2] = 0LL;
  v5[3] = 0LL;
  v5[4] = v6;
  v5[5] = v4;
  uint64_t v20 = v5[2];
  uint64_t v21 = v5[3];
  swift_unknownObjectRetain();
  uint64_t v7 = swift_allocObject(&unk_1000147D8, v18, v19);
  uint64_t v8 = v21;
  uint64_t v9 = v22;
  id v10 = (void *)v7;
  uint64_t v11 = (uint64_t)v23;
  v10[2] = v20;
  v10[3] = v8;
  v10[4] = &unk_100019CD8;
  v10[5] = v9;
  uint64_t v12 = sub_100004B5C(v11, (uint64_t)&unk_100019CE8, (uint64_t)v10);
  return swift_release(v12);
}

uint64_t type metadata accessor for PosterUpdater()
{
  return objc_opt_self(&OBJC_CLASS____TtC12AerialPoster13PosterUpdater);
}

uint64_t type metadata accessor for PRRenderingEventType(uint64_t a1)
{
  uint64_t v5 = qword_100019BE8;
  if (!qword_100019BE8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100014740);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100019BE8);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for AutoresizingMask(uint64_t a1)
{
  uint64_t v5 = qword_100019BF0;
  if (!qword_100019BF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100014768);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100019BF0);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for PRRenderingMode(uint64_t a1)
{
  uint64_t v5 = qword_100019BF8;
  if (!qword_100019BF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100014790);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100019BF8);
      return v2;
    }
  }

  return v5;
}

uint64_t sub_100003764(uint64_t a1)
{
  unint64_t v3 = sub_10000444C();
  unint64_t v1 = sub_1000044BC();
  return OptionSet<>.init()(a1, v3, v1);
}

uint64_t sub_1000037A4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000444C();
  return OptionSet<>.contains(_:)(a1, a2, v2) & 1;
}

uint64_t sub_1000037DC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000444C();
  return OptionSet.union(_:)(a1, a2, v2);
}

uint64_t sub_100003818(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000444C();
  return OptionSet.intersection(_:)(a1, a2, v2);
}

uint64_t sub_100003854(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000444C();
  return OptionSet.symmetricDifference(_:)(a1, a2, v2);
}

uint64_t sub_100003890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10000444C();
  return OptionSet<>.insert(_:)(a1, a2, a3, v3) & 1;
}

uint64_t sub_1000038D0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000444C();
  return OptionSet<>.remove(_:)(a1, a2, v2);
}

uint64_t sub_10000390C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000444C();
  return OptionSet<>.update(with:)(a1, a2, v2);
}

uint64_t sub_100003948(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000444C();
  unint64_t v2 = sub_1000044BC();
  return OptionSet<>.formUnion(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003988(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000444C();
  unint64_t v2 = sub_1000044BC();
  return OptionSet<>.formIntersection(_:)(a1, a2, v5, v2);
}

uint64_t sub_1000039C8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000444C();
  unint64_t v2 = sub_1000044BC();
  return OptionSet<>.formSymmetricDifference(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003A08()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t sub_100003A1C()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t sub_100003A34()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t sub_100003A4C()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t sub_100003A64()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t sub_100003A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100003AB4()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t sub_100003AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_1000043DC();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for Int) & 1;
}

uint64_t sub_100003B10(uint64_t a1)
{
  unint64_t v3 = sub_100004524();
  unint64_t v1 = sub_100004594();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_100003B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100004524();
  unint64_t v3 = sub_100004594();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_100003B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100004524();
  unint64_t v3 = sub_100004594();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100003BDC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100004524();
  unint64_t v2 = sub_100004594();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100004098();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

uint64_t sub_100003C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100003F44();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for UInt) & 1;
}

uint64_t sub_100003CB4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100003FC8();
  return SetAlgebra<>.init(arrayLiteral:)(a1, a2, v2);
}

uint64_t sub_100003CF0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *a2 = result;
  return result;
}

void sub_100003D1C(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2 & 1;
}

  ;
}

void sub_100003D78(void *a1@<X8>)
{
  *a1 = v1;
}

  ;
}

NSString sub_100003DC0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_100003DF4(*a1, a1[1]);
  *a2 = result;
  return result;
}

NSString sub_100003DF4(uint64_t a1, uint64_t a2)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v2 = v5;
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(a2);

  return v5;
}

uint64_t sub_100003E4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003E7C(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003E7C(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

  return v4;
}

uint64_t sub_100003EC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100003F04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_2(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_100003F30()
{
  return sub_100003F44();
}

unint64_t sub_100003F44()
{
  uint64_t v3 = qword_100019C00;
  if (!qword_100019C00)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000121C8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C00);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100003FB4()
{
  return sub_100003FC8();
}

unint64_t sub_100003FC8()
{
  uint64_t v3 = qword_100019C08;
  if (!qword_100019C08)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012398, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C08);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000403C(uint64_t a1)
{
  unint64_t v3 = sub_1000045FC();
  unint64_t v1 = sub_100004524();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for String);
}

unint64_t sub_100004084()
{
  return sub_100004098();
}

unint64_t sub_100004098()
{
  uint64_t v3 = qword_100019C10;
  if (!qword_100019C10)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001226C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C10);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004108()
{
  return sub_10000411C();
}

unint64_t sub_10000411C()
{
  uint64_t v3 = qword_100019C18;
  if (!qword_100019C18)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012240, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C18);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000418C()
{
  return sub_1000041A0();
}

unint64_t sub_1000041A0()
{
  uint64_t v3 = qword_100019C20;
  if (!qword_100019C20)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001236C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C20);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100004210(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100004524();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_10000424C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100004524();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_100004290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100004524();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

unint64_t sub_1000042D4()
{
  return sub_1000042E8();
}

unint64_t sub_1000042E8()
{
  uint64_t v3 = qword_100019C28;
  if (!qword_100019C28)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001219C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C28);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004358()
{
  return sub_10000436C();
}

unint64_t sub_10000436C()
{
  uint64_t v3 = qword_100019C30;
  if (!qword_100019C30)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012168, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C30);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000043DC()
{
  uint64_t v3 = qword_100019C38;
  if (!qword_100019C38)
  {
    uint64_t v0 = type metadata accessor for PRRenderingMode(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012120, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C38);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000444C()
{
  uint64_t v3 = qword_100019C40;
  if (!qword_100019C40)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012204, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C40);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000044BC()
{
  uint64_t v2 = qword_100019C48;
  if (!qword_100019C48)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for UInt,  &type metadata for UInt);
    atomic_store(v0, (unint64_t *)&qword_100019C48);
    return v0;
  }

  return v2;
}

unint64_t sub_100004524()
{
  uint64_t v3 = qword_100019C50;
  if (!qword_100019C50)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000122A8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C50);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004594()
{
  uint64_t v2 = qword_100019C58;
  if (!qword_100019C58)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C58);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000045FC()
{
  uint64_t v3 = qword_100019C60;
  if (!qword_100019C60)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000122DC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019C60);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000466C(uint64_t *a1)
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

void sub_1000046D8()
{
  void *v0 = *v0;
}

uint64_t sub_1000046E4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = v3;
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_100004760;
  return v6();
}

uint64_t sub_100004760()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000047C0()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100004804()
{
  *(void *)(v1 + 16) = v1;
  uint64_t v6 = v0[2];
  uint64_t v4 = v0[3];
  NSString v5 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019CD4);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_1000048BC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100019CD0 + dword_100019CD0))(v6, v4, v5);
}

uint64_t sub_1000048BC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000491C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = v4;
  unint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  NSString v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 24) = v5;
  *NSString v5 = *(void *)(v4 + 16);
  v5[1] = sub_100004998;
  return v7();
}

uint64_t sub_100004998()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000049F8()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100004A3C(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  unint64_t v7 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019CE4);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100004AFC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100019CE0 + dword_100019CE0))( a1,  v5,  v6,  v7);
}

uint64_t sub_100004AFC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100004B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 48))(a1, 1LL) == 1)
  {
    sub_100004D7C(a1);
    uint64_t v15 = 0LL;
  }

  else
  {
    unsigned __int8 v14 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a1, v19);
    uint64_t v15 = v14;
  }

  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v13)
  {
    uint64_t ObjectType = swift_getObjectType(v13);
    uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
    uint64_t v9 = v4;
    swift_unknownObjectRelease(v13);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  uint64_t v6 = swift_allocObject(&unk_100014800, 32LL, 7LL);
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  unint64_t v7 = 0LL;
  if (v10 != 0 || v11 != 0)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    v21[2] = v10;
    v21[3] = v11;
    unint64_t v7 = v21;
  }

  return swift_task_create(v15 | 0x1C00, v7, (char *)&type metadata for () + 8, &unk_100019CF8, v6);
}

uint64_t sub_100004D7C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_100004DEC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100004E70;
  return v5(a1);
}

uint64_t sub_100004E70()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100004ED4()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100004F10(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc(dword_100019CF4);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100004FB8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100019CF0 + dword_100019CF0))(a1, v5);
}

uint64_t sub_100004FB8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

char *sub_100005018(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_100005050(a1);
}

char *sub_100005050(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v1);
  v26 = a1;
  id v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  uint64_t v5 = v1;
  uint64_t v6 = v1;
  unint64_t v7 = v1;
  id v27 = v1;
  *(void *)&v1[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_renderer] = 0LL;

  *(void *)&v1[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state] = 0LL;

  uint64_t v16 = (void **)&v1[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_renderer];
  swift_beginAccess();
  uint64_t v8 = *v16;
  *uint64_t v16 = 0LL;

  swift_endAccess(v25);
  uint64_t v17 = &v1[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment];
  swift_beginAccess();
  uint64_t v9 = *(void *)v17;
  *(void *)uint64_t v17 = 0LL;
  swift_unknownObjectRelease(v9);
  swift_endAccess(v24);

  id v10 = a1;
  *(void *)&v18[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_serviceProxy] = a1;

  v23.receiver = v27;
  v23.super_class = ObjectType;
  v22 = (char *)objc_msgSendSuper2(&v23, "init");
  uint64_t v11 = v22;
  uint64_t v12 = v22;
  uint64_t v13 = v22;
  id v27 = v22;
  id v20 = *(id *)&v22[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_serviceProxy];
  id v14 = v20;
  objc_msgSend(v20, "setDelegate:");
  swift_unknownObjectRelease(v22);

  return v22;
}

uint64_t sub_100005274(uint64_t a1)
{
  v2[22] = v1;
  v2[21] = a1;
  v2[15] = v2;
  v2[16] = 0LL;
  v2[17] = 0LL;
  v2[20] = 0LL;
  uint64_t v3 = sub_10000466C(&qword_100019CC8);
  v2[23] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[24] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[25] = v5;
  v2[26] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v2[16] = a1;
  v2[17] = v1;
  return swift_task_switch(sub_100005350, 0LL, 0LL);
}

uint64_t sub_100005350()
{
  uint64_t v1 = v0[26];
  uint64_t v19 = v0[25];
  uint64_t v20 = v0[24];
  v0[15] = v0;
  uint64_t v2 = sub_10000F4A0();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, v2, v20);
  v30 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  v0[18] = 12LL;
  unint64_t v21 = sub_10000C7A4();
  unint64_t v22 = sub_10000C80C();
  unint64_t v4 = sub_10000C874();
  UnsignedInteger<>.init<A>(_:)(v0 + 29, v0 + 18, &type metadata for UInt32, &type metadata for Int, v21, v22, v4);
  uint32_t v23 = *((_DWORD *)v0 + 58);
  uint64_t v25 = swift_allocObject(&unk_1000149C0, 17LL, 7LL);
  *(_BYTE *)(v25 + 16) = 32;
  uint64_t v26 = swift_allocObject(&unk_1000149E8, 17LL, 7LL);
  *(_BYTE *)(v26 + 16) = 8;
  uint64_t v24 = swift_allocObject(&unk_100014A10, 32LL, 7LL);
  *(void *)(v24 + 16) = sub_100005D44;
  *(void *)(v24 + 24) = 0LL;
  uint64_t v28 = swift_allocObject(&unk_100014A38, 32LL, 7LL);
  *(void *)(v28 + 16) = sub_10000DB30;
  *(void *)(v28 + 24) = v24;
  sub_10000466C(&qword_100019EC8);
  uint64_t v27 = _allocateUninitializedArray<A>(_:)(3LL);
  v29 = v5;
  swift_retain(v25);
  void *v29 = sub_10000DABC;
  v29[1] = v25;
  swift_retain(v26);
  v29[2] = sub_10000DAEC;
  v29[3] = v26;
  swift_retain(v28);
  v29[4] = sub_10000DB78;
  v29[5] = v28;
  sub_100002D3C();
  swift_bridgeObjectRelease(v27);
  if (os_log_type_enabled(v30, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v14 = sub_10000466C(&qword_100019EE0);
    uint64_t v16 = sub_10000C8DC(0LL, v14, v14);
    uint64_t v17 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v32 = buf;
    uint64_t v33 = v16;
    uint64_t v34 = v17;
    sub_10000C934(2LL, &v32);
    sub_10000C934(1LL, &v32);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000DABC;
    uint64_t v36 = v25;
    sub_10000C948(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000DAEC;
    uint64_t v36 = v26;
    sub_10000C948(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000DB78;
    uint64_t v36 = v28;
    sub_10000C948(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s", buf, v23);
    sub_10000C98C(v16, 0LL);
    sub_10000C98C(v17, 1LL);
    UnsafeMutablePointer.deallocate()();
    swift_release(v25);
    swift_release(v26);
    swift_release(v28);
  }

  else
  {
    swift_release(v25);
    swift_release(v26);
    swift_release(v28);
  }

  uint64_t v9 = *(void *)(v18 + 208);
  uint64_t v8 = *(void *)(v18 + 200);
  uint64_t v10 = *(void *)(v18 + 192);
  uint64_t v11 = *(void *)(v18 + 176);
  uint64_t v12 = *(void *)(v18 + 168);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  id v13 = *(id *)(v11 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_serviceProxy);
  *(void *)(v18 + 216) = v13;
  id v6 = v13;
  *(void *)(v18 + 16) = *(void *)(v18 + 120);
  *(void *)(v18 + 56) = v18 + 152;
  *(void *)(v18 + 24) = sub_100005928;
  *(void *)(v18 + 112) = swift_continuation_init();
  *(void *)(v18 + 80) = _NSConcreteStackBlock;
  *(_DWORD *)(v18 + 88) = 0x40000000;
  *(_DWORD *)(v18 + 92) = 0;
  *(void *)(v18 + 96) = sub_100005D70;
  *(void *)(v18 + 104) = &unk_100014A50;
  [v13 queryCurrentSnapshotWithIntent:v12 reply:v18 + 80];
  return j__swift_continuation_await(v18 + 16);
}

uint64_t sub_100005928()
{
  uint64_t v1 = (void *)*v0;
  v1[15] = *v0;
  uint64_t v2 = v1[6];
  v1[28] = v2;
  if (v2) {
    return swift_task_switch(sub_100005B7C, 0LL, 0LL);
  }
  else {
    return swift_task_switch(sub_1000059C8, 0LL, 0LL);
  }
}

uint64_t sub_1000059C8()
{
  uint64_t v1 = (void *)v0[27];
  v0[15] = v0;
  uint64_t v10 = v0[19];

  uint64_t v11 = v0[26];
  uint64_t v12 = v0[23];
  id v6 = (id)v0[22];
  v0[20] = v10;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(v12, 1LL);
  uint64_t v8 = swift_allocObject(&unk_100014A78, 24LL, 7LL);
  id v3 = v6;
  swift_unknownObjectWeakInit(v8 + 16, v6);

  swift_retain(v8);
  swift_unknownObjectRetain(v10);
  type metadata accessor for MainActor(0LL);
  uint64_t v7 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject(&unk_100014AA0, 48LL, 7LL);
  v9[2] = v7;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v8;
  v9[5] = v10;
  swift_release(v8);
  uint64_t v4 = sub_100006FF4(v12, (uint64_t)&unk_100019ED8, (uint64_t)v9, (uint64_t)&type metadata for () + 8);
  swift_release(v4);
  swift_unknownObjectRelease(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0[15] + 8LL))();
}

uint64_t sub_100005B7C()
{
  uint64_t v6 = v0[28];
  id v5 = (id)v0[27];
  v0[15] = v0;
  swift_willThrow();

  swift_errorRelease(v6);
  uint64_t v11 = v0[26];
  uint64_t v12 = v0[23];
  id v7 = (id)v0[22];
  v0[20] = 0LL;
  uint64_t v1 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 56LL))(v12, 1LL);
  uint64_t v9 = swift_allocObject(&unk_100014A78, 24LL, 7LL);
  id v2 = v7;
  swift_unknownObjectWeakInit(v9 + 16, v7);

  swift_retain(v9);
  swift_unknownObjectRetain(0LL);
  type metadata accessor for MainActor(0LL);
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject(&unk_100014AA0, 48LL, 7LL);
  v10[2] = v8;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v9;
  v10[5] = 0LL;
  swift_release(v9);
  uint64_t v3 = sub_100006FF4(v12, (uint64_t)&unk_100019ED8, (uint64_t)v10, (uint64_t)&type metadata for () + 8);
  swift_release(v3);
  swift_unknownObjectRelease(0LL);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0[15] + 8LL))();
}

uint64_t sub_100005D44()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updateViewModel(intent:)", 0x18uLL, 1)._countAndFlagsBits;
}

uint64_t sub_100005D70(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  if (a3)
  {
    swift_errorRetain(a3);
    uint64_t v6 = sub_10000466C(&qword_10001A0B8);
    sub_100005E88(v11, (uint64_t)a3, v6);
  }

  else
  {
    swift_unknownObjectRetain(a2);
    if (a2)
    {
      uint64_t v7 = a2;
    }

    else
    {
      _diagnoseUnexpectedNilOptional(_filenameStart:_filenameLength:_filenameIsASCII:_line:_isImplicitUnwrap:)( "",  0LL,  1,  0LL,  1);
      __break(1u);
    }

    uint64_t v12 = v7;
    uint64_t v4 = sub_10000466C(&qword_10001A0B8);
    sub_100005EE0(v11, (uint64_t)&v12, v4);
  }

  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100005E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = a3;
  v7[0] = a2;
  uint64_t v3 = sub_10000466C(&qword_10001A0C0);
  return sub_10000CB30((uint64_t)v7, a1, a3, v3, (uint64_t)&protocol self-conformance witness table for Error);
}

uint64_t sub_100005EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000CAE0(a2, a1, a3);
}

uint64_t sub_100005F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[26] = a5;
  v5[25] = a4;
  v5[17] = v5;
  v5[18] = 0LL;
  v5[19] = 0LL;
  v5[20] = 0LL;
  v5[21] = 0LL;
  v5[22] = 0LL;
  v5[23] = 0LL;
  v5[24] = 0LL;
  v5[18] = a4 + 16;
  v5[19] = a5;
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  v5[27] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_100005FDC, v9, v6);
}

uint64_t sub_100005FDC()
{
  uint64_t v28 = *(void *)(v0 + 200);
  *(void *)(v0 + 136) = v0;
  swift_beginAccess(v28 + 16);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v28 + 16);
  swift_endAccess(v0 + 16);
  if (Strong)
  {
    v27[20] = Strong;
    uint64_t v25 = (id *)&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state]);
    id v26 = *v25;
    id v1 = *v25;
    swift_endAccess(v27 + 5);
    if (v26)
    {
      uint64_t v24 = v27[26];
      v27[23] = v26;
      swift_unknownObjectRetain(v24);
      if (v24)
      {
        uint64_t v22 = v27[26];
        uint64_t v2 = objc_opt_self(&OBJC_CLASS___TVISAerialScreenSaver);
        uint64_t v23 = swift_dynamicCastObjCClass(v22, v2);
        if (v23)
        {
          uint64_t v20 = (void *)v23;
        }

        else
        {
          swift_unknownObjectRelease(v22);
          uint64_t v20 = 0LL;
        }

        unint64_t v21 = v20;
      }

      else
      {
        unint64_t v21 = 0LL;
      }

      if (v21)
      {
        v27[24] = v21;
        AerialScreenSaverViewModel.update(model:)();

LABEL_28:
        goto LABEL_29;
      }
    }

    uint64_t v18 = (id *)&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state]);
    id v19 = *v18;
    id v3 = *v18;
    swift_endAccess(v27 + 8);
    if (v19)
    {
    }

    else
    {
      uint64_t v16 = &Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment];
      swift_beginAccess(&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment]);
      uint64_t v17 = *(void **)v16;
      swift_unknownObjectRetain(*(void *)v16);
      swift_endAccess(v27 + 11);
      if (v17)
      {
        uint64_t v15 = v27[26];
        v27[21] = v17;
        type metadata accessor for AerialScreenSaverViewModel(0LL);
        swift_unknownObjectRetain(v15);
        if (v15)
        {
          uint64_t v13 = v27[26];
          uint64_t v4 = objc_opt_self(&OBJC_CLASS___TVISAerialScreenSaver);
          uint64_t v14 = swift_dynamicCastObjCClass(v13, v4);
          if (v14)
          {
            uint64_t v11 = v14;
          }

          else
          {
            swift_unknownObjectRelease(v13);
            uint64_t v11 = 0LL;
          }

          uint64_t v12 = v11;
        }

        else
        {
          uint64_t v12 = 0LL;
        }

        uint64_t v5 = sub_100006640(v17);
        id v10 = (id)AerialScreenSaverViewModel.__allocating_init(model:playbackStartStyle:renderingContext:onReadyForDisplay:)( v12,  1LL,  1LL,  v5,  sub_10000684C);
        v27[22] = v10;
        id v6 = v10;
        uint64_t v9 = (void **)&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state];
        swift_beginAccess(&Strong[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state]);
        uint64_t v7 = *v9;
        *uint64_t v9 = v10;

        swift_endAccess(v27 + 14);
        sub_100006860();

        swift_unknownObjectRelease(v17);
      }
    }

    goto LABEL_28;
  }

LABEL_29:
  swift_release(v27[27]);
  return (*(uint64_t (**)(void))(v27[17] + 8LL))();
}

uint64_t sub_100006640(void *a1)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = a1;
  swift_getObjectType(a1);
  swift_unknownObjectRetain(a1);
  unsigned __int8 v9 = [a1 isPreview];
  swift_unknownObjectRelease(a1);
  if ((v9 & 1) != 0)
  {
    swift_getObjectType(a1);
    swift_unknownObjectRetain(a1);
    id v6 = [a1 context];
    swift_unknownObjectRelease(a1);
    if (v6)
    {
      id v3 = [v6 mode];

      id v4 = v3;
      char v5 = 0;
    }

    else
    {
      id v4 = 0LL;
      char v5 = 1;
    }

    id v12 = v4;
    char v13 = v5 & 1;
    uint64_t v14 = 1LL;
    char v15 = 0;
    if ((v5 & 1) != 0 || (sub_10000DD14((uint64_t)&v12, (uint64_t)v11), (v15 & 1) != 0))
    {
      char v2 = 0;
    }

    else
    {
      uint64_t v10 = v14;
      type metadata accessor for PRRenderingMode(0LL);
      sub_10000DD30();
      char v2 = dispatch thunk of static Equatable.== infix(_:_:)(v11, &v10);
    }

    if ((v2 & 1) != 0) {
      return 1;
    }
    else {
      return 2;
    }
  }

  else
  {
    return 0;
  }
}

uint64_t sub_10000684C()
{
  return static IdlePosterContentAvailableNotification.notify()();
}

void sub_100006860()
{
  uint64_t v107 = 0LL;
  id v103 = 0LL;
  id v101 = 0LL;
  id v97 = 0LL;
  uint64_t v70 = 0LL;
  uint64_t v75 = type metadata accessor for Logger(0LL);
  uint64_t v74 = *(void *)(v75 - 8);
  unint64_t v72 = (*(void *)(v74 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v75);
  uint64_t v0 = (char *)&v38 - v72;
  v73 = (char *)&v38 - v72;
  uint64_t v107 = v1;
  uint64_t v2 = sub_10000F4A0();
  uint64_t v3 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 16))(v0, v2, v75);
  v90 = (os_log_s *)Logger.logObject.getter(v3);
  int v91 = static os_log_type_t.default.getter();
  v78 = &v105;
  uint64_t v105 = 12LL;
  unint64_t v76 = sub_10000C7A4();
  unint64_t v77 = sub_10000C80C();
  unint64_t v4 = sub_10000C874();
  UnsignedInteger<>.init<A>(_:)(&v106, v78, &type metadata for UInt32, &type metadata for Int, v76, v77, v4);
  uint32_t v79 = v106;
  uint64_t v80 = 17LL;
  uint64_t v82 = 7LL;
  uint64_t v5 = swift_allocObject(&unk_100014AC8, 17LL, 7LL);
  uint64_t v6 = v80;
  uint64_t v7 = v82;
  uint64_t v84 = v5;
  *(_BYTE *)(v5 + 16) = 32;
  uint64_t v8 = swift_allocObject(&unk_100014AF0, v6, v7);
  uint64_t v9 = v82;
  uint64_t v85 = v8;
  *(_BYTE *)(v8 + 16) = 8;
  uint64_t v81 = 32LL;
  uint64_t v10 = swift_allocObject(&unk_100014B18, 32LL, v9);
  uint64_t v11 = v81;
  uint64_t v12 = v82;
  uint64_t v83 = v10;
  *(void *)(v10 + 16) = sub_10000721C;
  *(void *)(v10 + 24) = 0LL;
  uint64_t v13 = swift_allocObject(&unk_100014B40, v11, v12);
  uint64_t v14 = v83;
  uint64_t v87 = v13;
  *(void *)(v13 + 16) = sub_10000DE3C;
  *(void *)(v13 + 24) = v14;
  uint64_t v89 = sub_10000466C(&qword_100019EC8);
  uint64_t v86 = _allocateUninitializedArray<A>(_:)(3LL);
  v88 = v15;
  swift_retain(v84);
  uint64_t v16 = v85;
  uint64_t v17 = v84;
  uint64_t v18 = v88;
  void *v88 = sub_10000DDC8;
  v18[1] = v17;
  swift_retain(v16);
  uint64_t v19 = v87;
  uint64_t v20 = v85;
  unint64_t v21 = v88;
  v88[2] = sub_10000DDF8;
  v21[3] = v20;
  swift_retain(v19);
  uint64_t v22 = v86;
  uint64_t v23 = v87;
  uint64_t v24 = v88;
  v88[4] = sub_10000DE84;
  v24[5] = v23;
  sub_100002D3C();
  swift_bridgeObjectRelease(v22);
  if (os_log_type_enabled(v90, (os_log_type_t)v91))
  {
    uint64_t v25 = v70;
    v63 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v62 = sub_10000466C(&qword_100019EE0);
    uint64_t v64 = sub_10000C8DC(0LL, v62, v62);
    uint64_t v65 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v66 = v96;
    v96[0] = v63;
    v67 = &v95;
    uint64_t v95 = v64;
    v68 = &v94;
    uint64_t v94 = v65;
    sub_10000C934(2LL, v96);
    sub_10000C934(1LL, v66);
    v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000DDC8;
    uint64_t v93 = v84;
    sub_10000C948(&v92, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68);
    uint64_t v69 = v25;
    if (v25)
    {
      __break(1u);
    }

    else
    {
      v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000DDF8;
      uint64_t v93 = v85;
      sub_10000C948(&v92, (uint64_t)v96, (uint64_t)&v95, (uint64_t)&v94);
      uint64_t v61 = 0LL;
      v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000DE84;
      uint64_t v93 = v87;
      sub_10000C948(&v92, (uint64_t)v96, (uint64_t)&v95, (uint64_t)&v94);
      _os_log_impl((void *)&_mh_execute_header, v90, (os_log_type_t)v91, "%s", v63, v79);
      sub_10000C98C(v64, 0LL);
      sub_10000C98C(v65, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v84);
      swift_release(v85);
      swift_release(v87);
    }
  }

  else
  {
    swift_release(v84);
    swift_release(v85);
    swift_release(v87);
  }

  (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v75);
  v58 = (id *)(v71 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_renderer);
  v59 = &v104;
  swift_beginAccess();
  id v60 = *v58;
  id v26 = v60;
  swift_endAccess(v59);
  if (v60)
  {
    id v57 = v60;
    id v53 = v60;
    id v103 = v60;
    v54 = (id *)(v71 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state);
    v55 = &v102;
    swift_beginAccess();
    id v56 = *v54;
    id v27 = v56;
    swift_endAccess(v55);
    if (v56)
    {
      id v52 = v56;
      id v51 = v56;
      id v101 = v56;
      v41 = v99;
      uint64_t v44 = 0LL;
      AerialScreenSaverView.init(delegate:)(v99, 0LL);
      uint64_t v39 = type metadata accessor for AerialScreenSaverViewModel(v44);
      unint64_t v40 = sub_10000DE90();
      unint64_t v28 = sub_10000DEF8();
      v50 = &v100;
      View.environmentObject<A>(_:)(v51, &type metadata for AerialScreenSaverView, v39, v40, v28);
      sub_10000DF68((uint64_t)v41);
      sub_10000466C((uint64_t *)&unk_100019F00);
      v42 = v98;
      sub_10000DFA8((uint64_t)v50, v98);
      id v49 = (id)_UIHostingView.__allocating_init(rootView:)(v42);
      id v97 = v49;
      v47 = &stru_100019000;
      id v43 = [v53 backgroundView];
      [v43 bounds];
      v96[6] = v29;
      v96[7] = v30;
      v96[8] = v31;
      v96[9] = v32;
      v96[2] = v29;
      v96[3] = v30;
      v96[4] = v31;
      v96[5] = v32;
      objc_msgSend(v49, "setFrame:", *(double *)&v29, *(double *)&v30, *(double *)&v31, *(double *)&v32);

      id v33 = v49;
      uint64_t v34 = type metadata accessor for AutoresizingMask(v44);
      uint64_t v45 = 2LL;
      uint64_t v35 = _allocateUninitializedArray<A>(_:)(2LL);
      *uint64_t v36 = v45;
      v36[1] = 16LL;
      sub_100002D3C();
      uint64_t v46 = v35;
      unint64_t v37 = sub_100003FC8();
      SetAlgebra<>.init(arrayLiteral:)(v46, v34, v37);
      [v49 setAutoresizingMask:v96[1]];

      id v48 = [v53 v47[95].name];
      [v48 addSubview:v49];

      sub_10000E058((uint64_t)v50);
    }
  }

uint64_t sub_100006FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    sub_100004D7C(a1);
    uint64_t v16 = 0LL;
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
    uint64_t v16 = v15;
  }

  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v14)
  {
    uint64_t ObjectType = swift_getObjectType(v14);
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v13);
    uint64_t v10 = v5;
    swift_unknownObjectRelease(v14);
    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  uint64_t v7 = (void *)swift_allocObject(&unk_1000150D0, 40LL, 7LL);
  void v7[2] = a4;
  v7[3] = a2;
  v7[4] = a3;
  uint64_t v8 = 0LL;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v23[2] = v11;
    v23[3] = v12;
    uint64_t v8 = v23;
  }

  return swift_task_create(v16 | 0x1C00, v8, a4, &unk_10001A0B0, v7);
}

uint64_t sub_10000721C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updateRenderer()", 0x10uLL, 1)._countAndFlagsBits;
}

uint64_t sub_100007248()
{
  if (!"AerialPoster.PosterPresenter")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_10000BB04( (uint64_t)"AerialPoster.PosterPresenter",  28LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"AerialPoster/PosterPresenter.swift",  34LL,  2,  v2,  0xEuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_100007378()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100007434(void *a1, void *a2)
{
  id v132 = a1;
  id v140 = a2;
  uint64_t v160 = 0LL;
  uint64_t v159 = 0LL;
  uint64_t v158 = 0LL;
  uint64_t v129 = 0LL;
  unint64_t v130 = (*(void *)(*(void *)(sub_10000466C(&qword_100019CC8) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v131 = (uint64_t)&v68 - v130;
  uint64_t v133 = type metadata accessor for Logger(0LL);
  uint64_t v134 = *(void *)(v133 - 8);
  uint64_t v136 = *(void *)(v134 + 64);
  unint64_t v135 = (v136 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v140);
  v137 = (char *)&v68 - v135;
  unint64_t v138 = (v136 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v3);
  v139 = (char *)&v68 - v138;
  uint64_t v160 = v5;
  uint64_t v159 = v4;
  uint64_t v158 = v2;
  swift_getObjectType(v4);
  swift_unknownObjectRetain(v140);
  unsigned int v141 = [v140 isSnapshot];
  swift_unknownObjectRelease(v140);
  if ((v141 & 1) != 0)
  {
    id v43 = v137;
    uint64_t v44 = sub_10000F4A0();
    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v134 + 16))(v43, v44, v133);
    int v91 = (os_log_s *)Logger.logObject.getter(v45);
    int v92 = static os_log_type_t.default.getter();
    uint32_t v79 = &v156;
    uint64_t v156 = 12LL;
    unint64_t v77 = sub_10000C7A4();
    unint64_t v78 = sub_10000C80C();
    unint64_t v46 = sub_10000C874();
    UnsignedInteger<>.init<A>(_:)(&v157, v79, &type metadata for UInt32, &type metadata for Int, v77, v78, v46);
    uint32_t v80 = v157;
    uint64_t v81 = 17LL;
    uint64_t v83 = 7LL;
    uint64_t v47 = swift_allocObject(&unk_100014B68, 17LL, 7LL);
    uint64_t v48 = v81;
    uint64_t v49 = v83;
    uint64_t v85 = v47;
    *(_BYTE *)(v47 + 16) = 32;
    uint64_t v50 = swift_allocObject(&unk_100014B90, v48, v49);
    uint64_t v51 = v83;
    uint64_t v86 = v50;
    *(_BYTE *)(v50 + 16) = 8;
    uint64_t v82 = 32LL;
    uint64_t v52 = swift_allocObject(&unk_100014BB8, 32LL, v51);
    uint64_t v53 = v82;
    uint64_t v54 = v83;
    uint64_t v84 = v52;
    *(void *)(v52 + 16) = sub_1000082AC;
    *(void *)(v52 + 24) = 0LL;
    uint64_t v55 = swift_allocObject(&unk_100014BE0, v53, v54);
    uint64_t v56 = v84;
    uint64_t v88 = v55;
    *(void *)(v55 + 16) = sub_10000E1C4;
    *(void *)(v55 + 24) = v56;
    uint64_t v90 = sub_10000466C(&qword_100019EC8);
    uint64_t v87 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v89 = v57;
    swift_retain(v85);
    uint64_t v58 = v86;
    uint64_t v59 = v85;
    id v60 = v89;
    *uint64_t v89 = sub_10000E150;
    v60[1] = v59;
    swift_retain(v58);
    uint64_t v61 = v88;
    uint64_t v62 = v86;
    v63 = v89;
    v89[2] = sub_10000E180;
    v63[3] = v62;
    swift_retain(v61);
    uint64_t v64 = v87;
    uint64_t v65 = v88;
    v66 = v89;
    v89[4] = sub_10000E20C;
    v66[5] = v65;
    sub_100002D3C();
    swift_bridgeObjectRelease(v64);
    if (os_log_type_enabled(v91, (os_log_type_t)v92))
    {
      uint64_t v67 = v129;
      uint64_t v70 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v69 = sub_10000466C(&qword_100019EE0);
      uint64_t v71 = sub_10000C8DC(0LL, v69, v69);
      uint64_t v72 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v73 = &v155;
      v155 = v70;
      uint64_t v74 = &v154;
      uint64_t v154 = v71;
      uint64_t v75 = &v153;
      uint64_t v153 = v72;
      sub_10000C934(2LL, &v155);
      sub_10000C934(1LL, v73);
      v151 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E150;
      uint64_t v152 = v85;
      sub_10000C948(&v151, (uint64_t)v73, (uint64_t)v74, (uint64_t)v75);
      uint64_t v76 = v67;
      if (v67)
      {
        __break(1u);
      }

      else
      {
        v151 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E180;
        uint64_t v152 = v86;
        sub_10000C948(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
        uint64_t v68 = 0LL;
        v151 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E20C;
        uint64_t v152 = v88;
        sub_10000C948(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
        _os_log_impl((void *)&_mh_execute_header, v91, (os_log_type_t)v92, "%s - skipped", v70, v80);
        sub_10000C98C(v71, 0LL);
        sub_10000C98C(v72, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v85);
        swift_release(v86);
        swift_release(v88);
      }
    }

    else
    {
      swift_release(v85);
      swift_release(v86);
      swift_release(v88);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v134 + 8))(v137, v133);
  }

  else
  {
    uint64_t v6 = v139;
    uint64_t v7 = sub_10000F4A0();
    uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v134 + 16))(v6, v7, v133);
    v126 = (os_log_s *)Logger.logObject.getter(v8);
    int v127 = static os_log_type_t.default.getter();
    v114 = &v149;
    uint64_t v149 = 12LL;
    unint64_t v112 = sub_10000C7A4();
    unint64_t v113 = sub_10000C80C();
    unint64_t v9 = sub_10000C874();
    UnsignedInteger<>.init<A>(_:)(&v150, v114, &type metadata for UInt32, &type metadata for Int, v112, v113, v9);
    uint32_t v115 = v150;
    uint64_t v116 = 17LL;
    uint64_t v118 = 7LL;
    uint64_t v10 = swift_allocObject(&unk_100014C08, 17LL, 7LL);
    uint64_t v11 = v116;
    uint64_t v12 = v118;
    uint64_t v120 = v10;
    *(_BYTE *)(v10 + 16) = 32;
    uint64_t v13 = swift_allocObject(&unk_100014C30, v11, v12);
    uint64_t v14 = v118;
    uint64_t v121 = v13;
    *(_BYTE *)(v13 + 16) = 8;
    uint64_t v117 = 32LL;
    uint64_t v15 = swift_allocObject(&unk_100014C58, 32LL, v14);
    uint64_t v16 = v117;
    uint64_t v17 = v118;
    uint64_t v119 = v15;
    *(void *)(v15 + 16) = sub_1000082D8;
    *(void *)(v15 + 24) = 0LL;
    uint64_t v18 = swift_allocObject(&unk_100014C80, v16, v17);
    uint64_t v19 = v119;
    uint64_t v123 = v18;
    *(void *)(v18 + 16) = sub_10000E2B4;
    *(void *)(v18 + 24) = v19;
    uint64_t v125 = sub_10000466C(&qword_100019EC8);
    uint64_t v122 = _allocateUninitializedArray<A>(_:)(3LL);
    v124 = v20;
    swift_retain(v120);
    uint64_t v21 = v121;
    uint64_t v22 = v120;
    uint64_t v23 = v124;
    void *v124 = sub_10000E240;
    v23[1] = v22;
    swift_retain(v21);
    uint64_t v24 = v123;
    uint64_t v25 = v121;
    id v26 = v124;
    v124[2] = sub_10000E270;
    v26[3] = v25;
    swift_retain(v24);
    uint64_t v27 = v122;
    uint64_t v28 = v123;
    v29 = v124;
    v124[4] = sub_10000E2FC;
    v29[5] = v28;
    sub_100002D3C();
    swift_bridgeObjectRelease(v27);
    if (os_log_type_enabled(v126, (os_log_type_t)v127))
    {
      uint64_t v30 = v129;
      uint64_t v105 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v104 = sub_10000466C(&qword_100019EE0);
      uint64_t v106 = sub_10000C8DC(0LL, v104, v104);
      uint64_t v107 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v108 = &v146;
      v146 = v105;
      v109 = &v145;
      uint64_t v145 = v106;
      v110 = &v144;
      uint64_t v144 = v107;
      sub_10000C934(2LL, &v146);
      sub_10000C934(1LL, v108);
      v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E240;
      uint64_t v143 = v120;
      sub_10000C948(&v142, (uint64_t)v108, (uint64_t)v109, (uint64_t)v110);
      uint64_t v111 = v30;
      if (v30)
      {
        __break(1u);
      }

      else
      {
        v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E270;
        uint64_t v143 = v121;
        sub_10000C948(&v142, (uint64_t)&v146, (uint64_t)&v145, (uint64_t)&v144);
        uint64_t v103 = 0LL;
        v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E2FC;
        uint64_t v143 = v123;
        sub_10000C948(&v142, (uint64_t)&v146, (uint64_t)&v145, (uint64_t)&v144);
        _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v127, "%s", v105, v115);
        sub_10000C98C(v106, 0LL);
        sub_10000C98C(v107, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v120);
        swift_release(v121);
        swift_release(v123);
      }
    }

    else
    {
      swift_release(v120);
      swift_release(v121);
      swift_release(v123);
    }

    (*(void (**)(char *, uint64_t))(v134 + 8))(v139, v133);
    id v31 = v132;
    uint64_t v93 = (void **)&v128[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_renderer];
    uint64_t v94 = &v148;
    uint64_t v95 = 33LL;
    uint64_t v96 = 0LL;
    swift_beginAccess();
    v32 = *v93;
    *uint64_t v93 = v132;

    swift_endAccess(v94);
    swift_unknownObjectRetain(v140);
    id v97 = &v128[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment];
    v98 = &v147;
    swift_beginAccess();
    uint64_t v33 = *(void *)v97;
    *(void *)id v97 = v140;
    swift_unknownObjectRelease(v33);
    swift_endAccess(v98);
    uint64_t v34 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 56LL))(v131, 1LL);
    uint64_t v100 = 7LL;
    uint64_t v101 = swift_allocObject(&unk_100014A78, 24LL, 7LL);
    uint64_t v99 = v101 + 16;
    uint64_t v35 = v128;
    swift_unknownObjectWeakInit(v99, v128);

    swift_retain(v101);
    swift_unknownObjectRetain(v140);
    uint64_t v36 = swift_allocObject(&unk_100014CA8, 48LL, v100);
    id v37 = v140;
    uint64_t v38 = (void *)v36;
    uint64_t v39 = v101;
    char v102 = v38;
    v38[2] = 0LL;
    v38[3] = 0LL;
    v38[4] = v39;
    v38[5] = v37;
    swift_release(v39);
    uint64_t v40 = sub_10000466C((uint64_t *)&unk_100019F20);
    uint64_t v41 = sub_100006FF4(v131, (uint64_t)&unk_100019F18, (uint64_t)v102, v40);
    return swift_release(v41);
  }

uint64_t sub_1000082AC()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didInitializeWith:)", 0x1EuLL, 1)._countAndFlagsBits;
}

uint64_t sub_1000082D8()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didInitializeWith:)", 0x1EuLL, 1)._countAndFlagsBits;
}

uint64_t sub_100008304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a5;
  v5[16] = a4;
  v5[15] = a1;
  v5[11] = v5;
  v5[12] = 0LL;
  v5[13] = 0LL;
  v5[12] = a4 + 16;
  v5[13] = a5;
  return swift_task_switch(sub_100008350, 0LL, 0LL);
}

uint64_t sub_100008350()
{
  uint64_t v12 = v0[16];
  v0[11] = v0;
  swift_beginAccess(v12 + 16);
  v0[14] = swift_unknownObjectWeakLoadStrong(v12 + 16);
  if (v0[14])
  {
    uint64_t v8 = *(void **)(v11 + 136);
    uint64_t v7 = *(void **)(v11 + 112);
    *(void *)(v11 + 144) = v7;
    id v2 = v7;
    sub_10000F21C((id *)(v11 + 112));
    swift_endAccess(v11 + 16);
    swift_getObjectType(v8);
    swift_unknownObjectRetain(v8);
    unsigned __int8 v9 = [v8 isPreview];
    swift_unknownObjectRelease(v8);
    if ((v9 & 1) != 0)
    {
      swift_beginAccess(&TVISAmbientSnapshotQueryIntentSwitcher);
      uint64_t v5 = TVISAmbientSnapshotQueryIntentSwitcher;
      swift_endAccess(v11 + 64);
      uint64_t v6 = v5;
    }

    else
    {
      swift_beginAccess(&TVISAmbientSnapshotQueryIntentFullscreen);
      uint64_t v4 = TVISAmbientSnapshotQueryIntentFullscreen;
      swift_endAccess(v11 + 40);
      uint64_t v6 = v4;
    }

    uint64_t v3 = (void *)swift_task_alloc(dword_100019EA4);
    *(void *)(v11 + 152) = v3;
    *uint64_t v3 = *(void *)(v11 + 88);
    v3[1] = sub_1000085A0;
    return sub_100005274(v6);
  }

  else
  {
    uint64_t v10 = *(_BYTE **)(v11 + 120);
    sub_10000F21C((id *)(v11 + 112));
    swift_endAccess(v11 + 16);
    *uint64_t v10 = 1;
    return (*(uint64_t (**)(void))(*(void *)(v11 + 88) + 8LL))();
  }

uint64_t sub_1000085A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152LL);
  uint64_t v3 = *(void **)(*(void *)v0 + 144LL);
  *(void *)(*(void *)v0 + 88LL) = *(void *)v0;
  swift_task_dealloc(v1);

  return swift_task_switch(sub_10000861C, 0LL, 0LL);
}

uint64_t sub_10000861C()
{
  uint64_t v1 = *(_BYTE **)(v0 + 120);
  *(void *)(v0 + 88) = v0;
  _BYTE *v1 = 0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 8LL))();
}

uint64_t sub_1000086C4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v53 = a1;
  uint64_t v52 = a2;
  uint64_t v50 = a3;
  uint64_t v86 = 0LL;
  uint64_t v85 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v83 = 0LL;
  id v79 = 0LL;
  uint64_t v49 = 0LL;
  uint64_t v57 = type metadata accessor for Logger(0LL);
  uint64_t v56 = *(void *)(v57 - 8);
  unint64_t v54 = (*(void *)(v56 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = (char *)&v34 - v54;
  uint64_t v55 = (char *)&v34 - v54;
  uint64_t v86 = __chkstk_darwin(v53);
  uint64_t v85 = v4;
  uint64_t v84 = v5;
  uint64_t v83 = v6;
  uint64_t v7 = sub_10000F4A0();
  uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 16))(v3, v7, v57);
  uint64_t v72 = (os_log_s *)Logger.logObject.getter(v8);
  int v73 = static os_log_type_t.default.getter();
  id v60 = &v81;
  uint64_t v81 = 12LL;
  unint64_t v58 = sub_10000C7A4();
  unint64_t v59 = sub_10000C80C();
  unint64_t v9 = sub_10000C874();
  UnsignedInteger<>.init<A>(_:)(&v82, v60, &type metadata for UInt32, &type metadata for Int, v58, v59, v9);
  uint32_t v61 = v82;
  uint64_t v62 = 17LL;
  uint64_t v64 = 7LL;
  uint64_t v10 = swift_allocObject(&unk_100014CD0, 17LL, 7LL);
  uint64_t v11 = v62;
  uint64_t v12 = v64;
  uint64_t v66 = v10;
  *(_BYTE *)(v10 + 16) = 32;
  uint64_t v13 = swift_allocObject(&unk_100014CF8, v11, v12);
  uint64_t v14 = v64;
  uint64_t v67 = v13;
  *(_BYTE *)(v13 + 16) = 8;
  uint64_t v63 = 32LL;
  uint64_t v15 = swift_allocObject(&unk_100014D20, 32LL, v14);
  uint64_t v16 = v63;
  uint64_t v17 = v64;
  uint64_t v65 = v15;
  *(void *)(v15 + 16) = sub_100008D6C;
  *(void *)(v15 + 24) = 0LL;
  uint64_t v18 = swift_allocObject(&unk_100014D48, v16, v17);
  uint64_t v19 = v65;
  uint64_t v69 = v18;
  *(void *)(v18 + 16) = sub_10000E4F4;
  *(void *)(v18 + 24) = v19;
  uint64_t v71 = sub_10000466C(&qword_100019EC8);
  uint64_t v68 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v70 = v20;
  swift_retain(v66);
  uint64_t v21 = v67;
  uint64_t v22 = v66;
  uint64_t v23 = v70;
  *uint64_t v70 = sub_10000E480;
  v23[1] = v22;
  swift_retain(v21);
  uint64_t v24 = v69;
  uint64_t v25 = v67;
  id v26 = v70;
  v70[2] = sub_10000E4B0;
  v26[3] = v25;
  swift_retain(v24);
  uint64_t v27 = v68;
  uint64_t v28 = v69;
  v29 = v70;
  v70[4] = sub_10000E53C;
  v29[5] = v28;
  sub_100002D3C();
  swift_bridgeObjectRelease(v27);
  if (os_log_type_enabled(v72, (os_log_type_t)v73))
  {
    uint64_t v30 = v49;
    v42 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v41 = sub_10000466C(&qword_100019EE0);
    uint64_t v43 = sub_10000C8DC(0LL, v41, v41);
    uint64_t v44 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v45 = &v78;
    unint64_t v78 = v42;
    unint64_t v46 = &v77;
    uint64_t v77 = v43;
    uint64_t v47 = &v76;
    uint64_t v76 = v44;
    sub_10000C934(2LL, &v78);
    sub_10000C934(1LL, v45);
    uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E480;
    uint64_t v75 = v66;
    sub_10000C948(&v74, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
    uint64_t v48 = v30;
    if (v30)
    {
      __break(1u);
    }

    else
    {
      uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E4B0;
      uint64_t v75 = v67;
      sub_10000C948(&v74, (uint64_t)&v78, (uint64_t)&v77, (uint64_t)&v76);
      uint64_t v40 = 0LL;
      uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E53C;
      uint64_t v75 = v69;
      sub_10000C948(&v74, (uint64_t)&v78, (uint64_t)&v77, (uint64_t)&v76);
      _os_log_impl((void *)&_mh_execute_header, v72, (os_log_type_t)v73, "%s", v42, v61);
      sub_10000C98C(v43, 0LL);
      sub_10000C98C(v44, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v66);
      swift_release(v67);
      swift_release(v69);
    }
  }

  else
  {
    swift_release(v66);
    swift_release(v67);
    swift_release(v69);
  }

  (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v57);
  id v37 = (id *)(v51 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state);
  uint64_t v38 = &v80;
  swift_beginAccess();
  id v39 = *v37;
  id v31 = v39;
  swift_endAccess(v38);
  if (v39)
  {
    id v36 = v39;
    id v35 = v39;
    id v79 = v39;
    uint64_t v32 = sub_100006640(v52);
    AerialScreenSaverViewModel.onRenderingContextChanged(to:)(v32);
  }

  return sub_100008D98(v51, (uint64_t)v52);
}

uint64_t sub_100008D6C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didUpdate:with:)", 0x1BuLL, 1)._countAndFlagsBits;
}

uint64_t sub_100008D98(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  swift_unknownObjectRetain();
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment);
  swift_beginAccess();
  uint64_t v2 = *v5;
  *uint64_t v5 = a2;
  swift_unknownObjectRelease(v2);
  return swift_endAccess(v7);
}

uint64_t sub_100008EA0(uint64_t a1)
{
  uint64_t v51 = a1;
  uint64_t v83 = 0LL;
  uint64_t v82 = 0LL;
  uint64_t v49 = 0LL;
  uint64_t v55 = type metadata accessor for Logger(0LL);
  uint64_t v54 = *(void *)(v55 - 8);
  unint64_t v52 = (*(void *)(v54 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = (char *)&v31 - v52;
  uint64_t v53 = (char *)&v31 - v52;
  uint64_t v83 = __chkstk_darwin(v51);
  uint64_t v82 = v2;
  uint64_t v3 = sub_10000F4A0();
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 16))(v1, v3, v55);
  uint64_t v70 = (os_log_s *)Logger.logObject.getter(v4);
  int v71 = static os_log_type_t.default.getter();
  unint64_t v58 = &v80;
  uint64_t v80 = 12LL;
  unint64_t v56 = sub_10000C7A4();
  unint64_t v57 = sub_10000C80C();
  unint64_t v5 = sub_10000C874();
  UnsignedInteger<>.init<A>(_:)(&v81, v58, &type metadata for UInt32, &type metadata for Int, v56, v57, v5);
  uint32_t v59 = v81;
  uint64_t v60 = 17LL;
  uint64_t v62 = 7LL;
  uint64_t v6 = swift_allocObject(&unk_100014D70, 17LL, 7LL);
  uint64_t v7 = v60;
  uint64_t v8 = v62;
  uint64_t v64 = v6;
  *(_BYTE *)(v6 + 16) = 32;
  uint64_t v9 = swift_allocObject(&unk_100014D98, v7, v8);
  uint64_t v10 = v62;
  uint64_t v65 = v9;
  *(_BYTE *)(v9 + 16) = 8;
  uint64_t v61 = 32LL;
  uint64_t v11 = swift_allocObject(&unk_100014DC0, 32LL, v10);
  uint64_t v12 = v61;
  uint64_t v13 = v62;
  uint64_t v63 = v11;
  *(void *)(v11 + 16) = sub_100009554;
  *(void *)(v11 + 24) = 0LL;
  uint64_t v14 = swift_allocObject(&unk_100014DE8, v12, v13);
  uint64_t v15 = v63;
  uint64_t v67 = v14;
  *(void *)(v14 + 16) = sub_10000E5E4;
  *(void *)(v14 + 24) = v15;
  uint64_t v69 = sub_10000466C(&qword_100019EC8);
  uint64_t v66 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v68 = v16;
  swift_retain(v64);
  uint64_t v17 = v65;
  uint64_t v18 = v64;
  uint64_t v19 = v68;
  void *v68 = sub_10000E570;
  v19[1] = v18;
  swift_retain(v17);
  uint64_t v20 = v67;
  uint64_t v21 = v65;
  uint64_t v22 = v68;
  v68[2] = sub_10000E5A0;
  v22[3] = v21;
  swift_retain(v20);
  uint64_t v23 = v66;
  uint64_t v24 = v67;
  uint64_t v25 = v68;
  v68[4] = sub_10000E62C;
  v25[5] = v24;
  sub_100002D3C();
  swift_bridgeObjectRelease(v23);
  if (os_log_type_enabled(v70, (os_log_type_t)v71))
  {
    uint64_t v26 = v49;
    v42 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v41 = sub_10000466C(&qword_100019EE0);
    uint64_t v43 = sub_10000C8DC(0LL, v41, v41);
    uint64_t v44 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v45 = &v76;
    uint64_t v76 = v42;
    unint64_t v46 = &v75;
    uint64_t v75 = v43;
    uint64_t v47 = &v74;
    uint64_t v74 = v44;
    sub_10000C934(2LL, &v76);
    sub_10000C934(1LL, v45);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E570;
    uint64_t v73 = v64;
    sub_10000C948(&v72, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
    uint64_t v48 = v26;
    if (v26)
    {
      __break(1u);
    }

    else
    {
      uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E5A0;
      uint64_t v73 = v65;
      sub_10000C948(&v72, (uint64_t)&v76, (uint64_t)&v75, (uint64_t)&v74);
      uint64_t v40 = 0LL;
      uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E62C;
      uint64_t v73 = v67;
      sub_10000C948(&v72, (uint64_t)&v76, (uint64_t)&v75, (uint64_t)&v74);
      _os_log_impl((void *)&_mh_execute_header, v70, (os_log_type_t)v71, "%s", v42, v59);
      sub_10000C98C(v43, 0LL);
      sub_10000C98C(v44, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v64);
      swift_release(v65);
      swift_release(v67);
    }
  }

  else
  {
    swift_release(v64);
    swift_release(v65);
    swift_release(v67);
  }

  (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v55);
  uint64_t v32 = (void **)(v50 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_renderer);
  uint64_t v33 = &v79;
  uint64_t v36 = 33LL;
  uint64_t v37 = 0LL;
  swift_beginAccess();
  uint64_t v27 = *v32;
  void *v32 = 0LL;

  swift_endAccess(v33);
  uint64_t v34 = (uint64_t *)(v50 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_environment);
  id v35 = &v78;
  swift_beginAccess();
  uint64_t v28 = *v34;
  *uint64_t v34 = 0LL;
  swift_unknownObjectRelease(v28);
  swift_endAccess(v35);
  uint64_t v38 = (void **)(v50 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state);
  id v39 = &v77;
  swift_beginAccess();
  v29 = *v38;
  *uint64_t v38 = 0LL;

  return swift_endAccess(v39);
}

uint64_t sub_100009554()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rendererDidInvalidate(_:)", 0x19uLL, 1)._countAndFlagsBits;
}

void sub_1000095D4(uint64_t a1, void *a2)
{
  uint64_t v79 = a1;
  id v78 = a2;
  uint64_t v104 = 0LL;
  uint64_t v103 = 0LL;
  uint64_t v102 = 0LL;
  id v100 = 0LL;
  uint64_t v77 = 0LL;
  uint64_t v76 = 0LL;
  uint64_t v80 = type metadata accessor for Logger(0LL);
  uint64_t v81 = *(void *)(v80 - 8);
  unint64_t v82 = (*(void *)(v81 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v83 = (char *)&v36 - v82;
  uint64_t v104 = __chkstk_darwin(v79);
  uint64_t v103 = v3;
  uint64_t v102 = v2;
  uint64_t v84 = (id *)(v2 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state);
  uint64_t v85 = &v101;
  swift_beginAccess();
  id v86 = *v84;
  id v4 = v86;
  swift_endAccess(v85);
  if (v86)
  {
    id v75 = v86;
    unint64_t v5 = v83;
    id v58 = v86;
    id v100 = v86;
    uint64_t v6 = sub_10000F4A0();
    uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v81 + 16))(v5, v6, v80);
    uint64_t v73 = (os_log_s *)Logger.logObject.getter(v7);
    int v74 = static os_log_type_t.default.getter();
    uint64_t v61 = &v98;
    uint64_t v98 = 12LL;
    unint64_t v59 = sub_10000C7A4();
    unint64_t v60 = sub_10000C80C();
    unint64_t v8 = sub_10000C874();
    UnsignedInteger<>.init<A>(_:)(&v99, v61, &type metadata for UInt32, &type metadata for Int, v59, v60, v8);
    uint32_t v62 = v99;
    uint64_t v63 = 17LL;
    uint64_t v65 = 7LL;
    uint64_t v9 = swift_allocObject(&unk_100014E10, 17LL, 7LL);
    uint64_t v10 = v63;
    uint64_t v11 = v65;
    uint64_t v67 = v9;
    *(_BYTE *)(v9 + 16) = 32;
    uint64_t v12 = swift_allocObject(&unk_100014E38, v10, v11);
    uint64_t v13 = v65;
    uint64_t v68 = v12;
    *(_BYTE *)(v12 + 16) = 8;
    uint64_t v64 = 32LL;
    uint64_t v14 = swift_allocObject(&unk_100014E60, 32LL, v13);
    uint64_t v15 = v64;
    uint64_t v16 = v65;
    uint64_t v66 = v14;
    *(void *)(v14 + 16) = sub_100009F18;
    *(void *)(v14 + 24) = 0LL;
    uint64_t v17 = swift_allocObject(&unk_100014E88, v15, v16);
    uint64_t v18 = v66;
    uint64_t v70 = v17;
    *(void *)(v17 + 16) = sub_10000E6D4;
    *(void *)(v17 + 24) = v18;
    uint64_t v72 = sub_10000466C(&qword_100019EC8);
    uint64_t v69 = _allocateUninitializedArray<A>(_:)(3LL);
    int v71 = v19;
    swift_retain(v67);
    uint64_t v20 = v68;
    uint64_t v21 = v67;
    uint64_t v22 = v71;
    *int v71 = sub_10000E660;
    v22[1] = v21;
    swift_retain(v20);
    uint64_t v23 = v70;
    uint64_t v24 = v68;
    uint64_t v25 = v71;
    v71[2] = sub_10000E690;
    v25[3] = v24;
    swift_retain(v23);
    uint64_t v26 = v69;
    uint64_t v27 = v70;
    uint64_t v28 = v71;
    v71[4] = sub_10000E71C;
    v28[5] = v27;
    sub_100002D3C();
    swift_bridgeObjectRelease(v26);
    if (os_log_type_enabled(v73, (os_log_type_t)v74))
    {
      uint64_t v29 = v76;
      uint64_t v51 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v50 = sub_10000466C(&qword_100019EE0);
      uint64_t v52 = sub_10000C8DC(0LL, v50, v50);
      uint64_t v53 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v54 = &v91;
      int v91 = v51;
      uint64_t v55 = &v90;
      uint64_t v90 = v52;
      unint64_t v56 = &v89;
      uint64_t v89 = v53;
      sub_10000C934(2LL, &v91);
      sub_10000C934(1LL, v54);
      uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E660;
      uint64_t v88 = v67;
      sub_10000C948(&v87, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56);
      uint64_t v57 = v29;
      if (v29)
      {
        __break(1u);
      }

      else
      {
        uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E690;
        uint64_t v88 = v68;
        sub_10000C948(&v87, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v89);
        uint64_t v49 = 0LL;
        uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E71C;
        uint64_t v88 = v70;
        sub_10000C948(&v87, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v89);
        _os_log_impl((void *)&_mh_execute_header, v73, (os_log_type_t)v74, "%s", v51, v62);
        sub_10000C98C(v52, 0LL);
        sub_10000C98C(v53, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v67);
        swift_release(v68);
        swift_release(v70);
      }
    }

    else
    {
      swift_release(v67);
      swift_release(v68);
      swift_release(v70);
    }

    (*(void (**)(char *, uint64_t))(v81 + 8))(v83, v80);
    id v43 = [v78 type];
    id v30 = v43;
    uint64_t v42 = PRRenderingEventTypeSwipeLeft;
    id v31 = PRRenderingEventTypeSwipeLeft;
    uint64_t v47 = (id *)&v97;
    uint64_t v97 = v42;
    uint64_t v44 = &v96;
    id v96 = v43;
    uint64_t v45 = type metadata accessor for PRRenderingEventType(0LL);
    unint64_t v46 = sub_1000041A0();
    int v48 = dispatch thunk of static Equatable.== infix(_:_:)(v47, v44);
    sub_10000E728(v47);
    if ((v48 & 1) != 0)
    {

      AerialScreenSaverViewModel.onRequestPreviousAsset()();
    }

    else
    {

      id v32 = v43;
      uint64_t v39 = PRRenderingEventTypeSwipeRight;
      id v33 = PRRenderingEventTypeSwipeRight;
      uint64_t v40 = (id *)&v95;
      uint64_t v95 = v39;
      id v94 = v43;
      int v41 = dispatch thunk of static Equatable.== infix(_:_:)(&v95, &v94);
      sub_10000E728(v40);
      if ((v41 & 1) != 0)
      {

        AerialScreenSaverViewModel.onRequestNextAsset()();
      }

      else
      {

        id v34 = v43;
        uint64_t v36 = PRRenderingEventTypeTap;
        id v35 = PRRenderingEventTypeTap;
        uint64_t v37 = (id *)&v93;
        uint64_t v93 = v36;
        id v92 = v43;
        int v38 = dispatch thunk of static Equatable.== infix(_:_:)(&v93, &v92);
        sub_10000E728(v37);
        if ((v38 & 1) != 0)
        {

          AerialScreenSaverViewModel.onRequestToggleOverlay()();
        }

        else
        {
        }
      }
    }
  }

uint64_t sub_100009F18()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didReceive:)", 0x17uLL, 1)._countAndFlagsBits;
}

uint64_t sub_10000A0F0()
{
  return _allocateUninitializedArray<A>(_:)(0LL);
}

uint64_t sub_10000A264()
{
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000A32C(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc(dword_100019F3C);
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_10000A3CC;
  return sub_10000A264();
}

uint64_t sub_10000A3CC()
{
  uint64_t v6 = *v0;
  uint64_t v1 = *(void *)(*v0 + 48);
  aBlock = *(void (***)(void))(*v0 + 40);
  uint64_t v3 = *(void **)(*v0 + 32);
  id v4 = *(void **)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);

  aBlock[2]();
  _Block_release(aBlock);
  return (*(uint64_t (**)(void))(*(void *)(v6 + 16) + 8LL))();
}

  ;
}

void sub_10000A4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v135 = a1;
  uint64_t v134 = a2;
  uint64_t v163 = 0LL;
  uint64_t v162 = 0LL;
  uint64_t v161 = 0LL;
  uint64_t v133 = 0LL;
  uint64_t v130 = 0LL;
  id v152 = 0LL;
  uint64_t v3 = sub_10000466C(&qword_100019CC8);
  unint64_t v131 = (*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v3);
  uint64_t v132 = (uint64_t)v69 - v131;
  uint64_t v136 = type metadata accessor for Logger(0LL);
  uint64_t v137 = *(void *)(v136 - 8);
  unint64_t v138 = (*(void *)(v137 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v135);
  v139 = (char *)v69 - v138;
  unint64_t v140 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v4);
  unsigned int v141 = (char *)v69 - v140;
  uint64_t v163 = v6;
  uint64_t v162 = v7;
  uint64_t v161 = v2;
  v142 = (id *)(v2 + OBJC_IVAR____TtC12AerialPoster15PosterPresenter_state);
  uint64_t v143 = (char *)&v160 + 4;
  swift_beginAccess();
  id v144 = *v142;
  id v8 = v144;
  swift_endAccess(v143);
  if (!v144) {
    goto LABEL_13;
  }
  id v128 = v144;

  uint64_t v125 = (id *)&v129[OBJC_IVAR____TtC12AerialPoster15PosterPresenter_renderer];
  v126 = &v153;
  swift_beginAccess();
  id v127 = *v125;
  id v9 = v127;
  swift_endAccess(v126);
  if (v127)
  {
    id v124 = v127;
    uint64_t v10 = v141;
    id v107 = v127;
    id v152 = v127;
    uint64_t v11 = sub_10000F4A0();
    uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v137 + 16))(v10, v11, v136);
    uint64_t v122 = (os_log_s *)Logger.logObject.getter(v12);
    int v123 = static os_log_type_t.debug.getter();
    v110 = &v150;
    uint64_t v150 = 12LL;
    unint64_t v108 = sub_10000C7A4();
    unint64_t v109 = sub_10000C80C();
    unint64_t v13 = sub_10000C874();
    UnsignedInteger<>.init<A>(_:)(&v151, v110, &type metadata for UInt32, &type metadata for Int, v108, v109, v13);
    uint32_t v111 = v151;
    uint64_t v112 = 17LL;
    uint64_t v114 = 7LL;
    uint64_t v14 = swift_allocObject(&unk_100014F78, 17LL, 7LL);
    uint64_t v15 = v112;
    uint64_t v16 = v114;
    uint64_t v116 = v14;
    *(_BYTE *)(v14 + 16) = 32;
    uint64_t v17 = swift_allocObject(&unk_100014FA0, v15, v16);
    uint64_t v18 = v114;
    uint64_t v117 = v17;
    *(_BYTE *)(v17 + 16) = 8;
    uint64_t v113 = 32LL;
    uint64_t v19 = swift_allocObject(&unk_100014FC8, 32LL, v18);
    uint64_t v20 = v113;
    uint64_t v21 = v114;
    uint64_t v115 = v19;
    *(void *)(v19 + 16) = sub_10000B3A4;
    *(void *)(v19 + 24) = 0LL;
    uint64_t v22 = swift_allocObject(&unk_100014FF0, v20, v21);
    uint64_t v23 = v115;
    uint64_t v119 = v22;
    *(void *)(v22 + 16) = sub_10000EA98;
    *(void *)(v22 + 24) = v23;
    uint64_t v121 = sub_10000466C(&qword_100019EC8);
    uint64_t v118 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v120 = v24;
    swift_retain(v116);
    uint64_t v25 = v117;
    uint64_t v26 = v116;
    uint64_t v27 = v120;
    *uint64_t v120 = sub_10000EA24;
    v27[1] = v26;
    swift_retain(v25);
    uint64_t v28 = v119;
    uint64_t v29 = v117;
    id v30 = v120;
    v120[2] = sub_10000EA54;
    v30[3] = v29;
    swift_retain(v28);
    uint64_t v31 = v118;
    uint64_t v32 = v119;
    id v33 = v120;
    v120[4] = sub_10000EAE0;
    v33[5] = v32;
    sub_100002D3C();
    swift_bridgeObjectRelease(v31);
    if (os_log_type_enabled(v122, (os_log_type_t)v123))
    {
      uint64_t v34 = v130;
      id v100 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v99 = sub_10000466C(&qword_100019EE0);
      uint64_t v101 = sub_10000C8DC(0LL, v99, v99);
      uint64_t v102 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v103 = &v149;
      uint64_t v149 = v100;
      uint64_t v104 = &v148;
      uint64_t v148 = v101;
      uint64_t v105 = &v147;
      uint64_t v147 = v102;
      sub_10000C934(2LL, &v149);
      sub_10000C934(1LL, v103);
      uint64_t v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000EA24;
      uint64_t v146 = v116;
      sub_10000C948(&v145, (uint64_t)v103, (uint64_t)v104, (uint64_t)v105);
      uint64_t v106 = v34;
      if (v34)
      {
        __break(1u);
      }

      else
      {
        uint64_t v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000EA54;
        uint64_t v146 = v117;
        sub_10000C948(&v145, (uint64_t)&v149, (uint64_t)&v148, (uint64_t)&v147);
        uint64_t v98 = 0LL;
        uint64_t v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000EAE0;
        uint64_t v146 = v119;
        sub_10000C948(&v145, (uint64_t)&v149, (uint64_t)&v148, (uint64_t)&v147);
        _os_log_impl((void *)&_mh_execute_header, v122, (os_log_type_t)v123, "%s", v100, v111);
        sub_10000C98C(v101, 0LL);
        sub_10000C98C(v102, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v116);
        swift_release(v117);
        swift_release(v119);
      }
    }

    else
    {
      swift_release(v116);
      swift_release(v117);
      swift_release(v119);
    }

    (*(void (**)(char *, uint64_t))(v137 + 8))(v141, v136);
    uint64_t v35 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 56LL))(v132, 1LL);
    uint64_t v95 = 7LL;
    uint64_t v96 = swift_allocObject(&unk_100014A78, 24LL, 7LL);
    uint64_t v94 = v96 + 16;
    uint64_t v36 = v129;
    swift_unknownObjectWeakInit(v94, v129);

    swift_retain(v96);
    id v37 = v107;
    uint64_t v38 = swift_allocObject(&unk_100015018, 48LL, v95);
    id v39 = v107;
    uint64_t v40 = (void *)v38;
    uint64_t v41 = v96;
    uint64_t v97 = v40;
    v40[2] = 0LL;
    v40[3] = 0LL;
    v40[4] = v41;
    v40[5] = v39;
    swift_release(v41);
    uint64_t v42 = sub_10000466C((uint64_t *)&unk_100019F20);
    uint64_t v43 = sub_100006FF4(v132, (uint64_t)&unk_100019F58, (uint64_t)v97, v42);
    swift_release(v43);
  }

  else
  {
LABEL_13:
    uint64_t v44 = v139;
    uint64_t v45 = sub_10000F4A0();
    uint64_t v46 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v137 + 16))(v44, v45, v136);
    id v92 = (os_log_s *)Logger.logObject.getter(v46);
    int v93 = static os_log_type_t.debug.getter();
    uint64_t v80 = &v159;
    uint64_t v159 = 12LL;
    unint64_t v78 = sub_10000C7A4();
    unint64_t v79 = sub_10000C80C();
    unint64_t v47 = sub_10000C874();
    UnsignedInteger<>.init<A>(_:)(&v160, v80, &type metadata for UInt32, &type metadata for Int, v78, v79, v47);
    uint32_t v81 = v160;
    uint64_t v82 = 17LL;
    uint64_t v84 = 7LL;
    uint64_t v48 = swift_allocObject(&unk_100014ED8, 17LL, 7LL);
    uint64_t v49 = v82;
    uint64_t v50 = v84;
    uint64_t v86 = v48;
    *(_BYTE *)(v48 + 16) = 32;
    uint64_t v51 = swift_allocObject(&unk_100014F00, v49, v50);
    uint64_t v52 = v84;
    uint64_t v87 = v51;
    *(_BYTE *)(v51 + 16) = 8;
    uint64_t v83 = 32LL;
    uint64_t v53 = swift_allocObject(&unk_100014F28, 32LL, v52);
    uint64_t v54 = v83;
    uint64_t v55 = v84;
    uint64_t v85 = v53;
    *(void *)(v53 + 16) = sub_10000B378;
    *(void *)(v53 + 24) = 0LL;
    uint64_t v56 = swift_allocObject(&unk_100014F50, v54, v55);
    uint64_t v57 = v85;
    uint64_t v89 = v56;
    *(void *)(v56 + 16) = sub_10000E9A8;
    *(void *)(v56 + 24) = v57;
    uint64_t v91 = sub_10000466C(&qword_100019EC8);
    uint64_t v88 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v90 = v58;
    swift_retain(v86);
    uint64_t v59 = v87;
    uint64_t v60 = v86;
    uint64_t v61 = v90;
    void *v90 = sub_10000E934;
    v61[1] = v60;
    swift_retain(v59);
    uint64_t v62 = v89;
    uint64_t v63 = v87;
    uint64_t v64 = v90;
    v90[2] = sub_10000E964;
    v64[3] = v63;
    swift_retain(v62);
    uint64_t v65 = v88;
    uint64_t v66 = v89;
    uint64_t v67 = v90;
    v90[4] = sub_10000E9F0;
    v67[5] = v66;
    sub_100002D3C();
    swift_bridgeObjectRelease(v65);
    if (os_log_type_enabled(v92, (os_log_type_t)v93))
    {
      uint64_t v68 = v130;
      int v71 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v70 = sub_10000466C(&qword_100019EE0);
      uint64_t v72 = sub_10000C8DC(0LL, v70, v70);
      uint64_t v73 = sub_10000C8DC(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      int v74 = &v158;
      uint64_t v158 = v71;
      id v75 = &v157;
      uint64_t v157 = v72;
      uint64_t v76 = &v156;
      uint64_t v156 = v73;
      sub_10000C934(2LL, &v158);
      sub_10000C934(1LL, v74);
      uint64_t v154 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E934;
      uint64_t v155 = v86;
      sub_10000C948(&v154, (uint64_t)v74, (uint64_t)v75, (uint64_t)v76);
      uint64_t v77 = v68;
      if (v68)
      {
        __break(1u);
      }

      else
      {
        uint64_t v154 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E964;
        uint64_t v155 = v87;
        sub_10000C948(&v154, (uint64_t)&v158, (uint64_t)&v157, (uint64_t)&v156);
        v69[1] = 0LL;
        uint64_t v154 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000E9F0;
        uint64_t v155 = v89;
        sub_10000C948(&v154, (uint64_t)&v158, (uint64_t)&v157, (uint64_t)&v156);
        _os_log_impl((void *)&_mh_execute_header, v92, (os_log_type_t)v93, "%s - skipped; not rendering", v71, v81);
        sub_10000C98C(v72, 0LL);
        sub_10000C98C(v73, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v86);
        swift_release(v87);
        swift_release(v89);
      }
    }

    else
    {
      swift_release(v86);
      swift_release(v87);
      swift_release(v89);
    }

    (*(void (**)(char *, uint64_t))(v137 + 8))(v139, v136);
  }

uint64_t sub_10000B378()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "service(_:didUpdateSnapshotWithTraits:)",  0x27uLL,  1)._countAndFlagsBits;
}

uint64_t sub_10000B3A4()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "service(_:didUpdateSnapshotWithTraits:)",  0x27uLL,  1)._countAndFlagsBits;
}

uint64_t sub_10000B3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a5;
  v5[16] = a4;
  v5[15] = a1;
  v5[11] = v5;
  v5[12] = 0LL;
  v5[13] = 0LL;
  v5[12] = a4 + 16;
  v5[13] = a5;
  return swift_task_switch(sub_10000B41C, 0LL, 0LL);
}

uint64_t sub_10000B41C()
{
  uint64_t v13 = v0[16];
  v0[11] = v0;
  swift_beginAccess(v13 + 16);
  v0[14] = swift_unknownObjectWeakLoadStrong(v13 + 16);
  if (v0[14])
  {
    id v8 = *(void **)(v12 + 136);
    uint64_t v7 = *(void **)(v12 + 112);
    *(void *)(v12 + 144) = v7;
    id v2 = v7;
    sub_10000F21C((id *)(v12 + 112));
    swift_endAccess(v12 + 16);
    id v9 = [v8 environment];
    swift_getObjectType(v9);
    unsigned __int8 v10 = [v9 isPreview];
    swift_unknownObjectRelease(v9);
    if ((v10 & 1) != 0)
    {
      swift_beginAccess(&TVISAmbientSnapshotQueryIntentSwitcher);
      uint64_t v5 = TVISAmbientSnapshotQueryIntentSwitcher;
      swift_endAccess(v12 + 64);
      uint64_t v6 = v5;
    }

    else
    {
      swift_beginAccess(&TVISAmbientSnapshotQueryIntentFullscreen);
      uint64_t v4 = TVISAmbientSnapshotQueryIntentFullscreen;
      swift_endAccess(v12 + 40);
      uint64_t v6 = v4;
    }

    uint64_t v3 = (void *)swift_task_alloc(dword_100019EA4);
    *(void *)(v12 + 152) = v3;
    *uint64_t v3 = *(void *)(v12 + 88);
    v3[1] = sub_10000B67C;
    return sub_100005274(v6);
  }

  else
  {
    uint64_t v11 = *(_BYTE **)(v12 + 120);
    sub_10000F21C((id *)(v12 + 112));
    swift_endAccess(v12 + 16);
    _BYTE *v11 = 1;
    return (*(uint64_t (**)(void))(*(void *)(v12 + 88) + 8LL))();
  }

uint64_t sub_10000B67C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152LL);
  uint64_t v3 = *(void **)(*(void *)v0 + 144LL);
  *(void *)(*(void *)v0 + 88LL) = *(void *)v0;
  swift_task_dealloc(v1);

  return swift_task_switch(sub_10000B6F8, 0LL, 0LL);
}

uint64_t sub_10000B6F8()
{
  uint64_t v1 = *(_BYTE **)(v0 + 120);
  *(void *)(v0 + 88) = v0;
  _BYTE *v1 = 0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 8LL))();
}

uint64_t sub_10000B790(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_10000B7C0(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v6 = (a3 + 1);
  }

  else
  {
    int v8 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v6 = (v8 | (a3 >> 6)) + 33217;
    }

    else
    {
      int v7 = (v8 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v6 = (v7 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v6 = ((a3 >> 18) | ((v7 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }

  uint64_t v5 = 4 - ((uint64_t)__clz(v6) >> 3);
  uint64_t v9 = (v6 - 0x101010101010101LL) & ((1LL << ((8 * v5) & 0x3F)) - 1);
  if (v5 >= 0) {
    return a1(&v9, v5);
  }
  _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeBufferPointer with negative count",  39LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  1343LL,  0);
  __break(1u);
LABEL_12:
  LOBYTE(v4) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  v4,  3455LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000BB04@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  unint64_t v24 = a6;
  uint64_t v25 = a7;
  int v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = a11;
  uint64_t v29 = "Fatal error";
  id v30 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v31 = "Swift/StaticString.swift";
  uint64_t v32 = "Not enough bits to represent the passed value";
  id v33 = "Swift/Integers.swift";
  uint64_t v34 = "UnsafeBufferPointer with negative count";
  uint64_t v35 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v36 = 0LL;
  unint64_t v38 = a6;
  uint64_t v39 = a7;
  char v40 = a8;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  unint64_t v43 = a10;
  unint64_t v44 = a11;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        uint64_t v17 = &v16;
        __chkstk_darwin();
        uint64_t v14 = sub_10000F170;
        uint64_t v15 = &v37;
        sub_10000B7C0((uint64_t (*)(uint64_t *, uint64_t))sub_10000F1B0, (uint64_t)&v13, v11);
        return (uint64_t)v17;
      }

      LOBYTE(v13) = 2;
      _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v32, 45LL, 2LL, v33, 20LL, v13, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v45 = v22;
  }
  else {
    uint64_t v45 = 0LL;
  }
  uint64_t v16 = v45;
  if (!v45)
  {
    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return sub_10000BEC8(v16, v23, v24, v25, v26, v20, v21, v27, v19, v28);
  }
  LOBYTE(v13) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v29, 11LL, 2LL, v34, 39LL, 2LL, v35, 31LL, v13, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000BEC8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  unint64_t v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Unexpectedly found nil while unwrapping an Optional value";
  id v30 = "Swift/StaticString.swift";
  uint64_t v31 = "Not enough bits to represent the passed value";
  uint64_t v32 = "Swift/Integers.swift";
  id v33 = "UnsafeBufferPointer with negative count";
  uint64_t v34 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v35 = 0LL;
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  unint64_t v41 = a8;
  unint64_t v42 = a10;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        uint64_t v17 = &v15;
        __chkstk_darwin();
        int v13 = sub_10000F1D8;
        uint64_t v14 = &v36;
        sub_10000B7C0((uint64_t (*)(uint64_t *, uint64_t))sub_10000F1F4, (uint64_t)&v12, v10);
        return (uint64_t)v17;
      }

      LOBYTE(v12) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 45LL, 2LL, v32, 20LL, v12, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v43 = v22;
  }
  else {
    uint64_t v43 = 0LL;
  }
  uint64_t v16 = v43;
  if (!v43)
  {
    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return sub_10000C25C(v16, v23, v24, v25, v20, v21, v26, v27);
  }
  LOBYTE(v12) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v28, 11LL, 2LL, v33, 39LL, 2LL, v34, 31LL, v12, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000C25C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  unint64_t v26 = a7;
  unint64_t v27 = a8;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Not enough bits to represent the passed value";
  id v30 = "Swift/Integers.swift";
  uint64_t v31 = "Not enough bits to represent a signed value";
  uint64_t v32 = "Unexpectedly found nil while unwrapping an Optional value";
  id v33 = "Swift/AssertCommon.swift";
  if (a3)
  {
    uint64_t v19 = v22;
  }

  else
  {
    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 230LL, 0);
    __break(1u);
  }

  uint64_t v18 = v19;
  if (v23 >= (uint64_t)0xFFFFFFFF80000000LL)
  {
    if (v23 <= 0x7FFFFFFF)
    {
      unsigned int v17 = v23;
      if (v24)
      {
        uint64_t v16 = v24;
      }

      else
      {
        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 231LL, 0);
        __break(1u);
      }

      uint64_t v15 = v16;
      if (v25 >= (uint64_t)0xFFFFFFFF80000000LL)
      {
        if (v25 <= 0x7FFFFFFF)
        {
          unsigned int v14 = v25;
          if (v20)
          {
            uint64_t v13 = v20;
          }

          else
          {
            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 232LL, 0);
            __break(1u);
          }

          uint64_t v12 = v13;
          if (v21 >= (uint64_t)0xFFFFFFFF80000000LL)
          {
            if (v21 <= 0x7FFFFFFF)
            {
              unsigned int v11 = v21;
              if (v26 <= 0xFFFFFFFF)
              {
                unsigned int v10 = v26;
                if (v27 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile(v18, v17, v15, v14, v12, v11, v10, v27, 0);
                }
                LOBYTE(v9) = 2;
                _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
                __break(1u);
              }

              LOBYTE(v9) = 2;
              _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
              __break(1u);
            }

            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
            __break(1u);
          }

          LOBYTE(v9) = 2;
          _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
          __break(1u);
        }

        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
        __break(1u);
      }

      LOBYTE(v9) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
      __break(1u);
    }

    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
    __break(1u);
  }

  LOBYTE(v9) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
  __break(1u);
  return result;
}

unint64_t sub_10000C7A4()
{
  uint64_t v2 = qword_100019EB0;
  if (!qword_100019EB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019EB0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10000C80C()
{
  uint64_t v2 = qword_100019EB8;
  if (!qword_100019EB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019EB8);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10000C874()
{
  uint64_t v2 = qword_100019EC0;
  if (!qword_100019EC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019EC0);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_10000C8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000C934(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000C948( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_10000C98C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }

uint64_t sub_10000C9F8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000CA7C;
  return v5(a1);
}

uint64_t sub_10000CA7C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000CAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume(a2);
}

uint64_t sub_10000CB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocError(a4, a5, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v5, a1);
  return swift_continuation_throwingResumeWithError(a2, v9);
}

uint64_t sub_10000CBA0(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_10000CBC0(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v9 = v5;
  uint64_t v6 = sub_10000CC3C(v4, v5, a3);
  uint64_t v10 = *a1;
  uint64_t v12 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  swift_bridgeObjectRelease(v9);
  uint64_t result = a1;
  *a1 = v10 + 8;
  return result;
}

uint64_t sub_10000CC3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_10000CDAC((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType(v14);
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_10000F404((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    sub_10000F39C(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_10000F404((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    sub_10000F39C(v13);
  }

  return v11;
}

uint64_t sub_10000CDAC(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v25 = a6;
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }

      else
      {
        int64_t v16 = 0LL;
      }

      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_10000D120(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0LL, v15, a2, a3);
          *uint64_t v17 = a2;
          uint64_t v11 = 0LL;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          char v23 = v13 & 1;
          char v24 = v14 & 1;
          return (uint64_t)v11;
        }

        goto LABEL_28;
      }
    }

LABEL_13:
    uint64_t v6 = sub_10000D15C(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }

    __break(1u);
  }

  uint64_t result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0LL;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }

  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_10000D120(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_10000D15C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_10000D20C(a1, a2);
  sub_10000D384();
  uint64_t v4 = v6[2];
  sub_10000D3F8(v4);
  sub_10000D478(v4, 0);
  sub_10000D4E4();
  swift_retain(v6);
  uint64_t v5 = sub_10000D4F0((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_10000D20C(uint64_t a1, uint64_t a2)
{
  v10[2] = a2;
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }

  else if ((a2 & 0x2000000000000000LL) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }

  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }

  if (!v7) {
    return sub_10000D66C();
  }
  uint64_t v5 = sub_10000D504(v7, 0LL);
  swift_retain(v5);
  swift_release(v5);
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  uint64_t v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v10;
    v10[0] = 0LL;
    v10[1] = 0xE000000000000000LL;
    sub_10000F478((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_10000D384()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_10000D4F0(*v3);
    uint64_t result = sub_10000D698(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }

  return result;
}

uint64_t sub_10000D3F8(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = sub_10000D698(*(void *)(*(void *)v1 + 24LL) >> 1 != 0LL, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t sub_10000D478(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release(v4);
  uint64_t v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release(v6);
}

void sub_10000D4E4()
{
  void *v0 = *v0;
}

uint64_t sub_10000D4F0(uint64_t a1)
{
  return sub_10000D994(a1);
}

void *sub_10000D504(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = sub_10000466C(&qword_10001A0C8);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((sub_10000F448() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + sub_10000F454(v6);
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }

    else
    {
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * v7;
    }

    swift_release(v6);
    return v6;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    return &_swiftEmptyArrayStorage;
  }

void *sub_10000D66C()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000D698(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result = swift_retain(a4);
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2LL) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }

      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }

    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    uint64_t v5 = sub_10000466C(&qword_10001A0C8);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((sub_10000F448() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + sub_10000F454(v8);
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * (v6 - (void)(v8 + 4));
    }

    else
    {
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * v9;
    }

    swift_release(v8);
    uint64_t v7 = (char *)v8;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  if ((a1 & 1) != 0)
  {
    swift_release(a4);
    swift_bridgeObjectRelease(a4);
    sub_10000D9D0((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release(a4);
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    sub_10000D99C((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t sub_10000D994(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_10000D99C(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_10000D9D0(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

_BYTE **sub_10000DA80(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000DA94()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000DABC(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000DAC4()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000DAEC(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000DAF4()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000DB30()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DB3C()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000DB78(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000DB88()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_10000DBC4()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000DC10(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019ED4);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000DCB4;
  return sub_100005F30(a1, v5, v6, v7, v8);
}

uint64_t sub_10000DCB4()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000DD14(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(a1 + 8);
  return result;
}

unint64_t sub_10000DD30()
{
  uint64_t v3 = qword_100019EE8;
  if (!qword_100019EE8)
  {
    uint64_t v0 = type metadata accessor for PRRenderingMode(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012464, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019EE8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000DDA0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000DDC8(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000DDD0()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000DDF8(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000DE00()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000DE3C()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DE48()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000DE84(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_10000DE90()
{
  uint64_t v2 = qword_100019EF0;
  if (!qword_100019EF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for AerialScreenSaverView,  &type metadata for AerialScreenSaverView);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019EF0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10000DEF8()
{
  uint64_t v3 = qword_100019EF8;
  if (!qword_100019EF8)
  {
    uint64_t v0 = type metadata accessor for AerialScreenSaverViewModel(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for AerialScreenSaverViewModel, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019EF8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000DF68(uint64_t a1)
{
  return a1;
}

void *sub_10000DFA8(uint64_t a1, void *a2)
{
  id v5 = *(id *)a1;
  id v2 = *(id *)a1;
  *a2 = v5;
  a2[1] = *(void *)(a1 + 8);
  swift_unknownObjectWeakCopyInit(a2 + 2, a1 + 16);
  a2[3] = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  swift_retain();
  a2[4] = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  swift_retain();
  a2[5] = v8;
  uint64_t v9 = *(void **)(a1 + 48);
  id v3 = v9;
  uint64_t result = a2;
  a2[6] = v9;
  return result;
}

uint64_t sub_10000E058(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000E0B0( id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000E0D8( id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000E100( void *a1)
{
}

uint64_t sub_10000E128()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E150(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E158()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E180(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E188()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000E1C4()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000E1D0()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000E20C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000E218()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E240(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E248()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E270(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E278()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000E2B4()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000E2C0()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000E2FC(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000E308()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000E354(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019F14);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000E3F8;
  return sub_100008304(a1, v5, v6, v7, v8);
}

uint64_t sub_10000E3F8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000E458()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E480(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E488()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E4B0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E4B8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000E4F4()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000E500()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000E53C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000E548()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E570(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E578()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E5A0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E5A8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000E5E4()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000E5F0()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000E62C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000E638()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E660(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E668()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E690(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E698()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000E6D4()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000E6E0()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000E71C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000E728( id *a1)
{
}

unint64_t sub_10000E750()
{
  uint64_t v3 = qword_100019F30;
  if (!qword_100019F30)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PREditingLook);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019F30);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10000E7B4()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_10000E800()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  uint64_t v6 = (void *)v0[2];
  size_t v4 = (const void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019F44);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10000E8AC;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_100019F40 + dword_100019F40))( v6,  v4,  v5);
}

uint64_t sub_10000E8AC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000E90C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E934(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E93C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000E964(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000E96C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000E9A8()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000E9B4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000E9F0(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000E9FC()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000EA24(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000EA2C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000EA54(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA80(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000EA5C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000EA98()
{
  return sub_10000CBA0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000EAA4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000EAE0(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000CBC0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000EAEC()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000EB38(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019F54);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000EBDC;
  return sub_10000B3D0(a1, v5, v6, v7, v8);
}

uint64_t sub_10000EBDC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for PosterPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC12AerialPoster15PosterPresenter);
}

void *sub_10000EC60(void *a1, id *a2)
{
  id v4 = *a2;
  id v2 = *a2;
  uint64_t result = a1;
  *a1 = v4;
  return result;
}

void sub_10000EC94(id *a1)
{
}

void *sub_10000ECAC(void *a1, id *a2)
{
  id v4 = *a2;
  id v2 = *a2;
  uint64_t result = a1;
  *a1 = v4;
  return result;
}

id *sub_10000ECE0(id *a1, id *a2)
{
  id v5 = *a1;
  id v4 = *a2;
  id v2 = *a2;
  *a1 = v4;

  return a1;
}

void *sub_10000ED28(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **sub_10000ED34(void **a1, void **a2)
{
  id v2 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_10000ED68(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFE && *(_BYTE *)(a1 + 8))
    {
      int v5 = *(void *)a1 + 2147483646;
    }

    else
    {
      int v4 = -1;
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }

  else
  {
    int v5 = -1;
  }

  return (v5 + 1);
}

uint64_t sub_10000EEDC(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(_BYTE *)(result + 8) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(_BYTE *)(result + 8) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }

  return result;
}

uint64_t sub_10000F0D8(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for AerialScreenSaverViewModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48LL))(a1, 1LL);
}

uint64_t sub_10000F118(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for AerialScreenSaverViewModel(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, a2, 1LL);
}

void *type metadata accessor for PosterPresenter.State()
{
  return &unk_1000150B0;
}

uint64_t sub_10000F170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000BEC8( a1,  a2,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(_BYTE *)(v3 + 32),  *(void *)(v3 + 40),  *(void *)(v3 + 48),  *(void *)(v3 + 56),  a3,  *(void *)(v3 + 64));
}

uint64_t sub_10000F1B0(uint64_t a1, uint64_t a2)
{
  return sub_10000B790(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_10000F1D8(uint64_t a1, uint64_t a2)
{
  return sub_10000C25C( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56));
}

uint64_t sub_10000F1F4(uint64_t a1, uint64_t a2)
{
  return sub_10000B790(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000F21C( id *a1)
{
}

uint64_t sub_10000F244()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_10000F288(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  int v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_10001A0AC);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000F33C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001A0A8 + dword_10001A0A8))(a1, v5);
}

uint64_t sub_10000F33C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000F39C(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_10000F404(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_10000F448()
{
  return 1LL;
}

size_t sub_10000F454(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000F478( uint64_t a1)
{
}

uint64_t sub_10000F4A0()
{
  if (qword_100019AC8 != -1) {
    swift_once(&qword_100019AC8, sub_10000F500);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_10000F5A4(v0, (uint64_t)qword_10001A128);
}

uint64_t sub_10000F500()
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000F5E4(v3, qword_10001A128);
  sub_10000F5A4(v3, (uint64_t)qword_10001A128);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.IdleScreen.Aerial", 0x1BuLL, 1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t sub_10000F5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_10000F5E4(uint64_t a1, uint64_t *a2)
{
  int v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc( *(void *)(*(void *)(a1 - 8) + 64LL),  *(_DWORD *)(*(void *)(a1 - 8) + 80LL));
    *a2 = v2;
    return v2;
  }

  return (uint64_t)v5;
}

void *type metadata accessor for Log()
{
  return &unk_1000150F8;
}

id sub_10000F668()
{
  id v10 = 0LL;
  uint64_t v11 = 0LL;
  sub_10000F74C();
  id v9 = sub_10000F7B0();
  type metadata accessor for PosterUpdater();
  id v0 = v9;
  id v8 = sub_100002754(v9);
  id v1 = v8;
  id v10 = v8;
  type metadata accessor for PosterPresenter();
  id v2 = v9;
  uint64_t v7 = sub_100005018(v9);
  uint64_t v3 = v7;
  uint64_t v11 = v7;

  id v4 = v8;
  int v5 = v7;

  sub_10000F7DC(&v10);
  return v8;
}

unint64_t sub_10000F74C()
{
  uint64_t v3 = qword_10001A0D0;
  if (!qword_10001A0D0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___TVISAmbientPosterServiceProxy);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_10001A0D0);
    return ObjCClassMetadata;
  }

  return v3;
}

id sub_10000F7B0()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  return sub_1000107B0();
}

id *sub_10000F7DC(id *a1)
{
  return a1;
}

uint64_t sub_10000F810(void *a1, void *a2)
{
  char v14 = a1;
  int64_t v15 = a2;
  uint64_t v11 = sub_10000466C(&qword_10001A0D8);
  id v2 = a1;
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100015118, 32LL, 7LL);
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v10 = PRProviderConfiguration.__allocating_init(updatingDelegate:content:)();
  swift_retain(v10);
  uint64_t v13 = v10;
  uint64_t v12 = v10;
  unint64_t v6 = sub_10000FAF8();
  static _SceneBuilder.buildBlock<A>(_:)(&v12, v11, v6);
  swift_release(v12);
  return swift_release(v13);
}

uint64_t sub_10000F908@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  char v24 = a1;
  uint64_t v25 = a2;
  uint64_t v15 = type metadata accessor for PRRenderingConfiguration(0LL);
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_1000151C0, 32LL, 7LL);
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v14 = PRRenderingConfiguration.__allocating_init(_:)(sub_100010674);
  swift_retain(v14);
  uint64_t v23 = v14;
  uint64_t v16 = type metadata accessor for PREditingConfiguration(0LL);
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = swift_allocObject(&unk_1000151E8, 32LL, 7LL);
  *(void *)(v8 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v13 = PREditingConfiguration.__allocating_init(_:)(sub_1000106C4);
  swift_retain(v13);
  uint64_t v22 = v13;
  uint64_t v21 = v14;
  uint64_t v20 = v13;
  unint64_t v17 = sub_1000106D0();
  unint64_t v9 = sub_100010740();
  uint64_t v18 = sub_10000FC5C((uint64_t)&v21, (uint64_t)&v20, v15, v16, v17, v9);
  swift_release(v20);
  swift_release(v21);
  *a3 = v18;
  swift_release(v22);
  return swift_release(v23);
}

uint64_t sub_10000FAA8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000FAEC@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000F908(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_10000FAF8()
{
  uint64_t v3 = qword_10001A0E0;
  if (!qword_10001A0E0)
  {
    uint64_t v0 = sub_10000FB68(&qword_10001A0D8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10001A0E0);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000FB68(uint64_t *a1)
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

id sub_10000FBDC(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

id sub_10000FC1C(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

uint64_t sub_10000FC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = a1;
  uint64_t v22 = a2;
  uint64_t v17 = a3;
  uint64_t v25 = a4;
  uint64_t v18 = a5;
  uint64_t v26 = a6;
  uint64_t v30 = a3;
  uint64_t v29 = a4;
  uint64_t v21 = *(void *)(a4 - 8);
  unint64_t v12 = (*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(a1);
  unint64_t v27 = (char *)&v11 - v12;
  uint64_t v15 = *(void *)(v6 - 8);
  unint64_t v13 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin((char *)&v11 - v12);
  uint64_t v19 = (char *)&v11 - v13;
  uint64_t v14 = sub_10000466C(&qword_10001A110);
  uint64_t v7 = *(void *)(type metadata accessor for _AnySceneConfiguration(0LL) - 8);
  uint64_t v20 = *(void *)(v7 + 72);
  uint64_t v8 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + 2 * v20,  *(unsigned __int8 *)(v7 + 80) | 7LL);
  uint64_t v28 = sub_1000107D0(v8, 2LL);
  uint64_t v24 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v16, v17);
  _AnySceneConfiguration.init<A>(erasing:)(v19, v17, v18);
  uint64_t v23 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v27, v22, v25);
  _AnySceneConfiguration.init<A>(erasing:)(v27, v25, v26);
  uint64_t result = v28;
  sub_100010820();
  return result;
}

uint64_t sub_10000FDF4()
{
  unint64_t v2 = sub_100010554();
  unint64_t v0 = sub_1000105C0();
  return static _AppExtension<>.main()(&unk_100015198, v2, v0);
}

id sub_10000FE74@<X0>(void *a1@<X8>)
{
  id result = sub_10000F668();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_10000FEA0()
{
  return sub_10000F810(*v0, v0[1]);
}

uint64_t sub_10000FEBC()
{
  return _AppExtension.hostAuditToken.getter();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void *sub_10000FF8C(void *a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v5;
  uint64_t v7 = *(void **)(a2 + 8);
  id v3 = v7;
  id result = a1;
  a1[1] = v7;
  return result;
}

void sub_10000FFE0(id *a1)
{
}

void *sub_100010010(void *a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v5;
  uint64_t v7 = *(void **)(a2 + 8);
  id v3 = v7;
  id result = a1;
  a1[1] = v7;
  return result;
}

uint64_t sub_100010064(uint64_t a1, uint64_t a2)
{
  id v7 = *(id *)a2;
  id v2 = *(id *)a2;
  id v3 = *(void **)a1;
  *(void *)a1 = v7;

  uint64_t v9 = *(void **)(a2 + 8);
  id v4 = v9;
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;

  return a1;
}

__n128 sub_1000100CC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000100D8(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  id v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  return a1;
}

uint64_t sub_100010128(uint64_t a1, unsigned int a2)
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
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t sub_100010288(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = 1;
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
        *(_BYTE *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)__n128 result = a2 - 1;
    }
  }

  return result;
}

void *type metadata accessor for AerialPosterExtension()
{
  return &unk_100015198;
}

unint64_t sub_1000104A4()
{
  return sub_1000104B8();
}

unint64_t sub_1000104B8()
{
  uint64_t v3 = qword_10001A0E8;
  if (!qword_10001A0E8)
  {
    uint64_t v0 = sub_10000FB68(&qword_10001A0D8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10001A0E8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100010528(uint64_t a1)
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2(a1, &unk_100012DD0, 1LL) + 8) + 8LL);
}

unint64_t sub_100010554()
{
  uint64_t v2 = qword_10001A0F0;
  if (!qword_10001A0F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100012538, &unk_100015198);
    atomic_store(WitnessTable, (unint64_t *)&qword_10001A0F0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000105C0()
{
  uint64_t v3 = qword_10001A0F8;
  if (!qword_10001A0F8)
  {
    uint64_t v0 = sub_10000FB68(&qword_10001A0D8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10001A0F8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100010630()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_100010674()
{
  return sub_10000FBDC(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_100010680()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_1000106C4()
{
  return sub_10000FC1C(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

unint64_t sub_1000106D0()
{
  uint64_t v3 = qword_10001A100;
  if (!qword_10001A100)
  {
    uint64_t v0 = type metadata accessor for PRRenderingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRRenderingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10001A100);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100010740()
{
  uint64_t v3 = qword_10001A108;
  if (!qword_10001A108)
  {
    uint64_t v0 = type metadata accessor for PREditingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PREditingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_10001A108);
    return WitnessTable;
  }

  return v3;
}

id sub_1000107B0()
{
  return [v0 init];
}

uint64_t sub_1000107D0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(a1 + 24) = 2 * a2;
  type metadata accessor for _AnySceneConfiguration(0LL);
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100010820()
{
}

void sub_100010850()
{
  void *v0 = *v0;
}
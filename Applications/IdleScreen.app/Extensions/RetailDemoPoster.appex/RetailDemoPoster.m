id sub_1000028DC(void *a1)
{
  objc_class *v1;
  id v2;
  v2 = objc_allocWithZone(v1);
  return sub_100002914(a1);
}

id sub_100002914(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType(v1);
  v11 = a1;
  id v2 = v1;
  id v12 = v1;
  id v3 = a1;
  *(void *)&v6[OBJC_IVAR____TtC16RetailDemoPoster13PosterUpdater_serviceProxy] = a1;

  v10.receiver = v12;
  v10.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v10, "init");
  id v4 = v9;
  id v12 = v9;

  return v9;
}

uint64_t sub_1000029C4()
{
  if (!"RetailDemoPoster.PosterUpdater")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_10000A758( (uint64_t)"RetailDemoPoster.PosterUpdater",  30LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"RetailDemoPoster/PosterUpdater.swift",  36LL,  2,  v2,  0xDuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_100002AF0()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100002B6C()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_TITLE", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  xmmword_1000156C8 = (__int128)v1;
  return result;
}

__int128 *sub_100002BAC()
{
  if (qword_100015140 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_100015140, sub_100002B6C);
  }
  return &xmmword_1000156C8;
}

void sub_100002C00(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v29 = a1;
  uint64_t v32 = a2;
  v30 = a3;
  uint64_t v31 = a4;
  Builtin::Word v37 = 16LL;
  v56 = 0LL;
  uint64_t v55 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v52 = 0LL;
  uint64_t v53 = 0LL;
  uint64_t v51 = 0LL;
  id v50 = 0LL;
  uint64_t v49 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v24 = type metadata accessor for Logger(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  unint64_t v26 = (*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v5 = __chkstk_darwin(0LL);
  v27 = &v18[-v26];
  unint64_t v28 = (*(void *)(*(void *)(type metadata accessor for IdlePosterState(v5) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = __chkstk_darwin(v33);
  v45 = &v18[-v28];
  uint64_t v34 = type metadata accessor for IdlePosterInfo(v6);
  uint64_t v35 = *(void *)(v34 - 8);
  unint64_t v36 = (*(void *)(v35 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v33);
  v47 = &v18[-v36];
  v56 = &v18[-v36];
  uint64_t v55 = v7;
  uint64_t v54 = v8;
  uint64_t v52 = v9;
  uint64_t v53 = v10;
  uint64_t v51 = v4;
  sub_1000035D8();
  int v46 = 1;
  Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("RetailDemoPoster", v37, 1);
  uint64_t countAndFlagsBits = v11._countAndFlagsBits;
  object = v11._object;
  v39 = (void *)PRPosterRoleAmbient;
  id v12 = PRPosterRoleAmbient;
  id v13 = sub_10000363C(countAndFlagsBits, (uint64_t)object, v39);
  id v41 = v13;
  id v50 = v13;
  v14 = sub_100002BAC();
  uint64_t v42 = *(void *)v14;
  uint64_t v43 = *((void *)v14 + 1);
  swift_bridgeObjectRetain();
  id v44 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v43);
  [v13 setDisplayNameLocalizationKey:v44];

  sub_1000036B4((uint64_t)v45);
  IdlePosterInfo.init(posterState:shouldHideInSwitcher:)(v45, v46 & 1);
  PRMutablePosterDescriptor.setIdlePosterInfo(_:)(v47);
  uint64_t v48 = 0LL;
  swift_retain(v31);
  uint64_t v22 = 0LL;
  unint64_t v20 = sub_100005354();
  uint64_t v21 = _allocateUninitializedArray<A>(_:)(1LL);
  v19 = v15;
  id v16 = v41;
  uint64_t v17 = v21;
  void *v19 = v41;
  sub_100003790();
  uint64_t v23 = v17;
  v30();
  swift_bridgeObjectRelease(v23);
  swift_release(v31);
  (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v47, v34);
}

unint64_t sub_1000035D8()
{
  uint64_t v3 = qword_100015158;
  if (!qword_100015158)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRMutablePosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100015158);
    return ObjCClassMetadata;
  }

  return v3;
}

id sub_10000363C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  id v7 =  [(id)((uint64_t (*)())swift_getObjCClassFromMetadata)() mutableDescriptorWithIdentifier:v5 role:a3];

  swift_bridgeObjectRelease(a2);
  return v7;
}

uint64_t sub_1000036B4@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for IdlePosterState.normal(_:);
  uint64_t v1 = type metadata accessor for IdlePosterState(0LL);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104LL))(a1, v3);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100003700()
{
}

uint64_t sub_100003724()
{
  return swift_deallocObject(v2, 24LL, 7LL);
}

uint64_t sub_100003760()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_100003700();
  return result;
}

uint64_t sub_100003768()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1)._countAndFlagsBits;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100003790()
{
}

void sub_1000038BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    sub_100005354();
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
    uint64_t v3 = _convertErrorToNSError(_:)();
    swift_errorRelease();
    uint64_t v4 = (void *)v3;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v6);
}

uint64_t sub_1000039D4(void *a1)
{
  id v1 = a1;
  return (*(uint64_t (**)(void *))(v4 + 8))(a1);
}

uint64_t sub_100003AF8(void *a1, void *a2, const void *a3, void *a4)
{
  v4[5] = a4;
  v4[4] = a2;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  uint64_t v9 = (void *)swift_task_alloc(dword_100015194);
  *(void *)(v12 + 56) = v9;
  *uint64_t v9 = *(void *)(v12 + 16);
  v9[1] = sub_100003BAC;
  return sub_1000039D4(a1);
}

void *sub_100003BAC(void *a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 56);
  *(void *)(v3 + 16) = *v2;
  uint64_t v12 = v3 + 16;
  id v13 = (void *)(v3 + 16);
  swift_task_dealloc(v4);
  if (v1)
  {
    uint64_t v9 = *(void (***)(void *, void))(v12 + 32);
    id v8 = (id)_convertErrorToNSError(_:)();
    v9[2](v9, 0LL);

    _Block_release(v9);
    swift_errorRelease();
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

uint64_t sub_100003CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v2 = sub_1000052E8(&qword_100015268);
  unint64_t v16 = (*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v2);
  uint64_t v24 = (char *)&v15 - v16;
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56LL))(v24, 1LL);
  uint64_t v19 = 48LL;
  uint64_t v20 = 7LL;
  uint64_t v4 = swift_allocObject(&unk_100010878, 48LL);
  uint64_t v5 = v17;
  id v6 = (void *)v4;
  uint64_t v7 = v18;
  uint64_t v23 = v6;
  v6[2] = 0LL;
  v6[3] = 0LL;
  v6[4] = v7;
  v6[5] = v5;
  uint64_t v21 = v6[2];
  uint64_t v22 = v6[3];
  swift_unknownObjectRetain();
  uint64_t v8 = swift_allocObject(&unk_1000108A0, v19);
  uint64_t v9 = v22;
  uint64_t v10 = v23;
  Swift::String v11 = (void *)v8;
  uint64_t v12 = (uint64_t)v24;
  v11[2] = v21;
  v11[3] = v9;
  v11[4] = &unk_100015278;
  v11[5] = v10;
  uint64_t v13 = sub_100004D58(v12, (uint64_t)&unk_100015288, (uint64_t)v11);
  return swift_release(v13);
}

uint64_t sub_100003E04(uint64_t a1)
{
  unint64_t v3 = sub_1000061E0();
  unint64_t v1 = sub_100006250();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_100003E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_1000061E0();
  unint64_t v3 = sub_100006250();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_100003E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_1000061E0();
  unint64_t v3 = sub_100006250();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100003ED0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_1000061E0();
  unint64_t v2 = sub_100006250();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003F18(uint64_t a1)
{
  unint64_t v3 = sub_10000583C();
  unint64_t v1 = sub_1000058AC();
  return OptionSet<>.init()(a1, v3, v1);
}

uint64_t sub_100003F58(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000583C();
  return OptionSet<>.contains(_:)(a1, a2, v2) & 1;
}

uint64_t sub_100003F90(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000583C();
  return OptionSet.union(_:)(a1, a2, v2);
}

uint64_t sub_100003FCC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000583C();
  return OptionSet.intersection(_:)(a1, a2, v2);
}

uint64_t sub_100004008(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000583C();
  return OptionSet.symmetricDifference(_:)(a1, a2, v2);
}

uint64_t sub_100004044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10000583C();
  return OptionSet<>.insert(_:)(a1, a2, a3, v3) & 1;
}

uint64_t sub_100004084(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000583C();
  return OptionSet<>.remove(_:)(a1, a2, v2);
}

uint64_t sub_1000040C0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000583C();
  return OptionSet<>.update(with:)(a1, a2, v2);
}

uint64_t sub_1000040FC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000583C();
  unint64_t v2 = sub_1000058AC();
  return OptionSet<>.formUnion(_:)(a1, a2, v5, v2);
}

uint64_t sub_10000413C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000583C();
  unint64_t v2 = sub_1000058AC();
  return OptionSet<>.formIntersection(_:)(a1, a2, v5, v2);
}

uint64_t sub_10000417C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000583C();
  unint64_t v2 = sub_1000058AC();
  return OptionSet<>.formSymmetricDifference(_:)(a1, a2, v5, v2);
}

uint64_t sub_1000041BC()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t sub_1000041D0()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t sub_1000041E8()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t sub_100004200()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t sub_100004218()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t sub_100004230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100004268()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t sub_10000427C(uint64_t a1)
{
  unint64_t v3 = sub_100006328();
  unint64_t v1 = sub_100006398();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_1000042B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100006328();
  unint64_t v3 = sub_100006398();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_1000042FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_100006328();
  unint64_t v3 = sub_100006398();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100004348(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_100006328();
  unint64_t v2 = sub_100006398();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100004390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100005EDC();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

uint64_t sub_1000043D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100005640();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for UInt) & 1;
}

uint64_t sub_100004420(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000056C4();
  return SetAlgebra<>.init(arrayLiteral:)(a1, a2, v2);
}

uint64_t sub_10000445C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *a2 = result;
  return result;
}

NSString sub_100004488@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_1000044BC(*a1, a1[1]);
  *a2 = result;
  return result;
}

NSString sub_1000044BC(uint64_t a1, uint64_t a2)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v2 = v5;
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(a2);

  return v5;
}

uint64_t sub_100004514@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004544(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004544(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

  return v4;
}

uint64_t sub_100004590@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_2(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1000045D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_3(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100004600(uint64_t a1)
{
  unint64_t v3 = sub_1000062B8();
  unint64_t v1 = sub_1000061E0();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for Int);
}

uint64_t sub_10000465C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100004698@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1000046C8(uint64_t a1)
{
  unint64_t v3 = sub_100006400();
  unint64_t v1 = sub_100006328();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for String);
}

uint64_t sub_100004710(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000061E0();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for Int);
}

uint64_t sub_10000474C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_1000061E0();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for Int);
}

uint64_t sub_100004790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_1000061E0();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for Int);
}

uint64_t sub_1000047D4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100006328();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_100004810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100006328();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_100004854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100006328();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_100004898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100006068();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for Int) & 1;
}

unint64_t sub_1000048E0()
{
  uint64_t v2 = qword_100015160;
  if (!qword_100015160)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for UInt32,  &type metadata for UInt32);
    atomic_store(v0, (unint64_t *)&qword_100015160);
    return v0;
  }

  return v2;
}

unint64_t sub_100004948()
{
  uint64_t v2 = qword_1000155E0;
  if (!qword_1000155E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000155E0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000049B0()
{
  uint64_t v2 = qword_100015170;
  if (!qword_100015170)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015170);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_100004A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100004A70(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100004A84( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_100004AC8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }
}

void sub_100004B34()
{
  void *v0 = *v0;
}

void *sub_100004B40(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  uint64_t v4 = (void *)_swift_stdlib_bridgeErrorToNSError(v1);
  id v2 = v4;
  swift_unknownObjectRelease(v4);
  return v4;
}

uint64_t sub_100004B80(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100004BA0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = v3;
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_100004C1C;
  return v6();
}

uint64_t sub_100004C1C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100004C7C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = v4;
  unint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  NSString v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 24) = v5;
  *NSString v5 = *(void *)(v4 + 16);
  v5[1] = sub_100004CF8;
  return v7();
}

uint64_t sub_100004CF8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100004D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 48))(a1, 1LL) == 1)
  {
    sub_100005BD4(a1);
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

  uint64_t v6 = swift_allocObject(&unk_1000108C8, 32LL);
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

  return swift_task_create(v15 | 0x1C00, v7, (char *)&type metadata for () + 8, &unk_100015298, v6);
}

uint64_t sub_100004F78(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  NSString v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100004FFC;
  return v5(a1);
}

uint64_t sub_100004FFC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

_BYTE **sub_100005060(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100005074()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

_BYTE **sub_10000509C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100005060(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000050A4()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

_BYTE **sub_1000050CC(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100005060(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000050D4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100005110()
{
  return sub_100004B40(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000511C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100005158()
{
  return sub_100004B80(*(uint64_t (**)(void))(v0 + 16));
}

void sub_100005164(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v7 = (id)a4();
  uint64_t v8 = *a1;
  uint64_t v9 = *a1 + 8;
  if (v7)
  {
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8, v9);
  }

  else
  {
    uint64_t v11 = 0LL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8, v9);
  }

  *a1 = v8 + 8;
  uint64_t v4 = *a2;
  if (*a2)
  {
    *uint64_t v4 = v7;
    *a2 = v4 + 1;
  }

  else
  {
  }

uint64_t sub_1000052A0()
{
  return swift_deallocObject(v2, 32LL);
}

void sub_1000052DC(uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t sub_1000052E8(uint64_t *a1)
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

unint64_t sub_100005354()
{
  uint64_t v3 = qword_100015180;
  if (!qword_100015180)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRPosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100015180);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_1000053B8()
{
  return swift_deallocObject(v2, 24LL);
}

void sub_1000053F4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1000053FC()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100005450()
{
  *(void *)(v1 + 16) = v1;
  id v7 = (void *)v0[2];
  uint64_t v4 = (void *)v0[3];
  NSString v5 = (const void *)v0[4];
  uint64_t v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_10001519C);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_100005508;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_100015198 + dword_100015198))( v7,  v4,  v5,  v6);
}

uint64_t sub_100005508()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for PosterUpdater()
{
  return objc_opt_self(&OBJC_CLASS____TtC16RetailDemoPoster13PosterUpdater);
}

uint64_t type metadata accessor for AutoresizingMask(uint64_t a1)
{
  uint64_t v5 = qword_100015230;
  if (!qword_100015230)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100010850);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100015230);
      return v2;
    }
  }

  return v5;
}

unint64_t sub_10000562C()
{
  return sub_100005640();
}

unint64_t sub_100005640()
{
  uint64_t v3 = qword_100015238;
  if (!qword_100015238)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E3B0, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015238);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000056B0()
{
  return sub_1000056C4();
}

unint64_t sub_1000056C4()
{
  uint64_t v3 = qword_100015240;
  if (!qword_100015240)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E428, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015240);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100005734()
{
  return sub_100005748();
}

unint64_t sub_100005748()
{
  uint64_t v3 = qword_100015248;
  if (!qword_100015248)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E384, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015248);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000057B8()
{
  return sub_1000057CC();
}

unint64_t sub_1000057CC()
{
  uint64_t v3 = qword_100015250;
  if (!qword_100015250)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E350, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015250);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000583C()
{
  uint64_t v3 = qword_100015258;
  if (!qword_100015258)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E3EC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015258);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000058AC()
{
  uint64_t v2 = qword_100015260;
  if (!qword_100015260)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt, &type metadata for UInt);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015260);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_100005914()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100005958()
{
  *(void *)(v1 + 16) = v1;
  uint64_t v6 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100015274);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_100005A10;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100015270 + dword_100015270))(v6, v4, v5);
}

uint64_t sub_100005A10()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100005A70()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100005AB4(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  id v7 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_100015284);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100005B74;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100015280 + dword_100015280))( a1,  v5,  v6,  v7);
}

uint64_t sub_100005B74()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100005BD4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_100005C44()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100005C80(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc(dword_100015294);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100005D28;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100015290 + dword_100015290))(a1, v5);
}

uint64_t sub_100005D28()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for TVISScreenSaverType(uint64_t a1)
{
  uint64_t v5 = qword_1000152A0;
  if (!qword_1000152A0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_1000108F0);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000152A0);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for PRRenderingEventType(uint64_t a1)
{
  uint64_t v5 = qword_1000152A8;
  if (!qword_1000152A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100010918);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000152A8);
      return v2;
    }
  }

  return v5;
}

unint64_t sub_100005EC8()
{
  return sub_100005EDC();
}

unint64_t sub_100005EDC()
{
  uint64_t v3 = qword_1000152B0;
  if (!qword_1000152B0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E570, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152B0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100005F4C()
{
  return sub_100005F60();
}

unint64_t sub_100005F60()
{
  uint64_t v3 = qword_1000152B8;
  if (!qword_1000152B8)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E544, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152B8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100005FD0()
{
  return sub_100005FE4();
}

unint64_t sub_100005FE4()
{
  uint64_t v3 = qword_1000152C0;
  if (!qword_1000152C0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E7D8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152C0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100006054()
{
  return sub_100006068();
}

unint64_t sub_100006068()
{
  uint64_t v3 = qword_1000152C8;
  if (!qword_1000152C8)
  {
    uint64_t v0 = type metadata accessor for TVISScreenSaverType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E6AC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152C8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000060D8()
{
  return sub_1000060EC();
}

unint64_t sub_1000060EC()
{
  uint64_t v3 = qword_1000152D0;
  if (!qword_1000152D0)
  {
    uint64_t v0 = type metadata accessor for TVISScreenSaverType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E680, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152D0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000615C()
{
  return sub_100006170();
}

unint64_t sub_100006170()
{
  uint64_t v3 = qword_1000152D8;
  if (!qword_1000152D8)
  {
    uint64_t v0 = type metadata accessor for TVISScreenSaverType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E71C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152D8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000061E0()
{
  uint64_t v3 = qword_1000152E0;
  if (!qword_1000152E0)
  {
    uint64_t v0 = type metadata accessor for TVISScreenSaverType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E6E8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152E0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100006250()
{
  uint64_t v2 = qword_1000152E8;
  if (!qword_1000152E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152E8);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000062B8()
{
  uint64_t v3 = qword_1000152F0;
  if (!qword_1000152F0)
  {
    uint64_t v0 = type metadata accessor for TVISScreenSaverType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E748, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152F0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100006328()
{
  uint64_t v3 = qword_1000152F8;
  if (!qword_1000152F8)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E5AC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000152F8);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100006398()
{
  uint64_t v2 = qword_100015300;
  if (!qword_100015300)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015300);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100006400()
{
  uint64_t v3 = qword_100015308;
  if (!qword_100015308)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E5E0, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015308);
    return WitnessTable;
  }

  return v3;
}

id sub_100006470(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_1000064A8(a1);
}

id sub_1000064A8(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v1);
  uint64_t v18 = a1;
  id v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  uint64_t v5 = v1;
  id v19 = v1;
  *(void *)&v1[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel] = 0LL;

  *(void *)&v1[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state] = 0LL;
  uint64_t v11 = (void **)&v1[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel];
  swift_beginAccess(&v1[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel]);
  uint64_t v6 = *v11;
  void *v11 = 0LL;

  swift_endAccess(v17);
  id v7 = a1;
  *(void *)&v12[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_serviceProxy] = a1;

  v16.receiver = v19;
  v16.super_class = ObjectType;
  id v15 = objc_msgSendSuper2(&v16, "init");
  id v8 = v15;
  id v9 = v15;
  id v19 = v15;
  sub_100006618();

  return v15;
}

uint64_t sub_100006618()
{
  uint64_t v11 = 0LL;
  uint64_t v1 = sub_1000052E8(&qword_100015268);
  unint64_t v9 = (*(void *)(*(void *)(v1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v1);
  id v10 = (char *)&v8 - v9;
  uint64_t v11 = v0;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56LL))(v10, 1LL);
  id v3 = v0;
  uint64_t v4 = (void *)swift_allocObject(&unk_100010AD8, 40LL);
  uint64_t v5 = (uint64_t)v10;
  v4[2] = 0LL;
  v4[3] = 0LL;
  v4[4] = v0;
  uint64_t v6 = sub_100007DA4(v5, (uint64_t)&unk_100015458, (uint64_t)v4, (uint64_t)&type metadata for () + 8);
  return swift_release(v6);
}

uint64_t sub_1000066FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[33] = a4;
  v4[23] = v4;
  v4[24] = 0LL;
  v4[25] = 0LL;
  v4[27] = 0LL;
  v4[29] = 0LL;
  v4[32] = 0LL;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v4[34] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[35] = v6;
  v4[36] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000052E8(&qword_100015268);
  v4[37] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v4[24] = a4;
  return swift_task_switch(sub_1000067C4, 0LL);
}

uint64_t sub_1000067C4()
{
  uint64_t v3 = *(void *)(v0 + 264);
  *(void *)(v0 + 184) = v0;
  swift_beginAccess(&TVISAmbientSnapshotQueryIntentSwitcher);
  uint64_t v4 = TVISAmbientSnapshotQueryIntentSwitcher;
  swift_endAccess(v0 + 120);
  *(void *)(v0 + 200) = v4;
  id v5 = *(id *)(v3 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_serviceProxy);
  *(void *)(v0 + 304) = v5;
  id v1 = v5;
  *(void *)(v0 + 16) = *(void *)(v0 + 184);
  *(void *)(v0 + 56) = v0 + 208;
  *(void *)(v0 + 24) = sub_1000068E8;
  *(void *)(v0 + 112) = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(_DWORD *)(v0 + 88) = 0x40000000;
  *(_DWORD *)(v0 + 92) = 0;
  *(void *)(v0 + 96) = sub_1000075D0;
  *(void *)(v0 + 104) = &unk_100010C70;
  [v5 queryCurrentSnapshotWithIntent:v4 reply:v0 + 80];
  return j__swift_continuation_await(v0 + 16);
}

uint64_t sub_1000068E8()
{
  id v1 = (void *)*v0;
  v1[23] = *v0;
  uint64_t v2 = v1[6];
  v1[39] = v2;
  if (v2) {
    return swift_task_switch(sub_100006E44, 0LL);
  }
  else {
    return swift_task_switch(sub_100006988, 0LL);
  }
}

uint64_t sub_100006988()
{
  id v1 = (void *)v0[38];
  v0[23] = v0;
  uint64_t v29 = (void *)v0[26];
  v0[29] = v29;

  swift_unknownObjectRetain(v29);
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___TVISRetailDemoScreenSaver);
  uint64_t v30 = swift_dynamicCastObjCClass(v29, v2);
  if (v30)
  {
    v27 = (void *)v30;
  }

  else
  {
    swift_unknownObjectRelease(v29);
    v27 = 0LL;
  }

  if (v27)
  {
    uint64_t v24 = v28[37];
    id v21 = (id)v28[33];
    v28[32] = v27;
    uint64_t v3 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v24, 1LL);
    uint64_t v23 = swift_allocObject(&unk_100010B00, 24LL);
    id v4 = v21;
    swift_unknownObjectWeakInit(v23 + 16, v21);

    swift_retain(v23);
    id v5 = v27;
    type metadata accessor for MainActor(0LL);
    uint64_t v22 = static MainActor.shared.getter();
    uint64_t v25 = (void *)swift_allocObject(&unk_100010D88, 48LL);
    v25[2] = v22;
    v25[3] = &protocol witness table for MainActor;
    v25[4] = v23;
    v25[5] = v27;
    swift_release(v23);
    uint64_t v6 = sub_100007DA4(v24, (uint64_t)&unk_100015608, (uint64_t)v25, (uint64_t)&type metadata for () + 8);
    swift_release(v6);

    swift_unknownObjectRelease(v29);
    uint64_t v26 = v28[36];
    swift_task_dealloc(v28[37]);
    swift_task_dealloc(v26);
    return (*(uint64_t (**)(void))(v28[23] + 8LL))();
  }

  else
  {
    swift_unknownObjectRetain(v29);
    v28[21] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(23LL, 2LL);
    v28[22] = v8;
    Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Expected ", 9uLL, 1);
    object = v9._object;
    DefaultStringInterpolation.appendLiteral(_:)(v9);
    swift_bridgeObjectRelease(object);
    swift_beginAccess(&TVISScreenSaverTypeRetailDemo);
    uint64_t v15 = TVISScreenSaverTypeRetailDemo;
    swift_endAccess(v28 + 18);
    v28[30] = v15;
    type metadata accessor for TVISScreenSaverType(0LL);
    DefaultStringInterpolation.appendInterpolation<A>(_:)(v28 + 30);
    Swift::String v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" but received ", 0xEuLL, 1);
    objc_super v16 = v10._object;
    DefaultStringInterpolation.appendLiteral(_:)(v10);
    swift_bridgeObjectRelease(v16);
    swift_getObjectType(v29);
    swift_unknownObjectRetain(v29);
    id v17 = [v29 type];
    swift_unknownObjectRelease(v29);
    v28[31] = v17;
    DefaultStringInterpolation.appendInterpolation<A>(_:)(v28 + 31);
    Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
    uint64_t v18 = v11._object;
    DefaultStringInterpolation.appendLiteral(_:)(v11);
    swift_bridgeObjectRelease(v18);
    uint64_t v20 = v28[21];
    uint64_t v19 = v28[22];
    swift_bridgeObjectRetain();
    sub_10000B94C((uint64_t)(v28 + 21));
    uint64_t v12 = String.init(stringInterpolation:)(v20, v19);
    return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v12,  v13,  "RetailDemoPoster/PosterPresenter.swift",  38LL);
  }

uint64_t sub_100006E44()
{
  uint64_t v20 = v0[39];
  id v17 = (id)v0[38];
  uint64_t v16 = v0[36];
  uint64_t v18 = v0[35];
  uint64_t v19 = v0[34];
  v0[23] = v0;
  swift_willThrow();

  swift_errorRetain(v20);
  v0[27] = v20;
  uint64_t v1 = sub_10000BAC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v1, v19);
  swift_errorRetain(v20);
  uint64_t v24 = swift_allocObject(&unk_100010C98, 24LL);
  *(void *)(v24 + 16) = v20;
  sub_100003768();
  uint64_t v3 = swift_bridgeObjectRelease(v2);
  uint64_t v32 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v33 = static os_log_type_t.error.getter();
  v0[28] = 12LL;
  unint64_t v21 = sub_1000048E0();
  unint64_t v22 = sub_100004948();
  unint64_t v4 = sub_1000049B0();
  UnsignedInteger<>.init<A>(_:)(v0 + 40, v0 + 28, &type metadata for UInt32, &type metadata for Int, v21, v22, v4);
  uint32_t v23 = *((_DWORD *)v0 + 80);
  uint64_t v27 = swift_allocObject(&unk_100010CC0, 17LL);
  *(_BYTE *)(v27 + 16) = 64;
  uint64_t v28 = swift_allocObject(&unk_100010CE8, 17LL);
  *(_BYTE *)(v28 + 16) = 8;
  uint64_t v25 = swift_allocObject(&unk_100010D10, 32LL);
  *(void *)(v25 + 16) = sub_10000B74C;
  *(void *)(v25 + 24) = v24;
  uint64_t v26 = swift_allocObject(&unk_100010D38, 32LL);
  *(void *)(v26 + 16) = sub_10000B8B0;
  *(void *)(v26 + 24) = v25;
  uint64_t v30 = swift_allocObject(&unk_100010D60, 32LL);
  *(void *)(v30 + 16) = sub_10000B8F8;
  *(void *)(v30 + 24) = v26;
  sub_1000052E8((uint64_t *)&unk_1000155F0);
  uint64_t v29 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v31 = v5;
  swift_retain(v27);
  *uint64_t v31 = sub_10000B83C;
  v31[1] = v27;
  swift_retain(v28);
  v31[2] = sub_10000B86C;
  v31[3] = v28;
  swift_retain(v30);
  v31[4] = sub_10000B940;
  v31[5] = v30;
  sub_100003790();
  swift_bridgeObjectRelease(v29);
  if (os_log_type_enabled(v32, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v11 = sub_1000052E8(&qword_100015188);
    uint64_t v13 = sub_100004A18(1LL, v11, v11);
    uint64_t v14 = sub_100004A18(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v34 = buf;
    uint64_t v35 = v13;
    uint64_t v36 = v14;
    sub_100004A70(2LL, &v34);
    sub_100004A70(1LL, &v34);
    Builtin::Word v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B83C;
    uint64_t v38 = v27;
    sub_100004A84(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    Builtin::Word v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B86C;
    uint64_t v38 = v28;
    sub_100004A84(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    Builtin::Word v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B940;
    uint64_t v38 = v30;
    sub_100004A84(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "failed to update view model: %@", buf, v23);
    sub_100004AC8(v13, 1LL);
    sub_100004AC8(v14, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_release(v27);
    swift_release(v28);
    swift_release(v30);
  }

  else
  {
    swift_release(v27);
    swift_release(v28);
    swift_release(v30);
  }

  uint64_t v8 = v15[36];
  uint64_t v7 = v15[35];
  uint64_t v9 = v15[34];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v10 = v15[36];
  swift_task_dealloc(v15[37]);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v15[23] + 8LL))();
}

uint64_t sub_100007494()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_1000074D8(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_100015454);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100007570;
  return sub_1000066FC(a1, v5, v6, v7);
}

uint64_t sub_100007570()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000075D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  if (a3)
  {
    swift_errorRetain(a3);
    uint64_t v6 = sub_1000052E8(&qword_100015670);
    sub_1000076E8(v11, (uint64_t)a3, v6);
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
    uint64_t v4 = sub_1000052E8(&qword_100015670);
    sub_100007740(v11, (uint64_t)&v12, v4);
  }

  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000076E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = a3;
  v7[0] = a2;
  uint64_t v3 = sub_1000052E8(&qword_100015678);
  return sub_10000B7A4((uint64_t)v7, a1, a3, v3, (uint64_t)&protocol self-conformance witness table for Error);
}

uint64_t sub_100007740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B754(a2, a1, a3);
}

uint64_t sub_100007790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a5;
  v5[16] = a4;
  v5[11] = v5;
  v5[12] = 0LL;
  v5[13] = 0LL;
  v5[14] = 0LL;
  v5[15] = 0LL;
  v5[12] = a4 + 16;
  v5[13] = a5;
  uint64_t v7 = type metadata accessor for MainActor(0LL);
  v5[18] = static MainActor.shared.getter(v7);
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_100007834, v8);
}

uint64_t sub_100007834()
{
  uint64_t v12 = *(void *)(v0 + 128);
  *(void *)(v0 + 88) = v0;
  swift_beginAccess(v12 + 16);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v12 + 16);
  swift_endAccess(v0 + 16);
  if (Strong)
  {
    v11[14] = Strong;
    uint64_t v9 = (id *)&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel]);
    id v10 = *v9;
    id v1 = *v9;
    swift_endAccess(v11 + 5);
    if (v10)
    {
      uint64_t v2 = v11[17];
      v11[15] = v10;
      AerialScreenSaverViewModel.update(model:)(v2);
    }

    else
    {
      id v6 = (id)v11[17];
      type metadata accessor for AerialScreenSaverViewModel(0LL);
      id v3 = v6;
      uint64_t v8 = AerialScreenSaverViewModel.__allocating_init(model:playbackStartStyle:renderingContext:onReadyForDisplay:)( v6,  1LL,  1LL,  0LL,  sub_100007A80);
      uint64_t v7 = (void **)&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel];
      swift_beginAccess(&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel]);
      uint64_t v4 = *v7;
      *uint64_t v7 = (void *)v8;

      swift_endAccess(v11 + 8);
      sub_100007A94();
    }
  }

  swift_release(v11[18]);
  return (*(uint64_t (**)(void))(v11[11] + 8LL))();
}

uint64_t sub_100007A80()
{
  return static IdlePosterContentAvailableNotification.notify()();
}

void sub_100007A94()
{
  uint64_t v32 = 0LL;
  id v30 = 0LL;
  id v28 = 0LL;
  unint64_t v21 = (id *)(v0 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
  swift_beginAccess(v0 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
  id v22 = *v21;
  id v1 = *v21;
  swift_endAccess(v31);
  if (v22)
  {
    id v30 = v22;
    uint64_t v18 = (id *)(v20 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state);
    swift_beginAccess(v20 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state);
    id v19 = *v18;
    id v2 = *v18;
    swift_endAccess(v29);
    if (v19)
    {
      id v28 = v19;
      AerialScreenSaverView.init(delegate:)(v26, 0LL);
      uint64_t v13 = type metadata accessor for AerialScreenSaverViewModel(0LL);
      unint64_t v14 = sub_100007FCC();
      unint64_t v3 = sub_100008034();
      View.environmentObject<A>(_:)(v22, &type metadata for AerialScreenSaverView, v13, v14, v3);
      sub_1000080A4((uint64_t)v26);
      sub_1000052E8((uint64_t *)&unk_100015470);
      sub_1000080E4((uint64_t)v27, v25);
      uint64_t v24 = (void *)_UIHostingView.__allocating_init(rootView:)(v25);
      id v15 = [v19 backgroundView];
      [v15 bounds];
      objc_msgSend(v24, "setFrame:", v4, v5, v6, v7);

      id v8 = v24;
      uint64_t v9 = type metadata accessor for AutoresizingMask(0LL);
      uint64_t v10 = _allocateUninitializedArray<A>(_:)(2LL);
      void *v11 = 2LL;
      v11[1] = 16LL;
      sub_100003790();
      uint64_t v16 = v10;
      unint64_t v12 = sub_1000056C4();
      SetAlgebra<>.init(arrayLiteral:)(v16, v9, v12);
      [v24 setAutoresizingMask:v23];

      id v17 = [v19 backgroundView];
      [v17 addSubview:v24];

      sub_100008194((uint64_t)v27);
    }

    else
    {
    }
  }

uint64_t sub_100007DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    sub_100005BD4(a1);
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

  double v7 = (void *)swift_allocObject(&unk_100010C58, 40LL);
  void v7[2] = a4;
  v7[3] = a2;
  v7[4] = a3;
  id v8 = 0LL;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v23[2] = v11;
    v23[3] = v12;
    id v8 = v23;
  }

  return swift_task_create(v16 | 0x1C00, v8, a4, &unk_1000155D0, v7);
}

unint64_t sub_100007FCC()
{
  uint64_t v2 = qword_100015460;
  if (!qword_100015460)
  {
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for AerialScreenSaverView,  &type metadata for AerialScreenSaverView);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015460);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100008034()
{
  uint64_t v3 = qword_100015468;
  if (!qword_100015468)
  {
    uint64_t v0 = type metadata accessor for AerialScreenSaverViewModel(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for AerialScreenSaverViewModel, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015468);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_1000080A4(uint64_t a1)
{
  return a1;
}

void *sub_1000080E4(uint64_t a1, void *a2)
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

uint64_t sub_100008194(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000081EC()
{
}

uint64_t sub_100008210()
{
  if (!"RetailDemoPoster.PosterPresenter")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_10000A758( (uint64_t)"RetailDemoPoster.PosterPresenter",  32LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"RetailDemoPoster/PosterPresenter.swift",  38LL,  2,  v2,  0xFuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_100008340()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000083E8( id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100008410( id *a1)
{
}

uint64_t sub_100008438(void *a1, uint64_t a2)
{
  id v22 = a1;
  uint64_t v15 = a2;
  uint64_t v21 = &protocol witness table for MainActor;
  uint64_t v28 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v16 = (*(void *)(*(void *)(sub_1000052E8(&qword_100015268) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v24 = (uint64_t)&v15 - v16;
  uint64_t v28 = __chkstk_darwin(v22);
  uint64_t v27 = v3;
  uint64_t v26 = v2;
  uint64_t v18 = 0LL;
  uint64_t v4 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v24, 1LL);
  uint64_t v19 = 7LL;
  uint64_t v23 = swift_allocObject(&unk_100010B00, 24LL);
  id v5 = v17;
  swift_unknownObjectWeakInit(v23 + 16, v17);

  swift_retain(v23);
  id v6 = v22;
  uint64_t v7 = type metadata accessor for MainActor(v18);
  uint64_t v20 = static MainActor.shared.getter(v7);
  uint64_t v8 = swift_allocObject(&unk_100010B28, 48LL);
  uint64_t v9 = v21;
  id v10 = v22;
  uint64_t v11 = (void *)v8;
  uint64_t v12 = v23;
  uint64_t v25 = v11;
  v11[2] = v20;
  v11[3] = v9;
  v11[4] = v12;
  v11[5] = v10;
  swift_release(v12);
  uint64_t v13 = sub_100007DA4(v24, (uint64_t)&unk_100015488, (uint64_t)v25, (uint64_t)&type metadata for () + 8);
  return swift_release(v13);
}

uint64_t sub_1000085DC()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_100008618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[13] = a5;
  v5[12] = a4;
  v5[8] = v5;
  v5[9] = 0LL;
  v5[10] = 0LL;
  v5[11] = 0LL;
  v5[9] = a4 + 16;
  v5[10] = a5;
  uint64_t v7 = type metadata accessor for MainActor(0LL);
  v5[14] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000086B8, v8);
}

uint64_t sub_1000086B8()
{
  uint64_t v7 = *(void *)(v0 + 96);
  *(void *)(v0 + 64) = v0;
  swift_beginAccess(v7 + 16);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v7 + 16);
  swift_endAccess(v0 + 16);
  if (Strong)
  {
    id v5 = (void *)v6[13];
    v6[11] = Strong;
    id v1 = v5;
    uint64_t v4 = (void **)&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state]);
    uint64_t v2 = *v4;
    *uint64_t v4 = v5;

    swift_endAccess(v6 + 5);
    sub_100007A94();
  }

  swift_release(v6[14]);
  return (*(uint64_t (**)(void))(v6[8] + 8LL))();
}

uint64_t sub_100008804()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_100008850(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100015484);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_1000088F4;
  return sub_100008618(a1, v5, v6, v7, v8);
}

uint64_t sub_1000088F4()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100008A70(uint64_t a1)
{
  uint64_t v11 = a1;
  id v17 = &protocol witness table for MainActor;
  uint64_t v22 = 0LL;
  uint64_t v21 = 0LL;
  unint64_t v12 = (*(void *)(*(void *)(sub_1000052E8(&qword_100015268) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v19 = (uint64_t)&v11 - v12;
  uint64_t v22 = __chkstk_darwin(v11);
  uint64_t v21 = v1;
  uint64_t v14 = 0LL;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(v19, 1LL);
  uint64_t v15 = 7LL;
  uint64_t v18 = swift_allocObject(&unk_100010B00, 24LL);
  id v3 = v13;
  swift_unknownObjectWeakInit(v18 + 16, v13);

  swift_retain(v18);
  uint64_t v4 = type metadata accessor for MainActor(v14);
  uint64_t v16 = static MainActor.shared.getter(v4);
  uint64_t v5 = swift_allocObject(&unk_100010B50, 40LL);
  uint64_t v6 = v17;
  uint64_t v7 = (void *)v5;
  uint64_t v8 = v18;
  uint64_t v20 = v7;
  void v7[2] = v16;
  v7[3] = v6;
  v7[4] = v8;
  swift_release(v8);
  uint64_t v9 = sub_100007DA4(v19, (uint64_t)&unk_100015498, (uint64_t)v20, (uint64_t)&type metadata for () + 8);
  return swift_release(v9);
}

uint64_t sub_100008BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a4;
  v4[8] = v4;
  v4[9] = 0LL;
  v4[10] = 0LL;
  v4[9] = a4 + 16;
  uint64_t v6 = type metadata accessor for MainActor(0LL);
  v4[12] = static MainActor.shared.getter(v6);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008C80, v7);
}

uint64_t sub_100008C80()
{
  uint64_t v5 = *(void *)(v0 + 88);
  *(void *)(v0 + 64) = v0;
  swift_beginAccess(v5 + 16);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v5 + 16);
  swift_endAccess(v0 + 16);
  if (Strong)
  {
    v4[10] = Strong;
    id v3 = (void **)&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_state]);
    uint64_t v1 = *v3;
    *id v3 = 0LL;

    swift_endAccess(v4 + 5);
  }

  swift_release(v4[12]);
  return (*(uint64_t (**)(void))(v4[8] + 8LL))();
}

uint64_t sub_100008DA4()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_100008DE8(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  id v3 = (void *)swift_task_alloc(dword_100015494);
  *(void *)(v2 + 24) = v3;
  *id v3 = *(void *)(v2 + 16);
  v3[1] = sub_100008E80;
  return sub_100008BF4(a1, v5, v6, v7);
}

uint64_t sub_100008E80()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100008F34(uint64_t a1, void *a2)
{
  uint64_t v18 = a1;
  id v24 = a2;
  uint64_t v23 = &protocol witness table for MainActor;
  uint64_t v28 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v19 = (*(void *)(*(void *)(sub_1000052E8(&qword_100015268) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v25 = (char *)&v17 - v19;
  uint64_t v28 = __chkstk_darwin(v18);
  uint64_t v27 = v3;
  uint64_t v26 = v2;
  uint64_t v20 = 0LL;
  uint64_t v4 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 56LL))(v25, 1LL);
  id v5 = v24;
  id v6 = v21;
  uint64_t v7 = type metadata accessor for MainActor(v20);
  uint64_t v8 = static MainActor.shared.getter(v7);
  id v9 = v21;
  uint64_t v22 = v8;
  uint64_t v10 = swift_allocObject(&unk_100010B78, 48LL);
  uint64_t v11 = v23;
  id v12 = v24;
  id v13 = (void *)v10;
  uint64_t v14 = (uint64_t)v25;
  v13[2] = v22;
  v13[3] = v11;
  v13[4] = v12;
  v13[5] = v9;
  uint64_t v15 = sub_100007DA4(v14, (uint64_t)&unk_1000154A8, (uint64_t)v13, (uint64_t)&type metadata for () + 8);
  return swift_release(v15);
}

uint64_t sub_100009084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[21] = a5;
  v5[20] = a4;
  v5[11] = v5;
  v5[12] = 0LL;
  v5[13] = 0LL;
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v7 = type metadata accessor for MainActor(0LL);
  v5[22] = static MainActor.shared.getter(v7);
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009120, v8);
}

uint64_t sub_100009120()
{
  uint64_t v1 = *(void **)(v0 + 160);
  *(void *)(v0 + 88) = v0;
  id v27 = [v1 type];
  id v2 = v27;
  uint64_t v26 = PRRenderingEventTypeSwipeLeft;
  id v3 = PRRenderingEventTypeSwipeLeft;
  *(void *)(v0 + 112) = v26;
  *(void *)(v0 + 120) = v27;
  type metadata accessor for PRRenderingEventType(0LL);
  sub_100005FE4();
  char v28 = dispatch thunk of static Equatable.== infix(_:_:)(v0 + 112, v0 + 120);
  sub_10000B4A4((id *)(v0 + 112));
  if ((v28 & 1) != 0)
  {
    uint64_t v23 = *(void *)(v25 + 168);

    id v24 = (id *)(v23 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
    swift_beginAccess(v23 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
    if (*v24)
    {
      id v22 = *v24;
      id v4 = *v24;
      swift_endAccess(v25 + 64);
      AerialScreenSaverViewModel.onRequestNextAsset()();
    }

    else
    {
      swift_endAccess(v25 + 64);
    }
  }

  else
  {

    id v5 = v27;
    uint64_t v20 = PRRenderingEventTypeSwipeRight;
    id v6 = PRRenderingEventTypeSwipeRight;
    *(void *)(v25 + 128) = v20;
    *(void *)(v25 + 136) = v27;
    char v21 = dispatch thunk of static Equatable.== infix(_:_:)(v25 + 128, v25 + 136);
    sub_10000B4A4((id *)(v25 + 128));
    if ((v21 & 1) != 0)
    {
      uint64_t v18 = *(void *)(v25 + 168);

      unint64_t v19 = (id *)(v18 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
      swift_beginAccess(v18 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
      if (*v19)
      {
        id v17 = *v19;
        id v7 = *v19;
        swift_endAccess(v25 + 40);
        AerialScreenSaverViewModel.onRequestPreviousAsset()();
      }

      else
      {
        swift_endAccess(v25 + 40);
      }
    }

    else
    {

      id v8 = v27;
      uint64_t v15 = PRRenderingEventTypeTap;
      id v9 = PRRenderingEventTypeTap;
      *(void *)(v25 + 144) = v15;
      *(void *)(v25 + 152) = v27;
      char v16 = dispatch thunk of static Equatable.== infix(_:_:)(v25 + 144, v25 + 152);
      sub_10000B4A4((id *)(v25 + 144));
      if ((v16 & 1) == 0)
      {

        goto LABEL_15;
      }

      uint64_t v13 = *(void *)(v25 + 168);

      uint64_t v14 = (id *)(v13 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
      swift_beginAccess(v13 + OBJC_IVAR____TtC16RetailDemoPoster15PosterPresenter_viewModel);
      if (*v14)
      {
        id v12 = *v14;
        id v10 = *v14;
        swift_endAccess(v25 + 16);
        AerialScreenSaverViewModel.onRequestToggleOverlay()();
      }

      else
      {
        swift_endAccess(v25 + 16);
      }
    }
  }

LABEL_15:
  swift_release(*(void *)(v25 + 176));
  return (*(uint64_t (**)(void))(*(void *)(v25 + 88) + 8LL))();
}

uint64_t sub_1000095AC()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_1000095F8(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  id v3 = (void *)swift_task_alloc(dword_1000154A4);
  *(void *)(v2 + 24) = v3;
  *id v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000969C;
  return sub_100009084(a1, v5, v6, v7, v8);
}

uint64_t sub_10000969C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000098A8()
{
  return _allocateUninitializedArray<A>(_:)(0LL);
}

unint64_t sub_1000098E8()
{
  uint64_t v3 = qword_1000154B0;
  if (!qword_1000154B0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PREditingLook);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000154B0);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_100009A80()
{
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100009B48(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc(dword_1000154BC);
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_100009BE8;
  return sub_100009A80();
}

uint64_t sub_100009BE8()
{
  uint64_t v6 = *v0;
  uint64_t v1 = *(void *)(*v0 + 48);
  aBlock = *(void (***)(void))(*v0 + 40);
  uint64_t v3 = *(void **)(*v0 + 32);
  id v4 = *(void **)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);

  aBlock[2]();
  _Block_release(aBlock);
  return (*(uint64_t (**)(void))(*(void *)(v6 + 16) + 8LL))();
}

uint64_t sub_100009C84()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_100009CD0()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  uint64_t v6 = (void *)v0[2];
  id v4 = (const void *)v0[3];
  id v5 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_1000154C4);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_100009D7C;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_1000154C0 + dword_1000154C0))( v6,  v4,  v5);
}

uint64_t sub_100009D7C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

  ;
}

uint64_t type metadata accessor for PosterPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC16RetailDemoPoster15PosterPresenter);
}

void *sub_100009E70(void *a1, id *a2)
{
  id v4 = *a2;
  id v2 = *a2;
  uint64_t result = a1;
  *a1 = v4;
  return result;
}

void sub_100009EA4(id *a1)
{
}

void *sub_100009EBC(void *a1, id *a2)
{
  id v4 = *a2;
  id v2 = *a2;
  uint64_t result = a1;
  *a1 = v4;
  return result;
}

id *sub_100009EF0(id *a1, id *a2)
{
  id v5 = *a1;
  id v4 = *a2;
  id v2 = *a2;
  *a1 = v4;

  return a1;
}

void *sub_100009F38(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **sub_100009F44(void **a1, void **a2)
{
  id v2 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_100009F78(uint64_t a1, unsigned int a2)
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

uint64_t sub_10000A0EC(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10000A2E8(uint64_t a1)
{
  unint64_t v1 = sub_10000A324();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48LL))(a1, 1LL);
}

unint64_t sub_10000A324()
{
  uint64_t v3 = qword_1000154F8;
  if (!qword_1000154F8)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRRenderer);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000154F8);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10000A38C(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = sub_10000A324();
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, a2, 1LL);
}

void *type metadata accessor for PosterPresenter.State()
{
  return &unk_100010C38;
}

uint64_t sub_10000A3E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_10000A414(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
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

uint64_t sub_10000A758@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
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
  os_log_type_t v33 = "Swift/Integers.swift";
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
        id v17 = &v16;
        __chkstk_darwin();
        uint64_t v14 = sub_10000AEB0;
        uint64_t v15 = &v37;
        sub_10000A414((uint64_t (*)(uint64_t *, uint64_t))sub_10000AEF0, (uint64_t)&v13, v11);
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
    return sub_10000AB1C(v16, v23, v24, v25, v26, v20, v21, v27, v19, v28);
  }
  LOBYTE(v13) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v29, 11LL, 2LL, v34, 39LL, 2LL, v35, 31LL, v13, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000AB1C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
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
  os_log_type_t v33 = "UnsafeBufferPointer with negative count";
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
        id v17 = &v15;
        __chkstk_darwin();
        int v13 = sub_10000B460;
        uint64_t v14 = &v36;
        sub_10000A414((uint64_t (*)(uint64_t *, uint64_t))sub_10000B47C, (uint64_t)&v12, v10);
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
    return sub_10000AF18(v16, v23, v24, v25, v20, v21, v26, v27);
  }
  LOBYTE(v12) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v28, 11LL, 2LL, v33, 39LL, 2LL, v34, 31LL, v12, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000AEB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000AB1C( a1,  a2,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(_BYTE *)(v3 + 32),  *(void *)(v3 + 40),  *(void *)(v3 + 48),  *(void *)(v3 + 56),  a3,  *(void *)(v3 + 64));
}

uint64_t sub_10000AEF0(uint64_t a1, uint64_t a2)
{
  return sub_10000A3E4(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_10000AF18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
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
  os_log_type_t v33 = "Swift/AssertCommon.swift";
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

uint64_t sub_10000B460(uint64_t a1, uint64_t a2)
{
  return sub_10000AF18( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56));
}

uint64_t sub_10000B47C(uint64_t a1, uint64_t a2)
{
  return sub_10000A3E4(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000B4A4( id *a1)
{
}

uint64_t sub_10000B4CC(uint64_t a1, int *a2)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000B550;
  return v5(a1);
}

uint64_t sub_10000B550()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000B5B4()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_10000B5F8(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_1000155CC);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000B6AC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000155C8 + dword_1000155C8))(a1, v5);
}

uint64_t sub_10000B6AC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000B710()
{
  return swift_deallocObject(v1, 24LL);
}

uint64_t sub_10000B74C()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_1000081EC();
  return result;
}

uint64_t sub_10000B754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume(a2);
}

uint64_t sub_10000B7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocError(a4, a5, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v5, a1);
  return swift_continuation_throwingResumeWithError(a2, v9);
}

uint64_t sub_10000B814()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B83C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100005060(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B844()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B86C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100005060(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B874()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000B8B0()
{
  return sub_100004B40(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B8BC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000B8F8()
{
  return sub_100004B80(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B904()
{
  return swift_deallocObject(v2, 32LL);
}

void sub_10000B940(uint64_t *a1, void **a2, uint64_t a3)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000B94C( uint64_t a1)
{
}

uint64_t sub_10000B974()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000B9C0(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100015604);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000BA64;
  return sub_100007790(a1, v5, v6, v7, v8);
}

uint64_t sub_10000BA64()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000BAC4()
{
  if (qword_100015148 != -1) {
    swift_once(&qword_100015148, sub_10000BB24);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_10000BBC8(v0, (uint64_t)qword_1000156D8);
}

uint64_t sub_10000BB24()
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000BC08(v3, qword_1000156D8);
  sub_10000BBC8(v3, (uint64_t)qword_1000156D8);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "com.apple.IdleScreen.RetailDemoPoster",  0x25uLL,  1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t sub_10000BBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_10000BC08(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
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
  return &unk_100010DB0;
}

id sub_10000BC8C()
{
  id v10 = 0LL;
  id v11 = 0LL;
  sub_10000BD70();
  id v9 = sub_10000BDD4();
  type metadata accessor for PosterUpdater();
  id v0 = v9;
  id v8 = sub_1000028DC(v9);
  id v1 = v8;
  id v10 = v8;
  type metadata accessor for PosterPresenter();
  id v2 = v9;
  id v7 = sub_100006470(v9);
  id v3 = v7;
  id v11 = v7;

  id v4 = v8;
  id v5 = v7;

  sub_10000BE00(&v10);
  return v8;
}

unint64_t sub_10000BD70()
{
  uint64_t v3 = qword_100015680;
  if (!qword_100015680)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___TVISAmbientPosterServiceProxy);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100015680);
    return ObjCClassMetadata;
  }

  return v3;
}

id sub_10000BDD4()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  return sub_10000CDD4();
}

id *sub_10000BE00(id *a1)
{
  return a1;
}

uint64_t sub_10000BE34(void *a1, void *a2)
{
  unsigned int v14 = a1;
  uint64_t v15 = a2;
  uint64_t v11 = sub_1000052E8(&qword_100015688);
  id v2 = a1;
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100010DD0, 32LL);
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v10 = PRProviderConfiguration.__allocating_init(updatingDelegate:content:)();
  swift_retain(v10);
  uint64_t v13 = v10;
  uint64_t v12 = v10;
  unint64_t v6 = sub_10000C11C();
  static _SceneBuilder.buildBlock<A>(_:)(&v12, v11, v6);
  swift_release(v12);
  return swift_release(v13);
}

uint64_t sub_10000BF2C@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v15 = type metadata accessor for PRRenderingConfiguration(0LL);
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100010E78, 32LL);
  *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v14 = PRRenderingConfiguration.__allocating_init(_:)(sub_10000CC98);
  swift_retain(v14);
  uint64_t v23 = v14;
  uint64_t v16 = type metadata accessor for PREditingConfiguration(0LL);
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = swift_allocObject(&unk_100010EA0, 32LL);
  *(void *)(v8 + swift_unknownObjectWeakDestroy(v0 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v13 = PREditingConfiguration.__allocating_init(_:)(sub_10000CCE8);
  swift_retain(v13);
  uint64_t v22 = v13;
  uint64_t v21 = v14;
  uint64_t v20 = v13;
  unint64_t v17 = sub_10000CCF4();
  unint64_t v9 = sub_10000CD64();
  uint64_t v18 = sub_10000C280((uint64_t)&v21, (uint64_t)&v20, v15, v16, v17, v9);
  swift_release(v20);
  swift_release(v21);
  *a3 = v18;
  swift_release(v22);
  return swift_release(v23);
}

uint64_t sub_10000C0CC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000C110@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000BF2C(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_10000C11C()
{
  uint64_t v3 = qword_100015690;
  if (!qword_100015690)
  {
    uint64_t v0 = sub_10000C18C(&qword_100015688);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015690);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000C18C(uint64_t *a1)
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

id sub_10000C200(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

id sub_10000C240(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

uint64_t sub_10000C280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  uint64_t v14 = sub_1000052E8(&qword_1000156C0);
  uint64_t v7 = *(void *)(type metadata accessor for _AnySceneConfiguration(0LL) - 8);
  uint64_t v20 = *(void *)(v7 + 72);
  uint64_t v8 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + 2 * v20);
  uint64_t v28 = sub_10000CDF4(v8, 2LL);
  uint64_t v24 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v16, v17);
  _AnySceneConfiguration.init<A>(erasing:)(v19, v17, v18);
  uint64_t v23 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v27, v22, v25);
  _AnySceneConfiguration.init<A>(erasing:)(v27, v25, v26);
  uint64_t result = v28;
  sub_10000CE44();
  return result;
}

uint64_t sub_10000C418()
{
  unint64_t v2 = sub_10000CB78();
  unint64_t v0 = sub_10000CBE4();
  return static _AppExtension<>.main()(&unk_100010E50, v2, v0);
}

id sub_10000C498@<X0>(void *a1@<X8>)
{
  id result = sub_10000BC8C();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_10000C4C4()
{
  return sub_10000BE34(*v0, v0[1]);
}

uint64_t sub_10000C4E0()
{
  return _AppExtension.hostAuditToken.getter();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void *sub_10000C5B0(void *a1, uint64_t a2)
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

void sub_10000C604(id *a1)
{
}

void *sub_10000C634(void *a1, uint64_t a2)
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

uint64_t sub_10000C688(uint64_t a1, uint64_t a2)
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

__n128 sub_10000C6F0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000C6FC(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  id v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  return a1;
}

uint64_t sub_10000C74C(uint64_t a1, unsigned int a2)
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

uint64_t sub_10000C8AC(uint64_t result, unsigned int a2, unsigned int a3)
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

void *type metadata accessor for RetailDemoPosterExtension()
{
  return &unk_100010E50;
}

unint64_t sub_10000CAC8()
{
  return sub_10000CADC();
}

unint64_t sub_10000CADC()
{
  uint64_t v3 = qword_100015698;
  if (!qword_100015698)
  {
    uint64_t v0 = sub_10000C18C(&qword_100015688);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100015698);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000CB4C(uint64_t a1)
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2(a1, &unk_10000F0A4, 1LL) + 8) + 8LL);
}

unint64_t sub_10000CB78()
{
  uint64_t v2 = qword_1000156A0;
  if (!qword_1000156A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10000E8E0, &unk_100010E50);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000156A0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10000CBE4()
{
  uint64_t v3 = qword_1000156A8;
  if (!qword_1000156A8)
  {
    uint64_t v0 = sub_10000C18C(&qword_100015688);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000156A8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000CC54()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_10000CC98()
{
  return sub_10000C200(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_10000CCA4()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_10000CCE8()
{
  return sub_10000C240(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

unint64_t sub_10000CCF4()
{
  uint64_t v3 = qword_1000156B0;
  if (!qword_1000156B0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRRenderingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000156B0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000CD64()
{
  uint64_t v3 = qword_1000156B8;
  if (!qword_1000156B8)
  {
    uint64_t v0 = type metadata accessor for PREditingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PREditingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000156B8);
    return WitnessTable;
  }

  return v3;
}

id sub_10000CDD4()
{
  return [v0 init];
}

uint64_t sub_10000CDF4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(a1 + 24) = 2 * a2;
  type metadata accessor for _AnySceneConfiguration(0LL);
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000CE44()
{
}

void sub_10000CE74()
{
  void *v0 = *v0;
}
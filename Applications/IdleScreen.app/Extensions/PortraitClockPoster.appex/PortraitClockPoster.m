id sub_10000297C()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  v10 = 0LL;
  v11 = 0LL;
  sub_100002A60();
  v9 = sub_100002AC4();
  type metadata accessor for PosterUpdater();
  v0 = v9;
  v8 = sub_10000C488(v9);
  v1 = v8;
  v10 = v8;
  type metadata accessor for PosterPresenter();
  v2 = v9;
  v7 = sub_100004ACC(v9);
  v3 = v7;
  v11 = v7;

  v4 = v8;
  v5 = v7;

  sub_100002AF0(&v10);
  return v8;
}

unint64_t sub_100002A60()
{
  uint64_t v3 = qword_1000198C0;
  if (!qword_1000198C0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___TVISAmbientPosterServiceProxy);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000198C0);
    return ObjCClassMetadata;
  }

  return v3;
}

id sub_100002AC4()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  return sub_1000039E8();
}

id *sub_100002AF0(id *a1)
{
  return a1;
}

uint64_t sub_100002B24(void *a1, void *a2)
{
  v14 = a1;
  v15 = a2;
  uint64_t v11 = sub_100002C1C(&qword_1000198C8);
  id v2 = a1;
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100014768, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v10 = PRProviderConfiguration.__allocating_init(updatingDelegate:content:)();
  swift_retain();
  uint64_t v13 = v10;
  uint64_t v12 = v10;
  unint64_t v6 = sub_100002E78();
  static _SceneBuilder.buildBlock<A>(_:)(&v12, v11, v6);
  swift_release(v12);
  return swift_release(v13);
}

uint64_t sub_100002C1C(uint64_t *a1)
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

uint64_t sub_100002C88@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  v24 = a1;
  v25 = a2;
  uint64_t v15 = type metadata accessor for PRRenderingConfiguration(0LL);
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = swift_allocObject(&unk_100014860, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v14 = PRRenderingConfiguration.__allocating_init(_:)(sub_100004904);
  swift_retain();
  uint64_t v23 = v14;
  uint64_t v16 = type metadata accessor for PREditingConfiguration(0LL);
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = swift_allocObject(&unk_100014888, 32LL, 7LL);
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v13 = PREditingConfiguration.__allocating_init(_:)(sub_100004954);
  swift_retain();
  uint64_t v22 = v13;
  uint64_t v21 = v14;
  uint64_t v20 = v13;
  unint64_t v17 = sub_100004960();
  unint64_t v9 = sub_1000049D0();
  uint64_t v18 = sub_100002FDC((uint64_t)&v21, (uint64_t)&v20, v15, v16, v17, v9);
  swift_release(v20);
  swift_release(v21);
  *a3 = v18;
  swift_release(v22);
  return swift_release(v23);
}

uint64_t sub_100002E28()
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_100002E6C@<X0>(uint64_t *a1@<X8>)
{
  return sub_100002C88(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_100002E78()
{
  uint64_t v3 = qword_1000198D0;
  if (!qword_1000198D0)
  {
    uint64_t v0 = sub_100002EE8(&qword_1000198C8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000198D0);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100002EE8(uint64_t *a1)
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

id sub_100002F5C(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

id sub_100002F9C(int a1, id a2)
{
  id v2 = a2;
  return a2;
}

uint64_t sub_100002FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  __chkstk_darwin();
  v27 = (char *)&v11 - v12;
  uint64_t v15 = *(void *)(v6 - 8);
  unint64_t v13 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  v19 = (char *)&v11 - v13;
  uint64_t v14 = sub_100002C1C((uint64_t *)&unk_1000199D0);
  uint64_t v7 = *(void *)(type metadata accessor for _AnySceneConfiguration(0LL) - 8);
  uint64_t v20 = *(void *)(v7 + 72);
  uint64_t v8 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + 2 * v20,  *(unsigned __int8 *)(v7 + 80) | 7LL);
  uint64_t v28 = sub_100004A40(v8, 2LL);
  uint64_t v24 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v16, v17);
  _AnySceneConfiguration.init<A>(erasing:)(v19, v17, v18);
  uint64_t v23 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v27, v22, v25);
  _AnySceneConfiguration.init<A>(erasing:)(v27, v25, v26);
  uint64_t result = v28;
  sub_100004A90();
  return result;
}

uint64_t sub_100003174()
{
  unint64_t v2 = sub_1000047E4();
  unint64_t v0 = sub_100004850();
  return static _AppExtension<>.main()(&unk_1000147E8, v2, v0);
}

id sub_1000031F4@<X0>(void *a1@<X8>)
{
  id result = sub_10000297C();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_100003220()
{
  return sub_100002B24(*v0, v0[1]);
}

uint64_t sub_10000323C()
{
  return _AppExtension.hostAuditToken.getter();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void *sub_10000330C(void *a1, uint64_t a2)
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

void sub_100003360(id *a1)
{
}

void *sub_100003390(void *a1, uint64_t a2)
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

uint64_t sub_1000033E4(uint64_t a1, uint64_t a2)
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

__n128 sub_10000344C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003458(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  id v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  return a1;
}

uint64_t sub_1000034A8(uint64_t a1, unsigned int a2)
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

uint64_t sub_100003608(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 16) = 1;
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
        *(_BYTE *)(result + 16) = 0;
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

void *type metadata accessor for PortraitClockPosterExtension()
{
  return &unk_1000147E8;
}

unint64_t sub_100003824()
{
  return sub_100003838();
}

unint64_t sub_100003838()
{
  uint64_t v3 = qword_1000198D8;
  if (!qword_1000198D8)
  {
    uint64_t v0 = sub_100002EE8(&qword_1000198C8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000198D8);
    return WitnessTable;
  }

  return v3;
}

uint64_t type metadata accessor for PRRenderingEventType(uint64_t a1)
{
  uint64_t v5 = qword_1000198E0;
  if (!qword_1000198E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100014810);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000198E0);
      return v2;
    }
  }

  return v5;
}

uint64_t type metadata accessor for AutoresizingMask(uint64_t a1)
{
  uint64_t v5 = qword_1000198E8;
  if (!qword_1000198E8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_100014838);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000198E8);
      return v2;
    }
  }

  return v5;
}

id sub_1000039E8()
{
  return [v0 init];
}

uint64_t sub_100003A0C(uint64_t a1)
{
  unint64_t v3 = sub_1000045C4();
  unint64_t v1 = sub_100004634();
  return OptionSet<>.init()(a1, v3, v1);
}

uint64_t sub_100003A4C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000045C4();
  return OptionSet<>.contains(_:)(a1, a2, v2) & 1;
}

uint64_t sub_100003A84(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000045C4();
  return OptionSet.union(_:)(a1, a2, v2);
}

uint64_t sub_100003AC0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000045C4();
  return OptionSet.intersection(_:)(a1, a2, v2);
}

uint64_t sub_100003AFC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000045C4();
  return OptionSet.symmetricDifference(_:)(a1, a2, v2);
}

uint64_t sub_100003B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_1000045C4();
  return OptionSet<>.insert(_:)(a1, a2, a3, v3) & 1;
}

uint64_t sub_100003B78(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000045C4();
  return OptionSet<>.remove(_:)(a1, a2, v2);
}

uint64_t sub_100003BB4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_1000045C4();
  return OptionSet<>.update(with:)(a1, a2, v2);
}

uint64_t sub_100003BF0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_1000045C4();
  unint64_t v2 = sub_100004634();
  return OptionSet<>.formUnion(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003C30(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_1000045C4();
  unint64_t v2 = sub_100004634();
  return OptionSet<>.formIntersection(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003C70(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_1000045C4();
  unint64_t v2 = sub_100004634();
  return OptionSet<>.formSymmetricDifference(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003CB0()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t sub_100003CC4()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t sub_100003CDC()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t sub_100003CF4()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t sub_100003D0C()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t sub_100003D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100003D5C()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t sub_100003D70(uint64_t a1)
{
  unint64_t v3 = sub_10000469C();
  unint64_t v1 = sub_10000470C();
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()(a1, v3, v1);
}

uint64_t sub_100003DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_10000469C();
  unint64_t v3 = sub_10000470C();
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3);
}

uint64_t sub_100003DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = sub_10000469C();
  unint64_t v3 = sub_10000470C();
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)(a1, a2, a3, v7, v3) & 1;
}

uint64_t sub_100003E3C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10000469C();
  unint64_t v2 = sub_10000470C();
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)(a1, a2, v5, v2);
}

uint64_t sub_100003E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100004254();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for String) & 1;
}

uint64_t sub_100003ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_100004100();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for UInt) & 1;
}

uint64_t sub_100003F14(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_100004184();
  return SetAlgebra<>.init(arrayLiteral:)(a1, a2, v2);
}

uint64_t sub_100003F50@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *a2 = result;
  return result;
}

NSString sub_100003F7C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_100003FB0(*a1, a1[1]);
  *a2 = result;
  return result;
}

NSString sub_100003FB0(uint64_t a1, uint64_t a2)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v2 = v5;
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(a2);

  return v5;
}

uint64_t sub_100004008@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004038(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004038(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

  return v4;
}

uint64_t sub_100004084@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1000040C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_2(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_1000040EC()
{
  return sub_100004100();
}

unint64_t sub_100004100()
{
  uint64_t v3 = qword_1000198F0;
  if (!qword_1000198F0)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000116A0, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000198F0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004170()
{
  return sub_100004184();
}

unint64_t sub_100004184()
{
  uint64_t v3 = qword_1000198F8;
  if (!qword_1000198F8)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000118C4, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000198F8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_1000041F8(uint64_t a1)
{
  unint64_t v3 = sub_100004774();
  unint64_t v1 = sub_10000469C();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v1, &protocol witness table for String);
}

unint64_t sub_100004240()
{
  return sub_100004254();
}

unint64_t sub_100004254()
{
  uint64_t v3 = qword_100019900;
  if (!qword_100019900)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100011750, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019900);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000042C4()
{
  return sub_1000042D8();
}

unint64_t sub_1000042D8()
{
  uint64_t v3 = qword_100019908;
  if (!qword_100019908)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100011724, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019908);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004348()
{
  return sub_10000435C();
}

unint64_t sub_10000435C()
{
  uint64_t v3 = qword_100019910;
  if (!qword_100019910)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100011898, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019910);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_1000043CC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10000469C();
  return _SwiftNewtypeWrapper<>.hashValue.getter(a1, a2, v2, &protocol witness table for String);
}

uint64_t sub_100004408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10000469C();
  return _SwiftNewtypeWrapper<>.hash(into:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_10000444C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10000469C();
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)(a1, a2, a3, v3, &protocol witness table for String);
}

uint64_t sub_100004490(uint64_t a1)
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2(a1, &unk_100011A5C, 1LL) + 8) + 8LL);
}

unint64_t sub_1000044BC()
{
  return sub_1000044D0();
}

unint64_t sub_1000044D0()
{
  uint64_t v3 = qword_100019918;
  if (!qword_100019918)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100011674, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019918);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004540()
{
  return sub_100004554();
}

unint64_t sub_100004554()
{
  uint64_t v3 = qword_100019920;
  if (!qword_100019920)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable("i2", v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019920);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000045C4()
{
  uint64_t v3 = qword_100019928;
  if (!qword_100019928)
  {
    uint64_t v0 = type metadata accessor for AutoresizingMask(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000116DC, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019928);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_100004634()
{
  uint64_t v2 = qword_100019930;
  if (!qword_100019930)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for UInt,  &type metadata for UInt);
    atomic_store(v0, (unint64_t *)&qword_100019930);
    return v0;
  }

  return v2;
}

unint64_t sub_10000469C()
{
  uint64_t v3 = qword_100019938;
  if (!qword_100019938)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10001178C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019938);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000470C()
{
  uint64_t v2 = qword_100019940;
  if (!qword_100019940)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019940);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100004774()
{
  uint64_t v3 = qword_100019948;
  if (!qword_100019948)
  {
    uint64_t v0 = type metadata accessor for PRRenderingEventType(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_1000117C0, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019948);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000047E4()
{
  uint64_t v2 = qword_1000199B0;
  if (!qword_1000199B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_100011850, &unk_1000147E8);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000199B0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100004850()
{
  uint64_t v3 = qword_1000199B8;
  if (!qword_1000199B8)
  {
    uint64_t v0 = sub_100002EE8(&qword_1000198C8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRProviderConfiguration<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000199B8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_1000048C0()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_100004904()
{
  return sub_100002F5C(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_100004910()
{
  return swift_deallocObject(v2, 32LL);
}

id sub_100004954()
{
  return sub_100002F9C(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

unint64_t sub_100004960()
{
  uint64_t v3 = qword_1000199C0;
  if (!qword_1000199C0)
  {
    uint64_t v0 = type metadata accessor for PRRenderingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PRRenderingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000199C0);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000049D0()
{
  uint64_t v3 = qword_1000199C8;
  if (!qword_1000199C8)
  {
    uint64_t v0 = type metadata accessor for PREditingConfiguration(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PREditingConfiguration, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000199C8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100004A40(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 2 * a2;
  type metadata accessor for _AnySceneConfiguration(0LL);
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100004A90()
{
}

void sub_100004AC0()
{
  *uint64_t v0 = *v0;
}

id sub_100004ACC(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_100004B04(a1);
}

id sub_100004B04(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType(v1);
  uint64_t v17 = a1;
  id v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  NSString v5 = v1;
  id v18 = v1;
  *(void *)&v1[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_renderer] = 0LL;

  *(void *)&v1[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state] = 0LL;
  uint64_t v10 = (void **)&v1[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_renderer];
  swift_beginAccess();
  uint64_t v6 = *v10;
  *uint64_t v10 = 0LL;

  swift_endAccess(v16);
  id v7 = a1;
  *(void *)&v11[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_serviceProxy] = a1;

  v15.receiver = v18;
  v15.super_class = ObjectType;
  id v14 = objc_msgSendSuper2(&v15, "init");
  id v8 = v14;
  id v18 = v14;

  return v14;
}

uint64_t sub_100004C50(uint64_t a1)
{
  v2[22] = v1;
  v2[21] = a1;
  v2[15] = v2;
  v2[16] = 0LL;
  v2[17] = 0LL;
  v2[20] = 0LL;
  uint64_t v3 = sub_100002C1C((uint64_t *)&unk_100019B20);
  v2[23] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[24] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[25] = v5;
  v2[26] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v2[16] = a1;
  v2[17] = v1;
  return swift_task_switch(sub_100004D2C, 0LL, 0LL);
}

uint64_t sub_100004D2C()
{
  uint64_t v1 = v0[26];
  uint64_t v19 = v0[25];
  uint64_t v20 = v0[24];
  v0[15] = v0;
  uint64_t v2 = sub_1000105EC();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, v2, v20);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  v0[18] = 12LL;
  unint64_t v21 = sub_100009400();
  unint64_t v22 = sub_100009468();
  unint64_t v4 = sub_1000094D0();
  UnsignedInteger<>.init<A>(_:)(v0 + 29, v0 + 18, &type metadata for UInt32, &type metadata for Int, v21, v22, v4);
  uint32_t v23 = *((_DWORD *)v0 + 58);
  uint64_t v25 = swift_allocObject(&unk_100014A80, 17LL, 7LL);
  *(_BYTE *)(v25 + 16) = 32;
  uint64_t v26 = swift_allocObject(&unk_100014AA8, 17LL, 7LL);
  *(_BYTE *)(v26 + 16) = 8;
  uint64_t v24 = swift_allocObject(&unk_100014AD0, 32LL, 7LL);
  *(void *)(v24 + 16) = sub_100005720;
  *(void *)(v24 + 24) = 0LL;
  uint64_t v28 = swift_allocObject(&unk_100014AF8, 32LL, 7LL);
  *(void *)(v28 + 16) = sub_10000AC58;
  *(void *)(v28 + 24) = v24;
  sub_100002C1C(&qword_100019B40);
  uint64_t v27 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v29 = v5;
  swift_retain(v25);
  *uint64_t v29 = sub_10000ABE4;
  v29[1] = v25;
  swift_retain(v26);
  v29[2] = sub_10000AC14;
  v29[3] = v26;
  swift_retain(v28);
  v29[4] = sub_10000ACA0;
  v29[5] = v28;
  sub_10000690C();
  swift_bridgeObjectRelease(v27);
  if (os_log_type_enabled(v30, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v14 = sub_100002C1C(&qword_100019DF0);
    uint64_t v16 = sub_100009538(0LL, v14, v14);
    uint64_t v17 = sub_100009538(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v32 = buf;
    uint64_t v33 = v16;
    uint64_t v34 = v17;
    sub_100009590(2LL, &v32);
    sub_100009590(1LL, &v32);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000ABE4;
    uint64_t v36 = v25;
    sub_1000095A4(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000AC14;
    uint64_t v36 = v26;
    sub_1000095A4(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000ACA0;
    uint64_t v36 = v28;
    sub_1000095A4(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s", buf, v23);
    sub_1000095E8(v16, 0LL);
    sub_1000095E8(v17, 1LL);
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
  id v13 = *(id *)(v11 + OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_serviceProxy);
  *(void *)(v18 + 216) = v13;
  id v6 = v13;
  *(void *)(v18 + 16) = *(void *)(v18 + 120);
  *(void *)(v18 + 56) = v18 + 152;
  *(void *)(v18 + 24) = sub_100005304;
  *(void *)(v18 + 112) = swift_continuation_init();
  *(void *)(v18 + 80) = _NSConcreteStackBlock;
  *(_DWORD *)(v18 + 88) = 0x40000000;
  *(_DWORD *)(v18 + 92) = 0;
  *(void *)(v18 + 96) = sub_10000574C;
  *(void *)(v18 + 104) = &unk_100014B10;
  [v13 queryCurrentSnapshotWithIntent:v12 reply:v18 + 80];
  return j__swift_continuation_await(v18 + 16);
}

uint64_t sub_100005304()
{
  uint64_t v1 = (void *)*v0;
  v1[15] = *v0;
  uint64_t v2 = v1[6];
  v1[28] = v2;
  if (v2) {
    return swift_task_switch(sub_100005558, 0LL, 0LL);
  }
  else {
    return swift_task_switch(sub_1000053A4, 0LL, 0LL);
  }
}

uint64_t sub_1000053A4()
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
  uint64_t v8 = swift_allocObject(&unk_100014B38, 24LL, 7LL);
  id v3 = v6;
  swift_unknownObjectWeakInit(v8 + 16, v6);

  swift_retain(v8);
  swift_unknownObjectRetain(v10);
  type metadata accessor for MainActor(0LL);
  uint64_t v7 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject(&unk_100014B60, 48LL, 7LL);
  v9[2] = v7;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v8;
  v9[5] = v10;
  swift_release(v8);
  uint64_t v4 = sub_1000066B8(v12, (uint64_t)&unk_100019B50, (uint64_t)v9, (uint64_t)&type metadata for () + 8);
  swift_release(v4);
  swift_unknownObjectRelease(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0[15] + 8LL))();
}

uint64_t sub_100005558()
{
  id v5 = (id)v0[27];
  v0[15] = v0;
  swift_willThrow();

  swift_errorRelease();
  uint64_t v10 = v0[26];
  uint64_t v11 = v0[23];
  id v6 = (id)v0[22];
  v0[20] = 0LL;
  uint64_t v1 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 56LL))(v11, 1LL);
  uint64_t v8 = swift_allocObject(&unk_100014B38, 24LL, 7LL);
  id v2 = v6;
  swift_unknownObjectWeakInit(v8 + 16, v6);

  swift_retain(v8);
  swift_unknownObjectRetain(0LL);
  type metadata accessor for MainActor(0LL);
  uint64_t v7 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject(&unk_100014B60, 48LL, 7LL);
  v9[2] = v7;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v8;
  v9[5] = 0LL;
  swift_release(v8);
  uint64_t v3 = sub_1000066B8(v11, (uint64_t)&unk_100019B50, (uint64_t)v9, (uint64_t)&type metadata for () + 8);
  swift_release(v3);
  swift_unknownObjectRelease(0LL);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0[15] + 8LL))();
}

uint64_t sub_100005720()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updateViewModel(intent:)", 0x18uLL, 1)._countAndFlagsBits;
}

uint64_t sub_10000574C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  if (a3)
  {
    swift_errorRetain();
    uint64_t v6 = sub_100002C1C(&qword_100019D48);
    sub_100005864(v11, (uint64_t)a3, v6);
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
    uint64_t v4 = sub_100002C1C(&qword_100019D48);
    sub_1000058BC(v11, (uint64_t)&v12, v4);
  }

  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100005864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = a3;
  v7[0] = a2;
  uint64_t v3 = sub_100002C1C(&qword_100019D50);
  return sub_10000978C((uint64_t)v7, a1, a3, v3, (uint64_t)&protocol self-conformance witness table for Error);
}

uint64_t sub_1000058BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000973C(a2, a1, a3);
}

uint64_t sub_10000590C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[22] = a5;
  v5[21] = a4;
  v5[14] = v5;
  v5[15] = 0LL;
  v5[16] = 0LL;
  v5[17] = 0LL;
  v5[18] = 0LL;
  v5[19] = 0LL;
  v5[20] = 0LL;
  v5[15] = a4 + 16;
  v5[16] = a5;
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  v5[23] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000059B4, v9, v6);
}

uint64_t sub_1000059B4()
{
  uint64_t v25 = *(void *)(v0 + 168);
  *(void *)(v0 + 112) = v0;
  swift_beginAccess(v25 + 16);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v25 + 16);
  swift_endAccess(v0 + 16);
  if (Strong)
  {
    v24[17] = Strong;
    unint64_t v22 = (id *)&Strong[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state]);
    id v23 = *v22;
    id v1 = *v22;
    swift_endAccess(v24 + 5);
    if (v23)
    {
      uint64_t v21 = v24[22];
      v24[19] = v23;
      swift_unknownObjectRetain(v21);
      if (v21)
      {
        uint64_t v19 = v24[22];
        uint64_t v2 = objc_opt_self(&OBJC_CLASS___TVISPortraitClockScreenSaver);
        uint64_t v20 = swift_dynamicCastObjCClass(v19, v2);
        if (v20)
        {
          uint64_t v17 = (void *)v20;
        }

        else
        {
          swift_unknownObjectRelease(v19);
          uint64_t v17 = 0LL;
        }

        uint64_t v18 = v17;
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      if (v18)
      {
        v24[20] = v18;
        PortraitClockScreenSaverViewModel.update(model:)();

LABEL_25:
        goto LABEL_26;
      }
    }

    objc_super v15 = (id *)&Strong[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state];
    swift_beginAccess(&Strong[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state]);
    id v16 = *v15;
    id v3 = *v15;
    swift_endAccess(v24 + 8);
    if (v16)
    {
    }

    else
    {
      uint64_t v14 = v24[22];
      type metadata accessor for PortraitClockScreenSaverViewModel(0LL);
      swift_unknownObjectRetain(v14);
      if (v14)
      {
        uint64_t v12 = v24[22];
        uint64_t v4 = objc_opt_self(&OBJC_CLASS___TVISPortraitClockScreenSaver);
        uint64_t v13 = swift_dynamicCastObjCClass(v12, v4);
        if (v13)
        {
          uint64_t v10 = v13;
        }

        else
        {
          swift_unknownObjectRelease(v12);
          uint64_t v10 = 0LL;
        }

        uint64_t v11 = v10;
      }

      else
      {
        uint64_t v11 = 0LL;
      }

      id v9 = (id)PortraitClockScreenSaverViewModel.__allocating_init(model:)(v11);
      v24[18] = v9;
      id v5 = v9;
      uint64_t v8 = (void **)&Strong[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state];
      swift_beginAccess(&Strong[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state]);
      uint64_t v6 = *v8;
      *uint64_t v8 = v9;

      swift_endAccess(v24 + 11);
      sub_100005F24();
    }

    goto LABEL_25;
  }

LABEL_26:
  swift_release(v24[23]);
  return (*(uint64_t (**)(void))(v24[14] + 8LL))();
}

void sub_100005F24()
{
  uint64_t v106 = 0LL;
  id v102 = 0LL;
  id v100 = 0LL;
  id v96 = 0LL;
  uint64_t v69 = 0LL;
  uint64_t v74 = type metadata accessor for Logger(0LL);
  uint64_t v73 = *(void *)(v74 - 8);
  unint64_t v71 = (*(void *)(v73 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v74);
  uint64_t v0 = (char *)&v38 - v71;
  v72 = (char *)&v38 - v71;
  uint64_t v106 = v1;
  uint64_t v2 = sub_1000105EC();
  uint64_t v3 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 16))(v0, v2, v74);
  v89 = (os_log_s *)Logger.logObject.getter(v3);
  int v90 = static os_log_type_t.default.getter();
  v77 = &v104;
  uint64_t v104 = 12LL;
  unint64_t v75 = sub_100009400();
  unint64_t v76 = sub_100009468();
  unint64_t v4 = sub_1000094D0();
  UnsignedInteger<>.init<A>(_:)(&v105, v77, &type metadata for UInt32, &type metadata for Int, v75, v76, v4);
  uint32_t v78 = v105;
  uint64_t v79 = 17LL;
  uint64_t v81 = 7LL;
  uint64_t v5 = swift_allocObject(&unk_100014B88, 17LL, 7LL);
  uint64_t v6 = v79;
  uint64_t v7 = v81;
  uint64_t v83 = v5;
  *(_BYTE *)(v5 + 16) = 32;
  uint64_t v8 = swift_allocObject(&unk_100014BB0, v6, v7);
  uint64_t v9 = v81;
  uint64_t v84 = v8;
  *(_BYTE *)(v8 + 16) = 8;
  uint64_t v80 = 32LL;
  uint64_t v10 = swift_allocObject(&unk_100014BD8, 32LL, v9);
  uint64_t v11 = v80;
  uint64_t v12 = v81;
  uint64_t v82 = v10;
  *(void *)(v10 + 16) = sub_1000068E0;
  *(void *)(v10 + 24) = 0LL;
  uint64_t v13 = swift_allocObject(&unk_100014C00, v11, v12);
  uint64_t v14 = v82;
  uint64_t v86 = v13;
  *(void *)(v13 + 16) = sub_10000AED8;
  *(void *)(v13 + 24) = v14;
  uint64_t v88 = sub_100002C1C(&qword_100019B40);
  uint64_t v85 = _allocateUninitializedArray<A>(_:)(3LL);
  v87 = v15;
  swift_retain(v83);
  uint64_t v16 = v84;
  uint64_t v17 = v83;
  uint64_t v18 = v87;
  void *v87 = sub_10000AE64;
  v18[1] = v17;
  swift_retain(v16);
  uint64_t v19 = v86;
  uint64_t v20 = v84;
  uint64_t v21 = v87;
  v87[2] = sub_10000AE94;
  v21[3] = v20;
  swift_retain(v19);
  uint64_t v22 = v85;
  uint64_t v23 = v86;
  uint64_t v24 = v87;
  v87[4] = sub_10000AF20;
  v24[5] = v23;
  sub_10000690C();
  swift_bridgeObjectRelease(v22);
  if (os_log_type_enabled(v89, (os_log_type_t)v90))
  {
    uint64_t v25 = v69;
    v62 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v61 = sub_100002C1C(&qword_100019DF0);
    uint64_t v63 = sub_100009538(0LL, v61, v61);
    uint64_t v64 = sub_100009538(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v65 = v95;
    v95[0] = v62;
    v66 = &v94;
    uint64_t v94 = v63;
    v67 = &v93;
    uint64_t v93 = v64;
    sub_100009590(2LL, v95);
    sub_100009590(1LL, v65);
    v91 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000AE64;
    uint64_t v92 = v83;
    sub_1000095A4(&v91, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67);
    uint64_t v68 = v25;
    if (v25)
    {
      __break(1u);
    }

    else
    {
      v91 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000AE94;
      uint64_t v92 = v84;
      sub_1000095A4(&v91, (uint64_t)v95, (uint64_t)&v94, (uint64_t)&v93);
      uint64_t v60 = 0LL;
      v91 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000AF20;
      uint64_t v92 = v86;
      sub_1000095A4(&v91, (uint64_t)v95, (uint64_t)&v94, (uint64_t)&v93);
      _os_log_impl((void *)&_mh_execute_header, v89, (os_log_type_t)v90, "%s", v62, v78);
      sub_1000095E8(v63, 0LL);
      sub_1000095E8(v64, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v83);
      swift_release(v84);
      swift_release(v86);
    }
  }

  else
  {
    swift_release(v83);
    swift_release(v84);
    swift_release(v86);
  }

  (*(void (**)(char *, uint64_t))(v73 + 8))(v72, v74);
  v57 = (id *)(v70 + OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_renderer);
  v58 = &v103;
  swift_beginAccess();
  id v59 = *v57;
  id v26 = v59;
  swift_endAccess(v58);
  if (v59)
  {
    id v56 = v59;
    id v52 = v59;
    id v102 = v59;
    v53 = (id *)(v70 + OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state);
    v54 = &v101;
    swift_beginAccess();
    id v55 = *v53;
    id v27 = v55;
    swift_endAccess(v54);
    if (v55)
    {
      id v51 = v55;
      id v50 = v55;
      id v100 = v55;
      v40 = (id *)v98;
      uint64_t v43 = 0LL;
      PortraitClockScreenSaverView.init(delegate:)(v98, 0LL);
      uint64_t v38 = type metadata accessor for PortraitClockScreenSaverViewModel(v43);
      unint64_t v39 = sub_10000AF2C();
      unint64_t v28 = sub_10000AF94();
      v49 = &v99;
      View.environmentObject<A>(_:)(v50, &type metadata for PortraitClockScreenSaverView, v38, v39, v28);
      sub_10000B004(v40);
      sub_100002C1C((uint64_t *)&unk_100019B70);
      v41 = v97;
      sub_10000B038((uint64_t)v49, v97);
      id v48 = (id)_UIHostingView.__allocating_init(rootView:)(v41);
      id v96 = v48;
      v46 = &stru_100019000;
      id v42 = [v52 backgroundView];
      [v42 bounds];
      v95[6] = v29;
      v95[7] = v30;
      v95[8] = v31;
      v95[9] = v32;
      v95[2] = v29;
      v95[3] = v30;
      v95[4] = v31;
      v95[5] = v32;
      objc_msgSend(v48, "setFrame:", *(double *)&v29, *(double *)&v30, *(double *)&v31, *(double *)&v32);

      id v33 = v48;
      uint64_t v34 = type metadata accessor for AutoresizingMask(v43);
      uint64_t v44 = 2LL;
      uint64_t v35 = _allocateUninitializedArray<A>(_:)(2LL);
      *uint64_t v36 = v44;
      v36[1] = 16LL;
      sub_10000690C();
      uint64_t v45 = v35;
      unint64_t v37 = sub_100004184();
      SetAlgebra<>.init(arrayLiteral:)(v45, v34, v37);
      [v48 setAutoresizingMask:v95[1]];

      id v47 = [v52 v46[71].name];
      [v47 addSubview:v48];

      sub_10000B0CC((uint64_t)v49);
    }
  }
}

uint64_t sub_1000066B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    sub_10000C050(a1);
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

  uint64_t v7 = (void *)swift_allocObject(&unk_100015000, 40LL, 7LL);
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

  return swift_task_create(v16 | 0x1C00, v8, a4, &unk_100019D40, v7);
}

uint64_t sub_1000068E0()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("updateRenderer()", 0x10uLL, 1)._countAndFlagsBits;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000690C()
{
}

uint64_t sub_10000694C()
{
  if (!"PortraitClockPoster.PosterPresenter")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_10000F8A0( (uint64_t)"PortraitClockPoster.PosterPresenter",  35LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"PortraitClockPoster/PosterPresenter.swift",  41LL,  2,  v2,  0xEuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_100006A7C()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006B24(void *a1, void *a2)
{
  id v127 = a1;
  id v135 = a2;
  uint64_t v154 = 0LL;
  uint64_t v153 = 0LL;
  uint64_t v152 = 0LL;
  uint64_t v124 = 0LL;
  unint64_t v125 = (*(void *)(*(void *)(sub_100002C1C((uint64_t *)&unk_100019B20) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v126 = (uint64_t)v67 - v125;
  uint64_t v128 = type metadata accessor for Logger(0LL);
  uint64_t v129 = *(void *)(v128 - 8);
  uint64_t v131 = *(void *)(v129 + 64);
  unint64_t v130 = (v131 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(v135);
  v132 = (char *)v67 - v130;
  unint64_t v133 = (v131 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v4 = __chkstk_darwin(v3);
  v134 = (char *)v67 - v133;
  uint64_t v154 = v5;
  uint64_t v153 = v4;
  uint64_t v152 = v2;
  swift_getObjectType(v4);
  swift_unknownObjectRetain(v135);
  unsigned int v136 = [v135 isSnapshot];
  swift_unknownObjectRelease(v135);
  if ((v136 & 1) != 0)
  {
    id v42 = v132;
    uint64_t v43 = sub_1000105EC();
    uint64_t v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v129 + 16))(v42, v43, v128);
    int v90 = (os_log_s *)Logger.logObject.getter(v44);
    int v91 = static os_log_type_t.default.getter();
    uint32_t v78 = &v150;
    uint64_t v150 = 12LL;
    unint64_t v76 = sub_100009400();
    unint64_t v77 = sub_100009468();
    unint64_t v45 = sub_1000094D0();
    UnsignedInteger<>.init<A>(_:)(&v151, v78, &type metadata for UInt32, &type metadata for Int, v76, v77, v45);
    uint32_t v79 = v151;
    uint64_t v80 = 17LL;
    uint64_t v82 = 7LL;
    uint64_t v46 = swift_allocObject(&unk_100014C28, 17LL, 7LL);
    uint64_t v47 = v80;
    uint64_t v48 = v82;
    uint64_t v84 = v46;
    *(_BYTE *)(v46 + 16) = 32;
    uint64_t v49 = swift_allocObject(&unk_100014C50, v47, v48);
    uint64_t v50 = v82;
    uint64_t v85 = v49;
    *(_BYTE *)(v49 + 16) = 8;
    uint64_t v81 = 32LL;
    uint64_t v51 = swift_allocObject(&unk_100014C78, 32LL, v50);
    uint64_t v52 = v81;
    uint64_t v53 = v82;
    uint64_t v83 = v51;
    *(void *)(v51 + 16) = sub_100007904;
    *(void *)(v51 + 24) = 0LL;
    uint64_t v54 = swift_allocObject(&unk_100014CA0, v52, v53);
    uint64_t v55 = v83;
    uint64_t v87 = v54;
    *(void *)(v54 + 16) = sub_10000B204;
    *(void *)(v54 + 24) = v55;
    uint64_t v89 = sub_100002C1C(&qword_100019B40);
    uint64_t v86 = _allocateUninitializedArray<A>(_:)(3LL);
    uint64_t v88 = v56;
    swift_retain(v84);
    uint64_t v57 = v85;
    uint64_t v58 = v84;
    id v59 = v88;
    *uint64_t v88 = sub_10000B190;
    v59[1] = v58;
    swift_retain(v57);
    uint64_t v60 = v87;
    uint64_t v61 = v85;
    v62 = v88;
    v88[2] = sub_10000B1C0;
    v62[3] = v61;
    swift_retain(v60);
    uint64_t v63 = v86;
    uint64_t v64 = v87;
    v65 = v88;
    v88[4] = sub_10000B24C;
    v65[5] = v64;
    sub_10000690C();
    swift_bridgeObjectRelease(v63);
    if (os_log_type_enabled(v90, (os_log_type_t)v91))
    {
      uint64_t v66 = v124;
      uint64_t v69 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v68 = sub_100002C1C(&qword_100019DF0);
      uint64_t v70 = sub_100009538(0LL, v68, v68);
      uint64_t v71 = sub_100009538(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v72 = &v149;
      v149 = v69;
      uint64_t v73 = &v148;
      uint64_t v148 = v70;
      uint64_t v74 = &v147;
      uint64_t v147 = v71;
      sub_100009590(2LL, &v149);
      sub_100009590(1LL, v72);
      v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B190;
      uint64_t v146 = v84;
      sub_1000095A4(&v145, (uint64_t)v72, (uint64_t)v73, (uint64_t)v74);
      uint64_t v75 = v66;
      if (v66)
      {
        __break(1u);
      }

      else
      {
        v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B1C0;
        uint64_t v146 = v85;
        sub_1000095A4(&v145, (uint64_t)&v149, (uint64_t)&v148, (uint64_t)&v147);
        v67[1] = 0LL;
        v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B24C;
        uint64_t v146 = v87;
        sub_1000095A4(&v145, (uint64_t)&v149, (uint64_t)&v148, (uint64_t)&v147);
        _os_log_impl((void *)&_mh_execute_header, v90, (os_log_type_t)v91, "%s - skipped", v69, v79);
        sub_1000095E8(v70, 0LL);
        sub_1000095E8(v71, 1LL);
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

    return (*(uint64_t (**)(char *, uint64_t))(v129 + 8))(v132, v128);
  }

  else
  {
    uint64_t v6 = v134;
    uint64_t v7 = sub_1000105EC();
    uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v129 + 16))(v6, v7, v128);
    v121 = (os_log_s *)Logger.logObject.getter(v8);
    int v122 = static os_log_type_t.default.getter();
    v109 = &v143;
    uint64_t v143 = 12LL;
    unint64_t v107 = sub_100009400();
    unint64_t v108 = sub_100009468();
    unint64_t v9 = sub_1000094D0();
    UnsignedInteger<>.init<A>(_:)(&v144, v109, &type metadata for UInt32, &type metadata for Int, v107, v108, v9);
    uint32_t v110 = v144;
    uint64_t v111 = 17LL;
    uint64_t v113 = 7LL;
    uint64_t v10 = swift_allocObject(&unk_100014CC8, 17LL, 7LL);
    uint64_t v11 = v111;
    uint64_t v12 = v113;
    uint64_t v115 = v10;
    *(_BYTE *)(v10 + 16) = 32;
    uint64_t v13 = swift_allocObject(&unk_100014CF0, v11, v12);
    uint64_t v14 = v113;
    uint64_t v116 = v13;
    *(_BYTE *)(v13 + 16) = 8;
    uint64_t v112 = 32LL;
    uint64_t v15 = swift_allocObject(&unk_100014D18, 32LL, v14);
    uint64_t v16 = v112;
    uint64_t v17 = v113;
    uint64_t v114 = v15;
    *(void *)(v15 + 16) = sub_100007930;
    *(void *)(v15 + 24) = 0LL;
    uint64_t v18 = swift_allocObject(&unk_100014D40, v16, v17);
    uint64_t v19 = v114;
    uint64_t v118 = v18;
    *(void *)(v18 + 16) = sub_10000B2F4;
    *(void *)(v18 + 24) = v19;
    uint64_t v120 = sub_100002C1C(&qword_100019B40);
    uint64_t v117 = _allocateUninitializedArray<A>(_:)(3LL);
    v119 = v20;
    swift_retain(v115);
    uint64_t v21 = v116;
    uint64_t v22 = v115;
    uint64_t v23 = v119;
    void *v119 = sub_10000B280;
    v23[1] = v22;
    swift_retain(v21);
    uint64_t v24 = v118;
    uint64_t v25 = v116;
    id v26 = v119;
    v119[2] = sub_10000B2B0;
    v26[3] = v25;
    swift_retain(v24);
    uint64_t v27 = v117;
    uint64_t v28 = v118;
    uint64_t v29 = v119;
    v119[4] = sub_10000B33C;
    v29[5] = v28;
    sub_10000690C();
    swift_bridgeObjectRelease(v27);
    if (os_log_type_enabled(v121, (os_log_type_t)v122))
    {
      uint64_t v30 = v124;
      id v100 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v99 = sub_100002C1C(&qword_100019DF0);
      uint64_t v101 = sub_100009538(0LL, v99, v99);
      uint64_t v102 = sub_100009538(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      char v103 = &v141;
      v141 = v100;
      uint64_t v104 = &v140;
      uint64_t v140 = v101;
      uint32_t v105 = &v139;
      uint64_t v139 = v102;
      sub_100009590(2LL, &v141);
      sub_100009590(1LL, v103);
      v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B280;
      uint64_t v138 = v115;
      sub_1000095A4(&v137, (uint64_t)v103, (uint64_t)v104, (uint64_t)v105);
      uint64_t v106 = v30;
      if (v30)
      {
        __break(1u);
      }

      else
      {
        v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B2B0;
        uint64_t v138 = v116;
        sub_1000095A4(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
        uint64_t v98 = 0LL;
        v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B33C;
        uint64_t v138 = v118;
        sub_1000095A4(&v137, (uint64_t)&v141, (uint64_t)&v140, (uint64_t)&v139);
        _os_log_impl((void *)&_mh_execute_header, v121, (os_log_type_t)v122, "%s", v100, v110);
        sub_1000095E8(v101, 0LL);
        sub_1000095E8(v102, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v115);
        swift_release(v116);
        swift_release(v118);
      }
    }

    else
    {
      swift_release(v115);
      swift_release(v116);
      swift_release(v118);
    }

    (*(void (**)(char *, uint64_t))(v129 + 8))(v134, v128);
    id v31 = v127;
    uint64_t v92 = (void **)&v123[OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_renderer];
    uint64_t v93 = &v142;
    swift_beginAccess();
    v32 = *v92;
    *uint64_t v92 = v127;

    swift_endAccess(v93);
    uint64_t v33 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 56LL))(v126, 1LL);
    uint64_t v95 = 7LL;
    uint64_t v96 = swift_allocObject(&unk_100014B38, 24LL, 7LL);
    uint64_t v94 = v96 + 16;
    uint64_t v34 = v123;
    swift_unknownObjectWeakInit(v94, v123);

    swift_retain(v96);
    swift_unknownObjectRetain(v135);
    uint64_t v35 = swift_allocObject(&unk_100014D68, 48LL, v95);
    id v36 = v135;
    unint64_t v37 = (void *)v35;
    uint64_t v38 = v96;
    v97 = v37;
    v37[2] = 0LL;
    v37[3] = 0LL;
    v37[4] = v38;
    v37[5] = v36;
    swift_release(v38);
    uint64_t v39 = sub_100002C1C((uint64_t *)&unk_100019BF0);
    uint64_t v40 = sub_1000066B8(v126, (uint64_t)&unk_100019BE8, (uint64_t)v97, v39);
    return swift_release(v40);
  }

uint64_t sub_100007904()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didInitializeWith:)", 0x1EuLL, 1)._countAndFlagsBits;
}

uint64_t sub_100007930()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didInitializeWith:)", 0x1EuLL, 1)._countAndFlagsBits;
}

uint64_t sub_10000795C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a5;
  v5[16] = a4;
  v5[15] = a1;
  v5[11] = v5;
  v5[12] = 0LL;
  v5[13] = 0LL;
  v5[12] = a4 + 16;
  v5[13] = a5;
  return swift_task_switch(sub_1000079A8, 0LL, 0LL);
}

uint64_t sub_1000079A8()
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
    sub_10000C204((id *)(v11 + 112));
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

    uint64_t v3 = (void *)swift_task_alloc(dword_100019B1C);
    *(void *)(v11 + 152) = v3;
    *uint64_t v3 = *(void *)(v11 + 88);
    v3[1] = sub_100007BF8;
    return sub_100004C50(v6);
  }

  else
  {
    uint64_t v10 = *(_BYTE **)(v11 + 120);
    sub_10000C204((id *)(v11 + 112));
    swift_endAccess(v11 + 16);
    *uint64_t v10 = 1;
    return (*(uint64_t (**)(void))(*(void *)(v11 + 88) + 8LL))();
  }

uint64_t sub_100007BF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152LL);
  uint64_t v3 = *(void **)(*(void *)v0 + 144LL);
  *(void *)(*(void *)v0 + 88LL) = *(void *)v0;
  swift_task_dealloc(v1);

  return swift_task_switch(sub_100007C74, 0LL, 0LL);
}

uint64_t sub_100007C74()
{
  uint64_t v1 = *(_BYTE **)(v0 + 120);
  *(void *)(v0 + 88) = v0;
  *uint64_t v1 = 0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 8LL))();
}

uint64_t sub_100007DCC(uint64_t a1)
{
  uint64_t v47 = a1;
  uint64_t v78 = 0LL;
  uint64_t v77 = 0LL;
  uint64_t v45 = 0LL;
  uint64_t v51 = type metadata accessor for Logger(0LL);
  uint64_t v50 = *(void *)(v51 - 8);
  unint64_t v48 = (*(void *)(v50 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = (char *)&v30 - v48;
  uint64_t v49 = (char *)&v30 - v48;
  uint64_t v78 = __chkstk_darwin(v47);
  uint64_t v77 = v2;
  uint64_t v3 = sub_1000105EC();
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 16))(v1, v3, v51);
  uint64_t v66 = (os_log_s *)Logger.logObject.getter(v4);
  int v67 = static os_log_type_t.default.getter();
  uint64_t v54 = &v75;
  uint64_t v75 = 12LL;
  unint64_t v52 = sub_100009400();
  unint64_t v53 = sub_100009468();
  unint64_t v5 = sub_1000094D0();
  UnsignedInteger<>.init<A>(_:)(&v76, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v5);
  uint32_t v55 = v76;
  uint64_t v56 = 17LL;
  uint64_t v58 = 7LL;
  uint64_t v6 = swift_allocObject(&unk_100014D90, 17LL, 7LL);
  uint64_t v7 = v56;
  uint64_t v8 = v58;
  uint64_t v60 = v6;
  *(_BYTE *)(v6 + 16) = 32;
  uint64_t v9 = swift_allocObject(&unk_100014DB8, v7, v8);
  uint64_t v10 = v58;
  uint64_t v61 = v9;
  *(_BYTE *)(v9 + 16) = 8;
  uint64_t v57 = 32LL;
  uint64_t v11 = swift_allocObject(&unk_100014DE0, 32LL, v10);
  uint64_t v12 = v57;
  uint64_t v13 = v58;
  uint64_t v59 = v11;
  *(void *)(v11 + 16) = sub_10000840C;
  *(void *)(v11 + 24) = 0LL;
  uint64_t v14 = swift_allocObject(&unk_100014E08, v12, v13);
  uint64_t v15 = v59;
  uint64_t v63 = v14;
  *(void *)(v14 + 16) = sub_10000B534;
  *(void *)(v14 + 24) = v15;
  uint64_t v65 = sub_100002C1C(&qword_100019B40);
  uint64_t v62 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v64 = v16;
  swift_retain(v60);
  uint64_t v17 = v61;
  uint64_t v18 = v60;
  uint64_t v19 = v64;
  *uint64_t v64 = sub_10000B4C0;
  v19[1] = v18;
  swift_retain(v17);
  uint64_t v20 = v63;
  uint64_t v21 = v61;
  uint64_t v22 = v64;
  v64[2] = sub_10000B4F0;
  v22[3] = v21;
  swift_retain(v20);
  uint64_t v23 = v62;
  uint64_t v24 = v63;
  uint64_t v25 = v64;
  v64[4] = sub_10000B57C;
  v25[5] = v24;
  sub_10000690C();
  swift_bridgeObjectRelease(v23);
  if (os_log_type_enabled(v66, (os_log_type_t)v67))
  {
    uint64_t v26 = v45;
    uint64_t v38 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v37 = sub_100002C1C(&qword_100019DF0);
    uint64_t v39 = sub_100009538(0LL, v37, v37);
    uint64_t v40 = sub_100009538(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v41 = &v72;
    v72 = v38;
    id v42 = &v71;
    uint64_t v71 = v39;
    uint64_t v43 = &v70;
    uint64_t v70 = v40;
    sub_100009590(2LL, &v72);
    sub_100009590(1LL, v41);
    uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B4C0;
    uint64_t v69 = v60;
    sub_1000095A4(&v68, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43);
    uint64_t v44 = v26;
    if (v26)
    {
      __break(1u);
    }

    else
    {
      uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B4F0;
      uint64_t v69 = v61;
      sub_1000095A4(&v68, (uint64_t)&v72, (uint64_t)&v71, (uint64_t)&v70);
      uint64_t v36 = 0LL;
      uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B57C;
      uint64_t v69 = v63;
      sub_1000095A4(&v68, (uint64_t)&v72, (uint64_t)&v71, (uint64_t)&v70);
      _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v67, "%s", v38, v55);
      sub_1000095E8(v39, 0LL);
      sub_1000095E8(v40, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v60);
      swift_release(v61);
      swift_release(v63);
    }
  }

  else
  {
    swift_release(v60);
    swift_release(v61);
    swift_release(v63);
  }

  (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v51);
  uint64_t v30 = (void **)(v46 + OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_renderer);
  id v31 = &v74;
  uint64_t v32 = 33LL;
  uint64_t v33 = 0LL;
  swift_beginAccess();
  uint64_t v27 = *v30;
  *uint64_t v30 = 0LL;

  swift_endAccess(v31);
  uint64_t v34 = (void **)(v46 + OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state);
  uint64_t v35 = &v73;
  swift_beginAccess();
  uint64_t v28 = *v34;
  *uint64_t v34 = 0LL;

  return swift_endAccess(v35);
}

uint64_t sub_10000840C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rendererDidInvalidate(_:)", 0x19uLL, 1)._countAndFlagsBits;
}

void sub_10000848C(uint64_t a1, void *a2)
{
  uint64_t v75 = a1;
  id v74 = a2;
  uint64_t v98 = 0LL;
  uint64_t v97 = 0LL;
  uint64_t v96 = 0LL;
  id v94 = 0LL;
  uint64_t v73 = 0LL;
  uint64_t v72 = 0LL;
  uint64_t v76 = type metadata accessor for Logger(0LL);
  uint64_t v77 = *(void *)(v76 - 8);
  unint64_t v78 = (*(void *)(v77 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint32_t v79 = (char *)&v34 - v78;
  uint64_t v98 = __chkstk_darwin(v75);
  uint64_t v97 = v3;
  uint64_t v96 = v2;
  uint64_t v80 = (id *)(v2 + OBJC_IVAR____TtC19PortraitClockPoster15PosterPresenter_state);
  uint64_t v81 = &v95;
  swift_beginAccess();
  id v82 = *v80;
  id v4 = v82;
  swift_endAccess(v81);
  if (v82)
  {
    id v71 = v82;
    unint64_t v5 = v79;
    id v54 = v82;
    id v94 = v82;
    uint64_t v6 = sub_1000105EC();
    uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v77 + 16))(v5, v6, v76);
    uint64_t v69 = (os_log_s *)Logger.logObject.getter(v7);
    int v70 = static os_log_type_t.default.getter();
    uint64_t v57 = &v92;
    uint64_t v92 = 12LL;
    unint64_t v55 = sub_100009400();
    unint64_t v56 = sub_100009468();
    unint64_t v8 = sub_1000094D0();
    UnsignedInteger<>.init<A>(_:)(&v93, v57, &type metadata for UInt32, &type metadata for Int, v55, v56, v8);
    uint32_t v58 = v93;
    uint64_t v59 = 17LL;
    uint64_t v61 = 7LL;
    uint64_t v9 = swift_allocObject(&unk_100014E30, 17LL, 7LL);
    uint64_t v10 = v59;
    uint64_t v11 = v61;
    uint64_t v63 = v9;
    *(_BYTE *)(v9 + 16) = 32;
    uint64_t v12 = swift_allocObject(&unk_100014E58, v10, v11);
    uint64_t v13 = v61;
    uint64_t v64 = v12;
    *(_BYTE *)(v12 + 16) = 8;
    uint64_t v60 = 32LL;
    uint64_t v14 = swift_allocObject(&unk_100014E80, 32LL, v13);
    uint64_t v15 = v60;
    uint64_t v16 = v61;
    uint64_t v62 = v14;
    *(void *)(v14 + 16) = sub_100008D08;
    *(void *)(v14 + 24) = 0LL;
    uint64_t v17 = swift_allocObject(&unk_100014EA8, v15, v16);
    uint64_t v18 = v62;
    uint64_t v66 = v17;
    *(void *)(v17 + 16) = sub_10000B624;
    *(void *)(v17 + 24) = v18;
    uint64_t v68 = sub_100002C1C(&qword_100019B40);
    uint64_t v65 = _allocateUninitializedArray<A>(_:)(3LL);
    int v67 = v19;
    swift_retain(v63);
    uint64_t v20 = v64;
    uint64_t v21 = v63;
    uint64_t v22 = v67;
    void *v67 = sub_10000B5B0;
    v22[1] = v21;
    swift_retain(v20);
    uint64_t v23 = v66;
    uint64_t v24 = v64;
    uint64_t v25 = v67;
    void v67[2] = sub_10000B5E0;
    v25[3] = v24;
    swift_retain(v23);
    uint64_t v26 = v65;
    uint64_t v27 = v66;
    uint64_t v28 = v67;
    v67[4] = sub_10000B66C;
    v28[5] = v27;
    sub_10000690C();
    swift_bridgeObjectRelease(v26);
    if (os_log_type_enabled(v69, (os_log_type_t)v70))
    {
      uint64_t v29 = v72;
      uint64_t v47 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
      uint64_t v46 = sub_100002C1C(&qword_100019DF0);
      uint64_t v48 = sub_100009538(0LL, v46, v46);
      uint64_t v49 = sub_100009538(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v50 = &v87;
      uint64_t v87 = v47;
      uint64_t v51 = &v86;
      uint64_t v86 = v48;
      unint64_t v52 = &v85;
      uint64_t v85 = v49;
      sub_100009590(2LL, &v87);
      sub_100009590(1LL, v50);
      uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B5B0;
      uint64_t v84 = v63;
      sub_1000095A4(&v83, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52);
      uint64_t v53 = v29;
      if (v29)
      {
        __break(1u);
      }

      else
      {
        uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B5E0;
        uint64_t v84 = v64;
        sub_1000095A4(&v83, (uint64_t)&v87, (uint64_t)&v86, (uint64_t)&v85);
        uint64_t v45 = 0LL;
        uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10000B66C;
        uint64_t v84 = v66;
        sub_1000095A4(&v83, (uint64_t)&v87, (uint64_t)&v86, (uint64_t)&v85);
        _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)v70, "%s", v47, v58);
        sub_1000095E8(v48, 0LL);
        sub_1000095E8(v49, 1LL);
        UnsafeMutablePointer.deallocate()();
        swift_release(v63);
        swift_release(v64);
        swift_release(v66);
      }
    }

    else
    {
      swift_release(v63);
      swift_release(v64);
      swift_release(v66);
    }

    (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v76);
    id v39 = [v74 type];
    id v30 = v39;
    uint64_t v38 = PRRenderingEventTypeSwipeLeft;
    id v31 = PRRenderingEventTypeSwipeLeft;
    uint64_t v43 = (id *)&v91;
    uint64_t v91 = v38;
    uint64_t v40 = &v90;
    id v90 = v39;
    uint64_t v41 = type metadata accessor for PRRenderingEventType(0LL);
    unint64_t v42 = sub_10000435C();
    int v44 = dispatch thunk of static Equatable.== infix(_:_:)(v43, v40);
    sub_10000B678(v43);
    if ((v44 & 1) != 0)
    {

      PortraitClockScreenSaverViewModel.requestPreviousAsset()();
    }

    else
    {

      id v32 = v39;
      uint64_t v35 = PRRenderingEventTypeSwipeRight;
      id v33 = PRRenderingEventTypeSwipeRight;
      uint64_t v36 = (id *)&v89;
      uint64_t v89 = v35;
      id v88 = v39;
      int v37 = dispatch thunk of static Equatable.== infix(_:_:)(&v89, &v88);
      sub_10000B678(v36);
      if ((v37 & 1) != 0)
      {

        PortraitClockScreenSaverViewModel.requestNextAsset()();
      }

      else
      {
      }
    }

    PortraitClockScreenSaverViewModel.resetUserActivityTimer()();
  }

uint64_t sub_100008D08()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("renderer(_:didReceive:)", 0x17uLL, 1)._countAndFlagsBits;
}

uint64_t sub_100008EE0()
{
  return _allocateUninitializedArray<A>(_:)(0LL);
}

uint64_t sub_100009054()
{
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000911C(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc(dword_100019C0C);
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_1000091BC;
  return sub_100009054();
}

uint64_t sub_1000091BC()
{
  uint64_t v6 = *v0;
  uint64_t v1 = *(void *)(*v0 + 48);
  aBlock = *(void (***)(void))(*v0 + 40);
  uint64_t v3 = *(void **)(*v0 + 32);
  id v4 = *(void **)(*v0 + 24);
  *(void *)(v6 + 16) = *v0;
  swift_task_dealloc(v1);

  aBlock[2]();
  _Block_release(aBlock);
  return (*(uint64_t (**)(void))(*(void *)(v6 + 16) + 8LL))();
}

uint64_t sub_100009258(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v2 = sub_100002C1C((uint64_t *)&unk_100019B20);
  unint64_t v16 = (*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v2);
  uint64_t v24 = (char *)&v15 - v16;
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 56LL))(v24, 1LL);
  uint64_t v19 = 48LL;
  uint64_t v20 = 7LL;
  uint64_t v4 = swift_allocObject(&unk_100014F88, 48LL, 7LL);
  uint64_t v5 = v17;
  uint64_t v6 = (void *)v4;
  uint64_t v7 = v18;
  uint64_t v23 = v6;
  v6[2] = 0LL;
  v6[3] = 0LL;
  v6[4] = v7;
  v6[5] = v5;
  uint64_t v21 = v6[2];
  uint64_t v22 = v6[3];
  swift_unknownObjectRetain(v21);
  uint64_t v8 = swift_allocObject(&unk_100014FB0, v19, v20);
  uint64_t v9 = v22;
  uint64_t v10 = v23;
  uint64_t v11 = (void *)v8;
  uint64_t v12 = (uint64_t)v24;
  v11[2] = v21;
  v11[3] = v9;
  v11[4] = &unk_100019D10;
  v11[5] = v10;
  uint64_t v13 = sub_1000099C0(v12, (uint64_t)&unk_100019D20, (uint64_t)v11);
  return swift_release(v13);
}

  ;
}

unint64_t sub_100009400()
{
  uint64_t v2 = qword_100019DD0;
  if (!qword_100019DD0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019DD0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100009468()
{
  uint64_t v2 = qword_100019B30;
  if (!qword_100019B30)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019B30);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000094D0()
{
  uint64_t v2 = qword_100019DE0;
  if (!qword_100019DE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019DE0);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_100009538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100009590(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000095A4( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_1000095E8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }

uint64_t sub_100009654(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_1000096D8;
  return v5(a1);
}

uint64_t sub_1000096D8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000973C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume(a2);
}

uint64_t sub_10000978C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocError(a4, a5, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v5, a1);
  return swift_continuation_throwingResumeWithError(a2, v9);
}

void sub_1000097FC()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_100009808(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = v3;
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_100009884;
  return v6();
}

uint64_t sub_100009884()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000098E4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = v4;
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = *(void *)(v4 + 16);
  v5[1] = sub_100009960;
  return v7();
}

uint64_t sub_100009960()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_1000099C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 48))(a1, 1LL) == 1)
  {
    sub_10000C050(a1);
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
  swift_unknownObjectRetain(v13);
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

  uint64_t v6 = swift_allocObject(&unk_100014FD8, 32LL, 7LL);
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = 0LL;
  if (v10 != 0 || v11 != 0)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    v21[2] = v10;
    v21[3] = v11;
    uint64_t v7 = v21;
  }

  return swift_task_create(v15 | 0x1C00, v7, (char *)&type metadata for () + 8, &unk_100019D30, v6);
}

uint64_t sub_100009BE0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_100009C64;
  return v5(a1);
}

uint64_t sub_100009C64()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100009CC8(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_100009CE8(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v9 = v5;
  uint64_t v6 = sub_100009D64(v4, v5, a3);
  uint64_t v10 = *a1;
  uint64_t v12 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  swift_bridgeObjectRelease(v9);
  uint64_t result = a1;
  *a1 = v10 + 8;
  return result;
}

uint64_t sub_100009D64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_100009ED4((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
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
      sub_10000C3EC((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    sub_10000C384(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_10000C3EC((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    sub_10000C384(v13);
  }

  return v11;
}

uint64_t sub_100009ED4(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
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
          sub_10000A248(v22, v15, a2);
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
    uint64_t v6 = sub_10000A284(a5, a6);
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

void *sub_10000A248(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_10000A284(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_10000A334(a1, a2);
  sub_10000A4AC();
  uint64_t v4 = v6[2];
  sub_10000A520(v4);
  sub_10000A5A0(v4, 0);
  sub_10000A60C();
  swift_retain(v6);
  uint64_t v5 = sub_10000A618((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_10000A334(uint64_t a1, uint64_t a2)
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
    return sub_10000A794();
  }
  uint64_t v5 = sub_10000A62C(v7, 0LL);
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
    sub_10000C460((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_10000A4AC()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_10000A618(*v3);
    uint64_t result = sub_10000A7C0(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }

  return result;
}

uint64_t sub_10000A520(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = sub_10000A7C0(*(void *)(*(void *)v1 + 24LL) >> 1 != 0LL, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t sub_10000A5A0(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_10000A60C()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_10000A618(uint64_t a1)
{
  return sub_10000AABC(a1);
}

void *sub_10000A62C(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = sub_100002C1C(&qword_100019D58);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((sub_10000C430() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + sub_10000C43C(v6);
      ((void (*)(void))swift_retain)();
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
    ((void (*)(void))swift_retain)();
    return &_swiftEmptyArrayStorage;
  }

void *sub_10000A794()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000A7C0(char a1, uint64_t a2, char a3, uint64_t a4)
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
    uint64_t v5 = sub_100002C1C(&qword_100019D58);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((sub_10000C430() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + sub_10000C43C(v8);
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
    sub_10000AAF8((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release(a4);
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    sub_10000AAC4((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t sub_10000AABC(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_10000AAC4(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_10000AAF8(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

_BYTE **sub_10000ABA8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000ABBC()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000ABE4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000ABEC()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000AC14(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000AC1C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000AC58()
{
  return sub_100009CC8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000AC64()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000ACA0(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100009CE8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000ACB0()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_10000ACEC()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000AD38(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019B4C);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000ADDC;
  return sub_10000590C(a1, v5, v6, v7, v8);
}

uint64_t sub_10000ADDC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000AE3C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000AE64(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000AE6C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000AE94(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000AE9C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000AED8()
{
  return sub_100009CC8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000AEE4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000AF20(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100009CE8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_10000AF2C()
{
  uint64_t v2 = qword_100019B60;
  if (!qword_100019B60)
  {
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for PortraitClockScreenSaverView,  &type metadata for PortraitClockScreenSaverView);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019B60);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10000AF94()
{
  uint64_t v3 = qword_100019B68;
  if (!qword_100019B68)
  {
    uint64_t v0 = type metadata accessor for PortraitClockScreenSaverViewModel(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for PortraitClockScreenSaverViewModel, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019B68);
    return WitnessTable;
  }

  return v3;
}

id *sub_10000B004(id *a1)
{
  return a1;
}

void *sub_10000B038(uint64_t a1, void *a2)
{
  id v5 = *(id *)a1;
  id v2 = *(id *)a1;
  *a2 = v5;
  a2[1] = *(void *)(a1 + 8);
  swift_unknownObjectWeakCopyInit(a2 + 2, a1 + 16);
  a2[3] = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  swift_retain();
  a2[4] = v7;
  uint64_t v8 = *(void **)(a1 + 40);
  id v3 = v8;
  uint64_t result = a2;
  a2[5] = v8;
  return result;
}

uint64_t sub_10000B0CC(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000B118( id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000B140( id *a1)
{
}

uint64_t sub_10000B168()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B190(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B198()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B1C0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B1C8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000B204()
{
  return sub_100009CC8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B210()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000B24C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100009CE8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000B258()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B280(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B288()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B2B0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B2B8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000B2F4()
{
  return sub_100009CC8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B300()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000B33C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100009CE8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000B348()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000B394(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019B84);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000B438;
  return sub_10000795C(a1, v5, v6, v7, v8);
}

uint64_t sub_10000B438()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000B498()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B4C0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B4C8()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B4F0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B4F8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000B534()
{
  return sub_100009CC8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B540()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000B57C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100009CE8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000B588()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B5B0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B5B8()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10000B5E0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10000ABA8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000B5E8()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000B624()
{
  return sub_100009CC8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000B630()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10000B66C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100009CE8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000B678( id *a1)
{
}

unint64_t sub_10000B6A0()
{
  uint64_t v3 = qword_100019C00;
  if (!qword_100019C00)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PREditingLook);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019C00);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10000B704()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_10000B750()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  uint64_t v6 = (void *)v0[2];
  size_t v4 = (const void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019C14);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10000B7FC;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_100019C10 + dword_100019C10))( v6,  v4,  v5);
}

uint64_t sub_10000B7FC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for PosterPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC19PortraitClockPoster15PosterPresenter);
}

void *sub_10000B880(void *a1, id *a2)
{
  id v4 = *a2;
  id v2 = *a2;
  uint64_t result = a1;
  *a1 = v4;
  return result;
}

void sub_10000B8B4(id *a1)
{
}

void *sub_10000B8CC(void *a1, id *a2)
{
  id v4 = *a2;
  id v2 = *a2;
  uint64_t result = a1;
  *a1 = v4;
  return result;
}

id *sub_10000B900(id *a1, id *a2)
{
  id v5 = *a1;
  id v4 = *a2;
  id v2 = *a2;
  *a1 = v4;

  return a1;
}

void *sub_10000B948(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **sub_10000B954(void **a1, void **a2)
{
  id v2 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_10000B988(uint64_t a1, unsigned int a2)
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

uint64_t sub_10000BAFC(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10000BCF8(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for PortraitClockScreenSaverViewModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48LL))(a1, 1LL);
}

uint64_t sub_10000BD38(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for PortraitClockScreenSaverViewModel(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, a2, 1LL);
}

void *type metadata accessor for PosterPresenter.State()
{
  return &unk_100014F68;
}

uint64_t sub_10000BD90()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000BDD4()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  uint64_t v6 = v0[2];
  uint64_t v4 = v0[3];
  int v5 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019D0C);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10000BE8C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100019D08 + dword_100019D08))(v6, v4, v5);
}

uint64_t sub_10000BE8C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000BEEC()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000BF30(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_100019D1C);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000BFF0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100019D18 + dword_100019D18))( a1,  v5,  v6,  v7);
}

uint64_t sub_10000BFF0()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000C050(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_10000C0C0()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10000C0FC(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc(dword_100019D2C);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000C1A4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100019D28 + dword_100019D28))(a1, v5);
}

uint64_t sub_10000C1A4()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000C204( id *a1)
{
}

uint64_t sub_10000C22C()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_10000C270(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_100019D3C);
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = *(void *)(v2 + 16);
  v3[1] = sub_10000C324;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100019D38 + dword_100019D38))(a1, v5);
}

uint64_t sub_10000C324()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10000C384(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_10000C3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_10000C430()
{
  return 1LL;
}

size_t sub_10000C43C(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000C460( uint64_t a1)
{
}

id sub_10000C488(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_10000C4C0(a1);
}

id sub_10000C4C0(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v1);
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  id v3 = a1;
  *(void *)&v6[OBJC_IVAR____TtC19PortraitClockPoster13PosterUpdater_serviceProxy] = a1;

  v10.receiver = v12;
  v10.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v10, "init");
  id v4 = v9;
  id v12 = v9;

  return v9;
}

uint64_t sub_10000C570(uint64_t a1)
{
  v2[39] = v1;
  v2[38] = a1;
  v2[18] = v2;
  v2[19] = 0LL;
  v2[21] = 0LL;
  v2[22] = 0LL;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[40] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[41] = v4;
  uint64_t v8 = *(void *)(v4 + 64);
  v2[42] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[43] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[44] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for IdlePosterState(0LL);
  v2[45] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[46] = v6;
  uint64_t v9 = *(void *)(v6 + 64);
  v2[47] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[48] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2[19] = v1;
  return swift_task_switch(sub_10000C684, 0LL, 0LL);
}

uint64_t sub_10000C684()
{
  uint64_t v1 = *(void *)(v0 + 312);
  *(void *)(v0 + 144) = v0;
  id v5 = *(id *)(v1 + OBJC_IVAR____TtC19PortraitClockPoster13PosterUpdater_serviceProxy);
  *(void *)(v0 + 392) = v5;
  id v2 = v5;
  swift_beginAccess(&TVISAmbientSnapshotQueryIntentSyncing);
  uint64_t v4 = TVISAmbientSnapshotQueryIntentSyncing;
  swift_endAccess(v0 + 120);
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v0 + 144);
  *(void *)(v0 + 56) = v0 + 160;
  *(void *)(v0 + 24) = sub_10000C78C;
  *(void *)(v0 + 112) = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(_DWORD *)(v0 + 88) = 0x40000000;
  *(_DWORD *)(v0 + 92) = 0;
  *(void *)(v0 + 96) = sub_10000574C;
  *(void *)(v0 + 104) = &unk_100015018;
  [v5 queryCurrentSnapshotWithIntent:v4 reply:v0 + 80];
  return j__swift_continuation_await_0(v0 + 16);
}

uint64_t sub_10000C78C()
{
  uint64_t v1 = (void *)*v0;
  v1[18] = *v0;
  uint64_t v2 = v1[6];
  v1[50] = v2;
  if (v2) {
    return swift_task_switch(sub_10000CC74, 0LL, 0LL);
  }
  else {
    return swift_task_switch(sub_10000C82C, 0LL, 0LL);
  }
}

uint64_t sub_10000C82C()
{
  uint64_t v25 = (void *)v0[49];
  uint64_t v27 = v0[48];
  uint64_t v28 = v0[47];
  uint64_t v26 = v0[46];
  uint64_t v29 = v0[45];
  uint64_t v1 = v0[44];
  uint64_t v30 = v0[41];
  uint64_t v31 = v0[40];
  v0[18] = v0;
  swift_unknownObjectRelease(v0[20]);

  (*(void (**)(uint64_t, void, uint64_t))(v26 + 104))(v28, enum case for IdlePosterState.normal(_:), v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v27, v28, v29);
  uint64_t v2 = sub_1000105EC();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v1, v2, v31);
  uint64_t v36 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v35 = static os_log_type_t.default.getter();
  v0[33] = 2LL;
  unint64_t v32 = sub_100009400();
  unint64_t v33 = sub_100009468();
  unint64_t v4 = sub_1000094D0();
  UnsignedInteger<>.init<A>(_:)(v0 + 52, v0 + 33, &type metadata for UInt32, &type metadata for Int, v32, v33, v4);
  uint32_t v34 = *((_DWORD *)v0 + 104);
  sub_100002C1C(&qword_100019B40);
  uint64_t v37 = _allocateUninitializedArray<A>(_:)(0LL);
  if (os_log_type_enabled(v36, v35))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v18 = sub_100002C1C(&qword_100019DF0);
    uint64_t v20 = sub_100009538(0LL, v18, v18);
    uint64_t v21 = sub_100009538(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v24 + 272) = buf;
    *(void *)(v24 + 280) = v20;
    *(void *)(v24 + 288) = v21;
    sub_100009590(0LL, (_BYTE **)(v24 + 272));
    sub_100009590(0LL, (_BYTE **)(v24 + 272));
    *(void *)(v24 + 296) = v37;
    uint64_t v22 = (void *)swift_task_alloc(48LL);
    v22[2] = v24 + 272;
    v22[3] = v24 + 280;
    void v22[4] = v24 + 288;
    uint64_t v23 = sub_100002C1C(&qword_100019DF8);
    unint64_t v5 = sub_10000EF74();
    Sequence.forEach(_:)(sub_10000F010, v22, v23, v5);
    swift_task_dealloc(v22);
    _os_log_impl((void *)&_mh_execute_header, v36, v35, "Poster is normal.", buf, v34);
    sub_1000095E8(v20, 0LL);
    sub_1000095E8(v21, 0LL);
    UnsafeMutablePointer.deallocate()();
  }

  swift_bridgeObjectRelease(v37);
  uint64_t v9 = *(void *)(v24 + 352);
  uint64_t v8 = *(void *)(v24 + 328);
  uint64_t v10 = *(void *)(v24 + 320);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  uint64_t v13 = *(void *)(v24 + 384);
  uint64_t v14 = *(void *)(v24 + 376);
  uint64_t v11 = *(void *)(v24 + 368);
  uint64_t v12 = *(void *)(v24 + 360);
  uint64_t v15 = *(void *)(v24 + 352);
  uint64_t v16 = *(void *)(v24 + 344);
  uint64_t v17 = *(void *)(v24 + 336);
  (*(void (**)(void))(v11 + 16))();
  char v6 = sub_10000D654();
  IdlePosterInfo.init(posterState:shouldHideInSwitcher:)(v14, v6 & 1);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(*(void *)(v24 + 144) + 8LL))();
}

uint64_t sub_10000CC74()
{
  uint64_t v68 = v0[50];
  int v67 = (void *)v0[49];
  v0[18] = v0;
  swift_willThrow();

  swift_errorRetain(v68);
  v0[21] = v68;
  swift_errorRetain(v68);
  uint64_t v69 = (void *)_convertErrorToNSError(_:)();
  v0[22] = v69;
  swift_errorRelease();
  id v74 = [v69 domain];
  uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v74);
  uint64_t v73 = v1;
  uint64_t v72 = (void *)TVISAmbientServiceErrorDomain;
  id v2 = TVISAmbientServiceErrorDomain;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
  uint64_t v71 = v4;
  char v75 = static String.== infix(_:_:)(v70, v73, v3);
  swift_bridgeObjectRelease(v71);

  swift_bridgeObjectRelease(v73);
  if ((v75 & 1) != 0 && [v69 code] == (id)2)
  {
    uint64_t v55 = *(void *)(v66 + 384);
    unint64_t v56 = *(Swift::String **)(v66 + 376);
    uint64_t v54 = *(void *)(v66 + 368);
    uint64_t v57 = *(void *)(v66 + 360);
    uint64_t v5 = *(void *)(v66 + 344);
    uint64_t v58 = *(void *)(v66 + 328);
    uint64_t v59 = *(void *)(v66 + 320);
    *unint64_t v56 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_STILL_SYNCING", 0x14uLL, 1);
    (*(void (**)(void))(v54 + 104))();
    (*(void (**)(uint64_t, Swift::String *, uint64_t))(v54 + 32))(v55, v56, v57);
    uint64_t v6 = sub_1000105EC();
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v5, v6, v59);
    uint64_t v64 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v63 = static os_log_type_t.default.getter();
    *(void *)(v66 + 224) = 2LL;
    unint64_t v60 = sub_100009400();
    unint64_t v61 = sub_100009468();
    unint64_t v8 = sub_1000094D0();
    UnsignedInteger<>.init<A>(_:)( (void *)(v66 + 412),  v66 + 224,  &type metadata for UInt32,  &type metadata for Int,  v60,  v61,  v8);
    uint32_t v62 = *(_DWORD *)(v66 + 412);
    sub_100002C1C(&qword_100019B40);
    uint64_t v65 = _allocateUninitializedArray<A>(_:)(0LL);
    if (os_log_type_enabled(v64, v63))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v48 = sub_100002C1C(&qword_100019DF0);
      uint64_t v50 = sub_100009538(0LL, v48, v48);
      uint64_t v51 = sub_100009538(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      *(void *)(v66 + 232) = buf;
      *(void *)(v66 + 240) = v50;
      *(void *)(v66 + 248) = v51;
      sub_100009590(0LL, (_BYTE **)(v66 + 232));
      sub_100009590(0LL, (_BYTE **)(v66 + 232));
      *(void *)(v66 + 256) = v65;
      unint64_t v52 = (void *)swift_task_alloc(48LL);
      v52[2] = v66 + 232;
      v52[3] = v66 + 240;
      v52[4] = v66 + 248;
      uint64_t v53 = sub_100002C1C(&qword_100019DF8);
      unint64_t v9 = sub_10000EF74();
      Sequence.forEach(_:)(sub_10000EFE4, v52, v53, v9);
      swift_task_dealloc(v52);
      _os_log_impl((void *)&_mh_execute_header, v64, v63, "Poster is still syncing.", buf, v62);
      sub_1000095E8(v50, 0LL);
      sub_1000095E8(v51, 0LL);
      UnsafeMutablePointer.deallocate()();
    }

    swift_bridgeObjectRelease(v65);
    uint64_t v46 = *(void *)(v66 + 344);
    uint64_t v45 = *(void *)(v66 + 328);
    uint64_t v47 = *(void *)(v66 + 320);

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
  }

  else
  {
    uint64_t v34 = *(void *)(v66 + 384);
    os_log_type_t v35 = *(Swift::String **)(v66 + 376);
    uint64_t v33 = *(void *)(v66 + 368);
    uint64_t v36 = *(void *)(v66 + 360);
    uint64_t v10 = *(void *)(v66 + 336);
    uint64_t v37 = *(void *)(v66 + 328);
    uint64_t v38 = *(void *)(v66 + 320);
    *os_log_type_t v35 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_NOT_SETUP", 0x10uLL, 1);
    (*(void (**)(void))(v33 + 104))();
    (*(void (**)(uint64_t, Swift::String *, uint64_t))(v33 + 32))(v34, v35, v36);
    uint64_t v11 = sub_1000105EC();
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v10, v11, v38);
    oslog = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v42 = static os_log_type_t.default.getter();
    *(void *)(v66 + 184) = 2LL;
    unint64_t v39 = sub_100009400();
    unint64_t v40 = sub_100009468();
    unint64_t v13 = sub_1000094D0();
    UnsignedInteger<>.init<A>(_:)( (void *)(v66 + 408),  v66 + 184,  &type metadata for UInt32,  &type metadata for Int,  v39,  v40,  v13);
    uint32_t size = *(_DWORD *)(v66 + 408);
    sub_100002C1C(&qword_100019B40);
    uint64_t v44 = _allocateUninitializedArray<A>(_:)(0LL);
    if (os_log_type_enabled(oslog, v42))
    {
      uint64_t v28 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v27 = sub_100002C1C(&qword_100019DF0);
      uint64_t v29 = sub_100009538(0LL, v27, v27);
      uint64_t v30 = sub_100009538(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      *(void *)(v66 + 192) = v28;
      *(void *)(v66 + 200) = v29;
      *(void *)(v66 + 208) = v30;
      sub_100009590(0LL, (_BYTE **)(v66 + 192));
      sub_100009590(0LL, (_BYTE **)(v66 + 192));
      *(void *)(v66 + 2swift_unknownObjectWeakDestroy(v0 + 16) = v44;
      uint64_t v31 = (void *)swift_task_alloc(48LL);
      v31[2] = v66 + 192;
      v31[3] = v66 + 200;
      v31[4] = v66 + 208;
      uint64_t v32 = sub_100002C1C(&qword_100019DF8);
      unint64_t v14 = sub_10000EF74();
      Sequence.forEach(_:)(sub_10000EF48, v31, v32, v14);
      swift_task_dealloc(v31);
      _os_log_impl((void *)&_mh_execute_header, oslog, v42, "Poster is not setup.", v28, size);
      sub_1000095E8(v29, 0LL);
      sub_1000095E8(v30, 0LL);
      UnsafeMutablePointer.deallocate()();
    }

    swift_bridgeObjectRelease(v44);
    uint64_t v25 = *(void *)(v66 + 336);
    uint64_t v24 = *(void *)(v66 + 328);
    uint64_t v26 = *(void *)(v66 + 320);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
  }

  swift_errorRelease();
  swift_errorRelease();
  uint64_t v19 = *(void *)(v66 + 384);
  uint64_t v20 = *(void *)(v66 + 376);
  uint64_t v17 = *(void *)(v66 + 368);
  uint64_t v18 = *(void *)(v66 + 360);
  uint64_t v21 = *(void *)(v66 + 352);
  uint64_t v22 = *(void *)(v66 + 344);
  uint64_t v23 = *(void *)(v66 + 336);
  (*(void (**)(void))(v17 + 16))();
  char v15 = sub_10000D654();
  IdlePosterInfo.init(posterState:shouldHideInSwitcher:)(v20, v15 & 1);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(*(void *)(v66 + 144) + 8LL))();
}

uint64_t sub_10000D654()
{
  return 0LL;
}

uint64_t sub_10000D660()
{
  if (!"PortraitClockPoster.PosterUpdater")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_10000F8A0( (uint64_t)"PortraitClockPoster.PosterUpdater",  33LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"PortraitClockPoster/PosterUpdater.swift",  39LL,  2,  v2,  0xBuLL,  0xDuLL);
  __break(1u);
  return result;
}

id sub_10000D790()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000D80C()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("POSTER_TITLE", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  xmmword_10001A4E0 = (__int128)v1;
  return result;
}

__int128 *sub_10000D84C()
{
  if (qword_1000198B0 != -1) {
    swift_once(&qword_1000198B0, sub_10000D80C);
  }
  return &xmmword_10001A4E0;
}

uint64_t sub_10000D8A0(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[2] = v3;
  v3[3] = 0LL;
  v3[4] = 0LL;
  v3[5] = 0LL;
  v3[6] = 0LL;
  uint64_t v4 = type metadata accessor for IdlePosterInfo(0LL);
  v3[8] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[9] = v5;
  v3[10] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return swift_task_switch(sub_10000D970, 0LL, 0LL);
}

uint64_t sub_10000D970()
{
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v0;
  uint64_t v12 = (void *)TVISAmbientPosterServiceIdentifierPortraitClock;
  id v1 = TVISAmbientPosterServiceIdentifierPortraitClock;
  char IsAvailable = TVISAmbientPosterServiceIsAvailable(v12);

  if ((IsAvailable & 1) != 0)
  {
    sub_10000F0A0();
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PortraitClockPoster", 0x13uLL, 1);
    uint64_t v7 = (void *)PRPosterRoleAmbient;
    id v3 = PRPosterRoleAmbient;
    id v9 = sub_10000DD40(v2._countAndFlagsBits, (uint64_t)v2._object, v7);
    v11[11] = v9;
    v11[6] = v9;
    uint64_t v8 = *((void *)sub_10000D84C() + 1);
    swift_bridgeObjectRetain(v8);
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    [v9 setDisplayNameLocalizationKey:v10];

    uint64_t v4 = (void *)swift_task_alloc(dword_100019DCC);
    v11[12] = v4;
    *uint64_t v4 = v11[2];
    v4[1] = sub_10000DB54;
    return sub_10000C570(v11[10]);
  }

  else
  {
    sub_10000F03C();
    uint64_t v6 = _allocateUninitializedArray<A>(_:)(0LL);
    swift_task_dealloc(v11[10]);
    return (*(uint64_t (**)(uint64_t))(v11[2] + 8LL))(v6);
  }

uint64_t sub_10000DB54()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96LL);
  *(void *)(*(void *)v0 + 16LL) = *(void *)v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_10000DBC0, 0LL, 0LL);
}

uint64_t sub_10000DBC0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = v0;
  PRMutablePosterDescriptor.setIdlePosterInfo(_:)(v1);
  id v10 = (id)v11[11];
  uint64_t v9 = v11[10];
  uint64_t v7 = v11[9];
  uint64_t v8 = v11[8];
  sub_10000F03C();
  uint64_t v6 = _allocateUninitializedArray<A>(_:)(1LL);
  uint64_t v5 = v2;
  id v3 = v10;
  *uint64_t v5 = v10;
  sub_10000690C();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);

  swift_task_dealloc(v11[10]);
  return (*(uint64_t (**)(uint64_t))(v11[2] + 8LL))(v6);
}

id sub_10000DD40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  id v7 =  [(id)((uint64_t (*)())swift_getObjCClassFromMetadata)() mutableDescriptorWithIdentifier:v5 role:a3];

  swift_bridgeObjectRelease(a2);
  return v7;
}

uint64_t sub_10000DE58(void *a1, void *a2, const void *a3, void *a4)
{
  v4[5] = a4;
  v4[4] = a2;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  v4[7] = sub_10000F03C();
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a1, &type metadata for String);
  v4[8] = v15;
  uint64_t v9 = (void *)swift_task_alloc(dword_100019E0C);
  *(void *)(v13 + 72) = v9;
  *uint64_t v9 = *(void *)(v13 + 16);
  v9[1] = sub_10000DF3C;
  return sub_10000D8A0(v15, (uint64_t)a2);
}

void *sub_10000DF3C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 72);
  *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = *v2;
  unint64_t v14 = (void *)(v3 + 16);
  uint64_t v15 = (void *)(v3 + 16);
  swift_task_dealloc(v4);
  if (v1)
  {
    id v10 = (void (**)(void *, void))v14[4];
    id v9 = (id)((uint64_t (*)())_convertErrorToNSError(_:))();
    v10[2](v10, 0LL);

    _Block_release(v10);
    ((void (*)())swift_errorRelease)();
  }

  else
  {
    aBlock = (void (**)(void))v14[4];
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease(a1);
  }

  id v7 = (void *)v14[3];
  id v8 = (void *)v14[2];
  id v6 = (void *)v14[1];
  swift_bridgeObjectRelease(v14[6]);

  return (*(void *(**)(void *__return_ptr))(*v15 + 8LL))(v15);
}

uint64_t sub_10000E084(uint64_t a1, uint64_t a2)
{
  v3[18] = v2;
  v3[17] = a1;
  v3[2] = v3;
  v3[3] = 0LL;
  v3[4] = 0LL;
  v3[5] = 0LL;
  v3[8] = 0LL;
  uint64_t v4 = type metadata accessor for IdlePosterInfo(0LL);
  v3[19] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[20] = v5;
  uint64_t v9 = *(void *)(v5 + 64);
  v3[21] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[22] = swift_task_alloc((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  v3[23] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[24] = v7;
  uint64_t v10 = *(void *)(v7 + 64);
  v3[25] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[26] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return swift_task_switch(sub_10000E1BC, 0LL, 0LL);
}

uint64_t sub_10000E1BC()
{
  uint64_t v1 = v0[26];
  uint64_t v21 = v0[24];
  uint64_t v22 = v0[23];
  v0[2] = v0;
  uint64_t v2 = sub_1000105EC();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
  v0[27] = v3;
  uint64_t v4 = v3(v1, v2, v22);
  uint64_t v27 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v26 = static os_log_type_t.default.getter();
  v0[6] = 2LL;
  unint64_t v23 = sub_100009400();
  v0[28] = v23;
  unint64_t v24 = sub_100009468();
  v0[29] = v24;
  unint64_t v5 = sub_1000094D0();
  v0[30] = v5;
  UnsignedInteger<>.init<A>(_:)(v0 + 35, v0 + 6, &type metadata for UInt32, &type metadata for Int, v23, v24, v5);
  uint32_t v25 = *((_DWORD *)v0 + 70);
  v0[31] = sub_100002C1C(&qword_100019B40);
  uint64_t v28 = _allocateUninitializedArray<A>(_:)(0LL);
  if (os_log_type_enabled(v27, v26))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v14 = sub_100002C1C(&qword_100019DF0);
    uint64_t v16 = sub_100009538(0LL, v14, v14);
    uint64_t v17 = sub_100009538(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v20 + 104) = buf;
    *(void *)(v20 + 112) = v16;
    *(void *)(v20 + 120) = v17;
    sub_100009590(0LL, (_BYTE **)(v20 + 104));
    sub_100009590(0LL, (_BYTE **)(v20 + 104));
    *(void *)(v20 + 128) = v28;
    uint64_t v18 = (void *)swift_task_alloc(48LL);
    v18[2] = v20 + 104;
    v18[3] = v20 + 112;
    v18[4] = v20 + 120;
    uint64_t v19 = sub_100002C1C(&qword_100019DF8);
    unint64_t v6 = sub_10000EF74();
    Sequence.forEach(_:)(sub_10000F370, v18, v19, v6);
    swift_task_dealloc(v18);
    _os_log_impl((void *)&_mh_execute_header, v27, v26, "Updating configuration...", buf, v25);
    sub_1000095E8(v16, 0LL);
    sub_1000095E8(v17, 0LL);
    UnsafeMutablePointer.deallocate()();
  }

  swift_bridgeObjectRelease(v28);
  *(void *)(v20 + 256) = 0LL;
  uint64_t v12 = *(void *)(v20 + 208);
  uint64_t v11 = *(void *)(v20 + 192);
  uint64_t v13 = *(void *)(v20 + 184);

  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  *(void *)(v20 + 264) = v7;
  uint64_t v8 = v7(v12, v13);
  PRPosterConfiguration.getIdlePosterInfo()(v8);
  uint64_t v9 = (void *)swift_task_alloc(dword_100019DCC);
  *(void *)(v20 + 272) = v9;
  *uint64_t v9 = *(void *)(v20 + 16);
  v9[1] = sub_10000E59C;
  return sub_10000C570(*(void *)(v20 + 168));
}

uint64_t sub_10000E59C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 272LL);
  *(void *)(*(void *)v0 + 16LL) = *(void *)v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_10000E608, 0LL, 0LL);
}

uint64_t sub_10000E608()
{
  uint64_t v56 = v0[22];
  uint64_t v55 = v0[21];
  v0[2] = v0;
  sub_10000F270();
  if ((dispatch thunk of static Equatable.== infix(_:_:)(v56, v55) & 1) != 0)
  {
    uint64_t v21 = *(void *)(v54 + 176);
    uint64_t v20 = *(void *)(v54 + 168);
    uint64_t v19 = *(void *)(v54 + 160);
    uint64_t v22 = *(void *)(v54 + 152);
    id v8 = *(id *)(v54 + 136);
    unint64_t v23 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v23(v20, v22);
    v23(v21, v22);
    id v31 = *(id *)(v54 + 136);
    goto LABEL_10;
  }

  uint64_t v49 = *(void *)(v54 + 240);
  uint64_t v48 = *(void *)(v54 + 232);
  uint64_t v47 = *(void *)(v54 + 224);
  uint64_t v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 216);
  uint64_t v1 = *(void *)(v54 + 200);
  uint64_t v45 = *(void *)(v54 + 184);
  uint64_t v2 = sub_1000105EC();
  uint64_t v3 = v46(v1, v2, v45);
  unint64_t v52 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v51 = static os_log_type_t.default.getter();
  *(void *)(v54 + 56) = 2LL;
  UnsignedInteger<>.init<A>(_:)( (void *)(v54 + 284),  v54 + 56,  &type metadata for UInt32,  &type metadata for Int,  v47,  v48,  v49);
  uint32_t v50 = *(_DWORD *)(v54 + 284);
  uint64_t v53 = _allocateUninitializedArray<A>(_:)(0LL);
  if (os_log_type_enabled(v52, v51))
  {
    uint64_t v4 = *(void *)(v54 + 256);
    unint64_t v40 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v39 = sub_100002C1C(&qword_100019DF0);
    uint64_t v41 = sub_100009538(0LL, v39, v39);
    uint64_t v42 = sub_100009538(0LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    *(void *)(v54 + 72) = v40;
    *(void *)(v54 + 80) = v41;
    *(void *)(v54 + 88) = v42;
    sub_100009590(0LL, (_BYTE **)(v54 + 72));
    sub_100009590(0LL, (_BYTE **)(v54 + 72));
    *(void *)(v54 + 96) = v53;
    uint64_t v43 = (void *)swift_task_alloc(48LL);
    v43[2] = v54 + 72;
    v43[3] = v54 + 80;
    v43[4] = v54 + 88;
    uint64_t v44 = sub_100002C1C(&qword_100019DF8);
    unint64_t v5 = sub_10000EF74();
    uint64_t result = Sequence.forEach(_:)(sub_10000F344, v43, v44, v5);
    if (v4) {
      return result;
    }
    swift_task_dealloc(v43);
    _os_log_impl( (void *)&_mh_execute_header,  v52,  v51,  "Creating a new configuration as posterInfo has changed.",  v40,  v50);
    sub_1000095E8(v41, 0LL);
    sub_1000095E8(v42, 0LL);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease(v53);
    uint64_t v38 = 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v53);
    uint64_t v38 = *(void *)(v54 + 256);
  }

  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v54 + 264);
  uint64_t v32 = *(void *)(v54 + 200);
  uint64_t v33 = *(void *)(v54 + 184);
  uint64_t v36 = *(void *)(v54 + 168);

  v34(v32, v33);
  sub_10000F2E0();
  os_log_type_t v35 = (void *)PRPosterRoleAmbient;
  id v7 = PRPosterRoleAmbient;
  id v37 = sub_10000EC88(v35);
  *(void *)(v54 + 64) = v37;
  PRMutablePosterConfiguration.setIdlePosterInfo(_:)(v36);
  if (!v38)
  {
    uint64_t v28 = *(void *)(v54 + 176);
    uint64_t v27 = *(void *)(v54 + 168);
    uint64_t v26 = *(void *)(v54 + 160);
    uint64_t v29 = *(void *)(v54 + 152);
    uint64_t v24 = *((void *)sub_10000D84C() + 1);
    swift_bridgeObjectRetain(v24);
    id v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    [v37 setDisplayNameLocalizationKey:v25];

    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v30(v27, v29);
    v30(v28, v29);
    id v31 = v37;
LABEL_10:
    uint64_t v16 = *(void *)(v54 + 200);
    uint64_t v17 = *(void *)(v54 + 176);
    uint64_t v18 = *(void *)(v54 + 168);
    swift_task_dealloc(*(void *)(v54 + 208));
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(id))(*(void *)(v54 + 16) + 8LL))(v31);
  }

  uint64_t v12 = *(void *)(v54 + 208);
  uint64_t v13 = *(void *)(v54 + 200);
  uint64_t v14 = *(void *)(v54 + 176);
  uint64_t v15 = *(void *)(v54 + 168);
  uint64_t v9 = *(void *)(v54 + 160);
  uint64_t v10 = *(void *)(v54 + 152);

  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v11(v15, v10);
  v11(v14, v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)())(*(void *)(v54 + 16) + 8LL))();
}

id sub_10000EC88(void *a1)
{
  id v4 = [(id)swift_getObjCClassFromMetadata(v1) mutableConfigurationWithRole:a1];

  return v4;
}

uint64_t sub_10000ED78(void *a1, void *a2, const void *a3, void *a4)
{
  v4[5] = a4;
  v4[4] = a2;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  uint64_t v9 = (void *)swift_task_alloc(dword_100019E34);
  *(void *)(v12 + 56) = v9;
  *uint64_t v9 = *(void *)(v12 + 16);
  v9[1] = sub_10000EE2C;
  return sub_10000E084((uint64_t)a1, (uint64_t)a2);
}

void *sub_10000EE2C(void *a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 56);
  *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = *v2;
  uint64_t v12 = v3 + 16;
  uint64_t v13 = (void *)(v3 + 16);
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

uint64_t sub_10000EF48(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1000095A4(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_10000EF74()
{
  uint64_t v3 = qword_100019E00;
  if (!qword_100019E00)
  {
    uint64_t v0 = sub_100002EE8(&qword_100019DF8);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019E00);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000EFE4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1000095A4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000F010(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1000095A4(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_10000F03C()
{
  uint64_t v3 = qword_100019E10;
  if (!qword_100019E10)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRPosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019E10);
    return ObjCClassMetadata;
  }

  return v3;
}

unint64_t sub_10000F0A0()
{
  uint64_t v3 = qword_100019E18;
  if (!qword_100019E18)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRMutablePosterDescriptor);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019E18);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10000F104()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000F158()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  id v7 = (void *)v0[2];
  uint64_t v4 = (void *)v0[3];
  unint64_t v5 = (const void *)v0[4];
  id v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019E24);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10000F210;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_100019E20 + dword_100019E20))( v7,  v4,  v5,  v6);
}

uint64_t sub_10000F210()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

unint64_t sub_10000F270()
{
  uint64_t v3 = qword_100019E38;
  if (!qword_100019E38)
  {
    uint64_t v0 = type metadata accessor for IdlePosterInfo(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for IdlePosterInfo, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100019E38);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10000F2E0()
{
  uint64_t v3 = qword_100019E40;
  if (!qword_100019E40)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRMutablePosterConfiguration);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100019E40);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10000F344(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1000095A4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000F370(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1000095A4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000F39C()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000F3F0()
{
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v1;
  id v7 = (void *)v0[2];
  uint64_t v4 = (void *)v0[3];
  unint64_t v5 = (const void *)v0[4];
  id v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_100019E4C);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10000F4A8;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_100019E48 + dword_100019E48))( v7,  v4,  v5,  v6);
}

uint64_t sub_10000F4A8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for PosterUpdater()
{
  return objc_opt_self(&OBJC_CLASS____TtC19PortraitClockPoster13PosterUpdater);
}

uint64_t sub_10000F52C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_10000F55C(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
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

uint64_t sub_10000F8A0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
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
  uint64_t v30 = "Unexpectedly found nil while unwrapping an Optional value";
  id v31 = "Swift/StaticString.swift";
  uint64_t v32 = "Not enough bits to represent the passed value";
  uint64_t v33 = "Swift/Integers.swift";
  uint64_t v34 = "UnsafeBufferPointer with negative count";
  os_log_type_t v35 = "Swift/UnsafeBufferPointer.swift";
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
        uint64_t v14 = sub_10000FFF8;
        uint64_t v15 = &v37;
        sub_10000F55C((uint64_t (*)(uint64_t *, uint64_t))sub_100010038, (uint64_t)&v13, v11);
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
    return sub_10000FC64(v16, v23, v24, v25, v26, v20, v21, v27, v19, v28);
  }
  LOBYTE(v13) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v29, 11LL, 2LL, v34, 39LL, 2LL, v35, 31LL, v13, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000FC64@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
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
  uint64_t v30 = "Swift/StaticString.swift";
  id v31 = "Not enough bits to represent the passed value";
  uint64_t v32 = "Swift/Integers.swift";
  uint64_t v33 = "UnsafeBufferPointer with negative count";
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
        int v13 = sub_1000105A8;
        uint64_t v14 = &v36;
        sub_10000F55C((uint64_t (*)(uint64_t *, uint64_t))sub_1000105C4, (uint64_t)&v12, v10);
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
    return sub_100010060(v16, v23, v24, v25, v20, v21, v26, v27);
  }
  LOBYTE(v12) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v28, 11LL, 2LL, v33, 39LL, 2LL, v34, 31LL, v12, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000FFF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000FC64( a1,  a2,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(_BYTE *)(v3 + 32),  *(void *)(v3 + 40),  *(void *)(v3 + 48),  *(void *)(v3 + 56),  a3,  *(void *)(v3 + 64));
}

uint64_t sub_100010038(uint64_t a1, uint64_t a2)
{
  return sub_10000F52C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_100010060( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
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
  uint64_t v30 = "Swift/Integers.swift";
  id v31 = "Not enough bits to represent a signed value";
  uint64_t v32 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v33 = "Swift/AssertCommon.swift";
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

uint64_t sub_1000105A8(uint64_t a1, uint64_t a2)
{
  return sub_100010060( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56));
}

uint64_t sub_1000105C4(uint64_t a1, uint64_t a2)
{
  return sub_10000F52C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1000105EC()
{
  if (qword_1000198B8 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_1000198B8, sub_10001064C);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_1000106F0(v0, (uint64_t)qword_10001A4F0);
}

uint64_t sub_10001064C()
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100010730(v3, qword_10001A4F0);
  sub_1000106F0(v3, (uint64_t)qword_10001A4F0);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.IdleScreen.PortraitClock", 0x22uLL, 1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t sub_1000106F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_100010730(uint64_t a1, uint64_t *a2)
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
  return &unk_100015090;
}
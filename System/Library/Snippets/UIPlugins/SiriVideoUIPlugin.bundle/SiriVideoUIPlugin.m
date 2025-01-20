uint64_t sub_32EC@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  uint64_t result;
  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriVideoUIError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriVideoUIError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_33AC + 4 * asc_120F0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_33CC + 4 * byte_120F5[v4]))();
  }
}

_BYTE *sub_33AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_33CC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_33D4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_33DC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_33E4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_33EC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_33F8()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for SiriVideoUIError()
{
  return &type metadata for SiriVideoUIError;
}

unint64_t sub_3418()
{
  unint64_t result = qword_18298;
  if (!qword_18298)
  {
    unint64_t result = swift_getWitnessTable(&unk_121E4, &type metadata for SiriVideoUIError);
    atomic_store(result, (unint64_t *)&qword_18298);
  }

  return result;
}

unint64_t sub_3454()
{
  return 0xD000000000000033LL;
}

uint64_t sub_3470()
{
  return 1LL;
}

void sub_3478()
{
}

Swift::Int sub_349C()
{
  return Hasher._finalize()();
}

Swift::Int sub_34E4(uint64_t a1)
{
  return Hasher._finalize()();
}

unint64_t sub_3520()
{
  return 0xD000000000000033LL;
}

unint64_t sub_354C()
{
  unint64_t result = qword_182A0;
  if (!qword_182A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_121BC, &type metadata for SiriVideoUIError);
    atomic_store(result, (unint64_t *)&qword_182A0);
  }

  return result;
}

uint64_t sub_3598()
{
  uint64_t KeyPath = swift_getKeyPath(&unk_122A0);
  uint64_t v2 = swift_getKeyPath(&unk_122C8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_3608(uint64_t a1)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_122A0);
  uint64_t v4 = swift_getKeyPath(&unk_122C8);
  uint64_t v6 = a1;
  swift_retain(v1);
  return static Published.subscript.setter(&v6, v1, KeyPath, v4);
}

uint64_t sub_3674()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_4524(0LL, (unint64_t *)&qword_18420, &OBJC_CLASS___OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter(v10);
  v17 = &_swiftEmptyArrayStorage;
  sub_44BC(&qword_18448, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v12 = v11;
  uint64_t v13 = sub_42EC(&qword_18450);
  sub_44F0(&qword_18458, &qword_18450);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v13, v14, v4, v12);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000026LL,  0x8000000000013120LL,  v9,  v6,  v3,  0LL);
  qword_182A8 = result;
  return result;
}

id sub_3848()
{
  id v0 = [objc_allocWithZone(NSCache) init];
  [v0 setCountLimit:40];
  id result = [v0 setTotalCostLimit:52428800];
  qword_182B0 = (uint64_t)v0;
  return result;
}

void sub_38A8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader__image;
  uint64_t v2 = sub_42EC(&qword_18468);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable));
  sub_466C();
}

uint64_t sub_3900()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_3924()
{
  return type metadata accessor for ImageLoader(0LL);
}

uint64_t type metadata accessor for ImageLoader(uint64_t a1)
{
  uint64_t result = qword_182F0;
  if (!qword_182F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ImageLoader);
  }
  return result;
}

void sub_3964(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = "\b";
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }
}

void sub_39D8(uint64_t a1)
{
  id v80 = *v1;
  uint64_t v3 = sub_4674();
  uint64_t v78 = *(void *)(v3 - 8);
  uint64_t v79 = v3;
  __chkstk_darwin(v3);
  uint64_t v76 = v4;
  v77 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_42EC(&qword_183E8);
  sub_464C();
  __chkstk_darwin(v5);
  sub_463C();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for NSURLSession.DataTaskPublisher(0LL);
  uint64_t v66 = *(void *)(v9 - 8);
  sub_464C();
  __chkstk_darwin(v10);
  sub_463C();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_42EC(&qword_183F0);
  uint64_t v67 = *(void *)(v14 - 8);
  sub_464C();
  __chkstk_darwin(v15);
  sub_463C();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_42EC(&qword_183F8);
  uint64_t v68 = *(void *)(v19 - 8);
  uint64_t v69 = v19;
  sub_464C();
  __chkstk_darwin(v20);
  sub_463C();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = sub_42EC(&qword_18400);
  uint64_t v71 = *(void *)(v24 - 8);
  uint64_t v72 = v24;
  sub_464C();
  __chkstk_darwin(v25);
  sub_4688();
  uint64_t v70 = v26;
  uint64_t v27 = sub_42EC(&qword_18408);
  uint64_t v74 = *(void *)(v27 - 8);
  uint64_t v75 = v27;
  sub_464C();
  __chkstk_darwin(v28);
  sub_4688();
  uint64_t v73 = v29;
  if (qword_18208 != -1) {
    swift_once(&qword_18208, sub_3848);
  }
  v30 = (void *)qword_182B0;
  URL._bridgeToObjectiveC()((NSURL *)&ImageLoader);
  v32 = v31;
  id v33 = [v30 objectForKey:v31];

  if (v33)
  {
    id v80 = v33;
    sub_3608((uint64_t)v33);
  }

  else
  {
    id v34 = [(id)objc_opt_self(NSURLSession) sharedSession];
    NSURLSession.dataTaskPublisher(for:)(a1);

    uint64_t v35 = sub_42EC((uint64_t *)&unk_18308);
    sub_44BC(&qword_18410, (uint64_t (*)(uint64_t))&type metadata accessor for NSURLSession.DataTaskPublisher);
    Publisher.map<A>(_:)(sub_3F60, 0LL, v9, v35, v36);
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v13, v9);
    id v82 = 0LL;
    sub_44F0(&qword_18418, &qword_183F0);
    Publisher.replaceError(with:)(&v82, v14, v37);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v18, v14);
    uint64_t v38 = a1;
    if (qword_18200 != -1) {
      swift_once(&qword_18200, sub_3674);
    }
    v39 = (void *)qword_182A8;
    id v82 = (id)qword_182A8;
    type metadata accessor for OS_dispatch_queue.SchedulerOptions(0LL);
    sub_4658();
    uint64_t v40 = sub_4524(0LL, (unint64_t *)&qword_18420, &OBJC_CLASS___OS_dispatch_queue_ptr);
    sub_44F0(&qword_18428, &qword_183F8);
    uint64_t v42 = v41;
    unint64_t v43 = sub_4338();
    id v44 = v39;
    uint64_t v45 = v69;
    uint64_t v46 = v70;
    Publisher.subscribe<A>(on:options:)(&v82, v8, v69, v40, v42, v43);
    sub_4388(v8);

    uint64_t v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v68 + 8))(v23, v45);
    id v82 = (id)static OS_dispatch_queue.main.getter(v47);
    sub_4658();
    sub_44F0(&qword_18438, &qword_18400);
    uint64_t v48 = v72;
    uint64_t v49 = v73;
    Publisher.receive<A>(on:options:)(&v82, v8, v72, v40, v50, v43);
    sub_4388(v8);

    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v46, v48);
    uint64_t v51 = swift_allocObject(&unk_14F78, 24LL, 7LL);
    uint64_t v52 = v81;
    swift_weakInit(v51 + 16, v81);
    v54 = v77;
    uint64_t v53 = v78;
    uint64_t v55 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v77, v38, v79);
    uint64_t v56 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v57 = (v56 + 16) & ~v56;
    unint64_t v58 = (v76 + v57 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v59 = (v58 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v60 = swift_allocObject(&unk_14FA0, v59 + 8, v56 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v53 + 32))(v60 + v57, v54, v55);
    *(void *)(v60 + v58) = v51;
    *(void *)(v60 + v59) = v80;
    sub_44F0(&qword_18440, &qword_18408);
    uint64_t v61 = v75;
    uint64_t v63 = Publisher<>.sink(receiveValue:)(sub_4464, v60, v75, v62);
    swift_release(v60);
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v49, v61);
    uint64_t v64 = *(void *)(v52 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable);
    *(void *)(v52 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable) = v63;
    swift_release(v64);
  }

id sub_3F60@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  sub_4524(0LL, &qword_18460, &OBJC_CLASS___UIImage_ptr);
  sub_455C(v3, v4);
  id result = sub_3FC4(v3, v4);
  *a2 = result;
  return result;
}

id sub_3FC4(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v7 = [v5 initWithData:isa];
  sub_45A0(a1, a2);

  return v7;
}

void sub_4038(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = a3 + 16;
    uint64_t v5 = qword_18208;
    id v6 = v3;
    if (v5 != -1) {
      swift_once(&qword_18208, sub_3848);
    }
    id v7 = (void *)qword_182B0;
    URL._bridgeToObjectiveC()((NSURL *)&ImageLoader);
    uint64_t v9 = v8;
    [v7 setObject:v6 forKey:v8];

    swift_beginAccess(v4, v13, 0LL, 0LL);
    uint64_t Strong = swift_weakLoadStrong(v4);
    if (Strong)
    {
      uint64_t v11 = Strong;
      id v12 = v6;
      sub_3608((uint64_t)v3);
      swift_release(v11);
    }
  }

uint64_t sub_4110()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable);
  if (v1)
  {
    swift_retain(v1);
    AnyCancellable.cancel()();
    return swift_release(v1);
  }

  return result;
}

void sub_4154(uint64_t a1)
{
  if (!qword_18300)
  {
    uint64_t v2 = sub_41AC((uint64_t *)&unk_18308);
    unint64_t v3 = type metadata accessor for Published(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_18300);
    }
  }

uint64_t sub_41AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void *sub_41F0()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_41FC()
{
  uint64_t v1 = sub_42EC(&qword_18468);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_463C();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader__image;
  uint64_t v9 = 0LL;
  uint64_t v7 = sub_42EC((uint64_t *)&unk_18308);
  Published.init(initialValue:)(&v9, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v6, v5, v1);
  *(void *)(v0 + OBJC_IVAR____TtC17SiriVideoUIPlugin11ImageLoader_cancellable) = 0LL;
  return v0;
}

uint64_t sub_42B0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ImageLoader(0LL);
  uint64_t result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_42EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_432C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

unint64_t sub_4338()
{
  unint64_t result = qword_18430;
  if (!qword_18430)
  {
    uint64_t v1 = sub_4524(255LL, (unint64_t *)&qword_18420, &OBJC_CLASS___OS_dispatch_queue_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue, v1);
    atomic_store(result, (unint64_t *)&qword_18430);
  }

  return result;
}

uint64_t sub_4388(uint64_t a1)
{
  uint64_t v2 = sub_42EC(&qword_183E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_43C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_43EC()
{
  uint64_t v1 = sub_4674();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8, v5);
}

void sub_4464(void **a1)
{
  uint64_t v3 = *(void *)(sub_4674() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_4038(a1, v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL)));
}

void sub_44BC(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_467C(v3), a1);
  }

  sub_466C();
}

void sub_44F0(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_41AC(a2);
    atomic_store(sub_467C(v3), a1);
  }

  sub_466C();
}

uint64_t sub_4524(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_455C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_45A0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_45E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3598();
  *a1 = result;
  return result;
}

uint64_t sub_460C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  return sub_3608((uint64_t)v1);
}

  ;
}

  ;
}

uint64_t sub_4658()
{
  return sub_432C(v1, 1LL, 1LL, v0);
}

  ;
}

uint64_t sub_4674()
{
  return type metadata accessor for URL(0LL);
}

uint64_t sub_467C(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

  ;
}

uint64_t initializeBufferWithCopyOfBuffer for ContentDisambiguation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ContentDisambiguation(void *a1)
{
  return swift_bridgeObjectRelease(a1[4]);
}

void *initializeWithCopy for ContentDisambiguation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[4];
  a1[4] = v5;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *assignWithCopy for ContentDisambiguation(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for ContentDisambiguation(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v3;
  return result;
}

void *assignWithTake for ContentDisambiguation(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(a1[3]);
  uint64_t v6 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentDisambiguation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for ContentDisambiguation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ContentDisambiguation()
{
  return &type metadata for ContentDisambiguation;
}

uint64_t sub_48D4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12C40, 1LL);
}

void sub_48E4()
{
  qword_18470 = 0x4079A00000000000LL;
}

uint64_t sub_48F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_42EC(&qword_18478);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_42EC(&qword_18480);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)uint64_t v4 = static HorizontalAlignment.center.getter(v6);
  *((void *)v4 + 1) = 0LL;
  v4[16] = 0;
  uint64_t v9 = sub_42EC(&qword_18488);
  sub_4A80(v1, &v4[*(int *)(v9 + 44)]);
  if (qword_18210 != -1) {
    swift_once(&qword_18210, sub_48E4);
  }
  double v10 = *(double *)&qword_18470;
  uint64_t v11 = static Alignment.center.getter();
  sub_4E40(0.0, 0, 0.0, 1, INFINITY, 0, 0.0, 0, (uint64_t)v8, 0.0, 1, v10, 0, v11, v12);
  sub_5294((uint64_t)v4, &qword_18478);
  unint64_t v13 = sub_5034();
  View.privacySensitive(_:)(0LL, v5, v13);
  return sub_5294((uint64_t)v8, &qword_18480);
}

uint64_t sub_4A80@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  unint64_t v43 = a2;
  uint64_t v3 = type metadata accessor for GridItem.Size(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (uint64_t *)((char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = (int *)type metadata accessor for ContentResultsList(0LL);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = (uint64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v41 = sub_42EC(&qword_184A0);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v39 - v13;
  uint64_t v15 = a1[1];
  uint64_t v39 = *a1;
  uint64_t v40 = v15;
  uint64_t v16 = a1[3];
  uint64_t v42 = a1[2];
  uint64_t v44 = a1[4];
  uint64_t KeyPath = swift_getKeyPath(&unk_12388);
  uint64_t v18 = (uint64_t *)((char *)v9 + v7[6]);
  *uint64_t v18 = KeyPath;
  uint64_t v19 = sub_42EC(&qword_184A8);
  swift_storeEnumTagMultiPayload(v18, v19, 0LL);
  uint64_t v20 = sub_42EC(&qword_184B0);
  uint64_t v21 = type metadata accessor for GridItem(0LL);
  uint64_t v22 = swift_allocObject( v20,  ((*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL))
        + *(void *)(*(void *)(v21 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v22 + swift_weakDestroy(v0 + 16) = xmmword_122F0;
  swift_bridgeObjectRetain(v16);
  sub_5100(&v44);
  if (qword_18248 != -1) {
    swift_once(&qword_18248, sub_A734);
  }
  *uint64_t v6 = qword_18740;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, enum case for GridItem.Size.fixed(_:), v3);
  if (qword_18250 != -1) {
    swift_once(&qword_18250, sub_A748);
  }
  uint64_t v23 = qword_18748;
  uint64_t v24 = static Alignment.leading.getter();
  GridItem.init(_:spacing:alignment:)(v6, v23, 0LL, v24, v25, 0LL);
  uint64_t v26 = v44;
  uint64_t *v9 = v22;
  v9[1] = v26;
  *(uint64_t *)((char *)v9 + v7[7]) = 0LL;
  uint64_t v27 = (uint64_t *)((char *)v9 + v7[8]);
  uint64_t v28 = type metadata accessor for Context(0LL);
  unint64_t v29 = sub_5128();
  *uint64_t v27 = EnvironmentObject.init()(v28, v29);
  v27[1] = v30;
  uint64_t v31 = swift_getKeyPath(&unk_123B8);
  sub_5188((uint64_t)v9, (uint64_t)v12);
  uint64_t v32 = v40;
  id v33 = (uint64_t *)&v12[*(int *)(v41 + 36)];
  uint64_t v34 = v39;
  *id v33 = v31;
  v33[1] = v34;
  v33[2] = v32;
  swift_bridgeObjectRetain(v32);
  sub_51CC((uint64_t)v9);
  sub_5208((uint64_t)v12, (uint64_t)v14);
  sub_5250((uint64_t)v14, (uint64_t)v12, &qword_184A0);
  uint64_t v35 = v43;
  *unint64_t v43 = v42;
  v35[1] = v16;
  uint64_t v36 = sub_42EC(&qword_184C0);
  sub_5250((uint64_t)v12, (uint64_t)v35 + *(int *)(v36 + 48), &qword_184A0);
  uint64_t v37 = (char *)v35 + *(int *)(v36 + 64);
  *(void *)uint64_t v37 = 0LL;
  v37[8] = 1;
  swift_bridgeObjectRetain(v16);
  sub_5294((uint64_t)v14, &qword_184A0);
  sub_5294((uint64_t)v12, &qword_184A0);
  return swift_bridgeObjectRelease(v16);
}

void sub_4DE8()
{
  *uint64_t v0 = sub_531C();
  v0[1] = v1;
  sub_466C();
}

uint64_t sub_4E04(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain(v2);
  return sub_C104(v1, v2);
}

void *sub_4E40@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = v15;
  uint64_t v18 = a15;
  double v19 = a12;
  double v20 = a10;
  uint64_t v21 = a2 & 1;
  double v22 = a1;
  if ((_DWORD)v21) {
    double v22 = -INFINITY;
  }
  uint64_t v23 = a4 & 1;
  double v24 = a3;
  if ((a4 & 1) != 0) {
    double v24 = v22;
  }
  uint64_t v25 = a6 & 1;
  uint64_t v26 = a8 & 1;
  double v27 = a5;
  if ((a6 & 1) != 0) {
    double v27 = v24;
  }
  if (v22 > v24 || v24 > v27) {
    goto LABEL_22;
  }
  double v29 = a7;
  if ((a8 & 1) != 0) {
    double v29 = -INFINITY;
  }
  double v30 = a10;
  if ((a11 & 1) != 0) {
    double v30 = v29;
  }
  double v31 = a12;
  if ((a13 & 1) != 0) {
    double v31 = v30;
  }
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    double v40 = a5;
    double v41 = a7;
    double v39 = a3;
    double v38 = a1;
    unsigned int v37 = v21;
    uint64_t v33 = static os_log_type_t.fault.getter();
    uint64_t v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v33,  &dword_0,  v34,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v18 = a15;
    uint64_t v21 = v37;
    a1 = v38;
    double v20 = a10;
    a3 = v39;
    double v19 = a12;
    a5 = v40;
    a7 = v41;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  *(void *)&a1,  v21,  *(void *)&a3,  v23,  *(void *)&a5,  v25,  *(void *)&a7,  v26,  *(void *)&v20,  a11 & 1,  *(void *)&v19,  a13 & 1,  a14,  v18);
  sub_5250(v16, a9, &qword_18478);
  uint64_t v35 = sub_42EC(&qword_18480);
  return memcpy((void *)(a9 + *(int *)(v35 + 36)), __src, 0x70uLL);
}

uint64_t sub_4FE4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_4FFC()
{
  return sub_48F8();
}

unint64_t sub_5034()
{
  unint64_t result = qword_18490;
  if (!qword_18490)
  {
    uint64_t v1 = sub_41AC(&qword_18480);
    sub_50A0();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18490);
  }

  return result;
}

unint64_t sub_50A0()
{
  unint64_t result = qword_18498;
  if (!qword_18498)
  {
    uint64_t v1 = sub_41AC(&qword_18478);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_18498);
  }

  return result;
}

void sub_50E4()
{
}

void *sub_5100(void *a1)
{
  return a1;
}

unint64_t sub_5128()
{
  unint64_t result = qword_184B8;
  if (!qword_184B8)
  {
    uint64_t v1 = type metadata accessor for Context(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Context, v1);
    atomic_store(result, (unint64_t *)&qword_184B8);
  }

  return result;
}

void sub_5168()
{
  *uint64_t v0 = sub_531C();
  v0[1] = v1;
  sub_466C();
}

uint64_t sub_5188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContentResultsList(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_51CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContentResultsList(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_5208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_42EC(&qword_184A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5250(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_42EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_5294(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_42EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_52D0()
{
  v1[0] = sub_41AC(&qword_18480);
  v1[1] = sub_5034();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
}

uint64_t sub_531C()
{
  return sub_C0CC();
}

uint64_t sub_5328(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRetain(a2);
  }
  else {
    return swift_retain(a1);
  }
}

void destroy for ContentResult(uint64_t a1)
{
}

uint64_t sub_5380(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(a2);
  }
  else {
    return swift_release(a1);
  }
}

uint64_t initializeWithCopy for ContentResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(_BYTE *)(a2 + 16);
  sub_5328(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v9;
  uint64_t v12 = *(void **)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = v12;
  *(void *)(a1 + 88) = v11;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v10);
  id v13 = v12;
  return a1;
}

uint64_t assignWithCopy for ContentResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(_BYTE *)(a2 + 16);
  sub_5328(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(_BYTE *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  sub_5380(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 48);
  uint64_t v13 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  uint64_t v14 = *(void *)(a2 + 64);
  uint64_t v15 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v16 = *(void **)(a1 + 80);
  uint64_t v17 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v17;
  id v18 = v17;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

void *initializeWithTake for ContentResult(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for ContentResult(uint64_t a1, uint64_t a2)
{
  char v4 = *(_BYTE *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v4;
  sub_5380(v5, v6, v7);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v10;
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(void **)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v14;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResult(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 96))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for ContentResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 96) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ContentResult()
{
  return &type metadata for ContentResult;
}

uint64_t sub_564C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12CC4, 1LL);
}

void sub_565C(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v73 = sub_42EC(&qword_18668);
  sub_8F60();
  __chkstk_darwin(v5);
  sub_4688();
  id v80 = v6;
  uint64_t v79 = type metadata accessor for Text.TruncationMode(0LL);
  uint64_t v77 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  sub_4688();
  uint64_t v76 = v7;
  sub_42EC(&qword_18670);
  sub_8F60();
  __chkstk_darwin(v8);
  sub_463C();
  uint64_t v11 = v10 - v9;
  uint64_t v72 = sub_42EC(&qword_18678);
  sub_8F60();
  __chkstk_darwin(v12);
  sub_9000();
  uint64_t v75 = sub_42EC(&qword_18680);
  sub_8F60();
  __chkstk_darwin(v13);
  sub_4688();
  uint64_t v78 = v14;
  uint64_t v74 = sub_42EC(&qword_18688);
  sub_8F60();
  __chkstk_darwin(v15);
  sub_4688();
  uint64_t v81 = v16;
  uint64_t v17 = sub_42EC(&qword_18690);
  sub_8F60();
  __chkstk_darwin(v18);
  sub_4688();
  uint64_t v82 = v19;
  uint64_t v20 = sub_42EC(&qword_18698);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  sub_463C();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = *(void **)(v1 + 72);
  if (v25)
  {
    id v26 = v25;
    double v27 = (uint64_t *)VideoUIPluginConstants.SharedStateKeys.isFocusInteractionEnabled.unsafeMutableAddressor();
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    v88[0] = v29;
    v88[1] = v28;
    swift_bridgeObjectRetain(v28);
    double v30 = AnyHashable.init<A>(_:)(v89, v88, &type metadata for String, &protocol witness table for String);
    uint64_t v31 = dispatch thunk of Context.sharedState.getter(v30);

    sub_90A4((uint64_t)v89, v31, &v90);
    sub_9060();
    sub_8950((uint64_t)v89);
    uint64_t v86 = v20;
    uint64_t v87 = a1;
    uint64_t v84 = v24;
    uint64_t v85 = v21;
    uint64_t v83 = v17;
    if (v91)
    {
      if (swift_dynamicCast(v88, &v90, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL))
      {
        if ((v88[0] & 1) != 0)
        {
          uint64_t v32 = *(void *)v3;
          char v33 = *(_BYTE *)(v3 + 8);
          sub_7FBC(*(void *)v3, v33);
          sub_B404();
          char v35 = v34;
          sub_7FC8(v32, v33);
          double v36 = 0.0;
          if ((v35 & 1) == 0) {
            goto LABEL_9;
          }
        }
      }
    }

    else
    {
      sub_8D64((uint64_t)&v90, &qword_186A0);
    }

    double v36 = 1.0;
LABEL_9:
    uint64_t v37 = *(void *)(v3 + 24);
    v89[0] = *(void *)(v3 + 16);
    v89[1] = v37;
    unint64_t v38 = sub_81C8();
    swift_bridgeObjectRetain(v37);
    uint64_t v39 = Text.init<A>(_:)(v89, &type metadata for String, v38);
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44 & 1;
    double v46 = static Font.Weight.medium.getter();
    uint64_t v47 = type metadata accessor for Font.Design(0LL);
    sub_432C(v11, 1LL, 1LL, v47);
    uint64_t v48 = static Font.system(size:weight:design:)(*(void *)&v46, 0LL, v11, 23.0);
    sub_8D64(v11, &qword_18670);
    uint64_t v69 = Text.font(_:)(v48, v39, v41, v45, v43);
    uint64_t v50 = v49;
    uint64_t v71 = (const void *)v3;
    char v52 = v51;
    uint64_t v70 = v53;
    swift_release(v48);
    LOBYTE(v48) = v52 & 1;
    sub_8984(v39, v41, v45);
    sub_9060();
    uint64_t KeyPath = swift_getKeyPath(&unk_125B0);
    uint64_t v55 = swift_getKeyPath(&unk_125E0);
    (*(void (**)(uint64_t, void, uint64_t))(v77 + 104))(v76, enum case for Text.TruncationMode.tail(_:), v79);
    uint64_t v56 = swift_getKeyPath(&unk_12610);
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))((char *)v80 + *(int *)(v73 + 28), v76, v79);
    *id v80 = v56;
    sub_8A38((uint64_t)v80, v2 + *(int *)(v72 + 36), &qword_18668);
    *(void *)uint64_t v2 = v69;
    *(void *)(v2 + 8) = v50;
    *(_BYTE *)(v2 + swift_weakDestroy(v0 + 16) = v48;
    *(void *)(v2 + 24) = v70;
    *(void *)(v2 + 32) = KeyPath;
    *(void *)(v2 + 40) = 2LL;
    *(_BYTE *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = v55;
    *(_BYTE *)(v2 + 64) = 1;
    sub_8A20(v69, v50, v48);
    swift_bridgeObjectRetain(v70);
    swift_retain(KeyPath);
    swift_retain(v55);
    sub_8D64((uint64_t)v80, &qword_18668);
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v79);
    sub_8984(v69, v50, v48);
    swift_release(v55);
    swift_release(KeyPath);
    uint64_t v57 = swift_bridgeObjectRelease(v70);
    uint64_t v58 = static Color.white.getter(v57);
    uint64_t v59 = swift_getKeyPath(&unk_12640);
    sub_8A38(v2, v78, &qword_18678);
    uint64_t v60 = (uint64_t *)(v78 + *(int *)(v75 + 36));
    *uint64_t v60 = v59;
    v60[1] = v58;
    sub_8D64(v2, &qword_18678);
    sub_8A38(v78, v81, &qword_18680);
    *(double *)(v81 + *(int *)(v74 + 36)) = v36;
    sub_8D64(v78, &qword_18680);
    uint64_t v61 = static Animation.easeOut(duration:)(0.4);
    sub_9040();
    LOBYTE(v56) = v62;
    sub_9084();
    sub_8A38(v81, v82, &qword_18688);
    uint64_t v63 = v82 + *(int *)(v83 + 36);
    *(void *)uint64_t v63 = v61;
    *(_BYTE *)(v63 + 8) = v56 & 1;
    sub_8D64(v81, &qword_18688);
    unint64_t v64 = sub_8A64();
    View.privacySensitive(_:)(0LL, v83, v64);
    sub_8D64(v82, &qword_18690);
    sub_9040();
    LOBYTE(v61) = v65;
    sub_9084();
    uint64_t v66 = swift_allocObject(&unk_15260, 104LL, 7LL);
    memcpy((void *)(v66 + 16), v71, 0x58uLL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 16))(v87, v84, v86);
    uint64_t v67 = v87 + *(int *)(sub_42EC(&qword_18720) + 36);
    *(_BYTE *)uint64_t v67 = v61 & 1;
    *(void *)(v67 + 8) = sub_8DD4;
    *(void *)(v67 + swift_weakDestroy(v0 + 16) = v66;
    sub_8DDC((uint64_t)v71);
    (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v86);
    sub_8F7C();
    return;
  }

  type metadata accessor for Context(0LL);
  sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  sub_8FDC(v68);
  __break(1u);
}

void sub_5D4C(_BYTE *a1, void *a2)
{
  if (*a1 == 1)
  {
    uint64_t v3 = (void *)a2[9];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = (uint64_t *)VideoUIPluginConstants.SharedStateKeys.currentFocusedIndex.unsafeMutableAddressor();
      uint64_t v7 = *v5;
      uint64_t v6 = v5[1];
      v14[0] = v7;
      v14[1] = v6;
      swift_bridgeObjectRetain(v6);
      AnyHashable.init<A>(_:)(v15, v14, &type metadata for String, &protocol witness table for String);
      uint64_t v8 = a2[8];
      v14[3] = &type metadata for Int;
      v14[0] = v8;
      uint64_t v9 = (void (*)(_BYTE *, void))dispatch thunk of Context.sharedState.modify(v13);
      sub_90F4((uint64_t)v14, (uint64_t)v15);
      v9(v13, 0LL);
    }

    else
    {
      uint64_t v10 = a2[10];
      uint64_t v11 = type metadata accessor for Context(0LL);
      sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
      EnvironmentObject.error()(0LL, v10, v11, v12);
      __break(1u);
    }
  }

void sub_5E48(uint64_t a1@<X8>)
{
}

void sub_5E88()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_42EC(&qword_18500);
  uint64_t v25 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_463C();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_42EC(&qword_18508);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_9018();
  uint64_t v9 = sub_42EC(&qword_18510);
  sub_8F60();
  __chkstk_darwin(v10);
  sub_463C();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = swift_allocObject(&unk_15130, 112LL, 7LL);
  memcpy((void *)(v14 + 16), v2, 0x60uLL);
  double v27 = v2;
  sub_7850((uint64_t)v2);
  uint64_t v15 = sub_42EC(&qword_18518);
  unint64_t v16 = sub_78BC();
  Button.init(action:label:)(sub_782C, v14, sub_7848, v26, v15, v16);
  uint64_t KeyPath = swift_getKeyPath(&unk_12490);
  uint64_t v28 = KeyPath;
  char v29 = 0;
  sub_44F0(&qword_18538, &qword_18500);
  uint64_t v19 = v18;
  unint64_t v20 = sub_7C80();
  View.buttonStyle<A>(_:)(&v28, v3, &type metadata for ContentResultStyle, v19, v20);
  swift_release(KeyPath);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v6, v3);
  uint64_t v22 = static Color.clear.getter(v21);
  LOBYTE(KeyPath) = static Edge.Set.all.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v13, v1, v7);
  uint64_t v23 = v13 + *(int *)(v9 + 36);
  *(void *)uint64_t v23 = v22;
  *(_BYTE *)(v23 + 8) = KeyPath;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
  unint64_t v24 = sub_7CBC();
  View.privacySensitive(_:)(0LL, v9, v24);
  sub_8D64(v13, &qword_18510);
  sub_8FB0();
}

void sub_60A4()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v56 - v8;
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_9018();
  uint64_t v12 = *(void *)(v0 + 48);
  uint64_t v62 = *(void *)(v0 + 40);
  uint64_t v63 = v12;
  uint64_t v13 = sub_7258(v62, v12);
  if (v14 >> 60 == 15) {
    goto LABEL_8;
  }
  uint64_t v58 = v9;
  uint64_t v59 = v3;
  uint64_t v60 = v13;
  unint64_t v61 = v14;
  uint64_t v64 = v4;
  uint64_t v15 = sub_9068();
  sub_5328(v15, v16, v17);
  sub_9068();
  sub_B564();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = sub_9068();
  sub_5380(v22, v23, v24);
  if (!v21)
  {
    sub_821C(v60, v61);
    uint64_t v3 = v59;
    uint64_t v4 = v64;
LABEL_8:
    if (qword_18290 != -1) {
      swift_once(&qword_18290, sub_FE4C);
    }
    uint64_t v44 = sub_8204(v3, (uint64_t)qword_194A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v44, v3);
    uint64_t v45 = sub_7850(v2);
    double v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)sub_9030(12LL);
      uint64_t v49 = sub_9030(32LL);
      uint64_t v65 = v49;
      uint64_t v64 = v4;
      *(_DWORD *)uint64_t v48 = 136315138;
      sub_9078();
      uint64_t v50 = sub_8FF0();
      uint64_t v51 = sub_9090(v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v51);
      sub_9060();
      sub_9038();
      _os_log_impl(&dword_0, v46, v47, "Error while creating direct invocation command from item: %s", v48, 0xCu);
      swift_arrayDestroy(v49, 1LL);
      sub_8F70(v49);
      sub_8F70((uint64_t)v48);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v7, v3);
    }

    else
    {
      sub_9038();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    goto LABEL_16;
  }

  id v25 = [objc_allocWithZone(SARemoteDevice) init];
  sub_8308(v19, v21, v25, (SEL *)&selRef_setAssistantId_);
  id v26 = [objc_allocWithZone(SAExecuteOnRemoteRequest) init];
  uint64_t v27 = UUID.init()();
  uint64_t v28 = UUID.uuidString.getter(v27);
  uint64_t v30 = v29;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v10);
  sub_8308(v28, v30, v26, (SEL *)&selRef_setAceId_);

  [v26 setRemoteDevice:v25];
  sub_8360(v60, v61, v26);
  if (qword_18290 != -1) {
    swift_once(&qword_18290, sub_FE4C);
  }
  uint64_t v31 = v59;
  uint64_t v32 = sub_8204(v59, (uint64_t)qword_194A8);
  uint64_t v33 = v64;
  char v34 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v58, v32, v31);
  uint64_t v35 = sub_7850(v2);
  double v36 = (os_log_s *)Logger.logObject.getter(v35);
  os_log_type_t v37 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v36, v37))
  {
    unint64_t v38 = (uint8_t *)sub_9030(12LL);
    uint64_t v39 = sub_9030(32LL);
    id v57 = v25;
    uint64_t v40 = v39;
    uint64_t v65 = v39;
    *(_DWORD *)unint64_t v38 = 136315138;
    v56[1] = v38 + 4;
    sub_9078();
    uint64_t v41 = sub_8FF0();
    uint64_t v42 = sub_9090(v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v42);
    sub_9060();
    sub_9038();
    _os_log_impl(&dword_0, v36, v37, "Sending Direct Invocation command for item: %s", v38, 0xCu);
    swift_arrayDestroy(v40, 1LL);
    uint64_t v43 = v40;
    id v25 = v57;
    sub_8F70(v43);
    sub_8F70((uint64_t)v38);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v34, v31);
  }

  else
  {
    sub_9038();

    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v31);
  }

  char v52 = *(void **)(v2 + 80);
  if (v52)
  {
    id v53 = v26;
    id v54 = v52;
    dispatch thunk of Context.perform(aceCommand:)(v53);

    sub_821C(v60, v61);
LABEL_16:
    sub_8FB0();
    return;
  }

  type metadata accessor for Context(0LL);
  sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  sub_8FDC(v55);
  __break(1u);
}

void sub_6570(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_42EC(&qword_18530);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_18218 != -1) {
    uint64_t v5 = swift_once(&qword_18218, sub_7940);
  }
  uint64_t v8 = qword_184C8;
  *(void *)uint64_t v7 = static HorizontalAlignment.center.getter(v5);
  *((void *)v7 + 1) = v8;
  v7[16] = 0;
  uint64_t v9 = sub_42EC(&qword_18560);
  sub_66FC(a1, &v7[*(int *)(v9 + 44)]);
  if (qword_18230 != -1) {
    swift_once(&qword_18230, sub_7978);
  }
  uint64_t v10 = qword_184E0;
  if (qword_18238 != -1) {
    swift_once(&qword_18238, sub_798C);
  }
  uint64_t v11 = qword_184E8;
  uint64_t v12 = static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)(v16, v10, 0LL, v11, 0LL, v12, v13);
  sub_8A38((uint64_t)v7, a2, &qword_18530);
  unint64_t v14 = (_OWORD *)(a2 + *(int *)(sub_42EC(&qword_18518) + 36));
  __int128 v15 = v16[1];
  *unint64_t v14 = v16[0];
  v14[1] = v15;
  v14[2] = v16[2];
  sub_8D64((uint64_t)v7, &qword_18530);
}

uint64_t sub_66FC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_42EC(&qword_18568);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_42EC(&qword_18570);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v35 - v11;
  sub_6990((uint64_t *)a1, (uint64_t)v5);
  unint64_t v13 = sub_7D9C();
  View.privacySensitive(_:)(0LL, v3, v13);
  sub_8D64((uint64_t)v5, &qword_18568);
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  double v36 = v12;
  v14(v12, v10, v6);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v40 = *(void *)(a1 + 40);
  uint64_t v41 = v15;
  int v39 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v38 = *(void *)(a1 + 72);
  uint64_t KeyPath = swift_getKeyPath(&unk_12490);
  uint64_t v19 = type metadata accessor for Context(0LL);
  sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  uint64_t v21 = v20;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  uint64_t v22 = (void *)EnvironmentObject.init()(v19, v21);
  uint64_t v24 = v23;
  uint64_t v25 = v7;
  id v26 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v26(v10, v12, v6);
  uint64_t v27 = v42;
  v26(v42, v10, v6);
  uint64_t v28 = &v27[*(int *)(sub_42EC(&qword_185D8) + 48)];
  uint64_t v29 = KeyPath;
  *(void *)uint64_t v28 = KeyPath;
  v28[8] = 0;
  *((void *)v28 + 2) = v41;
  *((void *)v28 + 3) = v16;
  *((void *)v28 + 4) = v40;
  *((void *)v28 + 5) = v17;
  v28[48] = v39;
  uint64_t v30 = v38;
  *((void *)v28 + 7) = v18;
  *((void *)v28 + 8) = v30;
  *((void *)v28 + 9) = v22;
  *((void *)v28 + 10) = v24;
  uint64_t v31 = v29;
  sub_7FBC(v29, 0);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v25 + 8);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  id v33 = v22;
  v32(v36, v6);
  sub_7FC8(v31, 0);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v16);
  return ((uint64_t (*)(char *, uint64_t))v32)(v10, v6);
}

uint64_t sub_6990@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v52 = type metadata accessor for RoundedRectangle(0LL);
  __chkstk_darwin(v52);
  id v53 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v51 = sub_42EC(&qword_185A8);
  __chkstk_darwin(v51);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v58 = sub_42EC(&qword_18598);
  uint64_t v6 = __chkstk_darwin(v58);
  id v54 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v55 = (uint64_t)&v50 - v8;
  uint64_t v56 = sub_42EC(&qword_185E0);
  __chkstk_darwin(v56);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v57 = sub_42EC(&qword_185E8);
  uint64_t v11 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  unint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_42EC(&qword_185F0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = (void *)a1[10];
  if (v21)
  {
    id v22 = v21;
    dispatch thunk of Context.currentIdiom.getter();

    sub_6E94(a1[8], (uint64_t)v16, 1000.0, 679.0);
    if (sub_7FD4((uint64_t)v16, 1LL, v17) == 1)
    {
      sub_8D64((uint64_t)v16, &qword_185F0);
      sub_6FFC();
      uint64_t v23 = v57;
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v10, v13, v57);
      swift_storeEnumTagMultiPayload(v10, v56, 1LL);
      unint64_t v24 = sub_7E9C();
      uint64_t v25 = sub_41AC(&qword_185C0);
      unint64_t v26 = sub_7F38();
      uint64_t v60 = v25;
      unint64_t v61 = v26;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v60,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
      _ConditionalContent<>.init(storage:)(v10, v58, v23, v24, OpaqueTypeConformance2);
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v23);
    }

    else
    {
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
      uint64_t v50 = v18;
      v29(v20, v16, v17);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(&v5[*(int *)(v51 + 40)], v20, v17);
      *(void *)uint64_t v5 = sub_CA40;
      *((void *)v5 + 1) = 0LL;
      v5[16] = 0;
      sub_7850((uint64_t)a1);
      sub_6FFC();
      uint64_t v30 = v53;
      uint64_t v31 = &v53[*(int *)(v52 + 20)];
      uint64_t v32 = enum case for RoundedCornerStyle.continuous(_:);
      uint64_t v33 = type metadata accessor for RoundedCornerStyle(0LL);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104LL))(v31, v32, v33);
      __asm { FMOV            V0.2D, #15.0 }

      _OWORD *v30 = _Q0;
      uint64_t v39 = v58;
      uint64_t v40 = (uint64_t)v54;
      uint64_t v41 = (uint64_t)&v54[*(int *)(v58 + 36)];
      sub_80FC((uint64_t)v30, v41, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
      *(_WORD *)(v41 + *(int *)(sub_42EC(&qword_185B8) + 36)) = 256;
      sub_8A38((uint64_t)v5, v40, &qword_185A8);
      sub_8128((uint64_t)v30, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
      sub_8D64((uint64_t)v5, &qword_185A8);
      uint64_t v42 = v55;
      sub_7FE0(v40, v55);
      sub_8A38(v42, (uint64_t)v10, &qword_18598);
      swift_storeEnumTagMultiPayload(v10, v56, 0LL);
      unint64_t v43 = sub_7E9C();
      uint64_t v44 = sub_41AC(&qword_185C0);
      unint64_t v45 = sub_7F38();
      uint64_t v60 = v44;
      unint64_t v61 = v45;
      uint64_t v46 = swift_getOpaqueTypeConformance2( &v60,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
      _ConditionalContent<>.init(storage:)(v10, v39, v57, v43, v46);
      sub_8D64(v42, &qword_18598);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v20, v17);
      return sub_8028((uint64_t)a1);
    }
  }

  else
  {
    uint64_t v47 = a1[11];
    uint64_t v48 = type metadata accessor for Context(0LL);
    sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = EnvironmentObject.error()(0LL, v47, v48, v49);
    __break(1u);
  }

  return result;
}

uint64_t sub_6E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(a1);
    unint64_t v9 = sub_8150();
    uint64_t v10 = (_BYTE *)(a1 + 48);
    while (1)
    {
      uint64_t v12 = *((void *)v10 - 2);
      uint64_t v11 = *((void *)v10 - 1);
      char v18 = *v10;
      char v17 = 2;
      swift_bridgeObjectRetain(v11);
      dispatch thunk of RawRepresentable.rawValue.getter(&v16, &type metadata for DisambiguationImage.ImageType, v9);
      dispatch thunk of RawRepresentable.rawValue.getter(&v15, &type metadata for DisambiguationImage.ImageType, v9);
      if (v16 == v15) {
        break;
      }
      v10 += 40;
      swift_bridgeObjectRelease(v11);
      if (!--v5)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease(a1);
    if (qword_18240 != -1) {
      swift_once(&qword_18240, sub_79A0);
    }
    sub_7530(qword_184F0, *(uint64_t *)algn_184F8, v12, v11, a2, a3, a4);
    return swift_bridgeObjectRelease(v11);
  }

  else
  {
LABEL_6:
    uint64_t v13 = type metadata accessor for URL(0LL);
    return sub_432C(a2, 1LL, 1LL, v13);
  }

void sub_6FFC()
{
  uint64_t v2 = type metadata accessor for PlaceHolder(0LL);
  sub_8F60();
  __chkstk_darwin(v3);
  sub_463C();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_42EC(&qword_185C0);
  sub_8F60();
  __chkstk_darwin(v8);
  sub_9000();
  __int128 v9 = *(_OWORD *)(v0 + 40);
  __int128 v21 = *(_OWORD *)(v0 + 24);
  __int128 v22 = v9;
  uint64_t v10 = *(void *)(v0 + 64);
  uint64_t v23 = *(void *)(v0 + 56);
  uint64_t v24 = v10;
  __int128 v25 = v9;
  __int128 v26 = v21;
  uint64_t KeyPath = swift_getKeyPath(&unk_124C0);
  uint64_t v12 = (uint64_t *)(v6 + *(int *)(v2 + 20));
  *uint64_t v12 = KeyPath;
  uint64_t v13 = sub_42EC(&qword_185F8);
  swift_storeEnumTagMultiPayload(v12, v13, 0LL);
  __int128 v14 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v6 + swift_weakDestroy(v0 + 16) = v14;
  *(void *)(v6 + 32) = *(void *)(v0 + 56);
  *(void *)(v6 + 40) = v10;
  sub_80D4((uint64_t)&v26);
  sub_80D4((uint64_t)&v25);
  sub_5100(&v24);
  if (qword_18220 != -1) {
    swift_once(&qword_18220, sub_7950);
  }
  uint64_t v15 = qword_184D0;
  if (qword_18228 != -1) {
    swift_once(&qword_18228, sub_7964);
  }
  uint64_t v16 = qword_184D8;
  uint64_t v17 = static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  v15,  0LL,  0LL,  1LL,  0LL,  1LL,  v16,  0LL,  0LL,  1,  0LL,  1,  v17,  v18);
  sub_80FC(v6, v1, type metadata accessor for PlaceHolder);
  memcpy((void *)(v1 + *(int *)(v7 + 36)), __src, 0x70uLL);
  sub_8128(v6, type metadata accessor for PlaceHolder);
  unint64_t v19 = sub_7F38();
  View.privacySensitive(_:)(0LL, v7, v19);
  sub_8D64(v1, &qword_185C0);
  sub_8F7C();
}

uint64_t sub_7258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_42EC(&qword_18620);
  uint64_t inited = swift_initStackObject(v4, v23);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_122F0;
  v22[0] = (id)0x696669746E656469LL;
  v22[1] = (id)0xEA00000000007265LL;
  AnyHashable.init<A>(_:)((void *)(inited + 32), v22, &type metadata for String, &protocol witness table for String);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v6 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v7 = (void *)SKIDirectInvocation.Video.newPayload(userData:)(v6, 1LL);
  swift_bridgeObjectRelease(v6);
  id v8 = [objc_allocWithZone(SKIDirectInvocationContext) init];
  [v8 setInputOrigin:SAInputOriginDialogButtonTapValue];
  [v8 setInteractionType:SAIntentGroupAceInteractionTypeDisplayDrivenValue];
  __int128 v9 = (void *)objc_opt_self(&OBJC_CLASS___SKIDirectInvocation);
  id v10 = [v9 runSiriKitExecutorCommandWithContext:v8 payload:v7];
  id v11 = [v9 wrapCommandInStartLocalRequest:v10];
  id v12 = [objc_allocWithZone(SAStartUIRequest) init];
  [v12 setStartLocalRequest:v11];
  id v13 = [v12 dictionary];
  if (!v13)
  {

LABEL_6:
    return 0LL;
  }

  __int128 v14 = v13;
  uint64_t v15 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
  v22[0] = 0LL;
  id v16 = [v15 dataWithPropertyList:v14 format:200 options:0 error:v22];
  id v17 = v22[0];
  if (!v16)
  {
    unint64_t v19 = v17;
    uint64_t v20 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease(v20);
    goto LABEL_6;
  }

  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v16);

  return v18;
}

uint64_t sub_7530@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  if (a2)
  {
    uint64_t v38 = a3;
    uint64_t v39 = a4;
    uint64_t v36 = 8222587LL;
    unint64_t v37 = 0xE300000000000000LL;
    uint64_t v11 = sub_42EC(&qword_18608);
    uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
    *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_122F0;
    *(void *)(v12 + 56) = &type metadata for CGFloat;
    unint64_t v13 = sub_818C();
    *(void *)(v12 + 64) = v13;
    *(double *)(v12 + 32) = a6;
    uint64_t v14 = String.init(format:_:)(1714433573LL, 0xE400000000000000LL, v12);
    uint64_t v16 = v15;
    uint64_t v34 = v14;
    uint64_t v35 = v15;
    unint64_t v17 = sub_81C8();
    uint64_t v18 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v36,  &v34,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease(v16);
    uint64_t v38 = v18;
    uint64_t v39 = v20;
    uint64_t v36 = 8218747LL;
    unint64_t v37 = 0xE300000000000000LL;
    uint64_t v21 = swift_allocObject(v11, 72LL, 7LL);
    *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_122F0;
    *(void *)(v21 + 56) = &type metadata for CGFloat;
    *(void *)(v21 + 64) = v13;
    *(double *)(v21 + 32) = a7;
    uint64_t v22 = String.init(format:_:)(1714433573LL, 0xE400000000000000LL, v21);
    uint64_t v24 = v23;
    uint64_t v34 = v22;
    uint64_t v35 = v23;
    uint64_t v25 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v36,  &v34,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17);
    uint64_t v27 = v26;
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v24);
    uint64_t v38 = v25;
    uint64_t v39 = v27;
    uint64_t v36 = 8218235LL;
    unint64_t v37 = 0xE300000000000000LL;
    uint64_t v34 = a1;
    uint64_t v35 = a2;
    uint64_t v28 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v36,  &v34,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v17,  v17,  v17);
    uint64_t v30 = v29;
    swift_bridgeObjectRelease(v27);
    URL.init(string:)(v28, v30);
    return swift_bridgeObjectRelease(v30);
  }

  else
  {
    uint64_t v32 = type metadata accessor for URL(0LL);
    return sub_432C(a5, 1LL, 1LL, v32);
  }

void sub_77A4()
{
}

uint64_t sub_77E4()
{
  return swift_deallocObject(v0, 112LL, 7LL);
}

void sub_782C()
{
}

void sub_7848(uint64_t a1@<X8>)
{
}

uint64_t sub_7850(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 80);
  sub_5328(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
  id v6 = v5;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

unint64_t sub_78BC()
{
  unint64_t result = qword_18520;
  if (!qword_18520)
  {
    uint64_t v1 = sub_41AC(&qword_18518);
    sub_44F0(&qword_18528, &qword_18530);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18520);
  }

  return result;
}

void sub_7940()
{
  qword_184C8 = 0x4024000000000000LL;
}

void sub_7950()
{
  qword_184D0 = 0x4075900000000000LL;
}

void sub_7964()
{
  qword_184D8 = 0x4068200000000000LL;
}

void sub_7978()
{
  qword_184E0 = 0x4075A00000000000LL;
}

void sub_798C()
{
  qword_184E8 = 0x406D600000000000LL;
}

void sub_79A0()
{
  qword_184F0 = 7496556LL;
  *(void *)algn_184F8 = 0xE300000000000000LL;
}

uint64_t sub_79BC@<X0>(uint64_t a1@<X1>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v35 = a3;
  char v4 = a2 & 1;
  uint64_t v5 = type metadata accessor for ButtonStyleConfiguration.Label(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = sub_42EC(&qword_18628);
  __chkstk_darwin(v32);
  id v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_42EC(&qword_18630);
  __chkstk_darwin(v11);
  unint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_42EC(&qword_18638);
  uint64_t v33 = *(void *)(v14 - 8);
  uint64_t v34 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = ButtonStyleConfiguration.label.getter(v15);
  double v19 = 1.0;
  if ((ButtonStyleConfiguration.isPressed.getter(v18) & 1) == 0)
  {
    sub_7FBC(a1, v4);
    sub_B404();
    char v21 = v20;
    sub_7FC8(a1, v4);
    if ((v21 & 1) != 0) {
      double v19 = 1.2;
    }
    else {
      double v19 = 1.0;
    }
  }

  double v22 = static UnitPoint.center.getter();
  uint64_t v24 = v23;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v5);
  uint64_t v25 = &v10[*(int *)(v32 + 36)];
  *(double *)uint64_t v25 = v19;
  *((double *)v25 + 1) = v19;
  *((double *)v25 + 2) = v22;
  *((void *)v25 + 3) = v24;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v26 = static Animation.easeOut(duration:)(0.2);
  sub_7FBC(a1, v4);
  sub_B404();
  char v28 = v27;
  sub_7FC8(a1, v4);
  sub_8A38((uint64_t)v10, (uint64_t)v13, &qword_18628);
  uint64_t v29 = &v13[*(int *)(v11 + 36)];
  *(void *)uint64_t v29 = v26;
  v29[8] = v28 & 1;
  sub_8D64((uint64_t)v10, &qword_18628);
  unint64_t v30 = sub_8848();
  View.privacySensitive(_:)(0LL, v11, v30);
  sub_8D64((uint64_t)v13, &qword_18630);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v17, v34);
}

uint64_t sub_7C4C@<X0>(uint64_t a1@<X8>)
{
  return sub_79BC(*(void *)v1, *(_BYTE *)(v1 + 8), a1);
}

void sub_7C58(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.isFocused.getter() & 1;
  sub_466C();
}

unint64_t sub_7C80()
{
  unint64_t result = qword_18540;
  if (!qword_18540)
  {
    unint64_t result = swift_getWitnessTable(&unk_12578, &type metadata for ContentResultStyle);
    atomic_store(result, (unint64_t *)&qword_18540);
  }

  return result;
}

unint64_t sub_7CBC()
{
  unint64_t result = qword_18548;
  if (!qword_18548)
  {
    uint64_t v1 = sub_41AC(&qword_18510);
    uint64_t v2 = sub_41AC(&qword_18500);
    sub_44F0(&qword_18538, &qword_18500);
    v4[0] = v2;
    v4[1] = &type metadata for ContentResultStyle;
    void v4[2] = v3;
    v4[3] = sub_7C80();
    swift_getOpaqueTypeConformance2( v4,  &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>,  1LL);
    sub_44F0(&qword_18550, &qword_18558);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18548);
  }

  return result;
}

unint64_t sub_7D9C()
{
  unint64_t result = qword_18578;
  if (!qword_18578)
  {
    uint64_t v1 = sub_41AC(&qword_18568);
    sub_7E00();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_18578);
  }

  return result;
}

unint64_t sub_7E00()
{
  unint64_t result = qword_18580;
  if (!qword_18580)
  {
    uint64_t v1 = sub_41AC(&qword_18588);
    sub_7E9C();
    v2[0] = sub_41AC(&qword_185C0);
    v2[1] = sub_7F38();
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18580);
  }

  return result;
}

unint64_t sub_7E9C()
{
  unint64_t result = qword_18590;
  if (!qword_18590)
  {
    uint64_t v1 = sub_41AC(&qword_18598);
    sub_44F0(&qword_185A0, &qword_185A8);
    sub_44F0(&qword_185B0, &qword_185B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18590);
  }

  return result;
}

unint64_t sub_7F38()
{
  unint64_t result = qword_185C8;
  if (!qword_185C8)
  {
    uint64_t v1 = sub_41AC(&qword_185C0);
    sub_44BC(&qword_185D0, type metadata accessor for PlaceHolder);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_185C8);
  }

  return result;
}

uint64_t sub_7FBC(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain(result);
  }
  return result;
}

uint64_t sub_7FC8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release(result);
  }
  return result;
}

uint64_t sub_7FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_7FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_42EC(&qword_18598);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_8028(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 80);
  sub_5380(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);

  return a1;
}

void sub_8094()
{
}

uint64_t sub_80B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_828C( a1,  a2,  a3,  a4,  (void (*)(void))&type metadata accessor for ColorScheme,  (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_80D4(uint64_t a1)
{
  return a1;
}

void sub_80FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3(0LL);
  sub_8F98(v3);
  sub_466C();
}

void sub_8128(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = a2(0LL);
  sub_8FC8(v2);
  sub_466C();
}

unint64_t sub_8150()
{
  unint64_t result = qword_18600;
  if (!qword_18600)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for DisambiguationImage.ImageType,  &type metadata for DisambiguationImage.ImageType);
    atomic_store(result, (unint64_t *)&qword_18600);
  }

  return result;
}

unint64_t sub_818C()
{
  unint64_t result = qword_18610;
  if (!qword_18610)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_18610);
  }

  return result;
}

unint64_t sub_81C8()
{
  unint64_t result = qword_18618;
  if (!qword_18618)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_18618);
  }

  return result;
}

uint64_t sub_8204(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_821C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_45A0(result, a2);
  }
  return result;
}

uint64_t sub_8230@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_8260(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_828C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

void sub_8308(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, *a4, v7);
}

void sub_8360(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [a3 setSerializedCommand:isa];
}

uint64_t initializeBufferWithCopyOfBuffer for ContentResultStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_7FBC(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for ContentResultStyle(uint64_t a1)
{
  return sub_7FC8(*(void *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for ContentResultStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_7FBC(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(_BYTE *)(a1 + 8);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_7FC8(v5, v6);
  return a1;
}

uint64_t initializeWithTake for ContentResultStyle(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ContentResultStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((_BYTE *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(_BYTE *)(a1 + 8);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_7FC8(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResultStyle(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for ContentResultStyle(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for ContentResultStyle()
{
  return &type metadata for ContentResultStyle;
}

void destroy for ContentResultTextView(uint64_t a1)
{
}

uint64_t initializeWithCopy for ContentResultTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(_BYTE *)(a2 + 8);
  sub_7FBC(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v8;
  uint64_t v11 = *(void **)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v9);
  id v12 = v11;
  return a1;
}

uint64_t assignWithCopy for ContentResultTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(_BYTE *)(a2 + 8);
  sub_7FBC(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(_BYTE *)(a1 + 8);
  *(void *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_7FC8(v6, v7);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v12 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v14 = *(void **)(a1 + 72);
  uint64_t v15 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v15;
  id v16 = v15;

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

void *initializeWithTake for ContentResultTextView(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for ContentResultTextView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((_BYTE *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(_BYTE *)(a1 + 8);
  *(void *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_7FC8(v6, v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[5];
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(void **)(a1 + 72);
  uint64_t v14 = a2[9];
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = v14;

  *(void *)(a1 + 80) = a2[10];
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentResultTextView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 88))
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

uint64_t storeEnumTagSinglePayload for ContentResultTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 88) = 1;
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

    *(_BYTE *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ContentResultTextView()
{
  return &type metadata for ContentResultTextView;
}

uint64_t sub_8814(uint64_t a1)
{
  return sub_8E58(a1, &qword_18510, (uint64_t (*)(void))sub_7CBC);
}

uint64_t sub_8828(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12D14, 1LL);
}

uint64_t sub_8838(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12CEC, 1LL);
}

unint64_t sub_8848()
{
  unint64_t result = qword_18640;
  if (!qword_18640)
  {
    uint64_t v1 = sub_41AC(&qword_18630);
    sub_88CC();
    sub_44F0(&qword_18658, &qword_18660);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18640);
  }

  return result;
}

unint64_t sub_88CC()
{
  unint64_t result = qword_18648;
  if (!qword_18648)
  {
    uint64_t v1 = sub_41AC(&qword_18628);
    sub_44BC(&qword_18650, (uint64_t (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18648);
  }

  return result;
}

uint64_t sub_8950(uint64_t a1)
{
  return a1;
}

uint64_t sub_8984(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

void sub_899C(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.multilineTextAlignment.getter();
  sub_466C();
}

void sub_89C0(unsigned __int8 *a1)
{
}

void sub_89E0()
{
}

uint64_t sub_89FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_828C( a1,  a2,  a3,  a4,  (void (*)(void))&type metadata accessor for Text.TruncationMode,  (uint64_t (*)(char *))&EnvironmentValues.truncationMode.setter);
}

uint64_t sub_8A20(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

void sub_8A38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_42EC(a3);
  sub_8F98(v3);
  sub_466C();
}

unint64_t sub_8A64()
{
  unint64_t result = qword_186A8;
  if (!qword_186A8)
  {
    uint64_t v1 = sub_41AC(&qword_18690);
    sub_8AE8();
    sub_44F0(&qword_18658, &qword_18660);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_186A8);
  }

  return result;
}

unint64_t sub_8AE8()
{
  unint64_t result = qword_186B0;
  if (!qword_186B0)
  {
    uint64_t v1 = sub_41AC(&qword_18688);
    sub_8B54();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_186B0);
  }

  return result;
}

unint64_t sub_8B54()
{
  unint64_t result = qword_186B8;
  if (!qword_186B8)
  {
    uint64_t v1 = sub_41AC(&qword_18680);
    sub_8BD8();
    sub_44F0(&qword_18710, &qword_18718);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_186B8);
  }

  return result;
}

unint64_t sub_8BD8()
{
  unint64_t result = qword_186C0;
  if (!qword_186C0)
  {
    uint64_t v1 = sub_41AC(&qword_18678);
    sub_8C5C();
    sub_44F0(&qword_18708, &qword_18668);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_186C0);
  }

  return result;
}

unint64_t sub_8C5C()
{
  unint64_t result = qword_186C8;
  if (!qword_186C8)
  {
    uint64_t v1 = sub_41AC(&qword_186D0);
    sub_8CE0();
    sub_44F0(&qword_186F8, &qword_18700);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_186C8);
  }

  return result;
}

unint64_t sub_8CE0()
{
  unint64_t result = qword_186D8;
  if (!qword_186D8)
  {
    uint64_t v1 = sub_41AC(&qword_186E0);
    sub_44F0(&qword_186E8, &qword_186F0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_186D8);
  }

  return result;
}

void sub_8D64(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_42EC(a2);
  sub_8FC8(v2);
  sub_466C();
}

uint64_t sub_8D8C()
{
  return swift_deallocObject(v0, 104LL, 7LL);
}

void sub_8DD4(_BYTE *a1)
{
}

uint64_t sub_8DDC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  char v5 = *(void **)(a1 + 72);
  sub_7FBC(*(void *)a1, *(_BYTE *)(a1 + 8));
  id v6 = v5;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t sub_8E44(uint64_t a1)
{
  return sub_8E58(a1, &qword_18630, (uint64_t (*)(void))sub_8848);
}

uint64_t sub_8E58(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  v5[0] = sub_41AC(a2);
  v5[1] = a3();
  return swift_getOpaqueTypeConformance2( v5,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
}

unint64_t sub_8EA8()
{
  unint64_t result = qword_18728;
  if (!qword_18728)
  {
    uint64_t v1 = sub_41AC(&qword_18720);
    v2[0] = sub_41AC(&qword_18690);
    v2[1] = sub_8A64();
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
    sub_44F0(&qword_18730, &qword_18738);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18728);
  }

  return result;
}

  ;
}

uint64_t sub_8F70(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

  ;
}

uint64_t sub_8F98(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(v1, v2, a1);
}

  ;
}

uint64_t sub_8FC8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_8FDC(uint64_t a1)
{
  return EnvironmentObject.error()(0LL, v1, v2, a1);
}

uint64_t sub_8FF0()
{
  return sub_F644(*(void *)(v1 - 120), v0, (uint64_t *)(v1 - 88));
}

  ;
}

  ;
}

uint64_t sub_9030(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_9038()
{
  return sub_8028(v0);
}

void sub_9040()
{
}

uint64_t sub_9060()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_9068()
{
  return v0;
}

uint64_t sub_9078()
{
  return swift_bridgeObjectRetain(*(void *)(v0 - 112));
}

uint64_t sub_9084()
{
  return sub_7FC8(v0, v1);
}

uint64_t sub_9090(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

double sub_90A4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_B91C(a1), (v6 & 1) != 0))
  {
    sub_BF58(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

void sub_90F4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_BB2C((_OWORD *)a1, v3);
    sub_BB3C(v3, a2);
    sub_8950(a2);
  }

  else
  {
    sub_B3A0(a1, &qword_186A0);
    sub_BA10(a2, v3);
    sub_8950(a2);
    sub_B3A0((uint64_t)v3, &qword_186A0);
  }

uint64_t sub_9178@<X0>(void (**a1)(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_C014();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  char v7 = (char *)&v25[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = v1 + *(int *)(__chkstk_darwin(v4) + 32);
  if (*(void *)v8)
  {
    id v9 = *(id *)v8;
    uint64_t v10 = (uint64_t *)VideoUIPluginConstants.SharedStateKeys.scrollListToIndex.unsafeMutableAddressor();
    uint64_t v12 = *v10;
    uint64_t v11 = v10[1];
    *(void *)&__int128 v26 = v12;
    *((void *)&v26 + 1) = v11;
    swift_bridgeObjectRetain(v11);
    uint64_t v13 = AnyHashable.init<A>(_:)(v25, &v26, &type metadata for String, &protocol witness table for String);
    uint64_t v14 = dispatch thunk of Context.sharedState.getter(v13);

    sub_90A4((uint64_t)v25, v14, &v26);
    swift_bridgeObjectRelease(v14);
    sub_8950((uint64_t)v25);
    if (v27)
    {
      if (swift_dynamicCast(&v24, &v26, (char *)&type metadata for Any + 8, &type metadata for Int, 6LL))
      {
        uint64_t v15 = v24;
LABEL_7:
        sub_5188(v2, (uint64_t)&v25[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
        uint64_t v16 = *(unsigned __int8 *)(v5 + 80);
        uint64_t v17 = (v16 + 16) & ~v16;
        unint64_t v18 = (v6 + v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v19 = swift_allocObject(&unk_15310, v18 + 8, v16 | 7);
        uint64_t result = sub_AF8C((uint64_t)v7, v19 + v17);
        *(void *)(v19 + v18) = v15;
        *a1 = sub_AFD0;
        a1[1] = (void (*)(uint64_t@<X0>, uint64_t@<X8>))v19;
        return result;
      }
    }

    else
    {
      sub_B3A0((uint64_t)&v26, &qword_186A0);
    }

    uint64_t v15 = 0LL;
    goto LABEL_7;
  }

  uint64_t v21 = *(void *)(v8 + 8);
  uint64_t v22 = type metadata accessor for Context(0LL);
  sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  uint64_t result = EnvironmentObject.error()(0LL, v21, v22, v23);
  __break(1u);
  return result;
}

void sub_9340(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v66 = a3;
  uint64_t v59 = a1;
  uint64_t v68 = a4;
  uint64_t v64 = type metadata accessor for ScrollViewProxy(0LL);
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v60 = v5;
  uint64_t v62 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v65 = type metadata accessor for ContentResultsList(0LL);
  uint64_t v55 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v69 = v6;
  uint64_t v61 = (uint64_t)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_42EC(&qword_18808);
  uint64_t v52 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_42EC(&qword_18810);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v51 = sub_42EC(&qword_18818);
  __chkstk_darwin(v51);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = sub_42EC(&qword_18820);
  __chkstk_darwin(v53);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v54 = sub_42EC(&qword_18828);
  __chkstk_darwin(v54);
  uint64_t v56 = (uint64_t)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v58 = sub_42EC(&qword_18830);
  uint64_t v19 = __chkstk_darwin(v58);
  uint64_t v57 = (uint64_t)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = static Axis.Set.horizontal.getter(v19);
  uint64_t v67 = a2;
  uint64_t v71 = a2;
  uint64_t v22 = sub_42EC(&qword_18838);
  sub_44F0(&qword_18840, &qword_18838);
  ScrollView.init(_:showsIndicators:content:)(v21, 1LL, sub_B02C, v70, v22, v23);
  sub_44F0(&qword_18848, &qword_18808);
  View.privacySensitive(_:)(0LL, v7, v24);
  uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v9, v7);
  uint64_t v26 = static Color.clear.getter(v25);
  LOBYTE(v7) = static Edge.Set.all.getter();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v10);
  uint64_t v27 = &v15[*(int *)(v51 + 36)];
  *(void *)uint64_t v27 = v26;
  v27[8] = v7;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (qword_18248 != -1) {
    swift_once(&qword_18248, sub_A734);
  }
  uint64_t v28 = qword_18740;
  uint64_t v29 = static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL,  v28,  0LL,  0LL,  1,  0LL,  1,  v29,  v30);
  sub_BFC0((uint64_t)v15, (uint64_t)v17, &qword_18818);
  memcpy(&v17[*(int *)(v53 + 36)], __src, 0x70uLL);
  sub_B3A0((uint64_t)v15, &qword_18818);
  uint64_t v31 = v67;
  uint64_t v32 = v61;
  sub_5188(v67, v61);
  uint64_t v33 = *(unsigned __int8 *)(v55 + 80);
  uint64_t v34 = (v33 + 16) & ~v33;
  uint64_t v35 = swift_allocObject(&unk_15338, v34 + v69, v33 | 7);
  sub_AF8C(v32, v35 + v34);
  uint64_t v36 = v56;
  sub_BFC0((uint64_t)v17, v56, &qword_18820);
  unint64_t v37 = (void (**)())(v36 + *(int *)(v54 + 36));
  *unint64_t v37 = sub_B038;
  v37[1] = (void (*)())v35;
  v37[2] = 0LL;
  v37[3] = 0LL;
  sub_B3A0((uint64_t)v17, &qword_18820);
  uint64_t v38 = v63;
  uint64_t v39 = v62;
  uint64_t v40 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v59, v64);
  sub_5188(v31, v32);
  uint64_t v41 = *(unsigned __int8 *)(v38 + 80);
  uint64_t v42 = (v41 + 16) & ~v41;
  uint64_t v43 = (v60 + v33 + v42) & ~v33;
  uint64_t v44 = swift_allocObject(&unk_15360, v43 + v69, v33 | 7 | v41);
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v44 + v42, v39, v40);
  sub_AF8C(v32, v44 + v43);
  uint64_t v45 = v57;
  sub_BFC0(v36, v57, &qword_18828);
  uint64_t v46 = v58;
  uint64_t v47 = (void *)(v45 + *(int *)(v58 + 36));
  *uint64_t v47 = v66;
  v47[1] = sub_B140;
  v47[2] = v44;
  sub_B3A0(v36, &qword_18828);
  uint64_t v48 = Namespace.wrappedValue.getter(*(void *)(v31 + *(int *)(v65 + 28)));
  unint64_t v49 = sub_B1A4();
  View.focusScope(_:)(v48, v46, v49);
  sub_B3A0(v45, &qword_18830);
}

uint64_t sub_99B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PinnedScrollableViews(0LL);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v6 = static VerticalAlignment.center.getter(v3);
  uint64_t v7 = v6;
  if (qword_18250 != -1) {
    uint64_t v6 = swift_once(&qword_18250, sub_A748);
  }
  uint64_t v8 = qword_18748;
  __chkstk_darwin(v6);
  *(void *)&v13[-16] = a1;
  int v14 = 0;
  sub_44BC(&qword_188A0, (uint64_t (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)(&v14, v2, v9);
  uint64_t v10 = sub_42EC(&qword_188A8);
  unint64_t v11 = sub_BE1C();
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)(v7, v8, 0LL, v5, sub_BE14, &v13[-32], v10, v11);
}

uint64_t sub_9B00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContentResultsList(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 8) + 16LL);
  sub_5188(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = swift_allocObject(&unk_153D8, v7 + v4, v6 | 7);
  sub_AF8C((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL), v8 + v7);
  uint64_t v9 = sub_42EC(&qword_188C0);
  sub_44F0(&qword_188B8, &qword_188C0);
  return ForEach<>.init(_:content:)(0LL, v5, sub_BF14, v8, v9, v10);
}

double sub_9BFC@<D0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    unint64_t v4 = a1;
    uint64_t v3 = a3;
    uint64_t v5 = *(void *)(a2 + 8);
    if (*(void *)(v5 + 16) > a1)
    {
      uint64_t v6 = v5 + 48 * a1;
      uint64_t v7 = *(void *)(v6 + 40);
      uint64_t v8 = *(void *)(v6 + 56);
      uint64_t v41 = *(void *)(v6 + 48);
      uint64_t v42 = *(void *)(v6 + 32);
      char v40 = *(_BYTE *)(v6 + 64);
      uint64_t v9 = *(void *)(v6 + 72);
      uint64_t KeyPath = swift_getKeyPath(&unk_12720);
      uint64_t v10 = type metadata accessor for Context(0LL);
      sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
      uint64_t v12 = v11;
      uint64_t v44 = v7;
      swift_bridgeObjectRetain(v7);
      uint64_t v43 = v8;
      swift_bridgeObjectRetain(v8);
      uint64_t v46 = v9;
      swift_bridgeObjectRetain(v9);
      uint64_t v13 = EnvironmentObject.init()(v10, v12);
      uint64_t v38 = v14;
      uint64_t v39 = v13;
      if (qword_18258 == -1) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_9:
  swift_once(&qword_18258, sub_B3F0);
LABEL_4:
  uint64_t v15 = qword_18750;
  uint64_t v16 = static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( &v47,  v15,  0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL,  0LL,  1,  0LL,  1,  v16,  v17);
  char v18 = v48;
  uint64_t v19 = v49;
  char v20 = v50;
  uint64_t v21 = v51;
  char v22 = v52;
  uint64_t v36 = v53;
  uint64_t v37 = v47;
  char v23 = v54;
  char v24 = v56;
  uint64_t v34 = v57;
  uint64_t v35 = v55;
  char v25 = v58;
  uint64_t v32 = v60;
  uint64_t v33 = v59;
  if (qword_18248 != -1) {
    swift_once(&qword_18248, sub_A734);
  }
  uint64_t v26 = qword_18740;
  uint64_t v27 = static Alignment.center.getter();
  LOBYTE(v31) = 1;
  LOBYTE(v30) = 1;
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( &v61,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL,  v26,  0LL,  0LL,  v30,  0LL,  v31,  v27,  v28);
  *(_BYTE *)(v3 + swift_weakDestroy(v0 + 16) = 0;
  *(void *)(v3 + 24) = v42;
  *(void *)(v3 + 32) = v44;
  *(void *)(v3 + 40) = v41;
  *(void *)(v3 + 48) = v43;
  *(_BYTE *)(v3 + 56) = v40;
  *(void *)(v3 + 80) = v39;
  *(void *)(v3 + 88) = v38;
  *(void *)(v3 + 96) = v37;
  *(_BYTE *)(v3 + 104) = v18;
  *(void *)(v3 + 112) = v19;
  *(_BYTE *)(v3 + 120) = v20;
  *(void *)(v3 + 128) = v21;
  *(_BYTE *)(v3 + 136) = v22;
  *(void *)(v3 + 144) = v36;
  *(_BYTE *)(v3 + 152) = v23;
  *(void *)(v3 + 160) = v35;
  *(_BYTE *)(v3 + 168) = v24;
  *(void *)(v3 + 176) = v34;
  *(_BYTE *)(v3 + 184) = v25;
  *(void *)(v3 + 192) = v33;
  *(void *)(v3 + 200) = v32;
  *(void *)(v3 + 208) = v61;
  *(_BYTE *)(v3 + 2swift_weakDestroy(v0 + 16) = v62;
  *(void *)(v3 + 224) = v63;
  *(_BYTE *)(v3 + 232) = v64;
  *(void *)(v3 + 240) = v65;
  *(_BYTE *)(v3 + 248) = v66;
  *(void *)(v3 + 256) = v67;
  *(_BYTE *)(v3 + 264) = v68;
  *(void *)(v3 + 272) = v69;
  *(_BYTE *)(v3 + 280) = v70;
  *(void *)(v3 + 288) = v71;
  *(_BYTE *)(v3 + 296) = v72;
  *(void *)(v3 + 64) = v46;
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 320) = v4;
  *(void *)uint64_t v3 = KeyPath;
  *(void *)(v3 + 8) = 0LL;
  double result = v73[0];
  *(_OWORD *)(v3 + 304) = *(_OWORD *)v73;
  return result;
}

void sub_A024()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + *(int *)(type metadata accessor for ContentResultsList(0LL) + 32);
  if (*(void *)v2)
  {
    id v3 = *(id *)v2;
    unint64_t v4 = (void *)VideoUIPluginConstants.SharedStateKeys.listItemsCount.unsafeMutableAddressor();
    uint64_t v5 = v4[1];
    *(void *)&__int128 v18 = *v4;
    *((void *)&v18 + 1) = v5;
    swift_bridgeObjectRetain(v5);
    uint64_t v6 = AnyHashable.init<A>(_:)(v20, &v18, &type metadata for String, &protocol witness table for String);
    uint64_t v7 = dispatch thunk of Context.sharedState.getter(v6);

    sub_90A4((uint64_t)v20, v7, &v18);
    swift_bridgeObjectRelease(v7);
    sub_8950((uint64_t)v20);
    uint64_t v8 = v19;
    sub_B3A0((uint64_t)&v18, &qword_186A0);
    if (!v8)
    {
      uint64_t v9 = *v4;
      uint64_t v10 = v4[1];
      *(void *)&__int128 v18 = v9;
      *((void *)&v18 + 1) = v10;
      id v11 = v3;
      swift_bridgeObjectRetain(v10);
      AnyHashable.init<A>(_:)(v20, &v18, &type metadata for String, &protocol witness table for String);
      uint64_t v12 = *(void *)(*(void *)(v1 + 8) + 16LL);
      uint64_t v19 = &type metadata for Int;
      *(void *)&__int128 v18 = v12;
      uint64_t v13 = (void (*)(_BYTE *, void))dispatch thunk of Context.sharedState.modify(v17);
      sub_90F4((uint64_t)&v18, (uint64_t)v20);
      v13(v17, 0LL);
    }
  }

  else
  {
    uint64_t v14 = *(void *)(v2 + 8);
    uint64_t v15 = type metadata accessor for Context(0LL);
    sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    EnvironmentObject.error()(0LL, v14, v15, v16);
    __break(1u);
  }

void sub_A1A4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = static Animation.easeOut(duration:)(1.0);
  v16[2] = a2;
  _OWORD v16[3] = v5;
  withAnimation<A>(_:_:)(v6, sub_B3D8, v16, (char *)&type metadata for () + 8);
  swift_release(v6);
  sub_A344();
  uint64_t v7 = a3 + *(int *)(type metadata accessor for ContentResultsList(0LL) + 32);
  if (*(void *)v7)
  {
    id v8 = *(id *)v7;
    uint64_t v9 = (uint64_t *)VideoUIPluginConstants.SharedStateKeys.currentFocusedIndex.unsafeMutableAddressor();
    uint64_t v11 = *v9;
    uint64_t v10 = v9[1];
    v18[0] = v11;
    v18[1] = v10;
    swift_bridgeObjectRetain(v10);
    AnyHashable.init<A>(_:)(v19, v18, &type metadata for String, &protocol witness table for String);
    v18[3] = &type metadata for Int;
    v18[0] = v5;
    uint64_t v12 = (void (*)(_BYTE *, void))dispatch thunk of Context.sharedState.modify(v17);
    sub_90F4((uint64_t)v18, (uint64_t)v19);
    v12(v17, 0LL);
  }

  else
  {
    uint64_t v13 = *(void *)(v7 + 8);
    uint64_t v14 = type metadata accessor for Context(0LL);
    sub_44BC((unint64_t *)&qword_184B8, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    EnvironmentObject.error()(0LL, v13, v14, v15);
    __break(1u);
  }

uint64_t sub_A2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  double v2 = static UnitPoint.leading.getter();
  return ScrollViewProxy.scrollTo<A>(_:anchor:)( &v5,  *(void *)&v2,  v3,  0LL,  &type metadata for Int,  &protocol witness table for Int);
}

uint64_t sub_A344()
{
  uint64_t v31 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v34 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v1 = (char *)&v27 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ContentResultsList(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = type metadata accessor for DispatchTime(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - v13;
  sub_BDA0();
  uint64_t v28 = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v12, 1.0);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
  v29(v12, v8);
  sub_5188(v27, (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v17 = swift_allocObject(&unk_15388, v16 + v7, v15 | 7);
  sub_AF8C((uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL), v17 + v16);
  aBlock[4] = sub_BDE0;
  uint64_t v36 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_A704;
  aBlock[3] = &unk_153A0;
  __int128 v18 = _Block_copy(aBlock);
  uint64_t v19 = swift_release(v36);
  static DispatchQoS.unspecified.getter(v19);
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_44BC(&qword_18888, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v21 = v20;
  uint64_t v22 = sub_42EC(&qword_18890);
  sub_44F0(&qword_18898, &qword_18890);
  uint64_t v23 = v31;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v22, v24, v31, v21);
  char v25 = (void *)v28;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v14, v4, v1, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v34 + 8))(v1, v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v33);
  return ((uint64_t (*)(char *, uint64_t))v29)(v14, v30);
}

uint64_t sub_A628(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ResetFocusAction(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ContentResultsList(0LL);
  sub_B73C();
  uint64_t v7 = Namespace.wrappedValue.getter(*(void *)(a1 + *(int *)(v6 + 28)));
  ResetFocusAction.callAsFunction(in:)(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_A704(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_A734()
{
  qword_18740 = 0x4074200000000000LL;
}

void sub_A748()
{
  qword_18748 = 0x404E000000000000LL;
}

uint64_t *sub_A758(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v5);
  }

  else
  {
    uint64_t v8 = a2[1];
    a1[1] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v8);
    uint64_t v12 = sub_42EC(&qword_184A8);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      uint64_t v13 = type metadata accessor for ResetFocusAction(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v10, v11, v13);
      uint64_t v14 = 1LL;
    }

    else
    {
      uint64_t v15 = *v11;
      *uint64_t v10 = *v11;
      swift_retain(v15);
      uint64_t v14 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v10, v12, v14);
    uint64_t v16 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    __int128 v18 = (char *)a2 + v16;
    uint64_t v20 = *(void **)v18;
    uint64_t v19 = *((void *)v18 + 1);
    void *v17 = v20;
    v17[1] = v19;
    id v21 = v20;
  }

  return a1;
}

void sub_A864(void *a1, uint64_t a2)
{
  int v4 = (void *)((char *)a1 + *(int *)(a2 + 24));
  uint64_t v5 = sub_42EC(&qword_184A8);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    uint64_t v6 = type metadata accessor for ResetFocusAction(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
  }

  else
  {
    swift_release(*v4);
  }
}

uint64_t *sub_A8F4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (uint64_t *)((char *)a1 + v8);
  uint64_t v10 = (uint64_t *)((char *)a2 + v8);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  uint64_t v11 = sub_42EC(&qword_184A8);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    uint64_t v12 = type metadata accessor for ResetFocusAction(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v9, v10, v12);
    uint64_t v13 = 1LL;
  }

  else
  {
    uint64_t v14 = *v10;
    uint64_t *v9 = *v10;
    swift_retain(v14);
    uint64_t v13 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v9, v11, v13);
  uint64_t v15 = a3[8];
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  uint64_t v16 = (uint64_t *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v19 = *(void **)v17;
  uint64_t v18 = *((void *)v17 + 1);
  *uint64_t v16 = v19;
  v16[1] = v18;
  id v20 = v19;
  return a1;
}

uint64_t *sub_A9D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[1];
  uint64_t v9 = a1[1];
  a1[1] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    sub_B3A0((uint64_t)a1 + v10, &qword_184A8);
    uint64_t v13 = sub_42EC(&qword_184A8);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      uint64_t v14 = type metadata accessor for ResetFocusAction(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v11, v12, v14);
      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v16 = *v12;
      *uint64_t v11 = *v12;
      swift_retain(v16);
      uint64_t v15 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v11, v13, v15);
  }

  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  uint64_t v17 = a3[8];
  uint64_t v18 = (uint64_t *)((char *)a1 + v17);
  uint64_t v19 = (char *)a2 + v17;
  id v20 = *(void **)((char *)a1 + v17);
  id v21 = *(void **)v19;
  *uint64_t v18 = *(void *)v19;
  id v22 = v21;

  v18[1] = *((void *)v19 + 1);
  return a1;
}

_OWORD *sub_AAFC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_42EC(&qword_184A8);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    uint64_t v10 = type metadata accessor for ResetFocusAction(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1LL);
  }

  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  uint64_t v11 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

uint64_t *sub_ABC8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRelease(v7);
  if (a1 != a2)
  {
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    sub_B3A0((uint64_t)a1 + v8, &qword_184A8);
    uint64_t v11 = sub_42EC(&qword_184A8);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      uint64_t v12 = type metadata accessor for ResetFocusAction(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1LL);
    }

    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64LL));
    }
  }

  uint64_t v13 = a3[8];
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v16 = *(void **)((char *)a1 + v13);
  *(uint64_t *)((char *)a1 + v13) = *v15;

  *((void *)v14 + 1) = v15[1];
  return a1;
}

uint64_t sub_ACDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_ACE8);
}

uint64_t sub_ACE8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_42EC(&qword_18758);
    return sub_7FD4((uint64_t)a1 + *(int *)(a3 + 24), a2, v8);
  }

uint64_t sub_AD60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_AD6C);
}

void *sub_AD6C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *double result = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_42EC(&qword_18758);
    return (void *)sub_432C((uint64_t)v5 + *(int *)(a4 + 24), a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for ContentResultsList(uint64_t a1)
{
  uint64_t result = qword_187B8;
  if (!qword_187B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContentResultsList);
  }
  return result;
}

void sub_AE14(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_AEA4(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(v2 - 8) + 64LL;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    void v4[4] = &unk_126B8;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
  }

void sub_AEA4(uint64_t a1)
{
  if (!qword_187C8)
  {
    uint64_t v2 = type metadata accessor for ResetFocusAction(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_187C8);
    }
  }

uint64_t sub_AEF8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12D64, 1LL);
}

uint64_t sub_AF08()
{
  uint64_t v5 = sub_C014();
  sub_C01C(v5);
  swift_bridgeObjectRelease(*(void *)(v2 + 8));
  uint64_t v6 = sub_42EC(&qword_184A8);
  if (sub_C068(v6) == 1)
  {
    uint64_t v7 = sub_C09C();
    sub_C000(v7);
  }

  else
  {
    sub_C0C4();
  }

  sub_C0B8();
  return sub_C040(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8, v1 | 7);
}

uint64_t sub_AF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContentResultsList(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_AFD0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_C014() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_9340(a1, v2 + v6, *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8LL)), a2);
}

uint64_t sub_B02C()
{
  return sub_99B4(*(void *)(v0 + 16));
}

void sub_B038()
{
}

uint64_t sub_B060()
{
  uint64_t v1 = type metadata accessor for ScrollViewProxy(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = sub_C014();
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease(*(void *)(v0 + v6));
  swift_bridgeObjectRelease(*(void *)(v0 + v6 + 8));
  uint64_t v7 = sub_42EC(&qword_184A8);
  if (sub_C068(v7) == 1)
  {
    uint64_t v8 = sub_C09C();
    sub_C000(v8);
  }

  else
  {
    sub_C0C4();
  }

  sub_8FB0();
  return swift_deallocObject(v9, v10, v11);
}

void sub_B140(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ScrollViewProxy(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(sub_C014() - 8) + 80LL);
  sub_A1A4(a1, v1 + v4, v1 + ((v4 + v5 + v6) & ~v6));
}

unint64_t sub_B1A4()
{
  unint64_t result = qword_18850;
  if (!qword_18850)
  {
    uint64_t v1 = sub_41AC(&qword_18830);
    sub_B26C(&qword_18858, &qword_18828, (void (*)(void))sub_B248);
    sub_44F0(&qword_18870, &qword_18878);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18850);
  }

  return result;
}

uint64_t sub_B248()
{
  return sub_B26C(&qword_18860, &qword_18820, (void (*)(void))sub_B2D4);
}

uint64_t sub_B26C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_41AC(a2);
    a3();
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_B2D4()
{
  unint64_t result = qword_18868;
  if (!qword_18868)
  {
    uint64_t v1 = sub_41AC(&qword_18818);
    uint64_t v2 = sub_41AC(&qword_18808);
    sub_44F0(&qword_18848, &qword_18808);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2( v4,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
    sub_44F0(&qword_18550, &qword_18558);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18868);
  }

  return result;
}

void sub_B3A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_42EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_466C();
}

uint64_t sub_B3D8()
{
  return sub_A2EC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_B3F0()
{
  qword_18750 = 0x4075900000000000LL;
}

void sub_B404()
{
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_C0A4();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_9000();
  if ((v2 & 1) == 0)
  {
    uint64_t v7 = swift_retain(v4);
    os_log_type_t v8 = static os_log_type_t.fault.getter(v7);
    uint64_t v9 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)sub_9030(12LL);
      uint64_t v12 = sub_9030(32LL);
      uint64_t v15 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_F644(1819242306LL, 0xE400000000000000LL, &v15);
      uint64_t v14 = sub_9090(v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v14);
      sub_C094( &dword_0,  v9,  v10,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  v11);
      sub_C08C(v12);
      sub_8F70(v12);
      sub_8F70((uint64_t)v11);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(&v15, v0, v4);
    sub_7FC8(v4, 0);
    sub_C0AC(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }

  sub_8FB0();
}

void sub_B564()
{
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_C0A4();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((v1 & 1) != 0)
  {
    swift_bridgeObjectRetain(v3);
  }

  else
  {
    uint64_t v10 = swift_retain(v5);
    os_log_type_t v11 = static os_log_type_t.fault.getter(v10);
    uint64_t v12 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    os_log_type_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v14 = (uint8_t *)sub_9030(12LL);
      uint64_t v15 = sub_9030(32LL);
      v18[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v16 = v14 + 4;
      uint64_t v17 = sub_F644(0xD000000000000010LL, 0x80000000000131B0LL, v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17);
      sub_C094( &dword_0,  v12,  v13,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  v14);
      sub_C08C(v15);
      sub_8F70(v15);
      sub_8F70((uint64_t)v14);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v18, v9, v5);
    sub_5380(v5, v3, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  sub_8FB0();
}

void sub_B70C()
{
}

void sub_B73C()
{
  unint64_t v3 = v2;
  uint64_t v31 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  os_log_type_t v11 = v10;
  uint64_t v12 = sub_C0A4();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_9000();
  uint64_t v14 = sub_42EC(v8);
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_BFC0(v9, (uint64_t)v16, v8);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v16, v14);
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    uint64_t v18 = v6(0LL);
    (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v18 - 8) + 32LL))(v11, v16, v18);
  }

  else
  {
    uint64_t v19 = *v16;
    os_log_type_t v20 = static os_log_type_t.fault.getter(EnumCaseMultiPayload);
    id v21 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v29 = v3;
      uint64_t v22 = sub_9030(12LL);
      uint64_t v30 = v11;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v24 = sub_9030(32LL);
      uint64_t v32 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v25 = sub_F644(v31, v29, &v32);
      uint64_t v26 = sub_9090(v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v26);
      sub_C094( &dword_0,  v21,  v20,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  v23);
      sub_C08C(v24);
      sub_8F70(v24);
      uint64_t v27 = (uint64_t)v23;
      os_log_type_t v11 = v30;
      sub_8F70(v27);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v11, v1, v19);
    swift_release(v19);
    sub_C0AC(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
  }

  sub_8FB0();
}

unint64_t sub_B91C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_B94C(a1, v4);
}

unint64_t sub_B94C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_BCCC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_8950((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

double sub_BA10@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_B91C(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v14 = *v3;
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    Swift::Int v11 = *(void *)(v10 + 24);
    sub_42EC(&qword_18880);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v11);
    sub_8950(*(void *)(v14 + 48) + 40 * v7);
    sub_BB2C((_OWORD *)(*(void *)(v14 + 56) + 32 * v7), a2);
    _NativeDictionary._delete(at:)( v7,  v14,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
    uint64_t v12 = *v3;
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease(v12);
  }

  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

_OWORD *sub_BB2C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_BB3C(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v8 = *v2;
  *__int128 v2 = 0x8000000000000000LL;
  sub_BBA8(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = *v2;
  *__int128 v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

_OWORD *sub_BBA8(_OWORD *a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_B91C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v14 = v9;
  char v15 = v10;
  sub_42EC(&qword_18880);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_B91C(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
    __break(1u);
    return result;
  }

  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if ((v15 & 1) != 0)
  {
    uint64_t v19 = (void *)(v18[7] + 32 * v14);
    sub_BD80(v19);
    return sub_BB2C(a1, v19);
  }

  else
  {
    sub_BCCC(a2, (uint64_t)v21);
    return sub_BD08(v14, (uint64_t)v21, a1, v18);
  }

uint64_t sub_BCCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_BD08(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = sub_BB2C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

uint64_t sub_BD80(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_BDA0()
{
  unint64_t result = qword_18420;
  if (!qword_18420)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_18420);
  }

  return result;
}

uint64_t sub_BDE0()
{
  return sub_A628(v0 + v1);
}

uint64_t sub_BDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_BE0C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_BE14()
{
  return sub_9B00(*(void *)(v0 + 16));
}

unint64_t sub_BE1C()
{
  unint64_t result = qword_188B0;
  if (!qword_188B0)
  {
    uint64_t v1 = sub_41AC(&qword_188A8);
    sub_44F0(&qword_188B8, &qword_188C0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_188B0);
  }

  return result;
}

uint64_t sub_BE9C()
{
  uint64_t v5 = sub_C014();
  sub_C01C(v5);
  swift_bridgeObjectRelease(*(void *)(v2 + 8));
  uint64_t v6 = sub_42EC(&qword_184A8);
  if (sub_C068(v6) == 1)
  {
    uint64_t v7 = sub_C09C();
    sub_C000(v7);
  }

  else
  {
    sub_C0C4();
  }

  sub_C0B8();
  return sub_C040(v0, v3 + v4, v1 | 7);
}

double sub_BF14@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_9BFC(a1, v2 + v5, a2);
}

uint64_t sub_BF58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_BF94()
{
}

void sub_BFC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_42EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_466C();
}

uint64_t sub_C000(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_C014()
{
  return type metadata accessor for ContentResultsList(0LL);
}

uint64_t sub_C01C(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(v1
                                             + ((*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL))));
}

uint64_t sub_C040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

  ;
}

uint64_t sub_C068(uint64_t a1)
{
  return swift_getEnumCaseMultiPayload(v1, a1);
}

  ;
}

uint64_t sub_C08C(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

void sub_C094(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_C09C()
{
  return type metadata accessor for ResetFocusAction(0LL);
}

uint64_t sub_C0A4()
{
  return type metadata accessor for EnvironmentValues(0LL);
}

uint64_t sub_C0AC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

void sub_C0B8()
{
}

uint64_t sub_C0C4()
{
  return swift_release(*v0);
}

uint64_t sub_C0CC()
{
  unint64_t v0 = sub_C13C();
  EnvironmentValues.subscript.getter( &v2,  &type metadata for OriginAssistantIdKey,  &type metadata for OriginAssistantIdKey,  v0);
  return v2;
}

uint64_t sub_C104(uint64_t a1, uint64_t a2)
{
  v4[0] = a1;
  v4[1] = a2;
  unint64_t v2 = sub_C13C();
  return EnvironmentValues.subscript.setter( v4,  &type metadata for OriginAssistantIdKey,  &type metadata for OriginAssistantIdKey,  v2);
}

unint64_t sub_C13C()
{
  unint64_t result = qword_188D8;
  if (!qword_188D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_12788, &type metadata for OriginAssistantIdKey);
    atomic_store(result, (unint64_t *)&qword_188D8);
  }

  return result;
}

ValueMetadata *type metadata accessor for OriginAssistantIdKey()
{
  return &type metadata for OriginAssistantIdKey;
}

void sub_C188(void *a1@<X8>)
{
  *a1 = 0LL;
  a1[1] = 0LL;
}

uint64_t sub_C190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_C1E0();
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

unint64_t sub_C1E0()
{
  unint64_t result = qword_188E0;
  if (!qword_188E0)
  {
    uint64_t v1 = sub_41AC(&qword_188E8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_188E0);
  }

  return result;
}

uint64_t sub_C23C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = *v5;
  }

  else
  {
    __chkstk_darwin();
    unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (a2)
    {
      BOOL v9 = v5;
      uint64_t v10 = v8;
      uint64_t v11 = a2;
      do
      {
        uint64_t v12 = *v9++;
        *v10++ = v12;
        --v11;
      }

      while (v11);
    }

    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata(0LL, a2);
  }

  __chkstk_darwin();
  unint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2)
  {
    char v15 = (int *)(TupleTypeMetadata + 32);
    uint64_t v16 = a2;
    do
    {
      if (a2 == 1) {
        int v17 = 0;
      }
      else {
        int v17 = *v15;
      }
      uint64_t v19 = *v5++;
      uint64_t v18 = v19;
      uint64_t v20 = *a1++;
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 16LL))(&v14[v17], v20);
      v15 += 4;
      --v16;
    }

    while (v16);
  }

  return TupleView.init(_:)(v14, TupleTypeMetadata);
}

void sub_C378()
{
  uint64_t v0 = sub_42EC(&qword_18A48);
  __chkstk_darwin(v0);
  sub_463C();
  uint64_t v3 = (void *)(v2 - v1);
  *uint64_t v3 = static Alignment.center.getter();
  v3[1] = v4;
  uint64_t v5 = sub_42EC(&qword_18A50);
  sub_C440((void *)((char *)v3 + *(int *)(v5 + 44)));
  sub_EBFC(&qword_18A58, &qword_18A48, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.privacySensitive(_:)(0LL, v0, v6);
  sub_8D64((uint64_t)v3, &qword_18A48);
}

uint64_t sub_C440@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_42EC(&qword_18A60);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v8 = type metadata accessor for ColorScheme(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v24 - v13;
  type metadata accessor for PlaceHolder(0LL);
  sub_B70C();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, enum case for ColorScheme.light(_:), v8);
  char v15 = static ColorScheme.== infix(_:_:)(v14, v12);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v16(v14, v8);
  if ((v15 & 1) != 0)
  {
    if (qword_18268 != -1) {
      swift_once(&qword_18268, sub_C960);
    }
    int v17 = &qword_188F8;
  }

  else
  {
    if (qword_18270 != -1) {
      swift_once(&qword_18270, sub_C974);
    }
    int v17 = &qword_18900;
  }

  uint64_t v18 = *v17;
  swift_retain(*v17);
  sub_C67C();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v19(v5, v7, v1);
  uint64_t v20 = v25;
  *uint64_t v25 = v18;
  uint64_t v21 = sub_42EC(&qword_18A68);
  v19((char *)v20 + *(int *)(v21 + 48), v5, v1);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v2 + 8);
  swift_retain(v18);
  v22(v7, v1);
  v22(v5, v1);
  return swift_release(v18);
}

void sub_C67C()
{
  uint64_t v1 = type metadata accessor for ColorScheme(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v18 - v6;
  uint64_t v8 = Image.init(systemName:)( *(void *)&aEllipsisfilm[8 * *(char *)(v0 + 32)],  *(void *)&aAppstore[8 * *(char *)(v0 + 32) + 8]);
  if (qword_18260 != -1) {
    swift_once(&qword_18260, sub_C8B4);
  }
  uint64_t v9 = qword_188F0;
  uint64_t KeyPath = swift_getKeyPath(&unk_12910);
  type metadata accessor for PlaceHolder(0LL);
  swift_retain(v9);
  sub_B70C();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.light(_:), v1);
  char v11 = static ColorScheme.== infix(_:_:)(v7, v5);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v2 + 8);
  v12(v5, v1);
  v12(v7, v1);
  if ((v11 & 1) != 0)
  {
    if (qword_18278 != -1) {
      swift_once(&qword_18278, sub_C988);
    }
    uint64_t v13 = &qword_18908;
  }

  else
  {
    if (qword_18280 != -1) {
      swift_once(&qword_18280, sub_C99C);
    }
    uint64_t v13 = &qword_18910;
  }

  uint64_t v14 = *v13;
  swift_retain(*v13);
  uint64_t v15 = swift_getKeyPath(&unk_12940);
  v18[1] = v8;
  uint64_t v18[2] = KeyPath;
  v18[3] = v9;
  void v18[4] = v15;
  v18[5] = v14;
  uint64_t v16 = sub_42EC(&qword_18A70);
  unint64_t v17 = sub_E744();
  View.privacySensitive(_:)(0LL, v16, v17);
  swift_release(v14);
  swift_release(v15);
  swift_release(v9);
  swift_release(KeyPath);
  swift_release(v8);
  sub_8FB0();
}

void sub_C8B4()
{
  uint64_t v0 = sub_42EC(&qword_18670);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Font.Design(0LL);
  sub_432C((uint64_t)v2, 1LL, 1LL, v3);
  uint64_t v4 = static Font.system(size:weight:design:)(0LL, 1LL, v2, 70.0);
  sub_8D64((uint64_t)v2, &qword_18670);
  qword_188F0 = v4;
}

uint64_t sub_C960(uint64_t a1)
{
  return sub_C9B0(0.921568627, a1, &qword_188F8);
}

uint64_t sub_C974(uint64_t a1)
{
  return sub_C9B0(0.11372549, a1, &qword_18900);
}

uint64_t sub_C988(uint64_t a1)
{
  return sub_C9B0(0.862745098, a1, &qword_18908);
}

uint64_t sub_C99C(uint64_t a1)
{
  return sub_C9B0(0.168627451, a1, &qword_18910);
}

uint64_t sub_C9B0(double a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = type metadata accessor for Color.RGBColorSpace(0LL);
  __chkstk_darwin(v5);
  sub_463C();
  uint64_t v8 = v7 - v6;
  (*(void (**)(uint64_t, void))(v9 + 104))(v7 - v6, enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t result = Color.init(_:red:green:blue:opacity:)(v8, a1, a1, a1, 1.0);
  *a3 = result;
  return result;
}

void sub_CA40()
{
  uint64_t v0 = type metadata accessor for ImageLoader(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  sub_41FC();
  sub_466C();
}

uint64_t sub_CA70(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = v16 + ((v4 + 16LL) & ~(unint64_t)v4);
    swift_retain(v16);
  }

  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + swift_weakDestroy(v0 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)(a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    *(void *)(a1 + 40) = v7;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    uint64_t v11 = sub_42EC(&qword_185F8);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      uint64_t v12 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v9, v10, v12);
      uint64_t v13 = v9;
      uint64_t v14 = v11;
      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v17 = *v10;
      uint64_t *v9 = *v10;
      swift_retain(v17);
      uint64_t v13 = v9;
      uint64_t v14 = v11;
      uint64_t v15 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v13, v14, v15);
  }

  return a1;
}

uint64_t sub_CB7C(void *a1, uint64_t a2)
{
  int v4 = (void *)((char *)a1 + *(int *)(a2 + 20));
  uint64_t v5 = sub_42EC(&qword_185F8);
  uint64_t v6 = type metadata accessor for ColorScheme(0LL);
  return (*(uint64_t (**)(void *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
}

uint64_t sub_CC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  uint64_t v10 = sub_42EC(&qword_185F8);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v8, v9, v11);
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v13 = *v9;
    *uint64_t v8 = *v9;
    swift_retain(v13);
    uint64_t v12 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v10, v12);
  return a1;
}

uint64_t sub_CCDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (uint64_t *)(a1 + v12);
    uint64_t v14 = (uint64_t *)(a2 + v12);
    sub_8D64(a1 + v12, &qword_185F8);
    uint64_t v15 = sub_42EC(&qword_185F8);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      uint64_t v16 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v13, v14, v16);
      uint64_t v17 = 1LL;
    }

    else
    {
      uint64_t v18 = *v14;
      *uint64_t v13 = *v14;
      swift_retain(v18);
      uint64_t v17 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v13, v15, v17);
  }

  return a1;
}

_OWORD *sub_CDF8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_42EC(&qword_185F8);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    uint64_t v9 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v6, v7, v9);
    swift_storeEnumTagMultiPayload(v6, v8, 1LL);
  }

  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  return a1;
}

uint64_t sub_CEA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease(v10);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_8D64(a1 + v11, &qword_185F8);
    uint64_t v14 = sub_42EC(&qword_185F8);
    if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
    {
      uint64_t v15 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32LL))(v12, v13, v15);
      swift_storeEnumTagMultiPayload(v12, v14, 1LL);
    }

    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_CFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_CFAC);
}

uint64_t sub_CFAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_42EC(&qword_18918);
    return sub_7FD4(a1 + *(int *)(a3 + 20), a2, v8);
  }

uint64_t sub_D024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D030);
}

uint64_t sub_D030(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_42EC(&qword_18918);
    return sub_432C(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for PlaceHolder(uint64_t a1)
{
  uint64_t result = qword_18978;
  if (!qword_18978) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PlaceHolder);
  }
  return result;
}

void sub_D0D8(uint64_t a1)
{
  v4[0] = "0";
  sub_D14C(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
  }

void sub_D14C(uint64_t a1)
{
  if (!qword_18988)
  {
    uint64_t v2 = type metadata accessor for ColorScheme(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_18988);
    }
  }

uint64_t sub_D1A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32LL);
}

uint64_t sub_D1A8(uint64_t a1)
{
  v5[0] = &unk_12848;
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v5[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for URL(319LL);
    if (v4 <= 0x3F)
    {
      void v5[2] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 0LL, 3LL, v5, a1 + 32);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_D23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v12;
  int v15 = (v12 | v7) & 0x100000;
  if ((v13 | (unint64_t)v7) > 7 || v15 != 0 || v14 > 0x18)
  {
    uint64_t v18 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v18 + (((v13 | v7) & 0xF8 ^ 0x1F8) & ((v13 | v7) + 16));
    swift_retain(v18);
  }

  else
  {
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    unint64_t v19 = ~(unint64_t)v7;
    uint64_t v24 = v5;
    uint64_t v20 = *(void *)a2;
    uint64_t v21 = *(void *)(a2 + 8);
    char v22 = *(_BYTE *)(a2 + 16);
    sub_D38C(*(void *)a2, v21);
    *(void *)a1 = v20;
    *(void *)(a1 + 8) = v21;
    *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v22;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))( (a1 + v8 + 17) & v19,  (a2 + v8 + 17) & v19,  v24);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))( (((a1 + v8 + 17) & v19) + v25 + v13) & ~v13,  (((a2 + v8 + 17) & v19) + v25 + v13) & ~v13,  v26);
  }

  return a1;
}

uint64_t sub_D38C(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_D394(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8LL);
  unint64_t v5 = ((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))( (v5 + v6 + *(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL),  v7);
}

uint64_t sub_D418(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t sub_D420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(_BYTE *)(a2 + 16);
  sub_D38C(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v8;
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 17 + a1) & ~v10;
  uint64_t v12 = (v10 + 17 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 16))( (v13 + *(unsigned __int8 *)(v15 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),  (v13 + *(unsigned __int8 *)(v15 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),  v14);
  return a1;
}

uint64_t sub_D4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(_BYTE *)(a2 + 16);
  sub_D38C(*(void *)a2, v7);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v8;
  sub_D418(v9, v10);
  uint64_t v11 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = (v12 + 17 + a1) & ~v12;
  uint64_t v14 = (v12 + 17 + a2) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v11 + 24))(v13, v14);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 24))( (v15 + *(unsigned __int8 *)(v17 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80),  (v15 + *(unsigned __int8 *)(v17 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80),  v16);
  return a1;
}

uint64_t sub_D5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 17 + a1) & ~v5;
  uint64_t v7 = (v5 + 17 + a2) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  uint64_t v8 = *(void *)(v4 + 64);
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))( (v8 + *(unsigned __int8 *)(v10 + 80) + v6) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80),  (v8 + *(unsigned __int8 *)(v10 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80),  v9);
  return a1;
}

uint64_t sub_D640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(_BYTE *)(a2 + 16);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  sub_D418(v7, v8);
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 17 + a1) & ~v10;
  uint64_t v12 = (v10 + 17 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 40))( (v13 + *(unsigned __int8 *)(v15 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),  (v13 + *(unsigned __int8 *)(v15 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),  v14);
  return a1;
}

uint64_t sub_D6F4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  else {
    unsigned int v11 = v7;
  }
  if (v11 <= 0xFE) {
    unsigned int v12 = 254;
  }
  else {
    unsigned int v12 = v11;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v13 = v8;
  uint64_t v14 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = *(void *)(v6 + 64);
  uint64_t v16 = *(unsigned __int8 *)(v9 + 80);
  if (a2 <= v12) {
    goto LABEL_27;
  }
  uint64_t v17 = ((v15 + v16 + ((v14 + 17) & ~v14)) & ~v16) + *(void *)(v9 + 64);
  char v18 = 8 * v17;
  if (v17 <= 3)
  {
    unsigned int v21 = ((a2 - v12 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v21))
    {
      int v19 = *(_DWORD *)(a1 + v17);
      if (!v19) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }

    if (v21 > 0xFF)
    {
      int v19 = *(unsigned __int16 *)(a1 + v17);
      if (!*(_WORD *)(a1 + v17)) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }

    if (v21 < 2)
    {
LABEL_27:
      if (v11 > 0xFE)
      {
        uint64_t v25 = (a1 + v14 + 17) & ~v14;
        if ((_DWORD)v7 == v12)
        {
          uint64_t v10 = v7;
          uint64_t v13 = v5;
        }

        else
        {
          uint64_t v25 = (v25 + v15 + v16) & ~v16;
        }

        return sub_7FD4(v25, v10, v13);
      }

      else
      {
        unsigned int v24 = *(unsigned __int8 *)(a1 + 16);
        if (v24 > 1) {
          return (v24 ^ 0xFF) + 1;
        }
        else {
          return 0LL;
        }
      }
    }
  }

  int v19 = *(unsigned __int8 *)(a1 + v17);
  if (!*(_BYTE *)(a1 + v17)) {
    goto LABEL_27;
  }
LABEL_18:
  int v22 = (v19 - 1) << v18;
  if ((_DWORD)v17)
  {
    else {
      int v23 = 4;
    }
    __asm { BR              X12 }
  }

  return v12 + v22 + 1;
}

void sub_D8C8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(type metadata accessor for URL(0LL) - 8);
  if (v8 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v10 = v8;
  }
  if (v10 <= 0xFE) {
    unsigned int v11 = 254;
  }
  else {
    unsigned int v11 = v10;
  }
  size_t v12 = ((*(void *)(v7 + 64)
        + *(unsigned __int8 *)(v9 + 80)
  char v13 = 8 * v12;
  if (a3 <= v11)
  {
    unsigned int v14 = 0;
  }

  else if (v12 <= 3)
  {
    unsigned int v16 = ((a3 - v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      unsigned int v14 = &dword_4;
    }

    else if (v16 >= 0x100)
    {
      unsigned int v14 = 2;
    }

    else
    {
      unsigned int v14 = v16 > 1;
    }
  }

  else
  {
    unsigned int v14 = &dword_0 + 1;
  }

  if (v11 < a2)
  {
    int v15 = ~v11 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        int v17 = v15 & ~(-1 << v13);
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }

        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v17;
        }

        else
        {
          *a1 = v17;
        }
      }
    }

    else
    {
      bzero(a1, v12);
      *(_DWORD *)a1 = v15;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X17 }

uint64_t type metadata accessor for Thumbnail(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_E84C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Thumbnail);
}

uint64_t sub_DB30(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12E64, 1LL);
}

uint64_t sub_DB40(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_12E30, 1LL);
}

void sub_DB74(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v42 = *(void *)(v4 + 64);
  uint64_t v43 = a2;
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v38 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = *(void *)(v5 + 16);
  uint64_t v7 = sub_ECB0(v5, v41, (uint64_t)&type metadata for ThumbnailImageView);
  sub_ECD0(v7);
  uint64_t v8 = sub_EC98((uint64_t)&protocol conformance descriptor for TupleView<A>);
  uint64_t v9 = sub_ECC0(v8);
  uint64_t v10 = sub_ECA0(v9);
  uint64_t v48 = sub_EC98((uint64_t)&protocol conformance descriptor for ZStack<A>);
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v10);
  uint64_t v46 = v10;
  uint64_t v47 = WitnessTable;
  uint64_t v12 = sub_EC84();
  uint64_t v40 = *(void *)(v12 - 8);
  uint64_t v37 = v12;
  __chkstk_darwin(v12);
  uint64_t v33 = (char *)&v33 - v13;
  uint64_t v14 = type metadata accessor for ModifiedContent(0LL);
  uint64_t v39 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unsigned int v16 = (char *)&v33 - v15;
  uint64_t v46 = v10;
  uint64_t v47 = WitnessTable;
  uint64_t v34 = sub_EC7C( (uint64_t)&v46,  (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>);
  uint64_t v44 = v34;
  uint64_t v45 = &protocol witness table for _AppearanceActionModifier;
  uint64_t v36 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v14);
  uint64_t v46 = v14;
  uint64_t v47 = v36;
  uint64_t v17 = sub_EC84();
  uint64_t v35 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  int v22 = (char *)&v33 - v21;
  sub_DE5C(a1);
  uint64_t v23 = v38;
  sub_ECF4(v38, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  uint64_t v24 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v25 = (v24 + 32) & ~v24;
  uint64_t v26 = swift_allocObject(&unk_154D0, v25 + v42, v24 | 7);
  uint64_t v27 = *(void *)(a1 + 24);
  *(void *)(v26 + swift_weakDestroy(v0 + 16) = v41;
  *(void *)(v26 + 24) = v27;
  sub_ECF4(v26 + v25, v23, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32));
  uint64_t v28 = v37;
  unint64_t v29 = v33;
  View.onAppear(perform:)(sub_E3BC, v26, v37, v34);
  swift_release(v26);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v29, v28);
  View.privacySensitive(_:)(0LL, v14, v36);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v14);
  uint64_t v30 = v35;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v31(v22, v20, v17);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v30 + 8);
  v32(v20, v17);
  v31(v43, v22, v17);
  v32(v22, v17);
  sub_8FB0();
}

uint64_t sub_DE5C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255LL, v3, &type metadata for ThumbnailImageView, 0LL, 0LL);
  uint64_t v5 = type metadata accessor for TupleView(255LL, TupleTypeMetadata2);
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v5);
  uint64_t v7 = type metadata accessor for ZStack(255LL, v5, WitnessTable);
  uint64_t v8 = type metadata accessor for Group(0LL, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unsigned int v11 = &v16[-v10];
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v17 = v3;
  uint64_t v18 = v12;
  uint64_t v19 = v1;
  uint64_t v13 = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v7);
  Group<A>.init(content:)(sub_E44C, v16, v7, v13);
  uint64_t v20 = v13;
  uint64_t v14 = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v8);
  View.privacySensitive(_:)(0LL, v8, v14);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_DFA4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  uint64_t v9 = type metadata accessor for ImageLoader(0LL);
  unint64_t v10 = sub_E40C();
  uint64_t v11 = StateObject.wrappedValue.getter(v6, v7, v8, v9, v10);
  uint64_t v13 = type metadata accessor for Thumbnail(0LL, a2, a3, v12);
  sub_39D8((uint64_t)a1 + *(int *)(v13 + 40));
  return swift_release(v11);
}

uint64_t sub_E038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255LL, a2, &type metadata for ThumbnailImageView, 0LL, 0LL);
  uint64_t v9 = type metadata accessor for TupleView(255LL, TupleTypeMetadata2);
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v9);
  uint64_t v11 = type metadata accessor for ZStack(0LL, v9, WitnessTable);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = &v23[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = &v23[-v17];
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v26 = a1;
  uint64_t v19 = static Alignment.center.getter(v16);
  ZStack.init(alignment:content:)(v19);
  swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v11);
  uint64_t v20 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 16);
  v20(v18, v15, v11);
  uint64_t v21 = *(void (**)(_BYTE *, uint64_t))(v12 + 8);
  v21(v15, v11);
  v20(a4, v18, v11);
  return ((uint64_t (*)(_BYTE *, uint64_t))v21)(v18, v11);
}

uint64_t sub_E198@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v28[0] = a3;
  v28[1] = a4;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v28 - v10;
  uint64_t v15 = type metadata accessor for Thumbnail(0LL, v12, v13, v14);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v11, (char *)a1 + *(int *)(v15 + 36), a2);
  uint64_t v17 = *a1;
  uint64_t v18 = a1[1];
  uint64_t v19 = *((unsigned __int8 *)a1 + 16);
  uint64_t v20 = type metadata accessor for ImageLoader(0LL);
  unint64_t v21 = sub_E40C();
  uint64_t v22 = StateObject.wrappedValue.getter(v17, v18, v19, v20, v21);
  uint64_t v23 = ObservedObject.init(wrappedValue:)(v22, v20, v21);
  uint64_t v25 = v24;
  v16(v9, v11, a2);
  uint64_t v30 = v23;
  uint64_t v31 = v25;
  v32[0] = (uint64_t)v9;
  v32[1] = (uint64_t)&v30;
  swift_retain(v25);
  v29[0] = a2;
  v29[1] = &type metadata for ThumbnailImageView;
  v28[2] = v28[0];
  v28[3] = sub_E464();
  sub_C23C(v32, 2LL, (uint64_t)v29);
  swift_release(v25);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  v26(v11, a2);
  swift_release(v31);
  return ((uint64_t (*)(char *, uint64_t))v26)(v9, a2);
}

uint64_t sub_E31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = type metadata accessor for Thumbnail(0LL, v5, *(void *)(v4 + 24), a4);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 + 32) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v8 | 7;
  uint64_t v12 = v4 + v9;
  sub_D418(*(void *)(v4 + v9), *(void *)(v4 + v9 + 8));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v12 + *(int *)(v6 + 36), v5);
  uint64_t v13 = type metadata accessor for URL(0LL);
  sub_8FC8(v13);
  return swift_deallocObject(v4, v10, v11);
}

uint64_t sub_E3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = *(void *)(v4 + 24);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Thumbnail(0LL, v5, v6, a4) - 8) + 80LL);
  return sub_DFA4((uint64_t *)(v4 + ((v7 + 32) & ~v7)), v5, v6);
}

unint64_t sub_E40C()
{
  unint64_t result = qword_18A38;
  if (!qword_18A38)
  {
    uint64_t v1 = type metadata accessor for ImageLoader(255LL);
    unint64_t result = swift_getWitnessTable(&unk_12268, v1);
    atomic_store(result, (unint64_t *)&qword_18A38);
  }

  return result;
}

uint64_t sub_E44C@<X0>(_BYTE *a1@<X8>)
{
  return sub_E038(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_E458@<X0>(uint64_t a1@<X8>)
{
  return sub_E198(*(uint64_t **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_E464()
{
  unint64_t result = qword_18A40;
  if (!qword_18A40)
  {
    unint64_t result = swift_getWitnessTable(&unk_12984, &type metadata for ThumbnailImageView);
    atomic_store(result, (unint64_t *)&qword_18A40);
  }

  return result;
}

uint64_t sub_E4A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = type metadata accessor for Image.ResizingMode(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_463C();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_42EC(&qword_18AA0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_463C();
  uint64_t v10 = v9 - v8;
  sub_ECFC();
  id v11 = (id)sub_3598();
  sub_ED04();
  if (!v11) {
    id v11 = [objc_allocWithZone(UIImage) init];
  }
  id v12 = v11;
  uint64_t v13 = Image.init(uiImage:)();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v1);
  uint64_t v14 = Image.resizable(capInsets:resizingMode:)(v5, v13, 0.0, 0.0, 0.0, 0.0);
  swift_release(v13);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  sub_ECFC();
  uint64_t v15 = (void *)sub_3598();
  sub_ED04();

  uint64_t v16 = static Animation.easeOut(duration:)(0.4);
  sub_ECFC();
  uint64_t v17 = (void *)sub_3598();
  sub_ED04();
  uint64_t v18 = sub_42EC(&qword_18AA8);
  unint64_t v19 = sub_EB14();
  View.privacySensitive(_:)(0LL, v18, v19);
  swift_release(v16);
  swift_release(v14);

  return sub_ECF4(a1, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
}

uint64_t sub_E68C@<X0>(uint64_t a1@<X8>)
{
  return sub_E4A0(a1);
}

void sub_E694()
{
  *uint64_t v0 = sub_ECE8();
  sub_466C();
}

void sub_E6B0(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  EnvironmentValues.foregroundColor.setter(v1);
  sub_466C();
}

void sub_E6D4(void *a1@<X8>)
{
  *a1 = EnvironmentValues.font.getter();
  sub_466C();
}

uint64_t sub_E6F8(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

void sub_E724()
{
  *uint64_t v0 = sub_ECE8();
  sub_466C();
}

unint64_t sub_E744()
{
  unint64_t result = qword_18A78;
  if (!qword_18A78)
  {
    uint64_t v1 = sub_41AC(&qword_18A70);
    sub_E7C8();
    sub_EBFC( &qword_18710,  &qword_18718,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18A78);
  }

  return result;
}

unint64_t sub_E7C8()
{
  unint64_t result = qword_18A80;
  if (!qword_18A80)
  {
    uint64_t v1 = sub_41AC(&qword_18A88);
    sub_EBFC( &qword_18A90,  &qword_18A98,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18A80);
  }

  return result;
}

uint64_t sub_E84C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void *initializeBufferWithCopyOfBuffer for ThumbnailImageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for ThumbnailImageView(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 8));
}

void *assignWithCopy for ThumbnailImageView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 initializeWithTake for ThumbnailImageView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ThumbnailImageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailImageView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for ThumbnailImageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 1;
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

    *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ThumbnailImageView()
{
  return &type metadata for ThumbnailImageView;
}

uint64_t sub_E9B4(uint64_t *a1)
{
  uint64_t v1 = sub_ECB0((uint64_t)a1, *a1, (uint64_t)&type metadata for ThumbnailImageView);
  sub_ECD0(v1);
  uint64_t v2 = sub_EC98((uint64_t)&protocol conformance descriptor for TupleView<A>);
  uint64_t v3 = sub_ECC0(v2);
  uint64_t v4 = sub_ECA0(v3);
  uint64_t v11 = sub_EC98((uint64_t)&protocol conformance descriptor for ZStack<A>);
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v4);
  uint64_t v9 = v4;
  uint64_t v10 = WitnessTable;
  swift_getOpaqueTypeMetadata2( 255LL,  &v9,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  0LL);
  uint64_t v6 = type metadata accessor for ModifiedContent(255LL);
  uint64_t v9 = v4;
  uint64_t v10 = WitnessTable;
  sub_EC7C((uint64_t)&v9, (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>);
  uint64_t v7 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
  uint64_t v9 = v6;
  uint64_t v10 = v7;
  return sub_EC7C( (uint64_t)&v9,  (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>);
}

void sub_EAAC()
{
  uint64_t v0 = sub_41AC(&qword_18A48);
  sub_EBFC(&qword_18A58, &qword_18A48, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v2[0] = v0;
  v2[1] = v1;
  sub_EC7C((uint64_t)v2, (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>);
  sub_ECDC();
}

uint64_t sub_EB04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12E8C, 1LL);
}

unint64_t sub_EB14()
{
  unint64_t result = qword_18AB0;
  if (!qword_18AB0)
  {
    uint64_t v1 = sub_41AC(&qword_18AA8);
    sub_EB98();
    sub_EBFC(&qword_18AC8, &qword_18AD0, (uint64_t)&protocol conformance descriptor for _AnimationModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18AB0);
  }

  return result;
}

unint64_t sub_EB98()
{
  unint64_t result = qword_18AB8;
  if (!qword_18AB8)
  {
    uint64_t v1 = sub_41AC(&qword_18AC0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_18AB8);
  }

  return result;
}

void sub_EBFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = sub_41AC(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_466C();
}

void sub_EC38()
{
  v0[0] = sub_41AC(&qword_18AA8);
  v0[1] = sub_EB14();
  sub_EC7C((uint64_t)v0, (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>);
  sub_ECDC();
}

uint64_t sub_EC7C(uint64_t a1, uint64_t a2)
{
  return swift_getOpaqueTypeConformance2(a1, a2, 1LL);
}

uint64_t sub_EC84()
{
  return swift_getOpaqueTypeMetadata2(0LL, v1 - 104, v0, 0LL);
}

uint64_t sub_EC98(uint64_t a1)
{
  return swift_getWitnessTable(a1, v1);
}

uint64_t sub_ECA0(uint64_t a1)
{
  return type metadata accessor for Group(255LL, a1);
}

uint64_t sub_ECB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getTupleTypeMetadata2(255LL, a2, a3, 0LL, 0LL);
}

uint64_t sub_ECC0(uint64_t a1)
{
  return type metadata accessor for ZStack(255LL, v1, a1);
}

uint64_t sub_ECD0(uint64_t a1)
{
  return type metadata accessor for TupleView(255LL, a1);
}

  ;
}

uint64_t sub_ECE8()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_ECF4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_ECFC()
{
  return swift_retain(v0);
}

uint64_t sub_ED04()
{
  return swift_release(v0);
}

void *initializeBufferWithCopyOfBuffer for Utterance(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for Utterance(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for Utterance(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

void *assignWithTake for Utterance(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

ValueMetadata *type metadata accessor for Utterance()
{
  return &type metadata for Utterance;
}

uint64_t sub_EDC0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_12ED0, 1LL);
}

uint64_t sub_EDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  unint64_t v3 = sub_81C8();
  swift_bridgeObjectRetain(a2);
  uint64_t v4 = Text.init<A>(_:)(&v28, &type metadata for String, v3);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9 & 1;
  uint64_t v11 = static Font.headline.getter(v4, v5);
  uint64_t v12 = Text.font(_:)(v11, v4, v6, v10, v8);
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  swift_release(v11);
  LOBYTE(v11) = v16 & 1;
  sub_8984(v4, v6, v10);
  uint64_t v19 = swift_bridgeObjectRelease(v8);
  uint64_t v20 = static Color.white.getter(v19);
  uint64_t v21 = Text.foregroundColor(_:)(v20, v12, v14, v16 & 1, v18);
  uint64_t v23 = v22;
  LOBYTE(v10) = v24;
  uint64_t v26 = v25;
  swift_release(v20);
  LOBYTE(v10) = v10 & 1;
  sub_8984(v12, v14, v11);
  swift_bridgeObjectRelease(v18);
  uint64_t v28 = v21;
  uint64_t v29 = v23;
  char v30 = v10;
  uint64_t v31 = v26;
  View.privacySensitive(_:)(0LL, &type metadata for Text, &protocol witness table for Text);
  sub_8984(v21, v23, v10);
  return swift_bridgeObjectRelease(v26);
}

uint64_t sub_EF34()
{
  return sub_EDD0(*v0, v0[1]);
}

uint64_t sub_EF3C()
{
  v1[0] = &type metadata for Text;
  v1[1] = &protocol witness table for Text;
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>,  1LL);
}

uint64_t sub_EF80()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000014LL,  0x80000000000131D0LL,  0xD000000000000011LL,  0x80000000000131F0LL);
  qword_194A0 = result;
  return result;
}

unint64_t sub_EFE4()
{
  unint64_t result = qword_18AD8;
  if (!qword_18AD8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_18AD8);
  }

  return result;
}

uint64_t sub_F020()
{
  uint64_t v1 = swift_allocObject(v0, 16LL, 7LL);
  sub_F054();
  return v1;
}

uint64_t sub_F054()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_18290 != -1) {
    swift_once(&qword_18290, sub_FE4C);
  }
  uint64_t v6 = sub_8204(v2, (uint64_t)qword_194A8);
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_0, v8, v9, "Initializing SiriVideoUIPlugin", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v1;
}

uint64_t sub_F190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v15 = (void *)VideoUIPluginConstants.Views.ContentDisambiguation.unsafeMutableAddressor(v12);
  BOOL v16 = *v15 == a1 && v15[1] == a2;
  if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v17 = type metadata accessor for JSONDecoder(0LL);
    swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
    uint64_t v18 = JSONDecoder.init()();
    unint64_t v19 = sub_FDBC();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v36,  &type metadata for DisambiguationItemsModel,  a3,  a4,  &type metadata for DisambiguationItemsModel,  v19);
    if (!v4)
    {
      swift_release(v18);
      unint64_t v20 = sub_FDF8();
      return AnyView.init<A>(_:)(&v36, &type metadata for ContentDisambiguation, v20);
    }

    swift_release(v18);
  }

  else
  {
    unint64_t v22 = sub_3418();
    uint64_t v5 = swift_allocError(&type metadata for SiriVideoUIError, v22, 0LL, 0LL);
    ((void (*)(void))swift_willThrow)();
  }

  if (qword_18290 != -1) {
    swift_once(&qword_18290, sub_FE4C);
  }
  uint64_t v23 = sub_8204(v10, (uint64_t)qword_194A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v23, v10);
  sub_FE44();
  uint64_t v24 = sub_FE44();
  uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v28 = swift_slowAlloc(32LL, -1LL);
    uint64_t v35 = v11;
    *(void *)&__int128 v36 = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    v34[1] = v27 + 4;
    uint64_t v37 = v5;
    sub_FE44();
    uint64_t v29 = sub_42EC(&qword_18B90);
    uint64_t v30 = String.init<A>(describing:)(&v37, v29);
    unint64_t v32 = v31;
    uint64_t v37 = sub_F644(v30, v31, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37);
    swift_bridgeObjectRelease(v32);
    sub_FE3C();
    sub_FE3C();
    _os_log_impl(&dword_0, v25, v26, "Error in decoding received data in func view(for:data:mode:) :%s", v27, 0xCu);
    swift_arrayDestroy(v28, 1LL);
    sub_8F70(v28);
    sub_8F70((uint64_t)v27);

    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v10);
  }

  else
  {
    sub_FE3C();
    sub_FE3C();

    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }

  return swift_willThrow(v33);
}

uint64_t sub_F49C()
{
  return static SnippetProvider.snippet(for:mode:idiom:)();
}

uint64_t sub_F4B0()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SiriVideoUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC17SiriVideoUIPlugin17SiriVideoUIPlugin);
}

unint64_t sub_F4E4()
{
  unint64_t result = qword_18B88;
  if (!qword_18B88)
  {
    uint64_t v1 = type metadata accessor for VideoDataModels(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for VideoDataModels, v1);
    atomic_store(result, (unint64_t *)&qword_18B88);
  }

  return result;
}

uint64_t sub_F524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_F190(a1, a2, a3, a4);
}

uint64_t sub_F538@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_F020();
  *a1 = result;
  return result;
}

uint64_t sub_F55C()
{
  return sub_F49C();
}

uint64_t sub_F570(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_F580(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_F5B4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_F5D4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_F644(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_F644(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_F714(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_BF58((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_BF58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_BD80(v12);
  return v7;
}

void *sub_F714(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_F868((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      uint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    uint64_t result = sub_F92C(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }

  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_F868(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_F92C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_F9C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_FB94(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_FB94((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  void v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_F9C0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    Swift::Int v4 = String.UTF8View._foreignCount()();
    if (v4) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }

  if ((a2 & 0x2000000000000000LL) != 0) {
    Swift::Int v4 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  uint64_t v5 = sub_FB30(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_FB30(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_42EC(&qword_18BA8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  void v5[2] = a1;
  void v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_FB94(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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

  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_42EC(&qword_18BA8);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_FD2C(v14, v8, v13);
    *(void *)(a4 + swift_weakDestroy(v0 + 16) = 0LL;
  }

  else
  {
    sub_FC68(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_FC68(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_FD2C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000LL) != 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }

  return __src;
}

_BYTE **sub_FDAC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_FDBC()
{
  unint64_t result = qword_18B98;
  if (!qword_18B98)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for DisambiguationItemsModel,  &type metadata for DisambiguationItemsModel);
    atomic_store(result, (unint64_t *)&qword_18B98);
  }

  return result;
}

unint64_t sub_FDF8()
{
  unint64_t result = qword_18BA0;
  if (!qword_18BA0)
  {
    unint64_t result = swift_getWitnessTable("!-", &type metadata for ContentDisambiguation);
    atomic_store(result, (unint64_t *)&qword_18BA0);
  }

  return result;
}

uint64_t sub_FE3C()
{
  return swift_errorRelease(v0);
}

uint64_t sub_FE44()
{
  return swift_errorRetain(v0);
}

uint64_t sub_FE4C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_FECC(v0, qword_194A8);
  sub_8204(v0, (uint64_t)qword_194A8);
  if (qword_18288 != -1) {
    swift_once(&qword_18288, sub_EF80);
  }
  return Logger.init(_:)((id)qword_194A0);
}

uint64_t *sub_FECC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}
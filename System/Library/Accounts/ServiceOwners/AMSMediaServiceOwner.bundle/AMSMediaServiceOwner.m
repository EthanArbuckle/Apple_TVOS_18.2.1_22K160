void sub_38FC()
{
  sub_3968( &qword_18700,  (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceOperationUIPermissions,  (uint64_t)&unk_1112C);
}

void type metadata accessor for AIDAServiceOperationUIPermissions(uint64_t a1)
{
}

void sub_393C()
{
}

void sub_3968(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_40C8();
}

void type metadata accessor for AIDAServiceType(uint64_t a1)
{
}

void sub_39B8()
{
}

uint64_t sub_39D8(uint64_t a1)
{
  return sub_39E0(a1, *v1);
}

uint64_t sub_39E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_3A20(uint64_t a1)
{
  return sub_3A28(a1, *v1);
}

Swift::Int sub_3A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

void sub_3A98()
{
}

void sub_3AB8(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  a2(v3);
  sub_40B0();
  sub_40C8();
}

uint64_t sub_3AE8(uint64_t a1, id *a2)
{
  return sub_3FA8(a1, a2);
}

uint64_t sub_3AFC(uint64_t a1, id *a2)
{
  return sub_400C(a1, a2) & 1;
}

void sub_3B14(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v3;
}

BOOL sub_3B38(uint64_t *a1, uint64_t *a2)
{
  return sub_3B44(*a1, *a2);
}

BOOL sub_3B44(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_3B50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v3 == v6 && v5 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }
  swift_bridgeObjectRelease(v5);
  sub_40B0();
  return v9 & 1;
}

uint64_t sub_3BD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_3C00(uint64_t *a1, uint64_t *a2)
{
  return sub_3B50(*a1, *a2);
}

void sub_3C0C(uint64_t a1@<X8>)
{
  *(void *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

  ;
}

uint64_t sub_3C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_3C70(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_3968( &qword_18788,  (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType,  (uint64_t)&unk_10E54);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

void sub_3CF4()
{
}

void sub_3D20()
{
}

void sub_3D4C()
{
}

void type metadata accessor for AMSAccountMediaType(uint64_t a1)
{
}

void sub_3D8C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_3DD0@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = sub_40B0();
  *a1 = v2;
  return result;
}

uint64_t sub_3E10(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_3968( &qword_187B8,  (uint64_t (*)(uint64_t))type metadata accessor for AMSAccountMediaType,  (uint64_t)&unk_1103C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

void sub_3E94()
{
}

void sub_3EC0()
{
}

uint64_t sub_3EEC(uint64_t *a1, uint64_t *a2)
{
  return sub_3F24(*a1, *a2);
}

void sub_3EF8()
{
}

uint64_t sub_3F24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_3FA8(uint64_t a1, id *a2)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(v3, &v6);
  if (v7)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    uint64_t result = sub_40B0();
  }

  else
  {
    NSString v5 = 0LL;
  }

  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_400C(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(v3, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *uint64_t v2 = v6;
  return v4 & 1;
}

void sub_407C(uint64_t a1)
{
  uint64_t v2 = v1;
  String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  sub_40C8();
}

uint64_t sub_40B0()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_40B8(uint64_t a1, id *a2)
{
}

  ;
}

unint64_t sub_40D0(uint64_t a1)
{
  unint64_t result = sub_40F4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_40F4()
{
  unint64_t result = qword_18820;
  if (!qword_18820)
  {
    type metadata accessor for AIDAServiceOperationUIPermissions(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10F6C, v1);
    atomic_store(result, (unint64_t *)&qword_18820);
  }

  return result;
}

uint64_t sub_4134(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_4180((unint64_t *)&qword_18780, (uint64_t)&unk_10F2C);
  uint64_t result = sub_4180(&qword_18768, (uint64_t)&unk_10EF4);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_4180(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AIDAServiceType(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

void AMSMediaServiceOwner.__allocating_init(accountStore:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  AMSMediaServiceOwner.init(accountStore:)(a1);
  sub_40C8();
}

id AMSMediaServiceOwner.init(accountStore:)(void *a1)
{
  char v4 = (char *)sub_FE98();
  char v5 = sub_4278();
  NSString v6 = &v4[OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner];
  *(void *)NSString v6 = a1;
  *((void *)v6 + 1) = sub_42A4;
  *((void *)v6 + 2) = 0LL;
  v6[24] = v5 & 1;
  id v7 = a1;
  sub_FEE8();
  v10.receiver = v4;
  v10.super_class = v2;
  id v8 = objc_msgSendSuper2(&v10, "init");

  return v8;
}

uint64_t sub_4278()
{
  return [(id)objc_opt_self(AMSDevice) deviceIsAudioAccessory] ^ 1;
}

id sub_42A4@<X0>(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  id v6 = objc_allocWithZone(&OBJC_CLASS___AMSAuthenticateTask);
  swift_bridgeObjectRetain(a1);
  id v7 = a2;
  id result = sub_D94C(a1, a2);
  *a3 = result;
  return result;
}

id AMSMediaServiceOwner.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void AMSMediaServiceOwner.init()()
{
}

id AMSMediaServiceOwner.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_4430()
{
  uint64_t v26 = type metadata accessor for Log(0LL);
  uint64_t v0 = *(void *)(v26 - 8);
  __chkstk_darwin();
  objc_super v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_BEE8((void (*)(char *, unint64_t))"supportedServices", 0x11uLL, 2, 0LL);
  uint64_t v3 = sub_9F94(&qword_18B20);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_11170;
  char v5 = (void *)AIDAServiceTypeStore;
  *(void *)(v4 + 32) = AIDAServiceTypeStore;
  id v6 = v5;
  static Log.mediaServiceOwner.getter(v6, v7, v8, v9, v10, v11, v12, v13, v25, v26, v27, v28);
  uint64_t v14 = sub_9F94(&qword_18978);
  uint64_t v15 = *(void *)(type metadata accessor for LogInterpolation(0LL) - 8);
  uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))
        + 4LL * *(void *)(v15 + 72),
          *(unsigned __int8 *)(v15 + 80) | 7LL);
  *(_OWORD *)(v16 + 16) = xmmword_11180;
  uint64_t v17 = sub_9F94(&qword_18980);
  id v18 = (id)AMSSetLogKeyIfNeeded();
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  uint64_t v21 = v20;

  static LogInterpolation.prefix<A>(_:_:)(v17, v19, v21, v17);
  swift_bridgeObjectRelease(v21);
  v34 = &type metadata for String;
  v33[0] = 0xD000000000000011LL;
  v33[1] = 0x8000000000012530LL;
  static LogInterpolation.traceableSensitive(_:)(v33);
  sub_E760((uint64_t)v33, &qword_18988);
  LogInterpolation.init(stringLiteral:)(0x6E696E7275746552LL, 0xEA00000000003A67LL);
  uint64_t v27 = sub_EC6C(0LL, &qword_18968, &OBJC_CLASS___ACAccountStore_ptr);
  uint64_t v28 = sub_EC6C(0LL, &qword_18948, &OBJC_CLASS___AIDAServiceContext_ptr);
  uint64_t v29 = sub_EC6C(0LL, &qword_18B08, &OBJC_CLASS___AMSAuthenticateTask_ptr);
  v30 = &protocol witness table for ACAccountStore;
  unint64_t v31 = sub_ED08();
  v32 = &protocol witness table for AMSAuthenticateTask;
  uint64_t KeyPath = swift_getKeyPath(&unk_111D8, &v27);
  v23 = sub_D834(v4, KeyPath);
  v34 = (void *)sub_9F94(&qword_18B30);
  v33[0] = v23;
  static LogInterpolation.traceableSensitive(_:)(v33);
  sub_E760((uint64_t)v33, &qword_18988);
  Log.debug(_:)(v16);
  swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v26);
  sub_BD20((uint64_t)"supportedServices", 0x11uLL, 2);
  return v4;
}

ACAccount_optional __swiftcall AMSMediaServiceOwner.account(forService:)(__C::AIDAServiceType forService)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner + 8);
  uint64_t v6 = *(void *)(v3 + 16);
  int v7 = *(unsigned __int8 *)(v3 + 24);
  id v8 = v4;
  sub_F54C();
  uint64_t v9 = (objc_class *)sub_4780((uint64_t)forService._rawValue, v8, v5, v6, v7);
  sub_FDE4((uint64_t)v9, v10);

  uint64_t v12 = v9;
  result.value.super.isa = v12;
  result.is_nil = v11;
  return result;
}

void *sub_4780(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  LODWORD(v127) = a5;
  uint64_t v128 = type metadata accessor for Log(0LL);
  uint64_t v116 = *(void *)(v128 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v120 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  v114 = (char *)&v112 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v112 - v14;
  __chkstk_darwin(v13);
  v115 = (char *)&v112 - v16;
  v134 = a2;
  uint64_t v17 = sub_9F94(&qword_18940);
  uint64_t inited = swift_initStackObject(v17, v133);
  __int128 v126 = xmmword_11170;
  *(_OWORD *)(inited + 16) = xmmword_11170;
  *(void *)(inited + 32) = 0x5465636976726573LL;
  *(void *)(inited + 40) = 0xEB00000000657079LL;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  *(void *)(inited + 56) = v19;
  uint64_t v20 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_BEE8((void (*)(char *, unint64_t))"account(forService:)", 0x14uLL, 2, v20);
  swift_bridgeObjectRelease(v20);
  uint64_t v21 = sub_9F94(&qword_189D8);
  uint64_t v22 = swift_initStackObject(v21, v132);
  *(_OWORD *)(v22 + 16) = v126;
  v23 = (void *)AMSAccountMediaTypeProduction;
  *(void *)(v22 + 32) = AMSAccountMediaTypeProduction;
  id v117 = v23;
  static Log.mediaServiceOwner.getter(v117, v24, v25, v26, v27, v28, v29, v30, v112, v113, v114, v115);
  uint64_t v31 = sub_9F94(&qword_18978);
  uint64_t v32 = *(void *)(type metadata accessor for LogInterpolation(0LL) - 8);
  uint64_t v33 = *(void *)(v32 + 72);
  uint64_t v34 = *(unsigned __int8 *)(v32 + 80);
  uint64_t v35 = (v34 + 32) & ~v34;
  uint64_t v36 = v33;
  uint64_t v113 = 3 * v33;
  uint64_t v123 = v31;
  uint64_t v119 = v35 + 3 * v33;
  uint64_t v122 = v34 | 7;
  uint64_t v37 = swift_allocObject(v31, v119, v34 | 7);
  __int128 v118 = xmmword_11190;
  *(_OWORD *)(v37 + 16) = xmmword_11190;
  uint64_t v124 = v35;
  uint64_t v121 = sub_9F94(&qword_18980);
  v131 = (void *)v121;
  uint64_t v38 = swift_allocObject(&unk_148F8, 41LL, 7LL);
  unint64_t v129 = v38;
  *(void *)(v38 + 16) = a2;
  *(void *)(v38 + 24) = a3;
  uint64_t v39 = a3;
  *(void *)(v38 + 32) = a4;
  int v125 = v127 & 1;
  *(_BYTE *)(v38 + 40) = v127;
  uint64_t v127 = a4;
  swift_retain(a4);
  id v40 = (id)AMSLogKey(a2);
  if (v40)
  {
    v41 = v40;
    uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
    uint64_t v44 = v43;
  }

  else
  {
    uint64_t v42 = 0LL;
    uint64_t v44 = 0LL;
  }

  uint64_t v45 = v39;
  uint64_t v46 = v36;
  id v47 = v117;
  static LogInterpolation.prefix(_:_:)(&v129, v42, v44);
  swift_bridgeObjectRelease(v44);
  sub_E740(&v129);
  LogInterpolation.init(stringLiteral:)(0xD000000000000012LL, 0x8000000000012CF0LL);
  *(void *)&__int128 v126 = 2 * v46;
  uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
  v131 = &type metadata for String;
  unint64_t v129 = v48;
  unint64_t v130 = v49;
  static LogInterpolation.safe(_:)(&v129);
  sub_E760((uint64_t)&v129, &qword_18988);
  Log.debug(_:)(v37);
  swift_bridgeObjectRelease(v37);
  v50 = *(void (**)(char *, uint64_t))(v116 + 8);
  uint64_t v51 = v128;
  v50(v15, v128);
  uint64_t v52 = sub_EC6C(0LL, &qword_18968, &OBJC_CLASS___ACAccountStore_ptr);
  v53 = SynchronousAccountStoreProtocol.activeiTunesAccount(for:)( &v129,  v47,  v52,  &protocol witness table for ACAccountStore);
  v70 = (void *)v129;
  if (v129)
  {
    swift_setDeallocating(v22);
    uint64_t v71 = sub_DE40();
    static Log.mediaServiceOwner.getter(v71, v72, v73, v74, v75, v76, v77, v78, v112, v113, v114, v115);
    uint64_t v79 = swift_allocObject(v123, v124 + 4 * v46, v122);
    *(_OWORD *)(v79 + 16) = xmmword_11180;
    v131 = (void *)v121;
    uint64_t v80 = swift_allocObject(&unk_148F8, 41LL, 7LL);
    unint64_t v129 = v80;
    v81 = v134;
    *(void *)(v80 + 16) = v134;
    *(void *)(v80 + 24) = v45;
    uint64_t v82 = v127;
    *(void *)(v80 + 32) = v127;
    *(_BYTE *)(v80 + 40) = v125;
    swift_retain(v82);
    id v83 = (id)AMSLogKey(v81);
    if (v83)
    {
      v84 = v83;
      uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
      uint64_t v87 = v86;
    }

    else
    {
      uint64_t v85 = 0LL;
      uint64_t v87 = 0LL;
    }

    static LogInterpolation.prefix(_:_:)(&v129, v85, v87);
    swift_bridgeObjectRelease(v87);
    sub_E740(&v129);
    v131 = &type metadata for String;
    unint64_t v129 = 0xD000000000000014LL;
    unint64_t v130 = 0x8000000000012CD0LL;
    static LogInterpolation.traceableSensitive(_:)(&v129);
    sub_E760((uint64_t)&v129, &qword_18988);
    LogInterpolation.init(stringLiteral:)(0xD000000000000019LL, 0x8000000000012D90LL);
    v131 = (void *)sub_EC6C(0LL, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
    unint64_t v129 = (unint64_t)v70;
    id v110 = v70;
    static LogInterpolation.traceableSensitive(_:)(&v129);
    sub_E760((uint64_t)&v129, &qword_18988);
    v92 = v114;
    Log.debug(_:)(v79);
  }

  else
  {
    static Log.mediaServiceOwner.getter(v53, v54, v55, v56, v57, v58, v59, v60, v112, v113, v114, v115);
    uint64_t v61 = swift_allocObject(v123, v119, v122);
    *(_OWORD *)(v61 + 16) = v118;
    v131 = (void *)v121;
    uint64_t v62 = swift_allocObject(&unk_148F8, 41LL, 7LL);
    unint64_t v129 = v62;
    v63 = v134;
    *(void *)(v62 + 16) = v134;
    *(void *)(v62 + 24) = v45;
    uint64_t v64 = v127;
    *(void *)(v62 + 32) = v127;
    *(_BYTE *)(v62 + 40) = v125;
    swift_retain(v64);
    id v65 = (id)AMSLogKey(v63);
    if (v65)
    {
      v66 = v65;
      uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
      uint64_t v69 = v68;
    }

    else
    {
      uint64_t v67 = 0LL;
      uint64_t v69 = 0LL;
    }

    static LogInterpolation.prefix(_:_:)(&v129, v67, v69);
    swift_bridgeObjectRelease(v69);
    sub_E740(&v129);
    LogInterpolation.init(stringLiteral:)(0xD00000000000002ELL, 0x8000000000012D10LL);
    type metadata accessor for AMSAccountMediaType(0LL);
    v131 = v88;
    unint64_t v129 = (unint64_t)v47;
    id v89 = v47;
    static LogInterpolation.traceableSensitive(_:)(&v129);
    sub_E760((uint64_t)&v129, &qword_18988);
    v90 = v120;
    Log.debug(_:)(v61);

    swift_bridgeObjectRelease(v61);
    uint64_t v51 = v128;
    v50(v90, v128);
    swift_setDeallocating(v22);
    uint64_t v91 = sub_DE40();
    v92 = v115;
    static Log.mediaServiceOwner.getter(v91, v93, v94, v95, v96, v97, v98, v99, v112, v113, v114, v115);
    uint64_t v79 = swift_allocObject(v123, v119, v122);
    *(_OWORD *)(v79 + 16) = v118;
    v131 = (void *)v121;
    uint64_t v100 = swift_allocObject(&unk_148F8, 41LL, 7LL);
    unint64_t v129 = v100;
    v101 = v134;
    *(void *)(v100 + 16) = v134;
    *(void *)(v100 + 24) = v45;
    uint64_t v102 = v127;
    *(void *)(v100 + 32) = v127;
    *(_BYTE *)(v100 + 40) = v125;
    id v103 = v101;
    uint64_t v104 = swift_retain(v102);
    id v105 = (id)AMSLogKey(v104);
    if (v105)
    {
      v106 = v105;
      uint64_t v107 = static String._unconditionallyBridgeFromObjectiveC(_:)(v105);
      uint64_t v109 = v108;
    }

    else
    {
      uint64_t v107 = 0LL;
      uint64_t v109 = 0LL;
    }

    static LogInterpolation.prefix(_:_:)(&v129, v107, v109);
    swift_bridgeObjectRelease(v109);
    sub_E740(&v129);
    v131 = &type metadata for String;
    unint64_t v129 = 0xD000000000000014LL;
    unint64_t v130 = 0x8000000000012CD0LL;
    static LogInterpolation.traceableSensitive(_:)(&v129);
    sub_E760((uint64_t)&v129, &qword_18988);
    LogInterpolation.init(stringLiteral:)(0xD000000000000041LL, 0x8000000000012D40LL);
    Log.debug(_:)(v79);
    v70 = 0LL;
  }

  swift_bridgeObjectRelease(v79);
  v50(v92, v51);
  sub_BD20((uint64_t)"account(forService:)", 0x14uLL, 2);
  return v70;
}

Swift::String_optional __swiftcall AMSMediaServiceOwner.altDSID(for:service:)( ACAccount a1, __C::AIDAServiceType service)
{
  uint64_t v2 = sub_5668( (uint64_t)a1.super.isa,  (uint64_t)service._rawValue,  (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t))sub_50F8);
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

void *sub_50F8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  HIDWORD(v68) = a6;
  uint64_t v67 = a4;
  uint64_t v10 = type metadata accessor for Log(0LL);
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v66 - v14;
  uint64_t v74 = a1;
  uint64_t v16 = sub_9F94(&qword_18940);
  uint64_t inited = swift_initStackObject(v16, v73);
  *(_OWORD *)(inited + 16) = xmmword_111A0;
  *(void *)(inited + 32) = 0x746E756F636361LL;
  *(void *)(inited + 40) = 0xE700000000000000LL;
  uint64_t v18 = sub_EC6C(0LL, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 72) = v18;
  *(void *)(inited + 80) = 0x5465636976726573LL;
  *(void *)(inited + 88) = 0xEB00000000657079LL;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  *(void *)(inited + 104) = v19;
  id v20 = a1;
  uint64_t v21 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_BEE8((void (*)(char *, unint64_t))"altDSID(for:service:)", 0x15uLL, 2, v21);
  swift_bridgeObjectRelease(v21);
  Swift::String_optional result = dispatch thunk of AccountProtocol.accountType.getter(&v70, v18, &protocol witness table for ACAccount);
  if (v70)
  {
    uint64_t v66 = v10;

    uint64_t v23 = dispatch thunk of AccountProtocol.altDSID.getter(v18, &protocol witness table for ACAccount);
    unint64_t v31 = v24;
    if (v24)
    {
      uint64_t v32 = (void *)v23;
      uint64_t v33 = swift_bridgeObjectRetain(v24);
      static Log.mediaServiceOwner.getter(v33, v34, v35, v36, v37, v38, v39, v40, v66, v67, v68, v69);
      uint64_t v41 = sub_9F94(&qword_18978);
      uint64_t v42 = type metadata accessor for LogInterpolation(0LL);
      uint64_t v43 = swift_allocObject( v41,  ((*(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL))
            + 4LL * *(void *)(*(void *)(v42 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v43 + 16) = xmmword_11180;
      uint64_t v72 = (void *)sub_9F94(&qword_18980);
      uint64_t v44 = swift_allocObject(&unk_148F8, 41LL, 7LL);
      id v70 = (id)v44;
      uint64_t v45 = v67;
      *(void *)(v44 + 16) = a3;
      *(void *)(v44 + 24) = v45;
      *(void *)(v44 + 32) = a5;
      *(_BYTE *)(v44 + 40) = BYTE4(v68) & 1;
      id v46 = a3;
      uint64_t v47 = swift_retain(a5);
      id v48 = (id)AMSLogKey(v47);
      if (v48)
      {
        unint64_t v49 = v48;
        uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
        uint64_t v52 = v51;
      }

      else
      {
        uint64_t v50 = 0LL;
        uint64_t v52 = 0LL;
      }

      uint64_t v64 = v69;
      static LogInterpolation.prefix(_:_:)(&v70, v50, v52);
      swift_bridgeObjectRelease(v52);
      sub_E740(&v70);
      uint64_t v72 = &type metadata for String;
      id v70 = (id)0xD000000000000015LL;
      unint64_t v71 = 0x8000000000012C60LL;
      static LogInterpolation.traceableSensitive(_:)(&v70);
      sub_E760((uint64_t)&v70, &qword_18988);
      LogInterpolation.init(stringLiteral:)(0xD000000000000012LL, 0x8000000000012CB0LL);
      uint64_t v72 = &type metadata for String;
      id v70 = v32;
      unint64_t v71 = v31;
      static LogInterpolation.traceableSensitive(_:)(&v70);
      sub_E760((uint64_t)&v70, &qword_18988);
      Log.debug(_:)(v43);
      uint64_t v65 = v66;
    }

    else
    {
      static Log.mediaServiceOwner.getter(v23, 0LL, v25, v26, v27, v28, v29, v30, v66, v67, v68, v69);
      uint64_t v53 = sub_9F94(&qword_18978);
      uint64_t v54 = type metadata accessor for LogInterpolation(0LL);
      uint64_t v43 = swift_allocObject( v53,  ((*(unsigned __int8 *)(*(void *)(v54 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v54 - 8) + 80LL))
            + 3LL * *(void *)(*(void *)(v54 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v54 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v43 + 16) = xmmword_11190;
      uint64_t v72 = (void *)sub_9F94(&qword_18980);
      uint64_t v55 = swift_allocObject(&unk_148F8, 41LL, 7LL);
      id v70 = (id)v55;
      uint64_t v56 = v67;
      *(void *)(v55 + 16) = a3;
      *(void *)(v55 + 24) = v56;
      *(void *)(v55 + 32) = a5;
      *(_BYTE *)(v55 + 40) = BYTE4(v68) & 1;
      id v57 = a3;
      uint64_t v58 = swift_retain(a5);
      id v59 = (id)AMSLogKey(v58);
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
        uint64_t v63 = v62;
      }

      else
      {
        uint64_t v61 = 0LL;
        uint64_t v63 = 0LL;
      }

      uint64_t v65 = v66;
      uint64_t v64 = v69;
      static LogInterpolation.prefix(_:_:)(&v70, v61, v63);
      swift_bridgeObjectRelease(v63);
      sub_E740(&v70);
      uint64_t v72 = &type metadata for String;
      id v70 = (id)0xD000000000000015LL;
      unint64_t v71 = 0x8000000000012C60LL;
      static LogInterpolation.traceableSensitive(_:)(&v70);
      sub_E760((uint64_t)&v70, &qword_18988);
      LogInterpolation.init(stringLiteral:)(0xD000000000000020LL, 0x8000000000012C80LL);
      Log.debug(_:)(v43);
      uint64_t v32 = 0LL;
      uint64_t v15 = v13;
    }

    swift_bridgeObjectRelease(v43);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v15, v65);
    sub_BD20((uint64_t)"altDSID(for:service:)", 0x15uLL, 2);
    return v32;
  }

  else
  {
    __break(1u);
  }

  return result;
}

Swift::String_optional __swiftcall AMSMediaServiceOwner.dsid(for:service:)(ACAccount a1, __C::AIDAServiceType service)
{
  uint64_t v2 = sub_5668( (uint64_t)a1.super.isa,  (uint64_t)service._rawValue,  (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t))sub_56EC);
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_5668( uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t))
{
  id v9 = sub_F9E0(OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  sub_F364();
  a3(a1, a2, v9, v3, v4, v5);
  swift_release(v4, v10);

  return sub_FEC0();
}

void *sub_56EC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  HIDWORD(v59) = a6;
  uint64_t v58 = a4;
  uint64_t v10 = type metadata accessor for Log(0LL);
  uint64_t v60 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v57 - v14;
  uint64_t v65 = a1;
  uint64_t v16 = sub_9F94(&qword_18940);
  uint64_t inited = swift_initStackObject(v16, v64);
  *(_OWORD *)(inited + 16) = xmmword_111A0;
  *(void *)(inited + 32) = 0x746E756F636361LL;
  *(void *)(inited + 40) = 0xE700000000000000LL;
  uint64_t v18 = sub_EC6C(0LL, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 72) = v18;
  *(void *)(inited + 80) = 0x5465636976726573LL;
  *(void *)(inited + 88) = 0xEB00000000657079LL;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  *(void *)(inited + 104) = v19;
  id v20 = a1;
  uint64_t v21 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_BEE8((void (*)(char *, unint64_t))"dsid(for:service:)", 0x12uLL, 2, v21);
  swift_bridgeObjectRelease(v21);
  Swift::String_optional result = dispatch thunk of AccountProtocol.accountType.getter(&v61, v18, &protocol witness table for ACAccount);
  if (v61)
  {
    uint64_t v57 = v10;

    uint64_t v23 = dispatch thunk of AccountProtocol.dsid.getter(v18, &protocol witness table for ACAccount);
    if ((v24 & 1) != 0)
    {
      static Log.mediaServiceOwner.getter(v23, v24, v25, v26, v27, v28, v29, v30, v57, v58, v59, v60);
      uint64_t v44 = sub_9F94(&qword_18978);
      uint64_t v45 = type metadata accessor for LogInterpolation(0LL);
      uint64_t v46 = swift_allocObject( v44,  ((*(unsigned __int8 *)(*(void *)(v45 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v45 - 8) + 80LL))
            + 3LL * *(void *)(*(void *)(v45 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v45 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v46 + 16) = xmmword_11190;
      uint64_t v63 = (void *)sub_9F94(&qword_18980);
      uint64_t v47 = swift_allocObject(&unk_148F8, 41LL, 7LL);
      id v61 = (id)v47;
      uint64_t v48 = v58;
      *(void *)(v47 + 16) = a3;
      *(void *)(v47 + 24) = v48;
      *(void *)(v47 + 32) = a5;
      *(_BYTE *)(v47 + 40) = BYTE4(v59) & 1;
      id v49 = a3;
      uint64_t v50 = swift_retain(a5);
      id v51 = (id)AMSLogKey(v50);
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
        uint64_t v55 = v54;
      }

      else
      {
        uint64_t v53 = 0LL;
        uint64_t v55 = 0LL;
      }

      static LogInterpolation.prefix(_:_:)(&v61, v53, v55);
      swift_bridgeObjectRelease(v55);
      sub_E740(&v61);
      uint64_t v63 = &type metadata for String;
      id v61 = (id)0xD000000000000012LL;
      unint64_t v62 = 0x8000000000012C20LL;
      static LogInterpolation.traceableSensitive(_:)(&v61);
      sub_E760((uint64_t)&v61, &qword_18988);
      LogInterpolation.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000000012C40LL);
      Log.debug(_:)(v46);
      swift_bridgeObjectRelease(v46);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v13, v57);
      uint64_t v56 = 0LL;
    }

    else
    {
      unint64_t v31 = (void *)v23;
      static Log.mediaServiceOwner.getter(v23, v24, v25, v26, v27, v28, v29, v30, v57, v58, v59, v60);
      uint64_t v32 = sub_9F94(&qword_18978);
      uint64_t v33 = type metadata accessor for LogInterpolation(0LL);
      uint64_t v34 = swift_allocObject( v32,  ((*(unsigned __int8 *)(*(void *)(v33 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v33 - 8) + 80LL))
            + 4LL * *(void *)(*(void *)(v33 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v33 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v34 + 16) = xmmword_11180;
      uint64_t v63 = (void *)sub_9F94(&qword_18980);
      uint64_t v35 = swift_allocObject(&unk_148F8, 41LL, 7LL);
      id v61 = (id)v35;
      uint64_t v36 = v58;
      *(void *)(v35 + 16) = a3;
      *(void *)(v35 + 24) = v36;
      *(void *)(v35 + 32) = a5;
      *(_BYTE *)(v35 + 40) = BYTE4(v59) & 1;
      id v37 = a3;
      uint64_t v38 = swift_retain(a5);
      id v39 = (id)AMSLogKey(v38);
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
        uint64_t v43 = v42;
      }

      else
      {
        uint64_t v41 = 0LL;
        uint64_t v43 = 0LL;
      }

      static LogInterpolation.prefix(_:_:)(&v61, v41, v43);
      swift_bridgeObjectRelease(v43);
      sub_E740(&v61);
      uint64_t v63 = &type metadata for String;
      id v61 = (id)0xD000000000000012LL;
      unint64_t v62 = 0x8000000000012C20LL;
      static LogInterpolation.traceableSensitive(_:)(&v61);
      sub_E760((uint64_t)&v61, &qword_18988);
      LogInterpolation.init(stringLiteral:)(0x6E696E7275746552LL, 0xEF3A444953442067LL);
      uint64_t v63 = &type metadata for Int64;
      id v61 = v31;
      static LogInterpolation.traceableSensitive(_:)(&v61);
      sub_E760((uint64_t)&v61, &qword_18988);
      Log.debug(_:)(v34);
      swift_bridgeObjectRelease(v34);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v15, v57);
      id v61 = v31;
      uint64_t v56 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
    }

    sub_BD20((uint64_t)"dsid(for:service:)", 0x12uLL, 2);
    return (void *)v56;
  }

  else
  {
    __break(1u);
  }

  return result;
}

id sub_5C7C(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id, id))
{
  id v7 = a3;
  id v8 = a1;
  id v9 = sub_FE98();
  a5(v7, v9);
  uint64_t v11 = v10;

  if (v11)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    sub_EDA8();
  }

  else
  {
    NSString v12 = 0LL;
  }

  return v12;
}

void AMSMediaServiceOwner.nameComponents(for:service:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v10 = sub_F9E0(OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  sub_F364();
  sub_5D88(a1, a2, v10, v3, v4, v5, a3);
  swift_release(v4, v9);
}

void *sub_5D88@<X0>( void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v90 = a6;
  uint64_t v89 = a4;
  uint64_t v91 = a7;
  uint64_t v11 = type metadata accessor for Log(0LL);
  uint64_t v88 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v86 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v86 - v14;
  uint64_t v16 = sub_9F94(&qword_18938);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v96 = a1;
  uint64_t v19 = sub_9F94(&qword_18940);
  uint64_t inited = swift_initStackObject(v19, v95);
  *(_OWORD *)(inited + 16) = xmmword_111A0;
  *(void *)(inited + 32) = 0x746E756F636361LL;
  *(void *)(inited + 40) = 0xE700000000000000LL;
  uint64_t v21 = sub_EC6C(0LL, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 72) = v21;
  *(void *)(inited + 80) = 0x5465636976726573LL;
  *(void *)(inited + 88) = 0xEB00000000657079LL;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  *(void *)(inited + 104) = v22;
  id v23 = a1;
  uint64_t v24 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_BEE8((void (*)(char *, unint64_t))"nameComponents(for:service:)", 0x1CuLL, 2, v24);
  swift_bridgeObjectRelease(v24);
  Swift::String_optional result = dispatch thunk of AccountProtocol.accountType.getter(&v92, v21, &protocol witness table for ACAccount);
  if (v92)
  {

    dispatch thunk of AccountProtocol.firstName.getter(v21, &protocol witness table for ACAccount);
    uint64_t v27 = v26;
    dispatch thunk of AccountProtocol.lastName.getter(v21, &protocol witness table for ACAccount);
    uint64_t v29 = v28;
    uint64_t v30 = swift_bridgeObjectRelease(v28);
    uint64_t v87 = v11;
    if (v27)
    {
      swift_bridgeObjectRelease(v27);
    }

    else if (!v29)
    {
      unint64_t v71 = v86;
      static Log.mediaServiceOwner.getter(v30, v31, v32, v33, v34, v35, v36, v37, v86, v87, v88, v89);
      uint64_t v72 = sub_9F94(&qword_18978);
      uint64_t v73 = type metadata accessor for LogInterpolation(0LL);
      uint64_t v74 = swift_allocObject( v72,  ((*(unsigned __int8 *)(*(void *)(v73 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v73 - 8) + 80LL))
            + 3LL * *(void *)(*(void *)(v73 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v73 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v74 + 16) = xmmword_11190;
      uint64_t v94 = &type metadata for String;
      id v92 = (id)0xD00000000000001CLL;
      unint64_t v93 = 0x8000000000012BC0LL;
      static LogInterpolation.traceableSensitive(_:)(&v92);
      sub_E760((uint64_t)&v92, &qword_18988);
      uint64_t v94 = (void *)sub_9F94(&qword_18980);
      uint64_t v75 = swift_allocObject(&unk_148F8, 41LL, 7LL);
      id v92 = (id)v75;
      uint64_t v76 = v89;
      *(void *)(v75 + 16) = a3;
      *(void *)(v75 + 24) = v76;
      *(void *)(v75 + 32) = a5;
      *(_BYTE *)(v75 + 40) = v90 & 1;
      id v77 = a3;
      uint64_t v78 = swift_retain(a5);
      id v79 = (id)AMSLogKey(v78);
      uint64_t v80 = v88;
      if (v79)
      {
        v81 = v79;
        uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
        uint64_t v84 = v83;
      }

      else
      {
        uint64_t v82 = 0LL;
        uint64_t v84 = 0LL;
      }

      uint64_t v85 = v87;
      static LogInterpolation.prefix(_:_:)(&v92, v82, v84);
      swift_bridgeObjectRelease(v84);
      sub_E740(&v92);
      LogInterpolation.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000000012BE0LL);
      Log.debug(_:)(v74);
      swift_bridgeObjectRelease(v74);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v71, v85);
      uint64_t v70 = type metadata accessor for PersonNameComponents(0LL);
      uint64_t v68 = v91;
      uint64_t v69 = 1LL;
      goto LABEL_9;
    }

    uint64_t v38 = dispatch thunk of AccountProtocol.firstName.getter(v21, &protocol witness table for ACAccount);
    uint64_t v40 = v39;
    uint64_t v41 = dispatch thunk of AccountProtocol.lastName.getter(v21, &protocol witness table for ACAccount);
    uint64_t v43 = v42;
    uint64_t v44 = type metadata accessor for PersonNameComponents(0LL);
    sub_9FD4((uint64_t)v18, 1LL, 1LL, v44);
    uint64_t v45 = PersonNameComponents.init(namePrefix:givenName:middleName:familyName:nameSuffix:nickname:phoneticRepresentation:)( 0LL,  0LL,  v38,  v40,  0LL,  0LL,  v41,  v43,  0LL,  0LL,  0LL,  0LL,  v18);
    static Log.mediaServiceOwner.getter(v45, v46, v47, v48, v49, v50, v51, v52, v86, v87, v88, v89);
    uint64_t v53 = sub_9F94(&qword_18978);
    uint64_t v54 = type metadata accessor for LogInterpolation(0LL);
    uint64_t v55 = swift_allocObject( v53,  ((*(unsigned __int8 *)(*(void *)(v54 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v54 - 8) + 80LL))
          + 4LL * *(void *)(*(void *)(v54 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v54 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v55 + 16) = xmmword_11180;
    uint64_t v94 = (void *)sub_9F94(&qword_18980);
    uint64_t v56 = swift_allocObject(&unk_148F8, 41LL, 7LL);
    id v92 = (id)v56;
    uint64_t v57 = v89;
    *(void *)(v56 + 16) = a3;
    *(void *)(v56 + 24) = v57;
    *(void *)(v56 + 32) = a5;
    *(_BYTE *)(v56 + 40) = v90 & 1;
    id v58 = a3;
    uint64_t v59 = swift_retain(a5);
    id v60 = (id)AMSLogKey(v59);
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
      uint64_t v64 = v63;
    }

    else
    {
      uint64_t v62 = 0LL;
      uint64_t v64 = 0LL;
    }

    uint64_t v65 = v88;
    static LogInterpolation.prefix(_:_:)(&v92, v62, v64);
    swift_bridgeObjectRelease(v64);
    sub_E740(&v92);
    uint64_t v94 = &type metadata for String;
    id v92 = (id)0xD00000000000001CLL;
    unint64_t v93 = 0x8000000000012BC0LL;
    static LogInterpolation.traceableSensitive(_:)(&v92);
    sub_E760((uint64_t)&v92, &qword_18988);
    LogInterpolation.init(stringLiteral:)(0xD00000000000001ALL, 0x8000000000012C00LL);
    uint64_t v94 = (void *)v44;
    uint64_t v66 = sub_E798(&v92);
    uint64_t v67 = v91;
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 16LL))(v66, v91, v44);
    static LogInterpolation.traceableSensitive(_:)(&v92);
    sub_E760((uint64_t)&v92, &qword_18988);
    Log.debug(_:)(v55);
    swift_bridgeObjectRelease(v55);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v15, v87);
    uint64_t v68 = v67;
    uint64_t v69 = 0LL;
    uint64_t v70 = v44;
LABEL_9:
    sub_9FD4(v68, v69, 1LL, v70);
    return (void *)sub_BD20((uint64_t)"nameComponents(for:service:)", 0x1CuLL, 2);
  }

  __break(1u);
  return result;
}

uint64_t AMSMediaServiceOwner.sign(inService:with:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_F7E0((uint64_t)sub_6540);
}

uint64_t sub_6540()
{
  uint64_t v2 = (void *)(v1[4] + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  v1[5] = *v2;
  sub_F63C((uint64_t)v2);
  sub_F54C();
  uint64_t v3 = (void *)swift_task_alloc(v0);
  v1[7] = v3;
  uint64_t v4 = sub_F614(v3, (uint64_t)sub_ED6C);
  return sub_F600(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_65A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(_BYTE *)(v6 + 908) = a6;
  *(void *)(v6 + 736) = a5;
  *(void *)(v6 + 728) = a4;
  *(void *)(v6 + 720) = a3;
  *(void *)(v6 + 712) = a2;
  *(void *)(v6 + 704) = a1;
  uint64_t v7 = type metadata accessor for Log(0LL);
  *(void *)(v6 + 744) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v6 + 752) = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 760) = swift_task_alloc(v9);
  *(void *)(v6 + 768) = swift_task_alloc(v9);
  *(void *)(v6 + 776) = swift_task_alloc(v9);
  *(void *)(v6 + 784) = swift_task_alloc(v9);
  *(void *)(v6 + 792) = swift_task_alloc(v9);
  return swift_task_switch(sub_664C, 0LL, 0LL);
}

uint64_t sub_664C()
{
  uint64_t v4 = *(void **)(v0 + 712);
  uint64_t v5 = *(void *)(v0 + 704);
  id v6 = (id)AMSSetLogKeyIfNeeded();
  sub_F834((uint64_t)v6);
  sub_F8AC();
  *(void *)(v0 + 800) = v2;
  uint64_t v7 = sub_9F94(&qword_18940);
  uint64_t inited = (__n128 *)swift_initStackObject(v7, v0 + 16);
  sub_F5C0(inited, (__n128)xmmword_111A0)[4].n128_u64[1] = (unint64_t)&type metadata for String;
  inited[3].n128_u64[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  inited[3].n128_u64[1] = v9;
  sub_FA9C();
  inited[5].n128_u64[0] = v10;
  inited[5].n128_u64[1] = v11;
  inited[7].n128_u64[1] = sub_EEC8(v12, &qword_18948, &OBJC_CLASS___AIDAServiceContext_ptr);
  inited[6].n128_u64[0] = (unint64_t)v4;
  id v13 = v4;
  uint64_t v14 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_BEE8((void (*)(char *, unint64_t))"sign(inService:with:)", 0x15uLL, 2, v14);
  sub_40B0();
  uint64_t v15 = sub_E510(v13);
  *(void *)(v0 + 808) = v15;
  if (!v15)
  {
    unsigned __int8 v33 = *(_BYTE *)(v0 + 908);
    __n128 v96 = *(__n128 *)(v0 + 720);
    uint64_t v34 = sub_EDD0();
    static Log.mediaServiceOwner.getter(v34, v35, v36, v37, v38, v39, v40, v41);
    sub_9F94(&qword_18978);
    sub_EFA8();
    sub_FCA8();
    *(_OWORD *)(sub_F398(v2 + 3 * v3, v42) + 16) = xmmword_11190;
    *(void *)(v0 + 368) = sub_9F94(&qword_18980);
    uint64_t v43 = (__n128 *)sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v0 + 344) = v43;
    sub_FD50(v43, v96)[2].n128_u8[8] = v33;
    sub_F11C(v44);
    uint64_t v45 = sub_FA20();
    id v46 = (id)AMSLogKey(v45);
    if (v46)
    {
      uint64_t v47 = sub_F6B0((uint64_t)v46);
      uint64_t v49 = v48;
    }

    else
    {
      uint64_t v47 = 0LL;
      uint64_t v49 = 0LL;
    }

    static LogInterpolation.prefix(_:_:)(v0 + 344, v47, v49);
    sub_40B0();
    sub_E740((void *)(v0 + 344));
    *(void *)(v0 + 208) = &type metadata for String;
    *(void *)(v0 + 184) = 0xD000000000000015LL;
    *(void *)(v0 + 192) = 0x8000000000012650LL;
    uint64_t v89 = sub_F2AC();
    sub_F150(v89, &qword_18988);
    sub_ED94(0xD00000000000003ALL);
    sub_FEA0();
    sub_EDA8();
    sub_F6D4();
    NSString v90 = sub_ED88();
    NSString v91 = sub_ED88();
    id v92 = (id)sub_F464(100LL);

    sub_F408();
    sub_F5E8();
    sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
    sub_EE58();
    sub_EF98();
    sub_EF6C();
    sub_F108();
    sub_F2E4();
    uint64_t v93 = sub_F2B4();
    return v94(v93);
  }

  uint64_t v16 = v15;
  uint64_t v17 = sub_E580(*(void **)(v0 + 712));
  if (!v17)
  {
    *(_OWORD *)(v0 + 216) = 0u;
    *(_OWORD *)(v0 + 232) = 0u;
    goto LABEL_10;
  }

  uint64_t v18 = v17;
  id v19 = AIDAServiceTypeStore;
  sub_B994((uint64_t)v19, v18, (_OWORD *)(v0 + 216));
  sub_EDA8();

  if (!*(void *)(v0 + 240))
  {
LABEL_10:
    sub_F150(v17, &qword_18988);
    uint64_t v32 = 0LL;
    goto LABEL_11;
  }

  sub_EEC8(v17, &qword_18A38, &OBJC_CLASS___AMSSignInContext_ptr);
  uint64_t v20 = sub_FEC0();
  uint64_t v24 = sub_F514(v20, v21, v22, v23);
  if ((_DWORD)v24) {
    uint64_t v32 = *(void **)(v0 + 696);
  }
  else {
    uint64_t v32 = 0LL;
  }
LABEL_11:
  unsigned __int8 v50 = *(_BYTE *)(v0 + 908);
  __n128 v95 = *(__n128 *)(v0 + 720);
  static Log.mediaServiceOwner.getter(v24, v25, v26, v27, v28, v29, v30, v31);
  *(void *)(v0 + 816) = sub_9F94(&qword_18978);
  uint64_t v51 = *(void *)(sub_EFA8() - 8);
  uint64_t v52 = *(void *)(v51 + 72);
  *(void *)(v0 + 824) = v52;
  LODWORD(v51) = *(_DWORD *)(v51 + 80);
  *(_DWORD *)(v0 + 904) = v51;
  uint64_t v53 = (_OWORD *)sub_F398( ((v51 + 32LL) & ~(unint64_t)v51) + 4 * v52,  v51);
  v53[1] = xmmword_11180;
  uint64_t v54 = sub_9F94(&qword_18980);
  *(void *)(v0 + 832) = v54;
  *(void *)(v0 + 272) = v54;
  uint64_t v55 = (__n128 *)sub_ED70((uint64_t)&unk_148F8);
  *(void *)(v0 + 248) = v55;
  sub_FD50(v55, v95)[2].n128_u8[8] = v50;
  sub_F11C(v56);
  uint64_t v57 = sub_FA20();
  id v58 = (id)AMSLogKey(v57);
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    uint64_t v62 = v61;
  }

  else
  {
    uint64_t v60 = 0LL;
    uint64_t v62 = 0LL;
  }

  static LogInterpolation.prefix(_:_:)(v0 + 248, v60, v62);
  sub_F384();
  sub_FC90();
  *(void *)(v0 + 304) = &type metadata for String;
  *(void *)(v0 + 280) = 0xD000000000000015LL;
  *(void *)(v0 + 288) = 0x8000000000012650LL;
  sub_FA00();
  sub_E760(v0 + 280, &qword_18988);
  uint64_t v63 = LogInterpolation.init(stringLiteral:)(0x65746E6F43736D61LL, 0xEB000000003A7478LL);
  if (v32)
  {
    *(void *)(v0 + 336) = sub_EEC8(v63, &qword_18A38, &OBJC_CLASS___AMSSignInContext_ptr);
    *(void *)(v0 + 312) = v32;
    uint64_t v64 = v32;
  }

  else
  {
    uint64_t v64 = 0LL;
    *(_OWORD *)(v0 + 312) = 0u;
    *(_OWORD *)(v0 + 328) = 0u;
  }

  *(void *)(v0 + 840) = v64;
  uint64_t v65 = *(void *)(v0 + 784);
  uint64_t v66 = *(void *)(v0 + 752);
  uint64_t v67 = *(void *)(v0 + 744);
  id v68 = v64;
  uint64_t v69 = sub_F2AC();
  sub_F150(v69, &qword_18988);
  Log.default(_:)(v53);
  sub_EE60();
  uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
  *(void *)(v0 + 848) = v70;
  v70(v65, v67);
  uint64_t v71 = sub_9F94(&qword_189D8);
  uint64_t v72 = swift_initStackObject(v71, v0 + 144);
  *(void *)(v0 + 856) = v72;
  *(_OWORD *)(v72 + 16) = xmmword_11170;
  uint64_t v73 = (void *)AMSAccountMediaTypeProduction;
  *(void *)(v0 + 864) = AMSAccountMediaTypeProduction;
  *(void *)(v72 + 32) = v73;
  id v74 = v73;
  if (v32)
  {
    id v75 = v68;
    id v76 = sub_FE98();
    if ([v53 skipAuthentication])
    {
      id v77 = (void *)swift_task_alloc(dword_18A34);
      *(void *)(v0 + 872) = v77;
      *id v77 = v0;
      v77[1] = sub_6D14;
      return sub_CB58( v16,  (uint64_t)v76,  *(void *)(v0 + 712),  (uint64_t)v53,  *(void *)(v0 + 720),  *(void *)(v0 + 728),  *(void *)(v0 + 736),  *(_BYTE *)(v0 + 908));
    }
  }

  else
  {
    id v79 = v74;
  }

  uint64_t v80 = (void *)swift_task_alloc(dword_18A2C);
  *(void *)(v0 + 888) = v80;
  *uint64_t v80 = v0;
  v80[1] = sub_7748;
  sub_FBCC();
  return sub_A218(v81, v82, v83, v84, v85, v86, v87, v88);
}

uint64_t sub_6D14(void *a1)
{
  *(void *)(v3 + 880) = v1;
  swift_task_dealloc(v4);
  if (!v1) {

  }
  sub_F0FC();
  return sub_F2EC();
}

uint64_t sub_6D68()
{
  uint64_t v7 = *(void **)(v2 + 864);

  sub_F884();
  sub_DE40();
  sub_EE60();
  uint64_t v8 = sub_EDA8();
  uint64_t v16 = _swiftEmptyArrayStorage[2];
  if (v16 != 1)
  {
    if (!v16)
    {
      sub_EFB0(v8, v9, v10, v11, v12, v13, v14, v15, v110, v118, v126, *((uint64_t *)&v126 + 1));
      *(_OWORD *)(sub_FA64(v0, v4) + 16) = xmmword_11190;
      *(void *)(v2 + 528) = 0xD000000000000015LL;
      uint64_t v17 = sub_ED70((uint64_t)&unk_148F8);
      *(void *)(v2 + 504) = v17;
      *(_OWORD *)(v17 + 16) = v158;
      *(void *)(v17 + 32) = v1;
      *(_BYTE *)(v17 + 40) = (_BYTE)v5;
      sub_F11C(*(double *)&v158);
      uint64_t v18 = sub_F54C();
      id v19 = (id)AMSLogKey(v18);
      if (v19)
      {
        sub_F814((uint64_t)v19);
        sub_FE8C();
      }

      else
      {
        id v6 = 0LL;
      }

      sub_EE68( (uint64_t)v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v111,  v119,  v127,  v133,  v139,  (uint64_t)v146,  v150,  v154,  v158,  *((uint64_t *)&v158 + 1),  v160,  (uint64_t)v161);
      sub_FC80();
      sub_E740(v5);
      *(void *)(v2 + 496) = &type metadata for String;
      uint64_t v52 = sub_F6FC();
      sub_FC38(v52, &qword_18988);
      sub_ED94((uint64_t)v6 + 22);
      sub_FA14();
      sub_EDA8();

      sub_FC00(v53, v54, v55, v56, v57, v58, v59, v60, v113, v120, (uint64_t)v128, v134, v140);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
      swift_task_dealloc(v147);
      swift_task_dealloc(v151);
      uint64_t v61 = sub_F108();
      uint64_t v69 = sub_FDD0(v61, v62, v63, v64, v65, v66, v67, v68, v114, v121, v129, v135, v141, v147, v151, v155);
      sub_FC40(v69, v70, v71, v72, v73, v74, v75, v76, v115, v122, v130, v136, v142, v148, v152, v156, v159);
      uint64_t v77 = sub_F0AC();
      return sub_F410(v77, v78);
    }

    sub_EEE8();
    NSString v30 = sub_ED88();
    NSString v31 = sub_ED88();
    sub_F85C();
    sub_9F94(&qword_18970);
    sub_F38C();
    sub_EDA8();
    id v32 = (id)sub_F8D4();
    sub_FEE8();

    static Log.mediaServiceOwner.getter(v33, v34, v35, v36, v37, v38, v39, v40);
    uint64_t v41 = (__n128 *)sub_FA64(v110, (uint64_t)_swiftEmptyArrayStorage);
    sub_FD3C(v41, (__n128)xmmword_11180, v42, v43, v44, v45, v46, v47, v48, v110, v118);
    uint64_t v49 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v2 + 376) = v49;
    *(_OWORD *)(v49 + 16) = v126;
    *(void *)(v49 + 32) = v6;
    *(_BYTE *)(v49 + 40) = v139;
    sub_F11C(*(double *)&v126);
    uint64_t v50 = swift_retain(v6);
    id v51 = (id)AMSLogKey(v50);
    if (v51)
    {
      sub_F834((uint64_t)v51);
      sub_FD70();
    }

    else
    {
      sub_F6F0();
    }

    uint64_t v143 = *(void *)(v2 + 848);
    id v6 = *(void **)(v2 + 840);
    uint64_t v84 = *(void *)(v2 + 824);
    uint64_t v123 = *(void *)(v2 + 760);
    *(void *)&__int128 v126 = *(void *)(v2 + 744);
    sub_F0BC((uint64_t)v146);
    sub_EF74();
    sub_E740(v146);
    *(void *)(v2 + 432) = &type metadata for String;
    *(void *)(v2 + 408) = 0xD000000000000015LL;
    *(void *)(v2 + 416) = 0x8000000000012650LL;
    sub_F530();
    sub_FC20(v150);
    uint64_t v85 = sub_ED94(0xD000000000000010LL);
    uint64_t v93 = sub_FB64( v85,  v86,  v87,  v88,  v89,  v90,  v91,  v92,  v112,  v123,  v126,  *((uint64_t *)&v126 + 1),  v143,  (uint64_t)v146,  v150,  v154,  v158);
    v101 = sub_F7B4( v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v116,  v124,  v131,  v137,  v144,  v149,  v153,  v157,  v158,  *((uint64_t *)&v158 + 1),  v160,  v161);
    sub_F8E8((uint64_t)v101);
    sub_FC70();
    sub_FC20(3 * v84);
    sub_FB5C((uint64_t)v41);
    uint64_t v102 = sub_F384();
    uint64_t v83 = sub_F760(v102, v103, v104, v105, v106, v107, v108, v109, v117, v125, v132, v138, v145);
LABEL_17:
    swift_willThrow(v83);

    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    sub_FAF4();
    sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
    sub_EE58();
    sub_EF6C();
    sub_F1C8();
    sub_F108();
    sub_F2E4();
    uint64_t v78 = *(uint64_t (**)(void))(v2 + 8);
    uint64_t v77 = 0LL;
    return sub_F410(v77, v78);
  }

  sub_F000(v8, v9, v10, v11, v12, v13, v14, v15, v110, v118, v126, *((uint64_t *)&v126 + 1));
  *(_OWORD *)(sub_FCD8() + 16) = xmmword_11180;
  *(void *)(v2 + 560) = v5;
  uint64_t v27 = sub_ED70((uint64_t)&unk_148F8);
  *(void *)(v2 + 536) = v27;
  *(_OWORD *)(v27 + 16) = v158;
  *(void *)(v27 + 32) = v4;
  *(_BYTE *)(v27 + 40) = (_BYTE)v6;
  sub_F11C(*(double *)&v158);
  uint64_t v28 = sub_F910();
  id v29 = (id)AMSLogKey(v28);
  if (v29)
  {
    sub_FD5C((uint64_t)v29);
    sub_F990();
  }

  else
  {
    sub_FE4C();
  }

  uint64_t v79 = *(void *)(v2 + 824);
  sub_F6E4((uint64_t)v3);
  sub_F65C();
  sub_E740(v3);
  sub_FDA4();
  *(void *)(v2 + 576) = 0x8000000000012650LL;
  uint64_t v80 = sub_F530();
  sub_FD90(v80, &qword_18988);
  uint64_t result = sub_ED94((uint64_t)v3 - 5);
  if (_swiftEmptyArrayStorage[2])
  {
    sub_F338();
    uint64_t v82 = sub_F92C();
    sub_F918((uint64_t)v82);
    sub_FC70();
    sub_E760(v79, &qword_18988);
    sub_FEAC();
    sub_EDA8();
    uint64_t result = sub_FDB8();
    if (_swiftEmptyArrayStorage[2])
    {
      uint64_t v83 = sub_FBBC();
      goto LABEL_17;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_71E4()
{
  uint64_t v4 = _swiftEmptyArrayStorage;
  if ((sub_FCC0() & 1) == 0) {
    uint64_t v4 = sub_F094();
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_F110((void *)(v5 > 1), v6 + 1);
  }
  uint64_t v7 = *(void *)(v0 + 880);
  uint64_t v8 = *(void **)(v0 + 864);
  uint64_t v9 = *(void **)(v0 + 840);
  v4[2] = v6 + 1;
  v4[v6 + 4] = v7;

  swift_errorRelease(v7);
  sub_F898();
  sub_DE40();
  sub_EF74();
  uint64_t v10 = sub_EE60();
  uint64_t v18 = v4[2];
  if (!v18)
  {
    sub_F054(v10, v11, v12, v13, v14, v15, v16, v17, v97, v101, v104, v107);
    uint64_t v30 = sub_FB34(v7, (uint64_t)(v4 + 4));
    *(_OWORD *)(v30 + 16) = xmmword_11190;
    *(void *)(v0 + 528) = v1;
    uint64_t v31 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v0 + 504) = v31;
    *(_OWORD *)(v31 + 16) = v128;
    *(void *)(v31 + 32) = v6;
    *(_BYTE *)(v31 + 40) = v2;
    sub_F11C(*(double *)&v128);
    uint64_t v32 = sub_F364();
    id v33 = (id)AMSLogKey(v32);
    if (v33)
    {
      sub_F7F4((uint64_t)v33);
      sub_F32C();
    }

    else
    {
      sub_F6F0();
    }

    uint64_t v116 = *(void **)(v0 + 840);
    uint64_t v119 = *(void (**)(uint64_t, uint64_t))(v0 + 848);
    sub_FE64();
    uint64_t v121 = v75;
    uint64_t v123 = v74;
    uint64_t v76 = *(void *)(v0 + 776);
    uint64_t v126 = *(void *)(v0 + 768);
    uint64_t v129 = *(void *)(v0 + 760);
    uint64_t v111 = *(void *)(v0 + 744);
    sub_F0BC((uint64_t)v3);
    sub_EF74();
    sub_E740(v3);
    *(void *)(v0 + 496) = &type metadata for String;
    uint64_t v77 = sub_F744();
    sub_FDF8(v77, &qword_18988);
    sub_ED94((uint64_t)v8 + 22);
    sub_FB3C(v30);
    sub_EE60();

    v119(v76, v111);
    sub_EDA8();
    uint64_t v78 = sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
    sub_FC40( v78,  v79,  v80,  v81,  v82,  v83,  v84,  v85,  v98,  v102,  v105,  v108,  v109,  v111,  (uint64_t)v116,  (uint64_t)v119,  v121);
    swift_task_dealloc(v123);
    sub_F2E4();
    swift_task_dealloc(v126);
    swift_task_dealloc(v129);
    uint64_t v86 = sub_F0AC();
    return sub_F4D4(v86, v87);
  }

  if (v18 != 1)
  {
    uint64_t v118 = (void *)(v0 + 376);
    uint64_t v120 = v0 + 408;
    uint64_t v122 = v0 + 688;
    uint64_t v125 = v0 + 632;
    sub_FE78();
    uint64_t v114 = v34;
    char v110 = *(_BYTE *)(v0 + 908);
    uint64_t v36 = (v35 + 32) & ~v35;
    sub_FA78();
    NSString v37 = sub_ED88();
    NSString v38 = sub_ED88();
    sub_F85C();
    sub_9F94(&qword_18970);
    v39.super.isa = sub_F38C().super.isa;
    sub_EDA8();
    id v40 = (id)sub_F8C0();

    static Log.mediaServiceOwner.getter(v41, v42, v43, v44, v45, v46, v47, v48);
    uint64_t v56 = sub_FD04(v114, v49, v50, v51, v52, v53, v54, v55, v97);
    *(_OWORD *)(v56 + 16) = xmmword_11180;
    uint64_t v115 = v56;
    *(void *)(v0 + 400) = v101;
    uint64_t v57 = (__n128 *)sub_ED70((uint64_t)&unk_148F8);
    *(void *)&double v66 = sub_FE2C(v57, v58, v59, v60, v61, v62, v63, v64, v99, v101, v65).n128_u64[0];
    *(_BYTE *)(v67 + 40) = v110;
    sub_F11C(v66);
    uint64_t v68 = sub_F54C();
    id v69 = (id)AMSLogKey(v68);
    if (v69)
    {
      sub_F834((uint64_t)v69);
      sub_F8AC();
    }

    else
    {
      sub_EFF4();
    }

    uint64_t v112 = *(void *)(v0 + 848);
    sub_F83C();
    sub_EDB0((uint64_t)v118);
    sub_EDD0();
    sub_E740(v118);
    *(void *)(v0 + 432) = &type metadata for String;
    sub_FC58();
    sub_F9BC();
    sub_FCA0(v120);
    sub_ED94(v36 - 5);
    uint64_t ErrorValue = swift_getErrorValue(v40, v122, v125);
    uint64_t v96 = sub_F81C( ErrorValue,  v89,  v90,  v91,  v92,  v93,  v94,  v95,  v100,  v103,  v104,  v107,  v109,  v112,  v115,  (uint64_t)v118,  v120,  v122,  v125,  v127,  (void *)(v0 + 440));
    sub_F9C4((uint64_t)v96);
    sub_F2AC();
    sub_FCA0((uint64_t)v38);
    sub_FB5C(v117);
    sub_EE60();
    v113(v38, v106);
    goto LABEL_21;
  }

  __n128 v124 = sub_F2F8();
  static Log.mediaServiceOwner.getter(v19, v20, v21, v22, v23, v24, v25, v26);
  *(_OWORD *)(sub_FCE8() + 16) = xmmword_11180;
  *(void *)(v0 + 560) = v2;
  uint64_t v27 = sub_ED70((uint64_t)&unk_148F8);
  *(void *)(v0 + 536) = v27;
  *(__n128 *)(v27 + 16) = v124;
  *(void *)(v27 + 32) = v4 + 4;
  *(_BYTE *)(v27 + 40) = v6;
  sub_F11C(v124.n128_f64[0]);
  uint64_t v28 = sub_F66C();
  id v29 = (id)AMSLogKey(v28);
  if (v29)
  {
    sub_F5B8((uint64_t)v29);
    sub_F0C8();
  }

  else
  {
    sub_EFF4();
  }

  sub_EDB0(v0 + 536);
  sub_EDD0();
  sub_FC90();
  *(void *)(v0 + 592) = &type metadata for String;
  *(void *)(v0 + 568) = 0xD000000000000015LL;
  *(void *)(v0 + 576) = 0x8000000000012650LL;
  uint64_t v70 = sub_F530();
  sub_FD90(v70, &qword_18988);
  uint64_t result = sub_ED94(0xD000000000000010LL);
  if (v4[2])
  {
    sub_F3A4();
    uint64_t v72 = sub_FA28();
    sub_F284((uint64_t)v72);
    uint64_t v73 = sub_FCF8();
    sub_FC38(v73, &qword_18988);
    sub_F724();
    sub_EE60();
    uint64_t result = sub_FD98();
    if (v4[2])
    {
      v39.super.isa = *(Class *)(v0 + 840);
      sub_F7EC();
LABEL_21:
      sub_F408();

      sub_EDA8();
      sub_F5E8();
      sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
      sub_EE58();
      sub_EF98();
      sub_EF6C();
      sub_F108();
      sub_F2E4();
      uint64_t v86 = sub_F2B4();
      return sub_F4D4(v86, v87);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_7748()
{
  *(void *)(v1 + 896) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_7794()
{
  sub_F884();
  sub_DE40();
  sub_EE60();
  uint64_t v7 = sub_EDA8();
  uint64_t v15 = _swiftEmptyArrayStorage[2];
  if (v15 != 1)
  {
    if (!v15)
    {
      sub_EFB0(v7, v8, v9, v10, v11, v12, v13, v14, v109, v117, v125, *((uint64_t *)&v125 + 1));
      *(_OWORD *)(sub_FA64(v0, v4) + 16) = xmmword_11190;
      *(void *)(v2 + 528) = 0xD000000000000015LL;
      uint64_t v16 = sub_ED70((uint64_t)&unk_148F8);
      *(void *)(v2 + 504) = v16;
      *(_OWORD *)(v16 + 16) = v157;
      *(void *)(v16 + 32) = v1;
      *(_BYTE *)(v16 + 40) = (_BYTE)v5;
      sub_F11C(*(double *)&v157);
      uint64_t v17 = sub_F54C();
      id v18 = (id)AMSLogKey(v17);
      if (v18)
      {
        sub_F814((uint64_t)v18);
        sub_FE8C();
      }

      else
      {
        unint64_t v6 = 0LL;
      }

      sub_EE68( (uint64_t)v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v110,  v118,  v126,  v132,  v138,  (uint64_t)v145,  v149,  v153,  v157,  *((uint64_t *)&v157 + 1),  v159,  (uint64_t)v160);
      sub_FC80();
      sub_E740(v5);
      *(void *)(v2 + 496) = &type metadata for String;
      uint64_t v51 = sub_F6FC();
      sub_FC38(v51, &qword_18988);
      sub_ED94((uint64_t)v6 + 22);
      sub_FA14();
      sub_EDA8();

      sub_FC00(v52, v53, v54, v55, v56, v57, v58, v59, v112, v119, (uint64_t)v127, v133, v139);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
      swift_task_dealloc(v146);
      swift_task_dealloc(v150);
      uint64_t v60 = sub_F108();
      uint64_t v68 = sub_FDD0(v60, v61, v62, v63, v64, v65, v66, v67, v113, v120, v128, v134, v140, v146, v150, v154);
      sub_FC40(v68, v69, v70, v71, v72, v73, v74, v75, v114, v121, v129, v135, v141, v147, v151, v155, v158);
      uint64_t v76 = sub_F0AC();
      return sub_F410(v76, v77);
    }

    sub_EEE8();
    NSString v29 = sub_ED88();
    NSString v30 = sub_ED88();
    sub_F85C();
    sub_9F94(&qword_18970);
    sub_F38C();
    sub_EDA8();
    id v31 = (id)sub_F8D4();
    sub_FEE8();

    static Log.mediaServiceOwner.getter(v32, v33, v34, v35, v36, v37, v38, v39);
    id v40 = (__n128 *)sub_FA64(v109, (uint64_t)_swiftEmptyArrayStorage);
    sub_FD3C(v40, (__n128)xmmword_11180, v41, v42, v43, v44, v45, v46, v47, v109, v117);
    uint64_t v48 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v2 + 376) = v48;
    *(_OWORD *)(v48 + 16) = v125;
    *(void *)(v48 + 32) = v6;
    *(_BYTE *)(v48 + 40) = v138;
    sub_F11C(*(double *)&v125);
    uint64_t v49 = swift_retain(v6);
    id v50 = (id)AMSLogKey(v49);
    if (v50)
    {
      sub_F834((uint64_t)v50);
      sub_FD70();
    }

    else
    {
      sub_F6F0();
    }

    uint64_t v142 = *(void *)(v2 + 848);
    unint64_t v6 = *(void **)(v2 + 840);
    uint64_t v83 = *(void *)(v2 + 824);
    uint64_t v122 = *(void *)(v2 + 760);
    *(void *)&__int128 v125 = *(void *)(v2 + 744);
    sub_F0BC((uint64_t)v145);
    sub_EF74();
    sub_E740(v145);
    *(void *)(v2 + 432) = &type metadata for String;
    *(void *)(v2 + 408) = 0xD000000000000015LL;
    *(void *)(v2 + 416) = 0x8000000000012650LL;
    sub_F530();
    sub_FC20(v149);
    uint64_t v84 = sub_ED94(0xD000000000000010LL);
    uint64_t v92 = sub_FB64( v84,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  v111,  v122,  v125,  *((uint64_t *)&v125 + 1),  v142,  (uint64_t)v145,  v149,  v153,  v157);
    uint64_t v100 = sub_F7B4( v92,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v115,  v123,  v130,  v136,  v143,  v148,  v152,  v156,  v157,  *((uint64_t *)&v157 + 1),  v159,  v160);
    sub_F8E8((uint64_t)v100);
    sub_FC70();
    sub_FC20(3 * v83);
    sub_FB5C((uint64_t)v40);
    uint64_t v101 = sub_F384();
    uint64_t v82 = sub_F760(v101, v102, v103, v104, v105, v106, v107, v108, v116, v124, v131, v137, v144);
LABEL_17:
    swift_willThrow(v82);

    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    sub_FAF4();
    sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
    sub_EE58();
    sub_EF6C();
    sub_F1C8();
    sub_F108();
    sub_F2E4();
    uint64_t v77 = *(uint64_t (**)(void))(v2 + 8);
    uint64_t v76 = 0LL;
    return sub_F410(v76, v77);
  }

  sub_F000(v7, v8, v9, v10, v11, v12, v13, v14, v109, v117, v125, *((uint64_t *)&v125 + 1));
  *(_OWORD *)(sub_FCD8() + 16) = xmmword_11180;
  *(void *)(v2 + 560) = v5;
  uint64_t v26 = sub_ED70((uint64_t)&unk_148F8);
  *(void *)(v2 + 536) = v26;
  *(_OWORD *)(v26 + 16) = v157;
  *(void *)(v26 + 32) = v4;
  *(_BYTE *)(v26 + 40) = (_BYTE)v6;
  sub_F11C(*(double *)&v157);
  uint64_t v27 = sub_F910();
  id v28 = (id)AMSLogKey(v27);
  if (v28)
  {
    sub_FD5C((uint64_t)v28);
    sub_F990();
  }

  else
  {
    sub_FE4C();
  }

  uint64_t v78 = *(void *)(v2 + 824);
  sub_F6E4((uint64_t)v3);
  sub_F65C();
  sub_E740(v3);
  sub_FDA4();
  *(void *)(v2 + 576) = 0x8000000000012650LL;
  uint64_t v79 = sub_F530();
  sub_FD90(v79, &qword_18988);
  uint64_t result = sub_ED94((uint64_t)v3 - 5);
  if (_swiftEmptyArrayStorage[2])
  {
    sub_F338();
    uint64_t v81 = sub_F92C();
    sub_F918((uint64_t)v81);
    sub_FC70();
    sub_E760(v78, &qword_18988);
    sub_FEAC();
    sub_EDA8();
    uint64_t result = sub_FDB8();
    if (_swiftEmptyArrayStorage[2])
    {
      uint64_t v82 = sub_FBBC();
      goto LABEL_17;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_7C08()
{
  uint64_t v4 = _swiftEmptyArrayStorage;
  if ((sub_FCC0() & 1) == 0) {
    uint64_t v4 = sub_F094();
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_F110((void *)(v5 > 1), v6 + 1);
  }
  uint64_t v7 = *(void *)(v0 + 896);
  uint64_t v8 = *(void **)(v0 + 864);
  v4[2] = v6 + 1;
  v4[v6 + 4] = v7;

  swift_errorRelease(v7);
  sub_F898();
  sub_DE40();
  sub_EF74();
  uint64_t v9 = sub_EE60();
  uint64_t v17 = v4[2];
  if (!v17)
  {
    sub_F054(v9, v10, v11, v12, v13, v14, v15, v16, v111, v117, v122, v126);
    uint64_t v29 = sub_FB34(v7, v1);
    *(_OWORD *)(v29 + 16) = xmmword_11190;
    *(void *)(v0 + 528) = v2;
    uint64_t v30 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v0 + 504) = v30;
    *(_OWORD *)(v30 + 16) = v154;
    *(void *)(v30 + 32) = v6;
    *(_BYTE *)(v30 + 40) = v3;
    sub_F11C(*(double *)&v154);
    uint64_t v31 = sub_F364();
    id v32 = (id)AMSLogKey(v31);
    if (v32)
    {
      sub_F7F4((uint64_t)v32);
      sub_F32C();
    }

    else
    {
      sub_F6F0();
    }

    uint64_t v137 = *(void **)(v0 + 840);
    uint64_t v141 = *(void (**)(uint64_t, uint64_t))(v0 + 848);
    sub_FE64();
    uint64_t v144 = v73;
    uint64_t v148 = v72;
    uint64_t v74 = *(void *)(v0 + 776);
    uint64_t v153 = *(void *)(v0 + 768);
    uint64_t v156 = *(void *)(v0 + 760);
    uint64_t v131 = *(void *)(v0 + 744);
    sub_F0BC((uint64_t)(v4 + 4));
    sub_EF74();
    sub_E740(v4 + 4);
    *(void *)(v0 + 496) = &type metadata for String;
    uint64_t v75 = sub_F744();
    sub_FDF8(v75, &qword_18988);
    sub_ED94(0xD00000000000002BLL);
    sub_FB3C(v29);
    sub_EE60();

    v141(v74, v131);
    sub_EDA8();
    uint64_t v76 = sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
    uint64_t v84 = sub_FDD0( v76,  v77,  v78,  v79,  v80,  v81,  v82,  v83,  v112,  v118,  v123,  v127,  v131,  (uint64_t)v137,  (uint64_t)v141,  v144);
    sub_FC40(v84, v85, v86, v87, v88, v89, v90, v91, v115, v120, v124, v128, v132, v138, v142, v145, v148);
    sub_F2E4();
    swift_task_dealloc(v153);
    swift_task_dealloc(v156);
    uint64_t v92 = sub_F0AC();
    return sub_F4D4(v92, v93);
  }

  if (v17 != 1)
  {
    uint64_t v140 = (void *)(v0 + 376);
    uint64_t v143 = v0 + 408;
    uint64_t v152 = v0 + 632;
    uint64_t v147 = v0 + 688;
    sub_FE78();
    uint64_t v135 = v33;
    char v130 = *(_BYTE *)(v0 + 908);
    uint64_t v35 = (v34 + 32) & ~v34;
    sub_FA78();
    NSString v36 = sub_ED88();
    NSString v37 = sub_ED88();
    sub_F85C();
    sub_9F94(&qword_18970);
    v38.super.isa = sub_F38C().super.isa;
    sub_EDA8();
    id v39 = (id)sub_F8C0();

    static Log.mediaServiceOwner.getter(v40, v41, v42, v43, v44, v45, v46, v47);
    uint64_t v55 = sub_FD04(v135, v48, v49, v50, v51, v52, v53, v54, v111);
    *(_OWORD *)(v55 + 16) = xmmword_11180;
    uint64_t v136 = v55;
    *(void *)(v0 + 400) = v117;
    uint64_t v56 = (__n128 *)sub_ED70((uint64_t)&unk_148F8);
    *(void *)&double v65 = sub_FE2C(v56, v57, v58, v59, v60, v61, v62, v63, v113, v117, v64).n128_u64[0];
    *(_BYTE *)(v66 + 40) = v130;
    sub_F11C(v65);
    uint64_t v67 = sub_F54C();
    id v68 = (id)AMSLogKey(v67);
    if (v68)
    {
      sub_F834((uint64_t)v68);
      sub_F8AC();
    }

    else
    {
      sub_EFF4();
    }

    uint64_t v133 = *(void *)(v0 + 848);
    sub_F83C();
    sub_EDB0((uint64_t)v140);
    sub_EDD0();
    sub_E740(v140);
    *(void *)(v0 + 432) = &type metadata for String;
    sub_FC58();
    sub_F9BC();
    sub_FCA0(v143);
    sub_ED94(v35 - 5);
    uint64_t ErrorValue = swift_getErrorValue(v39, v147, v152);
    uint64_t v102 = sub_F81C( ErrorValue,  v95,  v96,  v97,  v98,  v99,  v100,  v101,  v114,  v119,  v122,  v126,  v133,  v136,  (uint64_t)v140,  v143,  v147,  v149,  v150,  v152,  (void *)(v0 + 440));
    sub_F9C4((uint64_t)v102);
    sub_F2AC();
    sub_FCA0((uint64_t)v37);
    sub_FB5C(v139);
    uint64_t v103 = sub_EE60();
    sub_F760(v103, v104, v105, v106, v107, v108, v109, v110, v116, v121, v125, v129, v134);
    goto LABEL_21;
  }

  uint64_t v151 = (void *)(v0 + 536);
  uint64_t v155 = v0 + 568;
  __n128 v146 = sub_F2F8();
  static Log.mediaServiceOwner.getter(v18, v19, v20, v21, v22, v23, v24, v25);
  *(_OWORD *)(sub_FCE8() + 16) = xmmword_11180;
  *(void *)(v0 + 560) = v3;
  uint64_t v26 = sub_ED70((uint64_t)&unk_148F8);
  *(void *)(v0 + 536) = v26;
  *(__n128 *)(v26 + 16) = v146;
  *(void *)(v26 + 32) = v1;
  *(_BYTE *)(v26 + 40) = v6;
  sub_F11C(v146.n128_f64[0]);
  uint64_t v27 = sub_F66C();
  id v28 = (id)AMSLogKey(v27);
  if (v28)
  {
    sub_F5B8((uint64_t)v28);
    sub_F0C8();
  }

  else
  {
    sub_EFF4();
  }

  sub_EDB0((uint64_t)v151);
  sub_EDD0();
  sub_E740(v151);
  *(void *)(v0 + 592) = &type metadata for String;
  *(void *)(v0 + 568) = 0xD000000000000015LL;
  *(void *)(v0 + 576) = 0x8000000000012650LL;
  static LogInterpolation.traceableSensitive(_:)(v155);
  sub_E760(v155, &qword_18988);
  uint64_t result = sub_ED94(0xD000000000000010LL);
  if (v4[2])
  {
    sub_F3A4();
    uint64_t v70 = sub_FA28();
    sub_F284((uint64_t)v70);
    uint64_t v71 = sub_FCF8();
    sub_FC38(v71, &qword_18988);
    sub_F724();
    sub_EE60();
    uint64_t result = sub_FD98();
    if (v4[2])
    {
      v38.super.isa = *(Class *)(v0 + 840);
      sub_F7EC();
LABEL_21:
      sub_F408();

      sub_EDA8();
      sub_F5E8();
      sub_EFA0((uint64_t)"sign(inService:with:)", 0x15uLL);
      sub_EE58();
      sub_EF98();
      sub_EF6C();
      sub_F108();
      sub_F2E4();
      uint64_t v92 = sub_F2B4();
      return sub_F4D4(v92, v93);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_8178(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v8 = dword_1883C;
  id v9 = a1;
  id v10 = a2;
  a4;
  uint64_t v11 = (void *)swift_task_alloc(v8);
  v4[6] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_ED68;
  return AMSMediaServiceOwner.sign(inService:with:)((uint64_t)v9, (uint64_t)v10);
}

uint64_t sub_8208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9F94(&qword_188F0);
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  sub_9FD4((uint64_t)v6, 1LL, 1LL, v7);
  uint64_t v8 = (void *)swift_allocObject(&unk_14830, 48LL, 7LL);
  v8[2] = 0LL;
  v8[3] = 0LL;
  v8[4] = a1;
  v8[5] = a2;
  id v9 = (void *)swift_allocObject(&unk_14858, 48LL, 7LL);
  v9[2] = 0LL;
  v9[3] = 0LL;
  v9[4] = &unk_18900;
  v9[5] = v8;
  uint64_t v10 = sub_DB68((uint64_t)v6, (uint64_t)&unk_18910, (uint64_t)v9);
  return swift_release(v10, v11);
}

uint64_t AMSMediaServiceOwner.signOutService(_:with:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_F7E0((uint64_t)sub_82F8);
}

uint64_t sub_82F8()
{
  uint64_t v2 = (void *)(v1[4] + OBJC_IVAR____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner_serviceOwner);
  v1[5] = *v2;
  sub_F63C((uint64_t)v2);
  sub_F54C();
  uint64_t v3 = (void *)swift_task_alloc(v0);
  v1[7] = v3;
  uint64_t v4 = sub_F614(v3, (uint64_t)sub_835C);
  return sub_F600(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_835C(char a1)
{
  uint64_t v5 = *(void **)(v4 + 40);
  sub_EDD8();

  sub_FDE4(v6, v7);
  if (v1) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = a1 & 1;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v8);
}

uint64_t sub_83B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(_BYTE *)(v6 + 736) = a6;
  *(void *)(v6 + 584) = a5;
  *(void *)(v6 + 576) = a4;
  *(void *)(v6 + 568) = a3;
  *(void *)(v6 + 560) = a2;
  *(void *)(v6 + 552) = a1;
  uint64_t v8 = type metadata accessor for Log(0LL);
  *(void *)(v6 + 592) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v6 + 600) = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 608) = swift_task_alloc(v10);
  *(void *)(v6 + 616) = swift_task_alloc(v10);
  *(void *)(v6 + 624) = swift_task_alloc(v10);
  *(void *)(v6 + 632) = swift_task_alloc(v10);
  *(void *)(v6 + 544) = a3;
  return swift_task_switch(sub_845C, 0LL, 0LL);
}

uint64_t sub_845C()
{
  unsigned __int8 v1 = *(_BYTE *)(v0 + 736);
  uint64_t v2 = *(void **)(v0 + 560);
  uint64_t v3 = *(void *)(v0 + 552);
  uint64_t v4 = sub_9F94(&qword_18940);
  __n128 v18 = *(__n128 *)(v0 + 568);
  uint64_t inited = (__n128 *)swift_initStackObject(v4, v0 + 16);
  sub_F5C0(inited, (__n128)xmmword_111A0)[4].n128_u64[1] = (unint64_t)&type metadata for String;
  inited[3].n128_u64[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  inited[3].n128_u64[1] = v6;
  sub_FA9C();
  inited[5].n128_u64[0] = v7;
  inited[5].n128_u64[1] = v8;
  inited[7].n128_u64[1] = sub_EEC8(v9, &qword_18948, &OBJC_CLASS___AIDAServiceContext_ptr);
  inited[6].n128_u64[0] = (unint64_t)v2;
  id v10 = v2;
  uint64_t v11 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_BEE8((void (*)(char *, unint64_t))"signOutService(_:with:)", 0x17uLL, 2, v11);
  sub_EDA8();
  uint64_t v12 = (__n128 *)sub_ED70((uint64_t)&unk_148D0);
  *(void *)(v0 + 640) = v12;
  sub_FD50(v12, v18)[2].n128_u8[8] = v1;
  uint64_t v13 = dword_18964;
  id v15 = v14;
  sub_FA20();
  uint64_t v16 = (void *)swift_task_alloc(v13);
  *(void *)(v0 + 648) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_85BC;
  return sub_A0FC(2, (uint64_t)&unk_18958, (uint64_t)v12);
}

uint64_t sub_85BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 648LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 640LL);
  *(void *)(*(void *)v1 + 656LL) = a1;
  swift_task_dealloc(v2);
  swift_release(v3, v4);
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_8618( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = *(void *)(v12 + 656);
  uint64_t v14 = *(void *)(v13 + 16);
  *(void *)(v12 + 664) = v14;
  if (v14)
  {
    *(void *)(v12 + 680) = _swiftEmptyArrayStorage;
    *(void *)(v12 + 672) = 0LL;
    id v15 = *(void **)(v13 + 32);
    *(void *)(v12 + 688) = v15;
    id v16 = v15;
    uint64_t v17 = (void *)sub_F9B0();
    *(void *)(v12 + 696) = v17;
    uint64_t v18 = sub_EEC8((uint64_t)v17, &qword_18968, &OBJC_CLASS___ACAccountStore_ptr);
    sub_FAE8(v18);
    *uint64_t v17 = v12;
    v17[1] = sub_8868;
    return sub_F3EC();
  }

  else
  {
    char v20 = *(_BYTE *)(v12 + 736);
    uint64_t v21 = *(void **)(v12 + 584);
    uint64_t v22 = *(void *)(v12 + 576);
    uint64_t v23 = swift_bridgeObjectRelease(v13);
    static Log.mediaServiceOwner.getter(v23, v24, v25, v26, v27, v28, v29, v30);
    sub_9F94(&qword_18978);
    uint64_t v31 = *(void *)(sub_EFA8() - 8);
    uint64_t v32 = sub_F398( ((*(unsigned __int8 *)(v31 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))
          + 3LL * *(void *)(v31 + 72),
            *(unsigned __int8 *)(v31 + 80));
    *(_OWORD *)(v32 + 16) = xmmword_11190;
    *(void *)(v12 + 232) = sub_9F94(&qword_18980);
    uint64_t v33 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v12 + 208) = v33;
    uint64_t v34 = *(void **)(v12 + 544);
    *(void *)(v33 + 16) = v34;
    *(void *)(v33 + 24) = v22;
    *(void *)(v33 + 32) = v21;
    *(_BYTE *)(v33 + 40) = v20;
    sub_F54C();
    id v35 = (id)AMSLogKey(v34);
    if (v35)
    {
      sub_F834((uint64_t)v35);
    }

    else
    {
      sub_FE4C();
    }

    uint64_t v36 = *(void *)(v12 + 632);
    uint64_t v37 = *(void *)(v12 + 600);
    uint64_t v46 = *(void *)(v12 + 592);
    sub_F6E4(v12 + 208);
    sub_F65C();
    sub_FEE0();
    *(void *)(v12 + 424) = &type metadata for String;
    *(void *)(v12 + 400) = 0xD000000000000017LL;
    *(void *)(v12 + 408) = 0x8000000000012560LL;
    static LogInterpolation.traceableSensitive(_:)(v12 + 400);
    sub_E760(v12 + 400, &qword_18988);
    sub_ED94(0xD00000000000002FLL);
    Log.default(_:)(v32);
    sub_EDA8();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v46);
    sub_EFA0((uint64_t)"signOutService(_:with:)", 0x17uLL);
    sub_EE58();
    sub_EF98();
    sub_EF6C();
    sub_F1C8();
    sub_F0AC();
    sub_FABC();
    return v39(v38, v39, v40, v41, v42, v43, v44, v45, v46, a10, a11, a12);
  }

uint64_t sub_8868()
{
  *(void *)(v1 + 712) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

#error "8A58: call analysis failed (funcsize=308)"
#error "8F44: call analysis failed (funcsize=302)"
uint64_t sub_9320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  sub_EE48();
  sub_F674();
  *(void *)(v1 + 728) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

#error "9494: call analysis failed (funcsize=280)"
#error "9988: call analysis failed (funcsize=304)"
uint64_t type metadata accessor for AMSMediaServiceOwner()
{
  return objc_opt_self(&OBJC_CLASS____TtC20AMSMediaServiceOwner20AMSMediaServiceOwner);
}

uint64_t sub_9D98(void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6)
{
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = (void *)sub_EDA0(a6, 48LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = v10;
  v11[5] = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a1;
  uint64_t v15 = sub_FEC0();
  return sub_8208(v15, v16);
}

uint64_t sub_9E08(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v8 = dword_1884C;
  id v9 = a1;
  id v10 = a2;
  a4;
  uint64_t v11 = (void *)swift_task_alloc(v8);
  v4[6] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_9E98;
  return AMSMediaServiceOwner.signOutService(_:with:)((uint64_t)v9, (uint64_t)v10);
}

uint64_t sub_9E98(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v12 = v4;
  unint64_t v6 = *(void **)(v4 + 24);
  uint64_t v5 = *(void **)(v4 + 32);
  unint64_t v7 = *(void **)(v4 + 16);
  uint64_t v8 = *v2;
  sub_F148(*(void *)(v4 + 48), &v12);

  uint64_t v9 = *(void *)(v4 + 40);
  if (v1)
  {
    id v10 = (void *)_convertErrorToNSError(_:)(v1);
    sub_F5B0();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0LL, v10);
  }

  else
  {
    (*(void (**)(void, void, void))(v9 + 16))(*(void *)(v4 + 40), a1 & 1, 0LL);
  }

  _Block_release(*(const void **)(v4 + 40));
  return sub_F8B8(*(uint64_t (**)(void))(v8 + 8));
}

uint64_t sub_9F50()
{
  uint64_t v1 = (void *)sub_FD28();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_F124(v1, (uint64_t)sub_ED60);
  return sub_F0E8(v2, v3, v4, v5, v6);
}

uint64_t sub_9F94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_9FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_9FE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(void *)(v16 + 16) = a2;
  uint64_t v18 = (void *)swift_task_alloc(async function pointer to AccountStoreProtocol.activeiTunesAccount(for:)[1]);
  *(void *)(v16 + 32) = v18;
  uint64_t v19 = sub_EC6C(0LL, &qword_18968, &OBJC_CLASS___ACAccountStore_ptr);
  *uint64_t v18 = v16;
  v18[1] = sub_A070;
  return AccountStoreProtocol.activeiTunesAccount(for:)( v16 + 24,  a1,  v19,  &protocol witness table for ACAccountStore,  v20,  v21,  v22,  v23,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16);
}

uint64_t sub_A070()
{
  if (v0) {
    sub_F5B0();
  }
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_A0B8()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1) {

  }
  return sub_F7A8(v1 != 0LL, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_A0F0()
{
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_A0FC(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  return swift_task_switch(sub_A118, 0LL, 0LL);
}

uint64_t sub_A118()
{
  char v1 = *(_BYTE *)(v0 + 56);
  uint64_t v2 = sub_9F94(&qword_189A0);
  uint64_t v3 = swift_task_alloc(48LL);
  *(void *)(v0 + 40) = v3;
  __int128 v4 = *(_OWORD *)(v0 + 24);
  *(_BYTE *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  uint64_t v5 = sub_9F94(&qword_189B8);
  unint64_t v6 = (void *)swift_task_alloc(async function pointer to withTaskGroup<A, B>(of:returning:isolation:body:)[1]);
  *(void *)(v0 + 48) = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_A1D8;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v0 + 16, v2, v5, 0LL, 0LL, &unk_189B0, v3, v2);
}

uint64_t sub_A1D8()
{
  return sub_ED7C();
}

uint64_t sub_A210()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_A218( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(v8 + 596) = v15;
  *(void *)(v8 + 424) = a8;
  *(void *)(v8 + 432) = v14;
  *(void *)(v8 + 408) = a6;
  *(void *)(v8 + 416) = a7;
  *(void *)(v8 + 392) = a4;
  *(void *)(v8 + 400) = a5;
  *(void *)(v8 + 376) = a2;
  *(void *)(v8 + 384) = a3;
  *(void *)(v8 + 368) = a1;
  uint64_t v10 = type metadata accessor for Log(0LL);
  *(void *)(v8 + 440) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v8 + 448) = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 456) = swift_task_alloc(v12);
  *(void *)(v8 + 464) = swift_task_alloc(v12);
  *(void *)(v8 + 472) = swift_task_alloc(v12);
  *(void *)(v8 + 480) = swift_task_alloc(v12);
  *(void *)(v8 + 488) = swift_task_alloc(v12);
  *(void *)(v8 + 288) = a7;
  return swift_task_switch(sub_A2D4, 0LL, 0LL);
}

uint64_t sub_A2D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  unsigned __int8 v17 = v16[37].n128_u8[4];
  __n128 v55 = v16[26];
  static Log.mediaServiceOwner.getter(v18, v19, v20, v21, v22, v23, v24, v25);
  v16[31].n128_u64[0] = sub_9F94(&qword_18978);
  uint64_t v26 = *(void *)(sub_EFA8() - 8);
  unint64_t v27 = *(void *)(v26 + 72);
  v16[31].n128_u64[1] = v27;
  LODWORD(v26) = *(_DWORD *)(v26 + 80);
  v16[37].n128_u32[0] = v26;
  *(_OWORD *)(sub_F398( ((v26 + 32LL) & ~(unint64_t)v26) + 3 * v27,  v26)
            + 16) = xmmword_11190;
  uint64_t v28 = sub_9F94(&qword_18980);
  v16[32].n128_u64[0] = v28;
  v16[4].n128_u64[1] = v28;
  uint64_t v29 = (__n128 *)sub_ED70((uint64_t)&unk_148F8);
  v16[3].n128_u64[0] = (unint64_t)v29;
  sub_FD50(v29, v55)[2].n128_u8[8] = v17;
  sub_F11C(v30);
  uint64_t v31 = sub_FA20();
  id v32 = (id)AMSLogKey(v31);
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    uint64_t v36 = v35;
  }

  else
  {
    uint64_t v34 = 0LL;
    uint64_t v36 = 0LL;
  }

  unint64_t v37 = v16[30].n128_u64[1];
  unint64_t v38 = v16[28].n128_u64[0];
  unint64_t v54 = v16[27].n128_u64[1];
  id v39 = (void *)v16[23].n128_u64[1];
  static LogInterpolation.prefix(_:_:)(&v16[3], v34, v36);
  sub_F384();
  sub_E740((__n128 *)v16[3].n128_u64);
  LogInterpolation.init(stringLiteral:)(0xD00000000000004CLL, 0x80000000000129F0LL);
  type metadata accessor for AMSAccountMediaType(0LL);
  v16[6].n128_u64[1] = v40;
  v16[5].n128_u64[0] = (unint64_t)v39;
  id v41 = v39;
  uint64_t v42 = sub_F9BC();
  sub_FDF8(v42, &qword_18988);
  sub_FEB8();
  sub_EDA8();
  uint64_t v43 = *(void (**)(unint64_t, unint64_t))(v38 + 8);
  v16[32].n128_u64[1] = (unint64_t)v43;
  v43(v37, v54);
  uint64_t v44 = (__n128 **)swift_task_alloc(async function pointer to AccountStoreProtocol.activeiTunesAccount(for:)[1]);
  v16[33].n128_u64[0] = (unint64_t)v44;
  v16[33].n128_u64[1] = sub_EEC8((uint64_t)v44, &qword_18968, &OBJC_CLASS___ACAccountStore_ptr);
  *uint64_t v44 = v16;
  v44[1] = (__n128 *)sub_A4D8;
  sub_F4F8();
  return AccountStoreProtocol.activeiTunesAccount(for:)( v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v54,  &v16[22],  &v16[18],  v55.n128_u64[1],  a13,  a14,  a15,  a16);
}

uint64_t sub_A4D8()
{
  if (v0) {
    sub_F5B0();
  }
  sub_F0FC();
  return sub_ED7C();
}

#error "A558: call analysis failed (funcsize=492)"
#error "AFF0: call analysis failed (funcsize=568)"
uint64_t sub_B670()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 560);
  *(void *)(*v1 + 568) = v0;
  swift_task_dealloc(v3);

  if (!v0) {
  sub_F0FC();
  }
  return sub_F2EC();
}

uint64_t sub_B6E0()
{
  uint64_t v0 = (uint64_t (*)(void))sub_FA90();
  return sub_F8B8(v0);
}

uint64_t sub_B724()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_B77C()
{
  *(void *)(v1 + 584) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_B7C8()
{
  uint64_t v1 = *(void **)(v0 + 320);

  uint64_t v2 = sub_F168();
  *(void *)(v0 + 552) = v2;
  *(void *)(v0 + 336) = v2;
  sub_EEC8(v2, &qword_18B08, &OBJC_CLASS___AMSAuthenticateTask_ptr);
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AuthenticateTaskProtocol.performAuthentication()[1]);
  *(void *)(v0 + 560) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_B670;
  uint64_t v4 = sub_FCC8();
  return dispatch thunk of AuthenticateTaskProtocol.performAuthentication()(v4);
}

uint64_t sub_B864()
{
  uint64_t v1 = *(void *)(v0 + 584);
  uint64_t v2 = *(void **)(v0 + 544);
  NSString v3 = sub_F2C4();
  NSString v4 = sub_ED88();
  uint64_t v5 = (void *)_convertErrorToNSError(_:)(v1);
  sub_FC28();
  (id)AMSError(v6, v7, v8, v9);

  swift_willThrow(v10);
  swift_errorRelease(v1);

  uint64_t v11 = *(void **)(v0 + 352);
  sub_FAB4(*(void *)(v0 + 488));
  sub_EF98();
  sub_EF6C();
  sub_F1C8();
  sub_F108();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_B954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_DE8C(a1, a2), (v5 & 1) != 0)) {
    return swift_unknownObjectRetain(*(void *)(*(void *)(a3 + 56) + 8 * v4));
  }
  else {
    return 0LL;
  }
}

double sub_B994@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_DEF0(a1), (v6 & 1) != 0))
  {
    sub_EBD8(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

uint64_t sub_B9E4( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(__int128 *__return_ptr, id *, uint64_t, id))
{
  id v27 = a1;
  uint64_t v9 = sub_E580(a1);
  if (!v9)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    goto LABEL_6;
  }

  uint64_t v10 = v9;
  id v11 = AIDAServiceTypeStore;
  sub_B994((uint64_t)v11, v10, &v25);

  swift_bridgeObjectRelease(v10);
  if (!*((void *)&v26 + 1))
  {
LABEL_6:
    sub_E760((uint64_t)&v25, &qword_18988);
    goto LABEL_7;
  }

  uint64_t v12 = sub_EC6C(0LL, &qword_18A38, &OBJC_CLASS___AMSSignInContext_ptr);
  if (swift_dynamicCast(&v24, &v25, (char *)&type metadata for Any + 8, v12, 6LL))
  {
    id v13 = v24;
    id v14 = [v24 canMakeAccountActive];
    goto LABEL_8;
  }

LABEL_7:
  id v13 = 0LL;
  id v14 = &dword_0 + 1;
LABEL_8:
  id v15 = [objc_allocWithZone(AMSAuthenticateOptions) init];
  sub_EC6C(0LL, (unint64_t *)&unk_18B10, &OBJC_CLASS___AMSProcessInfo_ptr);
  id v16 = sub_BCB0(0xD000000000000013LL, 0x8000000000012B60LL);
  [v15 setClientInfo:v16];

  id v17 = v27;
  objc_msgSend(v15, "setAllowServerDialogs:", objc_msgSend(v27, "operationUIPermissions") == (char *)&dword_0 + 1);
  objc_msgSend(v15, "setAuthenticationType:", objc_msgSend(v17, "operationUIPermissions") != (char *)&dword_0 + 1);
  [v15 setCanMakeAccountActive:v14];
  id v18 = [v15 clientInfo];
  [v18 setAccountMediaType:a2];

  NSString v19 = String._bridgeToObjectiveC()();
  [v15 setDebugReason:v19];

  if (v13) {
    id v20 = [v13 ignoreAccountConversion];
  }
  else {
    id v20 = &dword_0 + 1;
  }
  [v15 setIgnoreAccountConversion:v20];
  NSString v21 = String._bridgeToObjectiveC()();
  [v15 setLogKey:v21];

  a7(&v25, &v27, a3, v15);
  return v25;
}

id sub_BCB0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithBundleIdentifier:v5];

  return v6;
}

uint64_t sub_BD20(uint64_t a1, unint64_t a2, int a3)
{
  HIDWORD(v27) = a3;
  uint64_t v25 = a1;
  unint64_t v26 = a2;
  uint64_t v3 = type metadata accessor for Log(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin();
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.mediaServiceOwner.getter(v5, v8, v9, v10, v11, v12, v13, v14, v24, v25, v26, v27);
  uint64_t v15 = sub_9F94(&qword_18978);
  uint64_t v16 = *(void *)(type metadata accessor for LogInterpolation(0LL) - 8);
  uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))
        + 3LL * *(void *)(v16 + 72),
          *(unsigned __int8 *)(v16 + 80) | 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_11190;
  uint64_t v18 = sub_9F94(&qword_18980);
  id v19 = (id)AMSSetLogKeyIfNeeded();
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  uint64_t v22 = v21;

  static LogInterpolation.prefix<A>(_:_:)(v18, v20, v22, v18);
  swift_bridgeObjectRelease(v22);
  uint64_t v31 = &type metadata for StaticString;
  uint64_t v28 = v25;
  unint64_t v29 = v26;
  char v30 = BYTE4(v27);
  static LogInterpolation.traceableSensitive(_:)(&v28);
  sub_E760((uint64_t)&v28, &qword_18988);
  uint64_t v31 = &type metadata for String;
  uint64_t v28 = 0x64656873696E6966LL;
  unint64_t v29 = 0xE800000000000000LL;
  static LogInterpolation.safe(_:)(&v28);
  sub_E760((uint64_t)&v28, &qword_18988);
  Log.debug(_:)(v17);
  swift_bridgeObjectRelease(v17);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_BEE8(void (*a1)(char *, unint64_t), unint64_t a2, int a3, uint64_t a4)
{
  uint64_t v67 = a4;
  LODWORD(v78) = a3;
  unint64_t v77 = a2;
  uint64_t v70 = a1;
  uint64_t v4 = type metadata accessor for Log(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin();
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.mediaServiceOwner.getter(v6, v9, v10, v11, v12, v13, v14, v15, v62, v63, v64, v65);
  uint64_t v16 = sub_9F94(&qword_18978);
  uint64_t v17 = *(void *)(type metadata accessor for LogInterpolation(0LL) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v76 = v16;
  uint64_t v74 = v20 + 3 * v18;
  uint64_t v73 = v19 | 7;
  uint64_t v21 = swift_allocObject(v16, v74, v19 | 7);
  __int128 v72 = xmmword_11190;
  *(_OWORD *)(v21 + 16) = xmmword_11190;
  uint64_t v75 = v20;
  uint64_t v22 = sub_9F94(&qword_18980);
  id v23 = (id)AMSSetLogKeyIfNeeded();
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  uint64_t v26 = v25;

  uint64_t v71 = v22;
  static LogInterpolation.prefix<A>(_:_:)(v22, v24, v26, v22);
  swift_bridgeObjectRelease(v26);
  uint64_t v89 = &type metadata for StaticString;
  uint64_t v86 = (uint64_t)v70;
  unint64_t v87 = v77;
  char v88 = v78;
  static LogInterpolation.traceableSensitive(_:)(&v86);
  sub_E760((uint64_t)&v86, &qword_18988);
  uint64_t v89 = &type metadata for String;
  uint64_t v86 = 0x64657472617473LL;
  unint64_t v87 = 0xE700000000000000LL;
  static LogInterpolation.safe(_:)(&v86);
  sub_E760((uint64_t)&v86, &qword_18988);
  Log.debug(_:)(v21);
  swift_bridgeObjectRelease(v21);
  uint64_t v27 = *(void (**)(char *, unint64_t))(v5 + 8);
  uint64_t v28 = v67;
  unint64_t v77 = v4;
  uint64_t v70 = v27;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v27)(v8, v4);
  if (!v28) {
    return result;
  }
  uint64_t v69 = 2 * v18;
  uint64_t v30 = *(void *)(v28 + 64);
  uint64_t v64 = v28 + 64;
  uint64_t v31 = 1LL << *(_BYTE *)(v28 + 32);
  uint64_t v32 = -1LL;
  if (v31 < 64) {
    uint64_t v32 = ~(-1LL << v31);
  }
  unint64_t v33 = v32 & v30;
  uint64_t v66 = v85;
  id v68 = &v88;
  int64_t v65 = (unint64_t)(v31 + 63) >> 6;
  int64_t v63 = v65 - 1;
  uint64_t result = swift_bridgeObjectRetain(v28);
  int64_t v78 = 0LL;
  uint64_t v34 = v18;
  if (!v33) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v35 = __clz(__rbit64(v33));
  v33 &= v33 - 1;
  unint64_t v36 = v35 | (v78 << 6);
  while (2)
  {
    uint64_t v37 = *(void *)(v67 + 56);
    unint64_t v38 = (void *)(*(void *)(v67 + 48) + 16 * v36);
    uint64_t v39 = v38[1];
    *(void *)&__int128 v84 = *v38;
    *((void *)&v84 + 1) = v39;
    sub_EBD8(v37 + 32 * v36, (uint64_t)v66);
    swift_bridgeObjectRetain(v39);
    while (1)
    {
      sub_EC14((uint64_t)&v84, (uint64_t)&v86);
      unint64_t v44 = v87;
      if (!v87) {
        return swift_release(v67, v43);
      }
      uint64_t v45 = v86;
      uint64_t v46 = sub_EC5C(v68, &v84);
      static Log.mediaServiceOwner.getter(v46, v47, v48, v49, v50, v51, v52, v53, v62, v63, v64, v65);
      uint64_t v54 = swift_allocObject(v76, v74, v73);
      *(_OWORD *)(v54 + 16) = v72;
      id v55 = (id)AMSSetLogKeyIfNeeded();
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
      uint64_t v57 = v34;
      uint64_t v59 = v58;

      static LogInterpolation.prefix<A>(_:_:)(v71, v56, v59, v71);
      uint64_t v60 = v59;
      uint64_t v34 = v57;
      swift_bridgeObjectRelease(v60);
      unint64_t v80 = v44;
      uint64_t v81 = 58LL;
      unint64_t v82 = 0xE100000000000000LL;
      uint64_t v79 = v45;
      swift_bridgeObjectRetain(v44);
      uint64_t v79 = String.init<A>(_:)( &v79,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
      unint64_t v80 = v61;
      String.append<A>(contentsOf:)(&v81, &type metadata for String, &protocol witness table for String);
      swift_bridgeObjectRelease(v44);
      uint64_t v83 = &type metadata for String;
      uint64_t v81 = v79;
      unint64_t v82 = v80;
      static LogInterpolation.traceableSensitive(_:)(&v81);
      sub_E760((uint64_t)&v81, &qword_18988);
      sub_EBD8((uint64_t)&v84, (uint64_t)&v81);
      static LogInterpolation.traceableSensitive(_:)(&v81);
      sub_E760((uint64_t)&v81, &qword_18988);
      Log.debug(_:)(v54);
      swift_bridgeObjectRelease(v54);
      v70(v8, v77);
      uint64_t result = sub_E740(&v84);
      if (v33) {
        goto LABEL_5;
      }
LABEL_7:
      int64_t v40 = v78 + 1;
      if (__OFADD__(v78, 1LL))
      {
        __break(1u);
        goto LABEL_34;
      }

      if (v40 < v65)
      {
        unint64_t v41 = *(void *)(v64 + 8 * v40);
        if (v41) {
          goto LABEL_10;
        }
        int64_t v42 = v78 + 2;
        ++v78;
        if (v40 + 1 < v65)
        {
          unint64_t v41 = *(void *)(v64 + 8 * v42);
          if (v41) {
            goto LABEL_13;
          }
          int64_t v78 = v40 + 1;
          if (v40 + 2 < v65)
          {
            unint64_t v41 = *(void *)(v64 + 8 * (v40 + 2));
            if (v41)
            {
              v40 += 2LL;
              goto LABEL_10;
            }

            int64_t v78 = v40 + 2;
            if (v40 + 3 < v65)
            {
              unint64_t v41 = *(void *)(v64 + 8 * (v40 + 3));
              if (v41)
              {
                v40 += 3LL;
                goto LABEL_10;
              }

              int64_t v42 = v40 + 4;
              int64_t v78 = v40 + 3;
              if (v40 + 4 < v65) {
                break;
              }
            }
          }
        }
      }

LABEL_27:
      unint64_t v33 = 0LL;
      memset(v85, 0, sizeof(v85));
      __int128 v84 = 0u;
    }

    unint64_t v41 = *(void *)(v64 + 8 * v42);
    if (v41)
    {
LABEL_13:
      int64_t v40 = v42;
LABEL_10:
      unint64_t v33 = (v41 - 1) & v41;
      unint64_t v36 = __clz(__rbit64(v41)) + (v40 << 6);
      int64_t v78 = v40;
      continue;
    }

    break;
  }

  while (1)
  {
    int64_t v40 = v42 + 1;
    if (__OFADD__(v42, 1LL)) {
      break;
    }
    if (v40 >= v65)
    {
      int64_t v78 = v63;
      goto LABEL_27;
    }

    unint64_t v41 = *(void *)(v64 + 8 * v40);
    ++v42;
    if (v41) {
      goto LABEL_10;
    }
  }

LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_C4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a3;
  v4[18] = a4;
  v4[16] = a1;
  uint64_t v5 = sub_9F94(&qword_189C8);
  v4[19] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[20] = v6;
  v4[21] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_9F94(&qword_189D0);
  v4[22] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[23] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[24] = swift_task_alloc(v9);
  v4[25] = swift_task_alloc(v9);
  unint64_t v10 = (*(void *)(*(void *)(sub_9F94(&qword_188F0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[26] = swift_task_alloc(v10);
  v4[27] = swift_task_alloc(v10);
  return swift_task_switch(sub_C5D0, 0LL, 0LL);
}

uint64_t sub_C5D0()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v5 = sub_9F94(&qword_189D8);
  uint64_t inited = swift_initStackObject(v5, v0 + 2);
  *(_OWORD *)(inited + 16) = xmmword_11170;
  uint64_t v7 = (void *)AMSAccountMediaTypeProduction;
  uint64_t v46 = inited;
  *(void *)(inited + 32) = AMSAccountMediaTypeProduction;
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  id v9 = v7;
  sub_9FD4(v2, 1LL, 1LL, v8);
  unint64_t v10 = (void *)sub_EDA0((uint64_t)&unk_14920, 56LL);
  v10[2] = 0LL;
  uint64_t v11 = v10 + 2;
  v10[3] = 0LL;
  v10[4] = v4;
  v10[5] = v3;
  v10[6] = v9;
  sub_EA94(v2, v1);
  LODWORD(v1) = sub_DCAC(v1, 1LL, v8);
  id v12 = v9;
  uint64_t v13 = sub_FA20();
  uint64_t v14 = v0[26];
  if ((_DWORD)v1 == 1)
  {
    sub_F150(v13, &qword_188F0);
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 12544LL;
  }

  else
  {
    unsigned __int8 v18 = TaskPriority.rawValue.getter(v13);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v14, v8);
    uint64_t v17 = v18 | 0x3100LL;
    uint64_t v19 = *v11;
    if (*v11)
    {
      uint64_t v20 = v10[3];
      uint64_t ObjectType = swift_getObjectType(*v11);
      swift_unknownObjectRetain(v19);
      uint64_t v15 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v20);
      uint64_t v16 = v22;
      swift_unknownObjectRelease(v19);
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
    }
  }

  id v23 = (uint64_t *)v0[16];
  uint64_t v24 = *v23;
  uint64_t v25 = sub_EDA0((uint64_t)&unk_14948, 32LL);
  *(void *)(v25 + 16) = &unk_189E8;
  *(void *)(v25 + 24) = v10;
  uint64_t v26 = sub_9F94(&qword_189A0);
  uint64_t v27 = (void *)(v16 | v15);
  if (v16 | v15)
  {
    uint64_t v27 = v0 + 7;
    v0[7] = 0LL;
    v0[8] = 0LL;
    v0[9] = v15;
    v0[10] = v16;
  }

  uint64_t v29 = v0[24];
  uint64_t v28 = v0[25];
  uint64_t v30 = v0[22];
  uint64_t v45 = v0[23];
  v0[11] = 1LL;
  v0[12] = v27;
  v0[13] = v24;
  swift_task_create(v17, v0 + 11, v26, &unk_189F0, v25);

  uint64_t v33 = sub_FDE4(v31, v32);
  sub_F150(v33, &qword_188F0);
  swift_setDeallocating(v46);
  sub_DE40();
  v0[14] = *v23;
  uint64_t v34 = sub_9F94(&qword_189F8);
  type metadata accessor for AMSAccountMediaType(0LL);
  uint64_t v36 = v35;
  sub_EB9C(&qword_18A00, &qword_189F8, (uint64_t)&protocol conformance descriptor for TaskGroup<A>);
  AsyncCompactMapSequence.init(_:transform:)(v0 + 14, &unk_18C28, 0LL, v34, v36, v37);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v29, v28, v30);
  sub_EB9C(&qword_18A08, &qword_189D0, (uint64_t)&protocol conformance descriptor for AsyncCompactMapSequence<A, B>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v30, v38);
  sub_EB9C( &qword_18A10,  &qword_189C8,  (uint64_t)&protocol conformance descriptor for AsyncCompactMapSequence<A, B>.Iterator);
  v0[28] = v39;
  int64_t v40 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[29] = v40;
  *int64_t v40 = v0;
  v40[1] = sub_C910;
  sub_F4F8();
  return dispatch thunk of AsyncIteratorProtocol.next()(v41, v42, v43);
}

uint64_t sub_C910()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v4 = v2;
  sub_F148(v2[29], &v4);
  if (v0)
  {
    (*(void (**)(void, void))(v2[20] + 8LL))(v2[21], v2[19]);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  else
  {
    v2[30] = _swiftEmptyArrayStorage;
  }

  sub_F0FC();
  return sub_F2EC();
}

uint64_t sub_C988()
{
  uint64_t v1 = *(void *)(v0 + 120);
  if (v1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v0 + 240));
    uint64_t v3 = *(void **)(v0 + 240);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v3 = sub_E2E0(0LL, v3[2] + 1LL, 1, v3);
    }
    unint64_t v5 = v3[2];
    unint64_t v4 = v3[3];
    if (v5 >= v4 >> 1) {
      uint64_t v3 = sub_E2E0((void *)(v4 > 1), v5 + 1, 1, v3);
    }
    *(void *)(v0 + 248) = v3;
    v3[2] = v5 + 1;
    v3[v5 + 4] = v1;
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 256) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_CADC;
    return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 120, *(void *)(v0 + 152), *(void *)(v0 + 224));
  }

  else
  {
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 176);
    uint64_t v10 = *(void *)(v0 + 184);
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8LL))(*(void *)(v0 + 168), *(void *)(v0 + 152));
    sub_F698();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    sub_EE58();
    sub_EF98();
    sub_EF6C();
    sub_F1C8();
    sub_F2E4();
    return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 240));
  }

uint64_t sub_CADC()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v7 = v2;
  sub_F148(v2[32], &v7);
  if (v0)
  {
    (*(void (**)(void, void))(v2[20] + 8LL))(v2[21], v2[19]);
    sub_EDA8();
  }

  else
  {
    v2[30] = v2[31];
  }

  sub_F0FC();
  return swift_task_switch(v3, v4, v5);
}

uint64_t sub_CB58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(_BYTE *)(v8 + 360) = a8;
  *(void *)(v8 + 240) = a6;
  *(void *)(v8 + 248) = a7;
  *(void *)(v8 + 224) = a4;
  *(void *)(v8 + 232) = a5;
  *(void *)(v8 + 208) = a2;
  *(void *)(v8 + 216) = a3;
  *(void *)(v8 + 200) = a1;
  uint64_t v10 = type metadata accessor for Log(0LL);
  *(void *)(v8 + 256) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v8 + 264) = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v8 + 272) = swift_task_alloc(v12);
  *(void *)(v8 + 280) = swift_task_alloc(v12);
  *(void *)(v8 + 136) = a5;
  return swift_task_switch(sub_CBE0, 0LL, 0LL);
}

uint64_t sub_CBE0()
{
  uint64_t v1 = *(void **)(v0 + 232);
  *(void *)(v0 + 112) = v1;
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(AKAuthenticationAlternateDSIDKey);
  uint64_t v5 = v4;
  id v6 = v1;
  uint64_t v7 = sub_B954(v3, v5, v2);
  sub_EF74();
  if (v7)
  {
    *(void *)(v0 + 184) = v7;
    uint64_t v8 = sub_9F94(&qword_18B00);
    int v9 = sub_F514(v0 + 80, v0 + 184, v8, (uint64_t)&type metadata for String);
    if (v9) {
      uint64_t v10 = *(void *)(v0 + 80);
    }
    else {
      uint64_t v10 = 0LL;
    }
    if (v9) {
      uint64_t v7 = *(void *)(v0 + 88);
    }
    else {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(AKAuthenticationDSIDKey);
  uint64_t v14 = sub_B954(v12, v13, v11);
  sub_F65C();
  if (v14)
  {
    *(void *)(v0 + 168) = v14;
    uint64_t v15 = sub_9F94(&qword_18B00);
    int v16 = sub_F514(v0 + 176, v0 + 168, v15, (uint64_t)&type metadata for Int);
    if (v16) {
      uint64_t v17 = *(void *)(v0 + 176);
    }
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = v16 ^ 1u;
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 1LL;
  }

  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(AKAuthenticationUsernameKey);
  uint64_t v21 = sub_FD1C(v19, v20);
  uint64_t v22 = sub_F4F0();
  if (v21)
  {
    *(void *)(v0 + 152) = v21;
    uint64_t v23 = sub_9F94(&qword_18B00);
    uint64_t v22 = sub_F514(v0 + 96, v0 + 152, v23, (uint64_t)&type metadata for String);
    if ((_DWORD)v22) {
      uint64_t v24 = *(void *)(v0 + 96);
    }
    else {
      uint64_t v24 = 0LL;
    }
    if ((_DWORD)v22) {
      uint64_t v25 = *(void *)(v0 + 104);
    }
    else {
      uint64_t v25 = 0LL;
    }
  }

  else
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
  }

  uint64_t v26 = sub_EEC8(v22, &qword_18968, &OBJC_CLASS___ACAccountStore_ptr);
  *(void *)(v0 + 288) = v26;
  SynchronousAccountStoreProtocol.iTunesAccount(with:dsid:username:)( v10,  v7,  v17,  v18,  v24,  v25,  v26,  &protocol witness table for ACAccountStore);

  sub_F4F0();
  uint64_t v27 = sub_EDA8();
  uint64_t v37 = *(void **)(v0 + 144);
  if (!v37)
  {
    char v40 = *(_BYTE *)(v0 + 360);
    uint64_t v42 = *(void *)(v0 + 240);
    uint64_t v41 = *(void *)(v0 + 248);
    static Log.mediaServiceOwner.getter(v27, v28, v29, v30, v31, v32, v33, v34);
    sub_9F94(&qword_18978);
    uint64_t v43 = *(void *)(sub_EFA8() - 8);
    *(_OWORD *)(sub_F398( ((*(unsigned __int8 *)(v43 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))
                + 2LL * *(void *)(v43 + 72),
    *(void *)(v0 + 72) = sub_9F94(&qword_18980);
    uint64_t v44 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v0 + 48) = v44;
    uint64_t v45 = *(void **)(v0 + 136);
    *(void *)(v44 + 16) = v45;
    *(void *)(v44 + 24) = v42;
    *(void *)(v44 + 32) = v41;
    *(_BYTE *)(v44 + 40) = v40;
    id v46 = v45;
    uint64_t v47 = sub_F364();
    id v48 = (id)AMSLogKey(v47);
    if (v48)
    {
      sub_F7F4((uint64_t)v48);
      sub_F32C();
    }

    else
    {
      sub_F6F0();
    }

    sub_F0BC(v0 + 48);
    sub_EF74();
    sub_FEE0();
    LogInterpolation.init(stringLiteral:)(0x100000000000002ALL, 0x8000000000012770LL);
    sub_FEA0();
    sub_EDA8();
    sub_F6D4();
    NSString v51 = String._bridgeToObjectiveC()();
    NSString v52 = sub_ED88();
    (id)sub_F464(107LL);

    sub_FA5C();
    goto LABEL_24;
  }

  uint64_t v38 = *(void **)(v0 + 224);
  *(void *)(v0 + 160) = v37;
  if (([v38 canMakeAccountActive] & 1) == 0)
  {
    NSString v49 = sub_F2C4();
    NSString v50 = sub_ED88();
    (id)sub_F464(2LL);

    sub_FA5C();
LABEL_24:
    sub_F87C();
    sub_EE58();
    uint64_t v35 = (uint64_t (*)(void))sub_FD30();
    return sub_F3D0(v35);
  }

  uint64_t v39 = (void *)swift_task_alloc(async function pointer to AccountStoreProtocol.activeiTunesAccount(for:)[1]);
  *(void *)(v0 + 296) = v39;
  *uint64_t v39 = v0;
  v39[1] = sub_D014;
  return sub_F3EC();
}

uint64_t sub_D014()
{
  if (v0) {
    sub_F5B0();
  }
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_D05C(uint64_t a1)
{
  v1[15] = 0LL;
  uint64_t v2 = v1[26];
  uint64_t v3 = sub_EEC8(a1, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
  dispatch thunk of AccountProtocol.setActive(_:for:)(1LL, v2, v3, &protocol witness table for ACAccount);
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to AccountStoreProtocol.save(_:)[1]);
  v1[43] = v4;
  sub_FD64(v4, (uint64_t)sub_D6B0);
  return AccountStoreProtocol.save(_:)(v1 + 20);
}

uint64_t sub_D0F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14 = *(void **)(v12 + 120);
  if (!v14)
  {
    uint64_t v31 = *(void *)(v12 + 208);
    uint64_t v32 = sub_EEC8(v13, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
    dispatch thunk of AccountProtocol.setActive(_:for:)(1LL, v31, v32, &protocol witness table for ACAccount);
    uint64_t v33 = (void *)swift_task_alloc(async function pointer to AccountStoreProtocol.save(_:)[1]);
    *(void *)(v12 + 344) = v33;
    sub_FD64(v33, (uint64_t)sub_D6B0);
LABEL_17:
    sub_FABC();
    return AccountStoreProtocol.save(_:)(v39);
  }

  *(void *)(v12 + 128) = v14;
  uint64_t v15 = sub_EEC8(v13, &qword_18990, &OBJC_CLASS___ACAccount_ptr);
  id v16 = v14;
  uint64_t v17 = sub_FDD8();
  uint64_t v19 = v18;
  uint64_t v20 = sub_FDD8();
  uint64_t v28 = v21;
  if (!v19)
  {
    if (!v21) {
      goto LABEL_20;
    }

    uint64_t v34 = v28;
LABEL_14:
    swift_bridgeObjectRelease(v34);
    goto LABEL_15;
  }

  if (!v21)
  {

    uint64_t v34 = v19;
    goto LABEL_14;
  }

  if (v17 == v20 && v19 == v21)
  {
    sub_40B0();
    uint64_t v20 = sub_EDD0();
    goto LABEL_20;
  }

  char v30 = sub_F730(v17, v19, v20, v21);
  sub_40B0();
  uint64_t v20 = sub_EDD0();
  if ((v30 & 1) != 0)
  {
LABEL_20:
    char v43 = *(_BYTE *)(v12 + 360);
    uint64_t v45 = *(void **)(v12 + 240);
    uint64_t v44 = *(void *)(v12 + 248);
    static Log.mediaServiceOwner.getter(v20, v21, v22, v23, v24, v25, v26, v27);
    sub_9F94(&qword_18978);
    sub_EFA8();
    sub_FCA8();
    uint64_t v47 = sub_F398(v19 + 2LL * (void)&protocol witness table for ACAccount, v46);
    *(_OWORD *)(v47 + 16) = xmmword_111A0;
    *(void *)(v12 + 40) = sub_9F94(&qword_18980);
    uint64_t v48 = sub_ED70((uint64_t)&unk_148F8);
    *(void *)(v12 + 16) = v48;
    NSString v49 = *(void **)(v12 + 136);
    *(void *)(v48 + 16) = v49;
    *(void *)(v48 + 24) = v45;
    *(void *)(v48 + 32) = v44;
    *(_BYTE *)(v48 + 40) = v43;
    sub_F54C();
    id v50 = (id)AMSLogKey(v49);
    if (v50)
    {
      uint64_t v51 = sub_F6B0((uint64_t)v50);
      uint64_t v53 = v52;
    }

    else
    {
      uint64_t v51 = 0LL;
      uint64_t v53 = 0LL;
    }

    static LogInterpolation.prefix(_:_:)(v12 + 16, v51, v53);
    sub_EE60();
    sub_FEE0();
    sub_ED94(0xD000000000000055LL);
    sub_FB3C(v47);
    sub_EDA8();
    sub_F6D4();
    sub_F9D8();
    sub_F698();
    swift_task_dealloc(*(void *)(v12 + 280));
    sub_EF98();
    sub_FAD8();
    sub_FABC();
    return v55(v54, v55, v56, v57, v58, v59, v60, v61, a9, a10, a11, a12);
  }

LABEL_15:
  uint64_t v35 = *(void **)(v12 + 216);
  *(void *)(v12 + 192) = v16;
  id v36 = v16;
  if ([v35 shouldForceOperation])
  {
    uint64_t v37 = *(void *)(v12 + 208);
    *(void *)(v12 + 304) = v15;
    dispatch thunk of AccountProtocol.setActive(_:for:)(0LL, v37, v15, &protocol witness table for ACAccount);
    uint64_t v38 = (void *)swift_task_alloc(async function pointer to AccountStoreProtocol.save(_:)[1]);
    *(void *)(v12 + 312) = v38;
    sub_FD64(v38, (uint64_t)sub_D470);
    goto LABEL_17;
  }

  NSString v41 = sub_F2C4();
  NSString v42 = sub_ED88();
  (id)sub_FD10(106LL, (uint64_t)v41);

  sub_F408();
  sub_F9D8();

  sub_F87C();
  sub_EE58();
  return sub_F3D0(*(uint64_t (**)(void))(v12 + 8));
}

uint64_t sub_D470()
{
  *(void *)(v1 + 320) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_D4BC()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to AccountStoreProtocol.save(_:)[1]);
  v0[41] = v1;
  sub_FD64(v1, (uint64_t)sub_D534);
  return AccountStoreProtocol.save(_:)(v0 + 20);
}

uint64_t sub_D534()
{
  *(void *)(v1 + 336) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_D580()
{
  NSString v1 = sub_F198();
  sub_ED88();
  uint64_t v2 = sub_F9F4();
  id v3 = (id)sub_F36C(v2);
  sub_FD7C();

  sub_FA5C();
  sub_F5B0();
  sub_FE18();
  sub_F9D8();
  sub_F698();
  sub_F87C();
  sub_EE58();
  uint64_t v4 = (uint64_t (*)(void))sub_FD30();
  return sub_F0D4(v4);
}

uint64_t sub_D600()
{
  uint64_t v0 = sub_FAD8();
  return sub_F790(v0, v1);
}

uint64_t sub_D630()
{
  NSString v1 = sub_F198();
  sub_ED88();
  uint64_t v2 = sub_F9F4();
  id v3 = (id)sub_F36C(v2);
  sub_FD7C();

  sub_FA5C();
  sub_F5B0();
  sub_FE18();
  sub_F9D8();
  sub_F698();
  sub_F87C();
  sub_EE58();
  uint64_t v4 = (uint64_t (*)(void))sub_FD30();
  return sub_F0D4(v4);
}

uint64_t sub_D6B0()
{
  *(void *)(v1 + 352) = v0;
  swift_task_dealloc(v2);
  sub_F0FC();
  return sub_ED7C();
}

uint64_t sub_D6FC()
{
  uint64_t v0 = sub_FAD8();
  return sub_F790(v0, v1);
}

uint64_t sub_D728()
{
  NSString v1 = sub_F198();
  sub_ED88();
  uint64_t v2 = sub_F9F4();
  id v3 = (id)sub_F36C(v2);
  sub_FD7C();

  sub_FA5C();
  sub_F5B0();
  sub_F9D8();
  sub_F698();
  sub_F87C();
  sub_EE58();
  uint64_t v4 = (uint64_t (*)(void))sub_FD30();
  return sub_F0D4(v4);
}

uint64_t sub_D7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + a2 - 40);
  uint64_t v4 = *(void *)(a3 + a2 - 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, v4, v3, &unk_11B50, &unk_11B70);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v4,  v3,  AssociatedTypeWitness,  &unk_11B50,  &unk_11B60);
  return dispatch thunk of RawRepresentable.rawValue.getter( AssociatedTypeWitness,  *(void *)(AssociatedConformanceWitness + 16));
}

unint64_t *sub_D834(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_E3F8(0LL, v3, 0);
    uint64_t v5 = (unint64_t *)&_swiftEmptyArrayStorage;
    id v6 = (id *)(a1 + 32);
    do
    {
      id v15 = *v6;
      id v7 = v15;
      swift_getAtKeyPath(v16, &v15, a2);

      unint64_t v9 = v16[0];
      unint64_t v10 = v16[1];
      uint64_t v17 = v5;
      unint64_t v12 = v5[2];
      unint64_t v11 = v5[3];
      if (v12 >= v11 >> 1)
      {
        sub_E3F8((char *)(v11 > 1), v12 + 1, 1);
        uint64_t v5 = v17;
      }

      v5[2] = v12 + 1;
      uint64_t v13 = &v5[2 * v12];
      v13[4] = v9;
      v13[5] = v10;
      ++v6;
      --v3;
    }

    while (v3);
    swift_release(a2, v8);
  }

  else
  {
    swift_release(a2, a2);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }

  return v5;
}

id sub_D94C(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v6 = [v2 initWithAuthenticationResults:isa options:a2];

  return v6;
}

uint64_t sub_D9D0(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_ED60;
  return v6();
}

uint64_t sub_DA28()
{
  NSString v1 = (void *)sub_FD28();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_F124(v1, (uint64_t)sub_ED60);
  return sub_F0E8(v2, v3, v4, v5, v6);
}

uint64_t sub_DA6C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  id v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_ED60;
  return v7();
}

uint64_t sub_DAC4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_DAF0()
{
  uint64_t v1 = swift_task_alloc(dword_1890C);
  uint64_t v2 = (void *)sub_FA6C(v1);
  *uint64_t v2 = v0;
  v2[1] = sub_ED60;
  sub_FC28();
  return v3();
}

uint64_t sub_DB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_DCAC(a1, 1LL, v6) == 1)
  {
    sub_E760(a1, &qword_188F0);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v14 = v13;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = swift_allocObject(&unk_14880, 32LL, 7LL);
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    id v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    id v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_18920, v15);
}

uint64_t sub_DCAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_DCB8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_DD1C;
  return v6(a1);
}

uint64_t sub_DD1C()
{
  uint64_t v0 = (uint64_t (*)(void))sub_FA90();
  return sub_F79C(v0);
}

uint64_t sub_DD50(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_DD74()
{
  uint64_t v0 = swift_task_alloc(dword_1891C);
  uint64_t v1 = (void *)sub_FA6C(v0);
  uint64_t v2 = sub_F770(v1);
  return sub_F6C4(v2, v3, v4, v5);
}

uint64_t sub_DDC0()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_DDFC()
{
  uint64_t v1 = (void *)sub_FD28();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_F124(v1, (uint64_t)sub_ED60);
  return sub_F0E8(v2, v3, v4, v5, v6);
}

uint64_t sub_DE40()
{
  uint64_t v1 = *(void *)(v0 + 16);
  type metadata accessor for AMSAccountMediaType(0LL);
  swift_arrayDestroy(v0 + 32, v1, v2);
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

unint64_t sub_DE8C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_DF70(a1, a2, v5);
}

unint64_t sub_DEF0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_E050(a1, v7);
}

unint64_t sub_DF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_E050(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

void *sub_E1C4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_9F94(&qword_18998);
    uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 8);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &a4[v8 + 4] <= v11 + 4) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v14 = sub_9F94(&qword_18970);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v14);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_E2E0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_9F94(&qword_189D8);
    uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 8);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &a4[v8 + 4] <= v11 + 4) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    type metadata accessor for AMSAccountMediaType(0LL);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v14);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_E3F8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_E414(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_E414(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_9F94(qword_18B38);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[16 * v8] <= v13) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v13, v14, v8, &type metadata for String);
  }

  swift_release(a4, v14);
  return v11;
}

uint64_t sub_E510(void *a1)
{
  id v1 = [a1 authenticationResults];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_9F94(&qword_18B00);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  v3,  &protocol witness table for String);

  return v4;
}

uint64_t sub_E580(void *a1)
{
  id v1 = [a1 signInContexts];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  type metadata accessor for AIDAServiceType(0LL);
  uint64_t v4 = v3;
  unint64_t v5 = sub_ECA4();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, v4, (char *)&type metadata for Any + 8, v5);

  return v6;
}

uint64_t sub_E5F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v18 = *(void *)a2;
  uint64_t v19 = *(void *)(a2 + 8);
  uint64_t v20 = *(void *)(a2 + 16);
  uint64_t v21 = *(unsigned __int8 *)(a2 + 24);
  char v22 = (void *)swift_task_alloc(dword_18A1C);
  *(void *)(v16 + 16) = v22;
  *char v22 = v16;
  v22[1] = sub_ED58;
  return sub_9FE0(a1, v18, v19, v20, v21, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_E670()
{
  id v1 = (void *)swift_task_alloc(dword_18954);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_E6D4;
  uint64_t v2 = sub_FEC0();
  return v3(v2);
}

uint64_t sub_E6D4(uint64_t a1)
{
  return sub_F7A8(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_E714()
{
  swift_release(*(void *)(v0 + 32), v1);
  return swift_deallocObject(v0, 41LL, 7LL);
}

uint64_t sub_E740(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = *(void *)(v1 - 8);
  if ((*(_BYTE *)(v2 + 82) & 2) != 0) {
    return swift_release(*a1, v1);
  }
  else {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

void sub_E760(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_9F94(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_40C8();
}

void *sub_E798(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_E7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v10 = (void *)swift_task_alloc(dword_189C4);
  *(void *)(v5 + 24) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_E848;
  return sub_C4F8(a2, a3, a4, a5);
}

uint64_t sub_E848(uint64_t a1)
{
  uint64_t v4 = *(void **)(v3 + 16);
  sub_EDD8();
  *uint64_t v4 = a1;
  return sub_F8B8(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_E880(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v8 = *(unsigned __int8 *)(v2 + 16);
  uint64_t v9 = swift_task_alloc(dword_189AC);
  uint64_t v10 = (void *)sub_FA6C(v9);
  *uint64_t v10 = v3;
  v10[1] = sub_ED60;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_189A8 + dword_189A8))( a1,  a2,  v8,  v6,  v7);
}

uint64_t sub_E904(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_E96C;
  return v5(v2 + 16);
}

uint64_t sub_E96C()
{
  uint64_t v1 = (void *)*v0;
  uint64_t v5 = v1;
  uint64_t v2 = (void *)v1[3];
  sub_F148(v1[4], &v5);
  *uint64_t v2 = v1[2];
  uint64_t v3 = (uint64_t (*)(void))sub_FA90();
  return sub_F8B8(v3);
}

uint64_t sub_E9B0()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_E9E4()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = swift_task_alloc(dword_18C34);
  uint64_t v5 = (void *)sub_FA6C(v4);
  *uint64_t v5 = v1;
  v5[1] = sub_EA58;
  sub_FC28();
  return sub_10508(v6, v7, v8, v9, v2, v3);
}

uint64_t sub_EA58()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_EA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9F94(&qword_188F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_EADC()
{
  uint64_t v0 = swift_task_alloc(dword_189E4);
  uint64_t v1 = (void *)sub_FA6C(v0);
  uint64_t v2 = sub_F770(v1);
  return sub_F6C4(v2, v3, v4, v5);
}

uint64_t sub_EB24()
{
  return sub_F79C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_EB58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void sub_EB9C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = sub_EB58(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_40C8();
}

uint64_t sub_EBD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_EC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9F94(&qword_18A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_EC5C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_EC6C(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_ECA4()
{
  unint64_t result = qword_18780;
  if (!qword_18780)
  {
    type metadata accessor for AIDAServiceType(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10F2C, v1);
    atomic_store(result, (unint64_t *)&qword_18780);
  }

  return result;
}

uint64_t sub_ECE8()
{
  return 48LL;
}

__n128 sub_ECF4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

unint64_t sub_ED08()
{
  unint64_t result = qword_18B28;
  if (!qword_18B28)
  {
    uint64_t v1 = sub_EC6C(255LL, &qword_18948, &OBJC_CLASS___AIDAServiceContext_ptr);
    unint64_t result = swift_getWitnessTable(&unk_10D84, v1);
    atomic_store(result, (unint64_t *)&qword_18B28);
  }

  return result;
}

uint64_t sub_ED70(uint64_t a1)
{
  return swift_allocObject(a1, 41LL, 7LL);
}

uint64_t sub_ED7C()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

NSString sub_ED88()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_ED94(uint64_t a1)
{
  return LogInterpolation.init(stringLiteral:)(a1, (v1 - 32) | 0x8000000000000000LL);
}

uint64_t sub_EDA0(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_EDA8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_EDB0(uint64_t a1)
{
  return static LogInterpolation.prefix(_:_:)(a1, v2, v1);
}

uint64_t sub_EDBC()
{
  return LogInterpolation.init(stringLiteral:)(0xD000000000000010LL, (v0 - 32) | 0x8000000000000000LL);
}

uint64_t sub_EDD0()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_EDD8()
{
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_EDE8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_EE04()
{
  return ((uint64_t (*)(void))AccountStoreProtocol.activeiTunesAccount(for:))();
}

uint64_t sub_EE20(uint64_t a1)
{
  return swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL))
         + 3LL * *(void *)(*(void *)(a1 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) | 7LL);
}

void sub_EE48()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_EE58()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_EE60()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_EE68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  return static LogInterpolation.prefix(_:_:)(a20, v20, v21);
}

uint64_t sub_EEC8(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_EC6C(0LL, a2, a3);
}

uint64_t sub_EED0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_allocObject(v2, a1, a2 | 7);
}

uint64_t sub_EEDC()
{
  return type metadata accessor for LogInterpolation(0LL);
}

uint64_t sub_EEE8()
{
  return v0 + 1;
}

uint64_t sub_EF4C()
{
  return sub_BD20(v0, 0x17uLL, 2);
}

uint64_t sub_EF6C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_EF74()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_EF7C(uint64_t a1)
{
  *(void *)(v1 + 432) = a1;
  *(void *)(a1 + 16) = *(void *)(v1 + 544);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  return swift_retain(v2);
}

uint64_t sub_EF98()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_EFA0(uint64_t a1, unint64_t a2)
{
  return sub_BD20(a1, a2, 2);
}

uint64_t sub_EFA8()
{
  return type metadata accessor for LogInterpolation(0LL);
}

uint64_t sub_EFB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

  ;
}

uint64_t sub_F000( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_F044(uint64_t a1)
{
  *(void *)(a1 + 32) = v1;
  *(_BYTE *)(a1 + 40) = v2;
  return swift_retain(v1);
}

uint64_t sub_F054( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

void *sub_F094()
{
  return sub_E1C4(0LL, v0[2] + 1LL, 1, v0);
}

uint64_t sub_F0AC()
{
  return 1LL;
}

uint64_t sub_F0BC(uint64_t a1)
{
  return static LogInterpolation.prefix(_:_:)(a1, v2, v1);
}

void sub_F0C8()
{
}

uint64_t sub_F0D4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_F0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

  ;
}

uint64_t sub_F108()
{
  return swift_task_dealloc(v0);
}

void *sub_F110(void *a1, int64_t a2)
{
  return sub_E1C4(a1, a2, 1, v2);
}

id sub_F11C(double a1)
{
  return *(id *)&a1;
}

uint64_t sub_F124@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_F148@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v2;
  return swift_task_dealloc(a1);
}

void sub_F150(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_F158(uint64_t a1)
{
  *(void *)(a1 + 32) = v1;
  *(_BYTE *)(a1 + 40) = v2;
  return swift_retain(v1);
}

uint64_t sub_F168()
{
  return sub_B9E4( *(void **)(v0 + 384),  *(void *)(v0 + 376),  *(void *)(v0 + 368),  *(void *)(v0 + 400),  *(void *)(v0 + 408),  *(void *)(v0 + 288),  *(void (**)(__int128 *__return_ptr, id *, uint64_t, id))(v0 + 424));
}

NSString sub_F184()
{
  return String._bridgeToObjectiveC()();
}

NSString sub_F198()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_F1B4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 16LL))(a1, v2, v1);
}

uint64_t sub_F1C8()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_F1D0()
{
  *(void *)(v1 + 336) = v0;
  *(void *)(v1 + 344) = (v2 - 32) | 0x8000000000000000LL;
  return static LogInterpolation.traceableSensitive(_:)(v3);
}

uint64_t sub_F1E4()
{
  return AMSErrorWithMultipleUnderlyingErrors(15LL, v0, v1, v2);
}

  ;
}

  ;
}

uint64_t sub_F270( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_F284(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v1, v2);
}

uint64_t sub_F298( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_F2AC()
{
  return static LogInterpolation.traceableSensitive(_:)(v0);
}

uint64_t sub_F2B4()
{
  return 0LL;
}

NSString sub_F2C4()
{
  return String._bridgeToObjectiveC()();
}

void sub_F2CC(uint64_t a1@<X8>)
{
  v1[84] = a1;
  v1[86] = *(void *)(v1[82] + 8 * a1 + 32);
}

uint64_t sub_F2E4()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_F2EC()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

__n128 sub_F2F8()
{
  return v0[45];
}

void sub_F32C()
{
}

uint64_t sub_F338()
{
  return swift_getErrorValue(*(void *)(v1 + 32), v0 + 680, v0 + 656);
}

uint64_t sub_F364()
{
  return swift_retain(v0);
}

uint64_t sub_F36C(uint64_t a1)
{
  return AMSError(105LL, v1, v2, a1);
}

uint64_t sub_F384()
{
  return swift_bridgeObjectRelease(v0);
}

NSArray sub_F38C()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_F398@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_allocObject(v2, a1, a2 | 7);
}

uint64_t sub_F3A4()
{
  return swift_getErrorValue(*(void *)(v0 + 32), v1 + 680, v1 + 656);
}

uint64_t sub_F3D0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_F3EC()
{
  return ((uint64_t (*)(void))AccountStoreProtocol.activeiTunesAccount(for:))();
}

uint64_t sub_F408()
{
  return swift_willThrow();
}

uint64_t sub_F410(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

  ;
}

uint64_t sub_F448()
{
  return ((uint64_t (*)(void))AccountStoreProtocol.save(_:))();
}

uint64_t sub_F464(uint64_t a1)
{
  return AMSError(a1, v2, v1, 0LL);
}

void *sub_F474()
{
  *(void *)(v1 + 392) = *(void *)(v1 + 496);
  return sub_E798(v0);
}

uint64_t sub_F484()
{
  return swift_getErrorValue(*(void *)(v0 + 32), v1 + 512, v1 + 488);
}

uint64_t sub_F4AC()
{
  return swift_getErrorValue(*(void *)(v0 + 32), v1 + 512, v1 + 488);
}

uint64_t sub_F4D4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_F4F0()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_F514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 6LL);
}

  ;
}

uint64_t sub_F530()
{
  return static LogInterpolation.traceableSensitive(_:)(v0);
}

void sub_F538()
{
  *(void *)(v1 + 296) = v0;
}

uint64_t sub_F54C()
{
  return swift_retain(v0);
}

void sub_F554()
{
  *(void *)(v1 + 360) = v0;
}

uint64_t sub_F568( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  *(void *)(v11 + 240) = a1;
  *(void *)(a1 + 16) = *(void *)(v11 + 544);
  *(void *)(a1 + 24) = a10;
  *(void *)(a1 + 32) = v12;
  *(_BYTE *)(a1 + 40) = a11;
  return swift_retain(v12);
}

uint64_t sub_F58C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 240) = a1;
  *(void *)(a1 + 16) = *(void *)(v10 + 544);
  *(void *)(a1 + 24) = a9;
  *(void *)(a1 + 32) = v11;
  *(_BYTE *)(a1 + 40) = a10;
  return swift_retain(v11);
}

uint64_t sub_F5B0()
{
  return swift_errorRelease(v0);
}

uint64_t sub_F5B8(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

__n128 *sub_F5C0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x5465636976726573LL;
  result[2].n128_u64[1] = 0xEB00000000657079LL;
  return result;
}

  ;
}

uint64_t sub_F600( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  return a7();
}

uint64_t sub_F614@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v2;
  a1[1] = a2;
  return *(void *)(v2 + 16);
}

id sub_F63C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 48) = *(void *)(a1 + 16);
  return v1;
}

uint64_t sub_F65C()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_F664(uint64_t a1)
{
}

uint64_t sub_F66C()
{
  return swift_retain(v0);
}

void sub_F674()
{
  void *v0 = *v1;
}

void sub_F680()
{
}

void sub_F68C()
{
}

void sub_F698()
{
}

uint64_t sub_F6A0()
{
  return swift_task_dealloc(*(void *)(v0 + 488));
}

uint64_t sub_F6B0(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_F6B8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_F6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_F6D4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_F6E4(uint64_t a1)
{
  return static LogInterpolation.prefix(_:_:)(a1, v2, v1);
}

  ;
}

uint64_t sub_F6FC()
{
  *(void *)(v1 + 472) = 0xD000000000000015LL;
  *(void *)(v1 + 480) = (v0 - 32) | 0x8000000000000000LL;
  return static LogInterpolation.traceableSensitive(_:)(v2);
}

uint64_t sub_F718()
{
  return Log.default(_:)(v0);
}

uint64_t sub_F724()
{
  return Log.error(_:)(v0);
}

uint64_t sub_F730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
}

uint64_t sub_F738()
{
  return Log.error(_:)(v0);
}

uint64_t sub_F744()
{
  *(void *)(v0 + 472) = 0xD000000000000015LL;
  *(void *)(v0 + 480) = (v1 - 32) | 0x8000000000000000LL;
  return static LogInterpolation.traceableSensitive(_:)(v2);
}

uint64_t sub_F760( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t (*a13)(uint64_t, uint64_t))
{
  return a13(v13, a11);
}

uint64_t sub_F770(void *a1)
{
  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_F790(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_F79C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_F7A8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void *sub_F7B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  *(void *)(v20 + 464) = *(void *)(v20 + 640);
  return sub_E798(a20);
}

  ;
}

uint64_t sub_F7E0(uint64_t a1)
{
  return swift_task_switch(a1, 0LL, 0LL);
}

uint64_t sub_F7EC()
{
  return swift_errorRetain(v0);
}

uint64_t sub_F7F4(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_F7FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v14 + 272) = v12;
  *(void *)(v14 + 280) = (v13 - 32) | 0x8000000000000000LL;
  return static LogInterpolation.traceableSensitive(_:)(a12);
}

uint64_t sub_F814(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

void *sub_F81C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21)
{
  *(void *)(v21 + 464) = *(void *)(v21 + 640);
  return sub_E798(a21);
}

uint64_t sub_F834(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

  ;
}

uint64_t sub_F85C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_F864(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v1, v2);
}

uint64_t sub_F87C()
{
  return swift_task_dealloc(*(void *)(v0 + 280));
}

uint64_t sub_F884()
{
  return swift_setDeallocating(*(void *)(v0 + 856));
}

uint64_t sub_F898()
{
  return swift_setDeallocating(*(void *)(v0 + 856));
}

void sub_F8AC()
{
}

uint64_t sub_F8B8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_F8C0()
{
  return AMSErrorWithMultipleUnderlyingErrors(100LL, v2, v0, v1);
}

uint64_t sub_F8D4()
{
  return AMSErrorWithMultipleUnderlyingErrors(100LL, v1, v2, v0);
}

uint64_t sub_F8E8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v1, v2);
}

void sub_F8FC()
{
  uint64_t v5 = *(void **)(v3 + 688);
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 32 + 8 * v4) = v1;
}

uint64_t sub_F910()
{
  return swift_retain(v0);
}

uint64_t sub_F918(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v1, v2);
}

void *sub_F92C()
{
  *(void *)(v1 + 624) = *(void *)(v1 + 664);
  return sub_E798(v0);
}

void *sub_F940( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  *(void *)(v16 + 328) = *(void *)(v16 + 472);
  return sub_E798(a16);
}

void *sub_F954( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  *(void *)(v15 + 328) = *(void *)(v15 + 472);
  return sub_E798(a15);
}

uint64_t sub_F968( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return swift_getErrorValue(v15, a14, a15);
}

uint64_t sub_F97C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return swift_getErrorValue(v14, a13, a14);
}

void sub_F990()
{
}

uint64_t sub_F99C()
{
  return LogInterpolation.init(stringLiteral:)(0x100000000000002BLL, (v0 - 32) | 0x8000000000000000LL);
}

uint64_t sub_F9B0()
{
  return swift_task_alloc(v0);
}

uint64_t sub_F9BC()
{
  return static LogInterpolation.traceableSensitive(_:)(v0);
}

uint64_t sub_F9C4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v1, v2);
}

void sub_F9D8()
{
}

id sub_F9E0@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

uint64_t sub_F9F4()
{
  return _convertErrorToNSError(_:)(v0);
}

uint64_t sub_FA00()
{
  return static LogInterpolation.traceableSensitive(_:)(v0);
}

uint64_t sub_FA08(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(v2, a2, v3);
}

uint64_t sub_FA14()
{
  return Log.default(_:)(v0);
}

uint64_t sub_FA20()
{
  return swift_retain(v0);
}

void *sub_FA28()
{
  *(void *)(v0 + 624) = *(void *)(v0 + 664);
  return sub_E798(v1);
}

  ;
}

uint64_t sub_FA48()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 656));
}

uint64_t sub_FA5C()
{
  return swift_willThrow();
}

uint64_t sub_FA64(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, v2);
}

uint64_t sub_FA6C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

__n128 sub_FA78()
{
  return v0[45];
}

uint64_t sub_FA90()
{
  return *(void *)(v0 + 8);
}

  ;
}

uint64_t sub_FAB4(uint64_t a1)
{
  return swift_task_dealloc(a1);
}

  ;
}

uint64_t sub_FAD8()
{
  return v0;
}

uint64_t sub_FAE8(uint64_t result)
{
  *(void *)(v1 + 704) = result;
  return result;
}

  ;
}

uint64_t sub_FB0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 8))(v11, a11);
}

uint64_t sub_FB1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return Log.error(_:)(a14);
}

void sub_FB2C()
{
}

uint64_t sub_FB34(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, v2);
}

uint64_t sub_FB3C(uint64_t a1)
{
  return Log.default(_:)(a1);
}

uint64_t sub_FB44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a14 + 8))(v15, a15);
}

void sub_FB54()
{
}

uint64_t sub_FB5C(uint64_t a1)
{
  return Log.error(_:)(a1);
}

uint64_t sub_FB64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return swift_getErrorValue(v17, a16, a17);
}

  ;
}

  ;
}

uint64_t sub_FBAC()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 656));
}

uint64_t sub_FBBC()
{
  return swift_errorRetain(*(void *)(v0 + 32));
}

  ;
}

uint64_t sub_FBE8()
{
  return sub_E740(v0);
}

uint64_t sub_FC00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t (*a13)(uint64_t, uint64_t))
{
  return a13(v13, v14);
}

uint64_t sub_FC10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v11, a10);
}

void sub_FC20(uint64_t a1)
{
}

  ;
}

void sub_FC38(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_FC40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return swift_task_dealloc(a17);
}

uint64_t sub_FC48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, a14);
}

void sub_FC58()
{
  *(void *)(v1 + 408) = 0xD000000000000015LL;
  *(void *)(v1 + 416) = (v0 - 32) | 0x8000000000000000LL;
}

uint64_t sub_FC70()
{
  return static LogInterpolation.traceableSensitive(_:)(v0);
}

void sub_FC78()
{
}

uint64_t sub_FC80()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_FC88(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_FC90()
{
  return sub_E740(v0);
}

uint64_t sub_FC98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

void sub_FCA0(uint64_t a1)
{
}

  ;
}

uint64_t sub_FCC0()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_FCC8()
{
  return v0;
}

uint64_t sub_FCD8()
{
  return swift_allocObject(v1, v0, v2);
}

uint64_t sub_FCE8()
{
  return swift_allocObject(v0, v1, v2);
}

uint64_t sub_FCF8()
{
  return static LogInterpolation.traceableSensitive(_:)(v0);
}

uint64_t sub_FD04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return swift_allocObject(a1, v9, a9);
}

uint64_t sub_FD10(uint64_t a1, uint64_t a2)
{
  return AMSError(a1, a2, v2, 0LL);
}

uint64_t sub_FD1C(uint64_t a1, uint64_t a2)
{
  return sub_B954(a1, a2, v2);
}

uint64_t sub_FD28()
{
  return swift_task_alloc(*(unsigned int *)(v0 + 4));
}

uint64_t sub_FD30()
{
  return *(void *)(v0 + 8);
}

__n128 *sub_FD3C( __n128 *result, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  result[1] = a2;
  *(void *)(v11 + 400) = a11;
  return result;
}

__n128 *sub_FD50(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = v2;
  return result;
}

uint64_t sub_FD5C(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

void *sub_FD64@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *unint64_t result = v2;
  result[1] = a2;
  return result;
}

void sub_FD70()
{
}

void sub_FD7C()
{
}

uint64_t sub_FD84()
{
  return swift_errorRetain(v0);
}

void sub_FD90(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_FD98()
{
  return v2(v0, v1);
}

void sub_FDA4()
{
  *(void *)(v1 + 592) = v0;
  *(void *)(v1 + 568) = 0xD000000000000015LL;
}

uint64_t sub_FDB8()
{
  return v2(v0, v1);
}

uint64_t sub_FDC4()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_FDD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return swift_task_dealloc(a16);
}

uint64_t sub_FDD8()
{
  return dispatch thunk of AccountProtocol.altDSID.getter(v0, v1);
}

uint64_t sub_FDE4(uint64_t a1, uint64_t a2)
{
  return swift_release(v2, a2);
}

uint64_t sub_FDEC()
{
  return swift_task_alloc(v0);
}

void sub_FDF8(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_FE00()
{
  return swift_task_dealloc(*(void *)(v0 + 280));
}

uint64_t sub_FE0C(uint64_t a1, uint64_t a2)
{
  return sub_B954(a1, a2, v2);
}

void sub_FE18()
{
}

uint64_t sub_FE20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return static Log.mediaServiceOwner.getter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

__n128 sub_FE2C( __n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  *(void *)(v12 + 376) = a1;
  __n128 result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

NSArray sub_FE40()
{
  return Array._bridgeToObjectiveC()();
}

  ;
}

uint64_t sub_FE58()
{
  return v0 + 30;
}

  ;
}

  ;
}

void sub_FE8C()
{
}

id sub_FE98()
{
  return v0;
}

uint64_t sub_FEA0()
{
  return Log.error(_:)(v0);
}

uint64_t sub_FEAC()
{
  return Log.error(_:)(v0);
}

uint64_t sub_FEB8()
{
  return Log.default(_:)(v0);
}

uint64_t sub_FEC0()
{
  return v0;
}

uint64_t sub_FECC()
{
  return 0x1000000000000030LL;
}

uint64_t sub_FEE0()
{
  return sub_E740(v0);
}

void sub_FEE8()
{
}

uint64_t sub_FEF0(uint64_t a1, uint64_t a2)
{
  return sub_B954(a1, a2, v2);
}

uint64_t sub_FEFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 64LL);
}

uint64_t sub_FF04(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for () + 64;
    v4[2] = &unk_11238;
    swift_initStructMetadata(a1, 0LL, 3LL, v4, a1 + 64);
    return 0LL;
  }

  return result;
}

uint64_t *sub_FF88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 17 > 0x18)
  {
    uint64_t v11 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v11 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v9 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v10 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v11 = *(void *)(v10 + 8);
    *(void *)unint64_t v9 = *(void *)v10;
    *(void *)(v9 + 8) = v11;
    *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  }

  swift_retain(v11);
  return v4;
}

uint64_t sub_10040(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8LL);
  (*(void (**)(void))(v3 + 8))();
  return swift_release(*(void *)((char *)&dword_8 + ((a1 + *(void *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFF8LL)), v4);
}

uint64_t sub_10080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v9 = *(void *)(v8 + 8);
  *(void *)unint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = v9;
  *(_BYTE *)(v7 + 16) = *(_BYTE *)(v8 + 16);
  swift_retain(v9);
  return a1;
}

uint64_t sub_100E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void *)(v7 + 8);
  *(void *)unint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = v9;
  swift_retain(v9);
  swift_release(v10, v11);
  *(_BYTE *)(v7 + 16) = *(_BYTE *)(v8 + 16);
  return a1;
}

uint64_t sub_1015C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 32))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8LL;
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(_BYTE *)(v7 + 16) = *(_BYTE *)(v8 + 16);
  return a1;
}

uint64_t sub_101C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v9 = *(void *)(v7 + 8);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  swift_release(v9, v10);
  *(_BYTE *)(v7 + 16) = *(_BYTE *)(v8 + 16);
  return a1;
}

uint64_t sub_1022C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = *(void *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      unint64_t v15 = *(void *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }

    else
    {
      return sub_DCAC(a1, v6, v4);
    }
  }

  else
  {
    unsigned int v9 = ((v8 + 7) & 0xFFFFFFF8) + 17;
    unsigned int v10 = (a2 - v7 + 255) >> (8 * v9);
    if (v9 < 4) {
      unsigned int v11 = v10 + 1;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_102B4 + 4 * byte_11210[v13]))();
  }

void sub_10344(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  size_t v7 = ((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 17;
  if (v6 >= a3)
  {
    int v10 = 0;
  }

  else
  {
    else {
      unsigned int v8 = 2;
    }
    if (v8 >= 0x10000) {
      int v9 = 4;
    }
    else {
      int v9 = 2;
    }
    if (v8 < 0x100) {
      int v9 = 1;
    }
    if (v8 >= 2) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
  }

  if (v6 < a2)
  {
    int v11 = ~v6 + a2;
    int v12 = (~(_BYTE)v6 + a2);
    else {
      int v13 = v12;
    }
    bzero(a1, v7);
    if ((_DWORD)v7 == 1) {
      *a1 = v13;
    }
    else {
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }

  __asm { BR              X11 }

void sub_1045C()
{
  *(_BYTE *)(v0 + swift_release(*(void *)(v0 + 40), v1) = v2;
  JUMPOUT(0x104D0LL);
}

void sub_10464(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + v3) = 0;
  if (a2) {
    JUMPOUT(0x1046CLL);
  }
  JUMPOUT(0x104D0LL);
}

void sub_104A8()
{
  *(_WORD *)(v0 + swift_release(*(void *)(v0 + 40), v1) = v2;
  JUMPOUT(0x104D0LL);
}

void sub_104B0()
{
  *(_DWORD *)(v0 + swift_release(*(void *)(v0 + 40), v1) = v2;
  JUMPOUT(0x104D0LL);
}

uint64_t sub_104B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_WORD *)(v5 + v6) = 0;
  if (!(_DWORD)a2) {
    JUMPOUT(0x104D0LL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x104CCLL);
    }
    JUMPOUT(0x104C4LL);
  }

  return sub_9FD4(v5, a2, a3, a4);
}

uint64_t type metadata accessor for MediaServiceOwner(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for MediaServiceOwner);
}

uint64_t sub_104F4(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a2 + 40) + 8LL);
}

uint64_t sub_10500(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 48);
}

uint64_t sub_10508(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a1;
  v6[3] = a6;
  int v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  unsigned int v8 = (void *)swift_task_alloc(a4[1]);
  v6[4] = v8;
  *unsigned int v8 = v6;
  v8[1] = sub_10570;
  return v10(a6);
}

uint64_t sub_10570(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(_BYTE *)(*(void *)v1 + 4_swift_stdlib_reportUnimplementedInitializer("AMSMediaServiceOwner.AMSMediaServiceOwner", 41LL, "init()", 6LL, 0LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_105CC, 0LL, 0LL);
}

uint64_t sub_105CC()
{
  if (*(_BYTE *)(v0 + 40) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 24);
    id v2 = v1;
  }

  else
  {
    uint64_t v1 = 0LL;
  }

  **(void **)(v0 + 16) = v1;
  return sub_F79C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10610(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return swift_task_switch(sub_1062C, 0LL, 0LL);
}

uint64_t sub_1062C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  **(void **)(v0 + 16) = v1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  id v2 = v1;
  return sub_F79C(v4);
}
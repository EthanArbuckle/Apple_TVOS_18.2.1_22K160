id sub_100003210(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _dismissWithPurchaseResult:a2];
}

void sub_10000321C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
  if (!v2) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v7 = v6;
    if (v5)
    {
      uint64_t v8 = AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v7,  a1));
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v6));
    }

    *(_DWORD *)buf = 138543362;
    v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ presentation view controller presented",  buf,  0xCu);
    if (v5)
    {

      v9 = (void *)a1;
    }
  }
}

void sub_1000037D4()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC23AMSUIPaymentViewService11AppDelegate_window);
  sub_100003F00();
}

void sub_100003844(uint64_t a1)
{
  v2 = *(void **)(v1 + OBJC_IVAR____TtC23AMSUIPaymentViewService11AppDelegate_window);
  *(void *)(v1 + OBJC_IVAR____TtC23AMSUIPaymentViewService11AppDelegate_window) = a1;
}

uint64_t sub_100003858()
{
  return 1LL;
}

id sub_1000038CC()
{
  *(void *)&v0[OBJC_IVAR____TtC23AMSUIPaymentViewService11AppDelegate_window] = 0LL;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

void sub_100003928()
{
  uint64_t v0 = type metadata accessor for AppDelegate();
  uint64_t v1 = static CommandLine.unsafeArgv.getter();
  uint64_t v2 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  uint64_t v3 = static CommandLine.argc.getter(v2);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v0);
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v8 = v7;

  LODWORD(v5) = UIApplicationMain(_:_:_:_:)(v3, v1, 0LL, 0LL, v6, v8);
  swift_bridgeObjectRelease(v8);
  exit((int)v5);
}

id sub_1000039B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC23AMSUIPaymentViewService11AppDelegate);
}

void type metadata accessor for LaunchOptionsKey()
{
  if (!qword_1000111C8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_10000C7B0);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000111C8);
    }
  }
}

void sub_100003A68()
{
}

uint64_t sub_100003A88(uint64_t a1)
{
  return sub_100003A90(a1, *v1);
}

uint64_t sub_100003A90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100003AD0(uint64_t a1)
{
  return sub_100003AD8(a1, *v1);
}

Swift::Int sub_100003AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

void sub_100003B48()
{
}

void sub_100003B68(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  a2(v3);
  swift_bridgeObjectRelease(v5);
  sub_100003F00();
}

uint64_t sub_100003BA0(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_100003C18(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
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

  *a2 = v6;
  return v4 & 1;
}

NSString sub_100003C94@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_100003CB8(a1);
  *a2 = result;
  return result;
}

NSString sub_100003CB8(uint64_t a1)
{
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

uint64_t sub_100003CEC(uint64_t *a1, uint64_t *a2)
{
  return sub_100003CF8(*a1, *a2);
}

uint64_t sub_100003CF8(uint64_t a1, uint64_t a2)
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

uint64_t sub_100003D7C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100003DC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003DEC(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_100003EC4(&qword_1000111E8, (uint64_t)&unk_100009308);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

void sub_100003E58()
{
}

void sub_100003E7C()
{
}

void sub_100003EA0()
{
}

void sub_100003EC4(unint64_t *a1, uint64_t a2)
{
  if (!*a1)
  {
    type metadata accessor for LaunchOptionsKey();
    atomic_store(swift_getWitnessTable(a2, v4), a1);
  }

  sub_100003F00();
}

  ;
}

uint64_t *sub_100003F08(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
  }

  else
  {
    uint64_t v7 = sub_100004008(&qword_100011250);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      uint64_t v8 = type metadata accessor for DismissAction(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16LL))(v4, a2, v8);
      uint64_t v9 = v4;
      uint64_t v10 = v7;
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v13 = *a2;
      *uint64_t v4 = *a2;
      swift_retain(v13);
      uint64_t v9 = v4;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v9, v10, v11);
    uint64_t v14 = a3[5];
    uint64_t v15 = a3[6];
    v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = (uint64_t)v16;
    v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)v4 + v15) = (uint64_t)v17;
    uint64_t v18 = a3[7];
    v19 = (uint64_t *)((char *)v4 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v12 = v20[1];
    void *v19 = *v20;
    v19[1] = v12;
    id v21 = v16;
    id v22 = v17;
  }

  swift_retain(v12);
  return v4;
}

uint64_t sub_100004008(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004048(void *a1, int *a2)
{
  uint64_t v4 = sub_100004008(&qword_100011250);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    uint64_t v5 = type metadata accessor for DismissAction(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v5 - 8) + 8LL))(a1, v5);
  }

  else
  {
    swift_release(*a1);
  }

  return swift_release(*(void *)((char *)a1 + a2[7] + 8));
}

uint64_t *sub_1000040D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = sub_100004008(&qword_100011250);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for DismissAction(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 1LL;
  }

  else
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v9, v10);
  uint64_t v12 = a3[5];
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v14;
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(uint64_t *)((char *)a1 + v13) = (uint64_t)v15;
  uint64_t v16 = a3[7];
  v17 = (uint64_t *)((char *)a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  id v20 = v14;
  id v21 = v15;
  swift_retain(v19);
  return a1;
}

uint64_t *sub_1000041AC(uint64_t *a1, uint64_t *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100006DA8((uint64_t)a1, &qword_100011250);
    uint64_t v6 = sub_100004008(&qword_100011250);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      uint64_t v7 = type metadata accessor for DismissAction(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  uint64_t v12 = a3[5];
  uint64_t v13 = *(void **)((char *)a2 + v12);
  uint64_t v14 = *(void **)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  id v15 = v13;

  uint64_t v16 = a3[6];
  v17 = *(void **)((char *)a2 + v16);
  uint64_t v18 = *(void **)((char *)a1 + v16);
  *(uint64_t *)((char *)a1 + v16) = (uint64_t)v17;
  id v19 = v17;

  uint64_t v20 = a3[7];
  id v21 = (uint64_t *)((char *)a1 + v20);
  id v22 = (uint64_t *)((char *)a2 + v20);
  uint64_t v23 = v22[1];
  uint64_t v24 = v21[1];
  *id v21 = *v22;
  v21[1] = v23;
  swift_retain(v23);
  swift_release(v24);
  return a1;
}

char *sub_1000042B8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100004008(&qword_100011250);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for DismissAction(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
  }

  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_100004374(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100006DA8((uint64_t)a1, &qword_100011250);
    uint64_t v6 = sub_100004008(&qword_100011250);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      uint64_t v7 = type metadata accessor for DismissAction(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
    }
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  uint64_t v10 = a3[6];
  uint64_t v11 = *(void **)&a1[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];

  uint64_t v12 = a3[7];
  uint64_t v13 = *(void *)&a1[v12 + 8];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  swift_release(v13);
  return a1;
}

uint64_t sub_100004468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004474);
}

uint64_t sub_100004478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100004484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004490);
}

uint64_t sub_100004494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t type metadata accessor for ContentContainerView(uint64_t a1)
{
  return sub_100004CB4(a1, (uint64_t *)&unk_1000112B8, (uint64_t)&nominal type descriptor for ContentContainerView);
}

void sub_1000044B4(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = (char *)&value witness table for () + 64;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
  }

void sub_100004538(uint64_t a1)
{
  if (!qword_1000112C8)
  {
    uint64_t v2 = type metadata accessor for DismissAction(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000112C8);
    }
  }

uint64_t sub_10000458C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000B700, 1LL);
}

void sub_10000459C(uint64_t a1@<X8>)
{
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_100004008(&qword_100011308);
  sub_100006EF0();
  __chkstk_darwin(v12);
  sub_100006F50();
  uint64_t v13 = sub_100004008(&qword_100011310);
  sub_100006EF0();
  __chkstk_darwin(v14);
  sub_100006EE0();
  uint64_t v17 = v16 - v15;
  *(void *)uint64_t v10 = static VerticalAlignment.center.getter();
  *(void *)(v10 + 8) = 0x406AE00000000000LL;
  *(_BYTE *)(v10 + 16) = 0;
  uint64_t v18 = sub_100004008(&qword_100011318);
  sub_100004814(v1, v10 + *(int *)(v18 + 44));
  unsigned int v19 = static Edge.Set.top.getter();
  unsigned int v20 = static Edge.Set.bottom.getter();
  uint64_t v21 = Edge.Set.init(rawValue:)(0LL);
  int v22 = Edge.Set.init(rawValue:)(v21);
  int v23 = Edge.Set.init(rawValue:)(v21);
  EdgeInsets.init(_all:)(190.0);
  sub_100006FC8();
  sub_100005BD0(v10, v1, &qword_100011300);
  uint64_t v24 = v1 + *(int *)(v11 + 36);
  *(_BYTE *)uint64_t v24 = v21;
  *(void *)(v24 + 8) = v2;
  *(void *)(v24 + 16) = v3;
  *(void *)(v24 + 24) = v4;
  *(void *)(v24 + 32) = v5;
  *(_BYTE *)(v24 + 40) = 0;
  sub_100006DA8(v10, &qword_100011300);
  unsigned int v25 = static Edge.Set.leading.getter();
  unsigned int v26 = static Edge.Set.trailing.getter();
  uint64_t v27 = Edge.Set.init(rawValue:)(0LL);
  int v28 = Edge.Set.init(rawValue:)(v27);
  int v29 = Edge.Set.init(rawValue:)(v27);
  EdgeInsets.init(_all:)(120.0);
  sub_100006FC8();
  sub_100005BD0(v1, v17, &qword_100011308);
  uint64_t v30 = v17 + *(int *)(v13 + 36);
  *(_BYTE *)uint64_t v30 = v27;
  *(void *)(v30 + 8) = v2;
  *(void *)(v30 + 16) = v3;
  *(void *)(v30 + 24) = v4;
  *(void *)(v30 + 32) = v5;
  *(_BYTE *)(v30 + 40) = 0;
  sub_100006DA8(v1, &qword_100011308);
  sub_100004CE4(v17, a1, &qword_100011310);
}

void sub_100004814(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v3 = type metadata accessor for ContentContainerView(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v3;
  uint64_t v47 = v3;
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v49 = v4;
  uint64_t v50 = v6;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v48 = (uint64_t)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = type metadata accessor for ButtonContentView(0LL);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (uint64_t *)((char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v8);
  v51 = (char *)&v46 - v11;
  uint64_t v12 = type metadata accessor for PurchaseInfoSheetView(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_100004008(&qword_100011320);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_100004008(&qword_100011328);
  uint64_t v20 = __chkstk_darwin(v19);
  int v22 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v20);
  uint64_t v46 = (uint64_t)&v46 - v23;
  uint64_t v24 = *(int *)(v5 + 20);
  uint64_t v25 = a1;
  unsigned int v26 = *(void **)(a1 + v24);
  id v27 = v26;
  PurchaseInfoSheetView.init(_:)(v26);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v15, v12);
  *(_WORD *)&v18[*(int *)(v16 + 36)] = 256;
  uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v29 = static Alignment.center.getter(v28);
  _FrameLayout.init(width:height:alignment:)(v54, 0LL, 1LL, 0LL, 1LL, v29, v30);
  sub_100005BD0((uint64_t)v18, (uint64_t)v22, &qword_100011320);
  v31 = &v22[*(int *)(v19 + 36)];
  __int128 v32 = v54[1];
  *(_OWORD *)v31 = v54[0];
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v54[2];
  sub_100006DA8((uint64_t)v18, &qword_100011320);
  uint64_t v33 = v46;
  sub_100004CE4((uint64_t)v22, v46, &qword_100011328);
  uint64_t v34 = v48;
  v35 = *(void **)(v25 + *(int *)(v47 + 24));
  sub_1000053F8(v25, v48, type metadata accessor for ContentContainerView);
  uint64_t v36 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v37 = (v36 + 16) & ~v36;
  uint64_t v38 = swift_allocObject(&unk_10000C888, v37 + v50, v36 | 7);
  sub_1000053CC(v34, v38 + v37, type metadata accessor for ContentContainerView);
  *uint64_t v10 = swift_getKeyPath(&unk_100009488);
  uint64_t v39 = sub_100004008(&qword_100011250);
  swift_storeEnumTagMultiPayload(v10, v39, 0LL);
  uint64_t v41 = (uint64_t)v51;
  uint64_t v40 = v52;
  *(void *)((char *)v10 + *(int *)(v52 + 20)) = v35;
  v42 = (uint64_t (**)(uint64_t))((char *)v10 + *(int *)(v40 + 24));
  *v42 = sub_100004D84;
  v42[1] = (uint64_t (*)(uint64_t))v38;
  sub_1000053CC((uint64_t)v10, v41, type metadata accessor for ButtonContentView);
  sub_100005BD0(v33, (uint64_t)v22, &qword_100011328);
  sub_1000053F8(v41, (uint64_t)v10, type metadata accessor for ButtonContentView);
  uint64_t v43 = v53;
  sub_100005BD0((uint64_t)v22, v53, &qword_100011328);
  uint64_t v44 = sub_100004008(&qword_100011330);
  sub_1000053F8((uint64_t)v10, v43 + *(int *)(v44 + 48), type metadata accessor for ButtonContentView);
  id v45 = v35;
  sub_100005424(v41);
  sub_100006DA8(v33, &qword_100011328);
  sub_100005424((uint64_t)v10);
  sub_100006DA8((uint64_t)v22, &qword_100011328);
}

uint64_t sub_100004BD8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100006FDC();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  sub_100006F68();
  id v7 = objc_allocWithZone((Class)type metadata accessor for PaymentConfirmationResult(0LL));
  uint64_t v8 = (void *)PaymentConfirmationResult.init(_:)(a1);
  uint64_t v9 = sub_100006FE4();
  (*(void (**)(void *, void))(v3 + *(int *)(v9 + 28)))(v8, 0LL);
  sub_1000059B8(v2);
  DismissAction.callAsFunction()();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
}

uint64_t type metadata accessor for ButtonContentView(uint64_t a1)
{
  return sub_100004CB4(a1, qword_100011398, (uint64_t)&nominal type descriptor for ButtonContentView);
}

uint64_t sub_100004CB4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

void sub_100004CE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_100006F38(a1, a2, a3);
  sub_100006E8C(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_100003F00();
}

uint64_t sub_100004D10()
{
  uint64_t v2 = sub_100004008(&qword_100011250);
  if (sub_100006FA4(v2) == 1)
  {
    uint64_t v3 = sub_100006FDC();
    sub_100006F00(v3);
  }

  else
  {
    swift_release(*v1);
  }

  sub_100006F14();

  sub_100006FB0(*(int *)(v0 + 28));
  return sub_100006E98();
}

uint64_t sub_100004D84(uint64_t a1)
{
  return sub_100004BD8(a1);
}

void *sub_100004DB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = static HorizontalAlignment.center.getter();
  sub_100004E28(v1, (uint64_t)v5);
  memcpy(&__src[7], v5, 0xA8uLL);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0LL;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0xAFuLL);
}

uint64_t sub_100004E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ButtonContentView(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  id v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = sub_10000514C((SEL *)&selRef_dialogDefaultButtonLabel, 0xD000000000000027LL);
  uint64_t v55 = v8;
  sub_1000053F8(a1, (uint64_t)v7, type metadata accessor for ButtonContentView);
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = (v9 + 16) & ~v9;
  uint64_t v11 = v10 + v6;
  uint64_t v12 = v9 | 7;
  uint64_t v54 = swift_allocObject(&unk_10000C8B0, v11, v9 | 7);
  sub_1000053CC((uint64_t)v7, v54 + v10, type metadata accessor for ButtonContentView);
  int v48 = FocusState.init<>()();
  int v49 = v13;
  uint64_t v53 = v14;
  id v15 = [*(id *)(a1 + *(int *)(v4 + 20)) dialogOtherButtonLabel];
  if (v15)
  {

    uint64_t v16 = sub_10000514C((SEL *)&selRef_dialogDefaultButtonLabel, 0xD000000000000025LL);
    uint64_t v50 = v17;
    uint64_t v51 = v16;
    sub_1000053F8(a1, (uint64_t)v7, type metadata accessor for ButtonContentView);
    uint64_t v46 = swift_allocObject(&unk_10000C900, v11, v12);
    sub_1000053CC((uint64_t)v7, v46 + v10, type metadata accessor for ButtonContentView);
    char v18 = FocusState.init<>()();
    uint64_t v47 = v19;
    uint64_t v20 = v18 & 1;
    uint64_t v22 = v21 & 1;
    id v45 = sub_100006960;
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v51 = 0LL;
    id v45 = 0LL;
  }

  uint64_t v23 = sub_10000514C((SEL *)&selRef_dialogCancelButtonLabel, 0xD000000000000026LL);
  uint64_t v43 = v24;
  uint64_t v44 = v23;
  sub_1000053F8(a1, (uint64_t)v7, type metadata accessor for ButtonContentView);
  uint64_t v42 = swift_allocObject(&unk_10000C8D8, v11, v12);
  sub_1000053CC((uint64_t)v7, v42 + v10, type metadata accessor for ButtonContentView);
  char v25 = FocusState.init<>()();
  *(_BYTE *)a2 = v48 & 1;
  uint64_t v26 = v52;
  uint64_t v27 = v53;
  *(void *)(a2 + 8) = v53;
  *(_BYTE *)(a2 + 16) = v49 & 1;
  uint64_t v30 = v54;
  uint64_t v29 = v55;
  *(void *)(a2 + 24) = v26;
  *(void *)(a2 + 32) = v29;
  *(void *)(a2 + 40) = sub_100006838;
  *(void *)(a2 + 48) = v30;
  uint64_t v32 = v46;
  uint64_t v31 = v47;
  *(void *)(a2 + 56) = v20;
  *(void *)(a2 + 64) = v31;
  uint64_t v34 = v50;
  uint64_t v33 = v51;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v33;
  uint64_t v35 = (uint64_t)v45;
  *(void *)(a2 + 88) = v34;
  *(void *)(a2 + 96) = v35;
  *(void *)(a2 + 104) = v32;
  *(_BYTE *)(a2 + 112) = v25 & 1;
  *(void *)(a2 + 120) = v36;
  *(_BYTE *)(a2 + 128) = v28 & 1;
  uint64_t v37 = v43;
  *(void *)(a2 + 136) = v44;
  *(void *)(a2 + 144) = v37;
  uint64_t v38 = v42;
  *(void *)(a2 + 152) = sub_1000068C4;
  *(void *)(a2 + 160) = v38;
  uint64_t v39 = v27;
  swift_retain(v27);
  swift_bridgeObjectRetain(v29);
  swift_retain(v30);
  sub_1000068E4(v20, v31, v22, v33, v34, v35, v32);
  sub_100006920(v20, v31, v22, v33, v34, v35, v32);
  swift_release(v30);
  swift_bridgeObjectRelease(v29);
  return swift_release(v39);
}

uint64_t sub_10000514C(SEL *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Log(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_100006EE0();
  uint64_t v9 = v8 - v7;
  id v10 = [*(id *)(v2 + *(int *)(sub_100006F48() + 20)) *a1];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  }

  else
  {
    static Log.purchase.getter();
    uint64_t v13 = sub_100004008(&qword_1000113F0);
    uint64_t v14 = type metadata accessor for LogInterpolation(0LL);
    uint64_t v15 = swift_allocObject( v13,  ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v14 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v15 + 16) = xmmword_100009410;
    sub_100006FBC();
    LogInterpolation.init(stringLiteral:)(a2);
    Log.error(_:)(v15);
    swift_bridgeObjectRelease(v15);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    return 0LL;
  }

  return v12;
}

void sub_1000052B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Log(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100006F50();
  static Log.purchase.getter();
  uint64_t v8 = sub_100004008(&qword_1000113F0);
  uint64_t v9 = type metadata accessor for LogInterpolation(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_100009410;
  sub_100006FBC();
  LogInterpolation.init(stringLiteral:)(a1);
  Log.default(_:)(v10);
  swift_bridgeObjectRelease(v10);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v6);
  uint64_t v11 = sub_100006F48();
  (*(void (**)(uint64_t))(v3 + *(int *)(v11 + 24)))(a3);
  sub_100006EA8();
}

void sub_1000053CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_100006F28(a1, a2, a3);
  sub_100006E8C(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_100003F00();
}

void sub_1000053F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_100006F28(a1, a2, a3);
  sub_100006E8C(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_100003F00();
}

uint64_t sub_100005424(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ButtonContentView(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100005460()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000547C()
{
  uint64_t v2 = sub_100004008(&qword_100011408);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_100006EE0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100004008(&qword_100011410);
  sub_100006EF0();
  __chkstk_darwin(v8);
  sub_100006F68();
  uint64_t v9 = *((void *)v0 + 5);
  uint64_t v10 = *((void *)v0 + 6);
  uint64_t v24 = v0;
  swift_retain(v10);
  uint64_t v11 = sub_100004008(&qword_100011418);
  unint64_t v12 = sub_100006C84();
  uint64_t v13 = Button.init(action:label:)(v9, v10, sub_100006C7C, v23, v11, v12);
  uint64_t v14 = static Alignment.center.getter(v13);
  _FrameLayout.init(width:height:alignment:)(v29, 0x4080900000000000LL, 0LL, 0LL, 1LL, v14, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  uint64_t v16 = (_OWORD *)(v1 + *(int *)(v7 + 36));
  __int128 v17 = v29[1];
  _OWORD *v16 = v29[0];
  v16[1] = v17;
  v16[2] = v29[2];
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  __int128 v25 = *v0;
  char v26 = *((_BYTE *)v0 + 16);
  uint64_t v18 = sub_100004008(&qword_100011428);
  FocusState.projectedValue.getter(v27, v18);
  uint64_t v19 = v27[0];
  uint64_t v20 = v27[1];
  uint64_t v21 = v28;
  unint64_t v22 = sub_100006CE8();
  View.focused(_:)(v19, v20, v21, v7, v22);
  swift_release(v20);
  swift_release(v19);
  sub_100006DA8(v1, &qword_100011410);
  sub_100006EA8();
}

void *sub_100005624@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 32);
  *(void *)&__src[0] = *(void *)(a1 + 24);
  *((void *)&__src[0] + 1) = v4;
  unint64_t v5 = sub_100006DE0();
  swift_bridgeObjectRetain(v4);
  uint64_t v6 = Text.init<A>(_:)(__src, &type metadata for String, v5);
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v12 = v11;
  __src[0] = *(_OWORD *)a1;
  LOBYTE(__src[1]) = *(_BYTE *)(a1 + 16);
  uint64_t v13 = sub_100004008(&qword_100011428);
  uint64_t v14 = FocusState.wrappedValue.getter(&v29, v13);
  if (v29 == 1) {
    uint64_t v15 = static Color.black.getter(v14);
  }
  else {
    uint64_t v15 = static Color.white.getter(v14);
  }
  uint64_t v16 = v15;
  uint64_t v17 = v10 & 1;
  uint64_t v18 = Text.foregroundColor(_:)(v15, v6, v8, v17, v12);
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  swift_release(v16);
  sub_100006E1C(v6, v8, v17);
  uint64_t v25 = swift_bridgeObjectRelease(v12);
  uint64_t v26 = static Alignment.center.getter(v25);
  sub_1000057B0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v26, v27, v18, v20, v22 & 1, v24);
  sub_100006E1C(v18, v20, v22 & 1);
  swift_bridgeObjectRelease(v24);
  return memcpy(a2, __src, 0x90uLL);
}

uint64_t sub_1000057B0@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  uint64_t v24 = a14;
  uint64_t v23 = a15;
  double v25 = a12;
  double v26 = a10;
  uint64_t v27 = a2 & 1;
  double v28 = a1;
  if ((_DWORD)v27) {
    double v28 = -INFINITY;
  }
  uint64_t v29 = a4 & 1;
  double v30 = a3;
  if ((_DWORD)v29) {
    double v30 = v28;
  }
  uint64_t v31 = a6 & 1;
  uint64_t v32 = a8 & 1;
  char v33 = a13 & 1;
  double v34 = a5;
  if ((a6 & 1) != 0) {
    double v34 = v30;
  }
  if (v28 > v30 || v30 > v34) {
    goto LABEL_22;
  }
  double v36 = a7;
  if ((a8 & 1) != 0) {
    double v36 = -INFINITY;
  }
  double v37 = a10;
  if ((a11 & 1) != 0) {
    double v37 = v36;
  }
  double v38 = a12;
  if ((a13 & 1) != 0) {
    double v38 = v37;
  }
  if (v36 > v37 || v37 > v38)
  {
LABEL_22:
    double v48 = a7;
    double v49 = a5;
    double v46 = a1;
    double v47 = a3;
    unsigned int v45 = v27;
    unsigned int v44 = v29;
    uint64_t v40 = static os_log_type_t.fault.getter();
    uint64_t v41 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v40,  &_mh_execute_header,  v41,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    char v33 = a13 & 1;
    uint64_t v29 = v44;
    uint64_t v24 = a14;
    uint64_t v23 = a15;
    uint64_t v27 = v45;
    double v26 = a10;
    double v25 = a12;
    a1 = v46;
    a3 = v47;
    a7 = v48;
    a5 = v49;
    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  *(void *)&a1,  v27,  *(void *)&a3,  v29,  *(void *)&a5,  v31,  *(void *)&a7,  v32,  *(void *)&v26,  a11 & 1,  *(void *)&v25,  v33,  v24,  v23);
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  char v42 = v21 & 1;
  *(_BYTE *)(a9 + 16) = v42;
  *(void *)(a9 + 24) = v20;
  memcpy((void *)(a9 + 32), __src, 0x70uLL);
  sub_100006E2C(a16, v22, v42);
  return swift_bridgeObjectRetain(v20);
}

void sub_100005978()
{
}

uint64_t sub_1000059B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100004008(&qword_100011250);
  __chkstk_darwin();
  char v10 = (uint64_t *)((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_100005BD0(v2, (uint64_t)v10, &qword_100011250);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    uint64_t v11 = type metadata accessor for DismissAction(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, v10, v11);
  }

  else
  {
    uint64_t v13 = *v10;
    os_log_type_t v14 = static os_log_type_t.fault.getter();
    uint64_t v15 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v16 = swift_slowAlloc(12LL, -1LL);
      uint64_t v17 = swift_slowAlloc(32LL, -1LL);
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      *(void *)(v16 + 4) = sub_100005BFC((char *)0x417373696D736944LL, (char *)0xED00006E6F697463LL, &v19);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v14,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  (uint8_t *)v16,  0xCu);
      swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

void sub_100005BD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_100006F38(a1, a2, a3);
  sub_100006E8C(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_100003F00();
}

char *sub_100005BFC(char *a1, char *a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005CCC(v12, 0LL, 0LL, 1, (uint64_t)a1, (unint64_t)a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005DE8((uint64_t)v12, *a3);
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
      sub_100005DE8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100005DC8(v12);
  return v7;
}

char *sub_100005CCC(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          uint64_t result = 0LL;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (char *)__dst;
          return result;
        }
      }
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    uint64_t result = sub_100005E24(a5, a6);
    *a1 = v11;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t result = (char *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }

  else
  {
    uint64_t result = (char *)_StringObject.sharedUTF8.getter(a5, a6);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }

  *a1 = result;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (char *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100005DC8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100005E24(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_100005EB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005FB4(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005FB4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100005EB8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100005F50(v4, 0LL);
      uint64_t result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v7 & 1) != 0) {
        break;
      }
      if (result == (void *)v4) {
        return v5;
      }
      __break(1u);
LABEL_9:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100005F50(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004008(&qword_100011338);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100005FB4(char *result, int64_t a2, char a3, char *a4)
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

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100004008(&qword_100011338);
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
  os_log_type_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[v8] <= v13) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t *sub_1000060A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
  }

  else
  {
    uint64_t v7 = sub_100004008(&qword_100011250);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      uint64_t v8 = type metadata accessor for DismissAction(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16LL))(v4, a2, v8);
      int64_t v9 = v4;
      uint64_t v10 = v7;
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v13 = *a2;
      *uint64_t v4 = *a2;
      swift_retain(v13);
      int64_t v9 = v4;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = (uint64_t)v16;
    uint64_t v17 = (uint64_t *)((char *)v4 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v12 = v18[1];
    void *v17 = *v18;
    v17[1] = v12;
    id v19 = v16;
  }

  swift_retain(v12);
  return v4;
}

uint64_t sub_100006190(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004008(&qword_100011250);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    uint64_t v5 = type metadata accessor for DismissAction(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v5 - 8) + 8LL))(a1, v5);
  }

  else
  {
    swift_release(*a1);
  }

  return swift_release(*(void *)((char *)a1 + *(int *)(a2 + 24) + 8));
}

uint64_t *sub_100006210(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_100004008(&qword_100011250);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for DismissAction(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 1LL;
  }

  else
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = *(void **)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v14;
  uint64_t v15 = (uint64_t *)((char *)a1 + v13);
  uint64_t v16 = (uint64_t *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  id v18 = v14;
  swift_retain(v17);
  return a1;
}

uint64_t *sub_1000062D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100006DA8((uint64_t)a1, &qword_100011250);
    uint64_t v6 = sub_100004008(&qword_100011250);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      uint64_t v7 = type metadata accessor for DismissAction(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = *(void **)((char *)a2 + v12);
  uint64_t v14 = *(void **)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  id v15 = v13;

  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (uint64_t *)((char *)a1 + v16);
  id v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  uint64_t v20 = v17[1];
  void *v17 = *v18;
  v17[1] = v19;
  swift_retain(v19);
  swift_release(v20);
  return a1;
}

char *sub_1000063CC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100004008(&qword_100011250);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for DismissAction(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
  }

  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *sub_10000647C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100006DA8((uint64_t)a1, &qword_100011250);
    uint64_t v6 = sub_100004008(&qword_100011250);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      uint64_t v7 = type metadata accessor for DismissAction(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
    }
  }

  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void *)&a1[v10 + 8];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  swift_release(v11);
  return a1;
}

uint64_t sub_10000655C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006568);
}

uint64_t sub_10000656C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004008(&qword_100011258);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2) {
    return sub_100004478(a1, a2, v6);
  }
  unint64_t v8 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t sub_1000065E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000065F4);
}

void sub_1000065F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004008(&qword_100011258);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    sub_100004494(a1, a2, a2, v8);
  }

  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    sub_100006F98();
  }

void sub_100006668(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for () + 64;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

unint64_t sub_1000066F0()
{
  unint64_t result = qword_1000113D8;
  if (!qword_1000113D8)
  {
    uint64_t v1 = sub_10000675C(&qword_100011310);
    sub_1000067A0();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000113D8);
  }

  return result;
}

uint64_t sub_10000675C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000067A0()
{
  unint64_t result = qword_1000113E0;
  if (!qword_1000113E0)
  {
    uint64_t v1 = sub_10000675C(&qword_100011308);
    sub_100006D6C(&qword_1000113E8, &qword_100011300, (uint64_t)&protocol conformance descriptor for HStack<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000113E0);
  }

  return result;
}

uint64_t sub_100006824(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000B744, 1LL);
}

void sub_100006838()
{
}

uint64_t sub_10000685C()
{
  uint64_t v2 = sub_100004008(&qword_100011250);
  if (sub_100006FA4(v2) == 1)
  {
    uint64_t v3 = sub_100006FDC();
    sub_100006F00(v3);
  }

  else
  {
    swift_release(*v1);
  }

  sub_100006F14();
  sub_100006FB0(*(int *)(v0 + 24));
  return sub_100006E98();
}

void sub_1000068C4()
{
}

uint64_t sub_1000068E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a5)
  {
    swift_retain(a2);
    swift_bridgeObjectRetain(a5);
    return swift_retain(a7);
  }

  return result;
}

uint64_t sub_100006920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a5)
  {
    swift_bridgeObjectRelease(a5);
    swift_release(a7);
    return swift_release(a2);
  }

  return result;
}

void sub_100006960()
{
}

void sub_100006980(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t initializeBufferWithCopyOfBuffer for DialogButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for DialogButton(void *a1)
{
  return swift_release(a1[6]);
}

uint64_t initializeWithCopy for DialogButton(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = v4;
  swift_retain(v3);
  swift_bridgeObjectRetain(v6);
  swift_retain(v4);
  return a1;
}

uint64_t assignWithCopy for DialogButton(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v5;
  swift_retain(v5);
  swift_release(v4);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v8;
  swift_retain(v8);
  swift_release(v10);
  return a1;
}

__n128 initializeWithTake for DialogButton(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for DialogButton(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release(v4);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(*(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v5;
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DialogButton(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
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

uint64_t storeEnumTagSinglePayload for DialogButton(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for DialogButton()
{
  return &type metadata for DialogButton;
}

void sub_100006C40()
{
}

uint64_t sub_100006C6C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000B76C, 1LL);
}

void *sub_100006C7C@<X0>(void *a1@<X8>)
{
  return sub_100005624(*(void *)(v1 + 16), a1);
}

unint64_t sub_100006C84()
{
  unint64_t result = qword_100011420;
  if (!qword_100011420)
  {
    uint64_t v1 = sub_10000675C(&qword_100011418);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100011420);
  }

  return result;
}

unint64_t sub_100006CE8()
{
  unint64_t result = qword_100011430;
  if (!qword_100011430)
  {
    uint64_t v1 = sub_10000675C(&qword_100011410);
    sub_100006D6C(&qword_100011438, &qword_100011408, (uint64_t)&protocol conformance descriptor for Button<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100011430);
  }

  return result;
}

void sub_100006D6C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = sub_10000675C(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_100003F00();
}

void sub_100006DA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004008(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_100003F00();
}

unint64_t sub_100006DE0()
{
  unint64_t result = qword_100011440;
  if (!qword_100011440)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100011440);
  }

  return result;
}

uint64_t sub_100006E1C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_100006E2C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t sub_100006E3C()
{
  v1[0] = sub_10000675C(&qword_100011410);
  v1[1] = sub_100006CE8();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.focused(_:)>>,  1LL);
}

uint64_t sub_100006E8C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_100006E98()
{
  return ((uint64_t (*)(void))swift_deallocObject)();
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100006F00(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

void sub_100006F14()
{
}

uint64_t sub_100006F28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t sub_100006F38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100004008(a3);
}

uint64_t sub_100006F48()
{
  return type metadata accessor for ButtonContentView(0LL);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100006FA4(uint64_t a1)
{
  return swift_getEnumCaseMultiPayload(v1, a1);
}

uint64_t sub_100006FB0@<X0>(uint64_t a1@<X8>)
{
  return swift_release(*(void *)(v1 + a1 + 8));
}

uint64_t sub_100006FBC()
{
  return LogInterpolation.init(stringLiteral:)(0xD000000000000015LL);
}

  ;
}

uint64_t sub_100006FDC()
{
  return type metadata accessor for DismissAction(0LL);
}

uint64_t sub_100006FE4()
{
  return type metadata accessor for ContentContainerView(0LL);
}

uint64_t sub_100006FEC()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_10000700C(void *a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v5 = (int *)type metadata accessor for ContentContainerView(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = type metadata accessor for Log(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = swift_allocObject(&unk_10000C9F0, 24LL, 7LL);
  *(void *)(v12 + 16) = a3;
  if (!a1)
  {
    uint64_t v19 = _Block_copy(a3);
    static Log.purchase.getter(v19);
    uint64_t v20 = sub_100004008(&qword_1000113F0);
    uint64_t v21 = type metadata accessor for LogInterpolation(0LL);
    uint64_t v22 = swift_allocObject( v20,  ((*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v21 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v22 + 16) = xmmword_100009410;
    LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
    v80 = &type metadata for String;
    *(void *)&__int128 v79 = 0x20676E697373694DLL;
    *((void *)&v79 + 1) = 0xEF747865746E6F43LL;
    static LogInterpolation.safe(_:)(&v79);
    sub_1000080E0((uint64_t)&v79);
    Log.error(_:)(v22);
    swift_bridgeObjectRelease(v22);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    NSString v23 = String._bridgeToObjectiveC()();
    id v24 = (id)AMSError(2LL, v23, 0LL, 0LL);

    id v25 = v24;
    double v26 = (void *)_convertErrorToNSError(_:)(v25);
    ((void (**)(void, void, void *))a3)[2](a3, 0LL, v26);
    swift_release(v12);
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMSPaymentSheetPaymentRequestMetadata);
  uint64_t v15 = v14;
  *(void *)&v78[0] = v13;
  *((void *)&v78[0] + 1) = v14;
  _Block_copy(a3);
  swift_bridgeObjectRetain(v15);
  id v16 = a1;
  uint64_t v17 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v78, &type metadata for String);
  id v76 = v16;
  id v18 = objc_msgSend(v16, "__swift_objectForKeyedSubscript:", v17);
  swift_unknownObjectRelease(v17);
  if (v18)
  {
    _bridgeAnyObjectToAny(_:)(v78, v18);
    swift_unknownObjectRelease(v18);
  }

  else
  {
    memset(v78, 0, sizeof(v78));
  }

  sub_100008120((uint64_t)v78, (uint64_t)&v79);
  if (!v80)
  {
    swift_bridgeObjectRelease(v15);
    uint64_t v45 = sub_1000080E0((uint64_t)&v79);
LABEL_15:
    id v46 = v76;
    static Log.purchase.getter(v45);
    uint64_t v47 = sub_100004008(&qword_1000113F0);
    uint64_t v48 = type metadata accessor for LogInterpolation(0LL);
    uint64_t v49 = swift_allocObject( v47,  ((*(unsigned __int8 *)(*(void *)(v48 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v48 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v48 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v48 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v49 + 16) = xmmword_100009410;
    LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
    v80 = &type metadata for String;
    *(void *)&__int128 v79 = 0xD00000000000002DLL;
    *((void *)&v79 + 1) = 0x8000000100009810LL;
    static LogInterpolation.safe(_:)(&v79);
    sub_1000080E0((uint64_t)&v79);
    Log.error(_:)(v49);
    swift_bridgeObjectRelease(v49);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    NSString v50 = String._bridgeToObjectiveC()();
    uint64_t v51 = (void *)AMSError(2LL, v50, 0LL, 0LL);
LABEL_18:
    id v55 = v51;

    id v25 = v55;
    double v26 = (void *)_convertErrorToNSError(_:)(v25);
    ((void (**)(void, void, void *))a3)[2](a3, 0LL, v26);
    swift_release(v12);

    goto LABEL_19;
  }

  uint64_t v27 = sub_100004008(&qword_100011450);
  if ((swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, v27, 6LL) & 1) == 0)
  {
    uint64_t v45 = swift_bridgeObjectRelease(v15);
    goto LABEL_15;
  }

  uint64_t v28 = v77;
  swift_bridgeObjectRelease(v15);
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMSPaymentSheetPaymentRequestMetadataKeyRequestData);
  uint64_t v31 = v30;
  sub_100008168(v29, v30, v28, &v79);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v28);
  if (!v80)
  {
    uint64_t v32 = sub_1000080E0((uint64_t)&v79);
    goto LABEL_17;
  }

  uint64_t v32 = swift_dynamicCast(v78, &v79, (char *)&type metadata for Any + 8, &type metadata for Data, 6LL);
  if ((v32 & 1) == 0)
  {
LABEL_17:
    id v46 = v76;
    static Log.purchase.getter(v32);
    uint64_t v52 = sub_100004008(&qword_1000113F0);
    uint64_t v53 = type metadata accessor for LogInterpolation(0LL);
    uint64_t v54 = swift_allocObject( v52,  ((*(unsigned __int8 *)(*(void *)(v53 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v53 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v53 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v53 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v54 + 16) = xmmword_100009410;
    LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
    v80 = &type metadata for String;
    *(void *)&__int128 v79 = 0xD000000000000030LL;
    *((void *)&v79 + 1) = 0x8000000100009860LL;
    static LogInterpolation.safe(_:)(&v79);
    sub_1000080E0((uint64_t)&v79);
    Log.error(_:)(v54);
    swift_bridgeObjectRelease(v54);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    NSString v50 = String._bridgeToObjectiveC()();
    uint64_t v51 = (void *)AMSError(2LL, v50, 0LL, 0LL);
    goto LABEL_18;
  }

  __int128 v33 = v78[0];
  sub_1000081B8(0LL, &qword_100011458, &OBJC_CLASS___NSKeyedUnarchiver_ptr);
  uint64_t v34 = sub_1000081B8(0LL, &qword_100011460, &OBJC_CLASS___AMSPaymentRequest_ptr);
  uint64_t v75 = v33;
  uint64_t v35 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v34, v33, *((void *)&v33 + 1), v34);
  v58 = v35;
  if (v35)
  {
    uint64_t v59 = sub_1000084E4(v35, (SEL *)&selRef_dialogCancelButtonLabel);
    if (v60)
    {
      swift_bridgeObjectRelease(v60);
      uint64_t v59 = sub_1000084E4(v58, (SEL *)&selRef_dialogDefaultButtonLabel);
      if (v61)
      {
        swift_bridgeObjectRelease(v61);
        *uint64_t v7 = swift_getKeyPath(&unk_1000095C0);
        uint64_t v62 = sub_100004008(&qword_100011250);
        swift_storeEnumTagMultiPayload(v7, v62, 0LL);
        *(void *)((char *)v7 + v5[5]) = v76;
        *(void *)((char *)v7 + v5[6]) = v58;
        v63 = (void (**)(uint64_t, uint64_t))((char *)v7 + v5[7]);
        *v63 = sub_1000085A4;
        v63[1] = (void (*)(uint64_t, uint64_t))v12;
        id v64 = objc_allocWithZone((Class)sub_100004008(&qword_100011468));
        swift_retain(v12);
        uint64_t v56 = UIHostingController.init(rootView:)(v7);
        sub_1000081F0(v75, *((unint64_t *)&v33 + 1));
        swift_release(v12);
        _Block_release(a3);
        return v56;
      }
    }

    static Log.purchase.getter(v59);
    v65 = v58;
    uint64_t v66 = sub_100004008(&qword_1000113F0);
    uint64_t v67 = *(void *)(type metadata accessor for LogInterpolation(0LL) - 8);
    unint64_t v74 = *((void *)&v33 + 1);
    uint64_t v68 = swift_allocObject( v66,  ((*(unsigned __int8 *)(v67 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))
          + 2LL * *(void *)(v67 + 72),
            *(unsigned __int8 *)(v67 + 80) | 7LL);
    *(_OWORD *)(v68 + 16) = xmmword_100009410;
    LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
    v80 = &type metadata for String;
    *(void *)&__int128 v79 = 0xD000000000000050LL;
    *((void *)&v79 + 1) = 0x8000000100009900LL;
    static LogInterpolation.safe(_:)(&v79);
    sub_1000080E0((uint64_t)&v79);
    Log.error(_:)(v68);
    swift_bridgeObjectRelease(v68);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    NSString v69 = String._bridgeToObjectiveC()();
    id v70 = (id)AMSError(2LL, v69, 0LL, 0LL);

    id v71 = v70;
    v72 = (void *)_convertErrorToNSError(_:)(v71);
    ((void (**)(void, void, void *))a3)[2](a3, 0LL, v72);

    unint64_t v44 = v74;
    uint64_t v43 = v75;
  }

  else
  {
    static Log.purchase.getter(0LL);
    uint64_t v36 = sub_100004008(&qword_1000113F0);
    uint64_t v37 = type metadata accessor for LogInterpolation(0LL);
    uint64_t v38 = swift_allocObject( v36,  ((*(unsigned __int8 *)(*(void *)(v37 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v37 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v37 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v37 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v38 + 16) = xmmword_100009410;
    LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
    v80 = &type metadata for String;
    *(void *)&__int128 v79 = 0xD00000000000002CLL;
    *((void *)&v79 + 1) = 0x80000001000098A0LL;
    static LogInterpolation.safe(_:)(&v79);
    sub_1000080E0((uint64_t)&v79);
    Log.error(_:)(v38);
    swift_bridgeObjectRelease(v38);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    NSString v39 = String._bridgeToObjectiveC()();
    id v40 = (id)AMSError(4LL, v39, 0LL, 0LL);

    id v41 = v40;
    char v42 = (void *)_convertErrorToNSError(_:)(v41);
    ((void (**)(void, void, void *))a3)[2](a3, 0LL, v42);

    uint64_t v43 = v75;
    unint64_t v44 = *((void *)&v33 + 1);
  }

  sub_1000081F0(v43, v44);
  swift_release(v12);

LABEL_20:
  _Block_release(a3);
  return 0LL;
}

uint64_t static PaymentViewServiceContentViewControllerProvider.makeContentViewController(_:completion:)( void *a1, void (*a2)(void, __n128 *), uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Log(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = (int *)type metadata accessor for ContentContainerView(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (unint64_t *)((char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (a1)
  {
    uint64_t v61 = v6;
    uint64_t v62 = a2;
    *(void *)&v64[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(AMSPaymentSheetPaymentRequestMetadata);
    *((void *)&v64[0] + 1) = v13;
    swift_bridgeObjectRetain(v13);
    uint64_t v14 = a1;
    uint64_t v15 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v64, &type metadata for String);
    id v16 = -[__n128 __swift_objectForKeyedSubscript:](v14, "__swift_objectForKeyedSubscript:", v15);
    swift_unknownObjectRelease(v15);
    if (v16)
    {
      _bridgeAnyObjectToAny(_:)(v64, v16);
      swift_unknownObjectRelease(v16);
    }

    else
    {
      memset(v64, 0, sizeof(v64));
    }

    sub_100008120((uint64_t)v64, (uint64_t)&v65);
    if (v66)
    {
      uint64_t v21 = sub_100004008(&qword_100011450);
      if ((sub_100008698((uint64_t)&v63, v22, (uint64_t)&type metadata for Any + 8, v21) & 1) != 0)
      {
        uint64_t v23 = v63;
        sub_10000867C();
        uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMSPaymentSheetPaymentRequestMetadataKeyRequestData);
        sub_100008168(v24, v25, v23, &v65);
        sub_10000867C();
        sub_100008660();
        if (v66)
        {
          if ((sub_100008698((uint64_t)v64, v26, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Data) & 1) != 0)
          {
            __int128 v27 = v64[0];
            sub_1000081B8(0LL, &qword_100011458, &OBJC_CLASS___NSKeyedUnarchiver_ptr);
            uint64_t v28 = sub_1000081B8(0LL, &qword_100011460, &OBJC_CLASS___AMSPaymentRequest_ptr);
            uint64_t v60 = v27;
            uint64_t v29 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)( v28,  v27,  *((void *)&v27 + 1),  v28);
            uint64_t v48 = v29;
            if (v29)
            {
              sub_1000084E4(v29, (SEL *)&selRef_dialogCancelButtonLabel);
              if (v49)
              {
                swift_bridgeObjectRelease(v49);
                sub_1000084E4(v48, (SEL *)&selRef_dialogDefaultButtonLabel);
                if (v50)
                {
                  swift_bridgeObjectRelease(v50);
                  *uint64_t v12 = swift_getKeyPath(&unk_1000095C0);
                  uint64_t v51 = sub_100004008(&qword_100011250);
                  swift_storeEnumTagMultiPayload(v12, v51, 0LL);
                  *(void *)((char *)v12 + v10[5]) = v14;
                  *(void *)((char *)v12 + v10[6]) = v48;
                  uint64_t v52 = (void *)((char *)v12 + v10[7]);
                  *uint64_t v52 = v62;
                  v52[1] = a3;
                  id v53 = objc_allocWithZone((Class)sub_100004008(&qword_100011468));
                  swift_retain(a3);
                  uint64_t v46 = UIHostingController.init(rootView:)(v12);
                  sub_1000081F0(v60, *((unint64_t *)&v27 + 1));
                  return v46;
                }
              }

              sub_100008674();
              sub_100004008(&qword_1000113F0);
              uint64_t v54 = *(void *)(sub_100008634() - 8);
              unint64_t v59 = *((void *)&v27 + 1);
              id v55 = (__n128 *)sub_1000085CC(v54);
              sub_10000868C(v55, (__n128)xmmword_100009410);
              sub_1000085AC();
              sub_1000086A4();
              sub_100008614();
              sub_100008640();
              sub_100008628();
              sub_100008660();
              sub_100008604();
              NSString v56 = sub_100008668();
              id v57 = (id)sub_1000085EC((uint64_t)v56);
              sub_100008684();
              v58 = v55;
              sub_100008648();

              unint64_t v36 = v59;
              uint64_t v35 = v60;
            }

            else
            {
              sub_100008674();
              sub_100004008(&qword_1000113F0);
              uint64_t v30 = sub_100008634();
              uint64_t v31 = (__n128 *)sub_1000085CC(*(void *)(v30 - 8));
              sub_10000868C(v31, (__n128)xmmword_100009410);
              sub_1000085AC();
              sub_1000086A4();
              sub_100008614();
              sub_100008640();
              sub_100008628();
              sub_100008660();
              sub_100008604();
              NSString v32 = sub_100008668();
              id v33 = (id)AMSError(4LL, v32, 0LL, 0LL);
              sub_100008684();
              uint64_t v34 = v31;
              sub_100008648();

              uint64_t v35 = v60;
              unint64_t v36 = *((void *)&v27 + 1);
            }

            sub_1000081F0(v35, v36);
            goto LABEL_5;
          }
        }

        else
        {
          sub_100008640();
        }

        uint64_t v37 = v62;
        sub_100008674();
        sub_100004008(&qword_1000113F0);
        uint64_t v42 = sub_100008634();
        NSString v39 = (__n128 *)sub_1000085CC(*(void *)(v42 - 8));
        sub_10000868C(v39, (__n128)xmmword_100009410);
        sub_1000085AC();
        sub_1000086A4();
        *(void *)&__int128 v65 = (char *)v12 + 1;
        *((void *)&v65 + 1) = 0x8000000100009860LL;
        static LogInterpolation.safe(_:)(&v65);
        sub_100008640();
        sub_100008628();
        sub_100008660();
        sub_100008604();
        NSString v43 = String._bridgeToObjectiveC()();
        id v41 = (void *)sub_1000085EC((uint64_t)v43);
LABEL_19:
        id v44 = v41;
        sub_100008684();
        uint64_t v45 = v39;
        v37(0LL, v39);

        return 0LL;
      }

      sub_10000867C();
    }

    else
    {
      sub_10000867C();
      sub_100008640();
    }

    uint64_t v37 = v62;
    sub_100008674();
    sub_100004008(&qword_1000113F0);
    uint64_t v38 = sub_100008634();
    NSString v39 = (__n128 *)sub_1000085CC(*(void *)(v38 - 8));
    sub_10000868C(v39, (__n128)xmmword_100009410);
    sub_1000085AC();
    sub_1000086A4();
    sub_100008614();
    sub_100008640();
    sub_100008628();
    sub_100008660();
    sub_100008604();
    NSString v40 = sub_100008668();
    id v41 = (void *)sub_1000085EC((uint64_t)v40);
    goto LABEL_19;
  }

  sub_100008674();
  sub_100004008(&qword_1000113F0);
  uint64_t v17 = sub_100008634();
  id v18 = (__n128 *)swift_allocObject( v6,  ((*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL))
                  + 2LL * *(void *)(*(void *)(v17 - 8) + 72LL),
                    *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) | 7LL);
  v18[1] = (__n128)xmmword_100009410;
  LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
  uint64_t v66 = &type metadata for String;
  *(void *)&__int128 v65 = 0x20676E697373694DLL;
  *((void *)&v65 + 1) = 0xEF747865746E6F43LL;
  static LogInterpolation.safe(_:)(&v65);
  sub_100008640();
  sub_100008628();
  sub_100008660();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = (id)sub_1000085EC((uint64_t)v19);
  sub_100008684();
  uint64_t v14 = v18;
  a2(0LL, v18);

LABEL_5:
  return 0LL;
}

uint64_t sub_1000080E0(uint64_t a1)
{
  uint64_t v2 = sub_100004008(&qword_100011448);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100008120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004008(&qword_100011448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

double sub_100008168@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1000083A0(a1, a2), (v7 & 1) != 0))
  {
    sub_100005DE8(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

uint64_t sub_1000081B8(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_1000081F0(uint64_t result, unint64_t a2)
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

void sub_1000082A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id PaymentViewServiceContentViewControllerProvider.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id PaymentViewServiceContentViewControllerProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PaymentViewServiceContentViewControllerProvider();
  return objc_msgSendSuper2(&v2, "init");
}

id PaymentViewServiceContentViewControllerProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PaymentViewServiceContentViewControllerProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_1000083A0(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100008404(a1, a2, v5);
}

unint64_t sub_100008404(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000084E4(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

uint64_t sub_100008540()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t type metadata accessor for PaymentViewServiceContentViewControllerProvider()
{
  return objc_opt_self(&OBJC_CLASS___AMSUIPaymentViewServiceContentViewControllerProvider);
}

uint64_t sub_100008580()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000085A4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1000085AC()
{
  return LogInterpolation.init(stringLiteral:)(0xD00000000000002FLL);
}

uint64_t sub_1000085CC@<X0>(uint64_t a1@<X8>)
{
  return swift_allocObject( v1,  ((*(unsigned __int8 *)(a1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(a1 + 80))
         + 2LL * *(void *)(a1 + 72),
           *(unsigned __int8 *)(a1 + 80) | 7LL);
}

uint64_t sub_1000085EC(uint64_t a1)
{
  return AMSError(2LL, a1, 0LL, 0LL);
}

uint64_t sub_100008604()
{
  return (*(uint64_t (**)(uint64_t, void))(v0 + 8))(v1, *(void *)(v2 - 176));
}

uint64_t sub_100008614()
{
  *(void *)(v2 - 112) = v0;
  *(void *)(v2 - 104) = (v1 - 32) | 0x8000000000000000LL;
  return static LogInterpolation.safe(_:)(v2 - 112);
}

uint64_t sub_100008628()
{
  return Log.error(_:)(v0);
}

uint64_t sub_100008634()
{
  return type metadata accessor for LogInterpolation(0LL);
}

uint64_t sub_100008640()
{
  return sub_1000080E0(v0 - 112);
}

uint64_t sub_100008648()
{
  return (*(uint64_t (**)(void, uint64_t))(v1 - 168))(0LL, v0);
}

uint64_t sub_100008660()
{
  return swift_bridgeObjectRelease(v0);
}

NSString sub_100008668()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100008674()
{
  return static Log.purchase.getter();
}

uint64_t sub_10000867C()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_100008684()
{
}

__n128 *sub_10000868C(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t sub_100008698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, v4 - 112, a3, a4, 6LL);
}

void sub_1000086A4()
{
  *(void *)(v1 - 88) = v0;
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend__dismissViewServiceWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissViewServiceWithResult:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_contentController(void *a1, const char *a2, ...)
{
  return _[a1 contentController];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissWithResult:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_makeContentViewControllerWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeContentViewControllerWithContext:completion:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedPressTypes:");
}

id objc_msgSend_setBlurStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurStyle:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setContentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentController:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsConfig];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedPurchaseConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedPurchaseConfig];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}
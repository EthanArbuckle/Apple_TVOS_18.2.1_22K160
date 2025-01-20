BOOL LocalizationTable.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C838, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

uint64_t sub_100003ED0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C870, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100003F20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s15SeymourTopShelf17LocalizationTableO8rawValueSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003F44()
{
  uint64_t v0 = type metadata accessor for Locale(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [objc_allocWithZone(NSDateFormatter) init];
  uint64_t v5 = type metadata accessor for SeymourLocalizationBundle(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
  id v7 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  v8 = (void *)static Locale.preferredLanguages.getter();
  v9 = v8;
  if (v8[2])
  {
    uint64_t v11 = v8[4];
    unint64_t v10 = v8[5];
    swift_bridgeObjectRetain(v10);
  }

  else
  {
    unint64_t v10 = 0xE500000000000000LL;
    uint64_t v11 = 0x53555F6E65LL;
  }

  swift_bridgeObjectRelease(v9);
  NSBundle.preferredLocale(for:)(v11, v10);
  swift_bridgeObjectRelease(v10);

  v12 = (void *)objc_opt_self(&OBJC_CLASS___NSDateFormatter);
  NSString v13 = String._bridgeToObjectiveC()();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v15 = [v12 dateFormatFromTemplate:v13 options:0 locale:isa];

  [v4 setDateFormat:v15];
  Class v16 = Date._bridgeToObjectiveC()().super.isa;
  id v17 = [v4 stringFromDate:v16];

  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v18;
}

uint64_t _s15SeymourTopShelf17LocalizationTableO8rawValueSSvg_0()
{
  return 0x617A696C61636F4CLL;
}

unint64_t sub_100004168()
{
  unint64_t result = qword_100010610;
  if (!qword_100010610)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for LocalizationTable,  &type metadata for LocalizationTable);
    atomic_store(result, (unint64_t *)&qword_100010610);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for LocalizationTable(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalizationTable(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100004244 + 4 * byte_10000ABB0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100004264 + 4 * byte_10000ABB5[v4]))();
  }
}

_BYTE *sub_100004244(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_100004264(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000426C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100004274(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000427C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100004284(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_100004290()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for LocalizationTable()
{
  return &type metadata for LocalizationTable;
}

uint64_t sub_1000042AC()
{
  return 1LL;
}

Swift::Int sub_1000042B4()
{
  return Hasher._finalize()();
}

uint64_t sub_10000430C(uint64_t a1)
{
  return String.hash(into:)(a1, 0x617A696C61636F4CLL, 0xEB00000000656C62LL);
}

Swift::Int sub_10000432C(uint64_t a1)
{
  return Hasher._finalize()();
}

id sub_100004380()
{
  uint64_t v1 = v0;
  int v2 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v3 = static Dependencies.standard(queue:)();

  uint64_t v4 = sub_1000084A8(&qword_1000107E8);
  dispatch thunk of Dependencies.resolve<A>(failureHandler:)(&v57, 0LL, 0LL, v4);
  sub_10000A2B0(&v57, (uint64_t)&v1[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient]);
  uint64_t v5 = sub_1000084A8(&qword_1000107F0);
  dispatch thunk of Dependencies.resolve<A>(failureHandler:)(&v57, 0LL, 0LL, v5);
  sub_10000A2B0(&v57, (uint64_t)&v1[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_remoteBrowsingClient]);
  uint64_t v6 = sub_1000084A8(&qword_1000107F8);
  uint64_t v53 = v3;
  dispatch thunk of Dependencies.resolve<A>(failureHandler:)(&v57, 0LL, 0LL, v6);
  uint64_t v7 = (uint64_t)&v1[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_subscriptionClient];
  v8 = v1;
  sub_10000A2B0(&v57, (uint64_t)&v1[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_subscriptionClient]);
  uint64_t v9 = type metadata accessor for SeymourLocalizationBundle(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v9);
  id v11 = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  uint64_t v12 = type metadata accessor for StorefrontCache(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  uint64_t v13 = StorefrontCache.init()();
  uint64_t v58 = v12;
  v59 = &protocol witness table for StorefrontCache;
  *(void *)&__int128 v57 = v13;
  uint64_t v14 = type metadata accessor for StorefrontLocalizer(0LL);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  uint64_t v15 = StorefrontLocalizer.init(bundle:storefrontCache:)(v11, &v57);
  uint64_t v16 = OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_localizer;
  *(void *)&v8[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_localizer] = v15;
  uint64_t v17 = ((uint64_t (*)(void))swift_retain)();
  dispatch thunk of StorefrontLocalizer.activate()(v17);
  swift_release(v15);
  uint64_t v18 = *(void *)&v8[v16];
  v54 = v8;
  uint64_t v58 = v14;
  v59 = &protocol witness table for StorefrontLocalizer;
  *(void *)&__int128 v57 = v18;
  v56[3] = type metadata accessor for DefaultWheelchairStatus(0LL);
  v56[4] = &protocol witness table for DefaultWheelchairStatus;
  sub_10000A1F8(v56);
  uint64_t v19 = swift_retain(v18);
  uint64_t v20 = DefaultWheelchairStatus.init()(v19);
  uint64_t v21 = static Platform.current.getter(v20);
  uint64_t v22 = type metadata accessor for MediaTagStringBuilder(0LL);
  swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
  uint64_t v23 = MediaTagStringBuilder.init(storefrontLocalizer:table:wheelchairStatus:platform:)(&v57, 0LL, 0LL, v56, v21);
  v24 = (uint64_t *)&v8[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_mediaTagStringBuilder];
  v24[3] = v22;
  v24[4] = (uint64_t)&protocol witness table for MediaTagStringBuilder;
  uint64_t *v24 = v23;
  uint64_t v25 = sub_1000084A8(&qword_100010800);
  dispatch thunk of Dependencies.resolve<A>(failureHandler:)(&v57, 0LL, 0LL, v25);
  __int128 v26 = v57;
  uint64_t v27 = type metadata accessor for AccountProvider(0LL);
  v28 = (void *)objc_opt_self(&OBJC_CLASS___ACAccountStore);
  swift_unknownObjectRetain(v26);
  id v29 = objc_msgSend(v28, "ams_sharedAccountStore");
  uint64_t v58 = sub_10000A234(0LL, &qword_100010808, &OBJC_CLASS___ACAccountStore_ptr);
  v59 = &protocol witness table for ACAccountStore;
  *(void *)&__int128 v57 = v29;
  uint64_t v30 = AccountProvider.__allocating_init(eventHub:accountStore:)(v26, *((void *)&v26 + 1), &v57);
  uint64_t v31 = dispatch thunk of AccountProvider.activate()();
  static BagConstants.profileName.getter(v31);
  uint64_t v33 = v32;
  static BagConstants.profileVersion.getter();
  uint64_t v35 = v34;
  NSString v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v33);
  NSString v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v35);
  id v38 = [(id)objc_opt_self(AMSBag) bagForProfile:v36 profileVersion:v37];

  uint64_t v58 = v27;
  v59 = &protocol witness table for AccountProvider;
  *(void *)&__int128 v57 = v30;
  sub_10000A26C(v7, (uint64_t)v56);
  swift_retain(v30);
  id v39 = v38;
  uint64_t v40 = static OS_dispatch_queue.main.getter();
  uint64_t v41 = static MarketingItemConstants.clientIdentifier.getter();
  uint64_t v43 = v42;
  uint64_t v44 = static MarketingItemConstants.clientVersion.getter();
  uint64_t v46 = v45;
  uint64_t v47 = static MarketingItemConstants.serviceType.getter();
  uint64_t v49 = v48;
  uint64_t v50 = type metadata accessor for MarketingItemProvider(0LL);
  swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
  uint64_t v51 = MarketingItemProvider.init(accountProvider:bag:subscriptionClient:queue:clientIdentifier:clientVersion:serviceType:)( &v57,  v39,  v56,  v40,  v41,  v43,  v44,  v46,  v47,  v49);
  uint64_t v58 = v50;
  v59 = &protocol witness table for MarketingItemProvider;
  swift_release(v53);

  swift_release(v30);
  swift_unknownObjectRelease(v26);
  *(void *)&__int128 v57 = v51;
  sub_10000A2B0(&v57, (uint64_t)v54 + OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider);

  v55.receiver = v54;
  v55.super_class = (Class)type metadata accessor for ContentProvider();
  return objc_msgSendSuper2(&v55, "init");
}

uint64_t sub_100004868(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v90 = a1;
  uint64_t v91 = a2;
  v83 = (void *)sub_1000084A8(&qword_1000107C8);
  uint64_t v4 = *(v83 - 1);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(v83);
  uint64_t v7 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v79 - v8;
  uint64_t v10 = sub_1000084A8(&qword_100010760);
  v86 = *(char **)(v10 - 8);
  uint64_t v87 = v10;
  uint64_t v11 = *((void *)v86 + 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v85 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v12);
  v84 = (char *)&v79 - v14;
  __chkstk_darwin(v13);
  v88 = (char *)&v79 - v15;
  uint64_t v16 = sub_1000084A8(&qword_1000107D0);
  uint64_t v94 = *(void *)(v16 - 8);
  uint64_t v95 = v16;
  uint64_t v93 = *(void *)(v94 + 64);
  uint64_t v17 = __chkstk_darwin(v16);
  v92 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  v89 = (char *)&v79 - v20;
  __chkstk_darwin(v19);
  v96 = (char *)&v79 - v21;
  uint64_t v22 = type metadata accessor for ServiceSubscriptionRequest(0LL);
  uint64_t v98 = *(void *)(v22 - 8);
  uint64_t v99 = v22;
  __chkstk_darwin(v22);
  v24 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v97 = v24;
  ServiceSubscriptionRequest.init(authenticationBehavior:cacheBehavior:)(0LL, 1LL);
  uint64_t v26 = *(void *)&v2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_subscriptionClient + 24];
  uint64_t v25 = *(void *)&v2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_subscriptionClient + 32];
  sub_1000098C0(&v2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_subscriptionClient], v26);
  dispatch thunk of ServiceSubscriptionClientProtocol.fetchServiceSubscription(with:)(v24, v26, v25);
  uint64_t v27 = swift_allocObject(&unk_10000CD60, 24LL, 7LL);
  *(void *)(v27 + 16) = v3;
  v28 = v3;
  id v29 = v83;
  (*(void (**)(char *, char *, void *))(v4 + 16))(v7, v9, v83);
  uint64_t v30 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v31 = (v30 + 16) & ~v30;
  unint64_t v32 = (v5 + v31 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v33 = swift_allocObject(&unk_10000CD88, v32 + 16, v30 | 7);
  (*(void (**)(uint64_t, char *, void *))(v4 + 32))(v33 + v31, v7, v29);
  uint64_t v34 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v33 + v32);
  *uint64_t v34 = sub_100009D88;
  v34[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v27;
  id v35 = v28;
  uint64_t v36 = sub_1000084A8(&qword_100010750);
  NSString v37 = v84;
  Promise.init(asyncOperation:)(sub_100009DB4, v33, v36);
  (*(void (**)(char *, void *))(v4 + 8))(v9, v29);
  uint64_t v38 = swift_allocObject(&unk_10000CDB0, 24LL, 7LL);
  *(void *)(v38 + 16) = v35;
  uint64_t v40 = v85;
  id v39 = v86;
  v83 = (void *)*((void *)v86 + 2);
  uint64_t v41 = v87;
  ((void (*)(char *, char *, uint64_t))v83)(v85, v37, v87);
  uint64_t v42 = v39[80];
  uint64_t v43 = (v42 + 16) & ~v42;
  unint64_t v44 = (v11 + v43 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v81 = v44 + 16;
  uint64_t v82 = v42 | 7;
  uint64_t v45 = swift_allocObject(&unk_10000CDD8, v44 + 16, v42 | 7);
  v80 = (void (*)(uint64_t, char *, uint64_t))*((void *)v39 + 4);
  uint64_t v46 = v40;
  uint64_t v47 = v41;
  v80(v45 + v43, v46, v41);
  uint64_t v48 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v45 + v44);
  *uint64_t v48 = sub_100009DD8;
  v48[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v38;
  id v49 = v35;
  uint64_t v50 = v88;
  Promise.init(asyncOperation:)(sub_1000099FC, v45, v36);
  v85 = (char *)*((void *)v39 + 1);
  ((void (*)(char *, uint64_t))v85)(v37, v47);
  uint64_t v51 = swift_allocObject(&unk_10000CE00, 32LL, 7LL);
  uint64_t v52 = v90;
  uint64_t v53 = v91;
  *(void *)(v51 + 16) = v90;
  *(void *)(v51 + 24) = v53;
  uint64_t v54 = swift_allocObject(&unk_10000CE28, 32LL, 7LL);
  *(void *)(v54 + 16) = sub_100009DEC;
  *(void *)(v54 + 24) = v51;
  ((void (*)(char *, char *, uint64_t))v83)(v37, v50, v47);
  uint64_t v55 = swift_allocObject(&unk_10000CE50, v81, v82);
  v80(v55 + v43, v37, v47);
  v56 = (uint64_t (**)(uint64_t *))(v55 + v44);
  *v56 = sub_100009E18;
  v56[1] = (uint64_t (*)(uint64_t *))v54;
  swift_retain(v53);
  v86 = (char *)&type metadata for () + 8;
  __int128 v57 = v89;
  Promise.init(asyncOperation:)(sub_100009E2C, v55, (char *)&type metadata for () + 8);
  ((void (*)(char *, uint64_t))v85)(v50, v47);
  uint64_t v58 = swift_allocObject(&unk_10000CE78, 32LL, 7LL);
  *(void *)(v58 + 16) = v52;
  *(void *)(v58 + 24) = v53;
  uint64_t v59 = v53;
  uint64_t v60 = swift_allocObject(&unk_10000CEA0, 32LL, 7LL);
  *(void *)(v60 + 16) = sub_100009E74;
  *(void *)(v60 + 24) = v58;
  uint64_t v62 = v94;
  uint64_t v61 = v95;
  v63 = v92;
  v64 = v57;
  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v92, v57, v95);
  uint64_t v65 = *(unsigned __int8 *)(v62 + 80);
  uint64_t v66 = v62;
  uint64_t v67 = (v65 + 16) & ~v65;
  unint64_t v68 = (v93 + v67 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v69 = swift_allocObject(&unk_10000CEC8, v68 + 16, v65 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v69 + v67, v63, v61);
  v70 = (uint64_t (**)(uint64_t))(v69 + v68);
  *v70 = sub_100009E8C;
  v70[1] = (uint64_t (*)(uint64_t))v60;
  swift_retain(v59);
  v71 = v96;
  Promise.init(asyncOperation:)(sub_100009EA0, v69, v86);
  v72 = *(void (**)(char *, uint64_t))(v66 + 8);
  v72(v64, v61);
  uint64_t v73 = v61;
  v74 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v61);
  uint64_t v76 = v75;
  uint64_t v77 = swift_allocObject(&unk_10000CEF0, 32LL, 7LL);
  *(void *)(v77 + 16) = 0LL;
  *(void *)(v77 + 24) = 0LL;
  v74(sub_100009A34, v77);
  swift_release(v76);
  swift_release(v77);
  v72(v71, v73);
  return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v97, v99);
}

uint64_t sub_100004E5C@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  uint64_t v4 = sub_1000084A8(&qword_100010768);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  unint64_t v44 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v45 = (char *)&v40 - v8;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.default.getter(v11);
  swift_errorRetain(a1);
  uint64_t v14 = swift_errorRetain(a1);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc(12LL, -1LL);
    uint64_t v43 = v4;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    uint64_t v42 = v9;
    uint64_t v20 = v19;
    uint64_t v51 = v19;
    uint64_t v41 = v10;
    *(_DWORD *)uint64_t v18 = 136446210;
    uint64_t v40 = v18 + 4;
    swift_getErrorValue(a1, v50, v49);
    uint64_t v21 = Error.logOutput.getter(v49[1], v49[2]);
    unint64_t v23 = v22;
    uint64_t v48 = sub_1000084E8(v21, v22, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, v49, v40, v18 + 12);
    swift_bridgeObjectRelease(v23);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Top Shelf unable to fetch subscription: %{public}s", v18, 0xCu);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    v24 = v18;
    uint64_t v4 = v43;
    swift_slowDealloc(v24, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v42);
  }

  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }

  uint64_t v25 = v46;
  uint64_t v26 = *(void *)&v46[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider + 24];
  uint64_t v27 = *(void *)&v46[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider + 32];
  sub_1000098C0(&v46[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider], v26);
  v28 = v45;
  MarketingItemProviding.fetchMarketingItem(for:offerHint:)(10LL, 0LL, 0LL, v26, v27);
  uint64_t v29 = swift_allocObject(&unk_10000D008, 24LL, 7LL);
  *(void *)(v29 + 16) = v25;
  uint64_t v30 = swift_allocObject(&unk_10000D030, 32LL, 7LL);
  *(void *)(v30 + 16) = sub_100009FA4;
  *(void *)(v30 + 24) = v29;
  uint64_t v31 = v44;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v44, v28, v4);
  uint64_t v32 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v33 = (v32 + 16) & ~v32;
  unint64_t v34 = (v6 + v33 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v35 = swift_allocObject(&unk_10000D058, v34 + 16, v32 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v35 + v33, v31, v4);
  uint64_t v36 = (void *)(v35 + v34);
  *uint64_t v36 = sub_10000A2EC;
  v36[1] = v30;
  id v37 = v25;
  uint64_t v38 = sub_1000084A8(&qword_100010750);
  Promise.init(asyncOperation:)(sub_100009A44, v35, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v28, v4);
}

uint64_t sub_1000051E0(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Log.default.getter(v8);
  swift_errorRetain(a1);
  uint64_t v11 = swift_errorRetain(a1);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc(12LL, -1LL);
    v24 = a2;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v25 = v3;
    uint64_t v17 = v16;
    uint64_t v30 = v16;
    v23[0] = v7;
    v23[1] = a3;
    *(_DWORD *)uint64_t v15 = 136446210;
    swift_getErrorValue(a1, v29, v28);
    uint64_t v18 = Error.logOutput.getter(v28[1], v28[2]);
    unint64_t v20 = v19;
    uint64_t v27 = sub_1000084E8(v18, v19, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v20);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error in the top shelf: %{public}s", v15, 0xCu);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1LL, -1LL);
    uint64_t v21 = v15;
    a2 = v24;
    swift_slowDealloc(v21, -1LL, -1LL);

    (*(void (**)(char *, void))(v26 + 8))(v10, v23[0]);
  }

  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v7);
  }

  return a2(0LL);
}

uint64_t sub_100005470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v55 = a1;
  uint64_t v56 = a2;
  uint64_t v4 = type metadata accessor for ServiceSubscription(0LL);
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  uint64_t v54 = *(void *)(v52 + 64);
  __chkstk_darwin(v4);
  uint64_t v50 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000084A8(&qword_100010758);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v45 - v11;
  uint64_t v51 = sub_1000084A8(&qword_100010760);
  uint64_t v49 = *(void *)(v51 - 8);
  uint64_t v13 = *(void *)(v49 + 64);
  uint64_t v14 = __chkstk_darwin(v51);
  uint64_t v48 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v46 = (char *)&v45 - v15;
  uint64_t v17 = *(void *)&v2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_remoteBrowsingClient + 24];
  uint64_t v16 = *(void *)&v2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_remoteBrowsingClient + 32];
  sub_1000098C0(&v2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_remoteBrowsingClient], v17);
  dispatch thunk of RemoteBrowsingClientProtocol.queryConnectionRecord()(v17, v16);
  uint64_t v18 = swift_allocObject(&unk_10000C9C8, 24LL, 7LL);
  *(void *)(v18 + 16) = v3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v19 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = (v19 + 16) & ~v19;
  unint64_t v21 = (v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v22 = swift_allocObject(&unk_10000C9F0, v21 + 16, v19 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v22 + v20, v10, v6);
  unint64_t v23 = (uint64_t (**)(uint64_t))(v22 + v21);
  *unint64_t v23 = sub_1000098E4;
  v23[1] = (uint64_t (*)(uint64_t))v18;
  id v24 = v3;
  uint64_t v47 = sub_1000084A8(&qword_100010750);
  uint64_t v25 = v46;
  Promise.init(asyncOperation:)(sub_1000098F8, v22, v47);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  uint64_t v26 = v52;
  uint64_t v27 = v53;
  v28 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v50, v55, v53);
  uint64_t v29 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v30 = v26;
  uint64_t v31 = (v29 + 16) & ~v29;
  unint64_t v32 = (v54 + v31 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v33 = swift_allocObject(&unk_10000CA18, v32 + 8, v29 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v33 + v31, v28, v27);
  *(void *)(v33 + v32) = v24;
  uint64_t v35 = v48;
  uint64_t v34 = v49;
  uint64_t v36 = v51;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v48, v25, v51);
  uint64_t v37 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v38 = v34;
  uint64_t v39 = (v37 + 16) & ~v37;
  unint64_t v40 = (v13 + v39 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v41 = swift_allocObject(&unk_10000CA40, v40 + 16, v37 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v41 + v39, v35, v36);
  uint64_t v42 = (uint64_t (**)@<X0>(uint64_t@<X8>))(v41 + v40);
  *uint64_t v42 = sub_100009990;
  v42[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v33;
  id v43 = v24;
  Promise.init(asyncOperation:)(sub_1000099FC, v41, v47);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v25, v36);
}

uint64_t sub_1000057B4(uint64_t a1, char *a2)
{
  uint64_t v3 = sub_1000084A8(&qword_100010770);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = *(void *)&a2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient + 24];
  uint64_t v11 = *(void *)&a2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient + 32];
  sub_1000098C0(&a2[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient], v10);
  dispatch thunk of CatalogClientProtocol.fetchRemoteTopShelfCatalogWorkoutDetails()(v10, v11);
  uint64_t v12 = swift_allocObject(&unk_10000CCC0, 24LL, 7LL);
  *(void *)(v12 + 16) = a2;
  uint64_t v13 = swift_allocObject(&unk_10000CCE8, 32LL, 7LL);
  *(void *)(v13 + 16) = sub_10000A2E8;
  *(void *)(v13 + 24) = v12;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  uint64_t v14 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  unint64_t v16 = (v5 + v15 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v17 = swift_allocObject(&unk_10000CD10, v16 + 16, v14 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v17 + v15, v7, v3);
  uint64_t v18 = (void *)(v17 + v16);
  *uint64_t v18 = sub_10000A2EC;
  v18[1] = v13;
  uint64_t v19 = a2;
  uint64_t v20 = sub_1000084A8(&qword_100010750);
  Promise.init(asyncOperation:)(sub_100009AA0, v17, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_10000595C@<X0>(char *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  uint64_t v2 = sub_1000084A8(&qword_100010768);
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  uint64_t v3 = *(void *)(v50 + 64);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v48 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v49 = (char *)&v48 - v5;
  uint64_t v6 = sub_1000084A8(&qword_100010770);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v48 - v11;
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Date.init()(v15);
  char v18 = ServiceSubscription.isSubscribed(date:)(v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((v18 & 1) != 0)
  {
    uint64_t v19 = v52;
    uint64_t v20 = *(void *)&v52[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient + 24];
    uint64_t v21 = *(void *)&v52[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient + 32];
    sub_1000098C0(&v52[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_catalogClient], v20);
    dispatch thunk of CatalogClientProtocol.fetchRemoteTopShelfCatalogWorkoutDetails()(v20, v21);
    uint64_t v22 = swift_allocObject(&unk_10000CB30, 24LL, 7LL);
    *(void *)(v22 + 16) = v19;
    uint64_t v23 = swift_allocObject(&unk_10000CB58, 32LL, 7LL);
    *(void *)(v23 + 16) = sub_100009A68;
    *(void *)(v23 + 24) = v22;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    uint64_t v24 = *(unsigned __int8 *)(v7 + 80);
    uint64_t v25 = (v24 + 16) & ~v24;
    unint64_t v26 = (v8 + v25 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v27 = swift_allocObject(&unk_10000CB80, v26 + 16, v24 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v27 + v25, v10, v6);
    v28 = (void *)(v27 + v26);
    void *v28 = sub_100009A70;
    v28[1] = v23;
    id v29 = v19;
    uint64_t v30 = sub_1000084A8(&qword_100010750);
    Promise.init(asyncOperation:)(sub_100009AA0, v27, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }

  else
  {
    unint64_t v32 = v52;
    uint64_t v33 = *(void *)&v52[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider + 24];
    uint64_t v34 = *(void *)&v52[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider + 32];
    sub_1000098C0(&v52[OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_marketingItemProvider], v33);
    uint64_t v35 = v49;
    MarketingItemProviding.fetchMarketingItem(for:offerHint:)(10LL, 0LL, 0LL, v33, v34);
    uint64_t v36 = swift_allocObject(&unk_10000CAB8, 24LL, 7LL);
    *(void *)(v36 + 16) = v32;
    uint64_t v37 = swift_allocObject(&unk_10000CAE0, 32LL, 7LL);
    *(void *)(v37 + 16) = sub_10000A328;
    *(void *)(v37 + 24) = v36;
    uint64_t v39 = v50;
    uint64_t v38 = v51;
    unint64_t v40 = v48;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v48, v35, v51);
    uint64_t v41 = *(unsigned __int8 *)(v39 + 80);
    uint64_t v42 = (v41 + 16) & ~v41;
    unint64_t v43 = (v3 + v42 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v44 = swift_allocObject(&unk_10000CB08, v43 + 16, v41 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v44 + v42, v40, v38);
    uint64_t v45 = (void *)(v44 + v43);
    *uint64_t v45 = sub_10000A2EC;
    v45[1] = v37;
    id v46 = v32;
    uint64_t v47 = sub_1000084A8(&qword_100010750);
    Promise.init(asyncOperation:)(sub_100009A44, v44, v47);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v35, v38);
  }
}

uint64_t sub_100005CF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100009AE4(a1, (uint64_t)v3);

  uint64_t v5 = TVTopShelfCarouselContentStyleDetailsFitness;
  id v6 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselContent);
  sub_10000A234(0LL, &qword_1000106E8, &OBJC_CLASS___TVTopShelfCarouselItem_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  id v8 = [v6 initWithStyle:v5 items:isa];

  uint64_t v9 = swift_allocObject(&unk_10000CBF8, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_1000084A8(&qword_100010750);
  return Promise.init(synchronousOperation:)(sub_10000A32C, v9, v10);
}

uint64_t sub_100005DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v344 = a3;
  *(void *)&__int128 v349 = type metadata accessor for CatalogWorkoutDetail(0LL);
  v358 = *(void (***)(void, void))(v349 - 8);
  __chkstk_darwin(v349);
  v340 = (char *)&v312 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t countAndFlagsBits = type metadata accessor for Logger(0LL);
  uint64_t v341 = *(void *)(countAndFlagsBits - 8);
  __chkstk_darwin(countAndFlagsBits);
  v356 = (char *)&v312 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v324 = type metadata accessor for Artwork(0LL);
  uint64_t v322 = *(void *)(v324 - 8);
  __chkstk_darwin(v324);
  v323 = (char *)&v312 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_1000084A8(&qword_1000106E0);
  uint64_t v9 = __chkstk_darwin(v8);
  v321 = (char *)&v312 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v325 = (uint64_t)&v312 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v326 = (char *)&v312 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v336 = (uint64_t)&v312 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v316 = (char *)&v312 - v18;
  __chkstk_darwin(v17);
  v319 = (char *)&v312 - v19;
  uint64_t v331 = type metadata accessor for CatalogModality(0LL);
  uint64_t v330 = *(void *)(v331 - 8);
  __chkstk_darwin(v331);
  v329 = (char *)&v312 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v339 = type metadata accessor for URL(0LL);
  v338 = *(void **)(v339 - 8);
  uint64_t v21 = __chkstk_darwin(v339);
  v315 = (char *)&v312 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v21);
  v314 = (char *)&v312 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v318 = (char *)&v312 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v320 = (char *)&v312 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v317 = (char *)&v312 - v30;
  __chkstk_darwin(v29);
  v337 = (char *)&v312 - v31;
  uint64_t v32 = type metadata accessor for MusicGenre(0LL);
  uint64_t v33 = *(os_log_s **)(v32 - 8);
  v361 = (uint8_t *)v32;
  os_log_t v362 = v33;
  __chkstk_darwin(v32);
  v360 = (char *)&v312 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = sub_1000084A8(&qword_100010778);
  __chkstk_darwin(v35);
  v335 = (char *)&v312 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = sub_1000084A8(&qword_100010780);
  __chkstk_darwin(v37);
  v334 = (char *)&v312 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v357 = type metadata accessor for DateComponents(0LL);
  v347 = *(_OWORD **)(v357 - 8);
  uint64_t v39 = __chkstk_darwin(v357);
  v332 = (char *)&v312 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v39);
  uint64_t v42 = (char *)&v312 - v41;
  uint64_t v348 = type metadata accessor for Calendar(0LL);
  v346 = *(void (***)(void, uint64_t))(v348 - 8);
  __chkstk_darwin(v348);
  v345 = (char *)&v312 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = sub_1000084A8(&qword_100010788);
  __chkstk_darwin(v44);
  uint64_t v359 = (uint64_t)&v312 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v46 = type metadata accessor for Date(0LL);
  uint64_t v350 = *(void *)(v46 - 8);
  uint64_t v351 = v46;
  __chkstk_darwin(v46);
  v343 = (char *)&v312 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = type metadata accessor for CatalogWorkout(0LL);
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = __chkstk_darwin(v48);
  v327 = (char *)&v312 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = __chkstk_darwin(v50);
  v333 = (char *)&v312 - v53;
  uint64_t v54 = __chkstk_darwin(v52);
  uint64_t v56 = (char *)&v312 - v55;
  uint64_t v57 = CatalogWorkoutDetail.workout.getter(v54);
  CatalogWorkout.identifier.getter(v57);
  uint64_t v59 = v58;
  uint64_t v60 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v353 = v48;
  v354 = v60;
  v60(v56, v48);
  id v61 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselItem);
  NSString v62 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v59);
  id v63 = [v61 initWithIdentifier:v62];

  uint64_t v64 = *(void *)(a2 + OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_mediaTagStringBuilder + 24);
  v328 = (void *)(a2 + OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_mediaTagStringBuilder);
  sub_1000098C0((void *)(a2 + OBJC_IVAR____TtC15SeymourTopShelf15ContentProvider_mediaTagStringBuilder), v64);
  id v65 = v63;
  uint64_t v355 = a1;
  v66._rawValue = (void *)CatalogWorkoutDetail.titleTags.getter();
  Class isa = MediaTagStringBuilding.attributedString(for:)(v66).super.isa;
  swift_bridgeObjectRelease(v66._rawValue);
  NSString v68 = -[objc_class string](isa, "string");

  if (!v68)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v70 = v69;
    NSString v68 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v70);
  }

  [v65 setTitle:v68];
  id v352 = v65;

  v71 = v345;
  uint64_t v72 = static Calendar.current.getter();
  uint64_t v73 = v56;
  uint64_t v74 = CatalogWorkoutDetail.workout.getter(v72);
  CatalogWorkout.dateReleased.getter(v74);
  uint64_t v76 = v353;
  uint64_t v75 = v354;
  v354(v56, v353);
  uint64_t v77 = v359;
  Calendar.date(from:)(v42);
  v347 = (_OWORD *)*((void *)v347 + 1);
  ((void (*)(char *, uint64_t))v347)(v42, v357);
  v78 = v346;
  uint64_t v79 = v71;
  uint64_t v80 = v348;
  ((void (**)(char *, uint64_t))v346)[1](v79, v348);
  uint64_t v81 = v350;
  uint64_t v82 = v77;
  uint64_t v83 = v351;
  int v84 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v350 + 48))(v82, 1LL, v351);
  uint64_t v85 = v355;
  uint64_t v86 = v83;
  uint64_t v87 = v81;
  v88 = v73;
  v89 = v358;
  if (v84 == 1)
  {
    uint64_t v90 = sub_100009C14(v359, &qword_100010788);
    uint64_t v91 = v349;
    v92 = v340;
LABEL_20:
    v156 = v356;
    static Log.default.getter(v90);
    uint64_t v157 = ((uint64_t (*)(char *, uint64_t, uint64_t))v89[2])(v92, v85, v91);
    v158 = (os_log_s *)Logger.logObject.getter(v157);
    os_log_type_t v159 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v158, v159))
    {
      os_log_t v362 = v158;
      v160 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v161 = (void *)swift_slowAlloc(32LL, -1LL);
      v364 = v161;
      *(_DWORD *)v160 = 136446210;
      v361 = v160 + 4;
      CatalogWorkoutDetail.workout.getter(v161);
      unint64_t v162 = sub_100009C50();
      uint64_t v163 = dispatch thunk of CustomStringConvertible.description.getter(v76, v162);
      unint64_t v165 = v164;
      v354(v88, v76);
      uint64_t v363 = sub_1000084E8(v163, v165, (uint64_t *)&v364);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v363, &v364, v361, v160 + 12);
      swift_bridgeObjectRelease(v165);
      ((void (**)(char *, void))v358)[1](v92, v349);
      os_log_t v166 = v362;
      _os_log_impl( (void *)&_mh_execute_header,  v362,  v159,  "Failed to build date or duration strings for %{public}s",  v160,  0xCu);
      swift_arrayDestroy(v161, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v161, -1LL, -1LL);
      swift_slowDealloc(v160, -1LL, -1LL);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v341 + 8))(v356, countAndFlagsBits);
    }

    else
    {

      ((void (**)(char *, uint64_t))v89)[1](v92, v91);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v341 + 8))(v156, countAndFlagsBits);
    }

    id v167 = 0LL;
    v168 = v344;
LABEL_24:
    void *v168 = v167;
    return result;
  }

  v345 = v73;
  uint64_t v93 = v87;
  uint64_t v94 = v343;
  uint64_t v95 = v86;
  (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v343, v359, v86);
  uint64_t v96 = sub_100003F44();
  if (!v97)
  {
    uint64_t v90 = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v94, v95);
    v92 = v340;
    uint64_t v91 = v349;
    v88 = v345;
    goto LABEL_20;
  }

  uint64_t v312 = v96;
  uint64_t v313 = v97;
  uint64_t v98 = v333;
  uint64_t v99 = CatalogWorkoutDetail.workout.getter(v96);
  double v100 = CatalogWorkout.duration.getter(v99);
  v75(v98, v76);
  v101 = v334;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v78[7])(v334, 1LL, 1LL, v80);
  uint64_t v102 = type metadata accessor for TimeZone(0LL);
  v103 = v335;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56LL))( v335,  1LL,  1LL,  v102);
  double v105 = ceil(v100);
  if ((~*(void *)&v105 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_48;
  }

  if (v105 <= -9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }

  if (v105 >= 9.22337204e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }

  v106 = v332;
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( v101,  v103,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL,  0LL,  1,  0LL,  0,  0LL,  0,  (uint64_t)v105,  0,  0LL,  1,  0LL,  1,  0LL,  1,  0LL,  1,  0LL,  1,  0LL,  1,  0LL,  1);
  id v107 = [objc_allocWithZone(NSDateComponentsFormatter) init];
  [v107 setUnitsStyle:5];
  [v107 setAllowedUnits:112];
  Class v108 = DateComponents._bridgeToObjectiveC()().super.isa;
  id v109 = [v107 stringFromDateComponents:v108];

  if (!v109)
  {

    ((void (*)(char *, uint64_t))v347)(v106, v357);
    (*(void (**)(char *, uint64_t))(v350 + 8))(v343, v351);
    uint64_t v90 = swift_bridgeObjectRelease(v313);
    uint64_t v85 = v355;
    uint64_t v76 = v353;
    v88 = v345;
    v89 = v358;
    v92 = v340;
    uint64_t v91 = v349;
    goto LABEL_20;
  }

  uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
  uint64_t v112 = v111;

  ((void (*)(char *, uint64_t))v347)(v106, v357);
  uint64_t v113 = sub_1000084A8(&qword_100010798);
  v114 = (_OWORD *)swift_allocObject(v113, 56LL, 7LL);
  v114[1] = xmmword_10000AC90;
  uint64_t v115 = type metadata accessor for SeymourLocalizationBundle(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v115);
  v117 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  v118 = (NSBundle *)[v117 bundleForClass:ObjCClassFromMetadata];
  v366._object = (void *)0xE000000000000000LL;
  v119._uint64_t countAndFlagsBits = 0x4E4F495441525544LL;
  v119._object = (void *)0xE800000000000000LL;
  v120.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v120.value._object = (void *)0xEB00000000656C62LL;
  v121._uint64_t countAndFlagsBits = 0LL;
  v121._object = (void *)0xE000000000000000LL;
  v366._uint64_t countAndFlagsBits = 0LL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v119, v120, v118, v121, v366)._object;

  uint64_t v348 = sub_1000084A8(&qword_1000107A0);
  uint64_t v123 = swift_allocObject(v348, 48LL, 7LL);
  __int128 v349 = xmmword_10000ACA0;
  *(_OWORD *)(v123 + 16) = xmmword_10000ACA0;
  *(void *)(v123 + 32) = v110;
  *(void *)(v123 + 40) = v112;
  id v124 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfNamedAttribute);
  NSString v125 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  Class v126 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v123);
  id v127 = [v124 initWithName:v125 values:v126];

  *((void *)v114 + 4) = v127;
  v358 = (void (**)(void, void))v117;
  uint64_t v359 = ObjCClassFromMetadata;
  v128 = (NSBundle *)[v117 bundleForClass:ObjCClassFromMetadata];
  v367._object = (void *)0xE000000000000000LL;
  v129._uint64_t countAndFlagsBits = 0x434953554DLL;
  v129._object = (void *)0xE500000000000000LL;
  v130.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v130.value._object = (void *)0xEB00000000656C62LL;
  v131._uint64_t countAndFlagsBits = 0LL;
  v131._object = (void *)0xE000000000000000LL;
  v367._uint64_t countAndFlagsBits = 0LL;
  Swift::String v132 = NSLocalizedString(_:tableName:bundle:value:comment:)(v129, v130, v128, v131, v367);
  v133 = v132._object;

  v134 = v327;
  uint64_t v136 = CatalogWorkoutDetail.workout.getter(v135);
  uint64_t v137 = CatalogWorkout.musicGenres.getter(v136);
  v354(v134, v353);
  int64_t v138 = *(void *)(v137 + 16);
  if (v138)
  {
    uint64_t countAndFlagsBits = v132._countAndFlagsBits;
    v346 = (void (**)(void, uint64_t))v132._object;
    v347 = v114;
    v364 = &_swiftEmptyArrayStorage;
    sub_1000095F8(0, v138, 0);
    unint64_t v139 = (*((unsigned __int8 *)v362 + 80) + 32LL) & ~(unint64_t)*((unsigned __int8 *)v362 + 80);
    uint64_t v341 = v137;
    unint64_t v140 = v137 + v139;
    uint64_t v141 = *((void *)v362 + 9);
    v356 = (char *)*((void *)v362 + 2);
    uint64_t v357 = v141;
    v142 = v360;
    do
    {
      v143 = v361;
      uint64_t v144 = ((uint64_t (*)(char *, unint64_t, uint8_t *))v356)(v142, v140, v361);
      uint64_t v145 = MusicGenre.name.getter(v144);
      v147 = v146;
      v148 = (NSBundle *)[v358 bundleForClass:v359];
      v368._object = (void *)0xE000000000000000LL;
      v149._uint64_t countAndFlagsBits = v145;
      v149._object = v147;
      v150.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
      v150.value._object = (void *)0xEB00000000656C62LL;
      v151._uint64_t countAndFlagsBits = 0LL;
      v151._object = (void *)0xE000000000000000LL;
      v368._uint64_t countAndFlagsBits = 0LL;
      Swift::String v152 = NSLocalizedString(_:tableName:bundle:value:comment:)(v149, v150, v148, v151, v368);
      swift_bridgeObjectRelease(v147);

      (*((void (**)(char *, uint8_t *))v362 + 1))(v142, v143);
      v153 = v364;
      if ((swift_isUniquelyReferenced_nonNull_native(v364) & 1) == 0)
      {
        sub_1000095F8(0, *((void *)v153 + 2) + 1LL, 1);
        v153 = v364;
      }

      unint64_t v155 = *((void *)v153 + 2);
      unint64_t v154 = *((void *)v153 + 3);
      if (v155 >= v154 >> 1)
      {
        sub_1000095F8(v154 > 1, v155 + 1, 1);
        v153 = v364;
      }

      *((void *)v153 + 2) = v155 + 1;
      *((Swift::String *)v153 + v155 + 2) = v152;
      v140 += v357;
      --v138;
    }

    while (v138);
    swift_bridgeObjectRelease(v341);
    v133 = v346;
    v114 = v347;
  }

  else
  {
    swift_bridgeObjectRelease(v137);
    v153 = &_swiftEmptyArrayStorage;
  }

  id v169 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfNamedAttribute);
  NSString v170 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v133);
  Class v171 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v153);
  id v172 = [v169 initWithName:v170 values:v171];

  *((void *)v114 + 5) = v172;
  v173 = (NSBundle *)[v358 bundleForClass:v359];
  v369._object = (void *)0xE000000000000000LL;
  v174._uint64_t countAndFlagsBits = 1163149636LL;
  v174._object = (void *)0xE400000000000000LL;
  v175.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v175.value._object = (void *)0xEB00000000656C62LL;
  v176._uint64_t countAndFlagsBits = 0LL;
  v176._object = (void *)0xE000000000000000LL;
  v369._uint64_t countAndFlagsBits = 0LL;
  v177 = NSLocalizedString(_:tableName:bundle:value:comment:)(v174, v175, v173, v176, v369)._object;

  uint64_t v178 = swift_allocObject(v348, 48LL, 7LL);
  *(_OWORD *)(v178 + 16) = v349;
  uint64_t v179 = v313;
  *(void *)(v178 + 32) = v312;
  *(void *)(v178 + 40) = v179;
  id v180 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfNamedAttribute);
  NSString v181 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v177);
  Class v182 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v178);
  id v183 = [v180 initWithName:v181 values:v182];

  *((void *)v114 + 6) = v183;
  v364 = v114;
  specialized Array._endMutation()();
  v184 = v364;
  sub_10000A234(0LL, &qword_1000107A8, &OBJC_CLASS___TVTopShelfNamedAttribute_ptr);
  Class v185 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v184);
  id v186 = v352;
  [v352 setNamedAttributes:v185];

  sub_1000098C0(v328, v328[3]);
  v187._rawValue = (void *)CatalogWorkoutDetail.summaryTags.getter();
  Class v188 = MediaTagStringBuilding.attributedString(for:)(v187).super.isa;
  swift_bridgeObjectRelease(v187._rawValue);
  NSString v189 = -[objc_class string](v188, "string");

  v190 = v337;
  if (!v189)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v192 = v191;
    NSString v189 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v192);
  }

  [v186 setSummary:v189];

  v193 = v345;
  uint64_t v195 = CatalogWorkoutDetail.workout.getter(v194);
  CatalogWorkout.sharingURL.getter(v195);
  uint64_t v196 = v353;
  v197 = (uint64_t (*)(char *, uint64_t))v354;
  uint64_t v198 = ((uint64_t (*)(char *, uint64_t))v354)(v193, v353);
  uint64_t v199 = CatalogWorkoutDetail.workout.getter(v198);
  v200 = v329;
  CatalogWorkout.modality.getter(v199);
  uint64_t v201 = v197(v193, v196);
  v202 = (void *)CatalogModality.healthKitActivityTypes.getter(v201);
  (*(void (**)(char *, uint64_t))(v330 + 8))(v200, v331);
  if (!v202[2])
  {
    uint64_t v217 = swift_bridgeObjectRelease(v202);
    uint64_t v218 = CatalogWorkoutDetail.workout.getter(v217);
    v219 = v317;
    CatalogWorkout.sharingURL.getter(v218);
    v197(v193, v196);
    id v220 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
    URL._bridgeToObjectiveC()(v221);
    v223 = v222;
    id v224 = [v220 initWithURL:v222];

    os_log_t v362 = (os_log_t)v338[1];
    ((void (*)(char *, uint64_t))v362)(v219, v339);
    v225 = (NSBundle *)[v358 bundleForClass:v359];
    v370._object = (void *)0xE000000000000000LL;
    v226._uint64_t countAndFlagsBits = 0x464E495F45524F4DLL;
    v226._object = (void *)0xE90000000000004FLL;
    v227.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
    v227.value._object = (void *)0xEB00000000656C62LL;
    v228._uint64_t countAndFlagsBits = 0LL;
    v228._object = (void *)0xE000000000000000LL;
    v370._uint64_t countAndFlagsBits = 0LL;
    v229 = NSLocalizedString(_:tableName:bundle:value:comment:)(v226, v227, v225, v228, v370)._object;

    NSString v230 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v229);
    [v224 _setTitle:v230];

    [v224 _setImageName:0];
    [v186 setDisplayAction:v224];

LABEL_40:
    v273 = v323;
    uint64_t v274 = ((uint64_t (*)(void))CatalogWorkoutDetail.headerArtwork.getter)();
    uint64_t v275 = Artwork.template.getter(v274);
    uint64_t v277 = v276;
    v278 = *(uint64_t (**)(char *, uint64_t))(v322 + 8);
    uint64_t v279 = v324;
    uint64_t v280 = v278(v273, v324);
    uint64_t v281 = CatalogWorkoutDetail.cropCode.getter(v280);
    uint64_t v283 = v282;
    uint64_t v284 = static FileType.jpg.getter();
    uint64_t v285 = v336;
    uint64_t v287 = URL.init(templateURLString:pixelWidth:pixelHeight:cropCode:fileType:)( v275,  v277,  1920LL,  1080LL,  v281,  v283,  v284,  v286);
    uint64_t v288 = CatalogWorkoutDetail.headerArtwork.getter(v287);
    uint64_t v289 = Artwork.template.getter(v288);
    uint64_t v291 = v290;
    uint64_t v292 = v278(v273, v279);
    uint64_t v293 = CatalogWorkoutDetail.cropCode.getter(v292);
    uint64_t v295 = v294;
    uint64_t v296 = static FileType.jpg.getter();
    uint64_t v297 = (uint64_t)v326;
    URL.init(templateURLString:pixelWidth:pixelHeight:cropCode:fileType:)( v289,  v291,  3840LL,  2160LL,  v293,  v295,  v296,  v298);
    uint64_t v299 = v325;
    sub_10000A144(v285, v325, &qword_1000106E0);
    v300 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v338[6];
    uint64_t v301 = v339;
    if (v300(v299, 1LL, v339) == 1)
    {
      v303 = 0LL;
    }

    else
    {
      URL._bridgeToObjectiveC()(v302);
      v303 = v304;
      ((void (*)(uint64_t, uint64_t))v362)(v299, v301);
    }

    uint64_t v305 = (uint64_t)v321;
    id v167 = v352;
    uint64_t v306 = v350;
    [v352 setImageURL:v303 forTraits:1];

    sub_10000A144(v297, v305, &qword_1000106E0);
    unsigned int v307 = v300(v305, 1LL, v301);
    v308 = v337;
    if (v307 == 1)
    {
      v309 = 0LL;
      v168 = v344;
      os_log_t v310 = v362;
    }

    else
    {
      URL._bridgeToObjectiveC()(&v365);
      v309 = v311;
      os_log_t v310 = v362;
      ((void (*)(uint64_t, uint64_t))v362)(v305, v301);
      v168 = v344;
    }

    [v167 setImageURL:v309 forTraits:2];

    sub_100009C14(v297, &qword_1000106E0);
    sub_100009C14(v336, &qword_1000106E0);
    ((void (*)(char *, uint64_t))v310)(v308, v301);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v306 + 8))(v343, v351);
    goto LABEL_24;
  }

  os_log_t v362 = (os_log_t)v202[2];
  uint64_t v203 = sub_1000084A8(&qword_1000107B0);
  uint64_t v204 = *(void *)(type metadata accessor for URLQueryItem(0LL) - 8);
  uint64_t v205 = *(void *)(v204 + 72);
  uint64_t v206 = *(unsigned __int8 *)(v204 + 80);
  v360 = (char *)(((v206 + 32) & ~v206) + v205);
  v361 = (uint8_t *)v203;
  uint64_t v357 = v206 | 7;
  uint64_t v207 = swift_allocObject(v203, v360, v206 | 7);
  *(_OWORD *)(v207 + 16) = v349;
  v364 = (void *)v202[4];
  uint64_t v208 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt,  &protocol witness table for UInt);
  uint64_t v210 = v209;
  URLQueryItem.init(name:value:)(0x7974697669746361LL, 0xEC00000065707954LL, v208, v209);
  swift_bridgeObjectRelease(v210);
  uint64_t v211 = (uint64_t)v319;
  URL.withQueryItems(_:)(v207);
  swift_bridgeObjectRelease(v207);
  v212 = v338;
  v213 = v318;
  uint64_t v214 = v339;
  v356 = (char *)v338[2];
  ((void (*)(char *, char *, uint64_t))v356)(v318, v190, v339);
  v354 = (void (*)(char *, uint64_t))v212[6];
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v354)(v211, 1LL, v214) == 1)
  {
    v215 = (void (*)(char *, char *, uint64_t))v212[4];
    v216 = v320;
    v215(v320, v213, v214);
    sub_100009C14(v211, &qword_1000106E0);
  }

  else
  {
    ((void (*)(char *, uint64_t))v212[1])(v213, v214);
    v215 = (void (*)(char *, char *, uint64_t))v212[4];
    v216 = v320;
    v215(v320, (char *)v211, v214);
  }

  id v231 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
  URL._bridgeToObjectiveC()(v232);
  v234 = v233;
  id v235 = [v231 initWithURL:v233];

  uint64_t v236 = HKWorkoutActivityType.startWorkoutTitleLocalizationKey.getter(v202[4]);
  v238 = v237;
  v239 = (NSBundle *)[v358 bundleForClass:v359];
  v371._object = (void *)0xE000000000000000LL;
  v240._uint64_t countAndFlagsBits = v236;
  v240._object = v238;
  v241.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v241.value._object = (void *)0xEB00000000656C62LL;
  v242._uint64_t countAndFlagsBits = 0LL;
  v242._object = (void *)0xE000000000000000LL;
  v371._uint64_t countAndFlagsBits = 0LL;
  v243 = NSLocalizedString(_:tableName:bundle:value:comment:)(v240, v241, v239, v242, v371)._object;
  swift_bridgeObjectRelease(v238);

  NSString v244 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v243);
  [v235 _setTitle:v244];

  [v235 _setImageName:0];
  [v352 setPlayAction:v235];
  if ((unint64_t)v362 < 2)
  {
    os_log_t v362 = (os_log_t)v338[1];
    ((void (*)(char *, uint64_t))v362)(v216, v339);
    swift_bridgeObjectRelease(v202);

    goto LABEL_40;
  }

  v245 = v215;
  uint64_t result = swift_allocObject(v361, v360, v357);
  *(_OWORD *)(result + 16) = v349;
  uint64_t v246 = v339;
  v247 = v338;
  if (v202[2] >= 2uLL)
  {
    uint64_t v248 = result;
    v364 = (void *)v202[5];
    uint64_t v249 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt,  &protocol witness table for UInt);
    uint64_t v251 = v250;
    URLQueryItem.init(name:value:)(0x7974697669746361LL, 0xEC00000065707954LL, v249, v250);
    swift_bridgeObjectRelease(v251);
    uint64_t v252 = (uint64_t)v316;
    v253 = v337;
    URL.withQueryItems(_:)(v248);
    swift_bridgeObjectRelease(v248);
    v254 = v315;
    ((void (*)(char *, char *, uint64_t))v356)(v315, v253, v246);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v354)(v252, 1LL, v246) == 1)
    {
      v255 = v314;
      v245(v314, v254, v246);
      sub_100009C14(v252, &qword_1000106E0);
    }

    else
    {
      ((void (*)(char *, uint64_t))v247[1])(v254, v246);
      v255 = v314;
      v245(v314, (char *)v252, v246);
    }

    id v256 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
    URL._bridgeToObjectiveC()(v257);
    v259 = v258;
    id v260 = [v256 initWithURL:v258];

    uint64_t v261 = v202[5];
    swift_bridgeObjectRelease(v202);
    uint64_t v262 = HKWorkoutActivityType.startWorkoutTitleLocalizationKey.getter(v261);
    v264 = v263;
    v265 = (NSBundle *)[v358 bundleForClass:v359];
    v372._object = (void *)0xE000000000000000LL;
    v266._uint64_t countAndFlagsBits = v262;
    v266._object = v264;
    v267.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
    v267.value._object = (void *)0xEB00000000656C62LL;
    v268._uint64_t countAndFlagsBits = 0LL;
    v268._object = (void *)0xE000000000000000LL;
    v372._uint64_t countAndFlagsBits = 0LL;
    v269 = NSLocalizedString(_:tableName:bundle:value:comment:)(v266, v267, v265, v268, v372)._object;
    swift_bridgeObjectRelease(v264);

    NSString v270 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v269);
    [v260 _setTitle:v270];

    [v260 _setImageName:0];
    [v352 setDisplayAction:v260];

    v271 = (os_log_s *)v247[1];
    uint64_t v272 = v339;
    ((void (*)(char *, uint64_t))v271)(v255, v339);
    os_log_t v362 = v271;
    ((void (*)(char *, uint64_t))v271)(v320, v272);
    goto LABEL_40;
  }

LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_100007A1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v129 = a2;
  uint64_t v3 = sub_1000084A8(&qword_1000106D8);
  __chkstk_darwin(v3);
  Swift::String_optional v130 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for TopShelfMarketingItem.LinkAction(0LL);
  v134 = *(void (***)(uint64_t, unint64_t, uint64_t))(v131 - 8);
  __chkstk_darwin(v131);
  v133 = (char *)&v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000084A8(&qword_1000106E0);
  uint64_t v7 = __chkstk_darwin(v6);
  id v124 = (char *)&v120 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  Swift::String v132 = (char *)&v120 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v122 = (char *)&v120 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v120 - v13;
  uint64_t v15 = type metadata accessor for URL(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  Swift::String v121 = (char *)&v120 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v123 = (char *)&v120 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  NSString v125 = (char *)&v120 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  Swift::String_optional v120 = (char *)&v120 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v120 - v25;
  uint64_t v27 = type metadata accessor for UUID(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v120 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = type metadata accessor for TopShelfMarketingItem(0LL);
  uint64_t v127 = *(void *)(v31 - 8);
  uint64_t v128 = v31;
  __chkstk_darwin(v31);
  uint64_t v33 = (char *)&v120 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  TopShelfMarketingItem.init(from:)(a1);
  id v34 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselContent);
  sub_10000A234(0LL, &qword_1000106E8, &OBJC_CLASS___TVTopShelfCarouselItem_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v126 = [v34 initWithStyle:0 items:isa];

  uint64_t v36 = UUID.init()();
  UUID.uuidString.getter(v36);
  uint64_t v38 = v37;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  id v39 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfPromotionCarouselItem);
  NSString v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v38);
  uint64_t v41 = (void (**)(uint64_t, unint64_t, uint64_t))[v39 initWithIdentifier:v40];

  uint64_t v135 = v33;
  uint64_t v42 = v16;
  TopShelfMarketingItem.artworkURL.getter();
  uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v43(v14, 1LL, v15) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v26, v14, v15);
    URL._bridgeToObjectiveC()(v63);
    id v65 = v64;
    [v41 setImageURL:v64 forTraits:1];

    URL._bridgeToObjectiveC()(v66);
    NSString v68 = v67;
    [v41 setImageURL:v67 forTraits:2];

    uint64_t v62 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v26, v15);
    uint64_t v53 = (uint64_t)v130;
    uint64_t v54 = v131;
    uint64_t v69 = (uint64_t)v132;
    uint64_t v70 = v133;
    goto LABEL_9;
  }

  uint64_t v44 = v122;
  sub_100009C14((uint64_t)v14, &qword_1000106E0);
  id v45 = [(id)objc_opt_self(NSBundle) mainBundle];
  NSString v46 = String._bridgeToObjectiveC()();
  NSString v47 = String._bridgeToObjectiveC()();
  id v48 = [v45 URLForResource:v46 withExtension:v47];

  if (!v48)
  {
    uint64_t v51 = (uint64_t)v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v44, 1LL, 1LL, v15);
    uint64_t v53 = (uint64_t)v130;
    uint64_t v54 = v131;
    goto LABEL_7;
  }

  uint64_t v49 = v125;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v48);

  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  uint64_t v51 = (uint64_t)v44;
  v50(v44, v49, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v44, 0LL, 1LL, v15);
  unsigned int v52 = v43(v44, 1LL, v15);
  uint64_t v53 = (uint64_t)v130;
  uint64_t v54 = v131;
  if (v52 == 1)
  {
LABEL_7:
    uint64_t v62 = sub_100009C14(v51, &qword_1000106E0);
    goto LABEL_8;
  }

  uint64_t v55 = v120;
  v50(v120, (char *)v51, v15);
  URL._bridgeToObjectiveC()(v56);
  uint64_t v58 = v57;
  [v41 setImageURL:v57 forTraits:1];

  URL._bridgeToObjectiveC()(v59);
  id v61 = v60;
  [v41 setImageURL:v60 forTraits:2];

  uint64_t v62 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v55, v15);
LABEL_8:
  uint64_t v69 = (uint64_t)v132;
  uint64_t v70 = v133;
  uint64_t v42 = v16;
LABEL_9:
  uint64_t v71 = TopShelfMarketingItem.videoURLs.getter(v62);
  uint64_t v72 = v71;
  if (*(void *)(v71 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v42 + 16))( v69,  v71 + ((*(unsigned __int8 *)(v42 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80)),  v15);
    uint64_t v73 = 0LL;
  }

  else
  {
    uint64_t v73 = 1LL;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v69, v73, 1LL, v15);
  swift_bridgeObjectRelease(v72);
  if (v43((char *)v69, 1LL, v15) == 1)
  {
    uint64_t v74 = sub_100009C14(v69, &qword_1000106E0);
  }

  else
  {
    uint64_t v75 = v70;
    uint64_t v76 = v43;
    uint64_t v77 = v123;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v123, v69, v15);
    v78 = v41;
    URL._bridgeToObjectiveC()(v79);
    uint64_t v81 = v80;
    [v78 setCinemagraphURL:v80];

    uint64_t v82 = v77;
    uint64_t v43 = v76;
    uint64_t v70 = v75;
    uint64_t v74 = (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v82, v15);
  }

  uint64_t v83 = v134;
  uint64_t v84 = TopShelfMarketingItem.linkActions.getter(v74);
  uint64_t v85 = v84;
  if (*(void *)(v84 + 16))
  {
    v83[2]( v53,  v84 + ((*((unsigned __int8 *)v83 + 80) + 32LL) & ~(unint64_t)*((unsigned __int8 *)v83 + 80)),  v54);
    uint64_t v86 = 0LL;
  }

  else
  {
    uint64_t v86 = 1LL;
  }

  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v83[7])(v53, v86, 1LL, v54);
  swift_bridgeObjectRelease(v85);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v83[6])(v53, 1LL, v54) == 1)
  {
    uint64_t v87 = sub_100009C14(v53, &qword_1000106D8);
  }

  else
  {
    v134 = v41;
    uint64_t v88 = ((uint64_t (*)(char *, uint64_t, uint64_t))v83[4])(v70, v53, v54);
    v89 = v125;
    TopShelfMarketingItem.LinkAction.url.getter(v88);
    uint64_t v90 = v124;
    URL.encodedOpenLink(for:)(0LL);
    uint64_t v91 = (uint64_t)v90;
    v92 = *(void (**)(char *, uint64_t))(v42 + 8);
    v92(v89, v15);
    if (v43((char *)v91, 1LL, v15) == 1)
    {
      ((void (*)(char *, uint64_t))v83[1])(v70, v54);
      uint64_t v87 = sub_100009C14(v91, &qword_1000106E0);
      uint64_t v93 = v128;
      uint64_t v95 = v126;
      uint64_t v94 = v127;
      uint64_t v41 = v134;
      goto LABEL_24;
    }

    uint64_t v96 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 32);
    uint64_t v97 = v121;
    v96(v121, v91, v15);
    uint64_t v98 = (uint64_t (**)(char *, uint64_t))v83;
    id v99 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
    URL._bridgeToObjectiveC()(v100);
    uint64_t v102 = v101;
    id v103 = [v99 initWithURL:v101];

    TopShelfMarketingItem.LinkAction.title.getter();
    uint64_t v105 = v104;
    v106 = v70;
    NSString v107 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v105);
    [v103 _setTitle:v107];

    [v103 _setImageName:0];
    uint64_t v41 = v134;
    [v134 setPlayAction:v103];

    v92(v97, v15);
    uint64_t v87 = v98[1](v106, v54);
  }

  uint64_t v93 = v128;
  uint64_t v95 = v126;
  uint64_t v94 = v127;
LABEL_24:
  Class v108 = v135;
  TopShelfMarketingItem.title.getter(v87);
  if (v109)
  {
    uint64_t v110 = v109;
    NSString v111 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v110);
  }

  else
  {
    NSString v111 = 0LL;
  }

  [v41 setPromotionText:v111];

  uint64_t v112 = v41;
  TopShelfMarketingItem.subtitle.getter();
  if (v113)
  {
    uint64_t v114 = v113;
    NSString v115 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v114);
  }

  else
  {
    NSString v115 = 0LL;
  }

  [v112 _setTermsAndConditionsText:v115];

  [v112 setPromotionTitleTintColor:0];
  [v95 _setPromotionItem:v112];
  uint64_t v116 = swift_allocObject(&unk_10000C9A0, 24LL, 7LL);
  *(void *)(v116 + 16) = v95;
  id v117 = v95;
  uint64_t v118 = sub_1000084A8(&qword_100010750);
  Promise.init(synchronousOperation:)(sub_1000098A4, v116, v118);

  return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v108, v93);
}

id sub_1000083DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContentProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContentProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC15SeymourTopShelf15ContentProvider);
}

uint64_t sub_1000084A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000084E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000085B8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009C9C((uint64_t)v12, *a3);
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
      sub_100009C9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000A2C8(v12);
  return v7;
}

uint64_t sub_1000085B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100008770(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_100008770(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008804(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000089DC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000089DC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008804(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
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
      uint64_t v5 = sub_100008978(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100008978(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000084A8(&qword_1000107B8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000089DC(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    uint64_t v10 = sub_1000084A8(&qword_1000107B8);
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
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100008B28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = sub_1000084A8(a6);
  uint64_t v15 = (void (*)(uint64_t, void *))Promise.operation.getter(v14);
  uint64_t v17 = v16;
  uint64_t v18 = (void *)swift_allocObject(a7, 48LL, 7LL);
  v18[2] = a4;
  v18[3] = a5;
  v18[4] = a1;
  v18[5] = a2;
  swift_retain(a5);
  swift_retain(a2);
  v15(a8, v18);
  swift_release(v17);
  return swift_release(v18);
}

uint64_t sub_100008BCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = sub_1000084A8(a6);
  uint64_t v15 = (void (*)(uint64_t, void *))Promise.operation.getter(v14);
  uint64_t v17 = v16;
  uint64_t v18 = (void *)swift_allocObject(a7, 48LL, 7LL);
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = a4;
  v18[5] = a5;
  swift_retain(a2);
  swift_retain(a5);
  v15(a8, v18);
  swift_release(v17);
  return swift_release(v18);
}

uint64_t sub_100008C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (void *)swift_allocObject(&unk_10000CF68, 40LL, 7LL);
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain(a3);
  swift_errorRetain(a1);
  return Promise.init(asyncOperation:)(sub_100009EF4, v6, (char *)&type metadata for () + 8);
}

uint64_t sub_100008CF4( void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);
  return sub_100009EDC(v6, 0);
}

uint64_t sub_100008D6C( uint64_t a1, char a2, uint64_t (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_1000084A8(&qword_1000107D0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    a5(a1);
    uint64_t v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v10);
    uint64_t v17 = v16;
    uint64_t v18 = swift_allocObject(&unk_10000CF40, 32LL, 7LL);
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    swift_retain(a4);
    v15(sub_100009A34, v18);
    swift_release(v17);
    swift_release(v18);
    sub_100009EDC(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }

  else
  {
    uint64_t v19 = a1;
    char v20 = 0;
    return a3(&v19);
  }

uint64_t sub_100008EA4( uint64_t a1, char a2, void (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_1000084A8(&qword_100010760);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    a5(a1);
    uint64_t v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v10);
    uint64_t v17 = v16;
    uint64_t v18 = swift_allocObject(&unk_10000CA90, 32LL, 7LL);
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    swift_retain(a4);
    v15(sub_100009A34, v18);
    swift_release(v17);
    swift_release(v18);
    sub_100009AD4(a1, 1, (uint64_t (*)(void))&_swift_unknownObjectRelease);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }

  else
  {
    uint64_t v19 = a1;
    char v20 = 0;
    swift_unknownObjectRetain(a1);
    a3(&v19);
    return sub_100009AD4(a1, 0, (uint64_t (*)(void))&_swift_unknownObjectRelease);
  }

uint64_t sub_100009000( uint64_t a1, char a2, void (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v11 = sub_1000084A8(&qword_1000107D0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = a1;
  if ((a2 & 1) != 0)
  {
    char v21 = 1;
    swift_errorRetain(a1);
    a5(&v20);
    return sub_100009AD4(a1, 1, (uint64_t (*)(void))&_swift_unknownObjectRelease);
  }

  else
  {
    swift_unknownObjectRetain(a1);
    a3(&v20);
    uint64_t v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v11);
    uint64_t v17 = v16;
    uint64_t v18 = swift_allocObject(&unk_10000CFB8, 32LL, 7LL);
    *(void *)(v18 + 16) = a5;
    *(void *)(v18 + 24) = a6;
    swift_retain(a6);
    v15(sub_100009A34, v18);
    swift_release(v17);
    swift_release(v18);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return swift_unknownObjectRelease(v20);
  }

uint64_t sub_100009158( uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(uint64_t *), uint64_t a5, uint64_t (*a6)(void), uint64_t *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v32 = a8;
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  v30[1] = a3;
  uint64_t v31 = a2;
  uint64_t v12 = sub_1000084A8(&qword_100010760);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a6(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v30 - v18;
  uint64_t v20 = sub_1000084A8(a7);
  __chkstk_darwin(v20);
  uint64_t v22 = (void *)((char *)v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_10000A144(a1, (uint64_t)v22, a7);
  if (swift_getEnumCaseMultiPayload(v22, v20) == 1)
  {
    uint64_t v35 = *v22;
    uint64_t v23 = v35;
    char v36 = 1;
    swift_errorRetain(v35);
    v33(&v35);
    swift_errorRelease(v23);
    return swift_errorRelease(v23);
  }

  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 32))(v19, v22, v16);
    v31(v19);
    uint64_t v25 = (void (*)(uint64_t, uint64_t))Promise.operation.getter(v12);
    uint64_t v27 = v26;
    uint64_t v28 = swift_allocObject(v32, 32LL, 7LL);
    *(void *)(v28 + 16) = v33;
    uint64_t v29 = v34;
    *(void *)(v28 + 24) = v34;
    swift_retain(v29);
    v25(a9, v28);
    swift_release(v27);
    swift_release(v28);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }

void sub_100009354( void *a1, char a2, void (*a3)(id *), uint64_t a4, void (*a5)(id *), uint64_t a6)
{
  uint64_t v11 = sub_1000084A8(&qword_100010760);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v20 = a1;
  if ((a2 & 1) != 0)
  {
    char v21 = 1;
    swift_errorRetain(a1);
    a5(&v20);
    sub_100009CE8(a1, 1);
  }

  else
  {
    id v15 = a1;
    a3(&v20);
    uint64_t v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v11);
    uint64_t v18 = v17;
    uint64_t v19 = swift_allocObject(&unk_10000CC48, 32LL, 7LL);
    *(void *)(v19 + 16) = a5;
    *(void *)(v19 + 24) = a6;
    swift_retain(a6);
    v16(sub_100009A34, v19);
    swift_release(v18);
    swift_release(v19);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

uint64_t sub_1000094A0( uint64_t a1, char a2, void (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v11 = sub_1000084A8(&qword_100010760);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = a1;
  if ((a2 & 1) != 0)
  {
    char v21 = 1;
    swift_errorRetain(a1);
    a5(&v20);
    return sub_100009AD4(a1, 1, (uint64_t (*)(void))&_swift_bridgeObjectRelease);
  }

  else
  {
    swift_bridgeObjectRetain(a1);
    a3(&v20);
    id v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))Promise.operation.getter(v11);
    uint64_t v17 = v16;
    uint64_t v18 = swift_allocObject(&unk_10000CBD0, 32LL, 7LL);
    *(void *)(v18 + 16) = a5;
    *(void *)(v18 + 24) = a6;
    swift_retain(a6);
    v15(sub_100009A34, v18);
    swift_release(v17);
    swift_release(v18);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return swift_bridgeObjectRelease(v20);
  }

uint64_t sub_1000095F8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009614(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100009614(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    uint64_t v10 = sub_1000084A8(&qword_1000107A0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  id v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000977C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  unint64_t v6 = (void *)swift_allocObject(&unk_10000CFE0, 40LL, 7LL);
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = v5;
  swift_unknownObjectRetain(v5);
  swift_retain(a3);
  return Promise.init(asyncOperation:)(sub_100009F74, v6, (char *)&type metadata for () + 8);
}

uint64_t sub_100009800( void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  a3(&v9, &v8);
  uint64_t v6 = v9;
  char v10 = 0;
  a1(&v9);
  return sub_100009EDC(v6, 0);
}

uint64_t sub_100009880()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000098A4@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_unknownObjectRetain();
}

void *sub_1000098C0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_1000098E4(uint64_t a1)
{
  return sub_1000057B4(a1, *(char **)(v1 + 16));
}

uint64_t sub_1000098EC()
{
  return sub_100009FC4(&qword_100010758);
}

uint64_t sub_1000098F8(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_100010758,  (uint64_t)&unk_10000CC70,  (uint64_t)sub_100009CFC,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008B28);
}

uint64_t sub_10000991C()
{
  uint64_t v1 = type metadata accessor for ServiceSubscription(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100009990@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ServiceSubscription(0LL);
  return sub_10000595C( *(char **)(v1 + ((*(void *)(*(void *)(v3 - 8) + 64LL)
                      + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL))
                      + 7) & 0xFFFFFFFFFFFFF8LL)),
           a1);
}

uint64_t sub_1000099F0()
{
  return sub_100009FC4(&qword_100010760);
}

uint64_t sub_1000099FC(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_100010760,  (uint64_t)&unk_10000CA68,  (uint64_t)sub_100009A24,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008BCC);
}

uint64_t sub_100009A24(uint64_t a1)
{
  return sub_100009F10(a1, (uint64_t (*)(void, void, void, void, void, void))sub_100008EA4);
}

uint64_t sub_100009A38()
{
  return sub_100009FC4(&qword_100010768);
}

uint64_t sub_100009A44(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_100010768,  (uint64_t)&unk_10000CC20,  (uint64_t)sub_100009CDC,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008B28);
}

uint64_t sub_100009A68(uint64_t a1)
{
  return sub_100005CF0(a1, *(void **)(v1 + 16));
}

uint64_t sub_100009A70(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_100009A94()
{
  return sub_100009FC4(&qword_100010770);
}

uint64_t sub_100009AA0(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_100010770,  (uint64_t)&unk_10000CBA8,  (uint64_t)sub_100009AC8,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008B28);
}

uint64_t sub_100009AC8(uint64_t a1)
{
  return sub_100009F10(a1, (uint64_t (*)(void, void, void, void, void, void))sub_1000094A0);
}

uint64_t sub_100009AD4(uint64_t a1, char a2, uint64_t (*a3)(void))
{
  if ((a2 & 1) != 0) {
    return swift_errorRelease();
  }
  else {
    return a3();
  }
}

void *sub_100009AE4(uint64_t a1, uint64_t a2)
{
  uint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v16 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v7 = *(void *)(type metadata accessor for CatalogWorkoutDetail(0LL) - 8);
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = *(void *)(v7 + 72);
    swift_bridgeObjectRetain(a1);
    do
    {
      uint64_t v11 = sub_100005DF0(v8, a2, &v15);
      if (v2)
      {
        swift_bridgeObjectRelease(a1);
        return (void *)swift_bridgeObjectRelease(v16);
      }

      uint64_t v12 = v15;
      if (v15)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v11);
        unint64_t v14 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v13 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v14 >= v13 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1LL);
        }
        uint64_t v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
        specialized Array._endMutation()(v10);
      }

      v8 += v9;
      --v5;
    }

    while (v5);
    swift_bridgeObjectRelease(a1);
    return (void *)v16;
  }

  return result;
}

uint64_t sub_100009C14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000084A8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_100009C50()
{
  unint64_t result = qword_100010790;
  if (!qword_100010790)
  {
    uint64_t v1 = type metadata accessor for CatalogWorkout(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CatalogWorkout, v1);
    atomic_store(result, (unint64_t *)&qword_100010790);
  }

  return result;
}

uint64_t sub_100009C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009CDC(uint64_t a1)
{
  return sub_100009F10(a1, (uint64_t (*)(void, void, void, void, void, void))sub_100009354);
}

void sub_100009CE8(void *a1, char a2)
{
  if ((a2 & 1) != 0) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_100009CFC(uint64_t a1)
{
  return sub_100009158( a1,  *(void (**)(char *))(v1 + 16),  *(void *)(v1 + 24),  *(void (**)(uint64_t *))(v1 + 32),  *(void *)(v1 + 40),  (uint64_t (*)(void))&type metadata accessor for RemoteBrowsingConnectionRecord,  &qword_1000107C0,  (uint64_t)&unk_10000CC98,  (uint64_t)sub_100009A34);
}

uint64_t sub_100009D48()
{
  return sub_100009FC4(&qword_100010770);
}

uint64_t sub_100009D54()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100009D78()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_100009D88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100005470(a1, a2);
}

uint64_t sub_100009DA8()
{
  return sub_100009FC4(&qword_1000107C8);
}

uint64_t sub_100009DB4(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_1000107C8,  (uint64_t)&unk_10000D080,  (uint64_t)sub_10000A0FC,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008B28);
}

uint64_t sub_100009DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004E5C(a1, *(char **)(v2 + 16), a2);
}

uint64_t sub_100009DE0()
{
  return sub_100009FC4(&qword_100010760);
}

uint64_t sub_100009DEC(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_100009E18(uint64_t *a1)
{
  return sub_10000977C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100009E20()
{
  return sub_100009FC4(&qword_100010760);
}

uint64_t sub_100009E2C(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_100010760,  (uint64_t)&unk_10000CF90,  (uint64_t)sub_100009F04,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008B28);
}

uint64_t sub_100009E50()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100009E74(uint64_t a1)
{
  return sub_1000051E0(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100009E8C(uint64_t a1)
{
  return sub_100008C70(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100009E94()
{
  return sub_100009FC4(&qword_1000107D0);
}

uint64_t sub_100009EA0(uint64_t a1, uint64_t a2)
{
  return sub_10000A038( a1,  a2,  &qword_1000107D0,  (uint64_t)&unk_10000CF18,  (uint64_t)sub_100009ECC,  (uint64_t (*)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))sub_100008BCC);
}

uint64_t sub_100009ECC(uint64_t a1)
{
  return sub_100009F10(a1, (uint64_t (*)(void, void, void, void, void, void))sub_100008D6C);
}

uint64_t sub_100009EDC(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100009EE8()
{
  return sub_100009F3C((void (*)(void))&_swift_errorRelease);
}

uint64_t sub_100009EF4(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_100008CF4( a1,  a2,  *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32));
}

uint64_t sub_100009F04(uint64_t a1)
{
  return sub_100009F10(a1, (uint64_t (*)(void, void, void, void, void, void))sub_100009000);
}

uint64_t sub_100009F10(uint64_t a1, uint64_t (*a2)(void, void, void, void, void, void))
{
  return a2(*(void *)a1, *(unsigned __int8 *)(a1 + 8), v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_100009F30()
{
  return sub_100009F3C((void (*)(void))&_swift_unknownObjectRelease);
}

uint64_t sub_100009F3C(void (*a1)(void))
{
  return swift_deallocObject(v1, 40LL, 7LL);
}

uint64_t sub_100009F74(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_100009800( a1,  a2,  *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 16),  *(void *)(v2 + 24),  (uint64_t *)(v2 + 32));
}

uint64_t sub_100009F80()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100009FA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100007A1C(a1, a2);
}

uint64_t sub_100009FB8()
{
  return sub_100009FC4(&qword_100010768);
}

uint64_t sub_100009FC4(uint64_t *a1)
{
  uint64_t v2 = sub_1000084A8(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = (*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release(*(void *)(v1 + v7 + 8));
  return swift_deallocObject(v1, v7 + 16, v6);
}

uint64_t sub_10000A038( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, void, void, uint64_t *, uint64_t, uint64_t))
{
  uint64_t v13 = *(void *)(sub_1000084A8(a3) - 8);
  unint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (void *)(v6 + ((*(void *)(v13 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  return a6(a1, a2, v6 + v14, *v15, v15[1], a3, a4, a5);
}

uint64_t sub_10000A0D0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000A0FC(uint64_t a1)
{
  return sub_100009158( a1,  *(void (**)(char *))(v1 + 16),  *(void *)(v1 + 24),  *(void (**)(uint64_t *))(v1 + 32),  *(void *)(v1 + 40),  (uint64_t (*)(void))&type metadata accessor for ServiceSubscription,  &qword_1000107D8,  (uint64_t)&unk_10000D0A8,  (uint64_t)sub_100009A34);
}

uint64_t sub_10000A144(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000084A8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A18C()
{
  if (*(void *)(v0 + 16)) {
    swift_release(*(void *)(v0 + 24));
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000A1B8(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(_BYTE *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

void *sub_10000A1F8(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_10000A234(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10000A26C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A2B0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000A2C8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A32C@<X0>(void *a1@<X8>)
{
  return sub_1000098A4(a1);
}
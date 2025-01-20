int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  os_log_s *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  os_log_s *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  void *v30;
  v3 = type metadata accessor for OSSignpostID(0LL, argv, envp);
  sub_100003910(v3, qword_100010DF0);
  sub_100003950(v3, (uint64_t)qword_100010DF0);
  v4 = (void *)static Logger.log.getter();
  static Logger.makeSignpostID(log:)();

  v5 = (void *)static Logger.log.getter();
  v6 = sub_100003B50();
  static Logger.begin(_:_:log:telemetry:)(v6);

  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_100003BD8);
  }
  v7 = type metadata accessor for Logger(0LL);
  sub_100003950(v7, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
  v8 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)sub_100003B7C();
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Bookkeeping XPC Service starting up", v10, 2u);
    sub_100003B70((uint64_t)v10);
  }

  v11 = type metadata accessor for OSFeatureFlagProvider(0LL);
  qword_100010E08 = OSFeatureFlagProvider.__allocating_init()();
  type metadata accessor for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider(0LL);
  v12 = *(void *)SiriSuggestionsIntelligence.noopAccountService.unsafeMutableAddressor();
  *((void *)&v29 + 1) = type metadata accessor for SiriSuggestionsIntelligence.NoopAccountService(0LL);
  v30 = &protocol witness table for SiriSuggestionsIntelligence.NoopAccountService;
  *(void *)&v28 = v12;
  sub_100003B68();
  static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.createProvider(using:completion:)( qword_100010E10,  &v28,  nullsub_1,  0LL);
  sub_10000397C(&v28);
  v13 = qword_100010E08;
  v14 = type metadata accessor for SiriRemembersLogger(0LL);
  v28 = 0u;
  v29 = 0u;
  v30 = 0LL;
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  sub_100003B68();
  v15 = SiriRemembersLogger.init(donator:storeProvider:)(&v28, sub_10000399C, 0LL);
  v16 = type metadata accessor for DefaultSuggestionsLoggerFactory();
  v17 = (void *)swift_allocObject(v16, 64LL, 7LL);
  v17[5] = v11;
  v17[6] = &protocol witness table for OSFeatureFlagProvider;
  v17[2] = v13;
  v17[7] = v15;
  sub_100003B0C((uint64_t)qword_100010E10, (uint64_t)&v28);
  v18 = type metadata accessor for DefaultFeatureServiceFactory();
  v19 = swift_allocObject(v18, 56LL, 7LL);
  sub_1000039B0(&v28, v19 + 16);
  v20 = objc_allocWithZone((Class)type metadata accessor for BookkeepingServiceDelegate());
  sub_100003B68();
  qword_100010E38 = (uint64_t)sub_1000039C8((uint64_t)v17, v19, v13, v20);
  v21 = [(id)objc_opt_self(NSXPCListener) serviceListener];
  qword_100010E40 = (uint64_t)v21;
  [v21 setDelegate:qword_100010E38];
  v22 = (os_log_s *)Logger.logObject.getter([v21 resume]);
  v23 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)sub_100003B7C();
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Bookkeeping XPC Service started up", v24, 2u);
    sub_100003B70((uint64_t)v24);
  }

  v25 = (void *)static Logger.log.getter();
  v26 = sub_100003B50();
  static Logger.end(_:_:log:telemetry:)(v26);

  return 0;
}

uint64_t *sub_100003910(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003950(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003968(uint64_t result, _BYTE **a2)
{
  v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000397C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000399C()
{
  return static InteractionStore.inProcess()();
}

uint64_t sub_1000039B0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_1000039C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  ObjectType = (objc_class *)swift_getObjectType(a4);
  v14[3] = type metadata accessor for DefaultSuggestionsLoggerFactory();
  v14[4] = sub_100003ACC();
  v14[0] = a1;
  v13[3] = type metadata accessor for DefaultFeatureServiceFactory();
  v13[4] = &protocol witness table for DefaultFeatureServiceFactory;
  v13[0] = a2;
  v12[3] = type metadata accessor for OSFeatureFlagProvider(0LL);
  v12[4] = &protocol witness table for OSFeatureFlagProvider;
  v12[0] = a3;
  sub_100003B0C( (uint64_t)v14,  (uint64_t)a4 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_suggestionsLoggerFactory);
  sub_100003B0C( (uint64_t)v13,  (uint64_t)a4 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureServiceFactory);
  sub_100003B0C( (uint64_t)v12,  (uint64_t)a4 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureFlagProvider);
  v11.receiver = a4;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, "init");
  sub_10000397C(v12);
  sub_10000397C(v13);
  sub_10000397C(v14);
  return v9;
}

unint64_t sub_100003ACC()
{
  unint64_t result = qword_100010A38;
  if (!qword_100010A38)
  {
    uint64_t v1 = type metadata accessor for DefaultSuggestionsLoggerFactory();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DefaultSuggestionsLoggerFactory, v1);
    atomic_store(result, (unint64_t *)&qword_100010A38);
  }

  return result;
}

uint64_t sub_100003B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003B50()
{
  return v0;
}

uint64_t sub_100003B68()
{
  return swift_retain(v0);
}

uint64_t sub_100003B70(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100003B7C()
{
  return swift_slowAlloc(2LL, -1LL);
}

char **SiriSuggestionsSignpost.bookkeepingXPCServiceStartup.unsafeMutableAddressor()
{
  return &static SiriSuggestionsSignpost.bookkeepingXPCServiceStartup;
}

uint64_t Logger.bookkeepingXPCServiceCategory.unsafeMutableAddressor()
{
  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_100003BD8);
  }
  uint64_t v0 = sub_100003CD4();
  return sub_100003950(v0, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
}

uint64_t sub_100003BD8()
{
  uint64_t v0 = sub_100003CD4();
  sub_100003910(v0, static Logger.bookkeepingXPCServiceCategory);
  sub_100003950(v0, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
  uint64_t v1 = static Logger.subsystem.getter();
  return Logger.init(subsystem:category:)(v1);
}

uint64_t static Logger.bookkeepingXPCServiceCategory.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010A30 != -1) {
    swift_once(&qword_100010A30, sub_100003BD8);
  }
  uint64_t v2 = sub_100003CD4();
  uint64_t v3 = sub_100003950(v2, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

const char *static SiriSuggestionsSignpost.bookkeepingXPCServiceStartup.getter()
{
  return "BookkeepingXPCServicesStartup";
}

ValueMetadata *type metadata accessor for SiriSuggestionsSignpost()
{
  return &type metadata for SiriSuggestionsSignpost;
}

uint64_t sub_100003CD4()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t DefaultSuggestionsLoggerFactory.__allocating_init(featureFlagProvider:siriRemembersLogger:)( void *a1, uint64_t a2)
{
  return sub_100003CF4(a1, a2, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100004050);
}

uint64_t DefaultSuggestionsLoggerFactory.init(featureFlagProvider:siriRemembersLogger:)( void *a1, uint64_t a2)
{
  return sub_100003CF4(a1, a2, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100004140);
}

uint64_t sub_100003CF4( void *a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_100004118((uint64_t)a1, v7);
  __chkstk_darwin(v9, v9);
  objc_super v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v12 + 16))(v11);
  uint64_t v13 = a3(v11, a2, v3, v7, v8);
  sub_10000397C(a1);
  return v13;
}

uint64_t DefaultSuggestionsLoggerFactory.create(featureService:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  objc_super v11 = &v31[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __chkstk_darwin(v9, v12);
  v14 = &v31[-v13 - 8];
  uint64_t v15 = v2[5];
  uint64_t v16 = v2[6];
  sub_100004198(v2 + 2, v15);
  if ((dispatch thunk of FeatureFlagProvider.isFeatureExtractionEnabled()(v15, v16) & 1) != 0)
  {
    uint64_t v17 = static Logger.initCategory.getter();
    v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)sub_100003B7C();
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Enabled feature extraction logger", v20, 2u);
      sub_100003B70((uint64_t)v20);
    }

    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v14, v6);
    sub_100003B0C(a1, (uint64_t)v31);
    uint64_t v21 = v3[7];
    uint64_t v22 = type metadata accessor for SiriSuggestionsIntelligence.FeatureLogger(0LL);
    swift_allocObject(v22, 96LL, 7LL);
    uint64_t v23 = SiriSuggestionsIntelligence.FeatureLogger.init(featureService:siriRemembersLogger:loggingPolicy:)( v31,  v21,  0LL,  1LL,  0LL,  0LL);
    a2[3] = v22;
    v24 = (void *)sub_1000041BC();
  }

  else
  {
    uint64_t v25 = static Logger.initCategory.getter();
    v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)sub_100003B7C();
      *(_WORD *)v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "Feature Extraction disabled. Only using raw remembers logger",  v28,  2u);
      sub_100003B70((uint64_t)v28);
    }

    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v11, v6);
    uint64_t v23 = v3[7];
    a2[3] = type metadata accessor for SiriRemembersLogger(0LL);
    v24 = &protocol witness table for SiriRemembersLogger;
    uint64_t v21 = v23;
  }

  a2[4] = (uint64_t)v24;
  *a2 = v23;
  return swift_retain(v21);
}

uint64_t DefaultSuggestionsLoggerFactory.deinit()
{
  return v0;
}

uint64_t DefaultSuggestionsLoggerFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t sub_100004030@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return DefaultSuggestionsLoggerFactory.create(featureService:)(a1, a2);
}

void *sub_100004050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  __chkstk_darwin(a1, a2);
  objc_super v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = (void *)swift_allocObject(v12, 64LL, 7LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a4);
  v14 = sub_100004140((uint64_t)v11, a2, v13, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, a4);
  return v14;
}

uint64_t sub_100004118(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

void *sub_100004140(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  a3[5] = a4;
  a3[6] = a5;
  uint64_t v9 = sub_10000421C(a3 + 2);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v9, a1, a4);
  a3[7] = a2;
  return a3;
}

void *sub_100004198(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_1000041BC()
{
  unint64_t result = qword_100010A40;
  if (!qword_100010A40)
  {
    uint64_t v1 = type metadata accessor for SiriSuggestionsIntelligence.FeatureLogger(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SiriSuggestionsIntelligence.FeatureLogger, v1);
    atomic_store(result, (unint64_t *)&qword_100010A40);
  }

  return result;
}

uint64_t type metadata accessor for DefaultSuggestionsLoggerFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC33SiriSuggestionsBookkeepingService31DefaultSuggestionsLoggerFactory);
}

void *sub_10000421C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t DefaultFeatureServiceFactory.__allocating_init(accountDetailsProvider:)(__int128 *a1)
{
  uint64_t v3 = swift_allocObject(v1, 56LL, 7LL);
  sub_1000039B0(a1, v3 + 16);
  return v3;
}

uint64_t DefaultFeatureServiceFactory.init(accountDetailsProvider:)(__int128 *a1)
{
  return v1;
}

uint64_t DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[21] = a5;
  v6[22] = v5;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v6[23] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[24] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[25] = swift_task_alloc(v9);
  v6[26] = swift_task_alloc(v9);
  return swift_task_switch(sub_10000432C, 0LL, 0LL);
}

uint64_t sub_10000432C()
{
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100004198(v1, v2);
  if ((dispatch thunk of FeatureFlagProvider.isFeatureExtractionEnabled()(v2, v3) & 1) != 0)
  {
    uint64_t v4 = static Logger.initCategory.getter();
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)sub_100003B7C();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Enabled feature service", v7, 2u);
      sub_100003B70((uint64_t)v7);
    }

    uint64_t v8 = *(void *)(v0 + 208);
    uint64_t v9 = *(void *)(v0 + 184);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    sub_1000046D8(v11, v0 + 56);
    if (*(void *)(v0 + 80))
    {
      uint64_t v12 = sub_1000039B0((__int128 *)(v0 + 56), v0 + 16);
    }

    else
    {
      sub_100003B0C(*(void *)(v0 + 176) + 16LL, v0 + 16);
      uint64_t v12 = sub_100004760(v0 + 56);
    }

    static Clocks.getSystemClock()(v12);
    uint64_t v23 = (void *)swift_task_alloc(async function pointer to static SiriSuggestionsIntelligence.createFeatureService(clock:configProvider:accountDetailsProvider:possibleOwners:)[1]);
    *(void *)(v0 + 216) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_100004558;
    return static SiriSuggestionsIntelligence.createFeatureService(clock:configProvider:accountDetailsProvider:possibleOwners:)( *(void *)(v0 + 136),  v0 + 96,  *(void *)(v0 + 152),  v0 + 16,  *(void *)(v0 + 168));
  }

  else
  {
    uint64_t v13 = static Logger.initCategory.getter();
    v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)sub_100003B7C();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Feature Service disabled.", v16, 2u);
      sub_100003B70((uint64_t)v16);
    }

    uint64_t v18 = *(void *)(v0 + 192);
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v19 = *(void *)(v0 + 184);

    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    static SiriSuggestionsIntelligence.getNoOpFeatureService()(v20);
    uint64_t v21 = *(void *)(v0 + 200);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v21);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100004558()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v4 = *(void **)v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 216LL));
  sub_10000397C(v1 + 12);
  sub_10000397C(v1 + 2);
  uint64_t v2 = v1[25];
  swift_task_dealloc(v1[26]);
  swift_task_dealloc(v2);
  return ((uint64_t (*)(void))v4[1])();
}

uint64_t DefaultFeatureServiceFactory.deinit()
{
  return v0;
}

uint64_t DefaultFeatureServiceFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t sub_10000460C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(dword_100010AF4);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_100004690;
  return DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)( a1,  a2,  a3,  a4,  a5);
}

uint64_t sub_100004690()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000046D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004720(&qword_100010AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004720(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004760(uint64_t a1)
{
  uint64_t v2 = sub_100004720(&qword_100010AF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DefaultFeatureServiceFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC33SiriSuggestionsBookkeepingService28DefaultFeatureServiceFactory);
}

void sub_1000047C0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_100003CD4();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v15 = sub_10000905C();
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)sub_100009040(2LL);
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Building the AutoComplete index via SiriSuggestionsBookkeepingService",  v18,  2u);
    sub_100003B70((uint64_t)v18);
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v12);
  uint64_t v19 = sub_1000092BC();
  sub_1000091A4(v11, v20, v21, v19);
  uint64_t v22 = sub_100009198((uint64_t)&unk_10000C840);
  *(void *)(v22 + 16) = 0LL;
  *(void *)(v22 + 24) = 0LL;
  *(_BYTE *)(v22 + 32) = a1 & 1;
  *(void *)(v22 + 40) = a2;
  *(void *)(v22 + 48) = a3;
  swift_retain(a3);
  uint64_t v23 = sub_1000049F0(v11, (uint64_t)&unk_100010C88, v22);
  swift_release(v23);
  sub_100009084();
}

uint64_t sub_100004900(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a5;
  *(void *)(v6 + 24) = a6;
  *(_BYTE *)(v6 + 56) = a4;
  return swift_task_switch(sub_10000491C, 0LL, 0LL);
}

uint64_t sub_10000491C()
{
  *(void *)(v0 + 32) = sub_1000092EC();
  uint64_t v1 = (void *)sub_100008FEC((uint64_t)&async function pointer to dispatch thunk of SiriAutoCompleteIndexBuilder.run(onStartUpEvent:));
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000497C;
  return v3(*(unsigned __int8 *)(v0 + 56));
}

uint64_t sub_10000497C()
{
  *(void *)(v1 + 48) = v0;
  sub_100009320(v2);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_1000049B8()
{
  return sub_100009054(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000049F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100007BD4(a1, 1LL, v6) == 1)
  {
    sub_100008834(a1, &qword_100010BF8);
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

  uint64_t v15 = swift_allocObject(&unk_10000C7A0, 32LL, 7LL);
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    uint64_t v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_100010C18, v15);
}

void sub_100004BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_100004BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v6[6] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[7] = v8;
  v6[8] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for ContinuousClock(0LL);
  v6[9] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[10] = v10;
  v6[11] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100004C58, 0LL, 0LL);
}

uint64_t sub_100004C58()
{
  uint64_t v1 = (void *)sub_100008FEC((uint64_t)&unk_100010C68);
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100004CC4;
  sub_100009048();
  return v3();
}

uint64_t sub_100004CC4()
{
  uint64_t v4 = v2[11];
  uint64_t v3 = v2[12];
  uint64_t v5 = v2[9];
  uint64_t v6 = v2[10];
  *uint64_t v7 = *v1;
  v2[13] = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  sub_100009048();
  return sub_100009174();
}

uint64_t sub_100004D2C()
{
  return sub_100009034(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100004D60()
{
  v0[14] = sub_1000092EC();
  uint64_t v1 = (void *)sub_100008FEC((uint64_t)&async function pointer to dispatch thunk of SiriAutoCompleteIndexBuilder.updateIndexForAppInstall(bundleIds:));
  v0[15] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100004DB0;
  uint64_t v2 = sub_100009264(v0[3]);
  return sub_100009078(v2, v3);
}

uint64_t sub_100004DB0()
{
  *(void *)(v1 + 128) = v0;
  sub_100009320(v2);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_100004DEC()
{
  uint64_t v1 = sub_1000091F4();
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[16];
    uint64_t v5 = (uint8_t *)sub_100009040(12LL);
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[2] = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v5 + 4, v5 + 12);
    sub_100009190( (void *)&_mh_execute_header,  v2,  v3,  "SiriAutoCompleteIndexBuilder updateIndexForAppInstall done. Added %ld phrases",  v5);
    sub_100003B70((uint64_t)v5);
  }

  uint64_t v6 = v0[16];
  uint64_t v7 = v0[8];
  uint64_t v8 = (void (*)(uint64_t))v0[4];
  (*(void (**)(uint64_t, void))(v0[7] + 8LL))(v7, v0[6]);
  v8(v6);
  sub_100009214();
  sub_1000092CC();
  swift_task_dealloc(v7);
  sub_100009360();
  return v9(v9, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_100004EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100007BD4(a1, 1LL, v6) == 1)
  {
    sub_100008834(a1, &qword_100010BF8);
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

  if (v14 | v12)
  {
    v17[0] = 0LL;
    v17[1] = 0LL;
    uint64_t v15 = v17;
    v17[2] = v12;
    v17[3] = v14;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return swift_task_create(v7, v15, (char *)&type metadata for () + 8, a2, a3);
}

void sub_100005034(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100005058( uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, void *))
{
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_100003CD4();
  uint64_t v48 = *(void *)(v19 - 8);
  uint64_t v49 = v19;
  __chkstk_darwin(v19, v20);
  sub_10000905C();
  uint64_t v21 = sub_100009338(a1);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v46 = a6;
    uint64_t v43 = a5;
    v24 = (uint8_t *)sub_100009040(12LL);
    uint64_t v44 = a2;
    uint64_t v25 = sub_100009040(32LL);
    uint64_t v50 = v25;
    *(_DWORD *)v24 = 136315138;
    uint64_t v26 = swift_bridgeObjectRetain(a1);
    uint64_t v27 = v18;
    uint64_t v28 = Array.description.getter(v26, &type metadata for String);
    uint64_t v45 = a3;
    unint64_t v30 = v29;
    swift_bridgeObjectRelease(a1);
    uint64_t v31 = v28;
    uint64_t v18 = v27;
    uint64_t v32 = sub_100007F84(v31, v30, &v50);
    uint64_t v33 = sub_100009394(v32);
    a6 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v33, v34, v24 + 4, v24 + 12);
    sub_1000091D4(a1);
    unint64_t v35 = v30;
    a3 = v45;
    swift_bridgeObjectRelease(v35);
    sub_100009190((void *)&_mh_execute_header, v22, v23, a4, v24);
    sub_1000091DC(v25);
    uint64_t v36 = v25;
    a2 = v44;
    sub_100003B70(v36);
    uint64_t v37 = (uint64_t)v24;
    a5 = v43;
    sub_100003B70(v37);
  }

  else
  {

    sub_1000091D4(a1);
  }

  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v7, v49);
  uint64_t v38 = sub_1000092BC();
  sub_1000091A4(v18, v39, v40, v38);
  v41 = (void *)sub_100009198(a5);
  v41[2] = 0LL;
  v41[3] = 0LL;
  v41[4] = a1;
  v41[5] = a2;
  v41[6] = a3;
  swift_bridgeObjectRetain(a1);
  swift_retain(a3);
  uint64_t v42 = a7(v18, a6, v41);
  swift_release(v42);
  sub_100009084();
}

uint64_t sub_10000527C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v6[7] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[8] = v8;
  v6[9] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000052E0, 0LL, 0LL);
}

uint64_t sub_1000052E0()
{
  v0[10] = sub_1000092EC();
  uint64_t v1 = (void *)sub_100008FEC((uint64_t)&async function pointer to dispatch thunk of SiriAutoCompleteIndexBuilder.deletePhrasesFromApp(bundleIds:));
  v0[11] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005330;
  uint64_t v2 = sub_100009264(v0[4]);
  return sub_100009078(v2, v3);
}

uint64_t sub_100005330()
{
  *(_BYTE *)(v1 + 96) = v0;
  sub_100009320(v2);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_10000536C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v27 = *(void *)(v24 + 32);
  static Logger.coreCategory.getter(v26);
  uint64_t v28 = sub_100009338(v27);
  unint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    int v44 = *(unsigned __int8 *)(v24 + 96);
    uint64_t v45 = *(void *)(v24 + 64);
    uint64_t v46 = *(void *)(v24 + 56);
    uint64_t v47 = *(void *)(v24 + 72);
    uint64_t v31 = *(void *)(v24 + 32);
    uint64_t v32 = sub_100009040(22LL);
    uint64_t v33 = sub_100009040(64LL);
    a13 = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    uint64_t v34 = swift_bridgeObjectRetain(v31);
    uint64_t v35 = Array.description.getter(v34, &type metadata for String);
    unint64_t v37 = v36;
    swift_bridgeObjectRelease(v31);
    *(void *)(v24 + 16) = sub_100007F84(v35, v37, &a13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v24 + 16, v24 + 24, v32 + 4, v32 + 12);
    swift_bridgeObjectRelease(v37);
    sub_1000091D4(v31);
    *(_WORD *)(v32 + 12) = 2080;
    if (v44) {
      uint64_t v38 = 0x7566736563637573LL;
    }
    else {
      uint64_t v38 = 0x6C69616620747562LL;
    }
    if (v44) {
      unint64_t v39 = 0xEB00000000796C6CLL;
    }
    else {
      unint64_t v39 = 0xEA00000000006465LL;
    }
    *(void *)(v24 + 24) = sub_100007F84(v38, v39, &a13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v24 + 24, v24 + 32, v32 + 14, v32 + 22);
    swift_bridgeObjectRelease(v39);
    _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "SiriAutoCompleteIndexBuilder deletePhrasesFromApp with %s function %s",  (uint8_t *)v32,  0x16u);
    swift_arrayDestroy(v33, 2LL);
    sub_100003B70(v33);
    sub_100003B70(v32);

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v46);
  }

  else
  {
    uint64_t v41 = *(void *)(v24 + 64);
    uint64_t v40 = *(void *)(v24 + 72);
    uint64_t v42 = *(void *)(v24 + 56);
    sub_1000091D4(*(void *)(v24 + 32));

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  }

  (*(void (**)(void))(v24 + 40))(*(unsigned __int8 *)(v24 + 96));
  sub_100009214();
  sub_1000092CC();
  return sub_1000090D0(*(uint64_t (**)(void))(v24 + 8));
}

uint64_t sub_1000055B8( void *a1, int a2, uint64_t a3, void *aBlock, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, a5);
  uint64_t v16 = swift_allocObject(a6, 24LL, 7LL);
  *(void *)(v16 + 16) = v14;
  id v17 = a1;
  a8(v15, a7, v16);

  swift_bridgeObjectRelease(v15);
  return swift_release(v16);
}

void sub_10000565C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_100003CD4();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  sub_10000905C();
  uint64_t v15 = sub_100009338(a1);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v36 = v12;
    uint64_t v38 = a3;
    uint64_t v18 = (uint8_t *)sub_100009040(12LL);
    uint64_t v19 = sub_100009040(32LL);
    uint64_t v39 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v20 = swift_bridgeObjectRetain(a1);
    uint64_t v21 = v11;
    uint64_t v22 = Array.description.getter(v20, &type metadata for Int64);
    uint64_t v37 = a2;
    unint64_t v24 = v23;
    swift_bridgeObjectRelease(a1);
    uint64_t v25 = v22;
    uint64_t v11 = v21;
    uint64_t v26 = sub_100007F84(v25, v24, &v39);
    uint64_t v27 = sub_100009394(v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v27, v28, v18 + 4, v18 + 12);
    sub_1000091D4(a1);
    unint64_t v29 = v24;
    a2 = v37;
    swift_bridgeObjectRelease(v29);
    sub_100009190( (void *)&_mh_execute_header,  v16,  v17,  "Rebuilding partial index for sources: %s via SiriSuggestionsBookkeepingService",  v18);
    sub_1000091DC(v19);
    sub_100003B70(v19);
    uint64_t v30 = (uint64_t)v18;
    a3 = v38;
    sub_100003B70(v30);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v36);
  }

  else
  {

    sub_1000091D4(a1);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v12);
  }

  uint64_t v31 = sub_1000092BC();
  sub_1000091A4(v11, v32, v33, v31);
  uint64_t v34 = (void *)sub_100009198((uint64_t)&unk_10000C7C8);
  v34[2] = 0LL;
  v34[3] = 0LL;
  v34[4] = a1;
  v34[5] = a2;
  v34[6] = a3;
  swift_bridgeObjectRetain(a1);
  swift_retain(a3);
  uint64_t v35 = sub_1000049F0(v11, (uint64_t)&unk_100010C40, (uint64_t)v34);
  swift_release(v35);
  sub_100009084();
}

uint64_t sub_10000587C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch(sub_100005898, 0LL, 0LL);
}

uint64_t sub_100005898()
{
  v0[5] = sub_1000092EC();
  uint64_t v1 = (void *)sub_100008FEC((uint64_t)&async function pointer to dispatch thunk of SiriAutoCompleteIndexBuilder.buildIndividualSources(sources:));
  v0[6] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000058E8;
  uint64_t v2 = sub_100009264(v0[2]);
  return sub_100009078(v2, v3);
}

uint64_t sub_1000058E8()
{
  *(void *)(v1 + 56) = v0;
  sub_100009320(v2);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_100005924()
{
  return sub_100009054(*(uint64_t (**)(void))(v0 + 8));
}

void sub_100005980( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, const void *a9)
{
  v75 = a8;
  uint64_t v79 = a6;
  uint64_t v80 = a7;
  uint64_t v72 = a5;
  uint64_t v81 = a3;
  uint64_t v82 = a4;
  uint64_t v92 = a1;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v87 = *(void *)(v10 - 8);
  unint64_t v88 = v10;
  __chkstk_darwin(v10, v11);
  v89 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v78 = type metadata accessor for UUID(0LL);
  uint64_t v73 = *(void *)(v78 - 8);
  uint64_t v13 = *(void *)(v73 + 64);
  __chkstk_darwin(v78, v14);
  v77 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100004720(&qword_100010BF8);
  __chkstk_darwin(v15, v16);
  uint64_t v86 = (uint64_t)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v85 = type metadata accessor for FeatureRequirementsTransport(0LL);
  uint64_t v74 = *(void *)(v85 - 8);
  uint64_t v18 = *(void *)(v74 + 64);
  uint64_t v20 = __chkstk_darwin(v85, v19);
  v76 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v20, v21);
  v83 = (char *)&v67 - v22;
  uint64_t v23 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 64);
  uint64_t v27 = __chkstk_darwin(v23, v26);
  __chkstk_darwin(v27, v28);
  v84 = (uint64_t *)((char *)&v67 - v29);
  uint64_t v91 = swift_allocObject(&unk_10000C8E0, 24LL, 7LL);
  *(void *)(v91 + 16) = a9;
  uint64_t v30 = type metadata accessor for PropertyListDecoder(0LL);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  uint64_t v31 = _Block_copy(a9);
  uint64_t v32 = PropertyListDecoder.init()(v31);
  v94[0] = 200LL;
  uint64_t v33 = sub_100004720(&qword_100010CB8);
  unint64_t v34 = sub_100008CC0();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)(&v93, v33, v92, a2, v94, v33, v34);
  v90 = a9;
  uint64_t v69 = v25;
  v71 = (char *)&v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v70 = v13;
  uint64_t v92 = v24;
  uint64_t v35 = v83;
  uint64_t v37 = v85;
  uint64_t v36 = v86;
  uint64_t v38 = v93;
  uint64_t v39 = sub_100008D80( &qword_100010CD0,  (uint64_t (*)(uint64_t))&type metadata accessor for DeliveryVehicle,  (uint64_t)&protocol conformance descriptor for DeliveryVehicle);
  uint64_t v40 = v84;
  uint64_t v41 = (char *)v32;
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)(v84, v23, v81, v82, v94, v23, v39);
  uint64_t v42 = sub_100008D80( &qword_100010CA0,  (uint64_t (*)(uint64_t))&type metadata accessor for FeatureRequirementsTransport,  (uint64_t)&protocol conformance descriptor for FeatureRequirementsTransport);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)(v35, v37, v79, v80, v94, v37, v42);
  uint64_t v43 = type metadata accessor for TaskPriority(0LL);
  sub_100007B5C(v36, 1LL, 1LL, v43);
  uint64_t v44 = v74;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v76, v35, v37);
  uint64_t v45 = *(void (**)(char *, void *, uint64_t))(v92 + 16);
  uint64_t v46 = v92;
  uint64_t v68 = v23;
  v45(v71, v40, v23);
  uint64_t v47 = v73;
  (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v77, v72, v78);
  uint64_t v48 = *(unsigned __int8 *)(v44 + 80);
  uint64_t v49 = (v48 + 40) & ~v48;
  unint64_t v50 = (v18 + v49 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v51 = *(unsigned __int8 *)(v46 + 80);
  uint64_t v52 = v46;
  uint64_t v53 = (v51 + v50 + 8) & ~v51;
  uint64_t v54 = *(unsigned __int8 *)(v47 + 80);
  v89 = v41;
  uint64_t v55 = (v69 + v54 + v53) & ~v54;
  unint64_t v88 = (v70 + v55 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  v56 = (char *)swift_allocObject(&unk_10000C908, v88 + 16, v48 | v51 | v54 | 7);
  *((void *)v56 + 2) = 0LL;
  *((void *)v56 + 3) = 0LL;
  v58 = v75;
  v57 = v76;
  *((void *)v56 + 4) = v75;
  v59 = &v56[v49];
  uint64_t v60 = v85;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v59, v57, v85);
  *(void *)&v56[v50] = v38;
  uint64_t v61 = v68;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(&v56[v53], v71, v68);
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v56[v55], v77, v78);
  v62 = &v56[v88];
  uint64_t v63 = v91;
  *(void *)v62 = sub_100008FB0;
  *((void *)v62 + 1) = v63;
  id v64 = v58;
  swift_retain(v63);
  uint64_t v65 = sub_1000049F0(v86, (uint64_t)&unk_100010CE0, (uint64_t)v56);
  swift_release(v89);
  swift_release(v65);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v83, v60);
  (*(void (**)(void *, uint64_t))(v52 + 8))(v84, v61);
  v66 = v90;
  swift_release(v63);
  _Block_release(v66);
}

uint64_t sub_100006020( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[11] = v14;
  v8[12] = v15;
  v8[9] = a7;
  v8[10] = a8;
  v8[8] = a6;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  v8[13] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v8[14] = v11;
  v8[15] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)swift_task_alloc(dword_100010BF4);
  v8[16] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_1000060C0;
  return sub_100006368((uint64_t)(v8 + 2), a5);
}

uint64_t sub_1000060C0()
{
  return sub_100008FE0();
}

uint64_t sub_1000060FC()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SuggestionsLogger.log(from:deliveryVehicle:generationId:)[1]);
  uint64_t v2 = sub_1000091B0(v1, (uint64_t)sub_100006158);
  return dispatch thunk of SuggestionsLogger.log(from:deliveryVehicle:generationId:)(v2);
}

uint64_t sub_100006158()
{
  return sub_100008FE0();
}

void sub_10000631C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100006368(uint64_t a1, uint64_t a2)
{
  v3[28] = a2;
  v3[29] = v2;
  v3[27] = a1;
  uint64_t v4 = type metadata accessor for SiriSuggestionsIntelligence.AccountDetails(0LL);
  v3[30] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_1000063B8()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.createProvider(from:)[1]);
  *(void *)(v0 + 248) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006438;
  return static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.createProvider(from:)( v0 + 16,  *(void *)(v0 + 240));
}

uint64_t sub_100006438()
{
  uint64_t v1 = *(void *)(v0 + 240);
  sub_100009024(*(void *)(v0 + 248));
  sub_100008730(v1);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_100006474()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = (void *)(v1
                + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_suggestionsLoggerFactory);
  uint64_t v3 = *(void *)(v1
                 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_suggestionsLoggerFactory
                 + 24);
  v0[32] = v3;
  v0[33] = v2[4];
  v0[34] = sub_100004198(v2, v3);
  uint64_t v4 = *(void *)(v1
                 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory
                 + 24);
  uint64_t v5 = *(void *)(v1
                 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory
                 + 32);
  sub_100004198( (void *)(v1 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory),  v4);
  uint64_t v16 = v1 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureFlagProvider;
  ((void (*)(void))FeatureRequirementsTransport.featureConfigWrapper.getter)();
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[16];
  uint64_t v8 = sub_100004198(v0 + 12, v6);
  v0[20] = v6;
  v0[21] = *(void *)(v7 + 8);
  uint64_t v9 = sub_10000421C(v0 + 17);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v9, v8, v6);
  sub_100003B0C((uint64_t)(v0 + 2), (uint64_t)(v0 + 22));
  ((void (*)(void))type metadata accessor for OwnerProviders)(0LL);
  uint64_t v10 = ((uint64_t (*)(void))FeatureRequirementsTransport.possibleOwners.getter)();
  uint64_t v11 = ((uint64_t (*)(uint64_t))OwnerProviders.__allocating_init(owners:))(v10);
  v0[35] = v11;
  uint64_t v12 = *(int **)(v5 + 8);
  uint64_t v15 = (int *)((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc(v12[1]);
  v0[36] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1000065D0;
  return ((uint64_t (*)(void *, uint64_t, void *, void *, uint64_t, uint64_t, uint64_t))v15)( v0 + 7,  v16,  v0 + 17,  v0 + 22,  v11,  v4,  v5);
}

uint64_t sub_1000065D0()
{
  uint64_t v1 = v0 + 12;
  uint64_t v2 = v0 + 17;
  uint64_t v3 = (uint64_t)(v0 + 22);
  uint64_t v4 = v0[35];
  sub_100009024(v0[36]);
  swift_release(v4);
  sub_100008834(v3, &qword_100010AF8);
  sub_10000397C(v2);
  sub_10000397C(v1);
  sub_100009048();
  return sub_100009174();
}

uint64_t sub_10000663C()
{
  uint64_t v1 = *(void *)(v0 + 240);
  dispatch thunk of SuggestionsLoggerFactory.create(featureService:)( v0 + 56,  *(void *)(v0 + 256),  *(void *)(v0 + 264));
  sub_10000397C((void *)(v0 + 56));
  sub_10000397C((void *)(v0 + 16));
  swift_task_dealloc(v1);
  return sub_100009054(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1000066A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, const void *a9)
{
  v84 = a8;
  uint64_t v89 = a6;
  uint64_t v90 = a7;
  uint64_t v94 = a4;
  uint64_t v95 = a5;
  uint64_t v82 = a3;
  uint64_t v105 = a1;
  uint64_t v106 = a2;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v100 = *(void *)(v9 - 8);
  uint64_t v101 = v9;
  __chkstk_darwin(v9, v10);
  v102 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v88 = type metadata accessor for UUID(0LL);
  uint64_t v87 = *(void *)(v88 - 8);
  __chkstk_darwin(v88, v12);
  uint64_t v93 = v13;
  uint64_t v86 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100004720(&qword_100010BF8);
  __chkstk_darwin(v14, v15);
  uint64_t v98 = (uint64_t)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v92 = type metadata accessor for FeatureRequirementsTransport(0LL);
  uint64_t v83 = *(void *)(v92 - 8);
  uint64_t v17 = *(void *)(v83 + 64);
  uint64_t v19 = __chkstk_darwin(v92, v18);
  uint64_t v85 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19, v20);
  v96 = (char *)&v77 - v21;
  uint64_t v99 = type metadata accessor for InvocationType(0LL);
  uint64_t v91 = *(void *)(v99 - 8);
  uint64_t v22 = *(void *)(v91 + 64);
  uint64_t v24 = __chkstk_darwin(v99, v23);
  __chkstk_darwin(v24, v25);
  v97 = (uint64_t *)((char *)&v77 - v26);
  uint64_t v27 = type metadata accessor for Action(0LL);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(void *)(v28 + 64);
  uint64_t v31 = __chkstk_darwin(v27, v30);
  __chkstk_darwin(v31, v32);
  unint64_t v34 = (uint64_t *)((char *)&v77 - v33);
  uint64_t v103 = swift_allocObject(&unk_10000C890, 24LL, 7LL);
  *(void *)(v103 + 16) = a9;
  uint64_t v35 = type metadata accessor for PropertyListDecoder(0LL);
  swift_allocObject(v35, *(unsigned int *)(v35 + 48), *(unsigned __int16 *)(v35 + 52));
  v104 = a9;
  uint64_t v36 = _Block_copy(a9);
  uint64_t v37 = PropertyListDecoder.init()(v36);
  uint64_t v107 = 200LL;
  uint64_t v38 = v37;
  uint64_t v39 = sub_100008D80( &qword_100010C90,  (uint64_t (*)(uint64_t))&type metadata accessor for Action,  (uint64_t)&protocol conformance descriptor for Action);
  uint64_t v40 = v106;
  uint64_t v106 = v38;
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)(v34, v27, v105, v40, &v107, v27, v39);
  uint64_t v78 = (char *)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v77 = v22;
  uint64_t v79 = (char *)&v77 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = v93;
  uint64_t v80 = v34;
  uint64_t v81 = v28;
  uint64_t v105 = v27;
  uint64_t v42 = v96;
  uint64_t v43 = v98;
  uint64_t v44 = v92;
  uint64_t v45 = sub_100008D80( &qword_100010C98,  (uint64_t (*)(uint64_t))&type metadata accessor for InvocationType,  (uint64_t)&protocol conformance descriptor for InvocationType);
  uint64_t v46 = v97;
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)(v97, v99, v94, v95, &v107, v99, v45);
  uint64_t v47 = sub_100008D80( &qword_100010CA0,  (uint64_t (*)(uint64_t))&type metadata accessor for FeatureRequirementsTransport,  (uint64_t)&protocol conformance descriptor for FeatureRequirementsTransport);
  uint64_t v48 = v42;
  uint64_t v49 = v42;
  uint64_t v50 = v44;
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)(v48, v44, v89, v90, &v107, v44, v47);
  uint64_t v51 = type metadata accessor for TaskPriority(0LL);
  sub_100007B5C(v43, 1LL, 1LL, v51);
  uint64_t v52 = v83;
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v85, v49, v50);
  uint64_t v53 = v81;
  (*(void (**)(char *, void *, uint64_t))(v81 + 16))(v78, v80, v105);
  uint64_t v54 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v86, v82, v88);
  uint64_t v55 = v91;
  (*(void (**)(char *, void *, uint64_t))(v91 + 16))(v79, v46, v99);
  uint64_t v56 = *(unsigned __int8 *)(v52 + 80);
  uint64_t v57 = (v56 + 40) & ~v56;
  uint64_t v58 = *(unsigned __int8 *)(v53 + 80);
  uint64_t v59 = (v17 + v58 + v57) & ~v58;
  uint64_t v60 = *(unsigned __int8 *)(v54 + 80);
  uint64_t v61 = (v29 + v60 + v59) & ~v60;
  uint64_t v62 = *(unsigned __int8 *)(v55 + 80);
  uint64_t v63 = (v41 + v62 + v61) & ~v62;
  unint64_t v64 = (v77 + v63 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v65 = v50;
  v66 = (char *)swift_allocObject(&unk_10000C8B8, v64 + 16, v56 | v58 | v60 | v62 | 7);
  *((void *)v66 + 2) = 0LL;
  *((void *)v66 + 3) = 0LL;
  uint64_t v67 = v84;
  *((void *)v66 + 4) = v84;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(&v66[v57], v85, v65);
  uint64_t v68 = v81;
  uint64_t v69 = v105;
  (*(void (**)(char *, char *, uint64_t))(v81 + 32))(&v66[v59], v78, v105);
  (*(void (**)(char *, char *, uint64_t))(v87 + 32))(&v66[v61], v86, v88);
  uint64_t v70 = v91;
  uint64_t v71 = v99;
  (*(void (**)(char *, char *, uint64_t))(v91 + 32))(&v66[v63], v79, v99);
  uint64_t v72 = (void (**)(uint64_t))&v66[v64];
  uint64_t v73 = v103;
  *uint64_t v72 = sub_100008A74;
  v72[1] = (void (*)(uint64_t))v73;
  id v74 = v67;
  swift_retain(v73);
  uint64_t v75 = sub_1000049F0(v98, (uint64_t)&unk_100010CB0, (uint64_t)v66);
  swift_release(v106);
  swift_release(v75);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v96, v65);
  (*(void (**)(void *, uint64_t))(v70 + 8))(v97, v71);
  (*(void (**)(void *, uint64_t))(v68 + 8))(v80, v69);
  v76 = v104;
  swift_release(v73);
  _Block_release(v76);
}

uint64_t sub_100006E48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[11] = v14;
  v8[12] = v15;
  v8[9] = a7;
  v8[10] = a8;
  v8[8] = a6;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  v8[13] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v8[14] = v11;
  v8[15] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)swift_task_alloc(dword_100010BF4);
  v8[16] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_100006EE8;
  return sub_100006368((uint64_t)(v8 + 2), a5);
}

uint64_t sub_100006EE8()
{
  return sub_100008FE0();
}

uint64_t sub_100006F24()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SuggestionsLogger.logEngagement(for:with:invocationType:)[1]);
  uint64_t v2 = sub_1000091B0(v1, (uint64_t)sub_100006F80);
  return dispatch thunk of SuggestionsLogger.logEngagement(for:with:invocationType:)(v2);
}

uint64_t sub_100006F80()
{
  return sub_100008FE0();
}

uint64_t sub_100006FBC()
{
  uint64_t v1 = *(void (**)(void))(v0 + 88);
  sub_10000397C((void *)(v0 + 16));
  v1(0LL);
  swift_task_dealloc(*(void *)(v0 + 120));
  return sub_100009054(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100006FFC()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = sub_10000397C((void *)(v0 + 16));
  static Logger.coreCategory.getter(v2);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 144);
    uint64_t v7 = (uint8_t *)sub_100009040(12LL);
    uint64_t v8 = (void *)sub_100009040(8LL);
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain(v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError(v6);
    *(void *)(v0 + 56) = v9;
    sub_1000092DC(v0 + 56);
    *uint64_t v8 = v9;
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    sub_100009190((void *)&_mh_execute_header, v4, v5, "SiriSuggestionsBookkeepingService log failed. error: %@", v7);
    sub_100004720(&qword_100010C20);
    sub_1000091DC((uint64_t)v8);
    sub_100003B70((uint64_t)v8);
    sub_100003B70((uint64_t)v7);
  }

  else
  {
    sub_10000911C();
    sub_10000911C();
  }

  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v11 = *(void (**)(uint64_t))(v0 + 88);

  sub_100009310();
  sub_10000924C();
  v11(v10);
  sub_10000911C();
  sub_10000911C();
  swift_task_dealloc(*(void *)(v0 + 120));
  return sub_100009124(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000072E8(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_1000092BC();
  sub_1000091A4(v9, v11, v12, v10);
  uint64_t v13 = (void *)sub_100009198((uint64_t)&unk_10000C778);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = v2;
  void v13[5] = a1;
  v13[6] = a2;
  id v14 = v2;
  swift_retain(a2);
  uint64_t v15 = sub_1000049F0(v9, (uint64_t)&unk_100010C08, (uint64_t)v13);
  return swift_release(v15);
}

uint64_t sub_100007394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v6[7] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[8] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[9] = swift_task_alloc(v9);
  v6[10] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for SiriSuggestionsIntelligence.AccountDetails(0LL);
  v6[11] = v10;
  unint64_t v11 = (*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[12] = swift_task_alloc(v11);
  v6[13] = swift_task_alloc(v11);
  return swift_task_switch(sub_10000743C, 0LL, 0LL);
}

uint64_t sub_10000743C()
{
  uint64_t v1 = (void *)(v0[4]
                + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_accountService);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100004198(v1, v2);
  uint64_t v4 = (void *)sub_100008FEC(*(void *)(v3 + 8));
  v0[14] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000074B8;
  return v6(v0[13], v2, v3);
}

uint64_t sub_1000074B8()
{
  uint64_t v3 = *(void *)(v2 + 112);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 120) = v0;
  swift_task_dealloc(v3);
  sub_100009048();
  return sub_100008FE0();
}

uint64_t sub_100007508( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v27 = *(void *)(v24 + 96);
  uint64_t v28 = *(void *)(v24 + 104);
  static Logger.coreCategory.getter(v26);
  uint64_t v29 = sub_1000086EC(v28, v27);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = *(void *)(v24 + 96);
    uint64_t v33 = *(void *)(v24 + 64);
    uint64_t v64 = *(void *)(v24 + 56);
    uint64_t v65 = *(void *)(v24 + 80);
    unint64_t v34 = (uint8_t *)sub_100009040(12LL);
    uint64_t v35 = sub_100009040(32LL);
    a12 = v35;
    *(_DWORD *)unint64_t v34 = 136315138;
    uint64_t v36 = SiriSuggestionsIntelligence.AccountDetails.description.getter();
    unint64_t v38 = v37;
    *(void *)(v24 + 24) = sub_100007F84(v36, v37, &a12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v24 + 24, v24 + 32, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease(v38);
    sub_100008730(v32);
    sub_100009190((void *)&_mh_execute_header, v30, v31, "Got account details as: %s", v34);
    sub_1000091DC(v35);
    sub_100003B70(v35);
    sub_100003B70((uint64_t)v34);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v65, v64);
  }

  else
  {
    uint64_t v39 = *(void *)(v24 + 80);
    uint64_t v40 = *(void *)(v24 + 56);
    uint64_t v41 = *(void *)(v24 + 64);
    sub_100008730(*(void *)(v24 + 96));

    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
  }

  uint64_t v42 = *(void *)(v24 + 120);
  uint64_t v43 = *(void *)(v24 + 104);
  uint64_t v44 = *(void *)(v24 + 88);
  uint64_t v45 = type metadata accessor for PropertyListEncoder(0LL);
  swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
  uint64_t v46 = PropertyListEncoder.init()();
  dispatch thunk of PropertyListEncoder.outputFormat.setter(200LL);
  uint64_t v47 = sub_100008D80( &qword_100010C28,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriSuggestionsIntelligence.AccountDetails,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsIntelligence.AccountDetails);
  uint64_t v48 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v43, v44, v47);
  uint64_t v50 = *(void *)(v24 + 104);
  if (v42)
  {
    sub_100008730(*(void *)(v24 + 104));
    sub_100009214();
    sub_1000091F4();
    sub_1000092D4();
    uint64_t v51 = sub_1000092D4();
    uint64_t v52 = (os_log_s *)Logger.logObject.getter(v51);
    os_log_type_t v53 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)sub_100009040(12LL);
      uint64_t v55 = (void *)sub_100009040(8LL);
      *(_DWORD *)uint64_t v54 = 138412290;
      sub_1000092D4();
      uint64_t v56 = _swift_stdlib_bridgeErrorToNSError(v42);
      *(void *)(v24 + 16) = v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v24 + 16, v24 + 24, v54 + 4, v54 + 12);
      *uint64_t v55 = v56;
      sub_10000920C();
      sub_10000920C();
      sub_100009190((void *)&_mh_execute_header, v52, v53, "Unable to get account details. Error: %@", v54);
      sub_100004720(&qword_100010C20);
      sub_1000091DC((uint64_t)v55);
      sub_100003B70((uint64_t)v55);
      sub_100003B70((uint64_t)v54);
    }

    else
    {
      sub_10000920C();
      sub_10000920C();
    }

    uint64_t v60 = *(void *)(v24 + 64);
    uint64_t v46 = *(void *)(v24 + 72);
    uint64_t v61 = *(void *)(v24 + 56);
    uint64_t v62 = *(void (**)(void, unint64_t, uint64_t))(v24 + 40);

    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v46, v61);
    sub_1000092D4();
    v62(0LL, 0xF000000000000000LL, v42);
    sub_10000920C();
    sub_10000920C();
  }

  else
  {
    uint64_t v57 = v48;
    unint64_t v58 = v49;
    uint64_t v59 = *(void (**)(uint64_t, unint64_t, void))(v24 + 40);
    sub_10000876C(v48, v49);
    v59(v57, v58, 0LL);
    sub_100009388();
    sub_100009214();
    sub_100009388();
    sub_100008730(v50);
  }

  sub_100009354();
  sub_10000925C();
  swift_task_dealloc(v46);
  sub_1000092CC();
  return sub_1000090D0(*(uint64_t (**)(void))(v24 + 8));
}

uint64_t sub_100007850()
{
  uint64_t v1 = *(void *)(v0 + 120);
  sub_1000091F4();
  sub_10000924C();
  uint64_t v2 = sub_10000924C();
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)sub_100009040(12LL);
    uint64_t v6 = (void *)sub_100009040(8LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    sub_10000924C();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(void *)(v0 + 16) = v7;
    sub_1000092DC(v0 + 16);
    *uint64_t v6 = v7;
    sub_10000911C();
    sub_10000911C();
    sub_100009190((void *)&_mh_execute_header, v3, v4, "Unable to get account details. Error: %@", v5);
    sub_100004720(&qword_100010C20);
    sub_1000091DC((uint64_t)v6);
    sub_100003B70((uint64_t)v6);
    sub_100003B70((uint64_t)v5);
  }

  else
  {
    sub_10000911C();
    sub_10000911C();
  }

  uint64_t v8 = *(void (**)(void, unint64_t, uint64_t))(v0 + 40);

  sub_100009310();
  sub_10000924C();
  v8(0LL, 0xF000000000000000LL, v1);
  sub_10000911C();
  sub_10000911C();
  sub_100009354();
  sub_10000925C();
  swift_task_dealloc(v1);
  sub_1000092CC();
  return sub_100009124(*(uint64_t (**)(void))(v0 + 8));
}

void sub_100007A04(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0LL;
    goto LABEL_6;
  }

  Class isa = 0LL;
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = _convertErrorToNSError(_:)(a3);
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_100007A84()
{
}

id sub_100007ABC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSuggestionsBookkeepingService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriSuggestionsBookkeepingService()
{
  return objc_opt_self(&OBJC_CLASS____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService);
}

uint64_t sub_100007B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100007B68()
{
  uint64_t v0 = sub_100009328();
  return swift_deallocObject(v0, v1, v2);
}

uint64_t sub_100007B88()
{
  uint64_t v0 = swift_task_alloc(dword_100010C04);
  uint64_t v1 = (void *)sub_100009184(v0);
  sub_100009000(v1);
  sub_100009360();
  return sub_100007394(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_100007BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100007BE0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100007C44;
  return v6(a1);
}

uint64_t sub_100007C44()
{
  return sub_100009034(v0[1]);
}

uint64_t sub_100007C7C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100007CA0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = swift_task_alloc(dword_100010C14);
  uint64_t v6 = (void *)sub_100009184(v5);
  *uint64_t v6 = v2;
  v6[1] = sub_100008FB4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100010C10 + dword_100010C10))(a1, v4);
}

uint64_t sub_100007D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant(0LL);
  *(void *)(v6 + 64) = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)(v6 + 72) = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 80) = swift_task_alloc(v14);
  *(void *)(v6 + 88) = swift_task_alloc(v14);
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch(sub_100007DB0, 0LL, 0LL);
}

uint64_t sub_100007DB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12[10];
  uint64_t v14 = v12[8];
  uint64_t v15 = v12[9];
  uint64_t v16 = type metadata accessor for ContinuousClock(0LL);
  uint64_t v17 = sub_100008D80( &qword_100010C70,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
  dispatch thunk of Clock.now.getter(v16, v17);
  uint64_t v18 = sub_100008D80( &qword_100010C78,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)(v12 + 5, v14, v18);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v12[12] = v19;
  v19(v13, v14);
  uint64_t v20 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
  v12[13] = v20;
  void *v20 = v12;
  v20[1] = sub_100007EB0;
  sub_1000092F4();
  return dispatch thunk of Clock.sleep(until:tolerance:)(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_100007EB0()
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v2 = *(void *)(*v1 + 104);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 64);
  uint64_t v6 = *v1;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  v3(v4, v5);
  if (v0)
  {
    sub_100009048();
    return swift_task_switch(v7, v8, v9);
  }

  else
  {
    swift_task_dealloc(*(void *)(v6 + 88));
    sub_10000925C();
    return (*(uint64_t (**)(void))(v6 + 8))();
  }

uint64_t sub_100007F54()
{
  return sub_100009034(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100007F84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008054(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000087F4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000087F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000397C(v12);
  return v7;
}

void *sub_100008054(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000081A8((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_10000826C(a5, a6);
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
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

void *sub_1000081A8(char *__src, size_t __n, char *__dst)
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

void *sub_10000826C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100008300(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000084D4(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000084D4((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100008300(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_100008470(v4, 0LL);
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

void *sub_100008470(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004720(&qword_100010C30);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000084D4(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_100004720(&qword_100010C30);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_10000866C(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000085A8(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000085A8(char *__src, size_t __n, char *__dst)
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

char *sub_10000866C(char *__src, size_t __len, char *__dst)
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

uint64_t sub_1000086EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriSuggestionsIntelligence.AccountDetails(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008730(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriSuggestionsIntelligence.AccountDetails(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000876C(uint64_t result, unint64_t a2)
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

uint64_t sub_1000087B0(uint64_t result, unint64_t a2)
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

uint64_t sub_1000087F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008834(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004720(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100008874()
{
  uint64_t v0 = swift_task_alloc(dword_100010C3C);
  uint64_t v1 = (void *)sub_100009184(v0);
  sub_100009000(v1);
  sub_100009360();
  return sub_10000587C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1000088C4()
{
  uint64_t v0 = swift_task_alloc(dword_100010C4C);
  uint64_t v1 = (void *)sub_100009184(v0);
  sub_100009000(v1);
  sub_100009360();
  return sub_10000527C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_100008914()
{
  uint64_t v1 = sub_100009328();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_100008938()
{
  uint64_t v0 = swift_task_alloc(dword_100010C5C);
  uint64_t v1 = (void *)sub_100009184(v0);
  sub_100009000(v1);
  sub_100009360();
  return sub_100004BCC(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_100008984()
{
  return sub_100009034(v0[1]);
}

uint64_t sub_1000089B8()
{
  uint64_t v0 = sub_100009328();
  return swift_deallocObject(v0, v1, v2);
}

uint64_t sub_1000089D4()
{
  uint64_t v1 = swift_task_alloc(dword_100010C84);
  uint64_t v2 = (void *)sub_100009184(v1);
  void *v2 = v0;
  v2[1] = sub_100008FB8;
  sub_100009360();
  return sub_100004900(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_100008A48()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100008A6C(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_100008A74(uint64_t a1)
{
}

uint64_t sub_100008A7C()
{
  uint64_t v22 = sub_1000092C4();
  uint64_t v1 = *(void *)(v22 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v18 = (v2 + 40) & ~v2;
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v21 = type metadata accessor for Action(0LL);
  uint64_t v4 = *(void *)(v21 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = (v18 + v3 + v5) & ~v5;
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v20 = sub_1000092B4();
  uint64_t v7 = *(void *)(v20 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v17 + v6 + v8) & ~v8;
  uint64_t v10 = *(void *)(v7 + 64);
  uint64_t v19 = type metadata accessor for InvocationType(0LL);
  uint64_t v11 = *(void *)(v19 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = (v9 + v10 + v12) & ~v12;
  uint64_t v14 = v2 | v5 | v8 | v12 | 7;
  unint64_t v15 = (*(void *)(v11 + 64) + v13 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_100009254();
  sub_1000093C4();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v18, v22);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v17, v21);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v20);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v13, v19);
  swift_release(*(void *)(v0 + v15 + 8));
  return swift_deallocObject(v0, v15 + 16, v14);
}

uint64_t sub_100008BD0(uint64_t a1)
{
  uint64_t v1 = swift_task_alloc(dword_100010CAC);
  uint64_t v2 = (void *)sub_100009184(v1);
  sub_1000090EC(v2, v3, v4, v5, v6, v7, v8, v9, a1);
  sub_1000092F4();
  return sub_100006E48(v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_100008C84()
{
  return v0[1]();
}

unint64_t sub_100008CC0()
{
  unint64_t result = qword_100010CC0;
  if (!qword_100010CC0)
  {
    uint64_t v1 = sub_100008D3C(&qword_100010CB8);
    sub_100008D80( &qword_100010CC8,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriSuggestions.Suggestion,  (uint64_t)&protocol conformance descriptor for SiriSuggestions.Suggestion);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010CC0);
  }

  return result;
}

uint64_t sub_100008D3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100008D80(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100008DC0()
{
  uint64_t v18 = sub_1000092C4();
  uint64_t v1 = *(void *)(v18 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  unint64_t v4 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v15 = v4;
  uint64_t v17 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v5 = *(void *)(v17 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + v6 + 8) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_1000092B4();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v16 = v2 | v6 | v11 | 7;
  unint64_t v13 = (*(void *)(v10 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_100009254();
  sub_1000093C4();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v18);
  swift_bridgeObjectRelease(*(void *)(v0 + v15));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v17);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);
  swift_release(*(void *)(v0 + v13 + 8));
  return swift_deallocObject(v0, v13 + 16, v16);
}

uint64_t sub_100008EEC(uint64_t a1)
{
  uint64_t v1 = swift_task_alloc(dword_100010CDC);
  uint64_t v2 = (void *)sub_100009184(v1);
  sub_1000090EC(v2, v3, v4, v5, v6, v7, v8, v9, a1);
  sub_1000092F4();
  return sub_100006020(v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_100008F8C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_100008F9C(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16LL))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100008FE0()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100008FEC@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc(*(unsigned int *)(a1 + 4));
}

uint64_t sub_100009000(void *a1)
{
  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_100009024(uint64_t a1)
{
  *(void *)(v2 - 8) = *v1;
  return swift_task_dealloc(a1);
}

uint64_t sub_100009034(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009040(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

  ;
}

uint64_t sub_100009054(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000905C()
{
  return static Logger.coreCategory.getter();
}

uint64_t sub_100009078(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

  ;
}

  ;
}

uint64_t sub_1000090D0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000090EC( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *a1 = v12;
  a1[1] = v9;
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = v10;
  return a9;
}

uint64_t sub_10000911C()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100009124(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_100009154()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 136);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 144) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_100009174()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100009184(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void sub_100009190(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100009198(uint64_t a1)
{
  return swift_allocObject(a1, 56LL, 7LL);
}

uint64_t sub_1000091A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007B5C(a1, 1LL, 1LL, a4);
}

uint64_t sub_1000091B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 136) = a1;
  *a1 = v2;
  a1[1] = a2;
  return *(void *)(v2 + 64);
}

uint64_t sub_1000091D4(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 2LL);
}

uint64_t sub_1000091DC(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

void sub_1000091E4()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_1000091F4()
{
  return static Logger.coreCategory.getter();
}

  ;
}

uint64_t sub_10000920C()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100009214()
{
  return swift_release(v0);
}

  ;
}

void sub_10000922C()
{
  *(void *)(v1 - 8) = *v0;
}

void sub_10000923C()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_10000924C()
{
  return swift_errorRetain(v0);
}

uint64_t sub_100009254()
{
  return swift_unknownObjectRelease(*(void *)(v0 + 16));
}

uint64_t sub_10000925C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_100009264@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

  ;
}

  ;
}

uint64_t sub_1000092AC()
{
  return type metadata accessor for SiriAutoCompleteIndexBuilder(0LL);
}

uint64_t sub_1000092B4()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_1000092BC()
{
  return type metadata accessor for TaskPriority(0LL);
}

uint64_t sub_1000092C4()
{
  return type metadata accessor for FeatureRequirementsTransport(0LL);
}

uint64_t sub_1000092CC()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1000092D4()
{
  return swift_errorRetain(v0);
}

uint64_t sub_1000092DC(uint64_t a1)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a1 + 8, v2, v1);
}

uint64_t sub_1000092EC()
{
  return SiriAutoCompleteIndexBuilder.__allocating_init()();
}

  ;
}

uint64_t sub_100009310()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_100009320@<X0>(uint64_t a1@<X8>)
{
  return swift_task_dealloc(a1);
}

uint64_t sub_100009328()
{
  return v0;
}

uint64_t sub_100009338(uint64_t a1)
{
  return swift_bridgeObjectRetain_n(a1, 2LL);
}

  ;
}

uint64_t sub_100009354()
{
  return swift_task_dealloc(*(void *)(v0 + 104));
}

  ;
}

  ;
}

uint64_t sub_100009388()
{
  return sub_1000087B0(v0, v1);
}

uint64_t sub_100009394(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

  ;
}

uint64_t sub_1000093BC()
{
  return swift_release(*(void *)(v0 + 48));
}

void sub_1000093C4()
{
}

uint64_t sub_1000093CC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000397C((void *)(v1 + a1));
}

uint64_t sub_1000093D4(uint64_t a1, void *a2)
{
  id v4 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP15SiriSuggestions41SiriSuggestionsBookkeepingServiceProtocol_];
  [a2 setExportedInterface:v4];

  sub_100003B0C( v2 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_suggestionsLoggerFactory,  (uint64_t)v12);
  sub_100003B0C( v2 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureServiceFactory,  (uint64_t)v11);
  sub_100003B0C( v2 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureFlagProvider,  (uint64_t)v10);
  uint64_t v5 = type metadata accessor for SiriSuggestionsIntelligence.AppleAccountService(0LL);
  swift_allocObject(v5, 32LL, 7LL);
  uint64_t v6 = SiriSuggestionsIntelligence.AppleAccountService.init(accountStore:)(sub_100009504, 0LL);
  id v7 = objc_allocWithZone((Class)type metadata accessor for SiriSuggestionsBookkeepingService());
  id v8 = sub_100009668(v12, v11, v10, v6, v7);
  [a2 setExportedObject:v8];
  [a2 resume];

  return 1LL;
}

id sub_100009504()
{
  id result = [(id)objc_opt_self(ACAccountStore) defaultStore];
  if (!result) {
    __break(1u);
  }
  return result;
}

void sub_100009594()
{
}

id sub_1000095CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BookkeepingServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate);
}

id sub_100009668(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  v13[3] = type metadata accessor for SiriSuggestionsIntelligence.AppleAccountService(0LL);
  v13[4] = &protocol witness table for SiriSuggestionsIntelligence.AppleAccountService;
  v13[0] = a4;
  sub_100003B0C( (uint64_t)a1,  (uint64_t)a5 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_suggestionsLoggerFactory);
  sub_100003B0C( (uint64_t)a2,  (uint64_t)a5 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory);
  sub_100003B0C( (uint64_t)a3,  (uint64_t)a5 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureFlagProvider);
  sub_100003B0C( (uint64_t)v13,  (uint64_t)a5 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_accountService);
  v12.receiver = a5;
  v12.super_class = (Class)type metadata accessor for SiriSuggestionsBookkeepingService();
  id v10 = objc_msgSendSuper2(&v12, "init");
  sub_10000397C(v13);
  sub_10000397C(a3);
  sub_10000397C(a2);
  sub_10000397C(a1);
  return v10;
}
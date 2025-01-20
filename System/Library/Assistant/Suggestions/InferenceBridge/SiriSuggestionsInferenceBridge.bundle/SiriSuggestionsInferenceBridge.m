uint64_t variable initialization expression of SiriInferenceBridge.delegate()
{
  return 0LL;
}

void variable initialization expression of SiriInferenceBridge.xpcListener()
{
  uint64_t v0 = static SiriSuggestionsXPCConstants.machServiceName.getter();
  sub_2E34(v0, v1);
  sub_5BD4();
}

unint64_t sub_2DF8()
{
  unint64_t result = qword_C358;
  if (!qword_C358)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSXPCListener);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_C358);
  }

  return result;
}

id sub_2E34(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithMachServiceName:v5];

  return v6;
}

double variable initialization expression of SiriInferenceBridge.siriRemembersEntityExtractorProvider@<D0>( uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0LL;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t SiriInferenceBridge.__allocating_init()()
{
  return sub_5B1C((uint64_t)sub_2EC0);
}

uint64_t sub_2EC0()
{
  uint64_t v1 = type metadata accessor for OSFeatureFlagProvider(0LL);
  uint64_t v2 = OSFeatureFlagProvider.__allocating_init()();
  v0[5] = v1;
  v0[6] = &protocol witness table for OSFeatureFlagProvider;
  v0[2] = v2;
  uint64_t v3 = type metadata accessor for SiriInferenceBridge();
  sub_5BF4(v3, 72LL);
  id v4 = (void *)swift_task_alloc(dword_C36C);
  v0[7] = v4;
  *id v4 = v0;
  v4[1] = sub_2F38;
  return sub_5B88((uint64_t)(v0 + 2));
}

uint64_t sub_2F38(uint64_t a1)
{
  uint64_t v5 = *(void *)(v4 + 56);
  uint64_t v6 = *v2;
  void *v7 = v6;
  *(void *)(v4 + 64) = v1;
  swift_task_dealloc(v5);
  if (!v1) {
    return sub_5BA0(a1, *(uint64_t (**)(void))(v6 + 8));
  }
  sub_5BAC();
  return sub_5B94(v8, v9, v10);
}

uint64_t sub_2F90()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriInferenceBridge.__allocating_init(featureFlagProvider:)(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_C36C);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2FF0;
  return sub_5B88(a1);
}

uint64_t sub_2FF0(uint64_t a1)
{
  uint64_t v4 = sub_5AB4();
  if (!v1) {
    uint64_t v4 = a1;
  }
  return sub_5BA0(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t type metadata accessor for SiriInferenceBridge()
{
  return objc_opt_self(&OBJC_CLASS____TtC30SiriSuggestionsInferenceBridge19SiriInferenceBridge);
}

uint64_t SiriInferenceBridge.init(featureFlagProvider:)(uint64_t a1)
{
  v2[62] = a1;
  v2[63] = v1;
  uint64_t v3 = sub_3C34(&qword_C378);
  v2[64] = sub_5AE4(*(void *)(v3 - 8));
  uint64_t v4 = sub_5C68();
  v2[65] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[66] = v5;
  v2[67] = *(void *)(v5 + 64);
  v2[68] = sub_5C30();
  v2[69] = sub_5C30();
  uint64_t v6 = type metadata accessor for TrialUseCase(0LL);
  v2[70] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[71] = v7;
  v2[72] = sub_5AE4(v7);
  uint64_t v8 = type metadata accessor for ThirdPartyHomeScreenAppPicker(0LL);
  v2[73] = sub_5AE4(*(void *)(v8 - 8));
  uint64_t v9 = sub_5BDC();
  v2[74] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[75] = v10;
  v2[76] = sub_5AE4(v10);
  uint64_t v11 = type metadata accessor for OSSignpostID(0LL);
  v2[77] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[78] = v12;
  v2[79] = sub_5AE4(v12);
  sub_5BAC();
  return sub_5B04();
}

uint64_t sub_3118()
{
  uint64_t v1 = v0[79];
  uint64_t v2 = (os_log_s *)v0[76];
  uint64_t v3 = v0[63];
  *(void *)(v3 + 16) = 0LL;
  sub_2DF8();
  type metadata accessor for SiriSuggestionsXPCConstants(0LL);
  uint64_t v4 = static SiriSuggestionsXPCConstants.machServiceName.getter();
  *(void *)(v3 + 24) = sub_2E34(v4, v5);
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(void *)(v3 + 64) = 0LL;
  uint64_t v6 = (void *)static Logger.log.getter();
  static Logger.makeSignpostID(log:)();

  uint64_t v8 = static SiriSuggestionsSignpost.bridgeStartup.getter(v7);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v13 = (void *)static Logger.log.getter();
  static Logger.begin(_:_:log:telemetry:)(v1, v8, v10, v12, v13, 1LL);

  uint64_t v14 = static Logger.xpcCategory.getter();
  v15 = v2;
  Logger.logObject.getter(v14);
  os_log_type_t v16 = sub_5C60();
  if (sub_5B40(v16))
  {
    v17 = (uint8_t *)sub_5B28();
    *(_WORD *)v17 = 0;
    sub_5BCC(&dword_0, v2, (os_log_type_t)v2, "starting suggestions xpc service..", v17);
    sub_5B10((uint64_t)v17);
  }

  uint64_t v18 = v0[76];
  uint64_t v19 = v0[75];
  uint64_t v20 = v0[74];
  uint64_t v21 = v0[73];
  uint64_t v22 = v0[72];
  uint64_t v23 = v0[71];
  uint64_t v24 = v0[70];
  uint64_t v64 = v0[69];
  uint64_t v57 = v0[66];
  uint64_t v55 = v0[65];

  uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  static Clocks.getSystemClock()(v25);
  sub_3C34(&qword_C380);
  uint64_t v26 = sub_3C34(&qword_C388);
  uint64_t v27 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v26,  &protocol witness table for String);
  uint64_t v28 = Cache.__allocating_init(store:)(v27);
  ThirdPartyHomeScreenAppPicker.init(randSeed:)(0LL, 1LL);
  uint64_t v29 = type metadata accessor for AppUtilsService(0LL);
  sub_5B34(v29);
  uint64_t v61 = AppUtilsService.init(cache:homescreenAppPicker:)(v28, v21);
  v0[80] = v61;
  uint64_t v60 = type metadata accessor for DefaultSELFLogger(0LL);
  uint64_t v59 = DefaultSELFLogger.__allocating_init()();
  v0[81] = v59;
  uint64_t v30 = type metadata accessor for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider(0LL);
  uint64_t v31 = SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.__allocating_init()();
  v0[82] = v31;
  uint64_t v58 = type metadata accessor for DefaultFeatureServiceFactory();
  v56 = (void *)sub_5BF4(v58, 56LL);
  v0[83] = v56;
  v56[5] = v30;
  v56[6] = &protocol witness table for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider;
  v56[2] = v31;
  (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))( v22,  enum case for TrialUseCase.suggestionServiceStarting(_:),  v24);
  uint64_t v63 = type metadata accessor for TrialRuntimeConfigProvider(0LL);
  swift_allocObject(v63, *(unsigned int *)(v63 + 48), *(unsigned __int16 *)(v63 + 52));
  swift_retain(v31);
  uint64_t v32 = TrialRuntimeConfigProvider.init(trialUseCase:)(v22);
  v0[84] = v32;
  uint64_t v33 = v32;
  type metadata accessor for OwnerProviders(0LL);
  uint64_t v34 = OwnerProviders.__allocating_init(owners:)(&_swiftEmptyArrayStorage);
  v0[85] = v34;
  uint64_t v68 = v63;
  v69 = &protocol witness table for TrialRuntimeConfigProvider;
  uint64_t v54 = v33;
  v67[0] = v33;
  uint64_t v71 = v30;
  v72 = (_UNKNOWN **)&protocol witness table for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider;
  v70[0] = v31;
  swift_retain(v31);
  sub_5C0C();
  sub_5C58();
  DefaultBookkeepingXPCClient.init(featureConfigProvider:accountDetailsProvider:ownerProviders:)(v67, v70, v34);
  v0[12] = v55;
  v0[13] = &protocol witness table for DefaultBookkeepingXPCClient;
  v35 = sub_51C0(v0 + 9);
  v36 = *(void (**)(void *, uint64_t, uint64_t))(v57 + 16);
  v0[86] = v36;
  sub_5C4C((uint64_t)v35);
  static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.setAccountDetails(using:on:completion:)( v0 + 9,  v31,  nullsub_1,  0LL);
  sub_5844(v0 + 9);
  v0[17] = v55;
  sub_58A4( &qword_C390,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DefaultBookkeepingXPCClient,  (uint64_t)&protocol conformance descriptor for DefaultBookkeepingXPCClient);
  uint64_t v38 = v37;
  v0[18] = v37;
  v39 = sub_51C0(v0 + 14);
  sub_5C4C((uint64_t)v39);
  uint64_t v40 = type metadata accessor for InternalXPCSuggestionsLoggerFactory(0LL);
  sub_5B34(v40);
  uint64_t v41 = InternalXPCSuggestionsLoggerFactory.init(bookkeepingXPCClient:)(v0 + 14);
  v0[87] = v41;
  uint64_t v62 = type metadata accessor for TrialSuggestionsServiceFactory(0LL);
  type metadata accessor for SuggestionService(0LL);
  LOBYTE(v57) = static SuggestionService.isEnabled()();
  v65[3] = v29;
  sub_58A4( &qword_C398,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for AppUtilsService,  (uint64_t)&protocol conformance descriptor for AppUtilsService);
  v65[4] = v42;
  v65[0] = v61;
  v66[3] = v60;
  v66[4] = &protocol witness table for DefaultSELFLogger;
  v66[0] = v59;
  uint64_t v68 = v40;
  sub_58A4( &qword_C3A0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for InternalXPCSuggestionsLoggerFactory,  (uint64_t)&protocol conformance descriptor for InternalXPCSuggestionsLoggerFactory);
  v69 = v43;
  v67[0] = v41;
  uint64_t v71 = v58;
  v72 = &protocol witness table for DefaultFeatureServiceFactory;
  v70[0] = v56;
  sub_5864((uint64_t)(v0 + 29), (uint64_t)(v0 + 19));
  v0[27] = v55;
  v0[28] = v38;
  v44 = sub_51C0(v0 + 24);
  v36(v44, v64, v55);
  sub_5C58();
  swift_retain(v61);
  swift_retain(v59);
  swift_retain(v41);
  sub_5C0C();
  uint64_t v45 = TrialSuggestionsServiceFactory.__allocating_init(enabled:appUtils:selfLogger:suggestionsLoggerFactory:featureServiceFactory:trialRuntimeConfigProvider:clock:bookkeepingXPCClient:)( v57 & 1,  v65,  v66,  v67,  v70,  v54,  v0 + 19,  v0 + 24);
  v0[88] = v45;
  type metadata accessor for SiriInferenceBridge();
  v0[37] = v62;
  v0[38] = &protocol witness table for TrialSuggestionsServiceFactory;
  v0[34] = v45;
  v0[42] = v60;
  v0[43] = &protocol witness table for DefaultSELFLogger;
  v0[39] = v59;
  uint64_t v46 = type metadata accessor for NewUUIDRequestIdProvider(0LL);
  sub_5B34(v46);
  sub_5C58();
  uint64_t v47 = swift_retain(v45);
  uint64_t v48 = NewUUIDRequestIdProvider.init()(v47);
  v0[47] = v46;
  v0[48] = &protocol witness table for NewUUIDRequestIdProvider;
  v0[44] = v48;
  v0[52] = v63;
  v0[53] = &protocol witness table for TrialRuntimeConfigProvider;
  v0[49] = v54;
  swift_retain(v54);
  v49 = (void *)sub_5C30();
  v0[89] = v49;
  void *v49 = v0;
  v49[1] = sub_3708;
  uint64_t v50 = v0[62];
  uint64_t v74 = v34;
  v73 = v0 + 49;
  return sub_3C74( (uint64_t)(v0 + 2),  (uint64_t)(v0 + 34),  (uint64_t)(v0 + 29),  (uint64_t)(v0 + 39),  v51,  v52,  (uint64_t)(v0 + 44),  v50);
}

uint64_t sub_3708()
{
  uint64_t v3 = v1[89];
  *uint64_t v4 = *v2;
  v1[90] = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_release(v1[63]);
  }

  else
  {
    sub_5844(v1 + 49);
    sub_5844(v1 + 44);
    sub_5844(v1 + 39);
    sub_5844(v1 + 34);
  }

  sub_5BAC();
  return sub_5AF4();
}

uint64_t sub_3790()
{
  uint64_t v34 = *(void *)(v0 + 704);
  uint64_t v28 = *(void *)(v0 + 672);
  uint64_t v32 = *(void *)(v0 + 664);
  uint64_t v33 = *(void *)(v0 + 696);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 688);
  uint64_t v27 = *(void *)(v0 + 656);
  uint64_t v30 = *(void *)(v0 + 680);
  uint64_t v31 = *(void *)(v0 + 648);
  uint64_t v29 = *(void *)(v0 + 640);
  uint64_t v35 = *(void *)(v0 + 632);
  uint64_t v37 = *(void *)(v0 + 624);
  uint64_t v38 = *(void *)(v0 + 616);
  uint64_t v39 = *(void *)(v0 + 608);
  uint64_t v40 = *(void *)(v0 + 584);
  uint64_t v41 = *(void *)(v0 + 576);
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v24 = *(void *)(v0 + 552);
  uint64_t v25 = *(void *)(v0 + 536);
  uint64_t v2 = *(void *)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 504);
  uint64_t v5 = *(void *)(v0 + 512);
  v36 = *(void **)(v0 + 496);
  uint64_t v6 = v4 + 32;
  uint64_t v7 = *(void **)(v0 + 16);
  uint64_t v8 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v7;
  id v9 = v7;

  sub_5864(v0 + 24, v0 + 432);
  swift_beginAccess(v6, v0 + 472, 33LL, 0LL);
  sub_5200(v0 + 432, v6);
  uint64_t v10 = swift_endAccess(v0 + 472);
  static TaskPriority.background.getter(v10);
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  sub_5248(v5, 0LL, 1LL, v11);
  v26(v1, v24, v3);
  uint64_t v12 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = swift_allocObject(&unk_8698, v13 + v25, v12 | 7);
  *(void *)(v14 + 16) = 0LL;
  *(void *)(v14 + 24) = 0LL;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v14 + v13, v1, v3);
  uint64_t v15 = sub_434C(v5, (uint64_t)&unk_C3C0, v14);
  swift_release(v27);
  swift_release(v28);
  swift_release(v30);
  swift_release(v29);
  swift_release(v31);
  swift_release(v33);
  swift_release(v32);
  swift_release(v34);
  swift_release(v15);
  sub_5390(v5, &qword_C378);
  sub_5344(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v24, v3);
  uint64_t v16 = sub_5844((void *)(v0 + 232));
  uint64_t v17 = static SiriSuggestionsSignpost.bridgeStartup.getter(v16);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = (void *)static Logger.log.getter();
  static Logger.end(_:_:log:telemetry:)(v35, v17, v19, v21, v22, 1LL);

  sub_5844(v36);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v38);
  sub_5C38();
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v24);
  swift_task_dealloc(v1);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 504));
}

uint64_t sub_3A64()
{
  uint64_t v1 = *(void *)(v0 + 696);
  uint64_t v2 = *(void *)(v0 + 680);
  uint64_t v3 = *(void *)(v0 + 664);
  uint64_t v18 = *(void *)(v0 + 672);
  uint64_t v19 = *(void *)(v0 + 656);
  uint64_t v4 = *(void *)(v0 + 648);
  uint64_t v5 = *(void *)(v0 + 640);
  uint64_t v6 = *(void *)(v0 + 632);
  uint64_t v21 = *(void *)(v0 + 624);
  uint64_t v22 = *(void *)(v0 + 616);
  uint64_t v23 = *(void *)(v0 + 608);
  uint64_t v24 = *(void *)(v0 + 584);
  uint64_t v25 = *(void *)(v0 + 576);
  uint64_t v7 = *(void *)(v0 + 552);
  uint64_t v8 = *(void *)(v0 + 528);
  uint64_t v9 = *(void *)(v0 + 520);
  uint64_t v26 = *(void *)(v0 + 544);
  uint64_t v27 = *(void *)(v0 + 512);
  uint64_t v20 = *(void **)(v0 + 496);
  swift_release(*(void *)(v0 + 704));
  swift_release(v3);
  swift_release(v1);
  swift_release(v4);
  swift_release(v5);
  swift_release(v2);
  swift_release(v18);
  swift_release(v19);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  sub_5844((void *)(v0 + 232));
  sub_5844((void *)(v0 + 392));
  sub_5844((void *)(v0 + 352));
  sub_5844((void *)(v0 + 312));
  uint64_t v10 = sub_5844((void *)(v0 + 272));
  uint64_t v11 = static SiriSuggestionsSignpost.bridgeStartup.getter(v10);
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = (void *)static Logger.log.getter();
  static Logger.end(_:_:log:telemetry:)(v6, v11, v13, v15, v16, 1LL);

  sub_5844(v20);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v6, v22);
  swift_task_dealloc(v6);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v7);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_3C34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_3C74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[52] = v13;
  v8[53] = v14;
  v8[50] = a7;
  v8[51] = a8;
  v8[48] = a3;
  v8[49] = a4;
  v8[46] = a1;
  v8[47] = a2;
  sub_5BAC();
  return swift_task_switch(v9, v10, v11);
}

uint64_t sub_3CA4()
{
  uint64_t v1 = v0[53];
  uint64_t v2 = type metadata accessor for DefaultGlobalLifeCycleContainer(0LL);
  v0[54] = DefaultGlobalLifeCycleContainer.__allocating_init()();
  v0[45] = type metadata accessor for OwnerProviders(0LL);
  v0[42] = v1;
  uint64_t v3 = async function pointer to GlobalLifeCycleContainer.addToLifeCycle(entity:)[1];
  swift_retain(v1);
  uint64_t v4 = (void *)swift_task_alloc(v3);
  v0[55] = v4;
  sub_58A4( &qword_C5A0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DefaultGlobalLifeCycleContainer,  (uint64_t)&protocol conformance descriptor for DefaultGlobalLifeCycleContainer);
  v0[56] = v5;
  *uint64_t v4 = v0;
  v4[1] = sub_3D74;
  return GlobalLifeCycleContainer.addToLifeCycle(entity:)(v0 + 42, v2, v5);
}

uint64_t sub_3D74()
{
  uint64_t v3 = v0[54];
  uint64_t v2 = v0[55];
  uint64_t v4 = *v1;
  *uint64_t v5 = *v1;
  swift_task_dealloc(v2);
  sub_5844(v0 + 42);
  type metadata accessor for SuggestionServiceAPIProviders(0LL);
  uint64_t v6 = async function pointer to static SuggestionServiceAPIProviders.create(serviceFactory:lifecycleContainer:clock:)[1];
  swift_retain(v3);
  uint64_t v7 = (void *)swift_task_alloc(v6);
  v0[57] = v7;
  void *v7 = v4;
  v7[1] = sub_3E0C;
  return static SuggestionServiceAPIProviders.create(serviceFactory:lifecycleContainer:clock:)( v0[47],  v0[54],  v0[56],  v0[48]);
}

uint64_t sub_3E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 456);
  uint64_t v5 = *(void *)(*v2 + 432);
  *(void *)(v3 + 464) = a1;
  *(void *)(v3 + 472) = a2;
  swift_task_dealloc(v4);
  swift_release(v5);
  sub_5BAC();
  return sub_5B04();
}

uint64_t sub_3E68()
{
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v27 = *(void *)(v0 + 432);
  uint64_t v23 = *(void *)(v0 + 416);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v24 = *(void *)(v0 + 408);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v22 = *(void *)(v0 + 392);
  uint64_t v28 = *(uint64_t **)(v0 + 368);
  uint64_t ObjectType = swift_getObjectType(v1);
  uint64_t v6 = *(void **)(v2 + 16);
  uint64_t v25 = v6;
  uint64_t v26 = ObjectType;
  uint64_t v7 = type metadata accessor for EventDrivenSuggestionsClient(0LL);
  sub_5864(v4, v0 + 56);
  uint64_t v30 = ObjectType;
  uint64_t v31 = v6;
  *(void *)&__int128 v29 = v1;
  sub_5864(v3, v0 + 96);
  swift_unknownObjectRetain_n(v1, 2LL);
  uint64_t v8 = v7;
  uint64_t v9 = EventDrivenSuggestionsClient.__allocating_init(clock:suggestionService:interactionBuilder:requestIdProvider:)( v0 + 56,  &v29,  sub_57F0,  0LL,  v0 + 96);
  type metadata accessor for InServiceSuggestionsDispatcher(0LL);
  *(void *)(v0 + 40) = v7;
  sub_58A4( &qword_C5A8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for EventDrivenSuggestionsClient,  (uint64_t)&protocol conformance descriptor for EventDrivenSuggestionsClient);
  *(void *)(v0 + 48) = v10;
  *(void *)(v0 + 16) = v9;
  sub_5C0C();
  static InServiceSuggestionsDispatcher.create(eventDispatcher:clock:selfLogger:)(v0 + 16, v4, v22);
  sub_5844((void *)(v0 + 16));
  type metadata accessor for DispatchedServiceAPIProvider(0LL);
  sub_5864(v0 + 136, v0 + 216);
  uint64_t v11 = swift_unknownObjectRetain(v1);
  uint64_t v12 = DispatchedServiceAPIProvider.__allocating_init(provider:dispatcher:)(v11, v2, v0 + 216);
  uint64_t v13 = type metadata accessor for IFSalientEntitiesService(0LL);
  uint64_t v14 = static IFSalientEntitiesService.instance.getter();
  type metadata accessor for StatefulSuggestionsClient(0LL);
  sub_58A4( &qword_C5B0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchedServiceAPIProvider,  (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
  uint64_t v16 = v15;
  uint64_t v30 = v13;
  uint64_t v31 = &protocol witness table for IFSalientEntitiesService;
  *(void *)&__int128 v29 = v14;
  sub_5864(v23, v0 + 256);
  sub_5864(v24, v0 + 296);
  swift_retain(v12);
  swift_retain(v14);
  uint64_t v17 = StatefulSuggestionsClient.__allocating_init(suggestionService:salientEntityService:runtimeConfigProvider:featureFlagProvider:)( v12,  v16,  &v29,  v0 + 256,  v0 + 296);
  uint64_t v30 = v8;
  sub_58A4( &qword_C5B8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for EventDrivenSuggestionsClient,  (uint64_t)&protocol conformance descriptor for EventDrivenSuggestionsClient);
  uint64_t v31 = v18;
  *(void *)&__int128 v29 = v9;
  objc_allocWithZone((Class)type metadata accessor for SiriSuggestionsServiceDelegate(0LL));
  sub_5C0C();
  uint64_t v19 = SiriSuggestionsServiceDelegate.init(with:eventDrivenClient:)(v17, &v29);
  *(void *)(v0 + 200) = &type metadata for APISiriRemembersEntityExtractorProvider;
  *(void *)(v0 + 208) = sub_58E0();
  uint64_t v20 = sub_5BF4((uint64_t)&unk_8748, 56LL);
  *(void *)(v0 + 176) = v20;
  *(void *)(v20 + 16) = v1;
  *(_OWORD *)(v20 + 24) = v29;
  *(void *)(v20 + 40) = v26;
  *(void *)(v20 + 48) = v25;
  swift_release(v14);
  swift_release(v12);
  swift_unknownObjectRelease(v1);
  swift_release(v27);
  sub_5844((void *)(v0 + 136));
  *uint64_t v28 = v19;
  sub_5940((__int128 *)(v0 + 176), (uint64_t)(v28 + 1));
  v28[6] = v9;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_418C()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[3] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[4] = v2;
  v0[5] = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to DefaultBookkeepingXPCClient.buildAutoCompleteIndex(onStartUpEvent:)[1]);
  v0[6] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_4204;
  return DefaultBookkeepingXPCClient.buildAutoCompleteIndex(onStartUpEvent:)(1LL);
}

uint64_t sub_4204(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v2 + 48);
  uint64_t v4 = *v2;
  *(void *)(v4 + 56) = a1;
  swift_task_dealloc(v3);
  if (v1)
  {
    swift_task_dealloc(*(void *)(v4 + 40));
    return (*(uint64_t (**)(void))(v4 + 8))();
  }

  else
  {
    sub_5BAC();
    return sub_5B94(v6, v7, v8);
  }
}

uint64_t sub_4274()
{
  uint64_t v2 = sub_5C24();
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (sub_5B40(v4))
  {
    uint64_t v5 = *(void *)(v1 + 56);
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v6 = 134217984;
    *(void *)(v1 + 16) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v6 + 4);
    _os_log_impl( &dword_0,  v3,  v0,  "BuildAutoCompleteIndex on Suggestion startup. Added %ld phrases into the DB",  v6,  0xCu);
    sub_5B10((uint64_t)v6);
  }

  (*(void (**)(void, void))(*(void *)(v1 + 32) + 8LL))(*(void *)(v1 + 40), *(void *)(v1 + 24));
  sub_5C38();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_434C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_57A4(a1, (uint64_t)v7, &qword_C378);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  if (sub_57E4((uint64_t)v7, 1LL, v8) == 1)
  {
    sub_5390((uint64_t)v7, &qword_C378);
    uint64_t v9 = 4096LL;
  }

  else
  {
    unsigned __int8 v10 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
    uint64_t v9 = v10 | 0x1000LL;
  }

  uint64_t v11 = *(void *)(a3 + 16);
  if (v11)
  {
    uint64_t v12 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v11);
    uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
    uint64_t v16 = v15;
    swift_unknownObjectRelease(v11);
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v16 = 0LL;
  }

  if (v16 | v14)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v14;
    v19[3] = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v9, v17, (char *)&type metadata for () + 8, a2, a3);
}

void sub_44C0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for InAppIdentifier(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_5864(a1, (uint64_t)v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  uint64_t v12 = type metadata accessor for SiriSuggestions.SiriRuntimeDeviceState(0LL);
  v17[3] = v12;
  sub_58A4( &qword_C598,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriSuggestions.SiriRuntimeDeviceState,  (uint64_t)&protocol conformance descriptor for SiriSuggestions.SiriRuntimeDeviceState);
  v17[4] = v13;
  uint64_t v14 = sub_51C0(v17);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL))(v14, a3, v12);
  uint64_t v15 = type metadata accessor for EventDrivenInteractionBuilder(0LL);
  sub_5B34(v15);
  uint64_t v16 = EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(v18, v11, v17);
  a4[3] = v15;
  a4[4] = (uint64_t)&protocol witness table for EventDrivenInteractionBuilder;
  *a4 = v16;
  sub_5BB8();
}

void static SiriInferenceBridge.getInstance()(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_5BDC();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v5 = sub_5B50();
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)sub_5B28();
    *(_WORD *)uint64_t v8 = 0;
    sub_5BCC( &dword_0,  v6,  v7,  "synchronous instance of SiriInferenceSuggestionsBridge no longer supported. Please call getInstanceAsync instead",  v8);
    sub_5B10((uint64_t)v8);
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  uint64_t v9 = type metadata accessor for NoopSuggestionsBridge();
  uint64_t inited = swift_initStaticObject(v9, &unk_C348);
  a1[3] = v9;
  sub_58A4( &qword_C3C8,  v11,  (uint64_t (*)(uint64_t))type metadata accessor for NoopSuggestionsBridge,  (uint64_t)&unk_6E60);
  a1[4] = v12;
  *a1 = inited;
  sub_5BB8();
}

void sub_46D0(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NoopSuggestionsBridge();
  uint64_t inited = swift_initStaticObject(v2, &unk_C348);
  a1[3] = v2;
  sub_58A4( &qword_C3C8,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for NoopSuggestionsBridge,  (uint64_t)&unk_6E60);
  a1[4] = v5;
  *a1 = inited;
}

uint64_t static SiriInferenceBridge.getInstanceAsync()(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_5BDC();
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = sub_5AE4(v3);
  sub_5BAC();
  return sub_5B04();
}

uint64_t sub_477C()
{
  uint64_t v3 = sub_5C24();
  Logger.logObject.getter(v3);
  os_log_type_t v4 = sub_5C60();
  if (sub_5B40(v4))
  {
    uint64_t v5 = (uint8_t *)sub_5B28();
    *(_WORD *)uint64_t v5 = 0;
    sub_5BCC(&dword_0, v1, v0, "Obtaining Async instance of SiriInferenceSuggestionsBridge", v5);
    sub_5B10((uint64_t)v5);
  }

  uint64_t v7 = v2[4];
  uint64_t v6 = v2[5];
  uint64_t v8 = v2[3];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v2[6] = type metadata accessor for SiriInferenceBridge();
  uint64_t v9 = (void *)swift_task_alloc(dword_C364);
  v2[7] = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_4834;
  return SiriInferenceBridge.__allocating_init()();
}

uint64_t sub_4834(uint64_t a1)
{
  uint64_t v5 = v2[7];
  uint64_t v6 = *v3;
  void *v7 = v6;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_task_dealloc(v2[5]);
    return sub_5B6C(*(uint64_t (**)(void))(v6 + 8));
  }

  else
  {
    v2[8] = a1;
    sub_5BAC();
    return sub_5AF4();
  }

uint64_t sub_4894(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 64);
  os_log_type_t v4 = *(void **)(v2 + 16);
  v4[3] = *(void *)(v2 + 48);
  sub_58A4( &qword_C3D8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for SiriInferenceBridge,  (uint64_t)&protocol conformance descriptor for SiriInferenceBridge);
  v4[4] = v5;
  *os_log_type_t v4 = v3;
  sub_5C38();
  return sub_5B6C(*(uint64_t (**)(void))(v2 + 8));
}

Swift::Void __swiftcall SiriInferenceBridge.startSiriSuggestionsService()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_5BDC();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  __chkstk_darwin();
  sub_5BFC();
  uint64_t v5 = (os_log_s *)(v4 - v3);
  type metadata accessor for SuggestionsOSVersion(0LL);
  __chkstk_darwin();
  sub_5BFC();
  uint64_t v8 = v7 - v6;
  uint64_t v27 = type metadata accessor for SuggestionsOSInfo(0LL);
  uint64_t v9 = *(void *)(v27 - 8);
  __chkstk_darwin();
  sub_5BFC();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = static UserDefaultsProviders.getSuggestionsUserDefaultsProvider()();
  uint64_t v15 = v14;
  uint64_t v16 = type metadata accessor for OSUpdateTracker(0LL);
  sub_5B34(v16);
  uint64_t v17 = OSUpdateTracker.init(userDefaultsProvider:)(v13, v15);
  id v18 = [(id)objc_opt_self(NSProcessInfo) processInfo];
  [v18 operatingSystemVersion];
  uint64_t v19 = v30[0];
  uint64_t v20 = v30[1];
  uint64_t v21 = v30[2];

  SuggestionsOSVersion.init(from:)(v19, v20, v21);
  uint64_t v22 = SuggestionsOSInfo.init(osVersion:)(v8);
  static Clocks.getSystemClock()(v22);
  OSUpdateTracker.recordOSUpdate(osInfo:clockTime:)(v12, v30);
  sub_5844(v30);
  uint64_t v23 = *(void **)(v1 + 24);
  [v23 setDelegate:*(void *)(v1 + 16)];
  uint64_t v24 = static Logger.xpcCategory.getter([v23 resume]);
  Logger.logObject.getter(v24);
  os_log_type_t v25 = sub_5C60();
  if (os_log_type_enabled(v5, v25))
  {
    uint64_t v26 = (uint8_t *)sub_5B28();
    *(_WORD *)uint64_t v26 = 0;
    sub_5BCC(&dword_0, v5, v25, "suggestions xpc service started and is listening for connections", v26);
    sub_5B10((uint64_t)v26);
  }

  swift_release(v17);
  (*(void (**)(os_log_s *, uint64_t))(v28 + 8))(v5, v29);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v27);
}

uint64_t SiriInferenceBridge.getSuggestionEntity(interaction:)(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return sub_5B1C((uint64_t)sub_4B2C);
}

uint64_t sub_4B2C()
{
  uint64_t v1 = *(void *)(v0 + 128) + 32LL;
  swift_beginAccess(v1, v0 + 96, 0LL, 0LL);
  sub_57A4(v1, v0 + 16, &qword_C3B0);
  uint64_t v2 = *(void *)(v0 + 40);
  *(void *)(v0 + 136) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 48);
    sub_53C8((void *)(v0 + 16), v2);
    uint64_t v4 = *(void *)(v2 - 8);
    *(void *)(v0 + 144) = v4;
    *(void *)(v0 + 152) = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(void))(v4 + 16))();
    sub_5390(v0 + 16, &qword_C3B0);
    uint64_t v5 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SiriRemembersEntityExtractorProvider.siriRemembersEntityExtractor.getter[1]);
    *(void *)(v0 + 160) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_4C6C;
    return dispatch thunk of SiriRemembersEntityExtractorProvider.siriRemembersEntityExtractor.getter(v0 + 56, v2, v3);
  }

  else
  {
    sub_5390(v0 + 16, &qword_C3B0);
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

uint64_t sub_4C6C()
{
  uint64_t v1 = *(void *)(v0 + 144);
  sub_5AD4(*(void *)(v0 + 160));
  sub_5C40(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_5BAC();
  return sub_5AF4();
}

uint64_t sub_4CB0()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  sub_53C8((void *)(v0 + 56), v3);
  uint64_t v5 = dispatch thunk of SiriRemembersEntityExtractor.extractActionEntity(from:)(v2, v3, v4);
  sub_5844((void *)(v0 + 56));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

uint64_t SiriInferenceBridge.deinit()
{
  sub_5390(v0 + 32, &qword_C3B0);
  return v0;
}

uint64_t SiriInferenceBridge.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

void sub_4D88()
{
}

void sub_4DA8(uint64_t *a1@<X8>)
{
}

uint64_t sub_4DBC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_C3D4);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_5AAC;
  return static SiriInferenceBridge.getInstanceAsync()(a1);
}

uint64_t sub_4E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to SiriInferenceSuggestionsBridge.onEvent<A>(event:)[1]);
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_5AAC;
  return SiriInferenceSuggestionsBridge.onEvent<A>(event:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_4EA0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_5B1C((uint64_t)sub_4EB0);
}

uint64_t sub_4EB0()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_53C8(v1, v2);
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SiriRemembersEntityExtractorProvider.siriRemembersEntityExtractor.getter[1]);
  v0[4] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_4F28;
  return dispatch thunk of SiriRemembersEntityExtractorProvider.siriRemembersEntityExtractor.getter(v0[2], v2, v4);
}

uint64_t sub_4F28()
{
  return sub_5B7C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_4F54(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_C5D4);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_5AAC;
  return sub_4EA0(a1);
}

uint64_t sub_4FA4()
{
  uint64_t v0 = *(void *)(sub_5BDC() - 8);
  __chkstk_darwin();
  uint64_t v1 = sub_5B50();
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_5B28();
    *(_WORD *)uint64_t v4 = 0;
    sub_5BCC(&dword_0, v2, v3, "startSiriSuggestionsService: No suggestion bridge loaded", v4);
    sub_5B10((uint64_t)v4);
  }

  return sub_5C40(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
}

uint64_t sub_5054()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_5064()
{
  return sub_4FA4();
}

void sub_5078(uint64_t *a1@<X8>)
{
}

uint64_t sub_508C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to static SiriInferenceSuggestionsBridge.getInstanceAsync()[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_50F8;
  return static SiriInferenceSuggestionsBridge.getInstanceAsync()(a1, a2, a3);
}

uint64_t sub_50F8()
{
  return sub_5B7C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_511C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to SiriInferenceSuggestionsBridge.onEvent<A>(event:)[1]);
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_50F8;
  return SiriInferenceSuggestionsBridge.onEvent<A>(event:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_51B0(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

void *sub_51C0(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_5200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3C34(&qword_C3B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_5254()
{
  uint64_t v1 = sub_5C68();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_52C4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_C3BC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_50F8;
  return sub_418C();
}

uint64_t sub_5344(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for NoopSuggestionsBridge()
{
  return objc_opt_self(&OBJC_CLASS____TtC30SiriSuggestionsInferenceBridge21NoopSuggestionsBridge);
}

void sub_5390(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3C34(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_5BD4();
}

void *sub_53C8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriInferenceBridge.SuggestionsStartupComponents( uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 48));
}

uint64_t initializeWithCopy for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = a2 + 8;
  __int128 v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  id v10 = v4;
  v9(v5, v6, v8);
  uint64_t v11 = *(void *)(a2 + 48);
  *(void *)(a1 + 48) = v11;
  swift_retain(v11);
  return a1;
}

uint64_t assignWithCopy for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  sub_5528((void *)(a1 + 8), (void *)(a2 + 8));
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v7;
  swift_retain(v7);
  swift_release(v8);
  return a1;
}

void *sub_5528(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        uint64_t result = (void *)swift_release(v11);
        *uint64_t v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *uint64_t v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

__n128 initializeWithTake for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  sub_5844((void *)(a1 + 8));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriInferenceBridge.SuggestionsStartupComponents( uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SiriInferenceBridge.SuggestionsStartupComponents()
{
  return &type metadata for SiriInferenceBridge.SuggestionsStartupComponents;
}

void sub_57A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3C34(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_5BD4();
}

uint64_t sub_57E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_57F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static EventDrivenSuggestionsClient.getInteractionBuilder@Sendable (event:inAppIdentifier:deviceState:)( a1,  a2,  a3);
}

uint64_t sub_5844(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_5864(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  sub_5BD4();
}

void sub_58A4(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  if (!*a1)
  {
    uint64_t v6 = a3(a2);
    atomic_store(swift_getWitnessTable(a4, v6), a1);
  }

  sub_5BD4();
}

unint64_t sub_58E0()
{
  unint64_t result = qword_C5C0;
  if (!qword_C5C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_6EC8, &type metadata for APISiriRemembersEntityExtractorProvider);
    atomic_store(result, (unint64_t *)&qword_C5C0);
  }

  return result;
}

uint64_t sub_591C()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_5940(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t destroy for APISiriRemembersEntityExtractorProvider(void *a1)
{
  return sub_5844(a1);
}

uint64_t initializeWithCopy for APISiriRemembersEntityExtractorProvider(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

void *assignWithCopy for APISiriRemembersEntityExtractorProvider(void *a1, void *a2)
{
  return a1;
}

__n128 initializeWithTake for APISiriRemembersEntityExtractorProvider(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for APISiriRemembersEntityExtractorProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for APISiriRemembersEntityExtractorProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for APISiriRemembersEntityExtractorProvider( uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for APISiriRemembersEntityExtractorProvider()
{
  return &type metadata for APISiriRemembersEntityExtractorProvider;
}

uint64_t sub_5AB4()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_5AD4(uint64_t a1)
{
  *(void *)(v2 - 8) = *v1;
  return swift_task_dealloc(a1);
}

uint64_t sub_5AE4@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_5AF4()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_5B04()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_5B10(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_5B1C(uint64_t a1)
{
  return swift_task_switch(a1, 0LL, 0LL);
}

uint64_t sub_5B28()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_5B34(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

BOOL sub_5B40(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_5B50()
{
  return static Logger.initCategory.getter();
}

uint64_t sub_5B6C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_5B7C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_5B88(uint64_t a1)
{
  return SiriInferenceBridge.init(featureFlagProvider:)(a1);
}

uint64_t sub_5B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_5BA0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

  ;
}

  ;
}

void sub_5BCC(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t sub_5BDC()
{
  return type metadata accessor for Logger(0LL);
}

void sub_5BE4()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_5BF4(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

  ;
}

uint64_t sub_5C0C()
{
  return swift_retain(v0);
}

void sub_5C14()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_5C24()
{
  return static Logger.initCategory.getter();
}

uint64_t sub_5C30()
{
  return swift_task_alloc(v0);
}

uint64_t sub_5C38()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5C40@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_5C4C(uint64_t a1)
{
  return v3(a1, v2, v1);
}

uint64_t sub_5C58()
{
  return swift_retain(v0);
}

uint64_t sub_5C60()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_5C68()
{
  return type metadata accessor for DefaultBookkeepingXPCClient(0LL);
}

uint64_t DefaultSuggestionsLoggerFactory.__allocating_init(featureFlagProvider:siriRemembersLogger:)( __int128 *a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject(v2, 64LL, 7LL);
  sub_5940(a1, v5 + 16);
  *(void *)(v5 + 56) = a2;
  return v5;
}

uint64_t DefaultSuggestionsLoggerFactory.init(featureFlagProvider:siriRemembersLogger:)( __int128 *a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a2;
  return v2;
}

uint64_t DefaultSuggestionsLoggerFactory.create(featureService:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __chkstk_darwin(v8);
  uint64_t v12 = &v29[-v11 - 8];
  uint64_t v13 = v2[5];
  uint64_t v14 = v2[6];
  sub_53C8(v2 + 2, v13);
  if ((dispatch thunk of FeatureFlagProvider.isFeatureExtractionEnabled()(v13, v14) & 1) != 0)
  {
    uint64_t v15 = static Logger.initCategory.getter();
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)sub_5B28();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_0, v16, v17, "Enabled feature extraction logger", v18, 2u);
      sub_5B10((uint64_t)v18);
    }

    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
    sub_5F94(a1, (uint64_t)v29);
    uint64_t v19 = v3[7];
    uint64_t v20 = type metadata accessor for SiriSuggestionsIntelligence.FeatureLogger(0LL);
    swift_allocObject(v20, 96LL, 7LL);
    uint64_t v21 = SiriSuggestionsIntelligence.FeatureLogger.init(featureService:siriRemembersLogger:loggingPolicy:)( v29,  v19,  0LL,  1LL,  0LL,  0LL);
    a2[3] = v20;
    uint64_t v22 = (void *)sub_5FD8();
  }

  else
  {
    uint64_t v23 = static Logger.initCategory.getter();
    uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)sub_5B28();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_0, v24, v25, "Feature Extraction disabled. Only using raw remembers logger", v26, 2u);
      sub_5B10((uint64_t)v26);
    }

    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t v21 = v3[7];
    a2[3] = type metadata accessor for SiriRemembersLogger(0LL);
    uint64_t v22 = &protocol witness table for SiriRemembersLogger;
    uint64_t v19 = v21;
  }

  a2[4] = (uint64_t)v22;
  *a2 = v21;
  return swift_retain(v19);
}

uint64_t DefaultSuggestionsLoggerFactory.deinit()
{
  return v0;
}

uint64_t DefaultSuggestionsLoggerFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t sub_5F74@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return DefaultSuggestionsLoggerFactory.create(featureService:)(a1, a2);
}

uint64_t sub_5F94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_5FD8()
{
  unint64_t result = qword_C5D8;
  if (!qword_C5D8)
  {
    uint64_t v1 = type metadata accessor for SiriSuggestionsIntelligence.FeatureLogger(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SiriSuggestionsIntelligence.FeatureLogger, v1);
    atomic_store(result, (unint64_t *)&qword_C5D8);
  }

  return result;
}

uint64_t type metadata accessor for DefaultSuggestionsLoggerFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC30SiriSuggestionsInferenceBridge31DefaultSuggestionsLoggerFactory);
}

uint64_t DefaultFeatureServiceFactory.__allocating_init(accountDetailsProvider:)(void *a1)
{
  return sub_6050(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_6518);
}

uint64_t DefaultFeatureServiceFactory.init(accountDetailsProvider:)(void *a1)
{
  return sub_6050(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_65F8);
}

uint64_t sub_6050(void *a1, uint64_t (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = sub_65D0((uint64_t)a1, v5);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v10 + 16))(v9);
  uint64_t v11 = a2(v9, v2, v5, v6);
  sub_5844(a1);
  return v11;
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
  return swift_task_switch(sub_616C, 0LL, 0LL);
}

uint64_t sub_616C()
{
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_53C8(v1, v2);
  if ((dispatch thunk of FeatureFlagProvider.isFeatureExtractionEnabled()(v2, v3) & 1) != 0)
  {
    uint64_t v4 = static Logger.initCategory.getter();
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)sub_5B28();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_0, v5, v6, "Enabled feature service", v7, 2u);
      sub_5B10((uint64_t)v7);
    }

    uint64_t v8 = *(void *)(v0 + 208);
    uint64_t v9 = *(void *)(v0 + 184);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    sub_6648(v11, v0 + 56);
    if (*(void *)(v0 + 80))
    {
      uint64_t v12 = sub_5940((__int128 *)(v0 + 56), v0 + 16);
    }

    else
    {
      sub_5F94(*(void *)(v0 + 176) + 16LL, v0 + 16);
      uint64_t v12 = sub_6690(v0 + 56);
    }

    static Clocks.getSystemClock()(v12);
    uint64_t v23 = (void *)swift_task_alloc(async function pointer to static SiriSuggestionsIntelligence.createFeatureService(clock:configProvider:accountDetailsProvider:possibleOwners:)[1]);
    *(void *)(v0 + 216) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_6398;
    return static SiriSuggestionsIntelligence.createFeatureService(clock:configProvider:accountDetailsProvider:possibleOwners:)( *(void *)(v0 + 136),  v0 + 96,  *(void *)(v0 + 152),  v0 + 16,  *(void *)(v0 + 168));
  }

  else
  {
    uint64_t v13 = static Logger.initCategory.getter();
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)sub_5B28();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Feature Service disabled.", v16, 2u);
      sub_5B10((uint64_t)v16);
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

uint64_t sub_6398()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v4 = *(void **)v0;
  swift_task_dealloc(*(void *)(*(void *)v0 + 216LL));
  sub_5844(v1 + 12);
  sub_5844(v1 + 2);
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

uint64_t sub_644C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc(dword_C68C);
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_64D0;
  return DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)( a1,  a2,  a3,  a4,  a5);
}

uint64_t sub_64D0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void *sub_6518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (void *)swift_allocObject(v10, 56LL, 7LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  uint64_t v12 = sub_65F8((uint64_t)v9, v11, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v12;
}

uint64_t sub_65D0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

void *sub_65F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  a2[5] = a3;
  a2[6] = a4;
  uint64_t v7 = sub_51C0(a2 + 2);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))(v7, a1, a3);
  return a2;
}

uint64_t sub_6648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3C34(&qword_C690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_6690(uint64_t a1)
{
  uint64_t v2 = sub_3C34(&qword_C690);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DefaultFeatureServiceFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC30SiriSuggestionsInferenceBridge28DefaultFeatureServiceFactory);
}
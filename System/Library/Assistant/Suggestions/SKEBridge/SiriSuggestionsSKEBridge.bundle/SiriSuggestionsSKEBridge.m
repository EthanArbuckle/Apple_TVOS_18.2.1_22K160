uint64_t sub_19C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_s *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  void v15[5];
  sub_2EA8(&qword_81F8);
  sub_3324();
  __chkstk_darwin();
  sub_330C();
  v1 = *(void *)(type metadata accessor for Logger(0LL) - 8);
  v2 = __chkstk_darwin();
  v3 = static Logger.siriSuggestionsSupportCategory.getter(v2);
  v4 = (os_log_s *)Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)sub_31F8();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "getting bridge facade from SiriKit runtime.", v6, 2u);
    sub_3350((uint64_t)v6);
  }

  sub_3390(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  type metadata accessor for SiriSuggestionsFacade(0LL);
  type metadata accessor for TaskInitiatedParty(0LL);
  v7 = sub_3368();
  v8(v7);
  v9 = type metadata accessor for AssistantTurnState(0LL);
  v10 = sub_3368();
  v11(v10);
  sub_2EE8(v0, 0LL, 1LL, v9);
  v12 = type metadata accessor for SiriRuntimeSuggestionsAPIClientProvider(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = SiriRuntimeSuggestionsAPIClientProvider.init(assistantTurnState:)(v0);
  v15[3] = v12;
  v15[4] = &protocol witness table for SiriRuntimeSuggestionsAPIClientProvider;
  v15[0] = v13;
  return SiriSuggestionsFacade.__allocating_init(clientProvider:)(v15);
}

uint64_t sub_1B70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_32E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_324C();
  v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)sub_31F8();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Returning the suggestions SiriKitExecutor bridge", v11, 2u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t inited = swift_initStaticObject(v2, &unk_80C0);
  sub_1C98();
  a1[3] = v2;
  uint64_t result = sub_3138( &qword_81F0,  v13,  (uint64_t (*)(uint64_t))type metadata accessor for SiriKitExecutorBridge,  (uint64_t)&unk_3728);
  a1[4] = result;
  *a1 = inited;
  return result;
}

uint64_t sub_1C98()
{
  uint64_t v1 = (char *)v16 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  sub_2EE8((uint64_t)v1, 1LL, 1LL, v2);
  uint64_t v3 = sub_335C((uint64_t)&unk_4370);
  *(void *)(v3 + 16) = 0LL;
  *(void *)(v3 + 24) = 0LL;
  if (sub_2F3C((uint64_t)v1, 1LL, v2) == 1)
  {
    sub_3070((uint64_t)v1, &qword_81D8);
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    uint64_t v6 = 7168LL;
  }

  else
  {
    unsigned __int8 v7 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
    uint64_t v6 = v7 | 0x1C00LL;
    uint64_t v8 = *(void *)(v3 + 16);
    if (v8)
    {
      uint64_t v9 = *(void *)(v3 + 24);
      uint64_t ObjectType = swift_getObjectType(v8);
      swift_unknownObjectRetain(v8);
      uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v9);
      uint64_t v5 = v11;
      swift_unknownObjectRelease(v8);
    }

    else
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
    }
  }

  uint64_t v12 = sub_335C((uint64_t)&unk_4398);
  *(void *)(v12 + 16) = &unk_8200;
  *(void *)(v12 + 24) = v3;
  if (v5 | v4)
  {
    v16[0] = 0LL;
    v16[1] = 0LL;
    uint64_t v13 = v16;
    v16[2] = v4;
    v16[3] = v5;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  uint64_t v14 = swift_task_create(v6, v13, (char *)&type metadata for () + 8, &unk_8208, v12);
  return swift_release(v14);
}

uint64_t sub_1E38()
{
  uint64_t v2 = sub_32E0();
  v1[2] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[3] = v3;
  v1[4] = sub_32A4(v3);
  v1[5] = swift_task_alloc(v0);
  sub_3260();
  return sub_3204();
}

uint64_t sub_1E84()
{
  if ((static StaticSuggestionDialogCache.shouldWarmup()() & 1) != 0)
  {
    uint64_t v1 = (void *)swift_task_alloc(async function pointer to static StaticSuggestionDialogCache.prewarm()[1]);
    *(void *)(v0 + 48) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_1FA0;
    return static StaticSuggestionDialogCache.prewarm()();
  }

  else
  {
    uint64_t v3 = *(void **)(v0 + 40);
    uint64_t v4 = sub_324C();
    Logger.logObject.getter(v4);
    os_log_type_t v5 = sub_32F4();
    if (sub_31BC(v5))
    {
      uint64_t v6 = (_WORD *)sub_31F8();
      sub_32E8(v6);
      sub_319C( &dword_0,  v7,  v8,  "StaticSuggestionDialogCache.shouldWarmup() returned false. Not warming up StaticDialogCache");
      sub_31DC();
    }

    uint64_t v9 = *(void *)(v0 + 24);

    sub_31EC(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    type metadata accessor for CoreSpeechPolicyProvider(0LL);
    if ((static CoreSpeechPolicyProvider.shouldWarmup()() & 1) != 0)
    {
      static CoreSpeechPolicyProvider.warmup()();
    }

    else
    {
      uint64_t v10 = sub_324C();
      Logger.logObject.getter(v10);
      os_log_type_t v11 = sub_32F4();
      if (sub_31BC(v11))
      {
        uint64_t v12 = (_WORD *)sub_31F8();
        sub_32E8(v12);
        sub_319C( &dword_0,  v13,  v14,  "CoreSpeechPolicyProvider.shouldWarmup() returned false. Not warming up CoreSpeechPolicyProvider");
        sub_31DC();
      }

      sub_3284();
      sub_31EC(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    }

    swift_task_dealloc(*(void *)(v0 + 40));
    sub_32B8();
    return sub_3228(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1FA0()
{
  return sub_3204();
}

uint64_t sub_1FE8()
{
  if ((static CoreSpeechPolicyProvider.shouldWarmup()() & 1) != 0)
  {
    static CoreSpeechPolicyProvider.warmup()();
  }

  else
  {
    uint64_t v2 = sub_324C();
    Logger.logObject.getter(v2);
    os_log_type_t v3 = sub_32F4();
    if (sub_31BC(v3))
    {
      uint64_t v4 = (_WORD *)sub_31F8();
      sub_32E8(v4);
      sub_319C( &dword_0,  v5,  v6,  "CoreSpeechPolicyProvider.shouldWarmup() returned false. Not warming up CoreSpeechPolicyProvider");
      sub_31DC();
    }

    sub_3284();
    sub_31EC(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }

  swift_task_dealloc(*(void *)(v0 + 40));
  sub_32B8();
  return sub_3228(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2078( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  *(void *)(v12 + 104) = a11;
  *(void *)(v12 + 112) = v11;
  *(void *)(v12 + 96) = a10;
  *(_OWORD *)(v12 + 80) = a9;
  *(void *)(v12 + 64) = a7;
  *(void *)(v12 + 72) = a8;
  *(void *)(v12 + 48) = a5;
  *(void *)(v12 + 56) = a6;
  *(void *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = type metadata accessor for SuggestionContextData(0LL);
  *(void *)(v12 + 120) = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  *(void *)(v12 + 128) = v14;
  *(void *)(v12 + 136) = sub_31CC(v14);
  sub_3260();
  return sub_3254();
}

uint64_t sub_20E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10)
{
  uint64_t v12 = v10[12];
  uint64_t v11 = v10[13];
  swift_bridgeObjectRetain(v11);
  SuggestionContextData.init(dialogPhase:hasAdditionalCommands:patternId:)(v12, v11, 0LL, 0LL, 0LL);
  uint64_t v13 = (uint64_t **)swift_task_alloc(dword_81B4);
  v10[18] = (uint64_t)v13;
  *uint64_t v13 = v10;
  v13[1] = (uint64_t *)sub_2184;
  return sub_2244(v10[2], v10[3], v10[4], v10[5], v10[17], v10[6], v10[7], v10[8], a9, a10);
}

uint64_t sub_2184()
{
  uint64_t v2 = *(void *)(*v1 + 144);
  uint64_t v3 = *(void *)(*v1 + 128);
  uint64_t v4 = *v1;
  *(void *)(v4 + 152) = v0;
  swift_task_dealloc(v2);
  sub_31EC(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (v0)
  {
    sub_3260();
    return swift_task_switch();
  }

  else
  {
    swift_task_dealloc(*(void *)(v4 + 136));
    return (*(uint64_t (**)(void))(v4 + 8))();
  }

uint64_t sub_2218()
{
  return sub_31B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2244( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10)
{
  *(void *)(v11 + 136) = a10;
  *(void *)(v11 + 144) = v10;
  *(_OWORD *)(v11 + 120) = a9;
  *(void *)(v11 + 104) = a7;
  *(void *)(v11 + 112) = a8;
  *(void *)(v11 + 88) = a5;
  *(void *)(v11 + 96) = a6;
  *(void *)(v11 + 72) = a3;
  *(void *)(v11 + 80) = a4;
  *(void *)(v11 + 56) = a1;
  *(void *)(v11 + 64) = a2;
  uint64_t v12 = sub_32E0();
  *(void *)(v11 + 152) = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)(v11 + 160) = v13;
  *(void *)(v11 + 168) = sub_31CC(v13);
  uint64_t v14 = type metadata accessor for HintsSuggestionsUI(0LL);
  *(void *)(v11 + 176) = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  *(void *)(v11 + 184) = v15;
  *(void *)(v11 + 192) = sub_31CC(v15);
  uint64_t v16 = sub_2EA8(&qword_81A0);
  *(void *)(v11 + 200) = sub_32A4(*(void *)(v16 - 8));
  *(void *)(v11 + 208) = swift_task_alloc(v10);
  uint64_t v17 = type metadata accessor for SuggestionExecutionContextData(0LL);
  *(void *)(v11 + 216) = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  *(void *)(v11 + 224) = v18;
  *(void *)(v11 + 232) = sub_31CC(v18);
  sub_3260();
  return sub_3254();
}

uint64_t sub_2300()
{
  *(void *)(v0 + 240) = (*(uint64_t (**)(void))(*(void *)(v0 + 144) + 16LL))();
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = SuggestionContextData.dialogPhase.getter();
  uint64_t v4 = v3;
  char v5 = SuggestionContextData.hasAdditionalCommands.getter();
  uint64_t v6 = SuggestionContextData.patternId.getter();
  SuggestionExecutionContextData.init(dialogPhase:hasAdditionalCommands:patternId:)(v2, v4, v5 & 1, v6, v7);
  if (v1)
  {
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v10 = type metadata accessor for DomainOwner(0LL);
    swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
    swift_bridgeObjectRetain(v8);
    uint64_t v11 = DomainOwner.init(_:)(v9, v8);
    *(void *)(v0 + 40) = v10;
    *(void *)(v0 + 48) = sub_3138( &qword_81C8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
    *(void *)(v0 + 16) = v11;
  }

  else
  {
    *(void *)(v0 + 48) = 0LL;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }

  uint64_t v12 = (void *)swift_task_alloc(async function pointer to SiriSuggestionsFacade.doSiriHints(requestId:applicationSessionId:sourceOwner:intentProperties:verb:executionProperties:executionContextData:suggestionCallback:)[1]);
  *(void *)(v0 + 248) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_252C;
  return SiriSuggestionsFacade.doSiriHints(requestId:applicationSessionId:sourceOwner:intentProperties:verb:executionProperties:executionContextData:suggestionCallback:)( *(void *)(v0 + 208),  *(void *)(v0 + 64),  *(void *)(v0 + 72),  *(void *)(v0 + 80),  v0 + 16,  *(void *)(v0 + 112),  *(void *)(v0 + 120),  *(void *)(v0 + 128));
}

uint64_t sub_252C()
{
  uint64_t v2 = *(void *)v1 + 16LL;
  uint64_t v3 = *(void *)(*(void *)v1 + 248LL);
  *(void *)(*(void *)v1 + 256LL) = v0;
  swift_task_dealloc(v3);
  sub_3070(v2, &qword_81C0);
  sub_3260();
  return swift_task_switch();
}

uint64_t sub_25A0()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  sub_2EF4(v0[26], v1);
  uint64_t v3 = 1LL;
  if (sub_2F3C(v1, 1LL, v2) != 1)
  {
    uint64_t v4 = v0[23];
    uint64_t v5 = (*(uint64_t (**)(void, void, void))(v4 + 32))(v0[24], v0[25], v0[22]);
    uint64_t v6 = HintsSuggestionsUI.aceView.getter(v5);
    uint64_t v7 = HintsSuggestionsUI.supportingCommands.getter();
    HintsUI.init(snippet:supportingCommands:)(v6, v7);
    sub_3384(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    uint64_t v3 = 0LL;
  }

  uint64_t v9 = v0[29];
  uint64_t v8 = v0[30];
  uint64_t v10 = v0[27];
  uint64_t v11 = v0[28];
  uint64_t v12 = v0[26];
  uint64_t v13 = v0[7];
  uint64_t v14 = type metadata accessor for HintsUI(0LL);
  sub_2EE8(v13, v3, 1LL, v14);
  swift_release(v8);
  sub_3070(v12, &qword_81A0);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  sub_3290();
  sub_32B8();
  sub_3348();
  sub_337C();
  sub_3340();
  uint64_t v15 = (uint64_t (*)(void))sub_339C();
  return sub_3210(v15);
}

uint64_t sub_26A4()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 168);
  swift_release(*(void *)(v0 + 240));
  sub_3384(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_32B8();
  sub_337C();
  sub_3340();
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return sub_3210(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2710()
{
  uint64_t v1 = sub_32E0();
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  v0[4] = sub_31CC(v2);
  sub_3260();
  return sub_3204();
}

uint64_t sub_2750()
{
  uint64_t v1 = sub_324C();
  Logger.logObject.getter(v1);
  os_log_type_t v2 = sub_32F4();
  if (sub_31BC(v2))
  {
    uint64_t v3 = (_WORD *)sub_31F8();
    sub_32E8(v3);
    sub_319C( &dword_0,  v4,  v5,  "Engagement submission from SKU is disabled. We expect all domain owners to submit engagements manually.");
    sub_31DC();
  }

  sub_3284();
  sub_31EC(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_3348();
  uint64_t v6 = (uint64_t (*)(void))sub_339C();
  return v6();
}

void sub_27C8( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v13 = type metadata accessor for SuggestionContextData(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_330C();
  swift_bridgeObjectRetain(a5);
  SuggestionContextData.init(dialogPhase:hasAdditionalCommands:patternId:)(a4, a5, 0LL, 0LL, 0LL);
  sub_2898(a1, a2, a3, v6, a6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v6, v13);
  sub_326C();
}

void sub_2898(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v54 = a4;
  uint64_t v55 = a1;
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  uint64_t v60 = a5;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v59 = v7;
  sub_3324();
  ((void (*)(void))__chkstk_darwin)();
  sub_32FC();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for HintsSuggestionsUI(0LL);
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  sub_3324();
  ((void (*)(void))__chkstk_darwin)();
  sub_32FC();
  uint64_t v14 = v13 - v12;
  sub_2EA8(&qword_81A0);
  sub_3324();
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  v19 = (char *)&v50 - v18;
  uint64_t v20 = type metadata accessor for SuggestionExecutionContextData(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  sub_32FC();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = (*(uint64_t (**)(void))(v5 + 16))();
  if (v6)
  {
    uint64_t v26 = swift_errorRelease(v6);
    uint64_t v27 = static Logger.siriSuggestionsSupportCategory.getter(v26);
    v28 = (os_log_s *)Logger.logObject.getter(v27);
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)sub_31F8();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "facade not set. Unable to process doContinuousConversationsHints", v30, 2u);
      sub_3350((uint64_t)v30);
    }

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v10, v59);
    uint64_t v31 = type metadata accessor for HintsUI(0LL);
    sub_2EE8(v60, 1LL, 1LL, v31);
  }

  else
  {
    uint64_t v50 = v14;
    v51 = v17;
    uint64_t v58 = v21;
    uint64_t v59 = v20;
    uint64_t v32 = v25;
    uint64_t v33 = SuggestionContextData.dialogPhase.getter();
    uint64_t v35 = v34;
    char v36 = SuggestionContextData.hasAdditionalCommands.getter();
    uint64_t v37 = SuggestionContextData.patternId.getter();
    SuggestionExecutionContextData.init(dialogPhase:hasAdditionalCommands:patternId:)(v33, v35, v36 & 1, v37, v38);
    SiriSuggestionsFacade.doContinuousConversationsHint(requestId:applicationSessionId:executionContextData:)( v55,  v56,  v57,  v24);
    uint64_t v39 = v32;
    uint64_t v40 = (uint64_t)v51;
    sub_2EF4((uint64_t)v19, (uint64_t)v51);
    uint64_t v41 = 1LL;
    uint64_t v42 = v53;
    int v43 = sub_2F3C(v40, 1LL, v53);
    uint64_t v44 = v60;
    if (v43 != 1)
    {
      uint64_t v45 = v52;
      uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v50, v40, v42);
      uint64_t v47 = HintsSuggestionsUI.aceView.getter(v46);
      uint64_t v48 = HintsSuggestionsUI.supportingCommands.getter();
      HintsUI.init(snippet:supportingCommands:)(v47, v48);
      sub_3390(*(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
      uint64_t v41 = 0LL;
    }

    uint64_t v49 = type metadata accessor for HintsUI(0LL);
    sub_2EE8(v44, v41, 1LL, v49);
    swift_release(v39);
    sub_3070((uint64_t)v19, &qword_81A0);
    sub_32D0();
  }

  sub_326C();
}

uint64_t sub_2B94()
{
  uint64_t v1 = sub_3330();
  return swift_deallocClassInstance(v1);
}

uint64_t type metadata accessor for SiriKitExecutorBridge()
{
  return objc_opt_self(&OBJC_CLASS____TtC24SiriSuggestionsSKEBridge21SiriKitExecutorBridge);
}

uint64_t sub_2BD4()
{
  return sub_1C98();
}

uint64_t sub_2BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)swift_task_alloc(async function pointer to SiriSuggestionsBroker.doSiriHints(requestId:applicationSessionId:sourceDomainOwner:intentProperties:verb:executionProperties:dialogPhase:)[1]);
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_2C8C;
  sub_32C0();
  return SiriSuggestionsBroker.doSiriHints(requestId:applicationSessionId:sourceDomainOwner:intentProperties:verb:executionProperties:dialogPhase:)( v7,  v8,  v9,  v10,  a5);
}

uint64_t sub_2C8C(uint64_t a1)
{
  uint64_t v4 = sub_317C();
  if (!v1) {
    uint64_t v4 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_2CC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = (void *)swift_task_alloc(dword_81D4);
  *(void *)(v10 + 16) = v11;
  void *v11 = v10;
  v11[1] = sub_2D60;
  sub_32C0();
  return sub_2078(v12, v13, v14, v15, a5, a6, a7, a8, v21, a9, a10);
}

uint64_t sub_2D60()
{
  return sub_31B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2D84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = (void *)swift_task_alloc(dword_81B4);
  *(void *)(v9 + 16) = v11;
  void *v11 = v9;
  v11[1] = sub_3178;
  sub_32C0();
  return sub_2244(v12, v13, v14, v15, a5, a6, a7, a8, v20, a9);
}

uint64_t sub_2E24()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_81AC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_3178;
  return sub_2710();
}

void sub_2E68( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
}

void sub_2E88(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
}

uint64_t sub_2EA8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_2EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_2EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2EA8(&qword_81A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_2F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_2F48(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2FAC;
  return v6(a1);
}

uint64_t sub_2FAC()
{
  uint64_t v0 = (uint64_t (*)(void))sub_339C();
  return sub_31B0(v0);
}

uint64_t sub_2FD0()
{
  return sub_2FDC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2FDC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2FE4()
{
  uint64_t v1 = sub_3330();
  return swift_deallocObject(v1);
}

uint64_t sub_3000()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_81E4);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_3044;
  return sub_1E38();
}

uint64_t sub_3044()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_3070(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2EA8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_30AC()
{
  uint64_t v1 = sub_3330();
  return swift_deallocObject(v1);
}

uint64_t sub_30C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_81EC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2D60;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_81E8 + dword_81E8))(a1, v4);
}

uint64_t sub_3138(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_317C()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

void sub_319C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_31B0(uint64_t (*a1)(void))
{
  return a1();
}

BOOL sub_31BC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_31CC@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_31DC()
{
  return swift_slowDealloc(v0, -1LL, -1LL);
}

uint64_t sub_31EC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_31F8()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_3204()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_3210(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_3228(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_324C()
{
  return static Logger.siriSuggestionsSupportCategory.getter();
}

uint64_t sub_3254()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

  ;
}

  ;
}

void sub_3284()
{
}

uint64_t sub_3290()
{
  return swift_task_dealloc(*(void *)(v0 + 232));
}

uint64_t sub_32A4@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_32B8()
{
  return swift_task_dealloc(v0);
}

  ;
}

uint64_t sub_32D0()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 96) + 8LL))(v0, *(void *)(v1 - 88));
}

uint64_t sub_32E0()
{
  return type metadata accessor for Logger(0LL);
}

_WORD *sub_32E8(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_32F4()
{
  return static os_log_type_t.info.getter();
}

  ;
}

  ;
}

  ;
}

uint64_t sub_3330()
{
  return v0;
}

uint64_t sub_3340()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_3348()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_3350(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_335C(uint64_t a1)
{
  return swift_allocObject(a1, 32LL, 7LL);
}

uint64_t sub_3368()
{
  return v0;
}

uint64_t sub_337C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_3384@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_3390@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_339C()
{
  return *(void *)(v0 + 8);
}
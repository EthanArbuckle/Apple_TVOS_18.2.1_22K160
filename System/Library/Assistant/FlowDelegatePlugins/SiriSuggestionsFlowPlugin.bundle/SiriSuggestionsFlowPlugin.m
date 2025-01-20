uint64_t sub_3E40(uint64_t a1)
{
  uint64_t v1;
  *(void *)(v1 + 16) = a1;
  return swift_task_switch(sub_3E58, 0LL, 0LL);
}

uint64_t sub_3E58()
{
  v1 = (uint64_t (*)(void))sub_5B04();
  return sub_5A50(v1);
}

BOOL sub_3E8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_5A8C();
  uint64_t v6 = v5 - v4;
  sub_54BC(&qword_14670);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v11 = (char *)v28 - v10;
  uint64_t v12 = type metadata accessor for Parse(0LL);
  v13 = *(uint64_t (***)(uint64_t, uint64_t))(v12 - 8);
  __chkstk_darwin(v12);
  sub_5A8C();
  uint64_t v16 = v15 - v14;
  Input.parse.getter();
  int v17 = v13[11](v16, v12);
  int v29 = enum case for Parse.directInvocation(_:);
  int v30 = v17;
  if (v17 == enum case for Parse.directInvocation(_:))
  {
    sub_5A70(v13[12]);
    uint64_t v18 = type metadata accessor for Parse.DirectInvocation(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32LL))(v11, v16, v18);
    sub_54FC((uint64_t)v11, 0LL, 1LL, v18);
    sub_5904((uint64_t)v11, (uint64_t)v9);
    sub_5A38(OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation);
    sub_58BC((uint64_t)v9, v3);
    swift_endAccess(v31);
  }

  else
  {
    uint64_t v19 = static Logger.flowCategory.getter();
    v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)sub_5A7C(2LL);
      v28[1] = v1;
      uint64_t v23 = (uint64_t)v22;
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "SiriSuggestionsInvocationFlow :: Unhandled parse type", v22, 2u);
      sub_5A20(v23);
    }

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
    uint64_t v24 = type metadata accessor for Parse.DirectInvocation(0LL);
    sub_5A2C((uint64_t)v11, v25, v26, v24);
    sub_5A38(OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation);
    sub_58BC((uint64_t)v11, v3);
    swift_endAccess(v31);
    sub_5A70(v13[1]);
  }

  return v30 == v29;
}

uint64_t sub_40F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = sub_54BC(&qword_14650);
  __chkstk_darwin(v6);
  sub_5A8C();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  sub_5A2C(v9, v11, v12, v10);
  v13 = (void *)swift_allocObject(&unk_109A8, 64LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = v2;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = v5;
  swift_retain(v2);
  swift_retain(a2);
  uint64_t v14 = sub_502C(v9, (uint64_t)&unk_14660, (uint64_t)v13);
  return swift_release(v14);
}

uint64_t sub_41BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  uint64_t v8 = type metadata accessor for ExecuteResponse(0LL);
  v7[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[23] = v9;
  v7[24] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_54BC(&qword_14668);
  v7[25] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for InvocationType(0LL);
  v7[26] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v7[27] = v12;
  v7[28] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for PresentationContext(0LL);
  v7[29] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v7[30] = v14;
  v7[31] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for SiriSuggestions.SuggestionPresentation(0LL);
  v7[32] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v7[33] = v16;
  v7[34] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for InvocationContext(0LL);
  v7[35] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v7[36] = v18;
  v7[37] = swift_task_alloc((*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for Logger(0LL);
  v7[38] = v19;
  uint64_t v20 = *(void *)(v19 - 8);
  v7[39] = v20;
  unint64_t v21 = (*(void *)(v20 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[40] = swift_task_alloc(v21);
  v7[41] = swift_task_alloc(v21);
  uint64_t v22 = type metadata accessor for Parse.DirectInvocation(0LL);
  v7[42] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v7[43] = v23;
  unint64_t v24 = (*(void *)(v23 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[44] = swift_task_alloc(v24);
  v7[45] = swift_task_alloc(v24);
  unint64_t v25 = (*(void *)(*(void *)(sub_54BC(&qword_14670) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[46] = swift_task_alloc(v25);
  v7[47] = swift_task_alloc(v25);
  uint64_t v26 = sub_54BC(&qword_14678);
  v7[48] = swift_task_alloc((*(void *)(*(void *)(v26 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for SiriSuggestions.Suggestion(0LL);
  v7[49] = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  v7[50] = v28;
  v7[51] = swift_task_alloc((*(void *)(v28 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_43D4, 0LL, 0LL);
}

uint64_t sub_43D4()
{
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation;
  *(void *)(v0 + 416) = OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation;
  uint64_t v5 = v3 + v4;
  swift_beginAccess(v3 + v4, v0 + 88, 0LL, 0LL);
  sub_55F8(v5, v1);
  uint64_t v6 = sub_55EC(v1, 1LL, v2);
  uint64_t v7 = *(void *)(v0 + 376);
  if ((_DWORD)v6)
  {
    sub_5AEC(v6, &qword_14670);
LABEL_3:
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
LABEL_4:
    sub_5640(v0 + 56, &qword_14680);
LABEL_5:
    sub_5A2C(*(void *)(v0 + 384), v8, v9, *(void *)(v0 + 392));
    goto LABEL_6;
  }

  uint64_t v54 = *(void *)(v0 + 360);
  uint64_t v55 = *(void *)(v0 + 336);
  uint64_t v56 = *(void *)(v0 + 344);
  v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 16);
  *(void *)(v0 + 424) = v57;
  uint64_t v58 = v57(v54, v7, v55);
  uint64_t v59 = sub_5AEC(v58, &qword_14670);
  uint64_t v60 = Parse.DirectInvocation.userData.getter(v59);
  v61 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  *(void *)(v0 + 432) = v61;
  v61(v54, v55);
  if (!v60) {
    goto LABEL_3;
  }
  sub_4E5C(0x6974736567677573LL, 0xEA00000000006E6FLL, v60, (_OWORD *)(v0 + 56));
  swift_bridgeObjectRelease(v60);
  if (!*(void *)(v0 + 80)) {
    goto LABEL_4;
  }
  uint64_t v62 = *(void *)(v0 + 384);
  uint64_t v63 = *(void *)(v0 + 392);
  uint64_t v64 = *(void *)(v0 + 112);
  uint64_t v65 = *(void *)(v0 + 120);
  unint64_t v66 = sub_567C();
  String.fromBase64String<A>()(v64, v65, v63, v66);
  swift_bridgeObjectRelease(v65);
  if (sub_55EC(v62, 1LL, v63) != 1)
  {
    uint64_t v67 = *(void *)(v0 + 296);
    uint64_t v68 = *(void *)(v0 + 264);
    uint64_t v69 = *(void *)(v0 + 272);
    uint64_t v70 = *(void *)(v0 + 256);
    uint64_t v94 = *(void *)(v0 + 216);
    uint64_t v98 = *(void *)(v0 + 224);
    uint64_t v71 = *(void *)(v0 + 200);
    uint64_t v101 = *(void *)(v0 + 208);
    uint64_t v72 = *(void *)(v0 + 144);
    (*(void (**)(void, void, void))(*(void *)(v0 + 400) + 32LL))( *(void *)(v0 + 408),  *(void *)(v0 + 384),  *(void *)(v0 + 392));
    uint64_t v73 = type metadata accessor for InvocationContextHolder();
    uint64_t v74 = SiriSuggestions.Suggestion.presentation.getter(v73);
    uint64_t v75 = SiriSuggestions.SuggestionPresentation.displayText.getter(v74);
    uint64_t v77 = v76;
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v69, v70);
    sub_4F04(v75, v77);
    swift_bridgeObjectRelease(v77);
    uint64_t v78 = *(void *)(v72
                    + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory
                    + 24);
    uint64_t v79 = *(void *)(v72
                    + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory
                    + 32);
    sub_56BC( (void *)(v72 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory),  v78);
    dispatch thunk of ACECommandSuggestionDispatcherFactory.createDispatcher(requirements:)(v67, v78, v79);
    uint64_t v80 = *(void *)(v0 + 40);
    uint64_t v81 = *(void *)(v0 + 48);
    sub_56BC((void *)(v0 + 16), v80);
    (*(void (**)(uint64_t, void, uint64_t))(v94 + 104))(v98, enum case for InvocationType.unknown(_:), v101);
    uint64_t v82 = type metadata accessor for UUID(0LL);
    sub_5A2C(v71, v83, v84, v82);
    PresentationContext.init(displayAllSuggestions:invocationType:requestId:dialogContextId:)(0LL, v98, v71, 0LL, 0LL);
    v85 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SuggestionDispatcher.dispatch(suggestion:presentationContext:)[1]);
    *(void *)(v0 + 440) = v85;
    void *v85 = v0;
    v85[1] = sub_47CC;
    return dispatch thunk of SuggestionDispatcher.dispatch(suggestion:presentationContext:)( *(void *)(v0 + 408),  *(void *)(v0 + 248),  v80,  v81);
  }

LABEL_6:
  uint64_t v10 = sub_5640(*(void *)(v0 + 384), &qword_14678);
  uint64_t v11 = static Logger.flowCategory.getter(v10);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)sub_5A7C(2LL);
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl( &dword_0,  v12,  v13,  "SiriSuggestionsInvocationFlow :: Unable to get encoded suggestion for invocation",  v14,  2u);
    sub_5A20((uint64_t)v14);
  }

  uint64_t v15 = *(void *)(v0 + 312);
  uint64_t v17 = *(void *)(v0 + 184);
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v18 = *(void (**)(uint64_t))(v0 + 152);

  uint64_t v19 = sub_5A5C(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
  static ExecuteResponse.complete()(v19);
  v18(v16);
  sub_5A70(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
  sub_59B0();
  sub_5A84();
  sub_5AA4();
  sub_5AFC();
  sub_5AB4();
  sub_5AE4();
  sub_5AAC();
  sub_5B10();
  sub_5A9C();
  uint64_t v20 = sub_5ABC();
  uint64_t v28 = sub_5ADC(v20, v21, v22, v23, v24, v25, v26, v27, v86, v90);
  uint64_t v36 = sub_5AD4(v28, v29, v30, v31, v32, v33, v34, v35, v87, v91, v95);
  uint64_t v44 = sub_5ACC(v36, v37, v38, v39, v40, v41, v42, v43, v88, v92, v96, v99);
  sub_5AC4(v44, v45, v46, v47, v48, v49, v50, v51, v89, v93, v97, v100, v102);
  v52 = (uint64_t (*)(void))sub_5B04();
  return sub_5A04(v52);
}

uint64_t sub_47CC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 440LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 240LL);
  *(void *)(*(void *)v1 + 448LL) = v0;
  swift_task_dealloc(v2);
  sub_5A5C(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  return sub_5A68();
}

uint64_t sub_4844()
{
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v6 = *(void (**)(uint64_t))(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v8 = v7 + *(void *)(v0 + 416);
  static ExecuteResponse.complete()();
  v6(v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v9 = *(int **)(v7 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_interactionDonator);
  sub_55F8(v8, v1);
  if (sub_55EC(v1, 1LL, v2))
  {
    sub_5640(*(void *)(v0 + 368), &qword_14670);
LABEL_4:
    uint64_t v15 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    swift_bridgeObjectRelease(0LL);
    goto LABEL_5;
  }

  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  uint64_t v11 = *(void *)(v0 + 352);
  uint64_t v12 = *(void *)(v0 + 336);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v0 + 424))(v11, *(void *)(v0 + 368), v12);
  uint64_t v14 = sub_5AEC(v13, &qword_14670);
  uint64_t v15 = Parse.DirectInvocation.userData.getter(v14);
  v10(v11, v12);
  if (!v15) {
    goto LABEL_4;
  }
LABEL_5:
  Class isa = sub_4F94().super.isa;
  *(void *)(v0 + 456) = isa;
  swift_bridgeObjectRelease(v15);
  uint64_t v19 = (uint64_t (*)(Class))((char *)v9 + *v9);
  uint64_t v17 = (void *)swift_task_alloc(v9[1]);
  *(void *)(v0 + 464) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_49DC;
  return v19(isa);
}

uint64_t sub_49DC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 464);
  *(void *)(*v1 + 472) = v0;
  swift_task_dealloc(v3);
  if (!v0) {

  }
  return sub_5A68();
}

uint64_t sub_4A44()
{
  uint64_t v1 = v0[50];
  (*(void (**)(void, void))(v0[36] + 8LL))(v0[37], v0[35]);
  sub_5A5C(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_56E0(v0 + 2);
  sub_59B0();
  sub_5A84();
  sub_5AA4();
  sub_5AFC();
  sub_5AB4();
  sub_5AE4();
  sub_5AAC();
  sub_5B10();
  sub_5A9C();
  uint64_t v2 = sub_5ABC();
  uint64_t v10 = sub_5ADC(v2, v3, v4, v5, v6, v7, v8, v9, v36, v40);
  uint64_t v18 = sub_5AD4(v10, v11, v12, v13, v14, v15, v16, v17, v37, v41, v44);
  uint64_t v26 = sub_5ACC(v18, v19, v20, v21, v22, v23, v24, v25, v38, v42, v45, v47);
  sub_5AC4(v26, v27, v28, v29, v30, v31, v32, v33, v39, v43, v46, v48, v49);
  uint64_t v34 = (uint64_t (*)(void))sub_5B04();
  return sub_5A04(v34);
}

uint64_t sub_4AD8()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v41 = *(void *)(v0 + 352);
  uint64_t v45 = *(void *)(v0 + 328);
  uint64_t v48 = *(void *)(v0 + 320);
  uint64_t v50 = *(void *)(v0 + 272);
  uint64_t v51 = *(void *)(v0 + 248);
  uint64_t v52 = *(void *)(v0 + 224);
  uint64_t v53 = *(void *)(v0 + 200);
  uint64_t v54 = *(void *)(v0 + 192);
  (*(void (**)(void, void))(*(void *)(v0 + 288) + 8LL))(*(void *)(v0 + 296), *(void *)(v0 + 280));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  sub_56E0((void *)(v0 + 16));
  sub_5AAC();
  sub_5A9C();
  sub_5ABC();
  sub_5A84();
  uint64_t v4 = sub_5AA4();
  uint64_t v12 = sub_5ADC(v4, v5, v6, v7, v8, v9, v10, v11, v37, v41);
  uint64_t v20 = sub_5AD4(v12, v13, v14, v15, v16, v17, v18, v19, v38, v42, v45);
  sub_5ACC(v20, v21, v22, v23, v24, v25, v26, v27, v39, v43, v46, v48);
  uint64_t v28 = sub_5AB4();
  sub_5AC4(v28, v29, v30, v31, v32, v33, v34, v35, v40, v44, v47, v49, v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  return sub_59E8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_4BBC()
{
  uint64_t v1 = *(void *)(v0 + 472);

  static Logger.flowCategory.getter();
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 472);
    uint64_t v38 = *(void *)(v0 + 392);
    uint64_t v41 = *(void *)(v0 + 408);
    uint64_t v6 = *(void *)(v0 + 312);
    uint64_t v30 = *(void *)(v0 + 304);
    uint64_t v34 = *(void *)(v0 + 296);
    uint64_t v36 = *(void *)(v0 + 400);
    uint64_t v31 = *(void *)(v0 + 288);
    uint64_t v32 = *(void *)(v0 + 320);
    uint64_t v33 = *(void *)(v0 + 280);
    uint64_t v7 = (uint8_t *)sub_5A7C(12LL);
    uint64_t v8 = sub_5A7C(32LL);
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v44 = v8;
    *(void *)(v0 + 128) = v5;
    swift_errorRetain(v5);
    uint64_t v9 = sub_54BC(&qword_14690);
    uint64_t v10 = String.init<A>(describing:)(v0 + 128, v9);
    unint64_t v12 = v11;
    *(void *)(v0 + 136) = sub_9E20(v10, v11, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v12);
    sub_5B18();
    sub_5B18();
    _os_log_impl(&dword_0, v3, v4, "SiriSuggestionsInvocationFlow :: Error when donating interaction: %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    sub_5A20(v8);
    sub_5A20((uint64_t)v7);

    sub_5B18();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v32, v30);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v34, v33);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v41, v38);
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 400);
    uint64_t v39 = *(void *)(v0 + 392);
    uint64_t v42 = *(void *)(v0 + 408);
    uint64_t v14 = *(void *)(v0 + 312);
    uint64_t v15 = *(void *)(v0 + 320);
    uint64_t v17 = *(void *)(v0 + 296);
    uint64_t v16 = *(void *)(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 280);
    uint64_t v18 = *(void *)(v0 + 288);

    sub_5AF4();
    sub_5AF4();
    sub_5AF4();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v42, v39);
  }

  sub_56E0((void *)(v0 + 16));
  uint64_t v35 = *(void *)(v0 + 248);
  uint64_t v37 = *(void *)(v0 + 224);
  uint64_t v40 = *(void *)(v0 + 200);
  uint64_t v43 = *(void *)(v0 + 192);
  swift_task_dealloc(*(void *)(v0 + 408));
  sub_5A84();
  sub_5AA4();
  sub_5AFC();
  sub_5AB4();
  sub_5AE4();
  sub_5AAC();
  sub_5B10();
  sub_5A9C();
  uint64_t v20 = sub_5ABC();
  sub_5AC4(v20, v21, v22, v23, v24, v25, v26, v27, v30, v31, v32, v33, v35);
  swift_task_dealloc(v37);
  swift_task_dealloc(v40);
  swift_task_dealloc(v43);
  uint64_t v28 = (uint64_t (*)(void))sub_5B04();
  return sub_59E8(v28);
}

double sub_4E5C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_573C(a1, a2), (v7 & 1) != 0))
  {
    sub_57A0(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

double sub_4EAC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_573C(a1, a2), (v7 & 1) != 0))
  {
    sub_594C(*(void *)(a3 + 56) + 48 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    a4[1] = 0u;
    a4[2] = 0u;
    *a4 = 0u;
  }

  return result;
}

uint64_t sub_4F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  sub_56BC(v8, v9);
  uint64_t v6 = DeviceState.asInvocationContext.getter(v4, v5);
  sub_56E0(v8);
  swift_bridgeObjectRetain(a2);
  return InvocationContext.init(directInvocationContext:displayedUtterance:)(v6, a1, a2);
}

INInteraction sub_4F94()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for ExecuteSuggestionIntent(0)) init];
  uint64_t v1 = (void *)SiriSuggestions.Suggestion.toIntentSuggestion()();
  [v0 setSuggestion:v1];

  id v2 = [objc_allocWithZone((Class)type metadata accessor for ExecuteSuggestionIntentResponse(0)) init];
  sub_5700();
  return INInteraction.init(intent:response:donatedBySiri:)((INIntent)v0, (INIntentResponse)v2, 1);
}

uint64_t sub_502C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_55EC(a1, 1LL, v6) == 1)
  {
    sub_5640(a1, &qword_14650);
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

uint64_t sub_5154()
{
  swift_release(*(void *)(v0
                          + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_interactionDonator
                          + 8));
  sub_56E0((void *)(v0 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory));
  return v0;
}

uint64_t sub_51A4()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

BOOL sub_51C8()
{
  return sub_3E8C();
}

uint64_t sub_51EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_5254;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_5254(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_5288(uint64_t a1, uint64_t a2)
{
  return sub_40F4(a1, a2);
}

uint64_t sub_52A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to Flow.execute()[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_5314;
  return Flow.execute()(a1, a2, a3);
}

uint64_t sub_5314()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5340(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SiriSuggestionsInvocationFlow(0LL);
  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_536C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t variable initialization expression of SiriSuggestionsFlowPlugin.currentSiriHelpFlow()
{
  return 0LL;
}

uint64_t sub_5384()
{
  return type metadata accessor for SiriSuggestionsInvocationFlow(0LL);
}

uint64_t type metadata accessor for SiriSuggestionsInvocationFlow(uint64_t a1)
{
  uint64_t result = qword_144E0;
  if (!qword_144E0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriSuggestionsInvocationFlow);
  }
  return result;
}

void sub_53C4(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = (char *)&value witness table for () + 64;
    v4[2] = "(";
    swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
  }
}

void sub_5448(uint64_t a1)
{
  if (!qword_144F0)
  {
    uint64_t v2 = type metadata accessor for Parse.DirectInvocation(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_144F0);
    }
  }

uint64_t type metadata accessor for InvocationContextHolder()
{
  return objc_opt_self(&OBJC_CLASS____TtC25SiriSuggestionsFlowPlugin23InvocationContextHolder);
}

uint64_t sub_54BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_54FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_5508()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_553C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc(dword_1465C);
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_55C8;
  return sub_41BC(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_55C8()
{
  return sub_5A50(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_55EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_55F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_54BC(&qword_14670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5640(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_54BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_567C()
{
  unint64_t result = qword_14688;
  if (!qword_14688)
  {
    uint64_t v1 = type metadata accessor for SiriSuggestions.Suggestion(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SiriSuggestions.Suggestion, v1);
    atomic_store(result, (unint64_t *)&qword_14688);
  }

  return result;
}

void *sub_56BC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_56E0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_5700()
{
  unint64_t result = qword_14698;
  if (!qword_14698)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___INInteraction);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_14698);
  }

  return result;
}

unint64_t sub_573C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_57DC(a1, a2, v5);
}

uint64_t sub_57A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_57DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_58BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_54BC(&qword_14670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5904(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_54BC(&qword_14670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_594C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_5990()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_59B0()
{
  return swift_task_dealloc(*(void *)(v0 + 408));
}

uint64_t sub_59E8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_5A04(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_5A20(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_5A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_54FC(a1, 1LL, 1LL, a4);
}

uint64_t sub_5A38@<X0>(uint64_t a1@<X8>)
{
  return swift_beginAccess(v1 + a1, v2 - 104, 33LL, 0LL);
}

uint64_t sub_5A50(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_5A5C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_5A68()
{
  return swift_task_switch();
}

uint64_t sub_5A70@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_5A7C(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_5A84()
{
  return swift_task_dealloc(v0);
}

  ;
}

uint64_t sub_5A9C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5AA4()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5AAC()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5AB4()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5ABC()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5AC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return swift_task_dealloc(a13);
}

uint64_t sub_5ACC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return swift_task_dealloc(a12);
}

uint64_t sub_5AD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return swift_task_dealloc(a11);
}

uint64_t sub_5ADC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_task_dealloc(a10);
}

uint64_t sub_5AE4()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5AEC(uint64_t a1, uint64_t *a2)
{
  return sub_5640(v2, a2);
}

uint64_t sub_5AF4()
{
  return swift_errorRelease(v0);
}

uint64_t sub_5AFC()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5B04()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_5B10()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_5B18()
{
  return swift_errorRelease(v0);
}

void *sub_5B20(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for EnvironmentRequestIdProvider();
  uint64_t v6 = sub_B484(v5, 56LL);
  uint64_t v7 = type metadata accessor for SiriSuggestionsFlow();
  *(_OWORD *)(v6 + 32) = 0u;
  *(void *)(v6 + 48) = 0LL;
  *(_OWORD *)(v6 + 16) = 0u;
  uint64_t v8 = (void *)sub_B484(v7, 96LL);
  v8[8] = v5;
  sub_A84C( &qword_14910,  v9,  (uint64_t (*)(uint64_t))type metadata accessor for EnvironmentRequestIdProvider,  (uint64_t)"a,");
  v8[2] = 0LL;
  void v8[3] = a1;
  v8[4] = a2;
  v8[5] = v6;
  v8[9] = v10;
  v8[10] = sub_5C50;
  v8[11] = 0LL;
  uint64_t v17 = v2;
  sub_A84C( &qword_146E0,  v11,  (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsFlow);
  uint64_t v18 = v12;
  uint64_t v16 = v8;
  sub_A888((uint64_t)&v16, (uint64_t)v15);
  swift_beginAccess(v6 + 16, v14, 33LL, 0LL);
  sub_B224();
  swift_retain(v8);
  sub_A8D0((uint64_t)v15, v6 + 16);
  swift_endAccess(v14);
  sub_B21C();
  return v8;
}

uint64_t sub_5C50()
{
  return static SuggestionService.isEnabled()() & 1;
}

uint64_t sub_5C7C@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t *a8@<X8>)
{
  uint64_t v37 = a6;
  id v36 = a5;
  uint64_t v35 = a4;
  uint64_t v34 = a3;
  uint64_t v33 = a1;
  uint64_t v38 = a8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v18 = type metadata accessor for SiriSuggestionsFlow();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v18);
  uint64_t v20 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  swift_retain(a1);
  id v21 = [v20 bundleForClass:ObjCClassFromMetadata];
  id v22 = [v21 bundleURL];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v22);
  URL.appendingPathComponent(_:)(0x74616C706D65542FLL, 0xEA00000000007365LL);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  sub_A7FC(a2, (uint64_t)v45);
  SiriSuggestionsFacade.getClient()(v42);
  uint64_t v23 = v43;
  uint64_t v24 = v44;
  uint64_t v25 = sub_56BC(v42, v43);
  v41[3] = v23;
  v41[4] = *(void *)(v24 + 24);
  uint64_t v26 = sub_A7C0(v41);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16LL))(v26, v25, v23);
  sub_A7FC(v34, (uint64_t)v40);
  sub_A7FC(v35, (uint64_t)v39);
  uint64_t v27 = type metadata accessor for SiriHelpSuggestionsDispatcherFactory(0LL);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  id v28 = v36;
  id v29 = v36;
  uint64_t v30 = v37;
  sub_A83C(v37, a7);
  uint64_t v31 = SiriHelpSuggestionsDispatcherFactory.init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)( v33,  v17,  0LL,  0LL,  v45,  v41,  v40,  v39,  v28,  v30,  a7);
  uint64_t result = sub_56E0(v42);
  *uint64_t v38 = v31;
  return result;
}

uint64_t sub_5EF8@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v5 = type metadata accessor for PresentationContext(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_54BC(&qword_146B0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A780(v2, (uint64_t)v11, &qword_146B0);
  uint64_t v12 = 1LL;
  if (sub_55EC((uint64_t)v11, 1LL, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v15(v8);
    if (v3) {
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = 0LL;
  }

  return sub_54FC(a2, v12, 1LL, v5);
}

uint64_t SiriSuggestionsFlow.on(input:)(uint64_t a1)
{
  void (*v31)(void *__return_ptr, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_s *v37;
  os_log_type_t v38;
  _WORD *v39;
  uint64_t v40;
  uint64_t v41;
  os_log_s *v42;
  uint64_t v43;
  uint64_t v44;
  os_log_s *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_s *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  os_log_s *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  os_log_s *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void v112[5];
  uint64_t v113;
  uint64_t v114;
  v109 = a1;
  sub_54BC(&qword_146A8);
  sub_AEB4();
  __chkstk_darwin(v3);
  sub_5A8C();
  v104 = v5 - v4;
  sub_54BC(&qword_146B0);
  sub_AEB4();
  __chkstk_darwin(v6);
  sub_B35C();
  v103 = v7;
  sub_B06C();
  __chkstk_darwin(v8);
  v106 = (char *)&v98 - v9;
  uint64_t v10 = sub_B370();
  v110 = *(void *)(v10 - 8);
  v111 = v10;
  __chkstk_darwin(v10);
  sub_B35C();
  v108 = v11;
  sub_B06C();
  __chkstk_darwin(v12);
  v105 = (char *)&v98 - v13;
  sub_B06C();
  __chkstk_darwin(v14);
  uint64_t v102 = (char *)&v98 - v15;
  sub_B06C();
  __chkstk_darwin(v16);
  v107 = (char *)&v98 - v17;
  sub_B06C();
  uint64_t v19 = __chkstk_darwin(v18);
  id v21 = (char *)&v98 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (os_log_s *)((char *)&v98 - v22);
  uint64_t v24 = type metadata accessor for Parse(0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  sub_5A8C();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = sub_54BC(&qword_146B8);
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  sub_B078();
  if (((*(uint64_t (**)(void))(v1 + 80))() & 1) != 0)
  {
    uint64_t v100 = v21;
    uint64_t v101 = v25;
    uint64_t v99 = v23;
    v108 = v1;
    static Transformer<>.parseToProperties.getter();
    uint64_t v31 = (void (*)(void *__return_ptr, uint64_t))Transformer.transform.getter(v29);
    uint64_t v33 = v32;
    uint64_t v34 = sub_B270(v2, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
    Input.parse.getter(v34);
    v31(v112, v28);
    swift_release(v33);
    uint64_t v40 = sub_AF6C(v28, *(uint64_t (**)(uint64_t, uint64_t))(v101 + 8));
    uint64_t v41 = v112[0];
    uint64_t v42 = v99;
    static Logger.flowCategory.getter(v40);
    uint64_t v43 = v108;
    uint64_t v44 = sub_B098(v108);
    uint64_t v45 = v42;
    Logger.logObject.getter(v44);
    uint64_t v46 = sub_B428();
    if (sub_AD30(v46))
    {
      uint64_t v47 = (uint8_t *)sub_5A7C(12LL);
      uint64_t v48 = sub_5A7C(32LL);
      v112[0] = v48;
      *(_DWORD *)uint64_t v47 = 136315138;
      v113 = *(void *)(v108 + 16);
      swift_retain(v113);
      uint64_t v49 = sub_54BC(&qword_146C0);
      uint64_t v50 = String.init<A>(describing:)(&v113, v49);
      v113 = sub_B3F8(v50, v51);
      uint64_t v43 = v108;
      sub_B1EC(v113, (uint64_t)&v114);
      sub_AF84(v43);
      sub_B470();
      sub_ADF4(&dword_0, v42, (os_log_type_t)v23, "Previous intentProperties calculated as %s", v47);
      sub_ADEC(v48, v52, (uint64_t)&type metadata for Any + 8);
      sub_5A20(v48);
      sub_5A20((uint64_t)v47);
    }

    else
    {

      sub_AF84(v43);
    }

    uint64_t v54 = (uint64_t)v42;
    uint64_t v55 = v111;
    sub_B288(v54);
    uint64_t v56 = v107;
    sub_B160();
    sub_B098(v41);
    sub_B25C();
    v57 = sub_B428();
    if (sub_AD30(v57))
    {
      uint64_t v58 = (uint8_t *)sub_5A7C(12LL);
      uint64_t v59 = sub_5A7C(32LL);
      v112[0] = v59;
      *(_DWORD *)uint64_t v58 = 136315138;
      v113 = v41;
      sub_B414();
      uint64_t v60 = sub_54BC(&qword_146C0);
      v61 = sub_B1FC(v60);
      uint64_t v63 = v62;
      v113 = sub_B3F8(v61, v62);
      sub_B1EC(v113, v55 + 8);
      sub_AF84(v41);
      swift_bridgeObjectRelease(v63);
      sub_ADF4(&dword_0, v45, (os_log_type_t)v23, "new intentProperties calculated as %s", v58);
      sub_ADEC(v59, v64, (uint64_t)&type metadata for Any + 8);
      uint64_t v65 = v59;
      uint64_t v43 = v108;
      sub_5A20(v65);
      sub_5A20((uint64_t)v58);

      unint64_t v66 = (uint64_t)v107;
    }

    else
    {

      sub_AF84(v41);
      unint64_t v66 = (uint64_t)v56;
    }

    uint64_t v67 = sub_B288(v66);
    uint64_t v68 = (uint64_t)v106;
    if (*(void *)(v43 + 16) && v41)
    {
      sub_B414();
      uint64_t v69 = sub_B3DC();
      IntentProperties.presentationContext.getter(v69);
      sub_AFBC();
      uint64_t v70 = type metadata accessor for PresentationContext(0LL);
      if (sub_55EC(v68, 1LL, v70) == 1)
      {
        sub_AA9C(v68, &qword_146B0);
      }

      else
      {
        uint64_t v71 = PresentationContext.displayAllSuggestions.getter();
        uint64_t v72 = sub_AF6C(v68, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v70 - 8) + 8LL));
        if ((v71 & 1) != 0)
        {
          uint64_t v73 = (uint64_t)v102;
          uint64_t v74 = static Logger.flowCategory.getter(v72);
          uint64_t v75 = (os_log_s *)Logger.logObject.getter(v74);
          uint64_t v76 = static os_log_type_t.debug.getter();
          if (sub_AF38(v75))
          {
            uint64_t v77 = (uint8_t *)sub_5A7C(2LL);
            *(_WORD *)uint64_t v77 = 0;
            sub_AD90(&dword_0, v75, v76, "Reusing previous turn's intentProperties as this is a show more request", v77);
            sub_5A20((uint64_t)v77);
          }

          uint64_t v78 = sub_B288(v73);
          uint64_t v79 = IntentProperties.intentProps.getter(v78);
          uint64_t v80 = IntentProperties.verb.getter();
          uint64_t v82 = v81;
          IntentProperties.owner.getter(v112);
          uint64_t v83 = sub_B414();
          uint64_t v84 = v103;
          IntentProperties.presentationContext.getter(v83);
          sub_AFBC();
          if (*(void *)(v108 + 16))
          {
            v85 = sub_AEE0();
            uint64_t v86 = v104;
            IntentProperties.preComputedSuggestions.getter(v85);
            sub_AF74();
          }

          else
          {
            uint64_t v93 = type metadata accessor for SiriSuggestions.SuggestionList(0LL);
            uint64_t v86 = v104;
            sub_5A2C(v104, v94, v95, v93);
          }

          uint64_t v96 = type metadata accessor for IntentProperties(0LL);
          sub_AF4C(v96);
          uint64_t v97 = IntentProperties.init(intentProps:verb:owner:presentationContext:preComputedSuggestions:)( v79,  v80,  v82,  v112,  v84,  v86);
          sub_AEC4();
          sub_AFBC();
          uint64_t v92 = *(void *)(v108 + 16);
          *(void *)(v108 + 16) = v97;
          goto LABEL_25;
        }
      }

      uint64_t v67 = sub_AEC4();
    }

    uint64_t v87 = (uint64_t)v105;
    uint64_t v88 = static Logger.flowCategory.getter(v67);
    uint64_t v89 = (os_log_s *)Logger.logObject.getter(v88);
    uint64_t v90 = static os_log_type_t.debug.getter();
    if (sub_AF38(v89))
    {
      uint64_t v91 = (uint8_t *)sub_5A7C(2LL);
      *(_WORD *)uint64_t v91 = 0;
      sub_AD90(&dword_0, v89, v90, "Using new intentProperties as this is new request", v91);
      sub_5A20((uint64_t)v91);
    }

    sub_B288(v87);
    uint64_t v92 = *(void *)(v43 + 16);
    *(void *)(v43 + 16) = v41;
LABEL_25:
    swift_release(v92);
    return 1LL;
  }

  uint64_t v35 = v111;
  id v36 = v108;
  sub_B160();
  uint64_t v37 = (os_log_s *)sub_B25C();
  uint64_t v38 = static os_log_type_t.info.getter();
  if (sub_AF38(v37))
  {
    uint64_t v39 = (_WORD *)sub_5A7C(2LL);
    sub_B334(v39);
    sub_AD90(&dword_0, v37, v38, "SiriSuggestionsFlow :: Disabled. Skipping suggestions", (uint8_t *)v30);
    sub_5A20(v30);
  }

  (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v36, v35);
  return 0LL;
}

uint64_t SiriSuggestionsFlow.execute()(uint64_t a1)
{
  v2[38] = a1;
  v2[39] = v1;
  uint64_t v3 = type metadata accessor for FlowUnhandledReason(0LL);
  v2[40] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[41] = v4;
  v2[42] = sub_ACE0(v4);
  uint64_t v5 = sub_54BC(&qword_146D0);
  v2[43] = v5;
  v2[44] = sub_ACE0(*(void *)(v5 - 8));
  v2[45] = sub_54BC(&qword_146D8);
  v2[46] = sub_AC68();
  v2[47] = sub_AC68();
  v2[48] = sub_AC68();
  v2[49] = sub_AC68();
  uint64_t v6 = type metadata accessor for SiriHelpDispatcherErrors(0LL);
  v2[50] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[51] = v7;
  v2[52] = sub_ACE0(v7);
  uint64_t v8 = type metadata accessor for InvocationType(0LL);
  v2[53] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[54] = v9;
  v2[55] = sub_ACE0(v9);
  uint64_t v10 = type metadata accessor for PresentationContext(0LL);
  v2[56] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[57] = v11;
  v2[58] = sub_ACE0(v11);
  sub_54BC(&qword_146A8);
  v2[59] = sub_AC68();
  v2[60] = sub_AC68();
  uint64_t v12 = type metadata accessor for SiriSuggestions.SuggestionList(0LL);
  v2[61] = v12;
  v2[62] = *(void *)(v12 - 8);
  v2[63] = sub_AC68();
  v2[64] = sub_AC68();
  v2[65] = sub_AC68();
  v2[66] = sub_AC68();
  v2[67] = sub_54BC(&qword_146B0);
  v2[68] = sub_AC68();
  v2[69] = sub_AC68();
  v2[70] = sub_AC68();
  v2[71] = sub_AC68();
  v2[72] = sub_AC68();
  v2[73] = sub_AC68();
  v2[74] = sub_AC68();
  uint64_t v13 = type metadata accessor for RequestPositionInSession(0LL);
  v2[75] = v13;
  v2[76] = *(void *)(v13 - 8);
  v2[77] = sub_AC68();
  v2[78] = sub_AC68();
  sub_54BC(&qword_14668);
  v2[79] = sub_AC68();
  v2[80] = sub_AC68();
  uint64_t v14 = sub_B0C0();
  v2[81] = v14;
  v2[82] = *(void *)(v14 - 8);
  v2[83] = sub_AC68();
  v2[84] = sub_AC68();
  uint64_t v15 = sub_B370();
  v2[85] = v15;
  v2[86] = *(void *)(v15 - 8);
  v2[87] = sub_AC68();
  v2[88] = sub_AC68();
  v2[89] = sub_AC68();
  v2[90] = sub_AC68();
  v2[91] = sub_AC68();
  v2[92] = sub_AC68();
  v2[93] = sub_AC68();
  v2[94] = sub_AC68();
  v2[95] = sub_AC68();
  v2[96] = sub_AC68();
  v2[97] = sub_AC68();
  v2[98] = sub_AC68();
  uint64_t v16 = type metadata accessor for OSSignpostID(0LL);
  v2[99] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[100] = v17;
  v2[101] = sub_ACE0(v17);
  sub_AED4();
  return sub_AC70();
}

uint64_t sub_6B6C()
{
  uint64_t v2 = v1[39];
  uint64_t v3 = *(uint8_t **)(v2 + 24);
  v1[102] = v3;
  if (!v3 || (uint64_t v4 = *(void *)(v2 + 32), (v1[103] = v4) == 0LL))
  {
    uint64_t v32 = (os_log_s *)v1[90];
    uint64_t v33 = sub_AD88();
    Logger.logObject.getter(v33);
    os_log_type_t v34 = sub_AF64();
    if (sub_AE30(v34))
    {
      uint64_t v35 = (_WORD *)sub_5A7C(2LL);
      sub_B334(v35);
      sub_AD90(&dword_0, v32, (os_log_type_t)v3, "No suggestions facade set. Cannot continue", v0);
      sub_5A20((uint64_t)v0);
    }

    uint64_t v36 = v1[90];
    uint64_t v37 = v1[86];

    uint64_t v38 = sub_AFEC(v36, *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8));
    static ExecuteResponse.complete()(v38);
LABEL_17:
    uint64_t v68 = sub_ABC4();
    uint64_t v549 = v1[60];
    uint64_t v550 = v1[59];
    uint64_t v552 = v1[58];
    swift_task_dealloc(v68);
    sub_5ABC();
    sub_5A84();
    sub_5AA4();
    sub_5AFC();
    sub_5AB4();
    sub_5A9C();
    sub_5B10();
    sub_5AAC();
    uint64_t v69 = sub_5AE4();
    uint64_t v77 = sub_5ADC(v69, v70, v71, v72, v73, v74, v75, v76, v298, v319);
    uint64_t v85 = sub_5AD4(v77, v78, v79, v80, v81, v82, v83, v84, v299, v320, v340);
    uint64_t v93 = sub_5ACC(v85, v86, v87, v88, v89, v90, v91, v92, v300, v321, v341, v360);
    uint64_t v101 = sub_5AC4(v93, v94, v95, v96, v97, v98, v99, v100, v301, v322, v342, v361, v379);
    uint64_t v109 = sub_B188(v101, v102, v103, v104, v105, v106, v107, v108, v302, v323, v343, v362, v380, v397);
    uint64_t v117 = sub_B178(v109, v110, v111, v112, v113, v114, v115, v116, v303, v324, v344, v363, v381, v398, v414);
    uint64_t v125 = sub_B170(v117, v118, v119, v120, v121, v122, v123, v124, v304, v325, v345, v364, v382, v399, v415, v430);
    uint64_t v133 = sub_B168( v125,  v126,  v127,  v128,  v129,  v130,  v131,  v132,  v305,  v326,  v346,  v365,  v383,  v400,  v416,  v431,  v445);
    uint64_t v141 = sub_B158( v133,  v134,  v135,  v136,  v137,  v138,  v139,  v140,  v306,  v327,  v347,  v366,  v384,  v401,  v417,  v432,  v446,  v459);
    uint64_t v149 = sub_B150( v141,  v142,  v143,  v144,  v145,  v146,  v147,  v148,  v307,  v328,  v348,  v367,  v385,  v402,  v418,  v433,  v447,  v460,  v472);
    uint64_t v157 = sub_B148( v149,  v150,  v151,  v152,  v153,  v154,  v155,  v156,  v308,  v329,  v349,  v368,  v386,  v403,  v419,  v434,  v448,  v461,  v473,  v484);
    uint64_t v165 = sub_B128( v157,  v158,  v159,  v160,  v161,  v162,  v163,  v164,  v309,  v330,  v350,  v369,  v387,  v404,  v420,  v435,  v449,  v462,  v474,  v485,  v495);
    uint64_t v173 = sub_B120( v165,  v166,  v167,  v168,  v169,  v170,  v171,  v172,  v310,  v331,  v351,  v370,  v388,  v405,  v421,  v436,  v450,  v463,  v475,  v486,  v496,  v505);
    uint64_t v181 = sub_B118( v173,  v174,  v175,  v176,  v177,  v178,  v179,  v180,  v311,  v332,  v352,  v371,  v389,  v406,  v422,  v437,  v451,  v464,  v476,  v487,  v497,  v506,  v514);
    uint64_t v189 = sub_B110( v181,  v182,  v183,  v184,  v185,  v186,  v187,  v188,  v312,  v333,  v353,  v372,  v390,  v407,  v423,  v438,  v452,  v465,  v477,  v488,  v498,  v507,  v515,  v522);
    uint64_t v197 = sub_B100( v189,  v190,  v191,  v192,  v193,  v194,  v195,  v196,  v313,  v334,  v354,  v373,  v391,  v408,  v424,  v439,  v453,  v466,  v478,  v489,  v499,  v508,  v516,  v523,  v529);
    uint64_t v205 = sub_B0F8( v197,  v198,  v199,  v200,  v201,  v202,  v203,  v204,  v314,  v335,  v355,  v374,  v392,  v409,  v425,  v440,  v454,  v467,  v479,  v490,  v500,  v509,  v517,  v524,  v530,  v535);
    uint64_t v213 = sub_B0F0( v205,  v206,  v207,  v208,  v209,  v210,  v211,  v212,  v315,  v336,  v356,  v375,  v393,  v410,  v426,  v441,  v455,  v468,  v480,  v491,  v501,  v510,  v518,  v525,  v531,  v536,  v540);
    uint64_t v221 = sub_B0E8( v213,  v214,  v215,  v216,  v217,  v218,  v219,  v220,  v316,  v337,  v357,  v376,  v394,  v411,  v427,  v442,  v456,  v469,  v481,  v492,  v502,  v511,  v519,  v526,  v532,  v537,  v541,  v544);
    uint64_t v229 = sub_B0E0( v221,  v222,  v223,  v224,  v225,  v226,  v227,  v228,  v317,  v338,  v358,  v377,  v395,  v412,  v428,  v443,  v457,  v470,  v482,  v493,  v503,  v512,  v520,  v527,  v533,  v538,  v542,  v545,  v547);
    sub_B0C8( v229,  v230,  v231,  v232,  v233,  v234,  v235,  v236,  v318,  v339,  v359,  v378,  v396,  v413,  v429,  v444,  v458,  v471,  v483,  v494,  v504,  v513,  v521,  v528,  v534,  v539,  v543,  v546,  v548,  v549);
    swift_task_dealloc(v550);
    swift_task_dealloc(v552);
    sub_B0B8();
    sub_B0A8();
    sub_B180();
    sub_B0A0();
    sub_B090();
    sub_B064();
    sub_B2C0();
    sub_B2B0();
    sub_B048();
    __asm { BR              X0 }
  }

  uint64_t v5 = v1[101];
  sub_B224();
  uint64_t v557 = v4;
  uint64_t v6 = swift_retain(v4);
  uint64_t v7 = (void *)static Logger.log.getter(v6);
  static Logger.makeSignpostID(log:)();

  uint64_t v9 = static SiriSuggestionsSignpost.flow.getter(v8);
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = (void *)static Logger.log.getter(v9);
  static Logger.begin(_:_:log:telemetry:)(v5, v9, v11, v13, v14, 1LL);

  static Logger.flowCategory.getter(v15);
  uint64_t v16 = sub_B098(v2);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.debug.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = v1[98];
  uint64_t v21 = v1[86];
  uint64_t v22 = v1[85];
  uint64_t v23 = v1[39];
  uint64_t v24 = &loc_D000;
  if (v19)
  {
    uint64_t v555 = v1[98];
    uint64_t v25 = (uint8_t *)sub_5A7C(12LL);
    uint64_t v554 = v21;
    uint64_t v26 = sub_5A7C(32LL);
    v559[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    LOBYTE(v24) = (_BYTE)v25 + 12;
    uint64_t v3 = v25 + 4;
    uint64_t v27 = *(void *)(v23 + 16);
    v1[36] = v27;
    swift_retain(v27);
    uint64_t v28 = sub_54BC(&qword_146C0);
    uint64_t v29 = String.init<A>(describing:)(v1 + 36, v28);
    v1[37] = sub_9E20(v29, v30, v559);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 37, v1 + 38, v25 + 4, v25 + 12);
    sub_AF84(v23);
    sub_B508();
    sub_ADF4(&dword_0, v17, v18, "Using intentProperties: %s", v25);
    sub_AD98((uint64_t)&type metadata for Any);
    sub_5A20(v26);
    sub_5A20((uint64_t)v25);

    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v554 + 8);
    v31(v555, v22);
  }

  else
  {

    sub_AF84(v23);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v31(v20, v22);
  }

  v1[104] = v31;
  uint64_t v39 = (os_log_s *)v1[97];
  uint64_t v40 = sub_AD88();
  Logger.logObject.getter(v40);
  os_log_type_t v41 = sub_B430();
  if (sub_AD30(v41))
  {
    uint64_t v42 = (_WORD *)sub_5A7C(2LL);
    sub_B264(v42);
    sub_AD90(&dword_0, v39, (os_log_type_t)v24, "SiriSuggestionsFlow :: Getting suggestions from sirisuggestions", v3);
    sub_5A20((uint64_t)v3);
  }

  uint64_t v43 = v1[97];
  uint64_t v44 = v1[85];
  uint64_t v45 = (void *)v1[39];

  v31(v43, v44);
  uint64_t v46 = (uint8_t *)v45[8];
  uint64_t v47 = v45[9];
  sub_B468(v45 + 5);
  uint64_t v48 = dispatch thunk of RequestIdProvider.requestId.getter(v46, v47);
  v1[105] = v48;
  v1[106] = v49;
  if (!v49)
  {
LABEL_14:
    uint64_t v52 = (os_log_s *)v1[91];
    uint64_t v53 = sub_AD88();
    Logger.logObject.getter(v53);
    os_log_type_t v54 = sub_AF64();
    if (sub_AD30(v54))
    {
      uint64_t v55 = (_WORD *)sub_5A7C(2LL);
      sub_B264(v55);
      sub_AD90(&dword_0, v52, (os_log_type_t)v47, "SiriSuggestionsFlow :: No requestId set. Skipping suggestions", v46);
      sub_5A20((uint64_t)v46);
    }

    uint64_t v56 = v1[101];
    uint64_t v57 = v1[100];
    uint64_t v58 = v1[91];
    uint64_t v59 = v1[85];

    uint64_t v60 = ((uint64_t (*)(uint64_t, uint64_t))v31)(v58, v59);
    uint64_t v61 = static ExecuteResponse.complete()(v60);
    uint64_t v62 = static SiriSuggestionsSignpost.flow.getter(v61);
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v67 = (void *)static Logger.log.getter(v62);
    static Logger.end(_:_:log:telemetry:)(v56, v62, v64, v66, v67, 1LL);
    swift_release(v557);
    sub_B2B8();

    sub_AFE4(v56, *(uint64_t (**)(uint64_t, uint64_t))(v57 + 8));
    goto LABEL_17;
  }

  LOBYTE(v47) = v49;
  uint64_t v50 = v1[81];
  uint64_t v46 = (uint8_t *)v1[80];
  UUID.init(uuidString:)(v48, v49);
  if (sub_55EC((uint64_t)v46, 1LL, v50) == 1)
  {
    uint64_t v51 = sub_B140();
    sub_AF7C(v51, &qword_14668);
    goto LABEL_14;
  }

  v556 = v31;
  uint64_t v238 = v1[78];
  uint64_t v239 = v1[77];
  uint64_t v240 = v1[76];
  uint64_t v241 = v1[75];
  uint64_t v242 = v1[39];
  (*(void (**)(void, void, void))(v1[82] + 32LL))(v1[84], v1[80], v1[81]);
  uint64_t v243 = type metadata accessor for SiriSuggestionsFlow();
  v1[107] = v243;
  sub_A84C( &qword_146E0,  v244,  (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsFlow);
  SiriEnvironmentLocating<>.siriEnvironment.getter(v243, v245);
  SiriEnvironment.currentRequest.getter();
  uint64_t v246 = sub_AF74();
  CurrentRequest.positionInSession.getter(v246);
  sub_B21C();
  (*(void (**)(uint64_t, void, uint64_t))(v240 + 104))( v239,  enum case for RequestPositionInSession.following(_:),  v241);
  sub_B4B0( &qword_146E8,  v247,  (uint64_t (*)(uint64_t))&type metadata accessor for RequestPositionInSession,  (uint64_t)&protocol conformance descriptor for RequestPositionInSession);
  sub_B478();
  sub_B478();
  uint64_t v248 = v1[30];
  uint64_t v249 = v1[34];
  v250 = *(void (**)(uint64_t, uint64_t))(v240 + 8);
  v250(v239, v241);
  v250(v238, v241);
  uint64_t v558 = v242;
  if (*(void *)(v242 + 16))
  {
    uint64_t v253 = v1[84];
    uint64_t v254 = v1[74];
    uint64_t v242 = v1[73];
    uint64_t v255 = sub_AEE0();
    IntentProperties.presentationContext.getter(v255);
    sub_AF74();
    uint64_t v256 = swift_task_alloc(32LL);
    *(void *)(v256 + 16) = v253;
    *(_BYTE *)(v256 + 24) = v248 == v249;
    sub_5EF8((void (*)(char *))sub_A5B4, v254);
    sub_AA9C(v242, &qword_146B0);
    sub_5B10();
  }

  else
  {
    sub_5A2C(v1[74], v251, v252, v1[56]);
  }

  v257 = (os_log_s *)v1[96];
  sub_AD88();
  uint64_t v258 = sub_B008();
  sub_A780(v258, v259, v260);
  Logger.logObject.getter(v261);
  os_log_type_t v262 = sub_B430();
  BOOL v263 = sub_AD30(v262);
  uint64_t v264 = v1[85];
  if (v263)
  {
    uint64_t v553 = v1[96];
    uint64_t v265 = v1[73];
    uint64_t v266 = v1[72];
    uint64_t v551 = v1[67];
    v267 = (uint8_t *)sub_5A7C(12LL);
    uint64_t v268 = sub_5A7C(32LL);
    v559[0] = v268;
    *(_DWORD *)v267 = 136315138;
    sub_A780(v266, v265, &qword_146B0);
    uint64_t v269 = String.init<A>(describing:)(v265, v551);
    v1[35] = sub_9E20(v269, v270, v559);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 35, v1 + 36, v267 + 4, v267 + 12);
    sub_B40C();
    sub_AA9C(v266, &qword_146B0);
    sub_ADF4(&dword_0, v257, (os_log_type_t)v242, "Using presentationContext as: %s", v267);
    sub_AD98((uint64_t)&type metadata for Any);
    sub_5A20(v268);
    sub_5A20((uint64_t)v267);

    uint64_t v272 = v264;
    uint64_t v271 = v553;
  }

  else
  {
    sub_AA9C(v1[72], &qword_146B0);

    uint64_t v271 = sub_B008();
  }

  v556(v271, v272);
  uint64_t v274 = v1[60];
  v273 = (uint8_t *)v1[61];
  if (!*(void *)(v558 + 16))
  {
    sub_54FC(v1[60], 1LL, 1LL, v1[61]);
    goto LABEL_30;
  }

  uint64_t v275 = sub_AEE0();
  IntentProperties.preComputedSuggestions.getter(v275);
  sub_AF74();
  sub_AE50(v274);
  if (v276)
  {
LABEL_30:
    sub_AA9C(v1[60], &qword_146A8);
    v1[108] = *(void *)(v558 + 16);
    uint64_t v291 = dword_146F4;
    sub_AEE0();
    v292 = (void *)swift_task_alloc(v291);
    v1[109] = v292;
    void *v292 = v1;
    v292[1] = sub_7510;
    sub_B048();
    return sub_9684(v293, v294, v295, v296, v297);
  }

  v277 = (os_log_s *)v1[95];
  v278 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1[62] + 32LL);
  v278(v1[65], v1[60], v1[61]);
  uint64_t v279 = sub_AD88();
  Logger.logObject.getter(v279);
  os_log_type_t v280 = sub_B428();
  if (sub_AE30(v280))
  {
    v281 = (_WORD *)sub_5A7C(2LL);
    sub_B334(v281);
    sub_AD90(&dword_0, v277, (os_log_type_t)v558, "Using precomputed suggestions from the intent", v273);
    sub_5A20((uint64_t)v273);
  }

  uint64_t v282 = v1[66];
  uint64_t v283 = v1[65];
  uint64_t v284 = v1[61];

  uint64_t v285 = sub_B008();
  ((void (*)(uint64_t))v556)(v285);
  v278(v282, v283, v284);
  v1[29] = v1[103];
  uint64_t v286 = sub_54BC(&qword_14700);
  sub_AF4C(v286);
  uint64_t v287 = async function pointer to SinkDispatcherProvider.init(suggestionDispatcherFactory:)[1];
  sub_AEE0();
  v288 = (void *)swift_task_alloc(v287);
  v1[111] = v288;
  sub_B38C(v288, (uint64_t)sub_76DC);
  sub_B048();
  return SinkDispatcherProvider.init(suggestionDispatcherFactory:)(v289);
}

uint64_t sub_7510()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 872);
  *(void *)(*v1 + 880) = v0;
  swift_task_dealloc(v3);
  swift_release(*(void *)(v2 + 864));
  if (v0) {
    sub_B030();
  }
  sub_AED4();
  return swift_task_switch(v4, v5, v6);
}

uint64_t sub_7584()
{
  uint64_t v1 = v0[39];
  (*(void (**)(void, void, void))(v0[62] + 32LL))(v0[66], v0[64], v0[61]);
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[73];
    uint64_t v3 = v0[66];
    uint64_t v4 = v0[61];
    uint64_t v5 = v0[62];
    uint64_t v6 = v0[59];
    uint64_t v7 = v0[56];
    uint64_t v8 = v0[39];
    uint64_t v9 = sub_B224();
    uint64_t v22 = IntentProperties.intentProps.getter(v9);
    uint64_t v10 = IntentProperties.verb.getter();
    uint64_t v20 = v11;
    uint64_t v21 = v10;
    IntentProperties.owner.getter(v23);
    sub_54FC(v2, 1LL, 1LL, v7);
    sub_B510(v6, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    sub_54FC(v6, 0LL, 1LL, v4);
    uint64_t v12 = type metadata accessor for IntentProperties(0LL);
    sub_AF4C(v12);
    uint64_t v13 = IntentProperties.init(intentProps:verb:owner:presentationContext:preComputedSuggestions:)( v22,  v21,  v20,  v23,  v2,  v6);
    sub_B21C();
    uint64_t v14 = *(void *)(v8 + 16);
    *(void *)(v8 + 16) = v13;
    swift_release(v14);
  }

  v0[29] = v0[103];
  uint64_t v15 = sub_54BC(&qword_14700);
  sub_AF4C(v15);
  uint64_t v16 = async function pointer to SinkDispatcherProvider.init(suggestionDispatcherFactory:)[1];
  sub_AEE0();
  uint64_t v17 = (void *)swift_task_alloc(v16);
  v0[111] = v17;
  uint64_t v18 = sub_B38C(v17, (uint64_t)sub_76DC);
  return SinkDispatcherProvider.init(suggestionDispatcherFactory:)(v18);
}

uint64_t sub_76DC(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 888);
  uint64_t v5 = *v1;
  *(void *)(*v1 + 896) = a1;
  swift_task_dealloc(v4);
  *(void *)(v3 + 904) = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_776C;
  return v8(v3 + 16);
}

uint64_t sub_776C()
{
  return sub_AC70();
}

uint64_t sub_77A0()
{
  if (*(void *)(v1 + 160))
  {
    uint64_t v33 = *(void *)(v1 + 664);
    uint64_t v34 = *(void *)(v1 + 672);
    uint64_t v3 = *(void *)(v1 + 656);
    uint64_t v4 = *(void *)(v1 + 592);
    uint64_t v5 = *(void *)(v1 + 568);
    uint64_t v31 = *(void *)(v1 + 448);
    uint64_t v32 = *(void *)(v1 + 648);
    sub_A65C((__int128 *)(v1 + 136), v1 + 176);
    sub_56BC((void *)(v1 + 176), *(void *)(v1 + 200));
    uint64_t v6 = sub_B008();
    v7(v6);
    sub_A780(v4, v5, &qword_146B0);
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v8(v33, v34, v32);
    int v9 = sub_55EC(v5, 1LL, v31);
    uint64_t v10 = *(void *)(v1 + 664);
    uint64_t v11 = *(void *)(v1 + 648);
    if (v9 == 1)
    {
      uint64_t v12 = *(void *)(v1 + 632);
      uint64_t v13 = *(void *)(v1 + 568);
      uint64_t v14 = *(void *)(v1 + 440);
      (*(void (**)(uint64_t, void, void))(*(void *)(v1 + 432) + 104LL))( v14,  enum case for InvocationType.siriHelp(_:),  *(void *)(v1 + 424));
      v8(v12, v10, v11);
      sub_54FC(v12, 0LL, 1LL, v11);
      PresentationContext.init(displayAllSuggestions:invocationType:requestId:dialogContextId:)(0LL, v14, v12, 0LL, 0LL);
      sub_B2A0();
      sub_AA9C(v13, &qword_146B0);
    }

    else
    {
      uint64_t v27 = *(void *)(v1 + 568);
      uint64_t v28 = *(void *)(v1 + 456);
      uint64_t v29 = *(void *)(v1 + 464);
      sub_B2A0();
      sub_B510(v29, v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32));
    }

    unint64_t v30 = (void *)swift_task_alloc(async function pointer to dispatch thunk of SuggestionsDispatcher.dispatch(suggestions:presentationContext:)[1]);
    *(void *)(v1 + 912) = v30;
    *unint64_t v30 = v1;
    v30[1] = sub_7A58;
    sub_B2C8();
    return dispatch thunk of SuggestionsDispatcher.dispatch(suggestions:presentationContext:)();
  }

  else
  {
    uint64_t v15 = *(void *)(v1 + 752);
    sub_AF7C(v2, &qword_14708);
    sub_B160();
    sub_B25C();
    os_log_type_t v16 = sub_AF64();
    if (sub_AE30(v16))
    {
      uint64_t v17 = (_WORD *)sub_5A7C(2LL);
      sub_B334(v17);
      sub_AD90(&dword_0, (os_log_s *)(v1 + 136), (os_log_type_t)v15, "No dispatcher returned from factory!", v0);
      sub_5A20((uint64_t)v0);
    }

    uint64_t v18 = *(void (**)(uint64_t))(v1 + 832);

    uint64_t v19 = sub_B008();
    v18(v19);
    sub_AE94();
    uint64_t v20 = sub_B3DC();
    sub_B1DC(v20);
    sub_B40C();
    sub_B31C();
    uint64_t v21 = sub_AEC4();
    *(void *)(v1 + 928) = SinkDispatcherProvider.capture.getter(v21);
    sub_54BC(&qword_14710);
    unint64_t v22 = sub_A5D4();
    sub_B400(v22);
    sub_B2C8();
    return swift_task_switch(v23, v24, v25);
  }

uint64_t sub_7A58()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 912LL);
  *(void *)(*(void *)v1 + 92[*(id *)(v0 + 16) donateInteractionWithCompletion:0] = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v5 = v2[62];
    uint64_t v4 = v2[63];
    uint64_t v7 = v2[57];
    uint64_t v6 = v2[58];
    swift_bridgeObjectRelease(v2[106]);
    sub_AFE4(v6, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v2[117] = v8;
    sub_AF6C(v4, v8);
  }

  else
  {
    uint64_t v10 = v2[62];
    uint64_t v9 = v2[63];
    (*(void (**)(void, void))(v2[57] + 8LL))(v2[58], v2[56]);
    sub_AF6C(v9, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  }

  sub_AED4();
  return swift_task_switch(v11, v12, v13);
}

uint64_t sub_7B28()
{
  uint64_t v1 = sub_B3DC();
  sub_B1DC(v1);
  sub_B40C();
  sub_B31C();
  uint64_t v2 = sub_AEC4();
  *(void *)(v0 + 928) = SinkDispatcherProvider.capture.getter(v2);
  sub_54BC(&qword_14710);
  unint64_t v3 = sub_A5D4();
  uint64_t v4 = sub_B400(v3);
  return swift_task_switch(sub_7BB8, v4, v5);
}

uint64_t sub_7BB8()
{
  return sub_AC70();
}

#error "7F20: call analysis failed (funcsize=230)"
#error "81D0: call analysis failed (funcsize=361)"
#error "8814: call analysis failed (funcsize=375)"
uint64_t sub_8BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void v15[2];
  uint64_t v6 = sub_54BC(&qword_14668);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for PresentationContext(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, a1);
  uint64_t v13 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(v8, a2, v13);
  sub_54FC((uint64_t)v8, 0LL, 1LL, v13);
  return PresentationContext.init(from:requestId:invokedBefore:)(v11, v8, a3);
}

void sub_8D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a4;
  sub_54BC(&qword_14650);
  sub_AEB4();
  __chkstk_darwin(v7);
  sub_5A8C();
  uint64_t v10 = v9 - v8;
  sub_54BC(&qword_14668);
  sub_AEB4();
  __chkstk_darwin(v11);
  sub_5A8C();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_B0C0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v29 - v20;
  UUID.init(uuidString:)(a2, a3);
  if (sub_55EC(v14, 1LL, v15) == 1)
  {
    sub_AA9C(v14, &qword_14668);
  }

  else
  {
    unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
    v22(v21, v14, v15);
    if (a1)
    {
      uint64_t v23 = type metadata accessor for TaskPriority(0LL);
      sub_5A2C(v10, v24, v25, v23);
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
      uint64_t v26 = *(unsigned __int8 *)(v16 + 80);
      uint64_t v27 = (v26 + 48) & ~v26;
      uint64_t v28 = (char *)swift_allocObject(&unk_10A60, v27 + v17, v26 | 7);
      *((void *)v28 + 2) = 0LL;
      *((void *)v28 + 3) = 0LL;
      *((void *)v28 + 4) = v30;
      *((void *)v28 + 5) = a1;
      v22(&v28[v27], (uint64_t)v19, v15);
      sub_AEE0();
      sub_B098(a1);
      sub_9540(v10, (uint64_t)&unk_14930, (uint64_t)v28);
      swift_release(a1);
      sub_AF74();
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  }

uint64_t sub_8F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[20] = a5;
  v6[21] = a6;
  v6[19] = a4;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v6[22] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[23] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[24] = swift_task_alloc(v9);
  v6[25] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for EducationalSuggestions(0LL);
  v6[26] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v6[27] = v11;
  v6[28] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for Action(0LL);
  v6[29] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v6[30] = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[31] = swift_task_alloc(v14);
  v6[32] = swift_task_alloc(v14);
  return swift_task_switch(sub_8FD4, 0LL, 0LL);
}

uint64_t sub_8FD4(uint64_t a1)
{
  if (!*(void *)(v1 + 152))
  {
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    goto LABEL_6;
  }

  uint64_t v2 = IntentProperties.intentProps.getter(a1);
  uint64_t v3 = static InteractionConstants.MentionedAppIdsKey.getter();
  sub_4EAC(v3, v4, v2, (_OWORD *)(v1 + 80));
  sub_B030();
  sub_B140();
  if (!*(void *)(v1 + 104))
  {
LABEL_6:
    sub_AA9C(v1 + 80, &qword_14938);
    goto LABEL_7;
  }

  uint64_t v5 = sub_54BC(&qword_14950);
  uint64_t v6 = sub_54BC(&qword_14958);
  if (swift_dynamicCast(v1 + 144, v1 + 80, v5, v6, 6LL))
  {
    uint64_t v7 = *(void **)(v1 + 144);
    goto LABEL_8;
  }

LABEL_7:
  uint64_t v7 = 0LL;
LABEL_8:
  uint64_t v8 = *(void *)(v1 + 216);
  uint64_t v9 = *(void *)(v1 + 224);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void, void))(v8 + 104))( v9,  enum case for EducationalSuggestions.suggestHelp(_:),  *(void *)(v1 + 208));
  uint64_t v11 = EducationalSuggestions.rawValue.getter(v10);
  uint64_t v13 = v12;
  sub_B270(v9, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  if (v7)
  {
    if (v7[2])
    {
      uint64_t v14 = v7[4];
      uint64_t v15 = v7[5];
      swift_bridgeObjectRetain(v15);
      sub_B508();
      uint64_t v16 = sub_54BC(&qword_14948);
      uint64_t inited = swift_initStackObject(v16, v1 + 16);
      *(_OWORD *)(inited + 16) = xmmword_DD30;
      type metadata accessor for ForegroundAppResolver(0LL);
      static ForegroundAppResolver.foregroundAppParamType.getter();
      uint64_t v18 = ResolvableParameter.typeIdentifier.getter();
      uint64_t v20 = v19;
      sub_AF74();
      *(void *)(inited + 32) = v18;
      *(void *)(inited + 40) = v20;
      *(void *)(inited + 48) = v14;
      *(void *)(inited + 56) = v15;
      uint64_t v21 = (void *)inited;
      goto LABEL_13;
    }

    sub_B508();
  }

  uint64_t v21 = &_swiftEmptyArrayStorage;
LABEL_13:
  uint64_t v22 = Dictionary.init(dictionaryLiteral:)( v21,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  uint64_t v24 = *(void *)(v1 + 248);
  uint64_t v23 = *(void *)(v1 + 256);
  uint64_t v25 = *(void *)(v1 + 240);
  uint64_t v26 = Action.init(actionId:params:)(v11, v13, v22);
  static Logger.flowCategory.getter(v26);
  uint64_t v27 = sub_B510(v24, v23, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16));
  uint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
  os_log_type_t v29 = static os_log_type_t.debug.getter();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v31 = *(void *)(v1 + 200);
  uint64_t v32 = *(void *)(v1 + 176);
  uint64_t v33 = *(void *)(v1 + 184);
  if (v30)
  {
    uint64_t v25 = v1 + 136;
    uint64_t v43 = *(void *)(v1 + 176);
    uint64_t v41 = *(void *)(v1 + 240);
    uint64_t v42 = *(void *)(v1 + 200);
    uint64_t v34 = (uint8_t *)sub_5A7C(12LL);
    uint64_t v35 = sub_5A7C(32LL);
    uint64_t v44 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v36 = Action.loggingId.getter();
    *(void *)(v1 + 136) = sub_9E20(v36, v37, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 136, v1 + 144, v34 + 4, v34 + 12);
    sub_B470();
    sub_B4F0(v41);
    sub_ADF4(&dword_0, v28, v29, "Submitting engagement for logging id: '%s'", v34);
    sub_AD98((uint64_t)&type metadata for Any);
    sub_5A20(v35);
    sub_5A20((uint64_t)v34);

    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v38(v42, v43);
  }

  else
  {
    sub_B4F0(*(void *)(v1 + 240));

    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v38(v31, v32);
  }

  *(void *)(v1 + 264) = v38;
  *(void *)(v1 + 272) = v25;
  uint64_t v39 = (void *)swift_task_alloc(async function pointer to SiriSuggestionsFacade.submitEngagement(for:with:)[1]);
  *(void *)(v1 + 280) = v39;
  *uint64_t v39 = v1;
  v39[1] = sub_9318;
  sub_B2C8();
  return SiriSuggestionsFacade.submitEngagement(for:with:)();
}

uint64_t sub_9318()
{
  uint64_t v3 = *(void *)(v2 + 280);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 288) = v0;
  swift_task_dealloc(v3);
  sub_AED4();
  return sub_AC70();
}

uint64_t sub_9368()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_93CC()
{
  uint64_t v2 = *(os_log_s **)(v0 + 288);
  (*(void (**)(void, void))(v0 + 272))(*(void *)(v0 + 256), *(void *)(v0 + 232));
  sub_B160();
  swift_errorRetain(v2);
  swift_errorRetain(v2);
  sub_B25C();
  os_log_type_t v3 = sub_AF64();
  if (sub_AD30(v3))
  {
    uint64_t v4 = *(void *)(v0 + 288);
    uint64_t v5 = (uint8_t *)sub_5A7C(12LL);
    uint64_t v6 = (void *)sub_5A7C(8LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain(v4);
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError(v4);
    *(void *)(v0 + 128) = v7;
    sub_B41C(v0 + 128, v0 + 136);
    *uint64_t v6 = v7;
    sub_5AF4();
    sub_5AF4();
    sub_ADF4(&dword_0, v2, v1, "Failed to submit engagement with Siri Help due to error: %@", v5);
    uint64_t v8 = sub_54BC(&qword_14940);
    sub_ADEC((uint64_t)v6, v9, v8);
    sub_5A20((uint64_t)v6);
    sub_5A20((uint64_t)v5);

    sub_5AF4();
  }

  else
  {
    sub_5AF4();
    sub_5AF4();
    sub_5AF4();
  }

  (*(void (**)(void, void))(v0 + 264))(*(void *)(v0 + 192), *(void *)(v0 + 176));
  sub_5A84();
  sub_5AA4();
  sub_5AFC();
  sub_5AE4();
  sub_5AB4();
  return sub_B028(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_9540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_55EC(a1, 1LL, v6) == 1)
  {
    sub_AA9C(a1, &qword_14650);
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

  uint64_t v15 = swift_allocObject(&unk_10A38, 32LL, 7LL);
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

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_14920, v15);
}

uint64_t sub_9684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = sub_B370();
  v5[7] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[8] = v7;
  v5[9] = sub_ACE0(v7);
  sub_AED4();
  return sub_AC70();
}

uint64_t sub_96D0()
{
  os_log_type_t v3 = (os_log_s *)v2[9];
  uint64_t v4 = sub_AD88();
  Logger.logObject.getter(v4);
  os_log_type_t v5 = sub_B430();
  if (sub_AE30(v5))
  {
    uint64_t v6 = (_WORD *)sub_5A7C(2LL);
    sub_B334(v6);
    sub_AD90(&dword_0, v3, v0, "No preGeneration suggestions found on intent. Executing suggestions service...", v1);
    sub_5A20((uint64_t)v1);
  }

  uint64_t v8 = v2[8];
  uint64_t v7 = v2[9];

  sub_AFEC(v7, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to SiriSuggestionsFacade.getNextSuggestions(requestId:intentProperties:)[1]);
  v2[10] = v9;
  void *v9 = v2;
  v9[1] = sub_9794;
  return SiriSuggestionsFacade.getNextSuggestions(requestId:intentProperties:)(v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_9794()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriSuggestionsFlow.execute(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  sub_5A2C(v3, v8, v9, v7);
  uint64_t v10 = (void *)sub_B484((uint64_t)&unk_10A10, 56LL);
  v10[2] = 0LL;
  v10[3] = 0LL;
  v10[4] = v2;
  v10[5] = a1;
  v10[6] = a2;
  sub_AEE0();
  sub_B224();
  uint64_t v11 = sub_9540(v3, (uint64_t)&unk_14730, (uint64_t)v10);
  return swift_release(v11);
}

uint64_t sub_9874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v7 = type metadata accessor for ExecuteResponse(0LL);
  v6[4] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[5] = v8;
  uint64_t v9 = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v6[6] = v9;
  uint64_t v10 = (void *)swift_task_alloc(dword_146CC);
  v6[7] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_98F4;
  return SiriSuggestionsFlow.execute()(v9);
}

uint64_t sub_98F4()
{
  return sub_AC70();
}

uint64_t sub_9928()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  (*(void (**)(uint64_t))(v0 + 16))(v1);
  sub_AFEC(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_5AA4();
  return sub_B028(*(uint64_t (**)(void))(v0 + 8));
}

void *SiriSuggestionsFlow.deinit()
{
  return v0;
}

uint64_t SiriSuggestionsFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t sub_99D0()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_99F0()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

void (*sub_9A10(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = SiriEnvironmentLocating<>.siriEnvironment.modify();
  return sub_9A70;
}

void sub_9A70(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t sub_9A9C(uint64_t a1)
{
  return SiriSuggestionsFlow.on(input:)(a1) & 1;
}

uint64_t sub_9AC0(uint64_t a1, uint64_t a2)
{
  return SiriSuggestionsFlow.execute(completion:)(a1, a2);
}

uint64_t sub_9AE0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_146CC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_5314;
  return SiriSuggestionsFlow.execute()(a1);
}

uint64_t sub_9B34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SiriSuggestionsFlow();
  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_9B58()
{
  uint64_t v1 = v14;
  if (v14)
  {
    uint64_t v2 = sub_B468(v13);
    uint64_t v3 = *(void *)(v1 - 8);
    __chkstk_darwin(v2);
    sub_5A8C();
    uint64_t v6 = v5 - v4;
    (*(void (**)(uint64_t))(v3 + 16))(v5 - v4);
    sub_AA9C((uint64_t)v13, &qword_14908);
    uint64_t v7 = sub_B008();
    dispatch thunk of SiriEnvironmentLocating.siriEnvironment.getter(v7);
    uint64_t v8 = sub_AF6C(v6, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    uint64_t v9 = SiriEnvironment.currentRequest.getter(v8);
    uint64_t v10 = sub_AFBC();
    uint64_t v1 = CurrentRequest.executionRequestId.getter(v10);
    swift_release(v9);
  }

  else
  {
    sub_AA9C((uint64_t)v13, &qword_14908);
  }

  return v1;
}

uint64_t sub_9C78()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t sub_9CA4()
{
  return sub_9B58();
}

uint64_t sub_9CC4(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_9CD4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_9D08(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_9D6C;
  return v6(a1);
}

uint64_t sub_9D6C()
{
  return sub_5A50(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_9D94(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_9DB4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  uint64_t v8 = sub_9E20(v6, v7, a3);
  uint64_t v9 = *a1;
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v9, v10);
  uint64_t result = sub_B030();
  *a1 = v10;
  return result;
}

uint64_t sub_9E20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v9 = sub_9EEC(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = (void *)swift_getObjectType(v9);
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_57A0((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_57A0((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_56E0(v15);
  return v10;
}

void *sub_9EEC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_A040((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_A104(a5, a6);
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

void *sub_A040(char *__src, size_t __n, char *__dst)
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

void *sub_A104(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_A198(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_A36C(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_A36C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_A198(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_A308(v4, 0LL);
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

void *sub_A308(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_54BC(&qword_14960);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_A36C(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_54BC(&qword_14960);
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
    sub_A504(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_A440(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_A440(char *__src, size_t __n, char *__dst)
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

char *sub_A504(char *__src, size_t __len, char *__dst)
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

_BYTE **sub_A584(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for SiriSuggestionsFlow()
{
  return objc_opt_self(&OBJC_CLASS____TtC25SiriSuggestionsFlowPlugin19SiriSuggestionsFlow);
}

uint64_t sub_A5B4(uint64_t a1)
{
  return sub_8BF8(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

unint64_t sub_A5D4()
{
  unint64_t result = qword_14718;
  if (!qword_14718)
  {
    uint64_t v1 = sub_A618(&qword_14710);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SinkCapture<A>, v1);
    atomic_store(result, (unint64_t *)&qword_14718);
  }

  return result;
}

uint64_t sub_A618(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_A65C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_A674()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_A6A4()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1472C);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_AEF8(v1);
  return sub_9874(v2, v3, v4, v5, v6, v7);
}

void sub_A708(uint64_t a1, uint64_t a2)
{
}

void sub_A734(uint64_t a1, uint64_t a2)
{
}

uint64_t type metadata accessor for EnvironmentRequestIdProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC25SiriSuggestionsFlowPlugin28EnvironmentRequestIdProvider);
}

void sub_A780(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_54BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_B0B0();
}

void *sub_A7C0(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

void sub_A7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  sub_B0B0();
}

uint64_t sub_A83C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

void sub_A84C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  if (!*a1)
  {
    uint64_t v6 = a3(a2);
    atomic_store(swift_getWitnessTable(a4, v6), a1);
  }

  sub_B0B0();
}

uint64_t sub_A888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_54BC(&qword_14908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_54BC(&qword_14908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A918()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_A93C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1491C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_55C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_14918 + dword_14918))(a1, v4);
}

uint64_t sub_A9AC()
{
  uint64_t v1 = *(void *)(sub_B0C0() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  sub_B378();
  swift_release(*(void *)(v0 + 40));
  sub_AF6C(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject(v0, v4, v5);
}

uint64_t sub_AA24()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1492C);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_AEF8(v1);
  return sub_8F00(v2, v3, v4, v5, v6, v7);
}

void sub_AA9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_54BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_B0B0();
}

uint64_t sub_AADC()
{
  uint64_t v2 = v0[101];
  uint64_t v3 = v0[55];
  *(void *)(v1 - 160) = v0[58];
  *(void *)(v1 - 152) = v3;
  uint64_t v4 = v0[49];
  *(void *)(v1 - 144) = v0[52];
  *(void *)(v1 - 136) = v4;
  uint64_t v5 = v0[47];
  *(void *)(v1 - 128) = v0[48];
  *(void *)(v1 - 120) = v5;
  uint64_t v6 = v0[44];
  *(void *)(v1 - 112) = v0[46];
  *(void *)(v1 - 104) = v6;
  *(void *)(v1 - 96) = v0[42];
  return swift_task_dealloc(v2);
}

uint64_t sub_ABC4()
{
  return *(void *)(v0 + 808);
}

uint64_t sub_AC68()
{
  return swift_task_alloc(v0);
}

uint64_t sub_AC70()
{
  return swift_task_switch();
}

void sub_AC7C()
{
  uint64_t v3 = v0[103];
  uint64_t v4 = v0[102];
  *(void *)(v2 - 128) = v0[101];
  *(void *)(v2 - 120) = v4;
  *(void *)(v2 - 112) = v0[100];
  *(void *)(v2 - 104) = v3;
  *(void *)(v2 - 96) = v0[99];
  uint64_t v5 = v0[84];
  *(void *)(v2 - 152) = v0[82];
  *(void *)(v2 - 144) = v0[81];
  *(void *)(v2 - 136) = v5;
}

uint64_t sub_ACD0(uint64_t a1)
{
  *(void *)(v2 - 8) = *v1;
  return swift_task_dealloc(a1);
}

uint64_t sub_ACE0@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_ACF0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_AD0C()
{
  return static Logger.end(_:_:log:telemetry:)(v4, v1, v0, v2, v3, 1LL);
}

uint64_t sub_AD28()
{
  return swift_errorRelease(v0);
}

BOOL sub_AD30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_AD40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[104];
  *(void *)(v3 - 104) = v2[88];
  *(void *)(v3 - 96) = v4;
  *(void *)(v3 - 112) = v2[85];
  uint64_t v5 = v2[45];
  uint64_t v6 = v2[46];
  sub_54FC(v6, a2, 1LL, v2[53]);
  return String.init<A>(describing:)(v6, v5);
}

uint64_t sub_AD88()
{
  return static Logger.flowCategory.getter();
}

void sub_AD90(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_AD98@<X0>(uint64_t a1@<X8>)
{
  return swift_arrayDestroy(v1, 1LL, a1 + 8);
}

uint64_t sub_ADA8(uint64_t a1, uint64_t a2)
{
  return static Logger.end(_:_:log:telemetry:)(a1, a2, v2, v3, v4, 1LL);
}

uint64_t sub_ADBC()
{
  *(void *)(v1 - 96) = *(void *)(v0 + 792);
  return static ExecuteResponse.complete()();
}

uint64_t sub_ADEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_arrayDestroy(a1, 1LL, a3);
}

void sub_ADF4(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_ADFC()
{
  return swift_errorRetain(v0);
}

uint64_t sub_AE04()
{
  return static ExecuteResponse.complete()();
}

BOOL sub_AE30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_AE40()
{
  return static Logger.log.getter();
}

uint64_t sub_AE50(uint64_t a1)
{
  return sub_55EC(a1, 1LL, v1);
}

uint64_t sub_AE6C()
{
  return (*(uint64_t (**)(void, uint64_t, void))(v1[54] + 32LL))(v1[55], v0, v1[53]);
}

uint64_t sub_AE94()
{
  return swift_retain(*(void *)(*(void *)(v0 + 312) + 16LL));
}

  ;
}

uint64_t sub_AEC4()
{
  return swift_release(v0);
}

void sub_AECC(uint64_t a1)
{
}

  ;
}

uint64_t sub_AEE0()
{
  return swift_retain(v0);
}

uint64_t sub_AEE8()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 152) + 8LL))( *(void *)(v0 - 136),  *(void *)(v0 - 144));
}

uint64_t sub_AEF8(void *a1)
{
  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_AF1C(uint64_t a1, uint64_t a2)
{
  return sub_54FC(*(void *)(v2 + 392), a2, 1LL, *(void *)(v2 + 424));
}

BOOL sub_AF38(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_AF40()
{
  return (*(uint64_t (**)(void, void))(v0 - 96))(*(void *)(v0 - 104), *(void *)(v0 - 112));
}

uint64_t sub_AF4C(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

uint64_t sub_AF58()
{
  return static Logger.log.getter();
}

uint64_t sub_AF64()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_AF6C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_AF74()
{
  return swift_release(v0);
}

void sub_AF7C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_AF84(uint64_t a1)
{
  return swift_release_n(a1, 2LL);
}

void sub_AF8C(uint64_t a1)
{
}

void sub_AF94()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_AFA4(uint64_t a1)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v3, v1, v2, a1);
}

uint64_t sub_AFBC()
{
  return swift_release(v0);
}

uint64_t sub_AFC4()
{
  return swift_errorRelease(*(void *)(v0 + 256));
}

uint64_t sub_AFCC(uint64_t a1)
{
  *(void *)(v2 + 224) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v1, v2 + 232, v4, v3 + 12);
}

uint64_t sub_AFE4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_AFEC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_AFF4(uint64_t a1)
{
  *uint64_t v1 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v1, *(void *)(v3 - 120), *(void *)(v3 - 128), v2);
}

uint64_t sub_B008()
{
  return v0;
}

uint64_t sub_B014()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_B028(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_B030()
{
  return swift_bridgeObjectRelease(v0);
}

BOOL sub_B038(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

uint64_t sub_B064()
{
  return swift_task_dealloc(*(void *)(v0 - 120));
}

  ;
}

  ;
}

uint64_t sub_B090()
{
  return swift_task_dealloc(*(void *)(v0 - 128));
}

uint64_t sub_B098(uint64_t a1)
{
  return swift_retain_n(a1, 2LL);
}

uint64_t sub_B0A0()
{
  return swift_task_dealloc(*(void *)(v0 - 136));
}

uint64_t sub_B0A8()
{
  return swift_task_dealloc(*(void *)(v0 - 152));
}

  ;
}

uint64_t sub_B0B8()
{
  return swift_task_dealloc(*(void *)(v0 - 160));
}

uint64_t sub_B0C0()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_B0C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
  return swift_task_dealloc(a30);
}

uint64_t sub_B0D0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104))(v4, a2, v3);
}

uint64_t sub_B0E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29)
{
  return swift_task_dealloc(a29);
}

uint64_t sub_B0E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  return swift_task_dealloc(a28);
}

uint64_t sub_B0F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  return swift_task_dealloc(a27);
}

uint64_t sub_B0F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  return swift_task_dealloc(a26);
}

uint64_t sub_B100( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  return swift_task_dealloc(a25);
}

void sub_B108(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_B110( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  return swift_task_dealloc(a24);
}

uint64_t sub_B118( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  return swift_task_dealloc(a23);
}

uint64_t sub_B120( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  return swift_task_dealloc(a22);
}

uint64_t sub_B128( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  return swift_task_dealloc(a21);
}

void sub_B130()
{
}

uint64_t sub_B140()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_B148( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  return swift_task_dealloc(a20);
}

uint64_t sub_B150( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return swift_task_dealloc(a19);
}

uint64_t sub_B158( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return swift_task_dealloc(a18);
}

uint64_t sub_B160()
{
  return static Logger.flowCategory.getter();
}

uint64_t sub_B168( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return swift_task_dealloc(a17);
}

uint64_t sub_B170( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return swift_task_dealloc(a16);
}

uint64_t sub_B178( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return swift_task_dealloc(a15);
}

uint64_t sub_B180()
{
  return swift_task_dealloc(*(void *)(v0 - 144));
}

uint64_t sub_B188( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return swift_task_dealloc(a14);
}

uint64_t sub_B190()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_B1A0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_B1B0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

  ;
}

void sub_B1DC(uint64_t a1)
{
}

uint64_t sub_B1EC(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v4 - 104, a2, v3, v2);
}

uint64_t sub_B1FC(uint64_t a1)
{
  return String.init<A>(describing:)(v1 - 104, a1);
}

BOOL sub_B20C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_B21C()
{
  return swift_release(v0);
}

uint64_t sub_B224()
{
  return swift_retain(v0);
}

uint64_t sub_B22C(uint64_t a1, unint64_t a2)
{
  return sub_9E20(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_B234()
{
  return (*(uint64_t (**)(void, void))(v0[51] + 88LL))(v0[52], v0[50]);
}

uint64_t sub_B244()
{
  return (*(uint64_t (**)(void, void))(v0[51] + 8LL))(v0[52], v0[50]);
}

void sub_B254(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_B25C()
{
  return Logger.logObject.getter();
}

_WORD *sub_B264(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_B270@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_B278()
{
  return v0;
}

uint64_t sub_B288(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_B290(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v2, a2, v3);
}

uint64_t sub_B2A0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_B2B0()
{
  return swift_task_dealloc(*(void *)(v0 - 104));
}

uint64_t sub_B2B8()
{
  return swift_release(*(void *)(v0 - 104));
}

uint64_t sub_B2C0()
{
  return swift_task_dealloc(*(void *)(v0 - 112));
}

  ;
}

void sub_B2E4()
{
}

uint64_t sub_B2F4()
{
  return sub_54FC(v1, 0LL, 1LL, v0);
}

uint64_t sub_B31C()
{
  return swift_release(v0);
}

uint64_t sub_B324(uint64_t a1, uint64_t a2)
{
  return swift_dynamicCast(a1, a2, v3, v2, 0LL);
}

_WORD *sub_B334(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_B340()
{
  return *(void *)(v0 + 552);
}

uint64_t sub_B354()
{
  return swift_release(*(void *)(v0 - 120));
}

  ;
}

uint64_t sub_B370()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_B378()
{
  return swift_release(*(void *)(v0 + 32));
}

uint64_t sub_B380()
{
  return PresentationContext.invocationType.getter();
}

uint64_t sub_B38C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_B3A0()
{
  return v0(v1, v2);
}

uint64_t sub_B3AC()
{
  return String.init<A>(describing:)(v0, v1);
}

uint64_t sub_B3B8()
{
  return sub_55EC(v0, 1LL, v1);
}

uint64_t sub_B3DC()
{
  return swift_retain(v0);
}

  ;
}

uint64_t sub_B3F8(uint64_t a1, unint64_t a2)
{
  return sub_9E20(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t sub_B400(uint64_t a1)
{
  return dispatch thunk of Actor.unownedExecutor.getter(v1, a1);
}

uint64_t sub_B40C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_B414()
{
  return swift_retain(v0);
}

uint64_t sub_B41C(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v3, v2);
}

uint64_t sub_B428()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_B430()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_B438()
{
  return v0(v2, v1);
}

uint64_t sub_B444()
{
  return sub_55EC(v0, 1LL, v1);
}

void *sub_B468(void *a1)
{
  return sub_56BC(a1, v1);
}

uint64_t sub_B470()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_B478()
{
  return dispatch thunk of RawRepresentable.rawValue.getter(v1, v0);
}

uint64_t sub_B484(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_B48C()
{
  return PresentationContext.invocationType.getter();
}

void sub_B498(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_B4A4()
{
  return v2(v1, v0);
}

void sub_B4B0(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
}

uint64_t sub_B4B8()
{
  return v2(v0, v1);
}

uint64_t sub_B4C4()
{
  return sub_55EC(v1, 1LL, v0);
}

uint64_t sub_B4E8()
{
  return swift_task_dealloc(*(void *)(v0 - 96));
}

uint64_t sub_B4F0@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_B4FC()
{
  return static ExecuteResponse.unhandled(reason:)(v0);
}

uint64_t sub_B508()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_B510@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_B518@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ResponseFactory(0LL);
  sub_AF4C(v2);
  v5[3] = v2;
  v5[4] = &protocol witness table for ResponseFactory;
  v5[0] = ResponseFactory.init()();
  uint64_t v3 = type metadata accessor for PatternFlowProvider(0LL);
  sub_AF4C(v3);
  uint64_t result = PatternFlowProvider.init(outputPublisher:responseGenerator:)(v6, v5);
  a1[3] = v3;
  a1[4] = (uint64_t)&protocol witness table for PatternFlowProvider;
  *a1 = result;
  return result;
}

void *SiriSuggestionsFlowPlugin.__allocating_init()()
{
  uint64_t v0 = type metadata accessor for OSFeatureFlagProvider(0LL);
  uint64_t v1 = OSFeatureFlagProvider.__allocating_init()();
  type metadata accessor for SiriSuggestionsFacade(0LL);
  void v4[3] = v0;
  v4[4] = &protocol witness table for OSFeatureFlagProvider;
  v4[0] = v1;
  sub_B224();
  uint64_t v2 = SiriSuggestionsFacade.__allocating_init(flagProvider:)(v4);
  return sub_CD94(v1, v2, 0LL);
}

void *sub_B630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_retain(a1);
  return sub_5B20(v4, a2);
}

void sub_B688(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v84 = a1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v86 = *(void *)(v3 - 8);
  uint64_t v87 = v3;
  sub_D0CC();
  __chkstk_darwin(v4);
  sub_B35C();
  uint64_t v85 = v5;
  sub_B06C();
  __chkstk_darwin(v6);
  uint64_t v80 = (char *)&v77 - v7;
  sub_B06C();
  __chkstk_darwin(v8);
  uint64_t v83 = (char *)&v77 - v9;
  sub_B06C();
  __chkstk_darwin(v10);
  uint64_t v79 = (char *)&v77 - v11;
  sub_54BC(&qword_146B0);
  sub_D0CC();
  __chkstk_darwin(v12);
  sub_D0A4();
  uint64_t v82 = v13;
  uint64_t v81 = type metadata accessor for PresentationContext(0LL);
  uint64_t v14 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  sub_5A8C();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = v1 + 5;
  uint64_t v20 = v1[8];
  uint64_t v19 = v1[9];
  sub_56BC(v1 + 5, v20);
  type metadata accessor for SiriEnvironment(0LL);
  uint64_t v21 = static SiriEnvironment.default.getter();
  uint64_t v22 = SiriEnvironment.currentDevice.getter();
  swift_release(v21);
  LOBYTE(v21) = dispatch thunk of FeatureFlagProvider.isSiriHelpEnabled(device:)(v22, v20, v19);
  uint64_t v23 = swift_release(v22);
  if ((v21 & 1) == 0)
  {
    uint64_t v46 = static Logger.flowCategory.getter(v23);
    uint64_t v47 = (void *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.debug.getter();
    if (sub_D0E8(v48))
    {
      uint64_t v49 = (_WORD *)sub_D078();
      *uint64_t v49 = 0;
      sub_D0B8(&dword_0, v50, v51, "SiriHelp feature flag NOT enabled");
      sub_5A20((uint64_t)v49);
    }

    sub_D204(v86);
    uint64_t v52 = sub_D14C();
    sub_AF4C(v52);
    uint64_t v89 = sub_D134();
    sub_D144(&qword_14970, v53, (uint64_t)&protocol conformance descriptor for NoOpFlow);
    sub_D154(v54);
    sub_AEC4();
    goto LABEL_26;
  }

  uint64_t v24 = v81;
  uint64_t v25 = v82;
  uint64_t v26 = v84;
  uint64_t v77 = v14;
  uint64_t v78 = v17;
  uint64_t v27 = (void *)v2[8];
  uint64_t v28 = v2[9];
  uint64_t v85 = v2;
  sub_56BC(v18, (uint64_t)v27);
  uint64_t v29 = dispatch thunk of FeatureFlagProvider.isSMARTEnabled()(v27, v28);
  uint64_t v30 = v87;
  uint64_t v31 = v88;
  uint64_t v32 = v83;
  if ((v29 & 1) == 0)
  {
    if (v26)
    {
      IntentProperties.presentationContext.getter(v29);
      if (sub_55EC(v25, 1LL, v24) != 1)
      {
        uint64_t v34 = v77;
        uint64_t v33 = v78;
        uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v78, v25, v24);
        if ((PresentationContext.displayAllSuggestions.getter(v35) & 1) != 0)
        {
          uint64_t v27 = (void *)v85[2];
          if (v27)
          {
            uint64_t v36 = sub_B224();
            unint64_t v37 = v79;
            uint64_t v38 = static Logger.flowCategory.getter(v36);
            uint64_t v39 = (void *)Logger.logObject.getter(v38);
            os_log_type_t v40 = static os_log_type_t.debug.getter();
            if (sub_D0E8(v40))
            {
              uint64_t v41 = (_WORD *)sub_D078();
              *uint64_t v41 = 0;
              sub_D0B8(&dword_0, v42, v43, "See more request. Using previous request flow");
              uint64_t v44 = (uint64_t)v41;
              uint64_t v34 = v77;
              sub_5A20(v44);
            }

            (*(void (**)(char *, uint64_t))(v86 + 8))(v37, v30);
            uint64_t v89 = (uint64_t)v27;
            sub_D1E0();
            sub_CFE4( qword_14738,  (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsFlow);
            sub_D164(v45);
            (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v78, v24);
            goto LABEL_21;
          }
        }

        uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v33, v24);
        goto LABEL_16;
      }
    }

    else
    {
      sub_54FC(v25, 1LL, 1LL, v24);
    }

    sub_AA9C(v25, &qword_146B0);
  }

LABEL_16:
  uint64_t v55 = static Logger.flowCategory.getter(v29);
  Logger.logObject.getter(v55);
  os_log_type_t v56 = sub_D17C();
  if (sub_D094(v56))
  {
    uint64_t v57 = (_WORD *)sub_D078();
    sub_D1F8(v57);
    sub_D064(&dword_0, v58, v59, "Normal flow request. Creating new flow from factory");
    sub_5A20(v30);
  }

  uint64_t v60 = *(uint64_t (**)(char *, uint64_t))(v86 + 8);
  uint64_t v61 = v60(v32, v30);
  uint64_t v62 = v85;
  uint64_t v63 = ((uint64_t (*)(uint64_t))v85[3])(v61);
  if (!v31)
  {
    uint64_t v27 = (void *)v63;
    if (!v63)
    {
      uint64_t v67 = v80;
      uint64_t v68 = static Logger.flowCategory.getter(0LL);
      Logger.logObject.getter(v68);
      os_log_type_t v69 = sub_D17C();
      if (sub_D094(v69))
      {
        uint64_t v70 = (_WORD *)sub_D078();
        sub_D1F8(v70);
        sub_D064(&dword_0, v71, v72, "No flow could be constructed");
        sub_5A20(v30);
      }

      v60(v67, v30);
      uint64_t v73 = sub_D14C();
      sub_AF4C(v73);
      uint64_t v74 = sub_D134();
      uint64_t v89 = v74;
      sub_D144(&qword_14970, v75, (uint64_t)&protocol conformance descriptor for NoOpFlow);
      sub_D154(v76);
      uint64_t v66 = v74;
      goto LABEL_25;
    }

    uint64_t v64 = v62[2];
    v62[2] = v63;
    sub_B224();
    swift_release(v64);
    uint64_t v89 = (uint64_t)v27;
    sub_D1E0();
    sub_CFE4( qword_14738,  (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsFlow);
    sub_D164(v65);
LABEL_21:
    uint64_t v66 = (uint64_t)v27;
LABEL_25:
    swift_release(v66);
  }

LABEL_26:
  sub_D110();
}

void SiriSuggestionsFlowPlugin.makeFlowFor(parse:)(uint64_t a1)
{
  void (*v32)(uint64_t *__return_ptr, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v79 = a1;
  uint64_t v74 = type metadata accessor for InvocationType(0LL);
  uint64_t v76 = *(void *)(v74 - 8);
  sub_D0CC();
  __chkstk_darwin(v3);
  sub_D0A4();
  uint64_t v68 = v4;
  uint64_t v71 = sub_54BC(&qword_146D0);
  sub_D0CC();
  __chkstk_darwin(v5);
  sub_D0A4();
  uint64_t v73 = v6;
  sub_54BC(&qword_146B0);
  sub_D0CC();
  __chkstk_darwin(v7);
  sub_D0A4();
  uint64_t v70 = v8;
  sub_54BC(&qword_146D8);
  sub_D0CC();
  __chkstk_darwin(v9);
  sub_B35C();
  os_log_type_t v69 = v10;
  sub_B06C();
  __chkstk_darwin(v11);
  uint64_t v72 = (char *)&v67 - v12;
  sub_B06C();
  __chkstk_darwin(v13);
  uint64_t v75 = (uint64_t)&v67 - v14;
  uint64_t v15 = sub_54BC(&qword_14968);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  sub_D194();
  uint64_t v17 = type metadata accessor for USOParse(0LL);
  uint64_t v77 = *(void *)(v17 - 8);
  uint64_t v78 = v17;
  sub_D0CC();
  __chkstk_darwin(v18);
  sub_D0A4();
  uint64_t v20 = v19;
  uint64_t v21 = type metadata accessor for Parse.DirectInvocation(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  sub_5A8C();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = type metadata accessor for Parse(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  sub_D1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v2, v79, v26);
  int v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 88))(v2, v26);
  if (v28 != enum case for Parse.directInvocation(_:))
  {
    if (v28 != enum case for Parse.uso(_:))
    {
      uint64_t v35 = sub_D14C();
      sub_AF4C(v35);
      uint64_t v80 = sub_D134();
      sub_D240(&qword_14970, v36, (uint64_t)&protocol conformance descriptor for NoOpFlow);
      sub_D0D8(v37);
      sub_D128();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v2, v26);
      goto LABEL_24;
    }

    sub_D184();
    uint64_t v29 = v77;
    uint64_t v30 = v20;
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v20, v2, v78);
    static Transformer<>.usoToProperties.getter(v31);
    uint64_t v32 = (void (*)(uint64_t *__return_ptr, uint64_t))Transformer.transform.getter(v15);
    uint64_t v34 = v33;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v1, v15);
    v32(&v80, v20);
    swift_release(v34);
    uint64_t v38 = v80;
    uint64_t v79 = v80;
    if (v80)
    {
      uint64_t v39 = swift_retain(v80);
      os_log_type_t v40 = v70;
      IntentProperties.presentationContext.getter(v39);
      swift_release(v38);
      uint64_t v41 = type metadata accessor for PresentationContext(0LL);
      uint64_t v42 = sub_55EC(v40, 1LL, v41);
      uint64_t v44 = v73;
      uint64_t v43 = v74;
      uint64_t v45 = v76;
      if (v42 != 1)
      {
        os_log_type_t v48 = v40;
        uint64_t v49 = v75;
        PresentationContext.invocationType.getter();
        uint64_t v50 = *(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8LL);
        uint64_t v51 = v41;
        uint64_t v47 = v49;
        v50(v48, v51);
        uint64_t v46 = 0LL;
LABEL_12:
        uint64_t v53 = v71;
        uint64_t v52 = (uint64_t)v72;
        sub_D234(v47, v46);
        (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))( v52,  enum case for InvocationType.siriHelp(_:),  v43);
        sub_D234(v52, 0LL);
        uint64_t v54 = v44 + *(int *)(v53 + 48);
        sub_A780(v47, v44, &qword_146D8);
        sub_A780(v52, v54, &qword_146D8);
        sub_D1C4(v44);
        if (v57)
        {
          sub_D13C(v52);
          sub_D13C(v47);
          sub_D1C4(v54);
          if (v57)
          {
            sub_AA9C(v44, &qword_146D8);
            uint64_t v55 = v79;
LABEL_22:
            sub_B688(v55);
            sub_D1E8();
            sub_AEC4();
            goto LABEL_24;
          }
        }

        else
        {
          os_log_type_t v56 = v69;
          sub_A780(v44, v69, &qword_146D8);
          sub_D1C4(v54);
          if (!v57)
          {
            uint64_t v58 = v76;
            uint64_t v59 = v56;
            uint64_t v60 = v68;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 32))(v68, v54, v43);
            sub_CFE4( &qword_146F8,  (uint64_t (*)(uint64_t))&type metadata accessor for InvocationType,  (uint64_t)&protocol conformance descriptor for InvocationType);
            LODWORD(v74) = dispatch thunk of static Equatable.== infix(_:_:)(v59, v60, v43, v61);
            uint64_t v62 = v52;
            uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
            v63(v60, v43);
            sub_D13C(v62);
            sub_D13C(v75);
            v63(v59, v43);
            sub_D13C(v44);
            uint64_t v55 = v79;
            if ((v74 & 1) != 0) {
              goto LABEL_22;
            }
LABEL_23:
            uint64_t v64 = sub_D14C();
            sub_AF4C(v64);
            uint64_t v80 = sub_D134();
            sub_D240(&qword_14970, v65, (uint64_t)&protocol conformance descriptor for NoOpFlow);
            sub_D0D8(v66);
            sub_D128();
            sub_AEC4();
            (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v78);
            goto LABEL_24;
          }

          sub_AA9C(v52, &qword_146D8);
          sub_AA9C(v47, &qword_146D8);
          (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v56, v43);
        }

        sub_AA9C(v44, &qword_146D0);
        goto LABEL_23;
      }

      sub_AA9C(v40, &qword_146B0);
      uint64_t v46 = 1LL;
    }

    else
    {
      uint64_t v46 = 1LL;
      uint64_t v44 = v73;
      uint64_t v43 = v74;
      uint64_t v45 = v76;
    }

    uint64_t v47 = v75;
    goto LABEL_12;
  }

  sub_D184();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v25, v2, v21);
  sub_C39C();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
LABEL_24:
  sub_D0F8();
}

void sub_C1C4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_D194();
  static Logger.flowCategory.getter(v5);
  sub_D218();
  uint64_t v6 = sub_D218();
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v18 = v3;
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = a1;
    uint64_t v20 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_D218();
    uint64_t v11 = sub_54BC(&qword_14690);
    uint64_t v12 = String.init<A>(describing:)(&v19, v11);
    unint64_t v14 = v13;
    uint64_t v19 = sub_9E20(v12, v13, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v14);
    sub_D174();
    sub_D174();
    _os_log_impl(&dword_0, v7, v8, "Unable to obtain suggestions client: %s. Returning no op flow", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    sub_5A20(v10);
    sub_5A20((uint64_t)v9);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v18);
  }

  else
  {
    sub_D174();
    sub_D174();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  }

  uint64_t v15 = sub_D14C();
  sub_AF4C(v15);
  uint64_t v20 = sub_D134();
  sub_D240(&qword_14970, v16, (uint64_t)&protocol conformance descriptor for NoOpFlow);
  sub_D0D8(v17);
  sub_D128();
  sub_D0F8();
}

void sub_C39C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v101 = *(void *)(v0 - 8);
  uint64_t v102 = v0;
  sub_D0CC();
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v97 - v4;
  uint64_t v6 = __chkstk_darwin(v3);
  os_log_type_t v8 = (char *)&v97 - v7;
  __chkstk_darwin(v6);
  uint64_t v98 = (char *)&v97 - v9;
  sub_B06C();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v97 - v11;
  sub_54BC(&qword_14A68);
  sub_D0CC();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v100 = (char *)&v97 - v17;
  uint64_t v18 = type metadata accessor for DirectInvocationUserDataKey(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  sub_5A8C();
  uint64_t v22 = v21 - v20;
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))( v21 - v20,  enum case for DirectInvocationUserDataKey.action(_:),  v18);
  Parse.DirectInvocation.getUserData(for:)(v105, v22);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v18);
  if (v105[3])
  {
    uint64_t v23 = swift_dynamicCast(&v103, v105, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
    if ((v23 & 1) != 0)
    {
      uint64_t v25 = v103;
      unint64_t v24 = v104;
      sub_D220();
      uint64_t v26 = (uint64_t)v100;
      DirectInvocationAction.init(rawValue:)(v25, v24);
      uint64_t v27 = type metadata accessor for DirectInvocationAction(0LL);
      uint64_t v28 = sub_55EC(v26, 1LL, v27);
      if ((_DWORD)v28 == 1)
      {
LABEL_4:
        static Logger.flowCategory.getter(v28);
        uint64_t v29 = sub_D220();
        uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
        os_log_type_t v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v33 = swift_slowAlloc(32LL, -1LL);
          sub_D228(v33);
          *(_DWORD *)uint64_t v32 = 136315138;
          sub_D220();
          uint64_t v103 = sub_9E20(v25, v24, v105);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v103, &v104, v32 + 4, v32 + 12);
          swift_bridgeObjectRelease_n(v24, 3LL);
          _os_log_impl(&dword_0, v30, v31, "Unsupported direct invocation action: %s. Returning no op flow", v32, 0xCu);
          swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
          sub_5A20(v22);
          sub_5A20((uint64_t)v32);
        }

        else
        {

          swift_bridgeObjectRelease_n(v24, 2LL);
        }

        (*(void (**)(char *, uint64_t))(v101 + 8))(v5, v102);
        uint64_t v55 = sub_D14C();
        sub_AF4C(v55);
        uint64_t v56 = sub_D134();
        sub_D228(v56);
        sub_D144(&qword_14970, v57, (uint64_t)&protocol conformance descriptor for NoOpFlow);
        sub_D084(v58);
        sub_AEC4();
        uint64_t v54 = (uint64_t)v100;
        goto LABEL_14;
      }

      sub_A780(v26, (uint64_t)v16, &qword_14A68);
      uint64_t v22 = *(void *)(v27 - 8);
      int v44 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v16, v27);
      if (v44 == enum case for DirectInvocationAction.executeSuggestion(_:))
      {
        sub_B40C();
        uint64_t v45 = type metadata accessor for DefaultACECommandSuggestionDispatcherFactory(0LL);
        sub_AF4C(v45);
        uint64_t v46 = DefaultACECommandSuggestionDispatcherFactory.init()();
        uint64_t v47 = type metadata accessor for SiriSuggestionsInvocationFlow(0LL);
        uint64_t v48 = sub_AF4C(v47);
        uint64_t v49 = (uint64_t *)(v48
                        + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory);
        v49[3] = v45;
        v49[4] = (uint64_t)&protocol witness table for DefaultACECommandSuggestionDispatcherFactory;
        *uint64_t v49 = v46;
        uint64_t v50 = v48 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation;
        uint64_t v51 = type metadata accessor for Parse.DirectInvocation(0LL);
        sub_54FC(v50, 1LL, 1LL, v51);
        uint64_t v52 = (void *)(v48
                       + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_interactionDonator);
        *uint64_t v52 = &unk_146A0;
        v52[1] = 0LL;
        v105[0] = v48;
        sub_CFE4(&qword_14A70, type metadata accessor for SiriSuggestionsInvocationFlow, (uint64_t)&unk_DCC8);
        Flow.eraseToAnyFlow()(v47, v53);
        swift_release(v48);
        uint64_t v54 = v26;
LABEL_14:
        sub_AA9C(v54, &qword_14A68);
        goto LABEL_15;
      }

      if (v44 == enum case for DirectInvocationAction.showSiriHelp(_:))
      {
        sub_B40C();
        sub_B688(0LL);
LABEL_18:
        sub_D210(v59, &qword_14A68);
        goto LABEL_15;
      }

      if (v44 == enum case for DirectInvocationAction.showMoreSuggestions(_:))
      {
        sub_B40C();
        uint64_t v60 = v99;
        uint64_t v61 = v99[8];
        uint64_t v62 = v99[9];
        sub_56BC(v99 + 5, v61);
        uint64_t v59 = dispatch thunk of FeatureFlagProvider.isSMARTEnabled()(v61, v62);
        if ((v59 & 1) == 0) {
          goto LABEL_46;
        }
        uint64_t v63 = v106;
        uint64_t v59 = ((uint64_t (*)(void))v60[3])();
        if (v63) {
          goto LABEL_18;
        }
        uint64_t v62 = v59;
        if (!v59)
        {
LABEL_46:
          if (v60[2])
          {
            v105[0] = v60[2];
            sub_D1E0();
            sub_CFE4( qword_14738,  (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsFlow);
            uint64_t v59 = sub_D084(v74);
            goto LABEL_18;
          }

          uint64_t v80 = static Logger.flowCategory.getter(v59);
          uint64_t v81 = (void *)Logger.logObject.getter(v80);
          os_log_type_t v82 = static os_log_type_t.error.getter();
          if (sub_D094(v82))
          {
            uint64_t v83 = (_WORD *)sub_D078();
            sub_D1F8(v83);
            sub_D064(&dword_0, v84, v85, "No current suggestions flow. Returning no op flow");
            sub_5A20(v62);
          }

          (*(void (**)(char *, uint64_t))(v101 + 8))(v12, v102);
          goto LABEL_37;
        }

LABEL_39:
        v105[0] = v62;
        sub_D1E0();
        sub_CFE4( qword_14738,  (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow,  (uint64_t)&protocol conformance descriptor for SiriSuggestionsFlow);
        sub_D084(v91);
        uint64_t v90 = (void *)v62;
        goto LABEL_40;
      }

      if (v44 != enum case for DirectInvocationAction.conversationGetSuggestions(_:))
      {
        uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v16, v27);
        goto LABEL_4;
      }

      sub_B40C();
      uint64_t v64 = v99;
      uint64_t v65 = v99[8];
      uint64_t v66 = v99[9];
      uint64_t v60 = sub_56BC(v99 + 5, v65);
      type metadata accessor for SiriEnvironment(0LL);
      uint64_t v67 = static SiriEnvironment.default.getter();
      uint64_t v68 = SiriEnvironment.currentDevice.getter();
      swift_release(v67);
      uint64_t v69 = dispatch thunk of FeatureFlagProvider.isContinuersEnabled(device:)(v68, v65, v66);
      uint64_t v70 = swift_release(v68);
      if ((v69 & 1) != 0)
      {
        uint64_t v71 = v106;
        uint64_t v72 = ((uint64_t (*)(uint64_t))v64[3])(v70);
        if (v71)
        {
          sub_C1C4(v71);
          uint64_t v73 = swift_errorRelease(v71);
          sub_D210(v73, &qword_14A68);
          goto LABEL_15;
        }

        uint64_t v62 = v72;
        if (v72) {
          goto LABEL_39;
        }
        uint64_t v60 = v98;
        uint64_t v92 = static Logger.flowCategory.getter(0LL);
        Logger.logObject.getter(v92);
        os_log_type_t v93 = sub_D17C();
        if (sub_D094(v93))
        {
          uint64_t v94 = (_WORD *)sub_D078();
          sub_D1F8(v94);
          sub_D064(&dword_0, v95, v96, "Unable to construct flow");
          sub_5A20(0LL);
        }

        (*(void (**)(void *, uint64_t))(v101 + 8))(v60, v102);
      }

      else
      {
        uint64_t v75 = static Logger.flowCategory.getter(v70);
        Logger.logObject.getter(v75);
        os_log_type_t v76 = sub_D17C();
        if (sub_D094(v76))
        {
          uint64_t v77 = (_WORD *)sub_D078();
          sub_D1F8(v77);
          sub_D064(&dword_0, v78, v79, "Continuers feature flag NOT enabled. Returning no op flow");
          sub_5A20(v66);
        }

        (*(void (**)(char *, uint64_t))(v101 + 8))(v8, v102);
      }

LABEL_37:
      uint64_t v86 = sub_D14C();
      sub_AF4C(v86);
      uint64_t v87 = sub_D134();
      sub_D228(v87);
      sub_D144(&qword_14970, v88, (uint64_t)&protocol conformance descriptor for NoOpFlow);
      sub_D084(v89);
      uint64_t v90 = v60;
LABEL_40:
      uint64_t v59 = swift_release(v90);
      goto LABEL_18;
    }
  }

  else
  {
    sub_AA9C((uint64_t)v105, &qword_14680);
  }

  uint64_t v34 = static Logger.flowCategory.getter(v23);
  uint64_t v35 = (void *)Logger.logObject.getter(v34);
  os_log_type_t v36 = static os_log_type_t.error.getter();
  if (sub_D0E8(v36))
  {
    unint64_t v37 = (_WORD *)sub_D078();
    *unint64_t v37 = 0;
    sub_D0B8(&dword_0, v38, v39, "Unavailable direct invocation action. Returning no op flow");
    sub_5A20((uint64_t)v37);
  }

  sub_D204(v101);
  uint64_t v40 = sub_D14C();
  sub_AF4C(v40);
  uint64_t v41 = sub_D134();
  sub_D228(v41);
  sub_D144(&qword_14970, v42, (uint64_t)&protocol conformance descriptor for NoOpFlow);
  sub_D084(v43);
  sub_AEC4();
LABEL_15:
  sub_D110();
}

void *SiriSuggestionsFlowPlugin.deinit()
{
  return v0;
}

uint64_t SiriSuggestionsFlowPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

void *sub_CC68@<X0>(void *a1@<X8>)
{
  uint64_t result = SiriSuggestionsFlowPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

void sub_CC98(uint64_t a1)
{
}

uint64_t Optional.unwrap(errorIfNotSet:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  sub_D1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v3, v8, a2);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v3, a2);
  swift_willThrow(v10);
  return swift_errorRetain(a1);
}

void *sub_CD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ThirdPartyHomeScreenAppPicker(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a3)
  {
    sub_54BC(&qword_14A78);
    uint64_t v9 = sub_54BC(&qword_14A80);
    uint64_t v10 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v9,  &protocol witness table for String);
    uint64_t v11 = Cache.__allocating_init(store:)(v10);
    ThirdPartyHomeScreenAppPicker.init(randSeed:)(0LL, 1LL);
    uint64_t v12 = type metadata accessor for AppUtilsService(0LL);
    swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
    uint64_t v13 = AppUtilsService.init(cache:homescreenAppPicker:)(v11, v8);
    type metadata accessor for DispatchSELFLogger(0LL);
    uint64_t v14 = DispatchSELFLogger.__allocating_init()();
    static OutputPublisherFactory.makeOutputPublisherAsync()(v24);
    sub_B518(v23);
    v22[3] = v12;
    sub_CFE4( &qword_14A88,  (uint64_t (*)(uint64_t))&type metadata accessor for AppUtilsService,  (uint64_t)&protocol conformance descriptor for AppUtilsService);
    v22[4] = v15;
    v22[0] = v13;
    if (a2)
    {
      v21[1] = a2;
      swift_retain(v13);
      swift_retain(a2);
      sub_5C7C(v14, (uint64_t)v22, (uint64_t)v24, (uint64_t)v23, 0LL, 0LL, 0LL, v21);
      swift_release(a2);
      a3 = v21[0];
    }

    else
    {
      swift_retain(v13);
      a3 = 0LL;
    }

    sub_56E0(v22);
    swift_release(v14);
    sub_56E0(v23);
    sub_56E0(v24);
    swift_release(v13);
  }

  uint64_t v16 = swift_allocObject(&unk_10B10, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  uint64_t v17 = type metadata accessor for SiriSuggestionsFlowPlugin();
  uint64_t v18 = (void *)swift_allocObject(v17, 80LL, 7LL);
  v18[8] = type metadata accessor for OSFeatureFlagProvider(0LL);
  v18[9] = &protocol witness table for OSFeatureFlagProvider;
  v18[2] = 0LL;
  v18[3] = sub_D04C;
  void v18[4] = v16;
  v18[5] = a1;
  return v18;
}

uint64_t type metadata accessor for SiriSuggestionsFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC25SiriSuggestionsFlowPlugin25SiriSuggestionsFlowPlugin);
}

void sub_CFE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_B0B0();
}

uint64_t sub_D020()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void *sub_D04C()
{
  return sub_B630(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_D064(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_D078()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_D084(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

BOOL sub_D094(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

void sub_D0B8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

uint64_t sub_D0D8(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

BOOL sub_D0E8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

  ;
}

uint64_t sub_D128()
{
  return swift_release(v0);
}

uint64_t sub_D134()
{
  return NoOpFlow.init()();
}

void sub_D13C(uint64_t a1)
{
}

void sub_D144(unint64_t *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_D14C()
{
  return type metadata accessor for NoOpFlow(0LL);
}

uint64_t sub_D154(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

uint64_t sub_D164(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

uint64_t sub_D174()
{
  return swift_errorRelease(v0);
}

uint64_t sub_D17C()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_D184()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 96))(v0, v2);
}

  ;
}

  ;
}

uint64_t sub_D1C4(uint64_t a1)
{
  return sub_55EC(a1, 1LL, v1);
}

uint64_t sub_D1E0()
{
  return type metadata accessor for SiriSuggestionsFlow();
}

uint64_t sub_D1E8()
{
  return (*(uint64_t (**)(uint64_t, void))(v0 + 8))(v1, *(void *)(v2 - 120));
}

_WORD *sub_D1F8(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_D204@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

void sub_D210(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_D218()
{
  return swift_errorRetain(v0);
}

uint64_t sub_D220()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_D228(uint64_t result)
{
  *(void *)(v1 - 112) = result;
  return result;
}

uint64_t sub_D234(uint64_t a1, uint64_t a2)
{
  return sub_54FC(a1, a2, 1LL, v2);
}

void sub_D240(unint64_t *a1, uint64_t a2, uint64_t a3)
{
}
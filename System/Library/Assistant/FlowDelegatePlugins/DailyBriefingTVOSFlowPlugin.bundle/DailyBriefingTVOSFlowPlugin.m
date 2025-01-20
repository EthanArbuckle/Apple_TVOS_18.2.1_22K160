BOOL sub_3A64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  os_log_s *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28[3];
  uint64_t v29;
  _BYTE v30[24];
  v2 = v1;
  type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v25 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v25 - v10;
  v12 = v2 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_state;
  sub_5210(v2 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_state, (uint64_t)v30, 0LL);
  sub_4F84(v12, (uint64_t)v11);
  v13 = sub_5208();
  v14 = sub_4A00((uint64_t)v11, 2LL, v13);
  if (v14 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL))(v9, a1, v13);
    sub_4A0C((uint64_t)v9, 0LL, 2LL, v13);
    sub_5154((uint64_t)v9, (uint64_t)v6);
    sub_5210(v12, (uint64_t)v28, 33LL);
    sub_5004((uint64_t)v6, v12);
    swift_endAccess(v28);
  }

  else
  {
    if (qword_C248 != -1) {
      swift_once(&qword_C248, sub_5230);
    }
    v15 = type metadata accessor for Logger(0LL);
    sub_4F6C(v15, (uint64_t)qword_C5C0);
    v16 = swift_retain_n(v2, 2LL);
    v17 = (os_log_s *)Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)sub_5220(12LL);
      v27 = sub_5220(32LL);
      v28[0] = v27;
      *(_DWORD *)v19 = 136315138;
      v26 = v19 + 4;
      sub_4F84(v12, (uint64_t)v9);
      v20 = sub_3D34();
      v22 = v21;
      sub_4FC8((uint64_t)v9);
      v29 = sub_61D4(v20, v22, v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v26, v19 + 12);
      swift_bridgeObjectRelease(v22);
      sub_5218(v2);
      _os_log_impl(&dword_0, v17, v18, "DailyBriefingHandoffFlow expected state begin. Received: %s", v19, 0xCu);
      v23 = v27;
      swift_arrayDestroy(v27, 1LL);
      sub_51E8(v23);
      sub_51E8((uint64_t)v19);
    }

    else
    {
      sub_5218(v2);
    }

    sub_4FC8((uint64_t)v11);
  }

  return v14 == 1;
}

uint64_t sub_3D34()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_5208();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  __chkstk_darwin();
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_4F84(v1, (uint64_t)v7);
  int v8 = sub_4A00((uint64_t)v7, 2LL, v2);
  if (v8)
  {
    if (v8 == 1) {
      return 0x6E69676562LL;
    }
    else {
      return 0x6574656C706D6F63LL;
    }
  }

  else
  {
    sub_5228((uint64_t)v5, (uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
    v14[0] = 0LL;
    v14[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(16LL);
    swift_bridgeObjectRelease(v14[1]);
    strcpy((char *)v14, "inputReceived:");
    HIBYTE(v14[1]) = -18;
    uint64_t v10 = sub_5048( &qword_C4B0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v2, v10);
    object = v11._object;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(object);
    uint64_t v9 = v14[0];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return v9;
}

uint64_t sub_3ED4(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = type metadata accessor for ExecuteOnRemoteDeviceSpecification(0LL);
  v2[22] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[23] = v4;
  v2[24] = sub_51D8(v4);
  uint64_t v5 = sub_4F2C(&qword_C488);
  v2[25] = sub_51D8(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for UserIdentityCheckFlowStrategy(0LL);
  v2[26] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[27] = v7;
  v2[28] = sub_51D8(v7);
  uint64_t v8 = type metadata accessor for UserIdentityCheckFlowStrategy.HandoffConfiguration(0LL);
  v2[29] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[30] = v9;
  v2[31] = sub_51D8(v9);
  uint64_t v10 = type metadata accessor for CompanionDeviceInfoRequirement(0LL);
  v2[32] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[33] = v11;
  v2[34] = sub_51D8(v11);
  uint64_t v12 = sub_5208();
  v2[35] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[36] = v13;
  v2[37] = sub_51F4(v13);
  v2[38] = swift_task_alloc(v1);
  uint64_t v14 = type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  v2[39] = sub_51F4(*(void *)(v14 - 8));
  v2[40] = swift_task_alloc(v1);
  return swift_task_switch(sub_3FD8, 0LL, 0LL);
}

uint64_t sub_3FD8()
{
  uint64_t v1 = v0 + 56;
  if (qword_C248 != -1) {
    swift_once(&qword_C248, sub_5230);
  }
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_4F6C(v3, (uint64_t)qword_C5C0);
  uint64_t v4 = swift_retain_n(v2, 2LL);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  uint64_t v7 = &DailyBriefingHandoffFlow;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = *(void *)(v0 + 320);
    uint64_t v9 = *(void *)(v0 + 168);
    uint64_t v10 = (uint8_t *)sub_5220(12LL);
    uint64_t v11 = sub_5220(32LL);
    v68[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = v9 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_state;
    sub_5210(v9 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_state, v0 + 104, 0LL);
    sub_4F84(v12, v8);
    uint64_t v13 = sub_3D34();
    unint64_t v15 = v14;
    sub_4FC8(v8);
    *(void *)(v0 + 152) = sub_61D4(v13, v15, v68);
    uint64_t v1 = v0 + 56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v10 + 4, v10 + 12);
    sub_5218(v9);
    swift_bridgeObjectRelease(v15);
    _os_log_impl(&dword_0, v5, v6, "DailyBriefingHandoffFlow starting execution with state: %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL);
    uint64_t v16 = v11;
    uint64_t v7 = &DailyBriefingHandoffFlow;
    sub_51E8(v16);
    sub_51E8((uint64_t)v10);
  }

  else
  {
    uint64_t v17 = *(void *)(v0 + 168);

    sub_5218(v17);
  }

  uint64_t v18 = *(void *)(v0 + 312);
  uint64_t v19 = *(void *)(v0 + 280);
  uint64_t v20 = (uint64_t)&v7[20].name[*(void *)(v0 + 168)];
  sub_5210(v20, v1, 0LL);
  sub_4F84(v20, v18);
  if (sub_4A00(v18, 2LL, v19))
  {
    uint64_t v21 = sub_4FC8(*(void *)(v0 + 312));
    static ExecuteResponse.complete()(v21);
  }

  else
  {
    uint64_t v22 = *(void *)(v0 + 320);
    uint64_t v60 = *(void *)(v0 + 296);
    uint64_t v23 = *(void *)(v0 + 280);
    uint64_t v54 = *(void *)(v0 + 288);
    uint64_t v55 = *(void *)(v0 + 304);
    uint64_t v25 = *(void *)(v0 + 264);
    uint64_t v24 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 256);
    uint64_t v66 = *(void *)(v0 + 248);
    uint64_t v67 = *(void *)(v0 + 240);
    uint64_t v63 = *(void *)(v0 + 216);
    uint64_t v27 = *(void *)(v0 + 200);
    uint64_t v64 = *(void *)(v0 + 208);
    uint64_t v65 = *(void *)(v0 + 232);
    uint64_t v56 = *(void *)(v0 + 224);
    uint64_t v57 = *(void *)(v0 + 184);
    uint64_t v58 = *(void *)(v0 + 192);
    uint64_t v59 = *(void *)(v0 + 176);
    uint64_t v61 = *(void *)(v0 + 168);
    sub_5228(v55, *(void *)(v0 + 312), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 32));
    uint64_t v62 = v23;
    sub_4A0C(v22, 2LL, 2LL, v23);
    sub_5210(v20, v0 + 80, 33LL);
    sub_5004(v22, v20);
    swift_endAccess(v0 + 80);
    type metadata accessor for CompanionCompatibilityCheckFlowStrategy(0LL);
    (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))( v24,  enum case for CompanionDeviceInfoRequirement.supportsPeerToPeerHandoff(_:),  v26);
    uint64_t v28 = static CompanionCompatibilityCheckFlowStrategy.require(_:redirectToServerOnFailure:)(v24, 1LL);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    uint64_t v29 = type metadata accessor for SimpleHandoffStrategy();
    uint64_t v30 = swift_allocObject(v29, 16LL, 7LL);
    v68[3] = v29;
    v68[4] = sub_5048( &qword_C490,  v31,  (uint64_t (*)(uint64_t))type metadata accessor for SimpleHandoffStrategy,  (uint64_t)&unk_70FC);
    v68[0] = v30;
    uint64_t v32 = swift_retain(v28);
    UserIdentityCheckFlowStrategy.HandoffConfiguration.init(companionCompatiblityCheck:handoffStrategy:)(v32, v68);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(v27, v66, v65);
    sub_4A0C(v27, 0LL, 1LL, v65);
    UserIdentityCheckFlowStrategy.init(allowsAnonymousUser:allowsUserInteraction:handoffConfiguration:requireSpeechProfile:)( 0LL,  1LL,  v27,  1LL);
    sub_5228(v60, v55, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 16));
    (*(void (**)(uint64_t, void, uint64_t))(v57 + 104))( v58,  enum case for ExecuteOnRemoteDeviceSpecification.userCompanion(_:),  v59);
    sub_5088(v61 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_outputPublisher, v0 + 16);
    uint64_t v33 = type metadata accessor for ExecuteOnRemoteFlow(0LL);
    swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
    uint64_t v34 = ExecuteOnRemoteFlow.init(inputToExecute:device:outputPublisher:)(v60, v58, v0 + 16);
    *(void *)(v0 + 144) = v34;
    uint64_t v35 = sub_4F2C(&qword_C498);
    uint64_t v36 = *(void *)(type metadata accessor for CommonFlowGuard(0LL) - 8);
    uint64_t v37 = swift_allocObject( v35,  ((*(unsigned __int8 *)(v36 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))
          + 3LL * *(void *)(v36 + 72),
            *(unsigned __int8 *)(v36 + 80) | 7LL);
    *(_OWORD *)(v37 + 16) = xmmword_7070;
    uint64_t v38 = static CommonFlowGuard.ensuringUserIdentity(using:)(v56);
    static CommonFlowGuard.ensuringPersonalRequestsAreEnabledWhenApplicable.getter(v38);
    static CommonFlowGuard.ensuringUserHasSupportedCompanion(using:)(v28);
    uint64_t v39 = static CommonGuardFlowUtils.makeGuardFlow(withGuards:)(v37);
    swift_bridgeObjectRelease(v37);
    *(void *)(v0 + 128) = v39;
    uint64_t v40 = type metadata accessor for GuardFlow(0LL);
    uint64_t v41 = Flow.guarded<A>(by:)( v0 + 128,  v33,  v40,  &protocol witness table for ExecuteOnRemoteFlow,  &protocol witness table for GuardFlow);
    swift_release(v34);
    swift_release(v39);
    *(void *)(v0 + 136) = v41;
    uint64_t v42 = sub_4F2C(&qword_C4A0);
    unint64_t v43 = sub_50CC();
    uint64_t v44 = Flow.eraseToAnyFlow()(v42, v43);
    static ExecuteResponse.complete(next:)();
    swift_release(v28);
    swift_release(v41);
    swift_release(v44);
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v56, v64);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v65);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v62);
  }

  uint64_t v45 = *(void *)(v0 + 312);
  uint64_t v47 = *(void *)(v0 + 296);
  uint64_t v46 = *(void *)(v0 + 304);
  uint64_t v48 = *(void *)(v0 + 272);
  uint64_t v49 = *(void *)(v0 + 248);
  uint64_t v50 = *(void *)(v0 + 224);
  uint64_t v52 = *(void *)(v0 + 192);
  uint64_t v51 = *(void *)(v0 + 200);
  swift_task_dealloc(*(void *)(v0 + 320));
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_4600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DailyBriefingHandoffFlow(0LL);
  uint64_t v5 = sub_5048(&qword_C480, 255LL, type metadata accessor for DailyBriefingHandoffFlow, (uint64_t)&unk_7124);
  return Flow.deferToExecuteAsync(_:)(a1, a2, v4, v5);
}

uint64_t sub_4678()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_46B8()
{
  return type metadata accessor for DailyBriefingHandoffFlow(0LL);
}

uint64_t type metadata accessor for DailyBriefingHandoffFlow(uint64_t a1)
{
  return sub_475C(a1, (uint64_t *)&unk_C288, (uint64_t)&nominal type descriptor for DailyBriefingHandoffFlow);
}

uint64_t sub_46D4(uint64_t a1)
{
  uint64_t result = type metadata accessor for DailyBriefingHandoffFlow.State(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = "(";
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for DailyBriefingHandoffFlow.State(uint64_t a1)
{
  return sub_475C(a1, qword_C458, (uint64_t)&nominal type descriptor for DailyBriefingHandoffFlow.State);
}

uint64_t sub_475C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

BOOL sub_478C(uint64_t a1)
{
  return sub_3A64(a1);
}

uint64_t sub_47B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_4818;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_4818(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_484C(uint64_t a1, uint64_t a2)
{
  return sub_4600(a1, a2);
}

uint64_t sub_486C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_C29C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_48C0;
  return sub_3ED4(a1);
}

uint64_t sub_48C0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_48EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DailyBriefingHandoffFlow(0LL);
  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_4918()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SimpleHandoffStrategy()
{
  return objc_opt_self(&OBJC_CLASS____TtC27DailyBriefingTVOSFlowPlugin21SimpleHandoffStrategy);
}

uint64_t *sub_4948(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v8);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Input(0LL);
    if (sub_4A00((uint64_t)a2, 2LL, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      sub_4A0C((uint64_t)a1, 0LL, 2LL, v7);
    }
  }

  return a1;
}

uint64_t sub_4A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_4A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_4A18(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  uint64_t result = sub_4A00(a1, 2LL, v2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  }
  return result;
}

void *sub_4A70(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  if (sub_4A00((uint64_t)a2, 2LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    sub_4A0C((uint64_t)a1, 0LL, 2LL, v6);
  }

  return a1;
}

void *sub_4B04(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  int v7 = sub_4A00((uint64_t)a1, 2LL, v6);
  int v8 = sub_4A00((uint64_t)a2, 2LL, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }

  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  sub_4A0C((uint64_t)a1, 0LL, 2LL, v6);
  return a1;
}

void *sub_4BE8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  if (sub_4A00((uint64_t)a2, 2LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    sub_4A0C((uint64_t)a1, 0LL, 2LL, v6);
  }

  return a1;
}

void *sub_4C7C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  int v7 = sub_4A00((uint64_t)a1, 2LL, v6);
  int v8 = sub_4A00((uint64_t)a2, 2LL, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }

  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  sub_4A0C((uint64_t)a1, 0LL, 2LL, v6);
  return a1;
}

uint64_t sub_4D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_4D6C);
}

uint64_t sub_4D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5208();
  unsigned int v5 = sub_4A00(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_4DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4DB8);
}

uint64_t sub_4DB8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = sub_5208();
  return sub_4A0C(a1, v5, a3, v6);
}

uint64_t sub_4E00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  return sub_4A00(a1, 2LL, v2);
}

uint64_t sub_4E34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Input(0LL);
  return sub_4A0C(a1, a2, 2LL, v4);
}

uint64_t sub_4E6C(uint64_t a1)
{
  uint64_t result = type metadata accessor for Input(319LL);
  if (v3 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload(a1, 256LL, *(void *)(result - 8) + 64LL, 2LL);
    return 0LL;
  }

  return result;
}

uint64_t sub_4EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc(async function pointer to HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_48C0;
  return HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()(a1, a2, a3);
}

uint64_t sub_4F2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_4F6C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_4F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_4FC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_5004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5048(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t sub_5088(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_50CC()
{
  unint64_t result = qword_C4A8;
  if (!qword_C4A8)
  {
    uint64_t v1 = sub_5110(&qword_C4A0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ConditionalFlow<A>, v1);
    atomic_store(result, (unint64_t *)&qword_C4A8);
  }

  return result;
}

uint64_t sub_5110(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_5154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DailyBriefingHandoffFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5198(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_51B8()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_51D8@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_51E8(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_51F4@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_5208()
{
  return type metadata accessor for Input(0LL);
}

uint64_t sub_5210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t sub_5218(uint64_t a1)
{
  return swift_release_n(a1, 2LL);
}

uint64_t sub_5220(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_5228@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_5230()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_52C0(v0, qword_C5C0);
  sub_4F6C(v0, (uint64_t)qword_C5C0);
  sub_5300();
  uint64_t v1 = OS_os_log.init(subsystem:category:)( 0xD00000000000001CLL,  0x8000000000007350LL,  0xD000000000000011LL,  0x8000000000007370LL);
  return Logger.init(_:)(v1);
}

uint64_t *sub_52C0(uint64_t a1, uint64_t *a2)
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

unint64_t sub_5300()
{
  unint64_t result = qword_C4B8;
  if (!qword_C4B8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_C4B8);
  }

  return result;
}

void sub_533C()
{
  algn_C4C8[5] = 0;
  *(_WORD *)&algn_C4C8[6] = -5120;
}

uint64_t sub_5368()
{
  uint64_t v0 = static Device.current.getter(v5);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v4, v0);
  uint64_t v1 = type metadata accessor for DailyBriefingTVOSFlowPlugin();
  uint64_t v2 = swift_allocObject(v1, 96LL, 7LL);
  sub_69B0(v5, v2 + 16);
  sub_69B0(v4, v2 + 56);
  return v2;
}

uint64_t sub_53C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v57 = type metadata accessor for USOParse(0LL);
  uint64_t v4 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  sub_6A38();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for Parse(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_6A38();
  uint64_t v12 = (uint64_t *)(v11 - v10);
  uint64_t v13 = v1[5];
  uint64_t v14 = v1[6];
  unint64_t v15 = sub_698C(v1 + 2, v13);
  if ((dispatch thunk of DeviceState.isHomePod.getter(v13, v14) & 1) != 0)
  {
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
    int v16 = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 88))(v12, v8);
    if (v16 == enum case for Parse.NLv4IntentOnly(_:))
    {
      sub_6A28();
      uint64_t v17 = *v12;
      if ((sub_58DC() & 1) != 0)
      {
        swift_unknownObjectRelease(v17);
LABEL_13:
        if (qword_C248 != -1) {
          swift_once(&qword_C248, sub_5230);
        }
        uint64_t v26 = sub_69F8();
        uint64_t v27 = (os_log_s *)sub_69E4(v26, (uint64_t)qword_C5C0);
        os_log_type_t v28 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)sub_5220(2LL);
          *(_WORD *)uint64_t v29 = 0;
          sub_6A18(&dword_0, v27, v28, "DailyBriefingTVOSFlowPlugin Submitting executeOnRemoteFlow.", v29);
          sub_51E8((uint64_t)v29);
        }

        sub_5088((uint64_t)(v2 + 7), (uint64_t)v58);
        uint64_t v30 = type metadata accessor for DailyBriefingHandoffFlow(0LL);
        uint64_t v31 = swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
        uint64_t v32 = v31 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_state;
        uint64_t v33 = type metadata accessor for Input(0LL);
        sub_4A0C(v32, 1LL, 2LL, v33);
        sub_69B0(v58, v31 + OBJC_IVAR____TtC27DailyBriefingTVOSFlowPlugin24DailyBriefingHandoffFlow_outputPublisher);
        *(void *)&v58[0] = v31;
        uint64_t v34 = sub_5048(&qword_C480, 255LL, type metadata accessor for DailyBriefingHandoffFlow, (uint64_t)&unk_7124);
        uint64_t v35 = Flow.eraseToAnyFlow()(v30, v34);
        swift_release(v31);
        static FlowSearchResult.flow(_:)(v35);
        return swift_release(v35);
      }

      if (qword_C248 != -1) {
        swift_once(&qword_C248, sub_5230);
      }
      uint64_t v36 = sub_69F8();
      sub_69E4(v36, (uint64_t)qword_C5C0);
      os_log_type_t v37 = sub_6A80();
      if (sub_6A00(v37))
      {
        uint64_t v38 = (uint8_t *)sub_5220(2LL);
        *(_WORD *)uint64_t v38 = 0;
        sub_6AD4();
        sub_6A18(v39, v40, v41, v42, v38);
        sub_51E8((uint64_t)v38);
      }

      sub_6A98();
      return swift_unknownObjectRelease(v17);
    }

    else if (v16 == enum case for Parse.uso(_:))
    {
      sub_6A28();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(v4 + 32))(v7, v12, v57);
      if ((sub_5F0C((os_log_type_t)v7) & 1) != 0)
      {
        (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v57);
        goto LABEL_13;
      }

      if (qword_C248 != -1) {
        swift_once(&qword_C248, sub_5230);
      }
      uint64_t v50 = sub_69F8();
      sub_69E4(v50, (uint64_t)qword_C5C0);
      os_log_type_t v51 = sub_6A80();
      if (sub_6A00(v51))
      {
        uint64_t v52 = (uint8_t *)sub_5220(2LL);
        *(_WORD *)uint64_t v52 = 0;
        sub_6AD4();
        sub_6A18(v53, v54, v55, v56, v52);
        sub_51E8((uint64_t)v52);
      }

      sub_6A98();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v57);
    }

    else
    {
      if (qword_C248 != -1) {
        swift_once(&qword_C248, sub_5230);
      }
      uint64_t v43 = sub_69F8();
      sub_69E4(v43, (uint64_t)qword_C5C0);
      os_log_type_t v44 = sub_6A80();
      if (sub_6A00(v44))
      {
        uint64_t v45 = (uint8_t *)sub_5220(2LL);
        *(_WORD *)uint64_t v45 = 0;
        sub_6AD4();
        sub_6A18(v46, v47, v48, v49, v45);
        sub_51E8((uint64_t)v45);
      }

      sub_6A98();
      return (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 8))(v12, v8);
    }
  }

  else
  {
    if (qword_C248 != -1) {
      swift_once(&qword_C248, sub_5230);
    }
    uint64_t v18 = sub_69F8();
    sub_69E4(v18, (uint64_t)qword_C5C0);
    os_log_type_t v19 = sub_6A80();
    if (sub_6A00(v19))
    {
      uint64_t v20 = (uint8_t *)sub_5220(2LL);
      *(_WORD *)uint64_t v20 = 0;
      sub_6AD4();
      sub_6A18(v21, v22, v23, v24, v20);
      sub_51E8((uint64_t)v20);
    }

    return static FlowSearchResult.noFlow.getter();
  }
}

uint64_t sub_58DC()
{
  uint64_t v0 = static UsoConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
  uint64_t v1 = v0;
  if (!((unint64_t)v0 >> 62))
  {
    uint64_t v2 = *(os_log_s **)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
    if (v2) {
      goto LABEL_3;
    }
LABEL_42:
    sub_6A10();
    if (qword_C248 == -1)
    {
LABEL_43:
      uint64_t v56 = sub_69F8();
      sub_69E4(v56, (uint64_t)qword_C5C0);
      os_log_type_t v57 = sub_6AB8();
      if (sub_6A58(v57))
      {
        uint64_t v58 = (uint8_t *)sub_5220(2LL);
        *(_WORD *)uint64_t v58 = 0;
        sub_6A18(&dword_0, v2, (os_log_type_t)v1, "DailyBriefingTVOSFlowPlugin could not convert uda to task.", v58);
        sub_51E8((uint64_t)v58);
      }

      return 0LL;
    }

LABEL_47:
    swift_once(&qword_C248, sub_5230);
    goto LABEL_43;
  }

  if (v0 < 0) {
    uint64_t v55 = v0;
  }
  else {
    uint64_t v55 = v0 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v0);
  uint64_t v2 = (os_log_s *)_CocoaArrayWrapper.endIndex.getter(v55);
  sub_6A10();
  if (!v2) {
    goto LABEL_42;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v3 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v1);
    goto LABEL_6;
  }

  if (!*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL)))
  {
    __break(1u);
    goto LABEL_47;
  }

  uint64_t v3 = *(void *)(v1 + 32);
  sub_6A48();
LABEL_6:
  sub_6A10();
  uint64_t v4 = sub_6A48();
  if (UsoTask.baseEntityAsString.getter(v4) == 0xD000000000000014LL && v5 == 0x80000000000073F0LL)
  {
    unint64_t v6 = 0x80000000000073F0LL;
LABEL_25:
    uint64_t v10 = swift_bridgeObjectRelease(v6);
    goto LABEL_26;
  }

  char v9 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  uint64_t v10 = sub_6A10();
  if ((v9 & 1) != 0) {
    goto LABEL_26;
  }
  uint64_t v11 = UsoTask.baseEntityAsString.getter(v10);
  unint64_t v13 = v12;
  if (qword_C250 != -1) {
    swift_once(&qword_C250, sub_533C);
  }
  if (v11 == qword_C4C0 && v13 == *(void *)algn_C4C8)
  {
    unint64_t v6 = v13;
    goto LABEL_25;
  }

  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13);
  uint64_t v10 = sub_6A10();
  if ((v15 & 1) == 0)
  {
    if (qword_C248 != -1) {
      swift_once(&qword_C248, sub_5230);
    }
    uint64_t v16 = sub_69F8();
    sub_4F6C(v16, (uint64_t)qword_C5C0);
    uint64_t v17 = sub_6A48();
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (sub_6A70(v19))
    {
      uint64_t v20 = sub_5220(12LL);
      uint64_t v21 = sub_5220(32LL);
      sub_6AC0(4.8149e-34);
      uint64_t v23 = UsoTask.baseEntityAsString.getter(v22);
      uint64_t v27 = sub_6A68(v23, v24, v25, v26);
      sub_69C8(v27, v28);
      sub_6AA0();
      sub_6A10();
      uint64_t v30 = "DailyBriefingTVOSFlowPlugin Offtopic task entity: %s";
LABEL_31:
      sub_6A88(&dword_0, v18, v29, v30);
      sub_6AAC();
      sub_51E8(v21);
      sub_51E8(v20);

      sub_6A50();
      return 0LL;
    }

LABEL_36:
    swift_release_n(v3, 3LL);
    return 0LL;
  }

LABEL_26:
  v60._countAndFlagsBits = UsoTask.verbString.getter(v10);
  char v31 = sub_6AE8(v60);
  if (v31 == 6)
  {
    if (qword_C248 != -1) {
      swift_once(&qword_C248, sub_5230);
    }
    uint64_t v32 = sub_69F8();
    sub_4F6C(v32, (uint64_t)qword_C5C0);
    uint64_t v33 = sub_6A48();
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (sub_6A70(v34))
    {
      uint64_t v20 = sub_5220(12LL);
      uint64_t v21 = sub_5220(32LL);
      sub_6AC0(4.8149e-34);
      uint64_t v36 = UsoTask.verbString.getter(v35);
      uint64_t v40 = sub_6A68(v36, v37, v38, v39);
      sub_69C8(v40, v41);
      sub_6AA0();
      sub_6A10();
      uint64_t v30 = "DailyBriefingTVOSFlowPlugin Offtopic verbString: %s";
      goto LABEL_31;
    }

    goto LABEL_36;
  }

  char v42 = v31;
  sub_6A50();
  if (qword_C248 != -1) {
    swift_once(&qword_C248, sub_5230);
  }
  uint64_t v43 = sub_69F8();
  os_log_type_t v44 = (os_log_s *)sub_69E4(v43, (uint64_t)qword_C5C0);
  os_log_type_t v45 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (_DWORD *)sub_5220(12LL);
    uint64_t v59 = sub_5220(32LL);
    *uint64_t v46 = 136315138;
    uint64_t v47 = sub_6B30(v42);
    unint64_t v49 = v48;
    uint64_t v52 = sub_6A68(v47, v48, v50, v51);
    sub_69C8(v52, v53);
    swift_bridgeObjectRelease(v49);
    sub_6A88(&dword_0, v44, v54, "DailyBriefingTVOSFlowPlugin found DailyBriefing verb: %s");
    uint64_t v7 = 1LL;
    sub_6AAC();
    sub_51E8(v59);
    sub_51E8((uint64_t)v46);

    sub_6A50();
  }

  else
  {

    sub_6A50();
    return 1LL;
  }

  return v7;
}

uint64_t sub_5F0C(os_log_type_t a1)
{
  uint64_t v2 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_6A38();
  uint64_t v6 = v5 - v4;
  USOParse.userParse.getter();
  uint64_t v7 = static ConversionUtils.toLegacyPreferredUserDialogAct(from:)(v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  if (v7)
  {
    char v8 = sub_58DC();
    swift_unknownObjectRelease(v7);
  }

  else
  {
    if (qword_C248 != -1) {
      swift_once(&qword_C248, sub_5230);
    }
    uint64_t v9 = sub_69F8();
    sub_69E4(v9, (uint64_t)qword_C5C0);
    os_log_type_t v10 = sub_6AB8();
    if (sub_6A58(v10))
    {
      uint64_t v11 = (uint8_t *)sub_5220(2LL);
      *(_WORD *)uint64_t v11 = 0;
      sub_6A18(&dword_0, 0LL, a1, "DailyBriefingTVOSFlowPlugin could not find uda from parse.", v11);
      sub_51E8((uint64_t)v11);
    }

    char v8 = 0;
  }

  return v8 & 1;
}

uint64_t sub_6034()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for DailyBriefingTVOSFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC27DailyBriefingTVOSFlowPlugin27DailyBriefingTVOSFlowPlugin);
}

uint64_t sub_6080(uint64_t a1)
{
  return sub_53C8(a1);
}

uint64_t sub_60A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_5368();
  *a1 = result;
  return result;
}

uint64_t sub_60D8(uint64_t a1, uint64_t a2)
{
  return sub_5048( &qword_C5A0,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for DailyBriefingTVOSFlowPlugin,  (uint64_t)&unk_71AC);
}

uint64_t sub_6104(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_6114(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_6148(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_6168(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  uint64_t v8 = sub_61D4(v6, v7, a3);
  uint64_t v9 = *a1;
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v9, v10);
  uint64_t result = sub_6A10();
  *a1 = v10;
  return result;
}

uint64_t sub_61D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_62A4(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_694C((uint64_t)v12, *a3);
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
      sub_694C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_5198(v12);
  return v7;
}

void *sub_62A4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_63F8((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_64BC(a5, a6);
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

void *sub_63F8(char *__src, size_t __n, char *__dst)
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

void *sub_64BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_6550(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6724(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6724((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_6550(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_66C0(v4, 0LL);
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

void *sub_66C0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_4F2C(&qword_C5B0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  __int128 v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_6724(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_4F2C(&qword_C5B0);
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
    sub_68BC(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_67F8(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_67F8(char *__src, size_t __n, char *__dst)
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

char *sub_68BC(char *__src, size_t __len, char *__dst)
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

_BYTE **sub_693C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_694C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_698C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_69B0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_69C8(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v5 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)((uint64_t *)va, va1, v3, v2);
}

uint64_t sub_69E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_4F6C(a1, a2);
  return Logger.logObject.getter(v2);
}

uint64_t sub_69F8()
{
  return type metadata accessor for Logger(0LL);
}

BOOL sub_6A00(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6A10()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_6A18(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_6A20()
{
  return swift_errorRelease(v0);
}

uint64_t sub_6A28()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 96))(v2, v1);
}

  ;
}

uint64_t sub_6A48()
{
  return swift_retain(v0);
}

uint64_t sub_6A50()
{
  return swift_release(v0);
}

BOOL sub_6A58(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6A68(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  return sub_61D4(a1, a2, (uint64_t *)va);
}

BOOL sub_6A70(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6A80()
{
  return static os_log_type_t.error.getter();
}

void sub_6A88(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_6A98()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_6AA0()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_6AAC()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_6AB8()
{
  return static os_log_type_t.error.getter();
}

void sub_6AC0(float a1)
{
  *uint64_t v1 = a1;
}

  ;
}

uint64_t sub_6AE0()
{
  return swift_errorRetain(v0);
}

unint64_t sub_6AE8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_8528, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 6) {
    return 6LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_6B30(char a1)
{
  return *(void *)&aSummarischecke[8 * a1];
}
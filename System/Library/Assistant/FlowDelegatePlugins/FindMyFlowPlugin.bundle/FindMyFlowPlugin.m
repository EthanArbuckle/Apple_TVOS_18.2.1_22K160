uint64_t sub_4898()
{
  uint64_t v0;
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_48A8(uint64_t a1)
{
  uint64_t v27 = a1;
  type metadata accessor for RedirectToCompanionFlow.State(0LL);
  ((void (*)(void))__chkstk_darwin)();
  v2 = (char *)&v28[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Parse(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v28[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  v10 = (char *)&v28[-1] - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  v13 = (char *)&v28[-1] - v12;
  static Device.current.getter(v28, v11);
  uint64_t v14 = v29;
  uint64_t v15 = v30;
  sub_4B6C(v28, v29);
  char v16 = dispatch thunk of DeviceState.isHomePod.getter(v14, v15);
  uint64_t v17 = sub_4B90(v28);
  if ((v16 & 1) != 0)
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v18(v13, v27, v3);
    v18(v10, (uint64_t)v13, v3);
    Input.init(parse:)(v10);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
    uint64_t v19 = type metadata accessor for Input(0LL);
    sub_4C18((uint64_t)v2, 0LL, 2LL, v19);
    uint64_t v20 = type metadata accessor for RedirectToCompanionFlow(0LL);
    uint64_t v21 = swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
    sub_4C24((uint64_t)v2, v21 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state);
    v28[0] = v21;
    unint64_t v22 = sub_4C68();
    uint64_t v23 = Flow.eraseToAnyFlow()(v20, v22);
    swift_release(v21);
  }

  else
  {
    FindMyFriendFlowProvider.init()(v28, v17);
    uint64_t v24 = v27;
    uint64_t v23 = FindMyFriendFlowProvider.makeFlow(parse:)(v27);
    sub_4BB0((uint64_t)v28);
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
    if (!v23)
    {
      FindDeviceFlowFactory.init()(v28, v25);
      uint64_t v23 = FindDeviceFlowFactory.makeFlowFrom(parse:)(v7);
      sub_4BE4((uint64_t)v28);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  return v23;
}

uint64_t sub_4AF4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for FindMyFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC16FindMyFlowPlugin16FindMyFlowPlugin);
}

uint64_t sub_4B24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_4898();
  *a1 = result;
  return result;
}

uint64_t sub_4B54(uint64_t a1)
{
  return sub_48A8(a1);
}

void *sub_4B6C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_4B90(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_4BB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_4BE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_4C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_4C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_4C68()
{
  unint64_t result = qword_C1F8;
  if (!qword_C1F8)
  {
    uint64_t v1 = type metadata accessor for RedirectToCompanionFlow(255LL);
    unint64_t result = swift_getWitnessTable(&unk_74A0, v1);
    atomic_store(result, (unint64_t *)&qword_C1F8);
  }

  return result;
}

BOOL sub_4CA8()
{
  uint64_t v1 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  __chkstk_darwin(v1);
  uint64_t v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v4 = v0 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state;
  sub_6F24(v4, (uint64_t)v9);
  sub_64DC(v4, (uint64_t)v3);
  uint64_t v5 = sub_6F1C();
  BOOL v6 = sub_5C08((uint64_t)v3, 2LL, v5) == 0;
  sub_6520((uint64_t)v3);
  return v6;
}

uint64_t sub_4D48(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_639C(&qword_C380);
  v2[10] = sub_6EEC(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for UserIdentityCheckFlowStrategy(0LL);
  v2[11] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[12] = v5;
  v2[13] = sub_6EEC(v5);
  uint64_t v6 = type metadata accessor for ExecuteOnRemoteDeviceSpecification(0LL);
  v2[14] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[15] = v7;
  v2[16] = sub_6EEC(v7);
  uint64_t v8 = type metadata accessor for UserIdentityCheckFlowStrategy.HandoffConfiguration(0LL);
  v2[17] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[18] = v9;
  v2[19] = sub_6EEC(v9);
  uint64_t v10 = type metadata accessor for CompanionDeviceInfoRequirement(0LL);
  v2[20] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[21] = v11;
  v2[22] = sub_6EEC(v11);
  uint64_t v12 = type metadata accessor for FlowUnhandledReason(0LL);
  v2[23] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[24] = v13;
  v2[25] = sub_6EEC(v13);
  uint64_t v14 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  v2[26] = sub_6EEC(*(void *)(v14 - 8));
  uint64_t v15 = sub_6F1C();
  v2[27] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[28] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[29] = swift_task_alloc(v17);
  v2[30] = swift_task_alloc(v17);
  return swift_task_switch(sub_4E6C, 0LL, 0LL);
}

uint64_t sub_4E6C()
{
  if (qword_C150 != -1) {
    swift_once(&qword_C150, sub_6448);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_64C4(v1, (uint64_t)qword_C650);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "[RedirectToCompanionFlow] Executing", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 72);

  uint64_t v9 = v8 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state;
  sub_6F24(v8 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state, v0 + 16);
  sub_64DC(v9, v7);
  int v10 = sub_5C08(v7, 2LL, v6);
  if (v10)
  {
    if (v10 == 1)
    {
      uint64_t v11 = *(void *)(v0 + 208);
      static ExecuteResponse.complete()();
      sub_6520(v11);
    }

    else
    {
      uint64_t v31 = *(void *)(v0 + 192);
      uint64_t v30 = *(void *)(v0 + 200);
      uint64_t v32 = *(void *)(v0 + 184);
      (*(void (**)(uint64_t, void, uint64_t))(v31 + 104))( v30,  enum case for FlowUnhandledReason.needsServerExecution(_:),  v32);
      static ExecuteResponse.unhandled(reason:)(v30);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 240);
    uint64_t v13 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 224);
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v16 = *(void *)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 152);
    uint64_t v17 = *(void *)(v0 + 160);
    uint64_t v19 = *(void *)(v0 + 128);
    uint64_t v47 = *(void *)(v0 + 144);
    uint64_t v48 = *(void *)(v0 + 136);
    uint64_t v42 = *(void *)(v0 + 120);
    uint64_t v43 = *(void *)(v0 + 232);
    uint64_t v44 = *(void *)(v0 + 112);
    uint64_t v49 = *(void *)(v0 + 104);
    uint64_t v50 = *(void *)(v0 + 96);
    uint64_t v51 = *(void *)(v0 + 88);
    uint64_t v46 = *(void *)(v0 + 80);
    uint64_t v53 = *(void *)(v0 + 72);
    uint64_t v52 = v12;
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 32))(v12, *(void *)(v0 + 208), v13);
    type metadata accessor for CompanionCompatibilityCheckFlowStrategy(0LL);
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))( v16,  enum case for CompanionDeviceInfoRequirement.supportsPeerToPeerHandoff(_:),  v17);
    uint64_t v45 = static CompanionCompatibilityCheckFlowStrategy.require(_:redirectToServerOnFailure:)(v16, 1LL);
    sub_6F30(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    v54[3] = &type metadata for SimpleHandoffStrategy;
    v54[4] = sub_655C();
    swift_retain(v45);
    UserIdentityCheckFlowStrategy.HandoffConfiguration.init(companionCompatiblityCheck:handoffStrategy:)(v45, v54);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v43, v12, v13);
    uint64_t v20 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v42 + 104))( v19,  enum case for ExecuteOnRemoteDeviceSpecification.userCompanion(_:),  v44);
    static OutputPublisherFactory.makeOutputPublisherAsync()(v54, v20);
    uint64_t v21 = type metadata accessor for ExecuteOnRemoteFlow(0LL);
    swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
    *(void *)(v0 + 40) = ExecuteOnRemoteFlow.init(inputToExecute:device:outputPublisher:)(v43, v19, v54);
    uint64_t v22 = sub_639C(&qword_C390);
    uint64_t v23 = *(void *)(type metadata accessor for CommonFlowGuard(0LL) - 8);
    uint64_t v24 = swift_allocObject( v22,  ((*(unsigned __int8 *)(v23 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))
          + 2LL * *(void *)(v23 + 72),
            *(unsigned __int8 *)(v23 + 80) | 7LL);
    *(_OWORD *)(v24 + 16) = xmmword_7460;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v46, v18, v48);
    sub_4C18(v46, 0LL, 1LL, v48);
    UserIdentityCheckFlowStrategy.init(allowsAnonymousUser:allowsUserInteraction:handoffConfiguration:requireSpeechProfile:)( 0LL,  1LL,  v46,  1LL);
    static CommonFlowGuard.ensuringUserIdentity(using:)(v49);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
    static CommonFlowGuard.ensuringUserHasSupportedCompanion(using:)(v45);
    uint64_t v25 = static CommonGuardFlowUtils.makeGuardFlow(withGuards:)(v24);
    swift_bridgeObjectRelease(v24);
    *(void *)(v0 + 48) = v25;
    uint64_t v26 = type metadata accessor for GuardFlow(0LL);
    uint64_t v27 = Flow.guarded<A>(by:)( v0 + 48,  v21,  v26,  &protocol witness table for ExecuteOnRemoteFlow,  &protocol witness table for GuardFlow);
    swift_release(v25);
    swift_release(*(void *)(v0 + 40));
    *(void *)(v0 + 56) = v27;
    swift_retain(v53);
    uint64_t v28 = sub_639C(&qword_C398);
    unint64_t v29 = sub_65A0();
    static ExecuteResponse.ongoing<A>(next:childCompletion:)(v0 + 56, sub_6598, v53, v28, v29);
    swift_release(v45);
    swift_release(v53);
    sub_6F30(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v52, v13);
    swift_release(v27);
  }

  uint64_t v33 = *(void *)(v0 + 232);
  uint64_t v35 = *(void *)(v0 + 200);
  uint64_t v34 = *(void *)(v0 + 208);
  uint64_t v36 = *(void *)(v0 + 176);
  uint64_t v37 = *(void *)(v0 + 152);
  uint64_t v38 = *(void *)(v0 + 128);
  uint64_t v39 = *(void *)(v0 + 104);
  uint64_t v40 = *(void *)(v0 + 80);
  swift_task_dealloc(*(void *)(v0 + 240));
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_536C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExecuteOnRemoteFlowResult(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v62 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (uint64_t *)((char *)&v62 - v13);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v62 - v15;
  uint64_t v17 = sub_639C(&qword_C3A8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_6628(a1, (uint64_t)v19);
  uint64_t v23 = sub_639C(&qword_C3B0);
  if (sub_5C08((uint64_t)v19, 1LL, v23) == 1)
  {
    if (qword_C150 != -1) {
      swift_once(&qword_C150, sub_6448);
    }
    uint64_t v24 = type metadata accessor for Logger(0LL);
    uint64_t v25 = sub_64C4(v24, (uint64_t)qword_C650);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl( &dword_0,  v26,  v27,  "[RedirectToCompanionFlow] ExecuteOnRemote guard flows failed, assuming a server redirect or handoff should have happened, doing nothing.",  v28,  2u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    uint64_t v29 = type metadata accessor for Input(0LL);
    sub_4C18((uint64_t)v22, 1LL, 2LL, v29);
    sub_6670((uint64_t)v19);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v16, v19, v4);
    uint64_t v30 = v16;
    uint64_t v31 = *(void (**)(uint64_t *))(v5 + 16);
    v67 = v30;
    v31(v14);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v5 + 88))(v14, v4) == enum case for ExecuteOnRemoteFlowResult.remoteFlowFailure(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v5 + 96))(v14, v4);
      uint64_t v32 = *v14;
      if (qword_C150 != -1) {
        swift_once(&qword_C150, sub_6448);
      }
      uint64_t v33 = type metadata accessor for Logger(0LL);
      sub_64C4(v33, (uint64_t)qword_C650);
      swift_errorRetain(v32);
      uint64_t v34 = swift_errorRetain(v32);
      uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
      os_log_type_t v36 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v66 = a2;
        uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v38 = swift_slowAlloc(32LL, -1LL);
        uint64_t v68 = v32;
        v69[0] = v38;
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v65 = (uint64_t)(v37 + 4);
        swift_errorRetain(v32);
        uint64_t v39 = sub_639C(&qword_C3B8);
        uint64_t v40 = String.init<A>(describing:)(&v68, v39);
        unint64_t v42 = v41;
        uint64_t v68 = sub_66F4(v40, v41, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v65, v37 + 12);
        unint64_t v43 = v42;
        a2 = v66;
        swift_bridgeObjectRelease(v43);
        swift_errorRelease(v32);
        swift_errorRelease(v32);
        _os_log_impl( &dword_0,  v35,  v36,  "[RedirectToCompanionFlow] ExecuteOnRemote failed with an error=%s: Possible server redirect. Will redirect thi s input to server as a fallback.",  v37,  0xCu);
        swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v38, -1LL, -1LL);
        swift_slowDealloc(v37, -1LL, -1LL);
      }

      else
      {

        swift_errorRelease(v32);
        swift_errorRelease(v32);
      }

      swift_errorRelease(v32);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v67, v4);
      uint64_t v58 = type metadata accessor for Input(0LL);
      sub_4C18((uint64_t)v22, 2LL, 2LL, v58);
    }

    else
    {
      uint64_t v66 = a2;
      if (qword_C150 != -1) {
        swift_once(&qword_C150, sub_6448);
      }
      uint64_t v44 = type metadata accessor for Logger(0LL);
      sub_64C4(v44, (uint64_t)qword_C650);
      uint64_t v45 = v67;
      uint64_t v46 = ((uint64_t (*)(char *, char *, uint64_t))v31)(v11, v67, v4);
      uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
      os_log_type_t v48 = static os_log_type_t.default.getter();
      int v49 = v48;
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v50 = swift_slowAlloc(12LL, -1LL);
        int v64 = v49;
        uint64_t v51 = (uint8_t *)v50;
        uint64_t v65 = swift_slowAlloc(32LL, -1LL);
        v69[0] = v65;
        *(_DWORD *)uint64_t v51 = 136315138;
        v63 = v51 + 4;
        ((void (*)(char *, char *, uint64_t))v31)(v8, v11, v4);
        uint64_t v52 = String.init<A>(describing:)(v8, v4);
        unint64_t v54 = v53;
        uint64_t v68 = sub_66F4(v52, v53, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v63, v51 + 12);
        swift_bridgeObjectRelease(v54);
        v55 = *(void (**)(char *, uint64_t))(v5 + 8);
        v55(v11, v4);
        _os_log_impl( &dword_0,  v47,  (os_log_type_t)v64,  "[RedirectToCompanionFlow] ExecuteOnRemote flow completed with: %s",  v51,  0xCu);
        uint64_t v56 = v65;
        swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v56, -1LL, -1LL);
        swift_slowDealloc(v51, -1LL, -1LL);

        v57 = v67;
      }

      else
      {

        v55 = *(void (**)(char *, uint64_t))(v5 + 8);
        v55(v11, v4);
        v57 = v45;
      }

      v55(v57, v4);
      a2 = v66;
      uint64_t v59 = type metadata accessor for Input(0LL);
      sub_4C18((uint64_t)v22, 1LL, 2LL, v59);
      v55((char *)v14, v4);
    }
  }

  uint64_t v60 = a2 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state;
  swift_beginAccess(a2 + OBJC_IVAR____TtC16FindMyFlowPlugin23RedirectToCompanionFlow_state, v69, 33LL, 0LL);
  sub_66B0((uint64_t)v22, v60);
  swift_endAccess(v69);
  return sub_6520((uint64_t)v22);
}

uint64_t sub_59E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow(0LL);
  uint64_t v5 = sub_635C((unint64_t *)&qword_C1F8, (uint64_t)&unk_74A0);
  return Flow.deferToExecuteAsync(_:)(a1, a2, v4, v5);
}

uint64_t sub_5A54()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_5A84()
{
  return type metadata accessor for RedirectToCompanionFlow(0LL);
}

uint64_t type metadata accessor for RedirectToCompanionFlow(uint64_t a1)
{
  return sub_5B20(a1, (uint64_t *)&unk_C228, (uint64_t)&nominal type descriptor for RedirectToCompanionFlow);
}

uint64_t sub_5AA0(uint64_t a1)
{
  uint64_t result = type metadata accessor for RedirectToCompanionFlow.State(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 1LL, &v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for RedirectToCompanionFlow.State(uint64_t a1)
{
  return sub_5B20(a1, qword_C358, (uint64_t)&nominal type descriptor for RedirectToCompanionFlow.State);
}

uint64_t sub_5B20(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t *sub_5B50(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for Input(0LL);
    if (sub_5C08((uint64_t)a2, 2LL, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      sub_4C18((uint64_t)a1, 0LL, 2LL, v7);
    }
  }

  return a1;
}

uint64_t sub_5C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_5C14(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  uint64_t result = sub_5C08(a1, 2LL, v2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  }
  return result;
}

void *sub_5C6C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  if (sub_5C08((uint64_t)a2, 2LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    sub_4C18((uint64_t)a1, 0LL, 2LL, v6);
  }

  return a1;
}

void *sub_5D00(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  int v7 = sub_5C08((uint64_t)a1, 2LL, v6);
  int v8 = sub_5C08((uint64_t)a2, 2LL, v6);
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
  sub_4C18((uint64_t)a1, 0LL, 2LL, v6);
  return a1;
}

void *sub_5DE4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  if (sub_5C08((uint64_t)a2, 2LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    sub_4C18((uint64_t)a1, 0LL, 2LL, v6);
  }

  return a1;
}

void *sub_5E78(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  int v7 = sub_5C08((uint64_t)a1, 2LL, v6);
  int v8 = sub_5C08((uint64_t)a2, 2LL, v6);
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
  sub_4C18((uint64_t)a1, 0LL, 2LL, v6);
  return a1;
}

uint64_t sub_5F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5F68);
}

uint64_t sub_5F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6F1C();
  unsigned int v5 = sub_5C08(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_5FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5FB4);
}

uint64_t sub_5FB4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = sub_6F1C();
  return sub_4C18(a1, v5, a3, v6);
}

uint64_t sub_5FFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  return sub_5C08(a1, 2LL, v2);
}

uint64_t sub_6030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Input(0LL);
  return sub_4C18(a1, a2, 2LL, v4);
}

uint64_t sub_6068(uint64_t a1)
{
  uint64_t result = type metadata accessor for Input(319LL);
  if (v3 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload(a1, 256LL, *(void *)(result - 8) + 64LL, 2LL);
    return 0LL;
  }

  return result;
}

uint64_t sub_60BC()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_60DC()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

void (*sub_60FC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = SiriEnvironmentLocating<>.siriEnvironment.modify();
  return sub_615C;
}

void sub_615C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

BOOL sub_6188()
{
  return sub_4CA8();
}

uint64_t sub_61AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_6214;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_6214(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_6248(uint64_t a1, uint64_t a2)
{
  return sub_59E8(a1, a2);
}

uint64_t sub_6268(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_C23C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_62BC;
  return sub_4D48(a1);
}

uint64_t sub_62BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_62E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for RedirectToCompanionFlow(0LL);
  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_6314()
{
  return sub_635C((unint64_t *)&qword_C1F8, (uint64_t)&unk_74A0);
}

uint64_t sub_6338()
{
  return sub_635C(&qword_C378, (uint64_t)&unk_74F8);
}

uint64_t sub_635C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for RedirectToCompanionFlow(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_639C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_63DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc(async function pointer to HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_62BC;
  return HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()(a1, a2, a3);
}

uint64_t sub_6448()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_6E9C(v0, qword_C650);
  sub_64C4(v0, (uint64_t)qword_C650);
  return Logger.init(subsystem:category:)( 0xD000000000000015LL,  0x8000000000007910LL,  0xD000000000000026LL,  0x8000000000007930LL);
}

uint64_t sub_64C4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_64DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_6520(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_655C()
{
  unint64_t result = qword_C388;
  if (!qword_C388)
  {
    unint64_t result = swift_getWitnessTable(&unk_7578, &type metadata for SimpleHandoffStrategy);
    atomic_store(result, (unint64_t *)&qword_C388);
  }

  return result;
}

uint64_t sub_6598(uint64_t a1)
{
  return sub_536C(a1, v1);
}

unint64_t sub_65A0()
{
  unint64_t result = qword_C3A0;
  if (!qword_C3A0)
  {
    uint64_t v1 = sub_65E4(&qword_C398);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ConditionalFlow<A>, v1);
    atomic_store(result, (unint64_t *)&qword_C3A0);
  }

  return result;
}

uint64_t sub_65E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_6628(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_639C(&qword_C3A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_6670(uint64_t a1)
{
  uint64_t v2 = sub_639C(&qword_C3A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_66B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_66F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_67C4(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    int v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6E5C((uint64_t)v12, *a3);
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
      sub_6E5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_4B90(v12);
  return v7;
}

void *sub_67C4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_6918((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_69DC(a5, a6);
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

void *sub_6918(char *__src, size_t __n, char *__dst)
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

void *sub_69DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_6A70(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6C44(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6C44((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_6A70(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_6BE0(v4, 0LL);
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

void *sub_6BE0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_639C((uint64_t *)&unk_C3C0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_6C44(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_639C((uint64_t *)&unk_C3C0);
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
    sub_6DDC(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_6D18(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_6D18(char *__src, size_t __n, char *__dst)
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

char *sub_6DDC(char *__src, size_t __len, char *__dst)
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

uint64_t sub_6E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_6E9C(uint64_t a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for SimpleHandoffStrategy()
{
  return &type metadata for SimpleHandoffStrategy;
}

uint64_t sub_6EEC@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_6EFC()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_6F1C()
{
  return type metadata accessor for Input(0LL);
}

uint64_t sub_6F24(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 0LL, 0LL);
}

uint64_t sub_6F30@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}
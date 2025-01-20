uint64_t sub_1000030AC()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_10000684C(v0, qword_10000C4A0);
  sub_100005D2C(v0, (uint64_t)qword_10000C4A0);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x8000000100007820LL,  0xD00000000000001CLL,  0x80000001000072B0LL);
}

uint64_t sub_100003128(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100003164 + 4 * byte_1000072A0[a1]))( 0xD000000000000017LL,  0x80000001000074E0LL);
}

uint64_t sub_100003164()
{
  return 0x74754F64656D6974LL;
}

uint64_t sub_100003188()
{
  return 0x7463657078656E75LL;
}

uint64_t sub_1000031AC()
{
  return v0 + 1;
}

unint64_t sub_1000031E4()
{
  return 0xD000000000000011LL;
}

void sub_100003230(char *a1)
{
}

void sub_10000323C(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_100003288(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100003374 + 4 * byte_1000072B2[a2]))(0x74754F64656D6974LL);
}

uint64_t sub_100003374(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0x74754F64656D6974LL;
  if (a1 == 0x74754F64656D6974LL && v2 == 0xED0000726F727245LL) {
    char v4 = 1;
  }
  else {
    char v4 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))swift_bridgeObjectRelease)(v2, a2, v3);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(0xED0000726F727245LL);
  return v4 & 1;
}

Swift::Int sub_100003490()
{
  char v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  sub_1000034DC((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_1000034D4(uint64_t a1)
{
}

void sub_1000034DC(uint64_t a1, char a2)
{
  __asm { BR              X11 }

uint64_t sub_100003524(uint64_t a1)
{
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0xED0000726F727245LL);
}

Swift::Int sub_100003604(uint64_t a1)
{
  char v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  sub_1000034DC((uint64_t)v4, v2);
  return Hasher._finalize()();
}

unint64_t sub_100003644@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10000688C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100003670@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003128(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000036A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[40] = a3;
  v4[41] = a4;
  v4[38] = a1;
  v4[39] = a2;
  uint64_t v5 = type metadata accessor for TimedOutError(0LL);
  v4[42] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[43] = v6;
  v4[44] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CancellationError(0LL);
  v4[45] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[46] = v8;
  v4[47] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for LighthouseProcessorTaskAlreadyRunning(0LL);
  v4[48] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[49] = v10;
  v4[50] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for StreamBookmarkStoreError(0LL);
  v4[51] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v4[52] = v12;
  v4[53] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for LighthouseRuntimeError(0LL);
  v4[54] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v4[55] = v14;
  v4[56] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100005CEC(&qword_10000C038);
  v4[57] = swift_task_alloc((*(void *)(*(void *)(v15 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_100005CEC(&qword_10000C040);
  v4[58] = swift_task_alloc((*(void *)(*(void *)(v16 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
  v4[59] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v4[60] = v18;
  unint64_t v19 = (*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[61] = swift_task_alloc(v19);
  v4[62] = swift_task_alloc(v19);
  v4[63] = swift_task_alloc(v19);
  v4[64] = swift_task_alloc(v19);
  uint64_t v20 = type metadata accessor for PluginContext(0LL);
  v4[65] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v4[66] = v21;
  v4[67] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = sub_100005CEC(&qword_10000C048);
  v4[68] = swift_task_alloc((*(void *)(*(void *)(v22 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_100005CEC(&qword_10000C050);
  v4[69] = v23;
  unint64_t v24 = (*(void *)(*(void *)(v23 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[70] = swift_task_alloc(v24);
  v4[71] = swift_task_alloc(v24);
  uint64_t v25 = type metadata accessor for DispatchTimeInterval(0LL);
  v4[72] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v4[73] = v26;
  v4[74] = swift_task_alloc((*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = type metadata accessor for DispatchTime(0LL);
  v4[75] = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  v4[76] = v28;
  unint64_t v29 = (*(void *)(v28 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[77] = swift_task_alloc(v29);
  v4[78] = swift_task_alloc(v29);
  uint64_t v30 = type metadata accessor for DispatchWorkItemFlags(0LL);
  v4[79] = v30;
  v4[80] = swift_task_alloc((*(void *)(*(void *)(v30 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10000394C, 0LL, 0LL);
}

void sub_10000394C()
{
  if (qword_10000C110 != -1) {
    swift_once(&qword_10000C110, sub_1000030AC);
  }
  char v1 = (void *)v0[38];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v0[81] = sub_100005D2C(v2, (uint64_t)qword_10000C4A0);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[38];
  if (v5)
  {
    uint64_t v7 = swift_slowAlloc(22LL, -1LL);
    uint64_t v8 = swift_slowAlloc(64LL, -1LL);
    uint64_t v43 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = MLHostExtensionContext.taskId.getter();
    unint64_t v11 = v10;
    v0[37] = sub_100005FF8(v9, v10, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 37, v0 + 38, v7 + 4, v7 + 12);

    uint64_t v12 = swift_bridgeObjectRelease(v11);
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v13 = MLHostExtensionContext.taskName.getter(v12);
    unint64_t v15 = v14;
    v0[29] = sub_100005FF8(v13, v14, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 29, v0 + 30, v7 + 14, v7 + 22);

    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "TaskId: %s, TaskName: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

  unint64_t v16 = v0[41];
  unint64_t v17 = v16 + 1000;
  if (v16 >= 0xFFFFFFFFFFFFFC18LL)
  {
    __break(1u);
  }

  else
  {
    uint64_t v18 = v0[80];
    uint64_t v19 = v0[79];
    uint64_t v20 = swift_allocObject(&unk_100008728, 24LL, 7LL);
    *(void *)(v20 + 16) = v17;
    v0[16] = sub_100005D54;
    v0[17] = v20;
    v0[12] = _NSConcreteStackBlock;
    v0[13] = 1107296256LL;
    v0[14] = sub_100005690;
    v0[15] = &unk_100008740;
    uint64_t v21 = _Block_copy(v0 + 12);
    v0[34] = &_swiftEmptyArrayStorage;
    uint64_t v22 = sub_100006A5C( &qword_10000C058,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v23 = sub_100005CEC(&qword_10000C060);
    unint64_t v24 = sub_100005E64();
    dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 34, v23, v24, v19, v22);
    uint64_t v25 = type metadata accessor for DispatchWorkItem(0LL);
    swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    uint64_t v26 = DispatchWorkItem.init(flags:block:)(v18, v21);
    v0[82] = v26;
    swift_release(v0[17]);
    sub_100005EF4();
    uint64_t v27 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    if ((v17 & 0x8000000000000000LL) == 0)
    {
      uint64_t v28 = v0[78];
      uint64_t v29 = v0[77];
      uint64_t v30 = v0[76];
      uint64_t v31 = v0[75];
      v32 = (unint64_t *)v0[74];
      unint64_t v33 = v17;
      uint64_t v34 = v0[73];
      uint64_t v35 = v0[72];
      uint64_t v42 = v0[41];
      __int128 v41 = *(_OWORD *)(v0 + 39);
      unint64_t *v32 = v33;
      (*(void (**)(unint64_t *, void, uint64_t))(v34 + 104))( v32,  enum case for DispatchTimeInterval.milliseconds(_:),  v35);
      + infix(_:_:)(v29, v32);
      (*(void (**)(unint64_t *, uint64_t))(v34 + 8))(v32, v35);
      v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v36(v29, v31);
      OS_dispatch_queue.asyncAfter(deadline:execute:)(v28, v26);

      v36(v28, v31);
      *(_OWORD *)(v0 + 21) = v41;
      v0[23] = v42;
      v37 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
      v0[83] = v37;
      unint64_t v38 = sub_100005CA8();
      uint64_t v39 = sub_100005F30( &qword_10000C078,  &qword_10000C080,  (uint64_t)&protocol conformance descriptor for LighthouseRuntimeParams,  (uint64_t)&protocol conformance descriptor for <A> A?);
      uint64_t v40 = sub_100005F30( &qword_10000C088,  &qword_10000C090,  (uint64_t)&protocol conformance descriptor for LighthouseRuntimeParams,  (uint64_t)&protocol conformance descriptor for <A> A?);
      void *v37 = v0;
      v37[1] = sub_100003DCC;
      MLHostExtension.loadConfig<A>(context:)( v0[68],  v0[38],  &type metadata for SiriTurnRestatementExtension,  v0[69],  v38,  v39,  v40);
      return;
    }
  }

  __break(1u);
}

uint64_t sub_100003DCC()
{
  return swift_task_switch(sub_100003E20, 0LL, 0LL);
}

uint64_t sub_100003E20()
{
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v2 = sub_100005CEC(&qword_10000C098);
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2);
  uint64_t v5 = *(void *)(v0 + 568);
  if (v4 == 1)
  {
    sub_100006638(v1, &qword_10000C048);
    uint64_t v6 = type metadata accessor for LighthouseRuntimeParams(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  }

  else
  {
    MLHostParameters.taskParameters.getter(v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }

  uint64_t v86 = v0 + 288;
  uint64_t v7 = *(void *)(v0 + 560);
  sub_100006718(*(void *)(v0 + 568), v7, &qword_10000C050);
  uint64_t v8 = type metadata accessor for LighthouseRuntimeParams(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8);
  uint64_t v11 = *(void *)(v0 + 560);
  if (v10 == 1)
  {
    sub_100006638(*(void *)(v0 + 560), &qword_10000C050);
    uint64_t v12 = *(void *)(v0 + 328);
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 328);
    uint64_t v12 = LighthouseRuntimeParams.processTimeoutInMilliseconds.getter();
    char v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
    if ((v15 & 1) != 0) {
      uint64_t v12 = v13;
    }
  }

  unint64_t v16 = *(void **)(v0 + 512);
  uint64_t v88 = *(void *)(v0 + 480);
  unint64_t v17 = *(void **)(v0 + 304);
  uint64_t v94 = *(void *)(v0 + 320);
  swift_bridgeObjectRetain(v94);
  v18._countAndFlagsBits = 0x74736F484C4D2DLL;
  v18._object = (void *)0xE700000000000000LL;
  String.append(_:)(v18);
  uint64_t v19 = v94;
  uint64_t v93 = MLHostExtensionContext.taskName.getter();
  uint64_t v94 = v20;
  v21._countAndFlagsBits = 0x74736F484C4D2DLL;
  v21._object = (void *)0xE700000000000000LL;
  String.append(_:)(v21);
  id v22 = objc_allocWithZone(&OBJC_CLASS___TRIBackgroundMLTaskIdentifiers);
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v94);
  id v25 = [v22 initWithBMLTTaskId:v23 deploymentId:1 treatmentId:v24];

  uint64_t v26 = sub_100005CEC(&qword_10000C0A0);
  uint64_t inited = swift_initStackObject(v26, v0 + 16);
  *(_OWORD *)(inited + 16) = xmmword_1000074D0;
  *(void *)(inited + 32) = 0xD00000000000001CLL;
  *(void *)(inited + 40) = 0x80000001000075C0LL;
  *(void *)(inited + 72) = &type metadata for UInt64;
  *(void *)(inited + 48) = v12;
  unint64_t v28 = sub_1000056BC(inited);
  PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)( v25,  v28,  &_swiftEmptyArrayStorage,  0LL,  0LL,  v17);
  *unint64_t v16 = 0LL;
  *(_DWORD *)(v0 + 704) = enum case for LighthouseRuntimeProcessorResult.error(_:);
  uint64_t v29 = *(void (**)(void *))(v88 + 104);
  *(void *)(v0 + 672) = v29;
  v29(v16);
  uint64_t v30 = type metadata accessor for SiriTurnRestatementPlugin(0LL);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  *(void *)(v0 + 288) = SiriTurnRestatementPlugin.init()();
  uint64_t v31 = sub_100005CEC(&qword_10000C0B8);
  swift_allocObject(v31, *(unsigned int *)(v31 + 48), *(unsigned __int16 *)(v31 + 52));
  uint64_t v32 = LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)(0LL, v86, 0LL);
  *(void *)(v0 + 680) = v32;
  if (v32)
  {
    uint64_t v33 = *(void *)(v0 + 528);
    uint64_t v34 = *(void *)(v0 + 520);
    uint64_t v35 = *(void *)(v0 + 456);
    (*(void (**)(uint64_t, void, uint64_t))(v33 + 16))(v35, *(void *)(v0 + 536), v34);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v35, 0LL, 1LL, v34);
    v36 = (void *)swift_task_alloc(async function pointer to LighthouseRuntimeProcessor.processAsync(withContext:)[1]);
    *(void *)(v0 + 688) = v36;
    void *v36 = v0;
    v36[1] = sub_100004A14;
    return LighthouseRuntimeProcessor.processAsync(withContext:)(*(void *)(v0 + 464), *(void *)(v0 + 456));
  }

  uint64_t v38 = *(void *)(v0 + 504);
  uint64_t v39 = *(void *)(v0 + 472);
  uint64_t v40 = *(void *)(v0 + 464);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 480) + 56LL))(v40, 1LL, 1LL, v39);
  ((void (*)(uint64_t, void, uint64_t))v29)( v38,  enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:),  v39);
  sub_100006638(v40, &qword_10000C040);
  uint64_t v41 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 480) + 40LL))( *(void *)(v0 + 512),  *(void *)(v0 + 504),  *(void *)(v0 + 472));
  uint64_t v42 = v0 + 192;
  uint64_t v43 = (os_log_s *)Logger.logObject.getter(v41);
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = *(void *)(v0 + 512);
    uint64_t v46 = *(void *)(v0 + 496);
    uint64_t v48 = *(void *)(v0 + 472);
    uint64_t v47 = *(void *)(v0 + 480);
    v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    uint64_t v93 = v50;
    *(_DWORD *)v49 = 136315138;
    swift_beginAccess(v45, v0 + 144, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v46, v45, v48);
    uint64_t v51 = String.init<A>(describing:)(v46, v48);
    unint64_t v53 = v52;
    *(void *)(v0 + 280) = sub_100005FF8(v51, v52, &v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v86, v49 + 4, v49 + 12);
    swift_bridgeObjectRelease(v53);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Lighthouse runtime process result: %s", v49, 0xCu);
    swift_arrayDestroy(v50, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v54 = v50;
    uint64_t v42 = v0 + 192;
    swift_slowDealloc(v54, -1LL, -1LL);
    swift_slowDealloc(v49, -1LL, -1LL);
  }

  int v55 = *(_DWORD *)(v0 + 704);
  uint64_t v56 = *(void *)(v0 + 512);
  uint64_t v58 = *(void *)(v0 + 480);
  uint64_t v57 = *(void *)(v0 + 488);
  uint64_t v59 = *(void *)(v0 + 472);
  swift_beginAccess(v56, v42, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v57, v56, v59);
  uint64_t v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 88))(v57, v59);
  if ((_DWORD)v60 != v55)
  {
    if ((_DWORD)v60 != enum case for LighthouseRuntimeProcessorResult.success(_:))
    {
      if ((_DWORD)v60 == enum case for LighthouseRuntimeProcessorResult.cancelled(_:))
      {
        uint64_t v62 = 1LL;
        goto LABEL_20;
      }

      if ((_DWORD)v60 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)) {
        uint64_t v60 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 480) + 8LL))( *(void *)(v0 + 488),  *(void *)(v0 + 472));
      }
    }

    uint64_t v62 = 2LL;
    goto LABEL_20;
  }

  v61 = *(void **)(v0 + 488);
  (*(void (**)(void *, void))(*(void *)(v0 + 480) + 96LL))(v61, *(void *)(v0 + 472));
  uint64_t v60 = swift_errorRelease(*v61);
  uint64_t v62 = 0LL;
LABEL_20:
  dispatch thunk of DispatchWorkItem.cancel()(v60);
  uint64_t v63 = *(void *)(v0 + 656);
  uint64_t v64 = *(void *)(v0 + 568);
  uint64_t v65 = *(void *)(v0 + 536);
  uint64_t v66 = *(void *)(v0 + 528);
  uint64_t v67 = *(void *)(v0 + 520);
  uint64_t v68 = *(void *)(v0 + 472);
  uint64_t v69 = *(void *)(v0 + 480);
  uint64_t v91 = *(void *)(v0 + 512);
  id v70 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v80 = MLHostResult.init(status:policy:)(v62, 1LL);
  swift_release(v63);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v67);
  sub_100006638(v64, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v91, v68);
  uint64_t v71 = *(void *)(v0 + 624);
  uint64_t v72 = *(void *)(v0 + 616);
  uint64_t v73 = *(void *)(v0 + 592);
  uint64_t v74 = *(void *)(v0 + 568);
  uint64_t v75 = *(void *)(v0 + 560);
  uint64_t v76 = *(void *)(v0 + 544);
  uint64_t v77 = *(void *)(v0 + 536);
  uint64_t v79 = *(void *)(v0 + 504);
  uint64_t v78 = *(void *)(v0 + 512);
  uint64_t v81 = *(void *)(v0 + 496);
  uint64_t v82 = *(void *)(v0 + 488);
  uint64_t v83 = *(void *)(v0 + 464);
  uint64_t v84 = *(void *)(v0 + 456);
  uint64_t v85 = *(void *)(v0 + 448);
  uint64_t v87 = *(void *)(v0 + 424);
  uint64_t v89 = *(void *)(v0 + 400);
  uint64_t v90 = *(void *)(v0 + 376);
  uint64_t v92 = *(void *)(v0 + 352);
  swift_task_dealloc(*(void *)(v0 + 640));
  swift_task_dealloc(v71);
  swift_task_dealloc(v72);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v87);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v92);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v80);
}

uint64_t sub_100004A14()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 688);
  *(void *)(*v1 + 696) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 680);
  sub_100006638(*(void *)(v2 + 456), &qword_10000C038);
  swift_release(v4);
  if (v0) {
    uint64_t v5 = sub_100004EB8;
  }
  else {
    uint64_t v5 = sub_100004A9C;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100004A9C()
{
  uint64_t v1 = v0 + 192;
  uint64_t v2 = *(void *)(v0 + 504);
  uint64_t v4 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 464);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v5, 0LL, 1LL, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v5, v4);
  uint64_t v6 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 480) + 40LL))( *(void *)(v0 + 512),  *(void *)(v0 + 504),  *(void *)(v0 + 472));
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(v0 + 512);
    uint64_t v10 = *(void *)(v0 + 496);
    uint64_t v11 = *(void *)(v0 + 472);
    uint64_t v51 = *(void *)(v0 + 480);
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v57 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_beginAccess(v9, v0 + 144, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v10, v9, v11);
    uint64_t v14 = String.init<A>(describing:)(v10, v11);
    unint64_t v16 = v15;
    *(void *)(v0 + 280) = sub_100005FF8(v14, v15, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Lighthouse runtime process result: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    unint64_t v17 = v12;
    uint64_t v1 = v0 + 192;
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  int v18 = *(_DWORD *)(v0 + 704);
  uint64_t v19 = *(void *)(v0 + 512);
  uint64_t v21 = *(void *)(v0 + 480);
  uint64_t v20 = *(void *)(v0 + 488);
  uint64_t v22 = *(void *)(v0 + 472);
  swift_beginAccess(v19, v1, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v19, v22);
  uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 88))(v20, v22);
  if ((_DWORD)v23 != v18)
  {
    if ((_DWORD)v23 != enum case for LighthouseRuntimeProcessorResult.success(_:))
    {
      if ((_DWORD)v23 == enum case for LighthouseRuntimeProcessorResult.cancelled(_:))
      {
        uint64_t v25 = 1LL;
LABEL_11:
        uint64_t v55 = v25;
        goto LABEL_12;
      }

      if ((_DWORD)v23 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)) {
        uint64_t v23 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 480) + 8LL))( *(void *)(v0 + 488),  *(void *)(v0 + 472));
      }
    }

    uint64_t v25 = 2LL;
    goto LABEL_11;
  }

  NSString v24 = *(void **)(v0 + 488);
  (*(void (**)(void *, void))(*(void *)(v0 + 480) + 96LL))(v24, *(void *)(v0 + 472));
  uint64_t v23 = swift_errorRelease(*v24);
  uint64_t v55 = 0LL;
LABEL_12:
  dispatch thunk of DispatchWorkItem.cancel()(v23);
  uint64_t v26 = *(void *)(v0 + 656);
  uint64_t v27 = *(void *)(v0 + 568);
  uint64_t v28 = *(void *)(v0 + 536);
  uint64_t v29 = *(void *)(v0 + 528);
  uint64_t v30 = *(void *)(v0 + 520);
  uint64_t v31 = *(void *)(v0 + 512);
  uint64_t v33 = *(void *)(v0 + 472);
  uint64_t v32 = *(void *)(v0 + 480);
  id v34 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v56 = MLHostResult.init(status:policy:)(v55, 1LL);
  swift_release(v26);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  sub_100006638(v27, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  uint64_t v35 = *(void *)(v0 + 624);
  uint64_t v36 = *(void *)(v0 + 616);
  uint64_t v37 = *(void *)(v0 + 592);
  uint64_t v38 = *(void *)(v0 + 568);
  uint64_t v39 = *(void *)(v0 + 560);
  uint64_t v40 = *(void *)(v0 + 544);
  uint64_t v41 = *(void *)(v0 + 536);
  uint64_t v43 = *(void *)(v0 + 504);
  uint64_t v42 = *(void *)(v0 + 512);
  uint64_t v45 = *(void *)(v0 + 496);
  uint64_t v46 = *(void *)(v0 + 488);
  uint64_t v47 = *(void *)(v0 + 464);
  uint64_t v48 = *(void *)(v0 + 456);
  uint64_t v49 = *(void *)(v0 + 448);
  uint64_t v50 = *(void *)(v0 + 424);
  uint64_t v52 = *(void *)(v0 + 400);
  uint64_t v53 = *(void *)(v0 + 376);
  uint64_t v54 = *(void *)(v0 + 352);
  swift_task_dealloc(*(void *)(v0 + 640));
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v56);
}

uint64_t sub_100004EB8()
{
  uint64_t v1 = v0 + 192;
  uint64_t v2 = (void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 696);
  uint64_t v4 = *(void *)(v0 + 448);
  uint64_t v5 = *(void *)(v0 + 432);
  *(void *)(v0 + 264) = v3;
  swift_errorRetain(v3);
  uint64_t v6 = sub_100005CEC(&qword_10000C0A8);
  if ((swift_dynamicCast(v4, v0 + 264, v6, v5, 0LL) & 1) != 0)
  {
    int v7 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 440) + 88LL))( *(void *)(v0 + 448),  *(void *)(v0 + 432));
    if (v7 == enum case for LighthouseRuntimeError.missingDataRecords(_:))
    {
      swift_errorRelease(v3);
      uint64_t v8 = swift_errorRelease(*v2);
      char v84 = 0;
      char v9 = 3;
      goto LABEL_25;
    }

    if (v7 == enum case for LighthouseRuntimeError.missingWorkerResult(_:))
    {
      swift_errorRelease(v3);
      uint64_t v8 = swift_errorRelease(*v2);
      char v84 = 0;
      char v9 = 4;
      goto LABEL_25;
    }

    (*(void (**)(void, void))(*(void *)(v0 + 440) + 8LL))(*(void *)(v0 + 448), *(void *)(v0 + 432));
  }

  uint64_t v10 = (void *)(v0 + 216);
  uint64_t v11 = *(void *)(v0 + 424);
  uint64_t v12 = *(void *)(v0 + 408);
  swift_errorRelease(*(void *)(v0 + 264));
  *(void *)(v0 + 216) = v3;
  swift_errorRetain(v3);
  if (swift_dynamicCast(v11, v0 + 216, v6, v12, 0LL))
  {
    int v13 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 416) + 88LL))( *(void *)(v0 + 424),  *(void *)(v0 + 408));
    if (v13 == enum case for StreamBookmarkStoreError.emptyBookmarkName(_:))
    {
      swift_errorRelease(v3);
      uint64_t v8 = swift_errorRelease(*v10);
      char v84 = 0;
      char v9 = 6;
      goto LABEL_25;
    }

    if (v13 == enum case for StreamBookmarkStoreError.bookmarkArchive(_:))
    {
      swift_errorRelease(v3);
      uint64_t v8 = swift_errorRelease(*v10);
      char v84 = 0;
      char v9 = 7;
      goto LABEL_25;
    }

    if (v13 == enum case for StreamBookmarkStoreError.bookmarkUnarchive(_:))
    {
      swift_errorRelease(v3);
      uint64_t v8 = swift_errorRelease(*v10);
      char v84 = 0;
      char v9 = 8;
      goto LABEL_25;
    }

    (*(void (**)(void, void))(*(void *)(v0 + 416) + 8LL))(*(void *)(v0 + 424), *(void *)(v0 + 408));
  }

  swift_errorRelease(*v10);
  *(void *)(v0 + 224) = v3;
  swift_errorRetain(v3);
  if (swift_dynamicCast(v0 + 708, v0 + 224, v6, &type metadata for SiriTurnRestatementError, 0LL)
    && *(_BYTE *)(v0 + 708) == 5)
  {
    swift_errorRelease(v3);
    uint64_t v8 = swift_errorRelease(*(void *)(v0 + 224));
    char v84 = 0;
    char v9 = 5;
  }

  else
  {
    uint64_t v14 = *(void *)(v0 + 400);
    uint64_t v15 = *(void *)(v0 + 384);
    swift_errorRelease(*(void *)(v0 + 224));
    *(void *)(v0 + 240) = v3;
    swift_errorRetain(v3);
    if (swift_dynamicCast(v14, v0 + 240, v6, v15, 0LL))
    {
      uint64_t v17 = *(void *)(v0 + 392);
      uint64_t v16 = *(void *)(v0 + 400);
      uint64_t v18 = *(void *)(v0 + 384);
      swift_errorRelease(v3);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      uint64_t v8 = swift_errorRelease(*(void *)(v0 + 240));
      char v84 = 0;
      char v9 = 2;
    }

    else
    {
      uint64_t v19 = *(void *)(v0 + 376);
      uint64_t v20 = *(void *)(v0 + 360);
      swift_errorRelease(*(void *)(v0 + 240));
      *(void *)(v0 + 248) = v3;
      swift_errorRetain(v3);
      if (swift_dynamicCast(v19, v0 + 248, v6, v20, 0LL))
      {
        uint64_t v21 = *(void (**)(uint64_t, void, uint64_t))(v0 + 672);
        uint64_t v22 = *(void *)(v0 + 512);
        uint64_t v23 = *(void *)(v0 + 472);
        uint64_t v24 = *(void *)(v0 + 480);
        uint64_t v26 = *(void *)(v0 + 368);
        uint64_t v25 = *(void *)(v0 + 376);
        uint64_t v27 = *(void *)(v0 + 360);
        swift_errorRelease(v3);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
        v21(v22, enum case for LighthouseRuntimeProcessorResult.cancelled(_:), v23);
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
        uint64_t v8 = swift_errorRelease(*(void *)(v0 + 248));
        char v80 = 9;
        char v84 = 1;
        goto LABEL_26;
      }

      uint64_t v28 = *(void *)(v0 + 352);
      uint64_t v29 = *(void *)(v0 + 336);
      swift_errorRelease(*(void *)(v0 + 248));
      *(void *)(v0 + 256) = v3;
      swift_errorRetain(v3);
      if (swift_dynamicCast(v28, v0 + 256, v6, v29, 0LL))
      {
        uint64_t v31 = *(void *)(v0 + 344);
        uint64_t v30 = *(void *)(v0 + 352);
        uint64_t v32 = *(void *)(v0 + 336);
        swift_errorRelease(v3);
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
        uint64_t v8 = swift_errorRelease(*(void *)(v0 + 256));
        char v84 = 0;
        char v80 = 0;
        goto LABEL_26;
      }

      swift_errorRelease(*(void *)(v0 + 256));
      uint64_t v8 = swift_errorRelease(v3);
      char v84 = 0;
      char v9 = 1;
    }
  }

LABEL_25:
  char v80 = v9;
LABEL_26:
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = *(void *)(v0 + 512);
    uint64_t v36 = *(void *)(v0 + 496);
    uint64_t v37 = *(void *)(v0 + 472);
    uint64_t v38 = *(void *)(v0 + 480);
    uint64_t v39 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v40 = swift_slowAlloc(32LL, -1LL);
    v86[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    swift_beginAccess(v35, v0 + 144, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v36, v35, v37);
    uint64_t v41 = v36;
    uint64_t v1 = v0 + 192;
    uint64_t v42 = String.init<A>(describing:)(v41, v37);
    unint64_t v44 = v43;
    *(void *)(v0 + 280) = sub_100005FF8(v42, v43, v86);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v39 + 4, v39 + 12);
    swift_bridgeObjectRelease(v44);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Lighthouse runtime process result: %s", v39, 0xCu);
    swift_arrayDestroy(v40, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1LL, -1LL);
    swift_slowDealloc(v39, -1LL, -1LL);
  }

  int v45 = *(_DWORD *)(v0 + 704);
  uint64_t v46 = *(void *)(v0 + 512);
  uint64_t v48 = *(void *)(v0 + 480);
  uint64_t v47 = *(void *)(v0 + 488);
  uint64_t v49 = *(void *)(v0 + 472);
  swift_beginAccess(v46, v1, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v47, v46, v49);
  uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 88))(v47, v49);
  if ((_DWORD)v50 == v45)
  {
    uint64_t v51 = *(void **)(v0 + 488);
    (*(void (**)(void *, void))(*(void *)(v0 + 480) + 96LL))(v51, *(void *)(v0 + 472));
    uint64_t v50 = swift_errorRelease(*v51);
    uint64_t v52 = 0LL;
    goto LABEL_34;
  }

  if ((_DWORD)v50 == enum case for LighthouseRuntimeProcessorResult.success(_:)) {
    goto LABEL_31;
  }
  if ((_DWORD)v50 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:))
  {
    if ((_DWORD)v50 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)) {
      uint64_t v50 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 480) + 8LL))( *(void *)(v0 + 488),  *(void *)(v0 + 472));
    }
LABEL_31:
    uint64_t v52 = 2LL;
    goto LABEL_34;
  }

  uint64_t v52 = 1LL;
LABEL_34:
  dispatch thunk of DispatchWorkItem.cancel()(v50);
  uint64_t v53 = *(void *)(v0 + 656);
  uint64_t v54 = *(void *)(v0 + 568);
  uint64_t v55 = *(void *)(v0 + 536);
  uint64_t v56 = *(void *)(v0 + 528);
  uint64_t v57 = *(void *)(v0 + 520);
  uint64_t v82 = *(void *)(v0 + 512);
  uint64_t v58 = *(void *)(v0 + 472);
  uint64_t v59 = *(void *)(v0 + 480);
  if ((v84 & 1) != 0)
  {
    id v60 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v61 = MLHostResult.init(status:policy:)(v52, 1LL);
  }

  else
  {
    v86[3] = (uint64_t)&type metadata for SiriTurnRestatementError;
    v86[4] = sub_100005FB4();
    LOBYTE(v86[0]) = v80;
    id v62 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v61 = MLHostResult.init(error:policy:)(v86, 1LL);
  }

  uint64_t v85 = v61;
  swift_release(v53);
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  sub_100006638(v54, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v82, v58);
  uint64_t v63 = *(void *)(v0 + 624);
  uint64_t v64 = *(void *)(v0 + 616);
  uint64_t v65 = *(void *)(v0 + 592);
  uint64_t v66 = *(void *)(v0 + 568);
  uint64_t v67 = *(void *)(v0 + 560);
  uint64_t v68 = *(void *)(v0 + 544);
  uint64_t v69 = *(void *)(v0 + 536);
  uint64_t v71 = *(void *)(v0 + 504);
  uint64_t v70 = *(void *)(v0 + 512);
  uint64_t v73 = *(void *)(v0 + 496);
  uint64_t v74 = *(void *)(v0 + 488);
  uint64_t v75 = *(void *)(v0 + 464);
  uint64_t v76 = *(void *)(v0 + 456);
  uint64_t v77 = *(void *)(v0 + 448);
  uint64_t v78 = *(void *)(v0 + 424);
  uint64_t v79 = *(void *)(v0 + 400);
  uint64_t v81 = *(void *)(v0 + 376);
  uint64_t v83 = *(void *)(v0 + 352);
  swift_task_dealloc(*(void *)(v0 + 640));
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v71);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v81);
  swift_task_dealloc(v83);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v85);
}

uint64_t sub_100005690(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

unint64_t sub_1000056BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005CEC(&qword_10000C0C8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100006718(v7, (uint64_t)&v16, &qword_10000C0D0);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_1000066B4(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10000675C(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000057F0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C0D8 + dword_10000C0D8);
  uint64_t v1 = (void *)swift_task_alloc(unk_10000C0DC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006D98;
  return v3();
}

uint64_t sub_100005848(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v7 = (void *)swift_task_alloc(dword_10000C034);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000058B0;
  return sub_1000036A8(a1, v4, v5, v6);
}

uint64_t sub_1000058B0(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100005900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_10000599C;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_10000599C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000059E4(uint64_t a1)
{
  unint64_t v2 = sub_100005CA8();
  return MLHostExtension.configuration.getter(a1, v2);
}

void sub_100005A1C(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000001000072B0LL;
  a1[2] = 120000LL;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005AA0()
{
  unint64_t result = qword_10000C008[0];
  if (!qword_10000C008[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100007330, &type metadata for SiriTurnRestatementExtension);
    atomic_store(result, qword_10000C008);
  }

  return result;
}

uint64_t destroy for SiriTurnRestatementExtension(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *_s28SiriTurnRestatementExtension28SiriTurnRestatementExtensionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriTurnRestatementExtension(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for SiriTurnRestatementExtension(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for SiriTurnRestatementExtension(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementExtension(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementExtension(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementExtension()
{
  return &type metadata for SiriTurnRestatementExtension;
}

uint64_t sub_100005C64(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100005CA8();
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

unint64_t sub_100005CA8()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000072F0, &type metadata for SiriTurnRestatementExtension);
    atomic_store(result, &qword_10000C028);
  }

  return result;
}

uint64_t sub_100005CEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005D2C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005D44()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100005D54()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (qword_10000C110 != -1) {
    swift_once(&qword_10000C110, sub_1000030AC);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100005D2C(v2, (uint64_t)qword_10000C4A0);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v6 = 134217984;
    uint64_t v7 = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Timeout after %llums, force exiting", v6, 0xCu);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  exit(0);
}

uint64_t sub_100005E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005E5C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_100005E64()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    uint64_t v1 = sub_100005EB0(&qword_10000C060);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }

  return result;
}

uint64_t sub_100005EB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100005EF4()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }

  return result;
}

uint64_t sub_100005F30(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = sub_100005EB0(&qword_10000C050);
    sub_100006A5C(a2, (uint64_t (*)(uint64_t))&type metadata accessor for LighthouseRuntimeParams, a3);
    uint64_t result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100005FB4()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000746C, &type metadata for SiriTurnRestatementError);
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }

  return result;
}

uint64_t sub_100005FF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000060C8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006674((uint64_t)v12, *a3);
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
      sub_100006674((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006AD8(v12);
  return v7;
}

uint64_t sub_1000060C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100006280(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100006280(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006314(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000064EC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000064EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006314(uint64_t a1, unint64_t a2)
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
      os_log_type_t v5 = sub_100006488(v4, 0LL);
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

void *sub_100006488(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100005CEC(&qword_10000C0C0);
  os_log_type_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000064EC(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005CEC(&qword_10000C0C0);
    char v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    char v11 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t sub_100006638(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005CEC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100006674(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000066B4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000676C(a1, a2, v5);
}

uint64_t sub_100006718(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005CEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000675C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000676C(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t *sub_10000684C(uint64_t a1, uint64_t *a2)
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

unint64_t sub_10000688C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000085A0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9) {
    return 9LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000068D4()
{
  return swift_task_switch(sub_1000068E8, 0LL, 0LL);
}

uint64_t sub_1000068E8()
{
  uint64_t v1 = type metadata accessor for SiriTurnRestatementFeatureFlags(0LL);
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_100006A5C( &qword_10000C0E0,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriTurnRestatementFeatureFlags,  (uint64_t)&protocol conformance descriptor for SiriTurnRestatementFeatureFlags);
  Swift::String v2 = sub_100006A9C((void *)(v0 + 16));
  (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104LL))( v2,  enum case for SiriTurnRestatementFeatureFlags.runOnAllPlatforms(_:),  v1);
  LOBYTE(v1) = isFeatureEnabled(_:)(v0 + 16);
  sub_100006AD8((void *)(v0 + 16));
  uint64_t v3 = 0LL;
  if ((v1 & 1) == 0)
  {
    if (qword_10000C110 != -1) {
      swift_once(&qword_10000C110, sub_1000030AC);
    }
    uint64_t v4 = type metadata accessor for Logger(0LL);
    sub_100005D2C(v4, (uint64_t)qword_10000C4A0);
    uint64_t v5 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      int64_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)int64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "SiriTurnRestatement disabled on the platform. Not continuing.",  v7,  2u);
      swift_slowDealloc(v7, -1LL, -1LL);
    }

    uint64_t v3 = 1LL;
  }

  id v8 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v9 = MLHostResult.init(status:policy:)(2LL, v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_100006A5C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void *sub_100006A9C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100006AD8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for SiriTurnRestatementError(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_100006BE4 + 4 * byte_1000072C9[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_100006C18 + 4 * byte_1000072C4[v4]))();
}

uint64_t sub_100006C18(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006C20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006C28LL);
  }
  return result;
}

uint64_t sub_100006C34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006C3CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 8;
  return result;
}

uint64_t sub_100006C40(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006C48(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006C54(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006C60(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementError()
{
  return &type metadata for SiriTurnRestatementError;
}

unint64_t sub_100006C7C()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007444, &type metadata for SiriTurnRestatementError);
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }

  return result;
}

unint64_t sub_100006CC4()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000738C, &type metadata for SiriTurnRestatementError);
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }

  return result;
}

unint64_t sub_100006D0C()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000073CC, &type metadata for SiriTurnRestatementError);
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }

  return result;
}

unint64_t sub_100006D54()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }

  return result;
}
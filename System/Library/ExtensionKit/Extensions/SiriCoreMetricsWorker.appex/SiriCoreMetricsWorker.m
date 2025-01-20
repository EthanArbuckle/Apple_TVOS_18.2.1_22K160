uint64_t sub_100003C94()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_100006C4C(v0, qword_10000C470);
  sub_10000627C(v0, (uint64_t)qword_10000C470);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x80000001000078F0LL,  0xD000000000000015LL,  0x80000001000073A0LL);
}

uint64_t sub_100003D10(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100003D4C + 4 * byte_100007390[a1]))( 0xD000000000000017LL,  0x80000001000075C0LL);
}

uint64_t sub_100003D4C()
{
  return 0x74754F64656D6974LL;
}

uint64_t sub_100003D70()
{
  return 0x7463657078656E75LL;
}

uint64_t sub_100003D94()
{
  return v0 + 1;
}

unint64_t sub_100003DCC()
{
  return 0xD000000000000011LL;
}

void sub_100003E18(char *a1)
{
}

void sub_100003E24(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_100003E70(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100003F5C + 4 * byte_1000073A2[a2]))(0x74754F64656D6974LL);
}

uint64_t sub_100003F5C(uint64_t a1, uint64_t a2)
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

Swift::Int sub_100004078()
{
  char v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  sub_1000040C4((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_1000040BC(uint64_t a1)
{
}

void sub_1000040C4(uint64_t a1, char a2)
{
  __asm { BR              X11 }

uint64_t sub_10000410C(uint64_t a1)
{
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0xED0000726F727245LL);
}

Swift::Int sub_1000041EC(uint64_t a1)
{
  char v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  sub_1000040C4((uint64_t)v4, v2);
  return Hasher._finalize()();
}

unint64_t sub_10000422C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_100006F2C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100004258@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003D10(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[30] = a2;
  v3[31] = a3;
  v3[29] = a1;
  uint64_t v4 = type metadata accessor for TimedOutError(0LL);
  v3[32] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[33] = v5;
  v3[34] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for LighthouseProcessorTaskAlreadyRunning(0LL);
  v3[35] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[36] = v7;
  v3[37] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for StreamBookmarkStoreError(0LL);
  v3[38] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[39] = v9;
  v3[40] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for LighthouseRuntimeError(0LL);
  v3[41] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[42] = v11;
  v3[43] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000623C(&qword_10000C038);
  v3[44] = swift_task_alloc((*(void *)(*(void *)(v12 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_10000623C(&qword_10000C040);
  v3[45] = swift_task_alloc((*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
  v3[46] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[47] = v15;
  unint64_t v16 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[48] = swift_task_alloc(v16);
  v3[49] = swift_task_alloc(v16);
  v3[50] = swift_task_alloc(v16);
  v3[51] = swift_task_alloc(v16);
  uint64_t v17 = type metadata accessor for PluginContext(0LL);
  v3[52] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v3[53] = v18;
  v3[54] = swift_task_alloc((*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_10000623C(&qword_10000C048);
  v3[55] = swift_task_alloc((*(void *)(*(void *)(v19 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_10000623C(&qword_10000C050);
  v3[56] = v20;
  unint64_t v21 = (*(void *)(*(void *)(v20 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[57] = swift_task_alloc(v21);
  v3[58] = swift_task_alloc(v21);
  return swift_task_switch(sub_100004488, 0LL, 0LL);
}

uint64_t sub_100004488()
{
  if (qword_10000C0E0 != -1) {
    swift_once(&qword_10000C0E0, sub_100003C94);
  }
  char v1 = (void *)v0[29];
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v0[59] = sub_10000627C(v2, (uint64_t)qword_10000C470);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[29];
  if (v5)
  {
    uint64_t v7 = swift_slowAlloc(22LL, -1LL);
    uint64_t v21 = swift_slowAlloc(64LL, -1LL);
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = MLHostExtensionContext.taskId.getter();
    unint64_t v10 = v9;
    v0[27] = sub_1000063D8(v8, v9, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 27, v0 + 28, v7 + 4, v7 + 12);

    uint64_t v11 = swift_bridgeObjectRelease(v10);
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v12 = MLHostExtensionContext.taskName.getter(v11);
    unint64_t v14 = v13;
    v0[28] = sub_1000063D8(v12, v13, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 28, v0 + 29, v7 + 14, v7 + 22);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "TaskId: %s, TaskName: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v21, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v15 = v0[31];
  v0[18] = v0[30];
  v0[19] = v15;
  unint64_t v16 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  v0[60] = v16;
  unint64_t v17 = sub_1000061F8();
  uint64_t v18 = sub_1000062D8( &qword_10000C058,  &qword_10000C060,  (uint64_t)&protocol conformance descriptor for LighthouseRuntimeParams,  (uint64_t)&protocol conformance descriptor for <A> A?);
  uint64_t v19 = sub_1000062D8( &qword_10000C068,  &qword_10000C070,  (uint64_t)&protocol conformance descriptor for LighthouseRuntimeParams,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *unint64_t v16 = v0;
  v16[1] = sub_100004724;
  return MLHostExtension.loadConfig<A>(context:)( v0[55],  v0[29],  &type metadata for SiriCoreMetricsWorker,  v0[56],  v17,  v18,  v19);
}

uint64_t sub_100004724()
{
  return swift_task_switch(sub_100004778, 0LL, 0LL);
}

uint64_t sub_100004778()
{
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = sub_10000623C(&qword_10000C078);
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2);
  uint64_t v5 = *(void *)(v0 + 464);
  if (v4 == 1)
  {
    sub_100006A18(v1, &qword_10000C048);
    uint64_t v6 = type metadata accessor for LighthouseRuntimeParams(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  }

  else
  {
    MLHostParameters.taskParameters.getter(v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  }

  uint64_t v7 = *(void *)(v0 + 456);
  uint64_t v8 = *(void *)(v0 + 464);
  uint64_t v84 = v0 + 208;
  uint64_t v87 = *(void *)(v0 + 248);
  swift_bridgeObjectRetain(v87);
  v9._countAndFlagsBits = 0x74736F484C4D2DLL;
  v9._object = (void *)0xE700000000000000LL;
  String.append(_:)(v9);
  uint64_t v10 = v87;
  uint64_t v86 = MLHostExtensionContext.taskName.getter();
  uint64_t v87 = v11;
  v12._countAndFlagsBits = 0x74736F484C4D2DLL;
  v12._object = (void *)0xE700000000000000LL;
  String.append(_:)(v12);
  id v13 = objc_allocWithZone(&OBJC_CLASS___TRIBackgroundMLTaskIdentifiers);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v87);
  id v16 = [v13 initWithBMLTTaskId:v14 deploymentId:1 treatmentId:v15];

  uint64_t v17 = sub_10000623C(&qword_10000C080);
  uint64_t inited = swift_initStackObject(v17, v0 + 16);
  *(_OWORD *)(inited + 16) = xmmword_1000075B0;
  *(void *)(inited + 32) = 0xD00000000000001CLL;
  *(void *)(inited + 40) = 0x8000000100007690LL;
  sub_100006B18(v8, v7, &qword_10000C050);
  uint64_t v19 = type metadata accessor for LighthouseRuntimeParams(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v7, 1LL, v19);
  uint64_t v22 = *(void *)(v0 + 456);
  if (v21 == 1)
  {
    sub_100006A18(*(void *)(v0 + 456), &qword_10000C050);
    *(void *)(inited + 72) = &type metadata for UInt64;
  }

  else
  {
    uint64_t v23 = LighthouseRuntimeParams.processTimeoutInMilliseconds.getter();
    char v25 = v24;
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v19);
    *(void *)(inited + 72) = &type metadata for UInt64;
    if ((v25 & 1) == 0) {
      goto LABEL_8;
    }
  }

  uint64_t v23 = 120000LL;
LABEL_8:
  v26 = *(void **)(v0 + 408);
  uint64_t v27 = *(void *)(v0 + 376);
  v28 = *(void **)(v0 + 232);
  *(void *)(inited + 48) = v23;
  unint64_t v29 = sub_100005C48(inited);
  PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)( v16,  v29,  &_swiftEmptyArrayStorage,  0LL,  0LL,  v28);
  void *v26 = 0LL;
  *(_DWORD *)(v0 + 512) = enum case for LighthouseRuntimeProcessorResult.error(_:);
  v30 = *(void (**)(void *))(v27 + 104);
  v30(v26);
  uint64_t v31 = type metadata accessor for SiriCoreMetricsV2(0LL);
  swift_allocObject(v31, *(unsigned int *)(v31 + 48), *(unsigned __int16 *)(v31 + 52));
  *(void *)(v0 + 208) = SiriCoreMetricsV2.init()();
  uint64_t v32 = sub_10000623C(&qword_10000C098);
  swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
  uint64_t v33 = LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)(0LL, v84, 0LL);
  *(void *)(v0 + 488) = v33;
  if (v33)
  {
    uint64_t v34 = *(void *)(v0 + 424);
    uint64_t v35 = *(void *)(v0 + 416);
    uint64_t v36 = *(void *)(v0 + 352);
    (*(void (**)(uint64_t, void, uint64_t))(v34 + 16))(v36, *(void *)(v0 + 432), v35);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v36, 0LL, 1LL, v35);
    v37 = (void *)swift_task_alloc(async function pointer to LighthouseRuntimeProcessor.processAsync(withContext:)[1]);
    *(void *)(v0 + 496) = v37;
    void *v37 = v0;
    v37[1] = sub_1000051DC;
    return LighthouseRuntimeProcessor.processAsync(withContext:)(*(void *)(v0 + 360), *(void *)(v0 + 352));
  }

  else
  {
    uint64_t v39 = *(void *)(v0 + 400);
    uint64_t v40 = *(void *)(v0 + 368);
    uint64_t v41 = *(void *)(v0 + 360);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 376) + 56LL))(v41, 1LL, 1LL, v40);
    ((void (*)(uint64_t, void, uint64_t))v30)( v39,  enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:),  v40);
    sub_100006A18(v41, &qword_10000C040);
    uint64_t v42 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 376) + 40LL))( *(void *)(v0 + 408),  *(void *)(v0 + 400),  *(void *)(v0 + 368));
    uint64_t v43 = v0 + 120;
    v44 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v45 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = *(void *)(v0 + 408);
      uint64_t v47 = *(void *)(v0 + 392);
      uint64_t v48 = *(void *)(v0 + 368);
      uint64_t v49 = *(void *)(v0 + 376);
      v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v51 = swift_slowAlloc(32LL, -1LL);
      uint64_t v86 = v51;
      *(_DWORD *)v50 = 136315138;
      swift_beginAccess(v46, v0 + 96, 0LL, 0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v47, v46, v48);
      uint64_t v52 = String.init<A>(describing:)(v47, v48);
      unint64_t v54 = v53;
      *(void *)(v0 + 200) = sub_1000063D8(v52, v53, &v86);
      uint64_t v43 = v0 + 120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v84, v50 + 4, v50 + 12);
      swift_bridgeObjectRelease(v54);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Lighthouse runtime process result: %s", v50, 0xCu);
      swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1LL, -1LL);
      swift_slowDealloc(v50, -1LL, -1LL);
    }

    int v55 = *(_DWORD *)(v0 + 512);
    uint64_t v56 = *(void *)(v0 + 408);
    uint64_t v58 = *(void *)(v0 + 376);
    uint64_t v57 = *(void *)(v0 + 384);
    uint64_t v59 = *(void *)(v0 + 368);
    swift_beginAccess(v56, v43, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v57, v56, v59);
    int v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 88))(v57, v59);
    if (v60 == v55)
    {
      v61 = *(void **)(v0 + 384);
      (*(void (**)(void *, void))(*(void *)(v0 + 376) + 96LL))(v61, *(void *)(v0 + 368));
      swift_errorRelease(*v61);
      uint64_t v62 = 0LL;
    }

    else
    {
      uint64_t v62 = 2LL;
      if (v60 != enum case for LighthouseRuntimeProcessorResult.success(_:)
        && v60 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
        && v60 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
      {
        (*(void (**)(void, void))(*(void *)(v0 + 376) + 8LL))( *(void *)(v0 + 384),  *(void *)(v0 + 368));
        uint64_t v62 = 2LL;
      }
    }

    uint64_t v63 = *(void *)(v0 + 464);
    uint64_t v65 = *(void *)(v0 + 424);
    uint64_t v64 = *(void *)(v0 + 432);
    uint64_t v66 = *(void *)(v0 + 408);
    uint64_t v67 = *(void *)(v0 + 416);
    uint64_t v69 = *(void *)(v0 + 368);
    uint64_t v68 = *(void *)(v0 + 376);
    id v70 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v85 = MLHostResult.init(status:policy:)(v62, 1LL);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v67);
    sub_100006A18(v63, &qword_10000C050);
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v66, v69);
    uint64_t v71 = *(void *)(v0 + 456);
    uint64_t v73 = *(void *)(v0 + 432);
    uint64_t v72 = *(void *)(v0 + 440);
    uint64_t v75 = *(void *)(v0 + 400);
    uint64_t v74 = *(void *)(v0 + 408);
    uint64_t v77 = *(void *)(v0 + 384);
    uint64_t v76 = *(void *)(v0 + 392);
    uint64_t v78 = *(void *)(v0 + 352);
    uint64_t v79 = *(void *)(v0 + 360);
    uint64_t v80 = *(void *)(v0 + 344);
    uint64_t v81 = *(void *)(v0 + 320);
    uint64_t v82 = *(void *)(v0 + 296);
    uint64_t v83 = *(void *)(v0 + 272);
    swift_task_dealloc(*(void *)(v0 + 464));
    swift_task_dealloc(v71);
    swift_task_dealloc(v72);
    swift_task_dealloc(v73);
    swift_task_dealloc(v74);
    swift_task_dealloc(v75);
    swift_task_dealloc(v76);
    swift_task_dealloc(v77);
    swift_task_dealloc(v79);
    swift_task_dealloc(v78);
    swift_task_dealloc(v80);
    swift_task_dealloc(v81);
    swift_task_dealloc(v82);
    swift_task_dealloc(v83);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v85);
  }

uint64_t sub_1000051DC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 496);
  *(void *)(*v1 + 504) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 488);
  sub_100006A18(*(void *)(v2 + 352), &qword_10000C038);
  swift_release(v4);
  if (v0) {
    uint64_t v5 = sub_100005608;
  }
  else {
    uint64_t v5 = sub_100005264;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100005264()
{
  uint64_t v1 = v0 + 120;
  uint64_t v2 = *(void *)(v0 + 400);
  uint64_t v4 = *(void *)(v0 + 368);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 360);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v5, 0LL, 1LL, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v5, v4);
  uint64_t v6 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 376) + 40LL))( *(void *)(v0 + 408),  *(void *)(v0 + 400),  *(void *)(v0 + 368));
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(v0 + 408);
    uint64_t v10 = *(void *)(v0 + 392);
    uint64_t v11 = *(void *)(v0 + 368);
    uint64_t v46 = *(void *)(v0 + 376);
    Swift::String v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v50 = v13;
    *(_DWORD *)Swift::String v12 = 136315138;
    swift_beginAccess(v9, v0 + 96, 0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v10, v9, v11);
    uint64_t v14 = String.init<A>(describing:)(v10, v11);
    unint64_t v16 = v15;
    *(void *)(v0 + 200) = sub_1000063D8(v14, v15, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v12 + 4, v12 + 12);
    unint64_t v17 = v16;
    uint64_t v1 = v0 + 120;
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Lighthouse runtime process result: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  int v18 = *(_DWORD *)(v0 + 512);
  uint64_t v19 = *(void *)(v0 + 408);
  uint64_t v21 = *(void *)(v0 + 376);
  uint64_t v20 = *(void *)(v0 + 384);
  uint64_t v22 = *(void *)(v0 + 368);
  swift_beginAccess(v19, v1, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v19, v22);
  int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 88))(v20, v22);
  if (v23 == v18)
  {
    char v24 = *(void **)(v0 + 384);
    (*(void (**)(void *, void))(*(void *)(v0 + 376) + 96LL))(v24, *(void *)(v0 + 368));
    swift_errorRelease(*v24);
    uint64_t v25 = 0LL;
  }

  else
  {
    uint64_t v25 = 2LL;
    if (v23 != enum case for LighthouseRuntimeProcessorResult.success(_:)
      && v23 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
      && v23 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
    {
      (*(void (**)(void, void))(*(void *)(v0 + 376) + 8LL))( *(void *)(v0 + 384),  *(void *)(v0 + 368));
      uint64_t v25 = 2LL;
    }
  }

  uint64_t v26 = *(void *)(v0 + 464);
  uint64_t v28 = *(void *)(v0 + 424);
  uint64_t v27 = *(void *)(v0 + 432);
  uint64_t v30 = *(void *)(v0 + 408);
  uint64_t v29 = *(void *)(v0 + 416);
  uint64_t v31 = *(void *)(v0 + 368);
  uint64_t v32 = *(void *)(v0 + 376);
  id v33 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v49 = MLHostResult.init(status:policy:)(v25, 1LL);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  sub_100006A18(v26, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
  uint64_t v34 = *(void *)(v0 + 456);
  uint64_t v36 = *(void *)(v0 + 432);
  uint64_t v35 = *(void *)(v0 + 440);
  uint64_t v38 = *(void *)(v0 + 400);
  uint64_t v37 = *(void *)(v0 + 408);
  uint64_t v40 = *(void *)(v0 + 384);
  uint64_t v39 = *(void *)(v0 + 392);
  uint64_t v41 = *(void *)(v0 + 352);
  uint64_t v42 = *(void *)(v0 + 360);
  uint64_t v44 = *(void *)(v0 + 344);
  uint64_t v45 = *(void *)(v0 + 320);
  uint64_t v47 = *(void *)(v0 + 296);
  uint64_t v48 = *(void *)(v0 + 272);
  swift_task_dealloc(*(void *)(v0 + 464));
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v42);
  swift_task_dealloc(v41);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v49);
}

uint64_t sub_100005608()
{
  uint64_t v1 = *(void *)(v0 + 504);
  *(void *)(v0 + 192) = v1;
  uint64_t v2 = (void *)(v0 + 192);
  uint64_t v3 = v0 + 120;
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v5 = *(void *)(v0 + 328);
  swift_errorRetain(v1);
  uint64_t v6 = sub_10000623C(&qword_10000C088);
  if ((swift_dynamicCast(v4, v0 + 192, v6, v5, 0LL) & 1) != 0)
  {
    int v7 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 336) + 88LL))( *(void *)(v0 + 344),  *(void *)(v0 + 328));
    if (v7 == enum case for LighthouseRuntimeError.missingDataRecords(_:))
    {
      swift_errorRelease(v1);
      uint64_t v8 = swift_errorRelease(*v2);
      char v9 = 3;
      goto LABEL_22;
    }

    if (v7 == enum case for LighthouseRuntimeError.missingWorkerResult(_:))
    {
      swift_errorRelease(v1);
      uint64_t v8 = swift_errorRelease(*v2);
      char v9 = 4;
      goto LABEL_22;
    }

    (*(void (**)(void, void))(*(void *)(v0 + 336) + 8LL))(*(void *)(v0 + 344), *(void *)(v0 + 328));
  }

  uint64_t v10 = (void *)(v0 + 184);
  uint64_t v11 = *(void *)(v0 + 320);
  uint64_t v12 = *(void *)(v0 + 304);
  swift_errorRelease(*(void *)(v0 + 192));
  *(void *)(v0 + 184) = v1;
  swift_errorRetain(v1);
  if (swift_dynamicCast(v11, v0 + 184, v6, v12, 0LL))
  {
    int v13 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 312) + 88LL))( *(void *)(v0 + 320),  *(void *)(v0 + 304));
    if (v13 == enum case for StreamBookmarkStoreError.emptyBookmarkName(_:))
    {
      swift_errorRelease(v1);
      uint64_t v8 = swift_errorRelease(*v10);
      char v9 = 6;
      goto LABEL_22;
    }

    if (v13 == enum case for StreamBookmarkStoreError.bookmarkArchive(_:))
    {
      swift_errorRelease(v1);
      uint64_t v8 = swift_errorRelease(*v10);
      char v9 = 7;
      goto LABEL_22;
    }

    if (v13 == enum case for StreamBookmarkStoreError.bookmarkUnarchive(_:))
    {
      swift_errorRelease(v1);
      uint64_t v8 = swift_errorRelease(*v10);
      char v9 = 8;
      goto LABEL_22;
    }

    (*(void (**)(void, void))(*(void *)(v0 + 312) + 8LL))(*(void *)(v0 + 320), *(void *)(v0 + 304));
  }

  swift_errorRelease(*v10);
  *(void *)(v0 + 160) = v1;
  uint64_t v14 = swift_errorRetain(v1);
  if (swift_dynamicCast(v14, v0 + 160, v6, &type metadata for SiriCoreMetricsError, 0LL))
  {
    swift_errorRelease(v1);
    uint64_t v8 = swift_errorRelease(*(void *)(v0 + 160));
    char v9 = 5;
  }

  else
  {
    uint64_t v15 = *(void *)(v0 + 296);
    uint64_t v16 = *(void *)(v0 + 280);
    swift_errorRelease(*(void *)(v0 + 160));
    *(void *)(v0 + 168) = v1;
    swift_errorRetain(v1);
    if (swift_dynamicCast(v15, v0 + 168, v6, v16, 0LL))
    {
      uint64_t v18 = *(void *)(v0 + 288);
      uint64_t v17 = *(void *)(v0 + 296);
      uint64_t v19 = *(void *)(v0 + 280);
      swift_errorRelease(v1);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      uint64_t v8 = swift_errorRelease(*(void *)(v0 + 168));
      char v9 = 2;
    }

    else
    {
      uint64_t v20 = *(void *)(v0 + 272);
      uint64_t v21 = *(void *)(v0 + 256);
      swift_errorRelease(*(void *)(v0 + 168));
      *(void *)(v0 + 176) = v1;
      swift_errorRetain(v1);
      if (swift_dynamicCast(v20, v0 + 176, v6, v21, 0LL))
      {
        uint64_t v23 = *(void *)(v0 + 264);
        uint64_t v22 = *(void *)(v0 + 272);
        uint64_t v24 = *(void *)(v0 + 256);
        swift_errorRelease(v1);
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
        uint64_t v8 = swift_errorRelease(*(void *)(v0 + 176));
        char v9 = 0;
      }

      else
      {
        swift_errorRelease(*(void *)(v0 + 176));
        uint64_t v8 = swift_errorRelease(v1);
        char v9 = 1;
      }
    }
  }

LABEL_22:
  uint64_t v25 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = *(void *)(v0 + 408);
    char v66 = v9;
    uint64_t v28 = *(void *)(v0 + 392);
    uint64_t v29 = *(void *)(v0 + 368);
    uint64_t v30 = *(void *)(v0 + 376);
    uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    v69[0] = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    swift_beginAccess(v27, v0 + 96, 0LL, 0LL);
    id v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
    uint64_t v3 = v0 + 120;
    v33(v28, v27, v29);
    uint64_t v34 = v28;
    char v9 = v66;
    uint64_t v35 = String.init<A>(describing:)(v34, v29);
    unint64_t v37 = v36;
    *(void *)(v0 + 200) = sub_1000063D8(v35, v36, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease(v37);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Lighthouse runtime process result: %s", v31, 0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  int v38 = *(_DWORD *)(v0 + 512);
  uint64_t v39 = *(void *)(v0 + 408);
  uint64_t v41 = *(void *)(v0 + 376);
  uint64_t v40 = *(void *)(v0 + 384);
  uint64_t v42 = *(void *)(v0 + 368);
  swift_beginAccess(v39, v3, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v40, v39, v42);
  int v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 88))(v40, v42);
  if (v43 == v38)
  {
    uint64_t v44 = *(void **)(v0 + 384);
    (*(void (**)(void *, void))(*(void *)(v0 + 376) + 96LL))(v44, *(void *)(v0 + 368));
    swift_errorRelease(*v44);
  }

  else if (v43 != enum case for LighthouseRuntimeProcessorResult.success(_:) {
         && v43 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
  }
         && v43 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 376) + 8LL))(*(void *)(v0 + 384), *(void *)(v0 + 368));
  }

  uint64_t v45 = *(void *)(v0 + 464);
  uint64_t v47 = *(void *)(v0 + 424);
  uint64_t v46 = *(void *)(v0 + 432);
  uint64_t v49 = *(void *)(v0 + 408);
  uint64_t v48 = *(void *)(v0 + 416);
  uint64_t v50 = *(void *)(v0 + 368);
  uint64_t v51 = *(void *)(v0 + 376);
  v69[3] = (uint64_t)&type metadata for SiriCoreMetricsWorkerError;
  v69[4] = sub_100006394();
  LOBYTE(v69[0]) = v9;
  id v52 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v68 = MLHostResult.init(error:policy:)(v69, 1LL);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
  sub_100006A18(v45, &qword_10000C050);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v49, v50);
  uint64_t v53 = *(void *)(v0 + 456);
  uint64_t v55 = *(void *)(v0 + 432);
  uint64_t v54 = *(void *)(v0 + 440);
  uint64_t v57 = *(void *)(v0 + 400);
  uint64_t v56 = *(void *)(v0 + 408);
  uint64_t v59 = *(void *)(v0 + 384);
  uint64_t v58 = *(void *)(v0 + 392);
  uint64_t v60 = *(void *)(v0 + 352);
  uint64_t v61 = *(void *)(v0 + 360);
  uint64_t v63 = *(void *)(v0 + 344);
  uint64_t v64 = *(void *)(v0 + 320);
  uint64_t v65 = *(void *)(v0 + 296);
  uint64_t v67 = *(void *)(v0 + 272);
  swift_task_dealloc(*(void *)(v0 + 464));
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v61);
  swift_task_dealloc(v60);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v67);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v68);
}

unint64_t sub_100005C48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000623C(&qword_10000C0A8);
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
    sub_100006B18(v7, (uint64_t)&v16, &qword_10000C0B0);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100006AB4(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100006B5C(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_100005D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to MLHostExtension.shouldRun(context:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100006F74;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100005DE4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc(dword_10000C034);
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100005E44;
  return sub_100004290(a1, v5, v4);
}

uint64_t sub_100005E44(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100005E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100005F30;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100005F30()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005F78(uint64_t a1)
{
  unint64_t v2 = sub_1000061F8();
  return MLHostExtension.configuration.getter(a1, v2);
}

void sub_100005FB0(void *a1@<X8>)
{
  *a1 = 0xD000000000000015LL;
  a1[1] = 0x80000001000073A0LL;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006028()
{
  unint64_t result = qword_10000C008[0];
  if (!qword_10000C008[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100007418, &type metadata for SiriCoreMetricsWorker);
    atomic_store(result, qword_10000C008);
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for SiriCoreMetricsWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SiriCoreMetricsWorker(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for SiriCoreMetricsWorker(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for SiriCoreMetricsWorker(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SiriCoreMetricsWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsWorker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsWorker(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsWorker()
{
  return &type metadata for SiriCoreMetricsWorker;
}

uint64_t sub_1000061B4(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_1000061F8();
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

unint64_t sub_1000061F8()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000073D8, &type metadata for SiriCoreMetricsWorker);
    atomic_store(result, &qword_10000C028);
  }

  return result;
}

uint64_t sub_10000623C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000627C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006294(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000062D8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = sub_100006294(&qword_10000C050);
    sub_100006354(a2, a3);
    uint64_t result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100006354(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for LighthouseRuntimeParams(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100006394()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000755C, &type metadata for SiriCoreMetricsWorkerError);
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }

  return result;
}

uint64_t sub_1000063D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000064A8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006A74((uint64_t)v12, *a3);
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
      sub_100006A74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006A54(v12);
  return v7;
}

uint64_t sub_1000064A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100006660(a5, a6);
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

uint64_t sub_100006660(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000066F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000068CC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000068CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000066F4(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100006868(v4, 0LL);
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

void *sub_100006868(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_10000623C(&qword_10000C0A0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000068CC(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000623C(&qword_10000C0A0);
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

uint64_t sub_100006A18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000623C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100006A54(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006A74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006AB4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100006B6C(a1, a2, v5);
}

uint64_t sub_100006B18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000623C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006B5C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100006B6C(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t *sub_100006C4C(uint64_t a1, uint64_t *a2)
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

_BYTE *initializeBufferWithCopyOfBuffer for SiriCoreMetricsWorkerError(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsWorkerError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsWorkerError( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006D78 + 4 * byte_1000073B9[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_100006DAC + 4 * byte_1000073B4[v4]))();
}

uint64_t sub_100006DAC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006DB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006DBCLL);
  }
  return result;
}

uint64_t sub_100006DC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006DD0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 8;
  return result;
}

uint64_t sub_100006DD4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006DDC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006DE8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006DF4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsWorkerError()
{
  return &type metadata for SiriCoreMetricsWorkerError;
}

unint64_t sub_100006E10()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007534, &type metadata for SiriCoreMetricsWorkerError);
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }

  return result;
}

unint64_t sub_100006E58()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000747C, &type metadata for SiriCoreMetricsWorkerError);
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }

  return result;
}

unint64_t sub_100006EA0()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000074BC, &type metadata for SiriCoreMetricsWorkerError);
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }

  return result;
}

unint64_t sub_100006EE8()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }

  return result;
}

unint64_t sub_100006F2C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000084C8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9) {
    return 9LL;
  }
  else {
    return v3;
  }
}
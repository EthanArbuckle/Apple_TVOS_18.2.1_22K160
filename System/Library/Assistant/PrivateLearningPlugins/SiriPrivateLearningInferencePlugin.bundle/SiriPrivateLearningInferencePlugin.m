void sub_48E8()
{
  uint64_t v0;
  Swift::String v1;
  void *object;
  Swift::String v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  v5 = 91LL;
  v6 = 0xE100000000000000LL;
  v4 = type metadata accessor for SiriPrivateLearningInferencePlugin(0LL);
  v0 = sub_4CC0(&qword_38E20);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_38B88 = v5;
  unk_38B90 = v6;
}

uint64_t sub_496C()
{
  uint64_t v0 = sub_28928();
  uint64_t v1 = swift_allocObject( v0,  ((*(unsigned int *)(v0 + 48) + 7LL) & 0x1FFFFFFF8LL) + 16,  *(unsigned __int16 *)(v0 + 52) | 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EA90;
  *(void *)(v1 + 32) = type metadata accessor for ContactsInferenceDomain();
  uint64_t result = type metadata accessor for MediaInferenceDomain();
  *(void *)(v1 + 40) = result;
  qword_38BA0 = v1;
  return result;
}

uint64_t SiriPrivateLearningInferencePlugin.__allocating_init()()
{
  uint64_t v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  SiriPrivateLearningInferencePlugin.init()();
  return v1;
}

uint64_t SiriPrivateLearningInferencePlugin.init()()
{
  uint64_t v1 = v0;
  type metadata accessor for PLLoggingReader(0LL);
  uint64_t v2 = ((uint64_t (*)(void))static PLLoggingReader.shared.getter)();
  PLLoggingReader.asyncSignalReader.getter(&v42);
  swift_release(v2);
  v3 = sub_4CA8(&v42, (_OWORD *)(v1 + 136));
  uint64_t v4 = static PLLoggingReader.shared.getter(v3);
  PLLoggingReader.interactionReader.getter(&v42);
  swift_release(v4);
  uint64_t v5 = sub_7D6C(&v42, v1 + 184);
  uint64_t v6 = static PLLoggingReader.shared.getter(v5);
  PLLoggingReader.biomeReader.getter(&v42);
  swift_release(v6);
  uint64_t v7 = sub_7D6C(&v42, v1 + 224);
  uint64_t v8 = static Config.groundTruthDBLocation.getter(v7);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for InferredGroundTruthStoreCoreData(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = InferredGroundTruthStoreCoreData.init(_:)(v8, v10);
  if (v12)
  {
    *((void *)&v43 + 1) = v11;
    v44 = &protocol witness table for InferredGroundTruthStoreCoreData;
    *(void *)&__int128 v42 = v12;
  }

  else
  {
    v44 = 0LL;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
  }

  uint64_t v13 = sub_4D00((uint64_t)&v42, v1 + 16, &qword_38C88);
  uint64_t v14 = static Config.PICSDBLocation.getter(v13);
  uint64_t v16 = v15;
  uint64_t v17 = type metadata accessor for PICSStoreCoreDataWithMigrations(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = PICSStoreCoreDataWithMigrations.init(_:)(v14, v16);
  if (v18)
  {
    *((void *)&v43 + 1) = v17;
    v44 = &protocol witness table for PICSStoreCoreData;
    *(void *)&__int128 v42 = v18;
  }

  else
  {
    v44 = 0LL;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
  }

  uint64_t v19 = sub_4D00((uint64_t)&v42, v1 + 56, &qword_38C90);
  uint64_t v20 = static Config.PIMSDBLocation.getter(v19);
  uint64_t v22 = v21;
  uint64_t v23 = type metadata accessor for PIMSStoreCoreDataWithMigrations(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  uint64_t v24 = PIMSStoreCoreDataWithMigrations.init(_:)(v20, v22);
  if (v24)
  {
    *((void *)&v43 + 1) = v23;
    v44 = &protocol witness table for PIMSStoreCoreData;
    *(void *)&__int128 v42 = v24;
  }

  else
  {
    v44 = 0LL;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
  }

  sub_4D00((uint64_t)&v42, v1 + 96, &qword_38C98);
  uint64_t v25 = type metadata accessor for FlatFileStreamBookmarkStore(0LL);
  uint64_t v30 = static FlatFileStreamBookmarkStore.shared.getter(v25, v26, v27, v28, v29);
  *(void *)(v1 + 288) = v25;
  *(void *)(v1 + 296) = &protocol witness table for FlatFileStreamBookmarkStore;
  *(void *)(v1 + 264) = v30;
  uint64_t v31 = type metadata accessor for InferenceFeatures.InferenceFeatureManager(0LL);
  uint64_t v32 = swift_allocObject(v31, *(unsigned int *)(v31 + 48), *(unsigned __int16 *)(v31 + 52));
  uint64_t v37 = InferenceFeatures.InferenceFeatureManager.init()(v32, v33, v34, v35, v36);
  *(void *)(v1 + 368) = v31;
  *(void *)(v1 + 376) = &protocol witness table for FeatureManager;
  *(void *)(v1 + 344) = v37;
  makePLUSEventLogTarget()(&v42);
  sub_7D6C(&v42, v1 + 304);
  uint64_t v38 = v1
      + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel;
  uint64_t v39 = enum case for UFLCoreAnalyticsLogLevel.release(_:);
  uint64_t v40 = type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104LL))(v38, v39, v40);
  return v1;
}

_OWORD *sub_4CA8(__int128 *a1, _OWORD *a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_4CC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_4D00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4CC0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t SiriPrivateLearningInferencePlugin.run(context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_4CC0(&qword_38CA8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v12, 1LL, 1LL, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (v14 + 40) & ~v14;
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v17 = (char *)swift_allocObject(&unk_35530, v16 + 16, v14 | 7);
  *((void *)v17 + 2) = 0LL;
  *((void *)v17 + 3) = 0LL;
  *((void *)v17 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v17[v15], v10, v7);
  uint64_t v18 = &v17[v16];
  *(void *)uint64_t v18 = a2;
  *((void *)v18 + 1) = a3;
  swift_retain(v3);
  swift_retain(a3);
  uint64_t v19 = sub_5240((uint64_t)v12, (uint64_t)&unk_38CB8, (uint64_t)v17);
  return swift_release(v19);
}

uint64_t sub_4EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = a6;
  v7[3] = a7;
  uint64_t v9 = type metadata accessor for PrivateLearningPluginError(0LL);
  v7[4] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v7[5] = v10;
  v7[6] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for PrivateLearningPluginResult(0LL);
  v7[7] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v7[8] = v12;
  v7[9] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_4CC0(&qword_38E08);
  v7[10] = v13;
  unint64_t v14 = (*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v7[11] = swift_task_alloc(v14);
  uint64_t v15 = swift_task_alloc(v14);
  v7[12] = v15;
  unint64_t v16 = (void *)swift_task_alloc(dword_38CFC);
  v7[13] = v16;
  *unint64_t v16 = v7;
  v16[1] = sub_4FA0;
  return sub_538C(v15, a5);
}

uint64_t sub_4FA0()
{
  return swift_task_switch(sub_4FF4, 0LL, 0LL);
}

uint64_t sub_4FF4()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 80);
  sub_8418(*(void *)(v0 + 96), v1, &qword_38E08);
  if (swift_getEnumCaseMultiPayload(v1, v2) == 1)
  {
    uint64_t v4 = (void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 64);
    uint64_t v5 = *(void *)(v0 + 72);
    uint64_t v8 = v0 + 40;
    uint64_t v7 = *(void *)(v0 + 40);
    uint64_t v10 = (void *)(v0 + 32);
    uint64_t v9 = *(void *)(v0 + 32);
    uint64_t v18 = *(void (**)(uint64_t))(v0 + 16);
    uint64_t v19 = *(void *)(v0 + 56);
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v3, *(void *)(v0 + 88), v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v3, v9);
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))( v5,  enum case for PrivateLearningPluginResult.failure(_:),  v19);
    v18(v5);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v19);
  }

  else
  {
    uint64_t v4 = (void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v8 = v0 + 64;
    uint64_t v10 = (void *)(v0 + 56);
    uint64_t v12 = *(void (**)(uint64_t))(v0 + 16);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 64) + 104LL))( v11,  enum case for PrivateLearningPluginResult.success(_:),  *(void *)(v0 + 56));
    v12(v11);
  }

  uint64_t v13 = *(void *)(v0 + 88);
  uint64_t v14 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 72);
  uint64_t v16 = *(void *)(v0 + 48);
  (*(void (**)(void, void))(*(void *)v8 + 8LL))(*v4, *v10);
  sub_845C(v14, &qword_38E08);
  swift_task_dealloc(v14);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_5184(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PrivateLearningPluginRunContext(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc(dword_38CB4);
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_8558;
  return sub_4EB0(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_5240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_845C(a1, &qword_38CA8);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_35580, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_38E48, v16);
}

uint64_t sub_538C(uint64_t a1, uint64_t a2)
{
  v3[95] = v2;
  v3[94] = a2;
  v3[93] = a1;
  uint64_t v4 = type metadata accessor for OSSignpostError(0LL);
  v3[96] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[97] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[98] = swift_task_alloc(v6);
  v3[99] = swift_task_alloc(v6);
  v3[100] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  v3[101] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[102] = v8;
  v3[103] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  v3[104] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[105] = v10;
  v3[106] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  v3[107] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[108] = v12;
  v3[109] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSSignpostID(0LL);
  v3[110] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v3[111] = v14;
  unint64_t v15 = (*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[112] = swift_task_alloc(v15);
  v3[113] = swift_task_alloc(v15);
  v3[114] = swift_task_alloc(v15);
  v3[115] = swift_task_alloc(v15);
  return swift_task_switch(sub_54D8, 0LL, 0LL);
}

uint64_t sub_54D8()
{
  if (qword_38C20 != -1) {
    swift_once(&qword_38C20, sub_EA84);
  }
  uint64_t v1 = *(void *)(v0 + 920);
  uint64_t v2 = *(void *)(v0 + 888);
  uint64_t v3 = *(void *)(v0 + 880);
  uint64_t v4 = *(void *)(v0 + 848);
  uint64_t v5 = *(void *)(v0 + 840);
  uint64_t v6 = *(void *)(v0 + 832);
  uint64_t v7 = *(void *)(v0 + 752);
  uint64_t v8 = type metadata accessor for OSSignposter(0LL);
  uint64_t v9 = sub_7D04(v8, (uint64_t)qword_3A6C8);
  *(void *)(v0 + 928) = v9;
  uint64_t v10 = OSSignposter.logHandle.getter(v9);
  OSSignpostID.init(log:)(v10);
  *(void *)(v0 + 936) = sub_E638("runInferencePlugin", 18LL, 2, v1);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 944) = v11;
  uint64_t v12 = v11(v1, v3);
  UUID.init()(v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6);
  if (v13 == enum case for PrivateLearningPluginRunContext.eventBased(_:))
  {
    uint64_t v14 = *(void *)(v0 + 848);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 840) + 96LL))(v14, *(void *)(v0 + 832));
    uint64_t v15 = type metadata accessor for PrivateLearningPluginRunScenario(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8LL))(v14, v15);
    uint64_t v16 = 2LL;
  }

  else if (v13 == enum case for PrivateLearningPluginRunContext.maintenance(_:))
  {
    uint64_t v16 = 1LL;
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 840) + 8LL))(*(void *)(v0 + 848), *(void *)(v0 + 832));
    uint64_t v16 = 0LL;
  }

  uint64_t v17 = (__int128 *)(v0 + 104);
  if (qword_38BA8 != -1) {
    swift_once(&qword_38BA8, sub_7028);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_7D04(v18, (uint64_t)qword_38BB0);
  *(void *)(v0 + 952) = v19;
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v20, v21))
  {
    unsigned int v123 = v16;
    uint64_t v22 = swift_slowAlloc(22LL, -1LL);
    uint64_t v23 = swift_slowAlloc(64LL, -1LL);
    v127[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    if (qword_38B80 != -1) {
      swift_once(&qword_38B80, sub_48E8);
    }
    uint64_t v24 = qword_38B88;
    unint64_t v25 = unk_38B90;
    swift_bridgeObjectRetain(unk_38B90);
    *(void *)(v0 + 728) = sub_28A50(v24, v25, v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 728, v0 + 736, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v16 = v123;
    uint64_t v26 = PLUSSchemaPLUSInferencePluginTriggerReason.description.getter(v123);
    unint64_t v28 = v27;
    *(void *)(v0 + 736) = sub_28A50(v26, v27, v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 736, v0 + 744, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v28);
    _os_log_impl(&dword_0, v20, v21, "%s SiriPrivateLearningInference trigger reason: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    uint64_t v17 = (__int128 *)(v0 + 104);
  }

  else
  {
  }

  uint64_t v29 = *(void *)(v0 + 872);
  uint64_t v30 = *(void *)(v0 + 760);
  sub_8120(v30 + 304, v0 + 264);
  uint64_t v31 = type metadata accessor for PLUSOfflineLogHelpers(0LL);
  swift_allocObject(v31, *(unsigned int *)(v31 + 48), *(unsigned __int16 *)(v31 + 52));
  *(void *)(v0 + 960) = PLUSOfflineLogHelpers.init(logTarget:)(v0 + 264);
  dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginStarted(triggerReason:plusId:)(v16, v29);
  sub_8418(v30 + 16, (uint64_t)v17, &qword_38C88);
  if (!*(void *)(v0 + 128))
  {
    sub_845C((uint64_t)v17, &qword_38C88);
    unint64_t v43 = sub_7D1C();
    uint64_t v44 = swift_allocError(&type metadata for InferencePluginError, v43, 0LL, 0LL);
    *(void *)uint64_t v45 = 2LL;
    *(_BYTE *)(v45 + 8) = 0;
    swift_willThrow(v44);
    goto LABEL_25;
  }

  uint64_t v32 = *(void *)(v0 + 760);
  sub_7D6C(v17, v0 + 64);
  sub_8418(v32 + 56, v0 + 464, &qword_38C90);
  if (!*(void *)(v0 + 488))
  {
    sub_845C(v0 + 464, &qword_38C90);
    unint64_t v46 = sub_7D1C();
    uint64_t v44 = swift_allocError(&type metadata for InferencePluginError, v46, 0LL, 0LL);
    *(void *)uint64_t v47 = 4LL;
    *(_BYTE *)(v47 + 8) = 0;
    swift_willThrow(v44);
LABEL_24:
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 64));
LABEL_25:
    uint64_t v50 = v0 + 664;
    uint64_t v51 = v0 + 720;
    swift_errorRetain(v44);
    uint64_t v52 = swift_errorRetain(v44);
    v53 = (os_log_s *)Logger.logObject.getter(v52);
    os_log_type_t v54 = static os_log_type_t.error.getter();
    uint64_t v125 = v0 + 696;
    if (os_log_type_enabled(v53, v54))
    {
      v121 = (uint64_t *)(v0 + 712);
      uint64_t v55 = swift_slowAlloc(22LL, -1LL);
      uint64_t v122 = swift_slowAlloc(64LL, -1LL);
      v127[0] = v122;
      *(_DWORD *)uint64_t v55 = 136315394;
      if (qword_38B80 != -1) {
        swift_once(&qword_38B80, sub_48E8);
      }
      uint64_t v57 = qword_38B88;
      unint64_t v56 = unk_38B90;
      swift_bridgeObjectRetain(unk_38B90);
      *(void *)(v0 + 688) = sub_28A50(v57, v56, v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 688, v125, v55 + 4, v55 + 12);
      swift_bridgeObjectRelease(v56);
      *(_WORD *)(v55 + 12) = 2080;
      *(void *)(v0 + 680) = v44;
      swift_errorRetain(v44);
      uint64_t v58 = sub_4CC0(&qword_38E00);
      uint64_t v59 = String.init<A>(describing:)(v0 + 680, v58);
      unint64_t v61 = v60;
      uint64_t *v121 = sub_28A50(v59, v60, v127);
      uint64_t v51 = v0 + 720;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v121, v0 + 720, v55 + 14, v55 + 22);
      swift_bridgeObjectRelease(v61);
      swift_errorRelease(v44);
      swift_errorRelease(v44);
      _os_log_impl( &dword_0,  v53,  v54,  "%s Failed to run SiriPrivateLearningInference plugin, error=%s",  (uint8_t *)v55,  0x16u);
      swift_arrayDestroy(v122, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v122, -1LL, -1LL);
      swift_slowDealloc(v55, -1LL, -1LL);

      uint64_t v50 = v0 + 664;
    }

    else
    {
      swift_errorRelease(v44);
      swift_errorRelease(v44);
    }

    *(void *)(v0 + 720) = v44;
    swift_errorRetain(v44);
    uint64_t v62 = sub_4CC0(&qword_38E00);
    int v63 = swift_dynamicCast(v50, v51, v62, &type metadata for InferencePluginError, 0LL);
    uint64_t v64 = *(void *)(v0 + 960);
    if (v63)
    {
      uint64_t v65 = *(void *)(v0 + 664);
      int v66 = *(char *)(v0 + 672);
      unsigned __int8 v67 = v66 & 0x7F;
      if (v66 >= 0) {
        unsigned __int8 v67 = *(void *)(v0 + 664);
      }
      dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginFailed(failureReason:plusId:)( v67,  *(void *)(v0 + 872));
      if (v66 < 0)
      {
        swift_errorRetain(v65);
        uint64_t v69 = v65;
      }

      else
      {
        unint64_t v68 = sub_7D1C();
        uint64_t v69 = swift_allocError(&type metadata for InferencePluginError, v68, 0LL, 0LL);
        *(void *)uint64_t v70 = v65;
        *(_BYTE *)(v70 + 8) = v66;
      }

      uint64_t v88 = *(void *)(v0 + 960);
      uint64_t v89 = *(void *)(v0 + 872);
      uint64_t v90 = *(void *)(v0 + 864);
      uint64_t v91 = *(void *)(v0 + 856);
      uint64_t v92 = *(void *)(v0 + 744);
      *(void *)(v0 + 696) = v69;
      uint64_t v93 = String.init<A>(describing:)(v125, v62);
      PrivateLearningPluginError.init(message:)(v93);
      swift_release(v88);
      sub_7D60(v65, v66);
      swift_errorRelease(v44);
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v89, v91);
      uint64_t v94 = sub_4CC0(&qword_38E08);
      swift_storeEnumTagMultiPayload(v92, v94, 1LL);
      uint64_t v95 = swift_errorRelease(*(void *)(v0 + 720));
      v78 = (os_log_s *)OSSignposter.logHandle.getter(v95);
      uint64_t v96 = OSSignpostIntervalState.signpostID.getter();
      os_signpost_type_t v80 = static os_signpost_type_t.end.getter(v96);
      if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
      {
        uint64_t v97 = *(void *)(v0 + 936);
        uint64_t v98 = *(void *)(v0 + 792);
        uint64_t v99 = *(void *)(v0 + 776);
        uint64_t v100 = *(void *)(v0 + 768);
        uint64_t v101 = swift_retain(v97);
        checkForErrorAndConsumeState(state:)(v101);
        swift_release(v97);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v99 + 88))(v98, v100) == enum case for OSSignpostError.doubleEnd(_:))
        {
          v86 = "[Error] Interval already ended";
        }

        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 776) + 8LL))( *(void *)(v0 + 792),  *(void *)(v0 + 768));
          v86 = "";
        }

        v102 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
        uint64_t v103 = *(void *)(v0 + 920);
        uint64_t v104 = *(void *)(v0 + 904);
LABEL_49:
        uint64_t v105 = *(void *)(v0 + 880);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 888) + 16LL))(v103, v104, v105);
        v106 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v106 = 0;
        os_signpost_id_t v107 = OSSignpostID.rawValue.getter();
        _os_signpost_emit_with_name_impl(&dword_0, v78, v80, v107, "runInferencePlugin", v86, v106, 2u);
        swift_slowDealloc(v106, -1LL, -1LL);

        v102(v104, v105);
        v87 = (uint64_t *)(v0 + 920);
        goto LABEL_50;
      }

      v87 = (uint64_t *)(v0 + 904);
    }

    else
    {
      uint64_t v71 = *(void *)(v0 + 872);
      uint64_t v72 = *(void *)(v0 + 864);
      uint64_t v73 = *(void *)(v0 + 856);
      uint64_t v74 = *(void *)(v0 + 744);
      swift_errorRelease(*(void *)(v0 + 720));
      dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginFailed(failureReason:plusId:)(6LL, v71);
      *(void *)(v0 + 704) = v44;
      swift_errorRetain(v44);
      uint64_t v75 = String.init<A>(describing:)(v0 + 704, v62);
      PrivateLearningPluginError.init(message:)(v75);
      swift_release(v64);
      swift_errorRelease(v44);
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
      uint64_t v76 = sub_4CC0(&qword_38E08);
      uint64_t v77 = swift_storeEnumTagMultiPayload(v74, v76, 1LL);
      v78 = (os_log_s *)OSSignposter.logHandle.getter(v77);
      uint64_t v79 = OSSignpostIntervalState.signpostID.getter();
      os_signpost_type_t v80 = static os_signpost_type_t.end.getter(v79);
      if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
      {
        uint64_t v81 = *(void *)(v0 + 936);
        uint64_t v82 = *(void *)(v0 + 784);
        uint64_t v83 = *(void *)(v0 + 776);
        uint64_t v84 = *(void *)(v0 + 768);
        uint64_t v85 = swift_retain(v81);
        checkForErrorAndConsumeState(state:)(v85);
        swift_release(v81);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v83 + 88))(v82, v84) == enum case for OSSignpostError.doubleEnd(_:))
        {
          v86 = "[Error] Interval already ended";
        }

        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 776) + 8LL))( *(void *)(v0 + 784),  *(void *)(v0 + 768));
          v86 = "";
        }

        v102 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
        uint64_t v103 = *(void *)(v0 + 920);
        uint64_t v104 = *(void *)(v0 + 896);
        goto LABEL_49;
      }

      v87 = (uint64_t *)(v0 + 896);
    }

LABEL_50:
    uint64_t v108 = *v87;
    uint64_t v109 = *(void *)(v0 + 936);
    uint64_t v110 = *(void *)(v0 + 920);
    uint64_t v111 = *(void *)(v0 + 912);
    uint64_t v112 = *(void *)(v0 + 904);
    uint64_t v113 = *(void *)(v0 + 896);
    uint64_t v114 = *(void *)(v0 + 872);
    uint64_t v115 = *(void *)(v0 + 848);
    uint64_t v116 = *(void *)(v0 + 824);
    uint64_t v117 = *(void *)(v0 + 800);
    uint64_t v124 = *(void *)(v0 + 792);
    uint64_t v126 = *(void *)(v0 + 784);
    (*(void (**)(uint64_t, void))(v0 + 944))(v108, *(void *)(v0 + 880));
    swift_release(v109);
    swift_task_dealloc(v110);
    swift_task_dealloc(v111);
    swift_task_dealloc(v112);
    swift_task_dealloc(v113);
    swift_task_dealloc(v114);
    swift_task_dealloc(v115);
    swift_task_dealloc(v116);
    swift_task_dealloc(v117);
    swift_task_dealloc(v124);
    swift_task_dealloc(v126);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v33 = *(void *)(v0 + 760);
  sub_7D6C((__int128 *)(v0 + 464), v0 + 424);
  sub_8418(v33 + 96, v0 + 544, &qword_38C98);
  if (!*(void *)(v0 + 568))
  {
    sub_845C(v0 + 544, &qword_38C98);
    unint64_t v48 = sub_7D1C();
    uint64_t v44 = swift_allocError(&type metadata for InferencePluginError, v48, 0LL, 0LL);
    *(void *)uint64_t v49 = 4LL;
    *(_BYTE *)(v49 + 8) = 0;
    swift_willThrow(v44);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 424));
    goto LABEL_24;
  }

  uint64_t v120 = *(void *)(v0 + 824);
  uint64_t v118 = *(void *)(v0 + 816);
  uint64_t v119 = *(void *)(v0 + 808);
  uint64_t v34 = *(void *)(v0 + 760);
  sub_7D6C((__int128 *)(v0 + 544), v0 + 504);
  sub_8120(v0 + 64, v0 + 584);
  sub_8120(v0 + 424, v0 + 624);
  sub_8120(v34 + 344, v0 + 384);
  sub_8120(v30 + 304, v0 + 344);
  sub_8120(v0 + 504, v0 + 304);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v118 + 16))( v120,  v34 + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel,  v119);
  uint64_t v35 = type metadata accessor for SiriPrivateLearningInferencePluginContext(0LL);
  uint64_t v36 = swift_allocObject(v35, *(unsigned int *)(v35 + 48), *(unsigned __int16 *)(v35 + 52));
  *(void *)(v0 + 968) = v36;
  sub_7D6C((__int128 *)(v0 + 584), v36 + 16);
  sub_7D6C((__int128 *)(v0 + 624), v36 + 56);
  sub_7D6C((__int128 *)(v0 + 344), v36 + 96);
  sub_7D6C((__int128 *)(v0 + 384), v36 + 136);
  sub_7D6C((__int128 *)(v0 + 304), v36 + 176);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v118 + 32))( v36 + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin41SiriPrivateLearningInferencePluginContext_uflCoreAnalyticsLogLevel,  v120,  v119);
  sub_7D84(v34 + 136, v0 + 16);
  sub_8120(v34 + 184, v0 + 224);
  sub_8120(v34 + 224, v0 + 184);
  sub_8120(v34 + 264, v0 + 144);
  uint64_t v37 = qword_38B98;
  swift_retain(v36);
  if (v37 != -1) {
    swift_once(&qword_38B98, sub_496C);
  }
  uint64_t v38 = (char *)qword_38BA0;
  uint64_t v39 = type metadata accessor for SiriPrivateLearningInferenceEngine();
  uint64_t v40 = (void *)swift_allocObject(v39, 248LL, 7LL);
  swift_bridgeObjectRetain(v38);
  *(void *)(v0 + 976) = sub_781C( v36,  (void *)(v0 + 16),  (void *)(v0 + 224),  (void *)(v0 + 184),  (void *)(v0 + 144),  v38,  v40);
  v41 = (void *)swift_task_alloc(dword_394F4);
  *(void *)(v0 + 984) = v41;
  void *v41 = v0;
  v41[1] = sub_6274;
  return sub_11B98();
}

uint64_t sub_6274(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(*(void *)v3 + 984LL);
  uint64_t v7 = *(void **)v3;
  v7[124] = v2;
  swift_task_dealloc(v6);
  if (v2) {
    return swift_task_switch(sub_6654, 0LL, 0LL);
  }
  v7[125] = a2;
  v7[126] = a1;
  uint64_t v9 = (void *)swift_task_alloc(dword_394FC);
  v7[127] = v9;
  *uint64_t v9 = v7;
  v9[1] = sub_631C;
  return sub_137E8();
}

uint64_t sub_631C()
{
  return swift_task_switch(sub_6370, 0LL, 0LL);
}

uint64_t sub_6370()
{
  unint64_t v1 = *(void *)(v0 + 1008);
  unint64_t v2 = *(void *)(v0 + 1000);
  uint64_t v3 = *(void *)(v0 + 976);
  uint64_t v4 = *(void *)(v0 + 968);
  uint64_t v5 = *(void *)(v0 + 960);
  uint64_t v6 = *(void *)(v0 + 872);
  uint64_t v7 = *(void *)(v0 + 864);
  uint64_t v37 = *(void *)(v0 + 856);
  uint64_t v8 = *(void *)(v0 + 744);
  dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginCompleted(conversationsReviewed:groundTruthsGenerated:contactSuggestionsGenerated:contactSuggestionsUpdated:plusId:)( v1,  HIDWORD(v1),  v2,  HIDWORD(v2),  v6);
  swift_release(v3);
  *(void *)uint64_t v8 = v1;
  *(void *)(v8 + 8) = v2;
  *(_BYTE *)(v8 + 16) = 0;
  uint64_t v9 = sub_4CC0(&qword_38E08);
  swift_storeEnumTagMultiPayload(v8, v9, 0LL);
  sub_7DC8(v4);
  swift_release(v5);
  swift_release(v4);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 504));
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 424));
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 64));
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v37);
  uint64_t v11 = (os_log_s *)OSSignposter.logHandle.getter(v10);
  uint64_t v12 = OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v13 = static os_signpost_type_t.end.getter(v12);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v14 = *(void *)(v0 + 936);
    uint64_t v15 = *(void *)(v0 + 800);
    uint64_t v16 = *(void *)(v0 + 776);
    uint64_t v17 = *(void *)(v0 + 768);
    uint64_t v18 = swift_retain(v14);
    checkForErrorAndConsumeState(state:)(v18);
    swift_release(v14);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v15, v17) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v19 = "[Error] Interval already ended";
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 776) + 8LL))( *(void *)(v0 + 800),  *(void *)(v0 + 768));
      uint64_t v19 = "";
    }

    os_log_type_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
    uint64_t v20 = (uint64_t *)(v0 + 920);
    uint64_t v22 = *(void *)(v0 + 912);
    uint64_t v23 = *(void *)(v0 + 880);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 888) + 16LL))(*(void *)(v0 + 920), v22, v23);
    uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v24 = 0;
    os_signpost_id_t v25 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl(&dword_0, v11, v13, v25, "runInferencePlugin", v19, v24, 2u);
    swift_slowDealloc(v24, -1LL, -1LL);

    v21(v22, v23);
  }

  else
  {
    uint64_t v20 = (uint64_t *)(v0 + 912);
  }

  uint64_t v26 = *v20;
  uint64_t v27 = *(void *)(v0 + 936);
  uint64_t v28 = *(void *)(v0 + 920);
  uint64_t v29 = *(void *)(v0 + 912);
  uint64_t v30 = *(void *)(v0 + 904);
  uint64_t v31 = *(void *)(v0 + 896);
  uint64_t v32 = *(void *)(v0 + 872);
  uint64_t v33 = *(void *)(v0 + 848);
  uint64_t v34 = *(void *)(v0 + 824);
  uint64_t v35 = *(void *)(v0 + 800);
  uint64_t v38 = *(void *)(v0 + 792);
  uint64_t v39 = *(void *)(v0 + 784);
  (*(void (**)(uint64_t, void))(v0 + 944))(v26, *(void *)(v0 + 880));
  swift_release(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6654()
{
  uint64_t v1 = v0 + 664;
  uint64_t v75 = v0 + 696;
  uint64_t v2 = v0 + 720;
  uint64_t v3 = *(void *)(v0 + 968);
  swift_release(*(void *)(v0 + 976));
  sub_7DC8(v3);
  swift_release(v3);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 504));
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 424));
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 64));
  uint64_t v4 = *(void *)(v0 + 992);
  swift_errorRetain(v4);
  uint64_t v5 = swift_errorRetain(v4);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v72 = (uint64_t *)(v0 + 712);
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    uint64_t v73 = swift_slowAlloc(64LL, -1LL);
    uint64_t v77 = v73;
    *(_DWORD *)uint64_t v8 = 136315394;
    if (qword_38B80 != -1) {
      swift_once(&qword_38B80, sub_48E8);
    }
    uint64_t v10 = qword_38B88;
    unint64_t v9 = unk_38B90;
    swift_bridgeObjectRetain(unk_38B90);
    *(void *)(v0 + 688) = sub_28A50(v10, v9, &v77);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 688, v75, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v9);
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v0 + 680) = v4;
    swift_errorRetain(v4);
    uint64_t v11 = sub_4CC0(&qword_38E00);
    uint64_t v12 = String.init<A>(describing:)(v0 + 680, v11);
    unint64_t v14 = v13;
    *uint64_t v72 = sub_28A50(v12, v13, &v77);
    uint64_t v2 = v0 + 720;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v72, v0 + 720, v8 + 14, v8 + 22);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v4);
    swift_errorRelease(v4);
    _os_log_impl( &dword_0,  v6,  v7,  "%s Failed to run SiriPrivateLearningInference plugin, error=%s",  (uint8_t *)v8,  0x16u);
    swift_arrayDestroy(v73, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v73, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);

    uint64_t v1 = v0 + 664;
  }

  else
  {
    swift_errorRelease(v4);
    swift_errorRelease(v4);
  }

  *(void *)(v0 + 720) = v4;
  swift_errorRetain(v4);
  uint64_t v15 = sub_4CC0(&qword_38E00);
  int v16 = swift_dynamicCast(v1, v2, v15, &type metadata for InferencePluginError, 0LL);
  uint64_t v17 = *(void *)(v0 + 960);
  if (v16)
  {
    uint64_t v18 = *(void *)(v0 + 664);
    int v19 = *(char *)(v0 + 672);
    unsigned __int8 v20 = v19 & 0x7F;
    if (v19 >= 0) {
      unsigned __int8 v20 = *(void *)(v0 + 664);
    }
    dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginFailed(failureReason:plusId:)(v20, *(void *)(v0 + 872));
    if (v19 < 0)
    {
      swift_errorRetain(v18);
      uint64_t v22 = v18;
    }

    else
    {
      unint64_t v21 = sub_7D1C();
      uint64_t v22 = swift_allocError(&type metadata for InferencePluginError, v21, 0LL, 0LL);
      *(void *)uint64_t v23 = v18;
      *(_BYTE *)(v23 + 8) = v19;
    }

    uint64_t v41 = *(void *)(v0 + 960);
    uint64_t v42 = *(void *)(v0 + 872);
    uint64_t v43 = *(void *)(v0 + 864);
    uint64_t v44 = *(void *)(v0 + 856);
    uint64_t v45 = *(void *)(v0 + 744);
    *(void *)(v0 + 696) = v22;
    uint64_t v46 = String.init<A>(describing:)(v75, v15);
    PrivateLearningPluginError.init(message:)(v46);
    swift_release(v41);
    sub_7D60(v18, v19);
    swift_errorRelease(v4);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    uint64_t v47 = sub_4CC0(&qword_38E08);
    swift_storeEnumTagMultiPayload(v45, v47, 1LL);
    uint64_t v48 = swift_errorRelease(*(void *)(v0 + 720));
    uint64_t v31 = (os_log_s *)OSSignposter.logHandle.getter(v48);
    uint64_t v49 = OSSignpostIntervalState.signpostID.getter();
    os_signpost_type_t v33 = static os_signpost_type_t.end.getter(v49);
    if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
    {
      uint64_t v50 = *(void *)(v0 + 936);
      uint64_t v51 = *(void *)(v0 + 792);
      uint64_t v52 = *(void *)(v0 + 776);
      uint64_t v53 = *(void *)(v0 + 768);
      uint64_t v54 = swift_retain(v50);
      checkForErrorAndConsumeState(state:)(v54);
      swift_release(v50);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v52 + 88))(v51, v53) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v39 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 776) + 8LL))( *(void *)(v0 + 792),  *(void *)(v0 + 768));
        uint64_t v39 = "";
      }

      uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
      uint64_t v40 = (uint64_t *)(v0 + 920);
      uint64_t v56 = *(void *)(v0 + 920);
      uint64_t v57 = *(void *)(v0 + 904);
LABEL_25:
      uint64_t v58 = *(void *)(v0 + 880);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 888) + 16LL))(v56, v57, v58);
      uint64_t v59 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v59 = 0;
      os_signpost_id_t v60 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_0, v31, v33, v60, "runInferencePlugin", v39, v59, 2u);
      swift_slowDealloc(v59, -1LL, -1LL);

      v55(v57, v58);
      goto LABEL_26;
    }

    uint64_t v40 = (uint64_t *)(v0 + 904);
  }

  else
  {
    uint64_t v24 = *(void *)(v0 + 872);
    uint64_t v25 = *(void *)(v0 + 864);
    uint64_t v26 = *(void *)(v0 + 856);
    uint64_t v27 = *(void *)(v0 + 744);
    swift_errorRelease(*(void *)(v0 + 720));
    dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginFailed(failureReason:plusId:)(6LL, v24);
    *(void *)(v0 + 704) = v4;
    swift_errorRetain(v4);
    uint64_t v28 = String.init<A>(describing:)(v0 + 704, v15);
    PrivateLearningPluginError.init(message:)(v28);
    swift_release(v17);
    swift_errorRelease(v4);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    uint64_t v29 = sub_4CC0(&qword_38E08);
    uint64_t v30 = swift_storeEnumTagMultiPayload(v27, v29, 1LL);
    uint64_t v31 = (os_log_s *)OSSignposter.logHandle.getter(v30);
    uint64_t v32 = OSSignpostIntervalState.signpostID.getter();
    os_signpost_type_t v33 = static os_signpost_type_t.end.getter(v32);
    if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
    {
      uint64_t v34 = *(void *)(v0 + 936);
      uint64_t v35 = *(void *)(v0 + 784);
      uint64_t v36 = *(void *)(v0 + 776);
      uint64_t v37 = *(void *)(v0 + 768);
      uint64_t v38 = swift_retain(v34);
      checkForErrorAndConsumeState(state:)(v38);
      swift_release(v34);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v36 + 88))(v35, v37) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v39 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 776) + 8LL))( *(void *)(v0 + 784),  *(void *)(v0 + 768));
        uint64_t v39 = "";
      }

      uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
      uint64_t v40 = (uint64_t *)(v0 + 920);
      uint64_t v56 = *(void *)(v0 + 920);
      uint64_t v57 = *(void *)(v0 + 896);
      goto LABEL_25;
    }

    uint64_t v40 = (uint64_t *)(v0 + 896);
  }

LABEL_26:
  uint64_t v61 = *v40;
  uint64_t v62 = *(void *)(v0 + 936);
  uint64_t v63 = *(void *)(v0 + 920);
  uint64_t v64 = *(void *)(v0 + 912);
  uint64_t v65 = *(void *)(v0 + 904);
  uint64_t v66 = *(void *)(v0 + 896);
  uint64_t v67 = *(void *)(v0 + 872);
  uint64_t v68 = *(void *)(v0 + 848);
  uint64_t v69 = *(void *)(v0 + 824);
  uint64_t v70 = *(void *)(v0 + 800);
  uint64_t v74 = *(void *)(v0 + 792);
  uint64_t v76 = *(void *)(v0 + 784);
  (*(void (**)(uint64_t, void))(v0 + 944))(v61, *(void *)(v0 + 880));
  swift_release(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v74);
  swift_task_dealloc(v76);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *SiriPrivateLearningInferencePlugin.deinit()
{
  uint64_t v1 = (char *)v0
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel;
  uint64_t v2 = type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return v0;
}

uint64_t _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t SiriPrivateLearningInferencePlugin.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel;
  uint64_t v2 = type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_6E84()
{
  uint64_t v0 = type metadata accessor for SiriPrivateLearningInferencePlugin(0LL);
  uint64_t v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  SiriPrivateLearningInferencePlugin.init()();
  return v1;
}

uint64_t sub_6EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_4CC0(&qword_38CA8);
  __chkstk_darwin(v11);
  unint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (v15 + 40) & ~v15;
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v18 = (char *)swift_allocObject(&unk_35558, v17 + 16, v15 | 7);
  *((void *)v18 + 2) = 0LL;
  *((void *)v18 + 3) = 0LL;
  *((void *)v18 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v16], v10, v7);
  int v19 = &v18[v17];
  *(void *)int v19 = a2;
  *((void *)v19 + 1) = a3;
  swift_retain(v3);
  swift_retain(a3);
  uint64_t v20 = sub_5240((uint64_t)v13, (uint64_t)&unk_38E28, (uint64_t)v18);
  return swift_release(v20);
}

uint64_t sub_7028()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_38BB0);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_38BB0);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

unint64_t sub_70B8(uint64_t a1)
{
  uint64_t v2 = sub_4CC0(&qword_38E30);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }

  sub_4CC0(&qword_38E38);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v25 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_8418(v13, (uint64_t)v5, &qword_38E30);
    unint64_t result = sub_290F8((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for UUID(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))( v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  v5,  v19);
    *(void *)(v8[7] + 8 * v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = *(void *)&v5[v10];
    uint64_t v20 = v8[2];
    BOOL v21 = __OFADD__(v20, 1LL);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_12;
    }
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v23 = v25;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_724C(uint64_t a1)
{
  uint64_t v2 = sub_4CC0(&qword_38DE8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v27 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v27);
    return (unint64_t)v8;
  }

  sub_4CC0(&qword_38DF0);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = &v5[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v29 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_8418(v13, (uint64_t)v5, &qword_38DE8);
    unint64_t result = sub_290F8((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for UUID(0LL);
    uint64_t v20 = *(void *)(v19 - 8);
    unint64_t v21 = *(void *)(v20 + 72) * v17;
    uint64_t v22 = v18 + v21;
    uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
    v23(v22, v5, v19);
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v8[7] + v21, v10, v19);
    uint64_t v24 = v8[2];
    BOOL v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_12;
    }
    v8[2] = v26;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v27 = v29;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void *sub_73F4(void *(*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  unint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v16 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain(a3);
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      uint64_t v15 = *(void *)(a3 + 8 * i + 32);
      uint64_t v10 = a1(&v14, &v15);
      if (v3)
      {
        swift_bridgeObjectRelease(a3);
        return (void *)swift_bridgeObjectRelease(v16);
      }

      uint64_t v11 = v14;
      if (v14)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v10);
        unint64_t v13 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v12 = *(void *)((char *)&dword_18 + (v16 & 0xFFFFFFFFFFFFFF8LL));
        if (v13 >= v12 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1LL);
        }
        uint64_t v9 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v11);
        specialized Array._endMutation()(v9);
      }
    }

    swift_bridgeObjectRelease(a3);
    return (void *)v16;
  }

  return result;
}

unint64_t variable initialization expression of MessagesContactGroundTruthGenerator.generatedGroundTruth()
{
  return sub_70B8((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_7524()
{
  return type metadata accessor for SiriPrivateLearningInferencePlugin(0LL);
}

uint64_t type metadata accessor for SiriPrivateLearningInferencePlugin(uint64_t a1)
{
  uint64_t result = qword_38CE8;
  if (!qword_38CE8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriPrivateLearningInferencePlugin);
  }
  return result;
}

uint64_t sub_7568(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = "(";
  v4[2] = "(";
  v4[3] = &unk_2EB70;
  v4[4] = &unk_2EB88;
  v4[5] = &unk_2EB88;
  v4[6] = &unk_2EB88;
  v4[7] = &unk_2EB88;
  v4[8] = &unk_2EB88;
  uint64_t result = type metadata accessor for UFLCoreAnalyticsLogLevel(319LL);
  if (v3 <= 0x3F)
  {
    v4[9] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 10LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

Swift::Int sub_7600()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_7644()
{
}

Swift::Int sub_766C(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_76AC(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_76C0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_76D0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_76DC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_76EC( uint8_t *a1, uint32_t a2, os_log_s *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = OSSignpostID.rawValue.getter();
  _os_signpost_emit_with_name_impl(&dword_0, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_776C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_77D0;
  return v6(a1);
}

uint64_t sub_77D0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void *sub_781C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char *a6, void *a7)
{
  uint64_t v37 = (void *)*a7;
  type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  __chkstk_darwin();
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = type metadata accessor for SiriPrivateLearningInferencePluginContext(0LL);
  uint64_t v42 = sub_8518( &qword_38E18,  type metadata accessor for SiriPrivateLearningInferencePluginContext,  (uint64_t)&unk_2F488);
  v40[0] = a1;
  sub_8120((uint64_t)v40, (uint64_t)(a7 + 2));
  sub_7D84((uint64_t)a2, (uint64_t)(a7 + 7));
  sub_8120((uint64_t)a3, (uint64_t)(a7 + 13));
  sub_8120((uint64_t)a4, (uint64_t)(a7 + 18));
  sub_8120((uint64_t)a5, (uint64_t)(a7 + 23));
  uint64_t v16 = type metadata accessor for StreamRegistry(0LL);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  a7[29] = StreamRegistry.init()();
  uint64_t v17 = v41;
  uint64_t v18 = v42;
  sub_8164(v40, v41);
  dispatch thunk of SiriPrivateLearningInferenceContext.uflCoreAnalyticsLogLevel.getter(v17, v18);
  uint64_t v19 = type metadata accessor for CoreAnalyticsLogHelper(0LL);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  a7[30] = CoreAnalyticsLogHelper.init(logLevel:)(v15);
  if (qword_38C38 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v20 = type metadata accessor for Logger(0LL);
  uint64_t v21 = sub_7D04(v20, (uint64_t)qword_394B0);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v34 = a5;
    uint64_t v35 = a4;
    uint64_t v36 = a3;
    uint64_t v24 = a2;
    BOOL v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v26 = swift_slowAlloc(32LL, -1LL);
    v39[0] = v26;
    *(_DWORD *)BOOL v25 = 136315138;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v27 = qword_394A0;
    unint64_t v28 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    uint64_t v38 = sub_28A50(v27, v28, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39, v25 + 4, v25 + 12);
    swift_bridgeObjectRelease(v28);
    _os_log_impl(&dword_0, v22, v23, "%s Initializing inference domains:", v25, 0xCu);
    swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);

    a2 = v24;
    a4 = v35;
    a3 = v36;
    a5 = v34;
  }

  else
  {
  }

  if ((swift_isUniquelyReferenced_nonNull_native(a6) & 1) == 0) {
    a6 = sub_26048(0LL, *((void *)a6 + 2) + 1LL, 1, a6);
  }
  unint64_t v30 = *((void *)a6 + 2);
  unint64_t v29 = *((void *)a6 + 3);
  if (v30 >= v29 >> 1) {
    a6 = sub_26048((char *)(v29 > 1), v30 + 1, 1, a6);
  }
  uint64_t v31 = type metadata accessor for CommonInferenceDomain();
  *((void *)a6 + 2) = v30 + 1;
  *(void *)&a6[8 * v30 + 32] = v31;
  __chkstk_darwin();
  *(&v34 - 2) = v40;
  *(&v34 - 1) = v37;
  uint64_t v32 = sub_73F4((void *(*)(uint64_t *__return_ptr, uint64_t *))sub_8188, (uint64_t)(&v34 - 4), (uint64_t)a6);
  swift_bridgeObjectRelease(a6);
  a7[28] = v32;
  sub_1192C();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a5);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a4);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a3);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a2);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v40);
  return a7;
}

unint64_t sub_7C08(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_4CC0(&qword_38DE0);
  unint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v1);
  Swift::UInt v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_290A0(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain(v4);
    return (unint64_t)v3;
  }

  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1LL);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    os_signpost_id_t v13 = v8 + 2;
    Swift::UInt v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain(v4);
    unint64_t result = sub_290A0(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if ((v15 & 1) != 0) {
      goto LABEL_7;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_7D04(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_7D1C()
{
  unint64_t result = qword_38DF8;
  if (!qword_38DF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2F158, &type metadata for InferencePluginError);
    atomic_store(result, (unint64_t *)&qword_38DF8);
  }

  return result;
}

uint64_t sub_7D60(uint64_t a1, char a2)
{
  if (a2 < 0) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_7D6C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_7D84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_7DC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PIMSCoreDataStorePolicies(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  Swift::UInt v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_8120(a1 + 176, (uint64_t)v16);
  uint64_t v6 = sub_4CC0(&qword_38E10);
  uint64_t v7 = type metadata accessor for PIMSStoreCoreData(0LL);
  if (swift_dynamicCast(&v15, v16, v6, v7, 6LL))
  {
    uint64_t v8 = v15;
    PIMSCoreDataStorePolicies.init()();
    PIMSCoreDataStorePolicies.runPolicy(store:)(v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_release(v8);
  }

  else
  {
    if (qword_38BA8 != -1) {
      swift_once(&qword_38BA8, sub_7028);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_7D04(v9, (uint64_t)qword_38BB0);
    BOOL v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      os_signpost_id_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)os_signpost_id_t v13 = 0;
      _os_log_impl( &dword_0,  v11,  v12,  "PIMS Store in context is not a CoreData store. Skipping store policies.",  v13,  2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }
  }
}

uint64_t sub_8120(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_8164(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

void sub_8188(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t *sub_81A0(uint64_t a1, uint64_t *a2)
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

uint64_t sub_81E4()
{
  uint64_t v1 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_8280(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PrivateLearningPluginRunContext(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  os_signpost_id_t v13 = (void *)swift_task_alloc(dword_38CB4);
  *(void *)(v2 + 16) = v13;
  *os_signpost_id_t v13 = v2;
  v13[1] = sub_833C;
  return sub_4EB0(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_833C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_8384()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_83A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_38E44);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_833C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_38E40 + dword_38E40))(a1, v4);
}

uint64_t sub_8418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4CC0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_845C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4CC0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void type metadata accessor for KVItemType()
{
  if (!qword_38E50)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_355A8);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_38E50);
    }
  }

uint64_t sub_84EC()
{
  return sub_8518( &qword_38E58,  (uint64_t (*)(uint64_t))type metadata accessor for KVItemType,  (uint64_t)&unk_2EBF0);
}

uint64_t sub_8518(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void sub_855C()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = type metadata accessor for PhoneCallContactGroundTruthGenerator();
  uint64_t v0 = sub_4CC0(&qword_38FB8);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_38E60 = v5;
  *(void *)algn_38E68 = v6;
}

uint64_t sub_85DC(uint64_t a1)
{
  uint64_t v3 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  v129 = (char *)&v120 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (uint64_t *)((char *)&v120 - v14);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v120 - v16;
  Array<A>.getSessionId()(a1);
  uint64_t v124 = v1;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v5, v6);
  if (qword_38BD0 != -1) {
    swift_once(&qword_38BD0, sub_99C0);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_7D04(v19, (uint64_t)qword_38E70);
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v128 = v17;
  uint64_t v125 = v21;
  uint64_t v22 = ((uint64_t (*)(uint64_t *, char *, uint64_t))v21)(v15, v17, v6);
  uint64_t v126 = v20;
  os_log_type_t v23 = (os_log_s *)Logger.logObject.getter(v22);
  LOBYTE(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = static os_log_type_t.debug.getter();
  BOOL v24 = os_log_type_enabled(v23, (os_log_type_t)v17);
  uint64_t v130 = a1;
  uint64_t v127 = v6;
  v121 = v10;
  if (!v24)
  {
    uint64_t v122 = *(void (**)(uint64_t *, uint64_t))(v7 + 8);
    v122(v15, v6);

    goto LABEL_9;
  }

  uint64_t isUniquelyReferenced_nonNull_native = swift_slowAlloc(22LL, -1LL);
  uint64_t v26 = swift_slowAlloc(64LL, -1LL);
  v134[0] = v26;
  *(_DWORD *)uint64_t isUniquelyReferenced_nonNull_native = 136315394;
  uint64_t v27 = isUniquelyReferenced_nonNull_native + 4;
  if (qword_38BC8 != -1) {
    goto LABEL_43;
  }
  while (1)
  {
    uint64_t v28 = qword_38E60;
    unint64_t v29 = *(void *)algn_38E68;
    swift_bridgeObjectRetain(*(void *)algn_38E68);
    uint64_t v131 = sub_28A50(v28, v29, v134);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, &v132, v27, isUniquelyReferenced_nonNull_native + 12);
    uint64_t v30 = swift_bridgeObjectRelease(v29);
    *(_WORD *)(isUniquelyReferenced_nonNull_native + 12) = 2080;
    uint64_t v31 = UUID.uuidString.getter(v30);
    unint64_t v33 = v32;
    uint64_t v131 = sub_28A50(v31, v32, v134);
    UnsafeMutableRawBufferPointer.copyMemory(from:)( &v131,  &v132,  isUniquelyReferenced_nonNull_native + 14,  isUniquelyReferenced_nonNull_native + 22);
    swift_bridgeObjectRelease(v33);
    uint64_t v122 = *(void (**)(uint64_t *, uint64_t))(v7 + 8);
    v122(v15, v127);
    _os_log_impl( &dword_0,  v23,  (os_log_type_t)v17,  "%s Reviewing session with id=%s",  (uint8_t *)isUniquelyReferenced_nonNull_native,  0x16u);
    swift_arrayDestroy(v26, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(isUniquelyReferenced_nonNull_native, -1LL, -1LL);

    a1 = v130;
LABEL_9:
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      v134[0] = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      if (qword_38BC8 != -1) {
        swift_once(&qword_38BC8, sub_855C);
      }
      uint64_t v39 = qword_38E60;
      unint64_t v40 = *(void *)algn_38E68;
      swift_bridgeObjectRetain(*(void *)algn_38E68);
      uint64_t v131 = sub_28A50(v39, v40, v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, &v132, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease(v40);
      _os_log_impl(&dword_0, v35, v36, "%s Running classifiers on session features", v37, 0xCu);
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    uint64_t v41 = sub_4CC0(&qword_38F88);
    uint64_t inited = swift_initStackObject(v41, &v137);
    *(_OWORD *)(inited + 16) = xmmword_2EC60;
    uint64_t v43 = type metadata accessor for PhoneCallClassifier(0LL);
    swift_allocObject(v43, *(unsigned int *)(v43 + 48), *(unsigned __int16 *)(v43 + 52));
    uint64_t v44 = PhoneCallClassifier.init()();
    *(void *)(inited + 56) = v43;
    *(void *)(inited + 64) = &protocol witness table for PhoneCallClassifier;
    *(void *)(inited + 32) = v44;
    uint64_t v45 = type metadata accessor for PartialRepetitionClassifier(0LL);
    uint64_t v46 = sub_4CC0(&qword_38F90);
    uint64_t v47 = swift_initStackObject(v46, &v133);
    *(_OWORD *)(v47 + 16) = xmmword_2EC70;
    *(void *)(v47 + 32) = static SiriKitTaskType.startCall.getter();
    *(void *)(v47 + 40) = v48;
    Swift::Int v49 = sub_2B218(v47);
    swift_setDeallocating(v47);
    swift_arrayDestroy(v47 + 32, 1LL, &type metadata for String);
    uint64_t v50 = type metadata accessor for ContactEntityUtteranceComparator(0LL);
    swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
    uint64_t v51 = ContactEntityUtteranceComparator.init(taskNamesOfInterest:restatementThreshold:allowsIdenticalUtterances:)( v49,  0LL,  0.7);
    uint64_t v135 = v50;
    v136 = &protocol witness table for ContactEntityUtteranceComparator;
    v134[0] = v51;
    uint64_t v52 = PartialRepetitionClassifier.__allocating_init(turnComparator:)(v134);
    v134[0] = v52;
    FeaturisedSessionClassifier.asSessionClassifier()(v45, &protocol witness table for PartialRepetitionClassifier);
    swift_release(v52);
    uint64_t v53 = type metadata accessor for EntityPromptClassifier(0LL);
    swift_allocObject(v53, *(unsigned int *)(v53 + 48), *(unsigned __int16 *)(v53 + 52));
    uint64_t v54 = EntityPromptClassifier.init()();
    *(void *)(inited + 136) = v53;
    *(void *)(inited + 144) = &protocol witness table for EntityPromptClassifier;
    *(void *)(inited + 112) = v54;
    swift_bridgeObjectRetain(a1);
    uint64_t v55 = sub_9A98(inited, a1);
    swift_bridgeObjectRelease(a1);
    swift_setDeallocating(inited);
    uint64_t v56 = *(void *)(inited + 16);
    uint64_t v57 = sub_4CC0(&qword_38F98);
    uint64_t v58 = swift_arrayDestroy(inited + 32, v56, v57);
    uint64_t v59 = (os_log_s *)Logger.logObject.getter(v58);
    os_log_type_t v60 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v62 = swift_slowAlloc(32LL, -1LL);
      v134[0] = v62;
      *(_DWORD *)uint64_t v61 = 136315138;
      if (qword_38BC8 != -1) {
        swift_once(&qword_38BC8, sub_855C);
      }
      uint64_t v63 = qword_38E60;
      unint64_t v64 = *(void *)algn_38E68;
      swift_bridgeObjectRetain(*(void *)algn_38E68);
      uint64_t v131 = sub_28A50(v63, v64, v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, &v132, v61 + 4, v61 + 12);
      swift_bridgeObjectRelease(v64);
      _os_log_impl(&dword_0, v59, v60, "%s Classification Results:", v61, 0xCu);
      swift_arrayDestroy(v62, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1LL, -1LL);
      swift_slowDealloc(v61, -1LL, -1LL);

      a1 = v130;
    }

    else
    {
    }

    sub_10C9C(8224LL, 0xE200000000000000LL, (uint64_t)v55);
    uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v69 = swift_slowAlloc(32LL, -1LL);
      v134[0] = v69;
      *(_DWORD *)uint64_t v68 = 136315138;
      if (qword_38BC8 != -1) {
        swift_once(&qword_38BC8, sub_855C);
      }
      uint64_t v70 = qword_38E60;
      unint64_t v71 = *(void *)algn_38E68;
      swift_bridgeObjectRetain(*(void *)algn_38E68);
      uint64_t v131 = sub_28A50(v70, v71, v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, &v132, v68 + 4, v68 + 12);
      swift_bridgeObjectRelease(v71);
      _os_log_impl(&dword_0, v66, v67, "%s Running ground truth generators with classification results.", v68, 0xCu);
      swift_arrayDestroy(v69, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v69, -1LL, -1LL);
      swift_slowDealloc(v68, -1LL, -1LL);

      a1 = v130;
    }

    else
    {
    }

    uint64_t v72 = type metadata accessor for PhoneCallInAppFollowupGroundTruthGenerator(0LL);
    swift_allocObject(v72, *(unsigned int *)(v72 + 48), *(unsigned __int16 *)(v72 + 52));
    uint64_t v73 = PhoneCallInAppFollowupGroundTruthGenerator.init()();
    v134[0] = v73;
    uint64_t v74 = sub_9C90( &qword_38FA0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for PhoneCallInAppFollowupGroundTruthGenerator,  (uint64_t)&protocol conformance descriptor for PhoneCallInAppFollowupGroundTruthGenerator);
    uint64_t v75 = dispatch thunk of GroundTruthInference.generate(session:classifications:)(a1, v55, v72, v74);
    swift_release(v73);
    uint64_t v76 = sub_26F88(v75);
    swift_bridgeObjectRelease(v75);
    uint64_t v77 = type metadata accessor for SuccessfulPhoneCallDefinition(0LL);
    swift_allocObject(v77, *(unsigned int *)(v77 + 48), *(unsigned __int16 *)(v77 + 52));
    uint64_t v78 = SuccessfulPhoneCallDefinition.init()();
    uint64_t v131 = v78;
    uint64_t v79 = sub_9C90( &qword_38FA8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for SuccessfulPhoneCallDefinition,  (uint64_t)&protocol conformance descriptor for SuccessfulPhoneCallDefinition);
    SuccessfulTaskDefinition.generator()(v134, v77, v79);
    swift_release(v78);
    uint64_t v80 = v135;
    uint64_t v81 = v136;
    sub_8164(v134, v135);
    uint64_t v82 = dispatch thunk of GroundTruthInference.generate(session:classifications:)(a1, v55, v80, v81);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v81,  v80,  &protocol requirements base descriptor for GroundTruthInference,  &associated type descriptor for GroundTruthInference.T);
    uint64_t v84 = sub_4CC0(&qword_38FB0);
    uint64_t v85 = _arrayForceCast<A, B>(_:)(v82, AssociatedTypeWitness, v84);
    swift_bridgeObjectRelease(v82);
    uint64_t v131 = (uint64_t)v76;
    sub_27134(v85);
    uint64_t v86 = v131;
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v134);
    uint64_t v87 = type metadata accessor for ContactPromptGroundTruthGenerator(0LL);
    swift_allocObject(v87, *(unsigned int *)(v87 + 48), *(unsigned __int16 *)(v87 + 52));
    uint64_t v88 = ContactPromptGroundTruthGenerator.init()();
    uint64_t v89 = dispatch thunk of ContactPromptGroundTruthGenerator.generate(session:classifications:)(a1, v55);
    uint64_t v90 = swift_release(v88);
    uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
    os_log_type_t v92 = static os_log_type_t.debug.getter();
    BOOL v93 = os_log_type_enabled(v91, v92);
    uint64_t v123 = v86;
    if (v93)
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v95 = swift_slowAlloc(32LL, -1LL);
      v134[0] = v95;
      *(_DWORD *)uint64_t v94 = 136315138;
      if (qword_38BC8 != -1) {
        swift_once(&qword_38BC8, sub_855C);
      }
      uint64_t v96 = qword_38E60;
      unint64_t v97 = *(void *)algn_38E68;
      swift_bridgeObjectRetain(*(void *)algn_38E68);
      uint64_t v131 = sub_28A50(v96, v97, v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, &v132, v94 + 4, v94 + 12);
      swift_bridgeObjectRelease(v97);
      _os_log_impl(&dword_0, v91, v92, "%s Generated Phone Call Ground Truth:", v94, 0xCu);
      swift_arrayDestroy(v95, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v95, -1LL, -1LL);
      swift_slowDealloc(v94, -1LL, -1LL);

      a1 = v130;
      uint64_t v86 = v123;
    }

    else
    {
    }

    sub_10C90(8224LL, 0xE200000000000000LL, v86);
    uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
    os_log_type_t v100 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v101 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v102 = swift_slowAlloc(32LL, -1LL);
      v134[0] = v102;
      *(_DWORD *)uint64_t v101 = 136315138;
      if (qword_38BC8 != -1) {
        swift_once(&qword_38BC8, sub_855C);
      }
      uint64_t v103 = qword_38E60;
      unint64_t v104 = *(void *)algn_38E68;
      swift_bridgeObjectRetain(*(void *)algn_38E68);
      uint64_t v131 = sub_28A50(v103, v104, v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, &v132, v101 + 4, v101 + 12);
      swift_bridgeObjectRelease(v104);
      _os_log_impl(&dword_0, v99, v100, "%s Generated Contact Prompt Ground Truth:", v101, 0xCu);
      swift_arrayDestroy(v102, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v102, -1LL, -1LL);
      swift_slowDealloc(v101, -1LL, -1LL);

      uint64_t v106 = v127;
      uint64_t v105 = v128;
      a1 = v130;
      uint64_t v86 = v123;
    }

    else
    {

      uint64_t v106 = v127;
      uint64_t v105 = v128;
    }

    sub_11030(8224LL, 0xE200000000000000LL, v89);
    os_signpost_id_t v107 = sub_26FA4(v89);
    swift_bridgeObjectRelease(v89);
    v134[0] = v86;
    sub_27134((uint64_t)v107);
    os_log_type_t v23 = (os_log_s *)v134[0];
    uint64_t v26 = v124;
    sub_9CD0(a1, (uint64_t)v55);
    swift_bridgeObjectRelease(v55);
    uint64_t v7 = (uint64_t)v129;
    v125(v129, v105, v106);
    uint64_t v15 = (uint64_t *)(v26 + 64);
    swift_beginAccess(v26 + 64, v134, 33LL, 0LL);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v26 + 64));
    uint64_t v131 = *(void *)(v26 + 64);
    uint64_t v27 = v131;
    *(void *)(v26 + 64) = 0x8000000000000000LL;
    uint64_t v17 = (char *)sub_290F8(v7);
    uint64_t v109 = *(void *)(v27 + 16);
    BOOL v110 = (v108 & 1) == 0;
    uint64_t v111 = v109 + v110;
    if (!__OFADD__(v109, v110)) {
      break;
    }
    __break(1u);
LABEL_43:
    swift_once(&qword_38BC8, sub_855C);
  }

  char v112 = v108;
  if (*(void *)(v27 + 24) >= v111)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_29FBC();
      uint64_t v27 = v131;
    }
  }

  else
  {
    sub_29348(v111, isUniquelyReferenced_nonNull_native);
    uint64_t v27 = v131;
    unint64_t v113 = sub_290F8(v7);
    if ((v112 & 1) != (v114 & 1))
    {
      uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v106);
      __break(1u);
      return result;
    }

    uint64_t v17 = (char *)v113;
  }

  uint64_t v115 = (void (*)(uint64_t, uint64_t))v122;
  uint64_t v116 = (void *)*v15;
  *uint64_t v15 = v27;
  swift_bridgeObjectRelease(v116);
  uint64_t v117 = (void *)*v15;
  __n128 v118 = swift_bridgeObjectRetain(*v15);
  if ((v112 & 1) == 0)
  {
    uint64_t v119 = (uint64_t)v121;
    ((void (*)(char *, uint64_t, uint64_t, __n128))v125)(v121, v7, v106, v118);
    sub_29E78((unint64_t)v17, v119, (uint64_t)_swiftEmptyArrayStorage, v117);
  }

  swift_bridgeObjectRelease(v117);
  sub_27134((uint64_t)v23);
  v115(v7, v106);
  swift_endAccess(v134);
  return ((uint64_t (*)(char *, uint64_t))v115)(v128, v106);
}

uint64_t sub_9498()
{
  uint64_t v63 = sub_4CC0(&qword_38F78);
  uint64_t v1 = __chkstk_darwin(v63);
  uint64_t v62 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v61 = (char *)&v49 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v60 = (uint64_t)&v49 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v59 = (char *)&v49 - v8;
  __chkstk_darwin(v7);
  uint64_t v58 = (char *)&v49 - v9;
  uint64_t v10 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v56 = *(void *)(v10 - 8);
  uint64_t v57 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess(v0 + 64, v67, 0LL, 0LL);
  uint64_t v13 = *(void *)(v0 + 64);
  int64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = _swiftEmptyArrayStorage;
  if (!v14) {
    return (uint64_t)v15;
  }
  uint64_t v66 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v13);
  sub_2A71C(0, v14, 0);
  uint64_t result = sub_2B18C(v13);
  uint64_t v18 = result;
  uint64_t v19 = 0LL;
  uint64_t v20 = v13 + 64;
  char v21 = *(_BYTE *)(v13 + 32);
  uint64_t v50 = v13 + 80;
  int64_t v51 = v14;
  uint64_t v54 = v13;
  uint64_t v55 = v12;
  uint64_t v52 = v17;
  uint64_t v53 = v13 + 64;
  while ((v18 & 0x8000000000000000LL) == 0 && v18 < 1LL << v21)
  {
    unint64_t v24 = (unint64_t)v18 >> 6;
    if (*(_DWORD *)(v13 + 36) != (_DWORD)v17) {
      goto LABEL_27;
    }
    uint64_t v64 = v19;
    uint64_t v65 = 1LL << v18;
    uint64_t v25 = v63;
    uint64_t v26 = *(int *)(v63 + 48);
    uint64_t v27 = *(void *)(v13 + 48);
    uint64_t v28 = type metadata accessor for UUID(0LL);
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    uint64_t v31 = (uint64_t)v58;
    v30(v58, v27 + *(void *)(v29 + 72) * v18, v28);
    uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v18);
    *(void *)(v31 + v26) = v32;
    unint64_t v33 = v59;
    v30(v59, v31, v28);
    *(void *)&v33[*(int *)(v25 + 48)] = v32;
    uint64_t v34 = (uint64_t)v33;
    uint64_t v35 = v60;
    sub_9A50(v34, v60);
    swift_bridgeObjectRetain_n(v32, 2LL);
    sub_845C(v31, &qword_38F78);
    uint64_t v36 = *(int *)(v25 + 48);
    uint64_t v37 = v61;
    v30(v61, v35, v28);
    uint64_t v38 = *(void *)(v35 + v36);
    *(void *)&v37[v36] = v38;
    uint64_t v39 = *(int *)(v25 + 48);
    unint64_t v40 = v62;
    v30(v62, v35, v28);
    uint64_t v41 = v55;
    *(void *)&v40[v39] = v38;
    swift_bridgeObjectRetain(v38);
    SessionGroundTruths.init(sessionId:groundTruth:)(v37, v38);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v40, v28);
    sub_845C(v35, &qword_38F78);
    uint64_t v15 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) == 0)
    {
      sub_2A71C(0, v15[2] + 1LL, 1);
      uint64_t v15 = v66;
    }

    unint64_t v43 = v15[2];
    unint64_t v42 = v15[3];
    uint64_t v13 = v54;
    if (v43 >= v42 >> 1)
    {
      sub_2A71C(v42 > 1, v43 + 1, 1);
      uint64_t v15 = v66;
    }

    v15[2] = v43 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v56 + 32))( (unint64_t)v15 + ((*(unsigned __int8 *)(v56 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))
             + *(void *)(v56 + 72) * v43,
               v41,
               v57);
    uint64_t v66 = v15;
    char v21 = *(_BYTE *)(v13 + 32);
    unint64_t v22 = 1LL << v21;
    if (v18 >= 1LL << v21) {
      goto LABEL_28;
    }
    uint64_t v20 = v53;
    uint64_t v44 = *(void *)(v53 + 8 * v24);
    if ((v44 & v65) == 0) {
      goto LABEL_29;
    }
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = v52;
    if (*(_DWORD *)(v13 + 36) != (_DWORD)v52) {
      goto LABEL_30;
    }
    unint64_t v45 = v44 & (-2LL << (v18 & 0x3F));
    if (v45)
    {
      unint64_t v22 = __clz(__rbit64(v45)) | v18 & 0xFFFFFFFFFFFFFFC0LL;
      int64_t v23 = v51;
    }

    else
    {
      unint64_t v46 = v24 + 1;
      unint64_t v47 = (v22 + 63) >> 6;
      int64_t v23 = v51;
      if (v24 + 1 < v47)
      {
        unint64_t v48 = *(void *)(v53 + 8 * v46);
        if (v48)
        {
LABEL_22:
          unint64_t v22 = __clz(__rbit64(v48)) + (v46 << 6);
        }

        else
        {
          while (v47 - 2 != v24)
          {
            unint64_t v48 = *(void *)(v50 + 8 * v24++);
            if (v48)
            {
              unint64_t v46 = v24 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }

    uint64_t v19 = v64 + 1;
    uint64_t v18 = v22;
    if (v64 + 1 == v23)
    {
      swift_bridgeObjectRelease(v13);
      return (uint64_t)v15;
    }
  }

  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_98F8()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t type metadata accessor for PhoneCallContactGroundTruthGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin36PhoneCallContactGroundTruthGenerator);
}

uint64_t sub_9954()
{
  return sub_9498();
}

uint64_t sub_9974(uint64_t a1)
{
  return sub_85DC(a1);
}

uint64_t sub_9994(uint64_t a1, uint64_t a2)
{
  return sub_9C90( &qword_38F70,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for PhoneCallContactGroundTruthGenerator,  (uint64_t)"1i");
}

uint64_t sub_99C0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_38E70);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_38E70);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_9A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4CC0(&qword_38F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

char *sub_9A98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v4 = (void *)(a1 + 32);
  swift_bridgeObjectRetain(a1);
  uint64_t v5 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v6 = v4[3];
    uint64_t v7 = v4[4];
    sub_8164(v4, v6);
    uint64_t v8 = SessionClassifier.classify(session:)(a2, v6, v7);
    uint64_t v9 = *(void *)(v8 + 16);
    int64_t v10 = *((void *)v5 + 2);
    int64_t v11 = v10 + v9;
    if (__OFADD__(v10, v9)) {
      break;
    }
    uint64_t v12 = v8;
    uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v5);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v11 <= *((void *)v5 + 3) >> 1)
    {
      if (*(void *)(v12 + 16)) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v10 <= v11) {
        int64_t v14 = v10 + v9;
      }
      else {
        int64_t v14 = v10;
      }
      uint64_t v5 = sub_263A8(isUniquelyReferenced_nonNull_native, v14, 1, v5);
      if (*(void *)(v12 + 16))
      {
LABEL_14:
        uint64_t v15 = *((void *)v5 + 2);
        if ((*((void *)v5 + 3) >> 1) - v15 < v9) {
          goto LABEL_28;
        }
        unint64_t v16 = (unint64_t)&v5[40 * v15 + 32];
        if (v12 + 32 < v16 + 40 * v9 && v16 < v12 + 32 + 40 * v9) {
          goto LABEL_30;
        }
        sub_4CC0(&qword_38FC0);
        swift_arrayInitWithCopy(v16);
        if (v9)
        {
          uint64_t v18 = *((void *)v5 + 2);
          BOOL v19 = __OFADD__(v18, v9);
          uint64_t v20 = v18 + v9;
          if (v19) {
            goto LABEL_29;
          }
          *((void *)v5 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v20;
        }

        goto LABEL_4;
      }
    }

    if (v9) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease(v12);
    v4 += 5;
    if (!--v2)
    {
      swift_bridgeObjectRelease(a1);
      return v5;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_bridgeObjectRelease(a2);
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_9C90(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t sub_9CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v38 = a2;
  uint64_t v5 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  __chkstk_darwin(v8);
  int64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_38BD0 != -1) {
    swift_once(&qword_38BD0, sub_99C0);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = sub_7D04(v11, (uint64_t)qword_38E70);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v16 = &SiriPrivateLearningInferencePlugin;
  uint64_t v39 = v2;
  if (v15)
  {
    uint64_t v37 = a1;
    uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = swift_slowAlloc(32LL, -1LL);
    v43[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    if (qword_38BC8 != -1) {
      swift_once(&qword_38BC8, sub_855C);
    }
    uint64_t v19 = qword_38E60;
    unint64_t v20 = *(void *)algn_38E68;
    swift_bridgeObjectRetain(*(void *)algn_38E68);
    uint64_t v42 = sub_28A50(v19, v20, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease(v20);
    _os_log_impl(&dword_0, v13, v14, "%s Logging inference results to SELF", v17, 0xCu);
    swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);

    a1 = v37;
    uint64_t v3 = v39;
    unint64_t v16 = &SiriPrivateLearningInferencePlugin;
  }

  else
  {
  }

  uint64_t v22 = UUID.init()(v21);
  int64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = a1;
    uint64_t v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v27 = swift_slowAlloc(32LL, -1LL);
    uint64_t v28 = v16;
    uint64_t v29 = v27;
    v43[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    if (v28[41].base_props != (__objc2_prop_list *)-1LL) {
      swift_once(&qword_38BC8, sub_855C);
    }
    uint64_t v30 = qword_38E60;
    unint64_t v31 = *(void *)algn_38E68;
    swift_bridgeObjectRetain(*(void *)algn_38E68);
    uint64_t v42 = sub_28A50(v30, v31, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease(v31);
    _os_log_impl(&dword_0, v23, v24, "%s Extracting phone call metadata for SELF logging", v26, 0xCu);
    swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);

    a1 = v25;
    uint64_t v3 = v39;
  }

  else
  {
  }

  Array<A>.getOriginalPlusId()(a1);
  dispatch thunk of PLUSOfflineLogHelpers.logPhoneCallMetadata(session:originalPlusId:plusId:)(a1, v7, v10);
  sub_845C((uint64_t)v7, &qword_38F80);
  uint64_t v32 = *(void *)(v3 + 56);
  if (!v32) {
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v10, v41);
  }
  sub_8120(v3 + 16, (uint64_t)v43);
  uint64_t v33 = type metadata accessor for PhoneCallSuggestionOutcomeExtractor(0LL);
  swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
  swift_retain(v32);
  uint64_t v34 = PhoneCallSuggestionOutcomeExtractor.init(picsStore:)(v43);
  v43[3] = v33;
  v43[4] = (uint64_t)&protocol witness table for PhoneCallSuggestionOutcomeExtractor;
  v43[0] = v34;
  swift_retain(v34);
  dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.reviewSessionSuggestionOutcomes(session:classifications:outcomeExtractor:)( a1,  v38,  v43);
  swift_release(v34);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v41);
  return _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v43);
}

uint64_t initializeBufferWithCopyOfBuffer for AdaptiveMediaSuggestionGeneratorWrapper( uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1)
{
  return _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(a1 + 16));
}

uint64_t initializeWithCopy for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  __int128 v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain(v3);
  v7(a1 + 16, v4, v6);
  return a1;
}

void *assignWithCopy for AdaptiveMediaSuggestionGeneratorWrapper(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  sub_A240(a1 + 2, a2 + 2);
  return a1;
}

void *sub_A240(void *result, void *a2)
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
        void *v3 = v12;
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
          void *v3 = *a2;
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
          void *v3 = *a2;
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

__n128 initializeWithTake for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(a1 + 16));
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdaptiveMediaSuggestionGeneratorWrapper( uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AdaptiveMediaSuggestionGeneratorWrapper()
{
  return &type metadata for AdaptiveMediaSuggestionGeneratorWrapper;
}

void *sub_A4B4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  __int128 v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v7 = *(void *)(a1 + 16);
  int v8 = _swiftEmptyArrayStorage;
  if (v7)
  {
    v16[1] = v1;
    uint64_t v17 = _swiftEmptyArrayStorage;
    sub_2A66C(0, v7, 0);
    int v8 = v17;
    uint64_t v9 = (void *)(a1 + 32);
    do
    {
      uint64_t v10 = v9[3];
      uint64_t v11 = v9[4];
      sub_8164(v9, v10);
      dispatch thunk of TypedGroundTruth.id.getter(v10, v11);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
      uint64_t v17 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_2A66C(0, v8[2] + 1LL, 1);
        int v8 = v17;
      }

      unint64_t v14 = v8[2];
      unint64_t v13 = v8[3];
      if (v14 >= v13 >> 1)
      {
        sub_2A66C(v13 > 1, v14 + 1, 1);
        int v8 = v17;
      }

      v8[2] = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))( (unint64_t)v8 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
      + *(void *)(v4 + 72) * v14,
        v6,
        v3);
      uint64_t v17 = v8;
      v9 += 5;
      --v7;
    }

    while (v7);
  }

  return v8;
}

void sub_A634()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = &type metadata for AdaptiveMediaSuggestionGeneratorWrapper;
  uint64_t v0 = sub_4CC0(&qword_39010);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_38FC8 = v5;
  unk_38FD0 = v6;
}

uint64_t sub_A6B8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  os_log_type_t v67 = *(void **)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v68 = (char *)&v50 - v7;
  uint64_t v57 = type metadata accessor for ThinMediaGroundTruth(0LL);
  uint64_t v61 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v56 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for PlusMediaSuggestion(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v65 = v9;
  uint64_t v66 = v10;
  __chkstk_darwin(v9);
  uint64_t v64 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_4CC0(&qword_38FF0);
  uint64_t v13 = type metadata accessor for MediaSuggestionTag(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = (v15 + 32) & ~v15;
  uint64_t v17 = swift_allocObject(v12, v16 + *(void *)(v14 + 72), v15 | 7);
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))( v17 + v16,  enum case for MediaSuggestionTag.domainMusic(_:),  v13);
  uint64_t v70 = _swiftEmptyArrayStorage;
  sub_AC0C(v17 + v16, v1, a1, &v69);
  sub_27148(v69);
  swift_setDeallocating(v17);
  swift_arrayDestroy(v17 + v16, 1LL, v13);
  swift_deallocClassInstance(v17, 32LL, 7LL);
  uint64_t v18 = v70;
  uint64_t v19 = sub_A4B4(a1);
  uint64_t v20 = sub_22580((uint64_t)v19);
  swift_bridgeObjectRelease(v19);
  uint64_t v52 = v18[2];
  if (v52)
  {
    int64_t v51 = (char *)v18 + ((*(unsigned __int8 *)(v66 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
    uint64_t v21 = v20 + 56;
    __n128 v22 = swift_bridgeObjectRetain(v18);
    uint64_t v23 = 0LL;
    unint64_t v24 = 0LL;
    uint64_t v26 = v56;
    uint64_t v25 = v57;
    uint64_t v50 = v18;
    while (v24 < v18[2])
    {
      uint64_t v63 = v23;
      uint64_t v27 = *(void *)(v66 + 72);
      unint64_t v62 = v24;
      uint64_t v28 = (*(uint64_t (**)(char *, char *, uint64_t, __n128))(v66 + 16))(v64, &v51[v27 * v24], v65, v22);
      uint64_t v29 = PlusMediaSuggestion.contributingGroundTruth.getter(v28);
      uint64_t v59 = *(void *)(v29 + 16);
      if (v59)
      {
        uint64_t v30 = 0LL;
        unint64_t v31 = (*(unsigned __int8 *)(v61 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
        uint64_t v58 = v29;
        unint64_t v32 = v29 + v31;
        uint64_t v33 = *(void *)(v61 + 72);
        uint64_t v34 = *(uint64_t (**)(void, void, void))(v61 + 16);
        uint64_t v54 = v33;
        unint64_t v55 = v32;
        uint64_t v53 = v34;
        while (1)
        {
          uint64_t v35 = v34(v26, v32 + v33 * v30, v25);
          ThinMediaGroundTruth.id.getter(v35);
          if (!*(void *)(v20 + 16)) {
            break;
          }
          uint64_t v36 = *(void *)(v20 + 40);
          uint64_t v37 = sub_8518( &qword_38FF8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
          uint64_t v38 = dispatch thunk of Hashable._rawHashValue(seed:)(v36, v3, v37);
          uint64_t v39 = -1LL << *(_BYTE *)(v20 + 32);
          unint64_t v40 = v38 & ~v39;
          if (((*(void *)(v21 + ((v40 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v40) & 1) == 0) {
            break;
          }
          uint64_t v60 = v30 + 1;
          uint64_t v41 = ~v39;
          uint64_t v42 = v67[9];
          unint64_t v43 = (void (*)(char *, unint64_t, uint64_t))v67[2];
          while (1)
          {
            v43(v6, *(void *)(v20 + 48) + v42 * v40, v3);
            uint64_t v44 = sub_8518( &qword_39000,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
            char v45 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v68, v3, v44);
            unint64_t v46 = (void (*)(char *, uint64_t))v67[1];
            v46(v6, v3);
            if ((v45 & 1) != 0) {
              break;
            }
            unint64_t v40 = (v40 + 1) & v41;
            if (((*(void *)(v21 + ((v40 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v40) & 1) == 0) {
              goto LABEL_16;
            }
          }

          v46(v68, v3);
          uint64_t v26 = v56;
          uint64_t v25 = v57;
          (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v57);
          uint64_t v30 = v60;
          uint64_t v33 = v54;
          unint64_t v32 = v55;
          uint64_t v34 = v53;
          if (v60 == v59)
          {
            swift_bridgeObjectRelease(v58);
            int v47 = 0;
            goto LABEL_17;
          }
        }

        unint64_t v46 = (void (*)(char *, uint64_t))v67[1];
LABEL_16:
        v46(v68, v3);
        uint64_t v26 = v56;
        uint64_t v25 = v57;
        (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v57);
        swift_bridgeObjectRelease(v58);
        int v47 = 1;
LABEL_17:
        uint64_t v18 = v50;
      }

      else
      {
        swift_bridgeObjectRelease(v29);
        int v47 = 0;
      }

      (*(void (**)(char *, uint64_t))(v66 + 8))(v64, v65);
      if (__CFADD__((_DWORD)v63, v47)) {
        goto LABEL_26;
      }
      uint64_t v23 = (v63 + v47);
      unint64_t v24 = v62 + 1;
      if (v62 + 1 == v52)
      {
        swift_bridgeObjectRelease(v20);
        uint64_t v20 = (uint64_t)v18;
        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_26:
    __break(1u);
  }

  else
  {
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 23) = 0;
LABEL_22:
    swift_bridgeObjectRelease(v20);
    unint64_t v48 = v18[2];
    swift_bridgeObjectRelease(v18);
    if (HIDWORD(v48)) {
      goto LABEL_28;
    }
  }

  __break(1u);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  __break(1u);
LABEL_28:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_AC0C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v87 = a3;
  uint64_t v86 = a4;
  uint64_t v6 = type metadata accessor for MediaSuggestionTag(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v81 - v11;
  if (qword_38BE0 != -1) {
    swift_once(&qword_38BE0, sub_B5A8);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = sub_7D04(v13, (uint64_t)qword_38FD8);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v85 = a1;
  uint64_t v88 = v15;
  uint64_t v16 = ((uint64_t (*)(char *, uint64_t, uint64_t))v15)(v12, a1, v6);
  uint64_t v89 = v14;
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  int v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    LODWORD(v83) = v18;
    uint64_t v84 = a2;
    uint64_t v19 = swift_slowAlloc(22LL, -1LL);
    uint64_t v82 = swift_slowAlloc(64LL, -1LL);
    uint64_t v90 = (void (*)(void, void, void))v82;
    *(_DWORD *)uint64_t v19 = 136315394;
    if (qword_38BD8 != -1) {
      swift_once(&qword_38BD8, sub_A634);
    }
    uint64_t v20 = qword_38FC8;
    unint64_t v21 = unk_38FD0;
    swift_bridgeObjectRetain(unk_38FD0);
    uint64_t v92 = sub_28A50(v20, v21, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v19 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    __n128 v22 = v88;
    v88((uint64_t)v10, (uint64_t)v12, v6);
    uint64_t v23 = String.init<A>(describing:)(v10, v6);
    unint64_t v25 = v24;
    uint64_t v92 = sub_28A50(v23, v24, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v19 + 14, v19 + 22);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    _os_log_impl(&dword_0, v17, (os_log_type_t)v83, "%s Processing new ground truth for %s", (uint8_t *)v19, 0x16u);
    uint64_t v26 = v82;
    swift_arrayDestroy(v82, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v19, -1LL, -1LL);

    a2 = v84;
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);

    __n128 v22 = v88;
  }

  uint64_t v27 = a2[5];
  uint64_t v28 = a2[6];
  sub_8164(a2 + 2, v27);
  dispatch thunk of SiriPrivateLearningInferenceContext.pimsStore.getter(&v90, v27, v28);
  uint64_t v29 = sub_4CC0(&qword_38FF0);
  uint64_t v30 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v31 = (v30 + 32) & ~v30;
  uint64_t v32 = v31 + *(void *)(v7 + 72);
  uint64_t v33 = v30 | 7;
  uint64_t v34 = swift_allocObject(v29, v32, v30 | 7);
  __int128 v83 = xmmword_2EC70;
  *(_OWORD *)(v34 + 16) = xmmword_2EC70;
  uint64_t v35 = v85;
  v22(v34 + v31, v85, v6);
  uint64_t v36 = sub_2B6D0(v34);
  swift_setDeallocating(v34);
  swift_arrayDestroy(v34 + v31, 1LL, v6);
  swift_deallocClassInstance(v34, 32LL, 7LL);
  uint64_t v37 = type metadata accessor for MediaSuggestionStoreCandidateAdapter(0LL);
  uint64_t v38 = *(unsigned int *)(v37 + 48);
  uint64_t v39 = *(unsigned __int16 *)(v37 + 52);
  uint64_t v84 = (void *)v37;
  swift_allocObject(v37, v38, v39);
  uint64_t v40 = MediaSuggestionStoreCandidateAdapter.init(store:requiredTags:)(&v90, v36);
  uint64_t v41 = swift_allocObject(v29, v32, v33);
  *(_OWORD *)(v41 + 16) = v83;
  v88(v41 + v31, v35, v6);
  swift_retain(v40);
  uint64_t v42 = sub_2B6D0(v41);
  swift_setDeallocating(v41);
  swift_arrayDestroy(v41 + v31, 1LL, v6);
  swift_deallocClassInstance(v41, 32LL, 7LL);
  uint64_t v43 = type metadata accessor for AdaptiveMediaSuggestionGenerator(0LL);
  swift_allocObject(v43, *(unsigned int *)(v43 + 48), *(unsigned __int16 *)(v43 + 52));
  uint64_t v88 = (void (*)(uint64_t, uint64_t, uint64_t))v40;
  uint64_t v44 = AdaptiveMediaSuggestionGenerator.init(candidateProvider:domainTags:)(v40, v42);
  uint64_t v45 = v87;
  uint64_t v85 = v44;
  uint64_t v46 = dispatch thunk of AdaptiveMediaSuggestionGenerator.processGroundTruths(groundTruthList:)(v87);
  swift_bridgeObjectRetain(v45);
  unint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    uint64_t v51 = swift_slowAlloc(32LL, -1LL);
    uint64_t v90 = (void (*)(void, void, void))v51;
    *(_DWORD *)uint64_t v50 = 136315650;
    if (qword_38BD8 != -1) {
      swift_once(&qword_38BD8, sub_A634);
    }
    uint64_t v52 = qword_38FC8;
    unint64_t v53 = unk_38FD0;
    swift_bridgeObjectRetain(unk_38FD0);
    uint64_t v92 = sub_28A50(v52, v53, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v50 + 4, v50 + 12);
    swift_bridgeObjectRelease(v53);
    *(_WORD *)(v50 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
    uint64_t v54 = v87;
    uint64_t v92 = *(void *)(v87 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v50 + 14, v50 + 22);
    swift_bridgeObjectRelease(v54);
    *(_WORD *)(v50 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
    if ((v46 & 0xC000000000000001LL) != 0)
    {
      if (v46 < 0) {
        uint64_t v55 = v46;
      }
      else {
        uint64_t v55 = v46 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v56 = __CocoaSet.count.getter(v55);
    }

    else
    {
      uint64_t v56 = *(void *)(v46 + 16);
    }

    uint64_t v57 = &SiriPrivateLearningInferencePlugin;
    uint64_t v92 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v50 + 24, v50 + 32);
    _os_log_impl( &dword_0,  v48,  v49,  "%s Updated candidate scores in %ld Ground Truth and %ld queries.",  (uint8_t *)v50,  0x20u);
    swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1LL, -1LL);
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v45);
    uint64_t v57 = &SiriPrivateLearningInferencePlugin;
  }

  type metadata accessor for AdaptiveMediaSuggestionNominator(0LL);
  uint64_t v58 = v88;
  uint64_t v90 = v88;
  uint64_t v59 = sub_8518( &qword_39008,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaSuggestionStoreCandidateAdapter,  (uint64_t)&protocol conformance descriptor for MediaSuggestionStoreCandidateAdapter);
  swift_retain(v58);
  uint64_t v60 = AdaptiveMediaSuggestionNominator.__allocating_init<A>(candidateProvider:)(&v90, v84, v59);
  uint64_t v61 = sub_B654( v46,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity_common_MediaItem,  &qword_39020,  (uint64_t)&protocol conformance descriptor for UsoEntity_common_MediaItem);
  swift_bridgeObjectRelease(v46);
  uint64_t v87 = v60;
  uint64_t v62 = dispatch thunk of AdaptiveMediaSuggestionNominator.nominate(queries:)(v61);
  uint64_t v63 = swift_release(v61);
  uint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
  os_log_type_t v65 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v67 = swift_slowAlloc(32LL, -1LL);
    uint64_t v90 = (void (*)(void, void, void))v67;
    *(_DWORD *)uint64_t v66 = 136315138;
    if (*(void *)&v57[42].ivar_base_size != -1LL) {
      swift_once(&qword_38BD8, sub_A634);
    }
    uint64_t v68 = qword_38FC8;
    unint64_t v69 = unk_38FD0;
    swift_bridgeObjectRetain(unk_38FD0);
    uint64_t v92 = sub_28A50(v68, v69, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v66 + 4, v66 + 12);
    swift_bridgeObjectRelease(v69);
    _os_log_impl(&dword_0, v64, v65, "%s Nominated Candidates:", v66, 0xCu);
    swift_arrayDestroy(v67, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v67, -1LL, -1LL);
    swift_slowDealloc(v66, -1LL, -1LL);
  }

  if (*(void *)&v57[42].ivar_base_size != -1LL) {
    swift_once(&qword_38BD8, sub_A634);
  }
  uint64_t v90 = (void (*)(void, void, void))qword_38FC8;
  unint64_t v91 = unk_38FD0;
  swift_bridgeObjectRetain(unk_38FD0);
  v70._countAndFlagsBits = 8224LL;
  v70._object = (void *)0xE200000000000000LL;
  String.append(_:)(v70);
  unint64_t v71 = v91;
  sub_1103C((uint64_t)v90, v91, v62);
  uint64_t v72 = swift_bridgeObjectRelease(v71);
  uint64_t v73 = (os_log_s *)Logger.logObject.getter(v72);
  os_log_type_t v74 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v76 = swift_slowAlloc(32LL, -1LL);
    uint64_t v90 = (void (*)(void, void, void))v76;
    *(_DWORD *)uint64_t v75 = 136315138;
    uint64_t v77 = qword_38FC8;
    unint64_t v78 = unk_38FD0;
    swift_bridgeObjectRetain(unk_38FD0);
    uint64_t v92 = sub_28A50(v77, v78, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v75 + 4, v75 + 12);
    swift_bridgeObjectRelease(v78);
    _os_log_impl(&dword_0, v73, v74, "%s Persisting updated candidates to the suggestion store", v75, 0xCu);
    swift_arrayDestroy(v76, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v76, -1LL, -1LL);
    swift_slowDealloc(v75, -1LL, -1LL);
  }

  uint64_t v79 = v88;
  dispatch thunk of MediaSuggestionStoreCandidateAdapter.persist()();
  swift_release(v85);
  swift_release(v87);
  uint64_t result = swift_release(v79);
  uint64_t *v86 = v62;
  return result;
}

uint64_t sub_B55C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_B588()
{
  return 0LL;
}

uint64_t sub_B590(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_B5A8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_38FD8);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_38FD8);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

void *sub_B638(uint64_t a1)
{
  return sub_B654( a1,  (uint64_t (*)(uint64_t))&type metadata accessor for UsoEntity_common_Person,  &qword_39028,  (uint64_t)&protocol conformance descriptor for UsoEntity_common_Person);
}

void *sub_B654(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  uint64_t v7 = a1;
  if ((a1 & 0xC000000000000001LL) == 0)
  {
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
    return _swiftEmptyArrayStorage;
  }

  if (a1 >= 0) {
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  uint64_t v8 = __CocoaSet.count.getter(a1);
  if (!v8) {
    return _swiftEmptyArrayStorage;
  }
LABEL_5:
  if (v8 <= 0)
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v9 = sub_4CC0(&qword_39018);
    uint64_t v10 = (void *)swift_allocObject(v9, 8 * v8 + 32, 7LL);
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = (2 * (v12 >> 3)) | 1;
  }

  swift_bridgeObjectRetain(v7);
  uint64_t v13 = sub_B774(&v15, v10 + 4, v8, v7, a2, a3, a4);
  uint64_t result = (void *)sub_BA64(v15);
  __break(1u);
  return result;
}

uint64_t *sub_B774( uint64_t *result, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t v7 = a4;
  uint64_t v9 = a2;
  uint64_t v37 = result;
  if ((a4 & 0xC000000000000001LL) != 0)
  {
    if (a4 < 0) {
      uint64_t v13 = a4;
    }
    else {
      uint64_t v13 = a4 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v14 = __CocoaSet.makeIterator()(v13);
    uint64_t v15 = a5(0LL);
    uint64_t v16 = sub_8518(a6, a5, a7);
    uint64_t result = Set.Iterator.init(_cocoa:)(v42, v14, v15, v16);
    uint64_t v7 = v42[0];
    uint64_t v17 = v42[1];
    uint64_t v18 = v42[2];
    int64_t v19 = v42[3];
    unint64_t v20 = v42[4];
    if (v9) {
      goto LABEL_6;
    }
LABEL_39:
    uint64_t v21 = 0LL;
    goto LABEL_41;
  }

  int64_t v19 = 0LL;
  uint64_t v32 = -1LL << *(_BYTE *)(a4 + 32);
  uint64_t v17 = a4 + 56;
  uint64_t v18 = ~v32;
  uint64_t v33 = -v32;
  if (v33 < 64) {
    uint64_t v34 = ~(-1LL << v33);
  }
  else {
    uint64_t v34 = -1LL;
  }
  unint64_t v20 = v34 & *(void *)(a4 + 56);
  if (!a2) {
    goto LABEL_39;
  }
LABEL_6:
  if (!a3)
  {
    uint64_t v21 = 0LL;
LABEL_41:
    uint64_t v35 = v37;
LABEL_44:
    *uint64_t v35 = v7;
    v35[1] = v17;
    v35[2] = v18;
    v35[3] = v19;
    v35[4] = v20;
    return (uint64_t *)v21;
  }

  if (a3 < 0) {
    goto LABEL_51;
  }
  uint64_t v21 = 0LL;
  int64_t v38 = (unint64_t)(v18 + 64) >> 6;
  uint64_t v36 = v18;
  while (1)
  {
    if (v7 < 0)
    {
      uint64_t v28 = __CocoaSet.Iterator.next()(result);
      if (!v28) {
        goto LABEL_43;
      }
      uint64_t v29 = v28;
      uint64_t v40 = v28;
      uint64_t v30 = a5(0LL);
      swift_unknownObjectRetain(v29);
      swift_dynamicCast(&v41, &v40, (char *)&type metadata for Swift.AnyObject + 8, v30, 7LL);
      uint64_t v24 = v41;
      uint64_t result = (uint64_t *)swift_unknownObjectRelease(v29);
      if (!v24) {
        goto LABEL_43;
      }
      goto LABEL_11;
    }

    if (v20)
    {
      unint64_t v22 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      unint64_t v23 = v22 | (v19 << 6);
      goto LABEL_10;
    }

    int64_t v25 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v25 >= v38)
    {
      unint64_t v20 = 0LL;
      goto LABEL_43;
    }

    unint64_t v26 = *(void *)(v17 + 8 * v25);
    if (v26) {
      goto LABEL_26;
    }
    int64_t v27 = v19 + 2;
    if (v19 + 2 >= v38)
    {
      unint64_t v20 = 0LL;
      ++v19;
      goto LABEL_43;
    }

    unint64_t v26 = *(void *)(v17 + 8 * v27);
    if (!v26)
    {
      if (v19 + 3 >= v38) {
        goto LABEL_47;
      }
      unint64_t v26 = *(void *)(v17 + 8 * (v19 + 3));
      if (v26)
      {
        int64_t v25 = v19 + 3;
        goto LABEL_26;
      }

      int64_t v27 = v19 + 4;
      if (v19 + 4 >= v38)
      {
        unint64_t v20 = 0LL;
        v19 += 3LL;
        goto LABEL_43;
      }

      unint64_t v26 = *(void *)(v17 + 8 * v27);
      if (!v26)
      {
        int64_t v25 = v19 + 5;
        if (v19 + 5 >= v38)
        {
LABEL_47:
          unint64_t v20 = 0LL;
          int64_t v19 = v27;
          goto LABEL_43;
        }

        unint64_t v26 = *(void *)(v17 + 8 * v25);
        if (!v26)
        {
          int64_t v31 = v19 + 6;
          while (v38 != v31)
          {
            unint64_t v26 = *(void *)(v17 + 8 * v31++);
            if (v26)
            {
              int64_t v25 = v31 - 1;
              goto LABEL_26;
            }
          }

          unint64_t v20 = 0LL;
          int64_t v19 = v38 - 1;
          goto LABEL_43;
        }

        goto LABEL_26;
      }
    }

    int64_t v25 = v27;
LABEL_26:
    unint64_t v20 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v19 = v25;
LABEL_10:
    uint64_t v24 = *(void *)(*(void *)(v7 + 48) + 8 * v23);
    uint64_t result = (uint64_t *)swift_retain(v24);
    if (!v24) {
      goto LABEL_43;
    }
LABEL_11:
    ++v21;
    *v9++ = v24;
    if (v21 == a3)
    {
      uint64_t v21 = a3;
LABEL_43:
      uint64_t v18 = v36;
      uint64_t v35 = v37;
      goto LABEL_44;
    }
  }

  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_BA64(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_BA70(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 72LL, 7LL);
  sub_BAAC(a1);
  return v3;
}

uint64_t *sub_BAAC(void *a1)
{
  uint64_t v3 = *v1;
  sub_8120((uint64_t)a1, (uint64_t)v8);
  sub_8120((uint64_t)v8, (uint64_t)(v1 + 4));
  uint64_t v4 = static InferenceLogUtils.loggerTag<A>(_:)(v3, v3);
  uint64_t v6 = v5;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v8);
  v1[2] = v4;
  v1[3] = v6;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  return v1;
}

uint64_t sub_BB1C()
{
  uint64_t v0 = sub_4CC0(&qword_39140);
  uint64_t v1 = swift_allocObject(v0, 272LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EDD0;
  uint64_t v2 = type metadata accessor for ASRFeatureExtractor(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = ASRFeatureExtractor.init()();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = &protocol witness table for ASRFeatureExtractor;
  *(void *)(v1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v3;
  uint64_t v4 = type metadata accessor for USOTaskSummaryFeatureExtractor(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t v5 = USOTaskSummaryFeatureExtractor.init()();
  *(void *)(v1 + 96) = v4;
  *(void *)(v1 + 104) = sub_8518( &qword_39148,  (uint64_t (*)(uint64_t))&type metadata accessor for USOTaskSummaryFeatureExtractor,  (uint64_t)&protocol conformance descriptor for USOTaskSummaryFeatureExtractor);
  *(void *)(v1 + 7_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v5;
  uint64_t v6 = type metadata accessor for DismissalFeatureExtractor(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = DismissalFeatureExtractor.init()();
  *(void *)(v1 + 136) = v6;
  *(void *)(v1 + 144) = &protocol witness table for DismissalFeatureExtractor;
  *(void *)(v1 + 11_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v7;
  uint64_t v8 = type metadata accessor for UEIFeatureExtractor(0LL);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  uint64_t v9 = UEIFeatureExtractor.init()();
  *(void *)(v1 + 176) = v8;
  *(void *)(v1 + 184) = &protocol witness table for UEIFeatureExtractor;
  *(void *)(v1 + 15_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v9;
  uint64_t v10 = type metadata accessor for FlowClientEventFeatureExtractor(0LL);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  uint64_t v11 = FlowClientEventFeatureExtractor.init()();
  *(void *)(v1 + 216) = v10;
  *(void *)(v1 + 224) = &protocol witness table for FlowClientEventFeatureExtractor;
  *(void *)(v1 + 19_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v11;
  uint64_t v12 = type metadata accessor for RequestIdFeatureExtractor(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  uint64_t v13 = RequestIdFeatureExtractor.init()();
  *(void *)(v1 + 256) = v12;
  *(void *)(v1 + 264) = &protocol witness table for RequestIdFeatureExtractor;
  *(void *)(v1 + 23_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v13;
  return v1;
}

uint64_t sub_BCA8()
{
  uint64_t v0 = sub_4CC0(&qword_39130);
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EC70;
  uint64_t v2 = type metadata accessor for CommonInteractionFeatureExtractor(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = CommonInteractionFeatureExtractor.init()();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = sub_8518( &qword_39138,  (uint64_t (*)(uint64_t))&type metadata accessor for CommonInteractionFeatureExtractor,  (uint64_t)&protocol conformance descriptor for CommonInteractionFeatureExtractor);
  *(void *)(v1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v3;
  return v1;
}

uint64_t sub_BD44()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t type metadata accessor for CommonInferenceDomain()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin21CommonInferenceDomain);
}

void *SiriPrivateLearningInferenceConstants.streamBookmarkName.unsafeMutableAddressor()
{
  return &static SiriPrivateLearningInferenceConstants.streamBookmarkName;
}

unint64_t static SiriPrivateLearningInferenceConstants.streamBookmarkName.getter()
{
  return 0xD000000000000027LL;
}

void *SiriPrivateLearningInferenceConstants.maximumTimeWindowForFollowupEvents.unsafeMutableAddressor()
{
  return &static SiriPrivateLearningInferenceConstants.maximumTimeWindowForFollowupEvents;
}

double static SiriPrivateLearningInferenceConstants.maximumTimeWindowForFollowupEvents.getter()
{
  return 120.0;
}

ValueMetadata *type metadata accessor for SiriPrivateLearningInferenceConstants()
{
  return &type metadata for SiriPrivateLearningInferenceConstants;
}

void sub_BDE0()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = type metadata accessor for MusicEntityGroundTruthGenerator();
  uint64_t v0 = sub_4CC0(&qword_39280);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_39150 = v5;
  *(void *)algn_39158 = v6;
}

char *sub_BE60()
{
  uint64_t v0 = type metadata accessor for MediaInAppFollowupGroundTruthGenerator(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::String v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v24 = xmmword_2EC60;
  int64_t v19 = v25;
  uint64_t v4 = type metadata accessor for QuickSongStopGroundTruthGenerator(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t v5 = QuickSongStopGroundTruthGenerator.init()();
  v25[3] = v4;
  v25[4] = sub_9C90( &qword_392B8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for QuickSongStopGroundTruthGenerator,  (uint64_t)&protocol conformance descriptor for QuickSongStopGroundTruthGenerator);
  v25[0] = v5;
  uint64_t v6 = type metadata accessor for SuccessfulPlayMediaDefinition(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = SuccessfulPlayMediaDefinition.init()();
  v23[0] = v7;
  uint64_t v8 = sub_9C90( &qword_392C0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for SuccessfulPlayMediaDefinition,  (uint64_t)&protocol conformance descriptor for SuccessfulPlayMediaDefinition);
  SuccessfulTaskDefinition.generator()(v26, v6, v8);
  uint64_t v9 = swift_release(v7);
  if (*(_BYTE *)(v18[1] + 32LL) == 1)
  {
    MediaInAppFollowupGroundTruthGenerator.init(timeToFollowup:)(v9, 60.0);
    *((void *)&v28 + 1) = v0;
    uint64_t v29 = sub_9C90( &qword_392D0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaInAppFollowupGroundTruthGenerator,  (uint64_t)&protocol conformance descriptor for MediaInAppFollowupGroundTruthGenerator);
    uint64_t v10 = sub_E5FC(&v27);
    (*(void (**)(void *, char *, uint64_t))(v1 + 32))(v10, v3, v0);
  }

  else
  {
    uint64_t v29 = 0LL;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
  }

  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 4LL; i != 19; i += 5LL)
  {
    sub_8418((uint64_t)&v23[i + 5], (uint64_t)v23, &qword_392C8);
    sub_4D00((uint64_t)v23, (uint64_t)&v20, &qword_392C8);
    if (v21)
    {
      sub_7D6C(&v20, (uint64_t)v22);
      sub_7D6C(v22, (uint64_t)&v20);
      if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
        uint64_t v11 = sub_264FC(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
      }
      unint64_t v14 = *((void *)v11 + 2);
      unint64_t v13 = *((void *)v11 + 3);
      if (v14 >= v13 >> 1) {
        uint64_t v11 = sub_264FC((char *)(v13 > 1), v14 + 1, 1, v11);
      }
      *((void *)v11 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v14 + 1;
      sub_7D6C(&v20, (uint64_t)&v11[40 * v14 + 32]);
    }

    else
    {
      sub_845C((uint64_t)&v20, &qword_392C8);
    }
  }

  uint64_t v15 = v24;
  uint64_t v16 = sub_4CC0(&qword_392C8);
  swift_arrayDestroy(v19, v15, v16);
  return v11;
}

uint64_t sub_C13C(uint64_t isUniquelyReferenced_nonNull_native)
{
  uint64_t v2 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = (char **)type metadata accessor for UUID(0LL);
  uint64_t v6 = (uint64_t)*(v5 - 1);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v87 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v87 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v87 - v16;
  Array<A>.getSessionId()(isUniquelyReferenced_nonNull_native);
  uint64_t v89 = v9;
  uint64_t v92 = v12;
  (*(void (**)(char *, char *, char **))(v6 + 32))(v17, v4, v5);
  if (qword_38BF0 != -1) {
    swift_once(&qword_38BF0, sub_D80C);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_7D04(v19, (uint64_t)qword_39160);
  uint64_t v90 = *(os_log_s **)(v6 + 16);
  unint64_t v91 = v17;
  uint64_t v21 = ((uint64_t (*)(char *, char *, char **))v90)(v15, v17, v5);
  unint64_t v22 = (char *)v5;
  unint64_t v23 = (os_log_s *)Logger.logObject.getter(v21);
  LOBYTE(v5) = static os_log_type_t.debug.getter();
  BOOL v24 = os_log_type_enabled(v23, (os_log_type_t)v5);
  uint64_t v93 = v22;
  uint64_t v94 = v20;
  if (!v24)
  {
    uint64_t v88 = *(void (**)(char *, char *))(v6 + 8);
    v88(v15, v22);

    goto LABEL_9;
  }

  uint64_t v17 = (char *)swift_slowAlloc(22LL, -1LL);
  uint64_t v25 = swift_slowAlloc(64LL, -1LL);
  v97[0] = v25;
  *(_DWORD *)uint64_t v17 = 136315394;
  unint64_t v26 = v17 + 4;
  if (qword_38BE8 != -1) {
    goto LABEL_44;
  }
  while (1)
  {
    uint64_t v27 = qword_39150;
    unint64_t v28 = *(void *)algn_39158;
    swift_bridgeObjectRetain(*(void *)algn_39158);
    uint64_t v96 = sub_28A50(v27, v28, v97);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v26, v17 + 12);
    uint64_t v29 = swift_bridgeObjectRelease(v28);
    *((_WORD *)v17 + 6) = 2080;
    uint64_t v30 = UUID.uuidString.getter(v29);
    unint64_t v32 = v31;
    uint64_t v96 = sub_28A50(v30, v31, v97);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v17 + 14, v17 + 22);
    swift_bridgeObjectRelease(v32);
    uint64_t v88 = *(void (**)(char *, char *))(v6 + 8);
    v88(v15, v93);
    _os_log_impl(&dword_0, v23, (os_log_type_t)v5, "%s Reviewing session with id=%s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);

LABEL_9:
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v37 = swift_slowAlloc(32LL, -1LL);
      v97[0] = v37;
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v17 = (char *)(v36 + 4);
      if (qword_38BE8 != -1) {
        swift_once(&qword_38BE8, sub_BDE0);
      }
      uint64_t v38 = qword_39150;
      unint64_t v39 = *(void *)algn_39158;
      swift_bridgeObjectRetain(*(void *)algn_39158);
      uint64_t v96 = sub_28A50(v38, v39, v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v36 + 4, v36 + 12);
      swift_bridgeObjectRelease(v39);
      _os_log_impl(&dword_0, v34, v35, "%s Running classifiers on session features", v36, 0xCu);
      swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1LL, -1LL);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v40 = sub_D8D8();
    uint64_t v41 = v40;
    v97[0] = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v42 = *((void *)v40 + 2);
    if (v42)
    {
      uint64_t v43 = v40 + 32;
      do
      {
        uint64_t v44 = v43[3];
        uint64_t v17 = (char *)v43[4];
        sub_8164(v43, v44);
        uint64_t v45 = dispatch thunk of SessionClassifier.classify(_:classifications:)( isUniquelyReferenced_nonNull_native,  v97[0],  v44,  v17);
        sub_27170(v45);
        v43 += 5;
        --v42;
      }

      while (v42);
      swift_bridgeObjectRelease(v41);
      uint64_t v46 = (void *)v97[0];
    }

    else
    {
      swift_bridgeObjectRelease(v40);
      uint64_t v46 = _swiftEmptyArrayStorage;
    }

    swift_bridgeObjectRetain(v46);
    unint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
    os_log_type_t v49 = static os_log_type_t.debug.getter();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v6 = v95;
    if (v50)
    {
      uint64_t v51 = swift_slowAlloc(22LL, -1LL);
      uint64_t v52 = swift_slowAlloc(32LL, -1LL);
      v97[0] = v52;
      *(_DWORD *)uint64_t v51 = 136315394;
      uint64_t v17 = (char *)(v51 + 4);
      if (qword_38BE8 != -1) {
        swift_once(&qword_38BE8, sub_BDE0);
      }
      uint64_t v53 = qword_39150;
      unint64_t v54 = *(void *)algn_39158;
      swift_bridgeObjectRetain(*(void *)algn_39158);
      uint64_t v96 = sub_28A50(v53, v54, v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v51 + 4, v51 + 12);
      swift_bridgeObjectRelease(v54);
      *(_WORD *)(v51 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
      uint64_t v96 = v46[2];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v51 + 14, v51 + 22);
      swift_bridgeObjectRelease(v46);
      _os_log_impl(&dword_0, v48, v49, "%s Made %ld Classifications:", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy(v52, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1LL, -1LL);
      swift_slowDealloc(v51, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease(v46);
    }

    sub_10C9C(8224LL, 0xE200000000000000LL, (uint64_t)v46);
    uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
    os_log_type_t v57 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v59 = swift_slowAlloc(32LL, -1LL);
      v97[0] = v59;
      *(_DWORD *)uint64_t v58 = 136315138;
      uint64_t v17 = (char *)(v58 + 4);
      if (qword_38BE8 != -1) {
        swift_once(&qword_38BE8, sub_BDE0);
      }
      uint64_t v60 = qword_39150;
      unint64_t v61 = *(void *)algn_39158;
      swift_bridgeObjectRetain(*(void *)algn_39158);
      uint64_t v96 = sub_28A50(v60, v61, v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v58 + 4, v58 + 12);
      swift_bridgeObjectRelease(v61);
      _os_log_impl(&dword_0, v56, v57, "%s Running ground truth generators with classification results.", v58, 0xCu);
      swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1LL, -1LL);
      swift_slowDealloc(v58, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v62 = sub_BE60();
    swift_bridgeObjectRetain(v46);
    swift_bridgeObjectRetain(isUniquelyReferenced_nonNull_native);
    uint64_t v63 = sub_DB80((uint64_t)v62, isUniquelyReferenced_nonNull_native, (uint64_t)v46);
    swift_bridgeObjectRelease(v62);
    swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(v46);
    sub_DDB4((uint64_t)v63);
    uint64_t v65 = v64;
    uint64_t v66 = swift_bridgeObjectRelease(v63);
    uint64_t v67 = (os_log_s *)Logger.logObject.getter(v66);
    os_log_type_t v68 = static os_log_type_t.debug.getter();
    BOOL v69 = os_log_type_enabled(v67, v68);
    uint64_t v94 = v65;
    if (v69)
    {
      Swift::String v70 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v17 = (char *)swift_slowAlloc(32LL, -1LL);
      v97[0] = (uint64_t)v17;
      *(_DWORD *)Swift::String v70 = 136315138;
      if (qword_38BE8 != -1) {
        swift_once(&qword_38BE8, sub_BDE0);
      }
      uint64_t v72 = qword_39150;
      unint64_t v71 = *(void *)algn_39158;
      swift_bridgeObjectRetain(*(void *)algn_39158);
      uint64_t v96 = sub_28A50(v72, v71, v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, v97, v70 + 4, v70 + 12);
      swift_bridgeObjectRelease(v71);
      _os_log_impl(&dword_0, v67, v68, "%s Generated Media Ground Truth:", v70, 0xCu);
      swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v70, -1LL, -1LL);

      uint64_t v65 = v94;
    }

    else
    {
    }

    sub_10C90(8224LL, 0xE200000000000000LL, v65);
    sub_D550(isUniquelyReferenced_nonNull_native, (uint64_t)v46);
    swift_bridgeObjectRelease(v46);
    os_log_type_t v74 = v91;
    uint64_t v73 = (uint64_t)v92;
    uint64_t v15 = v93;
    unint64_t v23 = v90;
    ((void (*)(char *, char *, char *))v90)(v92, v91, v93);
    uint64_t v5 = (char **)(v6 + 24);
    swift_beginAccess(v6 + 24, v97, 33LL, 0LL);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v6 + 24));
    uint64_t v96 = *(void *)(v6 + 24);
    unint64_t v26 = (char *)v96;
    *(void *)(v6 + 24) = 0x8000000000000000LL;
    uint64_t v25 = sub_290F8(v73);
    uint64_t v76 = *((void *)v26 + 2);
    BOOL v77 = (v75 & 1) == 0;
    uint64_t v78 = v76 + v77;
    if (!__OFADD__(v76, v77)) {
      break;
    }
    __break(1u);
LABEL_44:
    swift_once(&qword_38BE8, sub_BDE0);
  }

  char v79 = v75;
  if (*((void *)v26 + 3) >= v78)
  {
    uint64_t v82 = (uint64_t)v89;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_29FBC();
      unint64_t v26 = (char *)v96;
    }
  }

  else
  {
    sub_29348(v78, isUniquelyReferenced_nonNull_native);
    unint64_t v26 = (char *)v96;
    unint64_t v80 = sub_290F8(v73);
    uint64_t v82 = (uint64_t)v89;
    if ((v79 & 1) != (v81 & 1))
    {
      uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v15);
      __break(1u);
      return result;
    }

    uint64_t v25 = v80;
  }

  __int128 v83 = (void (*)(uint64_t, char *))v88;
  uint64_t v84 = *v5;
  *uint64_t v5 = v26;
  swift_bridgeObjectRelease(v84);
  uint64_t v85 = *v5;
  __n128 v86 = swift_bridgeObjectRetain(*v5);
  if ((v79 & 1) == 0)
  {
    ((void (*)(uint64_t, uint64_t, char *, __n128))v23)(v82, v73, v15, v86);
    sub_29E78(v25, v82, (uint64_t)_swiftEmptyArrayStorage, v85);
  }

  swift_bridgeObjectRelease(v85);
  sub_27134(v94);
  v83(v73, v15);
  swift_endAccess(v97);
  return ((uint64_t (*)(char *, char *))v83)(v74, v15);
}

void *sub_CC28()
{
  unint64_t v1 = v0;
  uint64_t v63 = sub_4CC0(&qword_38F78);
  uint64_t v2 = __chkstk_darwin(v63);
  uint64_t v62 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v61 = (char *)&v49 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v60 = (uint64_t)&v49 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v59 = (char *)&v49 - v9;
  __chkstk_darwin(v8);
  uint64_t v58 = (char *)&v49 - v10;
  uint64_t v11 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v56 = *(void *)(v11 - 8);
  uint64_t v57 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_38BF8 != -1) {
    goto LABEL_32;
  }
  while (1)
  {
    dispatch thunk of CoreAnalyticsLogHelper.logMediaGroundTruthGenerationTrigger()();
    swift_beginAccess(v1 + 24, v67, 0LL, 0LL);
    uint64_t v14 = *(void *)(v1 + 24);
    int64_t v15 = *(void *)(v14 + 16);
    uint64_t v16 = _swiftEmptyArrayStorage;
    if (!v15) {
      return v16;
    }
    uint64_t v66 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v14);
    sub_2A71C(0, v15, 0);
    uint64_t v18 = sub_2B18C(v14);
    uint64_t v19 = 0LL;
    uint64_t v20 = v14 + 64;
    char v21 = *(_BYTE *)(v14 + 32);
    uint64_t v50 = v14 + 80;
    int64_t v51 = v15;
    uint64_t v54 = v14;
    uint64_t v55 = v13;
    uint64_t v52 = v17;
    uint64_t v53 = v14 + 64;
    while ((v18 & 0x8000000000000000LL) == 0 && v18 < 1LL << v21)
    {
      unint64_t v24 = (unint64_t)v18 >> 6;
      if (*(_DWORD *)(v14 + 36) != (_DWORD)v17) {
        goto LABEL_28;
      }
      uint64_t v64 = v19;
      uint64_t v65 = 1LL << v18;
      uint64_t v25 = v63;
      uint64_t v26 = *(int *)(v63 + 48);
      uint64_t v27 = *(void *)(v14 + 48);
      uint64_t v28 = type metadata accessor for UUID(0LL);
      uint64_t v29 = *(void *)(v28 - 8);
      uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
      uint64_t v31 = (uint64_t)v58;
      v30(v58, v27 + *(void *)(v29 + 72) * v18, v28);
      uint64_t v32 = *(void *)(*(void *)(v14 + 56) + 8 * v18);
      *(void *)(v31 + v26) = v32;
      uint64_t v33 = v59;
      v30(v59, v31, v28);
      *(void *)&v33[*(int *)(v25 + 48)] = v32;
      uint64_t v34 = (uint64_t)v33;
      uint64_t v35 = v60;
      sub_4D00(v34, v60, &qword_38F78);
      swift_bridgeObjectRetain_n(v32, 2LL);
      sub_845C(v31, &qword_38F78);
      uint64_t v36 = *(int *)(v25 + 48);
      uint64_t v37 = v61;
      v30(v61, v35, v28);
      uint64_t v38 = *(void *)(v35 + v36);
      *(void *)&v37[v36] = v38;
      uint64_t v39 = *(int *)(v25 + 48);
      uint64_t v40 = v62;
      v30(v62, v35, v28);
      uint64_t v13 = v55;
      *(void *)&v40[v39] = v38;
      swift_bridgeObjectRetain(v38);
      SessionGroundTruths.init(sessionId:groundTruth:)(v37, v38);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v40, v28);
      sub_845C(v35, &qword_38F78);
      uint64_t v16 = v66;
      if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) == 0)
      {
        sub_2A71C(0, v16[2] + 1LL, 1);
        uint64_t v16 = v66;
      }

      unint64_t v42 = v16[2];
      unint64_t v41 = v16[3];
      unint64_t v1 = v42 + 1;
      uint64_t v14 = v54;
      if (v42 >= v41 >> 1)
      {
        sub_2A71C(v41 > 1, v42 + 1, 1);
        uint64_t v16 = v66;
      }

      void v16[2] = v1;
      (*(void (**)(unint64_t, char *, uint64_t))(v56 + 32))( (unint64_t)v16 + ((*(unsigned __int8 *)(v56 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))
      + *(void *)(v56 + 72) * v42,
        v13,
        v57);
      uint64_t v66 = v16;
      char v21 = *(_BYTE *)(v14 + 32);
      unint64_t v22 = 1LL << v21;
      if (v18 >= 1LL << v21) {
        goto LABEL_29;
      }
      uint64_t v20 = v53;
      uint64_t v43 = *(void *)(v53 + 8 * v24);
      if ((v43 & v65) == 0) {
        goto LABEL_30;
      }
      LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = v52;
      if (*(_DWORD *)(v14 + 36) != (_DWORD)v52) {
        goto LABEL_31;
      }
      unint64_t v44 = v43 & (-2LL << (v18 & 0x3F));
      if (v44)
      {
        unint64_t v22 = __clz(__rbit64(v44)) | v18 & 0xFFFFFFFFFFFFFFC0LL;
        int64_t v23 = v51;
      }

      else
      {
        unint64_t v45 = v24 + 1;
        unint64_t v46 = (v22 + 63) >> 6;
        int64_t v23 = v51;
        if (v24 + 1 < v46)
        {
          unint64_t v47 = *(void *)(v53 + 8 * v45);
          if (v47)
          {
LABEL_23:
            unint64_t v22 = __clz(__rbit64(v47)) + (v45 << 6);
          }

          else
          {
            while (v46 - 2 != v24)
            {
              unint64_t v47 = *(void *)(v50 + 8 * v24++);
              if (v47)
              {
                unint64_t v45 = v24 + 1;
                goto LABEL_23;
              }
            }
          }
        }
      }

      uint64_t v19 = v64 + 1;
      uint64_t v18 = v22;
      if (v64 + 1 == v23)
      {
        swift_bridgeObjectRelease(v14);
        return v16;
      }
    }

    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    swift_once(&qword_38BF8, sub_D89C);
  }

uint64_t sub_D0C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = (void *)a2;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  __chkstk_darwin(v3);
  uint64_t v53 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MediaFeedbackGroundTruthSource(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = sub_4CC0(&qword_392A0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for MediaFeedbackGroundTruth(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_8120(a1, (uint64_t)v58);
  uint64_t v19 = sub_4CC0(&qword_38FB0);
  char v20 = swift_dynamicCast(v14, v58, v19, v15, 6LL);
  char v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  if ((v20 & 1) == 0)
  {
    v21(v14, 1LL, 1LL, v15);
    sub_845C((uint64_t)v14, &qword_392A0);
    return sub_8120(a1, (uint64_t)v56);
  }

  v21(v14, 0LL, 1LL, v15);
  uint64_t v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
  MediaFeedbackGroundTruth.source.getter(v22);
  uint64_t v52 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  v52(v9, enum case for MediaFeedbackGroundTruthSource.successfulPlay(_:), v5);
  char v23 = static MediaFeedbackGroundTruthSource.== infix(_:_:)(v11, v9);
  unint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24(v9, v5);
  v24(v11, v5);
  if ((v23 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    return sub_8120(a1, (uint64_t)v56);
  }

  if (qword_38BF0 != -1) {
    swift_once(&qword_38BF0, sub_D80C);
  }
  uint64_t v25 = type metadata accessor for Logger(0LL);
  sub_7D04(v25, (uint64_t)qword_39160);
  uint64_t v26 = sub_8120(a1, (uint64_t)v58);
  uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  int v29 = v28;
  if (os_log_type_enabled(v27, v28))
  {
    os_log_t v50 = v27;
    uint64_t v30 = swift_slowAlloc(12LL, -1LL);
    int v48 = v29;
    uint64_t v31 = (uint8_t *)v30;
    uint64_t v49 = swift_slowAlloc(32LL, -1LL);
    uint64_t v61 = v49;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v32 = v31 + 12;
    unint64_t v46 = v31 + 4;
    unint64_t v47 = v31;
    uint64_t v33 = v59;
    uint64_t v45 = v60;
    sub_8164(v58, v59);
    int64_t v51 = v24;
    uint64_t v34 = v53;
    uint64_t v35 = dispatch thunk of TypedGroundTruth.id.getter(v33, v45);
    uint64_t v36 = UUID.uuidString.getter(v35);
    unint64_t v38 = v37;
    uint64_t v39 = v34;
    unint64_t v24 = v51;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v55);
    uint64_t v57 = sub_28A50(v36, v38, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, v46, v32);
    swift_bridgeObjectRelease(v38);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v58);
    uint64_t v27 = v50;
    uint64_t v40 = v47;
    _os_log_impl( &dword_0,  v50,  (os_log_type_t)v48,  "Updating 'successfulPlay' ground truth id=%s to extendedPlayWithInAppFollowup due to a detected in app followup",  v47,  0xCu);
    uint64_t v41 = v49;
    swift_arrayDestroy(v49, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1LL, -1LL);
    swift_slowDealloc(v40, -1LL, -1LL);
  }

  else
  {
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v58);
  }

  v52(v11, enum case for MediaFeedbackGroundTruthSource.extendedPlayWithInAppFollowup(_:), v5);
  uint64_t v43 = v56;
  v56[3] = v15;
  v43[4] = sub_9C90( &qword_392A8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaFeedbackGroundTruth,  (uint64_t)&protocol conformance descriptor for MediaFeedbackGroundTruth);
  sub_E5FC(v43);
  MediaFeedbackGroundTruth.with(source:)(v11);
  v24(v11, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

void sub_D550(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_38BF0 != -1) {
    swift_once(&qword_38BF0, sub_D80C);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_7D04(v6, (uint64_t)qword_39160);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    if (qword_38BE8 != -1) {
      swift_once(&qword_38BE8, sub_BDE0);
    }
    uint64_t v12 = qword_39150;
    unint64_t v13 = *(void *)algn_39158;
    swift_bridgeObjectRetain(*(void *)algn_39158);
    uint64_t v18 = sub_28A50(v12, v13, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v13);
    _os_log_impl(&dword_0, v8, v9, "%s Logging inference results to SELF", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  uint64_t v14 = *(void *)(v3 + 16);
  if (v14)
  {
    uint64_t v15 = type metadata accessor for MediaSuggestionOutcomeExtractor(0LL);
    swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
    uint64_t v16 = swift_retain(v14);
    uint64_t v17 = MediaSuggestionOutcomeExtractor.init()(v16);
    dispatch thunk of MediaSuggestionOutcomeReportedOfflineEmitter.reviewSessionSuggestionOutcomes(session:classifications:outcomeExtractor:)( a1,  a2,  v17);
    swift_release(v14);
    swift_release(v17);
  }

uint64_t sub_D754()
{
  return swift_deallocClassInstance(v0, 33LL, 7LL);
}

uint64_t type metadata accessor for MusicEntityGroundTruthGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin31MusicEntityGroundTruthGenerator);
}

void *sub_D7A0()
{
  return sub_CC28();
}

uint64_t sub_D7C0(uint64_t a1)
{
  return sub_C13C(a1);
}

uint64_t sub_D7E0(uint64_t a1, uint64_t a2)
{
  return sub_9C90( &qword_39278,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for MusicEntityGroundTruthGenerator,  (uint64_t)"9h");
}

uint64_t sub_D80C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_39160);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_39160);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_D89C()
{
  uint64_t v0 = type metadata accessor for CoreAnalyticsLogHelper(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = CoreAnalyticsLogHelper.init()();
  qword_39178 = result;
  return result;
}

char *sub_D8D8()
{
  __int128 v22 = xmmword_2EC60;
  uint64_t v0 = type metadata accessor for MediaPlayClassifier(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  v23[3] = v0;
  v23[4] = &protocol witness table for MediaPlayClassifier;
  v23[0] = MediaPlayClassifier.init()();
  uint64_t v1 = type metadata accessor for MediaInAppFollowupClassifier(0LL);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v23[8] = v1;
  v23[9] = &protocol witness table for MediaInAppFollowupClassifier;
  v23[5] = MediaInAppFollowupClassifier.init()();
  uint64_t v2 = type metadata accessor for PartialRepetitionClassifier(0LL);
  uint64_t v3 = sub_4CC0(&qword_38F90);
  uint64_t inited = swift_initStackObject(v3, v20);
  *(_OWORD *)(inited + 16) = xmmword_2EC70;
  *(void *)(inited + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = static SiriKitTaskType.playMedia.getter();
  *(void *)(inited + 40) = v5;
  Swift::Int v6 = sub_2B218(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  uint64_t v7 = type metadata accessor for FullEntityUtteranceComparator(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = FullEntityUtteranceComparator.init(taskNamesOfInterest:restatementThreshold:allowsIdenticalUtterances:useTrimmedUtterance:)( v6,  1LL,  1LL,  0.7);
  v21[3] = v7;
  v21[4] = &protocol witness table for FullEntityUtteranceComparator;
  v21[0] = v8;
  uint64_t v9 = PartialRepetitionClassifier.__allocating_init(turnComparator:)(v21);
  v21[0] = v9;
  FeaturisedSessionClassifier.asSessionClassifier()(v2, &protocol witness table for PartialRepetitionClassifier);
  swift_release(v9);
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 4LL; i != 19; i += 5LL)
  {
    sub_8418((uint64_t)&v21[i + 5], (uint64_t)v21, &qword_392B0);
    sub_4D00((uint64_t)v21, (uint64_t)&v17, &qword_392B0);
    if (v18)
    {
      sub_7D6C(&v17, (uint64_t)v19);
      sub_7D6C(v19, (uint64_t)&v17);
      if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0) {
        uint64_t v10 = sub_264E8(0LL, *((void *)v10 + 2) + 1LL, 1, v10);
      }
      unint64_t v13 = *((void *)v10 + 2);
      unint64_t v12 = *((void *)v10 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v10 = sub_264E8((char *)(v12 > 1), v13 + 1, 1, v10);
      }
      *((void *)v10 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v13 + 1;
      sub_7D6C(&v17, (uint64_t)&v10[40 * v13 + 32]);
    }

    else
    {
      sub_845C((uint64_t)&v17, &qword_392B0);
    }
  }

  uint64_t v14 = v22;
  uint64_t v15 = sub_4CC0(&qword_392B0);
  swift_arrayDestroy(v23, v14, v15);
  return v10;
}

char *sub_DB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v5 = (void *)(a1 + 32);
  swift_bridgeObjectRetain(a1);
  Swift::Int v6 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v7 = v5[3];
    uint64_t v8 = v5[4];
    sub_8164(v5, v7);
    uint64_t v9 = dispatch thunk of GroundTruthInference.generate(session:classifications:)(a2, a3, v7, v8);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v8,  v7,  &protocol requirements base descriptor for GroundTruthInference,  &associated type descriptor for GroundTruthInference.T);
    uint64_t v11 = sub_4CC0(&qword_38FB0);
    uint64_t v12 = _arrayForceCast<A, B>(_:)(v9, AssociatedTypeWitness, v11);
    swift_bridgeObjectRelease(v9);
    uint64_t v13 = *(void *)(v12 + 16);
    int64_t v14 = *((void *)v6 + 2);
    int64_t v15 = v14 + v13;
    if (__OFADD__(v14, v13)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v6);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v15 <= *((void *)v6 + 3) >> 1)
    {
      if (*(void *)(v12 + 16)) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v14 <= v15) {
        int64_t v17 = v14 + v13;
      }
      else {
        int64_t v17 = v14;
      }
      Swift::Int v6 = sub_26054(isUniquelyReferenced_nonNull_native, v17, 1, v6);
      if (*(void *)(v12 + 16))
      {
LABEL_14:
        uint64_t v18 = *((void *)v6 + 2);
        if ((*((void *)v6 + 3) >> 1) - v18 < v13) {
          goto LABEL_28;
        }
        unint64_t v19 = (unint64_t)&v6[40 * v18 + 32];
        if (v12 + 32 < v19 + 40 * v13 && v19 < v12 + 32 + 40 * v13) {
          goto LABEL_30;
        }
        swift_arrayInitWithCopy(v19);
        if (v13)
        {
          uint64_t v21 = *((void *)v6 + 2);
          BOOL v22 = __OFADD__(v21, v13);
          uint64_t v23 = v21 + v13;
          if (v22) {
            goto LABEL_29;
          }
          *((void *)v6 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v23;
        }

        goto LABEL_4;
      }
    }

    if (v13) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease(v12);
    v5 += 5;
    if (!--v3)
    {
      swift_bridgeObjectRelease(a1);
      return v6;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a2);
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

void sub_DDB4(uint64_t a1)
{
  unint64_t v2 = 0LL;
  uint64_t v86 = type metadata accessor for MediaCorrectionGroundTruthSource(0LL);
  uint64_t v88 = *(void *)(v86 - 8);
  uint64_t v3 = __chkstk_darwin(v86);
  uint64_t v85 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v84 = (char *)&v73 - v5;
  uint64_t v6 = type metadata accessor for MediaGroundTruth(0LL);
  uint64_t v92 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v82 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v73 - v9;
  uint64_t v11 = sub_4CC0(&qword_39288);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v90 = (uint64_t)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v73 - v15;
  __chkstk_darwin(v14);
  unint64_t v91 = (char *)&v73 - v17;
  uint64_t v18 = sub_4CC0(&qword_39290);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v76 = (uint64_t)&v73 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v75 = (uint64_t)&v73 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v73 - v25;
  __chkstk_darwin(v24);
  uint64_t v89 = (char *)&v73 - v27;
  unint64_t v28 = *(void *)(a1 + 16);
  uint64_t v78 = a1 + 32;
  unsigned int v83 = enum case for MediaCorrectionGroundTruthSource.inAppFollowup(_:);
  unsigned int v79 = enum case for MediaCorrectionGroundTruthSource.inAppFollowupUnrelatedEntity(_:);
  uint64_t v74 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v73 = 0LL;
  char v81 = v16;
  uint64_t v80 = v19;
  unint64_t v87 = v28;
  uint64_t v93 = v18;
  BOOL v77 = v26;
  while (1)
  {
    while (1)
    {
      if (v2 == v28)
      {
        uint64_t v101 = 0LL;
        unint64_t v29 = v28;
        __int128 v99 = 0u;
        __int128 v100 = 0u;
        uint64_t v30 = v92;
      }

      else
      {
        uint64_t v30 = v92;
        if (v2 >= v28)
        {
          __break(1u);
LABEL_31:
          __break(1u);
          return;
        }

        sub_8120(v78 + 40 * v2, (uint64_t)&v99);
        unint64_t v29 = v2 + 1;
      }

      unint64_t v94 = v29;
      sub_4D00((uint64_t)&v99, (uint64_t)&v97, &qword_39298);
      if (v98)
      {
        sub_7D6C(&v97, (uint64_t)v96);
        sub_8120((uint64_t)v96, (uint64_t)v95);
        uint64_t v31 = sub_4CC0(&qword_38FB0);
        int v32 = swift_dynamicCast(v16, v95, v31, v6, 6LL);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v16, v32 ^ 1u, 1LL, v6);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v96);
        uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
        v33(v16, 0LL, 1LL, v18);
      }

      else
      {
        uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
        v33(v16, 1LL, 1LL, v18);
      }

      uint64_t v34 = v18;
      uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
      if (v35(v16, 1LL, v34) == 1)
      {
        sub_845C((uint64_t)v16, &qword_39288);
        uint64_t v36 = 1LL;
        goto LABEL_14;
      }

      uint64_t v37 = (uint64_t)v77;
      sub_4D00((uint64_t)v16, (uint64_t)v77, &qword_39290);
      sub_845C(v37, &qword_39290);
      uint64_t v18 = v93;
      unint64_t v2 = v94;
    }

    sub_4D00(v37, (uint64_t)v91, &qword_39290);
    uint64_t v36 = 0LL;
LABEL_14:
    uint64_t v38 = (uint64_t)v91;
    uint64_t v39 = v93;
    v33(v91, v36, 1LL, v93);
    uint64_t v40 = v90;
    sub_4D00(v38, v90, &qword_39288);
    if (v35((char *)v40, 1LL, v39) == 1)
    {
      uint64_t v41 = v89;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v89, 1LL, 1LL, v6);
      int v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48))(v41, 1LL, v6);
    }

    else
    {
      uint64_t v43 = v75;
      sub_4D00(v40, v75, &qword_39290);
      uint64_t v44 = v76;
      sub_8418(v43, v76, &qword_39290);
      uint64_t v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
      int v46 = v45(v44, 1LL, v6);
      uint64_t v41 = v89;
      if (v46 == 1) {
        goto LABEL_31;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v89, v44, v6);
      sub_845C(v43, &qword_39290);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v41, 0LL, 1LL, v6);
      int v42 = v45((uint64_t)v41, 1LL, v6);
    }

    if (v42 == 1)
    {
      uint64_t v61 = v74;
      swift_bridgeObjectRelease(v74);
      swift_bridgeObjectRetain(v61);
      return;
    }

    uint64_t v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v30 + 32))(v10, v41, v6);
    int v48 = v84;
    MediaGroundTruth.source.getter(v47);
    uint64_t v49 = v86;
    uint64_t v50 = v88;
    int64_t v51 = v85;
    uint64_t v52 = v82;
    uint64_t v53 = v10;
    uint64_t v54 = v30;
    uint64_t v55 = *(void (**)(char *, void, uint64_t))(v88 + 104);
    v55(v85, v83, v86);
    char v56 = static MediaCorrectionGroundTruthSource.== infix(_:_:)(v48, v51);
    uint64_t v57 = *(void (**)(char *, uint64_t))(v50 + 8);
    v57(v51, v49);
    v57(v48, v49);
    uint64_t v58 = (*(uint64_t (**)(char *, char *, uint64_t))(v54 + 16))(v52, v53, v6);
    if ((v56 & 1) != 0) {
      break;
    }
    MediaGroundTruth.source.getter(v58);
    v55(v51, v79, v49);
    char v59 = static MediaCorrectionGroundTruthSource.== infix(_:_:)(v48, v51);
    v57(v51, v49);
    v57(v48, v49);
    uint64_t v60 = *(void (**)(char *, uint64_t))(v54 + 8);
    v60(v52, v6);
    v60(v53, v6);
    uint64_t v10 = v53;
    unint64_t v28 = v87;
    uint64_t v16 = v81;
    uint64_t v18 = v93;
    uint64_t v19 = v80;
    unint64_t v2 = v94;
    if ((v59 & 1) != 0) {
      goto LABEL_24;
    }
  }

  uint64_t v62 = *(void (**)(char *, uint64_t))(v54 + 8);
  v62(v52, v6);
  v62(v53, v6);
  unint64_t v28 = v87;
LABEL_24:
  swift_bridgeObjectRelease(v74);
  if (v28)
  {
    *(void *)&__int128 v97 = _swiftEmptyArrayStorage;
    sub_2A6C4(0, v28, 0);
    uint64_t v63 = v97;
    uint64_t v64 = v78;
    do
    {
      sub_D0C8(v64, (uint64_t)&v99);
      *(void *)&__int128 v97 = v63;
      unint64_t v66 = *(void *)(v63 + 16);
      unint64_t v65 = *(void *)(v63 + 24);
      if (v66 >= v65 >> 1) {
        sub_2A6C4(v65 > 1, v66 + 1, 1);
      }
      uint64_t v67 = *((void *)&v100 + 1);
      uint64_t v68 = v101;
      uint64_t v69 = sub_E5D4((uint64_t)&v99, *((uint64_t *)&v100 + 1));
      __chkstk_darwin(v69);
      unint64_t v71 = (char *)&v73 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v72 + 16))(v71);
      sub_1FD44(v66, (uint64_t)v71, (uint64_t *)&v97, v67, v68);
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v99);
      uint64_t v63 = v97;
      v64 += 40LL;
      --v28;
    }

    while (v28);
  }

uint64_t sub_E5D4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

void *sub_E5FC(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_E638(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin();
  uint64_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if (qword_38C00 != -1) {
    uint64_t v9 = swift_once(&qword_38C00, sub_E898);
  }
  int v12 = byte_3A680;
  uint64_t v13 = (void *)OSSignposter.logHandle.getter(v9);
  os_signpost_type_t v14 = static os_signpost_type_t.begin.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if (v12 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a4, v7);
LABEL_24:
      uint64_t v21 = type metadata accessor for OSSignpostIntervalState(0LL);
      swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
      return OSSignpostIntervalState.init(id:isOpen:)(v11, 1LL);
    }

    if ((a3 & 1) != 0)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }

      if (a1 >> 11 == 27)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }

      a1 = v22;
    }

    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }

    uint64_t v16 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
    v16(v11, a4, v7);
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v17 = 0;
    os_signpost_id_t v18 = OSSignpostID.rawValue.getter();
    os_signpost_type_t v19 = v14;
    uint64_t v20 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_0, (os_log_t)v13, v19, v18, a1, v20, v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);

    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
    v16(v11, a4, v7);
    goto LABEL_24;
  }

LABEL_8:
  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }

    goto LABEL_22;
  }

  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v23;
LABEL_22:
      uint64_t v16 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
      v16(v11, a4, v7);
      uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v17 = 0;
      os_signpost_id_t v18 = OSSignpostID.rawValue.getter();
      os_signpost_type_t v19 = v14;
      uint64_t v20 = "enableTelemetry=YES";
      goto LABEL_23;
    }

    goto LABEL_28;
  }

LABEL_30:
  __break(1u);
  return result;
}

  __break(1u);
}

  __break(1u);
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

void sub_E898()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_3A680 = v2;
}

void sub_E924()
{
  qword_3A688 = 0x636E657265666E49LL;
  unk_3A690 = 0xEF6E6967756C5065LL;
}

uint64_t sub_E954()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_3A698);
  sub_7D04(v0, (uint64_t)qword_3A698);
  if (qword_38C08 != -1) {
    swift_once(&qword_38C08, sub_E924);
  }
  uint64_t v1 = qword_3A688;
  uint64_t v2 = unk_3A690;
  swift_bridgeObjectRetain(unk_3A690);
  return Logger.init(subsystem:category:)(0xD000000000000013LL, 0x80000000000302F0LL, v1, v2);
}

uint64_t sub_EA04()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_3A6B0);
  sub_7D04(v0, (uint64_t)qword_3A6B0);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x80000000000302F0LL,  0xD000000000000012LL,  0x8000000000030310LL);
}

uint64_t sub_EA84()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSSignposter(0LL);
  sub_81A0(v4, qword_3A6C8);
  sub_7D04(v4, (uint64_t)qword_3A6C8);
  if (qword_38C18 != -1) {
    swift_once(&qword_38C18, sub_EA04);
  }
  uint64_t v5 = sub_7D04(v0, (uint64_t)qword_3A6B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

uint64_t sub_EB6C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_392D8);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_392D8);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_EBFC(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 80LL, 7LL);
  sub_EC38(a1);
  return v3;
}

void *sub_EC38(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_8164(a1, v5);
  swift_retain(v1);
  dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v12, v5, v6);
  uint64_t v7 = type metadata accessor for ContactSuggestionOutcomeReportedOfflineEmitter(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  v1[9] = ContactSuggestionOutcomeReportedOfflineEmitter.init(logTarget:)(v12);
  swift_release(v1);
  sub_8120((uint64_t)a1, (uint64_t)v12);
  sub_8120((uint64_t)v12, (uint64_t)(v1 + 4));
  uint64_t v8 = static InferenceLogUtils.loggerTag<A>(_:)(v4, v4);
  uint64_t v10 = v9;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v12);
  v2[2] = v8;
  v2[3] = v10;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  return v2;
}

char *sub_ED0C()
{
  uint64_t v1 = v0;
  __int128 v19 = xmmword_2EC60;
  uint64_t v2 = type metadata accessor for PhoneCallFeatureExtractor(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = PhoneCallFeatureExtractor.init()();
  v20[3] = v2;
  v20[4] = sub_8518( &qword_39480,  (uint64_t (*)(uint64_t))&type metadata accessor for PhoneCallFeatureExtractor,  (uint64_t)&protocol conformance descriptor for PhoneCallFeatureExtractor);
  v20[0] = v3;
  uint64_t v4 = type metadata accessor for PlusClientEventFeatureExtractor(0LL);
  sub_8120(v1 + 32, (uint64_t)v18);
  uint64_t v5 = PlusClientEventFeatureExtractor.__allocating_init(_:)(v18);
  v20[8] = v4;
  v20[9] = sub_8518( &qword_39488,  (uint64_t (*)(uint64_t))&type metadata accessor for PlusClientEventFeatureExtractor,  (uint64_t)&protocol conformance descriptor for PlusClientEventFeatureExtractor);
  v20[5] = v5;
  uint64_t v6 = type metadata accessor for SendMessageFeatureExtractor(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = SendMessageFeatureExtractor.init()();
  v20[13] = v6;
  v20[14] = sub_8518( &qword_39490,  (uint64_t (*)(uint64_t))&type metadata accessor for SendMessageFeatureExtractor,  (uint64_t)&protocol conformance descriptor for SendMessageFeatureExtractor);
  v20[10] = v7;
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 32LL; i != 152; i += 40LL)
  {
    sub_8418((uint64_t)&v18[i + 40], (uint64_t)v18, &qword_39498);
    sub_4D00((uint64_t)v18, (uint64_t)&v15, &qword_39498);
    if (v16)
    {
      sub_7D6C(&v15, (uint64_t)v17);
      sub_7D6C(v17, (uint64_t)&v15);
      if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
        uint64_t v8 = sub_26510(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
      }
      unint64_t v11 = *((void *)v8 + 2);
      unint64_t v10 = *((void *)v8 + 3);
      if (v11 >= v10 >> 1) {
        uint64_t v8 = sub_26510((char *)(v10 > 1), v11 + 1, 1, v8);
      }
      *((void *)v8 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v11 + 1;
      sub_7D6C(&v15, (uint64_t)&v8[40 * v11 + 32]);
    }

    else
    {
      sub_845C((uint64_t)&v15, &qword_39498);
    }
  }

  uint64_t v12 = v19;
  uint64_t v13 = sub_4CC0(&qword_39498);
  swift_arrayDestroy(v20, v12, v13);
  return v8;
}

uint64_t sub_EF60()
{
  uint64_t v0 = sub_4CC0(&qword_39458);
  uint64_t v1 = swift_allocObject(v0, 96LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EF70;
  uint64_t v2 = type metadata accessor for PhoneCallGroundTruth(0LL);
  uint64_t v3 = sub_8518( &qword_39460,  (uint64_t (*)(uint64_t))&type metadata accessor for PhoneCallGroundTruth,  (uint64_t)&protocol conformance descriptor for PhoneCallGroundTruth);
  *(void *)(v1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v2;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = type metadata accessor for ContactPromptGroundTruth(0LL);
  uint64_t v5 = sub_8518( &qword_39468,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactPromptGroundTruth,  (uint64_t)&protocol conformance descriptor for ContactPromptGroundTruth);
  *(void *)(v1 + 48) = v4;
  *(void *)(v1 + 56) = v5;
  uint64_t v6 = type metadata accessor for MessagesGroundTruth(0LL);
  uint64_t v7 = sub_8518( &qword_39470,  (uint64_t (*)(uint64_t))&type metadata accessor for MessagesGroundTruth,  (uint64_t)&protocol conformance descriptor for MessagesGroundTruth);
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 7_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v7;
  uint64_t v8 = type metadata accessor for ContactSuggestionOutcomeGroundTruth(0LL);
  uint64_t v9 = sub_8518( &qword_39478,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionOutcomeGroundTruth,  (uint64_t)&protocol conformance descriptor for ContactSuggestionOutcomeGroundTruth);
  *(void *)(v1 + 80) = v8;
  *(void *)(v1 + 88) = v9;
  return v1;
}

char *sub_F054()
{
  __int128 v16 = xmmword_2EA90;
  uint64_t v0 = type metadata accessor for INStartCallIntentFeatureExtractor(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t v1 = INStartCallIntentFeatureExtractor.init()();
  v17[3] = v0;
  v17[4] = sub_8518( &qword_39440,  (uint64_t (*)(uint64_t))&type metadata accessor for INStartCallIntentFeatureExtractor,  (uint64_t)&protocol conformance descriptor for INStartCallIntentFeatureExtractor);
  v17[0] = v1;
  uint64_t v2 = type metadata accessor for INSendMessageIntentFeatureExtractor(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = INSendMessageIntentFeatureExtractor.init()();
  v18[3] = v2;
  v18[4] = sub_8518( &qword_39448,  (uint64_t (*)(uint64_t))&type metadata accessor for INSendMessageIntentFeatureExtractor,  (uint64_t)&protocol conformance descriptor for INSendMessageIntentFeatureExtractor);
  v18[0] = v3;
  sub_8418((uint64_t)v17, (uint64_t)v15, &qword_39450);
  sub_4D00((uint64_t)v15, (uint64_t)&v12, &qword_39450);
  if (v13)
  {
    sub_7D6C(&v12, (uint64_t)v14);
    sub_7D6C(v14, (uint64_t)&v12);
    uint64_t v4 = (char *)_swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
      uint64_t v4 = sub_26524(0LL, _swiftEmptyArrayStorage[2] + 1LL, 1, (char *)_swiftEmptyArrayStorage);
    }
    unint64_t v6 = *((void *)v4 + 2);
    unint64_t v5 = *((void *)v4 + 3);
    if (v6 >= v5 >> 1) {
      uint64_t v4 = sub_26524((char *)(v5 > 1), v6 + 1, 1, v4);
    }
    *((void *)v4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v6 + 1;
    sub_7D6C(&v12, (uint64_t)&v4[40 * v6 + 32]);
  }

  else
  {
    sub_845C((uint64_t)&v12, &qword_39450);
    uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  }

  sub_8418((uint64_t)v18, (uint64_t)v15, &qword_39450);
  sub_4D00((uint64_t)v15, (uint64_t)&v12, &qword_39450);
  if (v13)
  {
    sub_7D6C(&v12, (uint64_t)v14);
    sub_7D6C(v14, (uint64_t)&v12);
    if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0) {
      uint64_t v4 = sub_26524(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
    }
    unint64_t v8 = *((void *)v4 + 2);
    unint64_t v7 = *((void *)v4 + 3);
    if (v8 >= v7 >> 1) {
      uint64_t v4 = sub_26524((char *)(v7 > 1), v8 + 1, 1, v4);
    }
    *((void *)v4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v8 + 1;
    sub_7D6C(&v12, (uint64_t)&v4[40 * v8 + 32]);
  }

  else
  {
    sub_845C((uint64_t)&v12, &qword_39450);
  }

  uint64_t v9 = v16;
  uint64_t v10 = sub_4CC0(&qword_39450);
  swift_arrayDestroy(v17, v9, v10);
  return v4;
}

uint64_t sub_F310()
{
  uint64_t v0 = sub_4CC0(&qword_39018);
  uint64_t v1 = swift_allocObject(v0, 48LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EF80;
  uint64_t v2 = type metadata accessor for PhoneCallEventCoalescer(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  *(void *)(v1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = PhoneCallEventCoalescer.init()();
  uint64_t v3 = type metadata accessor for SendMessageEventCoalescer(0LL);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  uint64_t v4 = SendMessageEventCoalescer.init()();
  *(void *)(v1 + 40) = v4;
  specialized Array._endMutation()(v4);
  return v1;
}

char *sub_F3A8()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = v0 + 4;
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  sub_8164(v0 + 4, v3);
  dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v42, v3, v4);
  uint64_t v5 = type metadata accessor for PLUSOfflineLogHelpers(0LL);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  uint64_t v6 = PLUSOfflineLogHelpers.init(logTarget:)(v42);
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[8];
  sub_8164(v0 + 4, v7);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(v42, v7, v8);
  __int128 v39 = xmmword_2EF70;
  uint64_t v9 = v0[7];
  uint64_t v10 = v0[8];
  sub_8164(v0 + 4, v9);
  dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(&v35, v9, v10);
  uint64_t v11 = v0[9];
  uint64_t v12 = type metadata accessor for PhoneCallContactGroundTruthGenerator();
  uint64_t v13 = (void *)swift_allocObject(v12, 80LL, 7LL);
  swift_retain(v11);
  swift_retain(v6);
  os_signpost_type_t v14 = (char *)_swiftEmptyArrayStorage;
  v13[8] = sub_70B8((uint64_t)_swiftEmptyArrayStorage);
  sub_7D6C(&v35, (uint64_t)(v13 + 2));
  v13[7] = v11;
  uint64_t v31 = v6;
  v13[9] = v6;
  void v40[3] = v12;
  v40[4] = sub_8518( &qword_39420,  (uint64_t (*)(uint64_t))type metadata accessor for PhoneCallContactGroundTruthGenerator,  (uint64_t)&unk_2ED20);
  v40[0] = v13;
  uint64_t v15 = v43;
  uint64_t v16 = v44;
  sub_8164(v42, v43);
  uint64_t v17 = static InferenceFeatures.PartialRepetitionsInPhoneCall.getter();
  uint64_t v36 = type metadata accessor for AnyFeature(0LL);
  uint64_t v37 = &protocol witness table for AnyFeature;
  *(void *)&__int128 v35 = v17;
  LOBYTE(v1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = dispatch thunk of FeatureManaging.isActive(_:)(&v35, v15, v16);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v35);
  sub_24CD4(v12 & 1, 0xD00000000000002BLL, 0x8000000000030380LL, v1, (uint64_t)v41);
  uint64_t v18 = *(void *)(v1 + 56);
  uint64_t v19 = *(void *)(v1 + 64);
  sub_8164(v2, v18);
  dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(&v35, v18, v19);
  uint64_t v20 = type metadata accessor for MessagesContactGroundTruthGenerator();
  uint64_t v21 = swift_allocObject(v20, 72LL, 7LL);
  swift_retain(v11);
  *(void *)(v21 + 64) = sub_70B8((uint64_t)_swiftEmptyArrayStorage);
  sub_7D6C(&v35, v21 + 16);
  *(void *)(v21 + 56) = v11;
  v41[8] = v20;
  v41[9] = sub_8518( &qword_39428,  (uint64_t (*)(uint64_t))type metadata accessor for MessagesContactGroundTruthGenerator,  (uint64_t)&protocol conformance descriptor for MessagesContactGroundTruthGenerator);
  v41[5] = v21;
  uint64_t v22 = type metadata accessor for MessagesContactPartialRepetitionDefinition(0LL);
  swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
  uint64_t v23 = MessagesContactPartialRepetitionDefinition.init()();
  *(void *)&__int128 v35 = v23;
  uint64_t v24 = sub_8518( &qword_39430,  (uint64_t (*)(uint64_t))&type metadata accessor for MessagesContactPartialRepetitionDefinition,  (uint64_t)&protocol conformance descriptor for MessagesContactPartialRepetitionDefinition);
  PartialRepetitionDefinition.generator()(v22, v24);
  swift_release(v23);
  for (uint64_t i = 32LL; i != 192; i += 40LL)
  {
    sub_8418((uint64_t)&v38[i], (uint64_t)&v35, &qword_39438);
    sub_4D00((uint64_t)&v35, (uint64_t)&v32, &qword_39438);
    if (v33)
    {
      sub_7D6C(&v32, (uint64_t)v34);
      sub_7D6C(v34, (uint64_t)&v32);
      if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0) {
        os_signpost_type_t v14 = sub_26538(0LL, *((void *)v14 + 2) + 1LL, 1, v14);
      }
      unint64_t v27 = *((void *)v14 + 2);
      unint64_t v26 = *((void *)v14 + 3);
      if (v27 >= v26 >> 1) {
        os_signpost_type_t v14 = sub_26538((char *)(v26 > 1), v27 + 1, 1, v14);
      }
      *((void *)v14 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v27 + 1;
      sub_7D6C(&v32, (uint64_t)&v14[40 * v27 + 32]);
    }

    else
    {
      sub_845C((uint64_t)&v32, &qword_39438);
    }
  }

  swift_release(v31);
  uint64_t v28 = v39;
  uint64_t v29 = sub_4CC0(&qword_39438);
  swift_arrayDestroy(v40, v28, v29);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v42);
  return v14;
}

uint64_t sub_F7A8()
{
  return dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.flush()();
}

uint64_t sub_F7C8(void *a1)
{
  uint64_t v3 = v1[7];
  uint64_t v4 = v1[8];
  sub_8164(v1 + 4, v3);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(v14, v3, v4);
  uint64_t v5 = a1[3];
  sub_8164(a1, v5);
  LOBYTE(a1) = sub_F8CC(v5);
  sub_8120((uint64_t)v14, (uint64_t)v11);
  if ((a1 & 1) != 0)
  {
    uint64_t v6 = v12;
    uint64_t v7 = v13;
    sub_8164(v11, v12);
    uint64_t v8 = static InferenceFeatures.PartialRepetitionsInPhoneCall.getter();
    v10[3] = type metadata accessor for AnyFeature(0LL);
    v10[4] = &protocol witness table for AnyFeature;
    v10[0] = v8;
    LOBYTE(v6) = dispatch thunk of FeatureManaging.isActive(_:)(v10, v6, v7);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v14);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v10);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v11);
    if ((v6 & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v14);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v11);
  }

  return 1LL;
}

uint64_t sub_F8CC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PhoneCallGroundTruthSource(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v41 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = sub_4CC0(&qword_39400);
  uint64_t v7 = __chkstk_darwin(v43);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(a1 - 8);
  __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_4CC0(&qword_39408);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_4CC0(&qword_39410);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v42 = (uint64_t)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v40 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v40 - v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v2, a1);
  uint64_t v24 = type metadata accessor for PhoneCallGroundTruth(0LL);
  int v25 = swift_dynamicCast(v15, v12, a1, v24, 6LL);
  uint64_t v26 = *(void *)(v24 - 8);
  unint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  if (v25)
  {
    uint64_t v28 = v27(v15, 0LL, 1LL, v24);
    PhoneCallGroundTruth.source.getter(v28);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v24);
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v29(v23, 0LL, 1LL, v4);
  }

  else
  {
    v27(v15, 1LL, 1LL, v24);
    sub_845C((uint64_t)v15, &qword_39408);
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v29(v23, 1LL, 1LL, v4);
  }

  (*(void (**)(char *, void, uint64_t))(v5 + 104))( v21,  enum case for PhoneCallGroundTruthSource.restatementAndSuccessfulPhoneCall(_:),  v4);
  v29(v21, 0LL, 1LL, v4);
  uint64_t v30 = (uint64_t)&v9[*(int *)(v43 + 48)];
  uint64_t v31 = &qword_39410;
  sub_8418((uint64_t)v23, (uint64_t)v9, &qword_39410);
  sub_8418((uint64_t)v21, v30, &qword_39410);
  __int128 v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v32((uint64_t)v9, 1LL, v4) == 1)
  {
    sub_845C((uint64_t)v21, &qword_39410);
    sub_845C((uint64_t)v23, &qword_39410);
    if (v32(v30, 1LL, v4) == 1)
    {
      char v33 = -1;
    }

    else
    {
      uint64_t v31 = &qword_39400;
      char v33 = 0;
    }
  }

  else
  {
    uint64_t v34 = v42;
    sub_8418((uint64_t)v9, v42, &qword_39410);
    if (v32(v30, 1LL, v4) == 1)
    {
      sub_845C((uint64_t)v21, &qword_39410);
      sub_845C((uint64_t)v23, &qword_39410);
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v34, v4);
      char v33 = 0;
      uint64_t v31 = &qword_39400;
    }

    else
    {
      uint64_t v35 = v34;
      uint64_t v36 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v41, v30, v4);
      uint64_t v37 = sub_8518( &qword_39418,  (uint64_t (*)(uint64_t))&type metadata accessor for PhoneCallGroundTruthSource,  (uint64_t)&protocol conformance descriptor for PhoneCallGroundTruthSource);
      char v33 = dispatch thunk of static Equatable.== infix(_:_:)(v35, v36, v4, v37);
      uint64_t v38 = *(void (**)(char *, uint64_t))(v5 + 8);
      v38(v36, v4);
      uint64_t v31 = &qword_39410;
      sub_845C((uint64_t)v21, &qword_39410);
      sub_845C((uint64_t)v23, &qword_39410);
      v38((char *)v35, v4);
    }
  }

  sub_845C((uint64_t)v9, v31);
  return v33 & 1;
}

uint64_t sub_FCF0()
{
  uint64_t v0 = sub_4CC0(&qword_393F8);
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EC70;
  uint64_t PartyEventStreamProcessor = type metadata accessor for FirstPartyEventStreamProcessor(0LL);
  swift_allocObject( PartyEventStreamProcessor,  *(unsigned int *)(PartyEventStreamProcessor + 48),  *(unsigned __int16 *)(PartyEventStreamProcessor + 52));
  uint64_t PartyEventStream = FirstPartyEventStreamProcessor.init()();
  *(void *)(v1 + 56) = PartyEventStreamProcessor;
  *(void *)(v1 + 64) = &protocol witness table for FirstPartyEventStreamProcessor;
  *(void *)(v1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = PartyEventStream;
  return v1;
}

uint64_t sub_FD6C()
{
  return swift_release(*(void *)(v0 + 72));
}

uint64_t sub_FD74()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t type metadata accessor for ContactsInferenceDomain()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin23ContactsInferenceDomain);
}

uint64_t sub_FDC8(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  while (v2)
  {
    uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v4 = 4LL;
    while (1)
    {
      uint64_t v5 = v4 - 4;
      if ((a1 & 0xC000000000000001LL) == 0) {
        break;
      }
      uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1);
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v5, 1LL)) {
        goto LABEL_29;
      }
LABEL_11:
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v6 + 120LL))();
      swift_release(v6);
      uint64_t v9 = *(void *)(v8 + 16);
      int64_t v10 = *((void *)v3 + 2);
      int64_t v11 = v10 + v9;
      if (__OFADD__(v10, v9)) {
        goto LABEL_30;
      }
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v3);
      if ((_DWORD)isUniquelyReferenced_nonNull_native && v11 <= *((void *)v3 + 3) >> 1)
      {
        if (*(void *)(v8 + 16)) {
          goto LABEL_20;
        }
      }

      else
      {
        if (v10 <= v11) {
          int64_t v13 = v10 + v9;
        }
        else {
          int64_t v13 = v10;
        }
        uint64_t v3 = sub_26068(isUniquelyReferenced_nonNull_native, v13, 1, v3);
        if (*(void *)(v8 + 16))
        {
LABEL_20:
          uint64_t v14 = *((void *)v3 + 2);
          if ((*((void *)v3 + 3) >> 1) - v14 < v9) {
            goto LABEL_32;
          }
          uint64_t v15 = &v3[16 * v14 + 32];
          if (v8 + 32 < (unint64_t)&v15[16 * v9] && (unint64_t)v15 < v8 + 32 + 16 * v9)
          {
            uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
            __break(1u);
            return result;
          }

          memcpy(v15, (const void *)(v8 + 32), 16 * v9);
          if (v9)
          {
            uint64_t v17 = *((void *)v3 + 2);
            BOOL v18 = __OFADD__(v17, v9);
            uint64_t v19 = v17 + v9;
            if (v18) {
              goto LABEL_33;
            }
            *((void *)v3 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v19;
          }

          goto LABEL_5;
        }
      }

      if (v9) {
        goto LABEL_31;
      }
LABEL_5:
      swift_bridgeObjectRelease(v8);
      ++v4;
      if (v7 == v2) {
        goto LABEL_39;
      }
    }

    uint64_t v6 = *(void *)(a1 + 8 * v4);
    swift_retain(v6);
    uint64_t v7 = v4 - 3;
    if (!__OFADD__(v5, 1LL)) {
      goto LABEL_11;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    if (a1 < 0) {
      uint64_t v20 = a1;
    }
    else {
      uint64_t v20 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v20);
  }

  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_39:
  swift_bridgeObjectRelease(a1);
  return (uint64_t)v3;
}

char *sub_FFF0(void (*a1)(uint64_t *__return_ptr, __int128 *), uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *(void *)(a3 + 16);
  if (!v20) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(a3);
  uint64_t v5 = 0LL;
  uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    __int128 v22 = *(_OWORD *)(a3 + 16 * v5 + 32);
    a1(&v23, &v22);
    if (v3)
    {
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(a3);
      return v6;
    }

    uint64_t v7 = v23;
    uint64_t v8 = *(void *)(v23 + 16);
    int64_t v9 = *((void *)v6 + 2);
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v6);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v10 <= *((void *)v6 + 3) >> 1)
    {
      if (*(void *)(v7 + 16)) {
        goto LABEL_15;
      }
    }

    else
    {
      if (v9 <= v10) {
        int64_t v12 = v9 + v8;
      }
      else {
        int64_t v12 = v9;
      }
      uint64_t v6 = sub_26054(isUniquelyReferenced_nonNull_native, v12, 1, v6);
      if (*(void *)(v7 + 16))
      {
LABEL_15:
        uint64_t v13 = *((void *)v6 + 2);
        if ((*((void *)v6 + 3) >> 1) - v13 < v8) {
          goto LABEL_30;
        }
        unint64_t v14 = (unint64_t)&v6[40 * v13 + 32];
        if (v7 + 32 < v14 + 40 * v8 && v14 < v7 + 32 + 40 * v8) {
          goto LABEL_32;
        }
        sub_4CC0(&qword_38FB0);
        swift_arrayInitWithCopy(v14);
        if (v8)
        {
          uint64_t v16 = *((void *)v6 + 2);
          BOOL v17 = __OFADD__(v16, v8);
          uint64_t v18 = v16 + v8;
          if (v17) {
            goto LABEL_31;
          }
          *((void *)v6 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v18;
        }

        goto LABEL_4;
      }
    }

    if (v8) {
      goto LABEL_29;
    }
LABEL_4:
    ++v5;
    swift_bridgeObjectRelease(v7);
    if (v20 == v5)
    {
      swift_bridgeObjectRelease(a3);
      return v6;
    }
  }

  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

char *sub_101FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v3 = *(void *)(type metadata accessor for SessionGroundTruths(0LL) - 8);
  uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = *(void *)(v3 + 72);
  uint64_t v22 = a1;
  uint64_t v6 = swift_bridgeObjectRetain(a1);
  uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v8 = SessionGroundTruths.groundTruth.getter(v6);
    uint64_t v9 = *(void *)(v8 + 16);
    int64_t v10 = *((void *)v7 + 2);
    int64_t v11 = v10 + v9;
    if (__OFADD__(v10, v9)) {
      break;
    }
    uint64_t v12 = v8;
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v7);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v11 <= *((void *)v7 + 3) >> 1)
    {
      if (*(void *)(v12 + 16)) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v10 <= v11) {
        int64_t v14 = v10 + v9;
      }
      else {
        int64_t v14 = v10;
      }
      uint64_t v7 = sub_26054(isUniquelyReferenced_nonNull_native, v14, 1, v7);
      if (*(void *)(v12 + 16))
      {
LABEL_14:
        uint64_t v15 = *((void *)v7 + 2);
        if ((*((void *)v7 + 3) >> 1) - v15 < v9) {
          goto LABEL_28;
        }
        unint64_t v16 = (unint64_t)&v7[40 * v15 + 32];
        if (v12 + 32 < v16 + 40 * v9 && v16 < v12 + 32 + 40 * v9) {
          goto LABEL_30;
        }
        sub_4CC0(&qword_38FB0);
        swift_arrayInitWithCopy(v16);
        if (v9)
        {
          uint64_t v18 = *((void *)v7 + 2);
          BOOL v19 = __OFADD__(v18, v9);
          uint64_t v20 = v18 + v9;
          if (v19) {
            goto LABEL_29;
          }
          *((void *)v7 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v20;
        }

        goto LABEL_4;
      }
    }

    if (v9) {
      goto LABEL_27;
    }
LABEL_4:
    uint64_t v6 = swift_bridgeObjectRelease(v12);
    v4 += v5;
    if (!--v1)
    {
      swift_bridgeObjectRelease(v22);
      return v7;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_103E8(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  while (v2)
  {
    uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v4 = 4LL;
    while (1)
    {
      uint64_t v5 = v4 - 4;
      if ((a1 & 0xC000000000000001LL) == 0) {
        break;
      }
      uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1);
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v5, 1LL)) {
        goto LABEL_29;
      }
LABEL_11:
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v6 + 168LL))();
      swift_release(v6);
      uint64_t v9 = *(void *)(v8 + 16);
      int64_t v10 = *((void *)v3 + 2);
      int64_t v11 = v10 + v9;
      if (__OFADD__(v10, v9)) {
        goto LABEL_30;
      }
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v3);
      if ((_DWORD)isUniquelyReferenced_nonNull_native && v11 <= *((void *)v3 + 3) >> 1)
      {
        if (*(void *)(v8 + 16)) {
          goto LABEL_20;
        }
      }

      else
      {
        if (v10 <= v11) {
          int64_t v13 = v10 + v9;
        }
        else {
          int64_t v13 = v10;
        }
        uint64_t v3 = sub_2654C(isUniquelyReferenced_nonNull_native, v13, 1, v3);
        if (*(void *)(v8 + 16))
        {
LABEL_20:
          uint64_t v14 = *((void *)v3 + 2);
          if ((*((void *)v3 + 3) >> 1) - v14 < v9) {
            goto LABEL_32;
          }
          unint64_t v15 = (unint64_t)&v3[40 * v14 + 32];
          if (v8 + 32 < v15 + 40 * v9 && v15 < v8 + 32 + 40 * v9)
          {
            uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
            __break(1u);
            return result;
          }

          sub_4CC0(&qword_397E0);
          swift_arrayInitWithCopy(v15);
          if (v9)
          {
            uint64_t v17 = *((void *)v3 + 2);
            BOOL v18 = __OFADD__(v17, v9);
            uint64_t v19 = v17 + v9;
            if (v18) {
              goto LABEL_33;
            }
            *((void *)v3 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v19;
          }

          goto LABEL_5;
        }
      }

      if (v9) {
        goto LABEL_31;
      }
LABEL_5:
      swift_bridgeObjectRelease(v8);
      ++v4;
      if (v7 == v2) {
        goto LABEL_39;
      }
    }

    uint64_t v6 = *(void *)(a1 + 8 * v4);
    swift_retain(v6);
    uint64_t v7 = v4 - 3;
    if (!__OFADD__(v5, 1LL)) {
      goto LABEL_11;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    if (a1 < 0) {
      uint64_t v20 = a1;
    }
    else {
      uint64_t v20 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v20);
  }

  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_39:
  swift_bridgeObjectRelease(a1);
  return (uint64_t)v3;
}

char *sub_10634(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v3 = (void *)(a1 + 32);
  swift_bridgeObjectRetain(a1);
  uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v5 = v3[3];
    uint64_t v6 = v3[4];
    sub_8164(v3, v5);
    uint64_t v7 = dispatch thunk of AppInteractionFeatureExtractor.intentTypes.getter(v5, v6);
    uint64_t v8 = *(void *)(v7 + 16);
    int64_t v9 = *((void *)v4 + 2);
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    uint64_t v11 = v7;
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v4);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v10 <= *((void *)v4 + 3) >> 1)
    {
      if (*(void *)(v11 + 16)) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v9 <= v10) {
        int64_t v13 = v9 + v8;
      }
      else {
        int64_t v13 = v9;
      }
      uint64_t v4 = sub_26560(isUniquelyReferenced_nonNull_native, v13, 1, v4);
      if (*(void *)(v11 + 16))
      {
LABEL_14:
        uint64_t v14 = *((void *)v4 + 2);
        if ((*((void *)v4 + 3) >> 1) - v14 < v8) {
          goto LABEL_28;
        }
        unint64_t v15 = &v4[8 * v14 + 32];
        memcpy(v15, (const void *)(v11 + 32), 8 * v8);
        if (v8)
        {
          uint64_t v17 = *((void *)v4 + 2);
          BOOL v18 = __OFADD__(v17, v8);
          uint64_t v19 = v17 + v8;
          if (v18) {
            goto LABEL_29;
          }
          *((void *)v4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v19;
        }

        goto LABEL_4;
      }
    }

    if (v8) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease(v11);
    v3 += 5;
    if (!--v1)
    {
      swift_bridgeObjectRelease(a1);
      return v4;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

char *sub_107F0(void (*a1)(uint64_t *__return_ptr, uint64_t, __n128), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v5 = a3 + 32;
  __n128 v6 = swift_bridgeObjectRetain(a3);
  uint64_t v7 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    a1(&v23, v5, v6);
    if (v3)
    {
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease(a3);
      return v7;
    }

    uint64_t v8 = v23;
    uint64_t v9 = *(void *)(v23 + 16);
    int64_t v10 = *((void *)v7 + 2);
    int64_t v11 = v10 + v9;
    if (__OFADD__(v10, v9)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v7);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v11 <= *((void *)v7 + 3) >> 1)
    {
      if (*(void *)(v8 + 16)) {
        goto LABEL_15;
      }
    }

    else
    {
      if (v10 <= v11) {
        int64_t v13 = v10 + v9;
      }
      else {
        int64_t v13 = v10;
      }
      uint64_t v7 = sub_26690(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      if (*(void *)(v8 + 16))
      {
LABEL_15:
        uint64_t v14 = *((void *)v7 + 2);
        if ((*((void *)v7 + 3) >> 1) - v14 < v9) {
          goto LABEL_30;
        }
        unint64_t v15 = (unint64_t)&v7[40 * v14 + 32];
        if (v8 + 32 < v15 + 40 * v9 && v15 < v8 + 32 + 40 * v9) {
          goto LABEL_32;
        }
        sub_4CC0(&qword_396E0);
        swift_arrayInitWithCopy(v15);
        if (v9)
        {
          uint64_t v17 = *((void *)v7 + 2);
          BOOL v18 = __OFADD__(v17, v9);
          uint64_t v19 = v17 + v9;
          if (v18) {
            goto LABEL_31;
          }
          *((void *)v7 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v19;
        }

        goto LABEL_4;
      }
    }

    if (v9) {
      goto LABEL_29;
    }
LABEL_4:
    swift_bridgeObjectRelease(v8);
    v5 += 40LL;
    if (!--v4)
    {
      swift_bridgeObjectRelease(a3);
      return v7;
    }
  }

  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

char *sub_109E8(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = a3;
  if (a3 >> 62) {
    goto LABEL_37;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a3);
  while (v6)
  {
    unint64_t v27 = v5 & 0xC000000000000001LL;
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v8 = 4LL;
    uint64_t v26 = v5;
    while (1)
    {
      uint64_t v10 = v8 - 4;
      if (!v27) {
        break;
      }
      uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, v5);
      uint64_t v5 = v8 - 3;
      if (__OFADD__(v10, 1LL)) {
        goto LABEL_32;
      }
LABEL_11:
      uint64_t v30 = v11;
      a1(&v29, &v30);
      if (v4)
      {
        swift_bridgeObjectRelease(v7);
        swift_bridgeObjectRelease(v26);
        swift_release(v11);
        return v7;
      }

      swift_release(v11);
      uint64_t v12 = v29;
      uint64_t v13 = *(void *)(v29 + 16);
      int64_t v14 = *((void *)v7 + 2);
      int64_t v15 = v14 + v13;
      if (__OFADD__(v14, v13)) {
        goto LABEL_33;
      }
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v7);
      if ((_DWORD)isUniquelyReferenced_nonNull_native && v15 <= *((void *)v7 + 3) >> 1)
      {
        if (*(void *)(v12 + 16)) {
          goto LABEL_21;
        }
      }

      else
      {
        if (v14 <= v15) {
          int64_t v17 = v14 + v13;
        }
        else {
          int64_t v17 = v14;
        }
        uint64_t v7 = sub_266CC(isUniquelyReferenced_nonNull_native, v17, 1, v7);
        if (*(void *)(v12 + 16))
        {
LABEL_21:
          uint64_t v18 = *((void *)v7 + 2);
          if ((*((void *)v7 + 3) >> 1) - v18 < v13) {
            goto LABEL_35;
          }
          unint64_t v19 = (unint64_t)&v7[40 * v18 + 32];
          if (v12 + 32 < v19 + 40 * v13 && v19 < v12 + 32 + 40 * v13)
          {
            uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
            __break(1u);
            return result;
          }

          sub_4CC0(&qword_396C8);
          swift_arrayInitWithCopy(v19);
          if (v13)
          {
            uint64_t v21 = *((void *)v7 + 2);
            BOOL v22 = __OFADD__(v21, v13);
            uint64_t v23 = v21 + v13;
            if (v22) {
              goto LABEL_36;
            }
            *((void *)v7 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v23;
          }

          goto LABEL_5;
        }
      }

      if (v13) {
        goto LABEL_34;
      }
LABEL_5:
      swift_bridgeObjectRelease(v12);
      ++v8;
      BOOL v9 = v5 == v6;
      uint64_t v5 = v26;
      if (v9)
      {
        swift_bridgeObjectRelease(v26);
        return v7;
      }
    }

    uint64_t v11 = *(void *)(v5 + 8 * v8);
    swift_retain(v11);
    uint64_t v5 = v8 - 3;
    if (!__OFADD__(v10, 1LL)) {
      goto LABEL_11;
    }
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (v5 < 0) {
      uint64_t v24 = v5;
    }
    else {
      uint64_t v24 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v24);
  }

  swift_bridgeObjectRelease(v5);
  return (char *)&_swiftEmptyArrayStorage;
}

void sub_10C84(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_10C90(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_10C9C(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_10CA8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    uint64_t v6 = a3 + 32;
    uint64_t v7 = qword_38C28;
    swift_bridgeObjectRetain(a3);
    if (v7 != -1) {
      swift_once(&qword_38C28, sub_EB6C);
    }
    uint64_t v8 = type metadata accessor for Logger(0LL);
    do
    {
      sub_7D04(v8, (uint64_t)qword_392D8);
      sub_8120(v6, (uint64_t)v30);
      uint64_t v15 = swift_bridgeObjectRetain_n(a2, 2LL);
      unint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
      os_log_type_t v17 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v9 = swift_slowAlloc(22LL, -1LL);
        uint64_t v10 = swift_slowAlloc(64LL, -1LL);
        uint64_t v29 = v10;
        *(_DWORD *)uint64_t v9 = 136315394;
        swift_bridgeObjectRetain(a2);
        *(void *)(v9 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(a1, a2, &v29);
        swift_bridgeObjectRelease_n(a2, 3LL);
        *(_WORD *)(v9 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
        sub_8120((uint64_t)v30, (uint64_t)&v27);
        uint64_t v11 = sub_4CC0(a4);
        uint64_t v12 = String.init<A>(describing:)(&v27, v11);
        unint64_t v14 = v13;
        *(void *)(v9 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v12, v13, &v29);
        swift_bridgeObjectRelease(v14);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v30);
        _os_log_impl(&dword_0, v16, v17, "%s%s", (uint8_t *)v9, 0x16u);
        swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v10, -1LL, -1LL);
        swift_slowDealloc(v9, -1LL, -1LL);
      }

      else
      {

        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v30);
        swift_bridgeObjectRelease_n(a2, 2LL);
      }

      v6 += 40LL;
      --v5;
    }

    while (v5);
    swift_bridgeObjectRelease(a3);
  }

  else
  {
    if (qword_38C28 != -1) {
      swift_once(&qword_38C28, sub_EB6C);
    }
    uint64_t v18 = type metadata accessor for Logger(0LL);
    sub_7D04(v18, (uint64_t)qword_392D8);
    uint64_t v19 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      BOOL v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v23 = swift_slowAlloc(32LL, -1LL);
      v30[0] = v23;
      *(_DWORD *)BOOL v22 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v27 = sub_28A50(a1, a2, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl(&dword_0, v20, v21, "%s<Empty>", v22, 0xCu);
      swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }
  }

void sub_11030(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_1103C(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_11048(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v43 = a1;
  uint64_t v6 = a4(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v42 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = *(void *)(a3 + 16);
  if (v12)
  {
    uint64_t v13 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v14 = qword_38C28;
    uint64_t v38 = a3;
    swift_bridgeObjectRetain(a3);
    if (v14 != -1) {
      swift_once(&qword_38C28, sub_EB6C);
    }
    uint64_t v15 = *(void *)(v7 + 72);
    uint64_t v45 = type metadata accessor for Logger(0LL);
    *(void *)&__int128 v16 = 136315394LL;
    __int128 v40 = v16;
    __int128 v39 = (char *)&type metadata for Any + 8;
    uint64_t v46 = v7;
    uint64_t v41 = v15;
    do
    {
      sub_7D04(v45, (uint64_t)qword_392D8);
      uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
      v28(v11, v13, v6);
      uint64_t v29 = swift_bridgeObjectRetain_n(a2, 2LL);
      uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
      os_log_type_t v31 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v17 = swift_slowAlloc(22LL, -1LL);
        uint64_t v44 = swift_slowAlloc(64LL, -1LL);
        uint64_t v48 = v44;
        *(_DWORD *)uint64_t v17 = v40;
        swift_bridgeObjectRetain(a2);
        *(void *)(v17 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v43, a2, &v48);
        swift_bridgeObjectRelease_n(a2, 3LL);
        *(_WORD *)(v17 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
        uint64_t v18 = v11;
        uint64_t v19 = v6;
        uint64_t v20 = v42;
        v28(v42, (uint64_t)v18, v19);
        os_log_type_t v21 = v20;
        uint64_t v6 = v19;
        uint64_t v11 = v18;
        uint64_t v22 = String.init<A>(describing:)(v21, v6);
        unint64_t v24 = v23;
        *(void *)(v17 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v22, v23, &v48);
        swift_bridgeObjectRelease(v24);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v18, v6);
        _os_log_impl(&dword_0, v30, v31, "%s%s", (uint8_t *)v17, 0x16u);
        uint64_t v25 = v44;
        swift_arrayDestroy(v44, 2LL, v39);
        uint64_t v26 = v25;
        uint64_t v7 = v46;
        swift_slowDealloc(v26, -1LL, -1LL);
        uint64_t v27 = v17;
        uint64_t v15 = v41;
        swift_slowDealloc(v27, -1LL, -1LL);
      }

      else
      {

        (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
        swift_bridgeObjectRelease_n(a2, 2LL);
      }

      v13 += v15;
      --v12;
    }

    while (v12);
    swift_bridgeObjectRelease(v38);
  }

  else
  {
    if (qword_38C28 != -1) {
      swift_once(&qword_38C28, sub_EB6C);
    }
    uint64_t v32 = type metadata accessor for Logger(0LL);
    sub_7D04(v32, (uint64_t)qword_392D8);
    uint64_t v33 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v37 = swift_slowAlloc(32LL, -1LL);
      uint64_t v48 = v37;
      *(_DWORD *)uint64_t v36 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v47 = sub_28A50(v43, a2, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v36 + 4, v36 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl(&dword_0, v34, v35, "%s<Empty>", v36, 0xCu);
      swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1LL, -1LL);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }
  }

void sub_11478()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = type metadata accessor for SiriPrivateLearningInferenceEngine();
  uint64_t v0 = sub_4CC0(&qword_39708);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_394A0 = v5;
  qword_394A8 = v6;
}

void sub_114F8(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  sub_8120(a2, (uint64_t)v30);
  uint64_t v5 = (*(uint64_t (**)(uint64_t *))(v4 + 96))(v30);
  if (((*(uint64_t (**)(void))(*(void *)v5 + 104LL))() & 1) != 0)
  {
    if (qword_38C38 != -1) {
      swift_once(&qword_38C38, sub_1BB00);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_7D04(v6, (uint64_t)qword_394B0);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc(22LL, -1LL);
      uint64_t v11 = swift_slowAlloc(64LL, -1LL);
      v30[0] = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      if (qword_38C30 != -1) {
        swift_once(&qword_38C30, sub_11478);
      }
      uint64_t v13 = qword_394A0;
      unint64_t v12 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      uint64_t v31 = sub_28A50(v13, v12, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v10 + 4, v10 + 12);
      swift_bridgeObjectRelease(v12);
      *(_WORD *)(v10 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      uint64_t v31 = v4;
      uint64_t v14 = sub_4CC0(&qword_39800);
      uint64_t v15 = String.init<A>(describing:)(&v31, v14);
      unint64_t v17 = v16;
      uint64_t v31 = sub_28A50(v15, v16, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v10 + 14, v10 + 22);
      swift_bridgeObjectRelease(v17);
      _os_log_impl(&dword_0, v8, v9, "%s     - %s (enabled)", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy(v11, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1LL, -1LL);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    else
    {
    }
  }

  else
  {
    if (qword_38C38 != -1) {
      swift_once(&qword_38C38, sub_1BB00);
    }
    uint64_t v18 = type metadata accessor for Logger(0LL);
    uint64_t v19 = sub_7D04(v18, (uint64_t)qword_394B0);
    uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc(22LL, -1LL);
      uint64_t v23 = swift_slowAlloc(64LL, -1LL);
      v30[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315394;
      if (qword_38C30 != -1) {
        swift_once(&qword_38C30, sub_11478);
      }
      uint64_t v25 = qword_394A0;
      unint64_t v24 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      uint64_t v31 = sub_28A50(v25, v24, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease(v24);
      *(_WORD *)(v22 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      uint64_t v31 = v4;
      uint64_t v26 = sub_4CC0(&qword_39800);
      uint64_t v27 = String.init<A>(describing:)(&v31, v26);
      unint64_t v29 = v28;
      uint64_t v31 = sub_28A50(v27, v28, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v22 + 14, v22 + 22);
      swift_bridgeObjectRelease(v29);
      _os_log_impl(&dword_0, v20, v21, "%s     - %s (disabled)", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);

      swift_release(v5);
      uint64_t v5 = 0LL;
    }

    else
    {

      swift_release(v5);
      uint64_t v5 = 0LL;
    }
  }

  *a3 = v5;
}

uint64_t sub_1192C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PlayMediaIntentWithAttachedNowPlayingEventStreamDefinition(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  uint64_t v29 = v3;
  __chkstk_darwin();
  uint64_t v27 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for INPlayMediaIntentStreamDefinition(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  uint64_t v26 = v6;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for FeaturisedNowPlayingEventStream(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  unint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for EventStreamType(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin();
  unint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *(void *)(v0 + 232);
  uint64_t v18 = *(void (**)(char *, void, uint64_t))(v14 + 104);
  v18(v16, enum case for EventStreamType.nowPlayingStream(_:), v13);
  sub_8120(v1 + 144, (uint64_t)v30);
  FeaturisedNowPlayingEventStream.init(eventReader:)(v30);
  dispatch thunk of StreamRegistry.registerStream<A>(identifier:stream:)( v16,  v12,  v9,  &protocol witness table for FeaturisedNowPlayingEventStream);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v14 + 8);
  v19(v16, v13);
  v18(v16, enum case for EventStreamType.playMediaIntentStream(_:), v13);
  sub_8120(v1 + 104, (uint64_t)v30);
  INPlayMediaIntentStreamDefinition.init(eventReader:)(v30);
  uint64_t v20 = v25;
  dispatch thunk of StreamRegistry.registerStream<A>(identifier:stream:)( v16,  v8,  v25,  &protocol witness table for INPlayMediaIntentStreamDefinition);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v20);
  v19(v16, v13);
  v18(v16, enum case for EventStreamType.playMediaIntentStreamWithAttachedNowPlayingEvents(_:), v13);
  uint64_t v21 = swift_retain(v17);
  uint64_t v22 = v27;
  PlayMediaIntentWithAttachedNowPlayingEventStreamDefinition.init(streamRegistry:)(v21);
  uint64_t v23 = v28;
  dispatch thunk of StreamRegistry.registerStream<A>(identifier:stream:)( v16,  v22,  v28,  &protocol witness table for PlayMediaIntentWithAttachedNowPlayingEventStreamDefinition);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v23);
  return ((uint64_t (*)(char *, uint64_t))v19)(v16, v13);
}

uint64_t sub_11B98()
{
  v1[99] = v0;
  uint64_t v2 = sub_4CC0(&qword_397F0);
  v1[100] = swift_task_alloc((*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for UUID(0LL);
  v1[101] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[102] = v4;
  v1[103] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for SessionGroundTruths(0LL);
  v1[104] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[105] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[106] = swift_task_alloc(v7);
  v1[107] = swift_task_alloc(v7);
  v1[108] = swift_task_alloc(v7);
  return swift_task_switch(sub_11C60, 0LL, 0LL);
}

uint64_t sub_11C60()
{
  if (qword_38C38 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[109] = v1;
  uint64_t v2 = sub_7D04(v1, (uint64_t)qword_394B0);
  v0[110] = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v7 = qword_394A0;
    unint64_t v8 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    v0[98] = sub_28A50(v7, v8, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 98, v0 + 99, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v8);
    _os_log_impl(&dword_0, v3, v4, "%s run() starting", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v9 = v0[99];
  v0[111] = *(void *)(v9 + 240);
  dispatch thunk of CoreAnalyticsLogHelper.logInferencePluginRun()();
  uint64_t v10 = unk_3985C;
  uint64_t v13 = (uint64_t (*)(char))((char *)&dword_39858 + dword_39858);
  swift_retain(v9);
  uint64_t v11 = (void *)swift_task_alloc(v10);
  v0[112] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_11E68;
  return v13(1);
}

uint64_t sub_11E68(uint64_t a1)
{
  uint64_t v3 = *(void **)v2;
  uint64_t v4 = *(void *)(*(void *)v2 + 896LL);
  v3[113] = a1;
  v3[114] = v1;
  swift_task_dealloc(v4);
  swift_release(v3[99]);
  if (v1) {
    uint64_t v5 = sub_1376C;
  }
  else {
    uint64_t v5 = sub_11EE0;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_11EE0()
{
  v211 = v0 + 95;
  uint64_t v1 = v0[113];
  uint64_t v210 = v1;
  uint64_t v245 = *(void *)(v1 + 16);
  if (v245)
  {
    uint64_t v2 = v0 + 2;
    v230 = v0 + 7;
    uint64_t v3 = (uint64_t)(v0 + 87);
    v213 = v0 + 97;
    v215 = v0 + 96;
    uint64_t v4 = v0[105];
    uint64_t v216 = v0[102];
    v226 = (void *)v0[99];
    unint64_t v240 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v238 = *(void *)(v4 + 72);
    uint64_t v242 = v4;
    uint64_t v5 = *(uint64_t (**)(void, void, void))(v4 + 16);
    v212 = v0 + 98;
    swift_bridgeObjectRetain(v1);
    uint64_t v6 = 0LL;
    v228 = v0 + 87;
    v236 = v5;
    while (1)
    {
      uint64_t v13 = v5(v0[108], v240 + v6 * v238, v0[104]);
      uint64_t v14 = SessionGroundTruths.groundTruth.getter(v13);
      uint64_t v15 = *(void *)(v14 + 16);
      swift_bridgeObjectRelease(v14);
      uint64_t v16 = v0[108];
      uint64_t v17 = v0[104];
      if (v15)
      {
        uint64_t v253 = v6;
        uint64_t v18 = v5(v0[107], v16, v17);
        uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
        os_log_type_t v20 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v19, v20))
        {
          log = v19;
          os_log_type_t v247 = v20;
          uint64_t v21 = swift_slowAlloc(22LL, -1LL);
          uint64_t v231 = swift_slowAlloc(64LL, -1LL);
          v260[0] = v231;
          *(_DWORD *)uint64_t v21 = 136315394;
          if (qword_38C30 != -1) {
            swift_once(&qword_38C30, sub_11478);
          }
          uint64_t v22 = v0[107];
          uint64_t v23 = v0[103];
          uint64_t v217 = v0[101];
          uint64_t v219 = v0[104];
          uint64_t v24 = qword_394A0;
          unint64_t v25 = qword_394A8;
          swift_bridgeObjectRetain(qword_394A8);
          v0[96] = sub_28A50(v24, v25, v260);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v215, v213, v21 + 4, v21 + 12);
          uint64_t v26 = swift_bridgeObjectRelease(v25);
          *(_WORD *)(v21 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
          uint64_t v27 = SessionGroundTruths.sessionId.getter(v26);
          uint64_t v28 = UUID.uuidString.getter(v27);
          unint64_t v30 = v29;
          (*(void (**)(uint64_t, uint64_t))(v216 + 8))(v23, v217);
          v0[97] = sub_28A50(v28, v30, v260);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v213, v212, v21 + 14, v21 + 22);
          swift_bridgeObjectRelease(v30);
          uint64_t v31 = *(uint64_t **)(v242 + 8);
          ((void (*)(uint64_t, uint64_t))v31)(v22, v219);
          uint64_t v19 = log;
          _os_log_impl(&dword_0, log, v247, "%s Persisting new ground truth for Session ID=%s", (uint8_t *)v21, 0x16u);
          swift_arrayDestroy(v231, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v231, -1LL, -1LL);
          swift_slowDealloc(v21, -1LL, -1LL);
        }

        else
        {
          uint64_t v31 = *(uint64_t **)(v242 + 8);
          ((void (*)(uint64_t, uint64_t))v31)(v0[107], v0[104]);
        }

        uint64_t v47 = SessionGroundTruths.groundTruth.getter(v46);
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)(v47 + 16);
        v249 = v31;
        if (v49)
        {
          uint64_t v50 = v47 + 32;
          uint64_t v51 = qword_38C28;
          uint64_t v233 = v47;
          swift_bridgeObjectRetain(v47);
          if (v51 != -1) {
            swift_once(&qword_38C28, sub_EB6C);
          }
          do
          {
            sub_7D04(v0[109], (uint64_t)qword_392D8);
            uint64_t v52 = sub_8120(v50, (uint64_t)v2);
            uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
            os_log_type_t v54 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v53, v54))
            {
              uint64_t v55 = swift_slowAlloc(22LL, -1LL);
              uint64_t v56 = swift_slowAlloc(64LL, -1LL);
              v260[0] = v56;
              *(_DWORD *)uint64_t v55 = 136315394;
              *(void *)(v55 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(8224LL, 0xE200000000000000LL, v260);
              *(_WORD *)(v55 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
              sub_8120((uint64_t)v2, v3);
              uint64_t v57 = sub_4CC0(&qword_38FB0);
              uint64_t v58 = String.init<A>(describing:)(v3, v57);
              unint64_t v60 = v59;
              *(void *)(v55 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v58, v59, v260);
              swift_bridgeObjectRelease(v60);
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v2);
              _os_log_impl(&dword_0, v53, v54, "%s%s", (uint8_t *)v55, 0x16u);
              swift_arrayDestroy(v56, 2LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v56, -1LL, -1LL);
              swift_slowDealloc(v55, -1LL, -1LL);
            }

            else
            {

              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v2);
            }

            v50 += 40LL;
            --v49;
          }

          while (v49);
          swift_bridgeObjectRelease_n(v233, 2LL);
        }

        else
        {
          if (qword_38C28 != -1) {
            swift_once(&qword_38C28, sub_EB6C);
          }
          uint64_t v61 = sub_7D04(v0[109], (uint64_t)qword_392D8);
          uint64_t v62 = (os_log_s *)Logger.logObject.getter(v61);
          os_log_type_t v63 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v62, v63))
          {
            uint64_t v64 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v65 = swift_slowAlloc(32LL, -1LL);
            v260[0] = v65;
            *(_DWORD *)uint64_t v64 = 136315138;
            uint64_t *v211 = sub_28A50(8224LL, 0xE200000000000000LL, v260);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v211, v215, v64 + 4, v64 + 12);
            _os_log_impl(&dword_0, v62, v63, "%s<Empty>", v64, 0xCu);
            swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v65, -1LL, -1LL);
            swift_slowDealloc(v64, -1LL, -1LL);
          }

          swift_bridgeObjectRelease(v48);
        }

        uint64_t v7 = v0[108];
        uint64_t v8 = v0[104];
        uint64_t v9 = v226[5];
        uint64_t v10 = v226[6];
        sub_8164(v226 + 2, v9);
        dispatch thunk of SiriPrivateLearningInferenceContext.groundTruthStore.getter(v9, v10);
        uint64_t v11 = sub_8164(v230, *(void *)(v257 + 80));
        v12._rawValue = (void *)SessionGroundTruths.groundTruth.getter(v11);
        InferredGroundTruthStore.writeTypedGroundTruth(groundTruths:)(v12);
        swift_bridgeObjectRelease(v12._rawValue);
        ((void (*)(uint64_t, uint64_t))v249)(v7, v8);
        uint64_t v0 = (uint64_t *)v257;
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v230);
        uint64_t v3 = (uint64_t)v228;
      }

      else
      {
        uint64_t v32 = v5(v0[106], v16, v17);
        uint64_t v33 = (void *)Logger.logObject.getter(v32);
        os_log_type_t v34 = static os_log_type_t.debug.getter();
        if (!os_log_type_enabled((os_log_t)v33, v34))
        {
          uint64_t v66 = v0[108];
          uint64_t v67 = v0[106];
          uint64_t v68 = v0[104];

          uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v242 + 8);
          v69(v67, v68);
          v69(v66, v68);
          goto LABEL_6;
        }

        uint64_t v253 = v6;
        uint64_t v35 = swift_slowAlloc(22LL, -1LL);
        uint64_t v248 = swift_slowAlloc(64LL, -1LL);
        v260[0] = v248;
        *(_DWORD *)uint64_t v35 = 136315394;
        if (qword_38C30 != -1) {
          swift_once(&qword_38C30, sub_11478);
        }
        uint64_t v232 = v0[108];
        uint64_t v36 = v0[106];
        uint64_t v37 = v0[103];
        uint64_t v220 = v0[101];
        os_log_t logb = (os_log_t)v0[104];
        uint64_t v38 = qword_394A0;
        unint64_t v39 = qword_394A8;
        swift_bridgeObjectRetain(qword_394A8);
        *(void *)(v35 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v38, v39, v260);
        uint64_t v40 = swift_bridgeObjectRelease(v39);
        *(_WORD *)(v35 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
        uint64_t v41 = SessionGroundTruths.sessionId.getter(v40);
        uint64_t v42 = UUID.uuidString.getter(v41);
        unint64_t v44 = v43;
        (*(void (**)(uint64_t, uint64_t))(v216 + 8))(v37, v220);
        *(void *)(v35 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v42, v44, v260);
        swift_bridgeObjectRelease(v44);
        uint64_t v45 = *(void (**)(uint64_t, os_log_t))(v242 + 8);
        v45(v36, logb);
        _os_log_impl(&dword_0, (os_log_t)v33, v34, "%s Session ID=%s has no ground truth", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy(v248, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v248, -1LL, -1LL);
        swift_slowDealloc(v35, -1LL, -1LL);

        v45(v232, logb);
      }

      uint64_t v5 = v236;
      uint64_t v6 = v253;
LABEL_6:
      if (++v6 == v245)
      {
        swift_bridgeObjectRelease(v0[113]);
        uint64_t v1 = v0[113];
        break;
      }
    }
  }

  uint64_t v70 = v0 + 93;
  unint64_t v71 = sub_101FC(v1);
  uint64_t v72 = v71;
  if (*((void *)v71 + 2))
  {
    v254 = v0 + 94;
    uint64_t v237 = *((void *)v71 + 2);
    uint64_t v73 = v0 + 27;
    uint64_t v74 = v0[100];
    uint64_t v75 = (void *)v0[99];
    dispatch thunk of CoreAnalyticsLogHelper.logGroundTruthState()();
    v227 = v0 + 12;
    sub_18344(v0 + 12);
    uint64_t v76 = v75 + 2;
    os_log_t loga = (os_log_t)(v75 + 2);
    v225 = v75;
    uint64_t v77 = v75[5];
    uint64_t v78 = v75[6];
    sub_8164(v76, v77);
    dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v0 + 17, v77, v78);
    uint64_t v79 = v0[20];
    uint64_t v80 = v0[21];
    sub_8164(v0 + 17, v79);
    dispatch thunk of PlusContactSuggestionStore.mostRecentStoreUpdate()(v79, v80);
    uint64_t v81 = type metadata accessor for ContactSuggestionStoreUpdate(0LL);
    uint64_t v82 = *(void *)(v81 - 8);
    int v83 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v74, 1LL, v81);
    uint64_t v84 = v0[100];
    if (v83 == 1)
    {
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17);
      sub_845C(v84, &qword_397F0);
      unint64_t v85 = 0x80000000000305A0LL;
      uint64_t v86 = 0xD00000000000001CLL;
    }

    else
    {
      uint64_t v86 = ContactSuggestionStoreUpdate.source.getter();
      unint64_t v85 = v96;
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v84, v81);
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17);
    }

    uint64_t v97 = *(void *)(v257 + 120);
    uint64_t v98 = *(void *)(v257 + 128);
    sub_8164(v227, v97);
    uint64_t v100 = (*(uint64_t (**)(uint64_t, uint64_t))(v98 + 8))(v97, v98);
    uint64_t v101 = v99;
    v246 = v72;
    if (v86 == v100 && v85 == v99)
    {
      swift_bridgeObjectRelease_n(v85, 2LL);
    }

    else
    {
      char v102 = _stringCompareWithSmolCheck(_:_:expecting:)(v86, v85, v100, v99, 0LL);
      swift_bridgeObjectRelease(v101);
      uint64_t v103 = swift_bridgeObjectRelease(v85);
      if ((v102 & 1) == 0)
      {
        char v112 = (void *)(v257 + 176);
        unint64_t v113 = (os_log_s *)Logger.logObject.getter(v103);
        os_log_type_t v114 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v113, v114))
        {
          v250 = (uint64_t *)(v257 + 736);
          uint64_t v115 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v116 = swift_slowAlloc(32LL, -1LL);
          v260[0] = v116;
          *(_DWORD *)uint64_t v115 = 136315138;
          if (qword_38C30 != -1) {
            swift_once(&qword_38C30, sub_11478);
          }
          uint64_t v117 = qword_394A0;
          unint64_t v118 = qword_394A8;
          swift_bridgeObjectRetain(qword_394A8);
          uint64_t *v250 = sub_28A50(v117, v118, v260);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v250, v70, v115 + 4, v115 + 12);
          swift_bridgeObjectRelease(v118);
          _os_log_impl( &dword_0,  v113,  v114,  "%s Suggestion generator has been changed since the last run. Wiping the PICS store to maintain integrity.",  v115,  0xCu);
          swift_arrayDestroy(v116, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v116, -1LL, -1LL);
          swift_slowDealloc(v115, -1LL, -1LL);
        }

        uint64_t v119 = v225[5];
        uint64_t v120 = v225[6];
        sub_8164(loga, v119);
        dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v112, v119, v120);
        uint64_t v104 = v257;
        uint64_t v121 = *(void *)(v257 + 200);
        uint64_t v122 = *(void *)(v257 + 208);
        sub_8164(v112, v121);
        dispatch thunk of PlusContactSuggestionStore.resetStore()(v121, v122);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v112);
        sub_8120((uint64_t)v227, (uint64_t)v73);
        uint64_t v108 = _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v73);
LABEL_52:
        uint64_t v123 = (void *)(v104 + 256);
        uint64_t v124 = (os_log_s *)Logger.logObject.getter(v108);
        os_log_type_t v125 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v124, v125))
        {
          uint64_t v126 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v127 = swift_slowAlloc(32LL, -1LL);
          v260[0] = v127;
          *(_DWORD *)uint64_t v126 = 136315138;
          if (qword_38C30 != -1) {
            swift_once(&qword_38C30, sub_11478);
          }
          uint64_t v128 = qword_394A0;
          unint64_t v129 = qword_394A8;
          swift_bridgeObjectRetain(qword_394A8);
          uint64_t *v254 = sub_28A50(v128, v129, v260);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v254, v211, v126 + 4, v126 + 12);
          swift_bridgeObjectRelease(v129);
          _os_log_impl( &dword_0,  v124,  v125,  "%s Suggestion generation requires reloading old ground truth. Loading ground truth from store.",  v126,  0xCu);
          swift_arrayDestroy(v127, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v127, -1LL, -1LL);
          swift_slowDealloc(v126, -1LL, -1LL);
        }

        else
        {
        }

        uint64_t v130 = v257;
        uint64_t v131 = *(void *)(v257 + 792);
        uint64_t v132 = v225[5];
        uint64_t v133 = v225[6];
        sub_8164(loga, v132);
        dispatch thunk of SiriPrivateLearningInferenceContext.groundTruthStore.getter(v132, v133);
        uint64_t v134 = *(void *)(v131 + 224);
        swift_bridgeObjectRetain(v134);
        uint64_t v136 = sub_FDC8(v135);
        swift_bridgeObjectRelease(v134);
        uint64_t v137 = swift_task_alloc(32LL);
        *(void *)(v137 + 16) = v123;
        v138 = sub_FFF0((void (*)(uint64_t *__return_ptr, __int128 *))sub_22CB0, v137, v136);
        swift_bridgeObjectRelease(v136);
        swift_task_dealloc(v137);
        v139 = v123;
        v140 = v138;
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v139);
        v259 = &_swiftEmptyArrayStorage;
        v141 = (uint64_t *)*((void *)v138 + 2);
        swift_retain(v131);
        v251 = v141;
        if (!v141)
        {
          uint64_t v72 = (char *)&_swiftEmptyArrayStorage;
LABEL_88:
          swift_release(*(void *)(v130 + 792));
          swift_bridgeObjectRelease(v140);
          goto LABEL_89;
        }

        unint64_t v142 = 0LL;
        v143 = (__int128 *)(v257 + 296);
        uint64_t v218 = v257 + 376;
        v255 = (void *)(v257 + 416);
        v243 = v138 + 32;
        uint64_t v144 = v134 & 0xFFFFFFFFFFFFFF8LL;
        if (v134 < 0) {
          uint64_t v144 = v134;
        }
        uint64_t v214 = v144;
        unint64_t v145 = v134 & 0xC000000000000001LL;
        v234 = v138;
        v229 = (void *)(v257 + 336);
        while (1)
        {
          if (v142 >= *((void *)v140 + 2)) {
            goto LABEL_114;
          }
          sub_8120((uint64_t)&v243[40 * v142], (uint64_t)v143);
          unint64_t v258 = v142;
          if ((unint64_t)v134 >> 62)
          {
            swift_bridgeObjectRetain_n(v134, 2LL);
            uint64_t v146 = _CocoaArrayWrapper.endIndex.getter(v214);
            if (v146)
            {
LABEL_67:
              uint64_t v147 = 0LL;
              while (1)
              {
                if (v145)
                {
                  uint64_t v148 = specialized _ArrayBuffer._getElementSlowPath(_:)(v147, v134);
                  uint64_t v149 = v147 + 1;
                  if (__OFADD__(v147, 1LL)) {
                    goto LABEL_112;
                  }
                }

                else
                {
                  uint64_t v148 = *(void *)(v134 + 8 * v147 + 32);
                  swift_retain(v148);
                  uint64_t v149 = v147 + 1;
                  if (__OFADD__(v147, 1LL))
                  {
LABEL_112:
                    __break(1u);
                    goto LABEL_113;
                  }
                }

                char v150 = (*(uint64_t (**)(__int128 *))(*(void *)v148 + 184LL))(v143);
                swift_release(v148);
                if ((v150 & 1) == 0) {
                  break;
                }
                ++v147;
                if (v149 == v146) {
                  goto LABEL_75;
                }
              }

              uint64_t v130 = v257;
              swift_bridgeObjectRelease_n(v134, 2LL);
              uint64_t v159 = sub_8120((uint64_t)v143, (uint64_t)v229);
              v160 = (os_log_s *)Logger.logObject.getter(v159);
              os_log_type_t v161 = static os_log_type_t.debug.getter();
              if (os_log_type_enabled(v160, v161))
              {
                uint64_t v162 = swift_slowAlloc(22LL, -1LL);
                uint64_t v221 = swift_slowAlloc(64LL, -1LL);
                v260[0] = v221;
                *(_DWORD *)uint64_t v162 = 136315394;
                if (qword_38C30 != -1) {
                  swift_once(&qword_38C30, sub_11478);
                }
                uint64_t v164 = qword_394A0;
                unint64_t v163 = qword_394A8;
                swift_bridgeObjectRetain(qword_394A8);
                *(void *)(v162 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v164, v163, v260);
                swift_bridgeObjectRelease(v163);
                *(_WORD *)(v162 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
                sub_8120((uint64_t)v229, v218);
                uint64_t v165 = sub_4CC0(&qword_38FB0);
                uint64_t v166 = String.init<A>(describing:)(v218, v165);
                unint64_t v168 = v167;
                *(void *)(v162 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v166, v167, v260);
                swift_bridgeObjectRelease(v168);
                _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v229);
                _os_log_impl(&dword_0, v160, v161, "%s Ignoring %s", (uint8_t *)v162, 0x16u);
                swift_arrayDestroy(v221, 2LL, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v221, -1LL, -1LL);
                swift_slowDealloc(v162, -1LL, -1LL);

                uint64_t v130 = v257;
              }

              else
              {
                _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v229);
              }

              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v143);
              goto LABEL_63;
            }
          }

          else
          {
            uint64_t v146 = *(void *)((char *)&dword_10 + (v134 & 0xFFFFFFFFFFFFFF8LL));
            swift_bridgeObjectRetain_n(v134, 2LL);
            if (v146) {
              goto LABEL_67;
            }
          }

LABEL_75:
          swift_bridgeObjectRelease_n(v134, 2LL);
          sub_7D6C(v143, (uint64_t)v255);
          v151 = v259;
          if ((swift_isUniquelyReferenced_nonNull_native(v259) & 1) == 0)
          {
            sub_2A6C4(0, v151[2] + 1LL, 1);
            v151 = v259;
          }

          unint64_t v153 = v151[2];
          unint64_t v152 = v151[3];
          if (v153 >= v152 >> 1) {
            sub_2A6C4(v152 > 1, v153 + 1, 1);
          }
          uint64_t v130 = v257;
          uint64_t v154 = *(void *)(v257 + 440);
          uint64_t v155 = *(void *)(v257 + 448);
          uint64_t v156 = sub_E5D4((uint64_t)v255, v154);
          uint64_t v157 = *(void *)(v154 - 8);
          uint64_t v158 = swift_task_alloc((*(void *)(v157 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 16))(v158, v156, v154);
          sub_1FD44(v153, v158, (uint64_t *)&v259, v154, v155);
          _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v255);
          swift_task_dealloc(v158);
          unint64_t v145 = v134 & 0xC000000000000001LL;
          v140 = v234;
LABEL_63:
          unint64_t v142 = v258 + 1;
          if ((uint64_t *)(v258 + 1) == v251)
          {
            uint64_t v72 = (char *)v259;
            goto LABEL_88;
          }
        }
      }
    }

    sub_8120((uint64_t)v227, (uint64_t)(v0 + 27));
    uint64_t v104 = v257;
    uint64_t v105 = *(void *)(v257 + 240);
    uint64_t v106 = *(void *)(v257 + 248);
    sub_8164(v73, v105);
    char v107 = (*(uint64_t (**)(uint64_t, uint64_t))(v106 + 16))(v105, v106);
    uint64_t v108 = _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v73);
    if ((v107 & 1) == 0)
    {
      swift_bridgeObjectRetain(v72);
LABEL_89:
      v169 = (__int128 *)(v257 + 536);
      uint64_t v170 = *(void *)(v257 + 120);
      uint64_t v171 = *(void *)(v257 + 128);
      LOBYTE(v89) = (_BYTE)v227;
      sub_8164(v227, v170);
      unint64_t v172 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v171 + 24))(v72, v170, v171);
      unint64_t v174 = v173;
      swift_bridgeObjectRelease(v72);
      unint64_t v252 = HIDWORD(v172);
      unint64_t v256 = v172;
      unint64_t v241 = HIDWORD(v174);
      unsigned int v244 = v174;
      uint64_t v175 = v225[5];
      uint64_t v176 = v225[6];
      sub_8164(loga, v175);
      dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter((void *)(v257 + 456), v175, v176);
      sub_8164((void *)(v257 + 456), *(void *)(v257 + 480));
      uint64_t v177 = *(void *)(v257 + 120);
      uint64_t v178 = *(void *)(v257 + 128);
      sub_8164(v227, v177);
      uint64_t v179 = (*(uint64_t (**)(uint64_t, uint64_t))(v178 + 8))(v177, v178);
      uint64_t v181 = v180;
      dispatch thunk of PlusContactSuggestionStore.recordStoreUpdate(source:)(v179);
      swift_bridgeObjectRelease(v181);
      uint64_t v90 = (void *)v257;
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v257 + 456));
      sub_186D8(v257 + 536);
      if (*(void *)(v257 + 560))
      {
        v182 = (__int128 *)(v257 + 576);
        v183 = (void *)(v257 + 616);
        v235 = (void *)(v257 + 656);
        v239 = (void *)(v257 + 496);
        uint64_t v184 = sub_7D6C(v169, v257 + 496);
        dispatch thunk of CoreAnalyticsLogHelper.logMediaSuggestionGenerationTrigger()(v184);
        v260[0] = (uint64_t)&_swiftEmptyArrayStorage;
        uint64_t v70 = (uint64_t *)v246;
        swift_bridgeObjectRetain(v246);
        unint64_t v89 = 0LL;
        uint64_t v185 = (uint64_t)(v246 + 32);
        uint64_t v186 = v237;
        while (v89 < v70[2])
        {
          sub_8120(v185, (uint64_t)v182);
          uint64_t v187 = v90[75];
          sub_8164(v182, v187);
          if ((sub_252AC(v187) & 1) != 0)
          {
            sub_7D6C(v182, (uint64_t)v183);
            uint64_t v188 = v260[0];
            if ((swift_isUniquelyReferenced_nonNull_native(v260[0]) & 1) == 0)
            {
              sub_2A6C4(0, *(void *)(v188 + 16) + 1LL, 1);
              uint64_t v188 = v260[0];
            }

            unint64_t v190 = *(void *)(v188 + 16);
            unint64_t v189 = *(void *)(v188 + 24);
            if (v190 >= v189 >> 1) {
              sub_2A6C4(v189 > 1, v190 + 1, 1);
            }
            uint64_t v90 = (void *)v257;
            uint64_t v191 = *(void *)(v257 + 640);
            uint64_t v192 = *(void *)(v257 + 648);
            uint64_t v193 = sub_E5D4((uint64_t)v183, v191);
            uint64_t v194 = *(void *)(v191 - 8);
            uint64_t v195 = swift_task_alloc((*(void *)(v194 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v194 + 16))(v195, v193, v191);
            sub_1FD44(v190, v195, v260, v191, v192);
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v183);
            swift_task_dealloc(v195);
            uint64_t v70 = (uint64_t *)v246;
            uint64_t v186 = v237;
            v182 = (__int128 *)(v257 + 576);
          }

          else
          {
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v182);
          }

          ++v89;
          v185 += 40LL;
          if (v186 == v89)
          {
            swift_bridgeObjectRelease(v70);
            unint64_t v93 = v260[0];
            uint64_t v91 = v90[65];
            uint64_t v196 = v90[66];
            sub_8164(v239, v91);
            unint64_t v92 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v196 + 24))(v93, v91, v196);
            unint64_t v88 = (unint64_t)v197;
            swift_release(v93);
            if (__CFADD__((_DWORD)v92, (_DWORD)v256)) {
              goto LABEL_118;
            }
            if (__CFADD__(HIDWORD(v92), (_DWORD)v252)) {
              goto LABEL_119;
            }
            if (__CFADD__((_DWORD)v88, v244)) {
              goto LABEL_120;
            }
            if (!__CFADD__(HIDWORD(v88), (_DWORD)v241))
            {
              LODWORD(v25_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = HIDWORD(v92) + v252;
              unint64_t v241 = (HIDWORD(v88) + v241);
              v244 += v88;
              uint64_t v198 = v225[5];
              uint64_t v199 = v225[6];
              sub_8164(loga, v198);
              LOBYTE(v89) = v257 - 112;
              dispatch thunk of SiriPrivateLearningInferenceContext.pimsStore.getter(v235, v198, v199);
              uint64_t v90 = (void *)v257;
              sub_8164(v235, *(void *)(v257 + 680));
              uint64_t v200 = *(void *)(v257 + 520);
              uint64_t v201 = *(void *)(v257 + 528);
              sub_8164(v239, v200);
              uint64_t v202 = (*(uint64_t (**)(uint64_t, uint64_t))(v201 + 8))(v200, v201);
              uint64_t v204 = v203;
              uint64_t v91 = (v92 + v256);
              dispatch thunk of PlusMediaSuggestionStore.recordStoreUpdate(source:)(v202);
              swift_bridgeObjectRelease(v204);
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v235);
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v239);
              goto LABEL_106;
            }

            goto LABEL_121;
          }
        }

    if (v57 < v56) {
      goto LABEL_154;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v53);
    uint64_t v219 = v57;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v53 = sub_1F6F4(0LL, *((void *)v53 + 2) + 1LL, 1, v53);
    }
    uint64_t v127 = *((void *)v53 + 2);
    uint64_t v126 = *((void *)v53 + 3);
    uint64_t v55 = v127 + 1;
    if (v127 >= v126 >> 1) {
      uint64_t v53 = sub_1F6F4((char *)(v126 > 1), v127 + 1, 1, v53);
    }
    *((void *)v53 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v55;
    uint64_t v128 = v53 + 32;
    unint64_t v129 = &v53[16 * v127 + 32];
    uint64_t v130 = v219;
    *(void *)unint64_t v129 = v56;
    *((void *)v129 + 1) = v130;
    if (v127)
    {
      while (1)
      {
        uint64_t v131 = v55 - 1;
        if (v55 >= 4)
        {
          uint64_t v136 = &v128[16 * v55];
          uint64_t v137 = *((void *)v136 - 8);
          v138 = *((void *)v136 - 7);
          unint64_t v142 = __OFSUB__(v138, v137);
          v139 = v138 - v137;
          if (v142) {
            goto LABEL_143;
          }
          v141 = *((void *)v136 - 6);
          v140 = *((void *)v136 - 5);
          unint64_t v142 = __OFSUB__(v140, v141);
          uint64_t v134 = v140 - v141;
          uint64_t v135 = v142;
          if (v142) {
            goto LABEL_144;
          }
          v143 = v55 - 2;
          uint64_t v144 = &v128[16 * v55 - 32];
          uint64_t v146 = *(void *)v144;
          unint64_t v145 = *((void *)v144 + 1);
          unint64_t v142 = __OFSUB__(v145, v146);
          uint64_t v147 = v145 - v146;
          if (v142) {
            goto LABEL_146;
          }
          unint64_t v142 = __OFADD__(v134, v147);
          uint64_t v148 = v134 + v147;
          if (v142) {
            goto LABEL_149;
          }
          if (v148 >= v139)
          {
            uint64_t v166 = &v128[16 * v131];
            unint64_t v168 = *(void *)v166;
            unint64_t v167 = *((void *)v166 + 1);
            unint64_t v142 = __OFSUB__(v167, v168);
            v169 = v167 - v168;
            if (v142) {
              goto LABEL_153;
            }
            uint64_t v159 = v134 < v169;
            goto LABEL_112;
          }
        }

        else
        {
          if (v55 != 3)
          {
            v160 = *((void *)v53 + 4);
            os_log_type_t v161 = *((void *)v53 + 5);
            unint64_t v142 = __OFSUB__(v161, v160);
            unint64_t v153 = v161 - v160;
            uint64_t v154 = v142;
            goto LABEL_106;
          }

          uint64_t v133 = *((void *)v53 + 4);
          uint64_t v132 = *((void *)v53 + 5);
          unint64_t v142 = __OFSUB__(v132, v133);
          uint64_t v134 = v132 - v133;
          uint64_t v135 = v142;
        }

        if ((v135 & 1) != 0) {
          goto LABEL_145;
        }
        v143 = v55 - 2;
        uint64_t v149 = &v128[16 * v55 - 32];
        v151 = *(void *)v149;
        char v150 = *((void *)v149 + 1);
        unint64_t v152 = __OFSUB__(v150, v151);
        unint64_t v153 = v150 - v151;
        uint64_t v154 = v152;
        if (v152) {
          goto LABEL_148;
        }
        uint64_t v155 = &v128[16 * v131];
        uint64_t v157 = *(void *)v155;
        uint64_t v156 = *((void *)v155 + 1);
        unint64_t v142 = __OFSUB__(v156, v157);
        uint64_t v158 = v156 - v157;
        if (v142) {
          goto LABEL_151;
        }
        if (__OFADD__(v153, v158)) {
          goto LABEL_152;
        }
        if (v153 + v158 >= v134)
        {
          uint64_t v159 = v134 < v158;
LABEL_112:
          if (v159) {
            uint64_t v131 = v143;
          }
          goto LABEL_114;
        }

LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
        return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
      }

      sub_845C((uint64_t)v169, &qword_397F8);
      uint64_t v70 = (uint64_t *)v246;
      uint64_t v91 = v256;
LABEL_106:
      unint64_t v88 = *(void *)(v210 + 16);
      swift_bridgeObjectRelease(v90[113]);
      if (HIDWORD(v88)) {
        return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
      }
      unint64_t v93 = v70[2];
      swift_bridgeObjectRelease(v70);
      if (HIDWORD(v93)) {
        return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
      }
      unint64_t v92 = (v91 + v88);
      if (__CFADD__((_DWORD)v91, (_DWORD)v88))
      {
        __break(1u);
      }

      else
      {
        unint64_t v88 = (v252 + v93);
        if (!__CFADD__((_DWORD)v252, (_DWORD)v93))
        {
          _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v227);
          sub_22750();
          unint64_t v109 = v88 << 32;
          unint64_t v111 = v241;
          unsigned int v110 = v244;
          goto LABEL_111;
        }
      }

      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
      goto LABEL_122;
    }

    goto LABEL_52;
  }

  uint64_t v87 = swift_bridgeObjectRelease(v71);
  unint64_t v88 = Logger.logObject.getter(v87);
  LOBYTE(v89) = static os_log_type_t.debug.getter();
  if (os_log_type_enabled((os_log_t)v88, (os_log_type_t)v89))
  {
    uint64_t v90 = v0 + 94;
    uint64_t v91 = swift_slowAlloc(12LL, -1LL);
    unint64_t v92 = swift_slowAlloc(32LL, -1LL);
    v260[0] = v92;
    *(_DWORD *)uint64_t v91 = 136315138;
    unint64_t v93 = v91 + 4;
    if (qword_38C30 == -1)
    {
LABEL_36:
      uint64_t v94 = qword_394A0;
      unint64_t v95 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      *uint64_t v70 = sub_28A50(v94, v95, v260);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v70, v90, v93, v91 + 12);
      swift_bridgeObjectRelease(v95);
      _os_log_impl( &dword_0,  (os_log_t)v88,  (os_log_type_t)v89,  "%s No new ground truth generated",  (uint8_t *)v91,  0xCu);
      swift_arrayDestroy(v92, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v92, -1LL, -1LL);
      swift_slowDealloc(v91, -1LL, -1LL);

      uint64_t v0 = (uint64_t *)v257;
      goto LABEL_45;
    }

LABEL_122:
    swift_once(&qword_38C30, sub_11478);
    goto LABEL_36;
  }

LABEL_45:
  unint64_t v92 = *(void *)(v210 + 16);
  swift_bridgeObjectRelease(v0[113]);
  if (!HIDWORD(v92))
  {
    sub_22750();
    unint64_t v109 = 0LL;
    unsigned int v110 = 0;
    unint64_t v111 = 0LL;
LABEL_111:
    uint64_t v205 = *(void *)(v257 + 856);
    uint64_t v206 = *(void *)(v257 + 848);
    uint64_t v207 = *(void *)(v257 + 824);
    uint64_t v208 = *(void *)(v257 + 800);
    swift_task_dealloc(*(void *)(v257 + 864));
    swift_task_dealloc(v205);
    swift_task_dealloc(v206);
    swift_task_dealloc(v207);
    swift_task_dealloc(v208);
    return (*(uint64_t (**)(unint64_t, unint64_t))(v257 + 8))( v109 | v92,  v110 | (v111 << 32));
  }

  return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
}

uint64_t sub_1376C()
{
  uint64_t v1 = *(void *)(v0 + 864);
  uint64_t v2 = *(void *)(v0 + 856);
  uint64_t v3 = *(void *)(v0 + 848);
  uint64_t v4 = *(void *)(v0 + 824);
  uint64_t v5 = *(void *)(v0 + 800);
  sub_22750();
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_137E8()
{
  *(void *)(v1 + 120) = v0;
  return swift_task_switch(sub_13800, 0LL, 0LL);
}

uint64_t sub_13800()
{
  uint64_t v1 = type metadata accessor for DonationSourceProvider();
  uint64_t inited = swift_initStackObject(v1, v0 + 16);
  *(void *)(v0 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 28) = inited;
  sub_7D6C((__int128 *)(v0 + 72), inited + 16);
  unint64_t v3 = sub_2D038();
  *(void *)(v0 + 136) = v3;
  char v4 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(v0 + 18_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v4;
  uint64_t v5 = -1LL;
  uint64_t v6 = -1LL << v4;
  if (-v6 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(v3 + 64);
  if (!v7)
  {
    unint64_t v29 = 63 - v6;
    if (v29 > 0x7F)
    {
      unint64_t v30 = *(void *)(v3 + 72);
      if (v30)
      {
        uint64_t v8 = 1LL;
LABEL_16:
        uint64_t v10 = (v30 - 1) & v30;
        unint64_t v9 = __clz(__rbit64(v30)) + (v8 << 6);
        goto LABEL_5;
      }

      if (v29 >= 0xC0)
      {
        unint64_t v30 = *(void *)(v3 + 80);
        if (v30)
        {
          uint64_t v8 = 2LL;
          goto LABEL_16;
        }

        if (v29 >= 0x100)
        {
          unint64_t v30 = *(void *)(v3 + 88);
          if (v30)
          {
            uint64_t v8 = 3LL;
            goto LABEL_16;
          }

          if (v29 >= 0x140)
          {
            unint64_t v30 = *(void *)(v3 + 96);
            if (v30)
            {
              uint64_t v8 = 4LL;
              goto LABEL_16;
            }

            uint64_t v31 = 0LL;
            uint64_t v32 = v29 >> 6;
            if (v32 <= 5) {
              uint64_t v32 = 5LL;
            }
            uint64_t v33 = v32 - 5;
            while (v33 != v31)
            {
              unint64_t v30 = *(void *)(v3 + 104 + 8 * v31++);
              if (v30)
              {
                uint64_t v8 = v31 + 4;
                goto LABEL_16;
              }
            }
          }
        }
      }
    }

    uint64_t v34 = *(void *)(v0 + 128);
    swift_release(v3);
    swift_setDeallocating(v34);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v34 + 16));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v8 = 0LL;
  unint64_t v9 = __clz(__rbit64(v7));
  uint64_t v10 = (v7 - 1) & v7;
LABEL_5:
  *(void *)(v0 + 14_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v8;
  *(void *)(v0 + 15_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v10;
  uint64_t v11 = *(void *)(*(void *)(v3 + 48) + 8 * v9);
  uint64_t v12 = *(void *)(*(void *)(v3 + 56) + 8 * v9);
  *(void *)(v0 + 160) = v12;
  uint64_t v13 = qword_38C38;
  swift_bridgeObjectRetain(v12);
  if (v13 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  sub_7D04(v14, (uint64_t)qword_394B0);
  uint64_t v15 = swift_bridgeObjectRetain_n(v12, 2LL);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc(22LL, -1LL);
    uint64_t v35 = swift_slowAlloc(64LL, -1LL);
    *(void *)(v0 + 11_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v35;
    *(_DWORD *)uint64_t v18 = 136315394;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v19 = qword_394A0;
    unint64_t v20 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    *(void *)(v18 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v19, v20, (uint64_t *)(v0 + 112));
    swift_bridgeObjectRelease(v20);
    *(_WORD *)(v18 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    id v21 = (id)KVItemTypeName(v11);
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v24 = v23;

    *(void *)(v18 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v22, v24, (uint64_t *)(v0 + 112));
    swift_bridgeObjectRelease_n(v12, 2LL);
    swift_bridgeObjectRelease(v24);
    _os_log_impl(&dword_0, v16, v17, "%s Donating candidates with the type: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v35, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v12, 2LL);
  }

  uint64_t v25 = type metadata accessor for KVSuggestionDonator(0LL);
  swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
  uint64_t v26 = swift_bridgeObjectRetain(v12);
  *(void *)(v0 + 168) = KVSuggestionDonator.init(donationCandidates:)(v26);
  *(void *)(v0 + 176) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_13C04;
  return v36(v11);
}

uint64_t sub_13C04()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 176LL));
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_13C64, 0LL, 0LL);
}

uint64_t sub_13C64()
{
  uint64_t result = swift_release(*(void *)(v0 + 168));
  int64_t v2 = *(void *)(v0 + 144);
  unint64_t v3 = *(void *)(v0 + 152);
  if (!v3)
  {
    int64_t v24 = v2 + 1;
    if (__OFADD__(v2, 1LL))
    {
      __break(1u);
    }

    else
    {
      int64_t v25 = (unint64_t)((1LL << *(_BYTE *)(v0 + 184)) + 63) >> 6;
      uint64_t result = *(void *)(v0 + 136);
      if (v24 >= v25) {
        goto LABEL_25;
      }
      uint64_t v26 = result + 64;
      unint64_t v27 = *(void *)(result + 64 + 8 * v24);
      ++v2;
      if (v27)
      {
LABEL_14:
        uint64_t v5 = (v27 - 1) & v27;
        unint64_t v6 = __clz(__rbit64(v27)) + (v2 << 6);
        goto LABEL_3;
      }

      int64_t v2 = v24 + 1;
      if (v24 + 1 >= v25) {
        goto LABEL_25;
      }
      unint64_t v27 = *(void *)(v26 + 8 * v2);
      if (v27) {
        goto LABEL_14;
      }
      int64_t v2 = v24 + 2;
      if (v24 + 2 >= v25) {
        goto LABEL_25;
      }
      unint64_t v27 = *(void *)(v26 + 8 * v2);
      if (v27) {
        goto LABEL_14;
      }
      int64_t v28 = v24 + 3;
      if (v28 >= v25)
      {
LABEL_25:
        uint64_t v29 = *(void *)(v0 + 128);
        swift_release(result);
        swift_setDeallocating(v29);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v29 + 16));
        return (*(uint64_t (**)(void))(v0 + 8))();
      }

      unint64_t v27 = *(void *)(v26 + 8 * v28);
      if (v27)
      {
        int64_t v2 = v28;
        goto LABEL_14;
      }

      while (1)
      {
        int64_t v2 = v28 + 1;
        if (__OFADD__(v28, 1LL)) {
          break;
        }
        if (v2 >= v25) {
          goto LABEL_25;
        }
        unint64_t v27 = *(void *)(v26 + 8 * v2);
        ++v28;
        if (v27) {
          goto LABEL_14;
        }
      }
    }

    __break(1u);
    return result;
  }

  unint64_t v4 = __clz(__rbit64(v3));
  uint64_t v5 = (v3 - 1) & v3;
  unint64_t v6 = v4 | (v2 << 6);
  uint64_t result = *(void *)(v0 + 136);
LABEL_3:
  *(void *)(v0 + 14_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v2;
  *(void *)(v0 + 15_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v5;
  uint64_t v7 = *(void *)(*(void *)(result + 48) + 8 * v6);
  uint64_t v8 = *(void *)(*(void *)(result + 56) + 8 * v6);
  *(void *)(v0 + 160) = v8;
  uint64_t v9 = qword_38C38;
  swift_bridgeObjectRetain(v8);
  if (v9 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  sub_7D04(v10, (uint64_t)qword_394B0);
  uint64_t v11 = swift_bridgeObjectRetain_n(v8, 2LL);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc(22LL, -1LL);
    uint64_t v30 = swift_slowAlloc(64LL, -1LL);
    *(void *)(v0 + 11_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v30;
    *(_DWORD *)uint64_t v14 = 136315394;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v15 = qword_394A0;
    unint64_t v16 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    *(void *)(v14 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v15, v16, (uint64_t *)(v0 + 112));
    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v14 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    id v17 = (id)KVItemTypeName(v7);
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v20 = v19;

    *(void *)(v14 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v18, v20, (uint64_t *)(v0 + 112));
    swift_bridgeObjectRelease_n(v8, 2LL);
    swift_bridgeObjectRelease(v20);
    _os_log_impl(&dword_0, v12, v13, "%s Donating candidates with the type: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v30, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v8, 2LL);
  }

  uint64_t v21 = type metadata accessor for KVSuggestionDonator(0LL);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  uint64_t v22 = swift_bridgeObjectRetain(v8);
  *(void *)(v0 + 168) = KVSuggestionDonator.init(donationCandidates:)(v22);
  *(void *)(v0 + 176) = v23;
  *unint64_t v23 = v0;
  v23[1] = sub_13C04;
  return v31(v7);
}

void sub_14010(uint64_t a1@<X8>)
{
  uint64_t v74 = a1;
  uint64_t v71 = type metadata accessor for Date(0LL);
  id v73 = *(id *)(v71 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v70 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v67 = (char *)&v58 - v4;
  uint64_t v72 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v66 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v69 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v68 = type metadata accessor for Calendar(0LL);
  uint64_t v6 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_4CC0(&qword_39680);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v58 - v13;
  uint64_t v15 = v1[26];
  uint64_t v16 = v1[27];
  sub_8164(v1 + 23, v15);
  id v17 = (void *)dispatch thunk of StreamBookmarkStore.read(name:)(0xD000000000000027LL, 0x8000000000030220LL, v15, v16);
  if (v17)
  {
    id v73 = v17;
    uint64_t v18 = v1[10];
    uint64_t v19 = v1[11];
    sub_8164(v1 + 7, v18);
    dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)(v73, v18, v19);
  }

  else
  {
    unint64_t v59 = v8;
    uint64_t v60 = v6;
    uint64_t v20 = v66;
    uint64_t v21 = v67;
    uint64_t v22 = v72;
    uint64_t v61 = v1;
    uint64_t v62 = "cePlugin21CommonInferenceDomain";
    os_log_type_t v63 = v12;
    uint64_t v64 = v1 + 23;
    uint64_t v65 = v14;
    if (qword_38C38 != -1) {
      swift_once(&qword_38C38, sub_1BB00);
    }
    uint64_t v23 = type metadata accessor for Logger(0LL);
    uint64_t v58 = sub_7D04(v23, (uint64_t)qword_394B0);
    int64_t v24 = (os_log_s *)Logger.logObject.getter(v58);
    os_log_type_t v25 = static os_log_type_t.debug.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v27 = (uint64_t)v65;
    int64_t v28 = (void (**)(void, void))v73;
    uint64_t v29 = v21;
    uint64_t v30 = v20;
    if (v26)
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v32 = swift_slowAlloc(32LL, -1LL);
      v76[0] = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      uint64_t v33 = v69;
      if (qword_38C30 != -1) {
        swift_once(&qword_38C30, sub_11478);
      }
      uint64_t v35 = qword_394A0;
      unint64_t v34 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      uint64_t v75 = sub_28A50(v35, v34, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, v76, v31 + 4, v31 + 12);
      swift_bridgeObjectRelease(v34);
      _os_log_impl( &dword_0,  v24,  v25,  "%s No existing conversation bookmark found. A new bookmark will be created and only the last 24hrs of data will be reviewed.",  v31,  0xCu);
      swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1LL, -1LL);
      swift_slowDealloc(v31, -1LL, -1LL);

      uint64_t v36 = v71;
      uint64_t v22 = v72;
      uint64_t v27 = (uint64_t)v65;
      int64_t v28 = (void (**)(void, void))v73;
    }

    else
    {

      uint64_t v36 = v71;
      uint64_t v33 = v69;
    }

    uint64_t v37 = v59;
    static Calendar.current.getter();
    uint64_t v38 = (*(uint64_t (**)(char *, void, uint64_t))(v30 + 104))( v33,  enum case for Calendar.Component.hour(_:),  v22);
    static Date.now.getter(v38);
    Calendar.date(byAdding:value:to:wrappingComponents:)(v33, -24LL, v29, 0LL);
    ((void (**)(char *, uint64_t))v28)[1](v29, v36);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v22);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v68);
    unint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v28[6];
    uint64_t v40 = v39(v27, 1LL, v36);
    if ((_DWORD)v40 == 1)
    {
      uint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
      os_log_type_t v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        unint64_t v43 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v44 = swift_slowAlloc(32LL, -1LL);
        v76[0] = v44;
        *(_DWORD *)unint64_t v43 = 136315138;
        if (qword_38C30 != -1) {
          swift_once(&qword_38C30, sub_11478);
        }
        uint64_t v45 = qword_394A0;
        unint64_t v46 = qword_394A8;
        swift_bridgeObjectRetain(qword_394A8);
        uint64_t v75 = sub_28A50(v45, v46, v76);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, v76, v43 + 4, v43 + 12);
        swift_bridgeObjectRelease(v46);
        _os_log_impl( &dword_0,  v41,  v42,  "%s Failed to calculate a new valid bookmark start date. Using the current date instead - all existing conversa tion data will be ignored.",  v43,  0xCu);
        swift_arrayDestroy(v44, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v44, -1LL, -1LL);
        swift_slowDealloc(v43, -1LL, -1LL);

        uint64_t v36 = v71;
        uint64_t v27 = (uint64_t)v65;
        int64_t v28 = (void (**)(void, void))v73;
      }

      else
      {
      }
    }

    uint64_t v47 = (uint64_t)v63;
    sub_8418(v27, (uint64_t)v63, &qword_39680);
    uint64_t v48 = v39(v47, 1LL, v36);
    uint64_t v49 = v70;
    if ((_DWORD)v48 == 1)
    {
      static Date.now.getter(v48);
      sub_845C(v47, &qword_39680);
    }

    else
    {
      ((void (*)(char *, uint64_t, uint64_t))v28[4])(v70, v47, v36);
    }

    uint64_t v50 = v64;
    uint64_t v52 = v61;
    uint64_t v51 = v62;
    type metadata accessor for StreamBookmark(0LL);
    uint64_t v53 = (void *)StreamBookmark.__allocating_init(name:date:)( 0xD000000000000027LL,  (unint64_t)v51 | 0x8000000000000000LL,  v49);
    uint64_t v54 = v52[26];
    uint64_t v55 = v52[27];
    sub_8164(v50, v54);
    dispatch thunk of StreamBookmarkStore.write(bookmark:)(v53, v54, v55);
    uint64_t v57 = v52[10];
    uint64_t v56 = v52[11];
    sub_8164(v52 + 7, v57);
    dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)(v53, v57, v56);

    sub_845C(v27, &qword_39680);
  }

uint64_t sub_1468C()
{
  v1[53] = v0;
  uint64_t v2 = sub_4CC0(&qword_39710);
  v1[54] = v2;
  unint64_t v3 = (*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[55] = swift_task_alloc(v3);
  v1[56] = swift_task_alloc(v3);
  v1[57] = swift_task_alloc(v3);
  v1[58] = swift_task_alloc(v3);
  uint64_t v4 = type metadata accessor for SessionGroundTruths(0LL);
  v1[59] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[60] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[61] = swift_task_alloc(v6);
  v1[62] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for CoreDuetEvent(0LL);
  v1[63] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v1[64] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[65] = swift_task_alloc(v9);
  v1[66] = swift_task_alloc(v9);
  uint64_t v10 = sub_4CC0(&qword_39718);
  v1[67] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[68] = v11;
  v1[69] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v12 = (*(void *)(*(void *)(sub_4CC0(&qword_39720) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[70] = swift_task_alloc(v12);
  v1[71] = swift_task_alloc(v12);
  uint64_t v13 = type metadata accessor for UUID(0LL);
  v1[72] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v1[73] = v14;
  unint64_t v15 = (*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[74] = swift_task_alloc(v15);
  v1[75] = swift_task_alloc(v15);
  v1[76] = swift_task_alloc(v15);
  v1[77] = swift_task_alloc(v15);
  v1[78] = swift_task_alloc(v15);
  uint64_t v16 = type metadata accessor for FeaturisedTurn(0LL);
  v1[79] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[80] = v17;
  unint64_t v18 = (*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[81] = swift_task_alloc(v18);
  v1[82] = swift_task_alloc(v18);
  unint64_t v19 = (*(void *)(*(void *)(sub_4CC0(&qword_39728) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[83] = swift_task_alloc(v19);
  v1[84] = swift_task_alloc(v19);
  uint64_t v20 = sub_4CC0(&qword_39680);
  v1[85] = swift_task_alloc((*(void *)(*(void *)(v20 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v21 = (*(void *)(*(void *)(sub_4CC0(&qword_38F80) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[86] = swift_task_alloc(v21);
  v1[87] = swift_task_alloc(v21);
  v1[88] = swift_task_alloc(v21);
  v1[89] = swift_task_alloc(v21);
  v1[90] = swift_task_alloc(v21);
  unint64_t v22 = (*(void *)(*(void *)(sub_4CC0(&qword_39730) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[91] = swift_task_alloc(v22);
  v1[92] = swift_task_alloc(v22);
  uint64_t v23 = type metadata accessor for Conversation(0LL);
  v1[93] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v1[94] = v24;
  v1[95] = swift_task_alloc((*(void *)(v24 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = sub_4CC0(&qword_39738);
  v1[96] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v1[97] = v26;
  unint64_t v27 = (*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[98] = swift_task_alloc(v27);
  v1[99] = swift_task_alloc(v27);
  uint64_t v28 = sub_4CC0(&qword_39740);
  v1[100] = swift_task_alloc((*(void *)(*(void *)(v28 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = sub_4CC0(&qword_39748);
  v1[101] = v29;
  uint64_t v30 = *(void *)(v29 - 8);
  v1[102] = v30;
  v1[103] = swift_task_alloc((*(void *)(v30 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = sub_4CC0(&qword_39750);
  v1[104] = v31;
  uint64_t v32 = *(void *)(v31 - 8);
  v1[105] = v32;
  v1[106] = swift_task_alloc((*(void *)(v32 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = sub_4CC0(&qword_39758);
  v1[107] = v33;
  v1[108] = swift_task_alloc((*(void *)(*(void *)(v33 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = sub_4CC0(&qword_39760);
  v1[109] = v34;
  uint64_t v35 = *(void *)(v34 - 8);
  v1[110] = v35;
  v1[111] = swift_task_alloc((*(void *)(v35 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_14A90, 0LL, 0LL);
}

uint64_t sub_14A90()
{
  uint64_t v1 = v0[108];
  uint64_t v2 = v0[107];
  uint64_t v3 = v0[93];
  uint64_t v4 = v0[53];
  sub_14010(v1);
  uint64_t v5 = swift_allocObject(&unk_35848, 32LL, 7LL);
  *(void *)(v5 + 16) = &unk_39770;
  *(void *)(v5 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v4;
  uint64_t v6 = sub_22C70(&qword_39788, &qword_39758, (uint64_t)&protocol conformance descriptor for AnyAsyncSequence<A>);
  swift_retain(v4);
  AsyncMapSequence.init(_:transform:)(v1, &unk_39780, v5, v2, v3, v6);
  uint64_t v7 = *(void *)(v4 + 224);
  v0[112] = v7;
  swift_bridgeObjectRetain(v7);
  uint64_t v47 = sub_103E8(v8);
  v0[113] = v47;
  swift_bridgeObjectRelease(v7);
  uint64_t v48 = sub_1B56C();
  v0[114] = v48;
  if (qword_38C38 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v45 = v0 + 52;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v0[115] = v9;
  uint64_t v10 = sub_7D04(v9, (uint64_t)qword_394B0);
  v0[116] = v10;
  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  uint64_t v13 = &loc_2E000;
  uint64_t v14 = &SiriPrivateLearningInferencePlugin;
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v49 = v16;
    *(_DWORD *)unint64_t v15 = 136315138;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v17 = qword_394A0;
    unint64_t v18 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    *uint64_t v45 = sub_28A50(v17, v18, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v45, v0 + 53, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v18);
    _os_log_impl( &dword_0,  v11,  v12,  "%s Reviewing new conversations from Biome for ground truth generation.",  v15,  0xCu);
    swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);

    uint64_t v13 = (void *)&loc_2E000;
    uint64_t v14 = &SiriPrivateLearningInferencePlugin;
  }

  else
  {
  }

  unint64_t v46 = v0 + 51;
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v20, v21))
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    uint64_t v49 = v23;
    *(_DWORD *)unint64_t v22 = v13[341];
    uint64_t v24 = qword_394A0;
    unint64_t v25 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    *unint64_t v46 = sub_28A50(v24, v25, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v46, v45, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    _os_log_impl(&dword_0, v20, v21, "%s Suggestion evaluation frameworks:", v22, 0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    uint64_t v14 = &SiriPrivateLearningInferencePlugin;
  }

  else
  {
  }

  uint64_t v49 = qword_394A0;
  unint64_t v50 = qword_394A8;
  swift_bridgeObjectRetain(qword_394A8);
  v26._countAndFlagsBits = 0x202D20202020LL;
  v26._object = (void *)0xE600000000000000LL;
  String.append(_:)(v26);
  unint64_t v27 = v50;
  sub_10CA8(v49, v50, v47, &qword_397E0);
  uint64_t v28 = swift_bridgeObjectRelease(v27);
  uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    uint64_t v49 = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v34 = qword_394A0;
    unint64_t v33 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    v0[50] = sub_28A50(v34, v33, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 50, v46, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease(v33);
    _os_log_impl(&dword_0, v29, v30, "%s Ground truth generators:", v31, 0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  uint64_t v35 = v0[109];
  uint64_t v36 = v0[103];
  uint64_t v37 = v0[102];
  uint64_t v38 = v0[101];
  uint64_t v49 = qword_394A0;
  unint64_t v50 = qword_394A8;
  swift_bridgeObjectRetain(qword_394A8);
  v39._countAndFlagsBits = 0x202D20202020LL;
  v39._object = (void *)0xE600000000000000LL;
  String.append(_:)(v39);
  unint64_t v40 = v50;
  sub_10CA8(v49, v50, (uint64_t)v48, &qword_397D8);
  swift_bridgeObjectRelease(v40);
  v0[42] = sub_724C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v41 = sub_22C70(&qword_39790, &qword_39760, (uint64_t)&protocol conformance descriptor for AsyncMapSequence<A, B>);
  AsyncSequence<>.windowSquished()(v35, v41);
  InferenceCombinedSessionAsyncSequence.makeAsyncIterator()(v38);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
  uint64_t v42 = sub_22C70( &qword_39798,  &qword_39750,  (uint64_t)&protocol conformance descriptor for InferenceCombinedSessionAsyncSequence<A>.InferenceCombinedSessionAsyncSequenceIterator);
  v0[118] = v42;
  unint64_t v43 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[119] = v43;
  *unint64_t v43 = v0;
  v43[1] = sub_150E0;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[100], v0[104], v42);
}

uint64_t sub_150E0()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 952LL));
  if (v0)
  {
    v2[122] = v0;
    v2[121] = _swiftEmptyArrayStorage;
    uint64_t v3 = sub_16074;
  }

  else
  {
    v2[117] = _swiftEmptyArrayStorage;
    v2[120] = 0LL;
    uint64_t v3 = sub_15160;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

void sub_15160()
{
  uint64_t v1 = v0[100];
  uint64_t v2 = v0[96];
  uint64_t v191 = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[97] + 48LL))(v1, 1LL, v2) != 1)
  {
    uint64_t v21 = v0[99];
    uint64_t v22 = v0[98];
    uint64_t v23 = v0[94];
    uint64_t v24 = v0[93];
    uint64_t v176 = v0[95];
    uint64_t v179 = v0[92];
    uint64_t v182 = v0[90];
    uint64_t v185 = v0[73];
    uint64_t v188 = v0[72];
    uint64_t v25 = *(int *)(v2 + 48);
    uint64_t v26 = v21 + v25;
    uint64_t v27 = v1 + v25;
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32);
    v28(v21, v1, v24);
    sub_4D00(v27, v26, &qword_39730);
    uint64_t v29 = v22 + *(int *)(v2 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
    sub_8418(v26, v29, &qword_39730);
    v28(v176, v22, v24);
    uint64_t v30 = sub_4D00(v29, v179, &qword_39730);
    Conversation.getConversationId()(v30);
    uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v185 + 48);
    v0[123] = v31;
    uint64_t v32 = v31(v182, 1LL, v188);
    uint64_t v33 = v0[90];
    if ((_DWORD)v32 == 1)
    {
      sub_845C(v0[90], &qword_38F80);
      unint64_t v34 = 0x8000000000030500LL;
      uint64_t v35 = 0xD000000000000019LL;
    }

    else
    {
      uint64_t v46 = v0[73];
      uint64_t v47 = v191[72];
      uint64_t v35 = UUID.uuidString.getter(v32);
      unint64_t v34 = v48;
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v33, v47);
    }

    v191[125] = v34;
    v191[124] = v35;
    uint64_t v49 = swift_bridgeObjectRetain_n(v34, 2LL);
    unint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
    os_log_type_t v51 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = swift_slowAlloc(22LL, -1LL);
      uint64_t v53 = (void *)swift_slowAlloc(64LL, -1LL);
      v193[0] = v53;
      *(_DWORD *)uint64_t v52 = 136315394;
      uint64_t v54 = qword_394A0;
      unint64_t v55 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      *(void *)(v52 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v54, v55, (uint64_t *)v193);
      swift_bridgeObjectRelease(v55);
      *(_WORD *)(v52 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      swift_bridgeObjectRetain(v34);
      *(void *)(v52 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v35, v34, (uint64_t *)v193);
      swift_bridgeObjectRelease_n(v34, 3LL);
      _os_log_impl(&dword_0, v50, v51, "%s Reviewing conversation with conversationId=%s", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy(v53, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v53, -1LL, -1LL);
      swift_slowDealloc(v52, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v34, 2LL);
    }

    uint64_t v56 = v191[94];
    uint64_t v57 = v191[93];
    uint64_t v58 = v191[91];
    sub_8418(v191[92], v58, &qword_39730);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v58, 1LL, v57) == 1)
    {
      uint64_t v59 = v191[85];
      sub_845C(v191[91], &qword_39730);
      uint64_t v60 = type metadata accessor for Date(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56LL))(v59, 1LL, 1LL, v60);
    }

    else
    {
      uint64_t v61 = v191[94];
      uint64_t v62 = v191[93];
      uint64_t v63 = v191[91];
      Conversation.getTimestamp()();
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v63, v62);
    }

    uint64_t v64 = (void *)swift_task_alloc(dword_3950C);
    v191[126] = v64;
    *uint64_t v64 = v191;
    v64[1] = sub_16378;
    sub_18B30(v191[95], v191[85]);
    return;
  }

  uint64_t v3 = v0[113];
  (*(void (**)(void, void))(v0[105] + 8LL))(v0[106], v0[104]);
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = (char *)_swiftEmptyArrayStorage;
  if (v4)
  {
    swift_bridgeObjectRetain(v0[113]);
    uint64_t v6 = 0LL;
    while (1)
    {
      uint64_t v7 = (void *)(v0[113] + v6);
      uint64_t v8 = v7[7];
      uint64_t v9 = v7[8];
      sub_8164(v7 + 4, v8);
      char isUniquelyReferenced_nonNull_native = (char *)dispatch thunk of EvaluationFramework.reviewedSessionEvaluation()( v8,  v9);
      uint64_t v11 = *((void *)isUniquelyReferenced_nonNull_native + 2);
      unint64_t v12 = *((void *)v5 + 2);
      int64_t v13 = v12 + v11;
      if (__OFADD__(v12, v11)) {
        goto LABEL_44;
      }
      uint64_t v14 = isUniquelyReferenced_nonNull_native;
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v5);
      if ((_DWORD)isUniquelyReferenced_nonNull_native && v13 <= *((void *)v5 + 3) >> 1)
      {
        if (*((void *)v14 + 2)) {
          goto LABEL_15;
        }
      }

      else
      {
        else {
          int64_t v15 = v12;
        }
        char isUniquelyReferenced_nonNull_native = sub_266F4(isUniquelyReferenced_nonNull_native, v15, 1, v5);
        uint64_t v5 = isUniquelyReferenced_nonNull_native;
        if (*((void *)v14 + 2))
        {
LABEL_15:
          uint64_t v16 = *((void *)v5 + 2);
          if ((*((void *)v5 + 3) >> 1) - v16 < v11) {
            goto LABEL_45;
          }
          unint64_t v12 = (unint64_t)&v5[40 * v16 + 32];
          sub_4CC0(&qword_397A0);
          char isUniquelyReferenced_nonNull_native = (char *)swift_arrayInitWithCopy(v12);
          if (v11)
          {
            uint64_t v18 = *((void *)v5 + 2);
            BOOL v19 = __OFADD__(v18, v11);
            uint64_t v20 = v18 + v11;
            if (v19) {
              goto LABEL_46;
            }
            *((void *)v5 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v20;
          }

          goto LABEL_5;
        }
      }

      if (v11)
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        else {
          uint64_t v65 = v12 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(isUniquelyReferenced_nonNull_native);
        uint64_t v41 = _CocoaArrayWrapper.endIndex.getter(v65);
        if (!v41) {
          goto LABEL_51;
        }
LABEL_29:
        if (v41 >= 1)
        {
          uint64_t v42 = 0LL;
          unint64_t v43 = v12 & 0xC000000000000001LL;
          uint64_t v44 = v0[112] + 32LL;
          do
          {
            if (v43)
            {
              uint64_t v45 = specialized _ArrayBuffer._getElementSlowPath(_:)(v42, v0[112]);
            }

            else
            {
              uint64_t v45 = *(void *)(v44 + 8 * v42);
              swift_retain(v45);
            }

            ++v42;
            (*(void (**)(void))(*(void *)v45 + 176LL))();
            swift_release(v45);
          }

          while (v41 != v42);
          goto LABEL_51;
        }

LABEL_121:
        __break(1u);
        return;
      }

LABEL_5:
      swift_bridgeObjectRelease(v14);
      v6 += 40LL;
      if (!--v4)
      {
        swift_bridgeObjectRelease(v0[113]);
        break;
      }
    }
  }

  unint64_t v12 = v0[112];
  uint64_t v36 = (void *)v0[53];
  swift_bridgeObjectRelease(v0[113]);
  uint64_t v37 = v36[5];
  uint64_t v38 = v36[6];
  sub_8164(v36 + 2, v37);
  dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v193, v37, v38);
  uint64_t v39 = type metadata accessor for PLUSOfflineLogHelpers(0LL);
  swift_allocObject(v39, *(unsigned int *)(v39 + 48), *(unsigned __int16 *)(v39 + 52));
  uint64_t v40 = PLUSOfflineLogHelpers.init(logTarget:)(v193);
  dispatch thunk of PLUSOfflineLogHelpers.logSessionEvaluations(evaluations:)(v5);
  swift_bridgeObjectRelease(v5);
  swift_release(v40);
  char isUniquelyReferenced_nonNull_native = (char *)v0[112];
  if (v12 >> 62) {
    goto LABEL_47;
  }
  uint64_t v41 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(isUniquelyReferenced_nonNull_native);
  if (v41) {
    goto LABEL_29;
  }
LABEL_51:
  uint64_t v66 = v0[114];
  swift_bridgeObjectRelease(v0[112]);
  v193[0] = _swiftEmptyArrayStorage;
  uint64_t v67 = *(void *)(v66 + 16);
  uint64_t v68 = v0[114];
  if (v67)
  {
    swift_bridgeObjectRetain(v68);
    uint64_t v69 = 32LL;
    do
    {
      sub_8120(v0[114] + v69, (uint64_t)(v0 + 12));
      uint64_t v70 = v0[15];
      uint64_t v71 = v0[16];
      sub_8164(v0 + 12, v70);
      uint64_t v72 = dispatch thunk of InferenceGroundTruthGenerator.reviewedSessionGroundTruth()(v70, v71);
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 12);
      sub_274D4(v72);
      v69 += 40LL;
      --v67;
    }

    while (v67);
    swift_bridgeObjectRelease_n(v0[114], 2LL);
    id v73 = v193[0];
  }

  else
  {
    swift_bridgeObjectRelease(v68);
    id v73 = _swiftEmptyArrayStorage;
  }

  uint64_t v74 = v0[120];
  uint64_t v75 = v0[42];
  swift_bridgeObjectRetain(v75);
  sub_1881C((uint64_t)v73, v75);
  swift_bridgeObjectRelease(v75);
  uint64_t v76 = sub_20464((uint64_t)v73);
  uint64_t v158 = v74;
  swift_bridgeObjectRelease(v73);
  int64_t v77 = *(void *)(v76 + 16);
  if (!v77)
  {
    swift_bridgeObjectRelease(v76);
    uint64_t v117 = _swiftEmptyArrayStorage;
LABEL_104:
    uint64_t v128 = v0[117];
    swift_bridgeObjectRetain(v128);
    uint64_t v130 = sub_17F7C(v129);
    swift_bridgeObjectRelease(v128);
    uint64_t v131 = v130[2];
    if (v131)
    {
      sub_4CC0(&qword_397A8);
      uint64_t v132 = (void *)static _DictionaryStorage.allocate(capacity:)(v131);
    }

    else
    {
      uint64_t v132 = &_swiftEmptyDictionarySingleton;
    }

    v193[0] = v132;
    sub_20798((uint64_t)v130, 1, (uint64_t *)v193);
    swift_bridgeObjectRelease(v130);
    uint64_t v133 = v193[0];
    if (v158)
    {
      swift_release(v193[0]);
    }

    else
    {
      v193[0] = v117;
      swift_retain(v133);
      swift_bridgeObjectRetain(v117);
      sub_224C0(v193, (uint64_t)v133);
      uint64_t v134 = v0[111];
      uint64_t v135 = v0[110];
      uint64_t v136 = v0[109];
      uint64_t v137 = v0[108];
      uint64_t v138 = v0[106];
      uint64_t v139 = v0[103];
      uint64_t v140 = v0[100];
      uint64_t v141 = v0[99];
      uint64_t v142 = v0[98];
      uint64_t v143 = v0[95];
      uint64_t v144 = v0[92];
      uint64_t v145 = v0[91];
      uint64_t v146 = v0[90];
      uint64_t v147 = v0[89];
      uint64_t v148 = v0[88];
      uint64_t v149 = v0[87];
      uint64_t v150 = v0[86];
      uint64_t v151 = v0[85];
      uint64_t v152 = v0[84];
      uint64_t v153 = v0[83];
      uint64_t v154 = v0[82];
      uint64_t v155 = v0[81];
      uint64_t v156 = v0[78];
      uint64_t v157 = v0[77];
      uint64_t v159 = v0[76];
      uint64_t v161 = v0[75];
      uint64_t v163 = v0[74];
      uint64_t v165 = v0[71];
      uint64_t v167 = v0[70];
      uint64_t v169 = v0[69];
      uint64_t v171 = v0[66];
      uint64_t v173 = v0[65];
      uint64_t v175 = v0[62];
      uint64_t v178 = v0[61];
      uint64_t v181 = v0[58];
      uint64_t v184 = v0[57];
      uint64_t v187 = v0[56];
      uint64_t v192 = v0[55];
      swift_bridgeObjectRelease(v0[117]);
      swift_release(v133);
      unint64_t v190 = v193[0];
      swift_bridgeObjectRelease(v0[42]);
      (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v134, v136);
      swift_bridgeObjectRelease(v117);
      swift_release(v133);
      swift_task_dealloc(v134);
      swift_task_dealloc(v137);
      swift_task_dealloc(v138);
      swift_task_dealloc(v139);
      swift_task_dealloc(v140);
      swift_task_dealloc(v141);
      swift_task_dealloc(v142);
      swift_task_dealloc(v143);
      swift_task_dealloc(v144);
      swift_task_dealloc(v145);
      swift_task_dealloc(v146);
      swift_task_dealloc(v147);
      swift_task_dealloc(v148);
      swift_task_dealloc(v149);
      swift_task_dealloc(v150);
      swift_task_dealloc(v151);
      swift_task_dealloc(v152);
      swift_task_dealloc(v153);
      swift_task_dealloc(v154);
      swift_task_dealloc(v155);
      swift_task_dealloc(v156);
      swift_task_dealloc(v157);
      swift_task_dealloc(v159);
      swift_task_dealloc(v161);
      swift_task_dealloc(v163);
      swift_task_dealloc(v165);
      swift_task_dealloc(v167);
      swift_task_dealloc(v169);
      swift_task_dealloc(v171);
      swift_task_dealloc(v173);
      swift_task_dealloc(v175);
      swift_task_dealloc(v178);
      swift_task_dealloc(v181);
      swift_task_dealloc(v184);
      swift_task_dealloc(v187);
      swift_task_dealloc(v192);
      ((void (*)(void *))v0[1])(v190);
    }

    return;
  }

  uint64_t v174 = v0[60];
  uint64_t v168 = v0[54];
  v193[0] = _swiftEmptyArrayStorage;
  sub_2A71C(0, v77, 0);
  unint64_t v78 = sub_2B18C(v76);
  uint64_t v80 = 0LL;
  uint64_t v81 = v76 + 64;
  char v82 = *(_BYTE *)(v76 + 32);
  uint64_t v170 = v76 + 80;
  int64_t v164 = v77;
  uint64_t v166 = v76;
  int v160 = v79;
  uint64_t v162 = v76 + 64;
  while (1)
  {
    if ((v78 & 0x8000000000000000LL) != 0 || (uint64_t)v78 >= 1LL << v82)
    {
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
      goto LABEL_121;
    }

    if ((*(void *)(v81 + 8 * (v78 >> 6)) & (1LL << v78)) == 0) {
      goto LABEL_116;
    }
    if (*(_DWORD *)(v76 + 36) != v79) {
      goto LABEL_117;
    }
    uint64_t v180 = 1LL << v78;
    unint64_t v183 = v78 >> 6;
    uint64_t v177 = v80;
    uint64_t v86 = v0[57];
    uint64_t v85 = v0[58];
    uint64_t v87 = *(int *)(v168 + 48);
    uint64_t v88 = v0[73];
    uint64_t v89 = v0[72];
    uint64_t v90 = v0[56];
    uint64_t v91 = *(void (**)(uint64_t, unint64_t, uint64_t))(v88 + 16);
    unint64_t v92 = v78;
    v91(v85, *(void *)(v76 + 48) + *(void *)(v88 + 72) * v78, v89);
    uint64_t v186 = v91;
    uint64_t v189 = v92;
    uint64_t v93 = *(void *)(*(void *)(v76 + 56) + 8 * v92);
    *(void *)(v85 + v87) = v93;
    v91(v86, v85, v89);
    *(void *)(v86 + *(int *)(v168 + 48)) = v93;
    sub_4D00(v86, v90, &qword_39710);
    swift_bridgeObjectRetain_n(v93, 2LL);
    sub_845C(v85, &qword_39710);
    uint64_t v94 = *(void *)(v90 + *(int *)(v168 + 48));
    uint64_t v95 = *(void *)(v94 + 16);
    if (v95) {
      break;
    }
    uint64_t v100 = (char *)_swiftEmptyArrayStorage;
LABEL_88:
    uint64_t v116 = v0[55];
    uint64_t v115 = v0[56];
    v186(v116, v115, v0[72]);
    SessionGroundTruths.init(sessionId:groundTruth:)(v116, v100);
    sub_845C(v115, &qword_39710);
    uint64_t v117 = v193[0];
    if ((swift_isUniquelyReferenced_nonNull_native(v193[0]) & 1) == 0)
    {
      sub_2A71C(0, v117[2] + 1LL, 1);
      uint64_t v117 = v193[0];
    }

    uint64_t v76 = v166;
    unint64_t v119 = v117[2];
    unint64_t v118 = v117[3];
    if (v119 >= v118 >> 1)
    {
      sub_2A71C(v118 > 1, v119 + 1, 1);
      uint64_t v117 = v193[0];
    }

    uint64_t v120 = v0[62];
    uint64_t v121 = v0[59];
    v117[2] = v119 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v174 + 32))( (unint64_t)v117 + ((*(unsigned __int8 *)(v174 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80))
    + *(void *)(v174 + 72) * v119,
      v120,
      v121);
    v193[0] = v117;
    char v82 = *(_BYTE *)(v166 + 32);
    unint64_t v83 = 1LL << v82;
    if (v189 >= 1LL << v82) {
      goto LABEL_118;
    }
    uint64_t v81 = v162;
    unint64_t v122 = v183;
    uint64_t v123 = *(void *)(v162 + 8 * v183);
    if ((v123 & v180) == 0) {
      goto LABEL_119;
    }
    int v79 = v160;
    if (*(_DWORD *)(v166 + 36) != v160) {
      goto LABEL_120;
    }
    unint64_t v124 = v123 & (-2LL << (v189 & 0x3F));
    if (v124)
    {
      unint64_t v83 = __clz(__rbit64(v124)) | v189 & 0xFFFFFFFFFFFFFFC0LL;
      uint64_t v84 = v177;
    }

    else
    {
      unint64_t v125 = v183 + 1;
      unint64_t v126 = (v83 + 63) >> 6;
      uint64_t v84 = v177;
      if (v183 + 1 < v126)
      {
        unint64_t v127 = *(void *)(v162 + 8 * v125);
        if (v127)
        {
LABEL_101:
          unint64_t v83 = __clz(__rbit64(v127)) + (v125 << 6);
        }

        else
        {
          while (v126 - 2 != v122)
          {
            unint64_t v127 = *(void *)(v170 + 8 * v122++);
            if (v127)
            {
              unint64_t v125 = v122 + 1;
              goto LABEL_101;
            }
          }
        }
      }
    }

    uint64_t v80 = v84 + 1;
    unint64_t v78 = v83;
    if (v80 == v164)
    {
      swift_bridgeObjectRelease(v166);
      goto LABEL_104;
    }
  }

  uint64_t v96 = v94 + ((*(unsigned __int8 *)(v174 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80));
  uint64_t v172 = *(void *)(v90 + *(int *)(v168 + 48));
  __n128 v97 = swift_bridgeObjectRetain(v94);
  uint64_t v98 = *(void *)(v174 + 72);
  uint64_t v99 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v174 + 16);
  uint64_t v100 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v101 = v191[61];
    uint64_t v102 = v191[59];
    uint64_t v103 = v99(v101, v96, v102, v97);
    uint64_t v104 = SessionGroundTruths.groundTruth.getter(v103);
    (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v101, v102);
    uint64_t v105 = *(void *)(v104 + 16);
    int64_t v106 = *((void *)v100 + 2);
    int64_t v107 = v106 + v105;
    if (__OFADD__(v106, v105)) {
      break;
    }
    uint64_t v108 = (char *)swift_isUniquelyReferenced_nonNull_native(v100);
    if ((_DWORD)v108 && v107 <= *((void *)v100 + 3) >> 1)
    {
      if (*(void *)(v104 + 16)) {
        goto LABEL_77;
      }
    }

    else
    {
      if (v106 <= v107) {
        int64_t v109 = v106 + v105;
      }
      else {
        int64_t v109 = v106;
      }
      uint64_t v100 = sub_26054(v108, v109, 1, v100);
      if (*(void *)(v104 + 16))
      {
LABEL_77:
        uint64_t v110 = *((void *)v100 + 2);
        if ((*((void *)v100 + 3) >> 1) - v110 < v105) {
          goto LABEL_112;
        }
        unint64_t v111 = (unint64_t)&v100[40 * v110 + 32];
        if (v104 + 32 < v111 + 40 * v105 && v111 < v104 + 32 + 40 * v105) {
          goto LABEL_114;
        }
        sub_4CC0(&qword_38FB0);
        swift_arrayInitWithCopy(v111);
        if (v105)
        {
          uint64_t v113 = *((void *)v100 + 2);
          BOOL v19 = __OFADD__(v113, v105);
          uint64_t v114 = v113 + v105;
          if (v19) {
            goto LABEL_113;
          }
          *((void *)v100 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v114;
        }

        goto LABEL_67;
      }
    }

    if (v105) {
      goto LABEL_111;
    }
LABEL_67:
    swift_bridgeObjectRelease(v104);
    v96 += v98;
    if (!--v95)
    {
      swift_bridgeObjectRelease(v172);
      uint64_t v0 = v191;
      goto LABEL_88;
    }
  }

  __break(1u);
LABEL_111:
  __break(1u);
LABEL_112:
  __break(1u);
LABEL_113:
  __break(1u);
LABEL_114:
  _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
}

  uint64_t v10 = *(void *)(v5 + 16);
  if ((*(void *)(v5 + 24) >> 1) - v10 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v11 = v5 + 40 * v10 + 32;
  if (a1 + 32 < v11 + 40 * v4 && v11 < a1 + 32 + 40 * v4) {
    goto LABEL_21;
  }
  sub_4CC0(a3);
  swift_arrayInitWithCopy(v11);
  if (!v4)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease(a1);
    void *v3 = v5;
    return result;
  }

  int64_t v13 = *(void *)(v5 + 16);
  uint64_t v14 = __OFADD__(v13, v4);
  int64_t v15 = v13 + v4;
  if (!v14)
  {
    *(void *)(v5 + 16) = v15;
    goto LABEL_16;
  }

  uint64_t v10 = *(void *)(v5 + 16);
  uint64_t v11 = (*(void *)(v5 + 24) >> 1) - v10;
  unint64_t v12 = a3(0LL);
  if (v11 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  int64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  int64_t v15 = *(void *)(v13 + 72);
  uint64_t v16 = v5 + v14 + v15 * v10;
  uint64_t v17 = a1 + v14;
  uint64_t v18 = v15 * v4;
  BOOL v19 = v16 + v18;
  uint64_t v20 = v17 + v18;
  if (v17 < v19 && v16 < v20) {
    goto LABEL_21;
  }
  swift_arrayInitWithCopy(v16);
  if (!v4)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease(a1);
    void *v3 = v5;
    return result;
  }

  uint64_t v22 = *(void *)(v5 + 16);
  uint64_t v23 = __OFADD__(v22, v4);
  uint64_t v24 = v22 + v4;
  if (!v23)
  {
    *(void *)(v5 + 16) = v24;
    goto LABEL_16;
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_16074()
{
  uint64_t v1 = v0[121];
  uint64_t v2 = v0[114];
  uint64_t v3 = v0[113];
  v0[45] = v0[122];
  uint64_t v4 = sub_4CC0(&qword_38E00);
  swift_willThrowTypedImpl(v0 + 45, v4, &protocol self-conformance witness table for Error);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v0[42]);
  return swift_task_switch(sub_16108, 0LL, 0LL);
}

uint64_t sub_16108()
{
  uint64_t v1 = *(void *)(v0 + 888);
  uint64_t v2 = *(void *)(v0 + 880);
  uint64_t v3 = *(void *)(v0 + 872);
  uint64_t v4 = *(void *)(v0 + 864);
  uint64_t v5 = *(void *)(v0 + 848);
  uint64_t v6 = *(void *)(v0 + 824);
  uint64_t v7 = *(void *)(v0 + 800);
  uint64_t v8 = *(void *)(v0 + 792);
  uint64_t v9 = *(void *)(v0 + 784);
  uint64_t v11 = *(void *)(v0 + 760);
  uint64_t v12 = *(void *)(v0 + 736);
  uint64_t v13 = *(void *)(v0 + 728);
  uint64_t v14 = *(void *)(v0 + 720);
  uint64_t v15 = *(void *)(v0 + 712);
  uint64_t v16 = *(void *)(v0 + 704);
  uint64_t v17 = *(void *)(v0 + 696);
  uint64_t v18 = *(void *)(v0 + 688);
  uint64_t v19 = *(void *)(v0 + 680);
  uint64_t v20 = *(void *)(v0 + 672);
  uint64_t v21 = *(void *)(v0 + 664);
  uint64_t v22 = *(void *)(v0 + 656);
  uint64_t v23 = *(void *)(v0 + 648);
  uint64_t v24 = *(void *)(v0 + 624);
  uint64_t v25 = *(void *)(v0 + 616);
  uint64_t v26 = *(void *)(v0 + 608);
  uint64_t v28 = *(void *)(v0 + 600);
  uint64_t v30 = *(void *)(v0 + 592);
  uint64_t v32 = *(void *)(v0 + 568);
  uint64_t v27 = *(void *)(v0 + 560);
  uint64_t v29 = *(void *)(v0 + 552);
  uint64_t v31 = *(void *)(v0 + 528);
  uint64_t v33 = *(void *)(v0 + 520);
  uint64_t v34 = *(void *)(v0 + 496);
  uint64_t v35 = *(void *)(v0 + 488);
  uint64_t v36 = *(void *)(v0 + 464);
  uint64_t v37 = *(void *)(v0 + 456);
  uint64_t v38 = *(void *)(v0 + 448);
  uint64_t v39 = *(void *)(v0 + 440);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 840) + 8LL))(v5, *(void *)(v0 + 832));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v30);
  swift_task_dealloc(v32);
  swift_task_dealloc(v27);
  swift_task_dealloc(v29);
  swift_task_dealloc(v31);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_16378(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 1008);
  *(void *)(*v2 + 1016) = v1;
  swift_task_dealloc(v5);
  uint64_t v6 = *(void *)(v4 + 680);
  if (v1)
  {
    sub_845C(v6, &qword_39680);
    uint64_t v7 = sub_17A04;
  }

  else
  {
    *(void *)(v4 + 102_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = a1;
    sub_845C(v6, &qword_39680);
    uint64_t v7 = sub_16408;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_16408()
{
  uint64_t v2 = (void *)v0[128];
  uint64_t v3 = v0[125];
  if (v2)
  {
    uint64_t v4 = v0[84];
    uint64_t v5 = (void *)v0[83];
    swift_bridgeObjectRelease(v3);
    v0[38] = 0LL;
    v0[39] = 0LL;
    v0[37] = v2;
    uint64_t v195 = v2;
    swift_bridgeObjectRetain(v2);
    sub_17E24(v5);
    sub_4D00((uint64_t)v5, v4, &qword_39728);
    uint64_t v6 = sub_4CC0(&qword_397B0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(v4, 1LL, v6) != 1)
    {
      uint64_t v27 = v0 + 2;
      uint64_t v205 = (uint64_t)(v0 + 7);
      uint64_t v222 = (uint64_t)(v0 + 17);
      uint64_t v12 = v0 + 22;
      uint64_t v194 = v0 + 46;
      uint64_t v198 = v0 + 48;
      uint64_t v199 = v0 + 47;
      uint64_t v202 = *(void (**)(uint64_t, char *, uint64_t))(v0[80] + 32LL);
      uint64_t v196 = v0 + 50;
      v197 = v0 + 49;
      uint64_t v207 = v0 + 2;
LABEL_9:
      uint64_t v32 = (uint64_t *)v0[84];
      uint64_t v33 = v0[82];
      uint64_t v34 = v0[81];
      uint64_t v35 = v219[80];
      uint64_t v36 = v219[79];
      uint64_t v37 = *v32;
      v202(v33, (char *)v32 + *(int *)(v6 + 48), v36);
      uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
      uint64_t v39 = v219;
      uint64_t v40 = v38(v34, v33, v36);
      uint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
      os_log_type_t v42 = static os_log_type_t.debug.getter();
      uint64_t v206 = v37;
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v6 = v219[78];
        uint64_t v203 = v219[73];
        uint64_t v201 = v219[72];
        uint64_t v212 = v219[79];
        uint64_t v200 = v219[81];
        uint64_t v210 = v219[80];
        uint64_t v43 = swift_slowAlloc(32LL, -1LL);
        uint64_t v216 = swift_slowAlloc(64LL, -1LL);
        v226[0] = v216;
        *(_DWORD *)uint64_t v43 = 136315650;
        os_log_type_t v208 = v42;
        uint64_t v44 = qword_394A0;
        unint64_t v45 = qword_394A8;
        swift_bridgeObjectRetain(qword_394A8);
        v219[47] = sub_28A50(v44, v45, v226);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v199, v198, v43 + 4, v43 + 12);
        swift_bridgeObjectRelease(v45);
        *(_WORD *)(v43 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
        v219[48] = v37;
        uint64_t v46 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v198, v197, v43 + 14, v43 + 22);
        *(_WORD *)(v43 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
        FeaturisedTurn.turnId.getter(v46);
        uint64_t v47 = sub_8518( &qword_397B8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter(v201, v47);
        uint64_t v1 = v49;
        uint64_t v27 = v207;
        (*(void (**)(uint64_t, uint64_t))(v203 + 8))(v6, v201);
        v219[49] = sub_28A50(v48, (unint64_t)v1, v226);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v197, v196, v43 + 24, v43 + 32);
        swift_bridgeObjectRelease(v1);
        uint64_t v204 = *(void (**)(uint64_t, uint64_t))(v210 + 8);
        v204(v200, v212);
        _os_log_impl(&dword_0, v41, v208, "%s Turn %ld (%s) Features:", (uint8_t *)v43, 0x20u);
        swift_arrayDestroy(v216, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v216, -1LL, -1LL);
        swift_slowDealloc(v43, -1LL, -1LL);
      }

      else
      {
        uint64_t v204 = *(void (**)(uint64_t, uint64_t))(v219[80] + 8LL);
        v204(v219[81], v219[79]);
      }

      uint64_t v50 = FeaturisedTurn.features.getter();
      uint64_t v51 = *(void *)(v50 + 16);
      if (v51)
      {
        uint64_t v52 = v50 + 32;
        uint64_t v53 = qword_38C28;
        uint64_t v217 = v50;
        swift_bridgeObjectRetain(v50);
        if (v53 != -1) {
          swift_once(&qword_38C28, sub_EB6C);
        }
        do
        {
          sub_7D04(v219[115], (uint64_t)qword_392D8);
          uint64_t v54 = sub_8120(v52, (uint64_t)v27);
          unint64_t v55 = (os_log_s *)Logger.logObject.getter(v54);
          os_log_type_t v56 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v55, v56))
          {
            uint64_t v6 = swift_slowAlloc(22LL, -1LL);
            uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc(64LL, -1LL);
            v226[0] = (uint64_t)v1;
            *(_DWORD *)uint64_t v6 = 136315394;
            *(void *)(v6 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(8224LL, 0xE200000000000000LL, v226);
            *(_WORD *)(v6 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
            sub_8120((uint64_t)v27, v205);
            uint64_t v57 = sub_4CC0(&qword_396E0);
            uint64_t v58 = String.init<A>(describing:)(v205, v57);
            unint64_t v60 = v59;
            *(void *)(v6 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v58, v59, v226);
            swift_bridgeObjectRelease(v60);
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v27);
            _os_log_impl(&dword_0, v55, v56, "%s%s", (uint8_t *)v6, 0x16u);
            swift_arrayDestroy(v1, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v1, -1LL, -1LL);
            swift_slowDealloc(v6, -1LL, -1LL);
          }

          else
          {

            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v27);
          }

          v52 += 40LL;
          --v51;
        }

        while (v51);
        uint64_t v61 = swift_bridgeObjectRelease_n(v217, 2LL);
      }

      else
      {
        uint64_t v62 = v50;
        if (qword_38C28 != -1) {
          swift_once(&qword_38C28, sub_EB6C);
        }
        uint64_t v63 = sub_7D04(v219[115], (uint64_t)qword_392D8);
        uint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
        os_log_type_t v65 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v64, v65))
        {
          uint64_t v6 = swift_slowAlloc(12LL, -1LL);
          uint64_t v66 = swift_slowAlloc(32LL, -1LL);
          v226[0] = v66;
          *(_DWORD *)uint64_t v6 = 136315138;
          uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))(v6 + 12);
          *uint64_t v194 = sub_28A50(8224LL, 0xE200000000000000LL, v226);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v194, v199, v6 + 4, v6 + 12);
          _os_log_impl(&dword_0, v64, v65, "%s<Empty>", (uint8_t *)v6, 0xCu);
          swift_arrayDestroy(v66, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v66, -1LL, -1LL);
          swift_slowDealloc(v6, -1LL, -1LL);
        }

        swift_bridgeObjectRelease(v62);
      }

      uint64_t v67 = FeaturisedTurn.coreDuetEvents.getter(v61);
      unint64_t v69 = 0LL;
      uint64_t v70 = *(char **)(v67 + 16);
      v209 = v70;
      uint64_t v211 = v67;
      while (1)
      {
        if ((char *)v69 == v70)
        {
          (*(void (**)(void, uint64_t, uint64_t, void))(v39[68] + 56LL))(v39[70], 1LL, 1LL, v39[67]);
          uint64_t v71 = v70;
        }

        else
        {
          if ((v69 & 0x8000000000000000LL) != 0)
          {
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            unint64_t v68 = sub_26708(0, *(void *)(v68 + 16) + 1LL, 1, v68);
LABEL_50:
            unint64_t v127 = *(void *)(v68 + 16);
            unint64_t v126 = *(void *)(v68 + 24);
            if (v127 >= v126 >> 1) {
              unint64_t v68 = sub_26708(v126 > 1, v127 + 1, 1, v68);
            }
            uint64_t v128 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v219[123];
            uint64_t v129 = v219[88];
            uint64_t v130 = v219[76];
            uint64_t v131 = v219[73];
            uint64_t v132 = v219[72];
            *(void *)(v68 + 16) = v127 + 1;
            unint64_t v224 = v68;
            ((void (*)(unint64_t, uint64_t, uint64_t))v6)( v68 + ((*(unsigned __int8 *)(v131 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80))
            + *(void *)(v131 + 72) * v127,
              v130,
              v132);
            Array<A>.getOriginalPlusId()(v12);
            if (v128(v129, 1LL, v132) == 1)
            {
              uint64_t v133 = v219[88];
              (*(void (**)(void, void))(v219[73] + 8LL))(v219[77], v219[72]);
              uint64_t v13 = sub_845C(v133, &qword_38F80);
              uint64_t v14 = v219;
            }

            else
            {
              uint64_t v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v219[123];
              uint64_t v143 = v219[87];
              uint64_t v144 = v219[77];
              uint64_t v145 = v219[75];
              uint64_t v146 = v219[74];
              uint64_t v147 = v219[73];
              uint64_t v148 = v219[72];
              ((void (*)(uint64_t, void, uint64_t))v6)(v145, v219[88], v148);
              v1(v146, v144, v148);
              v1(v143, v145, v148);
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v147 + 56))(v143, 0LL, 1LL, v148);
              int v149 = v142(v143, 1LL, v148);
              uint64_t v150 = v219[74];
              uint64_t v151 = v219[73];
              uint64_t v152 = v219[72];
              if (v149 == 1)
              {
                uint64_t v153 = v219[86];
                sub_845C(v219[87], &qword_38F80);
                sub_1D8C8(v150, v153);
                uint64_t v154 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
                v154(v150, v152);
                sub_845C(v153, &qword_38F80);
              }

              else
              {
                uint64_t v155 = v219[78];
                ((void (*)(uint64_t, void, void))v6)(v155, v219[87], v219[72]);
                uint64_t v156 = v219[42];
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v156);
                v226[0] = v156;
                sub_1FBC8(v155, v150, isUniquelyReferenced_nonNull_native);
                v219[42] = v226[0];
                swift_bridgeObjectRelease(0x8000000000000000LL);
                uint64_t v154 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
                v154(v150, v152);
              }

              uint64_t v158 = v219[77];
              uint64_t v159 = v219[72];
              v154(v219[75], v159);
              uint64_t v13 = ((uint64_t (*)(uint64_t, uint64_t))v154)(v158, v159);
              uint64_t v14 = v219;
              uint64_t v12 = v195;
            }

            uint64_t v7 = (void *)v222;
            goto LABEL_61;
          }

          if (v69 >= *(void *)(v67 + 16)) {
            goto LABEL_75;
          }
          uint64_t v72 = (void (**)(uint64_t, uint64_t, uint64_t))v39[70];
          uint64_t v73 = v39[69];
          uint64_t v74 = v219[68];
          uint64_t v75 = v219[67];
          uint64_t v76 = v219[64];
          uint64_t v77 = v219[63];
          unint64_t v78 = (char *)(v69 + 1);
          uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v69;
          uint64_t v79 = v73 + *(int *)(v75 + 48);
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v76 + 16))( v79,  v67 + ((*(unsigned __int8 *)(v76 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))
          + *(void *)(v76 + 72) * v69,
            v77);
          uint64_t v80 = (char *)v72 + *(int *)(v75 + 48);
          *uint64_t v72 = v1;
          (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v80, v79, v77);
          uint64_t v81 = *(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56);
          uint64_t v39 = v219;
          v81(v72, 0LL, 1LL, v75);
          uint64_t v71 = v78;
        }

        uint64_t v82 = v39[71];
        uint64_t v83 = v39[70];
        uint64_t v84 = v39;
        uint64_t v85 = v39[68];
        uint64_t v86 = v84[67];
        sub_4D00(v83, v82, &qword_39720);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v82, 1LL, v86) == 1)
        {
          uint64_t v28 = v84[84];
          uint64_t v29 = (void *)v84[83];
          uint64_t v30 = v84[82];
          uint64_t v31 = v84[79];
          swift_bridgeObjectRelease(v211);
          v204(v30, v31);
          sub_17E24(v29);
          sub_4D00((uint64_t)v29, v28, &qword_39728);
          uint64_t v6 = sub_4CC0(&qword_397B0);
          uint64_t v0 = v84;
          goto LABEL_9;
        }

        uint64_t v218 = (void (*)(void, void, void))v71;
        uint64_t v87 = (char *)v84[71];
        uint64_t v88 = v84[66];
        uint64_t v6 = v84[65];
        uint64_t v90 = v84[63];
        uint64_t v89 = v84[64];
        uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))v87;
        (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v88, &v87[*(int *)(v84[67] + 48LL)], v90);
        uint64_t v91 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v89 + 16))(v6, v88, v90);
        unint64_t v92 = (os_log_s *)Logger.logObject.getter(v91);
        os_log_type_t v93 = static os_log_type_t.debug.getter();
        BOOL v94 = os_log_type_enabled(v92, v93);
        uint64_t v95 = v84[65];
        uint64_t v97 = v84[63];
        uint64_t v96 = v84[64];
        if (v94)
        {
          uint64_t v6 = swift_slowAlloc(42LL, -1LL);
          v213 = v1;
          uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc(64LL, -1LL);
          v226[0] = (uint64_t)v1;
          *(_DWORD *)uint64_t v6 = 136315906;
          uint64_t v99 = qword_394A0;
          unint64_t v98 = qword_394A8;
          swift_bridgeObjectRetain(qword_394A8);
          *(void *)(v6 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v99, v98, v226);
          uint64_t v100 = swift_bridgeObjectRelease(v98);
          *(_WORD *)(v6 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
          *(void *)(v6 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v206;
          *(_WORD *)(v6 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
          *(void *)(v6 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v213;
          *(_WORD *)(v6 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
          uint64_t v101 = CoreDuetEvent.eventId.getter(v100);
          unint64_t v103 = v102;
          *(void *)(v6 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v101, v102, v226);
          swift_bridgeObjectRelease(v103);
          uint64_t v214 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
          v214(v95, v97);
          _os_log_impl(&dword_0, v92, v93, "%s Turn %ld, Event %ld (%s) Features:", (uint8_t *)v6, 0x2Au);
          swift_arrayDestroy(v1, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v1, -1LL, -1LL);
          swift_slowDealloc(v6, -1LL, -1LL);
        }

        else
        {
          uint64_t v214 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
          v214(v84[65], v84[63]);
        }

        uint64_t v39 = v219;
        uint64_t v104 = CoreDuetEvent.features.getter();
        uint64_t v105 = v104;
        uint64_t v106 = *(void *)(v104 + 16);
        if (v106)
        {
          uint64_t v107 = v104 + 32;
          uint64_t v108 = qword_38C28;
          swift_bridgeObjectRetain(v104);
          if (v108 != -1) {
            swift_once(&qword_38C28, sub_EB6C);
          }
          do
          {
            sub_7D04(v219[115], (uint64_t)qword_392D8);
            uint64_t v109 = sub_8120(v107, (uint64_t)v12);
            uint64_t v110 = (os_log_s *)Logger.logObject.getter(v109);
            os_log_type_t v111 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v110, v111))
            {
              uint64_t v6 = swift_slowAlloc(22LL, -1LL);
              uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc(64LL, -1LL);
              v226[0] = (uint64_t)v1;
              *(_DWORD *)uint64_t v6 = 136315394;
              *(void *)(v6 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(8224LL, 0xE200000000000000LL, v226);
              *(_WORD *)(v6 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
              sub_8120((uint64_t)v12, v222);
              uint64_t v112 = sub_4CC0(&qword_396E0);
              uint64_t v113 = String.init<A>(describing:)(v222, v112);
              unint64_t v115 = v114;
              *(void *)(v6 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v113, v114, v226);
              swift_bridgeObjectRelease(v115);
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v12);
              _os_log_impl(&dword_0, v110, v111, "%s%s", (uint8_t *)v6, 0x16u);
              swift_arrayDestroy(v1, 2LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v1, -1LL, -1LL);
              swift_slowDealloc(v6, -1LL, -1LL);
            }

            else
            {

              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v12);
            }

            v107 += 40LL;
            --v106;
          }

          while (v106);
          swift_bridgeObjectRelease_n(v105, 2LL);
          uint64_t v27 = v207;
        }

        else
        {
          if (qword_38C28 != -1) {
            swift_once(&qword_38C28, sub_EB6C);
          }
          uint64_t v116 = sub_7D04(v219[115], (uint64_t)qword_392D8);
          uint64_t v117 = (os_log_s *)Logger.logObject.getter(v116);
          os_log_type_t v118 = static os_log_type_t.debug.getter();
          uint64_t v27 = v207;
          if (os_log_type_enabled(v117, v118))
          {
            uint64_t v6 = swift_slowAlloc(12LL, -1LL);
            uint64_t v119 = swift_slowAlloc(32LL, -1LL);
            v226[0] = v119;
            *(_DWORD *)uint64_t v6 = 136315138;
            *(void *)(v6 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(8224LL, 0xE200000000000000LL, v226);
            _os_log_impl(&dword_0, v117, v118, "%s<Empty>", (uint8_t *)v6, 0xCu);
            swift_arrayDestroy(v119, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v119, -1LL, -1LL);
            swift_slowDealloc(v6, -1LL, -1LL);
          }

          swift_bridgeObjectRelease(v105);
        }

        v214(v219[66], v219[63]);
        uint64_t v70 = v209;
        uint64_t v67 = v211;
        unint64_t v69 = (unint64_t)v218;
      }
    }

    uint64_t v7 = v0 + 42;
    uint64_t v8 = v0;
    uint64_t v9 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[123];
    uint64_t v10 = v8[89];
    uint64_t v11 = v8[72];
    swift_bridgeObjectRelease(v8[37]);
    uint64_t v12 = v195;
    Array<A>.getSessionId()(v195);
    if (v9(v10, 1LL, v11) != 1)
    {
      uint64_t v222 = (uint64_t)v7;
      uint64_t v120 = v8[117];
      uint64_t v121 = v8[77];
      uint64_t v122 = v8[76];
      uint64_t v123 = v8[73];
      uint64_t v124 = v8[72];
      uint64_t v6 = *(void *)(v123 + 32);
      ((void (*)(uint64_t, void, uint64_t))v6)(v121, v8[89], v124);
      uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v123 + 16);
      v1(v122, v121, v124);
      char v125 = swift_isUniquelyReferenced_nonNull_native(v120);
      unint64_t v68 = v8[117];
      if ((v125 & 1) == 0) {
        goto LABEL_76;
      }
      goto LABEL_50;
    }

    uint64_t v13 = sub_845C(v8[89], &qword_38F80);
    unint64_t v224 = v8[117];
    uint64_t v14 = v8;
LABEL_61:
    int v160 = v14 + 41;
    uint64_t v161 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v162 = static os_log_type_t.debug.getter();
    v223 = v14 + 41;
    if (os_log_type_enabled(v161, v162))
    {
      uint64_t v163 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v164 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v163 = 136315138;
      uint64_t v14 = v219;
      v226[0] = v164;
      uint64_t v166 = qword_394A0;
      unint64_t v165 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      uint64_t *v160 = sub_28A50(v166, v165, v226);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v160, v7, v163 + 4, v163 + 12);
      swift_bridgeObjectRelease(v165);
      _os_log_impl(&dword_0, v161, v162, "%s Running evaluation frameworks on extracted features", v163, 0xCu);
      swift_arrayDestroy(v164, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v167 = v164;
      uint64_t v12 = v195;
      swift_slowDealloc(v167, -1LL, -1LL);
      swift_slowDealloc(v163, -1LL, -1LL);
    }

    uint64_t v168 = v14[113];
    uint64_t v169 = v14;
    uint64_t v170 = *(void *)(v168 + 16);
    if (v170)
    {
      swift_bridgeObjectRetain(v168);
      uint64_t v171 = 32LL;
      do
      {
        sub_8120(v169[113] + v171, (uint64_t)(v169 + 32));
        uint64_t v172 = v169[35];
        uint64_t v173 = v169[36];
        sub_8164(v169 + 32, v172);
        dispatch thunk of EvaluationFramework.evaluateSession(session:)(v12, v172, v173);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v169 + 32);
        v171 += 40LL;
        --v170;
      }

      while (v170);
      uint64_t v168 = swift_bridgeObjectRelease(v169[113]);
    }

    uint64_t v174 = (os_log_s *)Logger.logObject.getter(v168);
    os_log_type_t v175 = static os_log_type_t.debug.getter();
    uint64_t v176 = v169;
    if (os_log_type_enabled(v174, v175))
    {
      uint64_t v177 = v169 + 40;
      uint64_t v178 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v179 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v178 = 136315138;
      uint64_t v176 = v219;
      v226[0] = v179;
      uint64_t v181 = qword_394A0;
      unint64_t v180 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      *uint64_t v177 = sub_28A50(v181, v180, v226);
      uint64_t v12 = v195;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v177, v223, v178 + 4, v178 + 12);
      swift_bridgeObjectRelease(v180);
      _os_log_impl(&dword_0, v174, v175, "%s Running ground truth generators on extracted features", v178, 0xCu);
      swift_arrayDestroy(v179, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v179, -1LL, -1LL);
      swift_slowDealloc(v178, -1LL, -1LL);
    }

    uint64_t v182 = v176[114];
    unint64_t v183 = v176;
    uint64_t v184 = *(void *)(v182 + 16);
    if (v184)
    {
      swift_bridgeObjectRetain(v182);
      uint64_t v185 = 32LL;
      do
      {
        sub_8120(v183[114] + v185, (uint64_t)(v183 + 27));
        uint64_t v186 = v183[30];
        uint64_t v187 = v183[31];
        sub_8164(v183 + 27, v186);
        dispatch thunk of SessionReviewer.reviewSession(session:)(v12, v186, *(void *)(v187 + 8));
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v183 + 27);
        v185 += 40LL;
        --v184;
      }

      while (v184);
      swift_bridgeObjectRelease(v183[114]);
    }

    uint64_t v188 = v183[99];
    uint64_t v189 = v183[95];
    uint64_t v190 = v183[94];
    uint64_t v191 = v183[93];
    uint64_t v192 = v183[92];
    swift_bridgeObjectRelease(v12);
    sub_845C(v192, &qword_39730);
    (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v189, v191);
    sub_845C(v188, &qword_39738);
    v183[130] = v224;
    uint64_t v193 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    v183[131] = v193;
    *uint64_t v193 = v183;
    v193[1] = sub_17990;
    return dispatch thunk of AsyncIteratorProtocol.next()(v183[100], v183[104], v183[118]);
  }

  else
  {
    swift_bridgeObjectRetain(v3);
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.error.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    unint64_t v19 = v0[125];
    if (v18)
    {
      uint64_t v20 = v0[124];
      uint64_t v221 = v0[95];
      uint64_t v225 = v0[99];
      uint64_t v215 = v0[94];
      uint64_t v220 = v0[93];
      uint64_t v21 = v0[92];
      uint64_t v22 = swift_slowAlloc(22LL, -1LL);
      uint64_t v23 = swift_slowAlloc(64LL, -1LL);
      v226[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315394;
      uint64_t v24 = qword_394A0;
      unint64_t v25 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      *(void *)(v22 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v24, v25, v226);
      swift_bridgeObjectRelease(v25);
      *(_WORD *)(v22 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      swift_bridgeObjectRetain(v19);
      *(void *)(v22 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v20, v19, v226);
      swift_bridgeObjectRelease_n(v19, 3LL);
      _os_log_impl( &dword_0,  v16,  v17,  "%s Failed to generate a featurised session for conversationId=%s",  (uint8_t *)v22,  0x16u);
      swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);

      sub_845C(v21, &qword_39730);
      (*(void (**)(uint64_t, uint64_t))(v215 + 8))(v221, v220);
      uint64_t v26 = v225;
    }

    else
    {
      uint64_t v134 = v0[99];
      uint64_t v135 = v0[95];
      uint64_t v136 = v219[94];
      uint64_t v137 = v219[93];
      uint64_t v138 = v219[92];
      swift_bridgeObjectRelease_n(v19, 2LL);

      sub_845C(v138, &qword_39730);
      uint64_t v139 = *(void (**)(uint64_t, uint64_t))(v136 + 8);
      uint64_t v0 = v219;
      v139(v135, v137);
      uint64_t v26 = v134;
    }

    sub_845C(v26, &qword_39738);
    uint64_t v140 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    v0[129] = v140;
    void *v140 = v0;
    v140[1] = sub_17920;
    return dispatch thunk of AsyncIteratorProtocol.next()(v0[100], v0[104], v0[118]);
  }

uint64_t sub_17920()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 1032LL));
  if (v0)
  {
    uint64_t v3 = v2[117];
    v2[122] = v0;
    v2[121] = v3;
    uint64_t v4 = sub_16074;
  }

  else
  {
    v2[120] = 0LL;
    uint64_t v4 = sub_15160;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_17990()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 1048LL));
  uint64_t v3 = v2[130];
  if (v0)
  {
    v2[122] = v0;
    v2[121] = v3;
    uint64_t v4 = sub_16074;
  }

  else
  {
    v2[117] = v3;
    v2[120] = 0LL;
    uint64_t v4 = sub_15160;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_17A04()
{
  uint64_t v1 = v0[127];
  uint64_t v2 = v0[125];
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = v0[127];
    unint64_t v7 = v0[125];
    uint64_t v8 = v0[124];
    uint64_t v30 = v0[95];
    uint64_t v31 = v0[99];
    uint64_t v28 = v0[94];
    uint64_t v29 = v0[93];
    uint64_t v27 = v0[92];
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v10 = swift_slowAlloc(96LL, -1LL);
    uint64_t v32 = v10;
    *(_DWORD *)uint64_t v9 = 136315650;
    uint64_t v12 = qword_394A0;
    unint64_t v11 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    *(void *)(v9 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v12, v11, &v32);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v9 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    swift_bridgeObjectRetain(v7);
    *(void *)(v9 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v8, v7, &v32);
    swift_bridgeObjectRelease_n(v7, 3LL);
    *(_WORD *)(v9 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    v0[43] = v6;
    swift_errorRetain(v6);
    uint64_t v13 = sub_4CC0(&qword_38E00);
    uint64_t v14 = String.init<A>(describing:)(v0 + 43, v13);
    unint64_t v16 = v15;
    *(void *)(v9 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v14, v15, &v32);
    swift_bridgeObjectRelease(v16);
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl( &dword_0,  v4,  v5,  "%s Error generating features for conversationId=%s. Skipping ground truth generation. Error=%s",  (uint8_t *)v9,  0x20u);
    swift_arrayDestroy(v10, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    swift_errorRelease(v6);
    sub_845C(v27, &qword_39730);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
    uint64_t v17 = v31;
  }

  else
  {
    uint64_t v18 = v0[127];
    uint64_t v19 = v0[125];
    uint64_t v20 = v0[99];
    uint64_t v21 = v0[95];
    uint64_t v22 = v0[94];
    uint64_t v23 = v0[93];
    uint64_t v24 = v0[92];

    swift_errorRelease(v18);
    swift_errorRelease(v18);
    swift_bridgeObjectRelease_n(v19, 2LL);
    swift_errorRelease(v18);
    sub_845C(v24, &qword_39730);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    uint64_t v17 = v20;
  }

  sub_845C(v17, &qword_39738);
  v0[130] = v0[117];
  unint64_t v25 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[131] = v25;
  *unint64_t v25 = v0;
  v25[1] = sub_17990;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[100], v0[104], v0[118]);
}

uint64_t sub_17CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_17D04, 0LL, 0LL);
}

uint64_t sub_17D04()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 40);
    uint64_t v3 = v2[26];
    uint64_t v4 = v2[27];
    sub_8164(v2 + 23, v3);
    id v5 = v1;
    dispatch thunk of StreamBookmarkStore.write(bookmark:)(v5, v3, v4);
  }

  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v8 = type metadata accessor for Conversation(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16LL))(v6, v7, v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_17D90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + *(int *)(sub_4CC0(&qword_397E8) + 48));
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_8558;
  return v10(a1, a2, v7);
}

uint64_t sub_17E24@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_4CC0(&qword_397B0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v1;
  unint64_t v8 = v1[1];
  unint64_t v10 = *(void *)(*v1 + 16LL);
  if (v8 == v10) {
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v4 + 56))(a1, 1LL, 1LL, v3);
  }
  if (v8 >= v10)
  {
    __break(1u);
  }

  else
  {
    uint64_t v11 = type metadata accessor for FeaturisedTurn(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    unint64_t v13 = v9
    v1[1] = v8 + 1;
    uint64_t v14 = &v7[*(int *)(v3 + 48)];
    uint64_t v15 = v1[2];
    uint64_t result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v12 + 16))(v14, v13, v11);
    if (!__OFADD__(v15, 1LL))
    {
      v1[2] = v15 + 1;
      unint64_t v16 = (char *)a1 + *(int *)(v3 + 48);
      *a1 = v15;
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v16, v14, v11);
      return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v4 + 56))(a1, 0LL, 1LL, v3);
    }
  }

  __break(1u);
  return result;
}

void *sub_17F7C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4CC0(&qword_397C0);
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v7);
  uint64_t v54 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v55 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v51 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = sub_4CC0(&qword_397C8);
  uint64_t v11 = __chkstk_darwin(v50);
  uint64_t v49 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v48 = (void *)((char *)v41 - v14);
  __chkstk_darwin(v13);
  uint64_t v47 = (void *)((char *)v41 - v15);
  os_log_type_t v56 = &_swiftEmptyArrayStorage;
  sub_2A790(0, 0LL, 0);
  uint64_t v16 = *(void *)(a1 + 16);
  __n128 v17 = swift_bridgeObjectRetain(a1);
  uint64_t v46 = v16;
  v41[0] = a1;
  v41[1] = v2;
  if (v16)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v20 = *(void *)(v9 + 72);
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v9 + 16);
    unint64_t v45 = v6;
    uint64_t v22 = v9;
    uint64_t v23 = v55;
    uint64_t v43 = v20;
    uint64_t v44 = v22;
    while (1)
    {
      uint64_t v24 = (uint64_t)v54;
      v21(v54, v19, v23, v17);
      os_log_type_t v42 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56);
      v42(v24, 0LL, 1LL, v23);
      unint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 32);
      uint64_t v26 = v51;
      v25(v51, v24, v23);
      uint64_t v27 = v21;
      uint64_t v28 = v50;
      uint64_t v29 = &v49[*(int *)(v50 + 48)];
      v25(v29, (uint64_t)v26, v55);
      uint64_t v30 = v48;
      uint64_t v31 = (char *)v48 + *(int *)(v28 + 48);
      *uint64_t v48 = v18;
      v25(v31, (uint64_t)v29, v55);
      uint64_t v32 = (uint64_t)v30;
      uint64_t v33 = v47;
      sub_4D00(v32, (uint64_t)v47, &qword_397C8);
      uint64_t v34 = *v33;
      uint64_t v35 = *(int *)(v28 + 48);
      uint64_t v21 = v27;
      uint64_t v23 = v55;
      uint64_t v36 = *(int *)(v53 + 48);
      ((void (*)(char *, char *, uint64_t))v21)(v6, (char *)v33 + v35, v55);
      *(void *)&v6[v36] = v34;
      sub_845C((uint64_t)v33, &qword_397C8);
      uint64_t v37 = v56;
      if ((swift_isUniquelyReferenced_nonNull_native(v56) & 1) == 0)
      {
        sub_2A790(0, v37[2] + 1LL, 1);
        uint64_t v37 = v56;
      }

      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1)
      {
        sub_2A790(v38 > 1, v39 + 1, 1);
        uint64_t v37 = v56;
      }

      ++v18;
      v37[2] = v39 + 1;
      uint64_t v6 = v45;
      sub_4D00( (uint64_t)v45,  (uint64_t)v37 + ((*(unsigned __int8 *)(v52 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))
      + *(void *)(v52 + 72) * v39,
        &qword_397C0);
      uint64_t v22 = v44;
      v19 += v43;
      if (v46 == v18)
      {
        uint64_t v24 = (uint64_t)v54;
        ((void (*)(char *, uint64_t, uint64_t, uint64_t, __n128))v42)(v54, 1LL, 1LL, v23, v17);
        break;
      }
    }
  }

  else
  {
    uint64_t v24 = (uint64_t)v54;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v9 + 56))(v54, 1LL, 1LL, v55, v17);
  }

  sub_845C(v24, &qword_38F80);
  swift_bridgeObjectRelease(v41[0]);
  return v56;
}

uint64_t sub_18344@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = (uint64_t)(v1 + 2);
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  sub_8164(v1 + 2, v8);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(v36, v8, v9);
  uint64_t v10 = v37;
  uint64_t v11 = v38;
  sub_8164(v36, v37);
  uint64_t v12 = static InferenceFeatures.AdaptivePICSGeneration.getter();
  v35[2] = type metadata accessor for AnyFeature(0LL);
  v35[3] = &protocol witness table for AnyFeature;
  uint64_t v34 = v12;
  int v13 = dispatch thunk of FeatureManaging.isActive(_:)(&v34, v10, v11);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v34);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v36);
  if (qword_38C38 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v14 = sub_7D04(v3, (uint64_t)qword_394B0);
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v14, v3);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v30 = v4;
    int v31 = v13;
    uint64_t v32 = v7;
    uint64_t v33 = a1;
    uint64_t v18 = swift_slowAlloc(22LL, -1LL);
    uint64_t v19 = swift_slowAlloc(64LL, -1LL);
    v36[0] = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v20 = qword_394A0;
    unint64_t v21 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    uint64_t v34 = sub_28A50(v20, v21, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v18 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    char v22 = v31;
    if ((v31 & 1) != 0) {
      uint64_t v23 = 0x6576697470616441LL;
    }
    else {
      uint64_t v23 = 0x73656C6574617453LL;
    }
    if ((v31 & 1) != 0) {
      unint64_t v24 = 0xE800000000000000LL;
    }
    else {
      unint64_t v24 = 0xE900000000000073LL;
    }
    uint64_t v34 = sub_28A50(v23, v24, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v18 + 14, v18 + 22);
    swift_bridgeObjectRelease(v24);
    _os_log_impl(&dword_0, v16, v17, "%s Running %s PICS Generation", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v19, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v3);
    uint64_t v7 = v32;
    a1 = v33;
    if ((v22 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v25 = swift_allocObject(&unk_35820, 56LL, 7LL);
    uint64_t v26 = v25 + 16;
    uint64_t v27 = &off_35C58;
    uint64_t v28 = &type metadata for AdaptiveContactSuggestionGeneratorWrapper;
    goto LABEL_16;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if ((v13 & 1) != 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v25 = swift_allocObject(&unk_357F8, 56LL, 7LL);
  uint64_t v26 = v25 + 16;
  uint64_t v27 = (char **)&off_358E0;
  uint64_t v28 = &type metadata for LegacyContactSuggestionGeneratorWrapper;
LABEL_16:
  uint64_t result = sub_8120(v7, v26);
  a1[3] = (uint64_t)v28;
  a1[4] = (uint64_t)v27;
  *a1 = v25;
  return result;
}

uint64_t sub_186D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t)(v1 + 2);
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  sub_8164(v1 + 2, v4);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(&v12, v4, v5);
  uint64_t v6 = *((void *)&v13 + 1);
  uint64_t v7 = v14;
  sub_8164(&v12, *((uint64_t *)&v13 + 1));
  uint64_t v8 = static InferenceFeatures.PIMSShadowLogging.getter();
  v16[3] = type metadata accessor for AnyFeature(0LL);
  v16[4] = &protocol witness table for AnyFeature;
  v16[0] = v8;
  char v9 = dispatch thunk of FeatureManaging.isActive(_:)(v16, v6, v7);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v16);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v12);
  if ((v9 & 1) != 0)
  {
    sub_8120(v3, (uint64_t)&v13);
    *(void *)&__int128 v12 = 0xD000000000000020LL;
    *((void *)&v12 + 1) = 0x80000000000304D0LL;
    *(void *)(a1 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = &type metadata for AdaptiveMediaSuggestionGeneratorWrapper;
    *(void *)(a1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = &off_356D0;
    uint64_t result = swift_allocObject(&unk_357D0, 72LL, 7LL);
    __int128 v11 = v13;
    *(_OWORD *)(result + 16) = v12;
    *(_OWORD *)(result + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v11;
    *(_OWORD *)(result + 48) = v14;
    *(void *)(result + 6_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v15;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)(a1 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
  }

  *(void *)a1 = result;
  return result;
}

uint64_t sub_1881C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v5);
  uint64_t v50 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v49 = type metadata accessor for UUID(0LL);
  uint64_t v51 = *(void *)(v49 - 8);
  uint64_t v7 = __chkstk_darwin(v49);
  uint64_t v46 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  __int128 v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = v2[5];
  uint64_t v16 = v2[6];
  uint64_t v47 = v2;
  unint64_t v45 = v2 + 2;
  sub_8164(v2 + 2, v15);
  dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v52, v15, v16);
  uint64_t v17 = type metadata accessor for PLUSOfflineLogHelpers(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = PLUSOfflineLogHelpers.init(logTarget:)(v52);
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    return swift_release(v18);
  }
  uint64_t v48 = v18;
  uint64_t v20 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v21 = *(void *)(v12 + 72);
  unint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t, __n128))(v12 + 16);
  uint64_t v40 = v21;
  uint64_t v38 = a1;
  __n128 v22 = swift_bridgeObjectRetain(a1);
  uint64_t v43 = v10;
  uint64_t v44 = a2;
  uint64_t v41 = v12;
  uint64_t v42 = v11;
  uint64_t v24 = v49;
  uint64_t v23 = (uint64_t)v50;
  do
  {
    uint64_t v34 = v39(v14, v20, v11, v22);
    SessionGroundTruths.sessionId.getter(v34);
    if (*(void *)(a2 + 16) && (unint64_t v35 = sub_290F8((uint64_t)v10), (v36 & 1) != 0))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v51 + 16))( v50,  *(void *)(a2 + 56) + *(void *)(v51 + 72) * v35,  v49);
      uint64_t v25 = 0LL;
    }

    else
    {
      uint64_t v25 = 1LL;
    }

    uint64_t v26 = v51;
    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56))(v23, v25, 1LL, v24);
    uint64_t v28 = SessionGroundTruths.groundTruth.getter(v27);
    uint64_t v29 = v47[5];
    uint64_t v30 = v47[6];
    sub_8164(v45, v29);
    int v31 = dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v52, v29, v30);
    uint64_t v32 = v46;
    UUID.init()(v31);
    uint64_t v10 = v43;
    dispatch thunk of PLUSOfflineLogHelpers.logSessionGroundTruthDataToSELF(sessionId:originalPlusId:groundTruths:picsStore:plusId:)( v43,  v23,  v28,  v52,  v32);
    swift_bridgeObjectRelease(v28);
    uint64_t v33 = *(void (**)(char *, uint64_t))(v26 + 8);
    v33(v32, v24);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v52);
    sub_845C(v23, &qword_38F80);
    v33(v10, v24);
    uint64_t v11 = v42;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v42);
    v20 += v40;
    --v19;
    a2 = v44;
  }

  while (v19);
  swift_release(v48);
  return swift_bridgeObjectRelease(v38);
}

uint64_t sub_18B30(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = *v2;
  uint64_t v4 = type metadata accessor for EventStreamContext(0LL);
  v3[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[8] = v5;
  void v3[9] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_4CC0(&qword_396F0);
  v3[10] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DateInterval(0LL);
  v3[11] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[12] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[13] = swift_task_alloc(v9);
  v3[14] = swift_task_alloc(v9);
  uint64_t v10 = sub_4CC0(&qword_39680);
  v3[15] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Date(0LL);
  v3[16] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[17] = v12;
  v3[18] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_18C44, 0LL, 0LL);
}

uint64_t sub_18C44()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 120);
  Conversation.getTimestamp()();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v5 = &qword_39680;
LABEL_5:
    sub_845C(v4, v5);
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v16 = *(void *)(v0 + 72);
    uint64_t v15 = *(void *)(v0 + 80);
    swift_task_dealloc(*(void *)(v0 + 144));
    swift_task_dealloc(v13);
    swift_task_dealloc(v12);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  uint64_t v6 = *(char **)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 32);
  (*(void (**)(char *, void, void))(*(void *)(v0 + 136) + 32LL))( v6,  *(void *)(v0 + 120),  *(void *)(v0 + 128));
  sub_193A0(v6, v10, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1LL, v7) == 1)
  {
    uint64_t v11 = *(void *)(v0 + 80);
    (*(void (**)(void, void))(*(void *)(v0 + 136) + 8LL))(*(void *)(v0 + 144), *(void *)(v0 + 128));
    uint64_t v5 = (uint64_t *)&unk_396F0;
    uint64_t v4 = v11;
    goto LABEL_5;
  }

  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v0 + 112);
  (*(void (**)(unsigned int (*)(char *, uint64_t, uint64_t), void, void))(*(void *)(v0 + 96)
                                                                                                + 32LL))( v18,  *(void *)(v0 + 80),  *(void *)(v0 + 88));
  sub_199B8(v18);
  *(void *)(v0 + 15_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v19;
  uint64_t v20 = (void *)swift_task_alloc(dword_3951C);
  *(void *)(v0 + 160) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_18E84;
  return sub_1A290(*(void *)(v0 + 112));
}

uint64_t sub_18E84(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 160);
  *(void *)(*v2 + 168) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_bridgeObjectRelease(*(void *)(v4 + 152));
    uint64_t v6 = sub_19238;
  }

  else
  {
    *(void *)(v4 + 176) = a1;
    uint64_t v6 = sub_18F00;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_18F00()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v12 = v0[19];
  sub_274C0(v1);
  uint64_t v3 = v12;
  swift_bridgeObjectRetain(v12);
  sub_1D9F8(&v12);
  if (v2) {
    return swift_release(v12);
  }
  uint64_t v6 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[12];
  swift_bridgeObjectRelease(v3);
  uint64_t v9 = v12;
  v0[23] = v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  EventStreamContext.init(dateRange:)(v6);
  uint64_t v10 = (void *)swift_task_alloc(dword_39514);
  v0[24] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1900C;
  uint64_t v11 = v0[5];
  v10[8] = v0[9];
  v10[9] = v11;
  v10[7] = v9;
  return swift_task_switch(sub_19FC4, 0LL, 0LL);
}

uint64_t sub_1900C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v6 = *(void *)(*v2 + 184);
  uint64_t v5 = *(void *)(*v2 + 192);
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc(v5);
  swift_release(v6);
  if (v1)
  {
    uint64_t v7 = sub_192E4;
  }

  else
  {
    *(void *)(v4 + 208) = a1;
    uint64_t v7 = sub_19088;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_19088()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v24 = *(void *)(v0 + 128);
  uint64_t v25 = *(void *)(v0 + 144);
  uint64_t v22 = *(void *)(v0 + 112);
  uint64_t v23 = *(void *)(v0 + 136);
  uint64_t v20 = *(void *)(v0 + 96);
  uint64_t v21 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v19 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = Conversation.allTurnsChronologically.getter();
  uint64_t v6 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()();
  swift_release(v5);
  uint64_t v7 = type metadata accessor for Turn(0LL);
  uint64_t v8 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v9 = static TimeEventUtils.groupAndJoinEvents<A, B>(milestoneEvents:eventsToJoin:)( v6,  v1,  v7,  v8,  &protocol witness table for Turn,  &protocol witness table for CoreDuetEvent);
  swift_bridgeObjectRelease(v1);
  swift_release(v6);
  uint64_t v10 = sub_1B68C();
  uint64_t v11 = swift_task_alloc(32LL);
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v10;
  uint64_t v12 = sub_202F8(v9, (void (*)(uint64_t, uint64_t, __n128))sub_202F0, v11);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_task_dealloc(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v19, v3);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  uint64_t v14 = *(void *)(v0 + 112);
  uint64_t v13 = *(void *)(v0 + 120);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v17 = *(void *)(v0 + 72);
  uint64_t v16 = *(void *)(v0 + 80);
  swift_task_dealloc(*(void *)(v0 + 144));
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(unint64_t *))(v0 + 8))(v12);
}

uint64_t sub_19238()
{
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 80);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 96) + 8LL))(v5, *(void *)(v0 + 88));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_192E4()
{
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 80);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 96) + 8LL))(v5, *(void *)(v0 + 88));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_193A0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v69 = a3;
  uint64_t v5 = sub_4CC0(&qword_39680);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v68 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v67 = (char *)&v65 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v66 = (char *)&v65 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v65 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v65 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v65 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  uint64_t v70 = (char *)&v65 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v65 - v28;
  Date.addingTimeInterval(_:)(v27, 120.0);
  sub_8418(a2, (uint64_t)v7, &qword_39680);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    sub_845C((uint64_t)v7, &qword_39680);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v30(v24, v29, v8);
    int v31 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  }

  else
  {
    int v31 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v31(v21, v7, v8);
    uint64_t v32 = sub_8518( &qword_396A8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    char v33 = dispatch thunk of static Comparable.< infix(_:_:)(v29, v21, v8, v32);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    if ((v33 & 1) != 0) {
      uint64_t v34 = v29;
    }
    else {
      uint64_t v34 = v21;
    }
    v30(v24, v34, v8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v21, v8);
  }

  unint64_t v35 = v70;
  v31(v70, v24, v8);
  uint64_t v36 = sub_8518( &qword_396A8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  if ((dispatch thunk of static Comparable.< infix(_:_:)(v35, a1, v8, v36) & 1) != 0)
  {
    if (qword_38C38 != -1) {
      swift_once(&qword_38C38, sub_1BB00);
    }
    uint64_t v37 = type metadata accessor for Logger(0LL);
    sub_7D04(v37, (uint64_t)qword_394B0);
    uint64_t v38 = v67;
    v30(v67, a1, v8);
    unint64_t v39 = v68;
    uint64_t v40 = ((uint64_t (*)(char *, char *, uint64_t))v30)(v68, v35, v8);
    uint64_t v41 = v35;
    uint64_t v42 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v66 = v29;
      uint64_t v44 = swift_slowAlloc(32LL, -1LL);
      uint64_t v65 = swift_slowAlloc(96LL, -1LL);
      uint64_t v72 = v65;
      *(_DWORD *)uint64_t v44 = 136315650;
      if (qword_38C30 != -1) {
        swift_once(&qword_38C30, sub_11478);
      }
      uint64_t v45 = qword_394A0;
      unint64_t v46 = qword_394A8;
      swift_bridgeObjectRetain(qword_394A8);
      uint64_t v71 = sub_28A50(v45, v46, &v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v44 + 4, v44 + 12);
      swift_bridgeObjectRelease(v46);
      *(_WORD *)(v44 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      uint64_t v47 = sub_8518( &qword_39700,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
      uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter(v8, v47);
      unint64_t v50 = v49;
      uint64_t v71 = sub_28A50(v48, v49, &v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v44 + 14, v44 + 22);
      swift_bridgeObjectRelease(v50);
      uint64_t v51 = *(void (**)(char *, uint64_t))(v9 + 8);
      v51(v38, v8);
      *(_WORD *)(v44 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      uint64_t v52 = v68;
      uint64_t v53 = dispatch thunk of CustomStringConvertible.description.getter(v8, v47);
      unint64_t v55 = v54;
      uint64_t v71 = sub_28A50(v53, v54, &v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v44 + 24, v44 + 32);
      swift_bridgeObjectRelease(v55);
      v51(v52, v8);
      _os_log_impl( &dword_0,  v42,  v43,  "%s Conversation timestamps out of order (conversationTimestamp: %s, nextTimestamp: %s)",  (uint8_t *)v44,  0x20u);
      uint64_t v56 = v65;
      swift_arrayDestroy(v65, 3LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1LL, -1LL);
      swift_slowDealloc(v44, -1LL, -1LL);

      v51(v70, v8);
      v51(v66, v8);
    }

    else
    {

      uint64_t v62 = v38;
      uint64_t v63 = *(void (**)(char *, uint64_t))(v9 + 8);
      v63(v39, v8);
      v63(v62, v8);
      v63(v41, v8);
      v63(v29, v8);
    }

    uint64_t v64 = type metadata accessor for DateInterval(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56LL))( v69,  1LL,  1LL,  v64);
  }

  else
  {
    v30(v18, a1, v8);
    uint64_t v57 = v66;
    v30(v66, v35, v8);
    uint64_t v58 = v69;
    DateInterval.init(start:end:)(v18, v57);
    unint64_t v59 = *(void (**)(char *, uint64_t))(v9 + 8);
    v59(v35, v8);
    v59(v29, v8);
    uint64_t v60 = type metadata accessor for DateInterval(0LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56LL))( v58,  0LL,  1LL,  v60);
  }

void sub_199B8(unsigned int (*a1)(char *, uint64_t, uint64_t))
{
  unint64_t v78 = a1;
  uint64_t v3 = sub_4CC0(&qword_39688);
  __chkstk_darwin(v3);
  unint64_t v68 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v74 = *(void *)(v5 - 8);
  uint64_t v75 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v79 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v73 = (char *)&v66 - v8;
  uint64_t v82 = type metadata accessor for AppInteraction(0LL);
  uint64_t v80 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v67 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_4CC0(&qword_396D0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v69 = *(void *)(v13 - 8);
  uint64_t v70 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v72 = (char *)&v66 - v17;
  uint64_t v77 = v1;
  uint64_t v81 = sub_1B7AC();
  uint64_t v18 = sub_10634((uint64_t)v81);
  uint64_t v71 = v2;
  uint64_t v85 = &_swiftEmptySetSingleton;
  unint64_t v19 = *((void *)v18 + 2);
  swift_bridgeObjectRetain(v18);
  unint64_t v20 = 0LL;
  uint64_t v76 = _swiftEmptyArrayStorage;
LABEL_2:
  if (v20 <= v19) {
    unint64_t v21 = v19;
  }
  else {
    unint64_t v21 = v20;
  }
  while (v19 != v20)
  {
    if (v21 == v20)
    {
      __break(1u);
      return;
    }

    uint64_t v22 = *(void *)&v18[8 * v20++ + 32];
    v83[0] = v22;
    uint64_t v23 = sub_4CC0(&qword_396D8);
    uint64_t v24 = String.init<A>(describing:)(v83, v23);
    char v26 = sub_1BEA8(v83, v24, v25);
    swift_bridgeObjectRelease(v83[1]);
    if ((v26 & 1) != 0)
    {
      uint64_t v27 = v76;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v76);
      uint64_t v84 = v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_2A748(0, v27[2] + 1LL, 1);
        uint64_t v27 = v84;
      }

      unint64_t v30 = v27[2];
      unint64_t v29 = v27[3];
      int v31 = (void *)(v30 + 1);
      if (v30 >= v29 >> 1)
      {
        uint64_t v76 = (void *)(v30 + 1);
        sub_2A748(v29 > 1, v30 + 1, 1);
        int v31 = v76;
        uint64_t v27 = v84;
      }

      v27[2] = v31;
      uint64_t v76 = v27;
      v27[v30 + 4] = v22;
      goto LABEL_2;
    }
  }

  swift_bridgeObjectRelease(v18);
  uint64_t v32 = v85;
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v32);
  char v33 = objc_autoreleasePoolPush();
  uint64_t v34 = *(void *)(v77 + 128);
  uint64_t v35 = *(void *)(v77 + 136);
  sub_8164((void *)(v77 + 104), v34);
  uint64_t v36 = v72;
  uint64_t v37 = DateInterval.start.getter();
  DateInterval.end.getter(v37);
  uint64_t v38 = v76;
  unint64_t v39 = v71;
  uint64_t v40 = dispatch thunk of InteractionReader.appInteractions(since:intentTypes:until:)(v36, v76, v16, v34, v35);
  if (v39)
  {
    uint64_t v41 = v70;
    uint64_t v42 = v33;
    os_log_type_t v43 = *(void (**)(char *, uint64_t))(v69 + 8);
    v43(v16, v70);
    v43(v36, v41);
    objc_autoreleasePoolPop(v42);
    swift_bridgeObjectRelease(v81);
    swift_release(v38);
  }

  else
  {
    uint64_t v44 = (char *)v40;
    uint64_t v71 = v33;
    uint64_t v45 = v70;
    unint64_t v46 = *(void (**)(char *, uint64_t))(v69 + 8);
    v46(v16, v70);
    v46(v36, v45);
    uint64_t v47 = swift_retain(v44);
    uint64_t v48 = dispatch thunk of _AnySequenceBox._makeIterator()(v47);
    uint64_t v72 = v44;
    uint64_t v49 = swift_release(v44);
    dispatch thunk of _AnyIteratorBoxBase.next()(v49);
    uint64_t v50 = v80;
    uint64_t v51 = v82;
    unint64_t v78 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48);
    if (v78(v12, 1LL, v82) != 1)
    {
      uint64_t v77 = *(void *)(v50 + 32);
      uint64_t v52 = _swiftEmptyArrayStorage;
      unint64_t v54 = v67;
      uint64_t v53 = (uint64_t)v68;
      uint64_t v56 = v74;
      uint64_t v55 = v75;
      for (uint64_t i = ((uint64_t (*)(char *, char *, uint64_t))v77)(v67, v12, v51);
            ;
            uint64_t i = ((uint64_t (*)(char *, char *, uint64_t))v77)(v54, v12, v60))
      {
        __chkstk_darwin(i);
        *(&v66 - _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = (uint64_t)v54;
        unint64_t v59 = sub_107F0( (void (*)(uint64_t *__return_ptr, uint64_t, __n128))sub_20290,  (uint64_t)(&v66 - 4),  (uint64_t)v81);
        uint64_t v60 = v82;
        CoreDuetEvent.init(features:)(v59);
        (*(void (**)(char *, uint64_t))(v80 + 8))(v54, v60);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v53, 1LL, v55) == 1)
        {
          uint64_t v58 = sub_845C(v53, &qword_39688);
        }

        else
        {
          uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 32);
          uint64_t v62 = v73;
          v61(v73, v53, v55);
          v61(v79, (uint64_t)v62, v55);
          if ((swift_isUniquelyReferenced_nonNull_native(v52) & 1) == 0) {
            uint64_t v52 = (void *)sub_2667C(0, v52[2] + 1LL, 1, (unint64_t)v52);
          }
          unint64_t v64 = v52[2];
          unint64_t v63 = v52[3];
          if (v64 >= v63 >> 1) {
            uint64_t v52 = (void *)sub_2667C(v63 > 1, v64 + 1, 1, (unint64_t)v52);
          }
          v52[2] = v64 + 1;
          uint64_t v56 = v74;
          unint64_t v65 = (unint64_t)v52
          uint64_t v55 = v75;
          uint64_t v58 = ((uint64_t (*)(unint64_t, char *, uint64_t))v61)(v65, v79, v75);
          uint64_t v60 = v82;
        }

        dispatch thunk of _AnyIteratorBoxBase.next()(v58);
        if (v78(v12, 1LL, v60) == 1) {
          break;
        }
      }
    }

    swift_release(v72);
    swift_release(v48);
    objc_autoreleasePoolPop(v71);
    swift_bridgeObjectRelease(v81);
    swift_release(v76);
  }

uint64_t sub_19FA8(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  void v3[9] = v2;
  v3[7] = a1;
  return swift_task_switch(sub_19FC4, 0LL, 0LL);
}

uint64_t sub_19FC4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 56);
  unint64_t v3 = *(void *)(*(void *)(v0 + 72) + 224LL);
  uint64_t v4 = swift_task_alloc(32LL);
  *(void *)(v4 + 16) = v1;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  uint64_t v5 = sub_109E8((void (*)(uint64_t *__return_ptr, uint64_t *))sub_20248, v4, v3);
  *(void *)(v0 + 80) = v5;
  swift_bridgeObjectRelease(v3);
  swift_task_dealloc(v4);
  uint64_t v6 = *((void *)v5 + 2);
  *(void *)(v0 + 88) = v6;
  if (v6)
  {
    uint64_t v7 = *(void *)(v0 + 56);
    *(void *)(v0 + 96) = v7;
    *(void *)(v0 + 10_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 0LL;
    sub_8120(*(void *)(v0 + 80) + 32LL, v0 + 16);
    uint64_t v8 = *(void *)(v0 + 40);
    uint64_t v9 = *(void *)(v0 + 48);
    sub_8164((void *)(v0 + 16), v8);
    uint64_t v10 = (void *)swift_task_alloc(async function pointer to dispatch thunk of EventStreamProcessing.process(_:)[1]);
    *(void *)(v0 + 11_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_1A0EC;
    return dispatch thunk of EventStreamProcessing.process(_:)(v7, v8, v9);
  }

  else
  {
    swift_bridgeObjectRelease(v5);
    return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 56));
  }

uint64_t sub_1A0EC(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 112LL);
  *(void *)(*(void *)v2 + 120LL) = v1;
  swift_task_dealloc(v5);
  uint64_t v6 = v4[12];
  if (v1)
  {
    swift_bridgeObjectRelease(v4[10]);
    swift_bridgeObjectRelease(v6);
    uint64_t v7 = sub_1A25C;
  }

  else
  {
    swift_bridgeObjectRelease(v4[12]);
    v4[16] = a1;
    uint64_t v7 = sub_1A17C;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_1A17C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 104) + 1LL;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 16));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 80));
    return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 128));
  }

  else
  {
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v5 = *(void *)(v0 + 104) + 1LL;
    *(void *)(v0 + 96) = v4;
    *(void *)(v0 + 10_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v5;
    sub_8120(*(void *)(v0 + 80) + 40 * v5 + 32, v0 + 16);
    uint64_t v6 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 48);
    sub_8164((void *)(v0 + 16), v6);
    uint64_t v8 = (void *)swift_task_alloc(async function pointer to dispatch thunk of EventStreamProcessing.process(_:)[1]);
    *(void *)(v0 + 11_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_1A0EC;
    return dispatch thunk of EventStreamProcessing.process(_:)(v4, v6, v7);
  }

uint64_t sub_1A25C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A290(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_4CC0(&qword_39680);
  v2[10] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for CoreDuetEvent(0LL);
  v2[11] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[12] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[13] = swift_task_alloc(v6);
  v2[14] = swift_task_alloc(v6);
  uint64_t v7 = sub_4CC0(&qword_39688);
  v2[15] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_4CC0(&qword_39690);
  v2[16] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[17] = v9;
  v2[18] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Date(0LL);
  v2[19] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[20] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[21] = swift_task_alloc(v12);
  v2[22] = swift_task_alloc(v12);
  v2[23] = swift_task_alloc(v12);
  uint64_t v13 = sub_4CC0(&qword_39698);
  v2[24] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[25] = v14;
  v2[26] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1A3E4, 0LL, 0LL);
}

uint64_t sub_1A3E4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 72) + 224LL);
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0) {
      uint64_t v7 = *(void *)(*(void *)(v0 + 72) + 224LL);
    }
    else {
      uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v1, 2LL);
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(v7);
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain_n(v1, 2LL);
    if (!v2) {
      goto LABEL_14;
    }
  }

  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v4 = 0LL;
  do
  {
    if ((v1 & 0xC000000000000001LL) != 0)
    {
      uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
    }

    else
    {
      uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
      swift_retain(v5);
    }

    ++v4;
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 152LL))();
    swift_release(v5);
    sub_27324(v6);
  }

  while (v2 != v4);
LABEL_14:
  swift_bridgeObjectRelease_n(v1, 2LL);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v9 = sub_1FDE4((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  swift_retain(v8);
  sub_1FF0C(v9, v8);
  uint64_t v11 = v10;
  *(void *)(v0 + 216) = v10;
  swift_release(v8);
  uint64_t result = swift_bridgeObjectRelease(v9);
  uint64_t v12 = *(void *)(v11 + 16);
  *(void *)(v0 + 22_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v12;
  if (!v12)
  {
    swift_bridgeObjectRelease(v11);
    uint64_t v17 = *(void *)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 184);
    uint64_t v19 = *(void *)(v0 + 168);
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v22 = *(void *)(v0 + 112);
    uint64_t v21 = *(void *)(v0 + 120);
    uint64_t v23 = *(void *)(v0 + 104);
    uint64_t v24 = *(void *)(v0 + 80);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v18);
    swift_task_dealloc(v17);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    return (*(uint64_t (**)(void *))(v0 + 8))(_swiftEmptyArrayStorage);
  }

  *(void *)(v0 + 23_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
  *(void *)(v0 + 240) = _swiftEmptyArrayStorage;
  uint64_t v13 = *(void *)(v0 + 216);
  if (*(void *)(v13 + 16))
  {
    sub_8120(v13 + 32, v0 + 16);
    uint64_t v14 = *(void *)(v0 + 40);
    uint64_t v15 = *(void *)(v0 + 48);
    sub_8164((void *)(v0 + 16), v14);
    DateInterval.start.getter();
    uint64_t v16 = (void *)swift_task_alloc(async function pointer to dispatch thunk of EventStreamDefinition.events(since:)[1]);
    *(void *)(v0 + 248) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_1A68C;
    return dispatch thunk of EventStreamDefinition.events(since:)( *(void *)(v0 + 208),  *(void *)(v0 + 184),  v14,  v15);
  }

LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_1A68C()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 248LL);
  *(void *)(*(void *)v1 + 256LL) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = v2[30];
    uint64_t v5 = v2[27];
    (*(void (**)(void, void))(v2[20] + 8LL))(v2[23], v2[19]);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v4);
    uint64_t v6 = sub_1ADFC;
  }

  else
  {
    uint64_t v7 = v2[23];
    uint64_t v8 = v2[19];
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v2[20] + 8LL);
    v2[33] = v9;
    v9(v7, v8);
    uint64_t v6 = sub_1A734;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1A734()
{
  uint64_t v1 = sub_22C70( &qword_396A0,  &qword_39690,  (uint64_t)&protocol conformance descriptor for AsyncEventStream<A>.AsyncIterator);
  v0[34] = v1;
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[35] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1A7C0;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[15], v0[16], v1);
}

uint64_t sub_1A7C0()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 280LL));
  uint64_t v3 = v2[30];
  if (v0)
  {
    v2[37] = v3;
    v2[38] = v0;
    uint64_t v4 = sub_1AC28;
  }

  else
  {
    v2[36] = v3;
    uint64_t v4 = sub_1A82C;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1A82C()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 160);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v3 + 32);
  uint64_t v8 = v7(*(void *)(v0 + 112), v1, v2);
  CoreDuetEvent.getTimestamp()(v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1LL, v4) == 1)
  {
    uint64_t v9 = *(void *)(v0 + 80);
    static Date.distantPast.getter();
    uint64_t v10 = sub_845C(v9, &qword_39680);
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 160) + 32LL))( *(void *)(v0 + 176),  *(void *)(v0 + 80),  *(void *)(v0 + 152));
  }

  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v12 = *(void *)(v0 + 176);
  uint64_t v14 = *(void *)(v0 + 152);
  DateInterval.end.getter(v10);
  uint64_t v15 = sub_8518( &qword_396A8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  char v16 = dispatch thunk of static Comparable.< infix(_:_:)(v13, v12, v14, v15);
  v11(v13, v14);
  if ((v16 & 1) != 0)
  {
    uint64_t v17 = *(void *)(v0 + 112);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 96);
    (*(void (**)(void, void))(v0 + 264))(*(void *)(v0 + 176), *(void *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
LABEL_7:
    uint64_t v20 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v0 + 224);
    uint64_t v22 = *(void *)(v0 + 200);
    uint64_t v21 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 192);
    uint64_t v7 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(*(void *)(v0 + 232) + 1LL);
    (*(void (**)(void, void))(*(void *)(v0 + 136) + 8LL))(*(void *)(v0 + 144), *(void *)(v0 + 128));
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 16));
    if (v7 == v20)
    {
      swift_bridgeObjectRelease(*(void *)(v0 + 216));
      uint64_t v25 = *(void *)(v0 + 288);
      uint64_t v27 = *(void *)(v0 + 176);
      uint64_t v26 = *(void *)(v0 + 184);
      uint64_t v28 = *(void *)(v0 + 168);
      uint64_t v29 = *(void *)(v0 + 144);
      uint64_t v31 = *(void *)(v0 + 112);
      uint64_t v30 = *(void *)(v0 + 120);
      uint64_t v32 = *(void *)(v0 + 104);
      uint64_t v33 = *(void *)(v0 + 80);
      swift_task_dealloc(*(void *)(v0 + 208));
      swift_task_dealloc(v26);
      swift_task_dealloc(v27);
      swift_task_dealloc(v28);
      swift_task_dealloc(v29);
      swift_task_dealloc(v30);
      swift_task_dealloc(v31);
      swift_task_dealloc(v32);
      swift_task_dealloc(v33);
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v25);
    }

    uint64_t v35 = *(void *)(v0 + 288);
    unint64_t v36 = *(void *)(v0 + 232) + 1LL;
    *(void *)(v0 + 23_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v36;
    *(void *)(v0 + 240) = v35;
    uint64_t v37 = *(void *)(v0 + 216);
    if (v36 < *(void *)(v37 + 16))
    {
      sub_8120(v37 + 40 * v36 + 32, v0 + 16);
      uint64_t v38 = *(void *)(v0 + 40);
      uint64_t v39 = *(void *)(v0 + 48);
      sub_8164((void *)(v0 + 16), v38);
      DateInterval.start.getter();
      uint64_t v40 = (void *)swift_task_alloc(async function pointer to dispatch thunk of EventStreamDefinition.events(since:)[1]);
      *(void *)(v0 + 248) = v40;
      *uint64_t v40 = v0;
      v40[1] = sub_1A68C;
      return dispatch thunk of EventStreamDefinition.events(since:)( *(void *)(v0 + 208),  *(void *)(v0 + 184),  v38,  v39);
    }

    __break(1u);
    goto LABEL_16;
  }

  uint64_t v41 = *(void *)(v0 + 288);
  (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16LL))( *(void *)(v0 + 104),  *(void *)(v0 + 112),  *(void *)(v0 + 88));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v41);
  unint64_t v24 = *(void *)(v0 + 288);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
LABEL_16:
  }
    unint64_t v24 = sub_2667C(0, *(void *)(v24 + 16) + 1LL, 1, v24);
  unint64_t v44 = *(void *)(v24 + 16);
  unint64_t v43 = *(void *)(v24 + 24);
  if (v44 >= v43 >> 1) {
    unint64_t v24 = sub_2667C(v43 > 1, v44 + 1, 1, v24);
  }
  *(void *)(v0 + 31_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v24;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  uint64_t v46 = *(void *)(v0 + 176);
  uint64_t v47 = *(void *)(v0 + 152);
  uint64_t v48 = *(void *)(v0 + 104);
  uint64_t v49 = *(void *)(v0 + 112);
  uint64_t v50 = *(void *)(v0 + 88);
  uint64_t v51 = *(void *)(v0 + 96);
  *(void *)(v24 + 16) = v44 + 1;
  v7( v24 + ((*(unsigned __int8 *)(v51 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))
  + *(void *)(v51 + 72) * v44,
    v48,
    v50);
  v45(v46, v47);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v49, v50);
  uint64_t v52 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  *(void *)(v0 + 320) = v52;
  *uint64_t v52 = v0;
  v52[1] = sub_1AD90;
  return dispatch thunk of AsyncIteratorProtocol.next()( *(void *)(v0 + 120),  *(void *)(v0 + 128),  *(void *)(v0 + 272));
}

uint64_t sub_1AC28()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[27];
  v0[7] = v0[38];
  uint64_t v3 = sub_4CC0(&qword_38E00);
  swift_willThrowTypedImpl(v0 + 7, v3, &protocol self-conformance witness table for Error);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_1ACA4, 0LL, 0LL);
}

uint64_t sub_1ACA4()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 192);
  (*(void (**)(void, void))(*(void *)(v0 + 136) + 8LL))(*(void *)(v0 + 144), *(void *)(v0 + 128));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v8 = *(void *)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v11 = *(void *)(v0 + 104);
  uint64_t v13 = *(void *)(v0 + 80);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 16));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AD90()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 320LL));
  uint64_t v3 = v2[39];
  if (v0)
  {
    v2[37] = v3;
    v2[38] = v0;
    uint64_t v4 = sub_1AC28;
  }

  else
  {
    v2[36] = v3;
    uint64_t v4 = sub_1A82C;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1ADFC()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 80);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((void *)(v0 + 16));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_4CC0(&qword_39680);
  __chkstk_darwin(v7);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = sub_1B8CC();
  uint64_t v14 = sub_1AFE4(a2, (uint64_t)v13);
  swift_bridgeObjectRelease(v13);
  swift_retain(a1);
  uint64_t v15 = sub_22904(a4, a1);
  uint64_t v16 = swift_release(a1);
  uint64_t v17 = Turn.turnID.getter(v16);
  Turn.getTimestamp()(v17);
  return FeaturisedTurn.init(turnId:features:coreDuetEvents:timestamp:)(v12, v15, v14, v9);
}

char *sub_1AFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4CC0(&qword_39688);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v58 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v44 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v44 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v50 = (uint64_t)&v44 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v44 - v18;
  uint64_t v20 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v47 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = __chkstk_darwin(v22);
  __chkstk_darwin(v24);
  uint64_t v46 = (char *)&v44 - v26;
  unint64_t v54 = *(void *)(a1 + 16);
  if (!v54) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v61 = v25;
  uint64_t v64 = a2;
  uint64_t v45 = v19;
  uint64_t v27 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
LABEL_4:
  unint64_t v28 = 0LL;
  unint64_t v44 = (*(unsigned __int8 *)(v21 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v49 = a1 + v44;
  uint64_t v51 = *(void *)(v21 + 72);
  uint64_t v55 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
  unint64_t v63 = a2 & 0xC000000000000001LL;
  unint64_t v57 = v54 - 1;
  uint64_t v48 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v62 = v12;
  uint64_t v59 = v27;
  do
  {
    unint64_t v56 = v28 + 1;
    BOOL v29 = __OFADD__(v28, 1LL);
    BOOL v53 = v29;
    a1 = v50;
    unint64_t v60 = v28;
    v55(v50, v49 + v51 * v28, v20);
    uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v30(a1, 0LL, 1LL, v20);
    sub_8418(a1, (uint64_t)v15, &qword_39688);
    if (v27)
    {
      if (v27 < 1) {
        goto LABEL_36;
      }
      unint64_t v52 = v49 + v56 * v51;
      swift_bridgeObjectRetain(a2);
      a1 = 0LL;
      while (1)
      {
        if (v63)
        {
          a2 = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, a2);
        }

        else
        {
          a2 = *(void *)(a2 + 8 * a1 + 32);
          swift_retain(a2);
        }

        sub_8418((uint64_t)v15, (uint64_t)v9, &qword_39688);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v9, 1LL, v20) == 1)
        {
          sub_845C((uint64_t)v9, &qword_39688);
          v30((uint64_t)v12, 1LL, 1LL, v20);
        }

        else
        {
          uint64_t v31 = v61;
          (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v61, v9, v20);
          if (v60 == v57)
          {
            uint64_t v32 = v58;
            v30((uint64_t)v58, 1LL, 1LL, v20);
          }

          else
          {
            if (v53)
            {
              __break(1u);
LABEL_35:
              __break(1u);
LABEL_36:
              __break(1u);
LABEL_37:
              if (a2 < 0) {
                uint64_t v42 = v64;
              }
              else {
                uint64_t v42 = a2 & 0xFFFFFFFFFFFFFF8LL;
              }
              swift_bridgeObjectRetain(v64);
              uint64_t v43 = v42;
              a2 = v64;
              uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v43);
              swift_bridgeObjectRelease(a2);
              goto LABEL_4;
            }

            if (v56 >= v54) {
              goto LABEL_35;
            }
            uint64_t v32 = v58;
            v55((uint64_t)v58, v52, v20);
            v30((uint64_t)v32, 0LL, 1LL, v20);
            uint64_t v31 = v61;
          }

          dispatch thunk of CoreDuetEventCoalescing.process(_:next:)(v31, v32);
          uint64_t v33 = (uint64_t)v32;
          uint64_t v12 = v62;
          sub_845C(v33, &qword_39688);
          (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v31, v20);
          uint64_t v27 = v59;
        }

        swift_release(a2);
        ++a1;
        sub_845C((uint64_t)v15, &qword_39688);
        sub_4D00((uint64_t)v12, (uint64_t)v15, &qword_39688);
        a2 = v64;
        if (v27 == a1)
        {
          swift_bridgeObjectRelease(v64);
          break;
        }
      }
    }

    uint64_t v34 = (uint64_t)v45;
    sub_4D00((uint64_t)v15, (uint64_t)v45, &qword_39688);
    sub_845C(v50, &qword_39688);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v34, 1LL, v20) == 1)
    {
      sub_845C(v34, &qword_39688);
    }

    else
    {
      uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
      unint64_t v36 = v46;
      v35(v46, v34, v20);
      v55((uint64_t)v47, (unint64_t)v36, v20);
      if ((swift_isUniquelyReferenced_nonNull_native(v48) & 1) == 0) {
        uint64_t v48 = (char *)sub_2667C(0, *((void *)v48 + 2) + 1LL, 1, (unint64_t)v48);
      }
      unint64_t v38 = *((void *)v48 + 2);
      unint64_t v37 = *((void *)v48 + 3);
      uint64_t v27 = v59;
      if (v38 >= v37 >> 1) {
        uint64_t v48 = (char *)sub_2667C(v37 > 1, v38 + 1, 1, (unint64_t)v48);
      }
      uint64_t v39 = v47;
      uint64_t v40 = v48;
      *((void *)v48 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v38 + 1;
      v35(&v40[v44 + v38 * v51], (uint64_t)v39, v20);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v46, v20);
      a2 = v64;
    }

    unint64_t v28 = v56;
  }

  while (v56 != v54);
  return v48;
}

void *sub_1B56C()
{
  uint64_t v1 = *(void *)(v0 + 224);
  if (!((unint64_t)v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = (void *)swift_bridgeObjectRetain_n(v1, 2LL);
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease_n(v1, 2LL);
    return _swiftEmptyArrayStorage;
  }

  if (v1 < 0) {
    uint64_t v7 = *(void *)(v0 + 224);
  }
  else {
    uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v7);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v4 = 0LL;
    do
    {
      if ((v1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }

      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain(v5);
      }

      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 160LL))();
      swift_release(v5);
      sub_272FC(v6);
    }

    while (v2 != v4);
    swift_bridgeObjectRelease_n(v1, 2LL);
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1B68C()
{
  uint64_t v1 = *(void *)(v0 + 224);
  if (!((unint64_t)v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = (void *)swift_bridgeObjectRetain_n(v1, 2LL);
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease_n(v1, 2LL);
    return &_swiftEmptyArrayStorage;
  }

  if (v1 < 0) {
    uint64_t v7 = *(void *)(v0 + 224);
  }
  else {
    uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v7);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v4 = 0LL;
    do
    {
      if ((v1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }

      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain(v5);
      }

      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 112LL))();
      swift_release(v5);
      sub_27338(v6);
    }

    while (v2 != v4);
    swift_bridgeObjectRelease_n(v1, 2LL);
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1B7AC()
{
  uint64_t v1 = *(void *)(v0 + 224);
  if (!((unint64_t)v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = (void *)swift_bridgeObjectRetain_n(v1, 2LL);
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease_n(v1, 2LL);
    return _swiftEmptyArrayStorage;
  }

  if (v1 < 0) {
    uint64_t v7 = *(void *)(v0 + 224);
  }
  else {
    uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v7);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v4 = 0LL;
    do
    {
      if ((v1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }

      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain(v5);
      }

      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 128LL))();
      swift_release(v5);
      sub_27310(v6);
    }

    while (v2 != v4);
    swift_bridgeObjectRelease_n(v1, 2LL);
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1B8CC()
{
  uint64_t v1 = *(void *)(v0 + 224);
  if (!((unint64_t)v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = (void *)swift_bridgeObjectRetain_n(v1, 2LL);
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease_n(v1, 2LL);
    return &_swiftEmptyArrayStorage;
  }

  if (v1 < 0) {
    uint64_t v7 = *(void *)(v0 + 224);
  }
  else {
    uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v7);
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v4 = 0LL;
    do
    {
      if ((v1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }

      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain(v5);
      }

      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 136LL))();
      swift_release(v5);
      sub_27660(v6);
    }

    while (v2 != v4);
    swift_bridgeObjectRelease_n(v1, 2LL);
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

uint64_t sub_1B9EC@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  sub_8164(a2, v6);
  uint64_t v8 = InferredGroundTruthStore.readTypedGroundTruth<A>(_:)(v5, v6, v5, v7, v4);
  uint64_t v9 = sub_4CC0(&qword_38FB0);
  uint64_t v10 = _arrayForceCast<A, B>(_:)(v8, v5, v9);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a3 = v10;
  return result;
}

uint64_t sub_1BA84()
{
  return swift_deallocClassInstance(v0, 248LL, 7LL);
}

uint64_t type metadata accessor for SiriPrivateLearningInferenceEngine()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferenceEngine);
}

uint64_t sub_1BB00()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_394B0);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_394B0);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

void *sub_1BB90(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v4 = a2 - (void)__src;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (!__dst)
  {
    if (v4 <= 0) {
      return __src;
    }
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawBufferPointer.copyMemory source has too many elements",  69LL,  2LL,  "Swift/UnsafeRawBufferPointer.swift",  34LL,  2,  487LL,  0);
    __break(1u);
    return __src;
  }

  if (__src) {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_1BC24@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1BC4C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  uint64_t v13 = sub_8518(&qword_38FF8, v12, (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v10);
  uint64_t v35 = a2;
  uint64_t v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  uint64_t v15 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v16 = v14 & ~v15;
  uint64_t v17 = v10;
  uint64_t v18 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
  {
    uint64_t v31 = v3;
    uint64_t v32 = a1;
    uint64_t v33 = ~v15;
    uint64_t v34 = v7;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v21 = v17;
      uint64_t v22 = v20;
      v20(v9, *(void *)(v17 + 48) + v19 * v16, v6);
      uint64_t v23 = sub_8518( &qword_39000,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v35, v6, v23);
      uint64_t v25 = *(void (**)(char *, uint64_t))(v34 + 8);
      v25(v9, v6);
      if ((v24 & 1) != 0) {
        break;
      }
      unint64_t v16 = (v16 + 1) & v33;
      uint64_t v17 = v21;
      uint64_t v20 = v22;
      if (((*(void *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v21);
        uint64_t v3 = v31;
        a1 = v32;
        uint64_t v26 = v34;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease(v21);
    v25(v35, v6);
    v22(v32, *(void *)(*v31 + 48LL) + v19 * v16, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v26 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    unint64_t v28 = v35;
    v20(v9, v35, v6);
    uint64_t v36 = *v3;
    void *v3 = 0x8000000000000000LL;
    sub_1C8EC((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    void *v3 = v36;
    swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(a1, v28, v6);
    return 1LL;
  }

uint64_t sub_1BEA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v24, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0LL;
    }

    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v19 = (void *)(v11 + 16 * v10);
      uint64_t v20 = v19[1];
      BOOL v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0LL) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  void *v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_1CB40(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_1C054(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for EventStreamType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  uint64_t v13 = sub_8518(&qword_396B0, v12, (uint64_t)&protocol conformance descriptor for EventStreamType);
  swift_bridgeObjectRetain(v10);
  uint64_t v35 = a2;
  uint64_t v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  uint64_t v15 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v16 = v14 & ~v15;
  uint64_t v17 = v10;
  uint64_t v18 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
  {
    uint64_t v31 = v3;
    uint64_t v32 = a1;
    uint64_t v33 = ~v15;
    uint64_t v34 = v7;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v21 = v17;
      uint64_t v22 = v20;
      v20(v9, *(void *)(v17 + 48) + v19 * v16, v6);
      uint64_t v23 = sub_8518( &qword_396B8,  (uint64_t (*)(uint64_t))&type metadata accessor for EventStreamType,  (uint64_t)&protocol conformance descriptor for EventStreamType);
      char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v35, v6, v23);
      uint64_t v25 = *(void (**)(char *, uint64_t))(v34 + 8);
      v25(v9, v6);
      if ((v24 & 1) != 0) {
        break;
      }
      unint64_t v16 = (v16 + 1) & v33;
      uint64_t v17 = v21;
      uint64_t v20 = v22;
      if (((*(void *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v21);
        uint64_t v3 = v31;
        a1 = v32;
        uint64_t v26 = v34;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease(v21);
    v25(v35, v6);
    v22(v32, *(void *)(*v31 + 48LL) + v19 * v16, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v20 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v26 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    unint64_t v28 = v35;
    v20(v9, v35, v6);
    uint64_t v36 = *v3;
    void *v3 = 0x8000000000000000LL;
    sub_1CCD8((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    void *v3 = v36;
    swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(a1, v28, v6);
    return 1LL;
  }

Swift::Int sub_1C2B0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_4CC0(&qword_396E8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    uint64_t v33 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v13 = 0LL;
    while (1)
    {
      if (v9)
      {
        unint64_t v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v10) {
          goto LABEL_36;
        }
        unint64_t v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v19 = v33[v13];
          if (!v19)
          {
            int64_t v13 = v18 + 2;
            if (v18 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v19 = v33[v13];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v32;
                uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v33 = -1LL << v31;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v13 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v33[v13];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v20;
            }
          }
        }

LABEL_26:
        unint64_t v9 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      uint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      Swift::Int result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0LL;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      uint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      *uint64_t v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    int64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    uint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    Swift::Int result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    uint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    *uint64_t v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v13 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

  Swift::Int result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1C58C( uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v48 = a4;
  uint64_t v49 = a5;
  uint64_t v7 = v5;
  uint64_t v47 = a2;
  uint64_t v9 = a2(0LL);
  uint64_t v46 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v42 - v10;
  uint64_t v12 = *v7;
  if (*(void *)(*v7 + 24) > a1) {
    a1 = *(void *)(*v7 + 24);
  }
  sub_4CC0(a3);
  uint64_t v13 = static _SetStorage.resize(original:capacity:move:)(v12, a1, 1LL);
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_39;
  }
  uint64_t v15 = 1LL << *(_BYTE *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 56);
  uint64_t v45 = (void *)(v12 + 56);
  if (v15 < 64) {
    uint64_t v17 = ~(-1LL << v15);
  }
  else {
    uint64_t v17 = -1LL;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v43 = v7;
  int64_t v44 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v19 = v13 + 56;
  uint64_t result = swift_retain(v12);
  int64_t v21 = 0LL;
  while (1)
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_26;
    }

    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1LL))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }

    if (v25 >= v44) {
      goto LABEL_35;
    }
    unint64_t v26 = v45[v25];
    ++v21;
    if (!v26)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v44) {
        goto LABEL_35;
      }
      unint64_t v26 = v45[v21];
      if (!v26)
      {
        int64_t v21 = v25 + 2;
        if (v25 + 2 >= v44) {
          goto LABEL_35;
        }
        unint64_t v26 = v45[v21];
        if (!v26) {
          break;
        }
      }
    }

LABEL_25:
    unint64_t v18 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_26:
    uint64_t v28 = v12;
    uint64_t v29 = *(void *)(v12 + 48);
    uint64_t v30 = *(void *)(v46 + 72);
    uint64_t v31 = *(void (**)(char *, unint64_t, uint64_t))(v46 + 32);
    v31(v11, v29 + v30 * v24, v9);
    uint64_t v32 = *(void *)(v14 + 40);
    uint64_t v33 = sub_8518(v48, v47, v49);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v32, v9, v33);
    uint64_t v34 = -1LL << *(_BYTE *)(v14 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1LL << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1LL << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }

        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0LL;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }

      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }

    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v22;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v31)( *(void *)(v14 + 48) + v22 * v30,  v11,  v9);
    ++*(void *)(v14 + 16);
    uint64_t v12 = v28;
  }

  int64_t v27 = v25 + 3;
  if (v27 < v44)
  {
    unint64_t v26 = v45[v27];
    if (!v26)
    {
      while (1)
      {
        int64_t v21 = v27 + 1;
        if (__OFADD__(v27, 1LL)) {
          goto LABEL_41;
        }
        if (v21 >= v44) {
          goto LABEL_35;
        }
        unint64_t v26 = v45[v21];
        ++v27;
        if (v26) {
          goto LABEL_25;
        }
      }
    }

    int64_t v21 = v27;
    goto LABEL_25;
  }

    uint64_t v19 = (v27 - 1) & v27;
    int64_t v25 = __clz(__rbit64(v27)) + (v22 << 6);
LABEL_26:
    uint64_t v29 = *(void *)(v10 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v12, *(void *)(v13 + 48) + v29 * v25, v9);
    uint64_t v30 = *(void *)(v15 + 40);
    uint64_t v31 = sub_8518(v43, v42, v44);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v30, v9, v31);
    uint64_t v32 = -1LL << *(_BYTE *)(v15 + 32);
    uint64_t v33 = result & ~v32;
    uint64_t v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v20 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v20 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      unint64_t v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        char v37 = v34 == v36;
        if (v34 == v36) {
          uint64_t v34 = 0LL;
        }
        v35 |= v37;
        unint64_t v38 = *(void *)(v20 + 8 * v34);
      }

      while (v38 == -1);
      unint64_t v23 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v10 + 32))( *(void *)(v15 + 48) + v23 * v29,  v12,  v9);
    ++*(void *)(v15 + 16);
  }

  uint64_t v28 = v26 + 3;
  if (v28 >= v41)
  {
LABEL_35:
    uint64_t result = swift_release_n(v13, 2LL);
    uint64_t v7 = v39;
    goto LABEL_37;
  }

  int64_t v27 = *(void *)(v40 + 8 * v28);
  if (v27)
  {
    unint64_t v22 = v28;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v22 = v28 + 1;
    if (__OFADD__(v28, 1LL)) {
      break;
    }
    if (v22 >= v41) {
      goto LABEL_35;
    }
    int64_t v27 = *(void *)(v40 + 8 * v22);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }

    uint64_t v14 = (v24 - 1) & v24;
    int64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_26:
    unint64_t v26 = *(void *)(v45 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v45 + v44))(v7, *(void *)(v8 + 48) + v26 * v21, v5);
    int64_t v27 = v8;
    uint64_t v28 = *(void *)(*(void *)(v8 + 56) + 8 * v21);
    uint64_t v29 = *(void *)(v10 + 40);
    uint64_t v30 = sub_9C90( &qword_38FF8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v29, v5, v30);
    uint64_t v31 = -1LL << *(_BYTE *)(v10 + 32);
    uint64_t v32 = result & ~v31;
    uint64_t v33 = v32 >> 6;
    if (((-1LL << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      uint64_t v19 = __clz(__rbit64((-1LL << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        unint64_t v36 = v33 == v35;
        if (v33 == v35) {
          uint64_t v33 = 0LL;
        }
        v34 |= v36;
        char v37 = *(void *)(v15 + 8 * v33);
      }

      while (v37 == -1);
      uint64_t v19 = __clz(__rbit64(~v37)) + (v33 << 6);
    }

    *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v45 + 32))( *(void *)(v10 + 48) + v26 * v19,  v7,  v5);
    *(void *)(*(void *)(v10 + 56) + 8 * v19) = v28;
    ++*(void *)(v10 + 16);
    uint64_t v8 = v27;
  }

  int64_t v25 = v22 + 2;
  if (v25 >= v42)
  {
LABEL_36:
    swift_release(v8);
    unint64_t v38 = v41;
    if ((v40 & 0x100000000LL) != 0) {
      goto LABEL_39;
    }
    goto LABEL_43;
  }

  unint64_t v24 = v43[v25];
  if (v24)
  {
    uint64_t v17 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v17 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v17 >= v42) {
      goto LABEL_36;
    }
    unint64_t v24 = v43[v17];
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

    uint64_t v17 = (v31 - 1) & v31;
    uint64_t v28 = __clz(__rbit64(v31)) + (v21 << 6);
LABEL_26:
    uint64_t v33 = v58;
    uint64_t v34 = *(void *)(v59 + 72);
    unint64_t v35 = v34 * v28;
    unint64_t v36 = *(void (**)(_BYTE *, unint64_t, uint64_t))(v59 + v56);
    v36(v11, *(void *)(v58 + 48) + v34 * v28, v6);
    char v37 = *(void *)(v33 + 56) + v35;
    unint64_t v38 = v57;
    v36(v57, v37, v6);
    BOOL v39 = *(void *)(v13 + 40);
    uint64_t v40 = sub_9C90( &qword_38FF8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v39, v6, v40);
    uint64_t v41 = -1LL << *(_BYTE *)(v13 + 32);
    uint64_t v42 = result & ~v41;
    uint64_t v43 = v42 >> 6;
    if (((-1LL << v42) & ~*(void *)(v19 + 8 * (v42 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1LL << v42) & ~*(void *)(v19 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      int64_t v44 = 0;
      uint64_t v45 = (unint64_t)(63 - v41) >> 6;
      do
      {
        if (++v43 == v45 && (v44 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        uint64_t v46 = v43 == v45;
        if (v43 == v45) {
          uint64_t v43 = 0LL;
        }
        v44 |= v46;
        uint64_t v47 = *(void *)(v19 + 8 * v43);
      }

      while (v47 == -1);
      unint64_t v23 = __clz(__rbit64(~v47)) + (v43 << 6);
    }

    *(void *)(v19 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    unint64_t v24 = v34 * v23;
    int64_t v25 = *(void *)(v13 + 48) + v34 * v23;
    unint64_t v26 = *(void (**)(unint64_t, _BYTE *, uint64_t))(v59 + 32);
    v26(v25, v11, v6);
    uint64_t result = ((uint64_t (*)(unint64_t, _BYTE *, uint64_t))v26)(*(void *)(v13 + 56) + v24, v38, v6);
    ++*(void *)(v13 + 16);
  }

  uint64_t v32 = v29 + 2;
  if (v32 >= v54)
  {
LABEL_36:
    uint64_t v49 = v58;
    swift_release(v58);
    uint64_t v3 = v53;
    if ((v52 & 1) != 0) {
      goto LABEL_39;
    }
    goto LABEL_43;
  }

  uint64_t v31 = v55[v32];
  if (v31)
  {
    int64_t v21 = v32;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v21 = v32 + 1;
    if (__OFADD__(v32, 1LL)) {
      break;
    }
    if (v21 >= v54) {
      goto LABEL_36;
    }
    uint64_t v31 = v55[v21];
    ++v32;
    if (v31) {
      goto LABEL_25;
    }
  }

    uint64_t v14 = (v21 - 1) & v21;
    uint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    uint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    unint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 18) = v19;
    swift_bridgeObjectRetain(v19);
  }

  unint64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  int64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    uint64_t v11 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    int64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

    uint64_t v14 = (v21 - 1) & v21;
    uint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    uint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    unint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + v18);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))( *(void *)(v7 + 48) + v17,  v4,  v1);
    *(void *)(*(void *)(v7 + 56) + v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 18) = v19;
  }

  unint64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  int64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    uint64_t v11 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    int64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

LABEL_35:
  swift_release(v12);
  uint64_t v7 = v43;
  uint64_t v41 = 1LL << *(_BYTE *)(v12 + 32);
  if (v41 > 63) {
    bzero(v45, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v45 = -1LL << v41;
  }
  *(void *)(v12 + 16) = 0LL;
LABEL_39:
  uint64_t result = swift_release(v12);
  *uint64_t v7 = v14;
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_1C8EC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v30 = a1;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1C58C( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  &qword_39808,  &qword_38FF8,  (uint64_t)&protocol conformance descriptor for UUID);
  }

  else
  {
    if (v11 > v10)
    {
      sub_1D0DC((uint64_t (*)(void))&type metadata accessor for UUID, &qword_39808);
      goto LABEL_12;
    }

    sub_1D5AC( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  &qword_39808,  &qword_38FF8,  (uint64_t)&protocol conformance descriptor for UUID);
  }

  uint64_t v13 = *v3;
  uint64_t v14 = *(void *)(*v3 + 40);
  uint64_t v15 = sub_8518( &qword_38FF8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  uint64_t v17 = -1LL << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = ~v17;
    uint64_t v19 = *(void *)(v7 + 72);
    int64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(void *)(v13 + 48) + v19 * a2, v6);
      uint64_t v21 = sub_8518( &qword_39000,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v18;
    }

    while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

LABEL_12:
  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(*v29 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v24 + 48) + *(void *)(v7 + 72) * a2,  v23,  v6);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1LL);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(*v29 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v24 + 48) + *(void *)(v7 + 72) * a2,  v23,  v6);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1LL);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

void sub_1CB40(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_1C2B0(v11);
  }

  else
  {
    if (v10 > v9)
    {
      sub_1CF2C();
      goto LABEL_22;
    }

    sub_1D300(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v29, *(void *)(*v4 + 40));
  String.hash(into:)(v29, a1, a2);
  Swift::Int v13 = Hasher._finalize()();
  uint64_t v14 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  uint64_t v15 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v16 = *(void *)(v12 + 48);
    uint64_t v17 = (void *)(v16 + 16 * a3);
    uint64_t v18 = v17[1];
    BOOL v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(void *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v21 = (void *)(v16 + 16 * a3);
        uint64_t v22 = v21[1];
        BOOL v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0LL) & 1) != 0) {
          goto LABEL_21;
        }
      }
    }
  }

LABEL_22:
  uint64_t v24 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  int64_t v25 = (void *)(*(void *)(v24 + 48) + 16 * a3);
  *int64_t v25 = a1;
  v25[1] = a2;
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1LL);
  uint64_t v28 = v26 + 1;
  if (v27) {
    __break(1u);
  }
  else {
    *(void *)(v24 + 16) = v28;
  }
}

    uint64_t v16 = (v23 - 1) & v23;
    uint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_9:
    BOOL v19 = v2[9] * v18;
    uint64_t v20 = (void (*)(char *, unint64_t, uint64_t))v2[2];
    v20(v7, *(void *)(v8 + 48) + v19, v1);
    v20(v5, *(void *)(v8 + 56) + v19, v1);
    uint64_t v21 = (void (*)(unint64_t, char *, uint64_t))v2[4];
    v21(*(void *)(v10 + 48) + v19, v7, v1);
    uint64_t result = (void *)((uint64_t (*)(unint64_t, char *, uint64_t))v21)( *(void *)(v10 + 56) + v19,  v5,  v1);
  }

  uint64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_23;
  }
  BOOL v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    Swift::Int v13 = v24;
    goto LABEL_22;
  }

  while (1)
  {
    Swift::Int v13 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_23;
    }
    BOOL v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }

uint64_t sub_1CCD8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v30 = a1;
  uint64_t v6 = type metadata accessor for EventStreamType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1C58C( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for EventStreamType,  &qword_396C0,  &qword_396B0,  (uint64_t)&protocol conformance descriptor for EventStreamType);
  }

  else
  {
    if (v11 > v10)
    {
      sub_1D0DC((uint64_t (*)(void))&type metadata accessor for EventStreamType, &qword_396C0);
      goto LABEL_12;
    }

    sub_1D5AC( v12,  (uint64_t (*)(uint64_t))&type metadata accessor for EventStreamType,  &qword_396C0,  &qword_396B0,  (uint64_t)&protocol conformance descriptor for EventStreamType);
  }

  uint64_t v13 = *v3;
  uint64_t v14 = *(void *)(*v3 + 40);
  uint64_t v15 = sub_8518( &qword_396B0,  (uint64_t (*)(uint64_t))&type metadata accessor for EventStreamType,  (uint64_t)&protocol conformance descriptor for EventStreamType);
  uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  uint64_t v17 = -1LL << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = ~v17;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(void *)(v13 + 48) + v19 * a2, v6);
      uint64_t v21 = sub_8518( &qword_396B8,  (uint64_t (*)(uint64_t))&type metadata accessor for EventStreamType,  (uint64_t)&protocol conformance descriptor for EventStreamType);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v18;
    }

    while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

void sub_1CF2C()
{
  uint64_t v1 = v0;
  sub_4CC0(&qword_396E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *uint64_t v1 = v4;
    return;
  }

  uint64_t v5 = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    swift_bridgeObjectRetain(v18);
  }

  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }

    uint64_t v19 = (v25 - 1) & v25;
    int64_t v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    uint64_t v23 = *(void *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 48) + v23, v5);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v11 + 48) + v23,  v8,  v5);
  }

  uint64_t v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    uint64_t result = (void *)swift_release(v9);
    uint64_t v4 = v28;
    goto LABEL_30;
  }

  int64_t v25 = *(void *)(v13 + 8 * v26);
  if (v25)
  {
    uint64_t v16 = v26;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v16 = v26 + 1;
    if (__OFADD__(v26, 1LL)) {
      break;
    }
    if (v16 >= v20) {
      goto LABEL_28;
    }
    int64_t v25 = *(void *)(v13 + 8 * v16);
    ++v26;
    if (v25) {
      goto LABEL_27;
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v62);
  __break(1u);
  return result;
}

void *sub_1D0DC(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = a1(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - v7;
  sub_4CC0(a2);
  uint64_t v9 = *v2;
  uint64_t v10 = static _SetStorage.copy(original:)(*v2);
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
    uint64_t result = (void *)swift_release(v9);
LABEL_30:
    *uint64_t v4 = v11;
    return result;
  }

  uint64_t v28 = v4;
  uint64_t result = (void *)(v10 + 56);
  uint64_t v13 = v9 + 56;
  unint64_t v14 = (unint64_t)((1LL << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  int64_t v16 = 0LL;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v17 = 1LL << *(_BYTE *)(v9 + 32);
  uint64_t v18 = -1LL;
  if (v17 < 64) {
    uint64_t v18 = ~(-1LL << v17);
  }
  unint64_t v19 = v18 & *(void *)(v9 + 56);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      unint64_t v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }

    int64_t v24 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
      __break(1u);
      goto LABEL_32;
    }

    if (v24 >= v20) {
      goto LABEL_28;
    }
    unint64_t v25 = *(void *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      int64_t v16 = v24 + 1;
      if (v24 + 1 >= v20) {
        goto LABEL_28;
      }
      unint64_t v25 = *(void *)(v13 + 8 * v16);
      if (!v25)
      {
        int64_t v16 = v24 + 2;
        if (v24 + 2 >= v20) {
          goto LABEL_28;
        }
        unint64_t v25 = *(void *)(v13 + 8 * v16);
        if (!v25) {
          break;
        }
      }
    }

LABEL_32:
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_1D300(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_4CC0(&qword_396E8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  uint64_t v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v13);
        if (!v19) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1D5AC( uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v7 = v5;
  uint64_t v42 = a2;
  uint64_t v9 = a2(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = *v7;
  if (*(void *)(*v7 + 24) > a1) {
    a1 = *(void *)(*v7 + 24);
  }
  sub_4CC0(a3);
  uint64_t v14 = static _SetStorage.resize(original:capacity:move:)(v13, a1, 0LL);
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16))
  {
    uint64_t result = swift_release(v13);
LABEL_37:
    *uint64_t v7 = v15;
    return result;
  }

  uint64_t v16 = 1LL << *(_BYTE *)(v13 + 32);
  uint64_t v17 = *(void *)(v13 + 56);
  BOOL v39 = v7;
  uint64_t v40 = v13 + 56;
  if (v16 < 64) {
    uint64_t v18 = ~(-1LL << v16);
  }
  else {
    uint64_t v18 = -1LL;
  }
  unint64_t v19 = v18 & v17;
  int64_t v41 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v20 = v14 + 56;
  uint64_t result = swift_retain(v13);
  int64_t v22 = 0LL;
  while (1)
  {
    if (v19)
    {
      unint64_t v24 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_26;
    }

    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v26 >= v41) {
      goto LABEL_35;
    }
    unint64_t v27 = *(void *)(v40 + 8 * v26);
    ++v22;
    if (!v27)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v41) {
        goto LABEL_35;
      }
      unint64_t v27 = *(void *)(v40 + 8 * v22);
      if (!v27)
      {
        int64_t v22 = v26 + 2;
        if (v26 + 2 >= v41) {
          goto LABEL_35;
        }
        unint64_t v27 = *(void *)(v40 + 8 * v22);
        if (!v27) {
          break;
        }
      }
    }

LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1D8C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_290F8(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v10 = *v3;
    uint64_t v18 = *v3;
    uint64_t *v3 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2A410();
      uint64_t v10 = v18;
    }

    uint64_t v11 = *(void *)(v10 + 48);
    uint64_t v12 = type metadata accessor for UUID(0LL);
    uint64_t v13 = *(void *)(v12 - 8);
    unint64_t v14 = *(void *)(v13 + 72) * v7;
    (*(void (**)(unint64_t, uint64_t))(v13 + 8))(v11 + v14, v12);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 32))(a2, *(void *)(v10 + 56) + v14, v12);
    sub_1F90C(v7, v10);
    uint64_t v15 = *v3;
    uint64_t *v3 = v10;
    swift_bridgeObjectRelease(v15);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(a2, 0LL, 1LL, v12);
  }

  else
  {
    uint64_t v17 = type metadata accessor for UUID(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))( a2,  1LL,  1LL,  v17);
  }

Swift::Int sub_1D9F8(void *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for CoreDuetEvent(0LL) - 8);
  uint64_t v3 = (void *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v3 = (void *)sub_1FDBC(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_1DA78(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_1DA78(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4CC0(&qword_39680);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v211 = (char *)&v186 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v186 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v186 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v186 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v190 = (char *)&v186 - v17;
  __chkstk_darwin(v16);
  uint64_t v189 = (char *)&v186 - v18;
  uint64_t v213 = type metadata accessor for Date(0LL);
  uint64_t v19 = *(void *)(v213 - 8);
  uint64_t v20 = __chkstk_darwin(v213);
  uint64_t v210 = (char *)&v186 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v217 = (char *)&v186 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  int64_t v26 = (char *)&v186 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v205 = (char *)&v186 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v188 = (char *)&v186 - v30;
  __chkstk_darwin(v29);
  uint64_t v192 = (char *)&v186 - v31;
  uint64_t v214 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v221 = *(void *)(v214 - 8);
  uint64_t v32 = __chkstk_darwin(v214);
  uint64_t v201 = (char *)&v186 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v215 = (char *)&v186 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v223 = (char *)&v186 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v216 = (char *)&v186 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v207 = (char *)&v186 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  uint64_t v204 = (char *)&v186 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  uint64_t v194 = (char *)&v186 - v45;
  __chkstk_darwin(v44);
  uint64_t v193 = (char *)&v186 - v46;
  uint64_t v220 = a1;
  Swift::Int v47 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v47);
  if (result >= v47)
  {
    if (v47 < 0) {
      goto LABEL_160;
    }
    if (v47) {
      return sub_1EA74(0LL, v47, 1LL, v220);
    }
    return result;
  }

  if (v47 >= 0) {
    uint64_t v49 = v47;
  }
  else {
    uint64_t v49 = v47 + 1;
  }
  if (v47 < -1) {
    goto LABEL_168;
  }
  v209 = v9;
  Swift::Int v187 = result;
  if (v47 < 2)
  {
    BOOL v53 = (char *)_swiftEmptyArrayStorage;
    unint64_t v206 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v221 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v221 + 80));
    uint64_t v186 = _swiftEmptyArrayStorage;
    if (v47 != 1)
    {
      unint64_t v55 = _swiftEmptyArrayStorage[2];
LABEL_123:
      if (v55 >= 2)
      {
        uint64_t v177 = *v220;
        do
        {
          unint64_t v178 = v55 - 2;
          if (v55 < 2) {
            goto LABEL_155;
          }
          if (!v177) {
            goto LABEL_167;
          }
          uint64_t v171 = v53;
          uint64_t v179 = v53 + 32;
          uint64_t v180 = *(void *)&v53[16 * v178 + 32];
          uint64_t v181 = *(void *)&v53[16 * v55 + 24];
          sub_1EE84( v177 + *(void *)(v221 + 72) * v180,  v177 + *(void *)(v221 + 72) * *(void *)&v179[16 * v55 - 16],  v177 + *(void *)(v221 + 72) * v181,  v206);
          if (v2) {
            goto LABEL_135;
          }
          if (v181 < v180) {
            goto LABEL_156;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v171) & 1) == 0) {
            uint64_t v171 = sub_1F8F8((uint64_t)v171);
          }
          if (v178 >= *((void *)v171 + 2)) {
            goto LABEL_157;
          }
          uint64_t v182 = &v171[16 * v178 + 32];
          *(void *)uint64_t v182 = v180;
          *((void *)v182 + 1) = v181;
          unint64_t v183 = *((void *)v171 + 2);
          if (v55 > v183) {
            goto LABEL_158;
          }
          BOOL v53 = v171;
          memmove(&v171[16 * v55 + 16], &v171[16 * v55 + 32], 16 * (v183 - v55));
          *((void *)v171 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v183 - 1;
          unint64_t v55 = v183 - 1;
        }

        while (v183 > 2);
      }

      uint64_t v184 = v53;
LABEL_137:
      swift_bridgeObjectRelease(v184);
      uint64_t v185 = v186;
      v186[2] = 0LL;
      return swift_bridgeObjectRelease(v185);
    }
  }

  else
  {
    uint64_t v50 = v49 >> 1;
    uint64_t v51 = static Array._allocateBufferUninitialized(minimumCapacity:)(v49 >> 1, v214);
    *(void *)(v51 + 16) = v50;
    uint64_t v52 = *(unsigned __int8 *)(v221 + 80);
    uint64_t v186 = (void *)v51;
    unint64_t v206 = v51 + ((v52 + 32) & ~v52);
  }

  uint64_t v54 = 0LL;
  BOOL v53 = (char *)_swiftEmptyArrayStorage;
  uint64_t v200 = v15;
  uint64_t v222 = v19;
  uint64_t v199 = v26;
  uint64_t v202 = v12;
  while (1)
  {
    uint64_t v56 = v54;
    Swift::Int v57 = v54 + 1;
    uint64_t v203 = v54;
    if (v54 + 1 >= v47)
    {
      uint64_t v68 = v214;
    }

    else
    {
      Swift::Int v218 = v47;
      uint64_t v58 = *v220;
      uint64_t v59 = *(void *)(v221 + 72);
      uint64_t v197 = v54 + 1;
      uint64_t v60 = v58 + v59 * v57;
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v221 + 16);
      uint64_t v62 = v214;
      v61(v193, v60, v214);
      uint64_t v195 = v58;
      uint64_t v219 = v59;
      os_log_type_t v208 = v61;
      uint64_t v63 = ((uint64_t (*)(char *, uint64_t, uint64_t))v61)(v194, v58 + v59 * v56, v62);
      uint64_t v64 = (uint64_t)v189;
      CoreDuetEvent.getTimestamp()(v63);
      unint64_t v65 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
      uint64_t v66 = v213;
      if (v65(v64, 1LL, v213) == 1)
      {
        static Date.distantPast.getter();
        uint64_t v67 = sub_845C(v64, &qword_39680);
      }

      else
      {
        uint64_t v67 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 32))(v192, v64, v66);
      }

      uint64_t v69 = v188;
      uint64_t v70 = (uint64_t)v190;
      CoreDuetEvent.getTimestamp()(v67);
      unsigned int v71 = v65(v70, 1LL, v66);
      uint64_t v191 = v53;
      if (v71 == 1)
      {
        static Date.distantPast.getter();
        sub_845C(v70, &qword_39680);
        uint64_t v72 = v222;
      }

      else
      {
        uint64_t v72 = v222;
        (*(void (**)(char *, uint64_t, uint64_t))(v222 + 32))(v69, v70, v66);
      }

      uint64_t v73 = v192;
      LODWORD(v21_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = static Date.< infix(_:_:)(v192, v69);
      uint64_t v74 = *(void (**)(char *, uint64_t))(v72 + 8);
      v74(v69, v66);
      v74(v73, v66);
      uint64_t v75 = *(void (**)(char *, uint64_t))(v221 + 8);
      uint64_t v76 = v214;
      v75(v194, v214);
      v75(v193, v76);
      Swift::Int v57 = v56 + 2;
      if (v56 + 2 >= v218)
      {
        uint64_t v68 = v214;
      }

      else
      {
        uint64_t v198 = v65;
        v197 *= v219;
        uint64_t v77 = v195;
        uint64_t v196 = v219 * v57;
        uint64_t v68 = v214;
        while (1)
        {
          Swift::Int v78 = v57;
          uint64_t v79 = (uint64_t (*)(char *, uint64_t, uint64_t))v208;
          v208(v204, v77 + v196, v68);
          uint64_t v80 = v79(v207, v77 + v197, v68);
          uint64_t v81 = (uint64_t)v200;
          CoreDuetEvent.getTimestamp()(v80);
          uint64_t v82 = v213;
          uint64_t v83 = (unsigned int (*)(char *, uint64_t, uint64_t))v198;
          if (v198(v81, 1LL, v213) == 1)
          {
            static Date.distantPast.getter();
            uint64_t v84 = sub_845C(v81, &qword_39680);
          }

          else
          {
            uint64_t v84 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v222 + 32))(v205, v81, v82);
          }

          uint64_t v85 = v82;
          CoreDuetEvent.getTimestamp()(v84);
          if (v83(v12, 1LL, v82) == 1)
          {
            uint64_t v86 = v199;
            static Date.distantPast.getter();
            sub_845C((uint64_t)v12, &qword_39680);
          }

          else
          {
            uint64_t v86 = v199;
            (*(void (**)(char *, char *, uint64_t))(v222 + 32))(v199, v12, v82);
          }

          uint64_t v87 = v205;
          int v88 = static Date.< infix(_:_:)(v205, v86);
          v74(v86, v85);
          v74(v87, v85);
          uint64_t v68 = v214;
          v75(v207, v214);
          v75(v204, v68);
          Swift::Int v57 = v78 + 1;
          v77 += v219;
          uint64_t v12 = v202;
          if (v218 == v78 + 1)
          {
            Swift::Int v47 = v218;
            Swift::Int v57 = v218;
            uint64_t v56 = v203;
            goto LABEL_37;
          }
        }

        Swift::Int v57 = v78;
        uint64_t v56 = v203;
      }

      Swift::Int v47 = v218;
LABEL_37:
      uint64_t v19 = v222;
      BOOL v53 = v191;
      if ((v212 & 1) != 0)
      {
        if (v57 < v56) {
          goto LABEL_161;
        }
        if (v56 < v57)
        {
          uint64_t v89 = 0LL;
          uint64_t v90 = v219 * (v57 - 1);
          uint64_t v91 = v57 * v219;
          uint64_t v92 = v56;
          uint64_t v93 = v56 * v219;
          do
          {
            if (v92 != v57 + v89 - 1)
            {
              if (!v195) {
                goto LABEL_166;
              }
              uint64_t v198 = v2;
              unint64_t v95 = v195 + v93;
              uint64_t v96 = v195 + v90;
              uint64_t v97 = v195;
              uint64_t v212 = *(void *)(v221 + 32);
              ((void (*)(char *, uint64_t, uint64_t))v212)(v201, v195 + v93, v214);
              if (v93 < v90 || v95 >= v97 + v91)
              {
                uint64_t v94 = v214;
                swift_arrayInitWithTakeFrontToBack(v95, v96);
              }

              else
              {
                uint64_t v94 = v214;
                if (v93 != v90) {
                  swift_arrayInitWithTakeBackToFront(v95, v96);
                }
              }

              ((void (*)(uint64_t, char *, uint64_t))v212)(v96, v201, v94);
              uint64_t v19 = v222;
              uint64_t v2 = v198;
            }

            ++v92;
            --v89;
            v90 -= v219;
            v91 -= v219;
            v93 += v219;
          }

          while (v92 < v57 + v89);
          uint64_t v68 = v214;
          BOOL v53 = v191;
          uint64_t v56 = v203;
          Swift::Int v47 = v218;
        }
      }
    }

    if (v57 < v47)
    {
      if (__OFSUB__(v57, v56)) {
        goto LABEL_159;
      }
      if (v57 - v56 < v187) {
        break;
      }
    }

LABEL_106:
        if ((v154 & 1) != 0) {
          goto LABEL_147;
        }
        os_log_type_t v162 = &v128[16 * v131];
        uint64_t v164 = *(void *)v162;
        uint64_t v163 = *((void *)v162 + 1);
        BOOL v142 = __OFSUB__(v163, v164);
        uint64_t v165 = v163 - v164;
        if (v142) {
          goto LABEL_150;
        }
        if (v165 < v153) {
          goto LABEL_14;
        }
LABEL_114:
        unint64_t v170 = v131 - 1;
        if (v131 - 1 >= v55)
        {
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }

        if (!*v220) {
          goto LABEL_165;
        }
        uint64_t v171 = v53;
        uint64_t v172 = &v128[16 * v170];
        uint64_t v173 = *(void *)v172;
        uint64_t v174 = &v128[16 * v131];
        uint64_t v175 = *((void *)v174 + 1);
        sub_1EE84( *v220 + *(void *)(v221 + 72) * *(void *)v172,  *v220 + *(void *)(v221 + 72) * *(void *)v174,  *v220 + *(void *)(v221 + 72) * v175,  v206);
        if (v2)
        {
LABEL_135:
          uint64_t v184 = v171;
          goto LABEL_137;
        }

        if (v175 < v173) {
          goto LABEL_140;
        }
        if (v131 > *((void *)v171 + 2)) {
          goto LABEL_141;
        }
        *(void *)uint64_t v172 = v173;
        *(void *)&v128[16 * v170 + 8] = v175;
        unint64_t v176 = *((void *)v171 + 2);
        if (v131 >= v176) {
          goto LABEL_142;
        }
        BOOL v53 = v171;
        unint64_t v55 = v176 - 1;
        memmove(&v128[16 * v131], v174 + 16, 16 * (v176 - 1 - v131));
        *((void *)v171 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v176 - 1;
        uint64_t v19 = v222;
        if (v176 <= 2) {
          goto LABEL_14;
        }
      }
    }

    unint64_t v55 = 1LL;
LABEL_14:
    Swift::Int v47 = v220[1];
    uint64_t v54 = v219;
    uint64_t v12 = v202;
    if (v219 >= v47) {
      goto LABEL_123;
    }
  }

  if (__OFADD__(v56, v187)) {
    goto LABEL_162;
  }
  if (v56 + v187 >= v47) {
    Swift::Int v98 = v47;
  }
  else {
    Swift::Int v98 = v56 + v187;
  }
  if (v98 >= v56)
  {
    if (v57 != v98)
    {
      uint64_t v191 = v53;
      uint64_t v198 = v2;
      uint64_t v99 = *(void *)(v221 + 72);
      os_log_type_t v208 = *(void (**)(char *, uint64_t, uint64_t))(v221 + 16);
      uint64_t v212 = v99;
      Swift::Int v218 = v57 * v99;
      uint64_t v219 = v99 * (v57 - 1);
      uint64_t v197 = v98;
      do
      {
        uint64_t v100 = 0LL;
        uint64_t v101 = v56;
        while (1)
        {
          Swift::Int v102 = v57;
          uint64_t v103 = *v220;
          uint64_t v104 = (uint64_t (*)(char *, uint64_t, uint64_t))v208;
          v208(v216, v218 + v100 + *v220, v68);
          uint64_t v105 = v104(v223, v219 + v100 + v103, v68);
          uint64_t v106 = (uint64_t)v209;
          CoreDuetEvent.getTimestamp()(v105);
          uint64_t v107 = v106;
          uint64_t v108 = v222;
          uint64_t v109 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v222 + 48);
          uint64_t v110 = v213;
          if (v109(v107, 1LL, v213) == 1)
          {
            static Date.distantPast.getter();
            uint64_t v111 = sub_845C(v107, &qword_39680);
          }

          else
          {
            uint64_t v111 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v108 + 32))(v217, v107, v110);
          }

          uint64_t v112 = (uint64_t)v211;
          CoreDuetEvent.getTimestamp()(v111);
          if (v109(v112, 1LL, v110) == 1)
          {
            uint64_t v113 = v210;
            static Date.distantPast.getter();
            sub_845C(v112, &qword_39680);
            uint64_t v114 = v222;
          }

          else
          {
            uint64_t v114 = v222;
            uint64_t v113 = v210;
            (*(void (**)(char *, uint64_t, uint64_t))(v222 + 32))(v210, v112, v110);
          }

          unint64_t v115 = v217;
          char v116 = static Date.< infix(_:_:)(v217, v113);
          uint64_t v117 = v113;
          char v118 = v116;
          uint64_t v119 = *(void (**)(char *, uint64_t))(v114 + 8);
          v119(v117, v110);
          v119(v115, v110);
          uint64_t v120 = *(void (**)(char *, uint64_t))(v221 + 8);
          uint64_t v68 = v214;
          v120(v223, v214);
          v120(v216, v68);
          if ((v118 & 1) == 0) {
            break;
          }
          uint64_t v121 = *v220;
          if (!*v220) {
            goto LABEL_164;
          }
          uint64_t v122 = v121 + v218 + v100;
          uint64_t v123 = (char *)(v121 + v219 + v100);
          uint64_t v124 = *(void (**)(char *, uint64_t, uint64_t))(v221 + 32);
          v124(v215, v122, v68);
          swift_arrayInitWithTakeFrontToBack(v122, v123);
          v124(v123, (uint64_t)v215, v68);
          v100 -= v212;
          ++v101;
          Swift::Int v57 = v102;
          if (v102 == v101) {
            goto LABEL_62;
          }
        }

        Swift::Int v57 = v102;
LABEL_62:
        ++v57;
        v219 += v212;
        v218 += v212;
        uint64_t v56 = v203;
      }

      while (v57 != v197);
      Swift::Int v57 = v197;
      uint64_t v2 = v198;
      uint64_t v19 = v222;
      BOOL v53 = v191;
    }

    goto LABEL_75;
  }

LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1EA74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v60 = a4;
  uint64_t v49 = a1;
  uint64_t v6 = sub_4CC0(&qword_39680);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v52 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  BOOL v53 = (char *)&v47 - v9;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v51 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v63 = (char *)&v47 - v14;
  uint64_t v15 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v61 = *(void **)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  Swift::Int v57 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v65 = (char *)&v47 - v19;
  uint64_t result = __chkstk_darwin(v18);
  uint64_t v62 = (char *)&v47 - v21;
  uint64_t v56 = a3;
  uint64_t v48 = a2;
  if (a3 != a2)
  {
    uint64_t v22 = v61[9];
    uint64_t v50 = (uint64_t (*)(char *, uint64_t, uint64_t))v61[2];
    uint64_t v64 = v22 * (v56 - 1);
    uint64_t v54 = v22;
    uint64_t v23 = v22 * v56;
    uint64_t v59 = v11;
LABEL_5:
    uint64_t v24 = 0LL;
    uint64_t v25 = v49;
    uint64_t v55 = v23;
    while (1)
    {
      uint64_t v26 = *v60;
      uint64_t v58 = v23 + v24;
      uint64_t v27 = v50;
      v50(v62, v23 + v24 + v26, v15);
      uint64_t v28 = v27(v65, v64 + v24 + v26, v15);
      uint64_t v29 = v53;
      CoreDuetEvent.getTimestamp()(v28);
      uint64_t v30 = (uint64_t)v29;
      uint64_t v31 = v11;
      uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
      if (v32(v30, 1LL, v10) == 1)
      {
        static Date.distantPast.getter();
        uint64_t v33 = sub_845C(v30, &qword_39680);
      }

      else
      {
        uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 32))(v63, v30, v10);
      }

      uint64_t v34 = (uint64_t)v52;
      CoreDuetEvent.getTimestamp()(v33);
      if (v32(v34, 1LL, v10) == 1)
      {
        uint64_t v35 = v51;
        static Date.distantPast.getter();
        sub_845C(v34, &qword_39680);
        uint64_t v11 = v59;
      }

      else
      {
        uint64_t v11 = v59;
        uint64_t v35 = v51;
        (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v51, v34, v10);
      }

      uint64_t v36 = v10;
      uint64_t v37 = v63;
      char v38 = static Date.< infix(_:_:)(v63, v35);
      uint64_t v39 = v35;
      char v40 = v38;
      uint64_t v41 = *(void (**)(char *, uint64_t))(v11 + 8);
      v41(v39, v36);
      v41(v37, v36);
      uint64_t v42 = (void (*)(char *, uint64_t))v61[1];
      v42(v65, v15);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v42)(v62, v15);
      uint64_t v10 = v36;
      uint64_t v23 = v55;
      if ((v40 & 1) == 0)
      {
LABEL_4:
        v64 += v54;
        v23 += v54;
        if (++v56 == v48) {
          return result;
        }
        goto LABEL_5;
      }

      uint64_t v43 = *v60;
      if (!*v60) {
        break;
      }
      uint64_t v44 = v43 + v55 + v24;
      uint64_t v45 = v43 + v64 + v24;
      uint64_t v46 = (void (*)(char *, uint64_t, uint64_t))v61[4];
      v46(v57, v44, v15);
      swift_arrayInitWithTakeFrontToBack(v44, v45);
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v46)(v45, v57, v15);
      v24 -= v54;
      ++v25;
      uint64_t v11 = v59;
      if (v56 == v25) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_1EE84(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v103 = a3;
  uint64_t v7 = sub_4CC0(&qword_39680);
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v95 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v94 = (char *)&v88 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v93 = (char *)&v88 - v13;
  __chkstk_darwin(v12);
  uint64_t v92 = (uint64_t (*)(char *, unint64_t, uint64_t))((char *)&v88 - v14);
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v91 = (char *)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  Swift::Int v98 = (char *)&v88 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v90 = (char *)&v88 - v22;
  __chkstk_darwin(v21);
  uint64_t v97 = (uint64_t)&v88 - v23;
  uint64_t v24 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v25 = __chkstk_darwin(v24);
  Swift::Int v102 = (char *)&v88 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v96 = (char *)&v88 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v88 - v30;
  __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v88 - v32;
  uint64_t v35 = *(void *)(v34 + 72);
  uint64_t v99 = v34;
  uint64_t v100 = v35;
  if (!v35)
  {
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }

  if (a2 - a1 == 0x8000000000000000LL && v100 == -1) {
    goto LABEL_74;
  }
  int64_t v36 = v103 - a2;
  if (v103 - a2 == 0x8000000000000000LL && v100 == -1) {
    goto LABEL_75;
  }
  uint64_t v37 = (uint64_t)(a2 - a1) / v100;
  unint64_t v106 = a1;
  unint64_t v105 = a4;
  uint64_t v38 = v36 / v100;
  uint64_t v101 = v16;
  if (v37 >= v36 / v100)
  {
    if ((v38 & 0x8000000000000000LL) == 0)
    {
      uint64_t v40 = v38 * v100;
      if (a4 < a2 || a2 + v40 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2);
      }

      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4, a2);
      }

      unint64_t v58 = a4 + v40;
      unint64_t v104 = a4 + v40;
      unint64_t v106 = a2;
      uint64_t v93 = (char *)a1;
      if (v40 >= 1 && a1 < a2)
      {
        uint64_t v60 = -v100;
        uint64_t v92 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v99 + 16);
        unint64_t v89 = a4;
        uint64_t v97 = -v100;
        do
        {
          uint64_t v61 = v92;
          v92(v96, v58 + v60, v24);
          unint64_t v62 = a2 + v60;
          uint64_t v63 = v61(v102, a2 + v60, v24);
          uint64_t v64 = v94;
          CoreDuetEvent.getTimestamp()(v63);
          uint64_t v65 = (uint64_t)v64;
          uint64_t v66 = v101;
          uint64_t v67 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v101 + 48);
          if (v67(v65, 1LL, v15) == 1)
          {
            static Date.distantPast.getter();
            uint64_t v68 = sub_845C(v65, &qword_39680);
          }

          else
          {
            uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 32))(v98, v65, v15);
          }

          uint64_t v69 = v24;
          uint64_t v70 = (uint64_t)v95;
          CoreDuetEvent.getTimestamp()(v68);
          unsigned int v71 = v67(v70, 1LL, v15);
          uint64_t v100 = a2;
          uint64_t v72 = v91;
          if (v71 == 1)
          {
            static Date.distantPast.getter();
            sub_845C(v70, &qword_39680);
          }

          else
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v91, v70, v15);
          }

          unint64_t v73 = v103;
          uint64_t v74 = v15;
          uint64_t v76 = v97;
          uint64_t v75 = v98;
          uint64_t v77 = (char *)(v103 + v97);
          char v78 = static Date.< infix(_:_:)(v98, v72);
          uint64_t v79 = v72;
          char v80 = v78;
          uint64_t v81 = *(void (**)(char *, uint64_t))(v66 + 8);
          v81(v79, v74);
          v81(v75, v74);
          uint64_t v82 = *(void (**)(char *, uint64_t))(v99 + 8);
          v82(v102, v69);
          v82(v96, v69);
          uint64_t v15 = v74;
          if ((v80 & 1) != 0)
          {
            if (v73 < v100 || (unint64_t)v77 >= v100)
            {
              uint64_t v24 = v69;
              swift_arrayInitWithTakeFrontToBack(v73 + v76, v62);
              unint64_t v84 = v89;
              uint64_t v60 = v97;
            }

            else
            {
              BOOL v83 = v73 == v100;
              unint64_t v84 = v89;
              uint64_t v24 = v69;
              uint64_t v60 = v97;
              if (!v83) {
                swift_arrayInitWithTakeBackToFront(v77, v62);
              }
            }

            v106 += v60;
          }

          else
          {
            unint64_t v85 = v104;
            uint64_t v86 = (char *)(v104 + v76);
            v104 += v76;
            uint64_t v60 = v76;
            if (v73 < v85 || (unint64_t)v77 >= v85)
            {
              uint64_t v24 = v69;
              swift_arrayInitWithTakeFrontToBack(v73 + v76, v86);
              unint64_t v62 = v100;
            }

            else
            {
              uint64_t v24 = v69;
              unint64_t v62 = v100;
              if (v73 != v85) {
                swift_arrayInitWithTakeBackToFront(v73 + v76, v86);
              }
            }

            unint64_t v84 = v89;
          }

          unint64_t v58 = v104;
          if (v104 <= v84) {
            break;
          }
          a2 = v62;
          unint64_t v103 = (unint64_t)v77;
        }

        while (v62 > (unint64_t)v93);
      }

      goto LABEL_72;
    }
  }

  else if ((v37 & 0x8000000000000000LL) == 0)
  {
    uint64_t v39 = v37 * v100;
    if (a4 < a1 || a1 + v39 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1);
    }

    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }

    Swift::Int v102 = (char *)(a4 + v39);
    unint64_t v104 = a4 + v39;
    if (v39 >= 1 && a2 < v103)
    {
      Swift::Int v98 = *(char **)(v99 + 16);
      uint64_t v42 = (char *)v97;
      do
      {
        uint64_t v43 = v98;
        ((void (*)(char *, unint64_t, uint64_t))v98)(v33, a2, v24);
        uint64_t v44 = ((uint64_t (*)(char *, unint64_t, uint64_t))v43)(v31, a4, v24);
        uint64_t v45 = (uint64_t)v92;
        CoreDuetEvent.getTimestamp()(v44);
        uint64_t v46 = v101;
        uint64_t v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v101 + 48);
        if (v47(v45, 1LL, v15) == 1)
        {
          static Date.distantPast.getter();
          uint64_t v48 = sub_845C(v45, &qword_39680);
        }

        else
        {
          uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v97, v45, v15);
        }

        uint64_t v49 = (uint64_t)v93;
        CoreDuetEvent.getTimestamp()(v48);
        if (v47(v49, 1LL, v15) == 1)
        {
          uint64_t v50 = v90;
          static Date.distantPast.getter();
          sub_845C(v49, &qword_39680);
          uint64_t v51 = v101;
        }

        else
        {
          uint64_t v51 = v101;
          uint64_t v50 = v90;
          (*(void (**)(char *, uint64_t, uint64_t))(v101 + 32))(v90, v49, v15);
        }

        char v52 = static Date.< infix(_:_:)(v42, v50);
        BOOL v53 = *(void (**)(char *, uint64_t))(v51 + 8);
        v53(v50, v15);
        v53(v42, v15);
        uint64_t v54 = *(void (**)(char *, uint64_t))(v99 + 8);
        v54(v31, v24);
        v54(v33, v24);
        unint64_t v55 = v106;
        if ((v52 & 1) != 0)
        {
          unint64_t v56 = a2 + v100;
          if (v106 < a2 || v106 >= v56)
          {
            swift_arrayInitWithTakeFrontToBack(v106, a2);
          }

          else if (v106 == a2)
          {
            unint64_t v55 = a2;
          }

          else
          {
            swift_arrayInitWithTakeBackToFront(v106, a2);
          }
        }

        else
        {
          unint64_t v57 = v105 + v100;
          if (v106 < v105 || v106 >= v57)
          {
            swift_arrayInitWithTakeFrontToBack(v106, v105);
          }

          else if (v106 != v105)
          {
            swift_arrayInitWithTakeBackToFront(v106, v105);
          }

          unint64_t v105 = v57;
          unint64_t v56 = a2;
        }

        unint64_t v106 = v55 + v100;
        a4 = v105;
        a2 = v56;
      }

      while (v56 < v103);
    }

LABEL_72:
    sub_1F7EC(&v106, &v105, (uint64_t *)&v104, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
    return 1LL;
  }

LABEL_76:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_1F6F4(char *result, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_4CC0(&qword_396F8);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_1F7EC(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = a4(0LL);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72LL);
  if (!v8)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000LL && v8 == -1) {
    goto LABEL_14;
  }
  if (v9 / v8 < 0)
  {
LABEL_15:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
    __break(1u);
    return result;
  }

  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8) {
    return swift_arrayInitWithTakeFrontToBack(v4, v5);
  }
  if (v4 != v5) {
    return swift_arrayInitWithTakeBackToFront(v4, v5);
  }
  return result;
}

char *sub_1F8F8(uint64_t a1)
{
  return sub_1F6F4(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_1F90C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v39 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  int64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1LL << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1LL << v10)) != 0)
    {
      unint64_t v38 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v39 + 72);
      uint64_t v37 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
      uint64_t v13 = v11;
      do
      {
        uint64_t v14 = v8;
        int64_t v15 = v12 * v10;
        uint64_t v16 = v13;
        v37(v7, *(void *)(a2 + 48) + v12 * v10, v4);
        uint64_t v17 = *(void *)(a2 + 40);
        uint64_t v18 = sub_8518( &qword_38FF8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v19 = dispatch thunk of Hashable._rawHashValue(seed:)(v17, v4, v18);
        unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v7, v4);
        uint64_t v13 = v16;
        unint64_t v20 = v19 & v16;
        if (a1 >= (uint64_t)v38)
        {
          if (v20 >= v38 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            uint64_t v23 = *(void *)(a2 + 48);
            int64_t v24 = v12 * a1;
            unint64_t v25 = v23 + v12 * a1;
            uint64_t v26 = v23 + v15;
            if (v12 * a1 < v15 || v25 >= v26 + v12)
            {
              swift_arrayInitWithTakeFrontToBack(v25, v26);
            }

            else if (v24 != v15)
            {
              swift_arrayInitWithTakeBackToFront(v25, v26);
            }

            uint64_t v27 = *(void *)(a2 + 56);
            unint64_t result = v27 + v24;
            uint64_t v28 = v27 + v15;
            if (v24 < v15 || result >= v28 + v12)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack(result, v28);
              a1 = v10;
              uint64_t v8 = v14;
              uint64_t v13 = v16;
            }

            else
            {
              a1 = v10;
              BOOL v29 = v24 == v15;
              uint64_t v8 = v14;
              uint64_t v13 = v16;
              if (!v29)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront(result, v28);
                uint64_t v13 = v16;
                a1 = v10;
              }
            }

            goto LABEL_5;
          }
        }

        else if (v20 >= v38 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }

        uint64_t v8 = v14;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v13;
      }

      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
    }

    uint64_t v30 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1LL << a1) - 1;
  }

  else
  {
    uint64_t v30 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1LL << a1) - 1;
  }

  *uint64_t v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1LL);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_1FBC8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_290F8(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }

  else
  {
    char v18 = v13;
    uint64_t v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      unint64_t v20 = *v4;
      if ((v18 & 1) != 0) {
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 40))( v20[7] + *(void *)(v9 + 72) * v14,  a1,  v8);
      }
      goto LABEL_11;
    }

    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2A410();
      goto LABEL_7;
    }

    sub_29A9C(v17, a3 & 1);
    unint64_t v22 = sub_290F8(a2);
    if ((v18 & 1) == (v23 & 1))
    {
      unint64_t v14 = v22;
      unint64_t v20 = *v4;
      if ((v18 & 1) != 0) {
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 40))( v20[7] + *(void *)(v9 + 72) * v14,  a1,  v8);
      }
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_29F10(v14, (uint64_t)v11, a1, v20);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
  __break(1u);
  return result;
}

uint64_t sub_1FD44(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v9 = sub_E5FC(&v12);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_7D6C(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_1FDBC(void *a1)
{
  return sub_2AAC4(0, a1[2], 0, a1);
}

uint64_t sub_1FDD0(void *a1)
{
  return sub_2A950(0, a1[2], 0, a1);
}

uint64_t sub_1FDE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventStreamType(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v11 = sub_8518(&qword_396B0, v10, (uint64_t)&protocol conformance descriptor for EventStreamType);
  uint64_t result = Set.init(minimumCapacity:)(v9, v2, v11);
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v14 = *(void *)(v3 + 72);
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v15(v6, v13, v2);
      sub_1C054((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v13 += v14;
      --v9;
    }

    while (v9);
    return v17;
  }

  return result;
}

void sub_1FF0C(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v3 = type metadata accessor for EventStreamType(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v26 = a1 + 56;
  uint64_t v11 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v27 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v32 = a1;
  __n128 v14 = swift_bridgeObjectRetain(a1);
  int64_t v15 = 0LL;
  uint64_t v16 = (char *)_swiftEmptyArrayStorage;
  while (v13)
  {
    unint64_t v17 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v18 = v17 | (v15 << 6);
LABEL_22:
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v4 + 16))( v9,  *(void *)(v32 + 48) + *(void *)(v4 + 72) * v18,  v3,  v14);
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
    uint64_t v22 = type metadata accessor for CoreDuetEvent(0LL);
    dispatch thunk of StreamRegistry.resolveStream<A>(identifier:type:)(&v29, v7, v22, v22);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    if (v30)
    {
      sub_7D6C(&v29, (uint64_t)v31);
      sub_7D6C(v31, (uint64_t)&v29);
      if ((swift_isUniquelyReferenced_nonNull_native(v16) & 1) == 0) {
        uint64_t v16 = sub_266A4(0LL, *((void *)v16 + 2) + 1LL, 1, v16);
      }
      unint64_t v24 = *((void *)v16 + 2);
      unint64_t v23 = *((void *)v16 + 3);
      if (v24 >= v23 >> 1) {
        uint64_t v16 = sub_266A4((char *)(v23 > 1), v24 + 1, 1, v16);
      }
      *((void *)v16 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v24 + 1;
      sub_7D6C(&v29, (uint64_t)&v16[40 * v24 + 32]);
    }
  }

  int64_t v19 = v15 + 1;
  if (__OFADD__(v15, 1LL))
  {
    __break(1u);
    goto LABEL_30;
  }

  if (v19 >= v27) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v26 + 8 * v19);
  ++v15;
  if (v20) {
    goto LABEL_21;
  }
  int64_t v15 = v19 + 1;
  if (v19 + 1 >= v27) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v26 + 8 * v15);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v15 = v19 + 2;
  if (v19 + 2 >= v27) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v26 + 8 * v15);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v15 = v19 + 3;
  if (v19 + 3 >= v27) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v26 + 8 * v15);
  if (v20)
  {
LABEL_21:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v15 << 6);
    goto LABEL_22;
  }

  int64_t v21 = v19 + 4;
  if (v21 >= v27)
  {
LABEL_28:
    swift_release(v32);
    return;
  }

  unint64_t v20 = *(void *)(v26 + 8 * v21);
  if (v20)
  {
    int64_t v15 = v21;
    goto LABEL_21;
  }

  while (1)
  {
    int64_t v15 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v26 + 8 * v15);
    ++v21;
    if (v20) {
      goto LABEL_21;
    }
  }

uint64_t sub_20204(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_20248@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144LL))(*(void *)(v2 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_20290@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_8164(a1, v5);
  uint64_t result = dispatch thunk of AppInteractionFeatureExtractor.extract(from:)(v4, v5, v6);
  *a2 = result;
  return result;
}

uint64_t sub_202F0(uint64_t a1, uint64_t a2)
{
  return sub_1AEBC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t *sub_202F8(uint64_t a1, void (*a2)(uint64_t, uint64_t, __n128), uint64_t a3)
{
  int64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v5 = type metadata accessor for FeaturisedTurn(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v9)
  {
    v18[1] = v3;
    int64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_2A764(0, v9, 0);
    uint64_t v10 = v21;
    uint64_t v11 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v13 = *(v11 - 1);
      uint64_t v12 = *v11;
      swift_retain(v13);
      __n128 v14 = swift_bridgeObjectRetain(v12);
      v19(v13, v12, v14);
      swift_bridgeObjectRelease(v12);
      swift_release(v13);
      int64_t v21 = v10;
      unint64_t v16 = v10[2];
      unint64_t v15 = v10[3];
      if (v16 >= v15 >> 1)
      {
        sub_2A764(v15 > 1, v16 + 1, 1);
        uint64_t v10 = v21;
      }

      v10[2] = v16 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))( (unint64_t)v10 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
      + *(void *)(v6 + 72) * v16,
        v8,
        v5);
      v11 += 2;
      --v9;
    }

    while (v9);
  }

  return v10;
}

uint64_t sub_20464(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v6 = *(void *)(v52 - 8);
  uint64_t v7 = __chkstk_darwin(v52);
  uint64_t v50 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v51 = (char *)&v39 - v9;
  uint64_t v10 = &_swiftEmptyDictionarySingleton;
  BOOL v53 = &_swiftEmptyDictionarySingleton;
  uint64_t v11 = *(void *)(a1 + 16);
  if (!v11) {
    return (uint64_t)v10;
  }
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = a1 + v13;
  uint64_t v15 = *(void *)(v6 + 72);
  uint64_t v48 = v13;
  uint64_t v41 = v12 | 7;
  uint64_t v42 = v15 + v13;
  uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16);
  __int128 v40 = xmmword_2EC70;
  uint64_t v45 = v3;
  uint64_t v46 = v2;
  uint64_t v43 = v6;
  uint64_t v44 = v5;
  uint64_t v47 = v15;
  for (uint64_t i = v49(v51, v14, v52); ; uint64_t i = v49(v51, v14, v52))
  {
    SessionGroundTruths.sessionId.getter(i);
    unint64_t v20 = sub_290F8((uint64_t)v5);
    uint64_t v21 = v10[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v10[3] < v23)
    {
      sub_296F4(v23, 1LL);
      uint64_t v10 = v53;
      unint64_t v25 = sub_290F8((uint64_t)v5);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_20;
      }
      unint64_t v20 = v25;
    }

    if ((v24 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v10 = v53;
      uint64_t v27 = v53[7];
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v28(v50, v51, v52);
      unint64_t v29 = *(void *)(v27 + 8 * v20);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v29);
      *(void *)(v27 + 8 * v20) = v29;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v29 = sub_266E0(0, *(void *)(v29 + 16) + 1LL, 1, v29);
        *(void *)(v27 + 8 * v20) = v29;
      }

      unint64_t v32 = *(void *)(v29 + 16);
      unint64_t v31 = *(void *)(v29 + 24);
      if (v32 >= v31 >> 1)
      {
        unint64_t v29 = sub_266E0(v31 > 1, v32 + 1, 1, v29);
        *(void *)(v27 + 8 * v20) = v29;
      }

      uint64_t v5 = v44;
      *(void *)(v29 + 16) = v32 + 1;
      unint64_t v17 = v29 + v48;
      uint64_t v18 = v47;
      v28((char *)(v17 + v32 * v47), v50, v52);
      uint64_t v3 = v45;
      uint64_t v2 = v46;
      uint64_t v6 = v43;
    }

    else
    {
      uint64_t v33 = sub_4CC0(&qword_397D0);
      uint64_t v34 = swift_allocObject(v33, v42, v41);
      *(_OWORD *)(v34 + 16) = v40;
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v34 + v48, v51, v52);
      v10[(v20 >> 6) + 8] |= 1LL << v20;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10[6] + *(void *)(v3 + 72) * v20, v5, v2);
      *(void *)(v10[7] + 8 * v20) = v34;
      uint64_t v35 = v10[2];
      BOOL v36 = __OFADD__(v35, 1LL);
      uint64_t v37 = v35 + 1;
      if (v36) {
        goto LABEL_19;
      }
      v10[2] = v37;
      uint64_t v18 = v47;
    }

    v14 += v18;
    if (!--v11) {
      return (uint64_t)v10;
    }
  }

  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v2);
  __break(1u);
  return result;
}

uint64_t sub_20798(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(uint64_t **)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_4CC0(&qword_397C0);
  uint64_t result = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return result;
  }
  uint64_t v56 = v3;
  uint64_t v57 = a1;
  unint64_t v17 = *(int *)(result + 48);
  unint64_t v55 = (*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v18 = a1 + v55;
  uint64_t v59 = *(void *)(v13 + 72);
  swift_bridgeObjectRetain(a1);
  sub_8418(v18, (uint64_t)v15, &qword_397C0);
  uint64_t v61 = v8;
  unint64_t v62 = v7;
  char v19 = (void (*)(char *, char *, uint64_t))v8[4];
  v19(v10, v15, v7);
  uint64_t v60 = v15;
  unint64_t v58 = v17;
  uint64_t v20 = *(void *)&v15[v17];
  uint64_t v21 = *a3;
  unint64_t v23 = sub_290F8((uint64_t)v10);
  uint64_t v24 = *(void *)(v21 + 16);
  BOOL v25 = (v22 & 1) == 0;
  uint64_t v26 = v24 + v25;
  if (__OFADD__(v24, v25)) {
    goto LABEL_24;
  }
  LOBYTE(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = v22;
  uint64_t v27 = *(void *)(v21 + 24);
  uint64_t v63 = a3;
  uint64_t v53 = v20;
  uint64_t v54 = (void (*)(unint64_t, char *, unint64_t))v19;
  if (v27 >= v26)
  {
    uint64_t v20 = (uint64_t)v60;
    a3 = v61;
    if ((a2 & 1) == 0) {
      goto LABEL_26;
    }
    while (1)
    {
LABEL_7:
      uint64_t v30 = v63;
      unint64_t v31 = (void *)*v63;
      if ((v17 & 1) != 0)
      {
        uint64_t v32 = 8 * v23;
        uint64_t v33 = *(void *)(v31[7] + 8 * v23);
        unint64_t v23 = v62;
        ((void (*)(char *, unint64_t))a3[1])(v10, v62);
        *(void *)(*(void *)(*v30 + 56LL) + v3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v33;
        uint64_t v34 = v16 - 1;
        if (v16 == 1) {
          return swift_bridgeObjectRelease(v57);
        }
      }

      else
      {
        v31[(v23 >> 6) + 8] |= 1LL << v23;
        unint64_t v17 = v62;
        v54(v31[6] + a3[9] * v23, v10, v62);
        *(void *)(v31[7] + 8 * v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 23) = v53;
        uint64_t v35 = v31[2];
        BOOL v36 = __OFADD__(v35, 1LL);
        uint64_t v37 = v35 + 1;
        if (v36) {
          goto LABEL_25;
        }
        unint64_t v23 = v17;
        __int128 v31[2] = v37;
        uint64_t v34 = v16 - 1;
        if (v16 == 1) {
          return swift_bridgeObjectRelease(v57);
        }
      }

      uint64_t v16 = v57 + v59 + v55;
      while (1)
      {
        sub_8418(v16, v20, &qword_397C0);
        a3 = (uint64_t *)a3[4];
        ((void (*)(char *, uint64_t, unint64_t))a3)(v10, v20, v23);
        uint64_t v20 = *(void *)(v20 + v58);
        __int128 v40 = v63;
        uint64_t v41 = (void *)*v63;
        unint64_t v17 = sub_290F8((uint64_t)v10);
        uint64_t v43 = v41[2];
        BOOL v44 = (v42 & 1) == 0;
        uint64_t v45 = v43 + v44;
        if (__OFADD__(v43, v44)) {
          break;
        }
        char v46 = v42;
        if (v41[3] < v45)
        {
          sub_29354(v45, 1LL);
          unint64_t v47 = sub_290F8((uint64_t)v10);
          if ((v46 & 1) != (v48 & 1)) {
            goto LABEL_27;
          }
          unint64_t v17 = v47;
        }

        uint64_t v49 = (void *)*v40;
        if ((v46 & 1) != 0)
        {
          uint64_t v38 = 8 * v17;
          uint64_t v39 = *(void *)(v49[7] + v38);
          a3 = v61;
          unint64_t v23 = v62;
          ((void (*)(char *, unint64_t))v61[1])(v10, v62);
          *(void *)(*(void *)(*v40 + 56LL) + v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 38) = v39;
          uint64_t v20 = (uint64_t)v60;
        }

        else
        {
          v49[(v17 >> 6) + 8] |= 1LL << v17;
          uint64_t v50 = v61;
          unint64_t v23 = v62;
          ((void (*)(unint64_t, char *, unint64_t))a3)(v49[6] + v61[9] * v17, v10, v62);
          *(void *)(v49[7] + 8 * v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = v20;
          uint64_t v51 = v49[2];
          BOOL v36 = __OFADD__(v51, 1LL);
          uint64_t v52 = v51 + 1;
          uint64_t v20 = (uint64_t)v60;
          if (v36) {
            goto LABEL_25;
          }
          a3 = v50;
          v49[2] = v52;
        }

        v16 += v59;
        if (!--v34) {
          return swift_bridgeObjectRelease(v57);
        }
      }

LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      sub_2A1EC();
    }
  }

  sub_29354(v26, a2 & 1);
  unint64_t v28 = sub_290F8((uint64_t)v10);
  if ((v17 & 1) == (v29 & 1))
  {
    unint64_t v23 = v28;
    uint64_t v20 = (uint64_t)v60;
    a3 = v61;
    goto LABEL_7;
  }

    __int128 v40 = (v21 - 1) & v21;
    uint64_t v41 = v22;
  }

  unint64_t v23 = v20 + 4;
  if (v23 >= v39) {
    return 1LL;
  }
  uint64_t v21 = *(void *)(v38 + 8 * v23);
  if (v21)
  {
    char v22 = v23;
    goto LABEL_24;
  }

  while (1)
  {
    char v22 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v22 >= v39) {
      return 1LL;
    }
    uint64_t v21 = *(void *)(v38 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_24;
    }
  }

uint64_t sub_20B64(unint64_t a1, unint64_t a2, char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v89 = type metadata accessor for UUID(0LL);
  uint64_t v85 = *(void *)(v89 - 8);
  uint64_t v10 = __chkstk_darwin(v89);
  unint64_t v84 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  BOOL v83 = (char *)&v77 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v82 = (char *)&v77 - v15;
  __chkstk_darwin(v14);
  uint64_t v81 = (char *)&v77 - v16;
  uint64_t v17 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v88 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v18);
  char v80 = (char *)&v77 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v77 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v77 - v25;
  uint64_t v28 = *(void *)(v27 + 72);
  uint64_t v86 = v27;
  uint64_t v87 = v28;
  if (!v28)
  {
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }

  if (a2 - a1 == 0x8000000000000000LL && v87 == -1) {
    goto LABEL_80;
  }
  char v29 = &a3[-a2];
  uint64_t v30 = (uint64_t)(a2 - a1) / v87;
  unint64_t v92 = a1;
  unint64_t v91 = a4;
  uint64_t v31 = (uint64_t)v29 / v87;
  if (v30 >= (uint64_t)v29 / v87)
  {
    if ((v31 & 0x8000000000000000LL) == 0)
    {
      uint64_t v33 = v31 * v87;
      if (a4 < a2 || a2 + v33 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2);
      }

      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4, a2);
      }

      unint64_t v52 = a4 + v33;
      unint64_t v90 = a4 + v33;
      unint64_t v92 = a2;
      if (v33 >= 1 && a1 < a2)
      {
        uint64_t v54 = -v87;
        unint64_t v55 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v86 + 16);
        uint64_t v78 = v17;
        uint64_t v79 = v55;
        uint64_t v87 = a5;
        uint64_t v81 = (char *)a1;
        uint64_t v82 = (char *)a4;
        do
        {
          uint64_t v56 = v79;
          v79(v80, v52 + v54, v17);
          unint64_t v57 = a2 + v54;
          uint64_t v58 = v56(v88, a2 + v54, v17);
          uint64_t v59 = (uint64_t)v83;
          SessionGroundTruths.sessionId.getter(v58);
          if (*(void *)(a5 + 16) && (unint64_t v60 = sub_290F8(v59), (v61 & 1) != 0))
          {
            uint64_t v62 = a5;
            int64_t v63 = *(void *)(*(void *)(a5 + 56) + 8 * v60);
          }

          else
          {
            uint64_t v62 = a5;
            int64_t v63 = 0x8000000000000000LL;
          }

          uint64_t v64 = (uint64_t)v84;
          uint64_t v65 = *(uint64_t (**)(char *, uint64_t))(v85 + 8);
          uint64_t v66 = v65(v83, v89);
          SessionGroundTruths.sessionId.getter(v66);
          if (*(void *)(v62 + 16))
          {
            uint64_t v67 = v62;
            unint64_t v68 = sub_290F8(v64);
            uint64_t v17 = v78;
            if ((v69 & 1) != 0) {
              int64_t v70 = *(void *)(*(void *)(v67 + 56) + 8 * v68);
            }
            else {
              int64_t v70 = 0x8000000000000000LL;
            }
          }

          else
          {
            int64_t v70 = 0x8000000000000000LL;
            uint64_t v17 = v78;
          }

          unint64_t v71 = (unint64_t)&a3[v54];
          v65(v84, v89);
          uint64_t v72 = *(void (**)(char *, uint64_t))(v86 + 8);
          v72(v88, v17);
          v72(v80, v17);
          if (v63 >= v70)
          {
            unint64_t v74 = v90;
            unint64_t v75 = v90 + v54;
            v90 += v54;
            a5 = v87;
            unint64_t v73 = (unint64_t)v82;
            if ((unint64_t)a3 < v74 || v71 >= v74)
            {
              swift_arrayInitWithTakeFrontToBack(&a3[v54], v75);
            }

            else if (a3 != (char *)v74)
            {
              swift_arrayInitWithTakeBackToFront(&a3[v54], v75);
            }

            unint64_t v57 = a2;
          }

          else
          {
            a5 = v87;
            unint64_t v73 = (unint64_t)v82;
            if ((unint64_t)a3 < a2 || v71 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(&a3[v54], a2 + v54);
            }

            else if (a3 != (char *)a2)
            {
              swift_arrayInitWithTakeBackToFront(&a3[v54], a2 + v54);
            }

            v92 += v54;
          }

          unint64_t v52 = v90;
          if (v90 <= v73) {
            break;
          }
          a2 = v57;
          a3 += v54;
        }

        while (v57 > (unint64_t)v81);
      }

      goto LABEL_78;
    }
  }

  else if ((v30 & 0x8000000000000000LL) == 0)
  {
    uint64_t v32 = v30 * v87;
    if (a4 < a1 || a1 + v32 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1);
    }

    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }

    uint64_t v88 = (char *)(a4 + v32);
    unint64_t v90 = a4 + v32;
    if (v32 >= 1 && a2 < (unint64_t)a3)
    {
      BOOL v83 = *(char **)(v86 + 16);
      unint64_t v84 = a3;
      do
      {
        uint64_t v35 = (uint64_t (*)(char *, unint64_t, uint64_t))v83;
        ((void (*)(char *, unint64_t, uint64_t))v83)(v26, a2, v17);
        uint64_t v36 = v35(v24, a4, v17);
        uint64_t v37 = (uint64_t)v81;
        SessionGroundTruths.sessionId.getter(v36);
        if (*(void *)(a5 + 16))
        {
          unint64_t v38 = sub_290F8(v37);
          uint64_t v39 = (uint64_t)v82;
          if ((v40 & 1) != 0) {
            int64_t v41 = *(void *)(*(void *)(a5 + 56) + 8 * v38);
          }
          else {
            int64_t v41 = 0x8000000000000000LL;
          }
        }

        else
        {
          int64_t v41 = 0x8000000000000000LL;
          uint64_t v39 = (uint64_t)v82;
        }

        char v42 = *(uint64_t (**)(char *, uint64_t))(v85 + 8);
        uint64_t v43 = v42(v81, v89);
        SessionGroundTruths.sessionId.getter(v43);
        if (*(void *)(a5 + 16) && (unint64_t v44 = sub_290F8(v39), (v45 & 1) != 0)) {
          int64_t v46 = *(void *)(*(void *)(a5 + 56) + 8 * v44);
        }
        else {
          int64_t v46 = 0x8000000000000000LL;
        }
        v42(v82, v89);
        unint64_t v47 = *(void (**)(char *, uint64_t))(v86 + 8);
        v47(v24, v17);
        v47(v26, v17);
        unint64_t v48 = v92;
        if (v41 >= v46)
        {
          unint64_t v51 = v91 + v87;
          uint64_t v50 = v84;
          if (v92 < v91 || v92 >= v51)
          {
            swift_arrayInitWithTakeFrontToBack(v92, v91);
          }

          else if (v92 != v91)
          {
            swift_arrayInitWithTakeBackToFront(v92, v91);
          }

          unint64_t v91 = v51;
          unint64_t v49 = a2;
        }

        else
        {
          unint64_t v49 = a2 + v87;
          uint64_t v50 = v84;
          if (v92 < a2 || v92 >= v49)
          {
            swift_arrayInitWithTakeFrontToBack(v92, a2);
          }

          else if (v92 == a2)
          {
            unint64_t v48 = a2;
          }

          else
          {
            swift_arrayInitWithTakeBackToFront(v92, a2);
          }
        }

        unint64_t v92 = v48 + v87;
        a4 = v91;
        a2 = v49;
      }

      while (v49 < (unint64_t)v50);
    }

LABEL_78:
    sub_1F7EC( &v92,  &v91,  (uint64_t *)&v90,  (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
    return 1LL;
  }

LABEL_82:
  swift_bridgeObjectRelease(a5);
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_21258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  unint64_t v57 = a4;
  uint64_t v47 = a1;
  uint64_t v61 = type metadata accessor for UUID(0LL);
  uint64_t v50 = *(void *)(v61 - 8);
  uint64_t v8 = __chkstk_darwin(v61);
  unint64_t v60 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v58 = *(void **)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v54 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v13);
  int64_t v63 = (char *)&v45 - v16;
  uint64_t result = __chkstk_darwin(v15);
  uint64_t v59 = (char *)&v45 - v18;
  uint64_t v53 = a3;
  uint64_t v46 = a2;
  if (a3 != a2)
  {
    uint64_t v19 = v58[9];
    unint64_t v48 = (uint64_t (*)(char *, uint64_t, uint64_t))v58[2];
    uint64_t v49 = a5;
    uint64_t v62 = v19 * (v53 - 1);
    uint64_t v51 = v19;
    uint64_t v20 = v19 * v53;
LABEL_5:
    uint64_t v21 = 0LL;
    uint64_t v22 = v47;
    uint64_t v52 = v20;
    while (1)
    {
      uint64_t v23 = *v57;
      uint64_t v56 = v20 + v21;
      uint64_t v24 = v20 + v21 + v23;
      uint64_t v25 = v48;
      v48(v59, v24, v12);
      uint64_t v55 = v62 + v21;
      uint64_t v26 = v25(v63, v62 + v21 + v23, v12);
      SessionGroundTruths.sessionId.getter(v26);
      else {
        int64_t v29 = 0x8000000000000000LL;
      }
      uint64_t v30 = v60;
      uint64_t v31 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
      uint64_t v32 = v11;
      uint64_t v33 = v31(v11, v61);
      uint64_t v34 = (uint64_t)v30;
      SessionGroundTruths.sessionId.getter(v33);
      uint64_t v35 = v49;
      if (*(void *)(v49 + 16))
      {
        unint64_t v36 = sub_290F8(v34);
        a5 = v35;
        if ((v37 & 1) != 0) {
          int64_t v38 = *(void *)(*(void *)(v35 + 56) + 8 * v36);
        }
        else {
          int64_t v38 = 0x8000000000000000LL;
        }
      }

      else
      {
        int64_t v38 = 0x8000000000000000LL;
        a5 = v49;
      }

      v31(v60, v61);
      uint64_t v39 = (void (*)(char *, uint64_t))v58[1];
      v39(v63, v12);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v39)(v59, v12);
      BOOL v40 = v29 < v38;
      uint64_t v11 = v32;
      uint64_t v20 = v52;
      if (!v40)
      {
LABEL_4:
        v62 += v51;
        v20 += v51;
        if (++v53 == v46) {
          return result;
        }
        goto LABEL_5;
      }

      uint64_t v41 = *v57;
      if (!*v57) {
        break;
      }
      uint64_t v42 = v41 + v52 + v21;
      uint64_t v43 = v41 + v62 + v21;
      unint64_t v44 = (void (*)(char *, uint64_t, uint64_t))v58[4];
      v44(v54, v42, v12);
      swift_arrayInitWithTakeFrontToBack(v42, v43);
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v44)(v43, v54, v12);
      v21 -= v51;
      if (v53 == ++v22) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_215AC(uint64_t *a1, uint64_t a2)
{
  uint64_t v230 = type metadata accessor for UUID(0LL);
  uint64_t v220 = *(void *)(v230 - 8);
  uint64_t v5 = __chkstk_darwin(v230);
  uint64_t v7 = (char *)&v203 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v203 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v212 = (char *)&v203 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v215 = (char *)&v203 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v205 = (char *)&v203 - v16;
  __chkstk_darwin(v15);
  uint64_t v204 = (char *)&v203 - v17;
  uint64_t v234 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v231 = *(void *)(v234 - 8);
  uint64_t v18 = __chkstk_darwin(v234);
  v209 = (char *)&v203 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v18);
  unint64_t v224 = (char *)&v203 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v233 = (char *)&v203 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v227 = (char *)&v203 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v216 = (char *)&v203 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v213 = (char *)&v203 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v207 = (char *)&v203 - v31;
  __chkstk_darwin(v30);
  unint64_t v206 = (char *)&v203 - v32;
  v229 = a1;
  Swift::Int v33 = a1[1];
  uint64_t v232 = a2;
  swift_bridgeObjectRetain_n(a2, 3LL);
  Swift::Int v34 = _minimumMergeRunLength(_:)(v33);
  if (v34 >= v33)
  {
    if (v33 < 0) {
      goto LABEL_168;
    }
    if (!v33) {
      return swift_bridgeObjectRelease_n(v232, 3LL);
    }
    uint64_t v38 = v232;
    swift_bridgeObjectRetain(v232);
    sub_21258(0LL, v33, 1LL, v229, v38);
    return swift_bridgeObjectRelease_n(v38, 4LL);
  }

  if (v33 >= 0) {
    uint64_t v35 = v33;
  }
  else {
    uint64_t v35 = v33 + 1;
  }
  if (v33 < -1) {
    goto LABEL_176;
  }
  v226 = v7;
  Swift::Int v203 = v34;
  uint64_t v218 = v2;
  if (v33 < 2)
  {
    char v37 = _swiftEmptyArrayStorage;
    unint64_t v214 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v231 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v231 + 80));
    if (v33 != 1)
    {
      unint64_t v41 = _swiftEmptyArrayStorage[2];
      unint64_t v183 = (char *)_swiftEmptyArrayStorage;
LABEL_133:
      uint64_t v211 = v37;
      if (v41 >= 2)
      {
        uint64_t v184 = *v229;
        uint64_t v185 = v232;
        do
        {
          unint64_t v186 = v41 - 2;
          if (v41 < 2) {
            goto LABEL_163;
          }
          if (!v184) {
            goto LABEL_175;
          }
          uint64_t v217 = v183;
          Swift::Int v187 = v183 + 32;
          uint64_t v188 = *(void *)&v183[16 * v186 + 32];
          uint64_t v189 = *(void *)&v187[16 * v41 - 8];
          uint64_t v190 = *(void *)(v231 + 72);
          unint64_t v191 = v184 + v190 * v188;
          unint64_t v192 = v184 + v190 * *(void *)&v187[16 * v41 - 16];
          uint64_t v193 = (char *)(v184 + v190 * v189);
          swift_bridgeObjectRetain(v185);
          unint64_t v194 = v191;
          uint64_t v195 = v218;
          sub_20B64(v194, v192, v193, v214, v185);
          uint64_t v218 = v195;
          if (v195) {
            goto LABEL_145;
          }
          swift_bridgeObjectRelease(v185);
          if (v189 < v188) {
            goto LABEL_164;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v217) & 1) == 0) {
            uint64_t v217 = sub_1F8F8((uint64_t)v217);
          }
          uint64_t v196 = v217;
          if (v186 >= *((void *)v217 + 2)) {
            goto LABEL_165;
          }
          uint64_t v197 = v217 + 32;
          uint64_t v198 = &v217[16 * v186 + 32];
          *(void *)uint64_t v198 = v188;
          *((void *)v198 + 1) = v189;
          unint64_t v199 = *((void *)v196 + 2);
          if (v41 > v199) {
            goto LABEL_166;
          }
          unint64_t v183 = v196;
          memmove(&v197[16 * v41 - 16], &v197[16 * v41], 16 * (v199 - v41));
          *((void *)v183 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v199 - 1;
          unint64_t v41 = v199 - 1;
        }

        while (v199 > 2);
      }

      swift_bridgeObjectRelease(v183);
      uint64_t v200 = v211;
      v211[2] = 0LL;
      swift_bridgeObjectRelease_n(v232, 3LL);
      return swift_bridgeObjectRelease(v200);
    }
  }

  else
  {
    uint64_t v36 = v35 >> 1;
    char v37 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(v35 >> 1, v234);
    v37[2] = v36;
    unint64_t v214 = (unint64_t)v37
         + ((*(unsigned __int8 *)(v231 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v231 + 80));
  }

  Swift::Int v40 = 0LL;
  uint64_t v217 = (char *)_swiftEmptyArrayStorage;
  uint64_t v211 = v37;
  uint64_t v221 = v10;
  while (1)
  {
    Swift::Int v42 = v40;
    Swift::Int v43 = v40 + 1;
    Swift::Int v210 = v40;
    if (v40 + 1 >= v33)
    {
      ++v40;
      uint64_t v55 = v234;
    }

    else
    {
      uint64_t v44 = *v229;
      unint64_t v45 = *(void *)(v231 + 72);
      uint64_t v46 = *(void (**)(char *, unint64_t, uint64_t))(v231 + 16);
      uint64_t v47 = v234;
      v46(v206, *v229 + v45 * v43, v234);
      uint64_t v208 = v44;
      uint64_t v228 = v45;
      uint64_t v48 = ((uint64_t (*)(char *, unint64_t, uint64_t))v46)(v207, v44 + v45 * v42, v47);
      uint64_t v49 = (uint64_t)v204;
      SessionGroundTruths.sessionId.getter(v48);
      uint64_t v50 = v232;
      if (*(void *)(v232 + 16))
      {
        unint64_t v51 = sub_290F8(v49);
        uint64_t v52 = v217;
        if ((v53 & 1) != 0) {
          unint64_t v54 = *(void *)(*(void *)(v50 + 56) + 8 * v51);
        }
        else {
          unint64_t v54 = 0x8000000000000000LL;
        }
        v223 = (void (*)(char *, uint64_t, uint64_t))v54;
        uint64_t v49 = (uint64_t)v204;
      }

      else
      {
        v223 = (void (*)(char *, uint64_t, uint64_t))0x8000000000000000LL;
        uint64_t v52 = v217;
      }

      uint64_t v56 = *(uint64_t (**)(uint64_t, uint64_t))(v220 + 8);
      uint64_t v57 = v56(v49, v230);
      uint64_t v58 = (uint64_t)v205;
      SessionGroundTruths.sessionId.getter(v57);
      uint64_t v59 = v232;
      if (*(void *)(v232 + 16))
      {
        unint64_t v60 = sub_290F8(v58);
        if ((v61 & 1) != 0) {
          unint64_t v62 = *(void *)(*(void *)(v59 + 56) + 8 * v60);
        }
        else {
          unint64_t v62 = 0x8000000000000000LL;
        }
        int64_t v222 = v62;
        int64_t v63 = v215;
        uint64_t v58 = (uint64_t)v205;
      }

      else
      {
        int64_t v222 = 0x8000000000000000LL;
        int64_t v63 = v215;
      }

      v56(v58, v230);
      uint64_t v64 = *(void (**)(char *, uint64_t))(v231 + 8);
      uint64_t v65 = v234;
      v64(v207, v234);
      v64(v206, v65);
      Swift::Int v42 = v210;
      Swift::Int v40 = v210 + 2;
      uint64_t v225 = (char *)v33;
      if (v210 + 2 < v33)
      {
        uint64_t v217 = v52;
        unint64_t v219 = v228 * v43;
        uint64_t v66 = v208;
        unint64_t v67 = v228 * v40;
        while (1)
        {
          uint64_t v68 = v234;
          v46(v213, v66 + v67, v234);
          uint64_t v69 = ((uint64_t (*)(char *, unint64_t, uint64_t))v46)(v216, v66 + v219, v68);
          uint64_t v70 = (uint64_t)v63;
          SessionGroundTruths.sessionId.getter(v69);
          uint64_t v71 = v232;
          if (*(void *)(v232 + 16) && (unint64_t v72 = sub_290F8(v70), (v73 & 1) != 0)) {
            int64_t v74 = *(void *)(*(void *)(v71 + 56) + 8 * v72);
          }
          else {
            int64_t v74 = 0x8000000000000000LL;
          }
          uint64_t v75 = (uint64_t)v212;
          uint64_t v76 = v56((uint64_t)v215, v230);
          SessionGroundTruths.sessionId.getter(v76);
          uint64_t v77 = v232;
          if (*(void *)(v232 + 16) && (unint64_t v78 = sub_290F8(v75), (v79 & 1) != 0)) {
            int64_t v80 = *(void *)(*(void *)(v77 + 56) + 8 * v78);
          }
          else {
            int64_t v80 = 0x8000000000000000LL;
          }
          BOOL v81 = (uint64_t)v223 < v222;
          v56((uint64_t)v212, v230);
          BOOL v82 = v74 >= v80;
          uint64_t v83 = v234;
          v64(v216, v234);
          v64(v213, v83);
          if (((v81 ^ v82) & 1) == 0) {
            break;
          }
          ++v40;
          v66 += v228;
          int64_t v63 = v215;
          if (v225 == (char *)v40)
          {
            Swift::Int v33 = (Swift::Int)v225;
            Swift::Int v40 = (Swift::Int)v225;
            Swift::Int v42 = v210;
            goto LABEL_43;
          }
        }

        Swift::Int v42 = v210;
        Swift::Int v33 = (Swift::Int)v225;
      }

LABEL_43:
      char v37 = v211;
      uint64_t v10 = v221;
      uint64_t v55 = v234;
      if ((uint64_t)v223 < v222)
      {
        if (v40 < v42) {
          goto LABEL_169;
        }
        if (v42 < v40)
        {
          uint64_t v84 = 0LL;
          int64_t v85 = v228 * (v40 - 1);
          Swift::Int v86 = v42;
          unint64_t v87 = v40 * v228;
          Swift::Int v88 = v86;
          int64_t v89 = v86 * v228;
          do
          {
            if (v88 != v40 + v84 - 1)
            {
              uint64_t v92 = v208;
              if (!v208) {
                goto LABEL_174;
              }
              Swift::Int v93 = v40;
              unint64_t v94 = v208 + v89;
              uint64_t v95 = v208 + v85;
              v223 = *(void (**)(char *, uint64_t, uint64_t))(v231 + 32);
              v223(v209, v208 + v89, v234);
              if (v89 < v85 || v94 >= v92 + v87)
              {
                uint64_t v90 = v92 + v89;
                uint64_t v91 = v92 + v85;
                uint64_t v55 = v234;
                swift_arrayInitWithTakeFrontToBack(v90, v91);
              }

              else
              {
                uint64_t v55 = v234;
                if (v89 != v85) {
                  swift_arrayInitWithTakeBackToFront(v94, v95);
                }
              }

              v223((char *)v95, (uint64_t)v209, v55);
              Swift::Int v40 = v93;
              Swift::Int v33 = (Swift::Int)v225;
            }

            ++v88;
            --v84;
            v85 -= v228;
            v87 -= v228;
            v89 += v228;
          }

          while (v88 < v40 + v84);
          char v37 = v211;
          uint64_t v10 = v221;
          Swift::Int v42 = v210;
        }
      }
    }

    if (v40 >= v33) {
      goto LABEL_83;
    }
    if (__OFSUB__(v40, v42)) {
      goto LABEL_167;
    }
    if (v40 - v42 >= v203) {
      goto LABEL_83;
    }
    if (__OFADD__(v42, v203)) {
      goto LABEL_170;
    }
    Swift::Int v96 = v42 + v203 >= v33 ? v33 : v42 + v203;
    if (v96 < v42) {
      break;
    }
    if (v40 != v96)
    {
      int64_t v97 = *(void *)(v231 + 72);
      unint64_t v219 = *(void *)(v231 + 16);
      uint64_t v228 = v97 * (v40 - 1);
      int64_t v222 = v97;
      Swift::Int v98 = v40 * v97;
      uint64_t v208 = v96;
      do
      {
        uint64_t v100 = 0LL;
        Swift::Int v101 = v42;
        v223 = (void (*)(char *, uint64_t, uint64_t))v40;
        while (1)
        {
          uint64_t v102 = *v229;
          Swift::Int v103 = v98;
          uint64_t v225 = (char *)(v98 + v100);
          uint64_t v104 = v98 + v100 + v102;
          unint64_t v105 = (uint64_t (*)(char *, uint64_t, uint64_t))v219;
          ((void (*)(char *, uint64_t, uint64_t))v219)(v227, v104, v55);
          uint64_t v106 = v105(v233, v228 + v100 + v102, v55);
          SessionGroundTruths.sessionId.getter(v106);
          uint64_t v107 = v232;
          if (!*(void *)(v232 + 16)) {
            goto LABEL_74;
          }
          unint64_t v108 = sub_290F8((uint64_t)v10);
          if ((v109 & 1) != 0) {
            int64_t v110 = *(void *)(*(void *)(v107 + 56) + 8 * v108);
          }
          else {
LABEL_74:
          }
            int64_t v110 = 0x8000000000000000LL;
          Swift::Int v98 = v103;
          uint64_t v111 = *(uint64_t (**)(char *, uint64_t))(v220 + 8);
          uint64_t v112 = v111(v10, v230);
          uint64_t v113 = (uint64_t)v226;
          SessionGroundTruths.sessionId.getter(v112);
          uint64_t v114 = v232;
          if (*(void *)(v232 + 16) && (unint64_t v115 = sub_290F8(v113), (v116 & 1) != 0)) {
            int64_t v117 = *(void *)(*(void *)(v114 + 56) + 8 * v115);
          }
          else {
            int64_t v117 = 0x8000000000000000LL;
          }
          v111(v226, v230);
          char v118 = *(void (**)(char *, uint64_t))(v231 + 8);
          uint64_t v119 = v234;
          v118(v233, v234);
          v118(v227, v119);
          uint64_t v10 = v221;
          if (v110 >= v117) {
            break;
          }
          uint64_t v120 = *v229;
          if (!*v229) {
            goto LABEL_172;
          }
          uint64_t v121 = v120 + v98 + v100;
          uint64_t v122 = (char *)(v120 + v228 + v100);
          uint64_t v123 = *(void (**)(char *, uint64_t, uint64_t))(v231 + 32);
          v123(v224, v121, v234);
          swift_arrayInitWithTakeFrontToBack(v121, v122);
          uint64_t v55 = v234;
          v123(v122, (uint64_t)v224, v234);
          uint64_t v99 = v223;
          v100 -= v222;
        }

        uint64_t v55 = v234;
        uint64_t v99 = v223;
LABEL_68:
        Swift::Int v40 = (Swift::Int)v99 + 1;
        v228 += v222;
        v98 += v222;
        Swift::Int v42 = v210;
      }

      while (v40 != v208);
      Swift::Int v40 = v208;
      char v37 = v211;
    }

      uint64_t result = swift_release(v8);
      goto LABEL_44;
    }

    uint64_t v23 = v43;
    uint64_t v24 = v43[v22];
    ++v17;
    if (!v24)
    {
      uint64_t v17 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_36;
      }
      uint64_t v24 = v43[v17];
      if (!v24) {
        break;
      }
    }

      uint64_t v48 = v49;
      goto LABEL_44;
    }

    uint64_t v30 = v55;
    uint64_t v31 = v55[v29];
    ++v21;
    if (!v31)
    {
      uint64_t v21 = v29 + 1;
      if (v29 + 1 >= v54) {
        goto LABEL_36;
      }
      uint64_t v31 = v55[v21];
      if (!v31) {
        break;
      }
    }

LABEL_83:
    uint64_t v124 = v217;
    if (v40 < v42) {
      goto LABEL_162;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v217) & 1) == 0) {
      uint64_t v124 = sub_1F6F4(0LL, *((void *)v124 + 2) + 1LL, 1, v124);
    }
    unint64_t v126 = *((void *)v124 + 2);
    unint64_t v125 = *((void *)v124 + 3);
    unint64_t v41 = v126 + 1;
    if (v126 >= v125 >> 1) {
      uint64_t v124 = sub_1F6F4((char *)(v125 > 1), v126 + 1, 1, v124);
    }
    *((void *)v124 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v41;
    unint64_t v127 = v124 + 32;
    uint64_t v128 = &v124[16 * v126 + 32];
    *(void *)uint64_t v128 = v42;
    *((void *)v128 + 1) = v40;
    uint64_t v217 = v124;
    if (v126)
    {
      uint64_t v225 = v124 + 32;
      while (1)
      {
        unint64_t v129 = v41 - 1;
        if (v41 >= 4)
        {
          uint64_t v134 = &v127[16 * v41];
          uint64_t v135 = *((void *)v134 - 8);
          uint64_t v136 = *((void *)v134 - 7);
          BOOL v140 = __OFSUB__(v136, v135);
          uint64_t v137 = v136 - v135;
          if (v140) {
            goto LABEL_151;
          }
          uint64_t v139 = *((void *)v134 - 6);
          uint64_t v138 = *((void *)v134 - 5);
          BOOL v140 = __OFSUB__(v138, v139);
          uint64_t v132 = v138 - v139;
          char v133 = v140;
          if (v140) {
            goto LABEL_152;
          }
          unint64_t v141 = v41 - 2;
          BOOL v142 = &v127[16 * v41 - 32];
          uint64_t v144 = *(void *)v142;
          uint64_t v143 = *((void *)v142 + 1);
          BOOL v140 = __OFSUB__(v143, v144);
          uint64_t v145 = v143 - v144;
          if (v140) {
            goto LABEL_154;
          }
          BOOL v140 = __OFADD__(v132, v145);
          uint64_t v146 = v132 + v145;
          if (v140) {
            goto LABEL_157;
          }
          if (v146 >= v137)
          {
            uint64_t v164 = &v127[16 * v129];
            uint64_t v166 = *(void *)v164;
            uint64_t v165 = *((void *)v164 + 1);
            BOOL v140 = __OFSUB__(v165, v166);
            uint64_t v167 = v165 - v166;
            if (v140) {
              goto LABEL_161;
            }
            BOOL v157 = v132 < v167;
            goto LABEL_121;
          }
        }

        else
        {
          if (v41 != 3)
          {
            uint64_t v158 = *((void *)v124 + 4);
            uint64_t v159 = *((void *)v124 + 5);
            BOOL v140 = __OFSUB__(v159, v158);
            uint64_t v151 = v159 - v158;
            char v152 = v140;
            goto LABEL_115;
          }

          uint64_t v131 = *((void *)v124 + 4);
          uint64_t v130 = *((void *)v124 + 5);
          BOOL v140 = __OFSUB__(v130, v131);
          uint64_t v132 = v130 - v131;
          char v133 = v140;
        }

        if ((v133 & 1) != 0) {
          goto LABEL_153;
        }
        unint64_t v141 = v41 - 2;
        uint64_t v147 = &v127[16 * v41 - 32];
        uint64_t v149 = *(void *)v147;
        uint64_t v148 = *((void *)v147 + 1);
        BOOL v150 = __OFSUB__(v148, v149);
        uint64_t v151 = v148 - v149;
        char v152 = v150;
        if (v150) {
          goto LABEL_156;
        }
        uint64_t v153 = &v127[16 * v129];
        uint64_t v155 = *(void *)v153;
        uint64_t v154 = *((void *)v153 + 1);
        BOOL v140 = __OFSUB__(v154, v155);
        uint64_t v156 = v154 - v155;
        if (v140) {
          goto LABEL_159;
        }
        if (__OFADD__(v151, v156)) {
          goto LABEL_160;
        }
        if (v151 + v156 >= v132)
        {
          BOOL v157 = v132 < v156;
LABEL_121:
          if (v157) {
            unint64_t v129 = v141;
          }
          goto LABEL_123;
        }

LABEL_115:
        if ((v152 & 1) != 0) {
          goto LABEL_155;
        }
        uint64_t v160 = &v127[16 * v129];
        uint64_t v162 = *(void *)v160;
        uint64_t v161 = *((void *)v160 + 1);
        BOOL v140 = __OFSUB__(v161, v162);
        uint64_t v163 = v161 - v162;
        if (v140) {
          goto LABEL_158;
        }
        if (v163 < v151) {
          goto LABEL_14;
        }
LABEL_123:
        unint64_t v168 = v129 - 1;
        if (v129 - 1 >= v41)
        {
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
          goto LABEL_171;
        }

        uint64_t v169 = *v229;
        if (!*v229) {
          goto LABEL_173;
        }
        unint64_t v170 = &v127[16 * v168];
        uint64_t v171 = *(void *)v170;
        unint64_t v172 = v129;
        uint64_t v173 = &v127[16 * v129];
        uint64_t v174 = *((void *)v173 + 1);
        uint64_t v175 = v232;
        uint64_t v176 = *(void *)(v231 + 72);
        unint64_t v177 = v169 + v176 * *(void *)v170;
        uint64_t v228 = v169 + v176 * *(void *)v173;
        unint64_t v178 = (char *)(v169 + v176 * v174);
        swift_bridgeObjectRetain(v232);
        unint64_t v179 = v177;
        uint64_t v180 = v218;
        sub_20B64(v179, v228, v178, v214, v175);
        if (v180)
        {
LABEL_145:
          swift_bridgeObjectRelease(v217);
          uint64_t v201 = v232;
          swift_bridgeObjectRelease(v232);
          uint64_t v202 = v211;
          v211[2] = 0LL;
          swift_bridgeObjectRelease_n(v201, 3LL);
          return swift_bridgeObjectRelease(v202);
        }

        swift_bridgeObjectRelease(v175);
        if (v174 < v171) {
          goto LABEL_148;
        }
        uint64_t v124 = v217;
        if (v172 > *((void *)v217 + 2)) {
          goto LABEL_149;
        }
        unint64_t v181 = v172;
        *(void *)unint64_t v170 = v171;
        unint64_t v127 = v225;
        *(void *)&v225[16 * v168 + 8] = v174;
        unint64_t v182 = *((void *)v124 + 2);
        if (v172 >= v182) {
          goto LABEL_150;
        }
        uint64_t v218 = v180;
        unint64_t v41 = v182 - 1;
        memmove(v173, v173 + 16, 16 * (v182 - 1 - v181));
        *((void *)v124 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v182 - 1;
        BOOL v157 = v182 > 2;
        char v37 = v211;
        if (!v157) {
          goto LABEL_14;
        }
      }
    }

    unint64_t v41 = 1LL;
LABEL_14:
    Swift::Int v33 = v229[1];
    uint64_t v10 = v221;
    if (v40 >= v33)
    {
      unint64_t v183 = v217;
      goto LABEL_133;
    }
  }

LABEL_171:
  __break(1u);
LABEL_172:
  swift_bridgeObjectRelease_n(v232, 3LL);
  __break(1u);
LABEL_173:
  swift_bridgeObjectRelease_n(v232, 3LL);
  __break(1u);
LABEL_174:
  swift_bridgeObjectRelease_n(v232, 3LL);
  __break(1u);
LABEL_175:
  swift_bridgeObjectRelease_n(v232, 3LL);
  __break(1u);
LABEL_176:
  swift_bridgeObjectRelease_n(v232, 4LL);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_224C0(void **a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(type metadata accessor for SessionGroundTruths(0LL) - 8);
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain_n(a2, 2LL);
  if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0) {
    uint64_t v5 = (void *)sub_1FDD0(v5);
  }
  uint64_t v6 = v5[2];
  v8[0] = (uint64_t)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  swift_bridgeObjectRetain(a2);
  sub_215AC(v8, a2);
  swift_bridgeObjectRelease(a2);
  *a1 = v5;
  return swift_bridgeObjectRelease_n(a2, 2LL);
}

uint64_t sub_22580(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = sub_8518( &qword_38FF8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v19 = Set.init(minimumCapacity:)(v12, v2, v13);
  if (v12)
  {
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v18 = *(void *)(v3 + 72);
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    while (1)
    {
      v15(v11, v14, v2);
      uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v16(v11, 0LL, 1LL, v2);
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
      sub_1BC4C((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v14 += v18;
      if (!--v12) {
        goto LABEL_7;
      }
    }
  }

  else
  {
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v16(v11, 1LL, 1LL, v2);
  }

  return v19;
}

void sub_22750()
{
  if (qword_38C38 != -1) {
    swift_once(&qword_38C38, sub_1BB00);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_394B0);
  oslog = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v4 = swift_slowAlloc(32LL, -1LL);
    uint64_t v9 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    if (qword_38C30 != -1) {
      swift_once(&qword_38C30, sub_11478);
    }
    uint64_t v5 = qword_394A0;
    unint64_t v6 = qword_394A8;
    swift_bridgeObjectRetain(qword_394A8);
    uint64_t v8 = sub_28A50(v5, v6, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v3 + 4, v3 + 12);
    swift_bridgeObjectRelease(v6);
    _os_log_impl(&dword_0, oslog, v2, "%s run() finished", v3, 0xCu);
    swift_arrayDestroy(v4, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v4, -1LL, -1LL);
    swift_slowDealloc(v3, -1LL, -1LL);
  }

  else
  {
  }

char *sub_22904(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v4 = (void *)(a1 + 32);
  swift_bridgeObjectRetain(a1);
  uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t v6 = objc_autoreleasePoolPush();
    uint64_t v7 = v4[3];
    uint64_t v8 = v4[4];
    sub_8164(v4, v7);
    uint64_t v9 = dispatch thunk of SELFFeatureExtractor.extract(from:)(a2, v7, v8);
    objc_autoreleasePoolPop(v6);
    uint64_t v10 = *(void *)(v9 + 16);
    int64_t v11 = *((void *)v5 + 2);
    int64_t v12 = v11 + v10;
    if (__OFADD__(v11, v10)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v5);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v12 <= *((void *)v5 + 3) >> 1)
    {
      if (*(void *)(v9 + 16)) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v11 <= v12) {
        int64_t v14 = v11 + v10;
      }
      else {
        int64_t v14 = v11;
      }
      uint64_t v5 = sub_26690(isUniquelyReferenced_nonNull_native, v14, 1, v5);
      if (*(void *)(v9 + 16))
      {
LABEL_14:
        uint64_t v15 = *((void *)v5 + 2);
        if ((*((void *)v5 + 3) >> 1) - v15 < v10) {
          goto LABEL_28;
        }
        unint64_t v16 = (unint64_t)&v5[40 * v15 + 32];
        if (v9 + 32 < v16 + 40 * v10 && v16 < v9 + 32 + 40 * v10) {
          goto LABEL_30;
        }
        sub_4CC0(&qword_396E0);
        swift_arrayInitWithCopy(v16);
        if (v10)
        {
          uint64_t v18 = *((void *)v5 + 2);
          BOOL v19 = __OFADD__(v18, v10);
          uint64_t v20 = v18 + v10;
          if (v19) {
            goto LABEL_29;
          }
          *((void *)v5 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v20;
        }

        goto LABEL_4;
      }
    }

    if (v10) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease(v9);
    v4 += 5;
    if (!--v2)
    {
      swift_bridgeObjectRelease(a1);
      return v5;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_release(a2);
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_22B08()
{
  return swift_deallocObject(v0, 72LL, 7LL);
}

uint64_t sub_22B34()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_22B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc(dword_3976C);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_8558;
  v8[4] = a3;
  void v8[5] = v3;
  uint64_t v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch(sub_17D04, 0LL, 0LL);
}

uint64_t sub_22BCC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_22BF0(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_3977C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_833C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_39778 + dword_39778))(a1, a2, v6);
}

uint64_t sub_22C70(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_20204(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_22CB0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B9EC(a1, *(void **)(v2 + 16), a2);
}

uint64_t initializeWithCopy for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

void *assignWithCopy for LegacyContactSuggestionGeneratorWrapper(void *a1, void *a2)
{
  return a1;
}

__n128 initializeWithTake for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyContactSuggestionGeneratorWrapper( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 0u;
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
      *(void *)(result + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for LegacyContactSuggestionGeneratorWrapper()
{
  return &type metadata for LegacyContactSuggestionGeneratorWrapper;
}

void sub_22E18()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  __int128 v4 = &type metadata for LegacyContactSuggestionGeneratorWrapper;
  uint64_t v0 = sub_4CC0(&qword_39840);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_39810 = v5;
  *(void *)algn_39818 = v6;
}

uint64_t sub_22E9C(uint64_t a1)
{
  uint64_t v101 = a1;
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v92 = *(void *)(v1 - 8);
  uint64_t v93 = v1;
  __chkstk_darwin(v1);
  uint64_t v91 = (char *)&v84 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v94 = type metadata accessor for PlusContactSuggestion(0LL);
  uint64_t v102 = *(void *)(v94 - 8);
  uint64_t v3 = __chkstk_darwin(v94);
  Swift::Int v96 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v95 = (uint8_t *)&v84 - v5;
  type metadata accessor for PlusContactSuggestionGenerator(0LL);
  uint64_t v6 = PlusContactSuggestionGenerator.__allocating_init()();
  uint64_t v7 = sub_4CC0(&qword_39838);
  uint64_t v8 = type metadata accessor for ContactSuggestionTag(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = v11 + *(void *)(v9 + 72);
  uint64_t v13 = v10 | 7;
  uint64_t v14 = swift_allocObject(v7, v12, v10 | 7);
  __int128 v100 = xmmword_2EC70;
  *(_OWORD *)(v14 + 16) = xmmword_2EC70;
  uint64_t v15 = *(void (**)(uint64_t, void, uint64_t))(v9 + 104);
  v15(v14 + v11, enum case for ContactSuggestionTag.domainPhoneCall(_:), v8);
  unint64_t v16 = sub_2B940(v14);
  swift_setDeallocating(v14);
  swift_arrayDestroy(v14 + v11, 1LL, v8);
  swift_deallocClassInstance(v14, 32LL, 7LL);
  uint64_t v17 = v101;
  uint64_t v99 = dispatch thunk of PlusContactSuggestionGenerator.generate(groundTruths:suggestionTags:)(v101, v16);
  swift_bridgeObjectRelease(v16);
  uint64_t v18 = swift_allocObject(v7, v12, v13);
  *(_OWORD *)(v18 + 16) = v100;
  v15(v18 + v11, enum case for ContactSuggestionTag.domainMessages(_:), v8);
  BOOL v19 = sub_2B940(v18);
  swift_setDeallocating(v18);
  uint64_t v20 = v97;
  swift_arrayDestroy(v18 + v11, 1LL, v8);
  swift_deallocClassInstance(v18, 32LL, 7LL);
  uint64_t v86 = v6;
  uint64_t v21 = dispatch thunk of PlusContactSuggestionGenerator.generate(groundTruths:suggestionTags:)(v17, v19);
  swift_bridgeObjectRelease(v19);
  v106[0] = v99;
  sub_2715C(v21);
  uint64_t v22 = v106[0];
  uint64_t v23 = v20[3];
  uint64_t v24 = v20[4];
  sub_8164(v20, v23);
  dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v106, v23, v24);
  uint64_t v25 = (uint64_t)v107;
  uint64_t v26 = v108;
  sub_8164(v106, (uint64_t)v107);
  uint64_t v27 = dispatch thunk of PlusContactSuggestionStore.readAll()(v25, v26);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v106);
  if (qword_38C48 != -1) {
    swift_once(&qword_38C48, sub_2441C);
  }
  uint64_t v28 = type metadata accessor for Logger(0LL);
  uint64_t v99 = sub_7D04(v28, (uint64_t)qword_39820);
  uint64_t v29 = Logger.logObject.getter(v99);
  LOBYTE(v30) = static os_log_type_t.debug.getter();
  BOOL v31 = os_log_type_enabled((os_log_t)v29, (os_log_type_t)v30);
  uint64_t v87 = v22;
  if (!v31)
  {

    uint64_t v35 = v94;
    Swift::Int v34 = v95;
    goto LABEL_7;
  }

  uint64_t v32 = v27;
  Swift::Int v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v20 = (void *)swift_slowAlloc(32LL, -1LL);
  v106[0] = (uint64_t)v20;
  *(_DWORD *)Swift::Int v33 = 136315138;
  Swift::Int v34 = v33 + 4;
  uint64_t v35 = v94;
  if (qword_38C40 != -1) {
    goto LABEL_35;
  }
  while (1)
  {
    uint64_t v36 = qword_39810;
    unint64_t v37 = *(void *)algn_39818;
    swift_bridgeObjectRetain(*(void *)algn_39818);
    unint64_t v105 = sub_28A50(v36, v37, v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, v106, v34, v33 + 12);
    swift_bridgeObjectRelease(v37);
    _os_log_impl(&dword_0, (os_log_t)v29, (os_log_type_t)v30, "%s Generated Suggestions:", v33, 0xCu);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    swift_slowDealloc(v33, -1LL, -1LL);

    uint64_t v20 = v97;
    Swift::Int v34 = v95;
    uint64_t v27 = v32;
    uint64_t v22 = v87;
LABEL_7:
    sub_10C84(8224LL, 0xE200000000000000LL, v22);
    swift_bridgeObjectRetain(v27);
    uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
    os_log_type_t v40 = static os_log_type_t.debug.getter();
    BOOL v41 = os_log_type_enabled(v39, v40);
    Swift::Int v42 = v96;
    if (v41)
    {
      uint64_t v43 = v27;
      uint64_t v44 = swift_slowAlloc(22LL, -1LL);
      uint64_t v45 = swift_slowAlloc(32LL, -1LL);
      v106[0] = v45;
      *(_DWORD *)uint64_t v44 = 136315394;
      if (qword_38C40 != -1) {
        swift_once(&qword_38C40, sub_22E18);
      }
      uint64_t v46 = qword_39810;
      unint64_t v47 = *(void *)algn_39818;
      swift_bridgeObjectRetain(*(void *)algn_39818);
      unint64_t v105 = sub_28A50(v46, v47, v106);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, v106, v44 + 4, v44 + 12);
      swift_bridgeObjectRelease(v47);
      *(_WORD *)(v44 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
      uint64_t v48 = v43;
      unint64_t v105 = *(void *)(v43 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, v106, v44 + 14, v44 + 22);
      swift_bridgeObjectRelease(v43);
      _os_log_impl( &dword_0,  v39,  v40,  "%s Combining with %ld existing PLUS suggestions from disk:",  (uint8_t *)v44,  0x16u);
      swift_arrayDestroy(v45, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v45, -1LL, -1LL);
      swift_slowDealloc(v44, -1LL, -1LL);

      Swift::Int v42 = v96;
      uint64_t v20 = v97;
      Swift::Int v34 = v95;
      uint64_t v22 = v87;
    }

    else
    {

      swift_bridgeObjectRelease(v27);
      uint64_t v48 = v27;
    }

    sub_10C84(8224LL, 0xE200000000000000LL, v48);
    uint64_t v49 = v20[3];
    uint64_t v50 = v20[4];
    sub_8164(v20, v49);
    dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v106, v49, v50);
    uint64_t v51 = type metadata accessor for PLUSOfflineLogHelpers(0LL);
    swift_allocObject(v51, *(unsigned int *)(v51 + 48), *(unsigned __int16 *)(v51 + 52));
    uint64_t v52 = PLUSOfflineLogHelpers.init(logTarget:)(v106);
    unint64_t v105 = 0LL;
    swift_bridgeObjectRetain(v48);
    swift_retain(v52);
    Swift::Int v88 = sub_244AC(v22, v48, v52, &v105);
    swift_bridgeObjectRelease_n(v48, 2LL);
    uint64_t v85 = v52;
    uint64_t v53 = swift_release(v52);
    unint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
    os_log_type_t v55 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v57 = swift_slowAlloc(32LL, -1LL);
      v106[0] = v57;
      *(_DWORD *)uint64_t v56 = 136315138;
      if (qword_38C40 != -1) {
        swift_once(&qword_38C40, sub_22E18);
      }
      uint64_t v58 = qword_39810;
      unint64_t v59 = *(void *)algn_39818;
      swift_bridgeObjectRetain(*(void *)algn_39818);
      uint64_t v103 = sub_28A50(v58, v59, v106);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v103, v104, v56 + 4, v56 + 12);
      swift_bridgeObjectRelease(v59);
      _os_log_impl(&dword_0, v54, v55, "%s Writing combined suggestions to disk:", v56, 0xCu);
      swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v57, -1LL, -1LL);
      swift_slowDealloc(v56, -1LL, -1LL);

      Swift::Int v42 = v96;
      uint64_t v20 = v97;
      Swift::Int v34 = v95;
    }

    else
    {
    }

    unint64_t v60 = v88;
    sub_10C84(8224LL, 0xE200000000000000LL, (uint64_t)v88);
    uint64_t v61 = v20[3];
    uint64_t v62 = v20[4];
    sub_8164(v20, v61);
    dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v106, v61, v62);
    Swift::Int v33 = v107;
    uint64_t v30 = v108;
    uint64_t v29 = (uint64_t)sub_8164(v106, (uint64_t)v107);
    dispatch thunk of PlusContactSuggestionStore.resetStore()(v33, v30);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v106);
    uint64_t v32 = v60[2];
    if (v32)
    {
      uint64_t v64 = (char *)v88
          + ((*(unsigned __int8 *)(v102 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80));
      uint64_t v101 = *(void *)(v102 + 72);
      uint64_t v65 = *(void (**)(uint8_t *, char *, uint64_t))(v102 + 16);
      *(void *)&__int128 v63 = 136315394LL;
      __int128 v90 = v63;
      int64_t v89 = (char *)&type metadata for Any + 8;
      *(void *)&__int128 v100 = v65;
      v65(v34, v64, v35);
      while (1)
      {
        uint64_t v66 = v20[3];
        uint64_t v67 = v20[4];
        sub_8164(v20, v66);
        dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v106, v66, v67);
        Swift::Int v33 = v107;
        uint64_t v30 = v108;
        sub_8164(v106, (uint64_t)v107);
        uint64_t v29 = dispatch thunk of PlusContactSuggestionStore.insert(pics:)(v34, v33, v30);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v106);
        if ((v29 & 1) != 0)
        {
          (*(void (**)(uint8_t *, uint64_t))(v102 + 8))(v34, v35);
        }

        else
        {
          uint64_t v68 = ((uint64_t (*)(char *, uint8_t *, uint64_t))v65)(v42, v34, v35);
          uint64_t v30 = (os_log_s *)Logger.logObject.getter(v68);
          Swift::Int v33 = v34;
          os_log_type_t v69 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v30, v69))
          {
            uint64_t v70 = swift_slowAlloc(22LL, -1LL);
            uint64_t v98 = swift_slowAlloc(64LL, -1LL);
            v106[0] = v98;
            *(_DWORD *)uint64_t v70 = v90;
            if (qword_38C40 != -1) {
              swift_once(&qword_38C40, sub_22E18);
            }
            uint64_t v71 = qword_39810;
            unint64_t v72 = *(void *)algn_39818;
            swift_bridgeObjectRetain(*(void *)algn_39818);
            *(void *)(v70 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v71, v72, v106);
            uint64_t v73 = swift_bridgeObjectRelease(v72);
            *(_WORD *)(v70 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
            int64_t v74 = v91;
            uint64_t v75 = v96;
            PlusContactSuggestion.id.getter(v73);
            uint64_t v76 = sub_8518( &qword_397B8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
            uint64_t v77 = v93;
            uint64_t v78 = dispatch thunk of CustomStringConvertible.description.getter(v93, v76);
            unint64_t v80 = v79;
            (*(void (**)(char *, uint64_t))(v92 + 8))(v74, v77);
            *(void *)(v70 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_28A50(v78, v80, v106);
            unint64_t v81 = v80;
            Swift::Int v42 = v75;
            swift_bridgeObjectRelease(v81);
            uint64_t v29 = *(void *)(v102 + 8);
            uint64_t v35 = v94;
            ((void (*)(char *, uint64_t))v29)(v75, v94);
            _os_log_impl(&dword_0, v30, v69, "%s Unable to save PICS with id = %s to storage", (uint8_t *)v70, 0x16u);
            Swift::Int v33 = (uint8_t *)v98;
            swift_arrayDestroy(v98, 2LL, v89);
            swift_slowDealloc(v33, -1LL, -1LL);
            swift_slowDealloc(v70, -1LL, -1LL);

            Swift::Int v34 = v95;
            ((void (*)(uint8_t *, uint64_t))v29)(v95, v35);
            uint64_t v20 = v97;
          }

          else
          {

            uint64_t v29 = *(void *)(v102 + 8);
            ((void (*)(char *, uint64_t))v29)(v42, v35);
            ((void (*)(uint8_t *, uint64_t))v29)(v33, v35);
            Swift::Int v34 = v33;
          }
        }

        v64 += v101;
        --v32;
        uint64_t v65 = (void (*)(uint8_t *, char *, uint64_t))v100;
        if (!v32) {
          break;
        }
        ((void (*)(uint8_t *, char *, uint64_t))v100)(v34, v64, v35);
      }
    }

    swift_release(v86);
    swift_release(v85);
    swift_bridgeObjectRelease(v88);
    uint64_t v35 = *(void *)(v87 + 16);
    swift_bridgeObjectRelease(v87);
    unint64_t v82 = v35 - v105;
    if (!__OFSUB__(v35, v105)) {
      break;
    }
    __break(1u);
LABEL_35:
    swift_once(&qword_38C40, sub_22E18);
  }

  if ((v82 & 0x8000000000000000LL) == 0)
  {
    if (HIDWORD(v82))
    {
LABEL_37:
      uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
      goto LABEL_38;
    }

    if ((v105 & 0x8000000000000000LL) == 0)
    {
      if (!HIDWORD(v105)) {
        return 0LL;
      }
      goto LABEL_37;
    }
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3451LL,  0);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_23ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v83 = a4;
  uint64_t v99 = a1;
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  Swift::Int v88 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for PlusContactSuggestion(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v86 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v18 = __chkstk_darwin(v17);
  __int128 v90 = (char *)&v76 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v95 = (char *)&v76 - v23;
  __chkstk_darwin(v22);
  uint64_t v25 = __chkstk_darwin((char *)&v76 - v24);
  uint64_t v27 = (char *)&v76 - v26;
  uint64_t v28 = __chkstk_darwin(v25);
  uint64_t v33 = *(void *)(a2 + 16);
  if (!v33)
  {
LABEL_17:
    int64_t v74 = v88;
    UUID.init()(v28);
    uint64_t v75 = v99;
    dispatch thunk of PLUSOfflineLogHelpers.logContactSuggestionGenerated(suggestion:plusId:isSuggestionUpdated:)( v99,  v74,  0LL);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v74, v10);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(a5, v75, v13);
  }

  uint64_t v93 = v28;
  unint64_t v82 = (char *)&v76 - v29;
  int64_t v89 = v32;
  uint64_t v76 = v31;
  uint64_t v77 = v30;
  uint64_t v79 = v11;
  uint64_t v80 = a3;
  uint64_t v81 = v10;
  uint64_t v84 = v6;
  uint64_t v85 = a5;
  uint64_t v34 = a2 + ((*(unsigned __int8 *)(v14 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  uint64_t v35 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 16);
  uint64_t v97 = *(void *)(v14 + 72);
  uint64_t v98 = v35;
  uint64_t v87 = a2;
  __n128 v36 = swift_bridgeObjectRetain(a2);
  uint64_t v78 = v34;
  uint64_t v96 = v33;
  uint64_t v37 = v33;
  uint64_t v94 = v14;
  uint64_t v38 = v95;
  uint64_t v91 = v27;
  uint64_t v92 = v13;
  uint64_t v39 = v93;
  do
  {
    os_log_type_t v40 = v98;
    ((void (*)(char *, uint64_t, uint64_t, __n128))v98)(v27, v34, v13, v36);
    uint64_t v41 = v99;
    char v42 = PlusContactSuggestion.hasSameContent(as:)(v99);
    v40(v39, v27, v13);
    uint64_t v43 = ((uint64_t (*)(char *, uint64_t, uint64_t))v40)(v38, v41, v13);
    if ((v42 & 1) != 0)
    {
      uint64_t v44 = PlusContactSuggestion.tags.getter(v43);
      uint64_t v45 = PlusContactSuggestion.tags.getter(v44);
      char v46 = sub_24070(v44, v45);
      uint64_t v47 = v44;
      uint64_t v38 = v95;
      swift_bridgeObjectRelease(v47);
      uint64_t v48 = v45;
      uint64_t v49 = v94;
      swift_bridgeObjectRelease(v48);
    }

    else
    {
      char v46 = 0;
      uint64_t v49 = v94;
    }

    uint64_t v50 = *(void (**)(char *, uint64_t))(v49 + 8);
    uint64_t v13 = v92;
    v50(v38, v92);
    v50((char *)v39, v13);
    if ((v46 & 1) != 0)
    {
      swift_bridgeObjectRelease(v87);
      uint64_t v73 = v82;
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v82, v91, v13);
      PlusContactSuggestion.updateWith(with:)(v99);
      return ((uint64_t (*)(char *, uint64_t))v50)(v73, v13);
    }

    uint64_t v27 = v91;
    v50(v91, v13);
    v34 += v97;
    --v37;
  }

  while (v37);
  uint64_t v51 = v87;
  swift_bridgeObjectRelease(v87);
  __n128 v52 = swift_bridgeObjectRetain(v51);
  uint64_t v53 = v86;
  os_log_type_t v55 = v89;
  unint64_t v54 = v90;
  uint64_t v56 = v78;
  uint64_t v57 = (void (*)(char *, __n128))v98;
  while (1)
  {
    uint64_t v58 = v56;
    v57(v54, v52);
    uint64_t v59 = v99;
    char v60 = PlusContactSuggestion.hasSameMapping(as:)(v99);
    ((void (*)(char *, char *, uint64_t))v57)(v55, v54, v13);
    uint64_t v61 = ((uint64_t (*)(char *, uint64_t, uint64_t))v57)(v53, v59, v13);
    if ((v60 & 1) != 0) {
      break;
    }
    v50(v53, v13);
    v50(v55, v13);
LABEL_10:
    unint64_t v54 = v90;
    v50(v90, v13);
    uint64_t v56 = v58 + v97;
    if (!--v96)
    {
      uint64_t v28 = swift_bridgeObjectRelease(v87);
      a5 = v85;
      uint64_t v10 = v81;
      uint64_t v11 = v79;
      uint64_t v14 = v94;
      goto LABEL_17;
    }
  }

  uint64_t v62 = PlusContactSuggestion.tags.getter(v61);
  uint64_t v63 = PlusContactSuggestion.tags.getter(v62);
  uint64_t v64 = type metadata accessor for ContactSuggestionTag(0LL);
  uint64_t v65 = sub_8518( &qword_39848,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionTag,  (uint64_t)&protocol conformance descriptor for ContactSuggestionTag);
  LOBYTE(v6_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = static SetUtils.haveSameDomainTags<A>(_:_:)( v62,  v63,  v64,  &protocol witness table for ContactSuggestionTag,  v65);
  swift_bridgeObjectRelease(v62);
  swift_bridgeObjectRelease(v63);
  v50(v53, v13);
  v50(v55, v13);
  if ((v64 & 1) == 0) {
    goto LABEL_10;
  }
  swift_bridgeObjectRelease(v87);
  uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(v94 + 32);
  uint64_t v67 = v76;
  v66((uint64_t)v76, v90, v13);
  uint64_t v68 = v77;
  v66(v77, v67, v13);
  uint64_t v69 = v85;
  uint64_t v70 = PlusContactSuggestion.updateWith(with:)(v99);
  uint64_t v71 = v88;
  UUID.init()(v70);
  dispatch thunk of PLUSOfflineLogHelpers.logContactSuggestionGenerated(suggestion:plusId:isSuggestionUpdated:)( v69,  v71,  1LL);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v71, v81);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v50)(v68, v13);
  if (__OFADD__(*v83, 1LL)) {
    __break(1u);
  }
  else {
    ++*v83;
  }
  return result;
}

uint64_t sub_24070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactSuggestionTag(0LL);
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v36 - v12;
  if (a1 == a2) {
    return 1LL;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0LL;
  }
  int64_t v14 = 0LL;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v37 = a1;
  uint64_t v38 = a1 + 56;
  uint64_t v16 = 1LL << *(_BYTE *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1LL << v16);
  }
  else {
    uint64_t v17 = -1LL;
  }
  unint64_t v18 = v17 & v15;
  int64_t v39 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v42 = a2 + 56;
  __n128 v36 = (char *)&v36 - v12;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v40 = (v18 - 1) & v18;
  int64_t v41 = v14;
  for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v24 = v43;
    uint64_t v25 = *(void *)(v43 + 72);
    uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 16);
    v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v10, v13, v4);
    uint64_t v27 = *(void *)(a2 + 40);
    uint64_t v28 = sub_8518( &qword_39848,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionTag,  (uint64_t)&protocol conformance descriptor for ContactSuggestionTag);
    uint64_t v29 = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
    uint64_t v30 = -1LL << *(_BYTE *)(a2 + 32);
    unint64_t v31 = v29 & ~v30;
    if (((*(void *)(v42 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v31) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v4);
      return 0LL;
    }

    uint64_t v32 = ~v30;
    while (1)
    {
      v26(v7, *(void *)(a2 + 48) + v31 * v25, v4);
      uint64_t v33 = sub_8518( &qword_39850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionTag,  (uint64_t)&protocol conformance descriptor for ContactSuggestionTag);
      char v34 = dispatch thunk of static Equatable.== infix(_:_:)(v7, v10, v4, v33);
      uint64_t v35 = *(void (**)(char *, uint64_t))(v43 + 8);
      v35(v7, v4);
      if ((v34 & 1) != 0) {
        break;
      }
      unint64_t v31 = (v31 + 1) & v32;
      if (((*(void *)(v42 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v31) & 1) == 0)
      {
        v35(v10, v4);
        return 0LL;
      }
    }

    uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v10, v4);
    uint64_t v13 = v36;
    a1 = v37;
    unint64_t v18 = v40;
    int64_t v14 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v20 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
      __break(1u);
      goto LABEL_35;
    }

    if (v20 >= v39) {
      return 1LL;
    }
    unint64_t v21 = *(void *)(v38 + 8 * v20);
    int64_t v22 = v14 + 1;
    if (!v21)
    {
      int64_t v22 = v20 + 1;
      if (v20 + 1 >= v39) {
        return 1LL;
      }
      unint64_t v21 = *(void *)(v38 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v20 + 2 >= v39) {
          return 1LL;
        }
        unint64_t v21 = *(void *)(v38 + 8 * v22);
        if (!v21)
        {
          int64_t v22 = v20 + 3;
          if (v20 + 3 >= v39) {
            return 1LL;
          }
          unint64_t v21 = *(void *)(v38 + 8 * v22);
          if (!v21) {
            break;
          }
        }
      }
    }

unint64_t sub_243E0()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_243FC()
{
  return 1LL;
}

uint64_t sub_24404(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_2441C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_39820);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_39820);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

void *sub_244AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v21 = a3;
  int64_t v22 = a4;
  uint64_t v20 = a2;
  uint64_t v19 = type metadata accessor for PlusContactSuggestion(0LL);
  uint64_t v7 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    int64_t v23 = _swiftEmptyArrayStorage;
    sub_2A698(0, v10, 0);
    uint64_t v11 = v23;
    unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v12 = a1 + v18;
    uint64_t v13 = *(void *)(v7 + 72);
    while (1)
    {
      sub_23ACC(v12, v20, v21, v22, (uint64_t)v9);
      if (v5) {
        break;
      }
      uint64_t v5 = 0LL;
      int64_t v23 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_2A698(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v23;
      }

      v11[2] = v15 + 1;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))((char *)v11 + v18 + v15 * v13, v9, v19);
      v12 += v13;
      if (!--v10) {
        return v11;
      }
    }

    swift_release(v11);
  }

  return v11;
}

Swift::Int sub_2460C()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_24650()
{
}

Swift::Int sub_24678(uint64_t a1)
{
  Swift::UInt32 v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_246B8@<X0>(unsigned int *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_24C60(*a1);
  *a2 = result;
  return result;
}

void sub_246E0(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_246EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24710(char a1)
{
  *(_BYTE *)(v1 + 25) = a1;
  Swift::UInt32 v2 = (void *)swift_task_alloc(dword_39504);
  *(void *)(v1 + 40) = v2;
  *Swift::UInt32 v2 = v1;
  v2[1] = sub_2475C;
  return sub_1468C();
}

uint64_t sub_2475C(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 40);
  uint64_t v5 = *v2;
  *(void *)(v5 + 48) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    return swift_task_switch(sub_247D0, 0LL, 0LL);
  }
  else {
    return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
  }
}

uint64_t sub_247D0()
{
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v0 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v1;
  swift_errorRetain(v1);
  uint64_t v2 = sub_4CC0(&qword_38E00);
  if (swift_dynamicCast(v0 + 16, v0 + 32, v2, &type metadata for InferencePluginError, 6LL))
  {
    uint64_t v3 = sub_7D60(*(void *)(v0 + 16), *(_BYTE *)(v0 + 24));
  }

  else
  {
    uint64_t v4 = *(void *)(v0 + 48);
    char v5 = *(_BYTE *)(v0 + 25) | 0x80;
    unint64_t v6 = sub_7D1C();
    uint64_t v3 = swift_allocError(&type metadata for InferencePluginError, v6, 0LL, 0LL);
    *(void *)uint64_t v7 = v4;
    *(_BYTE *)(v7 + 8) = v5;
  }

  swift_willThrow(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for InferencePluginError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_248D4(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_248D4(uint64_t a1, char a2)
{
  if (a2 < 0) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t destroy for InferencePluginError(uint64_t a1)
{
  return sub_7D60(*(void *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for InferencePluginError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_248D4(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  char v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_7D60(v5, v6);
  return a1;
}

uint64_t initializeWithTake for InferencePluginError(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for InferencePluginError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_7D60(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for InferencePluginError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x1FF && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 511);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 8) >> 7) | (2
                                             * ((*(void *)a1 >> 60) & 0xF | (16
                                                                             * ((*(unsigned __int8 *)(a1 + 8) >> 3) & 0xF))))) ^ 0x1FF;
  if (v3 >= 0x1FE) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for InferencePluginError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 511;
    if (a3 >= 0x1FF) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0x1FF) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1);
      *(void *)uint64_t result = v3 << 60;
      *(_BYTE *)(result + 8) = ((v3 - (a2 << 8)) >> 1) & 0xF8;
    }
  }

  return result;
}

uint64_t sub_24A4C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_24A58(uint64_t result)
{
  *(_BYTE *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_24A68(uint64_t result, char a2)
{
  char v2 = *(_BYTE *)(result + 8) & 7 | (a2 << 7);
  *(void *)result &= 0xFFFFFFFFFFFFFFFuLL;
  *(_BYTE *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for InferencePluginError()
{
  return &type metadata for InferencePluginError;
}

_BYTE *initializeBufferWithCopyOfBuffer for InferencePluginErrorReason(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InferencePluginErrorReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for InferencePluginErrorReason( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 1;
  }
  else {
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_24B84 + 4 * byte_2F105[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_24BB8 + 4 * byte_2F100[v4]))();
}

uint64_t sub_24BB8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24BC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x24BC8LL);
  }
  return result;
}

uint64_t sub_24BD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x24BDCLL);
  }
  *(_BYTE *)uint64_t result = a2 + 6;
  return result;
}

uint64_t sub_24BE0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24BE8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24BF4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24C00(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InferencePluginErrorReason()
{
  return &type metadata for InferencePluginErrorReason;
}

unint64_t sub_24C1C()
{
  unint64_t result = qword_39860;
  if (!qword_39860)
  {
    unint64_t result = swift_getWitnessTable(&unk_2F1BC, &type metadata for InferencePluginErrorReason);
    atomic_store(result, (unint64_t *)&qword_39860);
  }

  return result;
}

uint64_t sub_24C60(uint64_t result)
{
  else {
    return result;
  }
}

uint64_t *sub_24C74(void *a1)
{
  uint64_t v3 = *v1;
  sub_8120((uint64_t)a1, (uint64_t)(v1 + 4));
  uint64_t v4 = static InferenceLogUtils.loggerTag<A>(_:)(v3, v3);
  uint64_t v6 = v5;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  v1[2] = v4;
  v1[3] = v6;
  return v1;
}

void *sub_24CC8()
{
  return &_swiftEmptyArrayStorage;
}

double sub_24CD4@<D0>( char a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if ((a1 & 1) != 0)
  {
    if (qword_38C50 != -1) {
      swift_once(&qword_38C50, sub_25170);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_7D04(v9, (uint64_t)qword_39868);
    swift_retain_n(a4, 2LL);
    uint64_t v10 = swift_bridgeObjectRetain_n(a3, 2LL);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc(22LL, -1LL);
      uint64_t v14 = swift_slowAlloc(64LL, -1LL);
      uint64_t v31 = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      uint64_t v15 = a2;
      uint64_t v17 = *(void *)(a4 + 16);
      unint64_t v16 = *(void *)(a4 + 24);
      swift_bridgeObjectRetain(v16);
      uint64_t v30 = sub_28A50(v17, v16, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v13 + 4, v13 + 12);
      swift_release_n(a4, 2LL);
      swift_bridgeObjectRelease(v16);
      *(_WORD *)(v13 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      swift_bridgeObjectRetain(a3);
      uint64_t v30 = sub_28A50(v15, a3, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v13 + 14, v13 + 22);
      swift_bridgeObjectRelease_n(a3, 3LL);
      _os_log_impl(&dword_0, v11, v12, "%s %s enabled", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy(v14, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a3, 2LL);
      swift_release_n(a4, 2LL);
    }

    uint64_t v26 = type metadata accessor for PhoneCallContactPartialRepetitionDefinition(0LL);
    swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
    uint64_t v27 = PhoneCallContactPartialRepetitionDefinition.init()();
    uint64_t v31 = v27;
    unint64_t v28 = sub_25200();
    PartialRepetitionDefinition.generator()(v26, v28);
    swift_release(v27);
  }

  else
  {
    if (qword_38C50 != -1) {
      swift_once(&qword_38C50, sub_25170);
    }
    uint64_t v18 = type metadata accessor for Logger(0LL);
    sub_7D04(v18, (uint64_t)qword_39868);
    swift_retain_n(a4, 2LL);
    uint64_t v19 = swift_bridgeObjectRetain_n(a3, 2LL);
    uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc(22LL, -1LL);
      uint64_t v23 = swift_slowAlloc(64LL, -1LL);
      uint64_t v31 = v23;
      *(_DWORD *)uint64_t v22 = 136315394;
      uint64_t v24 = *(void *)(a4 + 16);
      unint64_t v25 = *(void *)(a4 + 24);
      swift_bridgeObjectRetain(v25);
      uint64_t v30 = sub_28A50(v24, v25, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v22 + 4, v22 + 12);
      swift_release_n(a4, 2LL);
      swift_bridgeObjectRelease(v25);
      *(_WORD *)(v22 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      swift_bridgeObjectRetain(a3);
      uint64_t v30 = sub_28A50(a2, a3, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v22 + 14, v22 + 22);
      swift_bridgeObjectRelease_n(a3, 3LL);
      _os_log_impl(&dword_0, v20, v21, "%s %s disabled", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a3, 2LL);
      swift_release_n(a4, 2LL);
    }

    *(void *)(a5 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
    double result = 0.0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }

  return result;
}

uint64_t sub_25114(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 72LL, 7LL);
  sub_24C74(a1);
  return v3;
}

uint64_t type metadata accessor for InferenceDomain()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin15InferenceDomain);
}

uint64_t sub_25170()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_39868);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_39868);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

unint64_t sub_25200()
{
  unint64_t result = qword_39980;
  if (!qword_39980)
  {
    uint64_t v1 = type metadata accessor for PhoneCallContactPartialRepetitionDefinition(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for PhoneCallContactPartialRepetitionDefinition, v1);
    atomic_store(result, (unint64_t *)&qword_39980);
  }

  return result;
}

__n128 initializeBufferWithCopyOfBuffer for PluginRunSummary(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PluginRunSummary(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for PluginRunSummary(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PluginRunSummary()
{
  return &type metadata for PluginRunSummary;
}

uint64_t sub_252AC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = __chkstk_darwin();
  BOOL v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = dispatch thunk of TypedGroundTruth.type.getter(v5);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for MediaGroundTruth(0LL);
  uint64_t v12 = sub_8518( &qword_39B40,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaGroundTruth,  (uint64_t)&protocol conformance descriptor for MediaGroundTruth);
  uint64_t v13 = static TypedGroundTruth.type.getter(v11, v12);
  if (v8 == v13 && v10 == v14)
  {
    swift_bridgeObjectRelease_n(v10, 2LL);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v2, a1);
    goto LABEL_13;
  }

  uint64_t v16 = v14;
  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, v13, v14, 0LL);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v2, a1);
  if ((v17 & 1) != 0)
  {
LABEL_13:
    char v27 = 1;
    goto LABEL_14;
  }

  uint64_t v18 = dispatch thunk of TypedGroundTruth.type.getter(a1);
  uint64_t v20 = v19;
  uint64_t v21 = type metadata accessor for MediaFeedbackGroundTruth(0LL);
  uint64_t v22 = sub_8518( &qword_392A8,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaFeedbackGroundTruth,  (uint64_t)&protocol conformance descriptor for MediaFeedbackGroundTruth);
  uint64_t v23 = static TypedGroundTruth.type.getter(v21, v22);
  if (v18 == v23 && v20 == v24)
  {
    swift_bridgeObjectRelease_n(v20, 2LL);
    goto LABEL_13;
  }

  uint64_t v26 = v24;
  char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v23, v24, 0LL);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v26);
LABEL_14:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a1);
  return v27 & 1;
}

uint64_t sub_25480(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 80LL, 7LL);
  sub_254BC(a1);
  return v3;
}

void *sub_254BC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_8164(a1, v5);
  swift_retain(v1);
  dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v12, v5, v6);
  uint64_t v7 = type metadata accessor for MediaSuggestionOutcomeReportedOfflineEmitter(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  v1[9] = MediaSuggestionOutcomeReportedOfflineEmitter.init(logTarget:)(v12);
  swift_release(v1);
  sub_8120((uint64_t)a1, (uint64_t)v12);
  sub_8120((uint64_t)v12, (uint64_t)(v1 + 4));
  uint64_t v8 = static InferenceLogUtils.loggerTag<A>(_:)(v4, v4);
  uint64_t v10 = v9;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v12);
  v2[2] = v8;
  v2[3] = v10;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  return v2;
}

uint64_t sub_25590()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  sub_8164(v0 + 4, v1);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(v8, v1, v2);
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  sub_8164(v8, v9);
  uint64_t v5 = static InferenceFeatures.PIMSShadowLogging.getter();
  v7[3] = type metadata accessor for AnyFeature(0LL);
  v7[4] = &protocol witness table for AnyFeature;
  v7[0] = v5;
  LOBYTE(v3) = dispatch thunk of FeatureManaging.isActive(_:)(v7, v3, v4);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v7);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v8);
  return v3 & 1;
}

uint64_t sub_25638()
{
  uint64_t v0 = sub_4CC0(&qword_39140);
  uint64_t v1 = swift_allocObject(v0, 72LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_2EC70;
  uint64_t v2 = type metadata accessor for MediaFeatureExtractor(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = MediaFeatureExtractor.init()();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 6_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = sub_8518( &qword_39AF0,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaFeatureExtractor,  (uint64_t)&protocol conformance descriptor for MediaFeatureExtractor);
  *(void *)(v1 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v3;
  return v1;
}

char *sub_256D4()
{
  uint64_t v1 = v0;
  uint64_t v62 = type metadata accessor for DoubleFeatureParameter(0LL);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  char v60 = (char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v65 = v0 + 4;
  sub_8164(v0 + 4, v7);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(&v74, v7, v8);
  uint64_t v9 = v75;
  uint64_t v10 = v76;
  sub_8164(&v74, v75);
  uint64_t v11 = static InferenceFeatures.PIMSInAppFollowup.getter();
  uint64_t v72 = type metadata accessor for AnyFeature(0LL);
  uint64_t v73 = &protocol witness table for AnyFeature;
  uint64_t v64 = v72;
  *(void *)&__int128 v71 = v11;
  int v12 = dispatch thunk of FeatureManaging.isActive(_:)(&v71, v9, v10);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v71);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v74);
  if (qword_38C58 != -1) {
    swift_once(&qword_38C58, sub_25FB8);
  }
  uint64_t v13 = sub_7D04(v3, (uint64_t)qword_39988);
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  int v63 = v12;
  if (v17)
  {
    uint64_t v59 = v4;
    uint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v74 = v19;
    if ((v12 & 1) != 0) {
      uint64_t v20 = 0x44454C42414E45LL;
    }
    else {
      uint64_t v20 = 0x44454C4241534944LL;
    }
    if ((v12 & 1) != 0) {
      unint64_t v21 = 0xE700000000000000LL;
    }
    else {
      unint64_t v21 = 0xE800000000000000LL;
    }
    *(void *)&__int128 v71 = sub_28A50(v20, v21, &v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease(v21);
    _os_log_impl(&dword_0, v15, v16, "Media In App Followup is %s", v18, 0xCu);
    swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v59 + 8))(v6, v3);
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  uint64_t v22 = v1[7];
  uint64_t v23 = v1[8];
  uint64_t v24 = v65;
  sub_8164(v65, v22);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(&v74, v22, v23);
  uint64_t v25 = v75;
  uint64_t v26 = v76;
  sub_8164(&v74, v75);
  char v27 = v60;
  static InferenceFeatures.pimsPartialRepetitionSimilarityThreshold.getter();
  uint64_t v28 = dispatch thunk of FeatureManaging.getFeatureParameter(_:)(v27, v25, v26);
  uint64_t v30 = v29 & 1;
  (*(void (**)(char *, uint64_t))(v61 + 8))(v27, v62);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v74);
  uint64_t v31 = v1[7];
  uint64_t v32 = v1[8];
  sub_8164(v24, v31);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(&v74, v31, v32);
  uint64_t v33 = v75;
  uint64_t v34 = v76;
  sub_8164(&v74, v75);
  uint64_t v35 = static InferenceFeatures.pimsWakeWordTrimmingEnabled.getter();
  uint64_t v36 = v64;
  uint64_t v72 = v64;
  uint64_t v73 = &protocol witness table for AnyFeature;
  *(void *)&__int128 v71 = v35;
  LOBYTE(v2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 7) = dispatch thunk of FeatureManaging.isActive(_:)(&v71, v33, v34);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v71);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v74);
  uint64_t v37 = v1[7];
  uint64_t v38 = v1[8];
  sub_8164(v24, v37);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(&v74, v37, v38);
  uint64_t v39 = v75;
  uint64_t v40 = v76;
  sub_8164(&v74, v75);
  uint64_t v41 = static InferenceFeatures.pimsPhantomTurnRemovalEnabled.getter();
  uint64_t v72 = v36;
  uint64_t v73 = &protocol witness table for AnyFeature;
  *(void *)&__int128 v71 = v41;
  char v42 = dispatch thunk of FeatureManaging.isActive(_:)(&v71, v39, v40);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v71);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v74);
  __int128 v68 = xmmword_2EA90;
  uint64_t v43 = type metadata accessor for MediaEntityPartialRepetitionDefinition(0LL);
  swift_allocObject(v43, *(unsigned int *)(v43 + 48), *(unsigned __int16 *)(v43 + 52));
  uint64_t v44 = MediaEntityPartialRepetitionDefinition.init(restatementThreshold:useTrimmedUtterance:wakeWordAndEmptyTurnRemoval:)( v28,  v30,  v27 & 1,  v42 & 1);
  uint64_t v74 = v44;
  uint64_t v45 = sub_8518( &qword_39AD8,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaEntityPartialRepetitionDefinition,  (uint64_t)&protocol conformance descriptor for MediaEntityPartialRepetitionDefinition);
  PartialRepetitionDefinition.generator()(v43, v45);
  swift_release(v44);
  uint64_t v46 = v1[9];
  uint64_t v47 = type metadata accessor for MusicEntityGroundTruthGenerator();
  uint64_t v48 = swift_allocObject(v47, 33LL, 7LL);
  swift_retain(v46);
  unint64_t v49 = sub_70B8((uint64_t)_swiftEmptyArrayStorage);
  *(_BYTE *)(v48 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v63 & 1;
  *(void *)(v48 + 16) = v46;
  *(void *)(v48 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v49;
  v70[3] = v47;
  v70[4] = sub_8518( &qword_39AE0,  (uint64_t (*)(uint64_t))type metadata accessor for MusicEntityGroundTruthGenerator,  (uint64_t)&unk_2EF38);
  v70[0] = v48;
  sub_2671C((uint64_t)v69, (uint64_t)&v74);
  sub_26764((uint64_t)&v74, (uint64_t)&v66);
  if (v67)
  {
    sub_7D6C(&v66, (uint64_t)&v71);
    sub_7D6C(&v71, (uint64_t)&v66);
    uint64_t v50 = (char *)_swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
      uint64_t v50 = sub_263BC( 0LL,  _swiftEmptyArrayStorage[2] + 1LL,  1,  (char *)_swiftEmptyArrayStorage,  &qword_39AE8,  &qword_397D8);
    }
    unint64_t v52 = *((void *)v50 + 2);
    unint64_t v51 = *((void *)v50 + 3);
    if (v52 >= v51 >> 1) {
      uint64_t v50 = sub_263BC((char *)(v51 > 1), v52 + 1, 1, v50, &qword_39AE8, &qword_397D8);
    }
    *((void *)v50 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v52 + 1;
    sub_7D6C(&v66, (uint64_t)&v50[40 * v52 + 32]);
  }

  else
  {
    sub_267AC((uint64_t)&v66);
    uint64_t v50 = (char *)_swiftEmptyArrayStorage;
  }

  sub_2671C((uint64_t)v70, (uint64_t)&v74);
  sub_26764((uint64_t)&v74, (uint64_t)&v66);
  if (v67)
  {
    sub_7D6C(&v66, (uint64_t)&v71);
    sub_7D6C(&v71, (uint64_t)&v66);
    if ((swift_isUniquelyReferenced_nonNull_native(v50) & 1) == 0) {
      uint64_t v50 = sub_263BC(0LL, *((void *)v50 + 2) + 1LL, 1, v50, &qword_39AE8, &qword_397D8);
    }
    unint64_t v54 = *((void *)v50 + 2);
    unint64_t v53 = *((void *)v50 + 3);
    if (v54 >= v53 >> 1) {
      uint64_t v50 = sub_263BC((char *)(v53 > 1), v54 + 1, 1, v50, &qword_39AE8, &qword_397D8);
    }
    *((void *)v50 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v54 + 1;
    sub_7D6C(&v66, (uint64_t)&v50[40 * v54 + 32]);
  }

  else
  {
    sub_267AC((uint64_t)&v66);
  }

  uint64_t v55 = v68;
  uint64_t v56 = sub_4CC0(&qword_39438);
  swift_arrayDestroy(v69, v55, v56);
  return v50;
}

uint64_t sub_25E30()
{
  return dispatch thunk of MediaSuggestionOutcomeReportedOfflineEmitter.flush()();
}

uint64_t sub_25E50()
{
  uint64_t v1 = sub_4CC0(&qword_39AD0);
  uint64_t v2 = swift_allocObject(v1, 72LL, 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_2EC70;
  sub_8120(v0 + 32, (uint64_t)v6);
  uint64_t v3 = type metadata accessor for MediaEvaluationFramework(0LL);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  uint64_t v4 = MediaEvaluationFramework.init(_:)(v6);
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 6_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = &protocol witness table for MediaEvaluationFramework;
  *(void *)(v2 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v4;
  return v2;
}

uint64_t sub_25EE4()
{
  uint64_t v0 = sub_4CC0(&qword_39AC8);
  uint64_t v1 = type metadata accessor for EventStreamType(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = swift_allocObject(v0, v5 + 2 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_2EA90;
  uint64_t v7 = v6 + v5;
  uint64_t v8 = *(void (**)(uint64_t, void, uint64_t))(v2 + 104);
  v8(v7, enum case for EventStreamType.nowPlayingStream(_:), v1);
  v8(v7 + v3, enum case for EventStreamType.playMediaIntentStreamWithAttachedNowPlayingEvents(_:), v1);
  return v6;
}

uint64_t type metadata accessor for MediaInferenceDomain()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin20MediaInferenceDomain);
}

uint64_t sub_25FB8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_39988);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_39988);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

char *sub_26048(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2656C(a1, a2, a3, a4, sub_28928);
}

char *sub_26054(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39B30, &qword_38FB0);
}

char *sub_26068(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_4CC0(&qword_39458);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_269DC(0LL, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_26174(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2619C( a1,  a2,  a3,  a4,  &qword_39B60,  (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion);
}

uint64_t sub_26188(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2619C( a1,  a2,  a3,  a4,  &qword_39B68,  (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion);
}

uint64_t sub_2619C( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v10 = a2;
  }

  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_4CC0(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15) {
    goto LABEL_29;
  }
  if (v19 - v17 == 0x8000000000000000LL && v15 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  void v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0LL) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if ((a1 & 1) != 0)
  {
    unint64_t v24 = a4 + v22;
    if ((unint64_t)v18 < a4 || v23 >= v24 + *(void *)(v21 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v22, v24);
    }

    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v22, v24);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_26AC4(0LL, v11, v23, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

char *sub_263A8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39B48, &qword_38FC0);
}

char *sub_263BC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = *((void *)a4 + 3);
  uint64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = sub_4CC0(a5);
      uint64_t v14 = (char *)swift_allocObject(v13, 40 * v12 + 32, 7LL);
      size_t v15 = j__malloc_size(v14);
      *((void *)v14 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v11;
      *((void *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 40);
      uint64_t v16 = v14 + 32;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[40 * v11 + 32]) {
          memmove(v16, a4 + 32, 40 * v11);
        }
        *((void *)a4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    sub_268D4(0LL, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

char *sub_264E8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_38F88, &qword_38F98);
}

char *sub_264FC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39B50, &qword_39B58);
}

char *sub_26510(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39140, &qword_39B00);
}

char *sub_26524(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39130, &qword_39AF8);
}

char *sub_26538(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39AE8, &qword_397D8);
}

char *sub_2654C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39AD0, &qword_397E0);
}

char *sub_26560(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2656C(a1, a2, a3, a4, sub_28974);
}

char *sub_2656C(char *result, int64_t a2, char a3, char *a4, uint64_t (*a5)(void))
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }

  unint64_t v7 = *((void *)a4 + 3);
  uint64_t v8 = v7 >> 1;
  if (v8 + 0x4000000000000000LL >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v9 = *((void *)a4 + 2);
    if (v8 <= v9) {
      uint64_t v10 = *((void *)a4 + 2);
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      uint64_t v11 = a5();
      uint64_t v12 = (char *)swift_allocObject( v11,  ((*(unsigned int *)(v11 + 48) + 7LL) & 0x1FFFFFFF8LL) + 8 * v10,  *(unsigned __int16 *)(v11 + 52) | 7LL);
      int64_t v13 = j__malloc_size(v12);
      uint64_t v14 = v13 - 32;
      if (v13 < 32) {
        uint64_t v14 = v13 - 25;
      }
      *((void *)v12 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v9;
      *((void *)v12 + 3) = 2 * (v14 >> 3);
      size_t v15 = v12 + 32;
      if ((v6 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
      size_t v15 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v12 != a4 || v15 >= &a4[8 * v9 + 32]) {
          memmove(v15, a4 + 32, 8 * v9);
        }
        *((void *)a4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_267EC(0LL, v9, v15, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v12;
  }

  __break(1u);
  return result;
}

uint64_t sub_2667C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2619C( a1,  a2,  a3,  a4,  &qword_39B08,  (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

char *sub_26690(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39B20, &qword_396E0);
}

char *sub_266A4(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39B10, &qword_39B18);
}

uint64_t sub_266B8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2619C( a1,  a2,  a3,  a4,  &qword_39AC8,  (uint64_t (*)(void))&type metadata accessor for EventStreamType);
}

char *sub_266CC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_393F8, &qword_396C8);
}

uint64_t sub_266E0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2619C( a1,  a2,  a3,  a4,  &qword_397D0,  (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
}

char *sub_266F4(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_263BC(a1, a2, a3, a4, &qword_39B38, &qword_397A0);
}

uint64_t sub_26708(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2619C(a1, a2, a3, a4, &qword_39B28, (uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_2671C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4CC0(&qword_39438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_26764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4CC0(&qword_39438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_267AC(uint64_t a1)
{
  uint64_t v2 = sub_4CC0(&qword_39438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

char *sub_267EC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_268D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v7 = a4 + 40 * a1 + 32;
  unint64_t v8 = a3 + 40 * v5;
  if (v7 >= v8 || v7 + 40 * v5 <= a3)
  {
    sub_4CC0(a5);
    swift_arrayInitWithCopy(a3);
    return v8;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_269DC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_26AC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(a5(0LL) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  uint64_t v13 = v11 * v5;
  unint64_t v14 = a3 + v13;
  unint64_t v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_26BDC()
{
  uint64_t v1 = (char *)v0
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin41SiriPrivateLearningInferencePluginContext_uflCoreAnalyticsLogLevel;
  uint64_t v2 = type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_26C54()
{
  return type metadata accessor for SiriPrivateLearningInferencePluginContext(0LL);
}

uint64_t type metadata accessor for SiriPrivateLearningInferencePluginContext(uint64_t a1)
{
  uint64_t result = qword_39B98;
  if (!qword_39B98) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriPrivateLearningInferencePluginContext);
  }
  return result;
}

uint64_t sub_26C98(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = "(";
  v4[2] = "(";
  v4[3] = "(";
  v4[4] = "(";
  uint64_t result = type metadata accessor for UFLCoreAnalyticsLogLevel(319LL);
  if (v3 <= 0x3F)
  {
    v4[5] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_26D18@<X0>(uint64_t a1@<X8>)
{
  return sub_8120(*v1 + 16LL, a1);
}

uint64_t sub_26D38@<X0>(uint64_t a1@<X8>)
{
  return sub_8120(*v1 + 56LL, a1);
}

uint64_t sub_26D58@<X0>(uint64_t a1@<X8>)
{
  return sub_8120(*v1 + 96LL, a1);
}

uint64_t sub_26D78@<X0>(uint64_t a1@<X8>)
{
  return sub_8120(*v1 + 136LL, a1);
}

uint64_t sub_26D98@<X0>(uint64_t a1@<X8>)
{
  return sub_8120(*v1 + 176LL, a1);
}

uint64_t sub_26DB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin41SiriPrivateLearningInferencePluginContext_uflCoreAnalyticsLogLevel;
  uint64_t v4 = type metadata accessor for UFLCoreAnalyticsLogLevel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

unint64_t *sub_26E00(uint64_t a1)
{
  return sub_26E28( a1,  (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion,  (uint64_t)&protocol witness table for PlusContactSuggestion);
}

unint64_t *sub_26E14(uint64_t a1)
{
  return sub_26E28( a1,  (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion,  (uint64_t)&protocol witness table for PlusMediaSuggestion);
}

unint64_t *sub_26E28(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v19 = a3;
  uint64_t v4 = a2(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v18 - v6;
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    unint64_t v23 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_2A6F0(0, v8, 0);
    uint64_t v9 = v23;
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v11 = *(void *)(v5 + 72);
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    do
    {
      v12(v7, v10, v4);
      unint64_t v23 = v9;
      unint64_t v14 = v9[2];
      unint64_t v13 = v9[3];
      if (v14 >= v13 >> 1) {
        sub_2A6F0(v13 > 1, v14 + 1, 1);
      }
      uint64_t v21 = v4;
      uint64_t v22 = v19;
      unint64_t v15 = (char *)sub_E5FC(&v20);
      v12(v15, (uint64_t)v7, v4);
      uint64_t v16 = v23;
      v23[2] = v14 + 1;
      sub_7D6C(&v20, (uint64_t)&v16[5 * v14 + 4]);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v9 = v23;
      v10 += v11;
      --v8;
    }

    while (v8);
  }

  return v9;
}

void *sub_26F88(uint64_t a1)
{
  return sub_26FC0( a1,  (uint64_t (*)(uint64_t))&type metadata accessor for PhoneCallGroundTruth,  &qword_39460,  (uint64_t)&protocol conformance descriptor for PhoneCallGroundTruth);
}

void *sub_26FA4(uint64_t a1)
{
  return sub_26FC0( a1,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactPromptGroundTruth,  &qword_39468,  (uint64_t)&protocol conformance descriptor for ContactPromptGroundTruth);
}

void *sub_26FC0(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  __int128 v20 = a2;
  uint64_t v5 = a2(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v19 - v7;
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = _swiftEmptyArrayStorage;
  if (v9)
  {
    uint64_t v26 = _swiftEmptyArrayStorage;
    sub_2A6C4(0, v9, 0);
    uint64_t v10 = v26;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v12 = *(void *)(v6 + 72);
    unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, v11, v5);
      uint64_t v26 = v10;
      unint64_t v15 = v10[2];
      unint64_t v14 = v10[3];
      if (v15 >= v14 >> 1) {
        sub_2A6C4(v14 > 1, v15 + 1, 1);
      }
      uint64_t v24 = v5;
      uint64_t v25 = sub_9C90(v21, 255LL, v20, v22);
      uint64_t v16 = (char *)sub_E5FC(&v23);
      v13(v16, (uint64_t)v8, v5);
      uint64_t v17 = v26;
      v26[2] = v15 + 1;
      sub_7D6C(&v23, (uint64_t)&v17[5 * v15 + 4]);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      uint64_t v10 = v26;
      v11 += v12;
      --v9;
    }

    while (v9);
  }

  return v10;
}

uint64_t sub_27134(uint64_t a1)
{
  return sub_27184(a1, (uint64_t (*)(void))sub_26054, &qword_38FB0);
}

uint64_t sub_27148(uint64_t a1)
{
  return sub_274E8( a1,  (uint64_t (*)(void))sub_26174,  (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion);
}

uint64_t sub_2715C(uint64_t a1)
{
  return sub_274E8( a1,  (uint64_t (*)(void))sub_26188,  (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion);
}

uint64_t sub_27170(uint64_t a1)
{
  return sub_27184(a1, (uint64_t (*)(void))sub_263A8, &qword_38FC0);
}

uint64_t sub_27184(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
    goto LABEL_18;
  }

  if (swift_isUniquelyReferenced_nonNull_native(*v3)
    && (int64_t)(v6 + v4) <= *(void *)(v5 + 24) >> 1)
  {
    unint64_t v10 = *(void *)(a1 + 16);
    if (v10) {
      goto LABEL_5;
    }
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }

  uint64_t v5 = a2();
  unint64_t v10 = *(void *)(a1 + 16);
  if (!v10) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v11 = *(void *)(v5 + 16);
  if ((*(void *)(v5 + 24) >> 1) - v11 < (uint64_t)v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  unint64_t v12 = v5 + 40 * v11 + 32;
  if (a1 + 32 < v12 + 40 * v10 && v12 < a1 + 32 + 40 * v10) {
    goto LABEL_21;
  }
  sub_4CC0(a3);
  swift_arrayInitWithCopy(v12);
  if (v10 < v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v14 = *(void *)(v5 + 16);
  BOOL v15 = __OFADD__(v14, v10);
  uint64_t v16 = v14 + v10;
  if (!v15)
  {
    *(void *)(v5 + 16) = v16;
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease(a1);
    uint64_t *v3 = v5;
    return result;
  }

LABEL_20:
  __break(1u);
LABEL_21:
  char v18 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v18,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
LABEL_21:
  uint64_t v17 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v17,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
LABEL_21:
  uint64_t v26 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v26,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_272FC(uint64_t a1)
{
  return sub_2734C(a1, (uint64_t (*)(void))sub_26538, &qword_397D8);
}

uint64_t sub_27310(uint64_t a1)
{
  return sub_2734C(a1, (uint64_t (*)(void))sub_26524, &qword_39AF8);
}

uint64_t sub_27324(uint64_t a1)
{
  return sub_274E8( a1,  (uint64_t (*)(void))sub_266B8,  (uint64_t (*)(void))&type metadata accessor for EventStreamType);
}

uint64_t sub_27338(uint64_t a1)
{
  return sub_2734C(a1, (uint64_t (*)(void))sub_26510, &qword_39B00);
}

uint64_t sub_2734C(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (swift_isUniquelyReferenced_nonNull_native(*v3) && v6 + v4 <= *(void *)(v5 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

  uint64_t v5 = a2();
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }

uint64_t sub_274C0(uint64_t a1)
{
  return sub_274E8( a1,  (uint64_t (*)(void))sub_2667C,  (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

uint64_t sub_274D4(uint64_t a1)
{
  return sub_274E8( a1,  (uint64_t (*)(void))sub_266E0,  (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
}

uint64_t sub_274E8(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (swift_isUniquelyReferenced_nonNull_native(*v3) && v6 + v4 <= *(void *)(v5 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

  uint64_t v5 = a2();
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }

uint64_t sub_27660(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v17 = a1;
    }
    else {
      uint64_t v17 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (v4 < 0) {
    uint64_t v18 = *v1;
  }
  else {
    uint64_t v18 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*v1);
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v18);
  swift_bridgeObjectRelease(v4);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_29;
  }
LABEL_5:
  uint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *uint64_t v1 = v4;
  uint64_t v5 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000LL) == 0 && (v4 & 0x4000000000000000LL) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v5 = 1LL;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    __n128 v10 = swift_bridgeObjectRetain(v4);
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v5,  v9,  1LL,  v4,  v10);
    swift_bridgeObjectRelease(*v1);
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
LABEL_15:
    uint64_t result = sub_2AEA0(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v12 >= v3) {
      break;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0) {
      uint64_t v19 = v4;
    }
    else {
      uint64_t v19 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v19);
    swift_bridgeObjectRelease(v4);
  }

  if (v12 < 1) {
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8LL));
  BOOL v14 = __OFADD__(v13, v12);
  uint64_t v15 = v13 + v12;
  if (!v14)
  {
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8LL)) = v15;
LABEL_19:
    uint64_t v16 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v16);
  }

  __break(1u);
  return result;
}

void sub_27818()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = type metadata accessor for MessagesContactGroundTruthGenerator();
  uint64_t v0 = sub_4CC0(&qword_39DB8);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_39C48 = v5;
  unk_39C50 = v6;
}

Swift::Void __swiftcall MessagesContactGroundTruthGenerator.reviewSession(session:)(Swift::OpaquePointer session)
{
  uint64_t v3 = sub_4CC0(&qword_38F80);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v99 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __n128 v10 = (char *)&v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v109 = (uint64_t)&v99 - v12;
  __chkstk_darwin(v11);
  BOOL v14 = (char *)&v99 - v13;
  Array<A>.getSessionId()(session._rawValue);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
  {
    sub_845C((uint64_t)v5, &qword_38F80);
    return;
  }

  uint64_t v106 = v14;
  uint64_t v107 = v1;
  uint64_t v105 = v7;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v5, v6);
  uint64_t v15 = sub_4CC0(&qword_38F88);
  uint64_t inited = swift_initStackObject(v15, &v116);
  *(_OWORD *)(inited + 16) = xmmword_2EC60;
  uint64_t v17 = type metadata accessor for MessagesClassifier(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = MessagesClassifier.init()();
  *(void *)(inited + 56) = v17;
  *(void *)(inited + 6_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = &protocol witness table for MessagesClassifier;
  *(void *)(inited + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v18;
  uint64_t v19 = type metadata accessor for EntityPromptClassifier(0LL);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  uint64_t v20 = EntityPromptClassifier.init()();
  *(void *)(inited + 96) = v19;
  *(void *)(inited + 10_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = &protocol witness table for EntityPromptClassifier;
  *(void *)(inited + 7_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v20;
  uint64_t v21 = type metadata accessor for PartialRepetitionClassifier(0LL);
  uint64_t v22 = sub_4CC0(&qword_38F90);
  uint64_t v23 = swift_initStackObject(v22, &v112);
  *(_OWORD *)(v23 + 16) = xmmword_2EC70;
  *(void *)(v23 + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = static SiriKitTaskType.sendMessage.getter();
  *(void *)(v23 + 40) = v24;
  Swift::Int v25 = sub_2B218(v23);
  rawValue = session._rawValue;
  Swift::Int v26 = v25;
  swift_setDeallocating(v23);
  swift_arrayDestroy(v23 + 32, 1LL, &type metadata for String);
  uint64_t v27 = type metadata accessor for EntityNodeComparator(0LL);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  Swift::Int v28 = v26;
  uint64_t v29 = (uint64_t)rawValue;
  uint64_t v30 = EntityNodeComparator.init(taskNamesOfInterest:restatementThreshold:allowsIdenticalUtterances:)(v28, 0LL, 0.7);
  uint64_t v114 = v27;
  unint64_t v115 = &protocol witness table for EntityNodeComparator;
  v113[0] = v30;
  uint64_t v31 = PartialRepetitionClassifier.__allocating_init(turnComparator:)(v113);
  v113[0] = v31;
  FeaturisedSessionClassifier.asSessionClassifier()(v21, &protocol witness table for PartialRepetitionClassifier);
  swift_release(v31);
  swift_bridgeObjectRetain(v29);
  uint64_t v32 = sub_9A98(inited, v29);
  swift_bridgeObjectRelease(v29);
  swift_setDeallocating(inited);
  uint64_t v33 = *(void *)(inited + 16);
  uint64_t v34 = sub_4CC0(&qword_38F98);
  swift_arrayDestroy(inited + 32, v33, v34);
  if (qword_38C68 != -1) {
    swift_once(&qword_38C68, sub_28854);
  }
  uint64_t v35 = type metadata accessor for Logger(0LL);
  uint64_t v36 = sub_7D04(v35, (uint64_t)qword_39C58);
  uint64_t v37 = swift_bridgeObjectRetain_n(v32, 2LL);
  uint64_t v38 = (os_log_s *)Logger.logObject.getter(v37);
  LOBYTE(v39) = static os_log_type_t.debug.getter();
  BOOL v40 = os_log_type_enabled(v38, (os_log_type_t)v39);
  uint64_t v104 = v6;
  __int128 v100 = v10;
  uint64_t v102 = v36;
  if (!v40)
  {

    swift_bridgeObjectRelease_n(v32, 2LL);
    goto LABEL_9;
  }

  uint64_t v41 = swift_slowAlloc(22LL, -1LL);
  uint64_t v42 = swift_slowAlloc(64LL, -1LL);
  v113[0] = v42;
  *(_DWORD *)uint64_t v41 = 136315394;
  uint64_t v43 = v41 + 4;
  if (qword_38C60 != -1) {
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v44 = qword_39C48;
    unint64_t v45 = unk_39C50;
    swift_bridgeObjectRetain(unk_39C50);
    uint64_t v110 = sub_28A50(v44, v45, v113);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v43, v41 + 12);
    swift_bridgeObjectRelease(v45);
    *(_WORD *)(v41 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    swift_bridgeObjectRetain(v32);
    uint64_t v46 = sub_4CC0(&qword_38FC0);
    uint64_t v47 = Array.description.getter(v32, v46);
    unint64_t v49 = v48;
    swift_bridgeObjectRelease(v32);
    uint64_t v110 = sub_28A50(v47, v49, v113);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v41 + 14, v41 + 22);
    swift_bridgeObjectRelease_n(v32, 2LL);
    swift_bridgeObjectRelease(v49);
    _os_log_impl(&dword_0, v38, (os_log_type_t)v39, "[%s] Classification Results: %s", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy(v42, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1LL, -1LL);
    swift_slowDealloc(v41, -1LL, -1LL);

    uint64_t v6 = v104;
LABEL_9:
    uint64_t v42 = v105;
    uint64_t v50 = type metadata accessor for MessagesInAppFollowupGroundTruthGenerator(0LL);
    swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
    uint64_t v51 = MessagesInAppFollowupGroundTruthGenerator.init()();
    v113[0] = v51;
    uint64_t v52 = sub_9C90( &qword_39C70,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for MessagesInAppFollowupGroundTruthGenerator,  (uint64_t)&protocol conformance descriptor for MessagesInAppFollowupGroundTruthGenerator);
    unint64_t v53 = rawValue;
    uint64_t v54 = dispatch thunk of GroundTruthInference.generate(session:classifications:)(rawValue, v32, v50, v52);
    swift_release(v51);
    uint64_t v55 = sub_26FC0( v54,  (uint64_t (*)(uint64_t))&type metadata accessor for MessagesGroundTruth,  &qword_39470,  (uint64_t)&protocol conformance descriptor for MessagesGroundTruth);
    swift_bridgeObjectRelease(v54);
    uint64_t v56 = type metadata accessor for SuccessfulMessageDefinition(0LL);
    swift_allocObject(v56, *(unsigned int *)(v56 + 48), *(unsigned __int16 *)(v56 + 52));
    uint64_t v57 = SuccessfulMessageDefinition.init()();
    uint64_t v110 = v57;
    uint64_t v58 = sub_9C90( &qword_39C78,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for SuccessfulMessageDefinition,  (uint64_t)&protocol conformance descriptor for SuccessfulMessageDefinition);
    SuccessfulTaskDefinition.generator()(v113, v56, v58);
    swift_release(v57);
    uint64_t v59 = v114;
    char v60 = v115;
    sub_8164(v113, v114);
    uint64_t v61 = dispatch thunk of GroundTruthInference.generate(session:classifications:)(v53, v32, v59, v60);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v60,  v59,  &protocol requirements base descriptor for GroundTruthInference,  &associated type descriptor for GroundTruthInference.T);
    uint64_t v101 = sub_4CC0(&qword_38FB0);
    uint64_t v63 = _arrayForceCast<A, B>(_:)(v61, AssociatedTypeWitness, v101);
    swift_bridgeObjectRelease(v61);
    uint64_t v110 = (uint64_t)v55;
    sub_27184(v63, (uint64_t (*)(void))sub_26054, &qword_38FB0);
    uint64_t v64 = (uint64_t)v32;
    uint64_t v65 = v110;
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v113);
    sub_8120(v107 + 16, (uint64_t)v113);
    uint64_t v66 = type metadata accessor for MessagesContactSuggestionGroundTruthGenerator(0LL);
    swift_allocObject(v66, *(unsigned int *)(v66 + 48), *(unsigned __int16 *)(v66 + 52));
    uint64_t v67 = MessagesContactSuggestionGroundTruthGenerator.init(suggestionStore:)(v113);
    uint64_t v103 = v64;
    uint64_t v68 = dispatch thunk of MessagesContactSuggestionGroundTruthGenerator.generate(session:classifications:)(v53, v64);
    swift_release(v67);
    uint64_t v69 = sub_26FC0( v68,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionOutcomeGroundTruth,  &qword_39478,  (uint64_t)&protocol conformance descriptor for ContactSuggestionOutcomeGroundTruth);
    swift_bridgeObjectRelease(v68);
    v113[0] = v65;
    sub_27184((uint64_t)v69, (uint64_t (*)(void))sub_26054, &qword_38FB0);
    uint64_t v41 = v113[0];
    uint64_t v70 = swift_bridgeObjectRetain_n(v113[0], 2LL);
    __int128 v71 = (os_log_s *)Logger.logObject.getter(v70);
    os_log_type_t v72 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = swift_slowAlloc(22LL, -1LL);
      uint64_t v74 = swift_slowAlloc(64LL, -1LL);
      v113[0] = v74;
      *(_DWORD *)uint64_t v73 = 136315394;
      if (qword_38C60 != -1) {
        swift_once(&qword_38C60, sub_27818);
      }
      uint64_t v75 = qword_39C48;
      unint64_t v76 = unk_39C50;
      swift_bridgeObjectRetain(unk_39C50);
      uint64_t v110 = sub_28A50(v75, v76, v113);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v73 + 4, v73 + 12);
      swift_bridgeObjectRelease(v76);
      *(_WORD *)(v73 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
      swift_bridgeObjectRetain(v41);
      uint64_t v78 = Array.description.getter(v77, v101);
      unint64_t v80 = v79;
      swift_bridgeObjectRelease(v41);
      uint64_t v110 = sub_28A50(v78, v80, v113);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v73 + 14, v73 + 22);
      swift_bridgeObjectRelease_n(v41, 2LL);
      swift_bridgeObjectRelease(v80);
      _os_log_impl(&dword_0, v71, v72, "[%s] Generated Messages Ground Truth: %s", (uint8_t *)v73, 0x16u);
      swift_arrayDestroy(v74, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v74, -1LL, -1LL);
      swift_slowDealloc(v73, -1LL, -1LL);

      uint64_t v6 = v104;
      uint64_t v42 = v105;
    }

    else
    {

      swift_bridgeObjectRelease_n(v41, 2LL);
    }

    uint64_t v43 = v107;
    uint64_t v81 = (uint64_t)v106;
    uint64_t v82 = v103;
    sub_2B3B8((uint64_t)rawValue, (uint64_t)v106, v103);
    swift_bridgeObjectRelease(v82);
    uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16);
    uint64_t v84 = v109;
    v83(v109, v81, v6);
    uint64_t v32 = (char *)(v43 + 64);
    swift_beginAccess(v43 + 64, v113, 33LL, 0LL);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v43 + 64));
    uint64_t v110 = *(void *)(v43 + 64);
    uint64_t v38 = (os_log_s *)v110;
    *(void *)(v43 + 6_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 0x8000000000000000LL;
    unint64_t v39 = sub_290F8(v84);
    uint64_t v87 = *((void *)v38 + 2);
    BOOL v88 = (v86 & 1) == 0;
    uint64_t v89 = v87 + v88;
    if (!__OFADD__(v87, v88)) {
      break;
    }
    __break(1u);
LABEL_24:
    swift_once(&qword_38C60, sub_27818);
  }

  char v90 = v86;
  if (*((void *)v38 + 3) >= v89)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_29FBC();
      uint64_t v38 = (os_log_s *)v110;
    }
  }

  else
  {
    sub_29700(v89, isUniquelyReferenced_nonNull_native, &qword_38E38);
    uint64_t v38 = (os_log_s *)v110;
    unint64_t v91 = sub_290F8(v109);
    if ((v90 & 1) != (v92 & 1))
    {
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
      __break(1u);
      return;
    }

    unint64_t v39 = v91;
  }

  uint64_t v93 = (uint64_t)v106;
  uint64_t v94 = *(void **)v32;
  *(void *)uint64_t v32 = v38;
  swift_bridgeObjectRelease(v94);
  uint64_t v95 = *(void **)v32;
  __n128 v96 = swift_bridgeObjectRetain(*(void *)v32);
  if ((v90 & 1) == 0)
  {
    uint64_t v97 = (uint64_t)v100;
    ((void (*)(char *, uint64_t, uint64_t, __n128))v83)(v100, v109, v6, v96);
    sub_29E78(v39, v97, (uint64_t)_swiftEmptyArrayStorage, v95);
  }

  swift_bridgeObjectRelease(v95);
  sub_27184(v41, (uint64_t (*)(void))sub_26054, &qword_38FB0);
  uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
  v98(v109, v6);
  swift_endAccess(v113);
  v98(v93, v6);
}

uint64_t MessagesContactGroundTruthGenerator.reviewedSessionGroundTruth()()
{
  uint64_t v63 = sub_4CC0(&qword_38F78);
  uint64_t v1 = __chkstk_darwin(v63);
  uint64_t v62 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v61 = (char *)&v49 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v60 = (uint64_t)&v49 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v59 = (char *)&v49 - v8;
  __chkstk_darwin(v7);
  uint64_t v58 = (char *)&v49 - v9;
  uint64_t v10 = type metadata accessor for SessionGroundTruths(0LL);
  uint64_t v56 = *(void *)(v10 - 8);
  uint64_t v57 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess(v0 + 64, v67, 0LL, 0LL);
  uint64_t v13 = *(void *)(v0 + 64);
  int64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = _swiftEmptyArrayStorage;
  if (!v14) {
    return (uint64_t)v15;
  }
  uint64_t v66 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v13);
  sub_2A71C(0, v14, 0);
  uint64_t result = sub_2B190(v13);
  uint64_t v18 = result;
  uint64_t v19 = 0LL;
  uint64_t v20 = v13 + 64;
  char v21 = *(_BYTE *)(v13 + 32);
  uint64_t v50 = v13 + 80;
  int64_t v51 = v14;
  uint64_t v54 = v13;
  uint64_t v55 = v12;
  uint64_t v52 = v17;
  uint64_t v53 = v13 + 64;
  while ((v18 & 0x8000000000000000LL) == 0 && v18 < 1LL << v21)
  {
    unint64_t v24 = (unint64_t)v18 >> 6;
    if (*(_DWORD *)(v13 + 36) != (_DWORD)v17) {
      goto LABEL_27;
    }
    uint64_t v64 = v19;
    uint64_t v65 = 1LL << v18;
    uint64_t v25 = v63;
    uint64_t v26 = *(int *)(v63 + 48);
    uint64_t v27 = *(void *)(v13 + 48);
    uint64_t v28 = type metadata accessor for UUID(0LL);
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
    uint64_t v31 = (uint64_t)v58;
    v30(v58, v27 + *(void *)(v29 + 72) * v18, v28);
    uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v18);
    *(void *)(v31 + v26) = v32;
    uint64_t v33 = v59;
    v30(v59, v31, v28);
    *(void *)&v33[*(int *)(v25 + 48)] = v32;
    uint64_t v34 = (uint64_t)v33;
    uint64_t v35 = v60;
    sub_9A50(v34, v60);
    swift_bridgeObjectRetain_n(v32, 2LL);
    sub_845C(v31, &qword_38F78);
    uint64_t v36 = *(int *)(v25 + 48);
    uint64_t v37 = v61;
    v30(v61, v35, v28);
    uint64_t v38 = *(void *)(v35 + v36);
    *(void *)&v37[v36] = v38;
    uint64_t v39 = *(int *)(v25 + 48);
    BOOL v40 = v62;
    v30(v62, v35, v28);
    uint64_t v41 = v55;
    *(void *)&v40[v39] = v38;
    swift_bridgeObjectRetain(v38);
    SessionGroundTruths.init(sessionId:groundTruth:)(v37, v38);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v40, v28);
    sub_845C(v35, &qword_38F78);
    uint64_t v15 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) == 0)
    {
      sub_2A71C(0, v15[2] + 1LL, 1);
      uint64_t v15 = v66;
    }

    unint64_t v43 = v15[2];
    unint64_t v42 = v15[3];
    uint64_t v13 = v54;
    if (v43 >= v42 >> 1)
    {
      sub_2A71C(v42 > 1, v43 + 1, 1);
      uint64_t v15 = v66;
    }

    v15[2] = v43 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v56 + 32))( (unint64_t)v15 + ((*(unsigned __int8 *)(v56 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))
             + *(void *)(v56 + 72) * v43,
               v41,
               v57);
    uint64_t v66 = v15;
    char v21 = *(_BYTE *)(v13 + 32);
    unint64_t v22 = 1LL << v21;
    if (v18 >= 1LL << v21) {
      goto LABEL_28;
    }
    uint64_t v20 = v53;
    uint64_t v44 = *(void *)(v53 + 8 * v24);
    if ((v44 & v65) == 0) {
      goto LABEL_29;
    }
    LODWORD(v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 17) = v52;
    if (*(_DWORD *)(v13 + 36) != (_DWORD)v52) {
      goto LABEL_30;
    }
    unint64_t v45 = v44 & (-2LL << (v18 & 0x3F));
    if (v45)
    {
      unint64_t v22 = __clz(__rbit64(v45)) | v18 & 0xFFFFFFFFFFFFFFC0LL;
      int64_t v23 = v51;
    }

    else
    {
      unint64_t v46 = v24 + 1;
      unint64_t v47 = (v22 + 63) >> 6;
      int64_t v23 = v51;
      if (v24 + 1 < v47)
      {
        unint64_t v48 = *(void *)(v53 + 8 * v46);
        if (v48)
        {
LABEL_22:
          unint64_t v22 = __clz(__rbit64(v48)) + (v46 << 6);
        }

        else
        {
          while (v47 - 2 != v24)
          {
            unint64_t v48 = *(void *)(v50 + 8 * v24++);
            if (v48)
            {
              unint64_t v46 = v24 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }

    uint64_t v19 = v64 + 1;
    uint64_t v18 = v22;
    if (v64 + 1 == v23)
    {
      swift_bridgeObjectRelease(v13);
      return (uint64_t)v15;
    }
  }

  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void *MessagesContactGroundTruthGenerator.deinit()
{
  return v0;
}

uint64_t MessagesContactGroundTruthGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t sub_28814()
{
  return MessagesContactGroundTruthGenerator.reviewedSessionGroundTruth()();
}

void sub_28834(Swift::OpaquePointer a1)
{
}

uint64_t sub_28854()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_39C58);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_39C58);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_288E4(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_288F4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_28928()
{
  uint64_t v0 = sub_4CC0(&qword_39800);
  else {
    uint64_t v1 = 0LL;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_39018;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_39DA8;
  }
  return sub_4CC0(v2);
}

uint64_t sub_28974()
{
  uint64_t v0 = sub_4CC0(&qword_396D8);
  else {
    uint64_t v1 = 0LL;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_39018;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_39D88;
  }
  return sub_4CC0(v2);
}

uint64_t sub_289C0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_289E0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_28A50(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_28A50(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_28B20(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2B694((uint64_t)v12, *a3);
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
      sub_2B694((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v12);
  return v7;
}

uint64_t sub_28B20(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_28CD8(a5, a6);
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
    LOBYTE(v1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

uint64_t sub_28CD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_28D6C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_28F44(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_28F44(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = 0;
  return v2;
}

void *sub_28D6C(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_28EE0(v4, 0LL);
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

void *sub_28EE0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_4CC0(&qword_39DB0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_28F44(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_4CC0(&qword_39DB0);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v8;
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
    *((void *)a4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

_BYTE **sub_29090(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_290A0(Swift::UInt a1)
{
  Swift::Int v3 = Hasher._finalize()();
  return sub_29168(a1, v3);
}

unint64_t sub_290F8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = sub_9C90( &qword_38FF8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_29204(a1, v7);
}

unint64_t sub_29168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

unint64_t sub_29204(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      uint64_t v14 = sub_9C90( &qword_39000,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

uint64_t sub_29348(uint64_t a1, uint64_t a2)
{
  return sub_29700(a1, a2, &qword_38E38);
}

uint64_t sub_29354(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v45 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = v2;
  uint64_t v8 = *v2;
  if (*(void *)(*v2 + 24) > a1) {
    a1 = *(void *)(*v2 + 24);
  }
  sub_4CC0(&qword_397A8);
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    uint64_t result = swift_release(v8);
    uint64_t v38 = v41;
LABEL_44:
    *uint64_t v38 = v10;
    return result;
  }

  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  unint64_t v43 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v42 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain(v8);
  int64_t v17 = 0LL;
  HIDWORD(v40) = a2;
  uint64_t v18 = 16LL;
  if ((a2 & 1) != 0) {
    uint64_t v18 = 32LL;
  }
  uint64_t v44 = v18;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_26;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }

    if (v22 >= v42)
    {
      swift_release(v8);
      uint64_t v38 = v41;
      int64_t v23 = v43;
      if ((v40 & 0x100000000LL) != 0)
      {
LABEL_39:
        uint64_t v39 = 1LL << *(_BYTE *)(v8 + 32);
        if (v39 >= 64) {
          bzero(v23, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
        }
        else {
          *int64_t v23 = -1LL << v39;
        }
        *(void *)(v8 + 16) = 0LL;
      }

LABEL_46:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_296F4(uint64_t a1, uint64_t a2)
{
  return sub_29700(a1, a2, &qword_39DA0);
}

uint64_t sub_29700(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *v5;
  if (*(void *)(*v5 + 24) > a1) {
    a1 = *(void *)(*v5 + 24);
  }
  sub_4CC0(a3);
  int v47 = a2;
  uint64_t v13 = static _DictionaryStorage.resize(original:capacity:move:)(v12, a1, a2);
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_43;
  }
  uint64_t v15 = 1LL << *(_BYTE *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 64);
  uint64_t v45 = (void *)(v12 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1LL << v15);
  }
  else {
    uint64_t v17 = -1LL;
  }
  unint64_t v18 = v17 & v16;
  unint64_t v43 = v5;
  int64_t v44 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v19 = v13 + 64;
  uint64_t result = swift_retain(v12);
  int64_t v21 = 0LL;
  for (i = v12; ; uint64_t v12 = i)
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }

    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v25 >= v44) {
      break;
    }
    uint64_t v26 = v45;
    unint64_t v27 = v45[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v44) {
        goto LABEL_36;
      }
      unint64_t v27 = v45[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_36:
          swift_release(v12);
          uint64_t v5 = v43;
          if ((v47 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1LL)) {
              goto LABEL_45;
            }
            if (v21 >= v44) {
              goto LABEL_36;
            }
            unint64_t v27 = v45[v21];
            ++v28;
            if (v27) {
              goto LABEL_23;
            }
          }
        }

        int64_t v21 = v28;
      }
    }

LABEL_23:
    unint64_t v18 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_24:
    uint64_t v29 = *(void *)(v9 + 72);
    unint64_t v30 = *(void *)(v12 + 48) + v29 * v24;
    if ((v47 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 32))(v11, v30, v8);
      uint64_t v31 = *(void *)(*(void *)(v12 + 56) + 8 * v24);
    }

    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, v30, v8);
      uint64_t v31 = *(void *)(*(void *)(v12 + 56) + 8 * v24);
      swift_bridgeObjectRetain(v31);
    }

    uint64_t v32 = *(void *)(v14 + 40);
    uint64_t v33 = sub_9C90( &qword_38FF8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v32, v8, v33);
    uint64_t v34 = -1LL << *(_BYTE *)(v14 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1LL << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1LL << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0LL;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }

      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }

    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v22;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))( *(void *)(v14 + 48) + v29 * v22,  v11,  v8);
    *(void *)(*(void *)(v14 + 56) + 8 * v2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v31;
    ++*(void *)(v14 + 16);
  }

  swift_release(v12);
  uint64_t v5 = v43;
  uint64_t v26 = v45;
  if ((v47 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v41 = 1LL << *(_BYTE *)(v12 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v26 = -1LL << v41;
  }
  *(void *)(v12 + 16) = 0LL;
LABEL_43:
  uint64_t result = swift_release(v12);
  *uint64_t v5 = v14;
  return result;
}

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for CoreDuetEventCoalescing(0LL);
    swift_arrayInitWithCopy(a1);
    return a3;
  }

uint64_t sub_29A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = &v51[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v51[-v10];
  uint64_t v12 = *v2;
  if (*(void *)(*v2 + 24) > a1) {
    a1 = *(void *)(*v2 + 24);
  }
  sub_4CC0(&qword_38DF0);
  uint64_t v13 = static _DictionaryStorage.resize(original:capacity:move:)(v12, a1, a2);
  if (!*(void *)(v12 + 16))
  {
    uint64_t v48 = v12;
LABEL_44:
    uint64_t result = swift_release(v48);
    uint64_t *v3 = v13;
    return result;
  }

  uint64_t v14 = 1LL << *(_BYTE *)(v12 + 32);
  uint64_t v15 = *(void *)(v12 + 64);
  uint64_t v55 = (void *)(v12 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1LL << v14);
  }
  else {
    uint64_t v16 = -1LL;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v53 = v2;
  int64_t v54 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v12;
  uint64_t v19 = v13 + 64;
  uint64_t v58 = v18;
  uint64_t result = swift_retain(v18);
  int64_t v21 = 0LL;
  int v52 = a2;
  uint64_t v22 = 16LL;
  if ((a2 & 1) != 0) {
    uint64_t v22 = 32LL;
  }
  uint64_t v56 = v22;
  uint64_t v57 = v9;
  while (1)
  {
    if (v17)
    {
      unint64_t v27 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v28 = v27 | (v21 << 6);
      goto LABEL_26;
    }

    int64_t v29 = v21 + 1;
    if (__OFADD__(v21, 1LL))
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }

    if (v29 >= v54)
    {
      uint64_t v49 = v58;
      swift_release(v58);
      uint64_t v3 = v53;
      unint64_t v30 = v55;
      if ((v52 & 1) != 0)
      {
LABEL_39:
        uint64_t v50 = 1LL << *(_BYTE *)(v49 + 32);
        if (v50 >= 64) {
          bzero(v30, ((unint64_t)(v50 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
        }
        else {
          *unint64_t v30 = -1LL << v50;
        }
        *(void *)(v49 + 16) = 0LL;
      }

uint64_t sub_29E78(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))( v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1,  a2,  v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1LL);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_29F10(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 72) * a1;
  uint64_t v12 = v8 + v11;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  v13(v12, a2, v9);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a4[7] + v11, a3, v9);
  uint64_t v15 = a4[2];
  BOOL v16 = __OFADD__(v15, 1LL);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    a4[2] = v17;
  }
  return result;
}

void sub_29FBC()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_4CC0(&qword_38E38);
  unint64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    swift_release(v5);
    *unint64_t v24 = v7;
    return;
  }

  uint64_t v8 = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  uint64_t v25 = v5 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }

LABEL_28:
  __break(1u);
}

  __break(1u);
  return result;
}

void *sub_2A1EC()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_4CC0(&qword_397A8);
  unint64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v5);
    *unint64_t v24 = v7;
    return result;
  }

  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v25 = v5 + 64;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }

void *sub_2A410()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void **)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - v6;
  sub_4CC0(&qword_38DF0);
  int64_t v26 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release(v8);
    *int64_t v26 = v10;
    return result;
  }

  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1LL << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  uint64_t v27 = v8 + 64;
  int64_t v13 = 0LL;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v15 = -1LL;
  if (v14 < 64) {
    uint64_t v15 = ~(-1LL << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }

    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v22 >= v28) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }

uint64_t sub_2A66C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2AAD8( a1,  a2,  a3,  (void *)*v3,  &qword_39B28,  (uint64_t (*)(void))&type metadata accessor for UUID);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A698(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2AAD8( a1,  a2,  a3,  (void *)*v3,  &qword_39B68,  (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A6C4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2A7AC(a1, a2, a3, (void *)*v3, &qword_39B30, &qword_38FB0);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A6F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2A7AC(a1, a2, a3, (void *)*v3, &qword_39D68, &qword_39D70);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A71C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2AAD8( a1,  a2,  a3,  (void *)*v3,  &qword_397D0,  (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A748(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2A964(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_2A764(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2AAD8( a1,  a2,  a3,  (void *)*v3,  &qword_39D90,  (uint64_t (*)(void))&type metadata accessor for FeaturisedTurn);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A790(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2ACB8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2A7AC(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    uint64_t v13 = sub_4CC0(a5);
    uint64_t v14 = (void *)swift_allocObject(v13, 40 * v12 + 32, 7LL);
    size_t v15 = j__malloc_size(v14);
    __int128 v14[2] = v11;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
  }

  else
  {
    uint64_t v14 = &_swiftEmptyArrayStorage;
  }

  unint64_t v16 = (unint64_t)(v14 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v16 >= v17 + 40 * v11) {
      memmove(v14 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0LL;
    goto LABEL_28;
  }

  if (v17 >= v16 + 40 * v11 || v16 >= v17 + 40 * v11)
  {
    sub_4CC0(a6);
    swift_arrayInitWithCopy(v14 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v14;
  }

uint64_t sub_2A950(char a1, int64_t a2, char a3, void *a4)
{
  return sub_2AAD8( a1,  a2,  a3,  a4,  &qword_397D0,  (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
}

uint64_t sub_2A964(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_28974();
    uint64_t v11 = (char *)swift_allocObject( v10,  ((*(unsigned int *)(v10 + 48) + 7LL) & 0x1FFFFFFF8LL) + 8 * v9,  *(unsigned __int16 *)(v10 + 52) | 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_2AAC4(char a1, int64_t a2, char a3, void *a4)
{
  return sub_2AAD8( a1,  a2,  a3,  a4,  &qword_39B08,  (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

uint64_t sub_2AAD8( char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_4CC0(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  unint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v19 - v17 == 0x8000000000000000LL && v15 == -1) {
    goto LABEL_34;
  }
  void v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0LL) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (char *)v18 + v22;
  int64_t v24 = (char *)a4 + v22;
  if ((a1 & 1) != 0)
  {
    if (v18 < a4 || v23 >= &v24[*(void *)(v21 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v23, v24);
    }

    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v23, v24);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v25 = *(void *)(v21 + 72) * v11;
  int64_t v26 = &v23[v25];
  unint64_t v27 = (unint64_t)&v24[v25];
  if (v24 >= v26 || (unint64_t)v23 >= v27)
  {
    swift_arrayInitWithCopy(v23);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v18;
  }

LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_2ACB8(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_4CC0(&qword_39D98);
  uint64_t v11 = *(void *)(sub_4CC0(&qword_397C0) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = *(void *)(sub_4CC0(&qword_397C0) - 8);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  int64_t v20 = (char *)v15 + v19;
  uint64_t v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(void *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v20, v21);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v22 = *(void *)(v18 + 72) * v8;
  unint64_t v23 = &v20[v22];
  unint64_t v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy(v20);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

uint64_t sub_2AEA0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7) {
      return a3;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
    if (!v7) {
      return a3;
    }
  }

  if (!a1) {
    goto LABEL_25;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8LL;
  if (v6)
  {
    if (a3 < 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2B648();
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_4CC0(&qword_39D78);
          uint64_t v13 = sub_2B098(v18, i, a3);
          uint64_t v15 = *v14;
          swift_retain(*v14);
          ((void (*)(uint64_t **, void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

void (*sub_2B098(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_2B118(v6, a2, a3);
  return sub_2B0EC;
}

void sub_2B0EC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t *sub_2B118(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > a2)
  {
    uint64_t v4 = swift_retain(*(void *)(a3 + 8 * a2 + 32));
LABEL_5:
    uint64_t *v3 = v4;
    return (uint64_t *)sub_2B184;
  }

  __break(1u);
  return result;
}

uint64_t sub_2B184(void *a1)
{
  return swift_release(*a1);
}

uint64_t sub_2B190(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

Swift::Int sub_2B218(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_4CC0(&qword_396E8);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v27 = a1 + 32;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v27 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v28, *(void *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        uint64_t v17 = v16[1];
        BOOL v18 = *v16 == v8 && v17 == v7;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0LL), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v19 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v19;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          int64_t v20 = (void *)(v15 + 16 * v11);
          uint64_t v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0LL);
            if ((result & 1) == 0) {
              continue;
            }
          }

          goto LABEL_3;
        }
      }

      *(void *)(v5 + 8 * v1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = v14 | v13;
      unint64_t v23 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v23 = v8;
      v23[1] = v7;
      uint64_t v24 = *(void *)(v3 + 16);
      BOOL v25 = __OFADD__(v24, 1LL);
      uint64_t v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_2B3B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 56);
  if (v4)
  {
    sub_8120(v3 + 16, (uint64_t)v17);
    uint64_t v7 = type metadata accessor for MessagesSuggestionOutcomeExtractor(0LL);
    swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
    swift_retain(v4);
    uint64_t v8 = MessagesSuggestionOutcomeExtractor.init(picsStore:)(v17);
    v17[3] = v7;
    v17[4] = (uint64_t)&protocol witness table for MessagesSuggestionOutcomeExtractor;
    v17[0] = v8;
    swift_retain(v8);
    dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.reviewSessionSuggestionOutcomes(session:classifications:outcomeExtractor:)( a1,  a3,  v17);
    swift_release(v4);
    swift_release(v8);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v17);
  }

  else
  {
    if (qword_38C68 != -1) {
      swift_once(&qword_38C68, sub_28854);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_7D04(v9, (uint64_t)qword_39C58);
    oslog = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v13 = swift_slowAlloc(32LL, -1LL);
      v17[0] = v13;
      *(_DWORD *)unint64_t v12 = 136315138;
      if (qword_38C60 != -1) {
        swift_once(&qword_38C60, sub_27818);
      }
      uint64_t v14 = qword_39C48;
      unint64_t v15 = unk_39C50;
      swift_bridgeObjectRetain(unk_39C50);
      uint64_t v18 = sub_28A50(v14, v15, v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease(v15);
      _os_log_impl( &dword_0,  oslog,  v11,  "[%s] No outcome emitter available - no PICS outcomes will be derived or logged",  v12,  0xCu);
      swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1LL, -1LL);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    else
    {
    }
  }

uint64_t sub_2B5FC(uint64_t a1, uint64_t a2)
{
  return sub_9C90( &qword_39C80,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for MessagesContactGroundTruthGenerator,  (uint64_t)&protocol conformance descriptor for MessagesContactGroundTruthGenerator);
}

uint64_t type metadata accessor for MessagesContactGroundTruthGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin35MessagesContactGroundTruthGenerator);
}

unint64_t sub_2B648()
{
  unint64_t result = qword_39D80;
  if (!qword_39D80)
  {
    uint64_t v1 = sub_20204(&qword_39D78);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_39D80);
  }

  return result;
}

uint64_t sub_2B694(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 4) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_2B6D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MediaSuggestionTag(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unsigned int v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_4CC0(&qword_39DC0);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_9C90( &qword_39DC8,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaSuggestionTag,  (uint64_t)&protocol conformance descriptor for MediaSuggestionTag);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_9C90( &qword_39DD0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for MediaSuggestionTag,  (uint64_t)&protocol conformance descriptor for MediaSuggestionTag);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          BOOL v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

void *sub_2B940(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactSuggestionTag(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unsigned int v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_4CC0(&qword_39DD8);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_9C90( &qword_39848,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionTag,  (uint64_t)&protocol conformance descriptor for ContactSuggestionTag);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_9C90( &qword_39850,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionTag,  (uint64_t)&protocol conformance descriptor for ContactSuggestionTag);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          BOOL v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

ValueMetadata *type metadata accessor for AdaptiveContactSuggestionGeneratorWrapper()
{
  return &type metadata for AdaptiveContactSuggestionGeneratorWrapper;
}

void sub_2BBC0()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = &type metadata for AdaptiveContactSuggestionGeneratorWrapper;
  uint64_t v0 = sub_4CC0(&qword_39E10);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_39DE0 = v5;
  *(void *)algn_39DE8 = v6;
}

uint64_t sub_2BC44()
{
  uint64_t v1 = sub_4CC0(&qword_397F0);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v25[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v25[-1] - v5;
  uint64_t v7 = v0[3];
  uint64_t v8 = v0[4];
  sub_8164(v0, v7);
  dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v25, v7, v8);
  uint64_t v9 = v26;
  uint64_t v10 = v27;
  sub_8164(v25, v26);
  dispatch thunk of PlusContactSuggestionStore.mostRecentStoreUpdate()(v9, v10);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v25);
  sub_2CF30((uint64_t)v6, (uint64_t)v4);
  uint64_t v11 = type metadata accessor for ContactSuggestionStoreUpdate(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v4, 1LL, v11) == 1)
  {
    sub_2CF78((uint64_t)v4);
  }

  else
  {
    uint64_t v19 = ContactSuggestionStoreUpdate.source.getter();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v11);
    if (v19 == 0xD00000000000001BLL && v21 == 0x80000000000309E0LL)
    {
      swift_bridgeObjectRelease(0x80000000000309E0LL);
      uint64_t v18 = 0LL;
      goto LABEL_12;
    }

    char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, 0xD00000000000001BLL, 0x80000000000309E0LL, 0LL);
    swift_bridgeObjectRelease(v21);
    uint64_t v18 = 0LL;
    if ((v22 & 1) != 0) {
      goto LABEL_12;
    }
  }

  if (qword_38C78 != -1) {
    swift_once(&qword_38C78, sub_2CEA0);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = sub_7D04(v13, (uint64_t)qword_39DF0);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl( &dword_0,  v15,  v16,  "Suggestion generation was not last performed by adaptive generation. Requesting all prior ground truth.",  v17,  2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  uint64_t v18 = 1LL;
LABEL_12:
  sub_2CF78((uint64_t)v6);
  return v18;
}

uint64_t sub_2BEA8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v84 = a1;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v85 = *(void **)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v65 = (char *)&v65 - v7;
  uint64_t v75 = type metadata accessor for ThinContactGroundTruth(0LL);
  uint64_t v79 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v74 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v66 = type metadata accessor for PlusContactSuggestion(0LL);
  uint64_t v82 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v81 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_4CC0(&qword_39838);
  uint64_t v11 = type metadata accessor for ContactSuggestionTag(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = swift_allocObject(v10, v15 + 2 * v13, v14 | 7);
  uint64_t v17 = v16 + v15;
  uint64_t v18 = *(void (**)(uint64_t, void, uint64_t))(v12 + 104);
  v18(v16 + v15, enum case for ContactSuggestionTag.domainPhoneCall(_:), v11);
  uint64_t v19 = v17 + v13;
  v18(v17 + v13, enum case for ContactSuggestionTag.domainMessages(_:), v11);
  v86[0] = _swiftEmptyArrayStorage;
  uint64_t v20 = v84;
  sub_2C530(v17, v2, (uint64_t)v84, v87);
  sub_2715C(v87[0]);
  uint64_t v21 = v19;
  uint64_t v22 = (uint64_t)v20;
  sub_2C530(v21, v2, (uint64_t)v20, v87);
  sub_2715C(v87[0]);
  swift_setDeallocating(v16);
  swift_arrayDestroy(v17, 2LL, v11);
  swift_deallocClassInstance(v16, 32LL, 7LL);
  uint64_t v23 = v86[0];
  uint64_t v24 = sub_A4B4(v22);
  BOOL v25 = (void *)sub_22580((uint64_t)v24);
  swift_bridgeObjectRelease(v24);
  uint64_t v26 = v2[3];
  uint64_t v27 = v2[4];
  sub_8164(v2, v26);
  dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter(v86, v26, v27);
  uint64_t v28 = type metadata accessor for PLUSOfflineLogHelpers(0LL);
  swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
  uint64_t v29 = v23;
  uint64_t v70 = PLUSOfflineLogHelpers.init(logTarget:)(v86);
  uint64_t v30 = *(void *)(v23 + 16);
  uint64_t v84 = v25;
  uint64_t v69 = v30;
  if (v30)
  {
    uint64_t v68 = v23 + ((*(unsigned __int8 *)(v82 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
    uint64_t v31 = v25 + 7;
    __n128 v32 = swift_bridgeObjectRetain(v23);
    uint64_t v83 = 0LL;
    unint64_t v33 = 0LL;
    uint64_t v34 = v65;
    unint64_t v36 = v74;
    uint64_t v35 = v75;
    uint64_t v37 = v66;
    uint64_t v67 = v29;
    while (v33 < *(void *)(v29 + 16))
    {
      uint64_t v38 = *(void *)(v82 + 72);
      unint64_t v80 = v33;
      uint64_t v39 = (*(uint64_t (**)(char *, unint64_t, uint64_t, __n128))(v82 + 16))( v81,  v68 + v38 * v33,  v37,  v32);
      uint64_t v40 = PlusContactSuggestion.contributingGroundTruth.getter(v39);
      uint64_t v77 = *(void *)(v40 + 16);
      if (v77)
      {
        uint64_t v41 = 0LL;
        unint64_t v42 = (*(unsigned __int8 *)(v79 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
        uint64_t v76 = v40;
        unint64_t v43 = v40 + v42;
        uint64_t v44 = *(void *)(v79 + 72);
        unint64_t v45 = *(uint64_t (**)(void, void, void))(v79 + 16);
        unint64_t v73 = v43;
        uint64_t v72 = v44;
        __int128 v71 = v45;
        while (1)
        {
          uint64_t v46 = v45(v36, v43 + v44 * v41, v35);
          ThinContactGroundTruth.id.getter(v46);
          uint64_t v47 = v84;
          if (!v84[2]) {
            break;
          }
          uint64_t v48 = v84[5];
          uint64_t v49 = sub_8518( &qword_38FF8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
          uint64_t v50 = dispatch thunk of Hashable._rawHashValue(seed:)(v48, v3, v49);
          uint64_t v51 = -1LL << *((_BYTE *)v47 + 32);
          unint64_t v52 = v50 & ~v51;
          uint64_t v78 = v41 + 1;
          uint64_t v53 = ~v51;
          uint64_t v54 = v85[9];
          uint64_t v55 = (void (*)(char *, unint64_t, uint64_t))v85[2];
          while (1)
          {
            v55(v6, v84[6] + v54 * v52, v3);
            uint64_t v56 = sub_8518( &qword_39000,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
            char v57 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v34, v3, v56);
            uint64_t v58 = (void (*)(char *, uint64_t))v85[1];
            v58(v6, v3);
            if ((v57 & 1) != 0) {
              break;
            }
            unint64_t v52 = (v52 + 1) & v53;
          }

          v58(v34, v3);
          unint64_t v36 = v74;
          uint64_t v35 = v75;
          (*(void (**)(char *, uint64_t))(v79 + 8))(v74, v75);
          uint64_t v41 = v78;
          unint64_t v43 = v73;
          uint64_t v44 = v72;
          unint64_t v45 = v71;
          if (v78 == v77)
          {
            uint64_t v59 = swift_bridgeObjectRelease(v76);
            uint64_t v60 = 0LL;
            goto LABEL_17;
          }
        }

        uint64_t v58 = (void (*)(char *, uint64_t))v85[1];
LABEL_16:
        v58(v34, v3);
        unint64_t v36 = v74;
        uint64_t v35 = v75;
        (*(void (**)(char *, uint64_t))(v79 + 8))(v74, v75);
        uint64_t v59 = swift_bridgeObjectRelease(v76);
        uint64_t v60 = 1LL;
LABEL_17:
        uint64_t v37 = v66;
      }

      else
      {
        uint64_t v59 = swift_bridgeObjectRelease(v40);
        uint64_t v60 = 0LL;
      }

      BOOL v61 = __CFADD__((_DWORD)v83, (_DWORD)v60);
      uint64_t v83 = (v83 + v60);
      if (v61) {
        goto LABEL_26;
      }
      unint64_t v33 = v80 + 1;
      UUID.init()(v59);
      uint64_t v62 = v81;
      dispatch thunk of PLUSOfflineLogHelpers.logContactSuggestionGenerated(suggestion:plusId:isSuggestionUpdated:)( v81,  v6,  v60);
      ((void (*)(char *, uint64_t))v85[1])(v6, v3);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v62, v37);
      uint64_t v29 = v67;
      if (v33 == v69) {
        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_26:
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain(v23);
    uint64_t v83 = 0LL;
LABEL_22:
    swift_release(v70);
    swift_bridgeObjectRelease(v84);
    swift_bridgeObjectRelease(v29);
    unint64_t v63 = *(void *)(v29 + 16);
    swift_bridgeObjectRelease(v29);
    if (HIDWORD(v63)) {
      goto LABEL_28;
    }
  }

  __break(1u);
  swift_bridgeObjectRelease(v86[0]);
  __break(1u);
LABEL_28:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_2C530@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v87 = a3;
  char v86 = a4;
  uint64_t v6 = type metadata accessor for ContactSuggestionTag(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v81 - v11;
  if (qword_38C78 != -1) {
    swift_once(&qword_38C78, sub_2CEA0);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = sub_7D04(v13, (uint64_t)qword_39DF0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v85 = a1;
  BOOL v88 = v15;
  uint64_t v16 = ((uint64_t (*)(char *, uint64_t, uint64_t))v15)(v12, a1, v6);
  uint64_t v89 = v14;
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  int v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    LODWORD(v83) = v18;
    uint64_t v84 = a2;
    uint64_t v19 = swift_slowAlloc(22LL, -1LL);
    uint64_t v82 = swift_slowAlloc(64LL, -1LL);
    char v90 = (void (*)(void, void, void))v82;
    *(_DWORD *)uint64_t v19 = 136315394;
    if (qword_38C70 != -1) {
      swift_once(&qword_38C70, sub_2BBC0);
    }
    uint64_t v20 = qword_39DE0;
    unint64_t v21 = *(void *)algn_39DE8;
    swift_bridgeObjectRetain(*(void *)algn_39DE8);
    uint64_t v92 = sub_28A50(v20, v21, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v19 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2080;
    uint64_t v22 = v88;
    v88((uint64_t)v10, (uint64_t)v12, v6);
    uint64_t v23 = String.init<A>(describing:)(v10, v6);
    unint64_t v25 = v24;
    uint64_t v92 = sub_28A50(v23, v24, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v19 + 14, v19 + 22);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    _os_log_impl(&dword_0, v17, (os_log_type_t)v83, "%s Processing new ground truth for %s", (uint8_t *)v19, 0x16u);
    uint64_t v26 = v82;
    swift_arrayDestroy(v82, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v19, -1LL, -1LL);

    a2 = v84;
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);

    uint64_t v22 = v88;
  }

  uint64_t v27 = a2[3];
  uint64_t v28 = a2[4];
  sub_8164(a2, v27);
  dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(&v90, v27, v28);
  uint64_t v29 = sub_4CC0(&qword_39838);
  uint64_t v30 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v31 = (v30 + 32) & ~v30;
  uint64_t v32 = v31 + *(void *)(v7 + 72);
  uint64_t v33 = v30 | 7;
  uint64_t v34 = swift_allocObject(v29, v32, v30 | 7);
  __int128 v83 = xmmword_2EC70;
  *(_OWORD *)(v34 + 16) = xmmword_2EC70;
  uint64_t v35 = v85;
  v22(v34 + v31, v85, v6);
  unint64_t v36 = sub_2B940(v34);
  swift_setDeallocating(v34);
  swift_arrayDestroy(v34 + v31, 1LL, v6);
  swift_deallocClassInstance(v34, 32LL, 7LL);
  uint64_t v37 = type metadata accessor for ContactSuggestionStoreCandidateAdapter(0LL);
  uint64_t v38 = *(unsigned int *)(v37 + 48);
  uint64_t v39 = *(unsigned __int16 *)(v37 + 52);
  uint64_t v84 = (void *)v37;
  swift_allocObject(v37, v38, v39);
  uint64_t v40 = ContactSuggestionStoreCandidateAdapter.init(store:requiredTags:)(&v90, v36);
  uint64_t v41 = swift_allocObject(v29, v32, v33);
  *(_OWORD *)(v41 + 16) = v83;
  v88(v41 + v31, v35, v6);
  swift_retain(v40);
  unint64_t v42 = sub_2B940(v41);
  swift_setDeallocating(v41);
  swift_arrayDestroy(v41 + v31, 1LL, v6);
  swift_deallocClassInstance(v41, 32LL, 7LL);
  uint64_t v43 = type metadata accessor for AdaptiveContactSuggestionGenerator(0LL);
  swift_allocObject(v43, *(unsigned int *)(v43 + 48), *(unsigned __int16 *)(v43 + 52));
  BOOL v88 = (void (*)(uint64_t, uint64_t, uint64_t))v40;
  uint64_t v44 = AdaptiveContactSuggestionGenerator.init(candidateProvider:domainTags:)(v40, v42);
  uint64_t v45 = v87;
  uint64_t v85 = v44;
  uint64_t v46 = dispatch thunk of AdaptiveContactSuggestionGenerator.processGroundTruths(groundTruthList:)(v87);
  swift_bridgeObjectRetain(v45);
  uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    uint64_t v51 = swift_slowAlloc(32LL, -1LL);
    char v90 = (void (*)(void, void, void))v51;
    *(_DWORD *)uint64_t v50 = 136315650;
    if (qword_38C70 != -1) {
      swift_once(&qword_38C70, sub_2BBC0);
    }
    uint64_t v52 = qword_39DE0;
    unint64_t v53 = *(void *)algn_39DE8;
    swift_bridgeObjectRetain(*(void *)algn_39DE8);
    uint64_t v92 = sub_28A50(v52, v53, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v50 + 4, v50 + 12);
    swift_bridgeObjectRelease(v53);
    *(_WORD *)(v50 + 1_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
    uint64_t v54 = v87;
    uint64_t v92 = *(void *)(v87 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v50 + 14, v50 + 22);
    swift_bridgeObjectRelease(v54);
    *(_WORD *)(v50 + 2_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 2048;
    if ((v46 & 0xC000000000000001LL) != 0)
    {
      if (v46 < 0) {
        uint64_t v55 = v46;
      }
      else {
        uint64_t v55 = v46 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v56 = __CocoaSet.count.getter(v55);
    }

    else
    {
      uint64_t v56 = *(void *)(v46 + 16);
    }

    char v57 = &SiriPrivateLearningInferencePlugin;
    uint64_t v92 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v50 + 24, v50 + 32);
    _os_log_impl( &dword_0,  v48,  v49,  "%s Updated candidate scores in %ld Ground Truth and %ld queries.",  (uint8_t *)v50,  0x20u);
    swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1LL, -1LL);
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v45);
    char v57 = &SiriPrivateLearningInferencePlugin;
  }

  type metadata accessor for AdaptiveContactSuggestionNominator(0LL);
  uint64_t v58 = v88;
  char v90 = v88;
  uint64_t v59 = sub_8518( &qword_39E08,  (uint64_t (*)(uint64_t))&type metadata accessor for ContactSuggestionStoreCandidateAdapter,  (uint64_t)&protocol conformance descriptor for ContactSuggestionStoreCandidateAdapter);
  swift_retain(v58);
  uint64_t v60 = AdaptiveContactSuggestionNominator.__allocating_init<A>(candidateProvider:)(&v90, v84, v59);
  BOOL v61 = sub_B638(v46);
  swift_bridgeObjectRelease(v46);
  uint64_t v87 = v60;
  uint64_t v62 = dispatch thunk of AdaptiveContactSuggestionNominator.nominate(queries:)(v61);
  uint64_t v63 = swift_release(v61);
  uint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
  os_log_type_t v65 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v67 = swift_slowAlloc(32LL, -1LL);
    char v90 = (void (*)(void, void, void))v67;
    *(_DWORD *)uint64_t v66 = 136315138;
    uint64_t v68 = qword_39DE0;
    unint64_t v69 = *(void *)algn_39DE8;
    swift_bridgeObjectRetain(*(void *)algn_39DE8);
    uint64_t v92 = sub_28A50(v68, v69, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v66 + 4, v66 + 12);
    swift_bridgeObjectRelease(v69);
    _os_log_impl(&dword_0, v64, v65, "%s Nominated Candidates:", v66, 0xCu);
    swift_arrayDestroy(v67, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v67, -1LL, -1LL);
    swift_slowDealloc(v66, -1LL, -1LL);
  }

  char v90 = (void (*)(void, void, void))qword_39DE0;
  unint64_t v91 = *(void *)algn_39DE8;
  swift_bridgeObjectRetain(*(void *)algn_39DE8);
  v70._countAndFlagsBits = 8224LL;
  v70._object = (void *)0xE200000000000000LL;
  String.append(_:)(v70);
  unint64_t v71 = v91;
  sub_10C84((uint64_t)v90, v91, v62);
  uint64_t v72 = swift_bridgeObjectRelease(v71);
  unint64_t v73 = (os_log_s *)Logger.logObject.getter(v72);
  os_log_type_t v74 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v76 = swift_slowAlloc(32LL, -1LL);
    char v90 = (void (*)(void, void, void))v76;
    *(_DWORD *)uint64_t v75 = 136315138;
    uint64_t v77 = qword_39DE0;
    unint64_t v78 = *(void *)algn_39DE8;
    swift_bridgeObjectRetain(*(void *)algn_39DE8);
    uint64_t v92 = sub_28A50(v77, v78, (uint64_t *)&v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v75 + 4, v75 + 12);
    swift_bridgeObjectRelease(v78);
    _os_log_impl(&dword_0, v73, v74, "%s Persisting updated candidates to the suggestion store", v75, 0xCu);
    swift_arrayDestroy(v76, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v76, -1LL, -1LL);
    swift_slowDealloc(v75, -1LL, -1LL);
  }

  uint64_t v79 = v88;
  dispatch thunk of ContactSuggestionStoreCandidateAdapter.persist()();
  swift_release(v85);
  swift_release(v87);
  uint64_t result = swift_release(v79);
  uint64_t *v86 = v62;
  return result;
}

unint64_t sub_2CE68()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_2CE88(void *a1)
{
  return 0LL;
}

uint64_t sub_2CEA0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_81A0(v0, qword_39DF0);
  uint64_t v1 = sub_7D04(v0, (uint64_t)qword_39DF0);
  if (qword_38C10 != -1) {
    swift_once(&qword_38C10, sub_E954);
  }
  uint64_t v2 = sub_7D04(v0, (uint64_t)qword_3A698);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_2CF30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4CC0(&qword_397F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_2CF78(uint64_t a1)
{
  uint64_t v2 = sub_4CC0(&qword_397F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_2CFB8()
{
  uint64_t v5 = 91LL;
  unint64_t v6 = 0xE100000000000000LL;
  uint64_t v4 = type metadata accessor for DonationSourceProvider();
  uint64_t v0 = sub_4CC0((uint64_t *)&unk_39EE0);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v4, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 93LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  qword_39E18 = v5;
  unk_39E20 = v6;
}

unint64_t sub_2D038()
{
  Swift::String v1 = v0;
  uint64_t v2 = v0 + 2;
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  sub_8164(v0 + 2, v3);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(v46, v3, v4);
  uint64_t v5 = v47;
  uint64_t v6 = v48;
  sub_8164(v46, v47);
  uint64_t v7 = static InferenceFeatures.PICSRuntimeInSiriVocab.getter();
  uint64_t v8 = type metadata accessor for AnyFeature(0LL);
  uint64_t v44 = v8;
  uint64_t v45 = &protocol witness table for AnyFeature;
  uint64_t v42 = v7;
  char v9 = dispatch thunk of FeatureManaging.isActive(_:)(&v42, v5, v6);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v42);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v46);
  if ((v9 & 1) != 0)
  {
    uint64_t v10 = v1[5];
    uint64_t v11 = v1[6];
    sub_8164(v2, v10);
    dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter(v46, v10, v11);
    uint64_t v12 = v47;
    uint64_t v13 = v48;
    sub_8164(v46, v47);
    uint64_t v14 = PlusContactSuggestionStore.readAllNominated()(v12, v13);
    uint64_t v15 = sub_26E00(v14);
    swift_bridgeObjectRelease(v14);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v46);
  }

  else
  {
    if (qword_38C10 != -1) {
      swift_once(&qword_38C10, sub_E954);
    }
    uint64_t v16 = type metadata accessor for Logger(0LL);
    uint64_t v17 = sub_7D04(v16, (uint64_t)qword_3A698);
    int v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v21 = swift_slowAlloc(32LL, -1LL);
      v46[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      if (qword_38C80 != -1) {
        swift_once(&qword_38C80, sub_2CFB8);
      }
      uint64_t v22 = qword_39E18;
      unint64_t v23 = unk_39E20;
      swift_bridgeObjectRetain(unk_39E20);
      uint64_t v42 = sub_28A50(v22, v23, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v23);
      _os_log_impl( &dword_0,  v18,  v19,  "%s PICS donations are blocked since PICSRuntimeInSiriVocab is disabled",  v20,  0xCu);
      swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);

      uint64_t v15 = (unint64_t *)&_swiftEmptyArrayStorage;
    }

    else
    {

      uint64_t v15 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
  }

  uint64_t v24 = v1[5];
  uint64_t v25 = v1[6];
  sub_8164(v2, v24);
  dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter(v46, v24, v25);
  uint64_t v26 = v47;
  uint64_t v27 = v48;
  sub_8164(v46, v47);
  uint64_t v28 = static InferenceFeatures.PIMSShadowLogging.getter();
  uint64_t v44 = v8;
  uint64_t v45 = &protocol witness table for AnyFeature;
  uint64_t v42 = v28;
  char v29 = dispatch thunk of FeatureManaging.isActive(_:)(&v42, v26, v27);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(&v42);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v46);
  if ((v29 & 1) != 0)
  {
    uint64_t v31 = v1[5];
    uint64_t v30 = v1[6];
    sub_8164(v2, v31);
    dispatch thunk of SiriPrivateLearningInferenceContext.pimsStore.getter(v46, v31, v30);
    uint64_t v32 = v47;
    uint64_t v33 = v48;
    sub_8164(v46, v47);
    uint64_t v34 = PlusMediaSuggestionStore.readAllNominated()(v32, v33);
    uint64_t v35 = sub_26E14(v34);
    swift_bridgeObjectRelease(v34);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v46);
  }

  else
  {
    uint64_t v35 = (unint64_t *)&_swiftEmptyArrayStorage;
  }

  uint64_t v36 = sub_4CC0(&qword_39ED0);
  uint64_t inited = swift_initStackObject(v36, &v41);
  *(_OWORD *)(inited + 16) = xmmword_2EA90;
  *(void *)(inited + 3_s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 2) = 22LL;
  *(void *)(inited + 40) = v15;
  *(void *)(inited + 48) = 23LL;
  *(void *)(inited + 56) = v35;
  unint64_t v38 = sub_7C08((void *)inited);
  swift_setDeallocating(inited);
  uint64_t v39 = sub_4CC0(&qword_39ED8);
  swift_arrayDestroy(inited + 32, 2LL, v39);
  return v38;
}

uint64_t sub_2D438()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t type metadata accessor for DonationSourceProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC34SiriPrivateLearningInferencePlugin22DonationSourceProvider);
}
uint64_t sub_100002358(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  v3 = (void *)swift_task_alloc(dword_1000182FC);
  *(void *)(v1 + 32) = v3;
  *v3 = v1;
  v3[1] = sub_1000023B8;
  return sub_100002690(v1 + 16, a1);
}

uint64_t sub_1000023B8()
{
  return swift_task_switch(sub_10000240C, 0LL, 0LL);
}

uint64_t sub_10000240C()
{
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[5] = v1;
  v4 = (uint64_t (*)(void *))((char *)&dword_100018350 + dword_100018350);
  v2 = (void *)swift_task_alloc(unk_100018354);
  v0[6] = v2;
  void *v2 = v0;
  v2[1] = sub_100002478;
  return v4(v0 + 3);
}

uint64_t sub_100002478(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 48);
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100002610;
  }

  else
  {
    uint64_t v7 = *(void *)(v4 + 40);
    *(_BYTE *)(v4 + 64) = a1 & 1;
    sub_100003BF0(v7);
    v6 = sub_1000024F8;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000024F8()
{
  if (*(_BYTE *)(v0 + 64) == 1)
  {
    objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v1 = MLHostResult.init(status:policy:)(2LL, 0LL);
  }

  else
  {
    if (qword_1000181C0 != -1) {
      swift_once(&qword_1000181C0, sub_10000F7AC);
    }
    uint64_t v2 = type metadata accessor for InternalLogger(0LL);
    sub_100003E30(v2, (uint64_t)qword_100018508);
    v3._countAndFlagsBits = 0xD000000000000023LL;
    v4._countAndFlagsBits = 0xD000000000000067LL;
    v3._object = (void *)0x8000000100011B80LL;
    v4._object = (void *)0x8000000100011A60LL;
    v5._object = (void *)0x8000000100011BB0LL;
    v5._countAndFlagsBits = 0xD000000000000013LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v3, v4, v5);
    v8 = &type metadata for RepackagingError;
    unint64_t v9 = sub_1000045F8();
    v7[0] = 2;
    objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v1 = MLHostResult.init(error:policy:)(v7, 2LL);
  }

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_100002610()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_100003BF0(*(void *)(v0 + 40));
  v6 = &type metadata for RepackagingError;
  unint64_t v7 = sub_1000045F8();
  v5[0] = 0;
  id v2 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v3 = MLHostResult.init(error:policy:)(v5, 1LL);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_100002690(uint64_t a1, uint64_t a2)
{
  v3[7] = a1;
  v3[8] = v2;
  uint64_t v5 = *v2;
  uint64_t v6 = type metadata accessor for InternalLogger(0LL);
  v3[9] = v6;
  v3[10] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100003C00(&qword_100018310);
  uint64_t v8 = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[11] = v8;
  v3[4] = v2;
  unint64_t v9 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  v3[12] = v9;
  uint64_t v10 = sub_100003C00(&qword_100018318);
  uint64_t v12 = sub_1000038F4( &qword_1000182E8,  v11,  (uint64_t (*)(uint64_t))type metadata accessor for RepackagingWorker,  (uint64_t)&unk_100010EFC);
  uint64_t v13 = sub_100003D44( &qword_100018320,  (void (*)(void))sub_100003D00,  (uint64_t)&protocol conformance descriptor for <A> A?);
  uint64_t v14 = sub_100003D44( &qword_100018330,  (void (*)(void))sub_100003DAC,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *unint64_t v9 = v3;
  v9[1] = sub_1000027E0;
  return MLHostExtension.loadConfig<A>(context:)(v8, a2, v5, v10, v12, v13, v14);
}

uint64_t sub_1000027E0()
{
  return swift_task_switch(sub_100002834, 0LL, 0LL);
}

uint64_t sub_100002834()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_100003C00(&qword_100018340);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2) == 1)
  {
    sub_100003DF0(v1);
    uint64_t v4 = 2LL;
  }

  else
  {
    MLHostParameters.taskParameters.getter(v2);
    uint64_t v4 = *(void *)(v0 + 40);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    if (v4 != 2)
    {
      sub_100003E58(v4);
      if (qword_1000181C0 != -1) {
        swift_once(&qword_1000181C0, sub_10000F7AC);
      }
      uint64_t v5 = *(void *)(v0 + 80);
      uint64_t v6 = sub_100003E30(*(void *)(v0 + 72), (uint64_t)qword_100018508);
      sub_100003E68(v6, v5);
      v19[0] = 0LL;
      v19[1] = 0xE000000000000000LL;
      _StringGuts.grow(_:)(18LL);
      *(void *)(v0 + 16) = 0LL;
      *(void *)(v0 + 24) = 0xE000000000000000LL;
      v7._object = (void *)0x8000000100011A40LL;
      v7._countAndFlagsBits = 0xD000000000000010LL;
      String.append(_:)(v7);
      *(void *)(v0 + 48) = v4;
      _print_unlocked<A, B>(_:_:)( v0 + 48,  v0 + 16,  &type metadata for ExtensionRecipe,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
      sub_100003E48(v4);
      v8._countAndFlagsBits = *(void *)(v0 + 16);
      unint64_t v9 = *(void **)(v0 + 24);
      v10._countAndFlagsBits = 0xD000000000000067LL;
      v10._object = (void *)0x8000000100011A60LL;
      v8._object = v9;
      v11._countAndFlagsBits = 0x6963655264616F6CLL;
      v11._object = (void *)0xEE00293A5F286570LL;
      InternalLogger.debug(_:fromFile:fromFunction:)(v8, v10, v11);
      swift_bridgeObjectRelease(v9);
      sub_100003EAC(v5);
    }
  }

  sub_100002E30(v19);
  uint64_t v12 = v19[0];
  if (v19[0] == 2)
  {
    if (v4 == 2)
    {
      if (qword_1000181C0 != -1) {
        swift_once(&qword_1000181C0, sub_10000F7AC);
      }
      sub_100003E30(*(void *)(v0 + 72), (uint64_t)qword_100018508);
      v13._countAndFlagsBits = 0xD000000000000011LL;
      v14._countAndFlagsBits = 0xD000000000000065LL;
      v13._object = (void *)0x80000001000119B0LL;
      v14._object = (void *)0x80000001000119D0LL;
      v15._countAndFlagsBits = 0x52746C7561666564LL;
      v15._object = (void *)0xED00006570696365LL;
      InternalLogger.info(_:fromFile:fromFunction:)(v13, v14, v15);
      uint64_t v4 = 1LL;
    }
  }

  else
  {
    sub_100003E48(v4);
    uint64_t v4 = v12;
  }

  uint64_t v17 = *(void *)(v0 + 80);
  uint64_t v16 = *(void *)(v0 + 88);
  **(void **)(v0 + 56) = v4;
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002AD4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_1000182FC);
  *(void *)(v1 + 176) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100002B34;
  return sub_100002690(v1 + 152, a1);
}

uint64_t sub_100002B34()
{
  return swift_task_switch(sub_100002B88, 0LL, 0LL);
}

uint64_t sub_100002B88()
{
  uint64_t v1 = v0[19];
  v0[23] = v1;
  id v2 = [(id)objc_opt_self(FLLogger) sharedLoggerWithPersistenceConfiguration:1];
  v0[24] = v2;
  id v3 = [objc_allocWithZone(SiriAnalyticsInternalTelemetry) init];
  v0[25] = v3;
  v0[17] = v2;
  v0[18] = v3;
  v0[20] = v1;
  uint64_t v4 = (void *)swift_task_alloc(dword_10001848C);
  v0[26] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100002C40;
  return SessionBuilderExtension.package(with:)(v0 + 20);
}

uint64_t sub_100002C40(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 208);
  *(void *)(*v2 + 216) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_100002CF4;
  }

  else
  {
    uint64_t v7 = *(void *)(v4 + 184);
    *(void *)(v4 + 224) = a1;
    sub_100003BF0(v7);
    uint64_t v6 = sub_100002CBC;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_100002CBC()
{
  uint64_t v1 = *(void **)(v0 + 200);

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 224));
}

uint64_t sub_100002CF4()
{
  uint64_t v1 = *(void *)(v0 + 216);
  sub_100003BF0(*(void *)(v0 + 184));
  *(void *)(v0 + 168) = v1;
  swift_errorRetain(v1);
  uint64_t v2 = sub_100003C00(&qword_100018300);
  uint64_t v3 = sub_100003C00(&qword_100018308);
  if ((swift_dynamicCast(v0 + 96, v0 + 168, v2, v3, 0LL) & 1) != 0)
  {
    uint64_t v5 = *(void **)(v0 + 192);
    uint64_t v4 = *(void **)(v0 + 200);
    swift_errorRelease(*(void *)(v0 + 216));
    sub_100003C40((__int128 *)(v0 + 96), v0 + 56);
    sub_100003C58(v0 + 56, v0 + 16);
    id v6 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v7 = MLHostResult.init(error:policy:)(v0 + 16, 1LL);

    sub_100003C9C((void *)(v0 + 56));
    swift_errorRelease(*(void *)(v0 + 168));
  }

  else
  {
    uint64_t v8 = *(void *)(v0 + 216);
    Swift::String v10 = *(void **)(v0 + 192);
    unint64_t v9 = *(void **)(v0 + 200);
    swift_errorRelease(*(void *)(v0 + 168));
    id v11 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v7 = MLHostResult.init(status:policy:)(0LL, 1LL);
    swift_errorRelease(v8);
  }

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

void sub_100002E30(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    id v4 = v3;
    NSString v5 = String._bridgeToObjectiveC()();
    unsigned int v6 = [v4 BOOLForKey:v5];

    if (v6)
    {
      if (qword_1000181C0 != -1) {
        swift_once(&qword_1000181C0, sub_10000F7AC);
      }
      uint64_t v7 = type metadata accessor for InternalLogger(0LL);
      sub_100003E30(v7, (uint64_t)qword_100018508);
      unint64_t v8 = 0xD000000000000023LL;
      unint64_t v9 = "Bypass flag found, using nil recipe";
LABEL_10:
      unint64_t v11 = (unint64_t)(v9 - 32) | 0x8000000000000000LL;
      v12._object = (void *)0x8000000100011A60LL;
      v12._countAndFlagsBits = 0xD000000000000067LL;
      v13._countAndFlagsBits = 0x6552737361707962LL;
      v13._object = (void *)0xEE00292865706963LL;
      InternalLogger.debug(_:fromFile:fromFunction:)(*(Swift::String *)&v8, v12, v13);
      uint64_t v14 = 1LL;
      goto LABEL_14;
    }
  }

  if (os_variant_has_internal_content("com.apple.aiml.RepackagingPlugin"))
  {
    if (qword_1000181C0 != -1) {
      swift_once(&qword_1000181C0, sub_10000F7AC);
    }
    uint64_t v10 = type metadata accessor for InternalLogger(0LL);
    sub_100003E30(v10, (uint64_t)qword_100018508);
    unint64_t v8 = 0xD000000000000020LL;
    unint64_t v9 = "internal build, using nil recipe";
    goto LABEL_10;
  }

  if (qword_1000181C0 != -1) {
    swift_once(&qword_1000181C0, sub_10000F7AC);
  }
  uint64_t v15 = type metadata accessor for InternalLogger(0LL);
  sub_100003E30(v15, (uint64_t)qword_100018508);
  v16._countAndFlagsBits = 0xD00000000000001BLL;
  v16._object = (void *)0x8000000100011B00LL;
  v17._object = (void *)0x8000000100011A60LL;
  v17._countAndFlagsBits = 0xD000000000000067LL;
  v18._countAndFlagsBits = 0x6552737361707962LL;
  v18._object = (void *)0xEE00292865706963LL;
  InternalLogger.debug(_:fromFile:fromFunction:)(v16, v17, v18);
  uint64_t v14 = 2LL;
LABEL_14:
  *a1 = v14;
}

uint64_t sub_10000303C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100003C00(&qword_100018300);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    uint64_t v10 = 0LL;
    if (a2)
    {
      unint64_t v12 = sub_1000046C8();
      uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v12);
    }

    uint64_t v13 = v10;
    sub_100004680((uint64_t)&v13, *(void *)(*(void *)(v3 + 64) + 40LL));
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_1000030F0()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t sub_100003114(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10001834C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000049A8;
  id v4 = (void *)swift_task_alloc(dword_1000182FC);
  v3[4] = v4;
  *id v4 = v3;
  v4[1] = sub_1000023B8;
  return sub_100002690((uint64_t)(v3 + 2), a1);
}

uint64_t sub_100003198(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_1000182F4);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000321C;
  id v4 = (void *)swift_task_alloc(dword_1000182FC);
  v3[22] = v4;
  *id v4 = v3;
  v4[1] = sub_100002B34;
  return sub_100002690((uint64_t)(v3 + 19), a1);
}

uint64_t sub_10000321C(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_10000326C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100003308;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100003308()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100003350(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1000038F4( &qword_1000182E8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for RepackagingWorker,  (uint64_t)&unk_100010EFC);
  return MLHostExtension.configuration.getter(a1, v3);
}

uint64_t sub_1000033A0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1000033D8 + 4 * byte_100010C60[a1]))( 0xD000000000000011LL,  0x80000001000118A0LL);
}

uint64_t sub_1000033D8(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_1000033F0()
{
  return 0x6C706D6153746F6ELL;
}

uint64_t sub_10000340C()
{
  return 0x64657070696B73LL;
}

id sub_100003424@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = swift_allocObject(v1, 24LL, 7LL);
  id result = sub_10000F364();
  *(void *)(v3 + 16) = result;
  *a1 = v3;
  return result;
}

void sub_100003460(char *a1)
{
}

void sub_10000346C()
{
}

void sub_100003474(uint64_t a1)
{
}

void sub_10000347C(uint64_t a1)
{
}

unint64_t sub_100003484@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_100004960(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000034B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000033A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for RepackagingWorker();
  uint64_t v5 = sub_1000038F4( &qword_1000181D0,  v4,  (uint64_t (*)(uint64_t))type metadata accessor for RepackagingWorker,  (uint64_t)&unk_100010F3C);
  static AppExtension.main()(v3, v5);
  return 0;
}

uint64_t type metadata accessor for RepackagingWorker()
{
  return objc_opt_self(&OBJC_CLASS____TtC17RepackagingWorker17RepackagingWorker);
}

void type metadata accessor for FLError(uint64_t a1)
{
}

id sub_10000358C()
{
  return *v0;
}

uint64_t sub_100003594@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_10000359C(uint64_t a1)
{
  uint64_t v2 = sub_1000038F4( &qword_100018290,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DA8);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000035E0(uint64_t a1)
{
  uint64_t v2 = sub_1000038F4( &qword_100018290,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DA8);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003624(uint64_t a1)
{
  uint64_t v2 = sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100003668()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(FLErrorDomain);
}

uint64_t sub_100003678(uint64_t a1)
{
  uint64_t v2 = sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000036BC(uint64_t a1)
{
  uint64_t v2 = sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003700(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100003768()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_10000379C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000037F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[9] = *v3;
  Hasher.init(_seed:)(v7);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

void *sub_10000384C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_10000385C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100003868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000038C4()
{
  return sub_1000038F4( &qword_100018280,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)"A>");
}

uint64_t sub_1000038F4(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t sub_100003934()
{
  return sub_1000038F4( &qword_100018288,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010CEC);
}

uint64_t sub_100003964()
{
  return sub_1000038F4( &qword_100018290,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DA8);
}

uint64_t sub_100003994()
{
  return sub_1000038F4( &qword_100018298,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010D74);
}

uint64_t sub_1000039C4()
{
  return sub_1000038F4( &qword_1000182A0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010D30);
}

uint64_t sub_1000039F4()
{
  return sub_1000038F4( &qword_1000182A8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100010E94);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100003A38(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_100003A7C()
{
  return sub_1000038F4( &qword_1000182B0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100010E58);
}

unint64_t sub_100003AB0()
{
  unint64_t result = qword_1000182B8;
  if (!qword_1000182B8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1000182B8);
  }

  return result;
}

uint64_t sub_100003AF4()
{
  return sub_1000038F4( &qword_1000182C0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100010ED0);
}

uint64_t sub_100003B24()
{
  return sub_1000038F4( qword_1000182C8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for FLError,  (uint64_t)&unk_100010DEC);
}

BOOL sub_100003B54(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003B68(uint64_t a1, uint64_t a2)
{
  return sub_1000038F4( &qword_1000181D0,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for RepackagingWorker,  (uint64_t)&unk_100010F3C);
}

uint64_t sub_100003B94(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_1000038F4( &qword_1000182E8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for RepackagingWorker,  (uint64_t)&unk_100010EFC);
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

uint64_t sub_100003BF0(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100003C00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100003C40(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100003C58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003C9C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003CBC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003D00()
{
  unint64_t result = qword_100018328;
  if (!qword_100018328)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ExtensionRecipe,  &type metadata for ExtensionRecipe);
    atomic_store(result, (unint64_t *)&qword_100018328);
  }

  return result;
}

uint64_t sub_100003D44(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100003CBC(&qword_100018318);
    a2();
    uint64_t result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100003DAC()
{
  unint64_t result = qword_100018338;
  if (!qword_100018338)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ExtensionRecipe,  &type metadata for ExtensionRecipe);
    atomic_store(result, (unint64_t *)&qword_100018338);
  }

  return result;
}

uint64_t sub_100003DF0(uint64_t a1)
{
  uint64_t v2 = sub_100003C00(&qword_100018310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100003E30(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003E48(uint64_t result)
{
  if (result != 2) {
    return sub_100003BF0(result);
  }
  return result;
}

uint64_t sub_100003E58(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100003E68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003EAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100003EE8(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_26;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v4)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = v3 & 0xC000000000000001LL;
    uint64_t v27 = v3 + 32;
    unint64_t v28 = v3 & 0xC000000000000001LL;
    uint64_t v31 = v3;
    v32 = (uint64_t *)(a2 + 48);
    uint64_t v7 = &RepackagingWorker;
    uint64_t v29 = v4;
    uint64_t v30 = a2;
    while (v6)
    {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v3);
      BOOL v10 = __OFADD__(v5++, 1LL);
      if (v10) {
        goto LABEL_25;
      }
LABEL_12:
      v33 = v9;
      id v11 = objc_msgSend(v9, (SEL)v7[3].ivar_lyt, v27);
      if (v11)
      {
        unint64_t v12 = v11;
        uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
        uint64_t v15 = v14;

        if (!a2 || (uint64_t v16 = *(void *)(a2 + 16)) == 0)
        {

          swift_bridgeObjectRelease(v15);
          uint64_t v4 = 1LL;
          goto LABEL_24;
        }

        swift_bridgeObjectRetain(a2);
        Swift::String v17 = v32;
        while (1)
        {
          uint64_t v18 = *(v17 - 2);
          if (v18 < 0) {
            break;
          }
          uint64_t v19 = *(v17 - 1);
          uint64_t v20 = *v17;
          swift_bridgeObjectRetain(*v17);
          if (v18 >= String.count.getter(v13, v15))
          {
            swift_bridgeObjectRelease(v15);
            a2 = v30;
            swift_bridgeObjectRelease(v30);
            uint64_t v8 = v20;
            goto LABEL_5;
          }

          uint64_t v21 = String.index(_:offsetBy:)(15LL, v18, v13, v15);
          String.subscript.getter(v21, v13, v15);
          uint64_t v23 = v22;
          BOOL v24 = sub_100006A04(v19, v20);
          swift_bridgeObjectRelease(v20);
          swift_bridgeObjectRelease(v23);
          if (!v24) {
            break;
          }
          v17 += 3;
          if (!--v16)
          {

            swift_bridgeObjectRelease(v15);
            swift_bridgeObjectRelease(v30);
            uint64_t v4 = 1LL;
            uint64_t v3 = v31;
            goto LABEL_24;
          }
        }

        swift_bridgeObjectRelease(v15);
        a2 = v30;
        uint64_t v8 = v30;
LABEL_5:
        swift_bridgeObjectRelease(v8);
        uint64_t v3 = v31;
        unint64_t v6 = v28;
        uint64_t v4 = v29;
        uint64_t v7 = &RepackagingWorker;
      }

      if (v5 == v4)
      {
        uint64_t v4 = 0LL;
        goto LABEL_24;
      }
    }

    id v9 = *(id *)(v27 + 8 * v5);
    BOOL v10 = __OFADD__(v5++, 1LL);
    if (!v10) {
      goto LABEL_12;
    }
LABEL_25:
    __break(1u);
LABEL_26:
    if (v3 < 0) {
      uint64_t v26 = v3;
    }
    else {
      uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v3);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v26);
  }

LABEL_24:
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_100004140(void *a1)
{
  *(void *)(v1 + 128) = *a1;
  return swift_task_switch(sub_10000415C, 0LL, 0LL);
}

uint64_t sub_10000415C()
{
  if (v0[16] == 1LL)
  {
    uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v2 = 1LL;
  }

  else
  {
    id v3 = [(id)objc_opt_self(AFInstanceContext) defaultContext];
    id v4 = [objc_allocWithZone(AFSettingsConnection) initWithInstanceContext:v3];
    v0[17] = v4;

    if (v4)
    {
      uint64_t v5 = v0 + 2;
      v0[7] = v0 + 15;
      v0[2] = v0;
      v0[3] = sub_10000433C;
      uint64_t v6 = swift_continuation_init(v0 + 2, 1LL);
      v0[10] = _NSConcreteStackBlock;
      uint64_t v7 = v0 + 10;
      v7[1] = 0x40000000LL;
      v7[2] = sub_10000303C;
      v7[3] = &unk_100014A38;
      v7[4] = v6;
      [v4 fetchAccountsWithCompletion:v7];
      return swift_continuation_await(v5);
    }

    if (qword_1000181C0 != -1) {
      swift_once(&qword_1000181C0, sub_10000F7AC);
    }
    id v9 = (void *)v0[17];
    uint64_t v10 = type metadata accessor for InternalLogger(0LL);
    sub_100003E30(v10, (uint64_t)qword_100018508);
    v11._countAndFlagsBits = 0xD000000000000021LL;
    v12._countAndFlagsBits = 0xD000000000000067LL;
    v13._object = (void *)0x8000000100011BD0LL;
    v12._object = (void *)0x8000000100011A60LL;
    v11._object = (void *)0x8000000100011BF0LL;
    v13._countAndFlagsBits = 0xD000000000000019LL;
    InternalLogger.error(_:fromFile:fromFunction:)(v13, v12, v11);
    unint64_t v14 = sub_10000463C();
    swift_allocError(&type metadata for RepackagingError, v14, 0LL, 0LL);
    *uint64_t v15 = 0;
    swift_willThrow();

    uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v2 = 0LL;
  }

  return v1(v2);
}

uint64_t sub_10000433C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 144LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000044EC;
  }
  else {
    uint64_t v2 = sub_10000439C;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000439C()
{
  unint64_t v1 = *(void *)(v0 + 120);

  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 128);
    id v3 = *(void **)(v0 + 136);
    swift_bridgeObjectRetain(v2);
    char v4 = sub_100003EE8(v1, v2);
    sub_100003BF0(v2);

    swift_bridgeObjectRelease(v1);
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v6 = v4 & 1;
  }

  else
  {
    if (qword_1000181C0 != -1) {
      swift_once(&qword_1000181C0, sub_10000F7AC);
    }
    uint64_t v7 = *(void **)(v0 + 136);
    uint64_t v8 = type metadata accessor for InternalLogger(0LL);
    sub_100003E30(v8, (uint64_t)qword_100018508);
    v9._countAndFlagsBits = 0xD000000000000021LL;
    v10._countAndFlagsBits = 0xD000000000000067LL;
    v11._object = (void *)0x8000000100011BD0LL;
    v10._object = (void *)0x8000000100011A60LL;
    v9._object = (void *)0x8000000100011BF0LL;
    v11._countAndFlagsBits = 0xD000000000000019LL;
    InternalLogger.error(_:fromFile:fromFunction:)(v11, v10, v9);
    unint64_t v12 = sub_10000463C();
    swift_allocError(&type metadata for RepackagingError, v12, 0LL, 0LL);
    *Swift::String v13 = 0;
    swift_willThrow();

    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v6 = 0LL;
  }

  return v5(v6);
}

uint64_t sub_1000044EC()
{
  unint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  swift_willThrow();
  swift_errorRelease(v2);

  if (qword_1000181C0 != -1) {
    swift_once(&qword_1000181C0, sub_10000F7AC);
  }
  id v3 = *(void **)(v0 + 136);
  uint64_t v4 = type metadata accessor for InternalLogger(0LL);
  sub_100003E30(v4, (uint64_t)qword_100018508);
  v5._countAndFlagsBits = 0xD000000000000021LL;
  v6._countAndFlagsBits = 0xD000000000000067LL;
  v7._object = (void *)0x8000000100011BD0LL;
  v6._object = (void *)0x8000000100011A60LL;
  v5._object = (void *)0x8000000100011BF0LL;
  v7._countAndFlagsBits = 0xD000000000000019LL;
  InternalLogger.error(_:fromFile:fromFunction:)(v7, v6, v5);
  unint64_t v8 = sub_10000463C();
  swift_allocError(&type metadata for RepackagingError, v8, 0LL, 0LL);
  *Swift::String v9 = 0;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

unint64_t sub_1000045F8()
{
  unint64_t result = qword_100018358;
  if (!qword_100018358)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011084, &type metadata for RepackagingError);
    atomic_store(result, (unint64_t *)&qword_100018358);
  }

  return result;
}

unint64_t sub_10000463C()
{
  unint64_t result = qword_100018360;
  if (!qword_100018360)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011044, &type metadata for RepackagingError);
    atomic_store(result, (unint64_t *)&qword_100018360);
  }

  return result;
}

uint64_t sub_100004680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003C00(&qword_100018368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000046C8()
{
  unint64_t result = qword_100018370;
  if (!qword_100018370)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___AFAccount);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100018370);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for RepackagingError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RepackagingError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RepackagingError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_1000047F0 + 4 * byte_100010C69[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100004824 + 4 * byte_100010C64[v4]))();
}

uint64_t sub_100004824(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000482C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100004834LL);
  }
  return result;
}

uint64_t sub_100004840(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100004848LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10000484C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004854(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004860(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000486C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RepackagingError()
{
  return &type metadata for RepackagingError;
}

unint64_t sub_100004888()
{
  unint64_t result = qword_100018380;
  if (!qword_100018380)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001101C, &type metadata for RepackagingError);
    atomic_store(result, (unint64_t *)&qword_100018380);
  }

  return result;
}

unint64_t sub_1000048D4()
{
  unint64_t result = qword_100018388;
  if (!qword_100018388)
  {
    unint64_t result = swift_getWitnessTable("M<", &type metadata for RepackagingError);
    atomic_store(result, (unint64_t *)&qword_100018388);
  }

  return result;
}

unint64_t sub_10000491C()
{
  unint64_t result = qword_100018390;
  if (!qword_100018390)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100018390);
  }

  return result;
}

unint64_t sub_100004960(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000148F8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000049AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v55 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100003C00(&qword_1000183A0);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  Swift::String v10 = (char *)&v50 - v9;
  unint64_t v58 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v11 = sub_10000536C(*(void *)(a2 + 16), 0);
  specialized Array._endMutation()(v11);
  uint64_t v12 = *(void *)(a2 + 64);
  uint64_t v52 = a2 + 64;
  uint64_t v13 = 1LL << *(_BYTE *)(a2 + 32);
  uint64_t v14 = -1LL;
  if (v13 < 64) {
    uint64_t v14 = ~(-1LL << v13);
  }
  unint64_t v15 = v14 & v12;
  int64_t v53 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v54 = a2;
  int64_t v51 = v53 - 1;
  uint64_t result = swift_bridgeObjectRetain(a2);
  int64_t v56 = 0LL;
  if (!v15) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v17 = __clz(__rbit64(v15));
  uint64_t v18 = (v15 - 1) & v15;
  unint64_t v19 = v17 | (v56 << 6);
  while (2)
  {
    uint64_t v20 = v54;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))( v8,  *(void *)(v54 + 48) + *(void *)(v4 + 72) * v19,  v3);
    uint64_t v21 = *(void *)(v20 + 56) + 32 * v19;
    uint64_t v22 = sub_100003C00(&qword_1000183A8);
    uint64_t v23 = &v8[*(int *)(v22 + 48)];
    char v24 = *(_BYTE *)(v21 + 16);
    char v25 = *(_BYTE *)(v21 + 17);
    uint64_t v26 = *(void **)(v21 + 24);
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v21;
    v23[16] = v24;
    v23[17] = v25;
    *((void *)v23 + 3) = v26;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56LL))(v8, 0LL, 1LL, v22);
    id v27 = v26;
    while (1)
    {
      sub_100005428((uint64_t)v8, (uint64_t)v10);
      uint64_t v32 = sub_100003C00(&qword_1000183A8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48LL))(v10, 1LL, v32) == 1)
      {
        swift_release(v54);
        return v58;
      }

      unint64_t v57 = v18;
      v33 = v8;
      v34 = &v10[*(int *)(v32 + 48)];
      uint64_t v35 = v3;
      uint64_t v36 = *(void *)v34;
      uint64_t v37 = *((void *)v34 + 1);
      __int16 v38 = v34[16];
      v39 = v10;
      uint64_t v40 = v4;
      int v41 = v34[17];
      v42 = (void *)*((void *)v34 + 3);
      uint64_t v43 = (uint64_t)v55;
      v44 = v39;
      (*(void (**)(char *))(v40 + 32))(v55);
      if (v41) {
        __int16 v45 = 256;
      }
      else {
        __int16 v45 = 0;
      }
      id v46 = sub_100004DD0(v43, v36, v37, v45 | v38, v42);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v48 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      unint64_t v47 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
      if (v48 >= v47 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v47 > 1, v48 + 1, 1LL);
      }
      uint64_t v49 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v48, v46);
      specialized Array._endMutation()(v49);

      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v43, v35);
      uint64_t v3 = v35;
      uint64_t v4 = v40;
      int v8 = v33;
      Swift::String v10 = v44;
      unint64_t v15 = v57;
      if (v57) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v28 = v56 + 1;
      if (__OFADD__(v56, 1LL))
      {
        __break(1u);
        goto LABEL_34;
      }

      if (v28 < v53)
      {
        unint64_t v29 = *(void *)(v52 + 8 * v28);
        if (v29) {
          goto LABEL_9;
        }
        int64_t v30 = v56 + 2;
        ++v56;
        if (v28 + 1 < v53)
        {
          unint64_t v29 = *(void *)(v52 + 8 * v30);
          if (v29) {
            goto LABEL_12;
          }
          int64_t v56 = v28 + 1;
          if (v28 + 2 < v53)
          {
            unint64_t v29 = *(void *)(v52 + 8 * (v28 + 2));
            if (v29)
            {
              v28 += 2LL;
              goto LABEL_9;
            }

            int64_t v30 = v28 + 3;
            int64_t v56 = v28 + 2;
            if (v28 + 3 < v53) {
              break;
            }
          }
        }
      }

LABEL_23:
      uint64_t v31 = sub_100003C00(&qword_1000183A8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56LL))(v8, 1LL, 1LL, v31);
      uint64_t v18 = 0LL;
    }

    unint64_t v29 = *(void *)(v52 + 8 * v30);
    if (v29)
    {
LABEL_12:
      int64_t v28 = v30;
LABEL_9:
      uint64_t v18 = (v29 - 1) & v29;
      unint64_t v19 = __clz(__rbit64(v29)) + (v28 << 6);
      int64_t v56 = v28;
      continue;
    }

    break;
  }

  while (1)
  {
    int64_t v28 = v30 + 1;
    if (__OFADD__(v30, 1LL)) {
      break;
    }
    if (v28 >= v53)
    {
      int64_t v56 = v51;
      goto LABEL_23;
    }

    unint64_t v29 = *(void *)(v52 + 8 * v28);
    ++v30;
    if (v29) {
      goto LABEL_9;
    }
  }

    unint64_t v15 = (v27 - 1) & v27;
    char v24 = __clz(__rbit64(v27)) + (v18 << 6);
LABEL_24:
    unint64_t v29 = v19[9];
    int64_t v30 = *(void *)(v9 + 48) + v29 * v24;
    if ((v56 & 1) != 0)
    {
      uint64_t v31 = (void (*)(char *, unint64_t, uint64_t))v19[4];
      uint64_t v32 = v62;
      v31(v61, v30, v62);
      v33 = *(void *)(v9 + 56) + 32 * v24;
      v34 = *(void *)v33;
      v59 = *(void *)(v33 + 8);
      v60 = v34;
      unint64_t v58 = *(unsigned __int8 *)(v33 + 16);
      uint64_t v35 = *(_BYTE *)(v33 + 17);
      uint64_t v36 = *(void **)(v33 + 24);
    }

    else
    {
      uint64_t v37 = (void (*)(char *, unint64_t, uint64_t))v19[2];
      uint64_t v32 = v62;
      v37(v61, v30, v62);
      __int16 v38 = *(void *)(v9 + 56) + 32 * v24;
      v39 = *(void *)v38;
      v59 = *(void *)(v38 + 8);
      v60 = v39;
      unint64_t v58 = *(unsigned __int8 *)(v38 + 16);
      uint64_t v35 = *(_BYTE *)(v38 + 17);
      uint64_t v36 = *(void **)(v38 + 24);
      uint64_t v40 = v36;
    }

    int v41 = *(void *)(v11 + 40);
    v42 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v41, v32, v42);
    uint64_t v43 = -1LL << *(_BYTE *)(v11 + 32);
    v44 = result & ~v43;
    __int16 v45 = v44 >> 6;
    if (((-1LL << v44) & ~*(void *)(v16 + 8 * (v44 >> 6))) != 0)
    {
      uint64_t v20 = __clz(__rbit64((-1LL << v44) & ~*(void *)(v16 + 8 * (v44 >> 6)))) | v44 & 0x7FFFFFFFFFFFFFC0LL;
      unint64_t v19 = v57;
    }

    else
    {
      id v46 = 0;
      unint64_t v47 = (unint64_t)(63 - v43) >> 6;
      unint64_t v19 = v57;
      do
      {
        if (++v45 == v47 && (v46 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        unint64_t v48 = v45 == v47;
        if (v45 == v47) {
          __int16 v45 = 0LL;
        }
        v46 |= v48;
        uint64_t v49 = *(void *)(v16 + 8 * v45);
      }

      while (v49 == -1);
      uint64_t v20 = __clz(__rbit64(~v49)) + (v45 << 6);
    }

    *(void *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v20;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v19[4])( *(void *)(v11 + 48) + v29 * v20,  v61,  v62);
    uint64_t v21 = *(void *)(v11 + 56) + 32 * v20;
    uint64_t v22 = v59;
    *(void *)uint64_t v21 = v60;
    *(void *)(v21 + 8) = v22;
    *(_BYTE *)(v21 + 16) = v58;
    *(_BYTE *)(v21 + 17) = v35;
    *(void *)(v21 + 24) = v36;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v55;
  }

  swift_release(v9);
  uint64_t v3 = v52;
  uint64_t v26 = v54;
  if ((v56 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v50 = 1LL << *(_BYTE *)(v9 + 32);
  if (v50 >= 64) {
    bzero(v26, ((unint64_t)(v50 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v26 = -1LL << v50;
  }
  *(void *)(v9 + 16) = 0LL;
LABEL_43:
  uint64_t result = swift_release(v9);
  *uint64_t v3 = v11;
  return result;
}

    unint64_t v17 = (v26 - 1) & v26;
    uint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_24:
    int64_t v28 = *(void *)(v7 + 72);
    unint64_t v29 = *(void *)(v12 + 48) + v28 * v23;
    if ((v46 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v29, v6);
      int64_t v30 = *(id *)(*(void *)(v12 + 56) + 8 * v23);
    }

    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v29, v6);
      int64_t v30 = *(id *)(*(void *)(v12 + 56) + 8 * v23);
    }

    uint64_t v31 = *(void *)(v13 + 40);
    uint64_t v32 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v31, v6, v32);
    v33 = -1LL << *(_BYTE *)(v13 + 32);
    v34 = result & ~v33;
    uint64_t v35 = v34 >> 6;
    if (((-1LL << v34) & ~*(void *)(v18 + 8 * (v34 >> 6))) != 0)
    {
      uint64_t v21 = __clz(__rbit64((-1LL << v34) & ~*(void *)(v18 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v36 = 0;
      uint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        __int16 v38 = v35 == v37;
        if (v35 == v37) {
          uint64_t v35 = 0LL;
        }
        v36 |= v38;
        v39 = *(void *)(v18 + 8 * v35);
      }

      while (v39 == -1);
      uint64_t v21 = __clz(__rbit64(~v39)) + (v35 << 6);
    }

    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v21;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))( *(void *)(v13 + 48) + v28 * v21,  v9,  v6);
    *(void *)(*(void *)(v13 + 56) + 8 * v21) = v30;
    ++*(void *)(v13 + 16);
  }

  swift_release(v12);
  uint64_t v3 = v42;
  char v25 = v44;
  if ((v46 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v40 = 1LL << *(_BYTE *)(v12 + 32);
  if (v40 >= 64) {
    bzero(v25, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *char v25 = -1LL << v40;
  }
  *(void *)(v12 + 16) = 0LL;
LABEL_43:
  uint64_t result = swift_release(v12);
  *uint64_t v3 = v13;
  return result;
}

LABEL_34:
  __break(1u);
  return result;
}

id sub_100004DD0(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, void *a5)
{
  id v51 = a5;
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id result = [objc_allocWithZone(PFARepackagingExecution) init];
  if (!result) {
    goto LABEL_35;
  }
  uint64_t v13 = result;
  __int16 v14 = a4;
  id v15 = objc_allocWithZone(&OBJC_CLASS___SISchemaUUID);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v17 = [v15 initWithNSUUID:isa];

  [v13 setClockIdentifier:v17];
  id v18 = [objc_allocWithZone(PFARepackagingExecutionResult) init];
  [v13 setResult:v18];

  unint64_t v19 = &RepackagingWorker;
  if ((v14 & 1) != 0)
  {
    id v25 = [v13 result];
    if (!v25) {
      goto LABEL_9;
    }
    id v24 = v25;
    [v25 setSamplingResult:2];
  }

  else
  {
    id v20 = [v13 result];
    if (v20)
    {
      uint64_t v21 = v20;
      [v20 setSamplingResult:1];
    }

    id v22 = [objc_allocWithZone(PFAClockEnvelopeStatistics) init];
    [v13 setEnvelopeStatistics:v22];

    id v23 = [v13 envelopeStatistics];
    [v23 setMessageCount:a2];

    id v24 = [v13 envelopeStatistics];
    [v24 setTotalBytes:a3];
    unint64_t v19 = &RepackagingWorker;
  }

LABEL_9:
  id v26 = [v13 (SEL)v19[3].ivars];
  id v27 = v26;
  if ((v14 & 0x100) != 0)
  {
    if (v26)
    {
      [v26 setSuccess:1];
    }
  }

  else
  {
    if (v26)
    {
      id v28 = [objc_allocWithZone(PFARepackagingExecutionFailure) init];
      [v27 setFailure:v28];
    }

    if (v51)
    {
      id v29 = v51;
      id v30 = [v13 (SEL)v19[3].ivars];
      if (v30)
      {
        uint64_t v31 = v30;
        id v32 = [v30 failure];

        if (v32)
        {
          id v33 = [objc_allocWithZone(PFARepackagingExecutionFBFFailure) init];
          [v32 setFbfFailure:v33];
        }
      }

      id v34 = [v13 (SEL)v19[3].ivars];
      if (v34)
      {
        uint64_t v35 = v34;
        id v36 = [v34 failure];

        if (v36)
        {
          id v37 = [v36 fbfFailure];

          if (v37)
          {
            id v52 = v29;
            type metadata accessor for FLError(0LL);
            uint64_t v39 = v38;
            unint64_t v40 = sub_100005324();
            _BridgedStoredNSError.code.getter(&v53, v39, v40);
            [v37 setFlErrorCode:v53];
          }
        }
      }
    }
  }

  id result = [objc_allocWithZone(PFAPFAClientEvent) init];
  if (!result) {
    goto LABEL_36;
  }
  int v41 = result;
  id v42 = [result eventMetadata];
  if (v42)
  {
    uint64_t v43 = v42;
    sub_1000052E8();
    v44 = (void *)static PFAPFADeviceDimensions.current()();
    [v43 setDeviceDimensions:v44];
  }

  id v45 = [v41 eventMetadata];
  if (!v45) {
    goto LABEL_31;
  }
  id v46 = v45;
  uint64_t v47 = static Date.now.getter();
  double v48 = Date.timeIntervalSince1970.getter(v47);
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v49 = v48 * 1000.0;
  if ((~COERCE__INT64(v48 * 1000.0) & 0x7FF0000000000000LL) != 0)
  {
    if (v49 > -9.22337204e18)
    {
      if (v49 < 9.22337204e18)
      {
        [v46 setEventTimestampInMsSince1970:(uint64_t)v49];

LABEL_31:
        [v41 setRepackagingExecution:v13];

        return v41;
      }

      goto LABEL_34;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_1000052E8()
{
  unint64_t result = qword_100018398;
  if (!qword_100018398)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___PFAPFADeviceDimensions);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100018398);
  }

  return result;
}

unint64_t sub_100005324()
{
  unint64_t result = qword_1000182C8[0];
  if (!qword_1000182C8[0])
  {
    type metadata accessor for FLError(255LL);
    unint64_t result = swift_getWitnessTable(&unk_100010DEC, v1);
    atomic_store(result, qword_1000182C8);
  }

  return result;
}

uint64_t sub_10000536C(uint64_t a1, char a2)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  uint64_t *v2 = v5;
  uint64_t v7 = 0LL;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000LL) == 0 && (v5 & 0x4000000000000000LL) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1LL;
  }

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v7,  v9,  a2 & 1,  v5);
  uint64_t *v2 = result;
  return result;
}

uint64_t sub_100005428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003C00(&qword_1000183A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for InstrumentationUploader(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for InstrumentationUploader(id *a1)
{
}

uint64_t assignWithCopy for InstrumentationUploader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for InstrumentationUploader(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for InstrumentationUploader(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for InstrumentationUploader(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InstrumentationUploader(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for InstrumentationUploader()
{
  return &type metadata for InstrumentationUploader;
}

uint64_t sub_1000055F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a3;
  v4[18] = a4;
  v4[15] = a1;
  v4[16] = a2;
  return swift_task_switch(sub_100005614, 0LL, 0LL);
}

uint64_t sub_100005614()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = (void *)v0[17];
  uint64_t v3 = v0[15];
  OffDeviceTopic.rawValue.getter();
  uint64_t v5 = v4;
  NSString v6 = String._bridgeToObjectiveC()();
  v0[19] = v6;
  swift_bridgeObjectRelease(v5);
  v0[2] = v0;
  v0[3] = sub_1000056D8;
  uint64_t v7 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v8 = v0 + 10;
  v8[1] = 0x40000000LL;
  v8[2] = sub_1000057E4;
  v8[3] = &unk_100014D20;
  v8[4] = v7;
  [v2 reportSiriInstrumentationEvent:v3 forBundleID:v6 completion:v8];
  return swift_continuation_await(v1);
}

uint64_t sub_1000056D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 160LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10000576C;
  }
  else {
    uint64_t v2 = sub_100005738;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100005738()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000576C()
{
  uint64_t v2 = *(void **)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void **)(v0 + 144);
  uint64_t v4 = *(void **)(v0 + 120);
  swift_willThrow();

  sub_100005ABC(v1, v4, v3);
  swift_willThrow();
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000057E4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    return swift_continuation_throwingResume(*(void *)(a1 + 32));
  }
  uint64_t v4 = sub_100003C00(&qword_100018300);
  uint64_t v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0LL, 0LL);
  void *v6 = a2;
  id v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

void sub_100005858(uint64_t a1, uint64_t a2, void *a3, void *a4, void (*a5)(id), uint64_t a6)
{
  if (!a1)
  {
    uint64_t v11 = 0LL;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  swift_errorRetain(a1);
  id v12 = (id)sub_100005ABC(a1, a4, a3);
  swift_errorRelease(a1);
  uint64_t v11 = v12;
  if (a5)
  {
LABEL_3:
    id v13 = v11;
    swift_retain(a6);
    a5(v13);
    sub_100005CD0((uint64_t)a5, a6);
    uint64_t v11 = v13;
  }

LABEL_4:
}

uint64_t sub_1000058FC(void *a1)
{
  uint64_t v3 = v2;
  unint64_t v4 = sub_100005324();
  _BridgedStoredNSError.code.getter(&v6, v3, v4);

  uint64_t result = 1LL;
  switch(v6)
  {
    case -10LL:
      uint64_t result = 40LL;
      break;
    case -9LL:
      uint64_t result = 39LL;
      break;
    case -8LL:
      uint64_t result = 38LL;
      break;
    case -7LL:
      uint64_t result = 7LL;
      break;
    case -6LL:
      uint64_t result = 6LL;
      break;
    case -5LL:
      uint64_t result = 5LL;
      break;
    case -4LL:
      uint64_t result = 4LL;
      break;
    case -3LL:
      uint64_t result = 3LL;
      break;
    case -2LL:
      uint64_t result = 2LL;
      break;
    case -1LL:
      return result;
    case 1LL:
      uint64_t result = 8LL;
      break;
    case 2LL:
      uint64_t result = 9LL;
      break;
    case 3LL:
      uint64_t result = 10LL;
      break;
    case 4LL:
      uint64_t result = 11LL;
      break;
    case 5LL:
      uint64_t result = 12LL;
      break;
    case 6LL:
      uint64_t result = 13LL;
      break;
    case 7LL:
      uint64_t result = 14LL;
      break;
    case 8LL:
      uint64_t result = 15LL;
      break;
    case 9LL:
      uint64_t result = 16LL;
      break;
    case 10LL:
      uint64_t result = 17LL;
      break;
    case 11LL:
      uint64_t result = 18LL;
      break;
    case 12LL:
      uint64_t result = 19LL;
      break;
    case 13LL:
      uint64_t result = 20LL;
      break;
    case 14LL:
      uint64_t result = 21LL;
      break;
    case 15LL:
      uint64_t result = 22LL;
      break;
    case 16LL:
      uint64_t result = 23LL;
      break;
    case 17LL:
      uint64_t result = 24LL;
      break;
    case 18LL:
      uint64_t result = 25LL;
      break;
    case 19LL:
      uint64_t result = 26LL;
      break;
    case 20LL:
      uint64_t result = 27LL;
      break;
    case 21LL:
      uint64_t result = 28LL;
      break;
    case 22LL:
      uint64_t result = 29LL;
      break;
    case 23LL:
      uint64_t result = 30LL;
      break;
    case 24LL:
      uint64_t result = 31LL;
      break;
    case 25LL:
      uint64_t result = 32LL;
      break;
    case 26LL:
      uint64_t result = 33LL;
      break;
    case 27LL:
      uint64_t result = 34LL;
      break;
    case 28LL:
      uint64_t result = 35LL;
      break;
    case 100LL:
      uint64_t result = 36LL;
      break;
    case 101LL:
      uint64_t result = 37LL;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t sub_100005ABC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = ((uint64_t (*)(void))_convertErrorToNSError(_:))();
  id v7 = (id)_convertErrorToNSError(_:)(a1);
  unsigned __int8 v8 = sub_1000058FC(v7);
  id v9 = (objc_class *)[a2 data];
  Class isa = v9;
  if (v9)
  {
    uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
    unint64_t v13 = v12;

    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100005C8C(v11, v13);
  }

  [a3 trackFBFError:v8 forEventData:isa];

  if (qword_1000181C0 != -1) {
    swift_once(&qword_1000181C0, sub_10000F7AC);
  }
  uint64_t v14 = type metadata accessor for InternalLogger(0LL);
  sub_100003E30(v14, (uint64_t)qword_100018508);
  v22._countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  _StringGuts.grow(_:)(33LL);
  v15._countAndFlagsBits = 0xD00000000000001FLL;
  v15._object = (void *)0x8000000100011C60LL;
  String.append(_:)(v15);
  uint64_t v21 = a1;
  uint64_t v16 = sub_100003C00(&qword_100018300);
  _print_unlocked<A, B>(_:_:)( &v21,  &v22,  v16,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  object = v22._object;
  v18._countAndFlagsBits = 0xD00000000000006DLL;
  v18._object = (void *)0x8000000100011C80LL;
  v19._object = (void *)0x8000000100011CF0LL;
  v19._countAndFlagsBits = 0xD00000000000001BLL;
  InternalLogger.error(_:fromFile:fromFunction:)(v22, v18, v19);
  swift_bridgeObjectRelease(object);
  return v6;
}

uint64_t sub_100005C8C(uint64_t result, unint64_t a2)
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

uint64_t sub_100005CD0(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

Swift::Bool __swiftcall ExtensionSampling.isSampleIncluded(assistantId:)(Swift::String_optional assistantId)
{
  if (!assistantId.value._object) {
    return 0;
  }
  uint64_t v2 = *v1;
  if (!*v1) {
    return 1;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return 1;
  }
  object = assistantId.value._object;
  uint64_t countAndFlagsBits = assistantId.value._countAndFlagsBits;
  swift_bridgeObjectRetain(*v1);
  for (i = (uint64_t *)(v2 + 48); ; i += 3)
  {
    uint64_t v7 = *(i - 2);
    if (v7 < 0)
    {
LABEL_12:
      uint64_t v15 = v2;
      goto LABEL_14;
    }

    uint64_t v9 = *(i - 1);
    uint64_t v8 = *i;
    swift_bridgeObjectRetain(*i);
    if (v7 >= String.count.getter(countAndFlagsBits, object)) {
      break;
    }
    uint64_t v10 = String.index(_:offsetBy:)(15LL, v7, countAndFlagsBits, object);
    String.subscript.getter(v10, countAndFlagsBits, object);
    uint64_t v12 = v11;
    BOOL v13 = sub_100006A04(v9, v8);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v12);
    if (!v13) {
      goto LABEL_12;
    }
    if (!--v3)
    {
      swift_bridgeObjectRelease(v2);
      return 1;
    }
  }

  swift_bridgeObjectRelease(v2);
  uint64_t v15 = v8;
LABEL_14:
  swift_bridgeObjectRelease(v15);
  return 0;
}

void *ExtensionRecipe.init(sampling:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ExtensionRecipe.sampling.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  return sub_100003E58(v2);
}

uint64_t sub_100005E20()
{
  return 1LL;
}

void sub_100005E2C()
{
}

uint64_t sub_100005E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100007754(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100005E80()
{
  return 0LL;
}

void sub_100005E8C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100005E98(uint64_t a1)
{
  unint64_t v2 = sub_100006B34();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005EC0(uint64_t a1)
{
  unint64_t v2 = sub_100006B34();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtensionRecipe.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100003C00(&qword_1000183B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v1;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100006B10(a1, v8);
  unint64_t v10 = sub_100006B34();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ExtensionRecipe.CodingKeys,  &type metadata for ExtensionRecipe.CodingKeys,  v10,  v8,  v9);
  uint64_t v13 = v7;
  sub_100006B78();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExtensionRecipe.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100003C00(&qword_1000183D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006B10(a1, v9);
  unint64_t v11 = sub_100006B34();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ExtensionRecipe.CodingKeys,  &type metadata for ExtensionRecipe.CodingKeys,  v11,  v9,  v10);
  if (!v2)
  {
    sub_100006BBC();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v14;
  }

  return sub_100003C9C(a1);
}

uint64_t sub_100006100@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ExtensionRecipe.init(from:)(a1, a2);
}

uint64_t sub_100006114(void *a1)
{
  return ExtensionRecipe.encode(to:)(a1);
}

void *ExtensionSampling.init(assistantIdentifier:andIdentifiers:)@<X0>( void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = result[2];
  if (a2)
  {
    uint64_t v5 = a2;
    uint64_t result = (void *)swift_bridgeObjectRelease(result[2]);
  }

  else if (v4)
  {
    uint64_t v6 = *result;
    uint64_t v7 = result[1];
    uint64_t v8 = sub_100003C00(&qword_1000183E0);
    uint64_t result = (void *)swift_allocObject(v8, 56LL, 7LL);
    uint64_t v5 = result;
    *((_OWORD *)result + 1) = xmmword_100011180;
    result[4] = v6;
    result[5] = v7;
    result[6] = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *a3 = v5;
  return result;
}

Swift::Bool __swiftcall SampleByAssistantIdentifier.matchesData(assistantId:)(Swift::String assistantId)
{
  uint64_t v2 = *v1;
  if (*v1 < 0) {
    return 0;
  }
  object = assistantId._object;
  uint64_t countAndFlagsBits = assistantId._countAndFlagsBits;
  uint64_t v5 = v1[1];
  uint64_t v6 = v1[2];
  if (v2 >= String.count.getter(assistantId._countAndFlagsBits, assistantId._object))
  {
    return 0;
  }

  else
  {
    uint64_t v7 = String.index(_:offsetBy:)(15LL, v2, countAndFlagsBits, object);
    String.subscript.getter(v7, countAndFlagsBits, object);
    uint64_t v9 = v8;
    BOOL v10 = sub_100006A04(v5, v6);
    swift_bridgeObjectRelease(v9);
  }

  return v10;
}

Swift::Int sub_100006254()
{
  return Hasher._finalize()();
}

Swift::Int sub_100006294()
{
  return Hasher._finalize()();
}

uint64_t sub_1000062D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000077F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000062FC(uint64_t a1)
{
  unint64_t v2 = sub_100006C00();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006324(uint64_t a1)
{
  unint64_t v2 = sub_100006C00();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtensionSampling.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100003C00(&qword_1000183E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v1;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100006B10(a1, v8);
  unint64_t v10 = sub_100006C00();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ExtensionSampling.CodingKeys,  &type metadata for ExtensionSampling.CodingKeys,  v10,  v8,  v9);
  uint64_t v13 = v7;
  sub_100003C00(&qword_1000183F8);
  sub_100006C88(&qword_100018400, (void (*)(void))sub_100006C44, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExtensionSampling.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100003C00(&qword_100018410);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006B10(a1, v9);
  unint64_t v11 = sub_100006C00();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ExtensionSampling.CodingKeys,  &type metadata for ExtensionSampling.CodingKeys,  v11,  v9,  v10);
  if (!v2)
  {
    sub_100003C00(&qword_1000183F8);
    sub_100006C88( &qword_100018418,  (void (*)(void))sub_100006CF0,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v14;
  }

  return sub_100003C9C(a1);
}

uint64_t sub_1000065AC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ExtensionSampling.init(from:)(a1, a2);
}

uint64_t sub_1000065C0(void *a1)
{
  return ExtensionSampling.encode(to:)(a1);
}

RepackagingWorker::SampleByAssistantIdentifier __swiftcall SampleByAssistantIdentifier.init(position:characters:)( Swift::Int position, Swift::String characters)
{
  *(void *)uint64_t v2 = position;
  *(Swift::String *)(v2 + 8) = characters;
  result.characters = characters;
  result.position = position;
  return result;
}

uint64_t sub_1000065E0(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x6574636172616863LL;
  }
  else {
    return 0x6E6F697469736F70LL;
  }
}

BOOL sub_10000661C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100006634()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006678()
{
}

Swift::Int sub_1000066A0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000066E0()
{
  return sub_1000065E0(*v0);
}

uint64_t sub_1000066E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000078A4(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000670C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100006718(uint64_t a1)
{
  unint64_t v2 = sub_100006D34();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006740(uint64_t a1)
{
  unint64_t v2 = sub_100006D34();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t SampleByAssistantIdentifier.encode(to:)(void *a1)
{
  uint64_t v4 = sub_100003C00(&qword_100018428);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v14 = v1[2];
  uint64_t v15 = v8;
  uint64_t v11 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006B10(a1, v11);
  unint64_t v12 = sub_100006D34();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for SampleByAssistantIdentifier.CodingKeys,  &type metadata for SampleByAssistantIdentifier.CodingKeys,  v12,  v11,  v10);
  char v17 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v9, &v17, v4);
  if (!v2)
  {
    char v16 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v14, &v16, v4);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t SampleByAssistantIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100003C00(&qword_100018438);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006B10(a1, v9);
  unint64_t v11 = sub_100006D34();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for SampleByAssistantIdentifier.CodingKeys,  &type metadata for SampleByAssistantIdentifier.CodingKeys,  v11,  v9,  v10);
  if (!v2)
  {
    char v19 = 0;
    uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v19, v5);
    char v18 = 1;
    uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)(&v18, v5);
    uint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v12;
    a2[1] = v14;
    a2[2] = v16;
  }

  return sub_100003C9C(a1);
}

uint64_t sub_1000069DC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SampleByAssistantIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1000069F0(void *a1)
{
  return SampleByAssistantIdentifier.encode(to:)(a1);
}

BOOL sub_100006A04(uint64_t a1, uint64_t a2)
{
  do
  {
    object = String.Iterator.next()().value._object;
    if (!object) {
      break;
    }
    Swift::String v4 = Character.lowercased()();
    Swift::String v5 = Character.lowercased()();
    if (v4._countAndFlagsBits == v5._countAndFlagsBits && v4._object == v5._object)
    {
      swift_bridgeObjectRelease(object);
      swift_bridgeObjectRelease_n(v4._object, 2LL);
      break;
    }

    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(v4._countAndFlagsBits, v4._object);
    swift_bridgeObjectRelease(object);
    swift_bridgeObjectRelease(v4._object);
    swift_bridgeObjectRelease(v5._object);
  }

  while ((v2 & 1) == 0);
  swift_bridgeObjectRelease(a2);
  return object != 0LL;
}

void *sub_100006B10(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_100006B34()
{
  unint64_t result = qword_1000183C0;
  if (!qword_1000183C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000115E0, &type metadata for ExtensionRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000183C0);
  }

  return result;
}

unint64_t sub_100006B78()
{
  unint64_t result = qword_1000183C8;
  if (!qword_1000183C8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ExtensionSampling,  &type metadata for ExtensionSampling);
    atomic_store(result, (unint64_t *)&qword_1000183C8);
  }

  return result;
}

unint64_t sub_100006BBC()
{
  unint64_t result = qword_1000183D8;
  if (!qword_1000183D8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ExtensionSampling,  &type metadata for ExtensionSampling);
    atomic_store(result, (unint64_t *)&qword_1000183D8);
  }

  return result;
}

unint64_t sub_100006C00()
{
  unint64_t result = qword_1000183F0;
  if (!qword_1000183F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011590, &type metadata for ExtensionSampling.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000183F0);
  }

  return result;
}

unint64_t sub_100006C44()
{
  unint64_t result = qword_100018408;
  if (!qword_100018408)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SampleByAssistantIdentifier,  &type metadata for SampleByAssistantIdentifier);
    atomic_store(result, (unint64_t *)&qword_100018408);
  }

  return result;
}

uint64_t sub_100006C88(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100003CBC(&qword_1000183F8);
    a2();
    uint64_t result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100006CF0()
{
  unint64_t result = qword_100018420;
  if (!qword_100018420)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SampleByAssistantIdentifier,  &type metadata for SampleByAssistantIdentifier);
    atomic_store(result, (unint64_t *)&qword_100018420);
  }

  return result;
}

unint64_t sub_100006D34()
{
  unint64_t result = qword_100018430;
  if (!qword_100018430)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011540, &type metadata for SampleByAssistantIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018430);
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExtensionRecipe(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2 != 1) {
    uint64_t v3 = swift_bridgeObjectRetain(v3);
  }
  *a1 = v3;
  return a1;
}

uint64_t destroy for ExtensionRecipe(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result != 1) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t *assignWithCopy for ExtensionRecipe(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  if (v3 == 1)
  {
    if (v4 != 1)
    {
      *a1 = v4;
      swift_bridgeObjectRetain(v4);
      return a1;
    }

    uint64_t v5 = 1LL;
  }

  else
  {
    if (v4 != 1)
    {
      *a1 = v4;
      swift_bridgeObjectRetain(v4);
      swift_bridgeObjectRelease(v3);
      return a1;
    }

    sub_100006E44(a1);
    uint64_t v5 = *a2;
  }

  *a1 = v5;
  return a1;
}

void *sub_100006E44(void *a1)
{
  return a1;
}

void *initializeWithTake for ExtensionSampling(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t *assignWithTake for ExtensionRecipe(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  if (v3 != 1)
  {
    if (v4 != 1)
    {
      *a1 = v4;
      swift_bridgeObjectRelease(v3);
      return a1;
    }

    sub_100006E44(a1);
    uint64_t v4 = 1LL;
  }

  *a1 = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtensionRecipe(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 > 0x7FFFFFFD && *((_BYTE *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtensionRecipe(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ExtensionRecipe()
{
  return &type metadata for ExtensionRecipe;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExtensionSampling(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for ExtensionSampling(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t *assignWithCopy for ExtensionSampling(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t *assignWithTake for ExtensionSampling(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtensionSampling(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtensionSampling(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ExtensionSampling()
{
  return &type metadata for ExtensionSampling;
}

uint64_t initializeBufferWithCopyOfBuffer for SampleByAssistantIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for SampleByAssistantIdentifier(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

void *assignWithCopy for SampleByAssistantIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = a2[2];
  uint64_t v4 = a1[2];
  a1[2] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for SampleByAssistantIdentifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SampleByAssistantIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SampleByAssistantIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SampleByAssistantIdentifier(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SampleByAssistantIdentifier()
{
  return &type metadata for SampleByAssistantIdentifier;
}

uint64_t getEnumTagSinglePayload for SampleByAssistantIdentifier.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for SampleByAssistantIdentifier.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100007330 + 4 * byte_100011195[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100007364 + 4 * byte_100011190[v4]))();
}

uint64_t sub_100007364(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000736C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100007374LL);
  }
  return result;
}

uint64_t sub_100007380(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100007388LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_10000738C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007394(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000073A0(_BYTE *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SampleByAssistantIdentifier.CodingKeys()
{
  return &type metadata for SampleByAssistantIdentifier.CodingKeys;
}

uint64_t sub_1000073C8()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for ExtensionSampling.CodingKeys()
{
  return &type metadata for ExtensionSampling.CodingKeys;
}

uint64_t _s17RepackagingWorker17ExtensionSamplingV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s17RepackagingWorker17ExtensionSamplingV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100007470 + 4 * byte_10001119A[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100007490 + 4 * byte_10001119F[v4]))();
  }
}

_BYTE *sub_100007470(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_100007490(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_100007498(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_1000074A0(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_1000074A8(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_1000074B0(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ExtensionRecipe.CodingKeys()
{
  return &type metadata for ExtensionRecipe.CodingKeys;
}

unint64_t sub_1000074D0()
{
  unint64_t result = qword_100018440;
  if (!qword_100018440)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000113A8, &type metadata for ExtensionRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018440);
  }

  return result;
}

unint64_t sub_100007518()
{
  unint64_t result = qword_100018448;
  if (!qword_100018448)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011460, &type metadata for ExtensionSampling.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018448);
  }

  return result;
}

unint64_t sub_100007560()
{
  unint64_t result = qword_100018450;
  if (!qword_100018450)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011518, &type metadata for SampleByAssistantIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018450);
  }

  return result;
}

unint64_t sub_1000075A8()
{
  unint64_t result = qword_100018458;
  if (!qword_100018458)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011488, &type metadata for SampleByAssistantIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018458);
  }

  return result;
}

unint64_t sub_1000075F0()
{
  unint64_t result = qword_100018460;
  if (!qword_100018460)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000114B0, &type metadata for SampleByAssistantIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018460);
  }

  return result;
}

unint64_t sub_100007638()
{
  unint64_t result = qword_100018468;
  if (!qword_100018468)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000113D0, &type metadata for ExtensionSampling.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018468);
  }

  return result;
}

unint64_t sub_100007680()
{
  unint64_t result = qword_100018470;
  if (!qword_100018470)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000113F8, &type metadata for ExtensionSampling.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018470);
  }

  return result;
}

unint64_t sub_1000076C8()
{
  unint64_t result = qword_100018478;
  if (!qword_100018478)
  {
    unint64_t result = swift_getWitnessTable("q=", &type metadata for ExtensionRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018478);
  }

  return result;
}

unint64_t sub_100007710()
{
  unint64_t result = qword_100018480;
  if (!qword_100018480)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011340, &type metadata for ExtensionRecipe.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100018480);
  }

  return result;
}

uint64_t sub_100007754(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x676E696C706D6173LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x676E696C706D6173LL, 0xE800000000000000LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

uint64_t sub_1000077D8()
{
  return 0x676E696C706D6173LL;
}

uint64_t sub_1000077F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469LL && a2 == 0xEB00000000737265LL)
  {
    swift_bridgeObjectRelease(a2);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x696669746E656469LL, 0xEB00000000737265LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

uint64_t sub_100007884()
{
  return 0x696669746E656469LL;
}

uint64_t sub_1000078A4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F697469736F70LL && a2 == 0xE800000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697469736F70LL, 0xE800000000000000LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x6574636172616863LL && a2 == 0xEA00000000007372LL)
  {
    swift_bridgeObjectRelease(0xEA00000000007372LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6574636172616863LL, 0xEA00000000007372LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

id SessionBuilderExtension.init()@<X0>(void *a1@<X8>)
{
  id v2 = [(id)objc_opt_self(FLLogger) sharedLoggerWithPersistenceConfiguration:1];
  id result = [objc_allocWithZone(SiriAnalyticsInternalTelemetry) init];
  *a1 = v2;
  a1[1] = result;
  return result;
}

uint64_t SessionBuilderExtension.package(with:)(void *a1)
{
  uint64_t v4 = type metadata accessor for OffDeviceTopic(0LL);
  *(void *)(v2 + 504) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v2 + 512) = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v2 + 520) = swift_task_alloc(v6);
  *(void *)(v2 + 528) = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  *(void *)(v2 + 536) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v2 + 544) = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v2 + 552) = swift_task_alloc(v9);
  *(void *)(v2 + 560) = swift_task_alloc(v9);
  *(void *)(v2 + 568) = swift_task_alloc(v9);
  unint64_t v10 = (*(void *)(*(void *)(sub_100003C00(&qword_100018490) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v2 + 576) = swift_task_alloc(v10);
  *(void *)(v2 + 584) = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for SessionBuilder(0LL);
  *(void *)(v2 + 592) = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  *(void *)(v2 + 600) = v12;
  *(void *)(v2 + 608) = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for InternalLogger(0LL);
  *(void *)(v2 + 616) = v13;
  unint64_t v14 = (*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v2 + 624) = swift_task_alloc(v14);
  *(void *)(v2 + 632) = swift_task_alloc(v14);
  *(void *)(v2 + 640) = swift_task_alloc(v14);
  *(void *)(v2 + 648) = swift_task_alloc(v14);
  *(void *)(v2 + 656) = swift_task_alloc(v14);
  *(void *)(v2 + 664) = swift_task_alloc(v14);
  *(void *)(v2 + 672) = swift_task_alloc(v14);
  *(void *)(v2 + 680) = swift_task_alloc(v14);
  *(void *)(v2 + 688) = swift_task_alloc(v14);
  *(void *)(v2 + 696) = *a1;
  *(_OWORD *)(v2 + 704) = *v1;
  return swift_task_switch(sub_100007BB4, 0LL, 0LL);
}

uint64_t sub_100007BB4()
{
  uint64_t v1 = type metadata accessor for PluginStateService(0LL);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v0[90] = PluginStateService.init()();
  v0[91] = swift_allocObject(&unk_100015128, 32LL, 7LL);
  v0[92] = v2;
  void *v2 = v0;
  v2[1] = sub_100007C48;
  return v4();
}

uint64_t sub_100007C48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 736);
  *(void *)(v3 + 744) = a1;
  *(void *)(v3 + 752) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100007CA8, 0LL, 0LL);
}

uint64_t sub_100007CA8()
{
  *(_OWORD *)(*(void *)(v0 + 728) + 16LL) = *(_OWORD *)(v0 + 744);
  uint64_t v1 = swift_allocObject(&unk_100015150, 32LL, 7LL);
  *(void *)(v0 + 760) = v1;
  unint64_t v2 = sub_10000B52C((uint64_t)&_swiftEmptyArrayStorage);
  *(_DWORD *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v2;
  if (qword_1000181C0 != -1) {
    swift_once(&qword_1000181C0, sub_10000F7AC);
  }
  uint64_t v3 = *(void *)(v0 + 696);
  uint64_t v4 = *(void *)(v0 + 688);
  uint64_t v5 = sub_100003E30(*(void *)(v0 + 616), (uint64_t)qword_100018508);
  *(void *)(v0 + 768) = v5;
  sub_100003E68(v5, v4);
  *(void *)(v0 + 488) = v3;
  sub_100003E58(v3);
  v6._uint64_t countAndFlagsBits = String.init<A>(describing:)(v0 + 488, &type metadata for ExtensionRecipe);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  v8._uint64_t countAndFlagsBits = 0x203A657069636552LL;
  v9._object = (void *)0x8000000100011D10LL;
  v8._object = (void *)0xE800000000000000LL;
  v9._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
  v10._uint64_t countAndFlagsBits = 0x286567616B636170LL;
  v10._object = (void *)0xEE00293A68746977LL;
  InternalLogger.info(_:fromFile:fromFunction:)(v8, v9, v10);
  swift_bridgeObjectRelease(0xE800000000000000LL);
  sub_100003EAC(v4);
  type metadata accessor for MessageStoreReader(0LL);
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to static MessageStoreReader.vend()[1]);
  *(void *)(v0 + 776) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_100007E34;
  return static MessageStoreReader.vend()();
}

uint64_t sub_100007E34(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 776);
  *(void *)(v3 + 784) = a1;
  *(void *)(v3 + 792) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    uint64_t v5 = sub_100009D5C;
  }
  else {
    uint64_t v5 = sub_100007EA4;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100007EA4()
{
  uint64_t v1 = *(void *)(v0 + 784);
  if (!v1)
  {
    uint64_t v13 = *(void *)(v0 + 760);
    uint64_t v14 = *(void *)(v0 + 728);
    uint64_t v15 = *(void *)(v0 + 720);
    unint64_t v16 = sub_10000D0F8();
    Swift::String v186 = *(Swift::String *)(v0 + 704);
    swift_allocError(&type metadata for SessionBuilderError, v16, 0LL, 0LL);
    *uint64_t v17 = 2;
    swift_willThrow();
    Swift::String v193 = v186;
    swift_beginAccess(v13 + 16, v0 + 128, 0LL, 0LL);
    uint64_t v18 = *(unsigned int *)(v13 + 16);
    uint64_t v19 = *(void *)(v13 + 24);
    swift_bridgeObjectRetain(v19);
    sub_10000B6D8(v18, v19);
    swift_bridgeObjectRelease(v19);
    swift_release(v13);
    swift_release(v14);
    swift_release(v15);
    uint64_t v20 = *(void *)(v0 + 680);
    uint64_t v21 = *(void *)(v0 + 672);
    uint64_t v22 = *(void *)(v0 + 664);
    uint64_t v23 = *(void *)(v0 + 656);
    uint64_t v24 = *(void *)(v0 + 648);
    uint64_t v25 = *(void *)(v0 + 640);
    uint64_t v26 = *(void *)(v0 + 632);
    uint64_t v27 = *(void *)(v0 + 624);
    uint64_t v28 = *(void *)(v0 + 608);
    uint64_t v166 = *(void *)(v0 + 584);
    uint64_t v168 = *(void *)(v0 + 576);
    context = *(void **)(v0 + 568);
    uint64_t v175 = *(void *)(v0 + 560);
    uint64_t v179 = *(void *)(v0 + 552);
    uint64_t v183 = *(void *)(v0 + 528);
    v186._uint64_t countAndFlagsBits = *(void *)(v0 + 520);
    swift_task_dealloc(*(void *)(v0 + 688));
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v166);
    swift_task_dealloc(v168);
    swift_task_dealloc(context);
    swift_task_dealloc(v175);
    swift_task_dealloc(v179);
    swift_task_dealloc(v183);
    swift_task_dealloc(v186._countAndFlagsBits);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v2 = v0 + 152;
  uint64_t v3 = *(void *)(v0 + 696);
  uint64_t v4 = swift_allocBox(*(void *)(v0 + 592));
  uint64_t v188 = v5;
  uint64_t v182 = v4;
  uint64_t v185 = v1;
  *(void *)(v0 + 800) = v4;
  uint64_t v6 = *(void *)(v0 + 768);
  if (v3 == 1)
  {
    uint64_t v7 = *(void *)(v0 + 608);
    uint64_t v8 = *(void *)(v0 + 600);
    uint64_t v9 = *(void *)(v0 + 592);
    swift_retain(v1);
    SessionBuilder.init(shouldInclude:)(0LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v188, v7, v9);
    v10._uint64_t countAndFlagsBits = 0xD000000000000017LL;
    v10._object = (void *)0x8000000100011DB0LL;
    v11._object = (void *)0x8000000100011D10LL;
    v11._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v12._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v12._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v10, v11, v12);
  }

  else
  {
    uint64_t v30 = *(void *)(v0 + 696);
    uint64_t v31 = *(void *)(v0 + 680);
    uint64_t v32 = *(void *)(v0 + 608);
    uint64_t v33 = *(void *)(v0 + 600);
    uint64_t v34 = *(void *)(v0 + 592);
    uint64_t v35 = swift_allocObject(&unk_1000151C8, 24LL, 7LL);
    *(void *)(v35 + 16) = v30;
    sub_100003E58(v30);
    sub_100003E58(v30);
    swift_retain(v1);
    SessionBuilder.init(shouldInclude:)(sub_10000E044, v35);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v188, v32, v34);
    sub_100003E68(v6, v31);
    _StringGuts.grow(_:)(22LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v193._uint64_t countAndFlagsBits = 0xD000000000000014LL;
    v193._object = (void *)0x8000000100011F00LL;
    *(void *)(v0 + 496) = v30;
    v36._uint64_t countAndFlagsBits = String.init<A>(describing:)(v0 + 496, &type metadata for ExtensionSampling);
    object = v36._object;
    String.append(_:)(v36);
    swift_bridgeObjectRelease(object);
    v38._object = (void *)0x8000000100011D10LL;
    v38._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v39._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v39._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v193, v38, v39);
    swift_bridgeObjectRelease(v193._object);
    uint64_t v40 = v31;
    uint64_t v2 = v0 + 152;
    sub_100003EAC(v40);
  }

  uint64_t v41 = *(void *)(v0 + 760);
  uint64_t v42 = *(void *)(v0 + 728);
  uint64_t v43 = *(void *)(v0 + 608);
  uint64_t v44 = *(void *)(v0 + 600);
  uint64_t v176 = *(void *)(v0 + 592);
  contexta = objc_autoreleasePoolPush();
  swift_beginAccess(v42 + 16, v2, 0LL, 0LL);
  uint64_t v46 = *(void *)(v42 + 16);
  unint64_t v45 = *(void *)(v42 + 24);
  uint64_t v47 = swift_allocObject(&unk_100015178, 32LL, 7LL);
  *(void *)(v47 + 16) = v41;
  *(void *)(v47 + 24) = v182;
  uint64_t v48 = swift_allocObject(&unk_1000151A0, 32LL, 7LL);
  *(void *)(v48 + 16) = v42;
  *(void *)(v48 + 24) = v182;
  swift_retain_n(v182, 2LL);
  sub_10000D180(v46, v45);
  swift_retain(v41);
  swift_retain(v42);
  dispatch thunk of MessageStoreReader.fetch(sinceBookmark:receiveMessage:completion:)( v46,  v45,  sub_10000D140,  v47,  sub_10000D178,  v48);
  swift_release(v48);
  swift_release(v47);
  sub_10000D1D8(v46, v45);
  objc_autoreleasePoolPop(contexta);
  swift_beginAccess(v188, v0 + 176, 0LL, 0LL);
  double v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
  uint64_t v50 = v49(v43, v188, v176);
  uint64_t v51 = SessionBuilder.count.getter(v50);
  id v52 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v52(v43, v176);
  uint64_t v53 = *(void *)(v0 + 760);
  if (!v51)
  {
    uint64_t v82 = *(void *)(v0 + 728);
    uint64_t v83 = *(void *)(v0 + 720);
    v84._uint64_t countAndFlagsBits = 0xD000000000000011LL;
    Swift::String v189 = *(Swift::String *)(v0 + 704);
    v84._object = (void *)0x8000000100011EE0LL;
    v85._object = (void *)0x8000000100011D10LL;
    v85._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v86._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v86._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v84, v85, v86);
    v194 = &type metadata for SessionBuilderError;
    unint64_t v195 = sub_10000DFDC();
    LOBYTE(v193._countAndFlagsBits) = 3;
    id v87 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v167 = MLHostResult.init(error:policy:)(&v193, 1LL);
    swift_release_n(v185, 2LL);
    swift_release(v182);
    Swift::String v193 = v189;
    swift_beginAccess(v53 + 16, v0 + 224, 0LL, 0LL);
    uint64_t v88 = *(unsigned int *)(v53 + 16);
    uint64_t v89 = *(void *)(v53 + 24);
    swift_bridgeObjectRetain(v89);
    sub_10000B6D8(v88, v89);
    swift_bridgeObjectRelease(v89);
    swift_release(v53);
    swift_release(v82);
    uint64_t v90 = v83;
LABEL_26:
    swift_release(v90);
    uint64_t v138 = *(void *)(v0 + 680);
    uint64_t v139 = *(void *)(v0 + 672);
    uint64_t v140 = *(void *)(v0 + 664);
    uint64_t v141 = *(void *)(v0 + 656);
    uint64_t v142 = *(void *)(v0 + 648);
    uint64_t v143 = *(void *)(v0 + 640);
    uint64_t v144 = *(void *)(v0 + 632);
    uint64_t v145 = *(void *)(v0 + 624);
    uint64_t v146 = *(void *)(v0 + 608);
    uint64_t v170 = *(void *)(v0 + 584);
    contextc = *(void **)(v0 + 576);
    uint64_t v178 = *(void *)(v0 + 568);
    uint64_t v181 = *(void *)(v0 + 560);
    uint64_t v184 = *(void *)(v0 + 552);
    uint64_t v187 = *(void *)(v0 + 528);
    uint64_t v191 = *(void *)(v0 + 520);
    swift_task_dealloc(*(void *)(v0 + 688));
    swift_task_dealloc(v138);
    swift_task_dealloc(v139);
    swift_task_dealloc(v140);
    swift_task_dealloc(v141);
    swift_task_dealloc(v142);
    swift_task_dealloc(v143);
    swift_task_dealloc(v144);
    swift_task_dealloc(v145);
    swift_task_dealloc(v146);
    swift_task_dealloc(v170);
    swift_task_dealloc(contextc);
    swift_task_dealloc(v178);
    swift_task_dealloc(v181);
    swift_task_dealloc(v184);
    swift_task_dealloc(v187);
    swift_task_dealloc(v191);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v167);
  }

  v180 = v49;
  uint64_t v54 = swift_beginAccess(v188, v0 + 200, 33LL, 0LL);
  uint64_t v55 = SessionBuilder.buildAllWithStatistics()(v54);
  swift_endAccess(v0 + 200);
  int64_t v56 = sub_10000BF1C(v55);
  uint64_t v57 = sub_10000C598((uint64_t)v56);
  swift_bridgeObjectRelease(v56);
  swift_beginAccess(v53 + 16, v0 + 272, 1LL, 0LL);
  uint64_t v58 = *(void *)(v53 + 24);
  *(void *)(v53 + 24) = v57;
  swift_bridgeObjectRelease(v58);
  *(void *)(v0 + 456) = 0LL;
  v59 = (uint64_t *)(v0 + 456);
  uint64_t v60 = sub_10000C9C4(v55, (void *)(v0 + 456));
  *(void *)(v0 + 808) = v60;
  swift_bridgeObjectRelease(v55);
  uint64_t v61 = *(void *)(v0 + 768);
  if (!*(void *)(v60 + 16))
  {
    uint64_t v169 = *(void *)(v0 + 760);
    contextb = *(void **)(v0 + 728);
    uint64_t v177 = *(void *)(v0 + 720);
    uint64_t v91 = *(void *)(v0 + 672);
    uint64_t v92 = *(void *)(v0 + 608);
    uint64_t v93 = *(void *)(v0 + 592);
    Swift::String v165 = *(Swift::String *)(v0 + 704);
    swift_bridgeObjectRelease(v60);
    sub_100003E68(v61, v91);
    v193._uint64_t countAndFlagsBits = 0LL;
    v193._object = (void *)0xE000000000000000LL;
    _StringGuts.grow(_:)(79LL);
    v94._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
    v94._object = (void *)0x8000000100011E90LL;
    String.append(_:)(v94);
    uint64_t v95 = v180(v92, v188, v93);
    uint64_t v96 = SessionBuilder.count.getter(v95);
    v52(v92, v93);
    *(void *)(v0 + 472) = v96;
    v97._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    v98 = v97._object;
    String.append(_:)(v97);
    swift_bridgeObjectRelease(v98);
    v99._uint64_t countAndFlagsBits = 0xD00000000000002ELL;
    v99._object = (void *)0x8000000100011EB0LL;
    String.append(_:)(v99);
    uint64_t v100 = v180(v92, v188, v93);
    uint64_t v101 = SessionBuilder.notSampled.getter(v100);
    v52(v92, v93);
    *(void *)(v0 + 480) = v101;
    v102._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    v103 = v102._object;
    String.append(_:)(v102);
    swift_bridgeObjectRelease(v103);
    v104._object = (void *)0x8000000100011D10LL;
    v104._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v105._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v105._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v193, v104, v105);
    swift_bridgeObjectRelease(v193._object);
    sub_100003EAC(v91);
    v194 = &type metadata for SessionBuilderError;
    unint64_t v195 = sub_10000DFDC();
    LOBYTE(v193._countAndFlagsBits) = 4;
    id v106 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v167 = MLHostResult.init(error:policy:)(&v193, 1LL);
    swift_release_n(v185, 2LL);
    swift_release(v182);
    Swift::String v193 = v165;
    uint64_t v107 = *(unsigned int *)(v169 + 16);
    uint64_t v108 = *(void *)(v169 + 24);
    swift_bridgeObjectRetain(v108);
    sub_10000B6D8(v107, v108);
    swift_bridgeObjectRelease(v108);
    swift_release(v169);
    swift_release(contextb);
    uint64_t v90 = v177;
    goto LABEL_26;
  }

  uint64_t v62 = *(void *)(v0 + 664);
  sub_100003E68(*(void *)(v0 + 768), v62);
  _StringGuts.grow(_:)(29LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  v193._uint64_t countAndFlagsBits = 0x6974736973726550LL;
  v193._object = (void *)0xEB0000000020676ELL;
  *(void *)(v0 + 448) = *(void *)(v60 + 16);
  v63._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  v64 = v63._object;
  String.append(_:)(v63);
  swift_bridgeObjectRelease(v64);
  v65._uint64_t countAndFlagsBits = 0xD000000000000010LL;
  v65._object = (void *)0x8000000100011DD0LL;
  String.append(_:)(v65);
  v66._object = (void *)0x8000000100011D10LL;
  v66._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
  v67._uint64_t countAndFlagsBits = 0x286567616B636170LL;
  v67._object = (void *)0xEE00293A68746977LL;
  InternalLogger.info(_:fromFile:fromFunction:)(v193, v66, v67);
  swift_bridgeObjectRelease(v193._object);
  sub_100003EAC(v62);
  char v68 = *(_BYTE *)(v60 + 32);
  *(_BYTE *)(v0 + 944) = v68;
  uint64_t v69 = -1LL;
  uint64_t v70 = -1LL << v68;
  uint64_t v71 = *(void *)(v60 + 64);
  if (-v70 < 64) {
    uint64_t v69 = ~(-1LL << -(char)v70);
  }
  *(_DWORD *)(v0 + 936) = enum case for OffDeviceTopic.orderedJoined(_:);
  *(_DWORD *)(v0 + 940) = enum case for OffDeviceTopic.telemetry(_:);
  *(void *)(v0 + 816) = 0LL;
  unint64_t v72 = v69 & v71;
  if (v72)
  {
    uint64_t v73 = 0LL;
    unint64_t v74 = __clz(__rbit64(v72));
    uint64_t v75 = (v72 - 1) & v72;
    v76 = *(void **)(v0 + 808);
LABEL_12:
    uint64_t v77 = *(void *)(v0 + 576);
    (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 544) + 16LL))( v77,  v76[6] + *(void *)(*(void *)(v0 + 544) + 72LL) * v74,  *(void *)(v0 + 536));
    uint64_t v78 = v76[7];
    uint64_t v79 = sub_100003C00(&qword_1000184A0);
    v80 = *(void **)(v78 + 8 * v74);
    *(void *)(v77 + *(int *)(v79 + 48)) = v80;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56LL))(v77, 0LL, 1LL, v79);
    id v81 = v80;
    goto LABEL_21;
  }

  unint64_t v109 = 63 - v70;
  if ((unint64_t)(63 - v70) <= 0x7F)
  {
    uint64_t v73 = 0LL;
  }

  else
  {
    v76 = *(void **)(v0 + 808);
    unint64_t v110 = v76[9];
    if (v110)
    {
      uint64_t v73 = 1LL;
LABEL_18:
      uint64_t v75 = (v110 - 1) & v110;
      unint64_t v74 = __clz(__rbit64(v110)) + (v73 << 6);
      goto LABEL_12;
    }

    if (v109 < 0xC0)
    {
      uint64_t v73 = 1LL;
    }

    else
    {
      unint64_t v110 = v76[10];
      if (v110)
      {
        uint64_t v73 = 2LL;
        goto LABEL_18;
      }

      if (v109 < 0x100)
      {
        uint64_t v73 = 2LL;
      }

      else
      {
        unint64_t v110 = v76[11];
        if (v110)
        {
          uint64_t v73 = 3LL;
          goto LABEL_18;
        }

        if (v109 < 0x140)
        {
          uint64_t v73 = 3LL;
        }

        else
        {
          unint64_t v110 = v76[12];
          if (v110)
          {
            uint64_t v73 = 4LL;
            goto LABEL_18;
          }

          uint64_t v161 = 0LL;
          uint64_t v162 = v109 >> 6;
          uint64_t v163 = 5LL;
          if (v162 > 5) {
            uint64_t v163 = v162;
          }
          uint64_t v164 = v163 - 5;
          while (v164 != v161)
          {
            unint64_t v110 = v76[v161++ + 13];
            if (v110)
            {
              uint64_t v73 = v161 + 4;
              goto LABEL_18;
            }
          }

          uint64_t v73 = v162 - 1;
        }
      }
    }
  }

  uint64_t v111 = *(void *)(v0 + 576);
  uint64_t v112 = sub_100003C00(&qword_1000184A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v112 - 8) + 56LL))(v111, 1LL, 1LL, v112);
  uint64_t v75 = 0LL;
LABEL_21:
  *(void *)(v0 + 832) = v75;
  *(void *)(v0 + 824) = v73;
  uint64_t v113 = *(void *)(v0 + 584);
  sub_10000ED58(*(void *)(v0 + 576), v113, &qword_100018490);
  uint64_t v114 = sub_100003C00(&qword_1000184A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 48LL))(v113, 1LL, v114) == 1)
  {
    uint64_t v115 = *(void *)(v0 + 768);
    uint64_t v116 = *(void *)(v0 + 728);
    uint64_t v117 = *(void *)(v0 + 648);
    swift_release(*(void *)(v0 + 808));
    sub_100003E68(v115, v117);
    _StringGuts.grow(_:)(24LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v193._uint64_t countAndFlagsBits = 0xD000000000000016LL;
    v193._object = (void *)0x8000000100011DF0LL;
    *(void *)(v0 + 440) = 0LL;
    v118._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    v119 = v118._object;
    String.append(_:)(v118);
    swift_bridgeObjectRelease(v119);
    v120._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v120._object = (void *)0x8000000100011D10LL;
    v121._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v121._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v193, v120, v121);
    swift_bridgeObjectRelease(v193._object);
    sub_100003EAC(v117);
    unint64_t v122 = *(void *)(v116 + 24);
    *(void *)(v0 + 912) = v122;
    if (v122 >> 60 == 15)
    {
      uint64_t v123 = *v59;
      if (*v59 >= 1)
      {
        uint64_t v124 = *(void *)(v0 + 640);
        sub_100003E68(*(void *)(v0 + 768), v124);
        _StringGuts.grow(_:)(49LL);
        swift_bridgeObjectRelease(0xE000000000000000LL);
        v193._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
        v193._object = (void *)0x8000000100011E10LL;
        *(void *)(v0 + 432) = v123;
        v125._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
        v126 = v125._object;
        String.append(_:)(v125);
        swift_bridgeObjectRelease(v126);
        v127._object = (void *)0x8000000100011D10LL;
        v127._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
        v128._uint64_t countAndFlagsBits = 0x286567616B636170LL;
        v128._object = (void *)0xEE00293A68746977LL;
        InternalLogger.fault(_:fromFile:fromFunction:)(v193, v127, v128);
        swift_bridgeObjectRelease(v193._object);
        sub_100003EAC(v124);
      }

      uint64_t v129 = *(void *)(v0 + 800);
      uint64_t v130 = *(void *)(v0 + 784);
      uint64_t v131 = *(void *)(v0 + 760);
      uint64_t v132 = *(void *)(v0 + 728);
      uint64_t v133 = *(void *)(v0 + 720);
      v134 = (objc_class *)type metadata accessor for MLHostResult(0LL);
      Swift::String v190 = *(Swift::String *)(v0 + 704);
      id v135 = objc_allocWithZone(v134);
      uint64_t v167 = MLHostResult.init(status:policy:)(2LL, 1LL);
      swift_release_n(v130, 2LL);
      swift_release(v129);
      Swift::String v193 = v190;
      uint64_t v136 = *(unsigned int *)(v131 + 16);
      uint64_t v137 = *(void *)(v131 + 24);
      swift_bridgeObjectRetain(v137);
      sub_10000B6D8(v136, v137);
      swift_bridgeObjectRelease(v137);
      swift_release(v131);
      swift_release(v132);
      uint64_t v90 = v133;
      goto LABEL_26;
    }

    uint64_t v156 = *(void *)(*(void *)(v0 + 728) + 16LL);
    *(void *)(v0 + 920) = v156;
    sub_10000D180(v156, v122);
    v157._object = (void *)0x8000000100011E40LL;
    v157._uint64_t countAndFlagsBits = 0xD000000000000016LL;
    v158._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v158._object = (void *)0x8000000100011D10LL;
    v159._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v159._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v157, v158, v159);
    *(void *)(v0 + 928) = v160;
    void *v160 = v0;
    v160[1] = sub_100009A60;
    return v192(v156, v122);
  }

  else
  {
    uint64_t v147 = *(unsigned int *)(v0 + 936);
    uint64_t v148 = *(void *)(v0 + 568);
    uint64_t v149 = *(void *)(v0 + 544);
    uint64_t v150 = *(void *)(v0 + 528);
    uint64_t v151 = *(void *)(v0 + 504);
    uint64_t v152 = *(void *)(v0 + 512);
    uint64_t v153 = *(void *)(*(void *)(v0 + 584) + *(int *)(v114 + 48));
    *(void *)(v0 + 840) = v153;
    (*(void (**)(uint64_t))(v149 + 32))(v148);
    v154 = *(void (**)(uint64_t, uint64_t, uint64_t))(v152 + 104);
    *(void *)(v0 + 848) = v154;
    v154(v150, v147, v151);
    v155 = (void *)swift_task_alloc(dword_1000183B4);
    *(void *)(v0 + 856) = v155;
    void *v155 = v0;
    v155[1] = sub_100008FC8;
    return sub_1000055F8(v153, *(void *)(v0 + 528), *(void *)(v0 + 704), *(void *)(v0 + 712));
  }

uint64_t sub_100008FC8()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 856LL);
  *(void *)(*(void *)v1 + 864LL) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = v2[66];
  uint64_t v5 = v2[63];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2[64] + 8LL);
  if (v0)
  {
    v6(v4, v5);
    uint64_t v7 = sub_10000A018;
  }

  else
  {
    v2[109] = v6;
    v6(v4, v5);
    uint64_t v7 = sub_100009044;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

void sub_100009044()
{
  uint64_t v1 = *(void *)(v0 + 816);
  *(void *)(v0 + 880) = v1 + 1;
  if (__OFADD__(v1, 1LL))
  {
    __break(1u);
    goto LABEL_43;
  }

  uint64_t v111 = v0 + 248;
  uint64_t v2 = *(void *)(v0 + 760) + 16LL;
  (*(void (**)(void, void, void))(*(void *)(v0 + 544) + 16LL))( *(void *)(v0 + 560),  *(void *)(v0 + 568),  *(void *)(v0 + 536));
  swift_beginAccess(v2, v0 + 320, 33LL, 0LL);
  uint64_t v4 = sub_10000CEEC((void *)(v0 + 48));
  if (*(void *)(v3 + 24) != 1LL) {
    *(_BYTE *)(v3 + 17) = 1;
  }
  ((void (*)(uint64_t, void))v4)(v0 + 48, 0LL);
  uint64_t v5 = *(void *)(v0 + 768);
  uint64_t v6 = *(void *)(v0 + 760);
  uint64_t v7 = *(void *)(v0 + 656);
  uint64_t v8 = *(void *)(v0 + 560);
  uint64_t v9 = *(void *)(v0 + 544);
  uint64_t v10 = *(void *)(v0 + 536);
  swift_endAccess(v0 + 320);
  Swift::String v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  *(void *)(v0 + 888) = v11;
  v11(v8, v10);
  sub_100003E68(v5, v7);
  *(void *)(v0 + 392) = 0LL;
  *(void *)(v0 + 400) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(38LL);
  swift_bridgeObjectRelease(*(void *)(v0 + 400));
  *(void *)(v0 + 376) = 0xD000000000000024LL;
  *(void *)(v0 + 384) = 0x8000000100011E60LL;
  uint64_t v12 = sub_10000ECC0(&qword_1000184A8, (uint64_t)&protocol conformance descriptor for UUID);
  v13._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v10, v12);
  object = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(object);
  v15._uint64_t countAndFlagsBits = *(void *)(v0 + 376);
  unint64_t v16 = *(void **)(v0 + 384);
  v17._object = (void *)0x8000000100011D10LL;
  v15._object = v16;
  v17._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
  v18._uint64_t countAndFlagsBits = 0x286567616B636170LL;
  v18._object = (void *)0xEE00293A68746977LL;
  InternalLogger.debug(_:fromFile:fromFunction:)(v15, v17, v18);
  swift_bridgeObjectRelease(v16);
  sub_100003EAC(v7);
  swift_beginAccess(v6 + 16, v111, 32LL, 0LL);
  uint64_t v19 = *(void *)(v6 + 24);
  if (*(void *)(v19 + 16) && (unint64_t v20 = sub_10000DE4C(*(void *)(v0 + 568)), (v21 & 1) != 0))
  {
    uint64_t v22 = *(void *)(v0 + 568);
    uint64_t v23 = *(void *)(v19 + 56) + 32 * v20;
    uint64_t v24 = *(void *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    __int16 v26 = *(unsigned __int8 *)(v23 + 16);
    int v27 = *(unsigned __int8 *)(v23 + 17);
    uint64_t v28 = *(void **)(v23 + 24);
    swift_endAccess(v111);
    id v29 = v28;
    if (v27) {
      __int16 v30 = 256;
    }
    else {
      __int16 v30 = 0;
    }
    id v31 = sub_100004DD0(v22, v24, v25, v30 | v26, v28);

    id v32 = [v31 wrapAsAnyEvent];
    *(void *)(v0 + 896) = v32;

    if (v32)
    {
      (*(void (**)(void, void, void))(v0 + 848))( *(void *)(v0 + 520),  *(unsigned int *)(v0 + 940),  *(void *)(v0 + 504));
      uint64_t v33 = (void *)swift_task_alloc(dword_1000183B4);
      *(void *)(v0 + 904) = v33;
      void *v33 = v0;
      v33[1] = sub_1000099CC;
      uint64_t v34 = *(void *)(v0 + 712);
      uint64_t v35 = *(void *)(v0 + 704);
      uint64_t v36 = *(void *)(v0 + 520);
LABEL_40:
      sub_1000055F8((uint64_t)v32, v36, v35, v34);
      return;
    }

    id v37 = *(void **)(v0 + 840);
  }

  else
  {
    id v37 = *(void **)(v0 + 840);
    swift_endAccess(v111);
  }

  (*(void (**)(void, void))(v0 + 888))(*(void *)(v0 + 568), *(void *)(v0 + 536));
  uint64_t v38 = *(void *)(v0 + 880);
  unint64_t v39 = *(void *)(v0 + 832);
  int64_t v40 = *(void *)(v0 + 824);
  *(void *)(v0 + 816) = v38;
  if (!v39)
  {
    int64_t v49 = v40 + 1;
    if (!__OFADD__(v40, 1LL))
    {
      int64_t v50 = (unint64_t)((1LL << *(_BYTE *)(v0 + 944)) + 63) >> 6;
      if (v49 >= v50) {
        goto LABEL_33;
      }
      uint64_t v43 = *(void *)(v0 + 808);
      uint64_t v51 = v43 + 64;
      unint64_t v52 = *(void *)(v43 + 64 + 8 * v49);
      if (v52)
      {
LABEL_18:
        uint64_t v41 = (v52 - 1) & v52;
        unint64_t v42 = __clz(__rbit64(v52)) + (v49 << 6);
        int64_t v40 = v49;
        goto LABEL_14;
      }

      int64_t v53 = v40 + 2;
      ++v40;
      if (v49 + 1 >= v50) {
        goto LABEL_33;
      }
      unint64_t v52 = *(void *)(v51 + 8 * v53);
      if (v52)
      {
LABEL_22:
        int64_t v49 = v53;
        goto LABEL_18;
      }

      int64_t v40 = v49 + 1;
      if (v49 + 2 >= v50) {
        goto LABEL_33;
      }
      unint64_t v52 = *(void *)(v51 + 8 * (v49 + 2));
      if (v52)
      {
        v49 += 2LL;
        goto LABEL_18;
      }

      int64_t v53 = v49 + 3;
      int64_t v40 = v49 + 2;
      if (v49 + 3 >= v50)
      {
LABEL_33:
        uint64_t v54 = *(void *)(v0 + 576);
        uint64_t v55 = sub_100003C00(&qword_1000184A0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56LL))(v54, 1LL, 1LL, v55);
        uint64_t v41 = 0LL;
        goto LABEL_34;
      }

      unint64_t v52 = *(void *)(v51 + 8 * v53);
      if (v52) {
        goto LABEL_22;
      }
      while (1)
      {
        int64_t v49 = v53 + 1;
        if (__OFADD__(v53, 1LL)) {
          break;
        }
        if (v49 >= v50)
        {
          int64_t v40 = v50 - 1;
          goto LABEL_33;
        }

        unint64_t v52 = *(void *)(v51 + 8 * v49);
        ++v53;
        if (v52) {
          goto LABEL_18;
        }
      }

LABEL_44:
      __break(1u);
      return;
    }

  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

LABEL_43:
    __break(1u);
    goto LABEL_44;
  }

  uint64_t v41 = (v39 - 1) & v39;
  unint64_t v42 = __clz(__rbit64(v39)) | (v40 << 6);
  uint64_t v43 = *(void *)(v0 + 808);
LABEL_14:
  uint64_t v44 = *(void *)(v0 + 576);
  (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 544) + 16LL))( v44,  *(void *)(v43 + 48) + *(void *)(*(void *)(v0 + 544) + 72LL) * v42,  *(void *)(v0 + 536));
  uint64_t v45 = *(void *)(v43 + 56);
  uint64_t v46 = sub_100003C00(&qword_1000184A0);
  uint64_t v47 = *(void **)(v45 + 8 * v42);
  *(void *)(v44 + *(int *)(v46 + 48)) = v47;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56LL))(v44, 0LL, 1LL, v46);
  id v48 = v47;
LABEL_34:
  *(void *)(v0 + 832) = v41;
  *(void *)(v0 + 824) = v40;
  uint64_t v56 = *(void *)(v0 + 584);
  sub_10000ED58(*(void *)(v0 + 576), v56, &qword_100018490);
  uint64_t v57 = sub_100003C00(&qword_1000184A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 48LL))(v56, 1LL, v57) != 1)
  {
    uint64_t v91 = *(unsigned int *)(v0 + 936);
    uint64_t v92 = *(void *)(v0 + 568);
    uint64_t v93 = *(void *)(v0 + 544);
    uint64_t v94 = *(void *)(v0 + 528);
    uint64_t v95 = *(void *)(v0 + 504);
    uint64_t v96 = *(void *)(v0 + 512);
    id v32 = *(id *)(*(void *)(v0 + 584) + *(int *)(v57 + 48));
    *(void *)(v0 + 840) = v32;
    (*(void (**)(uint64_t))(v93 + 32))(v92);
    Swift::String v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 104);
    *(void *)(v0 + 848) = v97;
    v97(v94, v91, v95);
    v98 = (void *)swift_task_alloc(dword_1000183B4);
    *(void *)(v0 + 856) = v98;
    void *v98 = v0;
    v98[1] = sub_100008FC8;
    uint64_t v34 = *(void *)(v0 + 712);
    uint64_t v35 = *(void *)(v0 + 704);
    uint64_t v36 = *(void *)(v0 + 528);
    goto LABEL_40;
  }

  uint64_t v58 = *(void *)(v0 + 768);
  uint64_t v59 = *(void *)(v0 + 728);
  uint64_t v60 = *(void *)(v0 + 648);
  swift_release(*(void *)(v0 + 808));
  sub_100003E68(v58, v60);
  _StringGuts.grow(_:)(24LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  *(void *)(v0 + 440) = v38;
  v61._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  uint64_t v62 = v61._object;
  String.append(_:)(v61);
  swift_bridgeObjectRelease(v62);
  v63._uint64_t countAndFlagsBits = 0xD000000000000016LL;
  v63._object = (void *)0x8000000100011DF0LL;
  v64._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
  v64._object = (void *)0x8000000100011D10LL;
  v65._uint64_t countAndFlagsBits = 0x286567616B636170LL;
  v65._object = (void *)0xEE00293A68746977LL;
  InternalLogger.info(_:fromFile:fromFunction:)(v63, v64, v65);
  swift_bridgeObjectRelease(0x8000000100011DF0LL);
  sub_100003EAC(v60);
  unint64_t v66 = *(void *)(v59 + 24);
  *(void *)(v0 + 912) = v66;
  if (v66 >> 60 == 15)
  {
    uint64_t v67 = *(void *)(v0 + 456);
    if (v67 >= 1)
    {
      uint64_t v68 = *(void *)(v0 + 640);
      sub_100003E68(*(void *)(v0 + 768), v68);
      _StringGuts.grow(_:)(49LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      *(void *)(v0 + 432) = v67;
      v69._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
      uint64_t v70 = v69._object;
      String.append(_:)(v69);
      swift_bridgeObjectRelease(v70);
      v71._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
      v72._object = (void *)0x8000000100011D10LL;
      v71._object = (void *)0x8000000100011E10LL;
      v72._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
      v73._uint64_t countAndFlagsBits = 0x286567616B636170LL;
      v73._object = (void *)0xEE00293A68746977LL;
      InternalLogger.fault(_:fromFile:fromFunction:)(v71, v72, v73);
      swift_bridgeObjectRelease(0x8000000100011E10LL);
      sub_100003EAC(v68);
    }

    uint64_t v74 = *(void *)(v0 + 800);
    uint64_t v75 = *(void *)(v0 + 784);
    uint64_t v76 = *(void *)(v0 + 760);
    uint64_t v77 = *(void *)(v0 + 728);
    uint64_t v78 = *(void *)(v0 + 720);
    id v79 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v112 = MLHostResult.init(status:policy:)(2LL, 1LL);
    swift_release_n(v75, 2LL);
    swift_release(v74);
    uint64_t v80 = *(unsigned int *)(v76 + 16);
    uint64_t v81 = *(void *)(v76 + 24);
    swift_bridgeObjectRetain(v81);
    sub_10000B6D8(v80, v81);
    swift_bridgeObjectRelease(v81);
    swift_release(v76);
    swift_release(v77);
    swift_release(v78);
    uint64_t v82 = *(void *)(v0 + 680);
    uint64_t v83 = *(void *)(v0 + 672);
    uint64_t v84 = *(void *)(v0 + 664);
    uint64_t v85 = *(void *)(v0 + 656);
    uint64_t v86 = *(void *)(v0 + 648);
    uint64_t v87 = *(void *)(v0 + 640);
    uint64_t v88 = *(void *)(v0 + 632);
    uint64_t v89 = *(void *)(v0 + 624);
    uint64_t v90 = *(void *)(v0 + 608);
    uint64_t v104 = *(void *)(v0 + 584);
    uint64_t v105 = *(void *)(v0 + 576);
    uint64_t v106 = *(void *)(v0 + 568);
    uint64_t v107 = *(void *)(v0 + 560);
    uint64_t v108 = *(void *)(v0 + 552);
    uint64_t v109 = *(void *)(v0 + 528);
    uint64_t v110 = *(void *)(v0 + 520);
    swift_task_dealloc(*(void *)(v0 + 688));
    swift_task_dealloc(v82);
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    swift_task_dealloc(v89);
    swift_task_dealloc(v90);
    swift_task_dealloc(v104);
    swift_task_dealloc(v105);
    swift_task_dealloc(v106);
    swift_task_dealloc(v107);
    swift_task_dealloc(v108);
    swift_task_dealloc(v109);
    swift_task_dealloc(v110);
    (*(void (**)(uint64_t))(v0 + 8))(v112);
  }

  else
  {
    uint64_t v99 = *(void *)(*(void *)(v0 + 728) + 16LL);
    *(void *)(v0 + 920) = v99;
    sub_10000D180(v99, v66);
    v100._object = (void *)0x8000000100011E40LL;
    v100._uint64_t countAndFlagsBits = 0xD000000000000016LL;
    v101._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v101._object = (void *)0x8000000100011D10LL;
    v102._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v102._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v100, v101, v102);
    *(void *)(v0 + 928) = v103;
    void *v103 = v0;
    v103[1] = sub_100009A60;
    v113(v99, v66);
  }

      sub_10000ED50(v68);
      return (uint64_t)v72;
    }

    break;
  }

uint64_t sub_1000099CC()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 904LL));
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[109];
  uint64_t v4 = v2[65];
  uint64_t v5 = v2[63];
  if (v0)
  {
    swift_errorRelease(v0);
    v3(v4, v5);
    uint64_t v6 = sub_10000A52C;
  }

  else
  {
    v3(v4, v5);
    uint64_t v6 = sub_10000F350;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_100009A60()
{
  return swift_task_switch(sub_100009AB4, 0LL, 0LL);
}

uint64_t sub_100009AB4()
{
  uint64_t v1 = *(void *)(v0 + 456);
  if (v1 >= 1)
  {
    uint64_t v2 = *(void *)(v0 + 640);
    sub_100003E68(*(void *)(v0 + 768), v2);
    _StringGuts.grow(_:)(49LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    *(void *)(v0 + 432) = v1;
    v3._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v3._object;
    String.append(_:)(v3);
    swift_bridgeObjectRelease(object);
    v5._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
    v6._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v6._object = (void *)0x8000000100011D10LL;
    v5._object = (void *)0x8000000100011E10LL;
    v7._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v7._object = (void *)0xEE00293A68746977LL;
    InternalLogger.fault(_:fromFile:fromFunction:)(v5, v6, v7);
    swift_bridgeObjectRelease(0x8000000100011E10LL);
    sub_100003EAC(v2);
  }

  uint64_t v8 = *(void *)(v0 + 800);
  uint64_t v9 = *(void *)(v0 + 784);
  uint64_t v10 = *(void *)(v0 + 760);
  uint64_t v11 = *(void *)(v0 + 728);
  uint64_t v12 = *(void *)(v0 + 720);
  id v13 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v33 = MLHostResult.init(status:policy:)(2LL, 1LL);
  swift_release_n(v9, 2LL);
  swift_release(v8);
  uint64_t v14 = *(unsigned int *)(v10 + 16);
  uint64_t v15 = *(void *)(v10 + 24);
  swift_bridgeObjectRetain(v15);
  sub_10000B6D8(v14, v15);
  swift_bridgeObjectRelease(v15);
  swift_release(v10);
  swift_release(v11);
  swift_release(v12);
  uint64_t v16 = *(void *)(v0 + 680);
  uint64_t v17 = *(void *)(v0 + 672);
  uint64_t v18 = *(void *)(v0 + 664);
  uint64_t v19 = *(void *)(v0 + 656);
  uint64_t v20 = *(void *)(v0 + 648);
  uint64_t v21 = *(void *)(v0 + 640);
  uint64_t v22 = *(void *)(v0 + 632);
  uint64_t v23 = *(void *)(v0 + 624);
  uint64_t v24 = *(void *)(v0 + 608);
  uint64_t v26 = *(void *)(v0 + 584);
  uint64_t v27 = *(void *)(v0 + 576);
  uint64_t v28 = *(void *)(v0 + 568);
  uint64_t v29 = *(void *)(v0 + 560);
  uint64_t v30 = *(void *)(v0 + 552);
  uint64_t v31 = *(void *)(v0 + 528);
  uint64_t v32 = *(void *)(v0 + 520);
  swift_task_dealloc(*(void *)(v0 + 688));
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v33);
}

uint64_t sub_100009D5C()
{
  uint64_t v1 = *(void *)(v0 + 792);
  uint64_t v2 = *(void *)(v0 + 760);
  uint64_t v29 = *(void *)(v0 + 728);
  uint64_t v31 = *(void *)(v0 + 720);
  uint64_t v3 = *(void *)(v0 + 632);
  sub_100003E68(*(void *)(v0 + 768), v3);
  _StringGuts.grow(_:)(39LL);
  *(void *)(v0 + 344) = 0LL;
  *(void *)(v0 + 352) = 0xE000000000000000LL;
  v4._object = (void *)0x8000000100011D80LL;
  v4._uint64_t countAndFlagsBits = 0xD000000000000025LL;
  String.append(_:)(v4);
  *(void *)(v0 + 464) = v1;
  uint64_t v5 = sub_100003C00(&qword_100018300);
  _print_unlocked<A, B>(_:_:)( v0 + 464,  v0 + 344,  v5,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v6._uint64_t countAndFlagsBits = *(void *)(v0 + 344);
  Swift::String v7 = *(void **)(v0 + 352);
  v8._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
  v8._object = (void *)0x8000000100011D10LL;
  v6._object = v7;
  v9._uint64_t countAndFlagsBits = 0x286567616B636170LL;
  v9._object = (void *)0xEE00293A68746977LL;
  InternalLogger.error(_:fromFile:fromFunction:)(v6, v8, v9);
  swift_bridgeObjectRelease(v7);
  sub_100003EAC(v3);
  unint64_t v10 = sub_10000D0F8();
  swift_allocError(&type metadata for SessionBuilderError, v10, 0LL, 0LL);
  *uint64_t v11 = 0;
  swift_willThrow();
  swift_errorRelease(v1);
  swift_beginAccess(v2 + 16, v0 + 104, 0LL, 0LL);
  uint64_t v12 = *(unsigned int *)(v2 + 16);
  uint64_t v13 = *(void *)(v2 + 24);
  swift_bridgeObjectRetain(v13);
  sub_10000B6D8(v12, v13);
  swift_bridgeObjectRelease(v13);
  swift_release(v2);
  swift_release(v29);
  swift_release(v31);
  uint64_t v14 = *(void *)(v0 + 680);
  uint64_t v15 = *(void *)(v0 + 672);
  uint64_t v16 = *(void *)(v0 + 664);
  uint64_t v17 = *(void *)(v0 + 656);
  uint64_t v18 = *(void *)(v0 + 648);
  uint64_t v19 = *(void *)(v0 + 640);
  uint64_t v20 = *(void *)(v0 + 632);
  uint64_t v21 = *(void *)(v0 + 624);
  uint64_t v22 = *(void *)(v0 + 608);
  uint64_t v24 = *(void *)(v0 + 584);
  uint64_t v25 = *(void *)(v0 + 576);
  uint64_t v26 = *(void *)(v0 + 568);
  uint64_t v27 = *(void *)(v0 + 560);
  uint64_t v28 = *(void *)(v0 + 552);
  uint64_t v30 = *(void *)(v0 + 528);
  uint64_t v32 = *(void *)(v0 + 520);
  swift_task_dealloc(*(void *)(v0 + 688));
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v30);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A018()
{
  uint64_t v1 = *(void *)(v0 + 864);
  *(void *)(v0 + 424) = v1;
  swift_errorRetain(v1);
  uint64_t v2 = sub_100003C00(&qword_100018300);
  type metadata accessor for FLError(0LL);
  uint64_t v4 = v3;
  if (swift_dynamicCast(v0 + 408, v0 + 424, v2, v3, 0LL))
  {
    uint64_t v5 = *(void *)(v0 + 568);
    uint64_t v6 = *(void *)(v0 + 552);
    uint64_t v7 = *(void *)(v0 + 544);
    uint64_t v8 = *(void *)(v0 + 536);
    uint64_t v9 = *(void *)(v0 + 760) + 16LL;
    swift_errorRelease(*(void *)(v0 + 864));
    uint64_t v68 = *(void **)(v0 + 408);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8);
    swift_beginAccess(v9, v0 + 296, 33LL, 0LL);
    uint64_t v11 = sub_10000CEEC((void *)(v0 + 16));
    uint64_t v12 = *(void **)(v10 + 24);
    if (v12 != (void *)1)
    {
      *(void *)(v10 + 24) = v68;
      id v13 = v68;
    }

    ((void (*)(uint64_t, void))v11)(v0 + 16, 0LL);
    uint64_t v60 = *(void *)(v0 + 808);
    uint64_t v62 = *(void *)(v0 + 800);
    uint64_t v56 = *(void *)(v0 + 784);
    uint64_t v57 = *(void **)(v0 + 840);
    uint64_t v14 = *(void *)(v0 + 768);
    uint64_t v15 = *(void *)(v0 + 760);
    uint64_t v64 = *(void *)(v0 + 728);
    uint64_t v66 = *(void *)(v0 + 720);
    uint64_t v16 = *(void *)(v0 + 624);
    uint64_t v17 = *(void *)(v0 + 568);
    uint64_t v18 = *(void *)(v0 + 552);
    uint64_t v19 = *(void *)(v0 + 544);
    uint64_t v20 = *(void *)(v0 + 536);
    swift_endAccess(v0 + 296);
    uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v55(v18, v20);
    sub_100003E68(v14, v16);
    _StringGuts.grow(_:)(48LL);
    *(void *)(v0 + 360) = 0LL;
    *(void *)(v0 + 368) = 0xE000000000000000LL;
    v21._object = (void *)0x8000000100011C60LL;
    v21._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    String.append(_:)(v21);
    *(void *)(v0 + 416) = v68;
    _print_unlocked<A, B>(_:_:)( v0 + 416,  v0 + 360,  v4,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v22._uint64_t countAndFlagsBits = 0x6F6973736573202CLL;
    v22._object = (void *)0xED00003D64695F6ELL;
    String.append(_:)(v22);
    uint64_t v23 = sub_10000ECC0(&qword_1000184A8, (uint64_t)&protocol conformance descriptor for UUID);
    v24._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v20, v23);
    object = v24._object;
    String.append(_:)(v24);
    swift_bridgeObjectRelease(object);
    v26._uint64_t countAndFlagsBits = *(void *)(v0 + 360);
    uint64_t v27 = *(void **)(v0 + 368);
    v28._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v28._object = (void *)0x8000000100011D10LL;
    v26._object = v27;
    v29._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v29._object = (void *)0xEE00293A68746977LL;
    InternalLogger.error(_:fromFile:fromFunction:)(v26, v28, v29);
    swift_bridgeObjectRelease(v27);
    sub_100003EAC(v16);
    unint64_t v30 = sub_10000D0F8();
    swift_allocError(&type metadata for SessionBuilderError, v30, 0LL, 0LL);
    *uint64_t v31 = 1;
    swift_willThrow();
    swift_release_n(v56, 2LL);

    v55(v17, v20);
    swift_release(v60);
    swift_errorRelease(*(void *)(v0 + 424));
    swift_release(v62);
    uint64_t v32 = *(unsigned int *)(v15 + 16);
    uint64_t v33 = *(void *)(v15 + 24);
    swift_bridgeObjectRetain(v33);
    sub_10000B6D8(v32, v33);
    swift_bridgeObjectRelease(v33);
    swift_release(v15);
    swift_release(v64);
    swift_release(v66);
  }

  else
  {
    uint64_t v34 = *(void *)(v0 + 808);
    uint64_t v35 = *(void *)(v0 + 800);
    uint64_t v36 = *(void *)(v0 + 784);
    uint64_t v37 = *(void *)(v0 + 760);
    uint64_t v38 = *(void *)(v0 + 728);
    uint64_t v39 = *(void *)(v0 + 720);
    uint64_t v40 = *(void *)(v0 + 568);
    uint64_t v41 = *(void *)(v0 + 544);
    uint64_t v42 = *(void *)(v0 + 536);

    swift_release_n(v36, 2LL);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
    swift_release(v34);
    swift_errorRelease(*(void *)(v0 + 424));
    swift_release(v35);
    uint64_t v43 = *(unsigned int *)(v37 + 16);
    uint64_t v44 = *(void *)(v37 + 24);
    swift_bridgeObjectRetain(v44);
    sub_10000B6D8(v43, v44);
    swift_bridgeObjectRelease(v44);
    swift_release(v37);
    swift_release(v38);
    swift_release(v39);
  }

  uint64_t v45 = *(void *)(v0 + 680);
  uint64_t v46 = *(void *)(v0 + 672);
  uint64_t v47 = *(void *)(v0 + 664);
  uint64_t v48 = *(void *)(v0 + 656);
  uint64_t v49 = *(void *)(v0 + 648);
  uint64_t v50 = *(void *)(v0 + 640);
  uint64_t v51 = *(void *)(v0 + 632);
  uint64_t v52 = *(void *)(v0 + 624);
  uint64_t v53 = *(void *)(v0 + 608);
  uint64_t v58 = *(void *)(v0 + 584);
  uint64_t v59 = *(void *)(v0 + 576);
  uint64_t v61 = *(void *)(v0 + 568);
  uint64_t v63 = *(void *)(v0 + 560);
  uint64_t v65 = *(void *)(v0 + 552);
  uint64_t v67 = *(void *)(v0 + 528);
  uint64_t v69 = *(void *)(v0 + 520);
  swift_task_dealloc(*(void *)(v0 + 688));
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v61);
  swift_task_dealloc(v63);
  swift_task_dealloc(v65);
  swift_task_dealloc(v67);
  swift_task_dealloc(v69);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A52C()
{
  uint64_t v1 = *(void **)(v0 + 896);
  uint64_t v2 = *(void **)(v0 + 840);
  uint64_t v3 = *(void *)(v0 + 568);
  swift_beginAccess(*(void *)(v0 + 760) + 16LL, v0 + 80, 33LL, 0LL);
  uint64_t v4 = sub_10000DEB0(v3);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  swift_endAccess(v0 + 80);

  sub_10000DFCC(v4, v6, v8, v10);
  uint64_t result = (*(uint64_t (**)(void, void))(v0 + 888))(*(void *)(v0 + 568), *(void *)(v0 + 536));
  uint64_t v12 = *(void *)(v0 + 880);
  unint64_t v13 = *(void *)(v0 + 832);
  int64_t v14 = *(void *)(v0 + 824);
  *(void *)(v0 + 816) = v12;
  if (v13)
  {
    uint64_t v15 = (v13 - 1) & v13;
    unint64_t v16 = __clz(__rbit64(v13)) | (v14 << 6);
    uint64_t v17 = *(void *)(v0 + 808);
LABEL_3:
    uint64_t v18 = *(void *)(v0 + 576);
    (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 544) + 16LL))( v18,  *(void *)(v17 + 48) + *(void *)(*(void *)(v0 + 544) + 72LL) * v16,  *(void *)(v0 + 536));
    uint64_t v19 = *(void *)(v17 + 56);
    uint64_t v20 = sub_100003C00(&qword_1000184A0);
    Swift::String v21 = *(void **)(v19 + 8 * v16);
    *(void *)(v18 + *(int *)(v20 + 48)) = v21;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v18, 0LL, 1LL, v20);
    id v22 = v21;
    goto LABEL_22;
  }

  int64_t v23 = v14 + 1;
  if (__OFADD__(v14, 1LL))
  {
    __break(1u);
    goto LABEL_30;
  }

  int64_t v24 = (unint64_t)((1LL << *(_BYTE *)(v0 + 944)) + 63) >> 6;
  if (v23 < v24)
  {
    uint64_t v17 = *(void *)(v0 + 808);
    uint64_t v25 = v17 + 64;
    unint64_t v26 = *(void *)(v17 + 64 + 8 * v23);
    if (v26)
    {
LABEL_7:
      uint64_t v15 = (v26 - 1) & v26;
      unint64_t v16 = __clz(__rbit64(v26)) + (v23 << 6);
      int64_t v14 = v23;
      goto LABEL_3;
    }

    int64_t v27 = v14 + 2;
    ++v14;
    if (v23 + 1 < v24)
    {
      unint64_t v26 = *(void *)(v25 + 8 * v27);
      if (v26)
      {
LABEL_10:
        int64_t v23 = v27;
        goto LABEL_7;
      }

      int64_t v14 = v23 + 1;
      if (v23 + 2 < v24)
      {
        unint64_t v26 = *(void *)(v25 + 8 * (v23 + 2));
        if (v26)
        {
          v23 += 2LL;
          goto LABEL_7;
        }

        int64_t v27 = v23 + 3;
        int64_t v14 = v23 + 2;
        if (v23 + 3 < v24)
        {
          unint64_t v26 = *(void *)(v25 + 8 * v27);
          if (v26) {
            goto LABEL_10;
          }
          while (1)
          {
            int64_t v23 = v27 + 1;
            if (__OFADD__(v27, 1LL)) {
              break;
            }
            if (v23 >= v24)
            {
              int64_t v14 = v24 - 1;
              goto LABEL_21;
            }

            unint64_t v26 = *(void *)(v25 + 8 * v23);
            ++v27;
            if (v26) {
              goto LABEL_7;
            }
          }

LABEL_30:
          __break(1u);
          return result;
        }
      }
    }
  }

  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

LABEL_21:
  uint64_t v28 = *(void *)(v0 + 576);
  uint64_t v29 = sub_100003C00(&qword_1000184A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v28, 1LL, 1LL, v29);
  uint64_t v15 = 0LL;
LABEL_22:
  *(void *)(v0 + 832) = v15;
  *(void *)(v0 + 824) = v14;
  uint64_t v30 = *(void *)(v0 + 584);
  sub_10000ED58(*(void *)(v0 + 576), v30, &qword_100018490);
  uint64_t v31 = sub_100003C00(&qword_1000184A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48LL))(v30, 1LL, v31) == 1)
  {
    uint64_t v32 = *(void *)(v0 + 768);
    uint64_t v33 = *(void *)(v0 + 728);
    uint64_t v34 = *(void *)(v0 + 648);
    swift_release(*(void *)(v0 + 808));
    sub_100003E68(v32, v34);
    _StringGuts.grow(_:)(24LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    *(void *)(v0 + 440) = v12;
    v35._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v35._object;
    String.append(_:)(v35);
    swift_bridgeObjectRelease(object);
    v37._uint64_t countAndFlagsBits = 0xD000000000000016LL;
    v37._object = (void *)0x8000000100011DF0LL;
    v38._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
    v38._object = (void *)0x8000000100011D10LL;
    v39._uint64_t countAndFlagsBits = 0x286567616B636170LL;
    v39._object = (void *)0xEE00293A68746977LL;
    InternalLogger.info(_:fromFile:fromFunction:)(v37, v38, v39);
    swift_bridgeObjectRelease(0x8000000100011DF0LL);
    sub_100003EAC(v34);
    unint64_t v40 = *(void *)(v33 + 24);
    *(void *)(v0 + 912) = v40;
    if (v40 >> 60 == 15)
    {
      uint64_t v41 = *(void *)(v0 + 456);
      if (v41 >= 1)
      {
        uint64_t v42 = *(void *)(v0 + 640);
        sub_100003E68(*(void *)(v0 + 768), v42);
        _StringGuts.grow(_:)(49LL);
        swift_bridgeObjectRelease(0xE000000000000000LL);
        *(void *)(v0 + 432) = v41;
        v43._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
        uint64_t v44 = v43._object;
        String.append(_:)(v43);
        swift_bridgeObjectRelease(v44);
        v45._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
        v46._object = (void *)0x8000000100011D10LL;
        v45._object = (void *)0x8000000100011E10LL;
        v46._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
        v47._uint64_t countAndFlagsBits = 0x286567616B636170LL;
        v47._object = (void *)0xEE00293A68746977LL;
        InternalLogger.fault(_:fromFile:fromFunction:)(v45, v46, v47);
        swift_bridgeObjectRelease(0x8000000100011E10LL);
        sub_100003EAC(v42);
      }

      uint64_t v48 = *(void *)(v0 + 800);
      uint64_t v49 = *(void *)(v0 + 784);
      uint64_t v50 = *(void *)(v0 + 760);
      uint64_t v51 = *(void *)(v0 + 728);
      uint64_t v52 = *(void *)(v0 + 720);
      id v53 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v86 = MLHostResult.init(status:policy:)(2LL, 1LL);
      swift_release_n(v49, 2LL);
      swift_release(v48);
      uint64_t v54 = *(unsigned int *)(v50 + 16);
      uint64_t v55 = *(void *)(v50 + 24);
      swift_bridgeObjectRetain(v55);
      sub_10000B6D8(v54, v55);
      swift_bridgeObjectRelease(v55);
      swift_release(v50);
      swift_release(v51);
      swift_release(v52);
      uint64_t v56 = *(void *)(v0 + 680);
      uint64_t v57 = *(void *)(v0 + 672);
      uint64_t v58 = *(void *)(v0 + 664);
      uint64_t v59 = *(void *)(v0 + 656);
      uint64_t v60 = *(void *)(v0 + 648);
      uint64_t v61 = *(void *)(v0 + 640);
      uint64_t v62 = *(void *)(v0 + 632);
      uint64_t v63 = *(void *)(v0 + 624);
      uint64_t v64 = *(void *)(v0 + 608);
      uint64_t v79 = *(void *)(v0 + 584);
      uint64_t v80 = *(void *)(v0 + 576);
      uint64_t v81 = *(void *)(v0 + 568);
      uint64_t v82 = *(void *)(v0 + 560);
      uint64_t v83 = *(void *)(v0 + 552);
      uint64_t v84 = *(void *)(v0 + 528);
      uint64_t v85 = *(void *)(v0 + 520);
      swift_task_dealloc(*(void *)(v0 + 688));
      swift_task_dealloc(v56);
      swift_task_dealloc(v57);
      swift_task_dealloc(v58);
      swift_task_dealloc(v59);
      swift_task_dealloc(v60);
      swift_task_dealloc(v61);
      swift_task_dealloc(v62);
      swift_task_dealloc(v63);
      swift_task_dealloc(v64);
      swift_task_dealloc(v79);
      swift_task_dealloc(v80);
      swift_task_dealloc(v81);
      swift_task_dealloc(v82);
      swift_task_dealloc(v83);
      swift_task_dealloc(v84);
      swift_task_dealloc(v85);
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v86);
    }

    else
    {
      uint64_t v74 = *(void *)(*(void *)(v0 + 728) + 16LL);
      *(void *)(v0 + 920) = v74;
      sub_10000D180(v74, v40);
      v75._object = (void *)0x8000000100011E40LL;
      v75._uint64_t countAndFlagsBits = 0xD000000000000016LL;
      v76._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
      v76._object = (void *)0x8000000100011D10LL;
      v77._uint64_t countAndFlagsBits = 0x286567616B636170LL;
      v77._object = (void *)0xEE00293A68746977LL;
      InternalLogger.info(_:fromFile:fromFunction:)(v75, v76, v77);
      *(void *)(v0 + 928) = v78;
      *uint64_t v78 = v0;
      v78[1] = sub_100009A60;
      return v87(v74, v40);
    }
  }

  else
  {
    uint64_t v65 = *(unsigned int *)(v0 + 936);
    uint64_t v66 = *(void *)(v0 + 568);
    uint64_t v67 = *(void *)(v0 + 544);
    uint64_t v68 = *(void *)(v0 + 528);
    uint64_t v69 = *(void *)(v0 + 504);
    uint64_t v70 = *(void *)(v0 + 512);
    uint64_t v71 = *(void *)(*(void *)(v0 + 584) + *(int *)(v31 + 48));
    *(void *)(v0 + 840) = v71;
    (*(void (**)(uint64_t))(v67 + 32))(v66);
    Swift::String v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 104);
    *(void *)(v0 + 848) = v72;
    v72(v68, v65, v69);
    Swift::String v73 = (void *)swift_task_alloc(dword_1000183B4);
    *(void *)(v0 + 856) = v73;
    *Swift::String v73 = v0;
    v73[1] = sub_100008FC8;
    return sub_1000055F8(v71, *(void *)(v0 + 528), *(void *)(v0 + 704), *(void *)(v0 + 712));
  }

uint64_t sub_10000AC74()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_100005C8C(*(void *)(v0 + 16), v1);
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000ACA8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_10000ACCC(char a1)
{
  __asm { BR              X12 }

uint64_t sub_10000AD18(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000ADAC + 4 * byte_100011645[a2]))(0x726F727245666266LL);
}

uint64_t sub_10000ADAC(uint64_t a1)
{
  if (a1 == 0x726F727245666266LL && v1 == 0xE800000000000000LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE800000000000000LL);
  return v2 & 1;
}

void sub_10000AE80(char a1)
{
  __asm { BR              X11 }

uint64_t sub_10000AECC(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000AF34 + 4 * byte_10001164E[a2]))(a3 + 1);
}

uint64_t sub_10000AF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == a3 + 1 && v3 == 0x80000001000118C0LL) {
    char v4 = 1;
  }
  else {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v3);
  }
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(0x80000001000118C0LL);
  return v4 & 1;
}

void sub_10000AFDC(char a1)
{
  __asm { BR              X10 }

Swift::Int sub_10000B034()
{
  ((void (*)(const char *__return_ptr, uint64_t *, uint64_t, unint64_t))String.hash(into:))( "accountFetchError",  &v2,  v0 + 1,  0x80000001000118C0LL);
  swift_bridgeObjectRelease(0x80000001000118C0LL);
  return Hasher._finalize()();
}

void sub_10000B0B0(char a1)
{
  __asm { BR              X10 }

Swift::Int sub_10000B108()
{
  return Hasher._finalize()();
}

void sub_10000B1A4(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_10000B1EC(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE800000000000000LL);
}

void sub_10000B274(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_10000B2B8(uint64_t a1, uint64_t a2)
{
  ((void (*)(const char *__return_ptr, uint64_t, uint64_t, unint64_t))String.hash(into:))( "accountFetchError",  a1,  a2 + 1,  0x80000001000118C0LL);
  return swift_bridgeObjectRelease(0x80000001000118C0LL);
}

void sub_10000B318(uint64_t a1, char a2)
{
  __asm { BR              X10 }

Swift::Int sub_10000B36C()
{
  ((void (*)(const char *__return_ptr, uint64_t *, uint64_t, unint64_t))String.hash(into:))( "accountFetchError",  &v2,  v0 + 1,  0x80000001000118C0LL);
  swift_bridgeObjectRelease(0x80000001000118C0LL);
  return Hasher._finalize()();
}

void sub_10000B3E8(uint64_t a1, char a2)
{
  __asm { BR              X10 }

Swift::Int sub_10000B43C()
{
  return Hasher._finalize()();
}

void sub_10000B4D8(uint64_t a1, void *a2)
{
  char v4 = *(void (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4(a2);
  swift_release(v3);
}

unint64_t sub_10000B52C(uint64_t a1)
{
  uint64_t v2 = sub_100003C00(&qword_100018500);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
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

  sub_100003C00(&qword_1000184D0);
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
    sub_10000EE08(v13, (uint64_t)v5);
    unint64_t result = sub_10000DE4C((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for UUID(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))( v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  v5,  v19);
    uint64_t v20 = v8[7] + 32 * v17;
    char v21 = v10[16];
    char v22 = v10[17];
    uint64_t v23 = *((void *)v10 + 3);
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v10;
    *(_BYTE *)(v20 + 16) = v21;
    *(_BYTE *)(v20 + 17) = v22;
    *(void *)(v20 + 24) = v23;
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

uint64_t sub_10000B6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = type metadata accessor for InternalLogger(0LL);
  __chkstk_darwin(v50);
  uint64_t v49 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OffDeviceTopic(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v55 = v6;
  uint64_t v56 = v7;
  __chkstk_darwin(v6);
  uint64_t v54 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v2;
  uint64_t v57 = v2[1];
  uint64_t v58 = v9;
  uint64_t result = sub_1000049AC(a1, a2);
  uint64_t v11 = result;
  if ((unint64_t)result >> 62)
  {
    if (result >= 0) {
      result &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(result);
    uint64_t v12 = result;
    if (!result) {
      return swift_bridgeObjectRelease(v11);
    }
  }

  else
  {
    uint64_t v12 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v12) {
      return swift_bridgeObjectRelease(v11);
    }
  }

  if (v12 >= 1)
  {
    uint64_t v13 = 0LL;
    unint64_t v59 = v11 & 0xC000000000000001LL;
    unsigned int v51 = enum case for OffDeviceTopic.telemetry(_:);
    uint64_t v48 = (void *)0x8000000100011F20LL;
    Swift::String v47 = (void *)0x8000000100011D10LL;
    Swift::String v46 = (void *)0x8000000100011F50LL;
    uint64_t v52 = v12;
    uint64_t v53 = v11;
    do
    {
      if (v59) {
        id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v11);
      }
      else {
        id v33 = *(id *)(v11 + 8 * v13 + 32);
      }
      uint64_t v34 = v33;
      id v35 = objc_msgSend(v33, "wrapAsAnyEvent", v46, v47);
      if (v35)
      {
        uint64_t v14 = v35;
        uint64_t v16 = v55;
        uint64_t v15 = v56;
        unint64_t v17 = v54;
        uint64_t v18 = (*(uint64_t (**)(char *, void, uint64_t))(v56 + 104))(v54, v51, v55);
        OffDeviceTopic.rawValue.getter(v18);
        uint64_t v20 = v19;
        NSString v21 = String._bridgeToObjectiveC()();
        id v60 = v34;
        char v22 = v21;
        swift_bridgeObjectRelease(v20);
        uint64_t v23 = (void *)swift_allocObject(&unk_100015300, 56LL, 7LL);
        uint64_t v24 = v57;
        BOOL v25 = v58;
        v23[2] = v58;
        v23[3] = v24;
        v23[5] = 0LL;
        v23[6] = 0LL;
        v23[4] = v14;
        uint64_t v64 = sub_10000EDE0;
        uint64_t v65 = v23;
        aBlock._uint64_t countAndFlagsBits = (uint64_t)_NSConcreteStackBlock;
        aBlock._object = (void *)1107296256;
        uint64_t v62 = sub_10000B4D8;
        uint64_t v63 = &unk_100015318;
        uint64_t v26 = _Block_copy(&aBlock);
        uint64_t v27 = v65;
        id v28 = v25;
        id v29 = v24;
        id v30 = v14;
        swift_release(v27);
        [v28 reportSiriInstrumentationEvent:v30 forBundleID:v22 completion:v26];
        _Block_release(v26);

        uint64_t v31 = *(void (**)(char *, uint64_t))(v15 + 8);
        uint64_t v32 = v16;
        uint64_t v12 = v52;
        uint64_t v11 = v53;
        v31(v17, v32);
      }

      else
      {
        if (qword_1000181C0 != -1) {
          swift_once(&qword_1000181C0, sub_10000F7AC);
        }
        uint64_t v36 = sub_100003E30(v50, (uint64_t)qword_100018508);
        uint64_t v37 = v49;
        sub_100003E68(v36, v49);
        aBlock._uint64_t countAndFlagsBits = 0LL;
        aBlock._object = (void *)0xE000000000000000LL;
        _StringGuts.grow(_:)(37LL);
        swift_bridgeObjectRelease(aBlock._object);
        aBlock._uint64_t countAndFlagsBits = 0xD000000000000023LL;
        aBlock._object = v48;
        id v38 = [v34 description];
        uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        uint64_t v41 = v40;

        v42._uint64_t countAndFlagsBits = v39;
        v42._object = v41;
        String.append(_:)(v42);
        swift_bridgeObjectRelease(v41);
        object = aBlock._object;
        v44._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
        v44._object = v47;
        v45._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
        v45._object = v46;
        InternalLogger.error(_:fromFile:fromFunction:)(aBlock, v44, v45);

        swift_bridgeObjectRelease(object);
        sub_100003EAC(v37);
      }

      ++v13;
    }

    while (v12 != v13);
    return swift_bridgeObjectRelease(v11);
  }

  __break(1u);
  return result;
}

uint64_t sub_10000BADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a2 + 16))
  {
    unint64_t v5 = sub_10000DE4C(a1);
    if ((v6 & 1) != 0)
    {
      if (!a3) {
        return 1LL;
      }
      uint64_t v7 = *(void *)(a3 + 16);
      if (!v7) {
        return 1LL;
      }
      uint64_t v8 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v5);
      uint64_t v10 = *v8;
      uint64_t v9 = v8[1];
      swift_bridgeObjectRetain(v9);
      swift_bridgeObjectRetain(a3);
      for (i = (uint64_t *)(a3 + 48); ; i += 3)
      {
        uint64_t v12 = *(i - 2);
        if (v12 < 0)
        {
LABEL_12:
          swift_bridgeObjectRelease(v9);
          uint64_t v20 = a3;
          goto LABEL_14;
        }

        uint64_t v14 = *(i - 1);
        uint64_t v13 = *i;
        swift_bridgeObjectRetain(*i);
        if (v12 >= String.count.getter(v10, v9)) {
          break;
        }
        uint64_t v15 = String.index(_:offsetBy:)(15LL, v12, v10, v9);
        String.subscript.getter(v15, v10, v9);
        uint64_t v17 = v16;
        BOOL v18 = sub_100006A04(v14, v13);
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease(v17);
        if (!v18) {
          goto LABEL_12;
        }
        if (!--v7)
        {
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(a3);
          return 1LL;
        }
      }

      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(a3);
      uint64_t v20 = v13;
LABEL_14:
      swift_bridgeObjectRelease(v20);
    }
  }

  return 0LL;
}

uint64_t sub_10000BC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = (_DWORD *)(a2 + 16);
  type metadata accessor for SessionBuilder(0LL);
  uint64_t v7 = swift_projectBox(a3);
  uint64_t result = swift_beginAccess(v6, v13, 1LL, 0LL);
  int v9 = *(_DWORD *)(a2 + 16);
  BOOL v10 = __CFADD__(v9, 1);
  int v11 = v9 + 1;
  if (v10)
  {
    __break(1u);
  }

  else
  {
    _DWORD *v6 = v11;
    swift_beginAccess(v7, v12, 33LL, 0LL);
    SessionBuilder.add(_:)(a1);
    swift_endAccess(v12);
    return 1LL;
  }

  return result;
}

uint64_t sub_10000BCC8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v29[0] = type metadata accessor for SessionBuilder(0LL);
  uint64_t v9 = *(void *)(v29[0] - 8LL);
  __chkstk_darwin(v29[0]);
  int v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for InternalLogger(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = swift_projectBox(a5);
  swift_beginAccess(a4 + 16, v33, 1LL, 0LL);
  uint64_t v16 = *(void *)(a4 + 16);
  unint64_t v17 = *(void *)(a4 + 24);
  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_10000D180(a1, a2);
  sub_10000D1D8(v16, v17);
  if (qword_1000181C0 != -1) {
    swift_once(&qword_1000181C0, sub_10000F7AC);
  }
  uint64_t v18 = sub_100003E30(v12, (uint64_t)qword_100018508);
  sub_100003E68(v18, (uint64_t)v14);
  uint64_t v30 = 0LL;
  unint64_t v31 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(17LL);
  swift_bridgeObjectRelease(v31);
  v32._uint64_t countAndFlagsBits = 0x736567617373654DLL;
  v32._object = (void *)0xEF203A6461657220LL;
  swift_beginAccess(v15, &v30, 0LL, 0LL);
  uint64_t v19 = v15;
  uint64_t v20 = v29[0];
  uint64_t v21 = (*(uint64_t (**)(char *, uint64_t, void))(v9 + 16))(v11, v19, v29[0]);
  uint64_t v22 = SessionBuilder.count.getter(v21);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  v29[1] = v22;
  v23._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v23._object;
  String.append(_:)(v23);
  swift_bridgeObjectRelease(object);
  BOOL v25 = v32._object;
  v26._object = (void *)0x8000000100011D10LL;
  v26._uint64_t countAndFlagsBits = 0xD00000000000006DLL;
  v27._uint64_t countAndFlagsBits = 0x286567616B636170LL;
  v27._object = (void *)0xEE00293A68746977LL;
  InternalLogger.info(_:fromFile:fromFunction:)(v32, v26, v27);
  swift_bridgeObjectRelease(v25);
  return sub_100003EAC((uint64_t)v14);
}

void *sub_10000BF1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EnvelopeResult(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v77 = sub_100003C00(&qword_1000184E0);
  uint64_t v6 = __chkstk_darwin(v77);
  Swift::String v73 = (char *)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v61 - v9;
  __chkstk_darwin(v8);
  uint64_t v67 = (char *)v61 - v11;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v64 = a1 + 64;
  uint64_t v79 = &_swiftEmptyDictionarySingleton;
  uint64_t v13 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v13 < 64) {
    uint64_t v14 = ~(-1LL << -(char)v13);
  }
  else {
    uint64_t v14 = -1LL;
  }
  unint64_t v15 = v14 & v12;
  v61[1] = -1LL << *(_BYTE *)(a1 + 32);
  int64_t v63 = (unint64_t)(63 - v13) >> 6;
  int v76 = enum case for EnvelopeResult.included(_:);
  int v62 = enum case for EnvelopeResult.notIncluded(_:);
  uint64_t v68 = a1;
  swift_bridgeObjectRetain(a1);
  int64_t v69 = 0LL;
  uint64_t v65 = v5;
  uint64_t v66 = v3;
  if (!v15) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v16 = (uint64_t)v10;
  uint64_t v78 = (v15 - 1) & v15;
  unint64_t v17 = __clz(__rbit64(v15)) | (v69 << 6);
  while (1)
  {
    uint64_t v22 = v68;
    uint64_t v23 = *(void *)(v68 + 48);
    uint64_t v24 = type metadata accessor for UUID(0LL);
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v74 = *(void *)(v25 + 72);
    uint64_t v75 = v25;
    Swift::String v26 = v67;
    uint64_t v27 = v24;
    (*(void (**)(char *, unint64_t))(v25 + 16))(v67, v23 + v74 * v17);
    unint64_t v28 = *(void *)(v22 + 56) + *(void *)(v3 + 72) * v17;
    uint64_t v29 = v77;
    uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v30(&v26[*(int *)(v77 + 48)], v28, v2);
    uint64_t v31 = (uint64_t)v26;
    uint64_t v10 = (char *)v16;
    sub_10000ED58(v31, v16, &qword_1000184E0);
    uint64_t v32 = v16 + *(int *)(v29 + 48);
    v30(v5, v32, v2);
    int v33 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
    if (v33 == v76)
    {
      int v72 = v33;
      (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
      uint64_t v34 = *(void **)v5;
      uint64_t v71 = *((unsigned int *)v5 + 2);
      if (v34)
      {
        id v35 = [v34 payload];
        uint64_t v36 = v27;
        if (v35)
        {
          uint64_t v37 = v35;
          static Data._unconditionallyBridgeFromObjectiveC(_:)(v35);
          uint64_t v39 = v38;

          __asm { BR              X9 }
        }

        uint64_t v70 = 0LL;
        unint64_t v40 = v73;
        goto LABEL_32;
      }
    }

    else
    {
      if (v33 != v62)
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        sub_10000ED10(v16);
        unint64_t v15 = v78;
        if (!v78) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }

      int v72 = v33;
      uint64_t v71 = 0LL;
    }

    uint64_t v70 = 0LL;
    unint64_t v40 = v73;
    uint64_t v36 = v27;
LABEL_32:
    uint64_t v41 = &v40[*(int *)(v77 + 48)];
    Swift::String v42 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
    v42(v40, v10, v36);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v41, v32, v2);
    Swift::String v43 = v79;
    unint64_t v44 = v79[2];
    if (v79[3] <= v44)
    {
      sub_10000D974(v44 + 1, 1LL);
      Swift::String v43 = v79;
    }

    uint64_t v45 = v43[5];
    uint64_t v46 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t v47 = dispatch thunk of Hashable._rawHashValue(seed:)(v45, v36, v46);
    uint64_t v48 = v43 + 8;
    uint64_t v49 = -1LL << *((_BYTE *)v43 + 32);
    unint64_t v50 = v47 & ~v49;
    unint64_t v51 = v50 >> 6;
    if (((-1LL << v50) & ~v43[(v50 >> 6) + 8]) != 0)
    {
      unint64_t v52 = __clz(__rbit64((-1LL << v50) & ~v43[(v50 >> 6) + 8])) | v50 & 0x7FFFFFFFFFFFFFC0LL;
      goto LABEL_44;
    }

    char v53 = 0;
    unint64_t v54 = (unint64_t)(63 - v49) >> 6;
    do
    {
      if (++v51 == v54 && (v53 & 1) != 0)
      {
        __break(1u);
LABEL_47:
        __break(1u);
        JUMPOUT(0x10000C57CLL);
      }

      BOOL v55 = v51 == v54;
      if (v51 == v54) {
        unint64_t v51 = 0LL;
      }
      v53 |= v55;
      uint64_t v56 = v48[v51];
    }

    while (v56 == -1);
    unint64_t v52 = __clz(__rbit64(~v56)) + (v51 << 6);
LABEL_44:
    BOOL v57 = v72 != v76;
    *(void *)((char *)v48 + ((v52 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v52;
    v42((char *)(v43[6] + v52 * v74), v73, v36);
    uint64_t v58 = v43[7] + 24 * v52;
    uint64_t v59 = v70;
    *(void *)uint64_t v58 = v71;
    *(void *)(v58 + 8) = v59;
    *(_BYTE *)(v58 + 16) = v57;
    ++v43[2];
    uint64_t v3 = v66;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v41, v2);
    unint64_t v5 = v65;
    unint64_t v15 = v78;
    if (v78) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v18 = v69 + 1;
    if (__OFADD__(v69, 1LL)) {
      goto LABEL_47;
    }
    if (v18 >= v63) {
      goto LABEL_46;
    }
    unint64_t v19 = *(void *)(v64 + 8 * v18);
    int64_t v20 = v69 + 1;
    if (v19) {
      goto LABEL_23;
    }
    int64_t v20 = v69 + 2;
    if (v69 + 2 >= v63) {
      goto LABEL_46;
    }
    unint64_t v19 = *(void *)(v64 + 8 * v20);
    if (v19) {
      goto LABEL_23;
    }
    int64_t v20 = v69 + 3;
    if (v69 + 3 >= v63) {
      goto LABEL_46;
    }
    unint64_t v19 = *(void *)(v64 + 8 * v20);
    if (v19) {
      goto LABEL_23;
    }
    int64_t v20 = v69 + 4;
    if (v69 + 4 >= v63) {
      goto LABEL_46;
    }
    unint64_t v19 = *(void *)(v64 + 8 * v20);
    if (v19) {
      goto LABEL_23;
    }
    int64_t v21 = v69 + 5;
    if (v69 + 5 >= v63) {
      goto LABEL_46;
    }
    unint64_t v19 = *(void *)(v64 + 8 * v21);
    if (!v19) {
      break;
    }
    int64_t v20 = v69 + 5;
LABEL_23:
    uint64_t v16 = (uint64_t)v10;
    uint64_t v78 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
    int64_t v69 = v20;
  }

  while (1)
  {
    int64_t v20 = v21 + 1;
    if (__OFADD__(v21, 1LL))
    {
      __break(1u);
      JUMPOUT(0x10000C588LL);
    }

    if (v20 >= v63) {
      break;
    }
    unint64_t v19 = *(void *)(v64 + 8 * v20);
    ++v21;
    if (v19) {
      goto LABEL_23;
    }
  }

LABEL_46:
  sub_10000ED50(v68);
  return v79;
}

uint64_t sub_10000C598(uint64_t a1)
{
  uint64_t v54 = sub_100003C00(&qword_1000184F0);
  uint64_t v2 = __chkstk_darwin(v54);
  uint64_t v59 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v2);
  char v53 = (char *)&v49 - v5;
  __chkstk_darwin(v4);
  unint64_t v52 = (char *)&v49 - v6;
  uint64_t v7 = &_swiftEmptyDictionarySingleton;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v51 = a1 + 64;
  id v60 = &_swiftEmptyDictionarySingleton;
  uint64_t v9 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v9 < 64) {
    uint64_t v10 = ~(-1LL << -(char)v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & v8;
  uint64_t v49 = -1LL << *(_BYTE *)(a1 + 32);
  int64_t v50 = (unint64_t)(63 - v9) >> 6;
  uint64_t v55 = a1;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v56 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v23 = v22 | (v56 << 6);
      goto LABEL_34;
    }

    int64_t v24 = v56 + 1;
    if (__OFADD__(v56, 1LL))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }

    if (v24 >= v50) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v51 + 8 * v24);
    int64_t v26 = v56 + 1;
    if (!v25)
    {
      int64_t v26 = v56 + 2;
      if (v56 + 2 >= v50) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v51 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v56 + 3;
        if (v56 + 3 >= v50) {
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v51 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v56 + 4;
          if (v56 + 4 >= v50) {
            goto LABEL_36;
          }
          unint64_t v25 = *(void *)(v51 + 8 * v26);
          if (!v25) {
            break;
          }
        }
      }
    }

LABEL_33:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
    int64_t v56 = v26;
LABEL_34:
    uint64_t v32 = v55;
    uint64_t v33 = *(void *)(v55 + 48);
    uint64_t v34 = type metadata accessor for UUID(0LL);
    uint64_t v35 = *(void *)(v34 - 8);
    uint64_t v36 = *(void *)(v35 + 72);
    uint64_t v37 = v33 + v36 * v23;
    uint64_t v38 = (uint64_t)v52;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v52, v37, v34);
    uint64_t v39 = *(void *)(v32 + 56) + 24 * v23;
    char v40 = *(_BYTE *)(v39 + 16);
    uint64_t v42 = (uint64_t)v53;
    uint64_t v41 = v54;
    uint64_t v43 = v38 + *(int *)(v54 + 48);
    *(_OWORD *)uint64_t v43 = *(_OWORD *)v39;
    *(_BYTE *)(v43 + 16) = v40;
    sub_10000ED58(v38, v42, &qword_1000184F0);
    uint64_t v44 = v42 + *(int *)(v41 + 48);
    uint64_t v45 = *(void *)v44;
    uint64_t v57 = *(void *)(v44 + 8);
    uint64_t v58 = v45;
    char v46 = *(_BYTE *)(v44 + 16);
    uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 32);
    v47(v59, v42, v34);
    unint64_t v48 = v7[2];
    if (v7[3] <= v48) {
      sub_10000D1EC(v48 + 1, 1LL);
    }
    uint64_t v7 = v60;
    uint64_t v13 = v60[5];
    uint64_t v14 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v13, v34, v14);
    unint64_t v15 = (char *)(v7 + 8);
    uint64_t v16 = -1LL << *((_BYTE *)v7 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1LL << v17) & ~v7[(v17 >> 6) + 8]) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v17) & ~v7[(v17 >> 6) + 8])) | v17 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_37;
        }

        BOOL v30 = v18 == v29;
        if (v18 == v29) {
          unint64_t v18 = 0LL;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)&v15[8 * v18];
      }

      while (v31 == -1);
      unint64_t v19 = __clz(__rbit64(~v31)) + (v18 << 6);
    }

    *(void *)&v15[(v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v47)(v7[6] + v19 * v36, v59, v34);
    uint64_t v20 = v7[7] + 32 * v19;
    uint64_t v21 = v57;
    *(void *)uint64_t v20 = v58;
    *(void *)(v20 + 8) = v21;
    *(_BYTE *)(v20 + 16) = v46;
    *(_BYTE *)(v20 + 17) = 0;
    *(void *)(v20 + 24) = 0LL;
    ++v7[2];
  }

  int64_t v27 = v56 + 5;
  if (v56 + 5 >= v50)
  {
LABEL_36:
    sub_10000ED50(v55);
    return (uint64_t)v7;
  }

  unint64_t v25 = *(void *)(v51 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v56 + 5;
    goto LABEL_33;
  }

  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v26 >= v50) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v51 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_33;
    }
  }

LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000C9C4(uint64_t a1, void *a2)
{
  uint64_t v57 = a2;
  uint64_t v3 = type metadata accessor for EnvelopeResult(0LL);
  uint64_t v65 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v67 = (char *)v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = sub_100003C00(&qword_1000184E0);
  uint64_t v5 = __chkstk_darwin(v69);
  uint64_t v61 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v71 = (uint64_t)v56 - v8;
  __chkstk_darwin(v7);
  uint64_t v66 = (char *)v56 - v9;
  int v72 = &_swiftEmptyDictionarySingleton;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v63 = a1 + 64;
  uint64_t v11 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v11 < 64) {
    uint64_t v12 = ~(-1LL << -(char)v11);
  }
  else {
    uint64_t v12 = -1LL;
  }
  unint64_t v13 = v12 & v10;
  v56[1] = -1LL << *(_BYTE *)(a1 + 32);
  int64_t v62 = (unint64_t)(63 - v11) >> 6;
  int v64 = enum case for EnvelopeResult.included(_:);
  uint64_t v68 = a1;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t i = 0LL;
  if (v13) {
    goto LABEL_8;
  }
LABEL_9:
  while (2)
  {
    int64_t v17 = i + 1;
    if (!__OFADD__(i, 1LL))
    {
      if (v17 < v62)
      {
        unint64_t v18 = *(void *)(v63 + 8 * v17);
        int64_t v19 = i + 1;
        if (v18) {
          goto LABEL_24;
        }
        int64_t v19 = i + 2;
        if (i + 2 >= v62) {
          goto LABEL_43;
        }
        unint64_t v18 = *(void *)(v63 + 8 * v19);
        if (v18) {
          goto LABEL_24;
        }
        int64_t v19 = i + 3;
        if (i + 3 >= v62) {
          goto LABEL_43;
        }
        unint64_t v18 = *(void *)(v63 + 8 * v19);
        if (v18) {
          goto LABEL_24;
        }
        int64_t v19 = i + 4;
        if (i + 4 >= v62) {
          goto LABEL_43;
        }
        unint64_t v18 = *(void *)(v63 + 8 * v19);
        if (v18)
        {
LABEL_24:
          unint64_t v13 = (v18 - 1) & v18;
          unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
          for (i = v19; ; unint64_t v16 = v15 | (i << 6))
          {
            uint64_t v21 = v68;
            uint64_t v22 = *(void *)(v68 + 48);
            uint64_t v23 = type metadata accessor for UUID(0LL);
            uint64_t v24 = *(void *)(v23 - 8);
            uint64_t v25 = *(void *)(v24 + 72);
            int64_t v26 = v66;
            (*(void (**)(char *, unint64_t, uint64_t))(v24 + 16))(v66, v22 + v25 * v16, v23);
            uint64_t v27 = *(void *)(v21 + 56);
            uint64_t v28 = v65;
            uint64_t v29 = v27 + *(void *)(v65 + 72) * v16;
            uint64_t v30 = v69;
            uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
            v31(&v26[*(int *)(v69 + 48)], v29, v3);
            uint64_t v32 = (uint64_t)v26;
            uint64_t v33 = v28;
            uint64_t v34 = v71;
            sub_10000ED58(v32, v71, &qword_1000184E0);
            uint64_t v35 = v34 + *(int *)(v30 + 48);
            uint64_t v36 = (uint64_t *)v67;
            v31(v67, v35, v3);
            int v37 = (*(uint64_t (**)(uint64_t *, uint64_t))(v33 + 88))(v36, v3);
            if (v37 != v64) {
              break;
            }
            uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v33 + 96))(v36, v3);
            if (!*v36)
            {
              if (__OFADD__(*v57, 1LL)) {
                goto LABEL_45;
              }
              ++*v57;
              goto LABEL_7;
            }

            uint64_t v59 = *v36;
            uint64_t v38 = &v61[*(int *)(v69 + 48)];
            uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 32);
            v58(v61, v71, v23);
            uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 32);
            id v60 = v38;
            v39(v38, v35, v3);
            char v40 = v72;
            unint64_t v41 = v72[2];
            if (v72[3] <= v41)
            {
              sub_10000D5E4(v41 + 1, 1LL);
              char v40 = v72;
            }

            uint64_t v42 = v40[5];
            uint64_t v43 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
            uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v42, v23, v43);
            uint64_t v44 = v40 + 8;
            uint64_t v45 = -1LL << *((_BYTE *)v40 + 32);
            unint64_t v46 = result & ~v45;
            unint64_t v47 = v46 >> 6;
            if (((-1LL << v46) & ~v40[(v46 >> 6) + 8]) != 0)
            {
              unint64_t v48 = __clz(__rbit64((-1LL << v46) & ~v40[(v46 >> 6) + 8])) | v46 & 0x7FFFFFFFFFFFFFC0LL;
            }

            else
            {
              char v49 = 0;
              unint64_t v50 = (unint64_t)(63 - v45) >> 6;
              do
              {
                if (++v47 == v50 && (v49 & 1) != 0)
                {
                  __break(1u);
                  goto LABEL_44;
                }

                BOOL v51 = v47 == v50;
                if (v47 == v50) {
                  unint64_t v47 = 0LL;
                }
                v49 |= v51;
                uint64_t v52 = v44[v47];
              }

              while (v52 == -1);
              unint64_t v48 = __clz(__rbit64(~v52)) + (v47 << 6);
            }

            char v53 = v61;
            uint64_t v54 = (void (*)(unint64_t, char *, uint64_t))v58;
            *(void *)((char *)v44 + ((v48 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v48;
            v54(v40[6] + v48 * v25, v53, v23);
            uint64_t v55 = v60;
            *(void *)(v40[7] + 8 * v48) = v59;
            ++v40[2];
            uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v55, v3);
            if (!v13) {
              goto LABEL_9;
            }
LABEL_8:
            unint64_t v15 = __clz(__rbit64(v13));
            v13 &= v13 - 1;
          }

          (*(void (**)(uint64_t *, uint64_t))(v33 + 8))(v36, v3);
LABEL_7:
          uint64_t result = sub_10000ED10(v71);
          if (!v13) {
            continue;
          }
          goto LABEL_8;
        }

        int64_t v20 = i + 5;
        if (i + 5 < v62)
        {
          unint64_t v18 = *(void *)(v63 + 8 * v20);
          if (v18)
          {
            int64_t v19 = i + 5;
            goto LABEL_24;
          }

          while (1)
          {
            int64_t v19 = v20 + 1;
            if (__OFADD__(v20, 1LL)) {
              goto LABEL_46;
            }
            if (v19 >= v62) {
              break;
            }
            unint64_t v18 = *(void *)(v63 + 8 * v19);
            ++v20;
            if (v18) {
              goto LABEL_24;
            }
          }
        }
      }

void (*sub_10000CEEC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[5] = v4;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  v2[6] = v5;
  (*(void (**)(void))(v4 + 16))();
  v2[7] = sub_10000DD20(v2, (uint64_t)v5);
  return sub_10000CF7C;
}

void sub_10000CF7C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 48LL);
  uint64_t v3 = *(void *)(*a1 + 32LL);
  uint64_t v4 = *(void *)(*a1 + 40LL);
  (*(void (**)(void, void))(*a1 + 56LL))(*a1, 0LL);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v2, v3);
  free(v2);
  free(v1);
}

uint64_t sub_10000CFD0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000D00C + 4 * byte_10001166D[a1]))( 0xD00000000000001ELL,  0x80000001000118F0LL);
}

uint64_t sub_10000D00C()
{
  return 0x726F727245666266LL;
}

unint64_t sub_10000D024()
{
  return 0xD000000000000015LL;
}

uint64_t sub_10000D040()
{
  return 0x67617373654D6F6ELL;
}

uint64_t sub_10000D05C()
{
  return 0x6F69737365536F6ELL;
}

void sub_10000D080(char *a1)
{
}

void sub_10000D08C()
{
}

void sub_10000D094(uint64_t a1)
{
}

void sub_10000D09C(uint64_t a1)
{
}

unint64_t sub_10000D0A4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10000EC78(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000D0D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000CFD0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000D0F8()
{
  unint64_t result = qword_100018498;
  if (!qword_100018498)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000117CC, &type metadata for SessionBuilderError);
    atomic_store(result, (unint64_t *)&qword_100018498);
  }

  return result;
}

uint64_t sub_10000D140(uint64_t a1)
{
  return sub_10000BC2C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000D14C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000D178(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10000BCC8(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_10000D180(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000D194(result, a2);
  }
  return result;
}

uint64_t sub_10000D194(uint64_t result, unint64_t a2)
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

uint64_t sub_10000D1D8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100005C8C(result, a2);
  }
  return result;
}

uint64_t sub_10000D1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v57 = *(void **)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_100003C00(&qword_1000184D0);
  int v56 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_43;
  }
  uint64_t v12 = 1LL << *(_BYTE *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v54 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1LL << v12);
  }
  else {
    uint64_t v14 = -1LL;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v52 = v3;
  int64_t v53 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain(v9);
  int64_t v18 = 0LL;
  uint64_t v55 = v9;
  uint64_t v61 = v8;
  uint64_t v62 = v6;
  int64_t v19 = v57;
  while (1)
  {
    if (v15)
    {
      unint64_t v23 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v24 = v23 | (v18 << 6);
      goto LABEL_24;
    }

    int64_t v25 = v18 + 1;
    if (__OFADD__(v18, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v25 >= v53) {
      break;
    }
    int64_t v26 = v54;
    unint64_t v27 = v54[v25];
    ++v18;
    if (!v27)
    {
      int64_t v18 = v25 + 1;
      if (v25 + 1 >= v53) {
        goto LABEL_36;
      }
      unint64_t v27 = v54[v18];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v53)
        {
LABEL_36:
          swift_release(v9);
          uint64_t v3 = v52;
          if ((v56 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v27 = v54[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v18 = v28 + 1;
            if (__OFADD__(v28, 1LL)) {
              goto LABEL_45;
            }
            if (v18 >= v53) {
              goto LABEL_36;
            }
            unint64_t v27 = v54[v18];
            ++v28;
            if (v27) {
              goto LABEL_23;
            }
          }
        }

        int64_t v18 = v28;
      }
    }

uint64_t sub_10000D5E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v2;
  if (*(void *)(*v2 + 24) > a1) {
    a1 = *(void *)(*v2 + 24);
  }
  sub_100003C00(&qword_1000184E8);
  int v46 = a2;
  uint64_t v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_43;
  }
  uint64_t v14 = 1LL << *(_BYTE *)(v12 + 32);
  uint64_t v15 = *(void *)(v12 + 64);
  unint64_t v44 = (void *)(v12 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1LL << v14);
  }
  else {
    uint64_t v16 = -1LL;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v42 = v3;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v11 + 64;
  uint64_t result = swift_retain(v12);
  int64_t v20 = 0LL;
  for (i = v12; ; uint64_t v12 = i)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_24;
    }

    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v24 >= v43) {
      break;
    }
    int64_t v25 = v44;
    unint64_t v26 = v44[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v43) {
        goto LABEL_36;
      }
      unint64_t v26 = v44[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v43)
        {
LABEL_36:
          swift_release(v12);
          uint64_t v3 = v42;
          if ((v46 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v26 = v44[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1LL)) {
              goto LABEL_45;
            }
            if (v20 >= v43) {
              goto LABEL_36;
            }
            unint64_t v26 = v44[v20];
            ++v27;
            if (v26) {
              goto LABEL_23;
            }
          }
        }

        int64_t v20 = v27;
      }
    }

uint64_t sub_10000D974(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v52 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_100003C00(&qword_1000184F8);
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_42;
  }
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  unint64_t v47 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  unint64_t v45 = v3;
  int64_t v46 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain(v8);
  int64_t v17 = 0LL;
  HIDWORD(v44) = a2;
  uint64_t v18 = 16LL;
  if ((a2 & 1) != 0) {
    uint64_t v18 = 32LL;
  }
  uint64_t v48 = v8;
  uint64_t v49 = v18;
  while (1)
  {
    if (v14)
    {
      unint64_t v22 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v23 = v22 | (v17 << 6);
      goto LABEL_26;
    }

    int64_t v24 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }

    if (v24 >= v46) {
      break;
    }
    int64_t v25 = v47;
    unint64_t v26 = v47[v24];
    ++v17;
    if (!v26)
    {
      int64_t v17 = v24 + 1;
      if (v24 + 1 >= v46) {
        goto LABEL_35;
      }
      unint64_t v26 = v47[v17];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v46)
        {
LABEL_35:
          swift_release(v8);
          uint64_t v3 = v45;
          if ((v44 & 0x100000000LL) == 0) {
            goto LABEL_42;
          }
          goto LABEL_38;
        }

        unint64_t v26 = v47[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v17 = v27 + 1;
            if (__OFADD__(v27, 1LL)) {
              goto LABEL_44;
            }
            if (v17 >= v46) {
              goto LABEL_35;
            }
            unint64_t v26 = v47[v17];
            ++v27;
            if (v26) {
              goto LABEL_25;
            }
          }
        }

        int64_t v17 = v27;
      }
    }

LABEL_25:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_26:
    uint64_t v28 = *(void *)(v6 + 72);
    uint64_t v29 = v6;
    id v30 = *(void (**)(char *, unint64_t, uint64_t))(v6 + v49);
    uint64_t v31 = v53;
    v30(v52, *(void *)(v8 + 48) + v28 * v23, v53);
    uint64_t v32 = *(void *)(v8 + 56) + 24 * v23;
    int v51 = *(unsigned __int8 *)(v32 + 16);
    uint64_t v33 = *(void *)v32;
    uint64_t v50 = *(void *)(v32 + 8);
    uint64_t v34 = *(void *)(v10 + 40);
    uint64_t v35 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v34, v31, v35);
    uint64_t v36 = -1LL << *(_BYTE *)(v10 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1LL << v37) & ~*(void *)(v15 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v37) & ~*(void *)(v15 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0LL;
      uint64_t v6 = v29;
    }

    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      uint64_t v6 = v29;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }

        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0LL;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v15 + 8 * v38);
      }

      while (v42 == -1);
      unint64_t v19 = __clz(__rbit64(~v42)) + (v38 << 6);
    }

    *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v10 + 48) + v28 * v19,  v52,  v53);
    uint64_t v20 = *(void *)(v10 + 56) + 24 * v19;
    uint64_t v21 = v50;
    *(void *)uint64_t v20 = v33;
    *(void *)(v20 + 8) = v21;
    *(_BYTE *)(v20 + 16) = v51;
    ++*(void *)(v10 + 16);
    uint64_t v8 = v48;
  }

  swift_release(v8);
  uint64_t v3 = v45;
  int64_t v25 = v47;
  if ((v44 & 0x100000000LL) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v43 = 1LL << *(_BYTE *)(v8 + 32);
  if (v43 >= 64) {
    bzero(v25, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *int64_t v25 = -1LL << v43;
  }
  *(void *)(v8 + 16) = 0LL;
LABEL_42:
  uint64_t result = swift_release(v8);
  *uint64_t v3 = v10;
  return result;
}

    uint64_t v43 = (v29 - 1) & v29;
    uint64_t v44 = v30;
    uint64_t v18 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_12:
    uint64_t v20 = *(void *)(v15 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v14, *(void *)(v19 + 48) + v20, v16);
    uint64_t v21 = 32 * v18;
    unint64_t v22 = *(void *)(v19 + 56) + v21;
    int64_t v24 = *(void *)v22;
    unint64_t v23 = *(void *)(v22 + 8);
    unint64_t v45 = *(unsigned __int8 *)(v22 + 16);
    int64_t v25 = *(_BYTE *)(v22 + 17);
    unint64_t v26 = *(void **)(v22 + 24);
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(void *)(v17 + 48) + v20, v14, v16);
    int64_t v27 = *(void *)(v17 + 56) + v21;
    *(void *)int64_t v27 = v24;
    *(void *)(v27 + 8) = v23;
    *(_BYTE *)(v27 + 16) = v45;
    *(_BYTE *)(v27 + 17) = v25;
    *(void *)(v27 + 24) = v26;
    uint64_t result = v26;
    uint64_t v13 = v43;
    uint64_t v10 = v44;
  }

  uint64_t v31 = v10 + 3;
  if (v10 + 3 >= v37)
  {
LABEL_26:
    uint64_t result = (id)swift_release(v41);
    uint64_t v32 = v35;
    uint64_t v33 = v42;
    goto LABEL_28;
  }

  uint64_t v29 = *((void *)v36 + v31);
  if (v29)
  {
    id v30 = v10 + 3;
    goto LABEL_25;
  }

  while (1)
  {
    id v30 = v31 + 1;
    if (__OFADD__(v31, 1LL)) {
      break;
    }
    if (v30 >= v37) {
      goto LABEL_26;
    }
    uint64_t v29 = *((void *)v36 + v30);
    ++v31;
    if (v29) {
      goto LABEL_25;
    }
  }

void (*sub_10000DD20(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v5 = malloc(0x68uLL);
  *a1 = v5;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  v5[8] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[9] = v7;
  uint64_t v8 = malloc(*(void *)(v7 + 64));
  v5[10] = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v8, a2, v6);
  v5[11] = sub_10000EA40(v5);
  v5[12] = sub_10000E8B8(v5 + 4, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
  return sub_10000DDE0;
}

void sub_10000DDE0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 88LL);
  uint64_t v4 = *(void *)(*(void *)a1 + 72LL);
  uint64_t v3 = *(void **)(*(void *)a1 + 80LL);
  uint64_t v5 = *(void *)(*(void *)a1 + 64LL);
  (*(void (**)(uint64_t, void))(*(void *)a1 + 96LL))(*(void *)a1 + 32LL, 0LL);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
  v2(v1, 0LL);
  free(v3);
  free(v1);
}

unint64_t sub_10000DE4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10000E4D8(a1, v7);
}

uint64_t sub_10000DEB0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  unint64_t v5 = sub_10000DE4C(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0) {
    return 0LL;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v8 = *v2;
  uint64_t v14 = *v2;
  uint64_t *v2 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000E610();
    uint64_t v8 = v14;
  }

  uint64_t v9 = *(void *)(v8 + 48);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))( v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * v5,  v10);
  uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 32 * v5);
  sub_10000E24C(v5, v8);
  uint64_t v12 = *v2;
  uint64_t *v2 = v8;
  swift_bridgeObjectRelease(v12);
  return v11;
}

void sub_10000DFCC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

unint64_t sub_10000DFDC()
{
  unint64_t result = qword_1000184B0;
  if (!qword_1000184B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100011794, &type metadata for SessionBuilderError);
    atomic_store(result, (unint64_t *)&qword_1000184B0);
  }

  return result;
}

uint64_t sub_10000E020()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000E044(uint64_t a1, uint64_t a2)
{
  return sub_10000BADC(a1, a2, *(void *)(v2 + 16));
}

ValueMetadata *type metadata accessor for SessionBuilderExtension()
{
  return &type metadata for SessionBuilderExtension;
}

uint64_t getEnumTagSinglePayload for SessionBuilderError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for SessionBuilderError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_10000E138 + 4 * byte_100011677[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000E16C + 4 * byte_100011672[v4]))();
}

uint64_t sub_10000E16C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E174(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000E17CLL);
  }
  return result;
}

uint64_t sub_10000E188(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000E190LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_10000E194(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E19C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SessionBuilderError()
{
  return &type metadata for SessionBuilderError;
}

unint64_t sub_10000E1BC()
{
  unint64_t result = qword_1000184B8;
  if (!qword_1000184B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001176C, &type metadata for SessionBuilderError);
    atomic_store(result, (unint64_t *)&qword_1000184B8);
  }

  return result;
}

unint64_t sub_10000E208()
{
  unint64_t result = qword_1000184C0;
  if (!qword_1000184C0)
  {
    unint64_t result = swift_getWitnessTable("}>", &type metadata for SessionBuilderError);
    atomic_store(result, (unint64_t *)&qword_1000184C0);
  }

  return result;
}

unint64_t sub_10000E24C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v38 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  BOOL v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1LL << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1LL << v10)) != 0)
    {
      unint64_t v37 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v38 + 72);
      uint64_t v36 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
      uint64_t v13 = v11;
      do
      {
        uint64_t v14 = v12;
        int64_t v15 = v12 * v10;
        uint64_t v16 = v13;
        v36(v7, *(void *)(a2 + 48) + v12 * v10, v4);
        uint64_t v17 = *(void *)(a2 + 40);
        uint64_t v18 = sub_10000ECC0(&qword_1000184C8, (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v19 = dispatch thunk of Hashable._rawHashValue(seed:)(v17, v4, v18);
        unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v7, v4);
        uint64_t v13 = v16;
        unint64_t v20 = v19 & v16;
        if (a1 >= (uint64_t)v37)
        {
          if (v20 >= v37 && a1 >= (uint64_t)v20)
          {
LABEL_17:
            uint64_t v23 = *(void *)(a2 + 48);
            unint64_t result = v23 + v14 * a1;
            uint64_t v24 = v23 + v15;
            if (v14 * a1 < v15 || (uint64_t v12 = v14, result >= v24 + v14))
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack(result, v24, 1LL, v4);
LABEL_22:
              uint64_t v13 = v16;
              uint64_t v12 = v14;
            }

            else if (v14 * a1 != v15)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_22;
            }

            uint64_t v25 = *(void *)(a2 + 56);
            unint64_t v26 = (_OWORD *)(v25 + 32 * a1);
            int64_t v27 = (_OWORD *)(v25 + 32 * v10);
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 2))
            {
              __int128 v28 = v27[1];
              *unint64_t v26 = *v27;
              v26[1] = v28;
              a1 = v10;
            }

            goto LABEL_5;
          }
        }

        else if (v20 >= v37 || a1 >= (uint64_t)v20)
        {
          goto LABEL_17;
        }

        uint64_t v12 = v14;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v13;
      }

      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
    }

    uint64_t v29 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1LL << a1) - 1;
  }

  else
  {
    uint64_t v29 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1LL << a1) - 1;
  }

  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1LL);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

unint64_t sub_10000E4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
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
      uint64_t v14 = sub_10000ECC0(&qword_1000184D8, (uint64_t)&protocol conformance descriptor for UUID);
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

id sub_10000E610()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v39 = *(void *)(v1 - 8);
  uint64_t v40 = v1;
  __chkstk_darwin(v1);
  uint64_t v38 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100003C00(&qword_1000184D0);
  uint64_t v35 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v42 = v4;
  if (!v5)
  {
    id result = (id)swift_release(v3);
    uint64_t v33 = v42;
    uint64_t v32 = v35;
LABEL_28:
    uint64_t *v32 = v33;
    return result;
  }

  uint64_t v6 = v4;
  id result = (id)(v4 + 64);
  unint64_t v8 = (unint64_t)((1LL << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  uint64_t v36 = (const void *)(v3 + 64);
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    id result = memmove(result, v36, 8 * v8);
    uint64_t v6 = v42;
  }

  int64_t v10 = 0LL;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v41 = v3;
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = v38;
  uint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  while (1)
  {
    if (v13)
    {
      uint64_t v43 = (v13 - 1) & v13;
      int64_t v44 = v10;
      unint64_t v18 = __clz(__rbit64(v13)) | (v10 << 6);
      uint64_t v19 = v41;
      goto LABEL_12;
    }

    int64_t v28 = v10 + 1;
    uint64_t v19 = v41;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v28 >= v37) {
      goto LABEL_26;
    }
    unint64_t v29 = *((void *)v36 + v28);
    int64_t v30 = v10 + 1;
    if (!v29)
    {
      int64_t v30 = v10 + 2;
      if (v10 + 2 >= v37) {
        goto LABEL_26;
      }
      unint64_t v29 = *((void *)v36 + v30);
      if (!v29) {
        break;
      }
    }

void (*sub_10000E8B8(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  unint64_t v8 = malloc(0x40uLL);
  *a1 = v8;
  v8[4] = a2;
  v8[5] = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_10000DE4C(a2);
  *((_BYTE *)v8 + 56) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }

  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[6] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*v4 + 56) + 32 * v11;
        __int128 v18 = *(_OWORD *)v17;
        uint64_t v19 = *(unsigned __int8 *)(v17 + 16);
        int v20 = *(unsigned __int8 *)(v17 + 17);
        uint64_t v21 = *(void *)(v17 + 24);
        BOOL v22 = v20 == 0;
        uint64_t v23 = 256LL;
        if (v22) {
          uint64_t v23 = 0LL;
        }
        uint64_t v24 = v23 | v19;
        goto LABEL_15;
      }

LABEL_14:
      uint64_t v24 = 0LL;
      __int128 v18 = 0uLL;
      uint64_t v21 = 1LL;
LABEL_15:
      *(_OWORD *)unint64_t v8 = v18;
      v8[2] = v24;
      v8[3] = v21;
      return sub_10000EA00;
    }

    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_10000E610();
      goto LABEL_7;
    }

    sub_10000D1EC(v14, a3 & 1);
    unint64_t v25 = sub_10000DE4C(a2);
    if ((v15 & 1) == (v26 & 1))
    {
      unint64_t v11 = v25;
      v8[6] = v25;
      if ((v15 & 1) != 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }

  uint64_t v28 = type metadata accessor for UUID(0LL);
  id result = (void (*)(uint64_t **))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v28);
  __break(1u);
  return result;
}

void sub_10000EA00(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_10000EA6C(*a1, *((_BYTE *)*a1 + 56), (uint64_t *)(*a1)[5], (*a1)[6], (*a1)[4]);
  sub_10000DFCC(*v1, v1[1], v1[2], (void *)v1[3]);
  free(v1);
}

uint64_t (*sub_10000EA40(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000LL;
  return sub_10000EA60;
}

uint64_t sub_10000EA60(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

id sub_10000EA6C(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = *a1;
  uint64_t v16 = a1[1];
  uint64_t v17 = a1[2];
  __int128 v18 = (void *)a1[3];
  if (v18 == (void *)1)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy(*(void *)(*a3 + 48) + *(void *)(v12 + 72) * a4, 1LL, v11);
      sub_10000E24C(a4, *a3);
    }
  }

  else
  {
    uint64_t v19 = (void *)*a3;
    if ((a2 & 1) != 0)
    {
      uint64_t v20 = v19[7] + 32 * a4;
      *(void *)uint64_t v20 = v15;
      *(void *)(v20 + 8) = v16;
      *(_BYTE *)(v20 + 16) = v17 & 1;
      *(_BYTE *)(v20 + 17) = BYTE1(v17) & 1;
      *(void *)(v20 + 24) = v18;
    }

    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v12 + 16))(v14, a5);
      v22[8] = v17 & 1;
      sub_10000EBB4(a4, (uint64_t)v14, v15, v16, v17 & 0x101, (uint64_t)v18, v19);
    }
  }

  return sub_10000ED00(v15, v16, v17, v18);
}

uint64_t sub_10000EBB4( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, uint64_t a6, void *a7)
{
  a7[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v14 = a7[6];
  uint64_t v15 = type metadata accessor for UUID(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL))( v14 + *(void *)(*(void *)(v15 - 8) + 72LL) * a1,  a2,  v15);
  uint64_t v17 = a7[7] + 32 * a1;
  *(void *)uint64_t v17 = a3;
  *(void *)(v17 + 8) = a4;
  *(_BYTE *)(v17 + 16) = a5 & 1;
  *(_BYTE *)(v17 + 17) = HIBYTE(a5) & 1;
  *(void *)(v17 + 24) = a6;
  uint64_t v18 = a7[2];
  BOOL v19 = __OFADD__(v18, 1LL);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a7[2] = v20;
  }
  return result;
}

unint64_t sub_10000EC78(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100014978, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5) {
    return 5LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000ECC0(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for UUID(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

id sub_10000ED00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return result;
}

uint64_t sub_10000ED10(uint64_t a1)
{
  uint64_t v2 = sub_100003C00(&qword_1000184E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000ED50(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000ED58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003C00(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000ED9C()
{
  if (*(void *)(v0 + 40)) {
    swift_release(*(void *)(v0 + 48));
  }
  return swift_deallocObject(v0, 56LL, 7LL);
}

void sub_10000EDE0(uint64_t a1)
{
}

uint64_t sub_10000EDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000EE00(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000EE08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003C00(&qword_100018500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

__n128 initializeBufferWithCopyOfBuffer for ExecutionStatistics.ActionResults.MappingResult( __n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics.ActionResults.MappingResult(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for ExecutionStatistics.ActionResults.MappingResult( uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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

  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t sub_10000EEB4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000EED0(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    *(_BYTE *)(result + 16) = 1;
  }

  else
  {
    *(_BYTE *)(result + 16) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for ExecutionStatistics.ActionResults.MappingResult()
{
  return &type metadata for ExecutionStatistics.ActionResults.MappingResult;
}

uint64_t initializeBufferWithCopyOfBuffer for ExecutionStatistics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for ExecutionStatistics(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

uint64_t assignWithCopy for ExecutionStatistics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for ExecutionStatistics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ExecutionStatistics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ExecutionStatistics()
{
  return &type metadata for ExecutionStatistics;
}

uint64_t initializeBufferWithCopyOfBuffer for ExecutionStatistics.ActionResults(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for ExecutionStatistics.ActionResults(uint64_t a1)
{
}

uint64_t initializeWithCopy for ExecutionStatistics.ActionResults(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v3;
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ExecutionStatistics.ActionResults(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
  id v4 = (void *)*((void *)a2 + 3);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for ExecutionStatistics.ActionResults(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for ExecutionStatistics.ActionResults(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  __int128 v3 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics.ActionResults(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecutionStatistics.ActionResults( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ExecutionStatistics.ActionResults()
{
  return &type metadata for ExecutionStatistics.ActionResults;
}

void **initializeBufferWithCopyOfBuffer for ExecutionStatistics.ActionResults.ExecutionFailure( void **a1, void **a2)
{
  unint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for ExecutionStatistics.ActionResults.ExecutionFailure(id *a1)
{
}

void **assignWithCopy for ExecutionStatistics.ActionResults.ExecutionFailure(void **a1, void **a2)
{
  unint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void **assignWithTake for ExecutionStatistics.ActionResults.ExecutionFailure(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics.ActionResults.ExecutionFailure(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecutionStatistics.ActionResults.ExecutionFailure( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 8) = 1;
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

    *(_BYTE *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ExecutionStatistics.ActionResults.ExecutionFailure()
{
  return &type metadata for ExecutionStatistics.ActionResults.ExecutionFailure;
}

ValueMetadata *type metadata accessor for ExtensionPreferences()
{
  return &type metadata for ExtensionPreferences;
}

id sub_10000F364()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    if (qword_1000181C0 != -1) {
      swift_once(&qword_1000181C0, sub_10000F7AC);
    }
    uint64_t v3 = type metadata accessor for InternalLogger(0LL);
    sub_100003E30(v3, (uint64_t)qword_100018508);
    v4._uint64_t countAndFlagsBits = 0xD00000000000006ALL;
    v5._object = (void *)0x8000000100011FB0LL;
    v4._object = (void *)0x8000000100011FE0LL;
    v5._uint64_t countAndFlagsBits = 0xD000000000000023LL;
    v6._uint64_t countAndFlagsBits = 0x292874696E69LL;
    v6._object = (void *)0xE600000000000000LL;
    InternalLogger.error(_:fromFile:fromFunction:)(v5, v4, v6);
    return 0LL;
  }

  return v2;
}

Swift::Void __swiftcall InternalLogger.info(_:fromFile:fromFunction:)( Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

Swift::Void __swiftcall InternalLogger.debug(_:fromFile:fromFunction:)( Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

Swift::Void __swiftcall InternalLogger.error(_:fromFile:fromFunction:)( Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

Swift::Void __swiftcall InternalLogger.fault(_:fromFile:fromFunction:)( Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

uint64_t sub_10000F494( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v38 = a5;
  uint64_t v39 = a1;
  uint64_t v36 = a3;
  uint64_t v37 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v37 - 8);
  __chkstk_darwin();
  uint64_t v14 = &v32[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin();
  uint64_t v18 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16))(v18, v7, v15);
  swift_bridgeObjectRetain_n(a4, 2LL);
  swift_bridgeObjectRetain_n(a6, 2LL);
  unint64_t v40 = a2;
  uint64_t v19 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = a7();
  int v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    uint64_t v35 = v16;
    uint64_t v24 = v23;
    uint64_t v34 = swift_slowAlloc(96LL, -1LL);
    uint64_t v42 = v34;
    *(_DWORD *)uint64_t v24 = 136315650;
    uint64_t v25 = URL.init(fileURLWithPath:)(v36, a4);
    int v33 = v22;
    uint64_t v26 = URL.lastPathComponent.getter(v25);
    uint64_t v36 = v15;
    unint64_t v28 = v27;
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v37);
    uint64_t v41 = sub_10000F940(v26, v28, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain(a6);
    uint64_t v41 = sub_10000F940(v38, a6, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 14, v24 + 22);
    swift_bridgeObjectRelease_n(a6, 3LL);
    *(_WORD *)(v24 + 22) = 2080;
    unint64_t v29 = v40;
    swift_bridgeObjectRetain(v40);
    uint64_t v41 = sub_10000F940(v39, v29, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 24, v24 + 32);
    swift_bridgeObjectRelease_n(v29, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v33, "[%s: %s] %s", (uint8_t *)v24, 0x20u);
    uint64_t v30 = v34;
    swift_arrayDestroy(v34, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v35 + 8))(v18, v36);
  }

  else
  {

    swift_bridgeObjectRelease_n(v40, 2LL);
    swift_bridgeObjectRelease_n(a6, 2LL);
    swift_bridgeObjectRelease_n(a4, 2LL);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v16 + 8))(v18, v15);
  }

uint64_t sub_10000F7AC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for InternalLogger(0LL);
  sub_100010248(v4, qword_100018508);
  uint64_t v5 = sub_100003E30(v4, (uint64_t)qword_100018508);
  if (qword_1000181C8 != -1) {
    swift_once(&qword_1000181C8, sub_10000F8E8);
  }
  Logger.init(_:)((id)qword_100019AC0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
}

uint64_t static Logging.plugin.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000181C0 != -1) {
    swift_once(&qword_1000181C0, sub_10000F7AC);
  }
  uint64_t v2 = type metadata accessor for InternalLogger(0LL);
  uint64_t v3 = sub_100003E30(v2, (uint64_t)qword_100018508);
  return sub_100003E68(v3, a1);
}

uint64_t sub_10000F8E8()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000020LL,  0x8000000100011AD0LL,  0x6E6967756C50LL,  0xE600000000000000LL);
  qword_100019AC0 = result;
  return result;
}

uint64_t sub_10000F940(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000FA10(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000102C4((uint64_t)v12, *a3);
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
      sub_1000102C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100003C9C(v12);
  return v7;
}

uint64_t sub_10000FA10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000FBC8(a5, a6);
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

uint64_t sub_10000FBC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000FC5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000FE34(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000FE34(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000FC5C(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_10000FDD0(v4, 0LL);
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

void *sub_10000FDD0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003C00(&qword_1000185B8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000FE34(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100003C00(&qword_1000185B8);
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

uint64_t type metadata accessor for InternalLogger(uint64_t a1)
{
  uint64_t result = qword_100018578;
  if (!qword_100018578) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InternalLogger);
  }
  return result;
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t initializeBufferWithCopyOfBuffer for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for InternalLogger(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t initializeWithCopy for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalLogger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010158);
}

uint64_t sub_100010158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for InternalLogger(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000101A0);
}

uint64_t sub_1000101A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t sub_1000101E0(uint64_t a1)
{
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t *sub_100010248(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100010288()
{
  unint64_t result = qword_1000185B0;
  if (!qword_1000185B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000185B0);
  }

  return result;
}

uint64_t sub_1000102C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}
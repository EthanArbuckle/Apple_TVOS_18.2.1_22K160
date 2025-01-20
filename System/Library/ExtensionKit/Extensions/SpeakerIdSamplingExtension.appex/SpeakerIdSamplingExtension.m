uint64_t sub_100003408(char a1, double a2)
{
  Swift::String v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  Swift::String v8;
  Swift::String v9;
  void v11[2];
  v11[0] = 0LL;
  v11[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(73LL);
  v4._countAndFlagsBits = 0xD00000000000002FLL;
  v4._object = (void *)0x8000000100007410LL;
  String.append(_:)(v4);
  if ((a1 & 1) != 0) {
    v5 = 1702195828LL;
  }
  else {
    v5 = 0x65736C6166LL;
  }
  if ((a1 & 1) != 0) {
    v6 = 0xE400000000000000LL;
  }
  else {
    v6 = 0xE500000000000000LL;
  }
  v7 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease(v6);
  v8._object = (void *)0x8000000100007440LL;
  v8._countAndFlagsBits = 0xD000000000000015LL;
  String.append(_:)(v8);
  Double.write<A>(to:)( v11,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation,  a2);
  v9._countAndFlagsBits = 41LL;
  v9._object = (void *)0xE100000000000000LL;
  String.append(_:)(v9);
  return v11[0];
}

uint64_t sub_100003504(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000011LL;
  }
  else {
    return 0x726150776F6C6C61LL;
  }
}

BOOL sub_100003548(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003560()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000035A4()
{
}

Swift::Int sub_1000035CC(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000360C()
{
  return sub_100003504(*v0);
}

uint64_t sub_100003614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000053A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003638()
{
  return 0LL;
}

void sub_100003644(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003650(uint64_t a1)
{
  unint64_t v2 = sub_10000606C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003678(uint64_t a1)
{
  unint64_t v2 = sub_10000606C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000036A0(void *a1, uint64_t a2, double a3)
{
  uint64_t v7 = sub_1000059C0(&qword_10000C0F0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_100006048(a1, v11);
  unint64_t v13 = sub_10000606C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys,  &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys,  v13,  v11,  v12);
  char v17 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v17, v7);
  if (!v3)
  {
    char v16 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(&v16, v7, a3);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_1000037BC(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100005494(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_1000037EC(void *a1)
{
  return sub_1000036A0(a1, *(unsigned __int8 *)v1, v1[1]);
}

uint64_t sub_100003808()
{
  return sub_100003408(*(_BYTE *)v0, *(double *)(v0 + 8));
}

uint64_t SpeakerIdSamplingExtensionError.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100003854 + 4 * byte_100006BC0[a1]))( 0xD000000000000015LL,  0x8000000100006F80LL);
}

uint64_t sub_100003854()
{
  return v0 + 7;
}

uint64_t sub_100003A2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = SpeakerIdSamplingExtensionError.rawValue.getter(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = SpeakerIdSamplingExtensionError.rawValue.getter(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int sub_100003AB4()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = SpeakerIdSamplingExtensionError.rawValue.getter(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100003B14(uint64_t a1)
{
  uint64_t v3 = SpeakerIdSamplingExtensionError.rawValue.getter(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100003B54(uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = SpeakerIdSamplingExtensionError.rawValue.getter(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_100003BB0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = _s26SpeakerIdSamplingExtension0abcD5ErrorO8rawValueACSgSS_tcfC_0(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_100003BDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SpeakerIdSamplingExtensionError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003C14(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  uint64_t v3 = type metadata accessor for SpeakerIdSamplingWorker(0LL);
  v2[21] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[22] = v4;
  v2[23] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for SpeakerIdSamplingExtension(0LL);
  v2[24] = v5;
  v2[25] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000059C0(&qword_10000C100);
  v2[26] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000059C0(&qword_10000C028);
  v2[27] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[28] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[29] = swift_task_alloc(v9);
  v2[30] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  v2[31] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[32] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[33] = swift_task_alloc(v12);
  v2[34] = swift_task_alloc(v12);
  v2[35] = swift_task_alloc(v12);
  v2[36] = swift_task_alloc(v12);
  v2[37] = swift_task_alloc(v12);
  return swift_task_switch(sub_100003D54, 0LL, 0LL);
}

uint64_t sub_100003D54()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[20];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[32] + 16LL);
  v0[38] = v5;
  v5(v2, v4, v3);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[19];
    unint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v21 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)unint64_t v9 = 138412290;
    v0[18] = v8;
    id v10 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 18, v0 + 19, v9 + 4, v9 + 12);
    void *v21 = v8;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Context: %@", v9, 0xCu);
    uint64_t v11 = sub_1000059C0(&qword_10000C110);
    swift_arrayDestroy(v21, 1LL, v11);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    unint64_t v12 = (void *)v0[19];
  }

  uint64_t v13 = v0[37];
  uint64_t v14 = v0[31];
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0[32] + 8LL);
  v0[39] = v15;
  v15(v13, v14);
  char v16 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  v0[40] = v16;
  uint64_t v17 = sub_100006008(&qword_10000C0E0, (uint64_t)&unk_100006D9C);
  unint64_t v18 = sub_100005E58();
  unint64_t v19 = sub_100005E9C();
  *char v16 = v0;
  v16[1] = sub_100003F48;
  return MLHostExtension.loadConfig<A>(context:)( v0[26],  v0[19],  v0[24],  &type metadata for SpeakerIdSamplingExtensionConfig,  v17,  v18,  v19);
}

uint64_t sub_100003F48()
{
  return swift_task_switch(sub_100003F9C, 0LL, 0LL);
}

uint64_t sub_100003F9C()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);
  sub_1000060B0(*(void *)(v0 + 160), *(void *)(v0 + 200));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 216);
  uint64_t v7 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 208);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))( *(void *)(v0 + 240),  v9 + *(int *)(*(void *)(v0 + 192) + 20LL),  *(void *)(v0 + 216));
    sub_1000060F4(v9);
    sub_100006174(v8, &qword_10000C100);
  }

  else
  {
    sub_1000060F4(*(void *)(v0 + 200));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }

  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v12 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  (*(void (**)(void, void, void))(v0 + 304))( *(void *)(v0 + 288),  *(void *)(v0 + 160),  *(void *)(v0 + 248));
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.info.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v19 = *(void *)(v0 + 288);
  uint64_t v20 = *(void *)(v0 + 248);
  uint64_t v22 = *(void *)(v0 + 224);
  uint64_t v21 = *(void *)(v0 + 232);
  uint64_t v23 = *(void *)(v0 + 216);
  if (v17)
  {
    v44 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v43 = v20;
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    uint64_t v45 = v25;
    *(_DWORD *)v24 = 136315138;
    unint64_t v26 = sub_1000061B0();
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter(v23, v26);
    unint64_t v29 = v28;
    *(void *)(v0 + 136) = sub_100004D60(v27, v28, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v29);
    v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v30(v21, v23);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Configuration: %s", v24, 0xCu);
    swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

    v44(v19, v43);
  }

  else
  {
    v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v30(*(void *)(v0 + 232), *(void *)(v0 + 216));

    v18(v19, v20);
  }

  *(void *)(v0 + 328) = v30;
  uint64_t v31 = *(void *)(v0 + 280);
  uint64_t v32 = *(void *)(v0 + 216);
  (*(void (**)(uint64_t, void, void))(v0 + 304))(v31, *(void *)(v0 + 160), *(void *)(v0 + 248));
  SpeakerIdSamplingWorker.init(logger:)(v31);
  uint64_t v33 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
  *(void *)(v0 + 336) = v33;
  uint64_t v34 = *(void *)(v33 - 8);
  *(void *)(v0 + 344) = v34;
  uint64_t v35 = *(void *)(v34 + 64);
  *(void *)(v0 + 352) = v35;
  unint64_t v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v0 + 360) = swift_task_alloc(v36);
  uint64_t v37 = swift_task_alloc(v36);
  *(void *)(v0 + 368) = v37;
  uint64_t v38 = type metadata accessor for SpeakerIdSamplingTaskExecutor(0LL);
  swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
  uint64_t v39 = SpeakerIdSamplingTaskExecutor.init()();
  *(void *)(v0 + 376) = v39;
  MLHostParameters.taskParameters.getter(v32);
  double v40 = *(double *)(v0 + 104);
  v41 = (void *)swift_task_alloc(async function pointer to SpeakerIdSamplingWorker.doWork(executor:context:durationThreshold:)[1]);
  *(void *)(v0 + 384) = v41;
  void *v41 = v0;
  v41[1] = sub_1000042F0;
  return SpeakerIdSamplingWorker.doWork(executor:context:durationThreshold:)(v37, v39, *(void *)(v0 + 152), v40);
}

uint64_t sub_1000042F0()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 376LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 384LL);
  *(void *)(*(void *)v1 + 392LL) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  if (v0) {
    int v4 = sub_100004784;
  }
  else {
    int v4 = sub_10000435C;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000435C()
{
  uint64_t v2 = *(void *)(v0 + 360);
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 336);
  unint64_t v5 = (*(void *)(v0 + 352) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
  swift_task_dealloc(v1);
  uint64_t v6 = (void *)swift_task_alloc(v5);
  (*(void (**)(void *, uint64_t, uint64_t))(v3 + 16))(v6, v2, v4);
  int v7 = (*(uint64_t (**)(void *, uint64_t))(v3 + 88))(v6, v4);
  v50 = v6;
  if (!&enum case for LighthouseRuntimeProcessorResult.error(_:)
    || v7 != enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    if (!&enum case for LighthouseRuntimeProcessorResult.success(_:)
      || v7 != enum case for LighthouseRuntimeProcessorResult.success(_:))
    {
      if (&enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
        && v7 == enum case for LighthouseRuntimeProcessorResult.cancelled(_:))
      {
        uint64_t v16 = 0LL;
LABEL_22:
        uint64_t v24 = *(void *)(v0 + 360);
        uint64_t v25 = *(void *)(v0 + 336);
        uint64_t v26 = *(void *)(v0 + 344);
        v49 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
        uint64_t v27 = *(void *)(v0 + 240);
        uint64_t v28 = *(void *)(v0 + 216);
        uint64_t v29 = *(void *)(v0 + 176);
        uint64_t v30 = *(void *)(v0 + 184);
        uint64_t v31 = *(void *)(v0 + 168);
        swift_task_dealloc(v50);
        id v32 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
        uint64_t v52 = MLHostResult.init(status:policy:)(v16, 1LL);
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
        (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
        v49(v27, v28);
        goto LABEL_23;
      }

      if (!&enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)
        || v7 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
      {
        BOOL v17 = (void *)(v0 + 336);
        unint64_t v18 = (void (**)(void *, void))(*(void *)(v0 + 344) + 8LL);
        uint64_t v16 = 2LL;
        uint64_t v19 = v6;
LABEL_21:
        (*v18)(v19, *v17);
        goto LABEL_22;
      }
    }

    uint64_t v16 = 2LL;
    goto LABEL_22;
  }

  (*(void (**)(void *, void))(*(void *)(v0 + 344) + 96LL))(v6, *(void *)(v0 + 336));
  uint64_t v8 = *v6;
  if (!*v6) {
    goto LABEL_17;
  }
  *(void *)(v0 + 112) = v8;
  swift_errorRetain(v8);
  uint64_t v9 = sub_1000059C0(&qword_10000C118);
  uint64_t v10 = sub_1000059C0(&qword_10000C120);
  if ((swift_dynamicCast(v0 + 56, v0 + 112, v9, v10, 6LL) & 1) == 0)
  {
    *(void *)(v0 + 88) = 0LL;
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    sub_100006174(v0 + 56, &qword_10000C128);
    goto LABEL_17;
  }

  uint64_t v11 = *(void *)(v0 + 80);
  sub_100006174(v0 + 56, &qword_10000C128);
  if (!v11)
  {
LABEL_17:
    BOOL v17 = (void *)(v0 + 248);
    uint64_t v20 = (*(uint64_t (**)(void, void, void))(v0 + 304))( *(void *)(v0 + 272),  *(void *)(v0 + 160),  *(void *)(v0 + 248));
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "task failed with unset error", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);

      swift_errorRelease(v8);
    }

    else
    {
      swift_errorRelease(v8);
    }

    uint64_t v16 = 0LL;
    unint64_t v18 = (void (**)(void *, void))(v0 + 312);
    uint64_t v19 = *(void **)(v0 + 272);
    goto LABEL_21;
  }

  uint64_t v12 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 344);
  uint64_t v47 = *(void *)(v0 + 240);
  v48 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
  uint64_t v45 = *(void *)(v0 + 360);
  uint64_t v46 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v43 = *(void *)(v0 + 168);
  uint64_t v44 = *(void *)(v0 + 184);
  *(void *)(v0 + 120) = v8;
  swift_errorRetain(v8);
  swift_dynamicCast(v0 + 16, v0 + 120, v9, v10, 7LL);
  id v15 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v52 = MLHostResult.init(error:policy:)(v0 + 16, 1LL);
  swift_errorRelease(v8);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v45, v12);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v44, v43);
  v48(v47, v46);
  swift_task_dealloc(v6);
LABEL_23:
  uint64_t v34 = *(void *)(v0 + 288);
  uint64_t v33 = *(void *)(v0 + 296);
  uint64_t v36 = *(void *)(v0 + 272);
  uint64_t v35 = *(void *)(v0 + 280);
  uint64_t v37 = *(void *)(v0 + 264);
  uint64_t v39 = *(void *)(v0 + 232);
  uint64_t v38 = *(void *)(v0 + 240);
  uint64_t v40 = *(void *)(v0 + 200);
  uint64_t v41 = *(void *)(v0 + 208);
  uint64_t v51 = *(void *)(v0 + 184);
  swift_task_dealloc(*(void *)(v0 + 360));
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v41);
  swift_task_dealloc(v40);
  swift_task_dealloc(v51);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v52);
}

uint64_t sub_100004784()
{
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 248);
  uint64_t v5 = *(void *)(v0 + 160);
  swift_task_dealloc(*(void *)(v0 + 368));
  v2(v3, v5, v4);
  swift_errorRetain(v1);
  uint64_t v6 = swift_errorRetain(v1);
  int v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(v0 + 392);
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v10 = 138412290;
    swift_errorRetain(v9);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError(v9);
    *(void *)(v0 + 128) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v10 + 4, v10 + 12);
    *uint64_t v11 = v12;
    swift_errorRelease(v9);
    swift_errorRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "unexpected error throws: %@", v10, 0xCu);
    uint64_t v13 = sub_1000059C0(&qword_10000C110);
    swift_arrayDestroy(v11, 1LL, v13);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    uint64_t v14 = *(void *)(v0 + 392);
    swift_errorRelease(v14);
    swift_errorRelease(v14);
  }

  id v15 = v7;
  uint64_t v16 = *(void *)(v0 + 392);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
  BOOL v17 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v18 = *(void *)(v0 + 264);
  uint64_t v20 = *(void *)(v0 + 240);
  uint64_t v19 = *(void *)(v0 + 248);
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v23 = *(void *)(v0 + 176);
  uint64_t v22 = *(void *)(v0 + 184);
  uint64_t v24 = *(void *)(v0 + 168);

  v17(v18, v19);
  uint64_t v40 = &type metadata for SpeakerIdSamplingExtensionError;
  unint64_t v41 = sub_100006130();
  v39[0] = 1;
  id v25 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v38 = MLHostResult.init(error:policy:)(v39, 1LL);
  swift_errorRelease(v16);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  v36(v20, v21);
  uint64_t v27 = *(void *)(v0 + 288);
  uint64_t v26 = *(void *)(v0 + 296);
  uint64_t v29 = *(void *)(v0 + 272);
  uint64_t v28 = *(void *)(v0 + 280);
  uint64_t v30 = *(void *)(v0 + 264);
  uint64_t v32 = *(void *)(v0 + 232);
  uint64_t v31 = *(void *)(v0 + 240);
  uint64_t v33 = *(void *)(v0 + 200);
  uint64_t v34 = *(void *)(v0 + 208);
  uint64_t v37 = *(void *)(v0 + 184);
  swift_task_dealloc(*(void *)(v0 + 360));
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  swift_task_dealloc(v33);
  swift_task_dealloc(v37);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v38);
}

uint64_t sub_100004A34()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C140 + dword_10000C140);
  uint64_t v1 = (void *)swift_task_alloc(unk_10000C144);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006748;
  return v3();
}

uint64_t sub_100004A8C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10000C0FC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004AD8;
  return sub_100003C14(a1);
}

uint64_t sub_100004AD8(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100004B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_100004BC4;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004BC4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100004C0C(uint64_t a1)
{
  uint64_t v2 = sub_100006008(&qword_10000C0E0, (uint64_t)&unk_100006D9C);
  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100004C54@<X0>(void *a1@<X8>)
{
  v4[0] = 0;
  uint64_t v5 = 0x4024000000000000LL;
  unint64_t v1 = sub_100005E58();
  unint64_t v2 = sub_100005E9C();
  return MLHostParameters.init(taskParameters:)(v4, &type metadata for SpeakerIdSamplingExtensionConfig, v1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for SpeakerIdSamplingExtension(0LL);
  uint64_t v4 = sub_100006008(&qword_10000C000, (uint64_t)&unk_100006E2C);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t sub_100004D60(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004E30(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006260((uint64_t)v12, *a3);
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
      sub_100006260((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006240(v12);
  return v7;
}

uint64_t sub_100004E30(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100004FE8(a5, a6);
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

uint64_t sub_100004FE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000507C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005254(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005254(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000507C(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_1000051F0(v4, 0LL);
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

void *sub_1000051F0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000059C0(&qword_10000C138);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005254(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000059C0(&qword_10000C138);
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

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1000053A0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61LL && a2 == 0xEC0000006C616974LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x726150776F6C6C61LL, 0xEC0000006C616974LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0xD000000000000011LL && a2 == 0x8000000100007460LL)
  {
    swift_bridgeObjectRelease(0x8000000100007460LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100007460LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

double sub_100005494(void *a1)
{
  uint64_t v4 = sub_1000059C0(&qword_10000C0E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100006048(a1, v8);
  unint64_t v10 = sub_10000606C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys,  &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys,  v10,  v8,  v9);
  if (!v1)
  {
    char v14 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v14, v4);
    char v13 = 1;
    double v2 = KeyedDecodingContainer.decode(_:forKey:)(&v13, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_100006240(a1);
  return v2;
}

uint64_t _s26SpeakerIdSamplingExtension0abcD5ErrorO8rawValueACSgSS_tcfC_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_1000084A8, a1, a2, &unk_10000C150);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x15) {
    return 21LL;
  }
  else {
    return v3;
  }
}

uint64_t type metadata accessor for SpeakerIdSamplingExtension(uint64_t a1)
{
  uint64_t result = qword_10000C3E0;
  if (!qword_10000C3E0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SpeakerIdSamplingExtension);
  }
  return result;
}

unint64_t sub_100005678()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SpeakerIdSamplingExtensionError,  &type metadata for SpeakerIdSamplingExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }

  return result;
}

unint64_t sub_1000056C0()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SpeakerIdSamplingExtensionError,  &type metadata for SpeakerIdSamplingExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }

  return result;
}

unint64_t sub_100005708()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SpeakerIdSamplingExtensionError,  &type metadata for SpeakerIdSamplingExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }

  return result;
}

unint64_t sub_100005750()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for SpeakerIdSamplingExtensionError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpeakerIdSamplingExtensionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
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

uint64_t storeEnumTagSinglePayload for SpeakerIdSamplingExtensionError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xEB) {
    return ((uint64_t (*)(void))((char *)&loc_100005880 + 4 * byte_100006BDA[v4]))();
  }
  *a1 = a2 + 20;
  return ((uint64_t (*)(void))((char *)sub_1000058B4 + 4 * byte_100006BD5[v4]))();
}

uint64_t sub_1000058B4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000058BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000058C4LL);
  }
  return result;
}

uint64_t sub_1000058D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000058D8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 20;
  return result;
}

uint64_t sub_1000058DC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000058E4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000058F0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000058FC(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdSamplingExtensionError()
{
  return &type metadata for SpeakerIdSamplingExtensionError;
}

uint64_t *sub_100005914(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for Logger(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000059C0(&qword_10000C028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_1000059C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005A00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1000059C0(&qword_10000C028);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_100005A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000059C0(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000059C0(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000059C0(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000059C0(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005C6C);
}

uint64_t sub_100005C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = sub_1000059C0(&qword_10000C028);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_100005CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005CF0);
}

uint64_t sub_100005CF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = sub_1000059C0(&qword_10000C028);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100005D70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_100005DF4(319LL);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v6, a1 + 16);
    }
  }

void sub_100005DF4(uint64_t a1)
{
  if (!qword_10000C088)
  {
    unint64_t v2 = sub_100005E58();
    unint64_t v3 = sub_100005E9C();
    unint64_t v4 = type metadata accessor for MLHostParameters(a1, &type metadata for SpeakerIdSamplingExtensionConfig, v2, v3);
    if (!v5) {
      atomic_store(v4, (unint64_t *)&qword_10000C088);
    }
  }

unint64_t sub_100005E58()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable(&unk_100006E04, &type metadata for SpeakerIdSamplingExtensionConfig);
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }

  return result;
}

unint64_t sub_100005E9C()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable(&unk_100006DDC, &type metadata for SpeakerIdSamplingExtensionConfig);
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }

  return result;
}

__n128 initializeBufferWithCopyOfBuffer for SpeakerIdSamplingExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(_BYTE *)__n128 result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdSamplingExtensionConfig()
{
  return &type metadata for SpeakerIdSamplingExtensionConfig;
}

uint64_t sub_100005F90()
{
  return sub_100006008(&qword_10000C000, (uint64_t)&unk_100006E2C);
}

uint64_t sub_100005FB4(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100006008(&qword_10000C0E0, (uint64_t)&unk_100006D9C);
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

uint64_t sub_100006008(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for SpeakerIdSamplingExtension(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_100006048(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_10000606C()
{
  unint64_t result = qword_10000C670[0];
  if (!qword_10000C670[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100006F30, &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C670);
  }

  return result;
}

uint64_t sub_1000060B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpeakerIdSamplingExtension(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000060F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpeakerIdSamplingExtension(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100006130()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SpeakerIdSamplingExtensionError,  &type metadata for SpeakerIdSamplingExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }

  return result;
}

uint64_t sub_100006174(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000059C0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_1000061B0()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    uint64_t v1 = sub_1000061FC(&qword_10000C028);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for MLHostParameters<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }

  return result;
}

uint64_t sub_1000061FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006240(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006260(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000062A0()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  unint64_t v4 = (*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[5] = swift_task_alloc(v4);
  v1[6] = swift_task_alloc(v4);
  v1[7] = swift_task_alloc(v4);
  return swift_task_switch(sub_10000631C, 0LL, 0LL);
}

uint64_t sub_10000631C()
{
  if (!isOnDeviceSiriMetricsEnabled()())
  {
    uint64_t v2 = (uint64_t *)(v0 + 56);
    uint64_t v3 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 32) + 16LL))( *(void *)(v0 + 56),  *(void *)(v0 + 16),  *(void *)(v0 + 24));
    unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_12;
    }
    uint64_t v6 = "Siri on device metrics disabled. Not continuing.";
LABEL_11:
    uint64_t v9 = *v2;
    uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, v6, v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
LABEL_13:
    uint64_t v11 = *(void *)(v0 + 24);
    uint64_t v12 = *(void *)(v0 + 32);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
    uint64_t v1 = 1LL;
    goto LABEL_14;
  }

  type metadata accessor for ExtensionsUtils(0LL);
  if ((static ExtensionsUtils.isAssistantOrDictationEnabled()() & 1) == 0)
  {
    uint64_t v2 = (uint64_t *)(v0 + 48);
    uint64_t v7 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 32) + 16LL))( *(void *)(v0 + 48),  *(void *)(v0 + 16),  *(void *)(v0 + 24));
    unint64_t v4 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_12;
    }
    uint64_t v6 = "Neither assistant nor dictation enabled. Not allowed to process.";
    goto LABEL_11;
  }

  if ((static ExtensionsUtils.isSiriDataSharingOptIn()() & 1) == 0)
  {
    uint64_t v2 = (uint64_t *)(v0 + 40);
    uint64_t v8 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 32) + 16LL))( *(void *)(v0 + 40),  *(void *)(v0 + 16),  *(void *)(v0 + 24));
    unint64_t v4 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = "Siri Data Sharing status is not Opted-In. Not allowed to process.";
      goto LABEL_11;
    }

LABEL_12:
    uint64_t v9 = *v2;
    goto LABEL_13;
  }

  uint64_t v1 = 0LL;
LABEL_14:
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v13 = *(void *)(v0 + 56);
  uint64_t v15 = *(void *)(v0 + 40);
  id v16 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v17 = MLHostResult.init(status:policy:)(2LL, v1);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t getEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig.CodingKeys( unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SpeakerIdSamplingExtensionConfig.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000065E4 + 4 * byte_100006BE4[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100006618 + 4 * byte_100006BDF[v4]))();
}

uint64_t sub_100006618(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006620(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006628LL);
  }
  return result;
}

uint64_t sub_100006634(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000663CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100006640(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006648(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100006654(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdSamplingExtensionConfig.CodingKeys()
{
  return &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys;
}

unint64_t sub_100006674()
{
  unint64_t result = qword_10000C780[0];
  if (!qword_10000C780[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100006F08, &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C780);
  }

  return result;
}

unint64_t sub_1000066BC()
{
  unint64_t result = qword_10000C890;
  if (!qword_10000C890)
  {
    unint64_t result = swift_getWitnessTable("\t\x1B", &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C890);
  }

  return result;
}

unint64_t sub_100006704()
{
  unint64_t result = qword_10000C898[0];
  if (!qword_10000C898[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100006EA0, &type metadata for SpeakerIdSamplingExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C898);
  }

  return result;
}
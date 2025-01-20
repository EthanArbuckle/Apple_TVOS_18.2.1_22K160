uint64_t sub_1000034D0(char a1, double a2)
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
  _StringGuts.grow(_:)(68LL);
  v4._countAndFlagsBits = 0xD00000000000002ALL;
  v4._object = (void *)0x8000000100007680LL;
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
  v8._object = (void *)0x80000001000076B0LL;
  v8._countAndFlagsBits = 0xD000000000000015LL;
  String.append(_:)(v8);
  Double.write<A>(to:)( v11,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation,  a2);
  v9._countAndFlagsBits = 41LL;
  v9._object = (void *)0xE100000000000000LL;
  String.append(_:)(v9);
  return v11[0];
}

uint64_t sub_1000035CC(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000011LL;
  }
  else {
    return 0x726150776F6C6C61LL;
  }
}

BOOL sub_100003610(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003628()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000366C()
{
}

Swift::Int sub_100003694(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000036D4()
{
  return sub_1000035CC(*v0);
}

uint64_t sub_1000036DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000062E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003700()
{
  return 0LL;
}

void sub_10000370C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003718(uint64_t a1)
{
  unint64_t v2 = sub_100006550();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003740(uint64_t a1)
{
  unint64_t v2 = sub_100006550();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003768(void *a1, uint64_t a2, double a3)
{
  uint64_t v7 = sub_1000054BC(&qword_10000C110);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_10000652C(a1, v11);
  unint64_t v13 = sub_100006550();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for AssetMetricsExtensionConfig.CodingKeys,  &type metadata for AssetMetricsExtensionConfig.CodingKeys,  v13,  v11,  v12);
  char v17 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v17, v7);
  if (!v3)
  {
    char v16 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(&v16, v7, a3);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_100003884(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_1000063D8(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_1000038B4(void *a1)
{
  return sub_100003768(a1, *(unsigned __int8 *)v1, v1[1]);
}

uint64_t sub_1000038D0()
{
  return sub_1000034D0(*(_BYTE *)v0, *(double *)(v0 + 8));
}

BOOL AssetMetricsExtensionError.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000084D8, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

unint64_t AssetMetricsExtensionError.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_10000393C()
{
  return 1LL;
}

Swift::Int sub_100003944()
{
  return Hasher._finalize()();
}

uint64_t sub_100003998(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD00000000000001CLL, 0x80000001000073F0LL);
}

Swift::Int sub_1000039B4(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100003A04@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  char v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008510, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100003A54(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000001000073F0LL;
}

uint64_t sub_100003A84(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = type metadata accessor for AssetMetricsWorker(0LL);
  void v2[9] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[10] = v4;
  v2[11] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for AssetMetricsExtension(0LL);
  v2[12] = v5;
  v2[13] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000054BC(&qword_10000C120);
  v2[14] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000054BC(&qword_10000C040);
  v2[15] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[16] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[17] = swift_task_alloc(v9);
  v2[18] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  v2[19] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[20] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[21] = swift_task_alloc(v12);
  v2[22] = swift_task_alloc(v12);
  v2[23] = swift_task_alloc(v12);
  v2[24] = swift_task_alloc(v12);
  v2[25] = swift_task_alloc(v12);
  v2[26] = swift_task_alloc(v12);
  v2[27] = swift_task_alloc(v12);
  return swift_task_switch(sub_100003BDC, 0LL, 0LL);
}

uint64_t sub_100003BDC()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v6 = *(int *)(*(void *)(v0 + 96) + 20LL);
  *(_DWORD *)(v0 + 304) = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 224) = v7;
  v7(v2, v5 + v6, v3);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 56);
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v23 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v11 = 138412290;
    *(void *)(v0 + 48) = v10;
    id v12 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v11 + 4, v11 + 12);
    void *v23 = v10;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Context: %@", v11, 0xCu);
    uint64_t v13 = sub_1000054BC(&qword_10000C130);
    swift_arrayDestroy(v23, 1LL, v13);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {
    v14 = *(void **)(v0 + 56);
  }

  uint64_t v15 = *(void *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 152);
  char v17 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 160) + 8LL);
  *(void *)(v0 + 232) = v17;
  v17(v15, v16);
  v18 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v0 + 240) = v18;
  uint64_t v19 = sub_100005C64(&qword_10000C100, (uint64_t)&unk_100007224);
  unint64_t v20 = sub_100005AB4();
  unint64_t v21 = sub_100005AF8();
  void *v18 = v0;
  v18[1] = sub_100003DE0;
  return MLHostExtension.loadConfig<A>(context:)( *(void *)(v0 + 112),  *(void *)(v0 + 56),  *(void *)(v0 + 96),  &type metadata for AssetMetricsExtensionConfig,  v19,  v20,  v21);
}

uint64_t sub_100003DE0()
{
  return swift_task_switch(sub_100003E34, 0LL, 0LL);
}

uint64_t sub_100003E34()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  sub_100006594(*(void *)(v0 + 64), *(void *)(v0 + 104));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))( *(void *)(v0 + 144),  v9 + *(int *)(*(void *)(v0 + 96) + 24LL),  *(void *)(v0 + 120));
    sub_1000065D8(v9);
    sub_100006748(v8, &qword_10000C120);
  }

  else
  {
    sub_1000065D8(*(void *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }

  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v13 = *(void *)(v0 + 120);
  (*(void (**)(void, void, void))(v0 + 224))( *(void *)(v0 + 208),  *(void *)(v0 + 64) + *(int *)(v0 + 304),  *(void *)(v0 + 152));
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.info.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  v18 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 208);
  uint64_t v20 = *(void *)(v0 + 152);
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v21 = *(void *)(v0 + 136);
  uint64_t v23 = *(void *)(v0 + 120);
  if (v17)
  {
    v86 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v84 = v20;
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    uint64_t v88 = v25;
    *(_DWORD *)v24 = 136315138;
    unint64_t v26 = sub_100006658();
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter(v23, v26);
    unint64_t v29 = v28;
    *(void *)(v0 + 40) = sub_100005CA4(v27, v28, &v88);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v29);
    v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v30(v21, v23);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Configuration: %s", v24, 0xCu);
    swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

    v86(v19, v84);
  }

  else
  {
    v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v30(*(void *)(v0 + 136), *(void *)(v0 + 120));

    v18(v19, v20);
  }

  *(void *)(v0 + 248) = v30;
  uint64_t v31 = (*(uint64_t (**)(void, void, void))(v0 + 224))( *(void *)(v0 + 200),  *(void *)(v0 + 64) + *(int *)(v0 + 304),  *(void *)(v0 + 152));
  v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Running AssetMetricsExtension..", v34, 2u);
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  v35 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v36 = *(void *)(v0 + 200);
  uint64_t v37 = *(void *)(v0 + 152);

  v35(v36, v37);
  v38 = (void *)objc_opt_self(&OBJC_CLASS___AFPreferences);
  id v39 = [v38 sharedPreferences];
  LOBYTE(v37) = [v39 assistantIsEnabled];

  if ((v37 & 1) != 0
    || (id v40 = [v38 sharedPreferences],
        unsigned __int8 v41 = [v40 dictationIsEnabled],
        v40,
        (v41 & 1) != 0))
  {
    uint64_t v42 = (*(uint64_t (**)(void, void, void))(v0 + 224))( *(void *)(v0 + 184),  *(void *)(v0 + 64) + *(int *)(v0 + 304),  *(void *)(v0 + 152));
    v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Assistant or dictation enabled. Continuing.", v45, 2u);
      swift_slowDealloc(v45, -1LL, -1LL);
    }

    v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
    v47 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    uint64_t v48 = *(int *)(v0 + 304);
    uint64_t v50 = *(void *)(v0 + 176);
    uint64_t v49 = *(void *)(v0 + 184);
    uint64_t v51 = *(void *)(v0 + 152);
    uint64_t v82 = *(void *)(v0 + 120);
    uint64_t v52 = *(void *)(v0 + 64);

    v47(v49, v51);
    v46(v50, v52 + v48, v51);
    AssetMetricsWorker.init(logger:)(v50);
    uint64_t v53 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
    *(void *)(v0 + 256) = v53;
    uint64_t v54 = *(void *)(v53 - 8);
    *(void *)(v0 + 264) = v54;
    uint64_t v55 = swift_task_alloc((*(void *)(v54 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    *(void *)(v0 + 272) = v55;
    uint64_t v56 = type metadata accessor for AssetMetricsExecutor(0LL);
    swift_allocObject(v56, *(unsigned int *)(v56 + 48), *(unsigned __int16 *)(v56 + 52));
    uint64_t v57 = AssetMetricsExecutor.init()();
    *(void *)(v0 + 280) = v57;
    MLHostParameters.taskParameters.getter(v82);
    double v58 = *(double *)(v0 + 24);
    v59 = (void *)swift_task_alloc(async function pointer to AssetMetricsWorker.doWork(executor:context:durationThreshold:)[1]);
    *(void *)(v0 + 288) = v59;
    void *v59 = v0;
    v59[1] = sub_1000044FC;
    return AssetMetricsWorker.doWork(executor:context:durationThreshold:)(v55, v57, *(void *)(v0 + 56), v58);
  }

  else
  {
    uint64_t v61 = (*(uint64_t (**)(void, void, void))(v0 + 224))( *(void *)(v0 + 192),  *(void *)(v0 + 64) + *(int *)(v0 + 304),  *(void *)(v0 + 152));
    v62 = (os_log_s *)Logger.logObject.getter(v61);
    os_log_type_t v63 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v64 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  v63,  "Neither assistant nor dictation enabled. Not allowed to process.",  v64,  2u);
      swift_slowDealloc(v64, -1LL, -1LL);
    }

    v65 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    uint64_t v66 = *(void *)(v0 + 192);
    uint64_t v68 = *(void *)(v0 + 144);
    uint64_t v67 = *(void *)(v0 + 152);
    uint64_t v69 = *(void *)(v0 + 120);

    v65(v66, v67);
    uint64_t v70 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
    uint64_t v71 = *(void *)(v70 - 8);
    uint64_t v72 = swift_task_alloc((*(void *)(v71 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(uint64_t, void, uint64_t))(v71 + 104))( v72,  enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:),  v70);
    uint64_t v87 = sub_100004934(v72);
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v70);
    v30(v68, v69);
    swift_task_dealloc(v72);
    uint64_t v73 = *(void *)(v0 + 208);
    uint64_t v75 = *(void *)(v0 + 192);
    uint64_t v74 = *(void *)(v0 + 200);
    uint64_t v77 = *(void *)(v0 + 176);
    uint64_t v76 = *(void *)(v0 + 184);
    uint64_t v78 = *(void *)(v0 + 168);
    uint64_t v80 = *(void *)(v0 + 136);
    uint64_t v79 = *(void *)(v0 + 144);
    uint64_t v81 = *(void *)(v0 + 112);
    uint64_t v83 = *(void *)(v0 + 104);
    uint64_t v85 = *(void *)(v0 + 88);
    swift_task_dealloc(*(void *)(v0 + 216));
    swift_task_dealloc(v73);
    swift_task_dealloc(v74);
    swift_task_dealloc(v75);
    swift_task_dealloc(v76);
    swift_task_dealloc(v77);
    swift_task_dealloc(v78);
    swift_task_dealloc(v79);
    swift_task_dealloc(v80);
    swift_task_dealloc(v81);
    swift_task_dealloc(v83);
    swift_task_dealloc(v85);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v87);
  }

uint64_t sub_1000044FC()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 280LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 288LL);
  *(void *)(*(void *)v1 + 296LL) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  if (v0) {
    int v4 = sub_100004690;
  }
  else {
    int v4 = sub_100004568;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100004568()
{
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v22 = sub_100004934(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v20(v4, v5);
  swift_task_dealloc(v1);
  uint64_t v9 = *(void *)(v0 + 208);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v10 = *(void *)(v0 + 200);
  uint64_t v13 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 136);
  uint64_t v15 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 112);
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v21 = *(void *)(v0 + 88);
  swift_task_dealloc(*(void *)(v0 + 216));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v22);
}

uint64_t sub_100004690()
{
  uint64_t v1 = *(void *)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 64) + *(int *)(v0 + 304);
  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8LL))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  swift_task_dealloc(v2);
  v3(v4, v6, v5);
  swift_errorRetain(v1);
  uint64_t v7 = swift_errorRetain(v1);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void *)(v0 + 296);
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v11 = 138412290;
    swift_errorRetain(v10);
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError(v10);
    *(void *)(v0 + 32) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v11 + 4, v11 + 12);
    *uint64_t v12 = v13;
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "unexpected error throws: %@", v11, 0xCu);
    uint64_t v14 = sub_1000054BC(&qword_10000C130);
    swift_arrayDestroy(v12, 1LL, v14);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {
    uint64_t v15 = *(void *)(v0 + 296);
    swift_errorRelease(v15);
    swift_errorRelease(v15);
  }

  uint64_t v16 = *(void *)(v0 + 296);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
  v18 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 168);
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v20 = *(void *)(v0 + 152);
  uint64_t v22 = *(void *)(v0 + 120);

  v18(v19, v20);
  v38 = &type metadata for AssetMetricsExtensionError;
  unint64_t v39 = sub_100006614();
  id v23 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v36 = MLHostResult.init(error:policy:)(v37, 1LL);
  swift_errorRelease(v16);
  v17(v21, v22);
  uint64_t v24 = *(void *)(v0 + 208);
  uint64_t v26 = *(void *)(v0 + 192);
  uint64_t v25 = *(void *)(v0 + 200);
  uint64_t v28 = *(void *)(v0 + 176);
  uint64_t v27 = *(void *)(v0 + 184);
  uint64_t v29 = *(void *)(v0 + 168);
  uint64_t v31 = *(void *)(v0 + 136);
  uint64_t v30 = *(void *)(v0 + 144);
  uint64_t v32 = *(void *)(v0 + 112);
  uint64_t v34 = *(void *)(v0 + 104);
  uint64_t v35 = *(void *)(v0 + 88);
  swift_task_dealloc(*(void *)(v0 + 216));
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v36);
}

uint64_t sub_100004934(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v54 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v48 - v7;
  uint64_t v9 = v1 + *(int *)(type metadata accessor for AssetMetricsExtension(0LL) + 20);
  uint64_t v55 = v4;
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v52 = v9;
  uint64_t v53 = v10;
  ((void (*)(char *))v10)(v8);
  uint64_t v11 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  unint64_t v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v15 = (char *)v48 - v14;
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v56 = a1;
  uint64_t v57 = v16;
  uint64_t v17 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)((char *)v48 - v14, a1, v11);
  v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc(12LL, -1LL);
    uint64_t v51 = v3;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    v48[1] = v48;
    v62[0] = v22;
    uint64_t v50 = v21;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v49 = v21 + 4;
    __chkstk_darwin(v22);
    id v23 = (char *)v48 - v14;
    v57(v23, v15, v11);
    uint64_t v24 = String.init<A>(describing:)(v23, v11);
    unint64_t v26 = v25;
    *(void *)&__int128 v59 = sub_100005CA4(v24, v25, v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, (char *)&v59 + 8, v49, v21 + 12);
    swift_bridgeObjectRelease(v26);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v15, v11);
    uint64_t v28 = v50;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Handling result %s", v50, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    uint64_t v3 = v51;
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v15, v11);
  }

  uint64_t v29 = *(uint64_t (**)(char *, uint64_t))(v55 + 8);
  uint64_t v30 = v29(v8, v3);
  __chkstk_darwin(v30);
  uint64_t v31 = (void *)((char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v32(v31);
  int v33 = (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 88))(v31, v11);
  if (!&enum case for LighthouseRuntimeProcessorResult.error(_:)
    || v33 != enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    if (!&enum case for LighthouseRuntimeProcessorResult.success(_:)
      || v33 != enum case for LighthouseRuntimeProcessorResult.success(_:))
    {
      if (&enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
        && v33 == enum case for LighthouseRuntimeProcessorResult.cancelled(_:))
      {
LABEL_24:
        uint64_t v41 = 0LL;
        goto LABEL_25;
      }

      if (!&enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)
        || v33 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
      {
        v27((char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL), v11);
      }
    }

    uint64_t v41 = 2LL;
LABEL_25:
    id v46 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    return MLHostResult.init(status:policy:)(v41, 1LL);
  }

  (*(void (**)(char *, uint64_t))(v12 + 96))((char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL), v11);
  uint64_t v34 = *v31;
  if (!*v31)
  {
    uint64_t v61 = 0LL;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    v38 = v54;
    goto LABEL_20;
  }

  uint64_t v58 = *v31;
  swift_errorRetain(v34);
  uint64_t v35 = sub_1000054BC(&qword_10000C150);
  uint64_t v36 = sub_1000054BC(&qword_10000C158);
  char v37 = swift_dynamicCast(&v59, &v58, v35, v36, 6LL);
  v38 = v54;
  if ((v37 & 1) == 0)
  {
    uint64_t v61 = 0LL;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    goto LABEL_20;
  }

  if (!*((void *)&v60 + 1))
  {
LABEL_20:
    sub_100006748((uint64_t)&v59, &qword_10000C148);
    uint64_t v42 = v53(v38, v52, v3);
    v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "task failed with unset error", v45, 2u);
      swift_slowDealloc(v45, -1LL, -1LL);

      swift_errorRelease(v34);
    }

    else
    {
      swift_errorRelease(v34);
    }

    v29(v38, v3);
    goto LABEL_24;
  }

  sub_100006784(&v59, (uint64_t)v62);
  sub_10000679C((uint64_t)v62, (uint64_t)&v59);
  id v39 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v40 = MLHostResult.init(error:policy:)(&v59, 1LL);
  swift_errorRelease(v34);
  sub_1000066E8(v62);
  return v40;
}

uint64_t sub_100004E4C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C160 + dword_10000C160);
  uint64_t v1 = (void *)swift_task_alloc(unk_10000C164);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006BB8;
  return v3();
}

uint64_t sub_100004EA4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10000C11C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004EF0;
  return sub_100003A84(a1);
}

uint64_t sub_100004EF0(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100004F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100004FDC;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004FDC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005024(uint64_t a1)
{
  uint64_t v2 = sub_100005C64(&qword_10000C100, (uint64_t)&unk_100007224);
  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_10000506C()
{
  v3[0] = 0;
  uint64_t v4 = 0x4024000000000000LL;
  unint64_t v0 = sub_100005AB4();
  unint64_t v1 = sub_100005AF8();
  return MLHostParameters.init(taskParameters:)(v3, &type metadata for AssetMetricsExtensionConfig, v0, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for AssetMetricsExtension(0LL);
  uint64_t v4 = sub_100005C64(&qword_10000C018, (uint64_t)&unk_1000072B4);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for AssetMetricsExtension(uint64_t a1)
{
  uint64_t result = qword_10000C3F0;
  if (!qword_10000C3F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AssetMetricsExtension);
  }
  return result;
}

unint64_t sub_1000051C0()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AssetMetricsExtensionError,  &type metadata for AssetMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }

  return result;
}

unint64_t sub_100005208()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AssetMetricsExtensionError,  &type metadata for AssetMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }

  return result;
}

unint64_t sub_100005250()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AssetMetricsExtensionError,  &type metadata for AssetMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }

  return result;
}

unint64_t sub_100005298()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for AssetMetricsExtensionError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AssetMetricsExtensionError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100005374 + 4 * byte_100007070[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100005394 + 4 * byte_100007075[v4]))();
  }
}

_BYTE *sub_100005374(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_100005394(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000539C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000053A4(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000053AC(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000053B4(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_1000053C0()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for AssetMetricsExtensionError()
{
  return &type metadata for AssetMetricsExtensionError;
}

uint64_t *sub_1000053DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for Calendar(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Logger(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    unint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_1000054BC(&qword_10000C040);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
  }

  return a1;
}

uint64_t sub_1000054BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000054FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Calendar(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_1000054BC(&qword_10000C040);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
}

uint64_t sub_100005588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1000054BC(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
  return a1;
}

uint64_t sub_10000563C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1000054BC(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24LL))(v12, v13, v14);
  return a1;
}

uint64_t sub_1000056F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1000054BC(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
  return a1;
}

uint64_t sub_1000057A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1000054BC(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  return a1;
}

uint64_t sub_100005858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005864);
}

uint64_t sub_100005864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      uint64_t v8 = v11;
      uint64_t v13 = *(int *)(a3 + 20);
    }

    else
    {
      uint64_t v8 = sub_1000054BC(&qword_10000C040);
      uint64_t v12 = *(void *)(v8 - 8);
      uint64_t v13 = *(int *)(a3 + 24);
    }

    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_100005900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000590C);
}

uint64_t sub_10000590C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Calendar(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v13 = type metadata accessor for Logger(0LL);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v15 = *(int *)(a4 + 20);
    }

    else
    {
      uint64_t v10 = sub_1000054BC(&qword_10000C040);
      uint64_t v14 = *(void *)(v10 - 8);
      uint64_t v15 = *(int *)(a4 + 24);
    }

    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_1000059B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar(319LL);
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(v2 - 8) + 64LL;
    uint64_t v4 = type metadata accessor for Logger(319LL);
    if (v5 <= 0x3F)
    {
      v8[1] = *(void *)(v4 - 8) + 64LL;
      sub_100005A50(319LL);
      if (v7 <= 0x3F)
      {
        v8[2] = *(void *)(v6 - 8) + 64LL;
        swift_initStructMetadata(a1, 256LL, 3LL, v8, a1 + 16);
      }
    }
  }

void sub_100005A50(uint64_t a1)
{
  if (!qword_10000C0A0)
  {
    unint64_t v2 = sub_100005AB4();
    unint64_t v3 = sub_100005AF8();
    unint64_t v4 = type metadata accessor for MLHostParameters(a1, &type metadata for AssetMetricsExtensionConfig, v2, v3);
    if (!v5) {
      atomic_store(v4, (unint64_t *)&qword_10000C0A0);
    }
  }

unint64_t sub_100005AB4()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000728C, &type metadata for AssetMetricsExtensionConfig);
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }

  return result;
}

unint64_t sub_100005AF8()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007264, &type metadata for AssetMetricsExtensionConfig);
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }

  return result;
}

__n128 initializeBufferWithCopyOfBuffer for AssetMetricsExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssetMetricsExtensionConfig(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AssetMetricsExtensionConfig( uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AssetMetricsExtensionConfig()
{
  return &type metadata for AssetMetricsExtensionConfig;
}

uint64_t sub_100005BEC()
{
  return sub_100005C64(&qword_10000C018, (uint64_t)&unk_1000072B4);
}

uint64_t sub_100005C10(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100005C64(&qword_10000C100, (uint64_t)&unk_100007224);
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

uint64_t sub_100005C64(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for AssetMetricsExtension(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100005CA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005D74(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006708((uint64_t)v12, *a3);
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
      sub_100006708((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000066E8(v12);
  return v7;
}

uint64_t sub_100005D74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005F2C(a5, a6);
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

uint64_t sub_100005F2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005FC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006198(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006198(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005FC0(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100006134(v4, 0LL);
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

void *sub_100006134(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000054BC(&qword_10000C140);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006198(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000054BC(&qword_10000C140);
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

uint64_t sub_1000062E4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61LL && a2 == 0xEC0000006C616974LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x726150776F6C6C61LL, 0xEC0000006C616974LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0xD000000000000011LL && a2 == 0x80000001000076D0LL)
  {
    swift_bridgeObjectRelease(0x80000001000076D0LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x80000001000076D0LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

double sub_1000063D8(void *a1)
{
  uint64_t v4 = sub_1000054BC(&qword_10000C108);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000652C(a1, v8);
  unint64_t v10 = sub_100006550();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for AssetMetricsExtensionConfig.CodingKeys,  &type metadata for AssetMetricsExtensionConfig.CodingKeys,  v10,  v8,  v9);
  if (!v1)
  {
    char v14 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v14, v4);
    char v13 = 1;
    double v2 = KeyedDecodingContainer.decode(_:forKey:)(&v13, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_1000066E8(a1);
  return v2;
}

void *sub_10000652C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_100006550()
{
  unint64_t result = qword_10000C680[0];
  if (!qword_10000C680[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000073B8, &type metadata for AssetMetricsExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C680);
  }

  return result;
}

uint64_t sub_100006594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AssetMetricsExtension(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000065D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AssetMetricsExtension(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100006614()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for AssetMetricsExtensionError,  &type metadata for AssetMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }

  return result;
}

unint64_t sub_100006658()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    uint64_t v1 = sub_1000066A4(&qword_10000C040);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for MLHostParameters<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }

  return result;
}

uint64_t sub_1000066A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000066E8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006708(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006748(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000054BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100006784(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000679C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000067E0()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100006840, 0LL, 0LL);
}

uint64_t sub_100006840()
{
  if (isOnDeviceSiriMetricsEnabled()())
  {
    uint64_t v1 = 0LL;
  }

  else
  {
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v2 = *(void *)(v0 + 40);
    uint64_t v5 = *(void *)(v0 + 16);
    uint64_t v4 = *(void *)(v0 + 24);
    uint64_t v6 = type metadata accessor for AssetMetricsExtension(0LL);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + *(int *)(v6 + 20), v4);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Siri on device metrics disabled. Not continuing.", v10, 2u);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    uint64_t v12 = *(void *)(v0 + 32);
    uint64_t v11 = *(void *)(v0 + 40);
    uint64_t v13 = *(void *)(v0 + 24);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v1 = 1LL;
  }

  uint64_t v14 = *(void *)(v0 + 40);
  id v15 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v16 = MLHostResult.init(status:policy:)(2LL, v1);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v16);
}

_BYTE *initializeBufferWithCopyOfBuffer for AssetMetricsExtensionConfig.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssetMetricsExtensionConfig.CodingKeys( unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetMetricsExtensionConfig.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006A4C + 4 * byte_10000707F[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100006A80 + 4 * byte_10000707A[v4]))();
}

uint64_t sub_100006A80(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006A88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006A90LL);
  }
  return result;
}

uint64_t sub_100006A9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006AA4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100006AA8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006AB0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006ABC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006AC4(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AssetMetricsExtensionConfig.CodingKeys()
{
  return &type metadata for AssetMetricsExtensionConfig.CodingKeys;
}

unint64_t sub_100006AE4()
{
  unint64_t result = qword_10000C790[0];
  if (!qword_10000C790[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100007390, &type metadata for AssetMetricsExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C790);
  }

  return result;
}

unint64_t sub_100006B2C()
{
  unint64_t result = qword_10000C8A0;
  if (!qword_10000C8A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007300, &type metadata for AssetMetricsExtensionConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C8A0);
  }

  return result;
}

unint64_t sub_100006B74()
{
  unint64_t result = qword_10000C8A8[0];
  if (!qword_10000C8A8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100007328, &type metadata for AssetMetricsExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C8A8);
  }

  return result;
}
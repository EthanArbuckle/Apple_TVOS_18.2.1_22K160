unint64_t sub_100003818(char a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  ValueMetadata *v22;
  v4 = type metadata accessor for Mirror(0LL);
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v22 = &type metadata for MetricsExtensionConfig;
  LOBYTE(v20) = a1;
  v21 = *(void *)&a2;
  v8 = Mirror.init(reflecting:)(&v20);
  v9 = Mirror.children.getter(v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v10 = sub_100003974(v9);
  swift_release(v9);
  v20 = 0xD000000000000017LL;
  v21 = 0x80000001000076C0LL;
  v19 = v10;
  v11 = sub_1000053E8(&qword_10000C148);
  v12 = sub_10000691C(&qword_10000C150, &qword_10000C148, (uint64_t)&protocol conformance descriptor for [A]);
  v13 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v11, v12);
  v15 = v14;
  swift_bridgeObjectRelease(v10);
  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v15);
  v17._countAndFlagsBits = 41LL;
  v17._object = (void *)0xE100000000000000LL;
  String.append(_:)(v17);
  return v20;
}

char *sub_100003974(uint64_t a1)
{
  uint64_t v2 = swift_retain();
  uint64_t v3 = dispatch thunk of _AnySequenceBox._makeIterator()(v2);
  uint64_t v4 = swift_release(a1);
  dispatch thunk of _AnyIteratorBoxBase.next()(v20, v4);
  if (*((void *)&v21 + 1))
  {
    v5 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      Swift::String v18 = (Swift::String)v20[0];
      v19[0] = v20[1];
      v19[1] = v21;
      uint64_t v7 = *((void *)&v20[0] + 1);
      if (*((void *)&v20[0] + 1))
      {
        uint64_t countAndFlagsBits = v18._countAndFlagsBits;
        uint64_t v16 = 0LL;
        unint64_t v17 = 0xE000000000000000LL;
        String.append(_:)(*(Swift::String *)(&v7 - 1));
        v9._uint64_t countAndFlagsBits = 8250LL;
        v9._object = (void *)0xE200000000000000LL;
        String.append(_:)(v9);
        _print_unlocked<A, B>(_:_:)( v19,  &v16,  (char *)&type metadata for Any + 8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        uint64_t v10 = v16;
        unint64_t v11 = v17;
        sub_10000695C((uint64_t)&v18, &qword_10000C158);
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_100005A70(0LL, *((void *)v5 + 2) + 1LL, 1, v5);
          v5 = (char *)isUniquelyReferenced_nonNull_native;
        }

        unint64_t v13 = *((void *)v5 + 2);
        unint64_t v12 = *((void *)v5 + 3);
        if (v13 >= v12 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_100005A70((char *)(v12 > 1), v13 + 1, 1, v5);
          v5 = (char *)isUniquelyReferenced_nonNull_native;
        }

        *((void *)v5 + 2) = v13 + 1;
        v14 = &v5[16 * v13];
        *((void *)v14 + 4) = v10;
        *((void *)v14 + 5) = v11;
      }

      else
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_10000695C((uint64_t)&v18, &qword_10000C158);
      }

      dispatch thunk of _AnyIteratorBoxBase.next()(v20, isUniquelyReferenced_nonNull_native);
    }

    while (*((void *)&v21 + 1));
  }

  else
  {
    v5 = (char *)&_swiftEmptyArrayStorage;
  }

  swift_release(v3);
  return v5;
}

uint64_t sub_100003B1C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0xD000000000000011LL;
  }
  else {
    return 0x726150776F6C6C61LL;
  }
}

BOOL sub_100003B60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003B78()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100003BBC()
{
}

Swift::Int sub_100003BE4(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100003C24()
{
  return sub_100003B1C(*v0);
}

uint64_t sub_100003C2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000062AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003C50()
{
  return 0LL;
}

void sub_100003C5C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003C68(uint64_t a1)
{
  unint64_t v2 = sub_100006518();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003C90(uint64_t a1)
{
  unint64_t v2 = sub_100006518();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003CB8(void *a1, uint64_t a2, double a3)
{
  uint64_t v7 = sub_1000053E8(&qword_10000C0F0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_1000064F4(a1, v11);
  unint64_t v13 = sub_100006518();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for MetricsExtensionConfig.CodingKeys,  &type metadata for MetricsExtensionConfig.CodingKeys,  v13,  v11,  v12);
  char v17 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v17, v7);
  if (!v3)
  {
    char v16 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(&v16, v7, a3);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_100003DD4(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_1000063A0(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_100003E04(void *a1)
{
  return sub_100003CB8(a1, *(unsigned __int8 *)v1, v1[1]);
}

unint64_t sub_100003E20()
{
  return sub_100003818(*(_BYTE *)v0, *(double *)(v0 + 8));
}

BOOL SiriMetricsExtensionError.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000084D8, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

unint64_t SiriMetricsExtensionError.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_100003E8C()
{
  return 1LL;
}

Swift::Int sub_100003E94()
{
  return Hasher._finalize()();
}

uint64_t sub_100003EE8(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD00000000000001CLL, 0x8000000100007430LL);
}

Swift::Int sub_100003F04(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100003F54@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._uint64_t countAndFlagsBits = *a1;
  char v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008510, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100003FA4(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x8000000100007430LL;
}

uint64_t sub_100003FD4(uint64_t a1)
{
  v2[23] = a1;
  v2[24] = v1;
  uint64_t v3 = type metadata accessor for MetricsWorker(0LL);
  v2[25] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[26] = v4;
  v2[27] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MetricsExtension(0LL);
  v2[28] = v5;
  v2[29] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000053E8(&qword_10000C100);
  v2[30] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000053E8(&qword_10000C028);
  v2[31] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[32] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[33] = swift_task_alloc(v9);
  v2[34] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  v2[35] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[36] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[37] = swift_task_alloc(v12);
  v2[38] = swift_task_alloc(v12);
  v2[39] = swift_task_alloc(v12);
  v2[40] = swift_task_alloc(v12);
  return swift_task_switch(sub_100004108, 0LL, 0LL);
}

uint64_t sub_100004108()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[24];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[36] + 16LL);
  v0[41] = v5;
  v5(v2, v4, v3);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[23];
    unint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    __int128 v21 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)unint64_t v9 = 138412290;
    v0[22] = v8;
    id v10 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 22, v0 + 23, v9 + 4, v9 + 12);
    *__int128 v21 = v8;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Context: %@", v9, 0xCu);
    uint64_t v11 = sub_1000053E8(&qword_10000C110);
    swift_arrayDestroy(v21, 1LL, v11);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    unint64_t v12 = (void *)v0[23];
  }

  uint64_t v13 = v0[40];
  uint64_t v14 = v0[35];
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0[36] + 8LL);
  v0[42] = v15;
  v15(v13, v14);
  char v16 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  v0[43] = v16;
  uint64_t v17 = sub_100005A30(&qword_10000C0E0, (uint64_t)&unk_100007260);
  unint64_t v18 = sub_100005880();
  unint64_t v19 = sub_1000058C4();
  *char v16 = v0;
  v16[1] = sub_1000042FC;
  return MLHostExtension.loadConfig<A>(context:)( v0[30],  v0[23],  v0[28],  &type metadata for MetricsExtensionConfig,  v17,  v18,  v19);
}

uint64_t sub_1000042FC()
{
  return swift_task_switch(sub_100004350, 0LL, 0LL);
}

uint64_t sub_100004350()
{
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 240);
  sub_10000655C(*(void *)(v0 + 192), *(void *)(v0 + 232));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 256);
  uint64_t v9 = *(void *)(v0 + 232);
  uint64_t v8 = *(void *)(v0 + 240);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))( *(void *)(v0 + 272),  v9 + *(int *)(*(void *)(v0 + 224) + 20LL),  *(void *)(v0 + 248));
    sub_1000065A0(v9);
    sub_10000695C(v8, &qword_10000C100);
  }

  else
  {
    sub_1000065A0(*(void *)(v0 + 232));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }

  uint64_t v10 = *(void *)(v0 + 272);
  uint64_t v12 = *(void *)(v0 + 256);
  uint64_t v11 = *(void *)(v0 + 264);
  uint64_t v13 = *(void *)(v0 + 248);
  (*(void (**)(void, void, void))(v0 + 328))( *(void *)(v0 + 312),  *(void *)(v0 + 192),  *(void *)(v0 + 280));
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.info.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  unint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 336);
  uint64_t v19 = *(void *)(v0 + 312);
  uint64_t v20 = *(void *)(v0 + 280);
  uint64_t v22 = *(void *)(v0 + 256);
  uint64_t v21 = *(void *)(v0 + 264);
  uint64_t v23 = *(void *)(v0 + 248);
  if (v17)
  {
    v44 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 336);
    v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v43 = v20;
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    uint64_t v45 = v25;
    *(_DWORD *)v24 = 136315138;
    uint64_t v26 = sub_10000691C( &qword_10000C130,  &qword_10000C028,  (uint64_t)&protocol conformance descriptor for MLHostParameters<A>);
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter(v23, v26);
    unint64_t v29 = v28;
    *(void *)(v0 + 168) = sub_100005B7C(v27, v28, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v29);
    v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v30(v21, v23);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Configuration: %s", v24, 0xCu);
    swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

    uint64_t v31 = v44(v19, v43);
  }

  else
  {
    v30 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v30(*(void *)(v0 + 264), *(void *)(v0 + 248));

    uint64_t v31 = v18(v19, v20);
  }

  *(void *)(v0 + 352) = v30;
  uint64_t v32 = *(void *)(v0 + 248);
  MetricsWorker.init()(v31);
  uint64_t v33 = type metadata accessor for LighthouseRuntimeProcessorResult(0LL);
  *(void *)(v0 + 360) = v33;
  uint64_t v34 = *(void *)(v33 - 8);
  *(void *)(v0 + 368) = v34;
  uint64_t v35 = *(void *)(v34 + 64);
  *(void *)(v0 + 376) = v35;
  unint64_t v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v0 + 384) = swift_task_alloc(v36);
  uint64_t v37 = swift_task_alloc(v36);
  *(void *)(v0 + 392) = v37;
  uint64_t v38 = type metadata accessor for MetricsExecutor(0LL);
  swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
  uint64_t v39 = MetricsExecutor.init()();
  *(void *)(v0 + 400) = v39;
  MLHostParameters.taskParameters.getter(v32);
  double v40 = *(double *)(v0 + 144);
  v41 = (void *)swift_task_alloc(async function pointer to MetricsWorker.doWork(metricsExecutor:context:durationThreshold:)[1]);
  *(void *)(v0 + 408) = v41;
  void *v41 = v0;
  v41[1] = sub_1000046A0;
  return MetricsWorker.doWork(metricsExecutor:context:durationThreshold:)(v37, v39, *(void *)(v0 + 184), v40);
}

uint64_t sub_1000046A0()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 400LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 408LL);
  *(void *)(*(void *)v1 + 416LL) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  if (v0) {
    int v4 = sub_100004B1C;
  }
  else {
    int v4 = sub_10000470C;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000470C()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 360);
  unint64_t v5 = (*(void *)(v0 + 376) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
  swift_task_dealloc(v1);
  uint64_t v6 = (void *)swift_task_alloc(v5);
  (*(void (**)(void *, uint64_t, uint64_t))(v3 + 16))(v6, v2, v4);
  int v7 = (*(uint64_t (**)(void *, uint64_t))(v3 + 88))(v6, v4);
  v53 = v6;
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
        uint64_t v28 = *(void *)(v0 + 384);
        uint64_t v29 = *(void *)(v0 + 360);
        uint64_t v30 = *(void *)(v0 + 368);
        v52 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
        uint64_t v31 = *(void *)(v0 + 272);
        uint64_t v32 = *(void *)(v0 + 248);
        uint64_t v33 = *(void *)(v0 + 208);
        uint64_t v34 = *(void *)(v0 + 216);
        uint64_t v35 = *(void *)(v0 + 200);
        swift_task_dealloc(v53);
        id v36 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
        uint64_t v54 = MLHostResult.init(status:policy:)(v16, 1LL);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v35);
        v52(v31, v32);
        goto LABEL_23;
      }

      if (!&enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)
        || v7 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
      {
        BOOL v17 = (void *)(v0 + 360);
        unint64_t v18 = (void (**)(void *, void))(*(void *)(v0 + 368) + 8LL);
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

  (*(void (**)(void *, void))(*(void *)(v0 + 368) + 96LL))(v6, *(void *)(v0 + 360));
  uint64_t v8 = *v6;
  if (!*v6
    || (*(void *)(v0 + 152) = v8,
        swift_errorRetain(v8),
        uint64_t v9 = sub_1000053E8(&qword_10000C120),
        uint64_t v10 = sub_1000053E8(&qword_10000C128),
        (swift_dynamicCast(v0 + 96, v0 + 152, v9, v10, 6LL) & 1) == 0))
  {
    *(void *)(v0 + 128) = 0LL;
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    goto LABEL_17;
  }

  if (!*(void *)(v0 + 120))
  {
LABEL_17:
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 328);
    uint64_t v21 = *(void *)(v0 + 304);
    BOOL v17 = (void *)(v0 + 280);
    uint64_t v22 = *(void *)(v0 + 280);
    uint64_t v23 = *(void *)(v0 + 192);
    sub_10000695C(v0 + 96, &qword_10000C118);
    uint64_t v24 = v20(v21, v23, v22);
    uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "task failed with unset error", v27, 2u);
      swift_slowDealloc(v27, -1LL, -1LL);

      swift_errorRelease(v8);
    }

    else
    {
      swift_errorRelease(v8);
    }

    uint64_t v16 = 0LL;
    unint64_t v18 = (void (**)(void *, void))(v0 + 336);
    uint64_t v19 = *(void **)(v0 + 304);
    goto LABEL_21;
  }

  uint64_t v12 = *(void *)(v0 + 360);
  uint64_t v11 = *(void *)(v0 + 368);
  uint64_t v50 = *(void *)(v0 + 272);
  v51 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  uint64_t v48 = *(void *)(v0 + 384);
  uint64_t v49 = *(void *)(v0 + 248);
  uint64_t v13 = *(void *)(v0 + 208);
  uint64_t v47 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 200);
  sub_100006620((__int128 *)(v0 + 96), v0 + 56);
  sub_100006638(v0 + 56, v0 + 16);
  id v15 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v54 = MLHostResult.init(error:policy:)(v0 + 16, 1LL);
  swift_errorRelease(v8);
  sub_1000066C0((void *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v48, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v47, v14);
  v51(v50, v49);
  swift_task_dealloc(v6);
LABEL_23:
  uint64_t v38 = *(void *)(v0 + 312);
  uint64_t v37 = *(void *)(v0 + 320);
  uint64_t v40 = *(void *)(v0 + 296);
  uint64_t v39 = *(void *)(v0 + 304);
  uint64_t v42 = *(void *)(v0 + 264);
  uint64_t v41 = *(void *)(v0 + 272);
  uint64_t v44 = *(void *)(v0 + 232);
  uint64_t v43 = *(void *)(v0 + 240);
  uint64_t v45 = *(void *)(v0 + 216);
  swift_task_dealloc(*(void *)(v0 + 384));
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v54);
}

uint64_t sub_100004B1C()
{
  uint64_t v1 = *(void *)(v0 + 416);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 192);
  swift_task_dealloc(*(void *)(v0 + 392));
  v2(v3, v5, v4);
  swift_errorRetain(v1);
  uint64_t v6 = swift_errorRetain(v1);
  int v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(v0 + 416);
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v10 = 138412290;
    swift_errorRetain(v9);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError(v9);
    *(void *)(v0 + 160) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v10 + 4, v10 + 12);
    *uint64_t v11 = v12;
    swift_errorRelease(v9);
    swift_errorRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "unexpected error throws: %@", v10, 0xCu);
    uint64_t v13 = sub_1000053E8(&qword_10000C110);
    swift_arrayDestroy(v11, 1LL, v13);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
    uint64_t v14 = *(void *)(v0 + 416);
    swift_errorRelease(v14);
    swift_errorRelease(v14);
  }

  id v15 = v7;
  uint64_t v16 = *(void *)(v0 + 416);
  id v36 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  BOOL v17 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  uint64_t v18 = *(void *)(v0 + 296);
  uint64_t v20 = *(void *)(v0 + 272);
  uint64_t v19 = *(void *)(v0 + 280);
  uint64_t v21 = *(void *)(v0 + 248);
  uint64_t v23 = *(void *)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 216);
  uint64_t v24 = *(void *)(v0 + 200);

  v17(v18, v19);
  uint64_t v39 = &type metadata for SiriMetricsExtensionError;
  unint64_t v40 = sub_1000065DC();
  id v25 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v37 = MLHostResult.init(error:policy:)(v38, 1LL);
  swift_errorRelease(v16);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  v36(v20, v21);
  uint64_t v27 = *(void *)(v0 + 312);
  uint64_t v26 = *(void *)(v0 + 320);
  uint64_t v29 = *(void *)(v0 + 296);
  uint64_t v28 = *(void *)(v0 + 304);
  uint64_t v31 = *(void *)(v0 + 264);
  uint64_t v30 = *(void *)(v0 + 272);
  uint64_t v33 = *(void *)(v0 + 232);
  uint64_t v32 = *(void *)(v0 + 240);
  uint64_t v34 = *(void *)(v0 + 216);
  swift_task_dealloc(*(void *)(v0 + 384));
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v37);
}

uint64_t sub_100004DB4()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C140 + dword_10000C140);
  uint64_t v1 = (void *)swift_task_alloc(unk_10000C144);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006BEC;
  return v3();
}

uint64_t sub_100004E0C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10000C0FC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004E58;
  return sub_100003FD4(a1);
}

uint64_t sub_100004E58(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100004EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_100004F44;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004F44()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100004F8C(uint64_t a1)
{
  uint64_t v2 = sub_100005A30(&qword_10000C0E0, (uint64_t)&unk_100007260);
  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100004FD4@<X0>(void *a1@<X8>)
{
  v4[0] = 0;
  uint64_t v5 = 0x4024000000000000LL;
  unint64_t v1 = sub_100005880();
  unint64_t v2 = sub_1000058C4();
  return MLHostParameters.init(taskParameters:)(v4, &type metadata for MetricsExtensionConfig, v1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for MetricsExtension(0LL);
  uint64_t v4 = sub_100005A30(&qword_10000C000, (uint64_t)&unk_1000072F0);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for MetricsExtension(uint64_t a1)
{
  uint64_t result = qword_10000C3F0;
  if (!qword_10000C3F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MetricsExtension);
  }
  return result;
}

unint64_t sub_100005120()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SiriMetricsExtensionError,  &type metadata for SiriMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }

  return result;
}

unint64_t sub_100005168()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SiriMetricsExtensionError,  &type metadata for SiriMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }

  return result;
}

unint64_t sub_1000051B0()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SiriMetricsExtensionError,  &type metadata for SiriMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }

  return result;
}

unint64_t sub_1000051F8()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for SiriMetricsExtensionError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriMetricsExtensionError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000052D4 + 4 * byte_1000070B0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000052F4 + 4 * byte_1000070B5[v4]))();
  }
}

_BYTE *sub_1000052D4(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000052F4(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000052FC(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100005304(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000530C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100005314(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_100005320()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for SiriMetricsExtensionError()
{
  return &type metadata for SiriMetricsExtensionError;
}

uint64_t *sub_10000533C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000053E8(&qword_10000C028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_1000053E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1000053E8(&qword_10000C028);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_100005488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000053E8(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000053E8(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000053E8(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000053E8(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005694);
}

uint64_t sub_100005694(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000053E8(&qword_10000C028);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_10000570C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005718);
}

uint64_t sub_100005718(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
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
    uint64_t v10 = sub_1000053E8(&qword_10000C028);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100005798(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_10000581C(319LL);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v6, a1 + 16);
    }
  }

void sub_10000581C(uint64_t a1)
{
  if (!qword_10000C088)
  {
    unint64_t v2 = sub_100005880();
    unint64_t v3 = sub_1000058C4();
    unint64_t v4 = type metadata accessor for MLHostParameters(a1, &type metadata for MetricsExtensionConfig, v2, v3);
    if (!v5) {
      atomic_store(v4, (unint64_t *)&qword_10000C088);
    }
  }

unint64_t sub_100005880()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000072C8, &type metadata for MetricsExtensionConfig);
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }

  return result;
}

unint64_t sub_1000058C4()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000072A0, &type metadata for MetricsExtensionConfig);
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }

  return result;
}

__n128 initializeBufferWithCopyOfBuffer for MetricsExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MetricsExtensionConfig(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MetricsExtensionConfig( uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for MetricsExtensionConfig()
{
  return &type metadata for MetricsExtensionConfig;
}

uint64_t sub_1000059B8()
{
  return sub_100005A30(&qword_10000C000, (uint64_t)&unk_1000072F0);
}

uint64_t sub_1000059DC(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100005A30(&qword_10000C0E0, (uint64_t)&unk_100007260);
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

uint64_t sub_100005A30(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for MetricsExtension(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

char *sub_100005A70(char *result, int64_t a2, char a3, char *a4)
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
      uint64_t v10 = sub_1000053E8((uint64_t *)&unk_10000C160);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
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
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_1000061BC(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100005B7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005C4C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000066E0((uint64_t)v12, *a3);
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
      sub_1000066E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000066C0(v12);
  return v7;
}

uint64_t sub_100005C4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005E04(a5, a6);
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

uint64_t sub_100005E04(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005E98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100006070(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006070(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005E98(uint64_t a1, unint64_t a2)
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
      char v5 = sub_10000600C(v4, 0LL);
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

void *sub_10000600C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_1000053E8(&qword_10000C138);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006070(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_1000053E8(&qword_10000C138);
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

uint64_t sub_1000061BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1000062AC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61LL && a2 == 0xEC0000006C616974LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x726150776F6C6C61LL, 0xEC0000006C616974LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0xD000000000000011LL && a2 == 0x8000000100007720LL)
  {
    swift_bridgeObjectRelease(0x8000000100007720LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100007720LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

double sub_1000063A0(void *a1)
{
  uint64_t v4 = sub_1000053E8(&qword_10000C0E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_1000064F4(a1, v8);
  unint64_t v10 = sub_100006518();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for MetricsExtensionConfig.CodingKeys,  &type metadata for MetricsExtensionConfig.CodingKeys,  v10,  v8,  v9);
  if (!v1)
  {
    char v14 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v14, v4);
    char v13 = 1;
    double v2 = KeyedDecodingContainer.decode(_:forKey:)(&v13, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_1000066C0(a1);
  return v2;
}

void *sub_1000064F4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_100006518()
{
  unint64_t result = qword_10000C680[0];
  if (!qword_10000C680[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000073F4, &type metadata for MetricsExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C680);
  }

  return result;
}

uint64_t sub_10000655C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MetricsExtension(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000065A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MetricsExtension(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_1000065DC()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SiriMetricsExtensionError,  &type metadata for SiriMetricsExtensionError);
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }

  return result;
}

uint64_t sub_100006620(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100006638(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000667C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000066C0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000066E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006720()
{
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[4] = v3;
  unint64_t v4 = (*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[5] = swift_task_alloc(v4);
  v1[6] = swift_task_alloc(v4);
  return swift_task_switch(sub_100006790, 0LL, 0LL);
}

uint64_t sub_100006790()
{
  if (!isOnDeviceSiriMetricsEnabled()())
  {
    uint64_t v2 = (uint64_t *)(v0 + 48);
    uint64_t v7 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 32) + 16LL))( *(void *)(v0 + 48),  *(void *)(v0 + 16),  *(void *)(v0 + 24));
    unint64_t v4 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = "Siri on device metrics disabled. Not continuing.";
      goto LABEL_7;
    }

LABEL_8:
    uint64_t v8 = *v2;
    goto LABEL_9;
  }

  type metadata accessor for ExtensionsUtils(0LL);
  uint64_t v1 = 0LL;
  if ((static ExtensionsUtils.isAssistantOrDictationEnabled()() & 1) == 0)
  {
    uint64_t v2 = (uint64_t *)(v0 + 40);
    uint64_t v3 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 32) + 16LL))( *(void *)(v0 + 40),  *(void *)(v0 + 16),  *(void *)(v0 + 24));
    unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = "Neither assistant nor dictation enabled. Not allowed to process.";
LABEL_7:
      uint64_t v8 = *v2;
      uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, v6, v9, 2u);
      swift_slowDealloc(v9, -1LL, -1LL);
LABEL_9:
      uint64_t v10 = *(void *)(v0 + 24);
      uint64_t v11 = *(void *)(v0 + 32);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v8, v10);
      uint64_t v1 = 1LL;
      goto LABEL_10;
    }

    goto LABEL_8;
  }

LABEL_10:
  uint64_t v13 = *(void *)(v0 + 40);
  uint64_t v12 = *(void *)(v0 + 48);
  id v14 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v15 = MLHostResult.init(status:policy:)(2LL, v1);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t sub_10000691C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10000667C(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000695C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000053E8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for MetricsExtensionConfig.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MetricsExtensionConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MetricsExtensionConfig.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006A80 + 4 * byte_1000070BF[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100006AB4 + 4 * byte_1000070BA[v4]))();
}

uint64_t sub_100006AB4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006ABC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006AC4LL);
  }
  return result;
}

uint64_t sub_100006AD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006AD8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100006ADC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006AE4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006AF0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006AF8(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MetricsExtensionConfig.CodingKeys()
{
  return &type metadata for MetricsExtensionConfig.CodingKeys;
}

unint64_t sub_100006B18()
{
  unint64_t result = qword_10000C790[0];
  if (!qword_10000C790[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000073CC, &type metadata for MetricsExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C790);
  }

  return result;
}

unint64_t sub_100006B60()
{
  unint64_t result = qword_10000C8A0;
  if (!qword_10000C8A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000733C, &type metadata for MetricsExtensionConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C8A0);
  }

  return result;
}

unint64_t sub_100006BA8()
{
  unint64_t result = qword_10000C8A8[0];
  if (!qword_10000C8A8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100007364, &type metadata for MetricsExtensionConfig.CodingKeys);
    atomic_store(result, qword_10000C8A8);
  }

  return result;
}
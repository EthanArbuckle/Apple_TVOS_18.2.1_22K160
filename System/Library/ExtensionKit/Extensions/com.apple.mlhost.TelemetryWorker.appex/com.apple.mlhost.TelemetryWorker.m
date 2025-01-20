uint64_t sub_100003FC0()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_10000A198(v0, qword_100010740);
  sub_100009E80(v0, (uint64_t)qword_100010740);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x800000010000B030LL,  0x7274656D656C6554LL,  0xEF72656B726F5779LL);
}

com_apple_mlhost_TelemetryWorker::TelemetryError_optional __swiftcall TelemetryError.init(rawValue:)( Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C678, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    v4.value = com_apple_mlhost_TelemetryWorker_TelemetryError_ledgerEmpty;
  }
  else {
    v4.value = com_apple_mlhost_TelemetryWorker_TelemetryError_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t TelemetryError.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x6D4572656764656CLL;
  }
  else {
    return 0x656C6C65636E6163LL;
  }
}

uint64_t sub_1000040D4(char *a1, char *a2)
{
  return sub_100004164(*a1, *a2);
}

uint64_t sub_1000040E0(char a1, char a2)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aStart_1[v2];
  uint64_t v4 = *(void *)&aFinished_1[v2 + 8];
  uint64_t v5 = 8LL * a2;
  uint64_t v6 = *(void *)&aFinished_1[v5 + 8];
  if (v3 == *(void *)&aStart_1[v5] && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

uint64_t sub_100004164(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163LL;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064LL;
  }
  else {
    unint64_t v4 = 0xEB00000000797470LL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v5 = 0x656C6C65636E6163LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xEB00000000797470LL;
  }
  else {
    unint64_t v6 = 0xE900000000000064LL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_100004210()
{
  return sub_100004218(*v0);
}

Swift::Int sub_100004218(char a1)
{
  if ((a1 & 1) != 0) {
    uint64_t v2 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v2 = 0x656C6C65636E6163LL;
  }
  if ((a1 & 1) != 0) {
    unint64_t v3 = 0xEB00000000797470LL;
  }
  else {
    unint64_t v3 = 0xE900000000000064LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_1000042A4(char a1)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aFinished_1[v2 + 8];
  String.hash(into:)(v5, *(void *)&aStart_1[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000430C(uint64_t a1)
{
  return sub_100004354(a1, *v1);
}

uint64_t sub_100004314(uint64_t a1, char a2)
{
  uint64_t v2 = 8LL * a2;
  uint64_t v3 = *(void *)&aFinished_1[v2 + 8];
  String.hash(into:)(a1, *(void *)&aStart_1[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_100004354(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163LL;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064LL;
  }
  else {
    unint64_t v4 = 0xEB00000000797470LL;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_1000043B8(uint64_t a1)
{
  return sub_1000043C0(a1, *v1);
}

Swift::Int sub_1000043C0(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x6D4572656764656CLL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v4 = 0xEB00000000797470LL;
  }
  else {
    unint64_t v4 = 0xE900000000000064LL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_100004448(uint64_t a1, char a2)
{
  uint64_t v3 = 8LL * a2;
  uint64_t v4 = *(void *)&aFinished_1[v3 + 8];
  String.hash(into:)(v6, *(void *)&aStart_1[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_1000044AC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C678, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_100004508@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TelemetryError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_UNKNOWN **static TelemetryStates.allCases.getter()
{
  return &off_10000C760;
}

uint64_t TelemetryStates.rawValue.getter(char a1)
{
  return *(void *)&aStart_1[8 * a1];
}

uint64_t sub_100004570(char *a1, char *a2)
{
  return sub_1000040E0(*a1, *a2);
}

Swift::Int sub_10000457C()
{
  return sub_1000042A4(*v0);
}

uint64_t sub_100004584(uint64_t a1)
{
  return sub_100004314(a1, *v1);
}

Swift::Int sub_10000458C(uint64_t a1)
{
  return sub_100004448(a1, *v1);
}

unint64_t sub_100004594@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = _s32com_apple_mlhost_TelemetryWorker0D6StatesO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000045C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TelemetryStates.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1000045E8(void *a1@<X8>)
{
  *a1 = &off_10000C788;
}

uint64_t sub_1000045F8(uint64_t a1)
{
  v2[38] = a1;
  v2[39] = v1;
  uint64_t v3 = type metadata accessor for DediscoAnalytics(0LL);
  v2[40] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[41] = v4;
  uint64_t v5 = *(void *)(v4 + 64);
  v2[42] = v5;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[43] = swift_task_alloc(v6);
  v2[44] = swift_task_alloc(v6);
  v2[45] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for CoreAnalyticsEvents(0LL);
  v2[46] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[47] = v8;
  v2[48] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for CustomEventAnalytics(0LL);
  v2[49] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[50] = v10;
  uint64_t v11 = *(void *)(v10 + 64);
  v2[51] = v11;
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[52] = swift_task_alloc(v12);
  v2[53] = swift_task_alloc(v12);
  uint64_t v13 = type metadata accessor for BucketInterval(0LL);
  v2[54] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[55] = v14;
  v2[56] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for TelemetryConfig(0LL);
  v2[57] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v2[58] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[59] = swift_task_alloc(v17);
  v2[60] = swift_task_alloc(v17);
  uint64_t v18 = type metadata accessor for Date(0LL);
  v2[61] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[62] = v19;
  v2[63] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v20 = (*(void *)(*(void *)(sub_100009E40(&qword_1000100D8) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[64] = swift_task_alloc(v20);
  v2[65] = swift_task_alloc(v20);
  uint64_t v21 = type metadata accessor for TelemetryBucketRange(0LL);
  v2[66] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v2[67] = v22;
  unint64_t v23 = (*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[68] = swift_task_alloc(v23);
  v2[69] = swift_task_alloc(v23);
  v2[70] = swift_task_alloc(v23);
  uint64_t v24 = type metadata accessor for UUID(0LL);
  v2[71] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  v2[72] = v25;
  v2[73] = swift_task_alloc((*(void *)(v25 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100004804, 0LL, 0LL);
}

uint64_t sub_100004804()
{
  if (qword_100010130 != -1) {
    swift_once(&qword_100010130, sub_100003FC0);
  }
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 592) = sub_100009E80(v2, (uint64_t)qword_100010740);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.info.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = *(void **)(v0 + 304);
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v7 = 138412290;
    *(void *)(v0 + 288) = v6;
    id v9 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v7 + 4);
    *uint64_t v8 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Context: %@", v7, 0xCu);
    uint64_t v10 = sub_100009E40(&qword_100010100);
    swift_arrayDestroy(v8, 1LL, v10);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v11 = *(void *)(v0 + 584);
  uint64_t v12 = *(void *)(v0 + 576);
  uint64_t v13 = *(void *)(v0 + 568);
  uint64_t v14 = UUID.init()();
  *(void *)(v0 + 600) = UUID.uuidString.getter(v14);
  *(void *)(v0 + 608) = v15;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  uint64_t v16 = type metadata accessor for LedgerClient(0LL);
  *(void *)(v0 + 616) = LedgerClient.__allocating_init()();
  *(_BYTE *)(v0 + 841) = 0;
  unint64_t v17 = sub_100009E98();
  uint64_t v18 = dispatch thunk of Actor.unownedExecutor.getter(v16, v17);
  *(void *)(v0 + 624) = v18;
  *(void *)(v0 + 632) = v19;
  return swift_task_switch(sub_100004A18, v18, v19);
}

uint64_t sub_100004A18()
{
  uint64_t v1 = *(void *)(v0 + 304);
  unint64_t v2 = sub_100009EE0();
  *(void *)(v0 + 640) = v2;
  dispatch thunk of LedgerClient.sendCustomTaskEvent<A>(state:context:)( v0 + 841,  v1,  &type metadata for TelemetryStates,  v2);
  return swift_task_switch(sub_100004A80, 0LL, 0LL);
}

uint64_t sub_100004A80()
{
  uint64_t v1 = *(void **)(v0 + 312);
  *(void *)(v0 + 648) = *v1;
  uint64_t v2 = v1[1];
  *(void *)(v0 + 656) = v2;
  id v3 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  swift_bridgeObjectRetain(v2);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  id v5 = [v3 initWithSuiteName:v4];

  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    [v5 doubleForKey:v6];
    double v8 = v7;
  }

  else
  {
    double v8 = 0.0;
  }

  uint64_t v9 = *(void *)(v0 + 560);
  uint64_t v10 = *(void *)(v0 + 552);
  uint64_t v11 = *(void *)(v0 + 544);
  uint64_t v12 = *(void *)(v0 + 536);
  uint64_t v13 = *(void *)(v0 + 528);
  TelemetryBucketRange.init(from:)(v8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v14(v10, v9, v13);
  uint64_t v15 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v14)(v11, v9, v13);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.info.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v19 = *(void *)(v0 + 552);
  uint64_t v20 = *(void *)(v0 + 544);
  uint64_t v21 = *(void *)(v0 + 536);
  uint64_t v22 = *(void *)(v0 + 528);
  if (v18)
  {
    uint64_t v23 = swift_slowAlloc(22LL, -1LL);
    *(_DWORD *)uint64_t v23 = 134218240;
    *(double *)(v0 + 192) = TelemetryBucketRange.startTimestamp.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v23 + 4);
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8);
    uint64_t v25 = v24(v19, v22);
    *(_WORD *)(v23 + 12) = 2048;
    *(double *)(v0 + 248) = TelemetryBucketRange.endTimestamp.getter(v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 248, v0 + 256, v23 + 14);
    v24(v20, v22);
    _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "TelemetryWorker: startTimestamp: %f -- endTimestamp: %f",  (uint8_t *)v23,  0x16u);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  else
  {
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8);
    v24(*(void *)(v0 + 552), *(void *)(v0 + 528));
    v24(v20, v22);
  }

  *(void *)(v0 + 664) = v24;

  if (TelemetryBucketRange.endTimestamp.getter(v26) <= v8)
  {
    uint64_t v28 = swift_bridgeObjectRelease(*(void *)(v0 + 608));
    v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)v31 = 134217984;
      *(double *)(v0 + 216) = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v31 + 4);
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "TelemetryWorker has processed already up to %f. Skipping execution.",  v31,  0xCu);
      swift_slowDealloc(v31, -1LL, -1LL);
    }

    uint64_t v32 = *(void *)(v0 + 616);
    uint64_t v33 = *(void *)(v0 + 560);
    uint64_t v34 = *(void *)(v0 + 528);

    id v35 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v51 = MLHostResult.init(status:policy:)(2LL, 1LL);
    swift_release(v32);
    v24(v33, v34);
    uint64_t v36 = *(void *)(v0 + 560);
    uint64_t v37 = *(void *)(v0 + 552);
    uint64_t v38 = *(void *)(v0 + 544);
    uint64_t v39 = *(void *)(v0 + 520);
    uint64_t v41 = *(void *)(v0 + 504);
    uint64_t v40 = *(void *)(v0 + 512);
    uint64_t v42 = *(void *)(v0 + 472);
    uint64_t v43 = *(void *)(v0 + 480);
    uint64_t v44 = *(void *)(v0 + 448);
    uint64_t v45 = *(void *)(v0 + 424);
    uint64_t v46 = *(void *)(v0 + 416);
    uint64_t v47 = *(void *)(v0 + 384);
    uint64_t v48 = *(void *)(v0 + 360);
    uint64_t v49 = *(void *)(v0 + 352);
    uint64_t v50 = *(void *)(v0 + 344);
    swift_task_dealloc(*(void *)(v0 + 584));
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    swift_task_dealloc(v43);
    swift_task_dealloc(v42);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v51);
  }

  else
  {
    *(_BYTE *)(v0 + 849) = 1;
    return swift_task_switch(sub_100004EC0, *(void *)(v0 + 624), *(void *)(v0 + 632));
  }
}

uint64_t sub_100004EC0()
{
  return swift_task_switch(sub_100004F10, 0LL, 0LL);
}

uint64_t sub_100004F10()
{
  uint64_t v1 = v0[65];
  uint64_t v3 = v0[63];
  uint64_t v2 = v0[64];
  uint64_t v4 = v0[61];
  uint64_t v5 = v0[62];
  uint64_t started = TelemetryBucketRange.telemetryStartDate.getter();
  Date.addingTimeInterval(_:)(started, -602000.0);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  double v7 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56);
  v0[84] = v7;
  uint64_t v8 = v7(v1, 0LL, 1LL, v4);
  TelemetryBucketRange.telemetryEndDate.getter(v8);
  v7(v2, 0LL, 1LL, v4);
  return swift_task_switch(sub_100004FDC, v0[78], v0[79]);
}

uint64_t sub_100004FDC()
{
  uint64_t v1 = v0[65];
  uint64_t v2 = v0[64];
  v0[85] = dispatch thunk of LedgerClient.getTaskStatusEvents(startDate:endDate:)(v1, v2);
  sub_10000A0FC(v2, &qword_1000100D8);
  sub_10000A0FC(v1, &qword_1000100D8);
  return swift_task_switch(sub_100005054, 0LL, 0LL);
}

uint64_t sub_100005054(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 680);
  if (*(void *)(v2 + 16))
  {
    uint64_t v3 = (os_log_s *)Logger.logObject.getter(a1);
    os_log_type_t v4 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Processing 24-hour analytics aggregation", v5, 2u);
      swift_slowDealloc(v5, -1LL, -1LL);
    }

    *(_BYTE *)(v1 + 848) = 2;
    return swift_task_switch(sub_1000052F4, *(void *)(v1 + 624), *(void *)(v1 + 632));
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v1 + 608));
    uint64_t v7 = swift_bridgeObjectRelease(v2);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "No events in ledger.", v10, 2u);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v1 + 664);
    uint64_t v12 = *(void *)(v1 + 616);
    uint64_t v13 = *(void *)(v1 + 560);
    uint64_t v14 = *(void *)(v1 + 528);

    uint64_t v33 = &type metadata for TelemetryError;
    unint64_t v34 = sub_100009F24();
    v32[0] = 1;
    id v15 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v31 = MLHostResult.init(error:policy:)(v32, 1LL);
    swift_release(v12);
    v11(v13, v14);
    uint64_t v16 = *(void *)(v1 + 560);
    uint64_t v17 = *(void *)(v1 + 552);
    uint64_t v18 = *(void *)(v1 + 544);
    uint64_t v19 = *(void *)(v1 + 520);
    uint64_t v21 = *(void *)(v1 + 504);
    uint64_t v20 = *(void *)(v1 + 512);
    uint64_t v22 = *(void *)(v1 + 472);
    uint64_t v23 = *(void *)(v1 + 480);
    uint64_t v24 = *(void *)(v1 + 448);
    uint64_t v25 = *(void *)(v1 + 424);
    uint64_t v26 = *(void *)(v1 + 416);
    uint64_t v27 = *(void *)(v1 + 384);
    uint64_t v28 = *(void *)(v1 + 360);
    uint64_t v29 = *(void *)(v1 + 352);
    uint64_t v30 = *(void *)(v1 + 344);
    swift_task_dealloc(*(void *)(v1 + 584));
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v23);
    swift_task_dealloc(v22);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    return (*(uint64_t (**)(uint64_t))(v1 + 8))(v31);
  }

uint64_t sub_1000052F4()
{
  return swift_task_switch(sub_100005344, 0LL, 0LL);
}

uint64_t sub_100005344()
{
  uint64_t v1 = v0[76];
  uint64_t v2 = v0[75];
  uint64_t v3 = v0[56];
  uint64_t v4 = v0[54];
  uint64_t v5 = enum case for BucketInterval.day(_:);
  NSString v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[55] + 104LL);
  v0[86] = v6;
  v6(v3, v5, v4);
  swift_bridgeObjectRetain(v1);
  TelemetryConfig.init(bucketInterval:contextId:deviceTelemetry:pushTelemetry:)(v3, v2, v1, 1LL, 1LL);
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to processTaskTelemetry(telemetryConfig:telemetryRange:allEvents:)[1]);
  v0[87] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000053F8;
  return processTaskTelemetry(telemetryConfig:telemetryRange:allEvents:)(v0[60], v0[70], v0[85]);
}

uint64_t sub_1000053F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)*v4;
  v5[14] = v4;
  v5[15] = a1;
  v5[16] = a2;
  v5[17] = a3;
  v5[18] = a4;
  uint64_t v6 = v5[87];
  v5[88] = a2;
  swift_task_dealloc(v6);
  return swift_task_switch(sub_100005458, 0LL, 0LL);
}

uint64_t sub_100005458()
{
  if (*(void *)(v0 + 704))
  {
    uint64_t v1 = *(void *)(v0 + 120);
    *(int8x16_t *)(v0 + 712) = vextq_s8(*(int8x16_t *)(v0 + 136), *(int8x16_t *)(v0 + 136), 8uLL);
    *(void *)(v0 + 728) = v1;
    *(_BYTE *)(v0 + 847) = 3;
    return swift_task_switch(sub_100005794, *(void *)(v0 + 624), *(void *)(v0 + 632));
  }

  else
  {
    uint64_t v3 = *(void *)(v0 + 680);
    uint64_t v4 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease(*(void *)(v0 + 608));
    swift_bridgeObjectRelease(v3);
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.info.getter();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void **)(v0 + 304);
    if (v7)
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      uint64_t v10 = swift_slowAlloc(64LL, -1LL);
      uint64_t v41 = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v11 = MLHostExtensionContext.taskId.getter();
      unint64_t v13 = v12;
      *(void *)(v0 + 200) = sub_100007E9C(v11, v12, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v9 + 4);
      swift_bridgeObjectRelease(v13);

      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v14 = MLHostExtensionContext.taskName.getter();
      unint64_t v16 = v15;
      *(void *)(v0 + 208) = sub_100007E9C(v14, v15, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v9 + 14);
      swift_bridgeObjectRelease(v16);

      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "TaskId: %s, TaskName: %s: asked to stop!",  (uint8_t *)v9,  0x16u);
      swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v18 = *(void *)(v0 + 616);
    uint64_t v19 = *(void *)(v0 + 560);
    uint64_t v20 = *(void *)(v0 + 528);
    uint64_t v21 = *(void *)(v0 + 480);
    uint64_t v22 = *(void *)(v0 + 456);
    uint64_t v23 = *(void *)(v0 + 464);
    id v24 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v40 = MLHostResult.init(status:policy:)(1LL, 1LL);
    swift_release(v18);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    v17(v19, v20);
    uint64_t v25 = *(void *)(v0 + 560);
    uint64_t v26 = *(void *)(v0 + 552);
    uint64_t v27 = *(void *)(v0 + 544);
    uint64_t v28 = *(void *)(v0 + 520);
    uint64_t v30 = *(void *)(v0 + 504);
    uint64_t v29 = *(void *)(v0 + 512);
    uint64_t v31 = *(void *)(v0 + 472);
    uint64_t v32 = *(void *)(v0 + 480);
    uint64_t v33 = *(void *)(v0 + 448);
    uint64_t v34 = *(void *)(v0 + 424);
    uint64_t v35 = *(void *)(v0 + 416);
    uint64_t v36 = *(void *)(v0 + 384);
    uint64_t v37 = *(void *)(v0 + 360);
    uint64_t v38 = *(void *)(v0 + 352);
    uint64_t v39 = *(void *)(v0 + 344);
    swift_task_dealloc(*(void *)(v0 + 584));
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v32);
    swift_task_dealloc(v31);
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v40);
  }

uint64_t sub_100005794()
{
  return swift_task_switch(sub_1000057E4, 0LL, 0LL);
}

uint64_t sub_1000057E4()
{
  uint64_t v1 = *(void *)(v0 + 720);
  uint64_t v2 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 704);
  uint64_t v4 = *(void *)(v0 + 312);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v0 + 736) = v5;
  os_log_type_t v6 = *(void **)(v4 + 32);
  *(void *)(v0 + 744) = v6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  sub_100008DD4(v3, v1, v2, v6, v5);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v1);
  uint64_t v7 = swift_bridgeObjectRelease(v3);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Processing 7-day analytics aggregation", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  *(_BYTE *)(v0 + 846) = 2;
  return swift_task_switch(sub_100005908, *(void *)(v0 + 624), *(void *)(v0 + 632));
}

uint64_t sub_100005908()
{
  return swift_task_switch(sub_100005958, 0LL, 0LL);
}

uint64_t sub_100005958()
{
  uint64_t v1 = *(void *)(v0 + 608);
  uint64_t v2 = *(void *)(v0 + 600);
  uint64_t v3 = *(void *)(v0 + 448);
  (*(void (**)(uint64_t, void, void))(v0 + 688))( v3,  enum case for BucketInterval.week(_:),  *(void *)(v0 + 432));
  TelemetryConfig.init(bucketInterval:contextId:deviceTelemetry:pushTelemetry:)(v3, v2, v1, 0LL, 0LL);
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to processTaskTelemetry(telemetryConfig:telemetryRange:allEvents:)[1]);
  *(void *)(v0 + 752) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100005A00;
  return processTaskTelemetry(telemetryConfig:telemetryRange:allEvents:)( *(void *)(v0 + 472),  *(void *)(v0 + 560),  *(void *)(v0 + 680));
}

uint64_t sub_100005A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)*v4;
  v5[19] = v4;
  v5[20] = a1;
  v5[21] = a2;
  v5[22] = a3;
  v5[23] = a4;
  uint64_t v6 = v5[94];
  uint64_t v7 = v5[85];
  v5[95] = a2;
  swift_task_dealloc(v6);
  swift_bridgeObjectRelease(v7);
  return swift_task_switch(sub_100005A6C, 0LL, 0LL);
}

uint64_t sub_100005A6C()
{
  if (*(void *)(v0 + 760))
  {
    uint64_t v1 = *(void *)(v0 + 176);
    *(void *)(v0 + 768) = *(void *)(v0 + 184);
    *(void *)(v0 + 776) = v1;
    *(_BYTE *)(v0 + 845) = 3;
    return swift_task_switch(sub_100005DB4, *(void *)(v0 + 624), *(void *)(v0 + 632));
  }

  else
  {
    uint64_t v3 = *(void *)(v0 + 720);
    uint64_t v4 = *(void *)(v0 + 704);
    uint64_t v5 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease(*(void *)(v0 + 712));
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v4);
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.info.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    os_log_type_t v9 = *(void **)(v0 + 304);
    if (v8)
    {
      uint64_t v10 = swift_slowAlloc(22LL, -1LL);
      uint64_t v11 = swift_slowAlloc(64LL, -1LL);
      uint64_t v44 = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v12 = MLHostExtensionContext.taskId.getter();
      unint64_t v14 = v13;
      *(void *)(v0 + 232) = sub_100007E9C(v12, v13, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v10 + 4);
      swift_bridgeObjectRelease(v14);

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v15 = MLHostExtensionContext.taskName.getter();
      unint64_t v17 = v16;
      *(void *)(v0 + 240) = sub_100007E9C(v15, v16, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248, v10 + 14);
      swift_bridgeObjectRelease(v17);

      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "TaskId: %s, TaskName: %s: asked to stop!",  (uint8_t *)v10,  0x16u);
      swift_arrayDestroy(v11, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1LL, -1LL);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v19 = *(void *)(v0 + 616);
    uint64_t v20 = *(void *)(v0 + 560);
    uint64_t v21 = *(void *)(v0 + 528);
    uint64_t v23 = *(void *)(v0 + 472);
    uint64_t v22 = *(void *)(v0 + 480);
    uint64_t v24 = *(void *)(v0 + 456);
    uint64_t v25 = *(void *)(v0 + 464);
    id v26 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v43 = MLHostResult.init(status:policy:)(1LL, 1LL);
    swift_release(v19);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v27(v23, v24);
    v27(v22, v24);
    v18(v20, v21);
    uint64_t v28 = *(void *)(v0 + 560);
    uint64_t v29 = *(void *)(v0 + 552);
    uint64_t v30 = *(void *)(v0 + 544);
    uint64_t v31 = *(void *)(v0 + 520);
    uint64_t v33 = *(void *)(v0 + 504);
    uint64_t v32 = *(void *)(v0 + 512);
    uint64_t v34 = *(void *)(v0 + 472);
    uint64_t v35 = *(void *)(v0 + 480);
    uint64_t v36 = *(void *)(v0 + 448);
    uint64_t v37 = *(void *)(v0 + 424);
    uint64_t v38 = *(void *)(v0 + 416);
    uint64_t v39 = *(void *)(v0 + 384);
    uint64_t v40 = *(void *)(v0 + 360);
    uint64_t v41 = *(void *)(v0 + 352);
    uint64_t v42 = *(void *)(v0 + 344);
    swift_task_dealloc(*(void *)(v0 + 584));
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v33);
    swift_task_dealloc(v35);
    swift_task_dealloc(v34);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v43);
  }

uint64_t sub_100005DB4()
{
  return swift_task_switch(sub_100005E04, 0LL, 0LL);
}

uint64_t sub_100005E04()
{
  uint64_t v1 = *(void *)(v0 + 776);
  uint64_t v2 = *(void *)(v0 + 768);
  uint64_t v3 = *(void *)(v0 + 760);
  sub_100008DD4(v3, v1, v2, *(void **)(v0 + 744), *(void **)(v0 + 736));
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v1);
  uint64_t v4 = swift_bridgeObjectRelease(v3);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Processing custom telemetry", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  *(_BYTE *)(v0 + 844) = 2;
  return swift_task_switch(sub_100005EF4, *(void *)(v0 + 624), *(void *)(v0 + 632));
}

uint64_t sub_100005EF4()
{
  return swift_task_switch(sub_100005F44, 0LL, 0LL);
}

uint64_t sub_100005F44()
{
  uint64_t v1 = (uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v0[84];
  uint64_t v2 = v0[65];
  uint64_t v3 = v0[64];
  uint64_t v4 = v0[61];
  TelemetryBucketRange.telemetryStartDate.getter();
  uint64_t v5 = v1(v2, 0LL, 1LL, v4);
  TelemetryBucketRange.telemetryEndDate.getter(v5);
  v1(v3, 0LL, 1LL, v4);
  return swift_task_switch(sub_100005FD4, v0[78], v0[79]);
}

uint64_t sub_100005FD4()
{
  uint64_t v1 = v0[65];
  uint64_t v2 = v0[64];
  v0[98] = dispatch thunk of LedgerClient.getCustomTaskEvents(startDate:endDate:taskName:)(v1, v2, 0LL, 0LL);
  sub_10000A0FC(v2, &qword_1000100D8);
  sub_10000A0FC(v1, &qword_1000100D8);
  return swift_task_switch(sub_100006054, 0LL, 0LL);
}

uint64_t sub_100006054()
{
  uint64_t v1 = swift_bridgeObjectRetain(v0[98]);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[98];
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[28] = *(void *)(v4 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 28, v0 + 29, v5 + 4);
    swift_bridgeObjectRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Custom Events: %ld", v5, 0xCu);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v0[98]);
  }

  os_log_type_t v6 = (void *)swift_task_alloc(async function pointer to processCustomTelemetry(customTelemetryEvents:bucketRange:)[1]);
  v0[99] = v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_100006170;
  return processCustomTelemetry(customTelemetryEvents:bucketRange:)(v0[98], v0[70]);
}

uint64_t sub_100006170(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 792LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 784LL);
  *(void *)(*(void *)v1 + 80Hasher.init(_seed:)(v5, 0LL) = a1;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_1000061D8, 0LL, 0LL);
}

uint64_t sub_1000061D8()
{
  if (*(void *)(v0 + 800))
  {
    *(_BYTE *)(v0 + 850) = 3;
    return swift_task_switch(sub_100006514, *(void *)(v0 + 624), *(void *)(v0 + 632));
  }

  else
  {
    uint64_t v2 = *(void *)(v0 + 720);
    uint64_t v3 = *(void *)(v0 + 704);
    uint64_t v4 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease(*(void *)(v0 + 712));
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(v3);
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.info.getter();
    BOOL v7 = os_log_type_enabled(v5, v6);
    BOOL v8 = *(void **)(v0 + 304);
    if (v7)
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      uint64_t v10 = swift_slowAlloc(64LL, -1LL);
      uint64_t v43 = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v11 = MLHostExtensionContext.taskId.getter();
      unint64_t v13 = v12;
      *(void *)(v0 + 264) = sub_100007E9C(v11, v12, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 264, v0 + 272, v9 + 4);
      swift_bridgeObjectRelease(v13);

      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v14 = MLHostExtensionContext.taskName.getter();
      unint64_t v16 = v15;
      *(void *)(v0 + 272) = sub_100007E9C(v14, v15, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v9 + 14);
      swift_bridgeObjectRelease(v16);

      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "TaskId: %s, TaskName: %s: asked to stop!",  (uint8_t *)v9,  0x16u);
      swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
    }

    unint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v18 = *(void *)(v0 + 616);
    uint64_t v19 = *(void *)(v0 + 560);
    uint64_t v20 = *(void *)(v0 + 528);
    uint64_t v22 = *(void *)(v0 + 472);
    uint64_t v21 = *(void *)(v0 + 480);
    uint64_t v23 = *(void *)(v0 + 456);
    uint64_t v24 = *(void *)(v0 + 464);
    id v25 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v42 = MLHostResult.init(status:policy:)(1LL, 1LL);
    swift_release(v18);
    id v26 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v26(v22, v23);
    v26(v21, v23);
    v17(v19, v20);
    uint64_t v27 = *(void *)(v0 + 560);
    uint64_t v28 = *(void *)(v0 + 552);
    uint64_t v29 = *(void *)(v0 + 544);
    uint64_t v30 = *(void *)(v0 + 520);
    uint64_t v32 = *(void *)(v0 + 504);
    uint64_t v31 = *(void *)(v0 + 512);
    uint64_t v33 = *(void *)(v0 + 472);
    uint64_t v34 = *(void *)(v0 + 480);
    uint64_t v35 = *(void *)(v0 + 448);
    uint64_t v36 = *(void *)(v0 + 424);
    uint64_t v37 = *(void *)(v0 + 416);
    uint64_t v38 = *(void *)(v0 + 384);
    uint64_t v39 = *(void *)(v0 + 360);
    uint64_t v40 = *(void *)(v0 + 352);
    uint64_t v41 = *(void *)(v0 + 344);
    swift_task_dealloc(*(void *)(v0 + 584));
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v34);
    swift_task_dealloc(v33);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v42);
  }

uint64_t sub_100006514()
{
  return swift_task_switch(sub_100006564, 0LL, 0LL);
}

uint64_t sub_100006564()
{
  uint64_t v1 = v0[100];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[50];
    uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v5 = v1 + ((v4 + 32) & ~v4);
    uint64_t v34 = *(void *)(v3 + 72);
    uint64_t v35 = v0[47];
    uint64_t v36 = (v4 + 16) & ~v4;
    uint64_t v37 = v3;
    os_log_type_t v6 = *(void (**)(void, void, void))(v3 + 16);
    unsigned int v32 = enum case for CoreAnalyticsEvents.customEventTelemetry(_:);
    uint64_t v31 = v36 + v0[51];
    uint64_t v30 = v4 | 7;
    uint64_t v33 = v6;
    do
    {
      uint64_t v38 = v2;
      uint64_t v18 = ((uint64_t (*)(void, uint64_t, void))v6)(v0[53], v5, v0[49]);
      uint64_t v19 = CustomEventAnalytics.coreAnalyticsDictionary.getter(v18);
      uint64_t v20 = swift_bridgeObjectRetain(v19);
      uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
      os_log_type_t v22 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc(12LL, -1LL);
        uint64_t v24 = swift_slowAlloc(32LL, -1LL);
        uint64_t v39 = v24;
        *(_DWORD *)uint64_t v23 = 136315138;
        uint64_t v25 = sub_10000A000(0LL, &qword_1000100F8, &OBJC_CLASS___NSObject_ptr);
        uint64_t v26 = Dictionary.description.getter(v19, &type metadata for String, v25, &protocol witness table for String);
        unint64_t v28 = v27;
        *(void *)(v23 + 4) = sub_100007E9C(v26, v27, &v39);
        swift_bridgeObjectRelease(v28);
        swift_bridgeObjectRelease_n(v19, 2LL);
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "CUSTOM EVENT: %s", (uint8_t *)v23, 0xCu);
        swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1LL, -1LL);
        swift_slowDealloc(v23, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(v19, 2LL);
      }

      uint64_t v7 = v0[52];
      uint64_t v8 = v0[53];
      uint64_t v9 = v0[48];
      uint64_t v10 = v0[49];
      uint64_t v11 = v0[46];
      uint64_t v12 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v35 + 104))(v9, v32, v11);
      CoreAnalyticsEvents.rawValue.getter(v12);
      uint64_t v14 = v13;
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v9, v11);
      NSString v15 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v14);
      os_log_type_t v6 = v33;
      v33(v7, v8, v10);
      uint64_t v16 = swift_allocObject(&unk_10000C968, v31, v30);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v16 + v36, v7, v10);
      v0[6] = sub_100009F74;
      v0[7] = v16;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256LL;
      v0[4] = sub_1000075D0;
      v0[5] = &unk_10000C980;
      unint64_t v17 = _Block_copy(v0 + 2);
      swift_release(v0[7]);
      AnalyticsSendEventLazy(v15, v17);
      _Block_release(v17);

      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v8, v10);
      v5 += v34;
      uint64_t v2 = v38 - 1;
    }

    while (v38 != 1);
    uint64_t v1 = v0[100];
  }

  swift_bridgeObjectRelease(v1);
  *((_BYTE *)v0 + 840) = 2;
  return swift_task_switch(sub_1000068B0, v0[78], v0[79]);
}

uint64_t sub_1000068B0()
{
  return swift_task_switch(sub_100006900, 0LL, 0LL);
}

uint64_t sub_100006900()
{
  double v1 = v0[91];
  uint64_t v2 = *((void *)v0 + 90);
  uint64_t v3 = *((void *)v0 + 89);
  uint64_t v4 = *((void *)v0 + 88);
  uint64_t v5 = *((void *)v0 + 70);
  id v6 = (id)BiomeLibrary();
  id v7 = [v6 Lighthouse];
  swift_unknownObjectRelease(v6);
  id v8 = [v7 Ledger];
  swift_unknownObjectRelease(v7);
  id v9 = [v8 DediscoPrivacyEvent];
  *((void *)v0 + 101) = v9;
  swift_unknownObjectRelease(v8);
  uint64_t v10 = getDediscoData(dediscoStream:telemetryRange:)(v9, v5);
  *((void *)v0 + 102) = v10;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  uint64_t v12 = (double **)swift_task_alloc(v11);
  *((void *)v0 + 103) = v12;
  *uint64_t v12 = v0;
  v12[1] = (double *)sub_100006A38;
  return processDediscoEvents(dediscoEventMap:telemetryRange:dailyTelemetryResults:)( v10,  *((void *)v0 + 70),  v4,  v2,  v3,  v1);
}

uint64_t sub_100006A38(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 824LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 816LL);
  uint64_t v4 = *(void *)(*(void *)v1 + 720LL);
  uint64_t v5 = *(void *)(*(void *)v1 + 712LL);
  uint64_t v6 = *(void *)(*(void *)v1 + 704LL);
  *(void *)(*(void *)v1 + 832LL) = a1;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(sub_100006ACC, 0LL, 0LL);
}

uint64_t sub_100006ACC()
{
  if (*(void *)(v0 + 832))
  {
    *(_BYTE *)(v0 + 842) = 3;
    return swift_task_switch(sub_100006E20, *(void *)(v0 + 624), *(void *)(v0 + 632));
  }

  else
  {
    uint64_t v2 = *(void *)(v0 + 720);
    uint64_t v3 = *(void *)(v0 + 704);
    uint64_t v4 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease(*(void *)(v0 + 712));
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(v3);
    uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.info.getter();
    BOOL v7 = os_log_type_enabled(v5, v6);
    id v8 = *(void **)(v0 + 304);
    if (v7)
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      uint64_t v10 = swift_slowAlloc(64LL, -1LL);
      uint64_t v44 = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v11 = MLHostExtensionContext.taskId.getter();
      unint64_t v13 = v12;
      *(void *)(v0 + 296) = sub_100007E9C(v11, v12, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 296, v0 + 304, v9 + 4);
      swift_bridgeObjectRelease(v13);

      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v14 = MLHostExtensionContext.taskName.getter();
      unint64_t v16 = v15;
      *(void *)(v0 + 280) = sub_100007E9C(v14, v15, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v9 + 14);
      swift_bridgeObjectRelease(v16);

      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "TaskId: %s, TaskName: %s: asked to stop!",  (uint8_t *)v9,  0x16u);
      swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1LL, -1LL);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    else
    {
    }

    unint64_t v17 = *(void **)(v0 + 808);
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
    uint64_t v18 = *(void *)(v0 + 616);
    uint64_t v19 = *(void *)(v0 + 560);
    uint64_t v20 = *(void *)(v0 + 528);
    uint64_t v22 = *(void *)(v0 + 472);
    uint64_t v21 = *(void *)(v0 + 480);
    uint64_t v23 = *(void *)(v0 + 456);
    uint64_t v24 = *(void *)(v0 + 464);
    id v25 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v43 = MLHostResult.init(status:policy:)(1LL, 1LL);
    swift_release(v18);

    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v26(v22, v23);
    v26(v21, v23);
    v41(v19, v20);
    uint64_t v27 = *(void *)(v0 + 560);
    uint64_t v28 = *(void *)(v0 + 552);
    uint64_t v29 = *(void *)(v0 + 544);
    uint64_t v30 = *(void *)(v0 + 520);
    uint64_t v32 = *(void *)(v0 + 504);
    uint64_t v31 = *(void *)(v0 + 512);
    uint64_t v33 = *(void *)(v0 + 472);
    uint64_t v34 = *(void *)(v0 + 480);
    uint64_t v35 = *(void *)(v0 + 448);
    uint64_t v36 = *(void *)(v0 + 424);
    uint64_t v37 = *(void *)(v0 + 416);
    uint64_t v38 = *(void *)(v0 + 384);
    uint64_t v39 = *(void *)(v0 + 360);
    uint64_t v40 = *(void *)(v0 + 352);
    uint64_t v42 = *(void *)(v0 + 344);
    swift_task_dealloc(*(void *)(v0 + 584));
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v34);
    swift_task_dealloc(v33);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v42);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v43);
  }

uint64_t sub_100006E20()
{
  return swift_task_switch(sub_100006E70, 0LL, 0LL);
}

uint64_t sub_100006E70()
{
  if (os_variant_has_internal_content("com.apple.lighthouse.TelemetryWorker"))
  {
    uint64_t v1 = v0[104];
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      uint64_t v3 = v0[41];
      uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
      uint64_t v5 = v1 + ((v4 + 32) & ~v4);
      uint64_t v63 = *(void *)(v3 + 72);
      uint64_t v64 = v0[47];
      os_log_type_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
      unsigned int v61 = enum case for CoreAnalyticsEvents.dediscoTelemetry(_:);
      uint64_t v65 = (v4 + 16) & ~v4;
      uint64_t v60 = v65 + v0[42];
      uint64_t v59 = v4 | 7;
      v62 = v6;
      uint64_t v58 = v3;
      do
      {
        uint64_t v20 = v0[44];
        uint64_t v19 = v0[45];
        uint64_t v21 = v0[40];
        v6(v19, v5, v21);
        uint64_t v22 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v20, v19, v21);
        uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
        os_log_type_t v24 = static os_log_type_t.info.getter();
        BOOL v25 = os_log_type_enabled(v23, v24);
        uint64_t v26 = v0[44];
        uint64_t v68 = v2;
        if (v25)
        {
          uint64_t v67 = v0[40];
          uint64_t v27 = swift_slowAlloc(12LL, -1LL);
          uint64_t v57 = swift_slowAlloc(32LL, -1LL);
          uint64_t v69 = v57;
          *(_DWORD *)uint64_t v27 = 136315138;
          uint64_t v28 = DediscoAnalytics.coreAnalyticsDictionary.getter();
          uint64_t v29 = sub_10000A000(0LL, &qword_1000100F8, &OBJC_CLASS___NSObject_ptr);
          uint64_t v30 = Dictionary.description.getter(v28, &type metadata for String, v29, &protocol witness table for String);
          unint64_t v32 = v31;
          swift_bridgeObjectRelease(v28);
          *(void *)(v27 + 4) = sub_100007E9C(v30, v32, &v69);
          swift_bridgeObjectRelease(v32);
          uint64_t v33 = v67;
          v66 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
          v66(v26, v33);
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "DeDisco Result: %s", (uint8_t *)v27, 0xCu);
          swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v57, -1LL, -1LL);
          swift_slowDealloc(v27, -1LL, -1LL);
        }

        else
        {
          v66 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
          v66(v26, v0[40]);
        }

        uint64_t v7 = v0[48];
        uint64_t v9 = v0[45];
        uint64_t v8 = v0[46];
        uint64_t v10 = v0[43];
        uint64_t v11 = v0[40];
        uint64_t v12 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v64 + 104))(v7, v61, v8);
        CoreAnalyticsEvents.rawValue.getter(v12);
        uint64_t v14 = v13;
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v7, v8);
        NSString v15 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v14);
        v62(v10, v9, v11);
        uint64_t v16 = swift_allocObject(&unk_10000C9B8, v60, v59);
        uint64_t v3 = v58;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32))(v16 + v65, v10, v11);
        v0[12] = sub_100009FAC;
        v0[13] = v16;
        v0[8] = _NSConcreteStackBlock;
        v0[9] = 1107296256LL;
        v0[10] = sub_1000075D0;
        v0[11] = &unk_10000C9D0;
        unint64_t v17 = _Block_copy(v0 + 8);
        swift_release(v0[13]);
        AnalyticsSendEventLazy(v15, v17);
        _Block_release(v17);

        uint64_t v18 = v11;
        os_log_type_t v6 = v62;
        v66(v9, v18);
        v5 += v63;
        uint64_t v2 = v68 - 1;
      }

      while (v68 != 1);
    }
  }

  uint64_t v34 = v0[82];
  swift_bridgeObjectRelease(v0[104]);
  id v35 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  swift_bridgeObjectRetain(v34);
  NSString v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v34);
  id v37 = [v35 initWithSuiteName:v36];

  uint64_t v38 = v0[90];
  uint64_t v39 = v0[89];
  uint64_t v40 = v0[88];
  if (v37)
  {
    swift_bridgeObjectRetain(v0[88]);
    swift_bridgeObjectRetain(v38);
    uint64_t v41 = swift_bridgeObjectRetain(v39);
    uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
    os_log_type_t v43 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = v0[91];
      uint64_t v45 = v0[90];
      uint64_t v46 = v0[89];
      uint64_t v47 = v0[88];
      uint64_t v48 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v48 = 134217984;
      v0[32] = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 33, v48 + 4);
      swift_bridgeObjectRelease(v47);
      swift_bridgeObjectRelease(v45);
      swift_bridgeObjectRelease(v46);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Marking lastProcessedTimestamp: %f", v48, 0xCu);
      swift_slowDealloc(v48, -1LL, -1LL);

      uint64_t v49 = v46;
    }

    else
    {
      uint64_t v50 = v0[90];
      uint64_t v51 = v0[89];
      uint64_t v52 = v0[88];

      swift_bridgeObjectRelease_n(v51, 2LL);
      swift_bridgeObjectRelease(v50);
      uint64_t v49 = v52;
    }

    swift_bridgeObjectRelease(v49);
    uint64_t v53 = v0[88];
    swift_bridgeObjectRelease(v0[90]);
    swift_bridgeObjectRelease(v53);
    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    NSString v55 = String._bridgeToObjectiveC()();
    [v37 setValue:isa forKey:v55];
  }

  else
  {
    swift_bridgeObjectRelease(v0[89]);
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v40);
  }

  *((_BYTE *)v0 + 843) = 4;
  return swift_task_switch(sub_1000073FC, v0[78], v0[79]);
}

uint64_t sub_1000073FC()
{
  return swift_task_switch(sub_10000744C, 0LL, 0LL);
}

uint64_t sub_10000744C()
{
  uint64_t v1 = *(void **)(v0 + 808);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 616);
  uint64_t v3 = *(void *)(v0 + 560);
  uint64_t v4 = *(void *)(v0 + 528);
  uint64_t v6 = *(void *)(v0 + 472);
  uint64_t v5 = *(void *)(v0 + 480);
  uint64_t v7 = *(void *)(v0 + 456);
  uint64_t v8 = *(void *)(v0 + 464);
  id v9 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v28 = MLHostResult.init(status:policy:)(2LL, 1LL);
  swift_release(v2);

  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v10(v6, v7);
  v10(v5, v7);
  v26(v3, v4);
  uint64_t v11 = *(void *)(v0 + 560);
  uint64_t v12 = *(void *)(v0 + 552);
  uint64_t v13 = *(void *)(v0 + 544);
  uint64_t v14 = *(void *)(v0 + 520);
  uint64_t v16 = *(void *)(v0 + 504);
  uint64_t v15 = *(void *)(v0 + 512);
  uint64_t v17 = *(void *)(v0 + 472);
  uint64_t v18 = *(void *)(v0 + 480);
  uint64_t v19 = *(void *)(v0 + 448);
  uint64_t v21 = *(void *)(v0 + 424);
  uint64_t v22 = *(void *)(v0 + 416);
  uint64_t v23 = *(void *)(v0 + 384);
  uint64_t v24 = *(void *)(v0 + 360);
  uint64_t v25 = *(void *)(v0 + 352);
  uint64_t v27 = *(void *)(v0 + 344);
  swift_task_dealloc(*(void *)(v0 + 584));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v18);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v28);
}

Class sub_1000075D0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10000A000(0LL, &qword_1000100F8, &OBJC_CLASS___NSObject_ptr);
    v5.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.Class isa = 0LL;
  }

  return v5.super.isa;
}

id sub_100007654(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100009E40(&qword_100010118);
  __chkstk_darwin();
  id v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v59 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  currentDataVersion.getter();
  Class isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  ((void (*)(void))TaskTelemetry.bucketRange.getter)();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v10(v6, v9, v3);
  sub_10000A0FC((uint64_t)v9, &qword_100010118);
  Class v57 = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v12 = v11(v6, v3);
  TaskTelemetry.bucketRange.getter(v12);
  v10(v6, &v9[*(int *)(v7 + 36)], v3);
  sub_10000A0FC((uint64_t)v9, &qword_100010118);
  Class v54 = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v13 = v11(v6, v3);
  TaskTelemetry.taskName.getter(v13);
  uint64_t v15 = v14;
  NSString v16 = String._bridgeToObjectiveC()();
  uint64_t v17 = swift_bridgeObjectRelease(v15);
  TaskTelemetry.taskState.getter(v17);
  uint64_t v19 = v18;
  NSString v56 = String._bridgeToObjectiveC()();
  uint64_t v20 = swift_bridgeObjectRelease(v19);
  TaskTelemetry.latestEventTimestamp.getter(v20);
  Class v55 = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v21 = v11(v6, v3);
  TaskTelemetry.countCompleted.getter(v21);
  Class v22 = Int._bridgeToObjectiveC()().super.super.isa;
  TaskTelemetry.countFailed.getter();
  Class v23 = Int._bridgeToObjectiveC()().super.super.isa;
  TaskTelemetry.countDeferred.getter();
  Class v24 = Int._bridgeToObjectiveC()().super.super.isa;
  Class v49 = v24;
  TaskTelemetry.dailyExecutionLatency.getter();
  Class v25 = Double._bridgeToObjectiveC()().super.super.isa;
  Class v50 = v25;
  TaskTelemetry.crossExecutionDelay.getter();
  Class v26 = Double._bridgeToObjectiveC()().super.super.isa;
  Class v51 = v26;
  TaskTelemetry.executionCompletionTime.getter();
  Class v27 = Double._bridgeToObjectiveC()().super.super.isa;
  Class v52 = v27;
  TaskTelemetry.executionFailureTime.getter();
  Class v28 = Double._bridgeToObjectiveC()().super.super.isa;
  Class v53 = v28;
  TaskTelemetry.executionFailureTime.getter();
  Class v29 = Double._bridgeToObjectiveC()().super.super.isa;
  Class v47 = v28;
  Class v45 = v26;
  Class v46 = v27;
  Class v43 = v24;
  Class v44 = v25;
  Class v41 = v22;
  Class v42 = v23;
  Class v30 = v23;
  Class v31 = v22;
  Class v32 = isa;
  Class v33 = v57;
  Class v35 = v54;
  Class v34 = v55;
  NSString v36 = v16;
  NSString v37 = v16;
  uint64_t v38 = v56;
  id v59 = [v59 initWithVersion:isa bucketStart:v57 bucketEnd:v54 taskName:v37 taskState:v56 latestEventTimestamp:v55 countCompleted:v41 countFailed:v42 count Deferred:v43 dailyExecutionLatency:v44 crossExecutionDelay:v45 executionCompletionTime:v46 executionFailureTime:v47 executionDeferralTime:v29];

  uint64_t v39 = type metadata accessor for TaskTelemetry(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8LL))(a1, v39);
  return v59;
}

id sub_100007958(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100009E40(&qword_100010118);
  __chkstk_darwin();
  id v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v26 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  currentDataVersion.getter();
  Class isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  ((void (*)(void))DeviceTelemetry.bucketRange.getter)();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v6, v9, v3);
  sub_10000A0FC((uint64_t)v9, &qword_100010118);
  Class v12 = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v14 = v13(v6, v3);
  DeviceTelemetry.bucketRange.getter(v14);
  v11(v6, &v9[*(int *)(v7 + 36)], v3);
  sub_10000A0FC((uint64_t)v9, &qword_100010118);
  Class v15 = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v16 = v13(v6, v3);
  DeviceTelemetry.tasksCount.getter(v16);
  Class v17 = Int._bridgeToObjectiveC()().super.super.isa;
  DeviceTelemetry.tasksRun.getter();
  Class v18 = Int._bridgeToObjectiveC()().super.super.isa;
  DeviceTelemetry.tasksDeferred.getter();
  Class v19 = Int._bridgeToObjectiveC()().super.super.isa;
  DeviceTelemetry.tasksFailed.getter();
  Class v20 = Int._bridgeToObjectiveC()().super.super.isa;
  DeviceTelemetry.tasksCompleted.getter();
  Class v21 = Int._bridgeToObjectiveC()().super.super.isa;
  id v22 = [v26 initWithVersion:isa bucketStart:v12 bucketEnd:v15 tasksCount:v17 tasksRun:v18 tasksDeferred:v19 tasksFailed:v20 tasksCompleted:v21];

  uint64_t v23 = type metadata accessor for DeviceTelemetry(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8LL))(a1, v23);
  return v22;
}

uint64_t sub_100007B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to MLHostExtension.shouldRun(context:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100007BE0;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100007BE0(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100007C30(uint64_t a1)
{
  __int128 v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 48) = v1[2];
  uint64_t v5 = (void *)swift_task_alloc(dword_1000100D4);
  *(void *)(v2 + 64) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007C9C;
  return sub_1000045F8(a1);
}

uint64_t sub_100007C9C(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 64));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100007CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  Class v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *Class v15 = v7;
  v15[1] = sub_100007D88;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100007D88()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100007DD0(uint64_t a1)
{
  unint64_t v2 = sub_100008D90();
  return MLHostExtension.configuration.getter(a1, v2);
}

double sub_100007E08@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2 = v4[1];
  *a1 = v4[0];
  a1[1] = v2;
  double result = *(double *)&v5;
  a1[2] = v5;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_100007E9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007F6C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A158((uint64_t)v12, *a3);
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
      sub_10000A158((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000A138(v12);
  return v7;
}

uint64_t sub_100007F6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100008124(a5, a6);
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

uint64_t sub_100008124(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000081B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008390(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008390(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000081B8(uint64_t a1, unint64_t a2)
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
      __int128 v5 = sub_10000832C(v4, 0LL);
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

void *sub_10000832C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100009E40((uint64_t *)&unk_100010120);
  __int128 v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008390(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100009E40((uint64_t *)&unk_100010120);
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

unint64_t _s32com_apple_mlhost_TelemetryWorker0D6StatesO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C6C8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5) {
    return 5LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_100008524()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AC90, &type metadata for TelemetryWorker);
    atomic_store(result, (unint64_t *)&qword_100010060);
  }

  return result;
}

unint64_t sub_10000856C()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryError,  &type metadata for TelemetryError);
    atomic_store(result, (unint64_t *)&qword_100010068);
  }

  return result;
}

unint64_t sub_1000085B4()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryError,  &type metadata for TelemetryError);
    atomic_store(result, (unint64_t *)&qword_100010070);
  }

  return result;
}

unint64_t sub_1000085FC()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryError,  &type metadata for TelemetryError);
    atomic_store(result, (unint64_t *)&qword_100010078);
  }

  return result;
}

unint64_t sub_100008644()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010080);
  }

  return result;
}

unint64_t sub_10000868C()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryStates,  &type metadata for TelemetryStates);
    atomic_store(result, (unint64_t *)&qword_100010088);
  }

  return result;
}

unint64_t sub_1000086D4()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryStates,  &type metadata for TelemetryStates);
    atomic_store(result, (unint64_t *)&qword_100010090);
  }

  return result;
}

unint64_t sub_10000871C()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryStates,  &type metadata for TelemetryStates);
    atomic_store(result, (unint64_t *)&qword_100010098);
  }

  return result;
}

unint64_t sub_100008764()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    uint64_t v1 = sub_1000087B0(qword_1000100A8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }

  return result;
}

uint64_t sub_1000087B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for TelemetryError(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TelemetryError(unsigned __int8 *a1, unsigned int a2)
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

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TelemetryError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000088E0 + 4 * byte_10000A9C5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100008914 + 4 * byte_10000A9C0[v4]))();
}

uint64_t sub_100008914(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000891C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100008924LL);
  }
  return result;
}

uint64_t sub_100008930(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100008938LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10000893C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008944(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008950(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000895C(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TelemetryError()
{
  return &type metadata for TelemetryError;
}

uint64_t getEnumTagSinglePayload for TelemetryStates(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TelemetryStates(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100008A54 + 4 * byte_10000A9CF[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100008A88 + 4 * byte_10000A9CA[v4]))();
}

uint64_t sub_100008A88(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008A90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100008A98LL);
  }
  return result;
}

uint64_t sub_100008AA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100008AACLL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_100008AB0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008AB8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100008AC4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TelemetryStates()
{
  return &type metadata for TelemetryStates;
}

uint64_t initializeBufferWithCopyOfBuffer for TelemetryWorker(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for TelemetryWorker(uint64_t a1)
{
}

void *initializeWithCopy for TelemetryWorker(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  __int128 v5 = (void *)a2[4];
  unsigned int v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  id v7 = v5;
  id v8 = v6;
  return a1;
}

void *assignWithCopy for TelemetryWorker(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  id v8 = (void *)a2[4];
  int64_t v9 = (void *)a1[4];
  a1[4] = v8;
  id v10 = v8;

  uint64_t v11 = (void *)a2[5];
  size_t v12 = (void *)a1[5];
  a1[5] = v11;
  id v13 = v11;

  return a1;
}

__n128 initializeWithTake for TelemetryWorker(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for TelemetryWorker(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(a1[3]);
  uint64_t v6 = (void *)a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);

  uint64_t v7 = (void *)a1[5];
  a1[5] = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for TelemetryWorker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TelemetryWorker(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
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

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TelemetryWorker()
{
  return &type metadata for TelemetryWorker;
}

uint64_t sub_100008D4C(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100008D90();
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

unint64_t sub_100008D90()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AC50, &type metadata for TelemetryWorker);
    atomic_store(result, &qword_1000100C8);
  }

  return result;
}

uint64_t sub_100008DD4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v168 = a5;
  id v166 = a4;
  uint64_t v143 = a3;
  uint64_t v142 = a2;
  uint64_t v153 = type metadata accessor for PushTelemetry(0LL);
  uint64_t v174 = *(void *)(v153 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v8 = (char *)&v138 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v141 = v7;
  __chkstk_darwin(v6);
  v169 = (char *)&v138 - v9;
  uint64_t v152 = type metadata accessor for DeviceTelemetry(0LL);
  uint64_t v173 = *(void *)(v152 - 8);
  uint64_t v10 = *(void *)(v173 + 64);
  uint64_t v11 = __chkstk_darwin(v152);
  v172 = (char *)&v138 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  v167.n128_u64[0] = (unint64_t)&v138 - v12;
  uint64_t v151 = type metadata accessor for BucketInterval(0LL);
  uint64_t v150 = *(void *)(v151 - 8);
  __chkstk_darwin(v151);
  v149 = (char *)&v138 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for CoreAnalyticsEvents(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v177 = v14;
  uint64_t v178 = v15;
  __chkstk_darwin(v14);
  v176 = (char *)&v138 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for TaskTelemetry(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v21 = __chkstk_darwin(v20);
  __chkstk_darwin(v21);
  v165 = (char *)&v138 - v24;
  uint64_t v25 = *(char **)(a1 + 16);
  v175 = v8;
  if (v25)
  {
    v164 = v23;
    uint64_t v170 = v22;
    uint64_t v140 = v10;
    uint64_t v163 = sub_10000A000(0LL, &qword_100010108, &OBJC_CLASS___BMLighthouseTaskTelemetry_ptr);
    uint64_t v26 = *(unsigned __int8 *)(v18 + 80);
    uint64_t v27 = a1 + ((v26 + 32) & ~v26);
    uint64_t v162 = *(void *)(v18 + 72);
    Class v28 = *(uint8_t **)(v18 + 16);
    LODWORD(v160) = enum case for CoreAnalyticsEvents.taskStatusTelemetry(_:);
    v159.n128_u64[0] = (v26 + 16) & ~v26;
    v158 = (char *)(v159.n128_u64[0] + v19);
    uint64_t v157 = v26 | 7;
    p_aBlock = &aBlock;
    uint64_t v139 = a1;
    __n128 v29 = swift_bridgeObjectRetain(a1);
    v29.n128_u64[0] = 136315394LL;
    __n128 v146 = v29;
    v145 = (char *)&type metadata for Any + 8;
    uint64_t v148 = v17;
    v161 = v28;
    uint64_t v144 = v18;
    do
    {
      v171 = v25;
      uint64_t v31 = (uint64_t)v165;
      ((void (*)(char *, uint64_t, uint64_t))v28)(v165, v27, v17);
      id v32 = sub_100007654(v31);
      [v166 sendEvent:v32];

      uint64_t v33 = v177;
      uint64_t v34 = v178;
      Class v35 = v176;
      uint64_t v36 = (*(uint64_t (**)(char *, void, uint64_t))(v178 + 104))(v176, v160, v177);
      CoreAnalyticsEvents.rawValue.getter(v36);
      uint64_t v38 = v37;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
      NSString v39 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v38);
      ((void (*)(uint64_t, uint64_t, uint64_t))v28)(v31, v27, v17);
      uint64_t v40 = swift_allocObject(&unk_10000CA08, v158, v157);
      Class v41 = v28;
      uint64_t v42 = v18;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v40 + v159.n128_u64[0], v31, v17);
      v184 = sub_100009FCC;
      uint64_t v185 = v40;
      aBlock = _NSConcreteStackBlock;
      uint64_t v181 = 1107296256LL;
      v182 = sub_1000075D0;
      v183 = &unk_10000CA20;
      Class v43 = _Block_copy(&aBlock);
      swift_release(v185);
      AnalyticsSendEventLazy(v39, v43);
      _Block_release(v43);

      if (qword_100010130 != -1) {
        swift_once(&qword_100010130, sub_100003FC0);
      }
      uint64_t v44 = type metadata accessor for Logger(0LL);
      sub_100009E80(v44, (uint64_t)qword_100010740);
      Class v45 = v164;
      ((void (*)(char *, uint64_t, uint64_t))v41)(v164, v27, v17);
      uint64_t v46 = v170;
      uint64_t v47 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v41)(v170, v27, v17);
      uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
      os_log_type_t v49 = static os_log_type_t.debug.getter();
      int v50 = v49;
      if (os_log_type_enabled(v48, v49))
      {
        Class v51 = v45;
        uint64_t v52 = swift_slowAlloc(22LL, -1LL);
        v156 = (void **)swift_slowAlloc(64LL, -1LL);
        aBlock = v156;
        *(_DWORD *)uint64_t v52 = v146.n128_u32[0];
        int v155 = v50;
        Class v53 = v149;
        uint64_t v54 = TaskTelemetry.bucketInterval.getter();
        uint64_t v55 = BucketInterval.description.getter(v54);
        unint64_t v57 = v56;
        (*(void (**)(char *, uint64_t))(v150 + 8))(v53, v151);
        uint64_t v179 = sub_100007E9C(v55, v57, (uint64_t *)&aBlock);
        uint64_t v58 = p_aBlock;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v179, p_aBlock, v52 + 4);
        swift_bridgeObjectRelease(v57);
        id v59 = *(uint64_t (**)(char *, uint64_t))(v42 + 8);
        uint64_t v60 = v51;
        uint64_t v17 = v148;
        uint64_t v61 = v59(v60, v148);
        *(_WORD *)(v52 + 12) = 2080;
        uint64_t v154 = v52 + 14;
        uint64_t v62 = v170;
        uint64_t v63 = TaskTelemetry.coreAnalyticsDictionary.getter(v61);
        uint64_t v64 = sub_10000A000(0LL, &qword_1000100F8, &OBJC_CLASS___NSObject_ptr);
        uint64_t v65 = Dictionary.description.getter(v63, &type metadata for String, v64, &protocol witness table for String);
        unint64_t v67 = v66;
        swift_bridgeObjectRelease(v63);
        uint64_t v179 = sub_100007E9C(v65, v67, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v179, v58, v154);
        swift_bridgeObjectRelease(v67);
        v59((char *)v62, v17);
        _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v155, "%s Output: %s", (uint8_t *)v52, 0x16u);
        uint64_t v68 = v156;
        swift_arrayDestroy(v156, 2LL, v145);
        swift_slowDealloc(v68, -1LL, -1LL);
        swift_slowDealloc(v52, -1LL, -1LL);

        uint64_t v18 = v144;
      }

      else
      {

        uint64_t v18 = v42;
        Class v30 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
        v30(v46, v17);
        v30((uint64_t)v45, v17);
      }

      v27 += v162;
      uint64_t v25 = v171 - 1;
      Class v28 = v161;
    }

    while (v171 != (char *)1);
    swift_bridgeObjectRelease(v139);
    uint64_t v10 = v140;
  }

  uint64_t v69 = v142;
  uint64_t v70 = *(void *)(v142 + 16);
  if (v70)
  {
    uint64_t v71 = sub_10000A000(0LL, &qword_100010110, &OBJC_CLASS___BMLighthouseDeviceTelemetry_ptr);
    uint64_t v72 = *(unsigned __int8 *)(v173 + 80);
    uint64_t v73 = v69 + ((v72 + 32) & ~v72);
    uint64_t v170 = *(void *)(v173 + 72);
    v74 = *(char **)(v173 + 16);
    LODWORD(v166) = enum case for CoreAnalyticsEvents.deviceStatusTelemetry(_:);
    v165 = (char *)((v72 + 16) & ~v72);
    v164 = &v165[v10];
    uint64_t v163 = v72 | 7;
    v160 = &aBlock;
    __n128 v75 = swift_bridgeObjectRetain(v69);
    v75.n128_u64[0] = 136315138LL;
    __n128 v159 = v75;
    v158 = (char *)&type metadata for Any + 8;
    uint64_t v76 = v152;
    v171 = v74;
    do
    {
      uint64_t v77 = v167.n128_u64[0];
      ((void (*)(unint64_t, uint64_t, uint64_t))v74)(v167.n128_u64[0], v73, v76);
      id v78 = sub_100007958(v77);
      [v168 sendEvent:v78];

      uint64_t v79 = v177;
      uint64_t v80 = v178;
      v81 = v176;
      uint64_t v82 = (*(uint64_t (**)(char *, void, uint64_t))(v178 + 104))(v176, v166, v177);
      CoreAnalyticsEvents.rawValue.getter(v82);
      uint64_t v84 = v83;
      uint64_t v85 = v79;
      v74 = v171;
      (*(void (**)(char *, uint64_t))(v80 + 8))(v81, v85);
      NSString v86 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v84);
      ((void (*)(uint64_t, uint64_t, uint64_t))v74)(v77, v73, v76);
      uint64_t v87 = swift_allocObject(&unk_10000CAA8, v164, v163);
      (*(void (**)(char *, uint64_t, uint64_t))(v173 + 32))(&v165[v87], v77, v76);
      v184 = sub_10000A0A8;
      uint64_t v185 = v87;
      aBlock = _NSConcreteStackBlock;
      uint64_t v181 = 1107296256LL;
      v182 = sub_1000075D0;
      v183 = &unk_10000CAC0;
      v88 = _Block_copy(&aBlock);
      swift_release(v185);
      AnalyticsSendEventLazy(v86, v88);
      _Block_release(v88);

      if (qword_100010130 != -1) {
        swift_once(&qword_100010130, sub_100003FC0);
      }
      uint64_t v89 = type metadata accessor for Logger(0LL);
      sub_100009E80(v89, (uint64_t)qword_100010740);
      v90 = v172;
      uint64_t v91 = ((uint64_t (*)(char *, uint64_t, uint64_t))v74)(v172, v73, v76);
      v92 = (os_log_s *)Logger.logObject.getter(v91);
      os_log_type_t v93 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v92, v93))
      {
        v94 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v162 = swift_slowAlloc(32LL, -1LL);
        aBlock = (void **)v162;
        *(_DWORD *)v94 = v159.n128_u32[0];
        v161 = v94 + 4;
        uint64_t v95 = DeviceTelemetry.coreAnalyticsDictionary.getter();
        uint64_t v96 = sub_10000A000(0LL, &qword_1000100F8, &OBJC_CLASS___NSObject_ptr);
        uint64_t v97 = Dictionary.description.getter(v95, &type metadata for String, v96, &protocol witness table for String);
        uint64_t v98 = v70;
        uint64_t v99 = v71;
        unint64_t v101 = v100;
        swift_bridgeObjectRelease(v95);
        uint64_t v102 = v97;
        uint64_t v76 = v152;
        uint64_t v179 = sub_100007E9C(v102, v101, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v179, v160, v161);
        unint64_t v103 = v101;
        uint64_t v71 = v99;
        uint64_t v70 = v98;
        v74 = v171;
        swift_bridgeObjectRelease(v103);
        (*(void (**)(char *, uint64_t))(v173 + 8))(v172, v76);
        _os_log_impl((void *)&_mh_execute_header, v92, v93, "Device Telemetry Output: %s", v94, 0xCu);
        uint64_t v104 = v162;
        swift_arrayDestroy(v162, 1LL, v158);
        swift_slowDealloc(v104, -1LL, -1LL);
        swift_slowDealloc(v94, -1LL, -1LL);
      }

      else
      {

        (*(void (**)(char *, uint64_t))(v173 + 8))(v90, v76);
      }

      v73 += v170;
      --v70;
    }

    while (v70);
    swift_bridgeObjectRelease(v142);
  }

  uint64_t result = v143;
  uint64_t v106 = *(void *)(v143 + 16);
  if (v106)
  {
    uint64_t v107 = *(unsigned __int8 *)(v174 + 80);
    uint64_t v108 = v143 + ((v107 + 32) & ~v107);
    uint64_t v109 = *(void *)(v174 + 72);
    uint64_t v110 = enum case for CoreAnalyticsEvents.pushTaskTelemetry(_:);
    uint64_t v173 = *(void *)(v178 + 104);
    v171 = (char *)(((v107 + 16) & ~v107) + v141);
    v172 = (char *)((v107 + 16) & ~v107);
    uint64_t v170 = v107 | 7;
    __n128 v111 = swift_bridgeObjectRetain(v143);
    v111.n128_u64[0] = 136315138LL;
    __n128 v167 = v111;
    id v166 = (char *)&type metadata for Any + 8;
    uint64_t v112 = v153;
    LODWORD(v168) = v110;
    do
    {
      v114 = v176;
      uint64_t v113 = v177;
      uint64_t v115 = ((uint64_t (*)(char *, uint64_t, uint64_t))v173)(v176, v110, v177);
      CoreAnalyticsEvents.rawValue.getter(v115);
      uint64_t v117 = v116;
      (*(void (**)(char *, uint64_t))(v178 + 8))(v114, v113);
      NSString v118 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v117);
      uint64_t v119 = v174;
      v120 = *(void (**)(char *, uint64_t, uint64_t))(v174 + 16);
      v121 = v169;
      v120(v169, v108, v112);
      uint64_t v122 = swift_allocObject(&unk_10000CA58, v171, v170);
      (*(void (**)(char *, char *, uint64_t))(v119 + 32))(&v172[v122], v121, v112);
      v184 = sub_100009FEC;
      uint64_t v185 = v122;
      aBlock = _NSConcreteStackBlock;
      uint64_t v181 = 1107296256LL;
      v182 = sub_1000075D0;
      v183 = &unk_10000CA70;
      v123 = _Block_copy(&aBlock);
      swift_release(v185);
      AnalyticsSendEventLazy(v118, v123);
      _Block_release(v123);

      if (qword_100010130 != -1) {
        swift_once(&qword_100010130, sub_100003FC0);
      }
      uint64_t v124 = type metadata accessor for Logger(0LL);
      sub_100009E80(v124, (uint64_t)qword_100010740);
      uint64_t v125 = ((uint64_t (*)(char *, uint64_t, uint64_t))v120)(v175, v108, v112);
      v126 = (os_log_s *)Logger.logObject.getter(v125);
      os_log_type_t v127 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v126, v127))
      {
        uint64_t v128 = swift_slowAlloc(12LL, -1LL);
        uint64_t v129 = v109;
        v130 = (void **)swift_slowAlloc(32LL, -1LL);
        aBlock = v130;
        *(_DWORD *)uint64_t v128 = v167.n128_u32[0];
        uint64_t v131 = PushTelemetry.coreAnalyticsDictionary.getter();
        uint64_t v132 = sub_10000A000(0LL, &qword_1000100F8, &OBJC_CLASS___NSObject_ptr);
        uint64_t v133 = Dictionary.description.getter(v131, &type metadata for String, v132, &protocol witness table for String);
        unint64_t v135 = v134;
        swift_bridgeObjectRelease(v131);
        uint64_t v136 = v133;
        uint64_t v112 = v153;
        *(void *)(v128 + 4) = sub_100007E9C(v136, v135, (uint64_t *)&aBlock);
        swift_bridgeObjectRelease(v135);
        (*(void (**)(char *, uint64_t))(v174 + 8))(v175, v112);
        _os_log_impl((void *)&_mh_execute_header, v126, v127, "Push Telemetry Output: %s", (uint8_t *)v128, 0xCu);
        swift_arrayDestroy(v130, 1LL, v166);
        v137 = v130;
        uint64_t v109 = v129;
        uint64_t v110 = v168;
        swift_slowDealloc(v137, -1LL, -1LL);
        swift_slowDealloc(v128, -1LL, -1LL);
      }

      else
      {

        (*(void (**)(char *, uint64_t))(v174 + 8))(v175, v112);
      }

      v108 += v109;
      --v106;
    }

    while (v106);
    return swift_bridgeObjectRelease(v143);
  }

  return result;
}

void sub_100009CB8(void *a1@<X8>)
{
  id v2 = (id)BiomeLibrary();
  id v3 = [v2 Lighthouse];
  swift_unknownObjectRelease(v2);
  id v4 = [v3 Ledger];
  swift_unknownObjectRelease(v3);
  id v5 = [v4 TaskTelemetry];
  swift_unknownObjectRelease(v4);
  id v6 = [v5 source];

  id v7 = (id)BiomeLibrary();
  id v8 = [v7 Lighthouse];
  swift_unknownObjectRelease(v7);
  id v9 = [v8 Ledger];
  swift_unknownObjectRelease(v8);
  id v10 = [v9 DeviceTelemetry];
  swift_unknownObjectRelease(v9);
  id v11 = [v10 source];

  *a1 = 0xD000000000000010LL;
  a1[1] = 0x800000010000AD60LL;
  a1[2] = 0xD000000000000017LL;
  a1[3] = 0x800000010000AD80LL;
  a1[4] = v6;
  a1[5] = v11;
}

uint64_t sub_100009E40(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100009E80(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100009E98()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    uint64_t v1 = type metadata accessor for LedgerClient(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for LedgerClient, v1);
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }

  return result;
}

unint64_t sub_100009EE0()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryStates,  &type metadata for TelemetryStates);
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }

  return result;
}

unint64_t sub_100009F24()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TelemetryError,  &type metadata for TelemetryError);
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }

  return result;
}

uint64_t sub_100009F68()
{
  return sub_10000A044((uint64_t (*)(void))&type metadata accessor for CustomEventAnalytics);
}

uint64_t sub_100009F74()
{
  return sub_10000A0BC( (void (*)(void))&type metadata accessor for CustomEventAnalytics,  (uint64_t (*)(void))&CustomEventAnalytics.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009F88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009F98(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100009FA0()
{
  return sub_10000A044((uint64_t (*)(void))&type metadata accessor for DediscoAnalytics);
}

uint64_t sub_100009FAC()
{
  return sub_10000A0BC( (void (*)(void))&type metadata accessor for DediscoAnalytics,  (uint64_t (*)(void))&DediscoAnalytics.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009FC0()
{
  return sub_10000A044((uint64_t (*)(void))&type metadata accessor for TaskTelemetry);
}

uint64_t sub_100009FCC()
{
  return sub_10000A0BC( (void (*)(void))&type metadata accessor for TaskTelemetry,  (uint64_t (*)(void))&TaskTelemetry.coreAnalyticsDictionary.getter);
}

uint64_t sub_100009FE0()
{
  return sub_10000A044((uint64_t (*)(void))&type metadata accessor for PushTelemetry);
}

uint64_t sub_100009FEC()
{
  return sub_10000A0BC( (void (*)(void))&type metadata accessor for PushTelemetry,  (uint64_t (*)(void))&PushTelemetry.coreAnalyticsDictionary.getter);
}

uint64_t sub_10000A000(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_10000A038()
{
  return sub_10000A044((uint64_t (*)(void))&type metadata accessor for DeviceTelemetry);
}

uint64_t sub_10000A044(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10000A0A8()
{
  return sub_10000A0BC( (void (*)(void))&type metadata accessor for DeviceTelemetry,  (uint64_t (*)(void))&DeviceTelemetry.coreAnalyticsDictionary.getter);
}

uint64_t sub_10000A0BC(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_10000A0FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100009E40(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000A138(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A158(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10000A198(uint64_t a1, uint64_t *a2)
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
void sub_10000348C()
{
  uint64_t v0;
  uint64_t v1;
  v0 = type metadata accessor for Instrumentation();
  v1 = sub_100005130(v0, 56LL);
  sub_10000420C();
  qword_10005C6F0 = v1;
  sub_100005168();
}

void variable initialization expression of Instrumentation.selfLogger()
{
  uint64_t v0 = type metadata accessor for SelfLoggingHelper();
  uint64_t v1 = sub_100005124(v0);
  *(void *)(v1 + 16) = [(id)objc_opt_self(AssistantSiriAnalytics) sharedStream];
  sub_100005168();
}

void variable initialization expression of Instrumentation.signpostLogger()
{
  uint64_t v0 = type metadata accessor for SignpostHelper(0LL);
  sub_1000051E8(v0);
  sub_1000058AC();
  sub_100005168();
}

uint64_t variable initialization expression of Instrumentation.powerLogger()
{
  uint64_t v0 = type metadata accessor for PowerlogHelper();
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t variable initialization expression of Instrumentation.coreAnalyticsLogger()
{
  uint64_t v0 = type metadata accessor for CoreAnalyticsLoggingHelper();
  return swift_allocObject(v0, 16LL, 7LL);
}

void variable initialization expression of Instrumentation.ondeviceRecordLogger()
{
  uint64_t v0 = type metadata accessor for OndeviceRecordHelper();
  sub_100005124(v0);
  sub_10000C85C();
  sub_100005168();
}

BOOL sub_100003598(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_1000035A4(char a1, char a2)
{
  return a1 == a2;
}

void sub_1000035B4()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_100004B88((uint64_t *)&unk_10005BFB0);
  sub_100005114();
  __chkstk_darwin(v9);
  sub_1000050EC();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_100005154();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_1000050FC();
  sub_100004BC8(v8, v12);
  if (sub_100004C10(v12, 1LL, v13) == 1)
  {
    sub_100004C1C(v12);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v0, v12, v13);
    sub_10000A1A0(v0, v6, v4, v2);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v13);
  }

  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v65 = v2;
    }
    else {
      uint64_t v65 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v65);
    sub_1000051A8();
  }

  else
  {
    uint64_t v15 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  if (v15 == 2)
  {
    unint64_t v16 = v2 & 0xC000000000000001LL;
    sub_100027310(0LL, (v2 & 0xC000000000000001LL) == 0);
    if ((v2 & 0xC000000000000001LL) != 0) {
      id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v2);
    }
    else {
      id v17 = *(id *)(v2 + 32);
    }
    v18 = v17;
    sub_100027310(1LL, v16 == 0);
    if (v16) {
      id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(1LL, v2);
    }
    else {
      id v19 = *(id *)(v2 + 40);
    }
    v25 = v19;
    id v26 = [v18 startedOrChanged];
    if (v26)
    {
      v27 = v26;
      sub_1000051D4();
      uint64_t v66 = v28;
      v29._countAndFlagsBits = sub_1000092E8();
      object = (_TtC22localspeechrecognition19EARSpeechRecognizer *)v29._object;
      String.append(_:)(v29);
      swift_bridgeObjectRelease(object, v31, v32, v33, v34, v35, v36, v37);
      uint64_t v38 = sub_100009394();
      sub_1000059C4("ES: ANE Model Init", 18LL, 2, v66, 0xE90000000000003DLL, v38);
      swift_bridgeObjectRelease( (_TtC22localspeechrecognition19EARSpeechRecognizer *)0xE90000000000003DLL,  v39,  v40,  v41,  v42,  v43,  v44,  v45);
      id v46 = [v25 ended];
      if (v46)
      {
        v47 = v46;
        if ([v46 exists])
        {
          v48._countAndFlagsBits = sub_1000092E8();
          v49 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)v48._object;
          String.append(_:)(v48);
          swift_bridgeObjectRelease(v49, v50, v51, v52, v53, v54, v55, v56);
          uint64_t v57 = sub_100009394();
          sub_100005FCC("ES: ANE Model Init", 18LL, 2, 0x656D616E656C6946LL, 0xE90000000000003DLL, v57);
          swift_bridgeObjectRelease( (_TtC22localspeechrecognition19EARSpeechRecognizer *)0xE90000000000003DLL,  v58,  v59,  v60,  v61,  v62,  v63,  v64);
        }
      }

      else
      {
LABEL_23:
      }
    }

    else
    {
    }
  }

  else if (v15 >= 1)
  {
    if (qword_10005A208 != -1) {
      swift_once(&qword_10005A208, sub_100005224);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    sub_100004C5C(v20, (uint64_t)qword_10005C6F8);
    uint64_t v21 = swift_bridgeObjectRetain(v2);
    v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)v24 = 134217984;
      uint64_t v66 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v24 + 4);
      sub_1000051A8();
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "Unexpected pending ane model initialization event count %ld",  v24,  0xCu);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    else
    {

      sub_1000051A8();
    }
  }

  sub_1000050C0();
}

void sub_10000399C()
{
}

void sub_1000039B0()
{
}

void sub_1000039C4()
{
  v24 = v2;
  v25 = v3;
  os_log_type_t v23 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  sub_100004B88((uint64_t *)&unk_10005BFB0);
  sub_100005114();
  __chkstk_darwin(v15);
  uint64_t v16 = sub_100005138();
  sub_100005198();
  __chkstk_darwin(v17);
  sub_1000050EC();
  uint64_t v20 = v19 - v18;
  sub_100004BC8(v14, v1);
  if (sub_100004C10(v1, 1LL, v16) == 1)
  {
    sub_100004C1C(v1);
  }

  else
  {
    sub_1000051C8(v20, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
    v23(v20, v12, v10, v8);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v20, v16);
  }

  sub_1000051D4();
  uint64_t v26 = v21;
  v22._countAndFlagsBits = v6;
  v22._object = v24;
  String.append(_:)(v22);
  v25("ES: ANE Model Init", 18LL, 2LL, v26, 0xE90000000000003DLL, v8);
  swift_bridgeObjectRelease(0xE90000000000003DLL);
  sub_1000050C0();
}

void sub_100003B04()
{
}

void sub_100003B20()
{
}

void sub_100003B3C()
{
}

void sub_100003B5C()
{
  uint64_t v20 = v3;
  uint64_t v21 = v4;
  uint64_t v6 = v5;
  uint64_t v19 = v7;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  sub_100004B88((uint64_t *)&unk_10005BFB0);
  sub_100005114();
  __chkstk_darwin(v16);
  uint64_t v17 = sub_100005138();
  sub_100005198();
  __chkstk_darwin(v18);
  sub_1000050FC();
  sub_100004BC8(v15, v2);
  if (sub_100004C10(v2, 1LL, v17) == 1)
  {
    sub_100004C1C(v2);
  }

  else
  {
    sub_1000051C8(v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
    v19(v1, v13, v11, v9);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v17);
  }

  v21(v6, v20, 2LL, 0LL, 0xE000000000000000LL, v9);
  sub_1000050C0();
}

void sub_100003C60()
{
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  sub_100004B88((uint64_t *)&unk_10005BFB0);
  sub_100005114();
  __chkstk_darwin(v11);
  sub_1000050FC();
  uint64_t v12 = sub_100005154();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000050EC();
  uint64_t v16 = v15 - v14;
  sub_100004BC8(v10, v0);
  if (sub_100004C10(v0, 1LL, v12) == 1)
  {
    sub_100004C1C(v0);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v16, v0, v12);
    sub_10000A560(v16, v8, v6, v4, v2);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  }

  sub_100005FCC("ES: JIT Profile Build Load", 26LL, 2, 0LL, 0xE000000000000000LL, v4);
  sub_1000050C0();
}

void sub_100003D78( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, void *a10, char a11, uint64_t a12, void *a13, uint64_t a14, void *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, char a21, unint64_t a22, unsigned __int8 a23)
{
  uint64_t v33 = v32 - v31;
  uint64_t v34 = sub_100005154();
  sub_100005198();
  __chkstk_darwin(v35);
  sub_1000050EC();
  uint64_t v38 = v37 - v36;
  sub_100004BC8(a1, v33);
  if (sub_100004C10(v33, 1LL, v34) == 1)
  {
    uint64_t v39 = (uint64_t)a10;
    sub_100004C1C(v33);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v38, v33, v34);
    uint64_t v39 = (uint64_t)a10;
    LOBYTE(v42) = a16 & 1;
    sub_10000A6F4( v38,  a2,  a3,  a6,  a7,  a9,  a8,  a10,  a11 & 1,  a12,  a13,  a14,  a15,  v42,  a17,  a18,  a19,  a20,  a21 & 1,  a22,  a23);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v38, v34);
  }

  uint64_t v40 = a4;
  uint64_t v41 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000LL) == 0) {
    uint64_t v41 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v41)
  {
    swift_bridgeObjectRetain(a5);
  }

  else
  {
    a5 = 0x8000000100043800LL;
    uint64_t v40 = 0xD000000000000018LL;
  }

  sub_10000BEDC(v40, a5, a6, a7, a8, v39);
  swift_bridgeObjectRelease(a5);
}

rusage_info_t sub_100003FEC()
{
  pid_t v0 = getpid();
  proc_pid_rusage(v0, 4, v2);
  return v2[31];
}

uint64_t sub_100004058(unint64_t a1)
{
  if (a1 >= 6) {
    return 5LL;
  }
  else {
    return (0x40302010005uLL >> (8 * a1));
  }
}

uint64_t sub_10000407C(unsigned __int8 a1)
{
  return a1 + 1LL;
}

BOOL sub_100004088(char *a1, char *a2)
{
  return sub_1000035A4(*a1, *a2);
}

Swift::Int sub_100004094()
{
  return sub_10000409C(*v0);
}

Swift::Int sub_10000409C(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

void sub_1000040E4(uint64_t a1)
{
}

void sub_1000040EC(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_100004114(uint64_t a1)
{
  return sub_10000411C(a1, *v1);
}

Swift::Int sub_10000411C(uint64_t a1, unsigned __int8 a2)
{
  return Hasher._finalize()();
}

uint64_t sub_100004160@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_100004058(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100004188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000407C(*v1);
  *a1 = result;
  return result;
}

void *Instrumentation.deinit()
{
  return v0;
}

uint64_t Instrumentation.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

void sub_10000420C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SelfLoggingHelper();
  uint64_t v3 = sub_100005124(v2);
  *(void *)(v3 + 16) = [(id)objc_opt_self(AssistantSiriAnalytics) sharedStream];
  v1[2] = v3;
  uint64_t v4 = type metadata accessor for SignpostHelper(0LL);
  sub_1000051E8(v4);
  v1[3] = sub_1000058AC();
  uint64_t v5 = type metadata accessor for PowerlogHelper();
  v1[4] = sub_100005130(v5, 16LL);
  uint64_t v6 = type metadata accessor for CoreAnalyticsLoggingHelper();
  v1[5] = sub_100005130(v6, 16LL);
  uint64_t v7 = type metadata accessor for OndeviceRecordHelper();
  sub_100005124(v7);
  v1[6] = sub_10000C85C();
  sub_100005168();
}

float variable initialization expression of RequestEndMetrics.cpuRealTimeFactor()
{
  return 0.0;
}

uint64_t variable initialization expression of RequestEndMetrics.numLmeDataStreams()
{
  return sub_1000051B0(0LL);
}

uint64_t variable initialization expression of RequestEndMetrics.totalITNRuns()
{
  return sub_1000051B0(1LL);
}

void *RequestEndMetrics.deinit()
{
  return v0;
}

uint64_t RequestEndMetrics.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 365LL, 7LL);
}

uint64_t type metadata accessor for Instrumentation()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition15Instrumentation);
}

uint64_t type metadata accessor for RequestEndMetrics()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition17RequestEndMetrics);
}

void type metadata accessor for SFEntitledAssetType(uint64_t a1)
{
}

_BYTE *initializeBufferWithCopyOfBuffer for Instrumentation.CompletionState(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Instrumentation.CompletionState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Instrumentation.CompletionState( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000044C8 + 4 * byte_10003D655[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1000044FC + 4 * byte_10003D650[v4]))();
}

uint64_t sub_1000044FC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004504(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000450CLL);
  }
  return result;
}

uint64_t sub_100004518(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100004520LL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_100004524(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000452C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004538(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100004544(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Instrumentation.CompletionState()
{
  return &type metadata for Instrumentation.CompletionState;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

unint64_t sub_100004574()
{
  unint64_t result = qword_10005AC70;
  if (!qword_10005AC70)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D8EC, &type metadata for Instrumentation.CompletionState);
    atomic_store(result, (unint64_t *)&qword_10005AC70);
  }

  return result;
}

uint64_t sub_1000045B0(uint64_t a1)
{
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000045F0(uint64_t a1)
{
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004634(uint64_t a1)
{
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100004674()
{
  return *v0;
}

uint64_t sub_10000467C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100004684(uint64_t a1)
{
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000046C4(uint64_t a1)
{
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004704(uint64_t a1)
{
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100004748()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(SFSpeechErrorDomain);
}

uint64_t sub_100004758(uint64_t a1)
{
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100004798(uint64_t a1)
{
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000047DC()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(@"kLSRErrorDomain");
}

uint64_t sub_1000047EC(uint64_t a1)
{
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10000482C(uint64_t a1)
{
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10000486C(void *a1, uint64_t a2)
{
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_1000048D0()
{
  return sub_1000048D8(*v0);
}

uint64_t sub_1000048D8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100004908(uint64_t a1, uint64_t a2)
{
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

void sub_10000495C(uint64_t a1@<X8>)
{
  *(void *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

  ;
}

uint64_t sub_100004994@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_2(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1000049BC(void *a1, uint64_t a2)
{
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100004A20(uint64_t a1, uint64_t a2)
{
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100004A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

uint64_t sub_100004ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100004B24(uint64_t *a1, uint64_t *a2)
{
  return sub_100003598(*a1, *a2);
}

uint64_t sub_100004B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100004B88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100004C1C(uint64_t a1)
{
  uint64_t v2 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100004C5C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for SFSpeechError(uint64_t a1)
{
}

void type metadata accessor for LSRError(uint64_t a1)
{
}

void sub_100004C9C()
{
}

void sub_100004CC8()
{
}

void sub_100004CF4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_100005168();
}

void sub_100004D30()
{
}

void sub_100004D5C()
{
}

void sub_100004D88()
{
}

void sub_100004DB4()
{
}

void sub_100004DE0()
{
}

void sub_100004E0C()
{
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

void sub_100004E4C()
{
}

unint64_t sub_100004E7C()
{
  unint64_t result = qword_10005ACD8;
  if (!qword_10005ACD8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10005ACD8);
  }

  return result;
}

void sub_100004EB8()
{
}

void sub_100004EE4()
{
}

void sub_100004F10()
{
}

void sub_100004F3C()
{
}

void sub_100004F68()
{
}

void sub_100004F94()
{
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100004FD4(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_100005018()
{
}

void sub_100005044()
{
}

void sub_100005070()
{
}

uint64_t _s22localspeechrecognition31VoiceCommandDebugInfoAggregatedV05hasNobC17AfterRespeakCheckSbvpfi_0()
{
  return 0LL;
}

  ;
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC8pmOutputSSSgvpfi_0()
{
  return 0LL;
}

double _s22localspeechrecognition17RequestEndMetricsC6cpuRtfSdvpfi_0()
{
  return 0.0;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100005124(uint64_t a1)
{
  return swift_allocObject(a1, 24LL, 7LL);
}

uint64_t sub_100005130(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_100005138()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_100005154()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC33languageModelInterpolationWeightsSSSgvpfi_0()
{
  return 0LL;
}

  ;
}

void sub_100005170()
{
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC34cpuInstructionsInMillionsPerSeconds6UInt64Vvpfi_0()
{
  return 0LL;
}

  ;
}

  ;
}

uint64_t sub_1000051A8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000051B0@<X0>(uint64_t a1@<X8>)
{
  return a1 << 32;
}

uint64_t _s22localspeechrecognition17RequestEndMetricsC20totalITNDurationInNss6UInt64VSgvpfi_0()
{
  return 0LL;
}

uint64_t sub_1000051C8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v3, v2);
}

  ;
}

uint64_t sub_1000051E8(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

uint64_t sub_1000051F4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for CoreAnalyticsLoggingHelper()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition26CoreAnalyticsLoggingHelper);
}

uint64_t sub_100005224(uint64_t a1)
{
  return sub_10000528C(a1, qword_10005C6F8, &SFLogFramework);
}

uint64_t *sub_100005238(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005278(uint64_t a1)
{
  return sub_10000528C(a1, qword_10005C710, (id *)&SFLogConnection);
}

uint64_t sub_10000528C(uint64_t a1, uint64_t *a2, id *a3)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  sub_100005238(v5, a2);
  sub_100004C5C(v5, (uint64_t)a2);
  uint64_t result = SFLogInitIfNeeded();
  if (*a3) {
    return Logger.init(_:)(*a3);
  }
  __break(1u);
  return result;
}

void sub_1000052F4()
{
  uint64_t v0 = sub_100004B88(&qword_10005AE80);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_100004B88(&qword_10005AE88);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Locale.Language.languageCode.getter(v4);
  uint64_t v7 = type metadata accessor for Locale.LanguageCode(0LL);
  if (sub_100004C10((uint64_t)v6, 1LL, v7) == 1)
  {
    uint64_t v8 = &qword_10005AE88;
    uint64_t v9 = (uint64_t)v6;
  }

  else
  {
    uint64_t v10 = Locale.LanguageCode.identifier.getter();
    uint64_t v12 = v11;
    uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
    Locale.Language.region.getter(v13);
    uint64_t v14 = type metadata accessor for Locale.Region(0LL);
    if (sub_100004C10((uint64_t)v2, 1LL, v14) != 1)
    {
      uint64_t v15 = Locale.Region.identifier.getter();
      uint64_t v17 = v16;
      (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8LL))(v2, v14);
      v20[0] = v10;
      v20[1] = v12;
      v18._countAndFlagsBits = 45LL;
      v18._object = (void *)0xE100000000000000LL;
      String.append(_:)(v18);
      v19._countAndFlagsBits = v15;
      v19._object = v17;
      String.append(_:)(v19);
      swift_bridgeObjectRelease(v17);
      goto LABEL_7;
    }

    swift_bridgeObjectRelease(v12);
    uint64_t v8 = &qword_10005AE80;
    uint64_t v9 = (uint64_t)v2;
  }

  sub_100005658(v9, v8);
LABEL_7:
  sub_1000056A0();
}

void sub_100005494()
{
  uint64_t v0 = type metadata accessor for Locale.Language(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v26 - v6;
  Locale.language.getter(v5);
  sub_1000052F4();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = (*(uint64_t (**)(char *, char *, uint64_t))(v1 + 16))(v4, v7, v0);
  if (!v11)
  {
    uint64_t v9 = Locale.Language.minimalIdentifier.getter(v12);
    uint64_t v11 = v13;
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  sub_1000056B4();
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = (id)_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();

  if (v15)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    uint64_t v17 = v16;
  }

  else
  {
    swift_bridgeObjectRetain(v11);
    uint64_t v17 = v11;
  }

  BOOL v18 = v9 == 0x41432D6E65LL && v11 == 0xE500000000000000LL;
  if (v18
    || (uint64_t v19 = sub_1000056B4(), (sub_1000056C0(v19, v20, 0x41432D6E65LL) & 1) != 0)
    || (v9 == 0x584D2D7365LL ? (BOOL v21 = v11 == 0xE500000000000000LL) : (BOOL v21 = 0), v21))
  {
    sub_100005694();
  }

  else
  {
    uint64_t v22 = sub_1000056B4();
    char v24 = sub_1000056C0(v22, v23, 0x584D2D7365LL);
    sub_100005694();
    if ((v24 & 1) != 0) {
      uint64_t v25 = v17;
    }
    else {
      uint64_t v25 = v11;
    }
    uint64_t v17 = v25;
  }

  swift_bridgeObjectRelease(v17);
  sub_1000056B4();
  sub_1000056A0();
}

uint64_t sub_100005658(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004B88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100005694()
{
  return v2(v1, v0);
}

  ;
}

uint64_t sub_1000056B4()
{
  return v0;
}

uint64_t sub_1000056C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, 0xE500000000000000LL, 0LL);
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandInExhaustiveParses.getter(char a1)
{
  return a1 & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandInExhaustiveParses.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandInExhaustiveParses.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandParses.getter(unint64_t a1)
{
  return (a1 >> 8) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandParses.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandParses.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandEditIntent.getter(unint64_t a1)
{
  return (a1 >> 16) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandEditIntent.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandEditIntent.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandAfterReranking.getter(unint64_t a1)
{
  return (a1 >> 24) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasVoiceCommandAfterReranking.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 3) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasVoiceCommandAfterReranking.modify())(void)
{
  return nullsub_2;
}

uint64_t VoiceCommandDebugInfoAggregated.hasNoVoiceCommandAfterRespeakCheck.getter(unint64_t a1)
{
  return HIDWORD(a1) & 1;
}

uint64_t VoiceCommandDebugInfoAggregated.hasNoVoiceCommandAfterRespeakCheck.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 4) = result;
  return result;
}

uint64_t (*VoiceCommandDebugInfoAggregated.hasNoVoiceCommandAfterRespeakCheck.modify())(void)
{
  return nullsub_2;
}

uint64_t initializeBufferWithCopyOfBuffer for VoiceCommandDebugInfoAggregated(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceCommandDebugInfoAggregated(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[5])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }

    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceCommandDebugInfoAggregated( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 5) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 5) = 0;
    }
    if (a2) {
      *(_BYTE *)uint64_t result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for VoiceCommandDebugInfoAggregated()
{
  return &type metadata for VoiceCommandDebugInfoAggregated;
}

void *sub_100005820()
{
  uint64_t v0 = type metadata accessor for OSSignpostID(0LL);
  uint64_t result = (void *)Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v0,  &protocol witness table for String);
  off_10005AE90 = result;
  return result;
}

_DWORD *sub_100005860()
{
  uint64_t v0 = type metadata accessor for _Lock();
  uint64_t v1 = swift_allocObject(v0, 24LL, 7LL);
  uint64_t result = (_DWORD *)swift_slowAlloc(4LL, -1LL);
  *(void *)(v1 + 16) = result;
  *uint64_t result = 0;
  qword_10005AE98 = v1;
  return result;
}

uint64_t sub_1000058AC()
{
  uint64_t v1 = sub_10000706C();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  BOOL v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OSSignposter(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  uint64_t v9 = sub_100004C5C(v1, (uint64_t)qword_10005C6F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
  OSSignposter.init(logger:)(v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))( v0 + OBJC_IVAR____TtC22localspeechrecognition14SignpostHelper_signposter,  v8,  v5);
  return v0;
}

void sub_1000059C4(const char *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v63 = a5;
  LODWORD(v64) = a3;
  sub_100004B88(&qword_10005B018);
  sub_1000070CC();
  __chkstk_darwin(v11);
  sub_100007090();
  uint64_t v60 = v12;
  uint64_t v13 = sub_1000070B8();
  uint64_t v65 = *(void *)(v13 - 8);
  sub_1000070CC();
  __chkstk_darwin(v14);
  sub_100007024();
  __chkstk_darwin(v15);
  uint64_t v17 = (os_log_s *)((char *)&v56 - v16);
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  id v62 = v17;
  uint64_t v18 = sub_10000706C();
  sub_1000070E8(v18, (uint64_t)qword_10005C6F8);
  os_log_type_t v19 = sub_1000070FC();
  BOOL v20 = os_log_type_enabled(v17, v19);
  uint64_t v58 = a4;
  uint64_t v59 = v6;
  if (v20)
  {
    uint64_t v21 = sub_100007000(12LL);
    uint64_t v57 = v13;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = sub_100007000(32LL);
    uint64_t v56 = a6;
    uint64_t v24 = v23;
    uint64_t v67 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v25 = v64;
    uint64_t v26 = StaticString.description.getter(a1, a2, v64);
    v27 = a1;
    unint64_t v29 = v28;
    uint64_t v66 = sub_100026B8C(v26, v28, &v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v22 + 4);
    unint64_t v30 = v29;
    a1 = v27;
    swift_bridgeObjectRelease(v30);
    sub_1000070D8((void *)&_mh_execute_header, v17, v19, "Logging signpost begin event: %s", v22);
    sub_100007010(v24);
    uint64_t v31 = v24;
    a6 = v56;
    sub_100006FF4(v31);
    uint64_t v32 = (uint64_t)v22;
    uint64_t v13 = v57;
    sub_100006FF4(v32);
  }

  else
  {

    uint64_t v25 = v64;
  }

  uint64_t v33 = StaticString.description.getter(a1, a2, v25);
  uint64_t v35 = v34;
  uint64_t v36 = ((uint64_t (*)(void))OSSignposter.logHandle.getter)();
  uint64_t v37 = v62;
  uint64_t v38 = OSSignpostID.init(log:)(v36);
  if (qword_10005A220 != -1) {
    uint64_t v38 = swift_once(&qword_10005A220, sub_100005860);
  }
  __chkstk_darwin(v38);
  *(&v56 - 4) = (uint64_t)v37;
  *(&v56 - 3) = v33;
  *(&v56 - 2) = v35;
  uint64_t v39 = v60;
  sub_100006A68((void (*)(void))sub_100006DCC);
  sub_100006D44(v39);
  swift_bridgeObjectRelease(v35);
  sub_100006CA4();
  uint64_t v40 = sub_100005F60();
  sub_100007018(v40, v41, v42, v43);
  uint64_t v44 = v63;
  uint64_t v45 = sub_100007074(v63);
  id v46 = (void *)OSSignposter.logHandle.getter(v45);
  int v47 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
    sub_100007008(v44);

    uint64_t v48 = v59;
LABEL_18:
    sub_10000705C();
    uint64_t v54 = type metadata accessor for OSSignpostIntervalState(0LL);
    sub_1000051E8(v54);
    uint64_t v55 = OSSignpostIntervalState.init(id:isOpen:)(v48, 1LL);
    swift_release(v55);
    (*(void (**)(os_log_s *, uint64_t))(v65 + 8))(v37, v13);
    sub_1000050C0();
    return;
  }

  LODWORD(v61) = v47;
  if ((v64 & 1) != 0)
  {
    if ((unint64_t)a1 >> 32)
    {
      __break(1u);
    }

    else
    {
      if (a1 >> 11 == 27)
      {
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }

      if (a1 >> 16 <= 0x10)
      {
        id v64 = &v68;
        goto LABEL_17;
      }
    }

    __break(1u);
    goto LABEL_21;
  }

  if (a1)
  {
    id v64 = a1;
LABEL_17:
    uint64_t v48 = v59;
    sub_10000705C();
    uint64_t v49 = sub_100007000(22LL);
    uint64_t v50 = sub_100007000(32LL);
    uint64_t v66 = a6;
    uint64_t v67 = v50;
    *(_DWORD *)uint64_t v49 = 134349314;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v49 + 4);
    *(_WORD *)(v49 + 12) = 2080;
    uint64_t v51 = v63;
    swift_bridgeObjectRetain(v63);
    uint64_t v66 = sub_100026B8C(v58, v51, &v67);
    sub_100007104((uint64_t)&v66);
    uint64_t v52 = sub_1000070E0(v51);
    os_signpost_id_t v53 = OSSignpostID.rawValue.getter(v52);
    sub_100007088( (void *)&_mh_execute_header,  (os_log_s *)v46,  (os_signpost_type_t)v61,  v53,  v64,  "%{signpost.description:begin_time,public}llu %s",  (uint8_t *)v49);
    sub_100007010(v50);
    sub_100006FF4(v50);
    sub_100006FF4(v49);

    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v48, v13);
    goto LABEL_18;
  }

LABEL_22:
  sub_100007008(v63);
  __break(1u);
}

  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  void *v24 = v8;
  v24[1] = a2;
  uint64_t v25 = *(void *)(v23 + 16);
  uint64_t v26 = __OFADD__(v25, 1LL);
  v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

uint64_t sub_100005E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (qword_10005A218 != -1) {
    swift_once(&qword_10005A218, sub_100005820);
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  swift_beginAccess(&off_10005AE90, v14, 33LL, 0LL);
  sub_100006DE8((uint64_t)v11, a2, a3, a4);
  return swift_endAccess(v14);
}

uint64_t sub_100005F60()
{
  return static OSLogIntegerFormatting.decimal.getter();
}

void sub_100005FCC(const char *a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v80 = a5;
  LODWORD(v81) = a3;
  uint64_t v11 = type metadata accessor for OSSignpostError(0LL);
  uint64_t v73 = *(void *)(v11 - 8);
  uint64_t v74 = v11;
  sub_1000070CC();
  __chkstk_darwin(v12);
  sub_100007090();
  uint64_t v70 = v13;
  uint64_t v14 = sub_1000070B8();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_1000070A4();
  v79 = (char *)v16;
  uint64_t v18 = __chkstk_darwin(v17);
  v77 = (char *)&v68 - v19;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v68 - v20;
  sub_100004B88(&qword_10005B018);
  sub_1000070CC();
  __chkstk_darwin(v22);
  sub_1000070A4();
  uint64_t v78 = v23;
  __chkstk_darwin(v24);
  uint64_t v82 = (uint64_t)&v68 - v25;
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  uint64_t v26 = sub_10000706C();
  sub_1000070E8(v26, (uint64_t)qword_10005C6F8);
  os_log_type_t v27 = sub_1000070FC();
  BOOL v28 = os_log_type_enabled(v6, v27);
  uint64_t v71 = a6;
  uint64_t v72 = a4;
  if (v28)
  {
    uint64_t v29 = sub_100007000(12LL);
    uint64_t v69 = v15;
    unint64_t v30 = (uint8_t *)v29;
    uint64_t v31 = sub_100007000(32LL);
    uint64_t v84 = v31;
    uint64_t v68 = v14;
    *(_DWORD *)unint64_t v30 = 136315138;
    v75 = v21;
    uint64_t v32 = (char *)a1;
    uint64_t v33 = v81;
    uint64_t v34 = StaticString.description.getter(a1, a2, v81);
    unint64_t v36 = v35;
    uint64_t v83 = sub_100026B8C(v34, v35, &v84);
    uint64_t v21 = v75;
    uint64_t v14 = v68;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v30 + 4);
    swift_bridgeObjectRelease(v36);
    sub_1000070D8((void *)&_mh_execute_header, v6, v27, "Logging signpost end event: %s", v30);
    sub_100007010(v31);
    sub_100006FF4(v31);
    uint64_t v37 = (uint64_t)v30;
    uint64_t v15 = v69;
    sub_100006FF4(v37);
  }

  else
  {

    uint64_t v32 = (char *)a1;
    uint64_t v33 = v81;
  }

  uint64_t v38 = StaticString.description.getter(v32, a2, v33);
  uint64_t v40 = v39;
  sub_100006CF0(v82, 1LL, 1LL, v14);
  uint64_t v41 = v80;
  if (qword_10005A220 != -1) {
    swift_once(&qword_10005A220, sub_100005860);
  }
  uint64_t v42 = qword_10005AE98;
  swift_bridgeObjectRetain(v40);
  uint64_t v43 = v82;
  sub_100006ACC(v42, v82, v38, v40);
  swift_bridgeObjectRelease(v40);
  uint64_t v44 = v78;
  sub_100006CFC(v43, v78);
  if (sub_100004C10(v44, 1LL, v14) == 1)
  {
    sub_100006D44(v44);
LABEL_23:
    sub_100006D44(v82);
    sub_1000050C0();
    return;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v21, v44, v14);
  uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  id v46 = v77;
  v45(v77, v21, v14);
  uint64_t v47 = type metadata accessor for OSSignpostIntervalState(0LL);
  sub_1000051E8(v47);
  uint64_t v48 = OSSignpostIntervalState.init(id:isOpen:)(v46, 1LL);
  sub_100006CA4();
  uint64_t v49 = sub_100005F60();
  sub_100007018(v49, v50, v51, v52);
  uint64_t v53 = sub_100007074(v41);
  uint64_t v54 = (void *)OSSignposter.logHandle.getter(v53);
  uint64_t v55 = OSSignpostIntervalState.signpostID.getter();
  int v56 = static os_signpost_type_t.end.getter(v55);
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
    sub_100007008(v41);

    sub_100007054((uint64_t)v79);
    sub_100007054((uint64_t)v21);
    sub_1000070C4();
    goto LABEL_23;
  }

  LODWORD(v78) = v56;
  if ((v81 & 1) != 0)
  {
    if ((unint64_t)v32 >> 32)
    {
      __break(1u);
    }

    else
    {
      uint64_t v41 = v73;
      uint64_t v57 = v74;
      if (v32 >> 11 == 27)
      {
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }

      if (v32 >> 16 <= 0x10)
      {
        uint64_t v32 = &v85;
        goto LABEL_19;
      }
    }

    __break(1u);
    goto LABEL_26;
  }

  if (v32)
  {
    uint64_t v41 = v73;
    uint64_t v57 = v74;
LABEL_19:
    uint64_t v58 = swift_retain(v48);
    uint64_t v59 = v70;
    checkForErrorAndConsumeState(state:)(v58);
    sub_1000070C4();
    int v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 88))(v59, v57);
    v75 = v21;
    v81 = v32;
    if (v60 == enum case for OSSignpostError.doubleEnd(_:))
    {
      char v61 = 0;
      v76 = "[Error] Interval already ended";
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v59, v57);
      v76 = "%{signpost.description:end_time,public}llu %s";
      char v61 = 2;
    }

    v45(v77, v79, v14);
    uint64_t v62 = sub_100007000(22LL);
    uint64_t v63 = sub_100007000(32LL);
    *(_BYTE *)uint64_t v62 = v61;
    *(_BYTE *)(v62 + 1) = v61;
    *(_WORD *)(v62 + 2) = 2050;
    uint64_t v83 = v71;
    uint64_t v84 = v63;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v62 + 4);
    *(_WORD *)(v62 + 12) = 2080;
    unint64_t v64 = v80;
    swift_bridgeObjectRetain(v80);
    uint64_t v83 = sub_100026B8C(v72, v64, &v84);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v62 + 14);
    uint64_t v65 = sub_1000070E0(v64);
    uint64_t v66 = (uint64_t)v77;
    os_signpost_id_t v67 = OSSignpostID.rawValue.getter(v65);
    sub_100007088((void *)&_mh_execute_header, (os_log_s *)v54, (os_signpost_type_t)v78, v67, v81, v76, (uint8_t *)v62);
    sub_100007010(v63);
    sub_100006FF4(v63);
    sub_100006FF4(v62);

    sub_100007054((uint64_t)v79);
    sub_100007054((uint64_t)v75);
    sub_1000070C4();
    sub_100007054(v66);
    goto LABEL_23;
  }

LABEL_27:
  sub_100007008(v41);
  __break(1u);
}

void sub_1000065B4(const char *a1, uint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  unsigned int v49 = a3;
  uint64_t v50 = (char *)a1;
  uint64_t v12 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100007024();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v44 - v15;
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  uint64_t v17 = sub_10000706C();
  sub_1000070E8(v17, (uint64_t)qword_10005C6F8);
  os_log_type_t v18 = sub_1000070FC();
  BOOL v19 = os_log_type_enabled(v7, v18);
  uint64_t v46 = a6;
  uint64_t v47 = a4;
  if (v19)
  {
    uint64_t v20 = sub_100007000(12LL);
    uint64_t v45 = v12;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = sub_100007000(32LL);
    uint64_t v44 = v13;
    uint64_t v23 = v22;
    uint64_t v52 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v24 = StaticString.description.getter(v50, a2, v49);
    unint64_t v26 = v25;
    uint64_t v51 = sub_100026B8C(v24, v25, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v21 + 4);
    swift_bridgeObjectRelease(v26);
    sub_1000070D8((void *)&_mh_execute_header, v7, v18, "Logging signpost event: %s", v21);
    sub_100007010(v23);
    uint64_t v27 = v23;
    uint64_t v13 = v44;
    sub_100006FF4(v27);
    uint64_t v28 = (uint64_t)v21;
    uint64_t v12 = v45;
    sub_100006FF4(v28);
  }

  uint64_t v30 = OSSignposter.logHandle.getter(v29);
  OSSignpostID.init(log:)(v30);
  sub_100006CA4();
  uint64_t v31 = sub_100005F60();
  sub_100007018(v31, v32, v33, v34);
  uint64_t v35 = sub_100007074(a5);
  unint64_t v36 = (void *)OSSignposter.logHandle.getter(v35);
  int v37 = static os_signpost_type_t.event.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0) {
    goto LABEL_9;
  }
  LODWORD(v48) = v37;
  if ((v49 & 1) == 0)
  {
    if (!v50)
    {
      sub_100007008(a5);
      __break(1u);
LABEL_9:

      sub_100007008(a5);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
LABEL_15:
      sub_1000050C0();
      return;
    }

LABEL_14:
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v6, v16, v12);
    uint64_t v38 = sub_100007000(22LL);
    uint64_t v39 = sub_100007000(32LL);
    *(_DWORD *)uint64_t v38 = 134349314;
    uint64_t v51 = v46;
    uint64_t v52 = v39;
    uint64_t v40 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v38 + 4);
    *(_WORD *)(v38 + 12) = 2080;
    swift_bridgeObjectRetain(a5);
    uint64_t v51 = sub_100026B8C(v47, a5, &v52);
    sub_100007104((uint64_t)&v51);
    uint64_t v41 = sub_1000070E0(a5);
    os_signpost_id_t v42 = OSSignpostID.rawValue.getter(v41);
    sub_100007088( (void *)&_mh_execute_header,  (os_log_s *)v36,  (os_signpost_type_t)v48,  v42,  v50,  "%{signpost.description:event_time,public}llu %s",  (uint8_t *)v38);
    sub_100007010(v39);
    sub_100006FF4(v39);
    sub_100006FF4(v38);

    uint64_t v43 = *(void (**)(char *, uint64_t))(v13 + 8);
    v43(v16, v12);
    v43(v40, v12);
    goto LABEL_15;
  }

  if ((unint64_t)v50 >> 32)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (v50 >> 11 != 27)
  {
    if (v50 >> 16 <= 0x10)
    {
      uint64_t v50 = &v53;
      goto LABEL_14;
    }

    goto LABEL_17;
  }

  BOOL v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * a2) = a1;
  uint64_t v20 = *(void *)(v19 + 16);
  uint64_t v21 = __OFADD__(v20, 1LL);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v22;
  }
}
}

LABEL_18:
  __break(1u);
}

    uint64_t v11 = (v18 - 1) & v18;
  }

  BOOL v19 = v16 + 2;
  if (v19 < v42)
  {
    os_log_type_t v18 = v43[v19];
    if (!v18)
    {
      while (1)
      {
        uint64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1LL)) {
          goto LABEL_42;
        }
        if (v13 >= v42) {
          goto LABEL_32;
        }
        os_log_type_t v18 = v43[v13];
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }

    uint64_t v13 = v19;
    goto LABEL_18;
  }

      uint64_t v11 = (v19 - 1) & v19;
    }

    sub_1000070C4();
    uint64_t v2 = v36;
    os_log_type_t v18 = v37;
    if ((v4 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    sub_100023624();
    if (v34 != v35) {
      void *v18 = -1LL << v33;
    }
    else {
      sub_100023440(v33);
    }
    v1[2] = 0LL;
  }

    uint64_t v8 = (v13 - 1) & v13;
  }

  uint64_t v14 = v12 + 3;
  if (v14 >= v25) {
    return v3;
  }
  uint64_t v13 = *(void *)(v24 + 8 * v14);
  if (v13)
  {
    BOOL v4 = v14;
    goto LABEL_18;
  }

  while (1)
  {
    BOOL v4 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v4 >= v25) {
      return v3;
    }
    uint64_t v13 = *(void *)(v24 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }

    uint64_t v8 = (v14 - 1) & v14;
  }

  uint64_t v15 = v13 + 3;
  if (v15 >= v9) {
    return v3;
  }
  uint64_t v14 = *(void *)(v24 + 8 * v15);
  if (v14)
  {
    BOOL v4 = v15;
    goto LABEL_18;
  }

  while (1)
  {
    BOOL v4 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v4 >= v9) {
      return v3;
    }
    uint64_t v14 = *(void *)(v24 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }

    uint64_t v8 = (v13 - 1) & v13;
  }

  uint64_t v14 = v12 + 3;
  if (v14 >= v25) {
    return v3;
  }
  uint64_t v13 = *(void *)(v24 + 8 * v14);
  if (v13)
  {
    BOOL v4 = v14;
    goto LABEL_18;
  }

  while (1)
  {
    BOOL v4 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v4 >= v25) {
      return v3;
    }
    uint64_t v13 = *(void *)(v24 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }

uint64_t SignpostHelper.deinit()
{
  uint64_t v1 = sub_10000707C();
  sub_100007040(v1);
  return v0;
}

uint64_t SignpostHelper.__deallocating_deinit()
{
  uint64_t v1 = sub_10000707C();
  sub_100007040(v1);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1000069BC()
{
  return type metadata accessor for SignpostHelper(0LL);
}

uint64_t type metadata accessor for SignpostHelper(uint64_t a1)
{
  uint64_t result = qword_10005AEC8;
  if (!qword_10005AEC8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SignpostHelper);
  }
  return result;
}

uint64_t sub_1000069FC(uint64_t a1)
{
  uint64_t result = type metadata accessor for OSSignposter(319LL);
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

void sub_100006A68(void (*a1)(void))
{
  unint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

uint64_t sub_100006ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100004B88(&qword_10005B018);
  __chkstk_darwin(v8);
  uint64_t v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v11 = *(os_unfair_lock_s **)(a1 + 16);
  os_unfair_lock_lock(v11);
  if (qword_10005A218 != -1) {
    swift_once(&qword_10005A218, sub_100005820);
  }
  swift_beginAccess(&off_10005AE90, v24, 32LL, 0LL);
  uint64_t v12 = off_10005AE90;
  if (*((void *)off_10005AE90 + 2))
  {
    swift_bridgeObjectRetain(a4);
    unint64_t v13 = sub_10001EBB4(a3, a4);
    if ((v14 & 1) != 0)
    {
      unint64_t v15 = v13;
      uint64_t v16 = v12[7];
      uint64_t v17 = type metadata accessor for OSSignpostID(0LL);
      (*(void (**)(_BYTE *, unint64_t, uint64_t))(*(void *)(v17 - 8) + 16LL))( v10,  v16 + *(void *)(*(void *)(v17 - 8) + 72LL) * v15,  v17);
      uint64_t v18 = (uint64_t)v10;
      uint64_t v19 = 0LL;
      uint64_t v20 = v17;
    }

    else
    {
      uint64_t v20 = type metadata accessor for OSSignpostID(0LL);
      uint64_t v18 = (uint64_t)v10;
      uint64_t v19 = 1LL;
    }

    sub_100006CF0(v18, v19, 1LL, v20);
    swift_bridgeObjectRelease(a4);
  }

  else
  {
    uint64_t v21 = type metadata accessor for OSSignpostID(0LL);
    sub_100006CF0((uint64_t)v10, 1LL, 1LL, v21);
  }

  swift_endAccess(v24);
  sub_100006D84((uint64_t)v10, a2);
  os_unfair_lock_unlock(v11);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_100006C74()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for _Lock()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognitionP33_EA339EDCE8C7D7DA4B8D82053A0F1F185_Lock);
}

unint64_t sub_100006CA4()
{
  unint64_t result = qword_10005B010;
  if (!qword_10005B010)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UInt64, &type metadata for UInt64);
    atomic_store(result, (unint64_t *)&qword_10005B010);
  }

  return result;
}

uint64_t sub_100006CE0(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100006CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100006CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005B018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006D44(uint64_t a1)
{
  uint64_t v2 = sub_100004B88(&qword_10005B018);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100006D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005B018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006DCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100005E60(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_100006DE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
  uint64_t v12 = *v4;
  *uint64_t v4 = 0x8000000000000000LL;
  sub_100006E6C(a1, a2, a3, isUniquelyReferenced_nonNull_native, a4);
  uint64_t v10 = *v4;
  *uint64_t v4 = v12;
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_100006E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v13 = sub_10001EBB4(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v18 = v13;
  char v19 = v14;
  sub_100004B88((uint64_t *)&unk_10005B020);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_10001EBB4(a2, a3);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = (uint64_t)*v6;
  if ((v19 & 1) != 0)
  {
    uint64_t v23 = *(void *)(v22 + 56);
    uint64_t v24 = type metadata accessor for OSSignpostID(0LL);
    uint64_t v25 = *(void *)(v24 - 8);
    unint64_t v26 = *(void *)(v25 + 72) * v18;
    uint64_t v27 = v23 + v26;
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32);
    v28(a5, v27, v24);
    v28(*(void *)(v22 + 56) + v26, a1, v24);
    return sub_100006CF0(a5, 0LL, 1LL, v24);
  }

  else
  {
    sub_1000205DC(v18, a2, a3, a1, *v6);
    uint64_t v30 = type metadata accessor for OSSignpostID(0LL);
    sub_100006CF0(a5, 1LL, 1LL, v30);
    return swift_bridgeObjectRetain(a3);
  }

uint64_t sub_100006FF4(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100007000(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_100007008(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 2LL);
}

uint64_t sub_100007010(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

uint64_t sub_100007018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006CE0(a3, a4);
}

  ;
}

uint64_t sub_100007040(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_100007054(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_10000705C()
{
  return v1(v3, v0, v2);
}

uint64_t sub_10000706C()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_100007074(uint64_t a1)
{
  return swift_bridgeObjectRetain_n(a1, 2LL);
}

uint64_t sub_10000707C()
{
  return type metadata accessor for OSSignposter(0LL);
}

void sub_100007088( void *a1, os_log_s *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5, const char *a6, uint8_t *a7)
{
}

  ;
}

  ;
}

uint64_t sub_1000070B8()
{
  return type metadata accessor for OSSignpostID(0LL);
}

uint64_t sub_1000070C4()
{
  return swift_release(v0);
}

  ;
}

void sub_1000070D8(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_1000070E0(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 3LL);
}

uint64_t sub_1000070E8(uint64_t a1, uint64_t a2)
{
  return Logger.logObject.getter();
}

uint64_t sub_1000070FC()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007104(uint64_t a1)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, v1, v2);
}

void sub_100007110(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream);
  *(void *)(v1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream) = a1;
}

uint64_t sub_100007124(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = type metadata accessor for Locale(0LL);
  v3[7] = sub_10000925C(v4);
  uint64_t v5 = type metadata accessor for String.LocalizationValue(0LL);
  v3[8] = sub_10000925C(v5);
  return swift_task_switch(sub_100007180, 0LL, 0LL);
}

id sub_100007180(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 40);
  uint64_t v3 = *(char **)(v1 + 48);
  uint64_t v4 = *(void **)(v1 + 32);
  uint64_t v5 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListeners;
  uint64_t v6 = sub_1000092E0(a1, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
  uint64_t v7 = type metadata accessor for EARLanguageDetectorAudioBuffer();
  unint64_t v8 = sub_100008F14();
  uint64_t v9 = v3;
  uint64_t v72 = v5;
  uint64_t v73 = v3;
  *(void *)&v3[v5] = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, v6, v7, v8);
  uint64_t v10 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock;
  uint64_t v11 = sub_100004B88(&qword_10005BEA0);
  uint64_t v12 = swift_allocObject(v11, 20LL, 7LL);
  *(_DWORD *)(v12 + 16) = 0;
  *(void *)&v9[v10] = v12;
  uint64_t v69 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_resultStream] = 0LL;
  uint64_t v13 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector] = 0LL;
  uint64_t v14 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales] = _swiftEmptyArrayStorage;
  uint64_t v70 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo;
  uint64_t v71 = v10;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo] = v2;
  uint64_t v15 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions] = v4;
  BOOL v16 = (void *)objc_opt_self(&OBJC_CLASS___LSRSpeechAssets);
  id v17 = v2;
  id v18 = v4;
  id result = [v16 sharedInstance];
  if (result)
  {
    unint64_t v20 = *(void **)(v1 + 40);
    uint64_t v21 = *(void *)(v1 + 48);
    uint64_t v22 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager;
    *(void *)(v21 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager) = result;
    id v23 = result;
    NSString v24 = [v20 clientID];
    if (!v24)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
      uint64_t v26 = v25;
      NSString v24 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v26);
    }

    id v27 = [v23 installedLanguageDetectorAssetWithClientID:v24];

    if (v27)
    {
      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      uint64_t v30 = v29;

      sub_1000092E0(v31, (unint64_t *)&unk_10005B2A0, &OBJC_CLASS____EARLanguageDetectorV2_ptr);
      swift_bridgeObjectRetain(v30);
      v32._countAndFlagsBits = 0x6F7463657465642FLL;
      v32._object = (void *)0xEE006E6F736A2E72LL;
      String.append(_:)(v32);
      swift_bridgeObjectRelease(v30);
      id v33 = sub_100007680(v28, v30);
      uint64_t v34 = *(void **)&v9[v13];
      *(void *)&v9[v13] = v33;

      uint64_t v35 = *(void **)&v9[v13];
      if (v35)
      {
        uint64_t v36 = *(void *)(v1 + 64);
        uint64_t v74 = *(void *)(v1 + 56);
        int v37 = *(void **)(v1 + 40);
        uint64_t v38 = *(void **)(v1 + 48);
        uint64_t v39 = *(void **)(v1 + 32);
        id v40 = v35;
        id v41 = [v40 supportedLocales];
        uint64_t v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v41, &type metadata for String);

        uint64_t v43 = *(void *)&v9[v14];
        *(void *)&v9[v14] = v42;
        swift_bridgeObjectRelease(v43);

        uint64_t v44 = type metadata accessor for EARLanguageDetector();
        *(void *)(v1 + 16) = v38;
        *(void *)(v1 + 24) = v44;
        id v45 = objc_msgSendSuper2((objc_super *)(v1 + 16), "init");

        swift_task_dealloc(v36);
        swift_task_dealloc(v74);
        return (id)(*(uint64_t (**)(id))(v1 + 8))(v45);
      }

      uint64_t v65 = v22;
      uint64_t v66 = v21;
      uint64_t v67 = v15;
      uint64_t v68 = v14;
      char v53 = (void *)objc_opt_self(&OBJC_CLASS___NSError);
      String.LocalizationValue.init(stringLiteral:)(0xD000000000000020LL, 0x8000000100043BA0LL);
      if (qword_10005A288 != -1) {
        swift_once(&qword_10005A288, sub_100014C90);
      }
      uint64_t v55 = *(void *)(v1 + 56);
      uint64_t v54 = *(void *)(v1 + 64);
      uint64_t v56 = qword_10005C8F8;
      static Locale.current.getter((id)qword_10005C8F8);
      uint64_t v57 = sub_100009270(v54, 0LL, 0LL, v56, v55);
      sub_100008F64(500LL, v57, v58, v53);
    }

    else
    {
      uint64_t v65 = v22;
      uint64_t v66 = v21;
      uint64_t v67 = v15;
      uint64_t v68 = v14;
      String.LocalizationValue.init(stringLiteral:)(0xD000000000000013LL, 0x8000000100043B80LL);
      if (qword_10005A288 != -1) {
        swift_once(&qword_10005A288, sub_100014C90);
      }
      uint64_t v47 = *(void *)(v1 + 56);
      uint64_t v46 = *(void *)(v1 + 64);
      uint64_t v48 = qword_10005C8F8;
      static Locale.current.getter((id)qword_10005C8F8);
      uint64_t v49 = sub_100009270(v46, 0LL, 0LL, v48, v47);
      uint64_t v51 = v50;
      uint64_t v52 = static SFSpeechErrorCode.noModel.getter(v49);
      related decl 'e' for SFSpeechErrorCode.init(_:description:)(v52, v49, v51);
    }

    uint64_t v59 = *(void *)(v1 + 56);
    uint64_t v60 = *(void *)(v1 + 64);
    uint64_t v62 = *(void **)(v1 + 40);
    char v61 = *(void **)(v1 + 48);
    uint64_t v63 = *(void **)(v1 + 32);
    swift_willThrow();

    swift_bridgeObjectRelease(*(void *)&v73[v72]);
    swift_release(*(void *)&v9[v71]);
    sub_1000091F0(v69);

    sub_1000091F0(v70);
    sub_1000091F0(v67);

    swift_bridgeObjectRelease(*(void *)&v9[v68]);
    uint64_t v64 = type metadata accessor for EARLanguageDetector();
    swift_deallocPartialClassInstance(v61, v64, 72LL, 7LL);
    swift_task_dealloc(v60);
    swift_task_dealloc(v59);
    return (id)(*(uint64_t (**)(void))(v1 + 8))();
  }

  else
  {
    __break(1u);
  }

  return result;
}

id sub_100007680(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithConfigFile:v5];

  return v6;
}

id sub_1000076F0()
{
  uint64_t v1 = type metadata accessor for Locale(0LL);
  uint64_t v33 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [objc_allocWithZone(_EARLanguageDetectorRequestContext) init];
  id v5 =  [*(id *)(v0 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_detectorOptions) languageConstraints];
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = v5;
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v1);

  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v29 = v0;
    id v30 = v4;
    uint64_t v34 = &_swiftEmptyArrayStorage;
    sub_10001EB60(0, v8, 0);
    unint64_t v9 = (*(unsigned __int8 *)(v33 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v28 = v7;
    unint64_t v10 = v7 + v9;
    uint64_t v11 = *(void *)(v33 + 72);
    uint64_t v31 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v33 + 16);
    uint64_t v32 = v11;
    do
    {
      uint64_t v12 = v31(v3, v10, v1);
      uint64_t v13 = Locale.identifier.getter(v12);
      uint64_t v15 = v14;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v3, v1);
      BOOL v16 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0)
      {
        sub_10001EB60(0, v16[2] + 1LL, 1);
        BOOL v16 = v34;
      }

      unint64_t v18 = v16[2];
      unint64_t v17 = v16[3];
      if (v18 >= v17 >> 1)
      {
        sub_10001EB60(v17 > 1, v18 + 1, 1);
        BOOL v16 = v34;
      }

      v16[2] = v18 + 1;
      char v19 = (char *)&v16[2 * v18];
      *((void *)v19 + 4) = v13;
      *((void *)v19 + 5) = v15;
      v10 += v32;
      --v8;
    }

    while (v8);
    swift_bridgeObjectRelease(v28);
    uint64_t v0 = v29;
    id v4 = v30;
  }

  else
  {
    swift_bridgeObjectRelease(v7);
    BOOL v16 = &_swiftEmptyArrayStorage;
  }

  if (!v16[2])
  {
    swift_bridgeObjectRelease(v16);
LABEL_14:
    uint64_t v20 = swift_bridgeObjectRetain(*(void *)(v0
                                             + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales));
    goto LABEL_15;
  }

  uint64_t v20 = (uint64_t)v16;
LABEL_15:
  uint64_t v21 = sub_100014E7C(v20);
  sub_100009088(v21, v4);
  sub_1000090E8(0x53552D6E65LL, 0xE500000000000000LL, v4);
  uint64_t v23 = sub_1000092E0(v22, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
  sub_1000092D4((uint64_t)isa, "setWasLanguageToggled:");

  uint64_t v25 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v23,  &protocol witness table for String);
  sub_100009138(v25, v4);
  return v4;
}

void sub_100007994(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_supportedLocales);
  swift_bridgeObjectRetain(v3);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease(v3);

  _Block_release(a2);
}

void sub_100007A08(uint64_t a1, void (**a2)(void, void))
{
  id v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for String.LocalizationValue(0LL);
  __chkstk_darwin();
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *(void **)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_assetsManager);
  NSString v9 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_clientInfo) clientID];
  if (!v9)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v11 = v10;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }

  id v12 = [v8 installedLanguageDetectorAssetWithClientID:v9];

  if (v12)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v15 = v14;

    sub_1000091B8(0LL, (unint64_t *)&unk_10005B2C0, &OBJC_CLASS____EARSpeechModelInfo_ptr);
    v25[1] = v13;
    v25[2] = v15;
    swift_bridgeObjectRetain(v15);
    v16._countAndFlagsBits = 0x6F7463657465642FLL;
    v16._object = (void *)0xEE006E6F736A2E72LL;
    String.append(_:)(v16);
    swift_bridgeObjectRelease(v15);
    sub_100015094();
    unint64_t v18 = v17;
    id v19 = [objc_allocWithZone(EARSpeechModelInfo) initWithModelInfo:v17];

    ((void (**)(void, id))a2)[2](a2, v19);
    _Block_release(a2);
  }

  else
  {
    String.LocalizationValue.init(stringLiteral:)(0xD000000000000013LL, 0x8000000100043B80LL);
    if (qword_10005A288 != -1) {
      swift_once(&qword_10005A288, sub_100014C90);
    }
    uint64_t v20 = qword_10005C8F8;
    static Locale.current.getter((id)qword_10005C8F8);
    uint64_t v21 = String.init(localized:table:bundle:locale:comment:)(v7, 0LL, 0LL, v20, v5, 0LL, 0LL, 256LL);
    uint64_t v23 = v22;
    uint64_t v24 = static SFSpeechErrorCode.noModel.getter();

    a2[2](a2, 0LL);
    _Block_release(a2);
  }

void sub_100007CAC(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
}

void sub_100007D08(void *a1, uint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  id v5 = *(void **)(a3 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_languageDetector);
  if (v5)
  {
    id v9 = objc_allocWithZone((Class)type metadata accessor for EARLanguageDetectorResultStream());
    id v10 = v5;
    id v11 = sub_1000088BC(a1);
    id v12 = v11;
    sub_100007110((uint64_t)v11);
    if ((a2 & 0x8000000000000000LL) == 0)
    {
      id v13 = sub_1000076F0();
      id v14 = [v10 startRequestWithSamplingRate:a2 context:v13 delegate:v12];

      id v15 = [(id)objc_opt_self(NSXPCListener) anonymousListener];
      [v15 setDelegate:a3];
      [v15 activate];
      uint64_t v16 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock;
      unint64_t v17 = *(os_unfair_lock_s **)(a3
                                 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock);
      swift_retain(v17);
      os_unfair_lock_lock(v17 + 4);
      swift_release(v17);
      id v18 = objc_allocWithZone((Class)type metadata accessor for EARLanguageDetectorAudioBuffer());
      id v19 = v15;
      id v20 = v14;
      sub_10000835C(v20);
      swift_beginAccess( a3 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListeners,  v27,  33LL,  0LL);
      sub_10001F410();
      swift_endAccess(v27);

      uint64_t v21 = *(os_unfair_lock_s **)(a3 + v16);
      swift_retain(v21);
      os_unfair_lock_unlock(v21 + 4);
      swift_release(v21);
      id v22 = [v19 endpoint];
      ((void (**)(void, id, void))a4)[2](a4, v22, 0LL);

      _Block_release(a4);
      return;
    }

    __break(1u);
    goto LABEL_9;
  }

  if (qword_10005A210 != -1) {
LABEL_9:
  }
    swift_once(&qword_10005A210, sub_100005278);
  uint64_t v23 = type metadata accessor for Logger(0LL);
  sub_100004C5C(v23, (uint64_t)qword_10005C710);
  uint64_t v24 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "LanguageDetector is not initialized", v26, 2u);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  _Block_release(a4);
}

BOOL sub_100008064(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock;
  uint64_t v6 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListenerLock);
  swift_retain(v6);
  os_unfair_lock_lock(v6 + 4);
  swift_release(v6);
  swift_beginAccess( v2 + OBJC_IVAR____TtC22localspeechrecognition19EARLanguageDetector_audioBufferListeners,  v18,  33LL,  0LL);
  id v7 = (void *)sub_10001EF20();
  swift_endAccess(v18);
  uint64_t v8 = *(os_unfair_lock_s **)(v3 + v5);
  swift_retain(v8);
  os_unfair_lock_unlock(v8 + 4);
  swift_release(v8);
  if (v7)
  {
    objc_opt_self(&OBJC_CLASS___NSXPCInterface);
    id v9 = v7;
    id v10 = sub_1000092BC((uint64_t)v9, "interfaceWithProtocol:");
    sub_1000092C8((uint64_t)v10, "setExportedInterface:");

    sub_1000092D4(v11, "setExportedObject:");
    uint64_t v12 = swift_allocObject(&unk_1000516F0, 24LL, 7LL);
    *(void *)(v12 + 16) = v9;
    v18[4] = sub_100009050;
    uint64_t v19 = v12;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256LL;
    v18[2] = sub_100015138;
    v18[3] = &unk_100051708;
    id v13 = _Block_copy(v18);
    uint64_t v14 = v19;
    id v15 = v9;
    uint64_t v16 = swift_release(v14);
    sub_1000092C8(v16, "setInvalidationHandler:");
    _Block_release(v13);
    [a2 activate];
  }

  return v7 != 0LL;
}

void sub_10000827C()
{
}

id sub_1000082AC()
{
  return sub_10000885C(type metadata accessor for EARLanguageDetector);
}

uint64_t type metadata accessor for EARLanguageDetector()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition19EARLanguageDetector);
}

id sub_10000835C(void *a1)
{
  uint64_t v3 = qword_10005A210;
  uint64_t v4 = v1;
  if (v3 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v5 = sub_10000706C();
  sub_1000070E8(v5, (uint64_t)qword_10005C710);
  os_log_type_t v6 = sub_1000070FC();
  if (os_log_type_enabled((os_log_t)v1, v6))
  {
    id v7 = (uint8_t *)sub_100007000(12LL);
    uint64_t v8 = sub_100007000(32LL);
    uint64_t v15 = v8;
    *(_DWORD *)id v7 = 136315138;
    sub_100026B8C(0x293A5F2874696E69LL, 0xE800000000000000LL, &v15);
    sub_1000092A0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v9, v10, v7 + 4);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v1, v6, "EARLanguageDetectorAudioBuffer.%s", v7, 0xCu);
    sub_100007010(v8);
    sub_100006FF4(v8);
    sub_100006FF4((uint64_t)v7);
  }

  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer] = a1;
  id v11 = a1;

  uint64_t v12 = (objc_class *)type metadata accessor for EARLanguageDetectorAudioBuffer();
  v16.receiver = v4;
  v16.super_class = v12;
  id v13 = objc_msgSendSuper2(&v16, "init");

  return v13;
}

void sub_1000084DC(uint64_t a1, unint64_t a2)
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v5 = sub_10000706C();
  sub_1000070E8(v5, (uint64_t)qword_10005C710);
  os_log_type_t v6 = sub_1000070FC();
  if (sub_100009290(v6))
  {
    id v7 = (uint8_t *)sub_100007000(12LL);
    uint64_t v8 = sub_100007000(32LL);
    uint64_t v13 = v8;
    *(_DWORD *)id v7 = 136315138;
    sub_1000092B4(22LL, 0x8000000100043C80LL, &v13);
    sub_1000092A0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v9, v10, v7 + 4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "EARLanguageDetectorAudioBuffer.%s", v7, 0xCu);
    sub_100007010(v8);
    sub_100006FF4(v8);
    sub_100006FF4((uint64_t)v7);
  }

  if (a2 >> 60 == 15)
  {
    __break(1u);
  }

  else
  {
    id v11 = *(void **)((char *)v2 + OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    [v11 addAudioSampleData:isa];
  }

void sub_1000086DC()
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v1 = sub_10000706C();
  sub_1000070E8(v1, (uint64_t)qword_10005C710);
  os_log_type_t v2 = sub_1000070FC();
  if (sub_100009280(v2))
  {
    os_log_type_t v3 = (_DWORD *)sub_100007000(12LL);
    uint64_t v4 = sub_100007000(32LL);
    uint64_t v16 = v4;
    *os_log_type_t v3 = 136315138;
    uint64_t v5 = sub_100026B8C(0x6F69647541646E65LL, 0xEA00000000002928LL, &v16);
    sub_1000091F8(v5, v6, v7, v8, v9, v10, v11, v12, v15, v16);
    sub_10000923C((void *)&_mh_execute_header, v13, v14, "EARLanguageDetectorAudioBuffer.%s");
    sub_100009214();
    sub_100006FF4(v4);
    sub_100006FF4((uint64_t)v3);
  }

  [*(id *)&v0[OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer] endAudio];
  sub_100009224();
}

void sub_100008820()
{
}

id sub_100008850()
{
  return sub_10000885C(type metadata accessor for EARLanguageDetectorAudioBuffer);
}

id sub_10000885C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for EARLanguageDetectorAudioBuffer()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer);
}

id sub_1000088BC(void *a1)
{
  id v3 = objc_allocWithZone(&OBJC_CLASS___NSXPCConnection);
  uint64_t v4 = v1;
  id v5 = [v3 initWithListenerEndpoint:a1];
  uint64_t v6 = OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_connection;
  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_connection] = v5;
  objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v7 = v5;
  id v8 = sub_1000092BC((uint64_t)v7, "interfaceWithProtocol:");
  [v7 setRemoteObjectInterface:v8];

  uint64_t v9 = *(void **)&v4[v6];
  [v9 activate];
  id v10 = [v9 remoteObjectProxy];
  _bridgeAnyObjectToAny(_:)(v16, v10);
  swift_unknownObjectRelease(v10);
  uint64_t v11 = sub_100004B88(&qword_10005B2B8);
  swift_dynamicCast(&v15, v16, (char *)&type metadata for Any + 8, v11, 7LL);
  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_resultStreamProxy] = v15;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for EARLanguageDetectorResultStream();
  id v12 = objc_msgSendSuper2(&v14, "init");

  return v12;
}

id sub_100008A24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EARLanguageDetectorResultStream();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100008AC8()
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v1 = sub_10000706C();
  sub_1000070E8(v1, (uint64_t)qword_10005C710);
  os_log_type_t v2 = sub_1000070FC();
  if (sub_100009280(v2))
  {
    id v3 = (_DWORD *)sub_100007000(12LL);
    uint64_t v4 = sub_100007000(32LL);
    uint64_t v16 = v4;
    *id v3 = 136315138;
    uint64_t v5 = sub_1000092B4(46LL, 0x8000000100043C10LL, &v16);
    sub_1000091F8(v5, v6, v7, v8, v9, v10, v11, v12, v15, v16);
    sub_10000923C((void *)&_mh_execute_header, v13, v14, "EARLanguageDetectorResultStream.%s");
    sub_100009214();
    sub_100006FF4(v4);
    sub_100006FF4((uint64_t)v3);
  }

  [*(id *)&v0[OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_resultStreamProxy] languageDetectorDidFinishWithError:0];
  sub_100009224();
}

void sub_100008C34(double a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v3;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v8 = sub_10000706C();
  uint64_t v9 = (os_log_s *)sub_100004C5C(v8, (uint64_t)qword_10005C710);
  id v10 = a3;
  uint64_t v11 = v9;
  Logger.logObject.getter();
  os_log_type_t v12 = sub_1000070FC();
  if (sub_100009290(v12))
  {
    uint64_t v13 = sub_100007000(22LL);
    uint64_t v14 = (void *)sub_100007000(8LL);
    uint64_t v19 = v5;
    uint64_t v15 = sub_100007000(32LL);
    uint64_t v21 = v15;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v20 = sub_1000092B4(54LL, 0x8000000100043BD0LL, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v13 + 4);
    *(_WORD *)(v13 + 12) = 2112;
    uint64_t v20 = (uint64_t)v10;
    id v16 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v13 + 14);
    *uint64_t v14 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v4, "EARLanguageDetectorResultStream.%s %@", (uint8_t *)v13, 0x16u);
    sub_100004B88(&qword_10005B5A0);
    sub_100007010((uint64_t)v14);
    sub_100006FF4((uint64_t)v14);
    sub_100009214();
    uint64_t v17 = v15;
    uint64_t v5 = v19;
    sub_100006FF4(v17);
    sub_100006FF4(v13);
  }

  else
  {
  }

  id v18 = [objc_allocWithZone(EARLanguageDetectorV2Result) initWithLanguageDetectorV2Result:v10];
  [*(id *)(v5 + OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_resultStreamProxy) languageDetectorDidRecognizeResult:v18 processedAudioDuration:a1];
}

void sub_100008EC4()
{
}

uint64_t type metadata accessor for EARLanguageDetectorResultStream()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition31EARLanguageDetectorResultStream);
}

unint64_t sub_100008F14()
{
  unint64_t result = qword_10005B290;
  if (!qword_10005B290)
  {
    uint64_t v1 = sub_1000091B8(255LL, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10005B290);
  }

  return result;
}

id sub_100008F64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  id v8 = objc_msgSend(a4, "lsr_errorWithCode:description:", a1, v7);

  return v8;
}

uint64_t sub_100008FD4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008FE8(result, a2);
  }
  return result;
}

uint64_t sub_100008FE8(uint64_t result, unint64_t a2)
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

uint64_t sub_10000902C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100009050()
{
}

uint64_t sub_100009070(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009080(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100009088(uint64_t a1, void *a2)
{
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  [a2 setDictationLanguages:isa];
}

void sub_1000090E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setCurrentDictationLanguage:v5];
}

void sub_100009138(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  [a2 setDictationLanguagePriors:isa];
}

uint64_t sub_1000091B8(uint64_t a1, unint64_t *a2, void *a3)
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

void sub_1000091F0(uint64_t a1@<X8>)
{
}

uint64_t sub_1000091F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a9 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a9, &a10, v10);
}

uint64_t sub_100009214()
{
  return swift_arrayDestroy(v0, 1LL);
}

  ;
}

void sub_10000923C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_100009250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_stdlib_reportUnimplementedInitializer(a1, a2, a3, 6LL, 0LL);
}

uint64_t sub_10000925C(uint64_t a1)
{
  return swift_task_alloc((*(void *)(*(void *)(a1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_100009270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return String.init(localized:table:bundle:locale:comment:)(a1, a2, a3, a4, a5, 0LL, 0LL, 256LL);
}

BOOL sub_100009280(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL sub_100009290(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

uint64_t sub_1000092B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  return sub_100026B8C(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL, a2, a3);
}

id sub_1000092BC(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

id sub_1000092C8(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id sub_1000092D4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1000092E0(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_1000091B8(0LL, a2, a3);
}

uint64_t sub_1000092E8()
{
  id v0 = sub_10000BCB4();
  uint64_t v1 = swift_endAccess(v10);
  if (v0)
  {
    sub_10000BC90(v1, v2);
    uint64_t v1 = swift_unknownObjectRelease(v0);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
  }

  sub_10000BC9C(v1, v2);
  if (v12)
  {
    if ((sub_10000BC84( (uint64_t)v9,  v3,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for String,  v4,  v5,  v6,  v7,  v9[0],  v9[1]) & 1) != 0) {
      return v9[0];
    }
  }

  else
  {
    sub_10000BB94((uint64_t)v11);
  }

  return 0LL;
}

uint64_t sub_100009394()
{
  id v0 = sub_10000BCB4();
  uint64_t v1 = swift_endAccess(v13);
  if (v0)
  {
    sub_10000BC90(v1, v2);
    uint64_t v1 = swift_unknownObjectRelease(v0);
  }

  else
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
  }

  sub_10000BC9C(v1, v2);
  if (v14)
  {
    if ((sub_10000BC84( (uint64_t)&v10,  v3,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for UInt64,  v4,  v5,  v6,  v7,  v9,  v10) & 1) != 0) {
      return v10;
    }
  }

  else
  {
    sub_10000BB94((uint64_t)v13);
  }

  return 0LL;
}

void sub_10000943C()
{
  *(_WORD *)&algn_10005C738[6] = -4864;
}

void sub_10000946C()
{
  qword_10005C740 = 0x6F69746174636944LL;
  *(void *)algn_10005C748 = 0xE90000000000006ELL;
}

void sub_100009494()
{
  qword_10005C750 = 1869899074LL;
  *(void *)algn_10005C758 = 0xE400000000000000LL;
}

void sub_1000094B0()
{
  *(_WORD *)&algn_10005C768[6] = -4864;
}

void sub_1000094E0()
{
  qword_10005C770 = 0x6372616553626557LL;
  *(void *)algn_10005C778 = 0xE900000000000068LL;
}

void sub_100009508()
{
  qword_10005C780 = 0x746F687354LL;
  *(void *)algn_10005C788 = 0xE500000000000000LL;
}

Swift::Int sub_100009528()
{
  uint64_t v0 = sub_100004B88(&qword_10005B5A8);
  uint64_t inited = swift_initStackObject(v0, &v8);
  *(_OWORD *)(inited + 16) = xmmword_10003DF40;
  *(void *)(inited + 32) = 0xD000000000000011LL;
  *(void *)(inited + 40) = 0x8000000100043E50LL;
  if (qword_10005A228 != -1) {
    swift_once(&qword_10005A228, sub_10000943C);
  }
  uint64_t v2 = *(void *)algn_10005C738;
  *(void *)(inited + 48) = qword_10005C730;
  *(void *)(inited + 56) = v2;
  uint64_t v3 = qword_10005A238;
  swift_bridgeObjectRetain(v2);
  if (v3 != -1) {
    swift_once(&qword_10005A238, sub_100009494);
  }
  uint64_t v4 = *(void *)algn_10005C758;
  *(void *)(inited + 64) = qword_10005C750;
  *(void *)(inited + 72) = v4;
  uint64_t v5 = qword_10005A240;
  swift_bridgeObjectRetain(v4);
  if (v5 != -1) {
    swift_once(&qword_10005A240, sub_1000094B0);
  }
  uint64_t v6 = *(void *)algn_10005C768;
  *(void *)(inited + 80) = qword_10005C760;
  *(void *)(inited + 88) = v6;
  swift_bridgeObjectRetain(v6);
  Swift::Int result = sub_10000B8F8(inited);
  qword_10005C790 = result;
  return result;
}

Swift::Int sub_10000964C()
{
  uint64_t v0 = sub_100004B88(&qword_10005B5A8);
  uint64_t inited = swift_initStackObject(v0, &v6);
  *(_OWORD *)(inited + 16) = xmmword_10003DF50;
  if (qword_10005A230 != -1) {
    swift_once(&qword_10005A230, sub_10000946C);
  }
  uint64_t v2 = *(void *)algn_10005C748;
  *(void *)(inited + 32) = qword_10005C740;
  *(void *)(inited + 40) = v2;
  uint64_t v3 = qword_10005A248;
  swift_bridgeObjectRetain(v2);
  if (v3 != -1) {
    swift_once(&qword_10005A248, sub_1000094E0);
  }
  uint64_t v4 = *(void *)algn_10005C778;
  *(void *)(inited + 48) = qword_10005C770;
  *(void *)(inited + 56) = v4;
  swift_bridgeObjectRetain(v4);
  Swift::Int result = sub_10000B8F8(inited);
  qword_10005C798 = result;
  return result;
}

id sub_100009718()
{
  id result = [objc_allocWithZone(SPIPowerLogger) initWithCurrentProcess];
  qword_10005C7A0 = (uint64_t)result;
  return result;
}

uint64_t sub_100009748(uint64_t a1, uint64_t a2)
{
  if (qword_10005A258 != -1) {
    swift_once(&qword_10005A258, sub_100009528);
  }
  uint64_t v4 = qword_10005C790;
  swift_bridgeObjectRetain(a2);
  uint64_t v5 = swift_bridgeObjectRetain(v4);
  char v6 = sub_1000098B8(v5, a1, a2);
  swift_bridgeObjectRelease(v4);
  if (qword_10005A260 != -1) {
    swift_once(&qword_10005A260, sub_10000964C);
  }
  uint64_t v7 = qword_10005C798;
  swift_bridgeObjectRetain(a2);
  uint64_t v8 = swift_bridgeObjectRetain(v7);
  char v9 = sub_1000098B8(v8, a1, a2);
  swift_bridgeObjectRelease(v7);
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___AFPreferences);
  id v11 = [v10 sharedPreferences];
  unsigned __int8 v12 = [v11 isDictationHIPAACompliant];

  id v13 = [v10 sharedPreferences];
  id v14 = [v13 siriDataSharingOptInStatus];

  if (v6 & 1 | ((v9 & 1) == 0)) {
    char v15 = v6;
  }
  else {
    char v15 = (v14 == (id)1) & ~v12;
  }
  return v15 & 1;
}

uint64_t sub_1000098B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 + 56;
  uint64_t v7 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v12 = 0LL;
  while (v9)
  {
    unint64_t v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v14 = v13 | (v12 << 6);
LABEL_21:
    id v18 = (void *)(*(void *)(a1 + 48) + 16 * v14);
    uint64_t v19 = v18[1];
    if (*v18 != a2 || v19 != a3)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v18, v19, a2, a3, 0LL);
      if ((result & 1) == 0) {
        continue;
      }
    }

    swift_bridgeObjectRelease(a3);
    swift_release(a1);
    return 1LL;
  }

  int64_t v15 = v12 + 1;
  if (__OFADD__(v12, 1LL))
  {
    __break(1u);
    goto LABEL_29;
  }

  if (v15 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v15);
  ++v12;
  if (v16) {
    goto LABEL_20;
  }
  int64_t v12 = v15 + 1;
  if (v15 + 1 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v12);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v12 = v15 + 2;
  if (v15 + 2 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v12);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v12 = v15 + 3;
  if (v15 + 3 >= v10) {
    goto LABEL_27;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v12);
  if (v16) {
    goto LABEL_20;
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v10)
  {
LABEL_27:
    swift_bridgeObjectRelease(a3);
    swift_release(a1);
    return 0LL;
  }

  unint64_t v16 = *(void *)(v6 + 8 * v17);
  int64_t v12 = v17;
  if (v16)
  {
LABEL_20:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
    goto LABEL_21;
  }

  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v12 >= v10) {
      goto LABEL_27;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }

LABEL_29:
  __break(1u);
  return result;
}

    uint64_t v24 = 0;
    return v24 & 1;
  }

  if (v36) {
    goto LABEL_29;
  }
LABEL_30:
  id v40 = type metadata accessor for ClientInfo(0LL);
  sub_10002496C((uint64_t)a1 + *(int *)(v40 + 32), (uint64_t)v20);
  sub_10002496C((uint64_t)a2 + *(int *)(v40 + 32), (uint64_t)v18);
  id v41 = (uint64_t)&v11[*(int *)(v8 + 48)];
  sub_10002496C((uint64_t)v20, (uint64_t)v11);
  sub_10002496C((uint64_t)v18, v41);
  sub_100025DA0((uint64_t)v11);
  if (v23)
  {
    sub_100005658((uint64_t)v18, &qword_10005C428);
    sub_100005658((uint64_t)v20, &qword_10005C428);
    sub_100025DA0(v41);
    if (v23) {
      uint64_t v24 = -1;
    }
    else {
      uint64_t v24 = 0;
    }
  }

  else
  {
    sub_10002496C((uint64_t)v11, (uint64_t)v15);
    sub_100025DA0(v41);
    if (v42)
    {
      uint64_t v24 = 0;
    }

    else
    {
      sub_100024EBC(v41, (uint64_t)v7);
      uint64_t v43 = static UUID.== infix(_:_:)(v15, v7);
      uint64_t v24 = 0;
      if ((v43 & 1) != 0 && (static UUID.== infix(_:_:)(&v15[*(int *)(v4 + 20)], &v7[*(int *)(v4 + 20)]) & 1) != 0)
      {
        uint64_t v44 = *(int *)(v4 + 24);
        id v45 = *(void *)&v15[v44];
        uint64_t v46 = *(void *)&v15[v44 + 8];
        uint64_t v47 = (uint64_t *)&v7[v44];
        uint64_t v48 = v47[1];
        uint64_t v49 = v45 == *v47 && v46 == v48;
        if (v49 || (sub_100025D88(v45, v46, *v47, v48) & 1) != 0) {
          uint64_t v24 = 1;
        }
      }

      sub_100024E80((uint64_t)v7);
    }

    sub_100005658((uint64_t)v18, &qword_10005C428);
    sub_100005658((uint64_t)v20, &qword_10005C428);
    sub_100024E80((uint64_t)v15);
  }

  uint64_t v50 = sub_10002349C();
  sub_100005658(v50, v51);
  return v24 & 1;
}

unint64_t sub_100009A50(double a1)
{
  double v1 = a1 * 1000000000.0;
  if ((~*(void *)&v1 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v1 < 1.84467441e19) {
    return (unint64_t)v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

BOOL sub_100009A9C(uint64_t a1)
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRPreheatContext);
  if (swift_dynamicCastObjCClass(a1, v2)) {
    return 1LL;
  }
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRRequestContext);
  if (swift_dynamicCastObjCClass(a1, v3)) {
    return 1LL;
  }
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated);
  if (swift_dynamicCastObjCClass(a1, v4)) {
    return 1LL;
  }
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRPackageGenerated);
  if (swift_dynamicCastObjCClass(a1, v5)) {
    return 1LL;
  }
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated);
  if (swift_dynamicCastObjCClass(a1, v6)) {
    return 1LL;
  }
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRInitializationContext);
  if (swift_dynamicCastObjCClass(a1, v7)) {
    return 1LL;
  }
  uint64_t v8 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAssetLoadContext);
  if (swift_dynamicCastObjCClass(a1, v8)) {
    return 1LL;
  }
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext);
  if (swift_dynamicCastObjCClass(a1, v9)) {
    return 1LL;
  }
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext);
  if (swift_dynamicCastObjCClass(a1, v10)) {
    return 1LL;
  }
  uint64_t v11 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed);
  if (swift_dynamicCastObjCClass(a1, v11)) {
    return 1LL;
  }
  uint64_t v12 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived);
  if (swift_dynamicCastObjCClass(a1, v12)) {
    return 1LL;
  }
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateContext);
  if (swift_dynamicCastObjCClass(a1, v13)) {
    return 1LL;
  }
  uint64_t v14 = objc_opt_self(&OBJC_CLASS___ASRSchemaASREmbeddedSpeechProcessContext);
  if (swift_dynamicCastObjCClass(a1, v14)) {
    return 1LL;
  }
  uint64_t v15 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  if (swift_dynamicCastObjCClass(a1, v15)) {
    return 1LL;
  }
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketArrivalContext);
  if (swift_dynamicCastObjCClass(a1, v16)) {
    return 1LL;
  }
  uint64_t v17 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived);
  if (swift_dynamicCastObjCClass(a1, v17)) {
    return 1LL;
  }
  uint64_t v18 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFrameProcessingReady);
  if (swift_dynamicCastObjCClass(a1, v18)) {
    return 1LL;
  }
  uint64_t v19 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRLeadingSilenceProcessed);
  if (swift_dynamicCastObjCClass(a1, v19)) {
    return 1LL;
  }
  uint64_t v20 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed);
  if (swift_dynamicCastObjCClass(a1, v20)) {
    return 1LL;
  }
  uint64_t v21 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded);
  if (swift_dynamicCastObjCClass(a1, v21)) {
    return 1LL;
  }
  uint64_t v22 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream);
  if (swift_dynamicCastObjCClass(a1, v22)) {
    return 1LL;
  }
  uint64_t v23 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketReadyUpstream);
  if (swift_dynamicCastObjCClass(a1, v23)) {
    return 1LL;
  }
  uint64_t v25 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream);
  return swift_dynamicCastObjCClass(a1, v25) != 0;
}

uint64_t sub_100009D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    type metadata accessor for SelfLoggingHelper();
    LOBYTE(a1) = sub_100009A9C(a1);
    char v6 = (a1 | sub_100009748(a2, a3)) ^ 1;
  }

  else
  {
    char v6 = 1;
  }

  return v6 & 1;
}

id sub_100009DAC(uint64_t a1)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v5 = [v3 initWithNSUUID:isa];

  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
  return v5;
}

uint64_t sub_100009E28(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011LL && a2 == 0x8000000100043E50LL
    || (sub_10000BBE0(0xD000000000000011LL, 0x8000000100043E50LL) & 1) != 0)
  {
    return 1LL;
  }

  if (qword_10005A230 != -1) {
    swift_once(&qword_10005A230, sub_10000946C);
  }
  BOOL v5 = qword_10005C740 == a1 && *(void *)algn_10005C748 == a2;
  if (qword_10005A248 != -1) {
    swift_once(&qword_10005A248, sub_1000094E0);
  }
  BOOL v6 = qword_10005C770 == a1 && *(void *)algn_10005C778 == a2;
  if (qword_10005A250 != -1) {
    swift_once(&qword_10005A250, sub_100009508);
  }
  BOOL v7 = qword_10005C780 == a1 && *(void *)algn_10005C788 == a2;
  if (qword_10005A228 != -1) {
    swift_once(&qword_10005A228, sub_10000943C);
  }
  uint64_t v4 = 5LL;
  if (qword_10005C730 != a1 || *(void *)algn_10005C738 != a2)
  {
    else {
      return 0LL;
    }
  }

  return v4;
}

void *sub_100009FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A0C0( a1,  a2,  a3,  (Class *)&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationStarted_ptr,  (SEL *)&selRef_setStartedOrChanged_);
}

void sub_100009FF0(uint64_t a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  sub_10000BC04((uint64_t)&unk_10005B2E0, (uint64_t)v5);
  objc_setAssociatedObject(v2, &unk_10005B2E0, v4, (void *)1);
  swift_endAccess(v5);

  sub_10000BC3C();
}

void sub_10000A054()
{
  Class isa = UInt64._bridgeToObjectiveC()().super.super.isa;
  sub_10000BC04((uint64_t)&unk_10005B2D0, (uint64_t)v2);
  objc_setAssociatedObject(v0, &unk_10005B2D0, isa, (void *)1);
  swift_endAccess(v2);

  sub_10000BC3C();
}

void *sub_10000A0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000A0C0( a1,  a2,  a3,  (Class *)&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationEnded_ptr,  (SEL *)&selRef_setEnded_);
}

void *sub_10000A0C0(uint64_t a1, uint64_t a2, uint64_t a3, Class *a4, SEL *a5)
{
  id v8 = [objc_allocWithZone(*a4) init];
  uint64_t v9 = v8;
  if (v8) {
    sub_10000BCC8(v8, "setExists:");
  }
  id v10 = [objc_allocWithZone(ASRSchemaASRAppleNeuralEngineModelInitializationContext) init];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
    swift_bridgeObjectRetain(a3);
    sub_100009FF0(a2, a3);

    id v13 = v12;
    sub_10000A054();
  }

  id v14 = v11;
  objc_msgSend(v14, *a5, v9);

  return v11;
}

void sub_10000A1A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!((unint64_t)a4 >> 62))
  {
    uint64_t v5 = *(void *)((a4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    sub_10000BCC0();
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease((_TtC22localspeechrecognition19EARSpeechRecognizer *)a4, v6, v7, v8, v9, v10, v11, v12);
    return;
  }

  if (a4 < 0) {
    uint64_t v20 = a4;
  }
  else {
    uint64_t v20 = a4 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_10000BCC0();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v20);
  if (!v5) {
    goto LABEL_9;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v13 = 0LL;
    do
    {
      if ((a4 & 0xC000000000000001LL) != 0) {
        id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, a4);
      }
      else {
        id v14 = *(id *)(a4 + 8 * v13 + 32);
      }
      uint64_t v15 = v14;
      ++v13;
      sub_100009394();
      uint64_t v16 = sub_10000BC6C();
      sub_10000ACF0(v16, v17, v18, v15, v19);
    }

    while (v5 != v13);
    goto LABEL_9;
  }

  __break(1u);
}

void sub_10000A290(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
}

void sub_10000A2AC(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
}

void sub_10000A2C8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
}

void sub_10000A2E4(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
}

void sub_10000A300( uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, Class *a5, SEL *a6, void *a7)
{
  id v20 = [objc_allocWithZone(*a5) init];
  if (v20) {
    sub_10000BCC8(v20, "setExists:");
  }
  id v13 = [objc_allocWithZone(ASRSchemaASRActiveConfigUpdateContext) init];
  objc_msgSend(v13, *a6, v20);
  id v14 = v13;
  sub_10000ACF0(a1, a2, a3, v13, a4);

  if (qword_10005A268 != -1) {
    swift_once(&qword_10005A268, sub_100009718);
  }
  id v15 = [(id)qword_10005C7A0 captureSnapshot];
  if (!v15) {
    goto LABEL_8;
  }
  uint64_t v16 = v15;
  id v17 = [(id)objc_opt_self(*a7) context];
  if (v17)
  {
    unint64_t v18 = v17;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v16 logWithEventContext:v18 asrIdentifier:isa];

LABEL_8:
    return;
  }

  __break(1u);
}

void sub_10000A470(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
}

void sub_10000A48C( uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, Class *a5, Class *a6, SEL *a7)
{
  id v13 = [objc_allocWithZone(*a5) init];
  id v14 = v13;
  if (v13) {
    sub_10000BCC8(v13, "setExists:");
  }
  id v15 = [objc_allocWithZone(*a6) init];
  objc_msgSend(v15, *a7, v14);
  id v16 = v15;
  sub_10000ACF0(a1, a2, a3, v15, a4);
}

void sub_10000A560(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100005154();
  __chkstk_darwin(v7);
  sub_1000050EC();
  uint64_t v10 = v9 - v8;
  id v11 = sub_10000BC10(objc_allocWithZone(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEndedTier1));
  sub_1000092E0((uint64_t)v11, &qword_10005B598, &OBJC_CLASS___SISchemaUUID_ptr);
  id v12 = sub_10000BC10(objc_allocWithZone(&OBJC_CLASS___NSUUID));
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  id v13 = sub_100009DAC(v10);
  if (v11)
  {
    [v11 setLinkId:v13];
    id v14 = v11;
    sub_10000BB00(a5, v14);
  }

  id v15 = sub_10000BC10(objc_allocWithZone(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEnded));
  id v16 = v15;
  if (v15) {
    [v15 setLinkId:v13];
  }
  id v17 = sub_10000BC10(objc_allocWithZone(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext));
  [v17 setEnded:v16];
  id v18 = v11;
  uint64_t v19 = sub_10000BC6C();
  sub_10000ACF0(v19, v20, v21, v11, a4);

  id v22 = v17;
  uint64_t v23 = sub_10000BC6C();
  sub_10000ACF0(v23, v24, v25, v17, a4);

  sub_1000050C0();
}

void sub_10000A6F4( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, double a6, uint64_t a7, void *a8, char a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, char a19, unint64_t a20, unsigned __int8 a21)
{
  uint64_t v27 = sub_100005154();
  __chkstk_darwin(v27);
  sub_1000050EC();
  uint64_t v30 = v29 - v28;
  id v31 = [objc_allocWithZone(ASRSchemaASRStarted) init];
  if (!a3)
  {

    return;
  }

  uint64_t v73 = v31;
  if (v31)
  {
    id v32 = sub_10000BBF0();
    objc_msgSend(v32, "setTask:", sub_100009E28(a2, a3));

    id v31 = v73;
    if (a5)
    {
      v75[2] = a4;
      v75[3] = a5;
      v75[0] = 95LL;
      v75[1] = 0xE100000000000000LL;
      uint64_t v33 = a1;
      uint64_t v34 = objc_opt_self(&OBJC_CLASS___SIUtilities);
      v74[0] = 45LL;
      v74[1] = 0xE100000000000000LL;
      unint64_t v35 = sub_10000BAC4();
      id v36 = v32;
      StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v75,  v74,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v35,  v35,  v35);
      uint64_t v38 = v37;
      NSString v39 = String._bridgeToObjectiveC()();
      *(void *)&double v40 = swift_bridgeObjectRelease(v38).n128_u64[0];
      id v41 = (void *)v34;
      a1 = v33;
      id v42 = objc_msgSend(v41, "convertLanguageCodeToSchemaLocale:", v39, v40);

      [v36 setModelLocale:v42];
      id v31 = v73;
    }
  }

  id v43 = [v31 setIsHighQualityAsset:a9 & 1];
  if (!a16
    || (sub_1000092E0((uint64_t)v43, &qword_10005B5B8, &OBJC_CLASS___NSUUID_ptr),
        swift_bridgeObjectRetain(a16),
        (id v44 = sub_10000AC80(a15, a16)) == 0LL))
  {
    uint64_t v47 = &selRef_initWithConfiguration_euclidEncoderType_initFlag_;
    if (a6 <= 0.0)
    {
      uint64_t v52 = (uint64_t)v73;
      unint64_t v50 = a20;
      int v51 = a21;
      if (v73)
      {
LABEL_15:
        unint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_16;
      }
    }

    else
    {
      uint64_t v52 = (uint64_t)v73;
      unint64_t v50 = a20;
      int v51 = a21;
      if (v73) {
        goto LABEL_12;
      }
    }

LABEL_30:
    sub_10000BC5C(v52, "setGeoLanguageModelLoaded:");
    char v56 = a19;
    goto LABEL_31;
  }

  id v45 = v44;
  sub_1000092E0((uint64_t)v44, &qword_10005B598, &OBJC_CLASS___SISchemaUUID_ptr);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v45);
  id v46 = sub_100009DAC(v30);
  uint64_t v47 = &selRef_initWithConfiguration_euclidEncoderType_initFlag_;
  if (!v73)
  {

    unint64_t v50 = a20;
    int v51 = a21;
    goto LABEL_30;
  }

  id v48 = v73;
  id v49 = v46;
  sub_10000BCA8((uint64_t)v49, "setDictationUiInteractionId:");

  unint64_t v50 = a20;
  int v51 = a21;
  if (a6 <= 0.0) {
    goto LABEL_15;
  }
LABEL_12:
  type metadata accessor for SelfLoggingHelper();
  unint64_t v53 = sub_100009A50(a6);
LABEL_16:
  uint64_t v54 = a8;
  [v73 setSpeechProfileAgeInNs:v53];
  if (a8)
  {
    sub_10000BBF0();
    NSString v55 = sub_10000BC7C();
    uint64_t v54 = v55;
  }

  else
  {
    NSString v55 = sub_10000BBF0();
  }

  char v56 = a19;
  sub_10000BBF8((uint64_t)v55, "setDatapackVersion:");
  sub_10000BC24();

  uint64_t v57 = a11;
  if (a11)
  {
    sub_10000BBF0();
    NSString v58 = sub_10000BC7C();
    uint64_t v57 = v58;
  }

  else
  {
    NSString v58 = sub_10000BBF0();
  }

  sub_10000BBF8((uint64_t)v58, "setHammerVersion:");
  sub_10000BC24();

  uint64_t v59 = a13;
  if (a13)
  {
    sub_10000BBF0();
    NSString v60 = sub_10000BC7C();
    uint64_t v59 = v60;
  }

  else
  {
    NSString v60 = sub_10000BBF0();
  }

  sub_10000BBF8((uint64_t)v60, "setGeoLanguageModelRegion:");
  sub_10000BC24();

  sub_10000BC5C(v61, "setGeoLanguageModelLoaded:");
  uint64_t v62 = a18;
  if (a18)
  {
    sub_10000BBF0();
    NSString v63 = sub_10000BC7C();
    uint64_t v62 = v63;
  }

  else
  {
    NSString v63 = sub_10000BBF0();
  }

  sub_10000BBF8((uint64_t)v63, "setPortraitExperimentVariantName:");
  sub_10000BC24();

LABEL_31:
  [v73 setAtypicalSpeechEnabled:v56 & 1];
  if (v51 != 2) {
    [v73 setIsEmptyTextField:v51 & 1];
  }
  id v64 = [objc_allocWithZone(ASRSchemaASRRequestContext) v47[304]];
  [v64 setStartedOrChanged:v73];
  id v65 = v64;
  sub_10000ACF0(a1, a2, a3, v64, v50);

  if (qword_10005A268 != -1) {
    swift_once(&qword_10005A268, sub_100009718);
  }
  id v66 = [(id)qword_10005C7A0 captureSnapshot];
  if (!v66) {
    goto LABEL_38;
  }
  uint64_t v67 = v66;
  id v68 = [(id)objc_opt_self(SPIAsrRequestStartedOrChangedEventContext) context];
  if (v68)
  {
    uint64_t v69 = v68;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v67 logWithEventContext:v69 asrIdentifier:isa];

LABEL_38:
    sub_10000BC24();
    return;
  }

  __break(1u);
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

id sub_10000AC80(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithUUIDString:v5];

  return v6;
}

void sub_10000ACF0(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, unint64_t a5)
{
  uint64_t v11 = sub_100005154();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_1000050EC();
  uint64_t v15 = v14 - v13;
  if (a4)
  {
    uint64_t v106 = v5;
    id v16 = (os_log_s *)type metadata accessor for SelfLoggingHelper();
    id v109 = a4;
    if ((sub_100009D48((uint64_t)v109, a2, a3) & 1) != 0)
    {
      sub_10000BC18();
      if (!v17) {
        swift_once(&qword_10005A208, sub_100005224);
      }
      uint64_t v18 = sub_10000706C();
      sub_100004C5C(v18, (uint64_t)qword_10005C6F8);
      id v19 = sub_10000BCD8();
      swift_bridgeObjectRetain_n(a3, 2LL);
      id v109 = v19;
      Logger.logObject.getter(v109);
      os_log_type_t v20 = sub_10000BCD0();
      if (sub_10000BC2C(v20))
      {
        uint64_t v21 = sub_100007000(22LL);
        v104 = (void *)sub_100007000(8LL);
        uint64_t v107 = sub_100007000(32LL);
        uint64_t v111 = v107;
        *(_DWORD *)uint64_t v21 = 138412546;
        uint64_t v110 = (uint64_t)v109;
        id v22 = v109;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v21 + 4);
        void *v104 = a4;

        *(_WORD *)(v21 + 12) = 2080;
        sub_10000BCC0();
        uint64_t v110 = sub_100026B8C(a2, a3, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111, v21 + 14);
        swift_bridgeObjectRelease_n(a3, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v16,  (os_log_type_t)a1,  "Logging prohibited for event:%@ task:%s",  (uint8_t *)v21,  0x16u);
        sub_100004B88(&qword_10005B5A0);
        sub_100007010((uint64_t)v104);
        sub_100006FF4((uint64_t)v104);
        sub_100007010(v107);
        sub_100006FF4(v107);
        sub_100006FF4(v21);

        goto LABEL_7;
      }

      swift_bridgeObjectRelease_n(a3, 2LL);
      sub_10000BC54();
      id v32 = (os_log_s *)v109;
    }

    else
    {
      id v26 = sub_10000BC10(objc_allocWithZone(&OBJC_CLASS___ASRSchemaASRClientEventMetadata));
      if (v26)
      {
        uint64_t v27 = v26;
        sub_1000092E0((uint64_t)v26, &qword_10005B598, &OBJC_CLASS___SISchemaUUID_ptr);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15, a1, v11);
        id v16 = (os_log_s *)sub_100009DAC(v15);
        [v27 setAsrId:v16];

        id v28 = sub_10000BC10(objc_allocWithZone(&OBJC_CLASS___ASRSchemaASRClientEvent));
        if (v28)
        {
          uint64_t v29 = v28;
          [v28 setEventMetadata:v27];
          uint64_t v30 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRPreheatContext);
          uint64_t v31 = sub_10000BBD4(v30);
          if (v31)
          {
            [v29 setPreheatContext:v31];
          }

          else
          {
            uint64_t v39 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRRequestContext);
            uint64_t v40 = sub_10000BBD4(v39);
            if (v40)
            {
              [v29 setRequestContext:v40];
            }

            else
            {
              uint64_t v41 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRPartialResultGenerated);
              uint64_t v42 = sub_10000BBD4(v41);
              if (v42)
              {
                [v29 setPartialResultGenerated:v42];
              }

              else
              {
                uint64_t v43 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRPackageGenerated);
                uint64_t v44 = sub_10000BBD4(v43);
                if (v44)
                {
                  [v29 setPackageGenerated:v44];
                }

                else
                {
                  uint64_t v45 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRRecognitionResultTier1);
                  uint64_t v46 = sub_10000BBD4(v45);
                  if (v46)
                  {
                    [v29 setRecognitionResultTier1:v46];
                  }

                  else
                  {
                    uint64_t v47 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRRescoringDeliberationResultTier1);
                    uint64_t v48 = sub_10000BBD4(v47);
                    if (v48)
                    {
                      [v29 setRescoringDeliberationResultTier1:v48];
                    }

                    else
                    {
                      uint64_t v49 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFinalResultGenerated);
                      uint64_t v50 = sub_10000BBD4(v49);
                      if (v50)
                      {
                        [v29 setFinalResultGenerated:v50];
                      }

                      else
                      {
                        uint64_t v51 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRIntermediateUtteranceInfoTier1);
                        uint64_t v52 = sub_10000BBD4(v51);
                        if (v52)
                        {
                          [v29 setIntermediateUtteranceInfoTier1:v52];
                        }

                        else
                        {
                          uint64_t v53 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRInitializationContext);
                          uint64_t v54 = sub_10000BBD4(v53);
                          if (v54)
                          {
                            [v29 setInitializationContext:v54];
                          }

                          else
                          {
                            uint64_t v55 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRActiveConfigUpdateContext);
                            uint64_t v56 = sub_10000BBD4(v55);
                            if (v56)
                            {
                              [v29 setActiveConfigUpdateContext:v56];
                            }

                            else
                            {
                              uint64_t v57 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentContext);
                              uint64_t v58 = sub_10000BBD4(v57);
                              if (v58)
                              {
                                [v29 setLanguageModelEnrollmentContext:v58];
                              }

                              else
                              {
                                uint64_t v59 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRJitLanguageModelEnrollmentEndedTier1);
                                uint64_t v60 = sub_10000BBD4(v59);
                                if (v60)
                                {
                                  [v29 setJitLanguageModelEnrollmentEndedTier1:v60];
                                }

                                else
                                {
                                  uint64_t v61 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioPacketArrivalContext);
                                  uint64_t v62 = sub_10000BBD4(v61);
                                  if (v62)
                                  {
                                    [v29 setAudioPacketArrivalContext:v62];
                                  }

                                  else
                                  {
                                    uint64_t v63 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketProcessed);
                                    uint64_t v64 = sub_10000BBD4(v63);
                                    if (v64)
                                    {
                                      [v29 setFirstAudioPacketProcessed:v64];
                                    }

                                    else
                                    {
                                      uint64_t v65 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReceived);
                                      uint64_t v66 = sub_10000BBD4(v65);
                                      if (v66)
                                      {
                                        [v29 setFinalAudioPacketContainingSpeechReceived:v66];
                                      }

                                      else
                                      {
                                        uint64_t v67 = objc_opt_self(&OBJC_CLASS___ASRSchemaASREmbeddedSpeechProcessContext);
                                        uint64_t v68 = sub_10000BBD4(v67);
                                        if (v68)
                                        {
                                          [v29 setEmbeddedSpeechProcessContext:v68];
                                        }

                                        else
                                        {
                                          uint64_t v69 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAppleNeuralEngineModelInitializationContext);
                                          uint64_t v70 = sub_10000BBD4(v69);
                                          if (v70)
                                          {
                                            [v29 setAppleNeuralEngineModelInitializationContext:v70];
                                          }

                                          else
                                          {
                                            uint64_t v71 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFrameProcessingReady);
                                            uint64_t v72 = sub_10000BBD4(v71);
                                            if (v72)
                                            {
                                              [v29 setFrameProcessingReady:v72];
                                            }

                                            else
                                            {
                                              uint64_t v73 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived);
                                              uint64_t v74 = sub_10000BBD4(v73);
                                              if (v74)
                                              {
                                                [v29 setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:v74];
                                              }

                                              else
                                              {
                                                uint64_t v75 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioSpeechPacketArrivalContext);
                                                uint64_t v76 = sub_10000BBD4(v75);
                                                if (v76)
                                                {
                                                  [v29 setAudioSpeechPacketArrivalContext:v76];
                                                }

                                                else
                                                {
                                                  uint64_t v77 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRLeadingSilenceProcessed);
                                                  uint64_t v78 = sub_10000BBD4(v77);
                                                  if (v78)
                                                  {
                                                    [v29 setLeadingSilenceProcessed:v78];
                                                  }

                                                  else
                                                  {
                                                    uint64_t v79 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed);
                                                    uint64_t v80 = sub_10000BBD4(v79);
                                                    if (v80)
                                                    {
                                                      [v29 setFirstSecondAfterLeadingSilenceProcessed:v80];
                                                    }

                                                    else
                                                    {
                                                      uint64_t v81 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketRecorded);
                                                      uint64_t v82 = sub_10000BBD4(v81);
                                                      if (v82)
                                                      {
                                                        [v29 setFirstAudioPacketRecorded:v82];
                                                      }

                                                      else
                                                      {
                                                        uint64_t v83 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream);
                                                        uint64_t v84 = sub_10000BBD4(v83);
                                                        if (v84)
                                                        {
                                                          [v29 setAudioPacketContainingEndOfFirstWordReadyUpstream:v84];
                                                        }

                                                        else
                                                        {
                                                          uint64_t v85 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFirstAudioPacketReadyUpstream);
                                                          uint64_t v86 = sub_10000BBD4(v85);
                                                          if (v86)
                                                          {
                                                            [v29 setFirstAudioPacketReadyUpstream:v86];
                                                          }

                                                          else
                                                          {
                                                            uint64_t v87 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream);
                                                            uint64_t v88 = sub_10000BBD4(v87);
                                                            if (v88)
                                                            {
                                                              [v29 setFinalAudioPacketContainingSpeechReadyUpstream:v88];
                                                            }

                                                            else
                                                            {
                                                              uint64_t v89 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRDictationVoiceCommandMetricsReported);
                                                              uint64_t v90 = sub_10000BBD4(v89);
                                                              if (v90)
                                                              {
                                                                [v29 setDictationVoiceCommandMetricsReported:v90];
                                                              }

                                                              else
                                                              {
                                                                uint64_t v91 = objc_opt_self(&OBJC_CLASS___ASRSchemaASRDictationVoiceCommandInfoTier1);
                                                                uint64_t v92 = sub_10000BBD4(v91);
                                                                if (v92)
                                                                {
                                                                  [v29 setDictationVoiceCommandInfoTier1:v92];
                                                                }

                                                                else
                                                                {
                                                                  sub_10000BC18();
                                                                  if (!v17) {
                                                                    swift_once(&qword_10005A208, sub_100005224);
                                                                  }
                                                                  uint64_t v101 = sub_10000706C();
                                                                  sub_1000070E8(v101, (uint64_t)qword_10005C6F8);
                                                                  os_log_type_t v102 = sub_10000BCD0();
                                                                  if (sub_10000BC2C(v102))
                                                                  {
                                                                    v103 = (uint8_t *)sub_100007000(2LL);
                                                                    *(_WORD *)v103 = 0;
                                                                    sub_10000BC4C( (void *)&_mh_execute_header,  v16,  (os_log_type_t)a1,  "SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggab le message type in the ASR SELF schema.",  v103);
                                                                    sub_100006FF4((uint64_t)v103);
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          sub_10000BC18();
          if (!v17) {
            swift_once(&qword_10005A208, sub_100005224);
          }
          uint64_t v93 = sub_10000706C();
          sub_100004C5C(v93, (uint64_t)qword_10005C6F8);
          id v94 = sub_10000BCD8();
          v95 = (os_log_s *)Logger.logObject.getter(v94);
          os_log_type_t v97 = static os_log_type_t.debug.getter(v95, v96);
          if (os_log_type_enabled(v95, v97))
          {
            v98 = (uint8_t *)sub_100007000(12LL);
            v105 = (void *)sub_100007000(8LL);
            *(_DWORD *)v98 = 138412290;
            uint64_t v111 = (uint64_t)v94;
            id v99 = v94;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, &v112, v98 + 4);
            void *v105 = a4;

            _os_log_impl( (void *)&_mh_execute_header,  v95,  v97,  "SELF: Wrapping and logging an event of type %@",  v98,  0xCu);
            sub_100004B88(&qword_10005B5A0);
            sub_100007010((uint64_t)v105);
            sub_100006FF4((uint64_t)v105);
            sub_100006FF4((uint64_t)v98);
          }

          else
          {

            v95 = (os_log_s *)v94;
          }

          if (a5)
          {
            [*(id *)(v106 + 16) emitMessage:v29 timestamp:sub_10000B7B0(a5)];
          }

          else
          {
            sub_10000BCA8(v100, "emitMessage:");
          }

          goto LABEL_93;
        }

        sub_10000BC18();
        if (!v17) {
          swift_once(&qword_10005A208, sub_100005224);
        }
        uint64_t v36 = sub_10000706C();
        sub_1000070E8(v36, (uint64_t)qword_10005C6F8);
        os_log_type_t v37 = sub_10000BCD0();
        if (!os_log_type_enabled(v16, v37))
        {

          sub_10000BC54();
          goto LABEL_93;
        }

        uint64_t v38 = (uint8_t *)sub_100007000(2LL);
        *(_WORD *)uint64_t v38 = 0;
        sub_10000BC4C((void *)&_mh_execute_header, v16, v37, "Failed to create SELF event", v38);
        sub_100006FF4((uint64_t)v38);

        sub_10000BC54();
LABEL_7:

LABEL_93:
        sub_1000050C0();
        return;
      }

      sub_10000BC18();
      if (!v17) {
        swift_once(&qword_10005A208, sub_100005224);
      }
      uint64_t v33 = sub_10000706C();
      v108 = (os_log_s *)sub_1000070E8(v33, (uint64_t)qword_10005C6F8);
      os_log_type_t v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v108, v34))
      {
        unint64_t v35 = (uint8_t *)sub_100007000(2LL);
        *(_WORD *)unint64_t v35 = 0;
        sub_10000BC4C((void *)&_mh_execute_header, v108, v34, "Failed to create SELF event metadata", v35);
        sub_100006FF4((uint64_t)v35);
        sub_10000BC54();

        return;
      }

      id v32 = v108;
    }
  }

  else
  {
    sub_10000BC18();
    if (!v17) {
      swift_once(&qword_10005A208, sub_100005224);
    }
    uint64_t v23 = sub_10000706C();
    id v109 = (id)sub_1000070E8(v23, (uint64_t)qword_10005C6F8);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v109, v24))
    {
      unint64_t v25 = (uint8_t *)sub_100007000(2LL);
      *(_WORD *)unint64_t v25 = 0;
      sub_10000BC4C((void *)&_mh_execute_header, (os_log_s *)v109, v24, "topLevelEvent is nil", v25);
      sub_100006FF4((uint64_t)v25);
    }
  }
}

unint64_t sub_10000B7B0(unint64_t a1)
{
  unint64_t v6 = 0LL;
  unint64_t v7 = 0LL;
  mach_get_times(&v7, &v6, 0LL);
  unint64_t v2 = v6 - v7;
  if (v6 < v7) {
    __break(1u);
  }
  BOOL v3 = a1 >= v2;
  unint64_t v4 = a1 - v2;
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t SelfLoggingHelper.deinit()
{
  return v0;
}

uint64_t SelfLoggingHelper.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

id *SelfLoggingPreheatWithPowerContainer.deinit()
{
  return v0;
}

uint64_t SelfLoggingPreheatWithPowerContainer.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for SelfLoggingHelper()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition17SelfLoggingHelper);
}

uint64_t type metadata accessor for SelfLoggingPreheatWithPowerContainer()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition36SelfLoggingPreheatWithPowerContainer);
}

Swift::Int sub_10000B8F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    unint64_t v4 = &_swiftEmptySetSingleton;
    goto LABEL_25;
  }

  sub_100004B88(&qword_10005B5B0);
  Swift::Int result = static _SetStorage.allocate(capacity:)(v2);
  unint64_t v4 = (void *)result;
  uint64_t v27 = *(void *)(a1 + 16);
  if (!v27)
  {
LABEL_25:
    swift_bridgeObjectRelease(a1);
    return (Swift::Int)v4;
  }

  unint64_t v5 = 0LL;
  Swift::Int v6 = result + 56;
  while (v5 < *(void *)(a1 + 16))
  {
    unint64_t v7 = (uint64_t *)(a1 + 32 + 16 * v5);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    Hasher.init(_seed:)(v28, v4[5]);
    swift_bridgeObjectRetain(v8);
    String.hash(into:)(v28, v9, v8);
    Swift::Int result = Hasher._finalize()();
    uint64_t v10 = -1LL << *((_BYTE *)v4 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v6 + 8 * (v11 >> 6));
    uint64_t v14 = 1LL << v11;
    if (((1LL << v11) & v13) != 0)
    {
      uint64_t v15 = v4[6];
      id v16 = (void *)(v15 + 16 * v11);
      uint64_t v17 = v16[1];
      BOOL v18 = *v16 == v9 && v17 == v8;
      if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v9, v8, 0LL), (result & 1) != 0))
      {
LABEL_11:
        Swift::Int result = swift_bridgeObjectRelease(v8);
        goto LABEL_22;
      }

      uint64_t v19 = ~v10;
      while (1)
      {
        unint64_t v11 = (v11 + 1) & v19;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v6 + 8 * (v11 >> 6));
        uint64_t v14 = 1LL << v11;
        if ((v13 & (1LL << v11)) == 0) {
          break;
        }
        os_log_type_t v20 = (void *)(v15 + 16 * v11);
        uint64_t v21 = v20[1];
        if (*v20 != v9 || v21 != v8)
        {
          Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v9, v8, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_11;
      }
    }

    *(void *)(v6 + 8 * v12) = v14 | v13;
    uint64_t v23 = (void *)(v4[6] + 16 * v11);
    *uint64_t v23 = v9;
    v23[1] = v8;
    uint64_t v24 = v4[2];
    BOOL v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_27;
    }
    v4[2] = v26;
LABEL_22:
    if (++v5 == v27) {
      goto LABEL_25;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_10000BAC4()
{
  unint64_t result = qword_10005B5C0;
  if (!qword_10005B5C0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10005B5C0);
  }

  return result;
}

void sub_10000BB00(uint64_t a1, void *a2)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [a2 setDialogContexts:isa];
}

uint64_t sub_10000BB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005C1C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BB94(uint64_t a1)
{
  uint64_t v2 = sub_100004B88(&qword_10005C1C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000BBD4(uint64_t a1)
{
  return swift_dynamicCastObjCClass(*(void *)(v1 - 104), a1);
}

uint64_t sub_10000BBE0(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0LL);
}

id sub_10000BBF0()
{
  return *(id *)(v0 - 160);
}

id sub_10000BBF8(uint64_t a1, const char *a2)
{
  return objc_msgSend(*(id *)(v3 - 160), a2, v2);
}

uint64_t sub_10000BC04(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 32LL, 0LL);
}

id sub_10000BC10(void *a1)
{
  return [a1 *(SEL *)(v1 + 2432)];
}

  ;
}

void sub_10000BC24()
{
}

BOOL sub_10000BC2C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

void sub_10000BC4C(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000BC54()
{
}

id sub_10000BC5C(uint64_t a1, const char *a2)
{
  return objc_msgSend(*(id *)(v2 - 160), a2, *(_DWORD *)(v2 - 180) & 1);
}

uint64_t sub_10000BC6C()
{
  return v0;
}

NSString sub_10000BC7C()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000BC84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return swift_dynamicCast(a1, va, a3, a4, 6LL);
}

void *sub_10000BC90(uint64_t a1, uint64_t a2, ...)
{
  return _bridgeAnyObjectToAny(_:)((uint64_t *)va, v2);
}

uint64_t sub_10000BC9C(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  return sub_10000BB4C((uint64_t)va, (uint64_t)va1);
}

id sub_10000BCA8(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

id sub_10000BCB4()
{
  return objc_getAssociatedObject(v1, v0);
}

uint64_t sub_10000BCC0()
{
  return swift_bridgeObjectRetain(v0);
}

id sub_10000BCC8(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 1);
}

uint64_t sub_10000BCD0()
{
  return static os_log_type_t.error.getter();
}

id sub_10000BCD8()
{
  return *(id *)(v0 - 104);
}

void sub_10000BCE4()
{
  qword_10005B5C8 = 0x746163696C707041LL;
  unk_10005B5D0 = 0xEF656D614E6E6F69LL;
}

void sub_10000BD14()
{
  qword_10005B5D8 = 0x65676175676E614CLL;
  unk_10005B5E0 = 0xE800000000000000LL;
}

void sub_10000BD38()
{
  unk_10005B5F5 = 0;
  unk_10005B5F6 = -5120;
}

void sub_10000BD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004B88(&qword_10005B6B8);
  uint64_t inited = swift_initStackObject(v6, v16);
  *(_OWORD *)(inited + 16) = xmmword_10003E000;
  *(void *)(inited + 32) = 0x6E65764520525341LL;
  *(void *)(inited + 40) = 0xE900000000000074LL;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v8 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  if (a3)
  {
    swift_bridgeObjectRetain(a3);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
    uint64_t v15 = v8;
    sub_10000C1C4(a3, (uint64_t)sub_10000C3D0, 0LL, isUniquelyReferenced_nonNull_native, &v15);
    uint64_t v8 = v15;
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  NSString v10 = String._bridgeToObjectiveC()();
  sub_100015164(v8);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease(v8);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  __n128 v14 = swift_bridgeObjectRelease(v12);
  SFPLLogRegisteredEvent(38LL, v10, isa, 0LL, v14);
}

double sub_10000BEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100004B88(&qword_10005B6B8);
  uint64_t inited = swift_initStackObject(v12, v30);
  *(_OWORD *)(inited + 16) = xmmword_10003E000;
  if (qword_10005A270 != -1) {
    swift_once(&qword_10005A270, sub_10000BCE4);
  }
  uint64_t v14 = unk_10005B5D0;
  *(void *)(inited + 32) = qword_10005B5C8;
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(a2);
  uint64_t v15 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  uint64_t v31 = v15;
  if (qword_10005A278 != -1) {
    swift_once(&qword_10005A278, sub_10000BD14);
  }
  uint64_t v17 = qword_10005B5D8;
  uint64_t v16 = unk_10005B5E0;
  swift_bridgeObjectRetain(unk_10005B5E0);
  if (a4)
  {
    swift_bridgeObjectRetain(a4);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
    sub_100020154(a3, a4, v17, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v31 = v15;
    swift_bridgeObjectRelease(v16);
    unint64_t v19 = 0x8000000000000000LL;
  }

  else
  {
    sub_10001EE40(v17, v16);
    unint64_t v21 = v20;
    swift_bridgeObjectRelease(v16);
    unint64_t v19 = v21;
  }

  swift_bridgeObjectRelease(v19);
  if (qword_10005A280 != -1) {
    swift_once(&qword_10005A280, sub_10000BD38);
  }
  uint64_t v23 = qword_10005B5E8;
  uint64_t v22 = unk_10005B5F0;
  swift_bridgeObjectRetain(unk_10005B5F0);
  if (a6)
  {
    swift_bridgeObjectRetain(a6);
    uint64_t v24 = v31;
    char v25 = swift_isUniquelyReferenced_nonNull_native(v31);
    sub_100020154(a5, a6, v23, v22, v25);
    uint64_t v26 = v24;
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  else
  {
    sub_10001EE40(v23, v22);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v28);
    uint64_t v26 = v31;
  }

  sub_10000BD64(0xD000000000000024LL, 0x8000000100043EA0LL, v26);
  *(void *)&double result = swift_bridgeObjectRelease(v26).n128_u64[0];
  return result;
}

uint64_t type metadata accessor for PowerlogHelper()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition14PowerlogHelper);
}

uint64_t sub_10000C17C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  return a2;
}

uint64_t sub_10000C1C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v40 = v41;
  uint64_t v38 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v39 = a3;
  swift_retain(a3);
  uint64_t v9 = sub_10000C44C();
  if (v10)
  {
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    while (1)
    {
      uint64_t v17 = (void *)*a5;
      unint64_t v19 = sub_10001EBB4(v13, v14);
      uint64_t v20 = v17[2];
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        break;
      }
      char v23 = v18;
      if (v17[3] >= v22)
      {
        if ((a4 & 1) == 0)
        {
          sub_100004B88(&qword_10005C260);
          _NativeDictionary.copy()();
        }
      }

      else
      {
        sub_10001F9EC(v22, a4 & 1);
        unint64_t v24 = sub_10001EBB4(v13, v14);
        if ((v23 & 1) != (v25 & 1)) {
          goto LABEL_17;
        }
        unint64_t v19 = v24;
      }

      uint64_t v26 = (void *)*a5;
      if ((v23 & 1) != 0)
      {
        swift_bridgeObjectRelease(v14);
        uint64_t v27 = (void *)(v26[7] + 16 * v19);
        swift_bridgeObjectRelease(v27[1]);
        void *v27 = v15;
        v27[1] = v16;
      }

      else
      {
        v26[(v19 >> 6) + 8] |= 1LL << v19;
        uint64_t v28 = (uint64_t *)(v26[6] + 16 * v19);
        *uint64_t v28 = v13;
        v28[1] = v14;
        uint64_t v29 = (void *)(v26[7] + 16 * v19);
        *uint64_t v29 = v15;
        v29[1] = v16;
        uint64_t v30 = v26[2];
        BOOL v31 = __OFADD__(v30, 1LL);
        uint64_t v32 = v30 + 1;
        if (v31) {
          goto LABEL_16;
        }
        v26[2] = v32;
      }

      uint64_t v13 = sub_10000C44C();
      uint64_t v14 = v33;
      uint64_t v15 = v34;
      uint64_t v16 = v35;
      a4 = 1;
      if (!v33) {
        goto LABEL_14;
      }
    }

    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
  }

  else
  {
LABEL_14:
    swift_bridgeObjectRelease(v38);
    uint64_t v36 = v42;
    swift_release(v39);
    sub_10000C5E4(v40);
    return swift_release(v36);
  }

  return result;
}

uint64_t sub_10000C3D0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000C17C(v7, *a1, a1[1], a1[2], a1[3]);
  uint64_t v4 = v7[0];
  uint64_t v5 = v7[1];
  *a2 = result;
  a2[1] = v6;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

uint64_t sub_10000C410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v8 = -1LL;
  }
  a4[3] = 0LL;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_10000C44C()
{
  void (*v13)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  void v22[4];
  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 56) + 16 * v6);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v13 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v12);
    v13(&v21, v22);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v9);
    return v21;
  }

  uint64_t v15 = v3 + 1;
  if (__OFADD__(v3, 1LL))
  {
    __break(1u);
  }

  else
  {
    uint64_t v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      uint64_t v17 = v0[1];
      char v18 = *(void *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        uint64_t v5 = (v18 - 1) & v18;
        unint64_t v6 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v4 = v15;
        goto LABEL_3;
      }

      unint64_t v19 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        char v18 = *(void *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          uint64_t v15 = v19;
          goto LABEL_7;
        }

        int64_t v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          char v18 = *(void *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            uint64_t v15 = v3 + 3;
            goto LABEL_7;
          }

          unint64_t v19 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            char v18 = *(void *)(v17 + 8 * v19);
            if (v18) {
              goto LABEL_10;
            }
            uint64_t v15 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              char v18 = *(void *)(v17 + 8 * v15);
              if (v18) {
                goto LABEL_7;
              }
              int64_t v4 = v16 - 1;
              uint64_t v20 = v3 + 6;
              while (v20 < v16)
              {
                char v18 = *(void *)(v17 + 8 * v20++);
                if (v18)
                {
                  uint64_t v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }

    uint64_t result = 0LL;
    v0[3] = v4;
    v0[4] = 0LL;
  }

  return result;
}

uint64_t sub_10000C5E4(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000C5EC()
{
  swift_bridgeObjectRelease(*(void *)(v0
                                      + OBJC_IVAR____TtC22localspeechrecognition14OndeviceRecord_enabledDictationLocales));
  swift_bridgeObjectRelease(*(void *)(v0
                                      + OBJC_IVAR____TtC22localspeechrecognition14OndeviceRecord_activeDictationLanguages));
  return v0;
}

uint64_t sub_10000C6B8()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10000C6DC()
{
  return type metadata accessor for OndeviceRecord(0LL);
}

uint64_t type metadata accessor for OndeviceRecord(uint64_t a1)
{
  uint64_t result = qword_10005B6E8;
  if (!qword_10005B6E8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for OndeviceRecord);
  }
  return result;
}

void sub_10000C71C(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = v4[0];
    v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[3] = &unk_10003E038;
    v4[4] = &unk_10003E050;
    v4[5] = &unk_10003E038;
    v4[6] = &unk_10003E050;
    v4[7] = &unk_10003E038;
    v4[8] = &unk_10003E050;
    void v4[9] = &unk_10003E050;
    v4[10] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[11] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[12] = &unk_10003E068;
    v4[13] = &unk_10003E080;
    v4[14] = &unk_10003E080;
    v4[15] = &unk_10003E098;
    v4[16] = &unk_10003E098;
    v4[17] = &unk_10003E098;
    v4[18] = &unk_10003E098;
    v4[19] = &unk_10003E038;
    v4[20] = &unk_10003E038;
    v4[21] = &unk_10003E038;
    v4[22] = &unk_10003E0B0;
    v4[23] = &unk_10003E0B0;
    v4[24] = &unk_10003E0B0;
    v4[25] = &unk_10003E0C8;
    v4[26] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[27] = &unk_10003E0B0;
    swift_updateClassMetadata2(a1, 256LL, 28LL, v4, a1 + 80);
  }

void sub_10000C808(uint64_t a1)
{
  if (!qword_10005C330)
  {
    uint64_t v2 = type metadata accessor for UUID(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10005C330);
    }
  }

uint64_t sub_10000C85C()
{
  id v2 = [(id)BiomeLibrary() Siri];
  sub_10000C95C();
  id v3 = [v1 ASR];
  swift_unknownObjectRelease(v1);
  id v4 = [v3 RequestMetricsRecord];
  sub_10000C95C();
  id v5 = [v1 source];

  *(void *)(v0 + 16) = v5;
  return v0;
}

uint64_t sub_10000C90C()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for OndeviceRecordHelper()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition20OndeviceRecordHelper);
}

uint64_t sub_10000C950@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1 + 8));
}

uint64_t sub_10000C95C()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t type metadata accessor for ExperimentationTriggerLogger()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition28ExperimentationTriggerLogger);
}

id sub_10000C988(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v57 = a2;
  uint64_t v55 = a4;
  uint64_t v56 = (char *)a5;
  uint64_t v8 = type metadata accessor for Locale(0LL);
  uint64_t v59 = *(void *)(v8 - 8);
  uint64_t v60 = v8;
  sub_1000070CC();
  __chkstk_darwin(v9);
  sub_1000050EC();
  uint64_t v51 = v11 - v10;
  type metadata accessor for String.LocalizationValue(0LL);
  sub_1000070CC();
  __chkstk_darwin(v12);
  sub_1000050EC();
  id v15 = (id)(v14 - v13);
  sub_100004B88(&qword_10005C230);
  sub_1000070CC();
  __chkstk_darwin(v16);
  sub_1000050EC();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = type metadata accessor for URL(0LL);
  uint64_t v54 = *(void *)(v20 - 8);
  sub_1000070CC();
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v52 = (char *)v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v22);
  char v25 = (char *)v50 - v24;
  uint64_t v26 = v5;
  sub_100005494();
  uint64_t v53 = v20;
  sub_100006CF0(v19, 1LL, 1LL, v20);
  uint64_t v27 = v58;
  sub_1000148DC(3LL, v19, 0, (uint64_t)v25);
  if (v27)
  {

    sub_10000E13C();
    swift_bridgeObjectRelease(a3);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(a1, v60);
    sub_10000E09C(v19);
  }

  else
  {
    v50[0] = v15;
    v50[1] = 0LL;
    uint64_t v57 = v26;
    uint64_t v58 = a1;
    sub_10000E09C(v19);
    sub_10000E13C();
    swift_bridgeObjectRelease(a3);
    sub_1000091B8(0LL, &qword_10005BCC8, &OBJC_CLASS____EAREuclid_ptr);
    uint64_t v29 = (uint64_t)v52;
    URL.appendingPathComponent(_:)(0x6F736A2E696E696DLL, 0xE90000000000006ELL);
    uint64_t v30 = (void *)objc_opt_self(&OBJC_CLASS___NSString);
    URL.pathComponents.getter();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    sub_10000E13C();
    id v32 = [v30 pathWithComponents:isa];

    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    uint64_t v35 = v34;

    sub_10000E150(v29);
    id v36 = sub_10000CD84(v33, v35, v55, (uint64_t)v56);
    if (v36)
    {
      id v37 = v36;
      sub_10000E150((uint64_t)v25);
      id v38 = v57;
      *(void *)&v57[OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance] = v37;

      uint64_t v39 = (objc_class *)type metadata accessor for EAREuclid();
      v61.receiver = v38;
      v61.super_class = v39;
      id v15 = objc_msgSendSuper2(&v61, "init");
      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
      return v15;
    }

    uint64_t v56 = v25;
    uint64_t v26 = v57;

    uint64_t v41 = v50[0];
    String.LocalizationValue.init(stringLiteral:)(0xD00000000000002CLL, 0x80000001000441A0LL);
    uint64_t v42 = v58;
    uint64_t v43 = v59;
    uint64_t v44 = v60;
    if (qword_10005A288 != -1) {
      swift_once(&qword_10005A288, sub_100014C90);
    }
    uint64_t v45 = qword_10005C8F8;
    id v46 = (id)qword_10005C8F8;
    uint64_t v47 = v51;
    static Locale.current.getter(v46);
    uint64_t v48 = String.init(localized:table:bundle:locale:comment:)(v41, 0LL, 0LL, v45, v47, 0LL, 0LL, 256LL);
    id v15 = (id)related decl 'e' for SFSpeechErrorCode.init(_:description:)(1LL, v48, v49);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    sub_10000E150((uint64_t)v56);
  }

  uint64_t v28 = type metadata accessor for EAREuclid();
  swift_deallocPartialClassInstance(v26, v28, 16LL, 7LL);
  return v15;
}

id sub_10000CD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v10 = [v8 initWithConfiguration:v9 euclidEncoderType:a3 initFlag:a4];

  return v10;
}

void sub_10000CE10(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, void (**a5)(void, void))
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_100004C5C(v8, (uint64_t)qword_10005C710);
  NSString v9 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc(22LL, -1LL);
    uint64_t v12 = a5;
    uint64_t v13 = (void *)swift_slowAlloc(32LL, -1LL);
    id v37 = v13;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v36 = sub_100026B8C(0xD000000000000030LL, 0x80000001000442F0LL, (uint64_t *)&v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v11 + 4);
    *(_WORD *)(v11 + 12) = 2048;
    uint64_t v36 = a3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v11 + 14);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "EAREuclid.%s with %ld requested neighbor(s)",  (uint8_t *)v11,  0x16u);
    swift_arrayDestroy(v13, 1LL);
    uint64_t v14 = v13;
    a5 = v12;
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {
  }

  id v15 = *(void **)&a4[OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance];
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v15 findNearestNeighbors:v16 numberOfNeighbors:a3];

  uint64_t v18 = sub_1000091B8(0LL, &qword_10005BCD8, &OBJC_CLASS____EAREuclidNeighbor_ptr);
  uint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, v18);

  uint64_t v20 = swift_bridgeObjectRetain_n(v19, 2LL);
  uint64_t v21 = (void **)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  unint64_t v23 = (unint64_t)v19 >> 62;
  if (!os_log_type_enabled((os_log_t)v21, v22))
  {

    swift_bridgeObjectRelease_n(v19, 2LL);
    goto LABEL_11;
  }

  uint64_t v24 = swift_slowAlloc(22LL, -1LL);
  a4 = (char *)swift_slowAlloc(32LL, -1LL);
  id v37 = a4;
  *(_DWORD *)uint64_t v24 = 136315394;
  uint64_t v36 = sub_100026B8C(0xD000000000000030LL, 0x80000001000442F0LL, (uint64_t *)&v37);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v24 + 4);
  *(_WORD *)(v24 + 12) = 2048;
  if (v23) {
    goto LABEL_27;
  }
  uint64_t v25 = *(void *)((v19 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease(v19);
    uint64_t v36 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v24 + 14);
    swift_bridgeObjectRelease(v19);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  v22,  "EAREuclid.%s replying with %ld neighbor(s)",  (uint8_t *)v24,  0x16u);
    swift_arrayDestroy(a4, 1LL);
    swift_slowDealloc(a4, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

LABEL_11:
    if (v23)
    {
      if (v19 < 0) {
        uint64_t v33 = v19;
      }
      else {
        uint64_t v33 = v19 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v19);
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v33);
      swift_bridgeObjectRelease(v19);
      if (!v24)
      {
LABEL_24:
        swift_bridgeObjectRelease(v19);
        id v32 = &_swiftEmptyArrayStorage;
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v24 = *(void *)((v19 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (!v24) {
        goto LABEL_24;
      }
    }

    id v37 = &_swiftEmptyArrayStorage;
    uint64_t v21 = (void **)&v37;
    specialized ContiguousArray.reserveCapacity(_:)(v24);
    if ((v24 & 0x8000000000000000LL) == 0) {
      break;
    }
    __break(1u);
LABEL_27:
    if (v19 < 0) {
      uint64_t v35 = v19;
    }
    else {
      uint64_t v35 = v19 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v19);
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter(v35);
    swift_bridgeObjectRelease(v19);
  }

  uint64_t v26 = 0LL;
  do
  {
    if ((v19 & 0xC000000000000001LL) != 0) {
      id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, v19);
    }
    else {
      id v27 = *(id *)(v19 + 8 * v26 + 32);
    }
    uint64_t v28 = v27;
    ++v26;
    id v29 = [objc_allocWithZone(EAREuclidNeighbor) initWithEuclidNeighbor:v27];

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v30 = v37[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v30);
    uint64_t v31 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v29);
    specialized ContiguousArray._endMutation()(v31);
  }

  while (v24 != v26);
  id v32 = v37;
  swift_bridgeObjectRelease(v19);
LABEL_25:
  sub_1000091B8(0LL, (unint64_t *)&unk_10005BCE0, &OBJC_CLASS___EAREuclidNeighbor_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a5)[2](a5, isa);
  swift_bridgeObjectRelease(v32);

  _Block_release(a5);
}

void sub_10000D3B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (**a6)(void, void))
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = sub_100004C5C(v7, (uint64_t)qword_10005C710);
  NSString v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v25 = sub_100026B8C(0xD000000000000026LL, 0x80000001000442C0LL, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v11 + 4);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "EAREuclid.%s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  uint64_t v13 = *(void **)(a5 + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  NSString v14 = String._bridgeToObjectiveC()();
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v13 distanceBetweenSource:v14 target:v15];

  id v17 = v16;
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc(22LL, -1LL);
    uint64_t v21 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v25 = sub_100026B8C(0xD000000000000026LL, 0x80000001000442C0LL, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v20 + 4);
    *(_WORD *)(v20 + 12) = 2112;
    uint64_t v25 = (uint64_t)v17;
    id v23 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v20 + 14);
    *uint64_t v21 = v17;

    _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "EAREuclid.%s replying with distance of %@",  (uint8_t *)v20,  0x16u);
    sub_100004B88(&qword_10005B5A0);
    swift_arrayDestroy(v21, 1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_arrayDestroy(v22, 1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {
  }

  ((void (**)(void, id))a6)[2](a6, v17);

  _Block_release(a6);
}

void sub_10000D818(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v6 = [v4 computeEmbeddings:isa];

  uint64_t v7 = sub_100004B88(&qword_10005BCD0);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

  Class v9 = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a3)[2](a3, v9);
  swift_bridgeObjectRelease(v8);

  _Block_release(a3);
}

void sub_10000D974(uint64_t a1, void (**a2)(void, void))
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_100004C5C(v2, (uint64_t)qword_10005C710);
  uint64_t v4 = (void *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (sub_10000E110(v5))
  {
    id v6 = (_DWORD *)sub_100007000(12LL);
    uint64_t v7 = sub_100007000(32LL);
    uint64_t v29 = v7;
    *id v6 = 136315138;
    uint64_t v28 = sub_10000E144(v7, v8, v9, v10, v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v6 + 1);
    sub_10000E0F0((void *)&_mh_execute_header, v12, v13, "EAREuclid.%s");
    sub_100007010(v7);
    sub_100006FF4(v7);
    sub_100006FF4((uint64_t)v6);
  }

  id v14 = sub_10000E158(OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  NSString v15 = (void *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (sub_10000E120(v16))
  {
    uint64_t v17 = sub_100007000(22LL);
    uint64_t v18 = (void *)sub_100007000(8LL);
    uint64_t v19 = sub_100007000(32LL);
    uint64_t v29 = v19;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v28 = sub_10000E144(v19, v20, v21, v22, v23);
    sub_10000E104((uint64_t)&v28);
    *(_WORD *)(v17 + 12) = 2112;
    uint64_t v28 = (uint64_t)v14;
    id v24 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v17 + 14);
    void *v18 = v14;

    sub_10000E0DC((void *)&_mh_execute_header, v25, v26, "EAREuclid.%s replying with %@");
    sub_100004B88(&qword_10005B5A0);
    sub_100007010((uint64_t)v18);
    sub_100006FF4((uint64_t)v18);
    sub_100007010(v19);
    sub_100006FF4(v19);
    sub_100006FF4(v17);
  }

  else
  {
  }

  ((void (**)(void, id))a2)[2](a2, v14);

  _Block_release(a2);
}

void sub_10000DC30(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  unint64_t v9 = _Block_copy(aBlock);
  _Block_copy(v9);
  id v10 = a1;
  a7();
  _Block_release(v9);
}

void sub_10000DD30(uint64_t a1, void (**a2)(void, void), uint64_t a3, uint64_t a4)
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_100004C5C(v5, (uint64_t)qword_10005C710);
  uint64_t v7 = (void *)Logger.logObject.getter(v6);
  os_log_type_t v9 = static os_log_type_t.debug.getter(v7, v8);
  if (sub_10000E110(v9))
  {
    id v10 = (_DWORD *)sub_100007000(12LL);
    uint64_t v11 = sub_100007000(32LL);
    v35[0] = v11;
    *id v10 = 136315138;
    uint64_t v36 = sub_10000E130(v11, v12, v13, a3, a4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v10 + 1);
    sub_10000E0F0((void *)&_mh_execute_header, v14, v15, "EAREuclid.%s");
    sub_100007010(v11);
    sub_100006FF4(v11);
    sub_100006FF4((uint64_t)v10);
  }

  id v16 = sub_10000E158(OBJC_IVAR____TtC22localspeechrecognition9EAREuclid_euclidInstance);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  unint64_t v19 = v18;

  uint64_t v36 = v17;
  unint64_t v37 = v19;
  uint64_t v20 = swift_bridgeObjectRetain_n(v19, 2LL);
  unint64_t v21 = (void *)Logger.logObject.getter(v20);
  os_log_type_t v23 = static os_log_type_t.debug.getter(v21, v22);
  if (sub_10000E120(v23))
  {
    uint64_t v24 = sub_100007000(22LL);
    uint64_t v25 = sub_100007000(64LL);
    v35[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v34 = sub_10000E130(v25, v26, v27);
    sub_10000E104((uint64_t)&v34);
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain(v19);
    uint64_t v34 = sub_100026B8C(v17, v19, v35);
    sub_10000E104((uint64_t)&v34);
    swift_bridgeObjectRelease_n(v19, 3LL);
    sub_10000E0DC((void *)&_mh_execute_header, v28, v29, "EAREuclid.%s replying with %s");
    swift_arrayDestroy(v25, 2LL);
    sub_100006FF4(v25);
    sub_100006FF4(v24);
  }

  else
  {

    swift_bridgeObjectRelease_n(v19, 2LL);
  }

  swift_beginAccess(&v36, v35, 0LL, 0LL);
  unint64_t v30 = v37;
  NSString v31 = String._bridgeToObjectiveC()();
  ((void (**)(void, NSString))a2)[2](a2, v31);
  swift_bridgeObjectRelease(v30);

  _Block_release(a2);
}

void sub_10000E004()
{
}

id sub_10000E03C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EAREuclid();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EAREuclid()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition9EAREuclid);
}

uint64_t sub_10000E09C(uint64_t a1)
{
  uint64_t v2 = sub_100004B88(&qword_10005C230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_10000E0DC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

void sub_10000E0F0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_10000E104(uint64_t a1)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, v2, v1);
}

BOOL sub_10000E110(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL sub_10000E120(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000E130(uint64_t a1, unint64_t a2, uint64_t a3, ...)
{
  return sub_100026B8C(a1, a2, (uint64_t *)va);
}

uint64_t sub_10000E13C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000E144(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return sub_100026B8C(a2, a3, (uint64_t *)va);
}

uint64_t sub_10000E150(uint64_t a1)
{
  return v2(a1, v1);
}

id sub_10000E158@<X0>(uint64_t a1@<X8>)
{
  return [*(id *)(v2 + a1) *v1];
}

uint64_t sub_10000E164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100004C10(a1, 1LL, v6) == 1)
  {
    sub_100005658(a1, &qword_10005BE48);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9, v12);
    uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v15 = v14;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v15 = 0LL;
  }

  uint64_t v16 = swift_allocObject(&unk_100051770, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v15 | v13)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v13;
    v19[3] = v15;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v7, v17, (char *)&type metadata for () + 8, &unk_10005BE68, v16);
}

void sub_10000E2A8(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v43 = a6;
  sub_100004B88(&qword_10005BE48);
  uint64_t v13 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v13);
  unint64_t v18 = (char *)&v42 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v42 - v19;
  uint64_t v44 = a7;
  if (!a4)
  {
    uint64_t v25 = sub_1000106A8();
    sub_1000106E8((uint64_t)v18, 1LL, v26, v25);
    id v21 = 0LL;
    goto LABEL_6;
  }

  id v21 = a4;
  unint64_t v22 = (unint64_t)[v21 priority];
  if ((v22 & 0x8000000000000000LL) != 0)
  {
    sub_100010594();
    uint64_t v40 = "Negative value is not representable";
    uint64_t v41 = 35LL;
  }

  else
  {
    if (v22 < 0x100)
    {
      TaskPriority.init(rawValue:)();

      uint64_t v23 = sub_1000106A8();
      sub_1000106E8((uint64_t)v18, 0LL, v24, v23);
LABEL_6:
      sub_1000101D8((uint64_t)v18, (uint64_t)v20);
      sub_100010504((uint64_t)v20, (uint64_t)v15, &qword_10005BE48);
      uint64_t v27 = (void *)sub_100005130((uint64_t)&unk_100051798, 96LL);
      v27[2] = 0LL;
      v27[3] = 0LL;
      v27[4] = a1;
      v27[5] = a2;
      v27[6] = a3;
      v27[7] = a4;
      v27[8] = a5;
      uint64_t v28 = (uint64_t)v15;
      uint64_t v29 = a5;
      uint64_t v31 = v44;
      unint64_t v30 = v45;
      uint64_t v32 = v43;
      v27[9] = v45;
      v27[10] = v32;
      v27[11] = v31;
      id v33 = v21;
      id v34 = a1;
      id v35 = a2;
      id v36 = a3;
      swift_bridgeObjectRetain(v29);
      id v37 = v30;
      swift_retain(v31);
      uint64_t v38 = sub_10000E164(v28, (uint64_t)&unk_10005BE88, (uint64_t)v27);
      swift_release(v38);
      sub_100005658((uint64_t)v20, &qword_10005BE48);
      sub_1000050C0();
      return;
    }

    sub_100010594();
    uint64_t v40 = "Not enough bits to represent the passed value";
    uint64_t v41 = 45LL;
  }

  sub_1000106F0((uint64_t)"Fatal error", 11LL, 2LL, (uint64_t)v40, v41, v39, (uint64_t)"Swift/Integers.swift");
  __break(1u);
}

uint64_t sub_10000E4E0( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  *(void *)(v8 + 56) = v22;
  *(_OWORD *)(v8 + 40) = v21;
  objc_allocWithZone((Class)type metadata accessor for EARSpeechRecognizer(0LL));
  uint64_t v14 = dword_10005C22C;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  swift_bridgeObjectRetain(a8);
  uint64_t v19 = (void *)swift_task_alloc(v14);
  *(void *)(v8 + 64) = v19;
  *uint64_t v19 = v8;
  v19[1] = sub_10000E5B0;
  return sub_100015878((uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)a7, a8);
}

uint64_t sub_10000E5B0()
{
  if (!v1) {
    *(void *)(v2 + 80) = v0;
  }
  return sub_1000105F8();
}

uint64_t sub_10000E5F8()
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v2 = sub_100010714();
  sub_100004C5C(v2, (uint64_t)qword_10005C710);
  sub_1000106E0();
  uint64_t v3 = sub_1000106E0();
  uint64_t v4 = (void *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  BOOL v6 = sub_100009290(v5);
  uint64_t v7 = *(void *)(v1 + 72);
  if (v6)
  {
    sub_10001063C();
    uint64_t v8 = (void *)sub_100010674();
    sub_100010660(5.7779e-34);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError(v7);
    sub_100010608(v9, v10, v11, v12, v13, v14, v15, v16, v25, v26);
    *uint64_t v8 = v0;
    sub_1000105CC();
    sub_1000105CC();
    sub_100010694((void *)&_mh_execute_header, v17, v18, "Could not create EARSpeechRecognizer local actor: %@");
    sub_100004B88(&qword_10005B5A0);
    sub_1000106D0();
    sub_100006FF4((uint64_t)v8);
    sub_100006FF4(v1 + 24);
  }

  else
  {
    sub_1000105CC();
    sub_1000105CC();
  }

  sub_100010720();
  sub_100004B88((uint64_t *)&unk_10005BE70);
  sub_100010708();
  int v20 = sub_100010624(v19);
  __int128 v21 = sub_1000106C0(v20);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(char **)(v1 + 72);
  }

  else
  {
    swift_errorRetain(*(void *)(v1 + 72));
    uint64_t v23 = *(char **)(v1 + 72);
    uint64_t v22 = v23;
  }

  sub_1000106B0();
  swift_errorRelease(v23);
  swift_errorRelease(v22);
  return sub_100010578(*(uint64_t (**)(void))(v1 + 8));
}

void sub_10000E84C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, void (**a9)(void, id, void))
{
  v27[1] = a8;
  uint64_t v28 = a9;
  uint64_t v16 = sub_100004B88(&qword_10005C230);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for Locale(0LL);
  __chkstk_darwin(v19);
  __int128 v21 = (char *)v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v22 + 16))(v21, a1);
  sub_100010504(a6, (uint64_t)v18, &qword_10005C230);
  objc_allocWithZone((Class)type metadata accessor for LSRAssets(0LL));
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  id v23 = (id)sub_100010740((uint64_t)v21, a2, a3, a4, a5, (uint64_t)v18, a7);
  id v24 = sub_10000F758((uint64_t)v23);

  id v25 = [v24 endpoint];
  uint64_t v26 = v28;
  v28[2](v28, v25, 0LL);

  _Block_release(v26);
}

void sub_10000EDAC( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (**a7)(void, void, void))
{
  uint64_t v13 = type metadata accessor for Locale(0LL);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v16 + 16))(v15, a1);
  objc_allocWithZone((Class)type metadata accessor for EAREuclid());
  swift_bridgeObjectRetain(a3);
  id v17 = sub_10000C988((uint64_t)v15, a2, a3, a4, a5);
  id v18 = sub_10000F758((uint64_t)v17);

  id v19 = [v18 endpoint];
  ((void (**)(void, id, void))a7)[2](a7, v19, 0LL);

  _Block_release(a7);
}

void sub_10000F1F0(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_100004B88(&qword_10005BE48);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v12);
  id v17 = (char *)&v33 - v16;
  __chkstk_darwin(v15);
  id v19 = (char *)&v33 - v18;
  if (!a3)
  {
    uint64_t v23 = sub_1000106A8();
    uint64_t v24 = 1LL;
    goto LABEL_6;
  }

  id v20 = a3;
  unint64_t v21 = (unint64_t)[v20 priority];
  if ((v21 & 0x8000000000000000LL) != 0)
  {
    sub_100010594();
    uint64_t v31 = "Negative value is not representable";
    uint64_t v32 = 35LL;
  }

  else
  {
    if (v21 < 0x100)
    {
      TaskPriority.init(rawValue:)();

      uint64_t v23 = sub_1000106A8();
      uint64_t v24 = 0LL;
LABEL_6:
      sub_1000106E8((uint64_t)v17, v24, v22, v23);
      sub_1000101D8((uint64_t)v17, (uint64_t)v19);
      sub_100010504((uint64_t)v19, (uint64_t)v14, &qword_10005BE48);
      id v25 = (void *)sub_100005130((uint64_t)&unk_100051748, 72LL);
      v25[2] = 0LL;
      v25[3] = 0LL;
      void v25[4] = a1;
      v25[5] = a2;
      v25[6] = v5;
      v25[7] = a4;
      v25[8] = a5;
      id v26 = a1;
      id v27 = a2;
      id v28 = v5;
      swift_retain(a5);
      uint64_t v29 = sub_10000E164((uint64_t)v14, (uint64_t)&unk_10005BE58, (uint64_t)v25);
      swift_release(v29);
      sub_100005658((uint64_t)v19, &qword_10005BE48);
      sub_1000050C0();
      return;
    }

    sub_100010594();
    uint64_t v31 = "Not enough bits to represent the passed value";
    uint64_t v32 = 45LL;
  }

  sub_1000106F0((uint64_t)"Fatal error", 11LL, 2LL, (uint64_t)v31, v32, v30, (uint64_t)"Swift/Integers.swift");
  __break(1u);
}

uint64_t sub_10000F3E0( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[5] = a6;
  objc_allocWithZone((Class)type metadata accessor for EARLanguageDetector());
  uint64_t v11 = dword_10005B284;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void *)swift_task_alloc(v11);
  v8[8] = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_10000F46C;
  return sub_100007124((uint64_t)v12, (uint64_t)v13);
}

uint64_t sub_10000F46C()
{
  if (!v1) {
    *(void *)(v2 + 80) = v0;
  }
  return sub_1000105F8();
}

uint64_t sub_10000F4B4()
{
  uint64_t v1 = *(void (**)(void))(v0 + 48);
  id v2 = *(id *)(v0 + 80);
  id v3 = sub_10000F758((uint64_t)v2);

  id v4 = [v3 endpoint];
  v1();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F540()
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v2 = sub_100010714();
  sub_100004C5C(v2, (uint64_t)qword_10005C710);
  sub_1000106E0();
  uint64_t v3 = sub_1000106E0();
  id v4 = (void *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  BOOL v6 = sub_100009290(v5);
  uint64_t v7 = *(void *)(v1 + 72);
  if (v6)
  {
    sub_10001063C();
    uint64_t v8 = (void *)sub_100010674();
    sub_100010660(5.7779e-34);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError(v7);
    sub_100010608(v9, v10, v11, v12, v13, v14, v15, v16, v25, v26);
    *uint64_t v8 = v0;
    sub_1000105CC();
    sub_1000105CC();
    sub_100010694((void *)&_mh_execute_header, v17, v18, "Could not create EARLanguageDetector local actor: %@");
    sub_100004B88(&qword_10005B5A0);
    sub_1000106D0();
    sub_100006FF4((uint64_t)v8);
    sub_100006FF4(v1 + 24);
  }

  else
  {
    sub_1000105CC();
    sub_1000105CC();
  }

  sub_100010720();
  sub_100004B88((uint64_t *)&unk_10005BE70);
  sub_100010708();
  int v20 = sub_100010624(v19);
  unint64_t v21 = sub_1000106C0(v20);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(char **)(v1 + 72);
  }

  else
  {
    swift_errorRetain(*(void *)(v1 + 72));
    uint64_t v23 = *(char **)(v1 + 72);
    uint64_t v22 = v23;
  }

  sub_1000106B0();
  swift_errorRelease(v23);
  swift_errorRelease(v22);
  return sub_100010578(*(uint64_t (**)(void))(v1 + 8));
}

id sub_10000F758(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = [(id)objc_opt_self(NSXPCListener) anonymousListener];
  [v4 setDelegate:v2];
  [v4 activate];
  uint64_t v5 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock;
  BOOL v6 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock);
  swift_retain(v6);
  os_unfair_lock_lock(v6 + 4);
  swift_release(v6);
  sub_1000106FC(v2 + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listeners, (uint64_t)v12);
  id v7 = v4;
  uint64_t v9 = swift_unknownObjectRetain(a1, v8);
  sub_10001F430(v9, v7);
  swift_endAccess(v12);

  uint64_t v10 = *(os_unfair_lock_s **)(v2 + v5);
  swift_retain(v10);
  os_unfair_lock_unlock(v10 + 4);
  swift_release(v10);
  return v7;
}

uint64_t sub_10000F860(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock;
  BOOL v6 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock);
  swift_retain(v6);
  os_unfair_lock_lock(v6 + 4);
  swift_release(v6);
  sub_1000106FC(v3 + OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listeners, (uint64_t)&v20);
  uint64_t v7 = sub_10001EF40();
  swift_endAccess(&v20);
  uint64_t v8 = *(os_unfair_lock_s **)(v3 + v5);
  swift_retain(v8);
  os_unfair_lock_unlock(v8 + 4);
  swift_release(v8);
  if (!v7) {
    return v7 != 0;
  }
  uint64_t v9 = type metadata accessor for EARSpeechRecognizer(0LL);
  uint64_t v10 = swift_unknownObjectRetain_n(v7, 2LL);
  if (swift_dynamicCastClass(v10, v9))
  {
    uint64_t v11 = &protocolRef__SFXPCEARSpeechRecognizer;
LABEL_8:
    swift_unknownObjectRelease(v7);
LABEL_9:
    id v14 = [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:*v11];
    [a2 setExportedInterface:v14];
    [a2 setExportedObject:v7];
    [a2 activate];
    swift_unknownObjectRelease_n(v7, 2LL);

    return v7 != 0;
  }

  uint64_t v12 = type metadata accessor for LSRAssets(0LL);
  if (sub_100010688(v12))
  {
    uint64_t v11 = &protocolRef__SFXPCLSRAssets;
    goto LABEL_8;
  }

  uint64_t v13 = type metadata accessor for EAREuclid();
  if (sub_100010688(v13))
  {
    uint64_t v11 = &protocolRef__SFXPCEAREuclid;
    goto LABEL_8;
  }

  uint64_t v16 = type metadata accessor for EARLanguageDetector();
  uint64_t v17 = sub_100010688(v16);
  swift_unknownObjectRelease(v7);
  if (v17)
  {
    uint64_t v11 = &protocolRef__SFXPCEARLanguageDetector;
    goto LABEL_9;
  }

  uint64_t v20 = 0LL;
  unint64_t v21 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(23LL);
  v18._object = (void *)0x8000000100044430LL;
  v18._countAndFlagsBits = 0xD000000000000015LL;
  String.append(_:)(v18);
  uint64_t v19 = v7;
  _print_unlocked<A, B>(_:_:)( &v19,  &v20,  (char *)&type metadata for Swift.AnyObject + 8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v20,  v21,  "localspeechrecognition/LSREARInterface.swift",  44LL,  2LL,  138LL,  0);
  __break(1u);
  return result;
}

void sub_10000FB18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (**a7)(void, void, void))
{
  uint64_t v8 = type metadata accessor for Locale(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = type metadata accessor for String.LocalizationValue(0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  id v14 = (void *)objc_opt_self(&OBJC_CLASS___LSRConnection);
  NSString v15 = String._bridgeToObjectiveC()();
  NSString v16 = String._bridgeToObjectiveC()();
  id v39 = 0LL;
  id v17 =  [v14 modelRootWithLanguage:v15 assetType:3 clientID:v16 modelOverrideURL:0 error:&v39];

  if (v17)
  {
    id v18 = v39;
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = [v14 _jitProfileWithLanguage:v19 modelRoot:v17];

    if (v20)
    {
      id v21 = v20;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      id v23 = [v21 jitProfileFromContextualStrings:isa];

      uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v23);
      unint64_t v26 = v25;

      v27.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
    }

    else
    {
      String.LocalizationValue.init(stringLiteral:)(0xD000000000000013LL, 0x80000001000444D0LL);
      if (qword_10005A288 != -1) {
        swift_once(&qword_10005A288, sub_100014C90);
      }
      uint64_t v28 = qword_10005C8F8;
      static Locale.current.getter((id)qword_10005C8F8);
      uint64_t v29 = String.init(localized:table:bundle:locale:comment:)(v13, 0LL, 0LL, v28, v10, 0LL, 0LL, 256LL);
      uint64_t v31 = v30;
      uint64_t v32 = static SFSpeechErrorCode.invalidJitProfile.getter();
      uint64_t v33 = (void *)related decl 'e' for SFSpeechErrorCode.init(_:description:)(v32, v29, v31);
      id v34 = (void *)_convertErrorToNSError(_:)(v33);
      ((void (**)(void, void, void *))a7)[2](a7, 0LL, v34);

      v27.super.Class isa = 0LL;
      uint64_t v24 = 0LL;
      unint64_t v26 = 0xF000000000000000LL;
    }

    ((void (**)(void, Class, void))a7)[2](a7, v27.super.isa, 0LL);

    sub_100008FD4(v24, v26);
    _Block_release(a7);
  }

  else
  {
    id v35 = v39;
    _Block_release(a7);
    id v36 = v35;
    uint64_t v37 = _convertNSErrorToError(_:)(v35);

    swift_willThrow();
    swift_unexpectedError(v37, "localspeechrecognition/LSREARInterface.swift", 44LL, 1LL, 147LL);
    __break(1u);
  }

void sub_10000FF40(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = [(id)objc_opt_self(LSRConnection) processStartTimeOnce];
  ((void (**)(void, id, void))a2)[2](a2, v3, 0LL);

  _Block_release(a2);
}

id sub_10000FFEC()
{
  uint64_t v1 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listeners;
  unint64_t v2 = sub_10001049C();
  unint64_t v3 = sub_100008F14();
  id v4 = v0;
  *(void *)&v0[v1] = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  v2,  (char *)&type metadata for Swift.AnyObject + 8,  v3);
  uint64_t v5 = OBJC_IVAR____TtC22localspeechrecognition12EARInterface_listenerLock;
  uint64_t v6 = sub_100004B88(&qword_10005BEA0);
  uint64_t v7 = sub_100005130(v6, 20LL);
  *(_DWORD *)(v7 + 16) = 0;
  *(void *)&v4[v5] = v7;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for EARInterface();
  return objc_msgSendSuper2(&v9, "init");
}

id sub_1000100C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EARInterface();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EARInterface()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition12EARInterface);
}

uint64_t sub_10001014C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_1000101B0;
  return v6(a1);
}

uint64_t sub_1000101B0()
{
  return sub_100010654(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000101D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005BE48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010220()
{
  swift_release(*(void *)(v0 + 64));
  return swift_deallocObject(v0, 72LL, 7LL);
}

uint64_t sub_100010264()
{
  uint64_t v2 = *(void *)(v0 + 64);
  unint64_t v3 = (void *)swift_task_alloc(dword_10005BE54);
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_1000102D0;
  uint64_t v4 = sub_1000105D4();
  return sub_10000F3E0(v4, v5, v6, v7, v8, v9, v10, v2);
}

uint64_t sub_1000102D0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000102FC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100010320(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10005BE64);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100010390;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10005BE60 + dword_10005BE60))(a1, v4);
}

uint64_t sub_100010390()
{
  return sub_100010654(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000103B4()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  swift_release(*(void *)(v0 + 88));
  return swift_deallocObject(v0, 96LL, 7LL);
}

uint64_t sub_100010410()
{
  uint64_t v2 = *(void *)(v0 + 64);
  unint64_t v3 = (void *)swift_task_alloc(dword_10005BE84);
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_100010550;
  uint64_t v4 = sub_1000105D4();
  return sub_10000E4E0(v4, v5, v6, v7, v8, v9, v10, v2);
}

unint64_t sub_10001049C()
{
  unint64_t result = qword_10005BE90;
  if (!qword_10005BE90)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSXPCListener);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005BE90);
  }

  return result;
}

uint64_t sub_1000104D8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000104FC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100010504(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004B88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100010558()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100010578(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

uint64_t sub_1000105A8()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 64);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 72) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_1000105CC()
{
  return swift_errorRelease(v0);
}

uint64_t sub_1000105D4()
{
  return v0;
}

uint64_t sub_1000105F8()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100010608( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v11 + 32) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a10, v11 + 40, v10);
}

uint64_t sub_100010624(uint64_t a1)
{
  return swift_dynamicCast(v2, v3, v1, a1, 6LL);
}

uint64_t sub_10001063C()
{
  return swift_slowAlloc(12LL, -1LL);
}

uint64_t sub_100010654(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100010660(float a1)
{
  *uint64_t v1 = a1;
  return swift_errorRetain(v2);
}

uint64_t sub_100010674()
{
  return swift_slowAlloc(8LL, -1LL);
}

uint64_t sub_100010688(uint64_t a1)
{
  return swift_dynamicCastClass(v1, a1);
}

void sub_100010694(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_1000106A8()
{
  return type metadata accessor for TaskPriority(0LL);
}

uint64_t sub_1000106B0()
{
  return (*(uint64_t (**)(void, uint64_t))(v1 + 48))(0LL, v0);
}

char *sub_1000106C0(int a1)
{
  if (a1) {
    return sub_100014B40(*(char **)(v1 + 24));
  }
  else {
    return sub_100014B40(0LL);
  }
}

uint64_t sub_1000106D0()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_1000106E0()
{
  return swift_errorRetain(v0);
}

uint64_t sub_1000106E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006CF0(a1, a2, 1LL, a4);
}

uint64_t sub_1000106F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 20LL);
}

uint64_t sub_1000106FC(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 33LL, 0LL);
}

void sub_100010708()
{
}

uint64_t sub_100010714()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_100010720()
{
  uint64_t v1 = *(void *)(v0 + 72);
  *(void *)(v0 + 16) = v1;
  return swift_errorRetain(v1);
}

  ;
}

uint64_t sub_100010740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v8 = v7;
  LODWORD(v121) = a7;
  uint64_t v115 = type metadata accessor for URL(0LL);
  uint64_t v114 = *(void *)(v115 - 8);
  uint64_t v15 = __chkstk_darwin(v115);
  uint64_t v119 = (uint64_t)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  id v18 = (char *)&v103 - v17;
  id v113 = (id)OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData] = 1LL;
  uint64_t v112 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper] = 1LL;
  v120 = v8;
  uint64_t v118 = a1;
  sub_100005494();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v111 = a2;
  uint64_t v116 = a3;
  NSString v23 = String._bridgeToObjectiveC()();
  uint64_t v24 = SFEntitledAssetTypeForTaskName();

  sub_1000091B8(0LL, &qword_10005BEF8, &OBJC_CLASS___SFEntitledAssetConfig_ptr);
  swift_bridgeObjectRetain(v22);
  id v123 = sub_1000112A4(v20, v22, v24);
  v117 = v18;
  uint64_t v25 = v122;
  sub_1000148DC(v24, a6, v121, (uint64_t)v18);
  if (v25)
  {
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(a5);
    swift_bridgeObjectRelease(v116);

    sub_1000140A8(a6, &qword_10005C230);
    type metadata accessor for Locale(0LL);
    sub_10001420C();
    v26(v118);
    sub_100014284((uint64_t)&v131);
    sub_100014284((uint64_t)v130);
    NSData v27 = v120;

    uint64_t v28 = type metadata accessor for LSRAssets(0LL);
    swift_deallocPartialClassInstance( v27,  v28,  *(unsigned int *)((swift_isaMask & *v27) + 0x30LL),  *(unsigned __int16 *)((swift_isaMask & *v27) + 0x34LL));
    return (uint64_t)v27;
  }

  uint64_t v108 = v20;
  uint64_t v109 = v22;
  uint64_t v121 = v24;
  uint64_t v122 = a4;
  uint64_t v107 = a5;
  uint64_t v112 = 0LL;
  uint64_t v110 = a6;
  uint64_t v29 = v117;
  URL.appendingPathComponent(_:)(0x6F736A2E696E696DLL, 0xE90000000000006ELL);
  sub_1000091B8(0LL, (unint64_t *)&unk_10005B2C0, &OBJC_CLASS____EARSpeechModelInfo_ptr);
  uint64_t v30 = (void *)objc_opt_self(&OBJC_CLASS___NSString);
  uint64_t v31 = URL.pathComponents.getter();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v31);
  id v33 = [v30 pathWithComponents:isa];

  static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
  sub_100015094();
  id v113 = v34;
  id v35 = [(id)objc_opt_self(SFEntitledAssetManager) sharedInstance];
  id v36 = v123;
  id v37 = objc_msgSend(v35, "modelQualityTypeStatusStringWithConfig:", v123, v35);
  uint64_t v38 = (uint64_t)v29;
  if (v37)
  {
    id v39 = v37;
    uint64_t v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
    unint64_t v105 = v40;
  }

  else
  {
    uint64_t v106 = 0LL;
    unint64_t v105 = 0xE000000000000000LL;
  }

  uint64_t v41 = v118;
  uint64_t v42 = v115;
  uint64_t v43 = v114;
  uint64_t v44 = v107;
  uint64_t v45 = v122;
  int64_t v46 = (int64_t)v120;
  uint64_t v47 = &v120[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_locale];
  uint64_t v48 = type metadata accessor for Locale(0LL);
  uint64_t v104 = *(void *)(v48 - 8);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v104 + 16);
  uint64_t v107 = v48;
  v49(v47, v41);
  uint64_t v50 = (uint64_t *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language);
  uint64_t v51 = v109;
  *uint64_t v50 = v108;
  v50[1] = v51;
  uint64_t v52 = (uint64_t *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_clientID);
  *uint64_t v52 = v45;
  v52[1] = v44;
  sub_100010504(v110, v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelOverridePath, &qword_10005C230);
  uint64_t v53 = *(void (**)(int64_t, uint64_t, uint64_t))(v43 + 16);
  uint64_t v54 = v119;
  v53(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_configurationFile, v119, v42);
  *(void *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_assetType) = v121;
  uint64_t v55 = v38;
  v53(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot, v38, v42);
  id v56 = v113;
  id v57 = [v113 version];
  uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
  uint64_t v60 = v59;

  objc_super v61 = (uint64_t *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion);
  *objc_super v61 = v58;
  v61[1] = v60;
  uint64_t v62 = (uint64_t *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType);
  unint64_t v63 = v105;
  *uint64_t v62 = v106;
  v62[1] = v63;
  id v64 = [v56 tasks];
  uint64_t v65 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v64,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

  uint64_t v66 = *(void *)(v65 + 16);
  if (v66)
  {
    v132 = _swiftEmptyArrayStorage;
    sub_10001EB60(0, v66, 0);
    sub_100022DDC(v65);
    sub_1000141CC();
    uint64_t v121 = v65;
    while ((v46 & 0x8000000000000000LL) == 0)
    {
      sub_100014290();
      if (v67 == v68) {
        break;
      }
      sub_1000141B0();
      if ((v69 & 1) == 0) {
        goto LABEL_44;
      }
      if (*(_DWORD *)(v65 + 36) != (_DWORD)v56) {
        goto LABEL_45;
      }
      sub_10001419C();
      sub_100014178();
      swift_dynamicCast(v129, v125, &type metadata for AnyHashable, &type metadata for String, 7LL);
      sub_100014120((uint64_t)v126);
      uint64_t v70 = v129[0];
      uint64_t v71 = v129[1];
      uint64_t v72 = v132;
      if ((swift_isUniquelyReferenced_nonNull_native(v132) & 1) == 0)
      {
        sub_10001EB60(0, v72[2] + 1LL, 1);
        uint64_t v72 = v132;
      }

      unint64_t v74 = v72[2];
      unint64_t v73 = v72[3];
      id v36 = (id)(v74 + 1);
      if (v74 >= v73 >> 1)
      {
        sub_10001EB60(v73 > 1, v74 + 1, 1);
        uint64_t v72 = v132;
      }

      v72[2] = v36;
      uint64_t v75 = &v72[2 * v74];
      v75[4] = v70;
      void v75[5] = v71;
      uint64_t v65 = v121;
      sub_100022C7C(v46, (int)v56, v55 & 1, v121);
      sub_10001423C();
      if (v76)
      {
        sub_10001421C();
        sub_1000141E8();
        goto LABEL_21;
      }
    }

    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }

  swift_bridgeObjectRelease(v65);
  uint64_t v72 = _swiftEmptyArrayStorage;
  id v56 = (id)v55;
  uint64_t v55 = v54;
LABEL_21:
  v128 = v72;
  swift_bridgeObjectRetain(v72);
  uint64_t v77 = v112;
  sub_100013730((uint64_t *)&v128);
  uint64_t v112 = v77;
  if (!v77)
  {
    swift_bridgeObjectRelease(v72);
    uint64_t v121 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames;
    *(void *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames) = v128;
    id v78 = [v113 samplingRates];
    uint64_t v79 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v78,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

    uint64_t v66 = *(void *)(v79 + 16);
    if (!v66)
    {
      swift_bridgeObjectRelease(v79);
      uint64_t v82 = _swiftEmptyArrayStorage;
LABEL_37:
      *(void *)(v46 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelSamplingRates) = v82;
      uint64_t v66 = v116;
      if (qword_10005A208 == -1) {
        goto LABEL_38;
      }
      goto LABEL_49;
    }

    v129[0] = _swiftEmptyArrayStorage;
    sub_10001EB7C(0, v66, 0);
    sub_100022DDC(v79);
    sub_1000141CC();
    while ((v46 & 0x8000000000000000LL) == 0)
    {
      sub_100014290();
      if (v67 == v68) {
        break;
      }
      sub_1000141B0();
      if ((v80 & 1) == 0) {
        goto LABEL_47;
      }
      if (*(_DWORD *)(v79 + 36) != (_DWORD)v56) {
        goto LABEL_48;
      }
      sub_10001419C();
      sub_100014178();
      swift_dynamicCast(&v132, v125, &type metadata for AnyHashable, &type metadata for Int, 7LL);
      sub_100014120((uint64_t)v126);
      uint64_t v81 = v132;
      uint64_t v82 = (void *)v129[0];
      if ((swift_isUniquelyReferenced_nonNull_native(v129[0]) & 1) == 0)
      {
        sub_10001EB7C(0, v82[2] + 1LL, 1);
        uint64_t v82 = (void *)v129[0];
      }

      unint64_t v84 = v82[2];
      unint64_t v83 = v82[3];
      id v36 = (id)(v84 + 1);
      if (v84 >= v83 >> 1)
      {
        sub_10001EB7C(v83 > 1, v84 + 1, 1);
        uint64_t v82 = (void *)v129[0];
      }

      v82[2] = v36;
      v82[v84 + 4] = v81;
      sub_100022C7C(v46, (int)v56, v55 & 1, v79);
      sub_10001423C();
      if (v76)
      {
        sub_10001421C();
        sub_1000141E8();
        goto LABEL_37;
      }
    }

LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    swift_once(&qword_10005A208, sub_100005224);
LABEL_38:
    uint64_t v85 = type metadata accessor for Logger(0LL);
    sub_100004C5C(v85, (uint64_t)qword_10005C6F8);
    id v86 = (id)v46;
    uint64_t v87 = swift_bridgeObjectRetain(v66);
    uint64_t v88 = (os_log_s *)Logger.logObject.getter(v87);
    int64_t v90 = v46;
    os_log_type_t v91 = static os_log_type_t.debug.getter(v88, v89);
    if (os_log_type_enabled(v88, v91))
    {
      unint64_t v92 = v66;
      uint64_t v66 = swift_slowAlloc(22LL, -1LL);
      uint64_t v122 = swift_slowAlloc(64LL, -1LL);
      v128 = (void *)v122;
      *(_DWORD *)uint64_t v66 = 136315394;
      sub_1000142C0();
      v126[0] = sub_100026B8C(v111, v92, (uint64_t *)&v128);
      sub_100014274();
      swift_bridgeObjectRelease_n(v92, 3LL);
      *(_WORD *)(v66 + 12) = 2080;
      uint64_t v93 = *(void *)(v90 + v121);
      uint64_t v94 = swift_bridgeObjectRetain(v93);
      uint64_t v95 = Array.description.getter(v94, &type metadata for String);
      unint64_t v97 = v96;
      swift_bridgeObjectRelease(v93);
      v126[0] = sub_100026B8C(v95, v97, (uint64_t *)&v128);
      sub_100014274();

      swift_bridgeObjectRelease(v97);
      _os_log_impl( (void *)&_mh_execute_header,  v88,  v91,  "LSRAssets.init: Initialized with task name %s and its modelInfo supports the following tasks: %s",  (uint8_t *)v66,  0x16u);
      uint64_t v98 = v122;
      swift_arrayDestroy(v122, 2LL);
      sub_100006FF4(v98);
      sub_100006FF4(v66);

      sub_100014204((uint64_t)&v131);
      sub_100014204((uint64_t)v127);
      id v99 = *(void (**)(id, uint64_t))(v114 + 8);
      sub_100014264(v119);
      id v100 = v117;
    }

    else
    {
      swift_bridgeObjectRelease_n(v66, 2LL);

      sub_100014204((uint64_t)&v131);
      sub_100014204((uint64_t)v127);
      id v99 = *(void (**)(id, uint64_t))(v114 + 8);
      sub_100014264(v55);
      id v100 = v56;
    }

    v99(v100, v66);
    uint64_t v101 = (objc_class *)type metadata accessor for LSRAssets(0LL);
    v124.receiver = v86;
    v124.super_class = v101;
    NSData v27 = objc_msgSendSuper2(&v124, "init");
    sub_1000140A8(v110, &qword_10005C230);
    (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v118, v107);
    return (uint64_t)v27;
  }

  uint64_t result = swift_release(v128);
  __break(1u);
  return result;
}

id sub_1000112A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v8 = [v6 initWithLanguage:v7 assetType:a3];

  return v8;
}

void sub_10001131C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData);
  if (v3 == (void *)1)
  {
    uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___NSString);
    uint64_t v5 = URL.pathComponents.getter(v4);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
    id v7 = [v4 pathWithComponents:isa];

    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    uint64_t v10 = v9;

    id v11 = objc_allocWithZone(&OBJC_CLASS____EARContextualData);
    sub_10001E100(v8, v10);
    uint64_t v12 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v13;
    id v14 = v13;
    sub_1000136CC(v12);
  }

  sub_1000136DC(v3);
  sub_100014254();
}

void sub_100011408()
{
  uint64_t v1 = OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper);
  if (v2 == (void *)1)
  {
    id v3 = sub_100012AFC( *(void *)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language),  *(void *)(v0 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language + 8));
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_1000136CC(v4);
  }

  sub_1000136DC(v2);
  sub_100014254();
}

void sub_100011478(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v4);
  id v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v7 + 16))( v6,  a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion);
  uint64_t v9 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion + 8);
  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelTaskNames);
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType + 8);
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelSamplingRates);
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v23 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType);
    uint64_t v26 = v8;
    NSData v27 = a2;
    uint64_t v28 = _swiftEmptyArrayStorage;
    uint64_t v25 = v9;
    swift_bridgeObjectRetain(v9);
    uint64_t v24 = v10;
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v12);
    specialized ContiguousArray.reserveCapacity(_:)(v13);
    uint64_t v14 = 0LL;
    do
    {
      uint64_t v15 = v14 + 1;
      id v16 = [objc_allocWithZone(NSNumber) initWithInteger:*(void *)(v12 + 8 * v14 + 32)];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v17 = v28[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
      uint64_t v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v16);
      specialized ContiguousArray._endMutation()(v18);
      uint64_t v14 = v15;
    }

    while (v13 != v15);
    uint64_t v19 = v28;
    swift_bridgeObjectRelease(v12);
    a2 = v27;
    uint64_t v10 = v24;
    uint64_t v9 = v25;
  }

  else
  {
    swift_bridgeObjectRetain(*(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelVersion + 8));
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    uint64_t v19 = _swiftEmptyArrayStorage;
  }

  id v20 = objc_allocWithZone(&OBJC_CLASS____SFModelProperties);
  id v22 = sub_10001339C((uint64_t)v6, v9, v10, v11, (uint64_t)v19, v21);
  ((void (**)(void, id))a2)[2](a2, v22);

  _Block_release(a2);
}

void sub_1000116DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (**a6)(void, void))
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_100004C5C(v8, (uint64_t)qword_10005C710);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v12 = static os_log_type_t.debug.getter(v10, v11);
  if (os_log_type_enabled(v10, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v36 = sub_100026B8C(0xD00000000000003FLL, 0x8000000100044760LL, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v13 + 4);
    _os_log_impl((void *)&_mh_execute_header, v10, v12, "LSRAssets.%s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  uint64_t v15 = swift_allocObject(&unk_100051860, 24LL, 7LL);
  *(void *)(v15 + 16) = _swiftEmptyArrayStorage;
  id v16 = (uint64_t *)(v15 + 16);
  sub_10001131C();
  if (v17)
  {
    uint64_t v18 = v17;
    aBlock[4] = (uint64_t)sub_1000140DC;
    uint64_t v39 = v15;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100011CF4;
    aBlock[3] = (uint64_t)&unk_100051878;
    uint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = v39;
    swift_retain(v15);
    swift_release(v20);
    sub_10001402C(a1, a2, a3, a4, (uint64_t)v19, v18, (SEL *)&selRef_iterNamedEntitySourceWithApplication_task_block_);
    _Block_release(v19);
  }

  uint64_t v21 = swift_retain(v15);
  id v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v24 = static os_log_type_t.debug.getter(v22, v23);
  if (os_log_type_enabled(v22, v24))
  {
    uint64_t v25 = swift_slowAlloc(22LL, -1LL);
    uint64_t v26 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v36 = sub_100026B8C(0xD00000000000003FLL, 0x8000000100044760LL, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v25 + 4);
    *(_WORD *)(v25 + 12) = 2048;
    swift_beginAccess(v16, &v36, 0LL, 0LL);
    uint64_t v27 = *v16;
    if ((unint64_t)*v16 >> 62)
    {
      if (v27 < 0) {
        uint64_t v31 = *v16;
      }
      else {
        uint64_t v31 = v27 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*v16);
      uint64_t v28 = _CocoaArrayWrapper.endIndex.getter(v31);
      swift_bridgeObjectRelease(v27);
    }

    else
    {
      uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v35 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v25 + 14);
    swift_release(v15);
    _os_log_impl((void *)&_mh_execute_header, v22, v24, "LSRAssets.%s replying with %ld sources", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy(v26, 1LL);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {

    swift_release(v15);
  }

  swift_beginAccess(v16, aBlock, 0LL, 0LL);
  uint64_t v29 = *(void *)(v15 + 16);
  sub_1000091B8(0LL, &qword_10005BF08, &OBJC_CLASS____SFContextualNamedEntitySource_ptr);
  swift_bridgeObjectRetain(v29);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a6)[2](a6, isa);
  swift_release(v15);
  swift_bridgeObjectRelease(v29);

  _Block_release(a6);
}

uint64_t sub_100011B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100004B88(&qword_10005C200);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v25 - v14;
  if (!a1)
  {
    __break(1u);
    goto LABEL_6;
  }

  uint64_t v16 = swift_bridgeObjectRetain(a1);
  v25[0] = (uint64_t)sub_100027544(v16);
  sub_100013730(v25);
  swift_bridgeObjectRelease(a1);
  uint64_t v17 = v25[0];
  sub_100010504(a2, (uint64_t)v15, &qword_10005C200);
  uint64_t v18 = type metadata accessor for Date(0LL);
  if (sub_100004C10((uint64_t)v15, 1LL, v18) == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  sub_100010504(a3, (uint64_t)v13, &qword_10005C200);
  if (sub_100004C10((uint64_t)v13, 1LL, v18) != 1)
  {
    id v19 = objc_allocWithZone(&OBJC_CLASS____SFContextualNamedEntitySource);
    id v20 = sub_1000134D4(v17, (uint64_t)v15, (uint64_t)v13, a4);
    uint64_t v21 = swift_beginAccess(a5 + 16, v25, 33LL, 0LL);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v21);
    uint64_t v22 = *(void *)((*(void *)(a5 + 16) & 0xFFFFFFFFFFFFF8LL) + 0x10);
    sub_10001485C(v22);
    uint64_t v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v20);
    specialized Array._endMutation()(v23);
    return swift_endAccess(v25);
  }

LABEL_7:
  __break(1u);
  uint64_t result = swift_release(v25[0]);
  __break(1u);
  return result;
}

  uint64_t v17 = 0LL;
LABEL_8:
  if (a8)
  {
    v18.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a8);
  }

  else
  {
    v18.super.Class isa = 0LL;
  }

  uint64_t v31 = 0LL;
  LOBYTE(v25) = a12 & 1;
  LOWORD(v24) = a9 & 0x101;
  id v19 = objc_msgSend( v29,  "initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCod eTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:",  v28,  v26.super.isa,  v16.super.isa,  v17,  a7,  v18.super.isa,  v24,  a10,  a11,  v25,  &v31);

  id v20 = v31;
  if (v19)
  {
    uint64_t v21 = v31;
  }

  else
  {
    uint64_t v22 = v31;
    _convertNSErrorToError(_:)(v20);

    swift_willThrow();
  }

  swift_unknownObjectRelease(a11);
  return v19;
}

  id v19 = 0LL;
LABEL_15:

  return v19;
}
}
}
}

uint64_t sub_100011CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100004B88(&qword_10005C200);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v23 - v14;
  uint64_t v17 = *(void (**)(uint64_t, char *, char *, uint64_t))(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  if (a2) {
    a2 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for String,  &protocol witness table for String);
  }
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v18 = type metadata accessor for Date(0LL);
    uint64_t v19 = 0LL;
  }

  else
  {
    uint64_t v18 = type metadata accessor for Date(0LL);
    uint64_t v19 = 1LL;
  }

  uint64_t v20 = 1LL;
  sub_100006CF0((uint64_t)v15, v19, 1LL, v18);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v20 = 0LL;
  }

  uint64_t v21 = type metadata accessor for Date(0LL);
  sub_100006CF0((uint64_t)v13, v20, 1LL, v21);
  swift_retain(v16);
  v17(a2, v15, v13, a5);
  swift_release(v16);
  swift_bridgeObjectRelease(a2);
  sub_1000140A8((uint64_t)v13, &qword_10005C200);
  return sub_1000140A8((uint64_t)v15, &qword_10005C200);
}

void sub_100011E80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (**a6)(void, void))
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_100004C5C(v8, (uint64_t)qword_10005C710);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v12 = static os_log_type_t.debug.getter(v10, v11);
  if (os_log_type_enabled(v10, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v36 = sub_100026B8C(0xD000000000000041LL, 0x80000001000446E0LL, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v13 + 4);
    _os_log_impl((void *)&_mh_execute_header, v10, v12, "LSRAssets.%s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  uint64_t v15 = swift_allocObject(&unk_100051810, 24LL, 7LL);
  *(void *)(v15 + 16) = _swiftEmptyArrayStorage;
  uint64_t v16 = (uint64_t *)(v15 + 16);
  sub_10001131C();
  if (v17)
  {
    uint64_t v18 = v17;
    aBlock[4] = (uint64_t)sub_100013710;
    uint64_t v39 = v15;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100012420;
    aBlock[3] = (uint64_t)&unk_100051828;
    uint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = v39;
    swift_retain(v15);
    swift_release(v20);
    sub_10001402C(a1, a2, a3, a4, (uint64_t)v19, v18, (SEL *)&selRef_iterRankedContactSourceWithApplication_task_block_);
    _Block_release(v19);
  }

  uint64_t v21 = swift_retain(v15);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v24 = static os_log_type_t.debug.getter(v22, v23);
  if (os_log_type_enabled(v22, v24))
  {
    uint64_t v25 = swift_slowAlloc(22LL, -1LL);
    uint64_t v26 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v36 = sub_100026B8C(0xD000000000000041LL, 0x80000001000446E0LL, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v25 + 4);
    *(_WORD *)(v25 + 12) = 2048;
    swift_beginAccess(v16, &v36, 0LL, 0LL);
    uint64_t v27 = *v16;
    if ((unint64_t)*v16 >> 62)
    {
      if (v27 < 0) {
        uint64_t v31 = *v16;
      }
      else {
        uint64_t v31 = v27 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(*v16);
      uint64_t v28 = _CocoaArrayWrapper.endIndex.getter(v31);
      swift_bridgeObjectRelease(v27);
    }

    else
    {
      uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v35 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v25 + 14);
    swift_release(v15);
    _os_log_impl((void *)&_mh_execute_header, v22, v24, "LSRAssets.%s replying with %ld sources", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy(v26, 1LL);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {

    swift_release(v15);
  }

  swift_beginAccess(v16, aBlock, 0LL, 0LL);
  uint64_t v29 = *(void *)(v15 + 16);
  sub_1000091B8(0LL, &qword_10005BF00, &OBJC_CLASS____SFContextualRankedContactSource_ptr);
  swift_bridgeObjectRetain(v29);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a6)[2](a6, isa);
  swift_release(v15);
  swift_bridgeObjectRelease(v29);

  _Block_release(a6);
}

uint64_t sub_1000122D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100004B88(&qword_10005C200);
  uint64_t result = __chkstk_darwin(v12);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v16 = &v23[-v15 - 8];
  if (a2)
  {
    sub_100010504(a3, (uint64_t)&v23[-v15 - 8], &qword_10005C200);
    uint64_t v17 = type metadata accessor for Date(0LL);
    uint64_t result = sub_100004C10((uint64_t)v16, 1LL, v17);
    if ((_DWORD)result != 1)
    {
      objc_allocWithZone(&OBJC_CLASS____SFContextualRankedContactSource);
      swift_bridgeObjectRetain(a2);
      id v18 = sub_1000135A8(a1, a2, (uint64_t)v16, a4 & 1, a5);
      uint64_t v19 = swift_beginAccess(a6 + 16, v23, 33LL, 0LL);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v19);
      uint64_t v20 = *(void *)((*(void *)(a6 + 16) & 0xFFFFFFFFFFFFF8LL) + 0x10);
      sub_10001485C(v20);
      uint64_t v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v18);
      specialized Array._endMutation()(v21);
      return swift_endAccess(v23);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_100012420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100004B88(&qword_10005C200);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  if (!a2)
  {
    uint64_t v15 = 0LL;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v17 = type metadata accessor for Date(0LL);
    uint64_t v18 = 1LL;
    goto LABEL_6;
  }

  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  a2 = v16;
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v17 = type metadata accessor for Date(0LL);
  uint64_t v18 = 0LL;
LABEL_6:
  sub_100006CF0((uint64_t)v12, v18, 1LL, v17);
  swift_retain(v13);
  v14(v15, a2, v12, a4, a5);
  swift_release(v13);
  swift_bridgeObjectRelease(a2);
  return sub_1000140A8((uint64_t)v12, &qword_10005C200);
}

uint64_t sub_100012550( void *a1, int a2, uint64_t a3, uint64_t a4, void *aBlock, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))
{
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v16 = v15;
  _Block_copy(v10);
  id v17 = a1;
  a6(v11, v13, v14, v16, v17, v10);
  _Block_release(v10);

  sub_1000142B8();
  return swift_bridgeObjectRelease(v16);
}

void sub_1000125FC(uint64_t a1, void (**a2)(void, NSString), double a3, double a4)
{
  unint64_t v40 = a2;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v11 = sub_100004C5C(v7, (uint64_t)qword_10005C710);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v14 = static os_log_type_t.debug.getter(v12, v13);
  if (os_log_type_enabled(v12, v14))
  {
    uint64_t v39 = a1;
    uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v41 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v43 = sub_100026B8C(0xD00000000000002ELL, 0x8000000100044680LL, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v15 + 4);
    _os_log_impl((void *)&_mh_execute_header, v12, v14, "LSRAssets.%s", v15, 0xCu);
    swift_arrayDestroy(v16, 1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  sub_100011408();
  if (!v17) {
    goto LABEL_8;
  }
  uint64_t v18 = v17;
  Locale.identifier.getter(v17);
  uint64_t v20 = v19;
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  id v22 = [v18 regionIdForLocale:v21 latitude:a3 longitude:a4];

  if (v22)
  {
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    uint64_t v25 = v24;
  }

  else
  {
LABEL_8:
    uint64_t v23 = 0LL;
    uint64_t v25 = 0LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v26 = swift_bridgeObjectRetain_n(v25, 2LL);
  uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v29 = static os_log_type_t.debug.getter(v27, v28);
  if (os_log_type_enabled(v27, v29))
  {
    uint64_t v38 = v8;
    uint64_t v39 = v23;
    uint64_t v30 = swift_slowAlloc(22LL, -1LL);
    uint64_t v31 = swift_slowAlloc(64LL, -1LL);
    uint64_t v43 = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    uint64_t v41 = sub_100026B8C(0xD00000000000002ELL, 0x8000000100044680LL, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v30 + 4);
    *(_WORD *)(v30 + 12) = 2080;
    if (v25)
    {
      uint64_t v41 = 34LL;
      unint64_t v42 = 0xE100000000000000LL;
      v32._countAndFlagsBits = v39;
      v32._object = v25;
      String.append(_:)(v32);
      v33._countAndFlagsBits = 34LL;
      v33._object = (void *)0xE100000000000000LL;
      String.append(_:)(v33);
      uint64_t v34 = v41;
      unint64_t v35 = v42;
    }

    else
    {
      unint64_t v35 = 0xE300000000000000LL;
      uint64_t v34 = 7104878LL;
    }

    uint64_t v41 = sub_100026B8C(v34, v35, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v30 + 14);
    swift_bridgeObjectRelease_n(v25, 2LL);
    swift_bridgeObjectRelease(v35);
    _os_log_impl((void *)&_mh_execute_header, v27, v29, "LSRAssets.%s replying %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy(v31, 2LL);
    swift_slowDealloc(v31, -1LL, -1LL);
    swift_slowDealloc(v30, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v7);
    if (!v25) {
      goto LABEL_16;
    }
  }

  else
  {

    swift_bridgeObjectRelease_n(v25, 2LL);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (!v25)
    {
LABEL_16:
      NSString v36 = 0LL;
      goto LABEL_17;
    }
  }

  NSString v36 = String._bridgeToObjectiveC()();
LABEL_17:
  id v37 = v40;
  v40[2](v40, v36);
  swift_bridgeObjectRelease(v25);

  _Block_release(v37);
}

id sub_100012AFC(uint64_t a1, unint64_t a2)
{
  uint64_t v65 = type metadata accessor for Logger(0LL);
  uint64_t v63 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  sub_1000050EC();
  uint64_t v61 = v5 - v4;
  uint64_t v6 = sub_100004B88(&qword_10005C230);
  __chkstk_darwin(v6);
  sub_1000050EC();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_1000050EC();
  uint64_t v14 = v13 - v12;
  sub_1000091B8(0LL, &qword_10005BEF8, &OBJC_CLASS___SFEntitledAssetConfig_ptr);
  sub_1000142C0();
  id v15 = sub_1000112A4(a1, a2, 4LL);
  uint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___SFEntitledAssetManager);
  id v17 = [v16 sharedInstance];
  NSString v18 = String._bridgeToObjectiveC()();
  id v64 = v15;
  id v19 =  [v17 installedAssetWithConfig:v15 regionId:0 shouldSubscribe:1 subscriberId:v18 expiration:0];

  if (!v19) {
    goto LABEL_8;
  }
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  unint64_t v22 = v21;

  uint64_t v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000LL) == 0) {
    uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
  }
  if (!v23)
  {
    swift_bridgeObjectRelease(v22);
LABEL_8:
    if (qword_10005A210 != -1) {
      swift_once(&qword_10005A210, sub_100005278);
    }
    sub_100004C5C(v65, (uint64_t)qword_10005C710);
    uint64_t v30 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      Swift::String v33 = (uint8_t *)sub_100007000(12LL);
      uint64_t v34 = sub_100007000(32LL);
      uint64_t v66 = v34;
      *(_DWORD *)Swift::String v33 = 136315138;
      sub_1000142C0();
      uint64_t v35 = sub_100026B8C(a1, a2, &v66);
      uint64_t v36 = sub_1000142A4(v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v36, v37, v33 + 4);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "GeoLM: region mapping json file is nil Or there is no regionMapping for given language=%s",  v33,  0xCu);
      swift_arrayDestroy(v34, 1LL);
      sub_100006FF4(v34);
      sub_100006FF4((uint64_t)v33);
    }

    else
    {

      sub_100007008(a2);
    }

    goto LABEL_27;
  }

  id v24 = [v16 jsonFilenameForAssetType:4];
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  uint64_t v27 = v26;

  URL.init(string:)(v20, v22);
  swift_bridgeObjectRelease(v22);
  if (sub_100004C10(v9, 1LL, v10) == 1)
  {
    sub_1000142B8();
    sub_1000140A8(v9, &qword_10005C230);
    uint64_t countAndFlagsBits = 0LL;
    object = 0LL;
  }

  else
  {
    URL.appendingPathComponent(_:)(v25, v27);
    sub_1000142B8();
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v38(v9, v10);
    Swift::String v39 = URL.path(percentEncoded:)(0);
    uint64_t countAndFlagsBits = v39._countAndFlagsBits;
    object = v39._object;
    v38(v14, v10);
  }

  uint64_t v40 = v61;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v41 = sub_100004C5C(v65, (uint64_t)qword_10005C710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v61, v41, v65);
  uint64_t v42 = swift_bridgeObjectRetain_n(object, 2LL);
  uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
  os_log_type_t v45 = static os_log_type_t.debug.getter(v43, v44);
  uint64_t v62 = countAndFlagsBits;
  if (os_log_type_enabled(v43, v45))
  {
    int64_t v46 = (uint8_t *)sub_100007000(12LL);
    uint64_t v47 = sub_100007000(32LL);
    uint64_t v66 = v47;
    *(_DWORD *)int64_t v46 = 136315138;
    uint64_t v48 = v40;
    if (object) {
      uint64_t v49 = countAndFlagsBits;
    }
    else {
      uint64_t v49 = 7104878LL;
    }
    if (object) {
      unint64_t v50 = (unint64_t)object;
    }
    else {
      unint64_t v50 = 0xE300000000000000LL;
    }
    swift_bridgeObjectRetain(object);
    uint64_t v51 = sub_100026B8C(v49, v50, &v66);
    uint64_t v52 = sub_1000142A4(v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v52, v53, v46 + 4);
    sub_100007008((uint64_t)object);
    swift_bridgeObjectRelease(v50);
    _os_log_impl((void *)&_mh_execute_header, v43, v45, "GeoLM: region mapping json file=%s", v46, 0xCu);
    swift_arrayDestroy(v47, 1LL);
    sub_100006FF4(v47);
    sub_100006FF4((uint64_t)v46);

    uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8))(v48, v65);
  }

  else
  {

    sub_100007008((uint64_t)object);
    uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8))(v40, v65);
  }

  if (!object)
  {
LABEL_27:

    return 0LL;
  }

  uint64_t v55 = Locale.identifier.getter(v54);
  uint64_t v57 = v56;
  id v58 = objc_allocWithZone(&OBJC_CLASS____EARGeoLMHelper);
  id v59 = sub_100013648(v55, v57, v62, (uint64_t)object);

  return v59;
}

void sub_1000130B8()
{
}

id sub_1000130F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LSRAssets(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001322C()
{
  return type metadata accessor for LSRAssets(0LL);
}

uint64_t type metadata accessor for LSRAssets(uint64_t a1)
{
  uint64_t result = qword_10005BEE0;
  if (!qword_10005BEE0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LSRAssets);
  }
  return result;
}

void sub_10001326C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Locale(319LL);
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(v2 - 8) + 64LL;
    v8[1] = &unk_10003E168;
    v8[2] = &unk_10003E168;
    sub_100013348(319LL);
    if (v5 <= 0x3F)
    {
      v8[3] = *(void *)(v4 - 8) + 64LL;
      uint64_t v6 = type metadata accessor for URL(319LL);
      if (v7 <= 0x3F)
      {
        uint64_t v9 = *(void *)(v6 - 8) + 64LL;
        uint64_t v10 = (char *)&value witness table for Builtin.Int64 + 64;
        uint64_t v11 = v9;
        uint64_t v12 = &unk_10003E168;
        uint64_t v13 = &unk_10003E168;
        uint64_t v14 = (char *)&value witness table for Builtin.BridgeObject + 64;
        id v15 = (char *)&value witness table for Builtin.BridgeObject + 64;
        uint64_t v16 = &unk_10003E180;
        id v17 = &unk_10003E180;
        swift_updateClassMetadata2(a1, 256LL, 13LL, v8, a1 + 80);
      }
    }
  }

void sub_100013348(uint64_t a1)
{
  if (!qword_10005BEF0)
  {
    uint64_t v2 = type metadata accessor for URL(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10005BEF0);
    }
  }

id sub_10001339C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X6>, NSURL *a6@<X8>)
{
  unint64_t v7 = v6;
  URL._bridgeToObjectiveC()(a6);
  uint64_t v14 = v13;
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  Class v18 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a5);
  id v19 = [v7 initWithModelRoot:v14 modelVersion:v15 modelTaskNames:isa modelQualityType:v17 modelSamplingRates:v18];

  uint64_t v20 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8LL))(a1, v20);
  return v19;
}

id sub_1000134D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = v4;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  Class v11 = Date._bridgeToObjectiveC()().super.isa;
  Class v12 = Date._bridgeToObjectiveC()().super.isa;
  id v13 = [v5 initWithSourceApplications:isa fromDate:v11 toDate:v12 limit:a4];

  uint64_t v14 = type metadata accessor for Date(0LL);
  NSString v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL);
  v15(a3, v14);
  v15(a2, v14);
  return v13;
}

id sub_1000135A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v6 = v5;
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v13 = [v6 initWithSourceApplication:v11 rankDate:isa contactOnly:a4 & 1 limit:a5];

  uint64_t v14 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(a3, v14);
  return v13;
}

id sub_100013648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  id v9 = [v4 initWithLocale:v7 config:v8];

  return v9;
}

void sub_1000136CC(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_1000136DC(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_1000136EC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100013710(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_1000122D4(a1, a2, a3, a4, a5, v5);
}

uint64_t sub_100013718(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100013728(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100013730(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
  {
    sub_100028A3C(v2);
    uint64_t v2 = v3;
  }

  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_100013798(v5);
  *a1 = v2;
}

void sub_100013798(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        sub_100013DD0(0LL, v3, 1LL, a1);
      }
      return;
    }

LABEL_145:
    __break(1u);
    goto LABEL_146;
  }

  Swift::Int v5 = v4;
  id v123 = sub_10002684C(v3 / 2);
  uint64_t v124 = v3;
  v125 = v6;
  uint64_t v121 = a1;
  if (v3 > 0)
  {
    uint64_t v122 = v5;
    Swift::Int v7 = 0LL;
    uint64_t v8 = *a1;
    uint64_t v120 = *a1 + 8;
    v126 = (unint64_t *)&_swiftEmptyArrayStorage;
    while (1)
    {
      Swift::Int v9 = v7++;
      if (v7 >= v3) {
        goto LABEL_32;
      }
      uint64_t v10 = (uint64_t *)(v8 + 16 * v7);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      id v13 = (uint64_t *)(v8 + 16 * v9);
      uint64_t v14 = v13[1];
      if (v11 == *v13 && v12 == v14) {
        break;
      }
      int v16 = sub_100014194(v11, v12, *v13, v14);
      Swift::Int v17 = v9 + 2;
      if (v9 + 2 < v3) {
        goto LABEL_13;
      }
LABEL_23:
      Swift::Int v7 = v17;
      if ((v16 & 1) == 0) {
        goto LABEL_32;
      }
LABEL_24:
      if (v17 < v9) {
        goto LABEL_149;
      }
      if (v9 < v17)
      {
        uint64_t v25 = 16 * v17;
        uint64_t v26 = 16 * v9;
        Swift::Int v27 = v17;
        Swift::Int v28 = v9;
        do
        {
          if (v28 != --v27)
          {
            if (!v8) {
              goto LABEL_153;
            }
            uint64_t v29 = v8 + v25;
            uint64_t v30 = *(void *)(v8 + v26);
            uint64_t v31 = *(void *)(v8 + v26 + 8);
            *(_OWORD *)(v8 + v26) = *(_OWORD *)(v8 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }

          ++v28;
          v25 -= 16LL;
          v26 += 16LL;
        }

        while (v28 < v27);
      }

    __break(1u);
    goto LABEL_146;
  }

  Swift::Int v5 = v4;
  v133 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)sub_10002684C(v3 / 2);
  v134 = v3;
  v135 = (char *)v6;
  uint64_t v131 = a1;
  if (v3 > 0)
  {
    v132 = v5;
    id v13 = 0LL;
    uint64_t v14 = *a1;
    v130 = *a1 + 8;
    v136 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)_swiftEmptyArrayStorage;
    while (1)
    {
      NSString v15 = v13++;
      if (v13 >= v3) {
        goto LABEL_32;
      }
      int v16 = (uint64_t *)(v14 + 16 * v13);
      Swift::Int v17 = *v16;
      Class v18 = v16[1];
      uint64_t v19 = (void *)(v14 + 16 * v15);
      uint64_t v20 = v19[1];
      if (v17 == *v19 && v18 == v20) {
        break;
      }
      uint64_t v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, *v19, v20, 1LL);
      uint64_t v23 = v15 + 2;
      if (v15 + 2 < v3) {
        goto LABEL_13;
      }
LABEL_23:
      id v13 = v23;
      if ((v22 & 1) == 0) {
        goto LABEL_32;
      }
LABEL_24:
      if (v23 < v15) {
        goto LABEL_149;
      }
      if (v15 < v23)
      {
        uint64_t v31 = 16 * v23;
        Swift::Int v32 = 16 * v15;
        Swift::String v33 = v23;
        unint64_t v34 = v15;
        do
        {
          if (v34 != --v33)
          {
            if (!v14) {
              goto LABEL_153;
            }
            unint64_t v35 = v14 + v31;
            unint64_t v36 = *(void *)(v14 + v32);
            uint64_t v37 = *(void *)(v14 + v32 + 8);
            *(_OWORD *)(v14 + v32) = *(_OWORD *)(v14 + v31 - 16);
            *(void *)(v35 - 16) = v36;
            *(void *)(v35 - 8) = v37;
          }

          ++v34;
          v31 -= 16LL;
          v32 += 16LL;
        }

        while (v34 < v33);
      }

LABEL_31:
      Swift::Int v7 = v17;
LABEL_32:
      if (v7 >= v3) {
        goto LABEL_41;
      }
      if (__OFSUB__(v7, v9)) {
        goto LABEL_144;
      }
      if (v7 - v9 >= v122) {
        goto LABEL_41;
      }
      if (__OFADD__(v9, v122)) {
        goto LABEL_147;
      }
      if (v9 + v122 >= v3) {
        Swift::Int v32 = v3;
      }
      else {
        Swift::Int v32 = v9 + v122;
      }
      if (v32 < v9)
      {
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
        return;
      }

      if (v7 == v32)
      {
LABEL_41:
        Swift::String v33 = v126;
      }

      else
      {
        unint64_t v84 = (uint64_t *)(v8 + 16 * v7);
        Swift::String v33 = v126;
        do
        {
          uint64_t v85 = (uint64_t *)(v8 + 16 * v7);
          uint64_t v86 = *v85;
          uint64_t v87 = v85[1];
          Swift::Int v88 = v9;
          uint64_t v89 = v84;
          do
          {
            uint64_t v90 = *(v89 - 2);
            uint64_t v91 = *(v89 - 1);
            BOOL v92 = v86 == v90 && v87 == v91;
            if (v92 || (sub_100014194(v86, v87, v90, v91) & 1) == 0) {
              break;
            }
            if (!v8) {
              goto LABEL_151;
            }
            uint64_t v86 = *v89;
            uint64_t v87 = v89[1];
            *(_OWORD *)uint64_t v89 = *((_OWORD *)v89 - 1);
            *(v89 - 1) = v87;
            *(v89 - 2) = v86;
            v89 -= 2;
            ++v88;
          }

          while (v7 != v88);
          ++v7;
          v84 += 2;
        }

        while (v7 != v32);
        Swift::Int v7 = v32;
      }

      if (v7 < v9) {
        goto LABEL_143;
      }
      if ((swift_isUniquelyReferenced_nonNull_native(v33) & 1) == 0)
      {
        sub_1000142C8(0, v33[2] + 1);
        Swift::String v33 = v93;
      }

      unint64_t v35 = v33[2];
      unint64_t v34 = v33[3];
      unint64_t v36 = v35 + 1;
      if (v35 >= v34 >> 1)
      {
        sub_1000142C8(v34 > 1, v35 + 1);
        Swift::String v33 = v94;
      }

      v33[2] = v36;
      uint64_t v37 = v33 + 4;
      uint64_t v38 = (Swift::Int *)&v33[2 * v35 + 4];
      *uint64_t v38 = v9;
      v38[1] = v7;
      v126 = v33;
      if (v35)
      {
        while (1)
        {
          unint64_t v39 = v36 - 1;
          if (v36 >= 4)
          {
            uint64_t v44 = &v37[2 * v36];
            uint64_t v45 = *(v44 - 8);
            uint64_t v46 = *(v44 - 7);
            BOOL v50 = __OFSUB__(v46, v45);
            uint64_t v47 = v46 - v45;
            if (v50) {
              goto LABEL_128;
            }
            uint64_t v49 = *(v44 - 6);
            uint64_t v48 = *(v44 - 5);
            BOOL v50 = __OFSUB__(v48, v49);
            uint64_t v42 = v48 - v49;
            char v43 = v50;
            if (v50) {
              goto LABEL_129;
            }
            unint64_t v51 = v36 - 2;
            uint64_t v52 = &v37[2 * v36 - 4];
            uint64_t v54 = *v52;
            uint64_t v53 = v52[1];
            BOOL v50 = __OFSUB__(v53, v54);
            uint64_t v55 = v53 - v54;
            if (v50) {
              goto LABEL_130;
            }
            BOOL v50 = __OFADD__(v42, v55);
            uint64_t v56 = v42 + v55;
            if (v50) {
              goto LABEL_132;
            }
            if (v56 >= v47)
            {
              unint64_t v74 = &v37[2 * v39];
              uint64_t v76 = *v74;
              uint64_t v75 = v74[1];
              BOOL v50 = __OFSUB__(v75, v76);
              uint64_t v77 = v75 - v76;
              if (v50) {
                goto LABEL_138;
              }
              BOOL v67 = v42 < v77;
              goto LABEL_79;
            }
          }

          else
          {
            if (v36 != 3)
            {
              unint64_t v68 = v33[4];
              unint64_t v69 = v33[5];
              BOOL v50 = __OFSUB__(v69, v68);
              uint64_t v61 = v69 - v68;
              char v62 = v50;
              goto LABEL_73;
            }

            unint64_t v41 = v33[4];
            unint64_t v40 = v33[5];
            BOOL v50 = __OFSUB__(v40, v41);
            uint64_t v42 = v40 - v41;
            char v43 = v50;
          }

          if ((v43 & 1) != 0) {
            goto LABEL_131;
          }
          unint64_t v51 = v36 - 2;
          uint64_t v57 = &v37[2 * v36 - 4];
          uint64_t v59 = *v57;
          uint64_t v58 = v57[1];
          BOOL v60 = __OFSUB__(v58, v59);
          uint64_t v61 = v58 - v59;
          char v62 = v60;
          if (v60) {
            goto LABEL_133;
          }
          uint64_t v63 = &v37[2 * v39];
          uint64_t v65 = *v63;
          uint64_t v64 = v63[1];
          BOOL v50 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          if (v50) {
            goto LABEL_135;
          }
          if (__OFADD__(v61, v66)) {
            goto LABEL_137;
          }
          if (v61 + v66 >= v42)
          {
            BOOL v67 = v42 < v66;
LABEL_79:
            if (v67) {
              unint64_t v39 = v51;
            }
            goto LABEL_81;
          }

      id v13 = v23;
LABEL_32:
      if (v13 >= v3) {
        goto LABEL_41;
      }
      if (__OFSUB__(v13, v15)) {
        goto LABEL_144;
      }
      if (v13 - v15 >= v132) {
        goto LABEL_41;
      }
      if (__OFADD__(v15, v132)) {
        goto LABEL_147;
      }
      if (v15 + v132 >= v3) {
        uint64_t v38 = v3;
      }
      else {
        uint64_t v38 = v15 + v132;
      }
      if (v38 < v15)
      {
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
        return;
      }

      if (v13 == v38)
      {
LABEL_41:
        unint64_t v39 = v136;
      }

      else
      {
        uint64_t v97 = (void *)(v14 + 16 * v13);
        unint64_t v39 = v136;
        do
        {
          uint64_t v98 = (uint64_t *)(v14 + 16 * v13);
          uint64_t v99 = *v98;
          uint64_t v100 = v98[1];
          uint64_t v101 = v15;
          uint64_t v102 = v97;
          do
          {
            uint64_t v103 = *(v102 - 2);
            uint64_t v104 = *(v102 - 1);
            unint64_t v105 = v99 == v103 && v100 == v104;
            if (v105 || (_stringCompareWithSmolCheck(_:_:expecting:)(v99, v100, v103, v104, 1LL) & 1) == 0) {
              break;
            }
            if (!v14) {
              goto LABEL_151;
            }
            uint64_t v99 = *v102;
            uint64_t v100 = v102[1];
            *(_OWORD *)uint64_t v102 = *((_OWORD *)v102 - 1);
            *(v102 - 1) = v100;
            *(v102 - 2) = v99;
            v102 -= 2;
            ++v101;
          }

          while (v13 != v101);
          ++v13;
          v97 += 2;
        }

        while (v13 != v38);
        id v13 = v38;
      }

      if (v13 < v15) {
        goto LABEL_143;
      }
      if ((swift_isUniquelyReferenced_nonNull_native(v39) & 1) == 0)
      {
        sub_100027FB8(0, *(void *)v39->transaction + 1LL, 1, (char *)v39);
        unint64_t v39 = v106;
      }

      unint64_t v41 = *(void *)v39->transaction;
      unint64_t v40 = *(void *)v39->resultStream;
      uint64_t v42 = v41 + 1;
      if (v41 >= v40 >> 1)
      {
        sub_100027FB8(v40 > 1, v41 + 1, 1, (char *)v39);
        unint64_t v39 = v107;
      }

      *(void *)v39->transaction = v42;
      audioBufferListeners = v39->audioBufferListeners;
      uint64_t v44 = &v39->audioBufferListeners[16 * v41];
      *(void *)uint64_t v44 = v15;
      *((void *)v44 + 1) = v13;
      v136 = v39;
      if (v41)
      {
        while (1)
        {
          uint64_t v45 = v42 - 1;
          if (v42 >= 4)
          {
            BOOL v50 = &audioBufferListeners[16 * v42];
            unint64_t v51 = *((void *)v50 - 8);
            uint64_t v52 = *((void *)v50 - 7);
            uint64_t v56 = __OFSUB__(v52, v51);
            uint64_t v53 = v52 - v51;
            if (v56) {
              goto LABEL_128;
            }
            uint64_t v55 = *((void *)v50 - 6);
            uint64_t v54 = *((void *)v50 - 5);
            uint64_t v56 = __OFSUB__(v54, v55);
            uint64_t v48 = v54 - v55;
            uint64_t v49 = v56;
            if (v56) {
              goto LABEL_129;
            }
            uint64_t v57 = v42 - 2;
            uint64_t v58 = &audioBufferListeners[16 * v42 - 32];
            BOOL v60 = *(void *)v58;
            uint64_t v59 = *((void *)v58 + 1);
            uint64_t v56 = __OFSUB__(v59, v60);
            uint64_t v61 = v59 - v60;
            if (v56) {
              goto LABEL_130;
            }
            uint64_t v56 = __OFADD__(v48, v61);
            char v62 = v48 + v61;
            if (v56) {
              goto LABEL_132;
            }
            if (v62 >= v53)
            {
              uint64_t v80 = &audioBufferListeners[16 * v45];
              uint64_t v82 = *(void *)v80;
              uint64_t v81 = *((void *)v80 + 1);
              uint64_t v56 = __OFSUB__(v81, v82);
              unint64_t v83 = v81 - v82;
              if (v56) {
                goto LABEL_138;
              }
              uint64_t v73 = v48 < v83;
              goto LABEL_79;
            }
          }

          else
          {
            if (v42 != 3)
            {
              unint64_t v74 = *(void *)v39->audioBufferListeners;
              uint64_t v75 = *(void *)v39->audioBufferListenerLock;
              uint64_t v56 = __OFSUB__(v75, v74);
              BOOL v67 = v75 - v74;
              unint64_t v68 = v56;
              goto LABEL_73;
            }

            uint64_t v47 = *(void *)v39->audioBufferListeners;
            uint64_t v46 = *(void *)v39->audioBufferListenerLock;
            uint64_t v56 = __OFSUB__(v46, v47);
            uint64_t v48 = v46 - v47;
            uint64_t v49 = v56;
          }

          if ((v49 & 1) != 0) {
            goto LABEL_131;
          }
          uint64_t v57 = v42 - 2;
          uint64_t v63 = &audioBufferListeners[16 * v42 - 32];
          uint64_t v65 = *(void *)v63;
          uint64_t v64 = *((void *)v63 + 1);
          uint64_t v66 = __OFSUB__(v64, v65);
          BOOL v67 = v64 - v65;
          unint64_t v68 = v66;
          if (v66) {
            goto LABEL_133;
          }
          unint64_t v69 = &audioBufferListeners[16 * v45];
          uint64_t v71 = *(void *)v69;
          uint64_t v70 = *((void *)v69 + 1);
          uint64_t v56 = __OFSUB__(v70, v71);
          uint64_t v72 = v70 - v71;
          if (v56) {
            goto LABEL_135;
          }
          if (__OFADD__(v67, v72)) {
            goto LABEL_137;
          }
          if (v67 + v72 >= v48)
          {
            uint64_t v73 = v48 < v72;
LABEL_79:
            if (v73) {
              uint64_t v45 = v57;
            }
            goto LABEL_81;
          }

LABEL_73:
          if ((v62 & 1) != 0) {
            goto LABEL_134;
          }
          uint64_t v70 = &v37[2 * v39];
          uint64_t v72 = *v70;
          uint64_t v71 = v70[1];
          BOOL v50 = __OFSUB__(v71, v72);
          uint64_t v73 = v71 - v72;
          if (v50) {
            goto LABEL_136;
          }
          if (v73 < v61) {
            goto LABEL_90;
          }
LABEL_81:
          unint64_t v78 = v39 - 1;
          if (v39 - 1 >= v36)
          {
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
            goto LABEL_139;
          }

          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v79 = &v37[2 * v78];
          uint64_t v80 = *v79;
          uint64_t v81 = &v37[2 * v39];
          uint64_t v82 = v81[1];
          sub_100013E90((char *)(v8 + 16 * *v79), (char *)(v8 + 16LL * *v81), v8 + 16 * v82, v125);
          if (v1)
          {
            uint64_t v95 = v126;
LABEL_107:
            uint64_t v96 = swift_bridgeObjectRelease(v95);
            if (v124 >= -1)
            {
              sub_1000142D4(v96, v97, v98, v99, v100, v101, v102, v103, v119, v120, (uint64_t)v121, v122, (uint64_t)v123);
              return;
            }

          if ((v68 & 1) != 0) {
            goto LABEL_134;
          }
          uint64_t v76 = &audioBufferListeners[16 * v45];
          unint64_t v78 = *(void *)v76;
          uint64_t v77 = *((void *)v76 + 1);
          uint64_t v56 = __OFSUB__(v77, v78);
          uint64_t v79 = v77 - v78;
          if (v56) {
            goto LABEL_136;
          }
          if (v79 < v67) {
            goto LABEL_90;
          }
LABEL_81:
          unint64_t v84 = v45 - 1;
          if (v45 - 1 >= v42)
          {
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
            goto LABEL_139;
          }

          if (!v14) {
            goto LABEL_152;
          }
          uint64_t v85 = &audioBufferListeners[16 * v84];
          uint64_t v86 = *(void *)v85;
          uint64_t v87 = &audioBufferListeners[16 * v45];
          Swift::Int v88 = *((void *)v87 + 1);
          sub_100027E14( (char *)(v14 + 16LL * *(void *)v85),  (char *)(v14 + 16LL * *(void *)v87),  v14 + 16 * v88,  v135);
          if (v1)
          {
            uint64_t v108 = v136;
LABEL_107:
            swift_bridgeObjectRelease(v108, v89, v90, v91, v92, v93, v94, v95);
            if (v134 >= -1)
            {
              *(void *)v133->transaction = 0LL;
              swift_bridgeObjectRelease(v133, v109, v110, v111, v112, v113, v114, v115);
              return;
            }

LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
            goto LABEL_148;
          }

          if (v82 < v80) {
            goto LABEL_125;
          }
          if (v39 > v126[2]) {
            goto LABEL_126;
          }
          uint64_t *v79 = v80;
          v37[2 * v78 + 1] = v82;
          unint64_t v83 = v126[2];
          if (v39 >= v83) {
            goto LABEL_127;
          }
          Swift::String v33 = v126;
          unint64_t v36 = v83 - 1;
          memmove(&v37[2 * v39], v81 + 2, 16 * (v83 - 1 - v39));
          v126[2] = v83 - 1;
          if (v83 <= 2) {
            goto LABEL_90;
          }
        }
      }

      unint64_t v36 = 1LL;
LABEL_90:
      Swift::Int v3 = v124;
      if (v7 >= v124) {
        goto LABEL_111;
      }
    }

    Swift::Int v17 = v9 + 2;
    if (v9 + 2 >= v3) {
      goto LABEL_31;
    }
    int v16 = 0;
LABEL_13:
    Class v18 = (uint64_t *)(v120 + 16 * v17);
    do
    {
      uint64_t v19 = *(v18 - 1);
      uint64_t v20 = *v18;
      unint64_t v21 = (uint64_t *)(v8 + 16 * v7);
      uint64_t v22 = v21[1];
      if (v19 == *v21 && v20 == v22)
      {
        if ((v16 & 1) != 0) {
          goto LABEL_24;
        }
      }

      else if (((v16 ^ sub_100014194(v19, v20, *v21, v22)) & 1) != 0)
      {
        goto LABEL_23;
      }

      v18 += 2;
      Swift::Int v24 = v17 + 1;
      Swift::Int v7 = v17;
      Swift::Int v17 = v24;
    }

    while (v24 < v3);
    Swift::Int v17 = v24;
    goto LABEL_23;
  }

  v126 = (unint64_t *)&_swiftEmptyArrayStorage;
  unint64_t v36 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_111:
  if (v36 >= 2)
  {
    uint64_t v104 = *v121;
    while (1)
    {
      unint64_t v105 = v36 - 2;
      if (v36 < 2) {
        break;
      }
      if (!v104) {
        goto LABEL_154;
      }
      uint64_t v95 = v126;
      int64_t v106 = v126[2 * v105 + 4];
      int64_t v107 = v126[2 * v36 + 3];
      sub_100013E90((char *)(v104 + 16 * v106), (char *)(v104 + 16 * v126[2 * v36 + 2]), v104 + 16 * v107, v125);
      if (v1) {
        goto LABEL_107;
      }
      if (v107 < v106) {
        goto LABEL_140;
      }
      if ((swift_isUniquelyReferenced_nonNull_native(v126) & 1) == 0)
      {
        sub_100028080((uint64_t)v126);
        uint64_t v95 = v110;
      }

      if (v105 >= v95[2]) {
        goto LABEL_141;
      }
      uint64_t v108 = &v95[2 * v105 + 4];
      unint64_t *v108 = v106;
      v108[1] = v107;
      unint64_t v109 = v95[2];
      if (v36 > v109) {
        goto LABEL_142;
      }
      memmove(&v95[2 * v36 + 2], &v95[2 * v36 + 4], 16 * (v109 - v36));
      v126 = v95;
      v95[2] = v109 - 1;
      unint64_t v36 = v109 - 1;
      Swift::Int v3 = v124;
      if (v109 <= 2) {
        goto LABEL_122;
      }
    }

            __break(1u);
LABEL_147:
            __break(1u);
            goto LABEL_148;
          }

          if (v88 < v86) {
            goto LABEL_125;
          }
          if (v45 > *(void *)v136->transaction) {
            goto LABEL_126;
          }
          *(void *)uint64_t v85 = v86;
          *(void *)&audioBufferListeners[16 * v84 + 8] = v88;
          uint64_t v96 = *(void *)v136->transaction;
          if (v45 >= v96) {
            goto LABEL_127;
          }
          unint64_t v39 = v136;
          uint64_t v42 = v96 - 1;
          memmove(&audioBufferListeners[16 * v45], v87 + 16, 16 * (v96 - 1 - v45));
          *(void *)v136->transaction = v96 - 1;
          if (v96 <= 2) {
            goto LABEL_90;
          }
        }
      }

      uint64_t v42 = 1LL;
LABEL_90:
      Swift::Int v3 = v134;
      if (v13 >= v134) {
        goto LABEL_111;
      }
    }

    uint64_t v23 = v15 + 2;
    if (v15 + 2 >= v3) {
      goto LABEL_31;
    }
    uint64_t v22 = 0;
LABEL_13:
    Swift::Int v24 = (uint64_t *)(v130 + 16 * v23);
    do
    {
      uint64_t v25 = *(v24 - 1);
      uint64_t v26 = *v24;
      Swift::Int v27 = (void *)(v14 + 16 * v13);
      Swift::Int v28 = v27[1];
      if (v25 == *v27 && v26 == v28)
      {
        if ((v22 & 1) != 0) {
          goto LABEL_24;
        }
      }

      else if (((v22 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, *v27, v28, 1LL)) & 1) != 0)
      {
        goto LABEL_23;
      }

      v24 += 2;
      uint64_t v30 = v23 + 1;
      id v13 = v23;
      uint64_t v23 = v30;
    }

    while (v30 < v3);
    uint64_t v23 = v30;
    goto LABEL_23;
  }

  v136 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)_swiftEmptyArrayStorage;
  uint64_t v42 = _swiftEmptyArrayStorage[2];
LABEL_111:
  if (v42 >= 2)
  {
    uint64_t v116 = *v131;
    while (1)
    {
      uint64_t v117 = v42 - 2;
      if (v42 < 2) {
        break;
      }
      if (!v116) {
        goto LABEL_154;
      }
      uint64_t v108 = v136;
      uint64_t v118 = *(void *)&v136->audioBufferListeners[16 * v117];
      uint64_t v119 = *(void *)&v136->resultStream[16 * v42];
      sub_100027E14( (char *)(v116 + 16 * v118),  (char *)(v116 + 16LL * *(void *)&v136->transaction[16 * v42]),  v116 + 16 * v119,  v135);
      if (v1) {
        goto LABEL_107;
      }
      if (v119 < v118) {
        goto LABEL_140;
      }
      if ((swift_isUniquelyReferenced_nonNull_native(v136) & 1) == 0)
      {
        sub_100028080((uint64_t)v136);
        uint64_t v108 = v122;
      }

      if (v117 >= *(void *)v108->transaction) {
        goto LABEL_141;
      }
      uint64_t v120 = &v108->audioBufferListeners[16 * v117];
      *(void *)uint64_t v120 = v118;
      *((void *)v120 + 1) = v119;
      uint64_t v121 = *(void *)v108->transaction;
      if (v42 > v121) {
        goto LABEL_142;
      }
      memmove(&v108->transaction[16 * v42], &v108->audioBufferListeners[16 * v42], 16 * (v121 - v42));
      v136 = v108;
      *(void *)v108->transaction = v121 - 1;
      uint64_t v42 = v121 - 1;
      Swift::Int v3 = v134;
      if (v121 <= 2) {
        goto LABEL_122;
      }
    }

LABEL_139:
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
    goto LABEL_145;
  }

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
    goto LABEL_145;
  }

LABEL_122:
  uint64_t v111 = swift_bridgeObjectRelease(v126);
  if (v3 < -1) {
    goto LABEL_150;
  }
  sub_1000142D4(v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, (uint64_t)v121, v122, (uint64_t)v123);
}

  swift_bridgeObjectRelease(v136, v6, v7, v8, v9, v10, v11, v12);
  if (v3 < -1) {
    goto LABEL_150;
  }
  *(void *)v133->transaction = 0LL;
  swift_bridgeObjectRelease(v133, v123, v124, v125, v126, v127, v128, v129);
}

uint64_t sub_100013DD0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        uint64_t v13 = *(v12 - 2);
        uint64_t v14 = *(v12 - 1);
        if (result == v13 && v10 == v14) {
          break;
        }
        uint64_t result = sub_100014194(result, v10, v13, v14);
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }

        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }

      while (v4 != v11);
      ++v4;
      v8 += 16LL;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_100013E90(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = (uint64_t *)a4;
  uint64_t v6 = (uint64_t *)a2;
  uint64_t v7 = (uint64_t *)a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_1000268D8(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    uint64_t v12 = &v4[2 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v20 = (uint64_t *)(a3 - 16);
    while (1)
    {
      unint64_t v21 = v20 + 2;
      uint64_t v22 = *(v12 - 2);
      uint64_t v23 = *(v12 - 1);
      Swift::Int v24 = v12 - 2;
      uint64_t v25 = *(v6 - 2);
      uint64_t v26 = *(v6 - 1);
      BOOL v27 = v22 == v25 && v23 == v26;
      if (v27 || (sub_100014194(v22, v23, v25, v26) & 1) == 0)
      {
        BOOL v29 = v21 != v12 || v20 >= v12;
        v12 -= 2;
        if (!v29) {
          goto LABEL_43;
        }
      }

      else
      {
        BOOL v28 = v21 != v6 || v20 >= v6;
        Swift::Int v24 = v6 - 2;
        v6 -= 2;
        if (!v28) {
          goto LABEL_43;
        }
      }

      *(_OWORD *)uint64_t v20 = *(_OWORD *)v24;
LABEL_43:
      v20 -= 2;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }

  sub_1000268D8(a1, (a2 - a1) / 16, a4);
  uint64_t v12 = &v4[2 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      uint64_t v14 = v6[1];
      uint64_t v15 = v4[1];
      BOOL v16 = *v6 == *v4 && v14 == v15;
      if (!v16 && (sub_100014194(*v6, v14, *v4, v15) & 1) != 0) {
        break;
      }
      Swift::Int v17 = v4;
      BOOL v16 = v7 == v4;
      v4 += 2;
      if (!v16) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 2;
    }

    Swift::Int v17 = v6;
    BOOL v16 = v7 == v6;
    v6 += 2;
    if (v16) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
    goto LABEL_16;
  }

LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_1000268D8((char *)v4, ((char *)v12 - (char *)v4) / 16, (char *)v6);
  return 1LL;
}

      uint64_t v11 = (v20 - 1) & v20;
    }

    swift_release(v5);
    Swift::Int v3 = v35;
    uint64_t v19 = (void *)(v5 + 64);
    if ((a2 & 1) == 0) {
      goto LABEL_42;
    }
LABEL_38:
    unint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
    if (v34 >= 64) {
      sub_1000274C0(0LL, (unint64_t)(v34 + 63) >> 6, v19);
    }
    else {
      *uint64_t v19 = -1LL << v34;
    }
    *(void *)(v5 + 16) = 0LL;
  }

  uint64_t v6 = v7;
LABEL_47:
  sub_1000268D8(v4, (v12 - v4) / 16, v6);
  return 1LL;
}

  uint64_t v19 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Error: %@", buf, 0x16u);
  }

  -[LSRConnection reportFailureWithError:](self, "reportFailureWithError:", v15);
LABEL_24:
}

void sub_10001402C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, SEL *a7)
{
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = String._bridgeToObjectiveC()();
  objc_msgSend(a6, *a7, v10, v11, a5);
}

uint64_t sub_1000140A8(uint64_t a1, uint64_t *a2)
{
  return a1;
}

uint64_t sub_1000140DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100011B30(a1, a2, a3, a4, v4);
}

uint64_t sub_1000140E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100014120(uint64_t a1)
{
  return a1;
}

uint64_t sub_100014154(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_10001416C@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1 + 8));
}

uint64_t sub_100014178()
{
  __int128 v1 = *(_OWORD *)(v0 - 128);
  *(_OWORD *)(v0 - 192) = *(_OWORD *)(v0 - 144);
  *(_OWORD *)(v0 - 176) = v1;
  *(void *)(v0 - 160) = *(void *)(v0 - 112);
  return sub_1000140E4(v0 - 192, v0 - 232);
}

uint64_t sub_100014194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 1LL);
}

uint64_t sub_10001419C()
{
  return sub_1000140E4(*(void *)(v0 + 48) + 40 * v1, v2 - 144);
}

  ;
}

void sub_1000141CC()
{
  *(void *)(v1 - 264) = v0 + 56;
}

  ;
}

void sub_100014204(uint64_t a1@<X8>)
{
}

  ;
}

uint64_t sub_10001421C()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

  ;
}

uint64_t sub_100014264(uint64_t a1)
{
  return v1(a1, *(void *)(v2 - 320));
}

uint64_t sub_100014274()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 192, v1, v0);
}

void sub_100014284(uint64_t a1@<X8>)
{
}

  ;
}

uint64_t sub_1000142A4(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_1000142B8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000142C0()
{
  return swift_bridgeObjectRetain(v0);
}

void sub_1000142C8(char a1, uint64_t a2)
{
}

uint64_t sub_1000142D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(a13 + 16) = 0LL;
  return swift_bridgeObjectRelease(a13);
}

id sub_1000142E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t)v3 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_asrId;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  sub_100006CF0(v7, 1LL, 1LL, v8);
  sub_1000148D4(v7, (uint64_t)v14, 33LL);
  uint64_t v9 = v3;
  sub_10001488C(a1, v7);
  swift_endAccess(v14);
  NSString v10 = &v9[OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName];
  *(void *)NSString v10 = a2;
  *((void *)v10 + 1) = a3;
  *(void *)&v9[OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents] = _swiftEmptyArrayStorage;

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for EARModelContextDelegateInterface(0LL);
  id v11 = objc_msgSendSuper2(&v13, "init");
  sub_100004C1C(a1);
  return v11;
}

uint64_t sub_1000143C4(uint64_t a1, uint64_t a2)
{
  char v3 = (void *)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName + 8);
  *char v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

void sub_1000143E0(_TtC22localspeechrecognition19EARSpeechRecognizer *a1)
{
  char v3 = (_TtC22localspeechrecognition19EARSpeechRecognizer **)(v1
                                                            + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents);
  sub_1000148D4((uint64_t)v3, (uint64_t)v12, 1LL);
  uint64_t v4 = *v3;
  *char v3 = a1;
  swift_bridgeObjectRelease(v4, v5, v6, v7, v8, v9, v10, v11);
}

void sub_10001442C(uint64_t a1, uint64_t a2)
{
}

void sub_10001444C(uint64_t a1, uint64_t a2)
{
}

void sub_100014460( uint64_t a1, uint64_t a2, void (*a3)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = v4;
  uint64_t v10 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  uint64_t v11 = __chkstk_darwin(v10);
  objc_super v13 = &v29[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v11);
  uint64_t v15 = &v29[-v14];
  uint64_t v16 = v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_asrId;
  sub_1000148D4( v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_asrId,  (uint64_t)v30,  0LL);
  sub_100004BC8(v16, (uint64_t)v15);
  uint64_t v17 = type metadata accessor for UUID(0LL);
  int v18 = sub_100004C10((uint64_t)v15, 1LL, v17);
  sub_100004C1C((uint64_t)v15);
  if (v18 == 1)
  {
    if (qword_10005A200 != -1) {
      swift_once(&qword_10005A200, sub_10000348C);
    }
    uint64_t v19 = mach_continuous_time();
    uint64_t v20 = a4(v19, a1, a2);
    if (v20)
    {
      unint64_t v21 = (void *)v20;
      uint64_t v22 = (void *)(v4
                     + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents);
      sub_1000148D4( v7 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents,  (uint64_t)v29,  33LL);
      id v23 = v21;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v23);
      uint64_t v24 = *(void *)((*v22 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      sub_100014860(v24);
      uint64_t v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v23);
      specialized Array._endMutation()(v25);
      swift_endAccess(v29);
    }
  }

  else
  {
    if (qword_10005A200 != -1) {
      swift_once(&qword_10005A200, sub_10000348C);
    }
    sub_100004BC8(v16, (uint64_t)v13);
    uint64_t v26 = *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName);
    uint64_t v27 = *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName + 8);
    swift_bridgeObjectRetain(v27);
    uint64_t v28 = mach_continuous_time();
    a3(v13, v26, v27, v28, a1, a2);
    swift_bridgeObjectRelease(v27);
    sub_100004C1C((uint64_t)v13);
  }

uint64_t sub_10001468C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease(v8);
}

void sub_1000146E0()
{
}

id sub_100014718()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EARModelContextDelegateInterface(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100014798()
{
  return type metadata accessor for EARModelContextDelegateInterface(0LL);
}

uint64_t type metadata accessor for EARModelContextDelegateInterface(uint64_t a1)
{
  uint64_t result = qword_10005BF98;
  if (!qword_10005BF98) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EARModelContextDelegateInterface);
  }
  return result;
}

void sub_1000147D8(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = &unk_10003E1C8;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
  }

uint64_t sub_100014860(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFF8LL) + 0x18);
  return result;
}

uint64_t sub_10001488C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000148D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t sub_1000148DC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, int a3@<W6>, uint64_t a4@<X8>)
{
  uint64_t v30 = a4;
  int v31 = a3;
  uint64_t v32 = a1;
  uint64_t v29 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v5 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100004B88(&qword_10005C230);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  objc_super v13 = (char *)&v28 - v12;
  NSString v14 = String._bridgeToObjectiveC()();
  NSString v15 = String._bridgeToObjectiveC()();
  sub_100014D20(a2, (uint64_t)v13);
  uint64_t v16 = type metadata accessor for URL(0LL);
  int v18 = 0LL;
  if (sub_100004C10((uint64_t)v13, 1LL, v16) != 1)
  {
    URL._bridgeToObjectiveC()(v17);
    int v18 = v19;
    (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8LL))(v13, v16);
  }

  uint64_t v20 = (void *)objc_opt_self(&OBJC_CLASS___LSRConnection);
  id v33 = 0LL;
  id v21 =  [v20 modelRootWithLanguage:v14 assetType:v32 clientID:v15 modelOverrideURL:v18 isSpelling:v31 & 1 error:&v33];

  id v22 = v33;
  if (v21)
  {
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v25 = v24;

    (*(void (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for URL.DirectoryHint.isDirectory(_:),  v29);
    sub_100006CF0((uint64_t)v11, 1LL, 1LL, v16);
    return URL.init(filePath:directoryHint:relativeTo:)(v23, v25, v7, v11);
  }

  else
  {
    uint64_t v27 = v22;
    _convertNSErrorToError(_:)(v22);

    return swift_willThrow();
  }

char *sub_100014B40(char *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v9 = (uint64_t)result;
    type metadata accessor for LSRError(0LL);
    uint64_t v3 = v2;
    uint64_t v4 = sub_100014C50( (unint64_t *)&qword_10005AD20,  (uint64_t (*)(uint64_t))type metadata accessor for LSRError,  (uint64_t)&unk_10003DCD8);
    _BridgedStoredNSError.code.getter(&v10, v3, v4);
    if ((unint64_t)(v10 - 101) >= 2 && (unint64_t)(v10 - 2) > 1)
    {

      return 0LL;
    }

    else
    {
      type metadata accessor for SFSpeechError(0LL);
      uint64_t v6 = v5;
      uint64_t v9 = static SFSpeechErrorCode.noModel.getter(v5);
      uint64_t v10 = v1;
      uint64_t v7 = _BridgedStoredNSError.userInfo.getter(v3, v4);
      uint64_t v8 = sub_100014C50( &qword_10005ACE8,  (uint64_t (*)(uint64_t))type metadata accessor for SFSpeechError,  (uint64_t)&unk_10003DBC8);
      _BridgedStoredNSError.init(_:userInfo:)(&v10, &v9, v7, v6, v8);

      return v10;
    }
  }

  return result;
}

uint64_t sub_100014C50(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

id sub_100014C90()
{
  unint64_t v0 = sub_100014CE4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id result = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  qword_10005C8F8 = (uint64_t)result;
  return result;
}

unint64_t sub_100014CE4()
{
  unint64_t result = qword_10005BFC0;
  if (!qword_10005BFC0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___LSRConnection);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005BFC0);
  }

  return result;
}

uint64_t sub_100014D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005C230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

double sub_100014D68@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_100022C20(a1 + 32, (uint64_t)a2);
  }

  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

uint64_t sub_100014D88(uint64_t a1)
{
  uint64_t result = sub_100022DE0(a1);
  if ((v4 & 1) != 0) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }

  if (result == 1LL << *(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  else {
    return sub_100022D60(result, v3, 0LL, a1);
  }
}

void sub_100014DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100022C10((_OWORD *)a1, v5);
    sub_10001F4AC(v5, a2, a3);
    swift_bridgeObjectRelease(a3);
  }

  else
  {
    sub_100022E60(a1, &qword_10005C1C0);
    sub_10001F104(a2, a3, v5);
    swift_bridgeObjectRelease(a3);
    sub_100022E60((uint64_t)v5, &qword_10005C1C0);
  }

uint64_t sub_100014E7C(uint64_t a1)
{
  uint64_t v2 = Set.init(minimumCapacity:)(*(void *)(a1 + 16), &type metadata for String, &protocol witness table for String);
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    char v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_100020714(v9, v5, v6);
      swift_bridgeObjectRelease(v9[1]);
      v4 += 2;
      --v3;
    }

    while (v3);
    sub_1000051A8();
    return v10;
  }

  else
  {
    uint64_t v7 = v2;
    sub_1000051A8();
  }

  return v7;
}

void sub_100014F24(uint64_t a1)
{
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v4 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  sub_100022E98(&qword_10005C208, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  v11[1] = (id)Set.init(minimumCapacity:)(v3, v4, v5);
  if (!v2)
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v6) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return;
  }

  if (a1 < 0) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v9);
  swift_bridgeObjectRelease(a1);
  if (!v6) {
    goto LABEL_16;
  }
LABEL_5:
  if (v6 < 1)
  {
    __break(1u);
  }

  else
  {
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * i + 32);
      }
      sub_1000208C0((Swift::Int *)v11, v8);
    }

    swift_bridgeObjectRelease(a1);
  }

void sub_100015094()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  NSString v2 = sub_10000BC7C();
  sub_1000051A8();
  sub_10002326C(v1, "initWithConfig:");

  sub_100023484();
}

void sub_1000150EC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    _convertErrorToNSError(_:)(a2);
  }
  uint64_t v2 = sub_10002349C();
  uint64_t v5 = v3;
  v4(v2);
  sub_100023390(v5);
}

uint64_t sub_100015138(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100015164(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100004B88((uint64_t *)&unk_10005C1E8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v39 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v38 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = v3 + 8;
  sub_10000BCC0();
  sub_100023554();
  int64_t v8 = 0LL;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v19 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    id v22 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v10);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    *(void *)&v49[0] = v21;
    *((void *)&v49[0] + 1) = v20;
    swift_bridgeObjectRetain(v20);
    sub_10002329C();
    sub_100023500( (uint64_t)&v41,  (uint64_t)v49,  (uint64_t)&type metadata for String,  (uint64_t)&type metadata for AnyHashable);
    v40[0] = v24;
    v40[1] = v23;
    sub_100023500((uint64_t)&v44, (uint64_t)v40, (uint64_t)&type metadata for String, (uint64_t)&type metadata for Any + 8);
    __int128 v45 = v41;
    __int128 v46 = v42;
    uint64_t v47 = v43;
    uint64_t v25 = (_OWORD *)sub_100023434();
    sub_100022C10(v25, v26);
    __int128 v41 = v45;
    __int128 v42 = v46;
    uint64_t v43 = v47;
    sub_100022C10(&v48, v49);
    sub_100022C10(v49, &v45);
    AnyHashable._rawHashValue(seed:)(v3[5]);
    sub_1000236C8();
    if (((v29 << v28) & ~v7[v27]) == 0)
    {
      sub_100023358();
      while (++v31 != v32 || (v30 & 1) == 0)
      {
        BOOL v33 = v31 == v32;
        if (v31 == v32) {
          uint64_t v31 = 0LL;
        }
        v30 |= v33;
        if (v7[v31] != -1LL)
        {
          sub_100023344();
          goto LABEL_38;
        }
      }

      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }

    sub_10002336C();
LABEL_38:
    sub_100023330();
    *(void *)((char *)v7 + v34) |= v35;
    uint64_t v37 = v3[6] + 40 * v36;
    *(_OWORD *)uint64_t v37 = v41;
    *(_OWORD *)(v37 + 16) = v42;
    *(void *)(v37 + 32) = v43;
    sub_100022C10(&v45, (_OWORD *)(v3[7] + 32 * v36));
    ++v3[2];
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1LL)) {
      goto LABEL_42;
    }
    if (v11 >= v38) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v39 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      sub_100023684();
      if (v14 == v15) {
        goto LABEL_40;
      }
      sub_100023678();
      if (!v12)
      {
        sub_100023684();
        if (v14 == v15) {
          goto LABEL_40;
        }
        sub_100023678();
        if (!v12)
        {
          sub_100023684();
          if (v14 == v15) {
            goto LABEL_40;
          }
          sub_100023678();
          if (!v12) {
            break;
          }
        }
      }
    }

LABEL_28:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }

  int64_t v17 = v16 + 4;
  if (v17 >= v38)
  {
LABEL_40:
    sub_1000070C4();
    sub_10000C5E4(a1);
    return;
  }

  unint64_t v12 = *(void *)(v39 + 8 * v17);
  if (v12)
  {
    int64_t v13 = v17;
    goto LABEL_28;
  }

  while (!__OFADD__(v17, 1LL))
  {
    sub_100023684();
    if (v14 == v15) {
      goto LABEL_40;
    }
    sub_100023678();
    int64_t v17 = v18 + 1;
    if (v12) {
      goto LABEL_28;
    }
  }

LABEL_43:
  __break(1u);
}

uint64_t sub_1000154A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100004B88((uint64_t *)&unk_10005C1E8);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v11 = v10 | (v9 << 6);
  while (1)
  {
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_100022C20(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v41);
    *(void *)&__int128 v40 = v18;
    *((void *)&v40 + 1) = v17;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v18;
    *((void *)&v38[0] + 1) = v17;
    swift_bridgeObjectRetain(v17);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_100022C10(v39, v33);
    __int128 v34 = v30;
    __int128 v35 = v31;
    uint64_t v36 = v32;
    sub_100022C10(v33, v37);
    __int128 v30 = v34;
    __int128 v31 = v35;
    uint64_t v32 = v36;
    sub_100022C10(v37, v38);
    sub_100022C10(v38, &v34);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v19 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)&v7[8 * (v20 >> 6)]) == 0)
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0LL;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v7[8 * v21];
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_34;
        }
      }

      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    unint64_t v22 = __clz(__rbit64((-1LL << v20) & ~*(void *)&v7[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_34:
    *(void *)&v7[(v22 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v22;
    uint64_t v27 = v3[6] + 40 * v22;
    *(_OWORD *)uint64_t v27 = v30;
    *(_OWORD *)(v27 + 16) = v31;
    *(void *)(v27 + 32) = v32;
    uint64_t result = (uint64_t)sub_100022C10(&v34, (_OWORD *)(v3[7] + 32 * v22));
    ++v3[2];
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      goto LABEL_38;
    }
    if (v12 >= v28) {
      goto LABEL_36;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v12);
    int64_t v14 = v9 + 1;
    if (!v13)
    {
      int64_t v14 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_36;
      }
      unint64_t v13 = *(void *)(v29 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_36;
        }
        unint64_t v13 = *(void *)(v29 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_36;
          }
          unint64_t v13 = *(void *)(v29 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }

LABEL_24:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    int64_t v9 = v14;
  }

  int64_t v15 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_36:
    swift_release(v3);
    sub_10000C5E4(a1);
    return (uint64_t)v3;
  }

  unint64_t v13 = *(void *)(v29 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v9 + 5;
    goto LABEL_24;
  }

  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v14 >= v28) {
      goto LABEL_36;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_24;
    }
  }

      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v39 = v17;
      int64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }

    uint64_t v19 = v4;
    unint64_t v20 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    unint64_t v22 = *v20;
    unint64_t v21 = v20[1];
    char v23 = (uint64_t *)(*(void *)(v4 + 56) + 16 * v14);
    unint64_t v24 = *v23;
    BOOL v25 = v23[1];
    Hasher.init(_seed:)(v40, *(void *)(v9 + 40));
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRetain(v25);
    String.hash(into:)(v40, v22, v21);
    uint64_t result = Hasher._finalize()();
    uint64_t v26 = -1LL << *(_BYTE *)(v9 + 32);
    uint64_t v27 = result & ~v26;
    int64_t v28 = v27 >> 6;
    if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) == 0) {
      break;
    }
    uint64_t v29 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_34:
    *(void *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v29;
    __int128 v34 = (void *)(*(void *)(v9 + 48) + 16 * v29);
    *__int128 v34 = v22;
    v34[1] = v21;
    __int128 v35 = (void *)(*(void *)(v9 + 56) + 16 * v29);
    *__int128 v35 = v24;
    v35[1] = v25;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1LL)) {
      goto LABEL_39;
    }
    uint64_t v4 = v19;
    unint64_t v11 = v39;
    if (!v5) {
      return v9;
    }
  }

  __int128 v30 = 0;
  __int128 v31 = (unint64_t)(63 - v26) >> 6;
  while (++v28 != v31 || (v30 & 1) == 0)
  {
    uint64_t v32 = v28 == v31;
    if (v28 == v31) {
      int64_t v28 = 0LL;
    }
    v30 |= v32;
    BOOL v33 = *(void *)(v12 + 8 * v28);
    if (v33 != -1)
    {
      uint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
      goto LABEL_34;
    }
  }

  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

LABEL_39:
  __break(1u);
  return result;
}

  sub_1000070C4();
  *uint64_t v4 = v6;
}

  sub_1000070C4();
  *uint64_t v2 = v6;
  sub_100023194();
}

void sub_100015860(uint64_t a1)
{
}

void sub_10001586C(uint64_t a1)
{
}

uint64_t sub_100015878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[141] = v5;
  v6[140] = a5;
  v6[139] = a4;
  v6[138] = a3;
  v6[137] = a2;
  v6[136] = a1;
  v6[142] = swift_getObjectType(v5);
  uint64_t v7 = type metadata accessor for String.LocalizationValue(0LL);
  v6[143] = sub_1000232F0(*(void *)(v7 - 8));
  uint64_t v8 = sub_100004B88(&qword_10005C200);
  v6[144] = sub_1000232F0(*(void *)(v8 - 8));
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  v6[145] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[146] = v10;
  v6[147] = sub_100023204(*(void *)(v10 + 64));
  v6[148] = sub_100023214();
  uint64_t v11 = type metadata accessor for URL(0LL);
  v6[149] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v6[150] = v12;
  v6[151] = sub_100023204(*(void *)(v12 + 64));
  v6[152] = sub_100023214();
  uint64_t v13 = sub_100004B88(&qword_10005C230);
  v6[153] = sub_100023204(*(void *)(*(void *)(v13 - 8) + 64LL));
  v6[154] = sub_100023214();
  uint64_t v14 = type metadata accessor for Locale(0LL);
  v6[155] = sub_100023204(*(void *)(*(void *)(v14 - 8) + 64LL));
  v6[156] = sub_100023214();
  uint64_t v15 = *(void *)(sub_100004B88((uint64_t *)&unk_10005BFB0) - 8);
  v6[157] = v15;
  uint64_t v16 = *(void *)(v15 + 64);
  v6[158] = v16;
  v6[159] = sub_100023204(v16);
  v6[160] = sub_100023214();
  v6[161] = sub_100023214();
  v6[162] = sub_100023214();
  uint64_t v17 = type metadata accessor for TaskHint(0LL);
  v6[163] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v6[164] = v18;
  v6[165] = sub_1000232F0(v18);
  return swift_task_switch(sub_1000159E8, 0LL, 0LL);
}

void sub_1000159E8()
{
  id v1 = *(char **)(v0 + 1128);
  uint64_t v2 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_transaction;
  *(void *)(v0 + 1328) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_transaction;
  *(void *)&v1[v2] = 0LL;
  uint64_t v3 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream;
  *(void *)(v0 + 1336) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_resultStream;
  *(void *)&v1[v3] = 0LL;
  uint64_t v4 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners;
  *(void *)(v0 + 1344) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners;
  uint64_t v5 = sub_1000091B8(0LL, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
  uint64_t v6 = type metadata accessor for EARSpeechRecognitionAudioBuffer();
  sub_100022E98( (unint64_t *)&qword_10005B290,  (unint64_t *)&qword_10005BE90,  &OBJC_CLASS___NSXPCListener_ptr);
  uint64_t v8 = v7;
  uint64_t v9 = v1;
  *(void *)&v1[v4] = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, v5, v6, v8);
  uint64_t v10 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
  *(void *)(v0 + 1352) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
  uint64_t v11 = sub_100004B88(&qword_10005BEA0);
  uint64_t v12 = swift_allocObject(v11, 20LL, 7LL);
  *(_DWORD *)(v12 + 16) = 0;
  *(void *)&v9[v10] = v12;
  uint64_t v13 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles;
  *(void *)(v0 + 1360) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles;
  *(void *)&v9[v13] = [objc_allocWithZone(NSMutableDictionary) init];
  uint64_t v14 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate;
  *(void *)(v0 + 1368) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate;
  uint64_t v15 = (uint64_t)&v9[v14];
  uint64_t v16 = type metadata accessor for Date(0LL);
  *(void *)(v0 + 1376) = v16;
  sub_1000106E8(v15, 1LL, v17, v16);
  uint64_t v18 = os_transaction_create("com.apple.localspeechrecognition.recognizer");
  uint64_t v19 = *(void *)&v1[v2];
  *(void *)&v1[v2] = v18;
  swift_unknownObjectRelease(v19);
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v20 = sub_10000706C();
  uint64_t v21 = sub_100004C5C(v20, (uint64_t)qword_10005C710);
  *(void *)(v0 + 1384) = v21;
  unint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v24 = static os_log_type_t.debug.getter(v22, v23);
  if (os_log_type_enabled(v22, v24))
  {
    BOOL v25 = (uint8_t *)sub_100007000(2LL);
    *(_WORD *)BOOL v25 = 0;
    sub_10000BC4C( (void *)&_mh_execute_header,  v22,  v24,  "LSR will remain active for the lifetime of this recognizer.",  v25);
    sub_100006FF4((uint64_t)v25);
  }

  uint64_t v26 = *(void *)(v0 + 1320);
  uint64_t v27 = *(void *)(v0 + 1312);
  uint64_t v28 = *(void *)(v0 + 1304);
  uint64_t v29 = *(void *)(v0 + 1128);
  __int128 v30 = *(void **)(v0 + 1096);
  __int128 v31 = *(void **)(v0 + 1088);

  uint64_t v32 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_supportedFeatures;
  *(void *)(v0 + 1392) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_supportedFeatures;
  *(void *)(v29 + v32) = v31;
  uint64_t v33 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo;
  *(void *)(v0 + 1400) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo;
  *(void *)(v29 + v33) = v30;
  *(void *)(v0 + 1408) = objc_opt_self(&OBJC_CLASS___NSProcessInfo);
  id v34 = v31;
  id v35 = v30;
  id v36 = sub_1000231B0((uint64_t)v35, "processInfo");
  [v36 systemUptime];
  *(void *)(v0 + 1416) = v37;

  id v39 = sub_10002370C(v38, "modelOptions");
  *(void *)(v0 + 1424) = v39;
  id v40 = [v35 clientID];
  uint64_t v298 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  uint64_t v42 = v41;

  id v44 = sub_10002370C(v43, "taskNames");
  uint64_t v45 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v44,  &type metadata for String,  &protocol witness table for String);

  uint64_t v46 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v27 + 104))( v26,  enum case for TaskHint.voicemail(_:),  v28);
  uint64_t v47 = (void *)TaskHint.preferredModelTaskNames.getter(v46);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  if (!v47[2])
  {
    sub_100023380();
    __break(1u);
    goto LABEL_102;
  }

  uint64_t v48 = v47[4];
  uint64_t v49 = v47[5];
  sub_1000142C0();
  sub_100023380();
  char v295 = sub_100018158(v48, v49, v45);
  sub_1000231B8();
  uint64_t v50 = sub_1000142B8();
  id v51 = sub_100023294(v50, "taskNames");
  static Set._unconditionallyBridgeFromObjectiveC(_:)( v51,  &type metadata for String,  &protocol witness table for String);
  sub_1000237B4();
  uint64_t v52 = sub_100014D88(v48);
  uint64_t v54 = v53;
  uint64_t v55 = sub_1000051A8();
  if (!v54)
  {
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
    return;
  }

  id v57 = sub_100023294(v56, "asrID");
  if (v57)
  {
    uint64_t v58 = v57;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v59 = 0LL;
  }

  else
  {
    uint64_t v59 = 1LL;
  }

  uint64_t v60 = *(void *)(v0 + 1288);
  uint64_t v61 = sub_100005154();
  sub_1000106E8(v60, v59, v62, v61);
  uint64_t v63 = sub_1000232CC();
  sub_100023144(v63, v64, v65);
  id v66 = [(id)objc_opt_self(LSRSpeechAssets) sharedInstance];
  *(void *)(v0 + 1432) = v66;
  id v297 = v66;
  if (!v66) {
    goto LABEL_103;
  }
  id v67 = [*(id *)(v0 + 1088) locale];
  static Locale._unconditionallyBridgeFromObjectiveC(_:)(v67);

  if (v39)
  {
    id v70 = sub_10002342C(v68, "modelOverrideURL");
    if (v70)
    {
      uint64_t v72 = v70;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v70);

      uint64_t v73 = 0LL;
    }

    else
    {
      uint64_t v73 = 1LL;
    }

    sub_1000106E8(*(void *)(v0 + 1224), v73, v71, *(void *)(v0 + 1192));
    uint64_t v74 = sub_10002349C();
    sub_100023144(v74, v75, v76);
  }

  else
  {
    sub_1000106E8(*(void *)(v0 + 1232), 1LL, v69, *(void *)(v0 + 1192));
  }

  uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSFSpeechRecognizerTaskTshot);
  BOOL v79 = v52 == v77 && v54 == v78;
  v296 = v39;
  if (!v79) {
    _stringCompareWithSmolCheck(_:_:expecting:)(v52, v54, v77, v78, 0LL);
  }
  uint64_t v80 = *(void *)(v0 + 1232);
  sub_1000051A8();
  id v81 = objc_allocWithZone((Class)type metadata accessor for LSRAssets(0LL));
  sub_1000234D8();
  swift_bridgeObjectRetain(v42);
  uint64_t v82 = sub_100023548();
  uint64_t v85 = sub_100010740(v82, v83, v54, v298, v42, v80, v84);
  uint64_t v86 = v42;
  *(void *)(v0 + 1440) = v85;
  *(void *)(v0 + 1448) = 0LL;
  uint64_t v87 = (void *)v85;
  uint64_t v286 = v86;
  uint64_t v293 = v54;
  uint64_t v294 = v52;
  uint64_t v88 = *(void *)(v0 + 1216);
  uint64_t v89 = *(void *)(v0 + 1200);
  uint64_t v90 = *(void *)(v0 + 1192);
  uint64_t v288 = *(void *)(v0 + 1128);
  sub_100023750(v85, v85 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_configurationFile);
  uint64_t v91 = (void *)objc_opt_self(&OBJC_CLASS___NSString);
  BOOL v92 = v87;
  uint64_t v93 = ((uint64_t (*)(void))URL.pathComponents.getter)();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v93);
  id v95 = [v91 pathWithComponents:isa];

  uint64_t v96 = static String._unconditionallyBridgeFromObjectiveC(_:)(v95);
  uint64_t v290 = v97;
  uint64_t v291 = v96;

  uint64_t v98 = *(uint64_t (**)(uint64_t, uint64_t))(v89 + 8);
  *(void *)(v0 + 1456) = v98;
  uint64_t v99 = v98(v88, v90);
  uint64_t v100 = sub_100023750(v99, (uint64_t)&v92[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot]);
  URL.pathComponents.getter(v100);
  Class v101 = Array._bridgeToObjectiveC()().super.isa;
  sub_10000E13C();
  id v102 = sub_10002326C(v91, "pathWithComponents:");

  static String._unconditionallyBridgeFromObjectiveC(_:)(v102);
  *(void *)(v288 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_assets) = v92;
  uint64_t v103 = *(void *)&v92[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language];
  uint64_t v104 = *(void *)&v92[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language + 8];
  uint64_t v105 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr;
  *(void *)(v0 + 1464) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr;
  int64_t v106 = (void *)(v288 + v105);
  *int64_t v106 = v103;
  v106[1] = v104;
  uint64_t v284 = v104;
  uint64_t v107 = *(void *)&v92[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType];
  uint64_t v108 = *(void *)&v92[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelQualityType + 8];
  BOOL v109 = v107 == 20808 && v108 == 0xE200000000000000LL;
  v289 = (uint64_t *)(v288 + v105);
  if (v109) {
    char v110 = 1;
  }
  else {
    char v110 = _stringCompareWithSmolCheck(_:_:expecting:)(v107, v108, 20808LL, 0xE200000000000000LL, 0LL);
  }
  uint64_t v111 = *(void *)(v0 + 1296);
  uint64_t v112 = *(void *)(v0 + 1280);
  uint64_t v113 = *(void *)(v0 + 1264);
  uint64_t v114 = *(void *)(v0 + 1256);
  uint64_t v115 = *(void *)(v0 + 1136);
  uint64_t v116 = *(void **)(v0 + 1104);
  *(_BYTE *)(*(void *)(v0 + 1128) + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_isHighQualityAsset) = v110 & 1;
  sub_100022F50(v111, v112, (uint64_t *)&unk_10005BFB0);
  uint64_t v117 = *(unsigned __int8 *)(v114 + 80);
  uint64_t v118 = (v117 + 32) & ~v117;
  unint64_t v119 = (v113 + v118 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v120 = (v119 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v121 = swift_allocObject(&unk_1000519A0, v120 + 8, v117 | 7);
  *(void *)(v0 + 1472) = v121;
  *(void *)(v121 + 16) = v116;
  *(void *)(v121 + 24) = v92;
  sub_100023144(v112, v121 + v118, (uint64_t *)&unk_10005BFB0);
  uint64_t v122 = (uint64_t *)(v121 + v119);
  *uint64_t v122 = v294;
  v122[1] = v293;
  *(void *)(v121 + v120) = v115;
  id v123 = v92;
  sub_100023670();
  uint64_t v124 = v123;
  swift_bridgeObjectRetain(v284);
  id v125 = v116;
  swift_retain(v121);
  uint64_t v126 = sub_100022B2C(&qword_10005C248);
  swift_asyncLet_begin(v0 + 16, 0LL, v126, &unk_10005C240, v121, v0 + 992);
  if (qword_10005A200 != -1) {
    swift_once(&qword_10005A200, sub_10000348C);
  }
  uint64_t v127 = *(void *)(v0 + 1120);
  uint64_t v128 = *(void *)(v0 + 1088);
  mach_continuous_time();
  sub_10002331C();
  sub_1000059C4(v129, v130, v131, v132, v133, v134);
  id v135 =  [(id)objc_opt_self(_EARSpeechRecognitionActiveConfiguration) activeConfigurationForEverything];
  *(void *)(v0 + 1480) = v135;
  id v136 = sub_1000232A4((uint64_t)v135, "taskNames");
  static Set._unconditionallyBridgeFromObjectiveC(_:)( v136,  &type metadata for String,  &protocol witness table for String);
  sub_1000237B4();
  v285 = v135;
  sub_1000222A8(v128, v135);
  uint64_t v137 = *(void *)(v127 + 16);
  uint64_t v138 = *(void *)(v0 + 1120);
  if (v137)
  {
    sub_10001EB98(0, v137, 0);
    v139 = (void *)(v138 + 40);
    do
    {
      uint64_t v140 = String.utf8CString.getter(*(v139 - 1), *v139) + 32;
      sub_10002329C();
      uint64_t v141 = sandbox_extension_consume(v140);
      sub_1000234F8();
      sub_10000E13C();
      unint64_t v143 = _swiftEmptyArrayStorage[2];
      unint64_t v142 = _swiftEmptyArrayStorage[3];
      if (v143 >= v142 >> 1) {
        sub_10001EB98(v142 > 1, v143 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v143 + 1;
      _swiftEmptyArrayStorage[v143 + 4] = v141;
      v139 += 2;
      --v137;
    }

    while (v137);
  }

  swift_bridgeObjectRelease(*(void *)(v0 + 1120));
  *(void *)(*(void *)(v0 + 1128)
            + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_sandboxExtensionHandles) = _swiftEmptyArrayStorage;
  uint64_t v144 = v289[1];
  sub_10000BCC0();
  unint64_t v145 = (unint64_t)sub_10000BC7C();
  sub_1000051A8();
  uint64_t v146 = *(void *)&v124[OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_assetType];

  sub_100022308(v145, v146, v298, v286, v297);
  sub_10002375C();
  if (v144)
  {
    sub_10000BCC0();
    v147 = sub_10001E738(0LL, 1LL, 1, (uint64_t)_swiftEmptyArrayStorage);
    v148 = v147;
    unint64_t v150 = *((void *)v147 + 2);
    unint64_t v149 = *((void *)v147 + 3);
    if (v150 >= v149 >> 1)
    {
      v147 = sub_10001E738((char *)(v149 > 1), v150 + 1, 1, (uint64_t)v147);
      v148 = v147;
    }

    *((void *)v148 + 2) = v150 + 1;
    v151 = v148;
    v152 = &v148[16 * v150];
    *((void *)v152 + 4) = v146;
    *((void *)v152 + 5) = v144;
    sub_1000092E0((uint64_t)v147, (unint64_t *)&unk_10005B2C0, &OBJC_CLASS____EARSpeechModelInfo_ptr);
    sub_100015094();
    unint64_t v145 = (unint64_t)v153;
    id v154 = [v153 version];
    uint64_t v155 = static String._unconditionallyBridgeFromObjectiveC(_:)(v154);
    unint64_t v157 = v156;
  }

  else
  {
    uint64_t v155 = 0LL;
    v151 = (char *)_swiftEmptyArrayStorage;
    unint64_t v157 = 0xE000000000000000LL;
  }

  v158 = *(void **)(v0 + 1104);
  uint64_t *v159 = v155;
  v159[1] = v157;
  sub_100022750(v158, (SEL *)&selRef_geoLMRegionID);
  if (v161)
  {
    uint64_t v162 = v160;
    uint64_t v163 = v161;
    sub_1000142C0();
    sub_100023434();
    NSString v164 = String._bridgeToObjectiveC()();
    sub_1000142B8();
    sub_10002247C((uint64_t)v164, v298, v286, v162, v163, v291, v290, v297);
    sub_10002375C();
    if ((sub_100023424() & 1) == 0) {
      v151 = sub_1000236BC(0LL, *((void *)v151 + 2) + 1LL);
    }
    unint64_t v166 = *((void *)v151 + 2);
    unint64_t v165 = *((void *)v151 + 3);
    unint64_t v145 = v166 + 1;
    if (v166 >= v165 >> 1) {
      v151 = sub_1000236BC((char *)(v165 > 1), v166 + 1);
    }
    *((void *)v151 + 2) = v145;
    v167 = &v151[16 * v166];
    *((void *)v167 + 4) = v162;
    *((void *)v167 + 5) = v163;
    char v168 = 1;
  }

  else
  {
    sub_1000234D0();
    char v168 = 0;
  }

  uint64_t v299 = (uint64_t)v151;
  *(void *)(v0 + 1488) = v151;
  uint64_t v169 = *(void *)(v0 + 1128);
  sub_100022750(*(void **)(v0 + 1104), (SEL *)&selRef_geoLMRegionID);
  v170 = (void *)(v169 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID);
  void *v170 = v171;
  v170[1] = v172;
  *(_BYTE *)(v169 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLanguageModelLoaded) = v168;
  if (v296)
  {
    id v173 = [v296 enableParallelLoading];
    if ((_DWORD)v173)
    {
      v174 = (os_log_s *)Logger.logObject.getter(v173);
      os_log_type_t v175 = static os_log_type_t.info.getter();
      if (sub_100023538(v175))
      {
        unint64_t v145 = sub_100007000(2LL);
        *(_WORD *)unint64_t v145 = 0;
        sub_10000BC4C( (void *)&_mh_execute_header,  v174,  (os_log_type_t)v169,  "ASR: enable parallel loading",  (uint8_t *)v145);
        sub_100006FF4(v145);
      }

      sub_100023424();
      sub_1000236E8();
      sub_100023300(0xD000000000000015LL, v176, (uint64_t)"enableParallelLoading");
      sub_1000232C0();
    }
  }

  uint64_t v177 = *(void *)(v0 + 1112);
  if (v177 && [*(id *)(v0 + 1112) keepANEModelLoaded])
  {
    sub_100023424();
    sub_1000236E8();
    sub_100023300(0xD000000000000012LL, v178, (uint64_t)"keepANEModelLoaded");
    sub_1000232C0();
  }

  static String._unconditionallyBridgeFromObjectiveC(_:)([*(id *)(v0 + 1096) source]);
  sub_1000237BC();
  sub_100023380();
  uint64_t v179 = HIBYTE(v145) & 0xF;
  if ((v145 & 0x2000000000000000LL) == 0) {
    uint64_t v179 = v169 & 0xFFFFFFFFFFFFLL;
  }
  if (v179)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)([*(id *)(v0 + 1096) source]);
    sub_1000237BC();
    sub_100023424();
    sub_1000236E8();
    uint64_t v180 = sub_100023768();
    sub_100020154(v180, v181, 0x5374616568657270LL, 0xED0000656372756FLL, v182);
    sub_1000232C0();
  }

  if (v296)
  {
    id v183 = v296;
    sub_100022794(v183, (SEL *)&selRef_taskForMemoryLock);
    if (v184)
    {
      sub_100023424();
      sub_1000236E8();
      uint64_t v185 = sub_100023434();
      sub_100020154(v185, v186, 0xD000000000000011LL, v187, v188);
      sub_1000232C0();
    }

    unsigned __int8 v189 = [v183 atypicalSpeech];
  }

  else
  {
    unsigned __int8 v189 = 0;
  }

  *(void *)(v0 + 1496) = &_swiftEmptyDictionarySingleton;
  v190 = *(void **)(v0 + 1088);
  *(_BYTE *)(*(void *)(v0 + 1128) + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_atypicalSpeechEnabled) = v189;
  uint64_t v191 = sub_100005124((uint64_t)&unk_1000519C8);
  *(void *)(v0 + 1504) = v191;
  *(void *)(v191 + 16) = 1LL;
  else {
    uint64_t v192 = 0LL;
  }
  *(void *)(v0 + 1512) = v192;
  if ((v295 & 1) != 0)
  {
    NSString v193 = sub_1000232E8();
    id v194 = VoicemailConfidenceSubtractionForLanguage(v193);
    sub_10002356C();
    if (v190)
    {
      uint64_t v196 = sub_1000092E0(v195, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
      uint64_t v197 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v190,  &type metadata for String,  v196,  &protocol witness table for String);
      sub_1000231B8();
LABEL_77:

      v198 = sub_1000220CC(v197);
      sub_1000051A8();
      goto LABEL_78;
    }

    v190 = (void *)sub_1000187D4(v191);
    sub_1000231B8();
    if (v190)
    {
      v199.super.Class isa = sub_100023744().super.isa;
      sub_10000E13C();
    }

    else
    {
      v199.super.Class isa = 0LL;
    }

    id v200 = EtiquetteConfidenceSubtraction(v199.super.isa);
    sub_10002356C();
    if (v190)
    {
      uint64_t v202 = sub_1000092E0(v201, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
      uint64_t v197 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v190,  &type metadata for String,  v202,  &protocol witness table for String);
      goto LABEL_77;
    }
  }

  else
  {
    sub_1000231B8();
  }

  v198 = 0LL;
LABEL_78:
  *(void *)(v0 + 1520) = v198;
  if (v177)
  {
    id v203 = sub_100023594();
    unint64_t v204 = (unint64_t)[v203 priority];
    if ((v204 & 0x8000000000000000LL) != 0 || v204 > 0xFF)
    {
      sub_100010594();
      sub_1000106F0((uint64_t)"Fatal error", 11LL, 2LL, v281, v282, v283, (uint64_t)"Swift/Integers.swift");
      sub_10002324C();
      return;
    }

    v205 = v289;
    uint64_t v206 = *(void *)(v0 + 1184);
    uint64_t v207 = *(void *)(v0 + 1168);
    uint64_t v208 = *(void *)(v0 + 1160);
    ((void (*)(void))TaskPriority.init(rawValue:))();
    TaskPriority.init(rawValue:)(21LL);
    uint64_t v209 = sub_100023768();
    static TaskPriority.> infix(_:_:)(v209);

    v210 = *(void (**)(uint64_t))(v207 + 8);
    uint64_t v211 = sub_100023434();
    v210(v211);
    ((void (*)(uint64_t, uint64_t))v210)(v206, v208);
  }

  else
  {
    v205 = v289;
  }

  uint64_t v212 = *(void *)(v0 + 1272);
  uint64_t v213 = *(void *)(v0 + 1128);
  sub_100022F50(*(void *)(v0 + 1296), v212, (uint64_t *)&unk_10005BFB0);
  id v214 = objc_allocWithZone((Class)type metadata accessor for EARModelContextDelegateInterface(0LL));
  swift_bridgeObjectRetain(v293);
  id v215 = sub_1000142E0(v212, v294, v293);
  *(void *)(v213 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface) = v215;
  mach_continuous_time();
  sub_100003B04();
  uint64_t v216 = v205[1];
  uint64_t v292 = *v205;
  sub_1000234D8();
  sub_100023670();
  v285;
  uint64_t v217 = sub_10002329C();
  *(void *)((char *)&v287 + 1) = sub_10002342C(v217, "flags");
  id v218 = sub_10002342C(*(uint64_t *)((char *)&v287 + 1), "voiceCommandActiveSet");
  unsigned int v219 = (sub_10002342C((uint64_t)v215, "flags") >> 5) & 1;
  id v220 = objc_allocWithZone(&OBJC_CLASS____EARSpeechRecognizer);
  id v221 = sub_10001E10C( v291,  v290,  0LL,  v299,  v292,  v216,  v285,  (uint64_t)&_swiftEmptyDictionarySingleton,  v287 & 0x100,  v218,  (uint64_t)v215,  v219);
  *(void *)(v0 + 1528) = 0LL;
  uint64_t v222 = *(void *)(v0 + 1128);
  uint64_t v223 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer;
  *(void *)(v0 + 1536) = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer;
  *(void *)(v222 + v223) = v221;
  mach_continuous_time();
  sub_100003B20();
  sub_1000234D0();
  id v224 = sub_100023400();
  id v225 = sub_10002370C((uint64_t)v224, "flags");
  sub_100023294((uint64_t)v225, "setAllowUtteranceDelay:");

  v226 = *(void **)(v222 + v223);
  if (v177)
  {
    id v227 = sub_100023594();
    id v228 = v226;
    sub_100022794(v227, (SEL *)&selRef_aneContext);
    sub_1000233F4(v229, v230);
  }

  else
  {
    id v231 = v226;
    sub_10002379C();
  }

  NSString v232 = sub_10000BC7C();
  sub_1000051A8();
  sub_10002326C(v226, "setAneContext:");

  v234 = *(void **)(v222 + v223);
  if (v296) {
    id v233 = [v296 atypicalSpeech];
  }
  v235 = *(void **)(v0 + 1088);
  sub_100023294((uint64_t)v233, "setAtypicalSpeech:");
  id v236 = v234;
  sub_100023294((uint64_t)[v235 concatenateUtterances], "setConcatenateUtterances:");

  v237 = *(void **)(v222 + v223);
  if (v177)
  {
    id v238 = sub_100023594();
    id v239 = v237;
    sub_100022794(v238, (SEL *)&selRef_cpuContext);
    sub_1000233F4(v240, v241);
  }

  else
  {
    id v242 = v237;
  }

  v243 = *(void **)(v0 + 1088);
  NSString v244 = sub_1000232E8();
  uint64_t v245 = sub_1000231B8();
  sub_100023490(v245, "setCpuContext:");

  id v246 = sub_100023400();
  sub_1000232A4((uint64_t)[v243 isSingleUtteranceTask], "setDetectUtterances:");

  id v247 = sub_100023400();
  id v248 = sub_100023294((uint64_t)v247, "flags");
  sub_1000232A4((uint64_t)v248, "setDisableAutoPunctuation:");

  id v249 = sub_100023400();
  id v250 = sub_100023294((uint64_t)v249, "flags");
  sub_1000232A4((uint64_t)v250, "setDisablePartialResults:");

  id v251 = sub_100023400();
  id v252 = sub_100023294((uint64_t)v251, "flags");
  sub_1000232A4((uint64_t)v252, "setEnableVoiceCommands:");

  v253 = *(void **)(v222 + v223);
  id v255 = sub_100023294(v254, "detectionOptions");
  if (v255)
  {
    v256 = v255;
    [v255 detectAfterTime];
    double v258 = v257;
  }

  else
  {
    double v258 = 0.0;
  }

  id v259 = [v253 setEndpointStart:v258];
  v260 = *(void **)(v222 + v223);
  if (v296) {
    id v259 = [v296 farField];
  }
  sub_100023294((uint64_t)v259, "setFarField:");
  id v261 = v260;
  id v262 = sub_1000232A4((uint64_t)v261, "flags");
  sub_100023294((uint64_t)v262, "setFormatAcrossUtterances:");

  v263 = *(void **)(v222 + v223);
  if (v177)
  {
    id v264 = sub_100023594();
    id v265 = v263;
    sub_100022794(v264, (SEL *)&selRef_gpuContext);
    sub_1000233F4(v266, v267);
  }

  else
  {
    id v268 = v263;
  }

  v269 = *(void **)(v0 + 1096);
  NSString v270 = sub_1000232E8();
  uint64_t v271 = sub_1000231B8();
  sub_100023774(v271, "setGpuContext:");

  v272 = *(void **)(v222 + v223);
  sub_1000232A4(v273, "setHighPriority:");
  id v274 = v272;
  sub_100022750(v269, (SEL *)&selRef_inputOrigin);
  sub_1000233F4(v275, v276);
  NSString v277 = sub_1000232E8();
  uint64_t v278 = sub_1000231B8();
  sub_100023490(v278, "setInputOrigin:");

  v279 = *(void **)(v222 + v223);
  *(void *)(v0 + 1544) = v279;
  id v280 = v279;
  sub_10002324C();
  swift_asyncLet_get();
}

uint64_t sub_100017388()
{
  return sub_1000231DC((uint64_t)sub_100017394);
}

uint64_t sub_100017394()
{
  __int128 v30 = *(void (**)(uint64_t))(v0 + 1456);
  uint64_t v32 = *(void *)(v0 + 1472);
  id v1 = *(void **)(v0 + 1432);
  uint64_t v2 = *(void **)(v0 + 1424);
  uint64_t v3 = *(char **)(v0 + 1296);
  uint64_t v4 = *(void *)(v0 + 1208);
  uint64_t v5 = *(void *)(v0 + 1192);
  uint64_t v6 = *(void **)(v0 + 1112);
  uint64_t v7 = *(void **)(v0 + 1104);
  uint64_t v8 = *(char **)(v0 + 1096);
  uint64_t v9 = *(void **)(v0 + 1088);

  uint64_t v10 = sub_100023548();
  v30(v10);
  sub_100022E60((uint64_t)v3, (uint64_t *)&unk_10005BFB0);
  swift_release(v32);
  uint64_t v31 = *(void *)(v0 + 1472);
  sub_100023274();

  swift_bridgeObjectRelease(*(void *)&v3[v5]);
  swift_release(*(void *)&v8[v5]);
  sub_100023454();
  if (v1)
  {
    sub_100023530();
    sub_100023564(v11, &qword_10005C200);
    sub_100023528();
    uint64_t v12 = *(void **)&v3[v4];
  }

  else
  {
    sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_assets);
    sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr);
    sub_100023518(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_sandboxExtensionHandles);
    sub_100023530();
    sub_1000091F0(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface);
    sub_100023564(v13, &qword_10005C200);
    sub_100023528();

    sub_10001416C(OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion);
    sub_100023690();
    sub_10000E13C();
  }

  uint64_t v14 = *(void *)(v0 + 1320);
  uint64_t v15 = *(void *)(v0 + 1280);
  uint64_t v16 = *(void *)(v0 + 1272);
  uint64_t v17 = *(void *)(v0 + 1248);
  uint64_t v18 = *(void *)(v0 + 1240);
  uint64_t v19 = *(void *)(v0 + 1232);
  uint64_t v23 = *(void *)(v0 + 1224);
  uint64_t v24 = *(void *)(v0 + 1216);
  uint64_t v25 = *(void *)(v0 + 1208);
  uint64_t v26 = *(void *)(v0 + 1184);
  uint64_t v27 = *(void *)(v0 + 1176);
  uint64_t v28 = *(void *)(v0 + 1152);
  uint64_t v29 = *(void *)(v0 + 1144);
  uint64_t v20 = *(void **)(v0 + 1128);
  uint64_t v21 = sub_100019050();
  swift_deallocPartialClassInstance( v20,  v21,  *(unsigned int *)((swift_isaMask & *v20) + 0x30LL),  *(unsigned __int16 *)((swift_isaMask & *v20) + 0x34LL));
  sub_100006CE0((uint64_t)&unk_10005C240, v31);
  swift_task_dealloc(v14);
  sub_100023650();
  sub_100023600();
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001760C()
{
  return sub_1000231DC((uint64_t)sub_100017618);
}

uint64_t sub_100017618(uint64_t a1)
{
  if (*(void *)(v1 + 1000) >> 60 == 15LL)
  {
    Class isa = 0LL;
  }

  else
  {
    uint64_t v3 = sub_1000232CC();
    sub_100022BCC(v3, v4);
    Class isa = sub_100023714().super.isa;
    uint64_t v5 = sub_1000232CC();
    a1 = sub_100008FD4(v5, v6);
  }

  uint64_t v7 = *(void **)(v1 + 1544);
  uint64_t v8 = *(void *)(v1 + 1536);
  uint64_t v9 = *(void *)(v1 + 1520);
  uint64_t v10 = *(void *)(v1 + 1128);
  uint64_t v11 = *(void **)(v1 + 1104);
  sub_100023780(a1, "setJitProfileData:");

  id v12 = sub_100023520();
  sub_100022644(v11, (SEL *)&selRef_leftContext);
  Class v13 = sub_10002378C().super.isa;
  sub_1000051A8();
  sub_10002326C(v12, "setLeftContext:");

  uint64_t v14 = *(void **)(v10 + v8);
  id v15 = v14;
  if (v9)
  {
    uint64_t v16 = sub_10000BCC0();
    sub_100021EBC(v16);
    uint64_t v17 = sub_1000051A8();
    sub_1000092E0(v17, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
    v18.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_1000070C4();
  }

  else
  {
    v18.super.Class isa = 0LL;
  }

  uint64_t v19 = *(void *)(v1 + 1536);
  uint64_t v20 = *(void *)(v1 + 1512);
  uint64_t v21 = *(void *)(v1 + 1128);
  sub_100023388(v14, "setRecognitionConfidenceSubtraction:");

  unint64_t v22 = *(void **)(v21 + v19);
  id v23 = v22;
  if (v20)
  {
    v24.super.Class isa = sub_100023744().super.isa;
    sub_10000E13C();
  }

  else
  {
    v24.super.Class isa = 0LL;
  }

  uint64_t v25 = *(void **)(v1 + 1104);
  sub_10002326C(v22, "setRecognitionReplacements:");

  id v26 = sub_100023520();
  id v27 = sub_1000231B0((uint64_t)v26, "flags");
  sub_1000232A4((uint64_t)v27, "setRecognizeEagerCandidates:");

  id v28 = sub_100023520();
  id v29 = sub_1000231B0((uint64_t)v28, "flags");
  sub_1000232A4((uint64_t)v29, "setRecognizeEmoji:");

  id v30 = sub_100023520();
  sub_100022644(v25, (SEL *)&selRef_rightContext);
  if (v31)
  {
    if (*(void *)(v31 + 16))
    {
      sub_1000272F0(0LL, 1, v31);
      sub_10002355C();
    }

    sub_10000E13C();
  }

  uint64_t v32 = *(void *)(v1 + 1536);
  uint64_t v33 = *(void *)(v1 + 1128);
  id v34 = *(void **)(v1 + 1104);
  NSString v35 = sub_1000232E8();
  uint64_t v36 = sub_1000231B8();
  sub_100023490(v36, "setRightContext:");

  id v37 = *(id *)(v33 + v32);
  sub_100022644(v34, (SEL *)&selRef_selectedText);
  if (v38)
  {
    uint64_t v39 = v38;
    if (*(void *)(v38 + 16))
    {
      sub_1000272F0(0LL, 1, v38);
      uint64_t v40 = *(void *)(v39 + 40);
      sub_100023670();
    }

    else
    {
      LOBYTE(v40) = 0;
    }

    sub_1000231B8();
  }

  else
  {
    LOBYTE(v40) = 0;
  }

  uint64_t v41 = *(void *)(v1 + 1536);
  uint64_t v42 = *(void *)(v1 + 1128);
  uint64_t v43 = *(void **)(v1 + 1104);
  id v44 = *(void **)(v1 + 1088);
  NSString v45 = String._bridgeToObjectiveC()();
  uint64_t v46 = sub_100023380();
  sub_100023774(v46, "setSelectedText:");

  id v47 = *(id *)(v42 + v41);
  sub_1000232A4((uint64_t)[v44 flags], "setShouldGenerateVoiceCommandCandidates:");

  id v48 = *(id *)(v42 + v41);
  sub_100022600(v43, (SEL *)&selRef_profileData);
  if (v50 >> 60 == 15)
  {
    Class v51 = 0LL;
  }

  else
  {
    LOBYTE(v40) = v49;
    Class v51 = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v52 = sub_100023434();
    sub_100008FD4(v52, v53);
  }

  sub_10002326C(v48, "setUserProfileData:");

  id v54 = [(id)objc_opt_self(TRIClient) clientWithIdentifier:111];
  uint64_t v55 = type metadata accessor for TrialExperimentationAssetManager();
  uint64_t inited = swift_initStackObject(v55, v1 + 824);
  *(void *)(inited + 16) = v54;
  uint64_t v127 = inited;
  char v57 = sub_100024634();
  if (v57 != 2)
  {
    uint64_t v58 = *(os_log_s **)(v1 + 1384);
    uint64_t v59 = v57 & 1;
    Logger.logObject.getter([*(id *)(*(void *)(v1 + 1128) + *(void *)(v1 + 1536)) setDisableContextualBiasing:v59]);
    os_log_type_t v60 = sub_1000070FC();
    if (sub_100023508(v60))
    {
      uint64_t v61 = (uint8_t *)sub_100007000(8LL);
      *(_DWORD *)uint64_t v61 = 67109120;
      *(_DWORD *)(v1 + 1552) = v59;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1552, v1 + 1556, v61 + 4);
      _os_log_impl( (void *)&_mh_execute_header,  v58,  (os_log_type_t)v40,  "Setting disableContextualBiasing=%{BOOL}d based on factor level from Trial.",  v61,  8u);
      sub_100006FF4((uint64_t)v61);
    }
  }

  uint64_t v62 = *(void *)(v1 + 1128);
  type metadata accessor for Instrumentation();
  rusage_info_t v63 = sub_100003FEC();
  *(void *)(v62 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_cpuInstructionsUsedAtStart) = v63;
  id v64 = sub_1000232A4((uint64_t)v63, "modelOptions");
  uint64_t v65 = (uint64_t)_swiftEmptyArrayStorage;
  if (v64)
  {
    uint64_t v66 = sub_100022408(v64);
    if (v66) {
      uint64_t v65 = v66;
    }
  }

  id v67 = sub_100023658();
  if (v67 && (uint64_t v68 = sub_10002239C(v67)) != 0)
  {
    uint64_t v126 = v68;
  }

  else
  {
    uint64_t v126 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
    sub_10002339C();
  }

  id v69 = sub_100023658();
  if (v69)
  {
    id v70 = v69;
    id v71 = [v69 speechProfileURLs];

    uint64_t v72 = sub_1000232CC();
    uint64_t v74 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v72, v73);
  }

  else
  {
    uint64_t v74 = _swiftEmptyArrayStorage;
  }

  uint64_t v75 = *(os_log_s **)(v1 + 1384);
  uint64_t v76 = sub_100023644();
  Logger.logObject.getter(v76);
  os_log_type_t v77 = sub_1000070FC();
  unint64_t v78 = (unint64_t)v65 >> 62;
  if (sub_100023638(v77))
  {
    BOOL v79 = (uint8_t *)sub_100007000(12LL);
    *(_DWORD *)BOOL v79 = 134217984;
    if (v78)
    {
      if (v65 < 0) {
        uint64_t v125 = v65;
      }
      else {
        uint64_t v125 = v65 & 0xFFFFFFFFFFFFFF8LL;
      }
      sub_1000142C0();
      uint64_t v80 = _CocoaArrayWrapper.endIndex.getter(v125);
      sub_1000142B8();
    }

    else
    {
      uint64_t v80 = *(void *)((v65 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    sub_1000142B8();
    *(void *)(v1 + 1080) = v80;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1080, v1 + 1088, v79 + 4);
    sub_1000234D0();
    sub_1000232AC();
    sub_1000142B8();
    sub_1000070D8( (void *)&_mh_execute_header,  v75,  v77,  "MUX: EARSpeechRecognizer init speechProfileContainers size=%ld",  v79);
    sub_100006FF4((uint64_t)v79);
  }

  else
  {
    swift_bridgeObjectRelease_n(v65, 2LL);

    sub_1000051A8();
    sub_1000231B8();
  }

  uint64_t v81 = v1 + 1024;
  if (v78)
  {
    if (v65 < 0) {
      uint64_t v83 = v65;
    }
    else {
      uint64_t v83 = v65 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_1000142C0();
    uint64_t v84 = _CocoaArrayWrapper.endIndex.getter(v83);
    sub_1000142B8();
    if (v84) {
      goto LABEL_45;
    }
LABEL_50:
    uint64_t v85 = v74[2];
    sub_1000232AC();
    uint64_t v82 = v126;
    if (!v85) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }

  if (!*(void *)((v65 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
    goto LABEL_50;
  }
LABEL_45:
  sub_1000232AC();
  uint64_t v82 = v126;
LABEL_51:
  uint64_t v86 = *(void *)(v1 + 1536);
  uint64_t v87 = *(void *)(v1 + 1360);
  uint64_t v88 = *(void *)(v1 + 1128);
  uint64_t v89 = *(void **)(v1 + 1104);
  uint64_t v90 = (uint64_t *)(v88 + *(void *)(v1 + 1464));
  sub_100019050();
  uint64_t v91 = *(void **)(v88 + v87);
  uint64_t v92 = *v90;
  uint64_t v93 = v90[1];
  uint64_t v94 = *(void **)(v88 + v86);
  id v95 = v91;
  sub_1000234D8();
  uint64_t v96 = v94;
  sub_10001889C(v95, v65, v82, v89, v92, v93, v96);

  uint64_t v81 = v1 + 1024;
  sub_1000232AC();

LABEL_52:
  uint64_t v97 = *(void *)(v1 + 1464);
  uint64_t v98 = *(void *)(v1 + 1128);
  sub_1000142B8();
  sub_1000051A8();
  uint64_t v99 = *(void *)(v98 + v97 + 8);
  *(void *)(v1 + 1008) = *(void *)(v98 + v97);
  *(void *)(v1 + 1016) = v99;
  *(void *)(v1 + 1024) = 45LL;
  *(void *)(v1 + 1032) = 0xE100000000000000LL;
  uint64_t v100 = (void *)objc_opt_self(&OBJC_CLASS___SFUtilities);
  *(void *)(v1 + 1040) = 95LL;
  *(void *)(v1 + 1048) = 0xE100000000000000LL;
  unint64_t v101 = sub_10000BAC4();
  uint64_t v102 = 1LL;
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v81,  v1 + 1040,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v101,  v101,  v101);
  uint64_t v104 = v103;
  NSString v105 = String._bridgeToObjectiveC()();
  sub_10000E13C();
  id v106 = [v100 speechProfileDateLastModifiedForLanguage:v105];
  sub_10002356C();
  if (v104)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v104);

    uint64_t v102 = 0LL;
  }

  uint64_t v108 = *(void *)(v1 + 1504);
  BOOL v109 = *(void **)(v1 + 1480);
  double v110 = *(double *)(v1 + 1416);
  uint64_t v111 = *(void *)(v1 + 1152);
  uint64_t v112 = *(char **)(v1 + 1128);
  uint64_t v113 = (uint64_t)&v112[*(void *)(v1 + 1368)];
  sub_1000106E8(v111, v102, v107, *(void *)(v1 + 1376));
  sub_1000106FC(v113, v1 + 888);
  sub_10002311C(v111, v113, &qword_10005C200);
  swift_endAccess(v1 + 888);
  mach_continuous_time();
  sub_10002331C();
  sub_100005FCC(v114, v115, v116, v117, v118, v119);
  id v121 = sub_10002342C(v120, "processInfo");
  [v121 systemUptime];
  double v123 = v122;

  swift_setDeallocating(v127);
  *(double *)&v112[OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelLoadTime] = v123 - v110;

  swift_release(v108);
  sub_1000142B8();
  return swift_asyncLet_finish(v1 + 16, v1 + 992, sub_100017F84, v1 + 848);
}

uint64_t sub_100017F84()
{
  return sub_1000231DC((uint64_t)sub_100017F90);
}

uint64_t sub_100017F90()
{
  uint64_t v1 = *(void *)(v0 + 1472);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
  uint64_t v3 = *(void **)(v0 + 1432);
  unint64_t v4 = *(void **)(v0 + 1424);
  uint64_t v5 = *(void *)(v0 + 1296);
  uint64_t v16 = *(void *)(v0 + 1320);
  uint64_t v17 = *(void *)(v0 + 1288);
  uint64_t v18 = *(void *)(v0 + 1280);
  uint64_t v19 = *(void *)(v0 + 1272);
  uint64_t v20 = *(void *)(v0 + 1248);
  uint64_t v21 = *(void *)(v0 + 1240);
  uint64_t v22 = *(void *)(v0 + 1232);
  uint64_t v23 = *(void *)(v0 + 1224);
  uint64_t v6 = *(void *)(v0 + 1208);
  uint64_t v7 = *(void *)(v0 + 1192);
  uint64_t v24 = *(void *)(v0 + 1216);
  uint64_t v25 = *(void *)(v0 + 1184);
  uint64_t v26 = *(void *)(v0 + 1176);
  uint64_t v27 = *(void *)(v0 + 1152);
  uint64_t v28 = *(void *)(v0 + 1144);
  uint64_t v8 = *(void *)(v0 + 1128);
  id v15 = *(void **)(v0 + 1112);
  uint64_t v9 = *(void **)(v0 + 1104);
  Class v13 = *(void **)(v0 + 1096);
  uint64_t v14 = *(void **)(v0 + 1088);

  v2(v6, v7);
  sub_100022E60(v5, (uint64_t *)&unk_10005BFB0);
  swift_release(v1);
  uint64_t v10 = sub_100019050();
  *(void *)(v0 + 976) = v8;
  *(void *)(v0 + 984) = v10;
  id v11 = objc_msgSendSuper2((objc_super *)(v0 + 976), "init");

  swift_release(v1);
  swift_task_dealloc(v16);
  sub_100023600();
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  sub_100023650();
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  return (*(uint64_t (**)(id))(v0 + 8))(v11);
}

uint64_t sub_100018158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(void *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      uint64_t v12 = v11[1];
      BOOL v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0LL) & 1) != 0) {
        return 1LL;
      }
      uint64_t v15 = ~v7;
      unint64_t v16 = (v8 + 1) & v15;
      if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
      {
        while (1)
        {
          uint64_t v17 = (void *)(v10 + 16 * v16);
          uint64_t v18 = v17[1];
          BOOL v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v16 = (v16 + 1) & v15;
          if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_10001828C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40)),
        uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32),
        unint64_t v6 = v4 & ~v5,
        ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0))
  {
    uint64_t v7 = ~v5;
    do
    {
      sub_1000140E4(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v10);
      char v8 = static AnyHashable.== infix(_:_:)(v10, a1);
      sub_100014120((uint64_t)v10);
      if ((v8 & 1) != 0) {
        break;
      }
      unint64_t v6 = (v6 + 1) & v7;
    }

    while (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

uint64_t sub_100018360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  void v7[2] = a1;
  return swift_task_switch(sub_100018384, 0LL, 0LL);
}

uint64_t sub_100018384()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  *uint64_t v1 = sub_1000183C8(*(void **)(v0 + 24), *(void *)(v0 + 32));
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000183C8(void *a1, uint64_t a2)
{
  unint64_t v5 = v4;
  sub_100008FD4(v6, v4);
  if (v5 >> 60 == 15)
  {
    sub_100022644(a1, (SEL *)&selRef_contextualStrings);
    if (v7)
    {
      uint64_t v8 = *(void *)(v7 + 16);
      swift_bridgeObjectRelease(v7);
      if (v8) {
        goto LABEL_8;
      }
    }

    uint64_t v9 = sub_100022688(a1);
    if (v9)
    {
      uint64_t v10 = v9;
      if ((unint64_t)v9 >> 62)
      {
        if (v9 >= 0) {
          v9 &= 0xFFFFFFFFFFFFFF8uLL;
        }
        uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v9);
      }

      else
      {
        uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      }

      swift_bridgeObjectRelease(v10);
      if (v11)
      {
LABEL_8:
        if (qword_10005A200 != -1) {
          swift_once(&qword_10005A200, sub_10000348C);
        }
        mach_continuous_time();
        sub_100003B3C();
        sub_100022644(a1, (SEL *)&selRef_contextualStrings);
        if (v12) {
          BOOL v13 = v12;
        }
        else {
          BOOL v13 = _swiftEmptyArrayStorage;
        }
        uint64_t v14 = sub_100022688(a1);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = (uint64_t)_swiftEmptyArrayStorage;
        }
        unint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___NSString);
        uint64_t v17 = URL.pathComponents.getter(v16);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        id v19 = objc_msgSend(v16, "pathWithComponents:", isa, swift_bridgeObjectRelease(v17).n128_f64[0]);

        uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
        uint64_t v22 = v21;

        id v23 = sub_10001CBB4( *(void *)(a2 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language),  *(void *)(a2 + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_language + 8),  v20,  v22);
        id v24 = v23;
        if (v23)
        {
          if (v13[2])
          {
            id v24 = v23;
            swift_bridgeObjectRelease(v22);
            swift_bridgeObjectRelease(v15);
            Class v25 = Array._bridgeToObjectiveC()().super.isa;
            [v24 createInlineLmeUserDataForContextStrings:v25];

            sub_100022600(v24, (SEL *)&selRef_dataProfile);
            uint64_t v27 = v26;

LABEL_36:
            mach_continuous_time();
            sub_100003C60();
            swift_bridgeObjectRelease(v13);

            return v27;
          }

          if ((unint64_t)v15 >> 62)
          {
            if (v15 < 0) {
              uint64_t v35 = v15;
            }
            else {
              uint64_t v35 = v15 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain(v15);
            uint64_t v36 = _CocoaArrayWrapper.endIndex.getter(v35);
            swift_bridgeObjectRelease(v15);
            if (v36) {
              goto LABEL_27;
            }
          }

          else if (*(void *)((v15 & 0xFFFFFFFFFFFFF8LL) + 0x10))
          {
LABEL_27:
            uint64_t v27 = sub_10001D188(v15, v20, v22, v24);
            swift_bridgeObjectRelease(v22);
            swift_bridgeObjectRelease(v15);
            goto LABEL_36;
          }
        }

        swift_bridgeObjectRelease(v22);
        swift_bridgeObjectRelease(v15);
        uint64_t v27 = 0LL;
        goto LABEL_36;
      }
    }

    return 0LL;
  }

  else
  {
    if (qword_10005A210 != -1) {
      swift_once(&qword_10005A210, sub_100005278);
    }
    uint64_t v28 = type metadata accessor for Logger(0LL);
    uint64_t v29 = sub_100004C5C(v28, (uint64_t)qword_10005C710);
    id v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v32 = static os_log_type_t.debug.getter(v30, v31);
    if (os_log_type_enabled(v30, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  v32,  "Configuring recognizer with provided jitProfileData rather than building JIT LME from contextual strings or cont extualNamedEntities",  v33,  2u);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    sub_100022600(a1, (SEL *)&selRef_jitProfileData);
    return v34;
  }

uint64_t sub_1000187D4(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 16);
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v3 = v1;
  if (v1 == 1)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = EtiquetteReplacementsForLanguage(v4);

    if (v5)
    {
      uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v5,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
    }

    else
    {
      uint64_t v3 = 0LL;
    }

    swift_beginAccess(v2, v8, 1LL, 0LL);
    uint64_t v6 = *v2;
    *uint64_t v2 = v3;
    swift_bridgeObjectRetain(v3);
    sub_100023170(v6);
  }

  sub_100023180(v1);
  return v3;
}

void sub_10001889C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, os_log_s *a7)
{
  unint64_t v11 = v10;
  sub_100008FD4(v12, v10);
  if (v11 >> 60 == 15)
  {
    os_log_t oslog = a7;
    if (qword_10005A200 != -1) {
      swift_once(&qword_10005A200, sub_10000348C);
    }
    uint64_t v13 = mach_continuous_time();
    sub_1000059C4("ES: AOT Profile Load", 20LL, 2, 0LL, 0xE000000000000000LL, v13);
    if (qword_10005A210 != -1) {
      swift_once(&qword_10005A210, sub_100005278);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    sub_100004C5C(v14, (uint64_t)qword_10005C710);
    id v15 = a1;
    swift_bridgeObjectRetain_n(a2, 2LL);
    id v16 = v15;
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v19 = 134218240;
      id v20 = [v16 count];

      *(void *)&v50[0] = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v50, (char *)v50 + 8, v19 + 4);

      *(_WORD *)(v19 + 12) = 2048;
      if ((unint64_t)a2 >> 62)
      {
        if (a2 < 0) {
          uint64_t v43 = a2;
        }
        else {
          uint64_t v43 = a2 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(a2);
        uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v43);
        swift_bridgeObjectRelease(a2);
      }

      else
      {
        uint64_t v21 = *(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }

      swift_bridgeObjectRelease(a2);
      *(void *)&v50[0] = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v50, (char *)v50 + 8, v19 + 14);
      swift_bridgeObjectRelease(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "MUX: %ld speech profiles are cached. %ld are available to be loaded",  (uint8_t *)v19,  0x16u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    uint64_t v27 = (void *)objc_opt_self(&OBJC_CLASS___SFUtilities);
    NSString v28 = String._bridgeToObjectiveC()();
    [v27 loadSpeechProfiles:v16 language:v28];

    id v29 = [v16 allKeys];
    uint64_t v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v29, (char *)&type metadata for Any + 8);

    sub_100014D68(v30, &v48);
    swift_bridgeObjectRelease(v30);
    if (!v49) {
      goto LABEL_25;
    }
    sub_100022C10(&v48, v50);
    swift_dynamicCast(v47, v50, (char *)&type metadata for Any + 8, &type metadata for String, 7LL);
    __int128 v31 = v47[0];
    uint64_t v32 = swift_bridgeObjectRetain_n(*((void *)&v47[0] + 1), 2LL);
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v35 = static os_log_type_t.debug.getter(v33, v34);
    if (os_log_type_enabled(v33, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v37 = swift_slowAlloc(32LL, -1LL);
      *(void *)&v50[0] = v37;
      *(_DWORD *)uint64_t v36 = 136380675;
      swift_bridgeObjectRetain(*((void *)&v31 + 1));
      *(void *)&__int128 v48 = sub_100026B8C(v31, *((unint64_t *)&v31 + 1), (uint64_t *)v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 8, v36 + 4);
      swift_bridgeObjectRelease_n(*((void *)&v31 + 1), 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v33,  v35,  "Configuring recognizer with speech profile at path: %{private}s",  v36,  0xCu);
      swift_arrayDestroy(v37, 1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(*((void *)&v31 + 1), 2LL);
    }

    NSString v38 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(*((void *)&v31 + 1));
    id v39 = [v16 objectForKey:v38];

    if (v39)
    {
      _bridgeAnyObjectToAny(_:)(v47, v39);
      swift_unknownObjectRelease(v39);
    }

    else
    {
      memset(v47, 0, sizeof(v47));
    }

    sub_100023144((uint64_t)v47, (uint64_t)&v48, &qword_10005C1C0);
    if (v49)
    {
      sub_100022C10(&v48, v50);
      uint64_t v40 = sub_1000091B8(0LL, (unint64_t *)&unk_10005C1C8, &OBJC_CLASS____EARUserProfileContainer_ptr);
      swift_dynamicCast(&v46, v50, (char *)&type metadata for Any + 8, v40, 7LL);
      uint64_t v41 = v46;
      -[os_log_s setUserProfile:](oslog, "setUserProfile:", v46);
    }

    else
    {
LABEL_25:
      sub_100022E60((uint64_t)&v48, &qword_10005C1C0);
    }

    uint64_t v42 = mach_continuous_time();
    sub_100005FCC("ES: AOT Profile Load", 20LL, 2, 0LL, 0xE000000000000000LL, v42);
  }

  else
  {
    if (qword_10005A210 != -1) {
      swift_once(&qword_10005A210, sub_100005278);
    }
    uint64_t v22 = type metadata accessor for Logger(0LL);
    uint64_t v23 = sub_100004C5C(v22, (uint64_t)qword_10005C710);
    osloga = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.debug.getter(osloga, v24);
    if (os_log_type_enabled(osloga, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  osloga,  v25,  "Configuring recognizer with provided userProfileData rather than loading speech profiles",  v26,  2u);
      swift_slowDealloc(v26, -1LL, -1LL);
    }
  }

id sub_100018EC0()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_sandboxExtensionHandles];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_10000BCC0();
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if (*(void *)(v1 + 8 * i + 32) != -1LL) {
        sandbox_extension_release();
      }
    }

    sub_1000051A8();
  }

  v5.receiver = v0;
  v5.super_class = (Class)sub_100019050();
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_100019050()
{
  return type metadata accessor for EARSpeechRecognizer(0LL);
}

uint64_t type metadata accessor for EARSpeechRecognizer(uint64_t a1)
{
  uint64_t result = qword_10005C098;
  if (!qword_10005C098) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EARSpeechRecognizer);
  }
  return result;
}

void sub_100019094(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v138 = a3;
  unint64_t ObjectType = swift_getObjectType(v4);
  uint64_t v8 = type metadata accessor for TaskPriority(0LL);
  uint64_t v133 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v132 - v10;
  uint64_t v12 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v134 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v132 - v16;
  *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_cpuInstructionsUsedAtStart) = 0LL;
  id v18 = sub_1000231B0(v15, "taskNames");
  uint64_t v19 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v18,  &type metadata for String,  &protocol witness table for String);

  uint64_t v141 = sub_100014D88(v19);
  uint64_t v21 = v20;
  sub_1000232AC();
  uint64_t v140 = v21;
  if (!v21)
  {
    __break(1u);
    goto LABEL_88;
  }

  uint64_t v136 = v4;
  uint64_t v137 = a2;
  uint64_t v22 = *(void *)(v4 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_assets);
  id v23 = [a2 asrID];
  if (v23)
  {
    uint64_t v24 = v23;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v26 = sub_100005154();
    uint64_t v27 = 0LL;
  }

  else
  {
    uint64_t v26 = type metadata accessor for UUID(0LL);
    uint64_t v27 = 1LL;
  }

  NSString v28 = v138;
  sub_1000106E8((uint64_t)v17, v27, v25, v26);
  uint64_t v135 = sub_1000183C8(v28, v22);
  unint64_t ObjectType = v29;
  sub_100022E60((uint64_t)v17, (uint64_t *)&unk_10005BFB0);
  if (a4)
  {
    id v31 = a4;
    unint64_t v32 = (unint64_t)[v31 priority];
    if ((v32 & 0x8000000000000000LL) == 0)
    {
      if (v32 < 0x100)
      {
        TaskPriority.init(rawValue:)(v32);
        TaskPriority.init(rawValue:)(21LL);
        static TaskPriority.> infix(_:_:)(v11);

        uint64_t v33 = *(void (**)(uint64_t))(v133 + 8);
        uint64_t v34 = sub_1000232CC();
        v33(v34);
        uint64_t v30 = ((uint64_t (*)(char *, uint64_t))v33)(v11, v8);
        NSString v28 = v138;
        goto LABEL_9;
      }

      sub_100010594();
      uint64_t v130 = "Not enough bits to represent the passed value";
      uint64_t v131 = 45LL;
LABEL_90:
      sub_1000106F0((uint64_t)"Fatal error", 11LL, 2LL, (uint64_t)v130, v131, v129, (uint64_t)"Swift/Integers.swift");
      __break(1u);
      return;
    }

LABEL_88:
    sub_100010594();
    uint64_t v130 = "Negative value is not representable";
    uint64_t v131 = 35LL;
    goto LABEL_90;
  }

LABEL_9:
  os_log_type_t v35 = *(void **)(v136 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  id v36 = sub_1000231B0(v30, "flags");
  id v37 = sub_10002321C((uint64_t)v36, "setAllowUtteranceDelay:");
  if (!a4 || (sub_10002361C((uint64_t)v37, (SEL *)&selRef_aneContext), !v38))
  {
    sub_10002339C();
    sub_10002379C();
  }

  NSString v39 = sub_10000BC7C();
  sub_1000051A8();
  sub_10002326C(v35, "setAneContext:");

  id v41 = sub_1000231B0(v40, "modelOptions");
  if (v41)
  {
    uint64_t v42 = v41;
    [v41 atypicalSpeech];
  }

  sub_10002369C((uint64_t)v41, "setAtypicalSpeech:");
  id v43 = sub_10002321C((uint64_t)[a1 concatenateUtterances], "setConcatenateUtterances:");
  if (!a4 || (sub_10002361C((uint64_t)v43, (SEL *)&selRef_cpuContext), !v44))
  {
    sub_10002339C();
    sub_10002379C();
  }

  NSString v45 = sub_10000BC7C();
  sub_1000051A8();
  sub_10002326C(v35, "setCpuContext:");

  id v46 = sub_10002321C((uint64_t)[a1 isSingleUtteranceTask], "setDetectUtterances:");
  id v47 = sub_1000231B0((uint64_t)v46, "flags");
  id v48 = sub_10002321C((uint64_t)v47, "setDisableAutoPunctuation:");
  id v49 = sub_1000231B0((uint64_t)v48, "flags");
  id v50 = sub_10002321C((uint64_t)v49, "setDisablePartialResults:");
  id v51 = sub_1000231B0((uint64_t)v50, "flags");
  id v52 = sub_10002321C((uint64_t)v51, "setEnableVoiceCommands:");
  id v53 = sub_1000231B0((uint64_t)v52, "detectionOptions");
  if (v53)
  {
    id v54 = v53;
    [v53 detectAfterTime];
    double v56 = v55;
  }

  else
  {
    double v56 = 0.0;
  }

  id v57 = sub_1000231B0((uint64_t)[v35 setEndpointStart:v56], "modelOptions");
  if (v57)
  {
    uint64_t v58 = v57;
    [v57 farField];
  }

  id v59 = sub_10002369C((uint64_t)v57, "setFarField:");
  id v60 = sub_1000231B0((uint64_t)v59, "flags");
  id v61 = sub_10002321C((uint64_t)v60, "setFormatAcrossUtterances:");
  if (!a4 || (sub_10002361C((uint64_t)v61, (SEL *)&selRef_gpuContext), !v62))
  {
    sub_10002339C();
    sub_10002379C();
  }

  NSString v63 = sub_10000BC7C();
  sub_1000051A8();
  sub_10002326C(v35, "setGpuContext:");

  sub_10002321C(v64, "setHighPriority:");
  sub_100022750(v137, (SEL *)&selRef_inputOrigin);
  sub_1000233F4(v65, v66);
  NSString v67 = sub_10000BC7C();
  uint64_t v68 = sub_1000051A8();
  sub_1000232B4(v68, "setInputOrigin:");

  if (ObjectType >> 60 != 15)
  {
    sub_100022BCC(v135, ObjectType);
    sub_100023738();
    Data._bridgeToObjectiveC()();
    sub_1000235BC();
  }

  sub_100023388(v35, "setJitProfileData:");

  sub_100023794(v69, (SEL *)&selRef_leftContext);
  if (v70) {
    id v71 = v70;
  }
  else {
    id v71 = _swiftEmptyArrayStorage;
  }
  Class isa = sub_10002378C().super.isa;
  uint64_t v73 = sub_1000051A8();
  sub_1000232B4(v73, "setLeftContext:");

  id v75 = sub_1000231B0(v74, "flags");
  id v76 = sub_10002321C((uint64_t)v75, "setRecognizeEagerCandidates:");
  id v77 = sub_1000231B0((uint64_t)v76, "flags");
  id v78 = sub_10002321C((uint64_t)v77, "setRecognizeEmoji:");
  sub_100023794((uint64_t)v78, (SEL *)&selRef_rightContext);
  if (v79)
  {
    if (*(void *)(v79 + 16))
    {
      id v71 = *(void **)(v79 + 40);
      sub_10000BCC0();
    }

    else
    {
      sub_100023720();
    }

    sub_1000231B8();
  }

  else
  {
    sub_100023720();
  }

  NSString v80 = sub_10000BC7C();
  uint64_t v81 = sub_1000051A8();
  sub_1000232B4(v81, "setRightContext:");

  sub_100023794(v82, (SEL *)&selRef_selectedText);
  if (v83)
  {
    if (*(void *)(v83 + 16))
    {
      id v71 = *(void **)(v83 + 40);
      sub_10000BCC0();
    }

    else
    {
      sub_100023720();
    }

    sub_1000231B8();
  }

  else
  {
    sub_100023720();
  }

  NSString v84 = sub_10000BC7C();
  uint64_t v85 = sub_1000051A8();
  sub_1000232B4(v85, "setSelectedText:");

  id v87 = sub_1000231B0(v86, "flags");
  sub_10002321C((uint64_t)v87, "setShouldGenerateVoiceCommandCandidates:");
  sub_100022600(v28, (SEL *)&selRef_profileData);
  if (v88 >> 60 == 15)
  {
    id v71 = 0LL;
  }

  else
  {
    Data._bridgeToObjectiveC()();
    sub_1000235BC();
  }

  sub_100023388(v35, "setUserProfileData:");

  id v89 = [v35 activeConfiguration];
  uint64_t v144 = sub_1000226F4(v89);
  if (v144)
  {
    uint64_t v90 = v140;
    sub_10000BCC0();
    sub_100020714(&v142, v141, v90);
    if (v144)
    {
      v91.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
      sub_10000E13C();
    }

    else
    {
      v91.super.Class isa = 0LL;
    }

    sub_100023388(v89, "setTaskTypeFilter:");

    *(void *)&double v92 = swift_bridgeObjectRelease(v143).n128_u64[0];
  }

  else
  {
    [v89 setTaskTypeFilter:0];
  }

  id v93 = sub_1000231B0((uint64_t)objc_msgSend(v35, "setActiveConfiguration:", v89, v92), "modelOptions");
  if (v93 && (uint64_t v94 = sub_100022408(v93)) != 0)
  {
    uint64_t v95 = v94;
  }

  else
  {
    uint64_t v94 = sub_10002339C();
    uint64_t v95 = (uint64_t)_swiftEmptyArrayStorage;
  }

  id v96 = sub_1000231B0(v94, "modelOptions");
  if (v96 && (uint64_t v97 = sub_10002239C(v96)) != 0)
  {
    uint64_t v98 = v97;
  }

  else
  {
    uint64_t v98 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
    uint64_t v97 = sub_10002339C();
  }

  id v99 = sub_1000231B0(v97, "modelOptions");
  if (v99)
  {
    uint64_t v100 = v99;
    id v101 = [v99 speechProfileURLs];

    uint64_t v102 = type metadata accessor for URL(0LL);
    uint64_t v103 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v101, v102);
  }

  else
  {
    uint64_t v103 = _swiftEmptyArrayStorage;
  }

  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v104 = sub_10000706C();
  NSString v105 = (os_log_s *)sub_100004C5C(v104, (uint64_t)qword_10005C710);
  uint64_t v106 = swift_bridgeObjectRetain_n(v95, 2LL);
  Logger.logObject.getter(v106);
  os_log_type_t v107 = sub_1000070FC();
  unint64_t v108 = (unint64_t)v95 >> 62;
  if (sub_100023638(v107))
  {
    BOOL v109 = (uint8_t *)sub_100007000(12LL);
    *(_DWORD *)BOOL v109 = 134217984;
    if (v108)
    {
      if (v95 < 0) {
        uint64_t v128 = v95;
      }
      else {
        uint64_t v128 = v95 & 0xFFFFFFFFFFFFFF8LL;
      }
      sub_10002355C();
      uint64_t v110 = _CocoaArrayWrapper.endIndex.getter(v128);
      sub_1000231B8();
    }

    else
    {
      uint64_t v110 = *(void *)((v95 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    sub_1000231B8();
    uint64_t v142 = v110;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v142, &v143, v109 + 4);
    sub_1000231B8();
    sub_1000070D8( (void *)&_mh_execute_header,  v105,  v107,  "MUX: EARSpeechRecognizer prepareForReuse speechProfileContainers size=%ld",  v109);
    sub_100006FF4((uint64_t)v109);
  }

  else
  {

    swift_bridgeObjectRelease_n(v95, 2LL);
  }

  if (v108)
  {
    if (v95 < 0) {
      uint64_t v127 = v95;
    }
    else {
      uint64_t v127 = v95 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_10002355C();
    uint64_t v111 = _CocoaArrayWrapper.endIndex.getter(v127);
    sub_1000231B8();
  }

  else
  {
    uint64_t v111 = *(void *)((v95 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v112 = v136;
  if (v111)
  {
    sub_100023380();
LABEL_74:
    sub_100019050();
    uint64_t v114 = *(void *)(v112 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr);
    uint64_t v115 = *(void *)(v112 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_languageStr + 8);
    id v116 = *(id *)(v112 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles);
    sub_1000142C0();
    sub_10001889C(v116, v95, v98, v138, v114, v115, (os_log_s *)v35);

    sub_1000142B8();
    goto LABEL_75;
  }

  uint64_t v113 = v103[2];
  sub_100023380();
  if (v113) {
    goto LABEL_74;
  }
LABEL_75:
  sub_1000051A8();
  sub_1000231B8();
  uint64_t v117 = *(void *)(v112 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface);
  id v118 = [v137 asrID];
  if (v118)
  {
    uint64_t v119 = v118;
    uint64_t v120 = (uint64_t)v134;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v121 = 0LL;
  }

  else
  {
    uint64_t v121 = 1LL;
    uint64_t v120 = (uint64_t)v134;
  }

  uint64_t v122 = sub_100005154();
  sub_1000106E8(v120, v121, v123, v122);
  sub_1000106FC(v117 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_asrId, (uint64_t)&v142);
  uint64_t v124 = sub_1000232CC();
  sub_10002311C(v124, v125, v126);
  swift_endAccess(&v142);
  sub_1000143C4(v141, v140);
  sub_100008FD4(v135, ObjectType);
}

void sub_100019C98(uint64_t a1, void (**a2)(void, void))
{
  id v3 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) modelInfo];
  id v4 = [v3 samplingRates];

  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v4,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v25 = a2;
    unint64_t v32 = _swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v6);
    int64_t v7 = sub_100022DE0(v5);
    int v9 = v8;
    char v11 = v10 & 1;
    while ((v7 & 0x8000000000000000LL) == 0 && v7 < 1LL << *(_BYTE *)(v5 + 32))
    {
      if (*(_DWORD *)(v5 + 36) != v9) {
        goto LABEL_13;
      }
      uint64_t v12 = sub_1000140E4(*(void *)(v5 + 48) + 40 * v7, (uint64_t)v29);
      v27[0] = v29[0];
      v27[1] = v29[1];
      uint64_t v28 = v30;
      AnyHashable.base.getter(v26, v12);
      uint64_t v13 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
      swift_dynamicCast(&v31, v26, (char *)&type metadata for Any + 8, v13, 7LL);
      uint64_t v14 = sub_100014120((uint64_t)v27);
      uint64_t v15 = v31;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
      uint64_t v16 = v32[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
      uint64_t v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v15);
      specialized ContiguousArray._endMutation()(v17);
      int64_t v18 = sub_100022C7C(v7, v9, v11 & 1, v5);
      int64_t v7 = v18;
      int v9 = v19;
      char v11 = v20 & 1;
      if (!--v6)
      {
        sub_100014154(v18, v19, v20 & 1);
        uint64_t v21 = v32;
        swift_bridgeObjectRelease(v5);
        a2 = v25;
        goto LABEL_10;
      }
    }

    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRelease(v5);
    uint64_t v21 = _swiftEmptyArrayStorage;
LABEL_10:
    sub_100014F24((uint64_t)v21);
    uint64_t v23 = v22;
    sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
    sub_100022E98(&qword_10005C208, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    ((void (**)(void, Class))a2)[2](a2, isa);
    swift_bridgeObjectRelease(v23);

    _Block_release(a2);
  }

void sub_100019F44( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void (**a8)(void, void, void))
{
  id v180 = a2;
  uint64_t v181 = a3;
  id v173 = a1;
  uint64_t v13 = type metadata accessor for Locale(0LL);
  __chkstk_darwin(v13);
  uint64_t v179 = (char *)&v153 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for String.LocalizationValue(0LL);
  __chkstk_darwin(v15);
  char v178 = (char *)&v153 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for String.LocalizationValue.StringInterpolation(0LL);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v153 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_100004B88(&qword_10005C200);
  __chkstk_darwin(v20);
  uint64_t v165 = (uint64_t)&v153 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v166 = type metadata accessor for Date(0LL);
  v167 = *(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v164 = (uint64_t)&v153 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v172 = (char *)&v153 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v153 - v27;
  __chkstk_darwin(v26);
  uint64_t v171 = (uint64_t)&v153 - v29;
  uint64_t v175 = type metadata accessor for UUID(0LL);
  uint64_t v30 = *(void *)(v175 - 8);
  uint64_t v31 = __chkstk_darwin(v175);
  char v168 = (char *)&v153 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v31);
  v170 = (char *)&v153 - v33;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v34 = type metadata accessor for Logger(0LL);
  uint64_t v35 = sub_100004C5C(v34, (uint64_t)qword_10005C710);
  id v36 = (os_log_s *)Logger.logObject.getter(v35);
  os_log_type_t v38 = static os_log_type_t.debug.getter(v36, v37);
  BOOL v39 = os_log_type_enabled(v36, v38);
  uint64_t v169 = v28;
  uint64_t v174 = v30;
  if (v39)
  {
    uint64_t v40 = swift_slowAlloc(12LL, -1LL);
    char v176 = a8;
    id v41 = (uint8_t *)v40;
    uint64_t v42 = swift_slowAlloc(32LL, -1LL);
    uint64_t v177 = a4;
    uint64_t v43 = v42;
    v184[0] = v42;
    *(_DWORD *)id v41 = 136315138;
    uint64_t v182 = sub_100026B8C(0xD000000000000042LL, 0x8000000100044E50LL, v184);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v182, v183, v41 + 4);
    _os_log_impl((void *)&_mh_execute_header, v36, v38, "EARSpeechRecognizer.%s", v41, 0xCu);
    swift_arrayDestroy(v43, 1LL);
    uint64_t v44 = v43;
    a4 = v177;
    swift_slowDealloc(v44, -1LL, -1LL);
    NSString v45 = v41;
    a8 = v176;
    swift_slowDealloc(v45, -1LL, -1LL);
  }

  v184[0] = (uint64_t)v180;
  v184[1] = v181;
  uint64_t v182 = 45LL;
  v183[0] = 0xE100000000000000LL;
  v185[0] = 95LL;
  v185[1] = 0xE100000000000000LL;
  unint64_t v46 = sub_10000BAC4();
  uint64_t v181 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v182,  v185,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v46,  v46,  v46);
  id v48 = v47;
  id v180 = *(id *)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  id v49 = [v180 modelInfo];
  id v50 = [v49 samplingRates];
  uint64_t v51 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v50,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

  uint64_t v182 = a6;
  AnyHashable.init<A>(_:)(v184, &v182, &type metadata for UInt, &protocol witness table for UInt);
  LOBYTE(v50) = sub_10001828C((uint64_t)v184, v51);
  swift_bridgeObjectRelease(v51);
  sub_100014120((uint64_t)v184);
  if ((v50 & 1) != 0)
  {
    id v52 = [v49 tasks];
    uint64_t v53 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v52,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

    uint64_t v182 = a4;
    v183[0] = (unint64_t)a5;
    swift_bridgeObjectRetain(a5);
    AnyHashable.init<A>(_:)(v184, &v182, &type metadata for String, &protocol witness table for String);
    LOBYTE(v52) = sub_10001828C((uint64_t)v184, v53);
    swift_bridgeObjectRelease(v53);
    sub_100014120((uint64_t)v184);
    if ((v52 & 1) != 0)
    {
      uint64_t v177 = a4;
      uint64_t v179 = (char *)OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo;
      id v54 =  [*(id *)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_clientInfo) asrID];
      char v176 = a8;
      if (v54)
      {
        double v55 = v54;
        double v56 = v168;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)(v54);

        id v57 = *(void (**)(uint64_t, char *, uint64_t))(v174 + 32);
        uint64_t v58 = v171;
        id v59 = v56;
        uint64_t v60 = v175;
        v57(v171, v59, v175);
        sub_100006CF0(v58, 0LL, 1LL, v60);
        if (sub_100004C10(v58, 1LL, v60) != 1)
        {
          v57((uint64_t)v170, (char *)v58, v60);
          uint64_t v61 = a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate;
          swift_beginAccess( a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_speechProfileLastModifiedDate,  &v182,  0LL,  0LL);
          uint64_t v62 = v165;
          sub_100022F50(v61, v165, &qword_10005C200);
          uint64_t v63 = v166;
          if (sub_100004C10(v62, 1LL, v166) == 1)
          {
            sub_100022E60(v62, &qword_10005C200);
            double v64 = 0.0;
          }

          else
          {
            uint64_t v81 = v164;
            uint64_t v82 = v167[4](v164, v62, v63);
            double v83 = Date.timeIntervalSinceNow.getter(v82);
            uint64_t v60 = v175;
            double v84 = v83;
            ((void (*)(uint64_t, uint64_t))v167[1])(v81, v63);
            double v64 = -v84;
          }

          uint64_t v85 = (uint64_t)v169;
          v167 = v48;
          char v168 = (char *)a6;
          if (qword_10005A200 != -1) {
            swift_once(&qword_10005A200, sub_10000348C);
          }
          char v178 = (char *)qword_10005C6F0;
          (*(void (**)(uint64_t, char *, uint64_t))(v174 + 16))(v85, v170, v60);
          sub_100006CF0(v85, 0LL, 1LL, v60);
          uint64_t v86 = v179;
          sub_100022794(*(id *)&v179[a7], (SEL *)&selRef_applicationName);
          if (v88) {
            uint64_t v89 = v87;
          }
          else {
            uint64_t v89 = 0LL;
          }
          uint64_t v166 = v89;
          unint64_t v90 = 0xE000000000000000LL;
          if (v88) {
            unint64_t v90 = v88;
          }
          unint64_t v163 = v90;
          uint64_t v91 = a7;
          id v92 = [v49 language];
          uint64_t v164 = static String._unconditionallyBridgeFromObjectiveC(_:)(v92);
          uint64_t v165 = v93;

          id v94 = [v49 version];
          uint64_t v161 = static String._unconditionallyBridgeFromObjectiveC(_:)(v94);
          uint64_t v162 = v95;

          int v157 = *(unsigned __int8 *)(v91
                                    + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_isHighQualityAsset);
          id v96 = *(void **)(v91 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion + 8);
          uint64_t v156 = *(void *)(v91 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_hammerModelVersion);
          uint64_t v160 = v96;
          uint64_t v97 = *(void **)(v91 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID + 8);
          uint64_t v159 = *(void *)(v91 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLMRegionID);
          v158 = v97;
          int v98 = *(unsigned __int8 *)(v91
                                   + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_geoLanguageModelLoaded);
          sub_100022794(*(id *)&v86[v91], (SEL *)&selRef_dictationUIInteractionID);
          uint64_t v100 = v99;
          uint64_t v102 = v101;
          uint64_t v171 = v91;
          LODWORD(v103) = *(unsigned __int8 *)(v91
                                             + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_atypicalSpeechEnabled);
          uint64_t v104 = mach_continuous_time();
          uint64_t v105 = v60;
          id v106 = [v180 leftContext];
          uint64_t v107 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v106, &type metadata for String);

          uint64_t v108 = *(void *)(v107 + 16);
          uint64_t v109 = v107;
          uint64_t v110 = v174;
          *(void *)&double v111 = swift_bridgeObjectRelease(v109).n128_u64[0];
          unsigned __int8 v112 = 0;
          if (!v108)
          {
            int v153 = v103;
            int v154 = v98;
            uint64_t v103 = v110;
            uint64_t v155 = a5;
            id v113 = v180;
            id v114 = objc_msgSend(v180, "rightContext", v111);
            uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
            unint64_t v117 = v116;

            *(void *)&double v118 = swift_bridgeObjectRelease(v117).n128_u64[0];
            uint64_t v119 = HIBYTE(v117) & 0xF;
            if ((v117 & 0x2000000000000000LL) == 0) {
              uint64_t v119 = v115 & 0xFFFFFFFFFFFFLL;
            }
            if (v119)
            {
              unsigned __int8 v112 = 0;
            }

            else
            {
              id v120 = objc_msgSend(v113, "selectedText", v118);
              uint64_t v121 = static String._unconditionallyBridgeFromObjectiveC(_:)(v120);
              unint64_t v123 = v122;

              swift_bridgeObjectRelease(v123);
              uint64_t v124 = HIBYTE(v123) & 0xF;
              if ((v123 & 0x2000000000000000LL) == 0) {
                uint64_t v124 = v121 & 0xFFFFFFFFFFFFLL;
              }
              unsigned __int8 v112 = v124 == 0;
            }

            a5 = v155;
            uint64_t v105 = v175;
            uint64_t v110 = v103;
            LOBYTE(v98) = v154;
            LOBYTE(v103) = v153;
          }

          unint64_t v152 = v104;
          char v151 = v103;
          uint64_t v150 = v100;
          char v149 = v98;
          uint64_t v125 = v162;
          uint64_t v126 = (uint64_t)v169;
          unint64_t v127 = v163;
          uint64_t v128 = v165;
          sub_100003D78( (uint64_t)v169,  v177,  (unint64_t)a5,  v166,  v163,  v164,  v165,  v161,  v64,  v162,  v157,  v156,  v160,  v159,  v158,  v149,  v150,  v102,  0LL,  (void *)0xE000000000000000LL,  v151,  v152,  v112);
          swift_bridgeObjectRelease(v127);
          swift_bridgeObjectRelease(v128);
          swift_bridgeObjectRelease(v125);
          swift_bridgeObjectRelease(v102);
          sub_100022E60(v126, (uint64_t *)&unk_10005BFB0);
          (*(void (**)(char *, uint64_t))(v110 + 8))(v170, v105);
          a7 = v171;
          a6 = (uint64_t)v168;
          uint64_t v60 = v105;
          id v48 = v167;
          goto LABEL_34;
        }
      }

      else
      {
        uint64_t v58 = v171;
        uint64_t v60 = v175;
        sub_100006CF0(v171, 1LL, 1LL, v175);
      }

      sub_100022E60(v58, (uint64_t *)&unk_10005BFB0);
LABEL_34:
      id v129 = [*(id *)&v179[a7] asrID];
      if (v129)
      {
        uint64_t v130 = v129;
        uint64_t v131 = (uint64_t)v172;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)(v129);

        uint64_t v132 = 0LL;
      }

      else
      {
        uint64_t v132 = 1LL;
        uint64_t v131 = (uint64_t)v172;
      }

      sub_100006CF0(v131, v132, 1LL, v60);
      uint64_t v133 = *(void **)(a7 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_modelContextDelegateInterface);
      id v134 = objc_allocWithZone((Class)type metadata accessor for EARSpeechRecognitionResultStream(0LL));
      id v135 = v133;
      id v136 = sub_1000237C8(v173, v131, v135);
      uint64_t v137 = a7;
      id v138 = v136;
      sub_100015860((uint64_t)v136);
      id v139 = v138;
      NSString v140 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v48);
      NSString v141 = String._bridgeToObjectiveC()();
      id v142 = [v180 runRecognitionWithResultStream:v139 language:v140 task:v141 samplingRate:a6];

      id v143 = [(id)objc_opt_self(NSXPCListener) anonymousListener];
      [v143 setDelegate:v137];
      [v143 activate];
      uint64_t v144 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
      unint64_t v145 = *(os_unfair_lock_s **)(v137
                                  + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock);
      swift_retain(v145);
      os_unfair_lock_lock(v145 + 4);
      swift_release(v145);
      id v146 = objc_allocWithZone((Class)type metadata accessor for EARSpeechRecognitionAudioBuffer());
      id v79 = v143;
      id v147 = v142;
      sub_10001D6B8(v147);
      swift_beginAccess( v137 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners,  v184,  33LL,  0LL);
      sub_10001F528();
      swift_endAccess(v184);

      v148 = *(os_unfair_lock_s **)(v137 + v144);
      swift_retain(v148);
      os_unfair_lock_unlock(v148 + 4);
      swift_release(v148);
      id v80 = [v79 endpoint];
      a8 = v176;
      ((void (**)(void, id, void))v176)[2](v176, v80, 0LL);

      id v49 = v147;
      goto LABEL_38;
    }
  }

  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(26LL, 3LL);
  v65._object = (void *)0x8000000100044E30LL;
  v65._uint64_t countAndFlagsBits = 0xD000000000000018LL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v65);
  v66._uint64_t countAndFlagsBits = a4;
  v66._object = a5;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v66);
  v67._uint64_t countAndFlagsBits = 32LL;
  v67._object = (void *)0xE100000000000000LL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v67);
  v68._uint64_t countAndFlagsBits = v181;
  v68._object = v48;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v68);
  swift_bridgeObjectRelease(v48);
  v69._uint64_t countAndFlagsBits = 32LL;
  v69._object = (void *)0xE100000000000000LL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v69);
  v184[0] = a6;
  String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)( v184,  1970039845LL,  0xE400000000000000LL,  &type metadata for UInt,  &protocol witness table for UInt);
  v70._uint64_t countAndFlagsBits = 0LL;
  v70._object = (void *)0xE000000000000000LL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v70);
  id v71 = v178;
  String.LocalizationValue.init(stringInterpolation:)(v19);
  if (qword_10005A288 != -1) {
    swift_once(&qword_10005A288, sub_100014C90);
  }
  uint64_t v72 = qword_10005C8F8;
  id v73 = (id)qword_10005C8F8;
  uint64_t v74 = v179;
  static Locale.current.getter(v73);
  uint64_t v75 = String.init(localized:table:bundle:locale:comment:)(v71, 0LL, 0LL, v72, v74, 0LL, 0LL, 256LL);
  uint64_t v77 = v76;
  uint64_t v78 = static SFSpeechErrorCode.noModel.getter(v75);
  id v79 = (id)related decl 'e' for SFSpeechErrorCode.init(_:description:)(v78, v75, v77);
  id v80 = (id)_convertErrorToNSError(_:)(v79);
  ((void (**)(void, void, id))a8)[2](a8, 0LL, v80);
LABEL_38:

  _Block_release(a8);
}

BOOL sub_10001AEF4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock;
  uint64_t v6 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListenerLock);
  swift_retain(v6);
  os_unfair_lock_lock(v6 + 4);
  swift_release(v6);
  sub_1000106FC(v2 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_audioBufferListeners, (uint64_t)v17);
  int64_t v7 = (void *)sub_10001F228();
  swift_endAccess(v17);
  int v8 = *(os_unfair_lock_s **)(v3 + v5);
  sub_100023554();
  os_unfair_lock_unlock(v8 + 4);
  sub_1000070C4();
  if (v7)
  {
    int v9 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
    id v10 = v7;
    id v11 = [v9 interfaceWithProtocol:&OBJC_PROTOCOL____SFXPCEARSpeechRecognitionAudioBuffer];
    sub_1000092C8((uint64_t)v11, "setExportedInterface:");

    sub_10002326C(a2, "setExportedObject:");
    uint64_t v12 = sub_100005124((uint64_t)&unk_100051950);
    *(void *)(v12 + 16) = v10;
    v17[4] = sub_100022B94;
    v17[5] = v12;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256LL;
    v17[2] = sub_100015138;
    v17[3] = &unk_100051968;
    uint64_t v13 = _Block_copy(v17);
    id v14 = v10;
    uint64_t v15 = sub_1000234F8();
    sub_1000092C8(v15, "setInvalidationHandler:");
    _Block_release(v13);
    [a2 activate];
  }

  return v7 != 0LL;
}

double sub_10001B114()
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    uint64_t v5 = v1;
    sub_10001EB98(0, v4, 0);
    uint64_t v6 = (void *)(v5 + 40);
    do
    {
      uint64_t v7 = String.utf8CString.getter(*(v6 - 1), *v6);
      sub_10002329C();
      uint64_t v8 = sandbox_extension_consume(v7 + 32);
      sub_10000E13C();
      swift_release(v7);
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      if (v10 >= v9 >> 1) {
        sub_10001EB98(v9 > 1, v10 + 1, 1);
      }
      v6 += 2;
      _swiftEmptyArrayStorage[2] = v10 + 1;
      _swiftEmptyArrayStorage[v10 + 4] = v8;
      --v4;
    }

    while (v4);
  }

  id v11 = *(void **)(v0 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  uint64_t v12 = *(void *)(v3 + 16);
  if (v12)
  {
    uint64_t v30 = *(void *)(v0 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
    sub_10002355C();
    uint64_t v13 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v14 = *(v13 - 1);
      uint64_t v15 = *v13;
      objc_allocWithZone(&OBJC_CLASS____EARAppLmArtifact);
      sub_100023644();
      sub_10001E33C(v14, v15, (SEL *)&selRef_initWithPath_);
      if (v16)
      {
        uint64_t v17 = v16;
        id v18 = [v16 loadLmHandle];
        sub_1000142B8();

        if (v18)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v19);
          unint64_t v21 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v20 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v21 >= v20 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1);
          }
          uint64_t v22 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v18);
          specialized Array._endMutation()(v22);
        }
      }

      else
      {
        sub_1000142B8();
      }

      v13 += 2;
      --v12;
    }

    while (v12);
    sub_1000231B8();
  }

  id v23 = objc_msgSend(v11, "extraLmList", v30);
  sub_1000092E0((uint64_t)v23, (unint64_t *)&qword_10005C670, &OBJC_CLASS____EARLmHandle_ptr);
  uint64_t v24 = sub_100023738();
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);

  sub_10001B3B0((uint64_t)_swiftEmptyArrayStorage);
  sub_100023738();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  sub_10000E13C();
  sub_10002326C(v11, "setExtraLmList:");

  uint64_t v27 = _swiftEmptyArrayStorage[2];
  if (v27)
  {
    sub_10000BCC0();
    for (uint64_t i = 0LL; i != v27; ++i)
    {
      if (_swiftEmptyArrayStorage[i + 4] != -1LL) {
        sandbox_extension_release();
      }
    }

    sub_1000051A8();
  }

  *(void *)&double result = swift_bridgeObjectRelease(_swiftEmptyArrayStorage).n128_u64[0];
  return result;
}

void sub_10001B3B0(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v4 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    if (v4 < 0) {
      uint64_t v17 = *v1;
    }
    else {
      uint64_t v17 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v1);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_30;
  }

  uint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *uint64_t v1 = v4;
  uint64_t v5 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000LL) == 0 && (v4 & 0x4000000000000000LL) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1LL;
  }

  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1LL, v4);
    swift_bridgeObjectRelease(*v1);
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
LABEL_16:
    sub_100022870(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0) {
      uint64_t v18 = v4;
    }
    else {
      uint64_t v18 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }

  if (v11 < 1) {
    goto LABEL_20;
  }
  uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  BOOL v13 = __OFADD__(v12, v11);
  uint64_t v14 = v12 + v11;
  if (!v13)
  {
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8LL) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease(v10);
    specialized Array._endMutation()(v15);
    return;
  }

  __break(1u);
}

void sub_10001B5D8(uint64_t a1, uint64_t a2)
{
}

void sub_10001B5F4(uint64_t a1, uint64_t a2)
{
}

void sub_10001B60C(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t))
{
  id v7 = a3;
  id v11 = a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);

  uint64_t v8 = sub_100023548();
  a4(v8);
  uint64_t v9 = sub_100023548();
  sub_100008FE8(v9, v10);
}

void sub_10001B684(uint64_t a1, uint64_t a2)
{
}

void sub_10001B690(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v5, *a3, isa);
  sub_100023390(isa);
}

void sub_10001B6E0(uint64_t a1, void (**a2)(void, void))
{
  id v3 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) rightContext];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  NSString v6 = String._bridgeToObjectiveC()();
  ((void (**)(void, NSString))a2)[2](a2, v6);
  swift_bridgeObjectRelease(v5);

  _Block_release(a2);
}

void sub_10001B774(uint64_t a1, void (**a2)(void, void))
{
  id v3 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) modelInfo];
  id v4 = [objc_allocWithZone(EARSpeechModelInfo) initWithModelInfo:v3];

  ((void (**)(void, id))a2)[2](a2, v4);
  _Block_release(a2);
}

void sub_10001B804(uint64_t a1, void (**a2)(void, void))
{
  id v3 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) recognitionStatistics];
  uint64_t v4 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v3,  &type metadata for String,  v4,  &protocol witness table for String);

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease(v5);

  _Block_release(a2);
}

void sub_10001B8E0(uint64_t a1, void (**a2)(void, void))
{
  id v3 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) recognitionUtterenceStatistics];
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease(v4);

  _Block_release(a2);
}

void sub_10001B99C(uint64_t a1, void (**a2)(void, void))
{
  rusage_info_t v4 = sub_100003FEC();
  unint64_t v5 = *(void *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_cpuInstructionsUsedAtStart);
  BOOL v6 = (unint64_t)v4 >= v5;
  unint64_t v7 = (unint64_t)v4 - v5;
  if (v6)
  {
    double v8 = (double)v7 / 1000000.0;
    id v9 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) recognitionMetrics];
    id v10 = [objc_allocWithZone(EARRecognitionMetrics) initWithRecognitionMetrics:v9 cpuInstructions:v8];

    ((void (**)(void, id))a2)[2](a2, v10);
    _Block_release(a2);
  }

  else
  {
    __break(1u);
  }

void sub_10001BA74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v21;
  a20 = v22;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v23 = sub_10000706C();
  sub_1000070E8(v23, (uint64_t)qword_10005C710);
  os_log_type_t v24 = sub_1000070FC();
  if (os_log_type_enabled(v20, v24))
  {
    uint64_t v25 = (uint8_t *)sub_100007000(12LL);
    uint64_t v26 = sub_100007000(32LL);
    a10 = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    sub_1000092B4(18LL, 0x8000000100044DC0LL, &a10);
    sub_1000092A0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v27, v28, v25 + 4);
    sub_1000070D8((void *)&_mh_execute_header, v20, v24, "EARSpeechRecognizer.%s", v25);
    sub_100007010(v26);
    sub_100006FF4(v26);
    sub_100006FF4((uint64_t)v25);
  }

  [*(id *)((char *)v20 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer) pauseRecognition];
  if (qword_10005A200 != -1) {
    swift_once(&qword_10005A200, sub_10000348C);
  }
  mach_continuous_time();
  sub_1000235D4();
  sub_10002323C("ES: Pause Recognition", 21LL, v29, v30, v31, v32);
  sub_100009224();
}

#error "10001BC08: call analysis failed (funcsize=13)"
void sub_10001BC20()
{
  os_log_s *v0;
  os_log_s *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString v8;
  NSString v9;
  NSString v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v1 = v0;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v2 = sub_10000706C();
  sub_1000070E8(v2, (uint64_t)qword_10005C710);
  id v3 = sub_1000070FC();
  if (os_log_type_enabled(v0, v3))
  {
    rusage_info_t v4 = (uint8_t *)sub_100007000(12LL);
    unint64_t v5 = sub_100007000(32LL);
    uint64_t v16 = v5;
    *(_DWORD *)rusage_info_t v4 = 136315138;
    uint64_t v15 = sub_1000092B4(61LL, 0x8000000100044D60LL, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v4 + 4);
    sub_1000070D8((void *)&_mh_execute_header, v0, v3, "EARSpeechRecognizer.%s", v4);
    sub_100007010(v5);
    BOOL v6 = v5;
    uint64_t v1 = v0;
    sub_100006FF4(v6);
    sub_100006FF4((uint64_t)v4);
  }

  unint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  double v8 = String._bridgeToObjectiveC()();
  id v9 = sub_1000232E8();
  sub_100023664();
  id v10 = String._bridgeToObjectiveC()();
  [v7 resumeRecognitionWithLeftContext:v8 rightContext:v9 selectedText:v10];

  if (qword_10005A200 != -1) {
    swift_once(&qword_10005A200, sub_10000348C);
  }
  mach_continuous_time();
  sub_1000235D4();
  sub_10002323C("ES: Resume Recognition", 22LL, v11, v12, v13, v14);
}

void sub_10001BF08( uint64_t a1, uint64_t a2, uint64_t a3, NSString a4, uint64_t a5, NSString a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v13 = v12;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v18 = sub_10000706C();
  sub_1000070E8(v18, (uint64_t)qword_10005C710);
  os_log_type_t v19 = sub_1000070FC();
  if (sub_100023538(v19))
  {
    unint64_t v20 = (uint8_t *)sub_100007000(12LL);
    uint64_t v21 = sub_100007000(32LL);
    uint64_t v27 = v21;
    *(_DWORD *)unint64_t v20 = 136315138;
    uint64_t v26 = sub_1000092B4(166LL, 0x8000000100044CB0LL, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v20 + 4);
    sub_1000070D8((void *)&_mh_execute_header, v12, v11, "EARSpeechRecognizer.%s", v20);
    sub_100007010(v21);
    uint64_t v22 = v21;
    BOOL v13 = v12;
    sub_100006FF4(v22);
    sub_100006FF4((uint64_t)v20);
  }

  uint64_t v23 = *(void **)((char *)v13 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  if ([v23 respondsToSelector:"updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVis ibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:"])
  {
    if (a2) {
      NSString v24 = String._bridgeToObjectiveC()();
    }
    else {
      NSString v24 = 0LL;
    }
    if (a4) {
      a4 = String._bridgeToObjectiveC()();
    }
    if (a6) {
      a6 = String._bridgeToObjectiveC()();
    }
    [v23 updateVoiceCommandContextWithPrefixText:v24 postfixText:a4 selectedText:a6 disambiguationActive:a7 cursorInVisibleText:a8 favorCom mandSuppression:a9 abortCommandSuppression:a10 undoEvent:a11];
  }

#error "10001C30C: call analysis failed (funcsize=96)"
void __cdecl -[EARSpeechRecognizer requestEagerResult:]( _TtC22localspeechrecognition19EARSpeechRecognizer *self,  SEL a2,  id a3)
{
  uint64_t v5;
  _TtC22localspeechrecognition19EARSpeechRecognizer *v6;
  _TtC22localspeechrecognition19EARSpeechRecognizer *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v5 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  BOOL v6 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a3,  v5);
  unint64_t v7 = self;
  sub_10001C284(v6);

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

void sub_10001C48C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v26 = sub_10000706C();
  sub_1000070E8(v26, (uint64_t)qword_10005C710);
  os_log_type_t v27 = sub_1000070FC();
  if (sub_100023508(v27))
  {
    uint64_t v28 = (uint8_t *)sub_100007000(12LL);
    uint64_t v29 = sub_100007000(32LL);
    a10 = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    sub_1000092B4(17LL, 0x8000000100044C70LL, &a10);
    sub_1000092A0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v30, v31, v28 + 4);
    sub_1000070D8((void *)&_mh_execute_header, v20, v21, "EARSpeechRecognizer.%s", v28);
    sub_100007010(v29);
    sub_100006FF4(v29);
    sub_100006FF4((uint64_t)v28);
  }

  id v32 = v25;
  sub_10001586C((uint64_t)v32);
  uint64_t v33 = *(void **)((char *)v20 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_recognizer);
  sub_100022750(v32, (SEL *)&selRef_inputOrigin);
  sub_1000233F4(v34, v35);
  NSString v36 = String._bridgeToObjectiveC()();
  sub_10000E13C();
  sub_10002326C(v33, "setInputOrigin:");

  sub_100009224();
}

#error "10001C62C: call analysis failed (funcsize=21)"
void sub_10001C64C(uint64_t a1, void (**a2)(void, void))
{
  ((void (**)(void, BOOL))a2)[2]( a2,  (uint64_t)[*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles) count] > 0);
  _Block_release(a2);
}

void sub_10001C6A4(uint64_t a1, void (**a2)(void, void))
{
  id v3 =  [*(id *)(a1 + OBJC_IVAR____TtC22localspeechrecognition19EARSpeechRecognizer_userSpeechProfiles) allValues];
  rusage_info_t v4 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Array._unconditionallyBridgeFromObjectiveC(_:)( v3,  (char *)&type metadata for Any + 8);

  sub_100014D68((uint64_t)v4, &v25);
  swift_bridgeObjectRelease(v4, v5, v6, v7, v8, v9, v10, v11);
  if (!v26)
  {
    sub_100022E60((uint64_t)&v25, &qword_10005C1C0);
    goto LABEL_5;
  }

  uint64_t v12 = sub_1000091B8(0LL, (unint64_t *)&unk_10005C1C8, &OBJC_CLASS____EARUserProfileContainer_ptr);
  if ((swift_dynamicCast(&v24, &v25, (char *)&type metadata for Any + 8, v12, 6LL) & 1) == 0)
  {
LABEL_5:
    uint64_t v15 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)&_swiftEmptySetSingleton;
    goto LABEL_6;
  }

  id v13 = v24;
  id v14 = [v24 experimentIds];
  uint64_t v15 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)static Set._unconditionallyBridgeFromObjectiveC(_:)( v14,  &type metadata for String,  &protocol witness table for String);

LABEL_6:
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a2)[2](a2, isa);
  swift_bridgeObjectRelease(v15, v17, v18, v19, v20, v21, v22, v23);

  _Block_release(a2);
}

void sub_10001C808(uint64_t a1, void (**a2)(void, double))
{
}

#error "10001C8D0: call analysis failed (funcsize=75)"
void __cdecl -[EARSpeechRecognizer setLeftContextText:]( _TtC22localspeechrecognition19EARSpeechRecognizer *self,  SEL a2,  id a3)
{
  sub_10001468C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10001C84C);
}

void sub_10001C9A8(uint64_t a1, uint64_t a2)
{
}

void sub_10001C9CC(uint64_t a1, uint64_t a2)
{
}

void sub_10001C9E4(uint64_t a1, uint64_t a2, unint64_t a3, const char **a4)
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v7 = sub_10000706C();
  sub_1000070E8(v7, (uint64_t)qword_10005C710);
  os_log_type_t v8 = sub_1000070FC();
  if (os_log_type_enabled(v4, v8))
  {
    SEL v17 = a4;
    id v9 = (uint8_t *)sub_100007000(12LL);
    uint64_t v10 = sub_100007000(32LL);
    uint64_t v19 = v10;
    *(_DWORD *)id v9 = 136315138;
    uint64_t v18 = sub_100026B8C(0xD000000000000013LL, a3, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v9 + 4);
    sub_1000070D8((void *)&_mh_execute_header, v4, v8, "EARSpeechRecognizer.%s", v9);
    sub_100007010(v10);
    sub_100006FF4(v10);
    uint64_t v11 = (uint64_t)v9;
    a4 = v17;
    sub_100006FF4(v11);
  }

  NSString v12 = sub_1000232E8();
  sub_100023780((uint64_t)v12, *a4);

  if (qword_10005A200 != -1) {
    swift_once(&qword_10005A200, sub_10000348C);
  }
  mach_continuous_time();
  sub_1000235D4();
  sub_10002323C("ES: Resume Recognition", 22LL, v13, v14, v15, v16);
}

id sub_10001CBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v79 = a4;
  uint64_t v80 = a2;
  uint64_t v81 = a3;
  uint64_t v82 = a1;
  uint64_t v4 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v67[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v87 = type metadata accessor for URL(0LL);
  uint64_t v85 = *(void *)(v87 - 8);
  uint64_t v8 = __chkstk_darwin(v87);
  uint64_t v78 = &v67[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v75 = &v67[-v11];
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v72 = &v67[-v13];
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = &v67[-v15];
  __chkstk_darwin(v14);
  uint64_t v18 = &v67[-v17];
  v88[0] = 7562094LL;
  v88[1] = 0xE300000000000000LL;
  uint64_t v19 = enum case for URL.DirectoryHint.inferFromPath(_:);
  id v20 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 104);
  v20(v7, enum case for URL.DirectoryHint.inferFromPath(_:), v4);
  Swift::String v70 = v20;
  unint64_t v83 = sub_10000BAC4();
  URL.appending<A>(path:directoryHint:)(v88, v7);
  id v21 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v21(v7, v4);
  Swift::String v69 = v21;
  __n128 v22 = swift_bridgeObjectRelease(v88[1]);
  v88[0] = 0x616E5F53555F6E65LL;
  v88[1] = 0xEF6E6F736A2E6770LL;
  ((void (*)(_BYTE *, uint64_t, uint64_t, __n128))v20)(v7, v19, v4, v22);
  double v84 = v18;
  URL.appending<A>(path:directoryHint:)(v88, v7);
  v21(v7, v4);
  swift_bridgeObjectRelease(v88[1]);
  id v23 = (void *)objc_opt_self(&OBJC_CLASS___NSString);
  id v86 = v23;
  uint64_t v24 = URL.pathComponents.getter(v23);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v26 = objc_msgSend(v23, "pathWithComponents:", isa, swift_bridgeObjectRelease(v24).n128_f64[0]);

  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
  uint64_t v76 = v28;
  uint64_t v77 = v27;

  uint64_t v85 = *(void *)(v85 + 8);
  uint64_t v29 = v87;
  ((void (*)(_BYTE *, uint64_t))v85)(v16, v87);
  strcpy((char *)v88, "vocdelta.voc");
  BYTE5(v88[1]) = 0;
  HIWORD(v88[1]) = -5120;
  uint64_t v30 = v19;
  unsigned int v68 = v19;
  uint64_t v31 = v70;
  v70(v7, v19, v4);
  id v32 = v72;
  URL.appending<A>(path:directoryHint:)(v88, v7);
  uint64_t v33 = v69;
  v69(v7, v4);
  swift_bridgeObjectRelease(v88[1]);
  uint64_t v35 = URL.pathComponents.getter(v34);
  Class v36 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)&double v37 = swift_bridgeObjectRelease(v35).n128_u64[0];
  id v38 = objc_msgSend(v86, "pathWithComponents:", v36, v37);

  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
  uint64_t v73 = v40;
  uint64_t v74 = v39;

  ((void (*)(_BYTE *, uint64_t))v85)(v32, v29);
  v88[0] = 0x636F762E6770LL;
  v88[1] = 0xE600000000000000LL;
  v31(v7, v30, v4);
  id v41 = v75;
  URL.appending<A>(path:directoryHint:)(v88, v7);
  v33(v7, v4);
  swift_bridgeObjectRelease(v88[1]);
  uint64_t v43 = URL.pathComponents.getter(v42);
  Class v44 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)&double v45 = swift_bridgeObjectRelease(v43).n128_u64[0];
  id v46 = v86;
  id v47 = objc_msgSend(v86, "pathWithComponents:", v44, v45);

  id v48 = (_BYTE *)static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
  uint64_t v71 = v49;
  uint64_t v72 = v48;

  id v50 = v41;
  uint64_t v51 = v87;
  id v52 = (void (*)(_BYTE *, uint64_t))v85;
  ((void (*)(_BYTE *, uint64_t))v85)(v50, v87);
  strcpy((char *)v88, "mrec.psh");
  BYTE1(v88[1]) = 0;
  WORD1(v88[1]) = 0;
  HIDWORD(v88[1]) = -402653184;
  v31(v7, v68, v4);
  uint64_t v53 = v78;
  URL.appending<A>(path:directoryHint:)(v88, v7);
  v33(v7, v4);
  swift_bridgeObjectRelease(v88[1]);
  id v54 = v53;
  uint64_t v56 = URL.pathComponents.getter(v55);
  Class v57 = Array._bridgeToObjectiveC()().super.isa;
  id v58 = objc_msgSend(v46, "pathWithComponents:", v57, swift_bridgeObjectRelease(v56).n128_f64[0]);

  uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
  uint64_t v61 = v60;

  v52(v54, v51);
  id v62 = objc_allocWithZone(&OBJC_CLASS____EARUserProfileBuilder);
  uint64_t v63 = v79;
  swift_bridgeObjectRetain(v79);
  uint64_t v64 = v80;
  swift_bridgeObjectRetain(v80);
  id v65 = sub_10001E390(v81, v63, v82, v64, 0LL, 0LL, 0LL, v77, v76, v74, v73, (uint64_t)v72, v71, v59, v61, 1);
  v52(v84, v51);
  return v65;
}

uint64_t sub_10001D188(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain(a1);
    if (v10) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease(a1);
LABEL_22:
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v44 = [a4 createInlineLmeUserDataForContextData:v9 speechProfile:isa];

    if (v44)
    {
      uint64_t v45 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v44);

      return v45;
    }

    return 0LL;
  }

  if (a1 < 0) {
    uint64_t v42 = a1;
  }
  else {
    uint64_t v42 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v42);
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_21;
  }
LABEL_4:
  if (v10 >= 1)
  {
    id v46 = a4;
    uint64_t v12 = 0LL;
    uint64_t v50 = EARContextualNamedEntitySourceFrameworkKey;
    uint64_t v49 = EARContextualNamedEntityScoreKey;
    uint64_t v48 = EARContextualNamedEntityCategoryKey;
    uint64_t v47 = EARContextualNamedEntityLanguageKey;
    uint64_t v13 = v9;
    do
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, a1);
      }
      else {
        id v14 = *(id *)(a1 + 8 * v12 + 32);
      }
      uint64_t v15 = v14;
      uint64_t v16 = sub_100004B88(&qword_10005C1D8);
      uint64_t inited = swift_initStackObject(v16, v53);
      *(_OWORD *)(inited + 16) = xmmword_10003E000;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
      *(void *)(inited + 40) = v18;
      [v15 sourceFramework];
      Class v19 = Int._bridgeToObjectiveC()().super.super.isa;
      uint64_t v20 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
      *(void *)(inited + 72) = v20;
      *(void *)(inited + 48) = v19;
      uint64_t v54 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      id v21 = [v15 score];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
        id v52 = (void *)v20;
        v51[0] = v22;
        sub_100014DEC((uint64_t)v51, v23, v24);
      }

      id v25 = objc_msgSend(v15, "category", v46);
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
        id v52 = (void *)v20;
        v51[0] = v26;
        sub_100014DEC((uint64_t)v51, v27, v28);
      }

      sub_100022750(v15, (SEL *)&selRef_language);
      if (v30)
      {
        uint64_t v31 = v29;
        uint64_t v32 = v30;
        uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
        id v52 = &type metadata for String;
        v51[0] = v31;
        v51[1] = v32;
        sub_100014DEC((uint64_t)v51, v33, v34);
      }

      ++v12;
      id v35 = [v15 content];
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
      uint64_t v38 = v37;

      uint64_t v39 = v54;
      uint64_t v40 = sub_1000154A0(v54);
      swift_bridgeObjectRelease(v39);
      uint64_t v41 = v38;
      uint64_t v9 = v13;
      sub_10002256C(v36, v41, v40, v13);
    }

    while (v10 != v12);
    swift_bridgeObjectRelease(a1);
    a4 = v46;
    goto LABEL_22;
  }

  __break(1u);
  return result;
}

void sub_10001D550()
{
}

void sub_10001D580(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = "\b";
  v4[2] = "\b";
  void v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[6] = &unk_10003E230;
  v4[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[8] = (char *)&value witness table for Builtin.Int64 + 64;
  void v4[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[10] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[11] = (char *)&value witness table for Builtin.Int64 + 64;
  sub_10001D664(319LL);
  if (v3 <= 0x3F)
  {
    v4[12] = *(void *)(v2 - 8) + 64LL;
    v4[13] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[14] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[15] = &unk_10003E230;
    v4[16] = &unk_10003E248;
    v4[17] = &unk_10003E260;
    v4[18] = &unk_10003E260;
    v4[19] = &unk_10003E260;
    swift_updateClassMetadata2(a1, 256LL, 20LL, v4, a1 + 80);
  }

void sub_10001D664(uint64_t a1)
{
  if (!qword_10005C0A8)
  {
    uint64_t v2 = type metadata accessor for Date(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10005C0A8);
    }
  }

id sub_10001D6B8(void *a1)
{
  uint64_t v3 = qword_10005A210;
  uint64_t v4 = v1;
  if (v3 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_100004C5C(v5, (uint64_t)qword_10005C710);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v9 = static os_log_type_t.debug.getter(v7, v8);
  if (os_log_type_enabled(v7, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v16 = sub_100026B8C(0x293A5F2874696E69LL, 0xE800000000000000LL, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v10 + 4);
    _os_log_impl((void *)&_mh_execute_header, v7, v9, "EARSpeechRecognitionAudioBuffer.%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  *(void *)&v4[OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer] = a1;
  id v12 = a1;

  uint64_t v13 = (objc_class *)type metadata accessor for EARSpeechRecognitionAudioBuffer();
  v18.receiver = v4;
  v18.super_class = v13;
  id v14 = objc_msgSendSuper2(&v18, "init");

  return v14;
}

#error "10001D8F4: call analysis failed (funcsize=70)"
void __cdecl -[EARSpeechRecognitionAudioBuffer addAudioSampleData:]( _TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer *self,  SEL a2,  id a3)
{
  id v3;
  _TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  _TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer *v8;
  uint64_t v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    uint64_t v5 = v3;
    uint64_t v3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v8 = self;
    uint64_t v7 = 0xF000000000000000LL;
  }

  sub_10001D870(v3, v7);
  sub_100008FD4((uint64_t)v3, v7);
}

void sub_10001DA20()
{
}

void sub_10001DA78()
{
}

void sub_10001DA9C()
{
  uint64_t v3 = v2;
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v4 = sub_10000706C();
  sub_1000070E8(v4, (uint64_t)qword_10005C710);
  os_log_type_t v5 = sub_1000070FC();
  if (sub_10000BC2C(v5))
  {
    uint64_t v6 = (uint8_t *)sub_100007000(12LL);
    uint64_t v12 = sub_100007000(32LL);
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = sub_100023664();
    sub_100026B8C(v7, v8, v9);
    sub_1000092A0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v10, v11, v6 + 4);
    sub_1000070D8((void *)&_mh_execute_header, v0, v1, "EARSpeechRecognitionAudioBuffer.%s", v6);
    sub_100007010(v12);
    sub_100006FF4(v12);
    sub_100006FF4((uint64_t)v6);
  }

  [*(id *)((char *)v0 + OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer) *v3];
  sub_100023194();
}

uint64_t sub_10001DBEC(float a1)
{
  *(void *)(v2 + 24) = v1;
  *(float *)(v2 + 32) = a1;
  return sub_1000231DC((uint64_t)sub_10001DC00);
}

uint64_t sub_10001DC00()
{
  if (qword_10005A210 != -1) {
    swift_once(&qword_10005A210, sub_100005278);
  }
  uint64_t v3 = (uint64_t *)(v1 + 16);
  uint64_t v4 = sub_10000706C();
  os_log_type_t v5 = (os_log_s *)sub_1000070E8(v4, (uint64_t)qword_10005C710);
  os_log_type_t v7 = static os_log_type_t.debug.getter(v5, v6);
  if (sub_1000235CC(v5))
  {
    unint64_t v8 = (uint8_t *)sub_100007000(12LL);
    uint64_t v2 = sub_100007000(32LL);
    uint64_t v20 = v2;
    sub_1000233B0(4.8149e-34);
    *(void *)(v1 + 16) = sub_1000092B4(43LL, 0x8000000100044B60LL, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, 12LL);
    sub_1000070D8((void *)&_mh_execute_header, v5, v7, "EARSpeechRecognitionAudioBuffer.%s", v8);
    sub_100007010(v2);
    sub_100006FF4(v2);
    sub_100006FF4((uint64_t)v8);
  }

  LODWORD(v9) = *(_DWORD *)(v1 + 32);
  id v10 = objc_msgSend( *(id *)(*(void *)(v1 + 24)
                + OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer),
          "packetArrivalTimestampFromAudioTime:",
          v9);
  Logger.logObject.getter(v10);
  os_log_type_t v11 = sub_1000070FC();
  if (sub_10000BC2C(v11))
  {
    uint64_t v12 = sub_100007000(22LL);
    uint64_t v13 = sub_100007000(32LL);
    uint64_t v20 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    *uint64_t v3 = sub_1000092B4(43LL, 0x8000000100044B60LL, &v20);
    uint64_t v14 = sub_100023768();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v14, v15, v12 + 4);
    *(_WORD *)(v12 + 12) = 2048;
    *uint64_t v3 = (uint64_t)v10;
    uint64_t v16 = sub_100023768();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v16, v17, v18);
    _os_log_impl( (void *)&_mh_execute_header,  v0,  (os_log_type_t)v2,  "EARSpeechRecognitionAudioBuffer.%s replying %llu",  (uint8_t *)v12,  0x16u);
    sub_100007010(v13);
    sub_100006FF4(v13);
    sub_100006FF4(v12);
  }

  return (*(uint64_t (**)(id))(v1 + 8))(v10);
}

uint64_t sub_10001DEB4(const void *a1, void *a2, float a3)
{
  v3[2] = a2;
  v3[3] = _Block_copy(a1);
  uint64_t v6 = dword_10005C144;
  a2;
  os_log_type_t v7 = (void *)swift_task_alloc(v6);
  v3[4] = v7;
  *os_log_type_t v7 = v3;
  v7[1] = sub_10001DF24;
  return sub_10001DBEC(a3);
}

uint64_t sub_10001DF24()
{
  uint64_t v1 = *(const void **)(*v0 + 24);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 32));

  uint64_t v3 = sub_10002349C();
  v4(v3);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_10001DF94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005BE48);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  sub_100006CF0((uint64_t)v6, 1LL, 1LL, v7);
  unint64_t v8 = (void *)swift_allocObject(&unk_1000518D8, 48LL, 7LL);
  v8[2] = 0LL;
  v8[3] = 0LL;
  void v8[4] = a1;
  v8[5] = a2;
  double v9 = (void *)swift_allocObject(&unk_100051900, 48LL, 7LL);
  uint64_t v9[2] = 0LL;
  v9[3] = 0LL;
  v9[4] = &unk_10005C168;
  v9[5] = v8;
  uint64_t v10 = sub_10001E5F4((uint64_t)v6, (uint64_t)&unk_10005C178, (uint64_t)v9);
  return swift_release(v10);
}

void sub_10001E070()
{
}

id sub_10001E0A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EARSpeechRecognitionAudioBuffer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EARSpeechRecognitionAudioBuffer()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer);
}

void sub_10001E100(uint64_t a1, uint64_t a2)
{
}

id sub_10001E10C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, __int16 a9, void *a10, uint64_t a11, char a12)
{
  NSString v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (a3)
  {
    v26.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a3);
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v16.super.Class isa = 0LL;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  v26.super.Class isa = 0LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  v16.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
LABEL_4:
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
    goto LABEL_8;
  }

void sub_10001E33C(uint64_t a1, uint64_t a2, SEL *a3)
{
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v6 = 0LL;
  }

  sub_10002326C(v3, *a3);

  sub_100023484();
}

id sub_10001E390( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  NSString v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v21.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }

  else
  {
    v21.super.Class isa = 0LL;
  }

  if (a7)
  {
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a7);
  }

  else
  {
    NSString v22 = 0LL;
  }

  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a9);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a11);
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a13);
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a15);
  LOBYTE(v29) = a16 & 1;
  id v27 = [v31 initWithConfiguration:v30 language:v20 overrides:v21.super.isa textNormalizationModelRoot:v22 sdapiOverrides:v23 emptyVoc:v24 pgVoc:v25 paramsetHolder:v26 isJit:v29];

  return v27;
}

uint64_t sub_10001E54C(uint64_t a1, uint64_t a2, int *a3)
{
  NSString v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100010550;
  return v6();
}

uint64_t sub_10001E5A0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100010550;
  return v7();
}

uint64_t sub_10001E5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_100004C10(a1, 1LL, v6) == 1)
  {
    sub_100022E60(a1, &qword_10005BE48);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9, v12);
    uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v15 = v14;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v15 = 0LL;
  }

  uint64_t v16 = swift_allocObject(&unk_100051928, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v15 | v13)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    NSString v17 = v19;
    v19[2] = v13;
    v19[3] = v15;
  }

  else
  {
    NSString v17 = 0LL;
  }

  return swift_task_create(v7, v17, (char *)&type metadata for () + 8, &unk_10005C188, v16);
}

char *sub_10001E738(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100004B88(&qword_10005B5A8);
    os_log_type_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    os_log_type_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1000268D8((char *)(a4 + 32), v8, v13);
    *(void *)(a4 + 16) = 0LL;
    swift_bridgeObjectRelease(a4);
  }

  else
  {
    sub_10001E824(0LL, v8, (unint64_t)v13, a4);
  }

  return v11;
}

uint64_t sub_10001E824(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 16 * a1 + 32;
  unint64_t v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001E918()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10001E944()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10005C14C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000102D0;
  uint64_t v2 = sub_10002349C();
  return v3(v2);
}

uint64_t sub_10001E9B0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  char v5 = (void *)swift_task_alloc(dword_10005C164);
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_100010550;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10005C160 + dword_10005C160))(v2, v3, v4);
}

uint64_t sub_10001EA2C()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10001EA58()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10005C174);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100010550;
  uint64_t v2 = sub_100023574();
  return v3(v2);
}

uint64_t sub_10001EACC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001EAF0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc(dword_10005C184);
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_100023190;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10005C180 + dword_10005C180))(a1, v4);
}

void sub_10001EB60(char a1, uint64_t a2, char a3)
{
  *uint64_t v3 = v4;
}

void sub_10001EB7C(char a1, uint64_t a2, char a3)
{
  *uint64_t v3 = v4;
}

void sub_10001EB98(char a1, uint64_t a2, char a3)
{
  *uint64_t v3 = v4;
}

unint64_t sub_10001EBB4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10001EC48(a1, a2, v5);
}

unint64_t sub_10001EC18(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10001ED28(a1, v4);
}

unint64_t sub_10001EC48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_10001ED28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    sub_1000091B8(0LL, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

uint64_t sub_10001EE40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_10001EBB4(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0) {
    return 0LL;
  }
  sub_100023614();
  sub_100023408();
  int v9 = sub_100004B88(&qword_10005C260);
  sub_100023470(v9, v10, v11, v12, v13, v14, v15, v16, v23, v24);
  swift_bridgeObjectRelease(*(void *)(*(void *)(v25 + 48) + 16 * v7 + 8));
  uint64_t v17 = *(void *)(*(void *)(v25 + 56) + 16 * v7);
  uint64_t v18 = sub_100023548();
  _NativeDictionary._delete(at:)(v18, v19, v20, v20);
  uint64_t v21 = *v3;
  *uint64_t v3 = v25;
  swift_bridgeObjectRelease(v21);
  return v17;
}

uint64_t sub_10001EF20()
{
  return sub_10001F228();
}

uint64_t sub_10001EF40()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = *v0;
  if ((v4 & 0xC000000000000001LL) == 0)
  {
    sub_10002329C();
    unint64_t v17 = sub_10001EC18((uint64_t)v3);
    char v19 = v18;
    sub_10000E13C();
    if ((v19 & 1) != 0)
    {
      sub_100023614();
      sub_100023408();
      int v20 = sub_100004B88(&qword_10005C218);
      sub_100023470(v20, v21, v22, v23, v24, v25, v26, v27, v29, v30);

      uint64_t v14 = *(void *)(*(void *)(v31 + 56) + 8 * v17);
      uint64_t v28 = sub_10002359C();
      sub_1000235E0((unint64_t *)&qword_10005B290);
      _NativeDictionary._delete(at:)(v17, v31, v28, (char *)&type metadata for Swift.AnyObject + 8);
      Swift::Int v16 = *v1;
      *uint64_t v1 = v31;
      goto LABEL_10;
    }

    return 0LL;
  }

  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_10002329C();
  id v6 = v3;
  uint64_t v7 = ((uint64_t (*)(void))__CocoaDictionary.lookup(_:))();

  if (!v7)
  {
    sub_10000E13C();
    return 0LL;
  }

  swift_unknownObjectRelease(v7);
  uint64_t v8 = __CocoaDictionary.count.getter(v5);
  Swift::Int v9 = sub_10001F5C8(v5, v8);
  swift_retain(v9);
  unint64_t v10 = sub_10001EC18((uint64_t)v6);
  char v12 = v11;
  uint64_t result = sub_1000070C4();
  if ((v12 & 1) != 0)
  {

    uint64_t v14 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
    uint64_t v15 = sub_10002359C();
    sub_1000235E0((unint64_t *)&qword_10005B290);
    _NativeDictionary._delete(at:)(v10, v9, v15, (char *)&type metadata for Swift.AnyObject + 8);
    Swift::Int v16 = *v1;
    *uint64_t v1 = v9;
LABEL_10:
    swift_bridgeObjectRelease(v16);
    return v14;
  }

  __break(1u);
  return result;
}

double sub_10001F104@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_10001EBB4(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v16 = *v4;
    uint64_t v12 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    Swift::Int v13 = *(void *)(v12 + 24);
    sub_100004B88(&qword_10005C1E0);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(void *)(*(void *)(v16 + 48) + 16 * v9 + 8));
    sub_100022C10((_OWORD *)(*(void *)(v16 + 56) + 32 * v9), a3);
    _NativeDictionary._delete(at:)(v9, v16, &type metadata for String, (char *)&type metadata for Any + 8);
    uint64_t v14 = *v4;
    *uint64_t v4 = v16;
    *(void *)&double result = swift_bridgeObjectRelease(v14).n128_u64[0];
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

uint64_t sub_10001F228()
{
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  unint64_t v9 = v8;
  uint64_t v10 = *v0;
  if ((v10 & 0xC000000000000001LL) == 0)
  {
    int v23 = v1;
    sub_10002329C();
    unint64_t v24 = sub_10001EC18((uint64_t)v9);
    char v26 = v25;
    sub_10000E13C();
    if ((v26 & 1) != 0)
    {
      char v27 = sub_100023614();
      Swift::Int v32 = *v7;
      Swift::Int v28 = *v7;
      *uint64_t v7 = 0x8000000000000000LL;
      Swift::Int v29 = *(void *)(v28 + 24);
      sub_100004B88(v23);
      _NativeDictionary.ensureUnique(isUnique:capacity:)(v27, v29);

      uint64_t v21 = *(void *)(*(void *)(v32 + 56) + 8 * v24);
      sub_1000235AC();
      sub_1000236DC();
      sub_100023608((unint64_t *)&qword_10005B290);
      uint64_t v30 = sub_100023434();
      sub_100023700(v30, v31);
      Swift::Int v22 = *v7;
      *uint64_t v7 = v32;
      goto LABEL_10;
    }

    return 0LL;
  }

  char v11 = v2;
  if (v10 < 0) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_10002329C();
  id v13 = v9;
  uint64_t v14 = ((uint64_t (*)(void))__CocoaDictionary.lookup(_:))();

  if (!v14)
  {
    sub_10000E13C();
    return 0LL;
  }

  swift_unknownObjectRelease(v14);
  uint64_t v15 = __CocoaDictionary.count.getter(v12);
  Swift::Int v16 = sub_10001F7C8(v12, v15, v11, v6, v4);
  swift_retain(v16);
  unint64_t v17 = sub_10001EC18((uint64_t)v13);
  char v19 = v18;
  uint64_t result = sub_1000234F8();
  if ((v19 & 1) != 0)
  {

    uint64_t v21 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
    sub_1000235AC();
    sub_1000236DC();
    sub_100023608((unint64_t *)&qword_10005B290);
    sub_100023700(v17, v16);
    Swift::Int v22 = *v7;
    *uint64_t v7 = v16;
LABEL_10:
    swift_bridgeObjectRelease(v22);
    return v21;
  }

  __break(1u);
  return result;
}

uint64_t sub_10001F410()
{
  return sub_10001F528();
}

uint64_t sub_10001F430(uint64_t a1, void *a2)
{
  Swift::Int v5 = *v2;
  if ((*v2 & 0xC000000000000001LL) == 0) {
    goto LABEL_4;
  }
  uint64_t result = sub_1000234B4(v5);
  if (!__OFADD__(result, 1LL))
  {
    Swift::Int v5 = sub_10001F5C8((uint64_t)v2, result + 1);
    *uint64_t v2 = v5;
LABEL_4:
    swift_isUniquelyReferenced_nonNull_native(v5);
    sub_1000233D8();
    sub_10002026C(a1, a2, v7);
    Swift::Int v8 = *v2;
    *uint64_t v2 = v9;
    return swift_bridgeObjectRelease(v8);
  }

  __break(1u);
  return result;
}

double sub_10001F4AC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_100020380(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *v3;
  *uint64_t v3 = v10;
  *(void *)&double result = swift_bridgeObjectRelease(v8).n128_u64[0];
  return result;
}

uint64_t sub_10001F528()
{
  uint64_t v32 = v5;
  int v7 = v6;
  Swift::Int v8 = *v0;
  if ((*v0 & 0xC000000000000001LL) == 0) {
    goto LABEL_4;
  }
  Swift::Int v9 = v4;
  uint64_t v10 = v3;
  char v11 = v2;
  uint64_t result = sub_1000234B4(v8);
  if (!__OFADD__(result, 1LL))
  {
    Swift::Int v8 = sub_10001F7C8((uint64_t)v0, result + 1, v11, v10, v9);
    *uint64_t v0 = v8;
LABEL_4:
    swift_isUniquelyReferenced_nonNull_native(v8);
    sub_1000233D8();
    int v13 = sub_100023664();
    sub_10002049C(v13, v14, v15, v7, v16, v17, v18, v19, v21, v22, v24, v25, v26, v27, v28, v29, v30, v31, v1, v32);
    Swift::Int v20 = *v0;
    *uint64_t v0 = v23;
    return swift_bridgeObjectRelease(v20);
  }

  __break(1u);
  return result;
}

Swift::Int sub_10001F5C8(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }

  sub_100004B88(&qword_10005C220);
  uint64_t v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
  uint64_t v26 = v4;
  uint64_t v5 = __CocoaDictionary.makeIterator()(a1);
  uint64_t v6 = __CocoaDictionary.Iterator.next()();
  if (!v6)
  {
LABEL_16:
    swift_release(v5);
    return v4;
  }

  uint64_t v8 = v6;
  uint64_t v9 = v7;
  uint64_t v10 = sub_1000091B8(0LL, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
  while (1)
  {
    uint64_t v24 = v8;
    swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
    uint64_t v4 = v26;
    unint64_t v11 = *(void *)(v26 + 16);
    if (*(void *)(v26 + 24) <= v11)
    {
      sub_10001FC70(v11 + 1, 1LL);
      uint64_t v4 = v26;
    }

    uint64_t v12 = v25;
    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v14 = v4 + 64;
    uint64_t v15 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6))) == 0) {
      break;
    }
    unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_15:
    *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    *(void *)(*(void *)(v4 + 48) + 8 * v18) = v12;
    *(void *)(*(void *)(v4 + 56) + 8 * v18) = v9;
    ++*(void *)(v4 + 16);
    uint64_t v8 = __CocoaDictionary.Iterator.next()();
    uint64_t v9 = v23;
    if (!v8) {
      goto LABEL_16;
    }
  }

  char v19 = 0;
  unint64_t v20 = (unint64_t)(63 - v15) >> 6;
  while (++v17 != v20 || (v19 & 1) == 0)
  {
    BOOL v21 = v17 == v20;
    if (v17 == v20) {
      unint64_t v17 = 0LL;
    }
    v19 |= v21;
    uint64_t v22 = *(void *)(v14 + 8 * v17);
    if (v22 != -1)
    {
      unint64_t v18 = __clz(__rbit64(~v22)) + (v17 << 6);
      goto LABEL_15;
    }
  }

  __break(1u);
  return result;
}

Swift::Int sub_10001F7C8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  if (!a2)
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }

  sub_100004B88(a3);
  uint64_t v9 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
  uint64_t v32 = v9;
  __CocoaDictionary.makeIterator()(a1);
  uint64_t v10 = __CocoaDictionary.Iterator.next()();
  if (!v10)
  {
LABEL_16:
    sub_1000234F8();
    return v9;
  }

  uint64_t v12 = v10;
  uint64_t v13 = v11;
  uint64_t v14 = sub_1000092E0(v10, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
  while (1)
  {
    uint64_t v30 = v12;
    sub_100023500((uint64_t)&v31, (uint64_t)&v30, (uint64_t)&type metadata for Swift.AnyObject + 8, v14);
    uint64_t v29 = v13;
    uint64_t v15 = a5(a4);
    sub_100023500((uint64_t)&v30, (uint64_t)&v29, (uint64_t)&type metadata for Swift.AnyObject + 8, v15);
    uint64_t v9 = v32;
    if (*(void *)(v32 + 24) <= *(void *)(v32 + 16))
    {
      sub_10001FF34();
      uint64_t v9 = v32;
    }

    uint64_t v17 = v30;
    uint64_t v16 = v31;
    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v9 + 40));
    uint64_t v19 = v9 + 64;
    uint64_t v20 = -1LL << *(_BYTE *)(v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1LL << v21) & ~*(void *)(v9 + 64 + 8 * (v21 >> 6))) == 0) {
      break;
    }
    unint64_t v23 = __clz(__rbit64((-1LL << v21) & ~*(void *)(v9 + 64 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_15:
    *(void *)(v19 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    *(void *)(*(void *)(v9 + 48) + 8 * v23) = v16;
    *(void *)(*(void *)(v9 + 56) + 8 * v23) = v17;
    ++*(void *)(v9 + 16);
    uint64_t v12 = __CocoaDictionary.Iterator.next()();
    uint64_t v13 = v28;
    if (!v12) {
      goto LABEL_16;
    }
  }

  char v24 = 0;
  unint64_t v25 = (unint64_t)(63 - v20) >> 6;
  while (++v22 != v25 || (v24 & 1) == 0)
  {
    BOOL v26 = v22 == v25;
    if (v22 == v25) {
      unint64_t v22 = 0LL;
    }
    v24 |= v26;
    uint64_t v27 = *(void *)(v19 + 8 * v22);
    if (v27 != -1)
    {
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
      goto LABEL_15;
    }
  }

  __break(1u);
  return result;
}

void sub_10001F9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_1000236A8();
  sub_100004B88(&qword_10005C268);
  char v44 = a2;
  uint64_t v6 = (void *)static _DictionaryStorage.resize(original:capacity:move:)(v3, v2, a2);
  if (!v3[2]) {
    goto LABEL_39;
  }
  sub_1000234E0();
  uint64_t v43 = v9;
  if (v7 < 64) {
    uint64_t v10 = ~(-1LL << v7);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & v8;
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v6 + 8;
  sub_100023554();
  int64_t v13 = 0LL;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(v3[6] + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    unint64_t v23 = (uint64_t *)(v3[7] + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v44 & 1) == 0)
    {
      swift_bridgeObjectRetain(v20[1]);
      sub_1000234D8();
    }

    Hasher.init(_seed:)(v45, v6[5]);
    String.hash(into:)(v45, v22, v21);
    Hasher._finalize()();
    sub_1000236C8();
    if (((v28 << v27) & ~v12[v26]) == 0)
    {
      sub_100023358();
      while (++v30 != v31 || (v29 & 1) == 0)
      {
        BOOL v32 = v30 == v31;
        if (v30 == v31) {
          uint64_t v30 = 0LL;
        }
        v29 |= v32;
        if (v12[v30] != -1LL)
        {
          sub_100023344();
          goto LABEL_30;
        }
      }

      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }

    sub_10002336C();
LABEL_30:
    sub_100023330();
    *(void *)((char *)v12 + v33) |= v34;
    uint64_t v36 = (void *)(v6[6] + 16 * v35);
    *uint64_t v36 = v22;
    v36[1] = v21;
    uint64_t v37 = (void *)(v6[7] + 16 * v35);
    *uint64_t v37 = v24;
    v37[1] = v25;
    ++v6[2];
    if (v11) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      goto LABEL_41;
    }
    if (v16 >= v42)
    {
      sub_1000070C4();
      uint64_t v4 = v41;
      uint64_t v17 = v43;
      goto LABEL_34;
    }

    uint64_t v17 = v43;
    unint64_t v18 = v43[v16];
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v42) {
        goto LABEL_32;
      }
      unint64_t v18 = v43[v13];
      if (!v18) {
        break;
      }
    }

LABEL_32:
  sub_1000070C4();
  uint64_t v4 = v41;
LABEL_34:
  if ((v44 & 1) != 0)
  {
    sub_100023624();
    if (v39 != v40) {
      *uint64_t v17 = -1LL << v38;
    }
    else {
      sub_100023440(v38);
    }
    v3[2] = 0LL;
  }

Swift::Int sub_10001FC70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100004B88(&qword_10005C220);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v35 = v3;
    uint64_t v36 = v5 + 64;
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = v7 + 64;
    Swift::Int result = swift_retain(v5);
    int64_t v15 = 0LL;
    if (!v11) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v15 << 6))
    {
      uint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * i);
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        id v24 = v22;
        swift_unknownObjectRetain(v23, v25);
      }

      Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v8 + 40));
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0LL;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v13 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
        return result;
      }

      unint64_t v29 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v13 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v29;
      *(void *)(*(void *)(v8 + 48) + 8 * v29) = v22;
      *(void *)(*(void *)(v8 + 56) + 8 * v29) = v23;
      ++*(void *)(v8 + 16);
      if (v11) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1LL)) {
        goto LABEL_44;
      }
      if (v18 >= v12) {
        break;
      }
      int64_t v19 = (void *)(v5 + 64);
      unint64_t v20 = *(void *)(v36 + 8 * v18);
      ++v15;
      if (!v20)
      {
        int64_t v15 = v18 + 1;
        if (v18 + 1 >= v12) {
          goto LABEL_35;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v15);
        if (!v20)
        {
          int64_t v21 = v18 + 2;
          if (v21 >= v12)
          {
LABEL_35:
            swift_release(v5);
            uint64_t v3 = v35;
            if ((a2 & 1) == 0) {
              goto LABEL_42;
            }
            goto LABEL_38;
          }

          unint64_t v20 = *(void *)(v36 + 8 * v21);
          if (!v20)
          {
            while (1)
            {
              int64_t v15 = v21 + 1;
              if (__OFADD__(v21, 1LL)) {
                goto LABEL_45;
              }
              if (v15 >= v12) {
                goto LABEL_35;
              }
              unint64_t v20 = *(void *)(v36 + 8 * v15);
              ++v21;
              if (v20) {
                goto LABEL_21;
              }
            }
          }

          int64_t v15 = v21;
        }
      }

LABEL_42:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

void sub_10001FF34()
{
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  sub_1000236A8();
  sub_100004B88(v5);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)(v1, v0, v4);
  if (v1[2])
  {
    sub_1000234E0();
    uint64_t v36 = v0;
    uint64_t v37 = v9;
    if (v7 < 64) {
      uint64_t v10 = ~(-1LL << v7);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & v8;
    int64_t v12 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    sub_100023554();
    int64_t v14 = 0LL;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      int64_t v21 = *(void **)(v1[6] + 8 * i);
      uint64_t v22 = *(void **)(v1[7] + 8 * i);
      if ((v4 & 1) == 0)
      {
        id v23 = v21;
        id v24 = v22;
      }

      unint64_t v25 = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40)) & ~(-1LL << *(_BYTE *)(v6 + 32));
      if (((-1LL << v25) & ~*(void *)(v13 + 8 * (v25 >> 6))) == 0)
      {
        sub_100023358();
        while (++v27 != v28 || (v26 & 1) == 0)
        {
          BOOL v29 = v27 == v28;
          if (v27 == v28) {
            uint64_t v27 = 0LL;
          }
          v26 |= v29;
          if (*(void *)(v13 + 8 * v27) != -1LL)
          {
            sub_100023344();
            goto LABEL_30;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return;
      }

      sub_10002336C();
LABEL_30:
      sub_100023330();
      *(void *)(v13 + v30) |= v31;
      *(void *)(*(void *)(v6 + 48) + 8 * v32) = v21;
      *(void *)(*(void *)(v6 + 56) + 8 * v32) = v22;
      ++*(void *)(v6 + 16);
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        goto LABEL_41;
      }
      if (v17 >= v12) {
        break;
      }
      int64_t v18 = v37;
      unint64_t v19 = v37[v17];
      ++v14;
      if (!v19)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v12) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v14];
        if (!v19)
        {
          int64_t v20 = v17 + 2;
          if (v20 >= v12)
          {
LABEL_32:
            sub_1000070C4();
            uint64_t v2 = v36;
            if ((v4 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }

          unint64_t v19 = v37[v20];
          if (!v19)
          {
            while (1)
            {
              int64_t v14 = v20 + 1;
              if (__OFADD__(v20, 1LL)) {
                goto LABEL_42;
              }
              if (v14 >= v12) {
                goto LABEL_32;
              }
              unint64_t v19 = v37[v14];
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }

          int64_t v14 = v20;
        }
      }

uint64_t sub_100020154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = v6;
  sub_10002372C();
  Swift::Int v12 = *v6;
  sub_10001EBB4(v13, v14);
  sub_1000235EC();
  if (v17)
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v18 = v15;
  char v19 = v16;
  sub_100004B88(&qword_10005C260);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a5 & 1, v12)) {
    goto LABEL_5;
  }
  uint64_t v20 = sub_100023664();
  unint64_t v22 = sub_10001EBB4(v20, v21);
  if ((v19 & 1) != (v23 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v18 = v22;
LABEL_5:
  id v24 = (void *)*v8;
  if ((v19 & 1) != 0)
  {
    unint64_t v25 = (uint64_t *)(v24[7] + 16 * v18);
    uint64_t result = swift_bridgeObjectRelease(v25[1]);
    uint64_t *v25 = v7;
    v25[1] = v5;
  }

  else
  {
    sub_100020590(v18, a3, a4, v7, v5, v24);
    return swift_bridgeObjectRetain(a4);
  }

  return result;
}

id sub_10002026C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v8 = sub_10001EC18((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v9 & 1) == 0;
  Swift::Int v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v13 = v8;
  char v14 = v9;
  sub_100004B88(&qword_10005C218);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v12)) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_10001EC18((uint64_t)a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    uint64_t v20 = sub_1000091B8(0LL, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
    id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v20);
    __break(1u);
    return result;
  }

  unint64_t v13 = v15;
LABEL_5:
  char v17 = *v4;
  if ((v14 & 1) != 0)
  {
    uint64_t v18 = v17[7];
    id result = (id)swift_unknownObjectRelease(*(void *)(v18 + 8 * v13));
    *(void *)(v18 + 8 * v13) = a1;
  }

  else
  {
    sub_100020668(v13, (uint64_t)a2, a1, v17);
    return a2;
  }

  return result;
}

_OWORD *sub_100020380(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10001EBB4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_100004B88(&qword_10005C1E0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10001EBB4(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    id result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if ((v17 & 1) != 0)
  {
    uint64_t v21 = (void *)(v20[7] + 32 * v16);
    sub_100022C5C(v21);
    return sub_100022C10(a1, v21);
  }

  else
  {
    sub_1000206AC(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain(a3);
  }

void sub_10002049C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  unint64_t v22 = v21;
  char v23 = v20;
  char v25 = v24;
  uint64_t v27 = v26;
  Swift::Int v28 = *v20;
  char v40 = (void *)v29;
  sub_10001EC18(v29);
  sub_1000235EC();
  if (v32)
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v33 = v30;
  char v34 = v31;
  sub_100004B88(v22);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(v25 & 1, v28)) {
    goto LABEL_5;
  }
  unint64_t v30 = sub_10001EC18((uint64_t)v40);
  if ((v34 & 1) != (v35 & 1))
  {
LABEL_9:
    uint64_t v39 = sub_1000092E0(v30, (unint64_t *)&qword_10005BE90, &OBJC_CLASS___NSXPCListener_ptr);
    ((void (*)(uint64_t))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:))(v39);
    __break(1u);
    return;
  }

  unint64_t v33 = v30;
LABEL_5:
  uint64_t v36 = (void *)*v23;
  if ((v34 & 1) != 0)
  {
    uint64_t v37 = v36[7];

    *(void *)(v37 + 8 * v33) = v27;
    sub_100009224();
  }

  else
  {
    sub_100020668(v33, (uint64_t)v40, v27, v36);
    id v38 = v40;
  }

unint64_t sub_100020590( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1LL << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_1000205DC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  type metadata accessor for OSSignpostID(0LL);
  sub_1000236F4();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t))(v10 + 32))(v9 + *(void *)(v10 + 72) * a1, a4);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_100020668(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1LL << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1LL);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

_OWORD *sub_1000206AC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100022C10(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_100020714(uint64_t *a1, uint64_t a2, uint64_t a3)
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
      Swift::Int v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
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
      char v19 = (void *)(v11 + 16 * v10);
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
  *uint64_t v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_10002132C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *uint64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_1000208C0(Swift::Int *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v2);
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      uint64_t v32 = v9;
      uint64_t v10 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v33;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v24 = sub_100020B58(v7, result + 1);
    Swift::Int v33 = v24;
    unint64_t v25 = *(void *)(v24 + 16);
    if (*(void *)(v24 + 24) <= v25)
    {
      uint64_t v30 = v25 + 1;
      id v31 = v8;
      sub_100021014(v30);
      uint64_t v26 = v33;
    }

    else
    {
      uint64_t v26 = v24;
      id v27 = v8;
    }

    sub_1000212AC((uint64_t)v8, v26);
    uint64_t v29 = *v3;
    *uint64_t v3 = v26;
  }

  else
  {
    Swift::Int v12 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v13 = NSObject._rawHashValue(seed:)(v12);
    uint64_t v14 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v15 = v13 & ~v14;
    if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
    {
      sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
      id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
      char v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        BOOL v21 = *(void **)(*(void *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        id v22 = v21;
        return 0LL;
      }

      uint64_t v18 = ~v14;
      while (1)
      {
        unint64_t v15 = (v15 + 1) & v18;
        if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
          break;
        }
        id v19 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
        char v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v33 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_1000214C4((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    *uint64_t v3 = v33;
  }

  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_100020B58(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  sub_100004B88(&qword_10005C210);
  uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
  uint64_t v23 = v4;
  uint64_t v5 = __CocoaSet.makeIterator()(a1);
  uint64_t v6 = __CocoaSet.Iterator.next()();
  if (!v6)
  {
LABEL_16:
    swift_release(v5);
    return v4;
  }

  uint64_t v7 = v6;
  uint64_t v8 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  while (1)
  {
    uint64_t v21 = v7;
    swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
    uint64_t v4 = v23;
    unint64_t v9 = *(void *)(v23 + 16);
    if (*(void *)(v23 + 24) <= v9)
    {
      sub_100021014(v9 + 1);
      uint64_t v4 = v23;
    }

    uint64_t v10 = v22;
    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v12 = v4 + 56;
    uint64_t v13 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v14 = result & ~v13;
    unint64_t v15 = v14 >> 6;
    if (((-1LL << v14) & ~*(void *)(v4 + 56 + 8 * (v14 >> 6))) == 0) {
      break;
    }
    unint64_t v16 = __clz(__rbit64((-1LL << v14) & ~*(void *)(v4 + 56 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_15:
    *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
    *(void *)(*(void *)(v4 + 48) + 8 * v16) = v10;
    ++*(void *)(v4 + 16);
    uint64_t v7 = __CocoaSet.Iterator.next()();
    if (!v7) {
      goto LABEL_16;
    }
  }

  char v17 = 0;
  unint64_t v18 = (unint64_t)(63 - v13) >> 6;
  while (++v15 != v18 || (v17 & 1) == 0)
  {
    BOOL v19 = v15 == v18;
    if (v15 == v18) {
      unint64_t v15 = 0LL;
    }
    v17 |= v19;
    uint64_t v20 = *(void *)(v12 + 8 * v15);
    if (v20 != -1)
    {
      unint64_t v16 = __clz(__rbit64(~v20)) + (v15 << 6);
      goto LABEL_15;
    }
  }

  __break(1u);
  return result;
}

Swift::Int sub_100020D3C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100004B88(&qword_10005B5B0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    Swift::Int v33 = (void *)(v3 + 56);
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
    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      BOOL v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v20, v21);
      Swift::Int result = Hasher._finalize()();
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0LL;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
      uint64_t v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
      *uint64_t v30 = v20;
      v30[1] = v21;
      ++*(void *)(v6 + 16);
      if (v9) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1LL)) {
        goto LABEL_41;
      }
      if (v16 >= v10) {
        goto LABEL_35;
      }
      unint64_t v17 = v33[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v10) {
          goto LABEL_35;
        }
        unint64_t v17 = v33[v13];
        if (!v17)
        {
          int64_t v13 = v16 + 2;
          if (v16 + 2 >= v10) {
            goto LABEL_35;
          }
          unint64_t v17 = v33[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 3;
            if (v18 >= v10)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v32;
              uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
              if (v31 > 63) {
                sub_1000274C0(0LL, (unint64_t)(v31 + 63) >> 6, v33);
              }
              else {
                *Swift::Int v33 = -1LL << v31;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v17 = v33[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1LL)) {
                  goto LABEL_42;
                }
                if (v13 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v17 = v33[v13];
                ++v18;
                if (v17) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v13 = v18;
          }
        }
      }

LABEL_23:
      unint64_t v9 = (v17 - 1) & v17;
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

      int64_t v10 = (v18 - 1) & v18;
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    int64_t v10 = (v17 - 1) & v17;
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v32)
  {
LABEL_35:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_37;
  }

  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
    int64_t v13 = v18;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v13 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v13);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }

    int64_t v10 = (v18 - 1) & v18;
  }

  BOOL v19 = v17 + 3;
  if (v19 >= v11)
  {
LABEL_35:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_37;
  }

  int64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    unint64_t v14 = v19;
    goto LABEL_23;
  }

  while (1)
  {
    unint64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_35;
    }
    int64_t v18 = *(void *)(v8 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }

Swift::Int sub_100021014(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100004B88(&qword_10005C210);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v8 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1LL << v7);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v3 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v14 = 0LL;
    if (!v10) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      uint64_t v20 = *(void *)(*(void *)(v3 + 48) + 8 * i);
      Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v21 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1LL << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) == 0)
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v21) >> 6;
        while (++v23 != v26 || (v25 & 1) == 0)
        {
          BOOL v27 = v23 == v26;
          if (v23 == v26) {
            unint64_t v23 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v23);
          if (v28 != -1)
          {
            unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v24 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v24;
      *(void *)(*(void *)(v6 + 48) + 8 * v24) = v20;
      ++*(void *)(v6 + 16);
      if (v10) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        goto LABEL_41;
      }
      if (v17 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = v8[v17];
      ++v14;
      if (!v18)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = v8[v14];
        if (!v18)
        {
          int64_t v14 = v17 + 2;
          if (v17 + 2 >= v11) {
            goto LABEL_35;
          }
          unint64_t v18 = v8[v14];
          if (!v18)
          {
            int64_t v19 = v17 + 3;
            if (v19 >= v11)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v30;
              uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
              if (v29 > 63) {
                sub_1000274C0(0LL, (unint64_t)(v29 + 63) >> 6, (void *)(v3 + 56));
              }
              else {
                *uint64_t v8 = -1LL << v29;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v18 = v8[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v14 = v19 + 1;
                if (__OFADD__(v19, 1LL)) {
                  goto LABEL_42;
                }
                if (v14 >= v11) {
                  goto LABEL_35;
                }
                unint64_t v18 = v8[v14];
                ++v19;
                if (v18) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v14 = v19;
          }
        }
      }

unint64_t sub_1000212AC(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_10002132C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100020D3C(v11);
  }

  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_100021648();
      goto LABEL_22;
    }

    sub_1000219A0(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  unint64_t result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    int64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(void *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v20 = (void *)(v15 + 16 * a3);
        uint64_t v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

void sub_1000214C4(uint64_t a1, unint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100021014(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_1000217F8();
      goto LABEL_14;
    }

    sub_100021C48(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
    id v14 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
    char v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }

    else
    {
      uint64_t v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
        char v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

void *sub_100021648()
{
  uint64_t v1 = v0;
  sub_100004B88(&qword_10005B5B0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    void *v22 = *v20;
    v22[1] = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain(v21);
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

    unint64_t v13 = (v18 - 1) & v18;
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

id sub_1000217F8()
{
  uint64_t v1 = v0;
  sub_100004B88(&qword_10005C210);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

Swift::Int sub_1000219A0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100004B88(&qword_10005B5B0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
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
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    int64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v21);
    String.hash(into:)(v33, v20, v21);
    Swift::Int result = Hasher._finalize()();
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    uint64_t v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
    *uint64_t v30 = v20;
    v30[1] = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      goto LABEL_39;
    }
    if (v16 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v32) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v13);
      if (!v17)
      {
        int64_t v13 = v16 + 2;
        if (v16 + 2 >= v32) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v13);
        if (!v17) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

Swift::Int sub_100021C48(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100004B88(&qword_10005C210);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v30 = v2;
  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v14 = 0LL;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    Swift::Int v20 = *(void *)(v6 + 40);
    id v21 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    Swift::Int result = NSObject._rawHashValue(seed:)(v20);
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    *(void *)(*(void *)(v6 + 48) + 8 * v25) = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      goto LABEL_39;
    }
    if (v17 >= v11) {
      goto LABEL_35;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }

void *sub_100021EBC(uint64_t a1)
{
  Swift::Int result = (void *)static _DictionaryStorage.copy(original:)(a1);
  uint64_t v3 = result;
  int64_t v4 = 0LL;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v6 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v7 = -1LL;
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v25 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    id v19 = objc_allocWithZone(&OBJC_CLASS___NSNumber);
    swift_bridgeObjectRetain(v16);
    Swift::Int result = [v19 initWithInteger:v18];
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << i;
    Swift::Int v20 = (void *)(v3[6] + 16 * i);
    *Swift::Int v20 = v17;
    v20[1] = v16;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    v3[2] = v23;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      goto LABEL_24;
    }
    if (v12 >= v25) {
      return v3;
    }
    unint64_t v13 = *(void *)(v24 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v25) {
        return v3;
      }
      unint64_t v13 = *(void *)(v24 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v25) {
          return v3;
        }
        unint64_t v13 = *(void *)(v24 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }

void *sub_1000220CC(uint64_t a1)
{
  Swift::Int result = (void *)static _DictionaryStorage.copy(original:)(a1);
  uint64_t v3 = result;
  int64_t v4 = 0LL;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v6 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v7 = -1LL;
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  unint64_t v10 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    id v19 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain(v17);
    Swift::Int result = [v19 integerValue];
    *(void *)&v10[(i >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << i;
    Swift::Int v20 = (void *)(v3[6] + 16 * i);
    *Swift::Int v20 = v18;
    v20[1] = v17;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    v3[2] = v23;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      goto LABEL_24;
    }
    if (v13 >= v9) {
      return v3;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v9) {
        return v3;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v9) {
          return v3;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }

void sub_1000222A8(uint64_t a1, void *a2)
{
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  [a2 setTaskTypeFilter:isa];
}

uint64_t sub_100022308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [a5 installedHammerConfigFileForLanguage:a1 assetType:a2 clientID:v8];

  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);

  return v10;
}

uint64_t sub_10002239C(void *a1)
{
  id v2 = [a1 userIdMask];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);

  return v3;
}

uint64_t sub_100022408(void *a1)
{
  id v2 = [a1 speechProfileContainers];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = sub_1000091B8(0LL, &qword_10005C1B8, &OBJC_CLASS___SFSpeechProfileContainer_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_10002247C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a5);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 =  [a8 installedGeoLMRegionSpecificAssetForLanguage:a1 clientID:v12 regionId:v13 mainAssetConfig:v14];

  if (!v15) {
    return 0LL;
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);

  return v16;
}

id sub_10002256C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  id v9 = [a4 addNamedEntity:v7 metadata:isa];

  return v9;
}

void sub_100022600(void *a1, SEL *a2)
{
  id v2 = sub_10002358C(a1, a2);
  if (v2)
  {
    static Data._unconditionallyBridgeFromObjectiveC(_:)(v2);
    sub_1000237A8();
  }

  sub_10002349C();
  sub_100023484();
}

void sub_100022644(void *a1, SEL *a2)
{
  id v2 = sub_10002358C(a1, a2);
  if (v2)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);
    sub_10002356C();
  }

  sub_100005168();
}

uint64_t sub_100022688(void *a1)
{
  id v1 = [a1 contextualNamedEntities];
  if (!v1) {
    return 0LL;
  }
  id v2 = v1;
  uint64_t v3 = sub_1000091B8(0LL, &qword_10005C1F8, &OBJC_CLASS____SFContextualNamedEntityCodingObject_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_1000226F4(void *a1)
{
  id v1 = [a1 taskTypeFilter];
  if (!v1) {
    return 0LL;
  }
  id v2 = v1;
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for String,  &protocol witness table for String);

  return v3;
}

void sub_100022750(void *a1, SEL *a2)
{
  id v2 = sub_10002358C(a1, a2);
  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    sub_1000237A8();
  }

  sub_10002349C();
  sub_100023484();
}

void sub_100022794(void *a1, SEL *a2)
{
  id v3 = sub_10002358C(a1, a2);
  sub_1000237B4();
  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  sub_100023738();
  sub_100023484();
}

void sub_1000227E8(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [a3 setUserProfileData:isa];
}

void sub_10002282C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = String._bridgeToObjectiveC()();
  [a3 setLeftContextText:v4];
}

void sub_100022870(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v14 = a3;
    }
    else {
      uint64_t v14 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(a3);
    if (!v7) {
      return;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v7) {
      return;
    }
  }

  if (!a1)
  {
LABEL_23:
    __break(1u);
    return;
  }

  if (!v6)
  {
    if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) <= a2)
    {
      sub_100026AD4((a3 & 0xFFFFFFFFFFFFFF8LL) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10), a1);
      return;
    }

    __break(1u);
    goto LABEL_21;
  }

  if (a3 < 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a3);
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v8);
  swift_bridgeObjectRelease(a3);
  if (v9 > a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if (v7 < 1)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  sub_100022AE8();
  swift_bridgeObjectRetain(a3);
  for (uint64_t i = 0LL; i != v7; ++i)
  {
    sub_100004B88(&qword_10005C190);
    unint64_t v11 = sub_1000229F4(v15, i, a3);
    id v13 = *v12;
    ((void (*)(void *, void))v11)(v15, 0LL);
    *(void *)(a1 + 8 * i) = v13;
  }

  swift_bridgeObjectRelease(a3);
}

void (*sub_1000229F4(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_100022A74(v6, a2, a3);
  return sub_100022A48;
}

void sub_100022A48(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_100022A74(void *a1, uint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001LL;
  sub_100027310(a2, (a3 & 0xC000000000000001LL) == 0);
  if (v6) {
    id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_100022AE0;
}

void sub_100022AE0(id *a1)
{
}

unint64_t sub_100022AE8()
{
  unint64_t result = qword_10005C198;
  if (!qword_10005C198)
  {
    uint64_t v1 = sub_100022B2C(&qword_10005C190);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005C198);
  }

  return result;
}

uint64_t sub_100022B2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100022B70()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100022B94()
{
}

uint64_t sub_100022BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100022BC4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100022BCC(uint64_t result, unint64_t a2)
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

_OWORD *sub_100022C10(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100022C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100022C5C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

int64_t sub_100022C7C(int64_t result, int a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1LL << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }

  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }

  unint64_t v8 = v7 & (-2LL << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0LL;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022D60(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1LL << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a4 + 36) == a2)
  {
    unint64_t v4 = (uint64_t *)(*(void *)(a4 + 48) + 16 * result);
    uint64_t v5 = *v4;
    swift_bridgeObjectRetain(v4[1]);
    return v5;
  }

LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_100022DE0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  uint64_t v2 = 64LL;
  for (uint64_t i = 9LL; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64LL;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

void sub_100022E60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004B88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_100005168();
}

void sub_100022E98(unint64_t *a1, unint64_t *a2, void *a3)
{
  if (!*a1)
  {
    uint64_t v4 = sub_1000091B8(255LL, a2, a3);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for NSObject, v4), a1);
  }

  sub_100005168();
}

void *sub_100022ED4(void *a1)
{
  unint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

unint64_t sub_100022F10()
{
  unint64_t result = qword_10005AD20;
  if (!qword_10005AD20)
  {
    type metadata accessor for LSRError(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10003DCD8, v1);
    atomic_store(result, (unint64_t *)&qword_10005AD20);
  }

  return result;
}

void sub_100022F50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_100022F78()
{
  uint64_t v1 = *(void *)(sub_100004B88((uint64_t *)&unk_10005BFB0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  uint64_t v5 = sub_100005154();
  unint64_t v13 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v14 = ((v13 + 23) & 0xFFFFFFFFFFFFFFF8LL) + 8;
  swift_bridgeObjectRelease( *(_TtC22localspeechrecognition19EARSpeechRecognizer **)(v0 + v13 + 8),  v6,  v7,  v8,  v9,  v10,  v11,  v12);
  return swift_deallocObject(v0, v14, v2 | 7);
}

uint64_t sub_100023038()
{
  uint64_t v2 = sub_100004B88((uint64_t *)&unk_10005BFB0);
  unint64_t v3 = (*(void *)(*(void *)(v2 - 8) + 64LL)
  uint64_t v4 = (v3 + 23) & 0xFFFFFFFFFFFFF8LL;
  uint64_t v5 = (uint64_t *)(v0 + v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = *(void *)(v0 + v4);
  unint64_t v9 = (void *)swift_task_alloc(dword_10005C23C);
  *(void *)(v1 + 16) = v9;
  *unint64_t v9 = v1;
  v9[1] = sub_100010390;
  uint64_t v10 = sub_100023574();
  return sub_100018360(v10, v11, v12, v13, v6, v7, v8);
}

uint64_t sub_1000230F0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1 != 1) {
    swift_bridgeObjectRelease(v1);
  }
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10002311C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

void sub_100023144(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_100023170(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_100023180(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain(result);
  }
  return result;
}

  ;
}

id sub_1000231B0(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_1000231B8()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_1000231DC(uint64_t a1)
{
  return swift_task_switch(a1, 0LL, 0LL);
}

uint64_t sub_1000231E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a9 = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a9, &a10, v10);
}

uint64_t sub_100023204@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_100023214()
{
  return swift_task_alloc(v0);
}

id sub_10002321C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100023224@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  return sub_100026B8C(0xD000000000000016LL, (a1 - 32) | 0x8000000000000000LL, (uint64_t *)va);
}

void sub_10002323C(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

  ;
}

id sub_10002326C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_100023274()
{
  return swift_unknownObjectRelease(*(void *)(*(void *)(v0 + 1128) + *(void *)(v0 + 1328)));
}

id sub_100023294(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_10002329C()
{
  return swift_bridgeObjectRetain(v0);
}

id sub_1000232A4(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_1000232AC()
{
  return swift_bridgeObjectRelease(v0);
}

id sub_1000232B4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_1000232C0()
{
  return swift_bridgeObjectRelease(0x8000000000000000LL);
}

uint64_t sub_1000232CC()
{
  return v0;
}

uint64_t sub_1000232D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100004B88(a3);
}

NSString sub_1000232E8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000232F0@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_100023300@<X0>(uint64_t a1@<X2>, char a2@<W4>, uint64_t a3@<X8>)
{
  return sub_100020154(5457241LL, 0xE300000000000000LL, a1, (a3 - 32) | 0x8000000000000000LL, a2);
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100023380()
{
  return swift_bridgeObjectRelease(v0);
}

id sub_100023388(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

void sub_100023390(id a1)
{
}

uint64_t sub_10002339C()
{
  return swift_bridgeObjectRelease(0LL);
}

void sub_1000233A4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)(v2 + a2);
  *(void *)(v2 + a2) = a1;
}

void sub_1000233B0(float a1)
{
  *uint64_t v1 = a1;
}

  ;
}

void sub_1000233D8()
{
  *uint64_t v0 = 0x8000000000000000LL;
}

uint64_t sub_1000233F4(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  return result;
}

id sub_100023400()
{
  return *(id *)(v0 + v1);
}

void sub_100023408()
{
  *uint64_t v0 = 0x8000000000000000LL;
}

uint64_t sub_100023424()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

id sub_10002342C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100023434()
{
  return v0;
}

uint64_t sub_100023440@<X0>(uint64_t a1@<X8>)
{
  return sub_1000274C0(0LL, (unint64_t)(a1 + 63) >> 6, v1);
}

  ;
}

BOOL sub_100023470(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v10, v11);
}

  ;
}

id sub_100023490(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_10002349C()
{
  return v0;
}

uint64_t sub_1000234A8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_1000234B4(uint64_t a1)
{
  if (a1 < 0) {
    return __CocoaDictionary.count.getter(a1);
  }
  else {
    return __CocoaDictionary.count.getter(a1 & 0xFFFFFFFFFFFFFF8LL);
  }
}

void sub_1000234C8(uint64_t a1@<X0>, uint64_t a2@<X1>, const char **a3@<X3>, uint64_t a4@<X8>)
{
}

uint64_t sub_1000234D0()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000234D8()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

uint64_t sub_1000234F8()
{
  return swift_release(v0);
}

uint64_t sub_100023500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 7LL);
}

BOOL sub_100023508(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100023518@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1));
}

id sub_100023520()
{
  return *(id *)(v1 + v0);
}

void sub_100023528()
{
}

void sub_100023530()
{
}

BOOL sub_100023538(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100023548()
{
  return v0;
}

uint64_t sub_100023554()
{
  return swift_retain(v0);
}

uint64_t sub_10002355C()
{
  return swift_bridgeObjectRetain(v0);
}

void sub_100023564(uint64_t a1, uint64_t *a2)
{
}

void sub_10002356C()
{
}

uint64_t sub_100023574()
{
  return v0;
}

id sub_10002358C(void *a1, SEL *a2)
{
  return [a1 *a2];
}

id sub_100023594()
{
  return *(id *)(v0 + 1112);
}

uint64_t sub_10002359C()
{
  return sub_1000091B8(0LL, v0, v1);
}

uint64_t sub_1000235AC()
{
  return sub_1000091B8(0LL, v0, v1);
}

uint64_t sub_1000235BC()
{
  return sub_100008FD4(v0, v1);
}

BOOL sub_1000235CC(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

  ;
}

void sub_1000235E0(unint64_t *a1)
{
}

  ;
}

uint64_t sub_100023600()
{
  return swift_task_dealloc(v0);
}

void sub_100023608(unint64_t *a1)
{
}

uint64_t sub_100023614()
{
  return swift_isUniquelyReferenced_nonNull_native(*v0);
}

void sub_10002361C(uint64_t a1, SEL *a2)
{
}

  ;
}

BOOL sub_100023638(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100023644()
{
  return swift_bridgeObjectRetain_n(v0, 2LL);
}

uint64_t sub_100023650()
{
  return swift_task_dealloc(v0);
}

id sub_100023658()
{
  return [*v1 *(SEL *)(v0 + 3416)];
}

uint64_t sub_100023664()
{
  return v0;
}

uint64_t sub_100023670()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

  ;
}

void sub_100023690()
{
}

id sub_10002369C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

  ;
}

char *sub_1000236BC(char *a1, int64_t a2)
{
  return sub_10001E738(a1, a2, 1, v2);
}

  ;
}

uint64_t sub_1000236DC()
{
  return v0(v1);
}

void sub_1000236E8()
{
  *(void *)(v1 - 104) = v0;
}

  ;
}

uint64_t sub_100023700(uint64_t a1, uint64_t a2)
{
  return _NativeDictionary._delete(at:)(a1, a2, v3, v2);
}

id sub_10002370C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

NSData sub_100023714()
{
  return Data._bridgeToObjectiveC()();
}

  ;
}

  ;
}

uint64_t sub_100023738()
{
  return v0;
}

NSDictionary sub_100023744()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100023750(uint64_t a1, uint64_t a2)
{
  return v3(v2, a2, v4);
}

void sub_10002375C()
{
}

uint64_t sub_100023768()
{
  return v0;
}

id sub_100023774(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id sub_100023780(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

NSArray sub_10002378C()
{
  return Array._bridgeToObjectiveC()();
}

void sub_100023794(uint64_t a1, SEL *a2)
{
}

uint64_t sub_10002379C()
{
  return 0LL;
}

void sub_1000237A8()
{
}

void sub_1000237B4()
{
}

void sub_1000237BC()
{
}

id sub_1000237C8(void *a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(&OBJC_CLASS___NSXPCConnection);
  uint64_t v8 = v3;
  id v9 = [v7 initWithListenerEndpoint:a1];
  uint64_t v10 = OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection] = v9;
  Swift::Int v11 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v12 = v9;
  id v13 = [v11 interfaceWithProtocol:&OBJC_PROTOCOL____SFXPCEARSpeechRecognitionResultStream];
  [v12 setRemoteObjectInterface:v13];

  unint64_t v14 = *(void **)&v8[v10];
  [v14 activate];
  id v15 = [v14 remoteObjectProxy];
  _bridgeAnyObjectToAny(_:)(v22, v15);
  swift_unknownObjectRelease(v15);
  uint64_t v16 = sub_100004B88((uint64_t *)&unk_10005C370);
  swift_dynamicCast(&v21, v22, (char *)&type metadata for Any + 8, v16, 7LL);
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy] = v21;
  *(void *)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_modelContextDelegateInterface] = a3;
  sub_100004BC8(a2, (uint64_t)&v8[OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_asrID]);
  id v17 = a3;

  v20.receiver = v8;
  v20.super_class = (Class)type metadata accessor for EARSpeechRecognitionResultStream(0LL);
  id v18 = objc_msgSendSuper2(&v20, "init");

  sub_100004C1C(a2);
  return v18;
}

id sub_100023980()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EARSpeechRecognitionResultStream(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100023A48()
{
  return type metadata accessor for EARSpeechRecognitionResultStream(0LL);
}

uint64_t type metadata accessor for EARSpeechRecognitionResultStream(uint64_t a1)
{
  uint64_t result = qword_10005C320;
  if (!qword_10005C320) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EARSpeechRecognitionResultStream);
  }
  return result;
}

void sub_100023A88(uint64_t a1, void *a2)
{
  if (qword_10005A200 != -1) {
    swift_once(&qword_10005A200, sub_10000348C);
  }
  uint64_t v4 = *(void *)(v2
                 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_modelContextDelegateInterface);
  uint64_t v5 = *(_TtC22localspeechrecognition19EARSpeechRecognizer **)(v4
                                                             + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_taskName
                                                             + 8);
  uint64_t v6 = (_TtC22localspeechrecognition19EARSpeechRecognizer **)(v4
                                                            + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents);
  swift_beginAccess( v4 + OBJC_IVAR____TtC22localspeechrecognition32EARModelContextDelegateInterface_pendingANECompilationContextEvents,  v30,  0LL,  0LL);
  id v7 = *v6;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  sub_1000035B4();
  swift_bridgeObjectRelease(v5, v8, v9, v10, v11, v12, v13, v14);
  swift_bridgeObjectRelease(v7, v15, v16, v17, v18, v19, v20, v21);
  sub_1000143E0((_TtC22localspeechrecognition19EARSpeechRecognizer *)_swiftEmptyArrayStorage);
  BOOL v22 = *(void **)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy);
  if (a2)
  {
    uint64_t v29 = a2;
    swift_errorRetain(a2);
    uint64_t v23 = sub_100004B88((uint64_t *)&unk_10005BE70);
    type metadata accessor for LSRError(0LL);
    else {
      int64_t v25 = 0LL;
    }
  }

  else
  {
    int64_t v25 = 0LL;
  }

  char v26 = sub_100014B40(v25);
  if (v26)
  {
    unint64_t v27 = v26;
LABEL_12:
    a2 = (void *)_convertErrorToNSError(_:)(v27);
    swift_errorRelease(v27);
    goto LABEL_13;
  }

  if (a2)
  {
    swift_errorRetain(a2);
    unint64_t v27 = (char *)a2;
    goto LABEL_12;
  }

LABEL_13:
  [v22 speechRecognizerDidFinishRecognitionWithError:a2];
}

  if (a4) {
LABEL_14:
  }
    *a4 = 0LL;
}

void sub_100023C98(uint64_t a1, uint64_t a2)
{
}

void sub_100023D14(uint64_t a1, uint64_t a2)
{
}

void sub_100023D90(uint64_t a1, uint64_t a2)
{
}

void sub_100023E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100024414(a2);
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy);
  sub_1000091B8(0LL, &qword_10005C340, &OBJC_CLASS___EARSpeechRecognitionResultPackage_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release(v3);
  [v4 speechRecognizerDidRecognizeFinalResultMultiUserPackages:isa];
  sub_100024624(isa);
}

void sub_100023F24(uint64_t a1, uint64_t a2)
{
}

void sub_100023FA0(uint64_t a1, uint64_t a2)
{
}

void sub_100023FBC(uint64_t a1, uint64_t a2, Class *a3, SEL *a4, SEL *a5)
{
  id v7 = objc_msgSend(objc_allocWithZone(*a3), *a4, a2);
  objc_msgSend( *(id *)(v5 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy),  *a5,  v7);
  sub_100024624(v7);
}

id sub_100024078()
{
  return objc_msgSend( *(id *)(v0 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy),  "speechRecognizerDidProcessAudioDuration:");
}

void sub_1000240EC( double a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SEL v15 = *(void **)(v8 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy);
  sub_1000091B8(0LL, &qword_10005B2B0, &OBJC_CLASS___NSNumber_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v15 speechRecognizerDidProduceEndpointFeaturesWithWordCount:a5 trailingSilenceDuration:a6 eosLikelihood:isa pauseCounts:a8 silencePos terior:a1 processedAudioDurationInMilliseconds:a2 acousticEndpointerScore:a3];
}

id sub_100024274(uint64_t a1, uint64_t a2)
{
  return [*(id *)(v2 + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_resultStreamProxy) speechRecognizerDidReportStatus:a2];
}

void sub_100024354()
{
}

void sub_10002438C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = "\b";
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_10000C808(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 4LL, v4, a1 + 80);
  }

void *sub_100024414(uint64_t a1)
{
  uint64_t result = (void *)static _DictionaryStorage.copy(original:)(a1);
  unint64_t v3 = result;
  int64_t v4 = 0LL;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v6 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v7 = -1LL;
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v25 = (unint64_t)(v6 + 63) >> 6;
  id v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    SEL v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    id v19 = objc_allocWithZone(&OBJC_CLASS___EARSpeechRecognitionResultPackage);
    swift_bridgeObjectRetain(v16);
    uint64_t result = [v19 initWithPackage:v18];
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << i;
    id v20 = (void *)(v3[6] + 16 * i);
    *id v20 = v17;
    v20[1] = v16;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    v3[2] = v23;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      goto LABEL_24;
    }
    if (v12 >= v25) {
      return v3;
    }
    unint64_t v13 = *(void *)(v24 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v25) {
        return v3;
      }
      unint64_t v13 = *(void *)(v24 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v25) {
          return v3;
        }
        unint64_t v13 = *(void *)(v24 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }

void sub_100024624(id a1)
{
}

uint64_t sub_100024634()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = String._bridgeToObjectiveC()();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 levelForFactor:v2 withNamespaceName:v3];

  if (!v4) {
    return 2LL;
  }
  unsigned int v5 = [v4 BOOLeanValue];

  return v5 ^ 1;
}

uint64_t type metadata accessor for TrialExperimentationAssetManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition32TrialExperimentationAssetManager);
}

void ClientInfo.init(identifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3 + *(int *)(type metadata accessor for ClientInfo(0LL) + 32);
  uint64_t v7 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  sub_100006CF0(v6, 1LL, 1LL, v7);
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = 0xE000000000000000LL;
  *(_OWORD *)(a3 + 32) = xmmword_10003E330;
  *(_OWORD *)(a3 + 48) = xmmword_10003E330;
  sub_100023484();
}

uint64_t ClientInfo.init(identifier:source:applicationName:inputOrigin:loggingInfo:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  *a9 = a1;
  a9[1] = a2;
  a9[4] = a5;
  a9[5] = a6;
  a9[2] = a3;
  a9[3] = a4;
  a9[6] = a7;
  a9[7] = a8;
  uint64_t v10 = (uint64_t)a9 + *(int *)(type metadata accessor for ClientInfo(0LL) + 32);
  return sub_100024814(a10, v10);
}

uint64_t type metadata accessor for ClientInfo(uint64_t a1)
{
  return sub_1000247E4(a1, (uint64_t *)&unk_10005C490, (uint64_t)&nominal type descriptor for ClientInfo);
}

uint64_t type metadata accessor for ClientInfo.LoggingInfo(uint64_t a1)
{
  return sub_1000247E4(a1, qword_10005C538, (uint64_t)&nominal type descriptor for ClientInfo.LoggingInfo);
}

uint64_t sub_1000247E4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_100024814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005C428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void ClientInfo.init(identifier:applicationName:source:inputOrigin:)()
{
}

void ClientInfo.init(identifier:applicationName:source:inputOrigin:dictationUIInteractionId:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _TtC22localspeechrecognition19EARSpeechRecognizer *a10)
{
}

void ClientInfo.identifier.getter()
{
}

void ClientInfo.source.getter()
{
}

void ClientInfo.applicationName.getter()
{
}

void ClientInfo.inputOrigin.getter()
{
}

uint64_t ClientInfo.loggingInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientInfo(0LL) + 32);
  return sub_10002496C(v3, a1);
}

uint64_t sub_10002496C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B88(&qword_10005C428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t ClientInfo.LoggingInfo.asrID.getter()
{
  uint64_t v0 = sub_10002349C();
  return sub_100025D98(v0, v1, v2, v3);
}

uint64_t ClientInfo.LoggingInfo.requestID.getter()
{
  uint64_t v0 = sub_10002349C();
  return sub_100025D98(v0, v1, v2, v3);
}

void ClientInfo.LoggingInfo.dictationUIInteractionID.getter()
{
}

uint64_t ClientInfo.LoggingInfo.init(asrID:requestID:dictationUIInteractionID:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100005154();
  id v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL);
  v11(a5, a1, v10);
  uint64_t v12 = sub_100025D90();
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a5 + *(int *)(v12 + 20), a2, v10);
  id v14 = (void *)(a5 + *(int *)(v12 + 24));
  *id v14 = a3;
  v14[1] = a4;
  return result;
}

void static ClientInfo.LoggingInfo.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((((uint64_t (*)(void))static UUID.== infix(_:_:))() & 1) != 0
    && (uint64_t v4 = sub_100025D90(), (static UUID.== infix(_:_:)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20)) & 1) != 0)
    && ((uint64_t v5 = *(int *)(v4 + 24),
         uint64_t v6 = *(void *)(a1 + v5),
         uint64_t v7 = *(void *)(a1 + v5 + 8),
         unint64_t v8 = (void *)(a2 + v5),
         uint64_t v9 = v8[1],
         v6 == *v8)
      ? (BOOL v10 = v7 == v9)
      : (BOOL v10 = 0),
        !v10))
  {
    _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, *v8, v9, 0LL);
  }

  else
  {
    sub_100023484();
  }

uint64_t static ClientInfo.__derived_struct_equals(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_100025D90();
  sub_100005114();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100004B88(&qword_10005C430);
  sub_100005114();
  __chkstk_darwin(v9);
  id v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100004B88(&qword_10005C428);
  sub_100005114();
  uint64_t v13 = __chkstk_darwin(v12);
  id v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v53 - v17;
  __chkstk_darwin(v16);
  id v20 = (char *)&v53 - v19;
  uint64_t v21 = a1[1];
  uint64_t v22 = a2[1];
  BOOL v23 = *a1 == *a2 && v21 == v22;
  if (!v23)
  {
    char v24 = 0;
    if ((sub_100025D88(*a1, v21, *a2, v22) & 1) == 0) {
      return v24 & 1;
    }
  }

  uint64_t v25 = a1[2];
  uint64_t v26 = a1[3];
  uint64_t v27 = a2[2];
  uint64_t v28 = a2[3];
  if (v25 != v27 || v26 != v28)
  {
    char v24 = 0;
    if ((sub_100025D88(v25, v26, v27, v28) & 1) == 0) {
      return v24 & 1;
    }
  }

  uint64_t v30 = a1[5];
  uint64_t v31 = a2[5];
  if (v30)
  {
    if (!v31) {
      goto LABEL_29;
    }
    uint64_t v32 = a1[4];
    uint64_t v33 = a2[4];
    if (v32 != v33 || v30 != v31)
    {
      char v24 = 0;
      if ((sub_100025D88(v32, v30, v33, v31) & 1) == 0) {
        return v24 & 1;
      }
    }
  }

  else if (v31)
  {
    goto LABEL_29;
  }

  uint64_t v35 = a1[7];
  uint64_t v36 = a2[7];
  if (v35)
  {
    if (v36)
    {
      uint64_t v37 = a1[6];
      uint64_t v38 = a2[6];
      if (v37 != v38 || v35 != v36)
      {
        char v24 = 0;
        if ((sub_100025D88(v37, v35, v38, v36) & 1) == 0) {
          return v24 & 1;
        }
      }

      goto LABEL_30;
    }

uint64_t sub_100024E80(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100024EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v14);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    uint64_t v9 = *(int *)(a3 + 32);
    uint64_t v10 = (char *)a2 + v9;
    id v11 = (char *)a1 + v9;
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v12 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    if (sub_100004C10((uint64_t)v10, 1LL, v12))
    {
      uint64_t v13 = sub_100004B88(&qword_10005C428);
      memcpy(v11, v10, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    else
    {
      uint64_t v15 = type metadata accessor for UUID(0LL);
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL);
      v16(v11, v10, v15);
      v16(&v11[*(int *)(v12 + 20)], &v10[*(int *)(v12 + 20)], v15);
      uint64_t v17 = *(int *)(v12 + 24);
      uint64_t v18 = &v11[v17];
      uint64_t v19 = &v10[v17];
      uint64_t v20 = *((void *)v19 + 1);
      *(void *)uint64_t v18 = *(void *)v19;
      *((void *)v18 + 1) = v20;
      swift_bridgeObjectRetain(v20);
      sub_100006CF0((uint64_t)v11, 0LL, 1LL, v12);
    }
  }

  return v3;
}

void destroy for ClientInfo( _TtC22localspeechrecognition19EARSpeechRecognizer **a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v31 = (uint64_t)a1 + *(int *)(a2 + 32);
  uint64_t v32 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  if (!sub_100004C10(v31, 1LL, v32))
  {
    uint64_t v33 = type metadata accessor for UUID(0LL);
    char v34 = *(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8LL);
    v34(v31, v33);
    v34(v31 + *(int *)(v32 + 20), v33);
    swift_bridgeObjectRelease( *(_TtC22localspeechrecognition19EARSpeechRecognizer **)(v31 + *(int *)(v32 + 24) + 8),  v35,  v36,  v37,  v38,  v39,  v40,  v41);
  }

void *initializeWithCopy for ClientInfo(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)a2 + v8;
  SEL v10 = (char *)a1 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v11 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  if (sub_100004C10((uint64_t)v9, 1LL, v11))
  {
    uint64_t v12 = sub_100004B88(&qword_10005C428);
    memcpy(v10, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    uint64_t v13 = type metadata accessor for UUID(0LL);
    id v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL);
    v14(v10, v9, v13);
    v14(&v10[*(int *)(v11 + 20)], &v9[*(int *)(v11 + 20)], v13);
    uint64_t v15 = *(int *)(v11 + 24);
    id v16 = &v10[v15];
    SEL v17 = &v9[v15];
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)id v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    swift_bridgeObjectRetain(v18);
    sub_100006CF0((uint64_t)v10, 0LL, 1LL, v11);
  }

  return a1;
}

void *assignWithCopy for ClientInfo(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7, v8, v9, v10, v11, v12, v13, v14);
  a1[2] = a2[2];
  uint64_t v15 = a2[3];
  id v16 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[3];
  a1[3] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16, v17, v18, v19, v20, v21, v22, v23);
  a1[4] = a2[4];
  uint64_t v24 = a2[5];
  id v25 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[5];
  a1[5] = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25, v26, v27, v28, v29, v30, v31, v32);
  a1[6] = a2[6];
  uint64_t v33 = a2[7];
  char v34 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[7];
  a1[7] = v33;
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRelease(v34, v35, v36, v37, v38, v39, v40, v41);
  uint64_t v42 = *(int *)(a3 + 32);
  char v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  int v46 = sub_100004C10((uint64_t)v43, 1LL, v45);
  int v47 = sub_100004C10((uint64_t)v44, 1LL, v45);
  if (!v46)
  {
    if (!v47)
    {
      uint64_t v56 = type metadata accessor for UUID(0LL);
      Class v57 = *(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 24LL);
      v57(v43, v44, v56);
      v57(&v43[*(int *)(v45 + 20)], &v44[*(int *)(v45 + 20)], v56);
      uint64_t v58 = *(int *)(v45 + 24);
      uint64_t v59 = &v43[v58];
      uint64_t v60 = &v44[v58];
      *(void *)uint64_t v59 = *(void *)v60;
      uint64_t v61 = *((void *)v60 + 1);
      id v62 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)*((void *)v59 + 1);
      *((void *)v59 + 1) = v61;
      swift_bridgeObjectRetain(v61);
      swift_bridgeObjectRelease(v62, v63, v64, v65, v66, v67, v68, v69);
      return a1;
    }

    sub_100024E80((uint64_t)v43);
    goto LABEL_6;
  }

  if (v47)
  {
LABEL_6:
    uint64_t v54 = sub_100004B88(&qword_10005C428);
    memcpy(v43, v44, *(void *)(*(void *)(v54 - 8) + 64LL));
    return a1;
  }

  uint64_t v48 = type metadata accessor for UUID(0LL);
  BOOL v49 = *(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16LL);
  v49(v43, v44, v48);
  v49(&v43[*(int *)(v45 + 20)], &v44[*(int *)(v45 + 20)], v48);
  uint64_t v50 = *(int *)(v45 + 24);
  uint64_t v51 = &v43[v50];
  id v52 = &v44[v50];
  *(void *)uint64_t v51 = *(void *)v52;
  uint64_t v53 = *((void *)v52 + 1);
  *((void *)v51 + 1) = v53;
  swift_bridgeObjectRetain(v53);
  sub_100006CF0((uint64_t)v43, 0LL, 1LL, v45);
  return a1;
}

_OWORD *initializeWithTake for ClientInfo(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  __int128 v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  SEL v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  if (sub_100004C10((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_100004B88(&qword_10005C428);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    uint64_t v11 = type metadata accessor for UUID(0LL);
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL);
    v12(v7, v8, v11);
    v12(&v7[*(int *)(v9 + 20)], &v8[*(int *)(v9 + 20)], v11);
    *(_OWORD *)&v7[*(int *)(v9 + 24)] = *(_OWORD *)&v8[*(int *)(v9 + 24)];
    sub_100006CF0((uint64_t)v7, 0LL, 1LL, v9);
  }

  return a1;
}

void *assignWithTake for ClientInfo( void *a1, uint64_t a2, int *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v11 = *(void *)(a2 + 8);
  id v12 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[1];
  *a1 = *(void *)a2;
  a1[1] = v11;
  swift_bridgeObjectRelease(v12, (SEL)a2, a3, a4, a5, a6, a7, a8);
  uint64_t v13 = *(void *)(a2 + 24);
  id v14 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[3];
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v13;
  swift_bridgeObjectRelease(v14, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v22 = *(void *)(a2 + 40);
  id v23 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[5];
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v22;
  swift_bridgeObjectRelease(v23, v24, v25, v26, v27, v28, v29, v30);
  uint64_t v31 = *(void *)(a2 + 56);
  id v32 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)a1[7];
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v31;
  swift_bridgeObjectRelease(v32, v33, v34, v35, v36, v37, v38, v39);
  uint64_t v40 = a3[8];
  id v41 = (char *)a1 + v40;
  uint64_t v42 = (char *)(a2 + v40);
  uint64_t v43 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  int v44 = sub_100004C10((uint64_t)v41, 1LL, v43);
  int v45 = sub_100004C10((uint64_t)v42, 1LL, v43);
  if (!v44)
  {
    if (!v45)
    {
      uint64_t v50 = type metadata accessor for UUID(0LL);
      uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 40LL);
      v51(v41, v42, v50);
      v51(&v41[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v50);
      uint64_t v52 = *(int *)(v43 + 24);
      uint64_t v53 = &v41[v52];
      uint64_t v54 = &v42[v52];
      uint64_t v56 = *(void *)v54;
      uint64_t v55 = *((void *)v54 + 1);
      Class v57 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)*((void *)v53 + 1);
      *(void *)uint64_t v53 = v56;
      *((void *)v53 + 1) = v55;
      swift_bridgeObjectRelease(v57, v58, v59, v60, v61, v62, v63, v64);
      return a1;
    }

    sub_100024E80((uint64_t)v41);
    goto LABEL_6;
  }

  if (v45)
  {
LABEL_6:
    uint64_t v48 = sub_100004B88(&qword_10005C428);
    memcpy(v41, v42, *(void *)(*(void *)(v48 - 8) + 64LL));
    return a1;
  }

  uint64_t v46 = type metadata accessor for UUID(0LL);
  int v47 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32LL);
  v47(v41, v42, v46);
  v47(&v41[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v46);
  *(_OWORD *)&v41[*(int *)(v43 + 24)] = *(_OWORD *)&v42[*(int *)(v43 + 24)];
  sub_100006CF0((uint64_t)v41, 0LL, 1LL, v43);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000256D4);
}

void sub_1000256D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_100025DBC(*(void *)(a1 + 8));
    sub_100023484();
  }

  else
  {
    uint64_t v6 = sub_100004B88(&qword_10005C428);
    sub_100025D70(a1 + *(int *)(a3 + 32), a2, v6);
  }

uint64_t storeEnumTagSinglePayload for ClientInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002573C);
}

void sub_10002573C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + 8) = (a2 - 1);
    sub_100023484();
  }

  else
  {
    uint64_t v7 = sub_100004B88(&qword_10005C428);
    sub_100025D7C(a1 + *(int *)(a4 + 32), a2, a2, v7);
  }

void sub_10002579C(uint64_t a1)
{
  v4[0] = &unk_10003E3B8;
  v4[1] = &unk_10003E3B8;
  v4[2] = &unk_10003E3D0;
  void v4[3] = &unk_10003E3D0;
  sub_10002581C(319LL);
  if (v3 <= 0x3F)
  {
    void v4[4] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
  }

void sub_10002581C(uint64_t a1)
{
  if (!qword_10005C4A0)
  {
    uint64_t v2 = type metadata accessor for ClientInfo.LoggingInfo(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10005C4A0);
    }
  }

uint64_t *initializeBufferWithCopyOfBuffer for ClientInfo.LoggingInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v13);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    SEL v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain(v12);
  }

  return a1;
}

uint64_t destroy for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  return swift_bridgeObjectRelease(*(void *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t initializeWithCopy for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRetain(v11);
  return a1;
}

uint64_t assignWithCopy for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v12 = v9[1];
  v9[1] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t initializeWithTake for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + swift_release(*(void *)(v0 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v13 = v9[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease(v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100025BC0);
}

void sub_100025BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005154();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    sub_100025D70(a1, a2, v6);
  }

  else
  {
    sub_100025DBC(*(void *)(a1 + *(int *)(a3 + 24) + 8));
    sub_100023484();
  }

uint64_t storeEnumTagSinglePayload for ClientInfo.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100025C28);
}

void sub_100025C28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100005154();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    sub_100025D7C(a1, a2, a2, v8);
  }

  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
    sub_100023484();
  }

uint64_t sub_100025C8C(uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = v4[0];
    v4[2] = &unk_10003E3B8;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_100025D00()
{
  uint64_t v9 = (uint64_t)v8 + *(int *)(type metadata accessor for ClientInfo(0LL) + 32);
  uint64_t v10 = type metadata accessor for ClientInfo.LoggingInfo(0LL);
  uint64_t result = sub_100006CF0(v9, 1LL, 1LL, v10);
  *uint64_t v8 = v7;
  v8[1] = v6;
  void v8[4] = v5;
  v8[5] = v4;
  v8[2] = v3;
  v8[3] = v2;
  v8[6] = v1;
  v8[7] = v0;
  return result;
}

  ;
}

uint64_t sub_100025D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004C10(a1, a2, a3);
}

uint64_t sub_100025D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006CF0(a1, a2, a3, a4);
}

uint64_t sub_100025D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
}

uint64_t sub_100025D90()
{
  return type metadata accessor for ClientInfo.LoggingInfo(0LL);
}

uint64_t sub_100025D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_100025DA0(uint64_t a1)
{
  return sub_100004C10(a1, 1LL, v1);
}

uint64_t sub_100025DBC@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

id sub_100025DD0(uint64_t a1)
{
  return sub_100025F8C(a1, type metadata accessor for AssistantAssetDelegateInterface, &qword_10005C908);
}

uint64_t sub_100025E1C()
{
  return sub_100028B20(OBJC_IVAR____TtC22localspeechrecognition31AssistantAssetDelegateInterface_statusForLanguage);
}

uint64_t sub_100025E88(uint64_t a1)
{
  return sub_100028AE0(a1);
}

void sub_100025ED4(_TtC22localspeechrecognition19EARSpeechRecognizer *a1)
{
}

id sub_100025EF0()
{
  return sub_100026648(3LL, type metadata accessor for AssistantAssetDelegateInterface);
}

uint64_t type metadata accessor for AssistantAssetDelegateInterface()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition31AssistantAssetDelegateInterface);
}

id sub_100025F78(uint64_t a1)
{
  return sub_100025F8C(a1, type metadata accessor for GeneralASRAssetDelegateInterface, &qword_10005C910);
}

id sub_100025F8C(uint64_t a1, uint64_t (*a2)(void), void *a3)
{
  id result = [objc_allocWithZone((Class)a2()) init];
  *a3 = result;
  return result;
}

id sub_100025FC0(void *a1, id *a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return *a2;
}

Class sub_100026030(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

uint64_t sub_10002607C()
{
  return sub_100028B20(OBJC_IVAR____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface_statusForLanguage);
}

uint64_t sub_1000260E8(uint64_t a1)
{
  return sub_100028AE0(a1);
}

char *sub_1000260F4(uint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v9 = *a1;
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___SFEntitledAssetManager);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 sharedInstance];
  uint64_t v12 = *a2;
  *(void *)&v11[v12] = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);

  v37.receiver = v11;
  v37.super_class = (Class)a3();
  uint64_t v13 = (char *)objc_msgSendSuper2(&v37, "init");
  id v14 = *(void **)&v13[*a1];
  SEL v15 = v13;
  [v14 registerAssetDelegate:v15 assetType:a4];
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  uint64_t v16 = sub_10000706C();
  id v17 = (void *)sub_100004C5C(v16, (uint64_t)qword_10005C6F8);
  Logger.logObject.getter(v17);
  os_log_type_t v18 = sub_100028B74();
  if (sub_100023508(v18))
  {
    id v19 = (_DWORD *)sub_100007000(12LL);
    uint64_t v20 = sub_100007000(32LL);
    uint64_t v36 = v20;
    *id v19 = 136315138;
    id v21 = (id)SFEntitledAssetTypeToString(a4);
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    SEL v24 = v23;

    uint64_t v35 = sub_100026B8C(v22, (unint64_t)v24, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v19 + 1);
    swift_bridgeObjectRelease(v24, v25, v26, v27, v28, v29, v30, v31);
    sub_100028B0C((void *)&_mh_execute_header, v32, v33, "Now observing %s asset updates.");
    swift_arrayDestroy(v20, 1LL);
    sub_100006FF4(v20);
    sub_100006FF4((uint64_t)v19);
  }

  return v15;
}

void sub_100026348(_TtC22localspeechrecognition19EARSpeechRecognizer *a1)
{
}

void sub_100026358( _TtC22localspeechrecognition19EARSpeechRecognizer *a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v5 = (id)SFEntitledAssetTypeToString(a2);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  unint64_t v8 = v7;

  uint64_t v9 = swift_bridgeObjectRetain(a1);
  a3(v9);
  uint64_t v10 = swift_bridgeObjectRetain(a1);
  uint64_t v11 = sub_100028094(v10);
  swift_bridgeObjectRelease(a1, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v19 = swift_bridgeObjectRetain(v11);
  uint64_t v20 = sub_10002760C(v19);
  swift_release(v11);
  v40[0] = (uint64_t)v20;
  sub_1000274DC(v40);
  swift_release(v11);
  uint64_t v21 = v40[0];
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  uint64_t v22 = sub_10000706C();
  id v23 = (os_log_s *)sub_100004C5C(v22, (uint64_t)qword_10005C6F8);
  swift_bridgeObjectRetain(v8);
  uint64_t v24 = swift_retain(v21);
  Logger.logObject.getter(v24);
  os_log_type_t v25 = sub_100028B74();
  if (os_log_type_enabled(v23, v25))
  {
    uint64_t v26 = sub_100007000(22LL);
    uint64_t v27 = sub_100007000(64LL);
    v40[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315394;
    swift_bridgeObjectRetain(v8);
    uint64_t v39 = sub_100026B8C(v6, v8, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v26 + 4);
    swift_bridgeObjectRelease_n(v8, 3LL);
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v28 = sub_10002355C();
    uint64_t v29 = Array.description.getter(v28, &type metadata for String);
    id v31 = v30;
    swift_release(v21);
    uint64_t v39 = sub_100026B8C(v29, (unint64_t)v31, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v26 + 14);
    sub_100028B68();
    swift_bridgeObjectRelease(v31, v32, v33, v34, v35, v36, v37, v38);
    _os_log_impl( (void *)&_mh_execute_header,  v23,  v25,  "Received update for %s assets, available languages: %s",  (uint8_t *)v26,  0x16u);
    swift_arrayDestroy(v27, 2LL);
    sub_100006FF4(v27);
    sub_100006FF4(v26);
  }

  else
  {

    sub_100028B68();
    swift_bridgeObjectRelease_n(v8, 2LL);
  }

uint64_t sub_1000265D8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  id v7 = a1;
  a4(v6);

  return swift_bridgeObjectRelease(v6);
}

id sub_100026638()
{
  return sub_100026648(7LL, type metadata accessor for GeneralASRAssetDelegateInterface);
}

id sub_100026648(uint64_t a1, uint64_t (*a2)(void))
{
  id v5 = v2;
  if (qword_10005A208 != -1) {
    swift_once(&qword_10005A208, sub_100005224);
  }
  uint64_t v6 = sub_10000706C();
  id v7 = (void *)sub_100004C5C(v6, (uint64_t)qword_10005C6F8);
  Logger.logObject.getter(v7);
  os_log_type_t v8 = sub_100028B74();
  if (sub_100023508(v8))
  {
    uint64_t v28 = a2;
    uint64_t v9 = v5;
    uint64_t v10 = (_DWORD *)sub_100007000(12LL);
    uint64_t v11 = sub_100007000(32LL);
    uint64_t v30 = v11;
    *uint64_t v10 = 136315138;
    id v12 = (id)SFEntitledAssetTypeToString(a1);
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    unint64_t v15 = v14;

    uint64_t v29 = sub_100026B8C(v13, v15, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v10 + 1);
    id v16 = (_TtC22localspeechrecognition19EARSpeechRecognizer *)v15;
    id v5 = v9;
    a2 = v28;
    swift_bridgeObjectRelease(v16, v17, v18, v19, v20, v21, v22, v23);
    sub_100028B0C((void *)&_mh_execute_header, v24, v25, "No longer observing %s asset updates.");
    swift_arrayDestroy(v11, 1LL);
    sub_100006FF4(v11);
    sub_100006FF4((uint64_t)v10);
  }

  uint64_t v26 = (objc_class *)a2();
  v31.receiver = v5;
  v31.super_class = v26;
  return objc_msgSendSuper2(&v31, "dealloc");
}

uint64_t type metadata accessor for GeneralASRAssetDelegateInterface()
{
  return objc_opt_self(&OBJC_CLASS____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface);
}

void *sub_10002684C(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_100010594();
    id result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL);
    __break(1u);
  }

  else if (a1)
  {
    id result = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(a1, &type metadata for String);
    result[2] = a1;
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

char *sub_1000268D8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100010594();
    id result = (char *)sub_100028A9C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v4,  (uint64_t)"Swift/UnsafePointer.swift",  v5,  v6,  v7,  v8);
    __break(1u);
  }

  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_100028A8C(a3, result);
  }

  return result;
}

char *sub_10002693C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100010594();
    id result = (char *)sub_100028A9C( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v4,  (uint64_t)"Swift/UnsafePointer.swift",  v5,  v6,  v7,  v8);
    __break(1u);
  }

  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_100028A8C(a3, result);
  }

  return result;
}

uint64_t sub_1000269A0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_100010594();
    sub_100028B38();
  }

  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    sub_100010594();
    sub_100028B28();
  }

  uint64_t result = sub_100028A9C(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

void *sub_100026A3C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_100010594();
    sub_100028B38();
  }

  else
  {
    if (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst) {
      return memcpy(__dst, __src, 8 * a2);
    }
    sub_100010594();
    sub_100028B28();
  }

  uint64_t result = (void *)sub_100028A9C(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

uint64_t sub_100026AD4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_100010594();
    sub_100028B38();
  }

  else
  {
    if (a3 + 8 * a2 <= a1 || a1 + 8 * a2 <= a3)
    {
      sub_100028A50();
      return swift_arrayInitWithCopy(a3);
    }

    sub_100010594();
    sub_100028B28();
  }

  uint64_t result = sub_100028A9C(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  __break(1u);
  return result;
}

uint64_t sub_100026B8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100026C58(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100022C20((uint64_t)v12, *a3);
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
      sub_100022C20((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    sub_10002355C();
  }

  sub_100022C5C(v12);
  return v7;
}

void *sub_100026C58(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100026DAC((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_100026E70(a5, a6);
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
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL);
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

void *sub_100026DAC(char *__src, size_t __n, char *__dst)
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

void *sub_100026E70(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100026F04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_1000270D8(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000270D8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100026F04(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_100027074(v4, 0LL);
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
    uint64_t v9 = "Insufficient space allocated to copy string contents";
    uint64_t v10 = "Swift/StringUTF8View.swift";
    uint64_t v11 = 52LL;
    uint64_t v12 = 26LL;
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t v9 = "invalid Collection: less than 'count' elements in collection";
  uint64_t v10 = "Swift/ContiguousArrayBuffer.swift";
  uint64_t v11 = 60LL;
  uint64_t v12 = 33LL;
LABEL_15:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11LL, 2LL, v9, v11, 2LL, v10, v12);
  __break(1u);
  return result;
}

void *sub_100027074(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100004B88((uint64_t *)&unk_10005C650);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  _OWORD v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000270D8(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_100004B88((uint64_t *)&unk_10005C650);
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
  int v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100027270(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000271AC(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000271AC(char *__src, size_t __n, char *__dst)
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

char *sub_100027270(char *__src, size_t __len, char *__dst)
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

unint64_t sub_1000272F0(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

unint64_t sub_100027314(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

void sub_100027338(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    sub_100028B58();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_100028B48();
    }
  }

  else
  {
    uint64_t v6 = a2;
  }

  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    uint64_t v11 = sub_100004B88(&qword_10005B5A8);
    size_t v12 = (char *)sub_100028AD4(v11, 16 * v10);
    j__malloc_size(v12);
    sub_100028AF0();
    *((void *)v12 + 2) = v9;
    *((void *)v12 + 3) = v13;
  }

  else
  {
    size_t v12 = (char *)&_swiftEmptyArrayStorage;
  }

  int v14 = v12 + 32;
  uint64_t v15 = (char *)(a4 + 32);
  if ((a1 & 1) != 0)
  {
    sub_1000268D8(v15, v9, v14);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000269A0((unint64_t)v15, v9, (unint64_t)v14);
  }

  swift_release(a4);
  sub_100023484();
}

void sub_1000273EC(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1000273F8(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_100027404(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  if ((a3 & 1) != 0)
  {
    sub_100028B58();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_100028B48();
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    uint64_t v12 = sub_100004B88(a5);
    uint64_t v13 = (char *)sub_100028AD4(v12, 8 * v11);
    size_t v14 = j__malloc_size(v13);
    *((void *)v13 + 2) = v10;
    *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 8);
  }

  else
  {
    uint64_t v13 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v15 = v13 + 32;
  int v16 = (char *)(a4 + 32);
  if ((a1 & 1) != 0)
  {
    sub_10002693C(v16, v10, v15);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_100026A3C(v16, v10, v15);
  }

  swift_release(a4);
  sub_100023484();
}

uint64_t sub_1000274C0(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }

  return result;
}

void sub_1000274DC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
  {
    sub_100028A3C(v2);
    uint64_t v2 = v3;
  }

  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_1000276EC(v5);
  *a1 = v2;
}

void *sub_100027544(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_100004B88(&qword_10005B5A8);
  uint64_t v4 = (void *)sub_100028AD4(v3, 16 * v1);
  j__malloc_size(v4);
  sub_100028AF0();
  v4[2] = v1;
  void v4[3] = v5;
  uint64_t v6 = sub_100028644((uint64_t)&v9, v4 + 4, v1, a1);
  uint64_t v7 = v9;
  sub_10002355C();
  sub_10000C5E4(v7);
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

void *sub_10002760C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_100004B88(&qword_10005B5A8);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  size_t v5 = j__malloc_size(v4);
  v4[2] = v1;
  void v4[3] = 2 * ((uint64_t)(v5 - 32) / 16);
  uint64_t v6 = sub_100028840((uint64_t)&v9, v4 + 4, v1, a1);
  uint64_t v7 = v9;
  swift_bridgeObjectRetain(a1);
  sub_10000C5E4(v7);
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

void sub_1000276EC(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        sub_100027D50(0LL, v3, 1LL, a1);
      }
      return;
    }

uint64_t sub_100027D50(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        uint64_t v13 = *(v12 - 2);
        uint64_t v14 = *(v12 - 1);
        if (result == v13 && v10 == v14) {
          break;
        }
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, v13, v14, 1LL);
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }

        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }

      while (v4 != v11);
      ++v4;
      v8 += 16LL;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_100027E14(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_1000268D8(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    uint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v20 = (char *)(a3 - 16);
    while (1)
    {
      id v21 = v20 + 16;
      uint64_t v22 = *((void *)v12 - 2);
      uint64_t v23 = *((void *)v12 - 1);
      uint64_t v24 = v12 - 16;
      uint64_t v25 = *((void *)v6 - 2);
      uint64_t v26 = *((void *)v6 - 1);
      BOOL v27 = v22 == v25 && v23 == v26;
      if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, v25, v26, 1LL) & 1) == 0)
      {
        BOOL v29 = v21 != v12 || v20 >= v12;
        v12 -= 16;
        if (!v29) {
          goto LABEL_43;
        }
      }

      else
      {
        BOOL v28 = v21 != v6 || v20 >= v6;
        uint64_t v24 = v6 - 16;
        v6 -= 16;
        if (!v28) {
          goto LABEL_43;
        }
      }

      *(_OWORD *)uint64_t v20 = *(_OWORD *)v24;
LABEL_43:
      v20 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }

  sub_1000268D8(a1, (a2 - a1) / 16, a4);
  uint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      uint64_t v14 = *((void *)v6 + 1);
      uint64_t v15 = *((void *)v4 + 1);
      BOOL v16 = *(void *)v6 == *(void *)v4 && v14 == v15;
      if (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v14, *(void *)v4, v15, 1LL) & 1) != 0) {
        break;
      }
      uint64_t v17 = v4;
      BOOL v16 = v7 == v4;
      v4 += 16;
      if (!v16) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
    }

    uint64_t v17 = v6;
    BOOL v16 = v7 == v6;
    v6 += 16;
    if (v16) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
    goto LABEL_16;
  }

void sub_100027FB8(char a1, uint64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    sub_100028B58();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return;
      }

      sub_100028B48();
    }
  }

  else
  {
    uint64_t v6 = a2;
  }

  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    uint64_t v11 = sub_100004B88((uint64_t *)&unk_10005C660);
    uint64_t v12 = (char *)sub_100028AD4(v11, 16 * v10);
    j__malloc_size(v12);
    sub_100028AF0();
    *((void *)v12 + 2) = v9;
    *((void *)v12 + 3) = v13;
  }

  else
  {
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v12 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v12 != a4 || &v15[16 * v9] <= v14) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v9);
  }

  swift_bridgeObjectRelease(a4);
  sub_100023484();
}

void sub_100028080(uint64_t a1)
{
}

uint64_t sub_100028094(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  unsigned int v4 = v3 & 0x3F;
  unint64_t v5 = (1LL << v3) + 63;
  uint64_t v6 = 8 * (v5 >> 6);
  if (v4 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v5 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    sub_100028AA8();
    if (v1) {
      swift_willThrow(v7);
    }
    else {
      return v7;
    }
  }

  else
  {
    uint64_t v8 = swift_slowAlloc(v6, -1LL);
    sub_100028AA8();
    uint64_t v2 = v9;
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  return v2;
}

void sub_1000281B0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = 0LL;
  uint64_t v36 = a3 + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_20;
    }

    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v11 >= v8) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v36 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v36 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v36 + 8 * v4);
        if (!v12) {
          break;
        }
      }
    }

LABEL_19:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_20:
    uint64_t v14 = *(_TtC22localspeechrecognition19EARSpeechRecognizer **)(*(void *)(a3 + 48) + 16 * v10 + 8);
    uint64_t v15 = *(_TtC22localspeechrecognition19EARSpeechRecognizer **)(*(void *)(a3 + 56) + 16 * v10 + 8);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v15);
    NSString v16 = String._bridgeToObjectiveC()();
    int IsInstalled = SFEntitledAssetStatusIsInstalled(v16);
    swift_bridgeObjectRelease(v14, v18, v19, v20, v21, v22, v23, v24);
    swift_bridgeObjectRelease(v15, v25, v26, v27, v28, v29, v30, v31);

    if (IsInstalled)
    {
      *(unint64_t *)((char *)a1 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v10;
      if (__OFADD__(v35++, 1LL))
      {
        __break(1u);
LABEL_24:
        sub_100028398(a1, a2, v35, a3);
        return;
      }
    }
  }

  int64_t v13 = v11 + 3;
  if (v13 >= v8) {
    goto LABEL_24;
  }
  unint64_t v12 = *(void *)(v36 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_19;
  }

  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      break;
    }
    if (v4 >= v8) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v36 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }

LABEL_26:
  __break(1u);
}

Swift::Int sub_100028398(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain(a4);
    return v4;
  }

  sub_100004B88(&qword_10005C268);
  Swift::Int result = static _DictionaryStorage.allocate(capacity:)(v5);
  Swift::Int v9 = result;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0LL;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0LL;
  Swift::Int v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v39 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }

    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        goto LABEL_40;
      }
      if (v15 >= v38) {
        return v9;
      }
      unint64_t v16 = v37[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v38) {
          return v9;
        }
        unint64_t v16 = v37[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v38) {
            return v9;
          }
          unint64_t v16 = v37[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v38) {
              return v9;
            }
            unint64_t v16 = v37[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1LL)) {
                  goto LABEL_41;
                }
                if (v17 >= v38) {
                  return v9;
                }
                unint64_t v16 = v37[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v17 = v11 + 4;
          }
        }
      }

uint64_t sub_100028644(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    Swift::Int result = swift_bridgeObjectRetain(v21);
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

LABEL_41:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_100028840(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    Swift::Int result = swift_bridgeObjectRetain(v21);
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

void sub_100028A3C(uint64_t a1)
{
}

unint64_t sub_100028A50()
{
  unint64_t result = qword_10005C670;
  if (!qword_10005C670)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS____EARLmHandle);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005C670);
  }

  return result;
}

void *sub_100028A8C@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t sub_100028A9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 25LL, a9, a10, a11);
}

void sub_100028AA8()
{
}

uint64_t sub_100028AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_allocObject(a1, a2 + 32, 7LL);
}

uint64_t sub_100028AE0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v2 + v1);
  *(void *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease(v3);
}

  ;
}

uint64_t sub_100028B04(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

void sub_100028B0C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_100028B20@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRetain(*(void *)(v1 + a1));
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100028B68()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_100028B74()
{
  return static os_log_type_t.default.getter();
}

LABEL_33:
}

void sub_100029A24(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    uint64_t v3 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v2 - 128) = 136315138;
      *(void *)(v2 - 124) = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppL"
                              "mDir:vocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Exception while training.",  (uint8_t *)(v2 - 128),  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100029950LL);
  }

  _Unwind_Resume(a1);
}

void sub_10002A894( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (a2)
  {
    _Block_object_dispose(&STACK[0x220], 8);
    objc_begin_catch(a1);
    id v23 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(STACK[0x220]) = 136315138;
      STACK[0x224] = (unint64_t)"-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Exception while training.",  (uint8_t *)&STACK[0x220],  0xCu);
    }

    uint64_t Name = SFAnalyticsEventTypeGetName(303LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(Name);
    a14 = (uint64_t)_NSConcreteStackBlock;
    a15 = v21;
    a16 = (uint64_t)sub_10002B308;
    a17 = (uint64_t)&unk_100051AA0;
    a18 = v19;
    a19 = v20;
    AnalyticsSendEventLazy(v25, &a14);

    objc_end_catch();
    JUMPOUT(0x10002A828LL);
  }

  _Unwind_Resume(a1);
}

id sub_10002AAE0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

NSMutableDictionary *sub_10002AAE8(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v6[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  v6[1] = kSFCoreAnalyticsFailedOperationKey;
  v7[0] = &stru_100052290;
  v7[1] = @"transitionArtifact";
  v6[2] = kSFCoreAnalyticsTotalTimeKey;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  void v7[2] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v4);

  return v2;
}

NSMutableDictionary *sub_10002ABEC(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v8[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  v8[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[0] = &stru_100052290;
  v9[1] = @"readNgramCounts";
  v8[2] = kSFCoreAnalyticsTotalTimeKey;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4 - *(double *)(a1 + 40)));
  uint64_t v9[2] = v5;
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v6);

  return v2;
}

NSMutableDictionary *sub_10002AD14(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v9[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getVersion]);
  v10[0] = v3;
  v10[1] = @"parseCustomProns";
  v9[1] = kSFCoreAnalyticsFailedOperationKey;
  uint64_t v9[2] = kSFCoreAnalyticsTotalTimeKey;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v4 systemUptime];
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5 - *(double *)(a1 + 48)));
  _OWORD v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v7);

  return v2;
}

uint64_t sub_10002AE50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002AE60(uint64_t a1)
{
}

void sub_10002AE68(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 prons]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 orthography]);

  [v2 setObject:v5 forKey:v4];
}

NSMutableDictionary *sub_10002AEDC(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v9[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getVersion]);
  v10[0] = v3;
  v10[1] = @"readLanguageModel";
  v9[1] = kSFCoreAnalyticsFailedOperationKey;
  uint64_t v9[2] = kSFCoreAnalyticsTotalTimeKey;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v4 systemUptime];
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5 - *(double *)(a1 + 48)));
  _OWORD v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v7);

  return v2;
}

NSMutableDictionary *sub_10002B018(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v9[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getVersion]);
  v10[0] = v3;
  v10[1] = @"createSpeechProfile";
  v9[1] = kSFCoreAnalyticsFailedOperationKey;
  uint64_t v9[2] = kSFCoreAnalyticsTotalTimeKey;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v4 systemUptime];
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5 - *(double *)(a1 + 48)));
  _OWORD v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v7);

  return v2;
}

NSMutableDictionary *sub_10002B154(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v12[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getVersion]);
  v13[0] = v3;
  v12[1] = kSFCoreAnalyticsModelBuildTimeKey;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v13[1] = v4;
  v12[2] = kSFCoreAnalyticsCustomPronParseTime;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 56)));
  v13[2] = v5;
  void v12[3] = kSFCoreAnalyticsProfileBuildTime;
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64)));
  v13[3] = v6;
  v12[4] = kSFCoreAnalyticsTotalTimeKey;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v7 systemUptime];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 - *(double *)(a1 + 72)));
  v13[4] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  5LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v10);

  return v2;
}

NSMutableDictionary *sub_10002B308(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", *(void *)(a1 + 32));
  v8[0] = kSFCoreAnalyticsArtifactIdentifierKey;
  v8[1] = kSFCoreAnalyticsFailedOperationKey;
  v9[0] = &stru_100052290;
  v9[1] = @"unknown";
  v8[2] = kSFCoreAnalyticsTotalTimeKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4 - *(double *)(a1 + 40)));
  uint64_t v9[2] = v5;
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v6);

  return v2;
}

void sub_10002B430(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v2 setObject:v4 forKey:v3];
}

id sub_10002B494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void sub_10002B4A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sanitizedStringWithString:a2]);
  if (!v5 || ![v5 count])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pronunciationsForOrthography:v6]);

    id v5 = (id)v7;
  }

  id v8 = [[_EARWordPart alloc] initWithOrthography:v6 pronunciations:v5 tagName:@"\\unknown-first" frequency:1];
  unint64_t v9 = *(void **)(a1 + 32);
  id v11 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v9 addWordWithParts:v10 templateName:@"\\NT-appvocab"];
}

void sub_10002BAEC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v2 setObject:v4 forKey:v3];
}

void sub_10002BB50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002BD3C;
  void v8[3] = &unk_100051A28;
  unint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v10 = *(id *)(a1 + 32);
  uint64_t v7 = v9;
  [v5 enumerateObjectsUsingBlock:v8];

  [*(id *)(a1 + 40) setObject:v7 forKey:v6];
}

void sub_10002BC20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sanitizedStringWithString:a2]);
  if (!v5 || ![v5 count])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pronunciationsForOrthography:v6]);

    id v5 = (id)v7;
  }

  id v8 = [[_EARWordPart alloc] initWithOrthography:v6 pronunciations:v5 tagName:@"\\unknown-first" frequency:1];
  unint64_t v9 = *(void **)(a1 + 32);
  id v11 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v9 addWordWithParts:v10 templateName:@"\\NT-appvocab"];
}

void sub_10002BD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) nvAsrPhoneSequenceForXsampaProns:a2]);
  [v2 addObject:v3];
}

int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3 = os_log_create("com.apple.speech.localspeechrecognition", "xpcservice");
  id v4 = (void *)qword_10005D4A0;
  qword_10005D4A0 = (uint64_t)v3;

  unsetenv("TMPDIR");
  if ((_set_user_dir_suffix("com.apple.speech.localspeechrecognition") & 1) == 0)
  {
    id v10 = (void *)qword_10005D4A0;
    if (os_log_type_enabled((os_log_t)qword_10005D4A0, OS_LOG_TYPE_FAULT))
    {
      id v11 = v10;
      int v12 = *__error();
      v13[0] = 67109120;
      v13[1] = v12;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "_set_user_dir_suffix failed™: %{darwin.errno}d",  (uint8_t *)v13,  8u);
    }

    exit(1);
  }

  id v5 = NSTemporaryDirectory();
  uint64_t inited = AFLogInitIfNeeded(+[LSRConnection captureProcessStartTime](&OBJC_CLASS___LSRConnection, "captureProcessStartTime"));
  SFLogInitIfNeeded(inited);
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v8 setDelegate:v7];
  [v8 resume];

  return 0;
}

void sub_10002C6D8( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    unint64_t v9 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[LSRSpeechAssets _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s GeoLM: Exception thrown while reading json configs",  (uint8_t *)&a9,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x10002C604LL);
  }

  _Unwind_Resume(a1);
}

void sub_10002CB74(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___LSRSpeechAssets);
  uint64_t v2 = (void *)qword_10005D4A8;
  qword_10005D4A8 = (uint64_t)v1;
}

NSMutableArray *sub_10002D028(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", a2));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 array]);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v5 count])
  {
    unint64_t v7 = 0LL;
    do
    {
      id v8 = [[AFSpeechUtterance alloc] initWithInterpretationIndices:&__NSArray0__struct confidenceScore:0];
      [v8 setSource:2];
      -[NSMutableArray addObject:](v6, "addObject:", v8);

      ++v7;
    }

    while (v7 < (unint64_t)[v5 count]);
  }

  uint64_t v46 = v5;
  unint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = v3;
  id v47 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v47)
  {
    char v10 = 0;
    uint64_t v11 = 0LL;
    uint64_t v45 = *(void *)v60;
    do
    {
      for (unint64_t i = 0LL; i != v47; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        id v14 = objc_alloc_init(&OBJC_CLASS___AFSpeechPhrase);
        unint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        v53[2] = sub_10002D4A8;
        v53[3] = &unk_100051B60;
        unint64_t v16 = v6;
        uint64_t v57 = v11;
        uint64_t v54 = v16;
        uint64_t v55 = v13;
        char v58 = v10 & 1;
        int64_t v17 = v15;
        BOOL v56 = v17;
        [v46 enumerateObjectsUsingBlock:v53];
        id v18 = -[NSMutableOrderedSet count](v17, "count");
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
          uint64_t v21 = v6;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 lastObject]);
          char v10 = [v22 hasSpaceAfter] ^ 1;

          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v17, "array"));
          id v24 = [v23 copy];
          [v14 setInterpretations:v24];

          id v6 = v21;
          [v14 setIsLowConfidence:v19 != (id)1];
          -[NSMutableArray addObject:](v9, "addObject:", v14);
          ++v11;
        }
      }

      id v47 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }

    while (v47);
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v48 = v6;
  id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v49,  v63,  16LL);
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(v48);
        }
        unint64_t v29 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)j);
        char v30 = (void *)objc_claimAutoreleasedReturnValue([v29 interpretationIndices]);
        id v31 = [v30 count];

        if (v31)
        {
          unint64_t v32 = 0LL;
          unint64_t v33 = 0LL;
          do
          {
            Swift::Int v34 = (void *)objc_claimAutoreleasedReturnValue([v29 interpretationIndices]);
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndex:v32]);
            id v36 = [v35 unsignedIntegerValue];

            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v9, "objectAtIndex:", v32));
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 interpretations]);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectAtIndex:v36]);

            unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 tokens]);
            v33 += (unint64_t)[v40 count];

            ++v32;
            unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v29 interpretationIndices]);
            id v42 = [v41 count];
          }

          while (v32 < (unint64_t)v42);
          if (v33) {
            objc_msgSend( v29,  "setConfidenceScore:",  (uint64_t)((double)(uint64_t)objc_msgSend(v29, "confidenceScore") / (double)v33));
          }
        }
      }

      id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v49,  v63,  16LL);
    }

    while (v26);
  }

  return v9;
}

void sub_10002D4A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndex:a3]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:*(void *)(a1 + 56)]);
  id v8 = [v7 unsignedIntegerValue];

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:v8]);
  char v10 = sub_10002D6FC(v9, *(_BYTE *)(a1 + 64));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ([v11 count])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___AFSpeechInterpretation);
    [v12 setTokens:v11];
    unsigned int v13 = [*(id *)(a1 + 48) containsObject:v12];
    id v14 = *(void **)(a1 + 48);
    if (v13)
    {
      id v15 = [v14 indexOfObject:v12];
    }

    else
    {
      id v15 = [v14 count];
      [*(id *)(a1 + 48) addObject:v12];
    }

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 interpretationIndices]);
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 arrayByAddingObject:v17]);
    [v6 setInterpretationIndices:v18];

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v19 = v9;
    id v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      double v23 = 0.0;
      do
      {
        for (unint64_t i = 0LL; i != v21; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)i), "confidence", (void)v26);
          double v23 = v23 + v25;
        }

        id v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v21);
    }

    else
    {
      double v23 = 0.0;
    }

    objc_msgSend(v6, "setConfidenceScore:", (uint64_t)(v23 + (double)(uint64_t)objc_msgSend(v6, "confidenceScore")));
  }
}

NSMutableArray *sub_10002D6FC(void *a1, char a2)
{
  id v3 = a1;
  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      unint64_t v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v9);
        id v11 = objc_alloc_init(&OBJC_CLASS___AFSpeechToken);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tokenName", (void)v17));
        [v11 setText:v12];

        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 phoneSequence]);
        [v11 setPhoneSequence:v13];

        [v10 start];
        objc_msgSend(v11, "setStartTime:");
        [v10 silenceStart];
        objc_msgSend(v11, "setSilenceStartTime:");
        [v10 end];
        objc_msgSend(v11, "setEndTime:");
        [v11 setRemoveSpaceBefore:a2 & 1];
        a2 = [v10 hasSpaceAfter] ^ 1;
        [v10 confidence];
        [v11 setConfidenceScore:(uint64_t)v14];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 ipaPhoneSequence]);
        [v11 setIpaPhoneSequence:v15];

        -[NSMutableArray addObject:](v4, "addObject:", v11);
        unint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  return v4;
}

void sub_10002E39C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_11:
  LOBYTE(a4) = 1;
LABEL_15:

  return (char)a4;
}

LABEL_49:
    uint64_t v57 = 0;
    goto LABEL_50;
  }

  uint64_t v57 = 1;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    char v58 = (void *)qword_10005D508;
    __int128 v59 = v56;
    __int128 v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v58 description]);
    *(_DWORD *)buf = 136315394;
    uint64_t v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
    uint64_t v86 = 2112;
    uint64_t v87 = v60;
    uint64_t v57 = 1;
    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "%s Created _EARSpeechRecognizer successfully with modelInfo: %@",  buf,  0x16u);

    double v25 = v17;
  }

LABEL_50:
  return v57;
}

void sub_10003124C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100031AF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_4:
}
}

void sub_100034624(id a1)
{
}

void sub_100034644(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v2 localSpeechRecognitionDidProcessAudioDuration:*(double *)(a1 + 40)];
}

void sub_100034684(id *a1)
{
  id v2 = a1[4];
  id v3 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = *((void *)a1[5] + 3);
    *(_DWORD *)buf = 136315650;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2112;
    *(void *)uint64_t v67 = v55;
    *(_WORD *)&v67[8] = 2112;
    id v68 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s connection is %@, error %@", buf, 0x20u);
  }

  if (qword_10005D4C0 == *((void *)a1[5] + 2))
  {
    id v4 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Schedule cooldown timer only after active request finishes",  buf,  0xCu);
    }

    +[LSRConnection _scheduleCooldownTimer](&OBJC_CLASS___LSRConnection, "_scheduleCooldownTimer");
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v5 systemUptime];
  double v7 = v6;

  uint64_t v8 = (double *)a1[5];
  double v9 = v8[14];
  if (v9 <= v7)
  {
    double v11 = v7 - v9;
  }

  else
  {
    char v10 = (void *)SFLogConnection;
    double v11 = -1.0;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      id v12 = v10;
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
      *(_DWORD *)buf = 136315650;
      uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      __int16 v66 = 2112;
      *(void *)uint64_t v67 = v13;
      *(_WORD *)&v67[8] = 2112;
      id v68 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s _recognitionBeginTime (%@) is greater than recognitionEndTime (%@)",  buf,  0x20u);

      uint64_t v8 = (double *)a1[5];
    }
  }

  double v15 = v8[15];
  double v16 = v8[19];
  double v17 = 0.0;
  if (v8[18] - v8[17] - v16 >= 0.0) {
    double v18 = v8[18] - v8[17] - v16;
  }
  else {
    double v18 = 0.0;
  }
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1[6] recognitionStatistics]);
  __int128 v20 = v19;
  double v21 = *((double *)a1[5] + 13) * 1000.0;
  if (v21 > 0.0)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:EARRecognitionStatisticRecogCpuTime]);
    [v22 doubleValue];
    double v17 = v23 / v21;

    if (v17 < 0.0) {
      double v17 = 0.0;
    }
  }

  id v24 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *((void *)a1[5] + 13);
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(void *)uint64_t v67 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s audioDuration: %lf", buf, 0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(double *)uint64_t v67 = v11;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s recognitionDuration: %lf", buf, 0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  double v26 = v7 - v15;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(double *)uint64_t v67 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s responseTime(Audio finish to recognizer finish): %lf",  buf,  0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = *((void *)a1[5] + 16);
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(void *)uint64_t v67 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s modelLoadTime: %lf", buf, 0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(double *)uint64_t v67 = v18;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s TTFW: %lf", buf, 0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(double *)uint64_t v67 = v17;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s cpuRtf: %lf", buf, 0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = *((void *)a1[5] + 20);
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(void *)uint64_t v67 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s jitLmeProcessingTime: %lf", buf, 0x16u);
    id v24 = (os_log_s *)SFLogConnection;
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = *((void *)a1[5] + 21);
    *(_DWORD *)buf = 136315394;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 2048;
    *(void *)uint64_t v67 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s asrInitializationTime: %lf", buf, 0x16u);
  }

  unsigned int v30 = [a1[6] concatenateUtterances];
  id v31 = a1[5];
  if (v30 && v31[6])
  {
    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([a1[5] _delegate]);
    [v32 localSpeechRecognitionDidFinishRecognition:*((void *)a1[5] + 6)];

    unint64_t v33 = a1[5];
    Swift::Int v34 = (void *)v33[6];
    v33[6] = 0LL;

    id v31 = a1[5];
  }

  uint64_t v35 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    int v36 = *((unsigned __int8 *)v31 + 57);
    int v37 = *((unsigned __int8 *)v31 + 56);
    *(_DWORD *)buf = 136315650;
    uint64_t v65 = "-[LSRConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v66 = 1024;
    *(_DWORD *)uint64_t v67 = v36;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%s _recognitionResultIsFinal=%d _recognitionResultPackageGenerated=%d",  buf,  0x18u);
    id v31 = a1[5];
  }

  if (!*((_BYTE *)v31 + 57) && *((_BYTE *)v31 + 56))
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v31 _delegate]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[LSRUtilities emptyResultWithIsFinal:](&OBJC_CLASS___LSRUtilities, "emptyResultWithIsFinal:", 1LL));
    [v38 localSpeechRecognitionDidFinishRecognition:v39];

    id v31 = a1[5];
  }

  if (*((_BYTE *)v31 + 56))
  {
    if (v2) {
      goto LABEL_43;
    }
LABEL_47:
    uint64_t Name = SFAnalyticsEventTypeGetName(106LL);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_100034FB0;
    v57[3] = &unk_100052140;
    v57[4] = a1[5];
    *(double *)&v57[5] = v11;
    *(double *)&v57[6] = v26;
    *(double *)&v57[7] = v18;
    *(double *)&v57[8] = v17;
    AnalyticsSendEventLazy(v48, v57);

    uint64_t v49 = SFAnalyticsEventTypeGetName(104LL);
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000351FC;
    v56[3] = &unk_100051CD0;
    v56[4] = a1[5];
    AnalyticsSendEventLazy(v50, v56);

    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([a1[5] _delegate]);
    [v51 localSpeechRecognitionDidSucceed];

    id v2 = 0LL;
    goto LABEL_53;
  }

  uint64_t v44 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
  id v63 = @"No speech detected";
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
  uint64_t v46 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v44,  1110LL,  v45));

  id v2 = (id)v46;
  if (!v46) {
    goto LABEL_47;
  }
LABEL_43:
  unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v2 domain]);
  unsigned int v41 = [v40 isEqualToString:EARErrorDomain];

  if (v41)
  {
    if ([v2 code] == (id)2)
    {
      NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
      __int128 v61 = @"Recognition request was canceled";
      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
      uint64_t v43 = 301LL;
    }

    else
    {
      if ([v2 code] && objc_msgSend(v2, "code") != (id)3) {
        goto LABEL_52;
      }
      NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
      __int128 v59 = @"Failed to recognize the request";
      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
      uint64_t v43 = 300LL;
    }

    uint64_t v52 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  v43,  v42));

    id v2 = (id)v52;
  }

LABEL_52:
  [a1[5] reportFailureWithError:v2];
LABEL_53:
  [*((id *)a1[5] + 2) cancelRecognition];
  uint64_t v53 = a1[5];
  uint64_t v54 = (void *)v53[2];
  if (v54 == (void *)qword_10005D4C0)
  {
    qword_10005D4C0 = 0LL;

    uint64_t v53 = a1[5];
    uint64_t v54 = (void *)v53[2];
  }

  v53[2] = 0LL;
}

id sub_100034FB0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _requestContext]);
  [v2 addEntriesFromDictionary:v3];

  v14[0] = kSFCoreAnalyticsAudioDurationKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 104LL)));
  v15[0] = v4;
  v14[1] = kSFCoreAnalyticsRecognitionDurationKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  v15[1] = v5;
  v14[2] = kSFCoreAnalyticsRecognitionResponseTimeKey;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v15[2] = v6;
  v14[3] = kSFCoreAnalyticsModelLoadTimeKey;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 128LL)));
  v15[3] = v7;
  v14[4] = kSFCoreAnalyticsTTFWKey;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 56)));
  void v15[4] = v8;
  v14[5] = kSFCoreAnalyticsCpuRtfKey;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64)));
  v15[5] = v9;
  v14[6] = kSFCoreAnalyticsJitLmeProcessingTimeKey;
  char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 160LL)));
  v15[6] = v10;
  v14[7] = kSFCoreAnalyticsAsrInitializationTimeKey;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 168LL)));
  v15[7] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  8LL));
  [v2 addEntriesFromDictionary:v12];

  return v2;
}

id sub_1000351FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestContext];
}

void sub_100035204(id *a1)
{
  id v2 = (double *)a1[4];
  if (v2[18] == 0.0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v3 systemUptime];
    *((void *)a1[4] + 1_Block_object_dispose(va, 8) = v4;

    id v2 = (double *)a1[4];
  }

  if (v2[19] == 0.0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] recognition]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 oneBest]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    _OWORD v27[2] = sub_100035484;
    v27[3] = &unk_1000520F0;
    id v7 = a1[5];
    v27[4] = a1[4];
    id v28 = v7;
    [v6 enumerateObjectsUsingBlock:v27];
  }

  uint64_t Name = SFAnalyticsEventTypeGetName(103LL);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(Name);
  double v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  double v23 = sub_100035500;
  id v24 = &unk_100051D68;
  id v10 = a1[5];
  id v25 = a1[4];
  id v26 = v10;
  AnalyticsSendEventLazy(v9, &v21);

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[LSRUtilities recognizedResultFromEARPackage:]( &OBJC_CLASS___LSRUtilities,  "recognizedResultFromEARPackage:",  a1[5],  v21,  v22,  v23,  v24,  v25));
  id v12 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    id v17 = a1[5];
    double v18 = v12;
    unsigned int v19 = [v17 isFinal];
    __int128 v20 = "NO";
    if (v19) {
      __int128 v20 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    unsigned int v30 = "-[LSRConnection speechRecognizer:didRecognizeFinalResultPackage:]_block_invoke";
    __int16 v31 = 2080;
    unint64_t v32 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s package isFinal=%s", buf, 0x16u);
  }

  *((_BYTE *)a1[4] + 56) = 1;
  unsigned int v13 = [a1[6] concatenateUtterances];
  double v14 = a1[4];
  if (v13)
  {
    id v15 = v11;
    double v16 = (void *)v14[6];
    v14[6] = v15;
  }

  else
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _delegate]);
    [v16 localSpeechRecognitionDidFinishRecognition:v11];
  }
}

void sub_100035484(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  if (*(double *)(*(void *)(a1 + 32) + 152LL) == 0.0)
  {
    double v6 = *(void **)(a1 + 40);
    id v7 = a2;
    [v6 utteranceStart];
    double v9 = v8;
    [v7 silenceStart];
    double v11 = v10;

    *(double *)(*(void *)(a1 + 32) + 152LL) = v9 + v11;
    *a4 = 1;
  }

id sub_100035500(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _requestContext]);
  [v2 addEntriesFromDictionary:v3];

  v10[0] = kSFCoreAnalyticsTextNotEmptyKey;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recognition]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 oneBest]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 count] != 0));
  v11[0] = v6;
  v10[1] = kSFCoreAnalyticsIsFinalKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) isFinal]));
  v11[1] = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  [v2 addEntriesFromDictionary:v8];

  return v2;
}

void sub_100035660(uint64_t a1)
{
  if (*(double *)(*(void *)(a1 + 32) + 144LL) == 0.0)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v2 systemUptime];
    *(void *)(*(void *)(a1 + 32) + 144LL) = v3;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) tokens]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSRUtilities transcriptionsWithEARTokens:]( &OBJC_CLASS___LSRUtilities,  "transcriptionsWithEARTokens:",  v4));

  double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preITNTokens]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSRUtilities transcriptionsWithEARTokens:]( &OBJC_CLASS___LSRUtilities,  "transcriptionsWithEARTokens:",  v6));

  double v8 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    double v10 = *(void **)(a1 + 40);
    double v11 = v8;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 tokens]);
    int v13 = 136315394;
    double v14 = "-[LSRConnection speechRecognizer:didRecognizePartialResult:]_block_invoke";
    __int16 v15 = 2048;
    id v16 = [v12 count];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Recognized %lu partial result tokens.",  (uint8_t *)&v13,  0x16u);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v9 localSpeechRecognitionDidRecognizePartialResult:v5 rawPartialResult:v7];
}

BOOL sub_100035808()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v1 = v0;
  if (v0)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v0 valueForEntitlement:@"com.apple.assistant.dictation.prerecorded"]);
    BOOL v3 = (objc_opt_respondsToSelector(v2, "BOOLValue") & 1) != 0
      && ([v2 BOOLValue] & 1) != 0;
  }

  else
  {
    uint64_t v4 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "hasSPIAccess";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Called from outside of an XPC connection",  (uint8_t *)&v6,  0xCu);
    }

    BOOL v3 = 0LL;
  }

  return v3;
}

uint64_t sub_100035924(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100035938(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10003594C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100035960(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100035974(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100035988(void *a1)
{
  BOOL v2 = sub_100035808();
  BOOL v3 = (os_log_s *)SFLogConnection;
  if (v2)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[4];
      *(_DWORD *)buf = 136315394;
      id v17 = "-[LSRConnection initializeLmWithAssetPath:completion:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Initialize Language Model with assetPath=%@",  buf,  0x16u);
    }

    id v5 = -[LSRLanguageModel initWithAssetPath:](objc_alloc(&OBJC_CLASS___LSRLanguageModel), "initWithAssetPath:", a1[4]);
    uint64_t v6 = a1[5];
    id v7 = *(void **)(v6 + 192);
    *(void *)(v6 + 192) = v5;

    uint64_t v8 = a1[6];
    if (v8)
    {
      if (*(void *)(a1[5] + 192LL))
      {
        (*(void (**)(void, void))(v8 + 16))(a1[6], 0LL);
      }

      else
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error initializing",  NSLocalizedDescriptionKey));
        __int16 v15 = v11;
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  400LL,  v12));
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v13);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[LSRConnection initializeLmWithAssetPath:completion:]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    }

    uint64_t v9 = a1[6];
    if (v9)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }

void sub_100035BC8(void *a1)
{
  BOOL v2 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[LSRConnection initializeLmWithLocale:clientID:completion:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Initialize Language Model with locale=%@",  buf,  0x16u);
  }

  uint64_t v4 = -[LSRLanguageModel initWithLocale:clientID:]( objc_alloc(&OBJC_CLASS___LSRLanguageModel),  "initWithLocale:clientID:",  a1[4],  a1[6]);
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v4;

  uint64_t v7 = a1[7];
  if (v7)
  {
    if (*(void *)(a1[5] + 192LL))
    {
      (*(void (**)(void, void))(v7 + 16))(a1[7], 0LL);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error initializing",  NSLocalizedDescriptionKey));
      id v12 = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
      double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  400LL,  v9));
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
    }
  }

id sub_100035D6C(uint64_t a1)
{
  return +[SFEntitledAssetManager setPurgeabilityForAssetWithConfig:purgeable:completionHandler:]( &OBJC_CLASS___SFEntitledAssetManager,  "setPurgeabilityForAssetWithConfig:purgeable:completionHandler:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 40));
}

uint64_t sub_100035D84(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100035D98(void *a1)
{
  id v2 = [[SFEntitledAssetConfig alloc] initWithLanguage:a1[4] taskHint:1002];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 installedAssetWithConfig:v2 regionId:0 shouldSubscribe:1 subscriberId:a1[5] expiration:0]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"mini.json"]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSRSpeechAssets assetConfigParameters:]( &OBJC_CLASS___LSRSpeechAssets,  "assetConfigParameters:",  v5));
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"voicemail-confidence-parameters"]);
      if (v8)
      {
        uint64_t v9 = *(void (**)(void))(a1[6] + 16LL);
      }

      else
      {
        id v12 = (os_log_s *)SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315138;
          __int16 v15 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]_block_invoke";
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to find voicemail config parameters",  (uint8_t *)&v14,  0xCu);
        }

        uint64_t v9 = *(void (**)(void))(a1[7] + 16LL);
      }

      v9();
    }

    else
    {
      uint64_t v11 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        __int16 v15 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to read json config parameters from file: %@",  (uint8_t *)&v14,  0x16u);
      }

      (*(void (**)(void))(a1[7] + 16LL))();
    }
  }

  else
  {
    double v10 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v13 = (void *)a1[4];
      int v14 = 136315394;
      __int16 v15 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to find asset path for language:%@",  (uint8_t *)&v14,  0x16u);
    }

    (*(void (**)(void))(a1[7] + 16LL))();
  }
}

void sub_100036034(void *a1)
{
  id v5 = [[SFEntitledAssetConfig alloc] initWithLanguage:a1[4] taskHint:0];
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 installedAssetWithConfig:v5 regionId:0 shouldSubscribe:1 subscriberId:a1[5] expiration:0]);

  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0LL);
  }
}

void sub_1000360D4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:0 error:v1];
}

void sub_100036144(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:0 error:*(void *)(a1 + 40)];
}

void sub_100036188(uint64_t a1)
{
  uint64_t Name = SFAnalyticsEventTypeGetName(201LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(Name);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100036384;
  v26[3] = &unk_100051CD0;
  id v27 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy(v3, v26);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10003641C;
  v25[3] = &unk_100051E08;
  uint64_t v25[4] = *(void *)(a1 + 40);
  uint64_t v4 = objc_retainBlock(v25);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100036480;
  v22[3] = &unk_100051E30;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v23 = v5;
  uint64_t v24 = v6;
  uint64_t v7 = objc_retainBlock(v22);
  v20[0] = 0LL;
  v20[1] = v20;
  void v20[2] = 0x2020000000LL;
  char v21 = 0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  _DWORD v13[2] = sub_1000366D8;
  v13[3] = &unk_100051F88;
  id v14 = v9;
  id v10 = *(id *)(a1 + 32);
  char v19 = *(_BYTE *)(a1 + 56);
  id v15 = v10;
  __int16 v18 = v20;
  uint64_t v11 = v4;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  +[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]( &OBJC_CLASS___SFEntitledAssetManager,  "subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:",  v8,  0LL,  v14,  0LL,  v13);

  _Block_object_dispose(v20, 8);
}

void sub_10003636C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_100036384(uint64_t a1)
{
  uint64_t v4 = kSFCoreAnalyticsLanguageKey;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) language]);
  id v5 = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

void sub_10003641C(uint64_t a1, uint64_t a2, char a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036E68;
  block[3] = &unk_100051DE0;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  char v4 = a3;
  dispatch_async((dispatch_queue_t)qword_10005D4B8, block);
}

void sub_100036480(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v14 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]_block_invoke_6";
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Failed to download assets with error=%@",  buf,  0x16u);
    }

    uint64_t Name = SFAnalyticsEventTypeGetName(202LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100036C80;
    v23[3] = &unk_100051CD0;
    id v10 = &v24;
    id v24 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy(v16, v23);

    uint64_t v11 = (dispatch_queue_s *)qword_10005D4B8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036D30;
    block[3] = &unk_100051CF8;
    block[4] = *(void *)(a1 + 40);
    id v12 = &v22;
    id v22 = v7;
    int v13 = block;
  }

  else
  {
    uint64_t v8 = SFAnalyticsEventTypeGetName(202LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100036D74;
    v19[3] = &unk_100051CD0;
    id v10 = &v20;
    id v20 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy(v9, v19);

    uint64_t v11 = (dispatch_queue_s *)qword_10005D4B8;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100036E24;
    v17[3] = &unk_100051CF8;
    v17[4] = *(void *)(a1 + 40);
    id v12 = &v18;
    id v18 = v5;
    int v13 = v17;
  }

  dispatch_async(v11, v13);
}

void sub_1000366D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = (dispatch_queue_s *)qword_10005D4B8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000367C4;
  block[3] = &unk_100051F60;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v15 = *(_BYTE *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v14 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v4, block);
}

void sub_1000367C4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(a1 + 48);
      id v16 = v2;
      uint64_t v17 = SFEntitledAssetTypeToString([v14 assetType]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      char v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) language]);
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      int v37 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]_block_invoke_6";
      __int16 v38 = 2112;
      uint64_t v39 = v15;
      __int16 v40 = 2112;
      unsigned int v41 = v18;
      __int16 v42 = 2112;
      uint64_t v43 = v19;
      __int16 v44 = 2112;
      uint64_t v45 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to subscribe %@ to the %@ asset for %@ with error: %@",  buf,  0x34u);
    }
  }

  if (*(_BYTE *)(a1 + 80))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    _OWORD v33[2] = sub_100036AF4;
    v33[3] = &unk_100051E58;
    uint64_t v35 = *(void *)(a1 + 72);
    id v34 = *(id *)(a1 + 56);
    [v3 downloadStatusWithConfig:v4 regionId:0 subscriberId:v5 progressHandler:v33 completionHandler:&stru_100051E98];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100036B18;
  v30[3] = &unk_100051EC0;
  char v32 = *(_BYTE *)(a1 + 80);
  id v31 = *(id *)(a1 + 56);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  _OWORD v27[2] = sub_100036B34;
  v27[3] = &unk_100051EE8;
  char v29 = *(_BYTE *)(a1 + 80);
  id v28 = *(id *)(a1 + 64);
  [v6 downloadStatusWithConfig:v7 regionId:0 subscriberId:v8 progressHandler:v30 completionHandler:v27];

  if (*(_BYTE *)(a1 + 80))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D4B8);
    id v9 = (dispatch_queue_s *)qword_10005D520;
    if (!qword_10005D520)
    {
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.speech.localspeechrecognition.detailedProgressWait", 0LL);
      id v11 = (void *)qword_10005D520;
      qword_10005D520 = (uint64_t)v10;

      id v9 = (dispatch_queue_s *)qword_10005D520;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036B4C;
    block[3] = &unk_100051F38;
    id v22 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 72);
    id v23 = v12;
    uint64_t v26 = v13;
    id v24 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 64);
    dispatch_async(v9, block);
  }
}

uint64_t sub_100036AF4(uint64_t result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL));
  if ((v1 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_100036B18(uint64_t result)
{
  if (!*(_BYTE *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_100036B34(uint64_t result)
{
  if (!*(_BYTE *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

void sub_100036B4C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  [v2 wait];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100036C50;
  void v8[3] = &unk_100051E58;
  uint64_t v10 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100036C70;
  void v6[3] = &unk_100051F10;
  id v7 = *(id *)(a1 + 56);
  [v3 downloadStatusWithConfig:v4 regionId:0 subscriberId:v5 progressHandler:v8 completionHandler:v6];
}

uint64_t sub_100036C50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100036C70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100036C80(uint64_t a1)
{
  v4[0] = kSFCoreAnalyticsLanguageKey;
  unsigned __int8 v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) language]);
  v4[1] = kSFCoreAnalyticsSuccessKey;
  v5[0] = v1;
  v5[1] = &__kCFBooleanFalse;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL));

  return v2;
}

void sub_100036D30(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:0 error:*(void *)(a1 + 40)];
}

id sub_100036D74(uint64_t a1)
{
  v4[0] = kSFCoreAnalyticsLanguageKey;
  unsigned __int8 v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) language]);
  v4[1] = kSFCoreAnalyticsSuccessKey;
  v5[0] = v1;
  v5[1] = &__kCFBooleanTrue;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL));

  return v2;
}

void sub_100036E24(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v2 localSpeechRecognitionDidFinishDownloadingAssets:*(void *)(a1 + 40) error:0];
}

void sub_100036E68(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v2 localSpeechRecognitionDidDownloadAssetsWithProgress:*(void *)(a1 + 40) isStalled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t sub_100036EAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100036EBC(uint64_t a1)
{
}

void sub_100036EC4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
}

void sub_100036F18(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[LSRSpeechAssets sharedInstance](&OBJC_CLASS___LSRSpeechAssets, "sharedInstance"));
  [v2 installedLanguagesForAssetType:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
}

id sub_100036F5C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _requestContext]);
  [v2 addEntriesFromDictionary:v3];

  v9[0] = kSFCoreAnalyticsErrorCode;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 40) code]));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  v10[0] = v5;
  v9[1] = kSFCoreAnalyticsErrorDomain;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) domain]);
  v10[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  [v2 addEntriesFromDictionary:v7];

  return v2;
}

id sub_100037098(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1000370A0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0LL;
  unsigned __int8 v3 = [v2 _consumeSandboxExtensions:v1 error:&v6];
  id v4 = v6;
  id v5 = (os_log_s *)SFLogConnection;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = "-[LSRConnection initializeWithSandboxExtensions:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Successfully consumed sandbox extensions",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[LSRConnection initializeWithSandboxExtensions:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions: %@",  buf,  0x16u);
  }
}

void sub_1000371D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained cancelRecognition];

  [*(id *)(*(void *)(a1 + 32) + 16) endAudio];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0LL;

  [*(id *)(*(void *)(a1 + 32) + 80) discard];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0LL;

  uint64_t Name = SFAnalyticsEventTypeGetName(102LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_100037298;
  void v9[3] = &unk_100051CD0;
  v9[4] = *(void *)(a1 + 32);
  AnalyticsSendEventLazy(v8, v9);
}

id sub_100037298(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestContext];
}

void sub_1000372A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  if (v3) {
    [v3 endAudio];
  }
  else {
    *(_BYTE *)(v2 + 40) = 1;
  }
  uint64_t Name = SFAnalyticsEventTypeGetName(101LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(Name);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100037340;
  void v8[3] = &unk_100051CD0;
  void v8[4] = *(void *)(a1 + 32);
  AnalyticsSendEventLazy(v5, v8);

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = 0LL;
}

id sub_100037340(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestContext];
}

id sub_100037348(uint64_t a1)
{
  uint64_t v2 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = *(void **)(a1 + 32);
    id v10 = v2;
    int v11 = 136315394;
    id v12 = "-[LSRConnection addAudioPacket:]_block_invoke";
    __int16 v13 = 2048;
    id v14 = [v9 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Adding audio packet: %zu",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  *(void *)(*(void *)(a1 + 40) + 12_swift_stdlib_reportUnimplementedInitializer( "localspeechrecognition.EARSpeechRecognitionResultStream",  55LL,  "init()",  6LL, 0LL) = v4;

  uint64_t v5 = *(void *)(a1 + 40);
  if (*(double *)(v5 + 136) == 0.0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v6 systemUptime];
    *(void *)(*(void *)(a1 + 40) + 136LL) = v7;

    uint64_t v5 = *(void *)(a1 + 40);
  }

  if (*(void *)(v5 + 16))
  {
    objc_msgSend( *(id *)(*(void *)(a1 + 40) + 16), "addAudioSamples:count:", objc_msgSend(*(id *)(a1 + 32), "bytes"), (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >> 1);
    [*(id *)(a1 + 40) updateAudioDuration:*(void *)(a1 + 32)];
  }

  else
  {
    [*(id *)(v5 + 32) addObject:*(void *)(a1 + 32)];
  }

  id result = *(id *)(*(void *)(a1 + 40) + 80LL);
  if (result) {
    return [result appendBytes:*(void *)(a1 + 32)];
  }
  return result;
}

id sub_1000374D8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!v2)
  {
    id v3 = EtiquetteReplacementsForLanguage(*(void **)(*(void *)(a1 + 32) + 88LL));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }

  return v2;
}

id VoicemailConfidenceSubtractionForLanguage(void *a1)
{
  id v1 = a1;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber, v2);
  id v4 = sub_100037820(v1, @"voicemail_confidence_subtraction.json", v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

id EtiquetteConfidenceSubtraction(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v1 = a1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  void v5[2] = sub_10003780C;
  v5[3] = &unk_100051C80;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = v6;
  [v1 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = -[NSMutableDictionary copy](v2, "copy");
  return v3;
}

id sub_100037638(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 samplingRateFilter]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 taskTypeFilter]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 farFieldFilter]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 deviceIdFilter]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 bluetoothDeviceIdFilter]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v1 atypicalSpeechFilter]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sampling rate = %@\ntask type = %@\nfar field = %@\ndevice ID = %@\n[DEPRECATED] bluetooth device ID = %@\natypical speech = %@\n",  v2,  v3,  v4,  v5,  v6,  v7));
  return v8;
}

id sub_100037720(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _requestContext]);
  [v2 addEntriesFromDictionary:v3];

  uint64_t v7 = kSFCoreAnalyticsModelVersionKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005D508 version]);
  uint64_t v8 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v2 addEntriesFromDictionary:v5];

  return v2;
}

id sub_10003780C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&off_100052C38 forKey:a2];
}

id sub_100037820(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);
    id v29 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v7,  0LL,  &v29));
    id v9 = v29;
    if (!v8)
    {
      id v16 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v31 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Could not read %@: %@", buf, 0x20u);
      }

      id v14 = 0LL;
      goto LABEL_21;
    }

    id v28 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  0LL,  &v28));
    id v11 = v28;

    if (v10)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
      if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        LOBYTE(v31) = 1;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100037BF0;
        v24[3] = &unk_1000521B0;
        uint64_t v27 = a3;
        id v25 = v6;
        uint64_t v26 = buf;
        [v10 enumerateKeysAndObjectsUsingBlock:v24];
        if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
          id v14 = v10;
        }
        else {
          id v14 = 0LL;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }

      id v18 = (void *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v18;
        id v22 = (void *)objc_opt_class(v10, v21);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v31 = v22;
        id v23 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s %@ is wrong type: %@", buf, 0x20u);
      }
    }

    else
    {
      uint64_t v17 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v31 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Could not parse %@: %@", buf, 0x20u);
      }
    }

    id v14 = 0LL;
LABEL_20:

    id v9 = v11;
LABEL_21:

    goto LABEL_22;
  }

  uint64_t v15 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "ReplacementDictionaryForLanguage";
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Could not locate asset.", buf, 0xCu);
  }

  id v14 = 0LL;
LABEL_22:

  return v14;
}

void sub_100037BD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100037BF0(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0 || (objc_opt_isKindOfClass(v8, a1[6]) & 1) == 0)
  {
    id v11 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = a1[4];
      int v13 = 136315906;
      id v14 = "ReplacementDictionaryForLanguage_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s %@ contains bogus key/value pair: %@ => %@",  (uint8_t *)&v13,  0x2Au);
    }

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
  }
}

id EtiquetteReplacementsForLanguage(void *a1)
{
  id v1 = a1;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString, v2);
  id v4 = sub_100037820(v1, @"etiquette.json", v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

void sub_100037D80(id a1, NSNumber *a2, unint64_t a3, BOOL *a4)
{
}

void sub_100037D98(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = v2;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener _UUID](&OBJC_CLASS___NSXPCListener, "_UUID"));
      int v11 = 136315650;
      uint64_t v12 = "-[LSRConnection initWithXPCConnection:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = WeakRetained;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s %@ cancelling instance %@",  (uint8_t *)&v11,  0x20u);
    }

    [WeakRetained[2] cancelRecognition];
    id v5 = WeakRetained[2];
    if (v5 == (id)qword_10005D4C0)
    {
      qword_10005D4C0 = 0LL;

      id v5 = WeakRetained[2];
    }

    WeakRetained[2] = 0LL;

    [WeakRetained[4] removeAllObjects];
    objc_storeWeak(WeakRetained + 1, 0LL);
    [WeakRetained[3] invalidate];
    id v6 = WeakRetained[3];
    WeakRetained[3] = 0LL;

    objc_storeWeak(WeakRetained + 1, 0LL);
    id v7 = WeakRetained[25];
    WeakRetained[25] = 0LL;

    id v8 = WeakRetained[26];
    WeakRetained[26] = 0LL;

    id v9 = WeakRetained[27];
    WeakRetained[27] = 0LL;

    id v10 = WeakRetained[28];
    WeakRetained[28] = 0LL;
  }
}

void sub_100037F2C(id a1)
{
  id v1 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "-[LSRConnection initWithXPCConnection:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s Handling SIGTERM", (uint8_t *)&v2, 0xCu);
  }

  exit(0);
}

void sub_100038B90(id a1)
{
}

void sub_100038B9C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", qword_10005D4D0));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100038BE0(id a1)
{
  qword_10005D4D0 = mach_continuous_time();
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__UUID(void *a1, const char *a2, ...)
{
  return _[a1 _UUID];
}

id objc_msgSend__auditToken(void *a1, const char *a2, ...)
{
  return _[a1 _auditToken];
}

id objc_msgSend__cachedRecognizerCleanUp(void *a1, const char *a2, ...)
{
  return _[a1 _cachedRecognizerCleanUp];
}

id objc_msgSend__cancelCooldownTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelCooldownTimer];
}

id objc_msgSend__consumeSandboxExtensions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_consumeSandboxExtensions:error:");
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return _[a1 _delegate];
}

id objc_msgSend__geoLMCompatibleWithMainAsset_geoAssetConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_geoLMCompatibleWithMainAsset:geoAssetConfig:");
}

id objc_msgSend__initWithBestTranscription_rawTranscription_final_speechRecognitionMetadata_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:");
}

id objc_msgSend__jitProfileWithLanguage_modelRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_jitProfileWithLanguage:modelRoot:");
}

id objc_msgSend__requestContext(void *a1, const char *a2, ...)
{
  return _[a1 _requestContext];
}

id objc_msgSend__scheduleCooldownTimer(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleCooldownTimer];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__speechRecognizerWithLanguage_overrides_anyConfiguration_taskConfiguration_modelRoot_error_modelLoadTime_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_speechRecognizerWithLanguage:overrides:anyConfiguration:taskConfiguration:modelRoot:error:modelLoadTime:");
}

id objc_msgSend__userProfileWithModelRoot_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userProfileWithModelRoot:language:");
}

id objc_msgSend_acousticFeatureValuePerFrame(void *a1, const char *a2, ...)
{
  return _[a1 acousticFeatureValuePerFrame];
}

id objc_msgSend_acousticFeatures(void *a1, const char *a2, ...)
{
  return _[a1 acousticFeatures];
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 activeConfiguration];
}

id objc_msgSend_activeConfigurationForEverything(void *a1, const char *a2, ...)
{
  return _[a1 activeConfigurationForEverything];
}

id objc_msgSend_activeConfigurationForNothing(void *a1, const char *a2, ...)
{
  return _[a1 activeConfigurationForNothing];
}

id objc_msgSend_addAudioSamples_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudioSamples:count:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addNgramCountWithType_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNgramCountWithType:content:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addProns_forWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProns:forWord:");
}

id objc_msgSend_addSentenceToNgramCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSentenceToNgramCounts:");
}

id objc_msgSend_addSentenceWithType_uuid_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSentenceWithType:uuid:content:");
}

id objc_msgSend_addWordWithParts_templateName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWordWithParts:templateName:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appLmNeedsRebuild_language_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLmNeedsRebuild:language:error:");
}

id objc_msgSend_appendBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:");
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return _[a1 applicationName];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetConfigParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetConfigParameters:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return _[a1 assetType];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistantIsEnabled];
}

id objc_msgSend_atypicalSpeechFilter(void *a1, const char *a2, ...)
{
  return _[a1 atypicalSpeechFilter];
}

id objc_msgSend_audioAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 audioAnalytics];
}

id objc_msgSend_bluetoothDeviceIdFilter(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDeviceIdFilter];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buildLmWithConfig_root_data_dir_shouldStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildLmWithConfig:root:data:dir:shouldStop:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cancelRecognition(void *a1, const char *a2, ...)
{
  return _[a1 cancelRecognition];
}

id objc_msgSend_captureProcessStartTime(void *a1, const char *a2, ...)
{
  return _[a1 captureProcessStartTime];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifier];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_computeEmbeddings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeEmbeddings:");
}

id objc_msgSend_concatenateUtterances(void *a1, const char *a2, ...)
{
  return _[a1 concatenateUtterances];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _[a1 confidence];
}

id objc_msgSend_confidenceScore(void *a1, const char *a2, ...)
{
  return _[a1 confidenceScore];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAppLmLmeProfileWithLanguage_modelRoot_customPronsData_newOovs_writeToVocabFile_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createNgramCountsArtifactFromPhraseCountArtifact_saveTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNgramCountsArtifactFromPhraseCountArtifact:saveTo:");
}

id objc_msgSend_createPhraseCountArtifactWithIdentifier_rawPhraseCountsPath_customPronunciationsPath_saveTo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "createPhraseCountArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:saveTo:");
}

id objc_msgSend_createPhraseCountsArtifact_version_locale_rawPhraseCountsPath_customPronunciationsPath_saveTo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "createPhraseCountsArtifact:version:locale:rawPhraseCountsPath:customPronunciationsPath:saveTo:");
}

id objc_msgSend_createSpeechProfileFromOovs_customProns_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSpeechProfileFromOovs:customProns:language:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_dataProfile(void *a1, const char *a2, ...)
{
  return _[a1 dataProfile];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deserializeModelData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeModelData:");
}

id objc_msgSend_deserializeNgramCountsData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeNgramCountsData:");
}

id objc_msgSend_detectMultipleUtterances(void *a1, const char *a2, ...)
{
  return _[a1 detectMultipleUtterances];
}

id objc_msgSend_deviceIdFilter(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdFilter];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 dictationIsEnabled];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discard(void *a1, const char *a2, ...)
{
  return _[a1 discard];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:");
}

id objc_msgSend_dumpDirectory(void *a1, const char *a2, ...)
{
  return _[a1 dumpDirectory];
}

id objc_msgSend_dynamicLanguageModel(void *a1, const char *a2, ...)
{
  return _[a1 dynamicLanguageModel];
}

id objc_msgSend_dynamicVocabulary(void *a1, const char *a2, ...)
{
  return _[a1 dynamicVocabulary];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_emptyResultWithIsFinal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyResultWithIsFinal:");
}

id objc_msgSend_enableAutoPunctuation(void *a1, const char *a2, ...)
{
  return _[a1 enableAutoPunctuation];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endAudio(void *a1, const char *a2, ...)
{
  return _[a1 endAudio];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_farFieldFilter(void *a1, const char *a2, ...)
{
  return _[a1 farFieldFilter];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filenameForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filenameForTaskIdentifier:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_frameDuration(void *a1, const char *a2, ...)
{
  return _[a1 frameDuration];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return _[a1 frequency];
}

id objc_msgSend_generateNgramCountsWithConfig_root_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateNgramCountsWithConfig:root:data:");
}

id objc_msgSend_getProns(void *a1, const char *a2, ...)
{
  return _[a1 getProns];
}

id objc_msgSend_getVersion(void *a1, const char *a2, ...)
{
  return _[a1 getVersion];
}

id objc_msgSend_hasSpaceAfter(void *a1, const char *a2, ...)
{
  return _[a1 hasSpaceAfter];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initWithAcousticFeatureValue_frameDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAcousticFeatureValue:frameDuration:");
}

id objc_msgSend_initWithAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetPath:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:");
}

id objc_msgSend_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCo deTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_euclidEncoderType_initFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:euclidEncoderType:initFlag:");
}

id objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:");
}

id objc_msgSend_initWithConfiguration_ncsRoot_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:ncsRoot:language:");
}

id objc_msgSend_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSp eakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:");
}

id objc_msgSend_initWithConfiguration_recognizerConfigPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:recognizerConfigPath:");
}

id objc_msgSend_initWithConfiguration_root_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:root:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithInterpretationIndices_confidenceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInterpretationIndices:confidenceScore:");
}

id objc_msgSend_initWithLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:");
}

id objc_msgSend_initWithLanguage_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:assetType:");
}

id objc_msgSend_initWithLanguage_taskHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:taskHint:");
}

id objc_msgSend_initWithLocale_clientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:clientID:");
}

id objc_msgSend_initWithOrthography_pronunciations_tagName_frequency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrthography:pronunciations:tagName:frequency:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithSpeechRecognitionFeatures_acousticFeatures_snr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:");
}

id objc_msgSend_initWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTaskIdentifier:");
}

id objc_msgSend_initWithTokenName_start_end_silenceStart_confidence_hasSpaceAfter_hasSpaceBefore_phoneSequence_ipaPhoneSequence_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_inlineItemList(void *a1, const char *a2, ...)
{
  return _[a1 inlineItemList];
}

id objc_msgSend_installedAssetWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssetWithConfig:");
}

id objc_msgSend_installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:");
}

id objc_msgSend_installedLanguagesForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedLanguagesForAssetType:");
}

id objc_msgSend_installedLanguagesForAssetType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedLanguagesForAssetType:completion:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interpretationIndices(void *a1, const char *a2, ...)
{
  return _[a1 interpretationIndices];
}

id objc_msgSend_interpretations(void *a1, const char *a2, ...)
{
  return _[a1 interpretations];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_ipaPhoneSequence(void *a1, const char *a2, ...)
{
  return _[a1 ipaPhoneSequence];
}

id objc_msgSend_isAdaptableToSpeechModelVersion_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdaptableToSpeechModelVersion:locale:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinal(void *a1, const char *a2, ...)
{
  return _[a1 isFinal];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid:");
}

id objc_msgSend_jitProfileFromContextualStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jitProfileFromContextualStrings:");
}

id objc_msgSend_jsonFilenameForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonFilenameForAssetType:");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lexemes(void *a1, const char *a2, ...)
{
  return _[a1 lexemes];
}

id objc_msgSend_lmeThreshold(void *a1, const char *a2, ...)
{
  return _[a1 lmeThreshold];
}

id objc_msgSend_loadCustomPronData_dataRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCustomPronData:dataRoot:");
}

id objc_msgSend_loadLmHandle(void *a1, const char *a2, ...)
{
  return _[a1 loadLmHandle];
}

id objc_msgSend_loadOovs(void *a1, const char *a2, ...)
{
  return _[a1 loadOovs];
}

id objc_msgSend_localSpeechRecognitionDidDownloadAssetsWithProgress_isStalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidDownloadAssetsWithProgress:isStalled:");
}

id objc_msgSend_localSpeechRecognitionDidFail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidFail:");
}

id objc_msgSend_localSpeechRecognitionDidFinishDownloadingAssets_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidFinishDownloadingAssets:error:");
}

id objc_msgSend_localSpeechRecognitionDidFinishRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidFinishRecognition:");
}

id objc_msgSend_localSpeechRecognitionDidProcessAudioDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidProcessAudioDuration:");
}

id objc_msgSend_localSpeechRecognitionDidRecognizePartialResult_rawPartialResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSpeechRecognitionDidRecognizePartialResult:rawPartialResult:");
}

id objc_msgSend_localSpeechRecognitionDidSucceed(void *a1, const char *a2, ...)
{
  return _[a1 localSpeechRecognitionDidSucceed];
}

id objc_msgSend_localeCodeForLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeCodeForLocale:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lsr_errorWithCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lsr_errorWithCode:description:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_maximumRecognitionDuration(void *a1, const char *a2, ...)
{
  return _[a1 maximumRecognitionDuration];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_modelInfo(void *a1, const char *a2, ...)
{
  return _[a1 modelInfo];
}

id objc_msgSend_modelOverrideURL(void *a1, const char *a2, ...)
{
  return _[a1 modelOverrideURL];
}

id objc_msgSend_modelRootWithLanguage_assetType_clientID_modelOverrideURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelRootWithLanguage:assetType:clientID:modelOverrideURL:error:");
}

id objc_msgSend_modelRootWithLanguage_assetType_clientID_modelOverrideURL_isSpelling_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelRootWithLanguage:assetType:clientID:modelOverrideURL:isSpelling:error:");
}

id objc_msgSend_narrowband(void *a1, const char *a2, ...)
{
  return _[a1 narrowband];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_ngramCountsSerializeData(void *a1, const char *a2, ...)
{
  return _[a1 ngramCountsSerializeData];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_nvAsrPhoneSequenceForXsampaProns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nvAsrPhoneSequenceForXsampaProns:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onDeviceOnly(void *a1, const char *a2, ...)
{
  return _[a1 onDeviceOnly];
}

id objc_msgSend_oneBest(void *a1, const char *a2, ...)
{
  return _[a1 oneBest];
}

id objc_msgSend_oovWordsAndFrequenciesInNgramCount(void *a1, const char *a2, ...)
{
  return _[a1 oovWordsAndFrequenciesInNgramCount];
}

id objc_msgSend_oovsFromSentenceAddedToNgramCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oovsFromSentenceAddedToNgramCounts:");
}

id objc_msgSend_orderedOovs(void *a1, const char *a2, ...)
{
  return _[a1 orderedOovs];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_orthography(void *a1, const char *a2, ...)
{
  return _[a1 orthography];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_phoneSequence(void *a1, const char *a2, ...)
{
  return _[a1 phoneSequence];
}

id objc_msgSend_preITNRecognition(void *a1, const char *a2, ...)
{
  return _[a1 preITNRecognition];
}

id objc_msgSend_preITNTokens(void *a1, const char *a2, ...)
{
  return _[a1 preITNTokens];
}

id objc_msgSend_prepareRecognizerWithLanguage_recognitionOverrides_modelOverrideURL_anyConfiguration_task_clientID_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_prons(void *a1, const char *a2, ...)
{
  return _[a1 prons];
}

id objc_msgSend_pronunciationsForOrthography_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pronunciationsForOrthography:");
}

id objc_msgSend_recognition(void *a1, const char *a2, ...)
{
  return _[a1 recognition];
}

id objc_msgSend_recognitionMetadataFromSpeechPhrases_afAudioAnalytics_utteranceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:");
}

id objc_msgSend_recognitionOverrides(void *a1, const char *a2, ...)
{
  return _[a1 recognitionOverrides];
}

id objc_msgSend_recognitionStatistics(void *a1, const char *a2, ...)
{
  return _[a1 recognitionStatistics];
}

id objc_msgSend_recognizedResultFromEARPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recognizedResultFromEARPackage:");
}

id objc_msgSend_releaseAssetSets(void *a1, const char *a2, ...)
{
  return _[a1 releaseAssetSets];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_reportFailureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFailureWithError:");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_runRecognitionWithResultStream_language_task_samplingRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runRecognitionWithResultStream:language:task:samplingRate:");
}

id objc_msgSend_samplingRateFilter(void *a1, const char *a2, ...)
{
  return _[a1 samplingRateFilter];
}

id objc_msgSend_sanitizedStringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizedStringWithString:");
}

id objc_msgSend_serializedModelWithLanguage_modelData_oovs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedModelWithLanguage:modelData:oovs:");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveConfiguration:");
}

id objc_msgSend_setAtypicalSpeechFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAtypicalSpeechFilter:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setConcatenateUtterances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConcatenateUtterances:");
}

id objc_msgSend_setConfidenceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfidenceScore:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetectUtterances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetectUtterances:");
}

id objc_msgSend_setDeviceIdFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdFilter:");
}

id objc_msgSend_setDisableAutoPunctuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableAutoPunctuation:");
}

id objc_msgSend_setEnableSpeakerCodeTraining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableSpeakerCodeTraining:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtraLmList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtraLmList:");
}

id objc_msgSend_setFarFieldFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFarFieldFilter:");
}

id objc_msgSend_setInputFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputFormat:");
}

id objc_msgSend_setInterpretationIndices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpretationIndices:");
}

id objc_msgSend_setInterpretations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpretations:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIpaPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIpaPhoneSequence:");
}

id objc_msgSend_setIsLowConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLowConfidence:");
}

id objc_msgSend_setJitProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJitProfileData:");
}

id objc_msgSend_setMaximumRecognitionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumRecognitionDuration:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneSequence:");
}

id objc_msgSend_setRecognitionConfidenceSubtraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionConfidenceSubtraction:");
}

id objc_msgSend_setRecognitionReplacements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionReplacements:");
}

id objc_msgSend_setRecognizeEagerCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizeEagerCandidates:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoveSpaceBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoveSpaceBefore:");
}

id objc_msgSend_setSamplingRateFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSamplingRateFilter:");
}

id objc_msgSend_setSilenceStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSilenceStartTime:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setTaskTypeFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskTypeFilter:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokens:");
}

id objc_msgSend_setUserProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserProfileData:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_silenceStart(void *a1, const char *a2, ...)
{
  return _[a1 silenceStart];
}

id objc_msgSend_snr(void *a1, const char *a2, ...)
{
  return _[a1 snr];
}

id objc_msgSend_speechRecognitionFeatures(void *a1, const char *a2, ...)
{
  return _[a1 speechRecognitionFeatures];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_statusForLanguage(void *a1, const char *a2, ...)
{
  return _[a1 statusForLanguage];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByReplacingHyphensWithUnderscores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingHyphensWithUnderscores:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscribeToAssetWithConfig_regionId_subscriberId_expiration_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:");
}

id objc_msgSend_subscriptionsForSubscriberId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsForSubscriberId:");
}

id objc_msgSend_supportedLanguagesForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedLanguagesForAssetType:");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskTypeFilter(void *a1, const char *a2, ...)
{
  return _[a1 taskTypeFilter];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return _[a1 tasks];
}

id objc_msgSend_tokenName(void *a1, const char *a2, ...)
{
  return _[a1 tokenName];
}

id objc_msgSend_tokenSausage(void *a1, const char *a2, ...)
{
  return _[a1 tokenSausage];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return _[a1 tokens];
}

id objc_msgSend_trainAppLmFromNgramCountsArtifact_forApp_language_appLmArtifact_vocabFile_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:");
}

id objc_msgSend_trainAppLmFromNgramsSerializedData_customPronsData_language_writeToAppLmDir_vocabFile_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:");
}

id objc_msgSend_trainAppLmFromPlainTextAndWriteToAppDirectory_vocabFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:");
}

id objc_msgSend_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:");
}

id objc_msgSend_transcriptionsWithEARTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionsWithEARTokens:");
}

id objc_msgSend_transcriptionsWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionsWithTokens:");
}

id objc_msgSend_transitionArtifactAt_toStage_configPath_dataRoot_estimationRoot_minimize_saveTo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionArtifactAt:toStage:configPath:dataRoot:estimationRoot:minimize:saveTo:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsubscribeFromAssetWithConfig_regionId_subscriberId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsubscribeFromAssetWithConfig:regionId:subscriberId:");
}

id objc_msgSend_updateAudioDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAudioDuration:");
}

id objc_msgSend_urlForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlForTaskIdentifier:");
}

id objc_msgSend_utteranceStart(void *a1, const char *a2, ...)
{
  return _[a1 utteranceStart];
}

id objc_msgSend_validationError(void *a1, const char *a2, ...)
{
  return _[a1 validationError];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_writeToDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToDirectory:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}
int main(int argc, const char **argv, const char **envp)
{
  if (qword_100058F98 != -1) {
    swift_once(&qword_100058F98, sub_10001F6E4);
  }
  sub_10001E428();
}

uint64_t sub_10000485C(uint64_t a1, uint64_t a2)
{
  return sub_100004924(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004868(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000048A8(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100004918(uint64_t a1, uint64_t a2)
{
  return sub_100004924(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004924(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100004960(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_1000049D4(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100004A50@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

id sub_100004A90()
{
  return *v0;
}

uint64_t sub_100004A98@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100004AA0(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
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

uint64_t sub_100004B28()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(BGSystemTaskSchedulerErrorDomain);
}

uint64_t sub_100004B38(uint64_t a1)
{
  uint64_t v2 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100004B78(uint64_t a1)
{
  uint64_t v2 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100004BB8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100004C1C()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100004C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100004CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

void *sub_100004CFC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100004D0C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004D18@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100004D5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for Code(uint64_t a1)
{
}

void type metadata accessor for BGSystemTaskSchedulerError(uint64_t a1)
{
}

void type metadata accessor for APSIncomingMessagePriority(uint64_t a1)
{
}

void type metadata accessor for APSIncomingMessagePushType(uint64_t a1)
{
}

void sub_100004DFC(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004E40(uint64_t a1)
{
  uint64_t v2 = sub_100005038( &qword_100059038,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10004095C);
  uint64_t v3 = sub_100005038( (unint64_t *)&unk_100059040,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1000408B0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004EC4(uint64_t a1)
{
  uint64_t v2 = sub_100005038( &qword_100059008,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_100040764);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004F04(uint64_t a1)
{
  uint64_t v2 = sub_100005038( &qword_100059008,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_100040764);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004F48(uint64_t a1)
{
  uint64_t v2 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100004F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100004FE0()
{
  return sub_100005038( &qword_100058FD0,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_10004068C);
}

uint64_t sub_10000500C()
{
  return sub_100005038( &qword_100058FD8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000406B4);
}

uint64_t sub_100005038(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

BOOL sub_100005078(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000508C()
{
  return sub_100005038( &qword_100058FE0,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_1000407A4);
}

uint64_t sub_1000050B8()
{
  return sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
}

uint64_t sub_1000050E4()
{
  return sub_100005038( &qword_100058FF0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100040874);
}

uint64_t sub_100005110()
{
  return sub_100005038( &qword_100058FF8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100040848);
}

uint64_t sub_10000513C()
{
  return sub_100005038( &qword_100059000,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1000408E4);
}

uint64_t sub_100005168()
{
  return sub_100005038( &qword_100059008,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_100040764);
}

uint64_t sub_100005194()
{
  return sub_100005038( &qword_100059010,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_100040734);
}

uint64_t sub_1000051C0()
{
  return sub_100005038( &qword_100059018,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000406F4);
}

uint64_t sub_1000051EC()
{
  return sub_100005038( &qword_100059020,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_1000407CC);
}

uint64_t sub_100005218()
{
  return sub_100005038( &qword_100059028,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100040804);
}

unint64_t sub_100005248()
{
  unint64_t result = qword_100059030;
  if (!qword_100059030)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100059030);
  }

  return result;
}

BOOL sub_10000528C(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000529C(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_1000052C0(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6E6F6973726576LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v5 = 0xE700000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6973726576LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x6E6F697461657263LL && a2 == 0xEC00000065746144LL)
  {
    unint64_t v7 = 0xEC00000065746144LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461657263LL, 0xEC00000065746144LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x696665446B736174LL && a2 == 0xEE006E6F6974696ELL)
  {
    unint64_t v8 = 0xEE006E6F6974696ELL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x696665446B736174LL, 0xEE006E6F6974696ELL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0xD000000000000010LL)
  {
    unint64_t v9 = 0x800000010004A060LL;
    if (a2 == 0x800000010004A060LL) {
      goto LABEL_25;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x800000010004A060LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if (a1 == 0x617261506B736174LL && a2 == 0xEE0073726574656DLL)
  {
    swift_bridgeObjectRelease(0xEE0073726574656DLL);
    return 4LL;
  }

  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617261506B736174LL, 0xEE0073726574656DLL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0) {
      return 4LL;
    }
    else {
      return 5LL;
    }
  }

Swift::Int sub_100005534(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100005578(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000055AC + 4 * byte_100040A10[a1]))( 0x6E6F6973726576LL,  0xE700000000000000LL);
}

uint64_t sub_1000055AC()
{
  return 0x6E6F697461657263LL;
}

uint64_t sub_1000055CC()
{
  return 0x696665446B736174LL;
}

unint64_t sub_1000055F0()
{
  return 0xD000000000000010LL;
}

uint64_t sub_10000560C()
{
  return 0x617261506B736174LL;
}

BOOL sub_100005630(char *a1, char *a2)
{
  return sub_10000528C(*a1, *a2);
}

Swift::Int sub_100005648()
{
  return sub_100005534(*v0);
}

void sub_100005658(uint64_t a1)
{
}

Swift::Int sub_100005668(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_1000056B0()
{
  return sub_100005578(*v0);
}

uint64_t sub_1000056C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000052C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000056F0()
{
  return 0LL;
}

uint64_t sub_1000056FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_10000BE14();
  *a1 = result;
  return result;
}

uint64_t sub_10000572C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100040C38, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100005760(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100040C38, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100005794(void *a1, int *a2)
{
  v33 = a2;
  uint64_t v3 = v2;
  uint64_t v6 = *((void *)a2 + 2);
  uint64_t v5 = *((void *)a2 + 3);
  uint64_t v31 = *((void *)a2 + 4);
  uint64_t v32 = v6;
  uint64_t v7 = type metadata accessor for MLHostPushMessage.CodingKeys(255LL, v6, v5, v31);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100040C38, v7);
  uint64_t v9 = type metadata accessor for KeyedEncodingContainer(0LL, v7, WitnessTable);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v31 - v11;
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_10000C6DC(a1, v13);
  dispatch thunk of Encoder.container<A>(keyedBy:)(v7, v7, WitnessTable, v13, v14);
  uint64_t v15 = *v3;
  char v39 = 0;
  uint64_t v16 = v34;
  KeyedEncodingContainer.encode(_:forKey:)(v15, &v39, v9);
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v18 = v10;
  uint64_t v19 = v32;
  v20 = v33;
  v21 = (char *)v3 + v33[11];
  char v38 = 1;
  uint64_t v22 = type metadata accessor for Date(0LL);
  uint64_t v23 = sub_100005038( &qword_100059260,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v38, v9, v22, v23);
  v24 = (char *)v3 + v20[12];
  char v37 = 2;
  uint64_t v25 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v26 = sub_100005038( &qword_100059268,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v24, &v37, v9, v25, v26);
  v27 = (char *)v3 + v20[13];
  char v36 = 3;
  uint64_t v28 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v29 = sub_100005038( &qword_100059270,  (uint64_t (*)(uint64_t))&type metadata accessor for MLHostSystemParameters,  (uint64_t)&protocol conformance descriptor for MLHostSystemParameters);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v27, &v36, v9, v28, v29);
  v30 = (char *)v3 + v20[14];
  char v35 = 4;
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v30, &v35, v9, v19, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v9);
}

uint64_t sub_100005A1C@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v47 = a5;
  uint64_t v9 = type metadata accessor for Optional(0LL, a2);
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v49 = v9;
  __chkstk_darwin(v9);
  v52 = (char *)&v44 - v10;
  uint64_t v11 = sub_10000B4F4(&qword_100059240);
  __chkstk_darwin(v11);
  uint64_t v53 = (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v61 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v54 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  v60 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v55 = *(void *)(v14 - 8);
  uint64_t v56 = v14;
  __chkstk_darwin(v14);
  v59 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for MLHostPushMessage.CodingKeys(255LL, a2, a3, a4);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100040C38, v16);
  uint64_t v63 = type metadata accessor for KeyedDecodingContainer(0LL, v16, WitnessTable);
  uint64_t v58 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v19 = (char *)&v44 - v18;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v57 = type metadata accessor for MLHostPushMessage(0LL, a2, a3, a4);
  uint64_t v20 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v22 = (uint64_t *)((char *)&v44 - v21);
  *(uint64_t *)((char *)&v44 - v21) = 1LL;
  uint64_t v24 = a1[3];
  uint64_t v23 = a1[4];
  sub_10000C6DC(a1, v24);
  v62 = v19;
  uint64_t v25 = v64;
  dispatch thunk of Decoder.container<A>(keyedBy:)(v16, v16, WitnessTable, v24, v23);
  uint64_t v26 = a1;
  if (v25) {
    return sub_10000C550(a1);
  }
  uint64_t v28 = v59;
  v27 = v60;
  uint64_t v46 = v20;
  v30 = (int *)v57;
  uint64_t v29 = v58;
  uint64_t v31 = v61;
  v64 = v26;
  char v69 = 0;
  uint64_t v32 = KeyedDecodingContainer.decode(_:forKey:)(&v69, v63);
  v45 = v22;
  *uint64_t v22 = v32;
  char v68 = 1;
  uint64_t v33 = sub_100005038( &qword_100059248,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v34 = v56;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v56, &v68, v63, v56, v33);
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))((char *)v45 + v30[11], v28, v34);
  char v67 = 2;
  uint64_t v35 = sub_100005038( &qword_100059250,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
  char v36 = v27;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v31, &v67, v63, v31, v35);
  char v37 = v45;
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))((char *)v45 + v30[12], v36, v31);
  uint64_t v38 = type metadata accessor for MLHostSystemParameters(0LL);
  char v66 = 3;
  uint64_t v39 = sub_100005038( &qword_100059258,  (uint64_t (*)(uint64_t))&type metadata accessor for MLHostSystemParameters,  (uint64_t)&protocol conformance descriptor for MLHostSystemParameters);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v38, &v66, v63, v38, v39);
  v40 = v37;
  sub_10000C788(v53, (uint64_t)v37 + v30[13], &qword_100059240);
  char v65 = 4;
  v41 = v52;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v50, &v65, v63, v50, v51);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v62, v63);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))((uint64_t)v40 + v30[14], v41, v49);
  uint64_t v42 = v46;
  (*(void (**)(uint64_t, uint64_t *, int *))(v46 + 16))(v47, v40, v30);
  sub_10000C550(v64);
  return (*(uint64_t (**)(uint64_t *, int *))(v42 + 8))(v40, v30);
}

uint64_t sub_100005F30@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100005A1C(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_100005F50(void *a1, int *a2)
{
  return sub_100005794(a1, a2);
}

uint64_t sub_100005F64(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v92 = a1;
  uint64_t v91 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v9 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v11 = (char *)v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v15);
  v17 = (char *)v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v18 = sub_10001EB2C((uint64_t)_swiftEmptyArrayStorage);
  v88 = v5;
  v5[3] = v18;
  uint64_t v19 = (uint64_t)(v5 + 3);
  *(void *)(v19 + 48) = sub_10001EC4C((uint64_t)_swiftEmptyArrayStorage);
  v86[1] = a2;
  uint64_t v87 = a3;
  if (!a3)
  {
    a2 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
    a3 = v20;
  }

  uint64_t v21 = v88;
  v88[5] = a2;
  v21[6] = a3;
  if (a4)
  {
    swift_bridgeObjectRetain(v87);
    uint64_t v22 = (uint64_t)a4;
  }

  else
  {
    int64_t v90 = sub_10000C654(0LL, &qword_1000592B0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    __n128 v23 = swift_bridgeObjectRetain(v87);
    static DispatchQoS.unspecified.getter(v23);
    v93[0] = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v24 = sub_100005038( &qword_1000592B8,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    uint64_t v25 = sub_10000B4F4(&qword_1000592C0);
    uint64_t v26 = sub_10000C700( (unint64_t *)&qword_1000592C8,  &qword_1000592C0,  (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(v93, v25, v26, v12, v24);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))( v11,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v91);
    uint64_t v22 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001BLL,  0x800000010004A020LL,  v17,  v14,  v11,  0LL);
  }

  v88[4] = v22;
  uint64_t v27 = *(void *)(v92 + 64);
  uint64_t v89 = v92 + 64;
  uint64_t v28 = 1LL << *(_BYTE *)(v92 + 32);
  uint64_t v29 = -1LL;
  if (v28 < 64) {
    uint64_t v29 = ~(-1LL << v28);
  }
  unint64_t v30 = v29 & v27;
  int64_t v90 = (unint64_t)(v28 + 63) >> 6;
  v86[0] = a4;
  int64_t v31 = 0LL;
  uint64_t v91 = v19;
  while (1)
  {
    if (v30)
    {
      unint64_t v35 = __clz(__rbit64(v30));
      v30 &= v30 - 1;
      unint64_t v36 = v35 | (v31 << 6);
      goto LABEL_27;
    }

    int64_t v37 = v31 + 1;
    if (__OFADD__(v31, 1LL)) {
      goto LABEL_50;
    }
    if (v37 >= v90) {
      break;
    }
    unint64_t v38 = *(void *)(v89 + 8 * v37);
    ++v31;
    if (!v38)
    {
      int64_t v31 = v37 + 1;
      if (v37 + 1 >= v90) {
        break;
      }
      unint64_t v38 = *(void *)(v89 + 8 * v31);
      if (!v38)
      {
        int64_t v31 = v37 + 2;
        if (v37 + 2 >= v90) {
          break;
        }
        unint64_t v38 = *(void *)(v89 + 8 * v31);
        if (!v38)
        {
          int64_t v39 = v37 + 3;
          if (v39 >= v90) {
            break;
          }
          unint64_t v38 = *(void *)(v89 + 8 * v39);
          if (!v38)
          {
            while (1)
            {
              int64_t v31 = v39 + 1;
              if (__OFADD__(v39, 1LL)) {
                goto LABEL_51;
              }
              if (v31 >= v90) {
                goto LABEL_43;
              }
              unint64_t v38 = *(void *)(v89 + 8 * v31);
              ++v39;
              if (v38) {
                goto LABEL_26;
              }
            }
          }

          int64_t v31 = v39;
        }
      }
    }

LABEL_26:
    unint64_t v30 = (v38 - 1) & v38;
    unint64_t v36 = __clz(__rbit64(v38)) + (v31 << 6);
LABEL_27:
    v40 = (uint64_t *)(*(void *)(v92 + 48) + 16 * v36);
    uint64_t v41 = *v40;
    uint64_t v42 = v40[1];
    uint64_t v43 = *(void *)(*(void *)(v92 + 56) + 8 * v36);
    uint64_t v44 = *(void *)(v43 + 16);
    swift_bridgeObjectRetain(v42);
    swift_bridgeObjectRetain(v43);
    uint64_t v45 = Set.init(minimumCapacity:)(v44, &type metadata for String, &protocol witness table for String);
    v94 = (void *)v45;
    uint64_t v46 = *(void *)(v43 + 16);
    if (v46)
    {
      int64_t v47 = v31;
      uint64_t v48 = (uint64_t *)(v43 + 40);
      do
      {
        uint64_t v49 = *(v48 - 1);
        uint64_t v50 = *v48;
        swift_bridgeObjectRetain(*v48);
        sub_10002C02C(v93, v49, v50);
        swift_bridgeObjectRelease(v93[1]);
        v48 += 2;
        --v46;
      }

      while (v46);
      swift_bridgeObjectRelease(v43);
      uint64_t v51 = (uint64_t)v94;
      int64_t v31 = v47;
    }

    else
    {
      uint64_t v51 = v45;
      swift_bridgeObjectRelease(v43);
    }

    v52 = (void *)v91;
    swift_beginAccess(v91, v93, 33LL, 0LL);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v52);
    v94 = (void *)*v52;
    uint64_t v54 = v94;
    void *v52 = 0x8000000000000000LL;
    unint64_t v56 = sub_10002BC00(v41, v42);
    uint64_t v57 = v54[2];
    BOOL v58 = (v55 & 1) == 0;
    uint64_t v59 = v57 + v58;
    if (__OFADD__(v57, v58))
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }

    char v60 = v55;
    if (v54[3] >= v59)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v63 = v94;
        if ((v55 & 1) != 0) {
          goto LABEL_9;
        }
      }

      else
      {
        sub_10001A984();
        uint64_t v63 = v94;
        if ((v60 & 1) != 0) {
          goto LABEL_9;
        }
      }
    }

    else
    {
      sub_10002C474(v59, isUniquelyReferenced_nonNull_native);
      unint64_t v61 = sub_10002BC00(v41, v42);
      if ((v60 & 1) != (v62 & 1)) {
        goto LABEL_53;
      }
      unint64_t v56 = v61;
      uint64_t v63 = v94;
      if ((v60 & 1) != 0)
      {
LABEL_9:
        uint64_t v32 = v63[7];
        uint64_t v33 = 8 * v56;
        swift_bridgeObjectRelease(*(void *)(v32 + v33));
        *(void *)(v32 + v33) = v51;
        goto LABEL_10;
      }
    }

    v63[(v56 >> 6) + 8] |= 1LL << v56;
    v64 = (uint64_t *)(v63[6] + 16 * v56);
    uint64_t *v64 = v41;
    v64[1] = v42;
    *(void *)(v63[7] + 8 * v56) = v51;
    uint64_t v65 = v63[2];
    BOOL v66 = __OFADD__(v65, 1LL);
    uint64_t v67 = v65 + 1;
    if (v66) {
      goto LABEL_49;
    }
    v63[2] = v67;
    swift_bridgeObjectRetain(v42);
LABEL_10:
    uint64_t v34 = *v52;
    void *v52 = v63;
    swift_bridgeObjectRelease(v42);
    swift_bridgeObjectRelease(v34);
    swift_endAccess(v93);
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

    HostConfigurationRequest = type metadata accessor for GetHostConfigurationRequest(0LL);
    v40 = sub_100005038( &qword_100059890,  (uint64_t (*)(uint64_t))&type metadata accessor for GetHostConfigurationRequest,  (uint64_t)&protocol conformance descriptor for GetHostConfigurationRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)( HostConfigurationRequest,  sub_10003EDF0,  a2,  HostConfigurationRequest,  v40);
    swift_release(a2);
    if ((v9 & 2) == 0)
    {
LABEL_17:
      if ((v9 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_28;
    }

        uint64_t v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      uint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      uint64_t v22 = *v21;
      __n128 v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      uint64_t v25 = result & ~v24;
      uint64_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        uint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v27 = 0;
        uint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          uint64_t v29 = v26 == v28;
          if (v26 == v28) {
            uint64_t v26 = 0LL;
          }
          v27 |= v29;
          unint64_t v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        uint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      uint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      *uint64_t v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

        uint64_t v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(v3 + 48) + 8 * v17);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      __n128 v23 = result & ~v22;
      uint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        uint64_t v15 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v25 = 0;
        uint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          uint64_t v27 = v24 == v26;
          if (v24 == v26) {
            uint64_t v24 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }

        while (v28 == -1);
        uint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    uint64_t v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    uint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    __n128 v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    uint64_t result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    uint64_t v25 = result & ~v24;
    uint64_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      uint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v27 = 0;
      uint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        uint64_t v29 = v26 == v28;
        if (v26 == v28) {
          uint64_t v26 = 0LL;
        }
        v27 |= v29;
        unint64_t v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      uint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    uint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    *uint64_t v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  uint64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  uint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    uint64_t v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    uint64_t v13 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_36;
    }
    uint64_t v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

    uint64_t v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    uint64_t v21 = *(void *)(v6 + 40);
    uint64_t v22 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    uint64_t result = NSObject._rawHashValue(seed:)(v21);
    __n128 v23 = -1LL << *(_BYTE *)(v6 + 32);
    uint64_t v24 = result & ~v23;
    uint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      uint64_t v15 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        uint64_t v28 = v25 == v27;
        if (v25 == v27) {
          uint64_t v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }

      while (v29 == -1);
      uint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }

  uint64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_38;
  }

  uint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    uint64_t v14 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    uint64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_36;
    }
    uint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

LABEL_43:
  swift_release(v92);
  uint64_t v68 = sub_10000B4F4(&qword_1000592D0);
  uint64_t v69 = swift_allocObject(v68, 20LL, 7LL);
  *(_DWORD *)(v69 + 16) = 0;
  v70 = v88;
  v88[2] = v69;
  v70[8] = [objc_allocWithZone((Class)type metadata accessor for MLHostAPSListener()) init];
  v71 = (void *)v70[4];
  uint64_t v72 = v87;
  if (v87)
  {
    id v73 = v71;
    NSString v74 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v72);
  }

  else
  {
    id v75 = v71;
    NSString v74 = 0LL;
  }

  id v76 = objc_allocWithZone(&OBJC_CLASS___APSConnection);
  NSString v77 = String._bridgeToObjectiveC()();
  id v78 = [v76 initWithEnvironmentName:v74 namedDelegatePort:v77 queue:v71];

  if (v78)
  {
    v79 = (void (*)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v88;
    v88[7] = v78;
    v80 = (void *)*((void *)v79 + 8);
    id v81 = v78;
    id v82 = v80;
    [v81 setDelegate:v82];

    v83 = (void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)v79 + 8) + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
    v84 = v83[1];
    *v83 = sub_10000C68C;
    v83[1] = v79;
    swift_retain(v79);
    swift_release(v84);
    return (uint64_t)v79;
  }

      v103 = qword_100058F68;
      swift_bridgeObjectRetain(v41);
      if (v103 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      v104 = type metadata accessor for Logger(0LL);
      sub_10000C538(v104, (uint64_t)qword_10005A7E0);
      swift_bridgeObjectRetain(v41);
      v106 = (os_log_s *)Logger.logObject.getter(v105);
      v107 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = swift_slowAlloc(12LL, -1LL);
        v109 = (uint64_t)v42;
        v110 = (void *)swift_slowAlloc(32LL, -1LL);
        v160[0] = v110;
        *(_DWORD *)v108 = v136;
        swift_bridgeObjectRetain(v41);
        *(void *)(v108 + 4) = sub_10000B540(v109, v41, (uint64_t *)v160);
        swift_bridgeObjectRelease_n(v41, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v106, v107, "Skipping taskFolder: %s", (uint8_t *)v108, 0xCu);
        swift_arrayDestroy(v110, 1LL, v132);
        swift_slowDealloc(v110, -1LL, -1LL);
        swift_slowDealloc(v108, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v41, 2LL);
      }
    }
  }

      v496 = (uint64_t *)(v1 + 976);
      v507 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1800);
      v254 = *(void *)(v1 + 1728);
      v255 = *(void *)(v1 + 1432);
      v256 = *(void *)(v1 + 1424);
      v257 = *(void *)(v1 + 1416);
      v258 = v253;
      v259 = MLHostTask.name.getter(v258);
      v261 = v260;
      v262 = *(void (**)(uint64_t, uint64_t, uint64_t))(v256 + 16);
      v262(v255, v254, v257);
      sub_100013D50(v259, v261, v255);
      swift_bridgeObjectRelease(v261);
      v263 = v507(v255, v257);
      v264 = MLHostTask.name.getter(v263);
      v266 = v265;
      sub_100013A80(v264, v265);
      v267 = swift_bridgeObjectRelease(v266);
      v268 = MLHostResult.status.getter(v267);
      v269 = MLHostResultStatus.rawValue.getter(v268);
      if (v269 != MLHostResultStatus.rawValue.getter(1LL))
      {
        v508 = *(void (**)(uint64_t, uint64_t))(v1 + 1800);
        v270 = *(void *)(v1 + 1728);
        v271 = *(void *)(v1 + 1432);
        v272 = *(void *)(v1 + 1416);
        v273 = [*(id *)(v1 + 1704) processIdentifier];
        v513 = 0LL;
        v514 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        v274 = v514;
        *(void *)(v1 + 904) = v513;
        *(void *)(v1 + 912) = v274;
        v275._countAndFlagsBits = 0x206B736154LL;
        v275._object = (void *)0xE500000000000000LL;
        String.append(_:)(v275);
        v277._countAndFlagsBits = MLHostTask.name.getter(v276);
        v278 = v277._object;
        String.append(_:)(v277);
        swift_bridgeObjectRelease(v278);
        v279._object = (void *)0x800000010004A570LL;
        v279._countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v279);
        v262(v271, v270, v272);
        _print_unlocked<A, B>(_:_:)( v271,  v1 + 904,  v272,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v508(v271, v272);
        v280._countAndFlagsBits = 46LL;
        v280._object = (void *)0xE100000000000000LL;
        String.append(_:)(v280);
        v281 = *(void *)(v1 + 912);
        sub_1000305D8((uint64_t)v273, *(void *)(v1 + 904), v281);
        swift_bridgeObjectRelease(v281);
      }

      goto LABEL_46;
    }

    v335 = *(void (**)(uint64_t, uint64_t))(v1 + 1816);
    v336 = *(void *)(v1 + 1264);
    v337 = *(void *)(v1 + 1216);
    v338 = *(void *)(v1 + 1176);
    ContinuousClock.init()(v311);
    *(void *)(v1 + 856) = 500000000000000000LL;
    *(void *)(v1 + 864) = 0LL;
    *(_OWORD *)(v1 + 816) = 0u;
    *(_BYTE *)(v1 + 832) = 1;
    v99 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v338, v99);
    v339 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v1 + 856, v337, v339);
    v335(v336, v337);
    v340 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(void *)(v1 + 1832) = v340;
    *v340 = v1;
    v340[1] = sub_1000353B0;
    v103 = *(void *)(v1 + 1248);
    v104 = *(void *)(v1 + 1176);
    v105 = v1 + 816;
LABEL_19:
    v106 = v103;
    v107 = v99;
    return dispatch thunk of Clock.sleep(until:tolerance:)(v106, v105, v104, v107);
  }

  v480 = (uint64_t *)(v1 + 1024);
  uint64_t v13 = *(void (**)(uint64_t, void, uint64_t))(v1 + 1736);
  v500 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1696);
  v428 = *(void *)(v1 + 1680);
  v441 = *(void (**)(uint64_t, uint64_t))(v1 + 1800);
  uint64_t v14 = *(void *)(v1 + 1608);
  uint64_t v15 = *(void *)(v1 + 1592);
  v450 = *(void *)(v1 + 1464);
  v460 = *(void *)(v1 + 1440);
  v471 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1688);
  uint64_t v16 = *(void *)(v1 + 1432);
  v17 = *(void *)(v1 + 1416);
  unint64_t v18 = *(void *)(v1 + 1152);
  uint64_t v19 = MLHostTask.name.getter(v12);
  uint64_t v21 = v20;
  v13(v16, enum case for TaskStatus.taskFailed(_:), v17);
  sub_100013D50(v19, v21, v16);
  swift_bridgeObjectRelease(v21);
  v441(v16, v17);
  v471(v14, v428, v15);
  uint64_t v22 = v500(v450, v18, v460);
  __n128 v23 = (os_log_s *)Logger.logObject.getter(v22);
  uint64_t v24 = static os_log_type_t.error.getter();
  uint64_t v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v1 + 1776);
  uint64_t v27 = *(void *)(v1 + 1608);
  uint64_t v28 = *(void *)(v1 + 1592);
  uint64_t v29 = *(void *)(v1 + 1464);
  unint64_t v30 = *(void *)(v1 + 1440);
  if (v25)
  {
    v501 = *(void (**)(uint64_t, uint64_t))(v1 + 1776);
    v451 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
    v472 = *(void *)(v1 + 1592);
    int64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    v513 = v32;
    *(_DWORD *)int64_t v31 = 136315138;
    uint64_t v33 = MLHostTask.name.getter(v32);
    v461 = v27;
    unint64_t v35 = v34;
    *v480 = sub_10000B540(v33, v34, &v513);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v480, v1 + 1032, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease(v35);
    v451(v29, v30);
    _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Task %s has been in shouldRun for too long. Marking task as failed and terminating process.",  v31,  0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);

    v501(v461, v472);
  }

  else
  {
    (*(void (**)(void, void))(v1 + 1784))(*(void *)(v1 + 1464), *(void *)(v1 + 1440));

    v26(v27, v28);
  }

  v474 = *(void *)(v1 + 1768);
  v483 = *(void *)(v1 + 1808);
  v109 = *(void *)(v1 + 1744);
  v453 = *(void *)(v1 + 1720);
  v463 = *(void *)(v1 + 1760);
  v110 = *(void **)(v1 + 1704);
  v111 = *(void *)(v1 + 1672);
  v112 = *(void *)(v1 + 1408);
  v493 = *(void *)(v1 + 1400);
  v503 = *(void *)(v1 + 1392);
  v432 = *(void *)(v1 + 1272);
  v444 = *(void **)(v1 + 1752);
  v113 = *(void *)(v1 + 1224);
  v424 = *(void *)(v1 + 1216);
  v114 = *(void *)(v1 + 1168);
  v115 = [v110 processIdentifier];
  v513 = 0LL;
  v514 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(43LL);
  v116._countAndFlagsBits = 0x206B736154LL;
  v116._object = (void *)0xE500000000000000LL;
  String.append(_:)(v116);
  v118._countAndFlagsBits = MLHostTask.name.getter(v117);
  v119 = v118._object;
  String.append(_:)(v118);
  v120 = v119;
  id v81 = v111;
  swift_bridgeObjectRelease(v120);
  v121._countAndFlagsBits = 0xD000000000000024LL;
  v121._object = (void *)0x800000010004A4E0LL;
  String.append(_:)(v121);
  v122 = v514;
  v123 = (uint64_t)v115;
  uint64_t v69 = v114;
  sub_1000305D8(v123, v513, v514);
  swift_unknownObjectRelease(v109);

  swift_bridgeObjectRelease(v122);
  (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v432, v424);
  swift_release(v453);
  swift_release(v463);
  swift_release(v474);
  swift_release(v483);
  [v110 invalidate];

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v493 + 8))(v112, v503);
LABEL_23:
  v504 = 0LL;
LABEL_58:
  swift_release_n(v69, 2LL);
  swift_unknownObjectRelease(v81);
  v358 = *(void *)(v1 + 1656);
  v359 = *(void *)(v1 + 1648);
  v360 = *(void *)(v1 + 1640);
  v361 = *(void *)(v1 + 1632);
  v362 = *(void *)(v1 + 1624);
  v363 = *(void *)(v1 + 1616);
  v364 = *(void *)(v1 + 1608);
  v365 = *(void *)(v1 + 1584);
  v366 = *(void *)(v1 + 1576);
  v374 = *(void *)(v1 + 1568);
  v375 = *(void *)(v1 + 1560);
  v376 = *(void *)(v1 + 1552);
  v377 = *(void *)(v1 + 1544);
  v378 = *(void *)(v1 + 1536);
  v379 = *(void *)(v1 + 1528);
  v380 = *(void *)(v1 + 1520);
  v381 = *(void *)(v1 + 1512);
  v383 = *(void *)(v1 + 1504);
  v384 = *(void *)(v1 + 1496);
  v385 = *(void *)(v1 + 1488);
  v387 = *(void *)(v1 + 1480);
  v389 = *(void *)(v1 + 1472);
  v390 = *(void *)(v1 + 1464);
  v392 = *(void *)(v1 + 1432);
  v394 = *(void *)(v1 + 1408);
  v397 = *(void *)(v1 + 1384);
  v400 = *(id *)(v1 + 1376);
  v404 = *(void *)(v1 + 1352);
  v409 = *(void *)(v1 + 1344);
  v413 = *(void *)(v1 + 1320);
  v417 = *(void *)(v1 + 1296);
  v420 = *(void *)(v1 + 1272);
  v427 = *(void *)(v1 + 1264);
  v440 = *(void *)(v1 + 1256);
  v449 = *(void *)(v1 + 1248);
  v459 = *(void *)(v1 + 1240);
  v470 = *(void *)(v1 + 1232);
  v479 = *(void *)(v1 + 1208);
  v490 = *(void *)(v1 + 1200);
  v499 = *(void *)(v1 + 1192);
  swift_task_dealloc(*(void *)(v1 + 1664));
  swift_task_dealloc(v358);
  swift_task_dealloc(v359);
  swift_task_dealloc(v360);
  swift_task_dealloc(v361);
  swift_task_dealloc(v362);
  swift_task_dealloc(v363);
  swift_task_dealloc(v364);
  swift_task_dealloc(v365);
  swift_task_dealloc(v366);
  swift_task_dealloc(v374);
  swift_task_dealloc(v375);
  swift_task_dealloc(v376);
  swift_task_dealloc(v377);
  swift_task_dealloc(v378);
  swift_task_dealloc(v379);
  swift_task_dealloc(v380);
  swift_task_dealloc(v381);
  swift_task_dealloc(v383);
  swift_task_dealloc(v384);
  swift_task_dealloc(v385);
  swift_task_dealloc(v387);
  swift_task_dealloc(v389);
  swift_task_dealloc(v390);
  swift_task_dealloc(v392);
  swift_task_dealloc(v394);
  swift_task_dealloc(v397);
  swift_task_dealloc(v400);
  swift_task_dealloc(v404);
  swift_task_dealloc(v409);
  swift_task_dealloc(v413);
  swift_task_dealloc(v417);
  swift_task_dealloc(v420);
  swift_task_dealloc(v427);
  swift_task_dealloc(v440);
  swift_task_dealloc(v449);
  swift_task_dealloc(v459);
  swift_task_dealloc(v470);
  swift_task_dealloc(v479);
  swift_task_dealloc(v490);
  swift_task_dealloc(v499);
  return (*(uint64_t (**)(void *))(v1 + 8))(v504);
}

LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_100006628( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v107 = a8;
  uint64_t v110 = a7;
  uint64_t v109 = a6;
  uint64_t v108 = a5;
  uint64_t v115 = a3;
  uint64_t v114 = sub_10000B4F4(&qword_1000592D8);
  uint64_t v112 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  uint64_t v116 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v113 = sub_10000B4F4(&qword_1000592E0);
  __chkstk_darwin(v113);
  uint64_t v117 = (uint64_t)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v118 = v9;
  uint64_t v15 = (os_unfair_lock_s *)(v9[2] + 16LL);
  os_unfair_lock_lock(v15);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v16 = type metadata accessor for Logger(0LL);
  id v17 = (id)sub_10000C538(v16, (uint64_t)qword_10005A7E0);
  swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v18 = swift_bridgeObjectRetain_n(a4, 2LL);
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v22 = swift_slowAlloc(64LL, -1LL);
    id v106 = v17;
    uint64_t v23 = v22;
    *(void *)&__int128 v128 = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    v111 = v15;
    swift_bridgeObjectRetain(a2);
    *(void *)&__int128 v130 = sub_10000B540(a1, a2, (uint64_t *)&v128);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v130, (char *)&v130 + 8, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    *(void *)&__int128 v130 = sub_10000B540(v115, a4, (uint64_t *)&v128);
    uint64_t v15 = v111;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v130, (char *)&v130 + 8, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease_n(a4, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Processing push message: topic: %s channel: %s",  (uint8_t *)v21,  0x16u);
    swift_arrayDestroy(v23, 2LL, (char *)&type metadata for Any + 8);
    uint64_t v24 = v23;
    id v17 = v106;
    swift_slowDealloc(v24, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  uint64_t v25 = v118;
  swift_beginAccess(v118 + 9, &v128, 32LL, 0LL);
  uint64_t v26 = v25[9];
  if (!*(void *)(v26 + 16)) {
    goto LABEL_12;
  }
  swift_bridgeObjectRetain(a2);
  unint64_t v27 = sub_10002BC00(a1, a2);
  if ((v28 & 1) == 0)
  {
    swift_bridgeObjectRelease(a2);
LABEL_12:
    swift_endAccess(&v128);
    uint64_t v33 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v34 = (void *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled((os_log_t)v34, v35))
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
      goto LABEL_48;
    }

    unint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v37 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v128 = v37;
    *(_DWORD *)unint64_t v36 = 136315138;
    swift_bridgeObjectRetain(a2);
    *(void *)&__int128 v130 = sub_10000B540(a1, a2, (uint64_t *)&v128);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v130, (char *)&v130 + 8, v36 + 4, v36 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, v35, "No handler registered for topic: %s", v36, 0xCu);
    swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v38 = v37;
    goto LABEL_46;
  }

  uint64_t v29 = *(void *)(v26 + 56) + 16 * v27;
  uint64_t v30 = *(void *)(v29 + 8);
  v99 = *(void (**)(__int128 *, void *, void *, void *, void **, __n128))v29;
  swift_endAccess(&v128);
  swift_retain(v30);
  swift_bridgeObjectRelease(a2);
  strcpy((char *)&v126, "messageBundle");
  HIWORD(v126) = -4864;
  AnyHashable.init<A>(_:)(&v128, &v126, &type metadata for String, &protocol witness table for String);
  if (*(void *)(a9 + 16) && (unint64_t v31 = sub_10002BCE4((uint64_t)&v128), (v32 & 1) != 0))
  {
    sub_10000C570(*(void *)(a9 + 56) + 32 * v31, (uint64_t)&v126);
  }

  else
  {
    __int128 v126 = 0u;
    __int128 v127 = 0u;
  }

  sub_10000C698((uint64_t)&v128);
  if (!*((void *)&v127 + 1))
  {
    swift_release(v30);
    uint64_t v71 = sub_10000C7CC((uint64_t)&v126, &qword_1000592E8);
    goto LABEL_44;
  }

  uint64_t v104 = v30;
  sub_10000C6CC(&v126, &v130);
  int64_t v39 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  uint64_t v40 = v131;
  uint64_t v41 = sub_10000C6DC(&v130, v131);
  uint64_t v42 = _bridgeAnythingToObjectiveC<A>(_:)(v41, v40);
  id v106 = v39;
  LODWORD(v39) = [v39 isValidJSONObject:v42];
  swift_unknownObjectRelease(v42);
  if (!(_DWORD)v39
    || (sub_10000C570((uint64_t)&v130, (uint64_t)&v128),
        uint64_t v43 = sub_10000B4F4(&qword_1000592F0),
        (swift_dynamicCast(&v126, &v128, (char *)&type metadata for Any + 8, v43, 6LL) & 1) == 0))
  {
    swift_release(v104);
    uint64_t v71 = sub_10000C550(&v130);
LABEL_44:
    uint64_t v34 = (void *)Logger.logObject.getter(v71);
    os_log_type_t v72 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled((os_log_t)v34, v72))
    {
LABEL_47:

      goto LABEL_48;
    }

    unint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v73 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v128 = v73;
    *(_DWORD *)unint64_t v36 = 136315138;
    *(void *)&__int128 v130 = sub_10000B540(0x426567617373656DLL, 0xED0000656C646E75LL, (uint64_t *)&v128);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v130, (char *)&v130 + 8, v36 + 4, v36 + 12);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v34,  v72,  "The push message body must be a JSON dictionary with key: %s.",  v36,  0xCu);
    swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v38 = v73;
LABEL_46:
    swift_slowDealloc(v38, -1LL, -1LL);
    swift_slowDealloc(v36, -1LL, -1LL);
    goto LABEL_47;
  }

  uint64_t v98 = a1;
  v111 = v15;
  v123 = _swiftEmptyArrayStorage;
  uint64_t v105 = v126;
  uint64_t v102 = *(void *)(v126 + 16);
  if (v102)
  {
    uint64_t v44 = 0LL;
    uint64_t v45 = _swiftEmptyArrayStorage;
    v103 = (char *)&type metadata for Any + 8;
    unint64_t v100 = (unint64_t)"com.apple.aps.mlhostd";
    unint64_t v101 = 0x800000010004A060LL;
    while (1)
    {
      v118 = v45;
      id v46 = v17;
      uint64_t v47 = *(void *)(v105 + 8 * v44 + 32);
      swift_bridgeObjectRetain(v47);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      *(void *)&__int128 v128 = 0LL;
      id v49 = [v106 dataWithJSONObject:isa options:0 error:&v128];

      id v50 = (id)v128;
      if (!v49) {
        break;
      }
      uint64_t v51 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v49);
      unint64_t v53 = v52;

      uint64_t v54 = type metadata accessor for JSONDecoder(0LL);
      swift_allocObject(v54, *(unsigned int *)(v54 + 48), *(unsigned __int16 *)(v54 + 52));
      uint64_t v55 = JSONDecoder.init()();
      uint64_t v56 = sub_10000C700(&qword_1000592F8, &qword_1000592E0, (uint64_t)&unk_100040B10);
      dispatch thunk of JSONDecoder.decode<A>(_:from:)(v113, v51, v53, v113, v56);
      swift_release(v55);
      unint64_t v57 = sub_10001EF2C((uint64_t)_swiftEmptyArrayStorage);
      *(void *)&__int128 v124 = 0xD000000000000010LL;
      *((void *)&v124 + 1) = v101;
      AnyHashable.init<A>(_:)(&v128, &v124, &type metadata for String, &protocol witness table for String);
      if (*(void *)(v47 + 16) && (unint64_t v58 = sub_10002BCE4((uint64_t)&v128), (v59 & 1) != 0))
      {
        sub_10000C570(*(void *)(v47 + 56) + 32 * v58, (uint64_t)&v124);
      }

      else
      {
        __int128 v124 = 0u;
        __int128 v125 = 0u;
      }

      sub_10000C698((uint64_t)&v128);
      if (*((void *)&v125 + 1))
      {
        sub_10000C6CC(&v124, &v126);
        sub_10000C570((uint64_t)&v126, (uint64_t)&v128);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v57);
        *(void *)&__int128 v124 = v57;
        sub_10002D3E8(&v128, 0xD000000000000010LL, v100 | 0x8000000000000000LL, isUniquelyReferenced_nonNull_native);
        uint64_t v61 = v124;
        swift_bridgeObjectRelease(0x8000000000000000LL);
        sub_10000C550(&v126);
      }

      else
      {
        sub_10000C7CC((uint64_t)&v124, &qword_1000592E8);
        unint64_t v62 = sub_10001F060((uint64_t)_swiftEmptyArrayStorage);
        uint64_t v129 = sub_10000B4F4(qword_100059300);
        *(void *)&__int128 v128 = v62;
        sub_10000C6CC(&v128, &v126);
        char v63 = swift_isUniquelyReferenced_nonNull_native(v57);
        *(void *)&__int128 v124 = v57;
        sub_10002D3E8(&v126, 0xD000000000000010LL, v100 | 0x8000000000000000LL, v63);
        uint64_t v61 = v124;
        swift_bridgeObjectRelease(0x8000000000000000LL);
      }

      strcpy((char *)&v126, "taskParameters");
      HIBYTE(v126) = -18;
      AnyHashable.init<A>(_:)(&v128, &v126, &type metadata for String, &protocol witness table for String);
      if (*(void *)(v47 + 16) && (unint64_t v64 = sub_10002BCE4((uint64_t)&v128), (v65 & 1) != 0))
      {
        sub_10000C570(*(void *)(v47 + 56) + 32 * v64, (uint64_t)&v124);
      }

      else
      {
        __int128 v124 = 0u;
        __int128 v125 = 0u;
      }

      swift_bridgeObjectRelease(v47);
      sub_10000C698((uint64_t)&v128);
      if (*((void *)&v125 + 1))
      {
        sub_10000C6CC(&v124, &v126);
        sub_10000C570((uint64_t)&v126, (uint64_t)&v128);
        char v66 = swift_isUniquelyReferenced_nonNull_native(v61);
        *(void *)&__int128 v124 = v61;
        sub_10002D3E8(&v128, 0x617261506B736174LL, 0xEE0073726574656DLL, v66);
        uint64_t v61 = v124;
        swift_bridgeObjectRelease(0x8000000000000000LL);
        sub_10000C550(&v126);
      }

      else
      {
        sub_10000C7CC((uint64_t)&v124, &qword_1000592E8);
      }

      id v17 = v46;
      uint64_t v67 = *(int *)(v114 + 48);
      uint64_t v68 = v116;
      sub_10000C740(v117, v116);
      *(void *)(v68 + v67) = v61;
      uint64_t v45 = v118;
      if ((swift_isUniquelyReferenced_nonNull_native(v118) & 1) == 0) {
        uint64_t v45 = (void *)sub_10001A10C(0, v45[2] + 1LL, 1, (unint64_t)v45);
      }
      unint64_t v70 = v45[2];
      unint64_t v69 = v45[3];
      if (v70 >= v69 >> 1) {
        uint64_t v45 = (void *)sub_10001A10C(v69 > 1, v70 + 1, 1, (unint64_t)v45);
      }
      ++v44;
      v45[2] = v70 + 1;
      sub_10000C788( v116,  (uint64_t)v45 + ((*(unsigned __int8 *)(v112 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80))
      + *(void *)(v112 + 72) * v70,
        &qword_1000592D8);
      sub_10000C5C4(v51, v53);
      v123 = v45;
      sub_10000C7CC(v117, &qword_1000592E0);
      if (v102 == v44) {
        goto LABEL_49;
      }
    }

    uint64_t v87 = v50;
    swift_bridgeObjectRelease(v105);
    swift_release(v104);
    swift_bridgeObjectRelease(v47);
    uint64_t v88 = _convertNSErrorToError(_:)(v87);

    swift_willThrow(v89);
    swift_errorRetain(v88);
    uint64_t v90 = swift_errorRetain(v88);
    uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
    uint64_t v92 = static os_log_type_t.error.getter();
    BOOL v93 = os_log_type_enabled(v91, (os_log_type_t)v92);
    uint64_t v15 = v111;
    if (v93)
    {
      v94 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v95 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)v94 = 138412290;
      swift_errorRetain(v88);
      uint64_t v96 = _swift_stdlib_bridgeErrorToNSError(v88);
      *(void *)&__int128 v128 = v96;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, (char *)&v128 + 8, v94 + 4, v94 + 12);
      uint64_t *v95 = v96;
      swift_errorRelease(v88);
      swift_errorRelease(v88);
      _os_log_impl( (void *)&_mh_execute_header,  v91,  (os_log_type_t)v92,  "Received invalid push message, error: %@. Skipping callback.",  v94,  0xCu);
      uint64_t v97 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v95, 1LL, v97);
      swift_slowDealloc(v95, -1LL, -1LL);
      swift_slowDealloc(v94, -1LL, -1LL);

      swift_errorRelease(v88);
    }

    else
    {
      swift_errorRelease(v88);
      swift_errorRelease(v88);
      swift_errorRelease(v88);
    }

    sub_10000C550(&v130);
    swift_bridgeObjectRelease(v118);
  }

  else
  {
LABEL_49:
    v118 = (void *)a4;
    uint64_t v74 = swift_bridgeObjectRelease(v105);
    id v75 = (os_log_s *)Logger.logObject.getter(v74);
    os_log_type_t v76 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v75, v76))
    {
      NSString v77 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v78 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v128 = v78;
      *(_DWORD *)NSString v77 = 136315138;
      swift_beginAccess(&v123, &v126, 0LL, 0LL);
      v79 = v123;
      swift_bridgeObjectRetain(v123);
      uint64_t v81 = Array.description.getter(v80, v114);
      unint64_t v83 = v82;
      swift_bridgeObjectRelease(v79);
      *(void *)&__int128 v124 = sub_10000B540(v81, v83, (uint64_t *)&v128);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v124, (char *)&v124 + 8, v77 + 4, v77 + 12);
      swift_bridgeObjectRelease(v83);
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "Decoded pushed message bundle: %s", v77, 0xCu);
      swift_arrayDestroy(v78, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1LL, -1LL);
      swift_slowDealloc(v77, -1LL, -1LL);
    }

    uint64_t v15 = v111;
    swift_beginAccess(&v123, &v128, 0LL, 0LL);
    v84 = v123;
    *(void *)&__int128 v124 = v98;
    *((void *)&v124 + 1) = a2;
    v122[0] = v115;
    v122[1] = v118;
    v121[0] = v108;
    v121[1] = v109;
    v120[0] = v110;
    v120[1] = v107;
    v119 = v123;
    __n128 v85 = swift_bridgeObjectRetain(v123);
    uint64_t v86 = v104;
    v99(&v124, v122, v121, v120, &v119, v85);
    swift_bridgeObjectRelease(v84);
    swift_release(v86);
    sub_10000C550(&v130);
    swift_bridgeObjectRelease(v123);
  }

LABEL_48:
  os_unfair_lock_unlock(v15);
}

  swift_release(v24);
  return v127;
}

void sub_10000763C()
{
  lock = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16LL);
  os_unfair_lock_lock(lock);
  if (qword_100058F68 == -1) {
    goto LABEL_2;
  }
LABEL_74:
  swift_once(&qword_100058F68, sub_10001F3C8);
LABEL_2:
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v81 = sub_10000C538(v1, (uint64_t)qword_10005A7E0);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v81);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Subscribing to all topics and channels", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  swift_beginAccess(v82 + 24, v89, 0LL, 0LL);
  uint64_t v5 = *(void *)(v82 + 24);
  uint64_t v74 = v5 + 64;
  uint64_t v6 = 1LL << *(_BYTE *)(v5 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  else {
    uint64_t v7 = -1LL;
  }
  unint64_t v8 = v7 & *(void *)(v5 + 64);
  int64_t v75 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v76 = *(void *)(v82 + 24);
  swift_bridgeObjectRetain(v5);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      uint64_t v11 = (v8 - 1) & v8;
      int64_t v77 = v9;
      unint64_t v12 = v10 | (v9 << 6);
      goto LABEL_25;
    }

    int64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      goto LABEL_72;
    }
    if (v13 >= v75) {
      break;
    }
    unint64_t v14 = *(void *)(v74 + 8 * v13);
    int64_t v15 = v9 + 1;
    if (!v14)
    {
      int64_t v15 = v9 + 2;
      if (v9 + 2 >= v75) {
        break;
      }
      unint64_t v14 = *(void *)(v74 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v9 + 3;
        if (v9 + 3 >= v75) {
          break;
        }
        unint64_t v14 = *(void *)(v74 + 8 * v15);
        if (!v14)
        {
          uint64_t v16 = v9 + 4;
          if (v9 + 4 >= v75) {
            break;
          }
          unint64_t v14 = *(void *)(v74 + 8 * v16);
          if (!v14)
          {
            while (1)
            {
              int64_t v15 = v16 + 1;
              if (__OFADD__(v16, 1LL)) {
                goto LABEL_73;
              }
              if (v15 >= v75) {
                goto LABEL_69;
              }
              unint64_t v14 = *(void *)(v74 + 8 * v15);
              ++v16;
              if (v14) {
                goto LABEL_24;
              }
            }
          }

          int64_t v15 = v9 + 4;
        }
      }
    }

LABEL_24:
    uint64_t v11 = (v14 - 1) & v14;
    int64_t v77 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_25:
    id v17 = (uint64_t *)(*(void *)(v76 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v76 + 56) + 8 * v12);
    swift_bridgeObjectRetain(v18);
    uint64_t v84 = v20;
    swift_bridgeObjectRetain(v20);
    uint64_t v21 = sub_100007EF8(v82);
    swift_bridgeObjectRetain_n(v18, 2LL);
    uint64_t v22 = swift_bridgeObjectRetain_n(v21, 2LL);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    uint64_t v80 = v19;
    unint64_t v78 = v11;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc(22LL, -1LL);
      uint64_t v26 = swift_slowAlloc(64LL, -1LL);
      v88[0] = v26;
      *(_DWORD *)uint64_t v25 = 136315394;
      swift_bridgeObjectRetain(v18);
      uint64_t v87 = sub_10000B540(v19, v18, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(v18, 3LL);
      *(_WORD *)(v25 + 12) = 2080;
      __n128 v27 = swift_bridgeObjectRetain(v21);
      uint64_t v28 = Set.description.getter(v27);
      unint64_t v30 = v29;
      swift_bridgeObjectRelease(v21);
      uint64_t v87 = sub_10000B540(v28, v30, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v25 + 14, v25 + 22);
      swift_bridgeObjectRelease_n(v21, 2LL);
      swift_bridgeObjectRelease(v30);
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Currently subscribed channels for topic %s: %s",  (uint8_t *)v25,  0x16u);
      swift_arrayDestroy(v26, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v21, 2LL);
      swift_bridgeObjectRelease_n(v18, 2LL);
    }

    int64_t v31 = 0LL;
    uint64_t v32 = v84 + 56;
    uint64_t v33 = 1LL << *(_BYTE *)(v84 + 32);
    if (v33 < 64) {
      uint64_t v34 = ~(-1LL << v33);
    }
    else {
      uint64_t v34 = -1LL;
    }
    unint64_t v35 = v34 & *(void *)(v84 + 56);
    int64_t v36 = (unint64_t)(v33 + 63) >> 6;
    uint64_t v83 = v21 + 56;
    uint64_t v79 = v21;
    if (v35)
    {
      while (1)
      {
        unint64_t v67 = __clz(__rbit64(v35));
        uint64_t v40 = (v35 - 1) & v35;
        unint64_t v41 = v67 | (v31 << 6);
LABEL_48:
        unint64_t v86 = v40;
        uint64_t v42 = (uint64_t *)(*(void *)(v84 + 48) + 16 * v41);
        uint64_t v44 = *v42;
        unint64_t v43 = v42[1];
        if (!*(void *)(v21 + 16)) {
          break;
        }
        Hasher.init(_seed:)(v88, *(void *)(v21 + 40));
        swift_bridgeObjectRetain(v43);
        String.hash(into:)(v88, v44, v43);
        Swift::Int v45 = Hasher._finalize()();
        uint64_t v46 = -1LL << *(_BYTE *)(v21 + 32);
        unint64_t v47 = v45 & ~v46;
        if (((*(void *)(v83 + ((v47 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v47) & 1) != 0)
        {
          uint64_t v48 = *(void *)(v21 + 48);
          id v49 = (void *)(v48 + 16 * v47);
          uint64_t v50 = v49[1];
          BOOL v51 = *v49 == v44 && v50 == v43;
          if (!v51 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v49, v50, v44, v43, 0LL) & 1) == 0)
          {
            uint64_t v52 = ~v46;
            do
            {
              unint64_t v47 = (v47 + 1) & v52;
              if (((*(void *)(v83 + ((v47 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v47) & 1) == 0) {
                goto LABEL_64;
              }
              unint64_t v53 = (void *)(v48 + 16 * v47);
              uint64_t v54 = v53[1];
              BOOL v55 = *v53 == v44 && v54 == v43;
            }

            while (!v55 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v53, v54, v44, v43, 0LL) & 1) == 0);
          }

          swift_bridgeObjectRelease(v43);
          unint64_t v35 = v86;
          if (!v86) {
            goto LABEL_34;
          }
        }

        else
        {
LABEL_64:
          int64_t v85 = v31;
          uint64_t v56 = *(void **)(v82 + 56);
          id v57 = objc_allocWithZone(&OBJC_CLASS___PKPublicChannel);
          swift_bridgeObjectRetain(v43);
          id v58 = v56;
          NSString v59 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v43);
          id v60 = [v57 initWithChannelID:v59];

          NSString v61 = String._bridgeToObjectiveC()();
          [v58 subscribeToChannel:v60 forTopic:v61];

          swift_bridgeObjectRetain_n(v18, 2LL);
          swift_bridgeObjectRetain(v43);
          char v63 = (os_log_s *)Logger.logObject.getter(v62);
          os_log_type_t v64 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = swift_slowAlloc(22LL, -1LL);
            uint64_t v66 = swift_slowAlloc(64LL, -1LL);
            v88[0] = v66;
            *(_DWORD *)uint64_t v65 = 136315394;
            swift_bridgeObjectRetain(v43);
            *(void *)(v65 + 4) = sub_10000B540(v44, v43, v88);
            swift_bridgeObjectRelease_n(v43, 3LL);
            *(_WORD *)(v65 + 12) = 2080;
            swift_bridgeObjectRetain(v18);
            uint64_t v21 = v79;
            *(void *)(v65 + 14) = sub_10000B540(v80, v18, v88);
            swift_bridgeObjectRelease_n(v18, 3LL);
            _os_log_impl( (void *)&_mh_execute_header,  v63,  v64,  "Subscribed to channel: %s for topic: %s",  (uint8_t *)v65,  0x16u);
            swift_arrayDestroy(v66, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v66, -1LL, -1LL);
            swift_slowDealloc(v65, -1LL, -1LL);
          }

          else
          {

            swift_bridgeObjectRelease_n(v18, 2LL);
            swift_bridgeObjectRelease_n(v43, 2LL);
          }

          int64_t v31 = v85;
          unint64_t v35 = v86;
          if (!v86) {
            goto LABEL_34;
          }
        }
      }

      swift_bridgeObjectRetain(v43);
      goto LABEL_64;
    }

        unint64_t v30 = v167;
        uint64_t v26 = v168;
        if (v167) {
          goto LABEL_4;
        }
        goto LABEL_5;
      }

      v75(v69, v67);
      id v57 = v165;
    }

    uint64_t v98 = [(id)objc_opt_self(NSFileManager) defaultManager];
    v99 = String._bridgeToObjectiveC()();
    v176[0] = 0LL;
    unint64_t v100 = [v98 removeItemAtPath:v99 error:v176];

    unint64_t v101 = v176[0];
    if (v100)
    {
      v120 = v176[0];
      swift_bridgeObjectRelease(v54._object);
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      v121 = type metadata accessor for Logger(0LL);
      sub_10000C538(v121, (uint64_t)qword_10005A7E0);
      swift_bridgeObjectRetain(v37);
      v123 = (os_log_s *)Logger.logObject.getter(v122);
      __int128 v124 = static os_log_type_t.info.getter(v123);
      if (os_log_type_enabled(v123, v124))
      {
        __int128 v125 = swift_slowAlloc(12LL, -1LL);
        __int128 v126 = (void *)swift_slowAlloc(32LL, -1LL);
        v176[0] = v126;
        *(_DWORD *)__int128 v125 = v146.n128_u32[0];
        swift_bridgeObjectRetain(v49);
        *(void *)(v125 + 4) = sub_10000B540(v166, v49, (uint64_t *)v176);
        swift_bridgeObjectRelease_n(v49, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v123,  v124,  "Removed expired task definition: %s",  (uint8_t *)v125,  0xCu);
        swift_arrayDestroy(v126, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v126, -1LL, -1LL);
        swift_slowDealloc(v125, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v49, 2LL);
      }

      __int128 v128 = v164;
      uint64_t v129 = TaskDefinition.name.getter(v127);
      uint64_t v131 = v130;
      if ((swift_isUniquelyReferenced_nonNull_native(v138) & 1) == 0) {
        v138 = sub_10001A000(0LL, v138[2] + 1LL, 1, v138);
      }
      v133 = v138[2];
      v132 = v138[3];
      if (v133 >= v132 >> 1) {
        v138 = sub_10001A000((void *)(v132 > 1), v133 + 1, 1, v138);
      }
      v134 = v138;
      v138[2] = v133 + 1;
      v135 = &v134[2 * v133];
      v135[4] = v129;
      v135[5] = v131;
      (*(void (**)(void))(v128 + 8))();
      goto LABEL_24;
    }

    uint64_t v102 = v176[0];
    swift_bridgeObjectRelease(v37);
    v103 = (void *)_convertNSErrorToError(_:)(v101);

    swift_willThrow(v104);
    v176[0] = v103;
    uint64_t v105 = sub_10000B4F4(&qword_1000595D0);
    id v106 = sub_10000C654(0LL, &qword_1000595D8, &OBJC_CLASS___NSError_ptr);
    swift_dynamicCast(&v173, v176, v105, v106, 0LL);
    uint64_t v107 = (void *)v173;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v108 = type metadata accessor for Logger(0LL);
    sub_10000C538(v108, (uint64_t)qword_10005A7E0);
    uint64_t v109 = v107;
    swift_bridgeObjectRetain(v54._object);
    v111 = (os_log_s *)Logger.logObject.getter(v110);
    uint64_t v112 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = swift_slowAlloc(22LL, -1LL);
      uint64_t v114 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v115 = swift_slowAlloc(32LL, -1LL);
      v175 = v115;
      *(_DWORD *)uint64_t v113 = v141.n128_u32[0];
      swift_bridgeObjectRetain(v54._object);
      v172 = sub_10000B540(v54._countAndFlagsBits, (unint64_t)v54._object, &v175);
      uint64_t v116 = v140;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v140, v113 + 4, v113 + 12);
      swift_bridgeObjectRelease_n(v54._object, 3LL);
      *(_WORD *)(v113 + 12) = 2112;
      v172 = (uint64_t)v109;
      uint64_t v117 = v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v116, v113 + 14, v113 + 22);
      *uint64_t v114 = v109;

      _os_log_impl( (void *)&_mh_execute_header,  v111,  v112,  "Failed at removing task definition: %s %@",  (uint8_t *)v113,  0x16u);
      v118 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v114, 1LL, v118);
      swift_slowDealloc(v114, -1LL, -1LL);
      swift_arrayDestroy(v115, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v115, -1LL, -1LL);
      swift_slowDealloc(v113, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v164 + 8))(v163, v165);
    }

    else
    {
      swift_bridgeObjectRelease_n(v54._object, 2LL);

      (*(void (**)(char *, uint64_t))(v164 + 8))(v163, v57);
    }

    unint64_t v30 = v167;
    uint64_t v26 = v168;
    swift_errorRelease(v176[0]);
    v147 = 0LL;
    if (v30) {
      goto LABEL_4;
    }
LABEL_5:
    uint64_t v32 = __OFADD__(v26, 1LL);
    uint64_t v33 = v26 + 1;
    if (v32)
    {
      __break(1u);
      goto LABEL_57;
    }

    if (v33 >= v153) {
      goto LABEL_55;
    }
    uint64_t v34 = *(void *)&v152[8 * v33];
    if (!v34) {
      break;
    }
LABEL_15:
    v167 = (v34 - 1) & v34;
    v168 = v33;
  }

  unint64_t v35 = v33 + 1;
  if (v33 + 1 >= v153) {
    goto LABEL_55;
  }
  uint64_t v34 = *(void *)&v152[8 * v35];
  if (v34) {
    goto LABEL_14;
  }
  unint64_t v35 = v33 + 2;
  if (v33 + 2 >= v153) {
    goto LABEL_55;
  }
  uint64_t v34 = *(void *)&v152[8 * v35];
  if (v34)
  {
LABEL_14:
    uint64_t v33 = v35;
    goto LABEL_15;
  }

  unint64_t v35 = v33 + 3;
  if (v33 + 3 < v153)
  {
    uint64_t v34 = *(void *)&v152[8 * v35];
    if (!v34)
    {
      while (1)
      {
        uint64_t v33 = v35 + 1;
        if (__OFADD__(v35, 1LL)) {
          break;
        }
        if (v33 >= v153) {
          goto LABEL_55;
        }
        uint64_t v34 = *(void *)&v152[8 * v33];
        ++v35;
        if (v34) {
          goto LABEL_15;
        }
      }

      int64_t v15 = (v23 - 1) & v23;
      uint64_t v50 = v24;
      uint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }

    uint64_t v26 = a4[7];
    __n128 v27 = (uint64_t *)(a4[6] + 16 * v21);
    uint64_t v28 = *v27;
    unint64_t v29 = v27[1];
    unint64_t v30 = v49;
    int64_t v31 = *(void *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    Hasher.init(_seed:)(v52, *(void *)(v14 + 40));
    swift_bridgeObjectRetain(v29);
    String.hash(into:)(v52, v28, v29);
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1LL << *(_BYTE *)(v14 + 32);
    uint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1LL << v34) & ~*(void *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      int64_t v36 = __clz(__rbit64((-1LL << v34) & ~*(void *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0LL;
      unint64_t v18 = v47;
    }

    else
    {
      int64_t v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v33) >> 6;
      unint64_t v18 = v47;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        int64_t v39 = v35 == v38;
        if (v35 == v38) {
          unint64_t v35 = 0LL;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v17 + 8 * v35);
      }

      while (v40 == -1);
      int64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }

    *(void *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v36;
    unint64_t v41 = (void *)(*(void *)(v14 + 48) + 16 * v36);
    void *v41 = v28;
    v41[1] = v29;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)( *(void *)(v14 + 56) + v36 * v31,  v51,  v18);
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1LL)) {
      break;
    }
    a4 = v46;
    uint64_t v16 = v50;
    if (!a3) {
      return v14;
    }
  }

        uint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      os_log_type_t v24 = *v22;
      uint64_t v23 = v22[1];
      uint64_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_10000C6CC(v25, v38);
      }

      else
      {
        sub_10000C570((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      __n128 v27 = result & ~v26;
      uint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        int64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        unint64_t v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          int64_t v31 = v28 == v30;
          if (v28 == v30) {
            uint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        int64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      uint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *uint64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_10000C6CC(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *os_log_type_t v3 = v8;
  return result;
}

LABEL_34:
    int64_t v37 = v31 + 1;
    if (__OFADD__(v31, 1LL))
    {
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }

    if (v37 < v36)
    {
      unint64_t v38 = *(void *)(v32 + 8 * v37);
      ++v31;
      if (v38) {
        goto LABEL_47;
      }
      int64_t v31 = v37 + 1;
      if (v37 + 1 < v36)
      {
        unint64_t v38 = *(void *)(v32 + 8 * v31);
        if (v38) {
          goto LABEL_47;
        }
        int64_t v31 = v37 + 2;
        if (v37 + 2 < v36)
        {
          unint64_t v38 = *(void *)(v32 + 8 * v31);
          if (v38) {
            goto LABEL_47;
          }
          int64_t v39 = v37 + 3;
          if (v39 < v36)
          {
            unint64_t v38 = *(void *)(v32 + 8 * v39);
            if (v38)
            {
              int64_t v31 = v39;
LABEL_47:
              uint64_t v40 = (v38 - 1) & v38;
              unint64_t v41 = __clz(__rbit64(v38)) + (v31 << 6);
              goto LABEL_48;
            }

            while (1)
            {
              int64_t v31 = v39 + 1;
              if (__OFADD__(v39, 1LL)) {
                goto LABEL_71;
              }
              if (v31 >= v36) {
                break;
              }
              unint64_t v38 = *(void *)(v32 + 8 * v31);
              ++v39;
              if (v38) {
                goto LABEL_47;
              }
            }
          }
        }
      }
    }

    swift_bridgeObjectRelease(v18);
    swift_release(v84);
    int64_t v9 = v77;
    unint64_t v8 = v78;
    swift_bridgeObjectRelease(v21);
  }

  __break(1u);
  return result;
}

LABEL_69:
  swift_release(v76);
  uint64_t v68 = *(void *)(v82 + 24);
  id v69 = *(id *)(v82 + 56);
  __n128 v70 = swift_bridgeObjectRetain(v68);
  uint64_t v71 = sub_10002EA78(v70);
  swift_bridgeObjectRelease(v68);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v71);
  [v69 _setEnabledTopics:isa];

  os_unfair_lock_unlock(lock);
}

uint64_t sub_100007EF8(uint64_t a1)
{
  id v1 = *(id *)(a1 + 56);
  NSString v2 = String._bridgeToObjectiveC()();
  id v14 = 0LL;
  id v3 = [v1 registeredChannelsForTopic:v2 error:&v14];

  id v4 = v14;
  if (v3)
  {
    uint64_t v5 = sub_10000C654(0LL, &qword_100059288, &OBJC_CLASS___PKPublicChannel_ptr);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v5);
    id v7 = v4;

    unint64_t v8 = sub_10000803C(v6);
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    id v9 = v14;
    uint64_t v10 = _convertNSErrorToError(_:)(v4);

    swift_willThrow(v11);
    swift_errorRelease(v10);
    unint64_t v8 = _swiftEmptyArrayStorage;
  }

  uint64_t v12 = sub_10002EF58((uint64_t)v8);
  swift_bridgeObjectRelease(v8);
  return v12;
}

void *sub_10000803C(uint64_t a1)
{
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v16))
  {
    id v3 = _swiftEmptyArrayStorage;
    uint64_t v4 = 4LL;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1)
         : *(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1LL)) {
        break;
      }
      id v8 = [v5 channelID];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0) {
          id v3 = sub_10001A000(0LL, v3[2] + 1LL, 1, v3);
        }
        unint64_t v14 = v3[2];
        unint64_t v13 = v3[3];
        if (v14 >= v13 >> 1) {
          id v3 = sub_10001A000((void *)(v13 > 1), v14 + 1, 1, v3);
        }
        v3[2] = v14 + 1;
        int64_t v15 = &v3[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }

      else
      {
      }

      ++v4;
      if (v7 == v2) {
        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_17:
    if (a1 < 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

  id v3 = _swiftEmptyArrayStorage;
LABEL_22:
  swift_bridgeObjectRelease(a1);
  return v3;
}

void sub_1000081D0()
{
  id v1 = (id *)v0;
  unint64_t v2 = *(void *)(v0 + 16) + 16LL;
  os_unfair_lock_lock((os_unfair_lock_t)v2);
  if (qword_100058F68 != -1) {
    goto LABEL_43;
  }
  while (1)
  {
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_10000C538(v3, (uint64_t)qword_10005A7E0);
    id v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unsubscribing all topics and channels", v7, 2u);
      swift_slowDealloc(v7, -1LL, -1LL);
    }

    id v8 = sub_1000089C8((uint64_t)v1);
    uint64_t v9 = swift_bridgeObjectRetain_n(v8, 2LL);
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.info.getter();
    unint64_t v67 = v1;
    uint64_t v68 = v8;
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      unint64_t v13 = (id *)swift_slowAlloc(32LL, -1LL);
      uint64_t v79 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_bridgeObjectRetain(v68);
      uint64_t v14 = Array.description.getter(v68, &type metadata for String);
      unint64_t v16 = v15;
      swift_bridgeObjectRelease(v68);
      uint64_t v77 = sub_10000B540(v14, v16, (uint64_t *)&v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease_n(v68, 2LL);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "unregistering channels from topics: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
      id v17 = v13;
      id v8 = v68;
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v8, 2LL);
    }

    uint64_t v74 = (os_unfair_lock_s *)v8[2];
    if (!v74) {
      break;
    }
    uint64_t v66 = (os_unfair_lock_s *)v2;
    unint64_t v2 = 0LL;
    uint64_t v73 = v8 + 4;
    while (v2 < v8[2])
    {
      uint64_t v21 = &v73[2 * v2];
      uint64_t v22 = *v21;
      unint64_t v23 = v21[1];
      id v24 = v1[7];
      swift_bridgeObjectRetain(v23);
      id v25 = v24;
      uint64_t v76 = v22;
      NSString v26 = String._bridgeToObjectiveC()();
      uint64_t v79 = 0LL;
      id v27 = [v25 registeredChannelsForTopic:v26 error:&v79];

      uint64_t v28 = v79;
      if (v27)
      {
        uint64_t v29 = sub_10000C654(0LL, &qword_100059288, &OBJC_CLASS___PKPublicChannel_ptr);
        int64_t v75 = v27;
        unint64_t v30 = v23;
        uint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v29);
        swift_bridgeObjectRetain_n(v30, 2LL);
        uint64_t v32 = v28;
        swift_bridgeObjectRetain(v31);
        uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
        os_log_type_t v72 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v34, v72))
        {
          unint64_t v71 = v30;
          uint64_t v35 = swift_slowAlloc(22LL, -1LL);
          id v1 = (id *)swift_slowAlloc(64LL, -1LL);
          uint64_t v79 = v1;
          *(_DWORD *)uint64_t v35 = 136315394;
          if ((unint64_t)v31 >> 62)
          {
            BOOL v55 = v34;
            if (v31 < 0) {
              uint64_t v56 = v31;
            }
            else {
              uint64_t v56 = v31 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain(v31);
            uint64_t v57 = v56;
            uint64_t v34 = v55;
            uint64_t v36 = _CocoaArrayWrapper.endIndex.getter(v57);
          }

          else
          {
            uint64_t v36 = *(void *)((v31 & 0xFFFFFFFFFFFFF8LL) + 0x10);
            swift_bridgeObjectRetain(v31);
          }

          log = v34;
          id v69 = v1;
          if (v36)
          {
            if (v36 < 1) {
              goto LABEL_42;
            }
            uint64_t v37 = 0LL;
            unint64_t v38 = _swiftEmptyArrayStorage;
            do
            {
              if ((v31 & 0xC000000000000001LL) != 0) {
                id v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v37, v31);
              }
              else {
                id v39 = *(id *)(v31 + 8 * v37 + 32);
              }
              id v40 = v39;
              id v41 = [v40 channelID];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
                uint64_t v45 = v44;

                if ((swift_isUniquelyReferenced_nonNull_native(v38) & 1) == 0) {
                  unint64_t v38 = sub_10001A000(0LL, v38[2] + 1LL, 1, v38);
                }
                unint64_t v47 = v38[2];
                unint64_t v46 = v38[3];
                if (v47 >= v46 >> 1) {
                  unint64_t v38 = sub_10001A000((void *)(v46 > 1), v47 + 1, 1, v38);
                }
                v38[2] = v47 + 1;
                uint64_t v48 = &v38[2 * v47];
                v48[4] = v43;
                v48[5] = v45;
              }

              else
              {
              }

              ++v37;
            }

            while (v36 != v37);
          }

          else
          {
            unint64_t v38 = _swiftEmptyArrayStorage;
          }

          swift_bridgeObjectRelease(v31);
          uint64_t v50 = Array.description.getter(v38, &type metadata for String);
          unint64_t v52 = v51;
          swift_bridgeObjectRelease(v38);
          *(void *)(v35 + 4) = sub_10000B540(v50, v52, (uint64_t *)&v79);
          swift_bridgeObjectRelease_n(v31, 2LL);
          swift_bridgeObjectRelease(v52);
          *(_WORD *)(v35 + 12) = 2080;
          unint64_t v49 = v71;
          swift_bridgeObjectRetain(v71);
          *(void *)(v35 + 14) = sub_10000B540(v76, v71, (uint64_t *)&v79);
          swift_bridgeObjectRelease_n(v71, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  log,  v72,  "Unsubscribed channels: %s for topic: %s",  (uint8_t *)v35,  0x16u);
          swift_arrayDestroy(v69, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v69, -1LL, -1LL);
          swift_slowDealloc(v35, -1LL, -1LL);

          id v1 = v67;
          id v8 = v68;
        }

        else
        {

          swift_bridgeObjectRelease_n(v30, 2LL);
          swift_bridgeObjectRelease_n(v31, 2LL);
          unint64_t v49 = v30;
        }

        id v53 = v1[7];
        NSString v54 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v49);
        [v53 unsubscribeFromChannels:v75 forTopic:v54];
      }

      else
      {
        unint64_t v18 = v79;
        swift_bridgeObjectRelease(v23);
        uint64_t v19 = _convertNSErrorToError(_:)(v28);

        swift_willThrow(v20);
        swift_errorRelease(v19);
      }

      if ((os_unfair_lock_s *)++v2 == v74)
      {
        swift_bridgeObjectRelease(v8);
        unint64_t v2 = (unint64_t)v66;
        goto LABEL_40;
      }
    }

    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    swift_once(&qword_100058F68, sub_10001F3C8);
  }

  swift_bridgeObjectRelease(v8);
LABEL_40:
  id v58 = v1[7];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v58 _setEnabledTopics:isa];

  id v60 = v1[7];
  Class v61 = Array._bridgeToObjectiveC()().super.isa;
  [v60 _setOpportunisticTopics:v61];

  id v62 = v1[7];
  Class v63 = Array._bridgeToObjectiveC()().super.isa;
  [v62 _setIgnoredTopics:v63];

  id v64 = v1[7];
  Class v65 = Array._bridgeToObjectiveC()().super.isa;
  [v64 _setNonWakingTopics:v65];

  os_unfair_lock_unlock((os_unfair_lock_t)v2);
}

void *sub_1000089C8(uint64_t a1)
{
  uint64_t v36 = &_swiftEmptySetSingleton;
  id v2 = [*(id *)(a1 + 56) enabledTopics];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);

    uint64_t v5 = v4[2];
    if (!v5) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v4 = _swiftEmptyArrayStorage;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    if (!v5) {
      goto LABEL_7;
    }
  }

  os_log_type_t v6 = v4 + 5;
  do
  {
    uint64_t v7 = *(v6 - 1);
    uint64_t v8 = *v6;
    swift_bridgeObjectRetain(*v6);
    sub_10002C02C(&v34, v7, v8);
    swift_bridgeObjectRelease(v35);
    v6 += 2;
    --v5;
  }

  while (v5);
LABEL_7:
  swift_bridgeObjectRelease(v4);
  id v9 = [*(id *)(a1 + 56) opportunisticTopics];
  if (v9)
  {
    uint64_t v10 = v9;
    os_log_type_t v11 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, &type metadata for String);

    uint64_t v12 = v11[2];
    if (!v12) {
      goto LABEL_13;
    }
  }

  else
  {
    os_log_type_t v11 = _swiftEmptyArrayStorage;
    uint64_t v12 = _swiftEmptyArrayStorage[2];
    if (!v12) {
      goto LABEL_13;
    }
  }

  unint64_t v13 = v11 + 5;
  do
  {
    uint64_t v14 = *(v13 - 1);
    uint64_t v15 = *v13;
    swift_bridgeObjectRetain(*v13);
    sub_10002C02C(&v34, v14, v15);
    swift_bridgeObjectRelease(v35);
    v13 += 2;
    --v12;
  }

  while (v12);
LABEL_13:
  swift_bridgeObjectRelease(v11);
  id v16 = [*(id *)(a1 + 56) ignoredTopics];
  if (v16)
  {
    id v17 = v16;
    unint64_t v18 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, &type metadata for String);

    uint64_t v19 = v18[2];
    if (!v19) {
      goto LABEL_19;
    }
  }

  else
  {
    unint64_t v18 = _swiftEmptyArrayStorage;
    uint64_t v19 = _swiftEmptyArrayStorage[2];
    if (!v19) {
      goto LABEL_19;
    }
  }

  uint64_t v20 = v18 + 5;
  do
  {
    uint64_t v21 = *(v20 - 1);
    uint64_t v22 = *v20;
    swift_bridgeObjectRetain(*v20);
    sub_10002C02C(&v34, v21, v22);
    swift_bridgeObjectRelease(v35);
    v20 += 2;
    --v19;
  }

  while (v19);
LABEL_19:
  swift_bridgeObjectRelease(v18);
  id v23 = [*(id *)(a1 + 56) nonWakingTopics];
  if (v23)
  {
    id v24 = v23;
    id v25 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, &type metadata for String);

    uint64_t v26 = v25[2];
    if (!v26) {
      goto LABEL_25;
    }
  }

  else
  {
    id v25 = _swiftEmptyArrayStorage;
    uint64_t v26 = _swiftEmptyArrayStorage[2];
    if (!v26) {
      goto LABEL_25;
    }
  }

  id v27 = v25 + 5;
  do
  {
    uint64_t v28 = *(v27 - 1);
    uint64_t v29 = *v27;
    swift_bridgeObjectRetain(*v27);
    sub_10002C02C(&v34, v28, v29);
    swift_bridgeObjectRelease(v35);
    v27 += 2;
    --v26;
  }

  while (v26);
LABEL_25:
  swift_bridgeObjectRelease(v25);
  swift_beginAccess(a1 + 24, &v34, 0LL, 0LL);
  swift_bridgeObjectRetain(*(void *)(a1 + 24));
  sub_100008C90(v30);
  uint64_t v31 = v36;
  uint64_t v32 = sub_10002E994((uint64_t)v36);
  swift_bridgeObjectRelease(v31);
  return v32;
}

uint64_t sub_100008C90(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0LL;
  uint64_t v3 = result + 64;
  uint64_t v4 = 1LL << *(_BYTE *)(result + 32);
  uint64_t v5 = -1LL;
  if (v4 < 64) {
    uint64_t v5 = ~(-1LL << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }

    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v13 >= v7) {
      return swift_release(v1);
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        return swift_release(v1);
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          return swift_release(v1);
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            return swift_release(v1);
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }

LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    swift_bridgeObjectRetain(v12);
    sub_10002C02C(v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease(v16[1]);
  }

  int64_t v15 = v13 + 4;
  if (v15 >= v7) {
    return swift_release(v1);
  }
  unint64_t v14 = *(void *)(v3 + 8 * v15);
  if (v14)
  {
    int64_t v2 = v15;
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v2 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v2 >= v7) {
      return swift_release(v1);
    }
    unint64_t v14 = *(void *)(v3 + 8 * v2);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }

  id v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  id v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  void *v24 = v8;
  v24[1] = a2;
  id v25 = *(void *)(v23 + 16);
  uint64_t v26 = __OFADD__(v25, 1LL);
  id v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

LABEL_25:
  __break(1u);
  return result;
}

    __break(1u);
LABEL_26:
    uint64_t result = swift_bridgeObjectRelease(v9);
LABEL_27:
    uint64_t v26 = a1[3];
    if (v26 < 2) {
      return (uint64_t)a1;
    }
    id v27 = v26 >> 1;
    id v25 = __OFSUB__(v27, v1);
    uint64_t v28 = v27 - v1;
    if (!v25)
    {
      a1[2] = v28;
      return (uint64_t)a1;
    }

    goto LABEL_33;
  }

    id v17 = (v29 - 1) & v29;
    uint64_t v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    uint64_t v21 = 16 * v20;
    uint64_t v22 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v20);
    id v24 = *v22;
    id v23 = v22[1];
    id v25 = *(void *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 56) + v25, v18);
    uint64_t v26 = v38;
    id v27 = (void *)(*(void *)(v38 + 48) + v21);
    uint64_t *v27 = v24;
    v27[1] = v23;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v26 + 56) + v25, v6, v18);
    uint64_t result = (void *)swift_bridgeObjectRetain(v23);
  }

  uint64_t v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v7);
    uint64_t v31 = v34;
    uint64_t v32 = v38;
    goto LABEL_28;
  }

  uint64_t v29 = *(void *)(v35 + 8 * v30);
  if (v29)
  {
    unint64_t v14 = v30;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v14 = v30 + 1;
    if (__OFADD__(v30, 1LL)) {
      break;
    }
    if (v14 >= v36) {
      goto LABEL_26;
    }
    uint64_t v29 = *(void *)(v35 + 8 * v14);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }

    uint64_t v12 = (v22 - 1) & v22;
    int64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    id v16 = 16 * v15;
    id v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    id v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    uint64_t *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain(v18);
    uint64_t result = (void *)swift_retain(*((void *)&v24 + 1));
  }

  id v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  uint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    unint64_t v9 = v23;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }

    uint64_t v12 = (v23 - 1) & v23;
    int64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    id v16 = 16 * v15;
    id v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10000C570(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    uint64_t *v21 = v19;
    v21[1] = v18;
    sub_10000C6CC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    swift_bridgeObjectRetain(v18);
  }

  id v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    swift_release(v2);
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  id v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    unint64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    id v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    int64_t v13 = (v24 - 1) & v24;
    id v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    id v17 = 16 * v16;
    unint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v21);
  }

  id v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  id v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    uint64_t v10 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    id v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

    uint64_t v35 = type metadata accessor for ResetTasksRequest(0LL);
    uint64_t v36 = sub_100005038( &qword_100059898,  (uint64_t (*)(uint64_t))&type metadata accessor for ResetTasksRequest,  (uint64_t)&protocol conformance descriptor for ResetTasksRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v35, sub_10003EE08, a2, v35, v36);
    swift_release(a2);
    uint64_t v37 = type metadata accessor for CleanTasksRequest(0LL);
    unint64_t v38 = sub_100005038( &qword_1000598A0,  (uint64_t (*)(uint64_t))&type metadata accessor for CleanTasksRequest,  (uint64_t)&protocol conformance descriptor for CleanTasksRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v37, sub_10003EE20, a2, v37, v38);
    swift_release(a2);
    if ((v9 & 1) == 0)
    {
LABEL_16:
      if ((v9 & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_27;
    }

uint64_t sub_100008DFC()
{
  uint64_t v1 = *v0;
  int64_t v2 = (os_unfair_lock_s *)(v0[2] + 16);
  os_unfair_lock_lock(v2);
  v18[0] = 0LL;
  v18[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(42LL);
  uint64_t v3 = _typeName(_:qualified:)(v1, 0LL);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v19 = v3;
  uint64_t v20 = v5;
  v6._object = (void *)0x8000000100049D90LL;
  v6._countAndFlagsBits = 0xD000000000000011LL;
  String.append(_:)(v6);
  uint64_t v7 = v0[5];
  unint64_t v8 = (void *)v0[6];
  swift_bridgeObjectRetain(v8);
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  v10._countAndFlagsBits = 0xD000000000000013LL;
  v10._object = (void *)0x8000000100049DB0LL;
  String.append(_:)(v10);
  swift_beginAccess(v0 + 3, v18, 0LL, 0LL);
  uint64_t v11 = v0[3];
  swift_bridgeObjectRetain(v11);
  uint64_t v12 = sub_10000B4F4(&qword_100059238);
  v14._countAndFlagsBits = Dictionary.description.getter( v11,  &type metadata for String,  v12,  &protocol witness table for String,  v13);
  object = v14._object;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(object);
  uint64_t v16 = v19;
  os_unfair_lock_unlock(v2);
  return v16;
}

uint64_t sub_100008F5C()
{
  lock = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16LL);
  os_unfair_lock_lock(lock);
  uint64_t v1 = (void *)sub_10001E9D8((uint64_t)_swiftEmptyArrayStorage);
  swift_beginAccess(v0 + 24, v44, 0LL, 0LL);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v38 = v2 + 64;
  uint64_t v3 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v4 = -1LL;
  if (v3 < 64) {
    uint64_t v4 = ~(-1LL << v3);
  }
  unint64_t v5 = v4 & *(void *)(v2 + 64);
  int64_t v39 = (unint64_t)(v3 + 63) >> 6;
  uint64_t v40 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain(v2);
  int64_t v6 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v9 = v8 | (v6 << 6);
    }

    else
    {
      int64_t v10 = v6 + 1;
      if (__OFADD__(v6, 1LL)) {
        goto LABEL_43;
      }
      if (v10 >= v39)
      {
LABEL_39:
        swift_release(v40);
        os_unfair_lock_unlock(lock);
        return (uint64_t)v1;
      }

      unint64_t v11 = *(void *)(v38 + 8 * v10);
      ++v6;
      if (!v11)
      {
        int64_t v6 = v10 + 1;
        if (v10 + 1 >= v39) {
          goto LABEL_39;
        }
        unint64_t v11 = *(void *)(v38 + 8 * v6);
        if (!v11)
        {
          int64_t v6 = v10 + 2;
          if (v10 + 2 >= v39) {
            goto LABEL_39;
          }
          unint64_t v11 = *(void *)(v38 + 8 * v6);
          if (!v11)
          {
            int64_t v12 = v10 + 3;
            if (v12 >= v39) {
              goto LABEL_39;
            }
            unint64_t v11 = *(void *)(v38 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                int64_t v6 = v12 + 1;
                if (__OFADD__(v12, 1LL)) {
                  goto LABEL_44;
                }
                if (v6 >= v39) {
                  goto LABEL_39;
                }
                unint64_t v11 = *(void *)(v38 + 8 * v6);
                ++v12;
                if (v11) {
                  goto LABEL_21;
                }
              }
            }

            int64_t v6 = v12;
          }
        }
      }

LABEL_21:
      unint64_t v5 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v6 << 6);
    }

    __n128 v13 = (uint64_t *)(*(void *)(v40 + 48) + 16 * v9);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(v40 + 56) + 8 * v9);
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      uint64_t v41 = *v13;
      uint64_t v18 = sub_10000B4F4(&qword_100059290);
      uint64_t v19 = (void *)swift_allocObject(v18, 16 * v17 + 32, 7LL);
      int64_t v20 = j__malloc_size(v19);
      uint64_t v21 = v20 - 32;
      if (v20 < 32) {
        uint64_t v21 = v20 - 17;
      }
      v19[2] = v17;
      v19[3] = 2 * (v21 >> 4);
      uint64_t v42 = sub_10002EB60((uint64_t)&v43, v19 + 4, v17, v16);
      uint64_t v22 = (uint64_t)v43;
      swift_bridgeObjectRetain_n(v16, 2LL);
      swift_bridgeObjectRetain(v14);
      sub_10000C608(v22);
      if (v42 != v17) {
        goto LABEL_41;
      }
      swift_bridgeObjectRelease(v16);
      uint64_t v15 = v41;
    }

    else
    {
      swift_bridgeObjectRetain(v13[1]);
      uint64_t v19 = _swiftEmptyArrayStorage;
    }

    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v1);
    uint64_t v43 = v1;
    unint64_t v25 = sub_10002BC00(v15, v14);
    uint64_t v26 = v1[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (v1[3] >= v28)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v1 = v43;
        if ((v24 & 1) != 0) {
          goto LABEL_4;
        }
      }

      else
      {
        sub_10001AFA4();
        uint64_t v1 = v43;
        if ((v29 & 1) != 0) {
          goto LABEL_4;
        }
      }
    }

    else
    {
      sub_10002CDFC(v28, isUniquelyReferenced_nonNull_native);
      unint64_t v30 = sub_10002BC00(v15, v14);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_45;
      }
      unint64_t v25 = v30;
      uint64_t v1 = v43;
      if ((v29 & 1) != 0)
      {
LABEL_4:
        uint64_t v7 = v1[7];
        swift_bridgeObjectRelease(*(void *)(v7 + 8 * v25));
        *(void *)(v7 + 8 * v25) = v19;
        goto LABEL_5;
      }
    }

    v1[(v25 >> 6) + 8] |= 1LL << v25;
    uint64_t v32 = (uint64_t *)(v1[6] + 16 * v25);
    *uint64_t v32 = v15;
    v32[1] = v14;
    *(void *)(v1[7] + 8 * v25) = v19;
    uint64_t v33 = v1[2];
    BOOL v34 = __OFADD__(v33, 1LL);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_42;
    }
    v1[2] = v35;
    swift_bridgeObjectRetain(v14);
LABEL_5:
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

    id v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    char v24 = *v23;
    unint64_t v25 = (-1LL << v3) - 1;
  }

  else
  {
    id v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    unint64_t v25 = *v23;
    char v24 = (-1LL << result) - 1;
  }

  *id v23 = v25 & v24;
  uint64_t v26 = *(void *)(a2 + 16);
  BOOL v27 = __OFSUB__(v26, 1LL);
  uint64_t v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

    uint64_t v4 = (v16 - 1) & v16;
    unint64_t v8 = __clz(__rbit64(v16)) + (v6 << 6);
LABEL_6:
    unint64_t v9 = (uint64_t *)(v0[6] + 16 * v8);
    int64_t v10 = *v9;
    unint64_t v11 = v9[1];
    int64_t v12 = *(void *)(v0[7] + 8 * v8);
    __n128 v13 = swift_bridgeObjectRetain(v11);
    uint64_t v14 = dispatch thunk of XPCIncomingConnection.valueBool(forEntitlement:)(v10, v11, v13);
    swift_bridgeObjectRelease(v11);
    if (v14 == 2)
    {
      if (v4) {
        goto LABEL_5;
      }
    }

    else
    {
      if ((v12 & ~v21) == 0 || (v14 & 1) == 0) {
        uint64_t v19 = 0LL;
      }
      else {
        uint64_t v19 = v12;
      }
      v21 |= v19;
      if (v4) {
        goto LABEL_5;
      }
    }
  }

  uint64_t v17 = v15 + 3;
  if (v17 < v5)
  {
    uint64_t v16 = *(void *)&v1[8 * v17];
    if (!v16)
    {
      while (1)
      {
        int64_t v6 = v17 + 1;
        if (__OFADD__(v17, 1LL)) {
          goto LABEL_32;
        }
        if (v6 >= v5) {
          goto LABEL_30;
        }
        uint64_t v16 = *(void *)&v1[8 * v6];
        ++v17;
        if (v16) {
          goto LABEL_21;
        }
      }
    }

    int64_t v6 = v17;
    goto LABEL_21;
  }

uint64_t sub_100009324()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16LL);
  os_unfair_lock_lock(v1);
  uint64_t v61 = v0;
  uint64_t v2 = sub_100009958(v0);
  Class v63 = (void *)sub_10001E9D8((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v60 = v2[2];
  if (v60)
  {
    os_unfair_lock_t lock = v1;
    unint64_t v3 = 0LL;
    NSString v59 = v2 + 4;
    id v58 = v2;
    while (1)
    {
      if (v3 >= v2[2])
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
      }

      unint64_t v5 = &v59[2 * v3];
      uint64_t v7 = *v5;
      unint64_t v6 = v5[1];
      unint64_t v8 = *(void **)(v61 + 56);
      swift_bridgeObjectRetain(v6);
      id v9 = v8;
      NSString v10 = String._bridgeToObjectiveC()();
      id v65 = 0LL;
      id v11 = [v9 registeredChannelsForTopic:v10 error:&v65];

      id v12 = v65;
      uint64_t v64 = v7;
      if (!v11)
      {
        id v29 = v65;
        uint64_t v30 = _convertNSErrorToError(_:)(v12);

        swift_willThrow(v31);
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v32 = type metadata accessor for Logger(0LL);
        sub_10000C538(v32, (uint64_t)qword_10005A7E0);
        swift_errorRetain(v30);
        swift_bridgeObjectRetain(v6);
        uint64_t v33 = swift_errorRetain(v30);
        BOOL v34 = (os_log_s *)Logger.logObject.getter(v33);
        os_log_type_t v35 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = swift_slowAlloc(22LL, -1LL);
          uint64_t v37 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
          uint64_t v38 = (void *)swift_slowAlloc(32LL, -1LL);
          id v65 = v38;
          *(_DWORD *)uint64_t v36 = 136315394;
          swift_bridgeObjectRetain(v6);
          *(void *)(v36 + 4) = sub_10000B540(v64, v6, (uint64_t *)&v65);
          swift_bridgeObjectRelease_n(v6, 3LL);
          *(_WORD *)(v36 + 12) = 2112;
          swift_errorRetain(v30);
          uint64_t v39 = _swift_stdlib_bridgeErrorToNSError(v30);
          *(void *)(v36 + 14) = v39;
          *uint64_t v37 = v39;
          swift_errorRelease(v30);
          swift_errorRelease(v30);
          _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Failed at fetching registered channels for topic: %s - %@",  (uint8_t *)v36,  0x16u);
          uint64_t v40 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v37, 1LL, v40);
          swift_slowDealloc(v37, -1LL, -1LL);
          swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
          uint64_t v2 = v58;
          swift_slowDealloc(v38, -1LL, -1LL);
          swift_slowDealloc(v36, -1LL, -1LL);

          swift_errorRelease(v30);
        }

        else
        {
          swift_errorRelease(v30);
          swift_bridgeObjectRelease_n(v6, 2LL);
          swift_errorRelease(v30);
          swift_errorRelease(v30);
        }

        goto LABEL_5;
      }

      uint64_t v62 = v6;
      uint64_t v13 = sub_10000C654(0LL, &qword_100059288, &OBJC_CLASS___PKPublicChannel_ptr);
      uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v13);
      id v15 = v12;

      if ((unint64_t)v14 >> 62)
      {
        if (v14 < 0) {
          uint64_t v41 = v14;
        }
        else {
          uint64_t v41 = v14 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v14);
        uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v41);
        if (v16)
        {
LABEL_10:
          if (v16 < 1) {
            goto LABEL_47;
          }
          uint64_t v17 = 0LL;
          uint64_t v18 = _swiftEmptyArrayStorage;
          do
          {
            if ((v14 & 0xC000000000000001LL) != 0) {
              id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, v14);
            }
            else {
              id v19 = *(id *)(v14 + 8 * v17 + 32);
            }
            id v20 = v19;
            id v21 = [v20 channelID];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
              uint64_t v25 = v24;

              if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0) {
                uint64_t v18 = sub_10001A000(0LL, v18[2] + 1LL, 1, v18);
              }
              unint64_t v27 = v18[2];
              unint64_t v26 = v18[3];
              if (v27 >= v26 >> 1) {
                uint64_t v18 = sub_10001A000((void *)(v26 > 1), v27 + 1, 1, v18);
              }
              v18[2] = v27 + 1;
              uint64_t v28 = &v18[2 * v27];
              v28[4] = v23;
              v28[5] = v25;
            }

            else
            {
            }

            ++v17;
          }

          while (v16 != v17);
          goto LABEL_33;
        }
      }

      else
      {
        uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        swift_bridgeObjectRetain(v14);
        if (v16) {
          goto LABEL_10;
        }
      }

      uint64_t v18 = _swiftEmptyArrayStorage;
LABEL_33:
      swift_bridgeObjectRelease_n(v14, 2LL);
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v63);
      id v65 = v63;
      unint64_t v44 = sub_10002BC00(v64, v62);
      uint64_t v45 = v63[2];
      BOOL v46 = (v43 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_46;
      }
      char v48 = v43;
      if (v63[3] >= v47)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_10001AFA4();
        }
      }

      else
      {
        sub_10002CDFC(v47, isUniquelyReferenced_nonNull_native);
        unint64_t v49 = sub_10002BC00(v64, v62);
        if ((v48 & 1) != (v50 & 1))
        {
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
          __break(1u);
          return result;
        }

        unint64_t v44 = v49;
      }

      unint64_t v51 = v65;
      Class v63 = v65;
      if ((v48 & 1) != 0)
      {
        uint64_t v4 = *((void *)v65 + 7);
        swift_bridgeObjectRelease(*(void *)(v4 + 8 * v44));
        *(void *)(v4 + 8 * v44) = v18;
      }

      else
      {
        *((void *)v65 + (v44 >> 6) + 8) |= 1LL << v44;
        unint64_t v52 = (uint64_t *)(v51[6] + 16 * v44);
        uint64_t *v52 = v64;
        v52[1] = v62;
        *(void *)(v51[7] + 8 * v44) = v18;
        uint64_t v53 = v51[2];
        BOOL v54 = __OFADD__(v53, 1LL);
        uint64_t v55 = v53 + 1;
        if (v54) {
          goto LABEL_48;
        }
        v51[2] = v55;
        swift_bridgeObjectRetain(v62);
      }

      swift_bridgeObjectRelease(v62);
      swift_bridgeObjectRelease(0x8000000000000000LL);
      uint64_t v2 = v58;
LABEL_5:
      if (++v3 == v60)
      {
        swift_bridgeObjectRelease(v2);
        uint64_t v1 = lock;
        goto LABEL_44;
      }
    }
  }

  swift_bridgeObjectRelease(v2);
LABEL_44:
  os_unfair_lock_unlock(v1);
  return (uint64_t)v63;
}

void *sub_100009958(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 56) enabledTopics];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }

  unint64_t v3 = result;
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

  sub_100009AA4(v4);
  uint64_t result = [*(id *)(a1 + 56) opportunisticTopics];
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  unint64_t v5 = result;
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

  sub_100009AA4(v6);
  uint64_t result = [*(id *)(a1 + 56) ignoredTopics];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v7 = result;
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

  sub_100009AA4(v8);
  uint64_t result = [*(id *)(a1 + 56) nonWakingTopics];
  if (result)
  {
    id v9 = result;
    uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

    sub_100009AA4(v10);
    return _swiftEmptyArrayStorage;
  }

LABEL_9:
  __break(1u);
  return result;
}

  id v19 = 0LL;
LABEL_10:
  id v20 = type metadata accessor for Date(0LL);
  id v21 = *(void *)(v20 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v17, 1LL, v20) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v17, v20);
  }

  uint64_t v23 = [v10 initWithTopic:v15 channelID:v16 pushType:v18 pushPriority:v19 creationDate:isa];

  return v23;
}

uint64_t sub_100009AA4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = (void *)*v1;
  int64_t v4 = *(void *)(*v1 + 16LL);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }

  uint64_t isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  unint64_t v3 = sub_10001A000(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy(v10);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease(a1);
    void *v1 = v3;
    return result;
  }

LABEL_23:
  __break(1u);
LABEL_24:
  char v17 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v17,  1092LL,  0);
  __break(1u);
  return result;
}

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10000C654(0LL, (unint64_t *)&qword_1000592A0, &OBJC_CLASS____EXExtensionIdentity_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }

    char v17 = (v26 - 1) & v26;
    uint64_t v24 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_24:
    uint64_t v28 = *(void *)(v11 + 56);
    id v29 = v11;
    uint64_t v30 = (uint64_t *)(*(void *)(v11 + 48) + 16 * v24);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v9 + 72);
    BOOL v34 = v28 + v33 * v24;
    if ((v47 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v48, v34, v49);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v48, v34, v49);
      swift_bridgeObjectRetain(v31);
    }

    Hasher.init(_seed:)(v50, *(void *)(v13 + 40));
    String.hash(into:)(v50, v32, v31);
    uint64_t result = Hasher._finalize()();
    os_log_type_t v35 = -1LL << *(_BYTE *)(v13 + 32);
    uint64_t v36 = result & ~v35;
    uint64_t v37 = v36 >> 6;
    if (((-1LL << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      id v21 = __clz(__rbit64((-1LL << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v38 = 0;
      uint64_t v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v40 = v37 == v39;
        if (v37 == v39) {
          uint64_t v37 = 0LL;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v18 + 8 * v37);
      }

      while (v41 == -1);
      id v21 = __clz(__rbit64(~v41)) + (v37 << 6);
    }

    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v21;
    uint64_t v22 = (void *)(*(void *)(v13 + 48) + 16 * v21);
    *uint64_t v22 = v32;
    v22[1] = v31;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))( *(void *)(v13 + 56) + v33 * v21,  v48,  v49);
    ++*(void *)(v13 + 16);
    id v11 = v29;
  }

  unint64_t v27 = v25 + 2;
  if (v27 < v45)
  {
    unint64_t v26 = v46[v27];
    if (!v26)
    {
      while (1)
      {
        id v20 = v27 + 1;
        if (__OFADD__(v27, 1LL)) {
          goto LABEL_43;
        }
        if (v20 >= v45) {
          goto LABEL_36;
        }
        unint64_t v26 = v46[v20];
        ++v27;
        if (v26) {
          goto LABEL_23;
        }
      }
    }

    id v20 = v27;
    goto LABEL_23;
  }

uint64_t sub_100009BF8(uint64_t a1)
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
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (v4 < 0) {
    uint64_t v17 = *v1;
  }
  else {
    uint64_t v17 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*v1);
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_29;
  }
LABEL_5:
  uint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  uint64_t *v1 = v4;
  uint64_t v5 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000LL) == 0 && (v4 & 0x4000000000000000LL) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_15;
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
    uint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
LABEL_15:
    uint64_t result = sub_10000BBF8(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  BOOL v13 = __OFADD__(v12, v11);
  uint64_t v14 = v12 + v11;
  if (!v13)
  {
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8LL) + 0x10) = v14;
LABEL_19:
    uint64_t v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }

  __break(1u);
  return result;
}

uint64_t sub_100009DB0()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + 72));
  return v0;
}

uint64_t sub_100009DFC()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t type metadata accessor for NotificationRegistry()
{
  return objc_opt_self(&OBJC_CLASS____TtC7mlhostd20NotificationRegistry);
}

uint64_t sub_100009E3C()
{
  return sub_100008DFC();
}

id sub_10000A058(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for MLHostAPSListener()
{
  return objc_opt_self(&OBJC_CLASS____TtC7mlhostd17MLHostAPSListener);
}

uint64_t sub_10000A0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 48LL);
}

void sub_10000A0C8(uint64_t a1)
{
  v10[0] = (char *)&value witness table for Builtin.Int64 + 64;
  uint64_t v2 = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v10[1] = *(void *)(v2 - 8) + 64LL;
    uint64_t v4 = type metadata accessor for TaskDefinition(319LL);
    if (v5 <= 0x3F)
    {
      v10[2] = *(void *)(v4 - 8) + 64LL;
      sub_10000B4A0(319LL);
      if (v7 <= 0x3F)
      {
        v10[3] = *(void *)(v6 - 8) + 64LL;
        uint64_t v8 = type metadata accessor for Optional(319LL, *(void *)(a1 + 16));
        if (v9 <= 0x3F)
        {
          v10[4] = *(void *)(v8 - 8) + 64LL;
          swift_initStructMetadata(a1, 0LL, 5LL, v10, a1 + 40);
        }
      }
    }
  }

uint64_t *sub_10000A198(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v40 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v40 - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v4 + 64);
  uint64_t v8 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v38 = v7 + v10;
  uint64_t v39 = v8;
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(_DWORD *)(v13 + 80);
  uint64_t v15 = v11 + v14;
  if (*(_DWORD *)(v13 + 84)) {
    uint64_t v16 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v13 + 64) + 1LL;
  }
  uint64_t v43 = *(void *)(a3 + 16);
  uint64_t v17 = *(void *)(v43 - 8);
  uint64_t v18 = *(_DWORD *)(v17 + 80);
  uint64_t v41 = v12;
  size_t __n = v16;
  if (*(_DWORD *)(v17 + 84)) {
    uint64_t v19 = *(void *)(v17 + 64);
  }
  else {
    uint64_t v19 = *(void *)(v17 + 64) + 1LL;
  }
  unint64_t v20 = v10 | (unint64_t)v5 | v14 | v18;
  if (v20 > 7
    || ((v10 | v5 | *(_DWORD *)(v13 + 80) | *(_DWORD *)(v17 + 80)) & 0x100000) != 0
    || v19
     + ((v16
       + v18
       + ((v15
         + ((v38 + ((v5 + 8LL) & ~(unint64_t)v5)) & ~(unint64_t)v10)) & ~v14)) & ~v18) > 0x18)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    uint64_t v24 = (uint64_t *)(v23 + ((v20 & 0xF8 ^ 0x1F8) & (v20 + 16)));
    swift_retain();
  }

  else
  {
    unint64_t v25 = ~(unint64_t)v10;
    size_t v35 = v19;
    uint64_t v36 = ~v14;
    uint64_t v37 = ~v18;
    *a1 = *a2;
    uint64_t v26 = ((unint64_t)a1 + v6 + 8) & ~v6;
    uint64_t v27 = ((unint64_t)a2 + v6 + 8) & ~v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v26, v27, v40);
    unint64_t v28 = (v26 + v38) & v25;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v28, (v27 + v38) & v25, v39);
    id v29 = (void *)((v28 + v15) & v36);
    uint64_t v30 = (const void *)((((v27 + v38) & v25) + v15) & v36);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v30, 1LL, v41))
    {
      size_t v31 = __n;
      memcpy(v29, v30, __n);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v29, v30, v41);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v29, 0LL, 1LL, v41);
      size_t v31 = __n;
    }

    uint64_t v32 = (void *)(((unint64_t)v29 + v31 + v18) & v37);
    uint64_t v33 = (const void *)(((unint64_t)v30 + v31 + v18) & v37);
    uint64_t v24 = a1;
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v33, 1LL, v43))
    {
      memcpy(v32, v33, v35);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v32, v33, v43);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v32, 0LL, 1LL, v43);
    }
  }

  return v24;
}

uint64_t sub_10000A450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t v10 = (v6 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v10, v8);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = (v10 + v11 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = *(void *)(a2 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  unint64_t v17 = *(void *)(v13 + 64) + v14;
  if (!*(_DWORD *)(v13 + 84)) {
    ++v17;
  }
  unint64_t v18 = (v17 + *(unsigned __int8 *)(v16 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v16 + 48))(v18, 1LL, v15);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(unint64_t, uint64_t))(v16 + 8))(v18, v15);
  }
  return result;
}

void *sub_10000A588(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v12 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (v11 + v14 + v9) & ~v14;
  uint64_t v16 = (v11 + v14 + v10) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  uint64_t v17 = *(void *)(v13 + 64);
  uint64_t v18 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = v17 + v20;
  uint64_t v22 = (void *)((v17 + v20 + v15) & ~v20);
  uint64_t v23 = (const void *)((v21 + v16) & ~v20);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v23, 1LL, v18))
  {
    int v24 = *(_DWORD *)(v19 + 84);
    uint64_t v25 = *(void *)(v19 + 64);
    if (v24) {
      size_t v26 = *(void *)(v19 + 64);
    }
    else {
      size_t v26 = v25 + 1;
    }
    memcpy(v22, v23, v26);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v22, v23, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0LL, 1LL, v18);
    int v24 = *(_DWORD *)(v19 + 84);
    uint64_t v25 = *(void *)(v19 + 64);
  }

  if (v24) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = v25 + 1;
  }
  uint64_t v28 = *(void *)(a3 + 16);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (void *)(((unint64_t)v22 + v31) & ~v30);
  uint64_t v33 = (const void *)(((unint64_t)v23 + v31) & ~v30);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v33, 1LL, v28))
  {
    if (*(_DWORD *)(v29 + 84)) {
      size_t v34 = *(void *)(v29 + 64);
    }
    else {
      size_t v34 = *(void *)(v29 + 64) + 1LL;
    }
    memcpy(v32, v33, v34);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v32, v33, v28);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v32, 0LL, 1LL, v28);
  }

  return a1;
}

void *sub_10000A768(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v9, v10, v6);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v12 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (v11 + v14 + v9) & ~v14;
  uint64_t v16 = (v11 + v14 + v10) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 24))(v15, v16, v12);
  uint64_t v17 = *(void *)(v13 + 64);
  uint64_t v18 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = v17 + v20;
  uint64_t v22 = (void *)((v17 + v20 + v15) & ~v20);
  uint64_t v23 = (void *)((v21 + v16) & ~v20);
  int v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v16) = v24(v22, 1LL, v18);
  int v25 = v24(v23, 1LL, v18);
  if ((_DWORD)v16)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v22, v23, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0LL, 1LL, v18);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v22, v23, v18);
      goto LABEL_10;
    }

    (*(void (**)(void *, uint64_t))(v19 + 8))(v22, v18);
  }

  if (*(_DWORD *)(v19 + 84)) {
    size_t v26 = *(void *)(v19 + 64);
  }
  else {
    size_t v26 = *(void *)(v19 + 64) + 1LL;
  }
  memcpy(v22, v23, v26);
LABEL_10:
  if (*(_DWORD *)(v19 + 84)) {
    uint64_t v27 = *(void *)(v19 + 64);
  }
  else {
    uint64_t v27 = *(void *)(v19 + 64) + 1LL;
  }
  uint64_t v28 = *(void *)(a3 + 16);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (void *)(((unint64_t)v22 + v31) & ~v30);
  uint64_t v33 = (void *)(((unint64_t)v23 + v31) & ~v30);
  size_t v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v35 = v34(v32, 1LL, v28);
  int v36 = v34(v33, 1LL, v28);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 16))(v32, v33, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v32, 0LL, 1LL, v28);
      return a1;
    }
  }

  else
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 24))(v32, v33, v28);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v29 + 8))(v32, v28);
  }

  if (*(_DWORD *)(v29 + 84)) {
    size_t v37 = *(void *)(v29 + 64);
  }
  else {
    size_t v37 = *(void *)(v29 + 64) + 1LL;
  }
  memcpy(v32, v33, v37);
  return a1;
}

void *sub_10000A9D0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v9, v10, v6);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v12 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (v11 + v14 + v9) & ~v14;
  uint64_t v16 = (v11 + v14 + v10) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v15, v16, v12);
  uint64_t v17 = *(void *)(v13 + 64);
  uint64_t v18 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = v17 + v20;
  uint64_t v22 = (void *)((v17 + v20 + v15) & ~v20);
  uint64_t v23 = (const void *)((v21 + v16) & ~v20);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v23, 1LL, v18))
  {
    int v24 = *(_DWORD *)(v19 + 84);
    uint64_t v25 = *(void *)(v19 + 64);
    if (v24) {
      size_t v26 = *(void *)(v19 + 64);
    }
    else {
      size_t v26 = v25 + 1;
    }
    memcpy(v22, v23, v26);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v22, v23, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0LL, 1LL, v18);
    int v24 = *(_DWORD *)(v19 + 84);
    uint64_t v25 = *(void *)(v19 + 64);
  }

  if (v24) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = v25 + 1;
  }
  uint64_t v28 = *(void *)(a3 + 16);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (void *)(((unint64_t)v22 + v31) & ~v30);
  uint64_t v33 = (const void *)(((unint64_t)v23 + v31) & ~v30);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v33, 1LL, v28))
  {
    if (*(_DWORD *)(v29 + 84)) {
      size_t v34 = *(void *)(v29 + 64);
    }
    else {
      size_t v34 = *(void *)(v29 + 64) + 1LL;
    }
    memcpy(v32, v33, v34);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 32))(v32, v33, v28);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v32, 0LL, 1LL, v28);
  }

  return a1;
}

void *sub_10000ABB0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v9, v10, v6);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v12 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (v11 + v14 + v9) & ~v14;
  uint64_t v16 = (v11 + v14 + v10) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 40))(v15, v16, v12);
  uint64_t v17 = *(void *)(v13 + 64);
  uint64_t v18 = type metadata accessor for MLHostSystemParameters(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = v17 + v20;
  uint64_t v22 = (void *)((v17 + v20 + v15) & ~v20);
  uint64_t v23 = (void *)((v21 + v16) & ~v20);
  int v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v16) = v24(v22, 1LL, v18);
  int v25 = v24(v23, 1LL, v18);
  if ((_DWORD)v16)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v22, v23, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0LL, 1LL, v18);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v22, v23, v18);
      goto LABEL_10;
    }

    (*(void (**)(void *, uint64_t))(v19 + 8))(v22, v18);
  }

  if (*(_DWORD *)(v19 + 84)) {
    size_t v26 = *(void *)(v19 + 64);
  }
  else {
    size_t v26 = *(void *)(v19 + 64) + 1LL;
  }
  memcpy(v22, v23, v26);
LABEL_10:
  if (*(_DWORD *)(v19 + 84)) {
    uint64_t v27 = *(void *)(v19 + 64);
  }
  else {
    uint64_t v27 = *(void *)(v19 + 64) + 1LL;
  }
  uint64_t v28 = *(void *)(a3 + 16);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (void *)(((unint64_t)v22 + v31) & ~v30);
  uint64_t v33 = (void *)(((unint64_t)v23 + v31) & ~v30);
  size_t v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v35 = v34(v32, 1LL, v28);
  int v36 = v34(v33, 1LL, v28);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 32))(v32, v33, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v32, 0LL, 1LL, v28);
      return a1;
    }
  }

  else
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 40))(v32, v33, v28);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v29 + 8))(v32, v28);
  }

  if (*(_DWORD *)(v29 + 84)) {
    size_t v37 = *(void *)(v29 + 64);
  }
  else {
    size_t v37 = *(void *)(v29 + 64) + 1LL;
  }
  memcpy(v32, v33, v37);
  return a1;
}

uint64_t sub_10000AE18(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(type metadata accessor for MLHostSystemParameters(0LL) - 8);
  int v14 = *(_DWORD *)(v13 + 84);
  if (v14) {
    unsigned int v15 = v14 - 1;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v15 <= v12) {
    unsigned int v16 = v12;
  }
  else {
    unsigned int v16 = v15;
  }
  uint64_t v17 = *(void *)(*(void *)(a3 + 16) - 8LL);
  int v18 = *(_DWORD *)(v17 + 84);
  unsigned int v19 = v18 - 1;
  if (!v18) {
    unsigned int v19 = 0;
  }
  if (v19 > v16) {
    unsigned int v16 = v19;
  }
  if (v14) {
    uint64_t v20 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v20 = *(void *)(v13 + 64) + 1LL;
  }
  if (v18) {
    uint64_t v21 = *(void *)(v17 + 64);
  }
  else {
    uint64_t v21 = *(void *)(v17 + 64) + 1LL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v22 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v23 = *(void *)(v7 + 64);
  uint64_t v24 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v25 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v26 = *(void *)(v10 + 64) + v25;
  uint64_t v27 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v28 = v20 + v27;
  if (a2 <= v16) {
    goto LABEL_39;
  }
  uint64_t v29 = v21 + ((v28 + ((v26 + ((v23 + v24 + ((v22 + 8) & ~v22)) & ~v24)) & ~v25)) & ~v27);
  char v30 = 8 * v29;
  unsigned int v32 = ((a2 - v16 + ~(-1 << v30)) >> v30) + 1;
  if (HIWORD(v32))
  {
    int v31 = *(_DWORD *)(a1 + v29);
    if (!v31) {
      goto LABEL_39;
    }
    goto LABEL_30;
  }

  if (v32 > 0xFF)
  {
    int v31 = *(unsigned __int16 *)(a1 + v29);
    if (!*(_WORD *)(a1 + v29)) {
      goto LABEL_39;
    }
    goto LABEL_30;
  }

  if (v32 >= 2)
  {
LABEL_23:
    int v31 = *(unsigned __int8 *)(a1 + v29);
    if (!*(_BYTE *)(a1 + v29)) {
      goto LABEL_39;
    }
LABEL_30:
    int v33 = (v31 - 1) << v30;
    if ((_DWORD)v29)
    {
      else {
        int v34 = 4;
      }
      __asm { BR              X12 }
    }

    return v16 + v33 + 1;
  }

LABEL_39:
  if (!v16) {
    return 0LL;
  }
  uint64_t v35 = (a1 + v22 + 8) & ~v22;
  if ((_DWORD)v8 == v16)
  {
    int v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v37 = v8;
    uint64_t v38 = v6;
    return v36(v35, v37, v38);
  }

  uint64_t v35 = (v35 + v23 + v24) & ~v24;
  if ((_DWORD)v11 == v16)
  {
    int v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    uint64_t v37 = v11;
    uint64_t v38 = v9;
    return v36(v35, v37, v38);
  }

  uint64_t v39 = (v26 + v35) & ~v25;
  if (v15 == v16) {
    unsigned int v40 = (*(uint64_t (**)(uint64_t))(v13 + 48))(v39);
  }
  else {
    unsigned int v40 = (*(uint64_t (**)(uint64_t, void))(v17 + 48))((v28 + v39) & ~v27, *(unsigned int *)(v17 + 84));
  }
  if (v40 >= 2) {
    return v40 - 1;
  }
  else {
    return 0LL;
  }
}

  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

      v482 = (uint64_t *)(v0 + 976);
      v491 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
      v237 = *(void *)(v0 + 1728);
      v238 = *(void *)(v0 + 1432);
      v239 = *(void *)(v0 + 1424);
      v240 = *(void *)(v0 + 1416);
      v241 = v236;
      v242 = MLHostTask.name.getter(v241);
      v244 = v243;
      v245 = *(void (**)(uint64_t, uint64_t, uint64_t))(v239 + 16);
      v245(v238, v237, v240);
      sub_100013D50(v242, v244, v238);
      swift_bridgeObjectRelease(v244);
      v246 = v491(v238, v240);
      v247 = MLHostTask.name.getter(v246);
      v249 = v248;
      sub_100013A80(v247, v248);
      v250 = swift_bridgeObjectRelease(v249);
      v251 = MLHostResult.status.getter(v250);
      v252 = MLHostResultStatus.rawValue.getter(v251);
      if (v252 != MLHostResultStatus.rawValue.getter(1LL))
      {
        v492 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
        v253 = *(void *)(v0 + 1728);
        v254 = *(void *)(v0 + 1432);
        v255 = *(void *)(v0 + 1416);
        v256 = [*(id *)(v0 + 1704) processIdentifier];
        v499 = 0LL;
        v500 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        v257 = v500;
        *(void *)(v0 + 904) = v499;
        *(void *)(v0 + 912) = v257;
        v258._countAndFlagsBits = 0x206B736154LL;
        v258._object = (void *)0xE500000000000000LL;
        String.append(_:)(v258);
        v260._countAndFlagsBits = MLHostTask.name.getter(v259);
        v261 = v260._object;
        String.append(_:)(v260);
        swift_bridgeObjectRelease(v261);
        v262._object = (void *)0x800000010004A570LL;
        v262._countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v262);
        v245(v254, v253, v255);
        _print_unlocked<A, B>(_:_:)( v254,  v0 + 904,  v255,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v492(v254, v255);
        v263._countAndFlagsBits = 46LL;
        v263._object = (void *)0xE100000000000000LL;
        String.append(_:)(v263);
        v264 = *(void *)(v0 + 912);
        sub_1000305D8((uint64_t)v256, *(void *)(v0 + 904), v264);
        swift_bridgeObjectRelease(v264);
      }

      goto LABEL_42;
    }

    v317 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v318 = *(void *)(v0 + 1264);
    v319 = *(void *)(v0 + 1216);
    v320 = *(void *)(v0 + 1176);
    ContinuousClock.init()(v293);
    *(void *)(v0 + 856) = 500000000000000000LL;
    *(void *)(v0 + 864) = 0LL;
    *(_OWORD *)(v0 + 816) = 0u;
    *(_BYTE *)(v0 + 832) = 1;
    v321 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v320, v321);
    v322 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v0 + 856, v319, v322);
    v317(v318, v319);
    v323 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(void *)(v0 + 1832) = v323;
    *v323 = v0;
    v323[1] = sub_1000353B0;
    v229 = *(void *)(v0 + 1176);
    v231 = v0 + 816;
    v230 = *(void *)(v0 + 1248);
    v232 = v321;
    return dispatch thunk of Clock.sleep(until:tolerance:)(v230, v231, v229, v232);
  }

  v475 = (uint64_t *)(v0 + 1024);
  uint64_t v8 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
  v455 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
  v464 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
  v416 = *(void *)(v0 + 1680);
  v425 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
  uint64_t v9 = *(void *)(v0 + 1608);
  uint64_t v10 = *(void *)(v0 + 1592);
  v436 = *(void *)(v0 + 1464);
  v447 = *(void *)(v0 + 1440);
  uint64_t v11 = *(void *)(v0 + 1432);
  unsigned int v12 = *(void *)(v0 + 1416);
  uint64_t v13 = *(void *)(v0 + 1152);
  int v14 = MLHostTask.name.getter(v7);
  unsigned int v16 = v15;
  v8(v11, enum case for TaskStatus.taskFailed(_:), v12);
  sub_100013D50(v14, v16, v11);
  swift_bridgeObjectRelease(v16);
  v425(v11, v12);
  v455(v9, v416, v10);
  uint64_t v17 = v464(v436, v13, v447);
  int v18 = (os_log_s *)Logger.logObject.getter(v17);
  unsigned int v19 = static os_log_type_t.error.getter();
  uint64_t v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
  uint64_t v22 = *(void *)(v0 + 1608);
  uint64_t v23 = *(void *)(v0 + 1592);
  uint64_t v24 = *(void *)(v0 + 1464);
  uint64_t v25 = *(void *)(v0 + 1440);
  if (v20)
  {
    v465 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
    v437 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
    v456 = *(void *)(v0 + 1592);
    uint64_t v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v27 = swift_slowAlloc(32LL, -1LL);
    v499 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v28 = MLHostTask.name.getter(v27);
    v448 = v22;
    char v30 = v29;
    *v475 = sub_10000B540(v28, v29, &v499);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v475, v0 + 1032, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease(v30);
    v437(v24, v25);
    _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "Task %s has been in shouldRun for too long. Marking task as failed and terminating process.",  v26,  0xCu);
    swift_arrayDestroy(v27, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);

    v465(v448, v456);
  }

  else
  {
    (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1464), *(void *)(v0 + 1440));

    v21(v22, v23);
  }

  v458 = *(void *)(v0 + 1768);
  v468 = *(void *)(v0 + 1808);
  uint64_t v90 = *(void *)(v0 + 1744);
  v439 = *(void *)(v0 + 1720);
  v450 = *(void *)(v0 + 1760);
  uint64_t v91 = *(void **)(v0 + 1704);
  uint64_t v92 = *(void *)(v0 + 1672);
  BOOL v93 = *(void *)(v0 + 1408);
  v478 = *(void *)(v0 + 1400);
  v488 = *(void *)(v0 + 1392);
  v420 = *(void *)(v0 + 1272);
  v428 = *(void **)(v0 + 1752);
  v94 = *(void *)(v0 + 1224);
  v411 = *(void *)(v0 + 1216);
  v95 = *(void *)(v0 + 1168);
  uint64_t v96 = [v91 processIdentifier];
  v499 = 0LL;
  v500 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(43LL);
  v97._countAndFlagsBits = 0x206B736154LL;
  v97._object = (void *)0xE500000000000000LL;
  String.append(_:)(v97);
  v99._countAndFlagsBits = MLHostTask.name.getter(v98);
  unint64_t v100 = v99._object;
  String.append(_:)(v99);
  unint64_t v101 = v100;
  uint64_t v76 = v92;
  swift_bridgeObjectRelease(v101);
  v102._countAndFlagsBits = 0xD000000000000024LL;
  v102._object = (void *)0x800000010004A4E0LL;
  String.append(_:)(v102);
  v103 = v500;
  uint64_t v104 = (uint64_t)v96;
  uint64_t v64 = v95;
  sub_1000305D8(v104, v499, v500);
  swift_unknownObjectRelease(v90);

  swift_bridgeObjectRelease(v103);
  (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v420, v411);
  swift_release(v439);
  swift_release(v450);
  swift_release(v458);
  swift_release(v468);
  [v91 invalidate];

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v478 + 8))(v93, v488);
LABEL_19:
  v358 = 0LL;
LABEL_55:
  swift_release_n(v64, 2LL);
  swift_unknownObjectRelease(v76);
  v342 = *(void *)(v0 + 1656);
  v343 = *(void *)(v0 + 1648);
  v344 = *(void *)(v0 + 1640);
  v345 = *(void *)(v0 + 1632);
  v346 = *(void *)(v0 + 1624);
  v347 = *(void *)(v0 + 1616);
  v348 = *(void *)(v0 + 1608);
  v349 = *(void *)(v0 + 1584);
  v350 = *(void *)(v0 + 1576);
  v359 = *(void *)(v0 + 1568);
  v360 = *(void *)(v0 + 1560);
  v361 = *(void *)(v0 + 1552);
  v362 = *(void *)(v0 + 1544);
  v363 = *(void *)(v0 + 1536);
  v364 = *(void *)(v0 + 1528);
  v365 = *(void *)(v0 + 1520);
  v366 = *(void *)(v0 + 1512);
  v368 = *(void *)(v0 + 1504);
  v370 = *(void *)(v0 + 1496);
  v371 = *(void *)(v0 + 1488);
  v373 = *(void *)(v0 + 1480);
  v375 = *(void *)(v0 + 1472);
  v377 = *(void *)(v0 + 1464);
  v379 = *(void *)(v0 + 1432);
  v382 = *(void *)(v0 + 1408);
  v386 = *(id *)(v0 + 1384);
  v391 = *(void *)(v0 + 1376);
  v395 = *(void *)(v0 + 1352);
  v397 = *(void *)(v0 + 1344);
  v401 = *(void *)(v0 + 1320);
  v407 = *(void *)(v0 + 1296);
  v415 = *(void *)(v0 + 1272);
  v424 = *(void *)(v0 + 1264);
  v435 = *(void *)(v0 + 1256);
  v446 = *(void *)(v0 + 1248);
  v454 = *(void *)(v0 + 1240);
  v463 = *(void *)(v0 + 1232);
  v474 = *(void *)(v0 + 1208);
  v485 = *(void *)(v0 + 1200);
  v498 = *(void *)(v0 + 1192);
  swift_task_dealloc(*(void *)(v0 + 1664));
  swift_task_dealloc(v342);
  swift_task_dealloc(v343);
  swift_task_dealloc(v344);
  swift_task_dealloc(v345);
  swift_task_dealloc(v346);
  swift_task_dealloc(v347);
  swift_task_dealloc(v348);
  swift_task_dealloc(v349);
  swift_task_dealloc(v350);
  swift_task_dealloc(v359);
  swift_task_dealloc(v360);
  swift_task_dealloc(v361);
  swift_task_dealloc(v362);
  swift_task_dealloc(v363);
  swift_task_dealloc(v364);
  swift_task_dealloc(v365);
  swift_task_dealloc(v366);
  swift_task_dealloc(v368);
  swift_task_dealloc(v370);
  swift_task_dealloc(v371);
  swift_task_dealloc(v373);
  swift_task_dealloc(v375);
  swift_task_dealloc(v377);
  swift_task_dealloc(v379);
  swift_task_dealloc(v382);
  swift_task_dealloc(v386);
  swift_task_dealloc(v391);
  swift_task_dealloc(v395);
  swift_task_dealloc(v397);
  swift_task_dealloc(v401);
  swift_task_dealloc(v407);
  swift_task_dealloc(v415);
  swift_task_dealloc(v424);
  swift_task_dealloc(v435);
  swift_task_dealloc(v446);
  swift_task_dealloc(v454);
  swift_task_dealloc(v463);
  swift_task_dealloc(v474);
  swift_task_dealloc(v485);
  swift_task_dealloc(v498);
  return (*(uint64_t (**)(void *))(v0 + 8))(v358);
}

void sub_10000B0C8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(type metadata accessor for Date(0LL) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(type metadata accessor for TaskDefinition(0LL) - 8);
  if (*(_DWORD *)(v9 + 84) <= v8) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  unsigned int v11 = 0;
  uint64_t v12 = *(void *)(type metadata accessor for MLHostSystemParameters(0LL) - 8);
  int v13 = *(_DWORD *)(v12 + 84);
  if (v13) {
    unsigned int v14 = v13 - 1;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 <= v10) {
    unsigned int v15 = v10;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = *(void *)(*(void *)(a4 + 16) - 8LL);
  int v17 = *(_DWORD *)(v16 + 84);
  unsigned int v18 = v17 - 1;
  if (!v17) {
    unsigned int v18 = 0;
  }
  if (v18 > v15) {
    unsigned int v15 = v18;
  }
  if (v13) {
    uint64_t v19 = *(void *)(v12 + 64);
  }
  else {
    uint64_t v19 = *(void *)(v12 + 64) + 1LL;
  }
  uint64_t v20 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v21 = v19 + v20;
  uint64_t v22 = *(void *)(v16 + 64);
  if (!v17) {
    ++v22;
  }
  size_t v23 = ((v21
        + ((*(void *)(v9 + 64)
          + *(unsigned __int8 *)(v12 + 80)
          + ((*(void *)(v7 + 64)
            + *(unsigned __int8 *)(v9 + 80)
  if (a3 > v15)
  {
    if (v23 > 3)
    {
      unsigned int v11 = &_mh_execute_header.magic + 1;
      if (v15 >= a2) {
LABEL_35:
      }
        __asm { BR              X22 }

LABEL_28:
      unsigned int v25 = ~v15 + a2;
      if (v23 < 4)
      {
        if ((_DWORD)v23)
        {
          int v26 = v25 & ~(-1 << (8 * v23));
          bzero(a1, v23);
          if ((_DWORD)v23 == 3)
          {
            *(_WORD *)a1 = v26;
            a1[2] = BYTE2(v26);
          }

          else if ((_DWORD)v23 == 2)
          {
            *(_WORD *)a1 = v26;
          }

          else
          {
            *a1 = v26;
          }
        }
      }

      else
      {
        bzero(a1, v23);
        *(_DWORD *)a1 = v25;
      }

      __asm { BR              X10 }
    }

    unsigned int v24 = ((a3 - v15 + ~(-1 << (8 * v23))) >> (8 * v23)) + 1;
    if (HIWORD(v24))
    {
      unsigned int v11 = &dword_100000004;
      if (v15 >= a2) {
        goto LABEL_35;
      }
      goto LABEL_28;
    }

    if (v24 >= 0x100) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v24 > 1;
    }
  }

  if (v15 >= a2) {
    goto LABEL_35;
  }
  goto LABEL_28;
}

  __break(1u);
  return result;
}

  __break(1u);
}

    NotificationsConfigRequest = type metadata accessor for GetNotificationsConfigRequest(0LL);
    unint64_t v44 = sub_100005038( &qword_100059880,  (uint64_t (*)(uint64_t))&type metadata accessor for GetNotificationsConfigRequest,  (uint64_t)&protocol conformance descriptor for GetNotificationsConfigRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)( NotificationsConfigRequest,  sub_10003EDC0,  a2,  NotificationsConfigRequest,  v44);
    swift_release(a2);
    if ((v9 & 2) == 0)
    {
LABEL_19:
      if ((v9 & 0x20) == 0) {
        return v24;
      }
LABEL_30:
      uint64_t v47 = dispatch thunk of XPCIncomingConnection.valueStringArray(forEntitlement:)( 0xD000000000000025LL,  0x800000010004A590LL);
      if (v47) {
        char v48 = (void *)v47;
      }
      else {
        char v48 = _swiftEmptyArrayStorage;
      }
      unint64_t v49 = sub_10002EF58((uint64_t)v48);
      swift_bridgeObjectRelease(v48);
      char v50 = swift_bridgeObjectRetain_n(v49, 2LL);
      unint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
      unint64_t v52 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        BOOL v54 = swift_slowAlloc(32LL, -1LL);
        uint64_t v64 = v54;
        *(_DWORD *)uint64_t v53 = 136315138;
        uint64_t v55 = swift_bridgeObjectRetain(v49);
        uint64_t v56 = Set.description.getter(v55);
        id v58 = v57;
        swift_bridgeObjectRelease(v49);
        Class v63 = sub_10000B540(v56, v58, &v64);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v53 + 4, v53 + 12);
        swift_bridgeObjectRelease_n(v49, 2LL);
        swift_bridgeObjectRelease(v58);
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Accepted connection with allowedTasks: %s", v53, 0xCu);
        swift_arrayDestroy(v54, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v54, -1LL, -1LL);
        swift_slowDealloc(v53, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v49, 2LL);
      }

      NSString v59 = type metadata accessor for GetOnDemandTaskRequest(0LL);
      uint64_t v60 = swift_allocObject(&unk_100056198, 32LL, 7LL);
      *(void *)(v60 + 16) = v49;
      *(void *)(v60 + 24) = a2;
      uint64_t v61 = sub_100005038( &qword_100059870,  (uint64_t (*)(uint64_t))&type metadata accessor for GetOnDemandTaskRequest,  (uint64_t)&protocol conformance descriptor for GetOnDemandTaskRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(v59, sub_10003ED90, v60, v59, v61);
      swift_release(v60);
      return v24;
    }

void sub_10000B39C()
{
  *(_BYTE *)(v0 + v2) = v1;
}

void sub_10000B3A4()
{
  *(_WORD *)(v0 + v2) = v1;
}

void sub_10000B438()
{
  _BYTE *v0 = v1;
}

void sub_10000B470()
{
  _WORD *v0 = v1;
}

void sub_10000B478()
{
  *(_WORD *)uint64_t v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_10000B488()
{
  _DWORD *v0 = v1;
}

uint64_t type metadata accessor for MLHostPushMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C808(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MLHostPushMessage);
}

void sub_10000B4A0(uint64_t a1)
{
  if (!qword_100059230)
  {
    uint64_t v2 = type metadata accessor for MLHostSystemParameters(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100059230);
    }
  }

uint64_t sub_10000B4F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for MLHostPushMessage.CodingKeys( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C808(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MLHostPushMessage.CodingKeys);
}

uint64_t sub_10000B540(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B610(v13, 0LL, 0LL, 1, a1, a2);
  uint64_t v8 = v13[0];
  if (v6)
  {
    uint64_t v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000C570((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v11 = *a3;
    if (*a3)
    {
      sub_10000C570((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000C550(v13);
  return v8;
}

uint64_t sub_10000B610(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000B7C8(a5, a6);
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

  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_10000B7C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B85C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000BAAC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000BAAC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B85C(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_10000B9D0(v4, 0LL);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_10000B9D0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10000B4F4(&qword_100059278);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000BA34(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  unint64_t v6 = a1 >> 16;
  uint64_t v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v13 = String.UTF16View.index(_:offsetBy:)(15LL, v6, a2);
    uint64_t v14 = v13 + (v7 << 16);
    unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v16 = v14 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v16 = v15;
    }
    return v16 | 4;
  }

  else
  {
    uint64_t v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15LL, v6);
    uint64_t v9 = v8 + (v7 << 16);
    unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v11 = v9 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v11 = v10;
    }
    return v11 | 8;
  }

uint64_t sub_10000BAAC(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000B4F4(&qword_100059278);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
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

  __break(1u);
  return result;
}

  __break(1u);
}

  __break(1u);
  return result;
}

  swift_release(v0);
  return v21;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_10000BBF8(unint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
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
        sub_10000C700(&qword_1000592A8, &qword_100059298, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_10000B4F4(&qword_100059298);
          uint64_t v13 = sub_10000E8B8(v18, i, a3);
          id v15 = *v14;
          ((void (*)(void (**)(id *), void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

uint64_t sub_10000BE14()
{
  return 5LL;
}

void sub_10000BE1C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_10000C538(v4, (uint64_t)qword_10005A7E0);
  unint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received relay push", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  if (!a1)
  {
    uint64_t v60 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v22))
    {
      size_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)size_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, v22, "Push message has nil message.", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

LABEL_18:
    return;
  }

  uint64_t v60 = a1;
  id v10 = -[os_log_s topic](v60, "topic");
  if (!v10)
  {
LABEL_15:
    osloga = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v24))
    {
      unsigned int v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unsigned int v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, osloga, v24, "Push message has nil topic / channel.", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);

      return;
    }

    goto LABEL_18;
  }

  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v14 = v13;

  id v15 = -[os_log_s channelID](v60, "channelID");
  if (!v15)
  {
    id v10 = (id)swift_bridgeObjectRelease(v14);
    goto LABEL_15;
  }

  uint64_t v16 = v15;
  os_log_t oslog = (os_log_t)static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  unint64_t v18 = v17;

  id v19 = -[os_log_s pushType](v60, "pushType");
  if (v19 == (id)4)
  {
    unint64_t v20 = 0xEA0000000000646ELL;
    uint64_t v21 = 0x756F72676B636162LL;
  }

  else if (v19 == (id)8)
  {
    unint64_t v20 = 0xE500000000000000LL;
    uint64_t v21 = 0x7472656C61LL;
  }

  else if (v19 == (id)1024)
  {
    unint64_t v20 = 0xEC00000079746976LL;
    uint64_t v21 = 0x697463416576696CLL;
  }

  else
  {
    uint64_t v62 = (uint64_t)v19;
    type metadata accessor for APSIncomingMessagePushType(0LL);
    uint64_t v21 = String.init<A>(describing:)(&v62, v26);
    unint64_t v20 = v27;
  }

  id v28 = -[os_log_s priority](v60, "priority");
  if (v28 == (id)1)
  {
    unint64_t v29 = 0xE300000000000000LL;
    uint64_t v57 = 7827308LL;
  }

  else if (v28 == (id)10)
  {
    unint64_t v29 = 0xE400000000000000LL;
    uint64_t v57 = 1751607656LL;
  }

  else if (v28 == (id)5)
  {
    unint64_t v29 = 0xE600000000000000LL;
    uint64_t v57 = 0x6D756964656DLL;
  }

  else
  {
    uint64_t v62 = (uint64_t)v28;
    type metadata accessor for APSIncomingMessagePriority(0LL);
    uint64_t v57 = String.init<A>(describing:)(&v62, v30);
    unint64_t v29 = v31;
  }

  id v32 = -[os_log_s userInfo](v60, "userInfo");
  if (v32)
  {
    int v33 = v32;
    unint64_t v56 = v29;
    uint64_t v55 = (char *)&type metadata for Any + 8;
    uint64_t v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v32, &type metadata for AnyHashable);

    swift_bridgeObjectRetain_n(v14, 2LL);
    swift_bridgeObjectRetain_n(v18, 2LL);
    uint64_t v35 = swift_bridgeObjectRetain_n(v34, 2LL);
    int v36 = (os_log_s *)Logger.logObject.getter(v35);
    os_log_type_t v37 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v53 = v21;
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      uint64_t v52 = swift_slowAlloc(96LL, -1LL);
      uint64_t v62 = v52;
      *(_DWORD *)uint64_t v38 = 136315650;
      swift_bridgeObjectRetain(v14);
      uint64_t v61 = sub_10000B540(v12, v14, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v38 + 4, v38 + 12);
      swift_bridgeObjectRelease_n(v14, 3LL);
      uint64_t v54 = v12;
      *(_WORD *)(v38 + 12) = 2080;
      swift_bridgeObjectRetain(v18);
      uint64_t v61 = sub_10000B540((uint64_t)oslog, v18, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v38 + 14, v38 + 22);
      swift_bridgeObjectRelease_n(v18, 3LL);
      *(_WORD *)(v38 + 22) = 2080;
      uint64_t v40 = Dictionary.description.getter( v34,  &type metadata for AnyHashable,  v55,  &protocol witness table for AnyHashable,  v39);
      unint64_t v42 = v41;
      uint64_t v61 = sub_10000B540(v40, v41, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v38 + 24, v38 + 32);
      swift_bridgeObjectRelease_n(v34, 2LL);
      unint64_t v43 = v42;
      uint64_t v12 = v54;
      swift_bridgeObjectRelease(v43);
      _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "Received push message for topic %s on channel %s: %s",  (uint8_t *)v38,  0x20u);
      swift_arrayDestroy(v52, 3LL, v55);
      swift_slowDealloc(v52, -1LL, -1LL);
      uint64_t v44 = v38;
      uint64_t v21 = v53;
      swift_slowDealloc(v44, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v34, 2LL);
      swift_bridgeObjectRelease_n(v18, 2LL);
      swift_bridgeObjectRelease_n(v14, 2LL);
    }

    uint64_t v49 = v2 + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage;
    char v50 = *(void (**)(uint64_t, unint64_t, os_log_t, unint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t))(v2 + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
    uint64_t v51 = *(void *)(v49 + 8);
    swift_retain(v51);
    v50(v12, v14, oslog, v18, v21, v20, v57, v56, v34);

    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v56);
    swift_bridgeObjectRelease(v34);
    swift_release(v51);
  }

  else
  {
    swift_bridgeObjectRelease(v29);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v18);
    uint64_t v45 = swift_bridgeObjectRelease(v14);
    BOOL v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      char v48 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Push message has nil userInfo.", v48, 2u);
      swift_slowDealloc(v48, -1LL, -1LL);
    }

    else
    {
    }
  }

uint64_t sub_10000C538(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000C550(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000C5B0(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000C5C4(result, a2);
  }
  return result;
}

uint64_t sub_10000C5C4(uint64_t result, unint64_t a2)
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

uint64_t sub_10000C608(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000C610(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000C654(uint64_t a1, unint64_t *a2, void *a3)
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

void sub_10000C68C( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10000C698(uint64_t a1)
{
  return a1;
}

_OWORD *sub_10000C6CC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_10000C6DC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000C700(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10000C610(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000C740(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B4F4(&qword_1000592E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C788(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000B4F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C7CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000B4F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10000C808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_10000C834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24LL);
}

_BYTE *sub_10000C83C(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_10000C84C(unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t sub_10000C8DC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000C928 + 4 * byte_100040A2C[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000C95C + 4 * byte_100040A27[v4]))();
}

uint64_t sub_10000C95C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000C964(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000C96CLL);
  }
  return result;
}

uint64_t sub_10000C978(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000C980LL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_10000C984(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000C98C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000C998(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000C9A0(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t sub_10000C9A8(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100040C10, a1);
}

uint64_t sub_10000C9B8(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100040B80, a1);
}

uint64_t sub_10000C9C8(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100040BA8, a1);
}

void *sub_10000C9D8()
{
  uint64_t result = _swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS____EXQueryController);
    swift_bridgeObjectRetain(v2);
    uint64_t v5 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      id v8 = objc_allocWithZone(&OBJC_CLASS____EXQuery);
      swift_bridgeObjectRetain(v6);
      NSString v9 = String._bridgeToObjectiveC()();
      id v10 = [v8 initWithExtensionPointIdentifier:v9];

      id v11 = [v4 executeQuery:v10];
      unint64_t v12 = sub_10000F424();
      uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

      unint64_t v14 = sub_10000ED3C(v13, v7, v6);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v6);
      sub_100009BF8((uint64_t)v14);

      v5 += 2;
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease(v2);
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void sub_10000CB24()
{
  os_unfair_lock_t lock = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16LL);
  os_unfair_lock_lock(lock);
  __int16 v1 = sub_10000C9D8();
  uint64_t v2 = *(void *)(v0 + 24);
  *(void *)(v0 + 24) = v1;
  swift_bridgeObjectRelease(v2);
  uint64_t v21 = v0;
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain_n(*(void *)(v0 + 24), 2LL);
  while (v4)
  {
    uint64_t v5 = _swiftEmptyArrayStorage;
    uint64_t v6 = 4LL;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v3 & 0xC000000000000001LL) == 0) {
        break;
      }
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, v3);
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v7, 1LL)) {
        goto LABEL_15;
      }
LABEL_9:
      id v10 = v8;
      id v11 = [v10 bundleIdentifier];
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v14 = v13;

      if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0) {
        uint64_t v5 = sub_10001A000(0LL, v5[2] + 1LL, 1, v5);
      }
      unint64_t v16 = v5[2];
      unint64_t v15 = v5[3];
      if (v16 >= v15 >> 1) {
        uint64_t v5 = sub_10001A000((void *)(v15 > 1), v16 + 1, 1, v5);
      }
      v5[2] = v16 + 1;
      unint64_t v17 = &v5[2 * v16];
      v17[4] = v12;
      v17[5] = v14;
      ++v6;
      if (v9 == v4) {
        goto LABEL_21;
      }
    }

    id v8 = *(id *)(v3 + 8 * v6);
    uint64_t v9 = v6 - 3;
    if (!__OFADD__(v7, 1LL)) {
      goto LABEL_9;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    if (v3 < 0) {
      uint64_t v18 = v3;
    }
    else {
      uint64_t v18 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v3, 2LL);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v18);
  }

  uint64_t v5 = _swiftEmptyArrayStorage;
LABEL_21:
  swift_bridgeObjectRelease_n(v3, 2LL);
  uint64_t v19 = sub_10002EF58((uint64_t)v5);
  swift_bridgeObjectRelease(v5);
  uint64_t v20 = *(void *)(v21 + 40);
  *(void *)(v21 + 40) = v19;
  swift_bridgeObjectRelease(v20);
  os_unfair_lock_unlock(lock);
}

char *sub_10000CD08()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v56 = *(void *)(v2 - 8);
  uint64_t v57 = v2;
  __chkstk_darwin(v2);
  uint64_t v55 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_10000B4F4(&qword_1000594E0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for ExtensionRecord(0LL);
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v54 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v53 = (char *)&v46 - v11;
  __chkstk_darwin(v10);
  os_log_type_t v47 = (char *)&v46 - v12;
  os_unfair_lock_t v46 = (os_unfair_lock_t)(*(void *)(v1 + 16) + 16LL);
  os_unfair_lock_lock(v46);
  uint64_t v13 = *(void *)(v1 + 24);
  if (!((unint64_t)v13 >> 62))
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = (char *)swift_bridgeObjectRetain_n(*(void *)(v1 + 24), 2LL);
    if (v14) {
      goto LABEL_3;
    }
LABEL_20:
    NSString v59 = (char *)_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n(v13, 2LL);
    os_unfair_lock_unlock(v46);
    return v59;
  }

  if (v13 < 0) {
    uint64_t v45 = *(void *)(v1 + 24);
  }
  else {
    uint64_t v45 = v13 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v13, 2LL);
  uint64_t result = (char *)_CocoaArrayWrapper.endIndex.getter(v45);
  uint64_t v14 = (uint64_t)result;
  if (!result) {
    goto LABEL_20;
  }
LABEL_3:
  if (v14 >= 1)
  {
    uint64_t v16 = 0LL;
    unint64_t v49 = v13 & 0xC000000000000001LL;
    NSString v59 = (char *)_swiftEmptyArrayStorage;
    uint64_t v51 = v7;
    uint64_t v52 = v6;
    uint64_t v48 = v13;
    uint64_t v50 = v14;
    unint64_t v17 = v53;
    do
    {
      if (v49) {
        id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v13);
      }
      else {
        id v18 = *(id *)(v13 + 8 * v16 + 32);
      }
      id v19 = v18;
      id v20 = [v19 localizedName];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      uint64_t v60 = v22;
      uint64_t v61 = v21;

      id v23 = [v19 bundleIdentifier];
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      uint64_t v26 = v25;

      id v27 = [v19 url];
      id v28 = v55;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v29 = URL.absoluteString.getter();
      uint64_t v31 = v30;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v28, v57);
      id v32 = [v19 extensionPointIdentifier];
      uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
      uint64_t v35 = v34;

      ExtensionRecord.init(name:bundleIdentifier:url:extensionPointIdentifier:)(v61, v60, v24, v26, v29, v31, v33, v35);
      uint64_t v36 = v58;
      os_log_type_t v37 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      uint64_t v39 = v51;
      uint64_t v38 = (uint64_t)v52;
      v37(v52, v17, v51);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v38, 0LL, 1LL, v39);

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v38, 1LL, v39) == 1)
      {
        sub_10000C7CC(v38, &qword_1000594E0);
        uint64_t v13 = v48;
      }

      else
      {
        uint64_t v40 = v47;
        v37(v47, (char *)v38, v39);
        v37(v54, v40, v39);
        if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0) {
          NSString v59 = (char *)sub_10001A31C(0, *((void *)v59 + 2) + 1LL, 1, (unint64_t)v59);
        }
        uint64_t v13 = v48;
        unint64_t v42 = *((void *)v59 + 2);
        unint64_t v41 = *((void *)v59 + 3);
        if (v42 >= v41 >> 1) {
          NSString v59 = (char *)sub_10001A31C(v41 > 1, v42 + 1, 1, (unint64_t)v59);
        }
        uint64_t v43 = v58;
        uint64_t v44 = v59;
        *((void *)v59 + 2) = v42 + 1;
        v37( &v44[((*(unsigned __int8 *)(v43 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))
             + *(void *)(v43 + 72) * v42],
          v54,
          v39);
      }

      ++v16;
    }

    while (v50 != v16);
    goto LABEL_21;
  }

  __break(1u);
  return result;
}

void sub_10000D144( uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v83 = a3;
  uint64_t v91 = a5;
  uint64_t v9 = sub_10000B4F4(&qword_1000594A8);
  __chkstk_darwin(v9);
  unint64_t v86 = &v75[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = sub_10000B4F4(&qword_1000594B0);
  __chkstk_darwin(v11);
  uint64_t v82 = &v75[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = &v75[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v15);
  uint64_t v84 = &v75[-v18];
  uint64_t v19 = type metadata accessor for _AppExtensionIdentity(0LL);
  __chkstk_darwin(v19);
  uint64_t v21 = &v75[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v22 = type metadata accessor for _AppExtensionProcess.Configuration(0LL);
  uint64_t v87 = *(void *)(v22 - 8);
  uint64_t v88 = v22;
  uint64_t v23 = __chkstk_darwin(v22);
  int64_t v85 = &v75[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v23);
  uint64_t v26 = &v75[-v25];
  os_unfair_lock_t v90 = (os_unfair_lock_t)(*(void *)(v5 + 16) + 16LL);
  os_unfair_lock_lock(v90);
  uint64_t v27 = *(void *)(v5 + 24);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v27);
  uint64_t v89 = a1;
  uint64_t v28 = a1;
  uint64_t v29 = 0LL;
  uint64_t v31 = sub_10000EEF4(v30, v28, a2);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(a2);
  if (v31)
  {
    id v81 = v31;
    _AppExtensionIdentity.init(_:)();
    _AppExtensionProcess.Configuration.init(appExtension:onInterruption:)(v21, nullsub_1, 0LL);
    if (a4)
    {
      swift_bridgeObjectRetain(a4);
      id v32 = v84;
      sub_10000DA98(0xD000000000000011LL, 0x800000010004A110LL, v83, a4);
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v80 = 0LL;
      uint64_t v33 = type metadata accessor for Logger(0LL);
      sub_10000C538(v33, (uint64_t)qword_10005A7E0);
      uint64_t v79 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v14 + 16);
      v79(v17, v32, v13);
      swift_bridgeObjectRetain_n(a2, 2LL);
      swift_bridgeObjectRetain(a4);
      uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
      os_log_type_t v36 = static os_log_type_t.debug.getter();
      int v37 = v36;
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v38 = swift_slowAlloc(32LL, -1LL);
        uint64_t v78 = v26;
        uint64_t v39 = v38;
        uint64_t v40 = swift_slowAlloc(96LL, -1LL);
        v93[0] = v40;
        *(_DWORD *)uint64_t v39 = 136315650;
        os_log_t v77 = v35;
        uint64_t v41 = UUID.uuidString.getter();
        int v76 = v37;
        unint64_t v43 = v42;
        uint64_t v92 = sub_10000B540(v41, v42, v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v39 + 4, v39 + 12);
        swift_bridgeObjectRelease(v43);
        uint64_t v44 = *(void (**)(_BYTE *, uint64_t))(v14 + 8);
        v44(v17, v13);
        *(_WORD *)(v39 + 12) = 2080;
        swift_bridgeObjectRetain(a4);
        uint64_t v92 = sub_10000B540(v83, (unint64_t)a4, v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v39 + 14, v39 + 22);
        swift_bridgeObjectRelease_n(a4, 3LL);
        *(_WORD *)(v39 + 22) = 2080;
        swift_bridgeObjectRetain(a2);
        uint64_t v92 = sub_10000B540(v89, a2, v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v39 + 24, v39 + 32);
        swift_bridgeObjectRelease_n(a2, 3LL);
        os_log_t v45 = v77;
        _os_log_impl( (void *)&_mh_execute_header,  v77,  (os_log_type_t)v76,  "Requesting instanceIdentifier %s for taskName %s and bundleId %s",  (uint8_t *)v39,  0x20u);
        swift_arrayDestroy(v40, 3LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v40, -1LL, -1LL);
        uint64_t v46 = v39;
        uint64_t v26 = v78;
        id v32 = v84;
        swift_slowDealloc(v46, -1LL, -1LL);
      }

      else
      {
        uint64_t v44 = *(void (**)(_BYTE *, uint64_t))(v14 + 8);
        v44(v17, v13);

        swift_bridgeObjectRelease_n(a2, 2LL);
        swift_bridgeObjectRelease_n(a4, 2LL);
      }

      uint64_t v53 = v82;
      v79(v82, v32, v13);
      (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v14 + 56))(v53, 0LL, 1LL, v13);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v14 + 48))(v53, 1LL, v13) == 1)
      {
        Class isa = 0LL;
      }

      else
      {
        Class isa = UUID._bridgeToObjectiveC()().super.isa;
        v44(v53, v13);
      }

      id v55 = [objc_allocWithZone(_EXExtensionInstanceIdentifier) initWithIdentifier:isa];

      _AppExtensionProcess.Configuration.instanceIdentifier.setter(v55);
      v44(v32, v13);
      uint64_t v29 = v80;
    }

    uint64_t v57 = v87;
    uint64_t v56 = v88;
    uint64_t v58 = v85;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v87 + 16))(v85, v26, v88);
    uint64_t v59 = (uint64_t)v86;
    _AppExtensionProcess.init(configuration:)(v58);
    if (v29)
    {
      swift_errorRelease(v29);
      uint64_t v60 = type metadata accessor for _AppExtensionProcess(0LL);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56LL))(v59, 1LL, 1LL, v60);
    }

    else
    {
      uint64_t v61 = type metadata accessor for _AppExtensionProcess(0LL);
      uint64_t v62 = *(void *)(v61 - 8);
      Class v63 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v62 + 56);
      v63(v59, 0LL, 1LL, v61);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v59, 1LL, v61) != 1)
      {

        (*(void (**)(_BYTE *, uint64_t))(v57 + 8))(v26, v56);
        uint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32);
        uint64_t v74 = v91;
        v73(v91, v59, v61);
        v63(v74, 0LL, 1LL, v61);
        unint64_t v71 = v90;
        goto LABEL_27;
      }
    }

    sub_10000C7CC(v59, &qword_1000594A8);
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v64 = type metadata accessor for Logger(0LL);
    sub_10000C538(v64, (uint64_t)qword_10005A7E0);
    uint64_t v65 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v69 = swift_slowAlloc(32LL, -1LL);
      v93[0] = v69;
      *(_DWORD *)uint64_t v68 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v92 = sub_10000B540(v89, a2, v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v68 + 4, v68 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v66,  v67,  "Failed at getting app extension process for bundle: %s",  v68,  0xCu);
      swift_arrayDestroy(v69, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v69, -1LL, -1LL);
      swift_slowDealloc(v68, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    (*(void (**)(_BYTE *, uint64_t))(v57 + 8))(v26, v56);
  }

  else
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v47 = type metadata accessor for Logger(0LL);
    sub_10000C538(v47, (uint64_t)qword_10005A7E0);
    uint64_t v48 = swift_bridgeObjectRetain_n(a2, 2LL);
    unint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
    os_log_type_t v50 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v52 = swift_slowAlloc(32LL, -1LL);
      v93[0] = v52;
      *(_DWORD *)uint64_t v51 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v92 = sub_10000B540(v89, a2, v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v51 + 4, v51 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v49,  v50,  "No extension identifier available in registry: %s",  v51,  0xCu);
      swift_arrayDestroy(v52, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1LL, -1LL);
      swift_slowDealloc(v51, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }
  }

  unint64_t v71 = v90;
  uint64_t v70 = v91;
  uint64_t v72 = type metadata accessor for _AppExtensionProcess(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56LL))(v70, 1LL, 1LL, v72);
LABEL_27:
  os_unfair_lock_unlock(v71);
}

void sub_10000DA98(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = sub_10000B4F4(&qword_1000594B8);
  __chkstk_darwin(v15);
  uint64_t v8 = type metadata accessor for SHA256(0LL);
  __chkstk_darwin(v8);
  uint64_t v14 = type metadata accessor for SHA256Digest(0LL);
  __chkstk_darwin(v14);
  swift_bridgeObjectRetain(a2);
  v9._countAndFlagsBits = 58LL;
  v9._object = (void *)0xE100000000000000LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = a3;
  v10._object = a4;
  String.append(_:)(v10);
  sub_10000DF2C(a1, a2);
  uint64_t v12 = v11;
  uint64_t v13 = sub_100005038( &qword_1000594C0,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256,  (uint64_t)&protocol conformance descriptor for SHA256);
  dispatch thunk of HashFunction.init()(v8, v13);
  __asm { BR              X10 }

uint64_t sub_10000DC1C()
{
  *(void *)(v7 - 104) = v6;
  *(_WORD *)(v7 - 96) = v0;
  *(_BYTE *)(v7 - 94) = BYTE2(v0);
  *(_BYTE *)(v7 - 93) = BYTE3(v0);
  *(_BYTE *)(v7 - 92) = BYTE4(v0);
  *(_BYTE *)(v7 - 91) = BYTE5(v0);
  dispatch thunk of HashFunction.update(bufferPointer:)(v7 - 104, v7 - 104 + BYTE6(v0), v4, v3);
  sub_10000C5C4(v6, v0);
  uint64_t v8 = *(void *)(v7 - 144);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v4, v3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 136) + 8LL))(v5, v4);
  sub_10000C5C4(v6, v0);
  uint64_t v9 = *(void *)(v7 - 120);
  (*(void (**)(void *, uint64_t, uint64_t))(v9 + 16))(v2, v1, v8);
  *(void *)((char *)v2 + *(int *)(*(void *)(v7 - 128) + 36LL)) = 16LL;
  uint64_t v10 = sub_10000E9AC(v2);
  sub_10000C7CC((uint64_t)v2, &qword_1000594B8);
  if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0) {
    uint64_t v10 = (uint64_t)sub_10000E794((void *)v10);
  }
  unint64_t v11 = *(void *)(v10 + 16);
  if (v11 < 7)
  {
    __break(1u);
    goto LABEL_7;
  }

  *(_BYTE *)(v10 + 38) = *(_BYTE *)(v10 + 38) & 0xF | 0x50;
  if (v11 < 9)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x10000DEB8LL);
  }

  *(_BYTE *)(v10 + 40) = *(_BYTE *)(v10 + 40) & 0x3F | 0x80;
  id v12 = [objc_allocWithZone(NSUUID) initWithUUIDBytes:v10 + 32];
  swift_bridgeObjectRelease(v10);
  ((void (*)(id))static UUID._unconditionallyBridgeFromObjectiveC(_:))(v12);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v1, v8);
}

uint64_t sub_10000DED0()
{
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t type metadata accessor for ExtensionKitRegistry()
{
  return objc_opt_self(&OBJC_CLASS____TtC7mlhostd20ExtensionKitRegistry);
}

uint64_t sub_10000DF2C(uint64_t a1, unint64_t a2)
{
  *(void *)&__int128 v19 = a1;
  *((void *)&v19 + 1) = a2;
  swift_bridgeObjectRetain(a2);
  uint64_t v2 = sub_10000B4F4(&qword_1000594D0);
  if (!swift_dynamicCast(v17, &v19, &type metadata for String.UTF8View, v2, 6LL))
  {
    uint64_t v18 = 0LL;
    memset(v17, 0, sizeof(v17));
    sub_10000C7CC((uint64_t)v17, &qword_1000594D8);
    if ((a2 & 0x1000000000000000LL) != 0) {
      goto LABEL_20;
    }
    if ((a2 & 0x2000000000000000LL) != 0)
    {
      v20[0] = a1;
      v20[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v7 = (char *)v20 + (HIBYTE(a2) & 0xF);
      uint64_t v8 = v20;
    }

    else
    {
      if ((a1 & 0x1000000000000000LL) != 0)
      {
        uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
      }

      else
      {
        uint64_t v5 = _StringObject.sharedUTF8.getter(a1, a2);
      }

      if (v5) {
        uint64_t v7 = (_BYTE *)(v5 + v6);
      }
      else {
        uint64_t v7 = 0LL;
      }
      uint64_t v8 = (_BYTE *)v5;
    }

    uint64_t v9 = sub_10000F294(v8, v7);
    unint64_t v11 = v10;
    if (v10 >> 60 != 15)
    {
      swift_bridgeObjectRelease(a2);
      *(void *)&v17[0] = v9;
      *((void *)&v17[0] + 1) = v11;
      return *(void *)&v17[0];
    }

    if ((a2 & 0x1000000000000000LL) != 0)
    {
LABEL_20:
      Swift::Int v12 = String.UTF8View._foreignCount()();
    }

    else if ((a2 & 0x2000000000000000LL) != 0)
    {
      Swift::Int v12 = HIBYTE(a2) & 0xF;
    }

    else
    {
      Swift::Int v12 = a1 & 0xFFFFFFFFFFFFLL;
    }

    *(void *)&v17[0] = sub_10000F2F8(v12);
    *((void *)&v17[0] + 1) = v13;
    __chkstk_darwin(*(void *)&v17[0]);
    sub_10000E430();
    __asm { BR              X12 }
  }

  sub_10000F3F0(v17, (uint64_t)v20);
  uint64_t v3 = v21;
  uint64_t v4 = v22;
  sub_10000C6DC(v20, v21);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)( &v19,  sub_10000E720,  0LL,  &type metadata for Data._Representation,  v3,  v4);
  swift_bridgeObjectRelease(a2);
  v17[0] = v19;
  sub_10000C550(v20);
  return *(void *)&v17[0];
}

void sub_10000E430()
{
  __asm { BR              X11 }

void *sub_10000E490@<X0>(uint64_t a1@<X8>)
{
  void *(*v3)(void **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  void *result;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  unint64_t v10 = BYTE4(a1);
  unint64_t v11 = BYTE5(a1);
  Swift::Int v12 = BYTE6(a1);
  uint64_t result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2) {
    uint64_t result = v7;
  }
  uint64_t v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  void *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_10000E720@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    uint64_t result = (_BYTE *)sub_10000F0DC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (_BYTE *)sub_10000F19C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t result = (_BYTE *)sub_10000F214((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

void *sub_10000E794(void *a1)
{
  return sub_10001A330(0LL, a1[2], 0, a1);
}

void *sub_10000E7A8( void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }

  uint64_t result = a1(&v6, 0LL, 0LL);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_10000E80C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }

  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }

  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

void (*sub_10000E8B8( void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000E938(v6, a2, a3);
  return sub_10000E90C;
}

void sub_10000E90C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_10000E938(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_10000E9A4;
  }

  __break(1u);
  return result;
}

void sub_10000E9A4(id *a1)
{
}

uint64_t sub_10000E9AC(void *a1)
{
  uint64_t v3 = type metadata accessor for SHA256Digest(0LL);
  __chkstk_darwin(v3);
  (*(void (**)(char *, void *, uint64_t))(v5 + 16))( (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v3);
  uint64_t v6 = sub_100005038( &qword_1000594C8,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256Digest,  (uint64_t)&protocol conformance descriptor for SHA256Digest);
  dispatch thunk of Sequence.makeIterator()(&v31, v3, v6);
  uint64_t result = sub_10000B4F4(&qword_1000594B8);
  uint64_t v8 = *(void *)((char *)a1 + *(int *)(result + 36));
  uint64_t v9 = v31;
  if (!v8 || (unint64_t v10 = v32, v11 = *(void *)(v31 + 16), v32 == v11))
  {
    uint64_t result = swift_bridgeObjectRelease(v31);
    size_t v1 = 0LL;
    a1 = _swiftEmptyArrayStorage;
    goto LABEL_27;
  }

  if ((v32 & 0x8000000000000000LL) == 0)
  {
    if (v32 < *(void *)(v31 + 16))
    {
      size_t v1 = 0LL;
      a1 = _swiftEmptyArrayStorage;
      uint64_t v12 = v8 - 1;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      uint64_t v14 = v11 - 1;
      uint64_t v30 = v14;
      while (1)
      {
        char v15 = *(_BYTE *)(v9 + v10 + 32);
        if (!v1)
        {
          unint64_t v16 = a1[3];
          int64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
          if (v17 <= 1) {
            uint64_t v18 = 1LL;
          }
          else {
            uint64_t v18 = v17;
          }
          uint64_t v19 = sub_10000B4F4(&qword_100059278);
          uint64_t v20 = (void *)swift_allocObject(v19, v18 + 32, 7LL);
          size_t v21 = 2 * j__malloc_size(v20) - 64;
          v20[2] = v18;
          void v20[3] = v21;
          unint64_t v22 = (unint64_t)(v20 + 4);
          size_t v23 = a1[3] >> 1;
          if (a1[2])
          {
            a1[2] = 0LL;
          }

          uint64_t v13 = (_BYTE *)(v22 + v23);
          size_t v1 = (v21 >> 1) - v23;
          uint64_t result = swift_release(a1);
          a1 = v20;
          uint64_t v14 = v30;
        }

        BOOL v25 = __OFSUB__(v1--, 1LL);
        if (v25) {
          break;
        }
        *uint64_t v13 = v15;
        if (!v12 || v14 == v10) {
          goto LABEL_26;
        }
        ++v10;
        ++v13;
        --v12;
        if (v10 >= *(void *)(v9 + 16)) {
          goto LABEL_25;
        }
      }

      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }

uint64_t sub_10000EBF0(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v5 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v5 += a1 - result;
  }

  BOOL v6 = __OFSUB__(a2, a1);
  uint64_t v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v8 = __DataStorage._length.getter();
  if (v8 >= v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = v5 + v9;
  if (v5) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0LL;
  }
  uint64_t v12 = type metadata accessor for SHA256(0LL);
  uint64_t v13 = sub_100005038( &qword_1000594C0,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256,  (uint64_t)&protocol conformance descriptor for SHA256);
  return dispatch thunk of HashFunction.update(bufferPointer:)(v5, v11, v12, v13);
}

uint64_t sub_10000ECB4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v8 = *a3;
    uint64_t v7 = a3[1];
    swift_bridgeObjectRetain(v7);
    uint64_t result = _StringGuts.copyUTF8(into:)(v5, a2, v8, v7);
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = result;
      uint64_t result = swift_bridgeObjectRelease(v7);
      *a4 = 0LL;
      a4[1] = 0xE000000000000000LL;
      a4[2] = 15LL;
      a4[3] = v10;
      return result;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

void *sub_10000ED3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0LL;
      while ((a1 & 0xC000000000000001LL) != 0)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1LL)) {
          goto LABEL_21;
        }
        uint64_t v10 = v5;
        id v11 = [v7 extensionPointIdentifier];
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          uint64_t v17 = swift_bridgeObjectRelease(a3);
LABEL_17:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
          uint64_t v18 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
          uint64_t v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v8);
          specialized ContiguousArray._endMutation()(v19);
          goto LABEL_5;
        }

        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, a2, a3, 0LL);
        uint64_t v17 = swift_bridgeObjectRelease(v14);
        if ((v16 & 1) != 0) {
          goto LABEL_17;
        }

LABEL_5:
        ++v6;
        uint64_t v5 = v10;
        if (v9 == v10) {
          return _swiftEmptyArrayStorage;
        }
      }

      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      if (a1 < 0) {
        uint64_t v21 = a1;
      }
      else {
        uint64_t v21 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v21);
      if (!v5) {
        return _swiftEmptyArrayStorage;
      }
    }

    id v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }

  return _swiftEmptyArrayStorage;
}

void *sub_10000EEF4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = a1;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v8)
  {
    uint64_t v23 = v4;
    uint64_t v24 = v7;
    unint64_t v25 = v7 & 0xC000000000000001LL;
    uint64_t v4 = 4LL;
    while (1)
    {
      uint64_t v9 = v4 - 4;
      if (!v25) {
        break;
      }
      id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v7);
      uint64_t v11 = v4 - 3;
      if (__OFADD__(v9, 1LL)) {
        goto LABEL_20;
      }
LABEL_9:
      uint64_t v12 = v8;
      uint64_t v13 = v10;
      uint64_t v14 = a3;
      id v15 = objc_msgSend(v10, "bundleIdentifier", v23);
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      uint64_t v18 = v17;

      a3 = v14;
      BOOL v19 = v16 == a2 && v18 == v14;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
LABEL_19:
        swift_bridgeObjectRelease(a3);
        return v13;
      }

      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, a2, v14, 0LL);
      swift_bridgeObjectRelease(v18);
      if ((v20 & 1) != 0)
      {
        a3 = v24;
        goto LABEL_19;
      }

      ++v4;
      uint64_t v8 = v12;
      BOOL v19 = v11 == v12;
      uint64_t v7 = v24;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
        return 0LL;
      }
    }

    id v10 = *(id *)(v7 + 8 * v4);
    uint64_t v11 = v4 - 3;
    if (!__OFADD__(v9, 1LL)) {
      goto LABEL_9;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    if (v7 < 0) {
      uint64_t v21 = v7;
    }
    else {
      uint64_t v21 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v21);
  }

  swift_bridgeObjectRelease(v7);
  return 0LL;
}

uint64_t sub_10000F098(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000F0DC(_BYTE *__src, _BYTE *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_10000F19C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = a2 - a1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = type metadata accessor for Data.RangeReference(0LL);
    uint64_t result = swift_allocObject(v6, 32LL, 7LL);
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = v3;
  }

  return result;
}

uint64_t sub_10000F214(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = a2 - a1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if ((v3 & 0x80000000) == 0) {
    return v3 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_10000F294(_BYTE *result, _BYTE *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0LL;
    }

    else if (v2 <= 14)
    {
      return (_BYTE *)sub_10000F0DC(result, a2);
    }

    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_10000F19C((uint64_t)result, (uint64_t)a2);
    }

    else
    {
      return (_BYTE *)sub_10000F214((uint64_t)result, (uint64_t)a2);
    }
  }

  return result;
}

uint64_t sub_10000F2F8(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0LL;
      }
    }

    else
    {
      uint64_t v2 = type metadata accessor for __DataStorage(0LL);
      swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
      __DataStorage.init(length:)(v1);
      if (v1 >= 0x7FFFFFFF)
      {
        uint64_t v3 = type metadata accessor for Data.RangeReference(0LL);
        uint64_t result = swift_allocObject(v3, 32LL, 7LL);
        *(void *)(result + 16) = 0LL;
        *(void *)(result + 24) = v1;
      }

      else
      {
        return v1 << 32;
      }
    }
  }

  return result;
}

void *sub_10000F394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_10000E7A8( (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10000F408,  (uint64_t)v12,  a1,  a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_10000F3F0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000F408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_10000ECB4(a1, a2, *(uint64_t **)(v3 + 16), a3);
}

unint64_t sub_10000F424()
{
  unint64_t result = qword_1000592A0;
  if (!qword_1000592A0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS____EXExtensionIdentity);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000592A0);
  }

  return result;
}

uint64_t sub_10000F460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for MLHostTask(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1LL, v11) == 1)
  {
    sub_10000C7CC(a1, &qword_1000595E8);
    sub_10001A648(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease(a3);
    return sub_10000C7CC((uint64_t)v10, &qword_1000595E8);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v19 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    sub_10002D118((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t v17 = *v4;
    *uint64_t v4 = v19;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v17);
  }

uint64_t sub_10000F5D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
      uint64_t v11 = (void *)(v10 + 16 * v8);
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

unint64_t sub_10000F708()
{
  uint64_t v0 = sub_10000B4F4(&qword_100059630);
  uint64_t inited = swift_initStackObject(v0, v4);
  *(_OWORD *)(inited + 16) = xmmword_100040D00;
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 32) = NSFilePosixPermissions;
  *(void *)(inited + 40) = 448LL;
  __int128 v2 = NSFilePosixPermissions;
  unint64_t result = sub_10001E9E4(inited);
  qword_1000594E8 = result;
  return result;
}

uint64_t sub_10000F780(uint64_t a1, char *a2, char *a3)
{
  os_unfair_lock_t v90 = a2;
  uint64_t v92 = a3;
  *(void *)&__int128 v91 = a1;
  uint64_t v3 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v86 = *(void *)(v3 - 8);
  uint64_t v4 = v86;
  __chkstk_darwin(v3);
  Swift::Int v6 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v85 - v15;
  uint64_t v88 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v88(v9, 1LL, 1LL, v10);
  uint64_t v17 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v18(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v3);
  int64_t v85 = v18;
  BOOL v19 = v90;
  __n128 v20 = swift_bridgeObjectRetain(v90);
  URL.init(filePath:directoryHint:relativeTo:)(v91, v19, v6, v9, v20);
  v94 = (void (*)(char *, uint64_t, uint64_t, uint64_t))0xD00000000000001BLL;
  unint64_t v95 = 0x800000010004A290LL;
  v18(v6, v17, v3);
  unint64_t v87 = sub_10001E080();
  URL.appending<A>(path:directoryHint:)(&v94, v6, &type metadata for String, v87);
  uint64_t v86 = *(void *)(v86 + 8);
  ((void (*)(char *, uint64_t))v86)(v6, v3);
  swift_bridgeObjectRelease(v95);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v14, v10);
  Swift::String v22 = URL.path(percentEncoded:)(0);
  v21(v16, v10);
  uint64_t v23 = v89;
  *(Swift::String *)(v89 + 24) = v22;
  uint64_t v24 = v23;
  v88(v9, 1LL, 1LL, v10);
  unint64_t v25 = v85;
  v26.n128_f64[0] = ((double (*)(char *, uint64_t, uint64_t))v85)(v6, v17, v3);
  URL.init(filePath:directoryHint:relativeTo:)(v91, v90, v6, v9, v26);
  v94 = (void (*)(char *, uint64_t, uint64_t, uint64_t))0xD00000000000001FLL;
  unint64_t v95 = 0x800000010004A2B0LL;
  v25(v6, v17, v3);
  URL.appending<A>(path:directoryHint:)(&v94, v6, &type metadata for String, v87);
  ((void (*)(char *, uint64_t))v86)(v6, v3);
  swift_bridgeObjectRelease(v95);
  v21(v14, v10);
  Swift::String v27 = URL.path(percentEncoded:)(0);
  v21(v16, v10);
  *(Swift::String *)(v24 + 40) = v27;
  uint64_t v28 = sub_10000B4F4(&qword_1000592D0);
  uint64_t v29 = swift_allocObject(v28, 20LL, 7LL);
  *(_DWORD *)(v29 + 16) = 0;
  *(void *)(v24 + 56) = v29;
  uint64_t v30 = (void (*)(char *, uint64_t, uint64_t, uint64_t))_swiftEmptyArrayStorage;
  *(void *)(v24 + 64) = sub_10001EB10((uint64_t)_swiftEmptyArrayStorage);
  id v31 = (id)((uint64_t (*)(void))BiomeLibrary)();
  id v32 = [v31 Lighthouse];
  swift_unknownObjectRelease(v31);
  id v33 = [v32 Ledger];
  swift_unknownObjectRelease(v32);
  id v34 = [v33 TaskStatus];
  uint64_t v35 = swift_unknownObjectRelease(v33);
  *(void *)(v24 + 72) = v34;
  id v36 = (id)BiomeLibrary(v35);
  int v37 = v92;
  id v38 = [v36 Lighthouse];
  swift_unknownObjectRelease(v36);
  id v39 = [v38 Ledger];
  swift_unknownObjectRelease(v38);
  id v40 = [v39 TaskError];
  swift_unknownObjectRelease(v39);
  *(void *)(v24 + 80) = v40;
  uint64_t v42 = *((void *)v37 + 2);
  if (!v42) {
    goto LABEL_21;
  }
  unint64_t v43 = 0LL;
  uint64_t v44 = v37 + 40;
  unint64_t v87 = v42 - 1;
  *(void *)&__int128 v41 = 136315138LL;
  __int128 v91 = v41;
  os_unfair_lock_t v90 = (char *)&type metadata for Any + 8;
  do
  {
    uint64_t v88 = v30;
    os_log_t v45 = (unint64_t *)&v44[16 * v43];
    unint64_t v46 = v43;
    while (1)
    {
      if (v46 >= *((void *)v37 + 2))
      {
        __break(1u);
        goto LABEL_32;
      }

      uint64_t v48 = *(v45 - 1);
      unint64_t v47 = *v45;
      char v93 = 1;
      unint64_t v49 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
      id v39 = objc_msgSend(v49, "defaultManager", swift_bridgeObjectRetain(v47).n128_f64[0]);
      NSString v50 = String._bridgeToObjectiveC()();
      unsigned int v51 = [v39 fileExistsAtPath:v50 isDirectory:&v93];

      if (!v51)
      {
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v52 = type metadata accessor for Logger(0LL);
        sub_10000C538(v52, (uint64_t)qword_10005A7E0);
        uint64_t v53 = swift_bridgeObjectRetain_n(v47, 2LL);
        id v39 = (id)Logger.logObject.getter(v53);
        os_log_type_t v54 = static os_log_type_t.error.getter();
        if (os_log_type_enabled((os_log_t)v39, v54))
        {
          uint64_t v55 = swift_slowAlloc(12LL, -1LL);
          uint64_t v56 = swift_slowAlloc(32LL, -1LL);
          uint64_t v96 = v56;
          *(_DWORD *)uint64_t v55 = v91;
          swift_bridgeObjectRetain(v47);
          *(void *)(v55 + 4) = sub_10000B540(v48, v47, &v96);
          swift_bridgeObjectRelease_n(v47, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v39,  v54,  "Skipping staticTask folder %s because doesn't exist.",  (uint8_t *)v55,  0xCu);
          swift_arrayDestroy(v56, 1LL, v90);
          swift_slowDealloc(v56, -1LL, -1LL);
          swift_slowDealloc(v55, -1LL, -1LL);
          swift_bridgeObjectRelease(v47);
        }

        else
        {

          swift_bridgeObjectRelease_n(v47, 3LL);
        }

        goto LABEL_5;
      }

      if ((v93 & 1) != 0) {
        break;
      }
      swift_bridgeObjectRelease(v47);
LABEL_5:
      int v37 = v92;
      ++v46;
      v45 += 2;
      if (v42 == v46)
      {
        uint64_t v30 = v88;
        goto LABEL_21;
      }
    }

    uint64_t v30 = v88;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v88);
    v94 = v30;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10001B15C(0, *((void *)v30 + 2) + 1LL, 1);
      uint64_t v30 = v94;
    }

    unint64_t v59 = *((void *)v30 + 2);
    unint64_t v58 = *((void *)v30 + 3);
    id v39 = (id)(v59 + 1);
    if (v59 >= v58 >> 1)
    {
      sub_10001B15C(v58 > 1, v59 + 1, 1);
      uint64_t v30 = v94;
    }

    unint64_t v43 = v46 + 1;
    *((void *)v30 + 2) = v39;
    uint64_t v60 = (void *)((char *)v30 + 16 * v59);
    v60[4] = v48;
    v60[5] = v47;
    int v37 = v92;
  }

  while (v87 != v46);
LABEL_21:
  swift_bridgeObjectRelease(v37);
  uint64_t v61 = v89;
  *(void *)(v89 + 16) = v30;
  id v39 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
  uint64_t v44 = (char *)[v39 defaultManager];
  uint64_t v62 = *(void *)(v61 + 32);
  swift_bridgeObjectRetain(v62);
  int v37 = (char *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v62);
  if (qword_100058F60 != -1) {
LABEL_32:
  }
    swift_once(&qword_100058F60, sub_10000F708);
  type metadata accessor for FileAttributeKey(0LL);
  sub_100005038( &qword_100059038,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10004095C);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v94 = 0LL;
  unsigned __int8 v64 = [v44 createDirectoryAtPath:v37 withIntermediateDirectories:1 attributes:isa error:&v94];

  uint64_t v65 = v94;
  if ((v64 & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v66 = v94;
  id v67 = [v39 defaultManager];
  uint64_t v68 = *(void *)(v89 + 48);
  swift_bridgeObjectRetain(v68);
  NSString v69 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v68);
  Class v70 = Dictionary._bridgeToObjectiveC()().super.isa;
  v94 = 0LL;
  unsigned int v71 = [v67 createDirectoryAtPath:v69 withIntermediateDirectories:1 attributes:v70 error:&v94];

  uint64_t v65 = v94;
  if (v71)
  {
    uint64_t v72 = v94;
  }

  else
  {
LABEL_25:
    uint64_t v73 = v65;
    uint64_t v74 = _convertNSErrorToError(_:)(v65);

    swift_willThrow(v75);
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v76 = type metadata accessor for Logger(0LL);
    sub_10000C538(v76, (uint64_t)qword_10005A7E0);
    swift_errorRetain(v74);
    uint64_t v77 = swift_errorRetain(v74);
    uint64_t v78 = (os_log_s *)Logger.logObject.getter(v77);
    os_log_type_t v79 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v81 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v80 = 138412290;
      swift_errorRetain(v74);
      uint64_t v82 = (void (*)(char *, uint64_t, uint64_t, uint64_t))_swift_stdlib_bridgeErrorToNSError(v74);
      v94 = v82;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, &v95, v80 + 4, v80 + 12);
      *id v81 = v82;
      swift_errorRelease(v74);
      swift_errorRelease(v74);
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "Failed at creating folder: %@", v80, 0xCu);
      uint64_t v83 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy((void (**)(char *, uint64_t, uint64_t, uint64_t))v81, 1LL, v83);
      swift_slowDealloc((void (**)(char *, uint64_t, uint64_t, uint64_t))v81, -1LL, -1LL);
      swift_slowDealloc(v80, -1LL, -1LL);

      swift_errorRelease(v74);
    }

    else
    {
      swift_errorRelease(v74);
      swift_errorRelease(v74);
      swift_errorRelease(v74);
    }
  }

  return v89;
}

uint64_t sub_1000101EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  v24[0] = 0LL;
  v24[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(49LL);
  uint64_t v3 = _typeName(_:qualified:)(v2, 0LL);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v25 = v3;
  uint64_t v26 = v5;
  v6._countAndFlagsBits = 0x203A736B73617428LL;
  v6._object = (void *)0xE800000000000000LL;
  String.append(_:)(v6);
  uint64_t v7 = (os_unfair_lock_s *)(v0[7] + 16LL);
  os_unfair_lock_lock(v7);
  swift_beginAccess(v1 + 8, v24, 0LL, 0LL);
  os_unfair_lock_unlock(v7);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(object);
  v10._countAndFlagsBits = 0x636974617473202CLL;
  v10._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v10);
  uint64_t v11 = v1[2];
  uint64_t v12 = swift_bridgeObjectRetain(v11);
  v13._countAndFlagsBits = Array.description.getter(v12, &type metadata for String);
  uint64_t v14 = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  v15._countAndFlagsBits = 0x696D616E7964202CLL;
  v15._object = (void *)0xEB00000000203A63LL;
  String.append(_:)(v15);
  uint64_t v16 = v1[3];
  uint64_t v17 = (void *)v1[4];
  swift_bridgeObjectRetain(v17);
  v18._countAndFlagsBits = v16;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v17);
  v19._countAndFlagsBits = 0x737465737361202CLL;
  v19._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v19);
  uint64_t v21 = v1[5];
  __n128 v20 = (void *)v1[6];
  swift_bridgeObjectRetain(v20);
  v22._countAndFlagsBits = v21;
  v22._object = v20;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v20);
  return v25;
}

void *sub_1000103B8()
{
  id v0 = [(id)objc_opt_self(NSFileManager) defaultManager];
  NSString v1 = String._bridgeToObjectiveC()();
  id v21 = 0LL;
  id v2 = [v0 contentsOfDirectoryAtPath:v1 error:&v21];

  id v3 = v21;
  if (v2)
  {
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);
    id v5 = v3;

    uint64_t v6 = *(void *)(v4 + 16);
    if (v6)
    {
      uint64_t v7 = (void *)(v4 + 40);
      Swift::String v8 = _swiftEmptyArrayStorage;
      do
      {
        uint64_t v10 = *(v7 - 1);
        uint64_t v9 = *v7;
        swift_bridgeObjectRetain(*v7);
        v11._countAndFlagsBits = 0x7473696C702ELL;
        v11._object = (void *)0xE600000000000000LL;
        if (String.hasSuffix(_:)(v11))
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
          id v21 = v8;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10001B15C(0, v8[2] + 1LL, 1);
            Swift::String v8 = v21;
          }

          unint64_t v14 = v8[2];
          unint64_t v13 = v8[3];
          if (v14 >= v13 >> 1)
          {
            sub_10001B15C(v13 > 1, v14 + 1, 1);
            Swift::String v8 = v21;
          }

          v8[2] = v14 + 1;
          Swift::String v15 = &v8[2 * v14];
          v15[4] = v10;
          v15[5] = v9;
        }

        else
        {
          swift_bridgeObjectRelease(v9);
        }

        v7 += 2;
        --v6;
      }

      while (v6);
    }

    else
    {
      Swift::String v8 = _swiftEmptyArrayStorage;
    }

    swift_bridgeObjectRelease(v4);
    uint64_t v19 = sub_10002EF58((uint64_t)v8);
    swift_release(v8);
  }

  else
  {
    id v16 = v21;
    uint64_t v17 = _convertNSErrorToError(_:)(v3);

    swift_willThrow(v18);
    swift_errorRelease(v17);
    return &_swiftEmptySetSingleton;
  }

  return (void *)v19;
}

uint64_t sub_1000105C0()
{
  id v1 = [*(id *)(v0 + 72) pruner];
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t v12 = sub_1000107A0;
  uint64_t v13 = 0LL;
  Swift::String v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256LL;
  uint64_t v10 = sub_10001E418;
  Swift::String v11 = &unk_100055D18;
  id v3 = _Block_copy(&v8);
  swift_release(v13);
  [v1 deleteWithPolicy:v2 eventsPassingTest:v3];

  _Block_release(v3);
  uint64_t result = swift_isEscapingClosureAtFileLocation(0LL, "", 85LL, 114LL, 66LL, 1LL);
  if ((result & 1) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }

  id v5 = [*(id *)(v0 + 80) pruner];
  NSString v6 = String._bridgeToObjectiveC()();
  uint64_t v12 = sub_1000107A0;
  uint64_t v13 = 0LL;
  Swift::String v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256LL;
  uint64_t v10 = sub_1000107A8;
  Swift::String v11 = &unk_100055D40;
  uint64_t v7 = _Block_copy(&v8);
  swift_release(v13);
  [v5 deleteWithPolicy:v6 eventsPassingTest:v7];

  _Block_release(v7);
  uint64_t result = swift_isEscapingClosureAtFileLocation(0LL, "", 85LL, 118LL, 65LL, 1LL);
  if ((result & 1) != 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_1000107A0()
{
  return 1LL;
}

uint64_t sub_1000107A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  id v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

uint64_t sub_1000107FC(uint64_t a1)
{
  NSString v2 = (uint64_t *)(a1 + 64);
  swift_beginAccess(a1 + 64, v8, 33LL, 0LL);
  uint64_t v3 = *(void *)(a1 + 64);
  if (*(void *)(v3 + 16))
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
    uint64_t v7 = *v2;
    *NSString v2 = 0x8000000000000000LL;
    sub_10000B4F4(&qword_100059658);
    _NativeDictionary.removeAll(isUnique:)(isUniquelyReferenced_nonNull_native);
    uint64_t v5 = *v2;
    *NSString v2 = v7;
    swift_bridgeObjectRelease(v5);
  }

  return swift_endAccess(v8);
}

uint64_t sub_1000108A0(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v122 = *(void *)(v5 - 8);
  uint64_t v123 = v5;
  __chkstk_darwin(v5);
  v121 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v7);
  uint64_t v117 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = type metadata accessor for URL(0LL);
  uint64_t v125 = *(void *)(v120 - 8);
  uint64_t v9 = __chkstk_darwin(v120);
  v118 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v119 = (char *)&v109 - v11;
  uint64_t v12 = type metadata accessor for TaskType(0LL);
  uint64_t v124 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  Swift::String v15 = (char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v109 - v16;
  uint64_t v18 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v18);
  __n128 v20 = (char *)&v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for MLHostTask(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  __int128 v127 = (char *)&v109 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = (os_unfair_lock_s *)(*(void *)(v2 + 56) + 16LL);
  os_unfair_lock_lock(v24);
  swift_beginAccess(v2 + 64, &v131, 32LL, 0LL);
  uint64_t v126 = v2;
  uint64_t v25 = *(void *)(v2 + 64);
  if (*(void *)(v25 + 16))
  {
    swift_bridgeObjectRetain(a2);
    unint64_t v26 = sub_10002BC00(a1, a2);
    if ((v27 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))( v20,  *(void *)(v25 + 56) + *(void *)(v22 + 72) * v26,  v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v20, 0LL, 1LL, v21);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1LL, 1LL, v21);
    }

    swift_bridgeObjectRelease(a2);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1LL, 1LL, v21);
  }

  swift_endAccess(&v131);
  os_unfair_lock_unlock(v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1LL, v21) == 1)
  {
    sub_10000C7CC((uint64_t)v20, &qword_1000595E8);
LABEL_22:
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v73 = type metadata accessor for Logger(0LL);
    sub_10000C538(v73, (uint64_t)qword_10005A7E0);
    uint64_t v74 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v75 = (os_log_s *)Logger.logObject.getter(v74);
    os_log_type_t v76 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v78 = (void *)swift_slowAlloc(32LL, -1LL);
      id v131 = v78;
      *(_DWORD *)uint64_t v77 = 136315138;
      swift_bridgeObjectRetain(a2);
      id v129 = (id)sub_10000B540(a1, a2, (uint64_t *)&v131);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130, v77 + 4, v77 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "DynamicTask %s not found in registry.", v77, 0xCu);
      swift_arrayDestroy(v78, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1LL, -1LL);
      swift_slowDealloc(v77, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    return 0LL;
  }

  v111 = v24;
  uint64_t v28 = v127;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v127, v20, v21);
  uint64_t v29 = v22;
  uint64_t v30 = sub_1000103B8();
  swift_bridgeObjectRetain(a2);
  uint64_t v115 = a1;
  uint64_t v113 = (void *)sub_10001C3BC((uint64_t)v30, a1, a2);
  unint64_t v32 = v31;
  unint64_t v116 = a2;
  swift_bridgeObjectRelease(a2);
  uint64_t v33 = swift_bridgeObjectRelease(v30);
  unint64_t v114 = v32;
  if (!v32)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v21);
    goto LABEL_21;
  }

  uint64_t v110 = v29;
  uint64_t v112 = v21;
  MLHostTask.taskType.getter(v33);
  uint64_t v34 = v124;
  (*(void (**)(char *, void, uint64_t))(v124 + 104))(v15, enum case for TaskType.dynamicTask(_:), v12);
  uint64_t v35 = sub_100005038( &qword_100059620,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskType,  (uint64_t)&protocol conformance descriptor for TaskType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v131, v12, v35);
  dispatch thunk of RawRepresentable.rawValue.getter(&v129, v12, v35);
  unint64_t v36 = v132;
  uint64_t v37 = v130[0];
  if (v131 != v129 || v132 != v130[0])
  {
    char v39 = _stringCompareWithSmolCheck(_:_:expecting:)(v131, v132, v129, v130[0], 0LL);
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v36);
    id v40 = *(void (**)(char *, uint64_t))(v34 + 8);
    v40(v15, v12);
    v40(v17, v12);
    if ((v39 & 1) != 0) {
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v110 + 8))(v28, v112);
    swift_bridgeObjectRelease(v114);
LABEL_21:
    a1 = v115;
    a2 = v116;
    goto LABEL_22;
  }

  swift_bridgeObjectRelease_n(v132, 2LL);
  id v38 = *(void (**)(char *, uint64_t))(v34 + 8);
  v38(v15, v12);
  v38(v17, v12);
LABEL_15:
  uint64_t v124 = 0LL;
  uint64_t v41 = *(void *)(v126 + 24);
  uint64_t v42 = *(void *)(v126 + 32);
  unint64_t v43 = v117;
  uint64_t v44 = v120;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v125 + 56))(v117, 1LL, 1LL, v120);
  uint64_t v45 = enum case for URL.DirectoryHint.inferFromPath(_:);
  unint64_t v47 = v121;
  uint64_t v46 = v122;
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v122 + 104);
  uint64_t v49 = v123;
  v48(v121, enum case for URL.DirectoryHint.inferFromPath(_:), v123);
  __n128 v50 = swift_bridgeObjectRetain(v42);
  unsigned int v51 = v118;
  URL.init(filePath:directoryHint:relativeTo:)(v41, v42, v47, v43, v50);
  unint64_t v52 = v114;
  id v131 = v113;
  unint64_t v132 = v114;
  v48(v47, v45, v49);
  unint64_t v53 = sub_10001E080();
  os_log_type_t v54 = v119;
  URL.appending<A>(path:directoryHint:)(&v131, v47, &type metadata for String, v53);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v49);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v125 + 8);
  v55(v51, v44);
  object = URL.path(percentEncoded:)(0)._object;
  v55(v54, v44);
  uint64_t v57 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  unint64_t v58 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  id v59 = [v57 defaultManager];
  NSString v60 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  id v131 = 0LL;
  LODWORD(object) = [v59 removeItemAtPath:v60 error:&v131];

  id v61 = v131;
  if (!(_DWORD)object) {
    goto LABEL_34;
  }
  uint64_t v62 = qword_100058F68;
  id v63 = v131;
  if (v62 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v64 = type metadata accessor for Logger(0LL);
  sub_10000C538(v64, (uint64_t)qword_10005A7E0);
  swift_bridgeObjectRetain(v52);
  uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
  os_log_type_t v67 = static os_log_type_t.info.getter();
  BOOL v68 = os_log_type_enabled(v66, v67);
  uint64_t v69 = v116;
  if (v68)
  {
    uint64_t v70 = v116;
    unsigned int v71 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v72 = (void *)swift_slowAlloc(32LL, -1LL);
    id v131 = v72;
    *(_DWORD *)unsigned int v71 = 136315138;
    swift_bridgeObjectRetain(v52);
    id v129 = (id)sub_10000B540((uint64_t)v113, v52, (uint64_t *)&v131);
    uint64_t v69 = v70;
    unint64_t v58 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130, v71 + 4, v71 + 12);
    swift_bridgeObjectRelease_n(v52, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Removed task definition: %s", v71, 0xCu);
    swift_arrayDestroy(v72, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v72, -1LL, -1LL);
    swift_slowDealloc(v71, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v52, 2LL);
  }

  uint64_t v80 = v112;
  id v81 = v111;
  uint64_t v82 = MLHostTask.taskFolder.getter();
  if (!v83) {
    goto LABEL_42;
  }
  uint64_t v84 = v82;
  unint64_t v52 = v83;
  id v85 = objc_msgSend(v57, (SEL)v58[42].opt_inst_meths);
  NSString v86 = String._bridgeToObjectiveC()();
  id v131 = 0LL;
  unsigned int v87 = [v85 removeItemAtPath:v86 error:&v131];

  id v61 = v131;
  if (!v87)
  {
LABEL_34:
    id v94 = v61;
    swift_bridgeObjectRelease(v52);
    unint64_t v95 = (void *)_convertNSErrorToError(_:)(v61);

    swift_willThrow(v96);
    id v131 = v95;
    uint64_t v97 = sub_10000B4F4(&qword_1000595D0);
    uint64_t v98 = sub_10000C654(0LL, &qword_1000595D8, &OBJC_CLASS___NSError_ptr);
    swift_dynamicCast(&v129, &v131, v97, v98, 0LL);
    v99 = v129;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v100 = type metadata accessor for Logger(0LL);
    sub_10000C538(v100, (uint64_t)qword_10005A7E0);
    id v101 = v99;
    uint64_t v102 = (os_log_s *)Logger.logObject.getter(v101);
    os_log_type_t v103 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v102, v103))
    {
      uint64_t v104 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v105 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v104 = 138412290;
      id v128 = v101;
      id v106 = v101;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, &v129, v104 + 4, v104 + 12);
      *uint64_t v105 = v101;

      _os_log_impl((void *)&_mh_execute_header, v102, v103, "Failed removing items: %@", v104, 0xCu);
      uint64_t v107 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v105, 1LL, v107);
      swift_slowDealloc(v105, -1LL, -1LL);
      swift_slowDealloc(v104, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v108 = v112;

    (*(void (**)(char *, uint64_t))(v110 + 8))(v127, v108);
    swift_errorRelease(v131);
    return 0LL;
  }

  id v88 = v131;
  swift_bridgeObjectRetain(v52);
  os_unfair_lock_t v90 = (os_log_s *)Logger.logObject.getter(v89);
  os_log_type_t v91 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v90, v91))
  {
    uint64_t v92 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    char v93 = (void *)swift_slowAlloc(32LL, -1LL);
    id v131 = v93;
    *(_DWORD *)uint64_t v92 = 136315138;
    swift_bridgeObjectRetain(v52);
    id v129 = (id)sub_10000B540(v84, v52, (uint64_t *)&v131);
    id v81 = v111;
    uint64_t v80 = v112;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130, v92 + 4, v92 + 12);
    swift_bridgeObjectRelease_n(v52, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v90, v91, "Removed task folder: %s", v92, 0xCu);
    swift_arrayDestroy(v93, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v93, -1LL, -1LL);
    swift_slowDealloc(v92, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v52, 2LL);
  }

LABEL_42:
  os_unfair_lock_lock(v81);
  sub_100011598(v126, v115, v69);
  os_unfair_lock_unlock(v81);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v127, v80);
  return 1LL;
}

uint64_t sub_100011598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v6);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  swift_beginAccess(a1 + 64, v11, 33LL, 0LL);
  sub_10001A648(a2, a3, (uint64_t)v8);
  swift_endAccess(v11);
  return sub_10000C7CC((uint64_t)v8, &qword_1000595E8);
}

void *sub_100011658()
{
  id v1 = sub_1000117B4();
  uint64_t v2 = v1;
  if (v1[2])
  {
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(v0 + 56) + 16LL);
    os_unfair_lock_lock(v3);
    sub_100012734((uint64_t)v2, v0);
    os_unfair_lock_unlock(v3);
    swift_bridgeObjectRetain(v2);
    uint64_t v4 = sub_10001C718(v0, v2);
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    swift_bridgeObjectRelease(v1);
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    uint64_t v6 = sub_10000C538(v5, (uint64_t)qword_10005A7E0);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "No task pruned. Skipping cleanup.", v9, 2u);
      swift_slowDealloc(v9, -1LL, -1LL);
    }

    return _swiftEmptyArrayStorage;
  }

  return v2;
}

void *sub_1000117B4()
{
  uint64_t v1 = sub_10000B4F4(&qword_1000595F8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v137 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v151 = type metadata accessor for Date(0LL);
  uint64_t v150 = *(void *)(v151 - 8);
  uint64_t v4 = __chkstk_darwin(v151);
  v143 = (char *)&v137 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  v145 = (char *)&v137 - v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v137 - v8;
  uint64_t v10 = sub_10000B4F4(&qword_100059600);
  __chkstk_darwin(v10);
  v161 = (char *)&v137 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v164 = *(void *)(v12 - 8);
  uint64_t v165 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  v142 = (char *)&v137 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  v163 = (char *)&v137 - v15;
  uint64_t v16 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v159 = *(void *)(v16 - 8);
  uint64_t v160 = v16;
  __chkstk_darwin(v16);
  v158 = (char *)&v137 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v18);
  v157 = (char *)&v137 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for URL(0LL);
  uint64_t v169 = *(void *)(v20 - 8);
  uint64_t v170 = v20;
  uint64_t v21 = __chkstk_darwin(v20);
  v156 = (char *)&v137 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  v155 = (char *)&v137 - v23;
  uint64_t v24 = sub_1000103B8();
  int64_t v26 = 0LL;
  uint64_t v147 = 0LL;
  uint64_t v27 = v24[7];
  v152 = (char *)(v24 + 7);
  v162 = v24;
  uint64_t v28 = 1LL << *((_BYTE *)v24 + 32);
  uint64_t v29 = -1LL;
  if (v28 < 64) {
    uint64_t v29 = ~(-1LL << v28);
  }
  unint64_t v30 = v29 & v27;
  int64_t v153 = (unint64_t)(v28 + 63) >> 6;
  unsigned int v154 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v139 = &v174;
  v140 = &v173;
  v138 = _swiftEmptyArrayStorage;
  v25.n128_u64[0] = 136315138LL;
  __n128 v146 = v25;
  v144 = (char *)&type metadata for Any + 8;
  v25.n128_u64[0] = 136315394LL;
  __n128 v141 = v25;
  uint64_t v171 = v0;
  v148 = v3;
  v149 = v9;
  if ((v29 & v27) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v167 = (v30 - 1) & v30;
  int64_t v168 = v26;
  for (unint64_t i = __clz(__rbit64(v30)) | (v26 << 6); ; unint64_t i = __clz(__rbit64(v34)) + (v33 << 6))
  {
    uint64_t v36 = v162[6] + 16 * i;
    id v38 = *(void **)v36;
    uint64_t v37 = *(void **)(v36 + 8);
    uint64_t v39 = *(void *)(v171 + 32);
    uint64_t v166 = *(void *)(v171 + 24);
    id v40 = v157;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v169 + 56))(v157, 1LL, 1LL, v170);
    uint64_t v42 = v158;
    uint64_t v41 = v159;
    unint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 104);
    uint64_t v44 = v154;
    uint64_t v45 = v160;
    v43(v158, v154, v160);
    swift_bridgeObjectRetain(v37);
    __n128 v46 = swift_bridgeObjectRetain(v39);
    unint64_t v47 = v156;
    uint64_t v48 = v40;
    unint64_t v49 = (unint64_t)v37;
    URL.init(filePath:directoryHint:relativeTo:)(v166, v39, v42, v48, v46);
    uint64_t v166 = (uint64_t)v38;
    v176[0] = v38;
    v176[1] = v37;
    v43(v42, v44, v45);
    unint64_t v50 = sub_10001E080();
    unsigned int v51 = v155;
    URL.appending<A>(path:directoryHint:)(v176, v42, &type metadata for String, v50);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v45);
    uint64_t v52 = v170;
    unint64_t v53 = *(void (**)(char *, uint64_t))(v169 + 8);
    v53(v47, v170);
    Swift::String v54 = URL.path(percentEncoded:)(1);
    v53(v51, v52);
    uint64_t v55 = v161;
    sub_100012BFC(v54._countAndFlagsBits, (unint64_t)v54._object, v161);
    uint64_t v56 = v164;
    uint64_t v57 = v165;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v164 + 48))(v55, 1LL, v165) == 1)
    {
      swift_bridgeObjectRelease(v54._object);
      sub_10000C7CC((uint64_t)v55, &qword_100059600);
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v58 = type metadata accessor for Logger(0LL);
      sub_10000C538(v58, (uint64_t)qword_10005A7E0);
      swift_bridgeObjectRetain(v37);
      NSString v60 = (os_log_s *)Logger.logObject.getter(v59);
      os_log_type_t v61 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = swift_slowAlloc(12LL, -1LL);
        id v63 = (void *)swift_slowAlloc(32LL, -1LL);
        v176[0] = v63;
        *(_DWORD *)uint64_t v62 = v146.n128_u32[0];
        swift_bridgeObjectRetain(v49);
        *(void *)(v62 + 4) = sub_10000B540(v166, v49, (uint64_t *)v176);
        swift_bridgeObjectRelease_n(v49, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v60, v61, "Found invalid definition file: %s", (uint8_t *)v62, 0xCu);
        swift_arrayDestroy(v63, 1LL, v144);
        swift_slowDealloc(v63, -1LL, -1LL);
        swift_slowDealloc(v62, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v49, 2LL);
      }

      goto LABEL_24;
    }

    uint64_t v64 = (*(uint64_t (**)(char *, char *, uint64_t))(v56 + 32))(v163, v55, v57);
    uint64_t v65 = (uint64_t)v148;
    TaskDefinition.endDate.getter(v64);
    uint64_t v66 = v150;
    uint64_t v67 = v151;
    int v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v65, 1LL, v151);
    uint64_t v69 = v149;
    if (v68 == 1)
    {
      sub_10000C7CC(v65, &qword_1000595F8);
    }

    else
    {
      uint64_t v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 32))(v149, v65, v67);
      unsigned int v71 = v145;
      static Date.now.getter(v70);
      char v72 = static Date.> infix(_:_:)(v69, v71);
      uint64_t v73 = v66;
      char v74 = v72;
      uint64_t v75 = *(void (**)(char *, uint64_t))(v73 + 8);
      v75(v71, v67);
      if ((v74 & 1) != 0)
      {
        swift_bridgeObjectRelease(v54._object);
        swift_bridgeObjectRelease(v37);
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v76 = type metadata accessor for Logger(0LL);
        sub_10000C538(v76, (uint64_t)qword_10005A7E0);
        uint64_t v77 = v164;
        uint64_t v78 = v142;
        uint64_t v79 = v165;
        (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v142, v163, v165);
        uint64_t v80 = v143;
        id v81 = v149;
        uint64_t v82 = (*(uint64_t (**)(char *, char *, uint64_t))(v150 + 16))(v143, v149, v67);
        unint64_t v83 = (os_log_s *)Logger.logObject.getter(v82);
        os_log_type_t v84 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v83, v84))
        {
          uint64_t v85 = swift_slowAlloc(22LL, -1LL);
          NSString v86 = (void *)swift_slowAlloc(64LL, -1LL);
          v176[0] = v86;
          __n128 v87 = v141;
          *(_DWORD *)uint64_t v85 = v141.n128_u32[0];
          uint64_t v88 = TaskDefinition.name.getter(v87);
          unint64_t v90 = v89;
          uint64_t v173 = sub_10000B540(v88, v89, (uint64_t *)v176);
          os_log_type_t v91 = v139;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, v139, v85 + 4, v85 + 12);
          swift_bridgeObjectRelease(v90);
          uint64_t v92 = *(void (**)(char *, uint64_t))(v77 + 8);
          v92(v142, v165);
          *(_WORD *)(v85 + 12) = 2080;
          uint64_t v93 = sub_100005038( &qword_100059608,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
          uint64_t v94 = dispatch thunk of CustomStringConvertible.description.getter(v151, v93);
          unint64_t v96 = v95;
          uint64_t v173 = sub_10000B540(v94, v95, (uint64_t *)v176);
          uint64_t v97 = v151;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, v91, v85 + 14, v85 + 22);
          swift_bridgeObjectRelease(v96);
          v75(v143, v97);
          _os_log_impl( (void *)&_mh_execute_header,  v83,  v84,  "Skipping %s because expiration date is in the future %s",  (uint8_t *)v85,  0x16u);
          swift_arrayDestroy(v86, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v86, -1LL, -1LL);
          swift_slowDealloc(v85, -1LL, -1LL);

          v75(v81, v97);
          v92(v163, v165);
        }

        else
        {

          v75(v80, v67);
          v119 = *(void (**)(char *, uint64_t))(v77 + 8);
          v119(v78, v79);
          v75(v81, v67);
          v119(v163, v79);
        }

LABEL_57:
      __break(1u);
    }

    goto LABEL_14;
  }

LABEL_55:
  swift_release(v162);
  return v138;
}

uint64_t sub_100012734(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MLHostTask(0LL);
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v52 = (char *)&v44 - v12;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v51 = v11;
    uint64_t v46 = v2;
    uint64_t v14 = (uint64_t *)(a2 + 64);
    __n128 v15 = swift_bridgeObjectRetain(a1);
    uint64_t v45 = a1;
    uint64_t v16 = (uint64_t *)(a1 + 40);
    v15.n128_u64[0] = 136315138LL;
    __n128 v48 = v15;
    unint64_t v47 = (char *)&type metadata for Any + 8;
    unint64_t v49 = v7;
    unint64_t v50 = (uint64_t *)(a2 + 64);
    do
    {
      uint64_t v17 = *(v16 - 1);
      uint64_t v18 = *v16;
      swift_beginAccess(v14, v54, 33LL, 0LL);
      uint64_t v19 = *v14;
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v19);
      unint64_t v20 = sub_10002BC00(v17, v18);
      char v22 = v21;
      swift_bridgeObjectRelease(v19);
      if ((v22 & 1) != 0)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v14);
        uint64_t v24 = *v14;
        uint64_t v55 = *v14;
        *uint64_t v14 = 0x8000000000000000LL;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_10001A9A4((uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000595F0);
          uint64_t v24 = v55;
        }

        swift_bridgeObjectRelease(*(void *)(*(void *)(v24 + 48) + 16 * v20 + 8));
        uint64_t v25 = v53;
        (*(void (**)(char *, unint64_t, uint64_t))(v53 + 32))( v7,  *(void *)(v24 + 56) + *(void *)(v53 + 72) * v20,  v8);
        sub_10001A788(v20, v24);
        uint64_t v26 = *v14;
        *uint64_t v14 = v24;
        swift_bridgeObjectRelease(v26);
        uint64_t v27 = 0LL;
      }

      else
      {
        uint64_t v27 = 1LL;
        uint64_t v25 = v53;
      }

      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v7, v27, 1LL, v8);
      swift_endAccess(v54);
      swift_bridgeObjectRelease(v18);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v7, 1LL, v8) == 1)
      {
        sub_10000C7CC((uint64_t)v7, &qword_1000595E8);
      }

      else
      {
        uint64_t v28 = v52;
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v52, v7, v8);
        uint64_t v29 = v8;
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v30 = type metadata accessor for Logger(0LL);
        sub_10000C538(v30, (uint64_t)qword_10005A7E0);
        uint64_t v31 = v51;
        uint64_t v32 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 16))(v51, v28, v29);
        int64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
        unint64_t v34 = v28;
        os_log_type_t v35 = static os_log_type_t.info.getter(v33);
        if (os_log_type_enabled(v33, v35))
        {
          uint64_t v36 = swift_slowAlloc(12LL, -1LL);
          uint64_t v37 = swift_slowAlloc(32LL, -1LL);
          v54[0] = v37;
          *(_DWORD *)uint64_t v36 = v48.n128_u32[0];
          uint64_t v38 = MLHostTask.name.getter(v37);
          unint64_t v40 = v39;
          *(void *)(v36 + 4) = sub_10000B540(v38, v39, v54);
          swift_bridgeObjectRelease(v40);
          uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
          v41(v31, v29);
          _os_log_impl( (void *)&_mh_execute_header,  v33,  v35,  "Task %s is removed from TaskRegistry",  (uint8_t *)v36,  0xCu);
          swift_arrayDestroy(v37, 1LL, v47);
          uint64_t v42 = v37;
          uint64_t v7 = v49;
          swift_slowDealloc(v42, -1LL, -1LL);
          swift_slowDealloc(v36, -1LL, -1LL);

          v41((uint64_t)v52, v29);
        }

        else
        {

          unint64_t v43 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
          v43(v31, v29);
          v43((uint64_t)v34, v29);
        }

        uint64_t v8 = v29;
        uint64_t v14 = v50;
      }

      v16 += 2;
      --v13;
    }

    while (v13);
    return swift_bridgeObjectRelease(v45);
  }

  return result;
}

uint64_t sub_100012B38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = a3[4];
  uint64_t v8 = a3[5];
  if (v7 == a1 && v8 == a2) {
    return 1LL;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0LL);
  if ((result & 1) != 0) {
    return 1LL;
  }
  if (v3 == 1) {
    return 0LL;
  }
  uint64_t v11 = a3 + 7;
  for (uint64_t i = 1LL; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1LL)) {
      break;
    }
    uint64_t v14 = *(v11 - 1);
    uint64_t v15 = *v11;
    BOOL v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0LL) & 1) != 0) {
      return 1LL;
    }
    uint64_t result = 0LL;
    v11 += 2;
    if (v13 == v3) {
      return result;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_100012BFC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for TaskValidationError(0LL);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)v51 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = sub_10000B4F4(&qword_100059600);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v59 = *(void *)(v14 - 8);
  uint64_t v60 = v14;
  __chkstk_darwin(v14);
  BOOL v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v17._countAndFlagsBits = 0x7473696C702ELL;
  v17._object = (void *)0xE600000000000000LL;
  if (String.hasSuffix(_:)(v17))
  {
    uint64_t v53 = v10;
    uint64_t v58 = a3;
    id v18 = [(id)objc_opt_self(NSFileManager) defaultManager];
    uint64_t v57 = a1;
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = [v18 contentsAtPath:v19];

    if (v20)
    {
      uint64_t v52 = v16;
      uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v20);
      unint64_t v23 = v22;

      uint64_t v24 = type metadata accessor for PropertyListDecoder(0LL);
      swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
      uint64_t v25 = PropertyListDecoder.init()();
      uint64_t v26 = sub_100005038( &qword_100059250,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
      uint64_t v27 = v60;
      uint64_t v55 = v21;
      unint64_t v56 = v23;
      uint64_t v54 = v25;
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v60, v21, v23, v60, v26);
      v51[4] = v6;
      uint64_t v44 = v59;
      uint64_t v45 = *(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56);
      v45(v13, 0LL, 1LL, v27);
      uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
      unint64_t v47 = v52;
      v46(v52, v13, v27);
      validateTaskDefinition(_:)(v47);
      uint64_t v48 = v27;
      unint64_t v49 = v58;
      swift_release(v54);
      sub_10000C5C4(v55, v56);
      v46(v49, v47, v48);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v45)(v49, 0LL, 1LL, v48);
    }

    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    sub_10000C538(v38, (uint64_t)qword_10005A7E0);
    uint64_t v39 = swift_bridgeObjectRetain_n(a2, 2LL);
    unint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v43 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v61 = sub_10000B540(v57, a2, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v42 + 4, v42 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Failed reading data from: %s", v42, 0xCu);
      swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1LL, -1LL);
      swift_slowDealloc(v42, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    uint64_t v37 = v58;
    uint64_t v35 = v60;
    uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
  }

  else
  {
    uint64_t v28 = a1;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v29 = type metadata accessor for Logger(0LL);
    sub_10000C538(v29, (uint64_t)qword_10005A7E0);
    uint64_t v30 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      int64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v34;
      *(_DWORD *)int64_t v33 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v61 = sub_10000B540(v28, a2, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v33 + 4, v33 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Invalid task definition file: %s", v33, 0xCu);
      swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    uint64_t v35 = v60;
    uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
    uint64_t v37 = a3;
  }

  return v36((uint64_t)v37, 1LL, 1LL, v35);
}

uint64_t sub_1000139E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8 = *(void *)(a1 + 64);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v8);
  char v10 = sub_10001E0DC(v9, a2, a3);
  swift_bridgeObjectRelease(v8);
  uint64_t result = swift_bridgeObjectRelease(a3);
  *a4 = v10 & 1;
  return result;
}

uint64_t sub_100013A80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v28 = a1;
  uint64_t v5 = sub_10000B4F4(&qword_1000595F8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TaskStatus(0LL);
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  __chkstk_darwin(v8);
  char v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for MLHostTask(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  Swift::String v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v18 = (os_unfair_lock_s *)(*(void *)(v2 + 56) + 16LL);
  os_unfair_lock_lock(v18);
  swift_beginAccess(v2 + 64, v29, 32LL, 0LL);
  uint64_t v19 = *(void *)(v2 + 64);
  if (*(void *)(v19 + 16))
  {
    swift_bridgeObjectRetain(a2);
    unint64_t v20 = sub_10002BC00(v28, a2);
    if ((v21 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))( v13,  *(void *)(v19 + 56) + *(void *)(v15 + 72) * v20,  v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0LL, 1LL, v14);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1LL, 1LL, v14);
    }

    swift_bridgeObjectRelease(a2);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1LL, 1LL, v14);
  }

  swift_endAccess(v29);
  os_unfair_lock_unlock(v18);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v10, enum case for TaskStatus.taskNotStarted(_:), v27);
  uint64_t v23 = MLHostTask.status.setter(v10);
  Date.init()(v23);
  uint64_t v24 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56LL))(v7, 0LL, 1LL, v24);
  MLHostTask.lastExecutionDate.setter(v7);
  os_unfair_lock_lock(v18);
  sub_10001429C(v3, (uint64_t)v17);
  os_unfair_lock_unlock(v18);
  sub_100014394((uint64_t)v17);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_100013D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v25 = a3;
  uint64_t v7 = type metadata accessor for TaskStatus(0LL);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for MLHostTask(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Swift::String v17 = (os_unfair_lock_s *)(*(void *)(v3 + 56) + 16LL);
  os_unfair_lock_lock(v17);
  swift_beginAccess(v3 + 64, v26, 32LL, 0LL);
  uint64_t v18 = *(void *)(v3 + 64);
  if (*(void *)(v18 + 16))
  {
    swift_bridgeObjectRetain(a2);
    unint64_t v19 = sub_10002BC00(a1, a2);
    if ((v20 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))( v12,  *(void *)(v18 + 56) + *(void *)(v14 + 72) * v19,  v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0LL, 1LL, v13);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1LL, 1LL, v13);
    }

    swift_bridgeObjectRelease(a2);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1LL, 1LL, v13);
  }

  swift_endAccess(v26);
  os_unfair_lock_unlock(v17);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v9, v25, v24);
  MLHostTask.status.setter(v9);
  os_unfair_lock_lock(v17);
  sub_10001429C(v4, (uint64_t)v16);
  os_unfair_lock_unlock(v17);
  sub_100014394((uint64_t)v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

void sub_100013FB0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  sub_10000C538(v10, (uint64_t)qword_10005A7E0);
  swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v11 = swift_bridgeObjectRetain_n(a4, 2LL);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v23 = v5;
    uint64_t v14 = swift_slowAlloc(22LL, -1LL);
    uint64_t v15 = swift_slowAlloc(64LL, -1LL);
    uint64_t v25 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    swift_bridgeObjectRetain(a2);
    uint64_t v24 = sub_10000B540(a1, a2, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    uint64_t v24 = sub_10000B540(a3, a4, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease_n(a4, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Persisting task error: %s %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1LL, -1LL);
    uint64_t v16 = v14;
    uint64_t v5 = v23;
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  sub_10000C654(0LL, &qword_100059628, &OBJC_CLASS___NSNumber_ptr);
  Class isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
  id v18 = objc_allocWithZone(&OBJC_CLASS___BMLighthouseTaskError);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  id v21 = [v18 initWithVersion:isa taskName:v19 errorCode:v20];

  id v22 = [*(id *)(v5 + 80) source];
  [v22 sendEvent:v21];
}

uint64_t sub_10001429C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B4F4(&qword_1000595E8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v8 = MLHostTask.name.getter(v5);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for MLHostTask(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a2, v11);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0LL, 1LL, v11);
  swift_beginAccess(a1 + 64, v15, 33LL, 0LL);
  sub_10000F460((uint64_t)v7, v8, v10);
  return swift_endAccess(v15);
}

void sub_100014394(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for TaskStatus(0LL);
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  __chkstk_darwin(v4);
  int64_t v33 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MLHostTask(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  sub_10000C538(v10, (uint64_t)qword_10005A7E0);
  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v15 = swift_slowAlloc(32LL, -1LL);
    uint64_t v37 = v15;
    v31[1] = a1;
    uint64_t v32 = v1;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v16 = MLHostTask.description.getter();
    unint64_t v18 = v17;
    uint64_t v36 = sub_10000B540(v16, v17, &v37);
    uint64_t v2 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Persisting task: %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  sub_10000C654(0LL, &qword_100059628, &OBJC_CLASS___NSNumber_ptr);
  Class isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
  MLHostTask.name.getter(isa);
  uint64_t v21 = v20;
  id v22 = v33;
  uint64_t v23 = MLHostTask.status.getter();
  TaskStatus.rawValue.getter(v23);
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v35);
  id v26 = objc_allocWithZone(&OBJC_CLASS___BMLighthouseTaskStatus);
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v21);
  NSString v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v25);
  id v29 = [v26 initWithVersion:isa taskName:v27 taskState:v28 taskSource:0 pushMetadata:0 pullMetadata:0];

  id v30 = [*(id *)(v2 + 72) source];
  [v30 sendEvent:v29];
}

void sub_1000146D4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v95 = a3;
  uint64_t v96 = a1;
  unint64_t v97 = a2;
  uint64_t v7 = sub_10000B4F4(&qword_1000595F8);
  __chkstk_darwin(v7);
  uint64_t v92 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v91 = type metadata accessor for TaskStatus(0LL);
  uint64_t v9 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v11 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000B4F4(&qword_100059638);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_10000B4F4(&qword_100059640);
  __chkstk_darwin(v15);
  unint64_t v17 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for PushMetadata(0LL);
  uint64_t v98 = *(void *)(v18 - 8);
  uint64_t v99 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for DynamicTaskSource(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v93 = a4;
  v25(v24, a4, v21);
  int v26 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
  if (v26 == enum case for DynamicTaskSource.push(_:))
  {
    sub_10001E254(a5, (uint64_t)v14);
    uint64_t v27 = type metadata accessor for TaskMetadata(0LL);
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v14, 1LL, v27) == 1)
    {
      sub_10000C7CC((uint64_t)v14, &qword_100059638);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v17, 1LL, 1LL, v99);
LABEL_10:
      sub_10000C7CC((uint64_t)v17, &qword_100059640);
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v37 = type metadata accessor for Logger(0LL);
      uint64_t v38 = sub_10000C538(v37, (uint64_t)qword_10005A7E0);
      uint64_t v31 = (os_log_s *)Logger.logObject.getter(v38);
      os_log_type_t v32 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v31, v32)) {
        goto LABEL_15;
      }
      int64_t v33 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)int64_t v33 = 0;
      uint64_t v34 = "Incomplete push metadata.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v31, v32, v34, v33, 2u);
      swift_slowDealloc(v33, -1LL, -1LL);
LABEL_15:

      return;
    }

    TaskMetadata.pushMetadata.getter();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v27);
    uint64_t v36 = v98;
    uint64_t v35 = v99;
    uint64_t v44 = v20;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v20, v17, v35);
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v45 = type metadata accessor for Logger(0LL);
    sub_10000C538(v45, (uint64_t)qword_10005A7E0);
    uint64_t v46 = v91;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v95, v91);
    unint64_t v47 = v97;
    uint64_t v48 = swift_bridgeObjectRetain_n(v97, 2LL);
    unint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
    os_log_type_t v50 = static os_log_type_t.debug.getter();
    BOOL v51 = os_log_type_enabled(v49, v50);
    uint64_t v52 = v96;
    if (v51)
    {
      uint64_t v53 = swift_slowAlloc(22LL, -1LL);
      uint64_t v90 = swift_slowAlloc(64LL, -1LL);
      uint64_t v101 = v90;
      *(_DWORD *)uint64_t v53 = 136315394;
      os_log_t v89 = v49;
      swift_bridgeObjectRetain(v47);
      uint64_t v100 = sub_10000B540(v52, v47, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v53 + 4, v53 + 12);
      uint64_t v54 = swift_bridgeObjectRelease_n(v47, 3LL);
      *(_WORD *)(v53 + 12) = 2080;
      uint64_t v55 = TaskStatus.rawValue.getter(v54);
      unint64_t v57 = v56;
      uint64_t v100 = sub_10000B540(v55, v56, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v53 + 14, v53 + 22);
      swift_bridgeObjectRelease(v57);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v46);
      os_log_t v58 = v89;
      _os_log_impl( (void *)&_mh_execute_header,  v89,  v50,  "Donating task status for push event: taskName: %s, taskStatus: %s",  (uint8_t *)v53,  0x16u);
      uint64_t v59 = v90;
      swift_arrayDestroy(v90, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1LL, -1LL);
      swift_slowDealloc(v53, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v47, 2LL);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v46);
    }

    uint64_t v60 = PushMetadata.topic.getter();
    uint64_t v91 = v61;
    uint64_t v62 = PushMetadata.channelID.getter();
    uint64_t v64 = v63;
    uint64_t v65 = PushMetadata.pushType.getter();
    uint64_t v67 = v66;
    uint64_t v68 = PushMetadata.pushPriority.getter();
    uint64_t v70 = v69;
    uint64_t v71 = (uint64_t)v92;
    PushMetadata.creationDate.getter();
    uint64_t v72 = type metadata accessor for Date(0LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56LL))(v71, 0LL, 1LL, v72);
    id v73 = objc_allocWithZone(&OBJC_CLASS___BMLighthouseTaskStatusPushMetadata);
    id v74 = sub_100019E6C(v60, v91, v62, v64, v65, v67, v68, v70, v71);
    sub_10000C654(0LL, &qword_100059628, &OBJC_CLASS___NSNumber_ptr);
    Class isa = NSNumber.init(integerLiteral:)(1LL).super.super.isa;
    TaskStatus.rawValue.getter(isa);
    uint64_t v77 = v76;
    DynamicTaskSource.rawValue.getter();
    uint64_t v79 = v78;
    id v80 = objc_allocWithZone(&OBJC_CLASS___BMLighthouseTaskStatus);
    unint64_t v81 = v97;
    swift_bridgeObjectRetain(v97);
    id v82 = v74;
    NSString v83 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v81);
    NSString v84 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v77);
    NSString v85 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v79);
    id v86 = [v80 initWithVersion:isa taskName:v83 taskState:v84 taskSource:v85 pushMetadata:v82 pullMetadata:0];

    id v87 = [*(id *)(v94 + 72) source];
    [v87 sendEvent:v86];

    (*(void (**)(char *, uint64_t))(v98 + 8))(v44, v99);
  }

  else
  {
    if (v26 == enum case for DynamicTaskSource.pull(_:))
    {
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v29 = type metadata accessor for Logger(0LL);
      uint64_t v30 = sub_10000C538(v29, (uint64_t)qword_10005A7E0);
      uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
      os_log_type_t v32 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v31, v32)) {
        goto LABEL_15;
      }
      int64_t v33 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)int64_t v33 = 0;
      uint64_t v34 = "Donating task status for pull events is not implemented yet.";
      goto LABEL_14;
    }

    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v39 = type metadata accessor for Logger(0LL);
    uint64_t v40 = sub_10000C538(v39, (uint64_t)qword_10005A7E0);
    os_log_type_t v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Invalid taskSource, skipping donation.", v43, 2u);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }

uint64_t sub_100014F44@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v178 = a2;
  uint64_t countAndFlagsBits = type metadata accessor for TaskValidationError(0LL);
  uint64_t v172 = *(void *)(countAndFlagsBits - 8);
  uint64_t v3 = __chkstk_darwin(countAndFlagsBits);
  uint64_t v167 = (char *)&v152 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v3);
  char v174 = (char *)&v152 - v6;
  __chkstk_darwin(v5);
  uint64_t v173 = (char *)&v152 - v7;
  uint64_t v154 = type metadata accessor for TaskType(0LL);
  uint64_t v158 = *(void *)(v154 - 8);
  __chkstk_darwin(v154);
  uint64_t v159 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for MLHostTask(0LL);
  uint64_t v176 = *(void *)(v9 - 8);
  uint64_t v177 = v9;
  __chkstk_darwin(v9);
  uint64_t v160 = (char *)&v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v181 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v179 = *(void *)(v181 - 8);
  uint64_t v11 = __chkstk_darwin(v181);
  int64_t v168 = (char *)&v152 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v169 = (char *)&v152 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v171 = (char *)&v152 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v161 = (char *)&v152 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v156 = (char *)&v152 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v157 = (uint64_t)&v152 - v22;
  __chkstk_darwin(v21);
  v155 = (char *)&v152 - v23;
  uint64_t v164 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v165 = *(void *)(v164 - 8);
  __chkstk_darwin(v164);
  v163 = (char *)&v152 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v25);
  v162 = (char *)&v152 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v170 = type metadata accessor for URL(0LL);
  uint64_t v27 = *(void *)(v170 - 8);
  uint64_t v28 = __chkstk_darwin(v170);
  uint64_t v30 = (char *)&v152 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v28);
  os_log_type_t v32 = (char *)&v152 - v31;
  uint64_t v33 = sub_10000B4F4(&qword_1000595F8);
  __chkstk_darwin(v33);
  uint64_t v35 = (char *)&v152 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = type metadata accessor for Date(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v40 = (char *)&v152 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v38);
  os_log_type_t v42 = (char *)&v152 - v41;
  uint64_t v43 = validateTaskDefinition(_:)(a1);
  v180 = a1;
  uint64_t v173 = v30;
  char v174 = v32;
  uint64_t countAndFlagsBits = v27;
  uint64_t v44 = v170;
  uint64_t v152 = 0LL;
  uint64_t v45 = v171;
  int64_t v153 = v42;
  TaskDefinition.endDate.getter(v43);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1LL, v36) == 1)
  {
    sub_10000C7CC((uint64_t)v35, &qword_1000595F8);
LABEL_13:
    unint64_t v97 = v180;
    uint64_t v98 = v181;
    uint64_t v99 = v179;
    uint64_t v100 = v45;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v101 = type metadata accessor for Logger(0LL);
    sub_10000C538(v101, (uint64_t)qword_10005A7E0);
    uint64_t v102 = (*(uint64_t (**)(char *, void (*)(char *, uint64_t), uint64_t))(v99 + 16))(v45, v97, v98);
    os_log_type_t v103 = (os_log_s *)Logger.logObject.getter(v102);
    os_log_type_t v104 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v103, v104))
    {
      uint64_t v105 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v106 = (void *)swift_slowAlloc(32LL, -1LL);
      id v184 = v106;
      v107.n128_u64[0] = 136315138LL;
      *(_DWORD *)uint64_t v105 = 136315138;
      uint64_t v108 = TaskDefinition.name.getter(v107);
      unint64_t v110 = v109;
      uint64_t v187 = sub_10000B540(v108, v109, (uint64_t *)&v184);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v105 + 4, v105 + 12);
      swift_bridgeObjectRelease(v110);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v98);
      _os_log_impl((void *)&_mh_execute_header, v103, v104, "Task %s must have a valid endDate (> now).", v105, 0xCu);
      swift_arrayDestroy(v106, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v106, -1LL, -1LL);
      swift_slowDealloc(v105, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v99 + 8))(v45, v98);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v178, 1LL, 1LL, v177);
  }

  uint64_t v46 = v153;
  uint64_t v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v37 + 32))(v153, v35, v36);
  static Date.now.getter(v47);
  char v48 = static Date.> infix(_:_:)(v46, v40);
  unint64_t v49 = *(void (**)(char *, uint64_t))(v37 + 8);
  v49(v40, v36);
  if ((v48 & 1) == 0)
  {
    v49(v46, v36);
    goto LABEL_13;
  }

  os_log_type_t v50 = v180;
  uint64_t v51 = v166;
  sub_100016580(v180);
  if (!v52)
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v112 = type metadata accessor for Logger(0LL);
    sub_10000C538(v112, (uint64_t)qword_10005A7E0);
    uint64_t v113 = v179;
    unint64_t v114 = v161;
    uint64_t v115 = v181;
    uint64_t v116 = (*(uint64_t (**)(char *, void (*)(char *, uint64_t), uint64_t))(v179 + 16))( v161,  v50,  v181);
    id v117 = (os_log_s *)Logger.logObject.getter(v116);
    os_log_type_t v118 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v117, v118))
    {
      v119 = v114;
      id v120 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v121 = (void *)swift_slowAlloc(32LL, -1LL);
      uint64_t v171 = (char *)v49;
      uint64_t v122 = v121;
      id v184 = v121;
      v123.n128_u64[0] = 136315138LL;
      *(_DWORD *)id v120 = 136315138;
      uint64_t v172 = v36;
      os_log_type_t v124 = v119;
      uint64_t v125 = TaskDefinition.name.getter(v123);
      unint64_t v127 = v126;
      uint64_t v187 = sub_10000B540(v125, v126, (uint64_t *)&v184);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v120 + 4, v120 + 12);
      swift_bridgeObjectRelease(v127);
      (*(void (**)(char *, uint64_t))(v113 + 8))(v124, v115);
      _os_log_impl((void *)&_mh_execute_header, v117, v118, "Failed at storing taskDefinition: %s", v120, 0xCu);
      swift_arrayDestroy(v122, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v122, -1LL, -1LL);
      swift_slowDealloc(v120, -1LL, -1LL);

      ((void (*)(char *, uint64_t))v171)(v153, v172);
    }

    else
    {

      (*(void (**)(char *, uint64_t))(v113 + 8))(v114, v115);
      v49(v46, v36);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v178, 1LL, 1LL, v177);
  }

  uint64_t v171 = (char *)v49;
  uint64_t v172 = v36;
  swift_bridgeObjectRelease(v52);
  uint64_t v53 = *(void *)(v51 + 40);
  uint64_t v54 = *(void *)(v51 + 48);
  uint64_t v55 = v162;
  uint64_t v56 = v44;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(countAndFlagsBits + 56))(v162, 1LL, 1LL, v44);
  uint64_t v57 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v58 = v165;
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v165 + 104);
  uint64_t v60 = v163;
  uint64_t v61 = v164;
  v59(v163, enum case for URL.DirectoryHint.inferFromPath(_:), v164);
  __n128 v62 = swift_bridgeObjectRetain(v54);
  uint64_t v63 = v173;
  URL.init(filePath:directoryHint:relativeTo:)(v53, v54, v60, v55, v62);
  id v184 = (id)TaskDefinition.name.getter(v64);
  uint64_t v185 = v65;
  v59(v60, v57, v61);
  unint64_t v66 = sub_10001E080();
  uint64_t v67 = v174;
  URL.appending<A>(path:directoryHint:)(&v184, v60, &type metadata for String, v66);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v61);
  swift_bridgeObjectRelease(v185);
  uint64_t v68 = *(void (**)(char *, uint64_t))(countAndFlagsBits + 8);
  v68(v63, v56);
  Swift::String v69 = URL.path(percentEncoded:)(0);
  v68(v67, v56);
  id v70 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t countAndFlagsBits = v69._countAndFlagsBits;
  NSString v71 = String._bridgeToObjectiveC()();
  if (qword_100058F60 != -1) {
    swift_once(&qword_100058F60, sub_10000F708);
  }
  type metadata accessor for FileAttributeKey(0LL);
  sub_100005038( &qword_100059038,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_10004095C);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v184 = 0LL;
  unsigned int v73 = [v70 createDirectoryAtPath:v71 withIntermediateDirectories:1 attributes:isa error:&v184];

  id v74 = v184;
  uint64_t v75 = v181;
  uint64_t v76 = v179;
  if (v73)
  {
    uint64_t v77 = qword_100058F68;
    id v78 = v184;
    if (v77 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v79 = type metadata accessor for Logger(0LL);
    sub_10000C538(v79, (uint64_t)qword_10005A7E0);
    id v80 = v155;
    char v174 = *(char **)(v76 + 16);
    ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v174)(v155, v180, v75);
    uint64_t v81 = swift_bridgeObjectRetain_n(v69._object, 2LL);
    id v82 = (os_log_s *)Logger.logObject.getter(v81);
    os_log_type_t v83 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = swift_slowAlloc(22LL, -1LL);
      NSString v85 = (void *)swift_slowAlloc(64LL, -1LL);
      id v184 = v85;
      v86.n128_u64[0] = 136315394LL;
      *(_DWORD *)uint64_t v84 = 136315394;
      uint64_t v87 = TaskDefinition.name.getter(v86);
      unint64_t v89 = v88;
      uint64_t v187 = sub_10000B540(v87, v88, (uint64_t *)&v184);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v84 + 4, v84 + 12);
      swift_bridgeObjectRelease(v89);
      uint64_t v90 = v180;
      uint64_t v179 = *(void *)(v179 + 8);
      ((void (*)(char *, uint64_t))v179)(v80, v181);
      *(_WORD *)(v84 + 12) = 2080;
      swift_bridgeObjectRetain(v69._object);
      uint64_t v91 = countAndFlagsBits;
      uint64_t v187 = sub_10000B540(countAndFlagsBits, (unint64_t)v69._object, (uint64_t *)&v184);
      uint64_t v75 = v181;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v84 + 14, v84 + 22);
      swift_bridgeObjectRelease_n(v69._object, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "Created taskFolder for %s: %s", (uint8_t *)v84, 0x16u);
      swift_arrayDestroy(v85, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v85, -1LL, -1LL);
      swift_slowDealloc(v84, -1LL, -1LL);

      uint64_t v92 = v90;
      uint64_t v93 = v166;
      uint64_t v94 = (uint64_t)v160;
      uint64_t v95 = v154;
      uint64_t v96 = v159;
    }

    else
    {
      uint64_t v179 = *(void *)(v76 + 8);
      ((void (*)(char *, uint64_t))v179)(v80, v75);
      swift_bridgeObjectRelease_n(v69._object, 2LL);

      uint64_t v93 = v166;
      uint64_t v94 = (uint64_t)v160;
      uint64_t v95 = v154;
      uint64_t v96 = v159;
      uint64_t v91 = countAndFlagsBits;
      uint64_t v92 = v180;
    }

    uint64_t v146 = v157;
    sub_100016DA4((uint64_t)v92, v157);
    uint64_t v147 = v156;
    ((void (*)(char *, uint64_t, uint64_t))v174)(v156, v146, v75);
    (*(void (**)(char *, void, uint64_t))(v158 + 104))(v96, enum case for TaskType.dynamicTask(_:), v95);
    MLHostTask.init(taskDefinition:taskType:taskFolder:)(v147, v96, v91, v69._object);
    v148 = (os_unfair_lock_s *)(*(void *)(v93 + 56) + 16LL);
    os_unfair_lock_lock(v148);
    sub_100016FB0(v93, v94);
    os_unfair_lock_unlock(v148);
    ((void (*)(uint64_t, uint64_t))v179)(v146, v75);
    ((void (*)(char *, uint64_t))v171)(v153, v172);
    uint64_t v150 = v176;
    uint64_t v149 = v177;
    uint64_t v151 = v178;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v176 + 32))(v178, v94, v177);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v150 + 56))(v151, 0LL, 1LL, v149);
  }

  else
  {
    id v128 = v184;
    uint64_t v129 = (void *)_convertNSErrorToError(_:)(v74);

    swift_willThrow(v130);
    id v184 = v129;
    uint64_t v131 = sub_10000B4F4(&qword_1000595D0);
    uint64_t v132 = sub_10000C654(0LL, &qword_1000595D8, &OBJC_CLASS___NSError_ptr);
    swift_dynamicCast(&v187, &v184, v131, v132, 0LL);
    unint64_t v133 = (void *)v187;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v134 = type metadata accessor for Logger(0LL);
    sub_10000C538(v134, (uint64_t)qword_10005A7E0);
    id v135 = v133;
    swift_bridgeObjectRetain(v69._object);
    id v136 = v135;
    uint64_t v137 = (os_log_s *)Logger.logObject.getter(v136);
    os_log_type_t v138 = static os_log_type_t.error.getter();
    BOOL v139 = os_log_type_enabled(v137, v138);
    uint64_t v140 = countAndFlagsBits;
    if (v139)
    {
      uint64_t v141 = swift_slowAlloc(22LL, -1LL);
      v142 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v181 = swift_slowAlloc(32LL, -1LL);
      uint64_t v186 = v181;
      *(_DWORD *)uint64_t v141 = 136315394;
      swift_bridgeObjectRetain(v69._object);
      uint64_t v182 = sub_10000B540(v140, (unint64_t)v69._object, &v186);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v182, &v183, v141 + 4, v141 + 12);
      swift_bridgeObjectRelease_n(v69._object, 3LL);
      *(_WORD *)(v141 + 12) = 2112;
      uint64_t v182 = (uint64_t)v136;
      id v143 = v136;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v182, &v183, v141 + 14, v141 + 22);
      void *v142 = v136;

      _os_log_impl( (void *)&_mh_execute_header,  v137,  v138,  "Failed at creating taskFolder: %s %@",  (uint8_t *)v141,  0x16u);
      uint64_t v144 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v142, 1LL, v144);
      swift_slowDealloc(v142, -1LL, -1LL);
      uint64_t v145 = v181;
      swift_arrayDestroy(v181, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v145, -1LL, -1LL);
      swift_slowDealloc(v141, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v69._object, 2LL);
    }

    ((void (*)(char *, uint64_t))v171)(v153, v172);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v178, 1LL, 1LL, v177);
    return swift_errorRelease(v184);
  }

uint64_t sub_100016580(void (*a1)(char *, uint64_t))
{
  uint64_t v2 = v1;
  unint64_t v66 = a1;
  uint64_t v67 = type metadata accessor for TaskDefinition(0LL);
  v62[2] = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  v62[1] = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v4 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v6 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v64 = *(void *)(v10 - 8);
  uint64_t v11 = v64;
  uint64_t v12 = __chkstk_darwin(v10);
  v62[0] = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v62 - v15;
  __chkstk_darwin(v14);
  uint64_t v68 = (char *)v62 - v17;
  uint64_t v72 = TaskDefinition.name.getter(v18);
  uint64_t v73 = v19;
  v20._uint64_t countAndFlagsBits = 0x7473696C702ELL;
  v20._object = (void *)0xE600000000000000LL;
  String.append(_:)(v20);
  uint64_t v65 = v72;
  uint64_t v63 = v73;
  uint64_t v22 = *(void *)(v1 + 24);
  uint64_t v21 = *(void *)(v2 + 32);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v24 = v9;
  v23(v9, 1LL, 1LL, v10);
  uint64_t v25 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v27 = v69;
  v26(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v69);
  __n128 v28 = swift_bridgeObjectRetain(v21);
  uint64_t v29 = v21;
  uint64_t v30 = v67;
  URL.init(filePath:directoryHint:relativeTo:)(v22, v29, v6, v24, v28);
  uint64_t v31 = v63;
  uint64_t v72 = v65;
  uint64_t v73 = v63;
  uint64_t v32 = v25;
  uint64_t v33 = v64;
  v26(v6, v32, v27);
  uint64_t v34 = v68;
  unint64_t v35 = sub_10001E080();
  URL.appending<A>(path:directoryHint:)(&v72, v6, &type metadata for String, v35);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v27);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v37 = v16;
  uint64_t v38 = v66;
  uint64_t v69 = v10;
  v36(v37, v10);
  swift_bridgeObjectRelease(v31);
  uint64_t v39 = type metadata accessor for PropertyListEncoder(0LL);
  swift_allocObject(v39, *(unsigned int *)(v39 + 48), *(unsigned __int16 *)(v39 + 52));
  uint64_t v40 = PropertyListEncoder.init()();
  dispatch thunk of PropertyListEncoder.outputFormat.setter(100LL);
  uint64_t v41 = sub_100005038( &qword_100059268,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
  uint64_t v42 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v38, v30, v41);
  unint64_t v44 = v43;
  uint64_t v45 = (char *)v62[0];
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v46 = type metadata accessor for Logger(0LL);
  uint64_t v47 = sub_10000C538(v46, (uint64_t)qword_10005A7E0);
  uint64_t v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v33 + 16))(v45, v34, v69);
  uint64_t v67 = v47;
  unint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
  os_log_type_t v50 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v52 = swift_slowAlloc(32LL, -1LL);
    uint64_t v72 = v52;
    uint64_t v64 = v42;
    *(_DWORD *)uint64_t v51 = 136315138;
    unint64_t v66 = v36;
    uint64_t v53 = sub_100005038( &qword_1000595E0,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v65 = v44;
    uint64_t v54 = v69;
    uint64_t v55 = dispatch thunk of CustomStringConvertible.description.getter(v69, v53);
    unint64_t v57 = v56;
    uint64_t v70 = sub_10000B540(v55, v56, &v72);
    uint64_t v36 = v66;
    uint64_t v42 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v51 + 4, v51 + 12);
    swift_bridgeObjectRelease(v57);
    uint64_t v58 = v54;
    unint64_t v44 = v65;
    v36((char *)v62[0], v58);
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Storing taskDefinition at URL: %s", v51, 0xCu);
    swift_arrayDestroy(v52, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v59 = v52;
    uint64_t v34 = v68;
    swift_slowDealloc(v59, -1LL, -1LL);
    swift_slowDealloc(v51, -1LL, -1LL);
  }

  else
  {
    v36(v45, v69);
  }

  Data.write(to:options:)(v34, 0LL, v42, v44);
  uint64_t countAndFlagsBits = URL.path(percentEncoded:)(0)._countAndFlagsBits;
  sub_10000C5C4(v42, v44);
  swift_release(v40);
  v36(v34, v69);
  return countAndFlagsBits;
}

uint64_t sub_100016DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TaskRequest(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v32[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v32[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v12(a2, a1, v8);
  uint64_t v13 = sub_10000B4F4(&qword_100059290);
  uint64_t inited = swift_initStackObject(v13, v33);
  *(_OWORD *)(inited + 16) = xmmword_100040D00;
  uint64_t v15 = ((uint64_t (*)(char *, uint64_t, uint64_t))v12)(v11, a2, v8);
  uint64_t v16 = TaskDefinition.bundleIdentifier.getter(v15);
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(void *)(inited + 32) = v16;
  *(void *)(inited + 40) = v18;
  uint64_t v19 = sub_10002EF58(inited);
  swift_setDeallocating(inited);
  uint64_t v20 = swift_arrayDestroy(inited + 32, *(void *)(inited + 16), &type metadata for String);
  uint64_t v34 = v19;
  uint64_t v21 = TaskDefinition.taskRequest.getter(v20);
  uint64_t v22 = TaskRequest.relatedApplications.getter(v21);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v22)
  {
    uint64_t v23 = *(void *)(v22 + 16);
    if (v23)
    {
      uint64_t v24 = (uint64_t *)(v22 + 40);
      do
      {
        uint64_t v25 = *(v24 - 1);
        uint64_t v26 = *v24;
        swift_bridgeObjectRetain(*v24);
        sub_10002C02C(v32, v25, v26);
        swift_bridgeObjectRelease(v32[1]);
        v24 += 2;
        --v23;
      }

      while (v23);
    }

    swift_bridgeObjectRelease(v22);
  }

  uint64_t v27 = v34;
  __n128 v28 = sub_10002E994(v34);
  swift_bridgeObjectRelease(v27);
  uint64_t v29 = (uint64_t (*)(uint64_t *, void))TaskDefinition.taskRequest.modify(v32);
  TaskRequest.relatedApplications.setter(v28);
  return v29(v32, 0LL);
}

uint64_t sub_100016FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for MLHostTask(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1 + 64;
  swift_beginAccess(a1 + 64, v42, 0LL, 0LL);
  uint64_t v12 = *(void *)(a1 + 64);
  swift_bridgeObjectRetain(v12);
  uint64_t v14 = MLHostTask.name.getter(v13);
  uint64_t v16 = v15;
  if (*(void *)(v12 + 16))
  {
    sub_10002BC00(v14, v15);
    char v18 = v17;
    swift_bridgeObjectRelease(v12);
    uint64_t v19 = swift_bridgeObjectRelease(v16);
    if ((v18 & 1) != 0)
    {
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v20 = type metadata accessor for Logger(0LL);
      sub_10000C538(v20, (uint64_t)qword_10005A7E0);
      uint64_t v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
      uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        os_log_t v40 = v22;
        uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v25 = swift_slowAlloc(32LL, -1LL);
        uint64_t v39 = v25;
        v41[0] = v25;
        uint64_t v38 = v24;
        *(_DWORD *)uint64_t v24 = 136315138;
        uint64_t v37 = v24 + 4;
        uint64_t v26 = MLHostTask.name.getter(v25);
        unint64_t v28 = v27;
        uint64_t v43 = sub_10000B540(v26, v27, v41);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v37, v24 + 12);
        swift_bridgeObjectRelease(v28);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        uint64_t v22 = v40;
        os_log_type_t v29 = v23;
        uint64_t v30 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v29,  "Task %s already present in TaskRegistry is being replaced.",  v38,  0xCu);
        uint64_t v31 = v39;
        swift_arrayDestroy(v39, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1LL, -1LL);
        swift_slowDealloc(v30, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
  }

  else
  {
    swift_bridgeObjectRelease(v12);
    uint64_t v19 = swift_bridgeObjectRelease(v16);
  }

  uint64_t v32 = MLHostTask.name.getter(v19);
  uint64_t v34 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0LL, 1LL, v7);
  swift_beginAccess(v11, v41, 33LL, 0LL);
  sub_10000F460((uint64_t)v6, v32, v34);
  return swift_endAccess(v41);
}

void sub_1000172D0(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v175 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v174 = *(void *)(v175 - 8);
  __chkstk_darwin(v175);
  uint64_t v173 = (char *)&v162 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v5);
  uint64_t v172 = (char *)&v162 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v171 = type metadata accessor for URL(0LL);
  uint64_t v180 = *(void *)(v171 - 8);
  uint64_t v7 = __chkstk_darwin(v171);
  uint64_t v170 = (char *)&v162 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v169 = (char *)&v162 - v9;
  uint64_t v10 = type metadata accessor for TaskType(0LL);
  uint64_t v197 = *(void *)(v10 - 8);
  uint64_t v198 = v10;
  __chkstk_darwin(v10);
  v196 = (char *)&v162 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for MLHostTask(0LL);
  uint64_t v194 = *(void *)(v12 - 8);
  uint64_t v195 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  v193 = (char *)&v162 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  v192 = (char *)&v162 - v15;
  uint64_t v16 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v201 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v183 = (uint64_t *)((char *)&v162 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (uint64_t)&v162 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v188 = (char *)&v162 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v186 = (uint64_t)&v162 - v25;
  __chkstk_darwin(v24);
  v190 = (char *)&v162 - v26;
  uint64_t v27 = sub_10000B4F4(&qword_100059668);
  uint64_t v28 = __chkstk_darwin(v27);
  id v184 = (uint64_t *)((char *)&v162 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v182 = (uint64_t *)((char *)&v162 - v31);
  uint64_t v32 = __chkstk_darwin(v30);
  unint64_t v34 = (unint64_t)&v162 - v33;
  __chkstk_darwin(v32);
  uint64_t v36 = (uint64_t *)((char *)&v162 - v35);
  if (qword_100058F68 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once(&qword_100058F68, sub_10001F3C8);
LABEL_2:
    uint64_t v37 = type metadata accessor for Logger(0LL);
    uint64_t v38 = sub_10000C538(v37, (uint64_t)qword_10005A7E0);
    uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
    os_log_type_t v40 = static os_log_type_t.info.getter();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v185 = (void *)v2;
    if (v41)
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Loading tasks from StaticRegistry.", v42, 2u);
      unint64_t v2 = (unint64_t)v185;
      swift_slowDealloc(v42, -1LL, -1LL);
    }

    uint64_t v176 = v21;

    uint64_t v43 = sub_100018408(*(void *)(v2 + 16), a1);
    uint64_t v164 = v38;
    uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
    os_log_type_t v45 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = v43;
      uint64_t v47 = a1;
      uint64_t v48 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Loading tasks from DynamicRegistry.", v48, 2u);
      unint64_t v49 = v48;
      a1 = v47;
      uint64_t v43 = v46;
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    uint64_t v50 = sub_10000B4F4(&qword_100059290);
    unint64_t v51 = swift_allocObject(v50, 48LL, 7LL);
    *(_OWORD *)(v51 + 16) = xmmword_100040D00;
    uint64_t v52 = *(void *)(v2 + 32);
    *(void *)(v51 + 32) = *(void *)(v2 + 24);
    *(void *)(v51 + 40) = v52;
    swift_bridgeObjectRetain(v52);
    uint64_t v53 = sub_100018408(v51, a1);
    uint64_t v54 = swift_bridgeObjectRelease(v51);
    uint64_t v199 = v34;
    v189 = v36;
    if (a1)
    {
      __chkstk_darwin(v54);
      *(&v162 - 2) = a1;
      uint64_t v55 = a1;
      uint64_t v56 = sub_10001BD00( v43,  (uint64_t (*)(uint64_t, uint64_t, char *, __n128))sub_10001E424,  (uint64_t)(&v162 - 4));
      uint64_t v57 = swift_bridgeObjectRelease(v43);
      __chkstk_darwin(v57);
      *(&v162 - 2) = v55;
      uint64_t v58 = sub_10001BD00( v53,  (uint64_t (*)(uint64_t, uint64_t, char *, __n128))sub_10001E3FC,  (uint64_t)(&v162 - 4));
      swift_bridgeObjectRelease(v53);
      uint64_t v43 = v56;
      uint64_t v53 = v58;
    }

    uint64_t v59 = sub_10001B2E0(v43);
    swift_bridgeObjectRelease(v43);
    uint64_t v177 = sub_10001B2E0(v53);
    uint64_t v187 = 0LL;
    swift_bridgeObjectRelease(v53);
    unint64_t v60 = sub_10001EB10((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v200 = 0LL;
    id v202 = (id)v60;
    uint64_t v61 = *(void *)(v59 + 64);
    int64_t v166 = v59 + 64;
    uint64_t v178 = v59;
    uint64_t v62 = 1LL << *(_BYTE *)(v59 + 32);
    uint64_t v63 = -1LL;
    if (v62 < 64) {
      uint64_t v63 = ~(-1LL << v62);
    }
    unint64_t v2 = v63 & v61;
    LODWORD(v181) = enum case for TaskType.staticTask(_:);
    int64_t v168 = (unint64_t)(v62 + 63) >> 6;
    uint64_t v165 = v168 - 1;
    unint64_t v34 = (unint64_t)&unk_100059670;
    uint64_t v191 = v16;
    a1 = v201;
    if ((v63 & v61) != 0) {
      break;
    }
LABEL_15:
    uint64_t v21 = v199;
    uint64_t v86 = v200 + 1;
    uint64_t v36 = v189;
    if (!__OFADD__(v200, 1LL))
    {
      if (v86 < v168)
      {
        unint64_t v87 = *(void *)(v166 + 8 * v86);
        if (v87)
        {
LABEL_18:
          unint64_t v2 = (v87 - 1) & v87;
          uint64_t v79 = __clz(__rbit64(v87)) + (v86 << 6);
          uint64_t v200 = v86;
          goto LABEL_14;
        }

        uint64_t v88 = v200 + 2;
        ++v200;
        if (v86 + 1 < v168)
        {
          unint64_t v87 = *(void *)(v166 + 8 * v88);
          if (v87)
          {
LABEL_21:
            uint64_t v86 = v88;
            goto LABEL_18;
          }

          uint64_t v200 = v86 + 1;
          if (v86 + 2 < v168)
          {
            unint64_t v87 = *(void *)(v166 + 8 * (v86 + 2));
            if (v87)
            {
              v86 += 2LL;
              goto LABEL_18;
            }

            uint64_t v88 = v86 + 3;
            uint64_t v200 = v86 + 2;
            if (v86 + 3 < v168)
            {
              unint64_t v87 = *(void *)(v166 + 8 * v88);
              if (v87) {
                goto LABEL_21;
              }
              while (1)
              {
                uint64_t v86 = v88 + 1;
                if (__OFADD__(v88, 1LL))
                {
                  __break(1u);
LABEL_77:
                  __break(1u);
                }

                if (v86 >= v168) {
                  break;
                }
                unint64_t v87 = *(void *)(v166 + 8 * v86);
                ++v88;
                if (v87) {
                  goto LABEL_18;
                }
              }

              uint64_t v200 = v165;
            }
          }
        }
      }

      uint64_t v89 = sub_10000B4F4((uint64_t *)v34);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56LL))(v21, 1LL, 1LL, v89);
      unint64_t v2 = 0LL;
      goto LABEL_33;
    }

    __break(1u);
LABEL_74:
    __break(1u);
  }

  while (1)
  {
    unint64_t v78 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    uint64_t v21 = v199;
    uint64_t v79 = v78 | (v200 << 6);
    uint64_t v36 = v189;
LABEL_14:
    uint64_t v80 = *(void *)(v178 + 56);
    uint64_t v81 = (void *)(*(void *)(v178 + 48) + 16 * v79);
    uint64_t v82 = v81[1];
    *(void *)uint64_t v21 = *v81;
    *(void *)(v21 + 8) = v82;
    uint64_t v83 = v201;
    uint64_t v84 = v80 + *(void *)(v201 + 72) * v79;
    uint64_t v85 = sub_10000B4F4((uint64_t *)v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v21 + *(int *)(v85 + 48), v84, v16);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v85 - 8) + 56LL))(v21, 0LL, 1LL, v85);
    swift_bridgeObjectRetain(v82);
LABEL_33:
    sub_10001E3B4(v21, (uint64_t)v36);
    uint64_t v90 = sub_10000B4F4((uint64_t *)v34);
    uint64_t v91 = *(void *)(v90 - 8);
    uint64_t v92 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v91 + 48);
    if (v92(v36, 1LL, v90) == 1) {
      break;
    }
    uint64_t v65 = *v36;
    uint64_t v64 = v36[1];
    uint64_t v66 = (uint64_t)v190;
    (*(void (**)(char *, char *, uint64_t))(a1 + 32))(v190, (char *)v36 + *(int *)(v90 + 48), v16);
    unint64_t v67 = v34;
    uint64_t v68 = v186;
    sub_100016DA4(v66, v186);
    uint64_t v69 = v188;
    (*(void (**)(char *, uint64_t, uint64_t))(a1 + 16))(v188, v68, v16);
    uint64_t v70 = v196;
    (*(void (**)(char *, void, uint64_t))(v197 + 104))(v196, v181, v198);
    uint64_t v71 = v192;
    MLHostTask.init(taskDefinition:taskType:taskFolder:)(v69, v70, 0LL, 0LL);
    uint64_t v72 = (uint64_t)v193;
    uint64_t v73 = v71;
    uint64_t v16 = v191;
    (*(void (**)(char *, char *, uint64_t))(v194 + 32))(v193, v73, v195);
    id v74 = v202;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v202);
    id v204 = v74;
    sub_10002D118(v72, v65, v64, isUniquelyReferenced_nonNull_native);
    id v202 = v204;
    swift_bridgeObjectRelease(v64);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    uint64_t v76 = *(void (**)(uint64_t, uint64_t))(a1 + 8);
    uint64_t v77 = v68;
    unint64_t v34 = v67;
    v76(v77, v16);
    v76(v66, v16);
    if (!v2) {
      goto LABEL_15;
    }
  }

  uint64_t v181 = v92;
  swift_release(v178);
  uint64_t v21 = 0LL;
  uint64_t v93 = *(void *)(v177 + 64);
  uint64_t v165 = v177 + 64;
  uint64_t v94 = 1LL << *(_BYTE *)(v177 + 32);
  uint64_t v95 = -1LL;
  if (v94 < 64) {
    uint64_t v95 = ~(-1LL << v94);
  }
  unint64_t v34 = v95 & v93;
  LODWORD(v168) = enum case for URL.DirectoryHint.inferFromPath(_:);
  LODWORD(v178) = enum case for TaskType.dynamicTask(_:);
  int64_t v166 = (unint64_t)(v94 + 63) >> 6;
  uint64_t v163 = v166 - 1;
  uint64_t v36 = v183;
  a1 = v176;
  uint64_t v179 = v91;
  uint64_t v167 = v90;
  while (1)
  {
    uint64_t v124 = (uint64_t)v184;
    if (v34)
    {
      unint64_t v125 = __clz(__rbit64(v34));
      uint64_t v126 = (v34 - 1) & v34;
      unint64_t v127 = v125 | (v21 << 6);
LABEL_41:
      uint64_t v128 = *(void *)(v177 + 56);
      uint64_t v129 = (void *)(*(void *)(v177 + 48) + 16 * v127);
      uint64_t v130 = v129[1];
      *id v184 = *v129;
      *(void *)(v124 + 8) = v130;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v201 + 16))( v124 + *(int *)(v90 + 48),  v128 + *(void *)(v201 + 72) * v127,  v16);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v91 + 56))(v124, 0LL, 1LL, v90);
      swift_bridgeObjectRetain(v130);
      goto LABEL_51;
    }

    int64_t v131 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      goto LABEL_74;
    }
    if (v131 < v166)
    {
      unint64_t v132 = *(void *)(v165 + 8 * v131);
      if (v132) {
        goto LABEL_45;
      }
      v21 += 2LL;
      if (v131 + 1 >= v166)
      {
        uint64_t v21 = v131;
      }

      else
      {
        unint64_t v132 = *(void *)(v165 + 8 * v21);
        if (v132)
        {
          ++v131;
LABEL_45:
          uint64_t v126 = (v132 - 1) & v132;
          unint64_t v127 = __clz(__rbit64(v132)) + (v131 << 6);
          uint64_t v21 = v131;
          goto LABEL_41;
        }

        if (v131 + 2 < v166)
        {
          unint64_t v132 = *(void *)(v165 + 8 * (v131 + 2));
          if (v132)
          {
            v131 += 2LL;
            goto LABEL_45;
          }

          int64_t v152 = v131 + 3;
          if (v131 + 3 >= v166)
          {
            uint64_t v21 = v131 + 2;
          }

          else
          {
            unint64_t v132 = *(void *)(v165 + 8 * v152);
            if (v132)
            {
              v131 += 3LL;
              goto LABEL_45;
            }

            while (1)
            {
              int64_t v131 = v152 + 1;
              if (__OFADD__(v152, 1LL)) {
                goto LABEL_77;
              }
              if (v131 >= v166) {
                break;
              }
              unint64_t v132 = *(void *)(v165 + 8 * v131);
              ++v152;
              if (v132) {
                goto LABEL_45;
              }
            }

            uint64_t v21 = v163;
          }
        }
      }
    }

    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v184, 1LL, 1LL, v90);
    uint64_t v126 = 0LL;
LABEL_51:
    unint64_t v133 = v182;
    sub_10001E3B4(v124, (uint64_t)v182);
    if (v181(v133, 1LL, v90) == 1) {
      break;
    }
    uint64_t v188 = (char *)v126;
    uint64_t v134 = (uint64_t)v36;
    uint64_t v136 = *v133;
    uint64_t v135 = v133[1];
    (*(void (**)(uint64_t, char *, uint64_t))(v201 + 32))(a1, (char *)v133 + *(int *)(v90 + 48), v16);
    sub_100016DA4(a1, v134);
    id v137 = [(id)objc_opt_self(NSFileManager) defaultManager];
    uint64_t v138 = (uint64_t)v185;
    uint64_t v139 = v185[5];
    uint64_t v186 = v185[6];
    NSString v140 = String._bridgeToObjectiveC()();
    id v204 = 0LL;
    id v141 = [v137 contentsOfDirectoryAtPath:v140 error:&v204];

    id v142 = v204;
    if (v141)
    {
      uint64_t v143 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v141, &type metadata for String);
      id v144 = v142;

      swift_retain(v138);
      uint64_t v145 = v187;
      uint64_t v146 = sub_10001BE70(v143, v138);
      uint64_t v187 = v145;
      swift_bridgeObjectRelease(v143);
      swift_release(v138);
      uint64_t v147 = (void *)sub_10002EF58((uint64_t)v146);
      swift_bridgeObjectRelease(v146);
    }

    else
    {
      id v148 = v204;
      uint64_t v149 = _convertNSErrorToError(_:)(v142);

      swift_willThrow(v150);
      swift_errorRelease(v149);
      uint64_t v187 = 0LL;
      uint64_t v147 = &_swiftEmptySetSingleton;
    }

    v189 = (uint64_t *)v21;
    uint64_t v200 = v136;
    char v151 = sub_10000F5D4(v136, v135, (uint64_t)v147);
    swift_bridgeObjectRelease(v147);
    uint64_t v199 = v135;
    if ((v151 & 1) != 0)
    {
      uint64_t v96 = v172;
      uint64_t v97 = v171;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v180 + 56))(v172, 1LL, 1LL, v171);
      uint64_t v98 = v174;
      uint64_t v99 = *(void (**)(char *, uint64_t, uint64_t))(v174 + 104);
      uint64_t v100 = v173;
      uint64_t v101 = v139;
      uint64_t v102 = v168;
      uint64_t v103 = v175;
      v99(v173, v168, v175);
      uint64_t v104 = v186;
      __n128 v105 = swift_bridgeObjectRetain(v186);
      uint64_t v106 = v170;
      URL.init(filePath:directoryHint:relativeTo:)(v101, v104, v100, v96, v105);
      id v204 = (id)v200;
      uint64_t v205 = v199;
      uint64_t v107 = v102;
      uint64_t v90 = v167;
      v99(v100, v107, v103);
      unint64_t v108 = sub_10001E080();
      unint64_t v109 = v169;
      URL.appending<A>(path:directoryHint:)(&v204, v100, &type metadata for String, v108);
      (*(void (**)(char *, uint64_t))(v98 + 8))(v100, v103);
      unint64_t v110 = *(void (**)(char *, uint64_t))(v180 + 8);
      a1 = v176;
      v110(v106, v97);
      Swift::String v111 = URL.path(percentEncoded:)(0);
      uint64_t countAndFlagsBits = v111._countAndFlagsBits;
      object = v111._object;
      uint64_t v114 = v97;
      uint64_t v36 = v183;
      v110(v109, v114);
      uint64_t v115 = v198;
      uint64_t v16 = v191;
    }

    else
    {
      uint64_t countAndFlagsBits = 0LL;
      object = 0LL;
      uint64_t v115 = v198;
      uint64_t v16 = v191;
      uint64_t v36 = v183;
    }

    uint64_t v116 = v201;
    id v117 = v190;
    (*(void (**)(char *, uint64_t *, uint64_t))(v201 + 16))(v190, v36, v16);
    os_log_type_t v118 = v196;
    (*(void (**)(char *, void, uint64_t))(v197 + 104))(v196, v178, v115);
    v119 = v192;
    MLHostTask.init(taskDefinition:taskType:taskFolder:)(v117, v118, countAndFlagsBits, object);
    uint64_t v120 = (uint64_t)v193;
    (*(void (**)(char *, char *, uint64_t))(v194 + 32))(v193, v119, v195);
    uint64_t v121 = v202;
    char v122 = swift_isUniquelyReferenced_nonNull_native(v202);
    id v204 = v121;
    uint64_t v123 = v199;
    sub_10002D118(v120, v200, v199, v122);
    id v202 = v204;
    swift_bridgeObjectRelease(v123);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    unint64_t v2 = *(void *)(v116 + 8);
    ((void (*)(uint64_t *, uint64_t))v2)(v36, v16);
    ((void (*)(uint64_t, uint64_t))v2)(a1, v16);
    uint64_t v91 = v179;
    uint64_t v21 = (uint64_t)v189;
    unint64_t v34 = (unint64_t)v188;
  }

  swift_release(v177);
  int64_t v153 = v185;
  uint64_t v154 = (os_unfair_lock_s *)(v185[7] + 16LL);
  os_unfair_lock_lock(v154);
  v155 = v202;
  swift_bridgeObjectRetain(v202);
  uint64_t v157 = (os_log_s *)Logger.logObject.getter(v156);
  os_log_type_t v158 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v157, v158))
  {
    uint64_t v159 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v159 = 134217984;
    id v204 = (id)v155[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v204, &v205, v159 + 4, v159 + 12);
    swift_bridgeObjectRelease(v155);
    _os_log_impl((void *)&_mh_execute_header, v157, v158, "Injecting %ld tasks in TaskRegistry.", v159, 0xCu);
    swift_slowDealloc(v159, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v155);
  }

  swift_beginAccess(&v202, &v204, 0LL, 0LL);
  id v160 = v202;
  swift_beginAccess(v153 + 8, v203, 1LL, 0LL);
  uint64_t v161 = v153[8];
  v153[8] = v160;
  swift_bridgeObjectRelease(v161);
  os_unfair_lock_unlock(v154);
}

uint64_t sub_100018408(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000B4F4(&qword_100059600);
  __chkstk_darwin(v5);
  uint64_t v187 = (char *)&v163 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v184 = (char *)&v163 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v179 = (char *)&v163 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v163 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v163 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v163 - v19;
  uint64_t v195 = (void *)sub_10001ED74((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v171 = *(void *)(a1 + 16);
  if (v171)
  {
    id v170 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
    unint64_t v169 = a1 + 32;
    uint64_t v176 = v194;
    unint64_t v164 = a1;
    __n128 v21 = swift_bridgeObjectRetain(a1);
    uint64_t v22 = 0LL;
    uint64_t v166 = 0LL;
    v21.n128_u64[0] = 136315138LL;
    __n128 v185 = v21;
    uint64_t v167 = (char *)&type metadata for Any + 8;
    v21.n128_u64[0] = 138412290LL;
    __n128 v165 = v21;
    v21.n128_u64[0] = 136315394LL;
    __n128 v175 = v21;
    uint64_t v186 = v2;
    uint64_t v180 = a2;
    uint64_t v190 = v7;
    uint64_t v192 = v8;
    uint64_t v177 = v20;
    uint64_t v172 = v15;
    uint64_t v173 = v18;
    do
    {
      uint64_t v174 = v22;
      unint64_t v24 = v169 + 16 * v22;
      uint64_t v25 = *(void **)v24;
      unint64_t v26 = *(void *)(v24 + 8);
      uint64_t v27 = qword_100058F68;
      swift_bridgeObjectRetain(v26);
      if (v27 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v28 = type metadata accessor for Logger(0LL);
      uint64_t v29 = sub_10000C538(v28, (uint64_t)qword_10005A7E0);
      uint64_t v30 = swift_bridgeObjectRetain_n(v26, 2LL);
      uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
      os_log_type_t v32 = static os_log_type_t.info.getter();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v188 = v25;
      if (v33)
      {
        uint64_t v34 = swift_slowAlloc(12LL, -1LL);
        uint64_t v35 = (void *)swift_slowAlloc(32LL, -1LL);
        v196 = v35;
        *(_DWORD *)uint64_t v34 = v185.n128_u32[0];
        swift_bridgeObjectRetain(v26);
        *(void *)(v34 + 4) = sub_10000B540((uint64_t)v188, v26, (uint64_t *)&v196);
        swift_bridgeObjectRelease_n(v26, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Loading tasks from folder: %s", (uint8_t *)v34, 0xCu);
        swift_arrayDestroy(v35, 1LL, v167);
        uint64_t v36 = v35;
        uint64_t v25 = v188;
        swift_slowDealloc(v36, -1LL, -1LL);
        swift_slowDealloc(v34, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v26, 2LL);
      }

      id v37 = [v170 defaultManager];
      NSString v38 = String._bridgeToObjectiveC()();
      v196 = 0LL;
      id v39 = [v37 contentsOfDirectoryAtPath:v38 error:&v196];

      id v40 = v196;
      if (v39)
      {
        uint64_t v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v39, &type metadata for String);
        id v42 = v40;

        uint64_t v43 = *(void *)(v41 + 16);
        if (v43)
        {
          uint64_t v168 = v41;
          uint64_t v44 = (void **)(v41 + 40);
          unint64_t v181 = v26;
          uint64_t v182 = v29;
          while (1)
          {
            uint64_t v191 = v43;
            uint64_t v45 = (uint64_t)*(v44 - 1);
            uint64_t v46 = *v44;
            v196 = v25;
            unint64_t v197 = v26;
            swift_bridgeObjectRetain(v26);
            swift_bridgeObjectRetain(v46);
            v47._uint64_t countAndFlagsBits = 47LL;
            v47._object = (void *)0xE100000000000000LL;
            String.append(_:)(v47);
            unint64_t v48 = v197;
            swift_bridgeObjectRetain(v197);
            v49._uint64_t countAndFlagsBits = v45;
            v49._object = v46;
            String.append(_:)(v49);
            swift_bridgeObjectRelease(v48);
            swift_bridgeObjectRelease(v46);
            uint64_t v50 = (uint64_t)v196;
            unint64_t v51 = v197;
            uint64_t v52 = swift_bridgeObjectRetain_n(v197, 2LL);
            uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
            os_log_type_t v54 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v53, v54))
            {
              uint64_t v55 = swift_slowAlloc(12LL, -1LL);
              uint64_t v56 = (void *)swift_slowAlloc(32LL, -1LL);
              v196 = v56;
              *(_DWORD *)uint64_t v55 = v185.n128_u32[0];
              swift_bridgeObjectRetain(v51);
              *(void *)(v55 + 4) = sub_10000B540(v50, v51, (uint64_t *)&v196);
              swift_bridgeObjectRelease_n(v51, 3LL);
              _os_log_impl((void *)&_mh_execute_header, v53, v54, "Loading task from: %s", (uint8_t *)v55, 0xCu);
              swift_arrayDestroy(v56, 1LL, (char *)&type metadata for Any + 8);
              uint64_t v57 = v56;
              uint64_t v7 = v190;
              swift_slowDealloc(v57, -1LL, -1LL);
              swift_slowDealloc(v55, -1LL, -1LL);
            }

            else
            {

              swift_bridgeObjectRelease_n(v51, 2LL);
            }

            uint64_t v58 = v192;
            uint64_t v59 = v187;
            uint64_t v189 = v50;
            sub_100012BFC(v50, v51, v187);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v59, 1LL, v7) == 1)
            {
              sub_10000C7CC((uint64_t)v59, &qword_100059600);
              swift_bridgeObjectRetain(v51);
              uint64_t v61 = (os_log_s *)Logger.logObject.getter(v60);
              os_log_type_t v62 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v61, v62))
              {
                uint64_t v63 = swift_slowAlloc(12LL, -1LL);
                uint64_t v64 = (void *)swift_slowAlloc(32LL, -1LL);
                v196 = v64;
                *(_DWORD *)uint64_t v63 = v185.n128_u32[0];
                swift_bridgeObjectRetain(v51);
                *(void *)(v63 + 4) = sub_10000B540(v189, v51, (uint64_t *)&v196);
                swift_bridgeObjectRelease_n(v51, 3LL);
                _os_log_impl((void *)&_mh_execute_header, v61, v62, "Skipping loading from: %s", (uint8_t *)v63, 0xCu);
                swift_arrayDestroy(v64, 1LL, (char *)&type metadata for Any + 8);
                uint64_t v65 = v64;
                uint64_t v7 = v190;
                swift_slowDealloc(v65, -1LL, -1LL);
                swift_slowDealloc(v63, -1LL, -1LL);
              }

              else
              {

                swift_bridgeObjectRelease_n(v51, 2LL);
              }
            }

            else
            {
              uint64_t v183 = *(uint64_t (**)(char *, char *, uint64_t))(v58 + 32);
              uint64_t v66 = v183(v20, v59, v7);
              uint64_t v67 = v180;
              if (v180
                && (uint64_t v68 = TaskDefinition.bundleIdentifier.getter(v66),
                    uint64_t v70 = v69,
                    char v71 = sub_10000F5D4(v68, v69, v67),
                    swift_bridgeObjectRelease(v70),
                    (v71 & 1) == 0))
              {
                swift_bridgeObjectRelease(v51);
                uint64_t v94 = v173;
                uint64_t v95 = (*(uint64_t (**)(char *, char *, uint64_t))(v58 + 16))(v173, v20, v7);
                uint64_t v96 = v20;
                uint64_t v97 = v58;
                uint64_t v98 = (os_log_s *)Logger.logObject.getter(v95);
                os_log_type_t v99 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v98, v99))
                {
                  uint64_t v100 = swift_slowAlloc(12LL, -1LL);
                  uint64_t v101 = (void *)swift_slowAlloc(32LL, -1LL);
                  v196 = v101;
                  *(_DWORD *)uint64_t v100 = v185.n128_u32[0];
                  uint64_t v102 = ((uint64_t (*)(void))TaskDefinition.name.getter)();
                  unint64_t v104 = v103;
                  *(void *)(v100 + 4) = sub_10000B540(v102, v103, (uint64_t *)&v196);
                  swift_bridgeObjectRelease(v104);
                  __n128 v105 = *(void (**)(char *, uint64_t))(v97 + 8);
                  v105(v94, v190);
                  _os_log_impl( (void *)&_mh_execute_header,  v98,  v99,  "Task %s is discared because its bundleIdentifier is not available in the OS.",  (uint8_t *)v100,  0xCu);
                  swift_arrayDestroy(v101, 1LL, (char *)&type metadata for Any + 8);
                  uint64_t v106 = v101;
                  uint64_t v7 = v190;
                  swift_slowDealloc(v106, -1LL, -1LL);
                  swift_slowDealloc(v100, -1LL, -1LL);

                  v105(v96, v7);
                }

                else
                {

                  uint64_t v107 = *(void (**)(char *, uint64_t))(v97 + 8);
                  v107(v94, v7);
                  v107(v96, v7);
                }

                uint64_t v20 = v96;
                unint64_t v26 = v181;
              }

              else
              {
                uint64_t v72 = v195;
                __n128 v73 = swift_bridgeObjectRetain(v195);
                uint64_t v74 = TaskDefinition.name.getter(v73);
                uint64_t v76 = v75;
                if (v72[2])
                {
                  sub_10002BC00(v74, v75);
                  char v78 = v77;
                  swift_bridgeObjectRelease(v72);
                  swift_bridgeObjectRelease(v76);
                  uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v192 + 16);
                  uint64_t v80 = v179;
                  if ((v78 & 1) != 0)
                  {
                    uint64_t v81 = v20;
                    uint64_t v82 = v172;
                    v79(v172, v81, v7);
                    uint64_t v83 = swift_bridgeObjectRetain_n(v51, 2LL);
                    uint64_t v84 = (os_log_s *)Logger.logObject.getter(v83);
                    os_log_type_t v85 = static os_log_type_t.error.getter();
                    if (os_log_type_enabled(v84, v85))
                    {
                      uint64_t v86 = swift_slowAlloc(22LL, -1LL);
                      uint64_t v178 = (void (*)(char *, char *, uint64_t))swift_slowAlloc(64LL, -1LL);
                      v196 = v178;
                      __n128 v87 = v175;
                      *(_DWORD *)uint64_t v86 = v175.n128_u32[0];
                      uint64_t v88 = TaskDefinition.name.getter(v87);
                      unint64_t v90 = v89;
                      uint64_t v193 = sub_10000B540(v88, v89, (uint64_t *)&v196);
                      uint64_t v91 = v176;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v176, v86 + 4, v86 + 12);
                      swift_bridgeObjectRelease(v90);
                      (*(void (**)(char *, uint64_t))(v192 + 8))(v82, v190);
                      *(_WORD *)(v86 + 12) = 2080;
                      swift_bridgeObjectRetain(v51);
                      uint64_t v193 = sub_10000B540(v189, v51, (uint64_t *)&v196);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v91, v86 + 14, v86 + 22);
                      swift_bridgeObjectRelease_n(v51, 3LL);
                      _os_log_impl( (void *)&_mh_execute_header,  v84,  v85,  "Task %s already in registry is overlayed by %s",  (uint8_t *)v86,  0x16u);
                      uint64_t v92 = v178;
                      swift_arrayDestroy(v178, 2LL, (char *)&type metadata for Any + 8);
                      uint64_t v7 = v190;
                      swift_slowDealloc(v92, -1LL, -1LL);
                      uint64_t v93 = v86;
                      uint64_t v80 = v179;
                      swift_slowDealloc(v93, -1LL, -1LL);
                    }

                    else
                    {
                      (*(void (**)(char *, uint64_t))(v192 + 8))(v82, v7);

                      swift_bridgeObjectRelease_n(v51, 2LL);
                    }

                    uint64_t v20 = v177;
                  }

                  v79(v80, v20, v7);
                }

                else
                {
                  swift_bridgeObjectRelease(v72);
                  swift_bridgeObjectRelease(v76);
                  uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v192 + 16);
                  uint64_t v80 = v179;
                  v79(v179, v20, v7);
                }

                swift_bridgeObjectRetain(v51);
                unint64_t v109 = (os_log_s *)Logger.logObject.getter(v108);
                os_log_type_t v110 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v109, v110))
                {
                  Swift::String v111 = v80;
                  uint64_t v112 = swift_slowAlloc(22LL, -1LL);
                  uint64_t v113 = (void *)swift_slowAlloc(64LL, -1LL);
                  v196 = v113;
                  __n128 v114 = v175;
                  *(_DWORD *)uint64_t v112 = v175.n128_u32[0];
                  uint64_t v115 = TaskDefinition.name.getter(v114);
                  unint64_t v117 = v116;
                  uint64_t v193 = sub_10000B540(v115, v116, (uint64_t *)&v196);
                  uint64_t v178 = v79;
                  os_log_type_t v118 = v176;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v176, v112 + 4, v112 + 12);
                  swift_bridgeObjectRelease(v117);
                  v119 = *(void (**)(char *, uint64_t))(v192 + 8);
                  uint64_t v120 = v111;
                  uint64_t v20 = v177;
                  v119(v120, v190);
                  *(_WORD *)(v112 + 12) = 2080;
                  swift_bridgeObjectRetain(v51);
                  uint64_t v193 = sub_10000B540(v189, v51, (uint64_t *)&v196);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v118, v112 + 14, v112 + 22);
                  swift_bridgeObjectRelease_n(v51, 3LL);
                  uint64_t v79 = v178;
                  _os_log_impl((void *)&_mh_execute_header, v109, v110, "Loaded %s from: %s", (uint8_t *)v112, 0x16u);
                  swift_arrayDestroy(v113, 2LL, (char *)&type metadata for Any + 8);
                  uint64_t v121 = v113;
                  uint64_t v7 = v190;
                  swift_slowDealloc(v121, -1LL, -1LL);
                  swift_slowDealloc(v112, -1LL, -1LL);
                }

                else
                {
                  v119 = *(void (**)(char *, uint64_t))(v192 + 8);
                  v119(v80, v7);

                  swift_bridgeObjectRelease_n(v51, 2LL);
                }

                uint64_t v123 = TaskDefinition.name.getter(v122);
                uint64_t v125 = v124;
                v79(v184, v20, v7);
                uint64_t v126 = v195;
                uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v195);
                uint64_t v195 = (void *)0x8000000000000000LL;
                v196 = v126;
                a1 = sub_10002BC00(v123, v125);
                uint64_t v129 = v126[2];
                BOOL v130 = (v128 & 1) == 0;
                uint64_t v131 = v129 + v130;
                if (__OFADD__(v129, v130))
                {
                  __break(1u);
LABEL_61:
                  __break(1u);
                  goto LABEL_62;
                }

                char v132 = v128;
                if (v126[3] >= v131)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_10001A9A4( (uint64_t (*)(void))&type metadata accessor for TaskDefinition,  &qword_100059678);
                  }
                }

                else
                {
                  sub_10002C480(v131, isUniquelyReferenced_nonNull_native);
                  unint64_t v133 = sub_10002BC00(v123, v125);
                  if ((v132 & 1) != (v134 & 1))
                  {
                    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
                    __break(1u);
                    return result;
                  }

                  a1 = v133;
                }

                unint64_t v26 = v181;
                uint64_t v135 = v196;
                if ((v132 & 1) != 0)
                {
                  uint64_t v7 = v190;
                  (*(void (**)(unint64_t, char *, uint64_t))(v192 + 40))( v196[7] + *(void *)(v192 + 72) * a1,  v184,  v190);
                }

                else
                {
                  v196[(a1 >> 6) + 8] |= 1LL << a1;
                  uint64_t v136 = (uint64_t *)(v135[6] + 16 * a1);
                  *uint64_t v136 = v123;
                  v136[1] = v125;
                  uint64_t v7 = v190;
                  v183((char *)(v135[7] + *(void *)(v192 + 72) * a1), v184, v190);
                  uint64_t v137 = v135[2];
                  BOOL v138 = __OFADD__(v137, 1LL);
                  uint64_t v139 = v137 + 1;
                  if (v138) {
                    goto LABEL_61;
                  }
                  v135[2] = v139;
                  swift_bridgeObjectRetain(v125);
                }

                NSString v140 = v195;
                uint64_t v195 = v196;
                swift_bridgeObjectRelease(v125);
                swift_bridgeObjectRelease(v140);
                v119(v20, v7);
              }
            }

            uint64_t v25 = v188;
            v44 += 2;
            uint64_t v43 = v191 - 1;
            if (v191 == 1)
            {
              swift_bridgeObjectRelease(v26);
              uint64_t v23 = v168;
              goto LABEL_4;
            }
          }
        }

        swift_bridgeObjectRelease(v26);
        uint64_t v23 = v41;
LABEL_4:
        swift_bridgeObjectRelease(v23);
      }

      else
      {
        id v141 = v196;
        swift_bridgeObjectRelease(v26);
        uint64_t v142 = _convertNSErrorToError(_:)(v40);

        swift_willThrow();
        uint64_t v166 = 0LL;
        swift_errorRetain(v142);
        uint64_t v143 = swift_errorRetain(v142);
        id v144 = (os_log_s *)Logger.logObject.getter(v143);
        os_log_type_t v145 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v144, v145))
        {
          uint64_t v146 = swift_slowAlloc(12LL, -1LL);
          uint64_t v147 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
          *(_DWORD *)uint64_t v146 = v165.n128_u32[0];
          swift_errorRetain(v142);
          uint64_t v148 = _swift_stdlib_bridgeErrorToNSError(v142);
          *(void *)(v146 + 4) = v148;
          *uint64_t v147 = v148;
          swift_errorRelease(v142);
          swift_errorRelease(v142);
          _os_log_impl( (void *)&_mh_execute_header,  v144,  v145,  "Failed at reading tasks from disk: %@",  (uint8_t *)v146,  0xCu);
          uint64_t v149 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v147, 1LL, v149);
          swift_slowDealloc(v147, -1LL, -1LL);
          swift_slowDealloc(v146, -1LL, -1LL);

          swift_errorRelease(v142);
        }

        else
        {
          swift_errorRelease(v142);
          swift_errorRelease(v142);
          swift_errorRelease(v142);
        }
      }

      uint64_t v22 = v174 + 1;
    }

    while (v174 + 1 != v171);
    a1 = v164;
    swift_bridgeObjectRelease(v164);
  }

  if (qword_100058F68 != -1) {
LABEL_62:
  }
    swift_once(&qword_100058F68, sub_10001F3C8);
  uint64_t v150 = type metadata accessor for Logger(0LL);
  sub_10000C538(v150, (uint64_t)qword_10005A7E0);
  char v151 = v195;
  swift_bridgeObjectRetain_n(a1, 2LL);
  swift_bridgeObjectRetain(v151);
  unint64_t v153 = a1;
  uint64_t v154 = (os_log_s *)Logger.logObject.getter(v152);
  os_log_type_t v155 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v154, v155))
  {
    uint64_t v156 = swift_slowAlloc(22LL, -1LL);
    uint64_t v157 = (void *)swift_slowAlloc(32LL, -1LL);
    v196 = v157;
    *(_DWORD *)uint64_t v156 = 134218242;
    uint64_t v193 = v151[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v194, v156 + 4, v156 + 12);
    swift_bridgeObjectRelease(v151);
    *(_WORD *)(v156 + 12) = 2080;
    swift_bridgeObjectRetain(v153);
    uint64_t v159 = Array.description.getter(v158, &type metadata for String);
    unint64_t v161 = v160;
    swift_bridgeObjectRelease(v153);
    uint64_t v193 = sub_10000B540(v159, v161, (uint64_t *)&v196);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v194, v156 + 14, v156 + 22);
    swift_bridgeObjectRelease_n(v153, 2LL);
    swift_bridgeObjectRelease(v161);
    _os_log_impl((void *)&_mh_execute_header, v154, v155, "Loaded %ld tasks from: %s.", (uint8_t *)v156, 0x16u);
    swift_arrayDestroy(v157, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v157, -1LL, -1LL);
    swift_slowDealloc(v156, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v153, 2LL);
    swift_bridgeObjectRelease(v151);
  }

  swift_beginAccess(&v195, (void (**)(char *, char *, uint64_t))&v196, 0LL, 0LL);
  return (uint64_t)v195;
}

uint64_t sub_100019578(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = TaskDefinition.bundleIdentifier.getter(a1);
  uint64_t v9 = v8;
  char v10 = sub_10000F5D4(v7, v8, a4);
  swift_bridgeObjectRelease(v9);
  if ((v10 & 1) == 0)
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    sub_10000C538(v11, (uint64_t)qword_10005A7E0);
    uint64_t v12 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v16 = swift_slowAlloc(32LL, -1LL);
      uint64_t v19 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v18 = sub_10000B540(a1, a2, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Task %s is discarded because its bundleIdentifier is not available in the OS.",  v15,  0xCu);
      swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }
  }

  return v10 & 1;
}

uint64_t sub_100019748(uint64_t a1, unint64_t a2)
{
  uint64_t v63 = a1;
  unint64_t v64 = a2;
  uint64_t v2 = sub_10000B4F4(&qword_1000595F8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v62 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v59 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v59 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v59 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v59 - v22;
  TaskDefinition.startDate.getter(v21);
  unint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v24(v7, 1LL, v8) == 1)
  {
    uint64_t v25 = sub_10000C7CC((uint64_t)v7, &qword_1000595F8);
  }

  else
  {
    uint64_t v61 = (uint64_t)v17;
    unint64_t v26 = v14;
    uint64_t v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v23, v7, v8);
    static Date.now.getter(v27);
    char v28 = static Date.< infix(_:_:)(v20, v23);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
    v29(v20, v8);
    if ((v28 & 1) != 0)
    {
      os_log_type_t v62 = (char *)v29;
      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v30 = type metadata accessor for Logger(0LL);
      sub_10000C538(v30, (uint64_t)qword_10005A7E0);
      uint64_t v31 = v61;
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v61, v23, v8);
      unint64_t v32 = v64;
      uint64_t v33 = swift_bridgeObjectRetain_n(v64, 2LL);
      uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
      os_log_type_t v35 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc(22LL, -1LL);
        uint64_t v60 = swift_slowAlloc(64LL, -1LL);
        uint64_t v66 = v60;
        *(_DWORD *)uint64_t v36 = 136315394;
        swift_bridgeObjectRetain(v32);
        uint64_t v65 = sub_10000B540(v63, v32, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v36 + 4, v36 + 12);
        swift_bridgeObjectRelease_n(v32, 3LL);
        *(_WORD *)(v36 + 12) = 2080;
        uint64_t v37 = sub_100005038( &qword_100059608,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
        uint64_t v38 = dispatch thunk of CustomStringConvertible.description.getter(v8, v37);
        unint64_t v40 = v39;
        uint64_t v65 = sub_10000B540(v38, v39, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v36 + 14, v36 + 22);
        swift_bridgeObjectRelease(v40);
        uint64_t v41 = v62;
        ((void (*)(uint64_t, uint64_t))v62)(v31, v8);
        _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Task %s is discarded due to startDate %s",  (uint8_t *)v36,  0x16u);
        uint64_t v42 = v60;
        swift_arrayDestroy(v60, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v42, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {

        uint64_t v41 = v62;
        ((void (*)(uint64_t, uint64_t))v62)(v31, v8);
        swift_bridgeObjectRelease_n(v32, 2LL);
      }

      ((void (*)(char *, uint64_t))v41)(v23, v8);
      return 0LL;
    }

    uint64_t v25 = ((uint64_t (*)(char *, uint64_t))v29)(v23, v8);
    os_log_type_t v14 = v26;
  }

  TaskDefinition.endDate.getter(v25);
  if (v24(v5, 1LL, v8) == 1)
  {
    sub_10000C7CC((uint64_t)v5, &qword_1000595F8);
    return 1LL;
  }

  uint64_t v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v14, v5, v8);
  static Date.now.getter(v43);
  char v44 = static Date.> infix(_:_:)(v20, v14);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v9 + 8);
  v45(v20, v8);
  if ((v44 & 1) == 0)
  {
    v45(v14, v8);
    return 1LL;
  }

  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v46 = type metadata accessor for Logger(0LL);
  sub_10000C538(v46, (uint64_t)qword_10005A7E0);
  Swift::String v47 = v62;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v62, v14, v8);
  unint64_t v48 = v64;
  uint64_t v49 = swift_bridgeObjectRetain_n(v64, 2LL);
  uint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
  os_log_type_t v51 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = swift_slowAlloc(22LL, -1LL);
    uint64_t v61 = swift_slowAlloc(64LL, -1LL);
    uint64_t v66 = v61;
    *(_DWORD *)uint64_t v52 = 136315394;
    swift_bridgeObjectRetain(v48);
    uint64_t v65 = sub_10000B540(v63, v48, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v52 + 4, v52 + 12);
    swift_bridgeObjectRelease_n(v48, 3LL);
    *(_WORD *)(v52 + 12) = 2080;
    uint64_t v53 = sub_100005038( &qword_100059608,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    uint64_t v54 = dispatch thunk of CustomStringConvertible.description.getter(v8, v53);
    unint64_t v56 = v55;
    uint64_t v65 = sub_10000B540(v54, v55, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v52 + 14, v52 + 22);
    swift_bridgeObjectRelease(v56);
    v45(v47, v8);
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Task %s is discarded due to endDate %s", (uint8_t *)v52, 0x16u);
    uint64_t v57 = v61;
    swift_arrayDestroy(v61, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1LL, -1LL);
    swift_slowDealloc(v52, -1LL, -1LL);
  }

  else
  {

    v45(v47, v8);
    swift_bridgeObjectRelease_n(v48, 2LL);
  }

  v45(v14, v8);
  return 0LL;
}

uint64_t sub_100019DC0()
{
  return v0;
}

uint64_t sub_100019E0C()
{
  return swift_deallocClassInstance(v0, 88LL, 7LL);
}

uint64_t type metadata accessor for TaskRegistry()
{
  return objc_opt_self(&OBJC_CLASS____TtC7mlhostd12TaskRegistry);
}

uint64_t sub_100019E4C()
{
  return sub_1000101EC();
}

id sub_100019E6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  if (a2)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    NSString v15 = 0LL;
    if (a4)
    {
LABEL_3:
      NSString v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(a4);
      uint64_t v17 = a9;
      if (a6) {
        goto LABEL_4;
      }
LABEL_8:
      NSString v18 = 0LL;
      if (a8) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }

  NSString v16 = 0LL;
  uint64_t v17 = a9;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_4:
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
  if (a8)
  {
LABEL_5:
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a8);
    goto LABEL_10;
  }

uint64_t sub_100019FE0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void *sub_10001A000(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000B4F4(&qword_100059290);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      os_log_type_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      os_log_type_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4]) {
          memmove(v14, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_10001B9BC(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10001A10C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
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
  if (!v9)
  {
    NSString v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_10000B4F4(&qword_100059680);
  uint64_t v11 = *(void *)(sub_10000B4F4(&qword_1000592D8) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  NSString v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12) {
    goto LABEL_29;
  }
  if (v16 - v14 == 0x8000000000000000LL && v12 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = sub_10000B4F4(&qword_1000592D8);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    unint64_t v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(void *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }

    else if (v15 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10001C2A0(0LL, v8, v21, a4);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_10001A31C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001A43C( a1,  a2,  a3,  a4,  &qword_100059648,  (uint64_t (*)(void))&type metadata accessor for ExtensionRecord);
}

void *sub_10001A330(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000B4F4(&qword_100059278);
      uint64_t v11 = (void *)swift_allocObject(v10, v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * v12 - 64;
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_10001C634(0LL, v8, (char *)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10001A428(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001A43C( a1,  a2,  a3,  a4,  &qword_100059650,  (uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

uint64_t sub_10001A43C( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
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
    uint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_10000B4F4(a5);
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

  v18[2] = v11;
  void v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = a6(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    unint64_t v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(void *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }

    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10001E29C(0LL, v11, v24, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_10001A648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_10002BC00(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v12 = *v4;
    uint64_t v19 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10001A9A4((uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000595F0);
      uint64_t v12 = v19;
    }

    swift_bridgeObjectRelease(*(void *)(*(void *)(v12 + 48) + 16 * v9 + 8));
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = type metadata accessor for MLHostTask(0LL);
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v13 + *(void *)(v15 + 72) * v9, v14);
    sub_10001A788(v9, v12);
    uint64_t v16 = *v4;
    *uint64_t v4 = v12;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a3, 0LL, 1LL, v14);
  }

  else
  {
    uint64_t v18 = type metadata accessor for MLHostTask(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))( a3,  1LL,  1LL,  v18);
  }

unint64_t sub_10001A788(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        unint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v29, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v29, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease(v11);
        unint64_t v13 = v12 & v7;
        if (v13 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v14 = *(void *)(a2 + 48);
        uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
        uint64_t v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1) {
          *uint64_t v15 = *v16;
        }
        uint64_t v17 = *(void *)(a2 + 56);
        uint64_t v18 = *(void *)(*(void *)(type metadata accessor for MLHostTask(0LL) - 8) + 72LL);
        int64_t v19 = v18 * v3;
        uint64_t result = v17 + v18 * v3;
        int64_t v20 = v18 * v6;
        unint64_t v21 = v17 + v18 * v6 + v18;
        if (v19 < v20 || result >= v21)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }

        else
        {
          int64_t v3 = v6;
          if (v19 == v20) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }

        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }

      if (v13 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      goto LABEL_12;
    }

void sub_10001A984()
{
}

void *sub_10001A990()
{
  return sub_10001A9A4((uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000595F0);
}

void *sub_10001A9A4(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v37 = a1(0LL);
  uint64_t v4 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  unint64_t v6 = (char *)&v33 - v5;
  sub_10000B4F4(a2);
  uint64_t v34 = v2;
  uint64_t v7 = *v2;
  uint64_t v8 = static _DictionaryStorage.copy(original:)(*v2);
  uint64_t v9 = *(void *)(v7 + 16);
  uint64_t v38 = v8;
  if (!v9)
  {
    uint64_t result = (void *)swift_release(v7);
    uint64_t v32 = v38;
    uint64_t v31 = v34;
LABEL_28:
    *uint64_t v31 = v32;
    return result;
  }

  uint64_t v10 = v8;
  uint64_t result = (void *)(v8 + 64);
  unint64_t v12 = (unint64_t)((1LL << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    uint64_t v10 = v38;
  }

  uint64_t v35 = v7 + 64;
  int64_t v14 = 0LL;
  *(void *)(v10 + 16) = *(void *)(v7 + 16);
  uint64_t v15 = 1LL << *(_BYTE *)(v7 + 32);
  uint64_t v16 = -1LL;
  if (v15 < 64) {
    uint64_t v16 = ~(-1LL << v15);
  }
  unint64_t v17 = v16 & *(void *)(v7 + 64);
  int64_t v36 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v18 = v37;
  while (1)
  {
    if (v17)
    {
      unint64_t v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }

    int64_t v28 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v28 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      int64_t v14 = v28 + 1;
      if (v28 + 1 >= v36) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v14);
      if (!v29) {
        break;
      }
    }

void *sub_10001AC00()
{
  unint64_t v1 = v0;
  sub_10000B4F4(&qword_100059618);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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

    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }

void sub_10001ADC0()
{
  unint64_t v1 = v0;
  sub_10000B4F4(&qword_100059688);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    swift_release(v2);
LABEL_28:
    uint64_t *v1 = v4;
    return;
  }

  unint64_t v25 = v1;
  uint64_t v5 = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

void sub_10001AFA4()
{
}

void sub_10001AFB0(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000B4F4(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _DictionaryStorage.copy(original:)(*v1);
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    swift_release(v3);
    *uint64_t v2 = v5;
    return;
  }

  uint64_t v6 = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1LL << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  int64_t v10 = 0LL;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }

    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }

uint64_t sub_10001B15C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001B178(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001B178(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000B4F4(&qword_100059290);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  int64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10001B2E0(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  unsigned int v4 = v3 & 0x3F;
  unint64_t v5 = (1LL << v3) + 63;
  uint64_t v6 = v5 >> 6;
  size_t v7 = 8 * (v5 >> 6);
  if (v4 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v5 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0LL), v7);
    uint64_t v8 = sub_10001B430((unint64_t *)((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v6, v2);
    if (v1) {
      swift_willThrow(v8);
    }
    else {
      return v8;
    }
  }

  else
  {
    uint64_t v9 = (void *)swift_slowAlloc(v7, -1LL);
    bzero(v9, v7);
    uint64_t v2 = sub_10001B430((unint64_t *)v9, v6, v2);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  return v2;
}

uint64_t sub_10001B430(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a2;
  int64_t v25 = a1;
  uint64_t v4 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v9 = 0LL;
  uint64_t v10 = *(void *)(a3 + 64);
  uint64_t v26 = 0LL;
  uint64_t v27 = a3 + 64;
  uint64_t v11 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v28 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v19 >= v28) {
      return sub_10001B674(v25, v24, v26, (void *)a3);
    }
    unint64_t v20 = *(void *)(v27 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v28) {
        return sub_10001B674(v25, v24, v26, (void *)a3);
      }
      unint64_t v20 = *(void *)(v27 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v28) {
          return sub_10001B674(v25, v24, v26, (void *)a3);
        }
        unint64_t v20 = *(void *)(v27 + 8 * v9);
        if (!v20) {
          break;
        }
      }
    }

LABEL_20:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    unint64_t v16 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v15);
    uint64_t v17 = *v16;
    unint64_t v18 = v16[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))( v8,  *(void *)(a3 + 56) + *(void *)(v5 + 72) * v15,  v4);
    swift_bridgeObjectRetain(v18);
    LOBYTE(v17) = sub_100019748(v17, v18);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t result = swift_bridgeObjectRelease(v18);
    if ((v17 & 1) != 0)
    {
      *(unint64_t *)((char *)v25 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      if (__OFADD__(v26++, 1LL))
      {
        __break(1u);
        return sub_10001B674(v25, v24, v26, (void *)a3);
      }
    }
  }

  int64_t v21 = v19 + 3;
  if (v21 >= v28) {
    return sub_10001B674(v25, v24, v26, (void *)a3);
  }
  unint64_t v20 = *(void *)(v27 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v28) {
      return sub_10001B674(v25, v24, v26, (void *)a3);
    }
    unint64_t v20 = *(void *)(v27 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }

    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_5:
    uint64_t v17 = (uint64_t *)(v32[6] + 16 * v16);
    unint64_t v18 = *v17;
    int64_t v19 = v17[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v32[7] + *(void *)(v6 + 72) * v16, v5);
    unint64_t v20 = swift_bridgeObjectRetain(v19);
    LOBYTE(v18) = v31(v18, v19, v9, v20);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t result = swift_bridgeObjectRelease(v19);
    if ((v18 & 1) != 0)
    {
      *(unint64_t *)((char *)v27 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
      if (__OFADD__(v28++, 1LL))
      {
        __break(1u);
        return sub_10001B674(v27, v26, v28, v32);
      }
    }
  }

  uint64_t v23 = v21 + 3;
  if (v23 >= v30) {
    return sub_10001B674(v27, v26, v28, v32);
  }
  int64_t v22 = *(void *)(v29 + 8 * v23);
  if (v22)
  {
    uint64_t v10 = v23;
    goto LABEL_20;
  }

  while (1)
  {
    uint64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v10 >= v30) {
      return sub_10001B674(v27, v26, v28, v32);
    }
    int64_t v22 = *(void *)(v29 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_20;
    }
  }

Swift::Int sub_10001B674(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  os_log_type_t v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v48 = (char *)&v43 - v12;
  if (!a3) {
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return (Swift::Int)a4;
  }

  uint64_t v47 = v11;
  sub_10000B4F4(&qword_100059678);
  Swift::Int result = static _DictionaryStorage.allocate(capacity:)(a3);
  Swift::Int v14 = result;
  char v44 = a1;
  uint64_t v45 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0LL;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0LL;
  Swift::Int v17 = result + 64;
  uint64_t v18 = v47;
  int64_t v19 = v48;
  uint64_t v46 = a4;
  while (1)
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v50 = v16;
      unint64_t v21 = v20 | (v16 << 6);
    }

    else
    {
      uint64_t v22 = v16 + 1;
      if (__OFADD__(v16, 1LL)) {
        goto LABEL_40;
      }
      if (v22 >= v45) {
        return v14;
      }
      unint64_t v23 = v44[v22];
      uint64_t v24 = v16 + 1;
      if (!v23)
      {
        uint64_t v24 = v16 + 2;
        if (v16 + 2 >= v45) {
          return v14;
        }
        unint64_t v23 = v44[v24];
        if (!v23)
        {
          uint64_t v24 = v16 + 3;
          if (v16 + 3 >= v45) {
            return v14;
          }
          unint64_t v23 = v44[v24];
          if (!v23)
          {
            uint64_t v25 = v16 + 4;
            if (v16 + 4 >= v45) {
              return v14;
            }
            unint64_t v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                uint64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1LL)) {
                  goto LABEL_41;
                }
                if (v24 >= v45) {
                  return v14;
                }
                unint64_t v23 = v44[v24];
                ++v25;
                if (v23) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v24 = v16 + 4;
          }
        }
      }

uint64_t sub_10001B9BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10001BAAC( unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *, __n128))
{
  uint64_t v26 = a2;
  uint64_t v31 = a4;
  uint64_t v27 = a1;
  uint64_t v5 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v10 = 0LL;
  uint64_t v32 = (void *)a3;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v28 = 0LL;
  uint64_t v29 = a3 + 64;
  uint64_t v12 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v30 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }

    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v21 >= v30) {
      return sub_10001B674(v27, v26, v28, v32);
    }
    unint64_t v22 = *(void *)(v29 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v30) {
        return sub_10001B674(v27, v26, v28, v32);
      }
      unint64_t v22 = *(void *)(v29 + 8 * v10);
      if (!v22)
      {
        int64_t v10 = v21 + 2;
        if (v21 + 2 >= v30) {
          return sub_10001B674(v27, v26, v28, v32);
        }
        unint64_t v22 = *(void *)(v29 + 8 * v10);
        if (!v22) {
          break;
        }
      }
    }

uint64_t sub_10001BD00( uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *, __n128), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  char v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (1LL << v7) + 63;
  uint64_t v10 = v9 >> 6;
  size_t v11 = 8 * (v9 >> 6);
  if (v8 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v9 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0LL), v11);
    uint64_t v12 = sub_10001BAAC((unint64_t *)((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v10, v6, a2);
    if (v3) {
      swift_willThrow(v12);
    }
    else {
      return v12;
    }
  }

  else
  {
    uint64_t v13 = (void *)swift_slowAlloc(v11, -1LL);
    bzero(v13, v11);
    a3 = sub_10001BAAC((unint64_t *)v13, v10, v6, a2);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  return a3;
}

void *sub_10001BE70(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = a2;
  uint64_t v4 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  __chkstk_darwin(v4);
  uint64_t v54 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v6);
  unint64_t v55 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v64 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v53 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v52 = (char *)&v45 - v11;
  unint64_t v12 = *(void *)(a1 + 16);
  if (!v12) {
    return _swiftEmptyArrayStorage;
  }
  unint64_t v13 = 0LL;
  unsigned int v50 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v14 = a1 + 40;
  uint64_t v49 = -(uint64_t)v12;
  uint64_t v15 = _swiftEmptyArrayStorage;
  uint64_t v47 = v2;
  unint64_t v46 = v12;
  uint64_t v45 = a1 + 40;
  uint64_t v16 = v56;
  do
  {
    unint64_t v48 = v15;
    if (v13 <= v12) {
      unint64_t v17 = v12;
    }
    else {
      unint64_t v17 = v13;
    }
    uint64_t v51 = -(uint64_t)v17;
    uint64_t v18 = (void *)(v14 + 16 * v13);
    unint64_t v19 = v13 + 1;
    while (1)
    {
      if (v51 + v19 == 1) {
        __break(1u);
      }
      uint64_t v20 = *v18;
      uint64_t v61 = *(v18 - 1);
      unint64_t v62 = v19;
      uint64_t v59 = v18;
      char v66 = 1;
      uint64_t v21 = *(void *)(v58 + 48);
      uint64_t v60 = *(void *)(v58 + 40);
      unint64_t v22 = v55;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v55, 1LL, 1LL, v64);
      int64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
      uint64_t v24 = v54;
      uint64_t v25 = v50;
      uint64_t v26 = v57;
      v23(v54, v50, v57);
      swift_bridgeObjectRetain(v20);
      __n128 v27 = swift_bridgeObjectRetain(v21);
      uint64_t v28 = v53;
      uint64_t v29 = v22;
      uint64_t v30 = v20;
      uint64_t v31 = v61;
      URL.init(filePath:directoryHint:relativeTo:)(v60, v21, v24, v29, v27);
      v65[0] = v31;
      v65[1] = v30;
      v23(v24, v25, v26);
      unint64_t v32 = sub_10001E080();
      uint64_t v33 = v52;
      URL.appending<A>(path:directoryHint:)(v65, v24, &type metadata for String, v32);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v26);
      uint64_t v34 = v64;
      unint64_t v35 = *(void (**)(char *, uint64_t))(v63 + 8);
      v35(v28, v64);
      object = URL.path(percentEncoded:)(0)._object;
      v35(v33, v34);
      id v37 = [(id)objc_opt_self(NSFileManager) defaultManager];
      NSString v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      LODWORD(object) = [v37 fileExistsAtPath:v38 isDirectory:&v66];

      if ((_DWORD)object)
      {
        if ((v66 & 1) != 0) {
          break;
        }
      }

      swift_bridgeObjectRelease(v30);
      unint64_t v19 = v62 + 1;
      uint64_t v18 = v59 + 2;
      if (v49 + v62 + 1 == 1) {
        return v48;
      }
    }

    BOOL v39 = v48;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v48);
    uint64_t v15 = v39;
    uint64_t v67 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10001B15C(0, v39[2] + 1LL, 1);
      uint64_t v15 = v67;
    }

    unint64_t v13 = v62;
    uint64_t v14 = v45;
    unint64_t v42 = v15[2];
    unint64_t v41 = v15[3];
    if (v42 >= v41 >> 1)
    {
      sub_10001B15C(v41 > 1, v42 + 1, 1);
      uint64_t v15 = v67;
    }

    v15[2] = v42 + 1;
    uint64_t v43 = &v15[2 * v42];
    v43[4] = v31;
    v43[5] = v30;
    unint64_t v12 = v46;
  }

  while (v49 + v13);
  return v15;
}

uint64_t sub_10001C2A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  uint64_t v8 = *(void *)(sub_10000B4F4(&qword_1000592D8) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001C3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v5 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v23 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t j = 0LL;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v10 | (j << 6); ; unint64_t i = __clz(__rbit64(v13)) + (j << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v25 = a3;
    v26[0] = 0x7473696C702ELL;
    v26[1] = 0xE600000000000000LL;
    uint64_t v24 = v27;
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(a3);
    uint64_t v24 = String.init<A>(_:)( &v24,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
    uint64_t v25 = v18;
    String.append<A>(contentsOf:)(v26, &type metadata for String, &protocol witness table for String);
    uint64_t v19 = v25;
    if (v17 == v24 && v16 == v25)
    {
      swift_release(a1);
      swift_bridgeObjectRelease(v16);
      return v17;
    }

    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v16, v24, v25, 0LL);
    swift_bridgeObjectRelease(v19);
    if ((v21 & 1) != 0)
    {
      swift_release(a1);
      return v17;
    }

    uint64_t result = swift_bridgeObjectRelease(v16);
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = j + 1;
    if (__OFADD__(j, 1LL)) {
      break;
    }
    if (v12 >= v23) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v22 + 8 * v12);
    ++j;
    if (v13) {
      goto LABEL_19;
    }
    int64_t j = v12 + 1;
    if (v12 + 1 >= v23) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v22 + 8 * j);
    if (v13) {
      goto LABEL_19;
    }
    int64_t j = v12 + 2;
    if (v12 + 2 >= v23) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v22 + 8 * j);
    if (v13) {
      goto LABEL_19;
    }
    int64_t j = v12 + 3;
    if (v12 + 3 >= v23) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v22 + 8 * j);
    if (v13) {
      goto LABEL_19;
    }
    int64_t v14 = v12 + 4;
    if (v14 >= v23)
    {
LABEL_29:
      swift_release(a1);
      return 0LL;
    }

    unint64_t v13 = *(void *)(v22 + 8 * v14);
    for (int64_t j = v14; !v13; ++v14)
    {
      int64_t j = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        goto LABEL_32;
      }
      if (j >= v23) {
        goto LABEL_29;
      }
      unint64_t v13 = *(void *)(v22 + 8 * j);
    }

LABEL_19:
    unint64_t v7 = (v13 - 1) & v13;
  }

  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

char *sub_10001C634(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if ((v4 & 0x8000000000000000LL) != 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void *sub_10001C718(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v146 = *(void *)(v4 - 8);
  uint64_t v147 = v4;
  __chkstk_darwin(v4);
  os_log_type_t v145 = (char *)&v129 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v6);
  id v144 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v149 = type metadata accessor for URL(0LL);
  uint64_t v143 = *(void *)(v149 - 8);
  uint64_t v8 = __chkstk_darwin(v149);
  uint64_t v135 = (char *)&v129 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v129 = (char *)&v129 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v142 = (char *)&v129 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v129 - v14;
  id v141 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v16 = [v141 defaultManager];
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v140 = *(void *)(a1 + 40);
  uint64_t v139 = v17;
  NSString v18 = String._bridgeToObjectiveC()();
  v160[0] = 0LL;
  id v19 = [v16 contentsOfDirectoryAtPath:v18 error:v160];

  id v20 = v160[0];
  if (v19)
  {
    uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);
    id v22 = v20;

    swift_retain(a1);
    int64_t v23 = sub_10001BE70(v21, a1);
    uint64_t v134 = 0LL;
    swift_bridgeObjectRelease(v21);
    swift_release(a1);
    uint64_t v24 = (void *)sub_10002EF58((uint64_t)v23);
    swift_bridgeObjectRelease(v23);
  }

  else
  {
    id v26 = v160[0];
    uint64_t v27 = _convertNSErrorToError(_:)(v20);

    swift_willThrow(v28);
    swift_errorRelease(v27);
    uint64_t v134 = 0LL;
    uint64_t v24 = &_swiftEmptySetSingleton;
  }

  int64_t v29 = 0LL;
  uint64_t v30 = v24[7];
  uint64_t v150 = (char *)(v24 + 7);
  uint64_t v31 = 1LL << *((_BYTE *)v24 + 32);
  uint64_t v32 = -1LL;
  if (v31 < 64) {
    uint64_t v32 = ~(-1LL << v31);
  }
  unint64_t v33 = v32 & v30;
  int64_t v151 = (unint64_t)(v31 + 63) >> 6;
  unsigned int v137 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v131 = a2 + 7;
  BOOL v130 = _swiftEmptyArrayStorage;
  *(void *)&__int128 v25 = 136315138LL;
  __int128 v136 = v25;
  char v132 = (char *)&type metadata for Any + 8;
  *(void *)&__int128 v25 = 136315394LL;
  __int128 v133 = v25;
  uint64_t v148 = a2;
  uint64_t v152 = v15;
  BOOL v138 = v24;
  while (1)
  {
    if (v33)
    {
      unint64_t v35 = __clz(__rbit64(v33));
      v33 &= v33 - 1;
      unint64_t v36 = v35 | (v29 << 6);
      goto LABEL_20;
    }

    if (__OFADD__(v29++, 1LL)) {
      goto LABEL_64;
    }
    if (v29 >= v151) {
      break;
    }
    unint64_t v38 = *(void *)&v150[8 * v29];
    if (!v38)
    {
      int64_t v39 = v29 + 1;
      if (v29 + 1 >= v151) {
        break;
      }
      unint64_t v38 = *(void *)&v150[8 * v39];
      if (v38) {
        goto LABEL_18;
      }
      int64_t v39 = v29 + 2;
      if (v29 + 2 >= v151) {
        break;
      }
      unint64_t v38 = *(void *)&v150[8 * v39];
      if (v38)
      {
LABEL_18:
        int64_t v29 = v39;
      }

      else
      {
        int64_t v111 = v29 + 3;
        if (v29 + 3 >= v151) {
          break;
        }
        unint64_t v38 = *(void *)&v150[8 * v111];
        for (v29 += 3LL; !v38; ++v111)
        {
          int64_t v29 = v111 + 1;
          if (__OFADD__(v111, 1LL)) {
            goto LABEL_65;
          }
          if (v29 >= v151) {
            goto LABEL_62;
          }
          unint64_t v38 = *(void *)&v150[8 * v29];
        }
      }
    }

    unint64_t v33 = (v38 - 1) & v38;
    unint64_t v36 = __clz(__rbit64(v38)) + (v29 << 6);
LABEL_20:
    uint64_t v40 = (void *)(v24[6] + 16 * v36);
    unint64_t v42 = (void *)*v40;
    unint64_t v41 = v40[1];
    uint64_t v43 = a2[2];
    if (!v43) {
      goto LABEL_43;
    }
    char v44 = (void *)a2[4];
    uint64_t v45 = a2[5];
    BOOL v46 = v44 == v42 && v45 == v41;
    if (v46 || (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, *v40, v40[1], 0LL) & 1) != 0)
    {
LABEL_26:
      uint64_t v157 = v42;
      uint64_t v47 = qword_100058F68;
      swift_bridgeObjectRetain(v41);
      if (v47 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v48 = type metadata accessor for Logger(0LL);
      uint64_t v49 = sub_10000C538(v48, (uint64_t)qword_10005A7E0);
      uint64_t v50 = swift_bridgeObjectRetain_n(v41, 2LL);
      uint64_t v154 = v49;
      uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
      os_log_type_t v52 = static os_log_type_t.debug.getter();
      BOOL v53 = os_log_type_enabled(v51, v52);
      unint64_t v155 = v33;
      int64_t v156 = v29;
      unint64_t v153 = (void *)v41;
      if (v53)
      {
        uint64_t v54 = swift_slowAlloc(12LL, -1LL);
        unint64_t v55 = (void *)swift_slowAlloc(32LL, -1LL);
        v160[0] = v55;
        *(_DWORD *)uint64_t v54 = v136;
        swift_bridgeObjectRetain(v41);
        *(void *)(v54 + 4) = sub_10000B540((uint64_t)v157, v41, (uint64_t *)v160);
        swift_bridgeObjectRelease_n(v41, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Pruning taskFolder: %s", (uint8_t *)v54, 0xCu);
        swift_arrayDestroy(v55, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v55, -1LL, -1LL);
        swift_slowDealloc(v54, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v41, 2LL);
      }

      uint64_t v56 = v143;
      uint64_t v57 = v144;
      uint64_t v58 = v149;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v143 + 56))(v144, 1LL, 1LL, v149);
      uint64_t v60 = v145;
      uint64_t v59 = v146;
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v146 + 104);
      uint64_t v62 = v137;
      uint64_t v63 = v147;
      v61(v145, v137, v147);
      uint64_t v64 = v139;
      __n128 v65 = swift_bridgeObjectRetain(v139);
      char v66 = v142;
      URL.init(filePath:directoryHint:relativeTo:)(v140, v64, v60, v57, v65);
      uint64_t v67 = v153;
      v160[0] = v157;
      v160[1] = v153;
      uint64_t v68 = v62;
      uint64_t v69 = v58;
      v61(v60, v68, v63);
      unint64_t v70 = sub_10001E080();
      char v71 = v152;
      URL.appending<A>(path:directoryHint:)(v160, v60, &type metadata for String, v70);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v63);
      uint64_t v72 = *(void (**)(char *, uint64_t))(v56 + 8);
      v72(v66, v58);
      id v73 = [v141 defaultManager];
      URL._bridgeToObjectiveC()(v74);
      uint64_t v76 = v75;
      v160[0] = 0LL;
      LODWORD(v59) = [v73 removeItemAtURL:v75 error:v160];

      id v77 = v160[0];
      if ((_DWORD)v59)
      {
        uint64_t v112 = v67;
        uint64_t v113 = v129;
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v129, v71, v69);
        __n128 v114 = (os_log_s *)Logger.logObject.getter(v77);
        os_log_type_t v115 = static os_log_type_t.info.getter(v114);
        if (os_log_type_enabled(v114, v115))
        {
          uint64_t v116 = swift_slowAlloc(12LL, -1LL);
          unint64_t v117 = (void *)swift_slowAlloc(32LL, -1LL);
          v160[0] = v117;
          *(_DWORD *)uint64_t v116 = v136;
          uint64_t v118 = sub_100005038( &qword_1000595E0,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
          uint64_t v119 = dispatch thunk of CustomStringConvertible.description.getter(v69, v118);
          unint64_t v121 = v120;
          *(void *)(v116 + 4) = sub_10000B540(v119, v120, (uint64_t *)v160);
          swift_bridgeObjectRelease(v121);
          v72(v113, v69);
          _os_log_impl((void *)&_mh_execute_header, v114, v115, "Removed taskFolder: %s", (uint8_t *)v116, 0xCu);
          swift_arrayDestroy(v117, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v117, -1LL, -1LL);
          swift_slowDealloc(v116, -1LL, -1LL);
        }

        else
        {
          v72(v113, v69);
        }

        a2 = v148;
        uint64_t v24 = v138;
        __n128 v122 = v157;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v130);
        int64_t v29 = v156;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          BOOL v130 = sub_10001A000(0LL, v130[2] + 1LL, 1, v130);
        }
        unint64_t v125 = v130[2];
        unint64_t v124 = v130[3];
        if (v125 >= v124 >> 1) {
          BOOL v130 = sub_10001A000((void *)(v124 > 1), v125 + 1, 1, v130);
        }
        uint64_t v126 = v130;
        void v130[2] = v125 + 1;
        unint64_t v127 = &v126[2 * v125];
        v127[4] = v122;
        v127[5] = v112;
        v72(v71, v149);
        unint64_t v33 = v155;
      }

      else
      {
        id v78 = v160[0];
        swift_bridgeObjectRelease(v67);
        uint64_t v79 = (void *)_convertNSErrorToError(_:)(v77);

        swift_willThrow(v80);
        v160[0] = v79;
        uint64_t v81 = sub_10000B4F4(&qword_1000595D0);
        uint64_t v82 = sub_10000C654(0LL, &qword_1000595D8, &OBJC_CLASS___NSError_ptr);
        swift_dynamicCast(&v158, v160, v81, v82, 0LL);
        uint64_t v83 = v158;
        uint64_t v84 = v135;
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v135, v71, v69);
        id v85 = v83;
        uint64_t v86 = (os_log_s *)Logger.logObject.getter(v85);
        os_log_type_t v87 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v86, v87))
        {
          uint64_t v88 = v84;
          uint64_t v89 = swift_slowAlloc(22LL, -1LL);
          unint64_t v90 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v91 = swift_slowAlloc(32LL, -1LL);
          uint64_t v159 = v91;
          *(_DWORD *)uint64_t v89 = v133;
          uint64_t v92 = sub_100005038( &qword_1000595E0,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
          uint64_t v93 = dispatch thunk of CustomStringConvertible.description.getter(v69, v92);
          unint64_t v95 = v94;
          *(void *)(v89 + 4) = sub_10000B540(v93, v94, &v159);
          swift_bridgeObjectRelease(v95);
          v72(v88, v69);
          *(_WORD *)(v89 + 12) = 2112;
          *(void *)(v89 + 14) = v85;
          *unint64_t v90 = v85;

          _os_log_impl( (void *)&_mh_execute_header,  v86,  v87,  "Failed at removing taskFolder: %s %@",  (uint8_t *)v89,  0x16u);
          uint64_t v96 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v90, 1LL, v96);
          swift_slowDealloc(v90, -1LL, -1LL);
          swift_arrayDestroy(v91, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v91, -1LL, -1LL);
          swift_slowDealloc(v89, -1LL, -1LL);

          uint64_t v34 = v152;
        }

        else
        {

          v72(v84, v69);
          uint64_t v34 = v71;
        }

        v72(v34, v69);
        a2 = v148;
        swift_errorRelease(v160[0]);
        uint64_t v134 = 0LL;
        uint64_t v24 = v138;
        unint64_t v33 = v155;
        int64_t v29 = v156;
      }
    }

    else
    {
      if (v43 != 1)
      {
        uint64_t v97 = v131;
        uint64_t v98 = 1LL;
        while (1)
        {
          uint64_t v99 = v98 + 1;
          if (__OFADD__(v98, 1LL)) {
            break;
          }
          uint64_t v100 = (void *)*(v97 - 1);
          uint64_t v101 = *v97;
          BOOL v102 = v100 == v42 && v101 == v41;
          if (v102 || (_stringCompareWithSmolCheck(_:_:expecting:)(v100, v101, v42, v41, 0LL) & 1) != 0) {
            goto LABEL_26;
          }
          v97 += 2;
          ++v98;
          if (v99 == v43) {
            goto LABEL_43;
          }
        }

        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
      }

LABEL_62:
  swift_release(v24);
  return v130;
}

void *sub_10001D3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v140 = *(void *)(v4 - 8);
  uint64_t v141 = v4;
  __chkstk_darwin(v4);
  uint64_t v139 = (char *)&v124 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v6);
  BOOL v138 = (char *)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v144 = type metadata accessor for URL(0LL);
  uint64_t v152 = *(void *)(v144 - 8);
  uint64_t v8 = __chkstk_darwin(v144);
  uint64_t v10 = (char *)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v126 = (char *)&v124 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  unsigned int v137 = (char *)&v124 - v14;
  __chkstk_darwin(v13);
  __int128 v136 = (char *)&v124 - v15;
  id v135 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v16 = [v135 defaultManager];
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v134 = *(void *)(a1 + 40);
  uint64_t v133 = v17;
  NSString v18 = String._bridgeToObjectiveC()();
  v155[0] = 0LL;
  id v19 = [v16 contentsOfDirectoryAtPath:v18 error:v155];

  id v20 = v155[0];
  if (v19)
  {
    uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);
    id v22 = v20;

    swift_retain(a1);
    int64_t v23 = sub_10001BE70(v21, a1);
    uint64_t v130 = 0LL;
    swift_bridgeObjectRelease(v21);
    swift_release(a1);
    uint64_t v24 = (void *)sub_10002EF58((uint64_t)v23);
    swift_bridgeObjectRelease(v23);
  }

  else
  {
    id v26 = v155[0];
    uint64_t v27 = _convertNSErrorToError(_:)(v20);

    swift_willThrow(v28);
    swift_errorRelease(v27);
    uint64_t v130 = 0LL;
    uint64_t v24 = &_swiftEmptySetSingleton;
  }

  int64_t v29 = 0LL;
  uint64_t v30 = v24[7];
  os_log_type_t v145 = (char *)(v24 + 7);
  uint64_t v31 = 1LL << *((_BYTE *)v24 + 32);
  uint64_t v32 = -1LL;
  if (v31 < 64) {
    uint64_t v32 = ~(-1LL << v31);
  }
  unint64_t v33 = v32 & v30;
  int64_t v146 = (unint64_t)(v31 + 63) >> 6;
  unsigned int v131 = enum case for URL.DirectoryHint.inferFromPath(_:);
  unint64_t v127 = _swiftEmptyArrayStorage;
  uint64_t v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  unint64_t v35 = qword_10005A7E0;
  *(void *)&__int128 v25 = 136315138LL;
  __int128 v143 = v25;
  uint64_t v129 = (char *)&type metadata for Any + 8;
  *(void *)&__int128 v25 = 136315394LL;
  __int128 v128 = v25;
  uint64_t v142 = a2;
  uint64_t v147 = v10;
  char v132 = v24;
  while (v33)
  {
    unint64_t v36 = __clz(__rbit64(v33));
    v33 &= v33 - 1;
    unint64_t v37 = v36 | (v29 << 6);
LABEL_21:
    unint64_t v41 = (uint64_t *)(v24[6] + 16 * v37);
    uint64_t v42 = *v41;
    unint64_t v43 = v41[1];
    swift_bridgeObjectRetain(v43);
    char v44 = sub_10000F5D4(v42, v43, a2);
    inst_props = v34[54].inst_props;
    if ((v44 & 1) != 0)
    {
      if (inst_props != (__objc2_prop_list *)-1LL) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v46 = type metadata accessor for Logger(0LL);
      sub_10000C538(v46, (uint64_t)v35);
      swift_bridgeObjectRetain(v43);
      uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
      os_log_type_t v49 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = swift_slowAlloc(12LL, -1LL);
        unint64_t v151 = v33;
        uint64_t v51 = v50;
        os_log_type_t v52 = v35;
        BOOL v53 = v24;
        uint64_t v54 = a2;
        unint64_t v55 = (void *)swift_slowAlloc(32LL, -1LL);
        v155[0] = v55;
        *(_DWORD *)uint64_t v51 = v143;
        swift_bridgeObjectRetain(v43);
        *(void *)(v51 + 4) = sub_10000B540(v42, v43, (uint64_t *)v155);
        swift_bridgeObjectRelease_n(v43, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Skipping taskFolder: %s", (uint8_t *)v51, 0xCu);
        swift_arrayDestroy(v55, 1LL, v129);
        uint64_t v56 = v55;
        a2 = v54;
        uint64_t v24 = v53;
        unint64_t v35 = v52;
        swift_slowDealloc(v56, -1LL, -1LL);
        uint64_t v57 = v51;
        unint64_t v33 = v151;
        uint64_t v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        swift_slowDealloc(v57, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v43, 2LL);
      }
    }

    else
    {
      if (inst_props != (__objc2_prop_list *)-1LL) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v58 = type metadata accessor for Logger(0LL);
      uint64_t v59 = sub_10000C538(v58, (uint64_t)v35);
      uint64_t v60 = swift_bridgeObjectRetain_n(v43, 2LL);
      uint64_t v61 = (os_log_s *)Logger.logObject.getter(v60);
      os_log_type_t v62 = static os_log_type_t.debug.getter();
      BOOL v63 = os_log_type_enabled(v61, v62);
      int64_t v150 = v29;
      unint64_t v151 = v33;
      uint64_t v148 = (void *)v43;
      uint64_t v149 = v59;
      if (v63)
      {
        uint64_t v64 = swift_slowAlloc(12LL, -1LL);
        __n128 v65 = (void *)swift_slowAlloc(32LL, -1LL);
        v155[0] = v65;
        *(_DWORD *)uint64_t v64 = v143;
        swift_bridgeObjectRetain(v43);
        *(void *)(v64 + 4) = sub_10000B540(v42, v43, (uint64_t *)v155);
        swift_bridgeObjectRelease_n(v43, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Pruning taskFolder: %s", (uint8_t *)v64, 0xCu);
        swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v65, -1LL, -1LL);
        swift_slowDealloc(v64, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v43, 2LL);
      }

      char v66 = (void *)v42;
      uint64_t v67 = v138;
      uint64_t v68 = v144;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v152 + 56))(v138, 1LL, 1LL, v144);
      unint64_t v70 = v139;
      uint64_t v69 = v140;
      char v71 = *(void (**)(char *, uint64_t, uint64_t))(v140 + 104);
      uint64_t v72 = v131;
      uint64_t v73 = v141;
      v71(v139, v131, v141);
      uint64_t v74 = v133;
      __n128 v75 = swift_bridgeObjectRetain(v133);
      uint64_t v76 = v137;
      URL.init(filePath:directoryHint:relativeTo:)(v134, v74, v70, v67, v75);
      id v77 = v66;
      v155[0] = v66;
      id v78 = v148;
      v155[1] = v148;
      v71(v70, v72, v73);
      unint64_t v79 = sub_10001E080();
      uint64_t v80 = v136;
      URL.appending<A>(path:directoryHint:)(v155, v70, &type metadata for String, v79);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v73);
      uint64_t v81 = *(void (**)(char *, uint64_t))(v152 + 8);
      v81(v76, v68);
      id v82 = [v135 defaultManager];
      URL._bridgeToObjectiveC()(v83);
      id v85 = v84;
      v155[0] = 0LL;
      LODWORD(v70) = [v82 removeItemAtURL:v84 error:v155];

      id v86 = v155[0];
      if ((_DWORD)v70)
      {
        unint64_t v125 = v77;
        uint64_t v109 = v126;
        (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v126, v80, v68);
        os_log_type_t v110 = (os_log_s *)Logger.logObject.getter(v86);
        os_log_type_t v111 = static os_log_type_t.info.getter(v110);
        if (os_log_type_enabled(v110, v111))
        {
          uint64_t v112 = swift_slowAlloc(12LL, -1LL);
          uint64_t v113 = (void *)swift_slowAlloc(32LL, -1LL);
          v155[0] = v113;
          *(_DWORD *)uint64_t v112 = v143;
          uint64_t v114 = sub_100005038( &qword_1000595E0,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
          uint64_t v115 = dispatch thunk of CustomStringConvertible.description.getter(v68, v114);
          unint64_t v117 = v116;
          *(void *)(v112 + 4) = sub_10000B540(v115, v116, (uint64_t *)v155);
          swift_bridgeObjectRelease(v117);
          v81(v109, v68);
          _os_log_impl((void *)&_mh_execute_header, v110, v111, "Removed taskFolder: %s", (uint8_t *)v112, 0xCu);
          swift_arrayDestroy(v113, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v113, -1LL, -1LL);
          swift_slowDealloc(v112, -1LL, -1LL);
        }

        else
        {
          v81(v109, v68);
        }

        a2 = v142;
        int64_t v29 = v150;
        unint64_t v33 = v151;
        uint64_t v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        if ((swift_isUniquelyReferenced_nonNull_native(v127) & 1) == 0) {
          unint64_t v127 = sub_10001A000(0LL, v127[2] + 1LL, 1, v127);
        }
        uint64_t v118 = v125;
        unint64_t v120 = v127[2];
        unint64_t v119 = v127[3];
        if (v120 >= v119 >> 1) {
          unint64_t v127 = sub_10001A000((void *)(v119 > 1), v120 + 1, 1, v127);
        }
        unint64_t v121 = v127;
        v127[2] = v120 + 1;
        __n128 v122 = &v121[2 * v120];
        v122[4] = v118;
        v122[5] = v78;
        v81(v80, v144);
        uint64_t v24 = v132;
        unint64_t v35 = qword_10005A7E0;
      }

      else
      {
        os_log_type_t v87 = v80;
        id v88 = v155[0];
        swift_bridgeObjectRelease(v78);
        uint64_t v89 = (void *)_convertNSErrorToError(_:)(v86);

        swift_willThrow(v90);
        v155[0] = v89;
        uint64_t v91 = sub_10000B4F4(&qword_1000595D0);
        uint64_t v92 = sub_10000C654(0LL, &qword_1000595D8, &OBJC_CLASS___NSError_ptr);
        swift_dynamicCast(&v153, v155, v91, v92, 0LL);
        uint64_t v93 = v153;
        unint64_t v94 = v147;
        (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v147, v87, v68);
        id v95 = v93;
        uint64_t v96 = (os_log_s *)Logger.logObject.getter(v95);
        os_log_type_t v97 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v96, v97))
        {
          uint64_t v98 = swift_slowAlloc(22LL, -1LL);
          uint64_t v99 = v68;
          uint64_t v100 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v101 = swift_slowAlloc(32LL, -1LL);
          uint64_t v154 = v101;
          *(_DWORD *)uint64_t v98 = v128;
          uint64_t v102 = sub_100005038( &qword_1000595E0,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
          uint64_t v103 = dispatch thunk of CustomStringConvertible.description.getter(v99, v102);
          unint64_t v105 = v104;
          *(void *)(v98 + 4) = sub_10000B540(v103, v104, &v154);
          swift_bridgeObjectRelease(v105);
          v81(v147, v99);
          *(_WORD *)(v98 + 12) = 2112;
          *(void *)(v98 + 14) = v95;
          *uint64_t v100 = v95;

          _os_log_impl( (void *)&_mh_execute_header,  v96,  v97,  "Failed at removing taskFolder: %s %@",  (uint8_t *)v98,  0x16u);
          uint64_t v106 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v100, 1LL, v106);
          swift_slowDealloc(v100, -1LL, -1LL);
          swift_arrayDestroy(v101, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v101, -1LL, -1LL);
          swift_slowDealloc(v98, -1LL, -1LL);

          os_log_type_t v107 = v87;
          uint64_t v108 = v99;
        }

        else
        {

          v81(v94, v68);
          os_log_type_t v107 = v87;
          uint64_t v108 = v68;
        }

        v81(v107, v108);
        a2 = v142;
        unint64_t v33 = v151;
        swift_errorRelease(v155[0]);
        uint64_t v130 = 0LL;
        uint64_t v24 = v132;
        int64_t v29 = v150;
        uint64_t v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        unint64_t v35 = qword_10005A7E0;
      }
    }
  }

  if (__OFADD__(v29++, 1LL))
  {
    __break(1u);
    goto LABEL_50;
  }

  if (v29 >= v146) {
    goto LABEL_48;
  }
  unint64_t v39 = *(void *)&v145[8 * v29];
  if (v39)
  {
LABEL_20:
    unint64_t v33 = (v39 - 1) & v39;
    unint64_t v37 = __clz(__rbit64(v39)) + (v29 << 6);
    goto LABEL_21;
  }

  int64_t v40 = v29 + 1;
  if (v29 + 1 >= v146) {
    goto LABEL_48;
  }
  unint64_t v39 = *(void *)&v145[8 * v40];
  if (v39) {
    goto LABEL_19;
  }
  int64_t v40 = v29 + 2;
  if (v29 + 2 >= v146) {
    goto LABEL_48;
  }
  unint64_t v39 = *(void *)&v145[8 * v40];
  if (v39)
  {
LABEL_19:
    int64_t v29 = v40;
    goto LABEL_20;
  }

  int64_t v40 = v29 + 3;
  if (v29 + 3 < v146)
  {
    unint64_t v39 = *(void *)&v145[8 * v40];
    if (!v39)
    {
      while (1)
      {
        int64_t v29 = v40 + 1;
        if (__OFADD__(v40, 1LL)) {
          break;
        }
        if (v29 >= v146) {
          goto LABEL_48;
        }
        unint64_t v39 = *(void *)&v145[8 * v29];
        ++v40;
        if (v39) {
          goto LABEL_20;
        }
      }

LABEL_50:
      __break(1u);
    }

    goto LABEL_19;
  }

unint64_t sub_10001E080()
{
  unint64_t result = qword_1000595C8;
  if (!qword_1000595C8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000595C8);
  }

  return result;
}

uint64_t sub_10001E0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001E0D4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10001E0DC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  int64_t v6 = 0LL;
  uint64_t v7 = result + 64;
  uint64_t v8 = 1LL << *(_BYTE *)(result + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(result + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_22:
    uint64_t v17 = (void *)(*(void *)(v5 + 48) + 16 * v13);
    uint64_t v18 = v17[1];
    if (*v17 != a2 || v18 != a3)
    {
      unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a2, a3, 0LL);
      if ((result & 1) == 0) {
        continue;
      }
    }

    return 1LL;
  }

  int64_t v14 = v6 + 1;
  if (__OFADD__(v6, 1LL))
  {
    __break(1u);
    goto LABEL_30;
  }

  if (v14 >= v11) {
    return 0LL;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v14);
  ++v6;
  if (v15) {
    goto LABEL_21;
  }
  int64_t v6 = v14 + 1;
  if (v14 + 1 >= v11) {
    return 0LL;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v6 = v14 + 2;
  if (v14 + 2 >= v11) {
    return 0LL;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v6 = v14 + 3;
  if (v14 + 3 >= v11) {
    return 0LL;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_21:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_22;
  }

  int64_t v16 = v14 + 4;
  if (v16 >= v11) {
    return 0LL;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_21;
  }

  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v6 >= v11) {
      return 0LL;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }

uint64_t sub_10001E254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B4F4(&qword_100059638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E29C( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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

uint64_t sub_10001E3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B4F4(&qword_100059668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E3FC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_100019578(a1, a2, a3, *(void *)(v3 + 16)) & 1;
}

void sub_10001E428()
{
  uint64_t v1 = v0;
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v40 = sub_10000C538(v2, (uint64_t)qword_10005A7E0);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v40);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "MLHostDaemon starting", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  int64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___BGSystemTaskScheduler);
  id v7 = [v6 sharedScheduler];
  NSString v8 = String._bridgeToObjectiveC()();
  uint64_t v46 = sub_100024918;
  uint64_t v47 = 0LL;
  aBos_unfair_lock_t lock = _NSConcreteStackBlock;
  uint64_t v43 = 1107296256LL;
  char v44 = sub_1000210C0;
  uint64_t v45 = &unk_100055D78;
  uint64_t v9 = _Block_copy(&aBlock);
  [v7 registerForTaskWithIdentifier:v8 usingQueue:0 launchHandler:v9];
  _Block_release(v9);

  sub_100020904();
  sub_100023798();
  sub_100023E24();
  type metadata accessor for XPCListener(0LL);
  uint64_t v10 = *(void **)(v1 + 40);
  id v11 = v10;
  swift_retain(v1);
  uint64_t v12 = XPCListener.__allocating_init(serviceName:queue:handler:)( 0xD000000000000015LL,  0x800000010004A3D0LL,  v10,  sub_10002BAAC,  v1);
  uint64_t v13 = swift_retain(v12);
  unint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    int64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v17 = v6;
    uint64_t v18 = (void **)swift_slowAlloc(32LL, -1LL);
    aBos_unfair_lock_t lock = v18;
    *(_DWORD *)int64_t v16 = 136315138;
    uint64_t v19 = XPCListener.description.getter();
    unint64_t v21 = v20;
    uint64_t v41 = sub_10000B540(v19, v20, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &aBlock, v16 + 4, v16 + 12);
    swift_release_n(v12, 2LL);
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "XPC listener: (%s)", v16, 0xCu);
    swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
    id v22 = v18;
    int64_t v6 = v17;
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v12, 2LL);
  }

  uint64_t v23 = *(void *)(v1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry);
  uint64_t v24 = (os_unfair_lock_s *)(*(void *)(v23 + 16) + 16LL);
  swift_retain(v1);
  os_unfair_lock_lock(v24);
  uint64_t v25 = swift_allocObject(&unk_100055DB0, 32LL, 7LL);
  *(void *)(v25 + 16) = sub_10002BAB4;
  *(void *)(v25 + 24) = v1;
  swift_beginAccess(v23 + 72, &aBlock, 33LL, 0LL);
  swift_retain(v1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v23 + 72));
  uint64_t v41 = *(void *)(v23 + 72);
  *(void *)(v23 + 72) = 0x8000000000000000LL;
  sub_10002D264( (uint64_t)sub_10002BAFC,  v25,  0xD000000000000016LL,  0x800000010004A3F0LL,  isUniquelyReferenced_nonNull_native);
  uint64_t v27 = *(void *)(v23 + 72);
  *(void *)(v23 + 72) = v41;
  swift_bridgeObjectRelease(v27);
  swift_endAccess(&aBlock);
  os_unfair_lock_unlock(v24);
  swift_release(v1);
  id v28 = [v6 sharedScheduler];
  NSString v29 = String._bridgeToObjectiveC()();
  uint64_t v46 = sub_10002D3D8;
  uint64_t v47 = v1;
  aBos_unfair_lock_t lock = _NSConcreteStackBlock;
  uint64_t v43 = 1107296256LL;
  char v44 = sub_1000210C0;
  uint64_t v45 = &unk_100055DC8;
  uint64_t v30 = _Block_copy(&aBlock);
  uint64_t v31 = v47;
  swift_retain(v1);
  swift_release(v31);
  [v28 registerForTaskWithIdentifier:v29 usingQueue:0 launchHandler:v30];
  _Block_release(v30);

  id v32 = [v6 sharedScheduler];
  NSString v33 = String._bridgeToObjectiveC()();
  uint64_t v46 = sub_10002D3E0;
  uint64_t v47 = v1;
  aBos_unfair_lock_t lock = _NSConcreteStackBlock;
  uint64_t v43 = 1107296256LL;
  char v44 = sub_1000210C0;
  uint64_t v45 = &unk_100055DF0;
  uint64_t v34 = _Block_copy(&aBlock);
  uint64_t v35 = v47;
  swift_retain(v1);
  swift_release(v35);
  [v32 registerForTaskWithIdentifier:v33 usingQueue:0 launchHandler:v34];
  _Block_release(v34);

  unint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
  os_log_type_t v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    unint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "MLHostDaemon started", v39, 2u);
    swift_slowDealloc(v39, -1LL, -1LL);
  }

  dispatch_main();
}

unint64_t sub_10001E9D8(uint64_t a1)
{
  return sub_10001EB38(a1, &qword_100059660);
}

unint64_t sub_10001E9E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    os_log_type_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(&qword_100059860);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  os_log_type_t v4 = (void *)v3;
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
    sub_10003EF84(v7, (uint64_t)&v14, &qword_100059868);
    uint64_t v8 = v14;
    unint64_t result = sub_10002BC64(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_10000C6CC(&v15, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v7 += 40LL;
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

unint64_t sub_10001EB10(uint64_t a1)
{
  return sub_10001ED90( a1,  &qword_100059908,  &qword_1000595F0,  (uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

unint64_t sub_10001EB2C(uint64_t a1)
{
  return sub_10001EB38(a1, &qword_100059690);
}

unint64_t sub_10001EB38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(a2);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v8 = *(v7 - 2);
    uint64_t v9 = *(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    unint64_t result = sub_10002BC00(v8, v9);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v5[6] + 16 * result);
    *uint64_t v13 = v8;
    v13[1] = v9;
    *(void *)(v5[7] + 8 * result) = v10;
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5[2] = v16;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10001EC4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(&qword_100059618);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *((void *)v6 - 2);
    uint64_t v8 = *((void *)v6 - 1);
    __int128 v15 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_retain(*((void *)&v15 + 1));
    unint64_t result = sub_10002BC00(v7, v8);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    *(_OWORD *)(v4[7] + 16 * result) = v15;
    uint64_t v12 = v4[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4[2] = v14;
    v6 += 2;
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

unint64_t sub_10001ED74(uint64_t a1)
{
  return sub_10001ED90( a1,  &qword_100059910,  &qword_100059678,  (uint64_t (*)(void))&type metadata accessor for TaskDefinition);
}

unint64_t sub_10001ED90(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  NSString v33 = a4;
  uint64_t v34 = a2;
  uint64_t v6 = sub_10000B4F4(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v10 = *(void *)(a1 + 16);
  if (!v10)
  {
    uint64_t v12 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v30 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v30);
    return (unint64_t)v12;
  }

  sub_10000B4F4(a3);
  uint64_t v11 = static _DictionaryStorage.allocate(capacity:)(v10);
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = (char *)v9 + *(int *)(v6 + 48);
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v32 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v7 + 72);
  swift_retain(v11);
  while (1)
  {
    sub_10003EF84(v17, (uint64_t)v9, v34);
    uint64_t v19 = *v9;
    uint64_t v20 = v9[1];
    unint64_t result = sub_10002BC00(*v9, v20);
    if ((v22 & 1) != 0) {
      break;
    }
    unint64_t v23 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v24 = (uint64_t *)(v12[6] + 16 * result);
    uint64_t *v24 = v19;
    v24[1] = v20;
    uint64_t v25 = v12[7];
    uint64_t v26 = v33(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v26 - 8) + 32LL))( v25 + *(void *)(*(void *)(v26 - 8) + 72LL) * v23,  v14,  v26);
    uint64_t v27 = v12[2];
    BOOL v28 = __OFADD__(v27, 1LL);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_12;
    }
    v12[2] = v29;
    v17 += v18;
    if (!--v13)
    {
      swift_release(v12);
      uint64_t v30 = v32;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10001EF2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(&qword_100059688);
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
    sub_10003EF84(v7, (uint64_t)&v16, &qword_100059930);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_10002BC00(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10000C6CC(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_10001F060(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(&qword_100059920);
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
    sub_10003EF84(v7, (uint64_t)v16, &qword_100059928);
    unint64_t result = sub_10002BCE4((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    unint64_t result = (unint64_t)sub_10000C6CC(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 72LL;
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

unint64_t sub_10001F1A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(&qword_100059900);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v6 - 2);
    uint64_t v8 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    unint64_t result = sub_10002BC00(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    __int128 v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v6 += 3;
    v4[2] = v15;
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

unint64_t sub_10001F2B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000B4F4(&qword_1000597E0);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v6 - 2);
    uint64_t v8 = (uint64_t)*(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_10002BC00(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4[2] = v16;
    v6 += 3;
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

uint64_t sub_10001F3C8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10002BA54(v0, qword_10005A7E0);
  sub_10000C538(v0, (uint64_t)qword_10005A7E0);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x800000010004A370LL,  0x6474736F686C6DLL,  0xE700000000000000LL);
}

void sub_10001F43C()
{
  qword_100059698 = (uint64_t)&off_1000557C0;
}

void sub_10001F450()
{
  qword_1000596A0 = (uint64_t)&off_100055800;
}

void sub_10001F464()
{
  qword_1000596A8 = (uint64_t)&off_100055850;
}

void *sub_10001F478()
{
  unint64_t result = (void *)sub_10001F1A0((uint64_t)&off_100055890);
  off_1000596B0 = result;
  return result;
}

unint64_t sub_10001F49C()
{
  uint64_t v0 = sub_10000B4F4(&qword_100059918);
  uint64_t inited = swift_initStackObject(v0, v3);
  *(_OWORD *)(inited + 16) = xmmword_100040D00;
  *(void *)(inited + 32) = 0xD000000000000016LL;
  *(void *)(inited + 40) = 0x800000010004A3F0LL;
  *(void *)(inited + 48) = &off_100051250;
  unint64_t result = sub_10001EB38(inited, &qword_100059660);
  qword_1000596B8 = result;
  return result;
}

void *sub_10001F510@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_10001F51C(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_10001F524@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_10001F538@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10001F54C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10001F560(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_10001F590@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10001F5BC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10001F5E0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10001F5F4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10001F608(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_10001F61C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10001F630(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_10001F644(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_10001F658(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_10001F66C()
{
  return *v0 == 0LL;
}

uint64_t sub_10001F67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_10001F694(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_10001F6A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000302A8(a1);
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_10001F6E4()
{
  uint64_t v0 = type metadata accessor for MLHostDaemon(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = sub_10001F720();
  qword_10005A7F8 = result;
  return result;
}

uint64_t sub_10001F720()
{
  uint64_t v116 = *(void *)v0;
  uint64_t v1 = type metadata accessor for MLHostConfig(0LL);
  uint64_t v118 = *(void *)(v1 - 8);
  uint64_t v119 = v1;
  __chkstk_darwin(v1);
  unint64_t v117 = (char *)&v105 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v113 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v108 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v4 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v110 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v110);
  os_log_type_t v111 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v6);
  uint64_t v109 = (char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v8);
  id v10 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  BOOL v15 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  unint64_t v120 = (char *)&v105 - v16;
  char has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.mlhost");
  uint64_t v112 = v0;
  *(_BYTE *)(v0 + 16) = has_internal_diagnostics;
  id v18 = [(id)objc_opt_self(NSFileManager) defaultManager];
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [v18 containerURLForSecurityApplicationGroupIdentifier:v19];

  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1LL, 1LL, v11);
    goto LABEL_39;
  }

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v20);

  unint64_t v21 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v21(v10, v15, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0LL, 1LL, v11);
  uint64_t v114 = v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11) == 1)
  {
LABEL_39:
    sub_10000C7CC((uint64_t)v10, &qword_1000595C0);
    uint64_t v123 = 0LL;
    unint64_t v124 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(42LL);
    swift_bridgeObjectRelease(v124);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000003ELL,  0x800000010004A6C0LL,  "mlhostd/MLHostDaemon.swift",  26LL,  2LL,  118LL,  0);
    __break(1u);
    return result;
  }

  uint64_t v115 = v11;
  v21(v120, v10, v11);
  Swift::String v22 = URL.path(percentEncoded:)(0);
  uint64_t v23 = v112;
  *(Swift::String *)(v112 + 24) = v22;
  sub_10000C654(0LL, &qword_1000592B0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v24 = v109;
  static DispatchQoS.unspecified.getter(v25);
  uint64_t v123 = _swiftEmptyArrayStorage;
  uint64_t v26 = sub_100005038( &qword_1000592B8,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v106 = v26;
  uint64_t v27 = sub_10000B4F4(&qword_1000592C0);
  uint64_t v105 = v27;
  unint64_t v107 = sub_10003EF38();
  BOOL v28 = v111;
  uint64_t v29 = v110;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v123, v27, v107, v110, v26);
  uint64_t v30 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v108 + 104);
  uint64_t v32 = v113;
  v31(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v113);
  *(void *)(v23 + 40) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000024LL,  0x800000010004A700LL,  v24,  v28,  v4,  0LL);
  static DispatchQoS.background.getter();
  uint64_t v123 = _swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v123, v105, v107, v29, v106);
  uint64_t v33 = v32;
  uint64_t v34 = v23;
  v31(v4, v30, v33);
  *(void *)(v23 + 48) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001DLL,  0x800000010004A730LL,  v24,  v28,  v4,  0LL);
  uint64_t v35 = v117;
  sub_100020540();
  uint64_t v36 = v23 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  (*(void (**)(uint64_t, char *, uint64_t))(v118 + 32))( v23 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config,  v35,  v119);
  if (*(_BYTE *)(v23 + 16) == 1)
  {
    swift_beginAccess(v36, &v123, 33LL, 0LL);
    MLHostConfig.cloudEnvironment.setter(0x6D706F6C65766564LL, 0xEB00000000746E65LL);
    MLHostConfig.cloudContainer.setter(0xD000000000000022LL, 0x800000010004A750LL);
    swift_endAccess(&v123);
  }

  uint64_t v37 = swift_beginAccess(v36, &v123, 32LL, 0LL);
  uint64_t v38 = MLHostConfig.apsEnvironment.getter(v37);
  uint64_t v40 = v39;
  swift_endAccess(&v123);
  if (!v40) {
    goto LABEL_13;
  }
  if (v38 != 0x6D706F6C65766564LL || v40 != 0xEB00000000746E65LL)
  {
    char v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v40, 0x6D706F6C65766564LL, 0xEB00000000746E65LL, 0LL);
    swift_bridgeObjectRelease(v40);
    if ((v41 & 1) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v43 = sub_10000B4F4(&qword_100059918);
    uint64_t inited = swift_initStackObject(v43, v122);
    *(_OWORD *)(inited + 16) = xmmword_100040D00;
    *(void *)(inited + 32) = 0xD000000000000016LL;
    *(void *)(inited + 40) = 0x800000010004A3F0LL;
    if (*(_BYTE *)(v23 + 16)) {
      uint64_t v45 = &off_100051280;
    }
    else {
      uint64_t v45 = &off_100051840;
    }
    uint64_t v46 = &off_100055160;
    if (*(_BYTE *)(v23 + 16)) {
      uint64_t v46 = &off_1000550A0;
    }
    uint64_t v123 = v46;
    swift_bridgeObjectRetain(v45);
    sub_100009AA4(v47);
    *(void *)(inited + 48) = v123;
    unint64_t v42 = sub_10001EB38(inited, &qword_100059660);
    goto LABEL_19;
  }

  swift_bridgeObjectRelease(0xEB00000000746E65LL);
LABEL_10:
  if (qword_100058F90 != -1) {
    swift_once(&qword_100058F90, sub_10001F49C);
  }
  unint64_t v42 = qword_1000596B8;
  swift_bridgeObjectRetain(qword_1000596B8);
LABEL_19:
  if (qword_100058F70 != -1) {
    swift_once(&qword_100058F70, sub_10001F43C);
  }
  uint64_t v48 = qword_100059698;
  uint64_t v49 = type metadata accessor for ExtensionKitRegistry();
  uint64_t v50 = (void *)swift_allocObject(v49, 48LL, 7LL);
  v50[3] = _swiftEmptyArrayStorage;
  v50[5] = &_swiftEmptySetSingleton;
  uint64_t v51 = sub_10000B4F4(&qword_1000592D0);
  uint64_t v52 = swift_allocObject(v51, 20LL, 7LL);
  *(_DWORD *)(v52 + 16) = 0;
  v50[2] = v52;
  v50[4] = v48;
  *(void *)(v34 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry) = v50;
  uint64_t v53 = *(void *)(v34 + 24);
  uint64_t v54 = *(char **)(v34 + 32);
  uint64_t v55 = qword_100058F78;
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRetain(v54);
  if (v55 != -1) {
    swift_once(&qword_100058F78, sub_10001F450);
  }
  uint64_t v56 = (char *)qword_1000596A0;
  uint64_t v57 = type metadata accessor for TaskRegistry();
  swift_allocObject(v57, 88LL, 7LL);
  swift_bridgeObjectRetain(v56);
  *(void *)(v34 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry) = sub_10000F780(v53, v54, v56);
  uint64_t v58 = swift_beginAccess(v36, &v123, 32LL, 0LL);
  uint64_t v59 = (void *)MLHostConfig.apsEnvironment.getter(v58);
  uint64_t v61 = v60;
  swift_endAccess(&v123);
  uint64_t v62 = type metadata accessor for NotificationRegistry();
  swift_allocObject(v62, 80LL, 7LL);
  *(void *)(v34 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry) = sub_100005F64(v42, v59, v61, 0LL);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v63 = type metadata accessor for Logger(0LL);
  uint64_t v64 = sub_10000C538(v63, (uint64_t)qword_10005A7E0);
  uint64_t v65 = swift_retain_n(v34, 2LL);
  char v66 = (os_log_s *)Logger.logObject.getter(v65);
  os_log_type_t v67 = static os_log_type_t.info.getter(v66);
  BOOL v68 = os_log_type_enabled(v66, v67);
  uint64_t v116 = v64;
  if (v68)
  {
    uint64_t v69 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v70 = (void *)swift_slowAlloc(32LL, -1LL);
    uint64_t v113 = (uint64_t)v70;
    *(_DWORD *)uint64_t v69 = 136315138;
    uint64_t v123 = v70;
    os_log_type_t v111 = (char *)(v69 + 4);
    char v71 = v117;
    uint64_t v72 = v118;
    uint64_t v73 = v119;
    (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))( v117,  v34 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config,  v119);
    uint64_t v74 = sub_100005038( &qword_1000598E8,  (uint64_t (*)(uint64_t))&type metadata accessor for MLHostConfig,  (uint64_t)&protocol conformance descriptor for MLHostConfig);
    uint64_t v75 = dispatch thunk of CustomStringConvertible.description.getter(v73, v74);
    unint64_t v77 = v76;
    (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
    uint64_t v121 = sub_10000B540(v75, v77, (uint64_t *)&v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, v122, v111, v69 + 12);
    swift_release_n(v34, 2LL);
    swift_bridgeObjectRelease(v77);
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "MLHostDaemon config: %s", v69, 0xCu);
    uint64_t v78 = v113;
    swift_arrayDestroy(v113, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v78, -1LL, -1LL);
    swift_slowDealloc(v69, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v34, 2LL);
  }

  uint64_t v79 = swift_retain(v34);
  uint64_t v80 = (os_log_s *)Logger.logObject.getter(v79);
  os_log_type_t v81 = static os_log_type_t.info.getter(v80);
  if (os_log_type_enabled(v80, v81))
  {
    id v82 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v83 = (void *)swift_slowAlloc(32LL, -1LL);
    uint64_t v123 = v83;
    *(_DWORD *)id v82 = 136315138;
    uint64_t v84 = *(void *)(v34 + 24);
    unint64_t v85 = *(void *)(v34 + 32);
    swift_bridgeObjectRetain(v85);
    uint64_t v121 = sub_10000B540(v84, v85, (uint64_t *)&v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, v122, v82 + 4, v82 + 12);
    swift_release(v34);
    swift_bridgeObjectRelease(v85);
    _os_log_impl((void *)&_mh_execute_header, v80, v81, "MLHostDaemon baseFolder: %s", v82, 0xCu);
    swift_arrayDestroy(v83, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v83, -1LL, -1LL);
    swift_slowDealloc(v82, -1LL, -1LL);
  }

  else
  {

    swift_release(v34);
  }

  uint64_t v86 = swift_retain_n(v34, 2LL);
  os_log_type_t v87 = (os_log_s *)Logger.logObject.getter(v86);
  os_log_type_t v88 = static os_log_type_t.info.getter(v87);
  if (os_log_type_enabled(v87, v88))
  {
    uint64_t v89 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v90 = (void *)swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v89 = 136315138;
    uint64_t v123 = v90;
    uint64_t v91 = *(void *)(v34 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    swift_retain(v91);
    uint64_t v92 = sub_1000101EC();
    unint64_t v94 = v93;
    swift_release(v91);
    uint64_t v121 = sub_10000B540(v92, v94, (uint64_t *)&v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, v122, v89 + 4, v89 + 12);
    swift_release_n(v34, 2LL);
    swift_bridgeObjectRelease(v94);
    _os_log_impl((void *)&_mh_execute_header, v87, v88, "MLHostDaemon taskRegistry: %s", v89, 0xCu);
    swift_arrayDestroy(v90, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v90, -1LL, -1LL);
    swift_slowDealloc(v89, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v34, 2LL);
  }

  uint64_t v95 = swift_retain_n(v34, 2LL);
  uint64_t v96 = (os_log_s *)Logger.logObject.getter(v95);
  os_log_type_t v97 = static os_log_type_t.info.getter(v96);
  if (os_log_type_enabled(v96, v97))
  {
    uint64_t v98 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v99 = (void *)swift_slowAlloc(32LL, -1LL);
    *(_DWORD *)uint64_t v98 = 136315138;
    uint64_t v123 = v99;
    uint64_t v100 = *(void *)(v34 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry);
    swift_retain(v100);
    uint64_t v101 = sub_100008DFC();
    unint64_t v103 = v102;
    swift_release(v100);
    uint64_t v121 = sub_10000B540(v101, v103, (uint64_t *)&v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, v122, v98 + 4, v98 + 12);
    swift_release_n(v34, 2LL);
    swift_bridgeObjectRelease(v103);
    _os_log_impl((void *)&_mh_execute_header, v96, v97, "MLHostDaemon notificationRegistry: %s", v98, 0xCu);
    swift_arrayDestroy(v99, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v99, -1LL, -1LL);
    swift_slowDealloc(v98, -1LL, -1LL);
  }

  else
  {
    swift_release_n(v34, 2LL);
  }

  (*(void (**)(char *, uint64_t))(v114 + 8))(v120, v115);
  return v34;
}

void sub_100020540()
{
  unint64_t v0 = 0xEA00000000006E6FLL;
  uint64_t v1 = 0x69746375646F7270LL;
  id v2 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v3 = String._bridgeToObjectiveC()();
  id v26 = [v2 initWithSuiteName:v3];

  if (v26)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v26 stringForKey:v4];

    if (v5)
    {
      uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      unint64_t v0 = v6;
    }

    NSString v7 = String._bridgeToObjectiveC()();
    id v8 = [v26 stringForKey:v7];

    if (v8)
    {
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      unint64_t v11 = v10;
    }

    else
    {
      uint64_t v9 = 0xD00000000000001ALL;
      unint64_t v11 = 0x800000010004A780LL;
    }

    NSString v20 = String._bridgeToObjectiveC()();
    id v21 = [v26 stringForKey:v20];

    if (v21)
    {
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      uint64_t v24 = v23;
    }

    else
    {
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
      uint64_t v24 = v25;
    }

    MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)(v1, v0, v9, v11, v22, v24);
  }

  else
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    uint64_t v13 = sub_10000C538(v12, (uint64_t)qword_10005A7E0);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v17 = swift_slowAlloc(32LL, -1LL);
      uint64_t v28 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v27 = sub_10000B540(0xD000000000000010LL, 0x800000010004A600LL, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v16 + 4, v16 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Failed at reading UserDefaults(%s). Using default config.",  v16,  0xCu);
      swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
    MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)( 0x69746375646F7270LL,  0xEA00000000006E6FLL,  0xD00000000000001ALL,  0x800000010004A780LL,  v18,  v19);
  }

uint64_t sub_100020904()
{
  uint64_t v1 = os_transaction_create("loadTasks");
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  sub_10000CB24();
  NSString v3 = (os_unfair_lock_s *)(*(void *)(v2 + 16) + 16LL);
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void *)(v2 + 40);
  swift_bridgeObjectRetain(v4);
  unint64_t v6 = sub_10002E994(v5);
  swift_bridgeObjectRelease(v4);
  os_unfair_lock_unlock(v3);
  uint64_t v7 = sub_10002EF58((uint64_t)v6);
  swift_release(v6);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_10000C538(v8, (uint64_t)qword_10005A7E0);
  uint64_t v9 = swift_bridgeObjectRetain_n(v7, 2LL);
  unint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v1;
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v22 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    __n128 v14 = swift_bridgeObjectRetain(v7);
    uint64_t v15 = Set.description.getter(v14);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease(v7);
    uint64_t v21 = sub_10000B540(v15, v17, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(v7, 2LL);
    unint64_t v18 = v17;
    uint64_t v1 = v20;
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Discovered extensions identifiers: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v7, 2LL);
  }

  sub_1000172D0(v7);
  swift_unknownObjectRelease(v1);
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100020B64(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100020B90(uint64_t a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for MLHostTask(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_10000C538(v8, (uint64_t)qword_10005A7E0);
  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  unint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v21 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = MLHostTask.bundleIdentifier.getter(v14);
    unint64_t v17 = v16;
    uint64_t v20 = sub_10000B540(v15, v16, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v17);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v19, v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100020D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskStatus(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MLHostTask(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = swift_projectBox(a3);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  sub_10000C538(v14, (uint64_t)qword_10005A7E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  swift_errorRetain(a1);
  uint64_t v15 = swift_errorRetain(a1);
  unint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc(22LL, -1LL);
    uint64_t v34 = v7;
    uint64_t v19 = v18;
    uint64_t v31 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v20 = swift_slowAlloc(32LL, -1LL);
    uint64_t v32 = v20;
    v38[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v35 = v6;
    uint64_t v21 = MLHostTask.bundleIdentifier.getter(v20);
    unint64_t v23 = v22;
    uint64_t v37 = sub_10000B540(v21, v22, v38);
    uint64_t v33 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    *(_WORD *)(v19 + 12) = 2112;
    swift_errorRetain(a1);
    uint64_t v24 = _swift_stdlib_bridgeErrorToNSError(a1);
    uint64_t v37 = v24;
    uint64_t v9 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v19 + 14, v19 + 22);
    uint64_t v25 = v31;
    *uint64_t v31 = v24;
    uint64_t v6 = v35;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Error for XPCConnection with %s: %@", (uint8_t *)v19, 0x16u);
    uint64_t v26 = sub_10000B4F4(&qword_100059280);
    swift_arrayDestroy(v25, 1LL, v26);
    swift_slowDealloc(v25, -1LL, -1LL);
    uint64_t v27 = v32;
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1LL, -1LL);
    uint64_t v28 = v19;
    uint64_t v7 = v34;
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for TaskStatus.taskFailed(_:), v6);
  uint64_t v29 = v36;
  swift_beginAccess(v36, v38, 1LL, 0LL);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 40))(v29, v9, v6);
}

uint64_t sub_1000210C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v63 = a5;
  uint64_t v9 = type metadata accessor for MLHostTask(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  char v66 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v59 - v13;
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  os_log_type_t v67 = (void **)(a3 + 16);
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = sub_10000C538(v15, (uint64_t)qword_10005A7E0);
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v64(v14, a2, v9);
  id v17 = a1;
  uint64_t v65 = (void (*)(char *, uint64_t))v16;
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.info.getter(v18);
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc(22LL, -1LL);
    uint64_t v21 = swift_slowAlloc(8LL, -1LL);
    uint64_t v68 = v9;
    uint64_t v60 = (void *)v21;
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v61 = v22;
    v73[0] = v22;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v62 = a2;
    uint64_t v23 = MLHostTask.name.getter(v22);
    unint64_t v25 = v24;
    uint64_t v71 = sub_10000B540(v23, v24, v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, v72, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(v25);
    uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v14, v68);
    *(_WORD *)(v20 + 12) = 2112;
    uint64_t v71 = (uint64_t)v17;
    id v27 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, v72, v20 + 14, v20 + 22);
    uint64_t v28 = v60;
    void *v60 = v17;

    a2 = v62;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "Task %s completed shouldRun with result %@.",  (uint8_t *)v20,  0x16u);
    uint64_t v29 = sub_10000B4F4(&qword_100059280);
    swift_arrayDestroy(v28, 1LL, v29);
    uint64_t v9 = v68;
    swift_slowDealloc(v28, -1LL, -1LL);
    uint64_t v30 = v61;
    swift_arrayDestroy(v61, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {
    uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v14, v9);
  }

  uint64_t v31 = v67;
  swift_beginAccess(v67, v73, 1LL, 0LL);
  uint64_t v32 = *v31;
  *uint64_t v31 = v17;

  uint64_t v33 = MLHostResult.status.getter(v17);
  uint64_t v34 = MLHostResultStatus.rawValue.getter(v33);
  BOOL v37 = 0;
  if (v34 == MLHostResultStatus.rawValue.getter(2LL))
  {
    uint64_t v35 = MLHostResult.policy.getter();
    uint64_t v36 = MLHostResultPolicy.rawValue.getter(v35);
    if (v36 == MLHostResultPolicy.rawValue.getter(0LL)) {
      BOOL v37 = 1;
    }
  }

  uint64_t v38 = swift_beginAccess(a4 + 16, &v71, 1LL, 0LL);
  *(_BYTE *)(a4 + 16) = v37;
  uint64_t result = MLHostResult.errorString.getter(v38);
  if (v40)
  {
    uint64_t v41 = result;
    unint64_t v42 = v40;
    uint64_t v43 = v66;
    v64(v66, a2, v9);
    uint64_t v44 = swift_bridgeObjectRetain_n(v42, 2LL);
    uint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
    os_log_type_t v46 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = swift_slowAlloc(22LL, -1LL);
      uint64_t v65 = v26;
      uint64_t v48 = v43;
      uint64_t v49 = v47;
      uint64_t v50 = swift_slowAlloc(64LL, -1LL);
      os_log_type_t v67 = (void **)v50;
      uint64_t v68 = v9;
      uint64_t v70 = v50;
      *(_DWORD *)uint64_t v49 = 136315394;
      uint64_t v51 = MLHostTask.name.getter(v50);
      unint64_t v53 = v52;
      uint64_t v69 = sub_10000B540(v51, v52, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v49 + 4, v49 + 12);
      swift_bridgeObjectRelease(v53);
      v65(v48, v68);
      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain(v42);
      uint64_t v69 = sub_10000B540(v41, v42, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v49 + 14, v49 + 22);
      swift_bridgeObjectRelease_n(v42, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "Task %s returned error in shouldRun: %s",  (uint8_t *)v49,  0x16u);
      uint64_t v54 = v67;
      swift_arrayDestroy(v67, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v54, -1LL, -1LL);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    else
    {
      v26(v43, v9);

      uint64_t v55 = swift_bridgeObjectRelease_n(v42, 2LL);
    }

    uint64_t v56 = MLHostTask.name.getter(v55);
    unint64_t v58 = v57;
    sub_100013FB0(v56, v57, v41, v42);
    swift_bridgeObjectRelease(v42);
    return swift_bridgeObjectRelease(v58);
  }

  return result;
}

uint64_t sub_100021620(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v66 = a5;
  uint64_t v9 = type metadata accessor for TaskStatus(0LL);
  uint64_t v72 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v71 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for MLHostTask(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  id v17 = (char *)&v61 - v16;
  uint64_t v70 = swift_projectBox(a4);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v69 = (void **)(a3 + 16);
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_10000C538(v18, (uint64_t)qword_10005A7E0);
  os_log_type_t v67 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v67(v17, a2, v11);
  id v20 = a1;
  uint64_t v68 = v19;
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.info.getter(v21);
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc(22LL, -1LL);
    uint64_t v73 = v11;
    uint64_t v24 = v23;
    uint64_t v62 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v25 = swift_slowAlloc(32LL, -1LL);
    uint64_t v63 = v25;
    v78[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v65 = a2;
    uint64_t v26 = MLHostTask.name.getter(v25);
    unint64_t v28 = v27;
    uint64_t v76 = sub_10000B540(v26, v27, v78);
    uint64_t v64 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v28);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v12 + 8);
    v29(v17, v73);
    *(_WORD *)(v24 + 12) = 2112;
    uint64_t v76 = (uint64_t)v20;
    id v30 = v20;
    uint64_t v9 = v64;
    a2 = v65;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77, v24 + 14, v24 + 22);
    uint64_t v31 = v62;
    void *v62 = v20;

    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "Task %s completed doWork with result %@.",  (uint8_t *)v24,  0x16u);
    uint64_t v32 = sub_10000B4F4(&qword_100059280);
    swift_arrayDestroy(v31, 1LL, v32);
    swift_slowDealloc(v31, -1LL, -1LL);
    uint64_t v33 = v63;
    swift_arrayDestroy(v63, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1LL, -1LL);
    uint64_t v34 = v24;
    uint64_t v11 = v73;
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  else
  {
    uint64_t v29 = *(void (**)(char *, uint64_t))(v12 + 8);
    v29(v17, v11);
  }

  uint64_t v35 = v69;
  swift_beginAccess(v69, v78, 1LL, 0LL);
  uint64_t v36 = *v35;
  *uint64_t v35 = v20;

  uint64_t v37 = MLHostResult.status.getter(v20);
  uint64_t v38 = v71;
  if (v37 == 2)
  {
    uint64_t v40 = enum case for TaskStatus.taskCompleted(_:);
    uint64_t v39 = v72;
  }

  else
  {
    uint64_t v39 = v72;
    uint64_t v40 = enum case for TaskStatus.taskFailed(_:);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 104))(v71, v40, v9);
  uint64_t v41 = v70;
  swift_beginAccess(v70, &v76, 1LL, 0LL);
  uint64_t v42 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 40))(v41, v38, v9);
  uint64_t result = MLHostResult.errorString.getter(v42);
  if (v44)
  {
    uint64_t v45 = result;
    unint64_t v46 = v44;
    v67(v15, a2, v11);
    uint64_t v47 = swift_bridgeObjectRetain_n(v46, 2LL);
    uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
    os_log_type_t v49 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc(22LL, -1LL);
      uint64_t v73 = v11;
      uint64_t v51 = v50;
      uint64_t v52 = swift_slowAlloc(64LL, -1LL);
      uint64_t v71 = (char *)v52;
      uint64_t v75 = v52;
      *(_DWORD *)uint64_t v51 = 136315394;
      uint64_t v72 = v45;
      uint64_t v53 = MLHostTask.name.getter(v52);
      unint64_t v55 = v54;
      uint64_t v74 = sub_10000B540(v53, v54, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v51 + 4, v51 + 12);
      swift_bridgeObjectRelease(v55);
      v29(v15, v73);
      uint64_t v45 = v72;
      *(_WORD *)(v51 + 12) = 2080;
      swift_bridgeObjectRetain(v46);
      uint64_t v74 = sub_10000B540(v45, v46, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v51 + 14, v51 + 22);
      swift_bridgeObjectRelease_n(v46, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Task %s returned error: %s", (uint8_t *)v51, 0x16u);
      uint64_t v56 = v71;
      swift_arrayDestroy(v71, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1LL, -1LL);
      swift_slowDealloc(v51, -1LL, -1LL);
    }

    else
    {
      v29(v15, v11);

      uint64_t v57 = swift_bridgeObjectRelease_n(v46, 2LL);
    }

    uint64_t v58 = MLHostTask.name.getter(v57);
    unint64_t v60 = v59;
    sub_100013FB0(v58, v59, v45, v46);
    swift_bridgeObjectRelease(v46);
    return swift_bridgeObjectRelease(v60);
  }

  return result;
}

uint64_t sub_100021BD0(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for MLHostTask(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v58 = v7;
  unint64_t v59 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v52 - v9;
  if ((a2 & 1) != 0)
  {
    aBos_unfair_lock_t lock = (void **)MLHostTask.name.getter(v8);
    uint64_t v63 = v11;
    v12._uint64_t countAndFlagsBits = 0x6E616D65646E6F2ELL;
    v12._object = (void *)0xE900000000000064LL;
    String.append(_:)(v12);
    uint64_t v14 = (uint64_t)aBlock;
    unint64_t v13 = v63;
  }

  else
  {
    uint64_t v14 = MLHostTask.name.getter(v8);
    unint64_t v13 = v15;
  }

  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v16 = type metadata accessor for Logger(0LL);
  uint64_t v17 = sub_10000C538(v16, (uint64_t)qword_10005A7E0);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v57 = a1;
  unint64_t v55 = v18;
  v18(v10, a1, v4);
  uint64_t v19 = swift_bridgeObjectRetain_n(v13, 2LL);
  uint64_t v56 = v17;
  id v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc(22LL, -1LL);
    uint64_t v23 = (void **)swift_slowAlloc(64LL, -1LL);
    uint64_t v54 = v5;
    uint64_t v24 = v23;
    aBos_unfair_lock_t lock = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    swift_bridgeObjectRetain(v13);
    uint64_t v61 = sub_10000B540(v14, v13, (uint64_t *)&aBlock);
    uint64_t v53 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &aBlock, v22 + 4, v22 + 12);
    uint64_t v25 = swift_bridgeObjectRelease_n(v13, 3LL);
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v26 = MLHostTask.bundleIdentifier.getter(v25);
    unint64_t v28 = v27;
    uint64_t v61 = sub_10000B540(v26, v27, (uint64_t *)&aBlock);
    uint64_t v4 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &aBlock, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v28);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v4);
    _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Registering task %s with bundleIdentifier %s.",  (uint8_t *)v22,  0x16u);
    swift_arrayDestroy(v24, 2LL, (char *)&type metadata for Any + 8);
    uint64_t v29 = v24;
    uint64_t v5 = v54;
    swift_slowDealloc(v29, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v13, 2LL);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  id v30 = [(id)objc_opt_self(BGSystemTaskScheduler) sharedScheduler];
  uint64_t v31 = v14;
  NSString v32 = String._bridgeToObjectiveC()();
  uint64_t v33 = v59;
  uint64_t v34 = v60;
  uint64_t v54 = *(void *)(v60 + 48);
  v55(v59, v57, v4);
  uint64_t v35 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v36 = (v35 + 24) & ~v35;
  uint64_t v37 = v4;
  unint64_t v38 = (v58 + v36 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v39 = swift_allocObject(&unk_100055EC8, v38 + 16, v35 | 7);
  uint64_t v40 = v5;
  uint64_t v41 = v39;
  *(void *)(v39 + 16) = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v39 + v36, v33, v37);
  uint64_t v42 = (uint64_t *)(v41 + v38);
  *uint64_t v42 = v31;
  v42[1] = v13;
  uint64_t v66 = sub_10003E71C;
  uint64_t v67 = v41;
  aBos_unfair_lock_t lock = _NSConcreteStackBlock;
  uint64_t v63 = 1107296256LL;
  uint64_t v64 = sub_1000210C0;
  uint64_t v65 = &unk_100055EE0;
  uint64_t v43 = _Block_copy(&aBlock);
  uint64_t v44 = v67;
  swift_bridgeObjectRetain(v13);
  swift_retain(v34);
  swift_release(v44);
  unsigned int v45 = [v30 registerForTaskWithIdentifier:v32 usingQueue:v54 launchHandler:v43];
  _Block_release(v43);

  uint64_t v46 = swift_bridgeObjectRetain_n(v13, 2LL);
  uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
  os_log_type_t v48 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = swift_slowAlloc(18LL, -1LL);
    uint64_t v50 = (void **)swift_slowAlloc(32LL, -1LL);
    aBos_unfair_lock_t lock = v50;
    *(_DWORD *)uint64_t v49 = 136315394;
    swift_bridgeObjectRetain(v13);
    uint64_t v61 = sub_10000B540(v31, v13, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &aBlock, v49 + 4, v49 + 12);
    swift_bridgeObjectRelease_n(v13, 3LL);
    *(_WORD *)(v49 + 12) = 1024;
    LODWORD(v61) = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, (char *)&v61 + 4, v49 + 14, v49 + 18);
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Task %s registration info: %{BOOL}d", (uint8_t *)v49, 0x12u);
    swift_arrayDestroy(v50, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1LL, -1LL);
    swift_slowDealloc(v49, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v13, 2LL);
  }

  return v31;
}

id sub_100022124(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v60 = a4;
  uint64_t v61 = a5;
  id v66 = a1;
  uint64_t v7 = sub_10000B4F4(&qword_100059800);
  __chkstk_darwin(v7);
  uint64_t v65 = (uint64_t)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskStatus(0LL);
  uint64_t v63 = *(void *)(v9 - 8);
  uint64_t v64 = v9;
  __chkstk_darwin(v9);
  uint64_t v62 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for MLHostTask(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v59 - v16;
  uint64_t v18 = *(void *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  uint64_t v67 = a3;
  uint64_t v19 = MLHostTask.bundleIdentifier.getter(v15);
  uint64_t v21 = v20;
  uint64_t v22 = (os_unfair_lock_s *)(*(void *)(v18 + 16) + 16LL);
  os_unfair_lock_lock(v22);
  uint64_t v23 = *(void *)(v18 + 40);
  swift_bridgeObjectRetain(v23);
  LOBYTE(v19) = sub_10000F5D4(v19, v21, v23);
  swift_bridgeObjectRelease(v23);
  os_unfair_lock_unlock(v22);
  swift_bridgeObjectRelease(v21);
  if ((v19 & 1) != 0)
  {
    uint64_t v24 = swift_allocObject(&unk_100055F18, 17LL, 7LL);
    *(_BYTE *)(v24 + 16) = 0;
    aBlock[4] = (uint64_t)sub_10003E784;
    uint64_t v69 = v24;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_100020B64;
    aBlock[3] = (uint64_t)&unk_100055F30;
    uint64_t v25 = _Block_copy(aBlock);
    uint64_t v26 = v69;
    swift_retain(v24);
    swift_release(v26);
    unint64_t v59 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = a2;
    id v28 = v66;
    [v66 setExpirationHandler:v25];
    _Block_release(v25);
    uint64_t v29 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v65, 1LL, 1LL, v29);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))( (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v67,  v11);
    uint64_t v30 = *(unsigned __int8 *)(v12 + 80);
    uint64_t v31 = (v30 + 40) & ~v30;
    unint64_t v32 = (v13 + v31 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v33 = (v32 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v35 = (char *)swift_allocObject(&unk_100055F68, v34 + 16, v30 | 7);
    *((void *)v35 + 2) = 0LL;
    *((void *)v35 + 3) = 0LL;
    *((void *)v35 + 4) = v27;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v35[v31], v59, v11);
    *(void *)&v35[v32] = v24;
    *(void *)&v35[v33] = v28;
    uint64_t v36 = &v35[v34];
    uint64_t v37 = v61;
    *(void *)uint64_t v36 = v60;
    *((void *)v36 + 1) = v37;
    swift_retain(v24);
    swift_retain(v27);
    id v38 = v28;
    swift_bridgeObjectRetain(v37);
    uint64_t v39 = sub_1000235FC(v65, (uint64_t)&unk_100059810, (uint64_t)v35);
    swift_release(v24);
    return (id)swift_release(v39);
  }

  else
  {
    uint64_t v41 = v11;
    uint64_t v65 = a2;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v42 = type metadata accessor for Logger(0LL);
    sub_10000C538(v42, (uint64_t)qword_10005A7E0);
    uint64_t v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v67, v11);
    uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v47 = swift_slowAlloc(32LL, -1LL);
      aBlock[0] = v47;
      *(_DWORD *)uint64_t v46 = 136315138;
      uint64_t v48 = MLHostTask.bundleIdentifier.getter(v47);
      unint64_t v50 = v49;
      uint64_t v70 = sub_10000B540(v48, v49, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v46 + 4, v46 + 12);
      swift_bridgeObjectRelease(v50);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v41);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Invalid extension name: %s", v46, 0xCu);
      swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v46, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v41);
    }

    id v51 = v66;
    uint64_t v53 = MLHostTask.name.getter(v52);
    uint64_t v55 = v54;
    uint64_t v57 = (uint64_t)v62;
    uint64_t v56 = v63;
    uint64_t v58 = v64;
    (*(void (**)(char *, void, uint64_t))(v63 + 104))(v62, enum case for TaskStatus.taskFailed(_:), v64);
    sub_100013D50(v53, v55, v57);
    swift_bridgeObjectRelease(v55);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v58);
    return [v51 setTaskCompleted];
  }

uint64_t sub_100022638( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[15] = a8;
  v8[16] = v19;
  v8[13] = a6;
  v8[14] = a7;
  v8[11] = a4;
  v8[12] = a5;
  uint64_t v9 = type metadata accessor for TaskRequest(0LL);
  v8[17] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[18] = v10;
  unint64_t v11 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[19] = swift_task_alloc(v11);
  v8[20] = swift_task_alloc(v11);
  uint64_t v12 = type metadata accessor for TaskDefinition(0LL);
  v8[21] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v8[22] = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[23] = swift_task_alloc(v14);
  _BYTE v8[24] = swift_task_alloc(v14);
  uint64_t v15 = type metadata accessor for MLHostTask(0LL);
  v8[25] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v8[26] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v8[27] = swift_task_alloc(v17);
  v8[28] = swift_task_alloc(v17);
  return swift_task_switch(sub_100022750, 0LL, 0LL);
}

uint64_t sub_100022750()
{
  uint64_t v1 = dword_10005982C;
  swift_retain(v0[13]);
  uint64_t v2 = (uint64_t **)swift_task_alloc(v1);
  v0[29] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = (uint64_t *)sub_1000227D8;
  return sub_100030AF0(v0[12], v0[11], v0[13]);
}

uint64_t sub_1000227D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 232LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 104LL);
  *(void *)(*(void *)v1 + 24Hasher.init(_seed:)(v3, 0LL) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  return swift_task_switch(sub_10002286C, 0LL, 0LL);
}

uint64_t sub_10002286C()
{
  uint64_t v1 = *(void **)(v0 + 240);
  if (v1)
  {
    uint64_t v2 = v0 + 72;
    id v3 = v1;
    uint64_t v4 = MLHostResult.status.getter();
    uint64_t v5 = MLHostResultStatus.rawValue.getter(v4);
    uint64_t v6 = MLHostResultStatus.rawValue.getter(1LL);
    if (v5 != v6
      || (uint64_t v7 = MLHostResult.policy.getter(),
          uint64_t v8 = MLHostResultPolicy.rawValue.getter(v7),
          uint64_t v6 = MLHostResultPolicy.rawValue.getter(1LL),
          v8 != v6))
    {
      uint64_t v142 = v0 + 48;
      uint64_t v26 = *(void *)(v0 + 192);
      uint64_t v27 = *(void *)(v0 + 168);
      uint64_t v28 = *(void *)(v0 + 176);
      uint64_t v29 = *(void *)(v0 + 160);
      uint64_t v30 = *(void *)(v0 + 136);
      uint64_t v31 = *(void *)(v0 + 144);
      uint64_t v32 = MLHostTask.taskDefinition.getter(v6);
      TaskDefinition.taskRequest.getter(v32);
      unint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8);
      uint64_t v34 = v33(v26, v27);
      uint64_t v35 = TaskRequest.dependencies.getter(v34);
      uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t))(v31 + 8);
      id v37 = (id)v36(v29, v30);
      id v38 = _swiftEmptyArrayStorage;
      if (v35)
      {
        v147[0] = (uint64_t)_swiftEmptyArrayStorage;
        uint64_t v39 = *(void *)(v35 + 16);
        id v143 = v3;
        uint64_t v140 = v36;
        if (v39)
        {
          swift_bridgeObjectRetain(v35);
          uint64_t v40 = (uint64_t *)(v35 + 40);
          do
          {
            uint64_t v42 = *v40;
            id v43 = objc_allocWithZone(&OBJC_CLASS___BGSystemTaskResult);
            swift_bridgeObjectRetain(v42);
            NSString v44 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v42);
            id v45 = [v43 initWithIdentifier:v44 consumptionCount:1];

            if (v45)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v47 = *(void *)((v147[0] & 0xFFFFFFFFFFFFFF8LL) + 0x10);
              unint64_t v46 = *(void *)((v147[0] & 0xFFFFFFFFFFFFFF8LL) + 0x18);
              if (v47 >= v46 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v46 > 1, v47 + 1, 1LL);
              }
              uint64_t v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v47, v45);
              specialized Array._endMutation()(v41);
            }

            v40 += 2;
            --v39;
          }

          while (v39);
          swift_bridgeObjectRelease(v35);
          uint64_t v64 = (void *)v147[0];
          uint64_t v36 = v140;
        }

        else
        {
          uint64_t v64 = _swiftEmptyArrayStorage;
        }

        uint64_t v65 = *(void **)(v0 + 112);
        swift_bridgeObjectRelease(v35);
        uint64_t v66 = sub_100030150((uint64_t)v64);
        swift_bridgeObjectRelease(v64);
        sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
        sub_10003EA20();
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v66);
        *(void *)(v0 + 48) = 0LL;
        LOBYTE(v65) = [v65 consumedResults:isa error:v142];

        uint64_t v68 = *(void **)(v0 + 48);
        if ((v65 & 1) != 0)
        {
          id v37 = v68;
        }

        else
        {
          id v69 = v68;
          uint64_t v70 = _convertNSErrorToError(_:)(v68);

          swift_willThrow(v71);
          if (qword_100058F68 != -1) {
            swift_once(&qword_100058F68, sub_10001F3C8);
          }
          uint64_t v72 = *(void *)(v0 + 128);
          uint64_t v73 = type metadata accessor for Logger(0LL);
          sub_10000C538(v73, (uint64_t)qword_10005A7E0);
          swift_bridgeObjectRetain(v72);
          swift_errorRetain(v70);
          swift_bridgeObjectRetain(v72);
          uint64_t v74 = swift_errorRetain(v70);
          uint64_t v75 = (os_log_s *)Logger.logObject.getter(v74);
          os_log_type_t v76 = static os_log_type_t.error.getter();
          BOOL v77 = os_log_type_enabled(v75, v76);
          unint64_t v78 = *(void *)(v0 + 128);
          if (v77)
          {
            uint64_t v138 = *(void *)(v0 + 120);
            uint64_t v79 = swift_slowAlloc(22LL, -1LL);
            uint64_t v80 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
            uint64_t v139 = swift_slowAlloc(32LL, -1LL);
            v147[0] = v139;
            *(_DWORD *)uint64_t v79 = 136315394;
            swift_bridgeObjectRetain(v78);
            *(void *)(v0 + 56) = sub_10000B540(v138, v78, v147);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v79 + 4, v79 + 12);
            swift_bridgeObjectRelease_n(v78, 3LL);
            *(_WORD *)(v79 + 12) = 2112;
            swift_errorRetain(v70);
            uint64_t v81 = _swift_stdlib_bridgeErrorToNSError(v70);
            *(void *)(v0 + 64) = v81;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v79 + 14, v79 + 22);
            uint64_t *v80 = v81;
            swift_errorRelease(v70);
            swift_errorRelease(v70);
            _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "Failed at consuming results for task: %s. Error: %@",  (uint8_t *)v79,  0x16u);
            uint64_t v82 = sub_10000B4F4(&qword_100059280);
            swift_arrayDestroy(v80, 1LL, v82);
            swift_slowDealloc(v80, -1LL, -1LL);
            swift_arrayDestroy(v139, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v139, -1LL, -1LL);
            swift_slowDealloc(v79, -1LL, -1LL);

            id v37 = (id)swift_errorRelease(v70);
          }

          else
          {
            swift_errorRelease(v70);
            swift_bridgeObjectRelease_n(v78, 2LL);
            swift_errorRelease(v70);
            swift_errorRelease(v70);
          }

          id v3 = v143;
          uint64_t v36 = v140;
        }
      }

      uint64_t v95 = *(void *)(v0 + 184);
      uint64_t v96 = *(void *)(v0 + 168);
      uint64_t v97 = *(void *)(v0 + 152);
      uint64_t v98 = *(void *)(v0 + 136);
      uint64_t v99 = MLHostTask.taskDefinition.getter(v37);
      TaskDefinition.taskRequest.getter(v99);
      uint64_t v100 = v33(v95, v96);
      uint64_t v101 = TaskRequest.producedResultIdentifiers.getter(v100);
      v36(v97, v98);
      if (v101)
      {
        v147[0] = (uint64_t)_swiftEmptyArrayStorage;
        uint64_t v102 = *(void *)(v101 + 16);
        if (v102)
        {
          swift_bridgeObjectRetain(v101);
          unint64_t v103 = (uint64_t *)(v101 + 40);
          do
          {
            uint64_t v105 = *v103;
            id v106 = objc_allocWithZone(&OBJC_CLASS___BGSystemTaskResult);
            swift_bridgeObjectRetain(v105);
            NSString v107 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v105);
            id v108 = [v106 initWithIdentifier:v107 cumulativeProductionCount:1];

            if (v108)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v110 = *(void *)((v147[0] & 0xFFFFFFFFFFFFFF8LL) + 0x10);
              unint64_t v109 = *(void *)((v147[0] & 0xFFFFFFFFFFFFFF8LL) + 0x18);
              if (v110 >= v109 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v109 > 1,  v110 + 1,  1LL);
              }
              uint64_t v104 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v110, v108);
              specialized Array._endMutation()(v104);
            }

            v103 += 2;
            --v102;
          }

          while (v102);
          swift_bridgeObjectRelease(v101);
          id v38 = (void *)v147[0];
        }

        os_log_type_t v111 = *(void **)(v0 + 112);
        swift_bridgeObjectRelease(v101);
        uint64_t v112 = sub_100030150((uint64_t)v38);
        swift_bridgeObjectRelease(v38);
        sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
        sub_10003EA20();
        Class v113 = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v112);
        *(void *)(v0 + 24) = 0LL;
        LOBYTE(v112) = [v111 producedCumulativeResults:v113 error:v0 + 24];

        uint64_t v114 = *(void **)(v0 + 24);
        if ((v112 & 1) != 0)
        {
          id v115 = v114;
        }

        else
        {
          id v116 = v114;
          uint64_t v117 = _convertNSErrorToError(_:)(v114);

          swift_willThrow(v118);
          if (qword_100058F68 != -1) {
            swift_once(&qword_100058F68, sub_10001F3C8);
          }
          uint64_t v119 = *(void *)(v0 + 128);
          uint64_t v120 = type metadata accessor for Logger(0LL);
          sub_10000C538(v120, (uint64_t)qword_10005A7E0);
          swift_bridgeObjectRetain(v119);
          swift_errorRetain(v117);
          swift_bridgeObjectRetain(v119);
          uint64_t v121 = swift_errorRetain(v117);
          __n128 v122 = (os_log_s *)Logger.logObject.getter(v121);
          os_log_type_t v123 = static os_log_type_t.error.getter();
          BOOL v124 = os_log_type_enabled(v122, v123);
          unint64_t v125 = *(void *)(v0 + 128);
          if (v124)
          {
            id v145 = v3;
            uint64_t v126 = *(void *)(v0 + 120);
            uint64_t v127 = swift_slowAlloc(22LL, -1LL);
            __int128 v128 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
            uint64_t v146 = swift_slowAlloc(32LL, -1LL);
            v147[0] = v146;
            *(_DWORD *)uint64_t v127 = 136315394;
            swift_bridgeObjectRetain(v125);
            uint64_t v129 = v126;
            id v3 = v145;
            *(void *)(v0 + 32) = sub_10000B540(v129, v125, v147);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v127 + 4, v127 + 12);
            swift_bridgeObjectRelease_n(v125, 3LL);
            *(_WORD *)(v127 + 12) = 2112;
            swift_errorRetain(v117);
            uint64_t v130 = _swift_stdlib_bridgeErrorToNSError(v117);
            *(void *)(v0 + 40) = v130;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v142, v127 + 14, v127 + 22);
            *__int128 v128 = v130;
            swift_errorRelease(v117);
            swift_errorRelease(v117);
            _os_log_impl( (void *)&_mh_execute_header,  v122,  v123,  "Failed at generating results for task: %s. Error: %@",  (uint8_t *)v127,  0x16u);
            uint64_t v131 = sub_10000B4F4(&qword_100059280);
            swift_arrayDestroy(v128, 1LL, v131);
            swift_slowDealloc(v128, -1LL, -1LL);
            swift_arrayDestroy(v146, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v146, -1LL, -1LL);
            swift_slowDealloc(v127, -1LL, -1LL);

            swift_errorRelease(v117);
          }

          else
          {
            swift_errorRelease(v117);
            swift_bridgeObjectRelease_n(v125, 2LL);
            swift_errorRelease(v117);
            swift_errorRelease(v117);
          }
        }
      }

      [*(id *)(v0 + 112) setTaskCompleted];
      goto LABEL_55;
    }

    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v9 = *(void *)(v0 + 208);
    uint64_t v10 = *(void *)(v0 + 216);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 96);
    uint64_t v13 = type metadata accessor for Logger(0LL);
    sub_10000C538(v13, (uint64_t)qword_10005A7E0);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v10, v12, v11);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.info.getter(v15);
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v19 = *(void *)(v0 + 216);
    if (v17)
    {
      uint64_t v141 = *(void *)(v0 + 200);
      uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v21 = swift_slowAlloc(32LL, -1LL);
      v147[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v22 = MLHostTask.name.getter(v21);
      unint64_t v24 = v23;
      *(void *)(v0 + 80) = sub_10000B540(v22, v23, v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v24);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v141);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Task %s has reschedule policy, passing retry to DAS.",  v20,  0xCu);
      swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v25 = v21;
      uint64_t v2 = v0 + 72;
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(v18 + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
    }

    uint64_t v83 = *(void **)(v0 + 112);
    *(void *)(v0 + 72) = 0LL;
    unsigned int v84 = [v83 setTaskExpiredWithRetryAfter:v2 error:300.0];
    unint64_t v85 = *(void **)(v0 + 72);
    if (v84)
    {
      id v86 = v85;
LABEL_55:

      goto LABEL_56;
    }

    id v87 = v85;
    uint64_t v88 = _convertNSErrorToError(_:)(v85);

    uint64_t v90 = swift_willThrow(v89);
    uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
    os_log_type_t v92 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v91, v92))
    {
      unint64_t v93 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v93 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v91,  v92,  "Task setTaskExpiredWithRetryAfter failed. Fallback to default strategy.",  v93,  2u);
      swift_slowDealloc(v93, -1LL, -1LL);
    }

    unint64_t v94 = *(void **)(v0 + 112);

    [v94 setTaskCompleted];
    swift_errorRelease(v88);
  }

  else
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v48 = *(void *)(v0 + 224);
    uint64_t v49 = *(void *)(v0 + 200);
    uint64_t v50 = *(void *)(v0 + 208);
    uint64_t v51 = *(void *)(v0 + 96);
    uint64_t v52 = type metadata accessor for Logger(0LL);
    sub_10000C538(v52, (uint64_t)qword_10005A7E0);
    uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v48, v51, v49);
    uint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
    os_log_type_t v55 = static os_log_type_t.debug.getter();
    BOOL v56 = os_log_type_enabled(v54, v55);
    uint64_t v57 = *(void *)(v0 + 224);
    uint64_t v58 = *(void *)(v0 + 208);
    if (v56)
    {
      uint64_t v144 = *(void *)(v0 + 200);
      unint64_t v59 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v60 = swift_slowAlloc(32LL, -1LL);
      v147[0] = v60;
      *(_DWORD *)unint64_t v59 = 136315138;
      uint64_t v61 = MLHostTask.name.getter(v60);
      unint64_t v63 = v62;
      *(void *)(v0 + 16) = sub_10000B540(v61, v62, v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v59 + 4, v59 + 12);
      swift_bridgeObjectRelease(v63);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v144);
      _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "Task %s returned nil, marking DAS task as completed.",  v59,  0xCu);
      swift_arrayDestroy(v60, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v60, -1LL, -1LL);
      swift_slowDealloc(v59, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(v58 + 8))(*(void *)(v0 + 224), *(void *)(v0 + 200));
    }

    [*(id *)(v0 + 112) setTaskCompleted];
  }

LABEL_56:
  uint64_t v132 = *(void *)(v0 + 216);
  uint64_t v134 = *(void *)(v0 + 184);
  uint64_t v133 = *(void *)(v0 + 192);
  uint64_t v136 = *(void *)(v0 + 152);
  uint64_t v135 = *(void *)(v0 + 160);
  swift_task_dealloc(*(void *)(v0 + 224));
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000235FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000C7CC(a1, &qword_100059800);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      uint64_t v11 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10, v13);
      uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      uint64_t v16 = v15;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v17 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v17 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = 0LL;
  uint64_t v16 = 0LL;
LABEL_6:
  uint64_t v18 = swift_allocObject(&unk_100055F90, 32LL, 7LL);
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    uint64_t v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  return swift_task_create(v9, v19, (char *)&type metadata for () + 8, &unk_100059820, v18);
}

void sub_100023748(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_100023798()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for MLHostTask(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v68 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v73 = (char *)&v61 - v9;
  uint64_t v62 = os_transaction_create("registerActivities");
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v11 = (os_unfair_lock_s *)(*(void *)(v10 + 56) + 16LL);
  os_unfair_lock_lock(v11);
  uint64_t v74 = v10 + 64;
  swift_beginAccess(v10 + 64, v78, 0LL, 0LL);
  uint64_t v12 = *(void *)(v10 + 64);
  swift_bridgeObjectRetain(v12);
  uint64_t v14 = sub_10002EA7C(v13);
  swift_bridgeObjectRelease(v12);
  os_unfair_lock_unlock(v11);
  unint64_t v63 = v14;
  uint64_t v16 = v14[2];
  if (v16)
  {
    uint64_t v69 = OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry;
    unsigned __int8 v17 = v63 + 5;
    *(void *)&__int128 v15 = 136315138LL;
    __int128 v67 = v15;
    uint64_t v66 = (char *)&type metadata for Any + 8;
    *(void *)&__int128 v15 = 136315394LL;
    __int128 v65 = v15;
    uint64_t v71 = v4;
    uint64_t v72 = v1;
    uint64_t v70 = v10;
    uint64_t v64 = v6;
    do
    {
      uint64_t v76 = v16;
      uint64_t v19 = *(v17 - 1);
      unint64_t v20 = *v17;
      uint64_t v21 = (os_unfair_lock_s *)(*(void *)(v10 + 56) + 16LL);
      swift_bridgeObjectRetain(*v17);
      os_unfair_lock_lock(v21);
      swift_beginAccess(v74, v77, 32LL, 0LL);
      uint64_t v22 = *(void *)(v10 + 64);
      if (*(void *)(v22 + 16))
      {
        swift_bridgeObjectRetain(v20);
        unint64_t v23 = sub_10002BC00(v19, v20);
        if ((v24 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))( v4,  *(void *)(v22 + 56) + *(void *)(v6 + 72) * v23,  v5);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0LL, 1LL, v5);
        }

        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1LL, 1LL, v5);
        }

        swift_bridgeObjectRelease(v20);
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1LL, 1LL, v5);
      }

      swift_endAccess(v77);
      os_unfair_lock_unlock(v21);
      int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5);
      uint64_t v75 = v19;
      if (v25 == 1)
      {
        sub_10000C7CC((uint64_t)v4, &qword_1000595E8);
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v26 = type metadata accessor for Logger(0LL);
        sub_10000C538(v26, (uint64_t)qword_10005A7E0);
        swift_bridgeObjectRetain(v20);
        uint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
        os_log_type_t v29 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = swift_slowAlloc(12LL, -1LL);
          uint64_t v31 = swift_slowAlloc(32LL, -1LL);
          v77[0] = v31;
          *(_DWORD *)uint64_t v30 = v67;
          swift_bridgeObjectRetain(v20);
          *(void *)(v30 + 4) = sub_10000B540(v75, v20, v77);
          swift_bridgeObjectRelease_n(v20, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "Skipping %s because is not available in TaskRegistry",  (uint8_t *)v30,  0xCu);
          swift_arrayDestroy(v31, 1LL, v66);
          swift_slowDealloc(v31, -1LL, -1LL);
          uint64_t v32 = v30;
          uint64_t v1 = v72;
          swift_slowDealloc(v32, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v20, 2LL);
        }
      }

      else
      {
        uint64_t v33 = (uint64_t)v73;
        uint64_t v34 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v73, v4, v5);
        uint64_t v35 = *(void *)(v1 + v69);
        uint64_t v36 = MLHostTask.bundleIdentifier.getter(v34);
        uint64_t v38 = v37;
        uint64_t v39 = v1;
        uint64_t v40 = (os_unfair_lock_s *)(*(void *)(v35 + 16) + 16LL);
        os_unfair_lock_lock(v40);
        uint64_t v41 = *(void *)(v35 + 40);
        swift_bridgeObjectRetain(v41);
        LOBYTE(v36) = sub_10000F5D4(v36, v38, v41);
        swift_bridgeObjectRelease(v41);
        os_unfair_lock_unlock(v40);
        swift_bridgeObjectRelease(v38);
        if ((v36 & 1) != 0)
        {
          swift_bridgeObjectRelease(v20);
          sub_100021BD0(v33, 0);
          swift_bridgeObjectRelease(v18);
          (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v33, v5);
          uint64_t v1 = v39;
          uint64_t v4 = v71;
        }

        else
        {
          if (qword_100058F68 != -1) {
            swift_once(&qword_100058F68, sub_10001F3C8);
          }
          uint64_t v42 = type metadata accessor for Logger(0LL);
          sub_10000C538(v42, (uint64_t)qword_10005A7E0);
          uint64_t v43 = v6;
          NSString v44 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
          id v45 = v68;
          unint64_t v46 = v73;
          v44(v68, v73, v5);
          swift_bridgeObjectRetain(v20);
          uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
          os_log_type_t v49 = static os_log_type_t.error.getter();
          BOOL v50 = os_log_type_enabled(v48, v49);
          uint64_t v4 = v71;
          if (v50)
          {
            uint64_t v51 = swift_slowAlloc(22LL, -1LL);
            uint64_t v52 = swift_slowAlloc(64LL, -1LL);
            v77[0] = v52;
            *(_DWORD *)uint64_t v51 = v65;
            swift_bridgeObjectRetain(v20);
            *(void *)(v51 + 4) = sub_10000B540(v75, v20, v77);
            uint64_t v53 = swift_bridgeObjectRelease_n(v20, 3LL);
            *(_WORD *)(v51 + 12) = 2080;
            uint64_t v54 = MLHostTask.bundleIdentifier.getter(v53);
            unint64_t v56 = v55;
            *(void *)(v51 + 14) = sub_10000B540(v54, v55, v77);
            swift_bridgeObjectRelease(v56);
            uint64_t v57 = v64;
            uint64_t v58 = *(void (**)(char *, uint64_t))(v64 + 8);
            v58(v45, v5);
            _os_log_impl( (void *)&_mh_execute_header,  v48,  v49,  "Skipping %s because invalid extension: %s",  (uint8_t *)v51,  0x16u);
            swift_arrayDestroy(v52, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v52, -1LL, -1LL);
            swift_slowDealloc(v51, -1LL, -1LL);

            v58(v73, v5);
            uint64_t v1 = v72;
            uint64_t v6 = v57;
          }

          else
          {

            unint64_t v59 = *(void (**)(char *, uint64_t))(v43 + 8);
            v59(v45, v5);
            swift_bridgeObjectRelease_n(v20, 2LL);
            v59(v46, v5);
            uint64_t v6 = v43;
            uint64_t v1 = v72;
          }
        }

        uint64_t v10 = v70;
      }

      v17 += 2;
      uint64_t v16 = v76 - 1;
    }

    while (v76 != 1);
  }

  swift_unknownObjectRelease(v62);
  return swift_release(v63);
}

uint64_t sub_100023E24()
{
  uint64_t v1 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for MLHostTask(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = os_transaction_create("scheduleActivities");
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(v8 + 56) + 16LL);
  os_unfair_lock_lock(v9);
  uint64_t v39 = v8 + 64;
  swift_beginAccess(v8 + 64, v42, 0LL, 0LL);
  uint64_t v40 = v8;
  uint64_t v10 = *(void *)(v8 + 64);
  swift_bridgeObjectRetain(v10);
  uint64_t v12 = sub_10002EA7C(v11);
  swift_bridgeObjectRelease(v10);
  os_unfair_lock_unlock(v9);
  uint64_t v34 = v12;
  uint64_t v14 = v12[2];
  if (v14)
  {
    __int128 v15 = v34 + 5;
    *(void *)&__int128 v13 = 136315138LL;
    __int128 v36 = v13;
    uint64_t v35 = (char *)&type metadata for Any + 8;
    uint64_t v37 = v7;
    uint64_t v38 = v3;
    do
    {
      uint64_t v17 = *(v15 - 1);
      unint64_t v16 = *v15;
      uint64_t v18 = v40;
      uint64_t v19 = (os_unfair_lock_s *)(*(void *)(v40 + 56) + 16LL);
      swift_bridgeObjectRetain(*v15);
      os_unfair_lock_lock(v19);
      swift_beginAccess(v39, v41, 32LL, 0LL);
      uint64_t v20 = *(void *)(v18 + 64);
      if (*(void *)(v20 + 16))
      {
        swift_bridgeObjectRetain(v16);
        unint64_t v21 = sub_10002BC00(v17, v16);
        if ((v22 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))( v3,  *(void *)(v20 + 56) + *(void *)(v5 + 72) * v21,  v4);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0LL, 1LL, v4);
        }

        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1LL, 1LL, v4);
        }

        swift_bridgeObjectRelease(v16);
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1LL, 1LL, v4);
      }

      swift_endAccess(v41);
      os_unfair_lock_unlock(v19);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1LL, v4) == 1)
      {
        sub_10000C7CC((uint64_t)v3, &qword_1000595E8);
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v23 = type metadata accessor for Logger(0LL);
        sub_10000C538(v23, (uint64_t)qword_10005A7E0);
        swift_bridgeObjectRetain(v16);
        int v25 = (os_log_s *)Logger.logObject.getter(v24);
        os_log_type_t v26 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v25, v26))
        {
          uint64_t v27 = swift_slowAlloc(12LL, -1LL);
          uint64_t v28 = swift_slowAlloc(32LL, -1LL);
          v41[0] = v28;
          *(_DWORD *)uint64_t v27 = v36;
          swift_bridgeObjectRetain(v16);
          *(void *)(v27 + 4) = sub_10000B540(v17, v16, v41);
          swift_bridgeObjectRelease_n(v16, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Skipping %s because is not available in TaskRegistry",  (uint8_t *)v27,  0xCu);
          swift_arrayDestroy(v28, 1LL, v35);
          uint64_t v29 = v28;
          uint64_t v7 = v37;
          swift_slowDealloc(v29, -1LL, -1LL);
          uint64_t v30 = v27;
          uint64_t v3 = v38;
          swift_slowDealloc(v30, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v16, 2LL);
        }
      }

      else
      {
        swift_bridgeObjectRelease(v16);
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
        sub_10002EFEC(v7);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }

      v15 += 2;
      --v14;
    }

    while (v14);
  }

  swift_unknownObjectRelease(v33);
  return swift_release(v34);
}

uint64_t sub_1000241F8()
{
  uint64_t v1 = os_transaction_create("deregisterActivities");
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(v2 + 56) + 16LL);
  os_unfair_lock_lock(v3);
  swift_beginAccess(v2 + 64, v12, 0LL, 0LL);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_bridgeObjectRetain(v4);
  uint64_t v6 = sub_10002EA7C(v5);
  swift_bridgeObjectRelease(v4);
  os_unfair_lock_unlock(v3);
  uint64_t v7 = v6[2];
  if (v7)
  {
    uint64_t v8 = v6 + 5;
    do
    {
      uint64_t v9 = *(v8 - 1);
      unint64_t v10 = *v8;
      swift_bridgeObjectRetain(*v8);
      sub_10003E138(v9, v10);
      swift_bridgeObjectRelease(v10);
      v8 += 2;
      --v7;
    }

    while (v7);
  }

  swift_unknownObjectRelease(v1);
  return swift_release(v6);
}

void sub_1000242D4(void (*a1)(char *, uint64_t)@<X0>, char *a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MLHostTask(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  __int128 v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = validateTaskDefinition(_:)(a1);
  if (!v3)
  {
    uint64_t v68 = v13;
    uint64_t v70 = a2;
    uint64_t v71 = v11;
    uint64_t v15 = *(void *)&v4[OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry];
    uint64_t v16 = TaskDefinition.bundleIdentifier.getter(v14);
    uint64_t v17 = v4;
    uint64_t v19 = v18;
    uint64_t v20 = (os_unfair_lock_s *)(*(void *)(v15 + 16) + 16LL);
    os_unfair_lock_lock(v20);
    uint64_t v21 = *(void *)(v15 + 40);
    swift_bridgeObjectRetain(v21);
    LOBYTE(v16) = sub_10000F5D4(v16, v19, v21);
    swift_bridgeObjectRelease(v21);
    os_unfair_lock_unlock(v20);
    swift_bridgeObjectRelease(v19);
    if ((v16 & 1) == 0)
    {
      uint64_t v34 = type metadata accessor for TaskValidationError(0LL);
      uint64_t v35 = sub_100005038( &qword_100059610,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskValidationError,  (uint64_t)&protocol conformance descriptor for TaskValidationError);
      swift_allocError(v34, v35, 0LL, 0LL);
      uint64_t v37 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v34 - 8) + 104LL))( v36,  enum case for TaskValidationError.invalidBundleIdentifier(_:),  v34);
      swift_willThrow(v37);
      return;
    }

    uint64_t v67 = v10;
    uint64_t v23 = TaskDefinition.name.getter(v22);
    uint64_t v66 = v17;
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))&v17[OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry];
    uint64_t v25 = __chkstk_darwin(v23);
    *(&v63 - 4) = v24;
    *(&v63 - 3) = (void (*)(char *, char *, uint64_t))v25;
    uint64_t v65 = v25;
    uint64_t v27 = v26 + 4;
    unint64_t v69 = v28;
    *(&v63 - 2) = (void (*)(char *, char *, uint64_t))v28;
    os_unfair_lock_lock(v26 + 4);
    sub_10003E66C(&v74);
    int v29 = v74;
    os_unfair_lock_unlock(v27);
    sub_100014F44(a1, (uint64_t)v9);
    uint64_t v30 = v71;
    uint64_t v31 = v67;
    int v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48))(v9, 1LL, v67);
    uint64_t v33 = v68;
    if (v32 == 1)
    {
      swift_bridgeObjectRelease(v69);
      sub_10000C7CC((uint64_t)v9, &qword_1000595E8);
    }

    else
    {
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
      v38(v68, v9, v31);
      unint64_t v39 = v69;
      if (v29)
      {
        unint64_t v63 = v38;
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v64 = (void (*)(void, void, void))v24;
        uint64_t v40 = type metadata accessor for Logger(0LL);
        sub_10000C538(v40, (uint64_t)qword_10005A7E0);
        uint64_t v41 = swift_bridgeObjectRetain_n(v39, 2LL);
        uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
        os_log_type_t v43 = static os_log_type_t.info.getter(v42);
        if (os_log_type_enabled(v42, v43))
        {
          NSString v44 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v45 = swift_slowAlloc(32LL, -1LL);
          uint64_t v74 = v45;
          *(_DWORD *)NSString v44 = 136315138;
          swift_bridgeObjectRetain(v69);
          uint64_t v72 = sub_10000B540(v65, v69, &v74);
          uint64_t v30 = v71;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v44 + 4, v44 + 12);
          swift_bridgeObjectRelease_n(v69, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "Task %s is replacing an existing task, unregistering its existing activity.",  v44,  0xCu);
          swift_arrayDestroy(v45, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v45, -1LL, -1LL);
          unint64_t v46 = v44;
          unint64_t v39 = v69;
          swift_slowDealloc(v46, -1LL, -1LL);
        }

        else
        {

          uint64_t v47 = swift_bridgeObjectRelease_n(v39, 2LL);
        }

        uint64_t v38 = v63;
        uint64_t v48 = MLHostTask.name.getter(v47);
        unint64_t v50 = v49;
        sub_10003E138(v48, v49);
        swift_bridgeObjectRelease(v50);
        uint64_t v24 = (void (*)(char *, char *, uint64_t))v64;
      }

      sub_100021BD0((uint64_t)v33, 0);
      swift_bridgeObjectRelease(v51);
      if ((sub_10002EFEC(v33) & 1) != 0)
      {
        swift_bridgeObjectRelease(v39);
        uint64_t v52 = v70;
        v38(v70, v33, v31);
        uint64_t v53 = 0LL;
LABEL_22:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v52, v53, 1LL, v31);
        return;
      }

      if (qword_100058F68 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v54 = type metadata accessor for Logger(0LL);
      sub_10000C538(v54, (uint64_t)qword_10005A7E0);
      uint64_t v55 = swift_bridgeObjectRetain_n(v39, 2LL);
      unint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
      os_log_type_t v57 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v59 = swift_slowAlloc(32LL, -1LL);
        uint64_t v64 = (void (*)(void, void, void))v24;
        uint64_t v60 = v59;
        uint64_t v74 = v59;
        *(_DWORD *)uint64_t v58 = 136315138;
        uint64_t v66 = v58 + 4;
        swift_bridgeObjectRetain(v69);
        uint64_t v61 = v65;
        uint64_t v72 = sub_10000B540(v65, v69, &v74);
        uint64_t v30 = v71;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v66, v58 + 12);
        swift_bridgeObjectRelease_n(v69, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Task %s failed registration with DAS.", v58, 0xCu);
        swift_arrayDestroy(v60, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v60, -1LL, -1LL);
        uint64_t v62 = v58;
        unint64_t v39 = v69;
        swift_slowDealloc(v62, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v39, 2LL);
        uint64_t v61 = v65;
      }

      sub_1000108A0(v61, v39);
      swift_bridgeObjectRelease(v39);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v31);
    }

    uint64_t v53 = 1LL;
    uint64_t v52 = v70;
    goto LABEL_22;
  }

id sub_100024918(void *a1)
{
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000C538(v2, (uint64_t)qword_10005A7E0);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v10 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v9 = sub_10000B540(0xD000000000000019LL, 0x800000010004A390LL, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Daemon performing %s activity.", v6, 0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  return [a1 setTaskCompleted];
}

uint64_t sub_100024A9C(uint64_t a1, uint64_t a2)
{
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_10000C538(v4, (uint64_t)qword_10005A7E0);
  uint64_t v5 = swift_retain(a1);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v8 = 67109120;
    LODWORD(v64) = dispatch thunk of XPCIncomingConnection.pid.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 4, v8 + 4, v8 + 8);
    swift_release(a1);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Incoming connection from: %d", v8, 8u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_release(a1);
  }

  uint64_t v9 = sub_10002547C();
  char v11 = v10;
  uint64_t v12 = swift_retain(a1);
  __int128 v13 = (os_log_s *)Logger.logObject.getter(v12);
  if ((v11 & 1) == 0)
  {
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc(18LL, -1LL);
      uint64_t v16 = swift_slowAlloc(32LL, -1LL);
      uint64_t v64 = v16;
      *(_DWORD *)uint64_t v15 = 67109378;
      LODWORD(v63) = dispatch thunk of XPCIncomingConnection.pid.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, (char *)&v63 + 4, v15 + 4, v15 + 8);
      swift_release(a1);
      *(_WORD *)(v15 + 8) = 2080;
      uint64_t v63 = v9;
      unint64_t v17 = sub_10003EEDC();
      uint64_t v18 = String.init<A>(_:radix:uppercase:)(&v63, 2LL, 0LL, &type metadata for Int, v17);
      unint64_t v20 = v19;
      uint64_t v63 = sub_10000B540(v18, v19, &v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v15 + 10, v15 + 18);
      swift_bridgeObjectRelease(v20);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Accepting connection from: %d with entitlements: %s",  (uint8_t *)v15,  0x12u);
      swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    else
    {

      swift_release(a1);
    }

    type metadata accessor for XPCConnection(0LL);
    uint64_t v23 = swift_retain(a1);
    uint64_t v24 = XPCConnection.__allocating_init(incomingConnection:)(v23);
    if ((v9 & 4) != 0)
    {
      uint64_t v25 = type metadata accessor for ListTasksRequest(0LL);
      uint64_t v26 = sub_100005038( &qword_1000598B0,  (uint64_t (*)(uint64_t))&type metadata accessor for ListTasksRequest,  (uint64_t)&protocol conformance descriptor for ListTasksRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(v25, sub_10003EE50, a2, v25, v26);
      swift_release(a2);
      uint64_t TaskRequest = type metadata accessor for GetTaskRequest(0LL);
      uint64_t v28 = sub_100005038( &qword_1000598B8,  (uint64_t (*)(uint64_t))&type metadata accessor for GetTaskRequest,  (uint64_t)&protocol conformance descriptor for GetTaskRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(TaskRequest, sub_10003EE68, a2, TaskRequest, v28);
      swift_release(a2);
      uint64_t v29 = type metadata accessor for ListExtensionsRequest(0LL);
      uint64_t v30 = sub_100005038( &qword_1000598C0,  (uint64_t (*)(uint64_t))&type metadata accessor for ListExtensionsRequest,  (uint64_t)&protocol conformance descriptor for ListExtensionsRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(v29, sub_10003EE80, a2, v29, v30);
      swift_release(a2);
      uint64_t ExtensionRequest = type metadata accessor for GetExtensionRequest(0LL);
      uint64_t v32 = sub_100005038( &qword_1000598C8,  (uint64_t (*)(uint64_t))&type metadata accessor for GetExtensionRequest,  (uint64_t)&protocol conformance descriptor for GetExtensionRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(ExtensionRequest, sub_10003EEC4, a2, ExtensionRequest, v32);
      swift_release(a2);
      if ((v9 & 8) == 0)
      {
LABEL_14:
        if ((v9 & 0x10) == 0) {
          goto LABEL_15;
        }
        goto LABEL_25;
      }
    }

    else if ((v9 & 8) == 0)
    {
      goto LABEL_14;
    }

    uint64_t v33 = type metadata accessor for AddTaskRequest(0LL);
    uint64_t v34 = sub_100005038( &qword_1000598A8,  (uint64_t (*)(uint64_t))&type metadata accessor for AddTaskRequest,  (uint64_t)&protocol conformance descriptor for AddTaskRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v33, sub_10003EE38, a2, v33, v34);
    swift_release(a2);
    if ((v9 & 0x10) == 0)
    {
LABEL_15:
      if ((v9 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_26;
    }

LABEL_27:
    uint64_t v41 = type metadata accessor for SetHostConfigurationRequest(0LL);
    uint64_t v42 = sub_100005038( &qword_100059888,  (uint64_t (*)(uint64_t))&type metadata accessor for SetHostConfigurationRequest,  (uint64_t)&protocol conformance descriptor for SetHostConfigurationRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v41, sub_10003EDD8, a2, v41, v42);
    swift_release(a2);
    if ((v9 & 1) == 0)
    {
LABEL_18:
      if ((v9 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_29;
    }

    uint64_t v12 = (v21 - 1) & v21;
    uint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  __n128 v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  os_log_type_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    uint64_t v9 = v22;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    os_log_type_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }

    uint64_t v12 = (v19 - 1) & v19;
    uint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = v17;
  }

  unint64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    uint64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

LABEL_29:
    uint64_t v45 = type metadata accessor for ResetNotificationsRequest(0LL);
    uint64_t v46 = sub_100005038( &qword_100059878,  (uint64_t (*)(uint64_t))&type metadata accessor for ResetNotificationsRequest,  (uint64_t)&protocol conformance descriptor for ResetNotificationsRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v45, sub_10003EDA8, a2, v45, v46);
    swift_release(a2);
    if ((v9 & 0x20) == 0) {
      return v24;
    }
    goto LABEL_30;
  }

  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, v21))
  {
    __n128 v22 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)__n128 v22 = 67109120;
    LODWORD(v64) = dispatch thunk of XPCIncomingConnection.pid.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 4, v22 + 4, v22 + 8);
    swift_release(a1);
    _os_log_impl((void *)&_mh_execute_header, v13, v21, "Invalid entitlements. Dropping connection from: %d", v22, 8u);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  else
  {

    swift_release(a1);
  }

  return 0LL;
}

uint64_t sub_10002547C()
{
  if (qword_100058F88 == -1) {
    goto LABEL_2;
  }
LABEL_33:
  swift_once(&qword_100058F88, sub_10001F478);
LABEL_2:
  uint64_t v0 = off_1000596B0;
  uint64_t v1 = (char *)off_1000596B0 + 64;
  uint64_t v2 = 1LL << *((_BYTE *)off_1000596B0 + 32);
  uint64_t v3 = -1LL;
  if (v2 < 64) {
    uint64_t v3 = ~(-1LL << v2);
  }
  unint64_t v4 = v3 & *((void *)off_1000596B0 + 8);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain(off_1000596B0);
  int64_t v6 = 0LL;
  uint64_t v21 = 0LL;
  if (v4)
  {
LABEL_5:
    unint64_t v7 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v8 = v7 | (v6 << 6);
    goto LABEL_6;
  }

  while (1)
  {
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1LL))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }

    if (v15 >= v5) {
      goto LABEL_30;
    }
    unint64_t v16 = *(void *)&v1[8 * v15];
    ++v6;
    if (!v16)
    {
      int64_t v6 = v15 + 1;
      if (v15 + 1 >= v5) {
        goto LABEL_30;
      }
      unint64_t v16 = *(void *)&v1[8 * v6];
      if (!v16)
      {
        int64_t v6 = v15 + 2;
        if (v15 + 2 >= v5) {
          goto LABEL_30;
        }
        unint64_t v16 = *(void *)&v1[8 * v6];
        if (!v16) {
          break;
        }
      }
    }

uint64_t sub_10002565C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v3);
  int64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MLHostTask(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v37 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v36 = (char *)&v31 - v10;
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v12 = (os_unfair_lock_s *)(*(void *)(v11 + 56) + 16LL);
  os_unfair_lock_lock(v12);
  uint64_t v34 = v11 + 64;
  swift_beginAccess(v11 + 64, v39, 0LL, 0LL);
  uint64_t v35 = v11;
  uint64_t v13 = *(void *)(v11 + 64);
  swift_bridgeObjectRetain(v13);
  int64_t v15 = sub_10002EA7C(v14);
  swift_bridgeObjectRelease(v13);
  os_unfair_lock_unlock(v12);
  uint64_t v16 = v15[2];
  uint64_t v32 = v15;
  if (v16)
  {
    int64_t v17 = v15 + 5;
    uint64_t v40 = (char *)_swiftEmptyArrayStorage;
    do
    {
      uint64_t v18 = *(v17 - 1);
      uint64_t v19 = *v17;
      uint64_t v20 = v35;
      uint64_t v21 = (os_unfair_lock_s *)(*(void *)(v35 + 56) + 16LL);
      swift_bridgeObjectRetain(*v17);
      os_unfair_lock_lock(v21);
      swift_beginAccess(v34, v38, 32LL, 0LL);
      uint64_t v22 = *(void *)(v20 + 64);
      if (*(void *)(v22 + 16))
      {
        swift_bridgeObjectRetain(v19);
        unint64_t v23 = sub_10002BC00(v18, v19);
        if ((v24 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))( v5,  *(void *)(v22 + 56) + *(void *)(v7 + 72) * v23,  v6);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0LL, 1LL, v6);
        }

        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
        }

        swift_bridgeObjectRelease(v19);
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
      }

      swift_endAccess(v38);
      os_unfair_lock_unlock(v21);
      swift_bridgeObjectRelease(v19);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
      {
        sub_10000C7CC((uint64_t)v5, &qword_1000595E8);
      }

      else
      {
        uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        uint64_t v26 = v36;
        v25(v36, v5, v6);
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v37, v26, v6);
        if ((swift_isUniquelyReferenced_nonNull_native(v40) & 1) == 0) {
          uint64_t v40 = (char *)sub_10001A428(0, *((void *)v40 + 2) + 1LL, 1, (unint64_t)v40);
        }
        unint64_t v28 = *((void *)v40 + 2);
        unint64_t v27 = *((void *)v40 + 3);
        if (v28 >= v27 >> 1) {
          uint64_t v40 = (char *)sub_10001A428(v27 > 1, v28 + 1, 1, (unint64_t)v40);
        }
        uint64_t v29 = v40;
        *((void *)v40 + 2) = v28 + 1;
        v25( &v29[((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
             + *(void *)(v7 + 72) * v28],
          v37,
          v6);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v36, v6);
      }

      v17 += 2;
      --v16;
    }

    while (v16);
  }

  else
  {
    uint64_t v40 = (char *)_swiftEmptyArrayStorage;
  }

  swift_release(v32);
  return ListTasksResponse.init(tasks:)(v40);
}

uint64_t sub_1000259B4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v3);
  int64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MLHostTask(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v28 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t Task = GetTaskRequest.name.getter(v10);
  uint64_t v16 = v15;
  int64_t v17 = (os_unfair_lock_s *)(*(void *)(v13 + 56) + 16LL);
  os_unfair_lock_lock(v17);
  swift_beginAccess(v13 + 64, v30, 32LL, 0LL);
  uint64_t v18 = *(void *)(v13 + 64);
  if (*(void *)(v18 + 16))
  {
    swift_bridgeObjectRetain(v16);
    unint64_t v19 = sub_10002BC00(Task, v16);
    if ((v20 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))( v5,  *(void *)(v18 + 56) + *(void *)(v7 + 72) * v19,  v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0LL, 1LL, v6);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
    }

    swift_bridgeObjectRelease(v16);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
  }

  swift_endAccess(v30);
  os_unfair_lock_unlock(v17);
  swift_bridgeObjectRelease(v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
  {
    sub_10000C7CC((uint64_t)v5, &qword_1000595E8);
    uint64_t v21 = type metadata accessor for XPCRemoteError(0LL);
    uint64_t v22 = sub_100005038( &qword_1000598D8,  (uint64_t (*)(uint64_t))&type metadata accessor for XPCRemoteError,  (uint64_t)&protocol conformance descriptor for XPCRemoteError);
    swift_allocError(v21, v22, 0LL, 0LL);
    strcpy(v23, "taskNotFound");
    v23[13] = 0;
    *((_WORD *)v23 + 7) = -5120;
    uint64_t v24 = (*(uint64_t (**)(char *, void, uint64_t))(*(void *)(v21 - 8) + 104LL))( v23,  enum case for XPCRemoteError.genericError(_:),  v21);
    return swift_willThrow(v24);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    uint64_t v26 = v28;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v28, v12, v6);
    GetTaskResponse.init(task:)(v26);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }

uint64_t sub_100025C80@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = sub_10000B4F4(&qword_1000594E0);
  __chkstk_darwin(v3);
  uint64_t v50 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ExtensionRecord(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v48 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v45 - v13;
  uint64_t v14 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  uint64_t Extension = GetExtensionRequest.bundleIdentifier.getter(v12);
  uint64_t v17 = v16;
  uint64_t v18 = (os_unfair_lock_s *)(*(void *)(v14 + 16) + 16LL);
  os_unfair_lock_lock(v18);
  uint64_t v19 = *(void *)(v14 + 40);
  swift_bridgeObjectRetain(v19);
  char v20 = sub_10000F5D4(Extension, v17, v19);
  swift_bridgeObjectRelease(v19);
  os_unfair_lock_unlock(v18);
  if ((v20 & 1) != 0)
  {
    uint64_t v52 = v17;
    uint64_t v21 = sub_10000CD08();
    uint64_t v22 = (uint64_t)v21;
    uint64_t v23 = *((void *)v21 + 2);
    uint64_t v24 = v6;
    if (v23)
    {
      uint64_t v25 = &v21[(*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)];
      uint64_t v51 = *(void *)(v6 + 72);
      uint64_t v26 = *(uint64_t (**)(char *, char *, uint64_t, __n128))(v6 + 16);
      uint64_t v46 = v21;
      __n128 v27 = swift_bridgeObjectRetain(v21);
      while (1)
      {
        uint64_t v28 = v26(v11, v25, v5, v27);
        uint64_t v29 = ExtensionRecord.bundleIdentifier.getter(v28);
        uint64_t v31 = v30;
        uint64_t v32 = v52;
        if (v29 == Extension && v30 == v52)
        {
          uint64_t v22 = (uint64_t)v46;
          swift_bridgeObjectRelease(v46);
          uint64_t v36 = (char *)v32;
          uint64_t v37 = v32;
          goto LABEL_13;
        }

        char v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v30, Extension, v52, 0LL);
        swift_bridgeObjectRelease(v31);
        if ((v33 & 1) != 0) {
          break;
        }
        (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v5);
        v25 += v51;
        if (!--v23)
        {
          uint64_t v22 = (uint64_t)v46;
          swift_bridgeObjectRelease(v46);
          goto LABEL_9;
        }
      }

      uint64_t v22 = (uint64_t)v46;
      uint64_t v36 = v46;
      uint64_t v37 = v52;
LABEL_13:
      swift_bridgeObjectRelease(v36);
      uint64_t v34 = (uint64_t)v50;
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v50, v11, v5);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v34, 0LL, 1LL, v5);
      swift_bridgeObjectRelease(v37);
    }

    else
    {
LABEL_9:
      uint64_t v34 = (uint64_t)v50;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v50, 1LL, 1LL, v5);
      swift_bridgeObjectRelease(v52);
    }
  }

  else
  {
    uint64_t v35 = v50;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v50, 1LL, 1LL, v5);
    uint64_t v22 = v17;
    uint64_t v24 = v6;
    uint64_t v34 = (uint64_t)v35;
  }

  swift_bridgeObjectRelease(v22);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v34, 1LL, v5) == 1)
  {
    sub_10000C7CC(v34, &qword_1000594E0);
    uint64_t v38 = type metadata accessor for XPCRemoteError(0LL);
    uint64_t v39 = sub_100005038( &qword_1000598D8,  (uint64_t (*)(uint64_t))&type metadata accessor for XPCRemoteError,  (uint64_t)&protocol conformance descriptor for XPCRemoteError);
    swift_allocError(v38, v39, 0LL, 0LL);
    void *v40 = 0xD000000000000011LL;
    v40[1] = 0x800000010004A5C0LL;
    uint64_t v41 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v38 - 8) + 104LL))( v40,  enum case for XPCRemoteError.genericError(_:),  v38);
    return swift_willThrow(v41);
  }

  else
  {
    os_log_type_t v43 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v47, v34, v5);
    uint64_t v44 = v48;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v48, v43, v5);
    GetExtensionResponse.init(extensionRecord:)(v44);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v43, v5);
  }

uint64_t sub_100026070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v87 = a2;
  uint64_t v83 = a3;
  uint64_t v90 = type metadata accessor for TaskValidationError(0LL);
  uint64_t v4 = *(void *)(v90 - 8);
  uint64_t v5 = __chkstk_darwin(v90);
  uint64_t v81 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v89 = (char *)&v74 - v8;
  __chkstk_darwin(v7);
  uint64_t v80 = (char *)&v74 - v9;
  uint64_t v10 = sub_10000B4F4(&qword_1000598E0);
  __chkstk_darwin(v10);
  uint64_t v82 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v12);
  unint64_t v85 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v91 = *(void *)(v14 - 8);
  os_log_type_t v92 = (uint64_t (*)(char *, char *, uint64_t))v14;
  uint64_t v15 = __chkstk_darwin(v14);
  unsigned int v84 = (void (*)(char *, uint64_t))((char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v74 - v17;
  uint64_t v19 = type metadata accessor for AddTaskRequest(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v23 = type metadata accessor for Logger(0LL);
  uint64_t v24 = sub_10000C538(v23, (uint64_t)qword_10005A7E0);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v86 = a1;
  uint64_t v26 = v25(v22, a1, v19);
  uint64_t v79 = v24;
  __n128 v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v28 = static os_log_type_t.info.getter(v27);
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v77 = swift_slowAlloc(32LL, -1LL);
    uint64_t v95 = v77;
    uint64_t v78 = v4;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v30 = v29 + 12;
    uint64_t v75 = v29 + 4;
    uint64_t v76 = v29;
    v31.n128_f64[0] = ((double (*)(void))AddTaskRequest.taskDefinition.getter)();
    uint64_t v32 = TaskDefinition.name.getter(v31);
    unint64_t v34 = v33;
    (*(void (**)(char *, uint64_t (*)(char *, char *, uint64_t)))(v91 + 8))(v18, v92);
    uint64_t v93 = sub_10000B540(v32, v34, &v95);
    uint64_t v35 = v30;
    uint64_t v4 = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v75, v35);
    swift_bridgeObjectRelease(v34);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    uint64_t v36 = v76;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Processing AddTaskRequest for task: %s", v76, 0xCu);
    uint64_t v37 = v77;
    swift_arrayDestroy(v77, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1LL, -1LL);
    swift_slowDealloc(v36, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }

  uint64_t v38 = v84;
  AddTaskRequest.taskDefinition.getter();
  uint64_t v39 = v85;
  uint64_t v40 = (uint64_t)v88;
  sub_1000242D4(v38, v85);
  uint64_t v42 = v89;
  uint64_t v41 = v90;
  if (v40)
  {
    (*(void (**)(void, uint64_t (*)(char *, char *, uint64_t)))(v91 + 8))(v38, v92);
    uint64_t v95 = v40;
    swift_errorRetain(v40);
    uint64_t v43 = sub_10000B4F4(&qword_1000595D0);
    uint64_t v44 = v81;
    if ((swift_dynamicCast(v81, &v95, v43, v41, 0LL) & 1) != 0)
    {
      swift_errorRelease(v40);
      uint64_t v45 = v80;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v80, v44, v41);
      os_log_type_t v92 = *(uint64_t (**)(char *, char *, uint64_t))(v4 + 16);
      uint64_t v46 = v92(v42, v45, v41);
      uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
      os_log_type_t v48 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v88 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
        uint64_t v50 = v4;
        *(_DWORD *)uint64_t v49 = 138412290;
        uint64_t v51 = sub_100005038( &qword_100059610,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskValidationError,  (uint64_t)&protocol conformance descriptor for TaskValidationError);
        uint64_t v52 = swift_allocError(v41, v51, 0LL, 0LL);
        uint64_t v91 = 0LL;
        uint64_t v53 = v42;
        uint64_t v54 = v52;
        v92(v55, v53, v41);
        uint64_t v56 = _swift_stdlib_bridgeErrorToNSError(v54);
        uint64_t v93 = v56;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v49 + 4, v49 + 12);
        unint64_t v57 = v88;
        uint64_t *v88 = v56;
        unint64_t v58 = *(void (**)(char *, uint64_t))(v4 + 8);
        v58(v53, v41);
        _os_log_impl( (void *)&_mh_execute_header,  v47,  v48,  "Failed to register task due to TaskValidation error: %@",  v49,  0xCu);
        uint64_t v59 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v57, 1LL, v59);
        swift_slowDealloc(v57, -1LL, -1LL);
        swift_slowDealloc(v49, -1LL, -1LL);
      }

      else
      {
        uint64_t v50 = v4;
        unint64_t v58 = *(void (**)(char *, uint64_t))(v4 + 8);
        v58(v42, v41);
      }

      uint64_t v70 = v82;
      uint64_t v71 = v80;
      v92(v82, v80, v41);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v70, 0LL, 1LL, v41);
      AddTaskResponse.init(result:error:)(0LL, v70);
      v58(v71, v41);
      uint64_t v72 = v95;
    }

    else
    {
      swift_errorRelease(v95);
      swift_errorRetain(v40);
      uint64_t v62 = swift_errorRetain(v40);
      uint64_t v63 = (os_log_s *)Logger.logObject.getter(v62);
      os_log_type_t v64 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v66 = swift_slowAlloc(8LL, -1LL);
        uint64_t v78 = v4;
        os_log_type_t v92 = (uint64_t (*)(char *, char *, uint64_t))v66;
        *(_DWORD *)uint64_t v65 = 138412290;
        swift_errorRetain(v40);
        uint64_t v67 = _swift_stdlib_bridgeErrorToNSError(v40);
        uint64_t v95 = v67;
        uint64_t v41 = v90;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v65 + 4, v65 + 12);
        uint64_t v68 = v92;
        *(void *)os_log_type_t v92 = v67;
        swift_errorRelease(v40);
        swift_errorRelease(v40);
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "Failed to register task with error: %@", v65, 0xCu);
        uint64_t v69 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v68, 1LL, v69);
        uint64_t v4 = v78;
        swift_slowDealloc(v68, -1LL, -1LL);
        swift_slowDealloc(v65, -1LL, -1LL);
      }

      else
      {
        swift_errorRelease(v40);
        swift_errorRelease(v40);
      }

      uint64_t v73 = v82;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v82, 1LL, 1LL, v41);
      AddTaskResponse.init(result:error:)(0LL, v73);
      uint64_t v72 = v40;
    }

    return swift_errorRelease(v72);
  }

  else
  {
    (*(void (**)(void, uint64_t (*)(char *, char *, uint64_t)))(v91 + 8))(v38, v92);
    sub_10000C7CC((uint64_t)v39, &qword_1000595E8);
    uint64_t v60 = v82;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v82, 1LL, 1LL, v41);
    return AddTaskResponse.init(result:error:)(1LL, v60);
  }

void sub_100026848(uint64_t a1, uint64_t a2)
{
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_10000C538(v4, (uint64_t)qword_10005A7E0);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Resetting Tasks", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  sub_1000241F8();
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(*(void *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry) + 56LL)
                          + 16LL);
  os_unfair_lock_lock(v9);
  sub_100019FE0(v10, sub_10003EF20);
  if (v2)
  {
    os_unfair_lock_unlock(v9);
    __break(1u);
  }

  else
  {
    os_unfair_lock_unlock(v9);
    sub_1000105C0();
    uint64_t v11 = ResetTasksResponse.init(reloaded:)(0LL);
    if ((ResetTasksRequest.reload.getter(v11) & 1) != 0)
    {
      sub_100020904();
      sub_100023798();
      sub_100023E24();
      ResetTasksResponse.reloaded.setter(1LL);
    }
  }

uint64_t sub_1000269CC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v57[1] = a2;
  uint64_t v3 = type metadata accessor for TaskType(0LL);
  uint64_t v71 = *(void *)(v3 - 8);
  uint64_t v72 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v70 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v69 = (char *)v57 - v6;
  uint64_t v7 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MLHostTask(0LL);
  uint64_t v67 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v61 = (char *)v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v73 = (char *)v57 - v13;
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  uint64_t v60 = sub_10000C538(v14, (uint64_t)qword_10005A7E0);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v60);
  os_log_type_t v16 = ((uint64_t (*)(void))static os_log_type_t.info.getter)();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Cleaning dynamicTasks", v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  uint64_t v18 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v19 = (os_unfair_lock_s *)(*(void *)(v18 + 56) + 16LL);
  os_unfair_lock_lock(v19);
  uint64_t v68 = v18 + 64;
  swift_beginAccess(v18 + 64, v78, 0LL, 0LL);
  uint64_t v79 = v18;
  uint64_t v20 = *(void *)(v18 + 64);
  swift_bridgeObjectRetain(v20);
  uint64_t v22 = sub_10002EA7C(v21);
  swift_bridgeObjectRelease(v20);
  os_unfair_lock_unlock(v19);
  uint64_t v24 = v22[2];
  v57[0] = v22;
  if (v24)
  {
    unsigned int v62 = enum case for TaskType.dynamicTask(_:);
    uint64_t v65 = _swiftEmptyArrayStorage;
    uint64_t v25 = v22 + 5;
    *(void *)&__int128 v23 = 136315138LL;
    __int128 v59 = v23;
    unint64_t v58 = (char *)&type metadata for Any + 8;
    uint64_t v26 = v67;
    uint64_t v63 = v9;
    uint64_t v64 = v10;
    while (1)
    {
      uint64_t v27 = *(v25 - 1);
      unint64_t v28 = *v25;
      uint64_t v29 = v79;
      uint64_t v30 = (os_unfair_lock_s *)(*(void *)(v79 + 56) + 16LL);
      swift_bridgeObjectRetain(*v25);
      os_unfair_lock_lock(v30);
      swift_beginAccess(v68, &v76, 32LL, 0LL);
      uint64_t v31 = *(void *)(v29 + 64);
      if (*(void *)(v31 + 16))
      {
        swift_bridgeObjectRetain(v28);
        unint64_t v32 = sub_10002BC00(v27, v28);
        if ((v33 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v26 + 16))( v9,  *(void *)(v31 + 56) + *(void *)(v26 + 72) * v32,  v10);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v9, 0LL, 1LL, v10);
        }

        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v9, 1LL, 1LL, v10);
        }

        swift_bridgeObjectRelease(v28);
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v9, 1LL, 1LL, v10);
      }

      swift_endAccess(&v76);
      os_unfair_lock_unlock(v30);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v9, 1LL, v10) == 1)
      {
        swift_bridgeObjectRelease(v28);
        sub_10000C7CC((uint64_t)v9, &qword_1000595E8);
      }

      else
      {
        uint64_t v66 = *(uint64_t (**)(char *, char *, uint64_t))(v26 + 32);
        uint64_t v34 = v66(v73, v9, v10);
        MLHostTask.taskType.getter(v34);
        uint64_t v35 = v72;
        (*(void (**)(char *, void, uint64_t))(v71 + 104))(v70, v62, v72);
        uint64_t v36 = sub_100005038( &qword_100059620,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskType,  (uint64_t)&protocol conformance descriptor for TaskType);
        dispatch thunk of RawRepresentable.rawValue.getter(&v76, v35, v36);
        dispatch thunk of RawRepresentable.rawValue.getter(&v74, v35, v36);
        uint64_t v37 = v77;
        uint64_t v38 = v75;
        if (v76 == v74 && v77 == v75)
        {
          swift_bridgeObjectRelease_n(v77, 2LL);
          uint64_t v39 = *(void (**)(char *, uint64_t))(v71 + 8);
          uint64_t v40 = v72;
          v39(v70, v72);
          v39(v69, v40);
LABEL_20:
          char v44 = sub_1000108A0(v27, v28);
          uint64_t v9 = v63;
          uint64_t v10 = v64;
          if ((v44 & 1) != 0)
          {
            sub_10003E138(v27, v28);
            swift_bridgeObjectRelease(v28);
            (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v61, v73, v10);
            if ((swift_isUniquelyReferenced_nonNull_native(v65) & 1) == 0) {
              uint64_t v65 = (void *)sub_10001A428(0, v65[2] + 1LL, 1, (unint64_t)v65);
            }
            uint64_t v45 = (void (*)(unint64_t, char *, uint64_t))v66;
            unint64_t v47 = v65[2];
            unint64_t v46 = v65[3];
            if (v47 >= v46 >> 1) {
              uint64_t v65 = (void *)sub_10001A428(v46 > 1, v47 + 1, 1, (unint64_t)v65);
            }
            os_log_type_t v48 = v65;
            void v65[2] = v47 + 1;
            unint64_t v49 = (unint64_t)v48
            uint64_t v26 = v67;
            v45(v49, v61, v10);
          }

          else
          {
            swift_bridgeObjectRetain(v28);
            uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
            os_log_type_t v52 = static os_log_type_t.info.getter(v51);
            if (os_log_type_enabled(v51, v52))
            {
              uint64_t v53 = swift_slowAlloc(12LL, -1LL);
              uint64_t v54 = swift_slowAlloc(32LL, -1LL);
              uint64_t v76 = v54;
              *(_DWORD *)uint64_t v53 = v59;
              swift_bridgeObjectRetain(v28);
              *(void *)(v53 + 4) = sub_10000B540(v27, v28, &v76);
              swift_bridgeObjectRelease_n(v28, 3LL);
              _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed at removing task: %s", (uint8_t *)v53, 0xCu);
              swift_arrayDestroy(v54, 1LL, v58);
              uint64_t v55 = v54;
              uint64_t v10 = v64;
              swift_slowDealloc(v55, -1LL, -1LL);
              swift_slowDealloc(v53, -1LL, -1LL);
            }

            else
            {
              swift_bridgeObjectRelease_n(v28, 2LL);
            }

            uint64_t v26 = v67;
          }

          (*(void (**)(char *, uint64_t))(v26 + 8))(v73, v10);
          goto LABEL_8;
        }

        char v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v76, v77, v74, v75, 0LL);
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(v38);
        uint64_t v42 = *(void (**)(char *, uint64_t))(v71 + 8);
        uint64_t v43 = v72;
        v42(v70, v72);
        v42(v69, v43);
        if ((v41 & 1) != 0) {
          goto LABEL_20;
        }
        uint64_t v26 = v67;
        uint64_t v10 = v64;
        (*(void (**)(char *, uint64_t))(v67 + 8))(v73, v64);
        swift_bridgeObjectRelease(v28);
        uint64_t v9 = v63;
      }

LABEL_8:
      v25 += 2;
      if (!--v24) {
        goto LABEL_33;
      }
    }
  }

  uint64_t v65 = _swiftEmptyArrayStorage;
LABEL_33:
  swift_release(v57[0]);
  return CleanTasksResponse.init(tasks:)(v65);
}

uint64_t sub_1000270F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for MLHostConfig(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v7 = a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  swift_beginAccess(v7, v10, 0LL, 0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  return GetHostConfigurationResponse.init(config:)(v6);
}

uint64_t sub_1000271AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v6 = type metadata accessor for SetHostConfigurationRequest(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MLHostConfig(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = a1;
  SetHostConfigurationRequest.config.getter(v12);
  BOOL v15 = sub_1000302E0();
  uint64_t v43 = v11;
  os_log_type_t v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  v16(v14, v10);
  if (v15)
  {
    BOOL v41 = v15;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v42 = a3;
    uint64_t v17 = type metadata accessor for Logger(0LL);
    sub_10000C538(v17, (uint64_t)qword_10005A7E0);
    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v45, v6);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.info.getter();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      os_log_t v39 = v19;
      uint64_t v22 = swift_slowAlloc(12LL, -1LL);
      int v37 = v21;
      __int128 v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc(32LL, -1LL);
      uint64_t v38 = v24;
      v46[0] = v24;
      uint64_t v40 = v3;
      *(_DWORD *)__int128 v23 = 136315138;
      uint64_t v25 = v23 + 12;
      uint64_t v35 = v23 + 4;
      uint64_t v36 = v23;
      SetHostConfigurationRequest.config.getter(v24);
      uint64_t v26 = sub_100005038( &qword_1000598E8,  (uint64_t (*)(uint64_t))&type metadata accessor for MLHostConfig,  (uint64_t)&protocol conformance descriptor for MLHostConfig);
      uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter(v10, v26);
      unint64_t v29 = v28;
      v16(v14, v10);
      uint64_t v47 = sub_10000B540(v27, v29, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v35, v25);
      swift_bridgeObjectRelease(v29);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v19 = v39;
      uint64_t v30 = v36;
      _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v37, "Updated MLHost config: %s", v36, 0xCu);
      uint64_t v31 = v38;
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1LL, -1LL);
      swift_slowDealloc(v30, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }

    SetHostConfigurationRequest.config.getter(v32);
    uint64_t v33 = v44 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
    swift_beginAccess(v44 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config, v46, 33LL, 0LL);
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 40))(v33, v14, v10);
    swift_endAccess(v46);
    LOBYTE(v15) = v41;
  }

  return SetHostConfigurationResponse.init(success:error:)(v15, 0LL, 0LL);
}

uint64_t sub_1000274E8()
{
  if ((GetNotificationsConfigRequest.registeredOnly.getter() & 1) != 0) {
    uint64_t v0 = sub_100009324();
  }
  else {
    uint64_t v0 = sub_100008F5C();
  }
  return GetNotificationsConfigResponse.init(channelsByTopic:)(v0);
}

uint64_t sub_100027544()
{
  if ((ResetNotificationsRequest.reload.getter() & 1) != 0) {
    sub_10000763C();
  }
  char v0 = ResetNotificationsRequest.reload.getter();
  return ResetTasksResponse.init(reloaded:)(v0 & 1);
}

uint64_t sub_1000275B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v144 = type metadata accessor for OnDemandResult(0LL);
  uint64_t v142 = *(void *)(v144 - 8);
  __chkstk_darwin(v144);
  id v143 = (char *)v138 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OnDemandError(0LL);
  uint64_t v161 = *(void *)(v9 - 8);
  uint64_t v162 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v138 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for TaskStatus(0LL);
  uint64_t v152 = *(void *)(v146 - 8);
  uint64_t v12 = __chkstk_darwin(v146);
  unint64_t v151 = (char *)v138 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  int64_t v150 = (char *)v138 - v14;
  uint64_t v148 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v147 = *(void *)(v148 - 8);
  __chkstk_darwin(v148);
  os_log_type_t v16 = (char *)v138 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for TaskRequest(0LL);
  uint64_t v154 = *(void *)(v17 - 8);
  uint64_t v155 = v17;
  __chkstk_darwin(v17);
  uint64_t v157 = (char *)v138 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v153 = type metadata accessor for GetOnDemandTaskRequest(0LL);
  uint64_t v156 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  uint64_t v149 = (char *)v138 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_10000B4F4(&qword_1000595E8);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)v138 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for MLHostTask(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v159 = v23;
  uint64_t v160 = v24;
  uint64_t v25 = __chkstk_darwin(v23);
  id v145 = (char *)v138 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v158 = (char *)v138 - v28;
  uint64_t v29 = GetOnDemandTaskRequest.taskName.getter(v27);
  uint64_t v31 = v30;
  char v32 = sub_10000F5D4(v29, v30, a2);
  uint64_t v33 = swift_bridgeObjectRelease(v31);
  if ((v32 & 1) == 0)
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v45 = type metadata accessor for Logger(0LL);
    uint64_t v46 = sub_10000C538(v45, (uint64_t)qword_10005A7E0);
    uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Client not authorized for onDemand requests.", v49, 2u);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    (*(void (**)(char *, void, uint64_t))(v161 + 104))( v11,  enum case for OnDemandError.clientUnauthorized(_:),  v162);
    uint64_t v50 = v11;
    return GetOnDemandTaskRequestResponse.init(error:)(v50);
  }

  uint64_t v140 = v11;
  uint64_t v141 = a4;
  v138[1] = a3;
  uint64_t v34 = *(void *)(a3 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v139 = a1;
  uint64_t v35 = GetOnDemandTaskRequest.taskName.getter(v33);
  uint64_t v37 = v36;
  uint64_t v38 = (os_unfair_lock_s *)(*(void *)(v34 + 56) + 16LL);
  os_unfair_lock_lock(v38);
  swift_beginAccess(v34 + 64, &v165, 32LL, 0LL);
  uint64_t v39 = *(void *)(v34 + 64);
  if (*(void *)(v39 + 16))
  {
    swift_bridgeObjectRetain(v37);
    unint64_t v40 = sub_10002BC00(v35, v37);
    uint64_t v41 = v159;
    if ((v42 & 1) != 0)
    {
      uint64_t v43 = *(void *)(v39 + 56);
      uint64_t v44 = v160;
      (*(void (**)(char *, unint64_t, uint64_t))(v160 + 16))( v22,  v43 + *(void *)(v160 + 72) * v40,  v159);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v22, 0LL, 1LL, v41);
    }

    else
    {
      uint64_t v44 = v160;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56))(v22, 1LL, 1LL, v159);
    }

    swift_bridgeObjectRelease(v37);
  }

  else
  {
    uint64_t v41 = v159;
    uint64_t v44 = v160;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56))(v22, 1LL, 1LL, v159);
  }

  swift_endAccess(&v165);
  os_unfair_lock_unlock(v38);
  swift_bridgeObjectRelease(v37);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v22, 1LL, v41) == 1)
  {
    sub_10000C7CC((uint64_t)v22, &qword_1000595E8);
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v51 = type metadata accessor for Logger(0LL);
    sub_10000C538(v51, (uint64_t)qword_10005A7E0);
    uint64_t v52 = v156;
    uint64_t v53 = v149;
    uint64_t v54 = v153;
    uint64_t v55 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v156 + 16))(v149, v139, v153);
    uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
    os_log_type_t v57 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v56, v57))
    {
      unint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      __int128 v59 = (void *)swift_slowAlloc(32LL, -1LL);
      id v165 = v59;
      *(_DWORD *)unint64_t v58 = 136315138;
      uint64_t v60 = GetOnDemandTaskRequest.taskName.getter(v59);
      unint64_t v62 = v61;
      id v164 = (id)sub_10000B540(v60, v61, (uint64_t *)&v165);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v164, &v165, v58 + 4, v58 + 12);
      swift_bridgeObjectRelease(v62);
      (*(void (**)(char *, uint64_t))(v156 + 8))(v53, v54);
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "Invalid taskName for onDemand request: %s", v58, 0xCu);
      swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1LL, -1LL);
      swift_slowDealloc(v58, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
    }

    uint64_t v90 = v140;
    (*(void (**)(char *, void, uint64_t))(v161 + 104))( v140,  enum case for OnDemandError.taskInvalid(_:),  v162);
    uint64_t v50 = v90;
    return GetOnDemandTaskRequestResponse.init(error:)(v50);
  }

  uint64_t v63 = v158;
  uint64_t v64 = (*(uint64_t (**)(char *, char *, uint64_t))(v44 + 32))(v158, v22, v41);
  uint64_t v65 = MLHostTask.taskDefinition.getter(v64);
  uint64_t v66 = v157;
  TaskDefinition.taskRequest.getter(v65);
  uint64_t v67 = (*(uint64_t (**)(char *, uint64_t))(v147 + 8))(v16, v148);
  uint64_t v68 = v150;
  MLHostTask.status.getter(v67);
  uint64_t v70 = v151;
  uint64_t v69 = v152;
  uint64_t v71 = v146;
  (*(void (**)(char *, void, uint64_t))(v152 + 104))(v151, enum case for TaskStatus.taskRunning(_:), v146);
  uint64_t v72 = sub_100005038( &qword_1000598F0,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskStatus,  (uint64_t)&protocol conformance descriptor for TaskStatus);
  char v73 = dispatch thunk of static Equatable.== infix(_:_:)(v68, v70, v71, v72);
  uint64_t v74 = *(void (**)(char *, uint64_t))(v69 + 8);
  v74(v70, v71);
  uint64_t v75 = ((uint64_t (*)(char *, uint64_t))v74)(v68, v71);
  if ((v73 & 1) != 0)
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v76 = type metadata accessor for Logger(0LL);
    sub_10000C538(v76, (uint64_t)qword_10005A7E0);
    uint64_t v77 = v160;
    uint64_t v78 = v145;
    uint64_t v79 = (*(uint64_t (**)(char *, char *, uint64_t))(v160 + 16))(v145, v63, v41);
    uint64_t v80 = (os_log_s *)Logger.logObject.getter(v79);
    os_log_type_t v81 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v83 = (void *)swift_slowAlloc(32LL, -1LL);
      id v165 = v83;
      *(_DWORD *)uint64_t v82 = 136315138;
      uint64_t v84 = sub_100005038( &qword_1000597F8,  (uint64_t (*)(uint64_t))&type metadata accessor for MLHostTask,  (uint64_t)&protocol conformance descriptor for MLHostTask);
      uint64_t v85 = dispatch thunk of CustomStringConvertible.description.getter(v159, v84);
      unint64_t v87 = v86;
      id v164 = (id)sub_10000B540(v85, v86, (uint64_t *)&v165);
      uint64_t v41 = v159;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v164, &v165, v82 + 4, v82 + 12);
      swift_bridgeObjectRelease(v87);
      uint64_t v88 = *(void (**)(char *, uint64_t))(v77 + 8);
      v88(v78, v41);
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "Found existing running task: %s", v82, 0xCu);
      swift_arrayDestroy(v83, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v89 = v83;
      uint64_t v63 = v158;
      swift_slowDealloc(v89, -1LL, -1LL);
      swift_slowDealloc(v82, -1LL, -1LL);
    }

    else
    {
      uint64_t v88 = *(void (**)(char *, uint64_t))(v77 + 8);
      v88(v78, v41);
    }

    os_log_type_t v111 = v140;
    (*(void (**)(char *, void, uint64_t))(v161 + 104))( v140,  enum case for OnDemandError.taskRunning(_:),  v162);
    GetOnDemandTaskRequestResponse.init(error:)(v111);
    (*(void (**)(char *, uint64_t))(v154 + 8))(v157, v155);
    return ((uint64_t (*)(char *, uint64_t))v88)(v63, v41);
  }

  else
  {
    id v165 = (id)MLHostTask.name.getter(v75);
    uint64_t v166 = v92;
    v93._uint64_t countAndFlagsBits = 0x6E616D65646E6F2ELL;
    v93._object = (void *)0xE900000000000064LL;
    String.append(_:)(v93);
    uint64_t v94 = v166;
    uint64_t v95 = (void *)objc_opt_self(&OBJC_CLASS___BGSystemTaskScheduler);
    uint64_t v96 = (uint64_t)v63;
    id v97 = [v95 sharedScheduler];
    NSString v98 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v94);
    id v99 = [v97 taskRequestForIdentifier:v98];

    if (v99)
    {
      uint64_t v100 = qword_100058F68;
      id v101 = v99;
      uint64_t v102 = v66;
      if (v100 != -1) {
        swift_once(&qword_100058F68, sub_10001F3C8);
      }
      uint64_t v103 = type metadata accessor for Logger(0LL);
      sub_10000C538(v103, (uint64_t)qword_10005A7E0);
      id v104 = v101;
      uint64_t v105 = (os_log_s *)Logger.logObject.getter(v104);
      os_log_type_t v106 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v105, v106))
      {
        NSString v107 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v156 = swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)NSString v107 = 138412290;
        id v165 = v104;
        id v108 = v104;
        uint64_t v102 = v157;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v165, &v166, v107 + 4, v107 + 12);
        uint64_t v109 = v156;
        *(void *)uint64_t v156 = v99;

        uint64_t v41 = v159;
        _os_log_impl((void *)&_mh_execute_header, v105, v106, "Found existing taskRequest: %@", v107, 0xCu);
        uint64_t v110 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v109, 1LL, v110);
        swift_slowDealloc(v109, -1LL, -1LL);
        swift_slowDealloc(v107, -1LL, -1LL);
      }

      else
      {

        uint64_t v105 = (os_log_s *)v104;
      }

      uint64_t v126 = v140;
      (*(void (**)(char *, void, uint64_t))(v161 + 104))( v140,  enum case for OnDemandError.taskPending(_:),  v162);
      GetOnDemandTaskRequestResponse.init(error:)(v126);

      (*(void (**)(char *, uint64_t))(v154 + 8))(v102, v155);
      return (*(uint64_t (**)(char *, uint64_t))(v160 + 8))(v158, v41);
    }

    else
    {
      uint64_t v112 = sub_100021BD0(v96, 1);
      unint64_t v114 = v113;
      id v115 = objc_allocWithZone(&OBJC_CLASS___BGNonRepeatingSystemTaskRequest);
      swift_bridgeObjectRetain(v114);
      NSString v116 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v114);
      id v117 = [v115 initWithIdentifier:v116];

      id v165 = v117;
      id v118 = v117;
      [v118 setScheduleAfter:0.5];
      [v118 setTrySchedulingBefore:10.0];

      uint64_t v119 = sub_10000C654(0LL, &qword_1000598F8, &OBJC_CLASS___BGNonRepeatingSystemTaskRequest_ptr);
      uint64_t v120 = v66;
      TaskRequest.asSystemRequest<A>(request:)(&v165, v119);
      id v121 = [v95 sharedScheduler];
      id v122 = v165;
      id v164 = 0LL;
      LOBYTE(v118) = [v121 submitTaskRequest:v165 error:&v164];

      id v123 = v164;
      if ((v118 & 1) != 0)
      {
        id v124 = v164;
        swift_bridgeObjectRelease(v114);
        unint64_t v125 = v143;
        (*(void (**)(char *, void, uint64_t))(v142 + 104))( v143,  enum case for OnDemandResult.taskScheduled(_:),  v144);
        GetOnDemandTaskRequestResponse.init(result:)(v125);

        (*(void (**)(char *, uint64_t))(v154 + 8))(v66, v155);
        return (*(uint64_t (**)(char *, uint64_t))(v160 + 8))(v158, v159);
      }

      else
      {
        id v127 = v164;
        uint64_t v128 = _convertNSErrorToError(_:)(v123);

        swift_willThrow(v129);
        if (qword_100058F68 != -1) {
          swift_once(&qword_100058F68, sub_10001F3C8);
        }
        uint64_t v130 = type metadata accessor for Logger(0LL);
        sub_10000C538(v130, (uint64_t)qword_10005A7E0);
        uint64_t v131 = swift_bridgeObjectRetain_n(v114, 2LL);
        uint64_t v132 = (os_log_s *)Logger.logObject.getter(v131);
        os_log_type_t v133 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v132, v133))
        {
          uint64_t v134 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v135 = (void *)swift_slowAlloc(32LL, -1LL);
          id v164 = v135;
          *(_DWORD *)uint64_t v134 = 136315138;
          swift_bridgeObjectRetain(v114);
          uint64_t v163 = sub_10000B540(v112, v114, (uint64_t *)&v164);
          uint64_t v120 = v157;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v163, &v164, v134 + 4, v134 + 12);
          swift_bridgeObjectRelease_n(v114, 3LL);
          _os_log_impl((void *)&_mh_execute_header, v132, v133, "Failed at scheduling ondemand task: %s", v134, 0xCu);
          swift_arrayDestroy(v135, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v135, -1LL, -1LL);
          swift_slowDealloc(v134, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v114, 2LL);
        }

        uint64_t v136 = v158;
        sub_10003E138(v112, v114);
        swift_bridgeObjectRelease(v114);
        unsigned int v137 = v140;
        (*(void (**)(char *, void, uint64_t))(v161 + 104))( v140,  enum case for OnDemandError.schedulingError(_:),  v162);
        GetOnDemandTaskRequestResponse.init(error:)(v137);
        swift_errorRelease(v128);

        (*(void (**)(char *, uint64_t))(v154 + 8))(v120, v155);
        return (*(uint64_t (**)(char *, uint64_t))(v160 + 8))(v136, v159);
      }
    }
  }

void sub_100028540( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v377 = a8;
  uint64_t v376 = a7;
  uint64_t v375 = a6;
  uint64_t v374 = a5;
  uint64_t v373 = a4;
  uint64_t v372 = a3;
  uint64_t v371 = a2;
  uint64_t v370 = a1;
  uint64_t v345 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v344 = *(void *)(v345 - 8);
  __chkstk_darwin(v345);
  v343 = &v329[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = sub_10000B4F4(&qword_1000595C0);
  __chkstk_darwin(v11);
  v342 = &v329[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t v347 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  v334 = &v329[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = __chkstk_darwin(v14);
  v341 = &v329[-v17];
  __chkstk_darwin(v16);
  v351 = &v329[-v18];
  uint64_t v379 = type metadata accessor for MLHostTask(0LL);
  uint64_t v378 = *(void *)(v379 - 8);
  __chkstk_darwin(v379);
  uint64_t v20 = &v329[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v21 = sub_10000B4F4(&qword_1000595E8);
  uint64_t v22 = __chkstk_darwin(v21);
  v352 = &v329[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v24 = __chkstk_darwin(v22);
  v369 = &v329[-v25];
  __chkstk_darwin(v24);
  v394 = &v329[-v26];
  uint64_t v27 = sub_10000B4F4(&qword_100059638);
  __chkstk_darwin(v27);
  v401 = &v329[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v400 = type metadata accessor for DynamicTaskSource(0LL);
  uint64_t v368 = *(void *)(v400 - 8);
  __chkstk_darwin(v400);
  v399 = &v329[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v412 = type metadata accessor for TaskStatus(0LL);
  uint64_t v367 = *(void *)(v412 - 8);
  __chkstk_darwin(v412);
  v398 = &v329[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v31 = sub_10000B4F4(&qword_1000597F0);
  __chkstk_darwin(v31);
  v366 = &v329[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v33 = sub_10000B4F4(&qword_100059640);
  __chkstk_darwin(v33);
  v365 = &v329[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v397 = type metadata accessor for TaskMetadata(0LL);
  uint64_t v393 = *(void *)(v397 - 8);
  __chkstk_darwin(v397);
  v411 = &v329[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v392 = type metadata accessor for PushMetadata(0LL);
  uint64_t v36 = *(void *)(v392 - 8);
  __chkstk_darwin(v392);
  v391 = &v329[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v390 = type metadata accessor for Date(0LL);
  uint64_t v389 = *(void *)(v390 - 8);
  __chkstk_darwin(v390);
  uint64_t v39 = &v329[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v403 = sub_10000B4F4(&qword_1000592E0);
  uint64_t v40 = __chkstk_darwin(v403);
  v340 = &v329[-((v41 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v42 = __chkstk_darwin(v40);
  v356 = &v329[-v43];
  uint64_t v44 = __chkstk_darwin(v42);
  v349 = &v329[-v45];
  uint64_t v46 = __chkstk_darwin(v44);
  v333 = &v329[-v47];
  uint64_t v48 = __chkstk_darwin(v46);
  v339 = &v329[-v49];
  uint64_t v50 = __chkstk_darwin(v48);
  v338 = &v329[-v51];
  uint64_t v52 = __chkstk_darwin(v50);
  v364 = &v329[-v53];
  uint64_t v54 = __chkstk_darwin(v52);
  uint64_t v56 = &v329[-v55];
  uint64_t v57 = __chkstk_darwin(v54);
  v387 = (uint64_t *)&v329[-v58];
  __chkstk_darwin(v57);
  v413 = &v329[-v59];
  uint64_t v60 = sub_10000B4F4(&qword_1000592D8);
  uint64_t v61 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  v386 = &v329[-((v62 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v63 = type metadata accessor for Logger(0LL);
  uint64_t v64 = sub_10000C538(v63, (uint64_t)qword_10005A7E0);
  swift_bridgeObjectRetain(a9);
  uint64_t v416 = v64;
  uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
  os_log_type_t v67 = static os_log_type_t.info.getter(v66);
  BOOL v68 = os_log_type_enabled(v66, v67);
  v350 = v20;
  v388 = v39;
  if (v68)
  {
    uint64_t v69 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v69 = 134217984;
    uint64_t v419 = *(void *)(a9 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v419, &v420, v69 + 4, v69 + 12);
    swift_bridgeObjectRelease(a9);
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Received push notification with %ld messages.", v69, 0xCu);
    swift_slowDealloc(v69, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(a9);
  }

  uint64_t v70 = *(void *)(a9 + 16);
  if (v70)
  {
    uint64_t v385 = v36;
    uint64_t v384 = a10;
    uint64_t v383 = *(int *)(v60 + 48);
    uint64_t v363 = OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry;
    uint64_t v71 = a9 + ((*(unsigned __int8 *)(v61 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80));
    uint64_t v382 = *(void *)(v61 + 72);
    unsigned int v362 = enum case for TaskStatus.taskCreated(_:);
    unsigned int v410 = enum case for DynamicTaskSource.push(_:);
    unsigned int v361 = enum case for TaskStatus.taskReceived(_:);
    v355 = &v418;
    unsigned int v358 = enum case for TaskStatus.taskFailedToRegister(_:);
    unsigned int v337 = enum case for TaskStatus.taskSuccessfullyRegistered(_:);
    unsigned int v336 = enum case for URL.DirectoryHint.inferFromPath(_:);
    unsigned int v330 = enum case for TaskStatus.taskParametersStored(_:);
    unsigned int v335 = enum case for TaskStatus.taskParametersFailedToStore(_:);
    uint64_t v332 = a9;
    __n128 v72 = swift_bridgeObjectRetain(a9);
    uint64_t v402 = 0LL;
    v72.n128_u64[0] = 134218242LL;
    __n128 v360 = v72;
    v359 = (char *)&type metadata for Any + 8;
    v72.n128_u64[0] = 136315138LL;
    __n128 v357 = v72;
    v72.n128_u64[0] = 136315394LL;
    __n128 v353 = v72;
    uint64_t v73 = (uint64_t)v56;
    v380 = v56;
    uint64_t v74 = v413;
    uint64_t v348 = v13;
    while (1)
    {
      uint64_t v414 = v71;
      uint64_t v415 = v70;
      uint64_t v84 = v386;
      sub_10003EF84(v71, (uint64_t)v386, &qword_1000592D8);
      uint64_t v85 = *(os_log_s **)&v84[v383];
      sub_10000C788((uint64_t)v84, (uint64_t)v74, &qword_1000592E0);
      unint64_t v86 = v387;
      sub_10003EF84((uint64_t)v74, (uint64_t)v387, &qword_1000592E0);
      uint64_t v87 = sub_10003EF84((uint64_t)v74, v73, &qword_1000592E0);
      uint64_t v88 = (os_log_s *)Logger.logObject.getter(v87);
      os_log_type_t v89 = static os_log_type_t.info.getter(v88);
      if (os_log_type_enabled(v88, v89))
      {
        uint64_t v90 = swift_slowAlloc(22LL, -1LL);
        uint64_t v91 = swift_slowAlloc(32LL, -1LL);
        uint64_t v419 = v91;
        *(_DWORD *)uint64_t v90 = v360.n128_u32[0];
        uint64_t v92 = *v86;
        sub_10000C7CC((uint64_t)v86, &qword_1000592E0);
        *(void *)(v90 + 4) = v92;
        *(_WORD *)(v90 + 12) = 2080;
        uint64_t v93 = v403;
        uint64_t v95 = TaskDefinition.name.getter(v94);
        unint64_t v97 = v96;
        *(void *)(v90 + 14) = sub_10000B540(v95, v96, &v419);
        swift_bridgeObjectRelease(v97);
        uint64_t v98 = v73;
        sub_10000C7CC(v73, &qword_1000592E0);
        _os_log_impl( (void *)&_mh_execute_header,  v88,  v89,  "Received new push message: version: %ld, task: %s",  (uint8_t *)v90,  0x16u);
        swift_arrayDestroy(v91, 1LL, v359);
        uint64_t v99 = v91;
        uint64_t v74 = v413;
        swift_slowDealloc(v99, -1LL, -1LL);
        swift_slowDealloc(v90, -1LL, -1LL);
      }

      else
      {
        sub_10000C7CC((uint64_t)v86, &qword_1000592E0);
        uint64_t v98 = v73;
        sub_10000C7CC(v73, &qword_1000592E0);

        uint64_t v93 = v403;
      }

      id v101 = &v74[*(int *)(v93 + 44)];
      uint64_t v102 = v388;
      static Date.now.getter(v100);
      char v103 = static Date.> infix(_:_:)(v101, v102);
      uint64_t v104 = v389;
      uint64_t v105 = v390;
      (*(void (**)(_BYTE *, uint64_t))(v389 + 8))(v102, v390);
      if ((v103 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease(v85);
      os_log_type_t v106 = v364;
      uint64_t v107 = sub_10003EF84((uint64_t)v74, (uint64_t)v364, &qword_1000592E0);
      id v108 = (void *)Logger.logObject.getter(v107);
      uint64_t v109 = (uint64_t)v74;
      os_log_type_t v110 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled((os_log_t)v108, v110))
      {

        sub_10000C7CC((uint64_t)v106, &qword_1000592E0);
        sub_10000C7CC(v109, &qword_1000592E0);
        uint64_t v74 = (_BYTE *)v109;
        uint64_t v83 = v414;
        uint64_t v82 = v415;
        uint64_t v73 = v98;
        goto LABEL_10;
      }

      uint64_t v75 = swift_slowAlloc(12LL, -1LL);
      uint64_t v76 = swift_slowAlloc(32LL, -1LL);
      uint64_t v419 = v76;
      __n128 v77 = v357;
      *(_DWORD *)uint64_t v75 = v357.n128_u32[0];
      uint64_t v78 = TaskDefinition.name.getter(v77);
      unint64_t v80 = v79;
      *(void *)(v75 + 4) = sub_10000B540(v78, v79, &v419);
      swift_bridgeObjectRelease(v80);
      sub_10000C7CC((uint64_t)v106, &qword_1000592E0);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v108,  v110,  "Push task cannot be registered before created, task name: %s.",  (uint8_t *)v75,  0xCu);
      swift_arrayDestroy(v76, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v81 = v76;
      uint64_t v73 = (uint64_t)v380;
      swift_slowDealloc(v81, -1LL, -1LL);
      swift_slowDealloc(v75, -1LL, -1LL);

      sub_10000C7CC(v109, &qword_1000592E0);
      uint64_t v74 = (_BYTE *)v109;
LABEL_9:
      uint64_t v83 = v414;
      uint64_t v82 = v415;
LABEL_10:
      uint64_t v71 = v83 + v382;
      uint64_t v70 = v82 - 1;
      if (!v70)
      {
        swift_bridgeObjectRelease(v332);
        return;
      }
    }

    os_log_t v381 = v85;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v104 + 16))(v102, v101, v105);
    uint64_t v111 = v371;
    swift_bridgeObjectRetain(v371);
    uint64_t v112 = v373;
    swift_bridgeObjectRetain(v373);
    uint64_t v113 = v375;
    swift_bridgeObjectRetain(v375);
    unint64_t v114 = v74;
    uint64_t v115 = v377;
    __n128 v116 = swift_bridgeObjectRetain(v377);
    id v117 = v391;
    PushMetadata.init(topic:channelID:pushType:pushPriority:creationDate:)( v370,  v111,  v372,  v112,  v374,  v113,  v376,  v115,  v116,  v102);
    uint64_t v118 = v385;
    uint64_t v119 = v365;
    uint64_t v120 = v117;
    uint64_t v121 = v392;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v385 + 16))(v365, v120, v392);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v118 + 56))(v119, 0LL, 1LL, v121);
    uint64_t v122 = type metadata accessor for PullMetadata(0LL);
    id v123 = v366;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v122 - 8) + 56LL))(v366, 1LL, 1LL, v122);
    id v124 = v411;
    v125.n128_f64[0] = TaskMetadata.init(pushMetadata:pullMetadata:)(v119, v123);
    uint64_t v126 = (void (*)(char *, uint64_t))&v114[*(int *)(v93 + 48)];
    uint64_t v408 = *(void *)(v384 + v363);
    v409 = v126;
    v396 = (void (*)(uint64_t, uint64_t))TaskDefinition.name.getter(v125);
    unint64_t v128 = v127;
    uint64_t v129 = v367;
    v404 = *(void (**)(_BYTE *, void, uint64_t))(v367 + 104);
    uint64_t v130 = (uint64_t)v398;
    v404(v398, v362, v412);
    uint64_t v131 = v368;
    v405 = *(void (**)(_BYTE *, void, uint64_t))(v368 + 104);
    uint64_t v132 = (uint64_t)v399;
    uint64_t v133 = v400;
    v405(v399, v410, v400);
    uint64_t v134 = v393;
    v406 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v393 + 16);
    uint64_t v135 = (uint64_t)v401;
    uint64_t v136 = v124;
    uint64_t v137 = v397;
    v406(v401, v136, v397);
    v407 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v134 + 56);
    v407(v135, 0LL, 1LL, v137);
    sub_1000146D4((uint64_t)v396, v128, v130, v132, v135);
    swift_bridgeObjectRelease(v128);
    sub_10000C7CC(v135, &qword_100059638);
    uint64_t v138 = *(void (**)(uint64_t, uint64_t))(v131 + 8);
    v138(v132, v133);
    uint64_t v139 = *(double (**)(uint64_t, uint64_t))(v129 + 8);
    uint64_t v140 = v412;
    v141.n128_f64[0] = v139(v130, v412);
    uint64_t v142 = TaskDefinition.name.getter(v141);
    unint64_t v144 = v143;
    v404((_BYTE *)v130, v361, v140);
    v405((_BYTE *)v132, v410, v133);
    v406((_BYTE *)v135, v411, v137);
    v407(v135, 0LL, 1LL, v137);
    sub_1000146D4(v142, v144, v130, v132, v135);
    swift_bridgeObjectRelease(v144);
    sub_10000C7CC(v135, &qword_100059638);
    uint64_t v145 = v132;
    uint64_t v146 = v409;
    v395 = v138;
    v138(v145, v133);
    v396 = (void (*)(uint64_t, uint64_t))v139;
    v139(v130, v140);
    uint64_t v147 = v378;
    uint64_t v148 = v394;
    uint64_t v149 = v379;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v378 + 56))(v394, 1LL, 1LL, v379);
    int64_t v150 = v369;
    uint64_t v151 = v402;
    sub_1000242D4(v146, v369);
    if (v151)
    {
      swift_bridgeObjectRelease(v381);
      uint64_t v152 = v356;
      sub_10003EF84((uint64_t)v413, (uint64_t)v356, &qword_1000592E0);
      swift_errorRetain(v151);
      uint64_t v153 = swift_errorRetain(v151);
      uint64_t v154 = (os_log_s *)Logger.logObject.getter(v153);
      os_log_type_t v155 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v154, v155))
      {
        uint64_t v156 = swift_slowAlloc(22LL, -1LL);
        v354 = (void *)swift_slowAlloc(8LL, -1LL);
        os_log_t v381 = (os_log_t)swift_slowAlloc(32LL, -1LL);
        uint64_t v419 = (uint64_t)v381;
        __n128 v157 = v353;
        *(_DWORD *)uint64_t v156 = v353.n128_u32[0];
        uint64_t v158 = TaskDefinition.name.getter(v157);
        unint64_t v160 = v159;
        uint64_t v417 = sub_10000B540(v158, v159, &v419);
        uint64_t v161 = v355;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v355, v156 + 4, v156 + 12);
        swift_bridgeObjectRelease(v160);
        sub_10000C7CC((uint64_t)v152, &qword_1000592E0);
        *(_WORD *)(v156 + 12) = 2112;
        swift_errorRetain(v151);
        uint64_t v162 = _swift_stdlib_bridgeErrorToNSError(v151);
        uint64_t v417 = v162;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v161, v156 + 14, v156 + 22);
        uint64_t v163 = v354;
        void *v354 = v162;
        swift_errorRelease(v151);
        swift_errorRelease(v151);
        _os_log_impl( (void *)&_mh_execute_header,  v154,  v155,  "Failed to register push task %s. Error: %@",  (uint8_t *)v156,  0x16u);
        uint64_t v164 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v163, 1LL, v164);
        swift_slowDealloc(v163, -1LL, -1LL);
        os_log_t v165 = v381;
        swift_arrayDestroy(v381, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v165, -1LL, -1LL);
        swift_slowDealloc(v156, -1LL, -1LL);
      }

      else
      {
        sub_10000C7CC((uint64_t)v152, &qword_1000592E0);
        swift_errorRelease(v151);
        swift_errorRelease(v151);
      }

      uint64_t v169 = v151;
      uint64_t v171 = TaskDefinition.name.getter(v170);
      unint64_t v173 = v172;
      uint64_t v174 = (uint64_t)v398;
      uint64_t v175 = v412;
      v404(v398, v358, v412);
      uint64_t v176 = (uint64_t)v399;
      uint64_t v177 = v400;
      v405(v399, v410, v400);
      uint64_t v178 = (uint64_t)v401;
      uint64_t v179 = v411;
      uint64_t v180 = v397;
      v406(v401, v411, v397);
      v407(v178, 0LL, 1LL, v180);
      sub_1000146D4(v171, v173, v174, v176, v178);
      swift_bridgeObjectRelease(v173);
      swift_errorRelease(v169);
      sub_10000C7CC(v178, &qword_100059638);
      v395(v176, v177);
      v396(v174, v175);
      sub_10000C7CC((uint64_t)v394, &qword_1000595E8);
      (*(void (**)(_BYTE *, uint64_t))(v393 + 8))(v179, v180);
      (*(void (**)(_BYTE *, uint64_t))(v385 + 8))(v391, v392);
      uint64_t v74 = v413;
      sub_10000C7CC((uint64_t)v413, &qword_1000592E0);
      uint64_t v402 = 0LL;
      goto LABEL_49;
    }

    sub_10000C7CC((uint64_t)v148, &qword_1000595E8);
    sub_10000C788((uint64_t)v150, (uint64_t)v148, &qword_1000595E8);
    uint64_t v166 = v352;
    sub_10003EF84((uint64_t)v148, (uint64_t)v352, &qword_1000595E8);
    int v167 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v147 + 48))(v166, 1LL, v149);
    uint64_t v402 = 0LL;
    if (v167 == 1)
    {
      swift_bridgeObjectRelease(v381);
      sub_10000C7CC((uint64_t)v166, &qword_1000595E8);
      uint64_t v168 = v413;
    }

    else
    {
      unint64_t v181 = v350;
      uint64_t v182 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v147 + 32))(v350, v166, v149);
      uint64_t v183 = MLHostTask.taskFolder.getter(v182);
      uint64_t v168 = v413;
      if (v184)
      {
        uint64_t v346 = v184;
        v354 = (void *)v183;
        __n128 v185 = v338;
        uint64_t v186 = sub_10003EF84((uint64_t)v413, (uint64_t)v338, &qword_1000592E0);
        uint64_t v187 = (os_log_s *)Logger.logObject.getter(v186);
        os_log_type_t v188 = static os_log_type_t.info.getter(v187);
        if (os_log_type_enabled(v187, v188))
        {
          uint64_t v189 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v190 = swift_slowAlloc(32LL, -1LL);
          uint64_t v419 = v190;
          __n128 v191 = v357;
          *(_DWORD *)uint64_t v189 = v357.n128_u32[0];
          os_log_t v331 = (os_log_t)(v189 + 4);
          uint64_t v192 = TaskDefinition.name.getter(v191);
          unint64_t v194 = v193;
          uint64_t v417 = sub_10000B540(v192, v193, &v419);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v355, v331, v189 + 12);
          swift_bridgeObjectRelease(v194);
          sub_10000C7CC((uint64_t)v185, &qword_1000592E0);
          _os_log_impl( (void *)&_mh_execute_header,  v187,  v188,  "Task %s is successfully registered via push message.",  v189,  0xCu);
          swift_arrayDestroy(v190, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v190, -1LL, -1LL);
          swift_slowDealloc(v189, -1LL, -1LL);
        }

        else
        {
          sub_10000C7CC((uint64_t)v185, &qword_1000592E0);
        }

        uint64_t v217 = TaskDefinition.name.getter(v216);
        unint64_t v219 = v218;
        uint64_t v220 = (uint64_t)v398;
        uint64_t v221 = v412;
        v404(v398, v337, v412);
        uint64_t v222 = (uint64_t)v399;
        uint64_t v223 = v400;
        v405(v399, v410, v400);
        uint64_t v224 = (uint64_t)v401;
        uint64_t v225 = v397;
        v406(v401, v411, v397);
        v407(v224, 0LL, 1LL, v225);
        sub_1000146D4(v217, v219, v220, v222, v224);
        swift_bridgeObjectRelease(v219);
        sub_10000C7CC(v224, &qword_100059638);
        v395(v222, v223);
        v396(v220, v221);
        uint64_t v226 = v347;
        v227 = v342;
        uint64_t v228 = v348;
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v347 + 56))(v342, 1LL, 1LL, v348);
        uint64_t v229 = v344;
        v230 = *(double (**)(_BYTE *, uint64_t, uint64_t))(v344 + 104);
        v231 = v343;
        uint64_t v232 = v336;
        uint64_t v233 = v345;
        v234.n128_f64[0] = v230(v343, v336, v345);
        v235 = v341;
        URL.init(filePath:directoryHint:relativeTo:)(v354, v346, v231, v227, v234);
        uint64_t v419 = 0x6574656D61726170LL;
        unint64_t v420 = 0xEF6E6F736A2E7372LL;
        v230(v231, v232, v233);
        unint64_t v236 = sub_10001E080();
        URL.appending<A>(path:directoryHint:)(&v419, v231, &type metadata for String, v236);
        (*(void (**)(_BYTE *, uint64_t))(v229 + 8))(v231, v233);
        swift_bridgeObjectRelease(v420);
        v237 = *(void **)(v226 + 8);
        ((void (*)(_BYTE *, uint64_t))v237)(v235, v228);
        v238 = v413;
        v239 = v339;
        sub_10003EF84((uint64_t)v413, (uint64_t)v339, &qword_1000592E0);
        os_log_t v240 = v381;
        uint64_t v241 = swift_bridgeObjectRetain_n(v381, 2LL);
        v242 = (os_log_s *)Logger.logObject.getter(v241);
        os_log_type_t v243 = static os_log_type_t.debug.getter();
        int v244 = v243;
        BOOL v245 = os_log_type_enabled(v242, v243);
        v354 = v237;
        if (v245)
        {
          uint64_t v246 = swift_slowAlloc(22LL, -1LL);
          uint64_t v346 = swift_slowAlloc(64LL, -1LL);
          uint64_t v419 = v346;
          __n128 v247 = v353;
          *(_DWORD *)uint64_t v246 = v353.n128_u32[0];
          LODWORD(v331) = v244;
          uint64_t v248 = TaskDefinition.name.getter(v247);
          unint64_t v250 = v249;
          uint64_t v417 = sub_10000B540(v248, v249, &v419);
          v251 = v355;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v355, v246 + 4, v246 + 12);
          swift_bridgeObjectRelease(v250);
          sub_10000C7CC((uint64_t)v239, &qword_1000592E0);
          *(_WORD *)(v246 + 12) = 2080;
          __n128 v252 = swift_bridgeObjectRetain(v240);
          uint64_t v253 = Dictionary.description.getter( v240,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String,  v252);
          unint64_t v255 = v254;
          swift_bridgeObjectRelease(v240);
          uint64_t v256 = v253;
          v238 = v413;
          uint64_t v417 = sub_10000B540(v256, v255, &v419);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v251, v246 + 14, v246 + 22);
          swift_bridgeObjectRelease_n(v240, 2LL);
          swift_bridgeObjectRelease(v255);
          _os_log_impl( (void *)&_mh_execute_header,  v242,  (os_log_type_t)v331,  "Task %s parameters %s",  (uint8_t *)v246,  0x16u);
          uint64_t v257 = v346;
          swift_arrayDestroy(v346, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v257, -1LL, -1LL);
          swift_slowDealloc(v246, -1LL, -1LL);
        }

        else
        {
          sub_10000C7CC((uint64_t)v239, &qword_1000592E0);

          swift_bridgeObjectRelease_n(v240, 2LL);
        }

        uint64_t v258 = (uint64_t)v340;
        v259 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v240);
        uint64_t v419 = 0LL;
        id v261 = [v259 dataWithJSONObject:isa options:1 error:&v419];

        id v262 = (id)v419;
        v263 = v351;
        if (v261)
        {
          uint64_t v264 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v261);
          v266 = v265;

          uint64_t v267 = v402;
          Data.write(to:options:)(v263, 0LL, v264, v266);
          if (!v267)
          {
            os_log_t v381 = v266;
            v298 = v333;
            sub_10003EF84((uint64_t)v238, (uint64_t)v333, &qword_1000592E0);
            v299 = v334;
            uint64_t v300 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v347 + 16))(v334, v263, v348);
            v301 = (os_log_s *)Logger.logObject.getter(v300);
            os_log_type_t v302 = static os_log_type_t.debug.getter();
            int v303 = v302;
            BOOL v304 = os_log_type_enabled(v301, v302);
            uint64_t v402 = 0LL;
            if (v304)
            {
              uint64_t v305 = swift_slowAlloc(22LL, -1LL);
              uint64_t v306 = swift_slowAlloc(64LL, -1LL);
              uint64_t v419 = v306;
              __n128 v307 = v353;
              *(_DWORD *)uint64_t v305 = v353.n128_u32[0];
              LODWORD(v346) = v303;
              os_log_t v331 = v301;
              uint64_t v308 = TaskDefinition.name.getter(v307);
              unint64_t v310 = v309;
              uint64_t v417 = sub_10000B540(v308, v309, &v419);
              v311 = v355;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v355, v305 + 4, v305 + 12);
              swift_bridgeObjectRelease(v310);
              sub_10000C7CC((uint64_t)v298, &qword_1000592E0);
              *(_WORD *)(v305 + 12) = 2080;
              uint64_t v312 = sub_100005038( &qword_1000595E0,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
              uint64_t v313 = v348;
              uint64_t v314 = dispatch thunk of CustomStringConvertible.description.getter(v348, v312);
              unint64_t v316 = v315;
              uint64_t v417 = sub_10000B540(v314, v315, &v419);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v311, v305 + 14, v305 + 22);
              swift_bridgeObjectRelease(v316);
              ((void (*)(_BYTE *, uint64_t))v354)(v299, v313);
              os_log_t v317 = v331;
              _os_log_impl( (void *)&_mh_execute_header,  v331,  (os_log_type_t)v346,  "Task %s parameters are stored at: %s",  (uint8_t *)v305,  0x16u);
              swift_arrayDestroy(v306, 2LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v306, -1LL, -1LL);
              swift_slowDealloc(v305, -1LL, -1LL);
            }

            else
            {
              sub_10000C7CC((uint64_t)v298, &qword_1000592E0);
              ((void (*)(_BYTE *, uint64_t))v354)(v299, v348);
            }

            uint64_t v319 = TaskDefinition.name.getter(v318);
            unint64_t v321 = v320;
            uint64_t v322 = (uint64_t)v398;
            uint64_t v323 = v412;
            v404(v398, v330, v412);
            uint64_t v324 = (uint64_t)v399;
            uint64_t v325 = v400;
            v405(v399, v410, v400);
            uint64_t v326 = (uint64_t)v401;
            v327 = v411;
            uint64_t v328 = v397;
            v406(v401, v411, v397);
            v407(v326, 0LL, 1LL, v328);
            sub_1000146D4(v319, v321, v322, v324, v326);
            swift_bridgeObjectRelease(v321);
            sub_10000C5C4(v264, (unint64_t)v381);
            sub_10000C7CC(v326, &qword_100059638);
            v395(v324, v325);
            v396(v322, v323);
            ((void (*)(_BYTE *, uint64_t))v354)(v351, v348);
            (*(void (**)(_BYTE *, uint64_t))(v378 + 8))(v350, v379);
            sub_10000C7CC((uint64_t)v394, &qword_1000595E8);
            (*(void (**)(_BYTE *, uint64_t))(v393 + 8))(v327, v328);
            goto LABEL_48;
          }

          sub_10000C5C4(v264, (unint64_t)v266);
          uint64_t v268 = v267;
        }

        else
        {
          v269 = v262;
          uint64_t v268 = _convertNSErrorToError(_:)(v262);

          swift_willThrow(v270);
        }

        sub_10003EF84((uint64_t)v238, v258, &qword_1000592E0);
        swift_errorRetain(v268);
        uint64_t v271 = swift_errorRetain(v268);
        v272 = (os_log_s *)Logger.logObject.getter(v271);
        os_log_type_t v273 = static os_log_type_t.error.getter();
        BOOL v274 = os_log_type_enabled(v272, v273);
        uint64_t v402 = 0LL;
        if (v274)
        {
          uint64_t v275 = swift_slowAlloc(22LL, -1LL);
          v276 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
          uint64_t v277 = swift_slowAlloc(32LL, -1LL);
          uint64_t v419 = v277;
          __n128 v278 = v353;
          *(_DWORD *)uint64_t v275 = v353.n128_u32[0];
          os_log_t v381 = v272;
          uint64_t v279 = TaskDefinition.name.getter(v278);
          unint64_t v281 = v280;
          uint64_t v417 = sub_10000B540(v279, v280, &v419);
          v282 = v355;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v355, v275 + 4, v275 + 12);
          swift_bridgeObjectRelease(v281);
          sub_10000C7CC(v258, &qword_1000592E0);
          *(_WORD *)(v275 + 12) = 2112;
          swift_errorRetain(v268);
          uint64_t v283 = _swift_stdlib_bridgeErrorToNSError(v268);
          uint64_t v417 = v283;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v282, v275 + 14, v275 + 22);
          uint64_t *v276 = v283;
          swift_errorRelease(v268);
          uint64_t v284 = v268;
          swift_errorRelease(v268);
          os_log_t v285 = v381;
          _os_log_impl( (void *)&_mh_execute_header,  v381,  v273,  "Failed at storing parameters for pushed task %s, with error: %@",  (uint8_t *)v275,  0x16u);
          uint64_t v286 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v276, 1LL, v286);
          swift_slowDealloc(v276, -1LL, -1LL);
          swift_arrayDestroy(v277, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v277, -1LL, -1LL);
          swift_slowDealloc(v275, -1LL, -1LL);
        }

        else
        {
          sub_10000C7CC(v258, &qword_1000592E0);
          swift_errorRelease(v268);
          uint64_t v284 = v268;
          swift_errorRelease(v268);
        }

        uint64_t v288 = TaskDefinition.name.getter(v287);
        unint64_t v290 = v289;
        uint64_t v291 = (uint64_t)v398;
        uint64_t v292 = v412;
        v404(v398, v335, v412);
        uint64_t v293 = (uint64_t)v399;
        uint64_t v294 = v400;
        v405(v399, v410, v400);
        uint64_t v295 = (uint64_t)v401;
        v296 = v411;
        uint64_t v297 = v397;
        v406(v401, v411, v397);
        v407(v295, 0LL, 1LL, v297);
        sub_1000146D4(v288, v290, v291, v293, v295);
        swift_bridgeObjectRelease(v290);
        swift_errorRelease(v284);
        sub_10000C7CC(v295, &qword_100059638);
        v395(v293, v294);
        v396(v291, v292);
        ((void (*)(_BYTE *, uint64_t))v354)(v351, v348);
        (*(void (**)(_BYTE *, uint64_t))(v378 + 8))(v350, v379);
        sub_10000C7CC((uint64_t)v394, &qword_1000595E8);
        (*(void (**)(_BYTE *, uint64_t))(v393 + 8))(v296, v297);
LABEL_48:
        (*(void (**)(_BYTE *, uint64_t))(v385 + 8))(v391, v392);
        uint64_t v74 = v413;
        sub_10000C7CC((uint64_t)v413, &qword_1000592E0);
LABEL_49:
        uint64_t v73 = (uint64_t)v380;
        goto LABEL_9;
      }

      (*(void (**)(_BYTE *, uint64_t))(v147 + 8))(v181, v149);
      swift_bridgeObjectRelease(v381);
    }

    uint64_t v195 = v349;
    uint64_t v196 = sub_10003EF84((uint64_t)v168, (uint64_t)v349, &qword_1000592E0);
    unint64_t v197 = (os_log_s *)Logger.logObject.getter(v196);
    os_log_type_t v198 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v197, v198))
    {
      uint64_t v199 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v200 = swift_slowAlloc(32LL, -1LL);
      uint64_t v419 = v200;
      __n128 v201 = v357;
      *(_DWORD *)uint64_t v199 = v357.n128_u32[0];
      uint64_t v202 = TaskDefinition.name.getter(v201);
      unint64_t v204 = v203;
      uint64_t v417 = sub_10000B540(v202, v203, &v419);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v417, v355, v199 + 4, v199 + 12);
      swift_bridgeObjectRelease(v204);
      sub_10000C7CC((uint64_t)v195, &qword_1000592E0);
      _os_log_impl( (void *)&_mh_execute_header,  v197,  v198,  "Failed to fetch task folder for pushed task %s. Skipping task.",  v199,  0xCu);
      swift_arrayDestroy(v200, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v200, -1LL, -1LL);
      swift_slowDealloc(v199, -1LL, -1LL);
    }

    else
    {
      sub_10000C7CC((uint64_t)v195, &qword_1000592E0);
    }

    uint64_t v206 = TaskDefinition.name.getter(v205);
    unint64_t v208 = v207;
    uint64_t v209 = (uint64_t)v398;
    uint64_t v210 = v412;
    v404(v398, v358, v412);
    uint64_t v211 = (uint64_t)v399;
    uint64_t v212 = v400;
    v405(v399, v410, v400);
    uint64_t v213 = (uint64_t)v401;
    v214 = v411;
    uint64_t v215 = v397;
    v406(v401, v411, v397);
    v407(v213, 0LL, 1LL, v215);
    sub_1000146D4(v206, v208, v209, v211, v213);
    swift_bridgeObjectRelease(v208);
    sub_10000C7CC(v213, &qword_100059638);
    v395(v211, v212);
    v396(v209, v210);
    sub_10000C7CC((uint64_t)v394, &qword_1000595E8);
    (*(void (**)(_BYTE *, uint64_t))(v393 + 8))(v214, v215);
    goto LABEL_48;
  }

id sub_10002A948(void *a1, uint64_t a2)
{
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_10000C538(v4, (uint64_t)qword_10005A7E0);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter(v6);
  uint64_t v8 = (void *)&Duration.description.getter;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v18 = sub_10000B540(0xD00000000000001DLL, 0x800000010004A410LL, aBlock);
    uint64_t v8 = &Duration.description.getter;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, aBlock, v9 + 4, v9 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Daemon performing %s activity.", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  aBlock[4] = (uint64_t)nullsub_1;
  uint64_t aBlock[5] = 0LL;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100020B64;
  aBlock[3] = (uint64_t)&unk_100055E90;
  uint64_t v11 = _Block_copy(aBlock);
  [a1 setExpirationHandler:v11];
  _Block_release(v11);
  if (*(_BYTE *)(a2 + 16) == 1) {
    uint64_t v12 = sub_1000105C0();
  }
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.info.getter(v13);
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v16;
    *(_DWORD *)uint64_t v15 = v8[403];
    uint64_t v18 = sub_10000B540(0xD00000000000001DLL, 0x800000010004A410LL, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, aBlock, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Daemon completed %s activity.", v15, 0xCu);
    swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  return [a1 setTaskCompleted];
}

void sub_10002AC58(void *a1, uint64_t a2)
{
  uint64_t v98 = type metadata accessor for CoreAnalyticsEvents(0LL);
  uint64_t v4 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  uint64_t v6 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Calendar(0LL);
  uint64_t v104 = *(void *)(v7 - 8);
  uint64_t v105 = v7;
  __chkstk_darwin(v7);
  char v103 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v108 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  id v101 = (char *)&v95 - v14;
  __chkstk_darwin(v13);
  os_log_type_t v110 = (char *)&v95 - v15;
  uint64_t v122 = nullsub_1;
  uint64_t v123 = 0LL;
  aBos_unfair_lock_t lock = _NSConcreteStackBlock;
  uint64_t v119 = 1107296256LL;
  uint64_t v120 = sub_100020B64;
  uint64_t v121 = &unk_100055E18;
  uint64_t v16 = _Block_copy(&aBlock);
  uint64_t v17 = a1;
  [a1 setExpirationHandler:v16];
  _Block_release(v16);
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_10000C538(v18, (uint64_t)qword_10005A7E0);
  uint64_t v20 = swift_retain(a2);
  uint64_t v112 = v19;
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.info.getter(v21);
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v24 = &unk_100059000;
  id v99 = v17;
  uint64_t v106 = v9;
  unint64_t v96 = v6;
  uint64_t v97 = v4;
  uint64_t v102 = v10;
  if (v23)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v25 = 134217984;
    uint64_t v26 = *(void *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    uint64_t v27 = (os_unfair_lock_s *)(*(void *)(v26 + 56) + 16LL);
    os_unfair_lock_lock(v27);
    swift_beginAccess(v26 + 64, &v113, 0LL, 0LL);
    uint64_t v28 = *(void ***)(*(void *)(v26 + 64) + 16LL);
    os_unfair_lock_unlock(v27);
    aBos_unfair_lock_t lock = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v119, v25 + 4, v25 + 12);
    swift_release(a2);
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "MLHostDaemon: TaskRegistry has %ld tasks before pruning.",  v25,  0xCu);
    swift_slowDealloc(v25, -1LL, -1LL);

    uint64_t v24 = (void *)&unk_100059000;
  }

  else
  {

    swift_release(a2);
  }

  uint64_t v29 = v24[217];
  uint64_t v100 = a2;
  uint64_t v109 = *(void *)(a2 + v29);
  uint64_t v107 = sub_100011658();
  uint64_t v31 = v107[2];
  if (v31)
  {
    uint64_t v32 = v107 + 5;
    *(void *)&__int128 v30 = 136315138LL;
    __int128 v111 = v30;
    do
    {
      uint64_t v34 = *(v32 - 1);
      unint64_t v33 = *v32;
      uint64_t v35 = swift_bridgeObjectRetain_n(*v32, 3LL);
      uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
      os_log_type_t v37 = static os_log_type_t.info.getter(v36);
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = swift_slowAlloc(12LL, -1LL);
        uint64_t v39 = (void **)swift_slowAlloc(32LL, -1LL);
        aBos_unfair_lock_t lock = v39;
        *(_DWORD *)uint64_t v38 = v111;
        swift_bridgeObjectRetain(v33);
        *(void *)(v38 + 4) = sub_10000B540(v34, v33, (uint64_t *)&aBlock);
        swift_bridgeObjectRelease_n(v33, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "Unregistering task %s because it was pruned.",  (uint8_t *)v38,  0xCu);
        swift_arrayDestroy(v39, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v39, -1LL, -1LL);
        swift_slowDealloc(v38, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v33, 2LL);
      }

      v32 += 2;
      sub_10003E138(v34, v33);
      swift_bridgeObjectRelease(v33);
      --v31;
    }

    while (v31);
  }

  swift_bridgeObjectRelease(v107);
  uint64_t v40 = v100;
  uint64_t v41 = swift_retain(v100);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
  os_log_type_t v43 = static os_log_type_t.info.getter(v42);
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v44 = 134217984;
    uint64_t v45 = v109;
    uint64_t v46 = (os_unfair_lock_s *)(*(void *)(v109 + 56) + 16LL);
    os_unfair_lock_lock(v46);
    swift_beginAccess(v45 + 64, &v114, 0LL, 0LL);
    uint64_t v47 = *(void ***)(*(void *)(v45 + 64) + 16LL);
    os_unfair_lock_unlock(v46);
    aBos_unfair_lock_t lock = v47;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v119, v44 + 4, v44 + 12);
    swift_release(v40);
    _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "MLHostDaemon: TaskRegistry has %ld tasks after pruning.",  v44,  0xCu);
    swift_slowDealloc(v44, -1LL, -1LL);

    uint64_t v48 = v103;
  }

  else
  {

    swift_release(v40);
    uint64_t v48 = v103;
    uint64_t v45 = v109;
  }

  uint64_t v49 = (os_unfair_lock_s *)(*(void *)(v45 + 56) + 16LL);
  os_unfair_lock_lock(v49);
  swift_beginAccess(v45 + 64, v117, 0LL, 0LL);
  uint64_t v50 = *(void *)(v45 + 64);
  swift_bridgeObjectRetain(v50);
  uint64_t v52 = sub_10002EA7C(v51);
  swift_bridgeObjectRelease(v50);
  os_unfair_lock_unlock(v49);
  uint64_t v53 = sub_10002EF58((uint64_t)v52);
  swift_release(v52);
  swift_bridgeObjectRetain(v53);
  uint64_t v54 = sub_10001D3EC(v45, v53);
  swift_bridgeObjectRelease_n(v53, 2LL);
  swift_bridgeObjectRetain(v54);
  uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
  os_log_type_t v57 = static os_log_type_t.info.getter(v56);
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v59 = (void **)swift_slowAlloc(32LL, -1LL);
    aBos_unfair_lock_t lock = v59;
    *(_DWORD *)uint64_t v58 = 136315138;
    *(void *)&__int128 v111 = v58 + 4;
    swift_bridgeObjectRetain(v54);
    uint64_t v61 = Array.description.getter(v60, &type metadata for String);
    unint64_t v63 = v62;
    swift_bridgeObjectRelease(v54);
    uint64_t v115 = sub_10000B540(v61, v63, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, v116, v111, v58 + 12);
    swift_bridgeObjectRelease_n(v54, 2LL);
    swift_bridgeObjectRelease(v63);
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "MLHostDaemon: pruned orphaned taskFolders: %s", v58, 0xCu);
    swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v59, -1LL, -1LL);
    swift_slowDealloc(v58, -1LL, -1LL);
  }

  else
  {

    uint64_t v64 = swift_bridgeObjectRelease_n(v54, 2LL);
  }

  uint64_t v65 = v105;
  uint64_t v66 = v106;
  uint64_t v67 = v104;
  BOOL v68 = (os_log_s *)Logger.logObject.getter(v64);
  os_log_type_t v69 = static os_log_type_t.info.getter(v68);
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v70 = 0;
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "MLHostDaemon: sending device telemetry", v70, 2u);
    swift_slowDealloc(v70, -1LL, -1LL);
  }

  uint64_t v71 = static Calendar.current.getter();
  __n128 v72 = v101;
  static Date.now.getter(v71);
  uint64_t v73 = v110;
  Calendar.startOfDay(for:)(v72);
  uint64_t v74 = v102;
  uint64_t v75 = *(void (**)(char *, uint64_t))(v102 + 8);
  v75(v72, v66);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v65);
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v72, v73, v66);
  Date.init(timeInterval:since:)(v72, -86400.0);
  uint64_t v76 = sub_10000B4F4(&qword_1000597C8);
  uint64_t inited = swift_initStackObject(v76, v116);
  *(_OWORD *)(inited + 16) = xmmword_100040DB0;
  *(void *)(inited + 32) = 0x49747865746E6F63LL;
  *(void *)(inited + 40) = 0xE900000000000064LL;
  sub_10000C654(0LL, &qword_1000597D0, &OBJC_CLASS___NSString_ptr);
  *(void *)(inited + 48) = NSString.init(stringLiteral:)("DAEMON", 6LL, 2LL);
  *(void *)(inited + 56) = 0x756F43736B736174LL;
  *(void *)(inited + 64) = 0xEA0000000000746ELL;
  uint64_t v78 = (os_unfair_lock_s *)(*(void *)(v109 + 56) + 16LL);
  os_unfair_lock_lock(v78);
  os_unfair_lock_unlock(v78);
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0x6E7552736B736174LL;
  *(void *)(inited + 88) = 0xE800000000000000LL;
  sub_10000C654(0LL, &qword_100059628, &OBJC_CLASS___NSNumber_ptr);
  *(NSNumber *)(inited + 96) = NSNumber.init(integerLiteral:)(-1LL);
  strcpy((char *)(inited + 104), "tasksDeferred");
  *(_WORD *)(inited + 118) = -4864;
  *(NSNumber *)(inited + 120) = NSNumber.init(integerLiteral:)(-1LL);
  *(void *)(inited + 128) = 0x696146736B736174LL;
  *(void *)(inited + 136) = 0xEB0000000064656CLL;
  *(NSNumber *)(inited + 144) = NSNumber.init(integerLiteral:)(-1LL);
  strcpy((char *)(inited + 152), "tasksCompleted");
  *(_BYTE *)(inited + 167) = -18;
  *(NSNumber *)(inited + 168) = NSNumber.init(integerLiteral:)(-1LL);
  *(void *)(inited + 176) = 0x745374656B637562LL;
  *(void *)(inited + 184) = 0xEB00000000747261LL;
  double v79 = Date.timeIntervalSince1970.getter();
  if ((~*(void *)&v79 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_30;
  }

  if (v79 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  if (v79 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  id v80 = [objc_allocWithZone(NSNumber) initWithLongLong:(uint64_t)v79];
  id v81 = [v80 stringValue];

  if (!v81)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  *(void *)(inited + 192) = v81;
  *(void *)(inited + 200) = 0x6E4574656B637562LL;
  *(void *)(inited + 208) = 0xE900000000000064LL;
  double v82 = Date.timeIntervalSince1970.getter();
  if ((~*(void *)&v82 & 0x7FF0000000000000LL) == 0) {
    goto LABEL_32;
  }
  if (v82 <= -9.22337204e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  if (v82 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  id v83 = [objc_allocWithZone(NSNumber) initWithLongLong:(uint64_t)v82];
  id v84 = [v83 stringValue];

  if (v84)
  {
    *(void *)(inited + 216) = v84;
    unint64_t v85 = sub_10001F2B0(inited);
    uint64_t v87 = v96;
    uint64_t v86 = v97;
    uint64_t v88 = v98;
    uint64_t v89 = (*(uint64_t (**)(char *, void, uint64_t))(v97 + 104))( v96,  enum case for CoreAnalyticsEvents.deviceStatusTelemetry(_:),  v98);
    CoreAnalyticsEvents.rawValue.getter(v89);
    uint64_t v91 = v90;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v87, v88);
    NSString v92 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v91);
    uint64_t v93 = swift_allocObject(&unk_100055E50, 24LL, 7LL);
    *(void *)(v93 + 16) = v85;
    uint64_t v122 = sub_10003E664;
    uint64_t v123 = v93;
    aBos_unfair_lock_t lock = _NSConcreteStackBlock;
    uint64_t v119 = 1107296256LL;
    uint64_t v120 = sub_10002B854;
    uint64_t v121 = &unk_100055E68;
    __n128 v94 = _Block_copy(&aBlock);
    swift_release(v123);
    AnalyticsSendEventLazy(v92, v94);
    _Block_release(v94);

    [v99 setTaskCompleted];
    v75(v108, v66);
    v75(v110, v66);
    return;
  }

LABEL_36:
  __break(1u);
}

  swift_release(v11);
  uint64_t v6 = v44;
  if ((v47 & 1) != 0)
  {
    uint64_t v42 = 1LL << *(_BYTE *)(v11 + 32);
    if (v42 >= 64) {
      bzero(v46, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
    }
    else {
      *uint64_t v46 = -1LL << v42;
    }
    *(void *)(v11 + 16) = 0LL;
  }

Class sub_10002B854(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10000C654(0LL, &qword_1000597D8, &OBJC_CLASS___NSObject_ptr);
    v5.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.Class isa = 0LL;
  }

  return v5.super.isa;
}

uint64_t sub_10002B8D8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  uint64_t v2 = type metadata accessor for MLHostConfig(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry));
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry));
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry));
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10002B970()
{
  return type metadata accessor for MLHostDaemon(0LL);
}

uint64_t type metadata accessor for MLHostDaemon(uint64_t a1)
{
  uint64_t result = qword_100059708;
  if (!qword_100059708) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MLHostDaemon);
  }
  return result;
}

uint64_t sub_10002B9B4(uint64_t a1)
{
  v4[0] = &unk_100040DF8;
  v4[1] = &unk_100040E10;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for MLHostConfig(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[7] = (char *)&value witness table for Builtin.NativeObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t *sub_10002BA54(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10002BA94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002BAA4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10002BAAC(uint64_t a1)
{
  return sub_100024A9C(a1, v1);
}

void sub_10002BAB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10002BAD8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002BAFC(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void, void))(v5 + 16))( *a1,  a1[1],  *a2,  a2[1],  *a3,  a3[1],  *a4,  a4[1],  *a5);
}

uint64_t sub_10002BB50(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10002BBB4;
  return v6(a1);
}

uint64_t sub_10002BBB4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_10002BC00(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10002BD14(a1, a2, v5);
}

unint64_t sub_10002BC64(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_10002BDF4(a1, v7);
}

unint64_t sub_10002BCE4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10002BF68(a1, v4);
}

unint64_t sub_10002BD14(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10002BDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

unint64_t sub_10002BF68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_10003EFC8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000C698((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_10002C02C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    BOOL v12 = (void *)(v11 + 16 * v10);
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
  *uint64_t v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_10002DDFC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *uint64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_10002C1D8(Swift::Int *a1, void *a2)
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
      uint64_t v10 = sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
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

    Swift::Int v24 = sub_10002D610(v7, result + 1);
    Swift::Int v33 = v24;
    unint64_t v25 = *(void *)(v24 + 16);
    if (*(void *)(v24 + 24) <= v25)
    {
      uint64_t v30 = v25 + 1;
      id v31 = v8;
      sub_10002DAE0(v30);
      uint64_t v26 = v33;
    }

    else
    {
      uint64_t v26 = v24;
      id v27 = v8;
    }

    sub_10002DD7C((uint64_t)v8, v26);
    uint64_t v29 = *v3;
    *uint64_t v3 = v26;
  }

  else
  {
    Swift::Int v13 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v14 = NSObject._rawHashValue(seed:)(v13);
    uint64_t v15 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v16 = v14 & ~v15;
    if (((*(void *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
    {
      sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
      id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
      char v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        char v22 = *(void **)(*(void *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        id v23 = v22;
        return 0LL;
      }

      uint64_t v19 = ~v15;
      while (1)
      {
        unint64_t v16 = (v16 + 1) & v19;
        if (((*(void *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
        char v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v33 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_10002DF94((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    *uint64_t v3 = v33;
  }

  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_10002C474(uint64_t a1, uint64_t a2)
{
  return sub_10002CE08(a1, a2, &qword_100059690);
}

Swift::Int sub_10002C480(uint64_t a1, uint64_t a2)
{
  return sub_10002C494( a1,  a2,  (uint64_t (*)(void))&type metadata accessor for TaskDefinition,  &qword_100059678);
}

Swift::Int sub_10002C494(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v6 = v4;
  uint64_t v49 = a3(0LL);
  uint64_t v9 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v43 - v10;
  uint64_t v11 = *v6;
  if (*(void *)(*v6 + 24) > a1) {
    a1 = *(void *)(*v6 + 24);
  }
  sub_10000B4F4(a4);
  int v47 = a2;
  uint64_t v12 = static _DictionaryStorage.resize(original:capacity:move:)(v11, a1, a2);
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v44 = v6;
  uint64_t v14 = 1LL << *(_BYTE *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1LL << v14);
  }
  else {
    uint64_t v16 = -1LL;
  }
  unint64_t v17 = v16 & v15;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v12 + 64;
  Swift::Int result = swift_retain(v11);
  int64_t v20 = 0LL;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_24;
    }

    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v25 >= v45) {
      goto LABEL_36;
    }
    unint64_t v26 = v46[v25];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_36;
      }
      unint64_t v26 = v46[v20];
      if (!v26) {
        break;
      }
    }

LABEL_41:
  Swift::Int result = swift_release(v11);
  *uint64_t v6 = v13;
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

Swift::Int sub_10002C7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000B4F4(&qword_100059618);
  char v7 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v9 = v8;
  if (*(void *)(v5 + 16))
  {
    unint64_t v36 = v3;
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    char v38 = (void *)(v5 + 64);
    if (v10 < 64) {
      uint64_t v11 = ~(-1LL << v10);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = v8 + 64;
    Swift::Int result = swift_retain(v5);
    int64_t v15 = 0LL;
    while (1)
    {
      if (v12)
      {
        unint64_t v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v23 = v22 | (v15 << 6);
      }

      else
      {
        int64_t v24 = v15 + 1;
        if (__OFADD__(v15, 1LL))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }

        if (v24 >= v37) {
          goto LABEL_36;
        }
        unint64_t v25 = v38[v24];
        ++v15;
        if (!v25)
        {
          int64_t v15 = v24 + 1;
          if (v24 + 1 >= v37) {
            goto LABEL_36;
          }
          unint64_t v25 = v38[v15];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v37)
            {
LABEL_36:
              swift_release(v5);
              uint64_t v3 = v36;
              if ((v7 & 1) != 0)
              {
                uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
                if (v35 >= 64) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *char v38 = -1LL << v35;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v25 = v38[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v15 = v26 + 1;
                if (__OFADD__(v26, 1LL)) {
                  goto LABEL_43;
                }
                if (v15 >= v37) {
                  goto LABEL_36;
                }
                unint64_t v25 = v38[v15];
                ++v26;
                if (v25) {
                  goto LABEL_33;
                }
              }
            }

            int64_t v15 = v26;
          }
        }

LABEL_33:
        unint64_t v12 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }

      uint64_t v31 = 16 * v23;
      uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
      uint64_t v34 = *v32;
      uint64_t v33 = v32[1];
      __int128 v39 = *(_OWORD *)(*(void *)(v5 + 56) + v31);
      if ((v7 & 1) == 0)
      {
        swift_bridgeObjectRetain(v33);
        swift_retain(*((void *)&v39 + 1));
      }

      Hasher.init(_seed:)(v40, *(void *)(v9 + 40));
      String.hash(into:)(v40, v34, v33);
      Swift::Int result = Hasher._finalize()();
      uint64_t v16 = -1LL << *(_BYTE *)(v9 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }

          BOOL v29 = v18 == v28;
          if (v18 == v28) {
            unint64_t v18 = 0LL;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v13 + 8 * v18);
        }

        while (v30 == -1);
        unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }

      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
      uint64_t v20 = 16 * v19;
      unint64_t v21 = (void *)(*(void *)(v9 + 48) + v20);
      void *v21 = v34;
      v21[1] = v33;
      *(_OWORD *)(*(void *)(v9 + 56) + v20) = v39;
      ++*(void *)(v9 + 16);
    }
  }

  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v9;
  return result;
}

    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    uint64_t v31 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v22);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    uint64_t v34 = *(void *)(*(void *)(v6 + 56) + 8 * v22);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain(v31[1]);
      swift_bridgeObjectRetain(v34);
    }

    Hasher.init(_seed:)(v39, *(void *)(v9 + 40));
    String.hash(into:)(v39, v33, v32);
    Swift::Int result = Hasher._finalize()();
    uint64_t v16 = -1LL << *(_BYTE *)(v9 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }

      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }

    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t v20 = (void *)(*(void *)(v9 + 48) + 16 * v19);
    _BYTE *v20 = v33;
    v20[1] = v32;
    *(void *)(*(void *)(v9 + 56) + 8 * v19) = v34;
    ++*(void *)(v9 + 16);
  }

  swift_release(v6);
  int64_t v24 = (void *)(v6 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v35 = 1LL << *(_BYTE *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v24 = -1LL << v35;
  }
  *(void *)(v6 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v6);
  *unint64_t v4 = v9;
  return result;
}

uint64_t sub_10002CB00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000B4F4(&qword_100059688);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    unint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              uint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *unint64_t v36 = -1LL << v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

Swift::Int sub_10002CDFC(uint64_t a1, uint64_t a2)
{
  return sub_10002CE08(a1, a2, &qword_100059660);
}

Swift::Int sub_10002CE08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  if (*(void *)(*v3 + 24) <= a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(void *)(*v3 + 24);
  }
  sub_10000B4F4(a3);
  char v38 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)(v6, v7, a2);
  uint64_t v9 = v8;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_43;
  }
  uint64_t v10 = 1LL << *(_BYTE *)(v6 + 32);
  uint64_t v37 = v6 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  else {
    uint64_t v11 = -1LL;
  }
  unint64_t v12 = v11 & *(void *)(v6 + 64);
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v8 + 64;
  Swift::Int result = swift_retain(v6);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v12)
    {
      unint64_t v21 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }

    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v23 >= v36) {
      break;
    }
    uint64_t v24 = (void *)(v6 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v36) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v36)
        {
LABEL_36:
          swift_release(v6);
          if ((v38 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1LL)) {
              goto LABEL_45;
            }
            if (v15 >= v36) {
              goto LABEL_36;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_33;
            }
          }
        }

        int64_t v15 = v26;
      }
    }

void sub_10002D118(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10002BC00(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = v18[7];
        uint64_t v20 = type metadata accessor for MLHostTask(0LL);
        (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40LL))( v19 + *(void *)(*(void *)(v20 - 8) + 72LL) * v12,  a1,  v20);
        return;
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001A990();
      goto LABEL_7;
    }

    sub_10002C494(v15, a4 & 1, (uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000595F0);
    unint64_t v21 = sub_10002BC00(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10002D518(v12, a2, a3, a1, v18);
      swift_bridgeObjectRetain(a3);
      return;
    }
  }

  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

void sub_10002D264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10002BC00(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10001AC00();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      swift_release(v21[1]);
      void *v21 = a1;
      v21[1] = a2;
      return;
    }

LABEL_11:
    v20[(v14 >> 6) + 8] |= 1LL << v14;
    uint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
    uint64_t *v24 = a3;
    v24[1] = a4;
    unint64_t v25 = (void *)(v20[7] + 16 * v14);
    *unint64_t v25 = a1;
    v25[1] = a2;
    uint64_t v26 = v20[2];
    BOOL v27 = __OFADD__(v26, 1LL);
    uint64_t v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      swift_bridgeObjectRetain(a4);
      return;
    }

    goto LABEL_14;
  }

  sub_10002C7F8(v17, a5 & 1);
  unint64_t v22 = sub_10002BC00(a3, a4);
  if ((v18 & 1) == (v23 & 1))
  {
    unint64_t v14 = v22;
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_10002D3D8(void *a1)
{
  return sub_10002A948(a1, v1);
}

void sub_10002D3E0(void *a1)
{
}

void sub_10002D3E8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10002BC00(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      char v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = (void *)(v18[7] + 32 * v12);
        sub_10000C550(v19);
        sub_10000C6CC(a1, v19);
        return;
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001ADC0();
      goto LABEL_7;
    }

    sub_10002CB00(v15, a4 & 1);
    unint64_t v20 = sub_10002BC00(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      unint64_t v12 = v20;
      char v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10002D5A8(v12, a2, a3, a1, v18);
      swift_bridgeObjectRetain(a3);
      return;
    }
  }

  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

uint64_t sub_10002D518(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for MLHostTask(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))( v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * a1,  a4,  v10);
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

_OWORD *sub_10002D5A8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000C6CC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

Swift::Int sub_10002D610(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000B4F4(&qword_100059840);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_10002DAE0(v16 + 1);
          uint64_t v4 = v23;
        }

        uint64_t v9 = v22;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v11 = v4 + 56;
        uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v13 = result & ~v12;
        unint64_t v14 = v13 >> 6;
        if (((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          unint64_t v15 = __clz(__rbit64((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v17 = 0;
          unint64_t v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v19 = v14 == v18;
            if (v14 == v18) {
              unint64_t v14 = 0LL;
            }
            v17 |= v19;
            uint64_t v20 = *(void *)(v11 + 8 * v14);
          }

          while (v20 == -1);
          unint64_t v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }

        *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
        *(void *)(*(void *)(v4 + 48) + 8 * v15) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()();
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v4;
}

Swift::Int sub_10002D804(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000B4F4(&qword_1000597E8);
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
                  void *v33 = -1LL << v31;
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

Swift::Int sub_10002DAE0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000B4F4(&qword_100059840);
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
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }

      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_36;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_36;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v30;
                uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
                if (v29 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v29;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v14 >= v11) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v14 = v20;
            }
          }
        }

unint64_t sub_10002DD7C(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_10002DDFC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_10002D804(v11);
  }

  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_10002E118();
      goto LABEL_22;
    }

    sub_10002E470(v11);
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
    unint64_t v16 = (void *)(v15 + 16 * a3);
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
        int64_t v20 = (void *)(v15 + 16 * a3);
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

void sub_10002DF94(uint64_t a1, unint64_t a2, char a3)
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
    sub_10002DAE0(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_10002E2C8();
      goto LABEL_14;
    }

    sub_10002E71C(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
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

LABEL_14:
  uint64_t v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * a2) = a1;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1LL);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v22;
  }
}

void *sub_10002E118()
{
  uint64_t v1 = v0;
  sub_10000B4F4(&qword_1000597E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 56);
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

id sub_10002E2C8()
{
  uint64_t v1 = v0;
  sub_10000B4F4(&qword_100059840);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
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

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }

Swift::Int sub_10002E470(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000B4F4(&qword_1000597E8);
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

  __break(1u);
  return result;
}

Swift::Int sub_10002E71C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000B4F4(&qword_100059840);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
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
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }

void *sub_10002E994(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_10000B4F4(&qword_100059290);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_10002EB60((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10000C608(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

void *sub_10002EA7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_10000B4F4(&qword_100059290);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_10002ED5C((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10000C608(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

uint64_t sub_10002EB60(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  int64_t v5 = (void *)result;
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
    *int64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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

  int64_t v11 = a2;
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
    int64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
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

uint64_t sub_10002ED5C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  int64_t v5 = (void *)result;
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
    *int64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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

  int64_t v11 = a2;
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
    int64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
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

uint64_t sub_10002EF58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_10002C02C(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

uint64_t sub_10002EFEC(void *a1)
{
  uint64_t v176 = type metadata accessor for MLHostTask(0LL);
  uint64_t v174 = *(void *)(v176 - 8);
  uint64_t v2 = __chkstk_darwin(v176);
  uint64_t v169 = (char *)&v163 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v173 = (char *)&v163 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v163 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v172 = (char *)&v163 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v171 = (char *)&v163 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  __n128 v170 = (char *)&v163 - v14;
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v163 - v15;
  uint64_t v17 = type metadata accessor for TaskRequest(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  int64_t v20 = (char *)&v163 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for TaskDefinition(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  unint64_t v25 = (char *)&v163 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = MLHostTask.taskDefinition.getter(v23);
  TaskDefinition.taskRequest.getter(v26);
  uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  uint64_t v175 = a1;
  uint64_t v28 = MLHostTask.name.getter(v27);
  uint64_t v30 = v29;
  id v31 = (id)TaskRequest.getSystemTaskRequest(identifier:)(v28);
  swift_bridgeObjectRelease(v30);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v31)
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v34 = type metadata accessor for Logger(0LL);
    sub_10000C538(v34, (uint64_t)qword_10005A7E0);
    uint64_t v35 = v174;
    uint64_t v36 = v176;
    uint64_t v37 = (*(uint64_t (**)(char *, void *, uint64_t))(v174 + 16))(v8, v175, v176);
    char v38 = (os_log_s *)Logger.logObject.getter(v37);
    os_log_type_t v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      BOOL v40 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v41 = (void *)swift_slowAlloc(32LL, -1LL);
      id v182 = v41;
      *(_DWORD *)BOOL v40 = 136315138;
      uint64_t v42 = sub_100005038( &qword_1000597F8,  (uint64_t (*)(uint64_t))&type metadata accessor for MLHostTask,  (uint64_t)&protocol conformance descriptor for MLHostTask);
      uint64_t v43 = dispatch thunk of CustomStringConvertible.description.getter(v36, v42);
      unint64_t v45 = v44;
      uint64_t v180 = sub_10000B540(v43, v44, (uint64_t *)&v182);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v40 + 4, v40 + 12);
      swift_bridgeObjectRelease(v45);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v36);
      _os_log_impl( (void *)&_mh_execute_header,  v38,  v39,  "Failed at generating BGSystemTaskRequest from taskDefinition: %s",  v40,  0xCu);
      swift_arrayDestroy(v41, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1LL, -1LL);
      swift_slowDealloc(v40, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v36);
    }

    goto LABEL_44;
  }

  id v32 = [v31 groupName];
  if (v32)
  {

    uint64_t v33 = v174;
  }

  else
  {
    uint64_t v46 = v175;
    MLHostTask.bundleIdentifier.getter(0LL);
    uint64_t v48 = v47;
    NSString v49 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v48);
    [v31 setGroupName:v49];

    [v31 setGroupConcurrencyLimit:1];
    uint64_t v33 = v174;
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v50 = type metadata accessor for Logger(0LL);
    sub_10000C538(v50, (uint64_t)qword_10005A7E0);
    uint64_t v51 = *(void (**)(char *, void *, uint64_t))(v33 + 16);
    uint64_t v52 = v176;
    v51(v16, v46, v176);
    uint64_t v53 = v170;
    uint64_t v54 = ((uint64_t (*)(char *, void *, uint64_t))v51)(v170, v46, v52);
    uint64_t v55 = (os_log_s *)Logger.logObject.getter(v54);
    os_log_type_t v56 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc(22LL, -1LL);
      uint64_t v58 = (void *)swift_slowAlloc(64LL, -1LL);
      id v168 = v58;
      id v182 = v58;
      *(_DWORD *)uint64_t v57 = 136315394;
      uint64_t v59 = MLHostTask.name.getter(v58);
      unint64_t v61 = v60;
      uint64_t v180 = sub_10000B540(v59, v60, (uint64_t *)&v182);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v57 + 4, v57 + 12);
      swift_bridgeObjectRelease(v61);
      id v167 = v31;
      unint64_t v62 = *(uint64_t (**)(char *, uint64_t))(v33 + 8);
      uint64_t v63 = v62(v16, v52);
      *(_WORD *)(v57 + 12) = 2080;
      uint64_t v64 = v170;
      uint64_t v65 = MLHostTask.bundleIdentifier.getter(v63);
      unint64_t v67 = v66;
      uint64_t v180 = sub_10000B540(v65, v66, (uint64_t *)&v182);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v57 + 14, v57 + 22);
      swift_bridgeObjectRelease(v67);
      v62(v64, v52);
      id v31 = v167;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  v56,  "Modified request for task %s: assigned group name: %s",  (uint8_t *)v57,  0x16u);
      id v68 = v168;
      swift_arrayDestroy(v168, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v68, -1LL, -1LL);
      swift_slowDealloc(v57, -1LL, -1LL);
    }

    else
    {
      os_log_type_t v69 = *(void (**)(char *, uint64_t))(v33 + 8);
      v69(v16, v52);
      v69(v53, v52);
    }
  }

  __n128 v170 = (char *)objc_opt_self(&OBJC_CLASS___BGSystemTaskScheduler);
  id v70 = [v170 sharedScheduler];
  MLHostTask.name.getter(v70);
  uint64_t v72 = v71;
  NSString v73 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v72);
  id v74 = [v70 taskRequestForIdentifier:v73];

  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v75 = type metadata accessor for Logger(0LL);
  uint64_t v76 = sub_10000C538(v75, (uint64_t)qword_10005A7E0);
  id v77 = v74;
  uint64_t v78 = (os_log_s *)Logger.logObject.getter(v77);
  os_log_type_t v79 = static os_log_type_t.debug.getter();
  BOOL v80 = os_log_type_enabled(v78, v79);
  uint64_t v81 = v176;
  if (v80)
  {
    double v82 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v83 = (void *)swift_slowAlloc(32LL, -1LL);
    id v182 = v83;
    *(_DWORD *)double v82 = 136315138;
    if (v77)
    {
      id v84 = v77;
      id v85 = [v77 description];
      uint64_t v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(v85);
      unint64_t v88 = v87;
    }

    else
    {
      unint64_t v88 = 0xE300000000000000LL;
      uint64_t v86 = 4271950LL;
      id v84 = 0LL;
    }

    uint64_t v180 = sub_10000B540(v86, v88, (uint64_t *)&v182);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v82 + 4, v82 + 12);

    swift_bridgeObjectRelease(v88);
    _os_log_impl((void *)&_mh_execute_header, v78, v79, "Existing BGST.taskRequest: %s", v82, 0xCu);
    swift_arrayDestroy(v83, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v83, -1LL, -1LL);
    swift_slowDealloc(v82, -1LL, -1LL);

    id v77 = v84;
    uint64_t v33 = v174;
    uint64_t v81 = v176;
  }

  else
  {
  }

  uint64_t v89 = *(void (**)(char *, void *, uint64_t))(v33 + 16);
  uint64_t v90 = v172;
  uint64_t v91 = v175;
  id v168 = v77;
  uint64_t v166 = v89;
  if (v77)
  {
    NSString v92 = v171;
    v89(v171, v175, v81);
    id v93 = v31;
    __n128 v94 = (os_log_s *)Logger.logObject.getter(v93);
    os_log_type_t v95 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v94, v95))
    {
      uint64_t v96 = swift_slowAlloc(22LL, -1LL);
      uint64_t v165 = v76;
      uint64_t v97 = v96;
      uint64_t v98 = (void *)swift_slowAlloc(8LL, -1LL);
      id v99 = (char *)swift_slowAlloc(32LL, -1LL);
      unint64_t v172 = v99;
      id v182 = v99;
      *(_DWORD *)uint64_t v97 = 136315394;
      uint64_t v100 = MLHostTask.name.getter(v99);
      unint64_t v102 = v101;
      uint64_t v180 = sub_10000B540(v100, v101, (uint64_t *)&v182);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v97 + 4, v97 + 12);
      swift_bridgeObjectRelease(v102);
      uint64_t v174 = *(void *)(v174 + 8);
      ((void (*)(char *, uint64_t))v174)(v92, v176);
      *(_WORD *)(v97 + 12) = 2112;
      uint64_t v180 = (uint64_t)v93;
      id v103 = v93;
      uint64_t v91 = v175;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v97 + 14, v97 + 22);
      *uint64_t v98 = v31;

      uint64_t v81 = v176;
      _os_log_impl( (void *)&_mh_execute_header,  v94,  v95,  "Task %s has existing request, updating request: %@.",  (uint8_t *)v97,  0x16u);
      uint64_t v104 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v98, 1LL, v104);
      swift_slowDealloc(v98, -1LL, -1LL);
      uint64_t v105 = v172;
      swift_arrayDestroy(v172, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v105, -1LL, -1LL);
      swift_slowDealloc(v97, -1LL, -1LL);
    }

    else
    {
      uint64_t v174 = *(void *)(v33 + 8);
      ((void (*)(char *, uint64_t))v174)(v92, v81);
    }

    uint64_t v121 = v173;
    id v122 = [v170 sharedScheduler];
    id v182 = 0LL;
    unsigned int v123 = [v122 updateTaskRequest:v93 error:&v182];

    id v124 = v182;
    if (v123)
    {
      id v125 = v182;

      return 1LL;
    }

    id v167 = v31;
  }

  else
  {
    v89(v172, v175, v81);
    id v106 = v31;
    uint64_t v107 = (os_log_s *)Logger.logObject.getter(v106);
    os_log_type_t v108 = static os_log_type_t.info.getter();
    BOOL v109 = os_log_type_enabled(v107, v108);
    id v167 = v31;
    if (v109)
    {
      uint64_t v110 = swift_slowAlloc(22LL, -1LL);
      uint64_t v165 = v76;
      uint64_t v111 = v33;
      uint64_t v112 = v110;
      uint64_t v164 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v113 = (char *)swift_slowAlloc(32LL, -1LL);
      uint64_t v171 = v113;
      id v182 = v113;
      *(_DWORD *)uint64_t v112 = 136315394;
      uint64_t v114 = MLHostTask.name.getter(v113);
      unint64_t v116 = v115;
      uint64_t v180 = sub_10000B540(v114, v115, (uint64_t *)&v182);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v112 + 4, v112 + 12);
      swift_bridgeObjectRelease(v116);
      uint64_t v174 = *(void *)(v111 + 8);
      ((void (*)(char *, uint64_t))v174)(v90, v176);
      *(_WORD *)(v112 + 12) = 2112;
      uint64_t v180 = (uint64_t)v106;
      id v117 = v106;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v112 + 14, v112 + 22);
      uint64_t v118 = v164;
      *uint64_t v164 = v31;

      uint64_t v81 = v176;
      _os_log_impl( (void *)&_mh_execute_header,  v107,  v108,  "Task %s has no request, submitting request: %@",  (uint8_t *)v112,  0x16u);
      uint64_t v119 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v118, 1LL, v119);
      swift_slowDealloc(v118, -1LL, -1LL);
      uint64_t v120 = v171;
      swift_arrayDestroy(v171, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v120, -1LL, -1LL);
      swift_slowDealloc(v112, -1LL, -1LL);
    }

    else
    {
      uint64_t v174 = *(void *)(v33 + 8);
      ((void (*)(char *, uint64_t))v174)(v90, v81);
    }

    uint64_t v121 = v173;
    id v127 = [v170 sharedScheduler];
    id v182 = 0LL;
    unsigned int v128 = [v127 submitTaskRequest:v106 error:&v182];

    id v124 = v182;
    if (v128)
    {
      id v129 = v182;

      return 1LL;
    }

    uint64_t v91 = v175;
  }

  id v130 = v124;
  uint64_t v131 = (void *)_convertNSErrorToError(_:)(v124);

  swift_willThrow(v132);
  id v182 = v131;
  swift_errorRetain(v131);
  uint64_t v133 = sub_10000B4F4(&qword_1000595D0);
  type metadata accessor for BGSystemTaskSchedulerError(0LL);
  uint64_t v135 = v134;
  if (swift_dynamicCast(&v180, &v182, v133, v134, 0LL))
  {
    swift_errorRelease(v131);
    uint64_t v136 = (void *)v180;
    v166(v121, v91, v81);
    id v137 = v136;
    uint64_t v138 = (os_log_s *)Logger.logObject.getter(v137);
    uint64_t v139 = v81;
    os_log_type_t v140 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v138, v140))
    {
      uint64_t v141 = swift_slowAlloc(22LL, -1LL);
      uint64_t v142 = swift_slowAlloc(64LL, -1LL);
      uint64_t v181 = v142;
      *(_DWORD *)uint64_t v141 = 136315394;
      uint64_t v143 = MLHostTask.name.getter(v142);
      unint64_t v145 = v144;
      uint64_t v178 = sub_10000B540(v143, v144, &v181);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, &v179, v141 + 4, v141 + 12);
      swift_bridgeObjectRelease(v145);
      ((void (*)(char *, uint64_t))v174)(v121, v139);
      *(_WORD *)(v141 + 12) = 2080;
      uint64_t v177 = (uint64_t)v137;
      uint64_t v146 = sub_100005038( &qword_100058FE8,  (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError,  (uint64_t)&unk_1000409A0);
      _BridgedStoredNSError.code.getter(&v178, v135, v146);
      uint64_t v177 = v178;
      type metadata accessor for Code(0LL);
      uint64_t v148 = String.init<A>(describing:)(&v177, v147);
      unint64_t v150 = v149;
      uint64_t v178 = sub_10000B540(v148, v149, &v181);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v178, &v179, v141 + 14, v141 + 22);

      swift_bridgeObjectRelease(v150);
      _os_log_impl( (void *)&_mh_execute_header,  v138,  v140,  "Task %s schedule request failed: %s",  (uint8_t *)v141,  0x16u);
      swift_arrayDestroy(v142, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v142, -1LL, -1LL);
      swift_slowDealloc(v141, -1LL, -1LL);
    }

    else
    {

      ((void (*)(char *, uint64_t))v174)(v121, v139);
    }

    swift_errorRelease(v182);
    return 0LL;
  }

  swift_errorRelease(v182);
  uint64_t v151 = v169;
  v166(v169, v91, v81);
  swift_errorRetain(v131);
  uint64_t v152 = swift_errorRetain(v131);
  char v38 = (os_log_s *)Logger.logObject.getter(v152);
  os_log_type_t v153 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v38, v153))
  {

    swift_errorRelease(v131);
    ((void (*)(char *, uint64_t))v174)(v151, v81);
    swift_errorRelease(v131);
    swift_errorRelease(v131);
LABEL_44:

    return 0LL;
  }

  uint64_t v154 = swift_slowAlloc(22LL, -1LL);
  os_log_type_t v155 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
  uint64_t v156 = (void *)swift_slowAlloc(32LL, -1LL);
  uint64_t v175 = v156;
  id v182 = v156;
  *(_DWORD *)uint64_t v154 = 136315394;
  uint64_t v157 = MLHostTask.name.getter(v156);
  unint64_t v159 = v158;
  uint64_t v180 = sub_10000B540(v157, v158, (uint64_t *)&v182);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v154 + 4, v154 + 12);
  swift_bridgeObjectRelease(v159);
  ((void (*)(char *, uint64_t))v174)(v151, v81);
  *(_WORD *)(v154 + 12) = 2112;
  swift_errorRetain(v131);
  uint64_t v160 = _swift_stdlib_bridgeErrorToNSError(v131);
  uint64_t v180 = v160;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &v181, v154 + 14, v154 + 22);
  uint64_t *v155 = v160;
  swift_errorRelease(v131);
  swift_errorRelease(v131);
  _os_log_impl((void *)&_mh_execute_header, v38, v153, "Task %s schedule request failed: %@", (uint8_t *)v154, 0x16u);
  uint64_t v161 = sub_10000B4F4(&qword_100059280);
  swift_arrayDestroy(v155, 1LL, v161);
  swift_slowDealloc(v155, -1LL, -1LL);
  uint64_t v162 = v175;
  swift_arrayDestroy(v175, 1LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v162, -1LL, -1LL);
  swift_slowDealloc(v154, -1LL, -1LL);

  swift_errorRelease(v131);
  return 0LL;
}

uint64_t sub_100030150(uint64_t a1)
{
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v4 = sub_10000C654(0LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
  unint64_t v5 = sub_10003EA20();
  uint64_t result = Set.init(minimumCapacity:)(v3, v4, v5);
  uint64_t v15 = result;
  if (v2)
  {
    if (a1 < 0) {
      uint64_t v8 = a1;
    }
    else {
      uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    uint64_t result = swift_bridgeObjectRelease(a1);
    if (!v7) {
      return v15;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v7) {
      return v15;
    }
  }

  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_10002C1D8((Swift::Int *)&v14, v10);
      }
    }

    else
    {
      uint64_t v11 = (void **)(a1 + 32);
      do
      {
        uint64_t v12 = *v11++;
        sub_10002C1D8((Swift::Int *)&v14, v12);

        --v7;
      }

      while (v7);
    }

    return v15;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000302A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0LL;
    }
    result |= v5;
    --v1;
  }

  while (v1);
  return result;
}

BOOL sub_1000302E0()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2)
  {
    MLHostConfig.cloudEnvironment.getter();
    uint64_t v4 = v3;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    NSString v6 = String._bridgeToObjectiveC()();
    [v2 setObject:v5 forKey:v6];

    MLHostConfig.cloudContainer.getter();
    if (v7)
    {
      uint64_t v8 = v7;
      NSString v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v8);
    }

    else
    {
      NSString v9 = 0LL;
    }

    NSString v16 = String._bridgeToObjectiveC()();
    [v2 setObject:v9 forKey:v16];
    swift_unknownObjectRelease(v9);

    MLHostConfig.apsEnvironment.getter();
    if (v17)
    {
      uint64_t v18 = v17;
      NSString v19 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v18);
    }

    else
    {
      NSString v19 = 0LL;
    }

    NSString v20 = String._bridgeToObjectiveC()();
    [v2 setObject:v19 forKey:v20];
    swift_unknownObjectRelease(v19);
  }

  else
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_10000C538(v10, (uint64_t)qword_10005A7E0);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = swift_slowAlloc(32LL, -1LL);
      uint64_t v23 = v15;
      *(_DWORD *)id v14 = 136315138;
      uint64_t v22 = sub_10000B540(0xD000000000000010LL, 0x800000010004A600LL, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v14 + 4, v14 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "Failed at reading UserDefaults(%s). Skipping saving config.",  v14,  0xCu);
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);
    }
  }

  return v2 != 0LL;
}

void sub_1000305D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone(&OBJC_CLASS___RBSTerminateContext);
  swift_bridgeObjectRetain(a3);
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  id v33 = [v5 initWithExplanation:v6];

  [v33 setReportType:0];
  [v33 setMaximumTerminationResistance:20];
  id v7 = [(id)objc_opt_self(RBSProcessIdentifier) identifierWithPid:a1];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [(id)objc_opt_self(RBSProcessPredicate) predicateMatchingIdentifier:v7];
    id v10 = [objc_allocWithZone(RBSTerminateRequest) initWithPredicate:v9 context:v33];
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_10000C538(v11, (uint64_t)qword_10005A7E0);
    os_log_type_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.info.getter(v13);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v15 = 67109120;
      LODWORD(v34) = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, (char *)&v34 + 4, v15 + 4, v15 + 8);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "RBS request termination for pid: %d", v15, 8u);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    id v34 = 0LL;
    unsigned int v16 = [v10 execute:&v34];
    id v17 = v34;
    if (v16)
    {
      id v18 = v34;

LABEL_12:
      return;
    }

    id v23 = v34;
    uint64_t v24 = _convertNSErrorToError(_:)(v17);

    swift_willThrow(v25);
    swift_errorRetain(v24);
    uint64_t v26 = swift_errorRetain(v24);
    uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v30 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v29 = 138412290;
      swift_errorRetain(v24);
      id v31 = (void *)_swift_stdlib_bridgeErrorToNSError(v24);
      id v34 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v29 + 4, v29 + 12);
      void *v30 = v31;
      swift_errorRelease(v24);
      swift_errorRelease(v24);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "RBS request failed: %@", v29, 0xCu);
      uint64_t v32 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v30, 1LL, v32);
      swift_slowDealloc(v30, -1LL, -1LL);
      swift_slowDealloc(v29, -1LL, -1LL);

      swift_errorRelease(v24);
    }

    else
    {

      swift_errorRelease(v24);
      swift_errorRelease(v24);
      swift_errorRelease(v24);
    }
  }

  else
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_10000C538(v19, (uint64_t)qword_10005A7E0);
    uint64_t v8 = (void *)Logger.logObject.getter(v20);
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v8, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v22 = 67109120;
      LODWORD(v34) = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, (char *)&v34 + 4, v22 + 4, v22 + 8);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  v21,  "RBS failed at creating identifier for pid: %d",  v22,  8u);
      swift_slowDealloc(v22, -1LL, -1LL);

      goto LABEL_12;
    }
  }

uint64_t sub_100030AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[146] = a3;
  v3[145] = a2;
  v3[144] = a1;
  uint64_t v5 = type metadata accessor for ContinuousClock(0LL);
  v3[147] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[148] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[149] = swift_task_alloc(v7);
  v3[150] = swift_task_alloc(v7);
  v3[151] = swift_task_alloc(v7);
  uint64_t v8 = type metadata accessor for ContinuousClock.Instant(0LL);
  v3[152] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[153] = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[154] = swift_task_alloc(v10);
  v3[155] = swift_task_alloc(v10);
  v3[156] = swift_task_alloc(v10);
  v3[157] = swift_task_alloc(v10);
  v3[158] = swift_task_alloc(v10);
  v3[159] = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  v3[160] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[161] = v12;
  v3[162] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for SandboxError(0LL);
  v3[163] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v3[164] = v14;
  v3[165] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for URL.DirectoryHint(0LL);
  v3[166] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v3[167] = v16;
  v3[168] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_10000B4F4(&qword_1000595C0);
  v3[169] = swift_task_alloc((*(void *)(*(void *)(v17 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  v3[170] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v3[171] = v19;
  v3[172] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_10000B4F4(&qword_1000594A8);
  v3[173] = swift_task_alloc((*(void *)(*(void *)(v20 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for _AppExtensionProcess(0LL);
  v3[174] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v3[175] = v22;
  v3[176] = swift_task_alloc((*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for TaskStatus(0LL);
  v3[177] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v3[178] = v24;
  v3[179] = swift_task_alloc((*(void *)(v24 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = type metadata accessor for MLHostTask(0LL);
  v3[180] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v3[181] = v26;
  uint64_t v27 = *(void *)(v26 + 64);
  v3[182] = v27;
  unint64_t v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v3[183] = swift_task_alloc(v28);
  v3[184] = swift_task_alloc(v28);
  v3[185] = swift_task_alloc(v28);
  v3[186] = swift_task_alloc(v28);
  v3[187] = swift_task_alloc(v28);
  v3[188] = swift_task_alloc(v28);
  v3[189] = swift_task_alloc(v28);
  v3[190] = swift_task_alloc(v28);
  v3[191] = swift_task_alloc(v28);
  v3[192] = swift_task_alloc(v28);
  v3[193] = swift_task_alloc(v28);
  v3[194] = swift_task_alloc(v28);
  v3[195] = swift_task_alloc(v28);
  v3[196] = swift_task_alloc(v28);
  v3[197] = swift_task_alloc(v28);
  v3[198] = swift_task_alloc(v28);
  uint64_t v29 = type metadata accessor for Logger(0LL);
  v3[199] = v29;
  uint64_t v30 = *(void *)(v29 - 8);
  v3[200] = v30;
  unint64_t v31 = (*(void *)(v30 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[201] = swift_task_alloc(v31);
  v3[202] = swift_task_alloc(v31);
  v3[203] = swift_task_alloc(v31);
  v3[204] = swift_task_alloc(v31);
  v3[205] = swift_task_alloc(v31);
  v3[206] = swift_task_alloc(v31);
  v3[207] = swift_task_alloc(v31);
  v3[208] = swift_task_alloc(v31);
  swift_retain_n(a3, 2LL);
  return swift_task_switch(sub_100030EBC, 0LL, 0LL);
}

uint64_t sub_100030EBC(uint64_t a1)
{
  id v2 = v1;
  uint64_t v3 = v1[146];
  strcpy((char *)v901, "transaction_");
  BYTE5(v901[1]) = 0;
  HIWORD(v901[1]) = -5120;
  v4._uint64_t countAndFlagsBits = MLHostTask.name.getter(a1);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  uint64_t v6 = String.utf8CString.getter(v901[0], v901[1]);
  swift_bridgeObjectRelease(v901[1]);
  uint64_t v7 = os_transaction_create(v6 + 32);
  v1[209] = v7;
  swift_release(v6);
  swift_beginAccess(v3 + 16, v1 + 48, 0LL, 0LL);
  if (*(_BYTE *)(v3 + 16) == 1)
  {
    if (qword_100058F68 != -1) {
      swift_once(&qword_100058F68, sub_10001F3C8);
    }
    uint64_t v8 = sub_10000C538(v1[199], (uint64_t)qword_10005A7E0);
    uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Task was deferred before acquiring process. Exiting early.",  v11,  2u);
      swift_slowDealloc(v11, -1LL, -1LL);
    }

    uint64_t v12 = v2[179];
    uint64_t v13 = v2[178];
    uint64_t v14 = v2[177];
    uint64_t v15 = v2[146];

    uint64_t v17 = MLHostTask.name.getter(v16);
    uint64_t v19 = v18;
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v12, enum case for TaskStatus.taskDeferred(_:), v14);
    sub_100013D50(v17, v19, v12);
    swift_bridgeObjectRelease(v19);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    id v20 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    v879 = (void *)MLHostResult.init(status:policy:)(1LL, 1LL);
    swift_unknownObjectRelease(v7);
    uint64_t v21 = v15;
    goto LABEL_26;
  }

  v794 = (_BYTE *)(v3 + 16);
  uint64_t v807 = v7;
  v786 = v1 + 117;
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  os_log_t log = (os_log_t)(v1 + 133);
  uint64_t v22 = v1[208];
  uint64_t v23 = v1[200];
  uint64_t v24 = v1[198];
  uint64_t v25 = v1[181];
  uint64_t v26 = v1[180];
  uint64_t v27 = v1[144];
  uint64_t v28 = sub_10000C538(v1[199], (uint64_t)qword_10005A7E0);
  v1[210] = v28;
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v1[211] = v29;
  uint64_t v880 = v28;
  v850 = v29;
  ((void (*)(uint64_t))v29)(v22);
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v1[212] = v30;
  v866 = v30;
  uint64_t v31 = v30(v24, v27, v26);
  uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.debug.getter();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v35 = v2[208];
  uint64_t v36 = v2[200];
  uint64_t v37 = v2[199];
  uint64_t v38 = v2[198];
  uint64_t v39 = v2[181];
  v900 = v2;
  v768 = v2 + 116;
  if (v34)
  {
    uint64_t v821 = v2[180];
    uint64_t v835 = v2[199];
    uint64_t v761 = v2[200];
    BOOL v40 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v41 = swift_slowAlloc(32LL, -1LL);
    v901[0] = v41;
    *(_DWORD *)BOOL v40 = 136315138;
    uint64_t v42 = MLHostTask.bundleIdentifier.getter(v41);
    unint64_t v44 = v43;
    v2[116] = sub_10000B540(v42, v43, v901);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 116, v786, v40 + 4, v40 + 12);
    swift_bridgeObjectRelease(v44);
    uint64_t v45 = v821;
    v822 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v822(v38, v45);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Requesting process for extension: %s", v40, 0xCu);
    swift_arrayDestroy(v41, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1LL, -1LL);
    swift_slowDealloc(v40, -1LL, -1LL);

    uint64_t v46 = v35;
    uint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t))(v761 + 8);
    uint64_t v48 = v835;
  }

  else
  {
    v822 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v822(v38, v2[180]);

    uint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t))(v36 + 8);
    uint64_t v46 = v35;
    uint64_t v48 = v37;
  }

  v836 = v47;
  uint64_t v49 = v47(v46, v48);
  uint64_t v50 = v2[175];
  uint64_t v51 = v2[174];
  uint64_t v52 = v2[173];
  uint64_t v53 = MLHostTask.bundleIdentifier.getter(v49);
  unint64_t v55 = v54;
  uint64_t v56 = MLHostTask.name.getter(v53);
  uint64_t v58 = v57;
  sub_10000D144(v53, v55, v56, v57, v52);
  swift_bridgeObjectRelease(v58);
  swift_bridgeObjectRelease(v55);
  int v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v52, 1LL, v51);
  uint64_t v60 = v2[199];
  uint64_t v61 = v2[180];
  if (v59 == 1)
  {
    uint64_t v62 = v2[206];
    uint64_t v63 = v2[196];
    uint64_t v64 = v2[144];
    sub_10000C7CC(v2[173], &qword_1000594A8);
    v850(v62, v880, v60);
    uint64_t v65 = v866(v63, v64, v61);
    unint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.error.getter();
    BOOL v68 = os_log_type_enabled(v66, v67);
    uint64_t v69 = v2[206];
    uint64_t v70 = v2[199];
    uint64_t v71 = v2[196];
    uint64_t v72 = v2[180];
    if (v68)
    {
      uint64_t v881 = v2[199];
      uint64_t v867 = v2[206];
      NSString v73 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v74 = swift_slowAlloc(32LL, -1LL);
      v901[0] = v74;
      *(_DWORD *)NSString v73 = 136315138;
      uint64_t v75 = MLHostTask.bundleIdentifier.getter(v74);
      unint64_t v77 = v76;
      v2[132] = sub_10000B540(v75, v76, v901);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 132, log, v73 + 4, v73 + 12);
      swift_bridgeObjectRelease(v77);
      v822(v71, v72);
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Failed at starting process for extension: %s", v73, 0xCu);
      swift_arrayDestroy(v74, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v74, -1LL, -1LL);
      swift_slowDealloc(v73, -1LL, -1LL);

      uint64_t v78 = v867;
      uint64_t v79 = v881;
    }

    else
    {
      v822(v2[196], v2[180]);

      uint64_t v78 = v69;
      uint64_t v79 = v70;
    }

    uint64_t v100 = v836(v78, v79);
    uint64_t v101 = v2[179];
    uint64_t v102 = v2[178];
    uint64_t v103 = v2[177];
    uint64_t v104 = v2[146];
    uint64_t v105 = MLHostTask.name.getter(v100);
    uint64_t v107 = v106;
    (*(void (**)(uint64_t, void, uint64_t))(v102 + 104))(v101, enum case for TaskStatus.taskFailed(_:), v103);
    sub_100013D50(v105, v107, v101);
    swift_bridgeObjectRelease(v107);
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v101, v103);
    swift_unknownObjectRelease(v807);
    uint64_t v108 = v104;
    goto LABEL_36;
  }

  v754 = v2 + 132;
  BOOL v80 = v2 + 42;
  uint64_t v81 = v2[207];
  uint64_t v82 = v2[197];
  uint64_t v83 = v2[144];
  (*(void (**)(void, void, void))(v2[175] + 32LL))(v2[176], v2[173], v2[174]);
  v850(v81, v880, v60);
  uint64_t v84 = v866(v82, v83, v61);
  id v85 = (os_log_s *)Logger.logObject.getter(v84);
  os_log_type_t v86 = static os_log_type_t.debug.getter();
  BOOL v87 = os_log_type_enabled(v85, v86);
  uint64_t v88 = v2[207];
  uint64_t v89 = v2[199];
  uint64_t v90 = v2[197];
  uint64_t v91 = v2[180];
  v758 = v2 + 125;
  v762 = v2 + 124;
  if (v87)
  {
    uint64_t v743 = v2[199];
    v737 = (void *)v2[207];
    NSString v92 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v93 = swift_slowAlloc(32LL, -1LL);
    v901[0] = v93;
    *(_DWORD *)NSString v92 = 136315138;
    uint64_t v94 = MLHostTask.bundleIdentifier.getter(v93);
    unint64_t v96 = v95;
    v2[124] = sub_10000B540(v94, v95, v901);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 124, v2 + 125, v92 + 4, v92 + 12);
    swift_bridgeObjectRelease(v96);
    v822(v90, v91);
    _os_log_impl((void *)&_mh_execute_header, v85, v86, "Acquired process for extension: %s", v92, 0xCu);
    swift_arrayDestroy(v93, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v97 = v93;
    BOOL v80 = v2 + 42;
    swift_slowDealloc(v97, -1LL, -1LL);
    swift_slowDealloc(v92, -1LL, -1LL);

    uint64_t v98 = (uint64_t)v737;
    uint64_t v99 = v743;
  }

  else
  {
    v822(v90, v91);

    uint64_t v98 = v88;
    uint64_t v99 = v89;
  }

  v836(v98, v99);
  uint64_t v109 = swift_beginAccess(v794, v80, 0LL, 0LL);
  uint64_t v110 = (NSXPCConnection *)*v794;
  if ((_DWORD)v110 == 1)
  {
    uint64_t v111 = (os_log_s *)Logger.logObject.getter(v109);
    os_log_type_t v112 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v111,  v112,  "Task was deferred while acquiring process. Exiting early.",  v113,  2u);
      swift_slowDealloc(v113, -1LL, -1LL);
    }

    uint64_t v114 = v2[179];
    uint64_t v115 = v2[178];
    uint64_t v116 = v2[177];
    uint64_t v117 = v2[176];
    uint64_t v118 = v2[175];
    uint64_t v119 = v2[174];
    uint64_t v868 = v2[146];

    uint64_t v121 = MLHostTask.name.getter(v120);
    uint64_t v123 = v122;
    (*(void (**)(uint64_t, void, uint64_t))(v115 + 104))( v114,  enum case for TaskStatus.taskDeferred(_:),  v116);
    sub_100013D50(v121, v123, v114);
    swift_bridgeObjectRelease(v123);
    (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v114, v116);
    id v124 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    v879 = (void *)MLHostResult.init(status:policy:)(1LL, 1LL);
    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v117, v119);
LABEL_24:
    uint64_t v125 = v807;
LABEL_25:
    swift_unknownObjectRelease(v125);
    uint64_t v21 = v868;
LABEL_26:
    swift_release_n(v21, 2LL);
LABEL_37:
    uint64_t v175 = v2[208];
    uint64_t v176 = v2[207];
    uint64_t v177 = v2;
    uint64_t v178 = v2[206];
    uint64_t v179 = v177[205];
    uint64_t v180 = v177[204];
    uint64_t v181 = v177[203];
    uint64_t v182 = v177[202];
    uint64_t v183 = v177[201];
    uint64_t v184 = v177[198];
    uint64_t v185 = v177[197];
    uint64_t v693 = v177[196];
    uint64_t v694 = v177[195];
    uint64_t v695 = v177[194];
    uint64_t v697 = v177[193];
    uint64_t v699 = v177[192];
    uint64_t v701 = v177[191];
    *(void *)typea = v177[190];
    uint64_t v709 = v177[189];
    uint64_t v712 = v177[188];
    uint64_t v716 = v177[187];
    v720 = (void *)v177[186];
    uint64_t v721 = v177[185];
    uint64_t v723 = v177[184];
    uint64_t v726 = v177[183];
    aBlocka = (void *)v177[179];
    uint64_t v733 = v177[176];
    v738 = (void *)v177[173];
    uint64_t v744 = v177[172];
    uint64_t v750 = v177[169];
    uint64_t v755 = v177[168];
    uint64_t v759 = v177[165];
    uint64_t v763 = v177[162];
    uint64_t v769 = v177[159];
    os_log_t logc = (os_log_t)v177[158];
    uint64_t v787 = v177[157];
    uint64_t v795 = v177[156];
    uint64_t v808 = v177[155];
    uint64_t v823 = v177[154];
    uint64_t v837 = v177[151];
    uint64_t v852 = v177[150];
    uint64_t v869 = v177[149];
    swift_task_dealloc(v175);
    swift_task_dealloc(v176);
    swift_task_dealloc(v178);
    swift_task_dealloc(v179);
    swift_task_dealloc(v180);
    swift_task_dealloc(v181);
    swift_task_dealloc(v182);
    swift_task_dealloc(v183);
    swift_task_dealloc(v184);
    swift_task_dealloc(v185);
    swift_task_dealloc(v693);
    swift_task_dealloc(v694);
    swift_task_dealloc(v695);
    swift_task_dealloc(v697);
    swift_task_dealloc(v699);
    swift_task_dealloc(v701);
    swift_task_dealloc(*(void *)typea);
    swift_task_dealloc(v709);
    swift_task_dealloc(v712);
    swift_task_dealloc(v716);
    swift_task_dealloc(v720);
    swift_task_dealloc(v721);
    swift_task_dealloc(v723);
    swift_task_dealloc(v726);
    swift_task_dealloc(aBlocka);
    swift_task_dealloc(v733);
    swift_task_dealloc(v738);
    swift_task_dealloc(v744);
    swift_task_dealloc(v750);
    swift_task_dealloc(v755);
    swift_task_dealloc(v759);
    swift_task_dealloc(v763);
    swift_task_dealloc(v769);
    swift_task_dealloc(logc);
    swift_task_dealloc(v787);
    swift_task_dealloc(v795);
    swift_task_dealloc(v808);
    swift_task_dealloc(v823);
    swift_task_dealloc(v837);
    swift_task_dealloc(v852);
    swift_task_dealloc(v869);
    return ((uint64_t (*)(void *))v177[1])(v879);
  }

  _AppExtensionProcess.makeXPCConnection()(v110);
  v2[213] = v126;
  if (v127)
  {
    uint64_t v128 = v2[205];
    uint64_t v129 = v2[199];
    uint64_t v130 = v2[195];
    uint64_t v131 = v2[180];
    uint64_t v132 = v2[144];
    swift_errorRelease(v127);
    v850(v128, v880, v129);
    uint64_t v133 = v866(v130, v132, v131);
    uint64_t v134 = (os_log_s *)Logger.logObject.getter(v133);
    os_log_type_t v135 = static os_log_type_t.error.getter();
    BOOL v136 = os_log_type_enabled(v134, v135);
    uint64_t v137 = v2[205];
    uint64_t v138 = v2[199];
    uint64_t v139 = v2[195];
    uint64_t v140 = v2[180];
    if (v136)
    {
      uint64_t v882 = v2[205];
      uint64_t v141 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v142 = swift_slowAlloc(32LL, -1LL);
      v901[0] = v142;
      *(_DWORD *)uint64_t v141 = 136315138;
      uint64_t v143 = MLHostTask.bundleIdentifier.getter(v142);
      unint64_t v145 = v144;
      v2[140] = sub_10000B540(v143, v144, v901);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 140, v2 + 141, v141 + 4, v141 + 12);
      swift_bridgeObjectRelease(v145);
      v822(v139, v140);
      _os_log_impl( (void *)&_mh_execute_header,  v134,  v135,  "Failed at opening XPCConnection for extension: %s",  v141,  0xCu);
      swift_arrayDestroy(v142, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v142, -1LL, -1LL);
      swift_slowDealloc(v141, -1LL, -1LL);

      uint64_t v147 = v138;
      uint64_t v146 = v882;
    }

    else
    {
      v822(v2[195], v2[180]);

      uint64_t v146 = v137;
      uint64_t v147 = v138;
    }

    uint64_t v165 = v836(v146, v147);
    uint64_t v166 = v2[179];
    uint64_t v167 = v2[178];
    uint64_t v168 = v2[177];
    uint64_t v169 = v2[176];
    uint64_t v170 = v2[175];
    uint64_t v171 = v2[174];
    uint64_t v883 = v2[146];
    uint64_t v172 = MLHostTask.name.getter(v165);
    uint64_t v174 = v173;
    (*(void (**)(uint64_t, void, uint64_t))(v167 + 104))(v166, enum case for TaskStatus.taskFailed(_:), v168);
    sub_100013D50(v172, v174, v166);
    swift_bridgeObjectRelease(v174);
    (*(void (**)(uint64_t, uint64_t))(v167 + 8))(v166, v168);
    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v170 + 8))(v169, v171);
    swift_unknownObjectRelease(v807);
    uint64_t v108 = v883;
    goto LABEL_36;
  }

  uint64_t v148 = v126;
  uint64_t v149 = swift_beginAccess(v794, v2 + 36, 0LL, 0LL);
  if ((*v794 & 1) != 0)
  {
    unint64_t v150 = (os_log_s *)Logger.logObject.getter(v149);
    os_log_type_t v151 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v150, v151))
    {
      uint64_t v152 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v152 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v150,  v151,  "Task was deferred while opening XPC connection to process. Exiting early.",  v152,  2u);
      swift_slowDealloc(v152, -1LL, -1LL);
    }

    uint64_t v153 = v2[179];
    uint64_t v154 = v2[178];
    uint64_t v155 = v2[177];
    uint64_t v156 = v2[176];
    uint64_t v157 = v2[175];
    uint64_t v851 = v2[174];
    uint64_t v868 = v2[146];
    unint64_t v158 = v2;

    uint64_t v160 = MLHostTask.name.getter(v159);
    uint64_t v162 = v161;
    (*(void (**)(uint64_t, void, uint64_t))(v154 + 104))( v153,  enum case for TaskStatus.taskDeferred(_:),  v155);
    sub_100013D50(v160, v162, v153);
    uint64_t v163 = v162;
    id v2 = v158;
    swift_bridgeObjectRelease(v163);
    (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v153, v155);
    id v164 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    v879 = (void *)MLHostResult.init(status:policy:)(1LL, 1LL);

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v156, v851);
    goto LABEL_24;
  }

  v700 = v2 + 140;
  v809 = v2 + 14;
  v739 = v2 + 20;
  aBlockb = v2 + 26;
  v838 = v2 + 32;
  uint64_t v187 = v2[194];
  uint64_t v188 = v2[182];
  v696 = v2 + 134;
  v698 = v2 + 135;
  uint64_t v189 = v2[181];
  v824 = v2 + 136;
  uint64_t v190 = v2[180];
  uint64_t v745 = v2[178];
  uint64_t v734 = v2[177];
  uint64_t v191 = v2[144];
  id v192 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_];
  [v148 setRemoteObjectInterface:v192];

  v866(v187, v191, v190);
  LODWORD(v193) = *(_DWORD *)(v189 + 80);
  *((_DWORD *)v2 + 476) = v193;
  uint64_t v193 = v193;
  uint64_t v194 = (v193 + 16) & ~v193;
  uint64_t v195 = v194 + v188;
  uint64_t v196 = v193 | 7LL;
  uint64_t v197 = swift_allocObject(&unk_100055FB8, v194 + v188, v196);
  os_log_type_t v198 = *(void (**)(uint64_t, uint64_t, uint64_t))(v189 + 32);
  v900[214] = v198;
  v198(v197 + v194, v187, v190);
  v900[30] = sub_10003EA7C;
  v900[31] = v197;
  v900[26] = _NSConcreteStackBlock;
  v900[27] = 1107296256LL;
  v900[28] = sub_100020B64;
  v900[29] = &unk_100055FD0;
  uint64_t v199 = _Block_copy(aBlockb);
  swift_release(v900[31]);
  [v148 setInterruptionHandler:v199];
  _Block_release(v199);
  v866(v187, v191, v190);
  uint64_t v200 = swift_allocObject(&unk_100056008, v195, v196);
  v198(v200 + v194, v187, v190);
  v900[24] = sub_10003EAEC;
  v900[25] = v200;
  v900[20] = _NSConcreteStackBlock;
  v900[21] = 1107296256LL;
  v900[22] = sub_100020B64;
  v900[23] = &unk_100056020;
  __n128 v201 = _Block_copy(v739);
  swift_release(v900[25]);
  [v148 setInvalidationHandler:v201];
  _Block_release(v201);
  [v148 resume];
  uint64_t v202 = swift_allocBox(v734);
  uint64_t v204 = v203;
  v900[215] = v202;
  v900[216] = v203;
  LODWORD(v203) = enum case for TaskStatus.taskRunning(_:);
  *((_DWORD *)v900 + 477) = enum case for TaskStatus.taskRunning(_:);
  __n128 v205 = *(void (**)(void))(v745 + 104);
  v900[217] = v205;
  unsigned int v727 = v203;
  v724 = (void (*)(uint64_t, void, uint64_t))v205;
  v205(v204);
  v866(v187, v191, v190);
  unint64_t v206 = (v195 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  v740 = (void *)v196;
  uint64_t v207 = swift_allocObject(&unk_100056058, v206 + 8, v196);
  uint64_t v746 = v194;
  v735 = v198;
  v198(v207 + v194, v187, v190);
  aBos_unfair_lock_t lock = (char *)v206;
  *(void *)(v207 + v206) = v202;
  v900[18] = sub_10003EBAC;
  v900[19] = v207;
  v900[14] = _NSConcreteStackBlock;
  v900[15] = 1107296256LL;
  v900[16] = sub_1000210C0;
  v900[17] = &unk_100056070;
  unint64_t v208 = _Block_copy(v809);
  uint64_t v209 = v900[19];
  swift_retain(v202);
  swift_release(v209);
  id v210 = [v148 remoteObjectProxyWithErrorHandler:v208];
  _Block_release(v208);
  _bridgeAnyObjectToAny(_:)(v210);
  swift_unknownObjectRelease(v210);
  uint64_t v211 = sub_10000B4F4(&qword_100059848);
  uint64_t v212 = swift_dynamicCast(v824, v838, (char *)&type metadata for Any + 8, v211, 7LL);
  v810 = (void *)v900[136];
  v900[218] = v810;
  uint64_t v213 = v900;
  uint64_t v214 = MLHostTask.taskFolder.getter(v212);
  unint64_t v216 = v215;
  *((_BYTE *)v900 + 785) = 1;
  if (qword_100058F80 != -1) {
    swift_once(&qword_100058F80, sub_10001F464);
  }
  uint64_t v217 = (void *)qword_1000596A8;
  swift_bridgeObjectRetain(qword_1000596A8);
  uint64_t v219 = MLHostTask.bundleIdentifier.getter(v218);
  uint64_t v221 = v220;
  char v222 = sub_100012B38(v219, v220, v217);
  swift_bridgeObjectRelease(v221);
  uint64_t v223 = swift_bridgeObjectRelease(v217);
  if ((v222 & 1) != 0)
  {
    uint64_t v224 = v900[145];
    swift_bridgeObjectRelease(v216);
    *((_BYTE *)v900 + 785) = 0;
    uint64_t v225 = *(void *)(v224 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    uint64_t v214 = *(void *)(v225 + 40);
    unint64_t v216 = *(void *)(v225 + 48);
    swift_bridgeObjectRetain_n(v216, 2LL);
  }

  else
  {
    if (!v216)
    {
      uint64_t v825 = v214;
      unint64_t v839 = 0LL;
      goto LABEL_49;
    }

    __n128 v226 = swift_bridgeObjectRetain(v216);
  }

  v713 = (unsigned __int8 *)v900 + 785;
  ((void (*)(void, void, void, __n128))v866)(v900[193], v900[144], v900[180], v226);
  uint64_t v227 = swift_bridgeObjectRetain_n(v216, 2LL);
  uint64_t v228 = (os_log_s *)Logger.logObject.getter(v227);
  os_log_type_t v229 = static os_log_type_t.debug.getter();
  BOOL v230 = os_log_type_enabled(v228, v229);
  uint64_t v231 = v900[193];
  uint64_t v232 = v900[181];
  uint64_t v233 = v900[180];
  unint64_t v839 = v216;
  if (v230)
  {
    uint64_t v234 = swift_slowAlloc(28LL, -1LL);
    uint64_t typeb = swift_slowAlloc(64LL, -1LL);
    v901[0] = typeb;
    *(_DWORD *)uint64_t v234 = 67109634;
    *((_DWORD *)v900 + 203) = (v222 & 1) == 0;
    uint64_t v235 = UnsafeMutableRawBufferPointer.copyMemory(from:)((char *)v900 + 812, v900 + 102, v234 + 4, v234 + 8);
    *(_WORD *)(v234 + 8) = 2080;
    uint64_t v236 = MLHostTask.name.getter(v235);
    unint64_t v238 = v237;
    v900[135] = sub_10000B540(v236, v237, v901);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v698, v824, v234 + 10, v234 + 18);
    swift_bridgeObjectRelease(v238);
    (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v231, v233);
    *(_WORD *)(v234 + 18) = 2080;
    swift_bridgeObjectRetain(v216);
    v900[133] = sub_10000B540(v214, v216, v901);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(log, v696, v234 + 20, v234 + 28);
    swift_bridgeObjectRelease_n(v216, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v228,  v229,  "Granting sandbox extension (ro: %{BOOL}d) to %s for taskFolder: %s",  (uint8_t *)v234,  0x1Cu);
    swift_arrayDestroy(typeb, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(typeb, -1LL, -1LL);
    uint64_t v239 = v234;
    uint64_t v213 = v900;
    swift_slowDealloc(v239, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v231, v233);
    swift_bridgeObjectRelease_n(v216, 2LL);
  }

  uint64_t v240 = v213[172];
  uint64_t v241 = v213[171];
  uint64_t v242 = v213[170];
  uint64_t v243 = v213[169];
  uint64_t v244 = v213[168];
  uint64_t v245 = v213[167];
  uint64_t v246 = v213[166];
  type metadata accessor for SandboxExtension(0LL);
  uint64_t v247 = _AppExtensionProcess.auditToken.getter();
  uint64_t v702 = v249;
  *(void *)typec = v248;
  uint64_t v251 = v250;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v241 + 56))(v243, 1LL, 1LL, v242);
  v252.n128_f64[0] = (*(double (**)(uint64_t, void, uint64_t))(v245 + 104))( v244,  enum case for URL.DirectoryHint.inferFromPath(_:),  v246);
  uint64_t v825 = v214;
  URL.init(filePath:directoryHint:relativeTo:)(v214, v839, v244, v243, v252);
  swift_beginAccess(v713, v900 + 39, 0LL, 0LL);
  uint64_t v253 = v251;
  uint64_t v213 = v900;
  uint64_t v254 = static SandboxExtension.issue(auditToken:url:readonly:)(v247, *(void *)typec, v253, v702, v240, *v713);
  uint64_t v255 = (*(uint64_t (**)(void, void))(v900[171] + 8LL))(v900[172], v900[170]);
  SandboxExtension.token.getter(v255);
  uint64_t v257 = v256;
  NSString v258 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v257);
  [v810 consumeSandboxExtensionWithToken:v258];

  uint64_t v223 = swift_release(v254);
LABEL_49:
  uint64_t v259 = v213[204];
  uint64_t v260 = v213[199];
  v714 = v213 + 138;
  uint64_t v717 = v213[192];
  uint64_t v751 = v213[191];
  uint64_t v261 = v213[180];
  uint64_t v262 = v213[162];
  uint64_t v263 = v213[161];
  uint64_t v264 = v213[160];
  uint64_t v265 = v213[144];
  uint64_t v266 = UUID.init()(v223);
  uint64_t v267 = UUID.uuidString.getter(v266);
  uint64_t v269 = v268;
  uint64_t v270 = (*(uint64_t (**)(uint64_t, uint64_t))(v263 + 8))(v262, v264);
  uint64_t v271 = MLHostTask.name.getter(v270);
  uint64_t v273 = v272;
  id v274 = objc_allocWithZone((Class)type metadata accessor for MLHostExtensionContext(0LL));
  uint64_t v840 = MLHostExtensionContext.init(taskId:taskName:taskFolder:)(v267, v269, v271, v273, v825, v839);
  v213[219] = v840;
  uint64_t v275 = swift_allocObject(&unk_1000560A8, 24LL, 7LL);
  v213[220] = v275;
  uint64_t v826 = v275;
  *(void *)(v275 + 16) = 0LL;
  uint64_t v276 = swift_allocObject(&unk_100055F18, 17LL, 7LL);
  v213[221] = v276;
  os_log_t loga = (os_log_t)v276;
  *(_BYTE *)(v276 + 16) = 2;
  uint64_t v710 = v276 + 16;
  v850(v259, v880, v260);
  v866(v717, v265, v261);
  uint64_t v277 = v866(v751, v265, v261);
  __n128 v278 = (os_log_s *)Logger.logObject.getter(v277);
  os_log_type_t v279 = static os_log_type_t.info.getter(v278);
  BOOL v280 = os_log_type_enabled(v278, v279);
  uint64_t v281 = v213[204];
  uint64_t v282 = v213[200];
  uint64_t v283 = v213[199];
  uint64_t v284 = v213[192];
  uint64_t v285 = v213[191];
  uint64_t v286 = v213[181];
  uint64_t v287 = v213[180];
  if (v280)
  {
    uint64_t v884 = v213[204];
    uint64_t v853 = v213[199];
    uint64_t v288 = swift_slowAlloc(22LL, -1LL);
    uint64_t v718 = swift_slowAlloc(64LL, -1LL);
    v901[0] = v718;
    *(_DWORD *)uint64_t v288 = 136315394;
    uint64_t v289 = MLHostTask.name.getter(v718);
    os_log_type_t typed = v279;
    unint64_t v291 = v290;
    uint64_t *v714 = sub_10000B540(v289, v290, v901);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v714, v213 + 139, v288 + 4, v288 + 12);
    swift_bridgeObjectRelease(v291);
    uint64_t v292 = *(uint64_t (**)(uint64_t, uint64_t))(v286 + 8);
    uint64_t v293 = v292(v284, v287);
    *(_WORD *)(v288 + 12) = 2080;
    uint64_t v294 = MLHostTask.bundleIdentifier.getter(v293);
    unint64_t v296 = v295;
    v213[139] = sub_10000B540(v294, v295, v901);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v213 + 139, v700, v288 + 14, v288 + 22);
    swift_bridgeObjectRelease(v296);
    v292(v285, v287);
    _os_log_impl( (void *)&_mh_execute_header,  v278,  typed,  "Task %s starting with extension: %s",  (uint8_t *)v288,  0x16u);
    swift_arrayDestroy(v718, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v718, -1LL, -1LL);
    swift_slowDealloc(v288, -1LL, -1LL);

    uint64_t v297 = *(uint64_t (**)(uint64_t, uint64_t))(v282 + 8);
    uint64_t v298 = v297(v884, v853);
  }

  else
  {
    uint64_t v292 = *(uint64_t (**)(uint64_t, uint64_t))(v286 + 8);
    v292(v213[192], v213[180]);
    v292(v285, v287);

    uint64_t v297 = *(uint64_t (**)(uint64_t, uint64_t))(v282 + 8);
    uint64_t v298 = v297(v281, v283);
  }

  v752 = v213 + 98;
  v213[223] = v292;
  v213[222] = v297;
  uint64_t v885 = v213[194];
  uint64_t v299 = v213[180];
  uint64_t v300 = v213[179];
  uint64_t v301 = v213[178];
  uint64_t v302 = v213[177];
  uint64_t v303 = v213[145];
  uint64_t v304 = v213[144];
  v213[224] = *(void *)(v303 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v305 = MLHostTask.name.getter(v298);
  uint64_t v307 = v306;
  v724(v300, v727, v302);
  sub_100013D50(v305, v307, v300);
  swift_bridgeObjectRelease(v307);
  uint64_t v308 = *(uint64_t (**)(uint64_t, uint64_t))(v301 + 8);
  v213[225] = v308;
  uint64_t v309 = v308(v300, v302);
  static ContinuousClock.now.getter(v309);
  v866(v885, v304, v299);
  unint64_t v310 = (unint64_t)(aBlock + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v311 = (v310 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v312 = swift_allocObject(&unk_1000560D0, v311 + 8, v740);
  v735(v312 + v746, v885, v299);
  *(void *)&aBlock[v312] = v826;
  *(void *)(v312 + v310) = loga;
  *(void *)(v312 + v311) = v303;
  v213[12] = sub_10003EC24;
  v213[13] = v312;
  v213[8] = _NSConcreteStackBlock;
  v213[9] = 1107296256LL;
  v213[10] = sub_1000210C0;
  v213[11] = &unk_1000560E8;
  uint64_t v313 = _Block_copy(v900 + 8);
  uint64_t v314 = v213[13];
  swift_retain(v826);
  swift_retain(loga);
  swift_retain(v303);
  swift_release(v314);
  [v810 shouldRunWithContext:v840 reply:v313];
  _Block_release(v313);
  uint64_t v315 = swift_allocObject(&unk_100056120, 32LL, 7LL);
  v213[226] = v315;
  *(void *)(v315 + 16) = 0LL;
  *(void *)(v315 + 24) = 0LL;
  swift_beginAccess(v794, v900 + 54, 0LL, 0LL);
  if ((*v794 & 1) != 0
    || (swift_beginAccess(v710, v213 + 57, 0LL, 0LL),
        swift_beginAccess(v794, v213 + 60, 0LL, 0LL),
        *(_BYTE *)(v213[221] + 16LL) != 2)
    || (uint64_t v316 = static Duration.< infix(_:_:)(0xA055690D9DB80000LL, 1LL, 0LL, 0LL), (v316 & 1) != 0))
  {
    uint64_t v317 = v213[146];
    swift_beginAccess(v317 + 16, v213 + 69, 0LL, 0LL);
    if ((*(_BYTE *)(v317 + 16) & 1) == 0)
    {
      uint64_t v318 = v213[221];
      uint64_t v319 = swift_beginAccess(v318 + 16, v213 + 72, 0LL, 0LL);
      if (*(_BYTE *)(v318 + 16) == 2)
      {
        v854 = v213 + 128;
        v870 = v213 + 129;
        unint64_t v320 = (void (*)(uint64_t, void, uint64_t))v213[217];
        v886 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v213[212];
        uint64_t v321 = v213[210];
        uint64_t v322 = v213[201];
        uint64_t v323 = v213[199];
        v796 = (void (*)(uint64_t, uint64_t))v213[225];
        uint64_t v811 = v213[183];
        uint64_t v827 = v213[180];
        v841 = (void (*)(uint64_t, uint64_t, uint64_t))v213[211];
        uint64_t v324 = v213[179];
        uint64_t v325 = v900[177];
        uint64_t v326 = v900[144];
        uint64_t v327 = MLHostTask.name.getter(v319);
        uint64_t v329 = v328;
        v320(v324, enum case for TaskStatus.taskFailed(_:), v325);
        sub_100013D50(v327, v329, v324);
        swift_bridgeObjectRelease(v329);
        uint64_t v330 = v325;
        os_log_t v331 = v900;
        v796(v324, v330);
        v841(v322, v321, v323);
        uint64_t v332 = v886(v811, v326, v827);
        v333 = (os_log_s *)Logger.logObject.getter(v332);
        os_log_type_t v334 = static os_log_type_t.error.getter();
        BOOL v335 = os_log_type_enabled(v333, v334);
        unsigned int v336 = (void (*)(uint64_t, uint64_t))v900[223];
        unsigned int v337 = (void (*)(uint64_t, uint64_t))v900[222];
        uint64_t v338 = v900[201];
        uint64_t v339 = v900[199];
        uint64_t v340 = v900[183];
        uint64_t v341 = v900[180];
        if (v335)
        {
          v887 = (void (*)(uint64_t, uint64_t))v900[222];
          uint64_t v842 = v900[201];
          v342 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v828 = v339;
          uint64_t v343 = swift_slowAlloc(32LL, -1LL);
          v901[0] = v343;
          *(_DWORD *)v342 = 136315138;
          uint64_t v344 = MLHostTask.name.getter(v343);
          unint64_t v346 = v345;
          uint64_t *v854 = sub_10000B540(v344, v345, v901);
          os_log_t v331 = v900;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v854, v870, v342 + 4, v342 + 12);
          swift_bridgeObjectRelease(v346);
          v336(v340, v341);
          _os_log_impl( (void *)&_mh_execute_header,  v333,  v334,  "Task %s has been in shouldRun for too long. Marking task as failed and terminating process.",  v342,  0xCu);
          swift_arrayDestroy(v343, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v343, -1LL, -1LL);
          swift_slowDealloc(v342, -1LL, -1LL);

          v887(v842, v828);
        }

        else
        {
          v336(v900[183], v900[180]);

          v337(v338, v339);
        }

        uint64_t v791 = v331[226];
        uint64_t v801 = v331[221];
        uint64_t v815 = v331[220];
        v429 = (void *)v900[219];
        uint64_t v430 = v900[218];
        v431 = (void *)v900[213];
        uint64_t v389 = v900[176];
        uint64_t v831 = v900[215];
        uint64_t v845 = v900[175];
        uint64_t v857 = v900[174];
        uint64_t v432 = v900[159];
        uint64_t v433 = v900[153];
        uint64_t v434 = v900[152];
        uint64_t v873 = v900[146];
        uint64_t v890 = v900[209];
        id v435 = [v431 processIdentifier];
        v901[0] = 0LL;
        v901[1] = 0xE000000000000000LL;
        _StringGuts.grow(_:)(43LL);
        v436._uint64_t countAndFlagsBits = 0x206B736154LL;
        v436._object = (void *)0xE500000000000000LL;
        String.append(_:)(v436);
        v438._uint64_t countAndFlagsBits = MLHostTask.name.getter(v437);
        v439 = v438._object;
        String.append(_:)(v438);
        swift_bridgeObjectRelease(v439);
        v440._uint64_t countAndFlagsBits = 0xD000000000000024LL;
        v440._object = (void *)0x800000010004A4E0LL;
        String.append(_:)(v440);
        uint64_t v441 = v901[1];
        sub_1000305D8((uint64_t)v435, v901[0], v901[1]);
        swift_bridgeObjectRelease(v441);

        id v2 = v900;
        swift_unknownObjectRelease(v430);
        (*(void (**)(uint64_t, uint64_t))(v433 + 8))(v432, v434);
        swift_release(v791);
        swift_release(v801);
        swift_release(v815);
        swift_release(v831);
        [v431 invalidate];

LABEL_74:
        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v845 + 8))(v389, v857);
        swift_unknownObjectRelease(v890);
        uint64_t v108 = v873;
LABEL_36:
        swift_release_n(v108, 2LL);
        v879 = 0LL;
        goto LABEL_37;
      }
    }

    uint64_t v347 = v213 + 123;
    uint64_t v348 = (uint64_t)v213 + 1900;
    v349 = v213 + 126;
    uint64_t v350 = v213[221];
    swift_beginAccess(v350 + 16, v213 + 78, 0LL, 0LL);
    int v351 = *(unsigned __int8 *)(v350 + 16);
    uint64_t v352 = v213[180];
    uint64_t v353 = v213[144];
    if (v351 == 2)
    {
      uint64_t v354 = ((uint64_t (*)(void, uint64_t, uint64_t))v213[212])(v213[190], v353, v352);
      v355 = (os_log_s *)Logger.logObject.getter(v354);
      os_log_type_t v356 = static os_log_type_t.info.getter(v355);
      if (os_log_type_enabled(v355, v356))
      {
        v812 = v213 + 84;
        v855 = v213 + 238;
        v871 = v213 + 90;
        uint64_t v357 = v900[226];
        v788 = (void (*)(uint64_t, os_log_t))v900[223];
        uint64_t v358 = v900[190];
        os_log_t logd = (os_log_t)v900[180];
        v797 = (unsigned __int8 *)(v900[146] + 16LL);
        uint64_t v888 = v348;
        uint64_t v359 = swift_slowAlloc(28LL, -1LL);
        uint64_t v360 = swift_slowAlloc(64LL, -1LL);
        v901[0] = v360;
        *(_DWORD *)uint64_t v359 = 136315650;
        uint64_t v361 = MLHostTask.name.getter(v360);
        v843 = v347;
        unint64_t v363 = v362;
        v900[125] = sub_10000B540(v361, v362, v901);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v758, v349, v359 + 4, v359 + 12);
        swift_retain(v357);
        swift_bridgeObjectRelease(v363);
        v788(v358, logd);
        *(_WORD *)(v359 + 12) = 1024;
        swift_beginAccess(v797, v812, 0LL, 0LL);
        *((_DWORD *)v900 + 475) = *v797;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v888, v855, v359 + 14, v359 + 18);
        *(_WORD *)(v359 + 18) = 2080;
        swift_beginAccess(v357 + 16, v871, 0LL, 0LL);
        uint64_t v364 = Duration.description.getter(*(void *)(v357 + 16), *(void *)(v357 + 24));
        unint64_t v366 = v365;
        v900[123] = sub_10000B540(v364, v365, v901);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v843, v762, v359 + 20, v359 + 28);
        swift_bridgeObjectRelease(v366);
        uint64_t v367 = v357;
        uint64_t v213 = v900;
        swift_release(v367);
        _os_log_impl( (void *)&_mh_execute_header,  v355,  v356,  "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.",  (uint8_t *)v359,  0x1Cu);
        swift_arrayDestroy(v360, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v360, -1LL, -1LL);
        swift_slowDealloc(v359, -1LL, -1LL);
      }

      else
      {
        ((void (*)(void, void))v213[223])(v213[190], v213[180]);
      }

      uint64_t v790 = v213[226];
      uint64_t v384 = (void (*)(uint64_t, uint64_t))v213[225];
      uint64_t v799 = v900[221];
      uint64_t v830 = v900[220];
      v764 = (void *)v900[219];
      os_log_t loge = (os_log_t)v900[218];
      uint64_t v385 = (void (*)(uint64_t, void, uint64_t))v900[217];
      uint64_t v813 = v900[215];
      v386 = (void *)v900[213];
      uint64_t v890 = v900[209];
      uint64_t v387 = v900[179];
      uint64_t v388 = v900[177];
      uint64_t v389 = v900[176];
      uint64_t v845 = v900[175];
      uint64_t v857 = v900[174];
      uint64_t v770 = v900[159];
      uint64_t v756 = v900[153];
      uint64_t v760 = v900[152];
      uint64_t v873 = v900[146];
      uint64_t v391 = MLHostTask.name.getter(v390);
      uint64_t v393 = v392;
      v385(v387, enum case for TaskStatus.taskDeferred(_:), v388);
      id v2 = v900;
      sub_100013D50(v391, v393, v387);
      swift_bridgeObjectRelease(v393);
      v384(v387, v388);
      id v394 = [v386 processIdentifier];
      v901[0] = 0LL;
      v901[1] = 0xE000000000000000LL;
      _StringGuts.grow(_:)(37LL);
      v395._uint64_t countAndFlagsBits = 0x206B736154LL;
      v395._object = (void *)0xE500000000000000LL;
      String.append(_:)(v395);
      v397._uint64_t countAndFlagsBits = MLHostTask.name.getter(v396);
      v398 = v397._object;
      String.append(_:)(v397);
      swift_bridgeObjectRelease(v398);
      v399._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      v399._object = (void *)0x800000010004A510LL;
      String.append(_:)(v399);
      uint64_t v400 = v901[1];
      sub_1000305D8((uint64_t)v394, v901[0], v901[1]);

      swift_bridgeObjectRelease(v400);
      swift_unknownObjectRelease(loge);
      (*(void (**)(uint64_t, uint64_t))(v756 + 8))(v770, v760);
      swift_release(v790);
      swift_release(v799);
      swift_release(v830);
      swift_release(v813);
      [v386 invalidate];

      goto LABEL_74;
    }

    v829 = v213 + 119;
    uint64_t v368 = (uint64_t (*)(void, uint64_t, uint64_t))v213[212];
    if ((v351 & 1) == 0)
    {
      v872 = v213 + 93;
      uint64_t v369 = v368(v213[188], v353, v352);
      uint64_t v370 = (os_log_s *)Logger.logObject.getter(v369);
      os_log_type_t v371 = static os_log_type_t.info.getter(v370);
      if (os_log_type_enabled(v370, v371))
      {
        v844 = v213 + 75;
        v856 = v213 + 115;
        v798 = v213 + 237;
        uint64_t v372 = v213[226];
        v789 = (void (*)(uint64_t, uint64_t))v213[223];
        uint64_t v373 = v213[188];
        uint64_t v374 = v213[180];
        uint64_t v889 = (uint64_t)v213 + 1900;
        uint64_t v375 = swift_slowAlloc(28LL, -1LL);
        uint64_t v376 = swift_slowAlloc(64LL, -1LL);
        v901[0] = v376;
        *(_DWORD *)uint64_t v375 = 136315650;
        uint64_t v377 = MLHostTask.name.getter(v376);
        unint64_t v379 = v378;
        v900[118] = sub_10000B540(v377, v378, v901);
        v380 = v213 + 118;
        uint64_t v213 = v900;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v380, v829, v375 + 4, v375 + 12);
        swift_retain(v372);
        swift_bridgeObjectRelease(v379);
        v789(v373, v374);
        *(_WORD *)(v375 + 12) = 1024;
        *((_DWORD *)v900 + 474) = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v798, v889, v375 + 14, v375 + 18);
        *(_WORD *)(v375 + 18) = 2080;
        swift_beginAccess(v372 + 16, v844, 0LL, 0LL);
        uint64_t v381 = Duration.description.getter(*(void *)(v372 + 16), *(void *)(v372 + 24));
        unint64_t v383 = v382;
        v900[115] = sub_10000B540(v381, v382, v901);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v856, v768, v375 + 20, v375 + 28);
        swift_bridgeObjectRelease(v383);
        swift_release(v372);
        _os_log_impl( (void *)&_mh_execute_header,  v370,  v371,  "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.",  (uint8_t *)v375,  0x1Cu);
        swift_arrayDestroy(v376, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v376, -1LL, -1LL);
        swift_slowDealloc(v375, -1LL, -1LL);
      }

      else
      {
        ((void (*)(void, void))v213[223])(v213[188], v213[180]);
      }

      v442 = (uint64_t (*)(uint64_t, uint64_t))v213[225];
      uint64_t v772 = v213[226];
      os_log_t logf = (os_log_t)v213[221];
      uint64_t v443 = v213[220];
      v757 = (void *)v213[219];
      uint64_t v892 = v213[218];
      v444 = (void (*)(uint64_t, void, uint64_t))v213[217];
      uint64_t v792 = v213[215];
      v445 = (void *)v900[213];
      uint64_t v859 = v900[209];
      uint64_t v446 = v900[179];
      uint64_t v447 = v900[177];
      uint64_t v802 = v900[176];
      uint64_t v816 = v900[175];
      uint64_t v832 = v900[174];
      uint64_t v766 = v900[159];
      uint64_t v748 = v900[153];
      uint64_t v753 = v900[152];
      uint64_t v847 = v900[146];
      uint64_t v449 = MLHostTask.name.getter(v448);
      uint64_t v451 = v450;
      v444(v446, enum case for TaskStatus.taskFailed(_:), v447);
      sub_100013D50(v449, v451, v446);
      swift_bridgeObjectRelease(v451);
      uint64_t v452 = v442(v446, v447);
      uint64_t v453 = MLHostTask.name.getter(v452);
      uint64_t v455 = v454;
      sub_100013A80(v453, v454);
      swift_bridgeObjectRelease(v455);
      id v456 = [v445 processIdentifier];
      v901[0] = 0LL;
      v901[1] = 0xE000000000000000LL;
      _StringGuts.grow(_:)(27LL);
      v457._uint64_t countAndFlagsBits = 0x206B736154LL;
      v457._object = (void *)0xE500000000000000LL;
      String.append(_:)(v457);
      v459._uint64_t countAndFlagsBits = MLHostTask.name.getter(v458);
      v460 = v459._object;
      String.append(_:)(v459);
      swift_bridgeObjectRelease(v460);
      v461._uint64_t countAndFlagsBits = 0xD000000000000014LL;
      v461._object = (void *)0x800000010004A530LL;
      String.append(_:)(v461);
      uint64_t v462 = v901[1];
      sub_1000305D8((uint64_t)v456, v901[0], v901[1]);

      swift_bridgeObjectRelease(v462);
      swift_unknownObjectRelease(v892);
      (*(void (**)(uint64_t, uint64_t))(v748 + 8))(v766, v753);
      swift_beginAccess(v443 + 16, v872, 0LL, 0LL);
      v879 = *(void **)(v443 + 16);
      id v463 = v879;
      swift_release(v772);
      swift_release(logf);
      swift_release(v443);
      swift_release(v792);
      [v445 invalidate];

      id v2 = v900;
      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v816 + 8))(v802, v832);
      swift_unknownObjectRelease(v859);
      uint64_t v21 = v847;
      goto LABEL_26;
    }

    type = v213 + 126;
    v874 = v213 + 129;
    v800 = v213 + 51;
    v814 = v213 + 2;
    os_log_t logb = (os_log_t)(v213 + 63);
    v891 = v213 + 66;
    v401 = v213 + 105;
    uint64_t v402 = v368(v213[189], v353, v352);
    uint64_t v403 = (os_log_s *)Logger.logObject.getter(v402);
    os_log_type_t v404 = static os_log_type_t.info.getter(v403);
    v703 = v213 + 118;
    v846 = v213 + 123;
    v711 = v213 + 105;
    v858 = v213 + 128;
    if (os_log_type_enabled(v403, v404))
    {
      v765 = v213 + 45;
      v771 = v213 + 137;
      uint64_t v405 = v213[226];
      v741 = (void (*)(uint64_t, uint64_t))v213[223];
      uint64_t v747 = (uint64_t)v213 + 836;
      uint64_t v406 = v213[189];
      uint64_t v407 = v213[180];
      uint64_t v408 = swift_slowAlloc(28LL, -1LL);
      uint64_t v409 = swift_slowAlloc(64LL, -1LL);
      v901[0] = v409;
      *(_DWORD *)uint64_t v408 = 136315650;
      uint64_t v410 = MLHostTask.name.getter(v409);
      unint64_t v412 = v411;
      v900[134] = sub_10000B540(v410, v411, v901);
      uint64_t v213 = v900;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v696, v698, v408 + 4, v408 + 12);
      swift_retain(v405);
      swift_bridgeObjectRelease(v412);
      v741(v406, v407);
      *(_WORD *)(v408 + 12) = 1024;
      *((_DWORD *)v900 + 209) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v747, v401, v408 + 14, v408 + 18);
      *(_WORD *)(v408 + 18) = 2080;
      swift_beginAccess(v405 + 16, v765, 0LL, 0LL);
      uint64_t v413 = Duration.description.getter(*(void *)(v405 + 16), *(void *)(v405 + 24));
      unint64_t v415 = v414;
      v900[137] = sub_10000B540(v413, v414, v901);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v771, v714, v408 + 20, v408 + 28);
      swift_bridgeObjectRelease(v415);
      swift_release(v405);
      _os_log_impl( (void *)&_mh_execute_header,  v403,  v404,  "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.",  (uint8_t *)v408,  0x1Cu);
      swift_arrayDestroy(v409, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v409, -1LL, -1LL);
      swift_slowDealloc(v408, -1LL, -1LL);
    }

    else
    {
      ((void (*)(void, void))v213[223])(v213[189], v213[180]);
    }

    uint64_t v464 = v213[220];
    v767 = (void *)v213[218];
    uint64_t v773 = v213[219];
    v465 = (void (*)(uint64_t, uint64_t, uint64_t))v213[217];
    uint64_t v466 = *((unsigned int *)v213 + 477);
    uint64_t v467 = v900[216];
    v742 = (void *)v900[215];
    v736 = (void (*)(uint64_t, uint64_t, uint64_t))v900[214];
    uint64_t v468 = *((unsigned __int8 *)v900 + 1904);
    v728 = (void (*)(uint64_t, uint64_t, uint64_t))v900[212];
    uint64_t v725 = v900[194];
    uint64_t v722 = v900[180];
    uint64_t v469 = v900[179];
    uint64_t v470 = v900[178];
    uint64_t v471 = v900[177];
    aBlockc = (void *)v900[145];
    uint64_t v472 = (v468 + 16) & ~v468;
    unint64_t v473 = (v900[182] + v472 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v474 = (v473 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v475 = (v474 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v715 = v900[144];
    uint64_t v719 = v468 | 7;
    v749 = (_BYTE *)(v900[146] + 16LL);
    v465(v469, v466, v471);
    swift_beginAccess(v467, logb, 1LL, 0LL);
    uint64_t v476 = v467;
    v477 = v900;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v470 + 40))(v476, v469, v471);
    swift_beginAccess(v464 + 16, v800, 1LL, 0LL);
    v478 = *(void **)(v464 + 16);
    *(void *)(v464 + 16) = 0LL;

    v728(v725, v715, v722);
    uint64_t v479 = swift_allocObject(&unk_100056148, v475 + 8, v719);
    v736(v479 + v472, v725, v722);
    *(void *)(v479 + v473) = v464;
    *(void *)(v479 + v474) = v742;
    *(void *)(v479 + v475) = aBlockc;
    v900[6] = sub_10003ECE0;
    v900[7] = v479;
    v900[2] = _NSConcreteStackBlock;
    v900[3] = 1107296256LL;
    v900[4] = sub_1000210C0;
    v900[5] = &unk_100056160;
    v480 = _Block_copy(v814);
    uint64_t v481 = v900[7];
    swift_retain(v742);
    swift_retain(v464);
    swift_retain(aBlockc);
    swift_release(v481);
    [v767 doWorkWithContext:v773 reply:v480];
    _Block_release(v480);
    uint64_t v482 = swift_beginAccess(v749, v891, 0LL, 0LL);
    if (*v749 == 1)
    {
      uint64_t v483 = v900[220];
    }

    else
    {
      uint64_t v482 = swift_beginAccess(v900[146] + 16LL, v900 + 81, 0LL, 0LL);
      uint64_t v483 = v900[220];
      if (!*(void *)(v483 + 16))
      {
        uint64_t v572 = v900[158];
        uint64_t v573 = v900[153];
        uint64_t v574 = v900[152];
        uint64_t v575 = v900[147];
        ContinuousClock.init()(v482);
        v900[111] = 500000000000000000LL;
        v900[112] = 0LL;
        *(_OWORD *)(v900 + 99) = 0u;
        v752[24] = 1;
        uint64_t v576 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
        dispatch thunk of Clock.now.getter(v575, v576);
        uint64_t v577 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
        dispatch thunk of InstantProtocol.advanced(by:)(v900 + 111, v574, v577);
        v578 = *(void (**)(uint64_t, uint64_t))(v573 + 8);
        v900[231] = v578;
        v578(v572, v574);
        v579 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
        v900[232] = v579;
        void *v579 = v900;
        v579[1] = sub_100036C4C;
        uint64_t v425 = v900[147];
        uint64_t v427 = v900[155];
        v426 = v900 + 99;
        uint64_t v428 = v576;
        return dispatch thunk of Clock.sleep(until:tolerance:)(v427, v426, v425, v428);
      }
    }

    uint64_t v484 = v900[158];
    uint64_t v485 = v900[153];
    uint64_t v486 = v900[152];
    static ContinuousClock.now.getter(v482);
    uint64_t v487 = ContinuousClock.Instant.duration(to:)(v484);
    uint64_t v489 = v488;
    v490 = *(void (**)(uint64_t, uint64_t))(v485 + 8);
    v900[227] = v490;
    v490(v484, v486);
    v491 = *(void **)(v483 + 16);
    v492 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v900[212];
    if (v491)
    {
      v848 = v490;
      v492(v900[187], v900[144], v900[180]);
      id v860 = v491;
      v493 = (os_log_s *)Logger.logObject.getter(v860);
      os_log_type_t v494 = static os_log_type_t.info.getter(v493);
      BOOL v495 = os_log_type_enabled(v493, v494);
      v496 = (void (*)(uint64_t, uint64_t))v900[223];
      uint64_t v497 = v900[187];
      uint64_t v498 = v900[180];
      v879 = v491;
      if (v495)
      {
        os_log_type_t v803 = v494;
        uint64_t v499 = swift_slowAlloc(32LL, -1LL);
        v793 = (void *)swift_slowAlloc(8LL, -1LL);
        uint64_t v833 = swift_slowAlloc(64LL, -1LL);
        v901[0] = v833;
        *(_DWORD *)uint64_t v499 = 136315650;
        uint64_t v500 = MLHostTask.name.getter(v833);
        logg = v493;
        unint64_t v502 = v501;
        uint64_t *v874 = sub_10000B540(v500, v501, v901);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v874, v900 + 130, v499 + 4, v499 + 12);
        swift_bridgeObjectRelease(v502);
        v496(v497, v498);
        *(_WORD *)(v499 + 12) = 2080;
        uint64_t v503 = Duration.description.getter(v487, v489);
        unint64_t v505 = v504;
        v900[130] = sub_10000B540(v503, v504, v901);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v900 + 130, v900 + 131, v499 + 14, v499 + 22);
        swift_bridgeObjectRelease(v505);
        *(_WORD *)(v499 + 22) = 2112;
        v900[131] = v860;
        id v506 = v860;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v900 + 131, v754, v499 + 24, v499 + 32);
        void *v793 = v491;

        _os_log_impl( (void *)&_mh_execute_header,  logg,  v803,  "Task %s completed after %s. TaskResult: %@",  (uint8_t *)v499,  0x20u);
        uint64_t v507 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v793, 1LL, v507);
        swift_slowDealloc(v793, -1LL, -1LL);
        swift_arrayDestroy(v833, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v833, -1LL, -1LL);
        swift_slowDealloc(v499, -1LL, -1LL);
      }

      else
      {
        v496(v497, v498);
      }

      v531 = (uint64_t (*)(uint64_t, uint64_t))v900[225];
      uint64_t v532 = v900[216];
      uint64_t v533 = v900[179];
      uint64_t v534 = v900[178];
      uint64_t v535 = v900[177];
      uint64_t v536 = MLHostTask.name.getter(v508);
      uint64_t v538 = v537;
      v876 = *(void (**)(uint64_t, uint64_t, uint64_t))(v534 + 16);
      v876(v533, v532, v535);
      sub_100013D50(v536, v538, v533);
      swift_bridgeObjectRelease(v538);
      uint64_t v539 = v531(v533, v535);
      uint64_t v540 = MLHostTask.name.getter(v539);
      uint64_t v542 = v541;
      sub_100013A80(v540, v541);
      uint64_t v543 = swift_bridgeObjectRelease(v542);
      uint64_t v544 = MLHostResult.status.getter(v543);
      uint64_t v545 = MLHostResultStatus.rawValue.getter(v544);
      uint64_t v546 = MLHostResultStatus.rawValue.getter(1LL);
      uint64_t v547 = v900[226];
      id v2 = v900;
      if (v545 == v546)
      {
        uint64_t v548 = v900[221];
        v549 = (void *)v900[219];
        uint64_t v550 = v900[218];
        v848(v900[159], v900[152]);

        swift_unknownObjectRelease(v550);
      }

      else
      {
        v551 = (void (*)(uint64_t, uint64_t))v900[225];
        uint64_t v548 = v900[221];
        uint64_t v861 = v900[218];
        uint64_t v552 = v900[216];
        uint64_t v553 = v900[179];
        uint64_t v554 = v900[177];
        uint64_t v834 = v900[159];
        v805 = (void *)v900[219];
        uint64_t v818 = v900[152];
        id v555 = [(id)v900[213] processIdentifier];
        v901[0] = 0LL;
        v901[1] = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        uint64_t v556 = v901[1];
        v900[105] = v901[0];
        v900[106] = v556;
        v557._uint64_t countAndFlagsBits = 0x206B736154LL;
        v557._object = (void *)0xE500000000000000LL;
        String.append(_:)(v557);
        v559._uint64_t countAndFlagsBits = MLHostTask.name.getter(v558);
        v560 = v559._object;
        String.append(_:)(v559);
        swift_bridgeObjectRelease(v560);
        v561._object = (void *)0x800000010004A570LL;
        v561._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v561);
        v876(v553, v552, v554);
        _print_unlocked<A, B>(_:_:)( v553,  v711,  v554,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        uint64_t v562 = v554;
        id v2 = v900;
        v551(v553, v562);
        v563._uint64_t countAndFlagsBits = 46LL;
        v563._object = (void *)0xE100000000000000LL;
        String.append(_:)(v563);
        uint64_t v564 = v900[106];
        sub_1000305D8((uint64_t)v555, v2[105], v2[106]);

        swift_bridgeObjectRelease(v564);
        swift_unknownObjectRelease(v861);
        v848(v834, v818);
      }

      swift_release(v547);
      swift_release(v548);
      uint64_t v565 = v2[215];
      v566 = (void *)v2[213];
      uint64_t v567 = v2[209];
      uint64_t v568 = v2[176];
      uint64_t v569 = v2[175];
      uint64_t v570 = v2[174];
      uint64_t v571 = v2[146];
      swift_release(v2[220]);
      swift_release(v565);
      [v566 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v569 + 8))(v568, v570);
      swift_unknownObjectRelease(v567);
      uint64_t v21 = v571;
      goto LABEL_26;
    }

    uint64_t v893 = v487;
    uint64_t v817 = v489;
    uint64_t v509 = v900[186];
    uint64_t v510 = v900[180];
    uint64_t v511 = v900[144];
    ((void (*)(void, void, void))v900[211])(v900[203], v900[210], v900[199]);
    uint64_t v512 = v492(v509, v511, v510);
    v513 = (os_log_s *)Logger.logObject.getter(v512);
    os_log_type_t v514 = static os_log_type_t.info.getter(v513);
    BOOL v515 = os_log_type_enabled(v513, v514);
    v516 = (void (*)(uint64_t, uint64_t))v900[223];
    v517 = (uint64_t (*)(uint64_t, os_log_s *))v900[222];
    uint64_t v518 = v900[203];
    v519 = (os_log_s *)v900[199];
    uint64_t v520 = v900[186];
    uint64_t v521 = v900[180];
    if (v515)
    {
      v875 = (uint64_t (*)(uint64_t, os_log_t))v900[222];
      uint64_t v804 = v900[203];
      uint64_t v522 = swift_slowAlloc(22LL, -1LL);
      uint64_t v523 = swift_slowAlloc(64LL, -1LL);
      v901[0] = v523;
      *(_DWORD *)uint64_t v522 = 136315394;
      uint64_t v524 = MLHostTask.name.getter(v523);
      os_log_t logh = v519;
      unint64_t v526 = v525;
      uint64_t *type = sub_10000B540(v524, v525, v901);
      v477 = v900;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(type, v900 + 127, v522 + 4, v522 + 12);
      swift_bridgeObjectRelease(v526);
      v516(v520, v521);
      *(_WORD *)(v522 + 12) = 2080;
      uint64_t v527 = Duration.description.getter(v893, v817);
      unint64_t v529 = v528;
      v900[127] = sub_10000B540(v527, v528, v901);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v900 + 127, v858, v522 + 14, v522 + 22);
      swift_bridgeObjectRelease(v529);
      _os_log_impl( (void *)&_mh_execute_header,  v513,  v514,  "Task %s asked to terminate because of deferral after %s.",  (uint8_t *)v522,  0x16u);
      swift_arrayDestroy(v523, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v523, -1LL, -1LL);
      swift_slowDealloc(v522, -1LL, -1LL);

      uint64_t v530 = v875(v804, logh);
    }

    else
    {
      v516(v900[186], v900[180]);

      uint64_t v530 = v517(v518, v519);
    }

    uint64_t v580 = v477[220];
    v581 = (void *)v477[218];
    static ContinuousClock.now.getter(v530);
    uint64_t v582 = swift_allocObject(&unk_100056120, 32LL, 7LL);
    v477[228] = v582;
    *(void *)(v582 + 16) = 0LL;
    *(void *)(v582 + 24) = 0LL;
    [v581 doStop];
    v583 = *(void **)(v580 + 16);
    if (v583) {
      goto LABEL_94;
    }
    uint64_t v602 = static Duration.< infix(_:_:)(5000000000000000000LL, 0LL, 0LL, 0LL);
    if ((v602 & 1) != 0)
    {
      v583 = *(void **)(v477[220] + 16LL);
      if (!v583)
      {
        v877 = v477 + 122;
        loguint64_t i = (os_log_t)v477[225];
        v603 = (void (*)(uint64_t, void, uint64_t))v477[217];
        v895 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v477[212];
        v862 = (void (*)(uint64_t, uint64_t, uint64_t))v477[211];
        uint64_t v774 = v477[210];
        uint64_t v604 = v477[202];
        uint64_t v605 = v477[199];
        uint64_t v806 = v477[185];
        uint64_t v819 = v477[180];
        uint64_t v606 = v477[179];
        uint64_t v607 = v477[177];
        uint64_t v608 = v477[144];
        uint64_t v609 = MLHostTask.name.getter(v602);
        uint64_t v611 = v610;
        v603(v606, enum case for TaskStatus.taskDeferred(_:), v607);
        sub_100013D50(v609, v611, v606);
        swift_bridgeObjectRelease(v611);
        ((void (*)(uint64_t, uint64_t))logi)(v606, v607);
        v862(v604, v774, v605);
        uint64_t v612 = v895(v806, v608, v819);
        v613 = (os_log_s *)Logger.logObject.getter(v612);
        os_log_type_t v614 = static os_log_type_t.error.getter();
        BOOL v615 = os_log_type_enabled(v613, v614);
        v616 = (void (*)(uint64_t, uint64_t))v477[223];
        v896 = (void (*)(uint64_t, uint64_t))v477[222];
        uint64_t v863 = v477[202];
        uint64_t v820 = v477[199];
        uint64_t v617 = v477[185];
        uint64_t v618 = v477[180];
        if (v615)
        {
          v619 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v620 = swift_slowAlloc(32LL, -1LL);
          v901[0] = v620;
          *(_DWORD *)v619 = 136315138;
          uint64_t v621 = MLHostTask.name.getter(v620);
          unint64_t v623 = v622;
          uint64_t *v877 = sub_10000B540(v621, v622, v901);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v877, v846, v619 + 4, v619 + 12);
          swift_bridgeObjectRelease(v623);
          v616(v617, v618);
          _os_log_impl( (void *)&_mh_execute_header,  v613,  v614,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v619,  0xCu);
          swift_arrayDestroy(v620, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v620, -1LL, -1LL);
          swift_slowDealloc(v619, -1LL, -1LL);
        }

        else
        {
          v616(v477[185], v477[180]);
        }

        v896(v863, v820);
        id v2 = v900;
        id v686 = [(id)v900[213] processIdentifier];
        v901[0] = 0LL;
        v901[1] = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        v687._uint64_t countAndFlagsBits = 0x206B736154LL;
        v687._object = (void *)0xE500000000000000LL;
        String.append(_:)(v687);
        v689._uint64_t countAndFlagsBits = MLHostTask.name.getter(v688);
        v690 = v689._object;
        String.append(_:)(v689);
        swift_bridgeObjectRelease(v690);
        v691._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v691._object = (void *)0x800000010004A550LL;
        String.append(_:)(v691);
        uint64_t v692 = v901[1];
        sub_1000305D8((uint64_t)v686, v901[0], v901[1]);
        swift_bridgeObjectRelease(v692);
LABEL_102:
        uint64_t v636 = v2[220];
        ((void (*)(void, void, void))v2[212])(v2[184], v2[144], v2[180]);
        uint64_t v637 = swift_retain_n(v636, 2LL);
        v638 = (os_log_s *)Logger.logObject.getter(v637);
        os_log_type_t v639 = static os_log_type_t.info.getter(v638);
        BOOL v640 = os_log_type_enabled(v638, v639);
        v641 = (void (*)(uint64_t, uint64_t))v2[223];
        uint64_t v898 = v2[220];
        if (v640)
        {
          uint64_t v642 = v2[228];
          uint64_t v643 = v2[184];
          uint64_t v775 = v2[180];
          uint64_t v644 = swift_slowAlloc(32LL, -1LL);
          v849 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v864 = swift_slowAlloc(64LL, -1LL);
          v901[0] = v864;
          *(_DWORD *)uint64_t v644 = 136315650;
          uint64_t v645 = MLHostTask.name.getter(v864);
          unint64_t v647 = v646;
          v2[117] = sub_10000B540(v645, v646, v901);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v786, v703, v644 + 4, v644 + 12);
          swift_retain(v642);
          swift_bridgeObjectRelease(v647);
          v641(v643, v775);
          *(_WORD *)(v644 + 12) = 2080;
          swift_beginAccess(v642 + 16, v2 + 87, 0LL, 0LL);
          uint64_t v648 = Duration.description.getter(*(void *)(v642 + 16), *(void *)(v642 + 24));
          unint64_t v650 = v649;
          v2[119] = sub_10000B540(v648, v649, v901);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v829, v2 + 120, v644 + 14, v644 + 22);
          swift_bridgeObjectRelease(v650);
          swift_release(v642);
          *(_WORD *)(v644 + 22) = 2112;
          v651 = *(void **)(v898 + 16);
          if (v651)
          {
            v2[121] = v651;
            id v652 = v651;
            v653 = v2 + 121;
            v654 = v877;
            uint64_t v655 = v644 + 24;
            uint64_t v656 = v644 + 32;
          }

          else
          {
            uint64_t v656 = v644 + 32;
            v2[120] = 0LL;
            v653 = v2 + 120;
            v654 = v2 + 121;
            uint64_t v655 = v644 + 24;
          }

          UnsafeMutableRawBufferPointer.copyMemory(from:)(v653, v654, v655, v656);
          id v2 = v900;
          v670 = (void (*)(uint64_t, uint64_t))v900[227];
          uint64_t v671 = v900[220];
          v672 = (void *)v900[219];
          uint64_t v673 = v900[218];
          uint64_t v878 = v900[157];
          uint64_t v899 = v900[159];
          uint64_t v674 = v900[152];
          void *v849 = v651;
          swift_release_n(v671, 2LL);
          _os_log_impl( (void *)&_mh_execute_header,  v638,  v639,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v644,  0x20u);
          uint64_t v675 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v849, 1LL, v675);
          swift_slowDealloc(v849, -1LL, -1LL);
          swift_arrayDestroy(v864, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v864, -1LL, -1LL);
          swift_slowDealloc(v644, -1LL, -1LL);

          swift_unknownObjectRelease(v673);
          v670(v878, v674);
          v670(v899, v674);
        }

        else
        {
          v657 = (void (*)(uint64_t, uint64_t))v2[227];
          uint64_t v658 = v2[218];
          uint64_t v659 = v2[184];
          uint64_t v660 = v2[180];
          uint64_t v661 = v2[159];
          uint64_t v662 = v2[157];
          uint64_t v663 = v2[152];

          swift_unknownObjectRelease(v658);
          swift_release_n(v898, 2LL);
          v641(v659, v660);
          v657(v662, v663);
          v657(v661, v663);
        }

        uint64_t v676 = v2[228];
        uint64_t v677 = v2[226];
        uint64_t v678 = v2[221];
        uint64_t v679 = v2[220];
        uint64_t v680 = v2[215];
        v681 = (void *)v2[213];
        uint64_t v682 = v2[176];
        uint64_t v683 = v2[175];
        uint64_t v684 = v2[174];
        uint64_t v865 = v2[209];
        uint64_t v868 = v2[146];
        v879 = *(void **)(v679 + 16);
        id v685 = v879;
        swift_release(v676);
        swift_release(v677);
        swift_release(v678);
        swift_release(v679);
        swift_release(v680);
        [v681 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v683 + 8))(v682, v684);
        uint64_t v125 = v865;
        goto LABEL_25;
      }

LABEL_94:
      v877 = v477 + 122;
      v894 = (uint64_t (*)(uint64_t, uint64_t))v477[225];
      uint64_t v584 = v477[216];
      uint64_t v585 = v477[179];
      v586 = v477;
      uint64_t v587 = v477[178];
      uint64_t v588 = v586[177];
      id v589 = v583;
      uint64_t v590 = MLHostTask.name.getter(v589);
      uint64_t v592 = v591;
      v593 = *(void (**)(uint64_t, uint64_t, uint64_t))(v587 + 16);
      v593(v585, v584, v588);
      sub_100013D50(v590, v592, v585);
      swift_bridgeObjectRelease(v592);
      uint64_t v594 = v894(v585, v588);
      uint64_t v595 = MLHostTask.name.getter(v594);
      uint64_t v597 = v596;
      sub_100013A80(v595, v596);
      uint64_t v598 = swift_bridgeObjectRelease(v597);
      v599 = v589;
      uint64_t v600 = MLHostResult.status.getter(v598);
      uint64_t v601 = MLHostResultStatus.rawValue.getter(v600);
      if (v601 == MLHostResultStatus.rawValue.getter(1LL))
      {
      }

      else
      {
        v897 = (void (*)(uint64_t, uint64_t))v586[225];
        uint64_t v624 = v586[216];
        uint64_t v625 = v586[179];
        uint64_t v626 = v586[177];
        id v627 = [(id)v586[213] processIdentifier];
        v901[0] = 0LL;
        v901[1] = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        uint64_t v628 = v901[1];
        v586[113] = v901[0];
        v586[114] = v628;
        v629._uint64_t countAndFlagsBits = 0x206B736154LL;
        v629._object = (void *)0xE500000000000000LL;
        String.append(_:)(v629);
        v631._uint64_t countAndFlagsBits = MLHostTask.name.getter(v630);
        v632 = v631._object;
        String.append(_:)(v631);
        swift_bridgeObjectRelease(v632);
        v633._object = (void *)0x800000010004A570LL;
        v633._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v633);
        v593(v625, v624, v626);
        _print_unlocked<A, B>(_:_:)( v625,  v586 + 113,  v626,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v897(v625, v626);
        v634._uint64_t countAndFlagsBits = 46LL;
        v634._object = (void *)0xE100000000000000LL;
        String.append(_:)(v634);
        uint64_t v635 = v586[114];
        sub_1000305D8((uint64_t)v627, v586[113], v635);

        swift_bridgeObjectRelease(v635);
      }

      id v2 = v586;
      goto LABEL_102;
    }

    v664 = (void (*)(uint64_t, uint64_t))v477[227];
    uint64_t v665 = v477[158];
    uint64_t v666 = v477[152];
    uint64_t v667 = v477[147];
    ContinuousClock.init()(v602);
    v477[107] = 500000000000000000LL;
    v477[108] = 0LL;
    *((_OWORD *)v477 + 51) = 0u;
    v752[48] = 1;
    uint64_t v420 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v667, v420);
    uint64_t v668 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v477 + 107, v666, v668);
    v664(v665, v666);
    v669 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    v477[229] = v669;
    void *v669 = v477;
    v669[1] = sub_1000353B0;
    uint64_t v424 = v477[156];
    uint64_t v425 = v477[147];
    v426 = v477 + 102;
  }

  else
  {
    uint64_t v416 = v213[158];
    uint64_t v417 = v213[153];
    uint64_t v418 = v213[152];
    uint64_t v419 = v213[147];
    ContinuousClock.init()(v316);
    v213[109] = 500000000000000000LL;
    v213[110] = 0LL;
    *((_OWORD *)v213 + 48) = 0u;
    _BYTE *v752 = 1;
    uint64_t v420 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v419, v420);
    uint64_t v421 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v213 + 109, v418, v421);
    v422 = *(void (**)(uint64_t, uint64_t))(v417 + 8);
    v213[234] = v422;
    v422(v416, v418);
    v423 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    v213[235] = v423;
    void *v423 = v213;
    v423[1] = sub_100039584;
    uint64_t v424 = v213[154];
    uint64_t v425 = v213[147];
    v426 = v213 + 96;
  }

  uint64_t v427 = v424;
  uint64_t v428 = v420;
  return dispatch thunk of Clock.sleep(until:tolerance:)(v427, v426, v425, v428);
}

uint64_t sub_1000353B0()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1832);
  *(void *)(*v1 + 1840) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 1816))(*(void *)(v2 + 1248), *(void *)(v2 + 1216));
    Swift::String v4 = sub_1000360FC;
  }

  else
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 1816);
    uint64_t v6 = *(void *)(v2 + 1248);
    uint64_t v7 = *(void *)(v2 + 1216);
    uint64_t v8 = *(void *)(v2 + 1208);
    uint64_t v9 = *(void *)(v2 + 1184);
    uint64_t v10 = *(void *)(v2 + 1176);
    v5(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    Swift::String v4 = sub_10003549C;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10003549C()
{
  uint64_t v1 = *(void *)(v0 + 1824);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
  uint64_t v3 = *(void *)(v0 + 1760);
  uint64_t v4 = *(void *)(v0 + 1264);
  uint64_t v5 = *(void *)(v0 + 1216);
  static ContinuousClock.now.getter();
  uint64_t v6 = ContinuousClock.Instant.duration(to:)(v4);
  uint64_t v8 = v7;
  v2(v4, v5);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  uint64_t v9 = *(void **)(v3 + 16);
  if (!v9)
  {
    uint64_t v26 = static Duration.< infix(_:_:)(5000000000000000000LL, 0LL, v6, v8);
    if ((v26 & 1) == 0)
    {
      uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v90 = *(void *)(v0 + 1264);
      uint64_t v91 = *(void *)(v0 + 1216);
      uint64_t v92 = *(void *)(v0 + 1176);
      ContinuousClock.init()();
      *(void *)(v0 + 856) = 500000000000000000LL;
      *(void *)(v0 + 864) = 0LL;
      *(_OWORD *)(v0 + 816) = 0u;
      *(_BYTE *)(v0 + 832) = 1;
      uint64_t v93 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
      dispatch thunk of Clock.now.getter(v92, v93);
      uint64_t v94 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
      dispatch thunk of InstantProtocol.advanced(by:)(v0 + 856, v91, v94);
      v89(v90, v91);
      unint64_t v95 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
      *(void *)(v0 + 1832) = v95;
      void *v95 = v0;
      v95[1] = sub_1000353B0;
      return dispatch thunk of Clock.sleep(until:tolerance:)( *(void *)(v0 + 1248),  v0 + 816,  *(void *)(v0 + 1176),  v93);
    }

    uint64_t v9 = *(void **)(*(void *)(v0 + 1760) + 16LL);
    if (!v9)
    {
      uint64_t v27 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
      uint64_t v169 = v0 + 976;
      uint64_t v174 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
      uint64_t v154 = *(void *)(v0 + 1680);
      uint64_t v156 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v28 = *(void *)(v0 + 1616);
      uint64_t v29 = *(void *)(v0 + 1592);
      uint64_t v158 = *(void *)(v0 + 1480);
      uint64_t v161 = *(void *)(v0 + 1440);
      uint64_t v165 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
      uint64_t v30 = *(void *)(v0 + 1432);
      uint64_t v31 = *(void *)(v0 + 1416);
      uint64_t v32 = *(void *)(v0 + 1152);
      uint64_t v33 = MLHostTask.name.getter(v26);
      uint64_t v35 = v34;
      v27(v30, enum case for TaskStatus.taskDeferred(_:), v31);
      sub_100013D50(v33, v35, v30);
      swift_bridgeObjectRelease(v35);
      v156(v30, v31);
      v165(v28, v154, v29);
      uint64_t v36 = v174(v158, v32, v161);
      uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
      os_log_type_t v38 = static os_log_type_t.error.getter();
      BOOL v39 = os_log_type_enabled(v37, v38);
      BOOL v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
      uint64_t v41 = *(void *)(v0 + 1616);
      uint64_t v42 = *(void *)(v0 + 1592);
      uint64_t v43 = *(void *)(v0 + 1480);
      uint64_t v44 = *(void *)(v0 + 1440);
      if (v39)
      {
        uint64_t v175 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
        uint64_t v159 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
        uint64_t v166 = *(void *)(v0 + 1592);
        uint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v46 = swift_slowAlloc(32LL, -1LL);
        uint64_t v181 = v46;
        *(_DWORD *)uint64_t v45 = 136315138;
        uint64_t v47 = MLHostTask.name.getter(v46);
        uint64_t v162 = v41;
        unint64_t v49 = v48;
        *(void *)(v0 + 976) = sub_10000B540(v47, v48, &v181);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v169, v0 + 984, v45 + 4, v45 + 12);
        swift_bridgeObjectRelease(v49);
        v159(v43, v44);
        _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v45,  0xCu);
        swift_arrayDestroy(v46, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v46, -1LL, -1LL);
        swift_slowDealloc(v45, -1LL, -1LL);

        v175(v162, v166);
      }

      else
      {
        (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

        v40(v41, v42);
      }

      id v122 = [*(id *)(v0 + 1704) processIdentifier];
      uint64_t v181 = 0LL;
      uint64_t v182 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(38LL);
      v123._uint64_t countAndFlagsBits = 0x206B736154LL;
      v123._object = (void *)0xE500000000000000LL;
      String.append(_:)(v123);
      v125._uint64_t countAndFlagsBits = MLHostTask.name.getter(v124);
      object = v125._object;
      String.append(_:)(v125);
      swift_bridgeObjectRelease(object);
      v127._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      v127._object = (void *)0x800000010004A550LL;
      String.append(_:)(v127);
      uint64_t v60 = v182;
      sub_1000305D8((uint64_t)v122, v181, v182);
      goto LABEL_9;
    }
  }

  uint64_t v169 = v0 + 976;
  uint64_t v173 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
  uint64_t v10 = *(void *)(v0 + 1728);
  uint64_t v11 = *(void *)(v0 + 1432);
  uint64_t v12 = *(void *)(v0 + 1424);
  uint64_t v13 = *(void *)(v0 + 1416);
  id v14 = v9;
  uint64_t v15 = MLHostTask.name.getter(v14);
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v18(v11, v10, v13);
  sub_100013D50(v15, v17, v11);
  swift_bridgeObjectRelease(v17);
  uint64_t v19 = v173(v11, v13);
  uint64_t v20 = MLHostTask.name.getter(v19);
  uint64_t v22 = v21;
  sub_100013A80(v20, v21);
  uint64_t v23 = swift_bridgeObjectRelease(v22);
  uint64_t v24 = MLHostResult.status.getter(v23);
  uint64_t v25 = MLHostResultStatus.rawValue.getter(v24);
  if (v25 != MLHostResultStatus.rawValue.getter(1LL))
  {
    uint64_t v176 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
    uint64_t v50 = *(void *)(v0 + 1728);
    uint64_t v51 = *(void *)(v0 + 1432);
    uint64_t v52 = *(void *)(v0 + 1416);
    id v53 = [*(id *)(v0 + 1704) processIdentifier];
    uint64_t v181 = 0LL;
    uint64_t v182 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    *(void *)(v0 + 904) = 0LL;
    *(void *)(v0 + 912) = 0xE000000000000000LL;
    v54._uint64_t countAndFlagsBits = 0x206B736154LL;
    v54._object = (void *)0xE500000000000000LL;
    String.append(_:)(v54);
    v56._uint64_t countAndFlagsBits = MLHostTask.name.getter(v55);
    uint64_t v57 = v56._object;
    String.append(_:)(v56);
    swift_bridgeObjectRelease(v57);
    v58._object = (void *)0x800000010004A570LL;
    v58._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v58);
    v18(v51, v50, v52);
    _print_unlocked<A, B>(_:_:)( v51,  v0 + 904,  v52,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v176(v51, v52);
    v59._uint64_t countAndFlagsBits = 46LL;
    v59._object = (void *)0xE100000000000000LL;
    String.append(_:)(v59);
    uint64_t v60 = *(void *)(v0 + 912);
    sub_1000305D8((uint64_t)v53, *(void *)(v0 + 904), v60);

LABEL_9:
    swift_bridgeObjectRelease(v60);
    goto LABEL_10;
  }

LABEL_10:
  uint64_t v61 = *(void *)(v0 + 1760);
  (*(void (**)(void, void, void))(v0 + 1696))( *(void *)(v0 + 1472),  *(void *)(v0 + 1152),  *(void *)(v0 + 1440));
  uint64_t v62 = swift_retain_n(v61, 2LL);
  uint64_t v63 = (os_log_s *)Logger.logObject.getter(v62);
  os_log_type_t v64 = static os_log_type_t.info.getter(v63);
  BOOL v65 = os_log_type_enabled(v63, v64);
  unint64_t v66 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
  uint64_t v177 = *(void *)(v0 + 1760);
  if (v65)
  {
    uint64_t v67 = *(void *)(v0 + 1824);
    uint64_t v68 = *(void *)(v0 + 1472);
    uint64_t v152 = *(void *)(v0 + 1440);
    uint64_t v69 = swift_slowAlloc(32LL, -1LL);
    uint64_t v163 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v167 = swift_slowAlloc(64LL, -1LL);
    uint64_t v181 = v167;
    *(_DWORD *)uint64_t v69 = 136315650;
    uint64_t v70 = MLHostTask.name.getter(v167);
    unint64_t v72 = v71;
    *(void *)(v0 + 936) = sub_10000B540(v70, v71, &v181);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 936, v0 + 944, v69 + 4, v69 + 12);
    swift_retain(v67);
    swift_bridgeObjectRelease(v72);
    v66(v68, v152);
    *(_WORD *)(v69 + 12) = 2080;
    swift_beginAccess(v67 + 16, v0 + 696, 0LL, 0LL);
    uint64_t v73 = Duration.description.getter(*(void *)(v67 + 16), *(void *)(v67 + 24));
    unint64_t v75 = v74;
    *(void *)(v0 + 952) = sub_10000B540(v73, v74, &v181);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960, v69 + 14, v69 + 22);
    swift_bridgeObjectRelease(v75);
    swift_release(v67);
    *(_WORD *)(v69 + 22) = 2112;
    unint64_t v76 = *(void **)(v177 + 16);
    if (v76)
    {
      *(void *)(v0 + 968) = v76;
      id v77 = v76;
      uint64_t v78 = v0 + 968;
      uint64_t v79 = v169;
      uint64_t v80 = v69 + 24;
      uint64_t v81 = v69 + 32;
    }

    else
    {
      uint64_t v81 = v69 + 32;
      *(void *)(v0 + 960) = 0LL;
      uint64_t v78 = v0 + 960;
      uint64_t v79 = v0 + 968;
      uint64_t v80 = v69 + 24;
    }

    UnsafeMutableRawBufferPointer.copyMemory(from:)(v78, v79, v80, v81);
    uint64_t v97 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v98 = *(void *)(v0 + 1760);
    uint64_t v99 = *(void **)(v0 + 1752);
    uint64_t v100 = *(void *)(v0 + 1744);
    uint64_t v170 = *(void *)(v0 + 1256);
    uint64_t v178 = *(void *)(v0 + 1272);
    uint64_t v101 = *(void *)(v0 + 1216);
    void *v163 = v76;
    swift_release_n(v98, 2LL);
    _os_log_impl( (void *)&_mh_execute_header,  v63,  v64,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v69,  0x20u);
    uint64_t v102 = sub_10000B4F4(&qword_100059280);
    swift_arrayDestroy(v163, 1LL, v102);
    swift_slowDealloc(v163, -1LL, -1LL);
    swift_arrayDestroy(v167, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v167, -1LL, -1LL);
    swift_slowDealloc(v69, -1LL, -1LL);

    swift_unknownObjectRelease(v100);
    v97(v170, v101);
    v97(v178, v101);
  }

  else
  {
    uint64_t v82 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v83 = *(void *)(v0 + 1744);
    uint64_t v84 = *(void *)(v0 + 1472);
    uint64_t v85 = *(void *)(v0 + 1440);
    uint64_t v86 = *(void *)(v0 + 1272);
    uint64_t v87 = *(void *)(v0 + 1256);
    uint64_t v88 = *(void *)(v0 + 1216);

    swift_unknownObjectRelease(v83);
    swift_release_n(v177, 2LL);
    v66(v84, v85);
    v82(v87, v88);
    v82(v86, v88);
  }

  uint64_t v103 = *(void *)(v0 + 1824);
  uint64_t v104 = *(void *)(v0 + 1808);
  uint64_t v105 = *(void *)(v0 + 1768);
  uint64_t v106 = *(void *)(v0 + 1760);
  uint64_t v107 = *(void *)(v0 + 1720);
  uint64_t v108 = *(void **)(v0 + 1704);
  uint64_t v109 = *(void *)(v0 + 1408);
  uint64_t v110 = *(void *)(v0 + 1400);
  uint64_t v111 = *(void *)(v0 + 1392);
  uint64_t v171 = *(void *)(v0 + 1672);
  uint64_t v179 = *(void *)(v0 + 1168);
  uint64_t v128 = *(void **)(v106 + 16);
  id v112 = v128;
  swift_release(v103);
  swift_release(v104);
  swift_release(v105);
  swift_release(v106);
  swift_release(v107);
  [v108 invalidate];

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v109, v111);
  swift_unknownObjectRelease(v171);
  swift_release_n(v179, 2LL);
  uint64_t v113 = *(void *)(v0 + 1656);
  uint64_t v114 = *(void *)(v0 + 1648);
  uint64_t v115 = *(void *)(v0 + 1640);
  uint64_t v116 = *(void *)(v0 + 1632);
  uint64_t v117 = *(void *)(v0 + 1624);
  uint64_t v118 = *(void *)(v0 + 1616);
  uint64_t v119 = *(void *)(v0 + 1608);
  uint64_t v120 = *(void *)(v0 + 1584);
  uint64_t v121 = *(void *)(v0 + 1576);
  uint64_t v129 = *(void *)(v0 + 1568);
  uint64_t v130 = *(void *)(v0 + 1560);
  uint64_t v131 = *(void *)(v0 + 1552);
  uint64_t v132 = *(void *)(v0 + 1544);
  uint64_t v133 = *(void *)(v0 + 1536);
  uint64_t v134 = *(void *)(v0 + 1528);
  uint64_t v135 = *(void *)(v0 + 1520);
  uint64_t v136 = *(void *)(v0 + 1512);
  uint64_t v137 = *(void *)(v0 + 1504);
  uint64_t v138 = *(void *)(v0 + 1496);
  uint64_t v139 = *(void *)(v0 + 1488);
  uint64_t v140 = *(void *)(v0 + 1480);
  uint64_t v141 = *(void *)(v0 + 1472);
  uint64_t v142 = *(void *)(v0 + 1464);
  uint64_t v143 = *(void *)(v0 + 1432);
  uint64_t v144 = *(void *)(v0 + 1408);
  uint64_t v145 = *(void *)(v0 + 1384);
  uint64_t v146 = *(void *)(v0 + 1376);
  uint64_t v147 = *(void *)(v0 + 1352);
  uint64_t v148 = *(void *)(v0 + 1344);
  uint64_t v149 = *(void *)(v0 + 1320);
  uint64_t v150 = *(void *)(v0 + 1296);
  uint64_t v151 = *(void *)(v0 + 1272);
  uint64_t v153 = *(void *)(v0 + 1264);
  uint64_t v155 = *(void *)(v0 + 1256);
  uint64_t v157 = *(void *)(v0 + 1248);
  uint64_t v160 = *(void *)(v0 + 1240);
  uint64_t v164 = *(void *)(v0 + 1232);
  uint64_t v168 = *(void *)(v0 + 1208);
  uint64_t v172 = *(void *)(v0 + 1200);
  uint64_t v180 = *(void *)(v0 + 1192);
  swift_task_dealloc(*(void *)(v0 + 1664));
  swift_task_dealloc(v113);
  swift_task_dealloc(v114);
  swift_task_dealloc(v115);
  swift_task_dealloc(v116);
  swift_task_dealloc(v117);
  swift_task_dealloc(v118);
  swift_task_dealloc(v119);
  swift_task_dealloc(v120);
  swift_task_dealloc(v121);
  swift_task_dealloc(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
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
  swift_task_dealloc(v153);
  swift_task_dealloc(v155);
  swift_task_dealloc(v157);
  swift_task_dealloc(v160);
  swift_task_dealloc(v164);
  swift_task_dealloc(v168);
  swift_task_dealloc(v172);
  swift_task_dealloc(v180);
  return (*(uint64_t (**)(void *))(v0 + 8))(v128);
}

uint64_t sub_1000360FC()
{
  uint64_t v1 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 1184) + 8LL))( *(void *)(v0 + 1208),  *(void *)(v0 + 1176));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "Task.sleep interrupted, skipping waiting for extension termination.",  v4,  2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  swift_errorRelease(*(void *)(v0 + 1840));

  uint64_t v6 = *(void **)(*(void *)(v0 + 1760) + 16LL);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
  if (v6)
  {
    uint64_t v8 = *(void *)(v0 + 1728);
    uint64_t v9 = *(void *)(v0 + 1432);
    uint64_t v10 = *(void *)(v0 + 1424);
    uint64_t v11 = *(void *)(v0 + 1416);
    uint64_t v162 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
    id v12 = v6;
    uint64_t v13 = MLHostTask.name.getter(v12);
    uint64_t v15 = v14;
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    v16(v9, v8, v11);
    sub_100013D50(v13, v15, v9);
    swift_bridgeObjectRelease(v15);
    uint64_t v17 = v162(v9, v11);
    uint64_t v18 = MLHostTask.name.getter(v17);
    uint64_t v20 = v19;
    sub_100013A80(v18, v19);
    uint64_t v21 = swift_bridgeObjectRelease(v20);
    uint64_t v22 = v12;
    uint64_t v23 = MLHostResult.status.getter(v21);
    uint64_t v24 = MLHostResultStatus.rawValue.getter(v23);
    if (v24 == MLHostResultStatus.rawValue.getter(1LL))
    {

      goto LABEL_12;
    }

    uint64_t v164 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
    uint64_t v47 = *(void *)(v0 + 1728);
    uint64_t v48 = *(void *)(v0 + 1432);
    uint64_t v49 = *(void *)(v0 + 1416);
    id v50 = [*(id *)(v0 + 1704) processIdentifier];
    uint64_t v169 = 0LL;
    uint64_t v170 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    *(void *)(v0 + 904) = 0LL;
    *(void *)(v0 + 912) = 0xE000000000000000LL;
    v51._uint64_t countAndFlagsBits = 0x206B736154LL;
    v51._object = (void *)0xE500000000000000LL;
    String.append(_:)(v51);
    v53._uint64_t countAndFlagsBits = MLHostTask.name.getter(v52);
    object = v53._object;
    String.append(_:)(v53);
    swift_bridgeObjectRelease(object);
    v55._object = (void *)0x800000010004A570LL;
    v55._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v55);
    v16(v48, v47, v49);
    _print_unlocked<A, B>(_:_:)( v48,  v0 + 904,  v49,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v164(v48, v49);
    v56._uint64_t countAndFlagsBits = 46LL;
    v56._object = (void *)0xE100000000000000LL;
    String.append(_:)(v56);
    uint64_t v57 = *(void *)(v0 + 912);
    sub_1000305D8((uint64_t)v50, *(void *)(v0 + 904), v57);
  }

  else
  {
    uint64_t v25 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
    uint64_t v163 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
    uint64_t v26 = *(void *)(v0 + 1616);
    uint64_t v144 = *(void *)(v0 + 1592);
    uint64_t v146 = *(void *)(v0 + 1680);
    uint64_t v148 = *(void *)(v0 + 1480);
    uint64_t v151 = *(void *)(v0 + 1440);
    uint64_t v155 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
    uint64_t v27 = *(void *)(v0 + 1432);
    uint64_t v28 = *(void *)(v0 + 1416);
    uint64_t v29 = *(void *)(v0 + 1152);
    uint64_t v30 = MLHostTask.name.getter(v5);
    uint64_t v32 = v31;
    v25(v27, enum case for TaskStatus.taskDeferred(_:), v28);
    sub_100013D50(v30, v32, v27);
    swift_bridgeObjectRelease(v32);
    v7(v27, v28);
    v155(v26, v146, v144);
    uint64_t v33 = v163(v148, v29, v151);
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.error.getter();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
    uint64_t v38 = *(void *)(v0 + 1616);
    uint64_t v39 = *(void *)(v0 + 1592);
    uint64_t v40 = *(void *)(v0 + 1480);
    uint64_t v41 = *(void *)(v0 + 1440);
    if (v36)
    {
      uint64_t v149 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
      uint64_t v156 = *(void *)(v0 + 1592);
      uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v43 = swift_slowAlloc(32LL, -1LL);
      uint64_t v169 = v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      uint64_t v44 = MLHostTask.name.getter(v43);
      uint64_t v152 = v38;
      unint64_t v46 = v45;
      *(void *)(v0 + 976) = sub_10000B540(v44, v45, &v169);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 976, v0 + 984, v42 + 4, v42 + 12);
      swift_bridgeObjectRelease(v46);
      v149(v40, v41);
      _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v42,  0xCu);
      swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1LL, -1LL);
      swift_slowDealloc(v42, -1LL, -1LL);

      v37(v152, v156);
    }

    else
    {
      (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

      v37(v38, v39);
    }

    id v58 = [*(id *)(v0 + 1704) processIdentifier];
    uint64_t v169 = 0LL;
    uint64_t v170 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    v59._uint64_t countAndFlagsBits = 0x206B736154LL;
    v59._object = (void *)0xE500000000000000LL;
    String.append(_:)(v59);
    v61._uint64_t countAndFlagsBits = MLHostTask.name.getter(v60);
    uint64_t v62 = v61._object;
    String.append(_:)(v61);
    swift_bridgeObjectRelease(v62);
    v63._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    v63._object = (void *)0x800000010004A550LL;
    String.append(_:)(v63);
    uint64_t v57 = v170;
    sub_1000305D8((uint64_t)v58, v169, v170);
  }

  swift_bridgeObjectRelease(v57);
LABEL_12:
  uint64_t v64 = *(void *)(v0 + 1760);
  (*(void (**)(void, void, void))(v0 + 1696))( *(void *)(v0 + 1472),  *(void *)(v0 + 1152),  *(void *)(v0 + 1440));
  uint64_t v65 = swift_retain_n(v64, 2LL);
  unint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
  os_log_type_t v67 = static os_log_type_t.info.getter(v66);
  BOOL v68 = os_log_type_enabled(v66, v67);
  uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
  uint64_t v165 = *(void *)(v0 + 1760);
  if (v68)
  {
    uint64_t v70 = *(void *)(v0 + 1824);
    uint64_t v71 = *(void *)(v0 + 1472);
    uint64_t v141 = *(void *)(v0 + 1440);
    uint64_t v72 = swift_slowAlloc(32LL, -1LL);
    uint64_t v153 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v157 = swift_slowAlloc(64LL, -1LL);
    uint64_t v169 = v157;
    *(_DWORD *)uint64_t v72 = 136315650;
    uint64_t v73 = MLHostTask.name.getter(v157);
    unint64_t v75 = v74;
    *(void *)(v0 + 936) = sub_10000B540(v73, v74, &v169);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 936, v0 + 944, v72 + 4, v72 + 12);
    swift_retain(v70);
    swift_bridgeObjectRelease(v75);
    v69(v71, v141);
    *(_WORD *)(v72 + 12) = 2080;
    swift_beginAccess(v70 + 16, v0 + 696, 0LL, 0LL);
    uint64_t v76 = Duration.description.getter(*(void *)(v70 + 16), *(void *)(v70 + 24));
    unint64_t v78 = v77;
    *(void *)(v0 + 952) = sub_10000B540(v76, v77, &v169);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960, v72 + 14, v72 + 22);
    swift_bridgeObjectRelease(v78);
    swift_release(v70);
    *(_WORD *)(v72 + 22) = 2112;
    uint64_t v79 = *(void **)(v165 + 16);
    if (v79)
    {
      *(void *)(v0 + 968) = v79;
      id v80 = v79;
      uint64_t v81 = v0 + 968;
      uint64_t v82 = v0 + 976;
      uint64_t v83 = v72 + 24;
      uint64_t v84 = v72 + 32;
    }

    else
    {
      uint64_t v84 = v72 + 32;
      *(void *)(v0 + 960) = 0LL;
      uint64_t v81 = v0 + 960;
      uint64_t v82 = v0 + 968;
      uint64_t v83 = v72 + 24;
    }

    UnsafeMutableRawBufferPointer.copyMemory(from:)(v81, v82, v83, v84);
    uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v93 = *(void *)(v0 + 1760);
    uint64_t v94 = *(void **)(v0 + 1752);
    uint64_t v95 = *(void *)(v0 + 1744);
    uint64_t v159 = *(void *)(v0 + 1256);
    uint64_t v166 = *(void *)(v0 + 1272);
    uint64_t v96 = *(void *)(v0 + 1216);
    *uint64_t v153 = v79;
    swift_release_n(v93, 2LL);
    _os_log_impl( (void *)&_mh_execute_header,  v66,  v67,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v72,  0x20u);
    uint64_t v97 = sub_10000B4F4(&qword_100059280);
    swift_arrayDestroy(v153, 1LL, v97);
    swift_slowDealloc(v153, -1LL, -1LL);
    swift_arrayDestroy(v157, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v157, -1LL, -1LL);
    swift_slowDealloc(v72, -1LL, -1LL);

    swift_unknownObjectRelease(v95);
    v92(v159, v96);
    v92(v166, v96);
  }

  else
  {
    uint64_t v85 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v86 = *(void *)(v0 + 1744);
    uint64_t v87 = *(void *)(v0 + 1472);
    uint64_t v88 = *(void *)(v0 + 1440);
    uint64_t v89 = *(void *)(v0 + 1272);
    uint64_t v90 = *(void *)(v0 + 1256);
    uint64_t v91 = *(void *)(v0 + 1216);

    swift_unknownObjectRelease(v86);
    swift_release_n(v165, 2LL);
    v69(v87, v88);
    v85(v90, v91);
    v85(v89, v91);
  }

  uint64_t v98 = *(void *)(v0 + 1824);
  uint64_t v99 = *(void *)(v0 + 1808);
  uint64_t v100 = *(void *)(v0 + 1768);
  uint64_t v101 = *(void *)(v0 + 1760);
  uint64_t v102 = *(void *)(v0 + 1720);
  uint64_t v103 = *(void **)(v0 + 1704);
  uint64_t v104 = *(void *)(v0 + 1408);
  uint64_t v105 = *(void *)(v0 + 1400);
  uint64_t v106 = *(void *)(v0 + 1392);
  uint64_t v160 = *(void *)(v0 + 1672);
  uint64_t v167 = *(void *)(v0 + 1168);
  uint64_t v118 = *(void **)(v101 + 16);
  id v107 = v118;
  swift_release(v98);
  swift_release(v99);
  swift_release(v100);
  swift_release(v101);
  swift_release(v102);
  [v103 invalidate];

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v104, v106);
  swift_unknownObjectRelease(v160);
  swift_release_n(v167, 2LL);
  uint64_t v108 = *(void *)(v0 + 1656);
  uint64_t v109 = *(void *)(v0 + 1648);
  uint64_t v110 = *(void *)(v0 + 1640);
  uint64_t v111 = *(void *)(v0 + 1632);
  uint64_t v112 = *(void *)(v0 + 1624);
  uint64_t v113 = *(void *)(v0 + 1616);
  uint64_t v114 = *(void *)(v0 + 1608);
  uint64_t v115 = *(void *)(v0 + 1584);
  uint64_t v116 = *(void *)(v0 + 1576);
  uint64_t v119 = *(void *)(v0 + 1568);
  uint64_t v120 = *(void *)(v0 + 1560);
  uint64_t v121 = *(void *)(v0 + 1552);
  uint64_t v122 = *(void *)(v0 + 1544);
  uint64_t v123 = *(void *)(v0 + 1536);
  uint64_t v124 = *(void *)(v0 + 1528);
  uint64_t v125 = *(void *)(v0 + 1520);
  uint64_t v126 = *(void *)(v0 + 1512);
  uint64_t v127 = *(void *)(v0 + 1504);
  uint64_t v128 = *(void *)(v0 + 1496);
  uint64_t v129 = *(void *)(v0 + 1488);
  uint64_t v130 = *(void *)(v0 + 1480);
  uint64_t v131 = *(void *)(v0 + 1472);
  uint64_t v132 = *(void *)(v0 + 1464);
  uint64_t v133 = *(void *)(v0 + 1432);
  uint64_t v134 = *(void *)(v0 + 1408);
  uint64_t v135 = *(void *)(v0 + 1384);
  uint64_t v136 = *(void *)(v0 + 1376);
  uint64_t v137 = *(void *)(v0 + 1352);
  uint64_t v138 = *(void *)(v0 + 1344);
  uint64_t v139 = *(void *)(v0 + 1320);
  uint64_t v140 = *(void *)(v0 + 1296);
  uint64_t v142 = *(void *)(v0 + 1272);
  uint64_t v143 = *(void *)(v0 + 1264);
  uint64_t v145 = *(void *)(v0 + 1256);
  uint64_t v147 = *(void *)(v0 + 1248);
  uint64_t v150 = *(void *)(v0 + 1240);
  uint64_t v154 = *(void *)(v0 + 1232);
  uint64_t v158 = *(void *)(v0 + 1208);
  uint64_t v161 = *(void *)(v0 + 1200);
  uint64_t v168 = *(void *)(v0 + 1192);
  swift_task_dealloc(*(void *)(v0 + 1664));
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  swift_task_dealloc(v112);
  swift_task_dealloc(v113);
  swift_task_dealloc(v114);
  swift_task_dealloc(v115);
  swift_task_dealloc(v116);
  swift_task_dealloc(v119);
  swift_task_dealloc(v120);
  swift_task_dealloc(v121);
  swift_task_dealloc(v122);
  swift_task_dealloc(v123);
  swift_task_dealloc(v124);
  swift_task_dealloc(v125);
  swift_task_dealloc(v126);
  swift_task_dealloc(v127);
  swift_task_dealloc(v128);
  swift_task_dealloc(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  swift_task_dealloc(v140);
  swift_task_dealloc(v142);
  swift_task_dealloc(v143);
  swift_task_dealloc(v145);
  swift_task_dealloc(v147);
  swift_task_dealloc(v150);
  swift_task_dealloc(v154);
  swift_task_dealloc(v158);
  swift_task_dealloc(v161);
  swift_task_dealloc(v168);
  return (*(uint64_t (**)(void *))(v0 + 8))(v118);
}

uint64_t sub_100036C4C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1856);
  *(void *)(*v1 + 1864) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 1848))(*(void *)(v2 + 1240), *(void *)(v2 + 1216));
    uint64_t v4 = sub_1000381B4;
  }

  else
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 1848);
    uint64_t v6 = *(void *)(v2 + 1240);
    uint64_t v7 = *(void *)(v2 + 1216);
    uint64_t v8 = *(void *)(v2 + 1200);
    uint64_t v9 = *(void *)(v2 + 1184);
    uint64_t v10 = *(void *)(v2 + 1176);
    v5(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v4 = sub_100036D38;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100036D38()
{
  uint64_t v1 = *(void *)(v0 + 1760);
  if ((*(_BYTE *)(*(void *)(v0 + 1168) + 16LL) & 1) == 0 && !*(void *)(v1 + 16))
  {
    uint64_t v87 = *(void *)(v0 + 1264);
    uint64_t v88 = *(void *)(v0 + 1224);
    uint64_t v89 = *(void *)(v0 + 1216);
    uint64_t v90 = *(void *)(v0 + 1176);
    ContinuousClock.init()();
    *(void *)(v0 + 888) = 500000000000000000LL;
    *(void *)(v0 + 896) = 0LL;
    *(_OWORD *)(v0 + 792) = 0u;
    *(_BYTE *)(v0 + 808) = 1;
    uint64_t v91 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v90, v91);
    uint64_t v92 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v0 + 888, v89, v92);
    uint64_t v93 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
    *(void *)(v0 + 1848) = v93;
    v93(v87, v89);
    uint64_t v94 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(void *)(v0 + 1856) = v94;
    void *v94 = v0;
    v94[1] = sub_100036C4C;
    uint64_t v95 = *(void *)(v0 + 1176);
    uint64_t v96 = *(void *)(v0 + 1240);
    uint64_t v97 = v0 + 792;
    uint64_t v98 = v91;
    return dispatch thunk of Clock.sleep(until:tolerance:)(v96, v97, v95, v98);
  }

  uint64_t v2 = *(void *)(v0 + 1264);
  uint64_t v3 = *(void *)(v0 + 1224);
  uint64_t v4 = *(void *)(v0 + 1216);
  ((void (*)(void))static ContinuousClock.now.getter)();
  uint64_t v5 = ContinuousClock.Instant.duration(to:)(v2);
  uint64_t v7 = v6;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 1816) = v8;
  v8(v2, v4);
  uint64_t v9 = *(void **)(v1 + 16);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
  if (!v9)
  {
    uint64_t v274 = v5;
    uint64_t v27 = *(void *)(v0 + 1488);
    uint64_t v28 = *(void *)(v0 + 1440);
    uint64_t v29 = *(void *)(v0 + 1152);
    (*(void (**)(void, void, void))(v0 + 1688))( *(void *)(v0 + 1624),  *(void *)(v0 + 1680),  *(void *)(v0 + 1592));
    uint64_t v30 = v10(v27, v29, v28);
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.info.getter(v31);
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
    os_log_type_t v35 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1776);
    uint64_t v36 = *(void *)(v0 + 1624);
    uint64_t v282 = *(void *)(v0 + 1592);
    uint64_t v37 = *(void *)(v0 + 1488);
    uint64_t v38 = *(void *)(v0 + 1440);
    if (v33)
    {
      NSString v258 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1776);
      uint64_t v39 = swift_slowAlloc(22LL, -1LL);
      uint64_t v247 = v7;
      uint64_t v40 = swift_slowAlloc(64LL, -1LL);
      uint64_t v289 = v40;
      *(_DWORD *)uint64_t v39 = 136315394;
      uint64_t v41 = MLHostTask.name.getter(v40);
      unint64_t v43 = v42;
      *(void *)(v0 + 1008) = sub_10000B540(v41, v42, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1008, v0 + 1016, v39 + 4, v39 + 12);
      swift_bridgeObjectRelease(v43);
      v34(v37, v38);
      *(_WORD *)(v39 + 12) = 2080;
      uint64_t v44 = Duration.description.getter(v274, v247);
      unint64_t v46 = v45;
      *(void *)(v0 + 1016) = sub_10000B540(v44, v45, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1016, v0 + 1024, v39 + 14, v39 + 22);
      swift_bridgeObjectRelease(v46);
      _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "Task %s asked to terminate because of deferral after %s.",  (uint8_t *)v39,  0x16u);
      swift_arrayDestroy(v40, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1LL, -1LL);
      swift_slowDealloc(v39, -1LL, -1LL);

      uint64_t v47 = v258(v36, v282);
    }

    else
    {
      v34(v37, v38);

      uint64_t v47 = v35(v36, v282);
    }

    uint64_t v99 = *(void *)(v0 + 1760);
    uint64_t v100 = *(void **)(v0 + 1744);
    static ContinuousClock.now.getter(v47);
    uint64_t v101 = swift_allocObject(&unk_100056120, 32LL, 7LL);
    *(void *)(v0 + 1824) = v101;
    *(void *)(v101 + 16) = 0LL;
    *(void *)(v101 + 24) = 0LL;
    [v100 doStop];
    uint64_t v102 = *(void **)(v99 + 16);
    if (v102) {
      goto LABEL_16;
    }
    uint64_t v160 = static Duration.< infix(_:_:)(5000000000000000000LL, 0LL, 0LL, 0LL);
    if ((v160 & 1) != 0)
    {
      uint64_t v102 = *(void **)(*(void *)(v0 + 1760) + 16LL);
      if (!v102)
      {
        uint64_t v161 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
        uint64_t v277 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
        uint64_t v286 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
        uint64_t v251 = *(void *)(v0 + 1680);
        uint64_t v255 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
        uint64_t v162 = *(void *)(v0 + 1616);
        uint64_t v163 = *(void *)(v0 + 1592);
        uint64_t v261 = *(void *)(v0 + 1480);
        uint64_t v267 = *(void *)(v0 + 1440);
        uint64_t v164 = *(void *)(v0 + 1432);
        uint64_t v165 = *(void *)(v0 + 1416);
        uint64_t v166 = *(void *)(v0 + 1152);
        uint64_t v167 = MLHostTask.name.getter(v160);
        uint64_t v169 = v168;
        v161(v164, enum case for TaskStatus.taskDeferred(_:), v165);
        sub_100013D50(v167, v169, v164);
        swift_bridgeObjectRelease(v169);
        v255(v164, v165);
        v277(v162, v251, v163);
        uint64_t v170 = v286(v261, v166, v267);
        uint64_t v171 = (os_log_s *)Logger.logObject.getter(v170);
        os_log_type_t v172 = static os_log_type_t.error.getter();
        BOOL v173 = os_log_type_enabled(v171, v172);
        uint64_t v174 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
        uint64_t v175 = *(void *)(v0 + 1616);
        uint64_t v176 = *(void *)(v0 + 1592);
        uint64_t v177 = *(void *)(v0 + 1480);
        uint64_t v178 = *(void *)(v0 + 1440);
        if (v173)
        {
          uint64_t v287 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
          uint64_t v262 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
          uint64_t v278 = *(void *)(v0 + 1592);
          uint64_t v179 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v180 = swift_slowAlloc(32LL, -1LL);
          uint64_t v289 = v180;
          *(_DWORD *)uint64_t v179 = 136315138;
          uint64_t v181 = MLHostTask.name.getter(v180);
          uint64_t v268 = v175;
          unint64_t v183 = v182;
          *(void *)(v0 + 976) = sub_10000B540(v181, v182, &v289);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 976, v0 + 984, v179 + 4, v179 + 12);
          swift_bridgeObjectRelease(v183);
          v262(v177, v178);
          _os_log_impl( (void *)&_mh_execute_header,  v171,  v172,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v179,  0xCu);
          swift_arrayDestroy(v180, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v180, -1LL, -1LL);
          swift_slowDealloc(v179, -1LL, -1LL);

          v287(v268, v278);
        }

        else
        {
          (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

          v174(v175, v176);
        }

        id v215 = [*(id *)(v0 + 1704) processIdentifier];
        uint64_t v289 = 0LL;
        uint64_t v290 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        v216._uint64_t countAndFlagsBits = 0x206B736154LL;
        v216._object = (void *)0xE500000000000000LL;
        String.append(_:)(v216);
        v218._uint64_t countAndFlagsBits = MLHostTask.name.getter(v217);
        object = v218._object;
        String.append(_:)(v218);
        swift_bridgeObjectRelease(object);
        v220._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v220._object = (void *)0x800000010004A550LL;
        String.append(_:)(v220);
        uint64_t v221 = v290;
        sub_1000305D8((uint64_t)v215, v289, v290);
        swift_bridgeObjectRelease(v221);
LABEL_19:
        uint64_t v131 = *(void *)(v0 + 1760);
        (*(void (**)(void, void, void))(v0 + 1696))( *(void *)(v0 + 1472),  *(void *)(v0 + 1152),  *(void *)(v0 + 1440));
        uint64_t v132 = swift_retain_n(v131, 2LL);
        uint64_t v133 = (os_log_s *)Logger.logObject.getter(v132);
        os_log_type_t v134 = static os_log_type_t.info.getter(v133);
        BOOL v135 = os_log_type_enabled(v133, v134);
        uint64_t v285 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
        if (v135)
        {
          uint64_t v136 = *(void *)(v0 + 1824);
          uint64_t v137 = *(void *)(v0 + 1472);
          uint64_t v245 = *(void *)(v0 + 1440);
          uint64_t v260 = *(void *)(v0 + 1760);
          uint64_t v138 = swift_slowAlloc(32LL, -1LL);
          uint64_t v266 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v276 = swift_slowAlloc(64LL, -1LL);
          uint64_t v289 = v276;
          *(_DWORD *)uint64_t v138 = 136315650;
          uint64_t v139 = MLHostTask.name.getter(v276);
          unint64_t v141 = v140;
          *(void *)(v0 + 936) = sub_10000B540(v139, v140, &v289);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 936, v0 + 944, v138 + 4, v138 + 12);
          swift_retain(v136);
          swift_bridgeObjectRelease(v141);
          v285(v137, v245);
          *(_WORD *)(v138 + 12) = 2080;
          swift_beginAccess(v136 + 16, v0 + 696, 0LL, 0LL);
          uint64_t v142 = Duration.description.getter(*(void *)(v136 + 16), *(void *)(v136 + 24));
          unint64_t v144 = v143;
          *(void *)(v0 + 952) = sub_10000B540(v142, v143, &v289);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960, v138 + 14, v138 + 22);
          swift_release(v136);
          swift_bridgeObjectRelease(v144);
          *(_WORD *)(v138 + 22) = 2112;
          uint64_t v145 = *(void **)(v260 + 16);
          uint64_t v146 = v133;
          if (v145)
          {
            *(void *)(v0 + 968) = v145;
            id v147 = v145;
            uint64_t v148 = v0 + 968;
            uint64_t v149 = v0 + 976;
            uint64_t v150 = v138 + 24;
            uint64_t v151 = v138 + 32;
          }

          else
          {
            uint64_t v151 = v138 + 32;
            *(void *)(v0 + 960) = 0LL;
            uint64_t v148 = v0 + 960;
            uint64_t v149 = v0 + 968;
            uint64_t v150 = v138 + 24;
          }

          UnsafeMutableRawBufferPointer.copyMemory(from:)(v148, v149, v150, v151);
          id v192 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v193 = *(void *)(v0 + 1760);
          uint64_t v271 = *(void **)(v0 + 1752);
          uint64_t v194 = *(void *)(v0 + 1744);
          uint64_t v288 = *(void *)(v0 + 1272);
          uint64_t v195 = *(void *)(v0 + 1256);
          uint64_t v196 = *(void *)(v0 + 1216);
          void *v266 = v145;
          swift_release_n(v193, 2LL);
          _os_log_impl( (void *)&_mh_execute_header,  v146,  v134,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v138,  0x20u);
          uint64_t v197 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v266, 1LL, v197);
          swift_slowDealloc(v266, -1LL, -1LL);
          swift_arrayDestroy(v276, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v276, -1LL, -1LL);
          swift_slowDealloc(v138, -1LL, -1LL);
          swift_unknownObjectRelease(v194);

          v192(v195, v196);
          v192(v288, v196);
        }

        else
        {
          uint64_t v152 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v153 = *(void **)(v0 + 1752);
          uint64_t v154 = *(void *)(v0 + 1744);
          uint64_t v155 = *(void *)(v0 + 1472);
          uint64_t v156 = *(void *)(v0 + 1440);
          uint64_t v157 = *(void *)(v0 + 1272);
          uint64_t v158 = *(void *)(v0 + 1256);
          uint64_t v159 = *(void *)(v0 + 1216);
          swift_release_n(*(void *)(v0 + 1760), 2LL);
          swift_unknownObjectRelease(v154);

          v285(v155, v156);
          v152(v158, v159);
          v152(v157, v159);
        }

        uint64_t v198 = *(void *)(v0 + 1824);
        uint64_t v199 = *(void *)(v0 + 1808);
        uint64_t v200 = *(void *)(v0 + 1768);
        uint64_t v201 = *(void *)(v0 + 1760);
        uint64_t v202 = *(void *)(v0 + 1720);
        uint64_t v203 = *(void **)(v0 + 1704);
        uint64_t v82 = *(void *)(v0 + 1672);
        uint64_t v204 = *(void *)(v0 + 1408);
        uint64_t v272 = *(void *)(v0 + 1400);
        uint64_t v279 = *(void *)(v0 + 1392);
        uint64_t v86 = *(void *)(v0 + 1168);
        uint64_t v281 = *(void **)(v201 + 16);
        id v205 = v281;
        swift_release(v202);
        swift_release(v201);
        swift_release(v200);
        swift_release(v199);
        swift_release(v198);
        [v203 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v272 + 8))(v204, v279);
        goto LABEL_32;
      }

LABEL_16:
      uint64_t v283 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v103 = *(void *)(v0 + 1728);
      uint64_t v104 = *(void *)(v0 + 1432);
      uint64_t v105 = *(void *)(v0 + 1424);
      uint64_t v106 = *(void *)(v0 + 1416);
      id v107 = v102;
      uint64_t v108 = MLHostTask.name.getter(v107);
      uint64_t v110 = v109;
      uint64_t v111 = *(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 16);
      v111(v104, v103, v106);
      sub_100013D50(v108, v110, v104);
      swift_bridgeObjectRelease(v110);
      uint64_t v112 = v283(v104, v106);
      uint64_t v113 = MLHostTask.name.getter(v112);
      uint64_t v115 = v114;
      sub_100013A80(v113, v114);
      uint64_t v116 = swift_bridgeObjectRelease(v115);
      uint64_t v117 = MLHostResult.status.getter(v116);
      uint64_t v118 = MLHostResultStatus.rawValue.getter(v117);
      if (v118 != MLHostResultStatus.rawValue.getter(1LL))
      {
        uint64_t v284 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
        uint64_t v119 = *(void *)(v0 + 1728);
        uint64_t v120 = *(void *)(v0 + 1432);
        uint64_t v121 = *(void *)(v0 + 1416);
        id v122 = [*(id *)(v0 + 1704) processIdentifier];
        uint64_t v289 = 0LL;
        uint64_t v290 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        uint64_t v123 = v290;
        *(void *)(v0 + 904) = v289;
        *(void *)(v0 + 912) = v123;
        v124._uint64_t countAndFlagsBits = 0x206B736154LL;
        v124._object = (void *)0xE500000000000000LL;
        String.append(_:)(v124);
        v126._uint64_t countAndFlagsBits = MLHostTask.name.getter(v125);
        uint64_t v127 = v126._object;
        String.append(_:)(v126);
        swift_bridgeObjectRelease(v127);
        v128._object = (void *)0x800000010004A570LL;
        v128._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v128);
        v111(v120, v119, v121);
        _print_unlocked<A, B>(_:_:)( v120,  v0 + 904,  v121,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v284(v120, v121);
        v129._uint64_t countAndFlagsBits = 46LL;
        v129._object = (void *)0xE100000000000000LL;
        String.append(_:)(v129);
        uint64_t v130 = *(void *)(v0 + 912);
        sub_1000305D8((uint64_t)v122, *(void *)(v0 + 904), v130);
        swift_bridgeObjectRelease(v130);
      }

      goto LABEL_19;
    }

    uint64_t v184 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v185 = *(void *)(v0 + 1264);
    uint64_t v186 = *(void *)(v0 + 1216);
    uint64_t v187 = *(void *)(v0 + 1176);
    ContinuousClock.init()();
    *(void *)(v0 + 856) = 500000000000000000LL;
    *(void *)(v0 + 864) = 0LL;
    *(_OWORD *)(v0 + 816) = 0u;
    *(_BYTE *)(v0 + 832) = 1;
    uint64_t v188 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v187, v188);
    uint64_t v189 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v0 + 856, v186, v189);
    v184(v185, v186);
    uint64_t v190 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(void *)(v0 + 1832) = v190;
    void *v190 = v0;
    v190[1] = sub_1000353B0;
    uint64_t v95 = *(void *)(v0 + 1176);
    uint64_t v97 = v0 + 816;
    uint64_t v96 = *(void *)(v0 + 1248);
    uint64_t v98 = v188;
    return dispatch thunk of Clock.sleep(until:tolerance:)(v96, v97, v95, v98);
  }

  v10(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
  id v11 = v9;
  id v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v264 = static os_log_type_t.info.getter(v12);
  BOOL v13 = os_log_type_enabled(v12, v264);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
  uint64_t v15 = *(void *)(v0 + 1496);
  uint64_t v16 = *(void *)(v0 + 1440);
  uint64_t v281 = v9;
  uint64_t v270 = v8;
  if (v13)
  {
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    uint64_t v253 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v257 = swift_slowAlloc(64LL, -1LL);
    uint64_t v289 = v257;
    *(_DWORD *)uint64_t v17 = 136315650;
    uint64_t v18 = MLHostTask.name.getter(v257);
    unint64_t v20 = v19;
    *(void *)(v0 + 1032) = sub_10000B540(v18, v19, &v289);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1032, v0 + 1040, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease(v20);
    v14(v15, v16);
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v21 = Duration.description.getter(v5, v7);
    unint64_t v23 = v22;
    *(void *)(v0 + 1040) = sub_10000B540(v21, v22, &v289);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1040, v0 + 1048, v17 + 14, v17 + 22);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v17 + 22) = 2112;
    *(void *)(v0 + 1048) = v11;
    id v24 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1048, v0 + 1056, v17 + 24, v17 + 32);
    *uint64_t v253 = v281;

    _os_log_impl( (void *)&_mh_execute_header,  v12,  v264,  "Task %s completed after %s. TaskResult: %@",  (uint8_t *)v17,  0x20u);
    uint64_t v25 = sub_10000B4F4(&qword_100059280);
    swift_arrayDestroy(v253, 1LL, v25);
    swift_slowDealloc(v253, -1LL, -1LL);
    swift_arrayDestroy(v257, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v257, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  else
  {
    v14(v15, v16);
  }

  uint64_t v48 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
  uint64_t v49 = *(void *)(v0 + 1728);
  uint64_t v50 = *(void *)(v0 + 1432);
  uint64_t v51 = *(void *)(v0 + 1424);
  uint64_t v52 = *(void *)(v0 + 1416);
  uint64_t v53 = MLHostTask.name.getter(v26);
  uint64_t v55 = v54;
  Swift::String v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
  v56(v50, v49, v52);
  sub_100013D50(v53, v55, v50);
  swift_bridgeObjectRelease(v55);
  uint64_t v57 = v48(v50, v52);
  uint64_t v58 = MLHostTask.name.getter(v57);
  uint64_t v60 = v59;
  sub_100013A80(v58, v59);
  uint64_t v61 = swift_bridgeObjectRelease(v60);
  uint64_t v62 = MLHostResult.status.getter(v61);
  uint64_t v63 = MLHostResultStatus.rawValue.getter(v62);
  uint64_t v64 = MLHostResultStatus.rawValue.getter(1LL);
  uint64_t v65 = *(void *)(v0 + 1808);
  uint64_t v66 = *(void *)(v0 + 1768);
  if (v63 == v64)
  {
    os_log_type_t v67 = *(void **)(v0 + 1752);
    uint64_t v68 = *(void *)(v0 + 1744);
    v270(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
    swift_unknownObjectRelease(v68);
  }

  else
  {
    uint64_t v275 = *(void **)(v0 + 1752);
    uint64_t v250 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
    uint64_t v254 = *(void *)(v0 + 1744);
    uint64_t v69 = *(void *)(v0 + 1728);
    uint64_t v70 = *(void *)(v0 + 1432);
    uint64_t v71 = *(void *)(v0 + 1416);
    uint64_t v259 = *(void *)(v0 + 1216);
    uint64_t v265 = *(void *)(v0 + 1272);
    unsigned int v248 = [*(id *)(v0 + 1704) processIdentifier];
    uint64_t v289 = 0LL;
    uint64_t v290 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    uint64_t v72 = v290;
    *(void *)(v0 + 840) = v289;
    *(void *)(v0 + 848) = v72;
    v73._uint64_t countAndFlagsBits = 0x206B736154LL;
    v73._object = (void *)0xE500000000000000LL;
    String.append(_:)(v73);
    v75._uint64_t countAndFlagsBits = MLHostTask.name.getter(v74);
    uint64_t v76 = v75._object;
    String.append(_:)(v75);
    swift_bridgeObjectRelease(v76);
    v77._object = (void *)0x800000010004A570LL;
    v77._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v77);
    v56(v70, v69, v71);
    _print_unlocked<A, B>(_:_:)( v70,  v0 + 840,  v71,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v250(v70, v71);
    v78._uint64_t countAndFlagsBits = 46LL;
    v78._object = (void *)0xE100000000000000LL;
    String.append(_:)(v78);
    uint64_t v79 = *(void *)(v0 + 848);
    sub_1000305D8(v248, *(void *)(v0 + 840), v79);
    swift_unknownObjectRelease(v254);
    swift_bridgeObjectRelease(v79);

    v270(v265, v259);
  }

  swift_release(v66);
  swift_release(v65);
  uint64_t v80 = *(void *)(v0 + 1760);
  uint64_t v81 = *(void **)(v0 + 1704);
  uint64_t v82 = *(void *)(v0 + 1672);
  uint64_t v83 = *(void *)(v0 + 1408);
  uint64_t v84 = *(void *)(v0 + 1400);
  uint64_t v85 = *(void *)(v0 + 1392);
  uint64_t v86 = *(void *)(v0 + 1168);
  swift_release(*(void *)(v0 + 1720));
  swift_release(v80);
  [v81 invalidate];

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
LABEL_32:
  swift_release_n(v86, 2LL);
  swift_unknownObjectRelease(v82);
  uint64_t v206 = *(void *)(v0 + 1656);
  uint64_t v207 = *(void *)(v0 + 1648);
  uint64_t v208 = *(void *)(v0 + 1640);
  uint64_t v209 = *(void *)(v0 + 1632);
  uint64_t v210 = *(void *)(v0 + 1624);
  uint64_t v211 = *(void *)(v0 + 1616);
  uint64_t v212 = *(void *)(v0 + 1608);
  uint64_t v213 = *(void *)(v0 + 1584);
  uint64_t v214 = *(void *)(v0 + 1576);
  uint64_t v222 = *(void *)(v0 + 1568);
  uint64_t v223 = *(void *)(v0 + 1560);
  uint64_t v224 = *(void *)(v0 + 1552);
  uint64_t v225 = *(void *)(v0 + 1544);
  uint64_t v226 = *(void *)(v0 + 1536);
  uint64_t v227 = *(void *)(v0 + 1528);
  uint64_t v228 = *(void *)(v0 + 1520);
  uint64_t v229 = *(void *)(v0 + 1512);
  uint64_t v230 = *(void *)(v0 + 1504);
  uint64_t v231 = *(void *)(v0 + 1496);
  uint64_t v232 = *(void *)(v0 + 1488);
  uint64_t v233 = *(void *)(v0 + 1480);
  uint64_t v234 = *(void *)(v0 + 1472);
  uint64_t v235 = *(void *)(v0 + 1464);
  uint64_t v236 = *(void *)(v0 + 1432);
  uint64_t v237 = *(void *)(v0 + 1408);
  uint64_t v238 = *(void *)(v0 + 1384);
  uint64_t v239 = *(void *)(v0 + 1376);
  uint64_t v240 = *(void *)(v0 + 1352);
  uint64_t v241 = *(void *)(v0 + 1344);
  uint64_t v242 = *(void *)(v0 + 1320);
  uint64_t v243 = *(void *)(v0 + 1296);
  uint64_t v244 = *(void *)(v0 + 1272);
  uint64_t v246 = *(void *)(v0 + 1264);
  uint64_t v249 = *(void *)(v0 + 1256);
  uint64_t v252 = *(void *)(v0 + 1248);
  uint64_t v256 = *(void *)(v0 + 1240);
  uint64_t v263 = *(void *)(v0 + 1232);
  uint64_t v269 = *(void *)(v0 + 1208);
  uint64_t v273 = *(void *)(v0 + 1200);
  uint64_t v280 = *(void *)(v0 + 1192);
  swift_task_dealloc(*(void *)(v0 + 1664));
  swift_task_dealloc(v206);
  swift_task_dealloc(v207);
  swift_task_dealloc(v208);
  swift_task_dealloc(v209);
  swift_task_dealloc(v210);
  swift_task_dealloc(v211);
  swift_task_dealloc(v212);
  swift_task_dealloc(v213);
  swift_task_dealloc(v214);
  swift_task_dealloc(v222);
  swift_task_dealloc(v223);
  swift_task_dealloc(v224);
  swift_task_dealloc(v225);
  swift_task_dealloc(v226);
  swift_task_dealloc(v227);
  swift_task_dealloc(v228);
  swift_task_dealloc(v229);
  swift_task_dealloc(v230);
  swift_task_dealloc(v231);
  swift_task_dealloc(v232);
  swift_task_dealloc(v233);
  swift_task_dealloc(v234);
  swift_task_dealloc(v235);
  swift_task_dealloc(v236);
  swift_task_dealloc(v237);
  swift_task_dealloc(v238);
  swift_task_dealloc(v239);
  swift_task_dealloc(v240);
  swift_task_dealloc(v241);
  swift_task_dealloc(v242);
  swift_task_dealloc(v243);
  swift_task_dealloc(v244);
  swift_task_dealloc(v246);
  swift_task_dealloc(v249);
  swift_task_dealloc(v252);
  swift_task_dealloc(v256);
  swift_task_dealloc(v263);
  swift_task_dealloc(v269);
  swift_task_dealloc(v273);
  swift_task_dealloc(v280);
  return (*(uint64_t (**)(void *))(v0 + 8))(v281);
}

uint64_t sub_1000381B4()
{
  uint64_t v1 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 1184) + 8LL))( *(void *)(v0 + 1200),  *(void *)(v0 + 1176));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "Task.sleep interrupted, skipping waiting for extension completion.",  v4,  2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  swift_errorRelease(*(void *)(v0 + 1864));

  uint64_t v5 = *(void *)(v0 + 1760);
  uint64_t v6 = *(void *)(v0 + 1264);
  uint64_t v7 = *(void *)(v0 + 1224);
  uint64_t v8 = *(void *)(v0 + 1216);
  static ContinuousClock.now.getter(v9);
  uint64_t v10 = ContinuousClock.Instant.duration(to:)(v6);
  uint64_t v12 = v11;
  BOOL v13 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 1816) = v13;
  v13(v6, v8);
  uint64_t v14 = *(void **)(v5 + 16);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
  if (v14)
  {
    uint64_t v271 = v13;
    v15(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
    id v275 = v14;
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v275);
    os_log_type_t v17 = static os_log_type_t.info.getter(v16);
    BOOL v18 = os_log_type_enabled(v16, v17);
    unint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
    uint64_t v20 = *(void *)(v0 + 1496);
    uint64_t v21 = *(void *)(v0 + 1440);
    Swift::String v216 = v14;
    if (v18)
    {
      uint64_t v252 = v16;
      uint64_t v265 = v12;
      uint64_t v22 = swift_slowAlloc(32LL, -1LL);
      uint64_t v247 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v258 = swift_slowAlloc(64LL, -1LL);
      uint64_t v286 = v258;
      *(_DWORD *)uint64_t v22 = 136315650;
      uint64_t v23 = MLHostTask.name.getter(v258);
      os_log_type_t v241 = v17;
      id v24 = v14;
      unint64_t v26 = v25;
      *(void *)(v0 + 1032) = sub_10000B540(v23, v25, &v286);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1032, v0 + 1040, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease(v26);
      v19(v20, v21);
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v27 = Duration.description.getter(v10, v265);
      unint64_t v29 = v28;
      *(void *)(v0 + 1040) = sub_10000B540(v27, v28, &v286);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1040, v0 + 1048, v22 + 14, v22 + 22);
      swift_bridgeObjectRelease(v29);
      *(_WORD *)(v22 + 22) = 2112;
      *(void *)(v0 + 1048) = v275;
      id v30 = v275;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1048, v0 + 1056, v22 + 24, v22 + 32);
      *uint64_t v247 = v24;

      uint64_t v31 = v252;
      _os_log_impl( (void *)&_mh_execute_header,  v252,  v241,  "Task %s completed after %s. TaskResult: %@",  (uint8_t *)v22,  0x20u);
      uint64_t v32 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v247, 1LL, v32);
      swift_slowDealloc(v247, -1LL, -1LL);
      swift_arrayDestroy(v258, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v258, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    else
    {
      v19(v20, v21);

      uint64_t v31 = (os_log_s *)v275;
    }

    uint64_t v54 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
    uint64_t v55 = *(void *)(v0 + 1728);
    uint64_t v56 = *(void *)(v0 + 1432);
    uint64_t v57 = *(void *)(v0 + 1424);
    uint64_t v58 = *(void *)(v0 + 1416);
    uint64_t v60 = MLHostTask.name.getter(v59);
    uint64_t v62 = v61;
    uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
    v63(v56, v55, v58);
    sub_100013D50(v60, v62, v56);
    swift_bridgeObjectRelease(v62);
    uint64_t v64 = v54(v56, v58);
    uint64_t v65 = MLHostTask.name.getter(v64);
    uint64_t v67 = v66;
    sub_100013A80(v65, v66);
    uint64_t v68 = swift_bridgeObjectRelease(v67);
    uint64_t v69 = MLHostResult.status.getter(v68);
    uint64_t v70 = MLHostResultStatus.rawValue.getter(v69);
    uint64_t v71 = MLHostResultStatus.rawValue.getter(1LL);
    uint64_t v72 = *(void *)(v0 + 1808);
    uint64_t v73 = *(void *)(v0 + 1768);
    if (v70 == v71)
    {
      uint64_t v74 = *(void **)(v0 + 1752);
      uint64_t v75 = *(void *)(v0 + 1744);
      v271(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
      swift_unknownObjectRelease(v75);
    }

    else
    {
      uint64_t v277 = *(void **)(v0 + 1752);
      unsigned int v248 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v254 = *(void *)(v0 + 1744);
      uint64_t v76 = *(void *)(v0 + 1728);
      uint64_t v77 = *(void *)(v0 + 1432);
      uint64_t v78 = *(void *)(v0 + 1416);
      uint64_t v260 = *(void *)(v0 + 1216);
      uint64_t v266 = *(void *)(v0 + 1272);
      unsigned int v244 = [*(id *)(v0 + 1704) processIdentifier];
      uint64_t v286 = 0LL;
      uint64_t v287 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(38LL);
      uint64_t v79 = v287;
      *(void *)(v0 + 840) = v286;
      *(void *)(v0 + 848) = v79;
      v80._uint64_t countAndFlagsBits = 0x206B736154LL;
      v80._object = (void *)0xE500000000000000LL;
      String.append(_:)(v80);
      v82._uint64_t countAndFlagsBits = MLHostTask.name.getter(v81);
      object = v82._object;
      String.append(_:)(v82);
      swift_bridgeObjectRelease(object);
      v84._object = (void *)0x800000010004A570LL;
      v84._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v84);
      v63(v77, v76, v78);
      _print_unlocked<A, B>(_:_:)( v77,  v0 + 840,  v78,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
      v248(v77, v78);
      v85._uint64_t countAndFlagsBits = 46LL;
      v85._object = (void *)0xE100000000000000LL;
      String.append(_:)(v85);
      uint64_t v86 = *(void *)(v0 + 848);
      sub_1000305D8(v244, *(void *)(v0 + 840), v86);
      swift_unknownObjectRelease(v254);
      swift_bridgeObjectRelease(v86);

      v271(v266, v260);
    }

    swift_release(v73);
    swift_release(v72);
    uint64_t v87 = *(void *)(v0 + 1760);
    uint64_t v88 = *(void **)(v0 + 1704);
    uint64_t v89 = *(void *)(v0 + 1672);
    uint64_t v90 = *(void *)(v0 + 1408);
    uint64_t v91 = *(void *)(v0 + 1400);
    uint64_t v92 = *(void *)(v0 + 1392);
    uint64_t v93 = *(void *)(v0 + 1168);
    swift_release(*(void *)(v0 + 1720));
    swift_release(v87);
    [v88 invalidate];

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v90, v92);
  }

  else
  {
    uint64_t v33 = *(void *)(v0 + 1488);
    uint64_t v34 = *(void *)(v0 + 1440);
    uint64_t v35 = *(void *)(v0 + 1152);
    (*(void (**)(void, void, void))(v0 + 1688))( *(void *)(v0 + 1624),  *(void *)(v0 + 1680),  *(void *)(v0 + 1592));
    uint64_t v36 = v15(v33, v35, v34);
    uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.info.getter(v37);
    BOOL v39 = os_log_type_enabled(v37, v38);
    uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
    uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1776);
    uint64_t v42 = *(void *)(v0 + 1624);
    uint64_t v276 = *(void *)(v0 + 1592);
    uint64_t v43 = *(void *)(v0 + 1488);
    uint64_t v44 = *(void *)(v0 + 1440);
    if (v39)
    {
      uint64_t v259 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1776);
      uint64_t v45 = swift_slowAlloc(22LL, -1LL);
      uint64_t v242 = v10;
      uint64_t v46 = swift_slowAlloc(64LL, -1LL);
      uint64_t v286 = v46;
      *(_DWORD *)uint64_t v45 = 136315394;
      uint64_t v47 = MLHostTask.name.getter(v46);
      uint64_t v253 = v42;
      unint64_t v49 = v48;
      *(void *)(v0 + 1008) = sub_10000B540(v47, v48, &v286);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1008, v0 + 1016, v45 + 4, v45 + 12);
      swift_bridgeObjectRelease(v49);
      v40(v43, v44);
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v50 = Duration.description.getter(v242, v12);
      unint64_t v52 = v51;
      *(void *)(v0 + 1016) = sub_10000B540(v50, v51, &v286);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1016, v0 + 1024, v45 + 14, v45 + 22);
      swift_bridgeObjectRelease(v52);
      _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "Task %s asked to terminate because of deferral after %s.",  (uint8_t *)v45,  0x16u);
      swift_arrayDestroy(v46, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1LL, -1LL);
      swift_slowDealloc(v45, -1LL, -1LL);

      uint64_t v53 = v259(v253, v276);
    }

    else
    {
      v40(*(void *)(v0 + 1488), *(void *)(v0 + 1440));

      uint64_t v53 = v41(v42, v276);
    }

    uint64_t v94 = *(void *)(v0 + 1760);
    uint64_t v95 = *(void **)(v0 + 1744);
    static ContinuousClock.now.getter(v53);
    uint64_t v96 = swift_allocObject(&unk_100056120, 32LL, 7LL);
    *(void *)(v0 + 1824) = v96;
    *(void *)(v96 + 16) = 0LL;
    *(void *)(v96 + 24) = 0LL;
    [v95 doStop];
    uint64_t v97 = *(void **)(v94 + 16);
    if (v97) {
      goto LABEL_15;
    }
    uint64_t v154 = static Duration.< infix(_:_:)(5000000000000000000LL, 0LL, 0LL, 0LL);
    if ((v154 & 1) == 0)
    {
      uint64_t v178 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v179 = *(void *)(v0 + 1264);
      uint64_t v180 = *(void *)(v0 + 1216);
      uint64_t v181 = *(void *)(v0 + 1176);
      ContinuousClock.init()();
      *(void *)(v0 + 856) = 500000000000000000LL;
      *(void *)(v0 + 864) = 0LL;
      *(_OWORD *)(v0 + 816) = 0u;
      *(_BYTE *)(v0 + 832) = 1;
      uint64_t v182 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
      dispatch thunk of Clock.now.getter(v181, v182);
      uint64_t v183 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
      dispatch thunk of InstantProtocol.advanced(by:)(v0 + 856, v180, v183);
      v178(v179, v180);
      uint64_t v184 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
      *(void *)(v0 + 1832) = v184;
      *uint64_t v184 = v0;
      v184[1] = sub_1000353B0;
      return dispatch thunk of Clock.sleep(until:tolerance:)( *(void *)(v0 + 1248),  v0 + 816,  *(void *)(v0 + 1176),  v182);
    }

    uint64_t v97 = *(void **)(*(void *)(v0 + 1760) + 16LL);
    if (v97)
    {
LABEL_15:
      uint64_t v278 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v98 = *(void *)(v0 + 1728);
      uint64_t v99 = *(void *)(v0 + 1432);
      uint64_t v100 = *(void *)(v0 + 1424);
      uint64_t v101 = *(void *)(v0 + 1416);
      id v102 = v97;
      uint64_t v103 = MLHostTask.name.getter(v102);
      uint64_t v105 = v104;
      uint64_t v106 = *(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 16);
      v106(v99, v98, v101);
      sub_100013D50(v103, v105, v99);
      swift_bridgeObjectRelease(v105);
      uint64_t v107 = v278(v99, v101);
      uint64_t v108 = MLHostTask.name.getter(v107);
      uint64_t v110 = v109;
      sub_100013A80(v108, v109);
      uint64_t v111 = swift_bridgeObjectRelease(v110);
      uint64_t v112 = MLHostResult.status.getter(v111);
      uint64_t v113 = MLHostResultStatus.rawValue.getter(v112);
      if (v113 != MLHostResultStatus.rawValue.getter(1LL))
      {
        uint64_t v279 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
        uint64_t v114 = *(void *)(v0 + 1728);
        uint64_t v115 = *(void *)(v0 + 1432);
        uint64_t v116 = *(void *)(v0 + 1416);
        id v117 = [*(id *)(v0 + 1704) processIdentifier];
        uint64_t v286 = 0LL;
        uint64_t v287 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        uint64_t v118 = v287;
        *(void *)(v0 + 904) = v286;
        *(void *)(v0 + 912) = v118;
        v119._uint64_t countAndFlagsBits = 0x206B736154LL;
        v119._object = (void *)0xE500000000000000LL;
        String.append(_:)(v119);
        v121._uint64_t countAndFlagsBits = MLHostTask.name.getter(v120);
        id v122 = v121._object;
        String.append(_:)(v121);
        swift_bridgeObjectRelease(v122);
        v123._object = (void *)0x800000010004A570LL;
        v123._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v123);
        v106(v115, v114, v116);
        _print_unlocked<A, B>(_:_:)( v115,  v0 + 904,  v116,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v279(v115, v116);
        v124._uint64_t countAndFlagsBits = 46LL;
        v124._object = (void *)0xE100000000000000LL;
        String.append(_:)(v124);
        uint64_t v125 = *(void *)(v0 + 912);
        sub_1000305D8((uint64_t)v117, *(void *)(v0 + 904), v125);
        swift_bridgeObjectRelease(v125);
      }
    }

    else
    {
      uint64_t v155 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
      uint64_t v281 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
      uint64_t v245 = *(void *)(v0 + 1680);
      uint64_t v250 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v156 = *(void *)(v0 + 1616);
      uint64_t v157 = *(void *)(v0 + 1592);
      uint64_t v255 = *(void *)(v0 + 1480);
      uint64_t v262 = *(void *)(v0 + 1440);
      uint64_t v268 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
      uint64_t v158 = *(void *)(v0 + 1432);
      uint64_t v159 = *(void *)(v0 + 1416);
      uint64_t v160 = *(void *)(v0 + 1152);
      uint64_t v161 = MLHostTask.name.getter(v154);
      uint64_t v163 = v162;
      v155(v158, enum case for TaskStatus.taskDeferred(_:), v159);
      sub_100013D50(v161, v163, v158);
      swift_bridgeObjectRelease(v163);
      v250(v158, v159);
      v268(v156, v245, v157);
      uint64_t v164 = v281(v255, v160, v262);
      uint64_t v165 = (os_log_s *)Logger.logObject.getter(v164);
      os_log_type_t v166 = static os_log_type_t.error.getter();
      BOOL v167 = os_log_type_enabled(v165, v166);
      uint64_t v168 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
      uint64_t v169 = *(void *)(v0 + 1616);
      uint64_t v170 = *(void *)(v0 + 1592);
      uint64_t v171 = *(void *)(v0 + 1480);
      uint64_t v172 = *(void *)(v0 + 1440);
      if (v167)
      {
        uint64_t v282 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
        uint64_t v256 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
        uint64_t v269 = *(void *)(v0 + 1592);
        BOOL v173 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v174 = swift_slowAlloc(32LL, -1LL);
        uint64_t v286 = v174;
        *(_DWORD *)BOOL v173 = 136315138;
        uint64_t v175 = MLHostTask.name.getter(v174);
        uint64_t v263 = v169;
        unint64_t v177 = v176;
        *(void *)(v0 + 976) = sub_10000B540(v175, v176, &v286);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 976, v0 + 984, v173 + 4, v173 + 12);
        swift_bridgeObjectRelease(v177);
        v256(v171, v172);
        _os_log_impl( (void *)&_mh_execute_header,  v165,  v166,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v173,  0xCu);
        swift_arrayDestroy(v174, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v174, -1LL, -1LL);
        swift_slowDealloc(v173, -1LL, -1LL);

        v282(v263, v269);
      }

      else
      {
        (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

        v168(v169, v170);
      }

      id v209 = [*(id *)(v0 + 1704) processIdentifier];
      uint64_t v286 = 0LL;
      uint64_t v287 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(38LL);
      v210._uint64_t countAndFlagsBits = 0x206B736154LL;
      v210._object = (void *)0xE500000000000000LL;
      String.append(_:)(v210);
      v212._uint64_t countAndFlagsBits = MLHostTask.name.getter(v211);
      uint64_t v213 = v212._object;
      String.append(_:)(v212);
      swift_bridgeObjectRelease(v213);
      v214._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      v214._object = (void *)0x800000010004A550LL;
      String.append(_:)(v214);
      uint64_t v215 = v287;
      sub_1000305D8((uint64_t)v209, v286, v287);
      swift_bridgeObjectRelease(v215);
    }

    uint64_t v126 = *(void *)(v0 + 1760);
    (*(void (**)(void, void, void))(v0 + 1696))( *(void *)(v0 + 1472),  *(void *)(v0 + 1152),  *(void *)(v0 + 1440));
    uint64_t v127 = swift_retain_n(v126, 2LL);
    Swift::String v128 = (os_log_s *)Logger.logObject.getter(v127);
    os_log_type_t v129 = static os_log_type_t.info.getter(v128);
    BOOL v130 = os_log_type_enabled(v128, v129);
    uint64_t v280 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
    if (v130)
    {
      uint64_t v131 = *(void *)(v0 + 1824);
      uint64_t v132 = *(void *)(v0 + 1472);
      uint64_t v238 = *(void *)(v0 + 1440);
      uint64_t v249 = *(void *)(v0 + 1760);
      uint64_t v133 = swift_slowAlloc(32LL, -1LL);
      uint64_t v261 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v267 = swift_slowAlloc(64LL, -1LL);
      uint64_t v286 = v267;
      *(_DWORD *)uint64_t v133 = 136315650;
      uint64_t v134 = MLHostTask.name.getter(v267);
      unint64_t v136 = v135;
      *(void *)(v0 + 936) = sub_10000B540(v134, v135, &v286);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 936, v0 + 944, v133 + 4, v133 + 12);
      swift_retain(v131);
      swift_bridgeObjectRelease(v136);
      v280(v132, v238);
      *(_WORD *)(v133 + 12) = 2080;
      swift_beginAccess(v131 + 16, v0 + 696, 0LL, 0LL);
      uint64_t v137 = Duration.description.getter(*(void *)(v131 + 16), *(void *)(v131 + 24));
      unint64_t v139 = v138;
      *(void *)(v0 + 952) = sub_10000B540(v137, v138, &v286);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960, v133 + 14, v133 + 22);
      swift_release(v131);
      swift_bridgeObjectRelease(v139);
      *(_WORD *)(v133 + 22) = 2112;
      unint64_t v140 = *(void **)(v249 + 16);
      if (v140)
      {
        *(void *)(v0 + 968) = v140;
        id v141 = v140;
        uint64_t v142 = v0 + 968;
        uint64_t v143 = v0 + 976;
        uint64_t v144 = v133 + 24;
        uint64_t v145 = v133 + 32;
      }

      else
      {
        uint64_t v145 = v133 + 32;
        *(void *)(v0 + 960) = 0LL;
        uint64_t v142 = v0 + 960;
        uint64_t v143 = v0 + 968;
        uint64_t v144 = v133 + 24;
      }

      UnsafeMutableRawBufferPointer.copyMemory(from:)(v142, v143, v144, v145);
      uint64_t v186 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v187 = *(void *)(v0 + 1760);
      uint64_t v188 = *(void *)(v0 + 1744);
      uint64_t v272 = *(void **)(v0 + 1752);
      uint64_t v283 = *(void *)(v0 + 1272);
      uint64_t v189 = *(void *)(v0 + 1256);
      uint64_t v190 = *(void *)(v0 + 1216);
      *uint64_t v261 = v140;
      swift_release_n(v187, 2LL);
      _os_log_impl( (void *)&_mh_execute_header,  v128,  v129,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v133,  0x20u);
      uint64_t v191 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v261, 1LL, v191);
      swift_slowDealloc(v261, -1LL, -1LL);
      swift_arrayDestroy(v267, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v267, -1LL, -1LL);
      swift_slowDealloc(v133, -1LL, -1LL);
      swift_unknownObjectRelease(v188);

      v186(v189, v190);
      v186(v283, v190);
    }

    else
    {
      uint64_t v146 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      id v147 = *(void **)(v0 + 1752);
      uint64_t v148 = *(void *)(v0 + 1744);
      uint64_t v149 = *(void *)(v0 + 1472);
      uint64_t v150 = *(void *)(v0 + 1440);
      uint64_t v151 = *(void *)(v0 + 1272);
      uint64_t v152 = *(void *)(v0 + 1256);
      uint64_t v153 = *(void *)(v0 + 1216);
      swift_release_n(*(void *)(v0 + 1760), 2LL);
      swift_unknownObjectRelease(v148);

      v280(v149, v150);
      v146(v152, v153);
      v146(v151, v153);
    }

    uint64_t v192 = *(void *)(v0 + 1824);
    uint64_t v193 = *(void *)(v0 + 1808);
    uint64_t v194 = *(void *)(v0 + 1768);
    uint64_t v195 = *(void *)(v0 + 1760);
    uint64_t v196 = *(void *)(v0 + 1720);
    uint64_t v197 = *(void **)(v0 + 1704);
    uint64_t v89 = *(void *)(v0 + 1672);
    uint64_t v198 = *(void *)(v0 + 1408);
    uint64_t v273 = *(void *)(v0 + 1400);
    uint64_t v284 = *(void *)(v0 + 1392);
    uint64_t v93 = *(void *)(v0 + 1168);
    Swift::String v216 = *(void **)(v195 + 16);
    id v199 = v216;
    swift_release(v196);
    swift_release(v195);
    swift_release(v194);
    swift_release(v193);
    swift_release(v192);
    [v197 invalidate];

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v273 + 8))(v198, v284);
  }

  swift_release_n(v93, 2LL);
  swift_unknownObjectRelease(v89);
  uint64_t v200 = *(void *)(v0 + 1656);
  uint64_t v201 = *(void *)(v0 + 1648);
  uint64_t v202 = *(void *)(v0 + 1640);
  uint64_t v203 = *(void *)(v0 + 1632);
  uint64_t v204 = *(void *)(v0 + 1624);
  uint64_t v205 = *(void *)(v0 + 1616);
  uint64_t v206 = *(void *)(v0 + 1608);
  uint64_t v207 = *(void *)(v0 + 1584);
  uint64_t v208 = *(void *)(v0 + 1576);
  uint64_t v217 = *(void *)(v0 + 1568);
  uint64_t v218 = *(void *)(v0 + 1560);
  uint64_t v219 = *(void *)(v0 + 1552);
  uint64_t v220 = *(void *)(v0 + 1544);
  uint64_t v221 = *(void *)(v0 + 1536);
  uint64_t v222 = *(void *)(v0 + 1528);
  uint64_t v223 = *(void *)(v0 + 1520);
  uint64_t v224 = *(void *)(v0 + 1512);
  uint64_t v225 = *(void *)(v0 + 1504);
  uint64_t v226 = *(void *)(v0 + 1496);
  uint64_t v227 = *(void *)(v0 + 1488);
  uint64_t v228 = *(void *)(v0 + 1480);
  uint64_t v229 = *(void *)(v0 + 1472);
  uint64_t v230 = *(void *)(v0 + 1464);
  uint64_t v231 = *(void *)(v0 + 1432);
  uint64_t v232 = *(void *)(v0 + 1408);
  uint64_t v233 = *(void *)(v0 + 1384);
  uint64_t v234 = *(void *)(v0 + 1376);
  uint64_t v235 = *(void *)(v0 + 1352);
  uint64_t v236 = *(void *)(v0 + 1344);
  uint64_t v237 = *(void *)(v0 + 1320);
  uint64_t v239 = *(void *)(v0 + 1296);
  uint64_t v240 = *(void *)(v0 + 1272);
  uint64_t v243 = *(void *)(v0 + 1264);
  uint64_t v246 = *(void *)(v0 + 1256);
  uint64_t v251 = *(void *)(v0 + 1248);
  uint64_t v257 = *(void *)(v0 + 1240);
  uint64_t v264 = *(void *)(v0 + 1232);
  uint64_t v270 = *(void *)(v0 + 1208);
  uint64_t v274 = *(void *)(v0 + 1200);
  uint64_t v285 = *(void *)(v0 + 1192);
  swift_task_dealloc(*(void *)(v0 + 1664));
  swift_task_dealloc(v200);
  swift_task_dealloc(v201);
  swift_task_dealloc(v202);
  swift_task_dealloc(v203);
  swift_task_dealloc(v204);
  swift_task_dealloc(v205);
  swift_task_dealloc(v206);
  swift_task_dealloc(v207);
  swift_task_dealloc(v208);
  swift_task_dealloc(v217);
  swift_task_dealloc(v218);
  swift_task_dealloc(v219);
  swift_task_dealloc(v220);
  swift_task_dealloc(v221);
  swift_task_dealloc(v222);
  swift_task_dealloc(v223);
  swift_task_dealloc(v224);
  swift_task_dealloc(v225);
  swift_task_dealloc(v226);
  swift_task_dealloc(v227);
  swift_task_dealloc(v228);
  swift_task_dealloc(v229);
  swift_task_dealloc(v230);
  swift_task_dealloc(v231);
  swift_task_dealloc(v232);
  swift_task_dealloc(v233);
  swift_task_dealloc(v234);
  swift_task_dealloc(v235);
  swift_task_dealloc(v236);
  swift_task_dealloc(v237);
  swift_task_dealloc(v239);
  swift_task_dealloc(v240);
  swift_task_dealloc(v243);
  swift_task_dealloc(v246);
  swift_task_dealloc(v251);
  swift_task_dealloc(v257);
  swift_task_dealloc(v264);
  swift_task_dealloc(v270);
  swift_task_dealloc(v274);
  swift_task_dealloc(v285);
  return (*(uint64_t (**)(void *))(v0 + 8))(v216);
}

uint64_t sub_100039584()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1880);
  *(void *)(*v1 + 1888) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 1872))(*(void *)(v2 + 1232), *(void *)(v2 + 1216));
    uint64_t v4 = sub_10003BC64;
  }

  else
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 1872);
    uint64_t v6 = *(void *)(v2 + 1232);
    uint64_t v7 = *(void *)(v2 + 1216);
    uint64_t v8 = *(void *)(v2 + 1192);
    uint64_t v9 = *(void *)(v2 + 1184);
    uint64_t v10 = *(void *)(v2 + 1176);
    v5(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v4 = sub_100039670;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100039670(uint64_t a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v1 + 1872);
  uint64_t v3 = *(void *)(v1 + 1808);
  uint64_t v4 = *(void *)(v1 + 1264);
  uint64_t v5 = *(void *)(v1 + 1216);
  uint64_t v6 = *(void *)(v1 + 1168);
  static ContinuousClock.now.getter(a1);
  uint64_t v7 = ContinuousClock.Instant.duration(to:)(v4);
  uint64_t v9 = v8;
  v2(v4, v5);
  *(void *)(v3 + 16) = v7;
  *(void *)(v3 + 24) = v9;
  if ((*(_BYTE *)(v6 + 16) & 1) == 0
    && *(_BYTE *)(*(void *)(v1 + 1768) + 16LL) == 2
    && (static Duration.< infix(_:_:)(0xA055690D9DB80000LL, 1LL, v7, v9) & 1) == 0)
  {
    uint64_t v95 = *(void *)(v1 + 1264);
    uint64_t v96 = *(void *)(v1 + 1224);
    uint64_t v97 = *(void *)(v1 + 1216);
    uint64_t v98 = *(void *)(v1 + 1176);
    ((void (*)(void))ContinuousClock.init())();
    *(void *)(v1 + 872) = 500000000000000000LL;
    *(void *)(v1 + 880) = 0LL;
    *(_OWORD *)(v1 + 768) = 0u;
    *(_BYTE *)(v1 + 784) = 1;
    uint64_t v99 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v98, v99);
    uint64_t v100 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v1 + 872, v97, v100);
    uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
    *(void *)(v1 + 1872) = v101;
    v101(v95, v97);
    id v102 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(void *)(v1 + 1880) = v102;
    *id v102 = v1;
    v102[1] = sub_100039584;
    uint64_t v103 = *(void *)(v1 + 1232);
    uint64_t v104 = *(void *)(v1 + 1176);
    uint64_t v105 = v1 + 768;
    goto LABEL_19;
  }

  uint64_t v10 = *(void *)(v1 + 1168);
  swift_beginAccess(v10 + 16, v1 + 552, 0LL, 0LL);
  if ((*(_BYTE *)(v10 + 16) & 1) != 0
    || (uint64_t v11 = *(void *)(v1 + 1768), v12 = swift_beginAccess(v11 + 16, v1 + 576, 0LL, 0LL), *(_BYTE *)(v11 + 16) != 2))
  {
    uint64_t v36 = *(void *)(v1 + 1768);
    swift_beginAccess(v36 + 16, v1 + 624, 0LL, 0LL);
    int v37 = *(unsigned __int8 *)(v36 + 16);
    uint64_t v38 = *(void *)(v1 + 1440);
    uint64_t v39 = *(void *)(v1 + 1152);
    if (v37 == 2)
    {
      uint64_t v40 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v1 + 1696))(*(void *)(v1 + 1520), v39, v38);
      uint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
      os_log_type_t v42 = static os_log_type_t.info.getter(v41);
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = *(void *)(v1 + 1808);
        uint64_t v44 = *(void *)(v1 + 1520);
        uint64_t v421 = *(void *)(v1 + 1440);
        v429 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
        v442 = (unsigned __int8 *)(*(void *)(v1 + 1168) + 16LL);
        uint64_t v45 = swift_slowAlloc(28LL, -1LL);
        uint64_t v491 = swift_slowAlloc(64LL, -1LL);
        uint64_t v513 = v491;
        *(_DWORD *)uint64_t v45 = 136315650;
        uint64_t v46 = MLHostTask.name.getter(v491);
        unint64_t v48 = v47;
        *(void *)(v1 + 1000) = sub_10000B540(v46, v47, &v513);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1000, v1 + 1008, v45 + 4, v45 + 12);
        swift_retain(v43);
        swift_bridgeObjectRelease(v48);
        v429(v44, v421);
        *(_WORD *)(v45 + 12) = 1024;
        swift_beginAccess(v442, v1 + 672, 0LL, 0LL);
        *(_DWORD *)(v1 + 1900) = *v442;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1900, v1 + 1904, v45 + 14, v45 + 18);
        *(_WORD *)(v45 + 18) = 2080;
        swift_beginAccess(v43 + 16, v1 + 720, 0LL, 0LL);
        uint64_t v49 = Duration.description.getter(*(void *)(v43 + 16), *(void *)(v43 + 24));
        unint64_t v51 = v50;
        *(void *)(v1 + 984) = sub_10000B540(v49, v50, &v513);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 984, v1 + 992, v45 + 20, v45 + 28);
        swift_release(v43);
        swift_bridgeObjectRelease(v51);
        _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.",  (uint8_t *)v45,  0x1Cu);
        swift_arrayDestroy(v491, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v491, -1LL, -1LL);
        swift_slowDealloc(v45, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(void, void))(v1 + 1784))(*(void *)(v1 + 1520), *(void *)(v1 + 1440));
      }

      uint64_t v462 = *(void *)(v1 + 1808);
      v401 = *(void (**)(uint64_t, uint64_t))(v1 + 1800);
      uint64_t v443 = *(void *)(v1 + 1760);
      uint64_t v452 = *(void *)(v1 + 1768);
      v423 = *(void **)(v1 + 1752);
      uint64_t v410 = *(void *)(v1 + 1744);
      uint64_t v65 = *(void (**)(uint64_t, void, uint64_t))(v1 + 1736);
      uint64_t v431 = *(void *)(v1 + 1720);
      uint64_t v66 = *(void **)(v1 + 1704);
      uint64_t v67 = *(void *)(v1 + 1432);
      uint64_t v68 = *(void *)(v1 + 1416);
      uint64_t v473 = *(void *)(v1 + 1408);
      uint64_t v482 = *(void *)(v1 + 1672);
      uint64_t v492 = *(void *)(v1 + 1400);
      uint64_t v502 = *(void *)(v1 + 1392);
      uint64_t v405 = *(void *)(v1 + 1224);
      uint64_t v414 = *(void *)(v1 + 1216);
      uint64_t v418 = *(void *)(v1 + 1272);
      uint64_t v69 = *(void *)(v1 + 1168);
      uint64_t v71 = MLHostTask.name.getter(v70);
      uint64_t v73 = v72;
      v65(v67, enum case for TaskStatus.taskDeferred(_:), v68);
      sub_100013D50(v71, v73, v67);
      swift_bridgeObjectRelease(v73);
      v401(v67, v68);
      id v74 = [v66 processIdentifier];
      uint64_t v513 = 0LL;
      uint64_t v514 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(37LL);
      v75._uint64_t countAndFlagsBits = 0x206B736154LL;
      v75._object = (void *)0xE500000000000000LL;
      String.append(_:)(v75);
      v77._uint64_t countAndFlagsBits = MLHostTask.name.getter(v76);
      object = v77._object;
      String.append(_:)(v77);
      swift_bridgeObjectRelease(object);
      v79._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      v79._object = (void *)0x800000010004A510LL;
      String.append(_:)(v79);
      uint64_t v80 = v514;
      sub_1000305D8((uint64_t)v74, v513, v514);
      swift_unknownObjectRelease(v410);
      swift_bridgeObjectRelease(v80);

      (*(void (**)(uint64_t, uint64_t))(v405 + 8))(v418, v414);
      swift_release(v431);
      swift_release(v443);
      swift_release(v452);
      swift_release(v462);
      [v66 invalidate];

      uint64_t v81 = v482;
      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v492 + 8))(v473, v502);
      goto LABEL_23;
    }

    unint64_t v52 = *(uint64_t (**)(void, uint64_t, uint64_t))(v1 + 1696);
    if ((v37 & 1) == 0)
    {
      uint64_t v53 = v52(*(void *)(v1 + 1504), v39, v38);
      uint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
      os_log_type_t v55 = static os_log_type_t.info.getter(v54);
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = *(void *)(v1 + 1808);
        uint64_t v430 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
        uint64_t v57 = *(void *)(v1 + 1504);
        uint64_t v422 = *(void *)(v1 + 1440);
        uint64_t v58 = swift_slowAlloc(28LL, -1LL);
        uint64_t v481 = swift_slowAlloc(64LL, -1LL);
        uint64_t v513 = v481;
        *(_DWORD *)uint64_t v58 = 136315650;
        uint64_t v59 = MLHostTask.name.getter(v481);
        unint64_t v61 = v60;
        *(void *)(v1 + 944) = sub_10000B540(v59, v60, &v513);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 944, v1 + 952, v58 + 4, v58 + 12);
        swift_retain(v56);
        swift_bridgeObjectRelease(v61);
        v430(v57, v422);
        *(_WORD *)(v58 + 12) = 1024;
        *(_DWORD *)(v1 + 1896) = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1896, v1 + 1900, v58 + 14, v58 + 18);
        *(_WORD *)(v58 + 18) = 2080;
        swift_beginAccess(v56 + 16, v1 + 600, 0LL, 0LL);
        uint64_t v62 = Duration.description.getter(*(void *)(v56 + 16), *(void *)(v56 + 24));
        unint64_t v64 = v63;
        *(void *)(v1 + 920) = sub_10000B540(v62, v63, &v513);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 920, v1 + 928, v58 + 20, v58 + 28);
        swift_release(v56);
        swift_bridgeObjectRelease(v64);
        _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.",  (uint8_t *)v58,  0x1Cu);
        swift_arrayDestroy(v481, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v481, -1LL, -1LL);
        swift_slowDealloc(v58, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(void, void))(v1 + 1784))(*(void *)(v1 + 1504), *(void *)(v1 + 1440));
      }

      uint64_t v454 = *(void *)(v1 + 1808);
      Swift::String v395 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1800);
      uint64_t v445 = *(void *)(v1 + 1768);
      uint64_t v425 = *(void *)(v1 + 1760);
      unint64_t v505 = *(void **)(v1 + 1752);
      uint64_t v407 = *(void *)(v1 + 1744);
      Swift::String v124 = *(void (**)(uint64_t, void, uint64_t))(v1 + 1736);
      uint64_t v433 = *(void *)(v1 + 1720);
      id v398 = *(id *)(v1 + 1704);
      uint64_t v81 = *(void *)(v1 + 1672);
      uint64_t v125 = *(void *)(v1 + 1432);
      uint64_t v126 = *(void *)(v1 + 1416);
      uint64_t v464 = *(void *)(v1 + 1408);
      uint64_t v475 = *(void *)(v1 + 1400);
      uint64_t v484 = *(void *)(v1 + 1392);
      uint64_t v402 = *(void *)(v1 + 1224);
      uint64_t v415 = *(void *)(v1 + 1216);
      uint64_t v419 = *(void *)(v1 + 1272);
      uint64_t v69 = *(void *)(v1 + 1168);
      uint64_t v128 = MLHostTask.name.getter(v127);
      uint64_t v130 = v129;
      v124(v125, enum case for TaskStatus.taskFailed(_:), v126);
      sub_100013D50(v128, v130, v125);
      swift_bridgeObjectRelease(v130);
      uint64_t v131 = v395(v125, v126);
      uint64_t v132 = MLHostTask.name.getter(v131);
      uint64_t v134 = v133;
      sub_100013A80(v132, v133);
      swift_bridgeObjectRelease(v134);
      id v135 = [v398 processIdentifier];
      uint64_t v513 = 0LL;
      uint64_t v514 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(27LL);
      v136._uint64_t countAndFlagsBits = 0x206B736154LL;
      v136._object = (void *)0xE500000000000000LL;
      String.append(_:)(v136);
      v138._uint64_t countAndFlagsBits = MLHostTask.name.getter(v137);
      unint64_t v139 = v138._object;
      String.append(_:)(v138);
      swift_bridgeObjectRelease(v139);
      v140._uint64_t countAndFlagsBits = 0xD000000000000014LL;
      v140._object = (void *)0x800000010004A530LL;
      String.append(_:)(v140);
      uint64_t v141 = v514;
      sub_1000305D8((uint64_t)v135, v513, v514);
      swift_unknownObjectRelease(v407);
      swift_bridgeObjectRelease(v141);

      (*(void (**)(uint64_t, uint64_t))(v402 + 8))(v419, v415);
      swift_beginAccess(v425 + 16, v1 + 744, 0LL, 0LL);
      unint64_t v504 = *(void **)(v425 + 16);
      id v142 = v504;
      swift_release(v433);
      swift_release(v425);
      swift_release(v445);
      swift_release(v454);
      [v398 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v475 + 8))(v464, v484);
      goto LABEL_58;
    }

    unint64_t v382 = (uint64_t *)(v1 + 1008);
    uint64_t v82 = v52(*(void *)(v1 + 1512), v39, v38);
    uint64_t v83 = (os_log_s *)Logger.logObject.getter(v82);
    os_log_type_t v84 = static os_log_type_t.info.getter(v83);
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = *(void *)(v1 + 1808);
      unint64_t v411 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
      uint64_t v86 = *(void *)(v1 + 1512);
      uint64_t v406 = *(void *)(v1 + 1440);
      uint64_t v87 = swift_slowAlloc(28LL, -1LL);
      uint64_t v88 = swift_slowAlloc(64LL, -1LL);
      uint64_t v513 = v88;
      *(_DWORD *)uint64_t v87 = 136315650;
      uint64_t v89 = MLHostTask.name.getter(v88);
      unint64_t v91 = v90;
      *(void *)(v1 + 1072) = sub_10000B540(v89, v90, &v513);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1072, v1 + 1080, v87 + 4, v87 + 12);
      swift_retain(v85);
      swift_bridgeObjectRelease(v91);
      v411(v86, v406);
      *(_WORD *)(v87 + 12) = 1024;
      *(_DWORD *)(v1 + 836) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 836, v1 + 840, v87 + 14, v87 + 18);
      *(_WORD *)(v87 + 18) = 2080;
      swift_beginAccess(v85 + 16, v1 + 360, 0LL, 0LL);
      uint64_t v92 = Duration.description.getter(*(void *)(v85 + 16), *(void *)(v85 + 24));
      unint64_t v94 = v93;
      *(void *)(v1 + 1096) = sub_10000B540(v92, v93, &v513);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1096, v1 + 1104, v87 + 20, v87 + 28);
      swift_release(v85);
      swift_bridgeObjectRelease(v94);
      _os_log_impl( (void *)&_mh_execute_header,  v83,  v84,  "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.",  (uint8_t *)v87,  0x1Cu);
      swift_arrayDestroy(v88, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v88, -1LL, -1LL);
      swift_slowDealloc(v87, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(v1 + 1784))(*(void *)(v1 + 1512), *(void *)(v1 + 1440));
    }

    uint64_t v143 = *(void *)(v1 + 1760);
    v426 = *(void **)(v1 + 1744);
    uint64_t v434 = *(void *)(v1 + 1752);
    uint64_t v144 = *(void *)(v1 + 1728);
    uint64_t v408 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1712);
    uint64_t v412 = *(void *)(v1 + 1720);
    uint64_t v145 = *(unsigned __int8 *)(v1 + 1904);
    uint64_t v393 = *(void *)(v1 + 1552);
    uint64_t v396 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1696);
    uint64_t v391 = *(void *)(v1 + 1440);
    uint64_t v146 = *(void *)(v1 + 1432);
    uint64_t v147 = *(void *)(v1 + 1424);
    uint64_t v148 = *(void *)(v1 + 1416);
    uint64_t v403 = *(void *)(v1 + 1160);
    uint64_t v149 = (v145 + 16) & ~v145;
    Swift::String v399 = (char *)((*(void *)(v1 + 1456) + v149 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v150 = (unint64_t)(v399 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v151 = (v150 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v386 = *(void *)(v1 + 1152);
    uint64_t v388 = v145 | 7;
    uint64_t v416 = (_BYTE *)(*(void *)(v1 + 1168) + 16LL);
    (*(void (**)(uint64_t, void, uint64_t))(v1 + 1736))(v146, *(unsigned int *)(v1 + 1908), v148);
    swift_beginAccess(v144, v1 + 504, 1LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 40))(v144, v146, v148);
    swift_beginAccess(v143 + 16, v1 + 408, 1LL, 0LL);
    uint64_t v152 = *(void **)(v143 + 16);
    *(void *)(v143 + 16) = 0LL;

    v396(v393, v386, v391);
    uint64_t v153 = swift_allocObject(&unk_100056148, v151 + 8, v388);
    v408(v153 + v149, v393, v391);
    *(void *)&v399[v153] = v143;
    *(void *)(v153 + v150) = v412;
    *(void *)(v153 + v151) = v403;
    *(void *)(v1 + 48) = sub_10003ECE0;
    *(void *)(v1 + 56) = v153;
    *(void *)(v1 + 16) = _NSConcreteStackBlock;
    *(void *)(v1 + 24) = 1107296256LL;
    *(void *)(v1 + 32) = sub_1000210C0;
    *(void *)(v1 + 40) = &unk_100056160;
    uint64_t v154 = _Block_copy((const void *)(v1 + 16));
    uint64_t v155 = *(void *)(v1 + 56);
    swift_retain(v412);
    swift_retain(v143);
    swift_retain(v403);
    swift_release(v155);
    [v426 doWorkWithContext:v434 reply:v154];
    _Block_release(v154);
    uint64_t v156 = swift_beginAccess(v416, v1 + 528, 0LL, 0LL);
    if (*v416 == 1)
    {
      uint64_t v157 = *(void *)(v1 + 1760);
    }

    else
    {
      uint64_t v156 = swift_beginAccess(*(void *)(v1 + 1168) + 16LL, v1 + 648, 0LL, 0LL);
      uint64_t v157 = *(void *)(v1 + 1760);
      if (!*(void *)(v157 + 16))
      {
        uint64_t v242 = *(void *)(v1 + 1264);
        uint64_t v243 = *(void *)(v1 + 1224);
        uint64_t v244 = *(void *)(v1 + 1216);
        uint64_t v245 = *(void *)(v1 + 1176);
        ContinuousClock.init()(v156);
        *(void *)(v1 + 888) = 500000000000000000LL;
        *(void *)(v1 + 896) = 0LL;
        *(_OWORD *)(v1 + 792) = 0u;
        *(_BYTE *)(v1 + 808) = 1;
        uint64_t v246 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
        dispatch thunk of Clock.now.getter(v245, v246);
        uint64_t v247 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
        dispatch thunk of InstantProtocol.advanced(by:)(v1 + 888, v244, v247);
        unsigned int v248 = *(void (**)(uint64_t, uint64_t))(v243 + 8);
        *(void *)(v1 + 1848) = v248;
        v248(v242, v244);
        uint64_t v249 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
        *(void *)(v1 + 1856) = v249;
        *uint64_t v249 = v1;
        v249[1] = sub_100036C4C;
        uint64_t v104 = *(void *)(v1 + 1176);
        uint64_t v106 = *(void *)(v1 + 1240);
        uint64_t v105 = v1 + 792;
        uint64_t v107 = v246;
        return dispatch thunk of Clock.sleep(until:tolerance:)(v106, v105, v104, v107);
      }
    }

    uint64_t v158 = *(void *)(v1 + 1264);
    uint64_t v159 = *(void *)(v1 + 1224);
    uint64_t v160 = *(void *)(v1 + 1216);
    static ContinuousClock.now.getter(v156);
    uint64_t v161 = ContinuousClock.Instant.duration(to:)(v158);
    uint64_t v163 = v162;
    uint64_t v164 = *(void (**)(uint64_t, uint64_t))(v159 + 8);
    *(void *)(v1 + 1816) = v164;
    v164(v158, v160);
    uint64_t v165 = *(void **)(v157 + 16);
    os_log_type_t v166 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1696);
    if (v165)
    {
      uint64_t v465 = v161;
      v166(*(void *)(v1 + 1496), *(void *)(v1 + 1152), *(void *)(v1 + 1440));
      id v167 = v165;
      uint64_t v168 = (os_log_s *)Logger.logObject.getter(v167);
      os_log_type_t v169 = static os_log_type_t.info.getter(v168);
      BOOL v170 = os_log_type_enabled(v168, v169);
      uint64_t v171 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
      uint64_t v172 = *(void *)(v1 + 1496);
      uint64_t v173 = *(void *)(v1 + 1440);
      unint64_t v504 = v165;
      uint64_t v455 = v164;
      if (v170)
      {
        uint64_t v446 = v163;
        uint64_t v174 = swift_slowAlloc(32LL, -1LL);
        id v435 = (void *)swift_slowAlloc(8LL, -1LL);
        uint64_t v476 = swift_slowAlloc(64LL, -1LL);
        uint64_t v513 = v476;
        *(_DWORD *)uint64_t v174 = 136315650;
        uint64_t v175 = MLHostTask.name.getter(v476);
        unint64_t v176 = v167;
        unint64_t v178 = v177;
        *(void *)(v1 + 1032) = sub_10000B540(v175, v177, &v513);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1032, v1 + 1040, v174 + 4, v174 + 12);
        swift_bridgeObjectRelease(v178);
        v171(v172, v173);
        *(_WORD *)(v174 + 12) = 2080;
        uint64_t v179 = Duration.description.getter(v465, v446);
        unint64_t v181 = v180;
        *(void *)(v1 + 1040) = sub_10000B540(v179, v180, &v513);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1040, v1 + 1048, v174 + 14, v174 + 22);
        swift_bridgeObjectRelease(v181);
        *(_WORD *)(v174 + 22) = 2112;
        *(void *)(v1 + 1048) = v176;
        id v182 = v176;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1048, v1 + 1056, v174 + 24, v174 + 32);
        *id v435 = v504;

        _os_log_impl( (void *)&_mh_execute_header,  v168,  v169,  "Task %s completed after %s. TaskResult: %@",  (uint8_t *)v174,  0x20u);
        uint64_t v183 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v435, 1LL, v183);
        swift_slowDealloc(v435, -1LL, -1LL);
        swift_arrayDestroy(v476, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v476, -1LL, -1LL);
        swift_slowDealloc(v174, -1LL, -1LL);
      }

      else
      {
        v171(v172, v173);
      }

      uint64_t v205 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1800);
      uint64_t v206 = *(void *)(v1 + 1728);
      uint64_t v207 = *(void *)(v1 + 1432);
      uint64_t v208 = *(void *)(v1 + 1424);
      uint64_t v209 = *(void *)(v1 + 1416);
      uint64_t v210 = MLHostTask.name.getter(v184);
      uint64_t v212 = v211;
      uint64_t v213 = *(void (**)(uint64_t, uint64_t, uint64_t))(v208 + 16);
      v213(v207, v206, v209);
      sub_100013D50(v210, v212, v207);
      swift_bridgeObjectRelease(v212);
      uint64_t v214 = v205(v207, v209);
      uint64_t v215 = MLHostTask.name.getter(v214);
      uint64_t v217 = v216;
      sub_100013A80(v215, v216);
      uint64_t v218 = swift_bridgeObjectRelease(v217);
      uint64_t v219 = MLHostResult.status.getter(v218);
      uint64_t v220 = MLHostResultStatus.rawValue.getter(v219);
      uint64_t v221 = MLHostResultStatus.rawValue.getter(1LL);
      uint64_t v222 = *(void *)(v1 + 1808);
      if (v220 == v221)
      {
        uint64_t v223 = *(void *)(v1 + 1768);
        uint64_t v224 = *(void **)(v1 + 1752);
        uint64_t v225 = *(void *)(v1 + 1744);
        v455(*(void *)(v1 + 1272), *(void *)(v1 + 1216));
        swift_unknownObjectRelease(v225);
      }

      else
      {
        uint64_t v447 = *(void (**)(uint64_t, uint64_t))(v1 + 1800);
        uint64_t v223 = *(void *)(v1 + 1768);
        uint64_t v226 = *(void *)(v1 + 1728);
        uint64_t v227 = *(void *)(v1 + 1432);
        uint64_t v228 = *(void *)(v1 + 1416);
        uint64_t v485 = *(void *)(v1 + 1272);
        BOOL v495 = *(void **)(v1 + 1752);
        uint64_t v466 = *(void *)(v1 + 1744);
        uint64_t v477 = *(void *)(v1 + 1216);
        unsigned int v437 = [*(id *)(v1 + 1704) processIdentifier];
        uint64_t v513 = 0LL;
        uint64_t v514 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        uint64_t v229 = v514;
        *(void *)(v1 + 840) = v513;
        *(void *)(v1 + 848) = v229;
        v230._uint64_t countAndFlagsBits = 0x206B736154LL;
        v230._object = (void *)0xE500000000000000LL;
        String.append(_:)(v230);
        v232._uint64_t countAndFlagsBits = MLHostTask.name.getter(v231);
        uint64_t v233 = v232._object;
        String.append(_:)(v232);
        swift_bridgeObjectRelease(v233);
        v234._object = (void *)0x800000010004A570LL;
        v234._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v234);
        v213(v227, v226, v228);
        _print_unlocked<A, B>(_:_:)( v227,  v1 + 840,  v228,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v447(v227, v228);
        v235._uint64_t countAndFlagsBits = 46LL;
        v235._object = (void *)0xE100000000000000LL;
        String.append(_:)(v235);
        uint64_t v236 = *(void *)(v1 + 848);
        sub_1000305D8(v437, *(void *)(v1 + 840), v236);
        swift_unknownObjectRelease(v466);
        swift_bridgeObjectRelease(v236);

        v455(v485, v477);
      }

      swift_release(v223);
      swift_release(v222);
      uint64_t v237 = *(void *)(v1 + 1760);
      uint64_t v238 = *(void **)(v1 + 1704);
      uint64_t v81 = *(void *)(v1 + 1672);
      uint64_t v239 = *(void *)(v1 + 1408);
      uint64_t v240 = *(void *)(v1 + 1400);
      uint64_t v241 = *(void *)(v1 + 1392);
      uint64_t v69 = *(void *)(v1 + 1168);
      swift_release(*(void *)(v1 + 1720));
      swift_release(v237);
      [v238 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v239, v241);
      goto LABEL_58;
    }

    uint64_t v185 = *(void *)(v1 + 1488);
    uint64_t v186 = *(void *)(v1 + 1440);
    uint64_t v187 = *(void *)(v1 + 1152);
    (*(void (**)(void, void, void))(v1 + 1688))( *(void *)(v1 + 1624),  *(void *)(v1 + 1680),  *(void *)(v1 + 1592));
    uint64_t v188 = v166(v185, v187, v186);
    uint64_t v189 = (os_log_s *)Logger.logObject.getter(v188);
    os_log_type_t v190 = static os_log_type_t.info.getter(v189);
    BOOL v191 = os_log_type_enabled(v189, v190);
    uint64_t v192 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
    uint64_t v193 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1776);
    uint64_t v194 = *(void *)(v1 + 1624);
    uint64_t v506 = *(void *)(v1 + 1592);
    uint64_t v195 = *(void *)(v1 + 1488);
    uint64_t v196 = *(void *)(v1 + 1440);
    if (v191)
    {
      uint64_t v494 = *(void *)(v1 + 1624);
      uint64_t v197 = swift_slowAlloc(22LL, -1LL);
      uint64_t v436 = swift_slowAlloc(64LL, -1LL);
      uint64_t v513 = v436;
      *(_DWORD *)uint64_t v197 = 136315394;
      uint64_t v198 = MLHostTask.name.getter(v436);
      id v456 = v193;
      unint64_t v200 = v199;
      *unint64_t v382 = sub_10000B540(v198, v199, &v513);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v382, v1 + 1016, v197 + 4, v197 + 12);
      swift_bridgeObjectRelease(v200);
      v192(v195, v196);
      *(_WORD *)(v197 + 12) = 2080;
      uint64_t v201 = Duration.description.getter(v161, v163);
      unint64_t v203 = v202;
      *(void *)(v1 + 1016) = sub_10000B540(v201, v202, &v513);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1016, v1 + 1024, v197 + 14, v197 + 22);
      swift_bridgeObjectRelease(v203);
      _os_log_impl( (void *)&_mh_execute_header,  v189,  v190,  "Task %s asked to terminate because of deferral after %s.",  (uint8_t *)v197,  0x16u);
      swift_arrayDestroy(v436, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v436, -1LL, -1LL);
      swift_slowDealloc(v197, -1LL, -1LL);

      uint64_t v204 = v456(v494, v506);
    }

    else
    {
      v192(*(void *)(v1 + 1488), *(void *)(v1 + 1440));

      uint64_t v204 = v193(v194, v506);
    }

    uint64_t v250 = *(void *)(v1 + 1760);
    uint64_t v251 = *(void **)(v1 + 1744);
    static ContinuousClock.now.getter(v204);
    uint64_t v252 = swift_allocObject(&unk_100056120, 32LL, 7LL);
    *(void *)(v1 + 1824) = v252;
    *(void *)(v252 + 16) = 0LL;
    *(void *)(v252 + 24) = 0LL;
    [v251 doStop];
    uint64_t v253 = *(void **)(v250 + 16);
    if (v253) {
      goto LABEL_43;
    }
    uint64_t v311 = static Duration.< infix(_:_:)(5000000000000000000LL, 0LL, 0LL, 0LL);
    if ((v311 & 1) != 0)
    {
      uint64_t v253 = *(void **)(*(void *)(v1 + 1760) + 16LL);
      if (!v253)
      {
        v496 = (uint64_t *)(v1 + 976);
        uint64_t v312 = *(void (**)(uint64_t, void, uint64_t))(v1 + 1736);
        uint64_t v510 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1696);
        uint64_t v487 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1688);
        uint64_t v439 = *(void *)(v1 + 1680);
        uint64_t v448 = *(void (**)(uint64_t, uint64_t))(v1 + 1800);
        uint64_t v313 = *(void *)(v1 + 1616);
        uint64_t v314 = *(void *)(v1 + 1592);
        uint64_t v457 = *(void *)(v1 + 1480);
        uint64_t v468 = *(void *)(v1 + 1440);
        uint64_t v315 = *(void *)(v1 + 1432);
        uint64_t v316 = *(void *)(v1 + 1416);
        uint64_t v317 = *(void *)(v1 + 1152);
        uint64_t v318 = MLHostTask.name.getter(v311);
        uint64_t v320 = v319;
        v312(v315, enum case for TaskStatus.taskDeferred(_:), v316);
        sub_100013D50(v318, v320, v315);
        swift_bridgeObjectRelease(v320);
        v448(v315, v316);
        v487(v313, v439, v314);
        uint64_t v321 = v510(v457, v317, v468);
        uint64_t v322 = (os_log_s *)Logger.logObject.getter(v321);
        os_log_type_t v323 = static os_log_type_t.error.getter();
        BOOL v324 = os_log_type_enabled(v322, v323);
        uint64_t v325 = *(void (**)(uint64_t, uint64_t))(v1 + 1776);
        uint64_t v326 = *(void *)(v1 + 1616);
        uint64_t v327 = *(void *)(v1 + 1592);
        uint64_t v328 = *(void *)(v1 + 1480);
        uint64_t v329 = *(void *)(v1 + 1440);
        if (v324)
        {
          uint64_t v511 = *(void (**)(uint64_t, uint64_t))(v1 + 1776);
          uint64_t v458 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
          uint64_t v488 = *(void *)(v1 + 1592);
          uint64_t v330 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v331 = swift_slowAlloc(32LL, -1LL);
          uint64_t v513 = v331;
          *(_DWORD *)uint64_t v330 = 136315138;
          uint64_t v332 = MLHostTask.name.getter(v331);
          uint64_t v469 = v326;
          unint64_t v334 = v333;
          uint64_t *v496 = sub_10000B540(v332, v333, &v513);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v496, v1 + 984, v330 + 4, v330 + 12);
          swift_bridgeObjectRelease(v334);
          v458(v328, v329);
          _os_log_impl( (void *)&_mh_execute_header,  v322,  v323,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v330,  0xCu);
          swift_arrayDestroy(v331, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v331, -1LL, -1LL);
          swift_slowDealloc(v330, -1LL, -1LL);

          v511(v469, v488);
        }

        else
        {
          (*(void (**)(void, void))(v1 + 1784))(*(void *)(v1 + 1480), *(void *)(v1 + 1440));

          v325(v326, v327);
        }

        id v367 = [*(id *)(v1 + 1704) processIdentifier];
        uint64_t v513 = 0LL;
        uint64_t v514 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        v368._uint64_t countAndFlagsBits = 0x206B736154LL;
        v368._object = (void *)0xE500000000000000LL;
        String.append(_:)(v368);
        v370._uint64_t countAndFlagsBits = MLHostTask.name.getter(v369);
        os_log_type_t v371 = v370._object;
        String.append(_:)(v370);
        swift_bridgeObjectRelease(v371);
        v372._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v372._object = (void *)0x800000010004A550LL;
        String.append(_:)(v372);
        uint64_t v373 = v514;
        sub_1000305D8((uint64_t)v367, v513, v514);
        swift_bridgeObjectRelease(v373);
LABEL_46:
        uint64_t v282 = *(void *)(v1 + 1760);
        (*(void (**)(void, void, void))(v1 + 1696))( *(void *)(v1 + 1472),  *(void *)(v1 + 1152),  *(void *)(v1 + 1440));
        uint64_t v283 = swift_retain_n(v282, 2LL);
        uint64_t v284 = (os_log_s *)Logger.logObject.getter(v283);
        os_log_type_t v285 = static os_log_type_t.info.getter(v284);
        BOOL v286 = os_log_type_enabled(v284, v285);
        uint64_t v509 = *(void (**)(uint64_t, uint64_t))(v1 + 1784);
        if (v286)
        {
          uint64_t v287 = *(void *)(v1 + 1824);
          uint64_t v288 = *(void *)(v1 + 1472);
          uint64_t v438 = *(void *)(v1 + 1440);
          uint64_t v467 = *(void *)(v1 + 1760);
          uint64_t v289 = swift_slowAlloc(32LL, -1LL);
          v478 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v486 = swift_slowAlloc(64LL, -1LL);
          uint64_t v513 = v486;
          *(_DWORD *)uint64_t v289 = 136315650;
          uint64_t v290 = MLHostTask.name.getter(v486);
          unint64_t v292 = v291;
          *(void *)(v1 + 936) = sub_10000B540(v290, v291, &v513);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 936, v1 + 944, v289 + 4, v289 + 12);
          swift_retain(v287);
          swift_bridgeObjectRelease(v292);
          v509(v288, v438);
          *(_WORD *)(v289 + 12) = 2080;
          swift_beginAccess(v287 + 16, v1 + 696, 0LL, 0LL);
          uint64_t v293 = Duration.description.getter(*(void *)(v287 + 16), *(void *)(v287 + 24));
          unint64_t v295 = v294;
          *(void *)(v1 + 952) = sub_10000B540(v293, v294, &v513);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 952, v1 + 960, v289 + 14, v289 + 22);
          swift_release(v287);
          swift_bridgeObjectRelease(v295);
          *(_WORD *)(v289 + 22) = 2112;
          unint64_t v296 = *(void **)(v467 + 16);
          uint64_t v297 = v284;
          if (v296)
          {
            *(void *)(v1 + 968) = v296;
            id v298 = v296;
            uint64_t v299 = v1 + 968;
            uint64_t v300 = v496;
            uint64_t v301 = v289 + 24;
            uint64_t v302 = v289 + 32;
          }

          else
          {
            uint64_t v302 = v289 + 32;
            *(void *)(v1 + 960) = 0LL;
            uint64_t v299 = v1 + 960;
            uint64_t v300 = (uint64_t *)(v1 + 968);
            uint64_t v301 = v289 + 24;
          }

          UnsafeMutableRawBufferPointer.copyMemory(from:)(v299, v300, v301, v302);
          uint64_t v341 = *(void (**)(uint64_t, uint64_t))(v1 + 1816);
          uint64_t v342 = *(void *)(v1 + 1760);
          uint64_t v343 = *(void *)(v1 + 1744);
          uint64_t v497 = *(void **)(v1 + 1752);
          uint64_t v512 = *(void *)(v1 + 1272);
          uint64_t v344 = *(void *)(v1 + 1256);
          uint64_t v345 = *(void *)(v1 + 1216);
          void *v478 = v296;
          swift_release_n(v342, 2LL);
          _os_log_impl( (void *)&_mh_execute_header,  v297,  v285,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v289,  0x20u);
          uint64_t v346 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v478, 1LL, v346);
          swift_slowDealloc(v478, -1LL, -1LL);
          swift_arrayDestroy(v486, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v486, -1LL, -1LL);
          swift_slowDealloc(v289, -1LL, -1LL);
          swift_unknownObjectRelease(v343);

          v341(v344, v345);
          v341(v512, v345);
        }

        else
        {
          uint64_t v303 = *(void (**)(uint64_t, uint64_t))(v1 + 1816);
          uint64_t v304 = *(void **)(v1 + 1752);
          uint64_t v305 = *(void *)(v1 + 1744);
          uint64_t v306 = *(void *)(v1 + 1472);
          uint64_t v307 = *(void *)(v1 + 1440);
          uint64_t v308 = *(void *)(v1 + 1272);
          uint64_t v309 = *(void *)(v1 + 1256);
          uint64_t v310 = *(void *)(v1 + 1216);
          swift_release_n(*(void *)(v1 + 1760), 2LL);
          swift_unknownObjectRelease(v305);

          v509(v306, v307);
          v303(v309, v310);
          v303(v308, v310);
        }

        uint64_t v347 = *(void *)(v1 + 1824);
        uint64_t v348 = *(void *)(v1 + 1808);
        uint64_t v349 = *(void *)(v1 + 1768);
        uint64_t v350 = *(void *)(v1 + 1760);
        uint64_t v351 = *(void *)(v1 + 1720);
        uint64_t v352 = *(void **)(v1 + 1704);
        uint64_t v353 = *(void *)(v1 + 1672);
        uint64_t v354 = *(void *)(v1 + 1408);
        uint64_t v489 = *(void *)(v1 + 1400);
        uint64_t v498 = *(void *)(v1 + 1392);
        uint64_t v355 = *(void *)(v1 + 1168);
        unint64_t v504 = *(void **)(v350 + 16);
        id v356 = v504;
        swift_release(v351);
        swift_release(v350);
        swift_release(v349);
        swift_release(v348);
        swift_release(v347);
        [v352 invalidate];

        uint64_t v81 = v353;
        _AppExtensionProcess.invalidate()();
        uint64_t v357 = v354;
        uint64_t v69 = v355;
        (*(void (**)(uint64_t, uint64_t))(v489 + 8))(v357, v498);
        goto LABEL_58;
      }

uint64_t sub_10003BC64()
{
  uint64_t v1 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 1184) + 8LL))( *(void *)(v0 + 1192),  *(void *)(v0 + 1176));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "Task.sleep interrupted, skipping waiting for extension completion.",  v4,  2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  swift_errorRelease(*(void *)(v0 + 1888));

  uint64_t v5 = *(void *)(v0 + 1168);
  swift_beginAccess(v5 + 16, v0 + 552, 0LL, 0LL);
  if ((*(_BYTE *)(v5 + 16) & 1) != 0
    || (uint64_t v6 = *(void *)(v0 + 1768), v7 = swift_beginAccess(v6 + 16, v0 + 576, 0LL, 0LL), *(_BYTE *)(v6 + 16) != 2))
  {
    uint64_t v31 = *(void *)(v0 + 1768);
    swift_beginAccess(v31 + 16, v0 + 624, 0LL, 0LL);
    int v32 = *(unsigned __int8 *)(v31 + 16);
    uint64_t v33 = *(void *)(v0 + 1440);
    uint64_t v34 = *(void *)(v0 + 1152);
    if (v32 == 2)
    {
      uint64_t v35 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v0 + 1696))(*(void *)(v0 + 1520), v34, v33);
      uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
      os_log_type_t v37 = static os_log_type_t.info.getter(v36);
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = *(void *)(v0 + 1808);
        uint64_t v39 = *(void *)(v0 + 1520);
        uint64_t v408 = *(void *)(v0 + 1440);
        uint64_t v417 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
        v426 = (unsigned __int8 *)(*(void *)(v0 + 1168) + 16LL);
        uint64_t v40 = swift_slowAlloc(28LL, -1LL);
        uint64_t v486 = swift_slowAlloc(64LL, -1LL);
        uint64_t v499 = v486;
        *(_DWORD *)uint64_t v40 = 136315650;
        uint64_t v41 = MLHostTask.name.getter(v486);
        unint64_t v43 = v42;
        *(void *)(v0 + 1000) = sub_10000B540(v41, v42, &v499);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1000, v0 + 1008, v40 + 4, v40 + 12);
        swift_retain(v38);
        swift_bridgeObjectRelease(v43);
        v417(v39, v408);
        *(_WORD *)(v40 + 12) = 1024;
        swift_beginAccess(v426, v0 + 672, 0LL, 0LL);
        *(_DWORD *)(v0 + 1900) = *v426;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1900, v0 + 1904, v40 + 14, v40 + 18);
        *(_WORD *)(v40 + 18) = 2080;
        swift_beginAccess(v38 + 16, v0 + 720, 0LL, 0LL);
        uint64_t v44 = Duration.description.getter(*(void *)(v38 + 16), *(void *)(v38 + 24));
        unint64_t v46 = v45;
        *(void *)(v0 + 984) = sub_10000B540(v44, v45, &v499);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 984, v0 + 992, v40 + 20, v40 + 28);
        swift_release(v38);
        swift_bridgeObjectRelease(v46);
        _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.",  (uint8_t *)v40,  0x1Cu);
        swift_arrayDestroy(v486, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v486, -1LL, -1LL);
        swift_slowDealloc(v40, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1520), *(void *)(v0 + 1440));
      }

      uint64_t v449 = *(void *)(v0 + 1808);
      uint64_t v387 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v427 = *(void *)(v0 + 1760);
      uint64_t v438 = *(void *)(v0 + 1768);
      uint64_t v410 = *(void **)(v0 + 1752);
      uint64_t v396 = *(void *)(v0 + 1744);
      unint64_t v60 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
      uint64_t v419 = *(void *)(v0 + 1720);
      unint64_t v61 = *(void **)(v0 + 1704);
      uint64_t v62 = *(void *)(v0 + 1432);
      uint64_t v63 = *(void *)(v0 + 1416);
      uint64_t v457 = *(void *)(v0 + 1408);
      uint64_t v466 = *(void *)(v0 + 1672);
      uint64_t v477 = *(void *)(v0 + 1400);
      uint64_t v487 = *(void *)(v0 + 1392);
      uint64_t v392 = *(void *)(v0 + 1224);
      uint64_t v398 = *(void *)(v0 + 1216);
      uint64_t v402 = *(void *)(v0 + 1272);
      uint64_t v64 = *(void *)(v0 + 1168);
      uint64_t v66 = MLHostTask.name.getter(v65);
      uint64_t v68 = v67;
      v60(v62, enum case for TaskStatus.taskDeferred(_:), v63);
      sub_100013D50(v66, v68, v62);
      swift_bridgeObjectRelease(v68);
      v387(v62, v63);
      id v69 = [v61 processIdentifier];
      uint64_t v499 = 0LL;
      uint64_t v500 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(37LL);
      v70._uint64_t countAndFlagsBits = 0x206B736154LL;
      v70._object = (void *)0xE500000000000000LL;
      String.append(_:)(v70);
      v72._uint64_t countAndFlagsBits = MLHostTask.name.getter(v71);
      object = v72._object;
      String.append(_:)(v72);
      swift_bridgeObjectRelease(object);
      v74._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      v74._object = (void *)0x800000010004A510LL;
      String.append(_:)(v74);
      uint64_t v75 = v500;
      sub_1000305D8((uint64_t)v69, v499, v500);
      swift_unknownObjectRelease(v396);
      swift_bridgeObjectRelease(v75);

      (*(void (**)(uint64_t, uint64_t))(v392 + 8))(v402, v398);
      swift_release(v419);
      swift_release(v427);
      swift_release(v438);
      swift_release(v449);
      [v61 invalidate];

      uint64_t v76 = v466;
      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v477 + 8))(v457, v487);
      goto LABEL_19;
    }

    unint64_t v47 = *(uint64_t (**)(void, uint64_t, uint64_t))(v0 + 1696);
    if ((v32 & 1) == 0)
    {
      uint64_t v48 = v47(*(void *)(v0 + 1504), v34, v33);
      uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
      os_log_type_t v50 = static os_log_type_t.info.getter(v49);
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = *(void *)(v0 + 1808);
        uint64_t v418 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
        uint64_t v52 = *(void *)(v0 + 1504);
        uint64_t v409 = *(void *)(v0 + 1440);
        uint64_t v53 = swift_slowAlloc(28LL, -1LL);
        uint64_t v476 = swift_slowAlloc(64LL, -1LL);
        uint64_t v499 = v476;
        *(_DWORD *)uint64_t v53 = 136315650;
        uint64_t v54 = MLHostTask.name.getter(v476);
        unint64_t v56 = v55;
        *(void *)(v0 + 944) = sub_10000B540(v54, v55, &v499);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 944, v0 + 952, v53 + 4, v53 + 12);
        swift_retain(v51);
        swift_bridgeObjectRelease(v56);
        v418(v52, v409);
        *(_WORD *)(v53 + 12) = 1024;
        *(_DWORD *)(v0 + 1896) = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1896, v0 + 1900, v53 + 14, v53 + 18);
        *(_WORD *)(v53 + 18) = 2080;
        swift_beginAccess(v51 + 16, v0 + 600, 0LL, 0LL);
        uint64_t v57 = Duration.description.getter(*(void *)(v51 + 16), *(void *)(v51 + 24));
        unint64_t v59 = v58;
        *(void *)(v0 + 920) = sub_10000B540(v57, v58, &v499);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 920, v0 + 928, v53 + 20, v53 + 28);
        swift_release(v51);
        swift_bridgeObjectRelease(v59);
        _os_log_impl( (void *)&_mh_execute_header,  v49,  v50,  "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.",  (uint8_t *)v53,  0x1Cu);
        swift_arrayDestroy(v476, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v476, -1LL, -1LL);
        swift_slowDealloc(v53, -1LL, -1LL);
      }

      else
      {
        (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1504), *(void *)(v0 + 1440));
      }

      uint64_t v451 = *(void *)(v0 + 1808);
      uint64_t v380 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v440 = *(void *)(v0 + 1768);
      uint64_t v412 = *(void *)(v0 + 1760);
      uint64_t v421 = *(void **)(v0 + 1752);
      uint64_t v393 = *(void *)(v0 + 1744);
      uint64_t v105 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
      uint64_t v429 = *(void *)(v0 + 1720);
      id v384 = *(id *)(v0 + 1704);
      uint64_t v76 = *(void *)(v0 + 1672);
      uint64_t v106 = *(void *)(v0 + 1432);
      uint64_t v107 = *(void *)(v0 + 1416);
      uint64_t v459 = *(void *)(v0 + 1408);
      uint64_t v469 = *(void *)(v0 + 1400);
      uint64_t v479 = *(void *)(v0 + 1392);
      uint64_t v389 = *(void *)(v0 + 1224);
      uint64_t v399 = *(void *)(v0 + 1216);
      uint64_t v403 = *(void *)(v0 + 1272);
      uint64_t v64 = *(void *)(v0 + 1168);
      uint64_t v109 = MLHostTask.name.getter(v108);
      uint64_t v111 = v110;
      v105(v106, enum case for TaskStatus.taskFailed(_:), v107);
      sub_100013D50(v109, v111, v106);
      swift_bridgeObjectRelease(v111);
      uint64_t v112 = v380(v106, v107);
      uint64_t v113 = MLHostTask.name.getter(v112);
      uint64_t v115 = v114;
      sub_100013A80(v113, v114);
      swift_bridgeObjectRelease(v115);
      id v116 = [v384 processIdentifier];
      uint64_t v499 = 0LL;
      uint64_t v500 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(27LL);
      v117._uint64_t countAndFlagsBits = 0x206B736154LL;
      v117._object = (void *)0xE500000000000000LL;
      String.append(_:)(v117);
      v119._uint64_t countAndFlagsBits = MLHostTask.name.getter(v118);
      uint64_t v120 = v119._object;
      String.append(_:)(v119);
      swift_bridgeObjectRelease(v120);
      v121._uint64_t countAndFlagsBits = 0xD000000000000014LL;
      v121._object = (void *)0x800000010004A530LL;
      String.append(_:)(v121);
      uint64_t v122 = v500;
      sub_1000305D8((uint64_t)v116, v499, v500);
      swift_unknownObjectRelease(v393);
      swift_bridgeObjectRelease(v122);

      (*(void (**)(uint64_t, uint64_t))(v389 + 8))(v403, v399);
      swift_beginAccess(v412 + 16, v0 + 744, 0LL, 0LL);
      uint64_t v358 = *(void **)(v412 + 16);
      id v123 = v358;
      swift_release(v429);
      swift_release(v412);
      swift_release(v440);
      swift_release(v451);
      [v384 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v469 + 8))(v459, v479);
      goto LABEL_55;
    }

    uint64_t v77 = v47(*(void *)(v0 + 1512), v34, v33);
    uint64_t v78 = (os_log_s *)Logger.logObject.getter(v77);
    os_log_type_t v79 = static os_log_type_t.info.getter(v78);
    uint64_t v467 = (uint64_t *)(v0 + 1008);
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = *(void *)(v0 + 1808);
      uint64_t v388 = *(void (**)(uint64_t, id))(v0 + 1784);
      uint64_t v81 = *(void *)(v0 + 1512);
      id v383 = *(id *)(v0 + 1440);
      uint64_t v82 = swift_slowAlloc(28LL, -1LL);
      uint64_t v83 = swift_slowAlloc(64LL, -1LL);
      uint64_t v499 = v83;
      *(_DWORD *)uint64_t v82 = 136315650;
      uint64_t v84 = MLHostTask.name.getter(v83);
      unint64_t v86 = v85;
      *(void *)(v0 + 1072) = sub_10000B540(v84, v85, &v499);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1072, v0 + 1080, v82 + 4, v82 + 12);
      swift_retain(v80);
      swift_bridgeObjectRelease(v86);
      v388(v81, v383);
      *(_WORD *)(v82 + 12) = 1024;
      *(_DWORD *)(v0 + 836) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 836, v0 + 840, v82 + 14, v82 + 18);
      *(_WORD *)(v82 + 18) = 2080;
      swift_beginAccess(v80 + 16, v0 + 360, 0LL, 0LL);
      uint64_t v87 = Duration.description.getter(*(void *)(v80 + 16), *(void *)(v80 + 24));
      unint64_t v89 = v88;
      *(void *)(v0 + 1096) = sub_10000B540(v87, v88, &v499);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1096, v0 + 1104, v82 + 20, v82 + 28);
      swift_release(v80);
      swift_bridgeObjectRelease(v89);
      _os_log_impl( (void *)&_mh_execute_header,  v78,  v79,  "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.",  (uint8_t *)v82,  0x1Cu);
      swift_arrayDestroy(v83, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v83, -1LL, -1LL);
      swift_slowDealloc(v82, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1512), *(void *)(v0 + 1440));
    }

    uint64_t v124 = *(void *)(v0 + 1760);
    id v400 = *(void **)(v0 + 1744);
    uint64_t v404 = *(void *)(v0 + 1752);
    uint64_t v125 = *(void *)(v0 + 1728);
    uint64_t v385 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1712);
    uint64_t v390 = *(void *)(v0 + 1720);
    uint64_t v126 = *(unsigned __int8 *)(v0 + 1904);
    uint64_t v374 = *(void *)(v0 + 1552);
    uint64_t v376 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
    uint64_t v372 = *(void *)(v0 + 1440);
    uint64_t v127 = *(void *)(v0 + 1432);
    uint64_t v128 = *(void *)(v0 + 1424);
    uint64_t v129 = *(void *)(v0 + 1416);
    uint64_t v381 = *(void *)(v0 + 1160);
    uint64_t v130 = (v126 + 16) & ~v126;
    unint64_t v378 = (*(void *)(v0 + 1456) + v130 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v131 = (v378 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v132 = (v131 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v367 = *(void *)(v0 + 1152);
    uint64_t v369 = v126 | 7;
    uint64_t v394 = (_BYTE *)(*(void *)(v0 + 1168) + 16LL);
    (*(void (**)(uint64_t, void, uint64_t))(v0 + 1736))(v127, *(unsigned int *)(v0 + 1908), v129);
    swift_beginAccess(v125, v0 + 504, 1LL, 0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v128 + 40))(v125, v127, v129);
    swift_beginAccess(v124 + 16, v0 + 408, 1LL, 0LL);
    uint64_t v133 = *(void **)(v124 + 16);
    *(void *)(v124 + 16) = 0LL;

    v376(v374, v367, v372);
    uint64_t v134 = swift_allocObject(&unk_100056148, v132 + 8, v369);
    v385(v134 + v130, v374, v372);
    *(void *)(v134 + v378) = v124;
    *(void *)(v134 + v131) = v390;
    *(void *)(v134 + v132) = v381;
    *(void *)(v0 + 48) = sub_10003ECE0;
    *(void *)(v0 + 56) = v134;
    *(void *)(v0 + 16) = _NSConcreteStackBlock;
    *(void *)(v0 + 24) = 1107296256LL;
    *(void *)(v0 + 32) = sub_1000210C0;
    *(void *)(v0 + 40) = &unk_100056160;
    id v135 = _Block_copy((const void *)(v0 + 16));
    uint64_t v136 = *(void *)(v0 + 56);
    swift_retain(v390);
    swift_retain(v124);
    swift_retain(v381);
    swift_release(v136);
    [v400 doWorkWithContext:v404 reply:v135];
    _Block_release(v135);
    uint64_t v137 = swift_beginAccess(v394, v0 + 528, 0LL, 0LL);
    if (*v394 == 1)
    {
      uint64_t v138 = *(void *)(v0 + 1760);
    }

    else
    {
      uint64_t v137 = swift_beginAccess(*(void *)(v0 + 1168) + 16LL, v0 + 648, 0LL, 0LL);
      uint64_t v138 = *(void *)(v0 + 1760);
      if (!*(void *)(v138 + 16))
      {
        uint64_t v221 = *(void *)(v0 + 1264);
        uint64_t v222 = *(void *)(v0 + 1224);
        uint64_t v223 = *(void *)(v0 + 1216);
        uint64_t v224 = *(void *)(v0 + 1176);
        ContinuousClock.init()(v137);
        *(void *)(v0 + 888) = 500000000000000000LL;
        *(void *)(v0 + 896) = 0LL;
        *(_OWORD *)(v0 + 792) = 0u;
        *(_BYTE *)(v0 + 808) = 1;
        uint64_t v225 = sub_100005038( &qword_100059850,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
        dispatch thunk of Clock.now.getter(v224, v225);
        uint64_t v226 = sub_100005038( &qword_100059858,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
        dispatch thunk of InstantProtocol.advanced(by:)(v0 + 888, v223, v226);
        uint64_t v227 = *(void (**)(uint64_t, uint64_t))(v222 + 8);
        *(void *)(v0 + 1848) = v227;
        v227(v221, v223);
        uint64_t v228 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
        *(void *)(v0 + 1856) = v228;
        *uint64_t v228 = v0;
        v228[1] = sub_100036C4C;
        uint64_t v229 = *(void *)(v0 + 1176);
        uint64_t v230 = *(void *)(v0 + 1240);
        uint64_t v231 = v0 + 792;
        uint64_t v232 = v225;
        return dispatch thunk of Clock.sleep(until:tolerance:)(v230, v231, v229, v232);
      }
    }

    uint64_t v139 = *(void *)(v0 + 1264);
    uint64_t v140 = *(void *)(v0 + 1224);
    uint64_t v141 = *(void *)(v0 + 1216);
    static ContinuousClock.now.getter(v137);
    uint64_t v142 = ContinuousClock.Instant.duration(to:)(v139);
    uint64_t v144 = v143;
    uint64_t v145 = *(void (**)(uint64_t, uint64_t))(v140 + 8);
    *(void *)(v0 + 1816) = v145;
    v145(v139, v141);
    uint64_t v146 = *(void **)(v138 + 16);
    uint64_t v147 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
    if (v146)
    {
      uint64_t v441 = v142;
      uint64_t v470 = v145;
      v147(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
      id v480 = v146;
      uint64_t v148 = (os_log_s *)Logger.logObject.getter(v480);
      os_log_type_t v149 = static os_log_type_t.info.getter(v148);
      BOOL v150 = os_log_type_enabled(v148, v149);
      unint64_t v151 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
      uint64_t v152 = *(void *)(v0 + 1496);
      uint64_t v153 = *(void *)(v0 + 1440);
      uint64_t v358 = v146;
      if (v150)
      {
        uint64_t v430 = v144;
        uint64_t v154 = swift_slowAlloc(32LL, -1LL);
        uint64_t v452 = (void *)swift_slowAlloc(8LL, -1LL);
        uint64_t v460 = swift_slowAlloc(64LL, -1LL);
        uint64_t v499 = v460;
        *(_DWORD *)uint64_t v154 = 136315650;
        os_log_type_t v422 = v149;
        uint64_t v155 = MLHostTask.name.getter(v460);
        unint64_t v157 = v156;
        *(void *)(v0 + 1032) = sub_10000B540(v155, v156, &v499);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1032, v0 + 1040, v154 + 4, v154 + 12);
        swift_bridgeObjectRelease(v157);
        v151(v152, v153);
        *(_WORD *)(v154 + 12) = 2080;
        uint64_t v158 = Duration.description.getter(v441, v430);
        unint64_t v160 = v159;
        *(void *)(v0 + 1040) = sub_10000B540(v158, v159, &v499);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1040, v0 + 1048, v154 + 14, v154 + 22);
        swift_bridgeObjectRelease(v160);
        *(_WORD *)(v154 + 22) = 2112;
        *(void *)(v0 + 1048) = v480;
        id v161 = v480;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1048, v0 + 1056, v154 + 24, v154 + 32);
        *uint64_t v452 = v146;

        _os_log_impl( (void *)&_mh_execute_header,  v148,  v422,  "Task %s completed after %s. TaskResult: %@",  (uint8_t *)v154,  0x20u);
        uint64_t v162 = sub_10000B4F4(&qword_100059280);
        swift_arrayDestroy(v452, 1LL, v162);
        swift_slowDealloc(v452, -1LL, -1LL);
        swift_arrayDestroy(v460, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v460, -1LL, -1LL);
        swift_slowDealloc(v154, -1LL, -1LL);
      }

      else
      {
        v151(v152, v153);
      }

      uint64_t v184 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1800);
      uint64_t v185 = *(void *)(v0 + 1728);
      uint64_t v186 = *(void *)(v0 + 1432);
      uint64_t v187 = *(void *)(v0 + 1424);
      uint64_t v188 = *(void *)(v0 + 1416);
      uint64_t v189 = MLHostTask.name.getter(v163);
      uint64_t v191 = v190;
      uint64_t v192 = *(void (**)(uint64_t, uint64_t, uint64_t))(v187 + 16);
      v192(v186, v185, v188);
      sub_100013D50(v189, v191, v186);
      swift_bridgeObjectRelease(v191);
      uint64_t v193 = v184(v186, v188);
      uint64_t v194 = MLHostTask.name.getter(v193);
      uint64_t v196 = v195;
      sub_100013A80(v194, v195);
      uint64_t v197 = swift_bridgeObjectRelease(v196);
      uint64_t v198 = MLHostResult.status.getter(v197);
      uint64_t v199 = MLHostResultStatus.rawValue.getter(v198);
      uint64_t v200 = MLHostResultStatus.rawValue.getter(1LL);
      uint64_t v201 = *(void *)(v0 + 1808);
      uint64_t v202 = *(void *)(v0 + 1768);
      if (v199 == v200)
      {
        unint64_t v203 = *(void **)(v0 + 1752);
        uint64_t v204 = *(void *)(v0 + 1744);
        v470(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
        swift_unknownObjectRelease(v204);
      }

      else
      {
        uint64_t v443 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
        uint64_t v453 = *(void *)(v0 + 1744);
        uint64_t v205 = *(void *)(v0 + 1728);
        uint64_t v206 = *(void *)(v0 + 1432);
        uint64_t v207 = *(void *)(v0 + 1416);
        uint64_t v481 = *(void *)(v0 + 1272);
        uint64_t v490 = *(void **)(v0 + 1752);
        uint64_t v461 = *(void *)(v0 + 1216);
        unsigned int v431 = [*(id *)(v0 + 1704) processIdentifier];
        uint64_t v499 = 0LL;
        uint64_t v500 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        uint64_t v208 = v500;
        *(void *)(v0 + 840) = v499;
        *(void *)(v0 + 848) = v208;
        v209._uint64_t countAndFlagsBits = 0x206B736154LL;
        v209._object = (void *)0xE500000000000000LL;
        String.append(_:)(v209);
        v211._uint64_t countAndFlagsBits = MLHostTask.name.getter(v210);
        uint64_t v212 = v211._object;
        String.append(_:)(v211);
        swift_bridgeObjectRelease(v212);
        v213._object = (void *)0x800000010004A570LL;
        v213._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v213);
        v192(v206, v205, v207);
        _print_unlocked<A, B>(_:_:)( v206,  v0 + 840,  v207,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v443(v206, v207);
        v214._uint64_t countAndFlagsBits = 46LL;
        v214._object = (void *)0xE100000000000000LL;
        String.append(_:)(v214);
        uint64_t v215 = *(void *)(v0 + 848);
        sub_1000305D8(v431, *(void *)(v0 + 840), v215);
        swift_unknownObjectRelease(v453);
        swift_bridgeObjectRelease(v215);

        v470(v481, v461);
      }

      swift_release(v202);
      swift_release(v201);
      uint64_t v216 = *(void *)(v0 + 1760);
      uint64_t v217 = *(void **)(v0 + 1704);
      uint64_t v76 = *(void *)(v0 + 1672);
      uint64_t v218 = *(void *)(v0 + 1408);
      uint64_t v219 = *(void *)(v0 + 1400);
      uint64_t v220 = *(void *)(v0 + 1392);
      uint64_t v64 = *(void *)(v0 + 1168);
      swift_release(*(void *)(v0 + 1720));
      swift_release(v216);
      [v217 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v219 + 8))(v218, v220);
      goto LABEL_55;
    }

    uint64_t v164 = *(void *)(v0 + 1488);
    uint64_t v165 = *(void *)(v0 + 1440);
    uint64_t v166 = *(void *)(v0 + 1152);
    (*(void (**)(void, void, void))(v0 + 1688))( *(void *)(v0 + 1624),  *(void *)(v0 + 1680),  *(void *)(v0 + 1592));
    uint64_t v167 = v147(v164, v166, v165);
    uint64_t v168 = (os_log_s *)Logger.logObject.getter(v167);
    os_log_type_t v169 = static os_log_type_t.info.getter(v168);
    BOOL v170 = os_log_type_enabled(v168, v169);
    uint64_t v171 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
    uint64_t v172 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1776);
    uint64_t v173 = *(void *)(v0 + 1624);
    uint64_t v489 = *(void *)(v0 + 1592);
    uint64_t v174 = *(void *)(v0 + 1488);
    uint64_t v175 = *(void *)(v0 + 1440);
    if (v170)
    {
      uint64_t v442 = v142;
      uint64_t v176 = swift_slowAlloc(22LL, -1LL);
      uint64_t v405 = swift_slowAlloc(64LL, -1LL);
      uint64_t v499 = v405;
      *(_DWORD *)uint64_t v176 = 136315394;
      uint64_t v177 = MLHostTask.name.getter(v405);
      uint64_t v413 = v172;
      unint64_t v179 = v178;
      *uint64_t v467 = sub_10000B540(v177, v178, &v499);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v467, v0 + 1016, v176 + 4, v176 + 12);
      swift_bridgeObjectRelease(v179);
      v171(v174, v175);
      *(_WORD *)(v176 + 12) = 2080;
      uint64_t v180 = Duration.description.getter(v442, v144);
      unint64_t v182 = v181;
      *(void *)(v0 + 1016) = sub_10000B540(v180, v181, &v499);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1016, v0 + 1024, v176 + 14, v176 + 22);
      swift_bridgeObjectRelease(v182);
      _os_log_impl( (void *)&_mh_execute_header,  v168,  v169,  "Task %s asked to terminate because of deferral after %s.",  (uint8_t *)v176,  0x16u);
      swift_arrayDestroy(v405, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v405, -1LL, -1LL);
      swift_slowDealloc(v176, -1LL, -1LL);

      uint64_t v183 = v413(v173, v489);
    }

    else
    {
      v171(*(void *)(v0 + 1488), *(void *)(v0 + 1440));

      uint64_t v183 = v172(v173, v489);
    }

    uint64_t v233 = *(void *)(v0 + 1760);
    Swift::String v234 = *(void **)(v0 + 1744);
    static ContinuousClock.now.getter(v183);
    uint64_t v235 = swift_allocObject(&unk_100056120, 32LL, 7LL);
    *(void *)(v0 + 1824) = v235;
    *(void *)(v235 + 16) = 0LL;
    *(void *)(v235 + 24) = 0LL;
    [v234 doStop];
    uint64_t v236 = *(void **)(v233 + 16);
    if (v236) {
      goto LABEL_39;
    }
    uint64_t v293 = static Duration.< infix(_:_:)(5000000000000000000LL, 0LL, 0LL, 0LL);
    if ((v293 & 1) != 0)
    {
      uint64_t v236 = *(void **)(*(void *)(v0 + 1760) + 16LL);
      if (!v236)
      {
        uint64_t v482 = (uint64_t *)(v0 + 976);
        unint64_t v294 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1736);
        uint64_t v494 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1696);
        uint64_t v472 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
        uint64_t v414 = *(void *)(v0 + 1680);
        v423 = *(void (**)(uint64_t, uint64_t))(v0 + 1800);
        uint64_t v295 = *(void *)(v0 + 1616);
        uint64_t v296 = *(void *)(v0 + 1592);
        uint64_t v433 = *(void *)(v0 + 1480);
        uint64_t v444 = *(void *)(v0 + 1440);
        uint64_t v297 = *(void *)(v0 + 1432);
        uint64_t v298 = *(void *)(v0 + 1416);
        uint64_t v299 = *(void *)(v0 + 1152);
        uint64_t v300 = MLHostTask.name.getter(v293);
        uint64_t v302 = v301;
        v294(v297, enum case for TaskStatus.taskDeferred(_:), v298);
        sub_100013D50(v300, v302, v297);
        swift_bridgeObjectRelease(v302);
        v423(v297, v298);
        v472(v295, v414, v296);
        uint64_t v303 = v494(v433, v299, v444);
        uint64_t v304 = (os_log_s *)Logger.logObject.getter(v303);
        os_log_type_t v305 = static os_log_type_t.error.getter();
        BOOL v306 = os_log_type_enabled(v304, v305);
        uint64_t v307 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
        uint64_t v308 = *(void *)(v0 + 1616);
        uint64_t v309 = *(void *)(v0 + 1592);
        uint64_t v310 = *(void *)(v0 + 1480);
        uint64_t v311 = *(void *)(v0 + 1440);
        if (v306)
        {
          BOOL v495 = *(void (**)(uint64_t, uint64_t))(v0 + 1776);
          uint64_t v434 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
          uint64_t v473 = *(void *)(v0 + 1592);
          uint64_t v312 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v313 = swift_slowAlloc(32LL, -1LL);
          uint64_t v499 = v313;
          *(_DWORD *)uint64_t v312 = 136315138;
          uint64_t v314 = MLHostTask.name.getter(v313);
          uint64_t v445 = v308;
          unint64_t v316 = v315;
          *uint64_t v482 = sub_10000B540(v314, v315, &v499);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v482, v0 + 984, v312 + 4, v312 + 12);
          swift_bridgeObjectRelease(v316);
          v434(v310, v311);
          _os_log_impl( (void *)&_mh_execute_header,  v304,  v305,  "Task %s has not responded to deferral. Marking task as deferred and terminating process.",  v312,  0xCu);
          swift_arrayDestroy(v313, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v313, -1LL, -1LL);
          swift_slowDealloc(v312, -1LL, -1LL);

          v495(v445, v473);
        }

        else
        {
          (*(void (**)(void, void))(v0 + 1784))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

          v307(v308, v309);
        }

        id v351 = [*(id *)(v0 + 1704) processIdentifier];
        uint64_t v499 = 0LL;
        uint64_t v500 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(38LL);
        v352._uint64_t countAndFlagsBits = 0x206B736154LL;
        v352._object = (void *)0xE500000000000000LL;
        String.append(_:)(v352);
        v354._uint64_t countAndFlagsBits = MLHostTask.name.getter(v353);
        uint64_t v355 = v354._object;
        String.append(_:)(v354);
        swift_bridgeObjectRelease(v355);
        v356._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v356._object = (void *)0x800000010004A550LL;
        String.append(_:)(v356);
        uint64_t v357 = v500;
        sub_1000305D8((uint64_t)v351, v499, v500);
        swift_bridgeObjectRelease(v357);
LABEL_42:
        uint64_t v265 = *(void *)(v0 + 1760);
        (*(void (**)(void, void, void))(v0 + 1696))( *(void *)(v0 + 1472),  *(void *)(v0 + 1152),  *(void *)(v0 + 1440));
        uint64_t v266 = swift_retain_n(v265, 2LL);
        uint64_t v267 = (os_log_s *)Logger.logObject.getter(v266);
        os_log_type_t v268 = static os_log_type_t.info.getter(v267);
        BOOL v269 = os_log_type_enabled(v267, v268);
        uint64_t v493 = *(void (**)(uint64_t, uint64_t))(v0 + 1784);
        if (v269)
        {
          uint64_t v270 = *(void *)(v0 + 1824);
          uint64_t v271 = *(void *)(v0 + 1472);
          uint64_t v406 = *(void *)(v0 + 1440);
          uint64_t v432 = *(void *)(v0 + 1760);
          uint64_t v272 = swift_slowAlloc(32LL, -1LL);
          uint64_t v462 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v471 = swift_slowAlloc(64LL, -1LL);
          uint64_t v499 = v471;
          *(_DWORD *)uint64_t v272 = 136315650;
          uint64_t v273 = MLHostTask.name.getter(v471);
          unint64_t v275 = v274;
          *(void *)(v0 + 936) = sub_10000B540(v273, v274, &v499);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 936, v0 + 944, v272 + 4, v272 + 12);
          swift_retain(v270);
          swift_bridgeObjectRelease(v275);
          v493(v271, v406);
          *(_WORD *)(v272 + 12) = 2080;
          swift_beginAccess(v270 + 16, v0 + 696, 0LL, 0LL);
          uint64_t v276 = Duration.description.getter(*(void *)(v270 + 16), *(void *)(v270 + 24));
          unint64_t v278 = v277;
          *(void *)(v0 + 952) = sub_10000B540(v276, v277, &v499);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 952, v0 + 960, v272 + 14, v272 + 22);
          swift_release(v270);
          swift_bridgeObjectRelease(v278);
          *(_WORD *)(v272 + 22) = 2112;
          Swift::String v279 = *(void **)(v432 + 16);
          if (v279)
          {
            *(void *)(v0 + 968) = v279;
            id v280 = v279;
            uint64_t v281 = v0 + 968;
            uint64_t v282 = v482;
            uint64_t v283 = v272 + 24;
            uint64_t v284 = v272 + 32;
          }

          else
          {
            uint64_t v284 = v272 + 32;
            *(void *)(v0 + 960) = 0LL;
            uint64_t v281 = v0 + 960;
            uint64_t v282 = (uint64_t *)(v0 + 968);
            uint64_t v283 = v272 + 24;
          }

          UnsafeMutableRawBufferPointer.copyMemory(from:)(v281, v282, v283, v284);
          uint64_t v325 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v326 = *(void *)(v0 + 1760);
          uint64_t v327 = *(void *)(v0 + 1744);
          uint64_t v483 = *(void **)(v0 + 1752);
          uint64_t v496 = *(void *)(v0 + 1272);
          uint64_t v328 = *(void *)(v0 + 1256);
          uint64_t v329 = *(void *)(v0 + 1216);
          *uint64_t v462 = v279;
          swift_release_n(v326, 2LL);
          _os_log_impl( (void *)&_mh_execute_header,  v267,  v268,  "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@",  (uint8_t *)v272,  0x20u);
          uint64_t v330 = sub_10000B4F4(&qword_100059280);
          swift_arrayDestroy(v462, 1LL, v330);
          swift_slowDealloc(v462, -1LL, -1LL);
          swift_arrayDestroy(v471, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v471, -1LL, -1LL);
          swift_slowDealloc(v272, -1LL, -1LL);
          swift_unknownObjectRelease(v327);

          v325(v328, v329);
          v325(v496, v329);
        }

        else
        {
          os_log_type_t v285 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          BOOL v286 = *(void **)(v0 + 1752);
          uint64_t v287 = *(void *)(v0 + 1744);
          uint64_t v288 = *(void *)(v0 + 1472);
          uint64_t v289 = *(void *)(v0 + 1440);
          uint64_t v290 = *(void *)(v0 + 1272);
          uint64_t v291 = *(void *)(v0 + 1256);
          uint64_t v292 = *(void *)(v0 + 1216);
          swift_release_n(*(void *)(v0 + 1760), 2LL);
          swift_unknownObjectRelease(v287);

          v493(v288, v289);
          v285(v291, v292);
          v285(v290, v292);
        }

        uint64_t v331 = *(void *)(v0 + 1824);
        uint64_t v332 = *(void *)(v0 + 1808);
        uint64_t v333 = *(void *)(v0 + 1768);
        uint64_t v334 = *(void *)(v0 + 1760);
        uint64_t v335 = *(void *)(v0 + 1720);
        uint64_t v336 = *(void **)(v0 + 1704);
        uint64_t v337 = *(void *)(v0 + 1672);
        uint64_t v338 = *(void *)(v0 + 1408);
        uint64_t v484 = *(void *)(v0 + 1400);
        uint64_t v497 = *(void *)(v0 + 1392);
        uint64_t v339 = *(void *)(v0 + 1168);
        uint64_t v358 = *(void **)(v334 + 16);
        id v340 = v358;
        swift_release(v335);
        swift_release(v334);
        swift_release(v333);
        swift_release(v332);
        swift_release(v331);
        [v336 invalidate];

        uint64_t v76 = v337;
        _AppExtensionProcess.invalidate()();
        uint64_t v341 = v338;
        uint64_t v64 = v339;
        (*(void (**)(uint64_t, uint64_t))(v484 + 8))(v341, v497);
        goto LABEL_55;
      }

void sub_10003E138(uint64_t a1, unint64_t a2)
{
  if (qword_100058F68 != -1) {
    swift_once(&qword_100058F68, sub_10001F3C8);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_10000C538(v4, (uint64_t)qword_10005A7E0);
  uint64_t v5 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = (void *)swift_slowAlloc(32LL, -1LL);
    id v36 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v34 = sub_10000B540(a1, a2, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Deregistering task: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___BGSystemTaskScheduler);
  uint64_t v11 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  id v12 = [v10 sharedScheduler];
  NSString v13 = String._bridgeToObjectiveC()();
  id v36 = 0LL;
  unsigned int v14 = [v12 cancelTaskRequestWithIdentifier:v13 error:&v36];

  id v15 = v36;
  if (v14)
  {
    id v16 = v36;
  }

  else
  {
    id v17 = v36;
    uint64_t v18 = _convertNSErrorToError(_:)(v15);

    swift_willThrow(v19);
    swift_errorRetain(v18);
    uint64_t v20 = swift_errorRetain(v18);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v33 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v23 = 138412290;
      swift_errorRetain(v18);
      uint64_t v24 = (void *)_swift_stdlib_bridgeErrorToNSError(v18);
      id v36 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v23 + 4, v23 + 12);
      void *v33 = v24;
      uint64_t v11 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Task cancellation failed: %@", v23, 0xCu);
      uint64_t v25 = sub_10000B4F4(&qword_100059280);
      swift_arrayDestroy(v33, 1LL, v25);
      swift_slowDealloc(v33, -1LL, -1LL);
      swift_slowDealloc(v23, -1LL, -1LL);

      swift_errorRelease(v18);
    }

    else
    {
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      swift_errorRelease(v18);
    }
  }

  id v26 = objc_msgSend(v10, (SEL)v11[44].opt_inst_meths, v33);
  NSString v27 = String._bridgeToObjectiveC()();
  [v26 deregisterTaskWithIdentifier:v27];

  uint64_t v28 = swift_bridgeObjectRetain_n(a2, 2LL);
  unint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    int v32 = (void *)swift_slowAlloc(32LL, -1LL);
    id v36 = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v34 = sub_10000B540(a1, a2, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Task deregistered successfully: %s", v31, 0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

uint64_t sub_10003E640()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10003E664()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 16));
}

uint64_t sub_10003E66C@<X0>(_BYTE *a1@<X8>)
{
  return sub_1000139E0(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_10003E688()
{
  uint64_t v1 = type metadata accessor for MLHostTask(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(void *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

id sub_10003E71C(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MLHostTask(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  return sub_100022124(a1, *(void *)(v1 + 16), v1 + v4, *v5, v5[1]);
}

uint64_t sub_10003E774()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10003E784()
{
  uint64_t result = swift_beginAccess(v0 + 16, v2, 1LL, 0LL);
  *(_BYTE *)(v0 + 16) = 1;
  return result;
}

uint64_t sub_10003E7C0()
{
  uint64_t v1 = type metadata accessor for MLHostTask(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));

  swift_bridgeObjectRelease(*(void *)(v0 + v8 + 8));
  return swift_deallocObject(v0, v8 + 16, v5);
}

uint64_t sub_10003E884(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for MLHostTask(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[4];
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = *(void *)((char *)v1 + v7);
  uint64_t v13 = (uint64_t)v1 + v5;
  uint64_t v14 = *(void *)((char *)v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8LL));
  id v15 = (void *)swift_task_alloc(dword_10005980C);
  *(void *)(v2 + 16) = v15;
  *id v15 = v2;
  v15[1] = sub_10003E968;
  return sub_100022638(a1, v8, v9, v10, v13, v11, v12, v14);
}

uint64_t sub_10003E968()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10003E9B0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_10005981C);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10003E968;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100059818 + dword_100059818))(a1, v4);
}

unint64_t sub_10003EA20()
{
  unint64_t result = qword_100059838;
  if (!qword_100059838)
  {
    uint64_t v1 = sub_10000C654(255LL, &qword_100059830, &OBJC_CLASS___BGSystemTaskResult_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100059838);
  }

  return result;
}

void sub_10003EA7C()
{
}

uint64_t sub_10003EA8C()
{
  uint64_t v1 = type metadata accessor for MLHostTask(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10003EAEC()
{
}

void sub_10003EAF8(const char *a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(type metadata accessor for MLHostTask(0LL) - 8) + 80LL);
  sub_100020B90(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_10003EB38()
{
  uint64_t v1 = type metadata accessor for MLHostTask(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10003EBAC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MLHostTask(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100020D80(a1, v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_10003EBFC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10003EC24(uint64_t a1)
{
  return sub_10003ECEC(a1, (uint64_t (*)(uint64_t, unint64_t, void, void, void))sub_1000210C4);
}

uint64_t sub_10003EC30()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10003EC44()
{
  uint64_t v1 = type metadata accessor for MLHostTask(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  swift_release(*(void *)(v0 + v7));
  swift_release(*(void *)(v0 + v8));
  return swift_deallocObject(v0, v8 + 8, v5);
}

uint64_t sub_10003ECE0(uint64_t a1)
{
  return sub_10003ECEC(a1, (uint64_t (*)(uint64_t, unint64_t, void, void, void))sub_100021620);
}

uint64_t sub_10003ECEC( uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, void, void, void))
{
  uint64_t v4 = *(void *)(type metadata accessor for MLHostTask(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  return a2( a1,  v2 + v5,  *(void *)(v2 + v6),  *(void *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v2 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_10003ED64()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10003ED90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000275B8(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_10003EDA8()
{
  return sub_100027544();
}

uint64_t sub_10003EDC0()
{
  return sub_1000274E8();
}

uint64_t sub_10003EDD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000271AC(a1, v2, a2);
}

uint64_t sub_10003EDF0(uint64_t a1)
{
  return sub_1000270F4(a1, v1);
}

void sub_10003EE08(uint64_t a1)
{
}

uint64_t sub_10003EE20@<X0>(uint64_t a1@<X8>)
{
  return sub_1000269CC(v1, a1);
}

uint64_t sub_10003EE38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100026070(a1, v2, a2);
}

uint64_t sub_10003EE50@<X0>(uint64_t a1@<X8>)
{
  return sub_10002565C(v1, a1);
}

uint64_t sub_10003EE68@<X0>(uint64_t a1@<X8>)
{
  return sub_1000259B4(v1, a1);
}

uint64_t sub_10003EE80()
{
  uint64_t v0 = sub_10000CD08();
  return ListExtensionsResponse.init(extensions:)(v0);
}

uint64_t sub_10003EEC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100025C80(v1, a1);
}

unint64_t sub_10003EEDC()
{
  unint64_t result = qword_1000598D0;
  if (!qword_1000598D0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1000598D0);
  }

  return result;
}

uint64_t sub_10003EF20()
{
  return sub_1000107FC(v0);
}

unint64_t sub_10003EF38()
{
  unint64_t result = qword_1000592C8;
  if (!qword_1000592C8)
  {
    uint64_t v1 = sub_10000C610(&qword_1000592C0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000592C8);
  }

  return result;
}

uint64_t sub_10003EF84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000B4F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003EFC8(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for ClientPermissions()
{
  return &type metadata for ClientPermissions;
}

unint64_t sub_10003F018()
{
  unint64_t result = qword_100059938;
  if (!qword_100059938)
  {
    unint64_t result = swift_getWitnessTable(&unk_100040E74, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100059938);
  }

  return result;
}

unint64_t sub_10003F060()
{
  unint64_t result = qword_100059940;
  if (!qword_100059940)
  {
    unint64_t result = swift_getWitnessTable(&unk_100040E44, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100059940);
  }

  return result;
}

unint64_t sub_10003F0A8()
{
  unint64_t result = qword_100059948;
  if (!qword_100059948)
  {
    unint64_t result = swift_getWitnessTable(&unk_100040E9C, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100059948);
  }

  return result;
}

unint64_t sub_10003F0F0()
{
  unint64_t result = qword_100059950;
  if (!qword_100059950)
  {
    unint64_t result = swift_getWitnessTable(&unk_100040ED4, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100059950);
  }

  return result;
}
void sub_100005828(id a1)
{
  void *v1;
  v1 = (void *)qword_100021A90;
  qword_100021A90 = (uint64_t)&off_10001D6A8;
}

uint64_t sub_100005924(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 & 0x7FFF8) == 8)
    {
      uint64_t String = PBReaderReadString(a2);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
      v14 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v13;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2, (unsigned __int16)(v6 >> 3));
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

int main(int argc, const char **argv, const char **envp)
{
  if (qword_1000213A0 != -1) {
    swift_once(&qword_1000213A0, sub_100012F54);
  }
  sub_100013254();
  return 0;
}

void type metadata accessor for MAAssetState(uint64_t a1)
{
}

void type metadata accessor for MAPurgeResult(uint64_t a1)
{
}

void type metadata accessor for MAQueryResult(uint64_t a1)
{
}

void type metadata accessor for MADownloadResult(uint64_t a1)
{
}

BOOL sub_100005CF0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005D04(uint64_t a1, uint64_t a2)
{
  return sub_100006168(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005D18(uint64_t a1, uint64_t a2)
{
  return sub_100006168(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005D30(uint64_t a1, id *a2)
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

uint64_t sub_100005DA4(uint64_t a1, id *a2)
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

uint64_t sub_100005E20@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

void *sub_100005E60@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005E70(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100005E7C(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_100005E88@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100005E98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_100005EE8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005F2C(uint64_t a1)
{
  uint64_t v2 = sub_100006008( &qword_100021468,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017C70);
  uint64_t v3 = sub_100006008( (unint64_t *)&unk_100021470,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017A6C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005FB0()
{
  return sub_100006008( &qword_100021428,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017A30);
}

uint64_t sub_100005FDC()
{
  return sub_100006008( &qword_100021430,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017A04);
}

uint64_t sub_100006008(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006048@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10000608C(uint64_t a1)
{
  uint64_t v2 = sub_100006008( &qword_100021458,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_100017BE0);
  uint64_t v3 = sub_100006008( &qword_100021460,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_100017B80);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006110()
{
  return sub_100006008( &qword_100021438,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_100017B44);
}

uint64_t sub_10000613C()
{
  return sub_100006008( &qword_100021440,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_100017B18);
}

uint64_t sub_100006168(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000061A4(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000061E4(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100006254(void *a1, uint64_t *a2)
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

uint64_t sub_1000062DC()
{
  return sub_100006008( &qword_100021448,  (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType,  (uint64_t)&unk_100017BB4);
}

uint64_t sub_100006308()
{
  return sub_100006008( &qword_100021450,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017AA0);
}

uint64_t initializeBufferWithCopyOfBuffer for TZInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for TZInfo(void *a1)
{
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t initializeWithCopy for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 48) = v6;
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t assignWithCopy for TZInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a2 + 48);
  *(void *)(a1 + 48) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v10);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

__n128 initializeWithTake for TZInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(*(void *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for TZInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 58)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TZInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 58) = 1;
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

    *(_BYTE *)(result + 58) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TZInfo()
{
  return &type metadata for TZInfo;
}

uint64_t sub_100006604()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  __int128 v3 = (void *)v0[3];
  if (*v0) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v2 == 0xE000000000000000LL;
  }
  if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, *v0, v0[1], 0LL) & 1) != 0)
  {
    BOOL v6 = !v4 && v3 == (void *)0xE000000000000000LL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, v4, v3, 0LL) & 1) != 0) {
      return 0LL;
    }
  }

  if (!v4 && v3 == (void *)0xE000000000000000LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, v4, v3, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRetain(v2);
  }

  else
  {
    swift_bridgeObjectRetain(v2);
    v7._countAndFlagsBits = 46LL;
    v7._object = (void *)0xE100000000000000LL;
    String.append(_:)(v7);
    swift_bridgeObjectRetain(v3);
    v8._countAndFlagsBits = v4;
    v8._object = v3;
    String.append(_:)(v8);
    swift_bridgeObjectRelease(v3);
  }

  return v1;
}

id sub_100006720(uint64_t a1)
{
  uint64_t v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  BOOL v5 = v4;
  id v14 = 0LL;
  id v6 = [v2 initWithContentsOfURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL);
    id v10 = v7;
    v9(a1, v8);
  }

  else
  {
    id v11 = v14;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    uint64_t v12 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8LL))(a1, v12);
  }

  return v6;
}

uint64_t sub_100006828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v48 - v11;
  sub_100007AFC(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) != 1)
  {
    uint64_t v53 = a1;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    URL.appendingPathComponent(_:)(0x736E6F6973726576LL, 0xEE007473696C702ELL);
    id v24 = objc_allocWithZone(&OBJC_CLASS___NSDictionary);
    id v25 = sub_100006720((uint64_t)v10);
    *(void *)&__int128 v56 = 0x7372655661746144LL;
    *((void *)&v56 + 1) = 0xEB000000006E6F69LL;
    uint64_t v26 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v56, &type metadata for String);
    id v27 = objc_msgSend(v25, "__swift_objectForKeyedSubscript:", v26);
    swift_unknownObjectRelease(v26);
    if (v27)
    {
      _bridgeAnyObjectToAny(_:)(&v56, v27);
      swift_unknownObjectRelease(v27);
    }

    else
    {
      __int128 v56 = 0u;
      __int128 v57 = 0u;
    }

    sub_100007B84((uint64_t)&v56, (uint64_t)v58, &qword_100021510);
    uint64_t v52 = v7;
    if (v59)
    {
      uint64_t v28 = swift_dynamicCast(&v54, v58, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
      if ((v28 & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v14 = (uint64_t)v54;
      unint64_t v16 = v55;
      strcpy((char *)&v56, "BundleVersion");
      HIWORD(v56) = -4864;
      uint64_t v29 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v56, &type metadata for String);
      id v30 = objc_msgSend(v25, "__swift_objectForKeyedSubscript:", v29);
      swift_unknownObjectRelease(v29);
      if (v30)
      {
        _bridgeAnyObjectToAny(_:)(&v56, v30);
        swift_unknownObjectRelease(v30);
      }

      else
      {
        __int128 v56 = 0u;
        __int128 v57 = 0u;
      }

      sub_100007B84((uint64_t)&v56, (uint64_t)v58, &qword_100021510);
      if (v59)
      {
        if ((swift_dynamicCast(&v54, v58, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
        {
          v31 = v25;
          uint64_t v23 = (uint64_t)v54;
          unint64_t v22 = v55;
          *(void *)&__int128 v56 = 0xD000000000000012LL;
          *((void *)&v56 + 1) = 0x8000000100018170LL;
          uint64_t v32 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v56, &type metadata for String);
          id v51 = v31;
          id v33 = objc_msgSend(v31, "__swift_objectForKeyedSubscript:", v32);
          swift_unknownObjectRelease(v32);
          if (v33)
          {
            _bridgeAnyObjectToAny(_:)(&v56, v33);
            swift_unknownObjectRelease(v33);
          }

          else
          {
            __int128 v56 = 0u;
            __int128 v57 = 0u;
          }

          sub_100007B84((uint64_t)&v56, (uint64_t)v58, &qword_100021510);
          if (v59)
          {
            if ((swift_dynamicCast(&v54, v58, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
            {
              uint64_t v50 = v6;
              uint64_t v17 = (uint64_t)v54;
              uint64_t v18 = v55;
              *(void *)&__int128 v56 = 0x6E6F5A7472656C41LL;
              *((void *)&v56 + 1) = 0xEA00000000007365LL;
              uint64_t v43 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v56, &type metadata for String);
              id v44 = objc_msgSend(v51, "__swift_objectForKeyedSubscript:", v43);
              swift_unknownObjectRelease(v43);
              if (v44)
              {
                _bridgeAnyObjectToAny(_:)(&v56, v44);
                swift_unknownObjectRelease(v44);
              }

              else
              {
                __int128 v56 = 0u;
                __int128 v57 = 0u;
              }

              sub_100007B84((uint64_t)&v56, (uint64_t)v58, &qword_100021510);
              if (v59)
              {
                uint64_t v45 = sub_10000799C(&qword_100021528);
                if ((swift_dynamicCast(&v54, v58, (char *)&type metadata for Any + 8, v45, 6LL) & 1) == 0)
                {
LABEL_45:
                  swift_bridgeObjectRelease(v18);
                  swift_bridgeObjectRelease(v22);
                  uint64_t v28 = swift_bridgeObjectRelease(v16);
                  goto LABEL_46;
                }

                id v20 = v54;
                strcpy((char *)&v56, "ShouldAlertAll");
                HIBYTE(v56) = -18;
                id v49 = (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v56, &type metadata for String);
                id v46 = objc_msgSend(v51, "__swift_objectForKeyedSubscript:", v49);
                swift_unknownObjectRelease(v49);
                if (v46)
                {
                  _bridgeAnyObjectToAny(_:)(&v56, v46);
                  swift_unknownObjectRelease(v46);
                }

                else
                {
                  __int128 v56 = 0u;
                  __int128 v57 = 0u;
                }

                sub_100007B84((uint64_t)&v56, (uint64_t)v58, &qword_100021510);
                if (v59)
                {
                  uint64_t v47 = sub_100007C04(0LL, &qword_100021530, &OBJC_CLASS___NSNumber_ptr);
                  if ((swift_dynamicCast(&v54, v58, (char *)&type metadata for Any + 8, v47, 6LL) & 1) != 0)
                  {
                    id v49 = v54;
                    unsigned __int16 v21 = (unsigned __int16)[v54 BOOLValue];

                    sub_100007BC8(v53, &qword_1000214E8);
                    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v12, v50);
                    goto LABEL_24;
                  }

                  swift_bridgeObjectRelease(v20);
                  goto LABEL_45;
                }

                swift_bridgeObjectRelease(v20);
              }

              swift_bridgeObjectRelease(v18);
              swift_bridgeObjectRelease(v22);
              swift_bridgeObjectRelease(v16);
              uint64_t v28 = sub_100007BC8((uint64_t)v58, &qword_100021510);
LABEL_46:
              uint64_t v6 = v50;
              id v25 = v51;
              goto LABEL_22;
            }

            swift_bridgeObjectRelease(v22);
            uint64_t v28 = swift_bridgeObjectRelease(v16);
            id v25 = v51;
          }

          else
          {
            swift_bridgeObjectRelease(v22);
            swift_bridgeObjectRelease(v16);
            uint64_t v28 = sub_100007BC8((uint64_t)v58, &qword_100021510);
            id v25 = v51;
          }
        }

        else
        {
          uint64_t v28 = swift_bridgeObjectRelease(v16);
        }

LABEL_22:
        uint64_t v34 = static os_log_type_t.error.getter(v28);
        uint64_t v35 = sub_10000799C((uint64_t *)&unk_1000219D0);
        uint64_t v36 = swift_allocObject(v35, 112LL, 7LL);
        *(_OWORD *)(v36 + 16) = xmmword_100017CD0;
        *(void *)(v36 + 56) = sub_100007C04(0LL, &qword_100021518, &OBJC_CLASS___NSDictionary_ptr);
        *(void *)(v36 + 64) = sub_100007B44(&qword_100021520, &qword_100021518, &OBJC_CLASS___NSDictionary_ptr);
        *(void *)(v36 + 32) = v25;
        id v37 = v25;
        URL._bridgeToObjectiveC()(v38);
        uint64_t v40 = v39;
        *(void *)(v36 + 96) = sub_100007C04(0LL, &qword_1000214F0, &OBJC_CLASS___NSURL_ptr);
        *(void *)(v36 + 104) = sub_100007B44(&qword_1000214F8, &qword_1000214F0, &OBJC_CLASS___NSURL_ptr);
        *(void *)(v36 + 72) = v40;
        uint64_t v41 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
        v42 = (void *)static OS_os_log.default.getter(v41);
        os_log(_:dso:log:type:_:)( "Version plist %{public}@ fetched from %{public}@ is invalid",  59LL,  2LL,  &_mh_execute_header,  v42,  v34,  v36);

        swift_bridgeObjectRelease(v36);
        sub_100007BC8(v53, &qword_1000214E8);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v12, v6);
        uint64_t v14 = 0LL;
        unint64_t v16 = 0LL;
        uint64_t v23 = 0LL;
        unint64_t v22 = 0LL;
        uint64_t v17 = 0LL;
        uint64_t v18 = 0LL;
        goto LABEL_23;
      }

      swift_bridgeObjectRelease(v16);
    }

    uint64_t v28 = sub_100007BC8((uint64_t)v58, &qword_100021510);
    goto LABEL_22;
  }

  sub_100007BC8((uint64_t)v5, &qword_1000214E8);
  id v13 = [(id)objc_opt_self(NSTimeZone) timeZoneDataVersion];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  unint64_t v16 = v15;

  if (qword_1000213F0 != -1) {
    swift_once(&qword_1000213F0, sub_100016AA8);
  }
  uint64_t v17 = qword_1000225E8;
  uint64_t v18 = qword_1000225F0;
  swift_bridgeObjectRetain(qword_1000225F0);
  uint64_t result = sub_100007BC8(a1, &qword_1000214E8);
  if (!v18)
  {
    swift_bridgeObjectRelease(0xE300000000000000LL);
    uint64_t result = swift_bridgeObjectRelease(v16);
    uint64_t v14 = 0LL;
    unint64_t v16 = 0LL;
    uint64_t v23 = 0LL;
    unint64_t v22 = 0LL;
    uint64_t v17 = 0LL;
LABEL_23:
    id v20 = 0LL;
    unsigned __int16 v21 = 0;
    goto LABEL_24;
  }

  id v20 = 0LL;
  unsigned __int16 v21 = 256;
  unint64_t v22 = 0xE300000000000000LL;
  uint64_t v23 = 3157553LL;
LABEL_24:
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v22;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v18;
  *(void *)(a2 + 48) = v20;
  *(_WORD *)(a2 + 56) = v21;
  return result;
}

  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  id v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  *id v24 = v8;
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

void sub_100007258(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  BOOL v5 = &v37[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v6 = sub_10000799C(&qword_1000214E8);
  __chkstk_darwin(v6);
  uint64_t v8 = &v37[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  id v9 = [(id)objc_opt_self(NSFileManager) defaultManager];
  if (qword_1000213E0 != -1) {
    swift_once(&qword_1000213E0, sub_1000169A0);
  }
  NSString v10 = String._bridgeToObjectiveC()();
  id v38 = 0LL;
  id v11 = [v9 destinationOfSymbolicLinkAtPath:v10 error:&v38];

  id v12 = v38;
  if (!v11)
  {
    id v17 = v38;
    uint64_t v18 = _convertNSErrorToError(_:)(v12);

    swift_willThrow();
    uint64_t v19 = swift_errorRelease(v18);
    uint64_t v20 = static os_log_type_t.fault.getter(v19);
    uint64_t v21 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    unint64_t v22 = (void *)static OS_os_log.default.getter(v21);
    os_log(_:dso:log:type:_:)( "Unable to determine current time zone version info; zoneinfo symlink broken",
      75LL,
      2LL,
      &_mh_execute_header,
      v22,
      v20,
      &_swiftEmptyArrayStorage);
LABEL_15:

    id v26 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v31 = 0LL;
    char v33 = 0;
    char v32 = 0;
    unint64_t v25 = 0xE000000000000000LL;
    unint64_t v28 = 0xE000000000000000LL;
    unint64_t v30 = 0xE000000000000000LL;
    goto LABEL_16;
  }

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v15 = v14;
  id v16 = v12;

  if (qword_1000213B0 != -1) {
    swift_once(&qword_1000213B0, sub_1000166B8);
  }
  if (v13 == qword_100022568 && v15 == qword_100022570
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, qword_100022568, qword_100022570, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(v15);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1LL, 1LL, v2);
  }

  else
  {
    URL.init(fileURLWithPath:)(v13, v15);
    uint64_t v23 = swift_bridgeObjectRelease(v15);
    URL.deletingLastPathComponent()(v23);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0LL, 1LL, v2);
  }

  sub_100006828((uint64_t)v8, (uint64_t)v37);
  uint64_t v24 = sub_100007B84((uint64_t)v37, (uint64_t)&v38, &qword_1000214E0);
  unint64_t v25 = v39;
  if (!v39)
  {
    uint64_t v34 = static os_log_type_t.error.getter(v24);
    uint64_t v35 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    unint64_t v22 = (void *)static OS_os_log.default.getter(v35);
    os_log(_:dso:log:type:_:)( "Unable to determine current time zone version info",  50LL,  2LL,  &_mh_execute_header,  v22,  v34,  &_swiftEmptyArrayStorage);
    goto LABEL_15;
  }

  id v26 = v38;
  uint64_t v27 = v40;
  unint64_t v28 = v41;
  uint64_t v29 = v42;
  unint64_t v30 = v43;
  uint64_t v31 = v44;
  char v32 = v46 & 1;
  char v33 = v45 & 1;
LABEL_16:
  *(void *)a1 = v26;
  *(void *)(a1 + 8) = v25;
  *(void *)(a1 + 16) = v27;
  *(void *)(a1 + 24) = v28;
  *(void *)(a1 + 32) = v29;
  *(void *)(a1 + 40) = v30;
  *(void *)(a1 + 48) = v31;
  *(_BYTE *)(a1 + 56) = v33;
  *(_BYTE *)(a1 + 57) = v32;
}

uint64_t sub_1000075F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000799C(&qword_1000214E8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = [(id)objc_opt_self(NSFileManager) defaultManager];
  if (qword_1000213C8 != -1) {
    swift_once(&qword_1000213C8, sub_1000167F4);
  }
  NSString v6 = String._bridgeToObjectiveC()();
  *(void *)&v23[0] = 0LL;
  id v7 = [v5 destinationOfSymbolicLinkAtPath:v6 error:v23];

  uint64_t v8 = *(void **)&v23[0];
  if (v7)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    uint64_t v11 = v10;
    id v12 = v8;

    URL.init(fileURLWithPath:)(v9, v11);
    swift_bridgeObjectRelease(v11);
    uint64_t v13 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v4, 0LL, 1LL, v13);
    uint64_t result = sub_100006828((uint64_t)v4, (uint64_t)v23);
    __int128 v15 = v23[0];
    __int128 v16 = v23[1];
    __int128 v17 = v23[2];
    uint64_t v18 = v24;
    __int16 v19 = v25;
  }

  else
  {
    id v20 = *(id *)&v23[0];
    uint64_t v21 = _convertNSErrorToError(_:)(v8);

    swift_willThrow();
    uint64_t result = swift_errorRelease(v21);
    uint64_t v18 = 0LL;
    __int16 v19 = 0;
    __int128 v15 = 0uLL;
    __int128 v16 = 0uLL;
    __int128 v17 = 0uLL;
  }

  *(_OWORD *)a1 = v15;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = v17;
  *(void *)(a1 + 48) = v18;
  *(_WORD *)(a1 + 56) = v19;
  return result;
}

__n128 sub_1000077E8@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = sub_10000799C((uint64_t *)&unk_1000219F0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = (__n128 *)v21;
  sub_100007258((uint64_t)v21);
  sub_1000075F8((uint64_t)v22);
  sub_100007B84((uint64_t)v22, (uint64_t)v23, &qword_1000214E0);
  if (*((void *)&v23[0] + 1))
  {
    v25[0] = v23[0];
    v25[1] = v23[1];
    v26[0] = v24[0];
    *(_OWORD *)((char *)v26 + 10) = *(_OWORD *)((char *)v24 + 10);
    uint64_t v6 = sub_100006604();
    uint64_t v8 = v7;
    uint64_t v9 = sub_100006604();
    uint64_t v11 = v10;
    v20[2] = v6;
    v20[3] = v8;
    v20[0] = v9;
    v20[1] = v10;
    uint64_t v12 = type metadata accessor for Locale(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v4, 1LL, 1LL, v12);
    unint64_t v13 = sub_1000079DC();
    uint64_t v14 = StringProtocol.compare<A>(_:options:range:locale:)( v20,  64LL,  0LL,  0LL,  1LL,  v4,  &type metadata for String,  &type metadata for String,  v13,  v13);
    sub_100007BC8((uint64_t)v4, (uint64_t *)&unk_1000219F0);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v11);
    if (v14 == -1)
    {
      sub_100007AA8(v21);
      id v5 = (__n128 *)v25;
    }

    else
    {
      sub_100007A20(v22);
      id v5 = (__n128 *)v21;
    }
  }

  unsigned __int8 v15 = v5[3].n128_u8[9];
  unsigned __int8 v16 = v5[3].n128_u8[8];
  unint64_t v17 = v5[3].n128_u64[0];
  __n128 v19 = v5[1];
  __n128 result = v5[2];
  *a1 = *v5;
  a1[1] = v19;
  a1[2] = result;
  a1[3].n128_u64[0] = v17;
  a1[3].n128_u8[8] = v16;
  a1[3].n128_u8[9] = v15;
  return result;
}

uint64_t sub_10000799C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000079DC()
{
  unint64_t result = qword_100021A00;
  if (!qword_100021A00)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021A00);
  }

  return result;
}

uint64_t *sub_100007A20(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100007A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a7);
  }

  return result;
}

void *sub_100007AA8(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[6];
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_100007AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000799C(&qword_1000214E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007B44(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = sub_100007C04(255LL, a2, a3);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100007B84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000799C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007BC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000799C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100007C04(uint64_t a1, unint64_t *a2, void *a3)
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

void *sub_100007C3C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  unint64_t v13 = &_swiftEmptyArrayStorage;
  sub_100008AFC(0LL, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_10000A864(i, (uint64_t)v12);
      uint64_t v5 = sub_10000799C(&qword_100021510);
      uint64_t v6 = sub_10000799C(&qword_100021570);
      uint64_t v7 = v11;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100008AFC(0LL, v3[2] + 1LL, 1);
        uint64_t v3 = v13;
      }

      unint64_t v9 = v3[2];
      unint64_t v8 = v3[3];
      if (v9 >= v8 >> 1)
      {
        sub_100008AFC((void *)(v8 > 1), v9 + 1, 1);
        uint64_t v3 = v13;
      }

      v3[2] = v9 + 1;
      v3[v9 + 4] = v7;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v11 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v11);
    return 0LL;
  }

  return v3;
}

uint64_t sub_100007D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  uint64_t v9 = a1;
  if (qword_100021380 != -1) {
    a1 = swift_once(&qword_100021380, sub_10000B8E4);
  }
  if (byte_100022530 == 1)
  {
    uint64_t v10 = static os_log_type_t.info.getter(a1);
    uint64_t v11 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v12 = (void *)static OS_os_log.default.getter(v11);
    os_log(_:dso:log:type:_:)( "Requesting deferred restart of audio accessory",  46LL,  2LL,  &_mh_execute_header,  v12,  v10,  &_swiftEmptyArrayStorage);

    sub_10000A928(v13);
    return a4();
  }

  else
  {
    uint64_t v15 = swift_allocObject(&unk_10001CCB0, 32LL, 7LL);
    *(void *)(v15 + 16) = a4;
    *(void *)(v15 + 24) = a5;
    if ((*(_BYTE *)(v9 + 56) & 1) != 0)
    {
      swift_retain_n(a5, 2LL);
      sub_1000080B0(1, (void (*)(void))a4);
      swift_release(a5);
      return swift_release(v15);
    }

    else
    {
      sub_100007B84(v9 + 48, (uint64_t)&v29, &qword_100021538);
      uint64_t v16 = sub_100007B84((uint64_t)&v29, (uint64_t)&v30, &qword_100021538);
      uint64_t v17 = v30;
      if (v30)
      {
        __chkstk_darwin(v16);
        v28[2] = a2;
        v28[3] = a3;
        swift_retain_n(a5, 2LL);
        sub_10000A6FC(&v29);
        uint64_t v18 = sub_10000A58C(v17, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100008514, (uint64_t)v28);
        sub_10000A724(&v29);
        __n128 v19 = sub_10000851C(v18);
        swift_release(v18);
        uint64_t v20 = sub_10000A74C((uint64_t)v19);
        uint64_t v21 = swift_bridgeObjectRelease(v19);
        uint64_t v22 = static os_log_type_t.debug.getter(v21);
        uint64_t v23 = sub_10000799C((uint64_t *)&unk_1000219D0);
        uint64_t v24 = swift_allocObject(v23, 72LL, 7LL);
        *(_OWORD *)(v24 + 16) = xmmword_100017CF0;
        *(void *)(v24 + 56) = sub_10000799C(&qword_100021540);
        *(void *)(v24 + 64) = sub_10000A8E8( &qword_100021548,  &qword_100021540,  (uint64_t)&protocol conformance descriptor for Set<A>);
        *(void *)(v24 + 32) = v20;
        sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
        uint64_t v25 = swift_bridgeObjectRetain(v20);
        id v26 = (void *)static OS_os_log.default.getter(v25);
        os_log(_:dso:log:type:_:)("Zones to present alerts for: %@", 31LL, 2LL, &_mh_execute_header, v26, v22, v24);
        swift_bridgeObjectRelease(v24);

        sub_100009E44((uint64_t (*)(BOOL))sub_10000850C, v15, v20);
        swift_release(a5);
        swift_release(v15);
        return swift_bridgeObjectRelease(v20);
      }

      else
      {
        uint64_t v27 = swift_retain_n(a5, 2LL);
        ((void (*)(uint64_t))a4)(v27);
        swift_release(a5);
        return swift_release(v15);
      }
    }
  }

CFStringRef sub_1000080B0(char a1, void (*a2)(void))
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a1 & 1) == 0) {
    return (CFStringRef)((uint64_t (*)(uint64_t))a2)(v6);
  }
  URL.init(fileURLWithPath:isDirectory:)(0xD000000000000033LL, 0x8000000100018300LL, 1LL);
  uint64_t v9 = sub_10000799C(&qword_100021598);
  uint64_t inited = swift_initStackObject(v9, &v32);
  *(_OWORD *)(inited + 16) = xmmword_100017D00;
  CFStringRef result = kCFUserNotificationLocalizationURLKey;
  if (!kCFUserNotificationLocalizationURLKey)
  {
    __break(1u);
    goto LABEL_12;
  }

  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationLocalizationURLKey);
  *(void *)(inited + 40) = v12;
  *(void *)(inited + 72) = v4;
  uint64_t v13 = sub_10000A8AC((void *)(inited + 48));
  (*(void (**)(void *, char *, uint64_t))(v5 + 16))(v13, v8, v4);
  *(void *)(inited + 80) = 0xD000000000000025LL;
  *(void *)(inited + 88) = 0x8000000100018340LL;
  uint64_t v14 = sub_10000799C(&qword_100021550);
  *(void *)(inited + 96) = &off_10001CA50;
  *(void *)(inited + 120) = v14;
  *(void *)(inited + 128) = 0xD00000000000001DLL;
  *(void *)(inited + 136) = 0x8000000100018370LL;
  *(void *)(inited + 168) = &type metadata for Bool;
  *(_BYTE *)(inited + 144) = 1;
  CFStringRef result = kCFUserNotificationAlertHeaderKey;
  if (!kCFUserNotificationAlertHeaderKey)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlertHeaderKey);
  *(void *)(inited + 184) = v15;
  *(void *)(inited + 216) = &type metadata for String;
  strcpy((char *)(inited + 192), "TZUPDATE_TITLE");
  *(_BYTE *)(inited + 207) = -18;
  CFStringRef result = kCFUserNotificationAlertMessageKey;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlertMessageKey);
  *(void *)(inited + 232) = v16;
  *(void *)(inited + 264) = &type metadata for String;
  strcpy((char *)(inited + 240), "TZUPDATE_ALERT");
  *(_BYTE *)(inited + 255) = -18;
  CFStringRef result = kCFUserNotificationDefaultButtonTitleKey;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  *(void *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationDefaultButtonTitleKey);
  *(void *)(inited + 280) = v17;
  *(void *)(inited + 312) = &type metadata for String;
  *(void *)(inited + 288) = 0x5F4C4C4154534E49LL;
  *(void *)(inited + 296) = 0xEB00000000574F4ELL;
  CFStringRef result = kCFUserNotificationAlternateButtonTitleKey;
  if (!kCFUserNotificationAlternateButtonTitleKey)
  {
LABEL_15:
    __break(1u);
    return result;
  }

  *(void *)(inited + 320) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCFUserNotificationAlternateButtonTitleKey);
  *(void *)(inited + 328) = v18;
  *(void *)(inited + 360) = &type metadata for String;
  strcpy((char *)(inited + 336), "INSTALL_LATER");
  *(_WORD *)(inited + 350) = -4864;
  unint64_t v19 = sub_10000AC24(inited);
  SInt32 v31 = 0;
  isa = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  uint64_t v21 = CFUserNotificationCreate(0LL, 172800.0, 1uLL, &v31, isa);

  CFOptionFlags v30 = 0LL;
  uint64_t v22 = CFUserNotificationReceiveResponse(v21, 172800.0, &v30);
  if ((v30 & 3) == 0)
  {
    uint64_t v23 = static os_log_type_t.info.getter(v22);
    uint64_t v24 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v25 = (void *)static OS_os_log.default.getter(v24);
    os_log(_:dso:log:type:_:)( "Restarting at user request",  26LL,  2LL,  &_mh_execute_header,  v25,  v23,  &_swiftEmptyArrayStorage);

    id v26 = objc_allocWithZone(&OBJC_CLASS___FBSShutdownOptions);
    NSString v27 = String._bridgeToObjectiveC()();
    id v28 = [v26 initWithReason:v27];

    [v28 setRebootType:1];
    id v29 = [(id)objc_opt_self(FBSSystemService) sharedService];
    [v29 shutdownWithOptions:v28];
  }

  a2();

  return (CFStringRef)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_1000084E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

CFStringRef sub_10000850C(char a1)
{
  return sub_1000080B0(a1, *(void (**)(void))(v1 + 16));
}

BOOL sub_100008514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100015BA0(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

char *sub_10000851C(uint64_t a1)
{
  uint64_t v23 = a1 + 64;
  uint64_t v2 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v3 = -1LL;
  if (v2 < 64) {
    uint64_t v3 = ~(-1LL << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  CFStringRef result = (char *)swift_bridgeObjectRetain(a1);
  int64_t v7 = 0LL;
  unint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v4)
    {
      unint64_t v9 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v10 = v9 | (v7 << 6);
    }

    else
    {
      int64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1LL)) {
        goto LABEL_42;
      }
      if (v11 >= v5)
      {
LABEL_37:
        swift_release(a1);
        return v8;
      }

      unint64_t v12 = *(void *)(v23 + 8 * v11);
      ++v7;
      if (!v12)
      {
        int64_t v7 = v11 + 1;
        if (v11 + 1 >= v5) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v23 + 8 * v7);
        if (!v12)
        {
          int64_t v7 = v11 + 2;
          if (v11 + 2 >= v5) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v23 + 8 * v7);
          if (!v12)
          {
            int64_t v7 = v11 + 3;
            if (v11 + 3 >= v5) {
              goto LABEL_37;
            }
            unint64_t v12 = *(void *)(v23 + 8 * v7);
            if (!v12)
            {
              int64_t v13 = v11 + 4;
              if (v13 >= v5) {
                goto LABEL_37;
              }
              unint64_t v12 = *(void *)(v23 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v7 = v13 + 1;
                  if (__OFADD__(v13, 1LL)) {
                    goto LABEL_43;
                  }
                  if (v7 >= v5) {
                    goto LABEL_37;
                  }
                  unint64_t v12 = *(void *)(v23 + 8 * v7);
                  ++v13;
                  if (v12) {
                    goto LABEL_23;
                  }
                }
              }

              int64_t v7 = v13;
            }
          }
        }
      }

LABEL_23:
      unint64_t v4 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
    }

    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    uint64_t v15 = *(void *)(v14 + 16);
    int64_t v16 = *((void *)v8 + 2);
    int64_t v17 = v16 + v15;
    if (__OFADD__(v16, v15)) {
      break;
    }
    swift_bridgeObjectRetain(*(void *)(*(void *)(a1 + 56) + 8 * v10));
    CFStringRef result = (char *)swift_isUniquelyReferenced_nonNull_native(v8);
    if ((_DWORD)result && v17 <= *((void *)v8 + 3) >> 1)
    {
      if (!*(void *)(v14 + 16)) {
        goto LABEL_4;
      }
    }

    else
    {
      if (v16 <= v17) {
        int64_t v18 = v16 + v15;
      }
      else {
        int64_t v18 = v16;
      }
      CFStringRef result = sub_1000089FC(result, v18, 1, v8);
      unint64_t v8 = result;
      if (!*(void *)(v14 + 16))
      {
LABEL_4:
        if (v15) {
          goto LABEL_39;
        }
        goto LABEL_5;
      }
    }

    uint64_t v19 = *((void *)v8 + 2);
    if ((*((void *)v8 + 3) >> 1) - v19 < v15) {
      goto LABEL_40;
    }
    CFStringRef result = (char *)swift_arrayInitWithCopy(&v8[16 * v19 + 32], v14 + 32, v15, &type metadata for String);
    if (v15)
    {
      uint64_t v20 = *((void *)v8 + 2);
      BOOL v21 = __OFADD__(v20, v15);
      uint64_t v22 = v20 + v15;
      if (v21) {
        goto LABEL_41;
      }
      *((void *)v8 + 2) = v22;
    }

        if ((a4 & 0x4000000000000000LL) != 0) {
          goto LABEL_46;
        }
        v64 = *(void *)(a4 + 16);
        CFStringRef result = (void **)swift_retain(a4);
        v102 = v64;
        if (v64) {
          goto LABEL_25;
        }
LABEL_47:
        swift_release_n(a4, 2LL);
        unint64_t v39 = 0LL;
        v62 = v92;
LABEL_48:
        v61 = v97;
        goto LABEL_49;
      }
    }

    else
    {
      uint64_t v47 = *(void *)((v40 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      v92 = v7;
      if (v47) {
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease(v40);
    a4 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_23;
  }

  char v46 = v101;
  v61 = v97;
  v62 = v7;
LABEL_49:
  sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v82 = (void *)static OS_dispatch_queue.main.getter();
  v83 = (void *)swift_allocObject(&unk_10001CDC8, 40LL, 7LL);
  v83[2] = v61;
  v83[3] = v46;
  v83[4] = v39;
  v108 = sub_100011344;
  v109 = v83;
  aBlock = (unint64_t)_NSConcreteStackBlock;
  v105 = 1107296256LL;
  v106 = sub_100012F28;
  v107 = &unk_10001CDE0;
  v84 = _Block_copy(&aBlock);
  v85 = v109;
  swift_retain(v39);
  swift_retain(v46);
  v86 = swift_release(v85);
  v87 = v93;
  static DispatchQoS.unspecified.getter(v86);
  aBlock = (unint64_t)&_swiftEmptyArrayStorage;
  v88 = sub_100006008( (unint64_t *)&qword_100021700,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v89 = sub_10000799C((uint64_t *)&unk_1000219C0);
  v90 = sub_10000A8E8( (unint64_t *)&qword_100021708,  (uint64_t *)&unk_1000219C0,  (uint64_t)&protocol conformance descriptor for [A]);
  v91 = v94;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v89, v90, v62, v88);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v87, v91, v84);
  _Block_release(v84);
  swift_release(v39);

  (*(void (**)(char *, uint64_t))(v99 + 8))(v91, v62);
  return (void **)(*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v87, v95);
}

    unint64_t v9 = (v15 - 1) & v15;
    int64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    int64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    int64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)(v32, v8[5]);
    swift_bridgeObjectRetain(v19);
    String.hash(into:)(v32, v18, v19);
    CFStringRef result = Hasher._finalize()();
    uint64_t v20 = -1LL << *((_BYTE *)v8 + 32);
    BOOL v21 = result & ~v20;
    uint64_t v22 = v21 >> 6;
    if (((-1LL << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      uint64_t v23 = __clz(__rbit64((-1LL << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        id v26 = v22 == v25;
        if (v22 == v25) {
          uint64_t v22 = 0LL;
        }
        v24 |= v26;
        NSString v27 = *(void *)(v11 + 8 * v22);
      }

      while (v27 == -1);
      uint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }

    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    id v28 = (void *)(v8[6] + 16 * v23);
    *id v28 = v18;
    v28[1] = v19;
    ++v8[2];
    if (__OFSUB__(v5--, 1LL))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (!v5) {
      goto LABEL_36;
    }
  }

  int64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  uint64_t v15 = a1[v16];
  if (v15)
  {
    unint64_t v10 = v16;
    goto LABEL_23;
  }

  while (1)
  {
    unint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    uint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }

LABEL_5:
    CFStringRef result = (char *)swift_bridgeObjectRelease(v14);
  }

  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

  int64_t v7 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  CFStringRef result = (char *)swift_arrayInitWithCopy(&v3[16 * v7 + 32], v6 + 32, v2, &type metadata for String);
  if (!v2)
  {
LABEL_14:
    CFStringRef result = (char *)swift_bridgeObjectRelease(v6);
    void *v1 = v3;
    return result;
  }

  unint64_t v8 = *((void *)v3 + 2);
  unint64_t v9 = __OFADD__(v8, v2);
  unint64_t v10 = v8 + v2;
  if (!v9)
  {
    *((void *)v3 + 2) = v10;
    goto LABEL_14;
  }

uint64_t sub_10000875C(uint64_t a1)
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
    uint64_t result = sub_100009C8C(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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

char *sub_100008914(char *result)
{
  uint64_t v2 = *((void *)result + 2);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = result;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*((void *)v6 + 2)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = sub_1000089FC(result, v11, 1, v3);
  uint64_t v3 = result;
  if (!*((void *)v6 + 2))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

LABEL_18:
  __break(1u);
  return result;
}

char *sub_1000089FC(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000799C(&qword_100021568);
    int64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
    int64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100008AFC(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008B50(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_100008B18(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008C70(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100008B34(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008E78(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_100008B50(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000799C(&qword_100021578);
    int64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }

  else
  {
    int64_t v11 = &_swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4]) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v15 = sub_10000799C(&qword_100021570);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }

  swift_release(a4);
  return v11;
}

void *sub_100008C70(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000799C(&qword_100021580);
    int64_t v11 = (void *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 5);
  }

  else
  {
    int64_t v11 = &_swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v11 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v15 = sub_10000799C(&qword_100021510);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }

  swift_release(a4);
  return v11;
}

char *sub_100008D90(char *result, int64_t a2, char a3, char *a4)
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

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000799C(&qword_1000215B0);
    int64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    int64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, v8);
  }

  swift_release(a4);
  return v11;
}

char *sub_100008E78(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000799C(&qword_100021568);
    int64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
    int64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_100008F78(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    int64_t v12 = (void *)(v11 + 16 * v10);
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
  sub_100009400(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *uint64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

Swift::Int sub_100009124(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000799C(&qword_100021588);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    char v33 = (void *)(v3 + 56);
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
                  *char v33 = -1LL << v31;
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

      BOOL v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
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
    BOOL v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
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

  __break(1u);
  return result;
}

uint64_t sub_100009400(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_100009124(v11);
  }

  else
  {
    if (v10 > v9)
    {
      Swift::Int result = (uint64_t)sub_100009598();
      goto LABEL_22;
    }

    sub_100009748(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  Swift::Int result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    unint64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
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
          Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

void *sub_100009598()
{
  uint64_t v1 = v0;
  sub_10000799C(&qword_100021588);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
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
    Swift::Int result = (void *)swift_bridgeObjectRetain(v18);
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

LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100009748(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000799C(&qword_100021588);
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

Swift::Int sub_1000099F4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

  sub_10000799C(&qword_100021590);
  Swift::Int result = static _DictionaryStorage.allocate(capacity:)(v5);
  Swift::Int v9 = result;
  int64_t v32 = a1;
  uint64_t v33 = a2;
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
      unint64_t v14 = v13 | (v11 << 6);
    }

    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        goto LABEL_40;
      }
      if (v15 >= v33) {
        return v9;
      }
      unint64_t v16 = v32[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v33) {
          return v9;
        }
        unint64_t v16 = v32[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v33) {
            return v9;
          }
          unint64_t v16 = v32[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v33) {
              return v9;
            }
            unint64_t v16 = v32[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1LL)) {
                  goto LABEL_41;
                }
                if (v11 >= v33) {
                  return v9;
                }
                unint64_t v16 = v32[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v11 = v17;
          }
        }
      }

LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }

    int64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    Hasher.init(_seed:)(v34, *(void *)(v9 + 40));
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v21);
    String.hash(into:)(v34, v20, v19);
    Swift::Int result = Hasher._finalize()();
    uint64_t v22 = -1LL << *(_BYTE *)(v9 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
      }

      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }

    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    uint64_t v30 = (void *)(*(void *)(v9 + 48) + 16 * v25);
    *uint64_t v30 = v20;
    v30[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v25) = v21;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1LL)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }

    uint64_t v11 = (v20 - 1) & v20;
    uint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_25:
    uint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
    if ((v40 & 1) != 0)
    {
      sub_100011DE8(v23, v42);
    }

    else
    {
      sub_10000A824((uint64_t)v23, (uint64_t)v42);
      unint64_t v24 = v22;
    }

    unint64_t v25 = *(void *)(v8 + 40);
    char v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    BOOL v28 = v27;
    Hasher.init(_seed:)(v41, v25);
    String.hash(into:)(v41, v26, v28);
    uint64_t v29 = Hasher._finalize()();
    Swift::Int result = (_OWORD *)swift_bridgeObjectRelease(v28);
    uint64_t v30 = -1LL << *(_BYTE *)(v8 + 32);
    uint64_t v31 = v29 & ~v30;
    int64_t v32 = v31 >> 6;
    if (((-1LL << v31) & ~*(void *)(v12 + 8 * (v31 >> 6))) != 0)
    {
      uint64_t v15 = __clz(__rbit64((-1LL << v31) & ~*(void *)(v12 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        uint64_t v35 = v32 == v34;
        if (v32 == v34) {
          int64_t v32 = 0LL;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v12 + 8 * v32);
      }

      while (v36 == -1);
      uint64_t v15 = __clz(__rbit64(~v36)) + (v32 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v8 + 48) + 8 * v15) = v22;
    Swift::Int result = sub_100011DE8(v42, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v19 = (void *)(v5 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  id v37 = 1LL << *(_BYTE *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v19, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v19 = -1LL << v37;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_44:
  Swift::Int result = (_OWORD *)swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100009C8C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
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
    Swift::Int result = swift_bridgeObjectRelease(a3);
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

  if (v5)
  {
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
      Swift::Int result = swift_bridgeObjectRelease(a3);
      if (v11 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000A8E8(&qword_1000215A8, &qword_1000215A0, (uint64_t)&protocol conformance descriptor for [A]);
          swift_bridgeObjectRetain(a3);
          for (unint64_t i = 0LL; i != v7; ++i)
          {
            sub_10000799C(&qword_1000215A0);
            unint64_t v13 = sub_100012A08(v17, i, a3);
            id v15 = *v14;
            ((void (*)(void (**)(id *), void))v13)(v17, 0LL);
            *(void *)(v5 + 8 * i) = v15;
          }

          swift_bridgeObjectRelease(a3);
          return a3;
        }

        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      if (v8 <= a2)
      {
        uint64_t v9 = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
        swift_arrayInitWithCopy(v5, (a3 & 0xFFFFFFFFFFFFFF8LL) + 32, v8, v9);
        return a3;
      }

      __break(1u);
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_100009E44(uint64_t (*a1)(BOOL), uint64_t a2, uint64_t a3)
{
  __int128 v57 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v6 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v7 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v8 = (__CFString *)String._bridgeToObjectiveC()();
  CFPropertyListRef v9 = CFPreferencesCopyValue(v6, v7, v8, kCFPreferencesAnyHost);

  if (v9)
  {
    *(void *)&__int128 v55 = v9;
    swift_unknownObjectRetain(v9);
    uint64_t v11 = sub_10000799C(&qword_100021560);
    uint64_t v12 = swift_dynamicCast(&v53, &v55, (char *)&type metadata for Swift.AnyObject + 8, v11, 6LL);
    if ((v12 & 1) == 0) {
      goto LABEL_31;
    }
    unint64_t v13 = v53;
    int64_t v14 = v53[2];
    uint64_t v51 = a2;
    uint64_t v52 = a3;
    uint64_t v50 = a1;
    if (v14)
    {
      uint64_t v53 = (unint64_t *)&_swiftEmptyArrayStorage;
      sub_100008B18(0LL, v14, 0);
      uint64_t v15 = 0LL;
      uint64_t v16 = v53;
      do
      {
        unint64_t v17 = v13[v15 + 4];
        if (*(void *)(v17 + 16))
        {
          swift_bridgeObjectRetain(v13[v15 + 4]);
          unint64_t v18 = sub_10000FF18(2037672291LL, 0xE400000000000000LL);
          if ((v19 & 1) != 0)
          {
            sub_10000A824(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v55);
          }

          else
          {
            __int128 v55 = 0u;
            __int128 v56 = 0u;
          }

          swift_bridgeObjectRelease(v17);
        }

        else
        {
          __int128 v55 = 0u;
          __int128 v56 = 0u;
        }

        uint64_t v53 = v16;
        unint64_t v21 = v16[2];
        unint64_t v20 = v16[3];
        if (v21 >= v20 >> 1)
        {
          sub_100008B18((void *)(v20 > 1), v21 + 1, 1);
          uint64_t v16 = v53;
        }

        ++v15;
        v16[2] = v21 + 1;
        sub_100007B84((uint64_t)&v55, (uint64_t)&v16[4 * v21 + 4], &qword_100021510);
      }

      while (v14 != v15);
      swift_bridgeObjectRelease(v13);
    }

    else
    {
      swift_bridgeObjectRelease(v53);
      uint64_t v16 = (unint64_t *)&_swiftEmptyArrayStorage;
    }

    char v26 = sub_100007C3C((uint64_t)v16);
    uint64_t v12 = swift_bridgeObjectRelease(v16);
    a3 = v52;
    a1 = v50;
    if (v26)
    {
      uint64_t v27 = v26[2];
      if (v27)
      {
        swift_bridgeObjectRetain(v26);
        uint64_t v28 = 0LL;
        uint64_t v29 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          uint64_t v31 = v26[v28 + 4];
          uint64_t v32 = *(void *)(v31 + 16);
          swift_bridgeObjectRetain(v31);
          if (!v32
            || (unint64_t v33 = sub_10000FF18(0x656E6F5A656D6974LL, 0xE800000000000000LL), (v34 & 1) == 0)
            || (sub_10000A824(*(void *)(v31 + 56) + 32 * v33, (uint64_t)&v55),
                (swift_dynamicCast(&v53, &v55, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) == 0))
          {
            uint64_t v53 = 0LL;
            uint64_t v54 = 0LL;
          }

          swift_bridgeObjectRelease(v31);
          uint64_t v35 = v54;
          if (v54)
          {
            uint64_t v36 = v53;
            if ((swift_isUniquelyReferenced_nonNull_native(v29) & 1) == 0) {
              uint64_t v29 = sub_1000089FC(0LL, *((void *)v29 + 2) + 1LL, 1, v29);
            }
            unint64_t v38 = *((void *)v29 + 2);
            unint64_t v37 = *((void *)v29 + 3);
            if (v38 >= v37 >> 1) {
              uint64_t v29 = sub_1000089FC((char *)(v37 > 1), v38 + 1, 1, v29);
            }
            *((void *)v29 + 2) = v38 + 1;
            uint64_t v30 = &v29[16 * v38];
            *((void *)v30 + 4) = v36;
            *((void *)v30 + 5) = v35;
          }

          ++v28;
        }

        while (v27 != v28);
        swift_bridgeObjectRelease(v26);
        a2 = v51;
        a3 = v52;
        a1 = v50;
      }

      else
      {
        uint64_t v29 = (char *)&_swiftEmptyArrayStorage;
      }

      swift_bridgeObjectRelease(v26);
      uint64_t v42 = (char *)swift_bridgeObjectRetain(v29);
      sub_100008914(v42);
      swift_bridgeObjectRelease(v29);
    }

    else
    {
LABEL_31:
      uint64_t v39 = static os_log_type_t.error.getter(v12);
      uint64_t v40 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
      unint64_t v41 = (void *)static OS_os_log.default.getter(v40);
      os_log(_:dso:log:type:_:)( "World clock cities not in correct format",  40LL,  2LL,  &_mh_execute_header,  v41,  v39,  &_swiftEmptyArrayStorage);
    }

    uint64_t v25 = swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v22 = static os_log_type_t.info.getter(v10);
    uint64_t v23 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    unint64_t v24 = (void *)static OS_os_log.default.getter(v23);
    os_log(_:dso:log:type:_:)( "World clock preferences missing",  31LL,  2LL,  &_mh_execute_header,  v24,  v22,  &_swiftEmptyArrayStorage);
  }

  uint64_t v43 = static os_log_type_t.debug.getter(v25);
  uint64_t v44 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v45 = swift_allocObject(v44, 72LL, 7LL);
  *(_OWORD *)(v45 + 16) = xmmword_100017CF0;
  char v46 = v57;
  *(void *)(v45 + 56) = sub_10000799C(&qword_100021550);
  *(void *)(v45 + 64) = sub_10000A8E8( (unint64_t *)&qword_100021558,  &qword_100021550,  (uint64_t)&protocol conformance descriptor for [A]);
  *(void *)(v45 + 32) = v46;
  sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v47 = swift_bridgeObjectRetain(v46);
  uint64_t v48 = (void *)static OS_os_log.default.getter(v47);
  os_log(_:dso:log:type:_:)("World clock time zones: %@", 26LL, 2LL, &_mh_execute_header, v48, v43, v45);
  swift_bridgeObjectRelease(v45);

  sub_100015C90(v46, 0LL, a1, a2, a3);
  return swift_bridgeObjectRelease(v46);
}

uint64_t sub_10000A390( uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = (unint64_t *)result;
  uint64_t v23 = 0LL;
  int64_t v6 = 0LL;
  uint64_t v7 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v25 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }

    int64_t v17 = v6 + 1;
    if (__OFADD__(v6, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v17 >= v25) {
      return sub_1000099F4(v22, a2, v23, a3);
    }
    unint64_t v18 = *(void *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      int64_t v6 = v17 + 1;
      if (v17 + 1 >= v25) {
        return sub_1000099F4(v22, a2, v23, a3);
      }
      unint64_t v18 = *(void *)(v24 + 8 * v6);
      if (!v18)
      {
        int64_t v6 = v17 + 2;
        if (v17 + 2 >= v25) {
          return sub_1000099F4(v22, a2, v23, a3);
        }
        unint64_t v18 = *(void *)(v24 + 8 * v6);
        if (!v18) {
          break;
        }
      }
    }

LABEL_20:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    uint64_t v12 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = *(void *)(*(void *)(a3 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v15);
    char v16 = a4(v13, v14, v15);
    swift_bridgeObjectRelease(v14);
    Swift::Int result = swift_bridgeObjectRelease(v15);
    if ((v16 & 1) != 0)
    {
      *(unint64_t *)((char *)v22 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v11;
      if (__OFADD__(v23++, 1LL))
      {
        __break(1u);
        return sub_1000099F4(v22, a2, v23, a3);
      }
    }
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v25) {
    return sub_1000099F4(v22, a2, v23, a3);
  }
  unint64_t v18 = *(void *)(v24 + 8 * v19);
  if (v18)
  {
    int64_t v6 = v19;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v6 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v6 >= v25) {
      return sub_1000099F4(v22, a2, v23, a3);
    }
    unint64_t v18 = *(void *)(v24 + 8 * v6);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }

uint64_t sub_10000A58C( uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
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
    uint64_t v12 = sub_10000A390((uint64_t)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0LL), v10, v6, a2);
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
    a3 = sub_10000A390((uint64_t)v13, v10, v6, a2);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  return a3;
}

void *sub_10000A6FC(void *a1)
{
  return a1;
}

void *sub_10000A724(void *a1)
{
  return a1;
}

uint64_t sub_10000A74C(uint64_t a1)
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
      sub_100008F78(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

uint64_t sub_10000A7E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000A824(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000799C(&qword_100021510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void *sub_10000A8AC(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_10000A8E8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10000A7E0(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void sub_10000A928(uint64_t a1)
{
  if (qword_100021388 != -1) {
    a1 = swift_once(&qword_100021388, sub_10000B944);
  }
  uint64_t v1 = (void *)qword_100022538;
  if (!qword_100022538)
  {
    uint64_t v7 = static os_log_type_t.fault.getter(a1);
    uint64_t v8 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    id v11 = (id)static OS_os_log.default.getter(v8);
    os_log(_:dso:log:_:_:)( v7,  &_mh_execute_header,  v11,  "Could not instantiate SBSSystemInterface",  40LL,  2LL,  &_swiftEmptyArrayStorage);
LABEL_10:

    return;
  }

  unsigned __int8 v2 = [(id)qword_100022538 respondsToSelector:"requestDeferredReboot"];
  uint64_t v3 = swift_unknownObjectRetain(v1);
  if ((v2 & 1) == 0)
  {
    uint64_t v9 = static os_log_type_t.fault.getter(v3);
    uint64_t v10 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    id v11 = (id)static OS_os_log.default.getter(v10);
    os_log(_:dso:log:_:_:)( v9,  &_mh_execute_header,  v11,  "SBSSystemInterface does not respond to requestDeferredReboot",  60LL,  2LL,  &_swiftEmptyArrayStorage);
    swift_unknownObjectRelease(v1);
    goto LABEL_10;
  }

  uint64_t v4 = static os_log_type_t.info.getter(v3);
  uint64_t v5 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v6 = (void *)static OS_os_log.default.getter(v5);
  os_log(_:dso:log:_:_:)( v4,  &_mh_execute_header,  v6,  "Requesting audio accessory deferred reboot",  42LL,  2LL,  &_swiftEmptyArrayStorage);

  swift_unknownObjectRelease(v1);
}

unint64_t sub_10000AB0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000799C(&qword_100021788);
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
    unint64_t result = sub_10000FF18(v7, v8);
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

unint64_t sub_10000AC24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000799C(&qword_100021778);
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
    sub_100011F3C(v7, (uint64_t)&v16, &qword_100021780);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_10000FF18(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    char v12 = (uint64_t *)(v4[6] + 16 * result);
    *char v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100011DE8(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_10000AD58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000799C(&qword_1000217B8);
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
    sub_100011F3C(v7, (uint64_t)&v14, &qword_1000217C0);
    uint64_t v8 = v14;
    unint64_t result = sub_10000FFAC(v14);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v4[6] + 8 * result) = v8;
    unint64_t result = (unint64_t)sub_100011DE8(&v15, (_OWORD *)(v4[7] + 32 * result));
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

id sub_10000AE84()
{
  id result = (id)MobileGestalt_get_current_device();
  qword_100022520 = (uint64_t)result;
  return result;
}

id sub_10000AEA8()
{
  id result = [v0 attributes];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( result,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

    strcpy((char *)&v8, "BundleVersion");
    HIWORD(v8) = -4864;
    AnyHashable.init<A>(_:)(v7, &v8, &type metadata for String, &protocol witness table for String);
    if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10000FF7C((uint64_t)v7), (v5 & 1) != 0))
    {
      sub_10000A824(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
    }

    else
    {
      __int128 v8 = 0u;
      __int128 v9 = 0u;
    }

    swift_bridgeObjectRelease(v3);
    sub_100011380((uint64_t)v7);
    if (*((void *)&v9 + 1))
    {
      else {
        return 0LL;
      }
    }

    else
    {
      sub_100007BC8((uint64_t)&v8, &qword_100021510);
      return 0LL;
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

id sub_10000AFEC()
{
  id v0 = [objc_allocWithZone(MADownloadOptions) init];
  [v0 setDiscretionary:0];
  id result = [v0 setAllowsCellularAccess:1];
  qword_100022528 = (uint64_t)v0;
  return result;
}

uint64_t sub_10000B04C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t v61 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  v65 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = type metadata accessor for URL(0LL);
  uint64_t v63 = *(void *)(v64 - 8);
  uint64_t v9 = __chkstk_darwin(v64);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v66 = (char *)&v58 - v12;
  type metadata accessor for FileAttributeKey(0LL);
  sub_100006008( &qword_100021468,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017C70);
  uint64_t v62 = a1;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  NSString v14 = String._bridgeToObjectiveC()();
  *(void *)&v67[0] = 0LL;
  unsigned int v15 = [v4 setAttributes:isa ofItemAtPath:v14 error:v67];

  uint64_t v16 = *(void *)&v67[0];
  if (!v15)
  {
    NSString v35 = *(id *)&v67[0];
    _convertNSErrorToError(_:)(v16);
LABEL_10:

    return swift_willThrow();
  }

  id v17 = *(id *)&v67[0];
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = [v4 enumeratorAtPath:v18];

  if (!v19)
  {
    uint64_t v36 = static os_log_type_t.fault.getter(v20);
    uint64_t v37 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v38 = swift_allocObject(v37, 72LL, 7LL);
    *(_OWORD *)(v38 + 16) = xmmword_100017CF0;
    *(void *)(v38 + 56) = &type metadata for String;
    *(void *)(v38 + 64) = sub_10000FEBC();
    *(void *)(v38 + 32) = a2;
    *(void *)(v38 + 40) = a3;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v39 = swift_bridgeObjectRetain(a3);
    uint64_t v40 = (void *)static OS_os_log.default.getter(v39);
    os_log(_:dso:log:type:_:)( "Could not create file enumerator for path %{public}@",  52LL,  2LL,  &_mh_execute_header,  v40,  v36,  v38);
    swift_bridgeObjectRelease(v38);

    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
    uint64_t v42 = v41;
    id v43 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v42);
    [v43 initWithDomain:v35 code:256 userInfo:0];
    goto LABEL_10;
  }

  uint64_t v21 = URL.init(fileURLWithPath:)(a2, a3);
  id v59 = v19;
  uint64_t v22 = NSEnumerator.makeIterator()(v21);
  NSFastEnumerationIterator.next()(&v71, v22);
  if (v72)
  {
    while (1)
    {
      sub_100011DE8(&v71, v70);
      sub_10000A824((uint64_t)v70, (uint64_t)v67);
      uint64_t v23 = swift_dynamicCast(v69, v67, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
      if (!(_DWORD)v23) {
        break;
      }
      uint64_t v24 = v69[0];
      uint64_t v25 = v69[1];
      Class v26 = Dictionary._bridgeToObjectiveC()().super.isa;
      URL.appendingPathComponent(_:)(v24, v25);
      uint64_t v27 = swift_bridgeObjectRelease(v25);
      URL.path.getter(v27);
      uint64_t v29 = v28;
      uint64_t v30 = *(void (**)(char *, uint64_t))(v63 + 8);
      v30(v11, v64);
      NSString v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v29);
      *(void *)&v67[0] = 0LL;
      LOBYTE(v29) = [v4 setAttributes:v26 ofItemAtPath:v31 error:v67];

      id v32 = *(id *)&v67[0];
      if ((v29 & 1) == 0)
      {
        uint64_t v48 = v32;
        _convertNSErrorToError(_:)(v32);

        swift_willThrow();
        sub_100011E3C(v70);
        (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v61);
        return ((uint64_t (*)(char *, uint64_t))v30)(v66, v64);
      }

      uint64_t v33 = sub_100011E3C(v70);
      NSFastEnumerationIterator.next()(&v71, v33);
      if (!v72) {
        goto LABEL_7;
      }
    }

    uint64_t v44 = static os_log_type_t.fault.getter(v23);
    uint64_t v45 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v46 = swift_allocObject(v45, 72LL, 7LL);
    *(_OWORD *)(v46 + 16) = xmmword_100017CF0;
    sub_10000A824((uint64_t)v70, (uint64_t)v69);
    uint64_t v47 = sub_10000799C(&qword_100021790);
    if (swift_dynamicCast(v67, v69, (char *)&type metadata for Any + 8, v47, 6LL))
    {
      sub_10001141C(v67, v46 + 32);
    }

    else
    {
      uint64_t v68 = 0LL;
      memset(v67, 0, sizeof(v67));
      *(void *)(v46 + 56) = &type metadata for String;
      *(void *)(v46 + 64) = sub_10000FEBC();
      *(void *)(v46 + 32) = 0x6E776F6E6B6E7528LL;
      *(void *)(v46 + 40) = 0xE900000000000029LL;
      sub_100007BC8((uint64_t)v67, &qword_100021798);
    }

    uint64_t v49 = v61;
    uint64_t v50 = v60;
    id v51 = v59;
    uint64_t v52 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v53 = (void *)static OS_os_log.default.getter(v52);
    os_log(_:dso:log:type:_:)( "FileManager.enumerator returned non-String %{public}@",  53LL,  2LL,  &_mh_execute_header,  v53,  v44,  v46);
    swift_bridgeObjectRelease(v46);

    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
    uint64_t v55 = v54;
    id v56 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v57 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v55);
    [v56 initWithDomain:v57 code:256 userInfo:0];

    swift_willThrow();
    sub_100011E3C(v70);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v65, v49);
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v64);
  }

  else
  {
LABEL_7:

    (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v61);
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v64);
  }

uint64_t MADownloadResult.debugDescription.getter(uint64_t a1)
{
  return sub_10000B800( a1,  20LL,  0xD000000000000011LL,  0x80000001000183E0LL,  (uint64_t (*)(uint64_t))&MAStringForMADownloadResult);
}

uint64_t sub_10000B790()
{
  return MADownloadResult.debugDescription.getter(*v0);
}

uint64_t MAQueryResult.debugDescription.getter(uint64_t a1)
{
  return sub_10000B800( a1,  17LL,  0x527972657551414DLL,  0xEE0028746C757365LL,  (uint64_t (*)(uint64_t))&MAStringForMAQueryResult);
}

uint64_t sub_10000B7C8()
{
  return MAQueryResult.debugDescription.getter(*v0);
}

uint64_t MAPurgeResult.debugDescription.getter(uint64_t a1)
{
  return sub_10000B800( a1,  17LL,  0x526567727550414DLL,  0xEE0028746C757365LL,  (uint64_t (*)(uint64_t))&MAStringForMAPurgeResult);
}

uint64_t sub_10000B800(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  id v8 = (id)a5(a1);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    uint64_t v12 = v11;
  }

  else
  {
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    uint64_t v12 = v13;
  }

  v14._countAndFlagsBits = v10;
  v14._object = v12;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v12);
  v15._countAndFlagsBits = 41LL;
  v15._object = (void *)0xE100000000000000LL;
  String.append(_:)(v15);
  return a3;
}

uint64_t sub_10000B8DC()
{
  return MAPurgeResult.debugDescription.getter(*v0);
}

uint64_t sub_10000B8E4()
{
  if (qword_100021370 != -1) {
    swift_once(&qword_100021370, sub_10000AE84);
  }
  uint64_t result = qword_100022520;
  if (qword_100022520)
  {
    uint64_t result = MobileGestalt_get_deviceClassNumber();
    BOOL v1 = (_DWORD)result == 7;
  }

  else
  {
    BOOL v1 = 0;
  }

  byte_100022530 = v1;
  return result;
}

id sub_10000B944()
{
  id result = sub_10000B960();
  qword_100022538 = (uint64_t)result;
  return result;
}

id sub_10000B960()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSBundle);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithPath:v1];

  if (!v2)
  {
    uint64_t v10 = static os_log_type_t.fault.getter(v3);
    uint64_t v11 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v12 = (void *)static OS_os_log.default.getter(v11);
    os_log(_:dso:log:_:_:)( v10,  &_mh_execute_header,  v12,  "Could not load SoundBoardServices",  33LL,  2LL,  &_swiftEmptyArrayStorage);
LABEL_7:

    return 0LL;
  }

  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 classNamed:v4];

  if (!v5
    || (uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v5),
        uint64_t v8 = sub_100007C04(0LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr),
        (uint64_t v6 = swift_dynamicCastMetatype(ObjCClassMetadata, v8)) == 0))
  {
    uint64_t v13 = static os_log_type_t.fault.getter(v6);
    uint64_t v14 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v12 = (void *)static OS_os_log.default.getter(v14);
    os_log(_:dso:log:_:_:)( v13,  &_mh_execute_header,  v12,  "Could not load SBSSystemInterface class",  39LL,  2LL,  &_swiftEmptyArrayStorage);

    goto LABEL_7;
  }

  id v9 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  return v9;
}

uint64_t sub_10000BB30()
{
  if (qword_100021370 != -1) {
    swift_once(&qword_100021370, sub_10000AE84);
  }
  uint64_t result = qword_100022520;
  if (qword_100022520) {
    uint64_t result = MobileGestalt_get_internalBuild();
  }
  byte_100022540 = result;
  return result;
}

void *sub_10000BB80()
{
  if (qword_100021390 != -1) {
    swift_once(&qword_100021390, sub_10000BB30);
  }
  if (byte_100022540 == 1)
  {
    id v0 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 256);
    uint64_t result = dlsym(v0, "SimulateCrash");
  }

  else
  {
    uint64_t result = 0LL;
  }

  off_100022548 = result;
  return result;
}

void sub_10000BBF4(id a1)
{
  if (qword_100021390 != -1) {
    swift_once(&qword_100021390, sub_10000BB30);
  }
  if (byte_100022540 == 1)
  {
    if (qword_100021398 != -1) {
      swift_once(&qword_100021398, sub_10000BB80);
    }
    id v2 = (void (*)(uint64_t, void, NSString))off_100022548;
    if (off_100022548)
    {
      id v3 = [a1 userInfo];
      uint64_t v4 = ((uint64_t (*)(void))static Dictionary._unconditionallyBridgeFromObjectiveC(_:))();

      if (*(void *)(v4 + 16) && (unint64_t v5 = sub_10000FF18(0x6150656C6946534ELL, 0xEA00000000006874LL), (v6 & 1) != 0))
      {
        sub_10000A824(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v67);
        swift_bridgeObjectRelease(v4);
        if (*((void *)&v68 + 1))
        {
          uint64_t v7 = sub_100007C04(0LL, &qword_1000217A0, &OBJC_CLASS___NSString_ptr);
          if ((swift_dynamicCast(&v66, &v67, (char *)&type metadata for Any + 8, v7, 6LL) & 1) != 0)
          {
            id v8 = v66;
            id v9 = [v66 stringByDeletingLastPathComponent];
            NSString v10 = v9;
            NSString v11 = v9;
            if (!v9)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
              uint64_t v13 = v12;
              NSString v11 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v13);
              static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
              uint64_t v15 = v14;
              NSString v10 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v15);
            }

            uint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
            id v17 = v9;
            id v18 = [v16 defaultManager];
            *(void *)&__int128 v67 = 0LL;
            id v19 = [v18 contentsOfDirectoryAtPath:v11 error:&v67];

            uint64_t v20 = (void *)v67;
            if (v19)
            {
              uint64_t v63 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);
              id v21 = v20;
            }

            else
            {
              id v22 = (id)v67;
              uint64_t v23 = _convertNSErrorToError(_:)(v20);

              swift_willThrow();
              swift_errorRelease(v23);
              uint64_t v63 = 0LL;
            }

            id v24 = objc_msgSend(v16, "defaultManager", v63);
            *(void *)&__int128 v67 = 0LL;
            v65 = v8;
            id v25 = [v24 attributesOfItemAtPath:v8 error:&v67];

            Class v26 = (void *)v67;
            if (v25)
            {
              type metadata accessor for FileAttributeKey(0LL);
              uint64_t v28 = v27;
              uint64_t v29 = sub_100006008( &qword_100021468,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017C70);
              uint64_t v30 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v25,  v28,  (char *)&type metadata for Any + 8,  v29);
              id v31 = v26;
            }

            else
            {
              id v32 = (id)v67;
              uint64_t v33 = _convertNSErrorToError(_:)(v26);

              swift_willThrow();
              swift_errorRelease(v33);
              uint64_t v30 = 0LL;
            }

            id v34 = [v16 defaultManager];
            *(void *)&__int128 v67 = 0LL;
            id v35 = [v34 attributesOfItemAtPath:v10 error:&v67];

            uint64_t v36 = (void *)v67;
            if (v35)
            {
              type metadata accessor for FileAttributeKey(0LL);
              uint64_t v38 = v37;
              uint64_t v39 = sub_100006008( &qword_100021468,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017C70);
              uint64_t v40 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v35,  v38,  (char *)&type metadata for Any + 8,  v39);
              id v41 = v36;
            }

            else
            {
              id v42 = (id)v67;
              uint64_t v43 = _convertNSErrorToError(_:)(v36);

              swift_willThrow();
              swift_errorRelease(v43);
              uint64_t v40 = 0LL;
            }

            uint64_t v44 = getpid();
            *(void *)&__int128 v67 = 0LL;
            *((void *)&v67 + 1) = 0xE000000000000000LL;
            _StringGuts.grow(_:)(82LL);
            id v45 = [a1 description];
            uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
            uint64_t v48 = v47;

            v49._countAndFlagsBits = v46;
            v49._object = v48;
            String.append(_:)(v49);
            swift_bridgeObjectRelease(v48);
            v50._countAndFlagsBits = 0xD00000000000001BLL;
            v50._object = (void *)0x8000000100018B60LL;
            String.append(_:)(v50);
            id v66 = v30;
            uint64_t v51 = sub_10000799C(&qword_1000217A8);
            v52._countAndFlagsBits = String.init<A>(describing:)(&v66, v51);
            object = v52._object;
            String.append(_:)(v52);
            swift_bridgeObjectRelease(object);
            v54._countAndFlagsBits = 0xD00000000000001ALL;
            v54._object = (void *)0x8000000100018B80LL;
            String.append(_:)(v54);
            id v66 = v40;
            v55._countAndFlagsBits = String.init<A>(describing:)(&v66, v51);
            id v56 = v55._object;
            String.append(_:)(v55);
            swift_bridgeObjectRelease(v56);
            v57._object = (void *)0x8000000100018BA0LL;
            v57._countAndFlagsBits = 0xD000000000000015LL;
            String.append(_:)(v57);
            id v66 = v64;
            uint64_t v58 = sub_10000799C(&qword_1000217B0);
            v59._countAndFlagsBits = String.init<A>(describing:)(&v66, v58);
            uint64_t v60 = v59._object;
            String.append(_:)(v59);
            swift_bridgeObjectRelease(v60);
            uint64_t v61 = *((void *)&v67 + 1);
            NSString v62 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v61);
            v2(v44, 0LL, v62);
          }

          return;
        }
      }

      else
      {
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        swift_bridgeObjectRelease(v4);
      }

      sub_100007BC8((uint64_t)&v67, &qword_100021510);
    }
  }

uint64_t sub_10000C1D0()
{
  return 1LL;
}

Swift::Int sub_10000C1D8()
{
  return Hasher._finalize()();
}

void sub_10000C218()
{
}

Swift::Int sub_10000C23C(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10000C298()
{
  id v0 = (char *)String.utf8CString.getter();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v0 = sub_10001067C((uint64_t)v0);
  }
  if (!mkdtemp(v0 + 32))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSPOSIXErrorDomain);
    uint64_t v19 = v18;
    uint64_t v20 = (int)errno.getter();
    id v21 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    [v21 initWithDomain:v22 code:v20 userInfo:0];

LABEL_9:
    swift_willThrow();
    return swift_release(v0);
  }

  uint64_t v1 = String.init(validatingUTF8:)();
  if (!v2)
  {
    unint64_t v23 = sub_100011E5C();
    swift_allocError(&type metadata for TemporaryDirectoryError, v23, 0LL, 0LL);
    goto LABEL_9;
  }

  uint64_t v3 = v1;
  uint64_t v4 = v2;
  swift_release(v0);
  id v5 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v6 = sub_10000799C(&qword_100021750);
  uint64_t inited = swift_initStackObject(v6, v34);
  *(_OWORD *)(inited + 16) = xmmword_100017CF0;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0LL);
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 40) = NSFileProtectionNone;
  id v9 = NSFileProtectionKey;
  NSString v10 = NSFileProtectionNone;
  unint64_t v11 = sub_10000AD58(inited);
  type metadata accessor for FileAttributeKey(0LL);
  sub_100006008( &qword_100021468,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017C70);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  NSString v13 = String._bridgeToObjectiveC()();
  id v33 = 0LL;
  unsigned __int8 v14 = [v5 setAttributes:isa ofItemAtPath:v13 error:&v33];

  id v15 = v33;
  if ((v14 & 1) != 0)
  {
    id v16 = v33;
    URL.init(fileURLWithPath:)(v3, v4);
    return swift_bridgeObjectRelease(v4);
  }

  else
  {
    id v24 = v33;
    swift_bridgeObjectRelease(v4);
    uint64_t v25 = _convertNSErrorToError(_:)(v15);

    uint64_t v26 = swift_willThrow();
    uint64_t v27 = static os_log_type_t.fault.getter(v26);
    uint64_t v28 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v29 = swift_allocObject(v28, 72LL, 7LL);
    *(_OWORD *)(v29 + 16) = xmmword_100017CF0;
    uint64_t v30 = _convertErrorToNSError(_:)(v25);
    *(void *)(v29 + 56) = sub_100007C04(0LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
    *(void *)(v29 + 64) = sub_100007B44( (unint64_t *)&qword_100021768,  &qword_100021760,  &OBJC_CLASS___NSObject_ptr);
    *(void *)(v29 + 32) = v30;
    uint64_t v31 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    id v32 = (void *)static OS_os_log.default.getter(v31);
    os_log(_:dso:log:type:_:)( "Could not set protection class on temporary directory: %{public}@",  65LL,  2LL,  &_mh_execute_header,  v32,  v27,  v29);
    swift_bridgeObjectRelease(v29);

    return swift_willThrow();
  }

id sub_10000C634()
{
  if (*(_BYTE *)(v0 + 48) != 1) {
    return *(id *)(v0 + 40);
  }
  id result = [*(id *)(v0 + 16) state];
  *(void *)(v0 + 40) = result;
  *(_BYTE *)(v0 + 48) = 0;
  return result;
}

uint64_t sub_10000C674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000799C(&qword_1000214E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = sub_10000799C(&qword_100021748);
  uint64_t v8 = __chkstk_darwin(v7);
  NSString v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v19[-v11];
  uint64_t v13 = v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL;
  swift_beginAccess(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, v20, 0LL, 0LL);
  sub_100011F3C(v13, (uint64_t)v12, &qword_100021748);
  sub_100007BC8((uint64_t)v12, &qword_100021748);
  id v14 = [*(id *)(v1 + 16) getLocalFileUrl];
  if (v14)
  {
    id v15 = v14;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v16 = type metadata accessor for URL(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v6, 0LL, 1LL, v16);
  }

  else
  {
    uint64_t v18 = type metadata accessor for URL(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v6, 1LL, 1LL, v18);
  }

  sub_100007B84((uint64_t)v6, a1, &qword_1000214E8);
  sub_100011F3C(a1, (uint64_t)v10, &qword_1000214E8);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(v4 + 56))(v10, 0LL, 1LL, v3);
  swift_beginAccess(v13, v19, 33LL, 0LL);
  sub_100011F80((uint64_t)v10, v13);
  return swift_endAccess(v19);
}

uint64_t sub_10000C894@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48);
  uint64_t v34 = v5;
  uint64_t v35 = v4;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  __int16 v16 = *(_WORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 56);
  if (v5 == 1)
  {
    uint64_t v32 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24);
    uint64_t v33 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
    uint64_t v17 = v1;
    uint64_t v30 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40);
    uint64_t v31 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16);
    uint64_t v29 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32);
    uint64_t v18 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48);
    sub_10000CA0C(v17, (uint64_t)&v36);
    uint64_t v19 = v37;
    uint64_t v20 = v38;
    uint64_t v12 = v39;
    uint64_t v13 = v40;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    __int16 v16 = v43;
    uint64_t v28 = *(void *)v3;
    uint64_t v27 = *(void *)(v3 + 8);
    uint64_t v26 = *(void *)(v3 + 16);
    uint64_t v25 = *(void *)(v3 + 24);
    uint64_t v24 = *(void *)(v3 + 32);
    uint64_t v23 = *(void *)(v3 + 40);
    uint64_t v22 = *(void *)(v3 + 48);
    uint64_t v34 = v37;
    uint64_t v35 = v36;
    *(void *)uint64_t v3 = v36;
    *(void *)(v3 + 8) = v19;
    uint64_t v11 = v20;
    *(void *)(v3 + 16) = v20;
    *(void *)(v3 + 24) = v12;
    *(void *)(v3 + 32) = v13;
    *(void *)(v3 + 40) = v14;
    *(void *)(v3 + 48) = v15;
    *(_WORD *)(v3 + 56) = v16;
    sub_100011EA0( (uint64_t)&v36,  (void (*)(void, void, void, void, void, void, void, void))sub_100011EDC);
    sub_100011370(v28, v27, v26, v25, v24, v23, v22);
    uint64_t v10 = v18;
    uint64_t v8 = v29;
    uint64_t v9 = v30;
    uint64_t v6 = v31;
    uint64_t v7 = v32;
    uint64_t v4 = v33;
  }

  uint64_t result = sub_100011F2C(v4, v5, v6, v7, v8, v9, v10);
  *(void *)a1 = v35;
  *(void *)(a1 + 8) = v34;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v12;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = v15;
  *(_WORD *)(a1 + 56) = v16;
  return result;
}

void sub_10000CA0C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000799C(&qword_1000214E8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v54 - v8;
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (sub_10000C634() != (id)2) {
    goto LABEL_4;
  }
  sub_10000C674((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0LL, 1LL, v10);
    sub_100006828((uint64_t)v7, (uint64_t)v61);
    uint64_t v60 = v61[0];
    Swift::String v57 = (char *)v61[1];
    uint64_t v59 = v61[2];
    uint64_t v58 = v61[3];
    uint64_t v26 = v13;
    uint64_t v22 = v61[4];
    uint64_t v23 = v61[5];
    uint64_t v24 = v61[6];
    __int16 v25 = v62;
    uint64_t v27 = sub_100007B84((uint64_t)v61, (uint64_t)&v63, &qword_1000214E0);
    uint64_t v19 = (char *)*((void *)&v63 + 1);
    if (*((void *)&v63 + 1))
    {
      Swift::String v57 = v26;
      __int128 v66 = v63;
      __int128 v67 = v64;
      v68[0] = *(_OWORD *)v65;
      *(_OWORD *)((char *)v68 + 10) = *(_OWORD *)&v65[10];
      uint64_t v60 = v63;
      uint64_t v59 = v64;
      uint64_t v22 = *(void *)v65;
      uint64_t v58 = *((void *)&v64 + 1);
      uint64_t v23 = *(void *)&v65[8];
      uint64_t v24 = *(void *)&v65[16];
      unsigned int v56 = v65[24];
      int v55 = v65[25];
      uint64_t v28 = sub_100006604();
      uint64_t v30 = v29;
      uint64_t v32 = *(void *)(a1 + 24);
      uint64_t v31 = *(void *)(a1 + 32);
      if (v28 == v32 && v29 == v31)
      {
        swift_bridgeObjectRelease(v29);
      }

      else
      {
        uint64_t v40 = *(void *)(a1 + 24);
        uint64_t v54 = *(void *)(a1 + 32);
        char v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v40, v31, 0LL);
        uint64_t v42 = swift_bridgeObjectRelease(v30);
        if ((v41 & 1) == 0)
        {
          uint64_t v44 = static os_log_type_t.error.getter(v42);
          uint64_t v45 = sub_10000799C((uint64_t *)&unk_1000219D0);
          uint64_t v46 = swift_allocObject(v45, 112LL, 7LL);
          *(_OWORD *)(v46 + 16) = xmmword_100017CD0;
          *(void *)(v46 + 56) = &type metadata for String;
          unint64_t v47 = sub_10000FEBC();
          *(void *)(v46 + 64) = v47;
          uint64_t v48 = v54;
          *(void *)(v46 + 32) = v32;
          *(void *)(v46 + 40) = v48;
          swift_bridgeObjectRetain(v48);
          uint64_t v49 = sub_100006604();
          uint64_t v51 = v50;
          sub_100011EA0( (uint64_t)v61,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
          *(void *)(v46 + 96) = &type metadata for String;
          *(void *)(v46 + 104) = v47;
          *(void *)(v46 + 72) = v49;
          *(void *)(v46 + 80) = v51;
          uint64_t v52 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
          uint64_t v53 = (void *)static OS_os_log.default.getter(v52);
          os_log(_:dso:log:type:_:)( "Asset attribute version %{public}@ does not match info version %{public}@",  73LL,  2LL,  &_mh_execute_header,  v53,  v44,  v46);
          swift_bridgeObjectRelease(v46);

          (*(void (**)(char *, uint64_t))(v11 + 8))(v57, v10);
          goto LABEL_4;
        }
      }

      (*(void (**)(char *, uint64_t))(v11 + 8))(v57, v10);
      if (v55) {
        __int16 v43 = 256;
      }
      else {
        __int16 v43 = 0;
      }
      __int16 v25 = v43 | v56;
      uint64_t v18 = v60;
    }

    else
    {
      unsigned int v56 = static os_log_type_t.error.getter(v27);
      uint64_t v33 = sub_10000799C((uint64_t *)&unk_1000219D0);
      uint64_t v34 = swift_allocObject(v33, 72LL, 7LL);
      *(_OWORD *)(v34 + 16) = xmmword_100017CF0;
      uint64_t v35 = v26;
      URL._bridgeToObjectiveC()((NSURL *)&loc_100017000);
      uint64_t v37 = v36;
      *(void *)(v34 + 56) = sub_100007C04(0LL, &qword_1000214F0, &OBJC_CLASS___NSURL_ptr);
      *(void *)(v34 + 64) = sub_100007B44(&qword_1000214F8, &qword_1000214F0, &OBJC_CLASS___NSURL_ptr);
      *(void *)(v34 + 32) = v37;
      uint64_t v38 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
      uint64_t v39 = (void *)static OS_os_log.default.getter(v38);
      os_log(_:dso:log:type:_:)( "Cannot fetch info from installed asset at %{public}@",  52LL,  2LL,  &_mh_execute_header,  v39,  v56,  v34);
      swift_bridgeObjectRelease(v34);

      uint64_t v18 = v60;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v35, v10);
      uint64_t v19 = v57;
    }

    uint64_t v20 = v59;
    uint64_t v21 = v58;
    goto LABEL_16;
  }

  uint64_t v14 = sub_100007BC8((uint64_t)v9, &qword_1000214E8);
  uint64_t v15 = static os_log_type_t.error.getter(v14);
  uint64_t v16 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v17 = (void *)static OS_os_log.default.getter(v16);
  os_log(_:dso:log:type:_:)( "Nil localURL for installed asset",  32LL,  2LL,  &_mh_execute_header,  v17,  v15,  &_swiftEmptyArrayStorage);

LABEL_4:
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  __int16 v25 = 0;
LABEL_16:
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = v19;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v21;
  *(void *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v23;
  *(void *)(a2 + 48) = v24;
  *(_WORD *)(a2 + 56) = v25;
}

uint64_t sub_10000CF64(void *a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + 40) = 0LL;
  *(_BYTE *)(v2 + 48) = 1;
  uint64_t v4 = v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL;
  uint64_t v5 = sub_10000799C(&qword_1000214E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v4, 1LL, 1LL, v5);
  uint64_t v6 = (_OWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
  *uint64_t v6 = xmmword_100017D10;
  v6[1] = 0u;
  v6[2] = 0u;
  *(_OWORD *)((char *)v6 + 42) = 0u;
  *(void *)(v2 + 16) = a1;
  id v7 = a1;
  id v8 = sub_10000AEA8();
  uint64_t v10 = v9;

  if (v10)
  {
    *(void *)(v2 + 24) = v8;
    *(void *)(v2 + 32) = v10;
  }

  else
  {

    sub_100007BC8(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, &qword_100021748);
    sub_100011370( *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info),  *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8),  *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16),  *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24),  *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32),  *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40),  *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48));
    uint64_t v11 = type metadata accessor for TZSAsset(0LL);
    swift_deallocPartialClassInstance( v2,  v11,  *(unsigned int *)(*(void *)v2 + 48LL),  *(unsigned __int16 *)(*(void *)v2 + 52LL));
    return 0LL;
  }

  return v2;
}

void **sub_10000D088(void **a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v97 = a3;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_10000799C((uint64_t *)&unk_1000219F0);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v98 = v12;
  uint64_t v99 = v8;
  if (a1)
  {
    uint64_t v19 = static os_log_type_t.error.getter(v16);
    uint64_t v20 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v21 = v14;
    uint64_t v22 = swift_allocObject(v20, 72LL, 7LL);
    *(_OWORD *)(v22 + 16) = xmmword_100017CF0;
    unint64_t aBlock = (unint64_t)a1;
    type metadata accessor for MAQueryResult(0LL);
    uint64_t v24 = String.init<A>(describing:)(&aBlock, v23);
    uint64_t v25 = v7;
    uint64_t v27 = v26;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = sub_10000FEBC();
    *(void *)(v22 + 32) = v24;
    *(void *)(v22 + 40) = v27;
    uint64_t v28 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v29 = (void *)static OS_os_log.default.getter(v28);
    os_log(_:dso:log:type:_:)( "MobileAsset query failed, error %{public}@",  42LL,  2LL,  &_mh_execute_header,  v29,  v19,  v22);
    swift_bridgeObjectRelease(v22);

    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v30 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v31 = (void *)swift_allocObject(&unk_10001CD78, 48LL, 7LL);
    v31[2] = v97;
    v31[3] = a4;
    v31[4] = 0LL;
    v31[5] = a1;
    v108 = sub_1000112F8;
    v109 = v31;
    unint64_t aBlock = (unint64_t)_NSConcreteStackBlock;
    uint64_t v105 = 1107296256LL;
    v106 = sub_100012F28;
    v107 = &unk_10001CD90;
    uint64_t v32 = _Block_copy(&aBlock);
    uint64_t v33 = v109;
    swift_retain(a4);
    uint64_t v34 = swift_release(v33);
    static DispatchQoS.unspecified.getter(v34);
    unint64_t aBlock = (unint64_t)&_swiftEmptyArrayStorage;
    uint64_t v35 = sub_100006008( (unint64_t *)&qword_100021700,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v36 = sub_10000799C((uint64_t *)&unk_1000219C0);
    uint64_t v37 = sub_10000A8E8( (unint64_t *)&qword_100021708,  (uint64_t *)&unk_1000219C0,  (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v36, v37, v25, v35);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v21, v10, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v99 + 8))(v10, v25);
    return (void **)(*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v21, v11);
  }

  v101 = (void *)a4;
  v93 = v14;
  v94 = v10;
  id v39 = [a2 results];
  uint64_t v95 = v11;
  if (v39)
  {
    uint64_t v102 = sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
    uint64_t v40 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v39, v102);

    uint64_t v42 = static os_log_type_t.info.getter(v41);
    unint64_t v100 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v43 = swift_allocObject(v100, 72LL, 7LL);
    __int128 v96 = xmmword_100017CF0;
    *(_OWORD *)(v43 + 16) = xmmword_100017CF0;
    *(void *)(v43 + 56) = sub_10000799C(&qword_100021730);
    *(void *)(v43 + 64) = sub_10000A8E8( &qword_100021738,  &qword_100021730,  (uint64_t)&protocol conformance descriptor for [A]);
    *(void *)(v43 + 32) = v40;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v44 = swift_bridgeObjectRetain(v40);
    uint64_t v45 = (void *)static OS_os_log.default.getter(v44);
    os_log(_:dso:log:type:_:)("Query returned results %{public}@", 33LL, 2LL, &_mh_execute_header, v45, v42, v43);
    swift_bridgeObjectRelease(v43);

    unint64_t aBlock = (unint64_t)&_swiftEmptyArrayStorage;
    uint64_t v46 = v101;
    if ((unint64_t)v40 >> 62)
    {
      if (v40 < 0) {
        uint64_t v63 = v40;
      }
      else {
        uint64_t v63 = v40 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v40);
      uint64_t v47 = _CocoaArrayWrapper.endIndex.getter(v63);
      swift_bridgeObjectRelease(v40);
      uint64_t v92 = v7;
      if (v47)
      {
LABEL_6:
        if (v47 < 1)
        {
          __break(1u);
          goto LABEL_52;
        }

        for (uint64_t i = 0LL; i != v47; ++i)
        {
          if ((v40 & 0xC000000000000001LL) != 0) {
            id v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v40);
          }
          else {
            id v54 = *(id *)(v40 + 8 * i + 32);
          }
          int v55 = v54;
          sub_10000AEA8();
          uint64_t v57 = v56;
          uint64_t v58 = swift_bridgeObjectRelease(v56);
          if (v57)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v58);
            uint64_t v59 = *(void **)(aBlock + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v59);
            uint64_t v60 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v59, v55);
            specialized ContiguousArray._endMutation()(v60);
          }

          else
          {
            uint64_t v49 = static os_log_type_t.error.getter(v58);
            uint64_t v50 = swift_allocObject(v100, 72LL, 7LL);
            *(_OWORD *)(v50 + 16) = v96;
            *(void *)(v50 + 56) = v102;
            *(void *)(v50 + 64) = sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
            *(void *)(v50 + 32) = v55;
            id v51 = v55;
            uint64_t v52 = (void *)static OS_os_log.default.getter(v51);
            os_log(_:dso:log:type:_:)( "Malformed asset; could not read tz version: %{public}@",
              54LL,
              2LL,
              &_mh_execute_header,
              v52,
              v49,
              v50);

            uint64_t v53 = v50;
            uint64_t v46 = v101;
            swift_bridgeObjectRelease(v53);
          }
        }

        swift_bridgeObjectRelease(v40);
        a4 = aBlock;
        if ((aBlock & 0x8000000000000000LL) != 0)
        {
LABEL_46:
          while (1)
          {
            uint64_t v81 = swift_retain(a4);
            uint64_t result = (void **)_CocoaArrayWrapper.endIndex.getter(v81);
            uint64_t v102 = (uint64_t)result;
            if (!result) {
              goto LABEL_47;
            }
LABEL_25:
            unint64_t v100 = a4 & 0xC000000000000001LL;
            if ((a4 & 0xC000000000000001LL) != 0)
            {
LABEL_52:
              id v65 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a4);
            }

            else
            {
              if (!*(void *)(a4 + 16))
              {
                __break(1u);
LABEL_54:
                __break(1u);
LABEL_55:
                __break(1u);
                return result;
              }

              id v65 = *(id *)(a4 + 32);
            }

            uint64_t v46 = v65;
            if (v102 == 1)
            {
LABEL_43:
              swift_release_n(a4, 2LL);
              uint64_t v80 = type metadata accessor for TZSAsset(0LL);
              swift_allocObject(v80, *(unsigned int *)(v80 + 48), *(unsigned __int16 *)(v80 + 52));
              id v39 = (id)sub_10000CF64(v46);
              uint64_t v62 = v92;
              uint64_t v46 = v101;
              goto LABEL_48;
            }

            uint64_t v66 = 5LL;
            while (1)
            {
              unint64_t v67 = v66 - 4;
              if (v100)
              {
                id v68 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v66 - 4, a4);
              }

              else
              {
                if (v67 >= *(void *)(a4 + 16)) {
                  goto LABEL_45;
                }
                id v68 = *(id *)(a4 + 8 * v66);
              }

              id v69 = v68;
              uint64_t v70 = v66 - 3;
              if (__OFADD__(v67, 1LL)) {
                break;
              }
              uint64_t result = (void **)sub_10000AEA8();
              if (!v71) {
                goto LABEL_54;
              }
              uint64_t v72 = result;
              uint64_t v73 = v71;
              uint64_t result = (void **)sub_10000AEA8();
              if (!v74) {
                goto LABEL_55;
              }
              uint64_t v75 = v74;
              unint64_t aBlock = (unint64_t)v72;
              uint64_t v105 = v73;
              v103[0] = result;
              v103[1] = v74;
              uint64_t v76 = type metadata accessor for Locale(0LL);
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56LL))( v18,  1LL,  1LL,  v76);
              unint64_t v77 = sub_1000079DC();
              uint64_t v78 = StringProtocol.compare<A>(_:options:range:locale:)( v103,  64LL,  0LL,  0LL,  1LL,  v18,  &type metadata for String,  &type metadata for String,  v77,  v77);
              sub_100007BC8((uint64_t)v18, (uint64_t *)&unk_1000219F0);
              swift_bridgeObjectRelease(v73);
              swift_bridgeObjectRelease(v75);
              if (v78 == -1) {
                v79 = v46;
              }
              else {
                v79 = v69;
              }
              if (v78 == -1) {
                uint64_t v46 = v69;
              }

              ++v66;
              if (v70 == v102) {
                goto LABEL_43;
              }
            }

            __break(1u);
LABEL_45:
            __break(1u);
          }
        }

uint64_t sub_10000D9F8(void (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = sub_100011274();
  uint64_t v8 = swift_allocError(&type metadata for TZError, v7, 0LL, 0LL);
  *(void *)uint64_t v9 = a4;
  *(_BYTE *)(v9 + 8) = 1;
  a1(a3, v8);
  return swift_errorRelease(v8);
}

void sub_10000DA74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    uint64_t v11 = static os_log_type_t.error.getter(v8);
    uint64_t v12 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v13 = swift_allocObject(v12, 72LL, 7LL);
    *(_OWORD *)(v13 + 16) = xmmword_100017CF0;
    aBlock[0] = a1;
    type metadata accessor for MADownloadResult(0LL);
    uint64_t v15 = String.init<A>(describing:)(aBlock, v14);
    uint64_t v17 = v16;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_10000FEBC();
    *(void *)(v13 + 32) = v15;
    *(void *)(v13 + 40) = v17;
    uint64_t v18 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v19 = (void *)static OS_os_log.default.getter(v18);
    os_log(_:dso:log:type:_:)("Catalog download failed: %{public}@", 35LL, 2LL, &_mh_execute_header, v19, v11, v13);
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    uint64_t v20 = static os_log_type_t.info.getter(v8);
    uint64_t v30 = v3;
    uint64_t v21 = v20;
    uint64_t v22 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v23 = (void *)static OS_os_log.default.getter(v22);
    os_log(_:dso:log:type:_:)( "Catalog download successful",  27LL,  2LL,  &_mh_execute_header,  v23,  v21,  &_swiftEmptyArrayStorage);

    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v24 = (void *)static OS_dispatch_queue.main.getter();
    aBlock[4] = sub_10000DD7C;
    aBlock[5] = 0LL;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100012F28;
    aBlock[3] = &unk_10001CCC8;
    uint64_t v25 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter(v25);
    aBlock[0] = &_swiftEmptyArrayStorage;
    uint64_t v26 = sub_100006008( (unint64_t *)&qword_100021700,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v27 = sub_10000799C((uint64_t *)&unk_1000219C0);
    uint64_t v28 = sub_10000A8E8( (unint64_t *)&qword_100021708,  (uint64_t *)&unk_1000219C0,  (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v2, v26);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v10, v5, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

uint64_t sub_10000DD7C()
{
  return sub_10000FCD4((uint64_t (*)(void))sub_100015144);
}

uint64_t sub_10000DD88(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = sub_10000799C((uint64_t *)&unk_1000219F0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2)
  {
    swift_errorRetain(a2);
    a3(0LL, 0LL, a2);
    return swift_errorRelease(a2);
  }

  if (a1)
  {
    swift_retain(a1);
    sub_1000077E8(v42);
    uint64_t v11 = sub_100006604();
    uint64_t v13 = v12;
    sub_100007AA8(v42);
    uint64_t v15 = a1[3];
    uint64_t v14 = a1[4];
    v41[2] = v11;
    v41[3] = v13;
    v41[0] = v15;
    v41[1] = v14;
    uint64_t v16 = type metadata accessor for Locale(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v9, 1LL, 1LL, v16);
    unint64_t v17 = sub_1000079DC();
    swift_bridgeObjectRetain(v14);
    uint64_t v18 = StringProtocol.compare<A>(_:options:range:locale:)( v41,  64LL,  0LL,  0LL,  1LL,  v9,  &type metadata for String,  &type metadata for String,  v17,  v17);
    sub_100007BC8((uint64_t)v9, (uint64_t *)&unk_1000219F0);
    uint64_t v19 = swift_bridgeObjectRelease(v13);
    if (v18 == -1)
    {
      uint64_t v26 = (char *)sub_10000C634();
      if ((unint64_t)(v26 - 2) < 2)
      {
        sub_10000E354();
        goto LABEL_7;
      }

      if (v26 == (char *)1)
      {
        sub_10000F43C();
        goto LABEL_7;
      }

      if (v26 != (char *)4)
      {
        uint64_t v31 = static os_log_type_t.error.getter(v26);
        uint64_t v32 = sub_10000799C((uint64_t *)&unk_1000219D0);
        uint64_t v33 = swift_allocObject(v32, 72LL, 7LL);
        *(_OWORD *)(v33 + 16) = xmmword_100017CF0;
        uint64_t v34 = (void *)a1[2];
        *(void *)(v33 + 56) = sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
        *(void *)(v33 + 64) = sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
        *(void *)(v33 + 32) = v34;
        sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
        uint64_t v35 = (void *)static OS_os_log.default.getter(v34);
        os_log(_:dso:log:type:_:)( "Unexpected state for asset %{public}@",  37LL,  2LL,  &_mh_execute_header,  v35,  v31,  v33);
        swift_bridgeObjectRelease(v33);

        uint64_t v36 = a1[5];
        unint64_t v37 = sub_100011274();
        uint64_t v38 = swift_allocError(&type metadata for TZError, v37, 0LL, 0LL);
        *(void *)uint64_t v39 = v36;
        *(_BYTE *)(v39 + 8) = 0;
        swift_bridgeObjectRetain(v14);
        a3(v15, v14, v38);
        swift_errorRelease(v38);
        swift_bridgeObjectRelease(v14);
        goto LABEL_7;
      }

      uint64_t v27 = static os_log_type_t.info.getter(4LL);
      uint64_t v28 = sub_10000799C((uint64_t *)&unk_1000219D0);
      uint64_t v29 = swift_allocObject(v28, 72LL, 7LL);
      *(_OWORD *)(v29 + 16) = xmmword_100017CF0;
      uint64_t v30 = (void *)a1[2];
      *(void *)(v29 + 56) = sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
      *(void *)(v29 + 64) = sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
      *(void *)(v29 + 32) = v30;
      sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
      uint64_t v22 = (void *)static OS_os_log.default.getter(v30);
      os_log(_:dso:log:type:_:)("Asset download in progress: %{public}@", 38LL, 2LL, &_mh_execute_header, v22, v27, v29);
      swift_bridgeObjectRelease(v29);
    }

    else
    {
      uint64_t v20 = static os_log_type_t.info.getter(v19);
      uint64_t v21 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
      uint64_t v22 = (void *)static OS_os_log.default.getter(v21);
      os_log(_:dso:log:type:_:)( "No newer assets found",  21LL,  2LL,  &_mh_execute_header,  v22,  v20,  &_swiftEmptyArrayStorage);
    }

LABEL_7:
    a3(v15, v14, 0LL);
    swift_release(a1);
    return swift_bridgeObjectRelease(v14);
  }

  uint64_t v23 = static os_log_type_t.info.getter(v7);
  uint64_t v24 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v25 = (void *)static OS_os_log.default.getter(v24);
  os_log(_:dso:log:type:_:)("No assets found", 15LL, 2LL, &_mh_execute_header, v25, v23, &_swiftEmptyArrayStorage);

  return ((uint64_t (*)(void, void, void))a3)(0LL, 0LL, 0LL);
}

uint64_t sub_10000E290(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t sub_10000E354()
{
  uint64_t v2 = sub_10000799C(&qword_1000214E8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v166 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v180 = (char *)&v166 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  v181 = (char *)&v166 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v182 = (char *)&v166 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v166 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v166 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v166 - v19;
  sub_10000C894((uint64_t)v192);
  sub_100007B84((uint64_t)v192, (uint64_t)v194, &qword_1000214E0);
  if (!*((void *)&v194[0] + 1)) {
    goto LABEL_4;
  }
  __int128 v196 = v194[0];
  __int128 v197 = v194[1];
  v198[0] = v195[0];
  *(_OWORD *)((char *)v198 + 10) = *(_OWORD *)((char *)v195 + 10);
  uint64_t v179 = v0;
  sub_10000C674((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
    sub_100007BC8((uint64_t)v4, &qword_1000214E8);
LABEL_4:
    unint64_t v21 = sub_100011274();
    uint64_t v22 = swift_allocError(&type metadata for TZError, v21, 0LL, 0LL);
    *(void *)uint64_t v23 = 1LL;
    *(_BYTE *)(v23 + 8) = 3;
    return swift_willThrow(v22);
  }

  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v20, v4, v5);
  sub_1000077E8(v193);
  uint64_t v173 = sub_100006604();
  uint64_t v178 = v25;
  sub_100007AA8(v193);
  id v26 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v27 = [v26 temporaryDirectory];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  URL.appendingPathComponent(_:)(0xD000000000000017LL, 0x8000000100018800LL);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v29 = v28(v15, v5);
  URL.path.getter(v29);
  uint64_t v31 = v30;
  sub_10000C298();
  if (v1)
  {
    sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);

    swift_bridgeObjectRelease(v178);
    swift_bridgeObjectRelease(v31);
    v28(v18, v5);
    return v28(v20, v5);
  }

  uint64_t v176 = v5;
  id v177 = v26;
  v174 = v20;
  v175 = v28;
  v172 = v18;
  swift_bridgeObjectRelease(v31);
  uint64_t v32 = sub_10000799C(&qword_100021750);
  uint64_t inited = swift_initStackObject(v32, &v191);
  __int128 v170 = xmmword_100017CC0;
  *(_OWORD *)(inited + 16) = xmmword_100017CC0;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0LL);
  *(void *)(inited + 40) = NSFileProtectionNone;
  *(void *)(inited + 64) = v34;
  *(void *)(inited + 72) = NSFileOwnerAccountID;
  *(void *)(inited + 80) = 0LL;
  *(void *)(inited + 104) = &type metadata for Int;
  *(void *)(inited + 112) = NSFileGroupOwnerAccountID;
  *(void *)(inited + 144) = &type metadata for Int;
  *(void *)(inited + 120) = 0LL;
  uint64_t v35 = NSFileProtectionKey;
  uint64_t v36 = v182;
  unint64_t v37 = NSFileProtectionNone;
  uint64_t v38 = NSFileOwnerAccountID;
  uint64_t v39 = NSFileGroupOwnerAccountID;
  unint64_t v40 = sub_10000AD58(inited);
  v186 = &type metadata for Int;
  *(void *)&__int128 v184 = 493LL;
  sub_100011DE8(&v184, v190);
  swift_bridgeObjectRetain(v40);
  uint64_t v41 = NSFilePosixPermissions;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v40);
  unint64_t v171 = v40;
  unint64_t v183 = v40;
  sub_100010690(v190, v41, isUniquelyReferenced_nonNull_native);
  unint64_t v43 = v183;

  swift_bridgeObjectRelease(0x8000000000000000LL);
  uint64_t v44 = sub_100006604();
  uint64_t v46 = v45;
  URL.appendingPathComponent(_:)(v44, v45);
  swift_bridgeObjectRelease(v46);
  if (qword_1000213E8 != -1) {
    swift_once(&qword_1000213E8, sub_100016A28);
  }
  URL.init(fileURLWithPath:)(qword_1000225D8, unk_1000225E0);
  uint64_t v47 = sub_100006604();
  uint64_t v49 = v48;
  uint64_t v50 = v180;
  URL.appendingPathComponent(_:)(v47, v48);
  swift_bridgeObjectRelease(v49);
  uint64_t v51 = v175(v15, v176);
  LOBYTE(v183) = 0;
  URL.path.getter(v51);
  uint64_t v53 = v52;
  NSString v54 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v53);
  LODWORD(v53) = [v177 fileExistsAtPath:v54 isDirectory:&v183];

  if ((_DWORD)v53)
  {
    if (v183 == 1)
    {
      swift_bridgeObjectRelease(v43);
      sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
      swift_bridgeObjectRelease(v171);
      uint64_t v56 = swift_bridgeObjectRelease(v178);
      uint64_t v57 = static os_log_type_t.info.getter(v56);
      uint64_t v58 = sub_10000799C((uint64_t *)&unk_1000219D0);
      uint64_t v59 = swift_allocObject(v58, 72LL, 7LL);
      *(_OWORD *)(v59 + 16) = xmmword_100017CF0;
      uint64_t v60 = URL.path.getter(v59);
      uint64_t v62 = v61;
      *(void *)(v59 + 56) = &type metadata for String;
      *(void *)(v59 + 64) = sub_10000FEBC();
      *(void *)(v59 + 32) = v60;
      *(void *)(v59 + 40) = v62;
      uint64_t v63 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
      uint64_t v64 = static OS_os_log.default.getter(v63);
      os_log(_:dso:log:type:_:)( "Asset installation bypassed; %{public}@ already exists",
        54LL,
        2LL,
        &_mh_execute_header,
        v64,
        v57,
        v59);

      id v65 = v181;
      swift_bridgeObjectRelease(v59);
      id v66 = (id)v64;
      unint64_t v67 = v50;
      id v68 = v172;
LABEL_12:

      id v69 = v67;
      uint64_t v70 = (void (*)(char *, uint64_t))v175;
      uint64_t v71 = v176;
      v175(v69, v176);
      v70(v65, v71);
      v70(v36, v71);
      v70(v68, v71);
      return ((uint64_t (*)(char *, uint64_t))v70)(v174, v71);
    }

    uint64_t v72 = static os_log_type_t.fault.getter(v55);
    uint64_t v73 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v74 = swift_allocObject(v73, 72LL, 7LL);
    *(_OWORD *)(v74 + 16) = xmmword_100017CF0;
    uint64_t v75 = URL.path.getter(v74);
    uint64_t v77 = v76;
    *(void *)(v74 + 56) = &type metadata for String;
    *(void *)(v74 + 64) = sub_10000FEBC();
    *(void *)(v74 + 32) = v75;
    *(void *)(v74 + 40) = v77;
    uint64_t v78 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    v79 = (void *)static OS_os_log.default.getter(v78);
    os_log(_:dso:log:type:_:)( "Asset installation failure: %{public}@ exists but is not a directory",  68LL,  2LL,  &_mh_execute_header,  v79,  v72,  v74);
    swift_bridgeObjectRelease(v74);
  }

  unint64_t v169 = v43;
  unsigned int v168 = static os_log_type_t.info.getter(v55);
  uint64_t v167 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v80 = swift_allocObject(v167, 152LL, 7LL);
  *(_OWORD *)(v80 + 16) = v170;
  uint64_t v81 = URL.path.getter(v80);
  uint64_t v83 = v82;
  *(void *)(v80 + 56) = &type metadata for String;
  unint64_t v84 = sub_10000FEBC();
  *(void *)(v80 + 64) = v84;
  *(void *)(v80 + 32) = v81;
  *(void *)(v80 + 40) = v83;
  uint64_t v85 = URL.path.getter(v84);
  *(void *)(v80 + 96) = &type metadata for String;
  *(void *)(v80 + 104) = v84;
  *(void *)(v80 + 72) = v85;
  *(void *)(v80 + 80) = v86;
  uint64_t v87 = URL.path.getter(v85);
  *(void *)(v80 + 136) = &type metadata for String;
  *(void *)(v80 + 144) = v84;
  *(void *)(v80 + 112) = v87;
  *(void *)(v80 + 120) = v88;
  *(void *)&__int128 v170 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v89 = (void *)static OS_os_log.default.getter(v170);
  os_log(_:dso:log:type:_:)( "Beginning installation of %{public}@ to %{public}@ via %{public}@",  65LL,  2LL,  &_mh_execute_header,  v89,  v168,  v80);
  swift_bridgeObjectRelease(v80);

  URL._bridgeToObjectiveC()(v90);
  uint64_t v92 = v91;
  URL._bridgeToObjectiveC()(v93);
  uint64_t v95 = v94;
  *(void *)&__int128 v184 = 0LL;
  id v96 = v177;
  LODWORD(v83) = [v177 copyItemAtURL:v92 toURL:v94 error:&v184];

  uint64_t v97 = v184;
  if (!(_DWORD)v83)
  {
    id v110 = (id)v184;
    swift_bridgeObjectRelease(v169);
    sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
    swift_bridgeObjectRelease(v171);
    swift_bridgeObjectRelease(v178);
    uint64_t v111 = _convertNSErrorToError(_:)(v97);

    swift_willThrow(v112);
    *(void *)&__int128 v184 = v111;
    swift_errorRetain(v111);
    uint64_t v113 = sub_10000799C(&qword_100021758);
    uint64_t v114 = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
    if (swift_dynamicCast(v190, &v184, v113, v114, 0LL))
    {
      swift_errorRelease(v111);
      uint64_t v111 = *(void *)&v190[0];
      sub_10000BBF4(*(id *)&v190[0]);
      swift_willThrow(v115);
    }

    uint64_t v116 = swift_errorRelease(v184);
    goto LABEL_21;
  }

  id v98 = (id)v184;
  NSString v99 = String._bridgeToObjectiveC()();
  type metadata accessor for FileAttributeKey(0LL);
  sub_100006008( &qword_100021468,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100017C70);
  unint64_t v100 = v169;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v100);
  *(void *)&__int128 v184 = 0LL;
  unsigned int v102 = [v96 createDirectoryAtPath:v99 withIntermediateDirectories:1 attributes:isa error:&v184];

  uint64_t v103 = v184;
  uint64_t v104 = v178;
  if (!v102)
  {
    id v117 = (id)v184;
    sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
    swift_bridgeObjectRelease(v171);
    swift_bridgeObjectRelease(v104);
    uint64_t v111 = _convertNSErrorToError(_:)(v103);

    uint64_t v116 = swift_willThrow(v118);
LABEL_21:
    v109 = v180;
    goto LABEL_22;
  }

  uint64_t v105 = URL.path.getter((id)v184);
  uint64_t v107 = v106;
  uint64_t v108 = v171;
  sub_10000B04C(v171, v105, v106);
  v109 = v180;
  swift_bridgeObjectRelease(v107);
  swift_bridgeObjectRelease(v108);
  URL._bridgeToObjectiveC()(v129);
  v131 = v130;
  URL._bridgeToObjectiveC()(v132);
  v134 = v133;
  *(void *)&__int128 v184 = 0LL;
  unsigned int v135 = [v96 moveItemAtURL:v131 toURL:v133 error:&v184];

  uint64_t v136 = v184;
  if (v135)
  {
    uint64_t v137 = qword_1000213C8;
    id v138 = (id)v184;
    if (v137 != -1) {
      swift_once(&qword_1000213C8, sub_1000167F4);
    }
    NSString v139 = String._bridgeToObjectiveC()();
    *(void *)&__int128 v184 = 0LL;
    unsigned int v140 = [v177 removeItemAtPath:v139 error:&v184];

    uint64_t v141 = v184;
    uint64_t v142 = v179;
    if (v140)
    {
      id v143 = (id)v184;
    }

    else
    {
      id v146 = (id)v184;
      uint64_t v147 = _convertNSErrorToError(_:)(v141);

      swift_willThrow(v148);
      swift_errorRelease(v147);
    }

    v109 = v180;
    NSString v149 = String._bridgeToObjectiveC()();
    URL.path.getter(v149);
    uint64_t v151 = v150;
    NSString v152 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v151);
    *(void *)&__int128 v184 = 0LL;
    unsigned int v153 = [v177 createSymbolicLinkAtPath:v149 withDestinationPath:v152 error:&v184];

    uint64_t v136 = v184;
    if (v153)
    {
      id v154 = (id)v184;
      sub_100006604();
      uint64_t v156 = v155;
      uint64_t v157 = sub_10000799C(&qword_100021770);
      uint64_t v158 = swift_initStackObject(v157, &v189);
      *(_OWORD *)(v158 + 16) = xmmword_100017CD0;
      *(void *)(v158 + 32) = 0x6973726556646C6FLL;
      *(void *)(v158 + 40) = 0xEA00000000006E6FLL;
      uint64_t v159 = v178;
      *(void *)(v158 + 48) = String._bridgeToObjectiveC()();
      *(void *)(v158 + 56) = 0x697372655677656ELL;
      *(void *)(v158 + 64) = 0xEA00000000006E6FLL;
      *(void *)(v158 + 72) = String._bridgeToObjectiveC()();
      unint64_t v160 = sub_10000AB0C(v158);
      sub_100012928(0x736E497465737361LL, (void *)0xEE0064656C6C6174LL);
      swift_bridgeObjectRelease(v156);
      swift_bridgeObjectRelease(v159);
      swift_bridgeObjectRelease(v160);
      v161 = *(void **)(v142 + 16);
      v187 = sub_10000F294;
      uint64_t v188 = 0LL;
      *(void *)&__int128 v184 = _NSConcreteStackBlock;
      *((void *)&v184 + 1) = 1107296256LL;
      v185 = sub_10000DA70;
      v186 = &unk_10001CEA8;
      v162 = _Block_copy(&v184);
      [v161 purge:v162];
      _Block_release(v162);
      id v68 = v172;
      if (qword_1000213A0 != -1) {
        swift_once(&qword_1000213A0, sub_100012F54);
      }
      v163 = (_OWORD *)swift_allocObject(&unk_10001CEE0, 74LL, 7LL);
      __int128 v164 = v197;
      v163[1] = v196;
      v163[2] = v164;
      v163[3] = v198[0];
      *(_OWORD *)((char *)v163 + 58) = *(_OWORD *)((char *)v198 + 10);
      sub_100014F1C(0xD000000000000026LL, 0x80000001000188A0LL, (uint64_t)sub_100011E34, (uint64_t)v163);
      swift_release(v163);
      id v65 = v181;
      uint64_t v36 = v182;
      unint64_t v67 = v180;
      id v66 = v177;
      goto LABEL_12;
    }

    id v144 = (id)v184;
    sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
    uint64_t v145 = v178;
  }

  else
  {
    id v144 = (id)v184;
    sub_100011EA0( (uint64_t)v192,  (void (*)(void, void, void, void, void, void, void, void))sub_100007A58);
    uint64_t v145 = v104;
  }

  swift_bridgeObjectRelease(v145);
  uint64_t v111 = _convertNSErrorToError(_:)(v136);

  uint64_t v116 = swift_willThrow(v165);
LABEL_22:
  uint64_t v119 = static os_log_type_t.error.getter(v116);
  uint64_t v120 = swift_allocObject(v167, 72LL, 7LL);
  *(_OWORD *)(v120 + 16) = xmmword_100017CF0;
  uint64_t v121 = _convertErrorToNSError(_:)(v111);
  *(void *)(v120 + 56) = sub_100007C04(0LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
  uint64_t v122 = sub_100007B44((unint64_t *)&qword_100021768, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
  *(void *)(v120 + 64) = v122;
  *(void *)(v120 + 32) = v121;
  v123 = (void *)static OS_os_log.default.getter(v122);
  os_log(_:dso:log:type:_:)("Asset installation failed: %{public}@", 37LL, 2LL, &_mh_execute_header, v123, v119, v120);
  swift_bridgeObjectRelease(v120);

  v124 = (void *)_convertErrorToNSError(_:)(v111);
  __int128 v199 = (unint64_t)v124;
  uint64_t v200 = 0LL;
  uint64_t v201 = 0LL;
  char v202 = 3;
  sub_100012148(&v199);

  swift_willThrow(v125);
  v126 = v109;
  v127 = (void (*)(char *, uint64_t))v175;
  uint64_t v128 = v176;
  v175(v126, v176);
  v127(v181, v128);
  v127(v182, v128);
  v127(v172, v128);
  return ((uint64_t (*)(char *, uint64_t))v127)(v174, v128);
}

void sub_10000F294(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = static os_log_type_t.error.getter(a1);
    uint64_t v3 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v4 = swift_allocObject(v3, 72LL, 7LL);
    *(_OWORD *)(v4 + 16) = xmmword_100017CF0;
    uint64_t v11 = a1;
    type metadata accessor for MAPurgeResult(0LL);
    uint64_t v6 = String.init<A>(describing:)(&v11, v5);
    uint64_t v8 = v7;
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 64) = sub_10000FEBC();
    *(void *)(v4 + 32) = v6;
    *(void *)(v4 + 40) = v8;
    uint64_t v9 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v10 = (void *)static OS_os_log.default.getter(v9);
    os_log(_:dso:log:type:_:)("Asset purge failed: %{public}@", 30LL, 2LL, &_mh_execute_header, v10, v2, v4);
    swift_bridgeObjectRelease(v4);
  }

uint64_t sub_10000F384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10000F3C0(uint64_t (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006604();
  uint64_t v8 = v7;
  sub_100007AA8(v10);
  sub_100007D88(a3, v6, v8, a1, a2);
  return swift_bridgeObjectRelease(v8);
}

void sub_10000F43C()
{
  uint64_t v1 = v0;
  id v2 = sub_10000C634();
  if (v2 == (id)1)
  {
    uint64_t v3 = *(void **)(v0 + 16);
    if (qword_100021378 != -1) {
      swift_once(&qword_100021378, sub_10000AFEC);
    }
    uint64_t v4 = qword_100022528;
    uint64_t v5 = swift_allocObject(&unk_10001CE18, 24LL, 7LL);
    swift_weakInit(v5 + 16, v1);
    v26[4] = sub_100011414;
    uint64_t v27 = v5;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 1107296256LL;
    _OWORD v26[2] = sub_10000F384;
    v26[3] = &unk_10001CE30;
    uint64_t v6 = _Block_copy(v26);
    swift_release(v27);
    [v3 startDownload:v4 then:v6];
    _Block_release(v6);
    uint64_t v8 = static os_log_type_t.info.getter(v7);
    uint64_t v9 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v10 = swift_allocObject(v9, 72LL, 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_100017CF0;
    *(void *)(v10 + 56) = sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
    *(void *)(v10 + 64) = sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
    *(void *)(v10 + 32) = v3;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v11 = (void *)static OS_os_log.default.getter(v3);
    os_log(_:dso:log:type:_:)("Download initiated for asset %{public}@", 39LL, 2LL, &_mh_execute_header, v11, v8, v10);
    uint64_t v12 = v10;
    goto LABEL_7;
  }

  if ((unint64_t)(*(void *)(v0 + 40) - 2LL) < 3)
  {
    uint64_t v13 = static os_log_type_t.info.getter(v2);
    uint64_t v14 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v15 = swift_allocObject(v14, 72LL, 7LL);
    *(_OWORD *)(v15 + 16) = xmmword_100017CF0;
    uint64_t v16 = *(void **)(v0 + 16);
    *(void *)(v15 + 56) = sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
    *(void *)(v15 + 64) = sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
    *(void *)(v15 + 32) = v16;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v11 = (void *)static OS_os_log.default.getter(v16);
    os_log(_:dso:log:type:_:)( "Asset already downloaded/downloading: %{public}@",  48LL,  2LL,  &_mh_execute_header,  v11,  v13,  v15);
    uint64_t v12 = v15;
LABEL_7:
    swift_bridgeObjectRelease(v12);

    return;
  }

  uint64_t v17 = static os_log_type_t.error.getter(v2);
  uint64_t v18 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v19 = swift_allocObject(v18, 72LL, 7LL);
  *(_OWORD *)(v19 + 16) = xmmword_100017CF0;
  uint64_t v20 = *(void **)(v0 + 16);
  *(void *)(v19 + 56) = sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
  *(void *)(v19 + 64) = sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
  *(void *)(v19 + 32) = v20;
  sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  unint64_t v21 = (void *)static OS_os_log.default.getter(v20);
  os_log(_:dso:log:type:_:)( "Attempted download; bad asset state for %{public}@",
    50LL,
    2LL,
    &_mh_execute_header,
    v21,
    v17,
    v19);
  swift_bridgeObjectRelease(v19);

  uint64_t v22 = *(void *)(v1 + 40);
  unint64_t v23 = sub_100011274();
  uint64_t v24 = swift_allocError(&type metadata for TZError, v23, 0LL, 0LL);
  *(void *)uint64_t v25 = v22;
  *(_BYTE *)(v25 + 8) = 0;
  swift_willThrow(v24);
}

uint64_t sub_10000F7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = v9;
  if (a1)
  {
    uint64_t v42 = v8;
    uint64_t v43 = v5;
    uint64_t v13 = a2 + 16;
    uint64_t v14 = static os_log_type_t.error.getter(v10);
    uint64_t v15 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v16 = swift_allocObject(v15, 112LL, 7LL);
    *(_OWORD *)(v16 + 16) = xmmword_100017CD0;
    *(void *)&__int128 aBlock = a1;
    type metadata accessor for MADownloadResult(0LL);
    uint64_t v18 = String.init<A>(describing:)(&aBlock, v17);
    uint64_t v20 = v19;
    *(void *)(v16 + 56) = &type metadata for String;
    unint64_t v21 = sub_10000FEBC();
    *(void *)(v16 + 64) = v21;
    *(void *)(v16 + 32) = v18;
    *(void *)(v16 + 40) = v20;
    swift_beginAccess(v13, v50, 0LL, 0LL);
    uint64_t Strong = swift_weakLoadStrong(v13);
    if (Strong)
    {
      uint64_t v23 = Strong;
      id v24 = *(id *)(Strong + 16);
      swift_release(v23);
      uint64_t v47 = (void *)sub_100007C04(0LL, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
      uint64_t v48 = (uint64_t (*)())sub_100007B44(&qword_100021740, &qword_100021728, &OBJC_CLASS___MAAsset_ptr);
      *(void *)&__int128 aBlock = v24;
      sub_10001141C(&aBlock, v16 + 72);
    }

    else
    {
      *(void *)(v16 + 96) = &type metadata for String;
      *(void *)(v16 + 104) = v21;
      *(void *)(v16 + 72) = 0x296C696E28LL;
      *(void *)(v16 + 80) = 0xE500000000000000LL;
    }

    uint64_t v35 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v36 = (void *)static OS_os_log.default.getter(v35);
    os_log(_:dso:log:type:_:)( "Asset download failed with status %{public}@; asset = %{public}@",
      64LL,
      2LL,
      &_mh_execute_header,
      v36,
      v14,
      v16);
    swift_bridgeObjectRelease(v16);

    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v28 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v48 = nullsub_1;
    uint64_t v49 = 0LL;
    *(void *)&__int128 aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256LL;
    uint64_t v46 = sub_100012F28;
    uint64_t v47 = &unk_10001CE58;
    uint64_t v29 = _Block_copy(&aBlock);
    uint64_t v37 = swift_release(v49);
    static DispatchQoS.unspecified.getter(v37);
    *(void *)&__int128 aBlock = &_swiftEmptyArrayStorage;
    uint64_t v38 = sub_100006008( (unint64_t *)&qword_100021700,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v39 = sub_10000799C((uint64_t *)&unk_1000219C0);
    uint64_t v40 = sub_10000A8E8( (unint64_t *)&qword_100021708,  (uint64_t *)&unk_1000219C0,  (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v39, v40, v4, v38);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v7, v29);
    uint64_t v8 = v42;
    uint64_t v5 = v43;
    uint64_t v34 = v44;
  }

  else
  {
    uint64_t v25 = static os_log_type_t.info.getter(v10);
    uint64_t v26 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v27 = (void *)static OS_os_log.default.getter(v26);
    os_log(_:dso:log:type:_:)( "Asset download successful",  25LL,  2LL,  &_mh_execute_header,  v27,  v25,  &_swiftEmptyArrayStorage);

    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v28 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v48 = sub_10000FCC8;
    uint64_t v49 = 0LL;
    *(void *)&__int128 aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256LL;
    uint64_t v46 = sub_100012F28;
    uint64_t v47 = &unk_10001CE80;
    uint64_t v29 = _Block_copy(&aBlock);
    static DispatchQoS.unspecified.getter(v29);
    *(void *)&__int128 aBlock = &_swiftEmptyArrayStorage;
    uint64_t v30 = sub_100006008( (unint64_t *)&qword_100021700,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v31 = sub_10000799C((uint64_t *)&unk_1000219C0);
    uint64_t v32 = sub_10000A8E8( (unint64_t *)&qword_100021708,  (uint64_t *)&unk_1000219C0,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v33 = v30;
    uint64_t v34 = v44;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v31, v32, v4, v33);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v7, v29);
  }

  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v12, v8);
}

uint64_t sub_10000FCC8()
{
  return sub_10000FCD4((uint64_t (*)(void))sub_1000152B4);
}

uint64_t sub_10000FCD4(uint64_t (*a1)(void))
{
  if (qword_1000213A0 != -1)
  {
    id v2 = a1;
    swift_once(&qword_1000213A0, sub_100012F54);
    a1 = v2;
  }

  return a1();
}

uint64_t sub_10000FD1C()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  sub_100007BC8(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, &qword_100021748);
  sub_100011370( *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info),  *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8),  *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16),  *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24),  *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32),  *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40),  *(void *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48));
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10000FD88()
{
  return type metadata accessor for TZSAsset(0LL);
}

uint64_t type metadata accessor for TZSAsset(uint64_t a1)
{
  uint64_t result = qword_1000215F0;
  if (!qword_1000215F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TZSAsset);
  }
  return result;
}

void sub_10000FDCC(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_100017DF0;
  v4[2] = &unk_100017E08;
  sub_10000FE64(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(v2 - 8) + 64LL;
    v4[4] = &unk_100017E20;
    swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
  }

void sub_10000FE64(uint64_t a1)
{
  if (!qword_100021600)
  {
    uint64_t v2 = sub_10000A7E0(&qword_1000214E8);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100021600);
    }
  }

unint64_t sub_10000FEBC()
{
  unint64_t result = qword_1000216F8;
  if (!qword_1000216F8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000216F8);
  }

  return result;
}

uint64_t sub_10000FF00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FF10(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10000FF18(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10001002C(a1, a2, v5);
}

unint64_t sub_10000FF7C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10001010C(a1, v4);
}

unint64_t sub_10000FFAC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_1000101D0(a1, v7);
}

unint64_t sub_10001002C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10001010C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1000113B4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100011380((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_1000101D0(uint64_t a1, uint64_t a2)
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

_OWORD *sub_100010344(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000799C(&qword_1000217B8);
  char v40 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v38 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  unint64_t result = (_OWORD *)swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_25;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }

    if (v18 >= v38) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v39 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v38) {
        goto LABEL_37;
      }
      unint64_t v20 = *(void *)(v39 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v38)
        {
LABEL_37:
          swift_release(v5);
          if ((v40 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }

        unint64_t v20 = *(void *)(v39 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1LL)) {
              goto LABEL_46;
            }
            if (v14 >= v38) {
              goto LABEL_37;
            }
            unint64_t v20 = *(void *)(v39 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_24;
            }
          }
        }

        int64_t v14 = v21;
      }
    }

char *sub_10001067C(uint64_t a1)
{
  return sub_100008D90(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

_OWORD *sub_100010690(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_10000FFAC((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }

  else
  {
    char v13 = v8;
    uint64_t v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      unint64_t v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        unint64_t v16 = (void *)(v15[7] + 32 * v9);
        sub_100011E3C(v16);
        return sub_100011DE8(a1, v16);
      }

      goto LABEL_11;
    }

    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_100010814();
      goto LABEL_7;
    }

    sub_100010344(v12, a3 & 1);
    unint64_t v18 = sub_10000FFAC((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if ((v13 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_1000107B0(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }

  type metadata accessor for FileAttributeKey(0LL);
  unint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *sub_1000107B0(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  unint64_t result = sub_100011DE8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_100010814()
{
  uint64_t v1 = v0;
  sub_10000799C(&qword_1000217B8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
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

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_10000A824(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_100011DE8(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }

  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

void sub_1000109DC(void (*a1)(void, void, uint64_t), uint64_t a2)
{
  uint64_t v4 = swift_allocObject(&unk_10001CD00, 32LL, 7LL);
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v5 = swift_retain(a2);
  uint64_t v6 = static os_log_type_t.debug.getter(v5);
  uint64_t v7 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v8 = (void *)static OS_os_log.default.getter(v7);
  os_log(_:dso:log:type:_:)( "Beginning MobileAsset local catalog query",  41LL,  2LL,  &_mh_execute_header,  v8,  v6,  &_swiftEmptyArrayStorage);

  id v9 = objc_allocWithZone(&OBJC_CLASS___MAAssetQuery);
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 initWithType:v10];

  if (v11)
  {
    if (qword_1000213F0 != -1) {
      swift_once(&qword_1000213F0, sub_100016AA8);
    }
    if (qword_1000225F0)
    {
      NSString v13 = String._bridgeToObjectiveC()();
      NSString v14 = String._bridgeToObjectiveC()();
      [v11 addKeyValuePair:v13 with:v14];

      uint64_t v15 = static os_log_type_t.info.getter([v11 returnTypes:2]);
      uint64_t v16 = sub_10000799C((uint64_t *)&unk_1000219D0);
      uint64_t v17 = swift_allocObject(v16, 72LL, 7LL);
      *(_OWORD *)(v17 + 16) = xmmword_100017CF0;
      *(void *)(v17 + 56) = sub_100007C04(0LL, &qword_100021718, &OBJC_CLASS___MAAssetQuery_ptr);
      *(void *)(v17 + 64) = sub_100007B44(&qword_100021720, &qword_100021718, &OBJC_CLASS___MAAssetQuery_ptr);
      *(void *)(v17 + 32) = v11;
      id v18 = v11;
      int64_t v19 = (void *)static OS_os_log.default.getter(v18);
      os_log(_:dso:log:type:_:)("Starting MobileAsset query %{public}@", 37LL, 2LL, &_mh_execute_header, v19, v15, v17);
      swift_bridgeObjectRelease(v17);

      unint64_t v20 = (void *)swift_allocObject(&unk_10001CD28, 40LL, 7LL);
      v20[2] = v18;
      v20[3] = sub_10001126C;
      void v20[4] = v4;
      v29[4] = sub_1000112E4;
      uint64_t v30 = v20;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 1107296256LL;
      v29[2] = sub_10000DA70;
      v29[3] = &unk_10001CD40;
      int64_t v21 = _Block_copy(v29);
      char v22 = v30;
      id v23 = v18;
      swift_retain(v4);
      swift_release(v22);
      [v23 queryMetaData:v21];
      _Block_release(v21);
      swift_release(v4);

      return;
    }
  }

  uint64_t v24 = static os_log_type_t.fault.getter(v12);
  uint64_t v25 = (void *)static OS_os_log.default.getter(v24);
  os_log(_:dso:log:type:_:)( "Unable to construct MobileAsset query",  37LL,  2LL,  &_mh_execute_header,  v25,  v24,  &_swiftEmptyArrayStorage);

  unint64_t v26 = sub_100011274();
  uint64_t v27 = swift_allocError(&type metadata for TZError, v26, 0LL, 0LL);
  *(void *)uint64_t v28 = 0LL;
  *(_BYTE *)(v28 + 8) = 3;
  swift_errorRetain(v27);
  a1(0LL, 0LL, v27);
  swift_errorRelease(v27);
  swift_errorRelease(v27);
  swift_release(v4);
}

uint64_t sub_100010DA8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10000799C((uint64_t *)&unk_1000219F0);
  uint64_t result = __chkstk_darwin(v4);
  uint64_t v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = a1 + 40;
    NSString v10 = &_swiftEmptyArrayStorage;
    uint64_t v41 = -(uint64_t)v7;
    uint64_t v38 = a1 + 40;
    unint64_t v39 = v7;
    while (1)
    {
      char v40 = v10;
      if (v8 <= v7) {
        unint64_t v11 = v7;
      }
      else {
        unint64_t v11 = v8;
      }
      uint64_t v43 = -(uint64_t)v11;
      for (uint64_t i = (unint64_t *)(v9 + 16 * v8++); ; i += 2)
      {
        if (v43 + v8 == 1)
        {
          __break(1u);
          return result;
        }

        uint64_t v19 = *(i - 1);
        unint64_t v20 = *i;
        uint64_t v13 = *a2;
        unint64_t v14 = a2[1];
        uint64_t v22 = a2[2];
        int64_t v21 = (void *)a2[3];
        BOOL v23 = !*a2 && v14 == 0xE000000000000000LL;
        BOOL v24 = v23;
        if ((*((_BYTE *)a2 + 57) & 1) != 0) {
          break;
        }
        if ((v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, *a2, a2[1], 0LL) & 1) != 0)
          && (!v22 && v21 == (void *)0xE000000000000000LL
           || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, v22, v21, 0LL) & 1) != 0))
        {
          swift_bridgeObjectRetain(v20);
          uint64_t v13 = 0LL;
          unint64_t v14 = 0xE000000000000000LL;
        }

        else if (!v22 && v21 == (void *)0xE000000000000000LL {
               || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, v22, v21, 0LL) & 1) != 0)
        }
        {
          swift_bridgeObjectRetain(v20);
          swift_bridgeObjectRetain(v14);
        }

        else
        {
          uint64_t v46 = v13;
          unint64_t v47 = v14;
          swift_bridgeObjectRetain(v20);
          swift_bridgeObjectRetain(v14);
          v25._countAndFlagsBits = 46LL;
          v25._object = (void *)0xE100000000000000LL;
          String.append(_:)(v25);
          swift_bridgeObjectRetain(v21);
          v26._countAndFlagsBits = v22;
          v26._object = v21;
          String.append(_:)(v26);
          swift_bridgeObjectRelease(v21);
          uint64_t v13 = v46;
          unint64_t v14 = v47;
        }

        uint64_t v46 = v19;
        unint64_t v47 = v20;
        uint64_t v44 = v13;
        unint64_t v45 = v14;
        uint64_t v15 = type metadata accessor for Locale(0LL);
        uint64_t v16 = (uint64_t)v42;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v42, 1LL, 1LL, v15);
        unint64_t v17 = sub_1000079DC();
        uint64_t v18 = StringProtocol.compare<A>(_:options:range:locale:)( &v44,  64LL,  0LL,  0LL,  1LL,  v16,  &type metadata for String,  &type metadata for String,  v17,  v17);
        sub_100007BC8(v16, (uint64_t *)&unk_1000219F0);
        swift_bridgeObjectRelease(v14);
        if (v18 == -1) {
          goto LABEL_40;
        }
LABEL_9:
        uint64_t result = swift_bridgeObjectRelease(v20);
        ++v8;
        if (v41 + v8 == 1) {
          return (uint64_t)v40;
        }
      }

      if ((v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, *a2, a2[1], 0LL) & 1) != 0)
        && (!v22 && v21 == (void *)0xE000000000000000LL
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, v22, v21, 0LL) & 1) != 0))
      {
        swift_bridgeObjectRetain(v20);
        uint64_t v13 = 0LL;
        unint64_t v14 = 0xE000000000000000LL;
      }

      else if (!v22 && v21 == (void *)0xE000000000000000LL {
             || (_stringCompareWithSmolCheck(_:_:expecting:)(0LL, 0xE000000000000000LL, v22, v21, 0LL) & 1) != 0)
      }
      {
        swift_bridgeObjectRetain(v20);
        swift_bridgeObjectRetain(v14);
      }

      else
      {
        uint64_t v46 = v13;
        unint64_t v47 = v14;
        swift_bridgeObjectRetain(v20);
        swift_bridgeObjectRetain(v14);
        v27._countAndFlagsBits = 46LL;
        v27._object = (void *)0xE100000000000000LL;
        String.append(_:)(v27);
        swift_bridgeObjectRetain(v21);
        v28._countAndFlagsBits = v22;
        v28._object = v21;
        String.append(_:)(v28);
        swift_bridgeObjectRelease(v21);
        uint64_t v13 = v46;
        unint64_t v14 = v47;
      }

      uint64_t v46 = v19;
      unint64_t v47 = v20;
      uint64_t v44 = v13;
      unint64_t v45 = v14;
      uint64_t v29 = type metadata accessor for Locale(0LL);
      uint64_t v30 = (uint64_t)v42;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v42, 1LL, 1LL, v29);
      unint64_t v31 = sub_1000079DC();
      uint64_t v32 = StringProtocol.compare<A>(_:options:range:locale:)( &v44,  64LL,  0LL,  0LL,  1LL,  v30,  &type metadata for String,  &type metadata for String,  v31,  v31);
      sub_100007BC8(v30, (uint64_t *)&unk_1000219F0);
      swift_bridgeObjectRelease(v14);
      if (v32 == 1) {
        goto LABEL_9;
      }
LABEL_40:
      char v33 = v40;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v40);
      NSString v10 = v33;
      uint64_t v48 = v33;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100008B34(0LL, v33[2] + 1LL, 1);
        NSString v10 = v48;
      }

      unint64_t v35 = v10[2];
      unint64_t v34 = v10[3];
      if (v35 >= v34 >> 1)
      {
        uint64_t result = (uint64_t)sub_100008B34((char *)(v34 > 1), v35 + 1, 1);
        NSString v10 = v48;
      }

      v10[2] = v35 + 1;
      uint64_t v36 = (char *)&v10[2 * v35];
      *((void *)v36 + 4) = v19;
      *((void *)v36 + 5) = v20;
      uint64_t v9 = v38;
      unint64_t v7 = v39;
      if (!(v41 + v8)) {
        return (uint64_t)v10;
      }
    }
  }

  return (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100011248()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001126C(void *a1, uint64_t a2)
{
  return sub_10000DD88(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

unint64_t sub_100011274()
{
  unint64_t result = qword_100021710;
  if (!qword_100021710)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017F80, &type metadata for TZError);
    atomic_store(result, (unint64_t *)&qword_100021710);
  }

  return result;
}

uint64_t sub_1000112B8()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

void **sub_1000112E4(void **a1)
{
  return sub_10000D088(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000112F0()
{
  return sub_10001130C(48LL);
}

uint64_t sub_1000112F8()
{
  return sub_10000D9F8( *(void (**)(uint64_t, uint64_t))(v0 + 16),  *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40));
}

uint64_t sub_100011304()
{
  return sub_10001130C(40LL);
}

uint64_t sub_10001130C(uint64_t a1)
{
  return swift_deallocObject(v1, a1, 7LL);
}

uint64_t sub_100011344()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), 0LL);
}

uint64_t sub_100011370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2 != 1) {
    return sub_100007A58(a1, a2, a3, a4, a5, a6, a7);
  }
  return a1;
}

uint64_t sub_100011380(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000113B4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000113F0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100011414(uint64_t a1)
{
  return sub_10000F7FC(a1, v1);
}

uint64_t sub_10001141C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + swift_weakDestroy(v0 + 16) = v3;
  return a2;
}

void sub_100011434()
{
  uint64_t v0 = type metadata accessor for CocoaError.Code(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  __int128 v3 = (char *)&v104 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v109 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  NSString v10 = (char *)&v104 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  id v110 = (char *)&v104 - v12;
  uint64_t v13 = static os_log_type_t.info.getter(v11);
  uint64_t v14 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v15 = (void *)static OS_os_log.default.getter(v14);
  os_log(_:dso:log:type:_:)( "Starting periodic cleanup of stale tz assets",  44LL,  2LL,  &_mh_execute_header,  v15,  v13,  &_swiftEmptyArrayStorage);

  sub_100007258((uint64_t)&v111);
  if ((v112 & 0x2000000000000000LL) != 0) {
    uint64_t v17 = HIBYTE(v112) & 0xF;
  }
  else {
    uint64_t v17 = v111 & 0xFFFFFFFFFFFFLL;
  }
  if (!v17)
  {
    unint64_t v35 = sub_100007AA8(&v111);
    uint64_t v36 = static os_log_type_t.fault.getter(v35);
    uint64_t v37 = (void *)static OS_os_log.default.getter(v36);
    os_log(_:dso:log:type:_:)( "Can't determine current tz data",  31LL,  2LL,  &_mh_execute_header,  v37,  v36,  &_swiftEmptyArrayStorage);

    return;
  }

  uint64_t v106 = v7;
  uint64_t v107 = v1;
  uint64_t v18 = static os_log_type_t.debug.getter(v16);
  uint64_t v19 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v20 = swift_allocObject(v19, 72LL, 7LL);
  __int128 v108 = xmmword_100017CF0;
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
  uint64_t v21 = sub_100006604();
  uint64_t v23 = v22;
  *(void *)(v20 + 56) = &type metadata for String;
  unint64_t v24 = sub_10000FEBC();
  *(void *)(v20 + 64) = v24;
  *(void *)(v20 + 32) = v21;
  *(void *)(v20 + 40) = v23;
  Swift::String v25 = (void *)static OS_os_log.default.getter(v24);
  os_log(_:dso:log:type:_:)( "Comparing assets against current version %{public}@",  51LL,  2LL,  &_mh_execute_header,  v25,  v18,  v20);
  swift_bridgeObjectRelease(v20);

  Swift::String v26 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v27 = [v26 defaultManager];
  if (qword_1000213E8 != -1) {
    swift_once(&qword_1000213E8, sub_100016A28);
  }
  NSString v28 = String._bridgeToObjectiveC()();
  *(void *)&__int128 v113 = 0LL;
  id v29 = [v27 contentsOfDirectoryAtPath:v28 error:&v113];

  uint64_t v30 = (void *)v113;
  if (v29)
  {
    uint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v29, &type metadata for String);
    id v32 = v30;

    char v33 = (void *)sub_100010DA8(v31, &v111);
    sub_100007AA8(&v111);
    uint64_t v34 = swift_bridgeObjectRelease(v31);
  }

  else
  {
    id v38 = (id)v113;
    sub_100007AA8(&v111);
    uint64_t v39 = _convertNSErrorToError(_:)(v30);

    swift_willThrow(v40);
    uint64_t v41 = swift_errorRetain(v39);
    static CocoaError.fileReadNoSuchFile.getter(v41);
    uint64_t v42 = sub_100006008( &qword_1000217D0,  (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError.Code,  (uint64_t)&protocol conformance descriptor for CocoaError.Code);
    LOBYTE(v38) = static _ErrorCodeProtocol.~= infix(_:_:)(v3, v39, v0, v42);
    swift_errorRelease(v39);
    uint64_t v43 = (*(uint64_t (**)(char *, uint64_t))(v107 + 8))(v3, v0);
    uint64_t v34 = swift_errorRelease(v39);
    char v33 = &_swiftEmptyArrayStorage;
  }

  uint64_t v44 = static os_log_type_t.debug.getter(v34);
  uint64_t v45 = swift_allocObject(v19, 72LL, 7LL);
  *(_OWORD *)(v45 + swift_weakDestroy(v0 + 16) = v108;
  uint64_t v46 = v33[2];
  *(void *)(v45 + 56) = &type metadata for Int;
  *(void *)(v45 + 64) = &protocol witness table for Int;
  *(void *)(v45 + 32) = v46;
  unint64_t v47 = (void *)static OS_os_log.default.getter(v45);
  os_log(_:dso:log:type:_:)("Found %{public}ld stale assets", 30LL, 2LL, &_mh_execute_header, v47, v44, v45);
  swift_bridgeObjectRelease(v45);

  URL.init(fileURLWithPath:)(qword_1000225D8, unk_1000225E0);
  uint64_t v48 = v33[2];
  if (v48)
  {
    uint64_t v105 = v19;
    uint64_t v49 = v4;
    uint64_t v107 = v14;
    swift_bridgeObjectRetain(v33);
    uint64_t v50 = v33 + 5;
    while (1)
    {
      uint64_t v52 = *(v50 - 1);
      uint64_t v51 = *v50;
      swift_bridgeObjectRetain(*v50);
      URL.appendingPathComponent(_:)(v52, v51);
      swift_bridgeObjectRelease(v51);
      id v53 = [v26 defaultManager];
      URL._bridgeToObjectiveC()(v54);
      uint64_t v56 = v55;
      *(void *)&__int128 v113 = 0LL;
      unsigned int v57 = [v53 removeItemAtURL:v55 error:&v113];

      id v58 = (id)v113;
      if (!v57) {
        break;
      }
      v50 += 2;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v10, v49);
      if (!--v48)
      {
        swift_bridgeObjectRelease(v33);
        uint64_t v4 = v49;
        uint64_t v19 = v105;
        goto LABEL_17;
      }
    }

    uint64_t v78 = v58;
    swift_bridgeObjectRelease_n(v33, 2LL);
    uint64_t v39 = _convertNSErrorToError(_:)(v78);

    swift_willThrow(v79);
    uint64_t v80 = *(void (**)(char *, uint64_t))(v109 + 8);
    uint64_t v81 = v49;
    v80(v10, v49);
    uint64_t v19 = v105;
    uint64_t v43 = ((uint64_t (*)(char *, uint64_t))v80)(v110, v81);
    goto LABEL_33;
  }

LABEL_17:
  id v59 = [v26 defaultManager];
  if (qword_1000213C8 != -1) {
    swift_once(&qword_1000213C8, sub_1000167F4);
  }
  NSString v60 = String._bridgeToObjectiveC()();
  *(void *)&__int128 v113 = 0LL;
  id v61 = [v59 destinationOfSymbolicLinkAtPath:v60 error:&v113];

  uint64_t v62 = (void *)v113;
  if (v61)
  {
    uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
    uint64_t v65 = v64;
    id v66 = v62;

    unint64_t v67 = v106;
    URL.init(fileURLWithPath:)(v63, v65);
    uint64_t v68 = swift_bridgeObjectRelease(v65);
    uint64_t v69 = URL.lastPathComponent.getter(v68);
    uint64_t v71 = v70;
    uint64_t v72 = *(void (**)(char *, uint64_t))(v109 + 8);
    v72(v67, v4);
    LOBYTE(v69) = sub_10000E290(v69, v71, v33);
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v71);
    if ((v69 & 1) != 0)
    {
      id v73 = [v26 defaultManager];
      NSString v74 = String._bridgeToObjectiveC()();
      *(void *)&__int128 v113 = 0LL;
      unsigned int v75 = [v73 removeItemAtPath:v74 error:&v113];

      uint64_t v76 = v113;
      if (!v75)
      {
        id v96 = (id)v113;
        uint64_t v39 = _convertNSErrorToError(_:)(v76);

        swift_willThrow(v97);
        uint64_t v43 = ((uint64_t (*)(char *, uint64_t))v72)(v110, v4);
        goto LABEL_33;
      }

      id v77 = (id)v113;
    }
  }

  else
  {
    id v82 = (id)v113;
    swift_bridgeObjectRelease(v33);
    uint64_t v83 = _convertNSErrorToError(_:)(v62);

    swift_willThrow(v84);
    swift_errorRelease(v83);
  }

  id v85 = [v26 defaultManager];
  if (qword_1000213D0 != -1) {
    swift_once(&qword_1000213D0, sub_100016880);
  }
  NSString v86 = String._bridgeToObjectiveC()();
  unsigned int v87 = [v85 fileExistsAtPath:v86];

  if (!v87)
  {
    (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v4);
    return;
  }

  id v88 = [v26 defaultManager];
  NSString v89 = String._bridgeToObjectiveC()();
  *(void *)&__int128 v113 = 0LL;
  unsigned int v90 = [v88 removeItemAtPath:v89 error:&v113];

  uint64_t v91 = v113;
  if (v90)
  {
    uint64_t v92 = *(void (**)(char *, uint64_t))(v109 + 8);
    id v93 = (id)v113;
    v92(v110, v4);
    return;
  }

  id v94 = (id)v113;
  uint64_t v39 = _convertNSErrorToError(_:)(v91);

  swift_willThrow(v95);
  uint64_t v43 = (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v110, v4);
LABEL_33:
  uint64_t v98 = static os_log_type_t.error.getter(v43);
  uint64_t v99 = swift_allocObject(v19, 72LL, 7LL);
  *(_OWORD *)(v99 + swift_weakDestroy(v0 + 16) = v108;
  uint64_t v100 = _convertErrorToNSError(_:)(v39);
  *(void *)(v99 + 56) = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
  uint64_t v101 = sub_100007B44( (unint64_t *)&qword_100021500,  (unint64_t *)&unk_1000219E0,  &OBJC_CLASS___NSError_ptr);
  *(void *)(v99 + 64) = v101;
  *(void *)(v99 + 32) = v100;
  unsigned int v102 = (void *)static OS_os_log.default.getter(v101);
  os_log(_:dso:log:type:_:)( "Stale asset cleanup failed due to %{public}@",  44LL,  2LL,  &_mh_execute_header,  v102,  v98,  v99);
  swift_bridgeObjectRelease(v99);

  uint64_t v103 = (void *)_convertErrorToNSError(_:)(v39);
  __int128 v113 = (unint64_t)v103;
  uint64_t v114 = 0LL;
  uint64_t v115 = 0LL;
  char v116 = 2;
  sub_100012148(&v113);

  swift_errorRelease(v39);
}

_OWORD *sub_100011DE8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100011DF8()
{
  return swift_deallocObject(v0, 74LL, 7LL);
}

uint64_t sub_100011E34(uint64_t (*a1)(void), uint64_t a2)
{
  return sub_10000F3C0(a1, a2, v2 + 16);
}

uint64_t sub_100011E3C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100011E5C()
{
  unint64_t result = qword_1000217C8;
  if (!qword_1000217C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017F08, &type metadata for TemporaryDirectoryError);
    atomic_store(result, (unint64_t *)&qword_1000217C8);
  }

  return result;
}

uint64_t sub_100011EA0( uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_100011EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    swift_bridgeObjectRetain(a7);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }

  return result;
}

uint64_t sub_100011F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2 != 1) {
    return sub_100011EDC(a1, a2, a3, a4, a5, a6, a7);
  }
  return a1;
}

uint64_t sub_100011F3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000799C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000799C(&qword_100021748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for TemporaryDirectoryError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TemporaryDirectoryError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100012060 + 4 * byte_100017D30[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100012080 + 4 * byte_100017D35[v4]))();
  }
}

_BYTE *sub_100012060(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_100012080(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100012088(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100012090(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100012098(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1000120A0(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_1000120AC()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for TemporaryDirectoryError()
{
  return &type metadata for TemporaryDirectoryError;
}

unint64_t sub_1000120CC()
{
  unint64_t result = qword_1000217D8;
  if (!qword_1000217D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017EE0, &type metadata for TemporaryDirectoryError);
    atomic_store(result, (unint64_t *)&qword_1000217D8);
  }

  return result;
}

uint64_t sub_100012148(__int128 *a1)
{
  int v2 = v59;
  uint64_t result = sub_100012AFC(a1, (uint64_t)&v60);
  switch(v61)
  {
    case 0:
      uint64_t v4 = sub_10000799C(&qword_100021770);
      uint64_t inited = swift_initStackObject(v4, v58);
      *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_100017CD0;
      *(void *)(inited + 32) = 0x6973726556646C6FLL;
      *(void *)(inited + 40) = 0xEA00000000006E6FLL;
      *(void *)(inited + 48) = String._bridgeToObjectiveC()();
      *(void *)(inited + 56) = 0x697372655677656ELL;
      *(void *)(inited + 64) = 0xEA00000000006E6FLL;
      *(void *)(inited + 72) = String._bridgeToObjectiveC()();
      unint64_t v6 = sub_10000AB0C(inited);
      uint64_t v7 = 0x7463417465737361LL;
      unsigned int v8 = 1952544361;
      goto LABEL_4;
    case 1:
      uint64_t v9 = sub_10000799C(&qword_100021770);
      uint64_t v10 = swift_initStackObject(v9, v57);
      *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_100017CD0;
      *(void *)(v10 + 32) = 0x6973726556646C6FLL;
      *(void *)(v10 + 40) = 0xEA00000000006E6FLL;
      *(void *)(v10 + 48) = String._bridgeToObjectiveC()();
      *(void *)(v10 + 56) = 0x697372655677656ELL;
      *(void *)(v10 + 64) = 0xEA00000000006E6FLL;
      *(void *)(v10 + 72) = String._bridgeToObjectiveC()();
      unint64_t v6 = sub_10000AB0C(v10);
      uint64_t v7 = 0x736E497465737361LL;
      unsigned int v8 = 1819042164;
LABEL_4:
      sub_100012928(v7, (void *)(v8 | 0xEE00646500000000LL));
      return swift_bridgeObjectRelease(v6);
    case 2:
      id v11 = v2;
      uint64_t v12 = sub_100012774();
      uint64_t v13 = v12;
      if (!((unint64_t)v12 >> 62))
      {
        uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        if (v14) {
          goto LABEL_7;
        }
LABEL_29:
        swift_bridgeObjectRelease(v13);
        uint64_t v50 = (uint64_t)a1;
        return sub_100012B14(v50);
      }

      if (v12 >= 0) {
        v12 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v12);
      if (!v14) {
        goto LABEL_29;
      }
LABEL_7:
      uint64_t v51 = a1;
      if (v14 < 1)
      {
        __break(1u);
        goto LABEL_32;
      }

      uint64_t v15 = 0LL;
      do
      {
        if ((v13 & 0xC000000000000001LL) != 0) {
          id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v13);
        }
        else {
          id v16 = *(id *)(v13 + 8 * v15 + 32);
        }
        uint64_t v17 = v16;
        ++v15;
        uint64_t v18 = sub_10000799C(&qword_100021770);
        uint64_t v19 = swift_initStackObject(v18, v52);
        *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
        *(void *)(v19 + 32) = 0x726F727265LL;
        *(void *)(v19 + 40) = 0xE500000000000000LL;
        id v20 = [v17 domain];
        uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        unint64_t v23 = v22;

        uint64_t v54 = v21;
        unint64_t v55 = v23;
        v24._countAndFlagsBits = 58LL;
        v24._object = (void *)0xE100000000000000LL;
        String.append(_:)(v24);
        id v53 = [v17 code];
        v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
        object = v25._object;
        String.append(_:)(v25);
        swift_bridgeObjectRelease(object);
        unint64_t v27 = v55;
        NSString v28 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v27);
        *(void *)(v19 + 48) = v28;
        unint64_t v29 = sub_10000AB0C(v19);
        uint64_t v54 = 0LL;
        unint64_t v55 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(27LL);
        swift_bridgeObjectRelease(v55);
        NSString v30 = String._bridgeToObjectiveC()();
        sub_100007C04(0LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        AnalyticsSendEvent(v30, isa);

        swift_bridgeObjectRelease(v29);
      }

      while (v14 != v15);
LABEL_21:
      swift_bridgeObjectRelease(v13);
      uint64_t v50 = (uint64_t)v51;
      return sub_100012B14(v50);
    case 3:
      id v32 = v2;
      uint64_t v33 = sub_100012774();
      uint64_t v13 = v33;
      if ((unint64_t)v33 >> 62)
      {
        if (v33 >= 0) {
          v33 &= 0xFFFFFFFFFFFFFF8uLL;
        }
        uint64_t v34 = _CocoaArrayWrapper.endIndex.getter(v33);
        if (!v34) {
          goto LABEL_29;
        }
      }

      else
      {
        uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        if (!v34) {
          goto LABEL_29;
        }
      }

      uint64_t v51 = a1;
      if (v34 >= 1)
      {
        uint64_t v35 = 0LL;
        do
        {
          if ((v13 & 0xC000000000000001LL) != 0) {
            id v36 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v35, v13);
          }
          else {
            id v36 = *(id *)(v13 + 8 * v35 + 32);
          }
          uint64_t v37 = v36;
          ++v35;
          uint64_t v38 = sub_10000799C(&qword_100021770);
          uint64_t v39 = swift_initStackObject(v38, v56);
          *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
          *(void *)(v39 + 32) = 0x726F727265LL;
          *(void *)(v39 + 40) = 0xE500000000000000LL;
          id v40 = [v37 domain];
          static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
          uint64_t v42 = v41;

          v43._countAndFlagsBits = 58LL;
          v43._object = (void *)0xE100000000000000LL;
          String.append(_:)(v43);
          id v53 = [v37 code];
          v44._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
          uint64_t v45 = v44._object;
          String.append(_:)(v44);
          swift_bridgeObjectRelease(v45);
          NSString v46 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v42);
          *(void *)(v39 + 48) = v46;
          unint64_t v47 = sub_10000AB0C(v39);
          uint64_t v54 = 0LL;
          unint64_t v55 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(27LL);
          swift_bridgeObjectRelease(0xE000000000000000LL);
          NSString v48 = String._bridgeToObjectiveC()();
          sub_100007C04(0LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
          Class v49 = Dictionary._bridgeToObjectiveC()().super.isa;
          AnalyticsSendEvent(v48, v49);

          swift_bridgeObjectRelease(v47);
        }

        while (v34 != v35);
        goto LABEL_21;
      }

LABEL_32:
      __break(1u);
      JUMPOUT(0x100012764LL);
    default:
      return result;
  }

uint64_t sub_100012774()
{
  uint64_t v1 = v0;
  id v2 = [v0 userInfo];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUnderlyingErrorKey);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16) || (unint64_t v7 = sub_10000FF18(v4, v5), (v8 & 1) == 0))
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v3);
    goto LABEL_7;
  }

  sub_10000A824(*(void *)(v3 + 56) + 32 * v7, (uint64_t)&v21);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v3);
  if (!*((void *)&v22 + 1))
  {
LABEL_7:
    sub_100012BB0((uint64_t)&v21);
    goto LABEL_8;
  }

  uint64_t v9 = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
  if ((swift_dynamicCast(&v20, &v21, (char *)&type metadata for Any + 8, v9, 6LL) & 1) == 0)
  {
LABEL_8:
    uint64_t v16 = sub_10000799C((uint64_t *)&unk_1000217E0);
    uint64_t v17 = swift_allocObject(v16, 40LL, 7LL);
    *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_100017F50;
    *(void *)(v17 + 32) = v1;
    *(void *)&__int128 v21 = v17;
    specialized Array._endMutation()(v17);
    uint64_t v15 = v21;
    id v18 = v1;
    return v15;
  }

  uint64_t v10 = v20;
  uint64_t v11 = sub_10000799C((uint64_t *)&unk_1000217E0);
  uint64_t v12 = swift_allocObject(v11, 40LL, 7LL);
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_100017F50;
  *(void *)(v12 + 32) = v1;
  *(void *)&__int128 v21 = v12;
  specialized Array._endMutation()(v12);
  uint64_t v13 = v21;
  uint64_t v14 = sub_100012774(v1);
  *(void *)&__int128 v21 = v13;
  sub_10000875C(v14);

  return v21;
}

void sub_100012928(uint64_t a1, void *a2)
{
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  String.append(_:)(v4);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100018E40LL);
  sub_100007C04(0LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  AnalyticsSendEvent(v5, isa);
}

void (*sub_100012A08( void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100012A88(v6, a2, a3);
  return sub_100012A5C;
}

void sub_100012A5C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void (*sub_100012A88(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100012AF4;
  }

  __break(1u);
  return result;
}

void sub_100012AF4(id *a1)
{
}

uint64_t sub_100012AFC(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + swift_weakDestroy(v0 + 16) = v3;
  return a2;
}

uint64_t sub_100012B14(uint64_t a1)
{
  return a1;
}

void sub_100012B48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease(a2);
      swift_bridgeObjectRelease(a4);
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }

uint64_t sub_100012BB0(uint64_t a1)
{
  uint64_t v2 = sub_10000799C(&qword_100021510);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

id sub_100012BF0(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain(a2);
      uint64_t result = (id)swift_bridgeObjectRetain(a4);
      break;
    case 2:
    case 3:
      uint64_t result = result;
      break;
    default:
      return result;
  }

  return result;
}

void destroy for TZLogEvent(uint64_t a1)
{
}

uint64_t initializeWithCopy for TZLogEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_100012BF0(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for TZLogEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_100012BF0(*(id *)a2, v4, v5, v6, v7);
  char v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_100012B48(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for TZLogEvent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TZLogEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v8;
  char v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_100012B48(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TZLogEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TZLogEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + swift_weakDestroy(v0 + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 251;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFB) {
      *(_BYTE *)(result + 33) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFB) {
      *(_BYTE *)(result + 33) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 32) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100012E28(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_100012E30(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TZLogEvent()
{
  return &type metadata for TZLogEvent;
}

uint64_t initializeBufferWithCopyOfBuffer for TZError(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TZError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TZError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100012EE8(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_100012F00(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    LOBYTE(a2) = 3;
  }

  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TZError()
{
  return &type metadata for TZError;
}

uint64_t sub_100012F28(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

id sub_100012F54()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for Daemon()) init];
  qword_100022550 = (uint64_t)result;
  return result;
}

char *sub_100012F80()
{
  uint64_t v2 = v1;
  id v3 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
  int v4 = v0;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  id v6 = [v3 initWithMachServiceName:v5];

  *(void *)&v4[OBJC_IVAR____TtC3tzd6Daemon_listener] = v6;
  *(_WORD *)&v4[OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType] = 0;

  v28.receiver = v4;
  v28.super_class = (Class)type metadata accessor for Daemon();
  uint64_t v7 = (char *)objc_msgSendSuper2(&v28, "init");
  __int128 v8 = *(void **)&v7[OBJC_IVAR____TtC3tzd6Daemon_listener];
  char v9 = v7;
  uint64_t v10 = static os_log_type_t.debug.getter([v8 setDelegate:v9]);
  uint64_t v11 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
  if (qword_100021390 != -1) {
    swift_once(&qword_100021390, sub_10000BB30);
  }
  int v13 = byte_100022540;
  unint64_t v14 = sub_10000FEBC();
  unint64_t v15 = v14;
  uint64_t v16 = 29545LL;
  if (!v13) {
    uint64_t v16 = 0x746F6E207369LL;
  }
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = v14;
  if (v13) {
    unint64_t v17 = 0xE200000000000000LL;
  }
  else {
    unint64_t v17 = 0xE600000000000000LL;
  }
  *(void *)(v12 + 32) = v16;
  *(void *)(v12 + 40) = v17;
  uint64_t v18 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v19 = (void *)static OS_os_log.default.getter(v18);
  os_log(_:dso:log:type:_:)("Device %{public}@ internal build", 32LL, 2LL, &_mh_execute_header, v19, v10, v12);
  swift_bridgeObjectRelease(v12);

  uint64_t v21 = static os_log_type_t.debug.getter(v20);
  uint64_t v22 = swift_allocObject(v11, 72LL, 7LL);
  unint64_t v23 = (void *)v22;
  *(_OWORD *)(v22 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
  if (qword_100021380 != -1) {
    uint64_t v22 = swift_once(&qword_100021380, sub_10000B8E4);
  }
  uint64_t v24 = 29545LL;
  if (byte_100022530)
  {
    unint64_t v25 = 0xE200000000000000LL;
  }

  else
  {
    uint64_t v24 = 0x746F6E207369LL;
    unint64_t v25 = 0xE600000000000000LL;
  }

  v23[7] = &type metadata for String;
  v23[8] = v15;
  v23[4] = v24;
  v23[5] = v25;
  Swift::String v26 = (void *)static OS_os_log.default.getter(v22);
  os_log(_:dso:log:type:_:)("Device %{public}@ audio accessory", 33LL, 2LL, &_mh_execute_header, v26, v21, v23);
  swift_bridgeObjectRelease(v23);

  return v9;
}

void sub_100013254()
{
  uint64_t v1 = (dispatch_queue_s *)static OS_dispatch_queue.main.getter();
  uint64_t v2 = swift_allocObject(&unk_10001D310, 24LL, 7LL);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v0;
  uint64_t v20 = sub_100015AE8;
  uint64_t v21 = v2;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256LL;
  uint64_t v18 = sub_100013AD4;
  uint64_t v19 = &unk_10001D328;
  id v3 = _Block_copy(&v16);
  uint64_t v4 = v21;
  NSString v5 = v0;
  swift_release(v4);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v3);
  _Block_release(v3);

  [*(id *)&v5[OBJC_IVAR____TtC3tzd6Daemon_listener] resume];
  uint64_t v6 = swift_allocObject(&unk_10001D360, 24LL, 7LL);
  *(void *)(v6 + swift_weakDestroy(v0 + 16) = v5;
  uint64_t v20 = sub_100015AF0;
  uint64_t v21 = v6;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256LL;
  uint64_t v18 = sub_100013AD4;
  uint64_t v19 = &unk_10001D378;
  uint64_t v7 = _Block_copy(&v16);
  uint64_t v8 = v21;
  char v9 = v5;
  swift_release(v8);
  xpc_activity_register("com.apple.timezoneupdates.local-asset-check", XPC_ACTIVITY_CHECK_IN, v7);
  _Block_release(v7);
  uint64_t v20 = sub_10001443C;
  uint64_t v21 = 0LL;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256LL;
  uint64_t v18 = sub_100013AD4;
  uint64_t v19 = &unk_10001D3A0;
  uint64_t v10 = _Block_copy(&v16);
  xpc_activity_register("com.apple.timezoneupdates.stale-data-cleanup", XPC_ACTIVITY_CHECK_IN, v10);
  _Block_release(v10);
  uint64_t v12 = static os_log_type_t.debug.getter(v11);
  uint64_t v13 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  unint64_t v14 = (void *)static OS_os_log.default.getter(v13);
  os_log(_:dso:log:type:_:)( "tzd initialization complete; starting run loop",
    46LL,
    2LL,
    &_mh_execute_header,
    v14,
    v12,
    &_swiftEmptyArrayStorage);

  id v15 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  [v15 run];
}

void sub_1000134BC(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (xpc_dictionary_get_string(a1, _xpc_event_key_name))
  {
    uint64_t v59 = v8;
    id v60 = a2;
    uint64_t v57 = v9;
    uint64_t v58 = v5;
    uint64_t v12 = String.init(cString:)();
    unint64_t v14 = v13;
    uint64_t v15 = static os_log_type_t.debug.getter();
    uint64_t v56 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v16 = swift_allocObject(v56, 112LL, 7LL);
    *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_100017CD0;
    xpc_type_t type = xpc_get_type(a1);
    *(void *)(v16 + 56) = &type metadata for OpaquePointer;
    *(void *)(v16 + 64) = &protocol witness table for OpaquePointer;
    *(void *)(v16 + 32) = type;
    *(void *)(v16 + 96) = &type metadata for String;
    unint64_t v18 = sub_10000FEBC();
    *(void *)(v16 + 104) = v18;
    *(void *)(v16 + 72) = v12;
    *(void *)(v16 + 80) = v14;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v19 = swift_bridgeObjectRetain(v14);
    uint64_t v20 = (void *)static OS_os_log.default.getter(v19);
    os_log(_:dso:log:type:_:)( "notifyd event type: %{public}@, event name: %{public}@",  54LL,  2LL,  &_mh_execute_header,  v20,  v15,  v16);
    swift_bridgeObjectRelease(v16);

    if (v12 != 0xD00000000000003FLL || (unint64_t v21 = 0x8000000100019300LL, v14 != 0x8000000100019300LL))
    {
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000003FLL, 0x8000000100019300LL, v12, v14, 0LL) & 1) == 0)
      {
        if (v12 != 0xD00000000000003BLL || (unint64_t v41 = 0x8000000100019340LL, v14 != 0x8000000100019340LL))
        {
          uint64_t v42 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000003BLL, 0x8000000100019340LL, v12, v14, 0LL);
          if ((v42 & 1) == 0)
          {
            uint64_t v53 = static os_log_type_t.fault.getter(v42);
            uint64_t v54 = swift_allocObject(v56, 72LL, 7LL);
            *(_OWORD *)(v54 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
            *(void *)(v54 + 56) = &type metadata for String;
            *(void *)(v54 + 64) = v18;
            *(void *)(v54 + 32) = v12;
            *(void *)(v54 + 40) = v14;
            id v60 = (id)static OS_os_log.default.getter(v54);
            os_log(_:dso:log:type:_:)( "Unexpected XPC event name %{public}@",  36LL,  2LL,  &_mh_execute_header,  v60,  v53,  v54);
            swift_bridgeObjectRelease(v54);

            return;
          }

          unint64_t v41 = v14;
        }

        swift_bridgeObjectRelease(v41);
        sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
        Swift::String v43 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v44 = swift_allocObject(&unk_10001D478, 24LL, 7LL);
        id v45 = v60;
        *(void *)(v44 + swift_weakDestroy(v0 + 16) = v60;
        uint64_t v65 = sub_100015B30;
        uint64_t v66 = v44;
        __int128 aBlock = _NSConcreteStackBlock;
        uint64_t v62 = 1107296256LL;
        uint64_t v63 = sub_100012F28;
        uint64_t v64 = &unk_10001D490;
        NSString v46 = _Block_copy(&aBlock);
        uint64_t v47 = v66;
        id v48 = v45;
        uint64_t v49 = swift_release(v47);
        static DispatchQoS.unspecified.getter(v49);
        __int128 aBlock = (void **)&_swiftEmptyArrayStorage;
        unint64_t v50 = sub_100014770();
        uint64_t v51 = sub_10000799C((uint64_t *)&unk_1000219C0);
        unint64_t v52 = sub_1000147B8();
        dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v51, v52, v4, v50);
        OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v46);
        _Block_release(v46);

        (*(void (**)(char *, uint64_t))(v58 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v57 + 8))(v11, v59);
        return;
      }

      unint64_t v21 = v14;
    }

    swift_bridgeObjectRelease(v21);
    uint64_t v23 = v58;
    uint64_t v22 = v59;
    uint64_t v24 = v57;
    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    unint64_t v25 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v26 = swift_allocObject(&unk_10001D4C8, 24LL, 7LL);
    id v27 = v60;
    *(void *)(v26 + swift_weakDestroy(v0 + 16) = v60;
    uint64_t v65 = sub_100015B34;
    uint64_t v66 = v26;
    __int128 aBlock = _NSConcreteStackBlock;
    uint64_t v62 = 1107296256LL;
    uint64_t v63 = sub_100012F28;
    uint64_t v64 = &unk_10001D4E0;
    objc_super v28 = _Block_copy(&aBlock);
    uint64_t v29 = v66;
    id v30 = v27;
    uint64_t v31 = swift_release(v29);
    static DispatchQoS.unspecified.getter(v31);
    __int128 aBlock = (void **)&_swiftEmptyArrayStorage;
    unint64_t v32 = sub_100014770();
    uint64_t v33 = sub_10000799C((uint64_t *)&unk_1000219C0);
    unint64_t v34 = sub_1000147B8();
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v33, v34, v4, v32);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v22);
  }

  else
  {
    uint64_t v35 = static os_log_type_t.fault.getter(0LL);
    uint64_t v36 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v37 = swift_allocObject(v36, 72LL, 7LL);
    *(_OWORD *)(v37 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
    __int128 aBlock = (void **)a1;
    swift_unknownObjectRetain(a1);
    uint64_t v38 = sub_10000799C((uint64_t *)&unk_100021A70);
    uint64_t v39 = sub_10000799C(&qword_100021790);
    swift_dynamicCast(v37 + 32, &aBlock, v38, v39, 7LL);
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    id v40 = (void *)((uint64_t (*)(void))static OS_os_log.default.getter)();
    os_log(_:dso:log:type:_:)("Unexpected XPC event %{public}@", 31LL, 2LL, &_mh_execute_header, v40, v35, v37);
    swift_bridgeObjectRelease(v37);
  }

uint64_t sub_100013AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

void sub_100013B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = swift_errorRetain(a3);
    uint64_t v5 = static os_log_type_t.error.getter(v4);
    uint64_t v6 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
    *(_OWORD *)(v7 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
    uint64_t v8 = _convertErrorToNSError(_:)(a3);
    *(void *)(v7 + 56) = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
    *(void *)(v7 + 64) = sub_100015980();
    *(void *)(v7 + 32) = v8;
    uint64_t v9 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v10 = (void *)static OS_os_log.default.getter(v9);
    os_log(_:dso:log:type:_:)("Error advancing asset pipeline: %{public}@", 42LL, 2LL, &_mh_execute_header, v10, v5, v7);
    swift_bridgeObjectRelease(v7);

    swift_errorRelease(a3);
  }

  else
  {
    uint64_t v11 = static os_log_type_t.debug.getter(a1);
    uint64_t v12 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    id v13 = (id)static OS_os_log.default.getter(v12);
    os_log(_:dso:log:type:_:)( "Advanced asset pipeline",  23LL,  2LL,  &_mh_execute_header,  v13,  v11,  &_swiftEmptyArrayStorage);
  }

uint64_t sub_100013C84(void (*a1)(uint64_t (*)(), uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject(&unk_10001D2E8, 24LL, 7LL);
  *(void *)(v5 + swift_weakDestroy(v0 + 16) = a3;
  swift_unknownObjectRetain(a3);
  a1(nullsub_1, v5);
  return swift_release(v5);
}

uint64_t sub_100013D44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v30 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = static os_log_type_t.debug.getter(v10);
  uint64_t v14 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v15 = (void *)static OS_os_log.default.getter(v14);
  os_log(_:dso:log:type:_:)("Begin isUpdateWaiting", 21LL, 2LL, &_mh_execute_header, v15, v13, &_swiftEmptyArrayStorage);

  uint64_t v16 = os_transaction_create("com.apple.tzd.isUpdateWaiting");
  sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v17 = (void *)static OS_dispatch_queue.main.getter();
  unint64_t v18 = (void *)swift_allocObject(&unk_10001D180, 48LL, 7LL);
  v18[2] = v3;
  v18[3] = a1;
  v18[4] = a2;
  v18[5] = v16;
  aBlock[4] = sub_10001473C;
  unint64_t v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100012F28;
  aBlock[3] = &unk_10001D198;
  uint64_t v19 = _Block_copy(aBlock);
  uint64_t v20 = v32;
  id v21 = v3;
  sub_100014760(a1, a2);
  swift_unknownObjectRetain(v16);
  uint64_t v22 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v22);
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v23 = sub_100014770();
  uint64_t v24 = sub_10000799C((uint64_t *)&unk_1000219C0);
  unint64_t v25 = sub_1000147B8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v6, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v8, v19);
  _Block_release(v19);
  swift_unknownObjectRelease(v16);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v29);
}

void sub_100013FB8(uint64_t a1, void (*a2)(BOOL), uint64_t a3, uint64_t a4)
{
  BOOL v6 = sub_1000157FC();
  if (a2)
  {
    a2(v6);
    sub_100015424(1, a4);
  }

  else
  {
    __break(1u);
  }

xpc_activity_state_t sub_100014100(_xpc_activity_s *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  xpc_activity_state_t result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    uint64_t v13 = static os_log_type_t.info.getter(2LL);
    uint64_t v28 = v5;
    uint64_t v14 = v13;
    uint64_t v15 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v16 = (void *)static OS_os_log.default.getter(v15);
    os_log(_:dso:log:type:_:)( "Beginning periodic remote asset check",  37LL,  2LL,  &_mh_execute_header,  v16,  v14,  &_swiftEmptyArrayStorage);

    uint64_t v17 = os_transaction_create("com.apple.tzd.local-asset-check");
    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    unint64_t v18 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v19 = swift_allocObject(&unk_10001D428, 32LL, 7LL);
    *(void *)(v19 + swift_weakDestroy(v0 + 16) = a2;
    *(void *)(v19 + 24) = v17;
    aBlock[4] = sub_100015B28;
    uint64_t v30 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100012F28;
    aBlock[3] = &unk_10001D440;
    uint64_t v20 = _Block_copy(aBlock);
    uint64_t v21 = v30;
    id v22 = a2;
    swift_unknownObjectRetain(v17);
    uint64_t v23 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v23);
    aBlock[0] = &_swiftEmptyArrayStorage;
    unint64_t v24 = sub_100014770();
    uint64_t v25 = sub_10000799C((uint64_t *)&unk_1000219C0);
    unint64_t v26 = sub_1000147B8();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v4, v24);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v7, v20);
    _Block_release(v20);
    swift_unknownObjectRelease(v17);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  return result;
}

void sub_100014370(uint64_t a1, uint64_t a2)
{
  if (qword_100021380 != -1) {
    swift_once(&qword_100021380, sub_10000B8E4);
  }
  if (byte_100022530 == 1)
  {
    BOOL v3 = sub_1000157FC();
    if (v3)
    {
      uint64_t v4 = static os_log_type_t.info.getter(v3);
      uint64_t v5 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
      uint64_t v6 = (void *)static OS_os_log.default.getter(v5);
      os_log(_:dso:log:type:_:)( "Periodic check on audio accessory discovered waiting asset; scheduled reboot",
        76LL,
        2LL,
        &_mh_execute_header,
        v6,
        v4,
        &_swiftEmptyArrayStorage);

      sub_10000A928(v7);
    }
  }

  sub_100015424(1, a2);
}

xpc_activity_state_t sub_10001443C(_xpc_activity_s *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  xpc_activity_state_t result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    uint64_t v11 = static os_log_type_t.info.getter();
    uint64_t v24 = v3;
    uint64_t v12 = v11;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v13 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)( "Beginning periodic stale data cleanup",  37LL,  2LL,  &_mh_execute_header,  v13,  v12,  &_swiftEmptyArrayStorage);

    uint64_t v14 = os_transaction_create("com.apple.tzd.stale-data-cleanup");
    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v15 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v16 = swift_allocObject(&unk_10001D3D8, 24LL, 7LL);
    *(void *)(v16 + swift_weakDestroy(v0 + 16) = v14;
    aBlock[4] = sub_100015AF8;
    uint64_t v26 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100012F28;
    aBlock[3] = &unk_10001D3F0;
    uint64_t v17 = _Block_copy(aBlock);
    uint64_t v18 = v26;
    swift_unknownObjectRetain(v14);
    uint64_t v19 = swift_release(v18);
    static DispatchQoS.unspecified.getter(v19);
    aBlock[0] = &_swiftEmptyArrayStorage;
    unint64_t v20 = sub_100014770();
    uint64_t v21 = sub_10000799C((uint64_t *)&unk_1000219C0);
    unint64_t v22 = sub_1000147B8();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v2, v20);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v5, v17);
    _Block_release(v17);
    swift_unknownObjectRelease(v14);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  return result;
}

id sub_1000146A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Daemon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Daemon()
{
  return objc_opt_self(&OBJC_CLASS____TtC3tzd6Daemon);
}

uint64_t sub_100014700()
{
  if (*(void *)(v0 + 24)) {
    swift_release(*(void *)(v0 + 32));
  }
  swift_unknownObjectRelease(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_10001473C()
{
}

uint64_t sub_100014748(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014758(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100014760(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

unint64_t sub_100014770()
{
  unint64_t result = qword_100021700;
  if (!qword_100021700)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100021700);
  }

  return result;
}

unint64_t sub_1000147B8()
{
  unint64_t result = qword_100021708;
  if (!qword_100021708)
  {
    uint64_t v1 = sub_10000A7E0((uint64_t *)&unk_1000219C0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021708);
  }

  return result;
}

id sub_100014804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v12 = 0LL;
  id v7 = [v3 initWithPattern:v6 options:a3 error:&v12];

  id v8 = v12;
  if (v7)
  {
    id v9 = v12;
  }

  else
  {
    id v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }

  return v7;
}

void sub_1000148DC()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v1 = [v0 defaultManager];
  if (qword_1000213D8 != -1) {
    swift_once(&qword_1000213D8, sub_100016914);
  }
  NSString v2 = String._bridgeToObjectiveC()();
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (v3)
  {
    uint64_t v4 = String.init(contentsOfFile:)(qword_1000225B8, unk_1000225C0);
    uint64_t v6 = v5;
    id v7 = objc_allocWithZone(&OBJC_CLASS___NSRegularExpression);
    id v8 = sub_100014804(0xD000000000000041LL, 0x80000001000193F0LL, 0LL);
    swift_bridgeObjectRetain(v6);
    uint64_t v9 = String.UTF16View.count.getter(v4, v6);
    swift_bridgeObjectRelease(v6);
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = objc_msgSend(v8, "matchesInString:options:range:", v10, 0, 0, v9);

    uint64_t v12 = sub_100007C04(0LL, (unint64_t *)&unk_100021A80, &OBJC_CLASS___NSTextCheckingResult_ptr);
    uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

    if ((unint64_t)v13 >> 62)
    {
      if (v13 < 0) {
        uint64_t v63 = v13;
      }
      else {
        uint64_t v63 = v13 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v13);
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v63);
      swift_bridgeObjectRelease(v13);
    }

    else
    {
      uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v65 = v8;
    if (v14 != 1) {
      goto LABEL_13;
    }
    if ((v13 & 0xC000000000000001LL) != 0)
    {
      id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v13);
    }

    else
    {
      if (!*(void *)((v13 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
        __break(1u);
      }
      id v15 = *(id *)(v13 + 32);
    }

    uint64_t v16 = v15;
    id v17 = [v15 rangeAtIndex:1];
    uint64_t v19 = v18;

    uint64_t v64 = Range<>.init(_:in:)(v17, v19, v4, v6);
    if ((v21 & 1) != 0)
    {
LABEL_13:
      uint64_t v24 = swift_bridgeObjectRelease(v13);
    }

    else
    {
      uint64_t v22 = v20;
      if ((v13 & 0xC000000000000001LL) != 0) {
        id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v13);
      }
      else {
        id v23 = *(id *)(v13 + 32);
      }
      uint64_t v42 = v23;
      swift_bridgeObjectRelease(v13);
      id v43 = [v42 rangeAtIndex:2];
      uint64_t v45 = v44;

      uint64_t v24 = Range<>.init(_:in:)(v43, v45, v4, v6);
      if ((v47 & 1) == 0)
      {
        uint64_t v48 = v24;
        uint64_t v49 = v46;
        uint64_t v50 = String.subscript.getter(v64, v22, v4, v6);
        uint64_t v52 = v51;
        static String._fromSubstring(_:)(v50);
        uint64_t v54 = v53;
        swift_bridgeObjectRelease(v52);
        uint64_t v55 = String.subscript.getter(v48, v49, v4, v6);
        uint64_t v57 = v56;
        swift_bridgeObjectRelease(v6);
        static String._fromSubstring(_:)(v55);
        uint64_t v59 = v58;
        swift_bridgeObjectRelease(v57);
        uint64_t v60 = sub_10000799C(&qword_100021770);
        uint64_t inited = swift_initStackObject(v60, v67);
        *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_100017CD0;
        *(void *)(inited + 32) = 0x6973726556646C6FLL;
        *(void *)(inited + 40) = 0xEA00000000006E6FLL;
        *(void *)(inited + 48) = String._bridgeToObjectiveC()();
        *(void *)(inited + 56) = 0x697372655677656ELL;
        *(void *)(inited + 64) = 0xEA00000000006E6FLL;
        *(void *)(inited + 72) = String._bridgeToObjectiveC()();
        unint64_t v62 = sub_10000AB0C(inited);
        sub_100012928(0x7463417465737361LL, (void *)0xEE00646574617669LL);
        swift_bridgeObjectRelease(v59);
        swift_bridgeObjectRelease(v54);
        swift_bridgeObjectRelease(v62);
LABEL_15:
        id v29 = objc_msgSend(v0, "defaultManager", v64);
        NSString v30 = String._bridgeToObjectiveC()();
        v66[0] = 0LL;
        unsigned int v31 = [v29 removeItemAtPath:v30 error:v66];

        id v32 = v66[0];
        if (v31)
        {
          id v33 = v66[0];
        }

        else
        {
          id v34 = v66[0];
          uint64_t v35 = _convertNSErrorToError(_:)(v32);

          swift_willThrow();
          uint64_t v37 = static os_log_type_t.error.getter(v36);
          uint64_t v38 = sub_10000799C((uint64_t *)&unk_1000219D0);
          uint64_t v39 = swift_allocObject(v38, 72LL, 7LL);
          *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
          uint64_t v40 = _convertErrorToNSError(_:)(v35);
          *(void *)(v39 + 56) = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
          *(void *)(v39 + 64) = sub_100015980();
          *(void *)(v39 + 32) = v40;
          sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
          unint64_t v41 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:type:_:)( "Could not read version transition file due to %{public}@",  56LL,  2LL,  &_mh_execute_header,  v41,  v37,  v39);
          swift_bridgeObjectRelease(v39);

          swift_errorRelease(v35);
        }

        return;
      }
    }

    uint64_t v25 = static os_log_type_t.fault.getter(v24);
    uint64_t v26 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v27 = swift_allocObject(v26, 72LL, 7LL);
    *(_OWORD *)(v27 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
    *(void *)(v27 + 56) = &type metadata for String;
    *(void *)(v27 + 64) = sub_10000FEBC();
    *(void *)(v27 + 32) = v4;
    *(void *)(v27 + 40) = v6;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v28 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)( "Corrupt version transition string %{public}@",  44LL,  2LL,  &_mh_execute_header,  v28,  v25,  v27);
    swift_bridgeObjectRelease(v27);

    goto LABEL_15;
  }

uint64_t sub_100014F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v27 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  NSString v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = String.utf8CString.getter(a1, a2);
  uint64_t v16 = os_transaction_create(v15 + 32);
  swift_release(v15);
  sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
  id v17 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v18 = (void *)swift_allocObject(&unk_10001D298, 40LL, 7LL);
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = v16;
  aBlock[4] = sub_100015AB8;
  id v29 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100012F28;
  aBlock[3] = &unk_10001D2B0;
  uint64_t v19 = _Block_copy(aBlock);
  uint64_t v20 = v29;
  swift_retain(a4);
  swift_unknownObjectRetain(v16);
  uint64_t v21 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v21);
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v22 = sub_100014770();
  uint64_t v23 = sub_10000799C((uint64_t *)&unk_1000219C0);
  unint64_t v24 = sub_1000147B8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v23, v24, v8, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v14, v10, v19);
  _Block_release(v19);
  swift_unknownObjectRelease(v16);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_100015144(uint64_t a1)
{
  uint64_t v1 = static os_log_type_t.debug.getter(a1);
  uint64_t v2 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  unsigned int v3 = (void *)static OS_os_log.default.getter(v2);
  os_log(_:dso:log:type:_:)( "New asset metadata notification",  31LL,  2LL,  &_mh_execute_header,  v3,  v1,  &_swiftEmptyArrayStorage);

  uint64_t v4 = os_transaction_create("com.apple.tzd.newMetadata");
  uint64_t v5 = swift_allocObject(&unk_10001D220, 24LL, 7LL);
  *(void *)(v5 + swift_weakDestroy(v0 + 16) = v4;
  uint64_t v6 = swift_unknownObjectRetain_n(v4, 2LL);
  uint64_t v7 = static os_log_type_t.debug.getter(v6);
  uint64_t v8 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
  *(void *)(v9 + 56) = &type metadata for String;
  unint64_t v10 = sub_10000FEBC();
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 32) = 0x65736C6166LL;
  *(void *)(v9 + 40) = 0xE500000000000000LL;
  uint64_t v11 = (void *)static OS_os_log.default.getter(v10);
  os_log(_:dso:log:type:_:)( "Beginning advancePipeline with forceCatalogDownload: %{public}@",  63LL,  2LL,  &_mh_execute_header,  v11,  v7,  v9);
  swift_bridgeObjectRelease(v9);

  sub_1000109DC((void (*)(void, void, uint64_t))sub_100015B9C, v5);
  swift_unknownObjectRelease_n(v4, 2LL);
  return swift_release(v5);
}

uint64_t sub_1000152B4(uint64_t a1)
{
  uint64_t v1 = static os_log_type_t.debug.getter(a1);
  uint64_t v2 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  unsigned int v3 = (void *)static OS_os_log.default.getter(v2);
  os_log(_:dso:log:type:_:)( "Asset downloaded notification",  29LL,  2LL,  &_mh_execute_header,  v3,  v1,  &_swiftEmptyArrayStorage);

  uint64_t v4 = os_transaction_create("com.apple.tzd.newAsset");
  uint64_t v5 = swift_allocObject(&unk_10001D270, 24LL, 7LL);
  *(void *)(v5 + swift_weakDestroy(v0 + 16) = v4;
  uint64_t v6 = swift_unknownObjectRetain_n(v4, 2LL);
  uint64_t v7 = static os_log_type_t.debug.getter(v6);
  uint64_t v8 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
  *(void *)(v9 + 56) = &type metadata for String;
  unint64_t v10 = sub_10000FEBC();
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 32) = 0x65736C6166LL;
  *(void *)(v9 + 40) = 0xE500000000000000LL;
  uint64_t v11 = (void *)static OS_os_log.default.getter(v10);
  os_log(_:dso:log:type:_:)( "Beginning advancePipeline with forceCatalogDownload: %{public}@",  63LL,  2LL,  &_mh_execute_header,  v11,  v7,  v9);
  swift_bridgeObjectRelease(v9);

  sub_1000109DC(sub_100015B9C, v5);
  swift_unknownObjectRelease_n(v4, 2LL);
  return swift_release(v5);
}

void sub_100015424(char a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject(&unk_10001D1D0, 24LL, 7LL);
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = a2;
  uint64_t v5 = swift_unknownObjectRetain_n(a2, 2LL);
  uint64_t v6 = static os_log_type_t.debug.getter(v5);
  uint64_t v7 = sub_10000799C((uint64_t *)&unk_1000219D0);
  uint64_t v8 = swift_allocObject(v7, 72LL, 7LL);
  *(_OWORD *)(v8 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
  unint64_t v9 = sub_10000FEBC();
  uint64_t v10 = 1702195828LL;
  if ((a1 & 1) == 0) {
    uint64_t v10 = 0x65736C6166LL;
  }
  unint64_t v11 = 0xE500000000000000LL;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = v9;
  if ((a1 & 1) != 0) {
    unint64_t v11 = 0xE400000000000000LL;
  }
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v11;
  uint64_t v12 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v13 = (void *)static OS_os_log.default.getter(v12);
  os_log(_:dso:log:type:_:)( "Beginning advancePipeline with forceCatalogDownload: %{public}@",  63LL,  2LL,  &_mh_execute_header,  v13,  v6,  v8);
  swift_bridgeObjectRelease(v8);

  if ((a1 & 1) != 0)
  {
    uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___MAAsset);
    NSString v15 = String._bridgeToObjectiveC()();
    if (qword_100021378 != -1) {
      swift_once(&qword_100021378, sub_10000AFEC);
    }
    uint64_t v16 = qword_100022528;
    v21[4] = sub_10000DA74;
    v21[5] = 0LL;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 1107296256LL;
    v21[2] = sub_10000F384;
    v21[3] = &unk_10001D1E8;
    id v17 = _Block_copy(v21);
    [v14 startCatalogDownload:v15 options:v16 then:v17];
    _Block_release(v17);

    uint64_t v19 = static os_log_type_t.debug.getter(v18);
    uint64_t v20 = (void *)static OS_os_log.default.getter(v19);
    os_log(_:dso:log:type:_:)( "Advanced asset pipeline",  23LL,  2LL,  &_mh_execute_header,  v20,  v19,  &_swiftEmptyArrayStorage);
    swift_unknownObjectRelease(a2);
    swift_release(v4);
  }

  else
  {
    sub_1000109DC(sub_100015978, v4);
    swift_unknownObjectRelease(a2);
    swift_release(v4);
  }

BOOL sub_1000156A8(void *a1)
{
  id v3 = [a1 valueForEntitlement:@"com.apple.private.timezoneupdates.tzd.access"];
  id v4 = v3;
  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v9, v3);
    swift_unknownObjectRelease(v4);
    sub_100007BC8((uint64_t)v9, &qword_100021510);
    [a1 setExportedObject:v1];
    id v5 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL___TZUpdateProtocol];
    [a1 setExportedInterface:v5];

    sub_100007C04(0LL, &qword_100021950, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v6 = (void *)static OS_dispatch_queue.main.getter();
    [a1 _setQueue:v6];

    uint64_t v7 = &selRef_resume;
  }

  else
  {
    memset(v9, 0, sizeof(v9));
    sub_100007BC8((uint64_t)v9, &qword_100021510);
    uint64_t v7 = &selRef_invalidate;
  }

  [a1 *v7];
  return v4 != 0LL;
}

BOOL sub_1000157FC()
{
  uint64_t v0 = sub_10000799C((uint64_t *)&unk_1000219F0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000075F8((uint64_t)v14);
  sub_1000159D8((uint64_t)v14, (uint64_t)v16);
  if (!*((void *)&v16[0] + 1)) {
    return 0LL;
  }
  v17[2] = v16[0];
  v17[3] = v16[1];
  v18[0] = v17[0];
  *(_OWORD *)((char *)v18 + 10) = *(_OWORD *)((char *)v17 + 10);
  uint64_t v3 = sub_100006604();
  uint64_t v5 = v4;
  sub_100007A20(v14);
  sub_100007258((uint64_t)v15);
  uint64_t v6 = sub_100006604();
  uint64_t v8 = v7;
  sub_100007AA8(v15);
  v13[2] = v6;
  v13[3] = v8;
  v13[0] = v3;
  v13[1] = v5;
  uint64_t v9 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v2, 1LL, 1LL, v9);
  unint64_t v10 = sub_1000079DC();
  uint64_t v11 = StringProtocol.compare<A>(_:options:range:locale:)( v13,  64LL,  0LL,  0LL,  1LL,  v2,  &type metadata for String,  &type metadata for String,  v10,  v10);
  sub_100007BC8((uint64_t)v2, (uint64_t *)&unk_1000219F0);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v5);
  return v11 == -1;
}

void sub_100015978(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

unint64_t sub_100015980()
{
  unint64_t result = qword_100021500;
  if (!qword_100021500)
  {
    uint64_t v1 = sub_100007C04(255LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100021500);
  }

  return result;
}

uint64_t sub_1000159D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000799C(&qword_1000214E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015A20(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100015A30()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100015A54(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16LL))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100015A68()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100015A8C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100015AB8()
{
  return sub_100013C84( *(void (**)(uint64_t (*)(), uint64_t))(v0 + 16),  *(void *)(v0 + 24),  *(void *)(v0 + 32));
}

uint64_t sub_100015AC4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100015AE8(void *a1)
{
}

xpc_activity_state_t sub_100015AF0(_xpc_activity_s *a1)
{
  return sub_100014100(a1, *(void **)(v1 + 16));
}

uint64_t sub_100015AFC()
{
  swift_unknownObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100015B28()
{
}

BOOL sub_100015BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_10000799C((uint64_t *)&unk_1000219F0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  _OWORD v16[2] = a4;
  v16[3] = a5;
  v16[0] = a1;
  v16[1] = a2;
  uint64_t v12 = type metadata accessor for Locale(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v11, 1LL, 1LL, v12);
  unint64_t v13 = sub_1000079DC();
  uint64_t v14 = StringProtocol.compare<A>(_:options:range:locale:)( v16,  64LL,  0LL,  0LL,  1LL,  v11,  &type metadata for String,  &type metadata for String,  v13,  v13);
  sub_100016610((uint64_t)v11);
  return v14 == -1;
}

uint64_t sub_100015C90(char *a1, uint64_t a2, uint64_t (*a3)(BOOL), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for TimeZone(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2)
  {
    uint64_t v14 = swift_errorRetain(a2);
    uint64_t v15 = static os_log_type_t.fault.getter(v14);
    uint64_t v16 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v17 = swift_allocObject(v16, 72LL, 7LL);
    *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
    uint64_t v18 = _convertErrorToNSError(_:)(a2);
    *(void *)(v17 + 56) = sub_100007C04(0LL, (unint64_t *)&unk_1000219E0, &OBJC_CLASS___NSError_ptr);
    *(void *)(v17 + 64) = sub_100015980();
    *(void *)(v17 + 32) = v18;
    uint64_t v19 = sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v20 = (void *)static OS_os_log.default.getter(v19);
    os_log(_:dso:log:type:_:)( "Unable to fetch time zones from World Clock. Error: %{public}@",  62LL,  2LL,  &_mh_execute_header,  v20,  v15,  v17);
    swift_bridgeObjectRelease(v17);

    a3(0);
    return swift_errorRelease(a2);
  }

  else
  {
    uint64_t v22 = static TimeZone.current.getter(v11);
    uint64_t v23 = TimeZone.identifier.getter(v22);
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(v25);
    if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0) {
      a1 = sub_1000089FC(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
    }
    unint64_t v27 = *((void *)a1 + 2);
    unint64_t v26 = *((void *)a1 + 3);
    if (v27 >= v26 >> 1) {
      a1 = sub_1000089FC((char *)(v26 > 1), v27 + 1, 1, a1);
    }
    *((void *)a1 + 2) = v27 + 1;
    uint64_t v28 = &a1[16 * v27];
    *((void *)v28 + 4) = v23;
    *((void *)v28 + 5) = v25;
    uint64_t v29 = swift_bridgeObjectRelease(v25);
    uint64_t v30 = static os_log_type_t.debug.getter(v29);
    uint64_t v31 = sub_10000799C((uint64_t *)&unk_1000219D0);
    uint64_t v32 = swift_allocObject(v31, 72LL, 7LL);
    *(_OWORD *)(v32 + swift_weakDestroy(v0 + 16) = xmmword_100017CF0;
    *(void *)(v32 + 56) = sub_10000799C(&qword_100021550);
    *(void *)(v32 + 64) = sub_100015FA0();
    *(void *)(v32 + 32) = a1;
    sub_100007C04(0LL, &qword_100021508, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v33 = swift_bridgeObjectRetain(a1);
    id v34 = (void *)static OS_os_log.default.getter(v33);
    os_log(_:dso:log:type:_:)("Zones in use: %@", 16LL, 2LL, &_mh_execute_header, v34, v30, v32);
    swift_bridgeObjectRelease(v32);

    swift_bridgeObjectRetain(a5);
    Swift::Int v35 = sub_100015FEC((uint64_t)a1, a5);
    swift_bridgeObjectRelease(a1);
    uint64_t v36 = *(void *)(v35 + 16);
    swift_release(v35);
    return a3(v36 != 0);
  }

unint64_t sub_100015FA0()
{
  unint64_t result = qword_100021558;
  if (!qword_100021558)
  {
    uint64_t v1 = sub_10000A7E0(&qword_100021550);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021558);
  }

  return result;
}

Swift::Int sub_100015FEC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(_BYTE *)(a2 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (1LL << v4) + 63;
  uint64_t v7 = v6 >> 6;
  size_t v8 = 8 * (v6 >> 6);
  if (v5 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v6 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL), v8);
    Swift::Int v9 = sub_10001616C((unint64_t *)((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v7, v3, a2);
    swift_release(a2);
  }

  else
  {
    uint64_t v10 = (void *)swift_slowAlloc(v8, -1LL);
    bzero(v10, v8);
    Swift::Int v9 = sub_10001616C((unint64_t *)v10, v7, v3, a2);
    swift_release(a2);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return v9;
}

Swift::Int sub_10001616C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  uint64_t v34 = *(void *)(a3 + 16);
  if (!v34)
  {
    uint64_t v28 = 0LL;
    goto LABEL_27;
  }

  uint64_t v36 = a4 + 56;
  uint64_t v33 = a3 + 32;
  swift_bridgeObjectRetain(a3);
  uint64_t v31 = 0LL;
  for (uint64_t i = 0LL; i != v34; ++i)
  {
    uint64_t v7 = (uint64_t *)(v33 + 16 * i);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    Hasher.init(_seed:)(v35, *(void *)(a4 + 40));
    swift_bridgeObjectRetain(v8);
    String.hash(into:)(v35, v9, v8);
    Swift::Int v10 = Hasher._finalize()();
    uint64_t v11 = -1LL << *(_BYTE *)(a4 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = 1LL << v12;
    if (((1LL << v12) & *(void *)(v36 + 8 * (v12 >> 6))) == 0) {
      goto LABEL_3;
    }
    uint64_t v15 = *(void *)(a4 + 48);
    uint64_t v16 = (void *)(v15 + 16 * v12);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v9 && v17 == v8;
    if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v9, v8, 0LL) & 1) == 0)
    {
      uint64_t v22 = ~v11;
      for (unint64_t j = v12 + 1; ; unint64_t j = v24 + 1)
      {
        unint64_t v24 = j & v22;
        uint64_t v25 = (void *)(v15 + 16 * v24);
        uint64_t v26 = v25[1];
        BOOL v27 = *v25 == v9 && v26 == v8;
        if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v25, v26, v9, v8, 0LL) & 1) != 0)
        {
          Swift::Int result = swift_bridgeObjectRelease(v8);
          unint64_t v13 = v24 >> 6;
          uint64_t v14 = 1LL << v24;
          goto LABEL_12;
        }
      }

LABEL_3:
      swift_bridgeObjectRelease(v8);
      continue;
    }

    Swift::Int result = swift_bridgeObjectRelease(v8);
LABEL_12:
    unint64_t v20 = a1[v13];
    a1[v13] = v14 | v20;
    if ((v14 & v20) == 0 && __OFADD__(v31++, 1LL))
    {
      __break(1u);
      return result;
    }
  }

  swift_bridgeObjectRelease(a3);
  uint64_t v5 = a2;
  uint64_t v28 = v31;
LABEL_27:
  swift_retain(a4);
  return sub_10001637C(a1, v5, v28, a4);
}

Swift::Int sub_10001637C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release(v4);
    return (Swift::Int)v8;
  }

  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10000799C(&qword_100021588);
  Swift::Int result = static _SetStorage.allocate(capacity:)(v5);
  uint64_t v8 = (void *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0LL;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0LL;
  Swift::Int v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }

    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1LL)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }

uint64_t sub_100016610(uint64_t a1)
{
  uint64_t v2 = sub_10000799C((uint64_t *)&unk_1000219F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_100016650()
{
  v0._countAndFlagsBits = 0x656E6F7A656D6974LL;
  v0._object = (void *)0xE90000000000002FLL;
  String.append(_:)(v0);
  qword_100022558 = 0x2F62642F7261762FLL;
  unk_100022560 = 0xE800000000000000LL;
}

void sub_1000166B8(int a1)
{
  v1._object = (void *)0x8000000100019520LL;
  v1._countAndFlagsBits = 0xD000000000000010LL;
  sub_1000166E0(a1, v1, &qword_100022568, &qword_100022570);
}

void sub_1000166E0(int a1, Swift::String a2, void *a3, void *a4)
{
  *a3 = 0x6168732F7273752FLL;
  *a4 = 0xEB000000002F6572LL;
}

void sub_10001674C(int a1)
{
  v1._countAndFlagsBits = 7693161LL;
  v1._object = (void *)0xE300000000000000LL;
  sub_1000166E0(a1, v1, &qword_100022578, &qword_100022580);
}

void sub_100016768()
{
  if (qword_1000213B8 != -1) {
    swift_once(&qword_1000213B8, sub_10001674C);
  }
  uint64_t v1 = qword_100022578;
  uint64_t v2 = qword_100022580;
  swift_bridgeObjectRetain(qword_100022580);
  v0._object = (void *)0x8000000100019500LL;
  v0._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v0);
  qword_100022588 = v1;
  unk_100022590 = v2;
}

void sub_1000167F4()
{
  if (qword_1000213A8 != -1) {
    swift_once(&qword_1000213A8, sub_100016650);
  }
  uint64_t v1 = qword_100022558;
  uint64_t v2 = unk_100022560;
  swift_bridgeObjectRetain(unk_100022560);
  v0._countAndFlagsBits = 0x736574616C5F7A74LL;
  v0._object = (void *)0xE900000000000074LL;
  String.append(_:)(v0);
  qword_100022598 = v1;
  unk_1000225A0 = v2;
}

void sub_100016880()
{
  if (qword_1000213A8 != -1) {
    swift_once(&qword_1000213A8, sub_100016650);
  }
  uint64_t v1 = qword_100022558;
  uint64_t v2 = unk_100022560;
  swift_bridgeObjectRetain(unk_100022560);
  v0._countAndFlagsBits = 0x6C635F736465656ELL;
  v0._object = (void *)0xED000070756E6165LL;
  String.append(_:)(v0);
  qword_1000225A8 = v1;
  unk_1000225B0 = v2;
}

void sub_100016914()
{
  if (qword_1000213A8 != -1) {
    swift_once(&qword_1000213A8, sub_100016650);
  }
  uint64_t v1 = qword_100022558;
  uint64_t v2 = unk_100022560;
  swift_bridgeObjectRetain(unk_100022560);
  v0._object = (void *)0x8000000100019540LL;
  v0._countAndFlagsBits = 0xD000000000000013LL;
  String.append(_:)(v0);
  qword_1000225B8 = v1;
  unk_1000225C0 = v2;
}

void sub_1000169A0()
{
  if (qword_1000213A8 != -1) {
    swift_once(&qword_1000213A8, sub_100016650);
  }
  uint64_t v1 = qword_100022558;
  uint64_t v2 = unk_100022560;
  swift_bridgeObjectRetain(unk_100022560);
  v0._countAndFlagsBits = 0x6F666E69656E6F7ALL;
  v0._object = (void *)0xE800000000000000LL;
  String.append(_:)(v0);
  qword_1000225C8 = v1;
  unk_1000225D0 = v2;
}

void sub_100016A28()
{
  if (qword_1000213A8 != -1) {
    swift_once(&qword_1000213A8, sub_100016650);
  }
  uint64_t v1 = qword_100022558;
  uint64_t v2 = unk_100022560;
  swift_bridgeObjectRetain(unk_100022560);
  v0._countAndFlagsBits = 3111540LL;
  v0._object = (void *)0xE300000000000000LL;
  String.append(_:)(v0);
  qword_1000225D8 = v1;
  unk_1000225E0 = v2;
}

uint64_t sub_100016AA8()
{
  uint64_t result = sub_100016AC8();
  qword_1000225E8 = result;
  qword_1000225F0 = v1;
  return result;
}

uint64_t sub_100016AC8()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1000213C0 != -1) {
    swift_once(&qword_1000213C0, sub_100016768);
  }
  URL.init(fileURLWithPath:)(qword_100022588, unk_100022590);
  uint64_t v4 = String.init(contentsOf:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t sub_100016C7C()
{
  unint64_t result = qword_100021768;
  if (!qword_100021768)
  {
    uint64_t v1 = sub_100007C04(255LL, &qword_100021760, &OBJC_CLASS___NSObject_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100021768);
  }

  return result;
}

void sub_100016CD4()
{
  __assert_rtn("-[TZDAssetDetectedMsg writeTo:]", "TZDAssetDetectedMsg.m", 81, "nil != self->_assetVersion");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}
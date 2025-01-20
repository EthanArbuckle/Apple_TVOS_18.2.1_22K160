uint64_t sub_100003190()
{
  return 1LL;
}

void sub_10000320C(int a1, id a2)
{
  id v2 = [a2 role];
  id v3 = objc_allocWithZone(&OBJC_CLASS___UISceneConfiguration);
  sub_100003470(0xD000000000000015LL, 0x800000010000FB90LL, v2);
  sub_1000039A4();
}

id sub_100003338()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

void sub_100003388()
{
  uint64_t v0 = type metadata accessor for AppDelegate();
  uint64_t v1 = static CommandLine.unsafeArgv.getter();
  uint64_t v2 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  uint64_t v3 = static CommandLine.argc.getter(v2);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v0);
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v8 = v7;

  LODWORD(v5) = UIApplicationMain(_:_:_:_:)(v3, v1, 0LL, 0LL, v6, v8);
  swift_bridgeObjectRelease(v8);
  exit((int)v5);
}

id sub_100003410()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService11AppDelegate);
}

id sub_100003470(uint64_t a1, uint64_t a2, void *a3)
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

  id v7 = [v3 initWithName:v6 sessionRole:a3];

  return v7;
}

unint64_t sub_1000034DC()
{
  unint64_t result = qword_100019FD0;
  if (!qword_100019FD0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UISceneSession);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019FD0);
  }

  return result;
}

void type metadata accessor for LaunchOptionsKey()
{
  if (!qword_100019FE8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100014890);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100019FE8);
    }
  }
}

void sub_100003560()
{
}

uint64_t sub_100003580(uint64_t a1)
{
  return sub_100003588(a1, *v1);
}

uint64_t sub_100003588(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000035C8(uint64_t a1)
{
  return sub_1000035D0(a1, *v1);
}

Swift::Int sub_1000035D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

void sub_100003640()
{
}

void sub_100003660(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  a2(v3);
  swift_bridgeObjectRelease(v5);
  sub_1000039A4();
}

uint64_t sub_100003698(uint64_t a1, id *a2)
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

uint64_t sub_100003710(uint64_t a1, id *a2)
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

NSString sub_10000378C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_1000037B0(a1);
  *a2 = result;
  return result;
}

NSString sub_1000037B0(uint64_t a1)
{
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

uint64_t sub_1000037E4(uint64_t *a1, uint64_t *a2)
{
  return sub_100005668(*a1, *a2);
}

uint64_t sub_1000037F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100003834@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003860(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_100003968( &qword_10001A008,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_10000F3F8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

void sub_1000038E4()
{
}

void sub_100003910()
{
}

void sub_10000393C()
{
}

void sub_100003968(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_1000039A4();
}

  ;
}

uint64_t sub_1000039AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!v7) {
    return 0LL;
  }
  sub_1000040A4();
  sub_1000045A8();
  if ((v3 & 1) == 0) {
    return 1LL;
  }
  uint64_t v8 = sub_100003E00(a1, a2, a3);
  uint64_t v9 = sub_100003A40(v8);
  swift_bridgeObjectRelease(v8);
  return v9;
}

uint64_t sub_100003A40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100004138(&qword_10001A138);
    char v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    char v3 = &_swiftEmptyDictionarySingleton;
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
    v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_10000450C(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v41);
    *(void *)&__int128 v40 = v18;
    *((void *)&v40 + 1) = v17;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v18;
    *((void *)&v38[0] + 1) = v17;
    swift_bridgeObjectRetain(v17);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_1000042DC(v39, v33);
    __int128 v34 = v30;
    __int128 v35 = v31;
    uint64_t v36 = v32;
    sub_1000042DC(v33, v37);
    __int128 v30 = v34;
    __int128 v31 = v35;
    uint64_t v32 = v36;
    sub_1000042DC(v37, v38);
    sub_1000042DC(v38, &v34);
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
    uint64_t result = (uint64_t)sub_1000042DC(&v34, (_OWORD *)(v3[7] + 32 * v22));
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
    sub_100004548(a1);
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

        __break(1u);
        goto LABEL_25;
      }

LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100003E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004138(&qword_10001A128);
  uint64_t inited = swift_initStackObject(v6, v16);
  *(_OWORD *)(inited + 16) = xmmword_10000F4F0;
  strcpy((char *)(inited + 32), "nativeHandling");
  *(_BYTE *)(inited + 47) = -18;
  uint64_t v8 = URL.scheme.getter();
  sub_10000402C(v8, v9);
  uint64_t v10 = sub_1000045A8();
  *(_BYTE *)(inited + 48) = v3 & 1;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 0x656372756F73LL;
  *(void *)(inited + 88) = 0xE600000000000000LL;
  *(void *)(inited + 96) = 0xD000000000000018LL;
  *(void *)(inited + 104) = 0x800000010000F4E0LL;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x707954746E657665LL;
  *(void *)(inited + 136) = 0xE900000000000065LL;
  *(void *)(inited + 144) = 1802398060LL;
  *(void *)(inited + 152) = 0xE400000000000000LL;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 176) = 7107189LL;
  *(void *)(inited + 184) = 0xE300000000000000LL;
  uint64_t v11 = URL.absoluteString.getter(v10);
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 192) = v11;
  *(void *)(inited + 200) = v12;
  uint64_t v17 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  if (a3)
  {
    *((void *)&v15 + 1) = &type metadata for String;
    *(void *)&__int128 v14 = a2;
    *((void *)&v14 + 1) = a3;
  }

  else
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
  }

  swift_bridgeObjectRetain(a3);
  sub_100003FAC((uint64_t)&v14, 0x7250656372756F73LL, 0xED0000737365636FLL);
  return v17;
}

uint64_t sub_100003FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1000042DC((_OWORD *)a1, v6);
    sub_1000042EC(v6, a2, a3);
    return swift_bridgeObjectRelease(a3);
  }

  else
  {
    sub_100004178(a1);
    sub_1000041B8(a2, a3, v6);
    swift_bridgeObjectRelease(a3);
    return sub_100004178((uint64_t)v6);
  }

void sub_10000402C(uint64_t a1, uint64_t a2)
{
  if (!a2
    || ((sub_1000045B4(), v5) ? (BOOL v5 = v4 == 0xE600000000000000LL) : (BOOL v5 = 0),
        v5 || (sub_100004550() & 1) != 0 || (a1 == 0x69752D736D61LL ? (BOOL v6 = a2 == 0xE600000000000000LL) : (BOOL v6 = 0), v6)))
  {
    sub_10000459C();
  }

  else
  {
    uint64_t v7 = sub_100004570();
    sub_100004590(v7, v8, v9, v10, v11);
  }

void sub_1000040A4()
{
  BOOL v2 = v2 && v1 == 0xE600000000000000LL;
  if (v2
    || ((uint64_t v3 = v1, v4 = v0, v5 = sub_100004550(), v4 == 0x69752D736D61LL) ? (v6 = v3 == 0xE600000000000000LL) : (v6 = 0),
        !v6 ? (char v7 = 0) : (char v7 = 1),
        (v5 & 1) != 0 || (v7 & 1) != 0))
  {
    sub_10000459C();
  }

  else
  {
    uint64_t v8 = sub_100004570();
    sub_100004590(v8, v9, v10, v11, v12);
  }

uint64_t sub_100004108()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for EngagementDeepLinkController()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService28EngagementDeepLinkController);
}

uint64_t sub_100004138(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004178(uint64_t a1)
{
  uint64_t v2 = sub_100004138((uint64_t *)&unk_10001A570);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

double sub_1000041B8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_10000B2F0(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v16 = *v4;
    uint64_t v12 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    Swift::Int v13 = *(void *)(v12 + 24);
    sub_100004138(&qword_10001A130);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(void *)(*(void *)(v16 + 48) + 16 * v9 + 8));
    sub_1000042DC((_OWORD *)(*(void *)(v16 + 56) + 32 * v9), a3);
    _NativeDictionary._delete(at:)( v9,  v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    uint64_t v14 = *v4;
    *uint64_t v4 = v16;
    swift_bridgeObjectRelease(v14);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

_OWORD *sub_1000042DC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000042EC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_100004368(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *v3;
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

_OWORD *sub_100004368(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10000B2F0(a2, a3);
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
  sub_100004138(&qword_10001A130);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10000B2F0(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if ((v17 & 1) != 0)
  {
    unint64_t v21 = (void *)(v20[7] + 32 * v16);
    sub_1000044EC(v21);
    return sub_1000042DC(a1, v21);
  }

  else
  {
    sub_100004484(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain(a3);
  }

_OWORD *sub_100004484(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  BOOL v6 = (void *)(a5[6] + 16 * a1);
  *BOOL v6 = a2;
  v6[1] = a3;
  double result = sub_1000042DC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_1000044EC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000450C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004548(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100004550()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(0x65752D736D61LL, 0xE600000000000000LL, v1, v0, 0LL);
}

uint64_t sub_100004570()
{
  return 0x69752D736D61LL;
}

uint64_t sub_100004590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, a5);
}

  ;
}

uint64_t sub_1000045A8()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

id sub_1000045C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  objc_allocWithZone(&OBJC_CLASS____UIContentUnavailableView);
  BOOL v9 = v3;
  uint64_t v10 = sub_100005308();
  id result = sub_100005170(v13, v14, v15, v16, v10, v11, v12);
  if (result)
  {
    *(void *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView] = result;
    *(void *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_error] = a1;
    unint64_t v18 = (uint64_t *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction];
    *unint64_t v18 = a2;
    v18[1] = a3;
    swift_errorRetain(a1);
    sub_100005208(a2, a3);

    char v19 = (objc_class *)type metadata accessor for ErrorViewController();
    v47.receiver = v9;
    v47.super_class = v19;
    id v20 = objc_msgSendSuper2(&v47, "initWithNibName:bundle:", 0, 0);
    uint64_t v21 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v22 = type metadata accessor for LogMessage(0LL);
    uint64_t v23 = swift_allocObject( v21,  ((*(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v22 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v22 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v23 + 16) = xmmword_10000F540;
    v46 = v19;
    v45[0] = v20;
    id v24 = v20;
    id v25 = (id)AMSLogKey(v24);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      uint64_t v41 = a1;
      id v28 = v24;
      uint64_t v29 = a2;
      uint64_t v30 = a3;
      uint64_t v32 = v31;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      sub_1000052E8();
      sub_1000052C4();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_1000052B0(MetatypeMetadata);
      sub_100005330();
      v34._countAndFlagsBits = 5972026LL;
      v34._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v34);
      v44[3] = &type metadata for String;
      v44[0] = v27;
      v44[1] = v32;
      a3 = v30;
      a2 = v29;
      id v24 = v28;
      a1 = v41;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v44);
      sub_100005330();
      uint64_t v35 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      sub_1000052E8();
      sub_1000052C4();
      uint64_t v36 = swift_getMetatypeMetadata();
      sub_1000052B0(v36);
      sub_100005330();
      uint64_t v35 = 58LL;
    }

    unint64_t v37 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v35);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_1000044EC(v45);
    LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010000FCB0LL);
    swift_getErrorValue(a1, v43, v42);
    uint64_t v38 = Error.localizedDescription.getter(v42[1], v42[2]);
    v46 = (objc_class *)&type metadata for String;
    v45[0] = v38;
    v45[1] = v39;
    static LogMessage.safe(_:)(v45);
    sub_100004178((uint64_t)v45);
    sub_1000053FC(v23);
    sub_10000523C(a2, a3);
    swift_errorRelease(a1);
    swift_bridgeObjectRelease(v23);

    return v24;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1000048D0()
{
  id v1 = objc_allocWithZone(&OBJC_CLASS____UIContentUnavailableView);
  uint64_t v2 = sub_100005308();
  id v9 = sub_100005170(v5, v6, v7, v8, v2, v3, v4);
  if (!v9) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView] = v9;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010000FDA0LL,  "AMSEngagementViewService/ErrorViewController.swift",  50LL,  2LL,  47LL,  0);
  __break(1u);
}

id sub_1000049B0(uint64_t a1)
{
  id v2 = sub_100005338(a1, "parentViewController");
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 navigationItem];

    return v4;
  }

  else
  {
    v6.receiver = v1;
    v6.super_class = (Class)type metadata accessor for ErrorViewController();
    return objc_msgSendSuper2(&v6, "navigationItem");
  }

void sub_100004A38()
{
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for ErrorViewController();
  id v7 = sub_100005300((uint64_t)v10.super_class, "loadView", v1, v2, v3, v4, v5, v6, v10);
  id v8 = sub_100005338((uint64_t)v7, "view");
  id v9 = objc_msgSend((id)objc_opt_self(UIColor), "ams_primaryBackground");
  sub_100005290((uint64_t)v9, "setBackgroundColor:");
}

void sub_100004AF0()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ErrorViewController();
  sub_100005300((uint64_t)v7.super_class, "viewDidLoad", v1, v2, v3, v4, v5, v6, v7);
  sub_100004C30();
}

id sub_100004B54()
{
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for ErrorViewController();
  id v7 = sub_100005300((uint64_t)v19.super_class, "viewWillLayoutSubviews", v1, v2, v3, v4, v5, v6, v19);
  id v8 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView];
  id v9 = sub_100005338((uint64_t)v7, "view");
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  return objc_msgSend(v8, "setFrame:", v11, v13, v15, v17);
}

void sub_100004C30()
{
  uint64_t v1 = sub_100005348(0xD000000000000015LL, (void *)0x800000010000FCD0LL);
  uint64_t v3 = v2;
  uint64_t v4 = sub_100005348(0xD000000000000014LL, (void *)0x800000010000FCF0LL);
  uint64_t v6 = v5;
  sub_100004D1C(v1, v3, 0LL, 0LL, v4, v5);
  swift_bridgeObjectRelease(v3);
  uint64_t v7 = swift_bridgeObjectRelease(v6);
  id v8 = sub_1000052F8(v7, "view");
  [v8 addSubview:*(void *)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView)];
}

void sub_100004D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v14 = sub_1000052F8(a1, "buttonTitle");
  if (v14)
  {
    sub_100005328((uint64_t)v14);
    sub_1000052A4();
    if (!a6)
    {
LABEL_31:
      sub_10000529C();
      goto LABEL_32;
    }

    if (v8 == a5 && v7 == a6)
    {
      id v14 = (id)sub_10000529C();
    }

    else
    {
      char v16 = sub_100005340(v8, v7, a5, a6);
      id v14 = (id)sub_10000529C();
      if ((v16 & 1) == 0) {
        goto LABEL_32;
      }
    }
  }

  else if (a6)
  {
    goto LABEL_32;
  }

  id v17 = sub_1000052F8((uint64_t)v14, "message");
  if (!v17)
  {
    if (!a4) {
      goto LABEL_23;
    }
LABEL_32:
    uint64_t v23 = swift_allocObject(&unk_100014968, 24LL, 7LL);
    swift_unknownObjectWeakInit(v23 + 16, v6);
    aBlock[4] = sub_100005270;
    uint64_t v34 = v23;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100007704;
    aBlock[3] = &unk_100014980;
    id v24 = _Block_copy(aBlock);
    uint64_t v25 = swift_release(v34);
    sub_100005290(v25, "setButtonAction:");
    _Block_release(v24);
    if (a6)
    {
      NSString v26 = String._bridgeToObjectiveC()();
      uint64_t v27 = v26;
    }

    else
    {
      uint64_t v27 = 0LL;
    }

    sub_100005290((uint64_t)v26, "setButtonTitle:");

    if (a4)
    {
      NSString v28 = String._bridgeToObjectiveC()();
      uint64_t v29 = v28;
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    sub_100005290((uint64_t)v28, "setMessage:");

    if (a2)
    {
      NSString v30 = String._bridgeToObjectiveC()();
      uint64_t v31 = v30;
    }

    else
    {
      uint64_t v31 = 0LL;
    }

    sub_100005290((uint64_t)v30, "setTitle:");

    return;
  }

  sub_100005328((uint64_t)v17);
  sub_1000052A4();
  if (!a4) {
    goto LABEL_31;
  }
  if (v8 == a3 && v7 == a4)
  {
    id v17 = (id)sub_10000529C();
  }

  else
  {
    char v19 = sub_100005340(v8, v7, a3, a4);
    id v17 = (id)sub_10000529C();
    if ((v19 & 1) == 0) {
      goto LABEL_32;
    }
  }

LABEL_23:
  id v20 = sub_1000052F8((uint64_t)v17, "title");
  if (!v20)
  {
    if (!a2) {
      return;
    }
    goto LABEL_32;
  }

  sub_100005328((uint64_t)v20);
  sub_1000052A4();
  if (!a2) {
    goto LABEL_31;
  }
  if (v8 == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease(v7);
    return;
  }

  char v22 = sub_100005340(v8, v7, a1, a2);
  sub_10000529C();
  if ((v22 & 1) == 0) {
    goto LABEL_32;
  }
}

      __break(1u);
      goto LABEL_24;
    }

    __break(1u);
    goto LABEL_23;
  }

  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }

  if (a4 < 0) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = a4 & 0xFFFFFFFFFFFFFF8LL;
  }
  id v9 = __CocoaSet.element(at:)(a1, a2, v8);
  uint64_t v21 = v9;
  double v10 = sub_100007230(0LL, &qword_10001A778, &OBJC_CLASS___NSUserActivity_ptr);
  swift_unknownObjectRetain(v9);
  swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
  swift_unknownObjectRelease(v9);
}

void sub_100004FCC(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    uint64_t v4 = *(void (**)(void))(Strong + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction);
    uint64_t v5 = *(void *)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction + 8);
    sub_100005208((uint64_t)v4, v5);

    if (v4)
    {
      v4();
      sub_10000523C((uint64_t)v4, v5);
    }
  }

void sub_100005050()
{
}

void sub_100005088()
{
}

id sub_1000050D8()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ErrorViewController();
  return sub_100005300((uint64_t)v8.super_class, "dealloc", v1, v2, v3, v4, v5, v6, v8);
}

uint64_t type metadata accessor for ErrorViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService19ErrorViewController);
}

id sub_100005170(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a6)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }

  else
  {
    NSString v14 = 0LL;
  }

  id v15 = objc_msgSend(v7, "initWithFrame:title:style:", v14, a7, a1, a2, a3, a4);

  return v15;
}

uint64_t sub_100005208(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

void *sub_100005218(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000523C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_10000524C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100005270()
{
}

uint64_t sub_100005278(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005288(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_100005290(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_10000529C()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_1000052A4()
{
}

uint64_t sub_1000052B0(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 160);
}

uint64_t sub_1000052C4()
{
  uint64_t v1 = *(void *)(v0 - 104);
  uint64_t v2 = sub_100005218((void *)(v0 - 128), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

void sub_1000052E8()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

id sub_1000052F8(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

id sub_100005300( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t sub_100005308()
{
  return 0LL;
}

uint64_t sub_100005328(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_100005330()
{
  return sub_100004178(v0 - 160);
}

id sub_100005338(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100005340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
}

uint64_t sub_100005348(uint64_t a1, void *a2)
{
  uint64_t v4 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
  v9._object = (void *)0xE000000000000000LL;
  v5._uint64_t countAndFlagsBits = a1;
  v5._object = a2;
  v6._uint64_t countAndFlagsBits = 0LL;
  v6._object = (void *)0xE000000000000000LL;
  v9._uint64_t countAndFlagsBits = 0LL;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, v4, v6, v9)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t type metadata accessor for Localizations()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService13Localizations);
}

uint64_t sub_1000053FC(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.error.getter();
  return sub_100005660(v2, a1);
}

uint64_t sub_10000541C()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000025LL,  0x800000010000FE30LL,  0x6C6172656E6567LL,  0xE700000000000000LL);
  qword_10001A218 = result;
  return result;
}

uint64_t sub_100005478(uint64_t a1, uint64_t a2)
{
  if (qword_100019E20 != -1) {
    swift_once(&qword_100019E20, sub_10000541C);
  }
  uint64_t v4 = qword_10001A218;
  uint64_t result = os_log_type_enabled((os_log_t)qword_10001A218, (os_log_type_t)a1);
  if ((_DWORD)result)
  {
    char v6 = static LogMessage.isRedactionEnabled.getter();
    uint64_t v7 = static LogMessage.describe(contentsOf:withRedaction:separator:)(a2, v6 & 1, 32LL, 0xE100000000000000LL);
    uint64_t v9 = v8;
    uint64_t v10 = sub_100004138(&qword_10001A2B8);
    uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
    *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000F590;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_1000055E8();
    *(void *)(v11 + 32) = v7;
    *(void *)(v11 + 40) = v9;
    os_log(_:dso:log:type:_:)("%{public}@", 10LL, 2LL, &_mh_execute_header, v4, a1, v11);
    return swift_bridgeObjectRelease(v11);
  }

  return result;
}

uint64_t sub_100005588(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.default.getter();
  return sub_100005660(v2, a1);
}

uint64_t sub_1000055A8(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.info.getter();
  return sub_100005660(v2, a1);
}

uint64_t type metadata accessor for Log()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService3Log);
}

unint64_t sub_1000055E8()
{
  unint64_t result = qword_10001A2C0;
  if (!qword_10001A2C0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001A2C0);
  }

  return result;
}

unint64_t sub_100005624()
{
  unint64_t result = qword_10001A2C8;
  if (!qword_10001A2C8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A2C8);
  }

  return result;
}

uint64_t sub_100005660(uint64_t a1, uint64_t a2)
{
  return sub_100005478(a1, a2);
}

uint64_t sub_100005668(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
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

BOOL sub_1000056EC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1000056F8(int a1, Swift::UInt a2)
{
}

Swift::Int sub_10000571C(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_100005760()
{
  return sub_10000571C(*v0);
}

void sub_100005768(int a1)
{
}

Swift::Int sub_100005770(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_1000057B0(uint64_t *a1, uint64_t *a2)
{
  return sub_1000056EC(*a1, *a2);
}

unint64_t sub_1000057C0()
{
  unint64_t result = qword_10001A2D0;
  if (!qword_10001A2D0)
  {
    unint64_t result = swift_getWitnessTable("!T", &type metadata for RemoteAlertButtonAction);
    atomic_store(result, (unint64_t *)&qword_10001A2D0);
  }

  return result;
}

ValueMetadata *type metadata accessor for RemoteAlertButtonAction()
{
  return &type metadata for RemoteAlertButtonAction;
}

unint64_t sub_100005810()
{
  unint64_t result = qword_10001A2D8;
  if (!qword_10001A2D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000F680, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001A2D8);
  }

  return result;
}

Swift::Int sub_10000584C(uint64_t a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

uint64_t sub_10000588C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0LL;
      }
      v2 |= v4;
      --v1;
    }

    while (v1);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  swift_bridgeObjectRelease(a1);
  return v2;
}

void *sub_1000058DC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000058E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000590C();
  *a1 = result;
  return result;
}

uint64_t sub_10000590C()
{
  return 0LL;
}

uint64_t sub_100005914@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005940(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100005940(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_100005948@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005974(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100005974(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_10000597C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000059A8(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1000059A8(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_1000059B0(void *a1, uint64_t *a2)
{
  return sub_1000059B8(a1, *a2);
}

BOOL sub_1000059B8(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1000059E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100005A14(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_100005A14(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_100005A38@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100005A68(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_100005A68(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_100005A80(uint64_t *a1)
{
  return sub_100005A88(*a1);
}

uint64_t sub_100005A88(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_100005A98(uint64_t *a1)
{
  return sub_100005AA0(*a1);
}

uint64_t sub_100005AA0(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_100005AB0(uint64_t *a1)
{
  return sub_100005AB8(*a1);
}

uint64_t sub_100005AB8(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_100005AC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005AF4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100005AF4(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_100005AFC(uint64_t *a1)
{
  return sub_100005B08(*a1, *v1);
}

BOOL sub_100005B08(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_100005B14(uint64_t *a1)
{
  return sub_100005B20(*a1, *v1);
}

BOOL sub_100005B20(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_100005B2C(uint64_t *a1)
{
  return sub_100005B38(*a1, *v1);
}

BOOL sub_100005B38(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_100005B44()
{
  return sub_100005B4C(*v0);
}

BOOL sub_100005B4C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_100005B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100005B70(uint64_t *a1)
{
  return sub_100005B78(*a1);
}

uint64_t sub_100005B78(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

void *sub_100005B88@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005B98(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005BA4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000588C(a1);
  *a2 = result;
  return result;
}

Swift::Int sub_100005BC8(uint64_t a1)
{
  return sub_10000584C(a1, *v1);
}

ValueMetadata *type metadata accessor for RemoteAlertButtonActionEvents()
{
  return &type metadata for RemoteAlertButtonActionEvents;
}

unint64_t sub_100005BE4()
{
  unint64_t result = qword_10001A2E0;
  if (!qword_10001A2E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000F6D0, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001A2E0);
  }

  return result;
}

unint64_t sub_100005C24()
{
  unint64_t result = qword_10001A2E8;
  if (!qword_10001A2E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000F700, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001A2E8);
  }

  return result;
}

unint64_t sub_100005C64()
{
  unint64_t result = qword_10001A2F0;
  if (!qword_10001A2F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000F738, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001A2F0);
  }

  return result;
}

BOOL sub_100005CA4(char a1, char a2)
{
  return a1 == a2;
}

void sub_100005CB4(uint64_t a1, unsigned __int8 a2)
{
}

void sub_100005CD8(uint64_t a1)
{
}

BOOL sub_100005D08(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100005D18(uint64_t a1, char a2)
{
}

void sub_100005D3C(uint64_t a1)
{
}

BOOL sub_100005D6C(char *a1, char *a2)
{
  return sub_100005CA4(*a1, *a2);
}

void sub_100005D78()
{
}

void sub_100005D80(uint64_t a1)
{
}

Swift::Int sub_100005D88(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_100005DD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100005D08(*a1, *a2);
}

void sub_100005DE4()
{
}

void sub_100005DEC(uint64_t a1)
{
}

uint64_t sub_100005DF4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1)
  {
    int v8 = 1;
    int v7 = 3;
    return v7 | (v8 << 8);
  }

  if (a1 == 1)
  {
    int v7 = 1;
LABEL_4:
    int v8 = 1;
    return v7 | (v8 << 8);
  }

  v72[0] = (id)0xD000000000000015LL;
  v72[1] = (id)0x800000010000FF80LL;
  sub_1000075E0();
  sub_1000075C8();
  uint64_t v9 = sub_100007678();
  if (!v76)
  {
    sub_1000075D8();
    goto LABEL_10;
  }

  uint64_t v12 = sub_1000075B4(v9, v10, v11, (uint64_t)&type metadata for Data);
  if ((v12 & 1) == 0)
  {
LABEL_10:
    int v8 = 1;
    int v7 = 2;
    return v7 | (v8 << 8);
  }

  id v14 = v72[0];
  id v13 = v72[1];
  uint64_t v15 = sub_1000075EC(v12, &qword_10001A490, &OBJC_CLASS___NSKeyedUnarchiver_ptr);
  uint64_t v16 = sub_1000075EC(v15, &qword_10001A498, &OBJC_CLASS___AMSEngagementRequest_ptr);
  id v17 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v16, v14, v13, v16);
  uint64_t v70 = (uint64_t)v14;
  unint64_t v71 = (unint64_t)v13;
  if (!v17)
  {
    sub_1000076E4();
    goto LABEL_10;
  }

  id v69 = v17;
  strcpy((char *)v72, "bagData");
  v72[1] = (id)0xE700000000000000LL;
  sub_1000075E0();
  sub_1000075C8();
  uint64_t v19 = sub_100007678();
  if (!v76)
  {
    sub_1000075D8();
LABEL_19:
    id v25 = [(id)objc_opt_self(AMSUIEngagementTask) createBagForSubProfile];
    goto LABEL_20;
  }

  uint64_t v22 = sub_1000075B4(v19, v20, v21, (uint64_t)&type metadata for Data);
  if ((v22 & 1) == 0) {
    goto LABEL_19;
  }
  id v23 = v72[0];
  id v24 = v72[1];
  sub_1000075EC(v22, &qword_10001A4B0, &OBJC_CLASS___AMSSnapshotBag_ptr);
  id v25 = sub_1000064A4((uint64_t)v23, (unint64_t)v24);
  if (!v25) {
    goto LABEL_19;
  }
LABEL_20:
  strcpy((char *)v72, "clientInfoData");
  HIBYTE(v72[1]) = -18;
  sub_1000075E0();
  sub_1000075C8();
  uint64_t v26 = sub_100007678();
  id v68 = v25;
  if (!v76)
  {
    sub_1000075D8();
    goto LABEL_24;
  }

  uint64_t v29 = sub_1000075B4(v26, v27, v28, (uint64_t)&type metadata for Data);
  if ((v29 & 1) == 0)
  {
LABEL_24:
    uint64_t v67 = 0LL;
    goto LABEL_25;
  }

  id v31 = v72[0];
  id v30 = v72[1];
  uint64_t v32 = sub_1000075EC(v29, &qword_10001A4A0, &OBJC_CLASS___AMSProcessInfo_ptr);
  uint64_t v64 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v32, v31, v30, v32);
  sub_10000762C();
  uint64_t v67 = v64;
  id v25 = v68;
  if (!v64)
  {
    sub_1000076E4();

    swift_unknownObjectRelease(v25);
    int v7 = 0;
    goto LABEL_4;
  }

LABEL_25:
  strcpy((char *)v72, "attachedToApp");
  HIWORD(v72[1]) = -4864;
  sub_1000075E0();
  sub_1000075C8();
  uint64_t v33 = sub_100007678();
  if (!v76)
  {
    sub_1000075D8();
    goto LABEL_29;
  }

  uint64_t v34 = sub_1000075EC(v33, &qword_10001A4A8, &OBJC_CLASS___NSNumber_ptr);
  if ((sub_1000075B4(v34, v35, v36, v34) & 1) == 0)
  {
LABEL_29:
    unsigned __int8 v38 = 0;
    goto LABEL_30;
  }

  id v37 = v72[0];
  unsigned __int8 v38 = [v72[0] BOOLValue];

LABEL_30:
  uint64_t v39 = sub_100004138((uint64_t *)&unk_10001A470);
  uint64_t v40 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v41 = swift_allocObject( v39,  ((*(unsigned __int8 *)(v40 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))
        + 10LL * *(void *)(v40 + 72),
          *(unsigned __int8 *)(v40 + 80) | 7LL);
  *(_OWORD *)(v41 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAB0;
  *((void *)&v74 + Hasher._combine(_:)(v1 & 1) = type metadata accessor for RemoteEngagementPresenter();
  *(void *)&__int128 v73 = v2;
  uint64_t v42 = swift_retain(v2);
  id v43 = (id)AMSLogKey(v42);
  if (v43)
  {
    v44 = v43;
    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
    uint64_t v46 = v45;

    sub_1000076D0();
    sub_100007648();
    sub_100007608();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000075F4(MetatypeMetadata);
    sub_1000075D8();
    sub_100007638();
    v76 = &type metadata for String;
    v75[0] = v65;
    v75[1] = v46;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v75);
    sub_1000075D8();
    uint64_t v48 = 93LL;
  }

  else
  {
    sub_1000076EC();
    sub_100007648();
    sub_100007608();
    uint64_t v49 = swift_getMetatypeMetadata();
    sub_1000075F4(v49);
    sub_1000075D8();
    uint64_t v48 = 58LL;
  }

  unint64_t v50 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v48);
  LogMessage.init(stringInterpolation:)(v6);
  sub_1000044EC(&v73);
  LogMessage.init(stringLiteral:)(0xD000000000000018LL, 0x800000010000FFA0LL);
  LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x800000010000FFC0LL);
  *((void *)&v74 + Hasher._combine(_:)(v1 & 1) = v16;
  *(void *)&__int128 v73 = v69;
  id v51 = v69;
  sub_1000076C4();
  sub_100007680();
  LogMessage.init(stringLiteral:)(0x3A676162202CLL, 0xE600000000000000LL);
  uint64_t v66 = v41;
  if (v25)
  {
    *((void *)&v74 + Hasher._combine(_:)(v1 & 1) = swift_getObjectType(v25);
    *(void *)&__int128 v73 = v25;
    id v52 = v25;
  }

  else
  {
    id v52 = 0LL;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
  }

  uint64_t v53 = v70;
  unint64_t v54 = v71;
  v55 = (void *)v67;
  swift_unknownObjectRetain(v52);
  sub_1000076C4();
  sub_100007680();
  uint64_t v56 = LogMessage.init(stringLiteral:)(0x746E65696C63202CLL, 0xEE003A6F666E6920LL);
  unsigned __int8 v57 = v38;
  if (v55)
  {
    *((void *)&v74 + Hasher._combine(_:)(v1 & 1) = sub_1000075EC(v56, &qword_10001A4A0, &OBJC_CLASS___AMSProcessInfo_ptr);
    *(void *)&__int128 v73 = v55;
    v58 = v55;
  }

  else
  {
    v58 = 0LL;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
  }

  type metadata accessor for Log();
  id v59 = v58;
  static LogMessage.safe(_:)(&v73);
  sub_100007680();
  LogMessage.init(stringLiteral:)(0x686361747461202CLL, 0xEC000000203A6465LL);
  *((void *)&v74 + Hasher._combine(_:)(v1 & 1) = &type metadata for Bool;
  LOBYTE(v73) = v57;
  static LogMessage.safe(_:)(&v73);
  sub_100007680();
  uint64_t v60 = v66;
  sub_100005588(v66);
  sub_1000071EC(v53, v54);
  swift_bridgeObjectRelease(v60);
  *(_BYTE *)(v2 + 24) = v57;
  uint64_t v61 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = v68;
  swift_unknownObjectRelease(v61);
  v62 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v55;

  v63 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = v69;

  int v7 = 0;
  int v8 = 0;
  return v7 | (v8 << 8);
}

id sub_1000064A4(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v7 = [v5 initWithData:isa];
  sub_1000071EC(a1, a2);

  return v7;
}

void sub_100006518()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v3);
  id v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (uint64_t (*)())v2[4];
  if (v6 && (id v7 = (void *)v2[7]) != 0LL)
  {
    int v8 = (void *)v2[5];
    uint64_t v9 = sub_1000076B8((uint64_t)&unk_100014C10);
    sub_100007668(v9);
    id v37 = v7;
    unsigned __int8 v38 = v6;
    uint64_t v39 = (uint64_t)v8;
    uint64_t v40 = (uint64_t)sub_100007174;
    uint64_t v41 = v1;
    char v42 = 1;
    id v10 = v8;
    swift_retain(v1);
    swift_unknownObjectRetain(v6);
    uint64_t v11 = v7;
    SyncEvent.post(_:)(&v37);
    sub_1000076F8();

    swift_unknownObjectRelease(v6);
  }

  else
  {
    uint64_t v12 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v14 = *(void *)(v13 + 72);
    uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
    uint64_t v16 = (v15 + 32) & ~v15;
    uint64_t v17 = swift_allocObject(v12, v16 + 2 * v14, v15 | 7);
    *(_OWORD *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAC0;
    uint64_t v18 = v17 + v16;
    uint64_t v40 = type metadata accessor for RemoteEngagementPresenter();
    id v37 = v2;
    uint64_t v19 = swift_retain(v2);
    id v20 = (id)AMSLogKey(v19);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      uint64_t v24 = v23;

      sub_1000076D0();
      sub_1000076AC();
      uint64_t v25 = v40;
      uint64_t v26 = sub_100005218(&v37, v40);
      uint64_t DynamicType = swift_getDynamicType(v26, v25, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v43 = DynamicType;
      sub_1000076A4();
      sub_10000769C();
      sub_100007638();
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v43 = v22;
      uint64_t v44 = v24;
      sub_1000076A4();
      sub_10000769C();
      uint64_t v28 = 93LL;
    }

    else
    {
      sub_1000076EC();
      sub_1000076AC();
      uint64_t v29 = v40;
      id v30 = sub_100005218(&v37, v40);
      uint64_t v31 = swift_getDynamicType(v30, v29, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v43 = v31;
      sub_1000076A4();
      sub_10000769C();
      uint64_t v28 = 58LL;
    }

    unint64_t v32 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
    LogMessage.init(stringInterpolation:)(v5);
    type metadata accessor for Log();
    sub_1000044EC(&v37);
    LogMessage.init(stringLiteral:)(0xD00000000000003ALL, 0x800000010000FF10LL);
    sub_1000053FC(v17);
    swift_bridgeObjectRelease(v17);
    unint64_t v33 = sub_10000710C();
    uint64_t v34 = swift_allocError(&unk_100014CA8, v33, 0LL, 0LL);
    *uint64_t v35 = 1;
    uint64_t v36 = sub_1000076B8((uint64_t)&unk_100014C10);
    sub_100007668(v36);
    id v37 = (void *)v34;
    unsigned __int8 v38 = sub_10000716C;
    uint64_t v40 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v39 = v18;
    char v42 = 2;
    swift_retain(v18);
    SyncEvent.post(_:)(&v37);
    sub_1000076DC();
    sub_1000076F8();
  }

uint64_t sub_100006804(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = sub_10000710C();
    uint64_t v5 = swift_allocError(&unk_100014CA8, v4, 0LL, 0LL);
    *uint64_t v6 = 1;
    v7[0] = 0LL;
    v7[1] = v5;
    memset(&v7[2], 0, 24);
    char v8 = 0;
    SyncEvent.post(_:)(v7);
    swift_errorRelease(v5);
    return swift_release(v3);
  }

  return result;
}

uint64_t sub_1000068A8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  char v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a3 += 16LL;
  swift_beginAccess(a3, v45, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(a3);
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v12 = type metadata accessor for LogMessage(0LL);
    uint64_t v13 = swift_allocObject( v11,  ((*(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL))
          + 5LL * *(void *)(*(void *)(v12 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v13 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAD0;
    *((void *)&v40 + Hasher._combine(_:)(v1 & 1) = type metadata accessor for RemoteEngagementPresenter();
    *(void *)&__int128 v39 = v10;
    uint64_t v14 = swift_retain(v10);
    id v15 = (id)AMSLogKey(v14);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      uint64_t v19 = v18;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v20._uint64_t countAndFlagsBits = 0LL;
      v20._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v20);
      uint64_t v21 = *((void *)&v40 + 1);
      uint64_t v22 = sub_100005218(&v39, *((uint64_t *)&v40 + 1));
      uint64_t DynamicType = swift_getDynamicType(v22, v21, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v43[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100004178((uint64_t)v43);
      v24._uint64_t countAndFlagsBits = 5972026LL;
      v24._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v24);
      uint64_t MetatypeMetadata = &type metadata for String;
      v43[0] = v17;
      v43[1] = v19;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100004178((uint64_t)v43);
      uint64_t v25 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v26._uint64_t countAndFlagsBits = 0LL;
      v26._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v26);
      uint64_t v27 = *((void *)&v40 + 1);
      uint64_t v28 = sub_100005218(&v39, *((uint64_t *)&v40 + 1));
      uint64_t v29 = swift_getDynamicType(v28, v27, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v43[0] = v29;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100004178((uint64_t)v43);
      uint64_t v25 = 58LL;
    }

    unint64_t v30 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v25);
    LogMessage.init(stringInterpolation:)(v8);
    sub_1000044EC(&v39);
    LogMessage.init(stringLiteral:)(0xD000000000000021LL, 0x800000010000FF50LL);
    if (a1)
    {
      *((void *)&v40 + Hasher._combine(_:)(v1 & 1) = sub_100007230(0LL, &qword_10001A488, &OBJC_CLASS___AMSEngagementResult_ptr);
      *(void *)&__int128 v39 = a1;
    }

    else
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
    }

    id v31 = a1;
    static LogMessage.safe(_:)(&v39);
    sub_100004178((uint64_t)&v39);
    LogMessage.init(stringLiteral:)(0x3A726F727265202CLL, 0xE800000000000000LL);
    if (a2)
    {
      swift_getErrorValue(a2, v38, &v36);
      uint64_t v32 = v36;
      uint64_t v33 = v37;
      *((void *)&v40 + Hasher._combine(_:)(v1 & 1) = v37;
      uint64_t v34 = sub_10000717C(&v39);
      (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16LL))(v34, v32, v33);
    }

    else
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
    }

    type metadata accessor for Log();
    static LogMessage.safe(_:)(&v39);
    sub_100004178((uint64_t)&v39);
    sub_100005588(v13);
    swift_bridgeObjectRelease(v13);
    *(void *)&__int128 v39 = a1;
    *((void *)&v39 + Hasher._combine(_:)(v1 & 1) = a2;
    uint64_t v41 = 0LL;
    __int128 v40 = 0uLL;
    char v42 = 0;
    id v35 = v31;
    swift_errorRetain(a2);
    SyncEvent.post(_:)(&v39);

    swift_errorRelease(a2);
    return swift_release(v10);
  }

  return result;
}

uint64_t sub_100006C28()
{
  return v0;
}

uint64_t sub_100006C5C()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t type metadata accessor for RemoteEngagementPresenter()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService25RemoteEngagementPresenter);
}

uint64_t sub_100006C9C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void *sub_100006CCC(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  char v8 = result;
  switch(a6)
  {
    case 2:
      swift_errorRetain(result);
      return (void *)sub_100005208(a2, (uint64_t)a3);
    case 1:
      id v11 = a3;
      swift_retain(a5);
      id v12 = v8;
      return (void *)swift_unknownObjectRetain(a2);
    case 0:
      id v9 = result;
      return (void *)swift_errorRetain(a2);
  }

  return result;
}

void sub_100006D70(uint64_t a1)
{
}

void sub_100006D88(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 2:
      swift_errorRelease(a1);
      sub_10000523C(a2, (uint64_t)a3);
      break;
    case 1:

      swift_unknownObjectRelease(a2);
      swift_release(a5);

      break;
    case 0:

      swift_errorRelease(a2);
      break;
  }

uint64_t sub_100006E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(_BYTE *)(a2 + 40);
  sub_100006CCC(*(void **)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t sub_100006EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(_BYTE *)(a2 + 40);
  sub_100006CCC(*(void **)a2, v4, v5, v6, v7, v8);
  id v9 = *(void **)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  id v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_100006D88(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 sub_100006F28(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return result;
}

uint64_t sub_100006F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(_BYTE *)(a2 + 40);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_100006D88(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_100006F8C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t sub_100006FCC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 4Hasher._combine(_:)(v1 & 1) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 4Hasher._combine(_:)(v1 & 1) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 40) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_10000701C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_100007024(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.State()
{
}

unint64_t sub_10000703C()
{
  unint64_t result = qword_10001A460;
  if (!qword_10001A460)
  {
    uint64_t v1 = type metadata accessor for RemoteEngagementPresenter();
    unint64_t result = swift_getWitnessTable(&unk_10000F918, v1);
    atomic_store(result, (unint64_t *)&qword_10001A460);
  }

  return result;
}

uint64_t sub_100007078()
{
  uint64_t v1 = sub_100004138(&qword_10001A468);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  *(void *)(v0 + swift_unknownObjectWeakDestroy(v0 + 16) = SyncEvent.init()();
  *(_BYTE *)(v0 + 24) = 2;
  *(void *)(v0 + 56) = 0LL;
  *(void *)(v0 + 32) = 0LL;
  *(void *)(v0 + 40) = 0LL;
  *(_BYTE *)(v0 + 48) = 0;
  return v0;
}

void sub_1000070D0()
{
  if ((*(_BYTE *)(v0 + 48) & 1) == 0)
  {
    sub_100006518();
    *(_BYTE *)(v0 + 48) = 1;
  }

unint64_t sub_10000710C()
{
  unint64_t result = qword_10001A480;
  if (!qword_10001A480)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000FA64, &unk_100014CA8);
    atomic_store(result, (unint64_t *)&qword_10001A480);
  }

  return result;
}

uint64_t sub_100007148()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000716C()
{
  return sub_100006804(v0);
}

uint64_t sub_100007174(void *a1, uint64_t a2)
{
  return sub_1000068A8(a1, a2, v2);
}

void *sub_10000717C(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_1000071B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000071EC(uint64_t result, unint64_t a2)
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

uint64_t sub_100007230(uint64_t a1, unint64_t *a2, void *a3)
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

_BYTE *sub_100007268(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100007278(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFF)
  {
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

    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_100007300(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000734C + 4 * byte_10000F849[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100007380 + 4 * byte_10000F844[v4]))();
}

uint64_t sub_100007380(uint64_t result)
{
  *(_BYTE *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_100007388(uint64_t result, int a2)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (a2) {
    JUMPOUT(0x100007390LL);
  }
  return result;
}

uint64_t sub_10000739C(uint64_t result, int a2)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000073A4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1000073A8(uint64_t result)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_1000073B0(uint64_t result)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_1000073BC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000073C4(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.CompletionError()
{
}

uint64_t sub_1000073DC(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFD)
  {
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

    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }

uint64_t sub_100007464(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000074B0 + 4 * byte_10000F853[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000074E4 + 4 * byte_10000F84E[v4]))();
}

uint64_t sub_1000074E4(uint64_t result)
{
  *(_BYTE *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_1000074EC(uint64_t result, int a2)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (a2) {
    JUMPOUT(0x1000074F4LL);
  }
  return result;
}

uint64_t sub_100007500(uint64_t result, int a2)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = 0;
  if (!a2) {
    JUMPOUT(0x100007508LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10000750C(uint64_t result)
{
  *(_DWORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

uint64_t sub_100007514(uint64_t result)
{
  *(_WORD *)(result + Hasher._combine(_:)(v1 & 1) = v1;
  return result;
}

_BYTE *sub_100007520(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ActivationError()
{
}

unint64_t sub_100007538()
{
  unint64_t result = qword_10001A4B8;
  if (!qword_10001A4B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000F9D4, &unk_100014D38);
    atomic_store(result, (unint64_t *)&qword_10001A4B8);
  }

  return result;
}

unint64_t sub_100007578()
{
  unint64_t result = qword_10001A4C0;
  if (!qword_10001A4C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000FA3C, &unk_100014CA8);
    atomic_store(result, (unint64_t *)&qword_10001A4C0);
  }

  return result;
}

uint64_t sub_1000075B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(v5 - 192, v5 - 128, v4 + 8, a4, 6LL);
}

double sub_1000075C8()
{
  return sub_100007730(v1 - 176, v0, (_OWORD *)(v1 - 128));
}

uint64_t sub_1000075D8()
{
  return sub_100004178(v0 - 128);
}

uint64_t sub_1000075E0()
{
  return AnyHashable.init<A>(_:)(v0 - 192);
}

uint64_t sub_1000075EC(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_100007230(0LL, a2, a3);
}

uint64_t sub_1000075F4(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 128) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 128);
}

uint64_t sub_100007608()
{
  uint64_t v1 = *(void *)(v0 - 152);
  uint64_t v2 = sub_100005218((void *)(v0 - 176), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_10000762C()
{
  return sub_1000071EC(v1, v0);
}

void sub_100007638()
{
  v0._uint64_t countAndFlagsBits = 5972026LL;
  v0._object = (void *)0xE300000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

void sub_100007648()
{
  v0._uint64_t countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

void *sub_100007658(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, 0LL);
}

uint64_t sub_100007668(uint64_t a1)
{
  return swift_weakInit(a1 + 16, v1);
}

uint64_t sub_100007678()
{
  return sub_1000071B8(v0 - 176);
}

uint64_t sub_100007680()
{
  return sub_100004178(v0 - 176);
}

  ;
}

  ;
}

uint64_t sub_10000769C()
{
  return sub_100004178(v0 - 96);
}

uint64_t sub_1000076A4()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 96);
}

void sub_1000076AC()
{
  v0._uint64_t countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_1000076B8(uint64_t a1)
{
  return swift_allocObject(a1, 24LL, 7LL);
}

uint64_t sub_1000076C4()
{
  return static LogMessage.safe(_:)(v0 - 176);
}

uint64_t sub_1000076D0()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
}

uint64_t sub_1000076DC()
{
  return swift_errorRelease(v0);
}

uint64_t sub_1000076E4()
{
  return sub_1000071EC(*(void *)(v0 - 216), *(void *)(v0 - 208));
}

uint64_t sub_1000076EC()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
}

uint64_t sub_1000076F8()
{
  return swift_release_n(v0, 2LL);
}

uint64_t sub_100007704(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

double sub_100007730@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10000B354(a1), (v6 & 1) != 0))
  {
    sub_10000450C(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

void sub_100007780(uint64_t a1)
{
}

uint64_t sub_10000778C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = sub_1000076B8((uint64_t)&unk_100015058);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v0;
  aBlock[4] = sub_10000B890;
  void aBlock[5] = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100007B50;
  aBlock[3] = &unk_100015070;
  _Block_copy(aBlock);
  id v3 = v1;
  uint64_t v4 = v0;
  sub_10000BB40();
  id v5 = sub_10000BA2C(v3, "remoteObjectProxyWithErrorHandler:");
  sub_10000BBC8();

  _bridgeAnyObjectToAny(_:)(aBlock, v5);
  swift_unknownObjectRelease(v5);
  uint64_t v6 = sub_100004138(&qword_10001A648);
  else {
    return 0LL;
  }
}

uint64_t sub_1000078A4(uint64_t a1, void *a2)
{
  id v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100004138((uint64_t *)&unk_10001A470);
  uint64_t v7 = type metadata accessor for LogMessage(0LL);
  uint64_t v8 = swift_allocObject( v6,  ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL))
       + 3LL * *(void *)(*(void *)(v7 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v8 + swift_weakDestroy(v0 + 16) = xmmword_10000F540;
  uint64_t v35 = type metadata accessor for RemoteEngagementViewController();
  v34[0] = a2;
  id v9 = (id)AMSLogKey(a2);
  if (v9)
  {
    __int128 v10 = v9;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v13 = v12;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v14._uint64_t countAndFlagsBits = 0LL;
    v14._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v14);
    uint64_t v15 = v35;
    uint64_t v16 = sub_100005218(v34, v35);
    uint64_t DynamicType = swift_getDynamicType(v16, v15, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000B610((uint64_t)v32, (uint64_t *)&unk_10001A570);
    v18._uint64_t countAndFlagsBits = 5972026LL;
    v18._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v32[0] = v11;
    v32[1] = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000B610((uint64_t)v32, (uint64_t *)&unk_10001A570);
    uint64_t v19 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v20._uint64_t countAndFlagsBits = 0LL;
    v20._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v20);
    uint64_t v21 = v35;
    uint64_t v22 = sub_100005218(v34, v35);
    uint64_t v23 = swift_getDynamicType(v22, v21, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = v23;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000B610((uint64_t)v32, (uint64_t *)&unk_10001A570);
    uint64_t v19 = 58LL;
  }

  unint64_t v24 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v19);
  LogMessage.init(stringInterpolation:)(v5);
  type metadata accessor for Log();
  sub_1000044EC(v34);
  LogMessage.init(stringLiteral:)(0xD000000000000027LL, 0x8000000100010320LL);
  swift_getErrorValue(a1, v31, &v29);
  uint64_t v25 = v29;
  uint64_t v26 = v30;
  uint64_t v35 = v30;
  uint64_t v27 = sub_10000717C(v34);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16LL))(v27, v25, v26);
  static LogMessage.safe(_:)(v34);
  sub_10000B610((uint64_t)v34, (uint64_t *)&unk_10001A570);
  sub_1000053FC(v8);
  return swift_bridgeObjectRelease(v8);
}

void sub_100007B50(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

void sub_100007BA0(uint64_t a1)
{
}

void sub_100007BB4()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  sub_100005300((uint64_t)v7.super_class, "viewDidLoad", v1, v2, v3, v4, v5, v6, v7);
  sub_100007FC0();
  sub_10000BA00();
  sub_10000B8C0(&qword_10001A650, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewDidLoad()();
  sub_10000BA50();
}

void sub_100007CA4(char a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v3, "viewDidAppear:", a1 & 1);
  sub_1000070D0();
  sub_10000BA50();
}

uint64_t sub_100007D2C(char a1)
{
  uint64_t v3 = type metadata accessor for ViewWillDisappearReason(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10000BAD4();
  uint64_t v7 = v6 - v5;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v11, "viewWillDisappear:", a1 & 1);
  static ViewWillDisappearReason.inferred(for:)(v1);
  uint64_t v8 = sub_10000BA00();
  sub_10000B8C0(&qword_10001A650, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewWillDisappear(forReason:)(v7, v8, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_100007E4C(char a1, SEL *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v10, *a2, a1 & 1);
  uint64_t v7 = sub_10000BA00();
  sub_10000B8C0(&qword_10001A650, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  return a3(v7, v8);
}

void sub_100007F24()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  sub_100005300((uint64_t)v7.super_class, "didReceiveMemoryWarning", v1, v2, v3, v4, v5, v6, v7);
  sub_10000BA00();
  sub_10000B8C0(&qword_10001A650, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewDidReceiveMemoryWarning()();
  sub_10000BA50();
}

uint64_t sub_100007FC0()
{
  uint64_t v1 = sub_100004138((uint64_t *)&unk_10001A630);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000BAE4();
  uint64_t v3 = *(void *)(*(void *)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter)
                 + 16LL);
  uint64_t v4 = sub_1000076B8((uint64_t)&unk_100014E28);
  sub_10000B9A4(v4);
  uint64_t v5 = sub_100004138(&qword_10001A468);
  sub_10000B85C(&qword_10001A640, &qword_10001A468);
  uint64_t v7 = v6;
  swift_retain(v3);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v9, v5, v7);
  EventEmitter.addObserver(on:singleUse:_:)(v9, 0LL, sub_10000B854, v4, v5, v7);
  swift_release(v3);
  sub_10000BA78();
  sub_1000044EC(v9);
  return sub_10000BB34(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
}

void sub_1000080D8(uint64_t a1, uint64_t a2)
{
  a2 += 16LL;
  swift_beginAccess(a2, v5, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    sub_10000A3E8();
  }

void *sub_100008138()
{
  id v1 = sub_10000BA2C(objc_allocWithZone(&OBJC_CLASS___NSXPCConnection), "initWithListenerEndpoint:");
  sub_100007780((uint64_t)v1);
  uint64_t v2 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection);
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v5 = v3;
  id v6 = sub_10000BA2C(v4, "interfaceWithProtocol:");
  sub_10000B9D0((uint64_t)v6, "setExportedInterface:");

  uint64_t v7 = *(void **)(v0 + v2);
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v9 = v7;
  id v10 = sub_10000BA2C(v8, "interfaceWithProtocol:");
  sub_10000B9D0((uint64_t)v10, "setRemoteObjectInterface:");

  objc_super v11 = *(void **)(v0 + v2);
  if (!v11) {
    goto LABEL_8;
  }
  [v11 setExportedObject:v0];
  if (!*(void *)(v0 + v2)) {
    goto LABEL_7;
  }
  uint64_t v12 = sub_1000076B8((uint64_t)&unk_100014E28);
  uint64_t v13 = sub_10000B9A4(v12);
  sub_10000BAA4(v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t)_NSConcreteStackBlock);
  id v21 = sub_10000BB48();
  uint64_t v22 = sub_10000BB40();
  sub_10000B9D0(v22, "setInvalidationHandler:");
  sub_10000BBC8();

  if (*(void *)(v0 + v2))
  {
    uint64_t v23 = sub_1000076B8((uint64_t)&unk_100014E28);
    uint64_t v24 = sub_10000B9A4(v23);
    sub_10000BAA4(v24, v25, v26, v27, v28, v29, v30, v31, (uint64_t)_NSConcreteStackBlock);
    id v32 = sub_10000BB48();
    uint64_t v33 = sub_10000BB40();
    sub_10000B9D0(v33, "setInterruptionHandler:");
    sub_10000BBC8();

    objc_super v11 = *(void **)(v0 + v2);
  }

  else
  {
LABEL_7:
    objc_super v11 = 0LL;
  }

LABEL_8:
  [v11 resume];
  double result = (void *)sub_10000778C();
  if (result)
  {
    uint64_t v35 = result;
    [result initializeClientToViewServiceConnection];
    return (void *)swift_unknownObjectRelease(v35);
  }

  return result;
}

void sub_100008370(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v28[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v32, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    id v6 = (void *)Strong;
    uint64_t v7 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v8 = type metadata accessor for LogMessage(0LL);
    uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
         + 2LL * *(void *)(*(void *)(v8 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
    uint64_t v31 = type metadata accessor for RemoteEngagementViewController();
    v30[0] = v6;
    id v10 = v6;
    id v11 = (id)AMSLogKey(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v15 = v14;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v16._uint64_t countAndFlagsBits = 0LL;
      v16._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v16);
      uint64_t v17 = v31;
      uint64_t v18 = sub_100005218(v30, v31);
      uint64_t DynamicType = swift_getDynamicType(v18, v17, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v28[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
      sub_10000B610((uint64_t)v28, (uint64_t *)&unk_10001A570);
      v20._uint64_t countAndFlagsBits = 5972026LL;
      v20._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v20);
      uint64_t MetatypeMetadata = &type metadata for String;
      v28[0] = v13;
      v28[1] = v15;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
      sub_10000B610((uint64_t)v28, (uint64_t *)&unk_10001A570);
      uint64_t v21 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v22._uint64_t countAndFlagsBits = 0LL;
      v22._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v22);
      uint64_t v23 = v31;
      uint64_t v24 = sub_100005218(v30, v31);
      uint64_t v25 = swift_getDynamicType(v24, v23, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v28[0] = v25;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
      sub_10000B610((uint64_t)v28, (uint64_t *)&unk_10001A570);
      uint64_t v21 = 58LL;
    }

    unint64_t v26 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v21);
    LogMessage.init(stringInterpolation:)(v4);
    type metadata accessor for Log();
    sub_1000044EC(v30);
    LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000102E0LL);
    sub_1000053FC(v9);
    swift_bridgeObjectRelease(v9);
    sub_100007780(0LL);
  }

void sub_1000085FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v28[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v32, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    id v6 = (void *)Strong;
    uint64_t v7 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v8 = type metadata accessor for LogMessage(0LL);
    uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
         + 2LL * *(void *)(*(void *)(v8 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
    uint64_t v31 = type metadata accessor for RemoteEngagementViewController();
    v30[0] = v6;
    id v10 = v6;
    id v11 = (id)AMSLogKey(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v15 = v14;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v16._uint64_t countAndFlagsBits = 0LL;
      v16._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v16);
      uint64_t v17 = v31;
      uint64_t v18 = sub_100005218(v30, v31);
      uint64_t DynamicType = swift_getDynamicType(v18, v17, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v28[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
      sub_10000B610((uint64_t)v28, (uint64_t *)&unk_10001A570);
      v20._uint64_t countAndFlagsBits = 5972026LL;
      v20._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v20);
      uint64_t MetatypeMetadata = &type metadata for String;
      v28[0] = v13;
      v28[1] = v15;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
      sub_10000B610((uint64_t)v28, (uint64_t *)&unk_10001A570);
      uint64_t v21 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v22._uint64_t countAndFlagsBits = 0LL;
      v22._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v22);
      uint64_t v23 = v31;
      uint64_t v24 = sub_100005218(v30, v31);
      uint64_t v25 = swift_getDynamicType(v24, v23, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v28[0] = v25;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
      sub_10000B610((uint64_t)v28, (uint64_t *)&unk_10001A570);
      uint64_t v21 = 58LL;
    }

    unint64_t v26 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v21);
    LogMessage.init(stringInterpolation:)(v4);
    type metadata accessor for Log();
    sub_1000044EC(v30);
    LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000102C0LL);
    sub_1000053FC(v9);
    swift_bridgeObjectRelease(v9);
    [*(id *)&v10[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] invalidate];
    sub_100007780(0LL);
  }

id sub_1000088A0()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task];
  if (v1) {
    [v1 cancel];
  }
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return sub_100005300((uint64_t)v9.super_class, "dealloc", v2, v3, v4, v5, v6, v7, v9);
}

void sub_100008954(char a1, void *a2, uint64_t a3)
{
  id v7 = [v3 presentedViewController];
  if (v7)
  {
    uint64_t v15 = v7;
    if (a2)
    {
      a2 = sub_10000BAA4((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)_NSConcreteStackBlock);
      swift_retain(a3);
      sub_10000BA78();
    }

    [v15 dismissViewControllerAnimated:a1 & 1 completion:a2];
    _Block_release(a2);
  }

  else if (a2)
  {
    ((void (*)(void))a2)();
  }

  sub_10000BA5C();
}

void sub_100008A20()
{
  char v2 = v1;
  sub_10000BB98();
  sub_10000B9E4();
  __chkstk_darwin();
  sub_10000B9B8();
  sub_100004138((uint64_t *)&unk_10001A470);
  uint64_t v3 = *(void *)(*(void *)(sub_10000BAAC() - 8) + 72LL);
  sub_10000BB74();
  uint64_t v6 = sub_10000BB68((v5 & ~v4) + 2 * v3, v4);
  *(_OWORD *)(v6 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
  uint64_t v27 = (void *)type metadata accessor for RemoteEngagementViewController();
  v26[0] = v0;
  id v7 = v0;
  id v8 = (id)AMSLogKey(v7);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    uint64_t v12 = v11;

    sub_1000076D0();
    sub_1000076AC();
    uint64_t v13 = (uint64_t)v27;
    uint64_t v14 = sub_100005218(v26, (uint64_t)v27);
    sub_10000B99C((uint64_t)v14, v13);
    swift_getMetatypeMetadata();
    sub_10000BBB4();
    sub_10000BBBC();
    sub_100007638();
    uint64_t MetatypeMetadata = &type metadata for String;
    v24[0] = v10;
    v24[1] = v12;
    sub_10000BBB4();
    sub_10000BBBC();
    uint64_t v15 = 93LL;
  }

  else
  {
    sub_1000076EC();
    sub_1000076AC();
    uint64_t v16 = (uint64_t)v27;
    uint64_t v17 = sub_100005218(v26, (uint64_t)v27);
    uint64_t v18 = sub_10000B99C((uint64_t)v17, v16);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v24[0] = v18;
    sub_10000BBB4();
    sub_10000B610((uint64_t)v24, (uint64_t *)&unk_10001A570);
    uint64_t v15 = 58LL;
  }

  unint64_t v19 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v15);
  sub_10000BB8C();
  sub_10000BA70();
  sub_1000044EC(v26);
  uint64_t v27 = &type metadata for String;
  v26[0] = 0xD000000000000026LL;
  v26[1] = 0x8000000100010200LL;
  uint64_t v20 = static LogMessage.safe(_:)(v26);
  sub_10000BA34(v20, (uint64_t *)&unk_10001A570);
  sub_1000055A8(v6);
  swift_bridgeObjectRelease(v6);
  uint64_t v21 = sub_1000076B8((uint64_t)&unk_100014E28);
  swift_unknownObjectWeakInit(v21 + 16, v7);
  uint64_t v22 = sub_10000B984((uint64_t)&unk_100014F68, 25LL);
  *(void *)(v22 + swift_weakDestroy(v0 + 16) = v21;
  char v23 = v2 & 1;
  *(_BYTE *)(v22 + 24) = v23;
  swift_retain(v21);
  sub_100008954(v23, sub_10000B7E8, v22);
  swift_release(v21);
  sub_10000BA78();
  sub_10000B958();
}

void sub_100008C5C(uint64_t a1, char a2)
{
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v39, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    id v7 = (void *)Strong;
    uint64_t v8 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v9 = type metadata accessor for LogMessage(0LL);
    uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v9 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
    uint64_t v34 = (void *)type metadata accessor for RemoteEngagementViewController();
    aBlock[0] = v7;
    id v11 = v7;
    id v12 = (id)AMSLogKey(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      uint64_t v16 = v15;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v17._uint64_t countAndFlagsBits = 0LL;
      v17._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      uint64_t v18 = v34;
      unint64_t v19 = sub_100005218(aBlock, (uint64_t)v34);
      uint64_t DynamicType = swift_getDynamicType(v19, v18, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v37[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v37);
      sub_10000B610((uint64_t)v37, (uint64_t *)&unk_10001A570);
      v21._uint64_t countAndFlagsBits = 5972026LL;
      v21._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      uint64_t MetatypeMetadata = &type metadata for String;
      v37[0] = v14;
      v37[1] = v16;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v37);
      sub_10000B610((uint64_t)v37, (uint64_t *)&unk_10001A570);
      uint64_t v22 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v23._uint64_t countAndFlagsBits = 0LL;
      v23._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v23);
      uint64_t v24 = v34;
      uint64_t v25 = sub_100005218(aBlock, (uint64_t)v34);
      uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v37[0] = v26;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v37);
      sub_10000B610((uint64_t)v37, (uint64_t *)&unk_10001A570);
      uint64_t v22 = 58LL;
    }

    unint64_t v27 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
    LogMessage.init(stringInterpolation:)(v5);
    type metadata accessor for Log();
    sub_1000044EC(aBlock);
    LogMessage.init(stringLiteral:)(0xD000000000000021LL, 0x8000000100010230LL);
    sub_1000055A8(v10);
    swift_bridgeObjectRelease(v10);
    uint64_t v28 = swift_allocObject(&unk_100014F90, 24LL, 7LL);
    *(void *)(v28 + swift_weakDestroy(v0 + 16) = v11;
    uint64_t v35 = sub_10000B7F4;
    uint64_t v36 = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100007704;
    uint64_t v34 = &unk_100014FA8;
    uint64_t v29 = _Block_copy(aBlock);
    uint64_t v30 = v36;
    id v31 = v11;
    swift_release(v30);
    [v31 dismissViewControllerAnimated:a2 & 1 completion:v29];
    _Block_release(v29);
  }

uint64_t sub_100008F78(void *a1)
{
  uint64_t v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100004138((uint64_t *)&unk_10001A470);
  uint64_t v5 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v6 = *(void *)(v5 + 72);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v54 = v6;
  uint64_t v50 = ((v7 + 32) & ~v7) + 2 * v6;
  uint64_t v51 = v4;
  uint64_t v49 = v7 | 7;
  uint64_t v8 = swift_allocObject(v4, v50, v7 | 7);
  __int128 v53 = xmmword_10000FAC0;
  *(_OWORD *)(v8 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
  uint64_t v9 = type metadata accessor for RemoteEngagementViewController();
  uint64_t v59 = v9;
  v58[0] = a1;
  id v10 = a1;
  id v11 = (id)AMSLogKey(v10);
  uint64_t v52 = v9;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v15 = v14;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v16._uint64_t countAndFlagsBits = 0LL;
    v16._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v16);
    uint64_t v17 = v59;
    uint64_t v18 = sub_100005218(v58, v59);
    uint64_t DynamicType = swift_getDynamicType(v18, v17, 1LL);
    *((void *)&v57 + Hasher._combine(_:)(v1 & 1) = swift_getMetatypeMetadata();
    *(void *)&__int128 v56 = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
    sub_10000B610((uint64_t)&v56, (uint64_t *)&unk_10001A570);
    v20._uint64_t countAndFlagsBits = 5972026LL;
    v20._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v20);
    *((void *)&v57 + Hasher._combine(_:)(v1 & 1) = &type metadata for String;
    *(void *)&__int128 v56 = v13;
    *((void *)&v56 + Hasher._combine(_:)(v1 & 1) = v15;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
    sub_10000B610((uint64_t)&v56, (uint64_t *)&unk_10001A570);
    uint64_t v21 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v22._uint64_t countAndFlagsBits = 0LL;
    v22._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    uint64_t v23 = v59;
    uint64_t v24 = sub_100005218(v58, v59);
    uint64_t v25 = swift_getDynamicType(v24, v23, 1LL);
    *((void *)&v57 + Hasher._combine(_:)(v1 & 1) = swift_getMetatypeMetadata();
    *(void *)&__int128 v56 = v25;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
    sub_10000B610((uint64_t)&v56, (uint64_t *)&unk_10001A570);
    uint64_t v21 = 58LL;
  }

  unint64_t v26 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v21);
  LogMessage.init(stringInterpolation:)(v3);
  type metadata accessor for Log();
  sub_1000044EC(v58);
  LogMessage.init(stringLiteral:)(0xD000000000000027LL, 0x8000000100010260LL);
  sub_1000055A8(v8);
  swift_bridgeObjectRelease(v8);
  id v27 = [v10 _remoteViewControllerProxy];
  if (v27)
  {
    id v28 = v27;
    _bridgeAnyObjectToAny(_:)(&v56, v27);
    swift_unknownObjectRelease(v28);
  }

  else
  {
    __int128 v56 = 0u;
    __int128 v57 = 0u;
  }

  sub_10000B7FC((uint64_t)&v56, (uint64_t)v58);
  if (v59)
  {
    uint64_t v29 = sub_100004138(&qword_10001A5C8);
    if ((swift_dynamicCast(&v55, v58, (char *)&type metadata for Any + 8, v29, 6LL) & 1) != 0)
    {
      id v30 = v55;
      [v55 dismissWithResult:0];
      return swift_unknownObjectRelease(v30);
    }
  }

  else
  {
    sub_10000B610((uint64_t)v58, (uint64_t *)&unk_10001A570);
  }

  uint64_t v32 = swift_allocObject(v51, v50, v49);
  *(_OWORD *)(v32 + swift_weakDestroy(v0 + 16) = v53;
  uint64_t v59 = v52;
  v58[0] = v10;
  id v33 = (id)AMSLogKey(v10);
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
    uint64_t v37 = v36;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v38._uint64_t countAndFlagsBits = 0LL;
    v38._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v38);
    uint64_t v39 = v59;
    __int128 v40 = sub_100005218(v58, v59);
    uint64_t v41 = swift_getDynamicType(v40, v39, 1LL);
    *((void *)&v57 + Hasher._combine(_:)(v1 & 1) = swift_getMetatypeMetadata();
    *(void *)&__int128 v56 = v41;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
    sub_10000B610((uint64_t)&v56, (uint64_t *)&unk_10001A570);
    v42._uint64_t countAndFlagsBits = 5972026LL;
    v42._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v42);
    *((void *)&v57 + Hasher._combine(_:)(v1 & 1) = &type metadata for String;
    *(void *)&__int128 v56 = v35;
    *((void *)&v56 + Hasher._combine(_:)(v1 & 1) = v37;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
    sub_10000B610((uint64_t)&v56, (uint64_t *)&unk_10001A570);
    uint64_t v43 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v44._uint64_t countAndFlagsBits = 0LL;
    v44._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v44);
    uint64_t v45 = v59;
    uint64_t v46 = sub_100005218(v58, v59);
    uint64_t v47 = swift_getDynamicType(v46, v45, 1LL);
    *((void *)&v57 + Hasher._combine(_:)(v1 & 1) = swift_getMetatypeMetadata();
    *(void *)&__int128 v56 = v47;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
    sub_10000B610((uint64_t)&v56, (uint64_t *)&unk_10001A570);
    uint64_t v43 = 58LL;
  }

  unint64_t v48 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v43);
  LogMessage.init(stringInterpolation:)(v3);
  sub_1000044EC(v58);
  LogMessage.init(stringLiteral:)(0xD000000000000020LL, 0x8000000100010290LL);
  sub_1000053FC(v32);
  return swift_bridgeObjectRelease(v32);
}

void sub_10000947C(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10000778C();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (a2) {
      a2 = (void *)_convertErrorToNSError(_:)(a2);
    }
    uint64_t v6 = sub_1000076B8((uint64_t)&unk_100014E28);
    uint64_t v7 = sub_10000B9A4(v6);
    uint64_t v16 = v6;
    uint64_t v15 = sub_10000BAA4(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)_NSConcreteStackBlock);
    swift_release(v16);
    [v5 engagementTaskDidFinishWithResult:a1 error:a2 completion:v15];
    _Block_release(v15);

    sub_100007BA0(0LL);
    swift_unknownObjectRelease(v5);
    sub_10000BA5C();
  }

  else
  {
    sub_1000095BC();
  }

void sub_10000956C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_1000095BC();
  }

void sub_1000095BC()
{
  uint64_t v25 = v2;
  uint64_t v26 = v3;
  uint64_t v4 = v0;
  uint64_t v5 = ((uint64_t (*)(void))type metadata accessor for DispatchWorkItemFlags)(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  sub_10000BAE4();
  uint64_t v7 = ((uint64_t (*)(void))type metadata accessor for DispatchQoS)(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  sub_10000BAD4();
  uint64_t v11 = v10 - v9;
  id v12 = [(id)objc_opt_self(NSThread) isMainThread];
  if ((_DWORD)v12)
  {
    sub_100008A20();
  }

  else
  {
    sub_1000075EC((uint64_t)v12, &qword_10001A5A8, &OBJC_CLASS___OS_dispatch_queue_ptr);
    Swift::String v22 = (void *)((uint64_t (*)(void))static OS_dispatch_queue.main.getter)();
    uint64_t v13 = sub_1000076B8((uint64_t)&unk_100014EF0);
    *(void *)(v13 + swift_weakDestroy(v0 + 16) = v0;
    v23[4] = sub_10000B774;
    uint64_t v24 = v13;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 1107296256LL;
    v23[2] = sub_100007704;
    v23[3] = &unk_100014F08;
    uint64_t v14 = _Block_copy(v23);
    uint64_t v15 = v24;
    id v16 = v4;
    uint64_t v17 = swift_release(v15);
    ((void (*)(uint64_t))static DispatchQoS.unspecified.getter)(v17);
    v23[0] = &_swiftEmptyArrayStorage;
    sub_10000B8C0(&qword_10001A5B0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    uint64_t v19 = v18;
    uint64_t v20 = sub_100004138(&qword_10001A5B8);
    sub_10000B85C(&qword_10001A5C0, &qword_10001A5B8);
    ((void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch thunk of SetAlgebra.init<A>(_:))( v23,  v20,  v21,  v5,  v19);
    ((void (*)(void, uint64_t, uint64_t, void *))OS_dispatch_queue.async(group:qos:flags:execute:))( 0LL,  v11,  v1,  v14);
    _Block_release(v14);

    sub_10000BB34(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
    sub_10000B958();
  }

void sub_1000097BC()
{
}

uint64_t sub_1000097E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000076B8((uint64_t)&unk_100014E28);
  sub_10000B9A4(v6);
  uint64_t v7 = (void *)sub_10000B984((uint64_t)&unk_100014EC8, 48LL);
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  void v7[5] = a3;
  swift_retain(v6);
  swift_errorRetain(a1);
  sub_100005208(a2, a3);
  sub_100008954(1, sub_10000B74C, (uint64_t)v7);
  sub_10000BA78();
  return swift_release(v7);
}

void sub_10000987C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_errorRetain(a2);
    sub_100005208(a3, a4);
    id v10 = sub_1000045C8(a2, a3, a4);
    [v9 presentViewController:v10 animated:1 completion:0];
  }

void sub_100009940()
{
  uint64_t v29 = v1;
  uint64_t v30 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_100004138(&qword_10001A590);
  sub_10000B9E4();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000B9B8();
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  id v16 = (char *)&v29 - v15;
  id v17 = [v9 URL];
  if (!v17)
  {
    sub_10000BB14(v0, 1LL);
    goto LABEL_5;
  }

  uint64_t v18 = v17;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v19 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v19(v0, v14, v10);
  sub_10000BB14(v0, 0LL);
  if (sub_10000B6B4(v0, 1LL, v10) == 1)
  {
LABEL_5:
    sub_10000B610(v0, &qword_10001A590);
    goto LABEL_6;
  }

  v19((uint64_t)v16, (char *)v0, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  id v20 = objc_allocWithZone(&OBJC_CLASS___AMSCampaignAttributionTask);
  swift_unknownObjectRetain(v7);
  id v22 = sub_10000B274((uint64_t)v14, v7, v21);
  [v22 setClientInfo:v5];
  id v23 = [v9 account];
  [v22 setAccount:v23];

  id v24 = [v22 perform];
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
LABEL_6:
  uint64_t v25 = sub_1000076B8((uint64_t)&unk_100014E28);
  swift_unknownObjectWeakInit(v25 + 16, v30);
  uint64_t v26 = (void *)sub_10000B984((uint64_t)&unk_100014E50, 64LL);
  v26[2] = v25;
  void v26[3] = v9;
  v26[4] = v7;
  v26[5] = v5;
  v26[6] = v29;
  v26[7] = v3;
  swift_unknownObjectRetain(v7);
  swift_retain(v25);
  id v27 = v9;
  id v28 = v5;
  swift_retain(v3);
  sub_100008954(1, sub_10000B6A4, (uint64_t)v26);
  swift_release(v25);
  swift_release(v26);
  sub_10000B958();
}

void sub_100009BBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v84, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v15 = (void *)Strong;
    id v16 = *(void **)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
    if (v16)
    {
      uint64_t v17 = sub_100004138((uint64_t *)&unk_10001A470);
      uint64_t v18 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
      uint64_t v19 = *(void *)(v18 + 72);
      uint64_t v20 = *(unsigned __int8 *)(v18 + 80);
      uint64_t v76 = v19;
      uint64_t v21 = swift_allocObject(v17, ((v20 + 32) & ~v20) + 2 * v19, v20 | 7);
      *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
      v78 = (void *)type metadata accessor for RemoteEngagementViewController();
      aBlock[0] = v15;
      id v22 = v15;
      id v23 = v16;
      id v24 = (id)AMSLogKey(v23);
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        uint64_t v27 = a6;
        uint64_t v28 = a5;
        uint64_t v30 = v29;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v31._uint64_t countAndFlagsBits = 0LL;
        v31._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v31);
        uint64_t v32 = v78;
        id v33 = sub_100005218(aBlock, (uint64_t)v78);
        uint64_t DynamicType = swift_getDynamicType(v33, v32, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v81 = DynamicType;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v81);
        sub_10000B610((uint64_t)&v81, (uint64_t *)&unk_10001A570);
        v35._uint64_t countAndFlagsBits = 5972026LL;
        v35._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v35);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v81 = v26;
        uint64_t v82 = v30;
        a5 = v28;
        a6 = v27;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v81);
        sub_10000B610((uint64_t)&v81, (uint64_t *)&unk_10001A570);
        uint64_t v36 = 93LL;
      }

      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v54._uint64_t countAndFlagsBits = 0LL;
        v54._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v54);
        id v55 = v78;
        __int128 v56 = sub_100005218(aBlock, (uint64_t)v78);
        uint64_t v57 = swift_getDynamicType(v56, v55, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v81 = v57;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v81);
        sub_10000B610((uint64_t)&v81, (uint64_t *)&unk_10001A570);
        uint64_t v36 = 58LL;
      }

      unint64_t v58 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v36);
      LogMessage.init(stringInterpolation:)(v13);
      type metadata accessor for Log();
      sub_1000044EC(aBlock);
      LogMessage.init(stringLiteral:)(0xD000000000000025LL, 0x80000001000101D0LL);
      sub_100005588(v21);
      swift_bridgeObjectRelease(v21);
    }

    else
    {
      uint64_t v76 = a5;
      uint64_t v37 = sub_100004138((uint64_t *)&unk_10001A470);
      uint64_t v38 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
      uint64_t v39 = *(void *)(v38 + 72);
      uint64_t v40 = *(unsigned __int8 *)(v38 + 80);
      uint64_t v75 = v39;
      uint64_t v41 = swift_allocObject(v37, ((v40 + 32) & ~v40) + 2 * v39, v40 | 7);
      *(_OWORD *)(v41 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
      v78 = (void *)type metadata accessor for RemoteEngagementViewController();
      aBlock[0] = v15;
      id v42 = v15;
      id v43 = (id)AMSLogKey(v42);
      if (v43)
      {
        Swift::String v44 = v43;
        uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
        uint64_t v73 = v46;
        id v74 = v42;
        uint64_t v47 = v45;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v48._uint64_t countAndFlagsBits = 0LL;
        v48._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v48);
        uint64_t v49 = v78;
        uint64_t v50 = sub_100005218(aBlock, (uint64_t)v78);
        uint64_t v51 = swift_getDynamicType(v50, v49, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v81 = v51;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v81);
        sub_10000B610((uint64_t)&v81, (uint64_t *)&unk_10001A570);
        v52._uint64_t countAndFlagsBits = 5972026LL;
        v52._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v52);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v81 = v47;
        id v42 = v74;
        uint64_t v82 = v73;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v81);
        sub_10000B610((uint64_t)&v81, (uint64_t *)&unk_10001A570);
        uint64_t v53 = 93LL;
      }

      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v59._uint64_t countAndFlagsBits = 0LL;
        v59._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v59);
        uint64_t v60 = v78;
        uint64_t v61 = sub_100005218(aBlock, (uint64_t)v78);
        uint64_t v62 = swift_getDynamicType(v61, v60, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v81 = v62;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v81);
        sub_10000B610((uint64_t)&v81, (uint64_t *)&unk_10001A570);
        uint64_t v53 = 58LL;
      }

      unint64_t v63 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v53);
      LogMessage.init(stringInterpolation:)(v13);
      type metadata accessor for Log();
      sub_1000044EC(aBlock);
      LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100010180LL);
      sub_100005588(v41);
      swift_bridgeObjectRelease(v41);
      [a2 setPresentationStyle:2];
      sub_100007230(0LL, &qword_10001A598, &OBJC_CLASS___AMSUIEngagementTask_ptr);
      id v64 = v42;
      id v65 = a2;
      swift_unknownObjectRetain(a3);
      id v23 = sub_10000A200(v65, a3, v64);
      [v23 setAllowMultiplePresentations:1];
      [v23 setClientInfo:a4];
      sub_100007BA0((uint64_t)v23);
      a5 = v76;
    }

    id v66 = [v23 presentEngagement];
    uint64_t v67 = swift_allocObject(&unk_100014E28, 24LL, 7LL);
    swift_unknownObjectWeakInit(v67 + 16, v15);
    id v68 = (void *)swift_allocObject(&unk_100014E78, 48LL, 7LL);
    v68[2] = v67;
    v68[3] = v23;
    v68[4] = a5;
    v68[5] = a6;
    v79 = sub_10000B6F0;
    v80 = v68;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_10000A374;
    v78 = &unk_100014E90;
    id v69 = _Block_copy(aBlock);
    uint64_t v70 = v80;
    id v71 = v23;
    swift_retain(a6);
    swift_release(v70);
    [v66 addFinishBlock:v69];

    _Block_release(v69);
  }

id sub_10000A200(void *a1, uint64_t a2, void *a3)
{
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)) initWithRequest:a1 bag:a2 presentingViewController:a3];

  swift_unknownObjectRelease(a2);
  return v7;
}

uint64_t sub_10000A268( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v9 = a3 + 16;
  swift_beginAccess(a3 + 16, v18, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v9);
  if (Strong)
  {
    uint64_t v11 = (void *)Strong;
    uint64_t v12 = *(void **)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
    id v13 = v12;

    if (v12)
    {
      sub_100007230(0LL, &qword_10001A5A0, &OBJC_CLASS___NSObject_ptr);
      if ((static NSObject.== infix(_:_:)(v13, a4) & 1) != 0)
      {
        swift_beginAccess(v9, &v17, 0LL, 0LL);
        uint64_t v14 = swift_unknownObjectWeakLoadStrong(v9);
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          sub_100007BA0(0LL);
        }
      }
    }
  }

  return a5(a1, a2);
}

void sub_10000A374(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(void *, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v8 = a2;
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

void sub_10000A3E8()
{
  uint64_t v2 = v1;
  sub_10000BB98();
  sub_10000B9E4();
  __chkstk_darwin(v3);
  sub_10000B9B8();
  sub_100004138((uint64_t *)&unk_10001A470);
  uint64_t v4 = *(void *)(*(void *)(sub_10000BAAC() - 8) + 72LL);
  sub_10000BB74();
  uint64_t v7 = sub_10000BB68((v6 & ~v5) + 3 * v4, v5);
  *(_OWORD *)(v7 + swift_weakDestroy(v0 + 16) = xmmword_10000F540;
  uint64_t v37 = (void *)type metadata accessor for RemoteEngagementViewController();
  id v34 = v0;
  id v8 = (id)AMSLogKey(v0);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    uint64_t v12 = v11;

    sub_1000076D0();
    sub_1000076AC();
    uint64_t v13 = (uint64_t)v37;
    uint64_t v14 = sub_100005218(&v34, (uint64_t)v37);
    uint64_t v15 = sub_10000B99C((uint64_t)v14, v13);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = v15;
    sub_10000BB54();
    sub_10000BAB4((uint64_t)v32);
    sub_100007638();
    uint64_t MetatypeMetadata = &type metadata for String;
    v32[0] = v10;
    v32[1] = v12;
    sub_10000BB54();
    sub_10000BAB4((uint64_t)v32);
    uint64_t v16 = 93LL;
  }

  else
  {
    sub_1000076EC();
    sub_1000076AC();
    uint64_t v17 = (uint64_t)v37;
    uint64_t v18 = sub_100005218(&v34, (uint64_t)v37);
    uint64_t v19 = sub_10000B99C((uint64_t)v18, v17);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = v19;
    sub_10000BB54();
    sub_10000B610((uint64_t)v32, (uint64_t *)&unk_10001A570);
    uint64_t v16 = 58LL;
  }

  unint64_t v20 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v16);
  sub_10000BB8C();
  sub_10000BA70();
  sub_1000044EC(&v34);
  LogMessage.init(stringLiteral:)(0x6863206574617453LL, 0xEE003A6465676E61LL);
  uint64_t v37 = &unk_100014BF0;
  id v34 = (id)sub_10000B984((uint64_t)&unk_100014E00, 57LL);
  sub_10000B594(v2, (uint64_t)v34 + 16);
  sub_10000B5D0(v2);
  static LogMessage.safe(_:)(&v34);
  sub_10000B610((uint64_t)&v34, (uint64_t *)&unk_10001A570);
  sub_100005588(v7);
  swift_bridgeObjectRelease(v7);
  sub_10000B594(v2, (uint64_t)&v34);
  if (v39)
  {
    if (v39 == 1)
    {
      id v22 = v34;
      uint64_t v21 = v35;
      uint64_t v23 = v38;
      id v24 = v36;
      swift_retain(v23);
      id v25 = v22;
      swift_unknownObjectRetain(v21);
      sub_100009940();

      swift_unknownObjectRelease(v21);
      sub_10000BA78();
    }

    else
    {
      uint64_t v29 = (uint64_t)v34;
      uint64_t v30 = (uint64_t)v35;
      uint64_t v31 = (uint64_t)v36;
      swift_errorRetain(v34);
      sub_100005208(v30, v31);
      sub_1000097E0(v29, v30, v31);
      sub_10000523C(v30, v31);
      swift_errorRelease(v29);
    }
  }

  else
  {
    uint64_t v26 = (uint64_t)v34;
    uint64_t v27 = v35;
    id v28 = v34;
    swift_errorRetain(v27);
    sub_10000947C(v26, v27);
    swift_errorRelease(v27);
  }

  sub_10000B958();
}

void sub_10000A700()
{
  uint64_t v1 = v0;
  sub_10000BB98();
  sub_10000B9E4();
  __chkstk_darwin(v2);
  sub_10000BAD4();
  if (v1)
  {
    unint64_t v60 = 0xD000000000000030LL;
    unint64_t v61 = 0x8000000100010090LL;
    AnyHashable.init<A>(_:)(&v60);
    sub_10000BA94();
    uint64_t v3 = sub_1000071B8((uint64_t)v62);
    if (v66)
    {
      uint64_t v4 = sub_100004138(&qword_10001A580);
      if ((sub_10000BA3C(v4, v5, v6, v4) & 1) == 0) {
        goto LABEL_11;
      }
      uint64_t v7 = v60;
      unint64_t v60 = 0xD000000000000023LL;
      unint64_t v61 = 0x8000000100010110LL;
      AnyHashable.init<A>(_:)(&v60);
      sub_10000BA94();
      uint64_t v8 = sub_1000071B8((uint64_t)v62);
      if (v66)
      {
        uint64_t v9 = sub_1000075EC(v8, &qword_10001A588, &OBJC_CLASS___NSXPCListenerEndpoint_ptr);
        if ((sub_10000BA3C(v9, v10, v11, v9) & 1) != 0)
        {
          uint64_t v12 = (void *)v60;
          __int16 v13 = sub_100005DF4(v7);
          sub_10000BA80();
          uint64_t v14 = (void *)sub_100004138((uint64_t *)&unk_10001A470);
          uint64_t v15 = *(void *)(*(void *)(sub_10000BAAC() - 8) + 72LL);
          sub_10000BB74();
          uint64_t v19 = v18 & ~v17;
          uint64_t v20 = v17 | 7;
          if ((v13 & 0x100) != 0)
          {
            uint64_t v46 = sub_10000BBA0(v16, v19 + 3 * v15, v20);
            *(_OWORD *)(v46 + swift_weakDestroy(v0 + 16) = xmmword_10000F540;
            uint64_t v47 = type metadata accessor for RemoteEngagementViewController();
            id v48 = sub_10000BA88(v47);
            id v49 = (id)AMSLogKey(v48);
            if (v49)
            {
              uint64_t v58 = sub_10000BB0C((uint64_t)v49);
              Swift::String v59 = v12;
              uint64_t v51 = v50;

              sub_1000076D0();
              sub_10000B98C();
              sub_10000B934();
              uint64_t v52 = sub_10000B9DC();
              sub_10000B970(v52);
              sub_10000BB28();
              sub_100007638();
              id v66 = &type metadata for String;
              uint64_t v64 = v58;
              uint64_t v65 = v51;
              uint64_t v12 = v59;
              sub_10000BB20();
              sub_10000BB28();
              v53._uint64_t countAndFlagsBits = 93LL;
            }

            else
            {
              sub_1000076EC();
              sub_10000B98C();
              sub_10000B934();
              uint64_t v56 = sub_10000B9DC();
              uint64_t v57 = sub_10000B970(v56);
              sub_10000BA34(v57, (uint64_t *)&unk_10001A570);
              v53._uint64_t countAndFlagsBits = 58LL;
            }

            v53._object = (void *)0xE100000000000000LL;
            sub_10000B9B0(v53);
            sub_10000BBD0();
            sub_10000BA70();
            sub_10000BA20();
            sub_10000BB80(0xD00000000000001ALL);
            unint64_t v63 = &unk_100014D38;
            v62[0] = v13;
            static LogMessage.safe(_:)(v62);
            sub_10000B610((uint64_t)v62, (uint64_t *)&unk_10001A570);
            sub_1000053FC(v46);
          }

          else
          {
            uint64_t v21 = sub_10000BBA0(v16, v19 + 2 * v15, v20);
            *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
            uint64_t v22 = type metadata accessor for RemoteEngagementViewController();
            id v23 = sub_10000BA88(v22);
            id v24 = (id)AMSLogKey(v23);
            if (v24)
            {
              uint64_t v25 = sub_10000BB0C((uint64_t)v24);
              uint64_t v27 = v26;

              sub_1000076D0();
              sub_10000B98C();
              sub_10000B934();
              uint64_t v28 = sub_10000B9DC();
              sub_10000B970(v28);
              sub_10000B610((uint64_t)&v64, (uint64_t *)&unk_10001A570);
              sub_100007638();
              id v66 = &type metadata for String;
              uint64_t v64 = v25;
              uint64_t v65 = v27;
              sub_10000BB20();
              sub_10000B610((uint64_t)&v64, (uint64_t *)&unk_10001A570);
              v29._uint64_t countAndFlagsBits = 93LL;
            }

            else
            {
              sub_1000076EC();
              sub_10000B98C();
              sub_10000B934();
              uint64_t v54 = sub_10000B9DC();
              uint64_t v55 = sub_10000B970(v54);
              sub_10000BA34(v55, (uint64_t *)&unk_10001A570);
              v29._uint64_t countAndFlagsBits = 58LL;
            }

            v29._object = (void *)0xE100000000000000LL;
            sub_10000B9B0(v29);
            sub_10000BBD0();
            sub_10000BA70();
            sub_10000BA20();
            LogMessage.init(stringLiteral:)(0xD000000000000016LL, 0x8000000100010160LL);
            sub_100005588(v21);
          }

          sub_10000BA80();
          sub_100008138();

          goto LABEL_15;
        }

        sub_10000BA80();
LABEL_11:
        uint64_t v30 = (void *)sub_100004138((uint64_t *)&unk_10001A470);
        uint64_t v31 = *(void *)(*(void *)(sub_10000BAAC() - 8) + 72LL);
        sub_10000BB74();
        uint64_t v35 = sub_10000BBA0(v34, (v33 & ~v32) + 2 * v31, v32 | 7);
        *(_OWORD *)(v35 + swift_weakDestroy(v0 + 16) = xmmword_10000FAC0;
        uint64_t v36 = type metadata accessor for RemoteEngagementViewController();
        id v37 = sub_10000BA88(v36);
        id v38 = (id)AMSLogKey(v37);
        if (v38)
        {
          uint64_t v39 = sub_10000BB0C((uint64_t)v38);
          uint64_t v41 = v40;

          sub_1000076D0();
          sub_10000B98C();
          sub_10000B934();
          uint64_t v42 = sub_10000B9DC();
          sub_10000B970(v42);
          sub_10000BAB4((uint64_t)&v64);
          sub_100007638();
          id v66 = &type metadata for String;
          uint64_t v64 = v39;
          uint64_t v65 = v41;
          sub_10000BB20();
          sub_10000BAB4((uint64_t)&v64);
          v43._uint64_t countAndFlagsBits = 93LL;
        }

        else
        {
          sub_1000076EC();
          sub_10000B98C();
          sub_10000B934();
          uint64_t v44 = sub_10000B9DC();
          uint64_t v45 = sub_10000B970(v44);
          sub_10000BA34(v45, (uint64_t *)&unk_10001A570);
          v43._uint64_t countAndFlagsBits = 58LL;
        }

        v43._object = (void *)0xE100000000000000LL;
        sub_10000B9B0(v43);
        sub_10000BBD0();
        sub_10000BA70();
        sub_10000BA20();
        sub_10000BB80(0xD000000000000031LL);
        sub_1000053FC(v35);
        sub_10000BA80();
LABEL_15:
        sub_10000B958();
        return;
      }

      uint64_t v3 = sub_10000BA80();
    }

    sub_10000BA34(v3, (uint64_t *)&unk_10001A570);
    goto LABEL_11;
  }

  __break(1u);
}

uint64_t sub_10000AD18(uint64_t a1)
{
  uint64_t v1 = sub_100004138(&qword_10001A660);
  uint64_t v2 = sub_10000B984(v1, 192LL);
  *(_OWORD *)(v2 + swift_weakDestroy(v0 + 16) = xmmword_10000FAD0;
  uint64_t v3 = sub_1000075EC(v2, &qword_10001A668, &OBJC_CLASS___NSDictionary_ptr);
  uint64_t v4 = sub_100004138((uint64_t *)&unk_10001A670);
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 32) = v3;
  uint64_t v5 = sub_1000075EC(v4, &qword_10001A4A8, &OBJC_CLASS___NSNumber_ptr);
  uint64_t v6 = sub_100004138(&qword_10001A680);
  *(void *)(v2 + 88) = v6;
  *(void *)(v2 + 64) = v5;
  uint64_t v7 = sub_1000075EC(v6, &qword_10001A688, &OBJC_CLASS___NSString_ptr);
  uint64_t v8 = sub_100004138(&qword_10001A690);
  *(void *)(v2 + 120) = v8;
  *(void *)(v2 + 96) = v7;
  uint64_t v9 = sub_1000075EC(v8, &qword_10001A698, &OBJC_CLASS___NSData_ptr);
  uint64_t v10 = sub_100004138(&qword_10001A6A0);
  *(void *)(v2 + 152) = v10;
  *(void *)(v2 + 128) = v9;
  uint64_t v11 = sub_1000075EC(v10, &qword_10001A588, &OBJC_CLASS___NSXPCListenerEndpoint_ptr);
  *(void *)(v2 + 184) = sub_100004138(&qword_10001A6A8);
  *(void *)(v2 + 160) = v11;
  id v12 = sub_10000AF78(v2);
  uint64_t v18 = 0LL;
  static Set._conditionallyBridgeFromObjectiveC(_:result:)( v12,  &v18,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

  uint64_t v13 = v18;
  if (v18)
  {
    id v14 =  [(id)objc_opt_self(NSXPCInterface) interfaceWithProtocol:&OBJC_PROTOCOL___PBSViewServicePresenter];
    Class isa = sub_10000BAFC().super.isa;
    sub_10000BBA8( v14,  "setClasses:forSelector:argumentIndex:ofReply:",  (uint64_t)isa,  (uint64_t)"viewServiceBeginPresentationWithOptions:");

    Class v16 = sub_10000BAFC().super.isa;
    swift_bridgeObjectRelease(v13);
    sub_10000BBA8( v14,  "setClasses:forSelector:argumentIndex:ofReply:",  (uint64_t)v16,  (uint64_t)"viewServiceEndPresentationWithOptions:completion:");

    return (uint64_t)v14;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000004BLL,  0x80000001000103A0LL,  "AMSEngagementViewService/RemoteEngagementViewController_tvOS.swift",  66LL,  2LL,  279LL,  0);
    __break(1u);
  }

  return result;
}

id sub_10000AF78(uint64_t a1)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v5 = [v3 initWithArray:isa];

  return v5;
}

id sub_10000B000()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  return sub_10000BA2C(v0, "interfaceWithProtocol:");
}

id sub_10000B050(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] = 0LL;
  uint64_t v6 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter;
  uint64_t v7 = sub_10000BA00();
  sub_10000B984(v7, 64LL);
  uint64_t v8 = v3;
  *(void *)&v3[v6] = sub_100007078();
  *(void *)&v8[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task] = 0LL;

  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v9 = 0LL;
  }

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id sub_10000B18C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] = 0LL;
  uint64_t v3 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter;
  uint64_t v4 = sub_10000BA00();
  sub_10000B984(v4, 64LL);
  id v5 = v1;
  *(void *)&v1[v3] = sub_100007078();
  *(void *)&v5[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task] = 0LL;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

uint64_t type metadata accessor for RemoteEngagementViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService30RemoteEngagementViewController);
}

id sub_10000B274@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, NSURL *a3@<X8>)
{
  uint64_t v4 = v3;
  URL._bridgeToObjectiveC()(a3);
  objc_super v8 = v7;
  id v9 = [v4 initWithURL:v7 bag:a2];
  swift_unknownObjectRelease(a2);

  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(a1, v10);
  return v9;
}

unint64_t sub_10000B2F0(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000B384(a1, a2, v5);
}

unint64_t sub_10000B354(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10000B464(a1, v4);
}

unint64_t sub_10000B384(uint64_t a1, uint64_t a2, uint64_t a3)
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
        id v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_10000B464(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_10000B528(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000071B8((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_10000B528(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B564()
{
  return swift_deallocObject(v0, 57LL, 7LL);
}

uint64_t sub_10000B594(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B5D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

void sub_10000B610(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004138(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_1000039A4();
}

uint64_t sub_10000B648()
{
  uint64_t v1 = sub_10000BABC();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000B664()
{
  swift_unknownObjectRelease(*(void *)(v0 + 32));
  swift_release(*(void *)(v0 + 56));
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_10000B6A4()
{
}

uint64_t sub_10000B6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_10000B6C0()
{
  swift_release(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000B6F0(uint64_t a1, uint64_t a2)
{
  return sub_10000A268( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32));
}

uint64_t sub_10000B6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B70C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000B714()
{
  if (v0[4]) {
    swift_release(v0[5]);
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_10000B74C()
{
}

uint64_t sub_10000B758()
{
  uint64_t v1 = sub_10000BABC();
  return swift_deallocObject(v1, v2, v3);
}

void sub_10000B774()
{
}

uint64_t sub_10000B77C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void sub_10000B7C0()
{
}

uint64_t sub_10000B7C8()
{
  return swift_deallocObject(v0, 25LL, 7LL);
}

void sub_10000B7E8()
{
}

uint64_t sub_10000B7F4()
{
  return sub_100008F78(*(void **)(v0 + 16));
}

uint64_t sub_10000B7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004138((uint64_t *)&unk_10001A570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_10000B844()
{
}

void sub_10000B84C()
{
}

void sub_10000B854(uint64_t a1)
{
}

void sub_10000B85C(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_10000B77C(a2);
    atomic_store(sub_10000BB5C(v3), a1);
  }

  sub_1000039A4();
}

uint64_t sub_10000B890(uint64_t a1)
{
  return sub_1000078A4(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000B898()
{
  uint64_t v1 = sub_10000BABC();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000B8B4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

void sub_10000B8C0(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_10000BB5C(v3), a1);
  }

  sub_1000039A4();
}

uint64_t sub_10000B934()
{
  uint64_t v1 = *(void *)(v0 - 128);
  uint64_t v2 = sub_100005218((void *)(v0 - 152), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

  ;
}

uint64_t sub_10000B970(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 112);
}

uint64_t sub_10000B984(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

void sub_10000B98C()
{
  v0._uint64_t countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_10000B99C(uint64_t a1, uint64_t a2)
{
  return swift_getDynamicType(a1, a2, 1LL);
}

uint64_t sub_10000B9A4(uint64_t a1)
{
  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

void sub_10000B9B0(Swift::String a1)
{
}

  ;
}

id sub_10000B9D0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_10000B9DC()
{
  return swift_getMetatypeMetadata();
}

  ;
}

void sub_10000B9F4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)(v2 + a2);
  *(void *)(v2 + a2) = a1;
}

uint64_t sub_10000BA00()
{
  return type metadata accessor for RemoteEngagementPresenter();
}

  ;
}

uint64_t sub_10000BA20()
{
  return sub_1000044EC((void *)(v0 - 152));
}

id sub_10000BA2C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

void sub_10000BA34(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_10000BA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(v5 - 168, v5 - 112, v4 + 8, a4, 6LL);
}

  ;
}

  ;
}

uint64_t sub_10000BA70()
{
  return type metadata accessor for Log();
}

uint64_t sub_10000BA78()
{
  return swift_release(v0);
}

uint64_t sub_10000BA80()
{
  return swift_bridgeObjectRelease(v0);
}

id sub_10000BA88(uint64_t a1)
{
  *(void *)(v2 - 128) = a1;
  *(void *)(v2 - 152) = v1;
  return v1;
}

double sub_10000BA94()
{
  return sub_100007730(v1 - 152, v0, (_OWORD *)(v1 - 112));
}

void *sub_10000BAA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _Block_copy(&a9);
}

uint64_t sub_10000BAAC()
{
  return type metadata accessor for LogMessage(0LL);
}

void sub_10000BAB4(uint64_t a1)
{
}

uint64_t sub_10000BABC()
{
  return v0;
}

uint64_t sub_10000BACC()
{
  return swift_release(*(void *)(v0 + 16));
}

  ;
}

  ;
}

NSSet sub_10000BAFC()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10000BB0C(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_10000BB14(uint64_t a1, uint64_t a2)
{
  return sub_10000B604(a1, a2, 1LL, v2);
}

uint64_t sub_10000BB20()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 112);
}

void sub_10000BB28()
{
}

uint64_t sub_10000BB34@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_10000BB40()
{
  return swift_release(v0);
}

id sub_10000BB48()
{
  return v0;
}

uint64_t sub_10000BB54()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 160);
}

uint64_t sub_10000BB5C(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_10000BB68@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_allocObject(v2, a1, a2 | 7);
}

  ;
}

uint64_t sub_10000BB80(uint64_t a1)
{
  return LogMessage.init(stringLiteral:)(a1, (v1 - 32) | 0x8000000000000000LL);
}

uint64_t sub_10000BB8C()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_10000BB98()
{
  return type metadata accessor for LogMessage.StringInterpolation(0LL);
}

uint64_t sub_10000BBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocObject(v3, a2, a3);
}

id sub_10000BBA8(id a1, SEL a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, a2, a3, a4, 0, 0);
}

uint64_t sub_10000BBB4()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 144);
}

void sub_10000BBBC()
{
}

void sub_10000BBC8()
{
}

uint64_t sub_10000BBD0()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

void sub_10000BBF8()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window);
  sub_1000039A4();
}

void sub_10000BC68(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window);
  *(void *)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window) = a1;
}

void sub_10000BC7C(int a1, int a2, id a3)
{
  id v4 = [a3 URLContexts];
  sub_100007230(0LL, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
  sub_10000E298(&qword_10001A770, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
  uint64_t v5 = sub_10000E7F8((uint64_t)v4);

  uint64_t v6 = sub_10000BE34(v5);
  swift_bridgeObjectRelease(v5);
  if (v6 < 1)
  {
    id v10 = [a3 userActivities];
    uint64_t v11 = sub_100007230(0LL, &qword_10001A778, &OBJC_CLASS___NSUserActivity_ptr);
    sub_10000E298((unint64_t *)&unk_10001A780, &qword_10001A778, &OBJC_CLASS___NSUserActivity_ptr);
    uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v10, v11, v12);

    id v14 = (id)sub_10000BE54(v13);
    sub_10000E6BC();
    if (v14)
    {
      sub_10000D960(v14);
    }
  }

  else
  {
    id v7 = [a3 URLContexts];
    uint64_t v8 = sub_10000E7F8((uint64_t)v7);

    sub_10000BFD0(v9, v8);
    swift_bridgeObjectRelease(v8);
  }

uint64_t sub_10000BE34(uint64_t a1)
{
  if ((a1 & 0xC000000000000001LL) == 0) {
    return *(void *)(a1 + 16);
  }
  if (a1 >= 0) {
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  return __CocoaSet.count.getter(a1);
}

uint64_t sub_10000BE54(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 >= 0) {
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t v2 = __CocoaSet.startIndex.getter(a1);
    uint64_t v4 = v3;
    char v5 = 1;
  }

  else
  {
    uint64_t v2 = sub_10000E58C(a1);
    uint64_t v4 = v6;
    char v5 = v7 & 1;
  }

  uint64_t v8 = sub_10000E2D4(v1);
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  char v13 = sub_10000E60C(v2, v4, v5, v8, v9, v11 & 1);
  sub_10000E640(v8, v10, v12);
  if ((v13 & 1) != 0)
  {
    sub_10000E640(v2, v4, v5);
    return 0LL;
  }

  else
  {
    sub_10000E324(v2, v4, v5, v1);
    uint64_t v14 = v15;
    sub_10000E640(v2, v4, v5);
  }

  return v14;
}

void sub_10000BFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10000E828();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10000BAD4();
  uint64_t v7 = v6 - v5;
  if ((a2 & 0xC000000000000001LL) != 0)
  {
    if (a2 < 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_10000E7E8();
    uint64_t v9 = __CocoaSet.makeIterator()(v8);
    uint64_t v10 = sub_100007230(0LL, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
    sub_10000E298(&qword_10001A770, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
    char v12 = Set.Iterator.init(_cocoa:)(v37, v9, v10, v11);
    a2 = v37[0];
    uint64_t v34 = v37[1];
    uint64_t v13 = v37[2];
    int64_t v14 = v37[3];
    unint64_t v15 = v37[4];
  }

  else
  {
    uint64_t v16 = -1LL << *(_BYTE *)(a2 + 32);
    uint64_t v34 = a2 + 56;
    uint64_t v13 = ~v16;
    uint64_t v17 = -v16;
    if (v17 < 64) {
      uint64_t v18 = ~(-1LL << v17);
    }
    else {
      uint64_t v18 = -1LL;
    }
    unint64_t v15 = v18 & *(void *)(a2 + 56);
    char v12 = (void *)sub_10000E7E8();
    int64_t v14 = 0LL;
  }

  int64_t v33 = (unint64_t)(v13 + 64) >> 6;
  if (a2 < 0) {
    goto LABEL_13;
  }
  while (1)
  {
    if (v15)
    {
      uint64_t v19 = (v15 - 1) & v15;
      unint64_t v20 = __clz(__rbit64(v15)) | (v14 << 6);
      int64_t v21 = v14;
      goto LABEL_30;
    }

    int64_t v26 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v26 >= v33) {
      goto LABEL_33;
    }
    unint64_t v27 = *(void *)(v34 + 8 * v26);
    int64_t v21 = v14 + 1;
    if (!v27)
    {
      int64_t v21 = v14 + 2;
      if (v14 + 2 >= v33) {
        goto LABEL_33;
      }
      unint64_t v27 = *(void *)(v34 + 8 * v21);
      if (!v27)
      {
        int64_t v21 = v14 + 3;
        if (v14 + 3 >= v33) {
          goto LABEL_33;
        }
        unint64_t v27 = *(void *)(v34 + 8 * v21);
        if (!v27)
        {
          int64_t v21 = v14 + 4;
          if (v14 + 4 >= v33) {
            goto LABEL_33;
          }
          unint64_t v27 = *(void *)(v34 + 8 * v21);
          if (!v27)
          {
            int64_t v28 = v14 + 5;
            while (v28 < v33)
            {
              unint64_t v27 = *(void *)(v34 + 8 * v28++);
              if (v27)
              {
                int64_t v21 = v28 - 1;
                goto LABEL_29;
              }
            }

LABEL_33:
            sub_100004548(a2);
            sub_10000B958();
            return;
          }
        }
      }
    }

LABEL_29:
    uint64_t v19 = (v27 - 1) & v27;
    unint64_t v20 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_30:
    id v25 = *(id *)(*(void *)(a2 + 48) + 8 * v20);
    if (!v25) {
      goto LABEL_33;
    }
    while (1)
    {
      id v29 = [v25 URL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v30 = (void *)sub_10000E22C([v25 options]);
      uint64_t v32 = v31;
      sub_10000C430(v7, v30, v31);

      swift_bridgeObjectRelease(v32);
      char v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
      int64_t v14 = v21;
      unint64_t v15 = v19;
      if ((a2 & 0x8000000000000000LL) == 0) {
        break;
      }
LABEL_13:
      uint64_t v22 = __CocoaSet.Iterator.next()(v12);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v35 = v22;
        uint64_t v24 = sub_100007230(0LL, &qword_10001A768, &OBJC_CLASS___UIOpenURLContext_ptr);
        swift_unknownObjectRetain(v23);
        swift_dynamicCast(&v36, &v35, (char *)&type metadata for Swift.AnyObject + 8, v24, 7LL);
        id v25 = v36;
        swift_unknownObjectRelease(v23);
        int64_t v21 = v14;
        uint64_t v19 = v15;
        if (v25) {
          continue;
        }
      }

      goto LABEL_33;
    }
  }

  __break(1u);
}

void sub_10000C3C8(uint64_t a1, void *a2)
{
}

void sub_10000C430(uint64_t a1, void *a2, uint64_t a3)
{
  id v178 = a2;
  uint64_t v181 = a1;
  sub_100004138(&qword_10001A750);
  sub_10000B9E4();
  __chkstk_darwin(v6);
  sub_10000E714();
  uint64_t v8 = sub_10000E774(v7);
  uint64_t v180 = type metadata accessor for URLQueryItem(v8);
  uint64_t v179 = *(void *)(v180 - 8);
  sub_10000E6D0();
  __chkstk_darwin(v9);
  sub_10000E69C();
  uint64_t v177 = v10;
  sub_10000E708();
  __chkstk_darwin(v11);
  uint64_t v169 = (uint64_t)&v165 - v12;
  sub_100004138((uint64_t *)&unk_10001A740);
  sub_10000B9E4();
  __chkstk_darwin(v13);
  sub_10000E714();
  uint64_t v15 = sub_10000E774(v14);
  uint64_t v174 = type metadata accessor for URLComponents(v15);
  uint64_t v173 = *(void *)(v174 - 8);
  sub_10000E6D0();
  __chkstk_darwin(v16);
  sub_10000E714();
  uint64_t v18 = sub_10000E774(v17);
  type metadata accessor for LogMessage.StringInterpolation(v18);
  sub_10000B9E4();
  __chkstk_darwin(v19);
  sub_10000E69C();
  uint64_t v168 = v20;
  sub_10000E708();
  __chkstk_darwin(v21);
  uint64_t v22 = sub_100004138((uint64_t *)&unk_10001A470);
  type metadata accessor for LogMessage(0LL);
  sub_10000E830();
  uint64_t v25 = v24 & ~v23;
  uint64_t v27 = v26;
  uint64_t v182 = v23 | 7;
  uint64_t v183 = v22;
  uint64_t v28 = swift_allocObject(v22, v25 + 5 * v26, v23 | 7);
  *(_OWORD *)(v28 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAD0;
  uint64_t v185 = v25;
  uint64_t v184 = type metadata accessor for SceneDelegate();
  *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = v184;
  *(void *)&__int128 aBlock = v3;
  id v175 = v3;
  id v29 = (id)AMSLogKey(v175);
  if (v29)
  {
    uint64_t v30 = sub_10000BB0C((uint64_t)v29);
    sub_10000E794();
    sub_10000E674();
    sub_10000B98C();
    sub_100007608();
    uint64_t v31 = sub_10000B9DC();
    sub_10000E650(v31);
    sub_10000E844();
    sub_100007638();
    v195 = &type metadata for String;
    uint64_t v193 = v30;
    uint64_t v194 = v4;
    sub_10000E6E4();
    sub_10000E844();
    v32._uint64_t countAndFlagsBits = 93LL;
  }

  else
  {
    sub_10000E664();
    sub_10000B98C();
    sub_100007608();
    uint64_t v33 = sub_10000B9DC();
    uint64_t v34 = sub_10000E650(v33);
    sub_10000E6DC(v34, (uint64_t *)&unk_10001A570);
    v32._uint64_t countAndFlagsBits = 58LL;
  }

  v32._object = (void *)0xE100000000000000LL;
  sub_10000B9B0(v32);
  sub_10000BBD0();
  sub_10000E810();
  uint64_t v35 = v27;
  sub_10000BB80(0xD000000000000018LL);
  uint64_t v36 = sub_10000E828();
  *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = v36;
  id v37 = sub_10000717C(&aBlock);
  uint64_t v38 = v181;
  sub_10000E818((uint64_t)v37, v181, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16LL));
  uint64_t v39 = static LogMessage.safe(_:)(&aBlock);
  sub_10000E748(v39, (uint64_t *)&unk_10001A570);
  uint64_t v40 = 3 * v35;
  LogMessage.init(stringLiteral:)(0x7020656372756F73LL, 0xEF3A737365636F72LL);
  if (a3)
  {
    *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = &type metadata for String;
    *(void *)&__int128 aBlock = v178;
    *((void *)&aBlock + Hasher._combine(_:)(v1 & 1) = a3;
  }

  else
  {
    __int128 aBlock = 0u;
    __int128 v190 = 0u;
  }

  uint64_t v41 = 2 * v35;
  uint64_t v42 = type metadata accessor for Log();
  swift_bridgeObjectRetain(a3);
  uint64_t v43 = static LogMessage.safe(_:)(&aBlock);
  sub_10000E748(v43, (uint64_t *)&unk_10001A570);
  uint64_t v176 = v42;
  sub_100005588(v28);
  uint64_t v44 = swift_bridgeObjectRelease(v28);
  uint64_t v45 = URL.scheme.getter(v44);
  if (!v46) {
    goto LABEL_13;
  }
  BOOL v47 = v45 == 0x7564732D736D61LL && v46 == 0xE700000000000000LL;
  if (v47)
  {
    sub_10000E820();
  }

  else
  {
    char v48 = sub_100005340(v45, v46, 0x7564732D736D61LL, 0xE700000000000000LL);
    sub_10000E820();
    if ((v48 & 1) == 0)
    {
LABEL_13:
      uint64_t v49 = type metadata accessor for EngagementDeepLinkController();
      uint64_t v50 = sub_10000B984(v49, 16LL);
      uint64_t v51 = sub_1000039AC(v38, (uint64_t)v178, a3);
      char v53 = v52;
      swift_setDeallocating(v50);
      uint64_t v54 = swift_deallocClassInstance(v50, 16LL, 7LL);
      if ((v53 & 1) == 0)
      {
        id v55 = [objc_allocWithZone(AMSEngagement) init];
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        sub_10000E1DC(v51, 0);
        id v57 = [v55 enqueueData:isa];

        *(void *)&__int128 aBlock = 0LL;
        id v58 = [v57 resultWithError:&aBlock];

        unint64_t v60 = (void *)aBlock;
        if (!v58)
        {
          id v105 = (id)aBlock;
          uint64_t v106 = _convertNSErrorToError(_:)(v60);

          uint64_t v107 = swift_willThrow();
          uint64_t v108 = sub_10000E79C(v107, v185 + v40);
          *(_OWORD *)(v108 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000F540;
          id v109 = sub_10000E684();
          id v110 = (id)AMSLogKey(v109);
          if (v110)
          {
            sub_10000BB0C((uint64_t)v110);
            sub_10000E784();
            sub_10000E674();
            sub_10000B98C();
            sub_100007608();
            uint64_t v111 = sub_10000B9DC();
            sub_10000E650(v111);
            sub_10000E750();
            sub_100007638();
            v195 = &type metadata for String;
            uint64_t v193 = 2 * v35;
            uint64_t v194 = (uint64_t)&loc_10000F000;
            sub_10000E6E4();
            sub_10000E7BC();
            v112._uint64_t countAndFlagsBits = 93LL;
          }

          else
          {
            sub_10000E664();
            sub_10000B98C();
            sub_100007608();
            uint64_t v121 = sub_10000B9DC();
            uint64_t v122 = sub_10000E650(v121);
            sub_10000E6DC(v122, (uint64_t *)&unk_10001A570);
            v112._uint64_t countAndFlagsBits = 58LL;
          }

          v112._object = (void *)0xE100000000000000LL;
          sub_10000B9B0(v112);
          sub_10000BBD0();
          sub_1000044EC(&aBlock);
          LogMessage.init(stringLiteral:)(0xD000000000000027LL, 0x80000001000104D0LL);
          swift_getErrorValue(v106, v188, &v186);
          uint64_t v123 = v186;
          uint64_t v124 = v187;
          *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = v187;
          v125 = sub_10000717C(&aBlock);
          (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v124 - 8) + 16LL))(v125, v123, v124);
          uint64_t v126 = sub_10000E804();
          sub_10000E748(v126, (uint64_t *)&unk_10001A570);
          sub_1000053FC(v108);
          sub_10000E6BC();
          swift_errorRelease(v106);
          goto LABEL_59;
        }

        uint64_t v61 = v185;
        uint64_t v62 = sub_10000E79C(v59, v185 + v40);
        *(_OWORD *)(v62 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000F540;
        sub_10000E684();
        id v63 = (id)AMSLogKey(v60);
        if (v63)
        {
          sub_10000BB0C((uint64_t)v63);
          sub_10000E784();
          sub_10000E674();
          sub_10000B98C();
          sub_100007608();
          uint64_t v64 = sub_10000B9DC();
          sub_10000E650(v64);
          sub_10000E750();
          sub_100007638();
          v195 = &type metadata for String;
          uint64_t v193 = 2 * v35;
          uint64_t v194 = v61;
          sub_10000E6E4();
          sub_10000E7BC();
          v65._uint64_t countAndFlagsBits = 93LL;
        }

        else
        {
          sub_10000E664();
          sub_10000B98C();
          sub_100007608();
          uint64_t v117 = sub_10000B9DC();
          uint64_t v118 = sub_10000E650(v117);
          sub_10000E6DC(v118, (uint64_t *)&unk_10001A570);
          v65._uint64_t countAndFlagsBits = 58LL;
        }

        v65._object = (void *)0xE100000000000000LL;
        sub_10000B9B0(v65);
        sub_10000BBD0();
        sub_1000044EC(&aBlock);
        sub_10000BB80(0xD000000000000022LL);
        *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = sub_100007230(0LL, &qword_10001A758, &OBJC_CLASS___AMSEngagementEnqueueResult_ptr);
        *(void *)&__int128 aBlock = v58;
        id v119 = v58;
        uint64_t v120 = sub_10000E804();
        sub_10000E748(v120, (uint64_t *)&unk_10001A570);
        sub_100005588(v62);

LABEL_58:
        sub_10000E6BC();
LABEL_59:
        sub_10000B958();
        return;
      }

      uint64_t v71 = sub_10000E79C(v54, v185 + v41);
      *(_OWORD *)(v71 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAC0;
      id v72 = sub_10000E684();
      id v73 = (id)AMSLogKey(v72);
      if (v73)
      {
        uint64_t v74 = sub_10000BB0C((uint64_t)v73);
        sub_10000E794();
        sub_10000E674();
        sub_10000B98C();
        sub_100007608();
        uint64_t v75 = sub_10000B9DC();
        sub_10000E650(v75);
        sub_10000E6B0();
        sub_100007638();
        v195 = &type metadata for String;
        uint64_t v193 = v74;
        uint64_t v194 = 3 * v35;
        sub_10000E6E4();
        sub_10000E6B0();
        v76._uint64_t countAndFlagsBits = 93LL;
      }

      else
      {
        sub_10000E664();
        sub_10000B98C();
        sub_100007608();
        uint64_t v113 = sub_10000B9DC();
        uint64_t v114 = sub_10000E650(v113);
        sub_10000E6DC(v114, (uint64_t *)&unk_10001A570);
        v76._uint64_t countAndFlagsBits = 58LL;
      }

      v76._object = (void *)0xE100000000000000LL;
      sub_10000B9B0(v76);
      sub_10000BBD0();
      sub_1000044EC(&aBlock);
      sub_10000BB80(0xD000000000000019LL);
      uint64_t v115 = v71;
LABEL_57:
      sub_1000053FC(v115);
      goto LABEL_58;
    }
  }

  uint64_t v166 = v185 + v41;
  uint64_t v66 = swift_allocObject(v183, v185 + v41, v182);
  __int128 v167 = xmmword_10000FAC0;
  *(_OWORD *)(v66 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAC0;
  id v178 = sub_10000E684();
  id v67 = (id)AMSLogKey(v178);
  if (v67)
  {
    uint64_t v68 = sub_10000BB0C((uint64_t)v67);
    sub_10000E794();
    sub_10000E674();
    sub_10000B98C();
    sub_100007608();
    uint64_t v69 = sub_10000B9DC();
    sub_10000E650(v69);
    sub_10000E6B0();
    sub_100007638();
    v195 = &type metadata for String;
    uint64_t v193 = v68;
    uint64_t v194 = 3 * v35;
    sub_10000E6E4();
    sub_10000E6B0();
    v70._uint64_t countAndFlagsBits = 93LL;
  }

  else
  {
    sub_10000E664();
    sub_10000B98C();
    sub_100007608();
    uint64_t v77 = sub_10000B9DC();
    uint64_t v78 = sub_10000E650(v77);
    sub_10000E6DC(v78, (uint64_t *)&unk_10001A570);
    v70._uint64_t countAndFlagsBits = 58LL;
  }

  unint64_t v79 = 0xD000000000000027LL;
  v70._object = (void *)0xE100000000000000LL;
  sub_10000B9B0(v70);
  sub_10000BBD0();
  sub_1000044EC(&aBlock);
  sub_10000BB80(0xD00000000000002CLL);
  sub_10000E7DC();
  sub_10000E6BC();
  CFNotificationCenterRef DistributedCenter = CFNotificationCenterGetDistributedCenter();
  if (!DistributedCenter)
  {
    __break(1u);
    goto LABEL_72;
  }

  uint64_t v81 = DistributedCenter;

  uint64_t v82 = v81;
  v83 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v84 = sub_100004138(&qword_10001A760);
  uint64_t v85 = sub_10000B984(v84, 64LL);
  *(_OWORD *)(v85 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000F590;
  *(void *)(v85 + 32) = 7107189LL;
  *(void *)(v85 + 40) = 0xE300000000000000LL;
  uint64_t v86 = v181;
  *(void *)(v85 + 48) = URL.absoluteString.getter(v85);
  *(void *)(v85 + 56) = v87;
  uint64_t v88 = Dictionary.init(dictionaryLiteral:)( v85,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  v89 = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v88);
  CFNotificationCenterPostNotification(v82, v83, 0LL, v89, 1u);

  uint64_t v90 = v171;
  URLComponents.init(url:resolvingAgainstBaseURL:)(v86, 1LL);
  uint64_t v91 = v174;
  if (sub_10000B6B4(v90, 1LL, v174) == 1)
  {
    v92 = (uint64_t *)&unk_10001A740;
    uint64_t v93 = v90;
LABEL_53:
    sub_10000B610(v93, v92);
    id v130 = v178;
    v132 = (__n128 *)sub_10000E79C(v131, v166);
    sub_10000E75C(v132);
    *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = v184;
    *(void *)&__int128 aBlock = v130;
    id v133 = (id)AMSLogKey(v130);
    if (v133)
    {
      uint64_t v134 = sub_10000BB0C((uint64_t)v133);
      sub_10000E794();
      sub_10000E674();
      sub_10000B98C();
      sub_100007608();
      uint64_t v135 = sub_10000B9DC();
      sub_10000E650(v135);
      sub_10000E6B0();
      sub_100007638();
      v195 = &type metadata for String;
      uint64_t v193 = v134;
      uint64_t v194 = v86;
      sub_10000E6E4();
      sub_10000E6B0();
      v136._uint64_t countAndFlagsBits = 93LL;
    }

    else
    {
      sub_10000E664();
      sub_10000B98C();
      sub_100007608();
      uint64_t v137 = sub_10000B9DC();
      uint64_t v138 = sub_10000E650(v137);
      sub_10000E6DC(v138, (uint64_t *)&unk_10001A570);
      v136._uint64_t countAndFlagsBits = 58LL;
    }

    v136._object = (void *)0xE100000000000000LL;
    sub_10000B9B0(v136);
    sub_10000BBD0();
    sub_10000E810();
    sub_10000BB80(v79 + 25);
    uint64_t v115 = v90;
    goto LABEL_57;
  }

  uint64_t v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v173 + 32))(v172, v90, v91);
  uint64_t v95 = URLComponents.queryItems.getter(v94);
  if (!v95)
  {
    v116 = v170;
    sub_10000B604((uint64_t)v170, 1LL, 1LL, v180);
LABEL_52:
    uint64_t v128 = sub_10000E7A4();
    v129(v128, v91);
    v92 = &qword_10001A750;
    uint64_t v93 = (uint64_t)v116;
    goto LABEL_53;
  }

  uint64_t v90 = v95;
  uint64_t v86 = *(void *)(v95 + 16);
  uint64_t v96 = v180;
  if (v86)
  {
    uint64_t v181 = v35;
    uint64_t v91 = v95 + ((*(unsigned __int8 *)(v179 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v179 + 80));
    unint64_t v79 = *(void *)(v179 + 72);
    v97 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 16);
    sub_10000E7E8();
    uint64_t v98 = v177;
    while (1)
    {
      uint64_t v99 = v97(v98, v91, v96);
      uint64_t v100 = URLQueryItem.name.getter(v99);
      if (v100 == 0x656C646E7562LL && v101 == 0xE600000000000000LL)
      {
        sub_10000E6BC();
        unint64_t v127 = 0xE600000000000000LL;
        goto LABEL_49;
      }

      char v103 = sub_100005340(v100, v101, 0x656C646E7562LL, 0xE600000000000000LL);
      sub_10000E820();
      if ((v103 & 1) != 0) {
        break;
      }
      uint64_t v98 = v177;
      uint64_t v96 = v180;
      sub_10000E7D4(v177, *(uint64_t (**)(uint64_t, uint64_t))(v179 + 8));
      v91 += v79;
      if (!--v86)
      {
        sub_10000E6BC();
        sub_10000E728();
        goto LABEL_44;
      }
    }

    unint64_t v127 = v90;
LABEL_49:
    swift_bridgeObjectRelease(v127);
    v116 = v170;
    sub_10000E850((uint64_t)v170, v177, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 32));
    sub_10000E728();
  }

  else
  {
    uint64_t v104 = 1LL;
LABEL_44:
    v116 = v170;
  }

  sub_10000E6C4((uint64_t)v116, v104);
  sub_10000E6BC();
  sub_10000E6EC((uint64_t)v116);
  if (v47) {
    goto LABEL_52;
  }
  uint64_t v139 = v169;
  sub_10000E850(v169, (uint64_t)v116, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 32));
  v140 = (__n128 *)swift_allocObject(v183, v166, v182);
  sub_10000E75C(v140);
  *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = v184;
  *(void *)&__int128 aBlock = v178;
  id v141 = v178;
  id v142 = (id)AMSLogKey(v141);
  if (v142)
  {
    uint64_t v143 = sub_10000BB0C((uint64_t)v142);
    uint64_t v145 = v144;

    sub_10000E674();
    sub_10000B98C();
    sub_100007608();
    uint64_t v146 = sub_10000B9DC();
    sub_10000E650(v146);
    sub_10000E750();
    sub_100007638();
    v195 = &type metadata for String;
    uint64_t v193 = v143;
    uint64_t v194 = v145;
    sub_10000E6E4();
    uint64_t v139 = v169;
    sub_10000B610((uint64_t)&v193, (uint64_t *)&unk_10001A570);
    v147._uint64_t countAndFlagsBits = 93LL;
  }

  else
  {
    sub_10000E664();
    sub_10000B98C();
    sub_100007608();
    uint64_t v148 = sub_10000B9DC();
    uint64_t v149 = sub_10000E650(v148);
    sub_10000E6DC(v149, (uint64_t *)&unk_10001A570);
    v147._uint64_t countAndFlagsBits = 58LL;
  }

  v147._object = (void *)0xE100000000000000LL;
  sub_10000B9B0(v147);
  sub_10000BBD0();
  sub_10000E810();
  uint64_t v150 = v168;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39LL, 1LL);
  v151._object = (void *)0x80000001000105D0LL;
  v151._uint64_t countAndFlagsBits = 0xD000000000000027LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v151);
  uint64_t v152 = URLQueryItem.value.getter();
  if (v153)
  {
    *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = &type metadata for String;
    *(void *)&__int128 aBlock = v152;
    *((void *)&aBlock + Hasher._combine(_:)(v1 & 1) = v153;
  }

  else
  {
    __int128 aBlock = 0u;
    __int128 v190 = 0u;
  }

  uint64_t v154 = LogMessage.StringInterpolation.appendInterpolation(safe:)(&aBlock);
  sub_10000E748(v154, (uint64_t *)&unk_10001A570);
  sub_1000076AC();
  LogMessage.init(stringInterpolation:)(v150);
  sub_10000E7DC();
  sub_10000E6BC();
  id v155 = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (v155)
  {
    v156 = v155;
    URLQueryItem.value.getter();
    if (v157)
    {
      NSString v158 = String._bridgeToObjectiveC()();
      sub_10000E6BC();
    }

    else
    {
      NSString v158 = 0LL;
    }

    uint64_t v159 = sub_10000B984((uint64_t)&unk_1000150D0, 24LL);
    *(void *)(v159 + swift_unknownObjectWeakDestroy(v0 + 16) = v141;
    v191 = sub_10000E20C;
    uint64_t v192 = v159;
    *(void *)&__int128 aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + Hasher._combine(_:)(v1 & 1) = 1107296256LL;
    *(void *)&__int128 v190 = sub_10000D900;
    *((void *)&v190 + Hasher._combine(_:)(v1 & 1) = &unk_1000150E8;
    v160 = _Block_copy(&aBlock);
    uint64_t v161 = v192;
    id v162 = v141;
    swift_release(v161);
    [v156 openApplicationWithBundleIdentifier:v158 usingConfiguration:0 completionHandler:v160];
    _Block_release(v160);

    (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v139, v180);
    uint64_t v163 = sub_10000E7A4();
    v164(v163, v174);
    goto LABEL_59;
  }

LABEL_72:
  __break(1u);
}

uint64_t sub_10000D430(char a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2 && (a1 & 1) == 0)
  {
    uint64_t v23 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v24 = type metadata accessor for LogMessage(0LL);
    uint64_t v25 = swift_allocObject( v23,  ((*(unsigned __int8 *)(*(void *)(v24 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v24 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v24 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v24 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v25 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAC0;
    uint64_t v62 = type metadata accessor for SceneDelegate();
    v61[0] = a3;
    id v26 = a3;
    uint64_t v27 = swift_errorRetain(a2);
    id v28 = (id)AMSLogKey(v27);
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      uint64_t v32 = v31;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v33._uint64_t countAndFlagsBits = 0LL;
      v33._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v33);
      uint64_t v34 = v62;
      uint64_t v35 = sub_100005218(v61, v62);
      uint64_t DynamicType = swift_getDynamicType(v35, v34, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v58 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000B610((uint64_t)&v58, (uint64_t *)&unk_10001A570);
      v37._uint64_t countAndFlagsBits = 5972026LL;
      v37._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v37);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v58 = v30;
      uint64_t v59 = v32;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000B610((uint64_t)&v58, (uint64_t *)&unk_10001A570);
      uint64_t v38 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v45._uint64_t countAndFlagsBits = 0LL;
      v45._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v45);
      uint64_t v46 = v62;
      BOOL v47 = sub_100005218(v61, v62);
      uint64_t v48 = swift_getDynamicType(v47, v46, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v58 = v48;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000B610((uint64_t)&v58, (uint64_t *)&unk_10001A570);
      uint64_t v38 = 58LL;
    }

    unint64_t v49 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v38);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_1000044EC(v61);
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(45LL, 1LL);
    v50._object = (void *)0x8000000100010660LL;
    v50._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v50);
    swift_getErrorValue(a2, v57, &v55);
    uint64_t v51 = v55;
    uint64_t v52 = v56;
    uint64_t v62 = v56;
    char v53 = sub_10000717C(v61);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 16LL))(v53, v51, v52);
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v61);
    sub_10000B610((uint64_t)v61, (uint64_t *)&unk_10001A570);
    v54._uint64_t countAndFlagsBits = 0LL;
    v54._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v54);
    LogMessage.init(stringInterpolation:)(v8);
    sub_100005588(v25);
    swift_bridgeObjectRelease(v25);
    return swift_errorRelease(a2);
  }

  else
  {
    uint64_t v9 = sub_100004138((uint64_t *)&unk_10001A470);
    uint64_t v10 = type metadata accessor for LogMessage(0LL);
    uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v10 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000FAC0;
    uint64_t v62 = type metadata accessor for SceneDelegate();
    v61[0] = a3;
    id v12 = (id)AMSLogKey(a3);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      uint64_t v16 = v15;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v17._uint64_t countAndFlagsBits = 0LL;
      v17._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      uint64_t v18 = v62;
      uint64_t v19 = sub_100005218(v61, v62);
      uint64_t v20 = swift_getDynamicType(v19, v18, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v58 = v20;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000B610((uint64_t)&v58, (uint64_t *)&unk_10001A570);
      v21._uint64_t countAndFlagsBits = 5972026LL;
      v21._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v58 = v14;
      uint64_t v59 = v16;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000B610((uint64_t)&v58, (uint64_t *)&unk_10001A570);
      uint64_t v22 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v39._uint64_t countAndFlagsBits = 0LL;
      v39._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v39);
      uint64_t v40 = v62;
      uint64_t v41 = sub_100005218(v61, v62);
      uint64_t v42 = swift_getDynamicType(v41, v40, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v58 = v42;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000B610((uint64_t)&v58, (uint64_t *)&unk_10001A570);
      uint64_t v22 = 58LL;
    }

    unint64_t v43 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_1000044EC(v61);
    LogMessage.init(stringLiteral:)(0xD000000000000032LL, 0x8000000100010620LL);
    sub_100005588(v11);
    return swift_bridgeObjectRelease(v11);
  }

void sub_10000D900(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

void sub_10000D960(void *a1)
{
  uint64_t v5 = v4 - v3;
  sub_100004138((uint64_t *)&unk_10001A740);
  sub_10000B9E4();
  __chkstk_darwin(v6);
  sub_10000BAD4();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for URLComponents(0LL);
  uint64_t v113 = *(void *)(v10 - 8);
  uint64_t v114 = v10;
  sub_10000E6D0();
  __chkstk_darwin(v11);
  sub_10000E69C();
  uint64_t v111 = v12;
  sub_10000E708();
  __chkstk_darwin(v13);
  uint64_t v112 = (uint64_t)&v102 - v14;
  sub_100004138(&qword_10001A590);
  sub_10000B9E4();
  __chkstk_darwin(v15);
  sub_10000E69C();
  uint64_t v106 = v16;
  sub_10000E708();
  __chkstk_darwin(v17);
  uint64_t v107 = (uint64_t)&v102 - v18;
  sub_10000E708();
  __chkstk_darwin(v19);
  id v109 = (char *)&v102 - v20;
  sub_10000E708();
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v102 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  uint64_t v27 = (char *)&v102 - v26;
  __chkstk_darwin(v25);
  id v29 = (char *)&v102 - v28;
  uint64_t v30 = sub_10000E828();
  uint64_t v116 = *(void *)(v30 - 8);
  sub_10000E6D0();
  __chkstk_darwin(v31);
  sub_10000E69C();
  uint64_t v110 = v32;
  sub_10000E708();
  uint64_t v34 = __chkstk_darwin(v33);
  uint64_t v36 = (char *)&v102 - v35;
  __chkstk_darwin(v34);
  uint64_t v115 = (uint64_t)&v102 - v37;
  uint64_t v117 = a1;
  id v38 = [a1 activityType];
  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
  uint64_t v41 = v40;

  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUserActivityTypeBrowsingWeb);
  BOOL v44 = v39 == v42 && v41 == v43;
  if (v44)
  {
    uint64_t v47 = swift_bridgeObjectRelease_n(v41, 2LL);
  }

  else
  {
    uint64_t v45 = v43;
    char v46 = sub_100005340(v39, v41, v42, v43);
    swift_bridgeObjectRelease(v41);
    uint64_t v47 = swift_bridgeObjectRelease(v45);
    if ((v46 & 1) == 0) {
      goto LABEL_15;
    }
  }

  id v48 = sub_10000E7F0(v47, "webpageURL");
  if (!v48)
  {
    sub_10000E6C4((uint64_t)v29, 1LL);
    goto LABEL_13;
  }

  unint64_t v49 = v48;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10000E7CC((uint64_t)v29, (uint64_t)v36);
  sub_10000E6C4((uint64_t)v29, 0LL);
  sub_10000E6EC((uint64_t)v29);
  if (v44)
  {
LABEL_13:
    uint64_t v52 = &qword_10001A590;
    uint64_t v53 = (uint64_t)v29;
    goto LABEL_14;
  }

  uint64_t v50 = (uint64_t)v29;
  uint64_t v51 = v115;
  sub_10000E7CC(v115, v50);
  URLComponents.init(url:resolvingAgainstBaseURL:)(v51, 1LL);
  if (sub_10000B6B4(v9, 1LL, v114) == 1)
  {
    sub_10000E7D4(v51, *(uint64_t (**)(uint64_t, uint64_t))(v116 + 8));
    uint64_t v52 = (uint64_t *)&unk_10001A740;
    uint64_t v53 = v9;
LABEL_14:
    sub_10000B610(v53, v52);
    goto LABEL_15;
  }

  sub_10000E818(v112, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v113 + 32));
  uint64_t v54 = sub_100004138((uint64_t *)&unk_10001A470);
  type metadata accessor for LogMessage(0LL);
  sub_10000E830();
  uint64_t v57 = v56 & ~v55;
  uint64_t v105 = v58;
  uint64_t v59 = swift_allocObject(v54, v57 + 3 * v58, v55 | 7);
  *(_OWORD *)(v59 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_10000F540;
  uint64_t v103 = v59;
  uint64_t v104 = v59 + v57;
  *((void *)&v121 + Hasher._combine(_:)(v1 & 1) = type metadata accessor for SceneDelegate();
  *(void *)&__int128 v120 = v108;
  id v60 = v108;
  id v61 = (id)AMSLogKey(v60);
  id v108 = v60;
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
    uint64_t v65 = v64;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_1000076AC();
    uint64_t v66 = *((void *)&v121 + 1);
    id v67 = sub_100005218(&v120, *((uint64_t *)&v121 + 1));
    uint64_t DynamicType = swift_getDynamicType(v67, v66, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v118[0] = DynamicType;
    sub_10000BB54();
    sub_10000E858();
    sub_100007638();
    uint64_t MetatypeMetadata = &type metadata for String;
    v118[0] = v63;
    v118[1] = v65;
    sub_10000BB54();
    sub_10000E858();
    uint64_t v69 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_1000076AC();
    uint64_t v70 = *((void *)&v121 + 1);
    uint64_t v71 = sub_100005218(&v120, *((uint64_t *)&v121 + 1));
    uint64_t v72 = swift_getDynamicType(v71, v70, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v118[0] = v72;
    sub_10000BB54();
    sub_10000B610((uint64_t)v118, (uint64_t *)&unk_10001A570);
    uint64_t v69 = 58LL;
  }

  unint64_t v73 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v69);
  LogMessage.init(stringInterpolation:)(v5);
  sub_1000044EC(&v120);
  uint64_t v74 = LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100010470LL);
  id v75 = sub_10000E7F0(v74, "webpageURL");
  if (v75)
  {
    Swift::String v76 = v75;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v77 = 0LL;
  }

  else
  {
    uint64_t v77 = 1LL;
  }

  uint64_t v79 = v113;
  uint64_t v78 = v114;
  uint64_t v80 = v112;
  uint64_t v81 = v103;
  sub_10000E6C4((uint64_t)v24, v77);
  sub_10000E194((uint64_t)v24, (uint64_t)v27);
  sub_10000E6EC((uint64_t)v27);
  if (v44)
  {
    sub_10000B610((uint64_t)v27, &qword_10001A590);
    __int128 v120 = 0u;
    __int128 v121 = 0u;
  }

  else
  {
    *((void *)&v121 + Hasher._combine(_:)(v1 & 1) = v30;
    uint64_t v82 = sub_10000717C(&v120);
    sub_10000E7CC((uint64_t)v82, (uint64_t)v27);
  }

  uint64_t v83 = v111;
  type metadata accessor for Log();
  uint64_t v84 = static LogMessage.safe(_:)(&v120);
  sub_10000E6DC(v84, (uint64_t *)&unk_10001A570);
  sub_100005588(v81);
  swift_bridgeObjectRelease(v81);
  sub_10000E818(v83, v80, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 16));
  uint64_t v85 = URLComponents.scheme.setter(0x69752D736D61LL, 0xE600000000000000LL);
  uint64_t v86 = (uint64_t)v109;
  URLComponents.url.getter(v85);
  sub_10000E6EC(v86);
  if (v44)
  {
    uint64_t v87 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
    v87(v83, v78);
    v87(v80, v78);
    sub_10000E7D4(v115, *(uint64_t (**)(uint64_t, uint64_t))(v116 + 8));
    uint64_t v52 = &qword_10001A590;
    uint64_t v53 = v86;
    goto LABEL_14;
  }

  uint64_t v88 = sub_10000E7CC(v110, v86);
  id v89 = sub_10000E7F0(v88, "referrerURL");
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = v106;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v92 = 0LL;
  }

  else
  {
    uint64_t v92 = 1LL;
    uint64_t v91 = v106;
  }

  sub_10000E6C4(v91, v92);
  uint64_t v93 = v107;
  sub_10000E194(v91, v107);
  if (sub_10000B6B4(v93, 1LL, v30))
  {
    sub_10000B610(v93, &qword_10001A590);
    uint64_t v94 = 0LL;
    uint64_t v95 = 0LL;
    uint64_t v96 = v116;
  }

  else
  {
    uint64_t v96 = v116;
    sub_10000E850((uint64_t)v36, v93, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v116 + 16));
    sub_10000B610(v93, &qword_10001A590);
    uint64_t v94 = (void *)URL.absoluteString.getter(v97);
    uint64_t v95 = v98;
    sub_10000E7D4((uint64_t)v36, *(uint64_t (**)(uint64_t, uint64_t))(v96 + 8));
  }

  uint64_t v99 = v110;
  sub_10000C430(v110, v94, v95);
  swift_bridgeObjectRelease(v95);
  uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
  v100(v99, v30);
  uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
  v101(v83, v78);
  v101(v80, v78);
  v100(v115, v30);
LABEL_15:
  sub_10000B958();
}

id sub_10000E0D8()
{
  *(void *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window] = 0LL;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10000E134()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewService13SceneDelegate);
}

uint64_t sub_10000E194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004138(&qword_10001A590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E1DC(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_10000E1E8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000E20C(char a1, uint64_t a2)
{
  return sub_10000D430(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10000E214(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E224(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000E22C(void *a1)
{
  id v2 = [a1 sourceApplication];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void sub_10000E298(unint64_t *a1, unint64_t *a2, void *a3)
{
  if (!*a1)
  {
    uint64_t v4 = sub_100007230(255LL, a2, a3);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for NSObject, v4), a1);
  }

  sub_1000039A4();
}

uint64_t sub_10000E2D4(uint64_t a1)
{
  if ((a1 & 0xC000000000000001LL) == 0) {
    return 1LL << *(_BYTE *)(a1 + 32);
  }
  if (a1 >= 0) {
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  return __CocoaSet.endIndex.getter(a1);
}

void sub_10000E324(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001LL) == 0)
  {
    if ((a3 & 1) != 0) {
      goto LABEL_13;
    }
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        uint64_t v11 = __CocoaSet.Index.element.getter(v7, a2);
        uint64_t v21 = v11;
        uint64_t v12 = sub_100007230(0LL, &qword_10001A778, &OBJC_CLASS___NSUserActivity_ptr);
        swift_unknownObjectRetain(v11);
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v12, 7LL);
        uint64_t v4 = v22;
        swift_unknownObjectRelease(v11);
        Swift::Int v13 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v14 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v7 = v13 & ~v14;
        if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0)
        {
          id v15 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          char v16 = static NSObject.== infix(_:_:)(v15, v4);

          if ((v16 & 1) == 0)
          {
            uint64_t v17 = ~v14;
            do
            {
              unint64_t v7 = (v7 + 1) & v17;
              if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) == 0) {
                goto LABEL_24;
              }
              id v18 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
              char v19 = static NSObject.== infix(_:_:)(v18, v4);
            }

            while ((v19 & 1) == 0);
          }

LABEL_20:
          id v20 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          return;
        }

uint64_t sub_10000E58C(uint64_t a1)
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

uint64_t sub_10000E60C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) != 0) {
      return static __CocoaSet.Index.== infix(_:_:)(result, a2, a4, a5);
    }
  }

  else if ((a6 & 1) == 0)
  {
    if ((_DWORD)a2 == (_DWORD)a5) {
      return result == a4;
    }
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10000E640(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_10000E650(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 128) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 128);
}

uint64_t sub_10000E664()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
}

uint64_t sub_10000E674()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
}

id sub_10000E684()
{
  *(void *)(v0 - 152) = *(void *)(v0 - 232);
  uint64_t v1 = *(void **)(v0 - 304);
  *(void *)(v0 - 176) = v1;
  return v1;
}

  ;
}

void sub_10000E6B0()
{
}

uint64_t sub_10000E6BC()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000E6C4(uint64_t a1, uint64_t a2)
{
  return sub_10000B604(a1, a2, 1LL, v2);
}

  ;
}

void sub_10000E6DC(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_10000E6E4()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 128);
}

uint64_t sub_10000E6EC(uint64_t a1)
{
  return sub_10000B6B4(a1, 1LL, v1);
}

  ;
}

  ;
}

  ;
}

void sub_10000E748(uint64_t a1, uint64_t *a2)
{
}

void sub_10000E750()
{
}

__n128 sub_10000E75C(__n128 *a1)
{
  __n128 result = *(__n128 *)(v1 - 384);
  a1[1] = result;
  return result;
}

uint64_t sub_10000E774@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0LL;
}

void sub_10000E784()
{
}

void sub_10000E794()
{
}

uint64_t sub_10000E79C(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(*(void *)(v2 - 240), a2, *(void *)(v2 - 248));
}

uint64_t sub_10000E7A4()
{
  return *(void *)(v0 - 328);
}

void sub_10000E7BC()
{
}

uint64_t sub_10000E7CC(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_10000E7D4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_10000E7DC()
{
  return sub_100005588(v0);
}

uint64_t sub_10000E7E8()
{
  return swift_bridgeObjectRetain(v0);
}

id sub_10000E7F0(uint64_t a1, const char *a2)
{
  return [*(id *)(v2 - 168) a2];
}

uint64_t sub_10000E7F8(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, v1, v2);
}

uint64_t sub_10000E804()
{
  return static LogMessage.safe(_:)(v0 - 176);
}

uint64_t sub_10000E810()
{
  return sub_1000044EC((void *)(v0 - 176));
}

uint64_t sub_10000E818@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_10000E820()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000E828()
{
  return type metadata accessor for URL(0LL);
}

  ;
}

void sub_10000E844()
{
}

uint64_t sub_10000E850@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

void sub_10000E858()
{
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC24AMSEngagementViewServiceP33_73DA483C63343F3B2BD6F73E1EFE2ABB19ResourceBundleClass);
}
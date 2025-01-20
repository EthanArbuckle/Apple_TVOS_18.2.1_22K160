id sub_100002988()
{
  void *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id result;
  NSURL *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void v25[2];
  v1 = v0;
  sub_100003A20(0LL);
  __chkstk_darwin();
  v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v4 = type metadata accessor for URL(0LL);
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = [(id)objc_opt_self(NSFileManager) defaultManager];
  NSFileManager.sonicContainerURL.getter();

  sub_100003B2C((uint64_t)v3, 0LL);
  if (sub_100003AB8((uint64_t)v3, 1LL, v4) == 1)
  {
    sub_100003A80((uint64_t)v3, (uint64_t (*)(void))sub_100003A20);
    return &_swiftEmptyArrayStorage;
  }

  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = [v1 filesInDir:v12 matchingPattern:0 excludingPattern:0];

  if (!v14
    || (v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, (char *)&type metadata for Any + 8),
        v14,
        v16 = sub_100002C08(v15),
        swift_bridgeObjectRelease(v15),
        !v16))
  {
    sub_100003B08();
    return &_swiftEmptyArrayStorage;
  }

  v17 = v16[2];
  v9 = &_swiftEmptyArrayStorage;
  if (!v17)
  {
LABEL_12:
    sub_100003B08();
    swift_bridgeObjectRelease(v16);
    return v9;
  }

  v25[0] = &_swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v17);
  v18 = v16 + 5;
  while (1)
  {
    v19 = *(v18 - 1);
    v20 = *v18;
    objc_allocWithZone(&OBJC_CLASS___DEAttachmentItem);
    swift_bridgeObjectRetain_n(v20, 2LL);
    result = sub_1000034A4(v19, v20);
    if (!result) {
      break;
    }
    v21 = result;
    v18 += 2;
    v22 = swift_bridgeObjectRelease(v20);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v22);
    v23 = *(void *)(v25[0] + 16LL);
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
    v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v21);
    specialized ContiguousArray._endMutation()(v24);
    if (!--v17)
    {
      v9 = (void *)v25[0];
      goto LABEL_12;
    }
  }

  __break(1u);
  return result;
}

void *sub_100002C08(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  v14 = &_swiftEmptyArrayStorage;
  sub_100003504(0LL, v2, 0);
  v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_1000037C8(i, (uint64_t)v13);
      if (!swift_dynamicCast( &v11,  v13,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL)) {
        break;
      }
      uint64_t v5 = v11;
      uint64_t v6 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100003504(0LL, v3[2] + 1LL, 1);
        v3 = v14;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_100003504((char *)(v7 > 1), v8 + 1, 1);
        v3 = v14;
      }

      v3[2] = v8 + 1;
      v9 = (char *)&v3[2 * v8];
      *((void *)v9 + 4) = v5;
      *((void *)v9 + 5) = v6;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v12);
    return 0LL;
  }

  return v3;
}

id sub_100002D4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100002D9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SonicDiagnosticsExtension()
{
  return objc_opt_self(&OBJC_CLASS____TtC16SonicDiagnostics25SonicDiagnosticsExtension);
}

void sub_100002DF0(uint64_t a1)
{
  if (!a1 || !sub_100002E6C(a1))
  {
    Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    swift_bridgeObjectRelease(0LL);
  }

  sub_100002988();
  sub_100003B18();
  sub_10000322C(v1);
  swift_bridgeObjectRelease(v1);
  sub_100003B24();
}

unint64_t sub_100002E6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100003448();
    v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }

  sub_100003754(a1, v45);
  uint64_t v4 = v45[0];
  uint64_t v5 = v45[3];
  int64_t v32 = (unint64_t)(v45[2] + 64LL) >> 6;
  uint64_t v33 = v45[1];
  unint64_t v6 = v45[4];
  unint64_t v7 = &__src[40];
  unint64_t v8 = &__dst[40];
  v9 = &v39;
  v10 = &v41;
  unint64_t result = swift_bridgeObjectRetain(a1);
  if (!v6) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v34 = (v6 - 1) & v6;
  int64_t v35 = v5;
  for (unint64_t i = __clz(__rbit64(v6)) | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v15 << 6))
  {
    sub_10000378C(*(void *)(v4 + 48) + 40 * i, (uint64_t)__src);
    sub_1000037C8(*(void *)(v4 + 56) + 32 * i, (uint64_t)v7);
    memcpy(__dst, __src, sizeof(__dst));
    sub_10000378C((uint64_t)__dst, (uint64_t)v38);
    if (!swift_dynamicCast(&v36, v38, &type metadata for AnyHashable, &type metadata for String, 6LL))
    {
      uint64_t v36 = 0LL;
      uint64_t v37 = 0LL;
      sub_100003A80((uint64_t)__dst, (uint64_t (*)(void))sub_100003804);
      swift_bridgeObjectRelease(v37);
      sub_100003864(v4);
      swift_release(v3);
      return 0LL;
    }

    uint64_t v17 = v36;
    uint64_t v18 = v37;
    sub_1000037C8((uint64_t)v8, (uint64_t)v38);
    sub_100003A80((uint64_t)__dst, (uint64_t (*)(void))sub_100003804);
    sub_10000386C(v38, v9);
    *(void *)&__int128 v40 = v17;
    *((void *)&v40 + 1) = v18;
    sub_10000386C(v9, v10);
    __int128 v19 = v40;
    sub_10000386C(v10, v42);
    sub_10000386C(v42, &v40);
    unint64_t result = sub_10000387C(v19, *((uint64_t *)&v19 + 1));
    unint64_t v20 = result;
    if ((v21 & 1) != 0)
    {
      v22 = v10;
      v23 = v9;
      v24 = v8;
      uint64_t v25 = v4;
      v26 = v7;
      uint64_t v27 = v3[6] + 16 * result;
      swift_bridgeObjectRelease(*(void *)(v27 + 8));
      *(_OWORD *)uint64_t v27 = v19;
      unint64_t v7 = v26;
      uint64_t v4 = v25;
      unint64_t v8 = v24;
      v9 = v23;
      v10 = v22;
      v28 = (void *)(v3[7] + 32 * v20);
      sub_1000038E0(v28);
      unint64_t result = (unint64_t)sub_10000386C(&v40, v28);
      goto LABEL_28;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    *(_OWORD *)(v3[6] + 16 * result) = v19;
    unint64_t result = (unint64_t)sub_10000386C(&v40, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v29 = v3[2];
    BOOL v30 = __OFADD__(v29, 1LL);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_34;
    }
    v3[2] = v31;
LABEL_28:
    unint64_t v6 = v34;
    uint64_t v5 = v35;
    if (v34) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1LL)) {
      goto LABEL_35;
    }
    if (v13 >= v32) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v33 + 8 * v13);
    int64_t v15 = v5 + 1;
    if (!v14)
    {
      int64_t v15 = v5 + 2;
      if (v5 + 2 >= v32) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v33 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v5 + 3;
        if (v5 + 3 >= v32) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v33 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v5 + 4;
          if (v5 + 4 >= v32) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v33 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v5 + 5;
            if (v5 + 5 >= v32) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v33 + 8 * v15);
            if (!v14)
            {
              int64_t v16 = v5 + 6;
              while (v16 < v32)
              {
                unint64_t v14 = *(void *)(v33 + 8 * v16++);
                if (v14)
                {
                  int64_t v15 = v16 - 1;
                  goto LABEL_21;
                }
              }

LABEL_31:
              sub_100003864(v4);
              return (unint64_t)v3;
            }
          }
        }
      }
    }

LABEL_21:
    uint64_t v34 = (v14 - 1) & v14;
    int64_t v35 = v15;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

char *sub_10000322C(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  int64_t v13 = &_swiftEmptyArrayStorage;
  unint64_t result = sub_100003520(0LL, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      id v11 = v6;
      unint64_t v7 = sub_1000039E0();
      swift_dynamicCast(v12, &v11, v7, (char *)&type metadata for Any + 8, 7LL);
      v3 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0)
      {
        sub_100003520(0LL, v3[2] + 1LL, 1);
        v3 = v13;
      }

      unint64_t v9 = v3[2];
      unint64_t v8 = v3[3];
      if (v9 >= v8 >> 1)
      {
        sub_100003520((char *)(v8 > 1), v9 + 1, 1);
        v3 = v13;
      }

      v3[2] = v9 + 1;
      sub_10000386C(v12, &v3[4 * v9 + 4]);
    }

    return (char *)v3;
  }

  __break(1u);
  return result;
}

void sub_100003448()
{
  if (!qword_100008150)
  {
    unint64_t v0 = type metadata accessor for _DictionaryStorage( 0LL,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100008150);
    }
  }
}

id sub_1000034A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  id v5 = [v2 initWithPath:v4];

  return v5;
}

char *sub_100003504(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000353C(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_100003520(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100003644(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_10000353C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100003AC4(0LL, &qword_100008178, (uint64_t)&type metadata for String);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }

  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v12, v13, v8, &type metadata for String);
  }

  swift_release(a4);
  return v10;
}

char *sub_100003644(char *result, int64_t a2, char a3, char *a4)
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
    sub_100003AC4(0LL, &qword_100008168, (uint64_t)&type metadata for Any + 8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }

  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v12, v13, v8, (char *)&type metadata for Any + 8);
  }

  swift_release(a4);
  return v10;
}

uint64_t sub_100003754@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1LL;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1LL << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0LL;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_10000378C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000037C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100003804()
{
  if (!qword_100008158)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2( 0LL,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  "key value ",  0LL);
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100008158);
    }
  }

uint64_t sub_100003864(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_10000386C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000387C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100003900(a1, a2, v5);
}

uint64_t sub_1000038E0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100003900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_1000039E0()
{
  unint64_t result = qword_100008160;
  if (!qword_100008160)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___DEAttachmentItem);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008160);
  }

  return result;
}

void sub_100003A20(uint64_t a1)
{
  if (!qword_100008170)
  {
    uint64_t v2 = type metadata accessor for URL(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100008170);
    }
  }

uint64_t sub_100003A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

void sub_100003A80(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_100003B24();
}

uint64_t sub_100003AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

void sub_100003AC4(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t v4 = type metadata accessor for _ContiguousArrayStorage(0LL, a3);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }

uint64_t sub_100003B08()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_100003B18()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_100003B2C(uint64_t a1, uint64_t a2)
{
  return sub_100003A74(a1, a2, 1LL, v2);
}
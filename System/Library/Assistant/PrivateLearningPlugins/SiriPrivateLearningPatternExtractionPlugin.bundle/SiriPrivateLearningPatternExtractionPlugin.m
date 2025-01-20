uint64_t variable initialization expression of ExtractPatternsRectifi.minLength()
{
  return 3LL;
}

uint64_t variable initialization expression of ExtractPatternsRectifi.maxLength()
{
  return 15LL;
}

uint64_t variable initialization expression of ExtractPatternsRectifi.defaultTopK()
{
  return 5LL;
}

uint64_t variable initialization expression of ExtractPatternsRectifi.closedPatternUtil()
{
  uint64_t v0 = type metadata accessor for ClosedPatternUtil();
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_3A1C(uint64_t result, uint64_t a2)
{
  int64_t v3 = *(void *)(a2 + 16);
  if (v3 < *(void *)(v2 + 24)) {
    return result;
  }
  uint64_t v5 = result;
  v6 = (void *)(v2 + 56);
  swift_beginAccess(v2 + 56, v44, 0LL, 0LL);
  uint64_t v7 = *(void *)(v2 + 56);
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = v7 + 40 * v8;
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(void *)v9;
    uint64_t v12 = *(void *)(v9 + 8);
    uint64_t v13 = *(void *)(v9 + 16);
    char v14 = *(_BYTE *)(v9 + 24);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v11);
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    char v14 = 0;
  }

  v45[0] = v10;
  v45[1] = v11;
  v45[2] = v12;
  v45[3] = v13;
  char v46 = v14;
  char v15 = sub_4E54((uint64_t)v45, v5);
  sub_5C00(v10, v11, v12);
  if ((v15 & 1) != 0)
  {
    swift_beginAccess(v6, v43, 33LL, 0LL);
    v16 = (void *)*v6;
    if (*(void *)(*v6 + 16LL))
    {
      result = swift_isUniquelyReferenced_nonNull_native(*v6);
      if ((result & 1) != 0)
      {
        uint64_t v17 = v16[2];
        if (v17)
        {
LABEL_9:
          uint64_t v18 = v17 - 1;
          v19 = &v16[5 * v18];
          uint64_t v20 = v19[5];
          uint64_t v21 = v19[6];
          v16[2] = v18;
          void *v6 = v16;
          swift_endAccess(v43);
          swift_bridgeObjectRelease(v20);
          swift_bridgeObjectRelease(v21);
          goto LABEL_10;
        }

LABEL_31:
        __break(1u);
        return result;
      }
    }

    else
    {
      __break(1u);
    }

    result = (uint64_t)sub_2BA20(v16);
    v16 = (void *)result;
    uint64_t v17 = *(void *)(result + 16);
    if (v17) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }

  swift_bridgeObjectRelease(a2);
  return v7;
}

LABEL_10:
  v22 = _swiftEmptyArrayStorage;
  v43[0] = _swiftEmptyArrayStorage;
  uint64_t v23 = *(void *)(v5 + 16);
  if (v23)
  {
    swift_bridgeObjectRetain(v5);
    for (uint64_t i = 0LL; i != v23; ++i)
    {
      uint64_t v26 = v5 + 8 * i;
      uint64_t v27 = *(void *)(v26 + 32);
      if (v27)
      {
        uint64_t v28 = swift_retain(*(void *)(v26 + 32));
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v28);
        unint64_t v30 = *(void *)((char *)&dword_10 + (v43[0] & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v29 = *(void *)((char *)&dword_18 + (v43[0] & 0xFFFFFFFFFFFFFF8LL));
        if (v30 >= v29 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1LL);
        }
        uint64_t v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v27);
        specialized Array._endMutation()(v25);
      }
    }

    swift_bridgeObjectRelease(v5);
    v22 = (void *)v43[0];
  }

  v31 = _swiftEmptyArrayStorage;
  if (v3)
  {
    v43[0] = _swiftEmptyArrayStorage;
    sub_27868(0, v3, 0);
    v31 = (void *)v43[0];
    v32 = (uint64_t *)(a2 + 32);
    unint64_t v33 = *(void *)(v43[0] + 16LL);
    int64_t v34 = v3;
    do
    {
      uint64_t v36 = *v32;
      v32 += 2;
      uint64_t v35 = v36;
      v43[0] = v31;
      unint64_t v37 = v31[3];
      if (v33 >= v37 >> 1)
      {
        sub_27868(v37 > 1, v33 + 1, 1);
        v31 = (void *)v43[0];
      }

      v31[2] = v33 + 1;
      v31[v33++ + 4] = v35;
      --v34;
    }

    while (v34);
  }

  swift_beginAccess(v6, v43, 33LL, 0LL);
  v38 = (void *)*v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v6);
  void *v6 = v38;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v38 = sub_203CC(0LL, v38[2] + 1LL, 1, v38);
    void *v6 = v38;
  }

  unint64_t v41 = v38[2];
  unint64_t v40 = v38[3];
  if (v41 >= v40 >> 1)
  {
    v38 = sub_203CC((void *)(v40 > 1), v41 + 1, 1, v38);
    void *v6 = v38;
  }

  v38[2] = v41 + 1;
  v42 = &v38[5 * v41];
  v42[4] = v3;
  v42[5] = v22;
  v42[6] = v31;
  v42[7] = 0LL;
  *((_BYTE *)v42 + 64) = 1;
  return swift_endAccess(v43);
}

  uint64_t v10 = swift_allocObject(&unk_35230, 32LL, 7LL);
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = 0LL;
  uint64_t v11 = (void *)objc_opt_self(&OBJC_CLASS___NSEntityDescription);
  uint64_t v12 = String._bridgeToObjectiveC()();
  uint64_t v13 = (void *)dispatch thunk of CoreDataStore.context.getter(v12);
  char v14 = [v11 entityForName:v12 inManagedObjectContext:v13];

  if (v14)
  {
    char v15 = swift_allocObject(&unk_352A8, 32LL, 7LL);
    *(void *)(v15 + 16) = v10;
    *(void *)(v15 + 24) = v1;
    v16 = objc_allocWithZone(&OBJC_CLASS___NSBatchInsertRequest);
    aBlock[4] = sub_D914;
    uint64_t v28 = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_9BE4;
    aBlock[3] = &unk_352C0;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain(v10);
    swift_retain(v1);
    uint64_t v18 = [v16 initWithEntity:v14 managedObjectHandler:v17];
    _Block_release(v17);
    v19 = swift_release(v28);
    uint64_t v20 = (void *)dispatch thunk of CoreDataStore.context.getter(v19);
    __chkstk_darwin(v20);
    NSManagedObjectContext.performAndWait<A>(_:)(sub_DA04);
    swift_release(v10);
  }

  else
  {
    if (qword_39730 != -1) {
      swift_once(&qword_39730, sub_1B530);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    v22 = sub_D710(v21, (uint64_t)qword_3AB98);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "Could not write to RECTIFI on-device SELF Pattern storage", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    swift_release(v10);
  }

  uint64_t v10 = swift_allocObject(&unk_35230, 32LL, 7LL);
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = 0LL;
  uint64_t v11 = (void *)objc_opt_self(&OBJC_CLASS___NSEntityDescription);
  uint64_t v12 = String._bridgeToObjectiveC()();
  uint64_t v13 = (void *)dispatch thunk of CoreDataStore.context.getter(v12);
  char v14 = [v11 entityForName:v12 inManagedObjectContext:v13];

  if (v14)
  {
    char v15 = swift_allocObject(&unk_35258, 32LL, 7LL);
    *(void *)(v15 + 16) = v10;
    *(void *)(v15 + 24) = v1;
    v16 = objc_allocWithZone(&OBJC_CLASS___NSBatchInsertRequest);
    aBlock[4] = sub_D72C;
    uint64_t v28 = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_9BE4;
    aBlock[3] = &unk_35270;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain(v10);
    swift_retain(v1);
    uint64_t v18 = [v16 initWithEntity:v14 managedObjectHandler:v17];
    _Block_release(v17);
    v19 = swift_release(v28);
    uint64_t v20 = (void *)dispatch thunk of CoreDataStore.context.getter(v19);
    __chkstk_darwin(v20);
    NSManagedObjectContext.performAndWait<A>(_:)(sub_D74C);
    swift_release(v10);
  }

  else
  {
    if (qword_39730 != -1) {
      swift_once(&qword_39730, sub_1B530);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    v22 = sub_D710(v21, (uint64_t)qword_3AB98);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "Could not write to RECTIFI on-device Infrequent Pattern storage", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    swift_release(v10);
  }

  if (v5 < 0)
  {
LABEL_24:
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_25;
  }

  v16 = *(void *)(sub_5BC0(&qword_399F0) - 8);
  uint64_t v17 = (char *)v13 + ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v18 = *(void *)(v16 + 72);
  v19 = a2 + v18 * a3;
  uint64_t v20 = v18 * v5;
  uint64_t v21 = &v17[v20];
  v22 = v19 + v20;
  if (v19 >= (unint64_t)v21 || (unint64_t)v17 >= v22)
  {
    swift_arrayInitWithCopy(v17);
    return v13;
  }

  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_25:
  __break(1u);
  return result;
}

  if (v5 < 0)
  {
LABEL_24:
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_25;
  }

  v16 = *(void *)(type metadata accessor for PatternStoreValue(0LL) - 8);
  uint64_t v17 = (char *)v13 + ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v18 = *(void *)(v16 + 72);
  v19 = a2 + v18 * a3;
  uint64_t v20 = v18 * v5;
  uint64_t v21 = &v17[v20];
  v22 = v19 + v20;
  if (v19 >= (unint64_t)v21 || (unint64_t)v17 >= v22)
  {
    swift_arrayInitWithCopy(v17);
    return v13;
  }

  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_25:
  __break(1u);
  return result;
}

        a3 = (a3 + 1) & v14;
      }

      while (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0);
    }
  }

uint64_t sub_3D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1;
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5 < 3 || (uint64_t result = sub_3A1C(a1, a2), v5 != 15))
  {
    uint64_t v30 = *(void *)(v2 + 16);
    uint64_t result = sub_5840(v30, a2);
    uint64_t v8 = result;
    uint64_t v9 = v7;
    uint64_t v10 = v2;
    if ((unint64_t)v7 >> 62)
    {
      if (v7 < 0) {
        uint64_t v29 = v7;
      }
      else {
        uint64_t v29 = v7 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v7);
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v29);
      uint64_t result = swift_bridgeObjectRelease(v9);
      if (v11) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFF8LL));
      if (v11)
      {
LABEL_5:
        if (v11 < 1)
        {
          __break(1u);
          return result;
        }

        uint64_t v12 = 0LL;
        unint64_t v13 = v9 & 0xC000000000000001LL;
        uint64_t v31 = v9;
        uint64_t v32 = v4;
        while (1)
        {
          if (v13)
          {
            uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v12, v9);
            if (!*(void *)(v8 + 16)) {
              goto LABEL_7;
            }
          }

          else
          {
            uint64_t v14 = *(void *)(v9 + 8 * v12 + 32);
            swift_retain(v14);
            if (!*(void *)(v8 + 16)) {
              goto LABEL_7;
            }
          }

          unint64_t v15 = sub_A734(v14);
          if ((v16 & 1) != 0)
          {
            uint64_t v17 = *(void *)(*(void *)(v8 + 56) + 8 * v15);
            uint64_t v34 = v4;
            swift_retain_n(v14, 2LL);
            swift_bridgeObjectRetain(v17);
            uint64_t v18 = swift_bridgeObjectRetain(v4);
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
            unint64_t v20 = *(void *)(v34 + 16);
            unint64_t v19 = *(void *)(v34 + 24);
            if (v20 >= v19 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1LL);
            }
            uint64_t v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v14);
            specialized Array._endMutation()(v21);
            uint64_t v22 = v34;
            swift_release(v14);
            uint64_t v23 = v10;
            if (*(void *)(v17 + 16) < *(void *)(v10 + 24)) {
              goto LABEL_18;
            }
            uint64_t v24 = sub_5BC0(&qword_398A0);
            uint64_t inited = swift_initStackObject(v24, v33);
            *(_OWORD *)(inited + 16) = xmmword_2D970;
            *(void *)(inited + 32) = 0LL;
            uint64_t v34 = inited;
            specialized Array._endMutation()(inited);
            uint64_t v26 = swift_bridgeObjectRetain(v22);
            sub_15310(v26);
            uint64_t v27 = v34;
            char v28 = sub_10910(v30, v34, v17);
            swift_bridgeObjectRelease(v27);
            if ((v28 & 1) != 0)
            {
LABEL_18:
              swift_bridgeObjectRelease(v17);
              swift_bridgeObjectRelease(v22);
              swift_release(v14);
              uint64_t v10 = v23;
            }

            else
            {
              uint64_t v10 = v23;
              sub_3D58(v22, v17);
              swift_release(v14);
              swift_bridgeObjectRelease(v17);
              swift_bridgeObjectRelease(v22);
            }

            uint64_t v9 = v31;
            uint64_t v4 = v32;
            goto LABEL_8;
          }

LABEL_7:
          swift_release(v14);
LABEL_8:
          if (v11 == ++v12)
          {
            swift_bridgeObjectRelease(v8);
            return swift_bridgeObjectRelease(v9);
          }
        }
      }
    }

    swift_bridgeObjectRelease(v8);
    return swift_bridgeObjectRelease(v9);
  }

  return result;
}

  __break(1u);
}

  __break(1u);
}

    uint64_t result = swift_bridgeObjectRelease(v18);
    int64_t v3 = v16;
    uint64_t v4 = v21;
  }

  unint64_t v15 = i + 4;
  if (i + 4 >= v32)
  {
LABEL_41:
    uint64_t v2 = 1LL;
    goto LABEL_42;
  }

  uint64_t v14 = *(void *)(v33 + 8 * v15);
  if (v14)
  {
    uint64_t v12 = i + 4;
    goto LABEL_24;
  }

  while (1)
  {
    uint64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v12 >= v32) {
      goto LABEL_41;
    }
    uint64_t v14 = *(void *)(v33 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }

  if (v5 < 0)
  {
LABEL_19:
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_20;
  }

  unint64_t v13 = a2 + 8 * a3;
  if (v13 >= (unint64_t)&v10[(unint64_t)v8 / 8 + 4] || (unint64_t)(v10 + 4) >= v13 + v8)
  {
    type metadata accessor for PatternItem();
    swift_arrayInitWithCopy(v10 + 4);
    return v10;
  }

  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_20:
  __break(1u);
  return result;
}

void *sub_402C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    a1 = 5LL;
  }
  swift_beginAccess(v3 + 56, v12, 0LL, 0LL);
  unint64_t v5 = *(void **)(v3 + 56);
  if (a1 >= v5[2])
  {
    swift_bridgeObjectRetain(v5);
    return v5;
  }

  uint64_t v11 = v5;
  swift_bridgeObjectRetain_n(v5, 2LL);
  sub_441C((uint64_t *)&v11);
  swift_bridgeObjectRelease(v5);
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v2 = (uint64_t)v11;
  if (v11[2] < (unint64_t)a1)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    swift_release(v2);
    unint64_t v5 = sub_21678(v2, v2 + 32, 0LL, (2 * a1) | 1);
    swift_release(v2);
    return v5;
  }

  uint64_t v6 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
  uint64_t v7 = swift_unknownObjectRetain_n(v2, 2LL);
  uint64_t v8 = (void *)swift_dynamicCastClass(v7, v6);
  if (!v8)
  {
    swift_release(v2);
    uint64_t v8 = _swiftEmptyArrayStorage;
  }

  uint64_t v9 = v8[2];
  swift_release(v8);
  if (v9 != a1) {
    goto LABEL_16;
  }
  unint64_t v5 = (void *)swift_dynamicCastClass(v2, v6);
  swift_release(v2);
  if (!v5)
  {
    swift_release(v2);
    return _swiftEmptyArrayStorage;
  }

  return v5;
}

void *ExtractPatternsRectifi.deinit()
{
  return v0;
}

uint64_t ExtractPatternsRectifi.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t type metadata accessor for ExtractPatternsRectifi()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin22ExtractPatternsRectifi);
}

uint64_t initializeBufferWithCopyOfBuffer for FrequentPattern(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for FrequentPattern(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

uint64_t initializeWithCopy for FrequentPattern(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for FrequentPattern(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  uint64_t v8 = *(void *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(void *)(a1 + 24) = v8;
  return a1;
}

__n128 initializeWithTake for FrequentPattern(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FrequentPattern(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease(*(void *)(a1 + 8));
  uint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for FrequentPattern(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FrequentPattern(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 33) = 1;
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

    *(_BYTE *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for FrequentPattern()
{
  return &type metadata for FrequentPattern;
}

Swift::Int sub_441C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_199E8(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_4484(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_4484(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      uint64_t v95 = *a1;
      uint64_t v96 = -1LL;
      uint64_t v97 = 1LL;
      for (uint64_t i = *a1; ; i += 40LL)
      {
        uint64_t v99 = v96;
        uint64_t v100 = i;
        do
        {
          uint64_t v101 = v100 + 40;
          uint64_t v102 = *(void *)(v100 + 40);
          if (*(void *)v100 >= v102) {
            break;
          }
          if (!v95) {
            goto LABEL_143;
          }
          uint64_t v103 = *(void *)(v100 + 48);
          char v104 = *(_BYTE *)(v100 + 72);
          __int128 v105 = *(_OWORD *)(v100 + 56);
          __int128 v106 = *(_OWORD *)(v100 + 16);
          *(_OWORD *)uint64_t v101 = *(_OWORD *)v100;
          *(_OWORD *)(v100 + 56) = v106;
          uint64_t v107 = *(void *)(v100 + 32);
          *(void *)uint64_t v100 = v102;
          *(void *)(v100 + 8) = v103;
          *(_OWORD *)(v100 + 16) = v105;
          *(_BYTE *)(v100 + 32) = v104;
          v100 -= 40LL;
          *(void *)(v101 + 32) = v107;
        }

        while (!__CFADD__(v99++, 1LL));
        ++v97;
        --v96;
        if (v97 == v3) {
          return result;
        }
      }
    }

    goto LABEL_139;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_148:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v6 = result;
  uint64_t v123 = v1;
  v116 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      uint64_t v12 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_105;
    }

    v118 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for FrequentPattern);
    *(void *)(v8 + 16) = v7;
    v118 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }

  Swift::Int v10 = 0LL;
  uint64_t v11 = *a1;
  uint64_t v117 = *a1 + 40;
  uint64_t v115 = *a1 - 40;
  uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v119 = v6;
  Swift::Int v120 = v3;
  uint64_t v121 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 40 * v10);
      uint64_t v16 = *(void *)(v11 + 40 * v14);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (void *)(v117 + 40 * v14);
        uint64_t v18 = v17;
        while (1)
        {
          uint64_t v19 = v18[5];
          v18 += 5;
          if (v16 < v15 == *v17 >= v19) {
            break;
          }
          ++v10;
          uint64_t v17 = v18;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }

      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_140;
        }
        if (v14 < v10)
        {
          uint64_t v20 = 40 * v10;
          uint64_t v21 = 40 * v14;
          Swift::Int v22 = v10;
          Swift::Int v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_146;
              }
              uint64_t v24 = v11 + v21;
              uint64_t v25 = v11 + v20;
              uint64_t v26 = *(void *)(v11 + v21);
              uint64_t v27 = *(void *)(v11 + v21 + 8);
              char v28 = *(_BYTE *)(v11 + v21 + 32);
              __int128 v29 = *(_OWORD *)(v11 + v21 + 16);
              uint64_t v30 = *(void *)(v11 + v20 - 8);
              __int128 v31 = *(_OWORD *)(v11 + v20 - 24);
              *(_OWORD *)uint64_t v24 = *(_OWORD *)(v11 + v20 - 40);
              *(_OWORD *)(v24 + 16) = v31;
              *(void *)(v24 + 32) = v30;
              *(void *)(v25 - 40) = v26;
              *(void *)(v25 - 32) = v27;
              *(_OWORD *)(v25 - 24) = v29;
              *(_BYTE *)(v25 - 8) = v28;
            }

            ++v23;
            v20 -= 40LL;
            v21 += 40LL;
          }

          while (v23 < v22);
        }
      }
    }

    if (v10 < v3)
    {
      if (__OFSUB__(v10, v14)) {
        goto LABEL_138;
      }
      if (v10 - v14 < v6)
      {
        Swift::Int v32 = v14 + v6;
        if (__OFADD__(v14, v6)) {
          goto LABEL_141;
        }
        if (v32 >= v3) {
          Swift::Int v32 = v3;
        }
        if (v32 < v14) {
          goto LABEL_142;
        }
        if (v10 != v32)
        {
          uint64_t v33 = v115 + 40 * v10;
          do
          {
            Swift::Int v34 = v14;
            uint64_t v35 = v33;
            do
            {
              uint64_t v36 = v35 + 40;
              uint64_t v37 = *(void *)(v35 + 40);
              if (*(void *)v35 >= v37) {
                break;
              }
              if (!v11) {
                goto LABEL_144;
              }
              uint64_t v38 = *(void *)(v35 + 48);
              char v39 = *(_BYTE *)(v35 + 72);
              __int128 v40 = *(_OWORD *)(v35 + 56);
              __int128 v41 = *(_OWORD *)(v35 + 16);
              *(_OWORD *)uint64_t v36 = *(_OWORD *)v35;
              *(_OWORD *)(v35 + 56) = v41;
              uint64_t v42 = *(void *)(v35 + 32);
              *(void *)uint64_t v35 = v37;
              *(void *)(v35 + 8) = v38;
              *(_OWORD *)(v35 + 16) = v40;
              *(_BYTE *)(v35 + 32) = v39;
              v35 -= 40LL;
              ++v34;
              *(void *)(v36 + 32) = v42;
            }

            while (v10 != v34);
            ++v10;
            v33 += 40LL;
          }

          while (v10 != v32);
          Swift::Int v10 = v32;
        }
      }
    }

    if (v10 < v14)
    {
LABEL_133:
      __break(1u);
      goto LABEL_134;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0) {
      uint64_t v12 = sub_189DC(0LL, *((void *)v12 + 2) + 1LL, 1, v12);
    }
    unint64_t v44 = *((void *)v12 + 2);
    unint64_t v43 = *((void *)v12 + 3);
    unint64_t v13 = v44 + 1;
    uint64_t v11 = v121;
    if (v44 >= v43 >> 1)
    {
      uint64_t v11 = v121;
      uint64_t v12 = sub_189DC((char *)(v43 > 1), v44 + 1, 1, v12);
    }

    *((void *)v12 + 2) = v13;
    v45 = v12 + 32;
    char v46 = &v12[16 * v44 + 32];
    *(void *)char v46 = v14;
    *((void *)v46 + 1) = v10;
    if (v44) {
      break;
    }
    unint64_t v13 = 1LL;
LABEL_15:
    Swift::Int v6 = v119;
    Swift::Int v3 = v120;
    if (v10 >= v120)
    {
      uint64_t v9 = v118;
LABEL_105:
      v94 = v12;
      v118 = v9;
      if (v13 < 2) {
        goto LABEL_95;
      }
      uint64_t v109 = *v116;
      while (1)
      {
        unint64_t v110 = v13 - 2;
        if (v13 < 2) {
          break;
        }
        if (!v109) {
          goto LABEL_147;
        }
        v93 = v94;
        uint64_t v111 = *(void *)&v94[16 * v110 + 32];
        uint64_t v112 = *(void *)&v94[16 * v13 + 24];
        sub_4BB8( (char *)(v109 + 40 * v111),  (char *)(v109 + 40LL * *(void *)&v94[16 * v13 + 16]),  v109 + 40 * v112,  __dst);
        if (v123) {
          goto LABEL_94;
        }
        if (v112 < v111) {
          goto LABEL_135;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v93) & 1) == 0) {
          v93 = sub_18E4C((uint64_t)v93);
        }
        if (v110 >= *((void *)v93 + 2)) {
          goto LABEL_136;
        }
        v113 = &v93[16 * v110 + 32];
        *(void *)v113 = v111;
        *((void *)v113 + 1) = v112;
        unint64_t v114 = *((void *)v93 + 2);
        if (v13 > v114) {
          goto LABEL_137;
        }
        memmove(&v93[16 * v13 + 16], &v93[16 * v13 + 32], 16 * (v114 - v13));
        v94 = v93;
        *((void *)v93 + 2) = v114 - 1;
        unint64_t v13 = v114 - 1;
        if (v114 <= 2) {
          goto LABEL_95;
        }
      }

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
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }
  }

  while (1)
  {
    unint64_t v47 = v13 - 1;
    if (v13 >= 4)
    {
      v52 = &v45[16 * v13];
      uint64_t v53 = *((void *)v52 - 8);
      uint64_t v54 = *((void *)v52 - 7);
      BOOL v58 = __OFSUB__(v54, v53);
      uint64_t v55 = v54 - v53;
      if (v58) {
        goto LABEL_122;
      }
      uint64_t v57 = *((void *)v52 - 6);
      uint64_t v56 = *((void *)v52 - 5);
      BOOL v58 = __OFSUB__(v56, v57);
      uint64_t v50 = v56 - v57;
      char v51 = v58;
      if (v58) {
        goto LABEL_123;
      }
      unint64_t v59 = v13 - 2;
      v60 = &v45[16 * v13 - 32];
      uint64_t v62 = *(void *)v60;
      uint64_t v61 = *((void *)v60 + 1);
      BOOL v58 = __OFSUB__(v61, v62);
      uint64_t v63 = v61 - v62;
      if (v58) {
        goto LABEL_125;
      }
      BOOL v58 = __OFADD__(v50, v63);
      uint64_t v64 = v50 + v63;
      if (v58) {
        goto LABEL_128;
      }
      if (v64 >= v55)
      {
        v82 = &v45[16 * v47];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v58 = __OFSUB__(v83, v84);
        uint64_t v85 = v83 - v84;
        if (v58) {
          goto LABEL_132;
        }
        BOOL v75 = v50 < v85;
        goto LABEL_83;
      }
    }

    else
    {
      if (v13 != 3)
      {
        uint64_t v76 = *((void *)v12 + 4);
        uint64_t v77 = *((void *)v12 + 5);
        BOOL v58 = __OFSUB__(v77, v76);
        uint64_t v69 = v77 - v76;
        char v70 = v58;
        goto LABEL_77;
      }

      uint64_t v49 = *((void *)v12 + 4);
      uint64_t v48 = *((void *)v12 + 5);
      BOOL v58 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      char v51 = v58;
    }

    if ((v51 & 1) != 0) {
      goto LABEL_124;
    }
    unint64_t v59 = v13 - 2;
    v65 = &v45[16 * v13 - 32];
    uint64_t v67 = *(void *)v65;
    uint64_t v66 = *((void *)v65 + 1);
    BOOL v68 = __OFSUB__(v66, v67);
    uint64_t v69 = v66 - v67;
    char v70 = v68;
    if (v68) {
      goto LABEL_127;
    }
    v71 = &v45[16 * v47];
    uint64_t v73 = *(void *)v71;
    uint64_t v72 = *((void *)v71 + 1);
    BOOL v58 = __OFSUB__(v72, v73);
    uint64_t v74 = v72 - v73;
    if (v58) {
      goto LABEL_130;
    }
    if (__OFADD__(v69, v74)) {
      goto LABEL_131;
    }
    if (v69 + v74 >= v50)
    {
      BOOL v75 = v50 < v74;
LABEL_83:
      if (v75) {
        unint64_t v47 = v59;
      }
      goto LABEL_85;
    }

LABEL_77:
    if ((v70 & 1) != 0) {
      goto LABEL_126;
    }
    v78 = &v45[16 * v47];
    uint64_t v80 = *(void *)v78;
    uint64_t v79 = *((void *)v78 + 1);
    BOOL v58 = __OFSUB__(v79, v80);
    uint64_t v81 = v79 - v80;
    if (v58) {
      goto LABEL_129;
    }
    if (v81 < v69) {
      goto LABEL_15;
    }
LABEL_85:
    unint64_t v86 = v47 - 1;
    if (v47 - 1 >= v13)
    {
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
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
      goto LABEL_133;
    }

    if (!v11) {
      goto LABEL_145;
    }
    v87 = v12;
    v88 = &v45[16 * v86];
    uint64_t v89 = *(void *)v88;
    v90 = &v45[16 * v47];
    uint64_t v91 = *((void *)v90 + 1);
    sub_4BB8((char *)(v11 + 40LL * *(void *)v88), (char *)(v11 + 40LL * *(void *)v90), v11 + 40 * v91, __dst);
    if (v123) {
      break;
    }
    if (v91 < v89) {
      goto LABEL_119;
    }
    if (v47 > *((void *)v87 + 2)) {
      goto LABEL_120;
    }
    *(void *)v88 = v89;
    *(void *)&v45[16 * v86 + 8] = v91;
    unint64_t v92 = *((void *)v87 + 2);
    if (v47 >= v92) {
      goto LABEL_121;
    }
    uint64_t v12 = v87;
    unint64_t v13 = v92 - 1;
    memmove(&v45[16 * v47], v90 + 16, 16 * (v92 - 1 - v47));
    *((void *)v87 + 2) = v92 - 1;
    uint64_t v11 = v121;
    if (v92 <= 2) {
      goto LABEL_15;
    }
  }

  v93 = v87;
LABEL_94:
  v94 = v93;
LABEL_95:
  swift_bridgeObjectRelease(v94);
  v118[2] = 0LL;
  return swift_bridgeObjectRelease(v118);
}

uint64_t sub_4BB8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 40;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 40;
  __int128 v31 = __dst;
  Swift::Int v32 = __src;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      uint64_t v19 = 40 * v11;
      if (__dst != a2 || &a2[v19] <= __dst) {
        memmove(__dst, a2, 40 * v11);
      }
      uint64_t v20 = &v4[v19];
      uint64_t v30 = &v4[v19];
      Swift::Int v32 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        unint64_t v21 = a3 - 40;
        Swift::Int v22 = v6;
        while (1)
        {
          Swift::Int v23 = (char *)(v21 + 40);
          uint64_t v24 = *((void *)v22 - 5);
          v22 -= 40;
          if (v24 >= *((void *)v20 - 5))
          {
            uint64_t v30 = v20 - 40;
            if (v23 < v20 || v21 >= (unint64_t)v20 || v23 != v20)
            {
              __int128 v27 = *(_OWORD *)(v20 - 40);
              __int128 v28 = *(_OWORD *)(v20 - 24);
              *(void *)(v21 + 32) = *((void *)v20 - 1);
              *(_OWORD *)unint64_t v21 = v27;
              *(_OWORD *)(v21 + 16) = v28;
            }

            Swift::Int v22 = v6;
            v20 -= 40;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }

          else
          {
            if (v23 != v6 || v21 >= (unint64_t)v6)
            {
              __int128 v25 = *(_OWORD *)v22;
              __int128 v26 = *((_OWORD *)v22 + 1);
              *(void *)(v21 + 32) = *((void *)v22 + 4);
              *(_OWORD *)unint64_t v21 = v25;
              *(_OWORD *)(v21 + 16) = v26;
            }

            Swift::Int v32 = v22;
            if (v22 <= v7) {
              goto LABEL_38;
            }
          }

          v21 -= 40LL;
          Swift::Int v6 = v22;
          if (v20 <= v4) {
            goto LABEL_38;
          }
        }
      }

      goto LABEL_38;
    }
  }

  else if (v8 >= -39)
  {
    size_t v12 = 40 * v9;
    if (__dst != __src || &__src[v12] <= __dst) {
      memmove(__dst, __src, v12);
    }
    unint64_t v13 = &v4[v12];
    uint64_t v30 = &v4[v12];
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      do
      {
        if (*(void *)v4 >= *(void *)v6)
        {
          if (v7 != v4)
          {
            __int128 v17 = *(_OWORD *)v4;
            __int128 v18 = *((_OWORD *)v4 + 1);
            *((void *)v7 + 4) = *((void *)v4 + 4);
            *(_OWORD *)uint64_t v7 = v17;
            *((_OWORD *)v7 + 1) = v18;
          }

          v4 += 40;
          __int128 v31 = v4;
          Swift::Int v14 = v6;
        }

        else
        {
          Swift::Int v14 = v6 + 40;
          if (v7 < v6 || v7 >= v14 || v7 != v6)
          {
            __int128 v15 = *(_OWORD *)v6;
            __int128 v16 = *((_OWORD *)v6 + 1);
            *((void *)v7 + 4) = *((void *)v6 + 4);
            *(_OWORD *)uint64_t v7 = v15;
            *((_OWORD *)v7 + 1) = v16;
          }
        }

        v7 += 40;
        if (v4 >= v13) {
          break;
        }
        Swift::Int v6 = v14;
      }

      while ((unint64_t)v14 < a3);
      Swift::Int v32 = v7;
    }

LABEL_38:
    sub_18AD4((void **)&v32, (const void **)&v31, &v30);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_4E54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v19;
  if (!v19) {
    return v3;
  }
  unint64_t v20 = v19;
  uint64_t v4 = v19 & 0xFFFFFFFFFFFFFF8LL;
  if (v19 >> 62) {
    goto LABEL_20;
  }
  unint64_t v5 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8LL));
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6 < v5) {
    return 0LL;
  }
  swift_bridgeObjectRetain(v19);
  if (!v5)
  {
LABEL_25:
    uint64_t v3 = 1LL;
    goto LABEL_26;
  }

  while (1)
  {
    uint64_t v7 = (uint64_t *)(a2 + 32);
    if ((v3 & 0xC000000000000001LL) == 0) {
      break;
    }
    a2 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v3);
    if (v6) {
      goto LABEL_10;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    if (v3 >= 0) {
      uint64_t v14 = v4;
    }
    else {
      uint64_t v14 = v3;
    }
    swift_bridgeObjectRetain(v3);
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v14);
    sub_5C78(&v20);
    uint64_t v6 = *(void *)(a2 + 16);
    if (v6 < v15) {
      return 0LL;
    }
    swift_bridgeObjectRetain_n(v3, 2LL);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v14);
    sub_5C78(&v20);
    if (!v16) {
      goto LABEL_25;
    }
  }

  a2 = *(void *)(v3 + 32);
  swift_retain(a2);
  if (!v6) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v8 = *v7;
  if (*v7)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    uint64_t v10 = *(void *)(a2 + 32);
    uint64_t v11 = *(void *)(v8 + 24);
    uint64_t v12 = *(void *)(v8 + 32);
    BOOL v13 = v9 == v11 && v10 == v12;
    if ((v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v11, v12, 0LL) & 1) != 0)
      && *(unsigned __int8 *)(a2 + 40) == *(unsigned __int8 *)(v8 + 40))
    {
      __asm { BR              X10 }
    }
  }

  swift_release(a2);
  uint64_t v3 = 0LL;
LABEL_26:
  sub_5C78(&v20);
  return v3;
}

void *sub_5408(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *(void *)(a1 + 16);
  if (!v44) {
    return _swiftEmptyDictionarySingleton;
  }
  uint64_t v42 = a1 + 32;
  unint64_t v43 = *(void *)(a2 + 16);
  uint64_t v41 = a2 + 32;
  swift_bridgeObjectRetain(a1);
  unint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(void *)(v42 + 8 * v2);
    unint64_t v45 = v2;
    if (v2 >= v43)
    {
      uint64_t v5 = -1LL;
      if (v3 < 0)
      {
        unint64_t v49 = v2;
      }

      else
      {
        unint64_t v49 = v2;
        if ((v3 & 0x4000000000000000LL) == 0) {
          goto LABEL_10;
        }
      }
    }

    else
    {
      uint64_t v4 = (uint64_t *)(v41 + 16 * v2);
      uint64_t v5 = v4[1];
      unint64_t v49 = *v4;
      if ((v3 & 0x8000000000000000LL) == 0 && (v3 & 0x4000000000000000LL) == 0)
      {
LABEL_10:
        uint64_t v6 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
        swift_bridgeObjectRetain(v3);
        if (v6) {
          break;
        }
        goto LABEL_3;
      }
    }

    uint64_t v37 = v3 < 0 ? *(void *)(v42 + 8 * v2) : v3 & 0xFFFFFFFFFFFFFF8LL;
    swift_bridgeObjectRetain_n(v3, 2LL);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v37);
    swift_bridgeObjectRelease(v3);
    if (v6) {
      break;
    }
LABEL_3:
    unint64_t v2 = v45 + 1;
    swift_bridgeObjectRelease(v3);
    if (v45 + 1 == v44)
    {
      swift_bridgeObjectRelease(a1);
      return _swiftEmptyDictionarySingleton;
    }
  }

  uint64_t v47 = v5 + 1;
  if (__OFADD__(v5, 1LL)) {
    goto LABEL_58;
  }
  unint64_t v48 = v3 & 0xC000000000000001LL;
  uint64_t v7 = 4LL;
  uint64_t v46 = v3;
  while (2)
  {
    uint64_t v10 = v7 - 4;
    if (v48)
    {
      uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v3);
      uint64_t v12 = v7 - 3;
      if (__OFADD__(v10, 1LL)) {
        goto LABEL_54;
      }
LABEL_21:
      if (__OFADD__(v10, v47)) {
        goto LABEL_55;
      }
      if (_swiftEmptyDictionarySingleton[2])
      {
        uint64_t v13 = swift_retain(v11);
        unint64_t v14 = sub_A734(v13);
        uint64_t v15 = _swiftEmptyArrayStorage;
        if ((v16 & 1) != 0)
        {
          uint64_t v15 = *(void **)(_swiftEmptyDictionarySingleton[7] + 8 * v14);
          swift_bridgeObjectRetain(v15);
        }

        swift_release(v11);
        uint64_t v17 = v15[2];
        if (v17)
        {
LABEL_26:
          if (v15[2 * v17 + 2] == v49)
          {
            swift_bridgeObjectRelease(v15);
            swift_release(v11);
LABEL_15:
            ++v7;
            if (v12 == v6) {
              goto LABEL_3;
            }
            continue;
          }

LABEL_32:
          if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0) {
            uint64_t v15 = sub_204E8(0LL, v15[2] + 1LL, 1, v15);
          }
          unint64_t v23 = v15[2];
          unint64_t v22 = v15[3];
          if (v23 >= v22 >> 1) {
            uint64_t v15 = sub_204E8((void *)(v22 > 1), v23 + 1, 1, v15);
          }
          v15[2] = v23 + 1;
          uint64_t v24 = &v15[2 * v23];
          v24[4] = v49;
          v24[5] = v10 + v47;
          swift_bridgeObjectRetain(v15);
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
          unint64_t v27 = sub_A734(v11);
          uint64_t v28 = _swiftEmptyDictionarySingleton[2];
          BOOL v29 = (v26 & 1) == 0;
          uint64_t v30 = v28 + v29;
          if (__OFADD__(v28, v29)) {
            goto LABEL_56;
          }
          char v31 = v26;
          if (_swiftEmptyDictionarySingleton[3] >= v30)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_B470();
            }
          }

          else
          {
            sub_A830(v30, isUniquelyReferenced_nonNull_native);
            unint64_t v32 = sub_A734(v11);
            if ((v31 & 1) != (v33 & 1)) {
              goto LABEL_59;
            }
            unint64_t v27 = v32;
          }

          uint64_t v3 = v46;
          if ((v31 & 1) != 0)
          {
            uint64_t v8 = _swiftEmptyDictionarySingleton[7];
            uint64_t v9 = *(void *)(v8 + 8 * v27);
            *(void *)(v8 + 8 * v27) = v15;
          }

          else
          {
            _swiftEmptyDictionarySingleton[(v27 >> 6) + 8] |= 1LL << v27;
            *(void *)(_swiftEmptyDictionarySingleton[6] + 8 * v27) = v11;
            *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v27) = v15;
            uint64_t v34 = _swiftEmptyDictionarySingleton[2];
            BOOL v35 = __OFADD__(v34, 1LL);
            uint64_t v36 = v34 + 1;
            if (v35) {
              goto LABEL_57;
            }
            _swiftEmptyDictionarySingleton[2] = v36;
            swift_retain(v11);
            uint64_t v9 = 0LL;
          }

          swift_release(v11);
          swift_bridgeObjectRelease(v15);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(0x8000000000000000LL);
          goto LABEL_15;
        }
      }

      else
      {
        uint64_t v15 = _swiftEmptyArrayStorage;
        uint64_t v17 = _swiftEmptyArrayStorage[2];
        if (v17) {
          goto LABEL_26;
        }
      }

      uint64_t v18 = swift_retain(v11);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
      unint64_t v20 = *(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v19 = *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL));
      if (v20 >= v19 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1LL);
      }
      uint64_t v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v11);
      specialized Array._endMutation()(v21);
      goto LABEL_32;
    }

    break;
  }

  uint64_t v11 = *(void *)(v3 + 8 * v7);
  swift_retain(v11);
  uint64_t v12 = v7 - 3;
  if (!__OFADD__(v10, 1LL)) {
    goto LABEL_21;
  }
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  uint64_t v39 = type metadata accessor for PatternItem();
  uint64_t result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v39);
  __break(1u);
  return result;
}

    swift_release(a1);
    return (uint64_t)v17;
  }

  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_5840(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    uint64_t v7 = _swiftEmptyArrayStorage;
LABEL_50:
    BOOL v35 = sub_5408((uint64_t)v7, v2);
    swift_bridgeObjectRelease(v7);
    return (uint64_t)v35;
  }

  uint64_t v4 = a2 + 32;
  uint64_t v37 = a1 + 32;
  unint64_t v38 = *(void *)(a1 + 16);
  uint64_t result = swift_bridgeObjectRetain(a2);
  uint64_t v6 = 0LL;
  uint64_t v7 = _swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t v8 = *(void *)(v4 + 16 * v6);
    if (v8 >= v38) {
      break;
    }
    uint64_t v9 = *(void *)(v4 + 16 * v6 + 8);
    uint64_t v10 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      goto LABEL_52;
    }
    uint64_t v11 = *(void *)(v37 + 8 * v8);
    unint64_t v12 = (unint64_t)v11 >> 62;
    if ((unint64_t)v11 >> 62)
    {
      if (v11 < 0) {
        uint64_t v33 = *(void *)(v37 + 8 * v8);
      }
      else {
        uint64_t v33 = v11 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v11);
      uint64_t result = _CocoaArrayWrapper.endIndex.getter(v33);
      if (result < v10) {
        goto LABEL_60;
      }
      unint64_t v14 = result;
      swift_bridgeObjectRetain(v11);
      uint64_t v34 = _CocoaArrayWrapper.endIndex.getter(v33);
      uint64_t result = swift_bridgeObjectRelease(v11);
      if (v34 < v10) {
        goto LABEL_54;
      }
    }

    else
    {
      uint64_t v13 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL));
      if (v13 < v10) {
        goto LABEL_53;
      }
      uint64_t result = swift_bridgeObjectRetain(v11);
      unint64_t v14 = v13;
    }

    if (v10 < 0) {
      goto LABEL_55;
    }
    if (v12)
    {
      if (v11 < 0) {
        uint64_t v16 = v11;
      }
      else {
        uint64_t v16 = v11 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v11);
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v16);
      uint64_t result = swift_bridgeObjectRelease(v11);
    }

    else
    {
      uint64_t v15 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL));
    }

    if ((v14 & 0x8000000000000000LL) != 0) {
      goto LABEL_57;
    }
    if ((v11 & 0xC000000000000001LL) != 0 && v10 != v14)
    {
      if (v10 >= v14) {
        goto LABEL_58;
      }
      type metadata accessor for PatternItem();
      Swift::Int v17 = v10;
      do
      {
        Swift::Int v18 = v17 + 1;
        _ArrayBuffer._typeCheckSlowPath(_:)(v17);
        Swift::Int v17 = v18;
      }

      while (v14 != v18);
    }

    if (v12)
    {
      if (v11 < 0) {
        uint64_t v22 = v11;
      }
      else {
        uint64_t v22 = v11 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v11);
      uint64_t v19 = _CocoaArrayWrapper.subscript.getter(v10, v14, v22);
      uint64_t v20 = v23;
      uint64_t v10 = v24;
      unint64_t v21 = v25;
      swift_bridgeObjectRelease_n(v11, 2LL);
      if ((v21 & 1) == 0) {
        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v19 = v11 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v20 = (v11 & 0xFFFFFFFFFFFFFF8LL) + 32;
      unint64_t v21 = (2 * v14) | 1;
      if ((v21 & 1) == 0) {
        goto LABEL_29;
      }
    }

    uint64_t v27 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
    uint64_t v28 = swift_unknownObjectRetain_n(v19, 2LL);
    BOOL v29 = (void *)swift_dynamicCastClass(v28, v27);
    if (!v29)
    {
      swift_unknownObjectRelease(v19);
      BOOL v29 = _swiftEmptyArrayStorage;
    }

    uint64_t v30 = v29[2];
    uint64_t result = swift_release(v29);
    if (__OFSUB__(v21 >> 1, v10)) {
      goto LABEL_59;
    }
    if (v30 == (v21 >> 1) - v10)
    {
      char v26 = (void *)swift_dynamicCastClass(v19, v27);
      if (!v26)
      {
        swift_unknownObjectRelease(v19);
        char v26 = _swiftEmptyArrayStorage;
      }

      goto LABEL_36;
    }

    swift_unknownObjectRelease(v19);
LABEL_29:
    char v26 = sub_214F8(v19, v20, v10, v21);
LABEL_36:
    swift_unknownObjectRelease(v19);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v7);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_205F4(0LL, v7[2] + 1LL, 1, v7);
      uint64_t v7 = (void *)result;
    }

    unint64_t v32 = v7[2];
    unint64_t v31 = v7[3];
    if (v32 >= v31 >> 1)
    {
      uint64_t result = (uint64_t)sub_205F4((void *)(v31 > 1), v32 + 1, 1, v7);
      uint64_t v7 = (void *)result;
    }

    ++v6;
    v7[2] = v32 + 1;
    v7[v32 + 4] = v26;
    if (v6 == v3)
    {
      uint64_t v2 = a2;
      swift_bridgeObjectRelease(a2);
      goto LABEL_50;
    }
  }

  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

uint64_t sub_5BC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_5C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    return swift_bridgeObjectRelease(a3);
  }

  return result;
}

uint64_t sub_5C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5BC0(&qword_398A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_5C78(void *a1)
{
  return a1;
}

uint64_t type metadata accessor for RectifiCoreDataStore(uint64_t a1)
{
  return sub_9AC4(a1, (uint64_t *)&unk_398D0, (uint64_t)&nominal type descriptor for RectifiCoreDataStore);
}

uint64_t sub_5CB4(uint64_t a1)
{
  v2[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[3] = (char *)&value witness table for Builtin.NativeObject + 64;
  return swift_initClassMetadata2(a1, 0LL, 4LL, v2, a1 + qword_3AB88);
}

uint64_t sub_5D10(uint64_t a1)
{
  uint64_t v51 = sub_5BC0(&qword_39A10);
  uint64_t v3 = __chkstk_darwin(v51);
  uint64_t v50 = (uint64_t *)((char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v49 = (uint64_t *)((char *)&v40 - v6);
  __chkstk_darwin(v5);
  unint64_t v48 = (char *)&v40 - v7;
  uint64_t v8 = sub_5BC0(&qword_399F0);
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v47 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v11 = *(void *)(a1 + 16);
  unint64_t v12 = _swiftEmptyArrayStorage;
  if (!v11) {
    return (uint64_t)v12;
  }
  uint64_t v40 = v1;
  uint64_t v54 = _swiftEmptyArrayStorage;
  sub_278A0(0, v11, 0);
  uint64_t result = sub_D85C(a1);
  uint64_t v15 = result;
  uint64_t v16 = 0LL;
  uint64_t v17 = a1 + 64;
  uint64_t v41 = a1 + 80;
  int64_t v42 = v11;
  uint64_t v44 = a1 + 64;
  uint64_t v45 = a1;
  uint64_t v43 = v14;
  uint64_t v18 = v51;
  while ((v15 & 0x8000000000000000LL) == 0 && v15 < 1LL << *(_BYTE *)(a1 + 32))
  {
    unint64_t v21 = (unint64_t)v15 >> 6;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v14) {
      goto LABEL_26;
    }
    uint64_t v52 = v16;
    uint64_t v53 = 1LL << v15;
    uint64_t v22 = v10;
    uint64_t v23 = v48;
    uint64_t v24 = (uint64_t)&v48[*(int *)(v18 + 48)];
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v27 = type metadata accessor for PatternStoreValue(0LL);
    sub_CF7C(v25 + *(void *)(*(void *)(v27 - 8) + 72LL) * v15, v24);
    *uint64_t v23 = v26;
    uint64_t v28 = v49;
    *unint64_t v49 = v26;
    sub_CF7C(v24, (uint64_t)v28 + *(int *)(v18 + 48));
    uint64_t v29 = (uint64_t)v28;
    uint64_t v30 = v50;
    sub_D9B8(v29, (uint64_t)v50, &qword_39A10);
    swift_bridgeObjectRetain_n(v26, 2LL);
    uint64_t v31 = (uint64_t)v23;
    uint64_t v10 = v22;
    sub_D97C(v31, &qword_39A10);
    uint64_t v32 = *v30;
    sub_CF7C((uint64_t)v30 + *(int *)(v18 + 48), (uint64_t)&v22[*(int *)(v47 + 48)]);
    *(void *)uint64_t v22 = v32;
    swift_bridgeObjectRetain(v32);
    sub_D97C((uint64_t)v30, &qword_39A10);
    unint64_t v12 = v54;
    if ((swift_isUniquelyReferenced_nonNull_native(v54) & 1) == 0)
    {
      sub_278A0(0, v12[2] + 1LL, 1);
      unint64_t v12 = v54;
    }

    unint64_t v34 = v12[2];
    unint64_t v33 = v12[3];
    if (v34 >= v33 >> 1)
    {
      sub_278A0(v33 > 1, v34 + 1, 1);
      unint64_t v12 = v54;
    }

    v12[2] = v34 + 1;
    uint64_t result = sub_D9B8( (uint64_t)v22,  (uint64_t)v12 + ((*(unsigned __int8 *)(v46 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))
             + *(void *)(v46 + 72) * v34,
               &qword_399F0);
    a1 = v45;
    int64_t v19 = 1LL << *(_BYTE *)(v45 + 32);
    if (v15 >= v19) {
      goto LABEL_27;
    }
    uint64_t v17 = v44;
    uint64_t v35 = *(void *)(v44 + 8 * v21);
    if ((v35 & v53) == 0) {
      goto LABEL_28;
    }
    LODWORD(v14) = v43;
    if (*(_DWORD *)(v45 + 36) != (_DWORD)v43) {
      goto LABEL_29;
    }
    unint64_t v36 = v35 & (-2LL << (v15 & 0x3F));
    if (v36)
    {
      int64_t v19 = __clz(__rbit64(v36)) | v15 & 0xFFFFFFFFFFFFFFC0LL;
      int64_t v20 = v42;
    }

    else
    {
      unint64_t v37 = v21 + 1;
      unint64_t v38 = (unint64_t)(v19 + 63) >> 6;
      int64_t v20 = v42;
      if (v21 + 1 < v38)
      {
        unint64_t v39 = *(void *)(v44 + 8 * v37);
        if (v39)
        {
LABEL_22:
          int64_t v19 = __clz(__rbit64(v39)) + (v37 << 6);
        }

        else
        {
          while (v38 - 2 != v21)
          {
            unint64_t v39 = *(void *)(v41 + 8 * v21++);
            if (v39)
            {
              unint64_t v37 = v21 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }

    uint64_t v16 = v52 + 1;
    uint64_t v15 = v19;
    if (v52 + 1 == v20) {
      return (uint64_t)v12;
    }
  }

  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void sub_60DC()
{
  qword_3AB68 = 0x49464954434552LL;
  unk_3AB70 = 0xE700000000000000LL;
}

uint64_t sub_6100()
{
  uint64_t v0 = static Config.baseLocation.getter();
  uint64_t v2 = v1;
  if (qword_39710 != -1) {
    swift_once(&qword_39710, sub_60DC);
  }
  swift_bridgeObjectRetain(v2);
  v3._countAndFlagsBits = 0x2F49464954434552LL;
  v3._object = (void *)0xE800000000000000LL;
  String.append(_:)(v3);
  uint64_t result = swift_bridgeObjectRelease(v2);
  qword_3AB78 = v0;
  unk_3AB80 = v2;
  return result;
}

uint64_t sub_6194(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + qword_398B0) = 20LL;
  *(void *)(v2 + qword_398B8) = 10LL;
  uint64_t v5 = qword_398C0;
  uint64_t v6 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = swift_retain(v2);
  *(void *)(v2 + v5) = JSONEncoder.init()(v7);
  uint64_t v8 = qword_398C8;
  uint64_t v9 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  *(void *)(v2 + v8) = JSONDecoder.init()();
  swift_release(v2);
  return CoreDataStore.init(path:modelFileName:)(a1, a2, 0xD000000000000013LL, 0x800000000002EE10LL);
}

void sub_6268(uint64_t a1, id *a2, int a3)
{
  uint64_t v4 = v3;
  int v85 = a3;
  uint64_t v91 = a2;
  sub_5BC0(&qword_39920);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v92 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v90 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v89 = (uint64_t)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v88 = (char *)&v83 - v9;
  uint64_t v10 = sub_5BC0(&qword_399C8);
  __chkstk_darwin(v10);
  uint64_t v103 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v105 = type metadata accessor for Date(0LL);
  uint64_t v12 = *(void *)(v105 - 8);
  uint64_t v13 = __chkstk_darwin(v105);
  uint64_t v15 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v83 - v17;
  __chkstk_darwin(v16);
  int64_t v20 = (char *)&v83 - v19;
  id v21 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v22 = String._bridgeToObjectiveC()();
  uint64_t v23 = (uint64_t)[v21 initWithEntityName:v22];

  uint64_t v24 = (void *)((uint64_t (*)(void))dispatch thunk of CoreDataStore.context.getter)();
  uint64_t v25 = type metadata accessor for RECTIFISelfPatternStore();
  uint64_t v26 = NSManagedObjectContext.fetch<A>(_:)(v23, v25);
  if (v3)
  {

    return;
  }

  uint64_t v27 = v26;
  v98 = v15;
  uint64_t v99 = v20;
  uint64_t v102 = v18;
  uint64_t v107 = v12;
  uint64_t v87 = a1;

  if ((unint64_t)v27 >> 62)
  {
LABEL_40:
    if (v27 < 0) {
      uint64_t v82 = v27;
    }
    else {
      uint64_t v82 = v27 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v27);
    uint64_t v28 = _CocoaArrayWrapper.endIndex.getter(v82);
  }

  else
  {
    uint64_t v28 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(v27);
  }

  uint64_t v29 = v107;
  uint64_t v30 = v102;
  if (!v28)
  {
    swift_bridgeObjectRelease(v27);
    goto LABEL_34;
  }

  id v84 = (id)v23;
  uint64_t v100 = v4;
  unint64_t v106 = v27 & 0xC000000000000001LL;
  uint64_t v86 = qword_398C8;
  uint64_t v23 = 4LL;
  uint64_t v101 = v27;
  uint64_t v104 = v28;
  while (1)
  {
    if (v106) {
      id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v23 - 4, v27);
    }
    else {
      id v34 = *(id *)(v27 + 8 * v23);
    }
    uint64_t v4 = v34;
    uint64_t v35 = v23 - 3;
    if (__OFADD__(v23 - 4, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    id v36 = [v34 pattern];
    if (v36) {
      break;
    }
LABEL_9:

    BOOL v32 = v35 == v104;
    uint64_t v33 = v104;
    if (v32) {
      goto LABEL_24;
    }
LABEL_10:
    ++v23;
  }

  unint64_t v37 = v36;
  uint64_t v38 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v40 = v39;

  id v41 = [v4 timestamp];
  if (!v41)
  {
    uint64_t v31 = (uint64_t)v103;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v103, 1LL, 1LL, v105);
LABEL_8:
    sub_CE6C(v38, v40);
    sub_D97C(v31, &qword_399C8);
    uint64_t v30 = v102;
    goto LABEL_9;
  }

  int64_t v42 = v41;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v43 = v30;
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
  uint64_t v31 = (uint64_t)v103;
  uint64_t v45 = v105;
  v44(v103, v43, v105);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v107 + 56))(v31, 0LL, 1LL, v45);
  uint64_t v46 = v45;
  uint64_t v29 = v107;
  uint64_t v47 = v44;
  uint64_t v48 = v38;
  unint64_t v49 = v40;
  uint64_t v50 = v99;
  uint64_t v51 = v105;
  uint64_t v95 = v47;
  v47(v99, (char *)v31, v105);
  uint64_t v52 = sub_5BC0(&qword_399D0);
  uint64_t v53 = sub_D7A0(&qword_399D8, &qword_399E0, (uint64_t)&unk_2E2B0, (uint64_t)&protocol conformance descriptor for <A> [A]);
  uint64_t v96 = v48;
  unint64_t v97 = v49;
  uint64_t v54 = v100;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(&v108, v52, v48, v49, v52, v53);
  uint64_t v100 = v54;
  if (v54)
  {
    (*(void (**)(char *, uint64_t))(v107 + 8))(v50, v51);
    sub_CE6C(v96, v97);

    swift_bridgeObjectRelease_n(v101, 2LL);
    return;
  }

  id v94 = v108;
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v98, v50, v51);
  id v93 = [v4 frequency];
  id v55 = [v4 plusId];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = (uint64_t)v92;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v58 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56LL))(v57, 0LL, 1LL, v58);
  }

  else
  {
    uint64_t v59 = type metadata accessor for UUID(0LL);
    uint64_t v57 = (uint64_t)v92;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56LL))(v92, 1LL, 1LL, v59);
  }

  uint64_t v61 = v95;
  uint64_t v60 = v96;
  unsigned __int8 v62 = [v4 appLevelAggregation];
  uint64_t v63 = (uint64_t)v88;
  uint64_t v64 = v105;
  v61(v88, v98, v105);
  uint64_t v65 = v90;
  *(void *)(v63 + *(int *)(v90 + 20)) = v93;
  sub_D9B8(v57, v63 + *(int *)(v65 + 24), &qword_39920);
  *(_BYTE *)(v63 + *(int *)(v65 + 28)) = v62;
  uint64_t v66 = v89;
  sub_CEF4(v63, v89);
  uint64_t v67 = v91;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v91);
  id v108 = *v67;
  *uint64_t v67 = (id)0x8000000000000000LL;
  id v69 = v94;
  sub_CD44(v66, (uint64_t)v94, isUniquelyReferenced_nonNull_native);
  id v70 = *v67;
  *uint64_t v67 = v108;
  swift_bridgeObjectRelease(v69);
  swift_bridgeObjectRelease(v70);
  sub_CE6C(v60, v97);
  uint64_t v29 = v107;
  (*(void (**)(char *, uint64_t))(v107 + 8))(v99, v64);

  BOOL v32 = v35 == v104;
  uint64_t v33 = v104;
  uint64_t v27 = v101;
  uint64_t v30 = v102;
  if (!v32) {
    goto LABEL_10;
  }
LABEL_24:
  swift_bridgeObjectRelease(v27);
  if ((v85 & 1) != 0)
  {
    uint64_t v23 = (uint64_t)v84;
    if (v33 < 1) {
      __break(1u);
    }
    swift_bridgeObjectRetain(v27);
    uint64_t v71 = 0LL;
    do
    {
      if (v106) {
        id v72 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v71, v27);
      }
      else {
        id v72 = *(id *)(v27 + 8 * v71 + 32);
      }
      uint64_t v73 = v72;
      ++v71;
      uint64_t v74 = (void *)((uint64_t (*)(void))dispatch thunk of CoreDataStore.context.getter)();
      [v74 deleteObject:v73];

      uint64_t v27 = v101;
    }

    while (v33 != v71);
    swift_bridgeObjectRelease(v101);
  }

  else
  {
    uint64_t v23 = (uint64_t)v84;
  }

LABEL_34:
  uint64_t v75 = swift_bridgeObjectRelease(v27);
  uint64_t v76 = (void *)dispatch thunk of CoreDataStore.context.getter(v75);
  id v108 = 0LL;
  unsigned __int8 v77 = [v76 save:&v108];

  id v78 = v108;
  if ((v77 & 1) != 0)
  {
    id v79 = v108;
  }

  else
  {
    id v80 = v108;
    _convertNSErrorToError(_:)(v78);

    swift_willThrow(v81);
  }
}

        _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3451LL,  0,  v22);
        __break(1u);
        JUMPOUT(0x1ED88LL);
      }

      swift_release(v16);
      ++v14;
      if (v17 == v13) {
        goto LABEL_31;
      }
    }

    uint64_t v16 = *(void *)(a2 + 8 * v14);
    swift_retain(v16);
    uint64_t v17 = v14 - 3;
    if (!__OFADD__(v15, 1LL)) {
      goto LABEL_23;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    if (a2 < 0) {
      int64_t v20 = a2;
    }
    else {
      int64_t v20 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter(v20);
  }

void sub_6A48(uint64_t a1, id *a2, int a3)
{
  int v83 = a3;
  unint64_t v92 = a2;
  uint64_t v88 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v86 = *(void *)(v88 - 8);
  uint64_t v4 = __chkstk_darwin(v88);
  uint64_t v93 = (uint64_t)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v87 = (char *)&v81 - v6;
  uint64_t v7 = sub_5BC0(&qword_399C8);
  __chkstk_darwin(v7);
  uint64_t v89 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v81 - v14;
  id v16 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v17 = String._bridgeToObjectiveC()();
  uint64_t v18 = (uint64_t)[v16 initWithEntityName:v17];

  int64_t v20 = (void *)dispatch thunk of CoreDataStore.context.getter(v19);
  uint64_t v21 = type metadata accessor for RECTIFIInfrequentPatternStore();
  uint64_t v22 = v101;
  uint64_t v23 = NSManagedObjectContext.fetch<A>(_:)(v18, v21);
  if (v22)
  {

    return;
  }

  uint64_t v24 = v23;
  uint64_t v90 = v13;
  uint64_t v91 = 0LL;
  uint64_t v85 = a1;
  id v94 = v15;
  uint64_t v101 = v10;
  uint64_t v98 = v9;

  if ((unint64_t)v24 >> 62)
  {
LABEL_51:
    if (v24 < 0) {
      uint64_t v80 = v24;
    }
    else {
      uint64_t v80 = v24 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v24);
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter(v80);
  }

  else
  {
    uint64_t v25 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(v24);
  }

  uint64_t v26 = (uint64_t)v89;
  uint64_t v27 = v101;
  if (!v25)
  {
    swift_bridgeObjectRelease(v24);
    goto LABEL_42;
  }

  id v82 = (id)v18;
  unint64_t v28 = v24 & 0xC000000000000001LL;
  uint64_t v84 = qword_398C8;
  uint64_t v18 = 4LL;
  unint64_t v96 = v24 & 0xC000000000000001LL;
  uint64_t v97 = v24;
  uint64_t v95 = v25;
  while (1)
  {
    if (v28) {
      id v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, v24);
    }
    else {
      id v29 = *(id *)(v24 + 8 * v18);
    }
    uint64_t v30 = v29;
    uint64_t v31 = v18 - 3;
    if (__OFADD__(v18 - 4, 1LL))
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }

    id v32 = [v29 pattern];
    if (!v32) {
      goto LABEL_9;
    }
    uint64_t v33 = v32;
    uint64_t v99 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v100 = v34;

    id v35 = [v30 timestamp];
    if (v35) {
      break;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v26, 1LL, 1LL, v98);
LABEL_8:
    sub_CE6C(v99, v100);
    sub_D97C(v26, &qword_399C8);
    uint64_t v25 = v95;
LABEL_9:

    if (v31 == v25) {
      goto LABEL_32;
    }
LABEL_10:
    ++v18;
  }

  id v36 = v35;
  unint64_t v37 = v90;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v27 + 32);
  unint64_t v39 = v37;
  unint64_t v40 = v94;
  uint64_t v41 = v98;
  v38(v26, v39, v98);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v101 + 56))(v26, 0LL, 1LL, v41);
  uint64_t v42 = v41;
  uint64_t v27 = v101;
  uint64_t v43 = v98;
  v38((uint64_t)v40, (char *)v26, v98);
  uint64_t v44 = sub_5BC0(&qword_399D0);
  uint64_t v45 = sub_D7A0(&qword_399D8, &qword_399E0, (uint64_t)&unk_2E2B0, (uint64_t)&protocol conformance descriptor for <A> [A]);
  uint64_t v46 = v91;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(&v102, v44, v99, v100, v44, v45);
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v101 + 8))(v40, v43);
    sub_CE6C(v99, v100);

    swift_bridgeObjectRelease_n(v24, 2LL);
    return;
  }

  uint64_t v91 = 0LL;
  uint64_t v24 = (uint64_t)v102;
  uint64_t v47 = (uint64_t)v87;
  (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v87, v40, v43);
  id v48 = [v30 frequency];
  uint64_t v49 = v88;
  uint64_t v50 = v47 + *(int *)(v88 + 24);
  uint64_t v51 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56LL))(v50, 1LL, 1LL, v51);
  *(void *)(v47 + *(int *)(v49 + 20)) = v48;
  *(_BYTE *)(v47 + *(int *)(v49 + 28)) = 2;
  sub_CEF4(v47, v93);
  uint64_t v52 = v92;
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v92);
  uint64_t v102 = *v52;
  uint64_t v54 = v102;
  id *v52 = (id)0x8000000000000000LL;
  unint64_t v56 = sub_A7D8(v24);
  uint64_t v57 = v54[2];
  BOOL v58 = (v55 & 1) == 0;
  uint64_t v59 = v57 + v58;
  if (__OFADD__(v57, v58)) {
    goto LABEL_49;
  }
  char v60 = v55;
  if (v54[3] >= v59)
  {
    uint64_t v63 = v86;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      uint64_t v27 = v101;
      uint64_t v64 = v102;
      if ((v55 & 1) == 0) {
        goto LABEL_23;
      }
    }

    else
    {
      sub_B618();
      uint64_t v27 = v101;
      uint64_t v64 = v102;
      if ((v60 & 1) == 0) {
        goto LABEL_23;
      }
    }

    goto LABEL_27;
  }

  sub_AA1C(v59, isUniquelyReferenced_nonNull_native);
  unint64_t v61 = sub_A7D8(v24);
  if ((v60 & 1) != (v62 & 1))
  {
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v44);
    __break(1u);
    return;
  }

  unint64_t v56 = v61;
  uint64_t v63 = v86;
  uint64_t v27 = v101;
  uint64_t v64 = v102;
  if ((v60 & 1) != 0)
  {
LABEL_27:
    sub_CF38(v93, v64[7] + *(void *)(v63 + 72) * v56);
    goto LABEL_28;
  }

LABEL_23:
  v64[(v56 >> 6) + 8] |= 1LL << v56;
  *(void *)(v64[6] + 8 * v56) = v24;
  sub_CEF4(v93, v64[7] + *(void *)(v63 + 72) * v56);
  uint64_t v65 = v64[2];
  BOOL v66 = __OFADD__(v65, 1LL);
  uint64_t v67 = v65 + 1;
  if (v66) {
    goto LABEL_50;
  }
  v64[2] = v67;
  swift_bridgeObjectRetain(v24);
LABEL_28:
  id v68 = *v92;
  *unint64_t v92 = v64;
  swift_bridgeObjectRelease(v24);
  swift_bridgeObjectRelease(v68);
  sub_CE6C(v99, v100);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v94, v98);

  uint64_t v25 = v95;
  unint64_t v28 = v96;
  uint64_t v24 = v97;
  uint64_t v26 = (uint64_t)v89;
  if (v31 != v95) {
    goto LABEL_10;
  }
LABEL_32:
  swift_bridgeObjectRelease(v24);
  if ((v83 & 1) != 0)
  {
    uint64_t v18 = (uint64_t)v82;
    if (v25 < 1) {
      __break(1u);
    }
    swift_bridgeObjectRetain(v24);
    uint64_t v69 = 0LL;
    do
    {
      if (v96) {
        id v70 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v69, v24);
      }
      else {
        id v70 = *(id *)(v24 + 8 * v69 + 32);
      }
      uint64_t v71 = v70;
      ++v69;
      id v72 = (void *)dispatch thunk of CoreDataStore.context.getter(v70);
      [v72 deleteObject:v71];

      uint64_t v24 = v97;
    }

    while (v25 != v69);
    swift_bridgeObjectRelease(v97);
  }

  else
  {
    uint64_t v18 = (uint64_t)v82;
  }

    uint64_t v14 = (v23 - 1) & v23;
    int64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    uint64_t v25 = *(void *)(*(void *)(v8 + 48) + 8 * v20);
    uint64_t v26 = *(void *)(v39 + 72);
    uint64_t v27 = *(void *)(v8 + 56) + v26 * v20;
    if ((v40 & 1) != 0)
    {
      sub_CEF4(v27, (uint64_t)v7);
    }

    else
    {
      sub_CF7C(v27, (uint64_t)v7);
      swift_bridgeObjectRetain(v25);
    }

    Hasher.init(_seed:)(v41, *(void *)(v10 + 40));
    sub_CFC0((uint64_t)v41, v25);
    uint64_t result = Hasher._finalize()();
    unint64_t v28 = -1LL << *(_BYTE *)(v10 + 32);
    id v29 = result & ~v28;
    uint64_t v30 = v29 >> 6;
    if (((-1LL << v29) & ~*(void *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      uint64_t v18 = __clz(__rbit64((-1LL << v29) & ~*(void *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v31 = 0;
      id v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        uint64_t v33 = v30 == v32;
        if (v30 == v32) {
          uint64_t v30 = 0LL;
        }
        v31 |= v33;
        unint64_t v34 = *(void *)(v15 + 8 * v30);
      }

      while (v34 == -1);
      uint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }

    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    *(void *)(*(void *)(v10 + 48) + 8 * v18) = v25;
    uint64_t result = sub_CEF4((uint64_t)v7, *(void *)(v10 + 56) + v26 * v18);
    ++*(void *)(v10 + 16);
  }

  swift_release(v8);
  Swift::String v3 = v36;
  uint64_t v22 = v38;
  if ((v40 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  id v35 = 1LL << *(_BYTE *)(v8 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    char *v22 = -1LL << v35;
  }
  *(void *)(v8 + 16) = 0LL;
LABEL_43:
  uint64_t result = swift_release(v8);
  *Swift::String v3 = v10;
  return result;
}

      uint64_t v22 = v149;
      if (v164 < v167)
      {
        uint64_t v52 = v168;
        if (v38 < v25) {
          goto LABEL_141;
        }
        if (v25 < v38)
        {
          v159 = v16;
          uint64_t v53 = 0LL;
          uint64_t v54 = v168 * (v38 - 1);
          char v55 = v38 * v168;
          unint64_t v56 = v25;
          uint64_t v57 = v25 * v168;
          do
          {
            if (v56 != v38 + v53 - 1)
            {
              char v60 = v38;
              unint64_t v61 = v150;
              if (!v150) {
                goto LABEL_146;
              }
              char v62 = v150 + v57;
              v167 = v150 + v54;
              sub_D9B8(v150 + v57, v152, &qword_399F0);
              if (v57 < v54 || v62 >= v61 + v55)
              {
                BOOL v58 = v61 + v57;
                uint64_t v59 = v167;
                swift_arrayInitWithTakeFrontToBack(v58, v167, 1LL, v165);
              }

              else
              {
                uint64_t v59 = v167;
                if (v57 != v54) {
                  swift_arrayInitWithTakeBackToFront(v62);
                }
              }

              sub_D9B8(v152, v59, &qword_399F0);
              uint64_t v38 = v60;
              uint64_t v25 = v153;
              uint64_t v52 = v168;
            }

            ++v56;
            --v53;
            v54 -= v52;
            v55 -= v52;
            v57 += v52;
          }

          while (v56 < v38 + v53);
          a1 = v155;
          uint64_t v22 = v149;
          id v16 = v159;
        }
      }
    }

    if (v38 < v16)
    {
      if (__OFSUB__(v38, v25)) {
        goto LABEL_139;
      }
      if (v38 - v25 < v148) {
        break;
      }
    }

    uint64_t v51 = v139;
    v134 = sub_1AA5C(v139);
    v135 = sub_1AB98(v51);
    uint64_t v52 = Turn.events.getter(v135);
    uint64_t v53 = static NlxSELFUtils.getTopNlxUsoGraph(from:)();
    swift_bridgeObjectRelease(v52);
    if (v53)
    {
      uint64_t v54 = sub_5BC0(&qword_3A1C0);
      char v55 = (void *)swift_allocObject(v54, 56LL, 7LL);
      *((_OWORD *)v55 + 1) = v137;
      unint64_t v56 = dispatch thunk of Graph.nodes.getter();
      uint64_t v57 = sub_12204(v56);
      swift_bridgeObjectRelease(v56);
      v55[4] = v57;
      v55[5] = 0LL;
      *((_BYTE *)v55 + 48) = 1;
      *(_WORD *)((char *)v55 + 49) = 3328;
      swift_release(v53);
      if (*(void *)(v34 + 16)) {
        goto LABEL_25;
      }
    }

    else
    {
      char v55 = _swiftEmptyArrayStorage;
      if (*(void *)(v34 + 16))
      {
LABEL_25:
        BOOL v58 = swift_bridgeObjectRelease(v55);
        __chkstk_darwin(v58);
        uint64_t v59 = (uint64_t)v140;
        *(&v123 - 2) = (uint64_t)v140;
        char v60 = sub_124F0((void (*)(uint64_t *__return_ptr, void *))sub_1ACC8, (uint64_t)(&v123 - 4), v34);
        unint64_t v61 = (void *)v34;
        goto LABEL_29;
      }
    }

    char v62 = swift_bridgeObjectRelease(v34);
    if (!v55[2])
    {
      swift_bridgeObjectRelease(v55);
      uint64_t v59 = (uint64_t)v140;
      goto LABEL_30;
    }

    __chkstk_darwin(v62);
    uint64_t v59 = (uint64_t)v140;
    *(&v123 - 2) = (uint64_t)v140;
    char v60 = sub_124F0((void (*)(uint64_t *__return_ptr, void *))sub_1B518, (uint64_t)(&v123 - 4), (uint64_t)v55);
    unint64_t v61 = v55;
LABEL_29:
    swift_bridgeObjectRelease(v61);
    sub_155F4((uint64_t)v60);
LABEL_30:
    uint64_t v63 = v145;
    sub_11304((uint64_t)v145);
    uint64_t v65 = v64;
    swift_bridgeObjectRelease(v63);
    BOOL v66 = sub_155F4(v65);
    __chkstk_darwin(v66);
    *(&v123 - 2) = v59;
    uint64_t v67 = (uint64_t)v144;
    id v68 = sub_124F0( (void (*)(uint64_t *__return_ptr, void *))sub_1ACE4,  (uint64_t)(&v123 - 4),  (uint64_t)v144);
    swift_bridgeObjectRelease(v67);
    sub_155F4((uint64_t)v68);
    *(void *)&v150 = _swiftEmptyArrayStorage;
    uint64_t v69 = v139;
    id v70 = *(void *)(v139 + 16);
    if (v70)
    {
      uint64_t v71 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
      id v72 = v69 + ((*(unsigned __int8 *)(v71 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80));
      uint64_t v73 = *(void *)(v71 + 72);
      swift_bridgeObjectRetain(v69);
      do
      {
        sub_138F0(v72, (uint64_t *)&v150);
        v72 += v73;
        --v70;
      }

      while (v70);
      uint64_t v69 = v139;
      swift_bridgeObjectRelease(v139);
      uint64_t v74 = (void *)v150;
    }

    else
    {
      uint64_t v74 = _swiftEmptyArrayStorage;
    }

    unsigned __int8 v75 = sub_11C50((uint64_t)v74, (uint64_t)v140);
    swift_bridgeObjectRelease(v74);
    sub_155F4(v75);
    *(void *)&v150 = _swiftEmptyArrayStorage;
    id v76 = *(void *)(v69 + 16);
    if (v76)
    {
      unsigned __int8 v77 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
      id v78 = v69 + ((*(unsigned __int8 *)(v77 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80));
      uint64_t v79 = *(void *)(v77 + 72);
      swift_bridgeObjectRetain(v69);
      do
      {
        sub_14200(v78, (uint64_t *)&v150);
        v78 += v79;
        --v76;
      }

      while (v76);
      uint64_t v69 = v139;
      swift_bridgeObjectRelease(v139);
      uint64_t v80 = (void *)v150;
    }

    else
    {
      uint64_t v80 = _swiftEmptyArrayStorage;
    }

    uint64_t v81 = sub_11C50((uint64_t)v80, (uint64_t)v140);
    swift_bridgeObjectRelease(v80);
    sub_155F4(v81);
    *(void *)&v150 = _swiftEmptyArrayStorage;
    id v82 = *(void *)(v69 + 16);
    if (v82)
    {
      int v83 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
      uint64_t v84 = v69 + ((*(unsigned __int8 *)(v83 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80));
      uint64_t v85 = *(void *)(v83 + 72);
      swift_bridgeObjectRetain(v69);
      do
      {
        sub_13BD0(v84, (uint64_t *)&v150);
        v84 += v85;
        --v82;
      }

      while (v82);
      uint64_t v69 = v139;
      swift_bridgeObjectRelease(v139);
      uint64_t v86 = (void *)v150;
    }

    else
    {
      uint64_t v86 = _swiftEmptyArrayStorage;
    }

    uint64_t v87 = sub_11C50((uint64_t)v86, (uint64_t)v140);
    swift_bridgeObjectRelease(v86);
    sub_155F4(v87);
    v145 = *(void **)(v69 + 16);
    if (v145)
    {
      uint64_t v88 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
      v144 = (void *)(v69
                      + ((*(unsigned __int8 *)(v88 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80)));
      v143 = *(void *)(v88 + 72);
      DeviceAndFriendsIntentFeatureExtractor = type metadata accessor for FindDeviceAndFriendsIntentFeatureExtractor(0LL);
      swift_bridgeObjectRetain(v69);
      uint64_t v90 = 0LL;
      v141 = _swiftEmptyArrayStorage;
      while (1)
      {
        uint64_t v91 = (char *)v144 + v143 * v90;
        swift_allocObject( DeviceAndFriendsIntentFeatureExtractor,  *(unsigned int *)(DeviceAndFriendsIntentFeatureExtractor + 48),  *(unsigned __int16 *)(DeviceAndFriendsIntentFeatureExtractor + 52));
        DeviceAndFriendsIntentFeature = FindDeviceAndFriendsIntentFeatureExtractor.init()();
        uint64_t v93 = dispatch thunk of FindDeviceAndFriendsIntentFeatureExtractor.extract(from:)(v91);
        swift_release(DeviceAndFriendsIntentFeature);
        id v94 = *(void *)(v93 + 16);
        if (v94)
        {
          uint64_t v95 = v93 + 32;
          swift_bridgeObjectRetain(v93);
          while (1)
          {
            sub_1AD00(v95, (uint64_t)&v148);
            sub_1AD00((uint64_t)&v148, (uint64_t)v147);
            unint64_t v96 = sub_5BC0(&qword_3A1A8);
            DeviceAndFriends = type metadata accessor for FindDeviceAndFriendsFeature.Name(0LL);
            sub_1AD44(&v148);
            v95 += 40LL;
            if (!--v94)
            {
              swift_bridgeObjectRelease(v93);
              goto LABEL_56;
            }
          }

          uint64_t v98 = v146;
          swift_bridgeObjectRelease(v93);
          swift_release(v98);
          sub_1AD64(&v148, (uint64_t)&v150);
        }

        else
        {
LABEL_56:
          v152 = 0LL;
          v150 = 0u;
          v151 = 0u;
        }

        sub_D91C((uint64_t)&v150, (uint64_t)&v148, &qword_3A1B0);
        if (!v149) {
          break;
        }
        uint64_t v99 = sub_5BC0(&qword_3A1A8);
        unint64_t v100 = type metadata accessor for FindDeviceAndFriendsFeature.Name(0LL);
        if ((swift_dynamicCast(v147, &v148, v99, v100, 6LL) & 1) == 0) {
          goto LABEL_48;
        }
        uint64_t v101 = v147[0];
        uint64_t v102 = swift_retain(v147[0]);
        TypedNamedFeature.value.getter(&v148, v102);
        swift_release_n(v101, 2LL);
        uint64_t v103 = *((void *)&v148 + 1);
        v142 = v148;
        sub_D97C((uint64_t)&v150, &qword_3A1B0);
        uint64_t v104 = *(void *)(v93 + 16);
        if (v104)
        {
          uint64_t v105 = v93 + 32;
          swift_bridgeObjectRetain(v93);
          while (1)
          {
            sub_1AD00(v105, (uint64_t)&v148);
            sub_1AD00((uint64_t)&v148, (uint64_t)v147);
            unint64_t v106 = type metadata accessor for FindDeviceAndFriendsFeature.DonatedBySiri(0LL);
            sub_1AD44(&v148);
            v105 += 40LL;
            if (!--v104)
            {
              swift_bridgeObjectRelease(v93);
              goto LABEL_65;
            }
          }

          uint64_t v107 = v146;
          swift_bridgeObjectRelease(v93);
          swift_release(v107);
          sub_1AD64(&v148, (uint64_t)&v150);
        }

        else
        {
LABEL_65:
          v152 = 0LL;
          v150 = 0u;
          v151 = 0u;
        }

        sub_D91C((uint64_t)&v150, (uint64_t)&v148, &qword_3A1B0);
        if (v149)
        {
          id v108 = type metadata accessor for FindDeviceAndFriendsFeature.DonatedBySiri(0LL);
          if ((swift_dynamicCast(v147, &v148, v99, v108, 6LL) & 1) != 0)
          {
            uint64_t v109 = v147[0];
            unint64_t v110 = swift_retain(v147[0]);
            TypedNamedFeature.value.getter(&v148, v110);
            swift_release_n(v109, 2LL);
            uint64_t v111 = v148;
            sub_D97C((uint64_t)&v150, &qword_3A1B0);
            swift_bridgeObjectRelease(v93);
            uint64_t v112 = sub_5BC0(&qword_3A1B8);
            v113 = swift_allocObject(v112, 48LL, 7LL);
            *(_OWORD *)(v113 + 16) = v137;
            *(void *)(v113 + 32) = v142;
            *(void *)(v113 + 40) = v103;
            unint64_t v114 = v141;
            if ((swift_isUniquelyReferenced_nonNull_native(v141) & 1) == 0) {
              unint64_t v114 = sub_20714(0LL, v114[2] + 1LL, 1, v114);
            }
            v141 = v114;
            v116 = v114[2];
            uint64_t v115 = v114[3];
            if (v116 >= v115 >> 1) {
              v141 = sub_20714((void *)(v115 > 1), v116 + 1, 1, v141);
            }
            uint64_t v117 = v141;
            v141[2] = v116 + 1;
            v118 = &v117[3 * v116];
            v118[4] = v113;
            v118[5] = 0LL;
            *((_BYTE *)v118 + 48) = 1;
            *((_BYTE *)v118 + 49) = v111;
            *((_BYTE *)v118 + 50) = 12;
            goto LABEL_50;
          }
        }

        else
        {
          sub_D97C((uint64_t)&v148, &qword_3A1B0);
        }

        sub_D97C((uint64_t)&v150, &qword_3A1B0);
        swift_bridgeObjectRelease(v103);
LABEL_49:
        swift_bridgeObjectRelease(v93);
LABEL_50:
        if ((void *)++v90 == v145)
        {
          swift_bridgeObjectRelease_n(v139, 2LL);
          uint64_t v8 = v125;
          uint64_t v14 = v141;
          goto LABEL_4;
        }
      }

      sub_D97C((uint64_t)&v148, &qword_3A1B0);
LABEL_48:
      sub_D97C((uint64_t)&v150, &qword_3A1B0);
      goto LABEL_49;
    }

    swift_bridgeObjectRelease(v69);
    uint64_t v14 = _swiftEmptyArrayStorage;
    uint64_t v8 = v125;
LABEL_4:
    uint64_t v15 = v136 + 1;
    id v16 = (uint64_t)v140;
    NSString v17 = sub_11C50((uint64_t)v14, (uint64_t)v140);
    swift_bridgeObjectRelease(v14);
    sub_155F4(v17);
    uint64_t v18 = v134;
    uint64_t v19 = sub_11450((uint64_t)v134, v16);
    swift_bridgeObjectRelease(v18);
    sub_155F4(v19);
    int64_t v20 = v135;
    uint64_t v21 = sub_11850((uint64_t)v135, v16);
    swift_bridgeObjectRelease(v20);
    sub_155F4(v21);
    swift_release(v138);
    uint64_t v13 = v132;
    (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v16, v8);
    uint64_t v12 = v15;
    if (v15 == v130)
    {
      swift_bridgeObjectRelease(v123);
      uint64_t v11 = v153;
      a3 = v124;
      v122 = v133;
LABEL_92:
      *a3 = v11;
      a3[1] = v122;
      return;
    }
  }

  uint64_t v41 = Turn.events.getter(v40);
  uint64_t v42 = v41;
  if ((unint64_t)v41 >> 62)
  {
    if (v41 >= 0) {
      v41 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t v43 = _CocoaArrayWrapper.endIndex.getter(v41);
    if (v43) {
      goto LABEL_12;
    }
LABEL_21:
    v133 = 0LL;
LABEL_22:
    swift_bridgeObjectRelease(v42);
    goto LABEL_23;
  }

  uint64_t v43 = *(void *)((char *)&dword_10 + (v41 & 0xFFFFFFFFFFFFF8LL));
  if (!v43) {
    goto LABEL_21;
  }
LABEL_12:
  uint64_t v44 = 0LL;
  uint64_t v45 = v42 & 0xC000000000000001LL;
  while (1)
  {
    if (v45)
    {
      swift_bridgeObjectRetain(v42);
      uint64_t v46 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v44, v42);
    }

    else
    {
      uint64_t v47 = *(void **)(v42 + 8 * v44 + 32);
      swift_bridgeObjectRetain(v42);
      uint64_t v46 = v47;
    }

    id v48 = v46;
    uint64_t v49 = (void *)static ORCHEvents.requestID(_:)();
    swift_bridgeObjectRelease(v42);

    if (v49) {
      break;
    }
    uint64_t v50 = v44 + 1;
    if (__OFADD__(v44, 1LL))
    {
      __break(1u);
LABEL_94:
      __break(1u);
      goto LABEL_95;
    }

    ++v44;
    if (v50 == v43) {
      goto LABEL_21;
    }
  }

  if (v43 == v44) {
    goto LABEL_21;
  }
  if (v45)
  {
    Swift::Int v119 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v44, v42);
    goto LABEL_84;
  }

  if ((v44 & 0x8000000000000000LL) != 0) {
    goto LABEL_94;
  }
  if (v44 < *(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFF8LL)))
  {
    Swift::Int v119 = *(id *)(v42 + 8 * v44 + 32);
LABEL_84:
    Swift::Int v120 = v119;
    uint64_t v121 = static ORCHEvents.requestID(_:)();

    v133 = v121;
    if (!v121) {
      goto LABEL_96;
    }
    goto LABEL_22;
  }

  __break(1u);
LABEL_24:
  id v16 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v16,  1092LL,  0);
  __break(1u);
  return result;
}

    uint64_t v9 = (v15 - 1) & v15;
    uint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    NSString v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)(v32, v8[5]);
    swift_bridgeObjectRetain(v19);
    String.hash(into:)(v32, v18, v19);
    uint64_t result = Hasher._finalize()();
    int64_t v20 = -1LL << *((_BYTE *)v8 + 32);
    uint64_t v21 = result & ~v20;
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

        uint64_t v26 = v22 == v25;
        if (v22 == v25) {
          uint64_t v22 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }

      while (v27 == -1);
      uint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }

    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    unint64_t v28 = (void *)(v8[6] + 16 * v23);
    *unint64_t v28 = v18;
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

  id v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  uint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }

  while (1)
  {
    uint64_t v10 = v16 + 1;
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

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for SequenceItem();
    swift_arrayInitWithCopy(a1);
    return a3;
  }

LABEL_42:
  uint64_t v73 = swift_bridgeObjectRelease(v24);
  uint64_t v74 = (void *)dispatch thunk of CoreDataStore.context.getter(v73);
  uint64_t v102 = 0LL;
  unsigned __int8 v75 = [v74 save:&v102];

  id v76 = v102;
  if ((v75 & 1) != 0)
  {
    unsigned __int8 v77 = v102;
  }

  else
  {
    id v78 = v102;
    _convertNSErrorToError(_:)(v76);

    swift_willThrow(v79);
  }
}

  swift_retain(a3);
  return sub_18E60(a1, a2, 0LL, a3);
}

uint64_t sub_71C8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = (int *)type metadata accessor for PatternStoreValue(0LL);
  uint64_t v78 = *((void *)v5 - 1);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v79 = (uint64_t)v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v71 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v74 = (uint64_t)v71 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v71 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v73 = (uint64_t)v71 - v17;
  __chkstk_darwin(v16);
  uint64_t v75 = (uint64_t)v71 - v18;
  unint64_t v19 = sub_1F5E8((uint64_t)_swiftEmptyArrayStorage);
  int v83 = (void *)v19;
  uint64_t v77 = *(void *)(a1 + 16);
  if (v77)
  {
    int64_t v20 = (void *)v19;
    v71[0] = v3;
    v71[1] = v2;
    swift_bridgeObjectRetain(a1);
    uint64_t v21 = 0LL;
    id v76 = v15;
    uint64_t v72 = a1;
    while (1)
    {
      uint64_t v22 = *(void *)(a1 + 8 * v21 + 32);
      uint64_t v23 = v20[2];
      unint64_t v24 = swift_bridgeObjectRetain(v22);
      if (v23)
      {
        unint64_t v24 = sub_A7D8(v22);
        if ((v25 & 1) != 0)
        {
          uint64_t v26 = *(void *)(v78 + 72);
          uint64_t v27 = v73;
          sub_CF7C(v20[7] + v26 * v24, v73);
          uint64_t v28 = v27;
          uint64_t v29 = v75;
          uint64_t v30 = sub_CEF4(v28, v75);
          static Date.now.getter(v30);
          uint64_t v31 = *(void *)(v29 + v5[5]);
          uint64_t v32 = v31 + 1;
          if (__OFADD__(v31, 1LL)) {
            goto LABEL_39;
          }
          uint64_t v33 = &v15[v5[6]];
          uint64_t v34 = type metadata accessor for UUID(0LL);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56LL))(v33, 1LL, 1LL, v34);
          *(void *)&v15[v5[5]] = v32;
          v15[v5[7]] = 2;
          sub_CEF4((uint64_t)v15, v74);
          id v35 = v83;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v83);
          uint64_t v81 = v35;
          unint64_t v38 = sub_A7D8(v22);
          uint64_t v39 = v35[2];
          BOOL v40 = (v37 & 1) == 0;
          uint64_t v41 = v39 + v40;
          if (__OFADD__(v39, v40)) {
            goto LABEL_40;
          }
          char v42 = v37;
          if (v35[3] >= v41)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              int64_t v20 = v81;
              if ((v37 & 1) == 0) {
                goto LABEL_29;
              }
            }

            else
            {
              sub_B618();
              int64_t v20 = v81;
              if ((v42 & 1) == 0) {
                goto LABEL_29;
              }
            }
          }

          else
          {
            sub_AA1C(v41, isUniquelyReferenced_nonNull_native);
            unint64_t v43 = sub_A7D8(v22);
            if ((v42 & 1) != (v44 & 1)) {
              goto LABEL_43;
            }
            unint64_t v38 = v43;
            int64_t v20 = v81;
            if ((v42 & 1) == 0)
            {
LABEL_29:
              v20[(v38 >> 6) + 8] |= 1LL << v38;
              *(void *)(v20[6] + 8 * v38) = v22;
              sub_CEF4(v74, v20[7] + v38 * v26);
              uint64_t v60 = v20[2];
              BOOL v58 = __OFADD__(v60, 1LL);
              uint64_t v61 = v60 + 1;
              if (v58) {
                goto LABEL_41;
              }
              v20[2] = v61;
              swift_bridgeObjectRetain(v22);
              goto LABEL_31;
            }
          }

          sub_CF38(v74, v20[7] + v38 * v26);
LABEL_31:
          int v83 = v20;
          swift_bridgeObjectRelease(v22);
          swift_bridgeObjectRelease(0x8000000000000000LL);
          sub_D764(v75);
          a1 = v72;
          goto LABEL_5;
        }
      }

      static Date.now.getter(v24);
      uint64_t v45 = &v10[v5[6]];
      uint64_t v46 = type metadata accessor for UUID(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56LL))(v45, 1LL, 1LL, v46);
      *(void *)&v10[v5[5]] = 1LL;
      v10[v5[7]] = 2;
      sub_CEF4((uint64_t)v10, v79);
      uint64_t v47 = v83;
      uint64_t v48 = swift_isUniquelyReferenced_nonNull_native(v83);
      uint64_t v81 = v47;
      unint64_t v50 = sub_A7D8(v22);
      uint64_t v51 = v47[2];
      BOOL v52 = (v49 & 1) == 0;
      uint64_t v53 = v51 + v52;
      if (__OFADD__(v51, v52))
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }

      char v54 = v49;
      if (v47[3] >= v53)
      {
        if ((v48 & 1) != 0)
        {
          int64_t v20 = v81;
          if ((v49 & 1) == 0) {
            goto LABEL_21;
          }
        }

        else
        {
          sub_B618();
          int64_t v20 = v81;
          if ((v54 & 1) == 0) {
            goto LABEL_21;
          }
        }
      }

      else
      {
        sub_AA1C(v53, v48);
        unint64_t v55 = sub_A7D8(v22);
        if ((v54 & 1) != (v56 & 1))
        {
LABEL_43:
          uint64_t v70 = sub_5BC0(&qword_399D0);
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v70);
          __break(1u);
          return result;
        }

        unint64_t v50 = v55;
        int64_t v20 = v81;
        if ((v54 & 1) == 0)
        {
LABEL_21:
          v20[(v50 >> 6) + 8] |= 1LL << v50;
          *(void *)(v20[6] + 8 * v50) = v22;
          sub_CEF4(v79, v20[7] + *(void *)(v78 + 72) * v50);
          uint64_t v57 = v20[2];
          BOOL v58 = __OFADD__(v57, 1LL);
          uint64_t v59 = v57 + 1;
          if (v58) {
            goto LABEL_38;
          }
          v20[2] = v59;
          swift_bridgeObjectRetain(v22);
          goto LABEL_4;
        }
      }

      sub_CF38(v79, v20[7] + *(void *)(v78 + 72) * v50);
LABEL_4:
      int v83 = v20;
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(0x8000000000000000LL);
LABEL_5:
      uint64_t v15 = v76;
      if (v77 == ++v21)
      {
        swift_bridgeObjectRelease(a1);
        break;
      }
    }
  }

  if (qword_39730 != -1) {
LABEL_42:
  }
    swift_once(&qword_39730, sub_1B530);
  uint64_t v62 = type metadata accessor for Logger(0LL);
  uint64_t v63 = sub_D710(v62, (uint64_t)qword_3AB98);
  uint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
  os_log_type_t v65 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v64, v65))
  {
    BOOL v66 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)BOOL v66 = 134217984;
    swift_beginAccess(&v83, v80, 0LL, 0LL);
    uint64_t v81 = (void *)v83[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v66 + 4, v66 + 12);
    _os_log_impl(&dword_0, v64, v65, "Writing %ld Incomplete patterns", v66, 0xCu);
    swift_slowDealloc(v66, -1LL, -1LL);
  }

  swift_beginAccess(&v83, &v81, 0LL, 0LL);
  uint64_t v67 = v83;
  uint64_t v68 = swift_bridgeObjectRetain(v83);
  sub_8918(v68);
  swift_bridgeObjectRelease(v67);
  return swift_bridgeObjectRelease(v83);
}

uint64_t sub_77E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v90 = a2;
  uint64_t v5 = sub_5BC0(&qword_39A18);
  __chkstk_darwin(v5);
  uint64_t v95 = (char *)v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = (int *)type metadata accessor for PatternStoreValue(0LL);
  uint64_t v97 = *((void *)v7 - 1);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v96 = (uint64_t)v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  id v94 = (char *)v86 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v86 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)v86 - v16;
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)v86 - v18;
  uint64_t v20 = sub_5BC0(&qword_39920);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v102 = sub_1F5E8((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v23 = (void *)dispatch thunk of CoreDataStore.context.getter(v102);
  uint64_t v98 = v3;
  uint64_t v99 = &v102;
  char v100 = 1;
  uint64_t v24 = v93;
  NSManagedObjectContext.performAndWait<A>(_:)(sub_D960);

  unint64_t v25 = v102;
  if (v24) {
    return swift_bridgeObjectRelease(v25);
  }
  uint64_t v89 = v19;
  uint64_t v87 = v17;
  uint64_t v88 = v14;
  uint64_t v104 = (void *)v102;
  uint64_t v93 = *(void *)(a1 + 16);
  if (!v93)
  {
LABEL_41:
    if (qword_39730 != -1) {
LABEL_52:
    }
      swift_once(&qword_39730, sub_1B530);
    uint64_t v77 = type metadata accessor for Logger(0LL);
    uint64_t v78 = sub_D710(v77, (uint64_t)qword_3AB98);
    uint64_t v79 = (os_log_s *)Logger.logObject.getter(v78);
    os_log_type_t v80 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v81 = 134217984;
      swift_beginAccess(&v104, v101, 0LL, 0LL);
      unint64_t v102 = v104[2];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v102, &v103, v81 + 4, v81 + 12);
      _os_log_impl(&dword_0, v79, v80, "Writing %ld self patterns", v81, 0xCu);
      swift_slowDealloc(v81, -1LL, -1LL);
    }

    swift_beginAccess(&v104, &v102, 0LL, 0LL);
    uint64_t v82 = v104;
    uint64_t v83 = swift_bridgeObjectRetain(v104);
    sub_800C(v83);
    swift_bridgeObjectRelease(v82);
    unint64_t v25 = (unint64_t)v104;
    return swift_bridgeObjectRelease(v25);
  }

  v86[1] = 0LL;
  v86[2] = v3;
  unint64_t v26 = *(void *)(v90 + 16);
  swift_bridgeObjectRetain(v90);
  swift_bridgeObjectRetain(a1);
  uint64_t v27 = 0LL;
  unint64_t v28 = 0LL;
  unint64_t v91 = v26;
  uint64_t v92 = a1;
  uint64_t v29 = v96;
  uint64_t v30 = v97;
  while (1)
  {
    uint64_t v32 = *(void *)(a1 + 8 * v27 + 32);
    if (v28 == v26)
    {
      uint64_t v33 = type metadata accessor for UUID(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56LL))(v22, 1LL, 1LL, v33);
      unint64_t v28 = v26;
    }

    else
    {
      if (v28 >= v26) {
        goto LABEL_47;
      }
      uint64_t v34 = type metadata accessor for UUID(0LL);
      uint64_t v35 = *(void *)(v34 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v35 + 16))( v22,  v90 + ((*(unsigned __int8 *)(v35 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))
      + *(void *)(v35 + 72) * v28++,
        v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v22, 0LL, 1LL, v34);
    }

    id v36 = v104;
    uint64_t v37 = (uint64_t)v95;
    if (!v104[2])
    {
      (*(void (**)(char *, uint64_t, uint64_t, int *))(v30 + 56))(v95, 1LL, 1LL, v7);
      swift_bridgeObjectRetain(v32);
      uint64_t v41 = (uint64_t)v94;
LABEL_17:
      uint64_t v42 = sub_D97C(v37, &qword_39A18);
      static Date.now.getter(v42);
      sub_D91C((uint64_t)v22, v41 + v7[6], &qword_39920);
      *(void *)(v41 + v7[5]) = 1LL;
      *(_BYTE *)(v41 + v7[7]) = 0;
      sub_CEF4(v41, v29);
      unint64_t v43 = (unint64_t)v104;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v104);
      unint64_t v102 = v43;
      unint64_t v46 = sub_A7D8(v32);
      uint64_t v47 = *(void *)(v43 + 16);
      BOOL v48 = (v45 & 1) == 0;
      uint64_t v49 = v47 + v48;
      if (__OFADD__(v47, v48))
      {
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
        goto LABEL_52;
      }

      char v50 = v45;
      if (*(void *)(v43 + 24) < v49)
      {
        sub_AA1C(v49, isUniquelyReferenced_nonNull_native);
        unint64_t v51 = sub_A7D8(v32);
        if ((v50 & 1) != (v52 & 1)) {
          break;
        }
        unint64_t v46 = v51;
        uint64_t v53 = (void *)v102;
        if ((v50 & 1) == 0) {
          goto LABEL_24;
        }
LABEL_4:
        uint64_t v30 = v97;
        uint64_t v31 = v53[7] + *(void *)(v97 + 72) * v46;
        uint64_t v29 = v96;
        sub_CF38(v96, v31);
LABEL_5:
        uint64_t v104 = v53;
        swift_bridgeObjectRelease(v32);
        swift_bridgeObjectRelease(0x8000000000000000LL);
        a1 = v92;
        goto LABEL_6;
      }

      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v53 = (void *)v102;
        if ((v45 & 1) != 0) {
          goto LABEL_4;
        }
      }

      else
      {
        sub_B618();
        uint64_t v53 = (void *)v102;
        if ((v50 & 1) != 0) {
          goto LABEL_4;
        }
      }

LABEL_24:
      v53[(v46 >> 6) + 8] |= 1LL << v46;
      *(void *)(v53[6] + 8 * v46) = v32;
      uint64_t v30 = v97;
      uint64_t v54 = v53[7] + *(void *)(v97 + 72) * v46;
      uint64_t v29 = v96;
      sub_CEF4(v96, v54);
      uint64_t v55 = v53[2];
      BOOL v56 = __OFADD__(v55, 1LL);
      uint64_t v57 = v55 + 1;
      if (v56) {
        goto LABEL_48;
      }
      v53[2] = v57;
      swift_bridgeObjectRetain(v32);
      goto LABEL_5;
    }

    swift_bridgeObjectRetain_n(v32, 2LL);
    unint64_t v38 = sub_A7D8(v32);
    if ((v39 & 1) != 0)
    {
      sub_CF7C(v36[7] + *(void *)(v30 + 72) * v38, v37);
      uint64_t v40 = 0LL;
    }

    else
    {
      uint64_t v40 = 1LL;
    }

    uint64_t v41 = (uint64_t)v94;
    (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v30 + 56))(v37, v40, 1LL, v7);
    swift_bridgeObjectRelease(v32);
    uint64_t v58 = (uint64_t)v89;
    uint64_t v59 = sub_CEF4(v37, (uint64_t)v89);
    uint64_t v60 = (uint64_t)v87;
    static Date.now.getter(v59);
    uint64_t v61 = *(void *)(v58 + v7[5]);
    uint64_t v62 = v61 + 1;
    if (__OFADD__(v61, 1LL)) {
      goto LABEL_49;
    }
    sub_D91C((uint64_t)v22, v60 + v7[6], &qword_39920);
    *(void *)(v60 + v7[5]) = v62;
    *(_BYTE *)(v60 + v7[7]) = 0;
    sub_CEF4(v60, (uint64_t)v88);
    unint64_t v63 = (unint64_t)v104;
    uint64_t v64 = swift_isUniquelyReferenced_nonNull_native(v104);
    unint64_t v102 = v63;
    unint64_t v66 = sub_A7D8(v32);
    uint64_t v67 = *(void *)(v63 + 16);
    BOOL v68 = (v65 & 1) == 0;
    uint64_t v69 = v67 + v68;
    if (__OFADD__(v67, v68)) {
      goto LABEL_50;
    }
    char v70 = v65;
    if (*(void *)(v63 + 24) >= v69)
    {
      if ((v64 & 1) == 0) {
        sub_B618();
      }
      goto LABEL_33;
    }

    sub_AA1C(v69, v64);
    unint64_t v71 = sub_A7D8(v32);
    if ((v70 & 1) != (v72 & 1)) {
      break;
    }
    unint64_t v66 = v71;
LABEL_33:
    uint64_t v73 = (uint64_t)v88;
    uint64_t v74 = (void *)v102;
    if ((v70 & 1) != 0)
    {
      uint64_t v30 = v97;
      sub_CF38((uint64_t)v88, *(void *)(v102 + 56) + *(void *)(v97 + 72) * v66);
    }

    else
    {
      *(void *)(v102 + 8 * (v66 >> 6) + 64) |= 1LL << v66;
      *(void *)(v74[6] + 8 * v66) = v32;
      uint64_t v30 = v97;
      sub_CEF4(v73, v74[7] + *(void *)(v97 + 72) * v66);
      uint64_t v75 = v74[2];
      BOOL v56 = __OFADD__(v75, 1LL);
      uint64_t v76 = v75 + 1;
      if (v56) {
        goto LABEL_51;
      }
      v74[2] = v76;
      swift_bridgeObjectRetain(v32);
    }

    uint64_t v104 = v74;
    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_D764((uint64_t)v89);
    a1 = v92;
    uint64_t v29 = v96;
LABEL_6:
    ++v27;
    sub_D97C((uint64_t)v22, &qword_39920);
    unint64_t v26 = v91;
    if (v93 == v27)
    {
      swift_bridgeObjectRelease(v90);
      swift_bridgeObjectRelease(a1);
      goto LABEL_41;
    }
  }

  uint64_t v85 = sub_5BC0(&qword_399D0);
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v85);
  __break(1u);
  return result;
}

    uint64_t v7 = (v14 - 1) & v14;
    uint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(void *)(v4 + 16))
    {
LABEL_40:
      uint64_t v2 = 0LL;
      goto LABEL_42;
    }

      uint64_t v10 = (v15 - 1) & v15;
      uint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    }

    uint64_t v17 = swift_retain(*(void *)(*(void *)(a4 + 48) + 8 * v13));
    uint64_t result = (void *)sub_2A1D0(v17, v6);
    if (__OFSUB__(v5--, 1LL)) {
      break;
    }
    if (!v5) {
      goto LABEL_27;
    }
  }

  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

    uint64_t v17 = v126;
    if (v136 >= v139) {
      break;
    }
    if (v30 < v27) {
      goto LABEL_141;
    }
    uint64_t v37 = v30;
    if (v27 >= v30) {
      goto LABEL_38;
    }
    v139 = v11;
    unint64_t v38 = v27;
    char v39 = 0LL;
    uint64_t v40 = v22 * (v30 - 1);
    uint64_t v41 = v30 * v22;
    uint64_t v42 = v38;
    unint64_t v43 = v38 * v22;
    char v44 = v132;
    do
    {
      if (v42 != v37 + v39 - 1)
      {
        if (!v44) {
          goto LABEL_146;
        }
        sub_CEF4(v44 + v43, v128);
        if (v43 < v40 || v44 + v43 >= (unint64_t)(v44 + v41))
        {
          swift_arrayInitWithTakeFrontToBack(v44 + v43, v44 + v40, 1LL, v137);
        }

        else if (v43 != v40)
        {
          swift_arrayInitWithTakeBackToFront(v44 + v43);
        }

        sub_CEF4(v128, v44 + v40);
        uint64_t v37 = v30;
        uint64_t v22 = v140;
      }

      ++v42;
      --v39;
      v40 -= v22;
      v41 -= v22;
      v43 += v22;
    }

    while (v42 < v37 + v39);
    a1 = v135;
    uint64_t v2 = v125;
    uint64_t v17 = v126;
    uint64_t v27 = v129;
    uint64_t v11 = v139;
    if (v37 < v139) {
      goto LABEL_41;
    }
LABEL_58:
    if (v37 < v27) {
      goto LABEL_134;
    }
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v17);
    v136 = v37;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v17 = sub_189DC(0LL, *((void *)v17 + 2) + 1LL, 1, v17);
    }
    char v65 = *((void *)v17 + 2);
    uint64_t v64 = *((void *)v17 + 3);
    unint64_t v19 = v65 + 1;
    if (v65 >= v64 >> 1) {
      uint64_t v17 = sub_189DC((char *)(v64 > 1), v65 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v19;
    unint64_t v66 = v17 + 32;
    uint64_t v67 = &v17[16 * v65 + 32];
    BOOL v68 = v136;
    *(void *)uint64_t v67 = v27;
    *((void *)v67 + 1) = v68;
    if (v65)
    {
      while (1)
      {
        uint64_t v69 = v19 - 1;
        if (v19 >= 4)
        {
          uint64_t v74 = &v66[16 * v19];
          uint64_t v75 = *((void *)v74 - 8);
          uint64_t v76 = *((void *)v74 - 7);
          os_log_type_t v80 = __OFSUB__(v76, v75);
          uint64_t v77 = v76 - v75;
          if (v80) {
            goto LABEL_123;
          }
          uint64_t v79 = *((void *)v74 - 6);
          uint64_t v78 = *((void *)v74 - 5);
          os_log_type_t v80 = __OFSUB__(v78, v79);
          char v72 = v78 - v79;
          uint64_t v73 = v80;
          if (v80) {
            goto LABEL_124;
          }
          uint64_t v81 = v19 - 2;
          uint64_t v82 = &v66[16 * v19 - 32];
          uint64_t v84 = *(void *)v82;
          uint64_t v83 = *((void *)v82 + 1);
          os_log_type_t v80 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          if (v80) {
            goto LABEL_126;
          }
          os_log_type_t v80 = __OFADD__(v72, v85);
          uint64_t v86 = v72 + v85;
          if (v80) {
            goto LABEL_129;
          }
          if (v86 >= v77)
          {
            uint64_t v104 = &v66[16 * v69];
            unint64_t v106 = *(void *)v104;
            uint64_t v105 = *((void *)v104 + 1);
            os_log_type_t v80 = __OFSUB__(v105, v106);
            uint64_t v107 = v105 - v106;
            if (v80) {
              goto LABEL_133;
            }
            uint64_t v97 = v72 < v107;
            goto LABEL_95;
          }
        }

        else
        {
          if (v19 != 3)
          {
            uint64_t v98 = *((void *)v17 + 4);
            uint64_t v99 = *((void *)v17 + 5);
            os_log_type_t v80 = __OFSUB__(v99, v98);
            unint64_t v91 = v99 - v98;
            uint64_t v92 = v80;
            goto LABEL_89;
          }

          unint64_t v71 = *((void *)v17 + 4);
          char v70 = *((void *)v17 + 5);
          os_log_type_t v80 = __OFSUB__(v70, v71);
          char v72 = v70 - v71;
          uint64_t v73 = v80;
        }

        if ((v73 & 1) != 0) {
          goto LABEL_125;
        }
        uint64_t v81 = v19 - 2;
        uint64_t v87 = &v66[16 * v19 - 32];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        uint64_t v90 = __OFSUB__(v88, v89);
        unint64_t v91 = v88 - v89;
        uint64_t v92 = v90;
        if (v90) {
          goto LABEL_128;
        }
        uint64_t v93 = &v66[16 * v69];
        uint64_t v95 = *(void *)v93;
        id v94 = *((void *)v93 + 1);
        os_log_type_t v80 = __OFSUB__(v94, v95);
        uint64_t v96 = v94 - v95;
        if (v80) {
          goto LABEL_131;
        }
        if (__OFADD__(v91, v96)) {
          goto LABEL_132;
        }
        if (v91 + v96 >= v72)
        {
          uint64_t v97 = v72 < v96;
LABEL_95:
          if (v97) {
            uint64_t v69 = v81;
          }
          goto LABEL_97;
        }

        uint64_t v9 = (v16 - 1) & v16;
        uint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
      }

      uint64_t result = sub_2A1D0(*(void *)(*(void *)(v3 + 48) + 8 * v14), v5);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v5;
  return result;
}

    uint64_t v9 = (v17 - 1) & v17;
    uint64_t v14 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_9:
    uint64_t v15 = swift_retain(*(void *)(*(void *)(v3 + 48) + 8 * v14));
    uint64_t result = sub_2A1D0(v15, v5);
  }

  uint64_t v18 = v16 + 3;
  if (v18 >= v10)
  {
LABEL_25:
    swift_release(v3);
    goto LABEL_26;
  }

  uint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17)
  {
    uint64_t v12 = v18;
    goto LABEL_24;
  }

  while (1)
  {
    uint64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v12 >= v10) {
      goto LABEL_25;
    }
    uint64_t v17 = *(void *)(v7 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_24;
    }
  }

void sub_800C(uint64_t a1)
{
  uint64_t v3 = sub_5D10(a1);
  aBlock[0] = v3;
  swift_bridgeObjectRetain(v3);
  sub_B834(aBlock);
  if (v2)
  {
    swift_release(aBlock[0]);
    __break(1u);
    return;
  }

  swift_bridgeObjectRelease(v3);
  uint64_t v4 = aBlock[0];
  if (*(void *)(aBlock[0] + 16LL) <= 0x14uLL)
  {
    uint64_t v9 = (void *)aBlock[0];
  }

  else
  {
    uint64_t v5 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
    uint64_t v6 = swift_unknownObjectRetain_n(v4, 2LL);
    uint64_t v7 = (void *)swift_dynamicCastClass(v6, v5);
    if (!v7)
    {
      swift_release(v4);
      uint64_t v7 = _swiftEmptyArrayStorage;
    }

    uint64_t v8 = v7[2];
    swift_release(v7);
    if (v8 == 20)
    {
      uint64_t v9 = (void *)swift_dynamicCastClass(v4, v5);
      swift_release(v4);
      if (v9) {
        goto LABEL_10;
      }
      uint64_t v9 = _swiftEmptyArrayStorage;
    }

    else
    {
      swift_release(v4);
      uint64_t v26 = *(unsigned __int8 *)(*(void *)(sub_5BC0(&qword_399F0) - 8) + 80LL);
      uint64_t v9 = sub_21800(v4, v4 + ((v26 + 32) & ~v26), 0LL, 0x29uLL);
    }

    swift_release(v4);
  }
}

BOOL sub_8394(void *a1, uint64_t a2)
{
  id v48 = a1;
  uint64_t v3 = sub_5BC0(&qword_39920);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_5BC0(&qword_399F8);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = (int *)type metadata accessor for PatternStoreValue(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess(a2 + 16, v53, 1LL, 0LL);
  uint64_t v13 = *(void *)(a2 + 16);
  unint64_t v12 = *(void *)(a2 + 24);
  unint64_t v14 = *(void *)(v13 + 16);
  if (v12 == v14)
  {
    uint64_t v15 = sub_5BC0(&qword_399F0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v8, 1LL, 1LL, v15);
  }

  else
  {
    if (v12 >= v14)
    {
      __break(1u);
      swift_once(&qword_39730, sub_1B530);
      uint64_t v29 = type metadata accessor for Logger(0LL);
      sub_D710(v29, (uint64_t)qword_3AB98);
      swift_errorRetain(v13);
      uint64_t v30 = swift_errorRetain(v13);
      uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
      os_log_type_t v32 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v34 = swift_slowAlloc(32LL, -1LL);
        uint64_t v52 = v34;
        *(_DWORD *)uint64_t v33 = 136315138;
        swift_getErrorValue(v13, v51, v50);
        uint64_t v35 = Error.localizedDescription.getter(v50[1], v50[2]);
        unint64_t v37 = v36;
        uint64_t v49 = sub_20E38(v35, v36, &v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v33 + 4, v33 + 12);
        swift_bridgeObjectRelease(v37);
        swift_errorRelease(v13);
        swift_errorRelease(v13);
        _os_log_impl( &dword_0,  v31,  v32,  "Could not write a record to RECTIFI on-device Self Pattern storage %s",  v33,  0xCu);
        swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v34, -1LL, -1LL);
        swift_slowDealloc(v33, -1LL, -1LL);

        swift_errorRelease(v13);
      }

      else
      {
        swift_errorRelease(v13);
        swift_errorRelease(v13);
        swift_errorRelease(v13);
      }

      return (_DWORD)a2 == 1;
    }

    uint64_t v16 = sub_5BC0(&qword_399F0);
    uint64_t v17 = v9;
    id v18 = v5;
    uint64_t v19 = *(void *)(v16 - 8);
    sub_D91C( v13 + ((*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))
    + *(void *)(v19 + 72) * v12,
      (uint64_t)v8,
      &qword_399F0);
    *(void *)(a2 + 24) = v12 + 1;
    uint64_t v20 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v19 + 56);
    uint64_t v5 = v18;
    uint64_t v9 = v17;
    v20(v8, 0LL, 1LL, v16);
  }

  uint64_t v21 = sub_5BC0(&qword_399F0);
  LODWORD(a2) = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48LL))(v8, 1LL, v21);
  if ((_DWORD)a2 == 1)
  {
    sub_D97C((uint64_t)v8, &qword_399F8);
  }

  else
  {
    uint64_t v22 = *v8;
    sub_CEF4((uint64_t)v8 + *(int *)(v21 + 48), (uint64_t)v11);
    uint64_t v23 = type metadata accessor for RECTIFISelfPatternStore();
    uint64_t v24 = swift_dynamicCastClass(v48, v23);
    if (v24)
    {
      unint64_t v25 = (void *)v24;
      uint64_t v52 = v22;
      id v26 = v48;
      uint64_t v27 = sub_5BC0(&qword_399D0);
      uint64_t v28 = sub_D7A0( &qword_39A00,  &qword_39A08,  (uint64_t)&unk_2E288,  (uint64_t)&protocol conformance descriptor for <A> [A]);
      uint64_t v38 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v52, v27, v28);
      unint64_t v40 = v39;
      swift_bridgeObjectRelease(v22);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_CE6C(v38, v40);
      [v25 setPattern:isa];

      [v25 setFrequency:*(void *)&v11[v9[5]]];
      Class v42 = Date._bridgeToObjectiveC()().super.isa;
      [v25 setTimestamp:v42];

      sub_D91C((uint64_t)&v11[v9[6]], (uint64_t)v5, &qword_39920);
      uint64_t v43 = type metadata accessor for UUID(0LL);
      uint64_t v44 = *(void *)(v43 - 8);
      Class v45 = 0LL;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v5, 1LL, v43) != 1)
      {
        Class v45 = UUID._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v44 + 8))(v5, v43);
      }

      [v25 setPlusId:v45];

      [v25 setAppLevelAggregation:v11[v9[7]] & 1];
    }

    else
    {
      swift_bridgeObjectRelease(v22);
    }

    sub_D764((uint64_t)v11);
  }

  return (_DWORD)a2 == 1;
}

void sub_8918(uint64_t a1)
{
  uint64_t v3 = sub_5D10(a1);
  aBlock[0] = v3;
  swift_bridgeObjectRetain(v3);
  sub_B834(aBlock);
  if (v2)
  {
    swift_release(aBlock[0]);
    __break(1u);
    return;
  }

  swift_bridgeObjectRelease(v3);
  uint64_t v4 = aBlock[0];
  if (*(void *)(aBlock[0] + 16LL) <= 0xAuLL)
  {
    uint64_t v9 = (void *)aBlock[0];
  }

  else
  {
    uint64_t v5 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
    uint64_t v6 = swift_unknownObjectRetain_n(v4, 2LL);
    uint64_t v7 = (void *)swift_dynamicCastClass(v6, v5);
    if (!v7)
    {
      swift_release(v4);
      uint64_t v7 = _swiftEmptyArrayStorage;
    }

    uint64_t v8 = v7[2];
    swift_release(v7);
    if (v8 == 10)
    {
      uint64_t v9 = (void *)swift_dynamicCastClass(v4, v5);
      swift_release(v4);
      if (v9) {
        goto LABEL_10;
      }
      uint64_t v9 = _swiftEmptyArrayStorage;
    }

    else
    {
      swift_release(v4);
      uint64_t v26 = *(unsigned __int8 *)(*(void *)(sub_5BC0(&qword_399F0) - 8) + 80LL);
      uint64_t v9 = sub_21800(v4, v4 + ((v26 + 32) & ~v26), 0LL, 0x15uLL);
    }

    swift_release(v4);
  }

BOOL sub_8CA0(void *a1, uint64_t a2, uint64_t a3)
{
  id v44 = a1;
  uint64_t v5 = sub_5BC0(&qword_399F8);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = type metadata accessor for PatternStoreValue(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess(a2 + 16, v49, 1LL, 0LL);
  uint64_t v12 = *(void *)(a2 + 16);
  unint64_t v11 = *(void *)(a2 + 24);
  unint64_t v13 = *(void *)(v12 + 16);
  if (v11 == v13)
  {
    uint64_t v14 = sub_5BC0(&qword_399F0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v7, 1LL, 1LL, v14);
  }

  else
  {
    if (v11 >= v13)
    {
      __break(1u);
      swift_once(&qword_39730, sub_1B530);
      uint64_t v27 = type metadata accessor for Logger(0LL);
      sub_D710(v27, (uint64_t)qword_3AB98);
      swift_errorRetain(a3);
      uint64_t v28 = swift_errorRetain(a3);
      uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
      os_log_type_t v30 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v29, v30))
      {
        id v44 = v10;
        uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v32 = swift_slowAlloc(32LL, -1LL);
        uint64_t v48 = v32;
        *(_DWORD *)uint64_t v31 = 136315138;
        swift_getErrorValue(a3, v47, v46);
        uint64_t v33 = Error.localizedDescription.getter(v46[1], v46[2]);
        unint64_t v35 = v34;
        uint64_t v45 = sub_20E38(v33, v34, &v48);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v31 + 4, v31 + 12);
        swift_bridgeObjectRelease(v35);
        swift_errorRelease(a3);
        swift_errorRelease(a3);
        _os_log_impl( &dword_0,  v29,  v30,  "Could not write a record to RECTIFI on-device Infrequent Pattern storage %s",  v31,  0xCu);
        swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v32, -1LL, -1LL);
        swift_slowDealloc(v31, -1LL, -1LL);

        swift_errorRelease(a3);
        uint64_t v36 = (uint64_t)v44;
LABEL_14:
        sub_D764(v36);
        return (_DWORD)a2 == 1;
      }

      swift_errorRelease(a3);
      swift_errorRelease(a3);
      swift_errorRelease(a3);
LABEL_13:
      uint64_t v36 = (uint64_t)v10;
      goto LABEL_14;
    }

    uint64_t v15 = sub_5BC0(&qword_399F0);
    id v16 = v10;
    uint64_t v17 = *(void *)(v15 - 8);
    sub_D91C( v12 + ((*(unsigned __int8 *)(v17 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))
    + *(void *)(v17 + 72) * v11,
      (uint64_t)v7,
      &qword_399F0);
    *(void *)(a2 + 24) = v11 + 1;
    id v18 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v17 + 56);
    uint64_t v10 = v16;
    v18(v7, 0LL, 1LL, v15);
  }

  uint64_t v19 = sub_5BC0(&qword_399F0);
  LODWORD(a2) = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48LL))(v7, 1LL, v19);
  if ((_DWORD)a2 != 1)
  {
    uint64_t v20 = *v7;
    sub_CEF4((uint64_t)v7 + *(int *)(v19 + 48), (uint64_t)v10);
    uint64_t v21 = type metadata accessor for RECTIFIInfrequentPatternStore();
    uint64_t v22 = swift_dynamicCastClass(v44, v21);
    if (v22)
    {
      uint64_t v23 = (void *)v22;
      uint64_t v48 = v20;
      id v24 = v44;
      uint64_t v25 = sub_5BC0(&qword_399D0);
      uint64_t v26 = sub_D7A0( &qword_39A00,  &qword_39A08,  (uint64_t)&unk_2E288,  (uint64_t)&protocol conformance descriptor for <A> [A]);
      uint64_t v37 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v48, v25, v26);
      unint64_t v39 = v38;
      swift_bridgeObjectRelease(v20);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_CE6C(v37, v39);
      [v23 setPattern:isa];

      [v23 setFrequency:*(void *)&v10[*(int *)(v8 + 20)]];
      Class v41 = Date._bridgeToObjectiveC()().super.isa;
      [v23 setTimestamp:v41];
    }

    else
    {
      swift_bridgeObjectRelease(v20);
    }

    goto LABEL_13;
  }

  sub_D97C((uint64_t)v7, &qword_399F8);
  return (_DWORD)a2 == 1;
}

id sub_914C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)dispatch thunk of CoreDataStore.context.getter();
  id v11 = 0LL;
  id v4 = [v3 executeRequest:a2 error:&v11];

  id v5 = v11;
  if (v4)
  {
    id v6 = v11;

    uint64_t v7 = (void *)dispatch thunk of CoreDataStore.context.getter();
    id v11 = 0LL;
    unsigned int v8 = [v7 save:&v11];

    id v5 = v11;
    if (v8) {
      return v11;
    }
  }

  id v10 = v5;
  _convertNSErrorToError(_:)(v5);

  return (id)swift_willThrow();
}

void sub_924C()
{
}

uint64_t sub_9278()
{
  return swift_release(*(void *)(v0 + qword_398C8));
}

uint64_t sub_92A4()
{
  uint64_t v0 = CoreDataStore.deinit();
  swift_release(*(void *)(v0 + qword_398C0));
  swift_release(*(void *)(v0 + qword_398C8));
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t sub_92F0()
{
  return type metadata accessor for RectifiCoreDataStore(0LL);
}

void *sub_92F8(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Date(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for UUID(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11))
    {
      uint64_t v13 = sub_5BC0(&qword_39920);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0LL, 1LL, v11);
    }

    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }

  return a1;
}

uint64_t sub_941C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  return result;
}

uint64_t sub_94AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10))
  {
    uint64_t v12 = sub_5BC0(&qword_39920);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
  }

  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_95A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1LL, v10);
  int v14 = v12(v9, 1LL, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }

    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }

  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_5BC0(&qword_39920);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
LABEL_7:
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_96EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10))
  {
    uint64_t v12 = sub_5BC0(&qword_39920);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
  }

  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_97E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1LL, v10);
  int v14 = v12(v9, 1LL, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }

    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }

  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_5BC0(&qword_39920);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
LABEL_7:
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_9928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9934);
}

uint64_t sub_9934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
    return v9(v10, a2, v8);
  }

  uint64_t v11 = sub_5BC0(&qword_39920);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }

  unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 2) {
    int v15 = ((v14 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v15 = -2;
  }
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t sub_99FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9A08);
}

uint64_t sub_9A08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
    return v11(v12, a2, a2, v10);
  }

  uint64_t result = sub_5BC0(&qword_39920);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }

  *(_BYTE *)(a1 + *(int *)(a4 + 28)) = a2 + 2;
  return result;
}

uint64_t type metadata accessor for PatternStoreValue(uint64_t a1)
{
  return sub_9AC4(a1, (uint64_t *)&unk_39980, (uint64_t)&nominal type descriptor for PatternStoreValue);
}

uint64_t sub_9AC4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

void sub_9AF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    v6[1] = (char *)&value witness table for Builtin.Int64 + 64;
    sub_9B90(319LL);
    if (v5 <= 0x3F)
    {
      v6[2] = *(void *)(v4 - 8) + 64LL;
      v6[3] = &unk_2DAD8;
      swift_initStructMetadata(a1, 256LL, 4LL, v6, a1 + 16);
    }
  }

void sub_9B90(uint64_t a1)
{
  if (!qword_39990)
  {
    uint64_t v2 = type metadata accessor for UUID(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_39990);
    }
  }

uint64_t sub_9BE4(uint64_t a1, void *a2)
{
  uint64_t v4 = *(uint64_t (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  LOBYTE(v4) = v4();
  swift_release(v3);

  return v4 & 1;
}

uint64_t sub_9C34(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0LL, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1LL;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1LL;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_9CF8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    unint64_t v6 = (unint64_t)a2 >> 62;
LABEL_44:
    if (a2 < 0) {
      uint64_t v20 = a2;
    }
    else {
      uint64_t v20 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(a2);
    if (v5 != v21) {
      return 0LL;
    }
LABEL_4:
    if (!v5) {
      return 1LL;
    }
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8LL;
    if (a1 < 0) {
      uint64_t v7 = a1;
    }
    if (!v4) {
      uint64_t v7 = (a1 & 0xFFFFFFFFFFFFFF8LL) + 32;
    }
    uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v9 = (a2 & 0xFFFFFFFFFFFFFF8LL) + 32;
    if (a2 < 0) {
      uint64_t v8 = a2;
    }
    if (v6) {
      uint64_t v9 = v8;
    }
    if (v7 == v9) {
      return 1LL;
    }
    if ((v5 & 0x8000000000000000LL) == 0)
    {
      if (((a2 | a1) & 0xC000000000000001LL) != 0)
      {
        unint64_t v22 = a2 & 0xC000000000000001LL;
        if ((a1 & 0xC000000000000001LL) != 0)
        {
          uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a1);
          if (v22)
          {
LABEL_18:
            uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
LABEL_22:
            BOOL v12 = *(void *)(v10 + 24) == *(void *)(v11 + 24) && *(void *)(v10 + 32) == *(void *)(v11 + 32);
            if ((v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              && *(unsigned __int8 *)(v10 + 40) == *(unsigned __int8 *)(v11 + 40))
            {
              __asm { BR              X10 }
            }

            swift_release(v10);
            swift_release(v11);
            return 0LL;
          }
        }

        else
        {
          uint64_t v10 = *(void *)(a1 + 32);
          swift_retain(v10);
          if (v22) {
            goto LABEL_18;
          }
        }

        if (*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8LL)))
        {
          uint64_t v11 = *(void *)(a2 + 32);
          swift_retain(v11);
          goto LABEL_22;
        }
      }

      else
      {
        uint64_t v14 = a1 + 32;
        uint64_t v15 = a2 + 32;
        if (*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8LL)))
        {
          uint64_t v16 = *(void *)v14;
          uint64_t v17 = *(void *)v15;
          BOOL v18 = *(void *)(*(void *)v14 + 24LL) == *(void *)(*(void *)v15 + 24LL)
             && *(void *)(*(void *)v14 + 32LL) == *(void *)(*(void *)v15 + 32LL);
          if ((v18 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            && *(unsigned __int8 *)(v16 + 40) == *(unsigned __int8 *)(v17 + 40))
          {
            __asm { BR              X10 }
          }

          return 0LL;
        }

        __break(1u);
      }

      __break(1u);
    }

    __break(1u);
    JUMPOUT(0xA654LL);
  }

  if (a1 < 0) {
    uint64_t v19 = a1;
  }
  else {
    uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(a1);
  unint64_t v6 = (unint64_t)a2 >> 62;
LABEL_3:
  return 0LL;
}

unint64_t sub_A734(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v10, v3, v4);
  swift_bridgeObjectRelease(v4);
  Hasher._combine(_:)(*(unsigned __int8 *)(a1 + 40));
  uint64_t v5 = sub_1C218(*(_BYTE *)(a1 + 41));
  uint64_t v7 = v6;
  String.hash(into:)(v10, v5, v6);
  swift_bridgeObjectRelease(v7);
  Swift::Int v8 = Hasher._finalize()();
  return sub_AF00(a1, v8);
}

unint64_t sub_A7D8(uint64_t a1)
{
  Swift::Int v3 = Hasher._finalize()();
  return sub_B370(a1, v3);
}

unint64_t sub_A830(uint64_t a1, uint64_t a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_5BC0(&qword_39A20);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = -1LL;
    if (v8 < 64) {
      uint64_t v10 = ~(-1LL << v8);
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    unint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v14 << 6);
      }

      else
      {
        int64_t v17 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }

        if (v17 >= v12) {
          goto LABEL_25;
        }
        unint64_t v18 = v9[v17];
        ++v14;
        if (!v18)
        {
          int64_t v14 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_25;
          }
          unint64_t v18 = v9[v14];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_25:
              swift_release(v5);
              if ((a2 & 1) != 0)
              {
                uint64_t v24 = 1LL << *(_BYTE *)(v5 + 32);
                if (v24 > 63) {
                  bzero((void *)(v5 + 64), ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v9 = -1LL << v24;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v18 = v9[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v14 = v19 + 1;
                if (__OFADD__(v19, 1LL)) {
                  goto LABEL_32;
                }
                if (v14 >= v12) {
                  goto LABEL_25;
                }
                unint64_t v18 = v9[v14];
                ++v19;
                if (v18) {
                  goto LABEL_22;
                }
              }
            }

            int64_t v14 = v19;
          }
        }

LABEL_22:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }

      uint64_t v20 = 8 * v16;
      uint64_t v21 = *(void *)(v5 + 48);
      uint64_t v22 = *(void *)(v21 + v20);
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + v20);
      if ((a2 & 1) == 0)
      {
        swift_retain(*(void *)(v21 + v20));
        swift_bridgeObjectRetain(v23);
      }

      unint64_t result = sub_AD78(v22, v23, v7);
    }
  }

  unint64_t result = swift_release(v5);
  *Swift::Int v3 = v7;
  return result;
}

    uint64_t v5 = (v16 - 1) & v16;
    uint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    int64_t v12 = *v11;
    int v13 = v11[1];
    swift_bridgeObjectRetain_n(v13, 2LL);
    sub_293A4(v18, v12, v13);
    int64_t v14 = v18[1];
    swift_bridgeObjectRelease(v13);
    unint64_t result = swift_bridgeObjectRelease(v14);
  }

  int64_t v17 = v15 + 4;
  if (v17 >= v6) {
    return swift_release(a1);
  }
  unint64_t v16 = *(void *)(v2 + 8 * v17);
  if (v16)
  {
    uint64_t v8 = v17;
    goto LABEL_22;
  }

  while (1)
  {
    uint64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release(a1);
    }
    unint64_t v16 = *(void *)(v2 + 8 * v8);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }

  __break(1u);
LABEL_23:
  int64_t v17 = 2;
  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v17,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  *uint64_t v24 = v8;
  v24[1] = a2;
  uint64_t v25 = *(void *)(v23 + 16);
  uint64_t v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

Swift::Int sub_AA1C(uint64_t a1, uint64_t a2)
{
  Swift::Int v3 = v2;
  uint64_t v39 = *(void *)(type metadata accessor for PatternStoreValue(0LL) - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_5BC0(&qword_399E8);
  int v40 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_43;
  }
  uint64_t v36 = v3;
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  unint64_t v38 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  Swift::Int result = swift_retain(v8);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }

    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v21 >= v37) {
      break;
    }
    uint64_t v22 = v38;
    unint64_t v23 = v38[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v23 = v38[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_36:
          swift_release(v8);
          Swift::Int v3 = v36;
          if ((v40 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v23 = v38[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1LL)) {
              goto LABEL_45;
            }
            if (v17 >= v37) {
              goto LABEL_36;
            }
            unint64_t v23 = v38[v17];
            ++v24;
            if (v23) {
              goto LABEL_23;
            }
          }
        }

        int64_t v17 = v24;
      }
    }

unint64_t sub_AD78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v14, v6, v7);
  swift_bridgeObjectRelease(v7);
  Hasher._combine(_:)(*(unsigned __int8 *)(a1 + 40));
  uint64_t v8 = sub_1C218(*(_BYTE *)(a1 + 41));
  uint64_t v10 = v9;
  String.hash(into:)(v14, v8, v9);
  swift_bridgeObjectRelease(v10);
  Swift::Int v11 = Hasher._finalize()();
  unint64_t result = _HashTable.nextHole(atOrAfter:)( v11 & ~(-1LL << *(_BYTE *)(a3 + 32)),  a3 + 64,  ~(-1LL << *(_BYTE *)(a3 + 32)));
  *(void *)(a3 + 64 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  uint64_t v13 = 8 * result;
  *(void *)(*(void *)(a3 + 48) + v13) = a1;
  *(void *)(*(void *)(a3 + 56) + v13) = a2;
  ++*(void *)(a3 + 16);
  return result;
}

uint64_t sub_AE7C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t result = sub_CEF4(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72LL) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1LL);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_AF00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(v2 + 48) + 8 * v4);
      BOOL v8 = *(void *)(v7 + 24) == *(void *)(a1 + 24) && *(void *)(v7 + 32) == *(void *)(a1 + 32);
      if ((v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        && *(unsigned __int8 *)(v7 + 40) == *(unsigned __int8 *)(a1 + 40))
      {
        __asm { BR              X10 }
      }

      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_B370(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v7 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t v8 = swift_bridgeObjectRetain(v7);
    char v9 = sub_9CF8(v8, a1);
    swift_bridgeObjectRelease(v7);
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = ~v4;
      for (unint64_t i = (i + 1) & v10; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v10)
      {
        uint64_t v11 = *(void *)(*(void *)(v2 + 48) + 8 * i);
        uint64_t v12 = swift_bridgeObjectRetain(v11);
        char v13 = sub_9CF8(v12, a1);
        swift_bridgeObjectRelease(v11);
        if ((v13 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

void *sub_B470()
{
  uint64_t v1 = v0;
  sub_5BC0(&qword_39A20);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
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
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    swift_retain(v17);
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
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

    unint64_t v14 = (v22 - 1) & v22;
    uint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 8 * v17;
    int64_t v19 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_CF7C(*(void *)(v4 + 56) + v20, (uint64_t)v3);
    *(void *)(*(void *)(v6 + 48) + v18) = v19;
    sub_CEF4((uint64_t)v3, *(void *)(v6 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain(v19);
  }

  unint64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v4);
    uint64_t v1 = v24;
    goto LABEL_28;
  }

  uint64_t v22 = *(void *)(v8 + 8 * v23);
  if (v22)
  {
    uint64_t v11 = v23;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    uint64_t v22 = *(void *)(v8 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

    uint64_t v16 = v3;
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    int64_t v19 = *v17;
    uint64_t v18 = v17[1];
    Hasher.init(_seed:)(v35, *(void *)(v4 + 40));
    swift_bridgeObjectRetain(v18);
    String.hash(into:)(v35, v19, v18);
    unint64_t v20 = Hasher._finalize()();
    int64_t v21 = v4;
    uint64_t v22 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v34 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v23) & 1) == 0) {
      goto LABEL_39;
    }
    int64_t v24 = *(void *)(v21 + 48);
    uint64_t v25 = (void *)(v24 + 16 * v23);
    uint64_t v26 = v25[1];
    uint64_t v27 = *v25 == v19 && v26 == v18;
    if (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v25, v26, v19, v18, 0LL) & 1) == 0)
    {
      uint64_t v28 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v28;
        if (((*(void *)(v34 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v23) & 1) == 0) {
          break;
        }
        unint64_t v29 = (void *)(v24 + 16 * v23);
        unint64_t v30 = v29[1];
        char v31 = *v29 == v19 && v30 == v18;
        if (v31 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v29, v30, v19, v18, 0LL) & 1) != 0) {
          goto LABEL_7;
        }
      }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_B618()
{
  uint64_t v1 = v0;
  uint64_t v25 = *(void *)(type metadata accessor for PatternStoreValue(0LL) - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_5BC0(&qword_399E8);
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = (void *)swift_release(v4);
LABEL_28:
    *uint64_t v1 = v6;
    return result;
  }

  int64_t v24 = v1;
  uint64_t result = (void *)(v5 + 64);
  uint64_t v8 = v4 + 64;
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  int64_t v11 = 0LL;
  *(void *)(v6 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v21 >= v15) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v8 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v8 + 8 * v11);
      if (!v22) {
        break;
      }
    }

LABEL_30:
  __break(1u);
  return result;
}

    uint64_t v12 = (v21 - 1) & v21;
    uint64_t v13 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_31:
    uint64_t v19 = *(void *)(*(void *)(v1 + 48) + 8 * v13);
    swift_retain(v19);
    if (!v19) {
      return sub_10A9C(v1);
    }
    while (1)
    {
      sub_28CB4(&v25, v19);
      uint64_t result = swift_release(v25);
      uint64_t v6 = v14;
      unint64_t v7 = v12;
      if ((v1 & 0x8000000000000000LL) == 0) {
        break;
      }
LABEL_12:
      int64_t v15 = __CocoaSet.Iterator.next()(result);
      if (v15)
      {
        unint64_t v16 = v15;
        int64_t v24 = v15;
        unint64_t v17 = type metadata accessor for PatternItem();
        swift_unknownObjectRetain(v16, v18);
        swift_dynamicCast(&v25, &v24, (char *)&type metadata for Swift.AnyObject + 8, v17, 7LL);
        uint64_t v19 = v25;
        swift_unknownObjectRelease(v16);
        unint64_t v14 = v6;
        uint64_t v12 = v7;
        if (v19) {
          continue;
        }
      }

      return sub_10A9C(v1);
    }
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
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

  __break(1u);
  return result;
}

Swift::Int sub_B834(void *a1)
{
  uint64_t v2 = *(void *)(sub_5BC0(&qword_399F0) - 8);
  uint64_t v3 = (void *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v3 = (void *)sub_199FC(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_B8B8(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_B8B8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v165 = sub_5BC0(&qword_399F0);
  uint64_t v4 = *(void *)(v165 - 8);
  uint64_t v5 = __chkstk_darwin(v165);
  uint64_t v152 = (uint64_t)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v166 = (uint64_t)&v145 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  v163 = (uint64_t *)((char *)&v145 - v10);
  uint64_t v11 = __chkstk_darwin(v9);
  v162 = (uint64_t *)((char *)&v145 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  v161 = (uint64_t *)((char *)&v145 - v14);
  __chkstk_darwin(v13);
  v160 = (uint64_t *)((char *)&v145 - v15);
  Swift::Int v16 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v16);
  if (result >= v16)
  {
    if (v16 < 0) {
      goto LABEL_140;
    }
    if (v16) {
      return sub_C454(0LL, v16, 1LL, a1);
    }
    return result;
  }

  if (v16 >= 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v16 + 1;
  }
  if (v16 < -1) {
    goto LABEL_148;
  }
  Swift::Int v148 = result;
  uint64_t v156 = v4;
  if (v16 < 2)
  {
    unint64_t v22 = (char *)_swiftEmptyArrayStorage;
    unint64_t v154 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v147 = _swiftEmptyArrayStorage;
    if (v16 != 1)
    {
      unint64_t v24 = _swiftEmptyArrayStorage[2];
LABEL_103:
      if (v24 >= 2)
      {
        uint64_t v136 = *a1;
        do
        {
          unint64_t v137 = v24 - 2;
          if (v24 < 2) {
            goto LABEL_135;
          }
          if (!v136) {
            goto LABEL_147;
          }
          v130 = v22;
          v138 = v22 + 32;
          uint64_t v139 = *(void *)&v22[16 * v137 + 32];
          uint64_t v140 = *(void *)&v22[16 * v24 + 24];
          sub_C740( v136 + *(void *)(v156 + 72) * v139,  v136 + *(void *)(v156 + 72) * *(void *)&v138[16 * v24 - 16],  v136 + *(void *)(v156 + 72) * v140,  v154);
          if (v2) {
            goto LABEL_115;
          }
          if (v140 < v139) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v130) & 1) == 0) {
            v130 = sub_18E4C((uint64_t)v130);
          }
          if (v137 >= *((void *)v130 + 2)) {
            goto LABEL_137;
          }
          v141 = &v130[16 * v137 + 32];
          *(void *)v141 = v139;
          *((void *)v141 + 1) = v140;
          unint64_t v142 = *((void *)v130 + 2);
          if (v24 > v142) {
            goto LABEL_138;
          }
          unint64_t v22 = v130;
          memmove(&v130[16 * v24 + 16], &v130[16 * v24 + 32], 16 * (v142 - v24));
          *((void *)v130 + 2) = v142 - 1;
          unint64_t v24 = v142 - 1;
        }

        while (v142 > 2);
      }

      v143 = v22;
LABEL_117:
      swift_bridgeObjectRelease(v143);
      v144 = v147;
      v147[2] = 0LL;
      return swift_bridgeObjectRelease(v144);
    }
  }

  else
  {
    uint64_t v19 = v18 >> 1;
    uint64_t v20 = static Array._allocateBufferUninitialized(minimumCapacity:)(v18 >> 1, v165);
    *(void *)(v20 + 16) = v19;
    uint64_t v21 = *(unsigned __int8 *)(v4 + 80);
    v147 = (void *)v20;
    unint64_t v154 = v20 + ((v21 + 32) & ~v21);
  }

  Swift::Int v23 = 0LL;
  unint64_t v22 = (char *)_swiftEmptyArrayStorage;
  v155 = a1;
  while (1)
  {
    v149 = v22;
    uint64_t v25 = v23;
    Swift::Int v26 = v23 + 1;
    Swift::Int v153 = v23;
    if (v23 + 1 >= v16)
    {
      Swift::Int v38 = v23 + 1;
      unint64_t v22 = v149;
    }

    else
    {
      uint64_t v150 = *a1;
      uint64_t v27 = v150;
      uint64_t v28 = *(void *)(v156 + 72);
      uint64_t v168 = v28;
      unint64_t v29 = v160;
      sub_D91C(v150 + v28 * v26, (uint64_t)v160, &qword_399F0);
      uint64_t v30 = v27 + v28 * v25;
      char v31 = v161;
      sub_D91C(v30, (uint64_t)v161, &qword_399F0);
      uint64_t v32 = v165;
      uint64_t v33 = *(int *)(v165 + 48);
      uint64_t v34 = (uint64_t)v162 + v33;
      void *v162 = *v29;
      sub_CF7C((uint64_t)v29 + v33, v34);
      uint64_t v35 = type metadata accessor for PatternStoreValue(0LL);
      uint64_t v167 = *(void *)(v34 + *(int *)(v35 + 20));
      sub_D764(v34);
      uint64_t v36 = *(int *)(v32 + 48);
      uint64_t v25 = v153;
      uint64_t v37 = (uint64_t)v163 + v36;
      void *v163 = *v31;
      sub_CF7C((uint64_t)v31 + v36, v37);
      uint64_t v158 = v35;
      Swift::Int v164 = *(void *)(v37 + *(int *)(v35 + 20));
      sub_D764(v37);
      sub_D97C((uint64_t)v31, &qword_399F0);
      sub_D97C((uint64_t)v29, &qword_399F0);
      Swift::Int v38 = v25 + 2;
      if (v25 + 2 < v16)
      {
        Swift::Int v159 = v16;
        uint64_t v146 = v2;
        uint64_t v157 = v168 * v26;
        uint64_t v39 = v150;
        Swift::Int v40 = v25 + 2;
        Swift::Int v151 = v168 * v38;
        while (1)
        {
          BOOL v41 = v164 < v167;
          Class v42 = v160;
          sub_D91C(v39 + v151, (uint64_t)v160, &qword_399F0);
          uint64_t v43 = v161;
          sub_D91C(v39 + v157, (uint64_t)v161, &qword_399F0);
          uint64_t v44 = v165;
          uint64_t v45 = *(int *)(v165 + 48);
          uint64_t v46 = (uint64_t)v162 + v45;
          void *v162 = *v42;
          sub_CF7C((uint64_t)v42 + v45, v46);
          uint64_t v47 = v158;
          uint64_t v48 = *(void *)(v46 + *(int *)(v158 + 20));
          sub_D764(v46);
          uint64_t v49 = *(int *)(v44 + 48);
          uint64_t v50 = (uint64_t)v163 + v49;
          void *v163 = *v43;
          sub_CF7C((uint64_t)v43 + v49, v50);
          uint64_t v51 = *(void *)(v50 + *(int *)(v47 + 20));
          sub_D764(v50);
          sub_D97C((uint64_t)v43, &qword_399F0);
          sub_D97C((uint64_t)v42, &qword_399F0);
          if (v41 == v51 >= v48) {
            break;
          }
          v39 += v168;
          if (v159 == ++v40)
          {
            Swift::Int v16 = v159;
            Swift::Int v38 = v159;
            uint64_t v2 = v146;
            a1 = v155;
            uint64_t v25 = v153;
            goto LABEL_23;
          }
        }

        uint64_t v2 = v146;
        a1 = v155;
        Swift::Int v38 = v40;
        uint64_t v25 = v153;
        Swift::Int v16 = v159;
      }

LABEL_55:
    if (v38 < v25) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v22);
    Swift::Int v164 = v38;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v22 = sub_189DC(0LL, *((void *)v22 + 2) + 1LL, 1, v22);
    }
    unint64_t v86 = *((void *)v22 + 2);
    unint64_t v85 = *((void *)v22 + 3);
    unint64_t v24 = v86 + 1;
    if (v86 >= v85 >> 1) {
      unint64_t v22 = sub_189DC((char *)(v85 > 1), v86 + 1, 1, v22);
    }
    *((void *)v22 + 2) = v24;
    uint64_t v87 = v22 + 32;
    uint64_t v88 = &v22[16 * v86 + 32];
    Swift::Int v89 = v164;
    *(void *)uint64_t v88 = v25;
    *((void *)v88 + 1) = v89;
    if (v86)
    {
      while (1)
      {
        unint64_t v90 = v24 - 1;
        if (v24 >= 4)
        {
          uint64_t v95 = &v87[16 * v24];
          uint64_t v96 = *((void *)v95 - 8);
          uint64_t v97 = *((void *)v95 - 7);
          BOOL v101 = __OFSUB__(v97, v96);
          uint64_t v98 = v97 - v96;
          if (v101) {
            goto LABEL_123;
          }
          uint64_t v100 = *((void *)v95 - 6);
          uint64_t v99 = *((void *)v95 - 5);
          BOOL v101 = __OFSUB__(v99, v100);
          uint64_t v93 = v99 - v100;
          char v94 = v101;
          if (v101) {
            goto LABEL_124;
          }
          unint64_t v102 = v24 - 2;
          uint64_t v103 = &v87[16 * v24 - 32];
          uint64_t v105 = *(void *)v103;
          uint64_t v104 = *((void *)v103 + 1);
          BOOL v101 = __OFSUB__(v104, v105);
          uint64_t v106 = v104 - v105;
          if (v101) {
            goto LABEL_126;
          }
          BOOL v101 = __OFADD__(v93, v106);
          uint64_t v107 = v93 + v106;
          if (v101) {
            goto LABEL_129;
          }
          if (v107 >= v98)
          {
            v125 = &v87[16 * v90];
            uint64_t v127 = *(void *)v125;
            uint64_t v126 = *((void *)v125 + 1);
            BOOL v101 = __OFSUB__(v126, v127);
            uint64_t v128 = v126 - v127;
            if (v101) {
              goto LABEL_133;
            }
            BOOL v118 = v93 < v128;
            goto LABEL_92;
          }
        }

        else
        {
          if (v24 != 3)
          {
            uint64_t v119 = *((void *)v22 + 4);
            uint64_t v120 = *((void *)v22 + 5);
            BOOL v101 = __OFSUB__(v120, v119);
            uint64_t v112 = v120 - v119;
            char v113 = v101;
            goto LABEL_86;
          }

          uint64_t v92 = *((void *)v22 + 4);
          uint64_t v91 = *((void *)v22 + 5);
          BOOL v101 = __OFSUB__(v91, v92);
          uint64_t v93 = v91 - v92;
          char v94 = v101;
        }

        if ((v94 & 1) != 0) {
          goto LABEL_125;
        }
        unint64_t v102 = v24 - 2;
        id v108 = &v87[16 * v24 - 32];
        uint64_t v110 = *(void *)v108;
        uint64_t v109 = *((void *)v108 + 1);
        BOOL v111 = __OFSUB__(v109, v110);
        uint64_t v112 = v109 - v110;
        char v113 = v111;
        if (v111) {
          goto LABEL_128;
        }
        unint64_t v114 = &v87[16 * v90];
        uint64_t v116 = *(void *)v114;
        uint64_t v115 = *((void *)v114 + 1);
        BOOL v101 = __OFSUB__(v115, v116);
        uint64_t v117 = v115 - v116;
        if (v101) {
          goto LABEL_131;
        }
        if (__OFADD__(v112, v117)) {
          goto LABEL_132;
        }
        if (v112 + v117 >= v93)
        {
          BOOL v118 = v93 < v117;
LABEL_92:
          if (v118) {
            unint64_t v90 = v102;
          }
          goto LABEL_94;
        }

LABEL_86:
        if ((v113 & 1) != 0) {
          goto LABEL_127;
        }
        uint64_t v121 = &v87[16 * v90];
        uint64_t v123 = *(void *)v121;
        uint64_t v122 = *((void *)v121 + 1);
        BOOL v101 = __OFSUB__(v122, v123);
        uint64_t v124 = v122 - v123;
        if (v101) {
          goto LABEL_130;
        }
        if (v124 < v112) {
          goto LABEL_14;
        }
LABEL_94:
        unint64_t v129 = v90 - 1;
        if (v90 - 1 >= v24)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
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
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }

        if (!*v155) {
          goto LABEL_145;
        }
        v130 = v22;
        v131 = &v87[16 * v129];
        uint64_t v132 = *(void *)v131;
        v133 = &v87[16 * v90];
        uint64_t v134 = *((void *)v133 + 1);
        sub_C740( *v155 + *(void *)(v156 + 72) * *(void *)v131,  *v155 + *(void *)(v156 + 72) * *(void *)v133,  *v155 + *(void *)(v156 + 72) * v134,  v154);
        if (v2)
        {
LABEL_115:
          v143 = v130;
          goto LABEL_117;
        }

        if (v134 < v132) {
          goto LABEL_120;
        }
        if (v90 > *((void *)v130 + 2)) {
          goto LABEL_121;
        }
        *(void *)v131 = v132;
        *(void *)&v87[16 * v129 + 8] = v134;
        unint64_t v135 = *((void *)v130 + 2);
        if (v90 >= v135) {
          goto LABEL_122;
        }
        unint64_t v22 = v130;
        unint64_t v24 = v135 - 1;
        memmove(&v87[16 * v90], v133 + 16, 16 * (v135 - 1 - v90));
        *((void *)v130 + 2) = v135 - 1;
        if (v135 <= 2) {
          goto LABEL_14;
        }
      }
    }

    unint64_t v24 = 1LL;
LABEL_14:
    a1 = v155;
    Swift::Int v16 = v155[1];
    Swift::Int v23 = v164;
    if (v164 >= v16) {
      goto LABEL_103;
    }
  }

  if (__OFADD__(v25, v148)) {
    goto LABEL_142;
  }
  if (v25 + v148 >= v16) {
    Swift::Int v63 = v16;
  }
  else {
    Swift::Int v63 = v25 + v148;
  }
  if (v63 >= v25)
  {
    if (v38 != v63)
    {
      uint64_t v146 = v2;
      uint64_t v64 = *(void *)(v156 + 72);
      uint64_t v65 = v64 * (v38 - 1);
      uint64_t v157 = v64;
      Swift::Int v66 = v38 * v64;
      Swift::Int v151 = v63;
      do
      {
        uint64_t v68 = 0LL;
        Swift::Int v164 = v38;
        uint64_t v158 = v66;
        Swift::Int v159 = v65;
        while (1)
        {
          uint64_t v167 = v25;
          uint64_t v69 = *a1;
          uint64_t v70 = v66 + v68 + *a1;
          unint64_t v71 = v160;
          sub_D91C(v70, (uint64_t)v160, &qword_399F0);
          uint64_t v72 = v65 + v68 + v69;
          uint64_t v73 = v161;
          sub_D91C(v72, (uint64_t)v161, &qword_399F0);
          uint64_t v74 = v165;
          uint64_t v75 = *(int *)(v165 + 48);
          uint64_t v76 = (uint64_t)v162 + v75;
          void *v162 = *v71;
          sub_CF7C((uint64_t)v71 + v75, v76);
          uint64_t v77 = type metadata accessor for PatternStoreValue(0LL);
          uint64_t v168 = *(void *)(v76 + *(int *)(v77 + 20));
          sub_D764(v76);
          uint64_t v78 = *(int *)(v74 + 48);
          uint64_t v79 = (uint64_t)v163 + v78;
          void *v163 = *v73;
          sub_CF7C((uint64_t)v73 + v78, v79);
          uint64_t v80 = *(void *)(v79 + *(int *)(v77 + 20));
          sub_D764(v79);
          sub_D97C((uint64_t)v73, &qword_399F0);
          sub_D97C((uint64_t)v71, &qword_399F0);
          if (v80 >= v168) {
            break;
          }
          uint64_t v81 = *a1;
          if (!*a1) {
            goto LABEL_144;
          }
          Swift::Int v66 = v158;
          uint64_t v65 = v159;
          uint64_t v82 = v81 + v158 + v68;
          uint64_t v83 = v81 + v159 + v68;
          sub_D9B8(v82, v166, &qword_399F0);
          swift_arrayInitWithTakeFrontToBack(v82, v83, 1LL, v165);
          sub_D9B8(v166, v83, &qword_399F0);
          v68 -= v157;
          uint64_t v25 = v167 + 1;
          Swift::Int v67 = v164;
          if (v164 == v167 + 1) {
            goto LABEL_48;
          }
        }

        Swift::Int v67 = v164;
        Swift::Int v66 = v158;
        uint64_t v65 = v159;
LABEL_48:
        Swift::Int v38 = v67 + 1;
        v65 += v157;
        v66 += v157;
        uint64_t v25 = v153;
      }

      while (v38 != v151);
      Swift::Int v38 = v151;
      uint64_t v2 = v146;
      unint64_t v22 = v149;
    }

    goto LABEL_55;
  }

LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_C454(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v43 = a1;
  uint64_t v53 = sub_5BC0(&qword_399F0);
  uint64_t v7 = __chkstk_darwin(v53);
  uint64_t v54 = (uint64_t)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v48 = (uint64_t *)((char *)&v41 - v10);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v47 = (uint64_t *)((char *)&v41 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v46 = (uint64_t *)((char *)&v41 - v14);
  uint64_t result = __chkstk_darwin(v13);
  uint64_t v45 = (uint64_t *)((char *)&v41 - v17);
  uint64_t v52 = a3;
  uint64_t v42 = a2;
  if (a3 != a2)
  {
    uint64_t v18 = *(void *)(v16 + 72);
    uint64_t v19 = v18 * (v52 - 1);
    uint64_t v49 = v18;
    uint64_t v20 = v18 * v52;
    uint64_t v21 = &qword_399F0;
    uint64_t v44 = a4;
LABEL_5:
    uint64_t v22 = 0LL;
    uint64_t v23 = v43;
    uint64_t v50 = v20;
    uint64_t v51 = v19;
    while (1)
    {
      unint64_t v24 = v21;
      uint64_t v25 = *a4;
      uint64_t v55 = v20 + v22;
      Swift::Int v26 = v45;
      sub_D91C(v20 + v22 + v25, (uint64_t)v45, v24);
      uint64_t v27 = v19 + v22 + v25;
      uint64_t v28 = v46;
      sub_D91C(v27, (uint64_t)v46, v24);
      uint64_t v29 = v53;
      uint64_t v30 = *(int *)(v53 + 48);
      uint64_t v31 = (uint64_t)v47 + v30;
      *uint64_t v47 = *v26;
      sub_CF7C((uint64_t)v26 + v30, v31);
      uint64_t v32 = type metadata accessor for PatternStoreValue(0LL);
      uint64_t v56 = *(void *)(v31 + *(int *)(v32 + 20));
      sub_D764(v31);
      uint64_t v33 = *(int *)(v29 + 48);
      uint64_t v20 = v50;
      uint64_t v34 = (uint64_t)v48 + v33;
      *uint64_t v48 = *v28;
      sub_CF7C((uint64_t)v28 + v33, v34);
      uint64_t v35 = *(void *)(v34 + *(int *)(v32 + 20));
      uint64_t v36 = v34;
      uint64_t v21 = v24;
      sub_D764(v36);
      uint64_t v37 = (uint64_t)v28;
      uint64_t v19 = v51;
      sub_D97C(v37, v24);
      uint64_t result = sub_D97C((uint64_t)v26, v24);
      a4 = v44;
      if (v35 >= v56)
      {
LABEL_4:
        v19 += v49;
        v20 += v49;
        if (++v52 == v42) {
          return result;
        }
        goto LABEL_5;
      }

      uint64_t v38 = *v44;
      if (!*v44) {
        break;
      }
      uint64_t v39 = v38 + v20 + v22;
      uint64_t v40 = v38 + v19 + v22;
      sub_D9B8(v39, v54, v24);
      swift_arrayInitWithTakeFrontToBack(v39, v40, 1LL, v53);
      uint64_t v21 = v24;
      uint64_t result = sub_D9B8(v54, v40, v24);
      v22 -= v49;
      if (v52 == ++v23) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_C740(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v68 = sub_5BC0(&qword_399F0);
  uint64_t v8 = __chkstk_darwin(v68);
  Swift::Int v67 = (uint64_t *)((char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v10 = __chkstk_darwin(v8);
  Swift::Int v66 = (uint64_t *)((char *)&v58 - v11);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v65 = (uint64_t *)((char *)&v58 - v13);
  __chkstk_darwin(v12);
  uint64_t v64 = (uint64_t *)((char *)&v58 - v14);
  uint64_t v16 = *(void *)(v15 + 72);
  if (!v16)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }

  if (a2 - a1 == 0x8000000000000000LL && v16 == -1) {
    goto LABEL_62;
  }
  int64_t v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000LL && v16 == -1) {
    goto LABEL_63;
  }
  uint64_t v18 = (uint64_t)(a2 - a1) / v16;
  unint64_t v71 = a1;
  unint64_t v70 = a4;
  uint64_t v19 = v17 / v16;
  if (v18 >= v17 / v16)
  {
    if ((v19 & 0x8000000000000000LL) == 0)
    {
      uint64_t v21 = v19 * v16;
      if (a4 < a2 || a2 + v21 <= a4)
      {
        uint64_t v22 = v68;
        swift_arrayInitWithTakeFrontToBack(a4, a2, v19, v68);
      }

      else
      {
        uint64_t v22 = v68;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront(a4);
        }
      }

      unint64_t v39 = a4 + v21;
      unint64_t v69 = a4 + v21;
      unint64_t v71 = a2;
      if (v21 >= 1 && a1 < a2)
      {
        uint64_t v41 = -v16;
        unint64_t v61 = a1;
        unint64_t v62 = a4;
        uint64_t v59 = v41;
        do
        {
          unint64_t v63 = a3 + v41;
          uint64_t v42 = v64;
          sub_D91C(v39 + v41, (uint64_t)v64, &qword_399F0);
          unint64_t v43 = a2 + v41;
          uint64_t v44 = v65;
          sub_D91C(a2 + v41, (uint64_t)v65, &qword_399F0);
          uint64_t v45 = *(int *)(v22 + 48);
          uint64_t v46 = (uint64_t)v66 + v45;
          *Swift::Int v66 = *v42;
          sub_CF7C((uint64_t)v42 + v45, v46);
          unint64_t v47 = a3;
          uint64_t v48 = type metadata accessor for PatternStoreValue(0LL);
          uint64_t v49 = *(void *)(v46 + *(int *)(v48 + 20));
          sub_D764(v46);
          uint64_t v50 = *(int *)(v22 + 48);
          uint64_t v51 = (uint64_t)v67 + v50;
          *Swift::Int v67 = *v44;
          sub_CF7C((uint64_t)v44 + v50, v51);
          uint64_t v52 = *(void *)(v51 + *(int *)(v48 + 20));
          sub_D764(v51);
          sub_D97C((uint64_t)v44, &qword_399F0);
          sub_D97C((uint64_t)v42, &qword_399F0);
          if (v52 >= v49)
          {
            unint64_t v55 = v69;
            unint64_t v56 = v69 + v59;
            v69 += v59;
            uint64_t v41 = v59;
            a3 = v63;
            if (v47 < v55 || v63 >= v55)
            {
              uint64_t v22 = v68;
              swift_arrayInitWithTakeFrontToBack(v63, v56, 1LL, v68);
              unint64_t v43 = a2;
              unint64_t v53 = v61;
              unint64_t v54 = v62;
            }

            else
            {
              uint64_t v22 = v68;
              unint64_t v53 = v61;
              unint64_t v54 = v62;
              if (v47 != v55) {
                swift_arrayInitWithTakeBackToFront(v63);
              }
              unint64_t v43 = a2;
            }
          }

          else
          {
            uint64_t v41 = v59;
            a3 = v63;
            if (v47 < a2 || v63 >= a2)
            {
              uint64_t v22 = v68;
              swift_arrayInitWithTakeFrontToBack(v63, v43, 1LL, v68);
              unint64_t v53 = v61;
              unint64_t v54 = v62;
            }

            else
            {
              uint64_t v22 = v68;
              unint64_t v53 = v61;
              unint64_t v54 = v62;
              if (v47 != a2) {
                swift_arrayInitWithTakeBackToFront(v63);
              }
            }

            v71 += v41;
          }

          unint64_t v39 = v69;
          if (v69 <= v54) {
            break;
          }
          a2 = v43;
        }

        while (v43 > v53);
      }

      goto LABEL_60;
    }
  }

  else if ((v18 & 0x8000000000000000LL) == 0)
  {
    uint64_t v20 = v18 * v16;
    if (a4 < a1 || a1 + v20 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1, v18, v68);
    }

    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4);
    }

    unint64_t v63 = a4 + v20;
    unint64_t v69 = a4 + v20;
    if (v20 >= 1 && a2 < a3)
    {
      unint64_t v60 = a3;
      uint64_t v24 = v68;
      do
      {
        uint64_t v25 = v16;
        Swift::Int v26 = v64;
        sub_D91C(a2, (uint64_t)v64, &qword_399F0);
        uint64_t v27 = v65;
        sub_D91C(a4, (uint64_t)v65, &qword_399F0);
        uint64_t v28 = *(int *)(v24 + 48);
        uint64_t v29 = (uint64_t)v66 + v28;
        *Swift::Int v66 = *v26;
        sub_CF7C((uint64_t)v26 + v28, v29);
        uint64_t v30 = type metadata accessor for PatternStoreValue(0LL);
        uint64_t v31 = *(void *)(v29 + *(int *)(v30 + 20));
        sub_D764(v29);
        uint64_t v32 = *(int *)(v24 + 48);
        uint64_t v33 = (uint64_t)v67 + v32;
        *Swift::Int v67 = *v27;
        sub_CF7C((uint64_t)v27 + v32, v33);
        uint64_t v34 = *(void *)(v33 + *(int *)(v30 + 20));
        sub_D764(v33);
        sub_D97C((uint64_t)v27, &qword_399F0);
        sub_D97C((uint64_t)v26, &qword_399F0);
        unint64_t v35 = v71;
        if (v34 >= v31)
        {
          uint64_t v16 = v25;
          unint64_t v38 = v70 + v25;
          if (v71 < v70 || v71 >= v38)
          {
            swift_arrayInitWithTakeFrontToBack(v71, v70, 1LL, v68);
            unint64_t v37 = v60;
          }

          else
          {
            unint64_t v37 = v60;
            if (v71 != v70) {
              swift_arrayInitWithTakeBackToFront(v71);
            }
          }

          unint64_t v70 = v38;
          unint64_t v36 = a2;
        }

        else
        {
          uint64_t v16 = v25;
          unint64_t v36 = a2 + v25;
          if (v71 < a2 || v71 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack(v71, a2, 1LL, v68);
            unint64_t v37 = v60;
          }

          else
          {
            unint64_t v37 = v60;
            if (v71 == a2) {
              unint64_t v35 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront(v71);
            }
          }
        }

        unint64_t v71 = v35 + v16;
        a4 = v70;
        if (v70 >= v63) {
          break;
        }
        a2 = v36;
      }

      while (v36 < v37);
    }

LABEL_60:
    sub_18B88(&v71, &v70, (uint64_t *)&v69);
    return 1LL;
  }

  unint64_t v55 = *v61;
  *(void *)(*v61 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  unint64_t v56 = (void *)(*(void *)(v55 + 48) + 16 * a3);
  *unint64_t v56 = v62;
  v56[1] = a2;
  uint64_t v57 = *(void *)(v55 + 16);
  uint64_t v58 = __OFADD__(v57, 1LL);
  uint64_t v59 = v57 + 1;
  if (v58)
  {
LABEL_63:
    __break(1u);
LABEL_64:
    uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for EntityPair);
    __break(1u);
  }

  else
  {
    *(void *)(v55 + 16) = v59;
  }

  return result;
}

LABEL_64:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_CD44(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_A7D8(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }

  else
  {
    char v14 = v9;
    uint64_t v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      uint64_t v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        uint64_t v17 = v16[7];
        uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for PatternStoreValue(0LL) - 8) + 72LL) * v10;
        return sub_CF38(a1, v18);
      }

      goto LABEL_11;
    }

    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_B618();
      goto LABEL_7;
    }

    sub_AA1C(v13, a3 & 1);
    unint64_t v20 = sub_A7D8(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      uint64_t v16 = *v4;
      if ((v14 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_AE7C(v10, a2, a1, v16);
      return swift_bridgeObjectRetain(a2);
    }
  }

  uint64_t v22 = sub_5BC0(&qword_399D0);
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v22);
  __break(1u);
  return result;
}

uint64_t sub_CE6C(uint64_t result, unint64_t a2)
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

uint64_t sub_CEB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_CEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PatternStoreValue(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_CF38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PatternStoreValue(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_CF7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PatternStoreValue(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_CFC0(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0) {
      uint64_t v16 = a2;
    }
    else {
      uint64_t v16 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    Swift::UInt v17 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a2);
    Hasher._combine(_:)(v17);
    swift_bridgeObjectRetain(a2);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a2);
    if (v4)
    {
LABEL_3:
      if (v4 >= 1)
      {
        if ((a2 & 0xC000000000000001LL) != 0)
        {
          if (sub_2785C(a2))
          {
            uint64_t v5 = (void *)(a2 + 32);
            uint64_t v6 = *(void *)(a2 + 32);
            uint64_t v7 = *(void *)(*v5 + 24LL);
            uint64_t v8 = *(void *)(*v5 + 32LL);
            swift_retain(*v5);
            swift_bridgeObjectRetain(v8);
            String.hash(into:)(a1, v7, v8);
            swift_bridgeObjectRelease(v8);
            Hasher._combine(_:)(*(unsigned __int8 *)(v6 + 40));
            __asm { BR              X9 }
          }

          uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
          uint64_t v14 = *(void *)(v13 + 24);
          uint64_t v15 = *(void *)(v13 + 32);
          swift_bridgeObjectRetain(v15);
          String.hash(into:)(a1, v14, v15);
          swift_bridgeObjectRelease(v15);
          Hasher._combine(_:)(*(unsigned __int8 *)(v13 + 40));
          __asm { BR              X9 }
        }

        char v9 = (void *)(a2 + 32);
        uint64_t v10 = *(void *)(a2 + 32);
        uint64_t v11 = *(void *)(*v9 + 24LL);
        uint64_t v12 = *(void *)(*v9 + 32LL);
        swift_retain(*v9);
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(a1, v11, v12);
        swift_bridgeObjectRelease(v12);
        Hasher._combine(_:)(*(unsigned __int8 *)(v10 + 40));
        __asm { BR              X9 }
      }

      __break(1u);
      JUMPOUT(0xD644LL);
    }
  }

  else
  {
    Hasher._combine(_:)(*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8LL)));
    uint64_t v4 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8LL));
    if (v4) {
      goto LABEL_3;
    }
  }

uint64_t sub_D6EC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_D710(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_D72C(void *a1)
{
  return sub_8CA0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_D734(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_D744(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_D74C()
{
  return sub_914C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_D764(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PatternStoreValue(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_D7A0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = sub_CEB0(&qword_399D0);
    sub_D81C(a2, a3);
    uint64_t result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_D81C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for PatternItem();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_D85C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

uint64_t sub_D8E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

BOOL sub_D914(void *a1)
{
  return sub_8394(a1, *(void *)(v1 + 16));
}

uint64_t sub_D91C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5BC0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

void sub_D960()
{
}

uint64_t sub_D97C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5BC0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_D9B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5BC0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

id sub_DA04()
{
  return sub_D74C();
}

id static RECTIFISelfPatternStore.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

void *sub_DA80()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_DA8C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for RECTIFISelfPatternStore();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

BOOL sub_DACC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t)&_swiftEmptySetSingleton;
  unint64_t v39 = &_swiftEmptySetSingleton;
  swift_beginAccess(a2, v38, 0LL, 0LL);
  uint64_t v7 = *a2;
  uint64_t v32 = *(void *)(*a2 + 16);
  if (v32)
  {
    uint64_t v33 = v7 + 32;
    uint64_t v8 = a3 + 32;
    uint64_t v9 = swift_bridgeObjectRetain(v7);
    unint64_t v10 = 0LL;
    uint64_t v31 = v9;
    while (1)
    {
      if (v10 >= *(void *)(v9 + 16)) {
        goto LABEL_40;
      }
      uint64_t v14 = (unint64_t *)(v33 + 16 * v10);
      unint64_t v16 = *v14;
      unint64_t v15 = v14[1];
      unint64_t v37 = &_swiftEmptySetSingleton;
      uint64_t v17 = v15 - 1;
      if (__OFSUB__(v15, 1LL))
      {
LABEL_41:
        __break(1u);
        JUMPOUT(0xE110LL);
      }

      char v18 = 0;
      unint64_t v34 = v10 + 1;
      unint64_t v35 = v10;
      while (1)
      {
        unint64_t v19 = v17;
        if (v17 > 0)
        {
          --v17;
          if ((v16 & 0x8000000000000000LL) != 0) {
            goto LABEL_37;
          }
          goto LABEL_14;
        }

        if ((v17 != 0) | v18 & 1) {
          break;
        }
        uint64_t v17 = 0LL;
        char v18 = 1;
        if ((v16 & 0x8000000000000000LL) != 0)
        {
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }

LABEL_14:
        if (v16 >= *(void *)(a3 + 16)) {
          goto LABEL_38;
        }
        uint64_t v20 = *(void *)(v8 + 8 * v16);
        if ((v20 & 0xC000000000000001LL) != 0)
        {
          swift_bridgeObjectRetain(*(void *)(v8 + 8 * v16));
          uint64_t v21 = specialized _ArrayBuffer._getElementSlowPath(_:)(v19, v20);
          swift_bridgeObjectRelease(v20);
          if (!a1) {
            goto LABEL_8;
          }
LABEL_18:
          uint64_t v22 = *(void *)(v21 + 24);
          uint64_t v23 = *(void *)(v21 + 32);
          uint64_t v24 = *(void *)(a1 + 24);
          uint64_t v25 = *(void *)(a1 + 32);
          BOOL v26 = v22 == v24 && v23 == v25;
          if ((v26 || (_stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, v24, v25, 0LL) & 1) != 0)
            && *(unsigned __int8 *)(v21 + 40) == *(unsigned __int8 *)(a1 + 40))
          {
            __asm { BR              X10 }
          }

          goto LABEL_8;
        }

        uint64_t v21 = *(void *)(v20 + 8 * v19 + 32);
        swift_retain(v21);
        if (a1) {
          goto LABEL_18;
        }
LABEL_8:
        sub_28CB4(v36, v21);
        swift_release(v36[0]);
      }

      uint64_t v27 = v37;
      if (v35)
      {
        uint64_t v11 = (uint64_t)v39;
        uint64_t v12 = swift_bridgeObjectRetain(v37);
        uint64_t v13 = sub_E5EC(v12, v11);
        swift_bridgeObjectRelease_n(v27, 2LL);
        unint64_t v39 = v13;
      }

      else
      {
        sub_E184((uint64_t)v37);
      }

      uint64_t v9 = v31;
      unint64_t v10 = v34;
      if (v34 == v32)
      {
        swift_bridgeObjectRelease(v31);
        uint64_t v6 = (uint64_t)v39;
        break;
      }
    }
  }

  if ((v6 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v28 = v6;
    }
    else {
      uint64_t v28 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v29 = __CocoaSet.count.getter(v28);
  }

  else
  {
    uint64_t v29 = *(void *)(v6 + 16);
  }

  swift_bridgeObjectRelease(v6);
  return v29 != 0;
}

uint64_t sub_E184(uint64_t result)
{
  uint64_t v1 = result;
  if ((result & 0xC000000000000001LL) != 0)
  {
    if (result >= 0) {
      result &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t v2 = __CocoaSet.makeIterator()(result);
    uint64_t v3 = type metadata accessor for PatternItem();
    unint64_t v4 = sub_10A54();
    uint64_t result = (uint64_t)Set.Iterator.init(_cocoa:)(v26, v2, v3, v4);
    uint64_t v1 = v26[0];
    uint64_t v23 = v26[1];
    uint64_t v5 = v26[2];
    uint64_t v6 = v26[3];
    unint64_t v7 = v26[4];
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = -1LL << *(_BYTE *)(result + 32);
    uint64_t v23 = result + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v7 = v10 & *(void *)(result + 56);
  }

  int64_t v11 = (unint64_t)(v5 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_12;
  }
  while (1)
  {
    if (v7)
    {
      uint64_t v12 = (v7 - 1) & v7;
      unint64_t v13 = __clz(__rbit64(v7)) | (v6 << 6);
      uint64_t v14 = v6;
      goto LABEL_31;
    }

    int64_t v20 = v6 + 1;
    if (__OFADD__(v6, 1LL)) {
      break;
    }
    if (v20 >= v11) {
      return sub_10A9C(v1);
    }
    unint64_t v21 = *(void *)(v23 + 8 * v20);
    uint64_t v14 = v6 + 1;
    if (!v21)
    {
      uint64_t v14 = v6 + 2;
      if (v6 + 2 >= v11) {
        return sub_10A9C(v1);
      }
      unint64_t v21 = *(void *)(v23 + 8 * v14);
      if (!v21)
      {
        uint64_t v14 = v6 + 3;
        if (v6 + 3 >= v11) {
          return sub_10A9C(v1);
        }
        unint64_t v21 = *(void *)(v23 + 8 * v14);
        if (!v21)
        {
          uint64_t v14 = v6 + 4;
          if (v6 + 4 >= v11) {
            return sub_10A9C(v1);
          }
          unint64_t v21 = *(void *)(v23 + 8 * v14);
          if (!v21)
          {
            uint64_t v14 = v6 + 5;
            if (v6 + 5 >= v11) {
              return sub_10A9C(v1);
            }
            unint64_t v21 = *(void *)(v23 + 8 * v14);
            if (!v21)
            {
              uint64_t v22 = v6 + 6;
              while (v11 != v22)
              {
                unint64_t v21 = *(void *)(v23 + 8 * v22++);
                if (v21)
                {
                  uint64_t v14 = v22 - 1;
                  goto LABEL_30;
                }
              }

              return sub_10A9C(v1);
            }
          }
        }
      }
    }

uint64_t sub_E3FC()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ClosedPatternUtil()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin17ClosedPatternUtil);
}

void *sub_E430()
{
  uint64_t v1 = (void *)*v0;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native(*v0);
  *uint64_t v0 = v1;
  if (!(_DWORD)result)
  {
    uint64_t result = sub_2BA34(v1);
    *uint64_t v0 = result;
  }

  return result;
}

void *sub_E46C(uint64_t isStackAllocationSafe, uint64_t a2)
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
    uint64_t v9 = sub_ED4C((unint64_t *)((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v7, v3, a2);
    swift_release(a2);
  }

  else
  {
    uint64_t v10 = (void *)swift_slowAlloc(v8, -1LL);
    bzero(v10, v8);
    uint64_t v9 = sub_ED4C((unint64_t *)v10, v7, v3, a2);
    swift_release(a2);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return v9;
}

void *sub_E5EC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1 & 0xC000000000000001LL;
  if ((a2 & 0xC000000000000001LL) != 0)
  {
    if (v3)
    {
      if (a2 < 0) {
        uint64_t v4 = a2;
      }
      else {
        uint64_t v4 = a2 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v5 = __CocoaSet.count.getter(v4);
      a2 = (uint64_t)sub_2986C(v4, v5);
      return sub_E46C(a1, a2);
    }

    uint64_t v7 = &_swiftEmptySetSingleton;
    uint64_t v19 = &_swiftEmptySetSingleton;
    if (a2 < 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v16 = __CocoaSet.makeIterator()(v8);
    uint64_t v9 = __CocoaSet.Iterator.next()(v16);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v15 = type metadata accessor for PatternItem();
      do
      {
        v17[0] = v10;
        swift_dynamicCast(&v18, v17, (char *)&type metadata for Swift.AnyObject + 8, v15, 7LL);
        if (*(void *)(a1 + 16))
        {
          uint64_t v12 = v18;
          Hasher.init(_seed:)(v17, *(void *)(a1 + 40));
          uint64_t v13 = *(void *)(v12 + 24);
          uint64_t v14 = *(void *)(v12 + 32);
          swift_bridgeObjectRetain(v14);
          String.hash(into:)(v17, v13, v14);
          swift_bridgeObjectRelease(v14);
          Hasher._combine(_:)(*(unsigned __int8 *)(v12 + 40));
          __asm { BR              X9 }
        }

        uint64_t v11 = swift_release(v18);
        uint64_t v10 = __CocoaSet.Iterator.next()(v11);
      }

      while (v10);
      uint64_t v7 = v19;
    }

    swift_release(v16);
    return v7;
  }

  else
  {
    if (v3) {
      return sub_E46C(a1, a2);
    }
    return sub_F6F0(a1, a2);
  }

void *sub_ED4C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    if (a3 < 0) {
      uint64_t v6 = a3;
    }
    else {
      uint64_t v6 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = __CocoaSet.makeIterator()(v6);
    uint64_t v8 = type metadata accessor for PatternItem();
    unint64_t v9 = sub_10A54();
    uint64_t v10 = Set.Iterator.init(_cocoa:)(v35, v7, v8, v9);
    uint64_t v5 = v35[0];
    uint64_t v33 = v35[1];
    uint64_t v12 = v35[2];
    uint64_t v11 = v35[3];
    unint64_t v13 = v35[4];
  }

  else
  {
    uint64_t v14 = -1LL << *(_BYTE *)(a3 + 32);
    uint64_t v33 = a3 + 56;
    uint64_t v12 = ~v14;
    uint64_t v15 = -v14;
    if (v15 < 64) {
      uint64_t v16 = ~(-1LL << v15);
    }
    else {
      uint64_t v16 = -1LL;
    }
    unint64_t v13 = v16 & *(void *)(a3 + 56);
    uint64_t v10 = (void *)swift_bridgeObjectRetain(a3);
    uint64_t v11 = 0LL;
  }

  int64_t v32 = (unint64_t)(v12 + 64) >> 6;
  if (v5 < 0)
  {
    uint64_t v18 = __CocoaSet.Iterator.next()(v10);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v36 = v18;
      uint64_t v20 = type metadata accessor for PatternItem();
      swift_unknownObjectRetain(v19, v21);
      swift_dynamicCast(v34, &v36, (char *)&type metadata for Swift.AnyObject + 8, v20, 7LL);
      uint64_t v22 = v34[0];
      swift_unknownObjectRelease(v19);
      if (v22)
      {
LABEL_28:
        Hasher.init(_seed:)(v34, *(void *)(a4 + 40));
        uint64_t v27 = *(void *)(v22 + 24);
        uint64_t v26 = *(void *)(v22 + 32);
        swift_bridgeObjectRetain(v26);
        String.hash(into:)(v34, v27, v26);
        swift_bridgeObjectRelease(v26);
        Hasher._combine(_:)(*(unsigned __int8 *)(v22 + 40));
        __asm { BR              X9 }
      }
    }
  }

  else
  {
    if (v13)
    {
      unint64_t v17 = __clz(__rbit64(v13)) | (v11 << 6);
    }

    else
    {
      int64_t v23 = v11 + 1;
      if (__OFADD__(v11, 1LL))
      {
        __break(1u);
        JUMPOUT(0xF648LL);
      }

      if (v23 >= v32) {
        goto LABEL_35;
      }
      unint64_t v24 = *(void *)(v33 + 8 * v23);
      if (!v24)
      {
        int64_t v25 = v11 + 2;
        if (v11 + 2 >= v32) {
          goto LABEL_35;
        }
        unint64_t v24 = *(void *)(v33 + 8 * v25);
        if (v24) {
          goto LABEL_25;
        }
        int64_t v25 = v11 + 3;
        if (v11 + 3 >= v32) {
          goto LABEL_35;
        }
        unint64_t v24 = *(void *)(v33 + 8 * v25);
        if (v24) {
          goto LABEL_25;
        }
        int64_t v25 = v11 + 4;
        if (v11 + 4 >= v32) {
          goto LABEL_35;
        }
        unint64_t v24 = *(void *)(v33 + 8 * v25);
        if (v24)
        {
LABEL_25:
          int64_t v23 = v25;
        }

        else
        {
          int64_t v23 = v11 + 5;
          if (v11 + 5 >= v32) {
            goto LABEL_35;
          }
          unint64_t v24 = *(void *)(v33 + 8 * v23);
          if (!v24)
          {
            uint64_t v28 = v11 + 6;
            do
            {
              if (v32 == v28) {
                goto LABEL_35;
              }
              unint64_t v24 = *(void *)(v33 + 8 * v28++);
            }

            while (!v24);
            int64_t v23 = v28 - 1;
          }
        }
      }

      unint64_t v17 = __clz(__rbit64(v24)) + (v23 << 6);
    }

    uint64_t v22 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    swift_retain(v22);
    if (v22) {
      goto LABEL_28;
    }
  }

LABEL_35:
  sub_10A9C(v5);
  swift_retain(a4);
  return sub_18E60(a1, a2, 0LL, a4);
}

void *sub_F6F0(uint64_t isStackAllocationSafe, uint64_t a2)
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
    unint64_t v9 = sub_F870((unint64_t *)((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v7, a2, v3);
    swift_release(a2);
  }

  else
  {
    uint64_t v10 = (void *)swift_slowAlloc(v8, -1LL);
    bzero(v10, v8);
    unint64_t v9 = sub_F870((unint64_t *)v10, v7, a2, v3);
    swift_release(a2);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return v9;
}

void *sub_F870(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void *)(a4 + 16);
  v30[10] = a3;
  if (v6 >= v5)
  {
    uint64_t v17 = 1LL << *(_BYTE *)(a3 + 32);
    if (v17 < 64) {
      uint64_t v18 = ~(-1LL << v17);
    }
    else {
      uint64_t v18 = -1LL;
    }
    unint64_t v19 = v18 & *(void *)(a3 + 56);
    if (v19)
    {
      unint64_t v20 = __clz(__rbit64(v19));
    }

    else
    {
      int64_t v21 = 1LL;
      unint64_t v22 = *(void *)(a3 + 64);
      if (!v22)
      {
        uint64_t v23 = 2LL;
        unint64_t v22 = *(void *)(a3 + 72);
        if (!v22)
        {
          uint64_t v23 = 3LL;
          unint64_t v22 = *(void *)(a3 + 80);
          if (!v22)
          {
            uint64_t v23 = 4LL;
            unint64_t v22 = *(void *)(a3 + 88);
            if (!v22)
            {
              while (1)
              {
                int64_t v21 = v23 + 1;
                if (__OFADD__(v23, 1LL)) {
                  goto LABEL_44;
                }
                unint64_t v22 = *(void *)(a3 + 56 + 8 * v21);
                ++v23;
                if (v22) {
                  goto LABEL_36;
                }
              }
            }
          }
        }

        int64_t v21 = v23;
      }

LABEL_36:
      unint64_t v20 = __clz(__rbit64(v22)) + (v21 << 6);
    }

    uint64_t v24 = *(void *)(*(void *)(a3 + 48) + 8 * v20);
    Hasher.init(_seed:)(v30, *(void *)(a4 + 40));
    uint64_t v26 = *(void *)(v24 + 24);
    uint64_t v25 = *(void *)(v24 + 32);
    swift_retain(v24);
    swift_bridgeObjectRetain(v25);
    String.hash(into:)(v30, v26, v25);
    swift_bridgeObjectRelease(v25);
    Hasher._combine(_:)(*(unsigned __int8 *)(v24 + 40));
    __asm { BR              X9 }
  }

  uint64_t v7 = *(void *)(a4 + 56);
  uint64_t v8 = 1LL << *(_BYTE *)(a4 + 32);
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  if ((v9 & v7) != 0)
  {
    unint64_t v10 = __clz(__rbit64(v9 & v7));
    goto LABEL_17;
  }

  int64_t v11 = 1LL;
  if ((unint64_t)(v8 + 63) >> 6 > 1)
  {
    unint64_t v12 = *(void *)(a4 + 64);
    if (v12)
    {
LABEL_16:
      unint64_t v10 = __clz(__rbit64(v12)) + (v11 << 6);
LABEL_17:
      uint64_t v14 = *(void *)(*(void *)(a4 + 48) + 8 * v10);
      Hasher.init(_seed:)(v30, *(void *)(a3 + 40));
      uint64_t v16 = *(void *)(v14 + 24);
      uint64_t v15 = *(void *)(v14 + 32);
      swift_retain(v14);
      swift_bridgeObjectRetain(v15);
      String.hash(into:)(v30, v16, v15);
      swift_bridgeObjectRelease(v15);
      Hasher._combine(_:)(*(unsigned __int8 *)(v14 + 40));
      __asm { BR              X9 }
    }

    uint64_t v13 = 2LL;
    if ((unint64_t)(v8 + 63) >> 6 > 2)
    {
      unint64_t v12 = *(void *)(a4 + 72);
      if (v12) {
        goto LABEL_15;
      }
      uint64_t v13 = 3LL;
      unint64_t v12 = *(void *)(a4 + 80);
      if (v12)
      {
LABEL_15:
        int64_t v11 = v13;
        goto LABEL_16;
      }

      uint64_t v13 = 4LL;
      if ((unint64_t)(v8 + 63) >> 6 > 4)
      {
        unint64_t v12 = *(void *)(a4 + 88);
        if (v12) {
          goto LABEL_15;
        }
        while (1)
        {
          int64_t v11 = v13 + 1;
          if (__OFADD__(v13, 1LL)) {
            break;
          }
          unint64_t v12 = *(void *)(a4 + 56 + 8 * v11);
          ++v13;
          if (v12) {
            goto LABEL_16;
          }
        }

        __break(1u);
LABEL_44:
        __break(1u);
        JUMPOUT(0x107C0LL);
      }
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10910(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v15 = a3;
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4) {
    int64_t v5 = v4 - 1;
  }
  else {
    int64_t v5 = 0LL;
  }
  if (v4 < 2)
  {
    swift_bridgeObjectRetain(a3);
    uint64_t v6 = 0LL;
LABEL_16:
    swift_bridgeObjectRelease(v3);
    return v6;
  }

  if (v5 - 1 < v4)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)(a2 + 8 * (v5 - 1) + 32);
    swift_retain(v9);
    swift_bridgeObjectRetain(v3);
    swift_bridgeObjectRetain(a2);
    BOOL v10 = sub_DACC(v9, &v15, v8);
    uint64_t result = swift_release(v9);
    if (v10)
    {
LABEL_13:
      swift_bridgeObjectRelease(a2);
      uint64_t v6 = 1LL;
LABEL_15:
      uint64_t v3 = v15;
      goto LABEL_16;
    }

    unint64_t v11 = v4 + 1;
    while (1)
    {
      if (v11 == 3)
      {
        swift_bridgeObjectRelease(a2);
        uint64_t v6 = 0LL;
        goto LABEL_15;
      }

      uint64_t v12 = *(void *)(a2 + 8 * v11);
      uint64_t v13 = swift_retain(v12);
      BOOL v14 = sub_DACC(v13, &v15, v8);
      uint64_t result = swift_release(v12);
      --v11;
      if (v14) {
        goto LABEL_13;
      }
    }

    __break(1u);
LABEL_18:
    __break(1u);
  }

  __break(1u);
  return result;
}

unint64_t sub_10A54()
{
  unint64_t result = qword_39AD0;
  if (!qword_39AD0)
  {
    uint64_t v1 = type metadata accessor for PatternItem();
    unint64_t result = swift_getWitnessTable(&unk_2E300, v1);
    atomic_store(result, (unint64_t *)&qword_39AD0);
  }

  return result;
}

uint64_t sub_10A9C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

id RECTIFIInfrequentPatternStore.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id RECTIFISelfPatternStore.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for RECTIFISelfPatternStore();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for RECTIFISelfPatternStore()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin23RECTIFISelfPatternStore);
}

id RECTIFISelfPatternStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RECTIFISelfPatternStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10BFC(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v4 = -1LL;
  if (v3 < 64) {
    uint64_t v4 = ~(-1LL << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v8 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }

    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v15 >= v6) {
      return swift_release(a1);
    }
    unint64_t v16 = *(void *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      int64_t v8 = v15 + 1;
      if (v15 + 1 >= v6) {
        return swift_release(a1);
      }
      unint64_t v16 = *(void *)(v2 + 8 * v8);
      if (!v16)
      {
        int64_t v8 = v15 + 2;
        if (v15 + 2 >= v6) {
          return swift_release(a1);
        }
        unint64_t v16 = *(void *)(v2 + 8 * v8);
        if (!v16)
        {
          int64_t v8 = v15 + 3;
          if (v15 + 3 >= v6) {
            return swift_release(a1);
          }
          unint64_t v16 = *(void *)(v2 + 8 * v8);
          if (!v16) {
            break;
          }
        }
      }
    }

void sub_10D94(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  double v4 = Date.timeIntervalSince1970.getter(a1);
  if ((~*(void *)&v4 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v4 < 9.22337204e18)
  {
    uint64_t v5 = (uint64_t)v4;
    uint64_t v6 = type metadata accessor for SequenceItem();
    uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
    *(void *)(v7 + 48) = 0LL;
    *(void *)(v7 + 56) = 0LL;
    *(void *)(v7 + 64) = v3;
    *(void *)(v7 + 16) = v5;
    *(void *)(v7 + 24) = 0LL;
    *(void *)(v7 + 32) = 0xE000000000000000LL;
    *(_WORD *)(v7 + 40) = 0;
    *a2 = v7;
    swift_bridgeObjectRetain(v3);
    return;
  }

uint64_t type metadata accessor for ItemSequenceHelper.AsrFeatureProcessing()
{
  return objc_opt_self(&OBJC_CLASS____TtCO42SiriPrivateLearningPatternExtractionPlugin18ItemSequenceHelper20AsrFeatureProcessing);
}

uint64_t type metadata accessor for ItemSequenceHelper.NlxFeatureProcessing()
{
  return objc_opt_self(&OBJC_CLASS____TtCO42SiriPrivateLearningPatternExtractionPlugin18ItemSequenceHelper20NlxFeatureProcessing);
}

void sub_10E88(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  double v4 = Date.timeIntervalSince1970.getter(a1);
  if ((~*(void *)&v4 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v4 < 9.22337204e18)
  {
    uint64_t v5 = (uint64_t)v4;
    swift_bridgeObjectRetain(v3);
    uint64_t v6 = sub_5BC0(&qword_39EC0);
    unint64_t v7 = sub_11FE4();
    uint64_t v8 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v6, v7);
    uint64_t v10 = v9;
    swift_bridgeObjectRelease(v3);
    uint64_t v11 = type metadata accessor for SequenceItem();
    uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
    *(void *)(v12 + 48) = 0LL;
    *(void *)(v12 + 56) = 0LL;
    *(void *)(v12 + 64) = _swiftEmptyArrayStorage;
    *(void *)(v12 + 16) = v5;
    *(void *)(v12 + 24) = v8;
    *(void *)(v12 + 32) = v10;
    *(_WORD *)(v12 + 40) = 512;
    *a2 = v12;
    return;
  }

uint64_t type metadata accessor for ItemSequenceHelper.UeiFeatureProcessing()
{
  return objc_opt_self(&OBJC_CLASS____TtCO42SiriPrivateLearningPatternExtractionPlugin18ItemSequenceHelper20UeiFeatureProcessing);
}

uint64_t type metadata accessor for ItemSequenceHelper.PhoneCallFeatureProcessing()
{
  return objc_opt_self(&OBJC_CLASS____TtCO42SiriPrivateLearningPatternExtractionPlugin18ItemSequenceHelper26PhoneCallFeatureProcessing);
}

uint64_t type metadata accessor for ItemSequenceHelper.SmsFeatureProcessing()
{
  return objc_opt_self(&OBJC_CLASS____TtCO42SiriPrivateLearningPatternExtractionPlugin18ItemSequenceHelper20SmsFeatureProcessing);
}

uint64_t sub_10FF4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0LL;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v33 = a2 + 56;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1LL << -(char)v5);
  }
  else {
    uint64_t v6 = -1LL;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v32 = (unint64_t)(63 - v5) >> 6;
  uint64_t v34 = a1 + 56;
  uint64_t result = swift_bridgeObjectRetain(a2);
  for (int64_t i = 0LL; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      if (!*(void *)(v4 + 16)) {
        goto LABEL_40;
      }
      goto LABEL_25;
    }

    int64_t v13 = i + 1;
    if (__OFADD__(i, 1LL))
    {
      __break(1u);
      goto LABEL_45;
    }

    if (v13 >= v32) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v33 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v32) {
        goto LABEL_41;
      }
      unint64_t v14 = *(void *)(v33 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v32) {
          goto LABEL_41;
        }
        unint64_t v14 = *(void *)(v33 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }

LABEL_39:
      swift_bridgeObjectRelease(v18);
      uint64_t v2 = 0LL;
      uint64_t v3 = v16;
LABEL_42:
      sub_10A9C(v3);
      return v2;
    }

LABEL_45:
  __break(1u);
  return result;
}

      uint64_t v9 = v21;
    }

uint64_t type metadata accessor for ItemSequenceHelper.CommonEventFeatureProcessing()
{
  return objc_opt_self(&OBJC_CLASS____TtCO42SiriPrivateLearningPatternExtractionPlugin18ItemSequenceHelper28CommonEventFeatureProcessing);
}

void sub_11304(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 24 * v1 + 8);
    uint64_t v3 = sub_5BC0(&qword_39ED0);
    uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
    *(_OWORD *)(v4 + 16) = xmmword_2DC10;
    uint64_t v5 = swift_bridgeObjectRetain(v2);
    double v6 = Date.timeIntervalSince1970.getter(v5);
    if ((~*(void *)&v6 & 0x7FF0000000000000LL) != 0)
    {
      if (v6 > -9.22337204e18)
      {
        if (v6 < 9.22337204e18)
        {
          uint64_t v7 = (uint64_t)v6;
          uint64_t v8 = sub_5BC0(&qword_39EC0);
          unint64_t v9 = sub_11FE4();
          uint64_t v10 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v8, v9);
          uint64_t v12 = v11;
          swift_bridgeObjectRelease(v2);
          uint64_t v13 = type metadata accessor for SequenceItem();
          uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
          *(void *)(v14 + 48) = 0LL;
          *(void *)(v14 + 56) = 0LL;
          *(void *)(v14 + 64) = _swiftEmptyArrayStorage;
          *(void *)(v14 + 16) = v7;
          *(void *)(v14 + 24) = v10;
          *(void *)(v14 + 32) = v12;
          *(_WORD *)(v14 + 40) = 256;
          *(void *)(v4 + 32) = v14;
          specialized Array._endMutation()();
          return;
        }

LABEL_9:
        __break(1u);
        return;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    goto LABEL_9;
  }

uint64_t sub_11450(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = a2;
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = &_swiftEmptySetSingleton;
  unint64_t v55 = &_swiftEmptySetSingleton;
  uint64_t v8 = _swiftEmptyArrayStorage;
  unint64_t v54 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v51 = *(void *)(a1 + 16);
  if (!v51)
  {
LABEL_40:
    swift_bridgeObjectRelease(v7);
    return (uint64_t)v8;
  }

  uint64_t v49 = a1 + 32;
  uint64_t v43 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v9 = 0LL;
  uint64_t v46 = v3;
  unint64_t v47 = 0x800000000002F200LL;
  uint64_t v45 = v4;
  while (1)
  {
    uint64_t v10 = (double *)(v49 + 24 * v9);
    uint64_t v11 = *(void *)v10;
    if (!*(void *)(*(void *)v10 + 16LL)) {
      goto LABEL_4;
    }
    uint64_t v12 = v6;
    double v13 = v10[1];
    int v50 = *((unsigned __int8 *)v10 + 16);
    int v14 = *((unsigned __int8 *)v10 + 17);
    uint64_t v16 = *(void *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 40);
    int64_t v17 = v55;
    if (!v55[2])
    {
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v15);
LABEL_23:
      double v6 = v12;
      goto LABEL_24;
    }

    Hasher.init(_seed:)(&v52, v55[5]);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v17);
    String.hash(into:)(&v52, v16, v15);
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1LL << *((_BYTE *)v17 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)((char *)v17 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v20) & 1) == 0)
    {
      swift_bridgeObjectRelease(v17);
      uint64_t v4 = v45;
      uint64_t v3 = v46;
      goto LABEL_23;
    }

    int v44 = v14;
    uint64_t v21 = v17[6];
    uint64_t v22 = (void *)(v21 + 16 * v20);
    uint64_t v23 = v22[1];
    BOOL v24 = *v22 == v16 && v23 == v15;
    if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v22, v23, v16, v15, 0LL) & 1) != 0)
    {
LABEL_3:
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v17);
      uint64_t v4 = v45;
      uint64_t v3 = v46;
      double v6 = v12;
      swift_bridgeObjectRelease(v11);
      goto LABEL_4;
    }

    uint64_t v25 = ~v19;
    while (1)
    {
      unint64_t v20 = (v20 + 1) & v25;
      uint64_t v26 = (void *)(v21 + 16 * v20);
      uint64_t v27 = v26[1];
      BOOL v28 = *v26 == v16 && v27 == v15;
      if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v26, v27, v16, v15, 0LL) & 1) != 0) {
        goto LABEL_3;
      }
    }

    swift_bridgeObjectRelease(v17);
    uint64_t v4 = v45;
    uint64_t v3 = v46;
    double v6 = v12;
    int v14 = v44;
LABEL_24:
    int v29 = v50;
    sub_293A4(&v52, v16, v15);
    swift_bridgeObjectRelease(v53);
    uint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v48, v3);
    if (v29) {
      double v13 = Date.timeIntervalSince1970.getter(v30);
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if ((~*(void *)&v13 & 0x7FF0000000000000LL) == 0) {
      break;
    }
    if (v13 <= -9.22337204e18) {
      goto LABEL_42;
    }
    if (v13 >= 9.22337204e18) {
      goto LABEL_43;
    }
    uint64_t v52 = 0LL;
    unint64_t v53 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(21LL);
    swift_bridgeObjectRelease(v53);
    uint64_t v52 = 0xD000000000000013LL;
    unint64_t v53 = v47;
    if (v14) {
      uint64_t v32 = 1702195828LL;
    }
    else {
      uint64_t v32 = 0x65736C6166LL;
    }
    if (v14) {
      unint64_t v33 = 0xE400000000000000LL;
    }
    else {
      unint64_t v33 = 0xE500000000000000LL;
    }
    unint64_t v34 = v33;
    String.append(_:)(*(Swift::String *)&v32);
    swift_bridgeObjectRelease(v33);
    uint64_t v35 = v52;
    unint64_t v36 = v53;
    uint64_t v37 = type metadata accessor for SequenceItem();
    uint64_t v38 = swift_allocObject(v37, 72LL, 7LL);
    *(void *)(v38 + 48) = 0LL;
    *(void *)(v38 + 56) = 0LL;
    *(void *)(v38 + 64) = v11;
    *(void *)(v38 + 16) = (uint64_t)v13;
    *(void *)(v38 + 24) = v35;
    *(void *)(v38 + 32) = v36;
    *(_WORD *)(v38 + 40) = 769;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v40 = *(void *)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v39 = *(void *)((char *)&dword_18 + (v54 & 0xFFFFFFFFFFFFFF8LL));
    if (v40 >= v39 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1LL);
    }
    uint64_t v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
    specialized Array._endMutation()(v41);
LABEL_4:
    if (++v9 == v51)
    {
      swift_bridgeObjectRelease(v43);
      uint64_t v8 = (void *)v54;
      uint64_t v7 = v55;
      goto LABEL_40;
    }
  }

  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_11850(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = a2;
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = &_swiftEmptySetSingleton;
  unint64_t v55 = &_swiftEmptySetSingleton;
  uint64_t v8 = _swiftEmptyArrayStorage;
  unint64_t v54 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v51 = *(void *)(a1 + 16);
  if (!v51)
  {
LABEL_40:
    swift_bridgeObjectRelease(v7);
    return (uint64_t)v8;
  }

  uint64_t v49 = a1 + 32;
  uint64_t v43 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v9 = 0LL;
  uint64_t v46 = v3;
  unint64_t v47 = 0x800000000002F200LL;
  uint64_t v45 = v4;
  while (1)
  {
    uint64_t v10 = (double *)(v49 + 24 * v9);
    uint64_t v11 = *(void *)v10;
    if (!*(void *)(*(void *)v10 + 16LL)) {
      goto LABEL_4;
    }
    uint64_t v12 = v6;
    double v13 = v10[1];
    int v50 = *((unsigned __int8 *)v10 + 16);
    int v14 = *((unsigned __int8 *)v10 + 17);
    uint64_t v16 = *(void *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 40);
    int64_t v17 = v55;
    if (!v55[2])
    {
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v15);
LABEL_23:
      double v6 = v12;
      goto LABEL_24;
    }

    Hasher.init(_seed:)(&v52, v55[5]);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v17);
    String.hash(into:)(&v52, v16, v15);
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1LL << *((_BYTE *)v17 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)((char *)v17 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v20) & 1) == 0)
    {
      swift_bridgeObjectRelease(v17);
      uint64_t v4 = v45;
      uint64_t v3 = v46;
      goto LABEL_23;
    }

    int v44 = v14;
    uint64_t v21 = v17[6];
    uint64_t v22 = (void *)(v21 + 16 * v20);
    uint64_t v23 = v22[1];
    BOOL v24 = *v22 == v16 && v23 == v15;
    if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v22, v23, v16, v15, 0LL) & 1) != 0)
    {
LABEL_3:
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v17);
      uint64_t v4 = v45;
      uint64_t v3 = v46;
      double v6 = v12;
      swift_bridgeObjectRelease(v11);
      goto LABEL_4;
    }

    uint64_t v25 = ~v19;
    while (1)
    {
      unint64_t v20 = (v20 + 1) & v25;
      uint64_t v26 = (void *)(v21 + 16 * v20);
      uint64_t v27 = v26[1];
      BOOL v28 = *v26 == v16 && v27 == v15;
      if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v26, v27, v16, v15, 0LL) & 1) != 0) {
        goto LABEL_3;
      }
    }

    swift_bridgeObjectRelease(v17);
    uint64_t v4 = v45;
    uint64_t v3 = v46;
    double v6 = v12;
    int v14 = v44;
LABEL_24:
    int v29 = v50;
    sub_293A4(&v52, v16, v15);
    swift_bridgeObjectRelease(v53);
    uint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v48, v3);
    if (v29) {
      double v13 = Date.timeIntervalSince1970.getter(v30);
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if ((~*(void *)&v13 & 0x7FF0000000000000LL) == 0) {
      break;
    }
    if (v13 <= -9.22337204e18) {
      goto LABEL_42;
    }
    if (v13 >= 9.22337204e18) {
      goto LABEL_43;
    }
    uint64_t v52 = 0LL;
    unint64_t v53 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(21LL);
    swift_bridgeObjectRelease(v53);
    uint64_t v52 = 0xD000000000000013LL;
    unint64_t v53 = v47;
    if (v14) {
      uint64_t v32 = 1702195828LL;
    }
    else {
      uint64_t v32 = 0x65736C6166LL;
    }
    if (v14) {
      unint64_t v33 = 0xE400000000000000LL;
    }
    else {
      unint64_t v33 = 0xE500000000000000LL;
    }
    unint64_t v34 = v33;
    String.append(_:)(*(Swift::String *)&v32);
    swift_bridgeObjectRelease(v33);
    uint64_t v35 = v52;
    unint64_t v36 = v53;
    uint64_t v37 = type metadata accessor for SequenceItem();
    uint64_t v38 = swift_allocObject(v37, 72LL, 7LL);
    *(void *)(v38 + 48) = 0LL;
    *(void *)(v38 + 56) = 0LL;
    *(void *)(v38 + 64) = v11;
    *(void *)(v38 + 16) = (uint64_t)v13;
    *(void *)(v38 + 24) = v35;
    *(void *)(v38 + 32) = v36;
    *(_WORD *)(v38 + 40) = 1025;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v40 = *(void *)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v39 = *(void *)((char *)&dword_18 + (v54 & 0xFFFFFFFFFFFFFF8LL));
    if (v40 >= v39 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1LL);
    }
    uint64_t v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
    specialized Array._endMutation()(v41);
LABEL_4:
    if (++v9 == v51)
    {
      swift_bridgeObjectRelease(v43);
      uint64_t v8 = (void *)v54;
      uint64_t v7 = v55;
      goto LABEL_40;
    }
  }

  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_11C50(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = a2;
  uint64_t v45 = type metadata accessor for Date(0LL);
  uint64_t v51 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  int v50 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = &_swiftEmptySetSingleton;
  unint64_t v56 = &_swiftEmptySetSingleton;
  uint64_t v5 = _swiftEmptyArrayStorage;
  unint64_t v55 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v49 = *(void *)(a1 + 16);
  if (!v49)
  {
LABEL_28:
    swift_bridgeObjectRelease(v4);
    return (uint64_t)v5;
  }

  uint64_t v48 = a1 + 32;
  uint64_t v43 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v6 = 0LL;
  uint64_t v47 = 0LL;
  unint64_t v44 = 0x800000000002F200LL;
  while (1)
  {
    uint64_t v7 = (double *)(v48 + 24 * v6);
    double v8 = *v7;
    double v9 = v7[1];
    int v10 = *((unsigned __int8 *)v7 + 16);
    int v11 = *((unsigned __int8 *)v7 + 17);
    int v12 = *((unsigned __int8 *)v7 + 18);
    uint64_t v13 = *(void *)(*(void *)v7 + 16LL);
    swift_bridgeObjectRetain_n(*(void *)v7, 2LL);
    uint64_t v14 = Set.init(minimumCapacity:)(v13, &type metadata for String, &protocol witness table for String);
    uint64_t v54 = v14;
    uint64_t v15 = *(void *)(*(void *)&v8 + 16LL);
    if (v15)
    {
      int v16 = v10;
      int v17 = v12;
      int v18 = v11;
      uint64_t v19 = (uint64_t *)(*(void *)&v8 + 40LL);
      do
      {
        uint64_t v20 = *(v19 - 1);
        uint64_t v21 = *v19;
        swift_bridgeObjectRetain(*v19);
        sub_293A4(&v52, v20, v21);
        swift_bridgeObjectRelease(v53);
        v19 += 2;
        --v15;
      }

      while (v15);
      swift_bridgeObjectRelease(*(void *)&v8);
      uint64_t v22 = v54;
      int v11 = v18;
      int v12 = v17;
      int v10 = v16;
    }

    else
    {
      uint64_t v22 = v14;
      swift_bridgeObjectRelease(*(void *)&v8);
    }

    uint64_t v23 = v56;
    uint64_t v24 = swift_bridgeObjectRetain(v56);
    char v25 = sub_10FF4(v24, v22);
    swift_bridgeObjectRelease(v23);
    if ((v25 & 1) != 0)
    {
      swift_bridgeObjectRelease(*(void *)&v8);
      swift_bridgeObjectRelease(v22);
      goto LABEL_4;
    }

    uint64_t v26 = v47;
    sub_10BFC(v22);
    uint64_t v47 = v26;
    swift_bridgeObjectRelease(v22);
    uint64_t v27 = v50;
    uint64_t v28 = v45;
    uint64_t v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v46, v45);
    if (v10)
    {
      double v30 = Date.timeIntervalSince1970.getter(v29);
      uint64_t v27 = v50;
      double v9 = v30;
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v27, v28);
    if ((~*(void *)&v9 & 0x7FF0000000000000LL) == 0) {
      break;
    }
    if (v9 <= -9.22337204e18) {
      goto LABEL_30;
    }
    if (v9 >= 9.22337204e18) {
      goto LABEL_31;
    }
    uint64_t v52 = 0LL;
    unint64_t v53 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(21LL);
    swift_bridgeObjectRelease(v53);
    uint64_t v52 = 0xD000000000000013LL;
    unint64_t v53 = v44;
    if (v11) {
      uint64_t v32 = 1702195828LL;
    }
    else {
      uint64_t v32 = 0x65736C6166LL;
    }
    if (v11) {
      unint64_t v33 = 0xE400000000000000LL;
    }
    else {
      unint64_t v33 = 0xE500000000000000LL;
    }
    unint64_t v34 = v33;
    String.append(_:)(*(Swift::String *)&v32);
    swift_bridgeObjectRelease(v33);
    uint64_t v35 = v52;
    unint64_t v36 = v53;
    if (v12 == 14) {
      LOBYTE(v12) = 13;
    }
    uint64_t v37 = type metadata accessor for SequenceItem();
    uint64_t v38 = swift_allocObject(v37, 72LL, 7LL);
    *(void *)(v38 + 48) = 0LL;
    *(void *)(v38 + 56) = 0LL;
    *(double *)(v38 + 64) = v8;
    *(void *)(v38 + 16) = (uint64_t)v9;
    *(void *)(v38 + 24) = v35;
    *(void *)(v38 + 32) = v36;
    *(_BYTE *)(v38 + 40) = 1;
    *(_BYTE *)(v38 + 41) = v12;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v40 = *(void *)((char *)&dword_10 + (v55 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v39 = *(void *)((char *)&dword_18 + (v55 & 0xFFFFFFFFFFFFFF8LL));
    if (v40 >= v39 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1LL);
    }
    uint64_t v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
    specialized Array._endMutation()(v41);
LABEL_4:
    if (++v6 == v49)
    {
      swift_bridgeObjectRelease(v43);
      uint64_t v5 = (void *)v55;
      uint64_t v4 = v56;
      goto LABEL_28;
    }
  }

  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_11FE4()
{
  unint64_t result = qword_39EC8;
  if (!qword_39EC8)
  {
    uint64_t v1 = sub_CEB0(&qword_39EC0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_39EC8);
  }

  return result;
}

uint64_t destroy for ProcessedFeature(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t _s42SiriPrivateLearningPatternExtractionPlugin16ProcessedFeatureVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for ProcessedFeature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  a1[1] = v6;
  *((_BYTE *)a1 + 17) = *((_BYTE *)a2 + 17);
  *((_BYTE *)a1 + 18) = *((_BYTE *)a2 + 18);
  return a1;
}

__n128 initializeWithTake for ProcessedFeature(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for ProcessedFeature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a1 + 17) = *((_BYTE *)a2 + 17);
  *((_BYTE *)a1 + 18) = *((_BYTE *)a2 + 18);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessedFeature(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 19)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessedFeature(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 18) = 0;
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 19) = 1;
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

    *(_BYTE *)(result + 19) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ProcessedFeature()
{
  return &type metadata for ProcessedFeature;
}

uint64_t type metadata accessor for NLXUsoEntityFeatureExtractor()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin28NLXUsoEntityFeatureExtractor);
}

void *sub_12204(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Kind(0LL);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Node(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __n128 result = _swiftEmptyArrayStorage;
  uint64_t v43 = _swiftEmptyArrayStorage;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v39 = v12;
    uint64_t v36 = a1;
    swift_bridgeObjectRetain(a1);
    uint64_t v37 = v6;
    while (1)
    {
      uint64_t v14 = v38(v8, v11, v5);
      uint64_t v15 = Node.kind.getter(v14);
      uint64_t v16 = Kind.rawValue.getter(v15);
      uint64_t v18 = v17;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v4, v41);
      if (v16 == 0x797469746E45LL && v18 == 0xE600000000000000LL) {
        break;
      }
      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, 0x797469746E45LL, 0xE600000000000000LL, 0LL);
      uint64_t v19 = swift_bridgeObjectRelease(v18);
      uint64_t v21 = _swiftEmptyArrayStorage;
      if ((v20 & 1) != 0) {
        goto LABEL_9;
      }
LABEL_4:
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_154A4((uint64_t)v21);
      v11 += v39;
      if (!--v10)
      {
        swift_bridgeObjectRelease(v36);
        return v43;
      }
    }

    uint64_t v19 = swift_bridgeObjectRelease(0xE600000000000000LL);
LABEL_9:
    uint64_t v22 = Node.stringValue.getter(v19);
    if (v23)
    {
      uint64_t v24 = v22;
      uint64_t v25 = v23;
      uint64_t v21 = sub_20608(0LL, 1LL, 1, _swiftEmptyArrayStorage);
      unint64_t v27 = v21[2];
      unint64_t v26 = v21[3];
      if (v27 >= v26 >> 1) {
        uint64_t v21 = sub_20608((void *)(v26 > 1), v27 + 1, 1, v21);
      }
      v21[2] = v27 + 1;
      uint64_t v28 = &v21[2 * v27];
      v28[4] = v24;
      v28[5] = v25;
      uint64_t v6 = v37;
    }

    else
    {
      uint64_t v21 = _swiftEmptyArrayStorage;
    }

    uint64_t v29 = Node.int64Value.getter();
    if ((v30 & 1) == 0)
    {
      uint64_t v42 = v29;
      uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
      uint64_t v33 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0) {
        uint64_t v21 = sub_20608(0LL, v21[2] + 1LL, 1, v21);
      }
      unint64_t v35 = v21[2];
      unint64_t v34 = v21[3];
      if (v35 >= v34 >> 1) {
        uint64_t v21 = sub_20608((void *)(v34 > 1), v35 + 1, 1, v21);
      }
      v21[2] = v35 + 1;
      uint64_t v13 = &v21[2 * v35];
      v13[4] = v31;
      v13[5] = v33;
      uint64_t v6 = v37;
    }

    goto LABEL_4;
  }

  return result;
}

void *sub_124F0(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  __n128 result = &_swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v23 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v5);
    for (int64_t i = (char *)(a3 + 50); ; i += 24)
    {
      uint64_t v9 = *(void *)(i - 18);
      uint64_t v10 = *(void *)(i - 10);
      char v11 = *(i - 2);
      char v12 = *(i - 1);
      char v13 = *i;
      v18[0] = v9;
      v18[1] = v10;
      char v19 = v11;
      char v20 = v12;
      char v21 = v13;
      swift_bridgeObjectRetain(v9);
      a1(&v22, v18);
      uint64_t v14 = swift_bridgeObjectRelease(v9);
      if (v3) {
        break;
      }
      uint64_t v15 = v22;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
      uint64_t v16 = v23[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
      uint64_t v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v15);
      specialized ContiguousArray._endMutation()(v17);
      if (!--v5) {
        return v23;
      }
    }

    return (void *)swift_release(v23);
  }

  return result;
}

void *sub_12608(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_278BC(0, v1, 0);
    uint64_t v3 = (_BYTE *)(a1 + 56);
    do
    {
      uint64_t v4 = *((void *)v3 - 3);
      uint64_t v5 = *((void *)v3 - 2);
      uint64_t v6 = *((void *)v3 - 1);
      char v7 = *v3;
      uint64_t v8 = sub_5BC0(&qword_3A1B8);
      uint64_t v9 = swift_allocObject(v8, 48LL, 7LL);
      *(_OWORD *)(v9 + 16) = xmmword_2D970;
      *(void *)(v9 + 32) = v4;
      *(void *)(v9 + 40) = v5;
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(v5);
      if (v10 >= v11 >> 1) {
        sub_278BC(v11 > 1, v10 + 1, 1);
      }
      v3 += 32;
      _swiftEmptyArrayStorage[2] = v10 + 1;
      char v12 = &_swiftEmptyArrayStorage[3 * v10];
      v12[4] = v9;
      v12[5] = v6;
      *((_BYTE *)v12 + 48) = 0;
      *((_BYTE *)v12 + 49) = v7;
      *((_BYTE *)v12 + 50) = 13;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

void *sub_12734(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_278BC(0, v1, 0);
    uint64_t v3 = (_BYTE *)(a1 + 48);
    do
    {
      uint64_t v4 = *((void *)v3 - 2);
      uint64_t v5 = *((void *)v3 - 1);
      char v6 = *v3;
      uint64_t v7 = sub_5BC0(&qword_3A1B8);
      uint64_t v8 = swift_allocObject(v7, 48LL, 7LL);
      *(_OWORD *)(v8 + 16) = xmmword_2D970;
      *(void *)(v8 + 32) = v4;
      *(void *)(v8 + 40) = v5;
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(v5);
      if (v9 >= v10 >> 1) {
        sub_278BC(v10 > 1, v9 + 1, 1);
      }
      v3 += 24;
      _swiftEmptyArrayStorage[2] = v9 + 1;
      unint64_t v11 = &_swiftEmptyArrayStorage[3 * v9];
      v11[4] = v8;
      v11[5] = 0LL;
      *((_BYTE *)v11 + 48) = 1;
      *((_BYTE *)v11 + 49) = v6;
      *((_BYTE *)v11 + 50) = 13;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_12860(unint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
LABEL_3:
  uint64_t v5 = (uint64_t)_swiftEmptyArrayStorage;
  if (!v4) {
    return v5;
  }
  uint64_t result = sub_2792C(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000LL) == 0)
  {
    uint64_t v7 = 0LL;
    uint64_t v5 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v8 = v3 & 0xC000000000000001LL;
    char v30 = a2;
    uint64_t v31 = v3 + 32;
    uint64_t v28 = v4;
    uint64_t v29 = v3;
    unint64_t v27 = v3 & 0xC000000000000001LL;
    while (1)
    {
      if (v7 == v4)
      {
LABEL_36:
        __break(1u);
LABEL_37:
        if (v3 < 0) {
          uint64_t v26 = v3;
        }
        else {
          uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v3);
        uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v26);
        swift_bridgeObjectRelease(v3);
        goto LABEL_3;
      }

      if (v8)
      {
        uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v3);
      }

      else
      {
        uint64_t v9 = *(void *)(v31 + 8 * v7);
        swift_retain(v9);
      }

      uint64_t v38 = *(void *)(v9 + 64);
      uint64_t v10 = *(void *)(v38 + 16);
      if (v10)
      {
        uint64_t v11 = *a2;
        uint64_t v37 = *(void *)(*a2 + 16);
        if (v37)
        {
          uint64_t v33 = v9;
          uint64_t v34 = v7;
          uint64_t v35 = v5;
          char v12 = (uint64_t *)(v11 + 40);
          uint64_t v3 = v38;
          swift_bridgeObjectRetain(v38);
          uint64_t v32 = v11;
          swift_bridgeObjectRetain(v11);
          uint64_t v36 = v11 + 32;
          double v13 = -1.0;
          uint64_t v5 = 1LL;
          while (1)
          {
            uint64_t v14 = *v12;
            swift_bridgeObjectRetain(v3);
            swift_bridgeObjectRetain(v14);
            uint64_t v15 = (void *)(v38 + 40);
            for (uint64_t i = 1LL; ; ++i)
            {
              uint64_t v17 = *(v15 - 1);
              uint64_t v18 = (void *)*v15;
              swift_bridgeObjectRetain(*v15);
              v19._countAndFlagsBits = v17;
              v19._object = v18;
              Swift::Double_optional v39 = String.scoreRatcliffObershelp(between:)(v19);
              a2 = *(uint64_t **)&v39.is_nil;
              char v21 = v20;
              swift_bridgeObjectRelease(v18);
              if ((v21 & 1) != 0)
              {
                if (v13 <= -1.0) {
                  double v13 = -1.0;
                }
              }

              else if (v13 <= *(double *)&a2)
              {
                double v13 = *(double *)&a2;
              }

              if (v10 == i) {
                break;
              }
              v15 += 2;
              BOOL v22 = __OFADD__(i, 1LL);
              if (v22)
              {
                __break(1u);
                return v5;
              }
            }

            swift_bridgeObjectRelease(v14);
            uint64_t v3 = v38;
            swift_bridgeObjectRelease(v38);
            if (v5 == v37) {
              break;
            }
            char v12 = (uint64_t *)(v36 + 16 * v5 + 8);
            BOOL v22 = __OFADD__(v5++, 1LL);
            if (v22)
            {
              __break(1u);
              goto LABEL_36;
            }
          }

          swift_bridgeObjectRelease(v32);
          a2 = v30;
          uint64_t v23 = *v30;
          *char v30 = v38;
          swift_release(v33);
          swift_bridgeObjectRelease(v23);
          uint64_t v4 = v28;
          uint64_t v3 = v29;
          uint64_t v7 = v34;
          uint64_t v5 = v35;
          unint64_t v8 = v27;
          goto LABEL_32;
        }

        *a2 = v38;
        swift_bridgeObjectRetain(v38);
        swift_release(v9);
        swift_bridgeObjectRelease(v11);
      }

      else
      {
        swift_release(v9);
      }

      double v13 = -1.0;
LABEL_32:
      unint64_t v25 = *(void *)(v5 + 16);
      unint64_t v24 = *(void *)(v5 + 24);
      if (v25 >= v24 >> 1) {
        sub_2792C(v24 > 1, v25 + 1, 1);
      }
      ++v7;
      *(void *)(v5 + 16) = v25 + 1;
      *(double *)(v5 + 8 * v25 + 32) = v13;
      if (v7 == v4) {
        return v5;
      }
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_12B50(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_1AD00(v5, (uint64_t)&v16);
      sub_1AD00((uint64_t)&v16, (uint64_t)v18);
      uint64_t v6 = sub_5BC0(&qword_3A1A8);
      uint64_t v7 = a2(0LL);
      sub_1AD44(&v16);
      v5 += 40LL;
      if (!--v3)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v8 = v15;
    swift_bridgeObjectRelease(a1);
    swift_release(v8);
    sub_1AD64(&v16, (uint64_t)v18);
  }

  else
  {
LABEL_6:
    uint64_t v19 = 0LL;
    memset(v18, 0, sizeof(v18));
  }

  sub_D91C((uint64_t)v18, (uint64_t)&v16, &qword_3A1B0);
  if (!v17)
  {
    sub_D97C((uint64_t)&v16, &qword_3A1B0);
    goto LABEL_12;
  }

  uint64_t v9 = sub_5BC0(&qword_3A1A8);
  uint64_t v10 = a2(0LL);
  if ((swift_dynamicCast(&v15, &v16, v9, v10, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

  uint64_t v11 = v15;
  uint64_t v12 = swift_retain(v15);
  TypedNamedFeature.value.getter(&v16, v12);
  swift_release_n(v11, 2LL);
  uint64_t v13 = v16;
LABEL_13:
  sub_D97C((uint64_t)v18, &qword_3A1B0);
  return v13;
}

uint64_t sub_12CD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_1AD00(v3, (uint64_t)&v14);
      sub_1AD00((uint64_t)&v14, (uint64_t)v16);
      uint64_t v4 = sub_5BC0(&qword_3A1A8);
      uint64_t started = type metadata accessor for CommonFeature.StartTimestamp(0LL);
      sub_1AD44(&v14);
      v3 += 40LL;
      if (!--v1)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v6 = v13;
    swift_bridgeObjectRelease(a1);
    swift_release(v6);
    sub_1AD64(&v14, (uint64_t)v16);
  }

  else
  {
LABEL_6:
    uint64_t v17 = 0LL;
    memset(v16, 0, sizeof(v16));
  }

  sub_D91C((uint64_t)v16, (uint64_t)&v14, &qword_3A1B0);
  if (!v15)
  {
    sub_D97C((uint64_t)&v14, &qword_3A1B0);
    goto LABEL_12;
  }

  uint64_t v7 = sub_5BC0(&qword_3A1A8);
  uint64_t v8 = type metadata accessor for CommonFeature.StartTimestamp(0LL);
  if ((swift_dynamicCast(&v13, &v14, v7, v8, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v11 = 0LL;
    goto LABEL_13;
  }

  uint64_t v9 = v13;
  uint64_t v10 = swift_retain(v13);
  TypedNamedFeature.value.getter(&v14, v10);
  swift_release_n(v9, 2LL);
  uint64_t v11 = v14;
LABEL_13:
  sub_D97C((uint64_t)v16, &qword_3A1B0);
  return v11;
}

uint64_t sub_12E60(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_1AD00(v5, (uint64_t)&v16);
      sub_1AD00((uint64_t)&v16, (uint64_t)v18);
      uint64_t v6 = sub_5BC0(&qword_3A1A8);
      uint64_t v7 = a2(0LL);
      sub_1AD44(&v16);
      v5 += 40LL;
      if (!--v3)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v8 = v15;
    swift_bridgeObjectRelease(a1);
    swift_release(v8);
    sub_1AD64(&v16, (uint64_t)v18);
  }

  else
  {
LABEL_6:
    uint64_t v19 = 0LL;
    memset(v18, 0, sizeof(v18));
  }

  sub_D91C((uint64_t)v18, (uint64_t)&v16, &qword_3A1B0);
  if (!v17)
  {
    sub_D97C((uint64_t)&v16, &qword_3A1B0);
    goto LABEL_12;
  }

  uint64_t v9 = sub_5BC0(&qword_3A1A8);
  uint64_t v10 = a2(0LL);
  if ((swift_dynamicCast(&v15, &v16, v9, v10, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v13 = 2LL;
    goto LABEL_13;
  }

  uint64_t v11 = v15;
  uint64_t v12 = swift_retain(v15);
  TypedNamedFeature.value.getter(&v16, v12);
  swift_release_n(v11, 2LL);
  uint64_t v13 = v16;
LABEL_13:
  sub_D97C((uint64_t)v18, &qword_3A1B0);
  return v13;
}

uint64_t sub_12FE4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_1AD00(v5, (uint64_t)&v16);
      sub_1AD00((uint64_t)&v16, (uint64_t)v18);
      uint64_t v6 = sub_5BC0(&qword_3A1A8);
      uint64_t v7 = a2(0LL);
      sub_1AD44(&v16);
      v5 += 40LL;
      if (!--v3)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v8 = v15;
    swift_bridgeObjectRelease(a1);
    swift_release(v8);
    sub_1AD64(&v16, (uint64_t)v18);
  }

  else
  {
LABEL_6:
    uint64_t v19 = 0LL;
    memset(v18, 0, sizeof(v18));
  }

  sub_D91C((uint64_t)v18, (uint64_t)&v16, &qword_3A1B0);
  if (!v17)
  {
    sub_D97C((uint64_t)&v16, &qword_3A1B0);
    goto LABEL_12;
  }

  uint64_t v9 = sub_5BC0(&qword_3A1A8);
  uint64_t v10 = a2(0LL);
  if ((swift_dynamicCast(&v15, &v16, v9, v10, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

  uint64_t v11 = v15;
  uint64_t v12 = swift_retain(v15);
  TypedNamedFeature.value.getter(&v16, v12);
  swift_release_n(v11, 2LL);
  uint64_t v13 = v16;
LABEL_13:
  sub_D97C((uint64_t)v18, &qword_3A1B0);
  return v13;
}

uint64_t sub_13170@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v7 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_1AD00(v7, (uint64_t)&v19);
      sub_1AD00((uint64_t)&v19, (uint64_t)v21);
      uint64_t v8 = sub_5BC0(&qword_3A1A8);
      uint64_t v9 = a2(0LL);
      sub_1AD44(&v19);
      v7 += 40LL;
      if (!--v5)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v10 = v18;
    swift_bridgeObjectRelease(a1);
    swift_release(v10);
    sub_1AD64(&v19, (uint64_t)v21);
  }

  else
  {
LABEL_6:
    uint64_t v22 = 0LL;
    memset(v21, 0, sizeof(v21));
  }

  sub_D91C((uint64_t)v21, (uint64_t)&v19, &qword_3A1B0);
  if (v20)
  {
    uint64_t v11 = sub_5BC0(&qword_3A1A8);
    uint64_t v12 = a2(0LL);
    if ((swift_dynamicCast(&v18, &v19, v11, v12, 6LL) & 1) != 0)
    {
      uint64_t v13 = v18;
      uint64_t v14 = swift_retain(v18);
      TypedNamedFeature.value.getter(a3, v14);
      swift_release_n(v13, 2LL);
      sub_D97C((uint64_t)v21, &qword_3A1B0);
      uint64_t v15 = type metadata accessor for Date(0LL);
      return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))( a3,  0LL,  1LL,  v15);
    }
  }

  else
  {
    sub_D97C((uint64_t)&v19, &qword_3A1B0);
  }

  sub_D97C((uint64_t)v21, &qword_3A1B0);
  uint64_t v17 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))( a3,  1LL,  1LL,  v17);
}

uint64_t sub_13344()
{
  uint64_t v0 = sub_5BC0(&qword_3A1B8);
  uint64_t result = swift_allocObject(v0, 96LL, 7LL);
  *(_OWORD *)(result + 16) = xmmword_2DE20;
  strcpy((char *)(result + 32), "\\contact-first");
  *(_BYTE *)(result + 47) = -18;
  *(void *)(result + 48) = 0x746361746E6F635CLL;
  *(void *)(result + 56) = 0xEF656C6464696D2DLL;
  strcpy((char *)(result + 64), "\\contact-last");
  *(_WORD *)(result + 78) = -4864;
  *(void *)(result + 80) = 0xD000000000000011LL;
  *(void *)(result + 88) = 0x800000000002F480LL;
  off_39F80 = (int *)result;
  return result;
}

void sub_133E8()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_39F88 = v2;
}

uint64_t sub_13474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5BC0(&qword_3A1D8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CommonInteractionFeatureExtractor(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = CommonInteractionFeatureExtractor.init()();
  uint64_t v9 = dispatch thunk of CommonInteractionFeatureExtractor.extract(from:)(a1);
  swift_release(v8);
  uint64_t v10 = type metadata accessor for INStartCallIntentFeatureExtractor(0LL);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  uint64_t v11 = INStartCallIntentFeatureExtractor.init()();
  uint64_t v12 = dispatch thunk of INStartCallIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v11);
  uint64_t v13 = sub_12B50( v12,  (uint64_t (*)(void))&type metadata accessor for CommonContactFeature.RecipientContactReferences);
  swift_bridgeObjectRelease(v12);
  if (!v13)
  {
    uint64_t result = swift_bridgeObjectRelease(v9);
LABEL_8:
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0xE000000000000000LL;
LABEL_9:
    *(void *)(a2 + 16) = 0LL;
    goto LABEL_10;
  }

  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = type metadata accessor for CommonContactReference(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  if (v14)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))( v6,  v13 + ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)),  v15);
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v17 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v6, v17, 1LL, v15);
  swift_bridgeObjectRelease(v13);
  type metadata accessor for CommonContactReference(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v6, 1LL, v15) == 1)
  {
    swift_bridgeObjectRelease(v9);
    uint64_t result = sub_D97C((uint64_t)v6, &qword_3A1D8);
    goto LABEL_8;
  }

  uint64_t v19 = CommonContactReference.displayName.getter();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v15);
  uint64_t v22 = sub_12CD4(v9);
  if ((v23 & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease(v9);
    *(void *)a2 = v19;
    *(void *)(a2 + 8) = v21;
    goto LABEL_9;
  }

  uint64_t v24 = v22;
  char v25 = sub_12E60(v9, (uint64_t (*)(void))&type metadata accessor for CommonFeature.DonatedBySiri);
  uint64_t result = swift_bridgeObjectRelease(v9);
  if (v25 != 2)
  {
    *(void *)a2 = v19;
    *(void *)(a2 + 8) = v21;
    *(void *)(a2 + 16) = v24;
    *(_BYTE *)(a2 + 24) = v25 & 1;
    return result;
  }

  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + 16) = v24;
LABEL_10:
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_136B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5BC0(&qword_3A1D8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CommonInteractionFeatureExtractor(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = CommonInteractionFeatureExtractor.init()();
  uint64_t v9 = dispatch thunk of CommonInteractionFeatureExtractor.extract(from:)(a1);
  swift_release(v8);
  uint64_t v10 = type metadata accessor for INSendMessageIntentFeatureExtractor(0LL);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  uint64_t v11 = INSendMessageIntentFeatureExtractor.init()();
  v24[1] = v11;
  uint64_t v12 = sub_1AD7C( &qword_3A1E0,  (uint64_t (*)(uint64_t))&type metadata accessor for INSendMessageIntentFeatureExtractor,  (uint64_t)&protocol conformance descriptor for INSendMessageIntentFeatureExtractor);
  uint64_t v13 = IntentFeatureExtractor.extract(from:)(a1, v10, v12);
  swift_release(v11);
  uint64_t v14 = sub_12B50( v13,  (uint64_t (*)(void))&type metadata accessor for CommonContactFeature.RecipientContactReferences);
  swift_bridgeObjectRelease(v13);
  if (v14)
  {
    uint64_t v15 = *(void *)(v14 + 16);
    uint64_t v16 = type metadata accessor for CommonContactReference(0LL);
    uint64_t v17 = *(void *)(v16 - 8);
    if (v15)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))( v6,  v14 + ((*(unsigned __int8 *)(v17 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)),  v16);
      uint64_t v18 = 0LL;
    }

    else
    {
      uint64_t v18 = 1LL;
    }

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v6, v18, 1LL, v16);
    swift_bridgeObjectRelease(v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v6, 1LL, v16) != 1)
    {
      uint64_t v14 = CommonContactReference.displayName.getter();
      unint64_t v21 = v22;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v16);
      char v23 = sub_12E60(v9, (uint64_t (*)(void))&type metadata accessor for CommonFeature.DonatedBySiri);
      uint64_t result = swift_bridgeObjectRelease(v9);
      char v20 = v23 & 1;
      goto LABEL_10;
    }

    swift_bridgeObjectRelease(v9);
    uint64_t result = sub_D97C((uint64_t)v6, &qword_3A1D8);
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t result = swift_bridgeObjectRelease(v9);
  }

  char v20 = 0;
  unint64_t v21 = 0xE000000000000000LL;
LABEL_10:
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = v21;
  *(_BYTE *)(a2 + 16) = v20;
  return result;
}

uint64_t sub_138F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for INCreateNoteIntentFeatureExtractor(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t v5 = INCreateNoteIntentFeatureExtractor.init()();
  uint64_t v6 = dispatch thunk of INCreateNoteIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v5);
  uint64_t v7 = type metadata accessor for INDeleteNoteIntentFeatureExtractor(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = INDeleteNoteIntentFeatureExtractor.init()();
  uint64_t v9 = dispatch thunk of INDeleteNoteIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v8);
  uint64_t v10 = sub_12FE4( v6,  (uint64_t (*)(void))&type metadata accessor for CreateNoteEventFeature.NoteTextContent);
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    char v14 = sub_12E60( v6,  (uint64_t (*)(void))&type metadata accessor for CreateNoteEventFeature.DonatedBySiri);
    swift_bridgeObjectRelease(v6);
    if (v14 == 2)
    {
      swift_bridgeObjectRelease(v13);
    }

    else
    {
      char v15 = v14 & 1;
      uint64_t v16 = sub_5BC0(&qword_3A1B8);
      uint64_t v17 = swift_allocObject(v16, 48LL, 7LL);
      *(_OWORD *)(v17 + 16) = xmmword_2D970;
      *(void *)(v17 + 32) = v12;
      *(void *)(v17 + 40) = v13;
      uint64_t v18 = (void *)*a2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a2);
      *a2 = (uint64_t)v18;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v18 = sub_20714(0LL, v18[2] + 1LL, 1, v18);
        *a2 = (uint64_t)v18;
      }

      unint64_t v21 = v18[2];
      unint64_t v20 = v18[3];
      if (v21 >= v20 >> 1)
      {
        uint64_t v18 = sub_20714((void *)(v20 > 1), v21 + 1, 1, v18);
        *a2 = (uint64_t)v18;
      }

      _OWORD v18[2] = v21 + 1;
      unint64_t v22 = &v18[3 * v21];
      v22[4] = v17;
      v22[5] = 0LL;
      *((_BYTE *)v22 + 48) = 1;
      *((_BYTE *)v22 + 49) = v15;
      *((_BYTE *)v22 + 50) = 10;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v6);
  }

  uint64_t v23 = sub_12FE4( v9,  (uint64_t (*)(void))&type metadata accessor for DeleteNoteEventFeature.NoteTextContent);
  if (!v24)
  {
    uint64_t v28 = v9;
    return swift_bridgeObjectRelease(v28);
  }

  uint64_t v25 = v23;
  uint64_t v26 = v24;
  char v27 = sub_12E60(v9, (uint64_t (*)(void))&type metadata accessor for DeleteNoteEventFeature.DonatedBySiri);
  swift_bridgeObjectRelease(v9);
  if (v27 == 2)
  {
    uint64_t v28 = v26;
    return swift_bridgeObjectRelease(v28);
  }

  char v30 = v27 & 1;
  uint64_t v31 = sub_5BC0(&qword_3A1B8);
  uint64_t v32 = swift_allocObject(v31, 48LL, 7LL);
  *(_OWORD *)(v32 + 16) = xmmword_2D970;
  *(void *)(v32 + 32) = v25;
  *(void *)(v32 + 40) = v26;
  uint64_t v33 = (void *)*a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*a2);
  *a2 = (uint64_t)v33;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_20714(0LL, v33[2] + 1LL, 1, v33);
    uint64_t v33 = (void *)result;
    *a2 = result;
  }

  unint64_t v35 = v33[2];
  unint64_t v34 = v33[3];
  if (v35 >= v34 >> 1)
  {
    uint64_t result = (uint64_t)sub_20714((void *)(v34 > 1), v35 + 1, 1, v33);
    uint64_t v33 = (void *)result;
    *a2 = result;
  }

  v33[2] = v35 + 1;
  uint64_t v36 = &v33[3 * v35];
  v36[4] = v32;
  v36[5] = 0LL;
  *((_BYTE *)v36 + 48) = 1;
  *((_BYTE *)v36 + 49) = v30;
  *((_BYTE *)v36 + 50) = 11;
  return result;
}

uint64_t sub_13BD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v78 = a2;
  uint64_t v3 = sub_5BC0(&qword_399C8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v4);
  uint64_t v8 = (uint64_t *)((char *)&v75 - v7);
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v79 = *(void *)(v9 - 8);
  uint64_t v80 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  char v14 = (char *)&v75 - v13;
  uint64_t v15 = type metadata accessor for MTCreateAlarmIntentFeatureExtractor(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = MTCreateAlarmIntentFeatureExtractor.init()();
  uint64_t v17 = dispatch thunk of MTCreateAlarmIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v16);
  uint64_t v18 = type metadata accessor for MTUpdateAlarmIntentFeatureExtractor(0LL);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  uint64_t v19 = MTUpdateAlarmIntentFeatureExtractor.init()();
  uint64_t v20 = dispatch thunk of MTUpdateAlarmIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v19);
  uint64_t v21 = type metadata accessor for MTToggleAlarmIntentFeatureExtractor(0LL);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  uint64_t v22 = MTToggleAlarmIntentFeatureExtractor.init()();
  uint64_t v23 = dispatch thunk of MTToggleAlarmIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v22);
  uint64_t v24 = sub_12FE4(v17, (uint64_t (*)(void))&type metadata accessor for MTCreateAlarmEventFeature.AlarmName);
  if (v25)
  {
    uint64_t v26 = v24;
    uint64_t v27 = v25;
    uint64_t v77 = v6;
    char v28 = sub_12E60( v17,  (uint64_t (*)(void))&type metadata accessor for MTCreateAlarmEventFeature.DonatedBySiri);
    if (v28 == 2)
    {
      swift_bridgeObjectRelease(v17);
      swift_bridgeObjectRelease(v27);
    }

    else
    {
      char v29 = v28;
      uint64_t v76 = v12;
      sub_13170( v17,  (uint64_t (*)(void))&type metadata accessor for MTCreateAlarmEventFeature.AlarmTime,  v8);
      swift_bridgeObjectRelease(v17);
      uint64_t v31 = v79;
      uint64_t v30 = v80;
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v79 + 48))(v8, 1LL, v80) == 1)
      {
        swift_bridgeObjectRelease(v27);
        sub_D97C((uint64_t)v8, &qword_399C8);
        uint64_t v12 = v76;
      }

      else
      {
        char v32 = v29 & 1;
        (*(void (**)(char *, void *, uint64_t))(v31 + 32))(v14, v8, v30);
        uint64_t v33 = sub_5BC0(&qword_3A1B8);
        uint64_t v34 = swift_allocObject(v33, 64LL, 7LL);
        *(_OWORD *)(v34 + 16) = xmmword_2DE30;
        *(void *)(v34 + 32) = v26;
        *(void *)(v34 + 40) = v27;
        *(void *)(v34 + 48) = Date.description.getter();
        *(void *)(v34 + 56) = v35;
        uint64_t v36 = v78;
        uint64_t v37 = (void *)*v78;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v78);
        *uint64_t v36 = (uint64_t)v37;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v37 = sub_20714(0LL, v37[2] + 1LL, 1, v37);
          uint64_t *v78 = (uint64_t)v37;
        }

        uint64_t v12 = v76;
        unint64_t v40 = v37[2];
        unint64_t v39 = v37[3];
        if (v40 >= v39 >> 1)
        {
          uint64_t v37 = sub_20714((void *)(v39 > 1), v40 + 1, 1, v37);
          uint64_t *v78 = (uint64_t)v37;
        }

        v37[2] = v40 + 1;
        uint64_t v41 = &v37[3 * v40];
        v41[4] = v34;
        v41[5] = 0LL;
        *((_BYTE *)v41 + 48) = 1;
        *((_BYTE *)v41 + 49) = v32;
        *((_BYTE *)v41 + 50) = 7;
        (*(void (**)(char *, uint64_t))(v79 + 8))(v14, v80);
      }
    }

    uint64_t v6 = v77;
  }

  else
  {
    swift_bridgeObjectRelease(v17);
  }

  uint64_t v42 = sub_12FE4(v20, (uint64_t (*)(void))&type metadata accessor for MTUpdateAlarmEventFeature.AlarmName);
  if (v43)
  {
    uint64_t v44 = v42;
    uint64_t v45 = v43;
    char v46 = sub_12E60( v20,  (uint64_t (*)(void))&type metadata accessor for MTUpdateAlarmEventFeature.DonatedBySiri);
    if (v46 == 2)
    {
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(v45);
    }

    else
    {
      char v47 = v46;
      sub_13170( v20,  (uint64_t (*)(void))&type metadata accessor for MTUpdateAlarmEventFeature.AlarmTime,  v6);
      swift_bridgeObjectRelease(v20);
      uint64_t v49 = v79;
      uint64_t v48 = v80;
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v79 + 48))(v6, 1LL, v80) == 1)
      {
        swift_bridgeObjectRelease(v45);
        sub_D97C((uint64_t)v6, &qword_399C8);
      }

      else
      {
        int v50 = v6;
        char v51 = v47 & 1;
        (*(void (**)(char *, void *, uint64_t))(v49 + 32))(v12, v50, v48);
        uint64_t v52 = sub_5BC0(&qword_3A1B8);
        uint64_t v53 = swift_allocObject(v52, 64LL, 7LL);
        *(_OWORD *)(v53 + 16) = xmmword_2DE30;
        *(void *)(v53 + 32) = v44;
        *(void *)(v53 + 40) = v45;
        *(void *)(v53 + 48) = Date.description.getter();
        *(void *)(v53 + 56) = v54;
        unint64_t v55 = v78;
        unint64_t v56 = (void *)*v78;
        char v57 = swift_isUniquelyReferenced_nonNull_native(*v78);
        *unint64_t v55 = (uint64_t)v56;
        if ((v57 & 1) == 0)
        {
          unint64_t v56 = sub_20714(0LL, v56[2] + 1LL, 1, v56);
          uint64_t *v78 = (uint64_t)v56;
        }

        unint64_t v59 = v56[2];
        unint64_t v58 = v56[3];
        if (v59 >= v58 >> 1)
        {
          unint64_t v56 = sub_20714((void *)(v58 > 1), v59 + 1, 1, v56);
          uint64_t *v78 = (uint64_t)v56;
        }

        v56[2] = v59 + 1;
        unint64_t v60 = &v56[3 * v59];
        v60[4] = v53;
        v60[5] = 0LL;
        *((_BYTE *)v60 + 48) = 1;
        *((_BYTE *)v60 + 49) = v51;
        *((_BYTE *)v60 + 50) = 9;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v48);
      }
    }
  }

  else
  {
    swift_bridgeObjectRelease(v20);
  }

  uint64_t v61 = sub_12FE4(v23, (uint64_t (*)(void))&type metadata accessor for MTToggleAlarmEventFeature.AlarmName);
  if (!v62) {
    return swift_bridgeObjectRelease(v23);
  }
  uint64_t v63 = v61;
  uint64_t v64 = v62;
  char v65 = sub_12E60( v23,  (uint64_t (*)(void))&type metadata accessor for MTToggleAlarmEventFeature.DonatedBySiri);
  swift_bridgeObjectRelease(v23);
  if (v65 == 2) {
    return swift_bridgeObjectRelease(v64);
  }
  char v67 = v65 & 1;
  uint64_t v68 = sub_5BC0(&qword_3A1B8);
  uint64_t v69 = swift_allocObject(v68, 48LL, 7LL);
  *(_OWORD *)(v69 + 16) = xmmword_2D970;
  *(void *)(v69 + 32) = v63;
  *(void *)(v69 + 40) = v64;
  unint64_t v70 = v78;
  unint64_t v71 = (void *)*v78;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*v78);
  *unint64_t v70 = (uint64_t)v71;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_20714(0LL, v71[2] + 1LL, 1, v71);
    unint64_t v71 = (void *)result;
    uint64_t *v78 = result;
  }

  unint64_t v73 = v71[2];
  unint64_t v72 = v71[3];
  if (v73 >= v72 >> 1)
  {
    uint64_t result = (uint64_t)sub_20714((void *)(v72 > 1), v73 + 1, 1, v71);
    unint64_t v71 = (void *)result;
    uint64_t *v78 = result;
  }

  void v71[2] = v73 + 1;
  uint64_t v74 = &v71[3 * v73];
  v74[4] = v69;
  v74[5] = 0LL;
  *((_BYTE *)v74 + 48) = 1;
  *((_BYTE *)v74 + 49) = v67;
  *((_BYTE *)v74 + 50) = 8;
  return result;
}

uint64_t sub_14200(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for INAddTaskIntentFeatureExtractor(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t v5 = INAddTaskIntentFeatureExtractor.init()();
  uint64_t v6 = dispatch thunk of INAddTaskIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v5);
  uint64_t v7 = type metadata accessor for INSetTaskAttributeIntentFeatureExtractor(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = INSetTaskAttributeIntentFeatureExtractor.init()();
  uint64_t v9 = dispatch thunk of INSetTaskAttributeIntentFeatureExtractor.extract(from:)(a1);
  swift_release(v8);
  uint64_t v10 = sub_12FE4( v6,  (uint64_t (*)(void))&type metadata accessor for AddTaskEventFeature.TargetTaskListTitle);
  if (!v11)
  {
    uint64_t v15 = v6;
LABEL_16:
    swift_bridgeObjectRelease(v15);
    goto LABEL_17;
  }

  uint64_t v12 = v10;
  uint64_t v13 = v11;
  char v14 = sub_12E60(v6, (uint64_t (*)(void))&type metadata accessor for AddTaskEventFeature.DonatedBySiri);
  if (v14 == 2)
  {
    swift_bridgeObjectRelease(v6);
LABEL_15:
    uint64_t v15 = v13;
    goto LABEL_16;
  }

  char v16 = v14;
  uint64_t v17 = (void *)sub_12B50( v6,  (uint64_t (*)(void))&type metadata accessor for AddTaskEventFeature.TaskContents);
  swift_bridgeObjectRelease(v6);
  if (!v17) {
    goto LABEL_15;
  }
  if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0) {
    uint64_t v17 = sub_20608(0LL, v17[2] + 1LL, 1, v17);
  }
  unint64_t v18 = v17[2];
  unint64_t v19 = v17[3];
  unint64_t v20 = v18 + 1;
  if (v18 >= v19 >> 1)
  {
    uint64_t v41 = v17;
    unint64_t v42 = v17[2];
    uint64_t v43 = sub_20608((void *)(v19 > 1), v18 + 1, 1, v41);
    unint64_t v18 = v42;
    uint64_t v17 = v43;
  }

  char v21 = v16 & 1;
  v17[2] = v20;
  uint64_t v22 = &v17[2 * v18];
  v22[4] = v12;
  v22[5] = v13;
  uint64_t v23 = (void *)*a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a2);
  *a2 = (uint64_t)v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v23 = sub_20714(0LL, v23[2] + 1LL, 1, v23);
    *a2 = (uint64_t)v23;
  }

  unint64_t v26 = v23[2];
  unint64_t v25 = v23[3];
  if (v26 >= v25 >> 1)
  {
    uint64_t v23 = sub_20714((void *)(v25 > 1), v26 + 1, 1, v23);
    *a2 = (uint64_t)v23;
  }

  v23[2] = v26 + 1;
  uint64_t v27 = &v23[3 * v26];
  v27[4] = v17;
  v27[5] = 0LL;
  *((_BYTE *)v27 + 48) = 1;
  *((_BYTE *)v27 + 49) = v21;
  *((_BYTE *)v27 + 50) = 5;
LABEL_17:
  char v28 = sub_12E60(v9, (uint64_t (*)(void))&type metadata accessor for SetTaskAttributeFeature.DonatedBySiri);
  if (v28 == 2) {
    return swift_bridgeObjectRelease(v9);
  }
  char v30 = v28;
  uint64_t v31 = sub_12FE4(v9, (uint64_t (*)(void))&type metadata accessor for SetTaskAttributeFeature.TaskContents);
  uint64_t v33 = v32;
  uint64_t result = swift_bridgeObjectRelease(v9);
  if (v33)
  {
    char v34 = v30 & 1;
    uint64_t v35 = sub_5BC0(&qword_3A1B8);
    uint64_t v36 = swift_allocObject(v35, 48LL, 7LL);
    *(_OWORD *)(v36 + 16) = xmmword_2D970;
    *(void *)(v36 + 32) = v31;
    *(void *)(v36 + 40) = v33;
    uint64_t v37 = (void *)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(*a2);
    *a2 = (uint64_t)v37;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_20714(0LL, v37[2] + 1LL, 1, v37);
      uint64_t v37 = (void *)result;
      *a2 = result;
    }

    unint64_t v39 = v37[2];
    unint64_t v38 = v37[3];
    if (v39 >= v38 >> 1)
    {
      uint64_t result = (uint64_t)sub_20714((void *)(v38 > 1), v39 + 1, 1, v37);
      uint64_t v37 = (void *)result;
      *a2 = result;
    }

    v37[2] = v39 + 1;
    unint64_t v40 = &v37[3 * v39];
    v40[4] = v36;
    v40[5] = 0LL;
    *((_BYTE *)v40 + 48) = 1;
    *((_BYTE *)v40 + 49) = v34;
    *((_BYTE *)v40 + 50) = 6;
  }

  return result;
}

void sub_1453C(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_5BC0(&qword_399C8);
  __chkstk_darwin(v6);
  v131 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v132 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = _swiftEmptyArrayStorage;
  Swift::Int v153 = _swiftEmptyArrayStorage;
  uint64_t v130 = *(void *)(a1 + 16);
  if (!v130)
  {
    uint64_t v122 = 0LL;
    goto LABEL_92;
  }

  uint64_t v140 = v10;
  uint64_t v124 = a3;
  uint64_t v129 = a2[12];
  uint64_t v128 = a2[13];
  uint64_t v127 = a1 + 32;
  uint64_t v126 = a2[14];
  uint64_t v123 = a1;
  swift_bridgeObjectRetain(a1);
  uint64_t v133 = 0LL;
  uint64_t v12 = 0LL;
  __int128 v137 = xmmword_2D970;
  uint64_t v125 = v8;
  uint64_t v13 = v132;
  while (1)
  {
    uint64_t v136 = v12;
    uint64_t v22 = (void *)(v127 + 16 * v12);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    swift_retain(*v22);
    uint64_t v139 = v24;
    uint64_t v25 = swift_bridgeObjectRetain(v24);
    uint64_t v26 = (uint64_t)v131;
    uint64_t v138 = v23;
    Turn.getTimestamp()(v25);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v26, 1LL, v8) == 1)
    {
      Date.init()();
      sub_D97C(v26, &qword_399C8);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v140, v26, v8);
    }

    uint64_t v27 = v129;
    *(void *)&__int128 v150 = v129;
    uint64_t v28 = type metadata accessor for NLXFeatureExtractor(0LL);
    swift_retain(v27);
    uint64_t v29 = v138;
    uint64_t v30 = SELFFeatureExtractor.extract(from:)(v138, v28, &protocol witness table for NLXFeatureExtractor);
    swift_release(v27);
    uint64_t v145 = sub_19BBC(v30);
    uint64_t v31 = swift_bridgeObjectRelease(v30);
    uint64_t v32 = Turn.events.getter(v31);
    uint64_t v33 = dispatch thunk of ASRFeatureExtractor.extract(from:)();
    swift_bridgeObjectRelease(v32);
    uint64_t v34 = sub_1A5C4(v33);
    uint64_t v35 = v126;
    *(void *)&__int128 v150 = v126;
    uint64_t v36 = type metadata accessor for UEIFeatureExtractor(0LL);
    swift_retain(v35);
    uint64_t v37 = SELFFeatureExtractor.extract(from:)(v29, v36, &protocol witness table for UEIFeatureExtractor);
    swift_release(v35);
    unint64_t v38 = sub_1A300(v37);
    swift_bridgeObjectRelease(v37);
    uint64_t v39 = *(void *)(v33 + 16);
    uint64_t v40 = swift_bridgeObjectRelease(v33);
    v144 = v38;
    if (v39)
    {
      if (!v133) {
        break;
      }
    }

LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
}

uint64_t sub_15310(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  *NSString v1 = v3;
  if ((_DWORD)isUniquelyReferenced_nonNull_native)
  {
    uint64_t v8 = *(void *)(v3 + 24) >> 1;
    if (v8 >= v5)
    {
      if (*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      goto LABEL_17;
    }
  }

  if (v4 <= v5) {
    v4 += v2;
  }
  swift_bridgeObjectRetain(v3);
  uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( isUniquelyReferenced_nonNull_native,  v4,  1LL,  v3);
  swift_bridgeObjectRelease(*v1);
  *NSString v1 = v3;
  uint64_t v8 = *(void *)(v3 + 24) >> 1;
  if (!*(void *)(a1 + 16))
  {
LABEL_17:
    if (!v2) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }

LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  if (v8 - v9 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  unint64_t v10 = v3 + 8 * v9 + 32;
  if (a1 + 32 < v10 + 8 * v2 && v10 < a1 + 32 + 8 * v2) {
    goto LABEL_23;
  }
  sub_5BC0(&qword_3A228);
  swift_arrayInitWithCopy(v10);
  if (!v2)
  {
LABEL_18:
    uint64_t v15 = swift_bridgeObjectRelease(a1);
    return specialized Array._endMutation()(v15);
  }

  uint64_t v12 = *(void *)(*v1 + 16);
  BOOL v13 = __OFADD__(v12, v2);
  uint64_t v14 = v12 + v2;
  if (!v13)
  {
    *(void *)(*v1 + 16) = v14;
    goto LABEL_18;
  }

  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease(a1);
    *NSString v1 = v3;
    return result;
  }

  uint64_t v11 = v3[2];
  uint64_t v12 = __OFADD__(v11, v2);
  BOOL v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }

    ;
  }

  while (v3 != v57);
  swift_bridgeObjectRelease(v2);
  uint64_t v19 = v4[2];
  if (!v19)
  {
    uint64_t v49 = v4;
LABEL_40:
    swift_release(v49);
    return (uint64_t)_swiftEmptyArrayStorage;
  }

  uint64_t v61 = _swiftEmptyArrayStorage;
  sub_278D8(0, v19, 0);
  unint64_t v20 = 0LL;
  uint64_t v21 = _swiftEmptyArrayStorage;
  unint64_t v50 = v4;
  uint64_t v51 = v19;
  uint64_t v52 = v4 + 4;
  do
  {
    uint64_t v22 = &v52[2 * v20];
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = qword_39720;
    swift_bridgeObjectRetain_n(v23, 2LL);
    if (v25 != -1) {
      swift_once(&qword_39720, sub_13344);
    }
    uint64_t v26 = off_39F80;
    uint64_t v27 = *(void *)((char *)&dword_10 + (void)off_39F80);
    if (v27)
    {
      uint64_t v58 = v21;
      swift_bridgeObjectRetain(off_39F80);
      uint64_t v28 = sub_1ADC8();
      uint64_t v54 = v26;
      uint64_t v56 = v23;
      uint64_t v29 = (uint64_t *)(v26 + 10);
      uint64_t v30 = v23;
      do
      {
        uint64_t v31 = *(v29 - 1);
        uint64_t v32 = *v29;
        uint64_t v64 = (void *)v24;
        uint64_t v65 = v30;
        uint64_t v62 = v31;
        uint64_t v63 = v32;
        v60[0] = 0LL;
        v60[1] = 0xE000000000000000LL;
        swift_bridgeObjectRetain(v32);
        uint64_t v24 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v62,  v60,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v28,  v28,  v28,  v50);
        uint64_t v34 = v33;
        swift_bridgeObjectRelease(v32);
        swift_bridgeObjectRelease(v30);
        uint64_t v30 = v34;
        v29 += 2;
        --v27;
      }

      while (v27);
      swift_bridgeObjectRelease(v56);
      swift_bridgeObjectRelease(v54);
      uint64_t v35 = v34;
      uint64_t v21 = v58;
      uint64_t v19 = v51;
    }

    else
    {
      uint64_t v35 = v23;
      swift_bridgeObjectRelease(v23);
    }

    uint64_t v61 = v21;
    uint64_t v37 = v21[2];
    uint64_t v36 = v21[3];
    if (v37 >= v36 >> 1)
    {
      sub_278D8(v36 > 1, v37 + 1, 1);
      uint64_t v21 = v61;
    }

    ++v20;
    _OWORD v21[2] = v37 + 1;
    unint64_t v38 = &v21[2 * v37];
    v38[4] = v24;
    v38[5] = v35;
  }

  while (v20 != v19);
  swift_release(v50);
  uint64_t v39 = v21[2];
  if (!v39)
  {
    uint64_t v49 = v21;
    goto LABEL_40;
  }

  uint64_t v64 = _swiftEmptyArrayStorage;
  sub_278BC(0, v39, 0);
  uint64_t v40 = v64;
  uint64_t v59 = v21;
  uint64_t v41 = v21 + 5;
  do
  {
    uint64_t v42 = *(v41 - 1);
    uint64_t v43 = *v41;
    unint64_t v44 = sub_5BC0(&qword_3A1B8);
    unint64_t v45 = swift_allocObject(v44, 48LL, 7LL);
    *(_OWORD *)(v45 + 16) = xmmword_2D970;
    *(void *)(v45 + 32) = v42;
    *(void *)(v45 + 40) = v43;
    uint64_t v64 = v40;
    id v46 = v40[2];
    char v47 = v40[3];
    swift_bridgeObjectRetain(v43);
    if (v46 >= v47 >> 1)
    {
      sub_278BC(v47 > 1, v46 + 1, 1);
      uint64_t v40 = v64;
    }

    v41 += 2;
    v40[2] = v46 + 1;
    uint64_t v48 = &v40[3 * v46];
    v48[4] = v45;
    v48[5] = 0LL;
    *((_BYTE *)v48 + 48) = 1;
    *(_WORD *)((char *)v48 + 49) = 3328;
    --v39;
  }

  while (v39);
  swift_release(v59);
  return (uint64_t)v40;
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

  if (v5 < 0)
  {
LABEL_17:
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_18;
  }

  uint64_t v11 = (unint64_t)(v9 + 4);
  uint64_t v12 = a2 + 40 * a3;
  if (v12 >= (unint64_t)&v9[5 * v5 + 4] || v11 >= v12 + 40 * v5)
  {
    swift_arrayInitWithCopy(v11);
    return v9;
  }

  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_154A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = (void *)*v1;
  int64_t v4 = *(void *)(*v1 + 16LL);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_20608(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

uint64_t sub_155F4(uint64_t a1)
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
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
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
  *NSString v1 = v4;
  uint64_t v5 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000LL) == 0 && (v4 & 0x4000000000000000LL) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v5 = 1LL;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1LL, v4);
    swift_bridgeObjectRelease(*v1);
    *NSString v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
LABEL_15:
    uint64_t result = sub_197DC(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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
  uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8LL));
  BOOL v13 = __OFADD__(v12, v11);
  uint64_t v14 = v12 + v11;
  if (!v13)
  {
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8LL)) = v14;
LABEL_19:
    uint64_t v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }

  __break(1u);
  return result;
}

uint64_t sub_157AC(int64_t *a1, int64_t *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v85 = a2;
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for ItemSequenceData(0LL);
  unint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v84 = (uint64_t *)((char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v19 = (uint64_t *)((char *)&v71 - v17);
  int64_t v20 = *a1;
  uint64_t v21 = *(void *)(*a1 + 16);
  if (!v21) {
    goto LABEL_29;
  }
  unint64_t v75 = (*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v76 = a3;
  uint64_t v22 = *(void *)(v12 + 72);
  uint64_t v73 = (unint64_t *)v18;
  uint64_t v74 = v22;
  uint64_t v23 = v16;
  uint64_t v24 = sub_1AE50(v20 + v75 + v22 * (v21 - 1), (uint64_t)&v71 - v17);
  uint64_t v77 = v23;
  uint64_t v25 = (char *)v19 + *(int *)(v23 + 28);
  uint64_t v83 = v10;
  uint64_t v72 = v25;
  Date.addingTimeInterval(_:)(v24, 60.0);
  uint64_t v82 = v19;
  int64_t v26 = *v19;
  if ((unint64_t)*v19 >> 62)
  {
    if (v26 < 0) {
      uint64_t v69 = *v19;
    }
    else {
      uint64_t v69 = v26 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v26, 2LL);
    unint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v69);
    uint64_t v28 = v3;
    if (v27) {
      goto LABEL_4;
    }
    goto LABEL_58;
  }

  unint64_t v27 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain_n(v26, 2LL);
  uint64_t v28 = v3;
  if (!v27)
  {
LABEL_58:
    swift_bridgeObjectRelease_n(v26, 2LL);
LABEL_28:
    (*(void (**)(char *, uint64_t))(v8 + 8))(v83, v7);
    sub_1AE94((uint64_t)v82);
LABEL_29:
    uint64_t v4 = (uint64_t)v84;
    sub_1AE50((uint64_t)v85, (uint64_t)v84);
    int64_t v26 = *a1;
    if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) != 0)
    {
LABEL_30:
      unint64_t v37 = *(void *)(v26 + 16);
      unint64_t v36 = *(void *)(v26 + 24);
      if (v37 >= v36 >> 1) {
        int64_t v26 = sub_20834(v36 > 1, v37 + 1, 1, v26);
      }
      *(void *)(v26 + 16) = v37 + 1;
      uint64_t result = sub_19798( v4,  v26 + ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
               + *(void *)(v12 + 72) * v37);
      *a1 = v26;
      return result;
    }

LABEL_53:
    int64_t v26 = sub_20834(0, *(void *)(v26 + 16) + 1LL, 1, v26);
    goto LABEL_30;
  }

LABEL_4:
  uint64_t v80 = v8;
  uint64_t v81 = (void *)v7;
  uint64_t v79 = a1;
  a1 = (int64_t *)(v26 + 32);
  while (1)
  {
    BOOL v29 = __OFSUB__(v27--, 1LL);
    if (v29)
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }

    if ((v26 & 0xC000000000000001LL) != 0)
    {
      uint64_t v30 = specialized _ArrayBuffer._getElementSlowPath(_:)(v27, v26);
    }

    else
    {
      if ((v27 & 0x8000000000000000LL) != 0) {
        goto LABEL_50;
      }
      uint64_t v30 = a1[v27];
      swift_retain(v30);
    }

    if (*(void *)(*(void *)(v30 + 64) + 16LL)) {
      break;
    }
    swift_release(v30);
    if (!v27)
    {
      swift_bridgeObjectRelease_n(v26, 2LL);
LABEL_25:
      a1 = v79;
LABEL_26:
      uint64_t v7 = (uint64_t)v81;
LABEL_27:
      uint64_t v8 = v80;
      goto LABEL_28;
    }
  }

  swift_bridgeObjectRelease_n(v26, 2LL);
  int64_t v26 = *v85;
  uint64_t v78 = v28;
  if ((unint64_t)v26 >> 62)
  {
    if (v26 < 0) {
      uint64_t v70 = v26;
    }
    else {
      uint64_t v70 = v26 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v26, 2LL);
    uint64_t v31 = _CocoaArrayWrapper.endIndex.getter(v70);
    if (v31) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  uint64_t v31 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain_n(v26, 2LL);
  if (!v31)
  {
LABEL_24:
    swift_bridgeObjectRelease_n(v26, 2LL);
    swift_release(v30);
    goto LABEL_25;
  }

LABEL_16:
  a1 = (int64_t *)(v26 & 0xC000000000000001LL);
  uint64_t v32 = 4LL;
  while (1)
  {
    uint64_t v33 = v32 - 4;
    if (a1)
    {
      uint64_t v34 = specialized _ArrayBuffer._getElementSlowPath(_:)(v32 - 4, v26);
      BOOL v29 = __OFADD__(v33, 1LL);
      uint64_t v35 = v32 - 3;
      if (v29) {
        goto LABEL_52;
      }
    }

    else
    {
      uint64_t v34 = *(void *)(v26 + 8 * v32);
      swift_retain(v34);
      BOOL v29 = __OFADD__(v33, 1LL);
      uint64_t v35 = v32 - 3;
      if (v29) {
        goto LABEL_52;
      }
    }

    if (*(void *)(*(void *)(v34 + 64) + 16LL)) {
      break;
    }
    swift_release(v34);
    ++v32;
    if (v35 == v31) {
      goto LABEL_24;
    }
  }

  swift_bridgeObjectRelease_n(v26, 2LL);
  uint64_t v39 = (char *)v85 + *(int *)(v77 + 28);
  uint64_t v40 = sub_1AD7C( &qword_3A170,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v7 = (uint64_t)v81;
  char v41 = dispatch thunk of static Comparable.< infix(_:_:)(v83, v39, v81, v40);
  a1 = v79;
  if ((v41 & 1) != 0)
  {
    swift_release(v30);
    swift_release(v34);
    goto LABEL_27;
  }

  uint64_t v42 = sub_5BC0(&qword_39ED0);
  uint64_t inited = (void *)swift_initStackObject(v42, v87);
  *((_OWORD *)inited + 1) = xmmword_2DE40;
  inited[4] = v30;
  inited[5] = v34;
  unint64_t v86 = inited;
  specialized Array._endMutation()(inited);
  unint64_t v44 = (unint64_t)v86;
  unint64_t v86 = _swiftEmptyArrayStorage;
  swift_retain(v30);
  swift_retain(v34);
  uint64_t v45 = sub_12860(v44, (uint64_t *)&v86);
  id v46 = v86;
  swift_bridgeObjectRelease(v44);
  swift_bridgeObjectRelease(v46);
  uint64_t v47 = *(void *)(v45 + 16);
  if (v47) {
    double v48 = *(double *)(v45 + 8 * v47 + 24);
  }
  else {
    double v48 = -1.0;
  }
  swift_bridgeObjectRelease(v45);
  uint64_t v49 = v76[23];
  uint64_t v50 = v76[24];
  sub_19594(v76 + 20, v49);
  if (dispatch thunk of RECTIFITrialStatusResolving.getSimilarityThreshold()(v49, v50) >= v48)
  {
    swift_release(v30);
    swift_release(v34);
    goto LABEL_26;
  }

  uint64_t v51 = (void *)*a1;
  if (*(void *)(*a1 + 16))
  {
    if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) != 0)
    {
      uint64_t v52 = v51[2];
      if (v52) {
        goto LABEL_42;
      }
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
  }

  else
  {
    __break(1u);
  }

  uint64_t v51 = (void *)sub_2BA48((unint64_t)v51);
  uint64_t v52 = v51[2];
  if (!v52) {
    goto LABEL_66;
  }
LABEL_42:
  uint64_t v53 = v52 - 1;
  sub_1AE94((uint64_t)v51 + v75 + (v52 - 1) * v74);
  uint64_t v84 = v51;
  v51[2] = v53;
  uint64_t v54 = v82;
  int64_t v55 = *v85;
  unint64_t v86 = (void *)*v82;
  swift_bridgeObjectRetain(v86);
  uint64_t v56 = swift_bridgeObjectRetain(v55);
  sub_155F4(v56);
  unint64_t v12 = (unint64_t)v86;
  uint64_t v51 = (void *)v54[1];
  swift_bridgeObjectRetain_n(v51, 2LL);
  char v57 = v51;
  if ((swift_isUniquelyReferenced_nonNull_native(v51) & 1) == 0) {
LABEL_67:
  }
    char v57 = sub_20848(0LL, v51[2] + 1LL, 1, v51);
  unint64_t v59 = v57[2];
  unint64_t v58 = v57[3];
  if (v59 >= v58 >> 1) {
    char v57 = sub_20848((void *)(v58 > 1), v59 + 1, 1, v57);
  }
  v57[2] = v59 + 1;
  *(double *)&v57[v59 + 4] = v48;
  swift_bridgeObjectRelease(v51);
  unint64_t v60 = v85[1];
  uint64_t v61 = *(void *)(v60 + 16);
  if (v61)
  {
    unint64_t v62 = (2 * v61) | 1;
    unint64_t v86 = v57;
    uint64_t v63 = swift_bridgeObjectRetain(v60);
    sub_1AED0(v63, v60 + 32, 1LL, v62);
    swift_bridgeObjectRelease(v60);
    uint64_t v64 = v86;
    char v57 = v81;
    uint64_t v65 = (void *)v82[2];
    uint64_t v66 = v73;
    (*(void (**)(uint64_t, char *, void *))(v80 + 16))((uint64_t)v73 + *(int *)(v77 + 28), v72, v81);
    *uint64_t v66 = v12;
    v66[1] = (unint64_t)v64;
    v66[2] = (unint64_t)v65;
    unint64_t v60 = v84[2];
    unint64_t v12 = v84[3];
    uint64_t v51 = (void *)(v60 + 1);
    id v67 = v65;
    if (v60 < v12 >> 1) {
      goto LABEL_47;
    }
  }

  else
  {
    __break(1u);
  }

  uint64_t v84 = (void *)sub_20834(v12 > 1, (int64_t)v51, 1, (unint64_t)v84);
LABEL_47:
  uint64_t v68 = (uint64_t)v84;
  v84[2] = v51;
  sub_19798((uint64_t)v73, v68 + v75 + v60 * v74);
  swift_release(v30);
  swift_release(v34);
  *a1 = v68;
  (*(void (**)(char *, void *))(v80 + 8))(v83, v57);
  return sub_1AE94((uint64_t)v82);
}

uint64_t sub_15F08()
{
  v1[15] = v0;
  uint64_t v2 = type metadata accessor for ItemSequenceData(0LL);
  v1[16] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[17] = v3;
  v1[18] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Date(0LL);
  v1[19] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[20] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[21] = swift_task_alloc(v6);
  v1[22] = swift_task_alloc(v6);
  v1[23] = swift_task_alloc(v6);
  v1[24] = swift_task_alloc(v6);
  uint64_t v7 = type metadata accessor for Conversation(0LL);
  v1[25] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v1[26] = v8;
  v1[27] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_5BC0(&qword_3A0E8);
  v1[28] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_5BC0(&qword_3A0F0);
  v1[29] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[30] = v11;
  v1[31] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_5BC0(&qword_3A0F8);
  v1[32] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v1[33] = v13;
  v1[34] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_5BC0(&qword_3A100);
  v1[35] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v1[36] = v15;
  v1[37] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v16 = (*(void *)(*(void *)(sub_5BC0(&qword_3A108) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[38] = swift_task_alloc(v16);
  v1[39] = swift_task_alloc(v16);
  v1[40] = swift_task_alloc(v16);
  unint64_t v17 = (*(void *)(*(void *)(sub_5BC0(&qword_399C8) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[41] = swift_task_alloc(v17);
  v1[42] = swift_task_alloc(v17);
  v1[43] = swift_task_alloc(v17);
  uint64_t v18 = sub_5BC0(&qword_3A110);
  v1[44] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v1[45] = v19;
  v1[46] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_5BC0(&qword_3A118);
  v1[47] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v1[48] = v21;
  v1[49] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = sub_5BC0(&qword_3A120);
  v1[50] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v1[51] = v23;
  unint64_t v24 = (*(void *)(v23 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[52] = swift_task_alloc(v24);
  v1[53] = swift_task_alloc(v24);
  return swift_task_switch(sub_1619C, 0LL, 0LL);
}

uint64_t sub_1619C()
{
  NSString v1 = (void *)v0[15];
  uint64_t v2 = v1[10];
  uint64_t v3 = v1[11];
  sub_19594(v1 + 7, v2);
  uint64_t v4 = dispatch thunk of StreamBookmarkStore.read(name:)(0xD00000000000002ELL, 0x800000000002F410LL, v2, v3);
  if (!v4)
  {
    type metadata accessor for StreamBookmark();
    uint64_t v4 = StreamBookmark.__allocating_init(name:)(0xD00000000000002ELL, 0x800000000002F410LL);
  }

  uint64_t v5 = v4;
  v0[54] = v4;
  uint64_t v6 = v0[46];
  uint64_t v15 = v0[45];
  uint64_t v7 = v0[44];
  uint64_t v8 = (void *)v0[15];
  uint64_t v9 = v8[5];
  uint64_t v10 = v8[6];
  sub_19594(v8 + 2, v9);
  dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)(v5, v9, v10);
  uint64_t v11 = v8[5];
  uint64_t v12 = v8[6];
  sub_19594(v8 + 2, v11);
  dispatch thunk of AsyncBookmarkingSignalReader.conversations(startBookmark:)(v5, v11, v12);
  AnyAsyncSequence.makeAsyncIterator()(v7);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v6, v7);
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to AnyAsyncIterator.next()[1]);
  v0[55] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1630C;
  return AnyAsyncIterator.next()(v0[40], v0[47]);
}

uint64_t sub_1630C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 440LL);
  *(void *)(*(void *)v1 + 448LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_17B7C;
  }
  else {
    uint64_t v3 = sub_16370;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_16370()
{
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  *(void *)(v0 + 456) = v4;
  uint64_t v5 = v4(v1, 1LL, v2);
  if ((_DWORD)v5 == 1)
  {
    uint64_t v6 = &qword_3A108;
LABEL_5:
    sub_D97C(v1, v6);
    double v11 = 0.0;
    goto LABEL_7;
  }

  uint64_t v7 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 152);
  uint64_t v9 = *(void *)(v0 + 160);
  Conversation.getTimestamp()(v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8);
  uint64_t v1 = *(void *)(v0 + 344);
  if (v10 == 1)
  {
    uint64_t v6 = &qword_399C8;
    goto LABEL_5;
  }

  uint64_t v12 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 160);
  double v11 = Date.timeIntervalSinceNow.getter();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v12);
LABEL_7:
  double v14 = fabs(v11);
  if (qword_39730 != -1) {
    swift_once(&qword_39730, sub_1B530);
  }
  double v15 = v14 / 86400.0;
  uint64_t v16 = type metadata accessor for Logger(0LL);
  uint64_t v17 = sub_D710(v16, (uint64_t)qword_3AB98);
  *(void *)(v0 + 464) = v17;
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v20 = 134217984;
    *(double *)(v0 + 112) = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v20 + 4, v20 + 12);
    _os_log_impl(&dword_0, v18, v19, "Oldest conversation relative day: %f", v20, 0xCu);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  if (qword_39728 != -1) {
    uint64_t v21 = swift_once(&qword_39728, sub_133E8);
  }
  if ((byte_39F88 & 1) != 0)
  {
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_0, v22, v23, "Debug mode is on for RECTIFI. Running without bookmarking.", v24, 2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    goto LABEL_21;
  }

  int64_t v26 = *(void **)(v0 + 120);
  uint64_t v27 = v26[23];
  uint64_t v28 = v26[24];
  sub_19594(v26 + 20, v27);
  if (v15 >= dispatch thunk of RECTIFITrialStatusResolving.getDaysUntilNextRun()(v27, v28))
  {
LABEL_21:
    double v48 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v49 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_0, v48, v49, "Starting to process conversations in fetchRecentSequence", v50, 2u);
      swift_slowDealloc(v50, -1LL, -1LL);
    }

    uint64_t v52 = *(void *)(v0 + 416);
    uint64_t v51 = *(void *)(v0 + 424);
    uint64_t v54 = *(void *)(v0 + 400);
    uint64_t v53 = *(void *)(v0 + 408);
    uint64_t v72 = *(void *)(v0 + 280);
    uint64_t v55 = *(void *)(v0 + 248);
    uint64_t v75 = *(void *)(v0 + 240);
    uint64_t v56 = *(void *)(v0 + 232);
    uint64_t v70 = *(void *)(v0 + 200);
    uint64_t v57 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v52, v51, v54);
    uint64_t v58 = swift_allocObject(&unk_35420, 32LL, 7LL);
    *(void *)(v58 + 16) = &unk_3A130;
    *(void *)(v58 + 24) = v57;
    uint64_t v59 = sub_1AE0C(&qword_3A148, &qword_3A120, (uint64_t)&protocol conformance descriptor for AnyAsyncSequence<A>);
    swift_retain(v57);
    AsyncMapSequence.init(_:transform:)(v52, &unk_3A140, v58, v54, v70, v59);
    *(void *)(v0 + 80) = _swiftEmptyArrayStorage;
    uint64_t v60 = sub_1AE0C(&qword_3A150, &qword_3A100, (uint64_t)&protocol conformance descriptor for AsyncMapSequence<A, B>);
    AsyncSequence.window2()(v72, v60);
    WindowedAsyncSequence.makeAsyncIterator()(v56);
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v55, v56);
    uint64_t v61 = sub_1AE0C( &qword_3A158,  &qword_3A0F8,  (uint64_t)&protocol conformance descriptor for WindowedAsyncSequence<A>.WindowedAsyncSequenceIterator);
    *(void *)(v0 + 472) = v61;
    unint64_t v62 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 480) = v62;
    *unint64_t v62 = v0;
    v62[1] = sub_169F4;
    return dispatch thunk of AsyncIteratorProtocol.next()(*(void *)(v0 + 224), *(void *)(v0 + 256), v61);
  }

  BOOL v29 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v30 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v31 = 134217984;
    *(double *)(v0 + 104) = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v31 + 4, v31 + 12);
    _os_log_impl( &dword_0,  v29,  v30,  "PatternExtractionPlugin fetchRecentSequence did not run because oldest conversation is still %f days old",  v31,  0xCu);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  uint64_t v32 = *(void *)(v0 + 424);
  uint64_t v33 = *(void *)(v0 + 400);
  uint64_t v34 = *(void *)(v0 + 408);
  uint64_t v36 = *(void *)(v0 + 384);
  uint64_t v35 = *(void *)(v0 + 392);
  uint64_t v37 = *(void *)(v0 + 376);

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
  uint64_t v38 = *(void *)(v0 + 416);
  uint64_t v39 = *(void *)(v0 + 392);
  uint64_t v40 = *(void *)(v0 + 368);
  uint64_t v42 = *(void *)(v0 + 336);
  uint64_t v41 = *(void *)(v0 + 344);
  uint64_t v44 = *(void *)(v0 + 320);
  uint64_t v43 = *(void *)(v0 + 328);
  uint64_t v46 = *(void *)(v0 + 304);
  uint64_t v45 = *(void *)(v0 + 312);
  uint64_t v63 = *(void *)(v0 + 296);
  uint64_t v64 = *(void *)(v0 + 272);
  uint64_t v65 = *(void *)(v0 + 248);
  uint64_t v66 = *(void *)(v0 + 224);
  uint64_t v67 = *(void *)(v0 + 216);
  uint64_t v68 = *(void *)(v0 + 192);
  uint64_t v69 = *(void *)(v0 + 184);
  uint64_t v71 = *(void *)(v0 + 176);
  uint64_t v73 = *(void *)(v0 + 168);
  uint64_t v74 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 424));
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v71);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  return (*(uint64_t (**)(void *))(v0 + 8))(_swiftEmptyArrayStorage);
}

uint64_t sub_169F4()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 480LL));
  if (v0)
  {
    v2[62] = _swiftEmptyArrayStorage;
    v2[63] = v0;
    uint64_t v3 = sub_178FC;
  }

  else
  {
    v2[61] = 0LL;
    uint64_t v3 = sub_16A64;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_16A64()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = sub_5BC0(&qword_3A168);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(v1, 1LL, v2) != 1)
  {
    uint64_t v8 = v0[42];
    uint64_t v9 = v0[39];
    uint64_t v10 = v0[19];
    uint64_t v11 = v0[20];
    uint64_t v12 = v1 + *(int *)(v2 + 48);
    (*(void (**)(void, uint64_t, void))(v0[26] + 32LL))(v0[27], v1, v0[25]);
    uint64_t v13 = sub_19718(v12, v9);
    Conversation.getTimestamp()(v13);
    double v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    if (v14(v8, 1LL, v10) == 1)
    {
      uint64_t v15 = v0[42];
      uint64_t v17 = v0[26];
      uint64_t v16 = v0[27];
      uint64_t v18 = v0[25];
      sub_D97C(v0[39], &qword_3A108);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      sub_D97C(v15, &qword_399C8);
LABEL_6:
      os_log_type_t v19 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
      v0[64] = v19;
      void *v19 = v0;
      v19[1] = sub_17B10;
      return dispatch thunk of AsyncIteratorProtocol.next()(v0[28], v0[32], v0[59]);
    }

    uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[57];
    uint64_t v30 = v0[38];
    uint64_t v29 = v0[39];
    uint64_t v31 = v0[25];
    uint64_t v32 = *(uint64_t (**)(void, void, void))(v0[20] + 32LL);
    uint64_t v33 = v32(v0[24], v0[42], v0[19]);
    Date.addingTimeInterval(_:)(v33, 120.0);
    sub_D91C(v29, v30, &qword_3A108);
    uint64_t v34 = v28(v30, 1LL, v31);
    uint64_t v35 = v0[41];
    uint64_t v36 = v0[38];
    if ((_DWORD)v34 == 1)
    {
      uint64_t v37 = v0[19];
      uint64_t v38 = v0[20];
      sub_D97C(v0[38], &qword_3A108);
      uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56))(v35, 1LL, 1LL, v37);
    }

    else
    {
      uint64_t v41 = v0[25];
      uint64_t v42 = v0[26];
      uint64_t v43 = v0[19];
      Conversation.getTimestamp()(v34);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v36, v41);
      uint64_t v39 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v14)(v35, 1LL, v43);
      if ((_DWORD)v39 != 1)
      {
        v32(v0[21], v0[41], v0[19]);
LABEL_25:
        uint64_t v195 = v0[61];
        uint64_t v69 = v0[23];
        uint64_t v70 = v0[24];
        uint64_t v72 = v0[21];
        uint64_t v71 = v0[22];
        uint64_t v73 = v0[19];
        uint64_t v74 = v0[20];
        uint64_t v75 = (void *)v0[15];
        uint64_t v76 = sub_1AD7C( &qword_3A170,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
        char v77 = dispatch thunk of static Comparable.< infix(_:_:)(v72, v71, v73, v76);
        uint64_t v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16);
        if ((v77 & 1) != 0) {
          uint64_t v79 = v72;
        }
        else {
          uint64_t v79 = v71;
        }
        v78(v69, v79, v73);
        uint64_t v80 = *(void *)(v74 + 8);
        ((void (*)(uint64_t, uint64_t))v80)(v72, v73);
        ((void (*)(uint64_t, uint64_t))v80)(v71, v73);
        uint64_t v81 = v75[18];
        uint64_t v82 = v75[19];
        sub_19594(v75 + 15, v81);
        uint64_t v83 = sub_17EDC();
        uint64_t v84 = swift_allocObject( v83,  ((*(unsigned int *)(v83 + 48) + 7LL) & 0x1FFFFFFF8LL) + 96,  *(unsigned __int16 *)(v83 + 52) | 7LL);
        *(_OWORD *)(v84 + 16) = xmmword_2DE50;
        *(void *)(v84 + 32) = sub_19760(0LL, &qword_3A178, &OBJC_CLASS___INIntent_ptr);
        *(void *)(v84 + 40) = sub_19760(0LL, &qword_3A180, &OBJC_CLASS___INSendMessageIntent_ptr);
        *(void *)(v84 + 48) = sub_19760(0LL, &qword_3A188, &OBJC_CLASS___INStartCallIntent_ptr);
        *(void *)(v84 + 56) = sub_19760(0LL, &qword_3A190, &OBJC_CLASS___INCreateNoteIntent_ptr);
        *(void *)(v84 + 64) = sub_19760(0LL, &qword_3A198, &OBJC_CLASS___INAddTasksIntent_ptr);
        *(void *)(v84 + 72) = sub_19760(0LL, &qword_3A1A0, &OBJC_CLASS___INSetTaskAttributeIntent_ptr);
        *(void *)(v84 + 80) = type metadata accessor for MTCreateAlarmIntent();
        *(void *)(v84 + 88) = type metadata accessor for MTUpdateAlarmIntent();
        *(void *)(v84 + 96) = type metadata accessor for MTToggleAlarmIntent();
        *(void *)(v84 + 104) = type metadata accessor for LocateDeviceIntent();
        *(void *)(v84 + 112) = type metadata accessor for LocateIntent();
        *(void *)(v84 + 120) = type metadata accessor for PlaySoundIntent();
        uint64_t v85 = InteractionReader.appInteractions(since:intentTypes:until:)(v70, v84, v69, v81, v82);
        if (v195)
        {
          uint64_t v186 = v0[50];
          uint64_t v190 = v0[53];
          uint64_t v177 = v0[49];
          uint64_t v182 = v0[51];
          uint64_t v170 = v0[48];
          uint64_t v174 = v0[47];
          uint64_t v86 = v0[39];
          uint64_t v164 = v0[35];
          uint64_t v167 = v0[37];
          uint64_t v158 = v0[34];
          uint64_t v161 = v0[36];
          uint64_t v155 = v0[33];
          uint64_t v156 = v0[32];
          uint64_t v88 = v0[26];
          uint64_t v87 = v0[27];
          uint64_t v90 = v0[24];
          uint64_t v89 = v0[25];
          uint64_t v91 = v0[23];
          uint64_t v92 = v0[19];

          swift_bridgeObjectRelease(v84);
          ((void (*)(uint64_t, uint64_t))v80)(v91, v92);
          ((void (*)(uint64_t, uint64_t))v80)(v90, v92);
          sub_D97C(v86, &qword_3A108);
          (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
          (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v158, v156);
          swift_bridgeObjectRelease(v0[10]);
          (*(void (**)(uint64_t, uint64_t))(v161 + 8))(v167, v164);
          (*(void (**)(uint64_t, uint64_t))(v170 + 8))(v177, v174);
          (*(void (**)(uint64_t, uint64_t))(v182 + 8))(v190, v186);
          uint64_t v93 = v0[52];
          uint64_t v94 = v0[49];
          uint64_t v95 = v0[46];
          uint64_t v97 = v0[42];
          uint64_t v96 = v0[43];
          uint64_t v99 = v0[40];
          uint64_t v98 = v0[41];
          uint64_t v101 = v0[38];
          uint64_t v100 = v0[39];
          uint64_t v159 = v0[37];
          uint64_t v162 = v0[34];
          uint64_t v165 = v0[31];
          uint64_t v168 = v0[28];
          uint64_t v171 = v0[27];
          uint64_t v175 = v0[24];
          uint64_t v178 = v0[23];
          uint64_t v183 = v0[22];
          uint64_t v187 = v0[21];
          uint64_t v191 = v0[18];
          swift_task_dealloc(v0[53]);
          swift_task_dealloc(v93);
          swift_task_dealloc(v94);
          swift_task_dealloc(v95);
          swift_task_dealloc(v96);
          swift_task_dealloc(v97);
          swift_task_dealloc(v98);
          swift_task_dealloc(v99);
          swift_task_dealloc(v100);
          swift_task_dealloc(v101);
          swift_task_dealloc(v159);
          swift_task_dealloc(v162);
          swift_task_dealloc(v165);
          swift_task_dealloc(v168);
          swift_task_dealloc(v171);
          swift_task_dealloc(v175);
          swift_task_dealloc(v178);
          swift_task_dealloc(v183);
          swift_task_dealloc(v187);
          swift_task_dealloc(v191);
          return ((uint64_t (*)(void))v0[1])();
        }

        uint64_t v102 = v85;
        v196 = (void (*)(char *, uint64_t, uint64_t))v78;
        uint64_t v103 = (void *)v0[15];
        uint64_t v104 = swift_bridgeObjectRelease(v84);
        uint64_t v105 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()(v104);
        uint64_t v106 = swift_release(v102);
        uint64_t v107 = Conversation.allTurnsChronologically.getter(v106);
        uint64_t v108 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()(v107);
        swift_release(v107);
        uint64_t v109 = type metadata accessor for Turn(0LL);
        uint64_t v110 = type metadata accessor for AppInteraction(0LL);
        uint64_t v111 = static TimeEventUtils.groupAndJoinEvents<A, B>(milestoneEvents:eventsToJoin:)( v108,  v105,  v109,  v110,  &protocol witness table for Turn,  &protocol witness table for AppInteraction);
        swift_release(v105);
        swift_release(v108);
        uint64_t v112 = objc_autoreleasePoolPush();
        sub_1453C(v111, v103, v0 + 5);
        objc_autoreleasePoolPop(v112);
        swift_bridgeObjectRelease(v111);
        uint64_t v114 = v0[5];
        uint64_t v113 = (void *)v0[6];
        v179 = v0;
        if ((unint64_t)v114 >> 62)
        {
LABEL_46:
          if (v114 < 0) {
            uint64_t v147 = v114;
          }
          else {
            uint64_t v147 = v114 & 0xFFFFFFFFFFFFFF8LL;
          }
          swift_bridgeObjectRetain_n(v114, 2LL);
          unint64_t v115 = (void *)_CocoaArrayWrapper.endIndex.getter(v147);
          swift_bridgeObjectRelease(v114);
          uint64_t v192 = (uint64_t)v115;
          if (v115)
          {
LABEL_32:
            if (*(void *)((char *)&dword_10 + (v114 & 0xFFFFFFFFFFFFF8LL)))
            {
              unint64_t v115 = v179 + 11;
              uint64_t v116 = *(void *)(v114 + 32);
              uint64_t v117 = *(void *)(v116 + 16);
              v179[11] = _swiftEmptyArrayStorage;
              if (v192 >= 1)
              {
                v172 = v113;
                swift_bridgeObjectRetain(v114);
                swift_retain(v116);
                uint64_t v118 = 0LL;
                unint64_t v154 = (void (*)(uint64_t, uint64_t))v80;
                uint64_t v180 = v116;
                unint64_t v184 = v114;
                do
                {
                  uint64_t v119 = *(void *)(v114 + 8 * v118 + 32);
                  uint64_t v120 = *(void *)(v119 + 16);
                  uint64_t v113 = (void *)(v120 - v117);
                  if (__OFSUB__(v120, v117))
                  {
                    __break(1u);
LABEL_45:
                    __break(1u);
                    goto LABEL_46;
                  }

                  uint64_t v121 = *(void *)(v116 + 16);
                  uint64_t v122 = v120 - v121;
                  if (__OFSUB__(v120, v121)) {
                    goto LABEL_45;
                  }
                  uint64_t v123 = *(void *)(v119 + 24);
                  uint64_t v124 = *(void *)(v119 + 32);
                  uint64_t v0 = (void *)*(unsigned __int16 *)(v119 + 40);
                  uint64_t v125 = *(void *)(v119 + 64);
                  uint64_t v126 = type metadata accessor for SequenceItem();
                  uint64_t v80 = swift_allocObject(v126, 72LL, 7LL);
                  *(void *)(v80 + 48) = v118;
                  *(void *)(v80 + 56) = v113;
                  *(void *)(v80 + 64) = v125;
                  *(void *)(v80 + 16) = v122;
                  *(void *)(v80 + 24) = v123;
                  *(void *)(v80 + 32) = v124;
                  *(_WORD *)(v80 + 40) = (_WORD)v0;
                  swift_retain(v119);
                  swift_bridgeObjectRetain(v124);
                  uint64_t v127 = swift_bridgeObjectRetain(v125);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v127);
                  unint64_t v129 = *(void *)((char *)&dword_10 + (*v115 & 0xFFFFFFFFFFFFFF8LL));
                  unint64_t v128 = *(void *)((char *)&dword_18 + (*v115 & 0xFFFFFFFFFFFFFF8LL));
                  if (v129 >= v128 >> 1) {
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v128 > 1,  v129 + 1,  1LL);
                  }
                  ++v118;
                  uint64_t v130 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v129, v80);
                  specialized Array._endMutation()(v130);
                  uint64_t v117 = *(void *)(v119 + 16);
                  swift_release(v119);
                  uint64_t v114 = v184;
                  uint64_t v116 = v180;
                }

                while (v192 != v118);
                uint64_t v0 = v179;
                uint64_t v131 = v179[24];
                uint64_t v132 = (char *)v179[18];
                uint64_t v133 = v179[19];
                uint64_t v134 = v179[16];
                swift_bridgeObjectRelease(v184);
                uint64_t v135 = v179[11];
                v198[0] = (uint64_t)_swiftEmptyArrayStorage;
                uint64_t v136 = sub_12860(v184, v198);
                swift_bridgeObjectRelease(v198[0]);
                swift_bridgeObjectRelease(v184);
                v196(&v132[*(int *)(v134 + 28)], v131, v133);
                *(void *)uint64_t v132 = v135;
                *((void *)v132 + 1) = v136;
                *((void *)v132 + 2) = v172;
                unint64_t v115 = (void *)v179[10];
                v196 = v172;
                if ((swift_isUniquelyReferenced_nonNull_native(v115) & 1) == 0) {
                  goto LABEL_53;
                }
                goto LABEL_41;
              }
            }

            else
            {
              __break(1u);
            }

            __break(1u);
LABEL_53:
            unint64_t v115 = (void *)sub_20834(0, v115[2] + 1LL, 1, (unint64_t)v115);
LABEL_41:
            unint64_t v138 = v115[2];
            unint64_t v137 = v115[3];
            if (v138 >= v137 >> 1) {
              unint64_t v115 = (void *)sub_20834(v137 > 1, v138 + 1, 1, (unint64_t)v115);
            }
            uint64_t v139 = v0[39];
            uint64_t v140 = v0[26];
            uint64_t v193 = v0[27];
            uint64_t v141 = v0[25];
            uint64_t v142 = v179[24];
            uint64_t v143 = v179[23];
            uint64_t v144 = v179[19];
            uint64_t v145 = v179[18];
            uint64_t v146 = v179[17];
            v115[2] = v138 + 1;
            sub_19798( v145,  (uint64_t)v115 + ((*(unsigned __int8 *)(v146 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80))
            + *(void *)(v146 + 72) * v138);
            swift_bridgeObjectRelease(v184);

            swift_release(v180);
            v179[10] = v115;
            v154(v143, v144);
            uint64_t v0 = v179;
            v154(v142, v144);
            sub_D97C(v139, &qword_3A108);
            (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v193, v141);
            goto LABEL_6;
          }
        }

        else
        {
          unint64_t v115 = *(void **)((char *)&dword_10 + (v114 & 0xFFFFFFFFFFFFF8LL));
          swift_bridgeObjectRetain(v114);
          uint64_t v192 = (uint64_t)v115;
          if (v115) {
            goto LABEL_32;
          }
        }

        uint64_t v0 = v179;
        uint64_t v148 = v179[39];
        uint64_t v149 = v179[26];
        uint64_t v197 = v179[27];
        uint64_t v151 = v179[24];
        uint64_t v150 = v179[25];
        uint64_t v152 = v179[23];
        uint64_t v153 = v179[19];
        swift_bridgeObjectRelease_n(v114, 2LL);

        ((void (*)(uint64_t, uint64_t))v80)(v152, v153);
        ((void (*)(uint64_t, uint64_t))v80)(v151, v153);
        sub_D97C(v148, &qword_3A108);
        (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v197, v150);
        goto LABEL_6;
      }
    }

    uint64_t v44 = v0[41];
    static Date.distantFuture.getter(v39);
    sub_D97C(v44, &qword_399C8);
    goto LABEL_25;
  }

  (*(void (**)(void, void))(v0[33] + 8LL))(v0[34], v0[32]);
  uint64_t v3 = v0[10];
  uint64_t v4 = swift_bridgeObjectRetain(v3);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v7 = 134217984;
    v0[9] = *(void *)(v3 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 9, v0 + 10, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v3);
    _os_log_impl( &dword_0,  v5,  v6,  "Completed processing conversations in fetchRecentSequence. Computed a total of %ld sequences",  v7,  0xCu);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v3);
  }

  swift_beginAccess(v0 + 10, v0 + 2, 0LL, 0LL);
  uint64_t v21 = v0[10];
  v198[0] = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v23 = v0[17];
    unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v25 = *(void *)(v23 + 72);
    uint64_t v26 = v0[61];
    uint64_t v27 = (void *)v0[15];
    swift_bridgeObjectRetain(v21);
    sub_157AC(v198, (int64_t *)(v21 + v24), v27);
    if (v26)
    {
      swift_bridgeObjectRelease(v198[0]);
      return swift_bridgeObjectRelease(v21);
    }

    uint64_t v45 = v22 - 1;
    if (v22 != 1)
    {
      uint64_t v46 = (int64_t *)(v21 + v25 + v24);
      do
      {
        sub_157AC(v198, v46, (void *)v0[15]);
        uint64_t v46 = (int64_t *)((char *)v46 + v25);
        --v45;
      }

      while (v45);
    }

    swift_bridgeObjectRelease_n(v21, 2LL);
    uint64_t v40 = (void *)v198[0];
  }

  else
  {
    swift_bridgeObjectRelease(v21);
    uint64_t v40 = _swiftEmptyArrayStorage;
  }

  v194 = v40;
  uint64_t v47 = swift_bridgeObjectRetain(v40);
  double v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v50 = 134217984;
    v0[8] = v194[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 8, v0 + 9, v50 + 4, v50 + 12);
    swift_bridgeObjectRelease(v194);
    _os_log_impl( &dword_0,  v48,  v49,  "Completed stitching conversations in fetchRecentSequence. Computed a total of %ld sequences",  v50,  0xCu);
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v194);
  }

  uint64_t v51 = v48;
  uint64_t v188 = v0[53];
  uint64_t v53 = v0[50];
  uint64_t v52 = v0[51];
  uint64_t v55 = v0[48];
  uint64_t v54 = v0[49];
  uint64_t v56 = v0[47];
  uint64_t v57 = v0[36];
  uint64_t v58 = v0[37];
  uint64_t v59 = v0[35];

  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v188, v53);
  uint64_t v60 = v0[52];
  uint64_t v61 = v0[49];
  uint64_t v62 = v0[46];
  uint64_t v64 = v0[42];
  uint64_t v63 = v0[43];
  uint64_t v66 = v0[40];
  uint64_t v65 = v0[41];
  uint64_t v68 = v0[38];
  uint64_t v67 = v0[39];
  uint64_t v157 = v0[37];
  uint64_t v160 = v0[34];
  uint64_t v163 = v0[31];
  uint64_t v166 = v0[28];
  uint64_t v169 = v0[27];
  uint64_t v173 = v0[24];
  uint64_t v176 = v0[23];
  uint64_t v181 = v0[22];
  uint64_t v185 = v0[21];
  uint64_t v189 = v0[18];
  swift_task_dealloc(v0[53]);
  swift_task_dealloc(v60);
  swift_task_dealloc(v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v157);
  swift_task_dealloc(v160);
  swift_task_dealloc(v163);
  swift_task_dealloc(v166);
  swift_task_dealloc(v169);
  swift_task_dealloc(v173);
  swift_task_dealloc(v176);
  swift_task_dealloc(v181);
  swift_task_dealloc(v185);
  swift_task_dealloc(v189);
  return ((uint64_t (*)(void *))v0[1])(v194);
}

uint64_t sub_178FC()
{
  uint64_t v1 = v0[62];
  v0[7] = v0[63];
  uint64_t v2 = sub_5BC0(&qword_3A160);
  swift_willThrowTypedImpl(v0 + 7, v2, &protocol self-conformance witness table for Error);
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_17964, 0LL, 0LL);
}

uint64_t sub_17964()
{
  uint64_t v28 = *(void *)(v0 + 408);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v30 = *(void *)(v0 + 400);
  uint64_t v32 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v8 = *(void *)(v0 + 256);
  uint64_t v9 = *(void *)(v0 + 264);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v32, v30);
  uint64_t v10 = *(void *)(v0 + 416);
  uint64_t v11 = *(void *)(v0 + 392);
  uint64_t v12 = *(void *)(v0 + 368);
  uint64_t v14 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 344);
  uint64_t v16 = *(void *)(v0 + 320);
  uint64_t v15 = *(void *)(v0 + 328);
  uint64_t v18 = *(void *)(v0 + 304);
  uint64_t v17 = *(void *)(v0 + 312);
  uint64_t v20 = *(void *)(v0 + 296);
  uint64_t v21 = *(void *)(v0 + 272);
  uint64_t v22 = *(void *)(v0 + 248);
  uint64_t v23 = *(void *)(v0 + 224);
  uint64_t v24 = *(void *)(v0 + 216);
  uint64_t v25 = *(void *)(v0 + 192);
  uint64_t v26 = *(void *)(v0 + 184);
  uint64_t v27 = *(void *)(v0 + 176);
  uint64_t v29 = *(void *)(v0 + 168);
  uint64_t v31 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 424));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v29);
  swift_task_dealloc(v31);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_17B10()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 512LL));
  if (v0)
  {
    v2[62] = v2[10];
    v2[63] = v0;
    uint64_t v3 = sub_178FC;
  }

  else
  {
    v2[61] = 0LL;
    uint64_t v3 = sub_16A64;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_17B7C()
{
  uint64_t v1 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 384);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 376);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v7 = *(void *)(v0 + 416);
  uint64_t v8 = *(void *)(v0 + 392);
  uint64_t v9 = *(void *)(v0 + 368);
  uint64_t v11 = *(void *)(v0 + 336);
  uint64_t v10 = *(void *)(v0 + 344);
  uint64_t v13 = *(void *)(v0 + 320);
  uint64_t v12 = *(void *)(v0 + 328);
  uint64_t v15 = *(void *)(v0 + 304);
  uint64_t v14 = *(void *)(v0 + 312);
  uint64_t v17 = *(void *)(v0 + 296);
  uint64_t v18 = *(void *)(v0 + 272);
  uint64_t v19 = *(void *)(v0 + 248);
  uint64_t v20 = *(void *)(v0 + 224);
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 184);
  uint64_t v24 = *(void *)(v0 + 176);
  uint64_t v25 = *(void *)(v0 + 168);
  uint64_t v26 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 424));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_17CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_17D10, 0LL, 0LL);
}

uint64_t sub_17D10()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    uint64_t v2 = qword_39728;
    id v3 = v1;
    if (v2 != -1) {
      swift_once(&qword_39728, sub_133E8);
    }
    if ((byte_39F88 & 1) == 0)
    {
      uint64_t v4 = *(void **)(v0 + 40);
      uint64_t v5 = v4[10];
      uint64_t v6 = v4[11];
      sub_19594(v4 + 7, v5);
      dispatch thunk of StreamBookmarkStore.write(bookmark:)(v3, v5, v6);
    }
  }

  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v9 = type metadata accessor for Conversation(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_17DD4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + *(int *)(sub_5BC0(&qword_3A218) + 48));
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_1B52C;
  return v10(a1, a2, v7);
}

uint64_t sub_17E68()
{
  return swift_deallocClassInstance(v0, 224LL, 7LL);
}

uint64_t type metadata accessor for ItemSequenceFetcher()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin19ItemSequenceFetcher);
}

uint64_t sub_17EDC()
{
  uint64_t v0 = sub_5BC0(&qword_3A208);
  else {
    uint64_t v1 = 0LL;
  }
  if (v1) {
    uint64_t v2 = &qword_39ED0;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_3A210;
  }
  return sub_5BC0(v2);
}

Swift::Int sub_17F28(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_19A10(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_17F90(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_17F90(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_18678(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_154;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_162:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v111 = result;
  uint64_t v108 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_120:
      uint64_t v101 = v11;
      uint64_t v110 = v8;
      if (v12 < 2) {
        goto LABEL_117;
      }
      uint64_t v102 = *v108;
      while (1)
      {
        unint64_t v103 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_149;
        }
        if (!v102) {
          goto LABEL_161;
        }
        uint64_t v100 = v101;
        uint64_t v104 = *(void *)&v101[16 * v103 + 32];
        uint64_t v105 = *(void *)&v101[16 * v12 + 24];
        sub_18744( (char *)(v102 + 16 * v104),  (char *)(v102 + 16LL * *(void *)&v101[16 * v12 + 16]),  v102 + 16 * v105,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v105 < v104) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0) {
          uint64_t v100 = sub_18E4C((uint64_t)v100);
        }
        if (v103 >= *((void *)v100 + 2)) {
          goto LABEL_151;
        }
        uint64_t v106 = &v100[16 * v103 + 32];
        *(void *)uint64_t v106 = v104;
        *((void *)v106 + 1) = v105;
        unint64_t v107 = *((void *)v100 + 2);
        if (v12 > v107) {
          goto LABEL_152;
        }
        memmove(&v100[16 * v12 + 16], &v100[16 * v12 + 32], 16 * (v107 - v12));
        uint64_t v101 = v100;
        *((void *)v100 + sub_1AD44(v0 + 2) = v107 - 1;
        unint64_t v12 = v107 - 1;
        if (v107 <= 2) {
          goto LABEL_117;
        }
      }
    }

    uint64_t v110 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(void *)(v7 + 16) = v6;
    uint64_t v110 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v109 = v10 + 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v112 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    uint64_t v18 = v17[1];
    if (v15 == *v17 && v16 == v18)
    {
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v20 = 0;
    }

    else
    {
      int v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, *v17, v18, 1LL);
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    uint64_t v22 = (uint64_t *)(v109 + 16 * v21);
    do
    {
      uint64_t v24 = *(v22 - 1);
      uint64_t v25 = *v22;
      uint64_t v26 = (void *)(v10 + 16 * v9);
      uint64_t v27 = v26[1];
      if (v24 == *v26 && v25 == v27)
      {
        if ((v20 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v20 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, *v26, v27, 1LL)) & 1) != 0)
      {
        goto LABEL_36;
      }

      v22 += 2;
      Swift::Int v23 = v21 + 1;
      Swift::Int v9 = v21;
      Swift::Int v21 = v23;
    }

    while (v23 < v3);
    Swift::Int v21 = v23;
LABEL_36:
    Swift::Int v9 = v21;
    if ((v20 & 1) != 0)
    {
LABEL_37:
      if (v21 < v13) {
        goto LABEL_157;
      }
      if (v13 < v21)
      {
        uint64_t v29 = 16 * v21;
        uint64_t v30 = 16 * v13;
        Swift::Int v31 = v21;
        Swift::Int v32 = v13;
        do
        {
          if (v32 != --v31)
          {
            if (!v10) {
              goto LABEL_160;
            }
            uint64_t v33 = v10 + v29;
            uint64_t v34 = *(void *)(v10 + v30);
            uint64_t v35 = *(void *)(v10 + v30 + 8);
            *(_OWORD *)(v10 + v30) = *(_OWORD *)(v10 + v29 - 16);
            *(void *)(v33 - 16) = v34;
            *(void *)(v33 - 8) = v35;
          }

          ++v32;
          v29 -= 16LL;
          v30 += 16LL;
        }

        while (v32 < v31);
      }

LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_153;
      }
      if (v9 - v13 < v111)
      {
        if (__OFADD__(v13, v111)) {
          goto LABEL_155;
        }
        if (v13 + v111 >= v3) {
          Swift::Int v36 = v3;
        }
        else {
          Swift::Int v36 = v13 + v111;
        }
        if (v36 < v13) {
          goto LABEL_156;
        }
        if (v9 != v36)
        {
          uint64_t v37 = (void *)(v10 + 16 * v9);
          do
          {
            uint64_t v38 = (uint64_t *)(v10 + 16 * v9);
            uint64_t v39 = *v38;
            uint64_t v40 = v38[1];
            Swift::Int v41 = v13;
            uint64_t v42 = v37;
            do
            {
              uint64_t v43 = *(v42 - 2);
              uint64_t v44 = *(v42 - 1);
              BOOL v45 = v39 == v43 && v40 == v44;
              if (v45 || (_stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v43, v44, 1LL) & 1) == 0) {
                break;
              }
              if (!v10) {
                goto LABEL_158;
              }
              uint64_t v39 = *v42;
              uint64_t v40 = v42[1];
              *(_OWORD *)uint64_t v42 = *((_OWORD *)v42 - 1);
              *(v42 - 1) = v40;
              *(v42 - sub_1AD44(v0 + 2) = v39;
              v42 -= 2;
              ++v41;
            }

            while (v9 != v41);
            ++v9;
            v37 += 2;
          }

          while (v9 != v36);
          Swift::Int v9 = v36;
        }
      }
    }

    if (v9 < v13)
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
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
      goto LABEL_162;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      uint64_t v11 = sub_189DC(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v47 = *((void *)v11 + 2);
    unint64_t v46 = *((void *)v11 + 3);
    unint64_t v12 = v47 + 1;
    if (v47 >= v46 >> 1) {
      uint64_t v11 = sub_189DC((char *)(v46 > 1), v47 + 1, 1, v11);
    }
    *((void *)v11 + sub_1AD44(v0 + 2) = v12;
    double v48 = v11 + 32;
    os_log_type_t v49 = &v11[16 * v47 + 32];
    *(void *)os_log_type_t v49 = v13;
    *((void *)v49 + 1) = v9;
    if (v47) {
      break;
    }
    unint64_t v12 = 1LL;
LABEL_15:
    Swift::Int v3 = v112;
    if (v9 >= v112)
    {
      uint64_t v8 = v110;
      goto LABEL_120;
    }
  }

  Swift::Int v113 = v9;
  while (1)
  {
    unint64_t v50 = v12 - 1;
    if (v12 >= 4)
    {
      uint64_t v55 = &v48[16 * v12];
      uint64_t v56 = *((void *)v55 - 8);
      uint64_t v57 = *((void *)v55 - 7);
      BOOL v61 = __OFSUB__(v57, v56);
      uint64_t v58 = v57 - v56;
      if (v61) {
        goto LABEL_137;
      }
      uint64_t v60 = *((void *)v55 - 6);
      uint64_t v59 = *((void *)v55 - 5);
      BOOL v61 = __OFSUB__(v59, v60);
      uint64_t v53 = v59 - v60;
      char v54 = v61;
      if (v61) {
        goto LABEL_138;
      }
      unint64_t v62 = v12 - 2;
      uint64_t v63 = &v48[16 * v12 - 32];
      uint64_t v65 = *(void *)v63;
      uint64_t v64 = *((void *)v63 + 1);
      BOOL v61 = __OFSUB__(v64, v65);
      uint64_t v66 = v64 - v65;
      if (v61) {
        goto LABEL_140;
      }
      BOOL v61 = __OFADD__(v53, v66);
      uint64_t v67 = v53 + v66;
      if (v61) {
        goto LABEL_143;
      }
      if (v67 >= v58)
      {
        uint64_t v85 = &v48[16 * v50];
        uint64_t v87 = *(void *)v85;
        uint64_t v86 = *((void *)v85 + 1);
        BOOL v61 = __OFSUB__(v86, v87);
        uint64_t v88 = v86 - v87;
        if (v61) {
          goto LABEL_147;
        }
        BOOL v78 = v53 < v88;
        goto LABEL_105;
      }
    }

    else
    {
      if (v12 != 3)
      {
        uint64_t v79 = *((void *)v11 + 4);
        uint64_t v80 = *((void *)v11 + 5);
        BOOL v61 = __OFSUB__(v80, v79);
        uint64_t v72 = v80 - v79;
        char v73 = v61;
        goto LABEL_99;
      }

      uint64_t v52 = *((void *)v11 + 4);
      uint64_t v51 = *((void *)v11 + 5);
      BOOL v61 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      char v54 = v61;
    }

    if ((v54 & 1) != 0) {
      goto LABEL_139;
    }
    unint64_t v62 = v12 - 2;
    uint64_t v68 = &v48[16 * v12 - 32];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    BOOL v71 = __OFSUB__(v69, v70);
    uint64_t v72 = v69 - v70;
    char v73 = v71;
    if (v71) {
      goto LABEL_142;
    }
    uint64_t v74 = &v48[16 * v50];
    uint64_t v76 = *(void *)v74;
    uint64_t v75 = *((void *)v74 + 1);
    BOOL v61 = __OFSUB__(v75, v76);
    uint64_t v77 = v75 - v76;
    if (v61) {
      goto LABEL_145;
    }
    if (__OFADD__(v72, v77)) {
      goto LABEL_146;
    }
    if (v72 + v77 >= v53)
    {
      BOOL v78 = v53 < v77;
LABEL_105:
      if (v78) {
        unint64_t v50 = v62;
      }
      goto LABEL_107;
    }

LABEL_99:
    if ((v73 & 1) != 0) {
      goto LABEL_141;
    }
    uint64_t v81 = &v48[16 * v50];
    uint64_t v83 = *(void *)v81;
    uint64_t v82 = *((void *)v81 + 1);
    BOOL v61 = __OFSUB__(v82, v83);
    uint64_t v84 = v82 - v83;
    if (v61) {
      goto LABEL_144;
    }
    if (v84 < v72) {
      goto LABEL_15;
    }
LABEL_107:
    unint64_t v89 = v50 - 1;
    if (v50 - 1 >= v12)
    {
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
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }

    uint64_t v90 = v10;
    if (!v10) {
      goto LABEL_159;
    }
    uint64_t v91 = v11;
    uint64_t v92 = &v48[16 * v89];
    uint64_t v93 = *(void *)v92;
    uint64_t v94 = v48;
    unint64_t v95 = v50;
    uint64_t v96 = &v48[16 * v50];
    uint64_t v97 = *((void *)v96 + 1);
    uint64_t v98 = v90;
    sub_18744((char *)(v90 + 16LL * *(void *)v92), (char *)(v90 + 16LL * *(void *)v96), v90 + 16 * v97, __dst);
    if (v1) {
      break;
    }
    if (v97 < v93) {
      goto LABEL_134;
    }
    if (v95 > *((void *)v91 + 2)) {
      goto LABEL_135;
    }
    *(void *)uint64_t v92 = v93;
    *(void *)&v94[16 * v89 + 8] = v97;
    unint64_t v99 = *((void *)v91 + 2);
    if (v95 >= v99) {
      goto LABEL_136;
    }
    uint64_t v11 = v91;
    unint64_t v12 = v99 - 1;
    memmove(v96, v96 + 16, 16 * (v99 - 1 - v95));
    double v48 = v94;
    *((void *)v91 + sub_1AD44(v0 + 2) = v99 - 1;
    uint64_t v10 = v98;
    Swift::Int v9 = v113;
    if (v99 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v100 = v91;
LABEL_116:
  uint64_t v101 = v100;
LABEL_117:
  swift_bridgeObjectRelease(v101);
  v110[2] = 0LL;
  return swift_bridgeObjectRelease(v110);
}

uint64_t sub_18678(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - sub_1AD44(v0 + 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_18744(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  Swift::Int v31 = __src;
  uint64_t v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v19 = &v4[16 * v13];
      uint64_t v29 = v19;
      Swift::Int v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        int v20 = (char *)(a3 - 16);
        Swift::Int v21 = v6;
        while (1)
        {
          uint64_t v22 = v20 + 16;
          uint64_t v23 = *((void *)v19 - 2);
          uint64_t v24 = *((void *)v19 - 1);
          uint64_t v25 = *((void *)v21 - 2);
          uint64_t v26 = *((void *)v21 - 1);
          v21 -= 16;
          BOOL v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1LL) & 1) == 0)
          {
            uint64_t v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19) {
              *(_OWORD *)int v20 = *((_OWORD *)v19 - 1);
            }
            Swift::Int v21 = v6;
            v19 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v22 != v6 || v20 >= v6) {
              *(_OWORD *)int v20 = *(_OWORD *)v21;
            }
            Swift::Int v31 = v21;
            if (v21 <= v7) {
              goto LABEL_50;
            }
          }

          v20 -= 16;
          uint64_t v6 = v21;
          if (v19 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v29 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        uint64_t v15 = *((void *)v6 + 1);
        uint64_t v16 = *((void *)v4 + 1);
        BOOL v17 = *(void *)v6 == *(void *)v4 && v15 == v16;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v15, *(void *)v4, v16, 1LL) & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v30 = v4;
          uint64_t v18 = v6;
        }

        else
        {
          uint64_t v18 = v6 + 16;
          if (v7 < v6 || v7 >= v18 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v18;
      }

      while ((unint64_t)v18 < a3);
      Swift::Int v31 = v7;
    }

LABEL_50:
    sub_18C98((void **)&v31, (const void **)&v30, &v29);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_189DC(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BC0(&qword_3A200);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_18AD4(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -40)
  {
    char v7 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v7,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 40 * (v4 / 40);
    if (result != v3 || result >= &v3[v6]) {
      return (char *)memmove(result, v3, v6);
    }
  }

  return result;
}

uint64_t sub_18B88(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_5BC0(&qword_399F0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72LL);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000LL && v7 == -1) {
    goto LABEL_14;
  }
  uint64_t v10 = v8 / v7;
  if (v8 / v7 < 0)
  {
LABEL_15:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
    __break(1u);
    return result;
  }

  if (v3 < v4 || v3 >= v4 + v10 * v7) {
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v10, result);
  }
  if (v3 != v4) {
    return swift_arrayInitWithTakeBackToFront(v3);
  }
  return result;
}

char *sub_18C98(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

uint64_t sub_18D40(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72LL);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000LL && v7 == -1) {
    goto LABEL_14;
  }
  uint64_t v10 = v8 / v7;
  if (v8 / v7 < 0)
  {
LABEL_15:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
    __break(1u);
    return result;
  }

  if (v3 < v4 || v3 >= v4 + v10 * v7) {
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v10, result);
  }
  if (v3 != v4) {
    return swift_arrayInitWithTakeBackToFront(v3);
  }
  return result;
}

char *sub_18E4C(uint64_t a1)
{
  return sub_189DC(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_18E60(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    swift_release(a4);
    return &_swiftEmptySetSingleton;
  }

  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return (void *)a4;
  }
  sub_5BC0(&qword_3A220);
  uint64_t result = (void *)static _SetStorage.allocate(capacity:)(v5);
  uint64_t v6 = (uint64_t)result;
  if (a2 < 1) {
    unint64_t v10 = 0LL;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v11 << 6);
    }

    else
    {
      uint64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        goto LABEL_30;
      }
      if (v14 >= a2)
      {
LABEL_27:
        swift_release(a4);
        return (void *)v6;
      }

      unint64_t v15 = a1[v14];
      ++v11;
      if (!v15)
      {
        uint64_t v11 = v14 + 1;
        if (v14 + 1 >= a2) {
          goto LABEL_27;
        }
        unint64_t v15 = a1[v11];
        if (!v15)
        {
          uint64_t v11 = v14 + 2;
          if (v14 + 2 >= a2) {
            goto LABEL_27;
          }
          unint64_t v15 = a1[v11];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= a2) {
              goto LABEL_27;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1LL)) {
                  goto LABEL_31;
                }
                if (v11 >= a2) {
                  goto LABEL_27;
                }
                unint64_t v15 = a1[v11];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v11 = v16;
          }
        }
      }

Swift::Int sub_18FE4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_5BC0(&qword_3A1E8);
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

LABEL_40:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

Swift::Int sub_19278(uint64_t isStackAllocationSafe)
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
    bzero((char *)&v12 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0LL), v7);
    Swift::Int v8 = sub_193D4((Swift::Int)&v12 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0LL), v6, v2);
    uint64_t v9 = swift_release(v2);
    if (v1) {
      swift_willThrow(v9);
    }
  }

  else
  {
    uint64_t v10 = (void *)swift_slowAlloc(v7, -1LL);
    bzero(v10, v7);
    Swift::Int v8 = sub_193D4((Swift::Int)v10, v6, v2);
    swift_release(v2);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return v8;
}

Swift::Int sub_193D4(Swift::Int result, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t *)result;
  uint64_t v6 = 0LL;
  int64_t v7 = 0LL;
  uint64_t v8 = a3 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v10 = -1LL;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v14 = v13 | (v7 << 6);
LABEL_5:
    unint64_t v15 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v14);
    uint64_t v17 = *v15;
    unint64_t v16 = v15[1];
    uint64_t v18 = v17 & 0xFFFFFFFFFFFFLL;
    if ((v16 & 0x2000000000000000LL) != 0) {
      uint64_t v19 = HIBYTE(v16) & 0xF;
    }
    else {
      uint64_t v19 = v18;
    }
    if (v19)
    {
      *(void *)(result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      if (__OFADD__(v6++, 1LL))
      {
        __break(1u);
LABEL_27:
        swift_retain(a3);
        return sub_18FE4(v5, a2, v6, a3);
      }
    }
  }

  int64_t v20 = v7 + 1;
  if (__OFADD__(v7, 1LL))
  {
    __break(1u);
    goto LABEL_29;
  }

  if (v20 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v20);
  ++v7;
  if (v21) {
    goto LABEL_23;
  }
  int64_t v7 = v20 + 1;
  if (v20 + 1 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v7);
  if (v21) {
    goto LABEL_23;
  }
  int64_t v7 = v20 + 2;
  if (v20 + 2 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v7);
  if (v21)
  {
LABEL_23:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v14 = __clz(__rbit64(v21)) + (v7 << 6);
    goto LABEL_5;
  }

  int64_t v22 = v20 + 3;
  if (v22 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v22);
  if (v21)
  {
    int64_t v7 = v22;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v7 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_27;
    }
    unint64_t v21 = *(void *)(v8 + 8 * v7);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }

LABEL_29:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ItemSequenceData(uint64_t a1)
{
  uint64_t result = qword_3A288;
  if (!qword_3A288) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ItemSequenceData);
  }
  return result;
}

void *sub_19594(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_195B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc(dword_3A12C);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_1B52C;
  v8[4] = a3;
  v8[5] = v3;
  v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch(sub_17D10, 0LL, 0LL);
}

uint64_t sub_1962C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_19650(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  int64_t v7 = (void *)swift_task_alloc(dword_3A13C);
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = sub_196D0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_3A138 + dword_3A138))(a1, a2, v6);
}

uint64_t sub_196D0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5BC0(&qword_3A108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_19760(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_19798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ItemSequenceData(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_197DC(unint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
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
        sub_1AE0C(&qword_3A1D0, &qword_3A1C8, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_5BC0(&qword_3A1C8);
          unint64_t v13 = sub_2BA5C(v18, i, a3);
          uint64_t v15 = *v14;
          swift_retain(*v14);
          ((void (*)(uint64_t **, void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

LABEL_26:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

        uint64_t v9 = (v19 - 1) & v19;
        uint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      unint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      int64_t v22 = *v21;
      unint64_t v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      uint64_t result = Hasher._finalize()();
      char v24 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v25 = result & ~v24;
      BOOL v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
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
            BOOL v26 = 0LL;
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

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

        uint64_t v9 = (v17 - 1) & v17;
        uint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }

      uint64_t v38 = *(_OWORD *)(*(void *)(v3 + 48) + 16 * v15);
      Hasher.init(_seed:)(v39, *(void *)(v6 + 40));
      Hasher._combine(_:)(*(void *)(v38 + 16));
      uint64_t v19 = *(void *)(v38 + 16);
      if (v19)
      {
        swift_bridgeObjectRetain(v38);
        int64_t v20 = (void *)(v38 + 40);
        do
        {
          unint64_t v21 = *(v20 - 1);
          int64_t v22 = *v20;
          swift_bridgeObjectRetain(*v20);
          String.hash(into:)(v39, v21, v22);
          swift_bridgeObjectRelease(v22);
          v20 += 2;
          --v19;
        }

        while (v19);
        swift_bridgeObjectRelease(v38);
      }

      Hasher._combine(_:)(*(void *)(*((void *)&v38 + 1) + 16LL));
      unint64_t v23 = *(void *)(*((void *)&v38 + 1) + 16LL);
      if (v23)
      {
        swift_bridgeObjectRetain(*((void *)&v38 + 1));
        char v24 = (void *)(*((void *)&v38 + 1) + 40LL);
        do
        {
          unint64_t v25 = *(v24 - 1);
          BOOL v26 = *v24;
          swift_bridgeObjectRetain(*v24);
          String.hash(into:)(v39, v25, v26);
          swift_bridgeObjectRelease(v26);
          v24 += 2;
          --v23;
        }

        while (v23);
        swift_bridgeObjectRelease(*((void *)&v38 + 1));
      }

      uint64_t result = Hasher._finalize()();
      uint64_t v27 = -1LL << *(_BYTE *)(v6 + 32);
      uint64_t v28 = result & ~v27;
      uint64_t v29 = v28 >> 6;
      if (((-1LL << v28) & ~*(void *)(v10 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1LL << v28) & ~*(void *)(v10 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v30 = 0;
        Swift::Int v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_49;
          }

          Swift::Int v32 = v29 == v31;
          if (v29 == v31) {
            uint64_t v29 = 0LL;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v10 + 8 * v29);
        }

        while (v33 == -1);
        unint64_t v13 = __clz(__rbit64(~v33)) + (v29 << 6);
      }

      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v13;
      *(_OWORD *)(*(void *)(v6 + 48) + 16 * v13) = v38;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

          uint64_t v28 = v19[2];
          if (v28 == a2[2])
          {
            if (v28) {
              uint64_t v29 = v19 == a2;
            }
            else {
              uint64_t v29 = 1;
            }
            if (v29) {
              goto LABEL_64;
            }
            uint64_t v30 = v19[4];
            Swift::Int v31 = v19[5];
            Swift::Int v32 = a2[4];
            uint64_t v33 = a2[5];
            uint64_t v34 = v30 == v32 && v31 == v33;
            if (v34
              || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v30, v31, v32, v33, 0LL), (result & 1) != 0))
            {
              if (v28 == 1) {
                goto LABEL_64;
              }
              uint64_t v35 = v19[6];
              Swift::Int v36 = v19[7];
              uint64_t v37 = a2[6];
              uint64_t v38 = a2[7];
              uint64_t v39 = v35 == v37 && v36 == v38;
              if (v39
                || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v36, v37, v38, 0LL), (result & 1) != 0))
              {
                uint64_t v40 = v28 - 2;
                if (!v40) {
                  goto LABEL_64;
                }
                Swift::Int v41 = v19 + 9;
                uint64_t v42 = a2 + 9;
                while (1)
                {
                  uint64_t v43 = *(v41 - 1);
                  uint64_t v44 = *v41;
                  BOOL v45 = *(v42 - 1);
                  unint64_t v46 = *v42;
                  if (v43 != v45 || v44 != v46)
                  {
                    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v44, v45, v46, 0LL);
                    if ((result & 1) == 0) {
                      break;
                    }
                  }

                  v41 += 2;
                  v42 += 2;
                  if (!--v40) {
                    goto LABEL_64;
                  }
                }
              }
            }
          }
        }

    uint64_t v10 = (v19 - 1) & v19;
    uint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    unint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    int64_t v22 = *v21;
    unint64_t v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    uint64_t result = Hasher._finalize()();
    char v24 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v25 = result & ~v24;
    BOOL v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
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
          BOOL v26 = 0LL;
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
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  uint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    unint64_t v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    unint64_t v13 = v20 + 1;
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

    uint64_t v9 = (v17 - 1) & v17;
    uint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_27:
    Swift::Int v41 = *(_OWORD *)(*(void *)(v3 + 48) + 16 * v15);
    Hasher.init(_seed:)(v42, *(void *)(v6 + 40));
    Hasher._combine(_:)(*(void *)(v41 + 16));
    uint64_t v19 = *(void *)(v41 + 16);
    if (v19)
    {
      uint64_t v40 = v9;
      int64_t v20 = v6;
      unint64_t v21 = v12;
      int64_t v22 = v3;
      swift_bridgeObjectRetain_n(v41, 2LL);
      swift_bridgeObjectRetain(*((void *)&v41 + 1));
      unint64_t v23 = (void *)(v41 + 40);
      do
      {
        char v24 = *(v23 - 1);
        unint64_t v25 = *v23;
        swift_bridgeObjectRetain(*v23);
        String.hash(into:)(v42, v24, v25);
        swift_bridgeObjectRelease(v25);
        v23 += 2;
        --v19;
      }

      while (v19);
      swift_bridgeObjectRelease(v41);
      uint64_t v3 = v22;
      int64_t v12 = v21;
      unint64_t v6 = v20;
      uint64_t v9 = v40;
    }

    else
    {
      swift_bridgeObjectRetain(v41);
      swift_bridgeObjectRetain(*((void *)&v41 + 1));
    }

    Hasher._combine(_:)(*(void *)(*((void *)&v41 + 1) + 16LL));
    BOOL v26 = *(void *)(*((void *)&v41 + 1) + 16LL);
    if (v26)
    {
      swift_bridgeObjectRetain(*((void *)&v41 + 1));
      uint64_t v27 = (void *)(*((void *)&v41 + 1) + 40LL);
      do
      {
        uint64_t v28 = *(v27 - 1);
        uint64_t v29 = *v27;
        swift_bridgeObjectRetain(*v27);
        String.hash(into:)(v42, v28, v29);
        swift_bridgeObjectRelease(v29);
        v27 += 2;
        --v26;
      }

      while (v26);
      swift_bridgeObjectRelease(*((void *)&v41 + 1));
    }

    uint64_t result = Hasher._finalize()();
    uint64_t v30 = -1LL << *(_BYTE *)(v6 + 32);
    Swift::Int v31 = result & ~v30;
    Swift::Int v32 = v31 >> 6;
    if (((-1LL << v31) & ~*(void *)(v10 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1LL << v31) & ~*(void *)(v10 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0LL;
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
          goto LABEL_48;
        }

        uint64_t v35 = v32 == v34;
        if (v32 == v34) {
          Swift::Int v32 = 0LL;
        }
        v33 |= v35;
        Swift::Int v36 = *(void *)(v10 + 8 * v32);
      }

      while (v36 == -1);
      unint64_t v13 = __clz(__rbit64(~v36)) + (v32 << 6);
    }

    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v13;
    *(_OWORD *)(*(void *)(v6 + 48) + 16 * v13) = v41;
    ++*(void *)(v6 + 16);
  }

  uint64_t v18 = v16 + 3;
  if (v18 >= v39)
  {
LABEL_45:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v37;
    goto LABEL_47;
  }

  uint64_t v17 = *(void *)(v38 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v12 >= v39) {
      goto LABEL_45;
    }
    uint64_t v17 = *(void *)(v38 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_26;
    }
  }

uint64_t sub_199E8(uint64_t a1)
{
  return sub_27B9C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_199FC(void *a1)
{
  return sub_27E6C(0, a1[2], 0, a1);
}

uint64_t sub_19A10(uint64_t a1)
{
  return sub_281CC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_19A24(void *a1)
{
  return sub_287AC(0, a1[2], 0, a1);
}

uint64_t sub_19A38(uint64_t a1)
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

  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3LL;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

int64_t sub_19AD8(int64_t result, int a2, char a3, uint64_t a4)
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
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }

  return result;
}

void *sub_19BBC(uint64_t a1)
{
  unint64_t v1 = &_swiftEmptySetSingleton;
  uint64_t v59 = &_swiftEmptySetSingleton;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    uint64_t v4 = 0LL;
    uint64_t v52 = v3;
    uint64_t v54 = v2;
    while (1)
    {
      sub_1AD00(v3 + 40 * v4, (uint64_t)v58);
      uint64_t v5 = sub_5BC0(&qword_3A1A8);
      uint64_t v6 = sub_5BC0(&qword_3A1F8);
      uint64_t v7 = swift_dynamicCast(&v57, v58, v5, v6, 6LL);
      if (!(_DWORD)v7) {
        goto LABEL_4;
      }
      uint64_t v56 = v57;
      TypedNamedFeature.value.getter(v58, v7);
      uint64_t v8 = v58[0];
      int64_t v9 = *(void *)(v58[0] + 16);
      if (v9) {
        break;
      }
      swift_bridgeObjectRelease(v58[0]);
      unint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v15 = _swiftEmptyArrayStorage[2];
      if (v15) {
        goto LABEL_14;
      }
LABEL_3:
      swift_release(v56);
      swift_bridgeObjectRelease(v10);
LABEL_4:
      if (++v4 == v2)
      {
        swift_bridgeObjectRelease(a1);
        unint64_t v1 = v59;
        goto LABEL_18;
      }
    }

    uint64_t v57 = _swiftEmptyArrayStorage;
    sub_278D8(0, v9, 0);
    unint64_t v10 = v57;
    uint64_t v11 = v8 + 40;
    do
    {
      Swift::String v12 = String.lowercased()();
      uint64_t v57 = v10;
      unint64_t v14 = v10[2];
      unint64_t v13 = v10[3];
      if (v14 >= v13 >> 1)
      {
        sub_278D8(v13 > 1, v14 + 1, 1);
        unint64_t v10 = v57;
      }

      v11 += 16LL;
      v10[2] = v14 + 1;
      *(Swift::String *)&v10[2 * v14 + 4] = v12;
      --v9;
    }

    while (v9);
    swift_bridgeObjectRelease(v8);
    uint64_t v3 = v52;
    uint64_t v2 = v54;
    uint64_t v15 = v10[2];
    if (!v15) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v16 = v10 + 5;
    do
    {
      uint64_t v17 = *(v16 - 1);
      uint64_t v18 = *v16;
      swift_bridgeObjectRetain(*v16);
      sub_293A4(v58, v17, v18);
      swift_bridgeObjectRelease(v58[1]);
      v16 += 2;
      --v15;
    }

    while (v15);
    goto LABEL_3;
  }

LABEL_18:
  swift_bridgeObjectRetain_n(v1, 2LL);
  uint64_t v19 = sub_219D0((uint64_t)v1);
  swift_bridgeObjectRelease(v1);
  v58[0] = (uint64_t)v19;
  sub_17F28(v58);
  swift_bridgeObjectRelease(v1);
  uint64_t v20 = v58[0];
  uint64_t v21 = sub_5BC0(&qword_39EC0);
  uint64_t v22 = sub_1AE0C((unint64_t *)&qword_39EC8, &qword_39EC0, (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v23 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v21, v22);
  uint64_t v25 = v24;
  swift_release(v20);
  BOOL v26 = sub_20608(0LL, 1LL, 1, _swiftEmptyArrayStorage);
  unint64_t v28 = v26[2];
  unint64_t v27 = v26[3];
  unint64_t v29 = v28 + 1;
  if (v28 >= v27 >> 1) {
    BOOL v26 = sub_20608((void *)(v27 > 1), v28 + 1, 1, v26);
  }
  v26[2] = v29;
  uint64_t v30 = &v26[2 * v28];
  v30[4] = v23;
  v30[5] = v25;
  swift_bridgeObjectRetain(v26);
  uint64_t v55 = v26;
  Swift::Int v31 = v26 + 5;
  Swift::Int v32 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v36 = *(v31 - 1);
    uint64_t v37 = *v31;
    uint64_t v38 = HIBYTE(*v31) & 0xFLL;
    if ((*v31 & 0x2000000000000000LL) == 0) {
      uint64_t v38 = v36 & 0xFFFFFFFFFFFFLL;
    }
    if (v38)
    {
      swift_bridgeObjectRetain(*v31);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v32);
      v58[0] = (uint64_t)v32;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_278D8(0, v32[2] + 1LL, 1);
        Swift::Int v32 = (void *)v58[0];
      }

      unint64_t v34 = v32[2];
      unint64_t v33 = v32[3];
      if (v34 >= v33 >> 1)
      {
        sub_278D8(v33 > 1, v34 + 1, 1);
        Swift::Int v32 = (void *)v58[0];
      }

      v32[2] = v34 + 1;
      uint64_t v35 = &v32[2 * v34];
      v35[4] = v36;
      v35[5] = v37;
    }

    v31 += 2;
    --v29;
  }

  while (v29);
  swift_bridgeObjectRelease(v55);
  int64_t v40 = v32[2];
  if (v40)
  {
    uint64_t v53 = v1;
    v58[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_278BC(0, v40, 0);
    uint64_t v41 = v58[0];
    uint64_t v42 = v32 + 5;
    do
    {
      uint64_t v43 = *(v42 - 1);
      uint64_t v44 = *v42;
      uint64_t v45 = sub_5BC0(&qword_3A1B8);
      uint64_t v46 = swift_allocObject(v45, 48LL, 7LL);
      *(_OWORD *)(v46 + 16) = xmmword_2D970;
      *(void *)(v46 + 3sub_1AD44(v0 + 2) = v43;
      *(void *)(v46 + 40) = v44;
      v58[0] = v41;
      unint64_t v48 = *(void *)(v41 + 16);
      unint64_t v47 = *(void *)(v41 + 24);
      swift_bridgeObjectRetain(v44);
      if (v48 >= v47 >> 1)
      {
        sub_278BC(v47 > 1, v48 + 1, 1);
        uint64_t v41 = v58[0];
      }

      v42 += 2;
      *(void *)(v41 + 16) = v48 + 1;
      uint64_t v49 = v41 + 24 * v48;
      *(void *)(v49 + 3sub_1AD44(v0 + 2) = v46;
      *(void *)(v49 + 40) = 0LL;
      *(_BYTE *)(v49 + 48) = 1;
      *(_WORD *)(v49 + 49) = 3328;
      --v40;
    }

    while (v40);
    swift_bridgeObjectRelease(v55);
    swift_bridgeObjectRelease(v53);
    swift_release(v32);
  }

  else
  {
    swift_bridgeObjectRelease(v55);
    swift_bridgeObjectRelease(v1);
    swift_release(v32);
    return _swiftEmptyArrayStorage;
  }

  return (void *)v41;
}

  uint64_t v23 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v23 + 48) + 8 * asub_1AD44(v0 + 2) = v6;
  uint64_t v24 = *(void *)(v23 + 16);
  uint64_t v25 = __OFADD__(v24, 1LL);
  BOOL v26 = v24 + 1;
  if (v25)
  {
    __break(1u);
    JUMPOUT(0x2A808LL);
  }

  *(void *)(v23 + 16) = v26;
  return result;
}

uint64_t sub_1A090(uint64_t result)
{
  unint64_t v1 = 0LL;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 24;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v4 + 1;
  uint64_t v6 = v3 + 32 * v1;
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v5 == ++v1) {
      break;
    }
    uint64_t v7 = (_BYTE *)(v6 + 32);
    uint64_t v9 = *(void *)(v6 + 8);
    unint64_t v8 = *(void *)(v6 + 16);
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFLL;
    if ((v8 & 0x2000000000000000LL) != 0) {
      uint64_t v10 = HIBYTE(v8) & 0xF;
    }
    v6 += 32LL;
    if (v10)
    {
      uint64_t v11 = *((void *)v7 - 1);
      char v15 = *v7;
      swift_bridgeObjectRetain(v8);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage);
      if ((result & 1) == 0) {
        uint64_t result = sub_278F4(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        uint64_t result = sub_278F4(v12 > 1, v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      unint64_t v14 = &_swiftEmptyArrayStorage[4 * v13];
      v14[4] = v9;
      v14[5] = v8;
      v14[6] = v11;
      *((_BYTE *)v14 + 56) = v15;
      goto LABEL_2;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_1A1CC(uint64_t result)
{
  unint64_t v1 = 0LL;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 40;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v4 + 1;
  uint64_t v6 = (uint64_t *)(v3 + 24 * v1);
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v5 == ++v1) {
      break;
    }
    uint64_t v7 = v6 + 3;
    uint64_t v9 = *(v6 - 1);
    uint64_t v8 = *v6;
    uint64_t v10 = HIBYTE(*v6) & 0xF;
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
    if ((v8 & 0x2000000000000000LL) != 0) {
      uint64_t v11 = v10;
    }
    uint64_t v6 = v7;
    if (v11)
    {
      uint64_t v16 = v3;
      char v12 = *((_BYTE *)v7 - 16);
      swift_bridgeObjectRetain(v8);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage);
      if ((result & 1) == 0) {
        uint64_t result = sub_27910(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
      }
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      unint64_t v13 = _swiftEmptyArrayStorage[3];
      if (v14 >= v13 >> 1) {
        uint64_t result = sub_27910(v13 > 1, v14 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v14 + 1;
      char v15 = &_swiftEmptyArrayStorage[3 * v14];
      v15[4] = v9;
      v15[5] = v8;
      *((_BYTE *)v15 + 48) = v12;
      uint64_t v3 = v16;
      goto LABEL_2;
    }
  }

  __break(1u);
  return result;
}

void *sub_1A300(uint64_t a1)
{
  uint64_t v39 = &_swiftEmptySetSingleton;
  uint64_t v2 = sub_12B50(a1, (uint64_t (*)(void))&type metadata accessor for UEISaidDialogIdentifier);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(v2 + 16);
    if (v4)
    {
      unint64_t v5 = (uint64_t *)(v2 + 40);
      do
      {
        uint64_t v6 = *(v5 - 1);
        uint64_t v7 = *v5;
        swift_bridgeObjectRetain(*v5);
        sub_293A4((uint64_t *)&v37, v6, v7);
        swift_bridgeObjectRelease(v38);
        v5 += 2;
        --v4;
      }

      while (v4);
    }

    swift_bridgeObjectRelease(v3);
  }

  uint64_t v8 = sub_12B50(a1, (uint64_t (*)(void))&type metadata accessor for UEIShownDialogIdentifier);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 + 16);
    if (v10)
    {
      uint64_t v11 = (uint64_t *)(v8 + 40);
      do
      {
        uint64_t v12 = *(v11 - 1);
        uint64_t v13 = *v11;
        swift_bridgeObjectRetain(*v11);
        sub_293A4((uint64_t *)&v37, v12, v13);
        swift_bridgeObjectRelease(v38);
        v11 += 2;
        --v10;
      }

      while (v10);
    }

    swift_bridgeObjectRelease(v9);
  }

  unint64_t v14 = v39;
  uint64_t v15 = swift_bridgeObjectRetain(v39);
  Swift::Int v16 = sub_19278(v15);
  int64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v35 = v14;
    uint64_t v37 = _swiftEmptyArrayStorage;
    sub_278BC(0, v17, 0);
    uint64_t v18 = v37;
    uint64_t result = (void *)sub_19A38(v16);
    int64_t v20 = (int64_t)result;
    int v22 = v21;
    char v24 = v23 & 1;
    while ((v20 & 0x8000000000000000LL) == 0 && v20 < 1LL << *(_BYTE *)(v16 + 32))
    {
      if (*(_DWORD *)(v16 + 36) != v22) {
        goto LABEL_25;
      }
      char v36 = v24;
      uint64_t v25 = (uint64_t *)(*(void *)(v16 + 48) + 16 * v20);
      uint64_t v27 = *v25;
      uint64_t v26 = v25[1];
      uint64_t v28 = sub_5BC0(&qword_3A1B8);
      uint64_t v29 = swift_allocObject(v28, 48LL, 7LL);
      *(_OWORD *)(v29 + 16) = xmmword_2D970;
      *(void *)(v29 + 3sub_1AD44(v0 + 2) = v27;
      *(void *)(v29 + 40) = v26;
      uint64_t v37 = v18;
      unint64_t v31 = v18[2];
      unint64_t v30 = v18[3];
      swift_bridgeObjectRetain(v26);
      if (v31 >= v30 >> 1)
      {
        sub_278BC(v30 > 1, v31 + 1, 1);
        uint64_t v18 = v37;
      }

      _OWORD v18[2] = v31 + 1;
      Swift::Int v32 = &v18[3 * v31];
      v32[4] = v29;
      v32[5] = 0LL;
      *((_BYTE *)v32 + 48) = 1;
      *(_WORD *)((char *)v32 + 49) = 3328;
      uint64_t result = (void *)sub_19AD8(v20, v22, v36 & 1, v16);
      int64_t v20 = (int64_t)result;
      int v22 = v33;
      char v24 = v34 & 1;
      if (!--v17)
      {
        sub_1ADBC((uint64_t)result, v33, v24);
        swift_bridgeObjectRelease(v35);
        swift_release(v16);
        return v18;
      }
    }

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRelease(v14);
    swift_release(v16);
    return _swiftEmptyArrayStorage;
  }

  return result;
}

uint64_t sub_1A5C4(uint64_t a1)
{
  uint64_t result = sub_12B50(a1, (uint64_t (*)(void))&type metadata accessor for ASRBestRawRecognitionUtterance);
  if (!result) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = result;
  uint64_t v57 = *(void *)(result + 16);
  if (!v57)
  {
    swift_bridgeObjectRelease(result);
    return (uint64_t)_swiftEmptyArrayStorage;
  }

  unint64_t v3 = 0LL;
  uint64_t v55 = result + 32;
  uint64_t v4 = _swiftEmptyArrayStorage;
  uint64_t v53 = result;
  do
  {
    if (v3 >= *(void *)(v2 + 16))
    {
      __break(1u);
      return result;
    }

    unint64_t v5 = (void *)(v55 + 16 * v3);
    uint64_t v6 = (void *)*v5;
    uint64_t v7 = v5[1];
    uint64_t v8 = qword_39720;
    swift_bridgeObjectRetain(v7);
    if (v8 != -1) {
      swift_once(&qword_39720, sub_13344);
    }
    ++v3;
    uint64_t v9 = off_39F80;
    uint64_t v10 = *(void *)((char *)&dword_10 + (void)off_39F80);
    if (v10)
    {
      uint64_t v11 = v4;
      unint64_t v12 = sub_1ADC8();
      swift_bridgeObjectRetain(v9);
      uint64_t v13 = (uint64_t *)(v9 + 10);
      while (1)
      {
        uint64_t v15 = *(v13 - 1);
        uint64_t v14 = *v13;
        uint64_t v64 = v6;
        uint64_t v65 = v7;
        uint64_t v62 = v15;
        uint64_t v63 = v14;
        if ((StringProtocol.contains<A>(_:)(&v62, &type metadata for String, &type metadata for String, v12, v12) & 1) != 0) {
          break;
        }
        v13 += 2;
        if (!--v10)
        {
          swift_bridgeObjectRelease(v7);
          uint64_t result = swift_bridgeObjectRelease(v9);
          uint64_t v4 = v11;
          uint64_t v2 = v53;
          goto LABEL_5;
        }
      }

      swift_bridgeObjectRelease(v9);
      uint64_t v4 = v11;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v11);
      v60[0] = v11;
      if ((result & 1) == 0)
      {
        uint64_t result = sub_278D8(0, v11[2] + 1LL, 1);
        uint64_t v4 = (void *)v60[0];
      }

      uint64_t v2 = v53;
      unint64_t v17 = v4[2];
      unint64_t v16 = v4[3];
      if (v17 >= v16 >> 1)
      {
        uint64_t result = sub_278D8(v16 > 1, v17 + 1, 1);
        uint64_t v4 = (void *)v60[0];
      }

      v4[2] = v17 + 1;
      uint64_t v18 = &v4[2 * v17];
      v18[4] = v6;
      v18[5] = v7;
    }

    else
    {
      uint64_t result = swift_bridgeObjectRelease(v7);
    }

void *sub_1AA5C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    int64_t v19 = _swiftEmptyArrayStorage;
    sub_278F4(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      sub_13474(v5, (uint64_t)v17);
      uint64_t v7 = v17[0];
      uint64_t v8 = v17[1];
      uint64_t v9 = v17[2];
      char v10 = v18;
      int64_t v19 = v2;
      unint64_t v12 = v2[2];
      unint64_t v11 = v2[3];
      if (v12 >= v11 >> 1)
      {
        sub_278F4(v11 > 1, v12 + 1, 1);
        uint64_t v2 = v19;
      }

      v2[2] = v12 + 1;
      uint64_t v13 = &v2[4 * v12];
      v13[4] = v7;
      v13[5] = v8;
      v13[6] = v9;
      *((_BYTE *)v13 + 56) = v10;
      v5 += v6;
      --v1;
    }

    while (v1);
  }

  uint64_t v14 = sub_1A090((uint64_t)v2);
  swift_bridgeObjectRelease(v2);
  uint64_t v15 = sub_12608(v14);
  swift_bridgeObjectRelease(v14);
  return v15;
}

void *sub_1AB98(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    char v18 = _swiftEmptyArrayStorage;
    sub_27910(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      sub_136B8(v5, (uint64_t)v16);
      uint64_t v7 = v16[0];
      uint64_t v8 = v16[1];
      char v9 = v17;
      char v18 = v2;
      unint64_t v11 = v2[2];
      unint64_t v10 = v2[3];
      if (v11 >= v10 >> 1)
      {
        sub_27910(v10 > 1, v11 + 1, 1);
        uint64_t v2 = v18;
      }

      v2[2] = v11 + 1;
      unint64_t v12 = &v2[3 * v11];
      v12[4] = v7;
      v12[5] = v8;
      *((_BYTE *)v12 + 48) = v9;
      v5 += v6;
      --v1;
    }

    while (v1);
  }

  uint64_t v13 = sub_1A1CC((uint64_t)v2);
  swift_bridgeObjectRelease(v2);
  uint64_t v14 = sub_12734(v13);
  swift_bridgeObjectRelease(v13);
  return v14;
}

void sub_1ACC8(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1ACE4(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_1AD00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 3sub_1AD44(v0 + 2) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1AD44(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1AD64(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 3sub_1AD44(v0 + 2) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1AD7C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1ADBC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

unint64_t sub_1ADC8()
{
  unint64_t result = qword_3A1F0;
  if (!qword_3A1F0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_3A1F0);
  }

  return result;
}

uint64_t sub_1AE0C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_CEB0(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1AE50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ItemSequenceData(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AE94(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ItemSequenceData(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_1AED0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v7 = (void *)*v4;
  int64_t v8 = *(void *)(*v4 + 16LL);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)result || v9 > v7[3] >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      uint64_t result = sub_20848(result, v13, 1, v7);
      uint64_t v7 = result;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }

    goto LABEL_22;
  }

LABEL_12:
  uint64_t v14 = v7[2];
  if ((v7[3] >> 1) - v14 < v6) {
    goto LABEL_25;
  }
  if (v6 < 0)
  {
LABEL_27:
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_28;
  }

  uint64_t v15 = (char *)&v7[v14 + 4];
  unint64_t v16 = (char *)(a2 + 8 * a3);
  if (v16 >= &v15[8 * v6] || v15 >= &v16[8 * v6])
  {
    uint64_t result = memcpy(v15, v16, 8 * v6);
    if (!v6)
    {
LABEL_22:
      *uint64_t v4 = v7;
      return result;
    }

    uint64_t v18 = v7[2];
    BOOL v19 = __OFADD__(v18, v6);
    uint64_t v20 = v18 + v6;
    if (!v19)
    {
      v7[2] = v20;
      goto LABEL_22;
    }

    goto LABEL_26;
  }

  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t *sub_1B064(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v5 = (uint64_t *)(v4 + ((v3 + 16LL) & ~(unint64_t)v3));
    swift_retain(v4);
  }

  else
  {
    unint64_t v5 = a1;
    uint64_t v6 = a2[1];
    uint64_t v7 = (void *)a2[2];
    a1[1] = v6;
    a1[2] = (uint64_t)v7;
    uint64_t v8 = *(int *)(a3 + 28);
    int64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date(0LL);
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v6);
    id v13 = v7;
    v12(v9, v10, v11);
  }

  return v5;
}

uint64_t sub_1B118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t *sub_1B170(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = (void *)a2[2];
  a1[2] = (uint64_t)v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  int64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  id v12 = v6;
  v11(v8, v9, v10);
  return a1;
}

uint64_t *sub_1B1FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[1];
  uint64_t v9 = a1[1];
  a1[1] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = (void *)a1[2];
  uint64_t v11 = (void *)a2[2];
  a1[2] = (uint64_t)v11;
  id v12 = v11;

  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24LL))(v14, v15, v16);
  return a1;
}

uint64_t sub_1B29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

uint64_t *sub_1B300(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40LL))(v10, v11, v12);
  return a1;
}

uint64_t sub_1B38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1B398);
}

uint64_t sub_1B398(char *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for Date(0LL);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( &a1[*(int *)(a3 + 28)],  a2,  v8);
  }

uint64_t sub_1B414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1B420);
}

char *sub_1B420(char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)uint64_t result = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Date(0LL);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( &v5[*(int *)(a4 + 28)],  a2,  a2,  v7);
  }

  return result;
}

uint64_t sub_1B494(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[2] = "\b";
  uint64_t result = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void sub_1B518(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_1B530(uint64_t a1)
{
  return sub_1B578(a1, qword_3AB98, 0xD000000000000011LL, 0x800000000002F570LL);
}

uint64_t sub_1B554(uint64_t a1)
{
  return sub_1B578(a1, qword_3ABB0, 0xD000000000000012LL, 0x800000000002F550LL);
}

uint64_t sub_1B578(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_1B9C0(v7, a2);
  sub_D710(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000013LL, 0x800000000002F530LL, a3, a4);
}

uint64_t sub_1B5EC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSSignposter(0LL);
  sub_1B9C0(v4, qword_3ABC8);
  sub_D710(v4, (uint64_t)qword_3ABC8);
  if (qword_39738 != -1) {
    swift_once(&qword_39738, sub_1B554);
  }
  uint64_t v5 = sub_D710(v0, (uint64_t)qword_3ABB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

void sub_1B6D4()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_3ABE0 = v2;
}

uint64_t sub_1B760(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if (qword_39748 != -1) {
    swift_once(&qword_39748, sub_1B6D4);
  }
  int v11 = byte_3ABE0;
  uint64_t v12 = (void *)OSSignposter.logHandle.getter();
  os_signpost_type_t v13 = static os_signpost_type_t.begin.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if (v11 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
LABEL_24:
      uint64_t v20 = type metadata accessor for OSSignpostIntervalState(0LL);
      swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
      return OSSignpostIntervalState.init(id:isOpen:)(v10, 1LL);
    }

    if ((a3 & 1) != 0)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }

      if (a1 >> 11 == 27)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }

      a1 = v21;
    }

    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }

    uint64_t v15 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
    v15(v10, a4, v7);
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = OSSignpostID.rawValue.getter();
    os_signpost_type_t v18 = v13;
    BOOL v19 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_0, (os_log_t)v12, v18, v17, a1, v19, v16, 2u);
    swift_slowDealloc(v16, -1LL, -1LL);

    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
    v15(v10, a4, v7);
    goto LABEL_24;
  }

LABEL_8:
  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }

    goto LABEL_22;
  }

  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v22;
LABEL_22:
      uint64_t v15 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
      v15(v10, a4, v7);
      uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v16 = 0;
      os_signpost_id_t v17 = OSSignpostID.rawValue.getter();
      os_signpost_type_t v18 = v13;
      BOOL v19 = "enableTelemetry=YES";
      goto LABEL_23;
    }

    goto LABEL_28;
  }

uint64_t *sub_1B9C0(uint64_t a1, uint64_t *a2)
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

id sub_1BA30()
{
  return sub_1BE60(type metadata accessor for LocateDeviceIntent);
}

uint64_t type metadata accessor for LocateDeviceIntent()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin18LocateDeviceIntent);
}

id sub_1BA8C()
{
  return sub_1BE60(type metadata accessor for LocateIntent);
}

uint64_t type metadata accessor for LocateIntent()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin12LocateIntent);
}

id sub_1BAE8()
{
  return sub_1BE60(type metadata accessor for PlaySoundIntent);
}

uint64_t type metadata accessor for PlaySoundIntent()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin15PlaySoundIntent);
}

id sub_1BB44()
{
  return sub_1BE60(type metadata accessor for MTCreateAlarmIntent);
}

uint64_t type metadata accessor for MTCreateAlarmIntent()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin19MTCreateAlarmIntent);
}

id sub_1BBA0()
{
  return sub_1BE60(type metadata accessor for MTToggleAlarmIntent);
}

uint64_t type metadata accessor for MTToggleAlarmIntent()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin19MTToggleAlarmIntent);
}

id sub_1BBD8(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, "init");
}

id sub_1BC20(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, "initWithCoder:", a3);
}

id sub_1BC70(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(id))
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v9 = v8;
    id v10 = a4;
    NSString v11 = String._bridgeToObjectiveC()();
    id v12 = (id)swift_bridgeObjectRelease(v9);
  }

  else
  {
    id v12 = a4;
    NSString v11 = 0LL;
  }

  v15.receiver = a1;
  v15.super_class = (Class)a5(v12);
  id v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:backingStore:", v11, a4);

  return v13;
}

id sub_1BD24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v11 = v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  if (a5) {
    a5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  NSString v15 = String._bridgeToObjectiveC()();
  uint64_t v16 = swift_bridgeObjectRelease(v13);
  if (a5)
  {
    v17.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    uint64_t v16 = swift_bridgeObjectRelease(a5);
  }

  else
  {
    v17.super.Class isa = 0LL;
  }

  v20.receiver = a1;
  v20.super_class = (Class)a6(v16);
  id v18 = objc_msgSendSuper2(&v20, "initWithDomain:verb:parametersByName:", v14, v15, v17.super.isa);

  return v18;
}

id sub_1BE54()
{
  return sub_1BE60(type metadata accessor for MTUpdateAlarmIntent);
}

id sub_1BE60(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for MTUpdateAlarmIntent()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin19MTUpdateAlarmIntent);
}

uint64_t sub_1BEB0()
{
  return 0LL;
}

uint64_t sub_1BEBC@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_1BEE8()
{
  return 0LL;
}

void sub_1BEF4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1BF00(uint64_t a1)
{
  unint64_t v2 = sub_1DF14();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1BF28(uint64_t a1)
{
  unint64_t v2 = sub_1DF14();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1BF50(char a1)
{
  return *(void *)&aSiri_0[8 * a1];
}

BOOL sub_1BF70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_1BF88()
{
}

uint64_t sub_1BFB4(void *a1, int a2)
{
  int v30 = a2;
  uint64_t v3 = sub_5BC0(&qword_3A720);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  __chkstk_darwin();
  uint64_t v26 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_5BC0(&qword_3A728);
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  __chkstk_darwin();
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_5BC0(&qword_3A730);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_5BC0(&qword_3A738);
  uint64_t v29 = *(void *)(v12 - 8);
  __chkstk_darwin();
  NSString v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  sub_19594(a1, v16);
  unint64_t v17 = sub_1DE8C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for Source.CodingKeys,  &type metadata for Source.CodingKeys,  v17,  v16,  v15);
  if ((_BYTE)v30)
  {
    if (v30 == 1)
    {
      char v32 = 1;
      unint64_t v18 = sub_1DF14();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for Source.APPCodingKeys,  &v32,  v12,  &type metadata for Source.APPCodingKeys,  v18);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
    }

    else
    {
      char v33 = 2;
      unint64_t v20 = sub_1DED0();
      int v21 = v26;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for Source.UNKNOWNCodingKeys,  &v33,  v12,  &type metadata for Source.UNKNOWNCodingKeys,  v20);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v28);
    }
  }

  else
  {
    char v31 = 0;
    unint64_t v19 = sub_1DF58();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for Source.SIRICodingKeys,  &v31,  v12,  &type metadata for Source.SIRICodingKeys,  v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v12);
}

uint64_t sub_1C218(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C250 + 4 * byte_2E020[a1]))( 0xD000000000000017LL,  0x800000000002EAC0LL);
}

uint64_t sub_1C250()
{
  return 5395265LL;
}

uint64_t sub_1C260()
{
  return 5786702LL;
}

uint64_t sub_1C270()
{
  return 4801877LL;
}

uint64_t sub_1C280()
{
  return 0x505041454E4F4850LL;
}

uint64_t sub_1C298()
{
  return 0x414547415353454DLL;
}

uint64_t sub_1C2B4()
{
  return 0x5245444E494D4552LL;
}

uint64_t sub_1C2D8()
{
  return 0x4552434D52414C41LL;
}

uint64_t sub_1C338()
{
  return 0x4145524345544F4ELL;
}

uint64_t sub_1C370()
{
  return 0x5041594D444E4946LL;
}

uint64_t sub_1C38C()
{
  return 0x4E574F4E4B4E55LL;
}

uint64_t sub_1C3A4()
{
  return sub_1BF50(*v0);
}

uint64_t sub_1C3AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1D904(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C3D0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C3DC(uint64_t a1)
{
  unint64_t v2 = sub_1DE8C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C404(uint64_t a1)
{
  unint64_t v2 = sub_1DE8C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1C42C(uint64_t a1)
{
  unint64_t v2 = sub_1DF58();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C454(uint64_t a1)
{
  unint64_t v2 = sub_1DF58();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1C47C(uint64_t a1)
{
  unint64_t v2 = sub_1DED0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1C4A4(uint64_t a1)
{
  unint64_t v2 = sub_1DED0();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1C4CC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_1C510(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void *sub_1C550@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1DA28(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_1C578(void *a1)
{
  return sub_1BFB4(a1, *v1);
}

uint64_t sub_1C590(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = sub_1C218(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = sub_1C218(v2);
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

uint64_t sub_1C618(char a1, char a2)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aTimestampayloa[v2];
  uint64_t v4 = *(void *)&aP[v2];
  uint64_t v5 = 8LL * a2;
  uint64_t v6 = *(void *)&aP[v5];
  if (v3 == *(void *)&aTimestampayloa[v5] && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

Swift::Int sub_1C69C()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = sub_1C218(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_1C6FC(char a1)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aP[v2];
  String.hash(into:)(v5, *(void *)&aTimestampayloa[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1C764(uint64_t a1)
{
  uint64_t v3 = sub_1C218(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

uint64_t sub_1C7A4(uint64_t a1, char a2)
{
  uint64_t v2 = 8LL * a2;
  uint64_t v3 = *(void *)&aP[v2];
  String.hash(into:)(a1, *(void *)&aTimestampayloa[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_1C7E4(uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = sub_1C218(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

Swift::Int sub_1C840(uint64_t a1, char a2)
{
  uint64_t v3 = 8LL * a2;
  uint64_t v4 = *(void *)&aP[v3];
  String.hash(into:)(v6, *(void *)&aTimestampayloa[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_1C8A4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1DE00(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1C8D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C218(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1DE48();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_1C954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1DE48();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_1C9A0()
{
  v13[0] = 0LL;
  v13[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(62LL);
  v1._object = (void *)0x800000000002F890LL;
  v1._countAndFlagsBits = 0xD000000000000018LL;
  String.append(_:)(v1);
  uint64_t v12 = *(void *)(v0 + 16);
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 0x616F6C796170202CLL;
  v4._object = (void *)0xEB00000000203A64LL;
  String.append(_:)(v4);
  uint64_t v5 = *(void *)(v0 + 24);
  unint64_t v6 = *(void **)(v0 + 32);
  swift_bridgeObjectRetain(v6);
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v6);
  v8._countAndFlagsBits = 0x656372756F73202CLL;
  v8._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v8);
  LOBYTE(v1sub_1AD44(v0 + 2) = *(_BYTE *)(v0 + 40);
  _print_unlocked<A, B>(_:_:)( &v12,  v13,  &type metadata for Source,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v9._countAndFlagsBits = 0x203A65707974202CLL;
  v9._object = (void *)0xE800000000000000LL;
  String.append(_:)(v9);
  LOBYTE(v1sub_1AD44(v0 + 2) = *(_BYTE *)(v0 + 41);
  _print_unlocked<A, B>(_:_:)( &v12,  v13,  &type metadata for EventType,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v10._countAndFlagsBits = 41LL;
  v10._object = (void *)0xE100000000000000LL;
  String.append(_:)(v10);
  return v13[0];
}

uint64_t sub_1CB2C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v5 = *(void *)(v2 + 32);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(a1, v4, v5);
  swift_bridgeObjectRelease(v5);
  Hasher._combine(_:)(*(unsigned __int8 *)(v2 + 40));
  uint64_t v6 = sub_1C218(*(_BYTE *)(v2 + 41));
  uint64_t v8 = v7;
  String.hash(into:)(a1, v6, v7);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_1CBA4(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = v3 == v5 && v4 == v6;
  if (v7 || (char v8 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0LL) & 1) != 0))
  {
    if (*(unsigned __int8 *)(v1 + 40) == *(unsigned __int8 *)(a1 + 40))
    {
      unsigned __int8 v9 = *(_BYTE *)(v1 + 41);
      unsigned __int8 v10 = *(_BYTE *)(a1 + 41);
      uint64_t v11 = sub_1C218(v9);
      uint64_t v13 = v12;
      uint64_t v14 = sub_1C218(v10);
      if (v11 == v14 && v13 == v15)
      {
        char v8 = 1;
        uint64_t v17 = v13;
      }

      else
      {
        uint64_t v17 = v15;
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v14, v15, 0LL);
      }

      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v17);
    }

    else
    {
      char v8 = 0;
    }
  }

  return v8 & 1;
}

uint64_t sub_1CC6C(char a1)
{
  return *(void *)&aTimestampayloa[8 * a1];
}

uint64_t sub_1CC8C(char *a1, char *a2)
{
  return sub_1C618(*a1, *a2);
}

Swift::Int sub_1CC98()
{
  return sub_1C6FC(*v0);
}

uint64_t sub_1CCA0(uint64_t a1)
{
  return sub_1C7A4(a1, *v1);
}

Swift::Int sub_1CCA8(uint64_t a1)
{
  return sub_1C840(a1, *v1);
}

unint64_t sub_1CCB0@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1E748(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1CCDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1CC6C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1CD04()
{
  return sub_1CC6C(*v0);
}

unint64_t sub_1CD0C@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1E748(a1);
  *a2 = result;
  return result;
}

void sub_1CD30(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1CD3C(uint64_t a1)
{
  unint64_t v2 = sub_1DF9C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1CD64(uint64_t a1)
{
  unint64_t v2 = sub_1DF9C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1CD8C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_5BC0(&qword_3A760);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  char v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_19594(a1, v9);
  unint64_t v11 = sub_1DF9C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PatternItem.CodingKeys,  &type metadata for PatternItem.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + 16);
  char v24 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v24, v5);
  if (!v2)
  {
    uint64_t v14 = *(void *)(v3 + 24);
    uint64_t v15 = *(void *)(v3 + 32);
    char v23 = 1;
    swift_bridgeObjectRetain(v15);
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v23, v5);
    swift_bridgeObjectRelease(v15);
    char v22 = *(_BYTE *)(v3 + 40);
    char v21 = 2;
    unint64_t v16 = sub_1E068();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v22, &v21, v5, &type metadata for Source, v16);
    char v20 = *(_BYTE *)(v3 + 41);
    char v19 = 3;
    unint64_t v17 = sub_1E0AC();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v5, &type metadata for EventType, v17);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1CF58(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 42LL, 7LL);
  sub_1CFA4(a1);
  return v3;
}

uint64_t sub_1CFA4(void *a1)
{
  uint64_t v4 = sub_5BC0(&qword_3A740);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_19594(a1, v8);
  unint64_t v10 = sub_1DF9C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PatternItem.CodingKeys,  &type metadata for PatternItem.CodingKeys,  v10,  v8,  v9);
  if (v2)
  {
    uint64_t v11 = type metadata accessor for PatternItem();
    swift_deallocPartialClassInstance(v1, v11, 42LL, 7LL);
  }

  else
  {
    BYTE4(v18) = 0;
    *(void *)(v1 + 16) = KeyedDecodingContainer.decode(_:forKey:)((char *)&v18 + 4, v4);
    BYTE3(v18) = 1;
    *(void *)(v1 + 24) = KeyedDecodingContainer.decode(_:forKey:)((char *)&v18 + 3, v4);
    *(void *)(v1 + 3sub_1AD44(v0 + 2) = v13;
    BYTE1(v18) = 2;
    unint64_t v14 = sub_1DFE0();
    KeyedDecodingContainer.decode<A>(_:forKey:)( (uint64_t *)((char *)&v18 + 2),  &type metadata for Source,  (char *)&v18 + 1,  v4,  &type metadata for Source,  v14);
    *(_BYTE *)(v1 + 40) = BYTE2(v18);
    char v17 = 3;
    unint64_t v15 = sub_1E024();
    KeyedDecodingContainer.decode<A>(_:forKey:)( &v18,  &type metadata for EventType,  &v17,  v4,  &type metadata for EventType,  v15);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_BYTE *)(v1 + 41) = v18;
  }

  sub_1AD44(a1);
  return v1;
}

uint64_t sub_1D1A8()
{
  return swift_deallocClassInstance(v0, 42LL, 7LL);
}

uint64_t type metadata accessor for PatternItem()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin11PatternItem);
}

Swift::Int sub_1D1EC()
{
  uint64_t v1 = v0;
  Hasher.init(_seed:)(v8, 0LL);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v8, v2, v3);
  swift_bridgeObjectRelease(v3);
  Hasher._combine(_:)(*(unsigned __int8 *)(v1 + 40));
  uint64_t v4 = sub_1C218(*(_BYTE *)(v1 + 41));
  uint64_t v6 = v5;
  String.hash(into:)(v8, v4, v5);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t sub_1D288()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 208LL))();
}

Swift::Int sub_1D2B0()
{
  return sub_1D1EC();
}

uint64_t sub_1D2D0(uint64_t a1)
{
  return sub_1CB2C(a1);
}

Swift::Int sub_1D2F0(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_1D32C(uint64_t a1, uint64_t *a2)
{
  return sub_1CBA4(*a2) & 1;
}

uint64_t sub_1D354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 248))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D380(void *a1)
{
  return sub_1CD8C(a1);
}

uint64_t sub_1D3A0()
{
  v21[0] = 0LL;
  v21[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(82LL);
  v1._countAndFlagsBits = 0x203A646928LL;
  v1._object = (void *)0xE500000000000000LL;
  String.append(_:)(v1);
  uint64_t v20 = *(void *)(v0 + 48);
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._object = (void *)0x800000000002F870LL;
  v4._countAndFlagsBits = 0xD000000000000019LL;
  String.append(_:)(v4);
  uint64_t v20 = *(void *)(v0 + 16);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  uint64_t v6 = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v6);
  v7._countAndFlagsBits = 0x797469746E65202CLL;
  v7._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v7);
  uint64_t v8 = *(void *)(v0 + 64);
  uint64_t v9 = swift_bridgeObjectRetain(v8);
  v10._countAndFlagsBits = Array.description.getter(v9, &type metadata for String);
  uint64_t v11 = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
  v12._countAndFlagsBits = 0x616F6C796170202CLL;
  v12._object = (void *)0xEB00000000203A64LL;
  String.append(_:)(v12);
  uint64_t v13 = *(void *)(v0 + 24);
  unint64_t v14 = *(void **)(v0 + 32);
  swift_bridgeObjectRetain(v14);
  v15._countAndFlagsBits = v13;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14);
  v16._countAndFlagsBits = 0x656372756F73202CLL;
  v16._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v16);
  LOBYTE(vsub_1AD44(v0 + 20) = *(_BYTE *)(v0 + 40);
  _print_unlocked<A, B>(_:_:)( &v20,  v21,  &type metadata for Source,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v17._countAndFlagsBits = 0x203A65707974202CLL;
  v17._object = (void *)0xE800000000000000LL;
  String.append(_:)(v17);
  LOBYTE(vsub_1AD44(v0 + 20) = *(_BYTE *)(v0 + 41);
  _print_unlocked<A, B>(_:_:)( &v20,  v21,  &type metadata for EventType,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v18._countAndFlagsBits = 41LL;
  v18._object = (void *)0xE100000000000000LL;
  String.append(_:)(v18);
  return v21[0];
}

void *sub_1D5D4(void *a1)
{
  uint64_t v3 = (void *)swift_allocObject(v1, 72LL, 7LL);
  v3[6] = 0LL;
  v3[7] = 0LL;
  v3[8] = &_swiftEmptyArrayStorage;
  sub_1AD00((uint64_t)a1, (uint64_t)v5);
  sub_1CFA4(v5);
  sub_1AD44(a1);
  return v3;
}

uint64_t sub_1D654()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 64));
}

uint64_t sub_1D65C()
{
  return swift_deallocClassInstance(v0, 72LL, 7LL);
}

uint64_t type metadata accessor for SequenceItem()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin12SequenceItem);
}

_BYTE *initializeBufferWithCopyOfBuffer for Source(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EventType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EventType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF2) {
    return ((uint64_t (*)(void))((char *)&loc_1D794 + 4 * byte_2E033[v4]))();
  }
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_1D7C8 + 4 * byte_2E02E[v4]))();
}

uint64_t sub_1D7C8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D7D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1D7D8LL);
  }
  return result;
}

uint64_t sub_1D7E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1D7ECLL);
  }
  *(_BYTE *)uint64_t result = a2 + 13;
  return result;
}

uint64_t sub_1D7F0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D7F8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EventType()
{
  return &type metadata for EventType;
}

ValueMetadata *type metadata accessor for Source()
{
  return &type metadata for Source;
}

unint64_t sub_1D830()
{
  unint64_t result = qword_3A6B8;
  if (!qword_3A6B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E170, &type metadata for Source);
    atomic_store(result, (unint64_t *)&qword_3A6B8);
  }

  return result;
}

unint64_t sub_1D878()
{
  unint64_t result = qword_3A6C0;
  if (!qword_3A6C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E260, &type metadata for EventType);
    atomic_store(result, (unint64_t *)&qword_3A6C0);
  }

  return result;
}

unint64_t sub_1D8C0()
{
  unint64_t result = qword_3A6C8;
  if (!qword_3A6C8)
  {
    uint64_t v1 = type metadata accessor for PatternItem();
    unint64_t result = swift_getWitnessTable(&unk_2E2D8, v1);
    atomic_store(result, (unint64_t *)&qword_3A6C8);
  }

  return result;
}

uint64_t sub_1D904(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1230129491 && a2 == 0xE400000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(1230129491LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 5263425 && a2 == 0xE300000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(5263425LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x4E574F4E4B4E55LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x4E574F4E4B4E55LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

void *sub_1DA28(void *a1)
{
  uint64_t v37 = sub_5BC0(&qword_3A6D8);
  uint64_t v35 = *(void *)(v37 - 8);
  __chkstk_darwin();
  int64_t v39 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = sub_5BC0(&qword_3A6E0);
  uint64_t v33 = *(void *)(v36 - 8);
  __chkstk_darwin();
  uint64_t v38 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = sub_5BC0(&qword_3A6E8);
  uint64_t v4 = *(void *)(v34 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_5BC0(&qword_3A6F0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  Swift::String v10 = (uint64_t *)((char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_19594(a1, v11);
  unint64_t v13 = sub_1DE8C();
  unint64_t v14 = v40;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for Source.CodingKeys,  &type metadata for Source.CodingKeys,  v13,  v11,  v12);
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v31 = v4;
  uint64_t v32 = v8;
  Swift::String v15 = v39;
  int64_t v40 = a1;
  Swift::String v16 = v10;
  uint64_t v17 = KeyedDecodingContainer.allKeys.getter(v7);
  uint64_t v18 = v17;
  uint64_t v19 = v7;
  if (*(void *)(v17 + 16) != 1LL)
  {
    uint64_t v23 = v17;
    uint64_t v24 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v24, &protocol witness table for DecodingError, 0LL, 0LL);
    Swift::String v10 = v25;
    sub_5BC0(&qword_3A700);
    *Swift::String v10 = &type metadata for Source;
    uint64_t v26 = KeyedDecodingContainer.codingPath.getter(v19);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v26,  0xD00000000000002BLL,  0x800000000002F840LL,  0LL);
    uint64_t v27 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104LL))( v10,  enum case for DecodingError.typeMismatch(_:),  v24);
    swift_willThrow(v27);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(void *, uint64_t))(v32 + 8))(v16, v19);
    a1 = v40;
LABEL_7:
    sub_1AD44(a1);
    return v10;
  }

  Swift::String v10 = (void *)*(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      char v42 = 1;
      unint64_t v20 = sub_1DF14();
      char v21 = v38;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for Source.APPCodingKeys,  &v42,  v7,  &type metadata for Source.APPCodingKeys,  v20);
      uint64_t v22 = v32;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v36);
    }

    else
    {
      char v43 = 2;
      unint64_t v30 = sub_1DED0();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for Source.UNKNOWNCodingKeys,  &v43,  v7,  &type metadata for Source.UNKNOWNCodingKeys,  v30);
      uint64_t v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v37);
    }

    swift_bridgeObjectRelease(v18);
    (*(void (**)(void *, uint64_t))(v22 + 8))(v16, v19);
  }

  else
  {
    char v41 = 0;
    unint64_t v29 = sub_1DF58();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for Source.SIRICodingKeys,  &v41,  v7,  &type metadata for Source.SIRICodingKeys,  v29);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v34);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(void *, uint64_t))(v32 + 8))(v16, v7);
  }

  sub_1AD44(v40);
  return v10;
}

unint64_t sub_1DE00(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_34F78, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xE) {
    return 14LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_1DE48()
{
  unint64_t result = qword_3A6D0;
  if (!qword_3A6D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E1E8, &type metadata for EventType);
    atomic_store(result, (unint64_t *)&qword_3A6D0);
  }

  return result;
}

unint64_t sub_1DE8C()
{
  unint64_t result = qword_3A6F8;
  if (!qword_3A6F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E77C, &type metadata for Source.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A6F8);
  }

  return result;
}

unint64_t sub_1DED0()
{
  unint64_t result = qword_3A708;
  if (!qword_3A708)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E72C, &type metadata for Source.UNKNOWNCodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A708);
  }

  return result;
}

unint64_t sub_1DF14()
{
  unint64_t result = qword_3A710;
  if (!qword_3A710)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E6DC, &type metadata for Source.APPCodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A710);
  }

  return result;
}

unint64_t sub_1DF58()
{
  unint64_t result = qword_3A718;
  if (!qword_3A718)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E68C, &type metadata for Source.SIRICodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A718);
  }

  return result;
}

unint64_t sub_1DF9C()
{
  unint64_t result = qword_3A748;
  if (!qword_3A748)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E63C, &type metadata for PatternItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A748);
  }

  return result;
}

unint64_t sub_1DFE0()
{
  unint64_t result = qword_3A750;
  if (!qword_3A750)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E108, &type metadata for Source);
    atomic_store(result, (unint64_t *)&qword_3A750);
  }

  return result;
}

unint64_t sub_1E024()
{
  unint64_t result = qword_3A758;
  if (!qword_3A758)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E1C0, &type metadata for EventType);
    atomic_store(result, (unint64_t *)&qword_3A758);
  }

  return result;
}

unint64_t sub_1E068()
{
  unint64_t result = qword_3A768;
  if (!qword_3A768)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E0E0, &type metadata for Source);
    atomic_store(result, (unint64_t *)&qword_3A768);
  }

  return result;
}

unint64_t sub_1E0AC()
{
  unint64_t result = qword_3A770;
  if (!qword_3A770)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E198, &type metadata for EventType);
    atomic_store(result, (unint64_t *)&qword_3A770);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for PatternItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PatternItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1E1CC + 4 * byte_2E03D[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1E200 + 4 * byte_2E038[v4]))();
}

uint64_t sub_1E200(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1E208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1E210LL);
  }
  return result;
}

uint64_t sub_1E21C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1E224LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1E228(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1E230(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1E23C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1E244(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PatternItem.CodingKeys()
{
  return &type metadata for PatternItem.CodingKeys;
}

uint64_t _s42SiriPrivateLearningPatternExtractionPlugin6SourceOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t _s42SiriPrivateLearningPatternExtractionPlugin6SourceOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1E338 + 4 * byte_2E047[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1E36C + 4 * byte_2E042[v4]))();
}

uint64_t sub_1E36C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1E374(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1E37CLL);
  }
  return result;
}

uint64_t sub_1E388(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1E390LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1E394(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1E39C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Source.CodingKeys()
{
  return &type metadata for Source.CodingKeys;
}

ValueMetadata *type metadata accessor for Source.SIRICodingKeys()
{
  return &type metadata for Source.SIRICodingKeys;
}

ValueMetadata *type metadata accessor for Source.APPCodingKeys()
{
  return &type metadata for Source.APPCodingKeys;
}

ValueMetadata *type metadata accessor for Source.UNKNOWNCodingKeys()
{
  return &type metadata for Source.UNKNOWNCodingKeys;
}

unint64_t sub_1E3EC()
{
  unint64_t result = qword_3A778;
  if (!qword_3A778)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E524, &type metadata for Source.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A778);
  }

  return result;
}

unint64_t sub_1E434()
{
  unint64_t result = qword_3A780;
  if (!qword_3A780)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E614, &type metadata for PatternItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A780);
  }

  return result;
}

unint64_t sub_1E47C()
{
  unint64_t result = qword_3A788;
  if (!qword_3A788)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E54C, &type metadata for PatternItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A788);
  }

  return result;
}

unint64_t sub_1E4C4()
{
  unint64_t result = qword_3A790;
  if (!qword_3A790)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E574, &type metadata for PatternItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A790);
  }

  return result;
}

unint64_t sub_1E50C()
{
  unint64_t result = qword_3A798;
  if (!qword_3A798)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E444, &type metadata for Source.SIRICodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A798);
  }

  return result;
}

unint64_t sub_1E554()
{
  unint64_t result = qword_3A7A0;
  if (!qword_3A7A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E46C, &type metadata for Source.SIRICodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7A0);
  }

  return result;
}

unint64_t sub_1E59C()
{
  unint64_t result = qword_3A7A8;
  if (!qword_3A7A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E3F4, &type metadata for Source.APPCodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7A8);
  }

  return result;
}

unint64_t sub_1E5E4()
{
  unint64_t result = qword_3A7B0;
  if (!qword_3A7B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E41C, &type metadata for Source.APPCodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7B0);
  }

  return result;
}

unint64_t sub_1E62C()
{
  unint64_t result = qword_3A7B8;
  if (!qword_3A7B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E3A4, &type metadata for Source.UNKNOWNCodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7B8);
  }

  return result;
}

unint64_t sub_1E674()
{
  unint64_t result = qword_3A7C0;
  if (!qword_3A7C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E3CC, &type metadata for Source.UNKNOWNCodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7C0);
  }

  return result;
}

unint64_t sub_1E6BC()
{
  unint64_t result = qword_3A7C8;
  if (!qword_3A7C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E494, &type metadata for Source.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7C8);
  }

  return result;
}

unint64_t sub_1E704()
{
  unint64_t result = qword_3A7D0;
  if (!qword_3A7D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_2E4BC, &type metadata for Source.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_3A7D0);
  }

  return result;
}

unint64_t sub_1E748(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_350E8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

void sub_1E7A4()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_3A7D8 = v2;
}

uint64_t type metadata accessor for PatternLogger()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin13PatternLogger);
}

id sub_1E850(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = [objc_allocWithZone(PLUSSchemaPLUSRECTIFIPatternSequenceGenerated) init];
  if (!v7) {
    return v7;
  }
  if ((unint64_t)a5 >> 62)
  {
    if (a5 < 0) {
      uint64_t v12 = a5;
    }
    else {
      uint64_t v12 = a5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a5);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v12);
    if (v8) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (a5 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(a5);
    if (v8)
    {
LABEL_4:
      if (v8 < 1)
      {
        __break(1u);
        goto LABEL_34;
      }

      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if ((a5 & 0xC000000000000001LL) != 0) {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a5);
        }
        else {
          id v10 = *(id *)(a5 + 8 * i + 32);
        }
        uint64_t v11 = v10;
        [v7 addConstraints:v10];
      }
    }
  }

  swift_bridgeObjectRelease(a5);
  uint64_t v13 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a2);
  while (v13)
  {
    uint64_t v14 = 4LL;
    unint64_t v22 = HIDWORD(a3);
    while (1)
    {
      uint64_t v15 = v14 - 4;
      if ((a2 & 0xC000000000000001LL) == 0) {
        break;
      }
      uint64_t v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, a2);
      uint64_t v17 = v14 - 3;
      if (__OFADD__(v15, 1LL)) {
        goto LABEL_26;
      }
LABEL_23:
      id v18 = [objc_allocWithZone(PLUSSchemaPLUSRECTIFIPatternItem) init];
      if (v18)
      {
        if ((*(void *)(v16 + 16) & 0x8000000000000000LL) == 0)
        {
          uint64_t v19 = v18;
          objc_msgSend(v18, "setRelativeTimestampInMs:");
          [v19 setItemSource:dword_2E89C[*(char *)(v16 + 40)]];
          __asm { BR              X9 }
        }

void sub_1EDC0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v62 = a3;
  uint64_t v5 = sub_5BC0(&qword_39920);
  __chkstk_darwin(v5);
  id v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for UUID(0LL);
  unint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v59 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_39750 != -1) {
LABEL_32:
  }
    swift_once(&qword_39750, sub_1E7A4);
  if ((byte_3A7D8 & 1) != 0)
  {
    if (qword_39730 != -1) {
LABEL_34:
    }
      swift_once(&qword_39730, sub_1B530);
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_D710(v11, (uint64_t)qword_3AB98);
    unint64_t v64 = Logger.logObject.getter(v12);
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled((os_log_t)v64, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl( &dword_0,  (os_log_t)v64,  v13,  "Omitting SELF logging call as UsageLoggingDisabled flag present",  v14,  2u);
      swift_slowDealloc(v14, -1LL, -1LL);
    }
  }

  else
  {
    uint64_t v57 = (void *)*((void *)a1 + 2);
    if (v57)
    {
      uint64_t v15 = v62;
      uint64_t v54 = v62 + 32;
      swift_bridgeObjectRetain(a2);
      swift_bridgeObjectRetain(v15);
      swift_bridgeObjectRetain(a1);
      unint64_t v63 = 0LL;
      unint64_t v64 = 0LL;
      uint64_t v53 = a1;
      uint64_t v16 = a1 + 64;
      uint64_t v17 = &selRef_initWithEntityName_;
      __int128 v58 = xmmword_2DC10;
      uint64_t v55 = v8;
      uint64_t v56 = v7;
      unint64_t v61 = v9;
      while (1)
      {
        uint64_t v18 = a2;
        uint64_t v20 = *((void *)v16 - 4);
        uint64_t v19 = *((void *)v16 - 3);
        uint64_t v21 = *v16;
        uint64_t v23 = *((void *)v16 - 2);
        unint64_t v22 = *((void *)v16 - 1);
        id v24 = objc_allocWithZone(&OBJC_CLASS___PLUSSchemaPLUSRECTIFIPatternConstraint);
        swift_bridgeObjectRetain(v23);
        uint64_t v25 = v17[23];
        swift_bridgeObjectRetain(v19);
        id v26 = [v24 v25];
        LODWORD(v2sub_1AD44(v0 + 7) = 1060320051;
        [v26 setConstraintValue:v27];
        [v26 setConstraintType:1];
        if (!v26)
        {
          swift_bridgeObjectRelease(v18);
          swift_bridgeObjectRelease(v62);
          swift_bridgeObjectRelease(v53);
          swift_bridgeObjectRelease(v23);
          uint64_t v51 = v19;
          goto LABEL_24;
        }

        uint64_t v28 = sub_5BC0(&qword_39ED0);
        uint64_t inited = swift_initStackObject(v28, v66);
        *(_OWORD *)(inited + 16) = v58;
        *(void *)(inited + 3sub_1AD44(v0 + 2) = v26;
        uint64_t v65 = inited;
        specialized Array._endMutation()(inited);
        uint64_t v30 = v65;
        unint64_t v31 = *(void *)(v62 + 16);
        if (v63 == v31)
        {
          uint64_t v32 = 0LL;
        }

        else
        {
          if (v63 >= v31)
          {
            __break(1u);
            goto LABEL_34;
          }

          uint64_t v32 = *(void **)(v54 + 8 * v63++);
          if (v32) {
            id v33 = v32;
          }
        }

        id v34 = v26;
        id v35 = sub_1E850(v20, v19, v22, v21, v30);
        swift_bridgeObjectRelease(v30);
        swift_bridgeObjectRelease(v23);
        swift_bridgeObjectRelease(v19);

        if (!v35)
        {
          swift_bridgeObjectRelease(v18);
          swift_bridgeObjectRelease(v62);
          swift_bridgeObjectRelease(v53);

          return;
        }

        id v36 = [objc_allocWithZone(PLUSSchemaPLUSClientEvent) init];
        a2 = v18;
        if (!v36)
        {
          swift_bridgeObjectRelease(v18);
          swift_bridgeObjectRelease(v62);
          swift_bridgeObjectRelease(v53);

          return;
        }

        uint64_t v37 = v36;
        uint64_t v38 = (unsigned __int8 *)[objc_allocWithZone(PLUSSchemaPLUSClientEventMetadata) init];
        if (!v38)
        {
          swift_bridgeObjectRelease(v18);
          swift_bridgeObjectRelease(v62);
          swift_bridgeObjectRelease(v53);

          return;
        }

        a1 = v38;
        int64_t v39 = *(void **)(v18 + 16);
        unint64_t v9 = v64;
        uint64_t v8 = v55;
        id v7 = v56;
        unint64_t v40 = v61;
        if (v64 >= (unint64_t)v39)
        {
          __break(1u);
          goto LABEL_32;
        }

        (*(void (**)(char *, unint64_t, uint64_t))(v61 + 16))( v56,  a2 + ((*(unsigned __int8 *)(v61 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))
        + *(void *)(v61 + 72) * v64,
          v55);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v7, 0LL, 1LL, v8);
        unint64_t v64 = v9 + 1;
        char v41 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
        id v60 = v34;
        char v42 = v59;
        v41(v59, v7, v8);
        id v43 = objc_allocWithZone(&OBJC_CLASS___SISchemaUUID);
        Class isa = UUID._bridgeToObjectiveC()().super.isa;
        id v45 = [v43 initWithNSUUID:isa];

        [a1 setPlusId:v45];
        [v37 setPatternSequenceGenerated:v35];
        [v37 setEventMetadata:a1];
        id v46 = [(id)objc_opt_self(AssistantSiriAnalytics) sharedAnalytics];
        id v47 = [v46 defaultMessageStream];

        Class v48 = UUID._bridgeToObjectiveC()().super.isa;
        [v47 emitMessage:v37 isolatedStreamUUID:v48];

        unint64_t v49 = v61;
        unint64_t v50 = v42;
        uint64_t v17 = &selRef_initWithEntityName_;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v8);
        v16 += 40;
        if (v57 == (void *)v64)
        {
          swift_bridgeObjectRelease(a2);
          swift_bridgeObjectRelease(v62);
          uint64_t v51 = (uint64_t)v53;
LABEL_24:
          swift_bridgeObjectRelease(v51);
          return;
        }
      }

      id v7 = v56;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v56, 1LL, 1LL, v55);
LABEL_29:
      swift_bridgeObjectRelease(v62);
      swift_bridgeObjectRelease(v53);

      swift_bridgeObjectRelease(a2);
      sub_1F3FC((uint64_t)v7);
    }
  }

uint64_t sub_1F3FC(uint64_t a1)
{
  uint64_t v2 = sub_5BC0(&qword_39920);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

id RECTIFIInfrequentPatternStore.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for RECTIFIInfrequentPatternStore();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for RECTIFIInfrequentPatternStore()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin29RECTIFIInfrequentPatternStore);
}

id RECTIFIInfrequentPatternStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RECTIFIInfrequentPatternStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static RECTIFIInfrequentPatternStore.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1F5A8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for RECTIFIInfrequentPatternStore();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

unint64_t sub_1F5E8(uint64_t a1)
{
  uint64_t v2 = sub_5BC0(&qword_399F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (uint64_t *)((char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v8;
  }

  sub_5BC0(&qword_399E8);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v26 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_D91C(v13, (uint64_t)v5, &qword_399F0);
    uint64_t v15 = *v5;
    unint64_t result = sub_A7D8(*v5);
    if ((v17 & 1) != 0) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v8[6] + 8 * result) = v15;
    uint64_t v19 = v8[7];
    uint64_t v20 = type metadata accessor for PatternStoreValue(0LL);
    unint64_t result = sub_CEF4(v10, v19 + *(void *)(*(void *)(v20 - 8) + 72LL) * v18);
    uint64_t v21 = v8[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_12;
    }
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v24 = v26;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t RectifiStoreApi.__allocating_init(storePath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject(v2, 56LL, 7LL);
  RectifiStoreApi.init(storePath:)(a1, a2);
  return v5;
}

uint64_t RectifiStoreApi.init(storePath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RECTIFITrialStatusResolver(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = RECTIFITrialStatusResolver.init()();
  if (qword_39718 != -1) {
    swift_once(&qword_39718, sub_6100);
  }
  uint64_t v9 = qword_3AB78;
  uint64_t v8 = unk_3AB80;
  uint64_t v10 = dispatch thunk of RECTIFITrialStatusResolver.getRECTIFICoreDataStoreName()();
  unint64_t v12 = v11;
  *(void *)&__int128 v19 = v9;
  *((void *)&v19 + 1) = v8;
  swift_bridgeObjectRetain(v8);
  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  uint64_t v14 = v8;
  if (a2)
  {
    swift_bridgeObjectRelease(*((void *)&v19 + 1));
    uint64_t v14 = a2;
  }

  else
  {
    a1 = v19;
  }

  uint64_t v15 = type metadata accessor for RectifiCoreDataStore(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = sub_6194(a1, v14);
  if (v16)
  {
    uint64_t v17 = v16;
    *((void *)&v20 + 1) = v15;
    uint64_t v21 = &off_351F0;
    swift_release(v7);
    *(void *)&__int128 v19 = v17;
  }

  else
  {
    swift_release(v7);
    uint64_t v21 = 0LL;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
  }

  sub_1F928((uint64_t)&v19, v3 + 16);
  return v3;
}

uint64_t sub_1F928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5BC0(&qword_3A8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

char *RectifiStoreApi.getTopKRectifiPatternUuids(topK:appLevelAggregation:)(uint64_t a1, char a2)
{
  uint64_t v5 = sub_5BC0(&qword_39920);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v45 - 8);
  uint64_t v9 = __chkstk_darwin(v45);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  id v46 = (char *)&v42 - v12;
  sub_D91C(v2 + 16, (uint64_t)&v47, &qword_3A8C0);
  if (v48)
  {
    uint64_t v44 = v11;
    sub_1AD64(&v47, (uint64_t)v49);
    Swift::String v13 = (void *)*sub_19594(v49, v49[3]);
    *(void *)&__int128 v47 = sub_1F5E8((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v14 = (void *)dispatch thunk of CoreDataStore.context.getter(v47);
    __chkstk_darwin(v14);
    *(&v42 - 4) = v13;
    *(&v42 - 3) = &v47;
    *((_BYTE *)&v42 - 16) = 0;
    NSManagedObjectContext.performAndWait<A>(_:)(sub_D960);

    uint64_t v21 = sub_20038(v47, a2 & 1);
    *(void *)&__int128 v47 = v21;
    swift_bridgeObjectRetain(v21);
    sub_21478(&v47);
    swift_bridgeObjectRelease(v21);
    uint64_t v22 = v47;
    uint64_t v24 = v44;
    uint64_t v23 = v45;
    if (*(void *)(v47 + 16) <= a1)
    {
      char v42 = (void *)v47;
      goto LABEL_17;
    }

    if (a1 < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v25 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
      uint64_t v26 = swift_unknownObjectRetain_n(v22, 2LL);
      double v27 = (void *)swift_dynamicCastClass(v26, v25);
      if (!v27)
      {
        swift_release(v22);
        double v27 = _swiftEmptyArrayStorage;
      }

      uint64_t v28 = v27[2];
      swift_release(v27);
      if (v28 == a1)
      {
        uint64_t v29 = swift_dynamicCastClass(v22, v25);
        swift_release(v22);
        char v42 = (void *)v29;
        if (v29)
        {
LABEL_17:
          uint64_t v30 = v42[2];
          if (v30)
          {
            uint64_t v31 = type metadata accessor for PatternStoreValue(0LL);
            uint64_t v32 = *(void *)(v31 - 8);
            id v33 = (char *)v42
                + ((*(unsigned __int8 *)(v32 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
            uint64_t v34 = *(void *)(v32 + 72);
            swift_bridgeObjectRetain(v42);
            __int128 v20 = (char *)_swiftEmptyArrayStorage;
            uint64_t v43 = v34;
            do
            {
              sub_D91C((uint64_t)&v33[*(int *)(v31 + 24)], (uint64_t)v7, &qword_39920);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1LL, v23) == 1)
              {
                sub_D97C((uint64_t)v7, &qword_39920);
              }

              else
              {
                uint64_t v35 = v31;
                id v36 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
                uint64_t v37 = v46;
                v36(v46, v7, v23);
                (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v24, v37, v23);
                if ((swift_isUniquelyReferenced_nonNull_native(v20) & 1) == 0) {
                  __int128 v20 = (char *)sub_20954( 0,  *((void *)v20 + 2) + 1LL,  1,  (unint64_t)v20,  &qword_3A9B8,  (uint64_t (*)(void))&type metadata accessor for UUID);
                }
                unint64_t v39 = *((void *)v20 + 2);
                unint64_t v38 = *((void *)v20 + 3);
                if (v39 >= v38 >> 1) {
                  __int128 v20 = (char *)sub_20954( v38 > 1,  v39 + 1,  1,  (unint64_t)v20,  &qword_3A9B8,  (uint64_t (*)(void))&type metadata accessor for UUID);
                }
                *((void *)v20 + sub_1AD44(v0 + 2) = v39 + 1;
                uint64_t v24 = v44;
                uint64_t v23 = v45;
                v36( &v20[((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
                     + *(void *)(v8 + 72) * v39],
                  v44,
                  v45);
                (*(void (**)(char *, uint64_t))(v8 + 8))(v46, v23);
                uint64_t v31 = v35;
                uint64_t v34 = v43;
              }

              v33 += v34;
              --v30;
            }

            while (v30);
            swift_bridgeObjectRelease_n(v42, 2LL);
          }

          else
          {
            swift_bridgeObjectRelease(v42);
            __int128 v20 = (char *)_swiftEmptyArrayStorage;
          }

          sub_1AD44(v49);
          return v20;
        }

        char v42 = _swiftEmptyArrayStorage;
LABEL_15:
        swift_release(v22);
        goto LABEL_17;
      }
    }

    swift_release(v22);
    uint64_t v41 = *(unsigned __int8 *)(*(void *)(type metadata accessor for PatternStoreValue(0LL) - 8) + 80LL);
    char v42 = sub_21AB4(v22, v22 + ((v41 + 32) & ~v41), 0LL, (2 * a1) | 1);
    goto LABEL_15;
  }

  sub_D97C((uint64_t)&v47, &qword_3A8C0);
  if (qword_39730 != -1) {
    swift_once(&qword_39730, sub_1B530);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = sub_D710(v15, (uint64_t)qword_3AB98);
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    __int128 v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)__int128 v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "RECTIFI API: Unable to read from RECTIFI Store", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  return (char *)_swiftEmptyArrayStorage;
}

uint64_t sub_20038(uint64_t a1, int a2)
{
  int v35 = a2;
  uint64_t v3 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v32 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t result = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v29 - v11;
  int64_t v13 = 0LL;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v33 = a1 + 64;
  uint64_t v15 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v16 = -1LL;
  if (v15 < 64) {
    uint64_t v16 = ~(-1LL << v15);
  }
  uint64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  id v36 = (unint64_t *)&_swiftEmptyArrayStorage;
  unint64_t v18 = v16 & v14;
  int64_t v34 = (unint64_t)(v15 + 63) >> 6;
  if ((v16 & v14) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v21 = v13 + 1;
  if (!__OFADD__(v13, 1LL))
  {
    if (v21 < v34)
    {
      unint64_t v22 = *(void *)(v33 + 8 * v21);
      ++v13;
      if (v22) {
        goto LABEL_23;
      }
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (v22) {
        goto LABEL_23;
      }
      int64_t v13 = v21 + 2;
      if (v21 + 2 >= v34) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (v22) {
        goto LABEL_23;
      }
      int64_t v13 = v21 + 3;
      if (v21 + 3 >= v34) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (v22)
      {
LABEL_23:
        unint64_t v18 = (v22 - 1) & v22;
        for (unint64_t i = __clz(__rbit64(v22)) + (v13 << 6); ; unint64_t i = v19 | (v13 << 6))
        {
          uint64_t v24 = *(void *)(v4 + 72);
          sub_CF7C(*(void *)(a1 + 56) + v24 * i, (uint64_t)v9);
          sub_CEF4((uint64_t)v9, (uint64_t)v12);
          int v25 = v12[*(int *)(v3 + 28)];
          if (v25 == 2)
          {
            if ((v35 & 1) != 0)
            {
LABEL_6:
              uint64_t result = sub_D764((uint64_t)v12);
              if (!v18) {
                goto LABEL_8;
              }
              goto LABEL_7;
            }
          }

          else if (((((v25 & 1) == 0) ^ v35) & 1) == 0)
          {
            goto LABEL_6;
          }

          sub_CEF4((uint64_t)v12, v32);
          if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0) {
            sub_27948(0, v17[2] + 1, 1);
          }
          uint64_t v17 = v36;
          unint64_t v27 = v36[2];
          unint64_t v26 = v36[3];
          unint64_t v28 = v27 + 1;
          if (v27 >= v26 >> 1)
          {
            unint64_t v30 = v36[2];
            unint64_t v31 = v27 + 1;
            sub_27948(v26 > 1, v27 + 1, 1);
            unint64_t v27 = v30;
            unint64_t v28 = v31;
            uint64_t v17 = v36;
          }

          v17[2] = v28;
          uint64_t result = sub_CEF4( v32,  (uint64_t)v17 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
                   + v27 * v24);
          if (!v18) {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v19 = __clz(__rbit64(v18));
          v18 &= v18 - 1;
        }
      }

      int64_t v23 = v21 + 4;
      if (v23 < v34)
      {
        unint64_t v22 = *(void *)(v33 + 8 * v23);
        if (v22)
        {
          int64_t v13 = v23;
          goto LABEL_23;
        }

        while (1)
        {
          int64_t v13 = v23 + 1;
          if (__OFADD__(v23, 1LL)) {
            goto LABEL_34;
          }
          if (v13 >= v34) {
            break;
          }
          unint64_t v22 = *(void *)(v33 + 8 * v13);
          ++v23;
          if (v22) {
            goto LABEL_23;
          }
        }
      }
    }

uint64_t RectifiStoreApi.deinit()
{
  return v0;
}

uint64_t RectifiStoreApi.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t sub_20388(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_20398(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *sub_203CC(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_5BC0(&qword_3A980);
      uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
      int64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[5 * v8 + 4]) {
          memmove(v13, a4 + 4, 40 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      int64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_22EA8(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_204E8(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_5BC0(&qword_3A9A8);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
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

    sub_22F9C(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_205F4(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_20B74(a1, a2, a3, a4, &qword_3A970, &qword_399D0);
}

void *sub_20608(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_5BC0(&qword_3A1B8);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
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

    sub_23084(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_20714(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_5BC0(&qword_3A1C0);
      uint64_t v11 = (void *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 24);
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[3 * v8 + 4]) {
          memmove(v13, a4 + 4, 24 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_23174(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_20834(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_20954(a1, a2, a3, a4, &qword_3A990, type metadata accessor for ItemSequenceData);
}

void *sub_20848(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_5BC0(&qword_3A998);
      uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v8 + 4]) {
          memmove(v14, a4 + 4, 8 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_23268(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_20954( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
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
    unint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_5BC0(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  unint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15) {
    goto LABEL_29;
  }
  if (v19 - v17 == 0x8000000000000000LL && v15 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  _OWORD v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
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
    sub_23350(0LL, v11, v24, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

void *sub_20B60(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_20B74(a1, a2, a3, a4, &qword_3A988, &qword_3A1C8);
}

void *sub_20B74(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = sub_5BC0(a5);
      uint64_t v14 = (void *)swift_allocObject(v13, 8 * v12 + 32, 7LL);
      int64_t v15 = j__malloc_size(v14);
      uint64_t v16 = v15 - 32;
      if (v15 < 32) {
        uint64_t v16 = v15 - 25;
      }
      v14[2] = v11;
      v14[3] = 2 * (v16 >> 3);
      uint64_t v17 = v14 + 4;
      if ((v8 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v14 = _swiftEmptyArrayStorage;
      uint64_t v17 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v14 != a4 || v17 >= &a4[v11 + 4]) {
          memmove(v17, a4 + 4, 8 * v11);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_23468(0LL, v11, (unint64_t)v17, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

void *sub_20C8C(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_5BC0(&qword_3A978);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
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

    sub_2356C(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

_BYTE **sub_20D98(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_20DA8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_20DC8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_20E38(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_20E38(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_20F08(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2365C((uint64_t)v12, *a3);
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
      sub_2365C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1AD44(v12);
  return v7;
}

uint64_t sub_20F08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_210C0(a5, a6);
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

        uint64_t v8 = (void *)((char *)v8 + 1);
      }

      while (v8 != (void *)v2);
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(a2);
      uint64_t v17 = v9[2];
      if (!v17) {
        goto LABEL_33;
      }
LABEL_27:
      v67[0] = _swiftEmptyArrayStorage;
      sub_27974(0, v17, 0);
      unint64_t v18 = (void *)v67[0];
      size_t v19 = 5LL;
      do
      {
        uint64_t v3 = v9[v19];
        v67[0] = v18;
        uint64_t v21 = v18[2];
        __int128 v20 = v18[3];
        swift_bridgeObjectRetain(v3);
        if (v21 >= v20 >> 1)
        {
          sub_27974(v20 > 1, v21 + 1, 1);
          unint64_t v18 = (void *)v67[0];
        }

        _OWORD v18[2] = v21 + 1;
        v18[v21 + 4] = v3;
        v19 += 2LL;
        --v17;
      }

      while (v17);
      swift_release(v9);
LABEL_34:
      uint64_t v65 = (void *)v18[2];
      if (v65)
      {
        unint64_t v64 = v18 + 4;
        swift_bridgeObjectRetain(v18);
        uint64_t v2 = 0LL;
        uint64_t v22 = _swiftEmptyArrayStorage;
        unint64_t v63 = v18;
        while (1)
        {
          unint64_t v24 = v64[v2];
          if ((unint64_t)v24 >> 62)
          {
            if (v24 < 0) {
              uint64_t v32 = v64[v2];
            }
            else {
              uint64_t v32 = v24 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain(v64[v2]);
            unint64_t v25 = _CocoaArrayWrapper.endIndex.getter(v32);
            uint64_t v66 = v22;
            if (v25)
            {
LABEL_40:
              v67[0] = _swiftEmptyArrayStorage;
              sub_279BC(0, v25 & ~(v25 >> 63), 0);
              if (v25 < 0) {
                goto LABEL_83;
              }
              unint64_t v26 = 0LL;
              unint64_t v27 = (void *)v67[0];
              do
              {
                if ((v24 & 0xC000000000000001LL) != 0)
                {
                  unint64_t v28 = specialized _ArrayBuffer._getElementSlowPath(_:)(v26, v24);
                }

                else
                {
                  unint64_t v28 = *(void *)(v24 + 8 * v26 + 32);
                  swift_retain(v28);
                }

                uint64_t v3 = *(void *)(v28 + 64);
                swift_bridgeObjectRetain(v3);
                swift_release(v28);
                v67[0] = v27;
                unint64_t v30 = v27[2];
                uint64_t v29 = v27[3];
                unint64_t v31 = v30 + 1;
                if (v30 >= v29 >> 1)
                {
                  sub_279BC(v29 > 1, v30 + 1, 1);
                  unint64_t v27 = (void *)v67[0];
                }

                ++v26;
                v27[2] = v31;
                v27[v30 + 4] = v3;
              }

              while (v25 != v26);
LABEL_54:
              int64_t v34 = 0LL;
              uint64_t v33 = _swiftEmptyArrayStorage;
              do
              {
                uint64_t v37 = (void *)v27[v34 + 4];
                if (v37[2])
                {
                  unint64_t v38 = v37[5];
                  unint64_t v39 = v37[4] & 0xFFFFFFFFFFFFLL;
                  if ((v38 & 0x2000000000000000LL) != 0) {
                    unint64_t v39 = HIBYTE(v38) & 0xF;
                  }
                  if (v39)
                  {
                    swift_bridgeObjectRetain(v27[v34 + 4]);
                    unint64_t v40 = swift_isUniquelyReferenced_nonNull_native(v33);
                    v67[0] = v33;
                    if ((v40 & 1) == 0)
                    {
                      sub_279BC(0, v33[2] + 1LL, 1);
                      uint64_t v33 = (void *)v67[0];
                    }

                    id v36 = v33[2];
                    int v35 = v33[3];
                    uint64_t v3 = v36 + 1;
                    if (v36 >= v35 >> 1)
                    {
                      sub_279BC(v35 > 1, v36 + 1, 1);
                      uint64_t v33 = (void *)v67[0];
                    }

                    v33[2] = v3;
                    v33[v36 + 4] = v37;
                  }
                }

                ++v34;
              }

              while (v31 != v34);
              goto LABEL_65;
            }
          }

          else
          {
            unint64_t v25 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFF8LL));
            swift_bridgeObjectRetain(v64[v2]);
            uint64_t v66 = v22;
            if (v25) {
              goto LABEL_40;
            }
          }

          uint64_t v33 = _swiftEmptyArrayStorage;
          unint64_t v31 = _swiftEmptyArrayStorage[2];
          unint64_t v27 = _swiftEmptyArrayStorage;
          if (v31) {
            goto LABEL_54;
          }
LABEL_65:
          swift_bridgeObjectRelease(v27);
          uint64_t v41 = v33[2];
          if (v41 < 2)
          {
            swift_bridgeObjectRelease(v24);
            swift_release(v33);
            uint64_t v22 = v66;
            unint64_t v23 = v63;
          }

          else
          {
            char v42 = v33[4];
            uint64_t v43 = v33[v41 + 3];
            swift_bridgeObjectRetain(v42);
            swift_bridgeObjectRetain(v43);
            swift_bridgeObjectRelease(v24);
            swift_release(v33);
            uint64_t v22 = v66;
            unint64_t v23 = v63;
            if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) == 0) {
              uint64_t v22 = sub_20C8C(0LL, v66[2] + 1LL, 1, v66);
            }
            uint64_t v3 = v22[2];
            uint64_t v44 = v22[3];
            if (v3 >= v44 >> 1) {
              uint64_t v22 = sub_20C8C((void *)(v44 > 1), v3 + 1, 1, v22);
            }
            v22[2] = v3 + 1;
            uint64_t v45 = &v22[2 * v3];
            void v45[4] = v42;
            v45[5] = v43;
          }

          if ((void *)++v2 == v65)
          {
            swift_bridgeObjectRelease_n(v23, 2LL);
            goto LABEL_73;
          }
        }
      }

      swift_bridgeObjectRelease(v18);
      uint64_t v22 = _swiftEmptyArrayStorage;
LABEL_73:
      id v46 = v22[2];
      __int128 v47 = sub_2C328();
      uint64_t v48 = Set.init(minimumCapacity:)(v46, &type metadata for EntityPair, v47);
      uint64_t v68 = v48;
      unint64_t v49 = v22[2];
      if (v49)
      {
        unint64_t v50 = (void **)(v22 + 5);
        do
        {
          uint64_t v51 = *(v50 - 1);
          uint64_t v52 = *v50;
          swift_bridgeObjectRetain(v51);
          swift_bridgeObjectRetain(v52);
          sub_29550(v67, v51, v52);
          swift_bridgeObjectRelease(v67[0]);
          swift_bridgeObjectRelease(v67[1]);
          v50 += 2;
          --v49;
        }

        while (v49);
        swift_bridgeObjectRelease(v22);
        uint64_t v53 = v68;
      }

      else
      {
        uint64_t v53 = v48;
        swift_bridgeObjectRelease(v22);
      }

      uint64_t v54 = *(void *)(v53 + 16);
      uint64_t result = swift_bridgeObjectRelease(v53);
      uint64_t v2 = (uint64_t)v56;
      uint64_t v3 = v57;
      uint64_t v4 = v61;
      if (v61 >= v56[2]) {
        goto LABEL_86;
      }
      char v5 = a2;
      v60[3] = v54;
      *((_BYTE *)v60 + 3sub_1AD44(v0 + 2) = 0;
LABEL_4:
      if (++v4 == v3)
      {
        *uint64_t v55 = v2;
        return result;
      }
    }
  }

  return result;
}

uint64_t sub_210C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_21154(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_2132C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2132C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_21154(uint64_t a1, unint64_t a2)
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
      char v5 = sub_212C8(v4, 0LL);
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
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
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
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  2,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_212C8(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_5BC0(&qword_3A9C0);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  uint64_t v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_2132C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BC0(&qword_3A9C0);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
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
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

Swift::Int sub_21478(void *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for PatternStoreValue(0LL) - 8);
  unint64_t v3 = (void *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    unint64_t v3 = (void *)sub_19A24(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_21C9C(v6);
  *a1 = v3;
  return result;
}

void *sub_214F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_18;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v8 = 8 * v5;
  if (v5 <= 0)
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
    if (v4 != a3) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }

  uint64_t v9 = sub_5BC0(&qword_39ED0);
  uint64_t v10 = (void *)swift_allocObject(v9, v8 + 32, 7LL);
  int64_t v11 = j__malloc_size(v10);
  uint64_t v12 = v11 - 32;
  if (v11 < 32) {
    uint64_t v12 = v11 - 25;
  }
  v10[2] = v5;
  v10[3] = (2 * (v12 >> 3)) | 1;
  if (v4 == a3)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

void *sub_21678(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_16;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 > 0)
  {
    uint64_t v8 = sub_5BC0(&qword_3A980);
    uint64_t v9 = (void *)swift_allocObject(v8, 40 * v5 + 32, 7LL);
    size_t v10 = j__malloc_size(v9);
    v9[2] = v5;
    v9[3] = 2 * ((uint64_t)(v10 - 32) / 40);
    if (v4 != a3) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

  uint64_t v9 = _swiftEmptyArrayStorage;
  if (v4 == a3)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

void *sub_21800(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 > 0)
  {
    uint64_t v8 = sub_5BC0(&qword_3A9A0);
    uint64_t v9 = *(void *)(sub_5BC0(&qword_399F0) - 8);
    uint64_t v10 = *(void *)(v9 + 72);
    uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v12 = (v11 + 32) & ~v11;
    unint64_t v13 = (void *)swift_allocObject(v8, v12 + v10 * v5, v11 | 7);
    size_t v14 = j__malloc_size(v13);
    if (!v10)
    {
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }

    if (v14 - v12 == 0x8000000000000000LL && v10 == -1) {
      goto LABEL_23;
    }
    void v13[2] = v5;
    v13[3] = 2 * ((uint64_t)(v14 - v12) / v10);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }

  unint64_t v13 = _swiftEmptyArrayStorage;
  if (v4 == a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

void *sub_219D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_5BC0(&qword_3A1B8);
  unint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_22CAC((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10A9C(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

void *sub_21AB4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 > 0)
  {
    uint64_t v8 = sub_5BC0(&qword_3A9B0);
    uint64_t v9 = *(void *)(type metadata accessor for PatternStoreValue(0LL) - 8);
    uint64_t v10 = *(void *)(v9 + 72);
    uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v12 = (v11 + 32) & ~v11;
    unint64_t v13 = (void *)swift_allocObject(v8, v12 + v10 * v5, v11 | 7);
    size_t v14 = j__malloc_size(v13);
    if (!v10)
    {
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }

    if (v14 - v12 == 0x8000000000000000LL && v10 == -1) {
      goto LABEL_23;
    }
    void v13[2] = v5;
    v13[3] = 2 * ((uint64_t)(v14 - v12) / v10);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }

  unint64_t v13 = _swiftEmptyArrayStorage;
  if (v4 == a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

uint64_t type metadata accessor for RectifiStoreApi()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin15RectifiStoreApi);
}

Swift::Int sub_21C9C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v137 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v131 = *(void *)(v137 - 8);
  uint64_t v4 = __chkstk_darwin(v137);
  uint64_t v128 = (uint64_t)&v122 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v138 = (uint64_t)&v122 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v134 = (uint64_t)&v122 - v9;
  __chkstk_darwin(v8);
  uint64_t v133 = (uint64_t)&v122 - v10;
  Swift::Int v11 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v11);
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_140;
    }
    if (v11) {
      return sub_22620(0LL, v11, 1LL, a1);
    }
    return result;
  }

  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_148;
  }
  Swift::Int v124 = result;
  if (v11 < 2)
  {
    uint64_t v17 = (char *)&_swiftEmptyArrayStorage;
    unint64_t v130 = (unint64_t)&_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v131 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    uint64_t v123 = &_swiftEmptyArrayStorage;
    if (v11 != 1)
    {
      unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_106:
      if (v19 >= 2)
      {
        uint64_t v115 = *a1;
        do
        {
          unint64_t v116 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_135;
          }
          if (!v115) {
            goto LABEL_147;
          }
          uint64_t v117 = *(void *)&v17[16 * v116 + 32];
          uint64_t v118 = *(void *)&v17[16 * v19 + 24];
          sub_22834( v115 + *(void *)(v131 + 72) * v117,  v115 + *(void *)(v131 + 72) * *(void *)&v17[16 * v19 + 16],  v115 + *(void *)(v131 + 72) * v118,  v130);
          if (v2) {
            break;
          }
          if (v118 < v117) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0) {
            uint64_t v17 = sub_18E4C((uint64_t)v17);
          }
          if (v116 >= *((void *)v17 + 2)) {
            goto LABEL_137;
          }
          uint64_t v119 = &v17[16 * v116 + 32];
          *(void *)uint64_t v119 = v117;
          *((void *)v119 + 1) = v118;
          unint64_t v120 = *((void *)v17 + 2);
          if (v19 > v120) {
            goto LABEL_138;
          }
          memmove(&v17[16 * v19 + 16], &v17[16 * v19 + 32], 16 * (v120 - v19));
          *((void *)v17 + sub_1AD44(v0 + 2) = v120 - 1;
          unint64_t v19 = v120 - 1;
        }

        while (v120 > 2);
      }

LABEL_117:
      swift_bridgeObjectRelease(v17);
      uint64_t v121 = v123;
      v123[2] = 0LL;
      return swift_bridgeObjectRelease(v121);
    }
  }

  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t v15 = static Array._allocateBufferUninitialized(minimumCapacity:)(v13 >> 1, v137);
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(unsigned __int8 *)(v131 + 80);
    uint64_t v123 = (void *)v15;
    unint64_t v130 = v15 + ((v16 + 32) & ~v16);
  }

  Swift::Int v18 = 0LL;
  uint64_t v17 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v135 = a1;
  while (1)
  {
    uint64_t v126 = v17;
    Swift::Int v20 = v18 + 1;
    Swift::Int v129 = v18;
    if (v18 + 1 >= v11)
    {
      Swift::Int v27 = v18;
      Swift::Int v37 = v18 + 1;
      uint64_t v17 = v126;
      goto LABEL_58;
    }

    uint64_t v125 = v2;
    uint64_t v21 = *a1;
    uint64_t v22 = *(void *)(v131 + 72);
    uint64_t v23 = v133;
    sub_CF7C(*a1 + v22 * v20, v133);
    uint64_t v24 = v134;
    sub_CF7C(v21 + v22 * v129, v134);
    uint64_t v25 = *(int *)(v137 + 20);
    Swift::Int v139 = *(void *)(v23 + v25);
    Swift::Int v136 = *(void *)(v24 + v25);
    sub_D764(v24);
    uint64_t v26 = v23;
    Swift::Int v27 = v129;
    sub_D764(v26);
    uint64_t v140 = v22;
    uint64_t v132 = v21;
    if (v27 + 2 >= v11)
    {
      Swift::Int v30 = v27 + 2;
    }

    else
    {
      uint64_t v28 = v22 * v20;
      uint64_t v29 = v21;
      Swift::Int v30 = v27 + 2;
      uint64_t v31 = v22 * (v27 + 2);
      while (1)
      {
        Swift::Int v32 = v11;
        int v33 = v136 < v139;
        uint64_t v34 = v133;
        sub_CF7C(v29 + v31, v133);
        uint64_t v35 = v134;
        sub_CF7C(v29 + v28, v134);
        int v36 = *(void *)(v35 + *(int *)(v137 + 20)) >= *(void *)(v34 + *(int *)(v137 + 20));
        sub_D764(v35);
        sub_D764(v34);
        if (v33 == v36) {
          break;
        }
        uint64_t v22 = v140;
        v29 += v140;
        ++v30;
        Swift::Int v11 = v32;
        if (v32 == v30)
        {
          Swift::Int v30 = v32;
          a1 = v135;
          Swift::Int v27 = v129;
          goto LABEL_24;
        }
      }

      a1 = v135;
      Swift::Int v27 = v129;
      Swift::Int v11 = v32;
      uint64_t v22 = v140;
    }

LABEL_89:
        if ((v92 & 1) != 0) {
          goto LABEL_127;
        }
        uint64_t v100 = &v66[16 * v69];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v80 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v80) {
          goto LABEL_130;
        }
        if (v103 < v91) {
          goto LABEL_14;
        }
LABEL_97:
        unint64_t v108 = v69 - 1;
        if (v69 - 1 >= v19)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
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
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }

        uint64_t v109 = *a1;
        if (!*a1) {
          goto LABEL_145;
        }
        uint64_t v110 = &v66[16 * v108];
        uint64_t v111 = *(void *)v110;
        Swift::Int v112 = &v66[16 * v69];
        uint64_t v113 = *((void *)v112 + 1);
        sub_22834( v109 + *(void *)(v131 + 72) * *(void *)v110,  v109 + *(void *)(v131 + 72) * *(void *)v112,  v109 + *(void *)(v131 + 72) * v113,  v130);
        if (v2) {
          goto LABEL_117;
        }
        if (v113 < v111) {
          goto LABEL_120;
        }
        if (v69 > *((void *)v17 + 2)) {
          goto LABEL_121;
        }
        *(void *)uint64_t v110 = v111;
        *(void *)&v66[16 * v108 + 8] = v113;
        unint64_t v114 = *((void *)v17 + 2);
        if (v69 >= v114) {
          goto LABEL_122;
        }
        unint64_t v19 = v114 - 1;
        memmove(&v66[16 * v69], v112 + 16, 16 * (v114 - 1 - v69));
        *((void *)v17 + sub_1AD44(v0 + 2) = v114 - 1;
        a1 = v135;
        if (v114 <= 2) {
          goto LABEL_14;
        }
      }
    }

    unint64_t v19 = 1LL;
LABEL_14:
    Swift::Int v11 = a1[1];
    Swift::Int v18 = v136;
    if (v136 >= v11) {
      goto LABEL_106;
    }
  }

  Swift::Int v37 = v30;
LABEL_38:
  uint64_t v2 = v125;
  if (v37 >= v11) {
    goto LABEL_58;
  }
LABEL_41:
  if (__OFSUB__(v37, v27)) {
    goto LABEL_139;
  }
  if (v37 - v27 >= v124) {
    goto LABEL_58;
  }
  if (__OFADD__(v27, v124)) {
    goto LABEL_142;
  }
  if (v27 + v124 >= v11) {
    Swift::Int v45 = v11;
  }
  else {
    Swift::Int v45 = v27 + v124;
  }
  if (v45 >= v27)
  {
    if (v37 != v45)
    {
      uint64_t v125 = v2;
      uint64_t v46 = *(void *)(v131 + 72);
      uint64_t v47 = v46 * (v37 - 1);
      uint64_t v132 = v46;
      Swift::Int v48 = v37 * v46;
      Swift::Int v127 = v45;
      do
      {
        uint64_t v50 = 0LL;
        Swift::Int v136 = v37;
        while (1)
        {
          Swift::Int v139 = v27;
          uint64_t v51 = *a1;
          Swift::Int v52 = v48;
          uint64_t v53 = v48 + v50 + *a1;
          uint64_t v54 = v133;
          sub_CF7C(v53, v133);
          uint64_t v55 = v47;
          uint64_t v56 = v47 + v50 + v51;
          uint64_t v57 = v134;
          sub_CF7C(v56, v134);
          uint64_t v58 = *(int *)(v137 + 20);
          uint64_t v140 = *(void *)(v54 + v58);
          uint64_t v59 = *(void *)(v57 + v58);
          sub_D764(v57);
          sub_D764(v54);
          if (v59 >= v140) {
            break;
          }
          uint64_t v60 = *a1;
          if (!*a1) {
            goto LABEL_144;
          }
          Swift::Int v48 = v52;
          uint64_t v61 = v60 + v52 + v50;
          uint64_t v47 = v55;
          uint64_t v62 = v60 + v55 + v50;
          sub_CEF4(v61, v138);
          swift_arrayInitWithTakeFrontToBack(v61, v62, 1LL, v137);
          sub_CEF4(v138, v62);
          v50 -= v132;
          Swift::Int v27 = v139 + 1;
          a1 = v135;
          Swift::Int v49 = v136;
          if (v136 == v139 + 1) {
            goto LABEL_51;
          }
        }

        Swift::Int v49 = v136;
        uint64_t v47 = v55;
        Swift::Int v48 = v52;
LABEL_51:
        Swift::Int v37 = v49 + 1;
        v47 += v132;
        v48 += v132;
        Swift::Int v27 = v129;
      }

      while (v37 != v127);
      Swift::Int v37 = v127;
      uint64_t v2 = v125;
      uint64_t v17 = v126;
    }

    goto LABEL_58;
  }

uint64_t sub_22620(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v30 = a1;
  uint64_t v33 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v7 = __chkstk_darwin(v33);
  uint64_t v34 = (uint64_t)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  Swift::Int v11 = (char *)&v28 - v10;
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v32 = a3;
  uint64_t v29 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v36 = v16 * (v32 - 1);
    uint64_t v31 = v16;
    uint64_t v35 = v16 * v32;
LABEL_5:
    uint64_t v17 = 0LL;
    uint64_t v18 = v30;
    while (1)
    {
      unint64_t v19 = a4;
      uint64_t v20 = *a4;
      sub_CF7C(v35 + v17 + v20, (uint64_t)v15);
      sub_CF7C(v36 + v17 + v20, (uint64_t)v11);
      uint64_t v21 = *(int *)(v33 + 20);
      uint64_t v22 = *(void *)&v15[v21];
      uint64_t v23 = *(void *)&v11[v21];
      sub_D764((uint64_t)v11);
      uint64_t result = sub_D764((uint64_t)v15);
      BOOL v24 = v23 < v22;
      a4 = v19;
      if (!v24)
      {
LABEL_4:
        v36 += v31;
        v35 += v31;
        if (++v32 == v29) {
          return result;
        }
        goto LABEL_5;
      }

      uint64_t v25 = *v19;
      if (!*v19) {
        break;
      }
      uint64_t v26 = v25 + v35 + v17;
      uint64_t v27 = v25 + v36 + v17;
      sub_CEF4(v26, v34);
      swift_arrayInitWithTakeFrontToBack(v26, v27, 1LL, v33);
      uint64_t result = sub_CEF4(v34, v27);
      v17 -= v31;
      ++v18;
      a4 = v19;
      if (v32 == v18) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_22834(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for PatternStoreValue(0LL);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v50 = (uint64_t)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v46 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }

  if (a2 - a1 == 0x8000000000000000LL && v14 == -1) {
    goto LABEL_71;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000LL && v14 == -1) {
    goto LABEL_72;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v53 = a1;
  unint64_t v52 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    unint64_t v49 = a1;
    if ((v17 & 0x8000000000000000LL) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2, v17, v8);
      }

      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4);
      }

      unint64_t v30 = a4 + v19;
      unint64_t v51 = a4 + v19;
      unint64_t v53 = a2;
      if (v19 >= 1 && v49 < a2)
      {
        uint64_t v32 = -v14;
        uint64_t v47 = v8;
        unint64_t v48 = a4;
        do
        {
          unint64_t v33 = a3 + v32;
          sub_CF7C(v30 + v32, (uint64_t)v12);
          unint64_t v34 = a2 + v32;
          uint64_t v35 = (uint64_t)v12;
          uint64_t v36 = v50;
          sub_CF7C(a2 + v32, v50);
          uint64_t v37 = *(int *)(v8 + 20);
          uint64_t v38 = *(void *)(v35 + v37);
          uint64_t v39 = *(void *)(v36 + v37);
          uint64_t v40 = v36;
          uint64_t v12 = (char *)v35;
          sub_D764(v40);
          sub_D764(v35);
          if (v39 >= v38)
          {
            unint64_t v42 = v51;
            unint64_t v43 = v51 + v32;
            v51 += v32;
            if (a3 < v42 || v33 >= v42)
            {
              uint64_t v8 = v47;
              swift_arrayInitWithTakeFrontToBack(a3 + v32, v43, 1LL, v47);
              unint64_t v34 = a2;
              unint64_t v41 = v48;
            }

            else
            {
              uint64_t v8 = v47;
              unint64_t v41 = v48;
              if (a3 != v42) {
                swift_arrayInitWithTakeBackToFront(a3 + v32);
              }
              unint64_t v34 = a2;
            }
          }

          else
          {
            if (a3 < a2 || v33 >= a2)
            {
              uint64_t v8 = v47;
              swift_arrayInitWithTakeFrontToBack(a3 + v32, a2 + v32, 1LL, v47);
              unint64_t v41 = v48;
            }

            else
            {
              uint64_t v8 = v47;
              unint64_t v41 = v48;
              if (a3 != a2) {
                swift_arrayInitWithTakeBackToFront(a3 + v32);
              }
            }

            v53 += v32;
          }

          unint64_t v30 = v51;
          if (v51 <= v41) {
            break;
          }
          a2 = v34;
          a3 += v32;
        }

        while (v34 > v49);
      }

      goto LABEL_69;
    }
  }

  else if ((v16 & 0x8000000000000000LL) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1, v16, v8);
    }

    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4);
    }

    unint64_t v49 = a4 + v18;
    unint64_t v51 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      uint64_t v21 = v50;
      do
      {
        sub_CF7C(a2, (uint64_t)v12);
        sub_CF7C(a4, v21);
        uint64_t v22 = *(int *)(v8 + 20);
        uint64_t v23 = *(void *)&v12[v22];
        uint64_t v24 = *(void *)(v21 + v22);
        sub_D764(v21);
        sub_D764((uint64_t)v12);
        unint64_t v25 = v53;
        if (v24 >= v23)
        {
          unint64_t v28 = v52 + v14;
          if (v53 < v52 || v53 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack(v53, v52, 1LL, v8);
          }

          else if (v53 != v52)
          {
            swift_arrayInitWithTakeBackToFront(v53);
          }

          unint64_t v52 = v28;
          unint64_t v26 = a2;
        }

        else
        {
          unint64_t v26 = a2 + v14;
          if (v53 < a2 || v53 >= v26)
          {
            swift_arrayInitWithTakeFrontToBack(v53, a2, 1LL, v8);
          }

          else if (v53 == a2)
          {
            unint64_t v25 = a2;
          }

          else
          {
            swift_arrayInitWithTakeBackToFront(v53);
          }
        }

        unint64_t v53 = v25 + v14;
        a4 = v52;
        if (v52 >= v49) {
          break;
        }
        a2 = v26;
      }

      while (v26 < a3);
    }

LABEL_69:
    sub_18D40(&v53, &v52, (uint64_t *)&v51);
    return 1LL;
  }

LABEL_73:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_22CAC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain(v21);
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

uint64_t sub_22EA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v5 = a4 + 40 * a1 + 32;
  unint64_t v6 = a3 + 40 * v4;
  if (v5 >= v6 || v5 + 40 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_22F9C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_23084(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_23174(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v5 = a4 + 24 * a1 + 32;
  unint64_t v6 = a3 + 24 * v4;
  if (v5 >= v6 || v5 + 24 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_23268(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_23350(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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

uint64_t sub_23468(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v5 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v7 = a4 + 8 * a1 + 32;
    unint64_t v8 = a3 + 8 * v5;
    if (v7 >= v8 || v7 + 8 * v5 <= a3)
    {
      sub_5BC0(a5);
      swift_arrayInitWithCopy(a3);
      return v8;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_2356C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_2365C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_23698(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  if (v2)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = _swiftEmptyArrayStorage[2];
    uint64_t v5 = 2 * v4;
    do
    {
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v6 >> 1) {
        sub_27884(v6 > 1, v4 + v3 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      unint64_t v7 = &_swiftEmptyArrayStorage[v5];
      v7[4] = v3;
      v7[5] = -1LL;
      v5 += 2LL;
      ++v3;
    }

    while (v2 != v3);
  }

  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

void sub_23788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::UInt v6 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v6);
  if (v6)
  {
    swift_bridgeObjectRetain(a2);
    unint64_t v7 = (void *)(a2 + 40);
    do
    {
      uint64_t v8 = *(v7 - 1);
      uint64_t v9 = *v7;
      swift_bridgeObjectRetain(*v7);
      String.hash(into:)(a1, v8, v9);
      swift_bridgeObjectRelease(v9);
      v7 += 2;
      --v6;
    }

    while (v6);
    swift_bridgeObjectRelease(a2);
  }

  Swift::UInt v10 = *(void *)(a3 + 16);
  Hasher._combine(_:)(v10);
  if (v10)
  {
    swift_bridgeObjectRetain(a3);
    uint64_t v11 = (void *)(a3 + 40);
    do
    {
      uint64_t v12 = *(v11 - 1);
      uint64_t v13 = *v11;
      swift_bridgeObjectRetain(*v11);
      String.hash(into:)(a1, v12, v13);
      swift_bridgeObjectRelease(v13);
      v11 += 2;
      --v10;
    }

    while (v10);
    swift_bridgeObjectRelease(a3);
  }

Swift::Int sub_23880()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)(v4, 0LL);
  sub_23788((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

void sub_238C8(uint64_t a1)
{
}

Swift::Int sub_238D0(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  Hasher.init(_seed:)(v5, a1);
  sub_23788((uint64_t)v5, v2, v3);
  return Hasher._finalize()();
}

uint64_t sub_23914(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a2 + 8);
  if ((sub_9C34(*(void **)a1, *(void **)a2) & 1) != 0) {
    return sub_9C34(v2, v3);
  }
  else {
    return 0LL;
  }
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.__allocating_init()()
{
  uint64_t v1 = swift_allocObject(v0, 192LL, 7LL);
  SiriPrivateLearningPatternExtractionPlugin.init()();
  return v1;
}

void *SiriPrivateLearningPatternExtractionPlugin.init()()
{
  uint64_t v1 = v0;
  *(void *)&__int128 v34 = type metadata accessor for EnvironmentFeatureFlags(0LL);
  *((void *)&v34 + 1) = &protocol witness table for EnvironmentFeatureFlags;
  sub_23C70(&v33);
  EnvironmentFeatureFlags.init()();
  sub_1AD64(&v33, (uint64_t)(v0 + 12));
  uint64_t v2 = type metadata accessor for PatternLogger();
  uint64_t v3 = swift_allocObject(v2, 16LL, 7LL);
  v1[20] = v2;
  v1[21] = &off_357B0;
  v1[17] = v3;
  uint64_t v4 = type metadata accessor for RECTIFITrialStatusResolver(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v1[2] = RECTIFITrialStatusResolver.init()();
  v1[5] = v4;
  v1[6] = &protocol witness table for RECTIFITrialStatusResolver;
  sub_1AD00((uint64_t)(v1 + 2), (uint64_t)v36);
  type metadata accessor for PLLoggingReader(0LL);
  uint64_t v5 = ((uint64_t (*)(void))static PLLoggingReader.shared.getter)();
  PLLoggingReader.asyncSignalReader.getter(&v33);
  swift_release(v5);
  __int128 v31 = v34;
  uint64_t v6 = v34;
  unint64_t v7 = sub_19594(&v33, v34);
  *(_OWORD *)&v35[3] = v31;
  uint64_t v8 = sub_23C70(v35);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(v8, v7, v6);
  uint64_t v9 = sub_1AD44(&v33);
  uint64_t v10 = static PLLoggingReader.shared.getter(v9);
  PLLoggingReader.streamBookmarkStore.getter(&v33);
  uint64_t v11 = swift_release(v10);
  uint64_t v12 = static PLLoggingReader.shared.getter(v11);
  PLLoggingReader.interactionReader.getter(v32);
  swift_release(v12);
  uint64_t v13 = type metadata accessor for NLXFeatureExtractor(0LL);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  uint64_t v14 = NLXFeatureExtractor.init()();
  uint64_t v15 = type metadata accessor for ASRFeatureExtractor(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = ASRFeatureExtractor.init()();
  uint64_t v17 = type metadata accessor for UEIFeatureExtractor(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = UEIFeatureExtractor.init()();
  uint64_t v19 = type metadata accessor for ItemSequenceFetcher();
  uint64_t v20 = swift_allocObject(v19, 224LL, 7LL);
  *(_OWORD *)(v20 + 20sub_27884(0, 0LL, 0) = xmmword_2E990;
  *(void *)(v20 + 216) = 0x404E000000000000LL;
  sub_1AD64((__int128 *)v35, v20 + 16);
  sub_1AD64(&v33, v20 + 56);
  *(void *)(v20 + 96) = v14;
  *(void *)(v20 + 104) = v16;
  *(void *)(v20 + 11sub_1AD44(v0 + 2) = v18;
  sub_1AD64(v32, v20 + 120);
  sub_1AD64(v36, v20 + 160);
  v1[10] = v19;
  v1[11] = &off_35400;
  v1[7] = v20;
  if (qword_39718 != -1) {
    swift_once(&qword_39718, sub_6100);
  }
  uint64_t v22 = qword_3AB78;
  uint64_t v21 = unk_3AB80;
  uint64_t v23 = v1[5];
  uint64_t v24 = v1[6];
  sub_19594(v1 + 2, v23);
  uint64_t v25 = dispatch thunk of RECTIFITrialStatusResolving.getRECTIFICoreDataStoreName()(v23, v24);
  uint64_t v27 = v26;
  *(void *)&__int128 v33 = v22;
  *((void *)&v33 + 1) = v21;
  swift_bridgeObjectRetain(v21);
  v28._countAndFlagsBits = v25;
  v28._object = v27;
  String.append(_:)(v28);
  swift_bridgeObjectRelease(v27);
  uint64_t v29 = *((void *)&v33 + 1);
  v1[22] = v33;
  v1[23] = v29;
  return v1;
}

void *sub_23C70(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.run(context:completion:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_5BC0(&qword_3A9C8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (v15 + 40) & ~v15;
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v18 = (char *)swift_allocObject(&unk_357F0, v17 + 16, v15 | 7);
  *((void *)v18 + sub_1AD44(v0 + 2) = 0LL;
  *((void *)v18 + 3) = 0LL;
  *((void *)v18 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v16], v10, v7);
  uint64_t v19 = &v18[v17];
  *(void *)uint64_t v19 = a2;
  *((void *)v19 + 1) = a3;
  swift_retain(v3);
  swift_retain(a3);
  uint64_t v20 = sub_24258((uint64_t)v13, (uint64_t)&unk_3A9D8, (uint64_t)v18);
  return swift_release(v20);
}

uint64_t sub_23E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[10] = a6;
  v7[11] = a7;
  v7[8] = a4;
  void v7[9] = a5;
  uint64_t v8 = type metadata accessor for PrivateLearningPluginResult(0LL);
  v7[12] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[13] = v9;
  v7[14] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_23E7C, 0LL, 0LL);
}

uint64_t sub_23E7C()
{
  uint64_t v1 = *(void **)(v0 + 64);
  uint64_t v2 = v1[15];
  uint64_t v3 = v1[16];
  sub_19594(v1 + 12, v2);
  uint64_t v4 = type metadata accessor for SiriPrivateLearningFeatureFlag(0LL);
  *(void *)(v0 + 4sub_27884(0, 0LL, 0) = v4;
  *(void *)(v0 + 48) = sub_1AD7C( &qword_3AB58,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriPrivateLearningFeatureFlag,  (uint64_t)&protocol conformance descriptor for SiriPrivateLearningFeatureFlag);
  uint64_t v5 = sub_23C70((void *)(v0 + 16));
  (*(void (**)(void *, void, uint64_t))(*(void *)(v4 - 8) + 104LL))( v5,  enum case for SiriPrivateLearningFeatureFlag.rectifiPatternExtraction(_:),  v4);
  char v6 = dispatch thunk of FeatureFlagsResolving.isFeatureEnabled(_:)(v0 + 16, v2, v3);
  sub_1AD44((void *)(v0 + 16));
  if ((v6 & 1) != 0
    || (uint64_t v7 = *(void **)(v0 + 64),
        uint64_t v8 = v7[5],
        uint64_t v9 = v7[6],
        sub_19594(v7 + 2, v8),
        (dispatch thunk of RECTIFITrialStatusResolving.isRECTIFIPatternExtractionEnabled()(v8, v9) & 1) != 0))
  {
    uint64_t v10 = (void *)swift_task_alloc(dword_3AA0C);
    *(void *)(v0 + 1sub_1AD44(v0 + 20) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_23FF4;
    return sub_24C58(*(void *)(v0 + 72));
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v13 = *(void (**)(uint64_t))(v0 + 80);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 104) + 104LL))( v12,  enum case for PrivateLearningPluginResult.success(_:),  *(void *)(v0 + 96));
    v13(v12);
    uint64_t v14 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 104) + 8LL))(v14, *(void *)(v0 + 96));
    swift_task_dealloc(v14);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_23FF4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 120LL);
  *(void *)(*(void *)v1 + 128LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_240D0;
  }
  else {
    uint64_t v3 = sub_24058;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_24058()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 80);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 104) + 104LL))( v1,  enum case for PrivateLearningPluginResult.success(_:),  *(void *)(v0 + 96));
  v2(v1);
  uint64_t v3 = *(void *)(v0 + 112);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 104) + 8LL))(v3, *(void *)(v0 + 96));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240D0()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void (**)(uint64_t))(v0 + 80);
  *(void *)(v0 + 56) = v1;
  swift_errorRetain(v1);
  uint64_t v6 = sub_5BC0(&qword_3A160);
  uint64_t v7 = String.init<A>(describing:)(v0 + 56, v6);
  PrivateLearningPluginError.init(message:)(v7);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))( v2,  enum case for PrivateLearningPluginResult.failure(_:),  v4);
  v5(v2);
  swift_errorRelease(v1);
  uint64_t v8 = *(void *)(v0 + 112);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 104) + 8LL))(v8, *(void *)(v0 + 96));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2419C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PrivateLearningPluginRunContext(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc(dword_3A9D4);
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_1B52C;
  return sub_23E18(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_24258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_2C548(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_35840, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_3AB50, v17);
}

unint64_t sub_2439C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ItemSequenceData(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v91 = (uint64_t *)((char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unint64_t v6 = 0xE000000000000000LL;
  uint64_t v106 = 0LL;
  unint64_t v107 = 0xE000000000000000LL;
  unint64_t v108 = _swiftEmptyArrayStorage;
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  sub_19594(v1 + 2, v7);
  double v9 = dispatch thunk of RECTIFITrialStatusResolving.getSimilarityThreshold()(v7, v8);
  uint64_t v11 = v1[5];
  uint64_t v10 = v1[6];
  sub_19594(v1 + 2, v11);
  dispatch thunk of RECTIFITrialStatusResolving.getSimilarityMinThreshold()(v11, v10);
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
    uint64_t v83 = _swiftEmptyArrayStorage;
LABEL_71:
    swift_bridgeObjectRelease(v6);
    return (unint64_t)v83;
  }

  double v14 = v12;
  uint64_t v15 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v84 = a1;
  uint64_t v16 = a1;
  uint64_t v17 = v15;
  swift_bridgeObjectRetain(v16);
  __n128 v18 = swift_beginAccess(&v106, v105, 1LL, 0LL);
  uint64_t v19 = 0LL;
  uint64_t v20 = *(void *)(v4 + 72);
  uint64_t v87 = &v101;
  v18.n128_u64[0] = 136315138LL;
  __n128 v86 = v18;
  uint64_t v85 = (char *)&type metadata for Any + 8;
  uint64_t v95 = _swiftEmptyArrayStorage;
  uint64_t v94 = _swiftEmptyArrayStorage;
  uint64_t v21 = v91;
  uint64_t v88 = v17;
  uint64_t v90 = v13;
  uint64_t v89 = v20;
  while (1)
  {
    sub_2C36C(v17 + v20 * v19, (uint64_t)v21, type metadata accessor for ItemSequenceData);
    uint64_t v22 = v21[1];
    uint64_t v23 = *(void *)(v22 + 16);
    if (v23) {
      break;
    }
LABEL_3:
    sub_2C3B0((uint64_t)v21, type metadata accessor for ItemSequenceData);
LABEL_4:
    if (++v19 == v13)
    {
      swift_bridgeObjectRelease(v84);
      unint64_t v6 = v107;
      uint64_t v83 = v94;
      goto LABEL_71;
    }
  }

  uint64_t v24 = 0LL;
  uint64_t v99 = v22 + 32;
  while (1)
  {
    double v25 = *(double *)(v22 + 8 * v24 + 32);
    if (v9 < v25 && v25 < 1.0) {
      break;
    }
    if (v23 == ++v24) {
      goto LABEL_3;
    }
  }

  unint64_t v27 = v107;
  uint64_t v106 = 0x65636E6575716553LL;
  unint64_t v107 = 0xEA00000000000A3ALL;
  swift_bridgeObjectRelease(v27);
  unint64_t v103 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v104 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v28 = *v21;
  if (!((unint64_t)*v21 >> 62))
  {
    uint64_t v29 = *(void *)((char *)&dword_10 + (v28 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(*v21);
    unint64_t result = swift_bridgeObjectRetain(v22);
    if (v29) {
      goto LABEL_15;
    }
LABEL_44:
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v28);
LABEL_45:
    uint64_t v57 = v104;
    if ((unint64_t)v104 >> 62)
    {
      if (v104 < 0) {
        uint64_t v71 = v104;
      }
      else {
        uint64_t v71 = v104 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v104);
      uint64_t v72 = _CocoaArrayWrapper.endIndex.getter(v71);
      swift_bridgeObjectRelease(v57);
      if (v72) {
        goto LABEL_47;
      }
    }

    else if (*(void *)((char *)&dword_10 + (v104 & 0xFFFFFFFFFFFFF8LL)))
    {
LABEL_47:
      uint64_t v58 = v95;
      if ((swift_isUniquelyReferenced_nonNull_native(v95) & 1) == 0) {
        uint64_t v58 = sub_205F4(0LL, v58[2] + 1LL, 1, v58);
      }
      unint64_t v60 = v58[2];
      unint64_t v59 = v58[3];
      uint64_t v95 = v58;
      if (v60 >= v59 >> 1) {
        uint64_t v95 = sub_205F4((void *)(v59 > 1), v60 + 1, 1, v95);
      }
      uint64_t v61 = v95;
      v95[2] = v60 + 1;
      v61[v60 + 4] = v57;
      unint64_t v62 = v103;
      unint64_t v63 = v94;
      if ((swift_isUniquelyReferenced_nonNull_native(v94) & 1) == 0) {
        unint64_t v63 = sub_20B60(0LL, v63[2] + 1LL, 1, v63);
      }
      uint64_t v94 = v63;
      unint64_t v65 = v63[2];
      unint64_t v64 = v63[3];
      if (v65 >= v64 >> 1) {
        uint64_t v94 = sub_20B60((void *)(v64 > 1), v65 + 1, 1, v94);
      }
      uint64_t v66 = v94;
      v94[2] = v65 + 1;
      v66[v65 + 4] = v62;
      id v67 = (id)v21[2];
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v67);
      unint64_t v69 = v108[2];
      unint64_t v68 = v108[3];
      if (v69 >= v68 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v68 > 1, v69 + 1, 1LL);
      }
      uint64_t v70 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v69, v67);
      specialized Array._endMutation()(v70);
      goto LABEL_63;
    }

    unint64_t v73 = v103;
    swift_bridgeObjectRelease(v57);
    swift_bridgeObjectRelease(v73);
LABEL_63:
    if (qword_39730 != -1) {
      swift_once(&qword_39730, sub_1B530);
    }
    uint64_t v74 = type metadata accessor for Logger(0LL);
    uint64_t v75 = sub_D710(v74, (uint64_t)qword_3AB98);
    uint64_t v76 = (os_log_s *)Logger.logObject.getter(v75);
    os_log_type_t v77 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v79 = swift_slowAlloc(32LL, -1LL);
      uint64_t v101 = v79;
      *(_DWORD *)uint64_t v78 = v86.n128_u32[0];
      uint64_t v80 = v106;
      unint64_t v81 = v107;
      swift_bridgeObjectRetain(v107);
      uint64_t v100 = sub_20E38(v80, v81, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, v87, v78 + 4, v78 + 12);
      unint64_t v82 = v81;
      uint64_t v17 = v88;
      uint64_t v21 = v91;
      swift_bridgeObjectRelease(v82);
      _os_log_impl(&dword_0, v76, v77, "%s", v78, 0xCu);
      swift_arrayDestroy(v79, 1LL, v85);
      swift_slowDealloc(v79, -1LL, -1LL);
      swift_slowDealloc(v78, -1LL, -1LL);
    }

    sub_2C3B0((uint64_t)v21, type metadata accessor for ItemSequenceData);
    uint64_t v13 = v90;
    uint64_t v20 = v89;
    goto LABEL_4;
  }

  if (v28 < 0) {
    uint64_t v56 = *v21;
  }
  else {
    uint64_t v56 = v28 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(*v21, 2LL);
  swift_bridgeObjectRetain(v22);
  uint64_t v29 = _CocoaArrayWrapper.endIndex.getter(v56);
  unint64_t result = swift_bridgeObjectRelease(v28);
  if (!v29) {
    goto LABEL_44;
  }
LABEL_15:
  unint64_t v98 = v28 & 0xC000000000000001LL;
  if ((v28 & 0xC000000000000001LL) != 0)
  {
    unint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v28);
    unint64_t v31 = result;
  }

  else
  {
    unint64_t v31 = *(void *)(v28 + 32);
    unint64_t result = swift_retain(v31);
  }

  uint64_t v97 = *(void *)(v22 + 16);
  if (!v97)
  {
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v28);
    swift_release(v31);
    goto LABEL_45;
  }

  unint64_t v32 = 0LL;
  uint64_t v93 = v28 & 0xFFFFFFFFFFFFFF8LL;
  uint64_t v92 = v28 + 40;
  uint64_t v96 = v29 - 1;
  while (v32 < *(void *)(v22 + 16))
  {
    double v33 = *(double *)(v99 + 8 * v32);
    if (v33 != -1.0 && v33 < v14)
    {
      swift_release(v31);
LABEL_37:
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v28);
LABEL_39:
      uint64_t v21 = v91;
      uint64_t v17 = v88;
      goto LABEL_45;
    }

    swift_retain(v31);
    uint64_t v35 = sub_1D3A0();
    uint64_t v37 = v36;
    swift_release(v31);
    uint64_t v101 = v35;
    uint64_t v102 = v37;
    swift_bridgeObjectRetain(v37);
    v38._countAndFlagsBits = 10LL;
    v38._object = (void *)0xE100000000000000LL;
    String.append(_:)(v38);
    swift_bridgeObjectRelease(v37);
    uint64_t v39 = v101;
    uint64_t v40 = v102;
    swift_beginAccess(&v106, &v101, 33LL, 0LL);
    v41._countAndFlagsBits = v39;
    v41._object = v40;
    String.append(_:)(v41);
    swift_endAccess(&v101);
    swift_bridgeObjectRelease(v40);
    uint64_t v43 = *(void *)(v31 + 16);
    uint64_t v42 = *(void *)(v31 + 24);
    uint64_t v44 = *(void *)(v31 + 32);
    __int16 v45 = *(_WORD *)(v31 + 40);
    uint64_t v46 = type metadata accessor for PatternItem();
    uint64_t v47 = swift_allocObject(v46, 42LL, 7LL);
    *(void *)(v47 + 16) = v43;
    *(void *)(v47 + 24) = v42;
    *(void *)(v47 + 3sub_1AD44(v0 + 2) = v44;
    *(_WORD *)(v47 + 4sub_27884(0, 0LL, 0) = v45;
    uint64_t v48 = swift_bridgeObjectRetain(v44);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v48);
    unint64_t v50 = *(void *)((char *)&dword_10 + (v104 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v49 = *(void *)((char *)&dword_18 + (v104 & 0xFFFFFFFFFFFFFF8LL));
    if (v50 >= v49 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v49 > 1, v50 + 1, 1LL);
    }
    uint64_t v51 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v50, v47);
    specialized Array._endMutation()(v51);
    uint64_t v52 = swift_retain(v31);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v52);
    unint64_t v54 = *(void *)((char *)&dword_10 + (v103 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v53 = *(void *)((char *)&dword_18 + (v103 & 0xFFFFFFFFFFFFFF8LL));
    if (v54 >= v53 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v53 > 1, v54 + 1, 1LL);
    }
    uint64_t v55 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v31);
    specialized Array._endMutation()(v55);
    swift_release(v31);
    if (v96 == v32) {
      goto LABEL_37;
    }
    unint64_t result = v32 + 1;
    if (v98)
    {
      unint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)(result, v28);
      unint64_t v31 = result;
    }

    else
    {
      if (result >= *(void *)(v93 + 16)) {
        goto LABEL_73;
      }
      unint64_t v31 = *(void *)(v92 + 8 * v32);
      unint64_t result = swift_retain(v31);
    }

    if (v97 == ++v32)
    {
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v28);
      swift_release(v31);
      goto LABEL_39;
    }
  }

  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
  return result;
}

uint64_t sub_24C58(uint64_t a1)
{
  v2[58] = a1;
  v2[59] = v1;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  v2[60] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[61] = v4;
  v2[62] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v5 = (*(void *)(*(void *)(sub_5BC0(&qword_3AAE0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[63] = swift_task_alloc(v5);
  v2[64] = swift_task_alloc(v5);
  uint64_t v6 = type metadata accessor for OSSignpostError(0LL);
  v2[65] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[66] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[67] = swift_task_alloc(v8);
  v2[68] = swift_task_alloc(v8);
  v2[69] = swift_task_alloc(v8);
  v2[70] = swift_task_alloc(v8);
  v2[71] = swift_task_alloc(v8);
  v2[72] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for OSSignpostID(0LL);
  v2[73] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[74] = v10;
  unint64_t v11 = (*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[75] = swift_task_alloc(v11);
  v2[76] = swift_task_alloc(v11);
  v2[77] = swift_task_alloc(v11);
  v2[78] = swift_task_alloc(v11);
  v2[79] = swift_task_alloc(v11);
  v2[80] = swift_task_alloc(v11);
  v2[81] = swift_task_alloc(v11);
  uint64_t v12 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  v2[82] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[83] = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[84] = swift_task_alloc(v14);
  v2[85] = swift_task_alloc(v14);
  return swift_task_switch(sub_24E00, 0LL, 0LL);
}

uint64_t sub_24E00()
{
  uint64_t v1 = *(void *)(v0 + 680);
  uint64_t v2 = *(void *)(v0 + 664);
  uint64_t v3 = *(void *)(v0 + 656);
  uint64_t v4 = *(void *)(v0 + 464);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))( v1,  enum case for PrivateLearningPluginRunContext.maintenance(_:),  v3);
  LOBYTE(v4) = static PrivateLearningPluginRunContext.== infix(_:_:)(v4, v1);
  unint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v5(v1, v3);
  if ((v4 & 1) != 0)
  {
    if (qword_39740 != -1) {
      swift_once(&qword_39740, sub_1B5EC);
    }
    uint64_t v6 = *(void *)(v0 + 648);
    uint64_t v7 = *(void *)(v0 + 592);
    uint64_t v8 = *(void *)(v0 + 584);
    uint64_t v9 = type metadata accessor for OSSignposter(0LL);
    *(void *)(v0 + 688) = sub_D710(v9, (uint64_t)qword_3ABC8);
    uint64_t v10 = OSSignposter.logHandle.getter();
    OSSignpostID.init(log:)(v10);
    uint64_t v11 = sub_1B760("runPatternExtractionPlugin", 26LL, 2, v6);
    *(void *)(v0 + 696) = v11;
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    *(void *)(v0 + 704) = v12;
    v12(v6, v8);
    if (qword_39730 != -1) {
      swift_once(&qword_39730, sub_1B530);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    uint64_t v14 = sub_D710(v13, (uint64_t)qword_3AB98);
    *(void *)(v0 + 71sub_1AD44(v0 + 2) = v14;
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "SiriPrivateLearningPatternExtractionPlugin.run() started", v17, 2u);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    uint64_t v18 = *(void *)(v0 + 472);

    uint64_t v19 = *(void *)(v18 + 176);
    uint64_t v20 = *(void *)(v18 + 184);
    uint64_t v21 = type metadata accessor for RectifiCoreDataStore(0LL);
    swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
    swift_bridgeObjectRetain(v20);
    uint64_t v22 = sub_6194(v19, v20);
    if (v22)
    {
      uint64_t v23 = *(void *)(v0 + 472);
      *(void *)(v0 + 15sub_1AD44(v0 + 2) = v21;
      *(void *)(v0 + 16sub_27884(0, 0LL, 0) = &off_351F0;
      *(void *)(v0 + 128) = v22;
      sub_1AD64((__int128 *)(v0 + 128), v0 + 88);
      sub_19594((void *)(v23 + 56), *(void *)(v23 + 80));
      uint64_t v24 = (void *)swift_task_alloc(dword_39FBC);
      *(void *)(v0 + 7sub_1AD44(v0 + 20) = v24;
      *uint64_t v24 = v0;
      v24[1] = sub_2555C;
      return sub_15F08();
    }

    uint64_t v43 = (os_log_s *)Logger.logObject.getter(0LL);
    os_log_type_t v44 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v43, v44))
    {
      __int16 v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)__int16 v45 = 0;
      _os_log_impl(&dword_0, v43, v44, "RECTIFI on-device store error", v45, 2u);
      swift_slowDealloc(v45, -1LL, -1LL);
    }

    uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v49 = 0;
      _os_log_impl(&dword_0, v47, v48, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v49, 2u);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    unint64_t v50 = (os_log_s *)OSSignposter.logHandle.getter();
    uint64_t v51 = OSSignpostIntervalState.signpostID.getter();
    os_signpost_type_t v52 = static os_signpost_type_t.end.getter(v51);
    if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
    {
      uint64_t v53 = *(void *)(v0 + 536);
      uint64_t v54 = *(void *)(v0 + 528);
      uint64_t v55 = *(void *)(v0 + 520);
      uint64_t v56 = swift_retain(v11);
      checkForErrorAndConsumeState(state:)(v56);
      swift_release(v11);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v54 + 88))(v53, v55) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v57 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 528) + 8LL))( *(void *)(v0 + 536),  *(void *)(v0 + 520));
        uint64_t v57 = "";
      }

      uint64_t v62 = *(void *)(v0 + 648);
      uint64_t v63 = *(void *)(v0 + 600);
      uint64_t v64 = *(void *)(v0 + 584);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 592) + 16LL))(v62, v63, v64);
      unint64_t v65 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v65 = 0;
      os_signpost_id_t v66 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_0, v50, v52, v66, "runPatternExtractionPlugin", v57, v65, 2u);
      swift_slowDealloc(v65, -1LL, -1LL);

      v12(v63, v64);
      uint64_t v60 = v62;
      uint64_t v61 = v64;
    }

    else
    {
      uint64_t v58 = *(void *)(v0 + 600);
      uint64_t v59 = *(void *)(v0 + 584);

      uint64_t v60 = v58;
      uint64_t v61 = v59;
    }

    v12(v60, v61);
    swift_release(v11);
  }

  else
  {
    if (qword_39730 != -1) {
      swift_once(&qword_39730, sub_1B530);
    }
    uint64_t v26 = *(void *)(v0 + 672);
    uint64_t v27 = *(void *)(v0 + 664);
    uint64_t v28 = *(void *)(v0 + 656);
    uint64_t v29 = *(void *)(v0 + 464);
    uint64_t v30 = type metadata accessor for Logger(0LL);
    sub_D710(v30, (uint64_t)qword_3AB98);
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v29, v28);
    unint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.info.getter();
    BOOL v34 = os_log_type_enabled(v32, v33);
    uint64_t v35 = *(void *)(v0 + 672);
    uint64_t v36 = *(void *)(v0 + 656);
    if (v34)
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      uint64_t v84 = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v39 = sub_1AD7C( &qword_3AAE8,  (uint64_t (*)(uint64_t))&type metadata accessor for PrivateLearningPluginRunContext,  (uint64_t)&protocol conformance descriptor for PrivateLearningPluginRunContext);
      uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter(v36, v39);
      unint64_t v42 = v41;
      *(void *)(v0 + 376) = sub_20E38(v40, v41, &v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 376, v0 + 384, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease(v42);
      v5(v35, v36);
      _os_log_impl( &dword_0,  v32,  v33,  "SiriPrivateLearningPatternExtractionPlugin.run() is skipped because context is %s",  v37,  0xCu);
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    else
    {
      v5(*(void *)(v0 + 672), *(void *)(v0 + 656));
    }
  }

  uint64_t v67 = *(void *)(v0 + 672);
  uint64_t v68 = *(void *)(v0 + 648);
  uint64_t v69 = *(void *)(v0 + 640);
  uint64_t v70 = *(void *)(v0 + 632);
  uint64_t v71 = *(void *)(v0 + 624);
  uint64_t v72 = *(void *)(v0 + 616);
  uint64_t v73 = *(void *)(v0 + 608);
  uint64_t v74 = *(void *)(v0 + 600);
  uint64_t v75 = *(void *)(v0 + 576);
  uint64_t v76 = *(void *)(v0 + 568);
  uint64_t v77 = *(void *)(v0 + 560);
  uint64_t v78 = *(void *)(v0 + 552);
  uint64_t v79 = *(void *)(v0 + 544);
  uint64_t v80 = *(void *)(v0 + 536);
  uint64_t v81 = *(void *)(v0 + 512);
  uint64_t v82 = *(void *)(v0 + 504);
  uint64_t v83 = *(void *)(v0 + 496);
  swift_task_dealloc(*(void *)(v0 + 680));
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v71);
  swift_task_dealloc(v72);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v80);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2555C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 720);
  *(void *)(*v2 + 728) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_27100;
  }

  else
  {
    *(void *)(v4 + 736) = a1;
    uint64_t v6 = sub_255D0;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

void sub_255D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 11;
  uint64_t v3 = v1 + 55;
  v282 = v1 + 56;
  uint64_t v4 = v1[92];
  uint64_t v5 = (void *)v1[59];
  unint64_t v6 = sub_2439C(v4);
  uint64_t v8 = v7;
  uint64_t v307 = v9;
  swift_bridgeObjectRelease(v4);
  v1[56] = v8;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[6];
  v276 = v5 + 2;
  v277 = v5;
  sub_19594(v5 + 2, v10);
  swift_bridgeObjectRetain(v8);
  uint64_t v12 = dispatch thunk of RECTIFITrialStatusResolving.isRECTIFIOnDeviceStorageEnabled()(v10, v11);
  uint64_t v13 = v1[91];
  v311 = v1;
  uint64_t v295 = v6;
  if ((v12 & 1) != 0)
  {
    uint64_t v14 = *sub_19594(v2, v1[14]);
    unint64_t v15 = sub_1F5E8((uint64_t)_swiftEmptyArrayStorage);
    v1[55] = v15;
    os_log_type_t v16 = (void *)dispatch thunk of CoreDataStore.context.getter(v15);
    uint64_t v17 = swift_task_alloc(48LL);
    *(void *)(v17 + 16) = v14;
    *(void *)(v17 + 24) = v3;
    *(_BYTE *)(v17 + 3sub_1AD44(v0 + 2) = 1;
    NSManagedObjectContext.performAndWait<A>(_:)(sub_2C2C4);
    if (v13)
    {

      swift_task_dealloc(v17);
      swift_bridgeObjectRelease(v1[55]);
      swift_bridgeObjectRelease(v1[56]);
      swift_bridgeObjectRelease(v295);
      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRelease(v307);
      uint64_t v18 = sub_1AD44(v2);
      uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
      os_log_type_t v20 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_0, v19, v20, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v21, 2u);
        swift_slowDealloc(v21, -1LL, -1LL);
      }

      uint64_t v22 = (os_log_s *)OSSignposter.logHandle.getter();
      uint64_t v23 = OSSignpostIntervalState.signpostID.getter();
      os_signpost_type_t v24 = static os_signpost_type_t.end.getter(v23);
      if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
      {
        uint64_t v25 = v1[87];
        uint64_t v26 = v1[71];
        uint64_t v27 = v1[66];
        uint64_t v28 = v1[65];
        uint64_t v29 = swift_retain(v25);
        checkForErrorAndConsumeState(state:)(v29);
        swift_release(v25);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v27 + 88))(v26, v28) == enum case for OSSignpostError.doubleEnd(_:))
        {
          uint64_t v30 = "[Error] Interval already ended";
        }

        else
        {
          (*(void (**)(uint64_t, uint64_t))(v1[66] + 8))(v1[71], v1[65]);
          uint64_t v30 = "";
        }

        uint64_t v178 = (void (*)(uint64_t, uint64_t))v1[88];
        uint64_t v197 = v1[81];
        uint64_t v198 = v1[79];
        uint64_t v199 = v1[74];
        uint64_t v200 = v1[73];
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v199 + 16))(v197, v198, v311[73]);
        v201 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v201 = 0;
        os_signpost_id_t v202 = OSSignpostID.rawValue.getter();
        _os_signpost_emit_with_name_impl(&dword_0, v22, v24, v202, "runPatternExtractionPlugin", v30, v201, 2u);
        swift_slowDealloc(v201, -1LL, -1LL);

        v178(v198, v200);
        uint64_t v181 = v197;
        uint64_t v182 = v200;
        uint64_t v1 = v311;
      }

      else
      {
        uint64_t v178 = (void (*)(uint64_t, uint64_t))v1[88];
        uint64_t v179 = v1[79];
        uint64_t v180 = v1[73];

        uint64_t v181 = v179;
        uint64_t v182 = v180;
      }

      v178(v181, v182);
      goto LABEL_156;
    }

    v284 = v1 + 55;
    uint64_t v290 = v8;
    v269 = v2;
    v278 = v1 + 21;
    v279 = v1 + 57;

    swift_task_dealloc(v17);
    unint64_t v31 = 0LL;
    uint64_t v32 = v1[55];
    uint64_t v299 = v32 + 64;
    uint64_t v33 = -1LL;
    uint64_t v34 = -1LL << *(_BYTE *)(v32 + 32);
    if (-v34 < 64) {
      uint64_t v33 = ~(-1LL << -(char)v34);
    }
    unint64_t v35 = v33 & *(void *)(v32 + 64);
    unint64_t v36 = (unint64_t)(63 - v34) >> 6;
    unint64_t v272 = v36 - 1;
    int64_t v303 = v36;
    unint64_t v274 = v36 - 5;
    if (!v35) {
      goto LABEL_15;
    }
LABEL_13:
    unint64_t v37 = __clz(__rbit64(v35));
    v35 &= v35 - 1;
    unint64_t v38 = v37 | (v31 << 6);
LABEL_14:
    uint64_t v1 = v311;
    uint64_t v39 = (void *)v311[63];
    uint64_t v40 = *(void *)(*(void *)(v32 + 48) + 8 * v38);
    *uint64_t v39 = v40;
    uint64_t v41 = *(void *)(v32 + 56);
    uint64_t v42 = v41 + *(void *)(*(void *)(type metadata accessor for PatternStoreValue(0LL) - 8) + 72LL) * v38;
    uint64_t v43 = sub_5BC0(&qword_39A10);
    sub_2C36C(v42, (uint64_t)v39 + *(int *)(v43 + 48), type metadata accessor for PatternStoreValue);
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56LL))(v39, 0LL, 1LL, v43);
    swift_bridgeObjectRetain(v40);
    while (1)
    {
      uint64_t v48 = v1[64];
      sub_2C2E0(v1[63], v48);
      uint64_t v49 = sub_5BC0(&qword_39A10);
      unint64_t v50 = (uint64_t *)v1[64];
      uint64_t v51 = *v50;
      uint64_t v52 = (uint64_t)v50 + *(int *)(v49 + 48);
      uint64_t v53 = *(void *)(v52 + *(int *)(type metadata accessor for PatternStoreValue(0LL) + 20));
      sub_2C3B0(v52, type metadata accessor for PatternStoreValue);
      if (v53 < 0) {
        goto LABEL_160;
      }
      if (v53)
      {
        uint64_t v54 = (void *)*v282;
        do
        {
          swift_bridgeObjectRetain(v51);
          if ((swift_isUniquelyReferenced_nonNull_native(v54) & 1) == 0) {
            uint64_t v54 = sub_205F4(0LL, v54[2] + 1LL, 1, v54);
          }
          unint64_t v56 = v54[2];
          unint64_t v55 = v54[3];
          if (v56 >= v55 >> 1) {
            uint64_t v54 = sub_205F4((void *)(v55 > 1), v56 + 1, 1, v54);
          }
          v54[2] = v56 + 1;
          v54[v56 + 4] = v51;
          --v53;
        }

        while (v53);
        swift_bridgeObjectRelease(v51);
        uint64_t *v282 = (uint64_t)v54;
        if (v35) {
          goto LABEL_13;
        }
      }

      else
      {
        swift_bridgeObjectRelease(v51);
        if (v35) {
          goto LABEL_13;
        }
      }

LABEL_15:
      int64_t v44 = v31 + 1;
      if (__OFADD__(v31, 1LL)) {
        goto LABEL_164;
      }
      if (v44 < v303)
      {
        unint64_t v45 = *(void *)(v299 + 8 * v44);
        if (v45) {
          goto LABEL_18;
        }
        if ((uint64_t)(v31 + 2) >= v303)
        {
          ++v31;
        }

        else
        {
          unint64_t v45 = *(void *)(v299 + 8 * (v31 + 2));
          if (v45)
          {
            int64_t v44 = v31 + 2;
LABEL_18:
            unint64_t v35 = (v45 - 1) & v45;
            unint64_t v38 = __clz(__rbit64(v45)) + (v44 << 6);
            unint64_t v31 = v44;
            goto LABEL_14;
          }

          if ((uint64_t)(v31 + 3) >= v303)
          {
            v31 += 2LL;
          }

          else
          {
            unint64_t v45 = *(void *)(v299 + 8 * (v31 + 3));
            if (v45)
            {
              int64_t v44 = v31 + 3;
              goto LABEL_18;
            }

            int64_t v44 = v31 + 4;
            if ((uint64_t)(v31 + 4) >= v303)
            {
              v31 += 3LL;
            }

            else
            {
              unint64_t v45 = *(void *)(v299 + 8 * v44);
              if (v45) {
                goto LABEL_18;
              }
              while (v274 != v31)
              {
                unint64_t v45 = *(void *)(v32 + 104 + 8 * v31++);
                if (v45)
                {
                  int64_t v44 = v31 + 4;
                  goto LABEL_18;
                }
              }

              unint64_t v31 = v272;
            }
          }
        }
      }

      uint64_t v1 = v311;
      uint64_t v46 = v311[63];
      uint64_t v47 = sub_5BC0(&qword_39A10);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56LL))(v46, 1LL, 1LL, v47);
      unint64_t v35 = 0LL;
    }

    uint64_t v57 = swift_release(v32);
    uint64_t v58 = (os_log_s *)Logger.logObject.getter(v57);
    os_log_type_t v59 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v60 = 134217984;
      swift_beginAccess(v282, v278, 0LL, 0LL);
      v1[57] = *(void *)(v1[56] + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v279, v1 + 58, v60 + 4, v60 + 12);
      _os_log_impl(&dword_0, v58, v59, "Total sequences after fetching from infrequent on-device store: %ld", v60, 0xCu);
      swift_slowDealloc(v60, -1LL, -1LL);
    }

    uint64_t v13 = 0LL;
    uint64_t v2 = v269;
    uint64_t v8 = v290;
    uint64_t v3 = v284;
  }

  uint64_t v61 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v62 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v63 = 0;
    _os_log_impl(&dword_0, v61, v62, "Calling RECTIFI Algorithm", v63, 2u);
    swift_slowDealloc(v63, -1LL, -1LL);
  }

  swift_beginAccess(v282, v1 + 24, 0LL, 0LL);
  uint64_t v64 = (void *)*v282;
  uint64_t v65 = v277[5];
  uint64_t v66 = v277[6];
  sub_19594(v276, v65);
  swift_bridgeObjectRetain(v64);
  double v67 = dispatch thunk of RECTIFITrialStatusResolving.getMinSupport()(v65, v66);
  if ((~*(void *)&v67 & 0x7FF0000000000000LL) == 0) {
    goto LABEL_165;
  }
  if (v67 <= -9.22337204e18)
  {
LABEL_166:
    __break(1u);
    goto LABEL_167;
  }

  if (v67 >= 9.22337204e18)
  {
LABEL_167:
    __break(1u);
    goto LABEL_168;
  }

  v270 = v2;
  uint64_t v68 = (uint64_t)v67;
  PatternsRectifunint64_t i = type metadata accessor for ExtractPatternsRectifi();
  uint64_t inited = swift_initStackObject(PatternsRectifi, v1 + 2);
  *(_OWORD *)(inited + 3sub_1AD44(v0 + 2) = xmmword_2E9A0;
  *(void *)(inited + 48) = 5LL;
  uint64_t v71 = type metadata accessor for ClosedPatternUtil();
  *(void *)(inited + 64) = swift_allocObject(v71, 16LL, 7LL);
  *(void *)(inited + 16) = v64;
  *(void *)(inited + 24) = v68;
  *(void *)(inited + 56) = _swiftEmptyArrayStorage;
  swift_beginAccess(inited + 56, v1 + 27, 1LL, 0LL);
  uint64_t v72 = *(void *)(inited + 56);
  *(void *)(inited + 56) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v72);
  uint64_t v73 = swift_bridgeObjectRetain(v64);
  uint64_t v74 = sub_23698(v73);
  swift_bridgeObjectRelease(v64);
  v271 = (void *)inited;
  sub_3D58((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v74);
  swift_bridgeObjectRelease(v74);
  uint64_t v75 = v277[5];
  uint64_t v76 = v277[6];
  sub_19594(v276, v75);
  double v77 = dispatch thunk of RECTIFITrialStatusResolving.getTopKPatterns()(v75, v76);
  if ((~*(void *)&v77 & 0x7FF0000000000000LL) == 0)
  {
LABEL_168:
    __break(1u);
    goto LABEL_169;
  }

  if (v77 <= -9.22337204e18)
  {
LABEL_169:
    __break(1u);
    goto LABEL_170;
  }

  if (v77 < 9.22337204e18)
  {
    uint64_t v304 = v13;
    uint64_t v78 = v1 + 39;
    uint64_t v79 = sub_402C((uint64_t)v77, 0);
    uint64_t v275 = (uint64_t)(v1 + 49);
    v1[49] = (uint64_t)v79;
    uint64_t v80 = v79[2];
    uint64_t v314 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v81 = sub_27A14(0, 0LL, 0);
    uint64_t v82 = _swiftEmptyArrayStorage;
    if (v80)
    {
      uint64_t v83 = v1[61];
      do
      {
        UUID.init()(v81);
        uint64_t v314 = (uint64_t)v82;
        unint64_t v85 = v82[2];
        unint64_t v84 = v82[3];
        if (v85 >= v84 >> 1)
        {
          sub_27A14(v84 > 1, v85 + 1, 1);
          uint64_t v82 = (void *)v314;
        }

        uint64_t v86 = v1[62];
        uint64_t v87 = v1[60];
        v82[2] = v85 + 1;
        uint64_t v81 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v83 + 32))( (unint64_t)v82 + ((*(unsigned __int8 *)(v83 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80))
              + *(void *)(v83 + 72) * v85,
                v86,
                v87);
        --v80;
      }

      while (v80);
    }

    uint64_t v88 = (os_log_s *)Logger.logObject.getter(v81);
    os_log_type_t v89 = static os_log_type_t.info.getter();
    uint64_t v273 = (uint64_t)v82;
    uint64_t v291 = v8;
    if (os_log_type_enabled(v88, v89))
    {
      uint64_t v90 = v1 + 33;
      uint64_t v91 = v1 + 39;
      uint64_t v92 = v1 + 54;
      uint64_t v93 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v93 = 134217984;
      uint64_t v94 = v90;
      uint64_t v82 = (void *)v273;
      swift_beginAccess(v275, v94, 0LL, 0LL);
      *uint64_t v92 = *(void *)(*(void *)v275 + 16LL);
      uint64_t v95 = v92;
      uint64_t v78 = v91;
      uint64_t v8 = v291;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v95, v3, v93 + 4, v93 + 12);
      _os_log_impl(&dword_0, v88, v89, "Fetched %ld patterns from RECTIFI", v93, 0xCu);
      uint64_t v96 = v93;
      uint64_t v1 = v311;
      swift_slowDealloc(v96, -1LL, -1LL);
    }

    v285 = v1 + 51;

    swift_beginAccess(v275, v78, 0LL, 0LL);
    uint64_t v97 = *(void *)v275;
    uint64_t v314 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v98 = *(void *)(v97 + 16);
    if (v98)
    {
      uint64_t v99 = v1 + 52;
      uint64_t v100 = v97 + 32;
      uint64_t v288 = v97;
      swift_bridgeObjectRetain_n(v97, 2LL);
      uint64_t v101 = 0LL;
      while (1)
      {
        uint64_t v107 = v100 + 40 * v101;
        uint64_t v106 = *(void *)(v107 + 8);
        uint64_t v108 = *(void *)(v107 + 16);
        if (v108)
        {
          swift_bridgeObjectRetain(v307);
          swift_bridgeObjectRetain(v108);
          swift_bridgeObjectRetain(v106);
          uint64_t v109 = sub_2BB50(v108, v307);
          swift_bridgeObjectRelease(v307);
          unint64_t v110 = *(void *)(v109 + 16);
          if (v110)
          {
            void *v285 = 0LL;
            swift_stdlib_random(v285, 8LL);
            unint64_t v111 = *v285 * v110;
            uint64_t v112 = ((unint64_t)*v285 * (unsigned __int128)v110) >> 64;
            if (v110 > v111)
            {
              unint64_t v113 = -(uint64_t)v110 % v110;
              if (v113 > v111)
              {
                do
                {
                  *uint64_t v99 = 0LL;
                  swift_stdlib_random(v99, 8LL);
                }

                while (v113 > *v99 * v110);
                uint64_t v112 = ((unint64_t)*v99 * (unsigned __int128)v110) >> 64;
              }
            }

            if (v112 >= *(void *)(v109 + 16)) {
              goto LABEL_161;
            }
            unint64_t v114 = *(void *)(v109 + 8 * v112 + 32);
            swift_bridgeObjectRelease(v109);
            if ((v114 & 0x8000000000000000LL) != 0)
            {
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
              goto LABEL_166;
            }

            if (v114 >= *(void *)(v307 + 16)) {
              goto LABEL_163;
            }
            id v115 = *(id *)(v307 + 32 + 8 * v114);
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v115);
            unint64_t v117 = *(void *)(v314 + 16);
            unint64_t v116 = *(void *)(v314 + 24);
            if (v117 >= v116 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v116 > 1, v117 + 1, 1LL);
            }
            uint64_t v118 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v117, v115);
            specialized Array._endMutation()(v118);
            swift_bridgeObjectRelease(v108);
            goto LABEL_71;
          }

          uint64_t v102 = swift_bridgeObjectRelease(v109);
        }

        else
        {
          uint64_t v102 = swift_bridgeObjectRetain(*(void *)(v107 + 8));
        }

        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v102);
        unint64_t v104 = *(void *)(v314 + 16);
        unint64_t v103 = *(void *)(v314 + 24);
        if (v104 >= v103 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v103 > 1, v104 + 1, 1LL);
        }
        uint64_t v105 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v104, 0LL);
        specialized Array._endMutation()(v105);
        swift_bridgeObjectRelease(v106);
        uint64_t v106 = v108;
LABEL_71:
        swift_bridgeObjectRelease(v106);
        if (++v101 == v98)
        {
          swift_bridgeObjectRelease_n(v288, 2LL);
          uint64_t v1 = v311;
          uint64_t v119 = (void *)v314;
          uint64_t v8 = v291;
          uint64_t v82 = (void *)v273;
          goto LABEL_87;
        }
      }
    }

    uint64_t v119 = _swiftEmptyArrayStorage;
LABEL_87:
    swift_beginAccess(v275, v1 + 42, 33LL, 0LL);
    sub_2BC48(v275, v295);
    swift_endAccess(v1 + 42);
    swift_bridgeObjectRelease(v295);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v307);
    v1[45] = 0LL;
    v1[46] = 0xE000000000000000LL;
    uint64_t v120 = v1[49];
    uint64_t v300 = *(void *)(v120 + 16);
    if (v300)
    {
      v268 = v119;
      uint64_t v121 = v1 + 36;
      uint64_t v122 = v1 + 45;
      uint64_t v123 = v1 + 48;
      v280 = v1 + 50;
      uint64_t v296 = v120 + 32;
      swift_bridgeObjectRetain(v120);
      swift_beginAccess(v1 + 45, v1 + 30, 1LL, 0LL);
      unint64_t v124 = 0LL;
      uint64_t v292 = v120;
      while (1)
      {
        if (v124 >= *(void *)(v120 + 16))
        {
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
          goto LABEL_162;
        }

        uint64_t v125 = (uint64_t *)(v296 + 40 * v124);
        uint64_t v126 = *v125;
        uint64_t v127 = v125[1];
        uint64_t v314 = 0x636E657571657246LL;
        unint64_t v315 = 0xEA00000000002079LL;
        v1[48] = v126;
        swift_bridgeObjectRetain(v127);
        v128._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
        object = v128._object;
        String.append(_:)(v128);
        swift_bridgeObjectRelease(object);
        v130._countAndFlagsBits = 10LL;
        v130._object = (void *)0xE100000000000000LL;
        String.append(_:)(v130);
        unint64_t v131 = v315;
        uint64_t v132 = v1[46];
        v1[45] = v314;
        v1[46] = v131;
        swift_bridgeObjectRelease(v132);
        if ((unint64_t)v127 >> 62)
        {
          if (v127 < 0) {
            uint64_t v143 = v127;
          }
          else {
            uint64_t v143 = v127 & 0xFFFFFFFFFFFFFF8LL;
          }
          swift_bridgeObjectRetain(v127);
          uint64_t v133 = _CocoaArrayWrapper.endIndex.getter(v143);
          swift_bridgeObjectRelease(v127);
          unint64_t v308 = v124;
          if (!v133) {
            goto LABEL_103;
          }
        }

        else
        {
          uint64_t v133 = *(void *)((char *)&dword_10 + (v127 & 0xFFFFFFFFFFFFF8LL));
          unint64_t v308 = v124;
          if (!v133) {
            goto LABEL_103;
          }
        }

        if (v133 < 1) {
          goto LABEL_159;
        }
        uint64_t v134 = 0LL;
        do
        {
          if ((v127 & 0xC000000000000001LL) != 0)
          {
            uint64_t v135 = specialized _ArrayBuffer._getElementSlowPath(_:)(v134, v127);
          }

          else
          {
            uint64_t v135 = *(void *)(v127 + 8 * v134 + 32);
            swift_retain(v135);
          }

          ++v134;
          uint64_t v136 = (*(uint64_t (**)(void))(*(void *)v135 + 208LL))();
          unint64_t v138 = v137;
          uint64_t v314 = v136;
          unint64_t v315 = v137;
          swift_bridgeObjectRetain(v137);
          v139._countAndFlagsBits = 10LL;
          v139._object = (void *)0xE100000000000000LL;
          String.append(_:)(v139);
          swift_bridgeObjectRelease(v138);
          uint64_t v140 = v314;
          uint64_t v141 = (void *)v315;
          swift_beginAccess(v122, v121, 33LL, 0LL);
          v142._countAndFlagsBits = v140;
          v142._object = v141;
          String.append(_:)(v142);
          swift_endAccess(v121);
          swift_bridgeObjectRelease(v141);
          swift_release(v135);
        }

        while (v133 != v134);
LABEL_103:
        uint64_t v1 = v311;
        uint64_t v144 = swift_bridgeObjectRelease(v127);
        uint64_t v145 = (os_log_s *)Logger.logObject.getter(v144);
        os_log_type_t v146 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v145, v146))
        {
          uint64_t v147 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v148 = swift_slowAlloc(32LL, -1LL);
          uint64_t v314 = v148;
          *(_DWORD *)uint64_t v147 = 136315138;
          uint64_t v149 = v123;
          uint64_t v150 = v311[45];
          unint64_t v151 = v311[46];
          swift_bridgeObjectRetain(v151);
          uint64_t v152 = v150;
          uint64_t v123 = v149;
          v311[50] = sub_20E38(v152, v151, &v314);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v280, v285, v147 + 4, v147 + 12);
          swift_bridgeObjectRelease(v151);
          _os_log_impl(&dword_0, v145, v146, "%s", v147, 0xCu);
          swift_arrayDestroy(v148, 1LL, (char *)&type metadata for Any + 8);
          uint64_t v153 = v148;
          uint64_t v1 = v311;
          swift_slowDealloc(v153, -1LL, -1LL);
          swift_slowDealloc(v147, -1LL, -1LL);
        }

        unint64_t v124 = v308 + 1;
        uint64_t v120 = v292;
        if (v308 + 1 == v300)
        {
          swift_bridgeObjectRelease(v292);
          uint64_t v82 = (void *)v273;
          uint64_t v120 = *(void *)v275;
          uint64_t v119 = v268;
          break;
        }
      }
    }

    unint64_t v154 = (unsigned __int8 *)swift_bridgeObjectRetain(v120);
    sub_1EDC0(v154, (uint64_t)v82, (uint64_t)v119);
    swift_bridgeObjectRelease(v119);
    swift_bridgeObjectRelease(v120);
    uint64_t v156 = v277[5];
    uint64_t v155 = v277[6];
    sub_19594(v276, v156);
    if ((dispatch thunk of RECTIFITrialStatusResolving.isRECTIFIOnDeviceStorageEnabled()(v156, v155) & 1) != 0)
    {
      int64_t v157 = *(void *)(v120 + 16);
      if (v157)
      {
        uint64_t v314 = (uint64_t)_swiftEmptyArrayStorage;
        swift_bridgeObjectRetain(v120);
        sub_279E8(0, v157, 0);
        uint64_t v158 = v314;
        unint64_t v159 = *(void *)(v314 + 16);
        uint64_t v160 = 40LL;
        do
        {
          uint64_t v161 = *(void *)(v120 + v160);
          uint64_t v314 = v158;
          unint64_t v162 = *(void *)(v158 + 24);
          swift_bridgeObjectRetain(v161);
          if (v159 >= v162 >> 1)
          {
            sub_279E8(v162 > 1, v159 + 1, 1);
            uint64_t v158 = v314;
          }

          *(void *)(v158 + 16) = v159 + 1;
          *(void *)(v158 + 8 * v159 + 3sub_1AD44(v0 + 2) = v161;
          v160 += 40LL;
          ++v159;
          --v157;
        }

        while (v157);
        swift_bridgeObjectRelease(v120);
        uint64_t v164 = v270;
        sub_19594(v270, v1[14]);
        sub_77E8(v158, v273);
        if (v304)
        {
          swift_release(v158);
          swift_bridgeObjectRelease(v1[46]);
          swift_release(v273);
          swift_bridgeObjectRelease(v120);
          swift_setDeallocating(v271);
          swift_bridgeObjectRelease(v271[2]);
          swift_bridgeObjectRelease(v271[7]);
          swift_release(v271[8]);
          swift_bridgeObjectRelease(v1[56]);
          uint64_t v165 = sub_1AD44(v270);
          uint64_t v166 = (os_log_s *)Logger.logObject.getter(v165);
          os_log_type_t v167 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v166, v167))
          {
            uint64_t v168 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)uint64_t v168 = 0;
            _os_log_impl(&dword_0, v166, v167, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v168, 2u);
            swift_slowDealloc(v168, -1LL, -1LL);
          }

          uint64_t v169 = (os_log_s *)OSSignposter.logHandle.getter();
          uint64_t v170 = OSSignpostIntervalState.signpostID.getter();
          os_signpost_type_t v171 = static os_signpost_type_t.end.getter(v170);
          if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
          {
            uint64_t v172 = v1[87];
            uint64_t v173 = v1[69];
            uint64_t v174 = v1[66];
            uint64_t v175 = v1[65];
            uint64_t v176 = swift_retain(v172);
            checkForErrorAndConsumeState(state:)(v176);
            swift_release(v172);
            if ((*(unsigned int (**)(uint64_t, uint64_t))(v174 + 88))(v173, v175) == enum case for OSSignpostError.doubleEnd(_:))
            {
              uint64_t v177 = "[Error] Interval already ended";
            }

            else
            {
              (*(void (**)(uint64_t, uint64_t))(v1[66] + 8))(v1[69], v1[65]);
              uint64_t v177 = "";
            }

            v208 = (void (*)(uint64_t, uint64_t))v1[88];
            uint64_t v210 = v1[81];
            uint64_t v211 = v1[77];
LABEL_154:
            uint64_t v252 = v1[73];
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[74] + 16))(v210, v211, v252);
            v253 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)v253 = 0;
            os_signpost_id_t v254 = OSSignpostID.rawValue.getter();
            _os_signpost_emit_with_name_impl(&dword_0, v169, v171, v254, "runPatternExtractionPlugin", v177, v253, 2u);
            v255 = v253;
            uint64_t v1 = v311;
            swift_slowDealloc(v255, -1LL, -1LL);

            v208(v211, v252);
            uint64_t v250 = v210;
            uint64_t v251 = v252;
            goto LABEL_155;
          }

          v208 = (void (*)(uint64_t, uint64_t))v1[88];
          uint64_t v209 = v1[77];
          goto LABEL_151;
        }

        swift_release(v273);
        uint64_t v203 = swift_release(v158);
        v204 = (os_log_s *)Logger.logObject.getter(v203);
        os_log_type_t v205 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v204, v205)) {
          goto LABEL_140;
        }
        v206 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v206 = 0;
        v207 = "Self patterns written to CoreData";
LABEL_139:
        _os_log_impl(&dword_0, v204, v205, v207, v206, 2u);
        v212 = v206;
        uint64_t v164 = v270;
        swift_slowDealloc(v212, -1LL, -1LL);
LABEL_140:
        swift_setDeallocating(v271);
        swift_bridgeObjectRelease(v271[2]);
        swift_bridgeObjectRelease(v271[7]);
        uint64_t v163 = v271[8];

        goto LABEL_141;
      }

      uint64_t v183 = (void *)*v282;
      uint64_t v184 = *(void *)(*v282 + 16);
      swift_release(v82);
      if (v184)
      {
        uint64_t v164 = v270;
        sub_19594(v270, v1[14]);
        uint64_t v185 = swift_bridgeObjectRetain(v183);
        sub_71C8(v185);
        uint64_t v186 = swift_bridgeObjectRelease(v183);
        if (v304)
        {
          swift_bridgeObjectRelease(v1[46]);
          swift_bridgeObjectRelease(v120);
          swift_setDeallocating(v271);
          swift_bridgeObjectRelease(v271[2]);
          swift_bridgeObjectRelease(v271[7]);
          swift_release(v271[8]);
          swift_bridgeObjectRelease(v1[56]);
          uint64_t v187 = sub_1AD44(v270);
          uint64_t v188 = (os_log_s *)Logger.logObject.getter(v187);
          os_log_type_t v189 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v188, v189))
          {
            uint64_t v190 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)uint64_t v190 = 0;
            _os_log_impl(&dword_0, v188, v189, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v190, 2u);
            swift_slowDealloc(v190, -1LL, -1LL);
          }

          uint64_t v169 = (os_log_s *)OSSignposter.logHandle.getter();
          uint64_t v191 = OSSignpostIntervalState.signpostID.getter();
          os_signpost_type_t v171 = static os_signpost_type_t.end.getter(v191);
          if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
          {
            uint64_t v192 = v1[87];
            uint64_t v193 = v1[70];
            uint64_t v194 = v1[66];
            uint64_t v195 = v1[65];
            uint64_t v196 = swift_retain(v192);
            checkForErrorAndConsumeState(state:)(v196);
            swift_release(v192);
            if ((*(unsigned int (**)(uint64_t, uint64_t))(v194 + 88))(v193, v195) == enum case for OSSignpostError.doubleEnd(_:))
            {
              uint64_t v177 = "[Error] Interval already ended";
            }

            else
            {
              (*(void (**)(uint64_t, uint64_t))(v1[66] + 8))(v1[70], v1[65]);
              uint64_t v177 = "";
            }

            v208 = (void (*)(uint64_t, uint64_t))v1[88];
            uint64_t v210 = v1[81];
            uint64_t v211 = v1[78];
            goto LABEL_154;
          }

          v208 = (void (*)(uint64_t, uint64_t))v1[88];
          uint64_t v209 = v1[78];
LABEL_151:
          uint64_t v249 = v1[73];

          uint64_t v250 = v209;
          uint64_t v251 = v249;
LABEL_155:
          v208(v250, v251);
LABEL_156:
          uint64_t v256 = v1[87];
          uint64_t v257 = v1[85];
          uint64_t v258 = v1[84];
          uint64_t v259 = v1[81];
          uint64_t v260 = v1[80];
          uint64_t v261 = v1[79];
          uint64_t v262 = v1[78];
          uint64_t v263 = v1[77];
          uint64_t v264 = v1[76];
          uint64_t v265 = v1[75];
          v266 = v1;
          uint64_t v267 = v1[72];
          uint64_t v281 = v265;
          uint64_t v283 = v266[71];
          uint64_t v287 = v266[70];
          uint64_t v294 = v266[69];
          uint64_t v298 = v266[68];
          uint64_t v302 = v266[67];
          uint64_t v306 = v266[64];
          uint64_t v310 = v266[63];
          uint64_t v313 = v266[62];
          swift_release(v256);
          swift_task_dealloc(v257);
          swift_task_dealloc(v258);
          swift_task_dealloc(v259);
          swift_task_dealloc(v260);
          swift_task_dealloc(v261);
          swift_task_dealloc(v262);
          swift_task_dealloc(v263);
          swift_task_dealloc(v264);
          swift_task_dealloc(v281);
          swift_task_dealloc(v267);
          swift_task_dealloc(v283);
          swift_task_dealloc(v287);
          swift_task_dealloc(v294);
          swift_task_dealloc(v298);
          swift_task_dealloc(v302);
          swift_task_dealloc(v306);
          swift_task_dealloc(v310);
          swift_task_dealloc(v313);
          v248 = (void (*)(void))v266[1];
LABEL_157:
          v248();
          return;
        }

        v204 = (os_log_s *)Logger.logObject.getter(v186);
        os_log_type_t v205 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v204, v205)) {
          goto LABEL_140;
        }
        v206 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)v206 = 0;
        v207 = "Incomplete patterns written to CoreData";
        goto LABEL_139;
      }
    }

    else
    {
      swift_release(v82);
    }

    swift_setDeallocating(v271);
    swift_bridgeObjectRelease(v271[2]);
    swift_bridgeObjectRelease(v271[7]);
    uint64_t v163 = v271[8];
    uint64_t v164 = v270;
LABEL_141:
    swift_release(v163);
    swift_bridgeObjectRelease(v1[46]);
    swift_bridgeObjectRelease(v1[49]);
    swift_bridgeObjectRelease(v1[56]);
    uint64_t v213 = sub_1AD44(v164);
    v214 = (os_log_s *)Logger.logObject.getter(v213);
    os_log_type_t v215 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v214, v215))
    {
      v216 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v216 = 0;
      _os_log_impl(&dword_0, v214, v215, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v216, 2u);
      swift_slowDealloc(v216, -1LL, -1LL);
    }

    v217 = (os_log_s *)OSSignposter.logHandle.getter();
    uint64_t v218 = OSSignpostIntervalState.signpostID.getter();
    os_signpost_type_t v219 = static os_signpost_type_t.end.getter(v218);
    if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
    {
      uint64_t v220 = v1[87];
      uint64_t v221 = v1[68];
      uint64_t v222 = v1[66];
      uint64_t v223 = v1[65];
      uint64_t v224 = swift_retain(v220);
      checkForErrorAndConsumeState(state:)(v224);
      swift_release(v220);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v222 + 88))(v221, v223) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v225 = "[Error] Interval already ended";
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t))(v1[66] + 8))(v1[68], v1[65]);
        v225 = "";
      }

      v230 = (void (*)(uint64_t, uint64_t))v1[88];
      uint64_t v227 = v1[87];
      uint64_t v231 = v1[81];
      uint64_t v232 = v1[76];
      uint64_t v233 = v1[73];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[74] + 16))(v231, v232, v233);
      v234 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v234 = 0;
      os_signpost_id_t v235 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_0, v217, v219, v235, "runPatternExtractionPlugin", v225, v234, 2u);
      v236 = v234;
      uint64_t v1 = v311;
      swift_slowDealloc(v236, -1LL, -1LL);

      v230(v232, v233);
      v230(v231, v233);
    }

    else
    {
      v226 = (void (*)(uint64_t, uint64_t))v1[88];
      uint64_t v227 = v1[87];
      uint64_t v228 = v1[76];
      uint64_t v229 = v1[73];

      v226(v228, v229);
    }

    swift_release(v227);
    uint64_t v237 = v1[85];
    uint64_t v238 = v1[84];
    uint64_t v239 = v1[81];
    uint64_t v240 = v1[80];
    v241 = v1;
    uint64_t v242 = v1[79];
    uint64_t v243 = v241[78];
    uint64_t v244 = v241[77];
    uint64_t v245 = v241[76];
    uint64_t v246 = v241[75];
    uint64_t v247 = v241[72];
    uint64_t v286 = v241[71];
    uint64_t v289 = v241[70];
    uint64_t v293 = v241[69];
    uint64_t v297 = v241[68];
    uint64_t v301 = v241[67];
    uint64_t v305 = v241[64];
    uint64_t v309 = v241[63];
    uint64_t v312 = v241[62];
    swift_task_dealloc(v237);
    swift_task_dealloc(v238);
    swift_task_dealloc(v239);
    swift_task_dealloc(v240);
    swift_task_dealloc(v242);
    swift_task_dealloc(v243);
    swift_task_dealloc(v244);
    swift_task_dealloc(v245);
    swift_task_dealloc(v246);
    swift_task_dealloc(v247);
    swift_task_dealloc(v286);
    swift_task_dealloc(v289);
    swift_task_dealloc(v293);
    swift_task_dealloc(v297);
    swift_task_dealloc(v301);
    swift_task_dealloc(v305);
    swift_task_dealloc(v309);
    swift_task_dealloc(v312);
    v248 = (void (*)(void))v241[1];
    goto LABEL_157;
  }

LABEL_170:
  __break(1u);
}

uint64_t sub_27100()
{
  uint64_t v1 = sub_1AD44((void *)(v0 + 88));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v5 = (os_log_s *)OSSignposter.logHandle.getter();
  uint64_t v6 = OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v7 = static os_signpost_type_t.end.getter(v6);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v8 = *(void *)(v0 + 696);
    uint64_t v9 = *(void *)(v0 + 576);
    uint64_t v10 = *(void *)(v0 + 528);
    uint64_t v11 = *(void *)(v0 + 520);
    uint64_t v12 = swift_retain(v8);
    checkForErrorAndConsumeState(state:)(v12);
    swift_release(v8);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v9, v11) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v13 = "[Error] Interval already ended";
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 528) + 8LL))( *(void *)(v0 + 576),  *(void *)(v0 + 520));
      uint64_t v13 = "";
    }

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 704);
    uint64_t v18 = *(void *)(v0 + 648);
    uint64_t v19 = *(void *)(v0 + 640);
    uint64_t v20 = *(void *)(v0 + 584);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 592) + 16LL))(v18, v19, v20);
    uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v21 = 0;
    os_signpost_id_t v22 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl(&dword_0, v5, v7, v22, "runPatternExtractionPlugin", v13, v21, 2u);
    swift_slowDealloc(v21, -1LL, -1LL);

    v17(v19, v20);
    v17(v18, v20);
  }

  else
  {
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 704);
    uint64_t v15 = *(void *)(v0 + 640);
    uint64_t v16 = *(void *)(v0 + 584);

    v14(v15, v16);
  }

  uint64_t v23 = *(void *)(v0 + 680);
  uint64_t v24 = *(void *)(v0 + 672);
  uint64_t v25 = *(void *)(v0 + 648);
  uint64_t v26 = *(void *)(v0 + 640);
  uint64_t v27 = *(void *)(v0 + 632);
  uint64_t v28 = *(void *)(v0 + 624);
  uint64_t v29 = *(void *)(v0 + 616);
  uint64_t v30 = *(void *)(v0 + 608);
  uint64_t v31 = *(void *)(v0 + 600);
  uint64_t v33 = *(void *)(v0 + 576);
  uint64_t v34 = *(void *)(v0 + 568);
  uint64_t v35 = *(void *)(v0 + 560);
  uint64_t v36 = *(void *)(v0 + 552);
  uint64_t v37 = *(void *)(v0 + 544);
  uint64_t v38 = *(void *)(v0 + 536);
  uint64_t v39 = *(void *)(v0 + 512);
  uint64_t v40 = *(void *)(v0 + 504);
  uint64_t v41 = *(void *)(v0 + 496);
  swift_release(*(void *)(v0 + 696));
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *SiriPrivateLearningPatternExtractionPlugin.deinit()
{
  return v0;
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 192LL, 7LL);
}

uint64_t sub_274A0()
{
  uint64_t v0 = type metadata accessor for SiriPrivateLearningPatternExtractionPlugin();
  uint64_t v1 = swift_allocObject(v0, 192LL, 7LL);
  SiriPrivateLearningPatternExtractionPlugin.init()();
  return v1;
}

uint64_t sub_274D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_5BC0(&qword_3A9C8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v15 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (v15 + 40) & ~v15;
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v18 = (char *)swift_allocObject(&unk_35818, v17 + 16, v15 | 7);
  *((void *)v18 + sub_1AD44(v0 + 2) = 0LL;
  *((void *)v18 + 3) = 0LL;
  *((void *)v18 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v16], v10, v7);
  uint64_t v19 = &v18[v17];
  *(void *)uint64_t v19 = a2;
  *((void *)v19 + 1) = a3;
  swift_retain(v3);
  swift_retain(a3);
  uint64_t v20 = sub_24258((uint64_t)v13, (uint64_t)&unk_3AB40, (uint64_t)v18);
  return swift_release(v20);
}

uint64_t type metadata accessor for SiriPrivateLearningPatternExtractionPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC42SiriPrivateLearningPatternExtractionPlugin42SiriPrivateLearningPatternExtractionPlugin);
}

uint64_t sub_27660@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_27670( uint8_t *a1, uint32_t a2, os_log_s *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = OSSignpostID.rawValue.getter();
  _os_signpost_emit_with_name_impl(&dword_0, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_276F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_27754;
  return v6(a1);
}

uint64_t sub_27754()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_277A0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_277C8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v4 = a2 - (void)__src;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (!__dst)
  {
    if (v4 <= 0) {
      return __src;
    }
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawBufferPointer.copyMemory source has too many elements",  69LL,  2LL,  "Swift/UnsafeRawBufferPointer.swift",  34LL,  2,  487LL,  0);
    __break(1u);
    return __src;
  }

  if (__src) {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

BOOL sub_2785C(uint64_t a1)
{
  return (a1 & 0xC000000000000001LL) == 0;
}

uint64_t sub_27868(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_27A40(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_27884(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_27D10(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_278A0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_27E6C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_278BC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28054(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_278D8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_281CC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_278F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28334(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_27910(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_284B8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2792C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28650(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_27948(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28AD4(a1, a2, a3, (void *)*v3, &qword_3A9B0, type metadata accessor for PatternStoreValue);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_27974(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28948(a1, a2, a3, (void *)*v3, &qword_3A988, &qword_3A1C8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_279A0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_287C0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_279BC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28948(a1, a2, a3, (void *)*v3, &qword_3AB18, &qword_39EC0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_279E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28948(a1, a2, a3, (void *)*v3, &qword_3A970, &qword_399D0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_27A14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_28AD4( a1,  a2,  a3,  (void *)*v3,  &qword_3A9B8,  (uint64_t (*)(void))&type metadata accessor for UUID);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_27A40(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BC0(&qword_3AAF0);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_27B9C(char a1, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_5BC0(&qword_3A980);
    uint64_t v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 40 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_27D10(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BC0(&qword_3A9A8);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    memcpy(v14, v15, 16 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_27E6C(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    size_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_5BC0(&qword_3A9A0);
  uint64_t v11 = *(void *)(sub_5BC0(&qword_399F0) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  size_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = sub_5BC0(&qword_399F0);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

uint64_t sub_28054(char a1, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_5BC0(&qword_3A1C0);
    uint64_t v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_281CC(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BC0(&qword_3A1B8);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_28334(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_5BC0(&qword_3AB30);
    uint64_t v11 = (void *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
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
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 4;
  size_t v15 = a4 + 4;
  size_t v16 = 4 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[v16]) {
      memmove(v11 + 4, a4 + 4, v16 * 8);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[v16] || v14 >= &v15[v16])
  {
    sub_5BC0(&qword_3AB38);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_284B8(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_5BC0(&qword_3AB20);
    uint64_t v11 = (void *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 24);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 4;
  uint64_t v14 = a4 + 4;
  size_t v15 = 3 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15]) {
      memmove(v11 + 4, a4 + 4, v15 * 8);
    }
    a4[2] = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    sub_5BC0(&qword_3AB28);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_28650(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5BC0(&qword_3A998);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + sub_1AD44(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + sub_1AD44(v0 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_287AC(char a1, int64_t a2, char a3, void *a4)
{
  return sub_28AD4(a1, a2, a3, a4, &qword_3A9B0, type metadata accessor for PatternStoreValue);
}

uint64_t sub_287C0(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_5BC0(&qword_3AB00);
    uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v14 = (unint64_t)(v11 + 4);
  unint64_t v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8) {
      memmove(v11 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    sub_5BC0(&qword_3AB08);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_28948(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    uint64_t v13 = sub_5BC0(a5);
    unint64_t v14 = (void *)swift_allocObject(v13, 8 * v12 + 32, 7LL);
    int64_t v15 = j__malloc_size(v14);
    uint64_t v16 = v15 - 32;
    if (v15 < 32) {
      uint64_t v16 = v15 - 25;
    }
    v14[2] = v11;
    v14[3] = 2 * (v16 >> 3);
  }

  else
  {
    unint64_t v14 = _swiftEmptyArrayStorage;
  }

  unint64_t v17 = (unint64_t)(v14 + 4);
  unint64_t v18 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v17 >= v18 + 8 * v11) {
      memmove(v14 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v18 >= v17 + 8 * v11 || v17 >= v18 + 8 * v11)
  {
    sub_5BC0(a6);
    swift_arrayInitWithCopy(v14 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v14;
  }

uint64_t sub_28AD4( char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_5BC0(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  unint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v19 - v17 == 0x8000000000000000LL && v15 == -1) {
    goto LABEL_34;
  }
  _OWORD v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = a6(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = (char *)v18 + v23;
  unint64_t v25 = (char *)a4 + v23;
  if ((a1 & 1) != 0)
  {
    if (v18 < a4 || v24 >= &v25[*(void *)(v22 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v24, v25, v11, v21);
    }

    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v26 = *(void *)(v22 + 72) * v11;
  uint64_t v27 = &v24[v26];
  unint64_t v28 = (unint64_t)&v25[v26];
  if (v25 >= v27 || (unint64_t)v24 >= v28)
  {
    swift_arrayInitWithCopy(v24);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v18;
  }

uint64_t sub_28CB4(uint64_t *a1, uint64_t a2)
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
    uint64_t v8 = swift_retain(a2);
    uint64_t v9 = __CocoaSet.member(for:)(v8, v7);
    swift_release(a2);
    if (v9)
    {
      swift_bridgeObjectRelease(v6);
      swift_release(a2);
      uint64_t v39 = v9;
      uint64_t v10 = type metadata accessor for PatternItem();
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(v38, &v39, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v38[0];
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t v31 = __CocoaSet.count.getter(v7);
    if (__OFADD__(v31, 1LL))
    {
      __break(1u);
      JUMPOUT(0x29334LL);
    }

    uint64_t v32 = sub_2986C(v7, v31 + 1);
    v38[0] = v32;
    unint64_t v33 = v32[2];
    if (v32[3] <= v33)
    {
      uint64_t v35 = v33 + 1;
      swift_retain(a2);
      sub_29984(v35);
      uint64_t v34 = v38[0];
    }

    else
    {
      uint64_t v34 = (uint64_t)v32;
      swift_retain(a2);
    }

    sub_2A1D0(a2, v34);
    uint64_t v36 = *v3;
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease(v36);
    *a1 = a2;
  }

  else
  {
    Hasher.init(_seed:)(v38, *(void *)(v6 + 40));
    uint64_t v13 = *(void *)(a2 + 24);
    uint64_t v14 = *(void *)(a2 + 32);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v14);
    String.hash(into:)(v38, v13, v14);
    swift_bridgeObjectRelease(v14);
    Hasher._combine(_:)(*(unsigned __int8 *)(a2 + 40));
    uint64_t v15 = sub_1C218(*(_BYTE *)(a2 + 41));
    uint64_t v17 = v16;
    String.hash(into:)(v38, v15, v16);
    swift_bridgeObjectRelease(v17);
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v6 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v20) & 1) != 0)
    {
      uint64_t v21 = ~v19;
      do
      {
        uint64_t v22 = *(void *)(*(void *)(v6 + 48) + 8 * v20);
        uint64_t v23 = *(void *)(v22 + 24);
        uint64_t v24 = *(void *)(v22 + 32);
        uint64_t v25 = *(void *)(a2 + 24);
        uint64_t v26 = *(void *)(a2 + 32);
        BOOL v27 = v23 == v25 && v24 == v26;
        if ((v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 0LL) & 1) != 0)
          && *(unsigned __int8 *)(v22 + 40) == *(unsigned __int8 *)(a2 + 40))
        {
          __asm { BR              X10 }
        }

        unint64_t v20 = (v20 + 1) & v21;
      }

      while (((*(void *)(v6 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v20) & 1) != 0);
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v38[0] = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    uint64_t v29 = swift_retain(a2);
    sub_2A2BC(v29, v20, isUniquelyReferenced_nonNull_native);
    uint64_t v30 = *v3;
    *uint64_t v3 = v38[0];
    swift_bridgeObjectRelease(v30);
    *a1 = a2;
  }

  return 1LL;
}

uint64_t sub_293A4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2A894(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *uint64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_29550(void *a1, void *a2, void *a3)
{
  uint64_t v6 = *v3;
  Hasher.init(_seed:)(v60, *(void *)(*v3 + 40));
  swift_bridgeObjectRetain(v6);
  sub_23788((uint64_t)v60, (uint64_t)a2, (uint64_t)a3);
  Swift::Int v7 = Hasher._finalize()();
  uint64_t v8 = -1LL << *(_BYTE *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  uint64_t v10 = v6 + 56;
  uint64_t v55 = v6;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) == 0)
  {
LABEL_53:
    swift_bridgeObjectRelease(v55);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v56);
    v60[0] = *v56;
    *unint64_t v56 = 0x8000000000000000LL;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_2AA2C((uint64_t)a2, a3, v9, isUniquelyReferenced_nonNull_native);
    uint64_t v54 = *v56;
    *unint64_t v56 = v60[0];
    swift_bridgeObjectRelease(v54);
    *a1 = a2;
    a1[1] = a3;
    return 1LL;
  }

  uint64_t v58 = ~v8;
  uint64_t v11 = a2[2];
  uint64_t v12 = *(void *)(v6 + 48);
  while (1)
  {
    uint64_t v13 = (void *)(v12 + 16 * v9);
    BOOL v14 = (void *)*v13;
    if (*(void *)(*v13 + 16LL) != v11) {
      goto LABEL_3;
    }
    uint64_t v15 = (void *)v13[1];
    if (v11 && v14 != a2)
    {
      uint64_t v16 = v14[4];
      uint64_t v17 = v14[5];
      uint64_t v18 = a2[4];
      uint64_t v19 = a2[5];
      BOOL v20 = v16 == v18 && v17 == v19;
      if (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v18, v19, 0LL) & 1) == 0) {
        goto LABEL_3;
      }
      if (v11 != 1)
      {
        uint64_t result = v14[6];
        uint64_t v22 = v14[7];
        uint64_t v23 = a2[6];
        uint64_t v24 = a2[7];
        if (result != v23 || v22 != v24)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v22, v23, v24, 0LL);
          if ((result & 1) == 0) {
            goto LABEL_3;
          }
        }

        if (v11 != 2) {
          break;
        }
      }
    }

LABEL_19:
    uint64_t v26 = v15[2];
    if (v26 == a3[2])
    {
      if (v26) {
        BOOL v27 = v15 == a3;
      }
      else {
        BOOL v27 = 1;
      }
      if (v27)
      {
LABEL_54:
        swift_bridgeObjectRelease(a2);
        swift_bridgeObjectRelease(v55);
        swift_bridgeObjectRelease(a3);
        *(_OWORD *)os_log_type_t v59 = *(_OWORD *)(*(void *)(*v56 + 48LL) + 16 * v9);
        *(_OWORD *)a1 = *(_OWORD *)v59;
        swift_bridgeObjectRetain(v59[0]);
        swift_bridgeObjectRetain(v59[1]);
        return 0LL;
      }

      uint64_t v28 = v15[4];
      uint64_t v29 = v15[5];
      uint64_t v30 = a3[4];
      uint64_t v31 = a3[5];
      BOOL v32 = v28 == v30 && v29 == v31;
      if (v32 || (_stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v30, v31, 0LL) & 1) != 0)
      {
        if (v26 == 1) {
          goto LABEL_54;
        }
        uint64_t v33 = v15[6];
        uint64_t v34 = v15[7];
        uint64_t v35 = a3[6];
        uint64_t v36 = a3[7];
        BOOL v37 = v33 == v35 && v34 == v36;
        if (v37 || (_stringCompareWithSmolCheck(_:_:expecting:)(v33, v34, v35, v36, 0LL) & 1) != 0)
        {
          uint64_t v38 = v26 - 2;
          if (!v38) {
            goto LABEL_54;
          }
          uint64_t v39 = v15 + 9;
          uint64_t v40 = a3 + 9;
          while (1)
          {
            uint64_t v41 = *(v39 - 1);
            uint64_t v42 = *v39;
            uint64_t v43 = *(v40 - 1);
            uint64_t v44 = *v40;
            BOOL v45 = v41 == v43 && v42 == v44;
            if (!v45 && (_stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, v43, v44, 0LL) & 1) == 0) {
              break;
            }
            v39 += 2;
            v40 += 2;
            if (!--v38) {
              goto LABEL_54;
            }
          }
        }
      }
    }

LABEL_3:
    unint64_t v9 = (v9 + 1) & v58;
    if (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) == 0) {
      goto LABEL_53;
    }
  }

  uint64_t v46 = v14 + 9;
  uint64_t v48 = a2 + 9;
  uint64_t v47 = v11 - 2;
  while (v47)
  {
    uint64_t result = *(v46 - 1);
    uint64_t v49 = *v46;
    uint64_t v50 = *(v48 - 1);
    uint64_t v51 = *v48;
    if (result != v50 || v49 != v51)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v49, v50, v51, 0LL);
      if ((result & 1) == 0) {
        goto LABEL_3;
      }
    }

    v46 += 2;
    v48 += 2;
    if (!--v47) {
      goto LABEL_19;
    }
  }

  __break(1u);
  return result;
}

void *sub_2986C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_5BC0(&qword_3A220);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v14 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = ((uint64_t (*)(void))__CocoaSet.Iterator.next())();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = type metadata accessor for PatternItem();
      do
      {
        uint64_t v12 = v7;
        swift_dynamicCast(&v13, &v12, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v14;
        unint64_t v10 = *(void *)(v14 + 16);
        if (*(void *)(v14 + 24) <= v10)
        {
          sub_29984(v10 + 1);
          uint64_t v4 = v14;
        }

        unint64_t v9 = sub_2A1D0(v13, v4);
        uint64_t v7 = __CocoaSet.Iterator.next()(v9);
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return &_swiftEmptySetSingleton;
  }

  return (void *)v4;
}

unint64_t sub_29984(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5BC0(&qword_3A220);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  if (*(void *)(v3 + 16))
  {
    uint64_t v6 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v7 = (void *)(v3 + 56);
    uint64_t v8 = -1LL;
    if (v6 < 64) {
      uint64_t v8 = ~(-1LL << v6);
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v6 + 63) >> 6;
    unint64_t result = swift_retain(v3);
    int64_t v12 = 0LL;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v12 << 6);
      }

      else
      {
        int64_t v15 = v12 + 1;
        if (__OFADD__(v12, 1LL))
        {
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }

        if (v15 >= v10) {
          goto LABEL_25;
        }
        unint64_t v16 = v7[v15];
        ++v12;
        if (!v16)
        {
          int64_t v12 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_25;
          }
          unint64_t v16 = v7[v12];
          if (!v16)
          {
            int64_t v12 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_25;
            }
            unint64_t v16 = v7[v12];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_25:
                swift_release(v3);
                uint64_t v18 = 1LL << *(_BYTE *)(v3 + 32);
                if (v18 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v18 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v7 = -1LL << v18;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v16 = v7[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v12 = v17 + 1;
                  if (__OFADD__(v17, 1LL)) {
                    goto LABEL_31;
                  }
                  if (v12 >= v10) {
                    goto LABEL_25;
                  }
                  unint64_t v16 = v7[v12];
                  ++v17;
                  if (v16) {
                    goto LABEL_24;
                  }
                }
              }

              int64_t v12 = v17;
            }
          }
        }

Swift::Int sub_29B4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5BC0(&qword_3A1E8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    BOOL v32 = v2;
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
                  *uint64_t v33 = -1LL << v31;
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

Swift::Int sub_29E28(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5BC0(&qword_3AB10);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    BOOL v37 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    uint64_t v35 = v2;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v12 = 0LL;
    while (1)
    {
      if (v9)
      {
        unint64_t v14 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }

      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1LL))
        {
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
          return result;
        }

        if (v16 >= v36) {
          goto LABEL_44;
        }
        unint64_t v17 = v37[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v36) {
            goto LABEL_44;
          }
          unint64_t v17 = v37[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v36) {
              goto LABEL_44;
            }
            unint64_t v17 = v37[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v36)
              {
LABEL_44:
                swift_release(v3);
                uint64_t v2 = v35;
                uint64_t v34 = 1LL << *(_BYTE *)(v3 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *BOOL v37 = -1LL << v34;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v17 = v37[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1LL)) {
                    goto LABEL_50;
                  }
                  if (v12 >= v36) {
                    goto LABEL_44;
                  }
                  unint64_t v17 = v37[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v12 = v18;
            }
          }
        }

unint64_t sub_2A1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v11, v4, v5);
  swift_bridgeObjectRelease(v5);
  Hasher._combine(_:)(*(unsigned __int8 *)(a1 + 40));
  uint64_t v6 = sub_1C218(*(_BYTE *)(a1 + 41));
  uint64_t v8 = v7;
  String.hash(into:)(v11, v6, v7);
  swift_bridgeObjectRelease(v8);
  Swift::Int v9 = Hasher._finalize()();
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v9 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_2A2BC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 <= v7 || (a3 & 1) == 0)
  {
    uint64_t v9 = v7 + 1;
    if ((a3 & 1) != 0)
    {
      sub_29984(v9);
    }

    else
    {
      if (v8 > v7)
      {
        unint64_t result = (uint64_t)sub_2AD18();
        goto LABEL_18;
      }

      sub_2B234(v9);
    }

    uint64_t v10 = *v3;
    Hasher.init(_seed:)(v27, *(void *)(*v3 + 40));
    uint64_t v11 = *(void *)(v6 + 24);
    uint64_t v12 = *(void *)(v6 + 32);
    swift_bridgeObjectRetain(v12);
    String.hash(into:)(v27, v11, v12);
    swift_bridgeObjectRelease(v12);
    Hasher._combine(_:)(*(unsigned __int8 *)(v6 + 40));
    uint64_t v13 = sub_1C218(*(_BYTE *)(v6 + 41));
    uint64_t v15 = v14;
    String.hash(into:)(v27, v13, v14);
    swift_bridgeObjectRelease(v15);
    unint64_t result = Hasher._finalize()();
    uint64_t v16 = -1LL << *(_BYTE *)(v10 + 32);
    a2 = result & ~v16;
    if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
    {
      uint64_t v17 = ~v16;
      type metadata accessor for PatternItem();
      do
      {
        uint64_t v18 = *(void *)(*(void *)(v10 + 48) + 8 * a2);
        unint64_t result = *(void *)(v18 + 24);
        uint64_t v19 = *(void *)(v18 + 32);
        uint64_t v20 = *(void *)(v6 + 24);
        uint64_t v21 = *(void *)(v6 + 32);
        BOOL v22 = result == v20 && v19 == v21;
        if (v22
          || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v19, v20, v21, 0LL), (result & 1) != 0))
        {
          if (*(unsigned __int8 *)(v18 + 40) == *(unsigned __int8 *)(v6 + 40)) {
            __asm { BR              X10 }
          }
        }

        a2 = (a2 + 1) & v17;
      }

      while (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
    }
  }

uint64_t sub_2A894(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_29B4C(v11);
  }

  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_2AEC0();
      goto LABEL_22;
    }

    sub_2B3C4(v11);
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
    uint64_t v16 = (void *)(v15 + 16 * a3);
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

uint64_t sub_2AA2C(uint64_t result, void *a2, unint64_t a3, char a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  os_log_type_t v62 = (void *)result;
  if (v9 <= v8 || (a4 & 1) == 0)
  {
    uint64_t v10 = v8 + 1;
    if ((a4 & 1) != 0)
    {
      sub_29E28(v10);
    }

    else
    {
      if (v9 > v8)
      {
        unint64_t result = (uint64_t)sub_2B070();
        goto LABEL_60;
      }

      sub_2B670(v10);
    }

    uint64_t v11 = *v4;
    Hasher.init(_seed:)(v63, *(void *)(*v4 + 40));
    sub_23788((uint64_t)v63, v7, (uint64_t)a2);
    unint64_t result = Hasher._finalize()();
    uint64_t v12 = -1LL << *(_BYTE *)(v11 + 32);
    a3 = result & ~v12;
    uint64_t v13 = v11 + 56;
    if (((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
    {
      uint64_t v14 = ~v12;
      uint64_t v15 = *(void *)(v7 + 16);
      uint64_t v16 = *(void *)(v11 + 48);
      uint64_t v60 = (uint64_t *)(v7 + 72);
      do
      {
        uint64_t v17 = (void *)(v16 + 16 * a3);
        BOOL v18 = (void *)*v17;
        if (*(void *)(*v17 + 16LL) == v15)
        {
          uint64_t v19 = (void *)v17[1];
          if (v15 && v18 != v62)
          {
            unint64_t result = v18[4];
            uint64_t v20 = v18[5];
            uint64_t v21 = v62[4];
            uint64_t v22 = v62[5];
            if (result != v21 || v20 != v22)
            {
              unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v20, v21, v22, 0LL);
              if ((result & 1) == 0) {
                goto LABEL_10;
              }
            }

            if (v15 != 1)
            {
              unint64_t result = v18[6];
              uint64_t v24 = v18[7];
              uint64_t v25 = v62[6];
              uint64_t v26 = v62[7];
              if (result != v25 || v24 != v26)
              {
                unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v24, v25, v26, 0LL);
                if ((result & 1) == 0) {
                  goto LABEL_10;
                }
              }

              if (v15 != 2)
              {
                uint64_t v48 = v18 + 9;
                uint64_t v50 = v60;
                uint64_t v49 = v15 - 2;
                while (v49)
                {
                  unint64_t result = *(v48 - 1);
                  uint64_t v51 = *v48;
                  uint64_t v52 = *(v50 - 1);
                  uint64_t v53 = *v50;
                  if (result != v52 || v51 != v53)
                  {
                    unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v51, v52, v53, 0LL);
                    if ((result & 1) == 0) {
                      goto LABEL_10;
                    }
                  }

                  v48 += 2;
                  v50 += 2;
                  if (!--v49) {
                    goto LABEL_26;
                  }
                }

                __break(1u);
                goto LABEL_63;
              }
            }
          }

void *sub_2AD18()
{
  uint64_t v1 = v0;
  sub_5BC0(&qword_3A220);
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

LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    unint64_t result = (void *)swift_retain(v17);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v20 + 1;
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

    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    int64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  uint64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  uint64_t v21 = *(void *)(v6 + 8 * v22);
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
    uint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }

    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v20 = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = v20;
    swift_bridgeObjectRetain(v20);
    unint64_t result = (void *)swift_bridgeObjectRetain(*((void *)&v20 + 1));
  }

  unint64_t v19 = v17 + 3;
  if (v19 >= v13) {
    goto LABEL_28;
  }
  int64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    int64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_27;
    }
  }

void *sub_2AEC0()
{
  uint64_t v1 = v0;
  sub_5BC0(&qword_3A1E8);
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

void *sub_2B070()
{
  uint64_t v1 = v0;
  sub_5BC0(&qword_3AB10);
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

    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v13) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

unint64_t sub_2B234(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5BC0(&qword_3A220);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = swift_release(v3);
    *uint64_t v2 = v5;
    return result;
  }

  uint64_t v6 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v7 = v3 + 56;
  uint64_t v8 = -1LL;
  if (v6 < 64) {
    uint64_t v8 = ~(-1LL << v6);
  }
  unint64_t v9 = v8 & *(void *)(v3 + 56);
  int64_t v10 = (unint64_t)(v6 + 63) >> 6;
  unint64_t result = swift_retain(v3);
  int64_t v12 = 0LL;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_9;
    }

    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v16 >= v10) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v7 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v10) {
        goto LABEL_25;
      }
      unint64_t v17 = *(void *)(v7 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v10) {
          goto LABEL_25;
        }
        unint64_t v17 = *(void *)(v7 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }

Swift::Int sub_2B3C4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5BC0(&qword_3A1E8);
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

Swift::Int sub_2B670(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_5BC0(&qword_3AB10);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_47:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v37 = v2;
  uint64_t v38 = v3 + 56;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(v3 + 56);
  int64_t v39 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v12 = 0LL;
  while (1)
  {
    if (v9)
    {
      unint64_t v14 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_27;
    }

    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }

    if (v16 >= v39) {
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v38 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v39) {
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v38 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v39) {
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v38 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }

LABEL_49:
  __break(1u);
  return result;
}

void *sub_2BA20(void *a1)
{
  return sub_203CC(0LL, a1[2], 0, a1);
}

void *sub_2BA34(void *a1)
{
  return sub_204E8(0LL, a1[2], 0, a1);
}

uint64_t sub_2BA48(unint64_t a1)
{
  return sub_20834(0, *(void *)(a1 + 16), 0, a1);
}

void (*sub_2BA5C(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  void v6[4] = (uint64_t)sub_2BADC(v6, a2, a3);
  return sub_2BAB0;
}

void sub_2BAB0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t *sub_2BADC(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > a2)
  {
    uint64_t v4 = swift_retain(*(void *)(a3 + 8 * a2 + 32));
LABEL_5:
    *uint64_t v3 = v4;
    return (uint64_t *)sub_2BB48;
  }

  __break(1u);
  return result;
}

uint64_t sub_2BB48(void *a1)
{
  return swift_release(*a1);
}

uint64_t sub_2BB50(uint64_t result, uint64_t a2)
{
  unint64_t v3 = 0LL;
  unint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = result + 32;
LABEL_2:
  if (v3 <= v4) {
    unint64_t v6 = v4;
  }
  else {
    unint64_t v6 = v3;
  }
  while (1)
  {
    if (v4 == v3) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v6 == v3) {
      break;
    }
    uint64_t v7 = *(void *)(v5 + 8 * v3++);
    if (v7 < *(void *)(a2 + 16))
    {
      Swift::Int result = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage);
      if ((result & 1) == 0) {
        Swift::Int result = sub_27868(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
      }
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        Swift::Int result = sub_27868(v8 > 1, v9 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v9 + 1;
      _swiftEmptyArrayStorage[v9 + 4] = v7;
      goto LABEL_2;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_2BC48(uint64_t result, uint64_t a2)
{
  uint64_t v55 = (void *)result;
  uint64_t v2 = *(void *)result;
  unint64_t v3 = *(void *)(*(void *)result + 16LL);
  if (v3)
  {
    Swift::Int result = swift_isUniquelyReferenced_nonNull_native(v2);
    if ((result & 1) == 0) {
      goto LABEL_87;
    }
LABEL_3:
    unint64_t v4 = 0LL;
    unint64_t v57 = v3;
    BOOL v58 = (void *)(v2 + 32);
    uint64_t v5 = a2;
    uint64_t v62 = a2 + 32;
    unint64_t v56 = (void *)v2;
    while (1)
    {
      if (v4 == v3) {
        goto LABEL_84;
      }
      if (v4 >= *(void *)(v2 + 16))
      {
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        Swift::Int result = (uint64_t)sub_2BA20((void *)v2);
        uint64_t v2 = result;
        goto LABEL_3;
      }

      unint64_t v6 = (void *)v58[5 * v4 + 2];
      if (!v6) {
        goto LABEL_4;
      }
      uint64_t v60 = &v58[5 * v4];
      unint64_t v61 = v4;
      uint64_t v2 = *(void *)(v5 + 16);
      if (!v2)
      {
        unint64_t v9 = _swiftEmptyArrayStorage;
        int64_t v17 = _swiftEmptyArrayStorage[2];
        if (v17) {
          goto LABEL_27;
        }
LABEL_33:
        swift_release(v9);
        int64_t v18 = _swiftEmptyArrayStorage;
        goto LABEL_34;
      }

      uint64_t v7 = v6[2];
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRetain(v5);
      unint64_t v8 = 0LL;
      unint64_t v9 = _swiftEmptyArrayStorage;
      do
      {
        if (!v7) {
          goto LABEL_13;
        }
        uint64_t v13 = *(void *)(v62 + 8LL * (void)v8);
        if ((void *)v6[4] == v8) {
          goto LABEL_16;
        }
        if (v7 == 1) {
          goto LABEL_13;
        }
        if ((void *)v6[5] == v8)
        {
LABEL_16:
          swift_bridgeObjectRetain(*(void *)(v62 + 8LL * (void)v8));
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
          v67[0] = v9;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_279A0(0, v9[2] + 1LL, 1);
            unint64_t v9 = (void *)v67[0];
          }

          unint64_t v11 = v9[2];
          unint64_t v10 = v9[3];
          unint64_t v3 = v11 + 1;
          if (v11 >= v10 >> 1)
          {
            sub_279A0(v10 > 1, v11 + 1, 1);
            unint64_t v9 = (void *)v67[0];
          }

          v9[2] = v3;
          int64_t v12 = &v9[2 * v11];
          v12[4] = v8;
          v12[5] = v13;
        }

        else if (v7 != 2)
        {
          uint64_t v15 = 6LL;
          while (1)
          {
            uint64_t v16 = v15 - 3;
            if (__OFADD__(v15 - 4, 1LL)) {
              break;
            }
            if ((void *)v6[v15] == v8) {
              goto LABEL_16;
            }
            ++v15;
            if (v16 == v7) {
              goto LABEL_13;
            }
          }

          __break(1u);
LABEL_83:
          __break(1u);
LABEL_84:
          __break(1u);
          goto LABEL_85;
        }

void sub_2C2C4()
{
}

uint64_t sub_2C2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5BC0(&qword_3AAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_2C328()
{
  unint64_t result = qword_3AAF8;
  if (!qword_3AAF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_2EA70, &type metadata for EntityPair);
    atomic_store(result, (unint64_t *)&qword_3AAF8);
  }

  return result;
}

uint64_t sub_2C36C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_2C3B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_2C3F0()
{
  uint64_t v1 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_2C48C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PrivateLearningPluginRunContext(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  unint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc(dword_3A9D4);
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_196D0;
  return sub_23E18(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_2C548(uint64_t a1)
{
  uint64_t v2 = sub_5BC0(&qword_3A9C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_2C588()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_2C5AC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_3AB4C);
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_196D0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_3AB48 + dword_3AB48))(a1, v4);
}

uint64_t destroy for EntityPair(void *a1)
{
  return swift_bridgeObjectRelease(a1[1]);
}

uint64_t *_s42SiriPrivateLearningPatternExtractionPlugin10EntityPairVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t *assignWithCopy for EntityPair(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for EntityPair(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for EntityPair(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityPair(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EntityPair(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EntityPair()
{
  return &type metadata for EntityPair;
}

unint64_t sub_2C7B8()
{
  unint64_t result = qword_3AB60;
  if (!qword_3AB60)
  {
    unint64_t result = swift_getWitnessTable(&unk_2EA48, &type metadata for EntityPair);
    atomic_store(result, (unint64_t *)&qword_3AB60);
  }

  return result;
}